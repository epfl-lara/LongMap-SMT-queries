; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98222 () Bool)

(assert start!98222)

(declare-fun b_free!23923 () Bool)

(declare-fun b_next!23923 () Bool)

(assert (=> start!98222 (= b_free!23923 (not b_next!23923))))

(declare-fun tp!84473 () Bool)

(declare-fun b_and!38629 () Bool)

(assert (=> start!98222 (= tp!84473 b_and!38629)))

(declare-datatypes ((V!43065 0))(
  ( (V!43066 (val!14283 Int)) )
))
(declare-datatypes ((tuple2!18000 0))(
  ( (tuple2!18001 (_1!9011 (_ BitVec 64)) (_2!9011 V!43065)) )
))
(declare-datatypes ((List!24764 0))(
  ( (Nil!24761) (Cons!24760 (h!25969 tuple2!18000) (t!35679 List!24764)) )
))
(declare-datatypes ((ListLongMap!15969 0))(
  ( (ListLongMap!15970 (toList!8000 List!24764)) )
))
(declare-fun call!48555 () ListLongMap!15969)

(declare-fun call!48549 () Bool)

(declare-fun bm!48546 () Bool)

(declare-fun lt!502379 () ListLongMap!15969)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!110124 () Bool)

(declare-fun contains!6522 (ListLongMap!15969 (_ BitVec 64)) Bool)

(assert (=> bm!48546 (= call!48549 (contains!6522 (ite c!110124 lt!502379 call!48555) k!934))))

(declare-fun b!1131116 () Bool)

(declare-fun e!643729 () Bool)

(declare-fun tp_is_empty!28453 () Bool)

(assert (=> b!1131116 (= e!643729 tp_is_empty!28453)))

(declare-fun b!1131117 () Bool)

(declare-fun e!643736 () Bool)

(assert (=> b!1131117 (= e!643736 true)))

(declare-fun zeroValue!944 () V!43065)

(declare-datatypes ((array!73763 0))(
  ( (array!73764 (arr!35534 (Array (_ BitVec 32) (_ BitVec 64))) (size!36070 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73763)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13517 0))(
  ( (ValueCellFull!13517 (v!16916 V!43065)) (EmptyCell!13517) )
))
(declare-datatypes ((array!73765 0))(
  ( (array!73766 (arr!35535 (Array (_ BitVec 32) ValueCell!13517)) (size!36071 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73765)

(declare-fun minValue!944 () V!43065)

(declare-fun lt!502378 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMap!4430 (array!73763 array!73765 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) Int) ListLongMap!15969)

(assert (=> b!1131117 (= lt!502378 (contains!6522 (getCurrentListMap!4430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1131118 () Bool)

(declare-fun res!755696 () Bool)

(declare-fun e!643735 () Bool)

(assert (=> b!1131118 (=> (not res!755696) (not e!643735))))

(declare-fun lt!502370 () array!73763)

(declare-datatypes ((List!24765 0))(
  ( (Nil!24762) (Cons!24761 (h!25970 (_ BitVec 64)) (t!35680 List!24765)) )
))
(declare-fun arrayNoDuplicates!0 (array!73763 (_ BitVec 32) List!24765) Bool)

(assert (=> b!1131118 (= res!755696 (arrayNoDuplicates!0 lt!502370 #b00000000000000000000000000000000 Nil!24762))))

(declare-fun b!1131119 () Bool)

(declare-datatypes ((Unit!37055 0))(
  ( (Unit!37056) )
))
(declare-fun e!643730 () Unit!37055)

(declare-fun e!643737 () Unit!37055)

(assert (=> b!1131119 (= e!643730 e!643737)))

(declare-fun c!110125 () Bool)

(declare-fun lt!502373 () Bool)

(assert (=> b!1131119 (= c!110125 (and (not lt!502373) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!48553 () Unit!37055)

(declare-fun bm!48547 () Bool)

(declare-fun lt!502381 () ListLongMap!15969)

(declare-fun addStillContains!709 (ListLongMap!15969 (_ BitVec 64) V!43065 (_ BitVec 64)) Unit!37055)

(assert (=> bm!48547 (= call!48553 (addStillContains!709 lt!502381 (ite (or c!110124 c!110125) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110124 c!110125) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1131120 () Bool)

(declare-fun c!110127 () Bool)

(assert (=> b!1131120 (= c!110127 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502373))))

(declare-fun e!643732 () Unit!37055)

(assert (=> b!1131120 (= e!643737 e!643732)))

(declare-fun bm!48548 () Bool)

(declare-fun lt!502369 () array!73765)

(declare-fun call!48556 () ListLongMap!15969)

(declare-fun getCurrentListMapNoExtraKeys!4487 (array!73763 array!73765 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) Int) ListLongMap!15969)

(assert (=> bm!48548 (= call!48556 (getCurrentListMapNoExtraKeys!4487 lt!502370 lt!502369 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131121 () Bool)

(declare-fun e!643723 () Bool)

(declare-fun e!643726 () Bool)

(assert (=> b!1131121 (= e!643723 e!643726)))

(declare-fun res!755689 () Bool)

(assert (=> b!1131121 (=> res!755689 e!643726)))

(assert (=> b!1131121 (= res!755689 (not (= (select (arr!35534 _keys!1208) from!1455) k!934)))))

(declare-fun e!643731 () Bool)

(assert (=> b!1131121 e!643731))

(declare-fun c!110126 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131121 (= c!110126 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502375 () Unit!37055)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!429 (array!73763 array!73765 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37055)

(assert (=> b!1131121 (= lt!502375 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131122 () Bool)

(declare-fun res!755688 () Bool)

(declare-fun e!643727 () Bool)

(assert (=> b!1131122 (=> (not res!755688) (not e!643727))))

(assert (=> b!1131122 (= res!755688 (= (select (arr!35534 _keys!1208) i!673) k!934))))

(declare-fun res!755690 () Bool)

(assert (=> start!98222 (=> (not res!755690) (not e!643727))))

(assert (=> start!98222 (= res!755690 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36070 _keys!1208))))))

(assert (=> start!98222 e!643727))

(assert (=> start!98222 tp_is_empty!28453))

(declare-fun array_inv!27258 (array!73763) Bool)

(assert (=> start!98222 (array_inv!27258 _keys!1208)))

(assert (=> start!98222 true))

(assert (=> start!98222 tp!84473))

(declare-fun e!643733 () Bool)

(declare-fun array_inv!27259 (array!73765) Bool)

(assert (=> start!98222 (and (array_inv!27259 _values!996) e!643733)))

(declare-fun b!1131123 () Bool)

(declare-fun e!643734 () Bool)

(declare-fun mapRes!44497 () Bool)

(assert (=> b!1131123 (= e!643733 (and e!643734 mapRes!44497))))

(declare-fun condMapEmpty!44497 () Bool)

(declare-fun mapDefault!44497 () ValueCell!13517)

