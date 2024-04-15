; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97370 () Bool)

(assert start!97370)

(declare-fun b_free!23347 () Bool)

(declare-fun b_next!23347 () Bool)

(assert (=> start!97370 (= b_free!23347 (not b_next!23347))))

(declare-fun tp!82340 () Bool)

(declare-fun b_and!37507 () Bool)

(assert (=> start!97370 (= tp!82340 b_and!37507)))

(declare-datatypes ((V!41937 0))(
  ( (V!41938 (val!13860 Int)) )
))
(declare-fun zeroValue!944 () V!41937)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46711 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17584 0))(
  ( (tuple2!17585 (_1!8803 (_ BitVec 64)) (_2!8803 V!41937)) )
))
(declare-datatypes ((List!24240 0))(
  ( (Nil!24237) (Cons!24236 (h!25445 tuple2!17584) (t!34624 List!24240)) )
))
(declare-datatypes ((ListLongMap!15553 0))(
  ( (ListLongMap!15554 (toList!7792 List!24240)) )
))
(declare-fun call!46714 () ListLongMap!15553)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13094 0))(
  ( (ValueCellFull!13094 (v!16492 V!41937)) (EmptyCell!13094) )
))
(declare-datatypes ((array!72024 0))(
  ( (array!72025 (arr!34665 (Array (_ BitVec 32) ValueCell!13094)) (size!35203 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72024)

(declare-datatypes ((array!72026 0))(
  ( (array!72027 (arr!34666 (Array (_ BitVec 32) (_ BitVec 64))) (size!35204 (_ BitVec 32))) )
))
(declare-fun lt!495900 () array!72026)

(declare-fun minValue!944 () V!41937)

(declare-fun getCurrentListMapNoExtraKeys!4307 (array!72026 array!72024 (_ BitVec 32) (_ BitVec 32) V!41937 V!41937 (_ BitVec 32) Int) ListLongMap!15553)

(declare-fun dynLambda!2372 (Int (_ BitVec 64)) V!41937)

(assert (=> bm!46711 (= call!46714 (getCurrentListMapNoExtraKeys!4307 lt!495900 (array!72025 (store (arr!34665 _values!996) i!673 (ValueCellFull!13094 (dynLambda!2372 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35203 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109940 () Bool)

(declare-fun res!740730 () Bool)

(declare-fun e!633035 () Bool)

(assert (=> b!1109940 (=> (not res!740730) (not e!633035))))

(declare-datatypes ((List!24241 0))(
  ( (Nil!24238) (Cons!24237 (h!25446 (_ BitVec 64)) (t!34625 List!24241)) )
))
(declare-fun arrayNoDuplicates!0 (array!72026 (_ BitVec 32) List!24241) Bool)

(assert (=> b!1109940 (= res!740730 (arrayNoDuplicates!0 lt!495900 #b00000000000000000000000000000000 Nil!24238))))

(declare-fun b!1109941 () Bool)

(declare-fun e!633031 () Bool)

(declare-fun e!633032 () Bool)

(declare-fun mapRes!43228 () Bool)

(assert (=> b!1109941 (= e!633031 (and e!633032 mapRes!43228))))

(declare-fun condMapEmpty!43228 () Bool)

(declare-fun mapDefault!43228 () ValueCell!13094)

(assert (=> b!1109941 (= condMapEmpty!43228 (= (arr!34665 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13094)) mapDefault!43228)))))

(declare-fun b!1109942 () Bool)

(declare-fun res!740726 () Bool)

(declare-fun e!633036 () Bool)

(assert (=> b!1109942 (=> (not res!740726) (not e!633036))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109942 (= res!740726 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43228 () Bool)

(assert (=> mapIsEmpty!43228 mapRes!43228))

(declare-fun res!740724 () Bool)

(assert (=> start!97370 (=> (not res!740724) (not e!633036))))

(declare-fun _keys!1208 () array!72026)

(assert (=> start!97370 (= res!740724 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35204 _keys!1208))))))

(assert (=> start!97370 e!633036))

(declare-fun tp_is_empty!27607 () Bool)

(assert (=> start!97370 tp_is_empty!27607))

(declare-fun array_inv!26722 (array!72026) Bool)

(assert (=> start!97370 (array_inv!26722 _keys!1208)))

(assert (=> start!97370 true))

(assert (=> start!97370 tp!82340))

(declare-fun array_inv!26723 (array!72024) Bool)

(assert (=> start!97370 (and (array_inv!26723 _values!996) e!633031)))

(declare-fun b!1109943 () Bool)

(assert (=> b!1109943 (= e!633036 e!633035)))

(declare-fun res!740731 () Bool)

(assert (=> b!1109943 (=> (not res!740731) (not e!633035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72026 (_ BitVec 32)) Bool)

(assert (=> b!1109943 (= res!740731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495900 mask!1564))))

(assert (=> b!1109943 (= lt!495900 (array!72027 (store (arr!34666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35204 _keys!1208)))))

(declare-fun b!1109944 () Bool)

(declare-fun res!740721 () Bool)

(assert (=> b!1109944 (=> (not res!740721) (not e!633036))))

(assert (=> b!1109944 (= res!740721 (= (select (arr!34666 _keys!1208) i!673) k0!934))))

(declare-fun b!1109945 () Bool)

(assert (=> b!1109945 (= e!633032 tp_is_empty!27607)))

(declare-fun call!46715 () ListLongMap!15553)

(declare-fun bm!46712 () Bool)

(assert (=> bm!46712 (= call!46715 (getCurrentListMapNoExtraKeys!4307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43228 () Bool)

(declare-fun tp!82339 () Bool)

(declare-fun e!633030 () Bool)

(assert (=> mapNonEmpty!43228 (= mapRes!43228 (and tp!82339 e!633030))))

(declare-fun mapValue!43228 () ValueCell!13094)

(declare-fun mapRest!43228 () (Array (_ BitVec 32) ValueCell!13094))

(declare-fun mapKey!43228 () (_ BitVec 32))

(assert (=> mapNonEmpty!43228 (= (arr!34665 _values!996) (store mapRest!43228 mapKey!43228 mapValue!43228))))

(declare-fun b!1109946 () Bool)

(declare-fun res!740723 () Bool)

(assert (=> b!1109946 (=> (not res!740723) (not e!633036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109946 (= res!740723 (validMask!0 mask!1564))))

(declare-fun b!1109947 () Bool)

(declare-fun res!740722 () Bool)

(assert (=> b!1109947 (=> (not res!740722) (not e!633036))))

(assert (=> b!1109947 (= res!740722 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24238))))

(declare-fun b!1109948 () Bool)

(declare-fun e!633033 () Bool)

(declare-fun -!1008 (ListLongMap!15553 (_ BitVec 64)) ListLongMap!15553)

(assert (=> b!1109948 (= e!633033 (= call!46714 (-!1008 call!46715 k0!934)))))

(declare-fun b!1109949 () Bool)

(declare-fun res!740727 () Bool)

(assert (=> b!1109949 (=> (not res!740727) (not e!633036))))

(assert (=> b!1109949 (= res!740727 (and (= (size!35203 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35204 _keys!1208) (size!35203 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109950 () Bool)

(declare-fun res!740725 () Bool)

(assert (=> b!1109950 (=> (not res!740725) (not e!633036))))

(assert (=> b!1109950 (= res!740725 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35204 _keys!1208))))))

(declare-fun b!1109951 () Bool)

(declare-fun res!740728 () Bool)

(assert (=> b!1109951 (=> (not res!740728) (not e!633036))))

(assert (=> b!1109951 (= res!740728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109952 () Bool)

(declare-fun e!633029 () Bool)

(assert (=> b!1109952 (= e!633029 true)))

(assert (=> b!1109952 e!633033))

(declare-fun c!109185 () Bool)

(assert (=> b!1109952 (= c!109185 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36237 0))(
  ( (Unit!36238) )
))
(declare-fun lt!495898 () Unit!36237)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!280 (array!72026 array!72024 (_ BitVec 32) (_ BitVec 32) V!41937 V!41937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36237)

(assert (=> b!1109952 (= lt!495898 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109953 () Bool)

(assert (=> b!1109953 (= e!633033 (= call!46714 call!46715))))

(declare-fun b!1109954 () Bool)

(assert (=> b!1109954 (= e!633030 tp_is_empty!27607)))

(declare-fun b!1109955 () Bool)

(assert (=> b!1109955 (= e!633035 (not e!633029))))

(declare-fun res!740729 () Bool)

(assert (=> b!1109955 (=> res!740729 e!633029)))

(assert (=> b!1109955 (= res!740729 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35204 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109955 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495899 () Unit!36237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72026 (_ BitVec 64) (_ BitVec 32)) Unit!36237)

(assert (=> b!1109955 (= lt!495899 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97370 res!740724) b!1109946))

(assert (= (and b!1109946 res!740723) b!1109949))

(assert (= (and b!1109949 res!740727) b!1109951))

(assert (= (and b!1109951 res!740728) b!1109947))

(assert (= (and b!1109947 res!740722) b!1109950))

(assert (= (and b!1109950 res!740725) b!1109942))

(assert (= (and b!1109942 res!740726) b!1109944))

(assert (= (and b!1109944 res!740721) b!1109943))

(assert (= (and b!1109943 res!740731) b!1109940))

(assert (= (and b!1109940 res!740730) b!1109955))

(assert (= (and b!1109955 (not res!740729)) b!1109952))

(assert (= (and b!1109952 c!109185) b!1109948))

(assert (= (and b!1109952 (not c!109185)) b!1109953))

(assert (= (or b!1109948 b!1109953) bm!46711))

(assert (= (or b!1109948 b!1109953) bm!46712))

(assert (= (and b!1109941 condMapEmpty!43228) mapIsEmpty!43228))

(assert (= (and b!1109941 (not condMapEmpty!43228)) mapNonEmpty!43228))

(get-info :version)

(assert (= (and mapNonEmpty!43228 ((_ is ValueCellFull!13094) mapValue!43228)) b!1109954))

(assert (= (and b!1109941 ((_ is ValueCellFull!13094) mapDefault!43228)) b!1109945))

(assert (= start!97370 b!1109941))

(declare-fun b_lambda!18351 () Bool)

(assert (=> (not b_lambda!18351) (not bm!46711)))

(declare-fun t!34623 () Bool)

(declare-fun tb!8205 () Bool)

(assert (=> (and start!97370 (= defaultEntry!1004 defaultEntry!1004) t!34623) tb!8205))

(declare-fun result!16979 () Bool)

(assert (=> tb!8205 (= result!16979 tp_is_empty!27607)))

(assert (=> bm!46711 t!34623))

(declare-fun b_and!37509 () Bool)

(assert (= b_and!37507 (and (=> t!34623 result!16979) b_and!37509)))

(declare-fun m!1027569 () Bool)

(assert (=> b!1109943 m!1027569))

(declare-fun m!1027571 () Bool)

(assert (=> b!1109943 m!1027571))

(declare-fun m!1027573 () Bool)

(assert (=> bm!46711 m!1027573))

(declare-fun m!1027575 () Bool)

(assert (=> bm!46711 m!1027575))

(declare-fun m!1027577 () Bool)

(assert (=> bm!46711 m!1027577))

(declare-fun m!1027579 () Bool)

(assert (=> mapNonEmpty!43228 m!1027579))

(declare-fun m!1027581 () Bool)

(assert (=> b!1109940 m!1027581))

(declare-fun m!1027583 () Bool)

(assert (=> b!1109948 m!1027583))

(declare-fun m!1027585 () Bool)

(assert (=> start!97370 m!1027585))

(declare-fun m!1027587 () Bool)

(assert (=> start!97370 m!1027587))

(declare-fun m!1027589 () Bool)

(assert (=> b!1109947 m!1027589))

(declare-fun m!1027591 () Bool)

(assert (=> bm!46712 m!1027591))

(declare-fun m!1027593 () Bool)

(assert (=> b!1109946 m!1027593))

(declare-fun m!1027595 () Bool)

(assert (=> b!1109951 m!1027595))

(declare-fun m!1027597 () Bool)

(assert (=> b!1109944 m!1027597))

(declare-fun m!1027599 () Bool)

(assert (=> b!1109955 m!1027599))

(declare-fun m!1027601 () Bool)

(assert (=> b!1109955 m!1027601))

(declare-fun m!1027603 () Bool)

(assert (=> b!1109952 m!1027603))

(declare-fun m!1027605 () Bool)

(assert (=> b!1109942 m!1027605))

(check-sat (not b!1109951) (not bm!46712) (not mapNonEmpty!43228) (not b!1109946) (not b!1109940) (not b_lambda!18351) (not b!1109942) (not b!1109943) (not start!97370) (not b!1109947) (not b!1109955) tp_is_empty!27607 (not b!1109952) (not bm!46711) b_and!37509 (not b_next!23347) (not b!1109948))
(check-sat b_and!37509 (not b_next!23347))
