; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99072 () Bool)

(assert start!99072)

(declare-fun b_free!24677 () Bool)

(declare-fun b_next!24677 () Bool)

(assert (=> start!99072 (= b_free!24677 (not b_next!24677))))

(declare-fun tp!86741 () Bool)

(declare-fun b_and!40203 () Bool)

(assert (=> start!99072 (= tp!86741 b_and!40203)))

(declare-fun b!1165018 () Bool)

(declare-fun e!662337 () Bool)

(declare-fun e!662342 () Bool)

(assert (=> b!1165018 (= e!662337 (not e!662342))))

(declare-fun res!772617 () Bool)

(assert (=> b!1165018 (=> res!772617 e!662342)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165018 (= res!772617 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75245 0))(
  ( (array!75246 (arr!36273 (Array (_ BitVec 32) (_ BitVec 64))) (size!36809 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75245)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165018 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38446 0))(
  ( (Unit!38447) )
))
(declare-fun lt!524799 () Unit!38446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75245 (_ BitVec 64) (_ BitVec 32)) Unit!38446)

(assert (=> b!1165018 (= lt!524799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!45635 () Bool)

(declare-fun mapRes!45635 () Bool)

(declare-fun tp!86742 () Bool)

(declare-fun e!662339 () Bool)

(assert (=> mapNonEmpty!45635 (= mapRes!45635 (and tp!86742 e!662339))))

(declare-datatypes ((V!44069 0))(
  ( (V!44070 (val!14660 Int)) )
))
(declare-datatypes ((ValueCell!13894 0))(
  ( (ValueCellFull!13894 (v!17297 V!44069)) (EmptyCell!13894) )
))
(declare-fun mapRest!45635 () (Array (_ BitVec 32) ValueCell!13894))

(declare-fun mapKey!45635 () (_ BitVec 32))

(declare-fun mapValue!45635 () ValueCell!13894)

(declare-datatypes ((array!75247 0))(
  ( (array!75248 (arr!36274 (Array (_ BitVec 32) ValueCell!13894)) (size!36810 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75247)

(assert (=> mapNonEmpty!45635 (= (arr!36274 _values!996) (store mapRest!45635 mapKey!45635 mapValue!45635))))

(declare-fun b!1165019 () Bool)

(declare-fun e!662340 () Bool)

(declare-fun tp_is_empty!29207 () Bool)

(assert (=> b!1165019 (= e!662340 tp_is_empty!29207)))

(declare-fun b!1165020 () Bool)

(declare-fun res!772616 () Bool)

(assert (=> b!1165020 (=> (not res!772616) (not e!662337))))

(declare-fun lt!524797 () array!75245)

(declare-datatypes ((List!25428 0))(
  ( (Nil!25425) (Cons!25424 (h!26633 (_ BitVec 64)) (t!37097 List!25428)) )
))
(declare-fun arrayNoDuplicates!0 (array!75245 (_ BitVec 32) List!25428) Bool)

(assert (=> b!1165020 (= res!772616 (arrayNoDuplicates!0 lt!524797 #b00000000000000000000000000000000 Nil!25425))))

(declare-fun b!1165021 () Bool)

(declare-fun res!772624 () Bool)

(declare-fun e!662338 () Bool)

(assert (=> b!1165021 (=> (not res!772624) (not e!662338))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165021 (= res!772624 (validMask!0 mask!1564))))

(declare-fun b!1165022 () Bool)

(declare-fun res!772623 () Bool)

(assert (=> b!1165022 (=> (not res!772623) (not e!662338))))

(assert (=> b!1165022 (= res!772623 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25425))))

(declare-fun b!1165023 () Bool)

(assert (=> b!1165023 (= e!662342 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun zeroValue!944 () V!44069)

(declare-datatypes ((tuple2!18694 0))(
  ( (tuple2!18695 (_1!9358 (_ BitVec 64)) (_2!9358 V!44069)) )
))
(declare-datatypes ((List!25429 0))(
  ( (Nil!25426) (Cons!25425 (h!26634 tuple2!18694) (t!37098 List!25429)) )
))
(declare-datatypes ((ListLongMap!16663 0))(
  ( (ListLongMap!16664 (toList!8347 List!25429)) )
))
(declare-fun lt!524796 () ListLongMap!16663)

(declare-fun minValue!944 () V!44069)

(declare-fun getCurrentListMapNoExtraKeys!4811 (array!75245 array!75247 (_ BitVec 32) (_ BitVec 32) V!44069 V!44069 (_ BitVec 32) Int) ListLongMap!16663)

(declare-fun dynLambda!2801 (Int (_ BitVec 64)) V!44069)

(assert (=> b!1165023 (= lt!524796 (getCurrentListMapNoExtraKeys!4811 lt!524797 (array!75248 (store (arr!36274 _values!996) i!673 (ValueCellFull!13894 (dynLambda!2801 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36810 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524798 () ListLongMap!16663)

(assert (=> b!1165023 (= lt!524798 (getCurrentListMapNoExtraKeys!4811 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!772625 () Bool)

(assert (=> start!99072 (=> (not res!772625) (not e!662338))))

(assert (=> start!99072 (= res!772625 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36809 _keys!1208))))))

(assert (=> start!99072 e!662338))

(assert (=> start!99072 tp_is_empty!29207))

(declare-fun array_inv!27746 (array!75245) Bool)

(assert (=> start!99072 (array_inv!27746 _keys!1208)))

(assert (=> start!99072 true))

(assert (=> start!99072 tp!86741))

(declare-fun e!662343 () Bool)

(declare-fun array_inv!27747 (array!75247) Bool)

(assert (=> start!99072 (and (array_inv!27747 _values!996) e!662343)))

(declare-fun b!1165024 () Bool)

(declare-fun res!772622 () Bool)

(assert (=> b!1165024 (=> (not res!772622) (not e!662338))))

(assert (=> b!1165024 (= res!772622 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36809 _keys!1208))))))

(declare-fun b!1165025 () Bool)

(declare-fun res!772615 () Bool)

(assert (=> b!1165025 (=> (not res!772615) (not e!662338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75245 (_ BitVec 32)) Bool)

(assert (=> b!1165025 (= res!772615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165026 () Bool)

(declare-fun res!772619 () Bool)

(assert (=> b!1165026 (=> (not res!772619) (not e!662338))))

(assert (=> b!1165026 (= res!772619 (and (= (size!36810 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36809 _keys!1208) (size!36810 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165027 () Bool)

(assert (=> b!1165027 (= e!662338 e!662337)))

(declare-fun res!772620 () Bool)

(assert (=> b!1165027 (=> (not res!772620) (not e!662337))))

(assert (=> b!1165027 (= res!772620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524797 mask!1564))))

(assert (=> b!1165027 (= lt!524797 (array!75246 (store (arr!36273 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36809 _keys!1208)))))

(declare-fun b!1165028 () Bool)

(assert (=> b!1165028 (= e!662339 tp_is_empty!29207)))

(declare-fun b!1165029 () Bool)

(assert (=> b!1165029 (= e!662343 (and e!662340 mapRes!45635))))

(declare-fun condMapEmpty!45635 () Bool)

(declare-fun mapDefault!45635 () ValueCell!13894)

