; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75774 () Bool)

(assert start!75774)

(declare-fun b!891242 () Bool)

(declare-fun b_free!15763 () Bool)

(declare-fun b_next!15763 () Bool)

(assert (=> b!891242 (= b_free!15763 (not b_next!15763))))

(declare-fun tp!55259 () Bool)

(declare-fun b_and!25977 () Bool)

(assert (=> b!891242 (= tp!55259 b_and!25977)))

(declare-fun b!891236 () Bool)

(declare-fun res!603878 () Bool)

(declare-fun e!497314 () Bool)

(assert (=> b!891236 (=> res!603878 e!497314)))

(declare-datatypes ((array!52145 0))(
  ( (array!52146 (arr!25079 (Array (_ BitVec 32) (_ BitVec 64))) (size!25525 (_ BitVec 32))) )
))
(declare-datatypes ((V!29087 0))(
  ( (V!29088 (val!9096 Int)) )
))
(declare-datatypes ((ValueCell!8564 0))(
  ( (ValueCellFull!8564 (v!11568 V!29087)) (EmptyCell!8564) )
))
(declare-datatypes ((array!52147 0))(
  ( (array!52148 (arr!25080 (Array (_ BitVec 32) ValueCell!8564)) (size!25526 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4144 0))(
  ( (LongMapFixedSize!4145 (defaultEntry!5269 Int) (mask!25757 (_ BitVec 32)) (extraKeys!4963 (_ BitVec 32)) (zeroValue!5067 V!29087) (minValue!5067 V!29087) (_size!2127 (_ BitVec 32)) (_keys!9947 array!52145) (_values!5254 array!52147) (_vacant!2127 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4144)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52145 (_ BitVec 32)) Bool)

(assert (=> b!891236 (= res!603878 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9947 thiss!1181) (mask!25757 thiss!1181))))))

(declare-fun b!891237 () Bool)

(declare-fun e!497316 () Bool)

(assert (=> b!891237 (= e!497316 e!497314)))

(declare-fun res!603884 () Bool)

(assert (=> b!891237 (=> res!603884 e!497314)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891237 (= res!603884 (not (validMask!0 (mask!25757 thiss!1181))))))

(declare-datatypes ((tuple2!11968 0))(
  ( (tuple2!11969 (_1!5995 (_ BitVec 64)) (_2!5995 V!29087)) )
))
(declare-datatypes ((List!17751 0))(
  ( (Nil!17748) (Cons!17747 (h!18878 tuple2!11968) (t!25041 List!17751)) )
))
(declare-datatypes ((ListLongMap!10655 0))(
  ( (ListLongMap!10656 (toList!5343 List!17751)) )
))
(declare-fun lt!402474 () ListLongMap!10655)

(declare-datatypes ((SeekEntryResult!8828 0))(
  ( (MissingZero!8828 (index!37683 (_ BitVec 32))) (Found!8828 (index!37684 (_ BitVec 32))) (Intermediate!8828 (undefined!9640 Bool) (index!37685 (_ BitVec 32)) (x!75751 (_ BitVec 32))) (Undefined!8828) (MissingVacant!8828 (index!37686 (_ BitVec 32))) )
))
(declare-fun lt!402472 () SeekEntryResult!8828)

(declare-fun contains!4313 (ListLongMap!10655 (_ BitVec 64)) Bool)

(assert (=> b!891237 (contains!4313 lt!402474 (select (arr!25079 (_keys!9947 thiss!1181)) (index!37684 lt!402472)))))

(declare-fun getCurrentListMap!2571 (array!52145 array!52147 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 32) Int) ListLongMap!10655)

(assert (=> b!891237 (= lt!402474 (getCurrentListMap!2571 (_keys!9947 thiss!1181) (_values!5254 thiss!1181) (mask!25757 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5269 thiss!1181)))))

(declare-datatypes ((Unit!30290 0))(
  ( (Unit!30291) )
))
(declare-fun lt!402476 () Unit!30290)

(declare-fun lemmaValidKeyInArrayIsInListMap!207 (array!52145 array!52147 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 32) Int) Unit!30290)

