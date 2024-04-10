; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16694 () Bool)

(assert start!16694)

(declare-fun b!167292 () Bool)

(declare-fun b_free!3999 () Bool)

(declare-fun b_next!3999 () Bool)

(assert (=> b!167292 (= b_free!3999 (not b_next!3999))))

(declare-fun tp!14598 () Bool)

(declare-fun b_and!10413 () Bool)

(assert (=> b!167292 (= tp!14598 b_and!10413)))

(declare-fun e!109850 () Bool)

(declare-fun tp_is_empty!3801 () Bool)

(declare-fun e!109856 () Bool)

(declare-datatypes ((V!4715 0))(
  ( (V!4716 (val!1945 Int)) )
))
(declare-datatypes ((ValueCell!1557 0))(
  ( (ValueCellFull!1557 (v!3810 V!4715)) (EmptyCell!1557) )
))
(declare-datatypes ((array!6699 0))(
  ( (array!6700 (arr!3185 (Array (_ BitVec 32) (_ BitVec 64))) (size!3473 (_ BitVec 32))) )
))
(declare-datatypes ((array!6701 0))(
  ( (array!6702 (arr!3186 (Array (_ BitVec 32) ValueCell!1557)) (size!3474 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2022 0))(
  ( (LongMapFixedSize!2023 (defaultEntry!3453 Int) (mask!8198 (_ BitVec 32)) (extraKeys!3194 (_ BitVec 32)) (zeroValue!3296 V!4715) (minValue!3296 V!4715) (_size!1060 (_ BitVec 32)) (_keys!5278 array!6699) (_values!3436 array!6701) (_vacant!1060 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2022)

(declare-fun array_inv!2051 (array!6699) Bool)

(declare-fun array_inv!2052 (array!6701) Bool)

(assert (=> b!167292 (= e!109856 (and tp!14598 tp_is_empty!3801 (array_inv!2051 (_keys!5278 thiss!1248)) (array_inv!2052 (_values!3436 thiss!1248)) e!109850))))

(declare-fun b!167293 () Bool)

(declare-fun e!109857 () Bool)

(assert (=> b!167293 (= e!109857 tp_is_empty!3801)))

(declare-fun b!167294 () Bool)

(declare-fun e!109855 () Bool)

(assert (=> b!167294 (= e!109855 tp_is_empty!3801)))

(declare-fun b!167295 () Bool)

(declare-datatypes ((Unit!5117 0))(
  ( (Unit!5118) )
))
(declare-fun e!109851 () Unit!5117)

(declare-fun lt!83636 () Unit!5117)

(assert (=> b!167295 (= e!109851 lt!83636)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!103 (array!6699 array!6701 (_ BitVec 32) (_ BitVec 32) V!4715 V!4715 (_ BitVec 64) Int) Unit!5117)

(assert (=> b!167295 (= lt!83636 (lemmaInListMapThenSeekEntryOrOpenFindsIt!103 (_keys!5278 thiss!1248) (_values!3436 thiss!1248) (mask!8198 thiss!1248) (extraKeys!3194 thiss!1248) (zeroValue!3296 thiss!1248) (minValue!3296 thiss!1248) key!828 (defaultEntry!3453 thiss!1248)))))

(declare-fun res!79560 () Bool)

(declare-datatypes ((SeekEntryResult!476 0))(
  ( (MissingZero!476 (index!4072 (_ BitVec 32))) (Found!476 (index!4073 (_ BitVec 32))) (Intermediate!476 (undefined!1288 Bool) (index!4074 (_ BitVec 32)) (x!18512 (_ BitVec 32))) (Undefined!476) (MissingVacant!476 (index!4075 (_ BitVec 32))) )
))
(declare-fun lt!83638 () SeekEntryResult!476)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167295 (= res!79560 (inRange!0 (index!4073 lt!83638) (mask!8198 thiss!1248)))))

(declare-fun e!109853 () Bool)

(assert (=> b!167295 (=> (not res!79560) (not e!109853))))

(assert (=> b!167295 e!109853))

(declare-fun b!167296 () Bool)

(declare-fun e!109858 () Bool)

(assert (=> b!167296 (= e!109858 false)))

(declare-fun lt!83634 () Bool)

(declare-datatypes ((List!2123 0))(
  ( (Nil!2120) (Cons!2119 (h!2736 (_ BitVec 64)) (t!6925 List!2123)) )
))
(declare-fun arrayNoDuplicates!0 (array!6699 (_ BitVec 32) List!2123) Bool)

(assert (=> b!167296 (= lt!83634 (arrayNoDuplicates!0 (_keys!5278 thiss!1248) #b00000000000000000000000000000000 Nil!2120))))

(declare-fun b!167297 () Bool)

(declare-fun e!109859 () Bool)

(declare-fun e!109852 () Bool)

(assert (=> b!167297 (= e!109859 e!109852)))

(declare-fun res!79564 () Bool)

(assert (=> b!167297 (=> (not res!79564) (not e!109852))))

(get-info :version)

(assert (=> b!167297 (= res!79564 (and (not ((_ is Undefined!476) lt!83638)) (not ((_ is MissingVacant!476) lt!83638)) (not ((_ is MissingZero!476) lt!83638)) ((_ is Found!476) lt!83638)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6699 (_ BitVec 32)) SeekEntryResult!476)

(assert (=> b!167297 (= lt!83638 (seekEntryOrOpen!0 key!828 (_keys!5278 thiss!1248) (mask!8198 thiss!1248)))))

(declare-fun b!167298 () Bool)

(declare-fun Unit!5119 () Unit!5117)

(assert (=> b!167298 (= e!109851 Unit!5119)))

(declare-fun lt!83635 () Unit!5117)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!104 (array!6699 array!6701 (_ BitVec 32) (_ BitVec 32) V!4715 V!4715 (_ BitVec 64) Int) Unit!5117)

(assert (=> b!167298 (= lt!83635 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!104 (_keys!5278 thiss!1248) (_values!3436 thiss!1248) (mask!8198 thiss!1248) (extraKeys!3194 thiss!1248) (zeroValue!3296 thiss!1248) (minValue!3296 thiss!1248) key!828 (defaultEntry!3453 thiss!1248)))))

(assert (=> b!167298 false))

(declare-fun b!167299 () Bool)

(assert (=> b!167299 (= e!109852 e!109858)))

(declare-fun res!79562 () Bool)

(assert (=> b!167299 (=> (not res!79562) (not e!109858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167299 (= res!79562 (validMask!0 (mask!8198 thiss!1248)))))

(declare-fun lt!83637 () Unit!5117)

(assert (=> b!167299 (= lt!83637 e!109851)))

(declare-fun c!30280 () Bool)

(declare-datatypes ((tuple2!3136 0))(
  ( (tuple2!3137 (_1!1579 (_ BitVec 64)) (_2!1579 V!4715)) )
))
(declare-datatypes ((List!2124 0))(
  ( (Nil!2121) (Cons!2120 (h!2737 tuple2!3136) (t!6926 List!2124)) )
))
(declare-datatypes ((ListLongMap!2091 0))(
  ( (ListLongMap!2092 (toList!1061 List!2124)) )
))
(declare-fun contains!1103 (ListLongMap!2091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!719 (array!6699 array!6701 (_ BitVec 32) (_ BitVec 32) V!4715 V!4715 (_ BitVec 32) Int) ListLongMap!2091)

(assert (=> b!167299 (= c!30280 (contains!1103 (getCurrentListMap!719 (_keys!5278 thiss!1248) (_values!3436 thiss!1248) (mask!8198 thiss!1248) (extraKeys!3194 thiss!1248) (zeroValue!3296 thiss!1248) (minValue!3296 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3453 thiss!1248)) key!828))))

(declare-fun b!167301 () Bool)

(declare-fun res!79563 () Bool)

(assert (=> b!167301 (=> (not res!79563) (not e!109859))))

(assert (=> b!167301 (= res!79563 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6420 () Bool)

(declare-fun mapRes!6420 () Bool)

(declare-fun tp!14597 () Bool)

(assert (=> mapNonEmpty!6420 (= mapRes!6420 (and tp!14597 e!109855))))

(declare-fun mapKey!6420 () (_ BitVec 32))

(declare-fun mapRest!6420 () (Array (_ BitVec 32) ValueCell!1557))

(declare-fun mapValue!6420 () ValueCell!1557)

(assert (=> mapNonEmpty!6420 (= (arr!3186 (_values!3436 thiss!1248)) (store mapRest!6420 mapKey!6420 mapValue!6420))))

(declare-fun b!167302 () Bool)

(assert (=> b!167302 (= e!109853 (= (select (arr!3185 (_keys!5278 thiss!1248)) (index!4073 lt!83638)) key!828))))

(declare-fun res!79565 () Bool)

(assert (=> start!16694 (=> (not res!79565) (not e!109859))))

(declare-fun valid!884 (LongMapFixedSize!2022) Bool)

(assert (=> start!16694 (= res!79565 (valid!884 thiss!1248))))

(assert (=> start!16694 e!109859))

(assert (=> start!16694 e!109856))

(assert (=> start!16694 true))

(declare-fun b!167300 () Bool)

(assert (=> b!167300 (= e!109850 (and e!109857 mapRes!6420))))

(declare-fun condMapEmpty!6420 () Bool)

(declare-fun mapDefault!6420 () ValueCell!1557)

(assert (=> b!167300 (= condMapEmpty!6420 (= (arr!3186 (_values!3436 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1557)) mapDefault!6420)))))

(declare-fun b!167303 () Bool)

(declare-fun res!79566 () Bool)

(assert (=> b!167303 (=> (not res!79566) (not e!109858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6699 (_ BitVec 32)) Bool)

(assert (=> b!167303 (= res!79566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5278 thiss!1248) (mask!8198 thiss!1248)))))

(declare-fun mapIsEmpty!6420 () Bool)

(assert (=> mapIsEmpty!6420 mapRes!6420))

(declare-fun b!167304 () Bool)

(declare-fun res!79561 () Bool)

(assert (=> b!167304 (=> (not res!79561) (not e!109858))))

(assert (=> b!167304 (= res!79561 (and (= (size!3474 (_values!3436 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8198 thiss!1248))) (= (size!3473 (_keys!5278 thiss!1248)) (size!3474 (_values!3436 thiss!1248))) (bvsge (mask!8198 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3194 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3194 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16694 res!79565) b!167301))

(assert (= (and b!167301 res!79563) b!167297))

(assert (= (and b!167297 res!79564) b!167299))

(assert (= (and b!167299 c!30280) b!167295))

(assert (= (and b!167299 (not c!30280)) b!167298))

(assert (= (and b!167295 res!79560) b!167302))

(assert (= (and b!167299 res!79562) b!167304))

(assert (= (and b!167304 res!79561) b!167303))

(assert (= (and b!167303 res!79566) b!167296))

(assert (= (and b!167300 condMapEmpty!6420) mapIsEmpty!6420))

(assert (= (and b!167300 (not condMapEmpty!6420)) mapNonEmpty!6420))

(assert (= (and mapNonEmpty!6420 ((_ is ValueCellFull!1557) mapValue!6420)) b!167294))

(assert (= (and b!167300 ((_ is ValueCellFull!1557) mapDefault!6420)) b!167293))

(assert (= b!167292 b!167300))

(assert (= start!16694 b!167292))

(declare-fun m!196495 () Bool)

(assert (=> start!16694 m!196495))

(declare-fun m!196497 () Bool)

(assert (=> b!167299 m!196497))

(declare-fun m!196499 () Bool)

(assert (=> b!167299 m!196499))

(assert (=> b!167299 m!196499))

(declare-fun m!196501 () Bool)

(assert (=> b!167299 m!196501))

(declare-fun m!196503 () Bool)

(assert (=> b!167292 m!196503))

(declare-fun m!196505 () Bool)

(assert (=> b!167292 m!196505))

(declare-fun m!196507 () Bool)

(assert (=> b!167295 m!196507))

(declare-fun m!196509 () Bool)

(assert (=> b!167295 m!196509))

(declare-fun m!196511 () Bool)

(assert (=> b!167297 m!196511))

(declare-fun m!196513 () Bool)

(assert (=> b!167296 m!196513))

(declare-fun m!196515 () Bool)

(assert (=> b!167298 m!196515))

(declare-fun m!196517 () Bool)

(assert (=> b!167302 m!196517))

(declare-fun m!196519 () Bool)

(assert (=> b!167303 m!196519))

(declare-fun m!196521 () Bool)

(assert (=> mapNonEmpty!6420 m!196521))

(check-sat (not b!167297) (not start!16694) (not b!167296) (not b!167298) (not b!167292) (not b_next!3999) tp_is_empty!3801 (not b!167299) (not mapNonEmpty!6420) (not b!167303) b_and!10413 (not b!167295))
(check-sat b_and!10413 (not b_next!3999))
