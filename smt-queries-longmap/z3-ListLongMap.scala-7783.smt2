; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97444 () Bool)

(assert start!97444)

(declare-fun b_free!23415 () Bool)

(declare-fun b_next!23415 () Bool)

(assert (=> start!97444 (= b_free!23415 (not b_next!23415))))

(declare-fun tp!82543 () Bool)

(declare-fun b_and!37667 () Bool)

(assert (=> start!97444 (= tp!82543 b_and!37667)))

(declare-fun b!1111781 () Bool)

(declare-fun res!741920 () Bool)

(declare-fun e!633937 () Bool)

(assert (=> b!1111781 (=> (not res!741920) (not e!633937))))

(declare-datatypes ((array!72265 0))(
  ( (array!72266 (arr!34785 (Array (_ BitVec 32) (_ BitVec 64))) (size!35321 (_ BitVec 32))) )
))
(declare-fun lt!496404 () array!72265)

(declare-datatypes ((List!24269 0))(
  ( (Nil!24266) (Cons!24265 (h!25474 (_ BitVec 64)) (t!34730 List!24269)) )
))
(declare-fun arrayNoDuplicates!0 (array!72265 (_ BitVec 32) List!24269) Bool)

(assert (=> b!1111781 (= res!741920 (arrayNoDuplicates!0 lt!496404 #b00000000000000000000000000000000 Nil!24266))))

(declare-datatypes ((V!42027 0))(
  ( (V!42028 (val!13894 Int)) )
))
(declare-fun zeroValue!944 () V!42027)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42027)

(declare-fun bm!46938 () Bool)

(declare-datatypes ((ValueCell!13128 0))(
  ( (ValueCellFull!13128 (v!16527 V!42027)) (EmptyCell!13128) )
))
(declare-datatypes ((array!72267 0))(
  ( (array!72268 (arr!34786 (Array (_ BitVec 32) ValueCell!13128)) (size!35322 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72267)

(declare-datatypes ((tuple2!17586 0))(
  ( (tuple2!17587 (_1!8804 (_ BitVec 64)) (_2!8804 V!42027)) )
))
(declare-datatypes ((List!24270 0))(
  ( (Nil!24267) (Cons!24266 (h!25475 tuple2!17586) (t!34731 List!24270)) )
))
(declare-datatypes ((ListLongMap!15555 0))(
  ( (ListLongMap!15556 (toList!7793 List!24270)) )
))
(declare-fun call!46942 () ListLongMap!15555)

(declare-fun getCurrentListMapNoExtraKeys!4284 (array!72265 array!72267 (_ BitVec 32) (_ BitVec 32) V!42027 V!42027 (_ BitVec 32) Int) ListLongMap!15555)

(declare-fun dynLambda!2411 (Int (_ BitVec 64)) V!42027)

(assert (=> bm!46938 (= call!46942 (getCurrentListMapNoExtraKeys!4284 lt!496404 (array!72268 (store (arr!34786 _values!996) i!673 (ValueCellFull!13128 (dynLambda!2411 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35322 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111783 () Bool)

(declare-fun res!741918 () Bool)

(declare-fun e!633934 () Bool)

(assert (=> b!1111783 (=> (not res!741918) (not e!633934))))

(declare-fun _keys!1208 () array!72265)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72265 (_ BitVec 32)) Bool)

(assert (=> b!1111783 (= res!741918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1111784 () Bool)

(declare-fun call!46941 () ListLongMap!15555)

(declare-fun e!633939 () Bool)

(declare-fun -!1059 (ListLongMap!15555 (_ BitVec 64)) ListLongMap!15555)

(assert (=> b!1111784 (= e!633939 (= call!46942 (-!1059 call!46941 k0!934)))))

(declare-fun b!1111785 () Bool)

(declare-fun e!633933 () Bool)

(assert (=> b!1111785 (= e!633937 (not e!633933))))

(declare-fun res!741919 () Bool)

(assert (=> b!1111785 (=> res!741919 e!633933)))

(assert (=> b!1111785 (= res!741919 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35321 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36486 0))(
  ( (Unit!36487) )
))
(declare-fun lt!496406 () Unit!36486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72265 (_ BitVec 64) (_ BitVec 32)) Unit!36486)

(assert (=> b!1111785 (= lt!496406 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!46939 () Bool)

(assert (=> bm!46939 (= call!46941 (getCurrentListMapNoExtraKeys!4284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111786 () Bool)

(assert (=> b!1111786 (= e!633934 e!633937)))

(declare-fun res!741922 () Bool)

(assert (=> b!1111786 (=> (not res!741922) (not e!633937))))

(assert (=> b!1111786 (= res!741922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496404 mask!1564))))

(assert (=> b!1111786 (= lt!496404 (array!72266 (store (arr!34785 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35321 _keys!1208)))))

(declare-fun b!1111787 () Bool)

(declare-fun e!633936 () Bool)

(declare-fun e!633932 () Bool)

(declare-fun mapRes!43330 () Bool)

(assert (=> b!1111787 (= e!633936 (and e!633932 mapRes!43330))))

(declare-fun condMapEmpty!43330 () Bool)

(declare-fun mapDefault!43330 () ValueCell!13128)

(assert (=> b!1111787 (= condMapEmpty!43330 (= (arr!34786 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13128)) mapDefault!43330)))))

(declare-fun b!1111788 () Bool)

(declare-fun res!741912 () Bool)

(assert (=> b!1111788 (=> (not res!741912) (not e!633934))))

(assert (=> b!1111788 (= res!741912 (and (= (size!35322 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35321 _keys!1208) (size!35322 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111789 () Bool)

(declare-fun res!741914 () Bool)

(assert (=> b!1111789 (=> (not res!741914) (not e!633934))))

(assert (=> b!1111789 (= res!741914 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35321 _keys!1208))))))

(declare-fun mapIsEmpty!43330 () Bool)

(assert (=> mapIsEmpty!43330 mapRes!43330))

(declare-fun b!1111790 () Bool)

(declare-fun res!741921 () Bool)

(assert (=> b!1111790 (=> (not res!741921) (not e!633934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111790 (= res!741921 (validKeyInArray!0 k0!934))))

(declare-fun b!1111791 () Bool)

(assert (=> b!1111791 (= e!633933 true)))

(assert (=> b!1111791 e!633939))

(declare-fun c!109320 () Bool)

(assert (=> b!1111791 (= c!109320 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496405 () Unit!36486)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!308 (array!72265 array!72267 (_ BitVec 32) (_ BitVec 32) V!42027 V!42027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36486)

(assert (=> b!1111791 (= lt!496405 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!308 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111792 () Bool)

(assert (=> b!1111792 (= e!633939 (= call!46942 call!46941))))

(declare-fun b!1111793 () Bool)

(declare-fun res!741913 () Bool)

(assert (=> b!1111793 (=> (not res!741913) (not e!633934))))

(assert (=> b!1111793 (= res!741913 (= (select (arr!34785 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43330 () Bool)

(declare-fun tp!82544 () Bool)

(declare-fun e!633935 () Bool)

(assert (=> mapNonEmpty!43330 (= mapRes!43330 (and tp!82544 e!633935))))

(declare-fun mapValue!43330 () ValueCell!13128)

(declare-fun mapKey!43330 () (_ BitVec 32))

(declare-fun mapRest!43330 () (Array (_ BitVec 32) ValueCell!13128))

(assert (=> mapNonEmpty!43330 (= (arr!34786 _values!996) (store mapRest!43330 mapKey!43330 mapValue!43330))))

(declare-fun res!741916 () Bool)

(assert (=> start!97444 (=> (not res!741916) (not e!633934))))

(assert (=> start!97444 (= res!741916 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35321 _keys!1208))))))

(assert (=> start!97444 e!633934))

(declare-fun tp_is_empty!27675 () Bool)

(assert (=> start!97444 tp_is_empty!27675))

(declare-fun array_inv!26752 (array!72265) Bool)

(assert (=> start!97444 (array_inv!26752 _keys!1208)))

(assert (=> start!97444 true))

(assert (=> start!97444 tp!82543))

(declare-fun array_inv!26753 (array!72267) Bool)

(assert (=> start!97444 (and (array_inv!26753 _values!996) e!633936)))

(declare-fun b!1111782 () Bool)

(assert (=> b!1111782 (= e!633935 tp_is_empty!27675)))

(declare-fun b!1111794 () Bool)

(assert (=> b!1111794 (= e!633932 tp_is_empty!27675)))

(declare-fun b!1111795 () Bool)

(declare-fun res!741917 () Bool)

(assert (=> b!1111795 (=> (not res!741917) (not e!633934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111795 (= res!741917 (validMask!0 mask!1564))))

(declare-fun b!1111796 () Bool)

(declare-fun res!741915 () Bool)

(assert (=> b!1111796 (=> (not res!741915) (not e!633934))))

(assert (=> b!1111796 (= res!741915 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24266))))

(assert (= (and start!97444 res!741916) b!1111795))

(assert (= (and b!1111795 res!741917) b!1111788))

(assert (= (and b!1111788 res!741912) b!1111783))

(assert (= (and b!1111783 res!741918) b!1111796))

(assert (= (and b!1111796 res!741915) b!1111789))

(assert (= (and b!1111789 res!741914) b!1111790))

(assert (= (and b!1111790 res!741921) b!1111793))

(assert (= (and b!1111793 res!741913) b!1111786))

(assert (= (and b!1111786 res!741922) b!1111781))

(assert (= (and b!1111781 res!741920) b!1111785))

(assert (= (and b!1111785 (not res!741919)) b!1111791))

(assert (= (and b!1111791 c!109320) b!1111784))

(assert (= (and b!1111791 (not c!109320)) b!1111792))

(assert (= (or b!1111784 b!1111792) bm!46938))

(assert (= (or b!1111784 b!1111792) bm!46939))

(assert (= (and b!1111787 condMapEmpty!43330) mapIsEmpty!43330))

(assert (= (and b!1111787 (not condMapEmpty!43330)) mapNonEmpty!43330))

(get-info :version)

(assert (= (and mapNonEmpty!43330 ((_ is ValueCellFull!13128) mapValue!43330)) b!1111782))

(assert (= (and b!1111787 ((_ is ValueCellFull!13128) mapDefault!43330)) b!1111794))

(assert (= start!97444 b!1111787))

(declare-fun b_lambda!18439 () Bool)

(assert (=> (not b_lambda!18439) (not bm!46938)))

(declare-fun t!34729 () Bool)

(declare-fun tb!8281 () Bool)

(assert (=> (and start!97444 (= defaultEntry!1004 defaultEntry!1004) t!34729) tb!8281))

(declare-fun result!17123 () Bool)

(assert (=> tb!8281 (= result!17123 tp_is_empty!27675)))

(assert (=> bm!46938 t!34729))

(declare-fun b_and!37669 () Bool)

(assert (= b_and!37667 (and (=> t!34729 result!17123) b_and!37669)))

(declare-fun m!1029487 () Bool)

(assert (=> b!1111791 m!1029487))

(declare-fun m!1029489 () Bool)

(assert (=> bm!46939 m!1029489))

(declare-fun m!1029491 () Bool)

(assert (=> bm!46938 m!1029491))

(declare-fun m!1029493 () Bool)

(assert (=> bm!46938 m!1029493))

(declare-fun m!1029495 () Bool)

(assert (=> bm!46938 m!1029495))

(declare-fun m!1029497 () Bool)

(assert (=> b!1111784 m!1029497))

(declare-fun m!1029499 () Bool)

(assert (=> b!1111793 m!1029499))

(declare-fun m!1029501 () Bool)

(assert (=> b!1111786 m!1029501))

(declare-fun m!1029503 () Bool)

(assert (=> b!1111786 m!1029503))

(declare-fun m!1029505 () Bool)

(assert (=> b!1111785 m!1029505))

(declare-fun m!1029507 () Bool)

(assert (=> b!1111785 m!1029507))

(declare-fun m!1029509 () Bool)

(assert (=> b!1111783 m!1029509))

(declare-fun m!1029511 () Bool)

(assert (=> mapNonEmpty!43330 m!1029511))

(declare-fun m!1029513 () Bool)

(assert (=> b!1111795 m!1029513))

(declare-fun m!1029515 () Bool)

(assert (=> start!97444 m!1029515))

(declare-fun m!1029517 () Bool)

(assert (=> start!97444 m!1029517))

(declare-fun m!1029519 () Bool)

(assert (=> b!1111796 m!1029519))

(declare-fun m!1029521 () Bool)

(assert (=> b!1111781 m!1029521))

(declare-fun m!1029523 () Bool)

(assert (=> b!1111790 m!1029523))

(check-sat (not b!1111791) tp_is_empty!27675 (not bm!46938) (not b!1111784) (not b!1111795) (not b!1111783) (not start!97444) (not b!1111796) (not mapNonEmpty!43330) (not b_lambda!18439) (not b!1111785) (not b!1111786) (not b!1111790) b_and!37669 (not bm!46939) (not b!1111781) (not b_next!23415))
(check-sat b_and!37669 (not b_next!23415))