(assert (=> b!891237 (= lt!402476 (lemmaValidKeyInArrayIsInListMap!207 (_keys!9947 thiss!1181) (_values!5254 thiss!1181) (mask!25757 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) (index!37684 lt!402472) (defaultEntry!5269 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891237 (arrayContainsKey!0 (_keys!9947 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402473 () Unit!30290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52145 (_ BitVec 64) (_ BitVec 32)) Unit!30290)

(assert (=> b!891237 (= lt!402473 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9947 thiss!1181) key!785 (index!37684 lt!402472)))))

(declare-fun mapNonEmpty!28691 () Bool)

(declare-fun mapRes!28691 () Bool)

(declare-fun tp!55258 () Bool)

(declare-fun e!497318 () Bool)

(assert (=> mapNonEmpty!28691 (= mapRes!28691 (and tp!55258 e!497318))))

(declare-fun mapRest!28691 () (Array (_ BitVec 32) ValueCell!8564))

(declare-fun mapValue!28691 () ValueCell!8564)

(declare-fun mapKey!28691 () (_ BitVec 32))

(assert (=> mapNonEmpty!28691 (= (arr!25080 (_values!5254 thiss!1181)) (store mapRest!28691 mapKey!28691 mapValue!28691))))

(declare-fun res!603879 () Bool)

(declare-fun e!497313 () Bool)

(assert (=> start!75774 (=> (not res!603879) (not e!497313))))

(declare-fun valid!1613 (LongMapFixedSize!4144) Bool)

(assert (=> start!75774 (= res!603879 (valid!1613 thiss!1181))))

(assert (=> start!75774 e!497313))

(declare-fun e!497317 () Bool)

(assert (=> start!75774 e!497317))

(assert (=> start!75774 true))

(declare-fun b!891238 () Bool)

(declare-fun res!603882 () Bool)

(assert (=> b!891238 (=> (not res!603882) (not e!497313))))

(assert (=> b!891238 (= res!603882 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891239 () Bool)

(declare-fun e!497311 () Bool)

(declare-fun tp_is_empty!18091 () Bool)

(assert (=> b!891239 (= e!497311 tp_is_empty!18091)))

(declare-fun b!891240 () Bool)

(declare-fun e!497312 () Bool)

(assert (=> b!891240 (= e!497312 (and e!497311 mapRes!28691))))

(declare-fun condMapEmpty!28691 () Bool)

(declare-fun mapDefault!28691 () ValueCell!8564)

(assert (=> b!891240 (= condMapEmpty!28691 (= (arr!25080 (_values!5254 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8564)) mapDefault!28691)))))

(declare-fun b!891241 () Bool)

(assert (=> b!891241 (= e!497313 (not e!497316))))

(declare-fun res!603885 () Bool)

(assert (=> b!891241 (=> res!603885 e!497316)))

(get-info :version)

(assert (=> b!891241 (= res!603885 (not ((_ is Found!8828) lt!402472)))))

(declare-fun e!497315 () Bool)

(assert (=> b!891241 e!497315))

(declare-fun res!603883 () Bool)

(assert (=> b!891241 (=> res!603883 e!497315)))

(assert (=> b!891241 (= res!603883 (not ((_ is Found!8828) lt!402472)))))

(declare-fun lt!402471 () Unit!30290)

(declare-fun lemmaSeekEntryGivesInRangeIndex!34 (array!52145 array!52147 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 64)) Unit!30290)

(assert (=> b!891241 (= lt!402471 (lemmaSeekEntryGivesInRangeIndex!34 (_keys!9947 thiss!1181) (_values!5254 thiss!1181) (mask!25757 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52145 (_ BitVec 32)) SeekEntryResult!8828)

(assert (=> b!891241 (= lt!402472 (seekEntry!0 key!785 (_keys!9947 thiss!1181) (mask!25757 thiss!1181)))))

(declare-fun array_inv!19760 (array!52145) Bool)

(declare-fun array_inv!19761 (array!52147) Bool)

(assert (=> b!891242 (= e!497317 (and tp!55259 tp_is_empty!18091 (array_inv!19760 (_keys!9947 thiss!1181)) (array_inv!19761 (_values!5254 thiss!1181)) e!497312))))

(declare-fun b!891243 () Bool)

(declare-fun res!603881 () Bool)

(assert (=> b!891243 (=> res!603881 e!497314)))

(assert (=> b!891243 (= res!603881 (or (not (= (size!25526 (_values!5254 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25757 thiss!1181)))) (not (= (size!25525 (_keys!9947 thiss!1181)) (size!25526 (_values!5254 thiss!1181)))) (bvslt (mask!25757 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4963 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4963 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28691 () Bool)

(assert (=> mapIsEmpty!28691 mapRes!28691))

(declare-fun b!891244 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891244 (= e!497315 (inRange!0 (index!37684 lt!402472) (mask!25757 thiss!1181)))))

(declare-fun b!891245 () Bool)

(declare-fun res!603880 () Bool)

(assert (=> b!891245 (=> res!603880 e!497314)))

(declare-datatypes ((List!17752 0))(
  ( (Nil!17749) (Cons!17748 (h!18879 (_ BitVec 64)) (t!25042 List!17752)) )
))
(declare-fun arrayNoDuplicates!0 (array!52145 (_ BitVec 32) List!17752) Bool)

(assert (=> b!891245 (= res!603880 (not (arrayNoDuplicates!0 (_keys!9947 thiss!1181) #b00000000000000000000000000000000 Nil!17749)))))

(declare-fun b!891246 () Bool)

(assert (=> b!891246 (= e!497318 tp_is_empty!18091)))

(declare-fun b!891247 () Bool)

(assert (=> b!891247 (= e!497314 true)))

(declare-fun lt!402475 () Bool)

(assert (=> b!891247 (= lt!402475 (contains!4313 lt!402474 key!785))))

(assert (= (and start!75774 res!603879) b!891238))

(assert (= (and b!891238 res!603882) b!891241))

(assert (= (and b!891241 (not res!603883)) b!891244))

(assert (= (and b!891241 (not res!603885)) b!891237))

(assert (= (and b!891237 (not res!603884)) b!891243))

(assert (= (and b!891243 (not res!603881)) b!891236))

(assert (= (and b!891236 (not res!603878)) b!891245))

(assert (= (and b!891245 (not res!603880)) b!891247))

(assert (= (and b!891240 condMapEmpty!28691) mapIsEmpty!28691))

(assert (= (and b!891240 (not condMapEmpty!28691)) mapNonEmpty!28691))

(assert (= (and mapNonEmpty!28691 ((_ is ValueCellFull!8564) mapValue!28691)) b!891246))

(assert (= (and b!891240 ((_ is ValueCellFull!8564) mapDefault!28691)) b!891239))

(assert (= b!891242 b!891240))

(assert (= start!75774 b!891242))

(declare-fun m!829027 () Bool)

(assert (=> b!891242 m!829027))

(declare-fun m!829029 () Bool)

(assert (=> b!891242 m!829029))

(declare-fun m!829031 () Bool)

(assert (=> start!75774 m!829031))

(declare-fun m!829033 () Bool)

(assert (=> b!891241 m!829033))

(declare-fun m!829035 () Bool)

(assert (=> b!891241 m!829035))

(declare-fun m!829037 () Bool)

(assert (=> b!891244 m!829037))

(declare-fun m!829039 () Bool)

(assert (=> b!891247 m!829039))

(declare-fun m!829041 () Bool)

(assert (=> b!891245 m!829041))

(declare-fun m!829043 () Bool)

(assert (=> mapNonEmpty!28691 m!829043))

(declare-fun m!829045 () Bool)

(assert (=> b!891237 m!829045))

(declare-fun m!829047 () Bool)

(assert (=> b!891237 m!829047))

(declare-fun m!829049 () Bool)

(assert (=> b!891237 m!829049))

(declare-fun m!829051 () Bool)

(assert (=> b!891237 m!829051))

(declare-fun m!829053 () Bool)

(assert (=> b!891237 m!829053))

(declare-fun m!829055 () Bool)

(assert (=> b!891237 m!829055))

(assert (=> b!891237 m!829047))

(declare-fun m!829057 () Bool)

(assert (=> b!891237 m!829057))

(declare-fun m!829059 () Bool)

(assert (=> b!891236 m!829059))

(check-sat b_and!25977 (not start!75774) tp_is_empty!18091 (not b_next!15763) (not b!891236) (not b!891245) (not b!891244) (not b!891237) (not b!891241) (not b!891242) (not mapNonEmpty!28691) (not b!891247))
(check-sat b_and!25977 (not b_next!15763))
