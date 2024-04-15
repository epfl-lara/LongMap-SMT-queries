; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80020 () Bool)

(assert start!80020)

(declare-fun b!940836 () Bool)

(declare-fun b_free!17893 () Bool)

(declare-fun b_next!17893 () Bool)

(assert (=> b!940836 (= b_free!17893 (not b_next!17893))))

(declare-fun tp!62155 () Bool)

(declare-fun b_and!29279 () Bool)

(assert (=> b!940836 (= tp!62155 b_and!29279)))

(declare-fun b!940831 () Bool)

(declare-fun e!528859 () Bool)

(assert (=> b!940831 (= e!528859 (not true))))

(declare-datatypes ((V!32167 0))(
  ( (V!32168 (val!10251 Int)) )
))
(declare-datatypes ((ValueCell!9719 0))(
  ( (ValueCellFull!9719 (v!12781 V!32167)) (EmptyCell!9719) )
))
(declare-datatypes ((array!56715 0))(
  ( (array!56716 (arr!27293 (Array (_ BitVec 32) ValueCell!9719)) (size!27756 (_ BitVec 32))) )
))
(declare-datatypes ((array!56717 0))(
  ( (array!56718 (arr!27294 (Array (_ BitVec 32) (_ BitVec 64))) (size!27757 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4588 0))(
  ( (LongMapFixedSize!4589 (defaultEntry!5585 Int) (mask!27133 (_ BitVec 32)) (extraKeys!5317 (_ BitVec 32)) (zeroValue!5421 V!32167) (minValue!5421 V!32167) (_size!2349 (_ BitVec 32)) (_keys!10430 array!56717) (_values!5608 array!56715) (_vacant!2349 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4588)

(declare-datatypes ((SeekEntryResult!9015 0))(
  ( (MissingZero!9015 (index!38431 (_ BitVec 32))) (Found!9015 (index!38432 (_ BitVec 32))) (Intermediate!9015 (undefined!9827 Bool) (index!38433 (_ BitVec 32)) (x!80727 (_ BitVec 32))) (Undefined!9015) (MissingVacant!9015 (index!38434 (_ BitVec 32))) )
))
(declare-fun lt!424666 () SeekEntryResult!9015)

(declare-datatypes ((tuple2!13454 0))(
  ( (tuple2!13455 (_1!6738 (_ BitVec 64)) (_2!6738 V!32167)) )
))
(declare-datatypes ((List!19214 0))(
  ( (Nil!19211) (Cons!19210 (h!20356 tuple2!13454) (t!27520 List!19214)) )
))
(declare-datatypes ((ListLongMap!12141 0))(
  ( (ListLongMap!12142 (toList!6086 List!19214)) )
))
(declare-fun contains!5093 (ListLongMap!12141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3249 (array!56717 array!56715 (_ BitVec 32) (_ BitVec 32) V!32167 V!32167 (_ BitVec 32) Int) ListLongMap!12141)

(assert (=> b!940831 (contains!5093 (getCurrentListMap!3249 (_keys!10430 thiss!1141) (_values!5608 thiss!1141) (mask!27133 thiss!1141) (extraKeys!5317 thiss!1141) (zeroValue!5421 thiss!1141) (minValue!5421 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5585 thiss!1141)) (select (arr!27294 (_keys!10430 thiss!1141)) (index!38432 lt!424666)))))

(declare-datatypes ((Unit!31683 0))(
  ( (Unit!31684) )
))
(declare-fun lt!424667 () Unit!31683)

(declare-fun lemmaValidKeyInArrayIsInListMap!265 (array!56717 array!56715 (_ BitVec 32) (_ BitVec 32) V!32167 V!32167 (_ BitVec 32) Int) Unit!31683)

(assert (=> b!940831 (= lt!424667 (lemmaValidKeyInArrayIsInListMap!265 (_keys!10430 thiss!1141) (_values!5608 thiss!1141) (mask!27133 thiss!1141) (extraKeys!5317 thiss!1141) (zeroValue!5421 thiss!1141) (minValue!5421 thiss!1141) (index!38432 lt!424666) (defaultEntry!5585 thiss!1141)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940831 (arrayContainsKey!0 (_keys!10430 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!424665 () Unit!31683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56717 (_ BitVec 64) (_ BitVec 32)) Unit!31683)

(assert (=> b!940831 (= lt!424665 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10430 thiss!1141) key!756 (index!38432 lt!424666)))))

(declare-fun b!940832 () Bool)

(declare-fun e!528860 () Bool)

(declare-fun tp_is_empty!20401 () Bool)

(assert (=> b!940832 (= e!528860 tp_is_empty!20401)))

(declare-fun b!940833 () Bool)

(declare-fun e!528858 () Bool)

(declare-fun mapRes!32392 () Bool)

(assert (=> b!940833 (= e!528858 (and e!528860 mapRes!32392))))

(declare-fun condMapEmpty!32392 () Bool)

(declare-fun mapDefault!32392 () ValueCell!9719)

(assert (=> b!940833 (= condMapEmpty!32392 (= (arr!27293 (_values!5608 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9719)) mapDefault!32392)))))

(declare-fun res!632617 () Bool)

(declare-fun e!528857 () Bool)

(assert (=> start!80020 (=> (not res!632617) (not e!528857))))

(declare-fun valid!1766 (LongMapFixedSize!4588) Bool)

(assert (=> start!80020 (= res!632617 (valid!1766 thiss!1141))))

(assert (=> start!80020 e!528857))

(declare-fun e!528855 () Bool)

(assert (=> start!80020 e!528855))

(assert (=> start!80020 true))

(declare-fun b!940834 () Bool)

(declare-fun e!528861 () Bool)

(assert (=> b!940834 (= e!528861 tp_is_empty!20401)))

(declare-fun mapNonEmpty!32392 () Bool)

(declare-fun tp!62154 () Bool)

(assert (=> mapNonEmpty!32392 (= mapRes!32392 (and tp!62154 e!528861))))

(declare-fun mapValue!32392 () ValueCell!9719)

(declare-fun mapRest!32392 () (Array (_ BitVec 32) ValueCell!9719))

(declare-fun mapKey!32392 () (_ BitVec 32))

(assert (=> mapNonEmpty!32392 (= (arr!27293 (_values!5608 thiss!1141)) (store mapRest!32392 mapKey!32392 mapValue!32392))))

(declare-fun b!940835 () Bool)

(declare-fun res!632616 () Bool)

(assert (=> b!940835 (=> (not res!632616) (not e!528857))))

(assert (=> b!940835 (= res!632616 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21276 (array!56717) Bool)

(declare-fun array_inv!21277 (array!56715) Bool)

(assert (=> b!940836 (= e!528855 (and tp!62155 tp_is_empty!20401 (array_inv!21276 (_keys!10430 thiss!1141)) (array_inv!21277 (_values!5608 thiss!1141)) e!528858))))

(declare-fun b!940837 () Bool)

(assert (=> b!940837 (= e!528857 e!528859)))

(declare-fun res!632618 () Bool)

(assert (=> b!940837 (=> (not res!632618) (not e!528859))))

(get-info :version)

(assert (=> b!940837 (= res!632618 ((_ is Found!9015) lt!424666))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56717 (_ BitVec 32)) SeekEntryResult!9015)

(assert (=> b!940837 (= lt!424666 (seekEntry!0 key!756 (_keys!10430 thiss!1141) (mask!27133 thiss!1141)))))

(declare-fun mapIsEmpty!32392 () Bool)

(assert (=> mapIsEmpty!32392 mapRes!32392))

(assert (= (and start!80020 res!632617) b!940835))

(assert (= (and b!940835 res!632616) b!940837))

(assert (= (and b!940837 res!632618) b!940831))

(assert (= (and b!940833 condMapEmpty!32392) mapIsEmpty!32392))

(assert (= (and b!940833 (not condMapEmpty!32392)) mapNonEmpty!32392))

(assert (= (and mapNonEmpty!32392 ((_ is ValueCellFull!9719) mapValue!32392)) b!940834))

(assert (= (and b!940833 ((_ is ValueCellFull!9719) mapDefault!32392)) b!940832))

(assert (= b!940836 b!940833))

(assert (= start!80020 b!940836))

(declare-fun m!875555 () Bool)

(assert (=> start!80020 m!875555))

(declare-fun m!875557 () Bool)

(assert (=> mapNonEmpty!32392 m!875557))

(declare-fun m!875559 () Bool)

(assert (=> b!940831 m!875559))

(declare-fun m!875561 () Bool)

(assert (=> b!940831 m!875561))

(declare-fun m!875563 () Bool)

(assert (=> b!940831 m!875563))

(declare-fun m!875565 () Bool)

(assert (=> b!940831 m!875565))

(assert (=> b!940831 m!875563))

(declare-fun m!875567 () Bool)

(assert (=> b!940831 m!875567))

(declare-fun m!875569 () Bool)

(assert (=> b!940831 m!875569))

(assert (=> b!940831 m!875561))

(declare-fun m!875571 () Bool)

(assert (=> b!940837 m!875571))

(declare-fun m!875573 () Bool)

(assert (=> b!940836 m!875573))

(declare-fun m!875575 () Bool)

(assert (=> b!940836 m!875575))

(check-sat (not b!940837) (not b!940831) (not start!80020) (not b!940836) tp_is_empty!20401 (not b_next!17893) (not mapNonEmpty!32392) b_and!29279)
(check-sat b_and!29279 (not b_next!17893))
