; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97776 () Bool)

(assert start!97776)

(declare-fun b_free!23477 () Bool)

(declare-fun b_next!23477 () Bool)

(assert (=> start!97776 (= b_free!23477 (not b_next!23477))))

(declare-fun tp!83134 () Bool)

(declare-fun b_and!37751 () Bool)

(assert (=> start!97776 (= tp!83134 b_and!37751)))

(declare-fun b!1118432 () Bool)

(declare-fun res!746990 () Bool)

(declare-fun e!637044 () Bool)

(assert (=> b!1118432 (=> (not res!746990) (not e!637044))))

(declare-datatypes ((array!72905 0))(
  ( (array!72906 (arr!35105 (Array (_ BitVec 32) (_ BitVec 64))) (size!35641 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72905)

(declare-datatypes ((List!24420 0))(
  ( (Nil!24417) (Cons!24416 (h!25625 (_ BitVec 64)) (t!34901 List!24420)) )
))
(declare-fun arrayNoDuplicates!0 (array!72905 (_ BitVec 32) List!24420) Bool)

(assert (=> b!1118432 (= res!746990 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24417))))

(declare-fun b!1118433 () Bool)

(declare-fun e!637045 () Bool)

(declare-fun tp_is_empty!28007 () Bool)

(assert (=> b!1118433 (= e!637045 tp_is_empty!28007)))

(declare-fun b!1118434 () Bool)

(declare-fun e!637047 () Bool)

(declare-fun e!637049 () Bool)

(assert (=> b!1118434 (= e!637047 (not e!637049))))

(declare-fun res!746986 () Bool)

(assert (=> b!1118434 (=> res!746986 e!637049)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118434 (= res!746986 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118434 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36708 0))(
  ( (Unit!36709) )
))
(declare-fun lt!497494 () Unit!36708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72905 (_ BitVec 64) (_ BitVec 32)) Unit!36708)

(assert (=> b!1118434 (= lt!497494 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118435 () Bool)

(declare-fun res!746987 () Bool)

(assert (=> b!1118435 (=> (not res!746987) (not e!637044))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118435 (= res!746987 (validMask!0 mask!1564))))

(declare-fun b!1118436 () Bool)

(assert (=> b!1118436 (= e!637049 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42469 0))(
  ( (V!42470 (val!14060 Int)) )
))
(declare-datatypes ((tuple2!17634 0))(
  ( (tuple2!17635 (_1!8828 (_ BitVec 64)) (_2!8828 V!42469)) )
))
(declare-datatypes ((List!24421 0))(
  ( (Nil!24418) (Cons!24417 (h!25626 tuple2!17634) (t!34902 List!24421)) )
))
(declare-datatypes ((ListLongMap!15603 0))(
  ( (ListLongMap!15604 (toList!7817 List!24421)) )
))
(declare-fun lt!497493 () ListLongMap!15603)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13294 0))(
  ( (ValueCellFull!13294 (v!16693 V!42469)) (EmptyCell!13294) )
))
(declare-datatypes ((array!72907 0))(
  ( (array!72908 (arr!35106 (Array (_ BitVec 32) ValueCell!13294)) (size!35642 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72907)

(declare-fun minValue!944 () V!42469)

(declare-fun zeroValue!944 () V!42469)

(declare-fun getCurrentListMapNoExtraKeys!4307 (array!72905 array!72907 (_ BitVec 32) (_ BitVec 32) V!42469 V!42469 (_ BitVec 32) Int) ListLongMap!15603)

(assert (=> b!1118436 (= lt!497493 (getCurrentListMapNoExtraKeys!4307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43828 () Bool)

(declare-fun mapRes!43828 () Bool)

(declare-fun tp!83135 () Bool)

(assert (=> mapNonEmpty!43828 (= mapRes!43828 (and tp!83135 e!637045))))

(declare-fun mapRest!43828 () (Array (_ BitVec 32) ValueCell!13294))

(declare-fun mapValue!43828 () ValueCell!13294)

(declare-fun mapKey!43828 () (_ BitVec 32))

(assert (=> mapNonEmpty!43828 (= (arr!35106 _values!996) (store mapRest!43828 mapKey!43828 mapValue!43828))))

(declare-fun b!1118437 () Bool)

(declare-fun e!637048 () Bool)

(assert (=> b!1118437 (= e!637048 tp_is_empty!28007)))

(declare-fun b!1118438 () Bool)

(declare-fun res!746985 () Bool)

(assert (=> b!1118438 (=> (not res!746985) (not e!637044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118438 (= res!746985 (validKeyInArray!0 k!934))))

(declare-fun res!746991 () Bool)

(assert (=> start!97776 (=> (not res!746991) (not e!637044))))

(assert (=> start!97776 (= res!746991 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35641 _keys!1208))))))

(assert (=> start!97776 e!637044))

(assert (=> start!97776 tp_is_empty!28007))

(declare-fun array_inv!26972 (array!72905) Bool)

(assert (=> start!97776 (array_inv!26972 _keys!1208)))

(assert (=> start!97776 true))

(assert (=> start!97776 tp!83134))

(declare-fun e!637050 () Bool)

(declare-fun array_inv!26973 (array!72907) Bool)

(assert (=> start!97776 (and (array_inv!26973 _values!996) e!637050)))

(declare-fun b!1118439 () Bool)

(declare-fun res!746992 () Bool)

(assert (=> b!1118439 (=> (not res!746992) (not e!637047))))

(declare-fun lt!497495 () array!72905)

(assert (=> b!1118439 (= res!746992 (arrayNoDuplicates!0 lt!497495 #b00000000000000000000000000000000 Nil!24417))))

(declare-fun b!1118440 () Bool)

(declare-fun res!746989 () Bool)

(assert (=> b!1118440 (=> (not res!746989) (not e!637044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72905 (_ BitVec 32)) Bool)

(assert (=> b!1118440 (= res!746989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118441 () Bool)

(declare-fun res!746993 () Bool)

(assert (=> b!1118441 (=> (not res!746993) (not e!637044))))

(assert (=> b!1118441 (= res!746993 (= (select (arr!35105 _keys!1208) i!673) k!934))))

(declare-fun b!1118442 () Bool)

(declare-fun res!746988 () Bool)

(assert (=> b!1118442 (=> (not res!746988) (not e!637044))))

(assert (=> b!1118442 (= res!746988 (and (= (size!35642 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35641 _keys!1208) (size!35642 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118443 () Bool)

(declare-fun res!746994 () Bool)

(assert (=> b!1118443 (=> (not res!746994) (not e!637044))))

(assert (=> b!1118443 (= res!746994 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35641 _keys!1208))))))

(declare-fun b!1118444 () Bool)

(assert (=> b!1118444 (= e!637044 e!637047)))

(declare-fun res!746995 () Bool)

(assert (=> b!1118444 (=> (not res!746995) (not e!637047))))

(assert (=> b!1118444 (= res!746995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497495 mask!1564))))

(assert (=> b!1118444 (= lt!497495 (array!72906 (store (arr!35105 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35641 _keys!1208)))))

(declare-fun b!1118445 () Bool)

(assert (=> b!1118445 (= e!637050 (and e!637048 mapRes!43828))))

(declare-fun condMapEmpty!43828 () Bool)

(declare-fun mapDefault!43828 () ValueCell!13294)

