; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100992 () Bool)

(assert start!100992)

(declare-fun b_free!25927 () Bool)

(declare-fun b_next!25927 () Bool)

(assert (=> start!100992 (= b_free!25927 (not b_next!25927))))

(declare-fun tp!90783 () Bool)

(declare-fun b_and!42843 () Bool)

(assert (=> start!100992 (= tp!90783 b_and!42843)))

(declare-fun b!1206734 () Bool)

(declare-fun e!685394 () Bool)

(declare-fun tp_is_empty!30631 () Bool)

(assert (=> b!1206734 (= e!685394 tp_is_empty!30631)))

(declare-fun mapIsEmpty!47802 () Bool)

(declare-fun mapRes!47802 () Bool)

(assert (=> mapIsEmpty!47802 mapRes!47802))

(declare-fun b!1206735 () Bool)

(declare-fun res!802312 () Bool)

(declare-fun e!685398 () Bool)

(assert (=> b!1206735 (=> (not res!802312) (not e!685398))))

(declare-datatypes ((array!78075 0))(
  ( (array!78076 (arr!37672 (Array (_ BitVec 32) (_ BitVec 64))) (size!38209 (_ BitVec 32))) )
))
(declare-fun lt!547238 () array!78075)

(declare-datatypes ((List!26538 0))(
  ( (Nil!26535) (Cons!26534 (h!27752 (_ BitVec 64)) (t!39437 List!26538)) )
))
(declare-fun arrayNoDuplicates!0 (array!78075 (_ BitVec 32) List!26538) Bool)

(assert (=> b!1206735 (= res!802312 (arrayNoDuplicates!0 lt!547238 #b00000000000000000000000000000000 Nil!26535))))

(declare-datatypes ((V!45969 0))(
  ( (V!45970 (val!15372 Int)) )
))
(declare-datatypes ((tuple2!19730 0))(
  ( (tuple2!19731 (_1!9876 (_ BitVec 64)) (_2!9876 V!45969)) )
))
(declare-datatypes ((List!26539 0))(
  ( (Nil!26536) (Cons!26535 (h!27753 tuple2!19730) (t!39438 List!26539)) )
))
(declare-datatypes ((ListLongMap!17707 0))(
  ( (ListLongMap!17708 (toList!8869 List!26539)) )
))
(declare-fun lt!547228 () ListLongMap!17707)

(declare-fun call!58521 () ListLongMap!17707)

(declare-fun c!118682 () Bool)

(declare-fun call!58518 () Bool)

(declare-fun bm!58515 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6949 (ListLongMap!17707 (_ BitVec 64)) Bool)

(assert (=> bm!58515 (= call!58518 (contains!6949 (ite c!118682 lt!547228 call!58521) k0!934))))

(declare-fun zeroValue!944 () V!45969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!58516 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45969)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun call!58524 () ListLongMap!17707)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14606 0))(
  ( (ValueCellFull!14606 (v!18012 V!45969)) (EmptyCell!14606) )
))
(declare-datatypes ((array!78077 0))(
  ( (array!78078 (arr!37673 (Array (_ BitVec 32) ValueCell!14606)) (size!38210 (_ BitVec 32))) )
))
(declare-fun lt!547237 () array!78077)

(declare-fun getCurrentListMapNoExtraKeys!5332 (array!78075 array!78077 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 32) Int) ListLongMap!17707)

