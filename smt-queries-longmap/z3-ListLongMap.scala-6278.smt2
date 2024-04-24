; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80458 () Bool)

(assert start!80458)

(declare-fun b!944112 () Bool)

(declare-fun b_free!17989 () Bool)

(declare-fun b_next!17989 () Bool)

(assert (=> b!944112 (= b_free!17989 (not b_next!17989))))

(declare-fun tp!62474 () Bool)

(declare-fun b_and!29411 () Bool)

(assert (=> b!944112 (= tp!62474 b_and!29411)))

(declare-fun b!944104 () Bool)

(declare-fun res!634120 () Bool)

(declare-fun e!530895 () Bool)

(assert (=> b!944104 (=> (not res!634120) (not e!530895))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944104 (= res!634120 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944106 () Bool)

(declare-fun res!634117 () Bool)

(assert (=> b!944106 (=> (not res!634117) (not e!530895))))

(declare-datatypes ((V!32295 0))(
  ( (V!32296 (val!10299 Int)) )
))
(declare-datatypes ((ValueCell!9767 0))(
  ( (ValueCellFull!9767 (v!12827 V!32295)) (EmptyCell!9767) )
))
(declare-datatypes ((array!57011 0))(
  ( (array!57012 (arr!27427 (Array (_ BitVec 32) ValueCell!9767)) (size!27893 (_ BitVec 32))) )
))
(declare-datatypes ((array!57013 0))(
  ( (array!57014 (arr!27428 (Array (_ BitVec 32) (_ BitVec 64))) (size!27894 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4684 0))(
  ( (LongMapFixedSize!4685 (defaultEntry!5633 Int) (mask!27300 (_ BitVec 32)) (extraKeys!5365 (_ BitVec 32)) (zeroValue!5469 V!32295) (minValue!5469 V!32295) (_size!2397 (_ BitVec 32)) (_keys!10535 array!57013) (_values!5656 array!57011) (_vacant!2397 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4684)

(assert (=> b!944106 (= res!634117 (and (= (size!27893 (_values!5656 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27300 thiss!1141))) (= (size!27894 (_keys!10535 thiss!1141)) (size!27893 (_values!5656 thiss!1141))) (bvsge (mask!27300 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5365 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5365 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!944107 () Bool)

(declare-fun res!634122 () Bool)

(assert (=> b!944107 (=> (not res!634122) (not e!530895))))

(declare-datatypes ((tuple2!13418 0))(
  ( (tuple2!13419 (_1!6720 (_ BitVec 64)) (_2!6720 V!32295)) )
))
(declare-datatypes ((List!19232 0))(
  ( (Nil!19229) (Cons!19228 (h!20384 tuple2!13418) (t!27539 List!19232)) )
))
(declare-datatypes ((ListLongMap!12117 0))(
  ( (ListLongMap!12118 (toList!6074 List!19232)) )
))
(declare-fun contains!5155 (ListLongMap!12117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3308 (array!57013 array!57011 (_ BitVec 32) (_ BitVec 32) V!32295 V!32295 (_ BitVec 32) Int) ListLongMap!12117)

(assert (=> b!944107 (= res!634122 (contains!5155 (getCurrentListMap!3308 (_keys!10535 thiss!1141) (_values!5656 thiss!1141) (mask!27300 thiss!1141) (extraKeys!5365 thiss!1141) (zeroValue!5469 thiss!1141) (minValue!5469 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5633 thiss!1141)) key!756))))

(declare-fun b!944108 () Bool)

(declare-fun res!634121 () Bool)

(assert (=> b!944108 (=> (not res!634121) (not e!530895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57013 (_ BitVec 32)) Bool)

(assert (=> b!944108 (= res!634121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10535 thiss!1141) (mask!27300 thiss!1141)))))

(declare-fun b!944109 () Bool)

(declare-fun res!634119 () Bool)

(assert (=> b!944109 (=> (not res!634119) (not e!530895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944109 (= res!634119 (validMask!0 (mask!27300 thiss!1141)))))

(declare-fun res!634123 () Bool)

(assert (=> start!80458 (=> (not res!634123) (not e!530895))))

(declare-fun valid!1798 (LongMapFixedSize!4684) Bool)

(assert (=> start!80458 (= res!634123 (valid!1798 thiss!1141))))

(assert (=> start!80458 e!530895))

(declare-fun e!530897 () Bool)

(assert (=> start!80458 e!530897))

(assert (=> start!80458 true))

(declare-fun b!944105 () Bool)

(assert (=> b!944105 (= e!530895 false)))

(declare-fun lt!425594 () Bool)

(declare-datatypes ((List!19233 0))(
  ( (Nil!19230) (Cons!19229 (h!20385 (_ BitVec 64)) (t!27540 List!19233)) )
))
(declare-fun arrayNoDuplicates!0 (array!57013 (_ BitVec 32) List!19233) Bool)

(assert (=> b!944105 (= lt!425594 (arrayNoDuplicates!0 (_keys!10535 thiss!1141) #b00000000000000000000000000000000 Nil!19230))))

(declare-fun mapIsEmpty!32567 () Bool)

(declare-fun mapRes!32567 () Bool)

(assert (=> mapIsEmpty!32567 mapRes!32567))

(declare-fun b!944110 () Bool)

(declare-fun e!530896 () Bool)

(declare-fun tp_is_empty!20497 () Bool)

(assert (=> b!944110 (= e!530896 tp_is_empty!20497)))

(declare-fun b!944111 () Bool)

(declare-fun res!634118 () Bool)

(assert (=> b!944111 (=> (not res!634118) (not e!530895))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9007 0))(
  ( (MissingZero!9007 (index!38399 (_ BitVec 32))) (Found!9007 (index!38400 (_ BitVec 32))) (Intermediate!9007 (undefined!9819 Bool) (index!38401 (_ BitVec 32)) (x!80974 (_ BitVec 32))) (Undefined!9007) (MissingVacant!9007 (index!38402 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57013 (_ BitVec 32)) SeekEntryResult!9007)

(assert (=> b!944111 (= res!634118 (not ((_ is Found!9007) (seekEntry!0 key!756 (_keys!10535 thiss!1141) (mask!27300 thiss!1141)))))))

(declare-fun e!530893 () Bool)

(declare-fun array_inv!21402 (array!57013) Bool)

(declare-fun array_inv!21403 (array!57011) Bool)

(assert (=> b!944112 (= e!530897 (and tp!62474 tp_is_empty!20497 (array_inv!21402 (_keys!10535 thiss!1141)) (array_inv!21403 (_values!5656 thiss!1141)) e!530893))))

(declare-fun b!944113 () Bool)

(declare-fun e!530898 () Bool)

(assert (=> b!944113 (= e!530898 tp_is_empty!20497)))

(declare-fun b!944114 () Bool)

(assert (=> b!944114 (= e!530893 (and e!530896 mapRes!32567))))

(declare-fun condMapEmpty!32567 () Bool)

(declare-fun mapDefault!32567 () ValueCell!9767)

(assert (=> b!944114 (= condMapEmpty!32567 (= (arr!27427 (_values!5656 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9767)) mapDefault!32567)))))

(declare-fun mapNonEmpty!32567 () Bool)

(declare-fun tp!62473 () Bool)

(assert (=> mapNonEmpty!32567 (= mapRes!32567 (and tp!62473 e!530898))))

(declare-fun mapValue!32567 () ValueCell!9767)

(declare-fun mapRest!32567 () (Array (_ BitVec 32) ValueCell!9767))

(declare-fun mapKey!32567 () (_ BitVec 32))

(assert (=> mapNonEmpty!32567 (= (arr!27427 (_values!5656 thiss!1141)) (store mapRest!32567 mapKey!32567 mapValue!32567))))

(assert (= (and start!80458 res!634123) b!944104))

(assert (= (and b!944104 res!634120) b!944111))

(assert (= (and b!944111 res!634118) b!944107))

(assert (= (and b!944107 res!634122) b!944109))

(assert (= (and b!944109 res!634119) b!944106))

(assert (= (and b!944106 res!634117) b!944108))

(assert (= (and b!944108 res!634121) b!944105))

(assert (= (and b!944114 condMapEmpty!32567) mapIsEmpty!32567))

(assert (= (and b!944114 (not condMapEmpty!32567)) mapNonEmpty!32567))

(assert (= (and mapNonEmpty!32567 ((_ is ValueCellFull!9767) mapValue!32567)) b!944113))

(assert (= (and b!944114 ((_ is ValueCellFull!9767) mapDefault!32567)) b!944110))

(assert (= b!944112 b!944114))

(assert (= start!80458 b!944112))

(declare-fun m!878753 () Bool)

(assert (=> b!944105 m!878753))

(declare-fun m!878755 () Bool)

(assert (=> b!944111 m!878755))

(declare-fun m!878757 () Bool)

(assert (=> b!944112 m!878757))

(declare-fun m!878759 () Bool)

(assert (=> b!944112 m!878759))

(declare-fun m!878761 () Bool)

(assert (=> b!944109 m!878761))

(declare-fun m!878763 () Bool)

(assert (=> b!944108 m!878763))

(declare-fun m!878765 () Bool)

(assert (=> mapNonEmpty!32567 m!878765))

(declare-fun m!878767 () Bool)

(assert (=> start!80458 m!878767))

(declare-fun m!878769 () Bool)

(assert (=> b!944107 m!878769))

(assert (=> b!944107 m!878769))

(declare-fun m!878771 () Bool)

(assert (=> b!944107 m!878771))

(check-sat (not b!944108) b_and!29411 (not b!944109) (not b!944112) (not start!80458) (not b!944105) (not b_next!17989) tp_is_empty!20497 (not mapNonEmpty!32567) (not b!944107) (not b!944111))
(check-sat b_and!29411 (not b_next!17989))
