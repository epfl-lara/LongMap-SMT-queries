; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3008 () Bool)

(assert start!3008)

(declare-fun b!17750 () Bool)

(declare-fun b_free!625 () Bool)

(declare-fun b_next!625 () Bool)

(assert (=> b!17750 (= b_free!625 (not b_next!625))))

(declare-fun tp!3066 () Bool)

(declare-fun b_and!1267 () Bool)

(assert (=> b!17750 (= tp!3066 b_and!1267)))

(declare-fun b!17748 () Bool)

(declare-fun e!11246 () Bool)

(declare-fun e!11245 () Bool)

(assert (=> b!17748 (= e!11246 e!11245)))

(declare-fun b!17749 () Bool)

(declare-fun e!11249 () Bool)

(assert (=> b!17749 (= e!11245 e!11249)))

(declare-fun e!11243 () Bool)

(declare-fun tp_is_empty!889 () Bool)

(declare-datatypes ((V!1011 0))(
  ( (V!1012 (val!471 Int)) )
))
(declare-datatypes ((ValueCell!245 0))(
  ( (ValueCellFull!245 (v!1445 V!1011)) (EmptyCell!245) )
))
(declare-datatypes ((array!965 0))(
  ( (array!966 (arr!464 (Array (_ BitVec 32) ValueCell!245)) (size!554 (_ BitVec 32))) )
))
(declare-datatypes ((array!967 0))(
  ( (array!968 (arr!465 (Array (_ BitVec 32) (_ BitVec 64))) (size!555 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!76 0))(
  ( (LongMapFixedSize!77 (defaultEntry!1649 Int) (mask!4574 (_ BitVec 32)) (extraKeys!1562 (_ BitVec 32)) (zeroValue!1585 V!1011) (minValue!1585 V!1011) (_size!70 (_ BitVec 32)) (_keys!3074 array!967) (_values!1646 array!965) (_vacant!70 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!76 0))(
  ( (Cell!77 (v!1446 LongMapFixedSize!76)) )
))
(declare-datatypes ((LongMap!76 0))(
  ( (LongMap!77 (underlying!49 Cell!76)) )
))
(declare-fun thiss!848 () LongMap!76)

(declare-fun array_inv!333 (array!967) Bool)

(declare-fun array_inv!334 (array!965) Bool)

(assert (=> b!17750 (= e!11249 (and tp!3066 tp_is_empty!889 (array_inv!333 (_keys!3074 (v!1446 (underlying!49 thiss!848)))) (array_inv!334 (_values!1646 (v!1446 (underlying!49 thiss!848)))) e!11243))))

(declare-fun b!17752 () Bool)

(declare-fun e!11248 () Bool)

(assert (=> b!17752 (= e!11248 tp_is_empty!889)))

(declare-fun b!17753 () Bool)

(declare-datatypes ((tuple2!766 0))(
  ( (tuple2!767 (_1!384 Bool) (_2!384 LongMap!76)) )
))
(declare-fun e!11247 () tuple2!766)

(declare-fun repack!16 (LongMap!76) tuple2!766)

(assert (=> b!17753 (= e!11247 (repack!16 thiss!848))))

(declare-fun b!17754 () Bool)

(assert (=> b!17754 (= e!11247 (tuple2!767 true thiss!848))))

(declare-fun mapIsEmpty!768 () Bool)

(declare-fun mapRes!768 () Bool)

(assert (=> mapIsEmpty!768 mapRes!768))

(declare-fun b!17755 () Bool)

(declare-fun e!11244 () Bool)

(declare-fun e!11241 () Bool)

(assert (=> b!17755 (= e!11244 e!11241)))

(declare-fun res!12637 () Bool)

(assert (=> b!17755 (=> (not res!12637) (not e!11241))))

(declare-fun lt!4613 () tuple2!766)

(assert (=> b!17755 (= res!12637 (not (_1!384 lt!4613)))))

(assert (=> b!17755 (= lt!4613 e!11247)))

(declare-fun c!1772 () Bool)

(declare-fun imbalanced!17 (LongMap!76) Bool)

(assert (=> b!17755 (= c!1772 (imbalanced!17 thiss!848))))

(declare-fun b!17756 () Bool)

(assert (=> b!17756 (= e!11243 (and e!11248 mapRes!768))))

(declare-fun condMapEmpty!768 () Bool)

(declare-fun mapDefault!768 () ValueCell!245)

(assert (=> b!17756 (= condMapEmpty!768 (= (arr!464 (_values!1646 (v!1446 (underlying!49 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!245)) mapDefault!768)))))

(declare-fun mapNonEmpty!768 () Bool)

(declare-fun tp!3065 () Bool)

(declare-fun e!11250 () Bool)

(assert (=> mapNonEmpty!768 (= mapRes!768 (and tp!3065 e!11250))))

(declare-fun mapValue!768 () ValueCell!245)

(declare-fun mapRest!768 () (Array (_ BitVec 32) ValueCell!245))

(declare-fun mapKey!768 () (_ BitVec 32))

(assert (=> mapNonEmpty!768 (= (arr!464 (_values!1646 (v!1446 (underlying!49 thiss!848)))) (store mapRest!768 mapKey!768 mapValue!768))))

(declare-fun b!17757 () Bool)

(assert (=> b!17757 (= e!11250 tp_is_empty!889)))

(declare-fun res!12638 () Bool)

(assert (=> start!3008 (=> (not res!12638) (not e!11244))))

(declare-fun valid!44 (LongMap!76) Bool)

(assert (=> start!3008 (= res!12638 (valid!44 thiss!848))))

(assert (=> start!3008 e!11244))

(assert (=> start!3008 e!11246))

(declare-fun b!17751 () Bool)

(assert (=> b!17751 (= e!11241 false)))

(declare-fun lt!4614 () Bool)

(assert (=> b!17751 (= lt!4614 (valid!44 (_2!384 lt!4613)))))

(assert (= (and start!3008 res!12638) b!17755))

(assert (= (and b!17755 c!1772) b!17753))

(assert (= (and b!17755 (not c!1772)) b!17754))

(assert (= (and b!17755 res!12637) b!17751))

(assert (= (and b!17756 condMapEmpty!768) mapIsEmpty!768))

(assert (= (and b!17756 (not condMapEmpty!768)) mapNonEmpty!768))

(get-info :version)

(assert (= (and mapNonEmpty!768 ((_ is ValueCellFull!245) mapValue!768)) b!17757))

(assert (= (and b!17756 ((_ is ValueCellFull!245) mapDefault!768)) b!17752))

(assert (= b!17750 b!17756))

(assert (= b!17749 b!17750))

(assert (= b!17748 b!17749))

(assert (= start!3008 b!17748))

(declare-fun m!12409 () Bool)

(assert (=> mapNonEmpty!768 m!12409))

(declare-fun m!12411 () Bool)

(assert (=> b!17755 m!12411))

(declare-fun m!12413 () Bool)

(assert (=> b!17750 m!12413))

(declare-fun m!12415 () Bool)

(assert (=> b!17750 m!12415))

(declare-fun m!12417 () Bool)

(assert (=> b!17753 m!12417))

(declare-fun m!12419 () Bool)

(assert (=> start!3008 m!12419))

(declare-fun m!12421 () Bool)

(assert (=> b!17751 m!12421))

(check-sat b_and!1267 (not b!17751) (not b_next!625) (not mapNonEmpty!768) (not b!17753) (not b!17755) (not start!3008) tp_is_empty!889 (not b!17750))
(check-sat b_and!1267 (not b_next!625))
