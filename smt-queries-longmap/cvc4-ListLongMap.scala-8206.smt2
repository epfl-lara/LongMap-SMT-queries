; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100106 () Bool)

(assert start!100106)

(declare-fun b_free!25679 () Bool)

(declare-fun b_next!25679 () Bool)

(assert (=> start!100106 (= b_free!25679 (not b_next!25679))))

(declare-fun tp!89760 () Bool)

(declare-fun b_and!42225 () Bool)

(assert (=> start!100106 (= tp!89760 b_and!42225)))

(declare-fun b!1193757 () Bool)

(declare-fun e!678447 () Bool)

(declare-fun e!678448 () Bool)

(assert (=> b!1193757 (= e!678447 e!678448)))

(declare-fun res!794248 () Bool)

(assert (=> b!1193757 (=> (not res!794248) (not e!678448))))

(declare-datatypes ((array!77209 0))(
  ( (array!77210 (arr!37254 (Array (_ BitVec 32) (_ BitVec 64))) (size!37790 (_ BitVec 32))) )
))
(declare-fun lt!542675 () array!77209)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77209 (_ BitVec 32)) Bool)

(assert (=> b!1193757 (= res!794248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542675 mask!1564))))

(declare-fun _keys!1208 () array!77209)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193757 (= lt!542675 (array!77210 (store (arr!37254 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37790 _keys!1208)))))

(declare-fun mapIsEmpty!47150 () Bool)

(declare-fun mapRes!47150 () Bool)

(assert (=> mapIsEmpty!47150 mapRes!47150))

(declare-fun b!1193758 () Bool)

(declare-fun e!678443 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1193758 (= e!678443 (or (= from!1455 i!673) (bvslt from!1455 i!673)))))

(declare-datatypes ((V!45413 0))(
  ( (V!45414 (val!15164 Int)) )
))
(declare-fun zeroValue!944 () V!45413)

(declare-datatypes ((tuple2!19494 0))(
  ( (tuple2!19495 (_1!9758 (_ BitVec 64)) (_2!9758 V!45413)) )
))
(declare-datatypes ((List!26242 0))(
  ( (Nil!26239) (Cons!26238 (h!27447 tuple2!19494) (t!38913 List!26242)) )
))
(declare-datatypes ((ListLongMap!17463 0))(
  ( (ListLongMap!17464 (toList!8747 List!26242)) )
))
(declare-fun lt!542676 () ListLongMap!17463)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14398 0))(
  ( (ValueCellFull!14398 (v!17802 V!45413)) (EmptyCell!14398) )
))
(declare-datatypes ((array!77211 0))(
  ( (array!77212 (arr!37255 (Array (_ BitVec 32) ValueCell!14398)) (size!37791 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77211)

(declare-fun minValue!944 () V!45413)

(declare-fun getCurrentListMapNoExtraKeys!5188 (array!77209 array!77211 (_ BitVec 32) (_ BitVec 32) V!45413 V!45413 (_ BitVec 32) Int) ListLongMap!17463)

(declare-fun dynLambda!3115 (Int (_ BitVec 64)) V!45413)

(assert (=> b!1193758 (= lt!542676 (getCurrentListMapNoExtraKeys!5188 lt!542675 (array!77212 (store (arr!37255 _values!996) i!673 (ValueCellFull!14398 (dynLambda!3115 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37791 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!542674 () ListLongMap!17463)

(assert (=> b!1193758 (= lt!542674 (getCurrentListMapNoExtraKeys!5188 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!794239 () Bool)

(assert (=> start!100106 (=> (not res!794239) (not e!678447))))

(assert (=> start!100106 (= res!794239 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37790 _keys!1208))))))

(assert (=> start!100106 e!678447))

(declare-fun tp_is_empty!30215 () Bool)

(assert (=> start!100106 tp_is_empty!30215))

(declare-fun array_inv!28404 (array!77209) Bool)

(assert (=> start!100106 (array_inv!28404 _keys!1208)))

(assert (=> start!100106 true))

(assert (=> start!100106 tp!89760))

(declare-fun e!678444 () Bool)

(declare-fun array_inv!28405 (array!77211) Bool)

(assert (=> start!100106 (and (array_inv!28405 _values!996) e!678444)))

(declare-fun b!1193759 () Bool)

(declare-fun res!794245 () Bool)

(assert (=> b!1193759 (=> (not res!794245) (not e!678448))))

(declare-datatypes ((List!26243 0))(
  ( (Nil!26240) (Cons!26239 (h!27448 (_ BitVec 64)) (t!38914 List!26243)) )
))
(declare-fun arrayNoDuplicates!0 (array!77209 (_ BitVec 32) List!26243) Bool)

(assert (=> b!1193759 (= res!794245 (arrayNoDuplicates!0 lt!542675 #b00000000000000000000000000000000 Nil!26240))))

(declare-fun b!1193760 () Bool)

(declare-fun res!794244 () Bool)

(assert (=> b!1193760 (=> (not res!794244) (not e!678447))))

(assert (=> b!1193760 (= res!794244 (and (= (size!37791 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37790 _keys!1208) (size!37791 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193761 () Bool)

(declare-fun res!794247 () Bool)

(assert (=> b!1193761 (=> (not res!794247) (not e!678447))))

(assert (=> b!1193761 (= res!794247 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26240))))

(declare-fun b!1193762 () Bool)

(declare-fun res!794242 () Bool)

(assert (=> b!1193762 (=> (not res!794242) (not e!678447))))

(assert (=> b!1193762 (= res!794242 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37790 _keys!1208))))))

(declare-fun b!1193763 () Bool)

(assert (=> b!1193763 (= e!678448 (not e!678443))))

(declare-fun res!794243 () Bool)

(assert (=> b!1193763 (=> res!794243 e!678443)))

(assert (=> b!1193763 (= res!794243 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193763 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39602 0))(
  ( (Unit!39603) )
))
(declare-fun lt!542673 () Unit!39602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77209 (_ BitVec 64) (_ BitVec 32)) Unit!39602)

(assert (=> b!1193763 (= lt!542673 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1193764 () Bool)

(declare-fun e!678446 () Bool)

(assert (=> b!1193764 (= e!678444 (and e!678446 mapRes!47150))))

(declare-fun condMapEmpty!47150 () Bool)

(declare-fun mapDefault!47150 () ValueCell!14398)

