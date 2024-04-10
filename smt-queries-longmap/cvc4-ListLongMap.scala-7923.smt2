; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98382 () Bool)

(assert start!98382)

(declare-fun b_free!23987 () Bool)

(declare-fun b_next!23987 () Bool)

(assert (=> start!98382 (= b_free!23987 (not b_next!23987))))

(declare-fun tp!84671 () Bool)

(declare-fun b_and!38823 () Bool)

(assert (=> start!98382 (= tp!84671 b_and!38823)))

(declare-fun b!1134602 () Bool)

(declare-fun e!645719 () Bool)

(declare-fun e!645712 () Bool)

(assert (=> b!1134602 (= e!645719 e!645712)))

(declare-fun res!757435 () Bool)

(assert (=> b!1134602 (=> res!757435 e!645712)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134602 (= res!757435 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43149 0))(
  ( (V!43150 (val!14315 Int)) )
))
(declare-fun zeroValue!944 () V!43149)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18060 0))(
  ( (tuple2!18061 (_1!9041 (_ BitVec 64)) (_2!9041 V!43149)) )
))
(declare-datatypes ((List!24818 0))(
  ( (Nil!24815) (Cons!24814 (h!26023 tuple2!18060) (t!35797 List!24818)) )
))
(declare-datatypes ((ListLongMap!16029 0))(
  ( (ListLongMap!16030 (toList!8030 List!24818)) )
))
(declare-fun lt!504299 () ListLongMap!16029)

(declare-fun minValue!944 () V!43149)

(declare-datatypes ((array!73895 0))(
  ( (array!73896 (arr!35598 (Array (_ BitVec 32) (_ BitVec 64))) (size!36134 (_ BitVec 32))) )
))
(declare-fun lt!504304 () array!73895)

(declare-datatypes ((ValueCell!13549 0))(
  ( (ValueCellFull!13549 (v!16952 V!43149)) (EmptyCell!13549) )
))
(declare-datatypes ((array!73897 0))(
  ( (array!73898 (arr!35599 (Array (_ BitVec 32) ValueCell!13549)) (size!36135 (_ BitVec 32))) )
))
(declare-fun lt!504312 () array!73897)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4516 (array!73895 array!73897 (_ BitVec 32) (_ BitVec 32) V!43149 V!43149 (_ BitVec 32) Int) ListLongMap!16029)

(assert (=> b!1134602 (= lt!504299 (getCurrentListMapNoExtraKeys!4516 lt!504304 lt!504312 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73897)

(declare-fun dynLambda!2581 (Int (_ BitVec 64)) V!43149)

(assert (=> b!1134602 (= lt!504312 (array!73898 (store (arr!35599 _values!996) i!673 (ValueCellFull!13549 (dynLambda!2581 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36135 _values!996)))))

(declare-fun _keys!1208 () array!73895)

(declare-fun lt!504309 () ListLongMap!16029)

(assert (=> b!1134602 (= lt!504309 (getCurrentListMapNoExtraKeys!4516 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!645715 () Bool)

(declare-fun b!1134603 () Bool)

(declare-fun call!49386 () ListLongMap!16029)

(declare-fun call!49390 () ListLongMap!16029)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1194 (ListLongMap!16029 (_ BitVec 64)) ListLongMap!16029)

(assert (=> b!1134603 (= e!645715 (= call!49386 (-!1194 call!49390 k!934)))))

(declare-fun res!757434 () Bool)

(declare-fun e!645713 () Bool)

(assert (=> start!98382 (=> (not res!757434) (not e!645713))))

(assert (=> start!98382 (= res!757434 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36134 _keys!1208))))))

(assert (=> start!98382 e!645713))

(declare-fun tp_is_empty!28517 () Bool)

(assert (=> start!98382 tp_is_empty!28517))

(declare-fun array_inv!27302 (array!73895) Bool)

(assert (=> start!98382 (array_inv!27302 _keys!1208)))

(assert (=> start!98382 true))

(assert (=> start!98382 tp!84671))

(declare-fun e!645710 () Bool)

(declare-fun array_inv!27303 (array!73897) Bool)

(assert (=> start!98382 (and (array_inv!27303 _values!996) e!645710)))

(declare-datatypes ((Unit!37174 0))(
  ( (Unit!37175) )
))
(declare-fun call!49388 () Unit!37174)

(declare-fun c!110805 () Bool)

(declare-fun lt!504313 () ListLongMap!16029)

(declare-fun lt!504302 () ListLongMap!16029)

(declare-fun bm!49383 () Bool)

(declare-fun c!110807 () Bool)

(declare-fun addStillContains!731 (ListLongMap!16029 (_ BitVec 64) V!43149 (_ BitVec 64)) Unit!37174)

(assert (=> bm!49383 (= call!49388 (addStillContains!731 (ite c!110807 lt!504313 lt!504302) (ite c!110807 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110805 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110807 minValue!944 (ite c!110805 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1134604 () Bool)

(declare-fun res!757446 () Bool)

(declare-fun e!645717 () Bool)

(assert (=> b!1134604 (=> res!757446 e!645717)))

(declare-datatypes ((List!24819 0))(
  ( (Nil!24816) (Cons!24815 (h!26024 (_ BitVec 64)) (t!35798 List!24819)) )
))
(declare-fun noDuplicate!1593 (List!24819) Bool)

(assert (=> b!1134604 (= res!757446 (not (noDuplicate!1593 Nil!24816)))))

(declare-fun lt!504308 () Bool)

(declare-fun e!645716 () Bool)

(declare-fun b!1134605 () Bool)

(assert (=> b!1134605 (= e!645716 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504308) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134606 () Bool)

(declare-fun e!645706 () Bool)

(declare-fun mapRes!44600 () Bool)

(assert (=> b!1134606 (= e!645710 (and e!645706 mapRes!44600))))

(declare-fun condMapEmpty!44600 () Bool)

(declare-fun mapDefault!44600 () ValueCell!13549)

