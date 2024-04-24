; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112106 () Bool)

(assert start!112106)

(declare-fun b_free!30481 () Bool)

(declare-fun b_next!30481 () Bool)

(assert (=> start!112106 (= b_free!30481 (not b_next!30481))))

(declare-fun tp!106922 () Bool)

(declare-fun b_and!49059 () Bool)

(assert (=> start!112106 (= tp!106922 b_and!49059)))

(declare-fun b!1326997 () Bool)

(declare-fun res!880374 () Bool)

(declare-fun e!756549 () Bool)

(assert (=> b!1326997 (=> (not res!880374) (not e!756549))))

(declare-datatypes ((array!89603 0))(
  ( (array!89604 (arr!43270 (Array (_ BitVec 32) (_ BitVec 64))) (size!43821 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89603)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326997 (= res!880374 (not (= (select (arr!43270 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326998 () Bool)

(assert (=> b!1326998 (= e!756549 (not true))))

(declare-datatypes ((V!53505 0))(
  ( (V!53506 (val!18225 Int)) )
))
(declare-datatypes ((tuple2!23542 0))(
  ( (tuple2!23543 (_1!11782 (_ BitVec 64)) (_2!11782 V!53505)) )
))
(declare-datatypes ((List!30692 0))(
  ( (Nil!30689) (Cons!30688 (h!31906 tuple2!23542) (t!44636 List!30692)) )
))
(declare-datatypes ((ListLongMap!21207 0))(
  ( (ListLongMap!21208 (toList!10619 List!30692)) )
))
(declare-fun lt!590302 () ListLongMap!21207)

(declare-fun contains!8787 (ListLongMap!21207 (_ BitVec 64)) Bool)

(assert (=> b!1326998 (contains!8787 lt!590302 k0!1164)))

(declare-datatypes ((Unit!43621 0))(
  ( (Unit!43622) )
))
(declare-fun lt!590303 () Unit!43621)

(declare-fun minValue!1279 () V!53505)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!214 ((_ BitVec 64) (_ BitVec 64) V!53505 ListLongMap!21207) Unit!43621)

(assert (=> b!1326998 (= lt!590303 (lemmaInListMapAfterAddingDiffThenInBefore!214 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590302))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53505)

(declare-datatypes ((ValueCell!17252 0))(
  ( (ValueCellFull!17252 (v!20853 V!53505)) (EmptyCell!17252) )
))
(declare-datatypes ((array!89605 0))(
  ( (array!89606 (arr!43271 (Array (_ BitVec 32) ValueCell!17252)) (size!43822 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89605)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4664 (ListLongMap!21207 tuple2!23542) ListLongMap!21207)

(declare-fun getCurrentListMapNoExtraKeys!6308 (array!89603 array!89605 (_ BitVec 32) (_ BitVec 32) V!53505 V!53505 (_ BitVec 32) Int) ListLongMap!21207)

(declare-fun get!21822 (ValueCell!17252 V!53505) V!53505)

(declare-fun dynLambda!3618 (Int (_ BitVec 64)) V!53505)

(assert (=> b!1326998 (= lt!590302 (+!4664 (+!4664 (getCurrentListMapNoExtraKeys!6308 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23543 (select (arr!43270 _keys!1609) from!2000) (get!21822 (select (arr!43271 _values!1337) from!2000) (dynLambda!3618 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1326999 () Bool)

(declare-fun res!880369 () Bool)

(assert (=> b!1326999 (=> (not res!880369) (not e!756549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326999 (= res!880369 (validKeyInArray!0 (select (arr!43270 _keys!1609) from!2000)))))

(declare-fun b!1327000 () Bool)

(declare-fun e!756547 () Bool)

(declare-fun tp_is_empty!36301 () Bool)

(assert (=> b!1327000 (= e!756547 tp_is_empty!36301)))

(declare-fun b!1327001 () Bool)

(declare-fun res!880372 () Bool)

(assert (=> b!1327001 (=> (not res!880372) (not e!756549))))

(assert (=> b!1327001 (= res!880372 (and (= (size!43822 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43821 _keys!1609) (size!43822 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327002 () Bool)

(declare-fun e!756548 () Bool)

(declare-fun mapRes!56103 () Bool)

(assert (=> b!1327002 (= e!756548 (and e!756547 mapRes!56103))))

(declare-fun condMapEmpty!56103 () Bool)

(declare-fun mapDefault!56103 () ValueCell!17252)

(assert (=> b!1327002 (= condMapEmpty!56103 (= (arr!43271 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17252)) mapDefault!56103)))))

(declare-fun b!1327003 () Bool)

(declare-fun res!880373 () Bool)

(assert (=> b!1327003 (=> (not res!880373) (not e!756549))))

(assert (=> b!1327003 (= res!880373 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43821 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!880370 () Bool)

(assert (=> start!112106 (=> (not res!880370) (not e!756549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112106 (= res!880370 (validMask!0 mask!2019))))

(assert (=> start!112106 e!756549))

(declare-fun array_inv!32927 (array!89603) Bool)

(assert (=> start!112106 (array_inv!32927 _keys!1609)))

(assert (=> start!112106 true))

(assert (=> start!112106 tp_is_empty!36301))

(declare-fun array_inv!32928 (array!89605) Bool)

(assert (=> start!112106 (and (array_inv!32928 _values!1337) e!756548)))

(assert (=> start!112106 tp!106922))

(declare-fun mapIsEmpty!56103 () Bool)

(assert (=> mapIsEmpty!56103 mapRes!56103))

(declare-fun mapNonEmpty!56103 () Bool)

(declare-fun tp!106923 () Bool)

(declare-fun e!756546 () Bool)

(assert (=> mapNonEmpty!56103 (= mapRes!56103 (and tp!106923 e!756546))))

(declare-fun mapRest!56103 () (Array (_ BitVec 32) ValueCell!17252))

(declare-fun mapValue!56103 () ValueCell!17252)

(declare-fun mapKey!56103 () (_ BitVec 32))

(assert (=> mapNonEmpty!56103 (= (arr!43271 _values!1337) (store mapRest!56103 mapKey!56103 mapValue!56103))))

(declare-fun b!1327004 () Bool)

(declare-fun res!880371 () Bool)

(assert (=> b!1327004 (=> (not res!880371) (not e!756549))))

(declare-fun getCurrentListMap!5598 (array!89603 array!89605 (_ BitVec 32) (_ BitVec 32) V!53505 V!53505 (_ BitVec 32) Int) ListLongMap!21207)

(assert (=> b!1327004 (= res!880371 (contains!8787 (getCurrentListMap!5598 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1327005 () Bool)

(declare-fun res!880367 () Bool)

(assert (=> b!1327005 (=> (not res!880367) (not e!756549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89603 (_ BitVec 32)) Bool)

(assert (=> b!1327005 (= res!880367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1327006 () Bool)

(assert (=> b!1327006 (= e!756546 tp_is_empty!36301)))

(declare-fun b!1327007 () Bool)

(declare-fun res!880368 () Bool)

(assert (=> b!1327007 (=> (not res!880368) (not e!756549))))

(declare-datatypes ((List!30693 0))(
  ( (Nil!30690) (Cons!30689 (h!31907 (_ BitVec 64)) (t!44637 List!30693)) )
))
(declare-fun arrayNoDuplicates!0 (array!89603 (_ BitVec 32) List!30693) Bool)

(assert (=> b!1327007 (= res!880368 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30690))))

(assert (= (and start!112106 res!880370) b!1327001))

(assert (= (and b!1327001 res!880372) b!1327005))

(assert (= (and b!1327005 res!880367) b!1327007))

(assert (= (and b!1327007 res!880368) b!1327003))

(assert (= (and b!1327003 res!880373) b!1327004))

(assert (= (and b!1327004 res!880371) b!1326997))

(assert (= (and b!1326997 res!880374) b!1326999))

(assert (= (and b!1326999 res!880369) b!1326998))

(assert (= (and b!1327002 condMapEmpty!56103) mapIsEmpty!56103))

(assert (= (and b!1327002 (not condMapEmpty!56103)) mapNonEmpty!56103))

(get-info :version)

(assert (= (and mapNonEmpty!56103 ((_ is ValueCellFull!17252) mapValue!56103)) b!1327006))

(assert (= (and b!1327002 ((_ is ValueCellFull!17252) mapDefault!56103)) b!1327000))

(assert (= start!112106 b!1327002))

(declare-fun b_lambda!23753 () Bool)

(assert (=> (not b_lambda!23753) (not b!1326998)))

(declare-fun t!44635 () Bool)

(declare-fun tb!11747 () Bool)

(assert (=> (and start!112106 (= defaultEntry!1340 defaultEntry!1340) t!44635) tb!11747))

(declare-fun result!24559 () Bool)

(assert (=> tb!11747 (= result!24559 tp_is_empty!36301)))

(assert (=> b!1326998 t!44635))

(declare-fun b_and!49061 () Bool)

(assert (= b_and!49059 (and (=> t!44635 result!24559) b_and!49061)))

(declare-fun m!1216191 () Bool)

(assert (=> b!1327005 m!1216191))

(declare-fun m!1216193 () Bool)

(assert (=> start!112106 m!1216193))

(declare-fun m!1216195 () Bool)

(assert (=> start!112106 m!1216195))

(declare-fun m!1216197 () Bool)

(assert (=> start!112106 m!1216197))

(declare-fun m!1216199 () Bool)

(assert (=> b!1327004 m!1216199))

(assert (=> b!1327004 m!1216199))

(declare-fun m!1216201 () Bool)

(assert (=> b!1327004 m!1216201))

(declare-fun m!1216203 () Bool)

(assert (=> b!1326997 m!1216203))

(declare-fun m!1216205 () Bool)

(assert (=> mapNonEmpty!56103 m!1216205))

(declare-fun m!1216207 () Bool)

(assert (=> b!1326998 m!1216207))

(declare-fun m!1216209 () Bool)

(assert (=> b!1326998 m!1216209))

(assert (=> b!1326998 m!1216207))

(declare-fun m!1216211 () Bool)

(assert (=> b!1326998 m!1216211))

(declare-fun m!1216213 () Bool)

(assert (=> b!1326998 m!1216213))

(declare-fun m!1216215 () Bool)

(assert (=> b!1326998 m!1216215))

(assert (=> b!1326998 m!1216211))

(declare-fun m!1216217 () Bool)

(assert (=> b!1326998 m!1216217))

(assert (=> b!1326998 m!1216215))

(assert (=> b!1326998 m!1216209))

(declare-fun m!1216219 () Bool)

(assert (=> b!1326998 m!1216219))

(assert (=> b!1326998 m!1216203))

(declare-fun m!1216221 () Bool)

(assert (=> b!1326998 m!1216221))

(declare-fun m!1216223 () Bool)

(assert (=> b!1327007 m!1216223))

(assert (=> b!1326999 m!1216203))

(assert (=> b!1326999 m!1216203))

(declare-fun m!1216225 () Bool)

(assert (=> b!1326999 m!1216225))

(check-sat (not mapNonEmpty!56103) (not b!1326998) (not b_lambda!23753) (not b!1327005) (not start!112106) (not b!1326999) (not b!1327007) (not b_next!30481) (not b!1327004) b_and!49061 tp_is_empty!36301)
(check-sat b_and!49061 (not b_next!30481))
