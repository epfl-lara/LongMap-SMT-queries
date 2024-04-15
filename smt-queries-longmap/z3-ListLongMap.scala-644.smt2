; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16216 () Bool)

(assert start!16216)

(declare-fun b!161569 () Bool)

(declare-fun b_free!3673 () Bool)

(declare-fun b_next!3673 () Bool)

(assert (=> b!161569 (= b_free!3673 (not b_next!3673))))

(declare-fun tp!13588 () Bool)

(declare-fun b_and!10061 () Bool)

(assert (=> b!161569 (= tp!13588 b_and!10061)))

(declare-fun b!161567 () Bool)

(declare-fun res!76524 () Bool)

(declare-fun e!105647 () Bool)

(assert (=> b!161567 (=> (not res!76524) (not e!105647))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161567 (= res!76524 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161568 () Bool)

(declare-fun e!105652 () Bool)

(declare-fun e!105648 () Bool)

(declare-fun mapRes!5900 () Bool)

(assert (=> b!161568 (= e!105652 (and e!105648 mapRes!5900))))

(declare-fun condMapEmpty!5900 () Bool)

(declare-datatypes ((V!4281 0))(
  ( (V!4282 (val!1782 Int)) )
))
(declare-datatypes ((ValueCell!1394 0))(
  ( (ValueCellFull!1394 (v!3641 V!4281)) (EmptyCell!1394) )
))
(declare-datatypes ((array!6009 0))(
  ( (array!6010 (arr!2848 (Array (_ BitVec 32) (_ BitVec 64))) (size!3133 (_ BitVec 32))) )
))
(declare-datatypes ((array!6011 0))(
  ( (array!6012 (arr!2849 (Array (_ BitVec 32) ValueCell!1394)) (size!3134 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1696 0))(
  ( (LongMapFixedSize!1697 (defaultEntry!3290 Int) (mask!7889 (_ BitVec 32)) (extraKeys!3031 (_ BitVec 32)) (zeroValue!3133 V!4281) (minValue!3133 V!4281) (_size!897 (_ BitVec 32)) (_keys!5090 array!6009) (_values!3273 array!6011) (_vacant!897 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1696)

(declare-fun mapDefault!5900 () ValueCell!1394)

(assert (=> b!161568 (= condMapEmpty!5900 (= (arr!2849 (_values!3273 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1394)) mapDefault!5900)))))

(declare-fun mapIsEmpty!5900 () Bool)

(assert (=> mapIsEmpty!5900 mapRes!5900))

(declare-fun res!76523 () Bool)

(assert (=> start!16216 (=> (not res!76523) (not e!105647))))

(declare-fun valid!775 (LongMapFixedSize!1696) Bool)

(assert (=> start!16216 (= res!76523 (valid!775 thiss!1248))))

(assert (=> start!16216 e!105647))

(declare-fun e!105651 () Bool)

(assert (=> start!16216 e!105651))

(assert (=> start!16216 true))

(declare-fun mapNonEmpty!5900 () Bool)

(declare-fun tp!13589 () Bool)

(declare-fun e!105649 () Bool)

(assert (=> mapNonEmpty!5900 (= mapRes!5900 (and tp!13589 e!105649))))

(declare-fun mapValue!5900 () ValueCell!1394)

(declare-fun mapRest!5900 () (Array (_ BitVec 32) ValueCell!1394))

(declare-fun mapKey!5900 () (_ BitVec 32))

(assert (=> mapNonEmpty!5900 (= (arr!2849 (_values!3273 thiss!1248)) (store mapRest!5900 mapKey!5900 mapValue!5900))))

(declare-fun tp_is_empty!3475 () Bool)

(declare-fun array_inv!1841 (array!6009) Bool)

(declare-fun array_inv!1842 (array!6011) Bool)

(assert (=> b!161569 (= e!105651 (and tp!13588 tp_is_empty!3475 (array_inv!1841 (_keys!5090 thiss!1248)) (array_inv!1842 (_values!3273 thiss!1248)) e!105652))))

(declare-fun b!161570 () Bool)

(assert (=> b!161570 (= e!105649 tp_is_empty!3475)))

(declare-fun b!161571 () Bool)

(declare-datatypes ((SeekEntryResult!366 0))(
  ( (MissingZero!366 (index!3632 (_ BitVec 32))) (Found!366 (index!3633 (_ BitVec 32))) (Intermediate!366 (undefined!1178 Bool) (index!3634 (_ BitVec 32)) (x!17861 (_ BitVec 32))) (Undefined!366) (MissingVacant!366 (index!3635 (_ BitVec 32))) )
))
(declare-fun lt!82086 () SeekEntryResult!366)

(get-info :version)

(assert (=> b!161571 (= e!105647 (and (not ((_ is Undefined!366) lt!82086)) ((_ is MissingVacant!366) lt!82086) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6009 (_ BitVec 32)) SeekEntryResult!366)

(assert (=> b!161571 (= lt!82086 (seekEntryOrOpen!0 key!828 (_keys!5090 thiss!1248) (mask!7889 thiss!1248)))))

(declare-fun b!161572 () Bool)

(assert (=> b!161572 (= e!105648 tp_is_empty!3475)))

(assert (= (and start!16216 res!76523) b!161567))

(assert (= (and b!161567 res!76524) b!161571))

(assert (= (and b!161568 condMapEmpty!5900) mapIsEmpty!5900))

(assert (= (and b!161568 (not condMapEmpty!5900)) mapNonEmpty!5900))

(assert (= (and mapNonEmpty!5900 ((_ is ValueCellFull!1394) mapValue!5900)) b!161570))

(assert (= (and b!161568 ((_ is ValueCellFull!1394) mapDefault!5900)) b!161572))

(assert (= b!161569 b!161568))

(assert (= start!16216 b!161569))

(declare-fun m!192487 () Bool)

(assert (=> start!16216 m!192487))

(declare-fun m!192489 () Bool)

(assert (=> mapNonEmpty!5900 m!192489))

(declare-fun m!192491 () Bool)

(assert (=> b!161569 m!192491))

(declare-fun m!192493 () Bool)

(assert (=> b!161569 m!192493))

(declare-fun m!192495 () Bool)

(assert (=> b!161571 m!192495))

(check-sat (not b_next!3673) b_and!10061 (not b!161569) (not mapNonEmpty!5900) (not b!161571) tp_is_empty!3475 (not start!16216))
(check-sat b_and!10061 (not b_next!3673))
