; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80274 () Bool)

(assert start!80274)

(declare-fun b!942937 () Bool)

(declare-fun b_free!17973 () Bool)

(declare-fun b_next!17973 () Bool)

(assert (=> b!942937 (= b_free!17973 (not b_next!17973))))

(declare-fun tp!62424 () Bool)

(declare-fun b_and!29385 () Bool)

(assert (=> b!942937 (= tp!62424 b_and!29385)))

(declare-fun e!530168 () Bool)

(declare-fun e!530167 () Bool)

(declare-fun tp_is_empty!20481 () Bool)

(declare-datatypes ((V!32273 0))(
  ( (V!32274 (val!10291 Int)) )
))
(declare-datatypes ((ValueCell!9759 0))(
  ( (ValueCellFull!9759 (v!12822 V!32273)) (EmptyCell!9759) )
))
(declare-datatypes ((array!56928 0))(
  ( (array!56929 (arr!27390 (Array (_ BitVec 32) ValueCell!9759)) (size!27855 (_ BitVec 32))) )
))
(declare-datatypes ((array!56930 0))(
  ( (array!56931 (arr!27391 (Array (_ BitVec 32) (_ BitVec 64))) (size!27856 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4668 0))(
  ( (LongMapFixedSize!4669 (defaultEntry!5625 Int) (mask!27243 (_ BitVec 32)) (extraKeys!5357 (_ BitVec 32)) (zeroValue!5461 V!32273) (minValue!5461 V!32273) (_size!2389 (_ BitVec 32)) (_keys!10499 array!56930) (_values!5648 array!56928) (_vacant!2389 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4668)

(declare-fun array_inv!21280 (array!56930) Bool)

(declare-fun array_inv!21281 (array!56928) Bool)

(assert (=> b!942937 (= e!530167 (and tp!62424 tp_is_empty!20481 (array_inv!21280 (_keys!10499 thiss!1141)) (array_inv!21281 (_values!5648 thiss!1141)) e!530168))))

(declare-fun b!942938 () Bool)

(declare-fun res!633611 () Bool)

(declare-fun e!530169 () Bool)

(assert (=> b!942938 (=> (not res!633611) (not e!530169))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13422 0))(
  ( (tuple2!13423 (_1!6722 (_ BitVec 64)) (_2!6722 V!32273)) )
))
(declare-datatypes ((List!19232 0))(
  ( (Nil!19229) (Cons!19228 (h!20378 tuple2!13422) (t!27547 List!19232)) )
))
(declare-datatypes ((ListLongMap!12119 0))(
  ( (ListLongMap!12120 (toList!6075 List!19232)) )
))
(declare-fun contains!5145 (ListLongMap!12119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3309 (array!56930 array!56928 (_ BitVec 32) (_ BitVec 32) V!32273 V!32273 (_ BitVec 32) Int) ListLongMap!12119)

(assert (=> b!942938 (= res!633611 (contains!5145 (getCurrentListMap!3309 (_keys!10499 thiss!1141) (_values!5648 thiss!1141) (mask!27243 thiss!1141) (extraKeys!5357 thiss!1141) (zeroValue!5461 thiss!1141) (minValue!5461 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5625 thiss!1141)) key!756))))

(declare-fun res!633609 () Bool)

(assert (=> start!80274 (=> (not res!633609) (not e!530169))))

(declare-fun valid!1786 (LongMapFixedSize!4668) Bool)

(assert (=> start!80274 (= res!633609 (valid!1786 thiss!1141))))

(assert (=> start!80274 e!530169))

(assert (=> start!80274 e!530167))

(assert (=> start!80274 true))

(declare-fun mapIsEmpty!32543 () Bool)

(declare-fun mapRes!32543 () Bool)

(assert (=> mapIsEmpty!32543 mapRes!32543))

(declare-fun b!942939 () Bool)

(declare-fun res!633607 () Bool)

(assert (=> b!942939 (=> (not res!633607) (not e!530169))))

(assert (=> b!942939 (= res!633607 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32543 () Bool)

(declare-fun tp!62425 () Bool)

(declare-fun e!530172 () Bool)

(assert (=> mapNonEmpty!32543 (= mapRes!32543 (and tp!62425 e!530172))))

(declare-fun mapKey!32543 () (_ BitVec 32))

(declare-fun mapRest!32543 () (Array (_ BitVec 32) ValueCell!9759))

(declare-fun mapValue!32543 () ValueCell!9759)

(assert (=> mapNonEmpty!32543 (= (arr!27390 (_values!5648 thiss!1141)) (store mapRest!32543 mapKey!32543 mapValue!32543))))

(declare-fun b!942940 () Bool)

(declare-fun res!633610 () Bool)

(assert (=> b!942940 (=> (not res!633610) (not e!530169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56930 (_ BitVec 32)) Bool)

(assert (=> b!942940 (= res!633610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10499 thiss!1141) (mask!27243 thiss!1141)))))

(declare-fun b!942941 () Bool)

(assert (=> b!942941 (= e!530172 tp_is_empty!20481)))

(declare-fun b!942942 () Bool)

(declare-fun res!633608 () Bool)

(assert (=> b!942942 (=> (not res!633608) (not e!530169))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9042 0))(
  ( (MissingZero!9042 (index!38539 (_ BitVec 32))) (Found!9042 (index!38540 (_ BitVec 32))) (Intermediate!9042 (undefined!9854 Bool) (index!38541 (_ BitVec 32)) (x!80971 (_ BitVec 32))) (Undefined!9042) (MissingVacant!9042 (index!38542 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56930 (_ BitVec 32)) SeekEntryResult!9042)

(assert (=> b!942942 (= res!633608 (not ((_ is Found!9042) (seekEntry!0 key!756 (_keys!10499 thiss!1141) (mask!27243 thiss!1141)))))))

(declare-fun b!942943 () Bool)

(declare-fun res!633605 () Bool)

(assert (=> b!942943 (=> (not res!633605) (not e!530169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942943 (= res!633605 (validMask!0 (mask!27243 thiss!1141)))))

(declare-fun b!942944 () Bool)

(declare-fun e!530171 () Bool)

(assert (=> b!942944 (= e!530171 tp_is_empty!20481)))

(declare-fun b!942945 () Bool)

(assert (=> b!942945 (= e!530168 (and e!530171 mapRes!32543))))

(declare-fun condMapEmpty!32543 () Bool)

(declare-fun mapDefault!32543 () ValueCell!9759)

(assert (=> b!942945 (= condMapEmpty!32543 (= (arr!27390 (_values!5648 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9759)) mapDefault!32543)))))

(declare-fun b!942946 () Bool)

(declare-fun res!633606 () Bool)

(assert (=> b!942946 (=> (not res!633606) (not e!530169))))

(assert (=> b!942946 (= res!633606 (and (= (size!27855 (_values!5648 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27243 thiss!1141))) (= (size!27856 (_keys!10499 thiss!1141)) (size!27855 (_values!5648 thiss!1141))) (bvsge (mask!27243 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5357 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5357 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942947 () Bool)

(assert (=> b!942947 (= e!530169 false)))

(declare-fun lt!425209 () Bool)

(declare-datatypes ((List!19233 0))(
  ( (Nil!19230) (Cons!19229 (h!20379 (_ BitVec 64)) (t!27548 List!19233)) )
))
(declare-fun arrayNoDuplicates!0 (array!56930 (_ BitVec 32) List!19233) Bool)

(assert (=> b!942947 (= lt!425209 (arrayNoDuplicates!0 (_keys!10499 thiss!1141) #b00000000000000000000000000000000 Nil!19230))))

(assert (= (and start!80274 res!633609) b!942939))

(assert (= (and b!942939 res!633607) b!942942))

(assert (= (and b!942942 res!633608) b!942938))

(assert (= (and b!942938 res!633611) b!942943))

(assert (= (and b!942943 res!633605) b!942946))

(assert (= (and b!942946 res!633606) b!942940))

(assert (= (and b!942940 res!633610) b!942947))

(assert (= (and b!942945 condMapEmpty!32543) mapIsEmpty!32543))

(assert (= (and b!942945 (not condMapEmpty!32543)) mapNonEmpty!32543))

(assert (= (and mapNonEmpty!32543 ((_ is ValueCellFull!9759) mapValue!32543)) b!942941))

(assert (= (and b!942945 ((_ is ValueCellFull!9759) mapDefault!32543)) b!942944))

(assert (= b!942937 b!942945))

(assert (= start!80274 b!942937))

(declare-fun m!877299 () Bool)

(assert (=> b!942943 m!877299))

(declare-fun m!877301 () Bool)

(assert (=> b!942938 m!877301))

(assert (=> b!942938 m!877301))

(declare-fun m!877303 () Bool)

(assert (=> b!942938 m!877303))

(declare-fun m!877305 () Bool)

(assert (=> mapNonEmpty!32543 m!877305))

(declare-fun m!877307 () Bool)

(assert (=> b!942940 m!877307))

(declare-fun m!877309 () Bool)

(assert (=> b!942937 m!877309))

(declare-fun m!877311 () Bool)

(assert (=> b!942937 m!877311))

(declare-fun m!877313 () Bool)

(assert (=> start!80274 m!877313))

(declare-fun m!877315 () Bool)

(assert (=> b!942947 m!877315))

(declare-fun m!877317 () Bool)

(assert (=> b!942942 m!877317))

(check-sat (not start!80274) (not b!942947) (not b!942940) (not b!942942) b_and!29385 (not b!942943) (not b_next!17973) (not b!942938) (not b!942937) tp_is_empty!20481 (not mapNonEmpty!32543))
(check-sat b_and!29385 (not b_next!17973))
