; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111690 () Bool)

(assert start!111690)

(declare-fun b_free!30347 () Bool)

(declare-fun b_next!30347 () Bool)

(assert (=> start!111690 (= b_free!30347 (not b_next!30347))))

(declare-fun tp!106517 () Bool)

(declare-fun b_and!48853 () Bool)

(assert (=> start!111690 (= tp!106517 b_and!48853)))

(declare-fun mapIsEmpty!55898 () Bool)

(declare-fun mapRes!55898 () Bool)

(assert (=> mapIsEmpty!55898 mapRes!55898))

(declare-fun mapNonEmpty!55898 () Bool)

(declare-fun tp!106516 () Bool)

(declare-fun e!754444 () Bool)

(assert (=> mapNonEmpty!55898 (= mapRes!55898 (and tp!106516 e!754444))))

(declare-fun mapKey!55898 () (_ BitVec 32))

(declare-datatypes ((V!53325 0))(
  ( (V!53326 (val!18158 Int)) )
))
(declare-datatypes ((ValueCell!17185 0))(
  ( (ValueCellFull!17185 (v!20788 V!53325)) (EmptyCell!17185) )
))
(declare-fun mapRest!55898 () (Array (_ BitVec 32) ValueCell!17185))

(declare-datatypes ((array!89252 0))(
  ( (array!89253 (arr!43100 (Array (_ BitVec 32) ValueCell!17185)) (size!43650 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89252)

(declare-fun mapValue!55898 () ValueCell!17185)

(assert (=> mapNonEmpty!55898 (= (arr!43100 _values!1337) (store mapRest!55898 mapKey!55898 mapValue!55898))))

(declare-fun b!1323290 () Bool)

(declare-fun res!878347 () Bool)

(declare-fun e!754440 () Bool)

(assert (=> b!1323290 (=> (not res!878347) (not e!754440))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89254 0))(
  ( (array!89255 (arr!43101 (Array (_ BitVec 32) (_ BitVec 64))) (size!43651 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89254)

(assert (=> b!1323290 (= res!878347 (and (= (size!43650 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43651 _keys!1609) (size!43650 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323291 () Bool)

(declare-fun res!878348 () Bool)

(assert (=> b!1323291 (=> (not res!878348) (not e!754440))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1323291 (= res!878348 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43651 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323292 () Bool)

(declare-fun res!878344 () Bool)

(assert (=> b!1323292 (=> (not res!878344) (not e!754440))))

(declare-datatypes ((List!30546 0))(
  ( (Nil!30543) (Cons!30542 (h!31751 (_ BitVec 64)) (t!44442 List!30546)) )
))
(declare-fun arrayNoDuplicates!0 (array!89254 (_ BitVec 32) List!30546) Bool)

(assert (=> b!1323292 (= res!878344 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30543))))

(declare-fun b!1323293 () Bool)

(declare-fun res!878341 () Bool)

(assert (=> b!1323293 (=> (not res!878341) (not e!754440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89254 (_ BitVec 32)) Bool)

(assert (=> b!1323293 (= res!878341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323294 () Bool)

(declare-fun res!878342 () Bool)

(assert (=> b!1323294 (=> (not res!878342) (not e!754440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323294 (= res!878342 (validKeyInArray!0 (select (arr!43101 _keys!1609) from!2000)))))

(declare-fun b!1323295 () Bool)

(declare-fun res!878346 () Bool)

(assert (=> b!1323295 (=> (not res!878346) (not e!754440))))

(declare-fun zeroValue!1279 () V!53325)

(declare-fun minValue!1279 () V!53325)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23404 0))(
  ( (tuple2!23405 (_1!11713 (_ BitVec 64)) (_2!11713 V!53325)) )
))
(declare-datatypes ((List!30547 0))(
  ( (Nil!30544) (Cons!30543 (h!31752 tuple2!23404) (t!44443 List!30547)) )
))
(declare-datatypes ((ListLongMap!21061 0))(
  ( (ListLongMap!21062 (toList!10546 List!30547)) )
))
(declare-fun contains!8701 (ListLongMap!21061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5543 (array!89254 array!89252 (_ BitVec 32) (_ BitVec 32) V!53325 V!53325 (_ BitVec 32) Int) ListLongMap!21061)

(assert (=> b!1323295 (= res!878346 (contains!8701 (getCurrentListMap!5543 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!878345 () Bool)

(assert (=> start!111690 (=> (not res!878345) (not e!754440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111690 (= res!878345 (validMask!0 mask!2019))))

(assert (=> start!111690 e!754440))

(declare-fun array_inv!32539 (array!89254) Bool)

(assert (=> start!111690 (array_inv!32539 _keys!1609)))

(assert (=> start!111690 true))

(declare-fun tp_is_empty!36167 () Bool)

(assert (=> start!111690 tp_is_empty!36167))

(declare-fun e!754441 () Bool)

(declare-fun array_inv!32540 (array!89252) Bool)

(assert (=> start!111690 (and (array_inv!32540 _values!1337) e!754441)))

(assert (=> start!111690 tp!106517))

(declare-fun b!1323296 () Bool)

(assert (=> b!1323296 (= e!754440 (not true))))

(declare-fun lt!588896 () ListLongMap!21061)

(declare-fun +!4598 (ListLongMap!21061 tuple2!23404) ListLongMap!21061)

(assert (=> b!1323296 (contains!8701 (+!4598 lt!588896 (tuple2!23405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43616 0))(
  ( (Unit!43617) )
))
(declare-fun lt!588901 () Unit!43616)

(declare-fun addStillContains!1147 (ListLongMap!21061 (_ BitVec 64) V!53325 (_ BitVec 64)) Unit!43616)

(assert (=> b!1323296 (= lt!588901 (addStillContains!1147 lt!588896 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323296 (contains!8701 lt!588896 k!1164)))

(declare-fun lt!588898 () ListLongMap!21061)

(declare-fun lt!588897 () tuple2!23404)

(assert (=> b!1323296 (= lt!588896 (+!4598 lt!588898 lt!588897))))

(declare-fun lt!588900 () Unit!43616)

(assert (=> b!1323296 (= lt!588900 (addStillContains!1147 lt!588898 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323296 (contains!8701 lt!588898 k!1164)))

(declare-fun lt!588902 () V!53325)

(declare-fun lt!588899 () Unit!43616)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!194 ((_ BitVec 64) (_ BitVec 64) V!53325 ListLongMap!21061) Unit!43616)

(assert (=> b!1323296 (= lt!588899 (lemmaInListMapAfterAddingDiffThenInBefore!194 k!1164 (select (arr!43101 _keys!1609) from!2000) lt!588902 lt!588898))))

(declare-fun lt!588894 () ListLongMap!21061)

(assert (=> b!1323296 (contains!8701 lt!588894 k!1164)))

(declare-fun lt!588893 () Unit!43616)

(assert (=> b!1323296 (= lt!588893 (lemmaInListMapAfterAddingDiffThenInBefore!194 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588894))))

(declare-fun lt!588895 () ListLongMap!21061)

(assert (=> b!1323296 (contains!8701 lt!588895 k!1164)))

(declare-fun lt!588903 () Unit!43616)

(assert (=> b!1323296 (= lt!588903 (lemmaInListMapAfterAddingDiffThenInBefore!194 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588895))))

(assert (=> b!1323296 (= lt!588895 (+!4598 lt!588894 lt!588897))))

(assert (=> b!1323296 (= lt!588897 (tuple2!23405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323296 (= lt!588894 (+!4598 lt!588898 (tuple2!23405 (select (arr!43101 _keys!1609) from!2000) lt!588902)))))

(declare-fun get!21704 (ValueCell!17185 V!53325) V!53325)

(declare-fun dynLambda!3537 (Int (_ BitVec 64)) V!53325)

(assert (=> b!1323296 (= lt!588902 (get!21704 (select (arr!43100 _values!1337) from!2000) (dynLambda!3537 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6233 (array!89254 array!89252 (_ BitVec 32) (_ BitVec 32) V!53325 V!53325 (_ BitVec 32) Int) ListLongMap!21061)

(assert (=> b!1323296 (= lt!588898 (getCurrentListMapNoExtraKeys!6233 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323297 () Bool)

(declare-fun res!878343 () Bool)

(assert (=> b!1323297 (=> (not res!878343) (not e!754440))))

(assert (=> b!1323297 (= res!878343 (not (= (select (arr!43101 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1323298 () Bool)

(declare-fun e!754442 () Bool)

(assert (=> b!1323298 (= e!754442 tp_is_empty!36167)))

(declare-fun b!1323299 () Bool)

(assert (=> b!1323299 (= e!754444 tp_is_empty!36167)))

(declare-fun b!1323300 () Bool)

(assert (=> b!1323300 (= e!754441 (and e!754442 mapRes!55898))))

(declare-fun condMapEmpty!55898 () Bool)

(declare-fun mapDefault!55898 () ValueCell!17185)

