; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97672 () Bool)

(assert start!97672)

(declare-fun b_free!23407 () Bool)

(declare-fun b_next!23407 () Bool)

(assert (=> start!97672 (= b_free!23407 (not b_next!23407))))

(declare-fun tp!82520 () Bool)

(declare-fun b_and!37661 () Bool)

(assert (=> start!97672 (= tp!82520 b_and!37661)))

(declare-fun e!634697 () Bool)

(declare-datatypes ((V!42017 0))(
  ( (V!42018 (val!13890 Int)) )
))
(declare-datatypes ((tuple2!17598 0))(
  ( (tuple2!17599 (_1!8810 (_ BitVec 64)) (_2!8810 V!42017)) )
))
(declare-datatypes ((List!24279 0))(
  ( (Nil!24276) (Cons!24275 (h!25493 tuple2!17598) (t!34724 List!24279)) )
))
(declare-datatypes ((ListLongMap!15575 0))(
  ( (ListLongMap!15576 (toList!7803 List!24279)) )
))
(declare-fun call!46984 () ListLongMap!15575)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1112908 () Bool)

(declare-fun call!46985 () ListLongMap!15575)

(declare-fun -!1051 (ListLongMap!15575 (_ BitVec 64)) ListLongMap!15575)

(assert (=> b!1112908 (= e!634697 (= call!46984 (-!1051 call!46985 k0!934)))))

(declare-fun b!1112909 () Bool)

(declare-fun e!634693 () Bool)

(assert (=> b!1112909 (= e!634693 true)))

(assert (=> b!1112909 e!634697))

