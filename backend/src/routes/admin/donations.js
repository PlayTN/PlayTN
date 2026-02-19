import express from 'express';
import { authenticate } from '../../middleware/auth.js';
import { requireAdmin } from '../../middleware/admin.js';
import {
  getAllDonations,
  updateDonationStatus,
  contactDonator,
  attachDocument,
} from '../../controllers/donationAdminController.js';

const router = express.Router();

/**
 * IMPORTANTE: Ordine delle route
 * Le route specifiche devono essere definite PRIMA di quelle con parametri
 */

/**
 * GET /api/v1/admin/donations
 * Lista tutte le donazioni
 * Middleware: Admin (operatore o admin)
 */
router.get('/', authenticate, requireAdmin, getAllDonations);

/**
 * PUT /api/v1/admin/donations/:id/status
 * Modificare stato donazione
 * Autenticazione: Richiesta
 * Middleware: Admin (operatore o admin)
 */
router.put('/:id/status', authenticate, requireAdmin, updateDonationStatus);

/**
 * POST /api/v1/admin/donations/:id/contact
 * Contatto donatore
 * Autenticazione: Richiesta
 * Middleware: Admin (operatore o admin)
 */
router.post('/:id/contact', authenticate, requireAdmin, contactDonator);

/**
 * POST /api/v1/admin/donations/:id/attach-document
 * Allegare documentazione
 * Autenticazione: Richiesta
 * Middleware: Admin (operatore o admin)
 */
router.post('/:id/attach-document', authenticate, requireAdmin, attachDocument);

export default router;


