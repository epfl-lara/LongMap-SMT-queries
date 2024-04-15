; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111512 () Bool)

(assert start!111512)

(declare-fun b_free!30169 () Bool)

(declare-fun b_next!30169 () Bool)

(assert (=> start!111512 (= b_free!30169 (not b_next!30169))))

(declare-fun tp!105984 () Bool)

(declare-fun b_and!48479 () Bool)

(assert (=> start!111512 (= tp!105984 b_and!48479)))

(declare-fun b!1320105 () Bool)

(declare-fun e!753075 () Bool)

(declare-fun tp_is_empty!35989 () Bool)

(assert (=> b!1320105 (= e!753075 tp_is_empty!35989)))

(declare-fun b!1320106 () Bool)

(declare-fun res!876177 () Bool)

(declare-fun e!753072 () Bool)

(assert (=> b!1320106 (=> (not res!876177) (not e!753072))))

(declare-datatypes ((array!88837 0))(
  ( (array!88838 (arr!42893 (Array (_ BitVec 32) (_ BitVec 64))) (size!43445 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88837)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320106 (= res!876177 (validKeyInArray!0 (select (arr!42893 _keys!1609) from!2000)))))

(declare-fun res!876180 () Bool)

(assert (=> start!111512 (=> (not res!876180) (not e!753072))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111512 (= res!876180 (validMask!0 mask!2019))))

(assert (=> start!111512 e!753072))

(declare-fun array_inv!32571 (array!88837) Bool)

(assert (=> start!111512 (array_inv!32571 _keys!1609)))

(assert (=> start!111512 true))

(assert (=> start!111512 tp_is_empty!35989))

(declare-datatypes ((V!53089 0))(
  ( (V!53090 (val!18069 Int)) )
))
(declare-datatypes ((ValueCell!17096 0))(
  ( (ValueCellFull!17096 (v!20698 V!53089)) (EmptyCell!17096) )
))
(declare-datatypes ((array!88839 0))(
  ( (array!88840 (arr!42894 (Array (_ BitVec 32) ValueCell!17096)) (size!43446 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88839)

(declare-fun e!753076 () Bool)

(declare-fun array_inv!32572 (array!88839) Bool)

(assert (=> start!111512 (and (array_inv!32572 _values!1337) e!753076)))

(assert (=> start!111512 tp!105984))

(declare-fun b!1320107 () Bool)

(declare-fun mapRes!55631 () Bool)

(assert (=> b!1320107 (= e!753076 (and e!753075 mapRes!55631))))

(declare-fun condMapEmpty!55631 () Bool)

(declare-fun mapDefault!55631 () ValueCell!17096)

(assert (=> b!1320107 (= condMapEmpty!55631 (= (arr!42894 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17096)) mapDefault!55631)))))

(declare-fun b!1320108 () Bool)

(declare-fun res!876181 () Bool)

(assert (=> b!1320108 (=> (not res!876181) (not e!753072))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320108 (= res!876181 (and (= (size!43446 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43445 _keys!1609) (size!43446 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320109 () Bool)

(declare-fun res!876176 () Bool)

(assert (=> b!1320109 (=> (not res!876176) (not e!753072))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320109 (= res!876176 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43445 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320110 () Bool)

(declare-fun res!876183 () Bool)

(assert (=> b!1320110 (=> (not res!876183) (not e!753072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88837 (_ BitVec 32)) Bool)

(assert (=> b!1320110 (= res!876183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55631 () Bool)

(declare-fun tp!105983 () Bool)

(declare-fun e!753074 () Bool)

(assert (=> mapNonEmpty!55631 (= mapRes!55631 (and tp!105983 e!753074))))

(declare-fun mapRest!55631 () (Array (_ BitVec 32) ValueCell!17096))

(declare-fun mapKey!55631 () (_ BitVec 32))

(declare-fun mapValue!55631 () ValueCell!17096)

(assert (=> mapNonEmpty!55631 (= (arr!42894 _values!1337) (store mapRest!55631 mapKey!55631 mapValue!55631))))

(declare-fun b!1320111 () Bool)

(declare-fun res!876179 () Bool)

(assert (=> b!1320111 (=> (not res!876179) (not e!753072))))

(declare-fun zeroValue!1279 () V!53089)

(declare-fun minValue!1279 () V!53089)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23346 0))(
  ( (tuple2!23347 (_1!11684 (_ BitVec 64)) (_2!11684 V!53089)) )
))
(declare-datatypes ((List!30482 0))(
  ( (Nil!30479) (Cons!30478 (h!31687 tuple2!23346) (t!44192 List!30482)) )
))
(declare-datatypes ((ListLongMap!21003 0))(
  ( (ListLongMap!21004 (toList!10517 List!30482)) )
))
(declare-fun contains!8600 (ListLongMap!21003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5407 (array!88837 array!88839 (_ BitVec 32) (_ BitVec 32) V!53089 V!53089 (_ BitVec 32) Int) ListLongMap!21003)

(assert (=> b!1320111 (= res!876179 (contains!8600 (getCurrentListMap!5407 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320112 () Bool)

(declare-fun res!876182 () Bool)

(assert (=> b!1320112 (=> (not res!876182) (not e!753072))))

(assert (=> b!1320112 (= res!876182 (not (= (select (arr!42893 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320113 () Bool)

(declare-fun res!876178 () Bool)

(assert (=> b!1320113 (=> (not res!876178) (not e!753072))))

(declare-datatypes ((List!30483 0))(
  ( (Nil!30480) (Cons!30479 (h!31688 (_ BitVec 64)) (t!44193 List!30483)) )
))
(declare-fun arrayNoDuplicates!0 (array!88837 (_ BitVec 32) List!30483) Bool)

(assert (=> b!1320113 (= res!876178 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30480))))

(declare-fun b!1320114 () Bool)

(assert (=> b!1320114 (= e!753074 tp_is_empty!35989)))

(declare-fun mapIsEmpty!55631 () Bool)

(assert (=> mapIsEmpty!55631 mapRes!55631))

(declare-fun b!1320115 () Bool)

(assert (=> b!1320115 (= e!753072 (not true))))

(declare-fun lt!586677 () ListLongMap!21003)

(assert (=> b!1320115 (contains!8600 lt!586677 k0!1164)))

(declare-datatypes ((Unit!43309 0))(
  ( (Unit!43310) )
))
(declare-fun lt!586676 () Unit!43309)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!128 ((_ BitVec 64) (_ BitVec 64) V!53089 ListLongMap!21003) Unit!43309)

(assert (=> b!1320115 (= lt!586676 (lemmaInListMapAfterAddingDiffThenInBefore!128 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586677))))

(declare-fun lt!586675 () ListLongMap!21003)

(assert (=> b!1320115 (contains!8600 lt!586675 k0!1164)))

(declare-fun lt!586674 () Unit!43309)

(assert (=> b!1320115 (= lt!586674 (lemmaInListMapAfterAddingDiffThenInBefore!128 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586675))))

(declare-fun +!4563 (ListLongMap!21003 tuple2!23346) ListLongMap!21003)

(assert (=> b!1320115 (= lt!586675 (+!4563 lt!586677 (tuple2!23347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6196 (array!88837 array!88839 (_ BitVec 32) (_ BitVec 32) V!53089 V!53089 (_ BitVec 32) Int) ListLongMap!21003)

(declare-fun get!21578 (ValueCell!17096 V!53089) V!53089)

(declare-fun dynLambda!3493 (Int (_ BitVec 64)) V!53089)

(assert (=> b!1320115 (= lt!586677 (+!4563 (getCurrentListMapNoExtraKeys!6196 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23347 (select (arr!42893 _keys!1609) from!2000) (get!21578 (select (arr!42894 _values!1337) from!2000) (dynLambda!3493 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!111512 res!876180) b!1320108))

(assert (= (and b!1320108 res!876181) b!1320110))

(assert (= (and b!1320110 res!876183) b!1320113))

(assert (= (and b!1320113 res!876178) b!1320109))

(assert (= (and b!1320109 res!876176) b!1320111))

(assert (= (and b!1320111 res!876179) b!1320112))

(assert (= (and b!1320112 res!876182) b!1320106))

(assert (= (and b!1320106 res!876177) b!1320115))

(assert (= (and b!1320107 condMapEmpty!55631) mapIsEmpty!55631))

(assert (= (and b!1320107 (not condMapEmpty!55631)) mapNonEmpty!55631))

(get-info :version)

(assert (= (and mapNonEmpty!55631 ((_ is ValueCellFull!17096) mapValue!55631)) b!1320114))

(assert (= (and b!1320107 ((_ is ValueCellFull!17096) mapDefault!55631)) b!1320105))

(assert (= start!111512 b!1320107))

(declare-fun b_lambda!23485 () Bool)

(assert (=> (not b_lambda!23485) (not b!1320115)))

(declare-fun t!44191 () Bool)

(declare-fun tb!11513 () Bool)

(assert (=> (and start!111512 (= defaultEntry!1340 defaultEntry!1340) t!44191) tb!11513))

(declare-fun result!24089 () Bool)

(assert (=> tb!11513 (= result!24089 tp_is_empty!35989)))

(assert (=> b!1320115 t!44191))

(declare-fun b_and!48481 () Bool)

(assert (= b_and!48479 (and (=> t!44191 result!24089) b_and!48481)))

(declare-fun m!1207335 () Bool)

(assert (=> b!1320106 m!1207335))

(assert (=> b!1320106 m!1207335))

(declare-fun m!1207337 () Bool)

(assert (=> b!1320106 m!1207337))

(declare-fun m!1207339 () Bool)

(assert (=> b!1320111 m!1207339))

(assert (=> b!1320111 m!1207339))

(declare-fun m!1207341 () Bool)

(assert (=> b!1320111 m!1207341))

(declare-fun m!1207343 () Bool)

(assert (=> start!111512 m!1207343))

(declare-fun m!1207345 () Bool)

(assert (=> start!111512 m!1207345))

(declare-fun m!1207347 () Bool)

(assert (=> start!111512 m!1207347))

(declare-fun m!1207349 () Bool)

(assert (=> mapNonEmpty!55631 m!1207349))

(assert (=> b!1320112 m!1207335))

(declare-fun m!1207351 () Bool)

(assert (=> b!1320110 m!1207351))

(declare-fun m!1207353 () Bool)

(assert (=> b!1320115 m!1207353))

(declare-fun m!1207355 () Bool)

(assert (=> b!1320115 m!1207355))

(assert (=> b!1320115 m!1207353))

(declare-fun m!1207357 () Bool)

(assert (=> b!1320115 m!1207357))

(declare-fun m!1207359 () Bool)

(assert (=> b!1320115 m!1207359))

(declare-fun m!1207361 () Bool)

(assert (=> b!1320115 m!1207361))

(declare-fun m!1207363 () Bool)

(assert (=> b!1320115 m!1207363))

(assert (=> b!1320115 m!1207363))

(assert (=> b!1320115 m!1207355))

(declare-fun m!1207365 () Bool)

(assert (=> b!1320115 m!1207365))

(declare-fun m!1207367 () Bool)

(assert (=> b!1320115 m!1207367))

(assert (=> b!1320115 m!1207335))

(declare-fun m!1207369 () Bool)

(assert (=> b!1320115 m!1207369))

(declare-fun m!1207371 () Bool)

(assert (=> b!1320115 m!1207371))

(declare-fun m!1207373 () Bool)

(assert (=> b!1320113 m!1207373))

(check-sat (not b!1320106) (not b_next!30169) (not start!111512) (not b!1320113) (not mapNonEmpty!55631) b_and!48481 (not b!1320111) tp_is_empty!35989 (not b!1320115) (not b!1320110) (not b_lambda!23485))
(check-sat b_and!48481 (not b_next!30169))
