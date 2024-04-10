; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98358 () Bool)

(assert start!98358)

(declare-fun b_free!23963 () Bool)

(declare-fun b_next!23963 () Bool)

(assert (=> start!98358 (= b_free!23963 (not b_next!23963))))

(declare-fun tp!84600 () Bool)

(declare-fun b_and!38775 () Bool)

(assert (=> start!98358 (= tp!84600 b_and!38775)))

(declare-fun b!1133519 () Bool)

(declare-fun res!756851 () Bool)

(declare-fun e!645119 () Bool)

(assert (=> b!1133519 (=> (not res!756851) (not e!645119))))

(declare-datatypes ((array!73847 0))(
  ( (array!73848 (arr!35574 (Array (_ BitVec 32) (_ BitVec 64))) (size!36110 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73847)

(declare-datatypes ((List!24799 0))(
  ( (Nil!24796) (Cons!24795 (h!26004 (_ BitVec 64)) (t!35754 List!24799)) )
))
(declare-fun arrayNoDuplicates!0 (array!73847 (_ BitVec 32) List!24799) Bool)

(assert (=> b!1133519 (= res!756851 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24796))))

(declare-datatypes ((V!43117 0))(
  ( (V!43118 (val!14303 Int)) )
))
(declare-fun zeroValue!944 () V!43117)

(declare-fun c!110628 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((Unit!37142 0))(
  ( (Unit!37143) )
))
(declare-fun call!49099 () Unit!37142)

(declare-fun c!110625 () Bool)

(declare-fun minValue!944 () V!43117)

(declare-datatypes ((tuple2!18038 0))(
  ( (tuple2!18039 (_1!9030 (_ BitVec 64)) (_2!9030 V!43117)) )
))
(declare-datatypes ((List!24800 0))(
  ( (Nil!24797) (Cons!24796 (h!26005 tuple2!18038) (t!35755 List!24800)) )
))
(declare-datatypes ((ListLongMap!16007 0))(
  ( (ListLongMap!16008 (toList!8019 List!24800)) )
))
(declare-fun lt!503727 () ListLongMap!16007)

(declare-fun bm!49095 () Bool)

(declare-fun addStillContains!724 (ListLongMap!16007 (_ BitVec 64) V!43117 (_ BitVec 64)) Unit!37142)

(assert (=> bm!49095 (= call!49099 (addStillContains!724 lt!503727 (ite (or c!110628 c!110625) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110628 c!110625) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1133520 () Bool)

(declare-fun c!110627 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!503733 () Bool)

(assert (=> b!1133520 (= c!110627 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503733))))

(declare-fun e!645116 () Unit!37142)

(declare-fun e!645124 () Unit!37142)

(assert (=> b!1133520 (= e!645116 e!645124)))

(declare-fun e!645125 () Bool)

(declare-fun b!1133521 () Bool)

(assert (=> b!1133521 (= e!645125 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503733) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133522 () Bool)

(declare-fun res!756848 () Bool)

(assert (=> b!1133522 (=> (not res!756848) (not e!645119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133522 (= res!756848 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!44564 () Bool)

(declare-fun mapRes!44564 () Bool)

(assert (=> mapIsEmpty!44564 mapRes!44564))

(declare-fun b!1133523 () Bool)

(declare-fun e!645123 () Bool)

(declare-fun e!645117 () Bool)

(assert (=> b!1133523 (= e!645123 (not e!645117))))

(declare-fun res!756847 () Bool)

(assert (=> b!1133523 (=> res!756847 e!645117)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133523 (= res!756847 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133523 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!503728 () Unit!37142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73847 (_ BitVec 64) (_ BitVec 32)) Unit!37142)

(assert (=> b!1133523 (= lt!503728 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1133524 () Bool)

(declare-fun Unit!37144 () Unit!37142)

(assert (=> b!1133524 (= e!645124 Unit!37144)))

(declare-fun bm!49096 () Bool)

(declare-fun call!49105 () Bool)

(declare-fun call!49103 () Bool)

(assert (=> bm!49096 (= call!49105 call!49103)))

(declare-fun b!1133525 () Bool)

(declare-fun res!756843 () Bool)

(assert (=> b!1133525 (=> (not res!756843) (not e!645119))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13537 0))(
  ( (ValueCellFull!13537 (v!16940 V!43117)) (EmptyCell!13537) )
))
(declare-datatypes ((array!73849 0))(
  ( (array!73850 (arr!35575 (Array (_ BitVec 32) ValueCell!13537)) (size!36111 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73849)

(assert (=> b!1133525 (= res!756843 (and (= (size!36111 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36110 _keys!1208) (size!36111 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44564 () Bool)

(declare-fun tp!84599 () Bool)

(declare-fun e!645113 () Bool)

(assert (=> mapNonEmpty!44564 (= mapRes!44564 (and tp!84599 e!645113))))

(declare-fun mapRest!44564 () (Array (_ BitVec 32) ValueCell!13537))

(declare-fun mapValue!44564 () ValueCell!13537)

(declare-fun mapKey!44564 () (_ BitVec 32))

(assert (=> mapNonEmpty!44564 (= (arr!35575 _values!996) (store mapRest!44564 mapKey!44564 mapValue!44564))))

(declare-fun b!1133526 () Bool)

(declare-fun call!49098 () ListLongMap!16007)

(declare-fun call!49102 () ListLongMap!16007)

(declare-fun e!645126 () Bool)

(declare-fun -!1187 (ListLongMap!16007 (_ BitVec 64)) ListLongMap!16007)

(assert (=> b!1133526 (= e!645126 (= call!49098 (-!1187 call!49102 k!934)))))

(declare-fun b!1133527 () Bool)

(assert (=> b!1133527 (= e!645119 e!645123)))

(declare-fun res!756849 () Bool)

(assert (=> b!1133527 (=> (not res!756849) (not e!645123))))

(declare-fun lt!503735 () array!73847)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73847 (_ BitVec 32)) Bool)

(assert (=> b!1133527 (= res!756849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503735 mask!1564))))

(assert (=> b!1133527 (= lt!503735 (array!73848 (store (arr!35574 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36110 _keys!1208)))))

(declare-fun b!1133528 () Bool)

(declare-fun e!645121 () Bool)

(assert (=> b!1133528 (= e!645121 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133529 () Bool)

(declare-fun e!645114 () Unit!37142)

(declare-fun lt!503729 () Unit!37142)

(assert (=> b!1133529 (= e!645114 lt!503729)))

(declare-fun lt!503730 () Unit!37142)

(assert (=> b!1133529 (= lt!503730 call!49099)))

(declare-fun lt!503734 () ListLongMap!16007)

(declare-fun +!3461 (ListLongMap!16007 tuple2!18038) ListLongMap!16007)

(assert (=> b!1133529 (= lt!503734 (+!3461 lt!503727 (tuple2!18039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1133529 call!49103))

(assert (=> b!1133529 (= lt!503729 (addStillContains!724 lt!503734 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!49101 () ListLongMap!16007)

(declare-fun contains!6544 (ListLongMap!16007 (_ BitVec 64)) Bool)

(assert (=> b!1133529 (contains!6544 call!49101 k!934)))

(declare-fun bm!49097 () Bool)

(assert (=> bm!49097 (= call!49101 (+!3461 (ite c!110628 lt!503734 lt!503727) (ite c!110628 (tuple2!18039 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110625 (tuple2!18039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18039 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133530 () Bool)

(declare-fun lt!503737 () Unit!37142)

(assert (=> b!1133530 (= e!645124 lt!503737)))

(declare-fun call!49100 () Unit!37142)

(assert (=> b!1133530 (= lt!503737 call!49100)))

(assert (=> b!1133530 call!49105))

(declare-fun b!1133531 () Bool)

(assert (=> b!1133531 (= e!645125 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133532 () Bool)

(declare-fun res!756850 () Bool)

(assert (=> b!1133532 (=> (not res!756850) (not e!645123))))

(assert (=> b!1133532 (= res!756850 (arrayNoDuplicates!0 lt!503735 #b00000000000000000000000000000000 Nil!24796))))

(declare-fun b!1133533 () Bool)

(declare-fun res!756857 () Bool)

(assert (=> b!1133533 (=> (not res!756857) (not e!645119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133533 (= res!756857 (validMask!0 mask!1564))))

(declare-fun b!1133534 () Bool)

(declare-fun e!645111 () Bool)

(declare-fun tp_is_empty!28493 () Bool)

(assert (=> b!1133534 (= e!645111 tp_is_empty!28493)))

(declare-fun b!1133535 () Bool)

(declare-fun e!645112 () Bool)

(assert (=> b!1133535 (= e!645112 true)))

(assert (=> b!1133535 e!645121))

(declare-fun res!756855 () Bool)

(assert (=> b!1133535 (=> (not res!756855) (not e!645121))))

(assert (=> b!1133535 (= res!756855 e!645125)))

(declare-fun c!110626 () Bool)

(assert (=> b!1133535 (= c!110626 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!503726 () Unit!37142)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!331 (array!73847 array!73849 (_ BitVec 32) (_ BitVec 32) V!43117 V!43117 (_ BitVec 64) (_ BitVec 32) Int) Unit!37142)

(assert (=> b!1133535 (= lt!503726 (lemmaListMapContainsThenArrayContainsFrom!331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503732 () Unit!37142)

(assert (=> b!1133535 (= lt!503732 e!645114)))

(assert (=> b!1133535 (= c!110628 (and (not lt!503733) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133535 (= lt!503733 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133536 () Bool)

(declare-fun res!756844 () Bool)

(assert (=> b!1133536 (=> (not res!756844) (not e!645119))))

(assert (=> b!1133536 (= res!756844 (= (select (arr!35574 _keys!1208) i!673) k!934))))

(declare-fun b!1133537 () Bool)

(declare-fun res!756856 () Bool)

(assert (=> b!1133537 (=> (not res!756856) (not e!645119))))

(assert (=> b!1133537 (= res!756856 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36110 _keys!1208))))))

(declare-fun bm!49098 () Bool)

(declare-fun call!49104 () ListLongMap!16007)

(assert (=> bm!49098 (= call!49103 (contains!6544 (ite c!110628 lt!503734 call!49104) k!934))))

(declare-fun bm!49099 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4506 (array!73847 array!73849 (_ BitVec 32) (_ BitVec 32) V!43117 V!43117 (_ BitVec 32) Int) ListLongMap!16007)

(assert (=> bm!49099 (= call!49102 (getCurrentListMapNoExtraKeys!4506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133538 () Bool)

(declare-fun e!645118 () Bool)

(assert (=> b!1133538 (= e!645117 e!645118)))

(declare-fun res!756853 () Bool)

(assert (=> b!1133538 (=> res!756853 e!645118)))

(assert (=> b!1133538 (= res!756853 (not (= from!1455 i!673)))))

(declare-fun lt!503731 () array!73849)

(declare-fun lt!503738 () ListLongMap!16007)

(assert (=> b!1133538 (= lt!503738 (getCurrentListMapNoExtraKeys!4506 lt!503735 lt!503731 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2574 (Int (_ BitVec 64)) V!43117)

(assert (=> b!1133538 (= lt!503731 (array!73850 (store (arr!35575 _values!996) i!673 (ValueCellFull!13537 (dynLambda!2574 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36111 _values!996)))))

(declare-fun lt!503725 () ListLongMap!16007)

(assert (=> b!1133538 (= lt!503725 (getCurrentListMapNoExtraKeys!4506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!756845 () Bool)

(assert (=> start!98358 (=> (not res!756845) (not e!645119))))

(assert (=> start!98358 (= res!756845 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36110 _keys!1208))))))

(assert (=> start!98358 e!645119))

(assert (=> start!98358 tp_is_empty!28493))

(declare-fun array_inv!27286 (array!73847) Bool)

(assert (=> start!98358 (array_inv!27286 _keys!1208)))

(assert (=> start!98358 true))

(assert (=> start!98358 tp!84600))

(declare-fun e!645115 () Bool)

(declare-fun array_inv!27287 (array!73849) Bool)

(assert (=> start!98358 (and (array_inv!27287 _values!996) e!645115)))

(declare-fun b!1133539 () Bool)

(declare-fun res!756852 () Bool)

(assert (=> b!1133539 (=> (not res!756852) (not e!645119))))

(assert (=> b!1133539 (= res!756852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133540 () Bool)

(assert (=> b!1133540 call!49105))

(declare-fun lt!503736 () Unit!37142)

(assert (=> b!1133540 (= lt!503736 call!49100)))

(assert (=> b!1133540 (= e!645116 lt!503736)))

(declare-fun bm!49100 () Bool)

(assert (=> bm!49100 (= call!49100 call!49099)))

(declare-fun b!1133541 () Bool)

(assert (=> b!1133541 (= e!645115 (and e!645111 mapRes!44564))))

(declare-fun condMapEmpty!44564 () Bool)

(declare-fun mapDefault!44564 () ValueCell!13537)

