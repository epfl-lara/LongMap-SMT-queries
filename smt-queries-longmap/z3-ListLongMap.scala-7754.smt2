; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97270 () Bool)

(assert start!97270)

(declare-fun b_free!23241 () Bool)

(declare-fun b_next!23241 () Bool)

(assert (=> start!97270 (= b_free!23241 (not b_next!23241))))

(declare-fun tp!82021 () Bool)

(declare-fun b_and!37313 () Bool)

(assert (=> start!97270 (= tp!82021 b_and!37313)))

(declare-fun b!1107395 () Bool)

(declare-fun e!631829 () Bool)

(declare-fun e!631826 () Bool)

(declare-fun mapRes!43069 () Bool)

(assert (=> b!1107395 (= e!631829 (and e!631826 mapRes!43069))))

(declare-fun condMapEmpty!43069 () Bool)

(declare-datatypes ((V!41795 0))(
  ( (V!41796 (val!13807 Int)) )
))
(declare-datatypes ((ValueCell!13041 0))(
  ( (ValueCellFull!13041 (v!16440 V!41795)) (EmptyCell!13041) )
))
(declare-datatypes ((array!71919 0))(
  ( (array!71920 (arr!34612 (Array (_ BitVec 32) ValueCell!13041)) (size!35148 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71919)

(declare-fun mapDefault!43069 () ValueCell!13041)

(assert (=> b!1107395 (= condMapEmpty!43069 (= (arr!34612 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13041)) mapDefault!43069)))))

(declare-fun mapNonEmpty!43069 () Bool)

(declare-fun tp!82022 () Bool)

(declare-fun e!631833 () Bool)

(assert (=> mapNonEmpty!43069 (= mapRes!43069 (and tp!82022 e!631833))))

(declare-fun mapValue!43069 () ValueCell!13041)

(declare-fun mapRest!43069 () (Array (_ BitVec 32) ValueCell!13041))

(declare-fun mapKey!43069 () (_ BitVec 32))

(assert (=> mapNonEmpty!43069 (= (arr!34612 _values!996) (store mapRest!43069 mapKey!43069 mapValue!43069))))

(declare-fun b!1107396 () Bool)

(declare-fun res!739046 () Bool)

(declare-fun e!631828 () Bool)

(assert (=> b!1107396 (=> (not res!739046) (not e!631828))))

(declare-datatypes ((array!71921 0))(
  ( (array!71922 (arr!34613 (Array (_ BitVec 32) (_ BitVec 64))) (size!35149 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71921)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1107396 (= res!739046 (= (select (arr!34613 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43069 () Bool)

(assert (=> mapIsEmpty!43069 mapRes!43069))

(declare-fun b!1107397 () Bool)

(declare-fun e!631830 () Bool)

(declare-datatypes ((tuple2!17438 0))(
  ( (tuple2!17439 (_1!8730 (_ BitVec 64)) (_2!8730 V!41795)) )
))
(declare-datatypes ((List!24123 0))(
  ( (Nil!24120) (Cons!24119 (h!25328 tuple2!17438) (t!34410 List!24123)) )
))
(declare-datatypes ((ListLongMap!15407 0))(
  ( (ListLongMap!15408 (toList!7719 List!24123)) )
))
(declare-fun call!46420 () ListLongMap!15407)

(declare-fun call!46419 () ListLongMap!15407)

(assert (=> b!1107397 (= e!631830 (= call!46420 call!46419))))

(declare-fun b!1107398 () Bool)

(declare-fun -!1000 (ListLongMap!15407 (_ BitVec 64)) ListLongMap!15407)

(assert (=> b!1107398 (= e!631830 (= call!46420 (-!1000 call!46419 k0!934)))))

(declare-fun b!1107399 () Bool)

(declare-fun e!631827 () Bool)

(declare-fun e!631831 () Bool)

(assert (=> b!1107399 (= e!631827 (not e!631831))))

(declare-fun res!739048 () Bool)

(assert (=> b!1107399 (=> res!739048 e!631831)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107399 (= res!739048 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35149 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107399 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36344 0))(
  ( (Unit!36345) )
))
(declare-fun lt!495622 () Unit!36344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71921 (_ BitVec 64) (_ BitVec 32)) Unit!36344)

(assert (=> b!1107399 (= lt!495622 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107400 () Bool)

(declare-fun res!739044 () Bool)

(assert (=> b!1107400 (=> (not res!739044) (not e!631828))))

(declare-datatypes ((List!24124 0))(
  ( (Nil!24121) (Cons!24120 (h!25329 (_ BitVec 64)) (t!34411 List!24124)) )
))
(declare-fun arrayNoDuplicates!0 (array!71921 (_ BitVec 32) List!24124) Bool)

(assert (=> b!1107400 (= res!739044 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24121))))

(declare-fun zeroValue!944 () V!41795)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46416 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!495621 () array!71921)

(declare-fun minValue!944 () V!41795)

(declare-fun getCurrentListMapNoExtraKeys!4217 (array!71921 array!71919 (_ BitVec 32) (_ BitVec 32) V!41795 V!41795 (_ BitVec 32) Int) ListLongMap!15407)

(declare-fun dynLambda!2350 (Int (_ BitVec 64)) V!41795)

(assert (=> bm!46416 (= call!46420 (getCurrentListMapNoExtraKeys!4217 lt!495621 (array!71920 (store (arr!34612 _values!996) i!673 (ValueCellFull!13041 (dynLambda!2350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35148 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107401 () Bool)

(declare-fun res!739042 () Bool)

(assert (=> b!1107401 (=> (not res!739042) (not e!631828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107401 (= res!739042 (validMask!0 mask!1564))))

(declare-fun b!1107402 () Bool)

(assert (=> b!1107402 (= e!631831 true)))

(assert (=> b!1107402 e!631830))

(declare-fun c!109041 () Bool)

(assert (=> b!1107402 (= c!109041 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495623 () Unit!36344)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!246 (array!71921 array!71919 (_ BitVec 32) (_ BitVec 32) V!41795 V!41795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36344)

(assert (=> b!1107402 (= lt!495623 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107403 () Bool)

(declare-fun res!739043 () Bool)

(assert (=> b!1107403 (=> (not res!739043) (not e!631828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107403 (= res!739043 (validKeyInArray!0 k0!934))))

(declare-fun b!1107404 () Bool)

(declare-fun res!739051 () Bool)

(assert (=> b!1107404 (=> (not res!739051) (not e!631827))))

(assert (=> b!1107404 (= res!739051 (arrayNoDuplicates!0 lt!495621 #b00000000000000000000000000000000 Nil!24121))))

(declare-fun b!1107405 () Bool)

(declare-fun tp_is_empty!27501 () Bool)

(assert (=> b!1107405 (= e!631826 tp_is_empty!27501)))

(declare-fun res!739045 () Bool)

(assert (=> start!97270 (=> (not res!739045) (not e!631828))))

(assert (=> start!97270 (= res!739045 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35149 _keys!1208))))))

(assert (=> start!97270 e!631828))

(assert (=> start!97270 tp_is_empty!27501))

(declare-fun array_inv!26638 (array!71921) Bool)

(assert (=> start!97270 (array_inv!26638 _keys!1208)))

(assert (=> start!97270 true))

(assert (=> start!97270 tp!82021))

(declare-fun array_inv!26639 (array!71919) Bool)

(assert (=> start!97270 (and (array_inv!26639 _values!996) e!631829)))

(declare-fun b!1107406 () Bool)

(declare-fun res!739050 () Bool)

(assert (=> b!1107406 (=> (not res!739050) (not e!631828))))

(assert (=> b!1107406 (= res!739050 (and (= (size!35148 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35149 _keys!1208) (size!35148 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107407 () Bool)

(assert (=> b!1107407 (= e!631828 e!631827)))

(declare-fun res!739049 () Bool)

(assert (=> b!1107407 (=> (not res!739049) (not e!631827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71921 (_ BitVec 32)) Bool)

(assert (=> b!1107407 (= res!739049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495621 mask!1564))))

(assert (=> b!1107407 (= lt!495621 (array!71922 (store (arr!34613 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35149 _keys!1208)))))

(declare-fun b!1107408 () Bool)

(assert (=> b!1107408 (= e!631833 tp_is_empty!27501)))

(declare-fun bm!46417 () Bool)

(assert (=> bm!46417 (= call!46419 (getCurrentListMapNoExtraKeys!4217 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107409 () Bool)

(declare-fun res!739047 () Bool)

(assert (=> b!1107409 (=> (not res!739047) (not e!631828))))

(assert (=> b!1107409 (= res!739047 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35149 _keys!1208))))))

(declare-fun b!1107410 () Bool)

(declare-fun res!739041 () Bool)

(assert (=> b!1107410 (=> (not res!739041) (not e!631828))))

(assert (=> b!1107410 (= res!739041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97270 res!739045) b!1107401))

(assert (= (and b!1107401 res!739042) b!1107406))

(assert (= (and b!1107406 res!739050) b!1107410))

(assert (= (and b!1107410 res!739041) b!1107400))

(assert (= (and b!1107400 res!739044) b!1107409))

(assert (= (and b!1107409 res!739047) b!1107403))

(assert (= (and b!1107403 res!739043) b!1107396))

(assert (= (and b!1107396 res!739046) b!1107407))

(assert (= (and b!1107407 res!739049) b!1107404))

(assert (= (and b!1107404 res!739051) b!1107399))

(assert (= (and b!1107399 (not res!739048)) b!1107402))

(assert (= (and b!1107402 c!109041) b!1107398))

(assert (= (and b!1107402 (not c!109041)) b!1107397))

(assert (= (or b!1107398 b!1107397) bm!46416))

(assert (= (or b!1107398 b!1107397) bm!46417))

(assert (= (and b!1107395 condMapEmpty!43069) mapIsEmpty!43069))

(assert (= (and b!1107395 (not condMapEmpty!43069)) mapNonEmpty!43069))

(get-info :version)

(assert (= (and mapNonEmpty!43069 ((_ is ValueCellFull!13041) mapValue!43069)) b!1107408))

(assert (= (and b!1107395 ((_ is ValueCellFull!13041) mapDefault!43069)) b!1107405))

(assert (= start!97270 b!1107395))

(declare-fun b_lambda!18259 () Bool)

(assert (=> (not b_lambda!18259) (not bm!46416)))

(declare-fun t!34409 () Bool)

(declare-fun tb!8107 () Bool)

(assert (=> (and start!97270 (= defaultEntry!1004 defaultEntry!1004) t!34409) tb!8107))

(declare-fun result!16775 () Bool)

(assert (=> tb!8107 (= result!16775 tp_is_empty!27501)))

(assert (=> bm!46416 t!34409))

(declare-fun b_and!37315 () Bool)

(assert (= b_and!37313 (and (=> t!34409 result!16775) b_and!37315)))

(declare-fun m!1026181 () Bool)

(assert (=> b!1107407 m!1026181))

(declare-fun m!1026183 () Bool)

(assert (=> b!1107407 m!1026183))

(declare-fun m!1026185 () Bool)

(assert (=> start!97270 m!1026185))

(declare-fun m!1026187 () Bool)

(assert (=> start!97270 m!1026187))

(declare-fun m!1026189 () Bool)

(assert (=> b!1107402 m!1026189))

(declare-fun m!1026191 () Bool)

(assert (=> b!1107403 m!1026191))

(declare-fun m!1026193 () Bool)

(assert (=> b!1107401 m!1026193))

(declare-fun m!1026195 () Bool)

(assert (=> b!1107399 m!1026195))

(declare-fun m!1026197 () Bool)

(assert (=> b!1107399 m!1026197))

(declare-fun m!1026199 () Bool)

(assert (=> b!1107410 m!1026199))

(declare-fun m!1026201 () Bool)

(assert (=> mapNonEmpty!43069 m!1026201))

(declare-fun m!1026203 () Bool)

(assert (=> bm!46417 m!1026203))

(declare-fun m!1026205 () Bool)

(assert (=> b!1107398 m!1026205))

(declare-fun m!1026207 () Bool)

(assert (=> b!1107400 m!1026207))

(declare-fun m!1026209 () Bool)

(assert (=> b!1107396 m!1026209))

(declare-fun m!1026211 () Bool)

(assert (=> bm!46416 m!1026211))

(declare-fun m!1026213 () Bool)

(assert (=> bm!46416 m!1026213))

(declare-fun m!1026215 () Bool)

(assert (=> bm!46416 m!1026215))

(declare-fun m!1026217 () Bool)

(assert (=> b!1107404 m!1026217))

(check-sat (not bm!46416) (not bm!46417) (not b_lambda!18259) (not b_next!23241) b_and!37315 (not b!1107401) (not b!1107402) (not b!1107404) (not mapNonEmpty!43069) tp_is_empty!27501 (not b!1107410) (not b!1107400) (not start!97270) (not b!1107403) (not b!1107407) (not b!1107399) (not b!1107398))
(check-sat b_and!37315 (not b_next!23241))
