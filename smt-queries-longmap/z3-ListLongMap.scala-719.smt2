; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16820 () Bool)

(assert start!16820)

(declare-fun b!169595 () Bool)

(declare-fun b_free!4151 () Bool)

(declare-fun b_next!4151 () Bool)

(assert (=> b!169595 (= b_free!4151 (not b_next!4151))))

(declare-fun tp!15057 () Bool)

(declare-fun b_and!10565 () Bool)

(assert (=> b!169595 (= tp!15057 b_and!10565)))

(declare-fun b!169590 () Bool)

(declare-fun b_free!4153 () Bool)

(declare-fun b_next!4153 () Bool)

(assert (=> b!169590 (= b_free!4153 (not b_next!4153))))

(declare-fun tp!15059 () Bool)

(declare-fun b_and!10567 () Bool)

(assert (=> b!169590 (= tp!15059 b_and!10567)))

(declare-fun mapNonEmpty!6650 () Bool)

(declare-fun mapRes!6651 () Bool)

(declare-fun tp!15060 () Bool)

(declare-fun e!111813 () Bool)

(assert (=> mapNonEmpty!6650 (= mapRes!6651 (and tp!15060 e!111813))))

(declare-fun mapKey!6650 () (_ BitVec 32))

(declare-datatypes ((V!4883 0))(
  ( (V!4884 (val!2008 Int)) )
))
(declare-datatypes ((ValueCell!1620 0))(
  ( (ValueCellFull!1620 (v!3873 V!4883)) (EmptyCell!1620) )
))
(declare-fun mapValue!6650 () ValueCell!1620)

(declare-fun mapRest!6650 () (Array (_ BitVec 32) ValueCell!1620))

