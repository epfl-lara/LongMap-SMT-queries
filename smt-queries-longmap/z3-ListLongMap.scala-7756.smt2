; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97516 () Bool)

(assert start!97516)

(declare-fun b_free!23251 () Bool)

(declare-fun b_next!23251 () Bool)

(assert (=> start!97516 (= b_free!23251 (not b_next!23251))))

(declare-fun tp!82051 () Bool)

(declare-fun b_and!37345 () Bool)

(assert (=> start!97516 (= tp!82051 b_and!37345)))

(declare-fun b!1108984 () Bool)

(declare-fun e!632810 () Bool)

(declare-fun e!632813 () Bool)

(assert (=> b!1108984 (= e!632810 e!632813)))

(declare-fun res!739729 () Bool)

(assert (=> b!1108984 (=> (not res!739729) (not e!632813))))

(declare-datatypes ((array!71973 0))(
  ( (array!71974 (arr!34633 (Array (_ BitVec 32) (_ BitVec 64))) (size!35170 (_ BitVec 32))) )
))
(declare-fun lt!496183 () array!71973)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71973 (_ BitVec 32)) Bool)

(assert (=> b!1108984 (= res!739729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496183 mask!1564))))

(declare-fun _keys!1208 () array!71973)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108984 (= lt!496183 (array!71974 (store (arr!34633 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35170 _keys!1208)))))

(declare-datatypes ((V!41809 0))(
  ( (V!41810 (val!13812 Int)) )
))
(declare-fun zeroValue!944 () V!41809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17462 0))(
  ( (tuple2!17463 (_1!8742 (_ BitVec 64)) (_2!8742 V!41809)) )
))
(declare-datatypes ((List!24149 0))(
  ( (Nil!24146) (Cons!24145 (h!25363 tuple2!17462) (t!34438 List!24149)) )
))
(declare-datatypes ((ListLongMap!15439 0))(
  ( (ListLongMap!15440 (toList!7735 List!24149)) )
))
(declare-fun call!46517 () ListLongMap!15439)

(declare-fun bm!46513 () Bool)

