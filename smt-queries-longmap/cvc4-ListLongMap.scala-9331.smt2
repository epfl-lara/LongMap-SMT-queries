; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111426 () Bool)

(assert start!111426)

(declare-fun b_free!30083 () Bool)

(declare-fun b_next!30083 () Bool)

(assert (=> start!111426 (= b_free!30083 (not b_next!30083))))

(declare-fun tp!105725 () Bool)

(declare-fun b_and!48325 () Bool)

(assert (=> start!111426 (= tp!105725 b_and!48325)))

(declare-fun b!1318670 () Bool)

(declare-fun res!875180 () Bool)

(declare-fun e!752463 () Bool)

(assert (=> b!1318670 (=> (not res!875180) (not e!752463))))

(declare-datatypes ((array!88750 0))(
  ( (array!88751 (arr!42849 (Array (_ BitVec 32) (_ BitVec 64))) (size!43399 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88750)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1318670 (= res!875180 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43399 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318671 () Bool)

(declare-fun e!752464 () Bool)

(declare-fun tp_is_empty!35903 () Bool)

(assert (=> b!1318671 (= e!752464 tp_is_empty!35903)))

(declare-fun mapIsEmpty!55502 () Bool)

(declare-fun mapRes!55502 () Bool)

(assert (=> mapIsEmpty!55502 mapRes!55502))

(declare-fun b!1318672 () Bool)

(declare-fun res!875177 () Bool)

(assert (=> b!1318672 (=> (not res!875177) (not e!752463))))

(declare-datatypes ((V!52973 0))(
  ( (V!52974 (val!18026 Int)) )
))
(declare-fun zeroValue!1279 () V!52973)

(declare-datatypes ((ValueCell!17053 0))(
  ( (ValueCellFull!17053 (v!20656 V!52973)) (EmptyCell!17053) )
))
(declare-datatypes ((array!88752 0))(
  ( (array!88753 (arr!42850 (Array (_ BitVec 32) ValueCell!17053)) (size!43400 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88752)

(declare-fun minValue!1279 () V!52973)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23196 0))(
  ( (tuple2!23197 (_1!11609 (_ BitVec 64)) (_2!11609 V!52973)) )
))
(declare-datatypes ((List!30352 0))(
  ( (Nil!30349) (Cons!30348 (h!31557 tuple2!23196) (t!43984 List!30352)) )
))
(declare-datatypes ((ListLongMap!20853 0))(
  ( (ListLongMap!20854 (toList!10442 List!30352)) )
))
(declare-fun contains!8597 (ListLongMap!20853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5455 (array!88750 array!88752 (_ BitVec 32) (_ BitVec 32) V!52973 V!52973 (_ BitVec 32) Int) ListLongMap!20853)

(assert (=> b!1318672 (= res!875177 (contains!8597 (getCurrentListMap!5455 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1318673 () Bool)

(declare-fun e!752460 () Bool)

(assert (=> b!1318673 (= e!752460 tp_is_empty!35903)))

(declare-fun b!1318674 () Bool)

(assert (=> b!1318674 (= e!752463 (not true))))

(declare-fun lt!586508 () ListLongMap!20853)

(assert (=> b!1318674 (contains!8597 lt!586508 k!1164)))

(declare-datatypes ((Unit!43426 0))(
  ( (Unit!43427) )
))
(declare-fun lt!586509 () Unit!43426)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!99 ((_ BitVec 64) (_ BitVec 64) V!52973 ListLongMap!20853) Unit!43426)

(assert (=> b!1318674 (= lt!586509 (lemmaInListMapAfterAddingDiffThenInBefore!99 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586508))))

(declare-fun +!4503 (ListLongMap!20853 tuple2!23196) ListLongMap!20853)

(declare-fun getCurrentListMapNoExtraKeys!6138 (array!88750 array!88752 (_ BitVec 32) (_ BitVec 32) V!52973 V!52973 (_ BitVec 32) Int) ListLongMap!20853)

(declare-fun get!21521 (ValueCell!17053 V!52973) V!52973)

(declare-fun dynLambda!3442 (Int (_ BitVec 64)) V!52973)

(assert (=> b!1318674 (= lt!586508 (+!4503 (+!4503 (getCurrentListMapNoExtraKeys!6138 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23197 (select (arr!42849 _keys!1609) from!2000) (get!21521 (select (arr!42850 _values!1337) from!2000) (dynLambda!3442 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318675 () Bool)

(declare-fun res!875178 () Bool)

(assert (=> b!1318675 (=> (not res!875178) (not e!752463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88750 (_ BitVec 32)) Bool)

(assert (=> b!1318675 (= res!875178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318676 () Bool)

(declare-fun res!875174 () Bool)

(assert (=> b!1318676 (=> (not res!875174) (not e!752463))))

(declare-datatypes ((List!30353 0))(
  ( (Nil!30350) (Cons!30349 (h!31558 (_ BitVec 64)) (t!43985 List!30353)) )
))
(declare-fun arrayNoDuplicates!0 (array!88750 (_ BitVec 32) List!30353) Bool)

(assert (=> b!1318676 (= res!875174 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30350))))

(declare-fun b!1318677 () Bool)

(declare-fun e!752462 () Bool)

(assert (=> b!1318677 (= e!752462 (and e!752464 mapRes!55502))))

(declare-fun condMapEmpty!55502 () Bool)

(declare-fun mapDefault!55502 () ValueCell!17053)

