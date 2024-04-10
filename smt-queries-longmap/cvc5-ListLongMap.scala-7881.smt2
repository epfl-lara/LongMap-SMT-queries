; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98030 () Bool)

(assert start!98030)

(declare-fun b_free!23731 () Bool)

(declare-fun b_next!23731 () Bool)

(assert (=> start!98030 (= b_free!23731 (not b_next!23731))))

(declare-fun tp!83897 () Bool)

(declare-fun b_and!38245 () Bool)

(assert (=> start!98030 (= tp!83897 b_and!38245)))

(declare-fun b!1125008 () Bool)

(declare-fun e!640403 () Bool)

(declare-fun tp_is_empty!28261 () Bool)

(assert (=> b!1125008 (= e!640403 tp_is_empty!28261)))

(declare-fun b!1125009 () Bool)

(declare-fun e!640407 () Bool)

(assert (=> b!1125009 (= e!640407 true)))

(declare-datatypes ((V!42809 0))(
  ( (V!42810 (val!14187 Int)) )
))
(declare-datatypes ((tuple2!17824 0))(
  ( (tuple2!17825 (_1!8923 (_ BitVec 64)) (_2!8923 V!42809)) )
))
(declare-datatypes ((List!24604 0))(
  ( (Nil!24601) (Cons!24600 (h!25809 tuple2!17824) (t!35327 List!24604)) )
))
(declare-datatypes ((ListLongMap!15793 0))(
  ( (ListLongMap!15794 (toList!7912 List!24604)) )
))
(declare-fun lt!499687 () ListLongMap!15793)

(declare-fun zeroValue!944 () V!42809)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6449 (ListLongMap!15793 (_ BitVec 64)) Bool)

(declare-fun +!3419 (ListLongMap!15793 tuple2!17824) ListLongMap!15793)

