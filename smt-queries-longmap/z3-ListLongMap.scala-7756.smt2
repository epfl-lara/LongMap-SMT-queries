; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97274 () Bool)

(assert start!97274)

(declare-fun b_free!23251 () Bool)

(declare-fun b_next!23251 () Bool)

(assert (=> start!97274 (= b_free!23251 (not b_next!23251))))

(declare-fun tp!82052 () Bool)

(declare-fun b_and!37309 () Bool)

(assert (=> start!97274 (= tp!82052 b_and!37309)))

(declare-fun b!1107504 () Bool)

(declare-fun e!631866 () Bool)

(declare-fun e!631860 () Bool)

(assert (=> b!1107504 (= e!631866 e!631860)))

(declare-fun res!739142 () Bool)

(assert (=> b!1107504 (=> (not res!739142) (not e!631860))))

(declare-datatypes ((array!71842 0))(
  ( (array!71843 (arr!34574 (Array (_ BitVec 32) (_ BitVec 64))) (size!35112 (_ BitVec 32))) )
))
(declare-fun lt!495466 () array!71842)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71842 (_ BitVec 32)) Bool)

(assert (=> b!1107504 (= res!739142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495466 mask!1564))))

(declare-fun _keys!1208 () array!71842)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107504 (= lt!495466 (array!71843 (store (arr!34574 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35112 _keys!1208)))))

(declare-fun b!1107505 () Bool)

(declare-fun res!739140 () Bool)

(assert (=> b!1107505 (=> (not res!739140) (not e!631866))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107505 (= res!739140 (validKeyInArray!0 k0!934))))

(declare-datatypes ((V!41809 0))(
  ( (V!41810 (val!13812 Int)) )
))
(declare-datatypes ((tuple2!17500 0))(
  ( (tuple2!17501 (_1!8761 (_ BitVec 64)) (_2!8761 V!41809)) )
))
(declare-datatypes ((List!24160 0))(
  ( (Nil!24157) (Cons!24156 (h!25365 tuple2!17500) (t!34448 List!24160)) )
))
(declare-datatypes ((ListLongMap!15469 0))(
  ( (ListLongMap!15470 (toList!7750 List!24160)) )
))
(declare-fun call!46427 () ListLongMap!15469)

(declare-fun b!1107506 () Bool)

(declare-fun e!631862 () Bool)

(declare-fun call!46426 () ListLongMap!15469)

(declare-fun -!974 (ListLongMap!15469 (_ BitVec 64)) ListLongMap!15469)

(assert (=> b!1107506 (= e!631862 (= call!46427 (-!974 call!46426 k0!934)))))

(declare-fun b!1107507 () Bool)

(declare-fun res!739147 () Bool)

(assert (=> b!1107507 (=> (not res!739147) (not e!631866))))

(assert (=> b!1107507 (= res!739147 (= (select (arr!34574 _keys!1208) i!673) k0!934))))

(declare-fun zeroValue!944 () V!41809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46423 () Bool)

