; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98228 () Bool)

(assert start!98228)

(declare-fun b_free!23929 () Bool)

(declare-fun b_next!23929 () Bool)

(assert (=> start!98228 (= b_free!23929 (not b_next!23929))))

(declare-fun tp!84490 () Bool)

(declare-fun b_and!38641 () Bool)

(assert (=> start!98228 (= tp!84490 b_and!38641)))

(declare-fun b!1131358 () Bool)

(declare-fun res!755820 () Bool)

(declare-fun e!643870 () Bool)

(assert (=> b!1131358 (=> (not res!755820) (not e!643870))))

(declare-datatypes ((array!73775 0))(
  ( (array!73776 (arr!35540 (Array (_ BitVec 32) (_ BitVec 64))) (size!36076 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73775)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43073 0))(
  ( (V!43074 (val!14286 Int)) )
))
(declare-datatypes ((ValueCell!13520 0))(
  ( (ValueCellFull!13520 (v!16919 V!43073)) (EmptyCell!13520) )
))
(declare-datatypes ((array!73777 0))(
  ( (array!73778 (arr!35541 (Array (_ BitVec 32) ValueCell!13520)) (size!36077 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73777)

(assert (=> b!1131358 (= res!755820 (and (= (size!36077 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36076 _keys!1208) (size!36077 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48618 () Bool)

(declare-fun call!48624 () Bool)

(declare-fun call!48628 () Bool)

(assert (=> bm!48618 (= call!48624 call!48628)))

(declare-fun zeroValue!944 () V!43073)

(declare-datatypes ((tuple2!18006 0))(
  ( (tuple2!18007 (_1!9014 (_ BitVec 64)) (_2!9014 V!43073)) )
))
(declare-datatypes ((List!24769 0))(
  ( (Nil!24766) (Cons!24765 (h!25974 tuple2!18006) (t!35690 List!24769)) )
))
(declare-datatypes ((ListLongMap!15975 0))(
  ( (ListLongMap!15976 (toList!8003 List!24769)) )
))
(declare-fun lt!502513 () ListLongMap!15975)

(declare-fun bm!48619 () Bool)

(declare-fun c!110163 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!110164 () Bool)

(declare-fun lt!502504 () ListLongMap!15975)

(declare-fun minValue!944 () V!43073)

(declare-datatypes ((Unit!37062 0))(
  ( (Unit!37063) )
))
(declare-fun call!48626 () Unit!37062)

(declare-fun addStillContains!711 (ListLongMap!15975 (_ BitVec 64) V!43073 (_ BitVec 64)) Unit!37062)

(assert (=> bm!48619 (= call!48626 (addStillContains!711 (ite c!110163 lt!502513 lt!502504) (ite c!110163 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110164 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110163 minValue!944 (ite c!110164 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!48620 () Bool)

(declare-fun call!48625 () ListLongMap!15975)

(declare-fun +!3447 (ListLongMap!15975 tuple2!18006) ListLongMap!15975)

(assert (=> bm!48620 (= call!48625 (+!3447 (ite c!110163 lt!502513 lt!502504) (ite c!110163 (tuple2!18007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110164 (tuple2!18007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!48627 () ListLongMap!15975)

(declare-fun e!643869 () Bool)

(declare-fun call!48623 () ListLongMap!15975)

(declare-fun b!1131359 () Bool)

(declare-fun -!1177 (ListLongMap!15975 (_ BitVec 64)) ListLongMap!15975)

(assert (=> b!1131359 (= e!643869 (= call!48627 (-!1177 call!48623 k!934)))))

(declare-fun b!1131360 () Bool)

(declare-fun res!755818 () Bool)

(assert (=> b!1131360 (=> (not res!755818) (not e!643870))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131360 (= res!755818 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36076 _keys!1208))))))

(declare-fun b!1131361 () Bool)

(declare-fun res!755826 () Bool)

(assert (=> b!1131361 (=> (not res!755826) (not e!643870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131361 (= res!755826 (validMask!0 mask!1564))))

(declare-fun b!1131362 () Bool)

(declare-fun e!643868 () Bool)

(declare-fun e!643861 () Bool)

(assert (=> b!1131362 (= e!643868 e!643861)))

(declare-fun res!755829 () Bool)

(assert (=> b!1131362 (=> res!755829 e!643861)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1131362 (= res!755829 (not (= from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!502512 () array!73777)

(declare-fun lt!502515 () array!73775)

(declare-fun lt!502508 () ListLongMap!15975)

(declare-fun getCurrentListMapNoExtraKeys!4490 (array!73775 array!73777 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 32) Int) ListLongMap!15975)

(assert (=> b!1131362 (= lt!502508 (getCurrentListMapNoExtraKeys!4490 lt!502515 lt!502512 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2562 (Int (_ BitVec 64)) V!43073)

(assert (=> b!1131362 (= lt!502512 (array!73778 (store (arr!35541 _values!996) i!673 (ValueCellFull!13520 (dynLambda!2562 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36077 _values!996)))))

(declare-fun lt!502505 () ListLongMap!15975)

(assert (=> b!1131362 (= lt!502505 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131363 () Bool)

(assert (=> b!1131363 (= e!643869 (= call!48627 call!48623))))

(declare-fun b!1131364 () Bool)

(declare-fun e!643865 () Bool)

(assert (=> b!1131364 (= e!643865 (not e!643868))))

(declare-fun res!755827 () Bool)

(assert (=> b!1131364 (=> res!755827 e!643868)))

(assert (=> b!1131364 (= res!755827 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131364 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!502506 () Unit!37062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73775 (_ BitVec 64) (_ BitVec 32)) Unit!37062)

(assert (=> b!1131364 (= lt!502506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1131365 () Bool)

(declare-fun e!643862 () Bool)

(declare-fun tp_is_empty!28459 () Bool)

(assert (=> b!1131365 (= e!643862 tp_is_empty!28459)))

(declare-fun b!1131366 () Bool)

(declare-fun e!643872 () Bool)

(declare-fun lt!502511 () Bool)

(assert (=> b!1131366 (= e!643872 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502511) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1131367 () Bool)

(declare-fun res!755825 () Bool)

(assert (=> b!1131367 (=> (not res!755825) (not e!643870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73775 (_ BitVec 32)) Bool)

(assert (=> b!1131367 (= res!755825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!48622 () ListLongMap!15975)

(declare-fun bm!48621 () Bool)

(declare-fun contains!6525 (ListLongMap!15975 (_ BitVec 64)) Bool)

(assert (=> bm!48621 (= call!48628 (contains!6525 (ite c!110163 lt!502513 call!48622) k!934))))

(declare-fun b!1131368 () Bool)

(declare-fun e!643860 () Bool)

(declare-fun e!643866 () Bool)

(assert (=> b!1131368 (= e!643860 e!643866)))

(declare-fun res!755830 () Bool)

(assert (=> b!1131368 (=> res!755830 e!643866)))

(assert (=> b!1131368 (= res!755830 (not (contains!6525 lt!502504 k!934)))))

(assert (=> b!1131368 (= lt!502504 (getCurrentListMapNoExtraKeys!4490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131369 () Bool)

(declare-fun e!643867 () Unit!37062)

(declare-fun e!643864 () Unit!37062)

(assert (=> b!1131369 (= e!643867 e!643864)))

(assert (=> b!1131369 (= c!110164 (and (not lt!502511) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48622 () Bool)

(assert (=> bm!48622 (= call!48622 call!48625)))

(declare-fun b!1131370 () Bool)

(assert (=> b!1131370 call!48624))

(declare-fun lt!502509 () Unit!37062)

(declare-fun call!48621 () Unit!37062)

(assert (=> b!1131370 (= lt!502509 call!48621)))

(assert (=> b!1131370 (= e!643864 lt!502509)))

(declare-fun b!1131371 () Bool)

(declare-fun res!755822 () Bool)

(assert (=> b!1131371 (=> (not res!755822) (not e!643865))))

(declare-datatypes ((List!24770 0))(
  ( (Nil!24767) (Cons!24766 (h!25975 (_ BitVec 64)) (t!35691 List!24770)) )
))
(declare-fun arrayNoDuplicates!0 (array!73775 (_ BitVec 32) List!24770) Bool)

(assert (=> b!1131371 (= res!755822 (arrayNoDuplicates!0 lt!502515 #b00000000000000000000000000000000 Nil!24767))))

(declare-fun b!1131372 () Bool)

(assert (=> b!1131372 (= e!643861 e!643860)))

(declare-fun res!755823 () Bool)

(assert (=> b!1131372 (=> res!755823 e!643860)))

(assert (=> b!1131372 (= res!755823 (not (= (select (arr!35540 _keys!1208) from!1455) k!934)))))

(assert (=> b!1131372 e!643869))

(declare-fun c!110162 () Bool)

(assert (=> b!1131372 (= c!110162 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502516 () Unit!37062)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!431 (array!73775 array!73777 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37062)

(assert (=> b!1131372 (= lt!502516 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131373 () Bool)

(declare-fun e!643871 () Bool)

(declare-fun mapRes!44506 () Bool)

(assert (=> b!1131373 (= e!643871 (and e!643862 mapRes!44506))))

(declare-fun condMapEmpty!44506 () Bool)

(declare-fun mapDefault!44506 () ValueCell!13520)

