; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80382 () Bool)

(assert start!80382)

(declare-fun b!944090 () Bool)

(declare-fun b_free!18043 () Bool)

(declare-fun b_next!18043 () Bool)

(assert (=> b!944090 (= b_free!18043 (not b_next!18043))))

(declare-fun tp!62640 () Bool)

(declare-fun b_and!29435 () Bool)

(assert (=> b!944090 (= tp!62640 b_and!29435)))

(declare-fun b!944086 () Bool)

(declare-fun e!530884 () Bool)

(declare-fun e!530883 () Bool)

(assert (=> b!944086 (= e!530884 (not e!530883))))

(declare-fun res!634271 () Bool)

(assert (=> b!944086 (=> res!634271 e!530883)))

(declare-datatypes ((V!32367 0))(
  ( (V!32368 (val!10326 Int)) )
))
(declare-datatypes ((ValueCell!9794 0))(
  ( (ValueCellFull!9794 (v!12857 V!32367)) (EmptyCell!9794) )
))
(declare-datatypes ((array!57035 0))(
  ( (array!57036 (arr!27443 (Array (_ BitVec 32) ValueCell!9794)) (size!27911 (_ BitVec 32))) )
))
(declare-datatypes ((array!57037 0))(
  ( (array!57038 (arr!27444 (Array (_ BitVec 32) (_ BitVec 64))) (size!27912 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4738 0))(
  ( (LongMapFixedSize!4739 (defaultEntry!5664 Int) (mask!27305 (_ BitVec 32)) (extraKeys!5396 (_ BitVec 32)) (zeroValue!5500 V!32367) (minValue!5500 V!32367) (_size!2424 (_ BitVec 32)) (_keys!10537 array!57037) (_values!5687 array!57035) (_vacant!2424 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4738)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944086 (= res!634271 (not (validMask!0 (mask!27305 thiss!1141))))))

(declare-fun lt!425359 () (_ BitVec 32))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57037 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944086 (= lt!425359 (arrayScanForKey!0 (_keys!10537 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944086 (arrayContainsKey!0 (_keys!10537 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31725 0))(
  ( (Unit!31726) )
))
(declare-fun lt!425358 () Unit!31725)

(declare-fun lemmaKeyInListMapIsInArray!291 (array!57037 array!57035 (_ BitVec 32) (_ BitVec 32) V!32367 V!32367 (_ BitVec 64) Int) Unit!31725)

(assert (=> b!944086 (= lt!425358 (lemmaKeyInListMapIsInArray!291 (_keys!10537 thiss!1141) (_values!5687 thiss!1141) (mask!27305 thiss!1141) (extraKeys!5396 thiss!1141) (zeroValue!5500 thiss!1141) (minValue!5500 thiss!1141) key!756 (defaultEntry!5664 thiss!1141)))))

(declare-fun mapNonEmpty!32652 () Bool)

(declare-fun mapRes!32652 () Bool)

(declare-fun tp!62639 () Bool)

(declare-fun e!530885 () Bool)

(assert (=> mapNonEmpty!32652 (= mapRes!32652 (and tp!62639 e!530885))))

(declare-fun mapKey!32652 () (_ BitVec 32))

(declare-fun mapValue!32652 () ValueCell!9794)

(declare-fun mapRest!32652 () (Array (_ BitVec 32) ValueCell!9794))

(assert (=> mapNonEmpty!32652 (= (arr!27443 (_values!5687 thiss!1141)) (store mapRest!32652 mapKey!32652 mapValue!32652))))

(declare-fun b!944087 () Bool)

(declare-fun res!634270 () Bool)

(assert (=> b!944087 (=> (not res!634270) (not e!530884))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9063 0))(
  ( (MissingZero!9063 (index!38623 (_ BitVec 32))) (Found!9063 (index!38624 (_ BitVec 32))) (Intermediate!9063 (undefined!9875 Bool) (index!38625 (_ BitVec 32)) (x!81101 (_ BitVec 32))) (Undefined!9063) (MissingVacant!9063 (index!38626 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57037 (_ BitVec 32)) SeekEntryResult!9063)

(assert (=> b!944087 (= res!634270 (not ((_ is Found!9063) (seekEntry!0 key!756 (_keys!10537 thiss!1141) (mask!27305 thiss!1141)))))))

(declare-fun mapIsEmpty!32652 () Bool)

(assert (=> mapIsEmpty!32652 mapRes!32652))

(declare-fun b!944088 () Bool)

(assert (=> b!944088 (= e!530883 true)))

(declare-fun lt!425357 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57037 (_ BitVec 32)) Bool)

(assert (=> b!944088 (= lt!425357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10537 thiss!1141) (mask!27305 thiss!1141)))))

(declare-fun res!634268 () Bool)

(assert (=> start!80382 (=> (not res!634268) (not e!530884))))

(declare-fun valid!1812 (LongMapFixedSize!4738) Bool)

(assert (=> start!80382 (= res!634268 (valid!1812 thiss!1141))))

(assert (=> start!80382 e!530884))

(declare-fun e!530880 () Bool)

(assert (=> start!80382 e!530880))

(assert (=> start!80382 true))

(declare-fun b!944089 () Bool)

(declare-fun res!634272 () Bool)

(assert (=> b!944089 (=> res!634272 e!530883)))

(assert (=> b!944089 (= res!634272 (or (not (= (size!27912 (_keys!10537 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27305 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27912 (_keys!10537 thiss!1141))) (bvslt lt!425359 #b00000000000000000000000000000000) (bvsgt lt!425359 (size!27912 (_keys!10537 thiss!1141)))))))

(declare-fun tp_is_empty!20551 () Bool)

(declare-fun e!530881 () Bool)

(declare-fun array_inv!21374 (array!57037) Bool)

(declare-fun array_inv!21375 (array!57035) Bool)

(assert (=> b!944090 (= e!530880 (and tp!62640 tp_is_empty!20551 (array_inv!21374 (_keys!10537 thiss!1141)) (array_inv!21375 (_values!5687 thiss!1141)) e!530881))))

(declare-fun b!944091 () Bool)

(declare-fun res!634269 () Bool)

(assert (=> b!944091 (=> (not res!634269) (not e!530884))))

(assert (=> b!944091 (= res!634269 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944092 () Bool)

(declare-fun e!530886 () Bool)

(assert (=> b!944092 (= e!530881 (and e!530886 mapRes!32652))))

(declare-fun condMapEmpty!32652 () Bool)

(declare-fun mapDefault!32652 () ValueCell!9794)

(assert (=> b!944092 (= condMapEmpty!32652 (= (arr!27443 (_values!5687 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9794)) mapDefault!32652)))))

(declare-fun b!944093 () Bool)

(declare-fun res!634273 () Bool)

(assert (=> b!944093 (=> (not res!634273) (not e!530884))))

(declare-datatypes ((tuple2!13522 0))(
  ( (tuple2!13523 (_1!6772 (_ BitVec 64)) (_2!6772 V!32367)) )
))
(declare-datatypes ((List!19276 0))(
  ( (Nil!19273) (Cons!19272 (h!20423 tuple2!13522) (t!27584 List!19276)) )
))
(declare-datatypes ((ListLongMap!12209 0))(
  ( (ListLongMap!12210 (toList!6120 List!19276)) )
))
(declare-fun contains!5135 (ListLongMap!12209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3283 (array!57037 array!57035 (_ BitVec 32) (_ BitVec 32) V!32367 V!32367 (_ BitVec 32) Int) ListLongMap!12209)

(assert (=> b!944093 (= res!634273 (contains!5135 (getCurrentListMap!3283 (_keys!10537 thiss!1141) (_values!5687 thiss!1141) (mask!27305 thiss!1141) (extraKeys!5396 thiss!1141) (zeroValue!5500 thiss!1141) (minValue!5500 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5664 thiss!1141)) key!756))))

(declare-fun b!944094 () Bool)

(assert (=> b!944094 (= e!530886 tp_is_empty!20551)))

(declare-fun b!944095 () Bool)

(assert (=> b!944095 (= e!530885 tp_is_empty!20551)))

(assert (= (and start!80382 res!634268) b!944091))

(assert (= (and b!944091 res!634269) b!944087))

(assert (= (and b!944087 res!634270) b!944093))

(assert (= (and b!944093 res!634273) b!944086))

(assert (= (and b!944086 (not res!634271)) b!944089))

(assert (= (and b!944089 (not res!634272)) b!944088))

(assert (= (and b!944092 condMapEmpty!32652) mapIsEmpty!32652))

(assert (= (and b!944092 (not condMapEmpty!32652)) mapNonEmpty!32652))

(assert (= (and mapNonEmpty!32652 ((_ is ValueCellFull!9794) mapValue!32652)) b!944095))

(assert (= (and b!944092 ((_ is ValueCellFull!9794) mapDefault!32652)) b!944094))

(assert (= b!944090 b!944092))

(assert (= start!80382 b!944090))

(declare-fun m!877591 () Bool)

(assert (=> start!80382 m!877591))

(declare-fun m!877593 () Bool)

(assert (=> b!944093 m!877593))

(assert (=> b!944093 m!877593))

(declare-fun m!877595 () Bool)

(assert (=> b!944093 m!877595))

(declare-fun m!877597 () Bool)

(assert (=> mapNonEmpty!32652 m!877597))

(declare-fun m!877599 () Bool)

(assert (=> b!944087 m!877599))

(declare-fun m!877601 () Bool)

(assert (=> b!944090 m!877601))

(declare-fun m!877603 () Bool)

(assert (=> b!944090 m!877603))

(declare-fun m!877605 () Bool)

(assert (=> b!944088 m!877605))

(declare-fun m!877607 () Bool)

(assert (=> b!944086 m!877607))

(declare-fun m!877609 () Bool)

(assert (=> b!944086 m!877609))

(declare-fun m!877611 () Bool)

(assert (=> b!944086 m!877611))

(declare-fun m!877613 () Bool)

(assert (=> b!944086 m!877613))

(check-sat tp_is_empty!20551 (not b!944087) (not b!944088) b_and!29435 (not b!944093) (not b_next!18043) (not mapNonEmpty!32652) (not start!80382) (not b!944090) (not b!944086))
(check-sat b_and!29435 (not b_next!18043))
