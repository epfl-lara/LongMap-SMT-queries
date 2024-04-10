; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98236 () Bool)

(assert start!98236)

(declare-fun b_free!23937 () Bool)

(declare-fun b_next!23937 () Bool)

(assert (=> start!98236 (= b_free!23937 (not b_next!23937))))

(declare-fun tp!84514 () Bool)

(declare-fun b_and!38657 () Bool)

(assert (=> start!98236 (= tp!84514 b_and!38657)))

(declare-fun mapNonEmpty!44518 () Bool)

(declare-fun mapRes!44518 () Bool)

(declare-fun tp!84515 () Bool)

(declare-fun e!644040 () Bool)

(assert (=> mapNonEmpty!44518 (= mapRes!44518 (and tp!84515 e!644040))))

(declare-datatypes ((V!43083 0))(
  ( (V!43084 (val!14290 Int)) )
))
(declare-datatypes ((ValueCell!13524 0))(
  ( (ValueCellFull!13524 (v!16923 V!43083)) (EmptyCell!13524) )
))
(declare-fun mapValue!44518 () ValueCell!13524)

(declare-datatypes ((array!73791 0))(
  ( (array!73792 (arr!35548 (Array (_ BitVec 32) ValueCell!13524)) (size!36084 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73791)

(declare-fun mapKey!44518 () (_ BitVec 32))

(declare-fun mapRest!44518 () (Array (_ BitVec 32) ValueCell!13524))

(assert (=> mapNonEmpty!44518 (= (arr!35548 _values!996) (store mapRest!44518 mapKey!44518 mapValue!44518))))

(declare-fun b!1131690 () Bool)

(declare-fun e!644042 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73793 0))(
  ( (array!73794 (arr!35549 (Array (_ BitVec 32) (_ BitVec 64))) (size!36085 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73793)

(assert (=> b!1131690 (= e!644042 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 _keys!1208))))))

(declare-fun e!644041 () Bool)

(assert (=> b!1131690 e!644041))

(declare-fun c!110225 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1131690 (= c!110225 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!43083)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37073 0))(
  ( (Unit!37074) )
))
(declare-fun lt!502697 () Unit!37073)

(declare-fun minValue!944 () V!43083)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!323 (array!73793 array!73791 (_ BitVec 32) (_ BitVec 32) V!43083 V!43083 (_ BitVec 64) (_ BitVec 32) Int) Unit!37073)

(assert (=> b!1131690 (= lt!502697 (lemmaListMapContainsThenArrayContainsFrom!323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502686 () Unit!37073)

(declare-fun e!644044 () Unit!37073)

(assert (=> b!1131690 (= lt!502686 e!644044)))

(declare-fun c!110224 () Bool)

(declare-fun lt!502690 () Bool)

(assert (=> b!1131690 (= c!110224 (and (not lt!502690) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131690 (= lt!502690 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48714 () Bool)

(declare-fun call!48722 () Bool)

(declare-fun call!48723 () Bool)

(assert (=> bm!48714 (= call!48722 call!48723)))

(declare-fun b!1131691 () Bool)

(declare-fun e!644047 () Unit!37073)

(declare-fun Unit!37075 () Unit!37073)

(assert (=> b!1131691 (= e!644047 Unit!37075)))

(declare-fun b!1131692 () Bool)

(declare-fun arrayContainsKey!0 (array!73793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131692 (= e!644041 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1131693 () Bool)

(declare-fun res!755991 () Bool)

(declare-fun e!644049 () Bool)

(assert (=> b!1131693 (=> (not res!755991) (not e!644049))))

(declare-datatypes ((List!24777 0))(
  ( (Nil!24774) (Cons!24773 (h!25982 (_ BitVec 64)) (t!35706 List!24777)) )
))
(declare-fun arrayNoDuplicates!0 (array!73793 (_ BitVec 32) List!24777) Bool)

(assert (=> b!1131693 (= res!755991 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24774))))

(declare-fun b!1131694 () Bool)

(declare-fun res!755998 () Bool)

(assert (=> b!1131694 (=> (not res!755998) (not e!644049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73793 (_ BitVec 32)) Bool)

(assert (=> b!1131694 (= res!755998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131695 () Bool)

(assert (=> b!1131695 call!48722))

(declare-fun lt!502691 () Unit!37073)

(declare-fun call!48724 () Unit!37073)

(assert (=> b!1131695 (= lt!502691 call!48724)))

(declare-fun e!644046 () Unit!37073)

(assert (=> b!1131695 (= e!644046 lt!502691)))

(declare-fun c!110226 () Bool)

(declare-datatypes ((tuple2!18014 0))(
  ( (tuple2!18015 (_1!9018 (_ BitVec 64)) (_2!9018 V!43083)) )
))
(declare-datatypes ((List!24778 0))(
  ( (Nil!24775) (Cons!24774 (h!25983 tuple2!18014) (t!35707 List!24778)) )
))
(declare-datatypes ((ListLongMap!15983 0))(
  ( (ListLongMap!15984 (toList!8007 List!24778)) )
))
(declare-fun call!48719 () ListLongMap!15983)

(declare-fun lt!502693 () ListLongMap!15983)

(declare-fun bm!48716 () Bool)

(declare-fun +!3451 (ListLongMap!15983 tuple2!18014) ListLongMap!15983)

(assert (=> bm!48716 (= call!48719 (+!3451 lt!502693 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1131696 () Bool)

(assert (=> b!1131696 (= e!644041 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502690) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1131697 () Bool)

(declare-fun e!644038 () Bool)

(declare-fun tp_is_empty!28467 () Bool)

(assert (=> b!1131697 (= e!644038 tp_is_empty!28467)))

(declare-fun b!1131698 () Bool)

(declare-fun e!644045 () Bool)

(declare-fun call!48717 () ListLongMap!15983)

(declare-fun call!48718 () ListLongMap!15983)

(assert (=> b!1131698 (= e!644045 (= call!48717 call!48718))))

(declare-fun bm!48717 () Bool)

(declare-fun lt!502695 () array!73793)

(declare-fun c!110222 () Bool)

(declare-fun lt!502685 () array!73791)

(declare-fun getCurrentListMapNoExtraKeys!4494 (array!73793 array!73791 (_ BitVec 32) (_ BitVec 32) V!43083 V!43083 (_ BitVec 32) Int) ListLongMap!15983)

(assert (=> bm!48717 (= call!48717 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 _keys!1208 lt!502695) (ite c!110222 _values!996 lt!502685) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44518 () Bool)

(assert (=> mapIsEmpty!44518 mapRes!44518))

(declare-fun call!48721 () Unit!37073)

(declare-fun bm!48718 () Bool)

(declare-fun addStillContains!714 (ListLongMap!15983 (_ BitVec 64) V!43083 (_ BitVec 64)) Unit!37073)

(assert (=> bm!48718 (= call!48721 (addStillContains!714 lt!502693 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1131699 () Bool)

(assert (=> b!1131699 (= e!644040 tp_is_empty!28467)))

(declare-fun b!1131700 () Bool)

(assert (=> b!1131700 (= e!644044 e!644046)))

(assert (=> b!1131700 (= c!110226 (and (not lt!502690) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131701 () Bool)

(declare-fun e!644051 () Bool)

(assert (=> b!1131701 (= e!644051 e!644042)))

(declare-fun res!755989 () Bool)

(assert (=> b!1131701 (=> res!755989 e!644042)))

(declare-fun contains!6529 (ListLongMap!15983 (_ BitVec 64)) Bool)

(assert (=> b!1131701 (= res!755989 (not (contains!6529 lt!502693 k0!934)))))

(assert (=> b!1131701 (= lt!502693 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131702 () Bool)

(declare-fun res!755993 () Bool)

(assert (=> b!1131702 (=> (not res!755993) (not e!644049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131702 (= res!755993 (validMask!0 mask!1564))))

(declare-fun b!1131703 () Bool)

(declare-fun res!755997 () Bool)

(declare-fun e!644052 () Bool)

(assert (=> b!1131703 (=> (not res!755997) (not e!644052))))

(assert (=> b!1131703 (= res!755997 (arrayNoDuplicates!0 lt!502695 #b00000000000000000000000000000000 Nil!24774))))

(declare-fun b!1131704 () Bool)

(declare-fun e!644039 () Bool)

(assert (=> b!1131704 (= e!644039 e!644051)))

(declare-fun res!755995 () Bool)

(assert (=> b!1131704 (=> res!755995 e!644051)))

(assert (=> b!1131704 (= res!755995 (not (= (select (arr!35549 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1131704 e!644045))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131704 (= c!110222 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502689 () Unit!37073)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 (array!73793 array!73791 (_ BitVec 32) (_ BitVec 32) V!43083 V!43083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37073)

(assert (=> b!1131704 (= lt!502689 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131705 () Bool)

(declare-fun e!644048 () Bool)

(assert (=> b!1131705 (= e!644048 e!644039)))

(declare-fun res!755988 () Bool)

(assert (=> b!1131705 (=> res!755988 e!644039)))

(assert (=> b!1131705 (= res!755988 (not (= from!1455 i!673)))))

(declare-fun lt!502683 () ListLongMap!15983)

(assert (=> b!1131705 (= lt!502683 (getCurrentListMapNoExtraKeys!4494 lt!502695 lt!502685 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2564 (Int (_ BitVec 64)) V!43083)

(assert (=> b!1131705 (= lt!502685 (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996)))))

(declare-fun lt!502692 () ListLongMap!15983)

(assert (=> b!1131705 (= lt!502692 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131706 () Bool)

(declare-fun res!755996 () Bool)

(assert (=> b!1131706 (=> (not res!755996) (not e!644049))))

(assert (=> b!1131706 (= res!755996 (and (= (size!36084 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36085 _keys!1208) (size!36084 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48719 () Bool)

(assert (=> bm!48719 (= call!48718 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 lt!502695 _keys!1208) (ite c!110222 lt!502685 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131707 () Bool)

(declare-fun -!1179 (ListLongMap!15983 (_ BitVec 64)) ListLongMap!15983)

(assert (=> b!1131707 (= e!644045 (= call!48718 (-!1179 call!48717 k0!934)))))

(declare-fun b!1131708 () Bool)

(declare-fun res!755985 () Bool)

(assert (=> b!1131708 (=> (not res!755985) (not e!644049))))

(assert (=> b!1131708 (= res!755985 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36085 _keys!1208))))))

(declare-fun b!1131709 () Bool)

(declare-fun e!644050 () Bool)

(assert (=> b!1131709 (= e!644050 (and e!644038 mapRes!44518))))

(declare-fun condMapEmpty!44518 () Bool)

(declare-fun mapDefault!44518 () ValueCell!13524)

(assert (=> b!1131709 (= condMapEmpty!44518 (= (arr!35548 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13524)) mapDefault!44518)))))

(declare-fun bm!48720 () Bool)

(declare-fun lt!502694 () ListLongMap!15983)

(declare-fun call!48720 () ListLongMap!15983)

(assert (=> bm!48720 (= call!48723 (contains!6529 (ite c!110224 lt!502694 call!48720) k0!934))))

(declare-fun b!1131710 () Bool)

(declare-fun lt!502684 () Unit!37073)

(assert (=> b!1131710 (= e!644044 lt!502684)))

(declare-fun lt!502696 () Unit!37073)

(assert (=> b!1131710 (= lt!502696 call!48721)))

(assert (=> b!1131710 (= lt!502694 call!48719)))

(assert (=> b!1131710 call!48723))

(assert (=> b!1131710 (= lt!502684 (addStillContains!714 lt!502694 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1131710 (contains!6529 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1131711 () Bool)

(assert (=> b!1131711 (= e!644052 (not e!644048))))

(declare-fun res!755986 () Bool)

(assert (=> b!1131711 (=> res!755986 e!644048)))

(assert (=> b!1131711 (= res!755986 (bvsgt from!1455 i!673))))

(assert (=> b!1131711 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502687 () Unit!37073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73793 (_ BitVec 64) (_ BitVec 32)) Unit!37073)

(assert (=> b!1131711 (= lt!502687 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!755992 () Bool)

(assert (=> start!98236 (=> (not res!755992) (not e!644049))))

(assert (=> start!98236 (= res!755992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36085 _keys!1208))))))

(assert (=> start!98236 e!644049))

(assert (=> start!98236 tp_is_empty!28467))

(declare-fun array_inv!27268 (array!73793) Bool)

(assert (=> start!98236 (array_inv!27268 _keys!1208)))

(assert (=> start!98236 true))

(assert (=> start!98236 tp!84514))

(declare-fun array_inv!27269 (array!73791) Bool)

(assert (=> start!98236 (and (array_inv!27269 _values!996) e!644050)))

(declare-fun bm!48715 () Bool)

(assert (=> bm!48715 (= call!48720 call!48719)))

(declare-fun b!1131712 () Bool)

(declare-fun res!755990 () Bool)

(assert (=> b!1131712 (=> (not res!755990) (not e!644049))))

(assert (=> b!1131712 (= res!755990 (= (select (arr!35549 _keys!1208) i!673) k0!934))))

(declare-fun b!1131713 () Bool)

(declare-fun c!110223 () Bool)

(assert (=> b!1131713 (= c!110223 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502690))))

(assert (=> b!1131713 (= e!644046 e!644047)))

(declare-fun b!1131714 () Bool)

(declare-fun res!755987 () Bool)

(assert (=> b!1131714 (=> (not res!755987) (not e!644049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131714 (= res!755987 (validKeyInArray!0 k0!934))))

(declare-fun b!1131715 () Bool)

(declare-fun lt!502688 () Unit!37073)

(assert (=> b!1131715 (= e!644047 lt!502688)))

(assert (=> b!1131715 (= lt!502688 call!48724)))

(assert (=> b!1131715 call!48722))

(declare-fun bm!48721 () Bool)

(assert (=> bm!48721 (= call!48724 call!48721)))

(declare-fun b!1131716 () Bool)

(assert (=> b!1131716 (= e!644049 e!644052)))

(declare-fun res!755994 () Bool)

(assert (=> b!1131716 (=> (not res!755994) (not e!644052))))

(assert (=> b!1131716 (= res!755994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502695 mask!1564))))

(assert (=> b!1131716 (= lt!502695 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)))))

(assert (= (and start!98236 res!755992) b!1131702))

(assert (= (and b!1131702 res!755993) b!1131706))

(assert (= (and b!1131706 res!755996) b!1131694))

(assert (= (and b!1131694 res!755998) b!1131693))

(assert (= (and b!1131693 res!755991) b!1131708))

(assert (= (and b!1131708 res!755985) b!1131714))

(assert (= (and b!1131714 res!755987) b!1131712))

(assert (= (and b!1131712 res!755990) b!1131716))

(assert (= (and b!1131716 res!755994) b!1131703))

(assert (= (and b!1131703 res!755997) b!1131711))

(assert (= (and b!1131711 (not res!755986)) b!1131705))

(assert (= (and b!1131705 (not res!755988)) b!1131704))

(assert (= (and b!1131704 c!110222) b!1131707))

(assert (= (and b!1131704 (not c!110222)) b!1131698))

(assert (= (or b!1131707 b!1131698) bm!48717))

(assert (= (or b!1131707 b!1131698) bm!48719))

(assert (= (and b!1131704 (not res!755995)) b!1131701))

(assert (= (and b!1131701 (not res!755989)) b!1131690))

(assert (= (and b!1131690 c!110224) b!1131710))

(assert (= (and b!1131690 (not c!110224)) b!1131700))

(assert (= (and b!1131700 c!110226) b!1131695))

(assert (= (and b!1131700 (not c!110226)) b!1131713))

(assert (= (and b!1131713 c!110223) b!1131715))

(assert (= (and b!1131713 (not c!110223)) b!1131691))

(assert (= (or b!1131695 b!1131715) bm!48721))

(assert (= (or b!1131695 b!1131715) bm!48715))

(assert (= (or b!1131695 b!1131715) bm!48714))

(assert (= (or b!1131710 bm!48714) bm!48720))

(assert (= (or b!1131710 bm!48721) bm!48718))

(assert (= (or b!1131710 bm!48715) bm!48716))

(assert (= (and b!1131690 c!110225) b!1131692))

(assert (= (and b!1131690 (not c!110225)) b!1131696))

(assert (= (and b!1131709 condMapEmpty!44518) mapIsEmpty!44518))

(assert (= (and b!1131709 (not condMapEmpty!44518)) mapNonEmpty!44518))

(get-info :version)

(assert (= (and mapNonEmpty!44518 ((_ is ValueCellFull!13524) mapValue!44518)) b!1131699))

(assert (= (and b!1131709 ((_ is ValueCellFull!13524) mapDefault!44518)) b!1131697))

(assert (= start!98236 b!1131709))

(declare-fun b_lambda!18907 () Bool)

(assert (=> (not b_lambda!18907) (not b!1131705)))

(declare-fun t!35705 () Bool)

(declare-fun tb!8749 () Bool)

(assert (=> (and start!98236 (= defaultEntry!1004 defaultEntry!1004) t!35705) tb!8749))

(declare-fun result!18059 () Bool)

(assert (=> tb!8749 (= result!18059 tp_is_empty!28467)))

(assert (=> b!1131705 t!35705))

(declare-fun b_and!38659 () Bool)

(assert (= b_and!38657 (and (=> t!35705 result!18059) b_and!38659)))

(declare-fun m!1044555 () Bool)

(assert (=> b!1131712 m!1044555))

(declare-fun m!1044557 () Bool)

(assert (=> b!1131701 m!1044557))

(declare-fun m!1044559 () Bool)

(assert (=> b!1131701 m!1044559))

(declare-fun m!1044561 () Bool)

(assert (=> b!1131692 m!1044561))

(declare-fun m!1044563 () Bool)

(assert (=> b!1131704 m!1044563))

(declare-fun m!1044565 () Bool)

(assert (=> b!1131704 m!1044565))

(declare-fun m!1044567 () Bool)

(assert (=> bm!48718 m!1044567))

(declare-fun m!1044569 () Bool)

(assert (=> bm!48720 m!1044569))

(declare-fun m!1044571 () Bool)

(assert (=> mapNonEmpty!44518 m!1044571))

(declare-fun m!1044573 () Bool)

(assert (=> b!1131690 m!1044573))

(declare-fun m!1044575 () Bool)

(assert (=> b!1131716 m!1044575))

(declare-fun m!1044577 () Bool)

(assert (=> b!1131716 m!1044577))

(declare-fun m!1044579 () Bool)

(assert (=> start!98236 m!1044579))

(declare-fun m!1044581 () Bool)

(assert (=> start!98236 m!1044581))

(declare-fun m!1044583 () Bool)

(assert (=> b!1131702 m!1044583))

(declare-fun m!1044585 () Bool)

(assert (=> b!1131707 m!1044585))

(declare-fun m!1044587 () Bool)

(assert (=> b!1131705 m!1044587))

(declare-fun m!1044589 () Bool)

(assert (=> b!1131705 m!1044589))

(declare-fun m!1044591 () Bool)

(assert (=> b!1131705 m!1044591))

(declare-fun m!1044593 () Bool)

(assert (=> b!1131705 m!1044593))

(declare-fun m!1044595 () Bool)

(assert (=> b!1131710 m!1044595))

(declare-fun m!1044597 () Bool)

(assert (=> b!1131710 m!1044597))

(assert (=> b!1131710 m!1044597))

(declare-fun m!1044599 () Bool)

(assert (=> b!1131710 m!1044599))

(declare-fun m!1044601 () Bool)

(assert (=> b!1131703 m!1044601))

(declare-fun m!1044603 () Bool)

(assert (=> b!1131714 m!1044603))

(declare-fun m!1044605 () Bool)

(assert (=> b!1131694 m!1044605))

(declare-fun m!1044607 () Bool)

(assert (=> b!1131711 m!1044607))

(declare-fun m!1044609 () Bool)

(assert (=> b!1131711 m!1044609))

(declare-fun m!1044611 () Bool)

(assert (=> bm!48719 m!1044611))

(declare-fun m!1044613 () Bool)

(assert (=> bm!48716 m!1044613))

(declare-fun m!1044615 () Bool)

(assert (=> bm!48717 m!1044615))

(declare-fun m!1044617 () Bool)

(assert (=> b!1131693 m!1044617))

(check-sat (not b!1131707) (not mapNonEmpty!44518) (not b!1131711) (not bm!48718) (not bm!48720) (not b!1131716) (not b!1131693) (not b!1131701) (not bm!48719) (not b!1131704) (not bm!48716) (not b!1131692) (not start!98236) (not b!1131703) (not bm!48717) (not b!1131710) (not b!1131714) tp_is_empty!28467 b_and!38659 (not b!1131705) (not b!1131690) (not b_next!23937) (not b!1131702) (not b_lambda!18907) (not b!1131694))
(check-sat b_and!38659 (not b_next!23937))
(get-model)

(declare-fun b_lambda!18911 () Bool)

(assert (= b_lambda!18907 (or (and start!98236 b_free!23937) b_lambda!18911)))

(check-sat (not b!1131707) (not mapNonEmpty!44518) (not b!1131711) (not bm!48718) (not bm!48720) (not b!1131716) (not b!1131693) (not b!1131701) (not bm!48719) (not b!1131704) (not bm!48716) (not b!1131692) (not start!98236) (not b!1131703) (not bm!48717) (not b!1131710) (not b!1131714) tp_is_empty!28467 b_and!38659 (not b!1131705) (not b!1131690) (not b_next!23937) (not b!1131702) (not b_lambda!18911) (not b!1131694))
(check-sat b_and!38659 (not b_next!23937))
(get-model)

(declare-fun d!131297 () Bool)

(declare-fun e!644100 () Bool)

(assert (=> d!131297 e!644100))

(declare-fun res!756046 () Bool)

(assert (=> d!131297 (=> (not res!756046) (not e!644100))))

(declare-fun lt!502751 () ListLongMap!15983)

(assert (=> d!131297 (= res!756046 (contains!6529 lt!502751 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!502752 () List!24778)

(assert (=> d!131297 (= lt!502751 (ListLongMap!15984 lt!502752))))

(declare-fun lt!502753 () Unit!37073)

(declare-fun lt!502754 () Unit!37073)

(assert (=> d!131297 (= lt!502753 lt!502754)))

(declare-datatypes ((Option!679 0))(
  ( (Some!678 (v!16925 V!43083)) (None!677) )
))
(declare-fun getValueByKey!628 (List!24778 (_ BitVec 64)) Option!679)

(assert (=> d!131297 (= (getValueByKey!628 lt!502752 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!678 (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!305 (List!24778 (_ BitVec 64) V!43083) Unit!37073)

(assert (=> d!131297 (= lt!502754 (lemmaContainsTupThenGetReturnValue!305 lt!502752 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!398 (List!24778 (_ BitVec 64) V!43083) List!24778)

(assert (=> d!131297 (= lt!502752 (insertStrictlySorted!398 (toList!8007 lt!502693) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131297 (= (+!3451 lt!502693 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!502751)))

(declare-fun b!1131806 () Bool)

(declare-fun res!756045 () Bool)

(assert (=> b!1131806 (=> (not res!756045) (not e!644100))))

(assert (=> b!1131806 (= res!756045 (= (getValueByKey!628 (toList!8007 lt!502751) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!678 (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1131807 () Bool)

(declare-fun contains!6531 (List!24778 tuple2!18014) Bool)

(assert (=> b!1131807 (= e!644100 (contains!6531 (toList!8007 lt!502751) (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131297 res!756046) b!1131806))

(assert (= (and b!1131806 res!756045) b!1131807))

(declare-fun m!1044681 () Bool)

(assert (=> d!131297 m!1044681))

(declare-fun m!1044683 () Bool)

(assert (=> d!131297 m!1044683))

(declare-fun m!1044685 () Bool)

(assert (=> d!131297 m!1044685))

(declare-fun m!1044687 () Bool)

(assert (=> d!131297 m!1044687))

(declare-fun m!1044689 () Bool)

(assert (=> b!1131806 m!1044689))

(declare-fun m!1044691 () Bool)

(assert (=> b!1131807 m!1044691))

(assert (=> bm!48716 d!131297))

(declare-fun d!131299 () Bool)

(declare-fun res!756051 () Bool)

(declare-fun e!644105 () Bool)

(assert (=> d!131299 (=> res!756051 e!644105)))

(assert (=> d!131299 (= res!756051 (= (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131299 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!644105)))

(declare-fun b!1131812 () Bool)

(declare-fun e!644106 () Bool)

(assert (=> b!1131812 (= e!644105 e!644106)))

(declare-fun res!756052 () Bool)

(assert (=> b!1131812 (=> (not res!756052) (not e!644106))))

(assert (=> b!1131812 (= res!756052 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun b!1131813 () Bool)

(assert (=> b!1131813 (= e!644106 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131299 (not res!756051)) b!1131812))

(assert (= (and b!1131812 res!756052) b!1131813))

(declare-fun m!1044693 () Bool)

(assert (=> d!131299 m!1044693))

(declare-fun m!1044695 () Bool)

(assert (=> b!1131813 m!1044695))

(assert (=> b!1131711 d!131299))

(declare-fun d!131301 () Bool)

(assert (=> d!131301 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502757 () Unit!37073)

(declare-fun choose!13 (array!73793 (_ BitVec 64) (_ BitVec 32)) Unit!37073)

(assert (=> d!131301 (= lt!502757 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131301 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131301 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!502757)))

(declare-fun bs!32957 () Bool)

(assert (= bs!32957 d!131301))

(assert (=> bs!32957 m!1044607))

(declare-fun m!1044697 () Bool)

(assert (=> bs!32957 m!1044697))

(assert (=> b!1131711 d!131301))

(declare-fun d!131303 () Bool)

(assert (=> d!131303 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1131702 d!131303))

(declare-fun d!131305 () Bool)

(assert (=> d!131305 (contains!6529 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!502760 () Unit!37073)

(declare-fun choose!1774 (ListLongMap!15983 (_ BitVec 64) V!43083 (_ BitVec 64)) Unit!37073)

(assert (=> d!131305 (= lt!502760 (choose!1774 lt!502694 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!131305 (contains!6529 lt!502694 k0!934)))

(assert (=> d!131305 (= (addStillContains!714 lt!502694 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!502760)))

(declare-fun bs!32958 () Bool)

(assert (= bs!32958 d!131305))

(assert (=> bs!32958 m!1044597))

(assert (=> bs!32958 m!1044597))

(assert (=> bs!32958 m!1044599))

(declare-fun m!1044699 () Bool)

(assert (=> bs!32958 m!1044699))

(declare-fun m!1044701 () Bool)

(assert (=> bs!32958 m!1044701))

(assert (=> b!1131710 d!131305))

(declare-fun d!131307 () Bool)

(declare-fun e!644112 () Bool)

(assert (=> d!131307 e!644112))

(declare-fun res!756055 () Bool)

(assert (=> d!131307 (=> res!756055 e!644112)))

(declare-fun lt!502770 () Bool)

(assert (=> d!131307 (= res!756055 (not lt!502770))))

(declare-fun lt!502772 () Bool)

(assert (=> d!131307 (= lt!502770 lt!502772)))

(declare-fun lt!502771 () Unit!37073)

(declare-fun e!644111 () Unit!37073)

(assert (=> d!131307 (= lt!502771 e!644111)))

(declare-fun c!110244 () Bool)

(assert (=> d!131307 (= c!110244 lt!502772)))

(declare-fun containsKey!585 (List!24778 (_ BitVec 64)) Bool)

(assert (=> d!131307 (= lt!502772 (containsKey!585 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!131307 (= (contains!6529 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!502770)))

(declare-fun b!1131821 () Bool)

(declare-fun lt!502769 () Unit!37073)

(assert (=> b!1131821 (= e!644111 lt!502769)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!415 (List!24778 (_ BitVec 64)) Unit!37073)

(assert (=> b!1131821 (= lt!502769 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun isDefined!454 (Option!679) Bool)

(assert (=> b!1131821 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1131822 () Bool)

(declare-fun Unit!37079 () Unit!37073)

(assert (=> b!1131822 (= e!644111 Unit!37079)))

(declare-fun b!1131823 () Bool)

(assert (=> b!1131823 (= e!644112 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!131307 c!110244) b!1131821))

(assert (= (and d!131307 (not c!110244)) b!1131822))

(assert (= (and d!131307 (not res!756055)) b!1131823))

(declare-fun m!1044703 () Bool)

(assert (=> d!131307 m!1044703))

(declare-fun m!1044705 () Bool)

(assert (=> b!1131821 m!1044705))

(declare-fun m!1044707 () Bool)

(assert (=> b!1131821 m!1044707))

(assert (=> b!1131821 m!1044707))

(declare-fun m!1044709 () Bool)

(assert (=> b!1131821 m!1044709))

(assert (=> b!1131823 m!1044707))

(assert (=> b!1131823 m!1044707))

(assert (=> b!1131823 m!1044709))

(assert (=> b!1131710 d!131307))

(declare-fun d!131309 () Bool)

(declare-fun e!644113 () Bool)

(assert (=> d!131309 e!644113))

(declare-fun res!756057 () Bool)

(assert (=> d!131309 (=> (not res!756057) (not e!644113))))

(declare-fun lt!502773 () ListLongMap!15983)

(assert (=> d!131309 (= res!756057 (contains!6529 lt!502773 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!502774 () List!24778)

(assert (=> d!131309 (= lt!502773 (ListLongMap!15984 lt!502774))))

(declare-fun lt!502775 () Unit!37073)

(declare-fun lt!502776 () Unit!37073)

(assert (=> d!131309 (= lt!502775 lt!502776)))

(assert (=> d!131309 (= (getValueByKey!628 lt!502774 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!678 (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131309 (= lt!502776 (lemmaContainsTupThenGetReturnValue!305 lt!502774 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131309 (= lt!502774 (insertStrictlySorted!398 (toList!8007 lt!502694) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131309 (= (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!502773)))

(declare-fun b!1131824 () Bool)

(declare-fun res!756056 () Bool)

(assert (=> b!1131824 (=> (not res!756056) (not e!644113))))

(assert (=> b!1131824 (= res!756056 (= (getValueByKey!628 (toList!8007 lt!502773) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!678 (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1131825 () Bool)

(assert (=> b!1131825 (= e!644113 (contains!6531 (toList!8007 lt!502773) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131309 res!756057) b!1131824))

(assert (= (and b!1131824 res!756056) b!1131825))

(declare-fun m!1044711 () Bool)

(assert (=> d!131309 m!1044711))

(declare-fun m!1044713 () Bool)

(assert (=> d!131309 m!1044713))

(declare-fun m!1044715 () Bool)

(assert (=> d!131309 m!1044715))

(declare-fun m!1044717 () Bool)

(assert (=> d!131309 m!1044717))

(declare-fun m!1044719 () Bool)

(assert (=> b!1131824 m!1044719))

(declare-fun m!1044721 () Bool)

(assert (=> b!1131825 m!1044721))

(assert (=> b!1131710 d!131309))

(declare-fun d!131311 () Bool)

(declare-fun e!644115 () Bool)

(assert (=> d!131311 e!644115))

(declare-fun res!756058 () Bool)

(assert (=> d!131311 (=> res!756058 e!644115)))

(declare-fun lt!502778 () Bool)

(assert (=> d!131311 (= res!756058 (not lt!502778))))

(declare-fun lt!502780 () Bool)

(assert (=> d!131311 (= lt!502778 lt!502780)))

(declare-fun lt!502779 () Unit!37073)

(declare-fun e!644114 () Unit!37073)

(assert (=> d!131311 (= lt!502779 e!644114)))

(declare-fun c!110245 () Bool)

(assert (=> d!131311 (= c!110245 lt!502780)))

(assert (=> d!131311 (= lt!502780 (containsKey!585 (toList!8007 lt!502693) k0!934))))

(assert (=> d!131311 (= (contains!6529 lt!502693 k0!934) lt!502778)))

(declare-fun b!1131826 () Bool)

(declare-fun lt!502777 () Unit!37073)

(assert (=> b!1131826 (= e!644114 lt!502777)))

(assert (=> b!1131826 (= lt!502777 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502693) k0!934))))

(assert (=> b!1131826 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502693) k0!934))))

(declare-fun b!1131827 () Bool)

(declare-fun Unit!37080 () Unit!37073)

(assert (=> b!1131827 (= e!644114 Unit!37080)))

(declare-fun b!1131828 () Bool)

(assert (=> b!1131828 (= e!644115 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502693) k0!934)))))

(assert (= (and d!131311 c!110245) b!1131826))

(assert (= (and d!131311 (not c!110245)) b!1131827))

(assert (= (and d!131311 (not res!756058)) b!1131828))

(declare-fun m!1044723 () Bool)

(assert (=> d!131311 m!1044723))

(declare-fun m!1044725 () Bool)

(assert (=> b!1131826 m!1044725))

(declare-fun m!1044727 () Bool)

(assert (=> b!1131826 m!1044727))

(assert (=> b!1131826 m!1044727))

(declare-fun m!1044729 () Bool)

(assert (=> b!1131826 m!1044729))

(assert (=> b!1131828 m!1044727))

(assert (=> b!1131828 m!1044727))

(assert (=> b!1131828 m!1044729))

(assert (=> b!1131701 d!131311))

(declare-fun b!1131853 () Bool)

(assert (=> b!1131853 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 _keys!1208)))))

(assert (=> b!1131853 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36084 _values!996)))))

(declare-fun e!644132 () Bool)

(declare-fun lt!502799 () ListLongMap!15983)

(declare-fun apply!955 (ListLongMap!15983 (_ BitVec 64)) V!43083)

(declare-fun get!18073 (ValueCell!13524 V!43083) V!43083)

(assert (=> b!1131853 (= e!644132 (= (apply!955 lt!502799 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1131854 () Bool)

(declare-fun e!644136 () Bool)

(declare-fun e!644134 () Bool)

(assert (=> b!1131854 (= e!644136 e!644134)))

(declare-fun c!110255 () Bool)

(assert (=> b!1131854 (= c!110255 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 _keys!1208)))))

(declare-fun call!48751 () ListLongMap!15983)

(declare-fun bm!48748 () Bool)

(assert (=> bm!48748 (= call!48751 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131313 () Bool)

(declare-fun e!644130 () Bool)

(assert (=> d!131313 e!644130))

(declare-fun res!756069 () Bool)

(assert (=> d!131313 (=> (not res!756069) (not e!644130))))

(assert (=> d!131313 (= res!756069 (not (contains!6529 lt!502799 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644135 () ListLongMap!15983)

(assert (=> d!131313 (= lt!502799 e!644135)))

(declare-fun c!110257 () Bool)

(assert (=> d!131313 (= c!110257 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 _keys!1208)))))

(assert (=> d!131313 (validMask!0 mask!1564)))

(assert (=> d!131313 (= (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502799)))

(declare-fun b!1131855 () Bool)

(assert (=> b!1131855 (= e!644134 (= lt!502799 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131856 () Bool)

(declare-fun e!644131 () ListLongMap!15983)

(assert (=> b!1131856 (= e!644131 call!48751)))

(declare-fun b!1131857 () Bool)

(declare-fun e!644133 () Bool)

(assert (=> b!1131857 (= e!644133 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131857 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1131858 () Bool)

(assert (=> b!1131858 (= e!644135 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1131859 () Bool)

(assert (=> b!1131859 (= e!644130 e!644136)))

(declare-fun c!110256 () Bool)

(assert (=> b!1131859 (= c!110256 e!644133)))

(declare-fun res!756070 () Bool)

(assert (=> b!1131859 (=> (not res!756070) (not e!644133))))

(assert (=> b!1131859 (= res!756070 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 _keys!1208)))))

(declare-fun b!1131860 () Bool)

(declare-fun isEmpty!973 (ListLongMap!15983) Bool)

(assert (=> b!1131860 (= e!644134 (isEmpty!973 lt!502799))))

(declare-fun b!1131861 () Bool)

(assert (=> b!1131861 (= e!644135 e!644131)))

(declare-fun c!110254 () Bool)

(assert (=> b!1131861 (= c!110254 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1131862 () Bool)

(declare-fun res!756067 () Bool)

(assert (=> b!1131862 (=> (not res!756067) (not e!644130))))

(assert (=> b!1131862 (= res!756067 (not (contains!6529 lt!502799 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131863 () Bool)

(declare-fun lt!502795 () Unit!37073)

(declare-fun lt!502801 () Unit!37073)

(assert (=> b!1131863 (= lt!502795 lt!502801)))

(declare-fun lt!502798 () ListLongMap!15983)

(declare-fun lt!502796 () (_ BitVec 64))

(declare-fun lt!502797 () (_ BitVec 64))

(declare-fun lt!502800 () V!43083)

(assert (=> b!1131863 (not (contains!6529 (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800)) lt!502796))))

(declare-fun addStillNotContains!283 (ListLongMap!15983 (_ BitVec 64) V!43083 (_ BitVec 64)) Unit!37073)

(assert (=> b!1131863 (= lt!502801 (addStillNotContains!283 lt!502798 lt!502797 lt!502800 lt!502796))))

(assert (=> b!1131863 (= lt!502796 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131863 (= lt!502800 (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131863 (= lt!502797 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1131863 (= lt!502798 call!48751)))

(assert (=> b!1131863 (= e!644131 (+!3451 call!48751 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1131864 () Bool)

(assert (=> b!1131864 (= e!644136 e!644132)))

(assert (=> b!1131864 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 _keys!1208)))))

(declare-fun res!756068 () Bool)

(assert (=> b!1131864 (= res!756068 (contains!6529 lt!502799 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131864 (=> (not res!756068) (not e!644132))))

(assert (= (and d!131313 c!110257) b!1131858))

(assert (= (and d!131313 (not c!110257)) b!1131861))

(assert (= (and b!1131861 c!110254) b!1131863))

(assert (= (and b!1131861 (not c!110254)) b!1131856))

(assert (= (or b!1131863 b!1131856) bm!48748))

(assert (= (and d!131313 res!756069) b!1131862))

(assert (= (and b!1131862 res!756067) b!1131859))

(assert (= (and b!1131859 res!756070) b!1131857))

(assert (= (and b!1131859 c!110256) b!1131864))

(assert (= (and b!1131859 (not c!110256)) b!1131854))

(assert (= (and b!1131864 res!756068) b!1131853))

(assert (= (and b!1131854 c!110255) b!1131855))

(assert (= (and b!1131854 (not c!110255)) b!1131860))

(declare-fun b_lambda!18913 () Bool)

(assert (=> (not b_lambda!18913) (not b!1131853)))

(assert (=> b!1131853 t!35705))

(declare-fun b_and!38665 () Bool)

(assert (= b_and!38659 (and (=> t!35705 result!18059) b_and!38665)))

(declare-fun b_lambda!18915 () Bool)

(assert (=> (not b_lambda!18915) (not b!1131863)))

(assert (=> b!1131863 t!35705))

(declare-fun b_and!38667 () Bool)

(assert (= b_and!38665 (and (=> t!35705 result!18059) b_and!38667)))

(declare-fun m!1044731 () Bool)

(assert (=> b!1131855 m!1044731))

(declare-fun m!1044733 () Bool)

(assert (=> b!1131862 m!1044733))

(assert (=> bm!48748 m!1044731))

(declare-fun m!1044735 () Bool)

(assert (=> b!1131853 m!1044735))

(assert (=> b!1131853 m!1044735))

(assert (=> b!1131853 m!1044589))

(declare-fun m!1044737 () Bool)

(assert (=> b!1131853 m!1044737))

(assert (=> b!1131853 m!1044589))

(declare-fun m!1044739 () Bool)

(assert (=> b!1131853 m!1044739))

(assert (=> b!1131853 m!1044739))

(declare-fun m!1044741 () Bool)

(assert (=> b!1131853 m!1044741))

(declare-fun m!1044743 () Bool)

(assert (=> d!131313 m!1044743))

(assert (=> d!131313 m!1044583))

(assert (=> b!1131857 m!1044739))

(assert (=> b!1131857 m!1044739))

(declare-fun m!1044745 () Bool)

(assert (=> b!1131857 m!1044745))

(declare-fun m!1044747 () Bool)

(assert (=> b!1131860 m!1044747))

(assert (=> b!1131861 m!1044739))

(assert (=> b!1131861 m!1044739))

(assert (=> b!1131861 m!1044745))

(assert (=> b!1131864 m!1044739))

(assert (=> b!1131864 m!1044739))

(declare-fun m!1044749 () Bool)

(assert (=> b!1131864 m!1044749))

(assert (=> b!1131863 m!1044735))

(assert (=> b!1131863 m!1044735))

(assert (=> b!1131863 m!1044589))

(assert (=> b!1131863 m!1044737))

(declare-fun m!1044751 () Bool)

(assert (=> b!1131863 m!1044751))

(declare-fun m!1044753 () Bool)

(assert (=> b!1131863 m!1044753))

(assert (=> b!1131863 m!1044589))

(declare-fun m!1044755 () Bool)

(assert (=> b!1131863 m!1044755))

(assert (=> b!1131863 m!1044739))

(assert (=> b!1131863 m!1044751))

(declare-fun m!1044757 () Bool)

(assert (=> b!1131863 m!1044757))

(assert (=> b!1131701 d!131313))

(declare-fun d!131315 () Bool)

(declare-fun res!756076 () Bool)

(declare-fun e!644145 () Bool)

(assert (=> d!131315 (=> res!756076 e!644145)))

(assert (=> d!131315 (= res!756076 (bvsge #b00000000000000000000000000000000 (size!36085 _keys!1208)))))

(assert (=> d!131315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!644145)))

(declare-fun bm!48751 () Bool)

(declare-fun call!48754 () Bool)

(assert (=> bm!48751 (= call!48754 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1131873 () Bool)

(declare-fun e!644143 () Bool)

(declare-fun e!644144 () Bool)

(assert (=> b!1131873 (= e!644143 e!644144)))

(declare-fun lt!502808 () (_ BitVec 64))

(assert (=> b!1131873 (= lt!502808 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!502809 () Unit!37073)

(assert (=> b!1131873 (= lt!502809 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!502808 #b00000000000000000000000000000000))))

(assert (=> b!1131873 (arrayContainsKey!0 _keys!1208 lt!502808 #b00000000000000000000000000000000)))

(declare-fun lt!502810 () Unit!37073)

(assert (=> b!1131873 (= lt!502810 lt!502809)))

(declare-fun res!756075 () Bool)

(declare-datatypes ((SeekEntryResult!9925 0))(
  ( (MissingZero!9925 (index!42071 (_ BitVec 32))) (Found!9925 (index!42072 (_ BitVec 32))) (Intermediate!9925 (undefined!10737 Bool) (index!42073 (_ BitVec 32)) (x!101491 (_ BitVec 32))) (Undefined!9925) (MissingVacant!9925 (index!42074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!73793 (_ BitVec 32)) SeekEntryResult!9925)

(assert (=> b!1131873 (= res!756075 (= (seekEntryOrOpen!0 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9925 #b00000000000000000000000000000000)))))

(assert (=> b!1131873 (=> (not res!756075) (not e!644144))))

(declare-fun b!1131874 () Bool)

(assert (=> b!1131874 (= e!644144 call!48754)))

(declare-fun b!1131875 () Bool)

(assert (=> b!1131875 (= e!644143 call!48754)))

(declare-fun b!1131876 () Bool)

(assert (=> b!1131876 (= e!644145 e!644143)))

(declare-fun c!110260 () Bool)

(assert (=> b!1131876 (= c!110260 (validKeyInArray!0 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131315 (not res!756076)) b!1131876))

(assert (= (and b!1131876 c!110260) b!1131873))

(assert (= (and b!1131876 (not c!110260)) b!1131875))

(assert (= (and b!1131873 res!756075) b!1131874))

(assert (= (or b!1131874 b!1131875) bm!48751))

(declare-fun m!1044759 () Bool)

(assert (=> bm!48751 m!1044759))

(assert (=> b!1131873 m!1044693))

(declare-fun m!1044761 () Bool)

(assert (=> b!1131873 m!1044761))

(declare-fun m!1044763 () Bool)

(assert (=> b!1131873 m!1044763))

(assert (=> b!1131873 m!1044693))

(declare-fun m!1044765 () Bool)

(assert (=> b!1131873 m!1044765))

(assert (=> b!1131876 m!1044693))

(assert (=> b!1131876 m!1044693))

(declare-fun m!1044767 () Bool)

(assert (=> b!1131876 m!1044767))

(assert (=> b!1131694 d!131315))

(declare-fun d!131317 () Bool)

(declare-fun e!644147 () Bool)

(assert (=> d!131317 e!644147))

(declare-fun res!756077 () Bool)

(assert (=> d!131317 (=> res!756077 e!644147)))

(declare-fun lt!502812 () Bool)

(assert (=> d!131317 (= res!756077 (not lt!502812))))

(declare-fun lt!502814 () Bool)

(assert (=> d!131317 (= lt!502812 lt!502814)))

(declare-fun lt!502813 () Unit!37073)

(declare-fun e!644146 () Unit!37073)

(assert (=> d!131317 (= lt!502813 e!644146)))

(declare-fun c!110261 () Bool)

(assert (=> d!131317 (= c!110261 lt!502814)))

(assert (=> d!131317 (= lt!502814 (containsKey!585 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934))))

(assert (=> d!131317 (= (contains!6529 (ite c!110224 lt!502694 call!48720) k0!934) lt!502812)))

(declare-fun b!1131877 () Bool)

(declare-fun lt!502811 () Unit!37073)

(assert (=> b!1131877 (= e!644146 lt!502811)))

(assert (=> b!1131877 (= lt!502811 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934))))

(assert (=> b!1131877 (isDefined!454 (getValueByKey!628 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934))))

(declare-fun b!1131878 () Bool)

(declare-fun Unit!37081 () Unit!37073)

(assert (=> b!1131878 (= e!644146 Unit!37081)))

(declare-fun b!1131879 () Bool)

(assert (=> b!1131879 (= e!644147 (isDefined!454 (getValueByKey!628 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934)))))

(assert (= (and d!131317 c!110261) b!1131877))

(assert (= (and d!131317 (not c!110261)) b!1131878))

(assert (= (and d!131317 (not res!756077)) b!1131879))

(declare-fun m!1044769 () Bool)

(assert (=> d!131317 m!1044769))

(declare-fun m!1044771 () Bool)

(assert (=> b!1131877 m!1044771))

(declare-fun m!1044773 () Bool)

(assert (=> b!1131877 m!1044773))

(assert (=> b!1131877 m!1044773))

(declare-fun m!1044775 () Bool)

(assert (=> b!1131877 m!1044775))

(assert (=> b!1131879 m!1044773))

(assert (=> b!1131879 m!1044773))

(assert (=> b!1131879 m!1044775))

(assert (=> bm!48720 d!131317))

(declare-fun b!1131890 () Bool)

(declare-fun e!644159 () Bool)

(declare-fun e!644156 () Bool)

(assert (=> b!1131890 (= e!644159 e!644156)))

(declare-fun res!756086 () Bool)

(assert (=> b!1131890 (=> (not res!756086) (not e!644156))))

(declare-fun e!644158 () Bool)

(assert (=> b!1131890 (= res!756086 (not e!644158))))

(declare-fun res!756084 () Bool)

(assert (=> b!1131890 (=> (not res!756084) (not e!644158))))

(assert (=> b!1131890 (= res!756084 (validKeyInArray!0 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!48754 () Bool)

(declare-fun call!48757 () Bool)

(declare-fun c!110264 () Bool)

(assert (=> bm!48754 (= call!48757 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110264 (Cons!24773 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) Nil!24774) Nil!24774)))))

(declare-fun b!1131891 () Bool)

(declare-fun e!644157 () Bool)

(assert (=> b!1131891 (= e!644157 call!48757)))

(declare-fun b!1131892 () Bool)

(assert (=> b!1131892 (= e!644157 call!48757)))

(declare-fun d!131319 () Bool)

(declare-fun res!756085 () Bool)

(assert (=> d!131319 (=> res!756085 e!644159)))

(assert (=> d!131319 (= res!756085 (bvsge #b00000000000000000000000000000000 (size!36085 _keys!1208)))))

(assert (=> d!131319 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24774) e!644159)))

(declare-fun b!1131893 () Bool)

(declare-fun contains!6532 (List!24777 (_ BitVec 64)) Bool)

(assert (=> b!1131893 (= e!644158 (contains!6532 Nil!24774 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1131894 () Bool)

(assert (=> b!1131894 (= e!644156 e!644157)))

(assert (=> b!1131894 (= c!110264 (validKeyInArray!0 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131319 (not res!756085)) b!1131890))

(assert (= (and b!1131890 res!756084) b!1131893))

(assert (= (and b!1131890 res!756086) b!1131894))

(assert (= (and b!1131894 c!110264) b!1131891))

(assert (= (and b!1131894 (not c!110264)) b!1131892))

(assert (= (or b!1131891 b!1131892) bm!48754))

(assert (=> b!1131890 m!1044693))

(assert (=> b!1131890 m!1044693))

(assert (=> b!1131890 m!1044767))

(assert (=> bm!48754 m!1044693))

(declare-fun m!1044777 () Bool)

(assert (=> bm!48754 m!1044777))

(assert (=> b!1131893 m!1044693))

(assert (=> b!1131893 m!1044693))

(declare-fun m!1044779 () Bool)

(assert (=> b!1131893 m!1044779))

(assert (=> b!1131894 m!1044693))

(assert (=> b!1131894 m!1044693))

(assert (=> b!1131894 m!1044767))

(assert (=> b!1131693 d!131319))

(declare-fun d!131321 () Bool)

(assert (=> d!131321 (= (array_inv!27268 _keys!1208) (bvsge (size!36085 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!98236 d!131321))

(declare-fun d!131323 () Bool)

(assert (=> d!131323 (= (array_inv!27269 _values!996) (bvsge (size!36084 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!98236 d!131323))

(declare-fun d!131325 () Bool)

(declare-fun res!756087 () Bool)

(declare-fun e!644160 () Bool)

(assert (=> d!131325 (=> res!756087 e!644160)))

(assert (=> d!131325 (= res!756087 (= (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!131325 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!644160)))

(declare-fun b!1131895 () Bool)

(declare-fun e!644161 () Bool)

(assert (=> b!1131895 (= e!644160 e!644161)))

(declare-fun res!756088 () Bool)

(assert (=> b!1131895 (=> (not res!756088) (not e!644161))))

(assert (=> b!1131895 (= res!756088 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun b!1131896 () Bool)

(assert (=> b!1131896 (= e!644161 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!131325 (not res!756087)) b!1131895))

(assert (= (and b!1131895 res!756088) b!1131896))

(assert (=> d!131325 m!1044739))

(declare-fun m!1044781 () Bool)

(assert (=> b!1131896 m!1044781))

(assert (=> b!1131692 d!131325))

(declare-fun d!131327 () Bool)

(assert (=> d!131327 (contains!6529 (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!502815 () Unit!37073)

(assert (=> d!131327 (= lt!502815 (choose!1774 lt!502693 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!131327 (contains!6529 lt!502693 k0!934)))

(assert (=> d!131327 (= (addStillContains!714 lt!502693 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944) k0!934) lt!502815)))

(declare-fun bs!32959 () Bool)

(assert (= bs!32959 d!131327))

(declare-fun m!1044783 () Bool)

(assert (=> bs!32959 m!1044783))

(assert (=> bs!32959 m!1044783))

(declare-fun m!1044785 () Bool)

(assert (=> bs!32959 m!1044785))

(declare-fun m!1044787 () Bool)

(assert (=> bs!32959 m!1044787))

(assert (=> bs!32959 m!1044557))

(assert (=> bm!48718 d!131327))

(declare-fun d!131329 () Bool)

(declare-fun res!756090 () Bool)

(declare-fun e!644164 () Bool)

(assert (=> d!131329 (=> res!756090 e!644164)))

(assert (=> d!131329 (= res!756090 (bvsge #b00000000000000000000000000000000 (size!36085 lt!502695)))))

(assert (=> d!131329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502695 mask!1564) e!644164)))

(declare-fun bm!48755 () Bool)

(declare-fun call!48758 () Bool)

(assert (=> bm!48755 (= call!48758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!502695 mask!1564))))

(declare-fun b!1131897 () Bool)

(declare-fun e!644162 () Bool)

(declare-fun e!644163 () Bool)

(assert (=> b!1131897 (= e!644162 e!644163)))

(declare-fun lt!502816 () (_ BitVec 64))

(assert (=> b!1131897 (= lt!502816 (select (arr!35549 lt!502695) #b00000000000000000000000000000000))))

(declare-fun lt!502817 () Unit!37073)

(assert (=> b!1131897 (= lt!502817 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!502695 lt!502816 #b00000000000000000000000000000000))))

(assert (=> b!1131897 (arrayContainsKey!0 lt!502695 lt!502816 #b00000000000000000000000000000000)))

(declare-fun lt!502818 () Unit!37073)

(assert (=> b!1131897 (= lt!502818 lt!502817)))

(declare-fun res!756089 () Bool)

(assert (=> b!1131897 (= res!756089 (= (seekEntryOrOpen!0 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) lt!502695 mask!1564) (Found!9925 #b00000000000000000000000000000000)))))

(assert (=> b!1131897 (=> (not res!756089) (not e!644163))))

(declare-fun b!1131898 () Bool)

(assert (=> b!1131898 (= e!644163 call!48758)))

(declare-fun b!1131899 () Bool)

(assert (=> b!1131899 (= e!644162 call!48758)))

(declare-fun b!1131900 () Bool)

(assert (=> b!1131900 (= e!644164 e!644162)))

(declare-fun c!110265 () Bool)

(assert (=> b!1131900 (= c!110265 (validKeyInArray!0 (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(assert (= (and d!131329 (not res!756090)) b!1131900))

(assert (= (and b!1131900 c!110265) b!1131897))

(assert (= (and b!1131900 (not c!110265)) b!1131899))

(assert (= (and b!1131897 res!756089) b!1131898))

(assert (= (or b!1131898 b!1131899) bm!48755))

(declare-fun m!1044789 () Bool)

(assert (=> bm!48755 m!1044789))

(declare-fun m!1044791 () Bool)

(assert (=> b!1131897 m!1044791))

(declare-fun m!1044793 () Bool)

(assert (=> b!1131897 m!1044793))

(declare-fun m!1044795 () Bool)

(assert (=> b!1131897 m!1044795))

(assert (=> b!1131897 m!1044791))

(declare-fun m!1044797 () Bool)

(assert (=> b!1131897 m!1044797))

(assert (=> b!1131900 m!1044791))

(assert (=> b!1131900 m!1044791))

(declare-fun m!1044799 () Bool)

(assert (=> b!1131900 m!1044799))

(assert (=> b!1131716 d!131329))

(declare-fun d!131331 () Bool)

(declare-fun lt!502821 () ListLongMap!15983)

(assert (=> d!131331 (not (contains!6529 lt!502821 k0!934))))

(declare-fun removeStrictlySorted!89 (List!24778 (_ BitVec 64)) List!24778)

(assert (=> d!131331 (= lt!502821 (ListLongMap!15984 (removeStrictlySorted!89 (toList!8007 call!48717) k0!934)))))

(assert (=> d!131331 (= (-!1179 call!48717 k0!934) lt!502821)))

(declare-fun bs!32960 () Bool)

(assert (= bs!32960 d!131331))

(declare-fun m!1044801 () Bool)

(assert (=> bs!32960 m!1044801))

(declare-fun m!1044803 () Bool)

(assert (=> bs!32960 m!1044803))

(assert (=> b!1131707 d!131331))

(declare-fun b!1131901 () Bool)

(assert (=> b!1131901 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(assert (=> b!1131901 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36084 (ite c!110222 lt!502685 _values!996))))))

(declare-fun e!644167 () Bool)

(declare-fun lt!502826 () ListLongMap!15983)

(assert (=> b!1131901 (= e!644167 (= (apply!955 lt!502826 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1131902 () Bool)

(declare-fun e!644171 () Bool)

(declare-fun e!644169 () Bool)

(assert (=> b!1131902 (= e!644171 e!644169)))

(declare-fun c!110267 () Bool)

(assert (=> b!1131902 (= c!110267 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(declare-fun bm!48756 () Bool)

(declare-fun call!48759 () ListLongMap!15983)

(assert (=> bm!48756 (= call!48759 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 lt!502695 _keys!1208) (ite c!110222 lt!502685 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131333 () Bool)

(declare-fun e!644165 () Bool)

(assert (=> d!131333 e!644165))

(declare-fun res!756093 () Bool)

(assert (=> d!131333 (=> (not res!756093) (not e!644165))))

(assert (=> d!131333 (= res!756093 (not (contains!6529 lt!502826 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644170 () ListLongMap!15983)

(assert (=> d!131333 (= lt!502826 e!644170)))

(declare-fun c!110269 () Bool)

(assert (=> d!131333 (= c!110269 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(assert (=> d!131333 (validMask!0 mask!1564)))

(assert (=> d!131333 (= (getCurrentListMapNoExtraKeys!4494 (ite c!110222 lt!502695 _keys!1208) (ite c!110222 lt!502685 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502826)))

(declare-fun b!1131903 () Bool)

(assert (=> b!1131903 (= e!644169 (= lt!502826 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 lt!502695 _keys!1208) (ite c!110222 lt!502685 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131904 () Bool)

(declare-fun e!644166 () ListLongMap!15983)

(assert (=> b!1131904 (= e!644166 call!48759)))

(declare-fun e!644168 () Bool)

(declare-fun b!1131905 () Bool)

(assert (=> b!1131905 (= e!644168 (validKeyInArray!0 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131905 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1131906 () Bool)

(assert (=> b!1131906 (= e!644170 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1131907 () Bool)

(assert (=> b!1131907 (= e!644165 e!644171)))

(declare-fun c!110268 () Bool)

(assert (=> b!1131907 (= c!110268 e!644168)))

(declare-fun res!756094 () Bool)

(assert (=> b!1131907 (=> (not res!756094) (not e!644168))))

(assert (=> b!1131907 (= res!756094 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(declare-fun b!1131908 () Bool)

(assert (=> b!1131908 (= e!644169 (isEmpty!973 lt!502826))))

(declare-fun b!1131909 () Bool)

(assert (=> b!1131909 (= e!644170 e!644166)))

(declare-fun c!110266 () Bool)

(assert (=> b!1131909 (= c!110266 (validKeyInArray!0 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1131910 () Bool)

(declare-fun res!756091 () Bool)

(assert (=> b!1131910 (=> (not res!756091) (not e!644165))))

(assert (=> b!1131910 (= res!756091 (not (contains!6529 lt!502826 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131911 () Bool)

(declare-fun lt!502822 () Unit!37073)

(declare-fun lt!502828 () Unit!37073)

(assert (=> b!1131911 (= lt!502822 lt!502828)))

(declare-fun lt!502824 () (_ BitVec 64))

(declare-fun lt!502827 () V!43083)

(declare-fun lt!502825 () ListLongMap!15983)

(declare-fun lt!502823 () (_ BitVec 64))

(assert (=> b!1131911 (not (contains!6529 (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827)) lt!502823))))

(assert (=> b!1131911 (= lt!502828 (addStillNotContains!283 lt!502825 lt!502824 lt!502827 lt!502823))))

(assert (=> b!1131911 (= lt!502823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131911 (= lt!502827 (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131911 (= lt!502824 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1131911 (= lt!502825 call!48759)))

(assert (=> b!1131911 (= e!644166 (+!3451 call!48759 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1131912 () Bool)

(assert (=> b!1131912 (= e!644171 e!644167)))

(assert (=> b!1131912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(declare-fun res!756092 () Bool)

(assert (=> b!1131912 (= res!756092 (contains!6529 lt!502826 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131912 (=> (not res!756092) (not e!644167))))

(assert (= (and d!131333 c!110269) b!1131906))

(assert (= (and d!131333 (not c!110269)) b!1131909))

(assert (= (and b!1131909 c!110266) b!1131911))

(assert (= (and b!1131909 (not c!110266)) b!1131904))

(assert (= (or b!1131911 b!1131904) bm!48756))

(assert (= (and d!131333 res!756093) b!1131910))

(assert (= (and b!1131910 res!756091) b!1131907))

(assert (= (and b!1131907 res!756094) b!1131905))

(assert (= (and b!1131907 c!110268) b!1131912))

(assert (= (and b!1131907 (not c!110268)) b!1131902))

(assert (= (and b!1131912 res!756092) b!1131901))

(assert (= (and b!1131902 c!110267) b!1131903))

(assert (= (and b!1131902 (not c!110267)) b!1131908))

(declare-fun b_lambda!18917 () Bool)

(assert (=> (not b_lambda!18917) (not b!1131901)))

(assert (=> b!1131901 t!35705))

(declare-fun b_and!38669 () Bool)

(assert (= b_and!38667 (and (=> t!35705 result!18059) b_and!38669)))

(declare-fun b_lambda!18919 () Bool)

(assert (=> (not b_lambda!18919) (not b!1131911)))

(assert (=> b!1131911 t!35705))

(declare-fun b_and!38671 () Bool)

(assert (= b_and!38669 (and (=> t!35705 result!18059) b_and!38671)))

(declare-fun m!1044805 () Bool)

(assert (=> b!1131903 m!1044805))

(declare-fun m!1044807 () Bool)

(assert (=> b!1131910 m!1044807))

(assert (=> bm!48756 m!1044805))

(declare-fun m!1044809 () Bool)

(assert (=> b!1131901 m!1044809))

(assert (=> b!1131901 m!1044809))

(assert (=> b!1131901 m!1044589))

(declare-fun m!1044811 () Bool)

(assert (=> b!1131901 m!1044811))

(assert (=> b!1131901 m!1044589))

(declare-fun m!1044813 () Bool)

(assert (=> b!1131901 m!1044813))

(assert (=> b!1131901 m!1044813))

(declare-fun m!1044815 () Bool)

(assert (=> b!1131901 m!1044815))

(declare-fun m!1044817 () Bool)

(assert (=> d!131333 m!1044817))

(assert (=> d!131333 m!1044583))

(assert (=> b!1131905 m!1044813))

(assert (=> b!1131905 m!1044813))

(declare-fun m!1044819 () Bool)

(assert (=> b!1131905 m!1044819))

(declare-fun m!1044821 () Bool)

(assert (=> b!1131908 m!1044821))

(assert (=> b!1131909 m!1044813))

(assert (=> b!1131909 m!1044813))

(assert (=> b!1131909 m!1044819))

(assert (=> b!1131912 m!1044813))

(assert (=> b!1131912 m!1044813))

(declare-fun m!1044823 () Bool)

(assert (=> b!1131912 m!1044823))

(assert (=> b!1131911 m!1044809))

(assert (=> b!1131911 m!1044809))

(assert (=> b!1131911 m!1044589))

(assert (=> b!1131911 m!1044811))

(declare-fun m!1044825 () Bool)

(assert (=> b!1131911 m!1044825))

(declare-fun m!1044827 () Bool)

(assert (=> b!1131911 m!1044827))

(assert (=> b!1131911 m!1044589))

(declare-fun m!1044829 () Bool)

(assert (=> b!1131911 m!1044829))

(assert (=> b!1131911 m!1044813))

(assert (=> b!1131911 m!1044825))

(declare-fun m!1044831 () Bool)

(assert (=> b!1131911 m!1044831))

(assert (=> bm!48719 d!131333))

(declare-fun b!1131913 () Bool)

(assert (=> b!1131913 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(assert (=> b!1131913 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36084 (ite c!110222 _values!996 lt!502685))))))

(declare-fun lt!502833 () ListLongMap!15983)

(declare-fun e!644174 () Bool)

(assert (=> b!1131913 (= e!644174 (= (apply!955 lt!502833 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1131914 () Bool)

(declare-fun e!644178 () Bool)

(declare-fun e!644176 () Bool)

(assert (=> b!1131914 (= e!644178 e!644176)))

(declare-fun c!110271 () Bool)

(assert (=> b!1131914 (= c!110271 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(declare-fun bm!48757 () Bool)

(declare-fun call!48760 () ListLongMap!15983)

(assert (=> bm!48757 (= call!48760 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 _keys!1208 lt!502695) (ite c!110222 _values!996 lt!502685) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131335 () Bool)

(declare-fun e!644172 () Bool)

(assert (=> d!131335 e!644172))

(declare-fun res!756097 () Bool)

(assert (=> d!131335 (=> (not res!756097) (not e!644172))))

(assert (=> d!131335 (= res!756097 (not (contains!6529 lt!502833 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644177 () ListLongMap!15983)

(assert (=> d!131335 (= lt!502833 e!644177)))

(declare-fun c!110273 () Bool)

(assert (=> d!131335 (= c!110273 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(assert (=> d!131335 (validMask!0 mask!1564)))

(assert (=> d!131335 (= (getCurrentListMapNoExtraKeys!4494 (ite c!110222 _keys!1208 lt!502695) (ite c!110222 _values!996 lt!502685) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502833)))

(declare-fun b!1131915 () Bool)

(assert (=> b!1131915 (= e!644176 (= lt!502833 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 _keys!1208 lt!502695) (ite c!110222 _values!996 lt!502685) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131916 () Bool)

(declare-fun e!644173 () ListLongMap!15983)

(assert (=> b!1131916 (= e!644173 call!48760)))

(declare-fun e!644175 () Bool)

(declare-fun b!1131917 () Bool)

(assert (=> b!1131917 (= e!644175 (validKeyInArray!0 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131917 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1131918 () Bool)

(assert (=> b!1131918 (= e!644177 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1131919 () Bool)

(assert (=> b!1131919 (= e!644172 e!644178)))

(declare-fun c!110272 () Bool)

(assert (=> b!1131919 (= c!110272 e!644175)))

(declare-fun res!756098 () Bool)

(assert (=> b!1131919 (=> (not res!756098) (not e!644175))))

(assert (=> b!1131919 (= res!756098 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(declare-fun b!1131920 () Bool)

(assert (=> b!1131920 (= e!644176 (isEmpty!973 lt!502833))))

(declare-fun b!1131921 () Bool)

(assert (=> b!1131921 (= e!644177 e!644173)))

(declare-fun c!110270 () Bool)

(assert (=> b!1131921 (= c!110270 (validKeyInArray!0 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1131922 () Bool)

(declare-fun res!756095 () Bool)

(assert (=> b!1131922 (=> (not res!756095) (not e!644172))))

(assert (=> b!1131922 (= res!756095 (not (contains!6529 lt!502833 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131923 () Bool)

(declare-fun lt!502829 () Unit!37073)

(declare-fun lt!502835 () Unit!37073)

(assert (=> b!1131923 (= lt!502829 lt!502835)))

(declare-fun lt!502834 () V!43083)

(declare-fun lt!502831 () (_ BitVec 64))

(declare-fun lt!502830 () (_ BitVec 64))

(declare-fun lt!502832 () ListLongMap!15983)

(assert (=> b!1131923 (not (contains!6529 (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834)) lt!502830))))

(assert (=> b!1131923 (= lt!502835 (addStillNotContains!283 lt!502832 lt!502831 lt!502834 lt!502830))))

(assert (=> b!1131923 (= lt!502830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131923 (= lt!502834 (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131923 (= lt!502831 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1131923 (= lt!502832 call!48760)))

(assert (=> b!1131923 (= e!644173 (+!3451 call!48760 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1131924 () Bool)

(assert (=> b!1131924 (= e!644178 e!644174)))

(assert (=> b!1131924 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(declare-fun res!756096 () Bool)

(assert (=> b!1131924 (= res!756096 (contains!6529 lt!502833 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131924 (=> (not res!756096) (not e!644174))))

(assert (= (and d!131335 c!110273) b!1131918))

(assert (= (and d!131335 (not c!110273)) b!1131921))

(assert (= (and b!1131921 c!110270) b!1131923))

(assert (= (and b!1131921 (not c!110270)) b!1131916))

(assert (= (or b!1131923 b!1131916) bm!48757))

(assert (= (and d!131335 res!756097) b!1131922))

(assert (= (and b!1131922 res!756095) b!1131919))

(assert (= (and b!1131919 res!756098) b!1131917))

(assert (= (and b!1131919 c!110272) b!1131924))

(assert (= (and b!1131919 (not c!110272)) b!1131914))

(assert (= (and b!1131924 res!756096) b!1131913))

(assert (= (and b!1131914 c!110271) b!1131915))

(assert (= (and b!1131914 (not c!110271)) b!1131920))

(declare-fun b_lambda!18921 () Bool)

(assert (=> (not b_lambda!18921) (not b!1131913)))

(assert (=> b!1131913 t!35705))

(declare-fun b_and!38673 () Bool)

(assert (= b_and!38671 (and (=> t!35705 result!18059) b_and!38673)))

(declare-fun b_lambda!18923 () Bool)

(assert (=> (not b_lambda!18923) (not b!1131923)))

(assert (=> b!1131923 t!35705))

(declare-fun b_and!38675 () Bool)

(assert (= b_and!38673 (and (=> t!35705 result!18059) b_and!38675)))

(declare-fun m!1044833 () Bool)

(assert (=> b!1131915 m!1044833))

(declare-fun m!1044835 () Bool)

(assert (=> b!1131922 m!1044835))

(assert (=> bm!48757 m!1044833))

(declare-fun m!1044837 () Bool)

(assert (=> b!1131913 m!1044837))

(assert (=> b!1131913 m!1044837))

(assert (=> b!1131913 m!1044589))

(declare-fun m!1044839 () Bool)

(assert (=> b!1131913 m!1044839))

(assert (=> b!1131913 m!1044589))

(declare-fun m!1044841 () Bool)

(assert (=> b!1131913 m!1044841))

(assert (=> b!1131913 m!1044841))

(declare-fun m!1044843 () Bool)

(assert (=> b!1131913 m!1044843))

(declare-fun m!1044845 () Bool)

(assert (=> d!131335 m!1044845))

(assert (=> d!131335 m!1044583))

(assert (=> b!1131917 m!1044841))

(assert (=> b!1131917 m!1044841))

(declare-fun m!1044847 () Bool)

(assert (=> b!1131917 m!1044847))

(declare-fun m!1044849 () Bool)

(assert (=> b!1131920 m!1044849))

(assert (=> b!1131921 m!1044841))

(assert (=> b!1131921 m!1044841))

(assert (=> b!1131921 m!1044847))

(assert (=> b!1131924 m!1044841))

(assert (=> b!1131924 m!1044841))

(declare-fun m!1044851 () Bool)

(assert (=> b!1131924 m!1044851))

(assert (=> b!1131923 m!1044837))

(assert (=> b!1131923 m!1044837))

(assert (=> b!1131923 m!1044589))

(assert (=> b!1131923 m!1044839))

(declare-fun m!1044853 () Bool)

(assert (=> b!1131923 m!1044853))

(declare-fun m!1044855 () Bool)

(assert (=> b!1131923 m!1044855))

(assert (=> b!1131923 m!1044589))

(declare-fun m!1044857 () Bool)

(assert (=> b!1131923 m!1044857))

(assert (=> b!1131923 m!1044841))

(assert (=> b!1131923 m!1044853))

(declare-fun m!1044859 () Bool)

(assert (=> b!1131923 m!1044859))

(assert (=> bm!48717 d!131335))

(declare-fun d!131337 () Bool)

(declare-fun e!644181 () Bool)

(assert (=> d!131337 e!644181))

(declare-fun c!110276 () Bool)

(assert (=> d!131337 (= c!110276 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!502838 () Unit!37073)

(declare-fun choose!1775 (array!73793 array!73791 (_ BitVec 32) (_ BitVec 32) V!43083 V!43083 (_ BitVec 64) (_ BitVec 32) Int) Unit!37073)

(assert (=> d!131337 (= lt!502838 (choose!1775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131337 (validMask!0 mask!1564)))

(assert (=> d!131337 (= (lemmaListMapContainsThenArrayContainsFrom!323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502838)))

(declare-fun b!1131929 () Bool)

(assert (=> b!1131929 (= e!644181 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1131930 () Bool)

(assert (=> b!1131930 (= e!644181 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131337 c!110276) b!1131929))

(assert (= (and d!131337 (not c!110276)) b!1131930))

(declare-fun m!1044861 () Bool)

(assert (=> d!131337 m!1044861))

(assert (=> d!131337 m!1044583))

(assert (=> b!1131929 m!1044561))

(assert (=> b!1131690 d!131337))

(declare-fun d!131339 () Bool)

(assert (=> d!131339 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131714 d!131339))

(declare-fun b!1131931 () Bool)

(assert (=> b!1131931 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36085 lt!502695)))))

(assert (=> b!1131931 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36084 lt!502685)))))

(declare-fun e!644184 () Bool)

(declare-fun lt!502843 () ListLongMap!15983)

(assert (=> b!1131931 (= e!644184 (= (apply!955 lt!502843 (select (arr!35549 lt!502695) from!1455)) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1131932 () Bool)

(declare-fun e!644188 () Bool)

(declare-fun e!644186 () Bool)

(assert (=> b!1131932 (= e!644188 e!644186)))

(declare-fun c!110278 () Bool)

(assert (=> b!1131932 (= c!110278 (bvslt from!1455 (size!36085 lt!502695)))))

(declare-fun call!48761 () ListLongMap!15983)

(declare-fun bm!48758 () Bool)

(assert (=> bm!48758 (= call!48761 (getCurrentListMapNoExtraKeys!4494 lt!502695 lt!502685 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131341 () Bool)

(declare-fun e!644182 () Bool)

(assert (=> d!131341 e!644182))

(declare-fun res!756101 () Bool)

(assert (=> d!131341 (=> (not res!756101) (not e!644182))))

(assert (=> d!131341 (= res!756101 (not (contains!6529 lt!502843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644187 () ListLongMap!15983)

(assert (=> d!131341 (= lt!502843 e!644187)))

(declare-fun c!110280 () Bool)

(assert (=> d!131341 (= c!110280 (bvsge from!1455 (size!36085 lt!502695)))))

(assert (=> d!131341 (validMask!0 mask!1564)))

(assert (=> d!131341 (= (getCurrentListMapNoExtraKeys!4494 lt!502695 lt!502685 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!502843)))

(declare-fun b!1131933 () Bool)

(assert (=> b!1131933 (= e!644186 (= lt!502843 (getCurrentListMapNoExtraKeys!4494 lt!502695 lt!502685 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131934 () Bool)

(declare-fun e!644183 () ListLongMap!15983)

(assert (=> b!1131934 (= e!644183 call!48761)))

(declare-fun b!1131935 () Bool)

(declare-fun e!644185 () Bool)

(assert (=> b!1131935 (= e!644185 (validKeyInArray!0 (select (arr!35549 lt!502695) from!1455)))))

(assert (=> b!1131935 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1131936 () Bool)

(assert (=> b!1131936 (= e!644187 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1131937 () Bool)

(assert (=> b!1131937 (= e!644182 e!644188)))

(declare-fun c!110279 () Bool)

(assert (=> b!1131937 (= c!110279 e!644185)))

(declare-fun res!756102 () Bool)

(assert (=> b!1131937 (=> (not res!756102) (not e!644185))))

(assert (=> b!1131937 (= res!756102 (bvslt from!1455 (size!36085 lt!502695)))))

(declare-fun b!1131938 () Bool)

(assert (=> b!1131938 (= e!644186 (isEmpty!973 lt!502843))))

(declare-fun b!1131939 () Bool)

(assert (=> b!1131939 (= e!644187 e!644183)))

(declare-fun c!110277 () Bool)

(assert (=> b!1131939 (= c!110277 (validKeyInArray!0 (select (arr!35549 lt!502695) from!1455)))))

(declare-fun b!1131940 () Bool)

(declare-fun res!756099 () Bool)

(assert (=> b!1131940 (=> (not res!756099) (not e!644182))))

(assert (=> b!1131940 (= res!756099 (not (contains!6529 lt!502843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131941 () Bool)

(declare-fun lt!502839 () Unit!37073)

(declare-fun lt!502845 () Unit!37073)

(assert (=> b!1131941 (= lt!502839 lt!502845)))

(declare-fun lt!502844 () V!43083)

(declare-fun lt!502841 () (_ BitVec 64))

(declare-fun lt!502840 () (_ BitVec 64))

(declare-fun lt!502842 () ListLongMap!15983)

(assert (=> b!1131941 (not (contains!6529 (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844)) lt!502840))))

(assert (=> b!1131941 (= lt!502845 (addStillNotContains!283 lt!502842 lt!502841 lt!502844 lt!502840))))

(assert (=> b!1131941 (= lt!502840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131941 (= lt!502844 (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131941 (= lt!502841 (select (arr!35549 lt!502695) from!1455))))

(assert (=> b!1131941 (= lt!502842 call!48761)))

(assert (=> b!1131941 (= e!644183 (+!3451 call!48761 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1131942 () Bool)

(assert (=> b!1131942 (= e!644188 e!644184)))

(assert (=> b!1131942 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36085 lt!502695)))))

(declare-fun res!756100 () Bool)

(assert (=> b!1131942 (= res!756100 (contains!6529 lt!502843 (select (arr!35549 lt!502695) from!1455)))))

(assert (=> b!1131942 (=> (not res!756100) (not e!644184))))

(assert (= (and d!131341 c!110280) b!1131936))

(assert (= (and d!131341 (not c!110280)) b!1131939))

(assert (= (and b!1131939 c!110277) b!1131941))

(assert (= (and b!1131939 (not c!110277)) b!1131934))

(assert (= (or b!1131941 b!1131934) bm!48758))

(assert (= (and d!131341 res!756101) b!1131940))

(assert (= (and b!1131940 res!756099) b!1131937))

(assert (= (and b!1131937 res!756102) b!1131935))

(assert (= (and b!1131937 c!110279) b!1131942))

(assert (= (and b!1131937 (not c!110279)) b!1131932))

(assert (= (and b!1131942 res!756100) b!1131931))

(assert (= (and b!1131932 c!110278) b!1131933))

(assert (= (and b!1131932 (not c!110278)) b!1131938))

(declare-fun b_lambda!18925 () Bool)

(assert (=> (not b_lambda!18925) (not b!1131931)))

(assert (=> b!1131931 t!35705))

(declare-fun b_and!38677 () Bool)

(assert (= b_and!38675 (and (=> t!35705 result!18059) b_and!38677)))

(declare-fun b_lambda!18927 () Bool)

(assert (=> (not b_lambda!18927) (not b!1131941)))

(assert (=> b!1131941 t!35705))

(declare-fun b_and!38679 () Bool)

(assert (= b_and!38677 (and (=> t!35705 result!18059) b_and!38679)))

(declare-fun m!1044863 () Bool)

(assert (=> b!1131933 m!1044863))

(declare-fun m!1044865 () Bool)

(assert (=> b!1131940 m!1044865))

(assert (=> bm!48758 m!1044863))

(declare-fun m!1044867 () Bool)

(assert (=> b!1131931 m!1044867))

(assert (=> b!1131931 m!1044867))

(assert (=> b!1131931 m!1044589))

(declare-fun m!1044869 () Bool)

(assert (=> b!1131931 m!1044869))

(assert (=> b!1131931 m!1044589))

(declare-fun m!1044871 () Bool)

(assert (=> b!1131931 m!1044871))

(assert (=> b!1131931 m!1044871))

(declare-fun m!1044873 () Bool)

(assert (=> b!1131931 m!1044873))

(declare-fun m!1044875 () Bool)

(assert (=> d!131341 m!1044875))

(assert (=> d!131341 m!1044583))

(assert (=> b!1131935 m!1044871))

(assert (=> b!1131935 m!1044871))

(declare-fun m!1044877 () Bool)

(assert (=> b!1131935 m!1044877))

(declare-fun m!1044879 () Bool)

(assert (=> b!1131938 m!1044879))

(assert (=> b!1131939 m!1044871))

(assert (=> b!1131939 m!1044871))

(assert (=> b!1131939 m!1044877))

(assert (=> b!1131942 m!1044871))

(assert (=> b!1131942 m!1044871))

(declare-fun m!1044881 () Bool)

(assert (=> b!1131942 m!1044881))

(assert (=> b!1131941 m!1044867))

(assert (=> b!1131941 m!1044867))

(assert (=> b!1131941 m!1044589))

(assert (=> b!1131941 m!1044869))

(declare-fun m!1044883 () Bool)

(assert (=> b!1131941 m!1044883))

(declare-fun m!1044885 () Bool)

(assert (=> b!1131941 m!1044885))

(assert (=> b!1131941 m!1044589))

(declare-fun m!1044887 () Bool)

(assert (=> b!1131941 m!1044887))

(assert (=> b!1131941 m!1044871))

(assert (=> b!1131941 m!1044883))

(declare-fun m!1044889 () Bool)

(assert (=> b!1131941 m!1044889))

(assert (=> b!1131705 d!131341))

(declare-fun b!1131943 () Bool)

(assert (=> b!1131943 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36085 _keys!1208)))))

(assert (=> b!1131943 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36084 _values!996)))))

(declare-fun e!644191 () Bool)

(declare-fun lt!502850 () ListLongMap!15983)

(assert (=> b!1131943 (= e!644191 (= (apply!955 lt!502850 (select (arr!35549 _keys!1208) from!1455)) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1131944 () Bool)

(declare-fun e!644195 () Bool)

(declare-fun e!644193 () Bool)

(assert (=> b!1131944 (= e!644195 e!644193)))

(declare-fun c!110282 () Bool)

(assert (=> b!1131944 (= c!110282 (bvslt from!1455 (size!36085 _keys!1208)))))

(declare-fun bm!48759 () Bool)

(declare-fun call!48762 () ListLongMap!15983)

(assert (=> bm!48759 (= call!48762 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131343 () Bool)

(declare-fun e!644189 () Bool)

(assert (=> d!131343 e!644189))

(declare-fun res!756105 () Bool)

(assert (=> d!131343 (=> (not res!756105) (not e!644189))))

(assert (=> d!131343 (= res!756105 (not (contains!6529 lt!502850 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644194 () ListLongMap!15983)

(assert (=> d!131343 (= lt!502850 e!644194)))

(declare-fun c!110284 () Bool)

(assert (=> d!131343 (= c!110284 (bvsge from!1455 (size!36085 _keys!1208)))))

(assert (=> d!131343 (validMask!0 mask!1564)))

(assert (=> d!131343 (= (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!502850)))

(declare-fun b!1131945 () Bool)

(assert (=> b!1131945 (= e!644193 (= lt!502850 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131946 () Bool)

(declare-fun e!644190 () ListLongMap!15983)

(assert (=> b!1131946 (= e!644190 call!48762)))

(declare-fun b!1131947 () Bool)

(declare-fun e!644192 () Bool)

(assert (=> b!1131947 (= e!644192 (validKeyInArray!0 (select (arr!35549 _keys!1208) from!1455)))))

(assert (=> b!1131947 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1131948 () Bool)

(assert (=> b!1131948 (= e!644194 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1131949 () Bool)

(assert (=> b!1131949 (= e!644189 e!644195)))

(declare-fun c!110283 () Bool)

(assert (=> b!1131949 (= c!110283 e!644192)))

(declare-fun res!756106 () Bool)

(assert (=> b!1131949 (=> (not res!756106) (not e!644192))))

(assert (=> b!1131949 (= res!756106 (bvslt from!1455 (size!36085 _keys!1208)))))

(declare-fun b!1131950 () Bool)

(assert (=> b!1131950 (= e!644193 (isEmpty!973 lt!502850))))

(declare-fun b!1131951 () Bool)

(assert (=> b!1131951 (= e!644194 e!644190)))

(declare-fun c!110281 () Bool)

(assert (=> b!1131951 (= c!110281 (validKeyInArray!0 (select (arr!35549 _keys!1208) from!1455)))))

(declare-fun b!1131952 () Bool)

(declare-fun res!756103 () Bool)

(assert (=> b!1131952 (=> (not res!756103) (not e!644189))))

(assert (=> b!1131952 (= res!756103 (not (contains!6529 lt!502850 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131953 () Bool)

(declare-fun lt!502846 () Unit!37073)

(declare-fun lt!502852 () Unit!37073)

(assert (=> b!1131953 (= lt!502846 lt!502852)))

(declare-fun lt!502848 () (_ BitVec 64))

(declare-fun lt!502849 () ListLongMap!15983)

(declare-fun lt!502851 () V!43083)

(declare-fun lt!502847 () (_ BitVec 64))

(assert (=> b!1131953 (not (contains!6529 (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851)) lt!502847))))

(assert (=> b!1131953 (= lt!502852 (addStillNotContains!283 lt!502849 lt!502848 lt!502851 lt!502847))))

(assert (=> b!1131953 (= lt!502847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131953 (= lt!502851 (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131953 (= lt!502848 (select (arr!35549 _keys!1208) from!1455))))

(assert (=> b!1131953 (= lt!502849 call!48762)))

(assert (=> b!1131953 (= e!644190 (+!3451 call!48762 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1131954 () Bool)

(assert (=> b!1131954 (= e!644195 e!644191)))

(assert (=> b!1131954 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36085 _keys!1208)))))

(declare-fun res!756104 () Bool)

(assert (=> b!1131954 (= res!756104 (contains!6529 lt!502850 (select (arr!35549 _keys!1208) from!1455)))))

(assert (=> b!1131954 (=> (not res!756104) (not e!644191))))

(assert (= (and d!131343 c!110284) b!1131948))

(assert (= (and d!131343 (not c!110284)) b!1131951))

(assert (= (and b!1131951 c!110281) b!1131953))

(assert (= (and b!1131951 (not c!110281)) b!1131946))

(assert (= (or b!1131953 b!1131946) bm!48759))

(assert (= (and d!131343 res!756105) b!1131952))

(assert (= (and b!1131952 res!756103) b!1131949))

(assert (= (and b!1131949 res!756106) b!1131947))

(assert (= (and b!1131949 c!110283) b!1131954))

(assert (= (and b!1131949 (not c!110283)) b!1131944))

(assert (= (and b!1131954 res!756104) b!1131943))

(assert (= (and b!1131944 c!110282) b!1131945))

(assert (= (and b!1131944 (not c!110282)) b!1131950))

(declare-fun b_lambda!18929 () Bool)

(assert (=> (not b_lambda!18929) (not b!1131943)))

(assert (=> b!1131943 t!35705))

(declare-fun b_and!38681 () Bool)

(assert (= b_and!38679 (and (=> t!35705 result!18059) b_and!38681)))

(declare-fun b_lambda!18931 () Bool)

(assert (=> (not b_lambda!18931) (not b!1131953)))

(assert (=> b!1131953 t!35705))

(declare-fun b_and!38683 () Bool)

(assert (= b_and!38681 (and (=> t!35705 result!18059) b_and!38683)))

(declare-fun m!1044891 () Bool)

(assert (=> b!1131945 m!1044891))

(declare-fun m!1044893 () Bool)

(assert (=> b!1131952 m!1044893))

(assert (=> bm!48759 m!1044891))

(declare-fun m!1044895 () Bool)

(assert (=> b!1131943 m!1044895))

(assert (=> b!1131943 m!1044895))

(assert (=> b!1131943 m!1044589))

(declare-fun m!1044897 () Bool)

(assert (=> b!1131943 m!1044897))

(assert (=> b!1131943 m!1044589))

(assert (=> b!1131943 m!1044563))

(assert (=> b!1131943 m!1044563))

(declare-fun m!1044899 () Bool)

(assert (=> b!1131943 m!1044899))

(declare-fun m!1044901 () Bool)

(assert (=> d!131343 m!1044901))

(assert (=> d!131343 m!1044583))

(assert (=> b!1131947 m!1044563))

(assert (=> b!1131947 m!1044563))

(declare-fun m!1044903 () Bool)

(assert (=> b!1131947 m!1044903))

(declare-fun m!1044905 () Bool)

(assert (=> b!1131950 m!1044905))

(assert (=> b!1131951 m!1044563))

(assert (=> b!1131951 m!1044563))

(assert (=> b!1131951 m!1044903))

(assert (=> b!1131954 m!1044563))

(assert (=> b!1131954 m!1044563))

(declare-fun m!1044907 () Bool)

(assert (=> b!1131954 m!1044907))

(assert (=> b!1131953 m!1044895))

(assert (=> b!1131953 m!1044895))

(assert (=> b!1131953 m!1044589))

(assert (=> b!1131953 m!1044897))

(declare-fun m!1044909 () Bool)

(assert (=> b!1131953 m!1044909))

(declare-fun m!1044911 () Bool)

(assert (=> b!1131953 m!1044911))

(assert (=> b!1131953 m!1044589))

(declare-fun m!1044913 () Bool)

(assert (=> b!1131953 m!1044913))

(assert (=> b!1131953 m!1044563))

(assert (=> b!1131953 m!1044909))

(declare-fun m!1044915 () Bool)

(assert (=> b!1131953 m!1044915))

(assert (=> b!1131705 d!131343))

(declare-fun b!1131961 () Bool)

(declare-fun e!644201 () Bool)

(declare-fun call!48768 () ListLongMap!15983)

(declare-fun call!48767 () ListLongMap!15983)

(assert (=> b!1131961 (= e!644201 (= call!48768 call!48767))))

(assert (=> b!1131961 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36084 _values!996)))))

(declare-fun d!131345 () Bool)

(declare-fun e!644200 () Bool)

(assert (=> d!131345 e!644200))

(declare-fun res!756109 () Bool)

(assert (=> d!131345 (=> (not res!756109) (not e!644200))))

(assert (=> d!131345 (= res!756109 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36085 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36085 _keys!1208))))))))

(declare-fun lt!502855 () Unit!37073)

(declare-fun choose!1776 (array!73793 array!73791 (_ BitVec 32) (_ BitVec 32) V!43083 V!43083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37073)

(assert (=> d!131345 (= lt!502855 (choose!1776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131345 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 _keys!1208)))))

(assert (=> d!131345 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502855)))

(declare-fun bm!48764 () Bool)

(assert (=> bm!48764 (= call!48768 (getCurrentListMapNoExtraKeys!4494 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)) (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131962 () Bool)

(assert (=> b!1131962 (= e!644201 (= call!48768 (-!1179 call!48767 k0!934)))))

(assert (=> b!1131962 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36084 _values!996)))))

(declare-fun b!1131963 () Bool)

(assert (=> b!1131963 (= e!644200 e!644201)))

(declare-fun c!110287 () Bool)

(assert (=> b!1131963 (= c!110287 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!48765 () Bool)

(assert (=> bm!48765 (= call!48767 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!131345 res!756109) b!1131963))

(assert (= (and b!1131963 c!110287) b!1131962))

(assert (= (and b!1131963 (not c!110287)) b!1131961))

(assert (= (or b!1131962 b!1131961) bm!48765))

(assert (= (or b!1131962 b!1131961) bm!48764))

(declare-fun b_lambda!18933 () Bool)

(assert (=> (not b_lambda!18933) (not bm!48764)))

(assert (=> bm!48764 t!35705))

(declare-fun b_and!38685 () Bool)

(assert (= b_and!38683 (and (=> t!35705 result!18059) b_and!38685)))

(declare-fun m!1044917 () Bool)

(assert (=> d!131345 m!1044917))

(assert (=> bm!48764 m!1044577))

(assert (=> bm!48764 m!1044589))

(assert (=> bm!48764 m!1044591))

(declare-fun m!1044919 () Bool)

(assert (=> bm!48764 m!1044919))

(declare-fun m!1044921 () Bool)

(assert (=> b!1131962 m!1044921))

(assert (=> bm!48765 m!1044559))

(assert (=> b!1131704 d!131345))

(declare-fun b!1131964 () Bool)

(declare-fun e!644205 () Bool)

(declare-fun e!644202 () Bool)

(assert (=> b!1131964 (= e!644205 e!644202)))

(declare-fun res!756112 () Bool)

(assert (=> b!1131964 (=> (not res!756112) (not e!644202))))

(declare-fun e!644204 () Bool)

(assert (=> b!1131964 (= res!756112 (not e!644204))))

(declare-fun res!756110 () Bool)

(assert (=> b!1131964 (=> (not res!756110) (not e!644204))))

(assert (=> b!1131964 (= res!756110 (validKeyInArray!0 (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(declare-fun bm!48766 () Bool)

(declare-fun call!48769 () Bool)

(declare-fun c!110288 () Bool)

(assert (=> bm!48766 (= call!48769 (arrayNoDuplicates!0 lt!502695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110288 (Cons!24773 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) Nil!24774) Nil!24774)))))

(declare-fun b!1131965 () Bool)

(declare-fun e!644203 () Bool)

(assert (=> b!1131965 (= e!644203 call!48769)))

(declare-fun b!1131966 () Bool)

(assert (=> b!1131966 (= e!644203 call!48769)))

(declare-fun d!131347 () Bool)

(declare-fun res!756111 () Bool)

(assert (=> d!131347 (=> res!756111 e!644205)))

(assert (=> d!131347 (= res!756111 (bvsge #b00000000000000000000000000000000 (size!36085 lt!502695)))))

(assert (=> d!131347 (= (arrayNoDuplicates!0 lt!502695 #b00000000000000000000000000000000 Nil!24774) e!644205)))

(declare-fun b!1131967 () Bool)

(assert (=> b!1131967 (= e!644204 (contains!6532 Nil!24774 (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(declare-fun b!1131968 () Bool)

(assert (=> b!1131968 (= e!644202 e!644203)))

(assert (=> b!1131968 (= c!110288 (validKeyInArray!0 (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(assert (= (and d!131347 (not res!756111)) b!1131964))

(assert (= (and b!1131964 res!756110) b!1131967))

(assert (= (and b!1131964 res!756112) b!1131968))

(assert (= (and b!1131968 c!110288) b!1131965))

(assert (= (and b!1131968 (not c!110288)) b!1131966))

(assert (= (or b!1131965 b!1131966) bm!48766))

(assert (=> b!1131964 m!1044791))

(assert (=> b!1131964 m!1044791))

(assert (=> b!1131964 m!1044799))

(assert (=> bm!48766 m!1044791))

(declare-fun m!1044923 () Bool)

(assert (=> bm!48766 m!1044923))

(assert (=> b!1131967 m!1044791))

(assert (=> b!1131967 m!1044791))

(declare-fun m!1044925 () Bool)

(assert (=> b!1131967 m!1044925))

(assert (=> b!1131968 m!1044791))

(assert (=> b!1131968 m!1044791))

(assert (=> b!1131968 m!1044799))

(assert (=> b!1131703 d!131347))

(declare-fun b!1131976 () Bool)

(declare-fun e!644211 () Bool)

(assert (=> b!1131976 (= e!644211 tp_is_empty!28467)))

(declare-fun mapIsEmpty!44524 () Bool)

(declare-fun mapRes!44524 () Bool)

(assert (=> mapIsEmpty!44524 mapRes!44524))

(declare-fun mapNonEmpty!44524 () Bool)

(declare-fun tp!84524 () Bool)

(declare-fun e!644210 () Bool)

(assert (=> mapNonEmpty!44524 (= mapRes!44524 (and tp!84524 e!644210))))

(declare-fun mapRest!44524 () (Array (_ BitVec 32) ValueCell!13524))

(declare-fun mapValue!44524 () ValueCell!13524)

(declare-fun mapKey!44524 () (_ BitVec 32))

(assert (=> mapNonEmpty!44524 (= mapRest!44518 (store mapRest!44524 mapKey!44524 mapValue!44524))))

(declare-fun b!1131975 () Bool)

(assert (=> b!1131975 (= e!644210 tp_is_empty!28467)))

(declare-fun condMapEmpty!44524 () Bool)

(declare-fun mapDefault!44524 () ValueCell!13524)

(assert (=> mapNonEmpty!44518 (= condMapEmpty!44524 (= mapRest!44518 ((as const (Array (_ BitVec 32) ValueCell!13524)) mapDefault!44524)))))

(assert (=> mapNonEmpty!44518 (= tp!84515 (and e!644211 mapRes!44524))))

(assert (= (and mapNonEmpty!44518 condMapEmpty!44524) mapIsEmpty!44524))

(assert (= (and mapNonEmpty!44518 (not condMapEmpty!44524)) mapNonEmpty!44524))

(assert (= (and mapNonEmpty!44524 ((_ is ValueCellFull!13524) mapValue!44524)) b!1131975))

(assert (= (and mapNonEmpty!44518 ((_ is ValueCellFull!13524) mapDefault!44524)) b!1131976))

(declare-fun m!1044927 () Bool)

(assert (=> mapNonEmpty!44524 m!1044927))

(declare-fun b_lambda!18935 () Bool)

(assert (= b_lambda!18931 (or (and start!98236 b_free!23937) b_lambda!18935)))

(declare-fun b_lambda!18937 () Bool)

(assert (= b_lambda!18917 (or (and start!98236 b_free!23937) b_lambda!18937)))

(declare-fun b_lambda!18939 () Bool)

(assert (= b_lambda!18923 (or (and start!98236 b_free!23937) b_lambda!18939)))

(declare-fun b_lambda!18941 () Bool)

(assert (= b_lambda!18921 (or (and start!98236 b_free!23937) b_lambda!18941)))

(declare-fun b_lambda!18943 () Bool)

(assert (= b_lambda!18927 (or (and start!98236 b_free!23937) b_lambda!18943)))

(declare-fun b_lambda!18945 () Bool)

(assert (= b_lambda!18919 (or (and start!98236 b_free!23937) b_lambda!18945)))

(declare-fun b_lambda!18947 () Bool)

(assert (= b_lambda!18925 (or (and start!98236 b_free!23937) b_lambda!18947)))

(declare-fun b_lambda!18949 () Bool)

(assert (= b_lambda!18929 (or (and start!98236 b_free!23937) b_lambda!18949)))

(declare-fun b_lambda!18951 () Bool)

(assert (= b_lambda!18933 (or (and start!98236 b_free!23937) b_lambda!18951)))

(declare-fun b_lambda!18953 () Bool)

(assert (= b_lambda!18915 (or (and start!98236 b_free!23937) b_lambda!18953)))

(declare-fun b_lambda!18955 () Bool)

(assert (= b_lambda!18913 (or (and start!98236 b_free!23937) b_lambda!18955)))

(check-sat (not b!1131806) (not b!1131940) (not b!1131962) (not b!1131954) (not b!1131876) b_and!38685 (not bm!48754) (not b_lambda!18953) (not b!1131968) (not b!1131824) (not b!1131942) (not bm!48756) (not b!1131857) (not b_lambda!18947) (not b!1131941) (not b!1131897) (not b!1131929) (not bm!48751) (not b!1131953) (not mapNonEmpty!44524) (not d!131297) (not b!1131913) (not b!1131853) (not bm!48764) (not b!1131821) (not bm!48755) (not b!1131952) (not d!131337) (not d!131341) (not b_lambda!18939) (not bm!48758) (not b!1131921) (not b!1131900) (not d!131327) (not d!131345) (not b!1131807) tp_is_empty!28467 (not b!1131813) (not b!1131826) (not bm!48766) (not b!1131890) (not b!1131939) (not b!1131905) (not b!1131917) (not bm!48765) (not b!1131863) (not b!1131935) (not b_lambda!18955) (not b!1131861) (not b!1131908) (not b!1131933) (not b_lambda!18945) (not b!1131828) (not d!131317) (not d!131307) (not b!1131855) (not b_lambda!18937) (not b!1131920) (not b!1131967) (not d!131343) (not b!1131964) (not b_lambda!18943) (not b!1131862) (not b!1131860) (not b!1131893) (not b!1131943) (not d!131301) (not b!1131912) (not b_lambda!18949) (not b!1131823) (not b_lambda!18951) (not b!1131924) (not d!131305) (not bm!48748) (not b!1131910) (not b!1131825) (not b!1131915) (not d!131311) (not b_next!23937) (not d!131331) (not b!1131873) (not b!1131923) (not b!1131894) (not b!1131931) (not b_lambda!18911) (not b!1131950) (not b!1131903) (not b!1131864) (not d!131335) (not b!1131938) (not b_lambda!18941) (not bm!48757) (not b!1131945) (not b!1131911) (not b!1131909) (not d!131309) (not b!1131877) (not bm!48759) (not b!1131922) (not b!1131901) (not b!1131896) (not d!131313) (not b!1131879) (not b_lambda!18935) (not b!1131951) (not d!131333) (not b!1131947))
(check-sat b_and!38685 (not b_next!23937))
(get-model)

(declare-fun d!131349 () Bool)

(declare-fun e!644213 () Bool)

(assert (=> d!131349 e!644213))

(declare-fun res!756113 () Bool)

(assert (=> d!131349 (=> res!756113 e!644213)))

(declare-fun lt!502857 () Bool)

(assert (=> d!131349 (= res!756113 (not lt!502857))))

(declare-fun lt!502859 () Bool)

(assert (=> d!131349 (= lt!502857 lt!502859)))

(declare-fun lt!502858 () Unit!37073)

(declare-fun e!644212 () Unit!37073)

(assert (=> d!131349 (= lt!502858 e!644212)))

(declare-fun c!110289 () Bool)

(assert (=> d!131349 (= c!110289 lt!502859)))

(assert (=> d!131349 (= lt!502859 (containsKey!585 (toList!8007 lt!502826) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131349 (= (contains!6529 lt!502826 #b0000000000000000000000000000000000000000000000000000000000000000) lt!502857)))

(declare-fun b!1131977 () Bool)

(declare-fun lt!502856 () Unit!37073)

(assert (=> b!1131977 (= e!644212 lt!502856)))

(assert (=> b!1131977 (= lt!502856 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502826) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1131977 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502826) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1131978 () Bool)

(declare-fun Unit!37082 () Unit!37073)

(assert (=> b!1131978 (= e!644212 Unit!37082)))

(declare-fun b!1131979 () Bool)

(assert (=> b!1131979 (= e!644213 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131349 c!110289) b!1131977))

(assert (= (and d!131349 (not c!110289)) b!1131978))

(assert (= (and d!131349 (not res!756113)) b!1131979))

(declare-fun m!1044929 () Bool)

(assert (=> d!131349 m!1044929))

(declare-fun m!1044931 () Bool)

(assert (=> b!1131977 m!1044931))

(declare-fun m!1044933 () Bool)

(assert (=> b!1131977 m!1044933))

(assert (=> b!1131977 m!1044933))

(declare-fun m!1044935 () Bool)

(assert (=> b!1131977 m!1044935))

(assert (=> b!1131979 m!1044933))

(assert (=> b!1131979 m!1044933))

(assert (=> b!1131979 m!1044935))

(assert (=> d!131333 d!131349))

(assert (=> d!131333 d!131303))

(declare-fun d!131351 () Bool)

(declare-fun lt!502862 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!539 (List!24777) (InoxSet (_ BitVec 64)))

(assert (=> d!131351 (= lt!502862 (select (content!539 Nil!24774) (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(declare-fun e!644219 () Bool)

(assert (=> d!131351 (= lt!502862 e!644219)))

(declare-fun res!756119 () Bool)

(assert (=> d!131351 (=> (not res!756119) (not e!644219))))

(assert (=> d!131351 (= res!756119 ((_ is Cons!24773) Nil!24774))))

(assert (=> d!131351 (= (contains!6532 Nil!24774 (select (arr!35549 lt!502695) #b00000000000000000000000000000000)) lt!502862)))

(declare-fun b!1131984 () Bool)

(declare-fun e!644218 () Bool)

(assert (=> b!1131984 (= e!644219 e!644218)))

(declare-fun res!756118 () Bool)

(assert (=> b!1131984 (=> res!756118 e!644218)))

(assert (=> b!1131984 (= res!756118 (= (h!25982 Nil!24774) (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(declare-fun b!1131985 () Bool)

(assert (=> b!1131985 (= e!644218 (contains!6532 (t!35706 Nil!24774) (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(assert (= (and d!131351 res!756119) b!1131984))

(assert (= (and b!1131984 (not res!756118)) b!1131985))

(declare-fun m!1044937 () Bool)

(assert (=> d!131351 m!1044937))

(assert (=> d!131351 m!1044791))

(declare-fun m!1044939 () Bool)

(assert (=> d!131351 m!1044939))

(assert (=> b!1131985 m!1044791))

(declare-fun m!1044941 () Bool)

(assert (=> b!1131985 m!1044941))

(assert (=> b!1131967 d!131351))

(declare-fun d!131353 () Bool)

(assert (=> d!131353 (= (validKeyInArray!0 (select (arr!35549 lt!502695) from!1455)) (and (not (= (select (arr!35549 lt!502695) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35549 lt!502695) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131935 d!131353))

(declare-fun b!1131986 () Bool)

(assert (=> b!1131986 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(assert (=> b!1131986 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36084 lt!502685)))))

(declare-fun e!644222 () Bool)

(declare-fun lt!502867 () ListLongMap!15983)

(assert (=> b!1131986 (= e!644222 (= (apply!955 lt!502867 (select (arr!35549 lt!502695) (bvadd from!1455 #b00000000000000000000000000000001))) (get!18073 (select (arr!35548 lt!502685) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1131987 () Bool)

(declare-fun e!644226 () Bool)

(declare-fun e!644224 () Bool)

(assert (=> b!1131987 (= e!644226 e!644224)))

(declare-fun c!110291 () Bool)

(assert (=> b!1131987 (= c!110291 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(declare-fun call!48770 () ListLongMap!15983)

(declare-fun bm!48767 () Bool)

(assert (=> bm!48767 (= call!48770 (getCurrentListMapNoExtraKeys!4494 lt!502695 lt!502685 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131355 () Bool)

(declare-fun e!644220 () Bool)

(assert (=> d!131355 e!644220))

(declare-fun res!756122 () Bool)

(assert (=> d!131355 (=> (not res!756122) (not e!644220))))

(assert (=> d!131355 (= res!756122 (not (contains!6529 lt!502867 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644225 () ListLongMap!15983)

(assert (=> d!131355 (= lt!502867 e!644225)))

(declare-fun c!110293 () Bool)

(assert (=> d!131355 (= c!110293 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(assert (=> d!131355 (validMask!0 mask!1564)))

(assert (=> d!131355 (= (getCurrentListMapNoExtraKeys!4494 lt!502695 lt!502685 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502867)))

(declare-fun b!1131988 () Bool)

(assert (=> b!1131988 (= e!644224 (= lt!502867 (getCurrentListMapNoExtraKeys!4494 lt!502695 lt!502685 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131989 () Bool)

(declare-fun e!644221 () ListLongMap!15983)

(assert (=> b!1131989 (= e!644221 call!48770)))

(declare-fun b!1131990 () Bool)

(declare-fun e!644223 () Bool)

(assert (=> b!1131990 (= e!644223 (validKeyInArray!0 (select (arr!35549 lt!502695) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131990 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1131991 () Bool)

(assert (=> b!1131991 (= e!644225 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1131992 () Bool)

(assert (=> b!1131992 (= e!644220 e!644226)))

(declare-fun c!110292 () Bool)

(assert (=> b!1131992 (= c!110292 e!644223)))

(declare-fun res!756123 () Bool)

(assert (=> b!1131992 (=> (not res!756123) (not e!644223))))

(assert (=> b!1131992 (= res!756123 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(declare-fun b!1131993 () Bool)

(assert (=> b!1131993 (= e!644224 (isEmpty!973 lt!502867))))

(declare-fun b!1131994 () Bool)

(assert (=> b!1131994 (= e!644225 e!644221)))

(declare-fun c!110290 () Bool)

(assert (=> b!1131994 (= c!110290 (validKeyInArray!0 (select (arr!35549 lt!502695) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1131995 () Bool)

(declare-fun res!756120 () Bool)

(assert (=> b!1131995 (=> (not res!756120) (not e!644220))))

(assert (=> b!1131995 (= res!756120 (not (contains!6529 lt!502867 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131996 () Bool)

(declare-fun lt!502863 () Unit!37073)

(declare-fun lt!502869 () Unit!37073)

(assert (=> b!1131996 (= lt!502863 lt!502869)))

(declare-fun lt!502866 () ListLongMap!15983)

(declare-fun lt!502864 () (_ BitVec 64))

(declare-fun lt!502865 () (_ BitVec 64))

(declare-fun lt!502868 () V!43083)

(assert (=> b!1131996 (not (contains!6529 (+!3451 lt!502866 (tuple2!18015 lt!502865 lt!502868)) lt!502864))))

(assert (=> b!1131996 (= lt!502869 (addStillNotContains!283 lt!502866 lt!502865 lt!502868 lt!502864))))

(assert (=> b!1131996 (= lt!502864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131996 (= lt!502868 (get!18073 (select (arr!35548 lt!502685) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131996 (= lt!502865 (select (arr!35549 lt!502695) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1131996 (= lt!502866 call!48770)))

(assert (=> b!1131996 (= e!644221 (+!3451 call!48770 (tuple2!18015 (select (arr!35549 lt!502695) (bvadd from!1455 #b00000000000000000000000000000001)) (get!18073 (select (arr!35548 lt!502685) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1131997 () Bool)

(assert (=> b!1131997 (= e!644226 e!644222)))

(assert (=> b!1131997 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(declare-fun res!756121 () Bool)

(assert (=> b!1131997 (= res!756121 (contains!6529 lt!502867 (select (arr!35549 lt!502695) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131997 (=> (not res!756121) (not e!644222))))

(assert (= (and d!131355 c!110293) b!1131991))

(assert (= (and d!131355 (not c!110293)) b!1131994))

(assert (= (and b!1131994 c!110290) b!1131996))

(assert (= (and b!1131994 (not c!110290)) b!1131989))

(assert (= (or b!1131996 b!1131989) bm!48767))

(assert (= (and d!131355 res!756122) b!1131995))

(assert (= (and b!1131995 res!756120) b!1131992))

(assert (= (and b!1131992 res!756123) b!1131990))

(assert (= (and b!1131992 c!110292) b!1131997))

(assert (= (and b!1131992 (not c!110292)) b!1131987))

(assert (= (and b!1131997 res!756121) b!1131986))

(assert (= (and b!1131987 c!110291) b!1131988))

(assert (= (and b!1131987 (not c!110291)) b!1131993))

(declare-fun b_lambda!18957 () Bool)

(assert (=> (not b_lambda!18957) (not b!1131986)))

(assert (=> b!1131986 t!35705))

(declare-fun b_and!38687 () Bool)

(assert (= b_and!38685 (and (=> t!35705 result!18059) b_and!38687)))

(declare-fun b_lambda!18959 () Bool)

(assert (=> (not b_lambda!18959) (not b!1131996)))

(assert (=> b!1131996 t!35705))

(declare-fun b_and!38689 () Bool)

(assert (= b_and!38687 (and (=> t!35705 result!18059) b_and!38689)))

(declare-fun m!1044943 () Bool)

(assert (=> b!1131988 m!1044943))

(declare-fun m!1044945 () Bool)

(assert (=> b!1131995 m!1044945))

(assert (=> bm!48767 m!1044943))

(declare-fun m!1044947 () Bool)

(assert (=> b!1131986 m!1044947))

(assert (=> b!1131986 m!1044947))

(assert (=> b!1131986 m!1044589))

(declare-fun m!1044949 () Bool)

(assert (=> b!1131986 m!1044949))

(assert (=> b!1131986 m!1044589))

(declare-fun m!1044951 () Bool)

(assert (=> b!1131986 m!1044951))

(assert (=> b!1131986 m!1044951))

(declare-fun m!1044953 () Bool)

(assert (=> b!1131986 m!1044953))

(declare-fun m!1044955 () Bool)

(assert (=> d!131355 m!1044955))

(assert (=> d!131355 m!1044583))

(assert (=> b!1131990 m!1044951))

(assert (=> b!1131990 m!1044951))

(declare-fun m!1044957 () Bool)

(assert (=> b!1131990 m!1044957))

(declare-fun m!1044959 () Bool)

(assert (=> b!1131993 m!1044959))

(assert (=> b!1131994 m!1044951))

(assert (=> b!1131994 m!1044951))

(assert (=> b!1131994 m!1044957))

(assert (=> b!1131997 m!1044951))

(assert (=> b!1131997 m!1044951))

(declare-fun m!1044961 () Bool)

(assert (=> b!1131997 m!1044961))

(assert (=> b!1131996 m!1044947))

(assert (=> b!1131996 m!1044947))

(assert (=> b!1131996 m!1044589))

(assert (=> b!1131996 m!1044949))

(declare-fun m!1044963 () Bool)

(assert (=> b!1131996 m!1044963))

(declare-fun m!1044965 () Bool)

(assert (=> b!1131996 m!1044965))

(assert (=> b!1131996 m!1044589))

(declare-fun m!1044967 () Bool)

(assert (=> b!1131996 m!1044967))

(assert (=> b!1131996 m!1044951))

(assert (=> b!1131996 m!1044963))

(declare-fun m!1044969 () Bool)

(assert (=> b!1131996 m!1044969))

(assert (=> b!1131933 d!131355))

(declare-fun d!131357 () Bool)

(assert (=> d!131357 (= (validKeyInArray!0 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131917 d!131357))

(declare-fun lt!502872 () Bool)

(declare-fun d!131359 () Bool)

(declare-fun content!540 (List!24778) (InoxSet tuple2!18014))

(assert (=> d!131359 (= lt!502872 (select (content!540 (toList!8007 lt!502751)) (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!644231 () Bool)

(assert (=> d!131359 (= lt!502872 e!644231)))

(declare-fun res!756128 () Bool)

(assert (=> d!131359 (=> (not res!756128) (not e!644231))))

(assert (=> d!131359 (= res!756128 ((_ is Cons!24774) (toList!8007 lt!502751)))))

(assert (=> d!131359 (= (contains!6531 (toList!8007 lt!502751) (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!502872)))

(declare-fun b!1132002 () Bool)

(declare-fun e!644232 () Bool)

(assert (=> b!1132002 (= e!644231 e!644232)))

(declare-fun res!756129 () Bool)

(assert (=> b!1132002 (=> res!756129 e!644232)))

(assert (=> b!1132002 (= res!756129 (= (h!25983 (toList!8007 lt!502751)) (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132003 () Bool)

(assert (=> b!1132003 (= e!644232 (contains!6531 (t!35707 (toList!8007 lt!502751)) (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131359 res!756128) b!1132002))

(assert (= (and b!1132002 (not res!756129)) b!1132003))

(declare-fun m!1044971 () Bool)

(assert (=> d!131359 m!1044971))

(declare-fun m!1044973 () Bool)

(assert (=> d!131359 m!1044973))

(declare-fun m!1044975 () Bool)

(assert (=> b!1132003 m!1044975))

(assert (=> b!1131807 d!131359))

(declare-fun b!1132004 () Bool)

(assert (=> b!1132004 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(assert (=> b!1132004 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36084 _values!996)))))

(declare-fun lt!502877 () ListLongMap!15983)

(declare-fun e!644235 () Bool)

(assert (=> b!1132004 (= e!644235 (= (apply!955 lt!502877 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132005 () Bool)

(declare-fun e!644239 () Bool)

(declare-fun e!644237 () Bool)

(assert (=> b!1132005 (= e!644239 e!644237)))

(declare-fun c!110295 () Bool)

(assert (=> b!1132005 (= c!110295 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun bm!48768 () Bool)

(declare-fun call!48771 () ListLongMap!15983)

(assert (=> bm!48768 (= call!48771 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131361 () Bool)

(declare-fun e!644233 () Bool)

(assert (=> d!131361 e!644233))

(declare-fun res!756132 () Bool)

(assert (=> d!131361 (=> (not res!756132) (not e!644233))))

(assert (=> d!131361 (= res!756132 (not (contains!6529 lt!502877 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644238 () ListLongMap!15983)

(assert (=> d!131361 (= lt!502877 e!644238)))

(declare-fun c!110297 () Bool)

(assert (=> d!131361 (= c!110297 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(assert (=> d!131361 (validMask!0 mask!1564)))

(assert (=> d!131361 (= (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502877)))

(declare-fun b!1132006 () Bool)

(assert (=> b!1132006 (= e!644237 (= lt!502877 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132007 () Bool)

(declare-fun e!644234 () ListLongMap!15983)

(assert (=> b!1132007 (= e!644234 call!48771)))

(declare-fun b!1132008 () Bool)

(declare-fun e!644236 () Bool)

(assert (=> b!1132008 (= e!644236 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132008 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1132009 () Bool)

(assert (=> b!1132009 (= e!644238 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1132010 () Bool)

(assert (=> b!1132010 (= e!644233 e!644239)))

(declare-fun c!110296 () Bool)

(assert (=> b!1132010 (= c!110296 e!644236)))

(declare-fun res!756133 () Bool)

(assert (=> b!1132010 (=> (not res!756133) (not e!644236))))

(assert (=> b!1132010 (= res!756133 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun b!1132011 () Bool)

(assert (=> b!1132011 (= e!644237 (isEmpty!973 lt!502877))))

(declare-fun b!1132012 () Bool)

(assert (=> b!1132012 (= e!644238 e!644234)))

(declare-fun c!110294 () Bool)

(assert (=> b!1132012 (= c!110294 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1132013 () Bool)

(declare-fun res!756130 () Bool)

(assert (=> b!1132013 (=> (not res!756130) (not e!644233))))

(assert (=> b!1132013 (= res!756130 (not (contains!6529 lt!502877 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132014 () Bool)

(declare-fun lt!502873 () Unit!37073)

(declare-fun lt!502879 () Unit!37073)

(assert (=> b!1132014 (= lt!502873 lt!502879)))

(declare-fun lt!502874 () (_ BitVec 64))

(declare-fun lt!502876 () ListLongMap!15983)

(declare-fun lt!502878 () V!43083)

(declare-fun lt!502875 () (_ BitVec 64))

(assert (=> b!1132014 (not (contains!6529 (+!3451 lt!502876 (tuple2!18015 lt!502875 lt!502878)) lt!502874))))

(assert (=> b!1132014 (= lt!502879 (addStillNotContains!283 lt!502876 lt!502875 lt!502878 lt!502874))))

(assert (=> b!1132014 (= lt!502874 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132014 (= lt!502878 (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132014 (= lt!502875 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1132014 (= lt!502876 call!48771)))

(assert (=> b!1132014 (= e!644234 (+!3451 call!48771 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132015 () Bool)

(assert (=> b!1132015 (= e!644239 e!644235)))

(assert (=> b!1132015 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun res!756131 () Bool)

(assert (=> b!1132015 (= res!756131 (contains!6529 lt!502877 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132015 (=> (not res!756131) (not e!644235))))

(assert (= (and d!131361 c!110297) b!1132009))

(assert (= (and d!131361 (not c!110297)) b!1132012))

(assert (= (and b!1132012 c!110294) b!1132014))

(assert (= (and b!1132012 (not c!110294)) b!1132007))

(assert (= (or b!1132014 b!1132007) bm!48768))

(assert (= (and d!131361 res!756132) b!1132013))

(assert (= (and b!1132013 res!756130) b!1132010))

(assert (= (and b!1132010 res!756133) b!1132008))

(assert (= (and b!1132010 c!110296) b!1132015))

(assert (= (and b!1132010 (not c!110296)) b!1132005))

(assert (= (and b!1132015 res!756131) b!1132004))

(assert (= (and b!1132005 c!110295) b!1132006))

(assert (= (and b!1132005 (not c!110295)) b!1132011))

(declare-fun b_lambda!18961 () Bool)

(assert (=> (not b_lambda!18961) (not b!1132004)))

(assert (=> b!1132004 t!35705))

(declare-fun b_and!38691 () Bool)

(assert (= b_and!38689 (and (=> t!35705 result!18059) b_and!38691)))

(declare-fun b_lambda!18963 () Bool)

(assert (=> (not b_lambda!18963) (not b!1132014)))

(assert (=> b!1132014 t!35705))

(declare-fun b_and!38693 () Bool)

(assert (= b_and!38691 (and (=> t!35705 result!18059) b_and!38693)))

(declare-fun m!1044977 () Bool)

(assert (=> b!1132006 m!1044977))

(declare-fun m!1044979 () Bool)

(assert (=> b!1132013 m!1044979))

(assert (=> bm!48768 m!1044977))

(declare-fun m!1044981 () Bool)

(assert (=> b!1132004 m!1044981))

(assert (=> b!1132004 m!1044981))

(assert (=> b!1132004 m!1044589))

(declare-fun m!1044983 () Bool)

(assert (=> b!1132004 m!1044983))

(assert (=> b!1132004 m!1044589))

(declare-fun m!1044985 () Bool)

(assert (=> b!1132004 m!1044985))

(assert (=> b!1132004 m!1044985))

(declare-fun m!1044987 () Bool)

(assert (=> b!1132004 m!1044987))

(declare-fun m!1044989 () Bool)

(assert (=> d!131361 m!1044989))

(assert (=> d!131361 m!1044583))

(assert (=> b!1132008 m!1044985))

(assert (=> b!1132008 m!1044985))

(declare-fun m!1044991 () Bool)

(assert (=> b!1132008 m!1044991))

(declare-fun m!1044993 () Bool)

(assert (=> b!1132011 m!1044993))

(assert (=> b!1132012 m!1044985))

(assert (=> b!1132012 m!1044985))

(assert (=> b!1132012 m!1044991))

(assert (=> b!1132015 m!1044985))

(assert (=> b!1132015 m!1044985))

(declare-fun m!1044995 () Bool)

(assert (=> b!1132015 m!1044995))

(assert (=> b!1132014 m!1044981))

(assert (=> b!1132014 m!1044981))

(assert (=> b!1132014 m!1044589))

(assert (=> b!1132014 m!1044983))

(declare-fun m!1044997 () Bool)

(assert (=> b!1132014 m!1044997))

(declare-fun m!1044999 () Bool)

(assert (=> b!1132014 m!1044999))

(assert (=> b!1132014 m!1044589))

(declare-fun m!1045001 () Bool)

(assert (=> b!1132014 m!1045001))

(assert (=> b!1132014 m!1044985))

(assert (=> b!1132014 m!1044997))

(declare-fun m!1045003 () Bool)

(assert (=> b!1132014 m!1045003))

(assert (=> bm!48748 d!131361))

(declare-fun d!131363 () Bool)

(assert (=> d!131363 (= (validKeyInArray!0 (select (arr!35549 lt!502695) #b00000000000000000000000000000000)) (and (not (= (select (arr!35549 lt!502695) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35549 lt!502695) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131964 d!131363))

(declare-fun d!131365 () Bool)

(declare-fun e!644240 () Bool)

(assert (=> d!131365 e!644240))

(declare-fun res!756135 () Bool)

(assert (=> d!131365 (=> (not res!756135) (not e!644240))))

(declare-fun lt!502880 () ListLongMap!15983)

(assert (=> d!131365 (= res!756135 (contains!6529 lt!502880 (_1!9018 (tuple2!18015 lt!502841 lt!502844))))))

(declare-fun lt!502881 () List!24778)

(assert (=> d!131365 (= lt!502880 (ListLongMap!15984 lt!502881))))

(declare-fun lt!502882 () Unit!37073)

(declare-fun lt!502883 () Unit!37073)

(assert (=> d!131365 (= lt!502882 lt!502883)))

(assert (=> d!131365 (= (getValueByKey!628 lt!502881 (_1!9018 (tuple2!18015 lt!502841 lt!502844))) (Some!678 (_2!9018 (tuple2!18015 lt!502841 lt!502844))))))

(assert (=> d!131365 (= lt!502883 (lemmaContainsTupThenGetReturnValue!305 lt!502881 (_1!9018 (tuple2!18015 lt!502841 lt!502844)) (_2!9018 (tuple2!18015 lt!502841 lt!502844))))))

(assert (=> d!131365 (= lt!502881 (insertStrictlySorted!398 (toList!8007 lt!502842) (_1!9018 (tuple2!18015 lt!502841 lt!502844)) (_2!9018 (tuple2!18015 lt!502841 lt!502844))))))

(assert (=> d!131365 (= (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844)) lt!502880)))

(declare-fun b!1132016 () Bool)

(declare-fun res!756134 () Bool)

(assert (=> b!1132016 (=> (not res!756134) (not e!644240))))

(assert (=> b!1132016 (= res!756134 (= (getValueByKey!628 (toList!8007 lt!502880) (_1!9018 (tuple2!18015 lt!502841 lt!502844))) (Some!678 (_2!9018 (tuple2!18015 lt!502841 lt!502844)))))))

(declare-fun b!1132017 () Bool)

(assert (=> b!1132017 (= e!644240 (contains!6531 (toList!8007 lt!502880) (tuple2!18015 lt!502841 lt!502844)))))

(assert (= (and d!131365 res!756135) b!1132016))

(assert (= (and b!1132016 res!756134) b!1132017))

(declare-fun m!1045005 () Bool)

(assert (=> d!131365 m!1045005))

(declare-fun m!1045007 () Bool)

(assert (=> d!131365 m!1045007))

(declare-fun m!1045009 () Bool)

(assert (=> d!131365 m!1045009))

(declare-fun m!1045011 () Bool)

(assert (=> d!131365 m!1045011))

(declare-fun m!1045013 () Bool)

(assert (=> b!1132016 m!1045013))

(declare-fun m!1045015 () Bool)

(assert (=> b!1132017 m!1045015))

(assert (=> b!1131941 d!131365))

(declare-fun d!131367 () Bool)

(declare-fun e!644242 () Bool)

(assert (=> d!131367 e!644242))

(declare-fun res!756136 () Bool)

(assert (=> d!131367 (=> res!756136 e!644242)))

(declare-fun lt!502885 () Bool)

(assert (=> d!131367 (= res!756136 (not lt!502885))))

(declare-fun lt!502887 () Bool)

(assert (=> d!131367 (= lt!502885 lt!502887)))

(declare-fun lt!502886 () Unit!37073)

(declare-fun e!644241 () Unit!37073)

(assert (=> d!131367 (= lt!502886 e!644241)))

(declare-fun c!110298 () Bool)

(assert (=> d!131367 (= c!110298 lt!502887)))

(assert (=> d!131367 (= lt!502887 (containsKey!585 (toList!8007 (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844))) lt!502840))))

(assert (=> d!131367 (= (contains!6529 (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844)) lt!502840) lt!502885)))

(declare-fun b!1132018 () Bool)

(declare-fun lt!502884 () Unit!37073)

(assert (=> b!1132018 (= e!644241 lt!502884)))

(assert (=> b!1132018 (= lt!502884 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844))) lt!502840))))

(assert (=> b!1132018 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844))) lt!502840))))

(declare-fun b!1132019 () Bool)

(declare-fun Unit!37083 () Unit!37073)

(assert (=> b!1132019 (= e!644241 Unit!37083)))

(declare-fun b!1132020 () Bool)

(assert (=> b!1132020 (= e!644242 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844))) lt!502840)))))

(assert (= (and d!131367 c!110298) b!1132018))

(assert (= (and d!131367 (not c!110298)) b!1132019))

(assert (= (and d!131367 (not res!756136)) b!1132020))

(declare-fun m!1045017 () Bool)

(assert (=> d!131367 m!1045017))

(declare-fun m!1045019 () Bool)

(assert (=> b!1132018 m!1045019))

(declare-fun m!1045021 () Bool)

(assert (=> b!1132018 m!1045021))

(assert (=> b!1132018 m!1045021))

(declare-fun m!1045023 () Bool)

(assert (=> b!1132018 m!1045023))

(assert (=> b!1132020 m!1045021))

(assert (=> b!1132020 m!1045021))

(assert (=> b!1132020 m!1045023))

(assert (=> b!1131941 d!131367))

(declare-fun d!131369 () Bool)

(declare-fun e!644243 () Bool)

(assert (=> d!131369 e!644243))

(declare-fun res!756138 () Bool)

(assert (=> d!131369 (=> (not res!756138) (not e!644243))))

(declare-fun lt!502888 () ListLongMap!15983)

(assert (=> d!131369 (= res!756138 (contains!6529 lt!502888 (_1!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502889 () List!24778)

(assert (=> d!131369 (= lt!502888 (ListLongMap!15984 lt!502889))))

(declare-fun lt!502890 () Unit!37073)

(declare-fun lt!502891 () Unit!37073)

(assert (=> d!131369 (= lt!502890 lt!502891)))

(assert (=> d!131369 (= (getValueByKey!628 lt!502889 (_1!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131369 (= lt!502891 (lemmaContainsTupThenGetReturnValue!305 lt!502889 (_1!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131369 (= lt!502889 (insertStrictlySorted!398 (toList!8007 call!48761) (_1!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131369 (= (+!3451 call!48761 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502888)))

(declare-fun b!1132021 () Bool)

(declare-fun res!756137 () Bool)

(assert (=> b!1132021 (=> (not res!756137) (not e!644243))))

(assert (=> b!1132021 (= res!756137 (= (getValueByKey!628 (toList!8007 lt!502888) (_1!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1132022 () Bool)

(assert (=> b!1132022 (= e!644243 (contains!6531 (toList!8007 lt!502888) (tuple2!18015 (select (arr!35549 lt!502695) from!1455) (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131369 res!756138) b!1132021))

(assert (= (and b!1132021 res!756137) b!1132022))

(declare-fun m!1045025 () Bool)

(assert (=> d!131369 m!1045025))

(declare-fun m!1045027 () Bool)

(assert (=> d!131369 m!1045027))

(declare-fun m!1045029 () Bool)

(assert (=> d!131369 m!1045029))

(declare-fun m!1045031 () Bool)

(assert (=> d!131369 m!1045031))

(declare-fun m!1045033 () Bool)

(assert (=> b!1132021 m!1045033))

(declare-fun m!1045035 () Bool)

(assert (=> b!1132022 m!1045035))

(assert (=> b!1131941 d!131369))

(declare-fun d!131371 () Bool)

(assert (=> d!131371 (not (contains!6529 (+!3451 lt!502842 (tuple2!18015 lt!502841 lt!502844)) lt!502840))))

(declare-fun lt!502894 () Unit!37073)

(declare-fun choose!1777 (ListLongMap!15983 (_ BitVec 64) V!43083 (_ BitVec 64)) Unit!37073)

(assert (=> d!131371 (= lt!502894 (choose!1777 lt!502842 lt!502841 lt!502844 lt!502840))))

(declare-fun e!644246 () Bool)

(assert (=> d!131371 e!644246))

(declare-fun res!756141 () Bool)

(assert (=> d!131371 (=> (not res!756141) (not e!644246))))

(assert (=> d!131371 (= res!756141 (not (contains!6529 lt!502842 lt!502840)))))

(assert (=> d!131371 (= (addStillNotContains!283 lt!502842 lt!502841 lt!502844 lt!502840) lt!502894)))

(declare-fun b!1132026 () Bool)

(assert (=> b!1132026 (= e!644246 (not (= lt!502841 lt!502840)))))

(assert (= (and d!131371 res!756141) b!1132026))

(assert (=> d!131371 m!1044883))

(assert (=> d!131371 m!1044883))

(assert (=> d!131371 m!1044885))

(declare-fun m!1045037 () Bool)

(assert (=> d!131371 m!1045037))

(declare-fun m!1045039 () Bool)

(assert (=> d!131371 m!1045039))

(assert (=> b!1131941 d!131371))

(declare-fun d!131373 () Bool)

(declare-fun c!110301 () Bool)

(assert (=> d!131373 (= c!110301 ((_ is ValueCellFull!13524) (select (arr!35548 lt!502685) from!1455)))))

(declare-fun e!644249 () V!43083)

(assert (=> d!131373 (= (get!18073 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644249)))

(declare-fun b!1132031 () Bool)

(declare-fun get!18074 (ValueCell!13524 V!43083) V!43083)

(assert (=> b!1132031 (= e!644249 (get!18074 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132032 () Bool)

(declare-fun get!18075 (ValueCell!13524 V!43083) V!43083)

(assert (=> b!1132032 (= e!644249 (get!18075 (select (arr!35548 lt!502685) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131373 c!110301) b!1132031))

(assert (= (and d!131373 (not c!110301)) b!1132032))

(assert (=> b!1132031 m!1044867))

(assert (=> b!1132031 m!1044589))

(declare-fun m!1045041 () Bool)

(assert (=> b!1132031 m!1045041))

(assert (=> b!1132032 m!1044867))

(assert (=> b!1132032 m!1044589))

(declare-fun m!1045043 () Bool)

(assert (=> b!1132032 m!1045043))

(assert (=> b!1131941 d!131373))

(declare-fun d!131375 () Bool)

(declare-fun lt!502895 () Bool)

(assert (=> d!131375 (= lt!502895 (select (content!539 Nil!24774) (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!644251 () Bool)

(assert (=> d!131375 (= lt!502895 e!644251)))

(declare-fun res!756143 () Bool)

(assert (=> d!131375 (=> (not res!756143) (not e!644251))))

(assert (=> d!131375 (= res!756143 ((_ is Cons!24773) Nil!24774))))

(assert (=> d!131375 (= (contains!6532 Nil!24774 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)) lt!502895)))

(declare-fun b!1132033 () Bool)

(declare-fun e!644250 () Bool)

(assert (=> b!1132033 (= e!644251 e!644250)))

(declare-fun res!756142 () Bool)

(assert (=> b!1132033 (=> res!756142 e!644250)))

(assert (=> b!1132033 (= res!756142 (= (h!25982 Nil!24774) (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1132034 () Bool)

(assert (=> b!1132034 (= e!644250 (contains!6532 (t!35706 Nil!24774) (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131375 res!756143) b!1132033))

(assert (= (and b!1132033 (not res!756142)) b!1132034))

(assert (=> d!131375 m!1044937))

(assert (=> d!131375 m!1044693))

(declare-fun m!1045045 () Bool)

(assert (=> d!131375 m!1045045))

(assert (=> b!1132034 m!1044693))

(declare-fun m!1045047 () Bool)

(assert (=> b!1132034 m!1045047))

(assert (=> b!1131893 d!131375))

(declare-fun d!131377 () Bool)

(declare-fun res!756145 () Bool)

(declare-fun e!644254 () Bool)

(assert (=> d!131377 (=> res!756145 e!644254)))

(assert (=> d!131377 (= res!756145 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(assert (=> d!131377 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!644254)))

(declare-fun bm!48769 () Bool)

(declare-fun call!48772 () Bool)

(assert (=> bm!48769 (= call!48772 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1132035 () Bool)

(declare-fun e!644252 () Bool)

(declare-fun e!644253 () Bool)

(assert (=> b!1132035 (= e!644252 e!644253)))

(declare-fun lt!502896 () (_ BitVec 64))

(assert (=> b!1132035 (= lt!502896 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!502897 () Unit!37073)

(assert (=> b!1132035 (= lt!502897 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!502896 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1132035 (arrayContainsKey!0 _keys!1208 lt!502896 #b00000000000000000000000000000000)))

(declare-fun lt!502898 () Unit!37073)

(assert (=> b!1132035 (= lt!502898 lt!502897)))

(declare-fun res!756144 () Bool)

(assert (=> b!1132035 (= res!756144 (= (seekEntryOrOpen!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9925 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1132035 (=> (not res!756144) (not e!644253))))

(declare-fun b!1132036 () Bool)

(assert (=> b!1132036 (= e!644253 call!48772)))

(declare-fun b!1132037 () Bool)

(assert (=> b!1132037 (= e!644252 call!48772)))

(declare-fun b!1132038 () Bool)

(assert (=> b!1132038 (= e!644254 e!644252)))

(declare-fun c!110302 () Bool)

(assert (=> b!1132038 (= c!110302 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!131377 (not res!756145)) b!1132038))

(assert (= (and b!1132038 c!110302) b!1132035))

(assert (= (and b!1132038 (not c!110302)) b!1132037))

(assert (= (and b!1132035 res!756144) b!1132036))

(assert (= (or b!1132036 b!1132037) bm!48769))

(declare-fun m!1045049 () Bool)

(assert (=> bm!48769 m!1045049))

(declare-fun m!1045051 () Bool)

(assert (=> b!1132035 m!1045051))

(declare-fun m!1045053 () Bool)

(assert (=> b!1132035 m!1045053))

(declare-fun m!1045055 () Bool)

(assert (=> b!1132035 m!1045055))

(assert (=> b!1132035 m!1045051))

(declare-fun m!1045057 () Bool)

(assert (=> b!1132035 m!1045057))

(assert (=> b!1132038 m!1045051))

(assert (=> b!1132038 m!1045051))

(declare-fun m!1045059 () Bool)

(assert (=> b!1132038 m!1045059))

(assert (=> bm!48751 d!131377))

(declare-fun d!131379 () Bool)

(declare-fun e!644256 () Bool)

(assert (=> d!131379 e!644256))

(declare-fun res!756146 () Bool)

(assert (=> d!131379 (=> res!756146 e!644256)))

(declare-fun lt!502900 () Bool)

(assert (=> d!131379 (= res!756146 (not lt!502900))))

(declare-fun lt!502902 () Bool)

(assert (=> d!131379 (= lt!502900 lt!502902)))

(declare-fun lt!502901 () Unit!37073)

(declare-fun e!644255 () Unit!37073)

(assert (=> d!131379 (= lt!502901 e!644255)))

(declare-fun c!110303 () Bool)

(assert (=> d!131379 (= c!110303 lt!502902)))

(assert (=> d!131379 (= lt!502902 (containsKey!585 (toList!8007 lt!502799) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131379 (= (contains!6529 lt!502799 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502900)))

(declare-fun b!1132039 () Bool)

(declare-fun lt!502899 () Unit!37073)

(assert (=> b!1132039 (= e!644255 lt!502899)))

(assert (=> b!1132039 (= lt!502899 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502799) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132039 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502799) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132040 () Bool)

(declare-fun Unit!37084 () Unit!37073)

(assert (=> b!1132040 (= e!644255 Unit!37084)))

(declare-fun b!1132041 () Bool)

(assert (=> b!1132041 (= e!644256 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131379 c!110303) b!1132039))

(assert (= (and d!131379 (not c!110303)) b!1132040))

(assert (= (and d!131379 (not res!756146)) b!1132041))

(declare-fun m!1045061 () Bool)

(assert (=> d!131379 m!1045061))

(declare-fun m!1045063 () Bool)

(assert (=> b!1132039 m!1045063))

(declare-fun m!1045065 () Bool)

(assert (=> b!1132039 m!1045065))

(assert (=> b!1132039 m!1045065))

(declare-fun m!1045067 () Bool)

(assert (=> b!1132039 m!1045067))

(assert (=> b!1132041 m!1045065))

(assert (=> b!1132041 m!1045065))

(assert (=> b!1132041 m!1045067))

(assert (=> b!1131862 d!131379))

(declare-fun d!131381 () Bool)

(declare-fun get!18076 (Option!679) V!43083)

(assert (=> d!131381 (= (apply!955 lt!502850 (select (arr!35549 _keys!1208) from!1455)) (get!18076 (getValueByKey!628 (toList!8007 lt!502850) (select (arr!35549 _keys!1208) from!1455))))))

(declare-fun bs!32961 () Bool)

(assert (= bs!32961 d!131381))

(assert (=> bs!32961 m!1044563))

(declare-fun m!1045069 () Bool)

(assert (=> bs!32961 m!1045069))

(assert (=> bs!32961 m!1045069))

(declare-fun m!1045071 () Bool)

(assert (=> bs!32961 m!1045071))

(assert (=> b!1131943 d!131381))

(declare-fun d!131383 () Bool)

(declare-fun c!110304 () Bool)

(assert (=> d!131383 (= c!110304 ((_ is ValueCellFull!13524) (select (arr!35548 _values!996) from!1455)))))

(declare-fun e!644257 () V!43083)

(assert (=> d!131383 (= (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644257)))

(declare-fun b!1132042 () Bool)

(assert (=> b!1132042 (= e!644257 (get!18074 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132043 () Bool)

(assert (=> b!1132043 (= e!644257 (get!18075 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131383 c!110304) b!1132042))

(assert (= (and d!131383 (not c!110304)) b!1132043))

(assert (=> b!1132042 m!1044895))

(assert (=> b!1132042 m!1044589))

(declare-fun m!1045073 () Bool)

(assert (=> b!1132042 m!1045073))

(assert (=> b!1132043 m!1044895))

(assert (=> b!1132043 m!1044589))

(declare-fun m!1045075 () Bool)

(assert (=> b!1132043 m!1045075))

(assert (=> b!1131943 d!131383))

(assert (=> b!1131939 d!131353))

(declare-fun d!131385 () Bool)

(declare-fun isEmpty!974 (List!24778) Bool)

(assert (=> d!131385 (= (isEmpty!973 lt!502799) (isEmpty!974 (toList!8007 lt!502799)))))

(declare-fun bs!32962 () Bool)

(assert (= bs!32962 d!131385))

(declare-fun m!1045077 () Bool)

(assert (=> bs!32962 m!1045077))

(assert (=> b!1131860 d!131385))

(declare-fun d!131387 () Bool)

(declare-fun e!644259 () Bool)

(assert (=> d!131387 e!644259))

(declare-fun res!756147 () Bool)

(assert (=> d!131387 (=> res!756147 e!644259)))

(declare-fun lt!502904 () Bool)

(assert (=> d!131387 (= res!756147 (not lt!502904))))

(declare-fun lt!502906 () Bool)

(assert (=> d!131387 (= lt!502904 lt!502906)))

(declare-fun lt!502905 () Unit!37073)

(declare-fun e!644258 () Unit!37073)

(assert (=> d!131387 (= lt!502905 e!644258)))

(declare-fun c!110305 () Bool)

(assert (=> d!131387 (= c!110305 lt!502906)))

(assert (=> d!131387 (= lt!502906 (containsKey!585 (toList!8007 (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834))) lt!502830))))

(assert (=> d!131387 (= (contains!6529 (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834)) lt!502830) lt!502904)))

(declare-fun b!1132044 () Bool)

(declare-fun lt!502903 () Unit!37073)

(assert (=> b!1132044 (= e!644258 lt!502903)))

(assert (=> b!1132044 (= lt!502903 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834))) lt!502830))))

(assert (=> b!1132044 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834))) lt!502830))))

(declare-fun b!1132045 () Bool)

(declare-fun Unit!37085 () Unit!37073)

(assert (=> b!1132045 (= e!644258 Unit!37085)))

(declare-fun b!1132046 () Bool)

(assert (=> b!1132046 (= e!644259 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834))) lt!502830)))))

(assert (= (and d!131387 c!110305) b!1132044))

(assert (= (and d!131387 (not c!110305)) b!1132045))

(assert (= (and d!131387 (not res!756147)) b!1132046))

(declare-fun m!1045079 () Bool)

(assert (=> d!131387 m!1045079))

(declare-fun m!1045081 () Bool)

(assert (=> b!1132044 m!1045081))

(declare-fun m!1045083 () Bool)

(assert (=> b!1132044 m!1045083))

(assert (=> b!1132044 m!1045083))

(declare-fun m!1045085 () Bool)

(assert (=> b!1132044 m!1045085))

(assert (=> b!1132046 m!1045083))

(assert (=> b!1132046 m!1045083))

(assert (=> b!1132046 m!1045085))

(assert (=> b!1131923 d!131387))

(declare-fun c!110306 () Bool)

(declare-fun d!131389 () Bool)

(assert (=> d!131389 (= c!110306 ((_ is ValueCellFull!13524) (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!644260 () V!43083)

(assert (=> d!131389 (= (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644260)))

(declare-fun b!1132047 () Bool)

(assert (=> b!1132047 (= e!644260 (get!18074 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132048 () Bool)

(assert (=> b!1132048 (= e!644260 (get!18075 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131389 c!110306) b!1132047))

(assert (= (and d!131389 (not c!110306)) b!1132048))

(assert (=> b!1132047 m!1044837))

(assert (=> b!1132047 m!1044589))

(declare-fun m!1045087 () Bool)

(assert (=> b!1132047 m!1045087))

(assert (=> b!1132048 m!1044837))

(assert (=> b!1132048 m!1044589))

(declare-fun m!1045089 () Bool)

(assert (=> b!1132048 m!1045089))

(assert (=> b!1131923 d!131389))

(declare-fun d!131391 () Bool)

(assert (=> d!131391 (not (contains!6529 (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834)) lt!502830))))

(declare-fun lt!502907 () Unit!37073)

(assert (=> d!131391 (= lt!502907 (choose!1777 lt!502832 lt!502831 lt!502834 lt!502830))))

(declare-fun e!644261 () Bool)

(assert (=> d!131391 e!644261))

(declare-fun res!756148 () Bool)

(assert (=> d!131391 (=> (not res!756148) (not e!644261))))

(assert (=> d!131391 (= res!756148 (not (contains!6529 lt!502832 lt!502830)))))

(assert (=> d!131391 (= (addStillNotContains!283 lt!502832 lt!502831 lt!502834 lt!502830) lt!502907)))

(declare-fun b!1132049 () Bool)

(assert (=> b!1132049 (= e!644261 (not (= lt!502831 lt!502830)))))

(assert (= (and d!131391 res!756148) b!1132049))

(assert (=> d!131391 m!1044853))

(assert (=> d!131391 m!1044853))

(assert (=> d!131391 m!1044855))

(declare-fun m!1045091 () Bool)

(assert (=> d!131391 m!1045091))

(declare-fun m!1045093 () Bool)

(assert (=> d!131391 m!1045093))

(assert (=> b!1131923 d!131391))

(declare-fun d!131393 () Bool)

(declare-fun e!644262 () Bool)

(assert (=> d!131393 e!644262))

(declare-fun res!756150 () Bool)

(assert (=> d!131393 (=> (not res!756150) (not e!644262))))

(declare-fun lt!502908 () ListLongMap!15983)

(assert (=> d!131393 (= res!756150 (contains!6529 lt!502908 (_1!9018 (tuple2!18015 lt!502831 lt!502834))))))

(declare-fun lt!502909 () List!24778)

(assert (=> d!131393 (= lt!502908 (ListLongMap!15984 lt!502909))))

(declare-fun lt!502910 () Unit!37073)

(declare-fun lt!502911 () Unit!37073)

(assert (=> d!131393 (= lt!502910 lt!502911)))

(assert (=> d!131393 (= (getValueByKey!628 lt!502909 (_1!9018 (tuple2!18015 lt!502831 lt!502834))) (Some!678 (_2!9018 (tuple2!18015 lt!502831 lt!502834))))))

(assert (=> d!131393 (= lt!502911 (lemmaContainsTupThenGetReturnValue!305 lt!502909 (_1!9018 (tuple2!18015 lt!502831 lt!502834)) (_2!9018 (tuple2!18015 lt!502831 lt!502834))))))

(assert (=> d!131393 (= lt!502909 (insertStrictlySorted!398 (toList!8007 lt!502832) (_1!9018 (tuple2!18015 lt!502831 lt!502834)) (_2!9018 (tuple2!18015 lt!502831 lt!502834))))))

(assert (=> d!131393 (= (+!3451 lt!502832 (tuple2!18015 lt!502831 lt!502834)) lt!502908)))

(declare-fun b!1132050 () Bool)

(declare-fun res!756149 () Bool)

(assert (=> b!1132050 (=> (not res!756149) (not e!644262))))

(assert (=> b!1132050 (= res!756149 (= (getValueByKey!628 (toList!8007 lt!502908) (_1!9018 (tuple2!18015 lt!502831 lt!502834))) (Some!678 (_2!9018 (tuple2!18015 lt!502831 lt!502834)))))))

(declare-fun b!1132051 () Bool)

(assert (=> b!1132051 (= e!644262 (contains!6531 (toList!8007 lt!502908) (tuple2!18015 lt!502831 lt!502834)))))

(assert (= (and d!131393 res!756150) b!1132050))

(assert (= (and b!1132050 res!756149) b!1132051))

(declare-fun m!1045095 () Bool)

(assert (=> d!131393 m!1045095))

(declare-fun m!1045097 () Bool)

(assert (=> d!131393 m!1045097))

(declare-fun m!1045099 () Bool)

(assert (=> d!131393 m!1045099))

(declare-fun m!1045101 () Bool)

(assert (=> d!131393 m!1045101))

(declare-fun m!1045103 () Bool)

(assert (=> b!1132050 m!1045103))

(declare-fun m!1045105 () Bool)

(assert (=> b!1132051 m!1045105))

(assert (=> b!1131923 d!131393))

(declare-fun d!131395 () Bool)

(declare-fun e!644263 () Bool)

(assert (=> d!131395 e!644263))

(declare-fun res!756152 () Bool)

(assert (=> d!131395 (=> (not res!756152) (not e!644263))))

(declare-fun lt!502912 () ListLongMap!15983)

(assert (=> d!131395 (= res!756152 (contains!6529 lt!502912 (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502913 () List!24778)

(assert (=> d!131395 (= lt!502912 (ListLongMap!15984 lt!502913))))

(declare-fun lt!502914 () Unit!37073)

(declare-fun lt!502915 () Unit!37073)

(assert (=> d!131395 (= lt!502914 lt!502915)))

(assert (=> d!131395 (= (getValueByKey!628 lt!502913 (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131395 (= lt!502915 (lemmaContainsTupThenGetReturnValue!305 lt!502913 (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131395 (= lt!502913 (insertStrictlySorted!398 (toList!8007 call!48760) (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131395 (= (+!3451 call!48760 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502912)))

(declare-fun b!1132052 () Bool)

(declare-fun res!756151 () Bool)

(assert (=> b!1132052 (=> (not res!756151) (not e!644263))))

(assert (=> b!1132052 (= res!756151 (= (getValueByKey!628 (toList!8007 lt!502912) (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1132053 () Bool)

(assert (=> b!1132053 (= e!644263 (contains!6531 (toList!8007 lt!502912) (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131395 res!756152) b!1132052))

(assert (= (and b!1132052 res!756151) b!1132053))

(declare-fun m!1045107 () Bool)

(assert (=> d!131395 m!1045107))

(declare-fun m!1045109 () Bool)

(assert (=> d!131395 m!1045109))

(declare-fun m!1045111 () Bool)

(assert (=> d!131395 m!1045111))

(declare-fun m!1045113 () Bool)

(assert (=> d!131395 m!1045113))

(declare-fun m!1045115 () Bool)

(assert (=> b!1132052 m!1045115))

(declare-fun m!1045117 () Bool)

(assert (=> b!1132053 m!1045117))

(assert (=> b!1131923 d!131395))

(declare-fun d!131397 () Bool)

(assert (=> d!131397 (= (validKeyInArray!0 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131890 d!131397))

(assert (=> b!1131921 d!131357))

(declare-fun b!1132063 () Bool)

(declare-fun e!644268 () Option!679)

(declare-fun e!644269 () Option!679)

(assert (=> b!1132063 (= e!644268 e!644269)))

(declare-fun c!110312 () Bool)

(assert (=> b!1132063 (= c!110312 (and ((_ is Cons!24774) (toList!8007 lt!502773)) (not (= (_1!9018 (h!25983 (toList!8007 lt!502773))) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1132062 () Bool)

(assert (=> b!1132062 (= e!644268 (Some!678 (_2!9018 (h!25983 (toList!8007 lt!502773)))))))

(declare-fun b!1132064 () Bool)

(assert (=> b!1132064 (= e!644269 (getValueByKey!628 (t!35707 (toList!8007 lt!502773)) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun d!131399 () Bool)

(declare-fun c!110311 () Bool)

(assert (=> d!131399 (= c!110311 (and ((_ is Cons!24774) (toList!8007 lt!502773)) (= (_1!9018 (h!25983 (toList!8007 lt!502773))) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131399 (= (getValueByKey!628 (toList!8007 lt!502773) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!644268)))

(declare-fun b!1132065 () Bool)

(assert (=> b!1132065 (= e!644269 None!677)))

(assert (= (and d!131399 c!110311) b!1132062))

(assert (= (and d!131399 (not c!110311)) b!1132063))

(assert (= (and b!1132063 c!110312) b!1132064))

(assert (= (and b!1132063 (not c!110312)) b!1132065))

(declare-fun m!1045119 () Bool)

(assert (=> b!1132064 m!1045119))

(assert (=> b!1131824 d!131399))

(declare-fun d!131401 () Bool)

(declare-fun isEmpty!975 (Option!679) Bool)

(assert (=> d!131401 (= (isDefined!454 (getValueByKey!628 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934)) (not (isEmpty!975 (getValueByKey!628 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934))))))

(declare-fun bs!32963 () Bool)

(assert (= bs!32963 d!131401))

(assert (=> bs!32963 m!1044773))

(declare-fun m!1045121 () Bool)

(assert (=> bs!32963 m!1045121))

(assert (=> b!1131879 d!131401))

(declare-fun b!1132067 () Bool)

(declare-fun e!644270 () Option!679)

(declare-fun e!644271 () Option!679)

(assert (=> b!1132067 (= e!644270 e!644271)))

(declare-fun c!110314 () Bool)

(assert (=> b!1132067 (= c!110314 (and ((_ is Cons!24774) (toList!8007 (ite c!110224 lt!502694 call!48720))) (not (= (_1!9018 (h!25983 (toList!8007 (ite c!110224 lt!502694 call!48720)))) k0!934))))))

(declare-fun b!1132066 () Bool)

(assert (=> b!1132066 (= e!644270 (Some!678 (_2!9018 (h!25983 (toList!8007 (ite c!110224 lt!502694 call!48720))))))))

(declare-fun b!1132068 () Bool)

(assert (=> b!1132068 (= e!644271 (getValueByKey!628 (t!35707 (toList!8007 (ite c!110224 lt!502694 call!48720))) k0!934))))

(declare-fun c!110313 () Bool)

(declare-fun d!131403 () Bool)

(assert (=> d!131403 (= c!110313 (and ((_ is Cons!24774) (toList!8007 (ite c!110224 lt!502694 call!48720))) (= (_1!9018 (h!25983 (toList!8007 (ite c!110224 lt!502694 call!48720)))) k0!934)))))

(assert (=> d!131403 (= (getValueByKey!628 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934) e!644270)))

(declare-fun b!1132069 () Bool)

(assert (=> b!1132069 (= e!644271 None!677)))

(assert (= (and d!131403 c!110313) b!1132066))

(assert (= (and d!131403 (not c!110313)) b!1132067))

(assert (= (and b!1132067 c!110314) b!1132068))

(assert (= (and b!1132067 (not c!110314)) b!1132069))

(declare-fun m!1045123 () Bool)

(assert (=> b!1132068 m!1045123))

(assert (=> b!1131879 d!131403))

(declare-fun d!131405 () Bool)

(declare-fun res!756154 () Bool)

(declare-fun e!644274 () Bool)

(assert (=> d!131405 (=> res!756154 e!644274)))

(assert (=> d!131405 (= res!756154 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(assert (=> d!131405 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!502695 mask!1564) e!644274)))

(declare-fun bm!48770 () Bool)

(declare-fun call!48773 () Bool)

(assert (=> bm!48770 (= call!48773 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!502695 mask!1564))))

(declare-fun b!1132070 () Bool)

(declare-fun e!644272 () Bool)

(declare-fun e!644273 () Bool)

(assert (=> b!1132070 (= e!644272 e!644273)))

(declare-fun lt!502916 () (_ BitVec 64))

(assert (=> b!1132070 (= lt!502916 (select (arr!35549 lt!502695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!502917 () Unit!37073)

(assert (=> b!1132070 (= lt!502917 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!502695 lt!502916 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1132070 (arrayContainsKey!0 lt!502695 lt!502916 #b00000000000000000000000000000000)))

(declare-fun lt!502918 () Unit!37073)

(assert (=> b!1132070 (= lt!502918 lt!502917)))

(declare-fun res!756153 () Bool)

(assert (=> b!1132070 (= res!756153 (= (seekEntryOrOpen!0 (select (arr!35549 lt!502695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!502695 mask!1564) (Found!9925 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1132070 (=> (not res!756153) (not e!644273))))

(declare-fun b!1132071 () Bool)

(assert (=> b!1132071 (= e!644273 call!48773)))

(declare-fun b!1132072 () Bool)

(assert (=> b!1132072 (= e!644272 call!48773)))

(declare-fun b!1132073 () Bool)

(assert (=> b!1132073 (= e!644274 e!644272)))

(declare-fun c!110315 () Bool)

(assert (=> b!1132073 (= c!110315 (validKeyInArray!0 (select (arr!35549 lt!502695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!131405 (not res!756154)) b!1132073))

(assert (= (and b!1132073 c!110315) b!1132070))

(assert (= (and b!1132073 (not c!110315)) b!1132072))

(assert (= (and b!1132070 res!756153) b!1132071))

(assert (= (or b!1132071 b!1132072) bm!48770))

(declare-fun m!1045125 () Bool)

(assert (=> bm!48770 m!1045125))

(declare-fun m!1045127 () Bool)

(assert (=> b!1132070 m!1045127))

(declare-fun m!1045129 () Bool)

(assert (=> b!1132070 m!1045129))

(declare-fun m!1045131 () Bool)

(assert (=> b!1132070 m!1045131))

(assert (=> b!1132070 m!1045127))

(declare-fun m!1045133 () Bool)

(assert (=> b!1132070 m!1045133))

(assert (=> b!1132073 m!1045127))

(assert (=> b!1132073 m!1045127))

(declare-fun m!1045135 () Bool)

(assert (=> b!1132073 m!1045135))

(assert (=> bm!48755 d!131405))

(declare-fun d!131407 () Bool)

(declare-fun res!756159 () Bool)

(declare-fun e!644279 () Bool)

(assert (=> d!131407 (=> res!756159 e!644279)))

(assert (=> d!131407 (= res!756159 (and ((_ is Cons!24774) (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9018 (h!25983 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!131407 (= (containsKey!585 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!644279)))

(declare-fun b!1132078 () Bool)

(declare-fun e!644280 () Bool)

(assert (=> b!1132078 (= e!644279 e!644280)))

(declare-fun res!756160 () Bool)

(assert (=> b!1132078 (=> (not res!756160) (not e!644280))))

(assert (=> b!1132078 (= res!756160 (and (or (not ((_ is Cons!24774) (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (bvsle (_1!9018 (h!25983 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)) ((_ is Cons!24774) (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (bvslt (_1!9018 (h!25983 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(declare-fun b!1132079 () Bool)

(assert (=> b!1132079 (= e!644280 (containsKey!585 (t!35707 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(assert (= (and d!131407 (not res!756159)) b!1132078))

(assert (= (and b!1132078 res!756160) b!1132079))

(declare-fun m!1045137 () Bool)

(assert (=> b!1132079 m!1045137))

(assert (=> d!131307 d!131407))

(declare-fun d!131409 () Bool)

(assert (=> d!131409 (isDefined!454 (getValueByKey!628 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934))))

(declare-fun lt!502921 () Unit!37073)

(declare-fun choose!1778 (List!24778 (_ BitVec 64)) Unit!37073)

(assert (=> d!131409 (= lt!502921 (choose!1778 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934))))

(declare-fun e!644283 () Bool)

(assert (=> d!131409 e!644283))

(declare-fun res!756163 () Bool)

(assert (=> d!131409 (=> (not res!756163) (not e!644283))))

(declare-fun isStrictlySorted!727 (List!24778) Bool)

(assert (=> d!131409 (= res!756163 (isStrictlySorted!727 (toList!8007 (ite c!110224 lt!502694 call!48720))))))

(assert (=> d!131409 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934) lt!502921)))

(declare-fun b!1132082 () Bool)

(assert (=> b!1132082 (= e!644283 (containsKey!585 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934))))

(assert (= (and d!131409 res!756163) b!1132082))

(assert (=> d!131409 m!1044773))

(assert (=> d!131409 m!1044773))

(assert (=> d!131409 m!1044775))

(declare-fun m!1045139 () Bool)

(assert (=> d!131409 m!1045139))

(declare-fun m!1045141 () Bool)

(assert (=> d!131409 m!1045141))

(assert (=> b!1132082 m!1044769))

(assert (=> b!1131877 d!131409))

(assert (=> b!1131877 d!131401))

(assert (=> b!1131877 d!131403))

(assert (=> b!1131876 d!131397))

(declare-fun d!131411 () Bool)

(declare-fun e!644286 () Bool)

(assert (=> d!131411 e!644286))

(declare-fun c!110318 () Bool)

(assert (=> d!131411 (= c!110318 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!131411 true))

(declare-fun _$12!462 () Unit!37073)

(assert (=> d!131411 (= (choose!1776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!462)))

(declare-fun call!48778 () ListLongMap!15983)

(declare-fun bm!48776 () Bool)

(assert (=> bm!48776 (= call!48778 (getCurrentListMapNoExtraKeys!4494 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)) (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48779 () ListLongMap!15983)

(declare-fun bm!48775 () Bool)

(assert (=> bm!48775 (= call!48779 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132087 () Bool)

(assert (=> b!1132087 (= e!644286 (= call!48778 (-!1179 call!48779 k0!934)))))

(declare-fun b!1132088 () Bool)

(assert (=> b!1132088 (= e!644286 (= call!48778 call!48779))))

(assert (= (and d!131411 c!110318) b!1132087))

(assert (= (and d!131411 (not c!110318)) b!1132088))

(assert (= (or b!1132087 b!1132088) bm!48775))

(assert (= (or b!1132087 b!1132088) bm!48776))

(declare-fun b_lambda!18965 () Bool)

(assert (=> (not b_lambda!18965) (not bm!48776)))

(assert (=> bm!48776 t!35705))

(declare-fun b_and!38695 () Bool)

(assert (= b_and!38693 (and (=> t!35705 result!18059) b_and!38695)))

(assert (=> bm!48776 m!1044577))

(assert (=> bm!48776 m!1044589))

(assert (=> bm!48776 m!1044591))

(assert (=> bm!48776 m!1044919))

(assert (=> bm!48775 m!1044559))

(declare-fun m!1045143 () Bool)

(assert (=> b!1132087 m!1045143))

(assert (=> d!131345 d!131411))

(declare-fun d!131413 () Bool)

(declare-fun res!756164 () Bool)

(declare-fun e!644287 () Bool)

(assert (=> d!131413 (=> res!756164 e!644287)))

(assert (=> d!131413 (= res!756164 (= (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!131413 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) e!644287)))

(declare-fun b!1132089 () Bool)

(declare-fun e!644288 () Bool)

(assert (=> b!1132089 (= e!644287 e!644288)))

(declare-fun res!756165 () Bool)

(assert (=> b!1132089 (=> (not res!756165) (not e!644288))))

(assert (=> b!1132089 (= res!756165 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun b!1132090 () Bool)

(assert (=> b!1132090 (= e!644288 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!131413 (not res!756164)) b!1132089))

(assert (= (and b!1132089 res!756165) b!1132090))

(assert (=> d!131413 m!1044985))

(declare-fun m!1045145 () Bool)

(assert (=> b!1132090 m!1045145))

(assert (=> b!1131896 d!131413))

(declare-fun d!131415 () Bool)

(assert (=> d!131415 (= (validKeyInArray!0 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131905 d!131415))

(declare-fun b!1132091 () Bool)

(assert (=> b!1132091 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(assert (=> b!1132091 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36084 (ite c!110222 lt!502685 _values!996))))))

(declare-fun e!644291 () Bool)

(declare-fun lt!502926 () ListLongMap!15983)

(assert (=> b!1132091 (= e!644291 (= (apply!955 lt!502926 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132092 () Bool)

(declare-fun e!644295 () Bool)

(declare-fun e!644293 () Bool)

(assert (=> b!1132092 (= e!644295 e!644293)))

(declare-fun c!110320 () Bool)

(assert (=> b!1132092 (= c!110320 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(declare-fun call!48780 () ListLongMap!15983)

(declare-fun bm!48777 () Bool)

(assert (=> bm!48777 (= call!48780 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 lt!502695 _keys!1208) (ite c!110222 lt!502685 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131417 () Bool)

(declare-fun e!644289 () Bool)

(assert (=> d!131417 e!644289))

(declare-fun res!756168 () Bool)

(assert (=> d!131417 (=> (not res!756168) (not e!644289))))

(assert (=> d!131417 (= res!756168 (not (contains!6529 lt!502926 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644294 () ListLongMap!15983)

(assert (=> d!131417 (= lt!502926 e!644294)))

(declare-fun c!110322 () Bool)

(assert (=> d!131417 (= c!110322 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(assert (=> d!131417 (validMask!0 mask!1564)))

(assert (=> d!131417 (= (getCurrentListMapNoExtraKeys!4494 (ite c!110222 lt!502695 _keys!1208) (ite c!110222 lt!502685 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502926)))

(declare-fun b!1132093 () Bool)

(assert (=> b!1132093 (= e!644293 (= lt!502926 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 lt!502695 _keys!1208) (ite c!110222 lt!502685 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132094 () Bool)

(declare-fun e!644290 () ListLongMap!15983)

(assert (=> b!1132094 (= e!644290 call!48780)))

(declare-fun e!644292 () Bool)

(declare-fun b!1132095 () Bool)

(assert (=> b!1132095 (= e!644292 (validKeyInArray!0 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132095 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1132096 () Bool)

(assert (=> b!1132096 (= e!644294 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1132097 () Bool)

(assert (=> b!1132097 (= e!644289 e!644295)))

(declare-fun c!110321 () Bool)

(assert (=> b!1132097 (= c!110321 e!644292)))

(declare-fun res!756169 () Bool)

(assert (=> b!1132097 (=> (not res!756169) (not e!644292))))

(assert (=> b!1132097 (= res!756169 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(declare-fun b!1132098 () Bool)

(assert (=> b!1132098 (= e!644293 (isEmpty!973 lt!502926))))

(declare-fun b!1132099 () Bool)

(assert (=> b!1132099 (= e!644294 e!644290)))

(declare-fun c!110319 () Bool)

(assert (=> b!1132099 (= c!110319 (validKeyInArray!0 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1132100 () Bool)

(declare-fun res!756166 () Bool)

(assert (=> b!1132100 (=> (not res!756166) (not e!644289))))

(assert (=> b!1132100 (= res!756166 (not (contains!6529 lt!502926 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132101 () Bool)

(declare-fun lt!502922 () Unit!37073)

(declare-fun lt!502928 () Unit!37073)

(assert (=> b!1132101 (= lt!502922 lt!502928)))

(declare-fun lt!502925 () ListLongMap!15983)

(declare-fun lt!502927 () V!43083)

(declare-fun lt!502924 () (_ BitVec 64))

(declare-fun lt!502923 () (_ BitVec 64))

(assert (=> b!1132101 (not (contains!6529 (+!3451 lt!502925 (tuple2!18015 lt!502924 lt!502927)) lt!502923))))

(assert (=> b!1132101 (= lt!502928 (addStillNotContains!283 lt!502925 lt!502924 lt!502927 lt!502923))))

(assert (=> b!1132101 (= lt!502923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132101 (= lt!502927 (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132101 (= lt!502924 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1132101 (= lt!502925 call!48780)))

(assert (=> b!1132101 (= e!644290 (+!3451 call!48780 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132102 () Bool)

(assert (=> b!1132102 (= e!644295 e!644291)))

(assert (=> b!1132102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 lt!502695 _keys!1208))))))

(declare-fun res!756167 () Bool)

(assert (=> b!1132102 (= res!756167 (contains!6529 lt!502926 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132102 (=> (not res!756167) (not e!644291))))

(assert (= (and d!131417 c!110322) b!1132096))

(assert (= (and d!131417 (not c!110322)) b!1132099))

(assert (= (and b!1132099 c!110319) b!1132101))

(assert (= (and b!1132099 (not c!110319)) b!1132094))

(assert (= (or b!1132101 b!1132094) bm!48777))

(assert (= (and d!131417 res!756168) b!1132100))

(assert (= (and b!1132100 res!756166) b!1132097))

(assert (= (and b!1132097 res!756169) b!1132095))

(assert (= (and b!1132097 c!110321) b!1132102))

(assert (= (and b!1132097 (not c!110321)) b!1132092))

(assert (= (and b!1132102 res!756167) b!1132091))

(assert (= (and b!1132092 c!110320) b!1132093))

(assert (= (and b!1132092 (not c!110320)) b!1132098))

(declare-fun b_lambda!18967 () Bool)

(assert (=> (not b_lambda!18967) (not b!1132091)))

(assert (=> b!1132091 t!35705))

(declare-fun b_and!38697 () Bool)

(assert (= b_and!38695 (and (=> t!35705 result!18059) b_and!38697)))

(declare-fun b_lambda!18969 () Bool)

(assert (=> (not b_lambda!18969) (not b!1132101)))

(assert (=> b!1132101 t!35705))

(declare-fun b_and!38699 () Bool)

(assert (= b_and!38697 (and (=> t!35705 result!18059) b_and!38699)))

(declare-fun m!1045147 () Bool)

(assert (=> b!1132093 m!1045147))

(declare-fun m!1045149 () Bool)

(assert (=> b!1132100 m!1045149))

(assert (=> bm!48777 m!1045147))

(declare-fun m!1045151 () Bool)

(assert (=> b!1132091 m!1045151))

(assert (=> b!1132091 m!1045151))

(assert (=> b!1132091 m!1044589))

(declare-fun m!1045153 () Bool)

(assert (=> b!1132091 m!1045153))

(assert (=> b!1132091 m!1044589))

(declare-fun m!1045155 () Bool)

(assert (=> b!1132091 m!1045155))

(assert (=> b!1132091 m!1045155))

(declare-fun m!1045157 () Bool)

(assert (=> b!1132091 m!1045157))

(declare-fun m!1045159 () Bool)

(assert (=> d!131417 m!1045159))

(assert (=> d!131417 m!1044583))

(assert (=> b!1132095 m!1045155))

(assert (=> b!1132095 m!1045155))

(declare-fun m!1045161 () Bool)

(assert (=> b!1132095 m!1045161))

(declare-fun m!1045163 () Bool)

(assert (=> b!1132098 m!1045163))

(assert (=> b!1132099 m!1045155))

(assert (=> b!1132099 m!1045155))

(assert (=> b!1132099 m!1045161))

(assert (=> b!1132102 m!1045155))

(assert (=> b!1132102 m!1045155))

(declare-fun m!1045165 () Bool)

(assert (=> b!1132102 m!1045165))

(assert (=> b!1132101 m!1045151))

(assert (=> b!1132101 m!1045151))

(assert (=> b!1132101 m!1044589))

(assert (=> b!1132101 m!1045153))

(declare-fun m!1045167 () Bool)

(assert (=> b!1132101 m!1045167))

(declare-fun m!1045169 () Bool)

(assert (=> b!1132101 m!1045169))

(assert (=> b!1132101 m!1044589))

(declare-fun m!1045171 () Bool)

(assert (=> b!1132101 m!1045171))

(assert (=> b!1132101 m!1045155))

(assert (=> b!1132101 m!1045167))

(declare-fun m!1045173 () Bool)

(assert (=> b!1132101 m!1045173))

(assert (=> b!1131903 d!131417))

(declare-fun b!1132103 () Bool)

(assert (=> b!1132103 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(assert (=> b!1132103 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36084 _values!996)))))

(declare-fun lt!502933 () ListLongMap!15983)

(declare-fun e!644298 () Bool)

(assert (=> b!1132103 (= e!644298 (= (apply!955 lt!502933 (select (arr!35549 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!18073 (select (arr!35548 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132104 () Bool)

(declare-fun e!644302 () Bool)

(declare-fun e!644300 () Bool)

(assert (=> b!1132104 (= e!644302 e!644300)))

(declare-fun c!110324 () Bool)

(assert (=> b!1132104 (= c!110324 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun call!48781 () ListLongMap!15983)

(declare-fun bm!48778 () Bool)

(assert (=> bm!48778 (= call!48781 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131419 () Bool)

(declare-fun e!644296 () Bool)

(assert (=> d!131419 e!644296))

(declare-fun res!756172 () Bool)

(assert (=> d!131419 (=> (not res!756172) (not e!644296))))

(assert (=> d!131419 (= res!756172 (not (contains!6529 lt!502933 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644301 () ListLongMap!15983)

(assert (=> d!131419 (= lt!502933 e!644301)))

(declare-fun c!110326 () Bool)

(assert (=> d!131419 (= c!110326 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(assert (=> d!131419 (validMask!0 mask!1564)))

(assert (=> d!131419 (= (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502933)))

(declare-fun b!1132105 () Bool)

(assert (=> b!1132105 (= e!644300 (= lt!502933 (getCurrentListMapNoExtraKeys!4494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132106 () Bool)

(declare-fun e!644297 () ListLongMap!15983)

(assert (=> b!1132106 (= e!644297 call!48781)))

(declare-fun b!1132107 () Bool)

(declare-fun e!644299 () Bool)

(assert (=> b!1132107 (= e!644299 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132107 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1132108 () Bool)

(assert (=> b!1132108 (= e!644301 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1132109 () Bool)

(assert (=> b!1132109 (= e!644296 e!644302)))

(declare-fun c!110325 () Bool)

(assert (=> b!1132109 (= c!110325 e!644299)))

(declare-fun res!756173 () Bool)

(assert (=> b!1132109 (=> (not res!756173) (not e!644299))))

(assert (=> b!1132109 (= res!756173 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun b!1132110 () Bool)

(assert (=> b!1132110 (= e!644300 (isEmpty!973 lt!502933))))

(declare-fun b!1132111 () Bool)

(assert (=> b!1132111 (= e!644301 e!644297)))

(declare-fun c!110323 () Bool)

(assert (=> b!1132111 (= c!110323 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1132112 () Bool)

(declare-fun res!756170 () Bool)

(assert (=> b!1132112 (=> (not res!756170) (not e!644296))))

(assert (=> b!1132112 (= res!756170 (not (contains!6529 lt!502933 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132113 () Bool)

(declare-fun lt!502929 () Unit!37073)

(declare-fun lt!502935 () Unit!37073)

(assert (=> b!1132113 (= lt!502929 lt!502935)))

(declare-fun lt!502930 () (_ BitVec 64))

(declare-fun lt!502934 () V!43083)

(declare-fun lt!502932 () ListLongMap!15983)

(declare-fun lt!502931 () (_ BitVec 64))

(assert (=> b!1132113 (not (contains!6529 (+!3451 lt!502932 (tuple2!18015 lt!502931 lt!502934)) lt!502930))))

(assert (=> b!1132113 (= lt!502935 (addStillNotContains!283 lt!502932 lt!502931 lt!502934 lt!502930))))

(assert (=> b!1132113 (= lt!502930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132113 (= lt!502934 (get!18073 (select (arr!35548 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132113 (= lt!502931 (select (arr!35549 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1132113 (= lt!502932 call!48781)))

(assert (=> b!1132113 (= e!644297 (+!3451 call!48781 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!18073 (select (arr!35548 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132114 () Bool)

(assert (=> b!1132114 (= e!644302 e!644298)))

(assert (=> b!1132114 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun res!756171 () Bool)

(assert (=> b!1132114 (= res!756171 (contains!6529 lt!502933 (select (arr!35549 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132114 (=> (not res!756171) (not e!644298))))

(assert (= (and d!131419 c!110326) b!1132108))

(assert (= (and d!131419 (not c!110326)) b!1132111))

(assert (= (and b!1132111 c!110323) b!1132113))

(assert (= (and b!1132111 (not c!110323)) b!1132106))

(assert (= (or b!1132113 b!1132106) bm!48778))

(assert (= (and d!131419 res!756172) b!1132112))

(assert (= (and b!1132112 res!756170) b!1132109))

(assert (= (and b!1132109 res!756173) b!1132107))

(assert (= (and b!1132109 c!110325) b!1132114))

(assert (= (and b!1132109 (not c!110325)) b!1132104))

(assert (= (and b!1132114 res!756171) b!1132103))

(assert (= (and b!1132104 c!110324) b!1132105))

(assert (= (and b!1132104 (not c!110324)) b!1132110))

(declare-fun b_lambda!18971 () Bool)

(assert (=> (not b_lambda!18971) (not b!1132103)))

(assert (=> b!1132103 t!35705))

(declare-fun b_and!38701 () Bool)

(assert (= b_and!38699 (and (=> t!35705 result!18059) b_and!38701)))

(declare-fun b_lambda!18973 () Bool)

(assert (=> (not b_lambda!18973) (not b!1132113)))

(assert (=> b!1132113 t!35705))

(declare-fun b_and!38703 () Bool)

(assert (= b_and!38701 (and (=> t!35705 result!18059) b_and!38703)))

(declare-fun m!1045175 () Bool)

(assert (=> b!1132105 m!1045175))

(declare-fun m!1045177 () Bool)

(assert (=> b!1132112 m!1045177))

(assert (=> bm!48778 m!1045175))

(declare-fun m!1045179 () Bool)

(assert (=> b!1132103 m!1045179))

(assert (=> b!1132103 m!1045179))

(assert (=> b!1132103 m!1044589))

(declare-fun m!1045181 () Bool)

(assert (=> b!1132103 m!1045181))

(assert (=> b!1132103 m!1044589))

(declare-fun m!1045183 () Bool)

(assert (=> b!1132103 m!1045183))

(assert (=> b!1132103 m!1045183))

(declare-fun m!1045185 () Bool)

(assert (=> b!1132103 m!1045185))

(declare-fun m!1045187 () Bool)

(assert (=> d!131419 m!1045187))

(assert (=> d!131419 m!1044583))

(assert (=> b!1132107 m!1045183))

(assert (=> b!1132107 m!1045183))

(declare-fun m!1045189 () Bool)

(assert (=> b!1132107 m!1045189))

(declare-fun m!1045191 () Bool)

(assert (=> b!1132110 m!1045191))

(assert (=> b!1132111 m!1045183))

(assert (=> b!1132111 m!1045183))

(assert (=> b!1132111 m!1045189))

(assert (=> b!1132114 m!1045183))

(assert (=> b!1132114 m!1045183))

(declare-fun m!1045193 () Bool)

(assert (=> b!1132114 m!1045193))

(assert (=> b!1132113 m!1045179))

(assert (=> b!1132113 m!1045179))

(assert (=> b!1132113 m!1044589))

(assert (=> b!1132113 m!1045181))

(declare-fun m!1045195 () Bool)

(assert (=> b!1132113 m!1045195))

(declare-fun m!1045197 () Bool)

(assert (=> b!1132113 m!1045197))

(assert (=> b!1132113 m!1044589))

(declare-fun m!1045199 () Bool)

(assert (=> b!1132113 m!1045199))

(assert (=> b!1132113 m!1045183))

(assert (=> b!1132113 m!1045195))

(declare-fun m!1045201 () Bool)

(assert (=> b!1132113 m!1045201))

(assert (=> bm!48759 d!131419))

(declare-fun d!131421 () Bool)

(declare-fun e!644304 () Bool)

(assert (=> d!131421 e!644304))

(declare-fun res!756174 () Bool)

(assert (=> d!131421 (=> res!756174 e!644304)))

(declare-fun lt!502937 () Bool)

(assert (=> d!131421 (= res!756174 (not lt!502937))))

(declare-fun lt!502939 () Bool)

(assert (=> d!131421 (= lt!502937 lt!502939)))

(declare-fun lt!502938 () Unit!37073)

(declare-fun e!644303 () Unit!37073)

(assert (=> d!131421 (= lt!502938 e!644303)))

(declare-fun c!110327 () Bool)

(assert (=> d!131421 (= c!110327 lt!502939)))

(assert (=> d!131421 (= lt!502939 (containsKey!585 (toList!8007 lt!502799) (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!131421 (= (contains!6529 lt!502799 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!502937)))

(declare-fun b!1132115 () Bool)

(declare-fun lt!502936 () Unit!37073)

(assert (=> b!1132115 (= e!644303 lt!502936)))

(assert (=> b!1132115 (= lt!502936 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502799) (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132115 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502799) (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132116 () Bool)

(declare-fun Unit!37086 () Unit!37073)

(assert (=> b!1132116 (= e!644303 Unit!37086)))

(declare-fun b!1132117 () Bool)

(assert (=> b!1132117 (= e!644304 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502799) (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!131421 c!110327) b!1132115))

(assert (= (and d!131421 (not c!110327)) b!1132116))

(assert (= (and d!131421 (not res!756174)) b!1132117))

(assert (=> d!131421 m!1044739))

(declare-fun m!1045203 () Bool)

(assert (=> d!131421 m!1045203))

(assert (=> b!1132115 m!1044739))

(declare-fun m!1045205 () Bool)

(assert (=> b!1132115 m!1045205))

(assert (=> b!1132115 m!1044739))

(declare-fun m!1045207 () Bool)

(assert (=> b!1132115 m!1045207))

(assert (=> b!1132115 m!1045207))

(declare-fun m!1045209 () Bool)

(assert (=> b!1132115 m!1045209))

(assert (=> b!1132117 m!1044739))

(assert (=> b!1132117 m!1045207))

(assert (=> b!1132117 m!1045207))

(assert (=> b!1132117 m!1045209))

(assert (=> b!1131864 d!131421))

(declare-fun d!131423 () Bool)

(assert (=> d!131423 (= (apply!955 lt!502843 (select (arr!35549 lt!502695) from!1455)) (get!18076 (getValueByKey!628 (toList!8007 lt!502843) (select (arr!35549 lt!502695) from!1455))))))

(declare-fun bs!32964 () Bool)

(assert (= bs!32964 d!131423))

(assert (=> bs!32964 m!1044871))

(declare-fun m!1045211 () Bool)

(assert (=> bs!32964 m!1045211))

(assert (=> bs!32964 m!1045211))

(declare-fun m!1045213 () Bool)

(assert (=> bs!32964 m!1045213))

(assert (=> b!1131931 d!131423))

(assert (=> b!1131931 d!131373))

(declare-fun d!131425 () Bool)

(declare-fun e!644306 () Bool)

(assert (=> d!131425 e!644306))

(declare-fun res!756175 () Bool)

(assert (=> d!131425 (=> res!756175 e!644306)))

(declare-fun lt!502941 () Bool)

(assert (=> d!131425 (= res!756175 (not lt!502941))))

(declare-fun lt!502943 () Bool)

(assert (=> d!131425 (= lt!502941 lt!502943)))

(declare-fun lt!502942 () Unit!37073)

(declare-fun e!644305 () Unit!37073)

(assert (=> d!131425 (= lt!502942 e!644305)))

(declare-fun c!110328 () Bool)

(assert (=> d!131425 (= c!110328 lt!502943)))

(assert (=> d!131425 (= lt!502943 (containsKey!585 (toList!8007 lt!502850) (select (arr!35549 _keys!1208) from!1455)))))

(assert (=> d!131425 (= (contains!6529 lt!502850 (select (arr!35549 _keys!1208) from!1455)) lt!502941)))

(declare-fun b!1132118 () Bool)

(declare-fun lt!502940 () Unit!37073)

(assert (=> b!1132118 (= e!644305 lt!502940)))

(assert (=> b!1132118 (= lt!502940 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502850) (select (arr!35549 _keys!1208) from!1455)))))

(assert (=> b!1132118 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502850) (select (arr!35549 _keys!1208) from!1455)))))

(declare-fun b!1132119 () Bool)

(declare-fun Unit!37087 () Unit!37073)

(assert (=> b!1132119 (= e!644305 Unit!37087)))

(declare-fun b!1132120 () Bool)

(assert (=> b!1132120 (= e!644306 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502850) (select (arr!35549 _keys!1208) from!1455))))))

(assert (= (and d!131425 c!110328) b!1132118))

(assert (= (and d!131425 (not c!110328)) b!1132119))

(assert (= (and d!131425 (not res!756175)) b!1132120))

(assert (=> d!131425 m!1044563))

(declare-fun m!1045215 () Bool)

(assert (=> d!131425 m!1045215))

(assert (=> b!1132118 m!1044563))

(declare-fun m!1045217 () Bool)

(assert (=> b!1132118 m!1045217))

(assert (=> b!1132118 m!1044563))

(assert (=> b!1132118 m!1045069))

(assert (=> b!1132118 m!1045069))

(declare-fun m!1045219 () Bool)

(assert (=> b!1132118 m!1045219))

(assert (=> b!1132120 m!1044563))

(assert (=> b!1132120 m!1045069))

(assert (=> b!1132120 m!1045069))

(assert (=> b!1132120 m!1045219))

(assert (=> b!1131954 d!131425))

(assert (=> b!1131900 d!131363))

(declare-fun d!131427 () Bool)

(declare-fun e!644307 () Bool)

(assert (=> d!131427 e!644307))

(declare-fun res!756177 () Bool)

(assert (=> d!131427 (=> (not res!756177) (not e!644307))))

(declare-fun lt!502944 () ListLongMap!15983)

(assert (=> d!131427 (= res!756177 (contains!6529 lt!502944 (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502945 () List!24778)

(assert (=> d!131427 (= lt!502944 (ListLongMap!15984 lt!502945))))

(declare-fun lt!502946 () Unit!37073)

(declare-fun lt!502947 () Unit!37073)

(assert (=> d!131427 (= lt!502946 lt!502947)))

(assert (=> d!131427 (= (getValueByKey!628 lt!502945 (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131427 (= lt!502947 (lemmaContainsTupThenGetReturnValue!305 lt!502945 (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131427 (= lt!502945 (insertStrictlySorted!398 (toList!8007 call!48759) (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131427 (= (+!3451 call!48759 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502944)))

(declare-fun b!1132121 () Bool)

(declare-fun res!756176 () Bool)

(assert (=> b!1132121 (=> (not res!756176) (not e!644307))))

(assert (=> b!1132121 (= res!756176 (= (getValueByKey!628 (toList!8007 lt!502944) (_1!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1132122 () Bool)

(assert (=> b!1132122 (= e!644307 (contains!6531 (toList!8007 lt!502944) (tuple2!18015 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131427 res!756177) b!1132121))

(assert (= (and b!1132121 res!756176) b!1132122))

(declare-fun m!1045221 () Bool)

(assert (=> d!131427 m!1045221))

(declare-fun m!1045223 () Bool)

(assert (=> d!131427 m!1045223))

(declare-fun m!1045225 () Bool)

(assert (=> d!131427 m!1045225))

(declare-fun m!1045227 () Bool)

(assert (=> d!131427 m!1045227))

(declare-fun m!1045229 () Bool)

(assert (=> b!1132121 m!1045229))

(declare-fun m!1045231 () Bool)

(assert (=> b!1132122 m!1045231))

(assert (=> b!1131911 d!131427))

(declare-fun d!131429 () Bool)

(declare-fun e!644309 () Bool)

(assert (=> d!131429 e!644309))

(declare-fun res!756178 () Bool)

(assert (=> d!131429 (=> res!756178 e!644309)))

(declare-fun lt!502949 () Bool)

(assert (=> d!131429 (= res!756178 (not lt!502949))))

(declare-fun lt!502951 () Bool)

(assert (=> d!131429 (= lt!502949 lt!502951)))

(declare-fun lt!502950 () Unit!37073)

(declare-fun e!644308 () Unit!37073)

(assert (=> d!131429 (= lt!502950 e!644308)))

(declare-fun c!110329 () Bool)

(assert (=> d!131429 (= c!110329 lt!502951)))

(assert (=> d!131429 (= lt!502951 (containsKey!585 (toList!8007 (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827))) lt!502823))))

(assert (=> d!131429 (= (contains!6529 (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827)) lt!502823) lt!502949)))

(declare-fun b!1132123 () Bool)

(declare-fun lt!502948 () Unit!37073)

(assert (=> b!1132123 (= e!644308 lt!502948)))

(assert (=> b!1132123 (= lt!502948 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827))) lt!502823))))

(assert (=> b!1132123 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827))) lt!502823))))

(declare-fun b!1132124 () Bool)

(declare-fun Unit!37088 () Unit!37073)

(assert (=> b!1132124 (= e!644308 Unit!37088)))

(declare-fun b!1132125 () Bool)

(assert (=> b!1132125 (= e!644309 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827))) lt!502823)))))

(assert (= (and d!131429 c!110329) b!1132123))

(assert (= (and d!131429 (not c!110329)) b!1132124))

(assert (= (and d!131429 (not res!756178)) b!1132125))

(declare-fun m!1045233 () Bool)

(assert (=> d!131429 m!1045233))

(declare-fun m!1045235 () Bool)

(assert (=> b!1132123 m!1045235))

(declare-fun m!1045237 () Bool)

(assert (=> b!1132123 m!1045237))

(assert (=> b!1132123 m!1045237))

(declare-fun m!1045239 () Bool)

(assert (=> b!1132123 m!1045239))

(assert (=> b!1132125 m!1045237))

(assert (=> b!1132125 m!1045237))

(assert (=> b!1132125 m!1045239))

(assert (=> b!1131911 d!131429))

(declare-fun d!131431 () Bool)

(assert (=> d!131431 (not (contains!6529 (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827)) lt!502823))))

(declare-fun lt!502952 () Unit!37073)

(assert (=> d!131431 (= lt!502952 (choose!1777 lt!502825 lt!502824 lt!502827 lt!502823))))

(declare-fun e!644310 () Bool)

(assert (=> d!131431 e!644310))

(declare-fun res!756179 () Bool)

(assert (=> d!131431 (=> (not res!756179) (not e!644310))))

(assert (=> d!131431 (= res!756179 (not (contains!6529 lt!502825 lt!502823)))))

(assert (=> d!131431 (= (addStillNotContains!283 lt!502825 lt!502824 lt!502827 lt!502823) lt!502952)))

(declare-fun b!1132126 () Bool)

(assert (=> b!1132126 (= e!644310 (not (= lt!502824 lt!502823)))))

(assert (= (and d!131431 res!756179) b!1132126))

(assert (=> d!131431 m!1044825))

(assert (=> d!131431 m!1044825))

(assert (=> d!131431 m!1044827))

(declare-fun m!1045241 () Bool)

(assert (=> d!131431 m!1045241))

(declare-fun m!1045243 () Bool)

(assert (=> d!131431 m!1045243))

(assert (=> b!1131911 d!131431))

(declare-fun c!110330 () Bool)

(declare-fun d!131433 () Bool)

(assert (=> d!131433 (= c!110330 ((_ is ValueCellFull!13524) (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!644311 () V!43083)

(assert (=> d!131433 (= (get!18073 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644311)))

(declare-fun b!1132127 () Bool)

(assert (=> b!1132127 (= e!644311 (get!18074 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132128 () Bool)

(assert (=> b!1132128 (= e!644311 (get!18075 (select (arr!35548 (ite c!110222 lt!502685 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131433 c!110330) b!1132127))

(assert (= (and d!131433 (not c!110330)) b!1132128))

(assert (=> b!1132127 m!1044809))

(assert (=> b!1132127 m!1044589))

(declare-fun m!1045245 () Bool)

(assert (=> b!1132127 m!1045245))

(assert (=> b!1132128 m!1044809))

(assert (=> b!1132128 m!1044589))

(declare-fun m!1045247 () Bool)

(assert (=> b!1132128 m!1045247))

(assert (=> b!1131911 d!131433))

(declare-fun d!131435 () Bool)

(declare-fun e!644312 () Bool)

(assert (=> d!131435 e!644312))

(declare-fun res!756181 () Bool)

(assert (=> d!131435 (=> (not res!756181) (not e!644312))))

(declare-fun lt!502953 () ListLongMap!15983)

(assert (=> d!131435 (= res!756181 (contains!6529 lt!502953 (_1!9018 (tuple2!18015 lt!502824 lt!502827))))))

(declare-fun lt!502954 () List!24778)

(assert (=> d!131435 (= lt!502953 (ListLongMap!15984 lt!502954))))

(declare-fun lt!502955 () Unit!37073)

(declare-fun lt!502956 () Unit!37073)

(assert (=> d!131435 (= lt!502955 lt!502956)))

(assert (=> d!131435 (= (getValueByKey!628 lt!502954 (_1!9018 (tuple2!18015 lt!502824 lt!502827))) (Some!678 (_2!9018 (tuple2!18015 lt!502824 lt!502827))))))

(assert (=> d!131435 (= lt!502956 (lemmaContainsTupThenGetReturnValue!305 lt!502954 (_1!9018 (tuple2!18015 lt!502824 lt!502827)) (_2!9018 (tuple2!18015 lt!502824 lt!502827))))))

(assert (=> d!131435 (= lt!502954 (insertStrictlySorted!398 (toList!8007 lt!502825) (_1!9018 (tuple2!18015 lt!502824 lt!502827)) (_2!9018 (tuple2!18015 lt!502824 lt!502827))))))

(assert (=> d!131435 (= (+!3451 lt!502825 (tuple2!18015 lt!502824 lt!502827)) lt!502953)))

(declare-fun b!1132129 () Bool)

(declare-fun res!756180 () Bool)

(assert (=> b!1132129 (=> (not res!756180) (not e!644312))))

(assert (=> b!1132129 (= res!756180 (= (getValueByKey!628 (toList!8007 lt!502953) (_1!9018 (tuple2!18015 lt!502824 lt!502827))) (Some!678 (_2!9018 (tuple2!18015 lt!502824 lt!502827)))))))

(declare-fun b!1132130 () Bool)

(assert (=> b!1132130 (= e!644312 (contains!6531 (toList!8007 lt!502953) (tuple2!18015 lt!502824 lt!502827)))))

(assert (= (and d!131435 res!756181) b!1132129))

(assert (= (and b!1132129 res!756180) b!1132130))

(declare-fun m!1045249 () Bool)

(assert (=> d!131435 m!1045249))

(declare-fun m!1045251 () Bool)

(assert (=> d!131435 m!1045251))

(declare-fun m!1045253 () Bool)

(assert (=> d!131435 m!1045253))

(declare-fun m!1045255 () Bool)

(assert (=> d!131435 m!1045255))

(declare-fun m!1045257 () Bool)

(assert (=> b!1132129 m!1045257))

(declare-fun m!1045259 () Bool)

(assert (=> b!1132130 m!1045259))

(assert (=> b!1131911 d!131435))

(declare-fun d!131437 () Bool)

(declare-fun e!644314 () Bool)

(assert (=> d!131437 e!644314))

(declare-fun res!756182 () Bool)

(assert (=> d!131437 (=> res!756182 e!644314)))

(declare-fun lt!502958 () Bool)

(assert (=> d!131437 (= res!756182 (not lt!502958))))

(declare-fun lt!502960 () Bool)

(assert (=> d!131437 (= lt!502958 lt!502960)))

(declare-fun lt!502959 () Unit!37073)

(declare-fun e!644313 () Unit!37073)

(assert (=> d!131437 (= lt!502959 e!644313)))

(declare-fun c!110331 () Bool)

(assert (=> d!131437 (= c!110331 lt!502960)))

(assert (=> d!131437 (= lt!502960 (containsKey!585 (toList!8007 lt!502850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131437 (= (contains!6529 lt!502850 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502958)))

(declare-fun b!1132131 () Bool)

(declare-fun lt!502957 () Unit!37073)

(assert (=> b!1132131 (= e!644313 lt!502957)))

(assert (=> b!1132131 (= lt!502957 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132131 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132132 () Bool)

(declare-fun Unit!37089 () Unit!37073)

(assert (=> b!1132132 (= e!644313 Unit!37089)))

(declare-fun b!1132133 () Bool)

(assert (=> b!1132133 (= e!644314 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131437 c!110331) b!1132131))

(assert (= (and d!131437 (not c!110331)) b!1132132))

(assert (= (and d!131437 (not res!756182)) b!1132133))

(declare-fun m!1045261 () Bool)

(assert (=> d!131437 m!1045261))

(declare-fun m!1045263 () Bool)

(assert (=> b!1132131 m!1045263))

(declare-fun m!1045265 () Bool)

(assert (=> b!1132131 m!1045265))

(assert (=> b!1132131 m!1045265))

(declare-fun m!1045267 () Bool)

(assert (=> b!1132131 m!1045267))

(assert (=> b!1132133 m!1045265))

(assert (=> b!1132133 m!1045265))

(assert (=> b!1132133 m!1045267))

(assert (=> b!1131952 d!131437))

(declare-fun b!1132134 () Bool)

(assert (=> b!1132134 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(assert (=> b!1132134 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36084 (ite c!110222 _values!996 lt!502685))))))

(declare-fun e!644317 () Bool)

(declare-fun lt!502965 () ListLongMap!15983)

(assert (=> b!1132134 (= e!644317 (= (apply!955 lt!502965 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132135 () Bool)

(declare-fun e!644321 () Bool)

(declare-fun e!644319 () Bool)

(assert (=> b!1132135 (= e!644321 e!644319)))

(declare-fun c!110333 () Bool)

(assert (=> b!1132135 (= c!110333 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(declare-fun bm!48779 () Bool)

(declare-fun call!48782 () ListLongMap!15983)

(assert (=> bm!48779 (= call!48782 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 _keys!1208 lt!502695) (ite c!110222 _values!996 lt!502685) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131439 () Bool)

(declare-fun e!644315 () Bool)

(assert (=> d!131439 e!644315))

(declare-fun res!756185 () Bool)

(assert (=> d!131439 (=> (not res!756185) (not e!644315))))

(assert (=> d!131439 (= res!756185 (not (contains!6529 lt!502965 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644320 () ListLongMap!15983)

(assert (=> d!131439 (= lt!502965 e!644320)))

(declare-fun c!110335 () Bool)

(assert (=> d!131439 (= c!110335 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(assert (=> d!131439 (validMask!0 mask!1564)))

(assert (=> d!131439 (= (getCurrentListMapNoExtraKeys!4494 (ite c!110222 _keys!1208 lt!502695) (ite c!110222 _values!996 lt!502685) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502965)))

(declare-fun b!1132136 () Bool)

(assert (=> b!1132136 (= e!644319 (= lt!502965 (getCurrentListMapNoExtraKeys!4494 (ite c!110222 _keys!1208 lt!502695) (ite c!110222 _values!996 lt!502685) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132137 () Bool)

(declare-fun e!644316 () ListLongMap!15983)

(assert (=> b!1132137 (= e!644316 call!48782)))

(declare-fun e!644318 () Bool)

(declare-fun b!1132138 () Bool)

(assert (=> b!1132138 (= e!644318 (validKeyInArray!0 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132138 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1132139 () Bool)

(assert (=> b!1132139 (= e!644320 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1132140 () Bool)

(assert (=> b!1132140 (= e!644315 e!644321)))

(declare-fun c!110334 () Bool)

(assert (=> b!1132140 (= c!110334 e!644318)))

(declare-fun res!756186 () Bool)

(assert (=> b!1132140 (=> (not res!756186) (not e!644318))))

(assert (=> b!1132140 (= res!756186 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(declare-fun b!1132141 () Bool)

(assert (=> b!1132141 (= e!644319 (isEmpty!973 lt!502965))))

(declare-fun b!1132142 () Bool)

(assert (=> b!1132142 (= e!644320 e!644316)))

(declare-fun c!110332 () Bool)

(assert (=> b!1132142 (= c!110332 (validKeyInArray!0 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1132143 () Bool)

(declare-fun res!756183 () Bool)

(assert (=> b!1132143 (=> (not res!756183) (not e!644315))))

(assert (=> b!1132143 (= res!756183 (not (contains!6529 lt!502965 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132144 () Bool)

(declare-fun lt!502961 () Unit!37073)

(declare-fun lt!502967 () Unit!37073)

(assert (=> b!1132144 (= lt!502961 lt!502967)))

(declare-fun lt!502962 () (_ BitVec 64))

(declare-fun lt!502963 () (_ BitVec 64))

(declare-fun lt!502966 () V!43083)

(declare-fun lt!502964 () ListLongMap!15983)

(assert (=> b!1132144 (not (contains!6529 (+!3451 lt!502964 (tuple2!18015 lt!502963 lt!502966)) lt!502962))))

(assert (=> b!1132144 (= lt!502967 (addStillNotContains!283 lt!502964 lt!502963 lt!502966 lt!502962))))

(assert (=> b!1132144 (= lt!502962 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132144 (= lt!502966 (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132144 (= lt!502963 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1132144 (= lt!502964 call!48782)))

(assert (=> b!1132144 (= e!644316 (+!3451 call!48782 (tuple2!18015 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18073 (select (arr!35548 (ite c!110222 _values!996 lt!502685)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132145 () Bool)

(assert (=> b!1132145 (= e!644321 e!644317)))

(assert (=> b!1132145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36085 (ite c!110222 _keys!1208 lt!502695))))))

(declare-fun res!756184 () Bool)

(assert (=> b!1132145 (= res!756184 (contains!6529 lt!502965 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132145 (=> (not res!756184) (not e!644317))))

(assert (= (and d!131439 c!110335) b!1132139))

(assert (= (and d!131439 (not c!110335)) b!1132142))

(assert (= (and b!1132142 c!110332) b!1132144))

(assert (= (and b!1132142 (not c!110332)) b!1132137))

(assert (= (or b!1132144 b!1132137) bm!48779))

(assert (= (and d!131439 res!756185) b!1132143))

(assert (= (and b!1132143 res!756183) b!1132140))

(assert (= (and b!1132140 res!756186) b!1132138))

(assert (= (and b!1132140 c!110334) b!1132145))

(assert (= (and b!1132140 (not c!110334)) b!1132135))

(assert (= (and b!1132145 res!756184) b!1132134))

(assert (= (and b!1132135 c!110333) b!1132136))

(assert (= (and b!1132135 (not c!110333)) b!1132141))

(declare-fun b_lambda!18975 () Bool)

(assert (=> (not b_lambda!18975) (not b!1132134)))

(assert (=> b!1132134 t!35705))

(declare-fun b_and!38705 () Bool)

(assert (= b_and!38703 (and (=> t!35705 result!18059) b_and!38705)))

(declare-fun b_lambda!18977 () Bool)

(assert (=> (not b_lambda!18977) (not b!1132144)))

(assert (=> b!1132144 t!35705))

(declare-fun b_and!38707 () Bool)

(assert (= b_and!38705 (and (=> t!35705 result!18059) b_and!38707)))

(declare-fun m!1045269 () Bool)

(assert (=> b!1132136 m!1045269))

(declare-fun m!1045271 () Bool)

(assert (=> b!1132143 m!1045271))

(assert (=> bm!48779 m!1045269))

(declare-fun m!1045273 () Bool)

(assert (=> b!1132134 m!1045273))

(assert (=> b!1132134 m!1045273))

(assert (=> b!1132134 m!1044589))

(declare-fun m!1045275 () Bool)

(assert (=> b!1132134 m!1045275))

(assert (=> b!1132134 m!1044589))

(declare-fun m!1045277 () Bool)

(assert (=> b!1132134 m!1045277))

(assert (=> b!1132134 m!1045277))

(declare-fun m!1045279 () Bool)

(assert (=> b!1132134 m!1045279))

(declare-fun m!1045281 () Bool)

(assert (=> d!131439 m!1045281))

(assert (=> d!131439 m!1044583))

(assert (=> b!1132138 m!1045277))

(assert (=> b!1132138 m!1045277))

(declare-fun m!1045283 () Bool)

(assert (=> b!1132138 m!1045283))

(declare-fun m!1045285 () Bool)

(assert (=> b!1132141 m!1045285))

(assert (=> b!1132142 m!1045277))

(assert (=> b!1132142 m!1045277))

(assert (=> b!1132142 m!1045283))

(assert (=> b!1132145 m!1045277))

(assert (=> b!1132145 m!1045277))

(declare-fun m!1045287 () Bool)

(assert (=> b!1132145 m!1045287))

(assert (=> b!1132144 m!1045273))

(assert (=> b!1132144 m!1045273))

(assert (=> b!1132144 m!1044589))

(assert (=> b!1132144 m!1045275))

(declare-fun m!1045289 () Bool)

(assert (=> b!1132144 m!1045289))

(declare-fun m!1045291 () Bool)

(assert (=> b!1132144 m!1045291))

(assert (=> b!1132144 m!1044589))

(declare-fun m!1045293 () Bool)

(assert (=> b!1132144 m!1045293))

(assert (=> b!1132144 m!1045277))

(assert (=> b!1132144 m!1045289))

(declare-fun m!1045295 () Bool)

(assert (=> b!1132144 m!1045295))

(assert (=> bm!48757 d!131439))

(declare-fun d!131441 () Bool)

(declare-fun lt!502968 () ListLongMap!15983)

(assert (=> d!131441 (not (contains!6529 lt!502968 k0!934))))

(assert (=> d!131441 (= lt!502968 (ListLongMap!15984 (removeStrictlySorted!89 (toList!8007 call!48767) k0!934)))))

(assert (=> d!131441 (= (-!1179 call!48767 k0!934) lt!502968)))

(declare-fun bs!32965 () Bool)

(assert (= bs!32965 d!131441))

(declare-fun m!1045297 () Bool)

(assert (=> bs!32965 m!1045297))

(declare-fun m!1045299 () Bool)

(assert (=> bs!32965 m!1045299))

(assert (=> b!1131962 d!131441))

(declare-fun d!131443 () Bool)

(assert (=> d!131443 (= (apply!955 lt!502833 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18076 (getValueByKey!628 (toList!8007 lt!502833) (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32966 () Bool)

(assert (= bs!32966 d!131443))

(assert (=> bs!32966 m!1044841))

(declare-fun m!1045301 () Bool)

(assert (=> bs!32966 m!1045301))

(assert (=> bs!32966 m!1045301))

(declare-fun m!1045303 () Bool)

(assert (=> bs!32966 m!1045303))

(assert (=> b!1131913 d!131443))

(assert (=> b!1131913 d!131389))

(declare-fun d!131445 () Bool)

(declare-fun res!756187 () Bool)

(declare-fun e!644322 () Bool)

(assert (=> d!131445 (=> res!756187 e!644322)))

(assert (=> d!131445 (= res!756187 (= (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!131445 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!644322)))

(declare-fun b!1132146 () Bool)

(declare-fun e!644323 () Bool)

(assert (=> b!1132146 (= e!644322 e!644323)))

(declare-fun res!756188 () Bool)

(assert (=> b!1132146 (=> (not res!756188) (not e!644323))))

(assert (=> b!1132146 (= res!756188 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun b!1132147 () Bool)

(assert (=> b!1132147 (= e!644323 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!131445 (not res!756187)) b!1132146))

(assert (= (and b!1132146 res!756188) b!1132147))

(assert (=> d!131445 m!1045051))

(declare-fun m!1045305 () Bool)

(assert (=> b!1132147 m!1045305))

(assert (=> b!1131813 d!131445))

(declare-fun d!131447 () Bool)

(declare-fun e!644325 () Bool)

(assert (=> d!131447 e!644325))

(declare-fun res!756189 () Bool)

(assert (=> d!131447 (=> res!756189 e!644325)))

(declare-fun lt!502970 () Bool)

(assert (=> d!131447 (= res!756189 (not lt!502970))))

(declare-fun lt!502972 () Bool)

(assert (=> d!131447 (= lt!502970 lt!502972)))

(declare-fun lt!502971 () Unit!37073)

(declare-fun e!644324 () Unit!37073)

(assert (=> d!131447 (= lt!502971 e!644324)))

(declare-fun c!110336 () Bool)

(assert (=> d!131447 (= c!110336 lt!502972)))

(assert (=> d!131447 (= lt!502972 (containsKey!585 (toList!8007 (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> d!131447 (= (contains!6529 (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))) k0!934) lt!502970)))

(declare-fun b!1132148 () Bool)

(declare-fun lt!502969 () Unit!37073)

(assert (=> b!1132148 (= e!644324 lt!502969)))

(assert (=> b!1132148 (= lt!502969 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> b!1132148 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))) k0!934))))

(declare-fun b!1132149 () Bool)

(declare-fun Unit!37090 () Unit!37073)

(assert (=> b!1132149 (= e!644324 Unit!37090)))

(declare-fun b!1132150 () Bool)

(assert (=> b!1132150 (= e!644325 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))) k0!934)))))

(assert (= (and d!131447 c!110336) b!1132148))

(assert (= (and d!131447 (not c!110336)) b!1132149))

(assert (= (and d!131447 (not res!756189)) b!1132150))

(declare-fun m!1045307 () Bool)

(assert (=> d!131447 m!1045307))

(declare-fun m!1045309 () Bool)

(assert (=> b!1132148 m!1045309))

(declare-fun m!1045311 () Bool)

(assert (=> b!1132148 m!1045311))

(assert (=> b!1132148 m!1045311))

(declare-fun m!1045313 () Bool)

(assert (=> b!1132148 m!1045313))

(assert (=> b!1132150 m!1045311))

(assert (=> b!1132150 m!1045311))

(assert (=> b!1132150 m!1045313))

(assert (=> d!131327 d!131447))

(declare-fun d!131449 () Bool)

(declare-fun e!644326 () Bool)

(assert (=> d!131449 e!644326))

(declare-fun res!756191 () Bool)

(assert (=> d!131449 (=> (not res!756191) (not e!644326))))

(declare-fun lt!502973 () ListLongMap!15983)

(assert (=> d!131449 (= res!756191 (contains!6529 lt!502973 (_1!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))))))

(declare-fun lt!502974 () List!24778)

(assert (=> d!131449 (= lt!502973 (ListLongMap!15984 lt!502974))))

(declare-fun lt!502975 () Unit!37073)

(declare-fun lt!502976 () Unit!37073)

(assert (=> d!131449 (= lt!502975 lt!502976)))

(assert (=> d!131449 (= (getValueByKey!628 lt!502974 (_1!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))) (Some!678 (_2!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))))))

(assert (=> d!131449 (= lt!502976 (lemmaContainsTupThenGetReturnValue!305 lt!502974 (_1!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))) (_2!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))))))

(assert (=> d!131449 (= lt!502974 (insertStrictlySorted!398 (toList!8007 lt!502693) (_1!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))) (_2!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))))))

(assert (=> d!131449 (= (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))) lt!502973)))

(declare-fun b!1132151 () Bool)

(declare-fun res!756190 () Bool)

(assert (=> b!1132151 (=> (not res!756190) (not e!644326))))

(assert (=> b!1132151 (= res!756190 (= (getValueByKey!628 (toList!8007 lt!502973) (_1!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944)))) (Some!678 (_2!9018 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))))))))

(declare-fun b!1132152 () Bool)

(assert (=> b!1132152 (= e!644326 (contains!6531 (toList!8007 lt!502973) (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))))))

(assert (= (and d!131449 res!756191) b!1132151))

(assert (= (and b!1132151 res!756190) b!1132152))

(declare-fun m!1045315 () Bool)

(assert (=> d!131449 m!1045315))

(declare-fun m!1045317 () Bool)

(assert (=> d!131449 m!1045317))

(declare-fun m!1045319 () Bool)

(assert (=> d!131449 m!1045319))

(declare-fun m!1045321 () Bool)

(assert (=> d!131449 m!1045321))

(declare-fun m!1045323 () Bool)

(assert (=> b!1132151 m!1045323))

(declare-fun m!1045325 () Bool)

(assert (=> b!1132152 m!1045325))

(assert (=> d!131327 d!131449))

(declare-fun d!131451 () Bool)

(assert (=> d!131451 (contains!6529 (+!3451 lt!502693 (tuple2!18015 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944))) k0!934)))

(assert (=> d!131451 true))

(declare-fun _$35!451 () Unit!37073)

(assert (=> d!131451 (= (choose!1774 lt!502693 (ite (or c!110224 c!110226) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110224 c!110226) zeroValue!944 minValue!944) k0!934) _$35!451)))

(declare-fun bs!32967 () Bool)

(assert (= bs!32967 d!131451))

(assert (=> bs!32967 m!1044783))

(assert (=> bs!32967 m!1044783))

(assert (=> bs!32967 m!1044785))

(assert (=> d!131327 d!131451))

(assert (=> d!131327 d!131311))

(assert (=> b!1131909 d!131415))

(declare-fun d!131453 () Bool)

(assert (=> d!131453 (= (isEmpty!973 lt!502850) (isEmpty!974 (toList!8007 lt!502850)))))

(declare-fun bs!32968 () Bool)

(assert (= bs!32968 d!131453))

(declare-fun m!1045327 () Bool)

(assert (=> bs!32968 m!1045327))

(assert (=> b!1131950 d!131453))

(declare-fun d!131455 () Bool)

(assert (=> d!131455 (= (isEmpty!973 lt!502833) (isEmpty!974 (toList!8007 lt!502833)))))

(declare-fun bs!32969 () Bool)

(assert (= bs!32969 d!131455))

(declare-fun m!1045329 () Bool)

(assert (=> bs!32969 m!1045329))

(assert (=> b!1131920 d!131455))

(declare-fun d!131457 () Bool)

(assert (=> d!131457 (= (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131857 d!131457))

(declare-fun d!131459 () Bool)

(declare-fun res!756192 () Bool)

(declare-fun e!644327 () Bool)

(assert (=> d!131459 (=> res!756192 e!644327)))

(assert (=> d!131459 (= res!756192 (and ((_ is Cons!24774) (toList!8007 (ite c!110224 lt!502694 call!48720))) (= (_1!9018 (h!25983 (toList!8007 (ite c!110224 lt!502694 call!48720)))) k0!934)))))

(assert (=> d!131459 (= (containsKey!585 (toList!8007 (ite c!110224 lt!502694 call!48720)) k0!934) e!644327)))

(declare-fun b!1132154 () Bool)

(declare-fun e!644328 () Bool)

(assert (=> b!1132154 (= e!644327 e!644328)))

(declare-fun res!756193 () Bool)

(assert (=> b!1132154 (=> (not res!756193) (not e!644328))))

(assert (=> b!1132154 (= res!756193 (and (or (not ((_ is Cons!24774) (toList!8007 (ite c!110224 lt!502694 call!48720)))) (bvsle (_1!9018 (h!25983 (toList!8007 (ite c!110224 lt!502694 call!48720)))) k0!934)) ((_ is Cons!24774) (toList!8007 (ite c!110224 lt!502694 call!48720))) (bvslt (_1!9018 (h!25983 (toList!8007 (ite c!110224 lt!502694 call!48720)))) k0!934)))))

(declare-fun b!1132155 () Bool)

(assert (=> b!1132155 (= e!644328 (containsKey!585 (t!35707 (toList!8007 (ite c!110224 lt!502694 call!48720))) k0!934))))

(assert (= (and d!131459 (not res!756192)) b!1132154))

(assert (= (and b!1132154 res!756193) b!1132155))

(declare-fun m!1045331 () Bool)

(assert (=> b!1132155 m!1045331))

(assert (=> d!131317 d!131459))

(declare-fun d!131461 () Bool)

(declare-fun e!644331 () Bool)

(assert (=> d!131461 e!644331))

(declare-fun c!110339 () Bool)

(assert (=> d!131461 (= c!110339 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!131461 true))

(declare-fun _$29!186 () Unit!37073)

(assert (=> d!131461 (= (choose!1775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$29!186)))

(declare-fun b!1132160 () Bool)

(assert (=> b!1132160 (= e!644331 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132161 () Bool)

(assert (=> b!1132161 (= e!644331 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131461 c!110339) b!1132160))

(assert (= (and d!131461 (not c!110339)) b!1132161))

(assert (=> b!1132160 m!1044561))

(assert (=> d!131337 d!131461))

(assert (=> d!131337 d!131303))

(assert (=> b!1131855 d!131361))

(declare-fun b!1132162 () Bool)

(declare-fun e!644335 () Bool)

(declare-fun e!644332 () Bool)

(assert (=> b!1132162 (= e!644335 e!644332)))

(declare-fun res!756196 () Bool)

(assert (=> b!1132162 (=> (not res!756196) (not e!644332))))

(declare-fun e!644334 () Bool)

(assert (=> b!1132162 (= res!756196 (not e!644334))))

(declare-fun res!756194 () Bool)

(assert (=> b!1132162 (=> (not res!756194) (not e!644334))))

(assert (=> b!1132162 (= res!756194 (validKeyInArray!0 (select (arr!35549 lt!502695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!110340 () Bool)

(declare-fun bm!48780 () Bool)

(declare-fun call!48783 () Bool)

(assert (=> bm!48780 (= call!48783 (arrayNoDuplicates!0 lt!502695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!110340 (Cons!24773 (select (arr!35549 lt!502695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!110288 (Cons!24773 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) Nil!24774) Nil!24774)) (ite c!110288 (Cons!24773 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) Nil!24774) Nil!24774))))))

(declare-fun b!1132163 () Bool)

(declare-fun e!644333 () Bool)

(assert (=> b!1132163 (= e!644333 call!48783)))

(declare-fun b!1132164 () Bool)

(assert (=> b!1132164 (= e!644333 call!48783)))

(declare-fun d!131463 () Bool)

(declare-fun res!756195 () Bool)

(assert (=> d!131463 (=> res!756195 e!644335)))

(assert (=> d!131463 (= res!756195 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(assert (=> d!131463 (= (arrayNoDuplicates!0 lt!502695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110288 (Cons!24773 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) Nil!24774) Nil!24774)) e!644335)))

(declare-fun b!1132165 () Bool)

(assert (=> b!1132165 (= e!644334 (contains!6532 (ite c!110288 (Cons!24773 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) Nil!24774) Nil!24774) (select (arr!35549 lt!502695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132166 () Bool)

(assert (=> b!1132166 (= e!644332 e!644333)))

(assert (=> b!1132166 (= c!110340 (validKeyInArray!0 (select (arr!35549 lt!502695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!131463 (not res!756195)) b!1132162))

(assert (= (and b!1132162 res!756194) b!1132165))

(assert (= (and b!1132162 res!756196) b!1132166))

(assert (= (and b!1132166 c!110340) b!1132163))

(assert (= (and b!1132166 (not c!110340)) b!1132164))

(assert (= (or b!1132163 b!1132164) bm!48780))

(assert (=> b!1132162 m!1045127))

(assert (=> b!1132162 m!1045127))

(assert (=> b!1132162 m!1045135))

(assert (=> bm!48780 m!1045127))

(declare-fun m!1045333 () Bool)

(assert (=> bm!48780 m!1045333))

(assert (=> b!1132165 m!1045127))

(assert (=> b!1132165 m!1045127))

(declare-fun m!1045335 () Bool)

(assert (=> b!1132165 m!1045335))

(assert (=> b!1132166 m!1045127))

(assert (=> b!1132166 m!1045127))

(assert (=> b!1132166 m!1045135))

(assert (=> bm!48766 d!131463))

(assert (=> d!131301 d!131299))

(declare-fun d!131465 () Bool)

(assert (=> d!131465 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!131465 true))

(declare-fun _$60!445 () Unit!37073)

(assert (=> d!131465 (= (choose!13 _keys!1208 k0!934 i!673) _$60!445)))

(declare-fun bs!32970 () Bool)

(assert (= bs!32970 d!131465))

(assert (=> bs!32970 m!1044607))

(assert (=> d!131301 d!131465))

(assert (=> bm!48765 d!131313))

(declare-fun b!1132168 () Bool)

(declare-fun e!644336 () Option!679)

(declare-fun e!644337 () Option!679)

(assert (=> b!1132168 (= e!644336 e!644337)))

(declare-fun c!110342 () Bool)

(assert (=> b!1132168 (= c!110342 (and ((_ is Cons!24774) (toList!8007 lt!502751)) (not (= (_1!9018 (h!25983 (toList!8007 lt!502751))) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1132167 () Bool)

(assert (=> b!1132167 (= e!644336 (Some!678 (_2!9018 (h!25983 (toList!8007 lt!502751)))))))

(declare-fun b!1132169 () Bool)

(assert (=> b!1132169 (= e!644337 (getValueByKey!628 (t!35707 (toList!8007 lt!502751)) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun d!131467 () Bool)

(declare-fun c!110341 () Bool)

(assert (=> d!131467 (= c!110341 (and ((_ is Cons!24774) (toList!8007 lt!502751)) (= (_1!9018 (h!25983 (toList!8007 lt!502751))) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!131467 (= (getValueByKey!628 (toList!8007 lt!502751) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!644336)))

(declare-fun b!1132170 () Bool)

(assert (=> b!1132170 (= e!644337 None!677)))

(assert (= (and d!131467 c!110341) b!1132167))

(assert (= (and d!131467 (not c!110341)) b!1132168))

(assert (= (and b!1132168 c!110342) b!1132169))

(assert (= (and b!1132168 (not c!110342)) b!1132170))

(declare-fun m!1045337 () Bool)

(assert (=> b!1132169 m!1045337))

(assert (=> b!1131806 d!131467))

(assert (=> bm!48758 d!131355))

(declare-fun d!131469 () Bool)

(assert (=> d!131469 (= (isDefined!454 (getValueByKey!628 (toList!8007 lt!502693) k0!934)) (not (isEmpty!975 (getValueByKey!628 (toList!8007 lt!502693) k0!934))))))

(declare-fun bs!32971 () Bool)

(assert (= bs!32971 d!131469))

(assert (=> bs!32971 m!1044727))

(declare-fun m!1045339 () Bool)

(assert (=> bs!32971 m!1045339))

(assert (=> b!1131828 d!131469))

(declare-fun b!1132172 () Bool)

(declare-fun e!644338 () Option!679)

(declare-fun e!644339 () Option!679)

(assert (=> b!1132172 (= e!644338 e!644339)))

(declare-fun c!110344 () Bool)

(assert (=> b!1132172 (= c!110344 (and ((_ is Cons!24774) (toList!8007 lt!502693)) (not (= (_1!9018 (h!25983 (toList!8007 lt!502693))) k0!934))))))

(declare-fun b!1132171 () Bool)

(assert (=> b!1132171 (= e!644338 (Some!678 (_2!9018 (h!25983 (toList!8007 lt!502693)))))))

(declare-fun b!1132173 () Bool)

(assert (=> b!1132173 (= e!644339 (getValueByKey!628 (t!35707 (toList!8007 lt!502693)) k0!934))))

(declare-fun d!131471 () Bool)

(declare-fun c!110343 () Bool)

(assert (=> d!131471 (= c!110343 (and ((_ is Cons!24774) (toList!8007 lt!502693)) (= (_1!9018 (h!25983 (toList!8007 lt!502693))) k0!934)))))

(assert (=> d!131471 (= (getValueByKey!628 (toList!8007 lt!502693) k0!934) e!644338)))

(declare-fun b!1132174 () Bool)

(assert (=> b!1132174 (= e!644339 None!677)))

(assert (= (and d!131471 c!110343) b!1132171))

(assert (= (and d!131471 (not c!110343)) b!1132172))

(assert (= (and b!1132172 c!110344) b!1132173))

(assert (= (and b!1132172 (not c!110344)) b!1132174))

(declare-fun m!1045341 () Bool)

(assert (=> b!1132173 m!1045341))

(assert (=> b!1131828 d!131471))

(declare-fun d!131473 () Bool)

(declare-fun e!644341 () Bool)

(assert (=> d!131473 e!644341))

(declare-fun res!756197 () Bool)

(assert (=> d!131473 (=> res!756197 e!644341)))

(declare-fun lt!502978 () Bool)

(assert (=> d!131473 (= res!756197 (not lt!502978))))

(declare-fun lt!502980 () Bool)

(assert (=> d!131473 (= lt!502978 lt!502980)))

(declare-fun lt!502979 () Unit!37073)

(declare-fun e!644340 () Unit!37073)

(assert (=> d!131473 (= lt!502979 e!644340)))

(declare-fun c!110345 () Bool)

(assert (=> d!131473 (= c!110345 lt!502980)))

(assert (=> d!131473 (= lt!502980 (containsKey!585 (toList!8007 (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800))) lt!502796))))

(assert (=> d!131473 (= (contains!6529 (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800)) lt!502796) lt!502978)))

(declare-fun b!1132175 () Bool)

(declare-fun lt!502977 () Unit!37073)

(assert (=> b!1132175 (= e!644340 lt!502977)))

(assert (=> b!1132175 (= lt!502977 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800))) lt!502796))))

(assert (=> b!1132175 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800))) lt!502796))))

(declare-fun b!1132176 () Bool)

(declare-fun Unit!37091 () Unit!37073)

(assert (=> b!1132176 (= e!644340 Unit!37091)))

(declare-fun b!1132177 () Bool)

(assert (=> b!1132177 (= e!644341 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800))) lt!502796)))))

(assert (= (and d!131473 c!110345) b!1132175))

(assert (= (and d!131473 (not c!110345)) b!1132176))

(assert (= (and d!131473 (not res!756197)) b!1132177))

(declare-fun m!1045343 () Bool)

(assert (=> d!131473 m!1045343))

(declare-fun m!1045345 () Bool)

(assert (=> b!1132175 m!1045345))

(declare-fun m!1045347 () Bool)

(assert (=> b!1132175 m!1045347))

(assert (=> b!1132175 m!1045347))

(declare-fun m!1045349 () Bool)

(assert (=> b!1132175 m!1045349))

(assert (=> b!1132177 m!1045347))

(assert (=> b!1132177 m!1045347))

(assert (=> b!1132177 m!1045349))

(assert (=> b!1131863 d!131473))

(declare-fun d!131475 () Bool)

(declare-fun c!110346 () Bool)

(assert (=> d!131475 (= c!110346 ((_ is ValueCellFull!13524) (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!644342 () V!43083)

(assert (=> d!131475 (= (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644342)))

(declare-fun b!1132178 () Bool)

(assert (=> b!1132178 (= e!644342 (get!18074 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132179 () Bool)

(assert (=> b!1132179 (= e!644342 (get!18075 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131475 c!110346) b!1132178))

(assert (= (and d!131475 (not c!110346)) b!1132179))

(assert (=> b!1132178 m!1044735))

(assert (=> b!1132178 m!1044589))

(declare-fun m!1045351 () Bool)

(assert (=> b!1132178 m!1045351))

(assert (=> b!1132179 m!1044735))

(assert (=> b!1132179 m!1044589))

(declare-fun m!1045353 () Bool)

(assert (=> b!1132179 m!1045353))

(assert (=> b!1131863 d!131475))

(declare-fun d!131477 () Bool)

(assert (=> d!131477 (not (contains!6529 (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800)) lt!502796))))

(declare-fun lt!502981 () Unit!37073)

(assert (=> d!131477 (= lt!502981 (choose!1777 lt!502798 lt!502797 lt!502800 lt!502796))))

(declare-fun e!644343 () Bool)

(assert (=> d!131477 e!644343))

(declare-fun res!756198 () Bool)

(assert (=> d!131477 (=> (not res!756198) (not e!644343))))

(assert (=> d!131477 (= res!756198 (not (contains!6529 lt!502798 lt!502796)))))

(assert (=> d!131477 (= (addStillNotContains!283 lt!502798 lt!502797 lt!502800 lt!502796) lt!502981)))

(declare-fun b!1132180 () Bool)

(assert (=> b!1132180 (= e!644343 (not (= lt!502797 lt!502796)))))

(assert (= (and d!131477 res!756198) b!1132180))

(assert (=> d!131477 m!1044751))

(assert (=> d!131477 m!1044751))

(assert (=> d!131477 m!1044753))

(declare-fun m!1045355 () Bool)

(assert (=> d!131477 m!1045355))

(declare-fun m!1045357 () Bool)

(assert (=> d!131477 m!1045357))

(assert (=> b!1131863 d!131477))

(declare-fun d!131479 () Bool)

(declare-fun e!644344 () Bool)

(assert (=> d!131479 e!644344))

(declare-fun res!756200 () Bool)

(assert (=> d!131479 (=> (not res!756200) (not e!644344))))

(declare-fun lt!502982 () ListLongMap!15983)

(assert (=> d!131479 (= res!756200 (contains!6529 lt!502982 (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502983 () List!24778)

(assert (=> d!131479 (= lt!502982 (ListLongMap!15984 lt!502983))))

(declare-fun lt!502984 () Unit!37073)

(declare-fun lt!502985 () Unit!37073)

(assert (=> d!131479 (= lt!502984 lt!502985)))

(assert (=> d!131479 (= (getValueByKey!628 lt!502983 (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131479 (= lt!502985 (lemmaContainsTupThenGetReturnValue!305 lt!502983 (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131479 (= lt!502983 (insertStrictlySorted!398 (toList!8007 call!48751) (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131479 (= (+!3451 call!48751 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502982)))

(declare-fun b!1132181 () Bool)

(declare-fun res!756199 () Bool)

(assert (=> b!1132181 (=> (not res!756199) (not e!644344))))

(assert (=> b!1132181 (= res!756199 (= (getValueByKey!628 (toList!8007 lt!502982) (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1132182 () Bool)

(assert (=> b!1132182 (= e!644344 (contains!6531 (toList!8007 lt!502982) (tuple2!18015 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131479 res!756200) b!1132181))

(assert (= (and b!1132181 res!756199) b!1132182))

(declare-fun m!1045359 () Bool)

(assert (=> d!131479 m!1045359))

(declare-fun m!1045361 () Bool)

(assert (=> d!131479 m!1045361))

(declare-fun m!1045363 () Bool)

(assert (=> d!131479 m!1045363))

(declare-fun m!1045365 () Bool)

(assert (=> d!131479 m!1045365))

(declare-fun m!1045367 () Bool)

(assert (=> b!1132181 m!1045367))

(declare-fun m!1045369 () Bool)

(assert (=> b!1132182 m!1045369))

(assert (=> b!1131863 d!131479))

(declare-fun d!131481 () Bool)

(declare-fun e!644345 () Bool)

(assert (=> d!131481 e!644345))

(declare-fun res!756202 () Bool)

(assert (=> d!131481 (=> (not res!756202) (not e!644345))))

(declare-fun lt!502986 () ListLongMap!15983)

(assert (=> d!131481 (= res!756202 (contains!6529 lt!502986 (_1!9018 (tuple2!18015 lt!502797 lt!502800))))))

(declare-fun lt!502987 () List!24778)

(assert (=> d!131481 (= lt!502986 (ListLongMap!15984 lt!502987))))

(declare-fun lt!502988 () Unit!37073)

(declare-fun lt!502989 () Unit!37073)

(assert (=> d!131481 (= lt!502988 lt!502989)))

(assert (=> d!131481 (= (getValueByKey!628 lt!502987 (_1!9018 (tuple2!18015 lt!502797 lt!502800))) (Some!678 (_2!9018 (tuple2!18015 lt!502797 lt!502800))))))

(assert (=> d!131481 (= lt!502989 (lemmaContainsTupThenGetReturnValue!305 lt!502987 (_1!9018 (tuple2!18015 lt!502797 lt!502800)) (_2!9018 (tuple2!18015 lt!502797 lt!502800))))))

(assert (=> d!131481 (= lt!502987 (insertStrictlySorted!398 (toList!8007 lt!502798) (_1!9018 (tuple2!18015 lt!502797 lt!502800)) (_2!9018 (tuple2!18015 lt!502797 lt!502800))))))

(assert (=> d!131481 (= (+!3451 lt!502798 (tuple2!18015 lt!502797 lt!502800)) lt!502986)))

(declare-fun b!1132183 () Bool)

(declare-fun res!756201 () Bool)

(assert (=> b!1132183 (=> (not res!756201) (not e!644345))))

(assert (=> b!1132183 (= res!756201 (= (getValueByKey!628 (toList!8007 lt!502986) (_1!9018 (tuple2!18015 lt!502797 lt!502800))) (Some!678 (_2!9018 (tuple2!18015 lt!502797 lt!502800)))))))

(declare-fun b!1132184 () Bool)

(assert (=> b!1132184 (= e!644345 (contains!6531 (toList!8007 lt!502986) (tuple2!18015 lt!502797 lt!502800)))))

(assert (= (and d!131481 res!756202) b!1132183))

(assert (= (and b!1132183 res!756201) b!1132184))

(declare-fun m!1045371 () Bool)

(assert (=> d!131481 m!1045371))

(declare-fun m!1045373 () Bool)

(assert (=> d!131481 m!1045373))

(declare-fun m!1045375 () Bool)

(assert (=> d!131481 m!1045375))

(declare-fun m!1045377 () Bool)

(assert (=> d!131481 m!1045377))

(declare-fun m!1045379 () Bool)

(assert (=> b!1132183 m!1045379))

(declare-fun m!1045381 () Bool)

(assert (=> b!1132184 m!1045381))

(assert (=> b!1131863 d!131481))

(assert (=> bm!48756 d!131417))

(declare-fun d!131483 () Bool)

(assert (=> d!131483 (= (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)) (not (isEmpty!975 (getValueByKey!628 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))))

(declare-fun bs!32972 () Bool)

(assert (= bs!32972 d!131483))

(assert (=> bs!32972 m!1044707))

(declare-fun m!1045383 () Bool)

(assert (=> bs!32972 m!1045383))

(assert (=> b!1131823 d!131483))

(declare-fun b!1132186 () Bool)

(declare-fun e!644346 () Option!679)

(declare-fun e!644347 () Option!679)

(assert (=> b!1132186 (= e!644346 e!644347)))

(declare-fun c!110348 () Bool)

(assert (=> b!1132186 (= c!110348 (and ((_ is Cons!24774) (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (not (= (_1!9018 (h!25983 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934))))))

(declare-fun b!1132185 () Bool)

(assert (=> b!1132185 (= e!644346 (Some!678 (_2!9018 (h!25983 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1132187 () Bool)

(assert (=> b!1132187 (= e!644347 (getValueByKey!628 (t!35707 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(declare-fun c!110347 () Bool)

(declare-fun d!131485 () Bool)

(assert (=> d!131485 (= c!110347 (and ((_ is Cons!24774) (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9018 (h!25983 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!131485 (= (getValueByKey!628 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!644346)))

(declare-fun b!1132188 () Bool)

(assert (=> b!1132188 (= e!644347 None!677)))

(assert (= (and d!131485 c!110347) b!1132185))

(assert (= (and d!131485 (not c!110347)) b!1132186))

(assert (= (and b!1132186 c!110348) b!1132187))

(assert (= (and b!1132186 (not c!110348)) b!1132188))

(declare-fun m!1045385 () Bool)

(assert (=> b!1132187 m!1045385))

(assert (=> b!1131823 d!131485))

(declare-fun d!131487 () Bool)

(declare-fun e!644349 () Bool)

(assert (=> d!131487 e!644349))

(declare-fun res!756203 () Bool)

(assert (=> d!131487 (=> res!756203 e!644349)))

(declare-fun lt!502991 () Bool)

(assert (=> d!131487 (= res!756203 (not lt!502991))))

(declare-fun lt!502993 () Bool)

(assert (=> d!131487 (= lt!502991 lt!502993)))

(declare-fun lt!502992 () Unit!37073)

(declare-fun e!644348 () Unit!37073)

(assert (=> d!131487 (= lt!502992 e!644348)))

(declare-fun c!110349 () Bool)

(assert (=> d!131487 (= c!110349 lt!502993)))

(assert (=> d!131487 (= lt!502993 (containsKey!585 (toList!8007 lt!502833) (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!131487 (= (contains!6529 lt!502833 (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))) lt!502991)))

(declare-fun b!1132189 () Bool)

(declare-fun lt!502990 () Unit!37073)

(assert (=> b!1132189 (= e!644348 lt!502990)))

(assert (=> b!1132189 (= lt!502990 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502833) (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132189 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502833) (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132190 () Bool)

(declare-fun Unit!37092 () Unit!37073)

(assert (=> b!1132190 (= e!644348 Unit!37092)))

(declare-fun b!1132191 () Bool)

(assert (=> b!1132191 (= e!644349 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502833) (select (arr!35549 (ite c!110222 _keys!1208 lt!502695)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!131487 c!110349) b!1132189))

(assert (= (and d!131487 (not c!110349)) b!1132190))

(assert (= (and d!131487 (not res!756203)) b!1132191))

(assert (=> d!131487 m!1044841))

(declare-fun m!1045387 () Bool)

(assert (=> d!131487 m!1045387))

(assert (=> b!1132189 m!1044841))

(declare-fun m!1045389 () Bool)

(assert (=> b!1132189 m!1045389))

(assert (=> b!1132189 m!1044841))

(assert (=> b!1132189 m!1045301))

(assert (=> b!1132189 m!1045301))

(declare-fun m!1045391 () Bool)

(assert (=> b!1132189 m!1045391))

(assert (=> b!1132191 m!1044841))

(assert (=> b!1132191 m!1045301))

(assert (=> b!1132191 m!1045301))

(assert (=> b!1132191 m!1045391))

(assert (=> b!1131924 d!131487))

(declare-fun d!131489 () Bool)

(assert (=> d!131489 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502693) k0!934))))

(declare-fun lt!502994 () Unit!37073)

(assert (=> d!131489 (= lt!502994 (choose!1778 (toList!8007 lt!502693) k0!934))))

(declare-fun e!644350 () Bool)

(assert (=> d!131489 e!644350))

(declare-fun res!756204 () Bool)

(assert (=> d!131489 (=> (not res!756204) (not e!644350))))

(assert (=> d!131489 (= res!756204 (isStrictlySorted!727 (toList!8007 lt!502693)))))

(assert (=> d!131489 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502693) k0!934) lt!502994)))

(declare-fun b!1132192 () Bool)

(assert (=> b!1132192 (= e!644350 (containsKey!585 (toList!8007 lt!502693) k0!934))))

(assert (= (and d!131489 res!756204) b!1132192))

(assert (=> d!131489 m!1044727))

(assert (=> d!131489 m!1044727))

(assert (=> d!131489 m!1044729))

(declare-fun m!1045393 () Bool)

(assert (=> d!131489 m!1045393))

(declare-fun m!1045395 () Bool)

(assert (=> d!131489 m!1045395))

(assert (=> b!1132192 m!1044723))

(assert (=> b!1131826 d!131489))

(assert (=> b!1131826 d!131469))

(assert (=> b!1131826 d!131471))

(assert (=> b!1131861 d!131457))

(declare-fun d!131491 () Bool)

(declare-fun e!644352 () Bool)

(assert (=> d!131491 e!644352))

(declare-fun res!756205 () Bool)

(assert (=> d!131491 (=> res!756205 e!644352)))

(declare-fun lt!502996 () Bool)

(assert (=> d!131491 (= res!756205 (not lt!502996))))

(declare-fun lt!502998 () Bool)

(assert (=> d!131491 (= lt!502996 lt!502998)))

(declare-fun lt!502997 () Unit!37073)

(declare-fun e!644351 () Unit!37073)

(assert (=> d!131491 (= lt!502997 e!644351)))

(declare-fun c!110350 () Bool)

(assert (=> d!131491 (= c!110350 lt!502998)))

(assert (=> d!131491 (= lt!502998 (containsKey!585 (toList!8007 lt!502843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131491 (= (contains!6529 lt!502843 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502996)))

(declare-fun b!1132193 () Bool)

(declare-fun lt!502995 () Unit!37073)

(assert (=> b!1132193 (= e!644351 lt!502995)))

(assert (=> b!1132193 (= lt!502995 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132193 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132194 () Bool)

(declare-fun Unit!37093 () Unit!37073)

(assert (=> b!1132194 (= e!644351 Unit!37093)))

(declare-fun b!1132195 () Bool)

(assert (=> b!1132195 (= e!644352 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131491 c!110350) b!1132193))

(assert (= (and d!131491 (not c!110350)) b!1132194))

(assert (= (and d!131491 (not res!756205)) b!1132195))

(declare-fun m!1045397 () Bool)

(assert (=> d!131491 m!1045397))

(declare-fun m!1045399 () Bool)

(assert (=> b!1132193 m!1045399))

(declare-fun m!1045401 () Bool)

(assert (=> b!1132193 m!1045401))

(assert (=> b!1132193 m!1045401))

(declare-fun m!1045403 () Bool)

(assert (=> b!1132193 m!1045403))

(assert (=> b!1132195 m!1045401))

(assert (=> b!1132195 m!1045401))

(assert (=> b!1132195 m!1045403))

(assert (=> b!1131940 d!131491))

(declare-fun b!1132196 () Bool)

(declare-fun e!644356 () Bool)

(declare-fun e!644353 () Bool)

(assert (=> b!1132196 (= e!644356 e!644353)))

(declare-fun res!756208 () Bool)

(assert (=> b!1132196 (=> (not res!756208) (not e!644353))))

(declare-fun e!644355 () Bool)

(assert (=> b!1132196 (= res!756208 (not e!644355))))

(declare-fun res!756206 () Bool)

(assert (=> b!1132196 (=> (not res!756206) (not e!644355))))

(assert (=> b!1132196 (= res!756206 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!110351 () Bool)

(declare-fun bm!48781 () Bool)

(declare-fun call!48784 () Bool)

(assert (=> bm!48781 (= call!48784 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!110351 (Cons!24773 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!110264 (Cons!24773 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) Nil!24774) Nil!24774)) (ite c!110264 (Cons!24773 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) Nil!24774) Nil!24774))))))

(declare-fun b!1132197 () Bool)

(declare-fun e!644354 () Bool)

(assert (=> b!1132197 (= e!644354 call!48784)))

(declare-fun b!1132198 () Bool)

(assert (=> b!1132198 (= e!644354 call!48784)))

(declare-fun d!131493 () Bool)

(declare-fun res!756207 () Bool)

(assert (=> d!131493 (=> res!756207 e!644356)))

(assert (=> d!131493 (= res!756207 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(assert (=> d!131493 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110264 (Cons!24773 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) Nil!24774) Nil!24774)) e!644356)))

(declare-fun b!1132199 () Bool)

(assert (=> b!1132199 (= e!644355 (contains!6532 (ite c!110264 (Cons!24773 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) Nil!24774) Nil!24774) (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132200 () Bool)

(assert (=> b!1132200 (= e!644353 e!644354)))

(assert (=> b!1132200 (= c!110351 (validKeyInArray!0 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!131493 (not res!756207)) b!1132196))

(assert (= (and b!1132196 res!756206) b!1132199))

(assert (= (and b!1132196 res!756208) b!1132200))

(assert (= (and b!1132200 c!110351) b!1132197))

(assert (= (and b!1132200 (not c!110351)) b!1132198))

(assert (= (or b!1132197 b!1132198) bm!48781))

(assert (=> b!1132196 m!1045051))

(assert (=> b!1132196 m!1045051))

(assert (=> b!1132196 m!1045059))

(assert (=> bm!48781 m!1045051))

(declare-fun m!1045405 () Bool)

(assert (=> bm!48781 m!1045405))

(assert (=> b!1132199 m!1045051))

(assert (=> b!1132199 m!1045051))

(declare-fun m!1045407 () Bool)

(assert (=> b!1132199 m!1045407))

(assert (=> b!1132200 m!1045051))

(assert (=> b!1132200 m!1045051))

(assert (=> b!1132200 m!1045059))

(assert (=> bm!48754 d!131493))

(declare-fun d!131495 () Bool)

(assert (=> d!131495 (= (isEmpty!973 lt!502843) (isEmpty!974 (toList!8007 lt!502843)))))

(declare-fun bs!32973 () Bool)

(assert (= bs!32973 d!131495))

(declare-fun m!1045409 () Bool)

(assert (=> bs!32973 m!1045409))

(assert (=> b!1131938 d!131495))

(declare-fun d!131497 () Bool)

(assert (=> d!131497 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun lt!502999 () Unit!37073)

(assert (=> d!131497 (= lt!502999 (choose!1778 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun e!644357 () Bool)

(assert (=> d!131497 e!644357))

(declare-fun res!756209 () Bool)

(assert (=> d!131497 (=> (not res!756209) (not e!644357))))

(assert (=> d!131497 (= res!756209 (isStrictlySorted!727 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131497 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) lt!502999)))

(declare-fun b!1132201 () Bool)

(assert (=> b!1132201 (= e!644357 (containsKey!585 (toList!8007 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (= (and d!131497 res!756209) b!1132201))

(assert (=> d!131497 m!1044707))

(assert (=> d!131497 m!1044707))

(assert (=> d!131497 m!1044709))

(declare-fun m!1045411 () Bool)

(assert (=> d!131497 m!1045411))

(declare-fun m!1045413 () Bool)

(assert (=> d!131497 m!1045413))

(assert (=> b!1132201 m!1044703))

(assert (=> b!1131821 d!131497))

(assert (=> b!1131821 d!131483))

(assert (=> b!1131821 d!131485))

(declare-fun d!131499 () Bool)

(assert (=> d!131499 (= (apply!955 lt!502826 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18076 (getValueByKey!628 (toList!8007 lt!502826) (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32974 () Bool)

(assert (= bs!32974 d!131499))

(assert (=> bs!32974 m!1044813))

(declare-fun m!1045415 () Bool)

(assert (=> bs!32974 m!1045415))

(assert (=> bs!32974 m!1045415))

(declare-fun m!1045417 () Bool)

(assert (=> bs!32974 m!1045417))

(assert (=> b!1131901 d!131499))

(assert (=> b!1131901 d!131433))

(assert (=> b!1131929 d!131325))

(assert (=> b!1131968 d!131363))

(declare-fun d!131501 () Bool)

(declare-fun lt!503000 () Bool)

(assert (=> d!131501 (= lt!503000 (select (content!540 (toList!8007 lt!502773)) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun e!644358 () Bool)

(assert (=> d!131501 (= lt!503000 e!644358)))

(declare-fun res!756210 () Bool)

(assert (=> d!131501 (=> (not res!756210) (not e!644358))))

(assert (=> d!131501 (= res!756210 ((_ is Cons!24774) (toList!8007 lt!502773)))))

(assert (=> d!131501 (= (contains!6531 (toList!8007 lt!502773) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!503000)))

(declare-fun b!1132202 () Bool)

(declare-fun e!644359 () Bool)

(assert (=> b!1132202 (= e!644358 e!644359)))

(declare-fun res!756211 () Bool)

(assert (=> b!1132202 (=> res!756211 e!644359)))

(assert (=> b!1132202 (= res!756211 (= (h!25983 (toList!8007 lt!502773)) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1132203 () Bool)

(assert (=> b!1132203 (= e!644359 (contains!6531 (t!35707 (toList!8007 lt!502773)) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131501 res!756210) b!1132202))

(assert (= (and b!1132202 (not res!756211)) b!1132203))

(declare-fun m!1045419 () Bool)

(assert (=> d!131501 m!1045419))

(declare-fun m!1045421 () Bool)

(assert (=> d!131501 m!1045421))

(declare-fun m!1045423 () Bool)

(assert (=> b!1132203 m!1045423))

(assert (=> b!1131825 d!131501))

(declare-fun d!131503 () Bool)

(declare-fun e!644361 () Bool)

(assert (=> d!131503 e!644361))

(declare-fun res!756212 () Bool)

(assert (=> d!131503 (=> res!756212 e!644361)))

(declare-fun lt!503002 () Bool)

(assert (=> d!131503 (= res!756212 (not lt!503002))))

(declare-fun lt!503004 () Bool)

(assert (=> d!131503 (= lt!503002 lt!503004)))

(declare-fun lt!503003 () Unit!37073)

(declare-fun e!644360 () Unit!37073)

(assert (=> d!131503 (= lt!503003 e!644360)))

(declare-fun c!110352 () Bool)

(assert (=> d!131503 (= c!110352 lt!503004)))

(assert (=> d!131503 (= lt!503004 (containsKey!585 (toList!8007 lt!502833) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131503 (= (contains!6529 lt!502833 #b1000000000000000000000000000000000000000000000000000000000000000) lt!503002)))

(declare-fun b!1132204 () Bool)

(declare-fun lt!503001 () Unit!37073)

(assert (=> b!1132204 (= e!644360 lt!503001)))

(assert (=> b!1132204 (= lt!503001 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502833) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132204 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502833) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132205 () Bool)

(declare-fun Unit!37094 () Unit!37073)

(assert (=> b!1132205 (= e!644360 Unit!37094)))

(declare-fun b!1132206 () Bool)

(assert (=> b!1132206 (= e!644361 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131503 c!110352) b!1132204))

(assert (= (and d!131503 (not c!110352)) b!1132205))

(assert (= (and d!131503 (not res!756212)) b!1132206))

(declare-fun m!1045425 () Bool)

(assert (=> d!131503 m!1045425))

(declare-fun m!1045427 () Bool)

(assert (=> b!1132204 m!1045427))

(declare-fun m!1045429 () Bool)

(assert (=> b!1132204 m!1045429))

(assert (=> b!1132204 m!1045429))

(declare-fun m!1045431 () Bool)

(assert (=> b!1132204 m!1045431))

(assert (=> b!1132206 m!1045429))

(assert (=> b!1132206 m!1045429))

(assert (=> b!1132206 m!1045431))

(assert (=> b!1131922 d!131503))

(declare-fun d!131505 () Bool)

(declare-fun e!644363 () Bool)

(assert (=> d!131505 e!644363))

(declare-fun res!756213 () Bool)

(assert (=> d!131505 (=> res!756213 e!644363)))

(declare-fun lt!503006 () Bool)

(assert (=> d!131505 (= res!756213 (not lt!503006))))

(declare-fun lt!503008 () Bool)

(assert (=> d!131505 (= lt!503006 lt!503008)))

(declare-fun lt!503007 () Unit!37073)

(declare-fun e!644362 () Unit!37073)

(assert (=> d!131505 (= lt!503007 e!644362)))

(declare-fun c!110353 () Bool)

(assert (=> d!131505 (= c!110353 lt!503008)))

(assert (=> d!131505 (= lt!503008 (containsKey!585 (toList!8007 lt!502850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131505 (= (contains!6529 lt!502850 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503006)))

(declare-fun b!1132207 () Bool)

(declare-fun lt!503005 () Unit!37073)

(assert (=> b!1132207 (= e!644362 lt!503005)))

(assert (=> b!1132207 (= lt!503005 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132207 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132208 () Bool)

(declare-fun Unit!37095 () Unit!37073)

(assert (=> b!1132208 (= e!644362 Unit!37095)))

(declare-fun b!1132209 () Bool)

(assert (=> b!1132209 (= e!644363 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131505 c!110353) b!1132207))

(assert (= (and d!131505 (not c!110353)) b!1132208))

(assert (= (and d!131505 (not res!756213)) b!1132209))

(declare-fun m!1045433 () Bool)

(assert (=> d!131505 m!1045433))

(declare-fun m!1045435 () Bool)

(assert (=> b!1132207 m!1045435))

(declare-fun m!1045437 () Bool)

(assert (=> b!1132207 m!1045437))

(assert (=> b!1132207 m!1045437))

(declare-fun m!1045439 () Bool)

(assert (=> b!1132207 m!1045439))

(assert (=> b!1132209 m!1045437))

(assert (=> b!1132209 m!1045437))

(assert (=> b!1132209 m!1045439))

(assert (=> d!131343 d!131505))

(assert (=> d!131343 d!131303))

(declare-fun d!131507 () Bool)

(declare-fun e!644365 () Bool)

(assert (=> d!131507 e!644365))

(declare-fun res!756214 () Bool)

(assert (=> d!131507 (=> res!756214 e!644365)))

(declare-fun lt!503010 () Bool)

(assert (=> d!131507 (= res!756214 (not lt!503010))))

(declare-fun lt!503012 () Bool)

(assert (=> d!131507 (= lt!503010 lt!503012)))

(declare-fun lt!503011 () Unit!37073)

(declare-fun e!644364 () Unit!37073)

(assert (=> d!131507 (= lt!503011 e!644364)))

(declare-fun c!110354 () Bool)

(assert (=> d!131507 (= c!110354 lt!503012)))

(assert (=> d!131507 (= lt!503012 (containsKey!585 (toList!8007 lt!502833) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131507 (= (contains!6529 lt!502833 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503010)))

(declare-fun b!1132210 () Bool)

(declare-fun lt!503009 () Unit!37073)

(assert (=> b!1132210 (= e!644364 lt!503009)))

(assert (=> b!1132210 (= lt!503009 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502833) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132210 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502833) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132211 () Bool)

(declare-fun Unit!37096 () Unit!37073)

(assert (=> b!1132211 (= e!644364 Unit!37096)))

(declare-fun b!1132212 () Bool)

(assert (=> b!1132212 (= e!644365 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502833) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131507 c!110354) b!1132210))

(assert (= (and d!131507 (not c!110354)) b!1132211))

(assert (= (and d!131507 (not res!756214)) b!1132212))

(declare-fun m!1045441 () Bool)

(assert (=> d!131507 m!1045441))

(declare-fun m!1045443 () Bool)

(assert (=> b!1132210 m!1045443))

(declare-fun m!1045445 () Bool)

(assert (=> b!1132210 m!1045445))

(assert (=> b!1132210 m!1045445))

(declare-fun m!1045447 () Bool)

(assert (=> b!1132210 m!1045447))

(assert (=> b!1132212 m!1045445))

(assert (=> b!1132212 m!1045445))

(assert (=> b!1132212 m!1045447))

(assert (=> d!131335 d!131507))

(assert (=> d!131335 d!131303))

(declare-fun d!131509 () Bool)

(assert (=> d!131509 (= (isEmpty!973 lt!502826) (isEmpty!974 (toList!8007 lt!502826)))))

(declare-fun bs!32975 () Bool)

(assert (= bs!32975 d!131509))

(declare-fun m!1045449 () Bool)

(assert (=> bs!32975 m!1045449))

(assert (=> b!1131908 d!131509))

(declare-fun d!131511 () Bool)

(assert (=> d!131511 (= (validKeyInArray!0 (select (arr!35549 _keys!1208) from!1455)) (and (not (= (select (arr!35549 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35549 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131947 d!131511))

(declare-fun d!131513 () Bool)

(declare-fun e!644367 () Bool)

(assert (=> d!131513 e!644367))

(declare-fun res!756215 () Bool)

(assert (=> d!131513 (=> res!756215 e!644367)))

(declare-fun lt!503014 () Bool)

(assert (=> d!131513 (= res!756215 (not lt!503014))))

(declare-fun lt!503016 () Bool)

(assert (=> d!131513 (= lt!503014 lt!503016)))

(declare-fun lt!503015 () Unit!37073)

(declare-fun e!644366 () Unit!37073)

(assert (=> d!131513 (= lt!503015 e!644366)))

(declare-fun c!110355 () Bool)

(assert (=> d!131513 (= c!110355 lt!503016)))

(assert (=> d!131513 (= lt!503016 (containsKey!585 (toList!8007 lt!502751) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131513 (= (contains!6529 lt!502751 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!503014)))

(declare-fun b!1132213 () Bool)

(declare-fun lt!503013 () Unit!37073)

(assert (=> b!1132213 (= e!644366 lt!503013)))

(assert (=> b!1132213 (= lt!503013 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502751) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1132213 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502751) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132214 () Bool)

(declare-fun Unit!37097 () Unit!37073)

(assert (=> b!1132214 (= e!644366 Unit!37097)))

(declare-fun b!1132215 () Bool)

(assert (=> b!1132215 (= e!644367 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502751) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!131513 c!110355) b!1132213))

(assert (= (and d!131513 (not c!110355)) b!1132214))

(assert (= (and d!131513 (not res!756215)) b!1132215))

(declare-fun m!1045451 () Bool)

(assert (=> d!131513 m!1045451))

(declare-fun m!1045453 () Bool)

(assert (=> b!1132213 m!1045453))

(assert (=> b!1132213 m!1044689))

(assert (=> b!1132213 m!1044689))

(declare-fun m!1045455 () Bool)

(assert (=> b!1132213 m!1045455))

(assert (=> b!1132215 m!1044689))

(assert (=> b!1132215 m!1044689))

(assert (=> b!1132215 m!1045455))

(assert (=> d!131297 d!131513))

(declare-fun b!1132217 () Bool)

(declare-fun e!644368 () Option!679)

(declare-fun e!644369 () Option!679)

(assert (=> b!1132217 (= e!644368 e!644369)))

(declare-fun c!110357 () Bool)

(assert (=> b!1132217 (= c!110357 (and ((_ is Cons!24774) lt!502752) (not (= (_1!9018 (h!25983 lt!502752)) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1132216 () Bool)

(assert (=> b!1132216 (= e!644368 (Some!678 (_2!9018 (h!25983 lt!502752))))))

(declare-fun b!1132218 () Bool)

(assert (=> b!1132218 (= e!644369 (getValueByKey!628 (t!35707 lt!502752) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun d!131515 () Bool)

(declare-fun c!110356 () Bool)

(assert (=> d!131515 (= c!110356 (and ((_ is Cons!24774) lt!502752) (= (_1!9018 (h!25983 lt!502752)) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!131515 (= (getValueByKey!628 lt!502752 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!644368)))

(declare-fun b!1132219 () Bool)

(assert (=> b!1132219 (= e!644369 None!677)))

(assert (= (and d!131515 c!110356) b!1132216))

(assert (= (and d!131515 (not c!110356)) b!1132217))

(assert (= (and b!1132217 c!110357) b!1132218))

(assert (= (and b!1132217 (not c!110357)) b!1132219))

(declare-fun m!1045457 () Bool)

(assert (=> b!1132218 m!1045457))

(assert (=> d!131297 d!131515))

(declare-fun d!131517 () Bool)

(assert (=> d!131517 (= (getValueByKey!628 lt!502752 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!678 (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!503019 () Unit!37073)

(declare-fun choose!1779 (List!24778 (_ BitVec 64) V!43083) Unit!37073)

(assert (=> d!131517 (= lt!503019 (choose!1779 lt!502752 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!644372 () Bool)

(assert (=> d!131517 e!644372))

(declare-fun res!756220 () Bool)

(assert (=> d!131517 (=> (not res!756220) (not e!644372))))

(assert (=> d!131517 (= res!756220 (isStrictlySorted!727 lt!502752))))

(assert (=> d!131517 (= (lemmaContainsTupThenGetReturnValue!305 lt!502752 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!503019)))

(declare-fun b!1132224 () Bool)

(declare-fun res!756221 () Bool)

(assert (=> b!1132224 (=> (not res!756221) (not e!644372))))

(assert (=> b!1132224 (= res!756221 (containsKey!585 lt!502752 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132225 () Bool)

(assert (=> b!1132225 (= e!644372 (contains!6531 lt!502752 (tuple2!18015 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!131517 res!756220) b!1132224))

(assert (= (and b!1132224 res!756221) b!1132225))

(assert (=> d!131517 m!1044683))

(declare-fun m!1045459 () Bool)

(assert (=> d!131517 m!1045459))

(declare-fun m!1045461 () Bool)

(assert (=> d!131517 m!1045461))

(declare-fun m!1045463 () Bool)

(assert (=> b!1132224 m!1045463))

(declare-fun m!1045465 () Bool)

(assert (=> b!1132225 m!1045465))

(assert (=> d!131297 d!131517))

(declare-fun b!1132246 () Bool)

(declare-fun e!644383 () List!24778)

(declare-fun e!644385 () List!24778)

(assert (=> b!1132246 (= e!644383 e!644385)))

(declare-fun c!110369 () Bool)

(assert (=> b!1132246 (= c!110369 (and ((_ is Cons!24774) (toList!8007 lt!502693)) (= (_1!9018 (h!25983 (toList!8007 lt!502693))) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1132247 () Bool)

(declare-fun e!644384 () List!24778)

(declare-fun call!48792 () List!24778)

(assert (=> b!1132247 (= e!644384 call!48792)))

(declare-fun b!1132248 () Bool)

(declare-fun res!756226 () Bool)

(declare-fun e!644387 () Bool)

(assert (=> b!1132248 (=> (not res!756226) (not e!644387))))

(declare-fun lt!503022 () List!24778)

(assert (=> b!1132248 (= res!756226 (containsKey!585 lt!503022 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132249 () Bool)

(assert (=> b!1132249 (= e!644387 (contains!6531 lt!503022 (tuple2!18015 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun bm!48788 () Bool)

(declare-fun call!48793 () List!24778)

(assert (=> bm!48788 (= call!48792 call!48793)))

(declare-fun bm!48789 () Bool)

(declare-fun call!48791 () List!24778)

(assert (=> bm!48789 (= call!48793 call!48791)))

(declare-fun c!110368 () Bool)

(declare-fun b!1132250 () Bool)

(assert (=> b!1132250 (= c!110368 (and ((_ is Cons!24774) (toList!8007 lt!502693)) (bvsgt (_1!9018 (h!25983 (toList!8007 lt!502693))) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> b!1132250 (= e!644385 e!644384)))

(declare-fun e!644386 () List!24778)

(declare-fun c!110367 () Bool)

(declare-fun bm!48790 () Bool)

(declare-fun $colon$colon!608 (List!24778 tuple2!18014) List!24778)

(assert (=> bm!48790 (= call!48791 ($colon$colon!608 e!644386 (ite c!110367 (h!25983 (toList!8007 lt!502693)) (tuple2!18015 (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!110366 () Bool)

(assert (=> bm!48790 (= c!110366 c!110367)))

(declare-fun b!1132251 () Bool)

(assert (=> b!1132251 (= e!644386 (ite c!110369 (t!35707 (toList!8007 lt!502693)) (ite c!110368 (Cons!24774 (h!25983 (toList!8007 lt!502693)) (t!35707 (toList!8007 lt!502693))) Nil!24775)))))

(declare-fun b!1132252 () Bool)

(assert (=> b!1132252 (= e!644385 call!48793)))

(declare-fun b!1132253 () Bool)

(assert (=> b!1132253 (= e!644384 call!48792)))

(declare-fun b!1132254 () Bool)

(assert (=> b!1132254 (= e!644383 call!48791)))

(declare-fun d!131519 () Bool)

(assert (=> d!131519 e!644387))

(declare-fun res!756227 () Bool)

(assert (=> d!131519 (=> (not res!756227) (not e!644387))))

(assert (=> d!131519 (= res!756227 (isStrictlySorted!727 lt!503022))))

(assert (=> d!131519 (= lt!503022 e!644383)))

(assert (=> d!131519 (= c!110367 (and ((_ is Cons!24774) (toList!8007 lt!502693)) (bvslt (_1!9018 (h!25983 (toList!8007 lt!502693))) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!131519 (isStrictlySorted!727 (toList!8007 lt!502693))))

(assert (=> d!131519 (= (insertStrictlySorted!398 (toList!8007 lt!502693) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!503022)))

(declare-fun b!1132255 () Bool)

(assert (=> b!1132255 (= e!644386 (insertStrictlySorted!398 (t!35707 (toList!8007 lt!502693)) (_1!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9018 (ite (or c!110224 c!110226) (tuple2!18015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131519 c!110367) b!1132254))

(assert (= (and d!131519 (not c!110367)) b!1132246))

(assert (= (and b!1132246 c!110369) b!1132252))

(assert (= (and b!1132246 (not c!110369)) b!1132250))

(assert (= (and b!1132250 c!110368) b!1132253))

(assert (= (and b!1132250 (not c!110368)) b!1132247))

(assert (= (or b!1132253 b!1132247) bm!48788))

(assert (= (or b!1132252 bm!48788) bm!48789))

(assert (= (or b!1132254 bm!48789) bm!48790))

(assert (= (and bm!48790 c!110366) b!1132255))

(assert (= (and bm!48790 (not c!110366)) b!1132251))

(assert (= (and d!131519 res!756227) b!1132248))

(assert (= (and b!1132248 res!756226) b!1132249))

(declare-fun m!1045467 () Bool)

(assert (=> bm!48790 m!1045467))

(declare-fun m!1045469 () Bool)

(assert (=> d!131519 m!1045469))

(assert (=> d!131519 m!1045395))

(declare-fun m!1045471 () Bool)

(assert (=> b!1132249 m!1045471))

(declare-fun m!1045473 () Bool)

(assert (=> b!1132255 m!1045473))

(declare-fun m!1045475 () Bool)

(assert (=> b!1132248 m!1045475))

(assert (=> d!131297 d!131519))

(declare-fun d!131521 () Bool)

(declare-fun e!644389 () Bool)

(assert (=> d!131521 e!644389))

(declare-fun res!756228 () Bool)

(assert (=> d!131521 (=> res!756228 e!644389)))

(declare-fun lt!503024 () Bool)

(assert (=> d!131521 (= res!756228 (not lt!503024))))

(declare-fun lt!503026 () Bool)

(assert (=> d!131521 (= lt!503024 lt!503026)))

(declare-fun lt!503025 () Unit!37073)

(declare-fun e!644388 () Unit!37073)

(assert (=> d!131521 (= lt!503025 e!644388)))

(declare-fun c!110370 () Bool)

(assert (=> d!131521 (= c!110370 lt!503026)))

(assert (=> d!131521 (= lt!503026 (containsKey!585 (toList!8007 lt!502821) k0!934))))

(assert (=> d!131521 (= (contains!6529 lt!502821 k0!934) lt!503024)))

(declare-fun b!1132256 () Bool)

(declare-fun lt!503023 () Unit!37073)

(assert (=> b!1132256 (= e!644388 lt!503023)))

(assert (=> b!1132256 (= lt!503023 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502821) k0!934))))

(assert (=> b!1132256 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502821) k0!934))))

(declare-fun b!1132257 () Bool)

(declare-fun Unit!37098 () Unit!37073)

(assert (=> b!1132257 (= e!644388 Unit!37098)))

(declare-fun b!1132258 () Bool)

(assert (=> b!1132258 (= e!644389 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502821) k0!934)))))

(assert (= (and d!131521 c!110370) b!1132256))

(assert (= (and d!131521 (not c!110370)) b!1132257))

(assert (= (and d!131521 (not res!756228)) b!1132258))

(declare-fun m!1045477 () Bool)

(assert (=> d!131521 m!1045477))

(declare-fun m!1045479 () Bool)

(assert (=> b!1132256 m!1045479))

(declare-fun m!1045481 () Bool)

(assert (=> b!1132256 m!1045481))

(assert (=> b!1132256 m!1045481))

(declare-fun m!1045483 () Bool)

(assert (=> b!1132256 m!1045483))

(assert (=> b!1132258 m!1045481))

(assert (=> b!1132258 m!1045481))

(assert (=> b!1132258 m!1045483))

(assert (=> d!131331 d!131521))

(declare-fun d!131523 () Bool)

(declare-fun e!644396 () Bool)

(assert (=> d!131523 e!644396))

(declare-fun res!756231 () Bool)

(assert (=> d!131523 (=> (not res!756231) (not e!644396))))

(declare-fun lt!503029 () List!24778)

(assert (=> d!131523 (= res!756231 (isStrictlySorted!727 lt!503029))))

(declare-fun e!644398 () List!24778)

(assert (=> d!131523 (= lt!503029 e!644398)))

(declare-fun c!110375 () Bool)

(assert (=> d!131523 (= c!110375 (and ((_ is Cons!24774) (toList!8007 call!48717)) (= (_1!9018 (h!25983 (toList!8007 call!48717))) k0!934)))))

(assert (=> d!131523 (isStrictlySorted!727 (toList!8007 call!48717))))

(assert (=> d!131523 (= (removeStrictlySorted!89 (toList!8007 call!48717) k0!934) lt!503029)))

(declare-fun b!1132269 () Bool)

(declare-fun e!644397 () List!24778)

(assert (=> b!1132269 (= e!644397 ($colon$colon!608 (removeStrictlySorted!89 (t!35707 (toList!8007 call!48717)) k0!934) (h!25983 (toList!8007 call!48717))))))

(declare-fun b!1132270 () Bool)

(assert (=> b!1132270 (= e!644398 e!644397)))

(declare-fun c!110376 () Bool)

(assert (=> b!1132270 (= c!110376 (and ((_ is Cons!24774) (toList!8007 call!48717)) (not (= (_1!9018 (h!25983 (toList!8007 call!48717))) k0!934))))))

(declare-fun b!1132271 () Bool)

(assert (=> b!1132271 (= e!644396 (not (containsKey!585 lt!503029 k0!934)))))

(declare-fun b!1132272 () Bool)

(assert (=> b!1132272 (= e!644398 (t!35707 (toList!8007 call!48717)))))

(declare-fun b!1132273 () Bool)

(assert (=> b!1132273 (= e!644397 Nil!24775)))

(assert (= (and d!131523 c!110375) b!1132272))

(assert (= (and d!131523 (not c!110375)) b!1132270))

(assert (= (and b!1132270 c!110376) b!1132269))

(assert (= (and b!1132270 (not c!110376)) b!1132273))

(assert (= (and d!131523 res!756231) b!1132271))

(declare-fun m!1045485 () Bool)

(assert (=> d!131523 m!1045485))

(declare-fun m!1045487 () Bool)

(assert (=> d!131523 m!1045487))

(declare-fun m!1045489 () Bool)

(assert (=> b!1132269 m!1045489))

(assert (=> b!1132269 m!1045489))

(declare-fun m!1045491 () Bool)

(assert (=> b!1132269 m!1045491))

(declare-fun m!1045493 () Bool)

(assert (=> b!1132271 m!1045493))

(assert (=> d!131331 d!131523))

(assert (=> b!1131894 d!131397))

(declare-fun d!131525 () Bool)

(declare-fun e!644400 () Bool)

(assert (=> d!131525 e!644400))

(declare-fun res!756232 () Bool)

(assert (=> d!131525 (=> res!756232 e!644400)))

(declare-fun lt!503031 () Bool)

(assert (=> d!131525 (= res!756232 (not lt!503031))))

(declare-fun lt!503033 () Bool)

(assert (=> d!131525 (= lt!503031 lt!503033)))

(declare-fun lt!503032 () Unit!37073)

(declare-fun e!644399 () Unit!37073)

(assert (=> d!131525 (= lt!503032 e!644399)))

(declare-fun c!110377 () Bool)

(assert (=> d!131525 (= c!110377 lt!503033)))

(assert (=> d!131525 (= lt!503033 (containsKey!585 (toList!8007 lt!502843) (select (arr!35549 lt!502695) from!1455)))))

(assert (=> d!131525 (= (contains!6529 lt!502843 (select (arr!35549 lt!502695) from!1455)) lt!503031)))

(declare-fun b!1132274 () Bool)

(declare-fun lt!503030 () Unit!37073)

(assert (=> b!1132274 (= e!644399 lt!503030)))

(assert (=> b!1132274 (= lt!503030 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502843) (select (arr!35549 lt!502695) from!1455)))))

(assert (=> b!1132274 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502843) (select (arr!35549 lt!502695) from!1455)))))

(declare-fun b!1132275 () Bool)

(declare-fun Unit!37099 () Unit!37073)

(assert (=> b!1132275 (= e!644399 Unit!37099)))

(declare-fun b!1132276 () Bool)

(assert (=> b!1132276 (= e!644400 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502843) (select (arr!35549 lt!502695) from!1455))))))

(assert (= (and d!131525 c!110377) b!1132274))

(assert (= (and d!131525 (not c!110377)) b!1132275))

(assert (= (and d!131525 (not res!756232)) b!1132276))

(assert (=> d!131525 m!1044871))

(declare-fun m!1045495 () Bool)

(assert (=> d!131525 m!1045495))

(assert (=> b!1132274 m!1044871))

(declare-fun m!1045497 () Bool)

(assert (=> b!1132274 m!1045497))

(assert (=> b!1132274 m!1044871))

(assert (=> b!1132274 m!1045211))

(assert (=> b!1132274 m!1045211))

(declare-fun m!1045499 () Bool)

(assert (=> b!1132274 m!1045499))

(assert (=> b!1132276 m!1044871))

(assert (=> b!1132276 m!1045211))

(assert (=> b!1132276 m!1045211))

(assert (=> b!1132276 m!1045499))

(assert (=> b!1131942 d!131525))

(declare-fun d!131527 () Bool)

(assert (=> d!131527 (arrayContainsKey!0 _keys!1208 lt!502808 #b00000000000000000000000000000000)))

(declare-fun lt!503034 () Unit!37073)

(assert (=> d!131527 (= lt!503034 (choose!13 _keys!1208 lt!502808 #b00000000000000000000000000000000))))

(assert (=> d!131527 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!131527 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!502808 #b00000000000000000000000000000000) lt!503034)))

(declare-fun bs!32976 () Bool)

(assert (= bs!32976 d!131527))

(assert (=> bs!32976 m!1044763))

(declare-fun m!1045501 () Bool)

(assert (=> bs!32976 m!1045501))

(assert (=> b!1131873 d!131527))

(declare-fun d!131529 () Bool)

(declare-fun res!756233 () Bool)

(declare-fun e!644401 () Bool)

(assert (=> d!131529 (=> res!756233 e!644401)))

(assert (=> d!131529 (= res!756233 (= (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) lt!502808))))

(assert (=> d!131529 (= (arrayContainsKey!0 _keys!1208 lt!502808 #b00000000000000000000000000000000) e!644401)))

(declare-fun b!1132277 () Bool)

(declare-fun e!644402 () Bool)

(assert (=> b!1132277 (= e!644401 e!644402)))

(declare-fun res!756234 () Bool)

(assert (=> b!1132277 (=> (not res!756234) (not e!644402))))

(assert (=> b!1132277 (= res!756234 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36085 _keys!1208)))))

(declare-fun b!1132278 () Bool)

(assert (=> b!1132278 (= e!644402 (arrayContainsKey!0 _keys!1208 lt!502808 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131529 (not res!756233)) b!1132277))

(assert (= (and b!1132277 res!756234) b!1132278))

(assert (=> d!131529 m!1044693))

(declare-fun m!1045503 () Bool)

(assert (=> b!1132278 m!1045503))

(assert (=> b!1131873 d!131529))

(declare-fun b!1132291 () Bool)

(declare-fun e!644410 () SeekEntryResult!9925)

(assert (=> b!1132291 (= e!644410 Undefined!9925)))

(declare-fun b!1132292 () Bool)

(declare-fun e!644411 () SeekEntryResult!9925)

(assert (=> b!1132292 (= e!644410 e!644411)))

(declare-fun lt!503042 () (_ BitVec 64))

(declare-fun lt!503043 () SeekEntryResult!9925)

(assert (=> b!1132292 (= lt!503042 (select (arr!35549 _keys!1208) (index!42073 lt!503043)))))

(declare-fun c!110385 () Bool)

(assert (=> b!1132292 (= c!110385 (= lt!503042 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!131531 () Bool)

(declare-fun lt!503041 () SeekEntryResult!9925)

(assert (=> d!131531 (and (or ((_ is Undefined!9925) lt!503041) (not ((_ is Found!9925) lt!503041)) (and (bvsge (index!42072 lt!503041) #b00000000000000000000000000000000) (bvslt (index!42072 lt!503041) (size!36085 _keys!1208)))) (or ((_ is Undefined!9925) lt!503041) ((_ is Found!9925) lt!503041) (not ((_ is MissingZero!9925) lt!503041)) (and (bvsge (index!42071 lt!503041) #b00000000000000000000000000000000) (bvslt (index!42071 lt!503041) (size!36085 _keys!1208)))) (or ((_ is Undefined!9925) lt!503041) ((_ is Found!9925) lt!503041) ((_ is MissingZero!9925) lt!503041) (not ((_ is MissingVacant!9925) lt!503041)) (and (bvsge (index!42074 lt!503041) #b00000000000000000000000000000000) (bvslt (index!42074 lt!503041) (size!36085 _keys!1208)))) (or ((_ is Undefined!9925) lt!503041) (ite ((_ is Found!9925) lt!503041) (= (select (arr!35549 _keys!1208) (index!42072 lt!503041)) (select (arr!35549 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9925) lt!503041) (= (select (arr!35549 _keys!1208) (index!42071 lt!503041)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9925) lt!503041) (= (select (arr!35549 _keys!1208) (index!42074 lt!503041)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131531 (= lt!503041 e!644410)))

(declare-fun c!110384 () Bool)

(assert (=> d!131531 (= c!110384 (and ((_ is Intermediate!9925) lt!503043) (undefined!10737 lt!503043)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!73793 (_ BitVec 32)) SeekEntryResult!9925)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!131531 (= lt!503043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!131531 (validMask!0 mask!1564)))

(assert (=> d!131531 (= (seekEntryOrOpen!0 (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!503041)))

(declare-fun b!1132293 () Bool)

(declare-fun e!644409 () SeekEntryResult!9925)

(assert (=> b!1132293 (= e!644409 (MissingZero!9925 (index!42073 lt!503043)))))

(declare-fun b!1132294 () Bool)

(declare-fun c!110386 () Bool)

(assert (=> b!1132294 (= c!110386 (= lt!503042 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132294 (= e!644411 e!644409)))

(declare-fun b!1132295 () Bool)

(assert (=> b!1132295 (= e!644411 (Found!9925 (index!42073 lt!503043)))))

(declare-fun b!1132296 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!73793 (_ BitVec 32)) SeekEntryResult!9925)

(assert (=> b!1132296 (= e!644409 (seekKeyOrZeroReturnVacant!0 (x!101491 lt!503043) (index!42073 lt!503043) (index!42073 lt!503043) (select (arr!35549 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (= (and d!131531 c!110384) b!1132291))

(assert (= (and d!131531 (not c!110384)) b!1132292))

(assert (= (and b!1132292 c!110385) b!1132295))

(assert (= (and b!1132292 (not c!110385)) b!1132294))

(assert (= (and b!1132294 c!110386) b!1132293))

(assert (= (and b!1132294 (not c!110386)) b!1132296))

(declare-fun m!1045505 () Bool)

(assert (=> b!1132292 m!1045505))

(declare-fun m!1045507 () Bool)

(assert (=> d!131531 m!1045507))

(declare-fun m!1045509 () Bool)

(assert (=> d!131531 m!1045509))

(declare-fun m!1045511 () Bool)

(assert (=> d!131531 m!1045511))

(assert (=> d!131531 m!1044583))

(declare-fun m!1045513 () Bool)

(assert (=> d!131531 m!1045513))

(assert (=> d!131531 m!1044693))

(declare-fun m!1045515 () Bool)

(assert (=> d!131531 m!1045515))

(assert (=> d!131531 m!1044693))

(assert (=> d!131531 m!1045513))

(assert (=> b!1132296 m!1044693))

(declare-fun m!1045517 () Bool)

(assert (=> b!1132296 m!1045517))

(assert (=> b!1131873 d!131531))

(assert (=> b!1131945 d!131419))

(declare-fun d!131533 () Bool)

(declare-fun e!644413 () Bool)

(assert (=> d!131533 e!644413))

(declare-fun res!756235 () Bool)

(assert (=> d!131533 (=> res!756235 e!644413)))

(declare-fun lt!503045 () Bool)

(assert (=> d!131533 (= res!756235 (not lt!503045))))

(declare-fun lt!503047 () Bool)

(assert (=> d!131533 (= lt!503045 lt!503047)))

(declare-fun lt!503046 () Unit!37073)

(declare-fun e!644412 () Unit!37073)

(assert (=> d!131533 (= lt!503046 e!644412)))

(declare-fun c!110387 () Bool)

(assert (=> d!131533 (= c!110387 lt!503047)))

(assert (=> d!131533 (= lt!503047 (containsKey!585 (toList!8007 lt!502799) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131533 (= (contains!6529 lt!502799 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503045)))

(declare-fun b!1132297 () Bool)

(declare-fun lt!503044 () Unit!37073)

(assert (=> b!1132297 (= e!644412 lt!503044)))

(assert (=> b!1132297 (= lt!503044 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502799) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132297 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502799) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132298 () Bool)

(declare-fun Unit!37100 () Unit!37073)

(assert (=> b!1132298 (= e!644412 Unit!37100)))

(declare-fun b!1132299 () Bool)

(assert (=> b!1132299 (= e!644413 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502799) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131533 c!110387) b!1132297))

(assert (= (and d!131533 (not c!110387)) b!1132298))

(assert (= (and d!131533 (not res!756235)) b!1132299))

(declare-fun m!1045519 () Bool)

(assert (=> d!131533 m!1045519))

(declare-fun m!1045521 () Bool)

(assert (=> b!1132297 m!1045521))

(declare-fun m!1045523 () Bool)

(assert (=> b!1132297 m!1045523))

(assert (=> b!1132297 m!1045523))

(declare-fun m!1045525 () Bool)

(assert (=> b!1132297 m!1045525))

(assert (=> b!1132299 m!1045523))

(assert (=> b!1132299 m!1045523))

(assert (=> b!1132299 m!1045525))

(assert (=> d!131313 d!131533))

(assert (=> d!131313 d!131303))

(declare-fun d!131535 () Bool)

(declare-fun res!756236 () Bool)

(declare-fun e!644414 () Bool)

(assert (=> d!131535 (=> res!756236 e!644414)))

(assert (=> d!131535 (= res!756236 (and ((_ is Cons!24774) (toList!8007 lt!502693)) (= (_1!9018 (h!25983 (toList!8007 lt!502693))) k0!934)))))

(assert (=> d!131535 (= (containsKey!585 (toList!8007 lt!502693) k0!934) e!644414)))

(declare-fun b!1132300 () Bool)

(declare-fun e!644415 () Bool)

(assert (=> b!1132300 (= e!644414 e!644415)))

(declare-fun res!756237 () Bool)

(assert (=> b!1132300 (=> (not res!756237) (not e!644415))))

(assert (=> b!1132300 (= res!756237 (and (or (not ((_ is Cons!24774) (toList!8007 lt!502693))) (bvsle (_1!9018 (h!25983 (toList!8007 lt!502693))) k0!934)) ((_ is Cons!24774) (toList!8007 lt!502693)) (bvslt (_1!9018 (h!25983 (toList!8007 lt!502693))) k0!934)))))

(declare-fun b!1132301 () Bool)

(assert (=> b!1132301 (= e!644415 (containsKey!585 (t!35707 (toList!8007 lt!502693)) k0!934))))

(assert (= (and d!131535 (not res!756236)) b!1132300))

(assert (= (and b!1132300 res!756237) b!1132301))

(declare-fun m!1045527 () Bool)

(assert (=> b!1132301 m!1045527))

(assert (=> d!131311 d!131535))

(declare-fun d!131537 () Bool)

(assert (=> d!131537 (= (apply!955 lt!502799 (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18076 (getValueByKey!628 (toList!8007 lt!502799) (select (arr!35549 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32977 () Bool)

(assert (= bs!32977 d!131537))

(assert (=> bs!32977 m!1044739))

(assert (=> bs!32977 m!1045207))

(assert (=> bs!32977 m!1045207))

(declare-fun m!1045529 () Bool)

(assert (=> bs!32977 m!1045529))

(assert (=> b!1131853 d!131537))

(assert (=> b!1131853 d!131475))

(assert (=> b!1131915 d!131439))

(assert (=> d!131305 d!131307))

(assert (=> d!131305 d!131309))

(declare-fun d!131539 () Bool)

(assert (=> d!131539 (contains!6529 (+!3451 lt!502694 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(assert (=> d!131539 true))

(declare-fun _$35!452 () Unit!37073)

(assert (=> d!131539 (= (choose!1774 lt!502694 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) _$35!452)))

(declare-fun bs!32978 () Bool)

(assert (= bs!32978 d!131539))

(assert (=> bs!32978 m!1044597))

(assert (=> bs!32978 m!1044597))

(assert (=> bs!32978 m!1044599))

(assert (=> d!131305 d!131539))

(declare-fun d!131541 () Bool)

(declare-fun e!644417 () Bool)

(assert (=> d!131541 e!644417))

(declare-fun res!756238 () Bool)

(assert (=> d!131541 (=> res!756238 e!644417)))

(declare-fun lt!503049 () Bool)

(assert (=> d!131541 (= res!756238 (not lt!503049))))

(declare-fun lt!503051 () Bool)

(assert (=> d!131541 (= lt!503049 lt!503051)))

(declare-fun lt!503050 () Unit!37073)

(declare-fun e!644416 () Unit!37073)

(assert (=> d!131541 (= lt!503050 e!644416)))

(declare-fun c!110388 () Bool)

(assert (=> d!131541 (= c!110388 lt!503051)))

(assert (=> d!131541 (= lt!503051 (containsKey!585 (toList!8007 lt!502694) k0!934))))

(assert (=> d!131541 (= (contains!6529 lt!502694 k0!934) lt!503049)))

(declare-fun b!1132302 () Bool)

(declare-fun lt!503048 () Unit!37073)

(assert (=> b!1132302 (= e!644416 lt!503048)))

(assert (=> b!1132302 (= lt!503048 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502694) k0!934))))

(assert (=> b!1132302 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502694) k0!934))))

(declare-fun b!1132303 () Bool)

(declare-fun Unit!37101 () Unit!37073)

(assert (=> b!1132303 (= e!644416 Unit!37101)))

(declare-fun b!1132304 () Bool)

(assert (=> b!1132304 (= e!644417 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502694) k0!934)))))

(assert (= (and d!131541 c!110388) b!1132302))

(assert (= (and d!131541 (not c!110388)) b!1132303))

(assert (= (and d!131541 (not res!756238)) b!1132304))

(declare-fun m!1045531 () Bool)

(assert (=> d!131541 m!1045531))

(declare-fun m!1045533 () Bool)

(assert (=> b!1132302 m!1045533))

(declare-fun m!1045535 () Bool)

(assert (=> b!1132302 m!1045535))

(assert (=> b!1132302 m!1045535))

(declare-fun m!1045537 () Bool)

(assert (=> b!1132302 m!1045537))

(assert (=> b!1132304 m!1045535))

(assert (=> b!1132304 m!1045535))

(assert (=> b!1132304 m!1045537))

(assert (=> d!131305 d!131541))

(declare-fun d!131543 () Bool)

(declare-fun e!644419 () Bool)

(assert (=> d!131543 e!644419))

(declare-fun res!756239 () Bool)

(assert (=> d!131543 (=> res!756239 e!644419)))

(declare-fun lt!503053 () Bool)

(assert (=> d!131543 (= res!756239 (not lt!503053))))

(declare-fun lt!503055 () Bool)

(assert (=> d!131543 (= lt!503053 lt!503055)))

(declare-fun lt!503054 () Unit!37073)

(declare-fun e!644418 () Unit!37073)

(assert (=> d!131543 (= lt!503054 e!644418)))

(declare-fun c!110389 () Bool)

(assert (=> d!131543 (= c!110389 lt!503055)))

(assert (=> d!131543 (= lt!503055 (containsKey!585 (toList!8007 lt!502773) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131543 (= (contains!6529 lt!502773 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503053)))

(declare-fun b!1132305 () Bool)

(declare-fun lt!503052 () Unit!37073)

(assert (=> b!1132305 (= e!644418 lt!503052)))

(assert (=> b!1132305 (= lt!503052 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502773) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> b!1132305 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502773) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132306 () Bool)

(declare-fun Unit!37102 () Unit!37073)

(assert (=> b!1132306 (= e!644418 Unit!37102)))

(declare-fun b!1132307 () Bool)

(assert (=> b!1132307 (= e!644419 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502773) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131543 c!110389) b!1132305))

(assert (= (and d!131543 (not c!110389)) b!1132306))

(assert (= (and d!131543 (not res!756239)) b!1132307))

(declare-fun m!1045539 () Bool)

(assert (=> d!131543 m!1045539))

(declare-fun m!1045541 () Bool)

(assert (=> b!1132305 m!1045541))

(assert (=> b!1132305 m!1044719))

(assert (=> b!1132305 m!1044719))

(declare-fun m!1045543 () Bool)

(assert (=> b!1132305 m!1045543))

(assert (=> b!1132307 m!1044719))

(assert (=> b!1132307 m!1044719))

(assert (=> b!1132307 m!1045543))

(assert (=> d!131309 d!131543))

(declare-fun b!1132309 () Bool)

(declare-fun e!644420 () Option!679)

(declare-fun e!644421 () Option!679)

(assert (=> b!1132309 (= e!644420 e!644421)))

(declare-fun c!110391 () Bool)

(assert (=> b!1132309 (= c!110391 (and ((_ is Cons!24774) lt!502774) (not (= (_1!9018 (h!25983 lt!502774)) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1132308 () Bool)

(assert (=> b!1132308 (= e!644420 (Some!678 (_2!9018 (h!25983 lt!502774))))))

(declare-fun b!1132310 () Bool)

(assert (=> b!1132310 (= e!644421 (getValueByKey!628 (t!35707 lt!502774) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun d!131545 () Bool)

(declare-fun c!110390 () Bool)

(assert (=> d!131545 (= c!110390 (and ((_ is Cons!24774) lt!502774) (= (_1!9018 (h!25983 lt!502774)) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131545 (= (getValueByKey!628 lt!502774 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!644420)))

(declare-fun b!1132311 () Bool)

(assert (=> b!1132311 (= e!644421 None!677)))

(assert (= (and d!131545 c!110390) b!1132308))

(assert (= (and d!131545 (not c!110390)) b!1132309))

(assert (= (and b!1132309 c!110391) b!1132310))

(assert (= (and b!1132309 (not c!110391)) b!1132311))

(declare-fun m!1045545 () Bool)

(assert (=> b!1132310 m!1045545))

(assert (=> d!131309 d!131545))

(declare-fun d!131547 () Bool)

(assert (=> d!131547 (= (getValueByKey!628 lt!502774 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!678 (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!503056 () Unit!37073)

(assert (=> d!131547 (= lt!503056 (choose!1779 lt!502774 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!644422 () Bool)

(assert (=> d!131547 e!644422))

(declare-fun res!756240 () Bool)

(assert (=> d!131547 (=> (not res!756240) (not e!644422))))

(assert (=> d!131547 (= res!756240 (isStrictlySorted!727 lt!502774))))

(assert (=> d!131547 (= (lemmaContainsTupThenGetReturnValue!305 lt!502774 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503056)))

(declare-fun b!1132312 () Bool)

(declare-fun res!756241 () Bool)

(assert (=> b!1132312 (=> (not res!756241) (not e!644422))))

(assert (=> b!1132312 (= res!756241 (containsKey!585 lt!502774 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132313 () Bool)

(assert (=> b!1132313 (= e!644422 (contains!6531 lt!502774 (tuple2!18015 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131547 res!756240) b!1132312))

(assert (= (and b!1132312 res!756241) b!1132313))

(assert (=> d!131547 m!1044713))

(declare-fun m!1045547 () Bool)

(assert (=> d!131547 m!1045547))

(declare-fun m!1045549 () Bool)

(assert (=> d!131547 m!1045549))

(declare-fun m!1045551 () Bool)

(assert (=> b!1132312 m!1045551))

(declare-fun m!1045553 () Bool)

(assert (=> b!1132313 m!1045553))

(assert (=> d!131309 d!131547))

(declare-fun b!1132314 () Bool)

(declare-fun e!644423 () List!24778)

(declare-fun e!644425 () List!24778)

(assert (=> b!1132314 (= e!644423 e!644425)))

(declare-fun c!110395 () Bool)

(assert (=> b!1132314 (= c!110395 (and ((_ is Cons!24774) (toList!8007 lt!502694)) (= (_1!9018 (h!25983 (toList!8007 lt!502694))) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132315 () Bool)

(declare-fun e!644424 () List!24778)

(declare-fun call!48795 () List!24778)

(assert (=> b!1132315 (= e!644424 call!48795)))

(declare-fun b!1132316 () Bool)

(declare-fun res!756242 () Bool)

(declare-fun e!644427 () Bool)

(assert (=> b!1132316 (=> (not res!756242) (not e!644427))))

(declare-fun lt!503057 () List!24778)

(assert (=> b!1132316 (= res!756242 (containsKey!585 lt!503057 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132317 () Bool)

(assert (=> b!1132317 (= e!644427 (contains!6531 lt!503057 (tuple2!18015 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!48791 () Bool)

(declare-fun call!48796 () List!24778)

(assert (=> bm!48791 (= call!48795 call!48796)))

(declare-fun bm!48792 () Bool)

(declare-fun call!48794 () List!24778)

(assert (=> bm!48792 (= call!48796 call!48794)))

(declare-fun b!1132318 () Bool)

(declare-fun c!110394 () Bool)

(assert (=> b!1132318 (= c!110394 (and ((_ is Cons!24774) (toList!8007 lt!502694)) (bvsgt (_1!9018 (h!25983 (toList!8007 lt!502694))) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1132318 (= e!644425 e!644424)))

(declare-fun bm!48793 () Bool)

(declare-fun c!110393 () Bool)

(declare-fun e!644426 () List!24778)

(assert (=> bm!48793 (= call!48794 ($colon$colon!608 e!644426 (ite c!110393 (h!25983 (toList!8007 lt!502694)) (tuple2!18015 (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!110392 () Bool)

(assert (=> bm!48793 (= c!110392 c!110393)))

(declare-fun b!1132319 () Bool)

(assert (=> b!1132319 (= e!644426 (ite c!110395 (t!35707 (toList!8007 lt!502694)) (ite c!110394 (Cons!24774 (h!25983 (toList!8007 lt!502694)) (t!35707 (toList!8007 lt!502694))) Nil!24775)))))

(declare-fun b!1132320 () Bool)

(assert (=> b!1132320 (= e!644425 call!48796)))

(declare-fun b!1132321 () Bool)

(assert (=> b!1132321 (= e!644424 call!48795)))

(declare-fun b!1132322 () Bool)

(assert (=> b!1132322 (= e!644423 call!48794)))

(declare-fun d!131549 () Bool)

(assert (=> d!131549 e!644427))

(declare-fun res!756243 () Bool)

(assert (=> d!131549 (=> (not res!756243) (not e!644427))))

(assert (=> d!131549 (= res!756243 (isStrictlySorted!727 lt!503057))))

(assert (=> d!131549 (= lt!503057 e!644423)))

(assert (=> d!131549 (= c!110393 (and ((_ is Cons!24774) (toList!8007 lt!502694)) (bvslt (_1!9018 (h!25983 (toList!8007 lt!502694))) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131549 (isStrictlySorted!727 (toList!8007 lt!502694))))

(assert (=> d!131549 (= (insertStrictlySorted!398 (toList!8007 lt!502694) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503057)))

(declare-fun b!1132323 () Bool)

(assert (=> b!1132323 (= e!644426 (insertStrictlySorted!398 (t!35707 (toList!8007 lt!502694)) (_1!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9018 (tuple2!18015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131549 c!110393) b!1132322))

(assert (= (and d!131549 (not c!110393)) b!1132314))

(assert (= (and b!1132314 c!110395) b!1132320))

(assert (= (and b!1132314 (not c!110395)) b!1132318))

(assert (= (and b!1132318 c!110394) b!1132321))

(assert (= (and b!1132318 (not c!110394)) b!1132315))

(assert (= (or b!1132321 b!1132315) bm!48791))

(assert (= (or b!1132320 bm!48791) bm!48792))

(assert (= (or b!1132322 bm!48792) bm!48793))

(assert (= (and bm!48793 c!110392) b!1132323))

(assert (= (and bm!48793 (not c!110392)) b!1132319))

(assert (= (and d!131549 res!756243) b!1132316))

(assert (= (and b!1132316 res!756242) b!1132317))

(declare-fun m!1045555 () Bool)

(assert (=> bm!48793 m!1045555))

(declare-fun m!1045557 () Bool)

(assert (=> d!131549 m!1045557))

(declare-fun m!1045559 () Bool)

(assert (=> d!131549 m!1045559))

(declare-fun m!1045561 () Bool)

(assert (=> b!1132317 m!1045561))

(declare-fun m!1045563 () Bool)

(assert (=> b!1132323 m!1045563))

(declare-fun m!1045565 () Bool)

(assert (=> b!1132316 m!1045565))

(assert (=> d!131309 d!131549))

(declare-fun d!131551 () Bool)

(declare-fun e!644429 () Bool)

(assert (=> d!131551 e!644429))

(declare-fun res!756244 () Bool)

(assert (=> d!131551 (=> res!756244 e!644429)))

(declare-fun lt!503059 () Bool)

(assert (=> d!131551 (= res!756244 (not lt!503059))))

(declare-fun lt!503061 () Bool)

(assert (=> d!131551 (= lt!503059 lt!503061)))

(declare-fun lt!503060 () Unit!37073)

(declare-fun e!644428 () Unit!37073)

(assert (=> d!131551 (= lt!503060 e!644428)))

(declare-fun c!110396 () Bool)

(assert (=> d!131551 (= c!110396 lt!503061)))

(assert (=> d!131551 (= lt!503061 (containsKey!585 (toList!8007 lt!502826) (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!131551 (= (contains!6529 lt!502826 (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) lt!503059)))

(declare-fun b!1132324 () Bool)

(declare-fun lt!503058 () Unit!37073)

(assert (=> b!1132324 (= e!644428 lt!503058)))

(assert (=> b!1132324 (= lt!503058 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502826) (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132324 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502826) (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132325 () Bool)

(declare-fun Unit!37103 () Unit!37073)

(assert (=> b!1132325 (= e!644428 Unit!37103)))

(declare-fun b!1132326 () Bool)

(assert (=> b!1132326 (= e!644429 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502826) (select (arr!35549 (ite c!110222 lt!502695 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!131551 c!110396) b!1132324))

(assert (= (and d!131551 (not c!110396)) b!1132325))

(assert (= (and d!131551 (not res!756244)) b!1132326))

(assert (=> d!131551 m!1044813))

(declare-fun m!1045567 () Bool)

(assert (=> d!131551 m!1045567))

(assert (=> b!1132324 m!1044813))

(declare-fun m!1045569 () Bool)

(assert (=> b!1132324 m!1045569))

(assert (=> b!1132324 m!1044813))

(assert (=> b!1132324 m!1045415))

(assert (=> b!1132324 m!1045415))

(declare-fun m!1045571 () Bool)

(assert (=> b!1132324 m!1045571))

(assert (=> b!1132326 m!1044813))

(assert (=> b!1132326 m!1045415))

(assert (=> b!1132326 m!1045415))

(assert (=> b!1132326 m!1045571))

(assert (=> b!1131912 d!131551))

(declare-fun d!131553 () Bool)

(assert (=> d!131553 (not (contains!6529 (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851)) lt!502847))))

(declare-fun lt!503062 () Unit!37073)

(assert (=> d!131553 (= lt!503062 (choose!1777 lt!502849 lt!502848 lt!502851 lt!502847))))

(declare-fun e!644430 () Bool)

(assert (=> d!131553 e!644430))

(declare-fun res!756245 () Bool)

(assert (=> d!131553 (=> (not res!756245) (not e!644430))))

(assert (=> d!131553 (= res!756245 (not (contains!6529 lt!502849 lt!502847)))))

(assert (=> d!131553 (= (addStillNotContains!283 lt!502849 lt!502848 lt!502851 lt!502847) lt!503062)))

(declare-fun b!1132327 () Bool)

(assert (=> b!1132327 (= e!644430 (not (= lt!502848 lt!502847)))))

(assert (= (and d!131553 res!756245) b!1132327))

(assert (=> d!131553 m!1044909))

(assert (=> d!131553 m!1044909))

(assert (=> d!131553 m!1044911))

(declare-fun m!1045573 () Bool)

(assert (=> d!131553 m!1045573))

(declare-fun m!1045575 () Bool)

(assert (=> d!131553 m!1045575))

(assert (=> b!1131953 d!131553))

(assert (=> b!1131953 d!131383))

(declare-fun d!131555 () Bool)

(declare-fun e!644431 () Bool)

(assert (=> d!131555 e!644431))

(declare-fun res!756247 () Bool)

(assert (=> d!131555 (=> (not res!756247) (not e!644431))))

(declare-fun lt!503063 () ListLongMap!15983)

(assert (=> d!131555 (= res!756247 (contains!6529 lt!503063 (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!503064 () List!24778)

(assert (=> d!131555 (= lt!503063 (ListLongMap!15984 lt!503064))))

(declare-fun lt!503065 () Unit!37073)

(declare-fun lt!503066 () Unit!37073)

(assert (=> d!131555 (= lt!503065 lt!503066)))

(assert (=> d!131555 (= (getValueByKey!628 lt!503064 (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131555 (= lt!503066 (lemmaContainsTupThenGetReturnValue!305 lt!503064 (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131555 (= lt!503064 (insertStrictlySorted!398 (toList!8007 call!48762) (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131555 (= (+!3451 call!48762 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!503063)))

(declare-fun b!1132328 () Bool)

(declare-fun res!756246 () Bool)

(assert (=> b!1132328 (=> (not res!756246) (not e!644431))))

(assert (=> b!1132328 (= res!756246 (= (getValueByKey!628 (toList!8007 lt!503063) (_1!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!678 (_2!9018 (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1132329 () Bool)

(assert (=> b!1132329 (= e!644431 (contains!6531 (toList!8007 lt!503063) (tuple2!18015 (select (arr!35549 _keys!1208) from!1455) (get!18073 (select (arr!35548 _values!996) from!1455) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131555 res!756247) b!1132328))

(assert (= (and b!1132328 res!756246) b!1132329))

(declare-fun m!1045577 () Bool)

(assert (=> d!131555 m!1045577))

(declare-fun m!1045579 () Bool)

(assert (=> d!131555 m!1045579))

(declare-fun m!1045581 () Bool)

(assert (=> d!131555 m!1045581))

(declare-fun m!1045583 () Bool)

(assert (=> d!131555 m!1045583))

(declare-fun m!1045585 () Bool)

(assert (=> b!1132328 m!1045585))

(declare-fun m!1045587 () Bool)

(assert (=> b!1132329 m!1045587))

(assert (=> b!1131953 d!131555))

(declare-fun d!131557 () Bool)

(declare-fun e!644432 () Bool)

(assert (=> d!131557 e!644432))

(declare-fun res!756249 () Bool)

(assert (=> d!131557 (=> (not res!756249) (not e!644432))))

(declare-fun lt!503067 () ListLongMap!15983)

(assert (=> d!131557 (= res!756249 (contains!6529 lt!503067 (_1!9018 (tuple2!18015 lt!502848 lt!502851))))))

(declare-fun lt!503068 () List!24778)

(assert (=> d!131557 (= lt!503067 (ListLongMap!15984 lt!503068))))

(declare-fun lt!503069 () Unit!37073)

(declare-fun lt!503070 () Unit!37073)

(assert (=> d!131557 (= lt!503069 lt!503070)))

(assert (=> d!131557 (= (getValueByKey!628 lt!503068 (_1!9018 (tuple2!18015 lt!502848 lt!502851))) (Some!678 (_2!9018 (tuple2!18015 lt!502848 lt!502851))))))

(assert (=> d!131557 (= lt!503070 (lemmaContainsTupThenGetReturnValue!305 lt!503068 (_1!9018 (tuple2!18015 lt!502848 lt!502851)) (_2!9018 (tuple2!18015 lt!502848 lt!502851))))))

(assert (=> d!131557 (= lt!503068 (insertStrictlySorted!398 (toList!8007 lt!502849) (_1!9018 (tuple2!18015 lt!502848 lt!502851)) (_2!9018 (tuple2!18015 lt!502848 lt!502851))))))

(assert (=> d!131557 (= (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851)) lt!503067)))

(declare-fun b!1132330 () Bool)

(declare-fun res!756248 () Bool)

(assert (=> b!1132330 (=> (not res!756248) (not e!644432))))

(assert (=> b!1132330 (= res!756248 (= (getValueByKey!628 (toList!8007 lt!503067) (_1!9018 (tuple2!18015 lt!502848 lt!502851))) (Some!678 (_2!9018 (tuple2!18015 lt!502848 lt!502851)))))))

(declare-fun b!1132331 () Bool)

(assert (=> b!1132331 (= e!644432 (contains!6531 (toList!8007 lt!503067) (tuple2!18015 lt!502848 lt!502851)))))

(assert (= (and d!131557 res!756249) b!1132330))

(assert (= (and b!1132330 res!756248) b!1132331))

(declare-fun m!1045589 () Bool)

(assert (=> d!131557 m!1045589))

(declare-fun m!1045591 () Bool)

(assert (=> d!131557 m!1045591))

(declare-fun m!1045593 () Bool)

(assert (=> d!131557 m!1045593))

(declare-fun m!1045595 () Bool)

(assert (=> d!131557 m!1045595))

(declare-fun m!1045597 () Bool)

(assert (=> b!1132330 m!1045597))

(declare-fun m!1045599 () Bool)

(assert (=> b!1132331 m!1045599))

(assert (=> b!1131953 d!131557))

(declare-fun d!131559 () Bool)

(declare-fun e!644434 () Bool)

(assert (=> d!131559 e!644434))

(declare-fun res!756250 () Bool)

(assert (=> d!131559 (=> res!756250 e!644434)))

(declare-fun lt!503072 () Bool)

(assert (=> d!131559 (= res!756250 (not lt!503072))))

(declare-fun lt!503074 () Bool)

(assert (=> d!131559 (= lt!503072 lt!503074)))

(declare-fun lt!503073 () Unit!37073)

(declare-fun e!644433 () Unit!37073)

(assert (=> d!131559 (= lt!503073 e!644433)))

(declare-fun c!110397 () Bool)

(assert (=> d!131559 (= c!110397 lt!503074)))

(assert (=> d!131559 (= lt!503074 (containsKey!585 (toList!8007 (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851))) lt!502847))))

(assert (=> d!131559 (= (contains!6529 (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851)) lt!502847) lt!503072)))

(declare-fun b!1132332 () Bool)

(declare-fun lt!503071 () Unit!37073)

(assert (=> b!1132332 (= e!644433 lt!503071)))

(assert (=> b!1132332 (= lt!503071 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851))) lt!502847))))

(assert (=> b!1132332 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851))) lt!502847))))

(declare-fun b!1132333 () Bool)

(declare-fun Unit!37104 () Unit!37073)

(assert (=> b!1132333 (= e!644433 Unit!37104)))

(declare-fun b!1132334 () Bool)

(assert (=> b!1132334 (= e!644434 (isDefined!454 (getValueByKey!628 (toList!8007 (+!3451 lt!502849 (tuple2!18015 lt!502848 lt!502851))) lt!502847)))))

(assert (= (and d!131559 c!110397) b!1132332))

(assert (= (and d!131559 (not c!110397)) b!1132333))

(assert (= (and d!131559 (not res!756250)) b!1132334))

(declare-fun m!1045601 () Bool)

(assert (=> d!131559 m!1045601))

(declare-fun m!1045603 () Bool)

(assert (=> b!1132332 m!1045603))

(declare-fun m!1045605 () Bool)

(assert (=> b!1132332 m!1045605))

(assert (=> b!1132332 m!1045605))

(declare-fun m!1045607 () Bool)

(assert (=> b!1132332 m!1045607))

(assert (=> b!1132334 m!1045605))

(assert (=> b!1132334 m!1045605))

(assert (=> b!1132334 m!1045607))

(assert (=> b!1131953 d!131559))

(declare-fun d!131561 () Bool)

(declare-fun e!644436 () Bool)

(assert (=> d!131561 e!644436))

(declare-fun res!756251 () Bool)

(assert (=> d!131561 (=> res!756251 e!644436)))

(declare-fun lt!503076 () Bool)

(assert (=> d!131561 (= res!756251 (not lt!503076))))

(declare-fun lt!503078 () Bool)

(assert (=> d!131561 (= lt!503076 lt!503078)))

(declare-fun lt!503077 () Unit!37073)

(declare-fun e!644435 () Unit!37073)

(assert (=> d!131561 (= lt!503077 e!644435)))

(declare-fun c!110398 () Bool)

(assert (=> d!131561 (= c!110398 lt!503078)))

(assert (=> d!131561 (= lt!503078 (containsKey!585 (toList!8007 lt!502826) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131561 (= (contains!6529 lt!502826 #b1000000000000000000000000000000000000000000000000000000000000000) lt!503076)))

(declare-fun b!1132335 () Bool)

(declare-fun lt!503075 () Unit!37073)

(assert (=> b!1132335 (= e!644435 lt!503075)))

(assert (=> b!1132335 (= lt!503075 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502826) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132335 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502826) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132336 () Bool)

(declare-fun Unit!37105 () Unit!37073)

(assert (=> b!1132336 (= e!644435 Unit!37105)))

(declare-fun b!1132337 () Bool)

(assert (=> b!1132337 (= e!644436 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131561 c!110398) b!1132335))

(assert (= (and d!131561 (not c!110398)) b!1132336))

(assert (= (and d!131561 (not res!756251)) b!1132337))

(declare-fun m!1045609 () Bool)

(assert (=> d!131561 m!1045609))

(declare-fun m!1045611 () Bool)

(assert (=> b!1132335 m!1045611))

(declare-fun m!1045613 () Bool)

(assert (=> b!1132335 m!1045613))

(assert (=> b!1132335 m!1045613))

(declare-fun m!1045615 () Bool)

(assert (=> b!1132335 m!1045615))

(assert (=> b!1132337 m!1045613))

(assert (=> b!1132337 m!1045613))

(assert (=> b!1132337 m!1045615))

(assert (=> b!1131910 d!131561))

(assert (=> b!1131951 d!131511))

(declare-fun d!131563 () Bool)

(declare-fun e!644438 () Bool)

(assert (=> d!131563 e!644438))

(declare-fun res!756252 () Bool)

(assert (=> d!131563 (=> res!756252 e!644438)))

(declare-fun lt!503080 () Bool)

(assert (=> d!131563 (= res!756252 (not lt!503080))))

(declare-fun lt!503082 () Bool)

(assert (=> d!131563 (= lt!503080 lt!503082)))

(declare-fun lt!503081 () Unit!37073)

(declare-fun e!644437 () Unit!37073)

(assert (=> d!131563 (= lt!503081 e!644437)))

(declare-fun c!110399 () Bool)

(assert (=> d!131563 (= c!110399 lt!503082)))

(assert (=> d!131563 (= lt!503082 (containsKey!585 (toList!8007 lt!502843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131563 (= (contains!6529 lt!502843 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503080)))

(declare-fun b!1132338 () Bool)

(declare-fun lt!503079 () Unit!37073)

(assert (=> b!1132338 (= e!644437 lt!503079)))

(assert (=> b!1132338 (= lt!503079 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8007 lt!502843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132338 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132339 () Bool)

(declare-fun Unit!37106 () Unit!37073)

(assert (=> b!1132339 (= e!644437 Unit!37106)))

(declare-fun b!1132340 () Bool)

(assert (=> b!1132340 (= e!644438 (isDefined!454 (getValueByKey!628 (toList!8007 lt!502843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131563 c!110399) b!1132338))

(assert (= (and d!131563 (not c!110399)) b!1132339))

(assert (= (and d!131563 (not res!756252)) b!1132340))

(declare-fun m!1045617 () Bool)

(assert (=> d!131563 m!1045617))

(declare-fun m!1045619 () Bool)

(assert (=> b!1132338 m!1045619))

(declare-fun m!1045621 () Bool)

(assert (=> b!1132338 m!1045621))

(assert (=> b!1132338 m!1045621))

(declare-fun m!1045623 () Bool)

(assert (=> b!1132338 m!1045623))

(assert (=> b!1132340 m!1045621))

(assert (=> b!1132340 m!1045621))

(assert (=> b!1132340 m!1045623))

(assert (=> d!131341 d!131563))

(assert (=> d!131341 d!131303))

(declare-fun b!1132341 () Bool)

(assert (=> b!1132341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)))))))

(assert (=> b!1132341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36084 (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996)))))))

(declare-fun lt!503087 () ListLongMap!15983)

(declare-fun e!644441 () Bool)

(assert (=> b!1132341 (= e!644441 (= (apply!955 lt!503087 (select (arr!35549 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18073 (select (arr!35548 (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132342 () Bool)

(declare-fun e!644445 () Bool)

(declare-fun e!644443 () Bool)

(assert (=> b!1132342 (= e!644445 e!644443)))

(declare-fun c!110401 () Bool)

(assert (=> b!1132342 (= c!110401 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)))))))

(declare-fun bm!48794 () Bool)

(declare-fun call!48797 () ListLongMap!15983)

(assert (=> bm!48794 (= call!48797 (getCurrentListMapNoExtraKeys!4494 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)) (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!131565 () Bool)

(declare-fun e!644439 () Bool)

(assert (=> d!131565 e!644439))

(declare-fun res!756255 () Bool)

(assert (=> d!131565 (=> (not res!756255) (not e!644439))))

(assert (=> d!131565 (= res!756255 (not (contains!6529 lt!503087 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644444 () ListLongMap!15983)

(assert (=> d!131565 (= lt!503087 e!644444)))

(declare-fun c!110403 () Bool)

(assert (=> d!131565 (= c!110403 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)))))))

(assert (=> d!131565 (validMask!0 mask!1564)))

(assert (=> d!131565 (= (getCurrentListMapNoExtraKeys!4494 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)) (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503087)))

(declare-fun b!1132343 () Bool)

(assert (=> b!1132343 (= e!644443 (= lt!503087 (getCurrentListMapNoExtraKeys!4494 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)) (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132344 () Bool)

(declare-fun e!644440 () ListLongMap!15983)

(assert (=> b!1132344 (= e!644440 call!48797)))

(declare-fun e!644442 () Bool)

(declare-fun b!1132345 () Bool)

(assert (=> b!1132345 (= e!644442 (validKeyInArray!0 (select (arr!35549 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132345 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1132346 () Bool)

(assert (=> b!1132346 (= e!644444 (ListLongMap!15984 Nil!24775))))

(declare-fun b!1132347 () Bool)

(assert (=> b!1132347 (= e!644439 e!644445)))

(declare-fun c!110402 () Bool)

(assert (=> b!1132347 (= c!110402 e!644442)))

(declare-fun res!756256 () Bool)

(assert (=> b!1132347 (=> (not res!756256) (not e!644442))))

(assert (=> b!1132347 (= res!756256 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)))))))

(declare-fun b!1132348 () Bool)

(assert (=> b!1132348 (= e!644443 (isEmpty!973 lt!503087))))

(declare-fun b!1132349 () Bool)

(assert (=> b!1132349 (= e!644444 e!644440)))

(declare-fun c!110400 () Bool)

(assert (=> b!1132349 (= c!110400 (validKeyInArray!0 (select (arr!35549 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132350 () Bool)

(declare-fun res!756253 () Bool)

(assert (=> b!1132350 (=> (not res!756253) (not e!644439))))

(assert (=> b!1132350 (= res!756253 (not (contains!6529 lt!503087 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132351 () Bool)

(declare-fun lt!503083 () Unit!37073)

(declare-fun lt!503089 () Unit!37073)

(assert (=> b!1132351 (= lt!503083 lt!503089)))

(declare-fun lt!503088 () V!43083)

(declare-fun lt!503084 () (_ BitVec 64))

(declare-fun lt!503085 () (_ BitVec 64))

(declare-fun lt!503086 () ListLongMap!15983)

(assert (=> b!1132351 (not (contains!6529 (+!3451 lt!503086 (tuple2!18015 lt!503085 lt!503088)) lt!503084))))

(assert (=> b!1132351 (= lt!503089 (addStillNotContains!283 lt!503086 lt!503085 lt!503088 lt!503084))))

(assert (=> b!1132351 (= lt!503084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132351 (= lt!503088 (get!18073 (select (arr!35548 (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132351 (= lt!503085 (select (arr!35549 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1132351 (= lt!503086 call!48797)))

(assert (=> b!1132351 (= e!644440 (+!3451 call!48797 (tuple2!18015 (select (arr!35549 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18073 (select (arr!35548 (array!73792 (store (arr!35548 _values!996) i!673 (ValueCellFull!13524 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36084 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132352 () Bool)

(assert (=> b!1132352 (= e!644445 e!644441)))

(assert (=> b!1132352 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36085 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208)))))))

(declare-fun res!756254 () Bool)

(assert (=> b!1132352 (= res!756254 (contains!6529 lt!503087 (select (arr!35549 (array!73794 (store (arr!35549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36085 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132352 (=> (not res!756254) (not e!644441))))

(assert (= (and d!131565 c!110403) b!1132346))

(assert (= (and d!131565 (not c!110403)) b!1132349))

(assert (= (and b!1132349 c!110400) b!1132351))

(assert (= (and b!1132349 (not c!110400)) b!1132344))

(assert (= (or b!1132351 b!1132344) bm!48794))

(assert (= (and d!131565 res!756255) b!1132350))

(assert (= (and b!1132350 res!756253) b!1132347))

(assert (= (and b!1132347 res!756256) b!1132345))

(assert (= (and b!1132347 c!110402) b!1132352))

(assert (= (and b!1132347 (not c!110402)) b!1132342))

(assert (= (and b!1132352 res!756254) b!1132341))

(assert (= (and b!1132342 c!110401) b!1132343))

(assert (= (and b!1132342 (not c!110401)) b!1132348))

(declare-fun b_lambda!18979 () Bool)

(assert (=> (not b_lambda!18979) (not b!1132341)))

(assert (=> b!1132341 t!35705))

(declare-fun b_and!38709 () Bool)

(assert (= b_and!38707 (and (=> t!35705 result!18059) b_and!38709)))

(declare-fun b_lambda!18981 () Bool)

(assert (=> (not b_lambda!18981) (not b!1132351)))

(assert (=> b!1132351 t!35705))

(declare-fun b_and!38711 () Bool)

(assert (= b_and!38709 (and (=> t!35705 result!18059) b_and!38711)))

(declare-fun m!1045625 () Bool)

(assert (=> b!1132343 m!1045625))

(declare-fun m!1045627 () Bool)

(assert (=> b!1132350 m!1045627))

(assert (=> bm!48794 m!1045625))

(declare-fun m!1045629 () Bool)

(assert (=> b!1132341 m!1045629))

(assert (=> b!1132341 m!1045629))

(assert (=> b!1132341 m!1044589))

(declare-fun m!1045631 () Bool)

(assert (=> b!1132341 m!1045631))

(assert (=> b!1132341 m!1044589))

(declare-fun m!1045633 () Bool)

(assert (=> b!1132341 m!1045633))

(assert (=> b!1132341 m!1045633))

(declare-fun m!1045635 () Bool)

(assert (=> b!1132341 m!1045635))

(declare-fun m!1045637 () Bool)

(assert (=> d!131565 m!1045637))

(assert (=> d!131565 m!1044583))

(assert (=> b!1132345 m!1045633))

(assert (=> b!1132345 m!1045633))

(declare-fun m!1045639 () Bool)

(assert (=> b!1132345 m!1045639))

(declare-fun m!1045641 () Bool)

(assert (=> b!1132348 m!1045641))

(assert (=> b!1132349 m!1045633))

(assert (=> b!1132349 m!1045633))

(assert (=> b!1132349 m!1045639))

(assert (=> b!1132352 m!1045633))

(assert (=> b!1132352 m!1045633))

(declare-fun m!1045643 () Bool)

(assert (=> b!1132352 m!1045643))

(assert (=> b!1132351 m!1045629))

(assert (=> b!1132351 m!1045629))

(assert (=> b!1132351 m!1044589))

(assert (=> b!1132351 m!1045631))

(declare-fun m!1045645 () Bool)

(assert (=> b!1132351 m!1045645))

(declare-fun m!1045647 () Bool)

(assert (=> b!1132351 m!1045647))

(assert (=> b!1132351 m!1044589))

(declare-fun m!1045649 () Bool)

(assert (=> b!1132351 m!1045649))

(assert (=> b!1132351 m!1045633))

(assert (=> b!1132351 m!1045645))

(declare-fun m!1045651 () Bool)

(assert (=> b!1132351 m!1045651))

(assert (=> bm!48764 d!131565))

(declare-fun d!131567 () Bool)

(assert (=> d!131567 (arrayContainsKey!0 lt!502695 lt!502816 #b00000000000000000000000000000000)))

(declare-fun lt!503090 () Unit!37073)

(assert (=> d!131567 (= lt!503090 (choose!13 lt!502695 lt!502816 #b00000000000000000000000000000000))))

(assert (=> d!131567 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!131567 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!502695 lt!502816 #b00000000000000000000000000000000) lt!503090)))

(declare-fun bs!32979 () Bool)

(assert (= bs!32979 d!131567))

(assert (=> bs!32979 m!1044795))

(declare-fun m!1045653 () Bool)

(assert (=> bs!32979 m!1045653))

(assert (=> b!1131897 d!131567))

(declare-fun d!131569 () Bool)

(declare-fun res!756257 () Bool)

(declare-fun e!644446 () Bool)

(assert (=> d!131569 (=> res!756257 e!644446)))

(assert (=> d!131569 (= res!756257 (= (select (arr!35549 lt!502695) #b00000000000000000000000000000000) lt!502816))))

(assert (=> d!131569 (= (arrayContainsKey!0 lt!502695 lt!502816 #b00000000000000000000000000000000) e!644446)))

(declare-fun b!1132353 () Bool)

(declare-fun e!644447 () Bool)

(assert (=> b!1132353 (= e!644446 e!644447)))

(declare-fun res!756258 () Bool)

(assert (=> b!1132353 (=> (not res!756258) (not e!644447))))

(assert (=> b!1132353 (= res!756258 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36085 lt!502695)))))

(declare-fun b!1132354 () Bool)

(assert (=> b!1132354 (= e!644447 (arrayContainsKey!0 lt!502695 lt!502816 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131569 (not res!756257)) b!1132353))

(assert (= (and b!1132353 res!756258) b!1132354))

(assert (=> d!131569 m!1044791))

(declare-fun m!1045655 () Bool)

(assert (=> b!1132354 m!1045655))

(assert (=> b!1131897 d!131569))

(declare-fun b!1132355 () Bool)

(declare-fun e!644449 () SeekEntryResult!9925)

(assert (=> b!1132355 (= e!644449 Undefined!9925)))

(declare-fun b!1132356 () Bool)

(declare-fun e!644450 () SeekEntryResult!9925)

(assert (=> b!1132356 (= e!644449 e!644450)))

(declare-fun lt!503092 () (_ BitVec 64))

(declare-fun lt!503093 () SeekEntryResult!9925)

(assert (=> b!1132356 (= lt!503092 (select (arr!35549 lt!502695) (index!42073 lt!503093)))))

(declare-fun c!110405 () Bool)

(assert (=> b!1132356 (= c!110405 (= lt!503092 (select (arr!35549 lt!502695) #b00000000000000000000000000000000)))))

(declare-fun d!131571 () Bool)

(declare-fun lt!503091 () SeekEntryResult!9925)

(assert (=> d!131571 (and (or ((_ is Undefined!9925) lt!503091) (not ((_ is Found!9925) lt!503091)) (and (bvsge (index!42072 lt!503091) #b00000000000000000000000000000000) (bvslt (index!42072 lt!503091) (size!36085 lt!502695)))) (or ((_ is Undefined!9925) lt!503091) ((_ is Found!9925) lt!503091) (not ((_ is MissingZero!9925) lt!503091)) (and (bvsge (index!42071 lt!503091) #b00000000000000000000000000000000) (bvslt (index!42071 lt!503091) (size!36085 lt!502695)))) (or ((_ is Undefined!9925) lt!503091) ((_ is Found!9925) lt!503091) ((_ is MissingZero!9925) lt!503091) (not ((_ is MissingVacant!9925) lt!503091)) (and (bvsge (index!42074 lt!503091) #b00000000000000000000000000000000) (bvslt (index!42074 lt!503091) (size!36085 lt!502695)))) (or ((_ is Undefined!9925) lt!503091) (ite ((_ is Found!9925) lt!503091) (= (select (arr!35549 lt!502695) (index!42072 lt!503091)) (select (arr!35549 lt!502695) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9925) lt!503091) (= (select (arr!35549 lt!502695) (index!42071 lt!503091)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9925) lt!503091) (= (select (arr!35549 lt!502695) (index!42074 lt!503091)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131571 (= lt!503091 e!644449)))

(declare-fun c!110404 () Bool)

(assert (=> d!131571 (= c!110404 (and ((_ is Intermediate!9925) lt!503093) (undefined!10737 lt!503093)))))

(assert (=> d!131571 (= lt!503093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) mask!1564) (select (arr!35549 lt!502695) #b00000000000000000000000000000000) lt!502695 mask!1564))))

(assert (=> d!131571 (validMask!0 mask!1564)))

(assert (=> d!131571 (= (seekEntryOrOpen!0 (select (arr!35549 lt!502695) #b00000000000000000000000000000000) lt!502695 mask!1564) lt!503091)))

(declare-fun b!1132357 () Bool)

(declare-fun e!644448 () SeekEntryResult!9925)

(assert (=> b!1132357 (= e!644448 (MissingZero!9925 (index!42073 lt!503093)))))

(declare-fun b!1132358 () Bool)

(declare-fun c!110406 () Bool)

(assert (=> b!1132358 (= c!110406 (= lt!503092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132358 (= e!644450 e!644448)))

(declare-fun b!1132359 () Bool)

(assert (=> b!1132359 (= e!644450 (Found!9925 (index!42073 lt!503093)))))

(declare-fun b!1132360 () Bool)

(assert (=> b!1132360 (= e!644448 (seekKeyOrZeroReturnVacant!0 (x!101491 lt!503093) (index!42073 lt!503093) (index!42073 lt!503093) (select (arr!35549 lt!502695) #b00000000000000000000000000000000) lt!502695 mask!1564))))

(assert (= (and d!131571 c!110404) b!1132355))

(assert (= (and d!131571 (not c!110404)) b!1132356))

(assert (= (and b!1132356 c!110405) b!1132359))

(assert (= (and b!1132356 (not c!110405)) b!1132358))

(assert (= (and b!1132358 c!110406) b!1132357))

(assert (= (and b!1132358 (not c!110406)) b!1132360))

(declare-fun m!1045657 () Bool)

(assert (=> b!1132356 m!1045657))

(declare-fun m!1045659 () Bool)

(assert (=> d!131571 m!1045659))

(declare-fun m!1045661 () Bool)

(assert (=> d!131571 m!1045661))

(declare-fun m!1045663 () Bool)

(assert (=> d!131571 m!1045663))

(assert (=> d!131571 m!1044583))

(declare-fun m!1045665 () Bool)

(assert (=> d!131571 m!1045665))

(assert (=> d!131571 m!1044791))

(declare-fun m!1045667 () Bool)

(assert (=> d!131571 m!1045667))

(assert (=> d!131571 m!1044791))

(assert (=> d!131571 m!1045665))

(assert (=> b!1132360 m!1044791))

(declare-fun m!1045669 () Bool)

(assert (=> b!1132360 m!1045669))

(assert (=> b!1131897 d!131571))

(declare-fun b!1132362 () Bool)

(declare-fun e!644452 () Bool)

(assert (=> b!1132362 (= e!644452 tp_is_empty!28467)))

(declare-fun mapIsEmpty!44525 () Bool)

(declare-fun mapRes!44525 () Bool)

(assert (=> mapIsEmpty!44525 mapRes!44525))

(declare-fun mapNonEmpty!44525 () Bool)

(declare-fun tp!84525 () Bool)

(declare-fun e!644451 () Bool)

(assert (=> mapNonEmpty!44525 (= mapRes!44525 (and tp!84525 e!644451))))

(declare-fun mapKey!44525 () (_ BitVec 32))

(declare-fun mapValue!44525 () ValueCell!13524)

(declare-fun mapRest!44525 () (Array (_ BitVec 32) ValueCell!13524))

(assert (=> mapNonEmpty!44525 (= mapRest!44524 (store mapRest!44525 mapKey!44525 mapValue!44525))))

(declare-fun b!1132361 () Bool)

(assert (=> b!1132361 (= e!644451 tp_is_empty!28467)))

(declare-fun condMapEmpty!44525 () Bool)

(declare-fun mapDefault!44525 () ValueCell!13524)

(assert (=> mapNonEmpty!44524 (= condMapEmpty!44525 (= mapRest!44524 ((as const (Array (_ BitVec 32) ValueCell!13524)) mapDefault!44525)))))

(assert (=> mapNonEmpty!44524 (= tp!84524 (and e!644452 mapRes!44525))))

(assert (= (and mapNonEmpty!44524 condMapEmpty!44525) mapIsEmpty!44525))

(assert (= (and mapNonEmpty!44524 (not condMapEmpty!44525)) mapNonEmpty!44525))

(assert (= (and mapNonEmpty!44525 ((_ is ValueCellFull!13524) mapValue!44525)) b!1132361))

(assert (= (and mapNonEmpty!44524 ((_ is ValueCellFull!13524) mapDefault!44525)) b!1132362))

(declare-fun m!1045671 () Bool)

(assert (=> mapNonEmpty!44525 m!1045671))

(declare-fun b_lambda!18983 () Bool)

(assert (= b_lambda!18969 (or (and start!98236 b_free!23937) b_lambda!18983)))

(declare-fun b_lambda!18985 () Bool)

(assert (= b_lambda!18965 (or (and start!98236 b_free!23937) b_lambda!18985)))

(declare-fun b_lambda!18987 () Bool)

(assert (= b_lambda!18959 (or (and start!98236 b_free!23937) b_lambda!18987)))

(declare-fun b_lambda!18989 () Bool)

(assert (= b_lambda!18963 (or (and start!98236 b_free!23937) b_lambda!18989)))

(declare-fun b_lambda!18991 () Bool)

(assert (= b_lambda!18957 (or (and start!98236 b_free!23937) b_lambda!18991)))

(declare-fun b_lambda!18993 () Bool)

(assert (= b_lambda!18977 (or (and start!98236 b_free!23937) b_lambda!18993)))

(declare-fun b_lambda!18995 () Bool)

(assert (= b_lambda!18971 (or (and start!98236 b_free!23937) b_lambda!18995)))

(declare-fun b_lambda!18997 () Bool)

(assert (= b_lambda!18967 (or (and start!98236 b_free!23937) b_lambda!18997)))

(declare-fun b_lambda!18999 () Bool)

(assert (= b_lambda!18979 (or (and start!98236 b_free!23937) b_lambda!18999)))

(declare-fun b_lambda!19001 () Bool)

(assert (= b_lambda!18973 (or (and start!98236 b_free!23937) b_lambda!19001)))

(declare-fun b_lambda!19003 () Bool)

(assert (= b_lambda!18981 (or (and start!98236 b_free!23937) b_lambda!19003)))

(declare-fun b_lambda!19005 () Bool)

(assert (= b_lambda!18961 (or (and start!98236 b_free!23937) b_lambda!19005)))

(declare-fun b_lambda!19007 () Bool)

(assert (= b_lambda!18975 (or (and start!98236 b_free!23937) b_lambda!19007)))

(check-sat (not bm!48780) (not b!1132011) (not b!1132331) (not bm!48793) (not b_lambda!18991) (not d!131379) (not b!1132014) (not b!1132248) (not b!1132310) (not b!1132142) (not d!131531) (not b_lambda!18953) (not b!1132095) (not b!1132032) (not d!131391) (not b!1132112) (not d!131359) (not b!1132114) (not b!1132225) (not b!1132098) (not b!1132155) (not b!1132212) (not b!1132016) (not b!1131994) (not d!131567) (not b_lambda!18995) (not b_lambda!18947) (not b_lambda!18987) (not b!1132173) (not d!131501) (not b!1132145) (not d!131543) (not d!131431) (not b_lambda!18989) (not bm!48775) (not b!1132184) (not d!131487) (not bm!48769) (not b!1132038) (not d!131447) (not b!1132041) (not d!131451) (not b!1132360) (not d!131497) (not b!1132087) (not b!1132068) (not b!1132269) (not b!1132332) (not d!131443) (not d!131527) (not b!1132224) (not bm!48767) (not b!1132351) (not d!131367) (not b!1132350) (not d!131541) (not b!1132141) (not d!131491) (not d!131449) (not b!1132329) (not d!131427) (not b!1132196) b_and!38711 (not b!1132316) (not b!1132050) (not b!1132046) (not bm!48779) (not b!1132120) (not b!1132031) (not d!131547) (not d!131435) (not b!1132082) (not b!1132187) (not b_lambda!18983) (not b!1132301) (not b!1132008) (not b!1132127) (not d!131513) (not b!1132123) (not d!131533) (not b!1132150) (not d!131571) (not d!131423) (not b!1132181) (not b!1132053) (not d!131555) (not b_lambda!18939) (not b!1132203) (not b!1132255) (not d!131507) (not d!131557) (not d!131477) (not b!1132160) (not b!1132207) (not b!1132348) (not b!1132110) (not b!1132035) (not d!131437) (not b!1132182) tp_is_empty!28467 (not b!1131985) (not d!131361) (not b!1131990) (not b!1132006) (not b!1132169) (not b!1132151) (not b!1132148) (not b!1132191) (not d!131417) (not b_lambda!19003) (not b!1132143) (not d!131549) (not b_lambda!18945) (not b!1131986) (not d!131385) (not b_lambda!18955) (not b!1132179) (not b!1132136) (not bm!48770) (not d!131401) (not b!1132218) (not b!1132015) (not b!1132113) (not b!1131977) (not b!1132070) (not b!1132020) (not b_lambda!18993) (not bm!48790) (not b_lambda!18937) (not b!1132012) (not bm!48778) (not b!1132130) (not b!1132323) (not d!131387) (not d!131519) (not b!1132039) (not d!131525) (not bm!48781) (not b!1132178) (not b!1132079) (not b!1132215) (not d!131561) (not b!1132271) (not b!1132330) (not b_lambda!18943) (not d!131495) (not d!131537) (not d!131465) (not b!1132134) (not d!131365) (not d!131439) (not b!1132117) (not b!1131979) (not b_lambda!19007) (not d!131421) (not d!131523) (not b!1132044) (not b!1132312) (not b!1132052) (not d!131563) (not d!131441) (not b!1132131) (not b!1131997) (not b!1132210) (not d!131409) (not d!131371) (not b_lambda!18949) (not bm!48777) (not b!1132022) (not b!1131995) (not d!131551) (not b!1132209) (not b!1132128) (not b_lambda!18951) (not b!1132034) (not b!1132258) (not b!1132165) (not b_lambda!19005) (not d!131453) (not b!1132121) (not b!1132354) (not b!1132017) (not b!1132307) (not b!1132206) (not b!1132043) (not b!1132313) (not d!131425) (not b!1132091) (not b!1132204) (not d!131351) (not b!1132317) (not b!1132013) (not d!131375) (not b_next!23937) (not d!131505) (not b!1132296) (not d!131499) (not d!131479) (not d!131509) (not b!1132213) (not b!1132177) (not b!1132051) (not d!131539) (not b!1132304) (not b!1132102) (not d!131517) (not b!1132340) (not b!1132118) (not b_lambda!18997) (not b!1132345) (not d!131419) (not b!1132274) (not b!1132133) (not b!1132093) (not b_lambda!18985) (not bm!48776) (not d!131393) (not b!1132199) (not b!1132305) (not b!1132299) (not b!1132335) (not b_lambda!19001) (not b!1132338) (not b!1132341) (not d!131565) (not b!1132144) (not b!1132328) (not b!1132189) (not b!1132125) (not b_lambda!18911) (not b!1131988) (not b!1132073) (not b!1132166) (not d!131355) (not d!131553) (not b!1132101) (not b!1132276) (not b!1132183) (not d!131429) (not bm!48794) (not mapNonEmpty!44525) (not b!1132122) (not d!131469) (not b!1132334) (not b!1132103) (not b!1132278) (not d!131559) (not b!1132337) (not b!1132343) (not d!131395) (not b!1132107) (not b!1132064) (not bm!48768) (not b!1132003) (not d!131381) (not d!131455) (not b!1132195) (not b!1132115) (not b!1131993) (not b_lambda!18941) (not b!1132105) (not b!1132004) (not b!1132297) (not d!131503) (not b!1132162) (not d!131349) (not b!1132021) (not b!1132048) (not b!1132111) (not b!1132018) (not b!1132100) (not d!131521) (not b!1132047) (not b!1132349) (not b!1132138) (not b!1132175) (not b!1132090) (not b!1132147) (not b!1132324) (not b!1132192) (not d!131483) (not b!1132152) (not b!1131996) (not b!1132200) (not b!1132129) (not b!1132352) (not b!1132302) (not b_lambda!18999) (not b!1132042) (not d!131473) (not b!1132193) (not b!1132256) (not b!1132099) (not b!1132326) (not b!1132201) (not b_lambda!18935) (not d!131489) (not b!1132249) (not d!131481) (not d!131369))
(check-sat b_and!38711 (not b_next!23937))
