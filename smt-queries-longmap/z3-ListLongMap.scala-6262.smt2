; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80206 () Bool)

(assert start!80206)

(declare-fun b!941979 () Bool)

(declare-fun b_free!17893 () Bool)

(declare-fun b_next!17893 () Bool)

(assert (=> b!941979 (= b_free!17893 (not b_next!17893))))

(declare-fun tp!62154 () Bool)

(declare-fun b_and!29315 () Bool)

(assert (=> b!941979 (= tp!62154 b_and!29315)))

(declare-fun b!941973 () Bool)

(declare-fun e!529588 () Bool)

(declare-fun tp_is_empty!20401 () Bool)

(assert (=> b!941973 (= e!529588 tp_is_empty!20401)))

(declare-fun b!941974 () Bool)

(declare-fun res!633071 () Bool)

(declare-fun e!529589 () Bool)

(assert (=> b!941974 (=> (not res!633071) (not e!529589))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941974 (= res!633071 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941975 () Bool)

(declare-fun e!529591 () Bool)

(assert (=> b!941975 (= e!529591 tp_is_empty!20401)))

(declare-fun res!633072 () Bool)

(assert (=> start!80206 (=> (not res!633072) (not e!529589))))

(declare-datatypes ((V!32167 0))(
  ( (V!32168 (val!10251 Int)) )
))
(declare-datatypes ((ValueCell!9719 0))(
  ( (ValueCellFull!9719 (v!12779 V!32167)) (EmptyCell!9719) )
))
(declare-datatypes ((array!56801 0))(
  ( (array!56802 (arr!27331 (Array (_ BitVec 32) ValueCell!9719)) (size!27793 (_ BitVec 32))) )
))
(declare-datatypes ((array!56803 0))(
  ( (array!56804 (arr!27332 (Array (_ BitVec 32) (_ BitVec 64))) (size!27794 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4588 0))(
  ( (LongMapFixedSize!4589 (defaultEntry!5585 Int) (mask!27183 (_ BitVec 32)) (extraKeys!5317 (_ BitVec 32)) (zeroValue!5421 V!32167) (minValue!5421 V!32167) (_size!2349 (_ BitVec 32)) (_keys!10463 array!56803) (_values!5608 array!56801) (_vacant!2349 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4588)

(declare-fun valid!1763 (LongMapFixedSize!4588) Bool)

(assert (=> start!80206 (= res!633072 (valid!1763 thiss!1141))))

(assert (=> start!80206 e!529589))

(declare-fun e!529586 () Bool)

(assert (=> start!80206 e!529586))

(assert (=> start!80206 true))

(declare-fun b!941976 () Bool)

(declare-fun e!529585 () Bool)

(declare-fun mapRes!32392 () Bool)

(assert (=> b!941976 (= e!529585 (and e!529591 mapRes!32392))))

(declare-fun condMapEmpty!32392 () Bool)

(declare-fun mapDefault!32392 () ValueCell!9719)

(assert (=> b!941976 (= condMapEmpty!32392 (= (arr!27331 (_values!5608 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9719)) mapDefault!32392)))))

(declare-fun b!941977 () Bool)

(declare-fun e!529590 () Bool)

(assert (=> b!941977 (= e!529590 (not true))))

(declare-datatypes ((SeekEntryResult!8970 0))(
  ( (MissingZero!8970 (index!38251 (_ BitVec 32))) (Found!8970 (index!38252 (_ BitVec 32))) (Intermediate!8970 (undefined!9782 Bool) (index!38253 (_ BitVec 32)) (x!80701 (_ BitVec 32))) (Undefined!8970) (MissingVacant!8970 (index!38254 (_ BitVec 32))) )
))
(declare-fun lt!425262 () SeekEntryResult!8970)

(declare-datatypes ((tuple2!13388 0))(
  ( (tuple2!13389 (_1!6705 (_ BitVec 64)) (_2!6705 V!32167)) )
))
(declare-datatypes ((List!19189 0))(
  ( (Nil!19186) (Cons!19185 (h!20337 tuple2!13388) (t!27496 List!19189)) )
))
(declare-datatypes ((ListLongMap!12087 0))(
  ( (ListLongMap!12088 (toList!6059 List!19189)) )
))
(declare-fun contains!5134 (ListLongMap!12087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3293 (array!56803 array!56801 (_ BitVec 32) (_ BitVec 32) V!32167 V!32167 (_ BitVec 32) Int) ListLongMap!12087)

(assert (=> b!941977 (contains!5134 (getCurrentListMap!3293 (_keys!10463 thiss!1141) (_values!5608 thiss!1141) (mask!27183 thiss!1141) (extraKeys!5317 thiss!1141) (zeroValue!5421 thiss!1141) (minValue!5421 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5585 thiss!1141)) (select (arr!27332 (_keys!10463 thiss!1141)) (index!38252 lt!425262)))))

(declare-datatypes ((Unit!31772 0))(
  ( (Unit!31773) )
))
(declare-fun lt!425263 () Unit!31772)

(declare-fun lemmaValidKeyInArrayIsInListMap!269 (array!56803 array!56801 (_ BitVec 32) (_ BitVec 32) V!32167 V!32167 (_ BitVec 32) Int) Unit!31772)

(assert (=> b!941977 (= lt!425263 (lemmaValidKeyInArrayIsInListMap!269 (_keys!10463 thiss!1141) (_values!5608 thiss!1141) (mask!27183 thiss!1141) (extraKeys!5317 thiss!1141) (zeroValue!5421 thiss!1141) (minValue!5421 thiss!1141) (index!38252 lt!425262) (defaultEntry!5585 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!56803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941977 (arrayContainsKey!0 (_keys!10463 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425264 () Unit!31772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56803 (_ BitVec 64) (_ BitVec 32)) Unit!31772)

(assert (=> b!941977 (= lt!425264 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10463 thiss!1141) key!756 (index!38252 lt!425262)))))

(declare-fun b!941978 () Bool)

(assert (=> b!941978 (= e!529589 e!529590)))

(declare-fun res!633070 () Bool)

(assert (=> b!941978 (=> (not res!633070) (not e!529590))))

(get-info :version)

(assert (=> b!941978 (= res!633070 ((_ is Found!8970) lt!425262))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56803 (_ BitVec 32)) SeekEntryResult!8970)

(assert (=> b!941978 (= lt!425262 (seekEntry!0 key!756 (_keys!10463 thiss!1141) (mask!27183 thiss!1141)))))

(declare-fun mapIsEmpty!32392 () Bool)

(assert (=> mapIsEmpty!32392 mapRes!32392))

(declare-fun mapNonEmpty!32392 () Bool)

(declare-fun tp!62155 () Bool)

(assert (=> mapNonEmpty!32392 (= mapRes!32392 (and tp!62155 e!529588))))

(declare-fun mapValue!32392 () ValueCell!9719)

(declare-fun mapRest!32392 () (Array (_ BitVec 32) ValueCell!9719))

(declare-fun mapKey!32392 () (_ BitVec 32))

(assert (=> mapNonEmpty!32392 (= (arr!27331 (_values!5608 thiss!1141)) (store mapRest!32392 mapKey!32392 mapValue!32392))))

(declare-fun array_inv!21334 (array!56803) Bool)

(declare-fun array_inv!21335 (array!56801) Bool)

(assert (=> b!941979 (= e!529586 (and tp!62154 tp_is_empty!20401 (array_inv!21334 (_keys!10463 thiss!1141)) (array_inv!21335 (_values!5608 thiss!1141)) e!529585))))

(assert (= (and start!80206 res!633072) b!941974))

(assert (= (and b!941974 res!633071) b!941978))

(assert (= (and b!941978 res!633070) b!941977))

(assert (= (and b!941976 condMapEmpty!32392) mapIsEmpty!32392))

(assert (= (and b!941976 (not condMapEmpty!32392)) mapNonEmpty!32392))

(assert (= (and mapNonEmpty!32392 ((_ is ValueCellFull!9719) mapValue!32392)) b!941973))

(assert (= (and b!941976 ((_ is ValueCellFull!9719) mapDefault!32392)) b!941975))

(assert (= b!941979 b!941976))

(assert (= start!80206 b!941979))

(declare-fun m!877607 () Bool)

(assert (=> start!80206 m!877607))

(declare-fun m!877609 () Bool)

(assert (=> mapNonEmpty!32392 m!877609))

(declare-fun m!877611 () Bool)

(assert (=> b!941979 m!877611))

(declare-fun m!877613 () Bool)

(assert (=> b!941979 m!877613))

(declare-fun m!877615 () Bool)

(assert (=> b!941978 m!877615))

(declare-fun m!877617 () Bool)

(assert (=> b!941977 m!877617))

(declare-fun m!877619 () Bool)

(assert (=> b!941977 m!877619))

(declare-fun m!877621 () Bool)

(assert (=> b!941977 m!877621))

(assert (=> b!941977 m!877619))

(assert (=> b!941977 m!877617))

(declare-fun m!877623 () Bool)

(assert (=> b!941977 m!877623))

(declare-fun m!877625 () Bool)

(assert (=> b!941977 m!877625))

(declare-fun m!877627 () Bool)

(assert (=> b!941977 m!877627))

(check-sat (not b!941977) (not mapNonEmpty!32392) (not b!941978) tp_is_empty!20401 b_and!29315 (not start!80206) (not b!941979) (not b_next!17893))
(check-sat b_and!29315 (not b_next!17893))
