; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97636 () Bool)

(assert start!97636)

(declare-fun b_free!23371 () Bool)

(declare-fun b_next!23371 () Bool)

(assert (=> start!97636 (= b_free!23371 (not b_next!23371))))

(declare-fun tp!82412 () Bool)

(declare-fun b_and!37585 () Bool)

(assert (=> start!97636 (= tp!82412 b_and!37585)))

(declare-fun b!1111984 () Bool)

(declare-fun e!634248 () Bool)

(declare-fun e!634254 () Bool)

(assert (=> b!1111984 (= e!634248 (not e!634254))))

(declare-fun res!741717 () Bool)

(assert (=> b!1111984 (=> res!741717 e!634254)))

(declare-datatypes ((array!72213 0))(
  ( (array!72214 (arr!34753 (Array (_ BitVec 32) (_ BitVec 64))) (size!35290 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72213)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1111984 (= res!741717 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35290 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111984 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36423 0))(
  ( (Unit!36424) )
))
(declare-fun lt!496721 () Unit!36423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72213 (_ BitVec 64) (_ BitVec 32)) Unit!36423)

(assert (=> b!1111984 (= lt!496721 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111985 () Bool)

(declare-fun res!741716 () Bool)

(declare-fun e!634251 () Bool)

(assert (=> b!1111985 (=> (not res!741716) (not e!634251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111985 (= res!741716 (validKeyInArray!0 k0!934))))

(declare-fun b!1111986 () Bool)

(declare-fun res!741714 () Bool)

(assert (=> b!1111986 (=> (not res!741714) (not e!634251))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72213 (_ BitVec 32)) Bool)

(assert (=> b!1111986 (= res!741714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!41969 0))(
  ( (V!41970 (val!13872 Int)) )
))
(declare-datatypes ((tuple2!17564 0))(
  ( (tuple2!17565 (_1!8793 (_ BitVec 64)) (_2!8793 V!41969)) )
))
(declare-datatypes ((List!24247 0))(
  ( (Nil!24244) (Cons!24243 (h!25461 tuple2!17564) (t!34656 List!24247)) )
))
(declare-datatypes ((ListLongMap!15541 0))(
  ( (ListLongMap!15542 (toList!7786 List!24247)) )
))
(declare-fun call!46876 () ListLongMap!15541)

(declare-fun call!46877 () ListLongMap!15541)

(declare-fun b!1111987 () Bool)

(declare-fun e!634250 () Bool)

(declare-fun -!1038 (ListLongMap!15541 (_ BitVec 64)) ListLongMap!15541)

(assert (=> b!1111987 (= e!634250 (= call!46877 (-!1038 call!46876 k0!934)))))

(declare-fun b!1111989 () Bool)

(declare-fun res!741715 () Bool)

(assert (=> b!1111989 (=> (not res!741715) (not e!634251))))

(assert (=> b!1111989 (= res!741715 (= (select (arr!34753 _keys!1208) i!673) k0!934))))

(declare-fun b!1111990 () Bool)

(declare-fun res!741710 () Bool)

(assert (=> b!1111990 (=> (not res!741710) (not e!634251))))

(declare-datatypes ((List!24248 0))(
  ( (Nil!24245) (Cons!24244 (h!25462 (_ BitVec 64)) (t!34657 List!24248)) )
))
(declare-fun arrayNoDuplicates!0 (array!72213 (_ BitVec 32) List!24248) Bool)

(assert (=> b!1111990 (= res!741710 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24245))))

(declare-fun b!1111991 () Bool)

(declare-fun res!741718 () Bool)

(assert (=> b!1111991 (=> (not res!741718) (not e!634251))))

(assert (=> b!1111991 (= res!741718 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35290 _keys!1208))))))

(declare-fun mapIsEmpty!43264 () Bool)

(declare-fun mapRes!43264 () Bool)

(assert (=> mapIsEmpty!43264 mapRes!43264))

(declare-fun b!1111992 () Bool)

(assert (=> b!1111992 (= e!634254 true)))

(assert (=> b!1111992 e!634250))

(declare-fun c!109652 () Bool)

(assert (=> b!1111992 (= c!109652 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41969)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13106 0))(
  ( (ValueCellFull!13106 (v!16501 V!41969)) (EmptyCell!13106) )
))
(declare-datatypes ((array!72215 0))(
  ( (array!72216 (arr!34754 (Array (_ BitVec 32) ValueCell!13106)) (size!35291 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72215)

(declare-fun minValue!944 () V!41969)

(declare-fun lt!496722 () Unit!36423)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!303 (array!72213 array!72215 (_ BitVec 32) (_ BitVec 32) V!41969 V!41969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36423)

(assert (=> b!1111992 (= lt!496722 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111993 () Bool)

(assert (=> b!1111993 (= e!634251 e!634248)))

(declare-fun res!741708 () Bool)

(assert (=> b!1111993 (=> (not res!741708) (not e!634248))))

(declare-fun lt!496723 () array!72213)

(assert (=> b!1111993 (= res!741708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496723 mask!1564))))

(assert (=> b!1111993 (= lt!496723 (array!72214 (store (arr!34753 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35290 _keys!1208)))))

(declare-fun b!1111994 () Bool)

(declare-fun e!634249 () Bool)

(declare-fun tp_is_empty!27631 () Bool)

(assert (=> b!1111994 (= e!634249 tp_is_empty!27631)))

(declare-fun b!1111988 () Bool)

(assert (=> b!1111988 (= e!634250 (= call!46877 call!46876))))

(declare-fun res!741713 () Bool)

(assert (=> start!97636 (=> (not res!741713) (not e!634251))))

(assert (=> start!97636 (= res!741713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35290 _keys!1208))))))

(assert (=> start!97636 e!634251))

(assert (=> start!97636 tp_is_empty!27631))

(declare-fun array_inv!26780 (array!72213) Bool)

(assert (=> start!97636 (array_inv!26780 _keys!1208)))

(assert (=> start!97636 true))

(assert (=> start!97636 tp!82412))

(declare-fun e!634253 () Bool)

(declare-fun array_inv!26781 (array!72215) Bool)

(assert (=> start!97636 (and (array_inv!26781 _values!996) e!634253)))

(declare-fun b!1111995 () Bool)

(declare-fun res!741712 () Bool)

(assert (=> b!1111995 (=> (not res!741712) (not e!634251))))

(assert (=> b!1111995 (= res!741712 (and (= (size!35291 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35290 _keys!1208) (size!35291 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46873 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4318 (array!72213 array!72215 (_ BitVec 32) (_ BitVec 32) V!41969 V!41969 (_ BitVec 32) Int) ListLongMap!15541)

(assert (=> bm!46873 (= call!46876 (getCurrentListMapNoExtraKeys!4318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43264 () Bool)

(declare-fun tp!82411 () Bool)

(declare-fun e!634247 () Bool)

(assert (=> mapNonEmpty!43264 (= mapRes!43264 (and tp!82411 e!634247))))

(declare-fun mapKey!43264 () (_ BitVec 32))

(declare-fun mapRest!43264 () (Array (_ BitVec 32) ValueCell!13106))

(declare-fun mapValue!43264 () ValueCell!13106)

(assert (=> mapNonEmpty!43264 (= (arr!34754 _values!996) (store mapRest!43264 mapKey!43264 mapValue!43264))))

(declare-fun b!1111996 () Bool)

(assert (=> b!1111996 (= e!634253 (and e!634249 mapRes!43264))))

(declare-fun condMapEmpty!43264 () Bool)

(declare-fun mapDefault!43264 () ValueCell!13106)

(assert (=> b!1111996 (= condMapEmpty!43264 (= (arr!34754 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13106)) mapDefault!43264)))))

(declare-fun bm!46874 () Bool)

(declare-fun dynLambda!2430 (Int (_ BitVec 64)) V!41969)

(assert (=> bm!46874 (= call!46877 (getCurrentListMapNoExtraKeys!4318 lt!496723 (array!72216 (store (arr!34754 _values!996) i!673 (ValueCellFull!13106 (dynLambda!2430 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35291 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111997 () Bool)

(declare-fun res!741711 () Bool)

(assert (=> b!1111997 (=> (not res!741711) (not e!634248))))

(assert (=> b!1111997 (= res!741711 (arrayNoDuplicates!0 lt!496723 #b00000000000000000000000000000000 Nil!24245))))

(declare-fun b!1111998 () Bool)

(declare-fun res!741709 () Bool)

(assert (=> b!1111998 (=> (not res!741709) (not e!634251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111998 (= res!741709 (validMask!0 mask!1564))))

(declare-fun b!1111999 () Bool)

(assert (=> b!1111999 (= e!634247 tp_is_empty!27631)))

(assert (= (and start!97636 res!741713) b!1111998))

(assert (= (and b!1111998 res!741709) b!1111995))

(assert (= (and b!1111995 res!741712) b!1111986))

(assert (= (and b!1111986 res!741714) b!1111990))

(assert (= (and b!1111990 res!741710) b!1111991))

(assert (= (and b!1111991 res!741718) b!1111985))

(assert (= (and b!1111985 res!741716) b!1111989))

(assert (= (and b!1111989 res!741715) b!1111993))

(assert (= (and b!1111993 res!741708) b!1111997))

(assert (= (and b!1111997 res!741711) b!1111984))

(assert (= (and b!1111984 (not res!741717)) b!1111992))

(assert (= (and b!1111992 c!109652) b!1111987))

(assert (= (and b!1111992 (not c!109652)) b!1111988))

(assert (= (or b!1111987 b!1111988) bm!46874))

(assert (= (or b!1111987 b!1111988) bm!46873))

(assert (= (and b!1111996 condMapEmpty!43264) mapIsEmpty!43264))

(assert (= (and b!1111996 (not condMapEmpty!43264)) mapNonEmpty!43264))

(get-info :version)

(assert (= (and mapNonEmpty!43264 ((_ is ValueCellFull!13106) mapValue!43264)) b!1111999))

(assert (= (and b!1111996 ((_ is ValueCellFull!13106) mapDefault!43264)) b!1111994))

(assert (= start!97636 b!1111996))

(declare-fun b_lambda!18401 () Bool)

(assert (=> (not b_lambda!18401) (not bm!46874)))

(declare-fun t!34655 () Bool)

(declare-fun tb!8229 () Bool)

(assert (=> (and start!97636 (= defaultEntry!1004 defaultEntry!1004) t!34655) tb!8229))

(declare-fun result!17027 () Bool)

(assert (=> tb!8229 (= result!17027 tp_is_empty!27631)))

(assert (=> bm!46874 t!34655))

(declare-fun b_and!37587 () Bool)

(assert (= b_and!37585 (and (=> t!34655 result!17027) b_and!37587)))

(declare-fun m!1030323 () Bool)

(assert (=> bm!46874 m!1030323))

(declare-fun m!1030325 () Bool)

(assert (=> bm!46874 m!1030325))

(declare-fun m!1030327 () Bool)

(assert (=> bm!46874 m!1030327))

(declare-fun m!1030329 () Bool)

(assert (=> mapNonEmpty!43264 m!1030329))

(declare-fun m!1030331 () Bool)

(assert (=> b!1111993 m!1030331))

(declare-fun m!1030333 () Bool)

(assert (=> b!1111993 m!1030333))

(declare-fun m!1030335 () Bool)

(assert (=> bm!46873 m!1030335))

(declare-fun m!1030337 () Bool)

(assert (=> b!1111992 m!1030337))

(declare-fun m!1030339 () Bool)

(assert (=> b!1111990 m!1030339))

(declare-fun m!1030341 () Bool)

(assert (=> b!1111985 m!1030341))

(declare-fun m!1030343 () Bool)

(assert (=> b!1111998 m!1030343))

(declare-fun m!1030345 () Bool)

(assert (=> b!1111984 m!1030345))

(declare-fun m!1030347 () Bool)

(assert (=> b!1111984 m!1030347))

(declare-fun m!1030349 () Bool)

(assert (=> start!97636 m!1030349))

(declare-fun m!1030351 () Bool)

(assert (=> start!97636 m!1030351))

(declare-fun m!1030353 () Bool)

(assert (=> b!1111997 m!1030353))

(declare-fun m!1030355 () Bool)

(assert (=> b!1111987 m!1030355))

(declare-fun m!1030357 () Bool)

(assert (=> b!1111989 m!1030357))

(declare-fun m!1030359 () Bool)

(assert (=> b!1111986 m!1030359))

(check-sat (not start!97636) (not b!1111998) (not b!1111993) (not b!1111986) b_and!37587 (not b!1111992) (not b!1111987) (not mapNonEmpty!43264) (not b!1111997) (not b_next!23371) (not b!1111990) (not bm!46873) (not bm!46874) (not b!1111985) (not b_lambda!18401) tp_is_empty!27631 (not b!1111984))
(check-sat b_and!37587 (not b_next!23371))