(assert (=> bm!58516 (= call!58524 (getCurrentListMapNoExtraKeys!5332 lt!547238 lt!547237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206736 () Bool)

(declare-datatypes ((Unit!39922 0))(
  ( (Unit!39923) )
))
(declare-fun e!685396 () Unit!39922)

(declare-fun Unit!39924 () Unit!39922)

(assert (=> b!1206736 (= e!685396 Unit!39924)))

(declare-fun lt!547235 () ListLongMap!17707)

(declare-fun bm!58517 () Bool)

(declare-fun call!58519 () ListLongMap!17707)

(declare-fun c!118686 () Bool)

(declare-fun +!4033 (ListLongMap!17707 tuple2!19730) ListLongMap!17707)

(assert (=> bm!58517 (= call!58519 (+!4033 (ite c!118682 lt!547228 lt!547235) (ite c!118682 (tuple2!19731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118686 (tuple2!19731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1206737 () Bool)

(declare-fun e!685390 () Bool)

(assert (=> b!1206737 (= e!685398 (not e!685390))))

(declare-fun res!802309 () Bool)

(assert (=> b!1206737 (=> res!802309 e!685390)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206737 (= res!802309 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!78075)

(declare-fun arrayContainsKey!0 (array!78075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206737 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547232 () Unit!39922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78075 (_ BitVec 64) (_ BitVec 32)) Unit!39922)

(assert (=> b!1206737 (= lt!547232 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1206738 () Bool)

(declare-fun e!685392 () Bool)

(assert (=> b!1206738 (= e!685392 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206739 () Bool)

(declare-fun res!802311 () Bool)

(declare-fun e!685391 () Bool)

(assert (=> b!1206739 (=> (not res!802311) (not e!685391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206739 (= res!802311 (validKeyInArray!0 k0!934))))

(declare-fun b!1206740 () Bool)

(declare-fun e!685389 () Bool)

(assert (=> b!1206740 (= e!685389 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206741 () Bool)

(declare-fun e!685395 () Bool)

(assert (=> b!1206741 (= e!685395 (or (bvsge (size!38209 _keys!1208) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!38209 _keys!1208))))))

(assert (=> b!1206741 e!685389))

(declare-fun res!802298 () Bool)

(assert (=> b!1206741 (=> (not res!802298) (not e!685389))))

(assert (=> b!1206741 (= res!802298 e!685392)))

(declare-fun c!118684 () Bool)

(assert (=> b!1206741 (= c!118684 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547240 () Unit!39922)

(declare-fun _values!996 () array!78077)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!572 (array!78075 array!78077 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 64) (_ BitVec 32) Int) Unit!39922)

(assert (=> b!1206741 (= lt!547240 (lemmaListMapContainsThenArrayContainsFrom!572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547234 () Unit!39922)

(declare-fun e!685401 () Unit!39922)

(assert (=> b!1206741 (= lt!547234 e!685401)))

(declare-fun lt!547233 () Bool)

(assert (=> b!1206741 (= c!118682 (and (not lt!547233) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206741 (= lt!547233 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206742 () Bool)

(declare-fun e!685399 () Bool)

(assert (=> b!1206742 (= e!685390 e!685399)))

(declare-fun res!802305 () Bool)

(assert (=> b!1206742 (=> res!802305 e!685399)))

(assert (=> b!1206742 (= res!802305 (not (= from!1455 i!673)))))

(declare-fun lt!547230 () ListLongMap!17707)

(assert (=> b!1206742 (= lt!547230 (getCurrentListMapNoExtraKeys!5332 lt!547238 lt!547237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3255 (Int (_ BitVec 64)) V!45969)

(assert (=> b!1206742 (= lt!547237 (array!78078 (store (arr!37673 _values!996) i!673 (ValueCellFull!14606 (dynLambda!3255 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38210 _values!996)))))

(declare-fun lt!547241 () ListLongMap!17707)

(assert (=> b!1206742 (= lt!547241 (getCurrentListMapNoExtraKeys!5332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206743 () Bool)

(declare-fun res!802300 () Bool)

(assert (=> b!1206743 (=> (not res!802300) (not e!685391))))

(assert (=> b!1206743 (= res!802300 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38209 _keys!1208))))))

(declare-fun bm!58518 () Bool)

(declare-fun call!58525 () ListLongMap!17707)

(assert (=> bm!58518 (= call!58525 (getCurrentListMapNoExtraKeys!5332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58519 () Bool)

(declare-fun call!58522 () Unit!39922)

(declare-fun call!58520 () Unit!39922)

(assert (=> bm!58519 (= call!58522 call!58520)))

(declare-fun b!1206744 () Bool)

(declare-fun res!802302 () Bool)

(assert (=> b!1206744 (=> (not res!802302) (not e!685391))))

(assert (=> b!1206744 (= res!802302 (and (= (size!38210 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38209 _keys!1208) (size!38210 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206745 () Bool)

(declare-fun e!685402 () Bool)

(assert (=> b!1206745 (= e!685402 (and e!685394 mapRes!47802))))

(declare-fun condMapEmpty!47802 () Bool)

(declare-fun mapDefault!47802 () ValueCell!14606)

(assert (=> b!1206745 (= condMapEmpty!47802 (= (arr!37673 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14606)) mapDefault!47802)))))

(declare-fun mapNonEmpty!47802 () Bool)

(declare-fun tp!90784 () Bool)

(declare-fun e!685403 () Bool)

(assert (=> mapNonEmpty!47802 (= mapRes!47802 (and tp!90784 e!685403))))

(declare-fun mapKey!47802 () (_ BitVec 32))

(declare-fun mapRest!47802 () (Array (_ BitVec 32) ValueCell!14606))

(declare-fun mapValue!47802 () ValueCell!14606)

(assert (=> mapNonEmpty!47802 (= (arr!37673 _values!996) (store mapRest!47802 mapKey!47802 mapValue!47802))))

(declare-fun b!1206746 () Bool)

(declare-fun lt!547236 () Unit!39922)

(assert (=> b!1206746 (= e!685401 lt!547236)))

(declare-fun lt!547229 () Unit!39922)

(declare-fun addStillContains!1017 (ListLongMap!17707 (_ BitVec 64) V!45969 (_ BitVec 64)) Unit!39922)

(assert (=> b!1206746 (= lt!547229 (addStillContains!1017 lt!547235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1206746 (= lt!547228 (+!4033 lt!547235 (tuple2!19731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1206746 call!58518))

(assert (=> b!1206746 (= lt!547236 call!58520)))

(assert (=> b!1206746 (contains!6949 call!58519 k0!934)))

(declare-fun res!802303 () Bool)

(assert (=> start!100992 (=> (not res!802303) (not e!685391))))

(assert (=> start!100992 (= res!802303 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38209 _keys!1208))))))

(assert (=> start!100992 e!685391))

(assert (=> start!100992 tp_is_empty!30631))

(declare-fun array_inv!28766 (array!78075) Bool)

(assert (=> start!100992 (array_inv!28766 _keys!1208)))

(assert (=> start!100992 true))

(assert (=> start!100992 tp!90783))

(declare-fun array_inv!28767 (array!78077) Bool)

(assert (=> start!100992 (and (array_inv!28767 _values!996) e!685402)))

(declare-fun b!1206747 () Bool)

(declare-fun e!685400 () Bool)

(assert (=> b!1206747 (= e!685399 e!685400)))

(declare-fun res!802307 () Bool)

(assert (=> b!1206747 (=> res!802307 e!685400)))

(assert (=> b!1206747 (= res!802307 (not (= (select (arr!37672 _keys!1208) from!1455) k0!934)))))

(declare-fun e!685397 () Bool)

(assert (=> b!1206747 e!685397))

(declare-fun c!118683 () Bool)

(assert (=> b!1206747 (= c!118683 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547227 () Unit!39922)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1030 (array!78075 array!78077 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39922)

(assert (=> b!1206747 (= lt!547227 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1030 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206748 () Bool)

(assert (=> b!1206748 (= e!685397 (= call!58524 call!58525))))

(declare-fun bm!58520 () Bool)

(assert (=> bm!58520 (= call!58520 (addStillContains!1017 (ite c!118682 lt!547228 lt!547235) (ite c!118682 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118686 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118682 minValue!944 (ite c!118686 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1206749 () Bool)

(assert (=> b!1206749 (= e!685392 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547233) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206750 () Bool)

(declare-fun -!1812 (ListLongMap!17707 (_ BitVec 64)) ListLongMap!17707)

(assert (=> b!1206750 (= e!685397 (= call!58524 (-!1812 call!58525 k0!934)))))

(declare-fun b!1206751 () Bool)

(assert (=> b!1206751 (= e!685391 e!685398)))

(declare-fun res!802306 () Bool)

(assert (=> b!1206751 (=> (not res!802306) (not e!685398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78075 (_ BitVec 32)) Bool)

(assert (=> b!1206751 (= res!802306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547238 mask!1564))))

(assert (=> b!1206751 (= lt!547238 (array!78076 (store (arr!37672 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38209 _keys!1208)))))

(declare-fun b!1206752 () Bool)

(assert (=> b!1206752 (= e!685403 tp_is_empty!30631)))

(declare-fun bm!58521 () Bool)

(declare-fun call!58523 () Bool)

(assert (=> bm!58521 (= call!58523 call!58518)))

(declare-fun b!1206753 () Bool)

(declare-fun res!802310 () Bool)

(assert (=> b!1206753 (=> (not res!802310) (not e!685391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206753 (= res!802310 (validMask!0 mask!1564))))

(declare-fun b!1206754 () Bool)

(declare-fun c!118685 () Bool)

(assert (=> b!1206754 (= c!118685 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547233))))

(declare-fun e!685393 () Unit!39922)

(assert (=> b!1206754 (= e!685393 e!685396)))

(declare-fun bm!58522 () Bool)

(assert (=> bm!58522 (= call!58521 call!58519)))

(declare-fun b!1206755 () Bool)

(declare-fun res!802301 () Bool)

(assert (=> b!1206755 (=> (not res!802301) (not e!685391))))

(assert (=> b!1206755 (= res!802301 (= (select (arr!37672 _keys!1208) i!673) k0!934))))

(declare-fun b!1206756 () Bool)

(assert (=> b!1206756 call!58523))

(declare-fun lt!547239 () Unit!39922)

(assert (=> b!1206756 (= lt!547239 call!58522)))

(assert (=> b!1206756 (= e!685393 lt!547239)))

(declare-fun b!1206757 () Bool)

(assert (=> b!1206757 (= e!685401 e!685393)))

(assert (=> b!1206757 (= c!118686 (and (not lt!547233) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206758 () Bool)

(declare-fun res!802299 () Bool)

(assert (=> b!1206758 (=> (not res!802299) (not e!685391))))

(assert (=> b!1206758 (= res!802299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206759 () Bool)

(assert (=> b!1206759 (= e!685400 e!685395)))

(declare-fun res!802304 () Bool)

(assert (=> b!1206759 (=> res!802304 e!685395)))

(assert (=> b!1206759 (= res!802304 (not (contains!6949 lt!547235 k0!934)))))

(assert (=> b!1206759 (= lt!547235 (getCurrentListMapNoExtraKeys!5332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206760 () Bool)

(declare-fun res!802308 () Bool)

(assert (=> b!1206760 (=> (not res!802308) (not e!685391))))

(assert (=> b!1206760 (= res!802308 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26535))))

(declare-fun b!1206761 () Bool)

(declare-fun lt!547231 () Unit!39922)

(assert (=> b!1206761 (= e!685396 lt!547231)))

(assert (=> b!1206761 (= lt!547231 call!58522)))

(assert (=> b!1206761 call!58523))

(assert (= (and start!100992 res!802303) b!1206753))

(assert (= (and b!1206753 res!802310) b!1206744))

(assert (= (and b!1206744 res!802302) b!1206758))

(assert (= (and b!1206758 res!802299) b!1206760))

(assert (= (and b!1206760 res!802308) b!1206743))

(assert (= (and b!1206743 res!802300) b!1206739))

(assert (= (and b!1206739 res!802311) b!1206755))

(assert (= (and b!1206755 res!802301) b!1206751))

(assert (= (and b!1206751 res!802306) b!1206735))

(assert (= (and b!1206735 res!802312) b!1206737))

(assert (= (and b!1206737 (not res!802309)) b!1206742))

(assert (= (and b!1206742 (not res!802305)) b!1206747))

(assert (= (and b!1206747 c!118683) b!1206750))

(assert (= (and b!1206747 (not c!118683)) b!1206748))

(assert (= (or b!1206750 b!1206748) bm!58516))

(assert (= (or b!1206750 b!1206748) bm!58518))

(assert (= (and b!1206747 (not res!802307)) b!1206759))

(assert (= (and b!1206759 (not res!802304)) b!1206741))

(assert (= (and b!1206741 c!118682) b!1206746))

(assert (= (and b!1206741 (not c!118682)) b!1206757))

(assert (= (and b!1206757 c!118686) b!1206756))

(assert (= (and b!1206757 (not c!118686)) b!1206754))

(assert (= (and b!1206754 c!118685) b!1206761))

(assert (= (and b!1206754 (not c!118685)) b!1206736))

(assert (= (or b!1206756 b!1206761) bm!58519))

(assert (= (or b!1206756 b!1206761) bm!58522))

(assert (= (or b!1206756 b!1206761) bm!58521))

(assert (= (or b!1206746 bm!58521) bm!58515))

(assert (= (or b!1206746 bm!58519) bm!58520))

(assert (= (or b!1206746 bm!58522) bm!58517))

(assert (= (and b!1206741 c!118684) b!1206738))

(assert (= (and b!1206741 (not c!118684)) b!1206749))

(assert (= (and b!1206741 res!802298) b!1206740))

(assert (= (and b!1206745 condMapEmpty!47802) mapIsEmpty!47802))

(assert (= (and b!1206745 (not condMapEmpty!47802)) mapNonEmpty!47802))

(get-info :version)

(assert (= (and mapNonEmpty!47802 ((_ is ValueCellFull!14606) mapValue!47802)) b!1206752))

(assert (= (and b!1206745 ((_ is ValueCellFull!14606) mapDefault!47802)) b!1206734))

(assert (= start!100992 b!1206745))

(declare-fun b_lambda!21325 () Bool)

(assert (=> (not b_lambda!21325) (not b!1206742)))

(declare-fun t!39436 () Bool)

(declare-fun tb!10719 () Bool)

(assert (=> (and start!100992 (= defaultEntry!1004 defaultEntry!1004) t!39436) tb!10719))

(declare-fun result!22031 () Bool)

(assert (=> tb!10719 (= result!22031 tp_is_empty!30631)))

(assert (=> b!1206742 t!39436))

(declare-fun b_and!42845 () Bool)

(assert (= b_and!42843 (and (=> t!39436 result!22031) b_and!42845)))

(declare-fun m!1112939 () Bool)

(assert (=> b!1206738 m!1112939))

(declare-fun m!1112941 () Bool)

(assert (=> b!1206750 m!1112941))

(declare-fun m!1112943 () Bool)

(assert (=> b!1206760 m!1112943))

(assert (=> b!1206740 m!1112939))

(declare-fun m!1112945 () Bool)

(assert (=> b!1206735 m!1112945))

(declare-fun m!1112947 () Bool)

(assert (=> bm!58516 m!1112947))

(declare-fun m!1112949 () Bool)

(assert (=> b!1206747 m!1112949))

(declare-fun m!1112951 () Bool)

(assert (=> b!1206747 m!1112951))

(declare-fun m!1112953 () Bool)

(assert (=> b!1206755 m!1112953))

(declare-fun m!1112955 () Bool)

(assert (=> b!1206759 m!1112955))

(declare-fun m!1112957 () Bool)

(assert (=> b!1206759 m!1112957))

(declare-fun m!1112959 () Bool)

(assert (=> b!1206741 m!1112959))

(declare-fun m!1112961 () Bool)

(assert (=> b!1206742 m!1112961))

(declare-fun m!1112963 () Bool)

(assert (=> b!1206742 m!1112963))

(declare-fun m!1112965 () Bool)

(assert (=> b!1206742 m!1112965))

(declare-fun m!1112967 () Bool)

(assert (=> b!1206742 m!1112967))

(declare-fun m!1112969 () Bool)

(assert (=> bm!58515 m!1112969))

(declare-fun m!1112971 () Bool)

(assert (=> b!1206753 m!1112971))

(declare-fun m!1112973 () Bool)

(assert (=> b!1206746 m!1112973))

(declare-fun m!1112975 () Bool)

(assert (=> b!1206746 m!1112975))

(declare-fun m!1112977 () Bool)

(assert (=> b!1206746 m!1112977))

(declare-fun m!1112979 () Bool)

(assert (=> mapNonEmpty!47802 m!1112979))

(declare-fun m!1112981 () Bool)

(assert (=> bm!58520 m!1112981))

(declare-fun m!1112983 () Bool)

(assert (=> b!1206758 m!1112983))

(assert (=> bm!58518 m!1112957))

(declare-fun m!1112985 () Bool)

(assert (=> b!1206739 m!1112985))

(declare-fun m!1112987 () Bool)

(assert (=> b!1206737 m!1112987))

(declare-fun m!1112989 () Bool)

(assert (=> b!1206737 m!1112989))

(declare-fun m!1112991 () Bool)

(assert (=> bm!58517 m!1112991))

(declare-fun m!1112993 () Bool)

(assert (=> start!100992 m!1112993))

(declare-fun m!1112995 () Bool)

(assert (=> start!100992 m!1112995))

(declare-fun m!1112997 () Bool)

(assert (=> b!1206751 m!1112997))

(declare-fun m!1112999 () Bool)

(assert (=> b!1206751 m!1112999))

(check-sat (not b!1206735) (not b!1206759) (not bm!58516) (not b!1206746) (not b!1206742) (not b!1206760) (not bm!58520) (not b!1206753) (not mapNonEmpty!47802) (not bm!58518) (not b!1206740) b_and!42845 (not start!100992) (not bm!58517) (not b!1206737) (not b!1206739) (not b!1206750) (not b!1206758) (not b_next!25927) (not b!1206751) (not bm!58515) (not b!1206747) (not b!1206738) tp_is_empty!30631 (not b!1206741) (not b_lambda!21325))
(check-sat b_and!42845 (not b_next!25927))
