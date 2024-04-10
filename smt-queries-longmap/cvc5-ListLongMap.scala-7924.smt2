; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98384 () Bool)

(assert start!98384)

(declare-fun b_free!23989 () Bool)

(declare-fun b_next!23989 () Bool)

(assert (=> start!98384 (= b_free!23989 (not b_next!23989))))

(declare-fun tp!84677 () Bool)

(declare-fun b_and!38827 () Bool)

(assert (=> start!98384 (= tp!84677 b_and!38827)))

(declare-fun b!1134697 () Bool)

(declare-fun res!757494 () Bool)

(declare-fun e!645762 () Bool)

(assert (=> b!1134697 (=> res!757494 e!645762)))

(declare-datatypes ((List!24820 0))(
  ( (Nil!24817) (Cons!24816 (h!26025 (_ BitVec 64)) (t!35801 List!24820)) )
))
(declare-fun contains!6556 (List!24820 (_ BitVec 64)) Bool)

(assert (=> b!1134697 (= res!757494 (contains!6556 Nil!24817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134698 () Bool)

(declare-fun e!645759 () Bool)

(declare-fun tp_is_empty!28519 () Bool)

(assert (=> b!1134698 (= e!645759 tp_is_empty!28519)))

(declare-datatypes ((V!43153 0))(
  ( (V!43154 (val!14316 Int)) )
))
(declare-fun zeroValue!944 () V!43153)

(declare-datatypes ((tuple2!18062 0))(
  ( (tuple2!18063 (_1!9042 (_ BitVec 64)) (_2!9042 V!43153)) )
))
(declare-datatypes ((List!24821 0))(
  ( (Nil!24818) (Cons!24817 (h!26026 tuple2!18062) (t!35802 List!24821)) )
))
(declare-datatypes ((ListLongMap!16031 0))(
  ( (ListLongMap!16032 (toList!8031 List!24821)) )
))
(declare-fun call!49410 () ListLongMap!16031)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13550 0))(
  ( (ValueCellFull!13550 (v!16953 V!43153)) (EmptyCell!13550) )
))
(declare-datatypes ((array!73899 0))(
  ( (array!73900 (arr!35600 (Array (_ BitVec 32) ValueCell!13550)) (size!36136 (_ BitVec 32))) )
))
(declare-fun lt!504351 () array!73899)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43153)

(declare-datatypes ((array!73901 0))(
  ( (array!73902 (arr!35601 (Array (_ BitVec 32) (_ BitVec 64))) (size!36137 (_ BitVec 32))) )
))
(declare-fun lt!504358 () array!73901)

(declare-fun bm!49407 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4517 (array!73901 array!73899 (_ BitVec 32) (_ BitVec 32) V!43153 V!43153 (_ BitVec 32) Int) ListLongMap!16031)

