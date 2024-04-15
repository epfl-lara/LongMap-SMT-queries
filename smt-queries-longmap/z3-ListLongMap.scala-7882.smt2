; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98030 () Bool)

(assert start!98030)

(declare-fun b_free!23737 () Bool)

(declare-fun b_next!23737 () Bool)

(assert (=> start!98030 (= b_free!23737 (not b_next!23737))))

(declare-fun tp!83915 () Bool)

(declare-fun b_and!38235 () Bool)

(assert (=> start!98030 (= tp!83915 b_and!38235)))

(declare-fun b!1125065 () Bool)

(declare-fun res!751779 () Bool)

(declare-fun e!640427 () Bool)

(assert (=> b!1125065 (=> (not res!751779) (not e!640427))))

(declare-datatypes ((array!73324 0))(
  ( (array!73325 (arr!35315 (Array (_ BitVec 32) (_ BitVec 64))) (size!35853 (_ BitVec 32))) )
))
(declare-fun lt!499557 () array!73324)

(declare-datatypes ((List!24682 0))(
  ( (Nil!24679) (Cons!24678 (h!25887 (_ BitVec 64)) (t!35402 List!24682)) )
))
(declare-fun arrayNoDuplicates!0 (array!73324 (_ BitVec 32) List!24682) Bool)

