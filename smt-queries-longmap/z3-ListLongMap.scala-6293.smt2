; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80418 () Bool)

(assert start!80418)

(declare-fun b!944714 () Bool)

(declare-fun b_free!18079 () Bool)

(declare-fun b_next!18079 () Bool)

(assert (=> b!944714 (= b_free!18079 (not b_next!18079))))

(declare-fun tp!62748 () Bool)

(declare-fun b_and!29471 () Bool)

(assert (=> b!944714 (= tp!62748 b_and!29471)))

(declare-fun tp_is_empty!20587 () Bool)

(declare-fun e!531261 () Bool)

(declare-datatypes ((V!32415 0))(
  ( (V!32416 (val!10344 Int)) )
))
(declare-datatypes ((ValueCell!9812 0))(
  ( (ValueCellFull!9812 (v!12875 V!32415)) (EmptyCell!9812) )
))
(declare-datatypes ((array!57107 0))(
  ( (array!57108 (arr!27479 (Array (_ BitVec 32) ValueCell!9812)) (size!27947 (_ BitVec 32))) )
))
(declare-datatypes ((array!57109 0))(
  ( (array!57110 (arr!27480 (Array (_ BitVec 32) (_ BitVec 64))) (size!27948 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4774 0))(
  ( (LongMapFixedSize!4775 (defaultEntry!5682 Int) (mask!27335 (_ BitVec 32)) (extraKeys!5414 (_ BitVec 32)) (zeroValue!5518 V!32415) (minValue!5518 V!32415) (_size!2442 (_ BitVec 32)) (_keys!10555 array!57109) (_values!5705 array!57107) (_vacant!2442 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4774)

(declare-fun e!531259 () Bool)

(declare-fun array_inv!21404 (array!57109) Bool)

(declare-fun array_inv!21405 (array!57107) Bool)

(assert (=> b!944714 (= e!531259 (and tp!62748 tp_is_empty!20587 (array_inv!21404 (_keys!10555 thiss!1141)) (array_inv!21405 (_values!5705 thiss!1141)) e!531261))))

(declare-fun b!944715 () Bool)

(declare-fun res!634677 () Bool)

(declare-fun e!531263 () Bool)

(assert (=> b!944715 (=> (not res!634677) (not e!531263))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9076 0))(
  ( (MissingZero!9076 (index!38675 (_ BitVec 32))) (Found!9076 (index!38676 (_ BitVec 32))) (Intermediate!9076 (undefined!9888 Bool) (index!38677 (_ BitVec 32)) (x!81162 (_ BitVec 32))) (Undefined!9076) (MissingVacant!9076 (index!38678 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57109 (_ BitVec 32)) SeekEntryResult!9076)

(assert (=> b!944715 (= res!634677 (not ((_ is Found!9076) (seekEntry!0 key!756 (_keys!10555 thiss!1141) (mask!27335 thiss!1141)))))))

(declare-fun b!944716 () Bool)

(declare-fun e!531260 () Bool)

(assert (=> b!944716 (= e!531260 tp_is_empty!20587)))

(declare-fun res!634676 () Bool)

(assert (=> start!80418 (=> (not res!634676) (not e!531263))))

(declare-fun valid!1826 (LongMapFixedSize!4774) Bool)

(assert (=> start!80418 (= res!634676 (valid!1826 thiss!1141))))

(assert (=> start!80418 e!531263))

(assert (=> start!80418 e!531259))

(assert (=> start!80418 true))

(declare-fun mapIsEmpty!32706 () Bool)

(declare-fun mapRes!32706 () Bool)

(assert (=> mapIsEmpty!32706 mapRes!32706))

(declare-fun b!944717 () Bool)

(declare-datatypes ((Unit!31749 0))(
  ( (Unit!31750) )
))
(declare-fun e!531264 () Unit!31749)

(declare-fun Unit!31751 () Unit!31749)

(assert (=> b!944717 (= e!531264 Unit!31751)))

(declare-fun mapNonEmpty!32706 () Bool)

(declare-fun tp!62747 () Bool)

(declare-fun e!531262 () Bool)

(assert (=> mapNonEmpty!32706 (= mapRes!32706 (and tp!62747 e!531262))))

(declare-fun mapValue!32706 () ValueCell!9812)

(declare-fun mapKey!32706 () (_ BitVec 32))

(declare-fun mapRest!32706 () (Array (_ BitVec 32) ValueCell!9812))

(assert (=> mapNonEmpty!32706 (= (arr!27479 (_values!5705 thiss!1141)) (store mapRest!32706 mapKey!32706 mapValue!32706))))

(declare-fun b!944718 () Bool)

(assert (=> b!944718 (= e!531263 false)))

(declare-fun lt!425571 () Unit!31749)

(assert (=> b!944718 (= lt!425571 e!531264)))

(declare-fun c!98271 () Bool)

(declare-datatypes ((tuple2!13548 0))(
  ( (tuple2!13549 (_1!6785 (_ BitVec 64)) (_2!6785 V!32415)) )
))
(declare-datatypes ((List!19289 0))(
  ( (Nil!19286) (Cons!19285 (h!20436 tuple2!13548) (t!27597 List!19289)) )
))
(declare-datatypes ((ListLongMap!12235 0))(
  ( (ListLongMap!12236 (toList!6133 List!19289)) )
))
(declare-fun contains!5148 (ListLongMap!12235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3296 (array!57109 array!57107 (_ BitVec 32) (_ BitVec 32) V!32415 V!32415 (_ BitVec 32) Int) ListLongMap!12235)

(assert (=> b!944718 (= c!98271 (contains!5148 (getCurrentListMap!3296 (_keys!10555 thiss!1141) (_values!5705 thiss!1141) (mask!27335 thiss!1141) (extraKeys!5414 thiss!1141) (zeroValue!5518 thiss!1141) (minValue!5518 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5682 thiss!1141)) key!756))))

(declare-fun b!944719 () Bool)

(declare-fun Unit!31752 () Unit!31749)

(assert (=> b!944719 (= e!531264 Unit!31752)))

(declare-fun lt!425572 () Unit!31749)

(declare-fun lemmaKeyInListMapIsInArray!303 (array!57109 array!57107 (_ BitVec 32) (_ BitVec 32) V!32415 V!32415 (_ BitVec 64) Int) Unit!31749)

(assert (=> b!944719 (= lt!425572 (lemmaKeyInListMapIsInArray!303 (_keys!10555 thiss!1141) (_values!5705 thiss!1141) (mask!27335 thiss!1141) (extraKeys!5414 thiss!1141) (zeroValue!5518 thiss!1141) (minValue!5518 thiss!1141) key!756 (defaultEntry!5682 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944719 (arrayContainsKey!0 (_keys!10555 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425568 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57109 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944719 (= lt!425568 (arrayScanForKey!0 (_keys!10555 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!425570 () Unit!31749)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31749)

(assert (=> b!944719 (= lt!425570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10555 thiss!1141) (mask!27335 thiss!1141) #b00000000000000000000000000000000 lt!425568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57109 (_ BitVec 32)) Bool)

(assert (=> b!944719 (arrayForallSeekEntryOrOpenFound!0 lt!425568 (_keys!10555 thiss!1141) (mask!27335 thiss!1141))))

(declare-fun lt!425569 () Unit!31749)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57109 (_ BitVec 32)) Unit!31749)

(assert (=> b!944719 (= lt!425569 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!425568 (_keys!10555 thiss!1141) (mask!27335 thiss!1141)))))

(assert (=> b!944719 false))

(declare-fun b!944720 () Bool)

(declare-fun res!634678 () Bool)

(assert (=> b!944720 (=> (not res!634678) (not e!531263))))

(assert (=> b!944720 (= res!634678 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944721 () Bool)

(assert (=> b!944721 (= e!531261 (and e!531260 mapRes!32706))))

(declare-fun condMapEmpty!32706 () Bool)

(declare-fun mapDefault!32706 () ValueCell!9812)

(assert (=> b!944721 (= condMapEmpty!32706 (= (arr!27479 (_values!5705 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9812)) mapDefault!32706)))))

(declare-fun b!944722 () Bool)

(assert (=> b!944722 (= e!531262 tp_is_empty!20587)))

(assert (= (and start!80418 res!634676) b!944720))

(assert (= (and b!944720 res!634678) b!944715))

(assert (= (and b!944715 res!634677) b!944718))

(assert (= (and b!944718 c!98271) b!944719))

(assert (= (and b!944718 (not c!98271)) b!944717))

(assert (= (and b!944721 condMapEmpty!32706) mapIsEmpty!32706))

(assert (= (and b!944721 (not condMapEmpty!32706)) mapNonEmpty!32706))

(assert (= (and mapNonEmpty!32706 ((_ is ValueCellFull!9812) mapValue!32706)) b!944722))

(assert (= (and b!944721 ((_ is ValueCellFull!9812) mapDefault!32706)) b!944716))

(assert (= b!944714 b!944721))

(assert (= start!80418 b!944714))

(declare-fun m!878143 () Bool)

(assert (=> b!944715 m!878143))

(declare-fun m!878145 () Bool)

(assert (=> b!944718 m!878145))

(assert (=> b!944718 m!878145))

(declare-fun m!878147 () Bool)

(assert (=> b!944718 m!878147))

(declare-fun m!878149 () Bool)

(assert (=> start!80418 m!878149))

(declare-fun m!878151 () Bool)

(assert (=> mapNonEmpty!32706 m!878151))

(declare-fun m!878153 () Bool)

(assert (=> b!944719 m!878153))

(declare-fun m!878155 () Bool)

(assert (=> b!944719 m!878155))

(declare-fun m!878157 () Bool)

(assert (=> b!944719 m!878157))

(declare-fun m!878159 () Bool)

(assert (=> b!944719 m!878159))

(declare-fun m!878161 () Bool)

(assert (=> b!944719 m!878161))

(declare-fun m!878163 () Bool)

(assert (=> b!944719 m!878163))

(declare-fun m!878165 () Bool)

(assert (=> b!944714 m!878165))

(declare-fun m!878167 () Bool)

(assert (=> b!944714 m!878167))

(check-sat (not b_next!18079) (not b!944718) (not b!944719) (not mapNonEmpty!32706) (not b!944714) (not b!944715) tp_is_empty!20587 b_and!29471 (not start!80418))
(check-sat b_and!29471 (not b_next!18079))
