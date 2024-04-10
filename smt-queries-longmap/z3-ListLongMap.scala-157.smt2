; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3014 () Bool)

(assert start!3014)

(declare-fun b!17752 () Bool)

(declare-fun b_free!621 () Bool)

(declare-fun b_next!621 () Bool)

(assert (=> b!17752 (= b_free!621 (not b_next!621))))

(declare-fun tp!3054 () Bool)

(declare-fun b_and!1269 () Bool)

(assert (=> b!17752 (= tp!3054 b_and!1269)))

(declare-fun b!17748 () Bool)

(declare-datatypes ((V!1005 0))(
  ( (V!1006 (val!469 Int)) )
))
(declare-datatypes ((ValueCell!243 0))(
  ( (ValueCellFull!243 (v!1442 V!1005)) (EmptyCell!243) )
))
(declare-datatypes ((array!975 0))(
  ( (array!976 (arr!469 (Array (_ BitVec 32) ValueCell!243)) (size!559 (_ BitVec 32))) )
))
(declare-datatypes ((array!977 0))(
  ( (array!978 (arr!470 (Array (_ BitVec 32) (_ BitVec 64))) (size!560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!72 0))(
  ( (LongMapFixedSize!73 (defaultEntry!1647 Int) (mask!4570 (_ BitVec 32)) (extraKeys!1560 (_ BitVec 32)) (zeroValue!1583 V!1005) (minValue!1583 V!1005) (_size!68 (_ BitVec 32)) (_keys!3072 array!977) (_values!1644 array!975) (_vacant!68 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!72 0))(
  ( (Cell!73 (v!1443 LongMapFixedSize!72)) )
))
(declare-datatypes ((LongMap!72 0))(
  ( (LongMap!73 (underlying!47 Cell!72)) )
))
(declare-datatypes ((tuple2!764 0))(
  ( (tuple2!765 (_1!383 Bool) (_2!383 LongMap!72)) )
))
(declare-fun e!11236 () tuple2!764)

(declare-fun thiss!848 () LongMap!72)

(assert (=> b!17748 (= e!11236 (tuple2!765 true thiss!848))))

(declare-fun b!17749 () Bool)

(declare-fun repack!13 (LongMap!72) tuple2!764)

(assert (=> b!17749 (= e!11236 (repack!13 thiss!848))))

(declare-fun b!17750 () Bool)

(declare-fun e!11234 () Bool)

(declare-fun tp_is_empty!885 () Bool)

(assert (=> b!17750 (= e!11234 tp_is_empty!885)))

(declare-fun b!17751 () Bool)

(declare-fun e!11229 () Bool)

(assert (=> b!17751 (= e!11229 false)))

(declare-fun lt!4606 () Bool)

(declare-fun lt!4605 () tuple2!764)

(declare-fun valid!36 (LongMap!72) Bool)

(assert (=> b!17751 (= lt!4606 (valid!36 (_2!383 lt!4605)))))

(declare-fun mapNonEmpty!762 () Bool)

(declare-fun mapRes!762 () Bool)

(declare-fun tp!3053 () Bool)

(assert (=> mapNonEmpty!762 (= mapRes!762 (and tp!3053 e!11234))))

(declare-fun mapValue!762 () ValueCell!243)

(declare-fun mapKey!762 () (_ BitVec 32))

(declare-fun mapRest!762 () (Array (_ BitVec 32) ValueCell!243))

(assert (=> mapNonEmpty!762 (= (arr!469 (_values!1644 (v!1443 (underlying!47 thiss!848)))) (store mapRest!762 mapKey!762 mapValue!762))))

(declare-fun e!11230 () Bool)

(declare-fun e!11233 () Bool)

(declare-fun array_inv!325 (array!977) Bool)

(declare-fun array_inv!326 (array!975) Bool)

(assert (=> b!17752 (= e!11233 (and tp!3054 tp_is_empty!885 (array_inv!325 (_keys!3072 (v!1443 (underlying!47 thiss!848)))) (array_inv!326 (_values!1644 (v!1443 (underlying!47 thiss!848)))) e!11230))))

(declare-fun b!17753 () Bool)

(declare-fun e!11228 () Bool)

(assert (=> b!17753 (= e!11228 e!11229)))

(declare-fun res!12657 () Bool)

(assert (=> b!17753 (=> (not res!12657) (not e!11229))))

(assert (=> b!17753 (= res!12657 (not (_1!383 lt!4605)))))

(assert (=> b!17753 (= lt!4605 e!11236)))

(declare-fun c!1780 () Bool)

(declare-fun imbalanced!18 (LongMap!72) Bool)

(assert (=> b!17753 (= c!1780 (imbalanced!18 thiss!848))))

(declare-fun res!12658 () Bool)

(assert (=> start!3014 (=> (not res!12658) (not e!11228))))

(assert (=> start!3014 (= res!12658 (valid!36 thiss!848))))

(assert (=> start!3014 e!11228))

(declare-fun e!11227 () Bool)

(assert (=> start!3014 e!11227))

(declare-fun b!17754 () Bool)

(declare-fun e!11232 () Bool)

(assert (=> b!17754 (= e!11232 e!11233)))

(declare-fun mapIsEmpty!762 () Bool)

(assert (=> mapIsEmpty!762 mapRes!762))

(declare-fun b!17755 () Bool)

(declare-fun e!11235 () Bool)

(assert (=> b!17755 (= e!11230 (and e!11235 mapRes!762))))

(declare-fun condMapEmpty!762 () Bool)

(declare-fun mapDefault!762 () ValueCell!243)

(assert (=> b!17755 (= condMapEmpty!762 (= (arr!469 (_values!1644 (v!1443 (underlying!47 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!243)) mapDefault!762)))))

(declare-fun b!17756 () Bool)

(assert (=> b!17756 (= e!11235 tp_is_empty!885)))

(declare-fun b!17757 () Bool)

(assert (=> b!17757 (= e!11227 e!11232)))

(assert (= (and start!3014 res!12658) b!17753))

(assert (= (and b!17753 c!1780) b!17749))

(assert (= (and b!17753 (not c!1780)) b!17748))

(assert (= (and b!17753 res!12657) b!17751))

(assert (= (and b!17755 condMapEmpty!762) mapIsEmpty!762))

(assert (= (and b!17755 (not condMapEmpty!762)) mapNonEmpty!762))

(get-info :version)

(assert (= (and mapNonEmpty!762 ((_ is ValueCellFull!243) mapValue!762)) b!17750))

(assert (= (and b!17755 ((_ is ValueCellFull!243) mapDefault!762)) b!17756))

(assert (= b!17752 b!17755))

(assert (= b!17754 b!17752))

(assert (= b!17757 b!17754))

(assert (= start!3014 b!17757))

(declare-fun m!12443 () Bool)

(assert (=> mapNonEmpty!762 m!12443))

(declare-fun m!12445 () Bool)

(assert (=> start!3014 m!12445))

(declare-fun m!12447 () Bool)

(assert (=> b!17751 m!12447))

(declare-fun m!12449 () Bool)

(assert (=> b!17749 m!12449))

(declare-fun m!12451 () Bool)

(assert (=> b!17752 m!12451))

(declare-fun m!12453 () Bool)

(assert (=> b!17752 m!12453))

(declare-fun m!12455 () Bool)

(assert (=> b!17753 m!12455))

(check-sat (not b!17749) (not b!17753) (not mapNonEmpty!762) (not start!3014) (not b_next!621) (not b!17751) tp_is_empty!885 b_and!1269 (not b!17752))
(check-sat b_and!1269 (not b_next!621))