(assert (=> b!1125009 (contains!6449 (+!3419 lt!499687 (tuple2!17825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!36874 0))(
  ( (Unit!36875) )
))
(declare-fun lt!499688 () Unit!36874)

(declare-fun addStillContains!681 (ListLongMap!15793 (_ BitVec 64) V!42809 (_ BitVec 64)) Unit!36874)

(assert (=> b!1125009 (= lt!499688 (addStillContains!681 lt!499687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun mapNonEmpty!44209 () Bool)

(declare-fun mapRes!44209 () Bool)

(declare-fun tp!83896 () Bool)

(assert (=> mapNonEmpty!44209 (= mapRes!44209 (and tp!83896 e!640403))))

(declare-datatypes ((ValueCell!13421 0))(
  ( (ValueCellFull!13421 (v!16820 V!42809)) (EmptyCell!13421) )
))
(declare-fun mapValue!44209 () ValueCell!13421)

(declare-fun mapRest!44209 () (Array (_ BitVec 32) ValueCell!13421))

(declare-datatypes ((array!73387 0))(
  ( (array!73388 (arr!35346 (Array (_ BitVec 32) ValueCell!13421)) (size!35882 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73387)

(declare-fun mapKey!44209 () (_ BitVec 32))

(assert (=> mapNonEmpty!44209 (= (arr!35346 _values!996) (store mapRest!44209 mapKey!44209 mapValue!44209))))

(declare-fun b!1125010 () Bool)

(declare-fun e!640410 () Bool)

(declare-fun call!47475 () ListLongMap!15793)

(declare-fun call!47476 () ListLongMap!15793)

(assert (=> b!1125010 (= e!640410 (= call!47475 call!47476))))

(declare-fun b!1125011 () Bool)

(declare-fun res!751711 () Bool)

(declare-fun e!640404 () Bool)

(assert (=> b!1125011 (=> (not res!751711) (not e!640404))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73389 0))(
  ( (array!73390 (arr!35347 (Array (_ BitVec 32) (_ BitVec 64))) (size!35883 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73389)

(assert (=> b!1125011 (= res!751711 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35883 _keys!1208))))))

(declare-fun b!1125012 () Bool)

(declare-fun e!640413 () Bool)

(declare-fun e!640409 () Bool)

(assert (=> b!1125012 (= e!640413 e!640409)))

(declare-fun res!751718 () Bool)

(assert (=> b!1125012 (=> res!751718 e!640409)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1125012 (= res!751718 (not (= (select (arr!35347 _keys!1208) from!1455) k!934)))))

(assert (=> b!1125012 e!640410))

(declare-fun c!109587 () Bool)

(assert (=> b!1125012 (= c!109587 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499685 () Unit!36874)

(declare-fun minValue!944 () V!42809)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!361 (array!73389 array!73387 (_ BitVec 32) (_ BitVec 32) V!42809 V!42809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36874)

(assert (=> b!1125012 (= lt!499685 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!361 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47472 () Bool)

(declare-fun lt!499686 () array!73387)

(declare-fun lt!499683 () array!73389)

(declare-fun getCurrentListMapNoExtraKeys!4400 (array!73389 array!73387 (_ BitVec 32) (_ BitVec 32) V!42809 V!42809 (_ BitVec 32) Int) ListLongMap!15793)

(assert (=> bm!47472 (= call!47475 (getCurrentListMapNoExtraKeys!4400 lt!499683 lt!499686 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125013 () Bool)

(declare-fun res!751707 () Bool)

(assert (=> b!1125013 (=> (not res!751707) (not e!640404))))

(assert (=> b!1125013 (= res!751707 (= (select (arr!35347 _keys!1208) i!673) k!934))))

(declare-fun b!1125014 () Bool)

(declare-fun res!751715 () Bool)

(assert (=> b!1125014 (=> (not res!751715) (not e!640404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73389 (_ BitVec 32)) Bool)

(assert (=> b!1125014 (= res!751715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125015 () Bool)

(declare-fun res!751708 () Bool)

(assert (=> b!1125015 (=> (not res!751708) (not e!640404))))

(declare-datatypes ((List!24605 0))(
  ( (Nil!24602) (Cons!24601 (h!25810 (_ BitVec 64)) (t!35328 List!24605)) )
))
(declare-fun arrayNoDuplicates!0 (array!73389 (_ BitVec 32) List!24605) Bool)

(assert (=> b!1125015 (= res!751708 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24602))))

(declare-fun b!1125016 () Bool)

(declare-fun e!640405 () Bool)

(assert (=> b!1125016 (= e!640405 e!640413)))

(declare-fun res!751706 () Bool)

(assert (=> b!1125016 (=> res!751706 e!640413)))

(assert (=> b!1125016 (= res!751706 (not (= from!1455 i!673)))))

(declare-fun lt!499681 () ListLongMap!15793)

(assert (=> b!1125016 (= lt!499681 (getCurrentListMapNoExtraKeys!4400 lt!499683 lt!499686 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2493 (Int (_ BitVec 64)) V!42809)

(assert (=> b!1125016 (= lt!499686 (array!73388 (store (arr!35346 _values!996) i!673 (ValueCellFull!13421 (dynLambda!2493 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35882 _values!996)))))

(declare-fun lt!499682 () ListLongMap!15793)

(assert (=> b!1125016 (= lt!499682 (getCurrentListMapNoExtraKeys!4400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47473 () Bool)

(assert (=> bm!47473 (= call!47476 (getCurrentListMapNoExtraKeys!4400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751709 () Bool)

(assert (=> start!98030 (=> (not res!751709) (not e!640404))))

(assert (=> start!98030 (= res!751709 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35883 _keys!1208))))))

(assert (=> start!98030 e!640404))

(assert (=> start!98030 tp_is_empty!28261))

(declare-fun array_inv!27132 (array!73389) Bool)

(assert (=> start!98030 (array_inv!27132 _keys!1208)))

(assert (=> start!98030 true))

(assert (=> start!98030 tp!83897))

(declare-fun e!640406 () Bool)

(declare-fun array_inv!27133 (array!73387) Bool)

(assert (=> start!98030 (and (array_inv!27133 _values!996) e!640406)))

(declare-fun b!1125017 () Bool)

(assert (=> b!1125017 (= e!640409 e!640407)))

(declare-fun res!751713 () Bool)

(assert (=> b!1125017 (=> res!751713 e!640407)))

(assert (=> b!1125017 (= res!751713 (not (contains!6449 lt!499687 k!934)))))

(assert (=> b!1125017 (= lt!499687 (getCurrentListMapNoExtraKeys!4400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125018 () Bool)

(declare-fun res!751719 () Bool)

(assert (=> b!1125018 (=> (not res!751719) (not e!640404))))

(assert (=> b!1125018 (= res!751719 (and (= (size!35882 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35883 _keys!1208) (size!35882 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125019 () Bool)

(declare-fun res!751717 () Bool)

(assert (=> b!1125019 (=> (not res!751717) (not e!640404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125019 (= res!751717 (validKeyInArray!0 k!934))))

(declare-fun b!1125020 () Bool)

(declare-fun res!751710 () Bool)

(assert (=> b!1125020 (=> res!751710 e!640407)))

(assert (=> b!1125020 (= res!751710 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125021 () Bool)

(declare-fun -!1114 (ListLongMap!15793 (_ BitVec 64)) ListLongMap!15793)

(assert (=> b!1125021 (= e!640410 (= call!47475 (-!1114 call!47476 k!934)))))

(declare-fun b!1125022 () Bool)

(declare-fun e!640411 () Bool)

(assert (=> b!1125022 (= e!640411 (not e!640405))))

(declare-fun res!751720 () Bool)

(assert (=> b!1125022 (=> res!751720 e!640405)))

(assert (=> b!1125022 (= res!751720 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125022 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!499684 () Unit!36874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73389 (_ BitVec 64) (_ BitVec 32)) Unit!36874)

(assert (=> b!1125022 (= lt!499684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1125023 () Bool)

(assert (=> b!1125023 (= e!640404 e!640411)))

(declare-fun res!751714 () Bool)

(assert (=> b!1125023 (=> (not res!751714) (not e!640411))))

(assert (=> b!1125023 (= res!751714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499683 mask!1564))))

(assert (=> b!1125023 (= lt!499683 (array!73390 (store (arr!35347 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35883 _keys!1208)))))

(declare-fun b!1125024 () Bool)

(declare-fun e!640408 () Bool)

(assert (=> b!1125024 (= e!640408 tp_is_empty!28261)))

(declare-fun b!1125025 () Bool)

(declare-fun res!751712 () Bool)

(assert (=> b!1125025 (=> (not res!751712) (not e!640404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125025 (= res!751712 (validMask!0 mask!1564))))

(declare-fun b!1125026 () Bool)

(declare-fun res!751716 () Bool)

(assert (=> b!1125026 (=> (not res!751716) (not e!640411))))

(assert (=> b!1125026 (= res!751716 (arrayNoDuplicates!0 lt!499683 #b00000000000000000000000000000000 Nil!24602))))

(declare-fun mapIsEmpty!44209 () Bool)

(assert (=> mapIsEmpty!44209 mapRes!44209))

(declare-fun b!1125027 () Bool)

(assert (=> b!1125027 (= e!640406 (and e!640408 mapRes!44209))))

(declare-fun condMapEmpty!44209 () Bool)

(declare-fun mapDefault!44209 () ValueCell!13421)