(declare-datatypes ((ValueCell!13046 0))(
  ( (ValueCellFull!13046 (v!16441 V!41809)) (EmptyCell!13046) )
))
(declare-datatypes ((array!71975 0))(
  ( (array!71976 (arr!34634 (Array (_ BitVec 32) ValueCell!13046)) (size!35171 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71975)

(declare-fun minValue!944 () V!41809)

(declare-fun getCurrentListMapNoExtraKeys!4272 (array!71973 array!71975 (_ BitVec 32) (_ BitVec 32) V!41809 V!41809 (_ BitVec 32) Int) ListLongMap!15439)

(declare-fun dynLambda!2388 (Int (_ BitVec 64)) V!41809)

(assert (=> bm!46513 (= call!46517 (getCurrentListMapNoExtraKeys!4272 lt!496183 (array!71976 (store (arr!34634 _values!996) i!673 (ValueCellFull!13046 (dynLambda!2388 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35171 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108985 () Bool)

(declare-fun e!632812 () Bool)

(assert (=> b!1108985 (= e!632813 (not e!632812))))

(declare-fun res!739737 () Bool)

(assert (=> b!1108985 (=> res!739737 e!632812)))

(assert (=> b!1108985 (= res!739737 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35170 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108985 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36333 0))(
  ( (Unit!36334) )
))
(declare-fun lt!496181 () Unit!36333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71973 (_ BitVec 64) (_ BitVec 32)) Unit!36333)

(assert (=> b!1108985 (= lt!496181 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108986 () Bool)

(declare-fun res!739734 () Bool)

(assert (=> b!1108986 (=> (not res!739734) (not e!632810))))

(assert (=> b!1108986 (= res!739734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!46516 () ListLongMap!15439)

(declare-fun b!1108987 () Bool)

(declare-fun e!632809 () Bool)

(declare-fun -!995 (ListLongMap!15439 (_ BitVec 64)) ListLongMap!15439)

(assert (=> b!1108987 (= e!632809 (= call!46517 (-!995 call!46516 k0!934)))))

(declare-fun b!1108988 () Bool)

(declare-fun res!739730 () Bool)

(assert (=> b!1108988 (=> (not res!739730) (not e!632810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108988 (= res!739730 (validKeyInArray!0 k0!934))))

(declare-fun b!1108989 () Bool)

(declare-fun res!739735 () Bool)

(assert (=> b!1108989 (=> (not res!739735) (not e!632810))))

(assert (=> b!1108989 (= res!739735 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35170 _keys!1208))))))

(declare-fun b!1108990 () Bool)

(declare-fun e!632808 () Bool)

(declare-fun tp_is_empty!27511 () Bool)

(assert (=> b!1108990 (= e!632808 tp_is_empty!27511)))

(declare-fun mapIsEmpty!43084 () Bool)

(declare-fun mapRes!43084 () Bool)

(assert (=> mapIsEmpty!43084 mapRes!43084))

(declare-fun b!1108991 () Bool)

(declare-fun res!739731 () Bool)

(assert (=> b!1108991 (=> (not res!739731) (not e!632810))))

(assert (=> b!1108991 (= res!739731 (= (select (arr!34633 _keys!1208) i!673) k0!934))))

(declare-fun b!1108992 () Bool)

(declare-fun e!632814 () Bool)

(declare-fun e!632807 () Bool)

(assert (=> b!1108992 (= e!632814 (and e!632807 mapRes!43084))))

(declare-fun condMapEmpty!43084 () Bool)

(declare-fun mapDefault!43084 () ValueCell!13046)

(assert (=> b!1108992 (= condMapEmpty!43084 (= (arr!34634 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13046)) mapDefault!43084)))))

(declare-fun b!1108993 () Bool)

(declare-fun res!739733 () Bool)

(assert (=> b!1108993 (=> (not res!739733) (not e!632813))))

(declare-datatypes ((List!24150 0))(
  ( (Nil!24147) (Cons!24146 (h!25364 (_ BitVec 64)) (t!34439 List!24150)) )
))
(declare-fun arrayNoDuplicates!0 (array!71973 (_ BitVec 32) List!24150) Bool)

(assert (=> b!1108993 (= res!739733 (arrayNoDuplicates!0 lt!496183 #b00000000000000000000000000000000 Nil!24147))))

(declare-fun b!1108994 () Bool)

(declare-fun res!739738 () Bool)

(assert (=> b!1108994 (=> (not res!739738) (not e!632810))))

(assert (=> b!1108994 (= res!739738 (and (= (size!35171 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35170 _keys!1208) (size!35171 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!739728 () Bool)

(assert (=> start!97516 (=> (not res!739728) (not e!632810))))

(assert (=> start!97516 (= res!739728 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35170 _keys!1208))))))

(assert (=> start!97516 e!632810))

(assert (=> start!97516 tp_is_empty!27511))

(declare-fun array_inv!26682 (array!71973) Bool)

(assert (=> start!97516 (array_inv!26682 _keys!1208)))

(assert (=> start!97516 true))

(assert (=> start!97516 tp!82051))

(declare-fun array_inv!26683 (array!71975) Bool)

(assert (=> start!97516 (and (array_inv!26683 _values!996) e!632814)))

(declare-fun b!1108995 () Bool)

(assert (=> b!1108995 (= e!632812 true)))

(assert (=> b!1108995 e!632809))

(declare-fun c!109472 () Bool)

(assert (=> b!1108995 (= c!109472 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496182 () Unit!36333)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!264 (array!71973 array!71975 (_ BitVec 32) (_ BitVec 32) V!41809 V!41809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36333)

(assert (=> b!1108995 (= lt!496182 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!264 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108996 () Bool)

(assert (=> b!1108996 (= e!632807 tp_is_empty!27511)))

(declare-fun b!1108997 () Bool)

(assert (=> b!1108997 (= e!632809 (= call!46517 call!46516))))

(declare-fun b!1108998 () Bool)

(declare-fun res!739736 () Bool)

(assert (=> b!1108998 (=> (not res!739736) (not e!632810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108998 (= res!739736 (validMask!0 mask!1564))))

(declare-fun bm!46514 () Bool)

(assert (=> bm!46514 (= call!46516 (getCurrentListMapNoExtraKeys!4272 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108999 () Bool)

(declare-fun res!739732 () Bool)

(assert (=> b!1108999 (=> (not res!739732) (not e!632810))))

(assert (=> b!1108999 (= res!739732 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24147))))

(declare-fun mapNonEmpty!43084 () Bool)

(declare-fun tp!82052 () Bool)

(assert (=> mapNonEmpty!43084 (= mapRes!43084 (and tp!82052 e!632808))))

(declare-fun mapValue!43084 () ValueCell!13046)

(declare-fun mapRest!43084 () (Array (_ BitVec 32) ValueCell!13046))

(declare-fun mapKey!43084 () (_ BitVec 32))

(assert (=> mapNonEmpty!43084 (= (arr!34634 _values!996) (store mapRest!43084 mapKey!43084 mapValue!43084))))

(assert (= (and start!97516 res!739728) b!1108998))

(assert (= (and b!1108998 res!739736) b!1108994))

(assert (= (and b!1108994 res!739738) b!1108986))

(assert (= (and b!1108986 res!739734) b!1108999))

(assert (= (and b!1108999 res!739732) b!1108989))

(assert (= (and b!1108989 res!739735) b!1108988))

(assert (= (and b!1108988 res!739730) b!1108991))

(assert (= (and b!1108991 res!739731) b!1108984))

(assert (= (and b!1108984 res!739729) b!1108993))

(assert (= (and b!1108993 res!739733) b!1108985))

(assert (= (and b!1108985 (not res!739737)) b!1108995))

(assert (= (and b!1108995 c!109472) b!1108987))

(assert (= (and b!1108995 (not c!109472)) b!1108997))

(assert (= (or b!1108987 b!1108997) bm!46513))

(assert (= (or b!1108987 b!1108997) bm!46514))

(assert (= (and b!1108992 condMapEmpty!43084) mapIsEmpty!43084))

(assert (= (and b!1108992 (not condMapEmpty!43084)) mapNonEmpty!43084))

(get-info :version)

(assert (= (and mapNonEmpty!43084 ((_ is ValueCellFull!13046) mapValue!43084)) b!1108990))

(assert (= (and b!1108992 ((_ is ValueCellFull!13046) mapDefault!43084)) b!1108996))

(assert (= start!97516 b!1108992))

(declare-fun b_lambda!18281 () Bool)

(assert (=> (not b_lambda!18281) (not bm!46513)))

(declare-fun t!34437 () Bool)

(declare-fun tb!8109 () Bool)

(assert (=> (and start!97516 (= defaultEntry!1004 defaultEntry!1004) t!34437) tb!8109))

(declare-fun result!16787 () Bool)

(assert (=> tb!8109 (= result!16787 tp_is_empty!27511)))

(assert (=> bm!46513 t!34437))

(declare-fun b_and!37347 () Bool)

(assert (= b_and!37345 (and (=> t!34437 result!16787) b_and!37347)))

(declare-fun m!1028043 () Bool)

(assert (=> b!1108995 m!1028043))

(declare-fun m!1028045 () Bool)

(assert (=> b!1108993 m!1028045))

(declare-fun m!1028047 () Bool)

(assert (=> b!1108991 m!1028047))

(declare-fun m!1028049 () Bool)

(assert (=> mapNonEmpty!43084 m!1028049))

(declare-fun m!1028051 () Bool)

(assert (=> b!1108998 m!1028051))

(declare-fun m!1028053 () Bool)

(assert (=> b!1108986 m!1028053))

(declare-fun m!1028055 () Bool)

(assert (=> bm!46514 m!1028055))

(declare-fun m!1028057 () Bool)

(assert (=> start!97516 m!1028057))

(declare-fun m!1028059 () Bool)

(assert (=> start!97516 m!1028059))

(declare-fun m!1028061 () Bool)

(assert (=> b!1108987 m!1028061))

(declare-fun m!1028063 () Bool)

(assert (=> bm!46513 m!1028063))

(declare-fun m!1028065 () Bool)

(assert (=> bm!46513 m!1028065))

(declare-fun m!1028067 () Bool)

(assert (=> bm!46513 m!1028067))

(declare-fun m!1028069 () Bool)

(assert (=> b!1108984 m!1028069))

(declare-fun m!1028071 () Bool)

(assert (=> b!1108984 m!1028071))

(declare-fun m!1028073 () Bool)

(assert (=> b!1108985 m!1028073))

(declare-fun m!1028075 () Bool)

(assert (=> b!1108985 m!1028075))

(declare-fun m!1028077 () Bool)

(assert (=> b!1108988 m!1028077))

(declare-fun m!1028079 () Bool)

(assert (=> b!1108999 m!1028079))

(check-sat (not b_lambda!18281) (not b_next!23251) (not bm!46514) (not b!1108987) (not b!1108993) b_and!37347 (not b!1108986) (not start!97516) (not mapNonEmpty!43084) (not bm!46513) (not b!1108984) (not b!1108999) (not b!1108995) (not b!1108985) (not b!1108988) (not b!1108998) tp_is_empty!27511)
(check-sat b_and!37347 (not b_next!23251))
