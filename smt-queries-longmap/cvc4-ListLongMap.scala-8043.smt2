; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99102 () Bool)

(assert start!99102)

(declare-fun b_free!24707 () Bool)

(declare-fun b_next!24707 () Bool)

(assert (=> start!99102 (= b_free!24707 (not b_next!24707))))

(declare-fun tp!86831 () Bool)

(declare-fun b_and!40263 () Bool)

(assert (=> start!99102 (= tp!86831 b_and!40263)))

(declare-fun b!1165678 () Bool)

(declare-fun res!773114 () Bool)

(declare-fun e!662658 () Bool)

(assert (=> b!1165678 (=> (not res!773114) (not e!662658))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165678 (= res!773114 (validMask!0 mask!1564))))

(declare-fun b!1165679 () Bool)

(declare-fun res!773119 () Bool)

(assert (=> b!1165679 (=> (not res!773119) (not e!662658))))

(declare-datatypes ((array!75305 0))(
  ( (array!75306 (arr!36303 (Array (_ BitVec 32) (_ BitVec 64))) (size!36839 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75305)

(declare-datatypes ((List!25450 0))(
  ( (Nil!25447) (Cons!25446 (h!26655 (_ BitVec 64)) (t!37149 List!25450)) )
))
(declare-fun arrayNoDuplicates!0 (array!75305 (_ BitVec 32) List!25450) Bool)

(assert (=> b!1165679 (= res!773119 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25447))))

(declare-fun b!1165680 () Bool)

(declare-fun res!773112 () Bool)

(assert (=> b!1165680 (=> (not res!773112) (not e!662658))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1165680 (= res!773112 (= (select (arr!36303 _keys!1208) i!673) k!934))))

(declare-fun b!1165681 () Bool)

(declare-fun res!773113 () Bool)

(assert (=> b!1165681 (=> (not res!773113) (not e!662658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75305 (_ BitVec 32)) Bool)

(assert (=> b!1165681 (= res!773113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165682 () Bool)

(declare-fun e!662652 () Bool)

(assert (=> b!1165682 (= e!662652 true)))

(declare-datatypes ((V!44109 0))(
  ( (V!44110 (val!14675 Int)) )
))
(declare-fun zeroValue!944 () V!44109)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18714 0))(
  ( (tuple2!18715 (_1!9368 (_ BitVec 64)) (_2!9368 V!44109)) )
))
(declare-datatypes ((List!25451 0))(
  ( (Nil!25448) (Cons!25447 (h!26656 tuple2!18714) (t!37150 List!25451)) )
))
(declare-datatypes ((ListLongMap!16683 0))(
  ( (ListLongMap!16684 (toList!8357 List!25451)) )
))
(declare-fun lt!524979 () ListLongMap!16683)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!524976 () array!75305)

(declare-datatypes ((ValueCell!13909 0))(
  ( (ValueCellFull!13909 (v!17312 V!44109)) (EmptyCell!13909) )
))
(declare-datatypes ((array!75307 0))(
  ( (array!75308 (arr!36304 (Array (_ BitVec 32) ValueCell!13909)) (size!36840 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75307)

(declare-fun minValue!944 () V!44109)

(declare-fun getCurrentListMapNoExtraKeys!4821 (array!75305 array!75307 (_ BitVec 32) (_ BitVec 32) V!44109 V!44109 (_ BitVec 32) Int) ListLongMap!16683)

(declare-fun dynLambda!2811 (Int (_ BitVec 64)) V!44109)

(assert (=> b!1165682 (= lt!524979 (getCurrentListMapNoExtraKeys!4821 lt!524976 (array!75308 (store (arr!36304 _values!996) i!673 (ValueCellFull!13909 (dynLambda!2811 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36840 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524977 () ListLongMap!16683)

(assert (=> b!1165682 (= lt!524977 (getCurrentListMapNoExtraKeys!4821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45680 () Bool)

(declare-fun mapRes!45680 () Bool)

(declare-fun tp!86832 () Bool)

(declare-fun e!662654 () Bool)

(assert (=> mapNonEmpty!45680 (= mapRes!45680 (and tp!86832 e!662654))))

(declare-fun mapKey!45680 () (_ BitVec 32))

(declare-fun mapValue!45680 () ValueCell!13909)

(declare-fun mapRest!45680 () (Array (_ BitVec 32) ValueCell!13909))

(assert (=> mapNonEmpty!45680 (= (arr!36304 _values!996) (store mapRest!45680 mapKey!45680 mapValue!45680))))

(declare-fun b!1165683 () Bool)

(declare-fun tp_is_empty!29237 () Bool)

(assert (=> b!1165683 (= e!662654 tp_is_empty!29237)))

(declare-fun res!773115 () Bool)

(assert (=> start!99102 (=> (not res!773115) (not e!662658))))

(assert (=> start!99102 (= res!773115 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36839 _keys!1208))))))

(assert (=> start!99102 e!662658))

(assert (=> start!99102 tp_is_empty!29237))

(declare-fun array_inv!27764 (array!75305) Bool)

(assert (=> start!99102 (array_inv!27764 _keys!1208)))

(assert (=> start!99102 true))

(assert (=> start!99102 tp!86831))

(declare-fun e!662657 () Bool)

(declare-fun array_inv!27765 (array!75307) Bool)

(assert (=> start!99102 (and (array_inv!27765 _values!996) e!662657)))

(declare-fun b!1165684 () Bool)

(declare-fun e!662655 () Bool)

(assert (=> b!1165684 (= e!662658 e!662655)))

(declare-fun res!773116 () Bool)

(assert (=> b!1165684 (=> (not res!773116) (not e!662655))))

(assert (=> b!1165684 (= res!773116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524976 mask!1564))))

(assert (=> b!1165684 (= lt!524976 (array!75306 (store (arr!36303 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36839 _keys!1208)))))

(declare-fun b!1165685 () Bool)

(declare-fun res!773110 () Bool)

(assert (=> b!1165685 (=> (not res!773110) (not e!662655))))

(assert (=> b!1165685 (= res!773110 (arrayNoDuplicates!0 lt!524976 #b00000000000000000000000000000000 Nil!25447))))

(declare-fun b!1165686 () Bool)

(declare-fun res!773117 () Bool)

(assert (=> b!1165686 (=> (not res!773117) (not e!662658))))

(assert (=> b!1165686 (= res!773117 (and (= (size!36840 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36839 _keys!1208) (size!36840 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165687 () Bool)

(declare-fun res!773118 () Bool)

(assert (=> b!1165687 (=> (not res!773118) (not e!662658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165687 (= res!773118 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!45680 () Bool)

(assert (=> mapIsEmpty!45680 mapRes!45680))

(declare-fun b!1165688 () Bool)

(declare-fun e!662656 () Bool)

(assert (=> b!1165688 (= e!662657 (and e!662656 mapRes!45680))))

(declare-fun condMapEmpty!45680 () Bool)

(declare-fun mapDefault!45680 () ValueCell!13909)

