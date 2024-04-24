; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97600 () Bool)

(assert start!97600)

(declare-fun b_free!23335 () Bool)

(declare-fun b_next!23335 () Bool)

(assert (=> start!97600 (= b_free!23335 (not b_next!23335))))

(declare-fun tp!82304 () Bool)

(declare-fun b_and!37513 () Bool)

(assert (=> start!97600 (= tp!82304 b_and!37513)))

(declare-datatypes ((V!41921 0))(
  ( (V!41922 (val!13854 Int)) )
))
(declare-datatypes ((tuple2!17530 0))(
  ( (tuple2!17531 (_1!8776 (_ BitVec 64)) (_2!8776 V!41921)) )
))
(declare-datatypes ((List!24215 0))(
  ( (Nil!24212) (Cons!24211 (h!25429 tuple2!17530) (t!34588 List!24215)) )
))
(declare-datatypes ((ListLongMap!15507 0))(
  ( (ListLongMap!15508 (toList!7769 List!24215)) )
))
(declare-fun call!46768 () ListLongMap!15507)

(declare-fun b!1111084 () Bool)

(declare-fun e!633822 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!46769 () ListLongMap!15507)

(declare-fun -!1023 (ListLongMap!15507 (_ BitVec 64)) ListLongMap!15507)

(assert (=> b!1111084 (= e!633822 (= call!46769 (-!1023 call!46768 k0!934)))))

(declare-fun b!1111085 () Bool)

(declare-fun res!741116 () Bool)

(declare-fun e!633819 () Bool)

(assert (=> b!1111085 (=> (not res!741116) (not e!633819))))