(assert (=> bm!49407 (= call!49410 (getCurrentListMapNoExtraKeys!4517 lt!504358 lt!504351 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134699 () Bool)

(assert (=> b!1134699 (= e!645762 true)))

(declare-fun lt!504355 () Bool)

(assert (=> b!1134699 (= lt!504355 (contains!6556 Nil!24817 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134700 () Bool)

(declare-fun res!757497 () Bool)

(declare-fun e!645771 () Bool)

(assert (=> b!1134700 (=> (not res!757497) (not e!645771))))

(declare-fun arrayNoDuplicates!0 (array!73901 (_ BitVec 32) List!24820) Bool)

(assert (=> b!1134700 (= res!757497 (arrayNoDuplicates!0 lt!504358 #b00000000000000000000000000000000 Nil!24817))))

(declare-fun b!1134701 () Bool)

(declare-datatypes ((Unit!37176 0))(
  ( (Unit!37177) )
))
(declare-fun e!645765 () Unit!37176)

(declare-fun lt!504360 () Unit!37176)

(assert (=> b!1134701 (= e!645765 lt!504360)))

(declare-fun lt!504350 () ListLongMap!16031)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!504361 () Unit!37176)

(declare-fun addStillContains!732 (ListLongMap!16031 (_ BitVec 64) V!43153 (_ BitVec 64)) Unit!37176)

(assert (=> b!1134701 (= lt!504361 (addStillContains!732 lt!504350 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!504365 () ListLongMap!16031)

(declare-fun +!3469 (ListLongMap!16031 tuple2!18062) ListLongMap!16031)

(assert (=> b!1134701 (= lt!504365 (+!3469 lt!504350 (tuple2!18063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!49415 () Bool)

(assert (=> b!1134701 call!49415))

(declare-fun call!49414 () Unit!37176)

(assert (=> b!1134701 (= lt!504360 call!49414)))

(declare-fun call!49411 () ListLongMap!16031)

(declare-fun contains!6557 (ListLongMap!16031 (_ BitVec 64)) Bool)

(assert (=> b!1134701 (contains!6557 call!49411 k!934)))

(declare-fun e!645761 () Bool)

(declare-fun call!49412 () ListLongMap!16031)

(declare-fun b!1134702 () Bool)

(declare-fun -!1195 (ListLongMap!16031 (_ BitVec 64)) ListLongMap!16031)

(assert (=> b!1134702 (= e!645761 (= call!49410 (-!1195 call!49412 k!934)))))

(declare-fun b!1134703 () Bool)

(declare-fun res!757488 () Bool)

(declare-fun e!645760 () Bool)

(assert (=> b!1134703 (=> (not res!757488) (not e!645760))))

(declare-fun _keys!1208 () array!73901)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73901 (_ BitVec 32)) Bool)

(assert (=> b!1134703 (= res!757488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44603 () Bool)

(declare-fun mapRes!44603 () Bool)

(assert (=> mapIsEmpty!44603 mapRes!44603))

(declare-fun bm!49408 () Bool)

(declare-fun call!49416 () Unit!37176)

(assert (=> bm!49408 (= call!49416 call!49414)))

(declare-fun b!1134704 () Bool)

(declare-fun e!645767 () Bool)

(declare-fun e!645768 () Bool)

(assert (=> b!1134704 (= e!645767 e!645768)))

(declare-fun res!757496 () Bool)

(assert (=> b!1134704 (=> res!757496 e!645768)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134704 (= res!757496 (not (= from!1455 i!673)))))

(declare-fun lt!504364 () ListLongMap!16031)

(assert (=> b!1134704 (= lt!504364 (getCurrentListMapNoExtraKeys!4517 lt!504358 lt!504351 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73899)

(declare-fun dynLambda!2582 (Int (_ BitVec 64)) V!43153)

(assert (=> b!1134704 (= lt!504351 (array!73900 (store (arr!35600 _values!996) i!673 (ValueCellFull!13550 (dynLambda!2582 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36136 _values!996)))))

(declare-fun lt!504362 () ListLongMap!16031)

(assert (=> b!1134704 (= lt!504362 (getCurrentListMapNoExtraKeys!4517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!645770 () Bool)

(declare-fun b!1134705 () Bool)

(declare-fun lt!504357 () Bool)

(assert (=> b!1134705 (= e!645770 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504357) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134706 () Bool)

(declare-fun e!645769 () Unit!37176)

(assert (=> b!1134706 (= e!645765 e!645769)))

(declare-fun c!110821 () Bool)

(assert (=> b!1134706 (= c!110821 (and (not lt!504357) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134707 () Bool)

(declare-fun c!110820 () Bool)

(assert (=> b!1134707 (= c!110820 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504357))))

(declare-fun e!645764 () Unit!37176)

(assert (=> b!1134707 (= e!645769 e!645764)))

(declare-fun b!1134708 () Bool)

(declare-fun arrayContainsKey!0 (array!73901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134708 (= e!645770 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49409 () Bool)

(declare-fun c!110824 () Bool)

(assert (=> bm!49409 (= call!49411 (+!3469 (ite c!110824 lt!504365 lt!504350) (ite c!110824 (tuple2!18063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110821 (tuple2!18063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!645763 () Bool)

(declare-fun b!1134709 () Bool)

(assert (=> b!1134709 (= e!645763 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134710 () Bool)

(declare-fun e!645755 () Bool)

(declare-fun e!645757 () Bool)

(assert (=> b!1134710 (= e!645755 e!645757)))

(declare-fun res!757493 () Bool)

(assert (=> b!1134710 (=> res!757493 e!645757)))

(assert (=> b!1134710 (= res!757493 (not (contains!6557 lt!504350 k!934)))))

(assert (=> b!1134710 (= lt!504350 (getCurrentListMapNoExtraKeys!4517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134711 () Bool)

(declare-fun e!645766 () Bool)

(assert (=> b!1134711 (= e!645766 (and e!645759 mapRes!44603))))

(declare-fun condMapEmpty!44603 () Bool)

(declare-fun mapDefault!44603 () ValueCell!13550)