(declare-datatypes ((ValueCell!13046 0))(
  ( (ValueCellFull!13046 (v!16444 V!41809)) (EmptyCell!13046) )
))
(declare-datatypes ((array!71844 0))(
  ( (array!71845 (arr!34575 (Array (_ BitVec 32) ValueCell!13046)) (size!35113 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71844)

(declare-fun minValue!944 () V!41809)

(declare-fun getCurrentListMapNoExtraKeys!4268 (array!71842 array!71844 (_ BitVec 32) (_ BitVec 32) V!41809 V!41809 (_ BitVec 32) Int) ListLongMap!15469)

(declare-fun dynLambda!2336 (Int (_ BitVec 64)) V!41809)

(assert (=> bm!46423 (= call!46427 (getCurrentListMapNoExtraKeys!4268 lt!495466 (array!71845 (store (arr!34575 _values!996) i!673 (ValueCellFull!13046 (dynLambda!2336 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35113 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43084 () Bool)

(declare-fun mapRes!43084 () Bool)

(assert (=> mapIsEmpty!43084 mapRes!43084))

(declare-fun b!1107508 () Bool)

(declare-fun e!631865 () Bool)

(assert (=> b!1107508 (= e!631865 true)))

(assert (=> b!1107508 e!631862))

(declare-fun c!109023 () Bool)

(assert (=> b!1107508 (= c!109023 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36165 0))(
  ( (Unit!36166) )
))
(declare-fun lt!495467 () Unit!36165)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!248 (array!71842 array!71844 (_ BitVec 32) (_ BitVec 32) V!41809 V!41809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36165)

(assert (=> b!1107508 (= lt!495467 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!248 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107509 () Bool)

(declare-fun res!739139 () Bool)

(assert (=> b!1107509 (=> (not res!739139) (not e!631866))))

(assert (=> b!1107509 (= res!739139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107510 () Bool)

(assert (=> b!1107510 (= e!631862 (= call!46427 call!46426))))

(declare-fun b!1107511 () Bool)

(assert (=> b!1107511 (= e!631860 (not e!631865))))

(declare-fun res!739137 () Bool)

(assert (=> b!1107511 (=> res!739137 e!631865)))

(assert (=> b!1107511 (= res!739137 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35112 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107511 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495468 () Unit!36165)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71842 (_ BitVec 64) (_ BitVec 32)) Unit!36165)

(assert (=> b!1107511 (= lt!495468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107512 () Bool)

(declare-fun e!631859 () Bool)

(declare-fun e!631861 () Bool)

(assert (=> b!1107512 (= e!631859 (and e!631861 mapRes!43084))))

(declare-fun condMapEmpty!43084 () Bool)

(declare-fun mapDefault!43084 () ValueCell!13046)

(assert (=> b!1107512 (= condMapEmpty!43084 (= (arr!34575 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13046)) mapDefault!43084)))))

(declare-fun b!1107513 () Bool)

(declare-fun res!739143 () Bool)

(assert (=> b!1107513 (=> (not res!739143) (not e!631866))))

(declare-datatypes ((List!24161 0))(
  ( (Nil!24158) (Cons!24157 (h!25366 (_ BitVec 64)) (t!34449 List!24161)) )
))
(declare-fun arrayNoDuplicates!0 (array!71842 (_ BitVec 32) List!24161) Bool)

(assert (=> b!1107513 (= res!739143 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24158))))

(declare-fun b!1107514 () Bool)

(declare-fun res!739138 () Bool)

(assert (=> b!1107514 (=> (not res!739138) (not e!631866))))

(assert (=> b!1107514 (= res!739138 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35112 _keys!1208))))))

(declare-fun b!1107515 () Bool)

(declare-fun res!739146 () Bool)

(assert (=> b!1107515 (=> (not res!739146) (not e!631860))))

(assert (=> b!1107515 (= res!739146 (arrayNoDuplicates!0 lt!495466 #b00000000000000000000000000000000 Nil!24158))))

(declare-fun mapNonEmpty!43084 () Bool)

(declare-fun tp!82051 () Bool)

(declare-fun e!631864 () Bool)

(assert (=> mapNonEmpty!43084 (= mapRes!43084 (and tp!82051 e!631864))))

(declare-fun mapRest!43084 () (Array (_ BitVec 32) ValueCell!13046))

(declare-fun mapKey!43084 () (_ BitVec 32))

(declare-fun mapValue!43084 () ValueCell!13046)

(assert (=> mapNonEmpty!43084 (= (arr!34575 _values!996) (store mapRest!43084 mapKey!43084 mapValue!43084))))

(declare-fun bm!46424 () Bool)

(assert (=> bm!46424 (= call!46426 (getCurrentListMapNoExtraKeys!4268 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107516 () Bool)

(declare-fun tp_is_empty!27511 () Bool)

(assert (=> b!1107516 (= e!631861 tp_is_empty!27511)))

(declare-fun res!739145 () Bool)

(assert (=> start!97274 (=> (not res!739145) (not e!631866))))

(assert (=> start!97274 (= res!739145 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35112 _keys!1208))))))

(assert (=> start!97274 e!631866))

(assert (=> start!97274 tp_is_empty!27511))

(declare-fun array_inv!26660 (array!71842) Bool)

(assert (=> start!97274 (array_inv!26660 _keys!1208)))

(assert (=> start!97274 true))

(assert (=> start!97274 tp!82052))

(declare-fun array_inv!26661 (array!71844) Bool)

(assert (=> start!97274 (and (array_inv!26661 _values!996) e!631859)))

(declare-fun b!1107517 () Bool)

(declare-fun res!739144 () Bool)

(assert (=> b!1107517 (=> (not res!739144) (not e!631866))))

(assert (=> b!1107517 (= res!739144 (and (= (size!35113 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35112 _keys!1208) (size!35113 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107518 () Bool)

(declare-fun res!739141 () Bool)

(assert (=> b!1107518 (=> (not res!739141) (not e!631866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107518 (= res!739141 (validMask!0 mask!1564))))

(declare-fun b!1107519 () Bool)

(assert (=> b!1107519 (= e!631864 tp_is_empty!27511)))

(assert (= (and start!97274 res!739145) b!1107518))

(assert (= (and b!1107518 res!739141) b!1107517))

(assert (= (and b!1107517 res!739144) b!1107509))

(assert (= (and b!1107509 res!739139) b!1107513))

(assert (= (and b!1107513 res!739143) b!1107514))

(assert (= (and b!1107514 res!739138) b!1107505))

(assert (= (and b!1107505 res!739140) b!1107507))

(assert (= (and b!1107507 res!739147) b!1107504))

(assert (= (and b!1107504 res!739142) b!1107515))

(assert (= (and b!1107515 res!739146) b!1107511))

(assert (= (and b!1107511 (not res!739137)) b!1107508))

(assert (= (and b!1107508 c!109023) b!1107506))

(assert (= (and b!1107508 (not c!109023)) b!1107510))

(assert (= (or b!1107506 b!1107510) bm!46423))

(assert (= (or b!1107506 b!1107510) bm!46424))

(assert (= (and b!1107512 condMapEmpty!43084) mapIsEmpty!43084))

(assert (= (and b!1107512 (not condMapEmpty!43084)) mapNonEmpty!43084))

(get-info :version)

(assert (= (and mapNonEmpty!43084 ((_ is ValueCellFull!13046) mapValue!43084)) b!1107519))

(assert (= (and b!1107512 ((_ is ValueCellFull!13046) mapDefault!43084)) b!1107516))

(assert (= start!97274 b!1107512))

(declare-fun b_lambda!18249 () Bool)

(assert (=> (not b_lambda!18249) (not bm!46423)))

(declare-fun t!34447 () Bool)

(declare-fun tb!8109 () Bool)

(assert (=> (and start!97274 (= defaultEntry!1004 defaultEntry!1004) t!34447) tb!8109))

(declare-fun result!16787 () Bool)

(assert (=> tb!8109 (= result!16787 tp_is_empty!27511)))

(assert (=> bm!46423 t!34447))

(declare-fun b_and!37311 () Bool)

(assert (= b_and!37309 (and (=> t!34447 result!16787) b_and!37311)))

(declare-fun m!1025745 () Bool)

(assert (=> b!1107506 m!1025745))

(declare-fun m!1025747 () Bool)

(assert (=> start!97274 m!1025747))

(declare-fun m!1025749 () Bool)

(assert (=> start!97274 m!1025749))

(declare-fun m!1025751 () Bool)

(assert (=> b!1107518 m!1025751))

(declare-fun m!1025753 () Bool)

(assert (=> b!1107508 m!1025753))

(declare-fun m!1025755 () Bool)

(assert (=> b!1107507 m!1025755))

(declare-fun m!1025757 () Bool)

(assert (=> b!1107509 m!1025757))

(declare-fun m!1025759 () Bool)

(assert (=> mapNonEmpty!43084 m!1025759))

(declare-fun m!1025761 () Bool)

(assert (=> b!1107504 m!1025761))

(declare-fun m!1025763 () Bool)

(assert (=> b!1107504 m!1025763))

(declare-fun m!1025765 () Bool)

(assert (=> b!1107505 m!1025765))

(declare-fun m!1025767 () Bool)

(assert (=> bm!46423 m!1025767))

(declare-fun m!1025769 () Bool)

(assert (=> bm!46423 m!1025769))

(declare-fun m!1025771 () Bool)

(assert (=> bm!46423 m!1025771))

(declare-fun m!1025773 () Bool)

(assert (=> b!1107513 m!1025773))

(declare-fun m!1025775 () Bool)

(assert (=> bm!46424 m!1025775))

(declare-fun m!1025777 () Bool)

(assert (=> b!1107511 m!1025777))

(declare-fun m!1025779 () Bool)

(assert (=> b!1107511 m!1025779))

(declare-fun m!1025781 () Bool)

(assert (=> b!1107515 m!1025781))

(check-sat (not b!1107508) (not b!1107504) (not b!1107505) (not b!1107515) (not b!1107506) (not b_lambda!18249) (not mapNonEmpty!43084) b_and!37311 (not b_next!23251) (not b!1107509) (not b!1107518) tp_is_empty!27511 (not start!97274) (not b!1107513) (not bm!46424) (not bm!46423) (not b!1107511))
(check-sat b_and!37311 (not b_next!23251))
