; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80266 () Bool)

(assert start!80266)

(declare-fun b!942870 () Bool)

(declare-fun b_free!17983 () Bool)

(declare-fun b_next!17983 () Bool)

(assert (=> b!942870 (= b_free!17983 (not b_next!17983))))

(declare-fun tp!62455 () Bool)

(declare-fun b_and!29369 () Bool)

(assert (=> b!942870 (= tp!62455 b_and!29369)))

(declare-fun b!942863 () Bool)

(declare-fun e!530109 () Bool)

(declare-fun tp_is_empty!20491 () Bool)

(assert (=> b!942863 (= e!530109 tp_is_empty!20491)))

(declare-fun res!633604 () Bool)

(declare-fun e!530114 () Bool)

(assert (=> start!80266 (=> (not res!633604) (not e!530114))))

(declare-datatypes ((V!32287 0))(
  ( (V!32288 (val!10296 Int)) )
))
(declare-datatypes ((ValueCell!9764 0))(
  ( (ValueCellFull!9764 (v!12826 V!32287)) (EmptyCell!9764) )
))
(declare-datatypes ((array!56913 0))(
  ( (array!56914 (arr!27383 (Array (_ BitVec 32) ValueCell!9764)) (size!27850 (_ BitVec 32))) )
))
(declare-datatypes ((array!56915 0))(
  ( (array!56916 (arr!27384 (Array (_ BitVec 32) (_ BitVec 64))) (size!27851 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4678 0))(
  ( (LongMapFixedSize!4679 (defaultEntry!5630 Int) (mask!27245 (_ BitVec 32)) (extraKeys!5362 (_ BitVec 32)) (zeroValue!5466 V!32287) (minValue!5466 V!32287) (_size!2394 (_ BitVec 32)) (_keys!10499 array!56915) (_values!5653 array!56913) (_vacant!2394 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4678)

(declare-fun valid!1798 (LongMapFixedSize!4678) Bool)

(assert (=> start!80266 (= res!633604 (valid!1798 thiss!1141))))

(assert (=> start!80266 e!530114))

(declare-fun e!530110 () Bool)

(assert (=> start!80266 e!530110))

(assert (=> start!80266 true))

(declare-fun b!942864 () Bool)

(declare-fun res!633603 () Bool)

(assert (=> b!942864 (=> (not res!633603) (not e!530114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942864 (= res!633603 (validMask!0 (mask!27245 thiss!1141)))))

(declare-fun b!942865 () Bool)

(declare-fun e!530112 () Bool)

(assert (=> b!942865 (= e!530112 tp_is_empty!20491)))

(declare-fun b!942866 () Bool)

(declare-fun res!633606 () Bool)

(assert (=> b!942866 (=> (not res!633606) (not e!530114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56915 (_ BitVec 32)) Bool)

(assert (=> b!942866 (= res!633606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10499 thiss!1141) (mask!27245 thiss!1141)))))

(declare-fun mapIsEmpty!32558 () Bool)

(declare-fun mapRes!32558 () Bool)

(assert (=> mapIsEmpty!32558 mapRes!32558))

(declare-fun b!942867 () Bool)

(declare-fun res!633605 () Bool)

(assert (=> b!942867 (=> (not res!633605) (not e!530114))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9046 0))(
  ( (MissingZero!9046 (index!38555 (_ BitVec 32))) (Found!9046 (index!38556 (_ BitVec 32))) (Intermediate!9046 (undefined!9858 Bool) (index!38557 (_ BitVec 32)) (x!80986 (_ BitVec 32))) (Undefined!9046) (MissingVacant!9046 (index!38558 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56915 (_ BitVec 32)) SeekEntryResult!9046)

(assert (=> b!942867 (= res!633605 (not ((_ is Found!9046) (seekEntry!0 key!756 (_keys!10499 thiss!1141) (mask!27245 thiss!1141)))))))

(declare-fun b!942868 () Bool)

(declare-fun res!633601 () Bool)

(assert (=> b!942868 (=> (not res!633601) (not e!530114))))

(assert (=> b!942868 (= res!633601 (and (= (size!27850 (_values!5653 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27245 thiss!1141))) (= (size!27851 (_keys!10499 thiss!1141)) (size!27850 (_values!5653 thiss!1141))) (bvsge (mask!27245 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5362 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5362 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942869 () Bool)

(assert (=> b!942869 (= e!530114 false)))

(declare-fun lt!424988 () Bool)

(declare-datatypes ((List!19249 0))(
  ( (Nil!19246) (Cons!19245 (h!20395 (_ BitVec 64)) (t!27555 List!19249)) )
))
(declare-fun arrayNoDuplicates!0 (array!56915 (_ BitVec 32) List!19249) Bool)

(assert (=> b!942869 (= lt!424988 (arrayNoDuplicates!0 (_keys!10499 thiss!1141) #b00000000000000000000000000000000 Nil!19246))))

(declare-fun e!530113 () Bool)

(declare-fun array_inv!21340 (array!56915) Bool)

(declare-fun array_inv!21341 (array!56913) Bool)

(assert (=> b!942870 (= e!530110 (and tp!62455 tp_is_empty!20491 (array_inv!21340 (_keys!10499 thiss!1141)) (array_inv!21341 (_values!5653 thiss!1141)) e!530113))))

(declare-fun b!942871 () Bool)

(assert (=> b!942871 (= e!530113 (and e!530109 mapRes!32558))))

(declare-fun condMapEmpty!32558 () Bool)

(declare-fun mapDefault!32558 () ValueCell!9764)

(assert (=> b!942871 (= condMapEmpty!32558 (= (arr!27383 (_values!5653 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9764)) mapDefault!32558)))))

(declare-fun b!942872 () Bool)

(declare-fun res!633600 () Bool)

(assert (=> b!942872 (=> (not res!633600) (not e!530114))))

(declare-datatypes ((tuple2!13480 0))(
  ( (tuple2!13481 (_1!6751 (_ BitVec 64)) (_2!6751 V!32287)) )
))
(declare-datatypes ((List!19250 0))(
  ( (Nil!19247) (Cons!19246 (h!20396 tuple2!13480) (t!27556 List!19250)) )
))
(declare-datatypes ((ListLongMap!12167 0))(
  ( (ListLongMap!12168 (toList!6099 List!19250)) )
))
(declare-fun contains!5112 (ListLongMap!12167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3262 (array!56915 array!56913 (_ BitVec 32) (_ BitVec 32) V!32287 V!32287 (_ BitVec 32) Int) ListLongMap!12167)

(assert (=> b!942872 (= res!633600 (contains!5112 (getCurrentListMap!3262 (_keys!10499 thiss!1141) (_values!5653 thiss!1141) (mask!27245 thiss!1141) (extraKeys!5362 thiss!1141) (zeroValue!5466 thiss!1141) (minValue!5466 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5630 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32558 () Bool)

(declare-fun tp!62456 () Bool)

(assert (=> mapNonEmpty!32558 (= mapRes!32558 (and tp!62456 e!530112))))

(declare-fun mapRest!32558 () (Array (_ BitVec 32) ValueCell!9764))

(declare-fun mapValue!32558 () ValueCell!9764)

(declare-fun mapKey!32558 () (_ BitVec 32))

(assert (=> mapNonEmpty!32558 (= (arr!27383 (_values!5653 thiss!1141)) (store mapRest!32558 mapKey!32558 mapValue!32558))))

(declare-fun b!942873 () Bool)

(declare-fun res!633602 () Bool)

(assert (=> b!942873 (=> (not res!633602) (not e!530114))))

(assert (=> b!942873 (= res!633602 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80266 res!633604) b!942873))

(assert (= (and b!942873 res!633602) b!942867))

(assert (= (and b!942867 res!633605) b!942872))

(assert (= (and b!942872 res!633600) b!942864))

(assert (= (and b!942864 res!633603) b!942868))

(assert (= (and b!942868 res!633601) b!942866))

(assert (= (and b!942866 res!633606) b!942869))

(assert (= (and b!942871 condMapEmpty!32558) mapIsEmpty!32558))

(assert (= (and b!942871 (not condMapEmpty!32558)) mapNonEmpty!32558))

(assert (= (and mapNonEmpty!32558 ((_ is ValueCellFull!9764) mapValue!32558)) b!942865))

(assert (= (and b!942871 ((_ is ValueCellFull!9764) mapDefault!32558)) b!942863))

(assert (= b!942870 b!942871))

(assert (= start!80266 b!942870))

(declare-fun m!876641 () Bool)

(assert (=> b!942872 m!876641))

(assert (=> b!942872 m!876641))

(declare-fun m!876643 () Bool)

(assert (=> b!942872 m!876643))

(declare-fun m!876645 () Bool)

(assert (=> b!942867 m!876645))

(declare-fun m!876647 () Bool)

(assert (=> b!942869 m!876647))

(declare-fun m!876649 () Bool)

(assert (=> start!80266 m!876649))

(declare-fun m!876651 () Bool)

(assert (=> b!942870 m!876651))

(declare-fun m!876653 () Bool)

(assert (=> b!942870 m!876653))

(declare-fun m!876655 () Bool)

(assert (=> mapNonEmpty!32558 m!876655))

(declare-fun m!876657 () Bool)

(assert (=> b!942864 m!876657))

(declare-fun m!876659 () Bool)

(assert (=> b!942866 m!876659))

(check-sat (not start!80266) (not b!942866) (not b!942869) b_and!29369 (not b_next!17983) tp_is_empty!20491 (not b!942872) (not b!942867) (not b!942870) (not b!942864) (not mapNonEmpty!32558))
(check-sat b_and!29369 (not b_next!17983))
