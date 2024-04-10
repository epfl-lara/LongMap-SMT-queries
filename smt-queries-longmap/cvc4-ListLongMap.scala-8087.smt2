; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99392 () Bool)

(assert start!99392)

(declare-fun b_free!24971 () Bool)

(declare-fun b_next!24971 () Bool)

(assert (=> start!99392 (= b_free!24971 (not b_next!24971))))

(declare-fun tp!87627 () Bool)

(declare-fun b_and!40809 () Bool)

(assert (=> start!99392 (= tp!87627 b_and!40809)))

(declare-fun b!1173045 () Bool)

(declare-fun res!778907 () Bool)

(declare-fun e!666763 () Bool)

(assert (=> b!1173045 (=> (not res!778907) (not e!666763))))

(declare-datatypes ((array!75813 0))(
  ( (array!75814 (arr!36556 (Array (_ BitVec 32) (_ BitVec 64))) (size!37092 (_ BitVec 32))) )
))
(declare-fun lt!528660 () array!75813)

(declare-datatypes ((List!25658 0))(
  ( (Nil!25655) (Cons!25654 (h!26863 (_ BitVec 64)) (t!37621 List!25658)) )
))
(declare-fun arrayNoDuplicates!0 (array!75813 (_ BitVec 32) List!25658) Bool)

(assert (=> b!1173045 (= res!778907 (arrayNoDuplicates!0 lt!528660 #b00000000000000000000000000000000 Nil!25655))))

(declare-fun b!1173046 () Bool)

(declare-fun e!666766 () Bool)

(declare-fun tp_is_empty!29501 () Bool)

(assert (=> b!1173046 (= e!666766 tp_is_empty!29501)))

(declare-fun b!1173047 () Bool)

(declare-fun e!666764 () Bool)

(assert (=> b!1173047 (= e!666764 true)))

(declare-fun _keys!1208 () array!75813)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1173047 (not (= (select (arr!36556 _keys!1208) from!1455) k!934))))

(declare-datatypes ((Unit!38682 0))(
  ( (Unit!38683) )
))
(declare-fun lt!528667 () Unit!38682)

(declare-fun e!666762 () Unit!38682)

(assert (=> b!1173047 (= lt!528667 e!666762)))

(declare-fun c!116580 () Bool)

(assert (=> b!1173047 (= c!116580 (= (select (arr!36556 _keys!1208) from!1455) k!934))))

(declare-fun e!666761 () Bool)

(assert (=> b!1173047 e!666761))

(declare-fun res!778916 () Bool)

(assert (=> b!1173047 (=> (not res!778916) (not e!666761))))

(declare-datatypes ((V!44461 0))(
  ( (V!44462 (val!14807 Int)) )
))
(declare-fun lt!528671 () V!44461)

(declare-datatypes ((tuple2!18920 0))(
  ( (tuple2!18921 (_1!9471 (_ BitVec 64)) (_2!9471 V!44461)) )
))
(declare-datatypes ((List!25659 0))(
  ( (Nil!25656) (Cons!25655 (h!26864 tuple2!18920) (t!37622 List!25659)) )
))
(declare-datatypes ((ListLongMap!16889 0))(
  ( (ListLongMap!16890 (toList!8460 List!25659)) )
))
(declare-fun lt!528659 () ListLongMap!16889)

(declare-fun lt!528668 () ListLongMap!16889)

(declare-datatypes ((ValueCell!14041 0))(
  ( (ValueCellFull!14041 (v!17445 V!44461)) (EmptyCell!14041) )
))
(declare-datatypes ((array!75815 0))(
  ( (array!75816 (arr!36557 (Array (_ BitVec 32) ValueCell!14041)) (size!37093 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75815)

(declare-fun +!3780 (ListLongMap!16889 tuple2!18920) ListLongMap!16889)

(declare-fun get!18650 (ValueCell!14041 V!44461) V!44461)

(assert (=> b!1173047 (= res!778916 (= lt!528668 (+!3780 lt!528659 (tuple2!18921 (select (arr!36556 _keys!1208) from!1455) (get!18650 (select (arr!36557 _values!996) from!1455) lt!528671)))))))

(declare-fun b!1173048 () Bool)

(declare-fun res!778914 () Bool)

(declare-fun e!666758 () Bool)

(assert (=> b!1173048 (=> (not res!778914) (not e!666758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173048 (= res!778914 (validKeyInArray!0 k!934))))

(declare-fun b!1173049 () Bool)

(declare-fun res!778919 () Bool)

(assert (=> b!1173049 (=> (not res!778919) (not e!666758))))

(assert (=> b!1173049 (= res!778919 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25655))))

(declare-fun b!1173050 () Bool)

(declare-fun e!666765 () Bool)

(assert (=> b!1173050 (= e!666765 tp_is_empty!29501)))

(declare-fun b!1173051 () Bool)

(declare-fun res!778915 () Bool)

(assert (=> b!1173051 (=> (not res!778915) (not e!666758))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173051 (= res!778915 (= (select (arr!36556 _keys!1208) i!673) k!934))))

(declare-fun b!1173052 () Bool)

(declare-fun e!666756 () Bool)

(assert (=> b!1173052 (= e!666763 (not e!666756))))

(declare-fun res!778917 () Bool)

(assert (=> b!1173052 (=> res!778917 e!666756)))

(assert (=> b!1173052 (= res!778917 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173052 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!528670 () Unit!38682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75813 (_ BitVec 64) (_ BitVec 32)) Unit!38682)

(assert (=> b!1173052 (= lt!528670 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46079 () Bool)

(declare-fun mapRes!46079 () Bool)

(assert (=> mapIsEmpty!46079 mapRes!46079))

(declare-fun mapNonEmpty!46079 () Bool)

(declare-fun tp!87626 () Bool)

(assert (=> mapNonEmpty!46079 (= mapRes!46079 (and tp!87626 e!666766))))

(declare-fun mapKey!46079 () (_ BitVec 32))

(declare-fun mapValue!46079 () ValueCell!14041)

(declare-fun mapRest!46079 () (Array (_ BitVec 32) ValueCell!14041))

(assert (=> mapNonEmpty!46079 (= (arr!36557 _values!996) (store mapRest!46079 mapKey!46079 mapValue!46079))))

(declare-fun b!1173054 () Bool)

(declare-fun e!666759 () Bool)

(assert (=> b!1173054 (= e!666759 (and e!666765 mapRes!46079))))

(declare-fun condMapEmpty!46079 () Bool)

(declare-fun mapDefault!46079 () ValueCell!14041)

