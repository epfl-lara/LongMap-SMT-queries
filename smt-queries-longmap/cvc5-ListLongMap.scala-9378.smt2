; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111704 () Bool)

(assert start!111704)

(declare-fun b_free!30361 () Bool)

(declare-fun b_next!30361 () Bool)

(assert (=> start!111704 (= b_free!30361 (not b_next!30361))))

(declare-fun tp!106559 () Bool)

(declare-fun b_and!48881 () Bool)

(assert (=> start!111704 (= tp!106559 b_and!48881)))

(declare-fun mapNonEmpty!55919 () Bool)

(declare-fun mapRes!55919 () Bool)

(declare-fun tp!106558 () Bool)

(declare-fun e!754546 () Bool)

(assert (=> mapNonEmpty!55919 (= mapRes!55919 (and tp!106558 e!754546))))

(declare-datatypes ((V!53345 0))(
  ( (V!53346 (val!18165 Int)) )
))
(declare-datatypes ((ValueCell!17192 0))(
  ( (ValueCellFull!17192 (v!20795 V!53345)) (EmptyCell!17192) )
))
(declare-fun mapRest!55919 () (Array (_ BitVec 32) ValueCell!17192))

(declare-datatypes ((array!89278 0))(
  ( (array!89279 (arr!43113 (Array (_ BitVec 32) ValueCell!17192)) (size!43663 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89278)

(declare-fun mapValue!55919 () ValueCell!17192)

(declare-fun mapKey!55919 () (_ BitVec 32))

(assert (=> mapNonEmpty!55919 (= (arr!43113 _values!1337) (store mapRest!55919 mapKey!55919 mapValue!55919))))

(declare-fun b!1323535 () Bool)

(declare-fun res!878516 () Bool)

(declare-fun e!754545 () Bool)

(assert (=> b!1323535 (=> (not res!878516) (not e!754545))))

(declare-datatypes ((array!89280 0))(
  ( (array!89281 (arr!43114 (Array (_ BitVec 32) (_ BitVec 64))) (size!43664 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89280)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1323535 (= res!878516 (not (= (select (arr!43114 _keys!1609) from!2000) k!1164)))))

(declare-fun res!878509 () Bool)

(assert (=> start!111704 (=> (not res!878509) (not e!754545))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111704 (= res!878509 (validMask!0 mask!2019))))

(assert (=> start!111704 e!754545))

(declare-fun array_inv!32549 (array!89280) Bool)

(assert (=> start!111704 (array_inv!32549 _keys!1609)))

(assert (=> start!111704 true))

(declare-fun tp_is_empty!36181 () Bool)

(assert (=> start!111704 tp_is_empty!36181))

(declare-fun e!754548 () Bool)

(declare-fun array_inv!32550 (array!89278) Bool)

(assert (=> start!111704 (and (array_inv!32550 _values!1337) e!754548)))

(assert (=> start!111704 tp!106559))

(declare-fun b!1323536 () Bool)

(declare-fun res!878513 () Bool)

(assert (=> b!1323536 (=> (not res!878513) (not e!754545))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53345)

(declare-fun minValue!1279 () V!53345)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23416 0))(
  ( (tuple2!23417 (_1!11719 (_ BitVec 64)) (_2!11719 V!53345)) )
))
(declare-datatypes ((List!30558 0))(
  ( (Nil!30555) (Cons!30554 (h!31763 tuple2!23416) (t!44468 List!30558)) )
))
(declare-datatypes ((ListLongMap!21073 0))(
  ( (ListLongMap!21074 (toList!10552 List!30558)) )
))
(declare-fun contains!8707 (ListLongMap!21073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5549 (array!89280 array!89278 (_ BitVec 32) (_ BitVec 32) V!53345 V!53345 (_ BitVec 32) Int) ListLongMap!21073)

(assert (=> b!1323536 (= res!878513 (contains!8707 (getCurrentListMap!5549 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323537 () Bool)

(declare-fun res!878514 () Bool)

(assert (=> b!1323537 (=> (not res!878514) (not e!754545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89280 (_ BitVec 32)) Bool)

(assert (=> b!1323537 (= res!878514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323538 () Bool)

(declare-fun res!878515 () Bool)

(assert (=> b!1323538 (=> (not res!878515) (not e!754545))))

(assert (=> b!1323538 (= res!878515 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43664 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323539 () Bool)

(assert (=> b!1323539 (= e!754545 (not true))))

(declare-fun lt!589133 () ListLongMap!21073)

(declare-fun +!4603 (ListLongMap!21073 tuple2!23416) ListLongMap!21073)

(assert (=> b!1323539 (contains!8707 (+!4603 lt!589133 (tuple2!23417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43626 0))(
  ( (Unit!43627) )
))
(declare-fun lt!589125 () Unit!43626)

(declare-fun addStillContains!1152 (ListLongMap!21073 (_ BitVec 64) V!53345 (_ BitVec 64)) Unit!43626)

(assert (=> b!1323539 (= lt!589125 (addStillContains!1152 lt!589133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323539 (contains!8707 lt!589133 k!1164)))

(declare-fun lt!589126 () ListLongMap!21073)

(declare-fun lt!589127 () tuple2!23416)

(assert (=> b!1323539 (= lt!589133 (+!4603 lt!589126 lt!589127))))

(declare-fun lt!589130 () Unit!43626)

(assert (=> b!1323539 (= lt!589130 (addStillContains!1152 lt!589126 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323539 (contains!8707 lt!589126 k!1164)))

(declare-fun lt!589132 () V!53345)

(declare-fun lt!589131 () Unit!43626)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!199 ((_ BitVec 64) (_ BitVec 64) V!53345 ListLongMap!21073) Unit!43626)

(assert (=> b!1323539 (= lt!589131 (lemmaInListMapAfterAddingDiffThenInBefore!199 k!1164 (select (arr!43114 _keys!1609) from!2000) lt!589132 lt!589126))))

(declare-fun lt!589134 () ListLongMap!21073)

(assert (=> b!1323539 (contains!8707 lt!589134 k!1164)))

(declare-fun lt!589124 () Unit!43626)

(assert (=> b!1323539 (= lt!589124 (lemmaInListMapAfterAddingDiffThenInBefore!199 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589134))))

(declare-fun lt!589128 () ListLongMap!21073)

(assert (=> b!1323539 (contains!8707 lt!589128 k!1164)))

(declare-fun lt!589129 () Unit!43626)

(assert (=> b!1323539 (= lt!589129 (lemmaInListMapAfterAddingDiffThenInBefore!199 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589128))))

(assert (=> b!1323539 (= lt!589128 (+!4603 lt!589134 lt!589127))))

(assert (=> b!1323539 (= lt!589127 (tuple2!23417 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323539 (= lt!589134 (+!4603 lt!589126 (tuple2!23417 (select (arr!43114 _keys!1609) from!2000) lt!589132)))))

(declare-fun get!21715 (ValueCell!17192 V!53345) V!53345)

(declare-fun dynLambda!3542 (Int (_ BitVec 64)) V!53345)

(assert (=> b!1323539 (= lt!589132 (get!21715 (select (arr!43113 _values!1337) from!2000) (dynLambda!3542 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6238 (array!89280 array!89278 (_ BitVec 32) (_ BitVec 32) V!53345 V!53345 (_ BitVec 32) Int) ListLongMap!21073)

(assert (=> b!1323539 (= lt!589126 (getCurrentListMapNoExtraKeys!6238 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323540 () Bool)

(assert (=> b!1323540 (= e!754546 tp_is_empty!36181)))

(declare-fun b!1323541 () Bool)

(declare-fun res!878512 () Bool)

(assert (=> b!1323541 (=> (not res!878512) (not e!754545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323541 (= res!878512 (validKeyInArray!0 (select (arr!43114 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55919 () Bool)

(assert (=> mapIsEmpty!55919 mapRes!55919))

(declare-fun b!1323542 () Bool)

(declare-fun res!878511 () Bool)

(assert (=> b!1323542 (=> (not res!878511) (not e!754545))))

(declare-datatypes ((List!30559 0))(
  ( (Nil!30556) (Cons!30555 (h!31764 (_ BitVec 64)) (t!44469 List!30559)) )
))
(declare-fun arrayNoDuplicates!0 (array!89280 (_ BitVec 32) List!30559) Bool)

(assert (=> b!1323542 (= res!878511 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30556))))

(declare-fun b!1323543 () Bool)

(declare-fun res!878510 () Bool)

(assert (=> b!1323543 (=> (not res!878510) (not e!754545))))

(assert (=> b!1323543 (= res!878510 (and (= (size!43663 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43664 _keys!1609) (size!43663 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323544 () Bool)

(declare-fun e!754547 () Bool)

(assert (=> b!1323544 (= e!754547 tp_is_empty!36181)))

(declare-fun b!1323545 () Bool)

(assert (=> b!1323545 (= e!754548 (and e!754547 mapRes!55919))))

(declare-fun condMapEmpty!55919 () Bool)

(declare-fun mapDefault!55919 () ValueCell!17192)

