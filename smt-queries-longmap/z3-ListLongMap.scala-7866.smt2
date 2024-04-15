; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97934 () Bool)

(assert start!97934)

(declare-fun b_free!23641 () Bool)

(declare-fun b_next!23641 () Bool)

(assert (=> start!97934 (= b_free!23641 (not b_next!23641))))

(declare-fun tp!83626 () Bool)

(declare-fun b_and!38043 () Bool)

(assert (=> start!97934 (= tp!83626 b_and!38043)))

(declare-fun b!1122220 () Bool)

(declare-fun res!749748 () Bool)

(declare-fun e!638908 () Bool)

(assert (=> b!1122220 (=> (not res!749748) (not e!638908))))

(declare-datatypes ((array!73134 0))(
  ( (array!73135 (arr!35220 (Array (_ BitVec 32) (_ BitVec 64))) (size!35758 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73134)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1122220 (= res!749748 (= (select (arr!35220 _keys!1208) i!673) k0!934))))

(declare-fun b!1122221 () Bool)

(declare-fun res!749751 () Bool)

(declare-fun e!638907 () Bool)

(assert (=> b!1122221 (=> (not res!749751) (not e!638907))))

(declare-fun lt!498484 () array!73134)

(declare-datatypes ((List!24593 0))(
  ( (Nil!24590) (Cons!24589 (h!25798 (_ BitVec 64)) (t!35217 List!24593)) )
))
(declare-fun arrayNoDuplicates!0 (array!73134 (_ BitVec 32) List!24593) Bool)

(assert (=> b!1122221 (= res!749751 (arrayNoDuplicates!0 lt!498484 #b00000000000000000000000000000000 Nil!24590))))

(declare-fun b!1122222 () Bool)

(declare-fun e!638910 () Bool)

(declare-datatypes ((V!42689 0))(
  ( (V!42690 (val!14142 Int)) )
))
(declare-datatypes ((tuple2!17824 0))(
  ( (tuple2!17825 (_1!8923 (_ BitVec 64)) (_2!8923 V!42689)) )
))
(declare-datatypes ((List!24594 0))(
  ( (Nil!24591) (Cons!24590 (h!25799 tuple2!17824) (t!35218 List!24594)) )
))
(declare-datatypes ((ListLongMap!15793 0))(
  ( (ListLongMap!15794 (toList!7912 List!24594)) )
))
(declare-fun call!47183 () ListLongMap!15793)

(declare-fun call!47182 () ListLongMap!15793)

(assert (=> b!1122222 (= e!638910 (= call!47183 call!47182))))

(declare-fun b!1122223 () Bool)

(declare-fun res!749753 () Bool)

(assert (=> b!1122223 (=> (not res!749753) (not e!638908))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122223 (= res!749753 (validMask!0 mask!1564))))

(declare-fun b!1122224 () Bool)

(declare-fun -!1062 (ListLongMap!15793 (_ BitVec 64)) ListLongMap!15793)

(assert (=> b!1122224 (= e!638910 (= call!47183 (-!1062 call!47182 k0!934)))))

(declare-fun res!749745 () Bool)

(assert (=> start!97934 (=> (not res!749745) (not e!638908))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97934 (= res!749745 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35758 _keys!1208))))))

(assert (=> start!97934 e!638908))

(declare-fun tp_is_empty!28171 () Bool)

(assert (=> start!97934 tp_is_empty!28171))

(declare-fun array_inv!27114 (array!73134) Bool)

(assert (=> start!97934 (array_inv!27114 _keys!1208)))

(assert (=> start!97934 true))

(assert (=> start!97934 tp!83626))

(declare-datatypes ((ValueCell!13376 0))(
  ( (ValueCellFull!13376 (v!16774 V!42689)) (EmptyCell!13376) )
))
(declare-datatypes ((array!73136 0))(
  ( (array!73137 (arr!35221 (Array (_ BitVec 32) ValueCell!13376)) (size!35759 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73136)

(declare-fun e!638912 () Bool)

(declare-fun array_inv!27115 (array!73136) Bool)

(assert (=> start!97934 (and (array_inv!27115 _values!996) e!638912)))

(declare-fun b!1122225 () Bool)

(declare-fun res!749747 () Bool)

(assert (=> b!1122225 (=> (not res!749747) (not e!638908))))

(assert (=> b!1122225 (= res!749747 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35758 _keys!1208))))))

(declare-fun b!1122226 () Bool)

(declare-fun e!638913 () Bool)

(assert (=> b!1122226 (= e!638907 (not e!638913))))

(declare-fun res!749743 () Bool)

(assert (=> b!1122226 (=> res!749743 e!638913)))

(assert (=> b!1122226 (= res!749743 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122226 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36649 0))(
  ( (Unit!36650) )
))
(declare-fun lt!498486 () Unit!36649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73134 (_ BitVec 64) (_ BitVec 32)) Unit!36649)

(assert (=> b!1122226 (= lt!498486 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122227 () Bool)

(declare-fun res!749750 () Bool)

(assert (=> b!1122227 (=> (not res!749750) (not e!638908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122227 (= res!749750 (validKeyInArray!0 k0!934))))

(declare-fun b!1122228 () Bool)

(declare-fun res!749752 () Bool)

(assert (=> b!1122228 (=> (not res!749752) (not e!638908))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1122228 (= res!749752 (and (= (size!35759 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35758 _keys!1208) (size!35759 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122229 () Bool)

(declare-fun res!749754 () Bool)

(assert (=> b!1122229 (=> (not res!749754) (not e!638908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73134 (_ BitVec 32)) Bool)

(assert (=> b!1122229 (= res!749754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122230 () Bool)

(assert (=> b!1122230 (= e!638908 e!638907)))

(declare-fun res!749744 () Bool)

(assert (=> b!1122230 (=> (not res!749744) (not e!638907))))

(assert (=> b!1122230 (= res!749744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498484 mask!1564))))

(assert (=> b!1122230 (= lt!498484 (array!73135 (store (arr!35220 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35758 _keys!1208)))))

(declare-fun mapNonEmpty!44074 () Bool)

(declare-fun mapRes!44074 () Bool)

(declare-fun tp!83627 () Bool)

(declare-fun e!638911 () Bool)

(assert (=> mapNonEmpty!44074 (= mapRes!44074 (and tp!83627 e!638911))))

(declare-fun mapValue!44074 () ValueCell!13376)

(declare-fun mapKey!44074 () (_ BitVec 32))

(declare-fun mapRest!44074 () (Array (_ BitVec 32) ValueCell!13376))

(assert (=> mapNonEmpty!44074 (= (arr!35221 _values!996) (store mapRest!44074 mapKey!44074 mapValue!44074))))

(declare-fun b!1122231 () Bool)

(declare-fun e!638914 () Bool)

(assert (=> b!1122231 (= e!638914 true)))

(declare-fun zeroValue!944 () V!42689)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42689)

(declare-fun lt!498485 () Bool)

(declare-fun contains!6391 (ListLongMap!15793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4419 (array!73134 array!73136 (_ BitVec 32) (_ BitVec 32) V!42689 V!42689 (_ BitVec 32) Int) ListLongMap!15793)

(assert (=> b!1122231 (= lt!498485 (contains!6391 (getCurrentListMapNoExtraKeys!4419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47179 () Bool)

(assert (=> bm!47179 (= call!47182 (getCurrentListMapNoExtraKeys!4419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122232 () Bool)

(declare-fun e!638916 () Bool)

(assert (=> b!1122232 (= e!638912 (and e!638916 mapRes!44074))))

(declare-fun condMapEmpty!44074 () Bool)

(declare-fun mapDefault!44074 () ValueCell!13376)

(assert (=> b!1122232 (= condMapEmpty!44074 (= (arr!35221 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13376)) mapDefault!44074)))))

(declare-fun b!1122233 () Bool)

(assert (=> b!1122233 (= e!638911 tp_is_empty!28171)))

(declare-fun b!1122234 () Bool)

(declare-fun e!638909 () Bool)

(assert (=> b!1122234 (= e!638913 e!638909)))

(declare-fun res!749746 () Bool)

(assert (=> b!1122234 (=> res!749746 e!638909)))

(assert (=> b!1122234 (= res!749746 (not (= from!1455 i!673)))))

(declare-fun lt!498480 () array!73136)

(declare-fun lt!498482 () ListLongMap!15793)

(assert (=> b!1122234 (= lt!498482 (getCurrentListMapNoExtraKeys!4419 lt!498484 lt!498480 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2456 (Int (_ BitVec 64)) V!42689)

(assert (=> b!1122234 (= lt!498480 (array!73137 (store (arr!35221 _values!996) i!673 (ValueCellFull!13376 (dynLambda!2456 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35759 _values!996)))))

(declare-fun lt!498483 () ListLongMap!15793)

(assert (=> b!1122234 (= lt!498483 (getCurrentListMapNoExtraKeys!4419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122235 () Bool)

(assert (=> b!1122235 (= e!638916 tp_is_empty!28171)))

(declare-fun bm!47180 () Bool)

(assert (=> bm!47180 (= call!47183 (getCurrentListMapNoExtraKeys!4419 lt!498484 lt!498480 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122236 () Bool)

(assert (=> b!1122236 (= e!638909 e!638914)))

(declare-fun res!749755 () Bool)

(assert (=> b!1122236 (=> res!749755 e!638914)))

(assert (=> b!1122236 (= res!749755 (not (= (select (arr!35220 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1122236 e!638910))

(declare-fun c!109425 () Bool)

(assert (=> b!1122236 (= c!109425 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498481 () Unit!36649)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!338 (array!73134 array!73136 (_ BitVec 32) (_ BitVec 32) V!42689 V!42689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36649)

(assert (=> b!1122236 (= lt!498481 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44074 () Bool)

(assert (=> mapIsEmpty!44074 mapRes!44074))

(declare-fun b!1122237 () Bool)

(declare-fun res!749749 () Bool)

(assert (=> b!1122237 (=> (not res!749749) (not e!638908))))

(assert (=> b!1122237 (= res!749749 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24590))))

(assert (= (and start!97934 res!749745) b!1122223))

(assert (= (and b!1122223 res!749753) b!1122228))

(assert (= (and b!1122228 res!749752) b!1122229))

(assert (= (and b!1122229 res!749754) b!1122237))

(assert (= (and b!1122237 res!749749) b!1122225))

(assert (= (and b!1122225 res!749747) b!1122227))

(assert (= (and b!1122227 res!749750) b!1122220))

(assert (= (and b!1122220 res!749748) b!1122230))

(assert (= (and b!1122230 res!749744) b!1122221))

(assert (= (and b!1122221 res!749751) b!1122226))

(assert (= (and b!1122226 (not res!749743)) b!1122234))

(assert (= (and b!1122234 (not res!749746)) b!1122236))

(assert (= (and b!1122236 c!109425) b!1122224))

(assert (= (and b!1122236 (not c!109425)) b!1122222))

(assert (= (or b!1122224 b!1122222) bm!47180))

(assert (= (or b!1122224 b!1122222) bm!47179))

(assert (= (and b!1122236 (not res!749755)) b!1122231))

(assert (= (and b!1122232 condMapEmpty!44074) mapIsEmpty!44074))

(assert (= (and b!1122232 (not condMapEmpty!44074)) mapNonEmpty!44074))

(get-info :version)

(assert (= (and mapNonEmpty!44074 ((_ is ValueCellFull!13376) mapValue!44074)) b!1122233))

(assert (= (and b!1122232 ((_ is ValueCellFull!13376) mapDefault!44074)) b!1122235))

(assert (= start!97934 b!1122232))

(declare-fun b_lambda!18593 () Bool)

(assert (=> (not b_lambda!18593) (not b!1122234)))

(declare-fun t!35216 () Bool)

(declare-fun tb!8445 () Bool)

(assert (=> (and start!97934 (= defaultEntry!1004 defaultEntry!1004) t!35216) tb!8445))

(declare-fun result!17459 () Bool)

(assert (=> tb!8445 (= result!17459 tp_is_empty!28171)))

(assert (=> b!1122234 t!35216))

(declare-fun b_and!38045 () Bool)

(assert (= b_and!38043 (and (=> t!35216 result!17459) b_and!38045)))

(declare-fun m!1036389 () Bool)

(assert (=> bm!47179 m!1036389))

(declare-fun m!1036391 () Bool)

(assert (=> b!1122221 m!1036391))

(declare-fun m!1036393 () Bool)

(assert (=> b!1122220 m!1036393))

(declare-fun m!1036395 () Bool)

(assert (=> mapNonEmpty!44074 m!1036395))

(declare-fun m!1036397 () Bool)

(assert (=> start!97934 m!1036397))

(declare-fun m!1036399 () Bool)

(assert (=> start!97934 m!1036399))

(declare-fun m!1036401 () Bool)

(assert (=> b!1122227 m!1036401))

(declare-fun m!1036403 () Bool)

(assert (=> b!1122226 m!1036403))

(declare-fun m!1036405 () Bool)

(assert (=> b!1122226 m!1036405))

(declare-fun m!1036407 () Bool)

(assert (=> b!1122224 m!1036407))

(declare-fun m!1036409 () Bool)

(assert (=> b!1122229 m!1036409))

(declare-fun m!1036411 () Bool)

(assert (=> b!1122223 m!1036411))

(declare-fun m!1036413 () Bool)

(assert (=> b!1122237 m!1036413))

(declare-fun m!1036415 () Bool)

(assert (=> b!1122234 m!1036415))

(declare-fun m!1036417 () Bool)

(assert (=> b!1122234 m!1036417))

(declare-fun m!1036419 () Bool)

(assert (=> b!1122234 m!1036419))

(declare-fun m!1036421 () Bool)

(assert (=> b!1122234 m!1036421))

(declare-fun m!1036423 () Bool)

(assert (=> b!1122236 m!1036423))

(declare-fun m!1036425 () Bool)

(assert (=> b!1122236 m!1036425))

(assert (=> b!1122231 m!1036389))

(assert (=> b!1122231 m!1036389))

(declare-fun m!1036427 () Bool)

(assert (=> b!1122231 m!1036427))

(declare-fun m!1036429 () Bool)

(assert (=> bm!47180 m!1036429))

(declare-fun m!1036431 () Bool)

(assert (=> b!1122230 m!1036431))

(declare-fun m!1036433 () Bool)

(assert (=> b!1122230 m!1036433))

(check-sat (not mapNonEmpty!44074) (not b!1122226) (not b_lambda!18593) (not start!97934) b_and!38045 (not bm!47180) (not b!1122224) (not b!1122227) (not b!1122236) (not b!1122229) (not b_next!23641) (not b!1122223) (not b!1122230) (not b!1122221) (not b!1122234) (not b!1122231) (not b!1122237) tp_is_empty!28171 (not bm!47179))
(check-sat b_and!38045 (not b_next!23641))
