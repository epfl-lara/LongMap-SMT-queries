; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79936 () Bool)

(assert start!79936)

(declare-fun b!939715 () Bool)

(declare-fun b_free!17809 () Bool)

(declare-fun b_next!17809 () Bool)

(assert (=> b!939715 (= b_free!17809 (not b_next!17809))))

(declare-fun tp!61903 () Bool)

(declare-fun b_and!29195 () Bool)

(assert (=> b!939715 (= tp!61903 b_and!29195)))

(declare-fun res!632002 () Bool)

(declare-fun e!527917 () Bool)

(assert (=> start!79936 (=> (not res!632002) (not e!527917))))

(declare-datatypes ((V!32055 0))(
  ( (V!32056 (val!10209 Int)) )
))
(declare-datatypes ((ValueCell!9677 0))(
  ( (ValueCellFull!9677 (v!12739 V!32055)) (EmptyCell!9677) )
))
(declare-datatypes ((array!56547 0))(
  ( (array!56548 (arr!27209 (Array (_ BitVec 32) ValueCell!9677)) (size!27672 (_ BitVec 32))) )
))
(declare-datatypes ((array!56549 0))(
  ( (array!56550 (arr!27210 (Array (_ BitVec 32) (_ BitVec 64))) (size!27673 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4504 0))(
  ( (LongMapFixedSize!4505 (defaultEntry!5543 Int) (mask!27063 (_ BitVec 32)) (extraKeys!5275 (_ BitVec 32)) (zeroValue!5379 V!32055) (minValue!5379 V!32055) (_size!2307 (_ BitVec 32)) (_keys!10388 array!56549) (_values!5566 array!56547) (_vacant!2307 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4504)

(declare-fun valid!1737 (LongMapFixedSize!4504) Bool)

(assert (=> start!79936 (= res!632002 (valid!1737 thiss!1141))))

(assert (=> start!79936 e!527917))

(declare-fun e!527918 () Bool)

(assert (=> start!79936 e!527918))

(assert (=> start!79936 true))

(declare-fun b!939713 () Bool)

(declare-fun res!632003 () Bool)

(assert (=> b!939713 (=> (not res!632003) (not e!527917))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939713 (= res!632003 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939714 () Bool)

(declare-fun e!527919 () Bool)

(declare-fun e!527920 () Bool)

(declare-fun mapRes!32266 () Bool)

(assert (=> b!939714 (= e!527919 (and e!527920 mapRes!32266))))

(declare-fun condMapEmpty!32266 () Bool)

(declare-fun mapDefault!32266 () ValueCell!9677)

(assert (=> b!939714 (= condMapEmpty!32266 (= (arr!27209 (_values!5566 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9677)) mapDefault!32266)))))

(declare-fun mapNonEmpty!32266 () Bool)

(declare-fun tp!61902 () Bool)

(declare-fun e!527921 () Bool)

(assert (=> mapNonEmpty!32266 (= mapRes!32266 (and tp!61902 e!527921))))

(declare-fun mapRest!32266 () (Array (_ BitVec 32) ValueCell!9677))

(declare-fun mapValue!32266 () ValueCell!9677)

(declare-fun mapKey!32266 () (_ BitVec 32))

(assert (=> mapNonEmpty!32266 (= (arr!27209 (_values!5566 thiss!1141)) (store mapRest!32266 mapKey!32266 mapValue!32266))))

(declare-fun mapIsEmpty!32266 () Bool)

(assert (=> mapIsEmpty!32266 mapRes!32266))

(declare-fun tp_is_empty!20317 () Bool)

(declare-fun array_inv!21226 (array!56549) Bool)

(declare-fun array_inv!21227 (array!56547) Bool)

(assert (=> b!939715 (= e!527918 (and tp!61903 tp_is_empty!20317 (array_inv!21226 (_keys!10388 thiss!1141)) (array_inv!21227 (_values!5566 thiss!1141)) e!527919))))

(declare-fun b!939716 () Bool)

(assert (=> b!939716 (= e!527920 tp_is_empty!20317)))

(declare-fun b!939717 () Bool)

(assert (=> b!939717 (= e!527921 tp_is_empty!20317)))

(declare-fun b!939718 () Bool)

(assert (=> b!939718 (= e!527917 false)))

(declare-datatypes ((SeekEntryResult!8985 0))(
  ( (MissingZero!8985 (index!38311 (_ BitVec 32))) (Found!8985 (index!38312 (_ BitVec 32))) (Intermediate!8985 (undefined!9797 Bool) (index!38313 (_ BitVec 32)) (x!80585 (_ BitVec 32))) (Undefined!8985) (MissingVacant!8985 (index!38314 (_ BitVec 32))) )
))
(declare-fun lt!424355 () SeekEntryResult!8985)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56549 (_ BitVec 32)) SeekEntryResult!8985)

(assert (=> b!939718 (= lt!424355 (seekEntry!0 key!756 (_keys!10388 thiss!1141) (mask!27063 thiss!1141)))))

(assert (= (and start!79936 res!632002) b!939713))

(assert (= (and b!939713 res!632003) b!939718))

(assert (= (and b!939714 condMapEmpty!32266) mapIsEmpty!32266))

(assert (= (and b!939714 (not condMapEmpty!32266)) mapNonEmpty!32266))

(get-info :version)

(assert (= (and mapNonEmpty!32266 ((_ is ValueCellFull!9677) mapValue!32266)) b!939717))

(assert (= (and b!939714 ((_ is ValueCellFull!9677) mapDefault!32266)) b!939716))

(assert (= b!939715 b!939714))

(assert (= start!79936 b!939715))

(declare-fun m!874835 () Bool)

(assert (=> start!79936 m!874835))

(declare-fun m!874837 () Bool)

(assert (=> mapNonEmpty!32266 m!874837))

(declare-fun m!874839 () Bool)

(assert (=> b!939715 m!874839))

(declare-fun m!874841 () Bool)

(assert (=> b!939715 m!874841))

(declare-fun m!874843 () Bool)

(assert (=> b!939718 m!874843))

(check-sat (not mapNonEmpty!32266) (not b_next!17809) (not b!939718) (not start!79936) tp_is_empty!20317 b_and!29195 (not b!939715))
(check-sat b_and!29195 (not b_next!17809))
