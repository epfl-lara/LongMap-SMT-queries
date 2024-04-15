; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80284 () Bool)

(assert start!80284)

(declare-fun b!943167 () Bool)

(declare-fun b_free!18001 () Bool)

(declare-fun b_next!18001 () Bool)

(assert (=> b!943167 (= b_free!18001 (not b_next!18001))))

(declare-fun tp!62510 () Bool)

(declare-fun b_and!29387 () Bool)

(assert (=> b!943167 (= tp!62510 b_and!29387)))

(declare-fun b!943160 () Bool)

(declare-fun res!633795 () Bool)

(declare-fun e!530276 () Bool)

(assert (=> b!943160 (=> (not res!633795) (not e!530276))))

(declare-datatypes ((V!32311 0))(
  ( (V!32312 (val!10305 Int)) )
))
(declare-datatypes ((ValueCell!9773 0))(
  ( (ValueCellFull!9773 (v!12835 V!32311)) (EmptyCell!9773) )
))
(declare-datatypes ((array!56949 0))(
  ( (array!56950 (arr!27401 (Array (_ BitVec 32) ValueCell!9773)) (size!27868 (_ BitVec 32))) )
))
(declare-datatypes ((array!56951 0))(
  ( (array!56952 (arr!27402 (Array (_ BitVec 32) (_ BitVec 64))) (size!27869 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4696 0))(
  ( (LongMapFixedSize!4697 (defaultEntry!5639 Int) (mask!27260 (_ BitVec 32)) (extraKeys!5371 (_ BitVec 32)) (zeroValue!5475 V!32311) (minValue!5475 V!32311) (_size!2403 (_ BitVec 32)) (_keys!10508 array!56951) (_values!5662 array!56949) (_vacant!2403 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4696)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56951 (_ BitVec 32)) Bool)

(assert (=> b!943160 (= res!633795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10508 thiss!1141) (mask!27260 thiss!1141)))))

(declare-fun b!943161 () Bool)

(declare-fun res!633790 () Bool)

(assert (=> b!943161 (=> (not res!633790) (not e!530276))))

(assert (=> b!943161 (= res!633790 (and (= (size!27868 (_values!5662 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27260 thiss!1141))) (= (size!27869 (_keys!10508 thiss!1141)) (size!27868 (_values!5662 thiss!1141))) (bvsge (mask!27260 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5371 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5371 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943162 () Bool)

(declare-fun res!633794 () Bool)

(assert (=> b!943162 (=> (not res!633794) (not e!530276))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943162 (= res!633794 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943163 () Bool)

(declare-fun res!633793 () Bool)

(assert (=> b!943163 (=> (not res!633793) (not e!530276))))

(declare-datatypes ((tuple2!13492 0))(
  ( (tuple2!13493 (_1!6757 (_ BitVec 64)) (_2!6757 V!32311)) )
))
(declare-datatypes ((List!19259 0))(
  ( (Nil!19256) (Cons!19255 (h!20405 tuple2!13492) (t!27565 List!19259)) )
))
(declare-datatypes ((ListLongMap!12179 0))(
  ( (ListLongMap!12180 (toList!6105 List!19259)) )
))
(declare-fun contains!5118 (ListLongMap!12179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3268 (array!56951 array!56949 (_ BitVec 32) (_ BitVec 32) V!32311 V!32311 (_ BitVec 32) Int) ListLongMap!12179)

(assert (=> b!943163 (= res!633793 (contains!5118 (getCurrentListMap!3268 (_keys!10508 thiss!1141) (_values!5662 thiss!1141) (mask!27260 thiss!1141) (extraKeys!5371 thiss!1141) (zeroValue!5475 thiss!1141) (minValue!5475 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5639 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32585 () Bool)

(declare-fun mapRes!32585 () Bool)

(assert (=> mapIsEmpty!32585 mapRes!32585))

(declare-fun res!633791 () Bool)

(assert (=> start!80284 (=> (not res!633791) (not e!530276))))

(declare-fun valid!1802 (LongMapFixedSize!4696) Bool)

(assert (=> start!80284 (= res!633791 (valid!1802 thiss!1141))))

(assert (=> start!80284 e!530276))

(declare-fun e!530273 () Bool)

(assert (=> start!80284 e!530273))

(assert (=> start!80284 true))

(declare-fun b!943164 () Bool)

(declare-fun e!530274 () Bool)

(declare-fun e!530271 () Bool)

(assert (=> b!943164 (= e!530274 (and e!530271 mapRes!32585))))

(declare-fun condMapEmpty!32585 () Bool)

(declare-fun mapDefault!32585 () ValueCell!9773)

(assert (=> b!943164 (= condMapEmpty!32585 (= (arr!27401 (_values!5662 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9773)) mapDefault!32585)))))

(declare-fun b!943165 () Bool)

(declare-fun res!633789 () Bool)

(assert (=> b!943165 (=> (not res!633789) (not e!530276))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9050 0))(
  ( (MissingZero!9050 (index!38571 (_ BitVec 32))) (Found!9050 (index!38572 (_ BitVec 32))) (Intermediate!9050 (undefined!9862 Bool) (index!38573 (_ BitVec 32)) (x!81014 (_ BitVec 32))) (Undefined!9050) (MissingVacant!9050 (index!38574 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56951 (_ BitVec 32)) SeekEntryResult!9050)

(assert (=> b!943165 (= res!633789 (not ((_ is Found!9050) (seekEntry!0 key!756 (_keys!10508 thiss!1141) (mask!27260 thiss!1141)))))))

(declare-fun b!943166 () Bool)

(declare-fun res!633792 () Bool)

(assert (=> b!943166 (=> (not res!633792) (not e!530276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943166 (= res!633792 (validMask!0 (mask!27260 thiss!1141)))))

(declare-fun tp_is_empty!20509 () Bool)

(declare-fun array_inv!21350 (array!56951) Bool)

(declare-fun array_inv!21351 (array!56949) Bool)

(assert (=> b!943167 (= e!530273 (and tp!62510 tp_is_empty!20509 (array_inv!21350 (_keys!10508 thiss!1141)) (array_inv!21351 (_values!5662 thiss!1141)) e!530274))))

(declare-fun b!943168 () Bool)

(assert (=> b!943168 (= e!530271 tp_is_empty!20509)))

(declare-fun mapNonEmpty!32585 () Bool)

(declare-fun tp!62509 () Bool)

(declare-fun e!530272 () Bool)

(assert (=> mapNonEmpty!32585 (= mapRes!32585 (and tp!62509 e!530272))))

(declare-fun mapValue!32585 () ValueCell!9773)

(declare-fun mapRest!32585 () (Array (_ BitVec 32) ValueCell!9773))

(declare-fun mapKey!32585 () (_ BitVec 32))

(assert (=> mapNonEmpty!32585 (= (arr!27401 (_values!5662 thiss!1141)) (store mapRest!32585 mapKey!32585 mapValue!32585))))

(declare-fun b!943169 () Bool)

(assert (=> b!943169 (= e!530272 tp_is_empty!20509)))

(declare-fun b!943170 () Bool)

(assert (=> b!943170 (= e!530276 false)))

(declare-fun lt!425015 () Bool)

(declare-datatypes ((List!19260 0))(
  ( (Nil!19257) (Cons!19256 (h!20406 (_ BitVec 64)) (t!27566 List!19260)) )
))
(declare-fun arrayNoDuplicates!0 (array!56951 (_ BitVec 32) List!19260) Bool)

(assert (=> b!943170 (= lt!425015 (arrayNoDuplicates!0 (_keys!10508 thiss!1141) #b00000000000000000000000000000000 Nil!19257))))

(assert (= (and start!80284 res!633791) b!943162))

(assert (= (and b!943162 res!633794) b!943165))

(assert (= (and b!943165 res!633789) b!943163))

(assert (= (and b!943163 res!633793) b!943166))

(assert (= (and b!943166 res!633792) b!943161))

(assert (= (and b!943161 res!633790) b!943160))

(assert (= (and b!943160 res!633795) b!943170))

(assert (= (and b!943164 condMapEmpty!32585) mapIsEmpty!32585))

(assert (= (and b!943164 (not condMapEmpty!32585)) mapNonEmpty!32585))

(assert (= (and mapNonEmpty!32585 ((_ is ValueCellFull!9773) mapValue!32585)) b!943169))

(assert (= (and b!943164 ((_ is ValueCellFull!9773) mapDefault!32585)) b!943168))

(assert (= b!943167 b!943164))

(assert (= start!80284 b!943167))

(declare-fun m!876821 () Bool)

(assert (=> mapNonEmpty!32585 m!876821))

(declare-fun m!876823 () Bool)

(assert (=> b!943165 m!876823))

(declare-fun m!876825 () Bool)

(assert (=> b!943160 m!876825))

(declare-fun m!876827 () Bool)

(assert (=> start!80284 m!876827))

(declare-fun m!876829 () Bool)

(assert (=> b!943167 m!876829))

(declare-fun m!876831 () Bool)

(assert (=> b!943167 m!876831))

(declare-fun m!876833 () Bool)

(assert (=> b!943163 m!876833))

(assert (=> b!943163 m!876833))

(declare-fun m!876835 () Bool)

(assert (=> b!943163 m!876835))

(declare-fun m!876837 () Bool)

(assert (=> b!943170 m!876837))

(declare-fun m!876839 () Bool)

(assert (=> b!943166 m!876839))

(check-sat (not b!943166) tp_is_empty!20509 (not start!80284) (not b!943170) (not b!943167) (not b!943163) (not mapNonEmpty!32585) (not b!943165) b_and!29387 (not b!943160) (not b_next!18001))
(check-sat b_and!29387 (not b_next!18001))
