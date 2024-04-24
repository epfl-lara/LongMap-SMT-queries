; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80452 () Bool)

(assert start!80452)

(declare-fun b!944010 () Bool)

(declare-fun b_free!17983 () Bool)

(declare-fun b_next!17983 () Bool)

(assert (=> b!944010 (= b_free!17983 (not b_next!17983))))

(declare-fun tp!62456 () Bool)

(declare-fun b_and!29405 () Bool)

(assert (=> b!944010 (= tp!62456 b_and!29405)))

(declare-fun b!944005 () Bool)

(declare-fun res!634054 () Bool)

(declare-fun e!530843 () Bool)

(assert (=> b!944005 (=> (not res!634054) (not e!530843))))

(declare-datatypes ((V!32287 0))(
  ( (V!32288 (val!10296 Int)) )
))
(declare-datatypes ((ValueCell!9764 0))(
  ( (ValueCellFull!9764 (v!12824 V!32287)) (EmptyCell!9764) )
))
(declare-datatypes ((array!56999 0))(
  ( (array!57000 (arr!27421 (Array (_ BitVec 32) ValueCell!9764)) (size!27887 (_ BitVec 32))) )
))
(declare-datatypes ((array!57001 0))(
  ( (array!57002 (arr!27422 (Array (_ BitVec 32) (_ BitVec 64))) (size!27888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4678 0))(
  ( (LongMapFixedSize!4679 (defaultEntry!5630 Int) (mask!27295 (_ BitVec 32)) (extraKeys!5362 (_ BitVec 32)) (zeroValue!5466 V!32287) (minValue!5466 V!32287) (_size!2394 (_ BitVec 32)) (_keys!10532 array!57001) (_values!5653 array!56999) (_vacant!2394 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4678)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944005 (= res!634054 (validMask!0 (mask!27295 thiss!1141)))))

(declare-fun b!944006 () Bool)

(declare-fun e!530840 () Bool)

(declare-fun tp_is_empty!20491 () Bool)

(assert (=> b!944006 (= e!530840 tp_is_empty!20491)))

(declare-fun b!944007 () Bool)

(declare-fun res!634055 () Bool)

(assert (=> b!944007 (=> (not res!634055) (not e!530843))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9004 0))(
  ( (MissingZero!9004 (index!38387 (_ BitVec 32))) (Found!9004 (index!38388 (_ BitVec 32))) (Intermediate!9004 (undefined!9816 Bool) (index!38389 (_ BitVec 32)) (x!80963 (_ BitVec 32))) (Undefined!9004) (MissingVacant!9004 (index!38390 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57001 (_ BitVec 32)) SeekEntryResult!9004)

(assert (=> b!944007 (= res!634055 (not ((_ is Found!9004) (seekEntry!0 key!756 (_keys!10532 thiss!1141) (mask!27295 thiss!1141)))))))

(declare-fun mapIsEmpty!32558 () Bool)

(declare-fun mapRes!32558 () Bool)

(assert (=> mapIsEmpty!32558 mapRes!32558))

(declare-fun b!944008 () Bool)

(declare-fun e!530844 () Bool)

(assert (=> b!944008 (= e!530844 (and e!530840 mapRes!32558))))

(declare-fun condMapEmpty!32558 () Bool)

(declare-fun mapDefault!32558 () ValueCell!9764)

(assert (=> b!944008 (= condMapEmpty!32558 (= (arr!27421 (_values!5653 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9764)) mapDefault!32558)))))

(declare-fun mapNonEmpty!32558 () Bool)

(declare-fun tp!62455 () Bool)

(declare-fun e!530842 () Bool)

(assert (=> mapNonEmpty!32558 (= mapRes!32558 (and tp!62455 e!530842))))

(declare-fun mapRest!32558 () (Array (_ BitVec 32) ValueCell!9764))

(declare-fun mapKey!32558 () (_ BitVec 32))

(declare-fun mapValue!32558 () ValueCell!9764)

(assert (=> mapNonEmpty!32558 (= (arr!27421 (_values!5653 thiss!1141)) (store mapRest!32558 mapKey!32558 mapValue!32558))))

(declare-fun e!530839 () Bool)

(declare-fun array_inv!21396 (array!57001) Bool)

(declare-fun array_inv!21397 (array!56999) Bool)

(assert (=> b!944010 (= e!530839 (and tp!62456 tp_is_empty!20491 (array_inv!21396 (_keys!10532 thiss!1141)) (array_inv!21397 (_values!5653 thiss!1141)) e!530844))))

(declare-fun b!944011 () Bool)

(assert (=> b!944011 (= e!530843 false)))

(declare-fun lt!425585 () Bool)

(declare-datatypes ((List!19227 0))(
  ( (Nil!19224) (Cons!19223 (h!20379 (_ BitVec 64)) (t!27534 List!19227)) )
))
(declare-fun arrayNoDuplicates!0 (array!57001 (_ BitVec 32) List!19227) Bool)

(assert (=> b!944011 (= lt!425585 (arrayNoDuplicates!0 (_keys!10532 thiss!1141) #b00000000000000000000000000000000 Nil!19224))))

(declare-fun res!634057 () Bool)

(assert (=> start!80452 (=> (not res!634057) (not e!530843))))

(declare-fun valid!1795 (LongMapFixedSize!4678) Bool)

(assert (=> start!80452 (= res!634057 (valid!1795 thiss!1141))))

(assert (=> start!80452 e!530843))

(assert (=> start!80452 e!530839))

(assert (=> start!80452 true))

(declare-fun b!944009 () Bool)

(declare-fun res!634060 () Bool)

(assert (=> b!944009 (=> (not res!634060) (not e!530843))))

(assert (=> b!944009 (= res!634060 (and (= (size!27887 (_values!5653 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27295 thiss!1141))) (= (size!27888 (_keys!10532 thiss!1141)) (size!27887 (_values!5653 thiss!1141))) (bvsge (mask!27295 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5362 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5362 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!944012 () Bool)

(declare-fun res!634058 () Bool)

(assert (=> b!944012 (=> (not res!634058) (not e!530843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57001 (_ BitVec 32)) Bool)

(assert (=> b!944012 (= res!634058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10532 thiss!1141) (mask!27295 thiss!1141)))))

(declare-fun b!944013 () Bool)

(declare-fun res!634059 () Bool)

(assert (=> b!944013 (=> (not res!634059) (not e!530843))))

(assert (=> b!944013 (= res!634059 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944014 () Bool)

(declare-fun res!634056 () Bool)

(assert (=> b!944014 (=> (not res!634056) (not e!530843))))

(declare-datatypes ((tuple2!13414 0))(
  ( (tuple2!13415 (_1!6718 (_ BitVec 64)) (_2!6718 V!32287)) )
))
(declare-datatypes ((List!19228 0))(
  ( (Nil!19225) (Cons!19224 (h!20380 tuple2!13414) (t!27535 List!19228)) )
))
(declare-datatypes ((ListLongMap!12113 0))(
  ( (ListLongMap!12114 (toList!6072 List!19228)) )
))
(declare-fun contains!5153 (ListLongMap!12113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3306 (array!57001 array!56999 (_ BitVec 32) (_ BitVec 32) V!32287 V!32287 (_ BitVec 32) Int) ListLongMap!12113)

(assert (=> b!944014 (= res!634056 (contains!5153 (getCurrentListMap!3306 (_keys!10532 thiss!1141) (_values!5653 thiss!1141) (mask!27295 thiss!1141) (extraKeys!5362 thiss!1141) (zeroValue!5466 thiss!1141) (minValue!5466 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5630 thiss!1141)) key!756))))

(declare-fun b!944015 () Bool)

(assert (=> b!944015 (= e!530842 tp_is_empty!20491)))

(assert (= (and start!80452 res!634057) b!944013))

(assert (= (and b!944013 res!634059) b!944007))

(assert (= (and b!944007 res!634055) b!944014))

(assert (= (and b!944014 res!634056) b!944005))

(assert (= (and b!944005 res!634054) b!944009))

(assert (= (and b!944009 res!634060) b!944012))

(assert (= (and b!944012 res!634058) b!944011))

(assert (= (and b!944008 condMapEmpty!32558) mapIsEmpty!32558))

(assert (= (and b!944008 (not condMapEmpty!32558)) mapNonEmpty!32558))

(assert (= (and mapNonEmpty!32558 ((_ is ValueCellFull!9764) mapValue!32558)) b!944015))

(assert (= (and b!944008 ((_ is ValueCellFull!9764) mapDefault!32558)) b!944006))

(assert (= b!944010 b!944008))

(assert (= start!80452 b!944010))

(declare-fun m!878693 () Bool)

(assert (=> start!80452 m!878693))

(declare-fun m!878695 () Bool)

(assert (=> b!944007 m!878695))

(declare-fun m!878697 () Bool)

(assert (=> b!944014 m!878697))

(assert (=> b!944014 m!878697))

(declare-fun m!878699 () Bool)

(assert (=> b!944014 m!878699))

(declare-fun m!878701 () Bool)

(assert (=> b!944005 m!878701))

(declare-fun m!878703 () Bool)

(assert (=> b!944011 m!878703))

(declare-fun m!878705 () Bool)

(assert (=> b!944012 m!878705))

(declare-fun m!878707 () Bool)

(assert (=> mapNonEmpty!32558 m!878707))

(declare-fun m!878709 () Bool)

(assert (=> b!944010 m!878709))

(declare-fun m!878711 () Bool)

(assert (=> b!944010 m!878711))

(check-sat (not mapNonEmpty!32558) (not start!80452) (not b!944012) tp_is_empty!20491 (not b!944011) (not b!944010) (not b!944007) (not b!944005) (not b!944014) (not b_next!17983) b_and!29405)
(check-sat b_and!29405 (not b_next!17983))