(declare-datatypes ((array!72141 0))(
  ( (array!72142 (arr!34717 (Array (_ BitVec 32) (_ BitVec 64))) (size!35254 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72141)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13088 0))(
  ( (ValueCellFull!13088 (v!16483 V!41921)) (EmptyCell!13088) )
))
(declare-datatypes ((array!72143 0))(
  ( (array!72144 (arr!34718 (Array (_ BitVec 32) ValueCell!13088)) (size!35255 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72143)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1111085 (= res!741116 (and (= (size!35255 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35254 _keys!1208) (size!35255 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43210 () Bool)

(declare-fun mapRes!43210 () Bool)

(assert (=> mapIsEmpty!43210 mapRes!43210))

(declare-fun b!1111086 () Bool)

(declare-fun e!633816 () Bool)

(assert (=> b!1111086 (= e!633816 true)))

(assert (=> b!1111086 e!633822))

(declare-fun c!109598 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111086 (= c!109598 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41921)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36395 0))(
  ( (Unit!36396) )
))
(declare-fun lt!496561 () Unit!36395)

(declare-fun minValue!944 () V!41921)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!292 (array!72141 array!72143 (_ BitVec 32) (_ BitVec 32) V!41921 V!41921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36395)

(assert (=> b!1111086 (= lt!496561 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111087 () Bool)

(declare-fun e!633820 () Bool)

(declare-fun tp_is_empty!27595 () Bool)

(assert (=> b!1111087 (= e!633820 tp_is_empty!27595)))

(declare-fun b!1111088 () Bool)

(declare-fun res!741124 () Bool)

(declare-fun e!633817 () Bool)

(assert (=> b!1111088 (=> (not res!741124) (not e!633817))))

(declare-fun lt!496559 () array!72141)

(declare-datatypes ((List!24216 0))(
  ( (Nil!24213) (Cons!24212 (h!25430 (_ BitVec 64)) (t!34589 List!24216)) )
))
(declare-fun arrayNoDuplicates!0 (array!72141 (_ BitVec 32) List!24216) Bool)

(assert (=> b!1111088 (= res!741124 (arrayNoDuplicates!0 lt!496559 #b00000000000000000000000000000000 Nil!24213))))

(declare-fun b!1111089 () Bool)

(assert (=> b!1111089 (= e!633817 (not e!633816))))

(declare-fun res!741122 () Bool)

(assert (=> b!1111089 (=> res!741122 e!633816)))

(assert (=> b!1111089 (= res!741122 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35254 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111089 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496560 () Unit!36395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72141 (_ BitVec 64) (_ BitVec 32)) Unit!36395)

(assert (=> b!1111089 (= lt!496560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!46765 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4302 (array!72141 array!72143 (_ BitVec 32) (_ BitVec 32) V!41921 V!41921 (_ BitVec 32) Int) ListLongMap!15507)

(assert (=> bm!46765 (= call!46768 (getCurrentListMapNoExtraKeys!4302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111090 () Bool)

(declare-fun res!741119 () Bool)

(assert (=> b!1111090 (=> (not res!741119) (not e!633819))))

(assert (=> b!1111090 (= res!741119 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35254 _keys!1208))))))

(declare-fun b!1111091 () Bool)

(declare-fun res!741114 () Bool)

(assert (=> b!1111091 (=> (not res!741114) (not e!633819))))

(assert (=> b!1111091 (= res!741114 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24213))))

(declare-fun b!1111092 () Bool)

(assert (=> b!1111092 (= e!633822 (= call!46769 call!46768))))

(declare-fun b!1111093 () Bool)

(declare-fun res!741121 () Bool)

(assert (=> b!1111093 (=> (not res!741121) (not e!633819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72141 (_ BitVec 32)) Bool)

(assert (=> b!1111093 (= res!741121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111094 () Bool)

(declare-fun res!741118 () Bool)

(assert (=> b!1111094 (=> (not res!741118) (not e!633819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111094 (= res!741118 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43210 () Bool)

(declare-fun tp!82303 () Bool)

(assert (=> mapNonEmpty!43210 (= mapRes!43210 (and tp!82303 e!633820))))

(declare-fun mapKey!43210 () (_ BitVec 32))

(declare-fun mapRest!43210 () (Array (_ BitVec 32) ValueCell!13088))

(declare-fun mapValue!43210 () ValueCell!13088)

(assert (=> mapNonEmpty!43210 (= (arr!34718 _values!996) (store mapRest!43210 mapKey!43210 mapValue!43210))))

(declare-fun res!741123 () Bool)

(assert (=> start!97600 (=> (not res!741123) (not e!633819))))

(assert (=> start!97600 (= res!741123 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35254 _keys!1208))))))

(assert (=> start!97600 e!633819))

(assert (=> start!97600 tp_is_empty!27595))

(declare-fun array_inv!26748 (array!72141) Bool)

(assert (=> start!97600 (array_inv!26748 _keys!1208)))

(assert (=> start!97600 true))

(assert (=> start!97600 tp!82304))

(declare-fun e!633815 () Bool)

(declare-fun array_inv!26749 (array!72143) Bool)

(assert (=> start!97600 (and (array_inv!26749 _values!996) e!633815)))

(declare-fun b!1111095 () Bool)

(declare-fun e!633818 () Bool)

(assert (=> b!1111095 (= e!633818 tp_is_empty!27595)))

(declare-fun b!1111096 () Bool)

(assert (=> b!1111096 (= e!633819 e!633817)))

(declare-fun res!741117 () Bool)

(assert (=> b!1111096 (=> (not res!741117) (not e!633817))))

(assert (=> b!1111096 (= res!741117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496559 mask!1564))))

(assert (=> b!1111096 (= lt!496559 (array!72142 (store (arr!34717 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35254 _keys!1208)))))

(declare-fun b!1111097 () Bool)

(declare-fun res!741120 () Bool)

(assert (=> b!1111097 (=> (not res!741120) (not e!633819))))

(assert (=> b!1111097 (= res!741120 (= (select (arr!34717 _keys!1208) i!673) k0!934))))

(declare-fun bm!46766 () Bool)

(declare-fun dynLambda!2414 (Int (_ BitVec 64)) V!41921)

(assert (=> bm!46766 (= call!46769 (getCurrentListMapNoExtraKeys!4302 lt!496559 (array!72144 (store (arr!34718 _values!996) i!673 (ValueCellFull!13088 (dynLambda!2414 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35255 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111098 () Bool)

(assert (=> b!1111098 (= e!633815 (and e!633818 mapRes!43210))))

(declare-fun condMapEmpty!43210 () Bool)

(declare-fun mapDefault!43210 () ValueCell!13088)

(assert (=> b!1111098 (= condMapEmpty!43210 (= (arr!34718 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13088)) mapDefault!43210)))))

(declare-fun b!1111099 () Bool)

(declare-fun res!741115 () Bool)

(assert (=> b!1111099 (=> (not res!741115) (not e!633819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111099 (= res!741115 (validMask!0 mask!1564))))

(assert (= (and start!97600 res!741123) b!1111099))

(assert (= (and b!1111099 res!741115) b!1111085))

(assert (= (and b!1111085 res!741116) b!1111093))

(assert (= (and b!1111093 res!741121) b!1111091))

(assert (= (and b!1111091 res!741114) b!1111090))

(assert (= (and b!1111090 res!741119) b!1111094))

(assert (= (and b!1111094 res!741118) b!1111097))

(assert (= (and b!1111097 res!741120) b!1111096))

(assert (= (and b!1111096 res!741117) b!1111088))

(assert (= (and b!1111088 res!741124) b!1111089))

(assert (= (and b!1111089 (not res!741122)) b!1111086))

(assert (= (and b!1111086 c!109598) b!1111084))

(assert (= (and b!1111086 (not c!109598)) b!1111092))

(assert (= (or b!1111084 b!1111092) bm!46766))

(assert (= (or b!1111084 b!1111092) bm!46765))

(assert (= (and b!1111098 condMapEmpty!43210) mapIsEmpty!43210))

(assert (= (and b!1111098 (not condMapEmpty!43210)) mapNonEmpty!43210))

(get-info :version)

(assert (= (and mapNonEmpty!43210 ((_ is ValueCellFull!13088) mapValue!43210)) b!1111087))

(assert (= (and b!1111098 ((_ is ValueCellFull!13088) mapDefault!43210)) b!1111095))

(assert (= start!97600 b!1111098))

(declare-fun b_lambda!18365 () Bool)

(assert (=> (not b_lambda!18365) (not bm!46766)))

(declare-fun t!34587 () Bool)

(declare-fun tb!8193 () Bool)

(assert (=> (and start!97600 (= defaultEntry!1004 defaultEntry!1004) t!34587) tb!8193))

(declare-fun result!16955 () Bool)

(assert (=> tb!8193 (= result!16955 tp_is_empty!27595)))

(assert (=> bm!46766 t!34587))

(declare-fun b_and!37515 () Bool)

(assert (= b_and!37513 (and (=> t!34587 result!16955) b_and!37515)))

(declare-fun m!1029639 () Bool)

(assert (=> bm!46766 m!1029639))

(declare-fun m!1029641 () Bool)

(assert (=> bm!46766 m!1029641))

(declare-fun m!1029643 () Bool)

(assert (=> bm!46766 m!1029643))

(declare-fun m!1029645 () Bool)

(assert (=> b!1111094 m!1029645))

(declare-fun m!1029647 () Bool)

(assert (=> b!1111099 m!1029647))

(declare-fun m!1029649 () Bool)

(assert (=> b!1111093 m!1029649))

(declare-fun m!1029651 () Bool)

(assert (=> mapNonEmpty!43210 m!1029651))

(declare-fun m!1029653 () Bool)

(assert (=> bm!46765 m!1029653))

(declare-fun m!1029655 () Bool)

(assert (=> b!1111091 m!1029655))

(declare-fun m!1029657 () Bool)

(assert (=> b!1111086 m!1029657))

(declare-fun m!1029659 () Bool)

(assert (=> b!1111096 m!1029659))

(declare-fun m!1029661 () Bool)

(assert (=> b!1111096 m!1029661))

(declare-fun m!1029663 () Bool)

(assert (=> start!97600 m!1029663))

(declare-fun m!1029665 () Bool)

(assert (=> start!97600 m!1029665))

(declare-fun m!1029667 () Bool)

(assert (=> b!1111089 m!1029667))

(declare-fun m!1029669 () Bool)

(assert (=> b!1111089 m!1029669))

(declare-fun m!1029671 () Bool)

(assert (=> b!1111088 m!1029671))

(declare-fun m!1029673 () Bool)

(assert (=> b!1111097 m!1029673))

(declare-fun m!1029675 () Bool)

(assert (=> b!1111084 m!1029675))

(check-sat (not b!1111099) tp_is_empty!27595 (not bm!46766) (not b!1111096) (not b!1111093) b_and!37515 (not start!97600) (not b!1111084) (not mapNonEmpty!43210) (not b_lambda!18365) (not b!1111091) (not bm!46765) (not b_next!23335) (not b!1111089) (not b!1111086) (not b!1111088) (not b!1111094))
(check-sat b_and!37515 (not b_next!23335))
