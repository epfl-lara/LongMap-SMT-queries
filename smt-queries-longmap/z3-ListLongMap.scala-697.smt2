; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16690 () Bool)

(assert start!16690)

(declare-fun b!166998 () Bool)

(declare-fun b_free!3991 () Bool)

(declare-fun b_next!3991 () Bool)

(assert (=> b!166998 (= b_free!3991 (not b_next!3991))))

(declare-fun tp!14573 () Bool)

(declare-fun b_and!10379 () Bool)

(assert (=> b!166998 (= tp!14573 b_and!10379)))

(declare-fun b!166989 () Bool)

(declare-fun res!79387 () Bool)

(declare-fun e!109629 () Bool)

(assert (=> b!166989 (=> (not res!79387) (not e!109629))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166989 (= res!79387 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166990 () Bool)

(declare-fun res!79386 () Bool)

(declare-fun e!109633 () Bool)

(assert (=> b!166990 (=> (not res!79386) (not e!109633))))

(declare-datatypes ((V!4705 0))(
  ( (V!4706 (val!1941 Int)) )
))
(declare-datatypes ((ValueCell!1553 0))(
  ( (ValueCellFull!1553 (v!3800 V!4705)) (EmptyCell!1553) )
))
(declare-datatypes ((array!6663 0))(
  ( (array!6664 (arr!3166 (Array (_ BitVec 32) (_ BitVec 64))) (size!3455 (_ BitVec 32))) )
))
(declare-datatypes ((array!6665 0))(
  ( (array!6666 (arr!3167 (Array (_ BitVec 32) ValueCell!1553)) (size!3456 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2014 0))(
  ( (LongMapFixedSize!2015 (defaultEntry!3449 Int) (mask!8191 (_ BitVec 32)) (extraKeys!3190 (_ BitVec 32)) (zeroValue!3292 V!4705) (minValue!3292 V!4705) (_size!1056 (_ BitVec 32)) (_keys!5273 array!6663) (_values!3432 array!6665) (_vacant!1056 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2014)

(assert (=> b!166990 (= res!79386 (and (= (size!3456 (_values!3432 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8191 thiss!1248))) (= (size!3455 (_keys!5273 thiss!1248)) (size!3456 (_values!3432 thiss!1248))) (bvsge (mask!8191 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3190 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3190 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166991 () Bool)

(assert (=> b!166991 (= e!109633 false)))

(declare-fun lt!83397 () Bool)

(declare-datatypes ((List!2119 0))(
  ( (Nil!2116) (Cons!2115 (h!2732 (_ BitVec 64)) (t!6912 List!2119)) )
))
(declare-fun arrayNoDuplicates!0 (array!6663 (_ BitVec 32) List!2119) Bool)

(assert (=> b!166991 (= lt!83397 (arrayNoDuplicates!0 (_keys!5273 thiss!1248) #b00000000000000000000000000000000 Nil!2116))))

(declare-fun b!166992 () Bool)

(declare-fun e!109637 () Bool)

(assert (=> b!166992 (= e!109637 e!109633)))

(declare-fun res!79383 () Bool)

(assert (=> b!166992 (=> (not res!79383) (not e!109633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166992 (= res!79383 (validMask!0 (mask!8191 thiss!1248)))))

(declare-datatypes ((Unit!5075 0))(
  ( (Unit!5076) )
))
(declare-fun lt!83396 () Unit!5075)

(declare-fun e!109632 () Unit!5075)

(assert (=> b!166992 (= lt!83396 e!109632)))

(declare-fun c!30242 () Bool)

(declare-datatypes ((tuple2!3114 0))(
  ( (tuple2!3115 (_1!1568 (_ BitVec 64)) (_2!1568 V!4705)) )
))
(declare-datatypes ((List!2120 0))(
  ( (Nil!2117) (Cons!2116 (h!2733 tuple2!3114) (t!6913 List!2120)) )
))
(declare-datatypes ((ListLongMap!2057 0))(
  ( (ListLongMap!2058 (toList!1044 List!2120)) )
))
(declare-fun contains!1089 (ListLongMap!2057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!686 (array!6663 array!6665 (_ BitVec 32) (_ BitVec 32) V!4705 V!4705 (_ BitVec 32) Int) ListLongMap!2057)

(assert (=> b!166992 (= c!30242 (contains!1089 (getCurrentListMap!686 (_keys!5273 thiss!1248) (_values!3432 thiss!1248) (mask!8191 thiss!1248) (extraKeys!3190 thiss!1248) (zeroValue!3292 thiss!1248) (minValue!3292 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3449 thiss!1248)) key!828))))

(declare-fun b!166993 () Bool)

(declare-fun e!109634 () Bool)

(declare-fun tp_is_empty!3793 () Bool)

(assert (=> b!166993 (= e!109634 tp_is_empty!3793)))

(declare-fun b!166994 () Bool)

(assert (=> b!166994 (= e!109629 e!109637)))

(declare-fun res!79381 () Bool)

(assert (=> b!166994 (=> (not res!79381) (not e!109637))))

(declare-datatypes ((SeekEntryResult!480 0))(
  ( (MissingZero!480 (index!4088 (_ BitVec 32))) (Found!480 (index!4089 (_ BitVec 32))) (Intermediate!480 (undefined!1292 Bool) (index!4090 (_ BitVec 32)) (x!18507 (_ BitVec 32))) (Undefined!480) (MissingVacant!480 (index!4091 (_ BitVec 32))) )
))
(declare-fun lt!83393 () SeekEntryResult!480)

(get-info :version)

(assert (=> b!166994 (= res!79381 (and (not ((_ is Undefined!480) lt!83393)) (not ((_ is MissingVacant!480) lt!83393)) (not ((_ is MissingZero!480) lt!83393)) ((_ is Found!480) lt!83393)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6663 (_ BitVec 32)) SeekEntryResult!480)

(assert (=> b!166994 (= lt!83393 (seekEntryOrOpen!0 key!828 (_keys!5273 thiss!1248) (mask!8191 thiss!1248)))))

(declare-fun mapIsEmpty!6408 () Bool)

(declare-fun mapRes!6408 () Bool)

(assert (=> mapIsEmpty!6408 mapRes!6408))

(declare-fun b!166995 () Bool)

(declare-fun e!109636 () Bool)

(assert (=> b!166995 (= e!109636 (and e!109634 mapRes!6408))))

(declare-fun condMapEmpty!6408 () Bool)

(declare-fun mapDefault!6408 () ValueCell!1553)

(assert (=> b!166995 (= condMapEmpty!6408 (= (arr!3167 (_values!3432 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1553)) mapDefault!6408)))))

(declare-fun res!79385 () Bool)

(assert (=> start!16690 (=> (not res!79385) (not e!109629))))

(declare-fun valid!888 (LongMapFixedSize!2014) Bool)

(assert (=> start!16690 (= res!79385 (valid!888 thiss!1248))))

(assert (=> start!16690 e!109629))

(declare-fun e!109631 () Bool)

(assert (=> start!16690 e!109631))

(assert (=> start!16690 true))

(declare-fun e!109630 () Bool)

(declare-fun b!166996 () Bool)

(assert (=> b!166996 (= e!109630 (= (select (arr!3166 (_keys!5273 thiss!1248)) (index!4089 lt!83393)) key!828))))

(declare-fun b!166997 () Bool)

(declare-fun res!79382 () Bool)

(assert (=> b!166997 (=> (not res!79382) (not e!109633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6663 (_ BitVec 32)) Bool)

(assert (=> b!166997 (= res!79382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5273 thiss!1248) (mask!8191 thiss!1248)))))

(declare-fun mapNonEmpty!6408 () Bool)

(declare-fun tp!14574 () Bool)

(declare-fun e!109638 () Bool)

(assert (=> mapNonEmpty!6408 (= mapRes!6408 (and tp!14574 e!109638))))

(declare-fun mapKey!6408 () (_ BitVec 32))

(declare-fun mapRest!6408 () (Array (_ BitVec 32) ValueCell!1553))

(declare-fun mapValue!6408 () ValueCell!1553)

(assert (=> mapNonEmpty!6408 (= (arr!3167 (_values!3432 thiss!1248)) (store mapRest!6408 mapKey!6408 mapValue!6408))))

(declare-fun array_inv!2039 (array!6663) Bool)

(declare-fun array_inv!2040 (array!6665) Bool)

(assert (=> b!166998 (= e!109631 (and tp!14573 tp_is_empty!3793 (array_inv!2039 (_keys!5273 thiss!1248)) (array_inv!2040 (_values!3432 thiss!1248)) e!109636))))

(declare-fun b!166999 () Bool)

(assert (=> b!166999 (= e!109638 tp_is_empty!3793)))

(declare-fun b!167000 () Bool)

(declare-fun lt!83395 () Unit!5075)

(assert (=> b!167000 (= e!109632 lt!83395)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!95 (array!6663 array!6665 (_ BitVec 32) (_ BitVec 32) V!4705 V!4705 (_ BitVec 64) Int) Unit!5075)

(assert (=> b!167000 (= lt!83395 (lemmaInListMapThenSeekEntryOrOpenFindsIt!95 (_keys!5273 thiss!1248) (_values!3432 thiss!1248) (mask!8191 thiss!1248) (extraKeys!3190 thiss!1248) (zeroValue!3292 thiss!1248) (minValue!3292 thiss!1248) key!828 (defaultEntry!3449 thiss!1248)))))

(declare-fun res!79384 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167000 (= res!79384 (inRange!0 (index!4089 lt!83393) (mask!8191 thiss!1248)))))

(assert (=> b!167000 (=> (not res!79384) (not e!109630))))

(assert (=> b!167000 e!109630))

(declare-fun b!167001 () Bool)

(declare-fun Unit!5077 () Unit!5075)

(assert (=> b!167001 (= e!109632 Unit!5077)))

(declare-fun lt!83394 () Unit!5075)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!95 (array!6663 array!6665 (_ BitVec 32) (_ BitVec 32) V!4705 V!4705 (_ BitVec 64) Int) Unit!5075)

(assert (=> b!167001 (= lt!83394 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!95 (_keys!5273 thiss!1248) (_values!3432 thiss!1248) (mask!8191 thiss!1248) (extraKeys!3190 thiss!1248) (zeroValue!3292 thiss!1248) (minValue!3292 thiss!1248) key!828 (defaultEntry!3449 thiss!1248)))))

(assert (=> b!167001 false))

(assert (= (and start!16690 res!79385) b!166989))

(assert (= (and b!166989 res!79387) b!166994))

(assert (= (and b!166994 res!79381) b!166992))

(assert (= (and b!166992 c!30242) b!167000))

(assert (= (and b!166992 (not c!30242)) b!167001))

(assert (= (and b!167000 res!79384) b!166996))

(assert (= (and b!166992 res!79383) b!166990))

(assert (= (and b!166990 res!79386) b!166997))

(assert (= (and b!166997 res!79382) b!166991))

(assert (= (and b!166995 condMapEmpty!6408) mapIsEmpty!6408))

(assert (= (and b!166995 (not condMapEmpty!6408)) mapNonEmpty!6408))

(assert (= (and mapNonEmpty!6408 ((_ is ValueCellFull!1553) mapValue!6408)) b!166999))

(assert (= (and b!166995 ((_ is ValueCellFull!1553) mapDefault!6408)) b!166993))

(assert (= b!166998 b!166995))

(assert (= start!16690 b!166998))

(declare-fun m!195763 () Bool)

(assert (=> b!166994 m!195763))

(declare-fun m!195765 () Bool)

(assert (=> b!166998 m!195765))

(declare-fun m!195767 () Bool)

(assert (=> b!166998 m!195767))

(declare-fun m!195769 () Bool)

(assert (=> mapNonEmpty!6408 m!195769))

(declare-fun m!195771 () Bool)

(assert (=> b!166996 m!195771))

(declare-fun m!195773 () Bool)

(assert (=> b!167000 m!195773))

(declare-fun m!195775 () Bool)

(assert (=> b!167000 m!195775))

(declare-fun m!195777 () Bool)

(assert (=> b!166991 m!195777))

(declare-fun m!195779 () Bool)

(assert (=> b!166992 m!195779))

(declare-fun m!195781 () Bool)

(assert (=> b!166992 m!195781))

(assert (=> b!166992 m!195781))

(declare-fun m!195783 () Bool)

(assert (=> b!166992 m!195783))

(declare-fun m!195785 () Bool)

(assert (=> b!167001 m!195785))

(declare-fun m!195787 () Bool)

(assert (=> start!16690 m!195787))

(declare-fun m!195789 () Bool)

(assert (=> b!166997 m!195789))

(check-sat b_and!10379 (not b!167000) (not b!166991) (not b!166994) (not b!166992) (not b!167001) (not start!16690) (not b!166998) (not b_next!3991) (not mapNonEmpty!6408) tp_is_empty!3793 (not b!166997))
(check-sat b_and!10379 (not b_next!3991))
