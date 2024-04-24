; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15680 () Bool)

(assert start!15680)

(declare-fun b!156285 () Bool)

(declare-fun b_free!3343 () Bool)

(declare-fun b_next!3343 () Bool)

(assert (=> b!156285 (= b_free!3343 (not b_next!3343))))

(declare-fun tp!12553 () Bool)

(declare-fun b_and!9771 () Bool)

(assert (=> b!156285 (= tp!12553 b_and!9771)))

(declare-fun b!156284 () Bool)

(declare-fun e!102206 () Bool)

(declare-fun tp_is_empty!3145 () Bool)

(assert (=> b!156284 (= e!102206 tp_is_empty!3145)))

(declare-fun e!102203 () Bool)

(declare-fun e!102202 () Bool)

(declare-datatypes ((V!3841 0))(
  ( (V!3842 (val!1617 Int)) )
))
(declare-datatypes ((ValueCell!1229 0))(
  ( (ValueCellFull!1229 (v!3483 V!3841)) (EmptyCell!1229) )
))
(declare-datatypes ((array!5329 0))(
  ( (array!5330 (arr!2522 (Array (_ BitVec 32) (_ BitVec 64))) (size!2800 (_ BitVec 32))) )
))
(declare-datatypes ((array!5331 0))(
  ( (array!5332 (arr!2523 (Array (_ BitVec 32) ValueCell!1229)) (size!2801 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1366 0))(
  ( (LongMapFixedSize!1367 (defaultEntry!3125 Int) (mask!7572 (_ BitVec 32)) (extraKeys!2866 (_ BitVec 32)) (zeroValue!2968 V!3841) (minValue!2968 V!3841) (_size!732 (_ BitVec 32)) (_keys!4900 array!5329) (_values!3108 array!5331) (_vacant!732 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1366)

(declare-fun array_inv!1595 (array!5329) Bool)

(declare-fun array_inv!1596 (array!5331) Bool)

(assert (=> b!156285 (= e!102203 (and tp!12553 tp_is_empty!3145 (array_inv!1595 (_keys!4900 thiss!1248)) (array_inv!1596 (_values!3108 thiss!1248)) e!102202))))

(declare-fun b!156286 () Bool)

(declare-fun e!102205 () Bool)

(assert (=> b!156286 (= e!102205 tp_is_empty!3145)))

(declare-fun b!156287 () Bool)

(declare-fun e!102204 () Bool)

(assert (=> b!156287 (= e!102204 false)))

(declare-fun lt!81588 () Bool)

(declare-datatypes ((List!1834 0))(
  ( (Nil!1831) (Cons!1830 (h!2439 (_ BitVec 64)) (t!6628 List!1834)) )
))
(declare-fun arrayNoDuplicates!0 (array!5329 (_ BitVec 32) List!1834) Bool)

(assert (=> b!156287 (= lt!81588 (arrayNoDuplicates!0 (_keys!4900 thiss!1248) #b00000000000000000000000000000000 Nil!1831))))

(declare-fun b!156288 () Bool)

(declare-fun res!73828 () Bool)

(assert (=> b!156288 (=> (not res!73828) (not e!102204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5329 (_ BitVec 32)) Bool)

(assert (=> b!156288 (= res!73828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4900 thiss!1248) (mask!7572 thiss!1248)))))

(declare-fun mapNonEmpty!5360 () Bool)

(declare-fun mapRes!5360 () Bool)

(declare-fun tp!12554 () Bool)

(assert (=> mapNonEmpty!5360 (= mapRes!5360 (and tp!12554 e!102206))))

(declare-fun mapValue!5360 () ValueCell!1229)

(declare-fun mapRest!5360 () (Array (_ BitVec 32) ValueCell!1229))

(declare-fun mapKey!5360 () (_ BitVec 32))

(assert (=> mapNonEmpty!5360 (= (arr!2523 (_values!3108 thiss!1248)) (store mapRest!5360 mapKey!5360 mapValue!5360))))

(declare-fun mapIsEmpty!5360 () Bool)

(assert (=> mapIsEmpty!5360 mapRes!5360))

(declare-fun res!73824 () Bool)

(assert (=> start!15680 (=> (not res!73824) (not e!102204))))

(declare-fun valid!678 (LongMapFixedSize!1366) Bool)

(assert (=> start!15680 (= res!73824 (valid!678 thiss!1248))))

(assert (=> start!15680 e!102204))

(assert (=> start!15680 e!102203))

(assert (=> start!15680 true))

(declare-fun b!156289 () Bool)

(assert (=> b!156289 (= e!102202 (and e!102205 mapRes!5360))))

(declare-fun condMapEmpty!5360 () Bool)

(declare-fun mapDefault!5360 () ValueCell!1229)

(assert (=> b!156289 (= condMapEmpty!5360 (= (arr!2523 (_values!3108 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1229)) mapDefault!5360)))))

(declare-fun b!156290 () Bool)

(declare-fun res!73825 () Bool)

(assert (=> b!156290 (=> (not res!73825) (not e!102204))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156290 (= res!73825 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156291 () Bool)

(declare-fun res!73826 () Bool)

(assert (=> b!156291 (=> (not res!73826) (not e!102204))))

(assert (=> b!156291 (= res!73826 (and (= (size!2801 (_values!3108 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7572 thiss!1248))) (= (size!2800 (_keys!4900 thiss!1248)) (size!2801 (_values!3108 thiss!1248))) (bvsge (mask!7572 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2866 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2866 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2866 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156292 () Bool)

(declare-fun res!73827 () Bool)

(assert (=> b!156292 (=> (not res!73827) (not e!102204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156292 (= res!73827 (validMask!0 (mask!7572 thiss!1248)))))

(assert (= (and start!15680 res!73824) b!156290))

(assert (= (and b!156290 res!73825) b!156292))

(assert (= (and b!156292 res!73827) b!156291))

(assert (= (and b!156291 res!73826) b!156288))

(assert (= (and b!156288 res!73828) b!156287))

(assert (= (and b!156289 condMapEmpty!5360) mapIsEmpty!5360))

(assert (= (and b!156289 (not condMapEmpty!5360)) mapNonEmpty!5360))

(get-info :version)

(assert (= (and mapNonEmpty!5360 ((_ is ValueCellFull!1229) mapValue!5360)) b!156284))

(assert (= (and b!156289 ((_ is ValueCellFull!1229) mapDefault!5360)) b!156286))

(assert (= b!156285 b!156289))

(assert (= start!15680 b!156285))

(declare-fun m!190079 () Bool)

(assert (=> mapNonEmpty!5360 m!190079))

(declare-fun m!190081 () Bool)

(assert (=> start!15680 m!190081))

(declare-fun m!190083 () Bool)

(assert (=> b!156288 m!190083))

(declare-fun m!190085 () Bool)

(assert (=> b!156292 m!190085))

(declare-fun m!190087 () Bool)

(assert (=> b!156287 m!190087))

(declare-fun m!190089 () Bool)

(assert (=> b!156285 m!190089))

(declare-fun m!190091 () Bool)

(assert (=> b!156285 m!190091))

(check-sat (not b_next!3343) tp_is_empty!3145 (not b!156285) b_and!9771 (not b!156292) (not b!156287) (not mapNonEmpty!5360) (not start!15680) (not b!156288))
(check-sat b_and!9771 (not b_next!3343))