(assert (=> b!1125065 (= res!751779 (arrayNoDuplicates!0 lt!499557 #b00000000000000000000000000000000 Nil!24679))))

(declare-fun b!1125066 () Bool)

(declare-fun res!751777 () Bool)

(declare-fun e!640430 () Bool)

(assert (=> b!1125066 (=> (not res!751777) (not e!640430))))

(declare-fun _keys!1208 () array!73324)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73324 (_ BitVec 32)) Bool)

(assert (=> b!1125066 (= res!751777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!751782 () Bool)

(assert (=> start!98030 (=> (not res!751782) (not e!640430))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98030 (= res!751782 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35853 _keys!1208))))))

(assert (=> start!98030 e!640430))

(declare-fun tp_is_empty!28267 () Bool)

(assert (=> start!98030 tp_is_empty!28267))

(declare-fun array_inv!27182 (array!73324) Bool)

(assert (=> start!98030 (array_inv!27182 _keys!1208)))

(assert (=> start!98030 true))

(assert (=> start!98030 tp!83915))

(declare-datatypes ((V!42817 0))(
  ( (V!42818 (val!14190 Int)) )
))
(declare-datatypes ((ValueCell!13424 0))(
  ( (ValueCellFull!13424 (v!16822 V!42817)) (EmptyCell!13424) )
))
(declare-datatypes ((array!73326 0))(
  ( (array!73327 (arr!35316 (Array (_ BitVec 32) ValueCell!13424)) (size!35854 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73326)

(declare-fun e!640422 () Bool)

(declare-fun array_inv!27183 (array!73326) Bool)

(assert (=> start!98030 (and (array_inv!27183 _values!996) e!640422)))

(declare-fun b!1125067 () Bool)

(declare-fun res!751772 () Bool)

(declare-fun e!640428 () Bool)

(assert (=> b!1125067 (=> res!751772 e!640428)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1125067 (= res!751772 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125068 () Bool)

(declare-fun e!640425 () Bool)

(assert (=> b!1125068 (= e!640425 e!640428)))

(declare-fun res!751786 () Bool)

(assert (=> b!1125068 (=> res!751786 e!640428)))

(declare-datatypes ((tuple2!17920 0))(
  ( (tuple2!17921 (_1!8971 (_ BitVec 64)) (_2!8971 V!42817)) )
))
(declare-datatypes ((List!24683 0))(
  ( (Nil!24680) (Cons!24679 (h!25888 tuple2!17920) (t!35403 List!24683)) )
))
(declare-datatypes ((ListLongMap!15889 0))(
  ( (ListLongMap!15890 (toList!7960 List!24683)) )
))
(declare-fun lt!499560 () ListLongMap!15889)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6430 (ListLongMap!15889 (_ BitVec 64)) Bool)

(assert (=> b!1125068 (= res!751786 (not (contains!6430 lt!499560 k0!934)))))

(declare-fun zeroValue!944 () V!42817)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42817)

(declare-fun getCurrentListMapNoExtraKeys!4465 (array!73324 array!73326 (_ BitVec 32) (_ BitVec 32) V!42817 V!42817 (_ BitVec 32) Int) ListLongMap!15889)

(assert (=> b!1125068 (= lt!499560 (getCurrentListMapNoExtraKeys!4465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125069 () Bool)

(assert (=> b!1125069 (= e!640428 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35853 _keys!1208))))))

(declare-fun +!3460 (ListLongMap!15889 tuple2!17920) ListLongMap!15889)

(assert (=> b!1125069 (contains!6430 (+!3460 lt!499560 (tuple2!17921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!36729 0))(
  ( (Unit!36730) )
))
(declare-fun lt!499558 () Unit!36729)

(declare-fun addStillContains!678 (ListLongMap!15889 (_ BitVec 64) V!42817 (_ BitVec 64)) Unit!36729)

(assert (=> b!1125069 (= lt!499558 (addStillContains!678 lt!499560 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125070 () Bool)

(declare-fun res!751778 () Bool)

(assert (=> b!1125070 (=> (not res!751778) (not e!640430))))

(assert (=> b!1125070 (= res!751778 (and (= (size!35854 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35853 _keys!1208) (size!35854 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125071 () Bool)

(declare-fun e!640421 () Bool)

(declare-fun call!47471 () ListLongMap!15889)

(declare-fun call!47470 () ListLongMap!15889)

(assert (=> b!1125071 (= e!640421 (= call!47471 call!47470))))

(declare-fun b!1125072 () Bool)

(declare-fun res!751773 () Bool)

(assert (=> b!1125072 (=> (not res!751773) (not e!640430))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125072 (= res!751773 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35853 _keys!1208))))))

(declare-fun b!1125073 () Bool)

(assert (=> b!1125073 (= e!640430 e!640427)))

(declare-fun res!751781 () Bool)

(assert (=> b!1125073 (=> (not res!751781) (not e!640427))))

(assert (=> b!1125073 (= res!751781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499557 mask!1564))))

(assert (=> b!1125073 (= lt!499557 (array!73325 (store (arr!35315 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35853 _keys!1208)))))

(declare-fun b!1125074 () Bool)

(declare-fun e!640423 () Bool)

(assert (=> b!1125074 (= e!640423 tp_is_empty!28267)))

(declare-fun b!1125075 () Bool)

(declare-fun e!640429 () Bool)

(declare-fun e!640426 () Bool)

(assert (=> b!1125075 (= e!640429 e!640426)))

(declare-fun res!751785 () Bool)

(assert (=> b!1125075 (=> res!751785 e!640426)))

(assert (=> b!1125075 (= res!751785 (not (= from!1455 i!673)))))

(declare-fun lt!499556 () array!73326)

(declare-fun lt!499559 () ListLongMap!15889)

(assert (=> b!1125075 (= lt!499559 (getCurrentListMapNoExtraKeys!4465 lt!499557 lt!499556 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2486 (Int (_ BitVec 64)) V!42817)

(assert (=> b!1125075 (= lt!499556 (array!73327 (store (arr!35316 _values!996) i!673 (ValueCellFull!13424 (dynLambda!2486 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35854 _values!996)))))

(declare-fun lt!499553 () ListLongMap!15889)

(assert (=> b!1125075 (= lt!499553 (getCurrentListMapNoExtraKeys!4465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47467 () Bool)

(assert (=> bm!47467 (= call!47471 (getCurrentListMapNoExtraKeys!4465 lt!499557 lt!499556 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125076 () Bool)

(declare-fun res!751784 () Bool)

(assert (=> b!1125076 (=> (not res!751784) (not e!640430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125076 (= res!751784 (validKeyInArray!0 k0!934))))

(declare-fun b!1125077 () Bool)

(assert (=> b!1125077 (= e!640427 (not e!640429))))

(declare-fun res!751774 () Bool)

(assert (=> b!1125077 (=> res!751774 e!640429)))

(assert (=> b!1125077 (= res!751774 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125077 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499554 () Unit!36729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73324 (_ BitVec 64) (_ BitVec 32)) Unit!36729)

(assert (=> b!1125077 (= lt!499554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125078 () Bool)

(declare-fun res!751776 () Bool)

(assert (=> b!1125078 (=> (not res!751776) (not e!640430))))

(assert (=> b!1125078 (= res!751776 (= (select (arr!35315 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44218 () Bool)

(declare-fun mapRes!44218 () Bool)

(assert (=> mapIsEmpty!44218 mapRes!44218))

(declare-fun b!1125079 () Bool)

(declare-fun e!640431 () Bool)

(assert (=> b!1125079 (= e!640422 (and e!640431 mapRes!44218))))

(declare-fun condMapEmpty!44218 () Bool)

(declare-fun mapDefault!44218 () ValueCell!13424)

(assert (=> b!1125079 (= condMapEmpty!44218 (= (arr!35316 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13424)) mapDefault!44218)))))

(declare-fun b!1125080 () Bool)

(assert (=> b!1125080 (= e!640431 tp_is_empty!28267)))

(declare-fun b!1125081 () Bool)

(declare-fun res!751783 () Bool)

(assert (=> b!1125081 (=> (not res!751783) (not e!640430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125081 (= res!751783 (validMask!0 mask!1564))))

(declare-fun b!1125082 () Bool)

(assert (=> b!1125082 (= e!640426 e!640425)))

(declare-fun res!751780 () Bool)

(assert (=> b!1125082 (=> res!751780 e!640425)))

(assert (=> b!1125082 (= res!751780 (not (= (select (arr!35315 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125082 e!640421))

(declare-fun c!109569 () Bool)

(assert (=> b!1125082 (= c!109569 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499555 () Unit!36729)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!371 (array!73324 array!73326 (_ BitVec 32) (_ BitVec 32) V!42817 V!42817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36729)

(assert (=> b!1125082 (= lt!499555 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125083 () Bool)

(declare-fun -!1093 (ListLongMap!15889 (_ BitVec 64)) ListLongMap!15889)

(assert (=> b!1125083 (= e!640421 (= call!47471 (-!1093 call!47470 k0!934)))))

(declare-fun b!1125084 () Bool)

(declare-fun res!751775 () Bool)

(assert (=> b!1125084 (=> (not res!751775) (not e!640430))))

(assert (=> b!1125084 (= res!751775 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24679))))

(declare-fun mapNonEmpty!44218 () Bool)

(declare-fun tp!83914 () Bool)

(assert (=> mapNonEmpty!44218 (= mapRes!44218 (and tp!83914 e!640423))))

(declare-fun mapValue!44218 () ValueCell!13424)

(declare-fun mapKey!44218 () (_ BitVec 32))

(declare-fun mapRest!44218 () (Array (_ BitVec 32) ValueCell!13424))

(assert (=> mapNonEmpty!44218 (= (arr!35316 _values!996) (store mapRest!44218 mapKey!44218 mapValue!44218))))

(declare-fun bm!47468 () Bool)

(assert (=> bm!47468 (= call!47470 (getCurrentListMapNoExtraKeys!4465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98030 res!751782) b!1125081))

(assert (= (and b!1125081 res!751783) b!1125070))

(assert (= (and b!1125070 res!751778) b!1125066))

(assert (= (and b!1125066 res!751777) b!1125084))

(assert (= (and b!1125084 res!751775) b!1125072))

(assert (= (and b!1125072 res!751773) b!1125076))

(assert (= (and b!1125076 res!751784) b!1125078))

(assert (= (and b!1125078 res!751776) b!1125073))

(assert (= (and b!1125073 res!751781) b!1125065))

(assert (= (and b!1125065 res!751779) b!1125077))

(assert (= (and b!1125077 (not res!751774)) b!1125075))

(assert (= (and b!1125075 (not res!751785)) b!1125082))

(assert (= (and b!1125082 c!109569) b!1125083))

(assert (= (and b!1125082 (not c!109569)) b!1125071))

(assert (= (or b!1125083 b!1125071) bm!47467))

(assert (= (or b!1125083 b!1125071) bm!47468))

(assert (= (and b!1125082 (not res!751780)) b!1125068))

(assert (= (and b!1125068 (not res!751786)) b!1125067))

(assert (= (and b!1125067 (not res!751772)) b!1125069))

(assert (= (and b!1125079 condMapEmpty!44218) mapIsEmpty!44218))

(assert (= (and b!1125079 (not condMapEmpty!44218)) mapNonEmpty!44218))

(get-info :version)

(assert (= (and mapNonEmpty!44218 ((_ is ValueCellFull!13424) mapValue!44218)) b!1125074))

(assert (= (and b!1125079 ((_ is ValueCellFull!13424) mapDefault!44218)) b!1125080))

(assert (= start!98030 b!1125079))

(declare-fun b_lambda!18689 () Bool)

(assert (=> (not b_lambda!18689) (not b!1125075)))

(declare-fun t!35401 () Bool)

(declare-fun tb!8541 () Bool)

(assert (=> (and start!98030 (= defaultEntry!1004 defaultEntry!1004) t!35401) tb!8541))

(declare-fun result!17651 () Bool)

(assert (=> tb!8541 (= result!17651 tp_is_empty!28267)))

(assert (=> b!1125075 t!35401))

(declare-fun b_and!38237 () Bool)

(assert (= b_and!38235 (and (=> t!35401 result!17651) b_and!38237)))

(declare-fun m!1038741 () Bool)

(assert (=> b!1125084 m!1038741))

(declare-fun m!1038743 () Bool)

(assert (=> b!1125075 m!1038743))

(declare-fun m!1038745 () Bool)

(assert (=> b!1125075 m!1038745))

(declare-fun m!1038747 () Bool)

(assert (=> b!1125075 m!1038747))

(declare-fun m!1038749 () Bool)

(assert (=> b!1125075 m!1038749))

(declare-fun m!1038751 () Bool)

(assert (=> b!1125069 m!1038751))

(assert (=> b!1125069 m!1038751))

(declare-fun m!1038753 () Bool)

(assert (=> b!1125069 m!1038753))

(declare-fun m!1038755 () Bool)

(assert (=> b!1125069 m!1038755))

(declare-fun m!1038757 () Bool)

(assert (=> start!98030 m!1038757))

(declare-fun m!1038759 () Bool)

(assert (=> start!98030 m!1038759))

(declare-fun m!1038761 () Bool)

(assert (=> b!1125073 m!1038761))

(declare-fun m!1038763 () Bool)

(assert (=> b!1125073 m!1038763))

(declare-fun m!1038765 () Bool)

(assert (=> b!1125083 m!1038765))

(declare-fun m!1038767 () Bool)

(assert (=> b!1125077 m!1038767))

(declare-fun m!1038769 () Bool)

(assert (=> b!1125077 m!1038769))

(declare-fun m!1038771 () Bool)

(assert (=> b!1125068 m!1038771))

(declare-fun m!1038773 () Bool)

(assert (=> b!1125068 m!1038773))

(declare-fun m!1038775 () Bool)

(assert (=> b!1125065 m!1038775))

(declare-fun m!1038777 () Bool)

(assert (=> b!1125082 m!1038777))

(declare-fun m!1038779 () Bool)

(assert (=> b!1125082 m!1038779))

(declare-fun m!1038781 () Bool)

(assert (=> b!1125081 m!1038781))

(declare-fun m!1038783 () Bool)

(assert (=> mapNonEmpty!44218 m!1038783))

(declare-fun m!1038785 () Bool)

(assert (=> b!1125076 m!1038785))

(assert (=> bm!47468 m!1038773))

(declare-fun m!1038787 () Bool)

(assert (=> b!1125078 m!1038787))

(declare-fun m!1038789 () Bool)

(assert (=> b!1125066 m!1038789))

(declare-fun m!1038791 () Bool)

(assert (=> bm!47467 m!1038791))

(check-sat b_and!38237 (not bm!47468) (not b!1125069) (not b!1125068) (not b!1125084) (not bm!47467) tp_is_empty!28267 (not b!1125076) (not b!1125066) (not b!1125083) (not mapNonEmpty!44218) (not b!1125081) (not b!1125065) (not b_next!23737) (not b!1125073) (not b!1125082) (not b_lambda!18689) (not b!1125075) (not b!1125077) (not start!98030))
(check-sat b_and!38237 (not b_next!23737))