(declare-datatypes ((array!6951 0))(
  ( (array!6952 (arr!3311 (Array (_ BitVec 32) (_ BitVec 64))) (size!3599 (_ BitVec 32))) )
))
(declare-datatypes ((array!6953 0))(
  ( (array!6954 (arr!3312 (Array (_ BitVec 32) ValueCell!1620)) (size!3600 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2148 0))(
  ( (LongMapFixedSize!2149 (defaultEntry!3516 Int) (mask!8303 (_ BitVec 32)) (extraKeys!3257 (_ BitVec 32)) (zeroValue!3359 V!4883) (minValue!3359 V!4883) (_size!1123 (_ BitVec 32)) (_keys!5341 array!6951) (_values!3499 array!6953) (_vacant!1123 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2148)

(assert (=> mapNonEmpty!6650 (= (arr!3312 (_values!3499 thiss!1248)) (store mapRest!6650 mapKey!6650 mapValue!6650))))

(declare-fun b!169586 () Bool)

(declare-fun e!111818 () Bool)

(declare-fun e!111823 () Bool)

(declare-fun mapRes!6650 () Bool)

(assert (=> b!169586 (= e!111818 (and e!111823 mapRes!6650))))

(declare-fun condMapEmpty!6650 () Bool)

(declare-datatypes ((tuple2!3228 0))(
  ( (tuple2!3229 (_1!1625 Bool) (_2!1625 LongMapFixedSize!2148)) )
))
(declare-fun err!91 () tuple2!3228)

(declare-fun mapDefault!6651 () ValueCell!1620)

(assert (=> b!169586 (= condMapEmpty!6650 (= (arr!3312 (_values!3499 (_2!1625 err!91))) ((as const (Array (_ BitVec 32) ValueCell!1620)) mapDefault!6651)))))

(declare-fun mapNonEmpty!6651 () Bool)

(declare-fun tp!15058 () Bool)

(declare-fun e!111815 () Bool)

(assert (=> mapNonEmpty!6651 (= mapRes!6650 (and tp!15058 e!111815))))

(declare-fun mapKey!6651 () (_ BitVec 32))

(declare-fun mapValue!6651 () ValueCell!1620)

(declare-fun mapRest!6651 () (Array (_ BitVec 32) ValueCell!1620))

(assert (=> mapNonEmpty!6651 (= (arr!3312 (_values!3499 (_2!1625 err!91))) (store mapRest!6651 mapKey!6651 mapValue!6651))))

(declare-fun b!169587 () Bool)

(declare-fun e!111822 () Bool)

(declare-fun e!111814 () Bool)

(assert (=> b!169587 (= e!111822 e!111814)))

(declare-fun res!80639 () Bool)

(assert (=> b!169587 (=> (not res!80639) (not e!111814))))

(declare-datatypes ((SeekEntryResult!526 0))(
  ( (MissingZero!526 (index!4272 (_ BitVec 32))) (Found!526 (index!4273 (_ BitVec 32))) (Intermediate!526 (undefined!1338 Bool) (index!4274 (_ BitVec 32)) (x!18730 (_ BitVec 32))) (Undefined!526) (MissingVacant!526 (index!4275 (_ BitVec 32))) )
))
(declare-fun lt!84943 () SeekEntryResult!526)

(get-info :version)

(assert (=> b!169587 (= res!80639 (and (not ((_ is Undefined!526) lt!84943)) (not ((_ is MissingVacant!526) lt!84943)) (not ((_ is MissingZero!526) lt!84943)) (not ((_ is Found!526) lt!84943))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6951 (_ BitVec 32)) SeekEntryResult!526)

(assert (=> b!169587 (= lt!84943 (seekEntryOrOpen!0 key!828 (_keys!5341 thiss!1248) (mask!8303 thiss!1248)))))

(declare-fun b!169588 () Bool)

(declare-fun res!80640 () Bool)

(assert (=> b!169588 (=> (not res!80640) (not e!111822))))

(assert (=> b!169588 (= res!80640 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169589 () Bool)

(declare-fun tp_is_empty!3927 () Bool)

(assert (=> b!169589 (= e!111823 tp_is_empty!3927)))

(declare-fun e!111820 () Bool)

(declare-fun e!111816 () Bool)

(declare-fun array_inv!2123 (array!6951) Bool)

(declare-fun array_inv!2124 (array!6953) Bool)

(assert (=> b!169590 (= e!111816 (and tp!15059 tp_is_empty!3927 (array_inv!2123 (_keys!5341 thiss!1248)) (array_inv!2124 (_values!3499 thiss!1248)) e!111820))))

(declare-fun mapIsEmpty!6650 () Bool)

(assert (=> mapIsEmpty!6650 mapRes!6650))

(declare-fun b!169591 () Bool)

(assert (=> b!169591 (= e!111813 tp_is_empty!3927)))

(declare-fun res!80638 () Bool)

(assert (=> start!16820 (=> (not res!80638) (not e!111822))))

(declare-fun valid!924 (LongMapFixedSize!2148) Bool)

(assert (=> start!16820 (= res!80638 (valid!924 thiss!1248))))

(assert (=> start!16820 e!111822))

(assert (=> start!16820 e!111816))

(assert (=> start!16820 true))

(declare-fun b!169592 () Bool)

(declare-fun e!111819 () Bool)

(assert (=> b!169592 (= e!111820 (and e!111819 mapRes!6651))))

(declare-fun condMapEmpty!6651 () Bool)

(declare-fun mapDefault!6650 () ValueCell!1620)

(assert (=> b!169592 (= condMapEmpty!6651 (= (arr!3312 (_values!3499 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1620)) mapDefault!6650)))))

(declare-fun b!169593 () Bool)

(assert (=> b!169593 (= e!111814 false)))

(declare-fun lt!84942 () Bool)

(assert (=> b!169593 (= lt!84942 (valid!924 (_2!1625 err!91)))))

(assert (=> b!169593 true))

(declare-fun e!111821 () Bool)

(assert (=> b!169593 e!111821))

(declare-fun mapIsEmpty!6651 () Bool)

(assert (=> mapIsEmpty!6651 mapRes!6651))

(declare-fun b!169594 () Bool)

(assert (=> b!169594 (= e!111819 tp_is_empty!3927)))

(assert (=> b!169595 (= e!111821 (and tp!15057 tp_is_empty!3927 (array_inv!2123 (_keys!5341 (_2!1625 err!91))) (array_inv!2124 (_values!3499 (_2!1625 err!91))) e!111818))))

(declare-fun b!169596 () Bool)

(assert (=> b!169596 (= e!111815 tp_is_empty!3927)))

(assert (= (and start!16820 res!80638) b!169588))

(assert (= (and b!169588 res!80640) b!169587))

(assert (= (and b!169587 res!80639) b!169593))

(assert (= (and b!169586 condMapEmpty!6650) mapIsEmpty!6650))

(assert (= (and b!169586 (not condMapEmpty!6650)) mapNonEmpty!6651))

(assert (= (and mapNonEmpty!6651 ((_ is ValueCellFull!1620) mapValue!6651)) b!169596))

(assert (= (and b!169586 ((_ is ValueCellFull!1620) mapDefault!6651)) b!169589))

(assert (= b!169595 b!169586))

(assert (= b!169593 b!169595))

(assert (= (and b!169592 condMapEmpty!6651) mapIsEmpty!6651))

(assert (= (and b!169592 (not condMapEmpty!6651)) mapNonEmpty!6650))

(assert (= (and mapNonEmpty!6650 ((_ is ValueCellFull!1620) mapValue!6650)) b!169591))

(assert (= (and b!169592 ((_ is ValueCellFull!1620) mapDefault!6650)) b!169594))

(assert (= b!169590 b!169592))

(assert (= start!16820 b!169590))

(declare-fun m!198537 () Bool)

(assert (=> b!169590 m!198537))

(declare-fun m!198539 () Bool)

(assert (=> b!169590 m!198539))

(declare-fun m!198541 () Bool)

(assert (=> b!169595 m!198541))

(declare-fun m!198543 () Bool)

(assert (=> b!169595 m!198543))

(declare-fun m!198545 () Bool)

(assert (=> b!169593 m!198545))

(declare-fun m!198547 () Bool)

(assert (=> start!16820 m!198547))

(declare-fun m!198549 () Bool)

(assert (=> b!169587 m!198549))

(declare-fun m!198551 () Bool)

(assert (=> mapNonEmpty!6651 m!198551))

(declare-fun m!198553 () Bool)

(assert (=> mapNonEmpty!6650 m!198553))

(check-sat (not start!16820) (not b!169590) (not b_next!4153) (not b!169587) (not mapNonEmpty!6650) b_and!10567 tp_is_empty!3927 b_and!10565 (not b!169593) (not mapNonEmpty!6651) (not b_next!4151) (not b!169595))
(check-sat b_and!10565 b_and!10567 (not b_next!4153) (not b_next!4151))
