; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80268 () Bool)

(assert start!80268)

(declare-fun b!942847 () Bool)

(declare-fun b_free!17967 () Bool)

(declare-fun b_next!17967 () Bool)

(assert (=> b!942847 (= b_free!17967 (not b_next!17967))))

(declare-fun tp!62406 () Bool)

(declare-fun b_and!29379 () Bool)

(assert (=> b!942847 (= tp!62406 b_and!29379)))

(declare-fun b!942838 () Bool)

(declare-fun res!633548 () Bool)

(declare-fun e!530113 () Bool)

(assert (=> b!942838 (=> (not res!633548) (not e!530113))))

(declare-datatypes ((V!32265 0))(
  ( (V!32266 (val!10288 Int)) )
))
(declare-datatypes ((ValueCell!9756 0))(
  ( (ValueCellFull!9756 (v!12819 V!32265)) (EmptyCell!9756) )
))
(declare-datatypes ((array!56916 0))(
  ( (array!56917 (arr!27384 (Array (_ BitVec 32) ValueCell!9756)) (size!27849 (_ BitVec 32))) )
))
(declare-datatypes ((array!56918 0))(
  ( (array!56919 (arr!27385 (Array (_ BitVec 32) (_ BitVec 64))) (size!27850 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4662 0))(
  ( (LongMapFixedSize!4663 (defaultEntry!5622 Int) (mask!27238 (_ BitVec 32)) (extraKeys!5354 (_ BitVec 32)) (zeroValue!5458 V!32265) (minValue!5458 V!32265) (_size!2386 (_ BitVec 32)) (_keys!10496 array!56918) (_values!5645 array!56916) (_vacant!2386 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4662)

(assert (=> b!942838 (= res!633548 (and (= (size!27849 (_values!5645 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27238 thiss!1141))) (= (size!27850 (_keys!10496 thiss!1141)) (size!27849 (_values!5645 thiss!1141))) (bvsge (mask!27238 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5354 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5354 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942839 () Bool)

(declare-fun e!530115 () Bool)

(declare-fun e!530116 () Bool)

(declare-fun mapRes!32534 () Bool)

(assert (=> b!942839 (= e!530115 (and e!530116 mapRes!32534))))

(declare-fun condMapEmpty!32534 () Bool)

(declare-fun mapDefault!32534 () ValueCell!9756)

(assert (=> b!942839 (= condMapEmpty!32534 (= (arr!27384 (_values!5645 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9756)) mapDefault!32534)))))

(declare-fun mapIsEmpty!32534 () Bool)

(assert (=> mapIsEmpty!32534 mapRes!32534))

(declare-fun b!942840 () Bool)

(assert (=> b!942840 (= e!530113 false)))

(declare-fun lt!425200 () Bool)

(declare-datatypes ((List!19227 0))(
  ( (Nil!19224) (Cons!19223 (h!20373 (_ BitVec 64)) (t!27542 List!19227)) )
))
(declare-fun arrayNoDuplicates!0 (array!56918 (_ BitVec 32) List!19227) Bool)

(assert (=> b!942840 (= lt!425200 (arrayNoDuplicates!0 (_keys!10496 thiss!1141) #b00000000000000000000000000000000 Nil!19224))))

(declare-fun b!942841 () Bool)

(declare-fun res!633546 () Bool)

(assert (=> b!942841 (=> (not res!633546) (not e!530113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942841 (= res!633546 (validMask!0 (mask!27238 thiss!1141)))))

(declare-fun b!942842 () Bool)

(declare-fun res!633543 () Bool)

(assert (=> b!942842 (=> (not res!633543) (not e!530113))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13416 0))(
  ( (tuple2!13417 (_1!6719 (_ BitVec 64)) (_2!6719 V!32265)) )
))
(declare-datatypes ((List!19228 0))(
  ( (Nil!19225) (Cons!19224 (h!20374 tuple2!13416) (t!27543 List!19228)) )
))
(declare-datatypes ((ListLongMap!12113 0))(
  ( (ListLongMap!12114 (toList!6072 List!19228)) )
))
(declare-fun contains!5142 (ListLongMap!12113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3306 (array!56918 array!56916 (_ BitVec 32) (_ BitVec 32) V!32265 V!32265 (_ BitVec 32) Int) ListLongMap!12113)

(assert (=> b!942842 (= res!633543 (contains!5142 (getCurrentListMap!3306 (_keys!10496 thiss!1141) (_values!5645 thiss!1141) (mask!27238 thiss!1141) (extraKeys!5354 thiss!1141) (zeroValue!5458 thiss!1141) (minValue!5458 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5622 thiss!1141)) key!756))))

(declare-fun b!942843 () Bool)

(declare-fun tp_is_empty!20475 () Bool)

(assert (=> b!942843 (= e!530116 tp_is_empty!20475)))

(declare-fun b!942845 () Bool)

(declare-fun e!530118 () Bool)

(assert (=> b!942845 (= e!530118 tp_is_empty!20475)))

(declare-fun mapNonEmpty!32534 () Bool)

(declare-fun tp!62407 () Bool)

(assert (=> mapNonEmpty!32534 (= mapRes!32534 (and tp!62407 e!530118))))

(declare-fun mapKey!32534 () (_ BitVec 32))

(declare-fun mapValue!32534 () ValueCell!9756)

(declare-fun mapRest!32534 () (Array (_ BitVec 32) ValueCell!9756))

(assert (=> mapNonEmpty!32534 (= (arr!27384 (_values!5645 thiss!1141)) (store mapRest!32534 mapKey!32534 mapValue!32534))))

(declare-fun b!942846 () Bool)

(declare-fun res!633544 () Bool)

(assert (=> b!942846 (=> (not res!633544) (not e!530113))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9039 0))(
  ( (MissingZero!9039 (index!38527 (_ BitVec 32))) (Found!9039 (index!38528 (_ BitVec 32))) (Intermediate!9039 (undefined!9851 Bool) (index!38529 (_ BitVec 32)) (x!80960 (_ BitVec 32))) (Undefined!9039) (MissingVacant!9039 (index!38530 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56918 (_ BitVec 32)) SeekEntryResult!9039)

(assert (=> b!942846 (= res!633544 (not ((_ is Found!9039) (seekEntry!0 key!756 (_keys!10496 thiss!1141) (mask!27238 thiss!1141)))))))

(declare-fun b!942844 () Bool)

(declare-fun res!633545 () Bool)

(assert (=> b!942844 (=> (not res!633545) (not e!530113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56918 (_ BitVec 32)) Bool)

(assert (=> b!942844 (= res!633545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10496 thiss!1141) (mask!27238 thiss!1141)))))

(declare-fun res!633547 () Bool)

(assert (=> start!80268 (=> (not res!633547) (not e!530113))))

(declare-fun valid!1784 (LongMapFixedSize!4662) Bool)

(assert (=> start!80268 (= res!633547 (valid!1784 thiss!1141))))

(assert (=> start!80268 e!530113))

(declare-fun e!530114 () Bool)

(assert (=> start!80268 e!530114))

(assert (=> start!80268 true))

(declare-fun array_inv!21274 (array!56918) Bool)

(declare-fun array_inv!21275 (array!56916) Bool)

(assert (=> b!942847 (= e!530114 (and tp!62406 tp_is_empty!20475 (array_inv!21274 (_keys!10496 thiss!1141)) (array_inv!21275 (_values!5645 thiss!1141)) e!530115))))

(declare-fun b!942848 () Bool)

(declare-fun res!633542 () Bool)

(assert (=> b!942848 (=> (not res!633542) (not e!530113))))

(assert (=> b!942848 (= res!633542 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80268 res!633547) b!942848))

(assert (= (and b!942848 res!633542) b!942846))

(assert (= (and b!942846 res!633544) b!942842))

(assert (= (and b!942842 res!633543) b!942841))

(assert (= (and b!942841 res!633546) b!942838))

(assert (= (and b!942838 res!633548) b!942844))

(assert (= (and b!942844 res!633545) b!942840))

(assert (= (and b!942839 condMapEmpty!32534) mapIsEmpty!32534))

(assert (= (and b!942839 (not condMapEmpty!32534)) mapNonEmpty!32534))

(assert (= (and mapNonEmpty!32534 ((_ is ValueCellFull!9756) mapValue!32534)) b!942845))

(assert (= (and b!942839 ((_ is ValueCellFull!9756) mapDefault!32534)) b!942843))

(assert (= b!942847 b!942839))

(assert (= start!80268 b!942847))

(declare-fun m!877239 () Bool)

(assert (=> b!942840 m!877239))

(declare-fun m!877241 () Bool)

(assert (=> mapNonEmpty!32534 m!877241))

(declare-fun m!877243 () Bool)

(assert (=> b!942846 m!877243))

(declare-fun m!877245 () Bool)

(assert (=> b!942844 m!877245))

(declare-fun m!877247 () Bool)

(assert (=> start!80268 m!877247))

(declare-fun m!877249 () Bool)

(assert (=> b!942841 m!877249))

(declare-fun m!877251 () Bool)

(assert (=> b!942847 m!877251))

(declare-fun m!877253 () Bool)

(assert (=> b!942847 m!877253))

(declare-fun m!877255 () Bool)

(assert (=> b!942842 m!877255))

(assert (=> b!942842 m!877255))

(declare-fun m!877257 () Bool)

(assert (=> b!942842 m!877257))

(check-sat (not start!80268) (not mapNonEmpty!32534) (not b!942841) (not b!942844) tp_is_empty!20475 b_and!29379 (not b!942847) (not b!942846) (not b_next!17967) (not b!942842) (not b!942840))
(check-sat b_and!29379 (not b_next!17967))
