; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80122 () Bool)

(assert start!80122)

(declare-fun b!940856 () Bool)

(declare-fun b_free!17809 () Bool)

(declare-fun b_next!17809 () Bool)

(assert (=> b!940856 (= b_free!17809 (not b_next!17809))))

(declare-fun tp!61902 () Bool)

(declare-fun b_and!29231 () Bool)

(assert (=> b!940856 (= tp!61902 b_and!29231)))

(declare-fun b!940855 () Bool)

(declare-fun res!632457 () Bool)

(declare-fun e!528648 () Bool)

(assert (=> b!940855 (=> (not res!632457) (not e!528648))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940855 (= res!632457 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!528652 () Bool)

(declare-fun e!528650 () Bool)

(declare-fun tp_is_empty!20317 () Bool)

(declare-datatypes ((V!32055 0))(
  ( (V!32056 (val!10209 Int)) )
))
(declare-datatypes ((ValueCell!9677 0))(
  ( (ValueCellFull!9677 (v!12737 V!32055)) (EmptyCell!9677) )
))
(declare-datatypes ((array!56633 0))(
  ( (array!56634 (arr!27247 (Array (_ BitVec 32) ValueCell!9677)) (size!27709 (_ BitVec 32))) )
))
(declare-datatypes ((array!56635 0))(
  ( (array!56636 (arr!27248 (Array (_ BitVec 32) (_ BitVec 64))) (size!27710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4504 0))(
  ( (LongMapFixedSize!4505 (defaultEntry!5543 Int) (mask!27113 (_ BitVec 32)) (extraKeys!5275 (_ BitVec 32)) (zeroValue!5379 V!32055) (minValue!5379 V!32055) (_size!2307 (_ BitVec 32)) (_keys!10421 array!56635) (_values!5566 array!56633) (_vacant!2307 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4504)

(declare-fun array_inv!21274 (array!56635) Bool)

(declare-fun array_inv!21275 (array!56633) Bool)

(assert (=> b!940856 (= e!528652 (and tp!61902 tp_is_empty!20317 (array_inv!21274 (_keys!10421 thiss!1141)) (array_inv!21275 (_values!5566 thiss!1141)) e!528650))))

(declare-fun b!940857 () Bool)

(declare-fun e!528649 () Bool)

(assert (=> b!940857 (= e!528649 tp_is_empty!20317)))

(declare-fun res!632456 () Bool)

(assert (=> start!80122 (=> (not res!632456) (not e!528648))))

(declare-fun valid!1738 (LongMapFixedSize!4504) Bool)

(assert (=> start!80122 (= res!632456 (valid!1738 thiss!1141))))

(assert (=> start!80122 e!528648))

(assert (=> start!80122 e!528652))

(assert (=> start!80122 true))

(declare-fun b!940858 () Bool)

(declare-fun e!528647 () Bool)

(assert (=> b!940858 (= e!528647 tp_is_empty!20317)))

(declare-fun mapIsEmpty!32266 () Bool)

(declare-fun mapRes!32266 () Bool)

(assert (=> mapIsEmpty!32266 mapRes!32266))

(declare-fun b!940859 () Bool)

(assert (=> b!940859 (= e!528650 (and e!528649 mapRes!32266))))

(declare-fun condMapEmpty!32266 () Bool)

(declare-fun mapDefault!32266 () ValueCell!9677)

(assert (=> b!940859 (= condMapEmpty!32266 (= (arr!27247 (_values!5566 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9677)) mapDefault!32266)))))

(declare-fun mapNonEmpty!32266 () Bool)

(declare-fun tp!61903 () Bool)

(assert (=> mapNonEmpty!32266 (= mapRes!32266 (and tp!61903 e!528647))))

(declare-fun mapKey!32266 () (_ BitVec 32))

(declare-fun mapValue!32266 () ValueCell!9677)

(declare-fun mapRest!32266 () (Array (_ BitVec 32) ValueCell!9677))

(assert (=> mapNonEmpty!32266 (= (arr!27247 (_values!5566 thiss!1141)) (store mapRest!32266 mapKey!32266 mapValue!32266))))

(declare-fun b!940860 () Bool)

(assert (=> b!940860 (= e!528648 false)))

(declare-datatypes ((SeekEntryResult!8939 0))(
  ( (MissingZero!8939 (index!38127 (_ BitVec 32))) (Found!8939 (index!38128 (_ BitVec 32))) (Intermediate!8939 (undefined!9751 Bool) (index!38129 (_ BitVec 32)) (x!80558 (_ BitVec 32))) (Undefined!8939) (MissingVacant!8939 (index!38130 (_ BitVec 32))) )
))
(declare-fun lt!424952 () SeekEntryResult!8939)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56635 (_ BitVec 32)) SeekEntryResult!8939)

(assert (=> b!940860 (= lt!424952 (seekEntry!0 key!756 (_keys!10421 thiss!1141) (mask!27113 thiss!1141)))))

(assert (= (and start!80122 res!632456) b!940855))

(assert (= (and b!940855 res!632457) b!940860))

(assert (= (and b!940859 condMapEmpty!32266) mapIsEmpty!32266))

(assert (= (and b!940859 (not condMapEmpty!32266)) mapNonEmpty!32266))

(get-info :version)

(assert (= (and mapNonEmpty!32266 ((_ is ValueCellFull!9677) mapValue!32266)) b!940858))

(assert (= (and b!940859 ((_ is ValueCellFull!9677) mapDefault!32266)) b!940857))

(assert (= b!940856 b!940859))

(assert (= start!80122 b!940856))

(declare-fun m!876887 () Bool)

(assert (=> b!940856 m!876887))

(declare-fun m!876889 () Bool)

(assert (=> b!940856 m!876889))

(declare-fun m!876891 () Bool)

(assert (=> start!80122 m!876891))

(declare-fun m!876893 () Bool)

(assert (=> mapNonEmpty!32266 m!876893))

(declare-fun m!876895 () Bool)

(assert (=> b!940860 m!876895))

(check-sat (not b!940860) b_and!29231 tp_is_empty!20317 (not start!80122) (not mapNonEmpty!32266) (not b!940856) (not b_next!17809))
(check-sat b_and!29231 (not b_next!17809))