(declare-fun c!109718 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112909 (= c!109718 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42017)

(declare-datatypes ((array!72285 0))(
  ( (array!72286 (arr!34789 (Array (_ BitVec 32) (_ BitVec 64))) (size!35326 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72285)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13124 0))(
  ( (ValueCellFull!13124 (v!16519 V!42017)) (EmptyCell!13124) )
))
(declare-datatypes ((array!72287 0))(
  ( (array!72288 (arr!34790 (Array (_ BitVec 32) ValueCell!13124)) (size!35327 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72287)

(declare-fun minValue!944 () V!42017)

(declare-datatypes ((Unit!36453 0))(
  ( (Unit!36454) )
))
(declare-fun lt!496885 () Unit!36453)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!315 (array!72285 array!72287 (_ BitVec 32) (_ BitVec 32) V!42017 V!42017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36453)

(assert (=> b!1112909 (= lt!496885 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112910 () Bool)

(declare-fun e!634696 () Bool)

(declare-fun e!634694 () Bool)

(declare-fun mapRes!43318 () Bool)

(assert (=> b!1112910 (= e!634696 (and e!634694 mapRes!43318))))

(declare-fun condMapEmpty!43318 () Bool)

(declare-fun mapDefault!43318 () ValueCell!13124)

(assert (=> b!1112910 (= condMapEmpty!43318 (= (arr!34790 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13124)) mapDefault!43318)))))

(declare-fun b!1112911 () Bool)

(declare-fun res!742309 () Bool)

(declare-fun e!634698 () Bool)

(assert (=> b!1112911 (=> (not res!742309) (not e!634698))))

(assert (=> b!1112911 (= res!742309 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35326 _keys!1208))))))

(declare-fun bm!46981 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4334 (array!72285 array!72287 (_ BitVec 32) (_ BitVec 32) V!42017 V!42017 (_ BitVec 32) Int) ListLongMap!15575)

(assert (=> bm!46981 (= call!46985 (getCurrentListMapNoExtraKeys!4334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112912 () Bool)

(declare-fun res!742305 () Bool)

(assert (=> b!1112912 (=> (not res!742305) (not e!634698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112912 (= res!742305 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43318 () Bool)

(declare-fun tp!82519 () Bool)

(declare-fun e!634691 () Bool)

(assert (=> mapNonEmpty!43318 (= mapRes!43318 (and tp!82519 e!634691))))

(declare-fun mapKey!43318 () (_ BitVec 32))

(declare-fun mapRest!43318 () (Array (_ BitVec 32) ValueCell!13124))

(declare-fun mapValue!43318 () ValueCell!13124)

(assert (=> mapNonEmpty!43318 (= (arr!34790 _values!996) (store mapRest!43318 mapKey!43318 mapValue!43318))))

(declare-fun b!1112913 () Bool)

(declare-fun res!742306 () Bool)

(assert (=> b!1112913 (=> (not res!742306) (not e!634698))))

(assert (=> b!1112913 (= res!742306 (= (select (arr!34789 _keys!1208) i!673) k0!934))))

(declare-fun lt!496883 () array!72285)

(declare-fun bm!46982 () Bool)

(declare-fun dynLambda!2445 (Int (_ BitVec 64)) V!42017)

(assert (=> bm!46982 (= call!46984 (getCurrentListMapNoExtraKeys!4334 lt!496883 (array!72288 (store (arr!34790 _values!996) i!673 (ValueCellFull!13124 (dynLambda!2445 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35327 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112914 () Bool)

(declare-fun tp_is_empty!27667 () Bool)

(assert (=> b!1112914 (= e!634694 tp_is_empty!27667)))

(declare-fun b!1112915 () Bool)

(declare-fun res!742303 () Bool)

(assert (=> b!1112915 (=> (not res!742303) (not e!634698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112915 (= res!742303 (validMask!0 mask!1564))))

(declare-fun b!1112916 () Bool)

(declare-fun res!742312 () Bool)

(assert (=> b!1112916 (=> (not res!742312) (not e!634698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72285 (_ BitVec 32)) Bool)

(assert (=> b!1112916 (= res!742312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112917 () Bool)

(declare-fun e!634692 () Bool)

(assert (=> b!1112917 (= e!634698 e!634692)))

(declare-fun res!742307 () Bool)

(assert (=> b!1112917 (=> (not res!742307) (not e!634692))))

(assert (=> b!1112917 (= res!742307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496883 mask!1564))))

(assert (=> b!1112917 (= lt!496883 (array!72286 (store (arr!34789 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35326 _keys!1208)))))

(declare-fun res!742304 () Bool)

(assert (=> start!97672 (=> (not res!742304) (not e!634698))))

(assert (=> start!97672 (= res!742304 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35326 _keys!1208))))))

(assert (=> start!97672 e!634698))

(assert (=> start!97672 tp_is_empty!27667))

(declare-fun array_inv!26806 (array!72285) Bool)

(assert (=> start!97672 (array_inv!26806 _keys!1208)))

(assert (=> start!97672 true))

(assert (=> start!97672 tp!82520))

(declare-fun array_inv!26807 (array!72287) Bool)

(assert (=> start!97672 (and (array_inv!26807 _values!996) e!634696)))

(declare-fun b!1112918 () Bool)

(declare-fun res!742302 () Bool)

(assert (=> b!1112918 (=> (not res!742302) (not e!634692))))

(declare-datatypes ((List!24280 0))(
  ( (Nil!24277) (Cons!24276 (h!25494 (_ BitVec 64)) (t!34725 List!24280)) )
))
(declare-fun arrayNoDuplicates!0 (array!72285 (_ BitVec 32) List!24280) Bool)

(assert (=> b!1112918 (= res!742302 (arrayNoDuplicates!0 lt!496883 #b00000000000000000000000000000000 Nil!24277))))

(declare-fun mapIsEmpty!43318 () Bool)

(assert (=> mapIsEmpty!43318 mapRes!43318))

(declare-fun b!1112919 () Bool)

(assert (=> b!1112919 (= e!634697 (= call!46984 call!46985))))

(declare-fun b!1112920 () Bool)

(assert (=> b!1112920 (= e!634692 (not e!634693))))

(declare-fun res!742311 () Bool)

(assert (=> b!1112920 (=> res!742311 e!634693)))

(assert (=> b!1112920 (= res!742311 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35326 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112920 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496884 () Unit!36453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72285 (_ BitVec 64) (_ BitVec 32)) Unit!36453)

(assert (=> b!1112920 (= lt!496884 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112921 () Bool)

(declare-fun res!742308 () Bool)

(assert (=> b!1112921 (=> (not res!742308) (not e!634698))))

(assert (=> b!1112921 (= res!742308 (and (= (size!35327 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35326 _keys!1208) (size!35327 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112922 () Bool)

(assert (=> b!1112922 (= e!634691 tp_is_empty!27667)))

(declare-fun b!1112923 () Bool)

(declare-fun res!742310 () Bool)

(assert (=> b!1112923 (=> (not res!742310) (not e!634698))))

(assert (=> b!1112923 (= res!742310 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24277))))

(assert (= (and start!97672 res!742304) b!1112915))

(assert (= (and b!1112915 res!742303) b!1112921))

(assert (= (and b!1112921 res!742308) b!1112916))

(assert (= (and b!1112916 res!742312) b!1112923))

(assert (= (and b!1112923 res!742310) b!1112911))

(assert (= (and b!1112911 res!742309) b!1112912))

(assert (= (and b!1112912 res!742305) b!1112913))

(assert (= (and b!1112913 res!742306) b!1112917))

(assert (= (and b!1112917 res!742307) b!1112918))

(assert (= (and b!1112918 res!742302) b!1112920))

(assert (= (and b!1112920 (not res!742311)) b!1112909))

(assert (= (and b!1112909 c!109718) b!1112908))

(assert (= (and b!1112909 (not c!109718)) b!1112919))

(assert (= (or b!1112908 b!1112919) bm!46982))

(assert (= (or b!1112908 b!1112919) bm!46981))

(assert (= (and b!1112910 condMapEmpty!43318) mapIsEmpty!43318))

(assert (= (and b!1112910 (not condMapEmpty!43318)) mapNonEmpty!43318))

(get-info :version)

(assert (= (and mapNonEmpty!43318 ((_ is ValueCellFull!13124) mapValue!43318)) b!1112922))

(assert (= (and b!1112910 ((_ is ValueCellFull!13124) mapDefault!43318)) b!1112914))

(assert (= start!97672 b!1112910))

(declare-fun b_lambda!18441 () Bool)

(assert (=> (not b_lambda!18441) (not bm!46982)))

(declare-fun t!34723 () Bool)

(declare-fun tb!8265 () Bool)

(assert (=> (and start!97672 (= defaultEntry!1004 defaultEntry!1004) t!34723) tb!8265))

(declare-fun result!17099 () Bool)

(assert (=> tb!8265 (= result!17099 tp_is_empty!27667)))

(assert (=> bm!46982 t!34723))

(declare-fun b_and!37663 () Bool)

(assert (= b_and!37661 (and (=> t!34723 result!17099) b_and!37663)))

(declare-fun m!1031007 () Bool)

(assert (=> b!1112908 m!1031007))

(declare-fun m!1031009 () Bool)

(assert (=> b!1112920 m!1031009))

(declare-fun m!1031011 () Bool)

(assert (=> b!1112920 m!1031011))

(declare-fun m!1031013 () Bool)

(assert (=> bm!46982 m!1031013))

(declare-fun m!1031015 () Bool)

(assert (=> bm!46982 m!1031015))

(declare-fun m!1031017 () Bool)

(assert (=> bm!46982 m!1031017))

(declare-fun m!1031019 () Bool)

(assert (=> b!1112923 m!1031019))

(declare-fun m!1031021 () Bool)

(assert (=> b!1112913 m!1031021))

(declare-fun m!1031023 () Bool)

(assert (=> b!1112912 m!1031023))

(declare-fun m!1031025 () Bool)

(assert (=> start!97672 m!1031025))

(declare-fun m!1031027 () Bool)

(assert (=> start!97672 m!1031027))

(declare-fun m!1031029 () Bool)

(assert (=> bm!46981 m!1031029))

(declare-fun m!1031031 () Bool)

(assert (=> b!1112915 m!1031031))

(declare-fun m!1031033 () Bool)

(assert (=> b!1112909 m!1031033))

(declare-fun m!1031035 () Bool)

(assert (=> b!1112916 m!1031035))

(declare-fun m!1031037 () Bool)

(assert (=> mapNonEmpty!43318 m!1031037))

(declare-fun m!1031039 () Bool)

(assert (=> b!1112918 m!1031039))

(declare-fun m!1031041 () Bool)

(assert (=> b!1112917 m!1031041))

(declare-fun m!1031043 () Bool)

(assert (=> b!1112917 m!1031043))

(check-sat b_and!37663 (not start!97672) (not b!1112920) (not b_lambda!18441) (not b!1112909) (not b!1112916) (not b!1112918) (not b_next!23407) (not b!1112912) (not b!1112915) (not b!1112917) (not b!1112908) (not bm!46982) (not bm!46981) (not mapNonEmpty!43318) (not b!1112923) tp_is_empty!27667)
(check-sat b_and!37663 (not b_next!23407))
