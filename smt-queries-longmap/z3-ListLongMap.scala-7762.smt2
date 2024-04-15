; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97310 () Bool)

(assert start!97310)

(declare-fun b_free!23287 () Bool)

(declare-fun b_next!23287 () Bool)

(assert (=> start!97310 (= b_free!23287 (not b_next!23287))))

(declare-fun tp!82159 () Bool)

(declare-fun b_and!37385 () Bool)

(assert (=> start!97310 (= tp!82159 b_and!37385)))

(declare-datatypes ((V!41857 0))(
  ( (V!41858 (val!13830 Int)) )
))
(declare-fun zeroValue!944 () V!41857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17530 0))(
  ( (tuple2!17531 (_1!8776 (_ BitVec 64)) (_2!8776 V!41857)) )
))
(declare-datatypes ((List!24188 0))(
  ( (Nil!24185) (Cons!24184 (h!25393 tuple2!17530) (t!34512 List!24188)) )
))
(declare-datatypes ((ListLongMap!15499 0))(
  ( (ListLongMap!15500 (toList!7765 List!24188)) )
))
(declare-fun call!46535 () ListLongMap!15499)

(declare-datatypes ((ValueCell!13064 0))(
  ( (ValueCellFull!13064 (v!16462 V!41857)) (EmptyCell!13064) )
))
(declare-datatypes ((array!71910 0))(
  ( (array!71911 (arr!34608 (Array (_ BitVec 32) ValueCell!13064)) (size!35146 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71910)

(declare-fun minValue!944 () V!41857)

(declare-datatypes ((array!71912 0))(
  ( (array!71913 (arr!34609 (Array (_ BitVec 32) (_ BitVec 64))) (size!35147 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71912)

(declare-fun bm!46531 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4281 (array!71912 array!71910 (_ BitVec 32) (_ BitVec 32) V!41857 V!41857 (_ BitVec 32) Int) ListLongMap!15499)

(assert (=> bm!46531 (= call!46535 (getCurrentListMapNoExtraKeys!4281 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108428 () Bool)

(declare-fun res!739741 () Bool)

(declare-fun e!632308 () Bool)

(assert (=> b!1108428 (=> (not res!739741) (not e!632308))))

(declare-fun lt!495629 () array!71912)

(declare-datatypes ((List!24189 0))(
  ( (Nil!24186) (Cons!24185 (h!25394 (_ BitVec 64)) (t!34513 List!24189)) )
))
(declare-fun arrayNoDuplicates!0 (array!71912 (_ BitVec 32) List!24189) Bool)

(assert (=> b!1108428 (= res!739741 (arrayNoDuplicates!0 lt!495629 #b00000000000000000000000000000000 Nil!24186))))

(declare-fun b!1108429 () Bool)

(declare-fun e!632306 () Bool)

(declare-fun call!46534 () ListLongMap!15499)

(assert (=> b!1108429 (= e!632306 (= call!46534 call!46535))))

(declare-fun b!1108430 () Bool)

(declare-fun e!632309 () Bool)

(declare-fun tp_is_empty!27547 () Bool)

(assert (=> b!1108430 (= e!632309 tp_is_empty!27547)))

(declare-fun mapIsEmpty!43138 () Bool)

(declare-fun mapRes!43138 () Bool)

(assert (=> mapIsEmpty!43138 mapRes!43138))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun bm!46532 () Bool)

(declare-fun dynLambda!2348 (Int (_ BitVec 64)) V!41857)

(assert (=> bm!46532 (= call!46534 (getCurrentListMapNoExtraKeys!4281 lt!495629 (array!71911 (store (arr!34608 _values!996) i!673 (ValueCellFull!13064 (dynLambda!2348 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35146 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108431 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!987 (ListLongMap!15499 (_ BitVec 64)) ListLongMap!15499)

(assert (=> b!1108431 (= e!632306 (= call!46534 (-!987 call!46535 k0!934)))))

(declare-fun b!1108432 () Bool)

(declare-fun e!632307 () Bool)

(assert (=> b!1108432 (= e!632307 true)))

(assert (=> b!1108432 e!632306))

(declare-fun c!109089 () Bool)

(assert (=> b!1108432 (= c!109089 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36191 0))(
  ( (Unit!36192) )
))
(declare-fun lt!495628 () Unit!36191)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!259 (array!71912 array!71910 (_ BitVec 32) (_ BitVec 32) V!41857 V!41857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36191)

(assert (=> b!1108432 (= lt!495628 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108433 () Bool)

(declare-fun e!632303 () Bool)

(assert (=> b!1108433 (= e!632303 (and e!632309 mapRes!43138))))

(declare-fun condMapEmpty!43138 () Bool)

(declare-fun mapDefault!43138 () ValueCell!13064)

(assert (=> b!1108433 (= condMapEmpty!43138 (= (arr!34608 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13064)) mapDefault!43138)))))

(declare-fun b!1108434 () Bool)

(declare-fun res!739738 () Bool)

(declare-fun e!632310 () Bool)

(assert (=> b!1108434 (=> (not res!739738) (not e!632310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108434 (= res!739738 (validMask!0 mask!1564))))

(declare-fun res!739736 () Bool)

(assert (=> start!97310 (=> (not res!739736) (not e!632310))))

(assert (=> start!97310 (= res!739736 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35147 _keys!1208))))))

(assert (=> start!97310 e!632310))

(assert (=> start!97310 tp_is_empty!27547))

(declare-fun array_inv!26686 (array!71912) Bool)

(assert (=> start!97310 (array_inv!26686 _keys!1208)))

(assert (=> start!97310 true))

(assert (=> start!97310 tp!82159))

(declare-fun array_inv!26687 (array!71910) Bool)

(assert (=> start!97310 (and (array_inv!26687 _values!996) e!632303)))

(declare-fun b!1108435 () Bool)

(declare-fun res!739739 () Bool)

(assert (=> b!1108435 (=> (not res!739739) (not e!632310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71912 (_ BitVec 32)) Bool)

(assert (=> b!1108435 (= res!739739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108436 () Bool)

(declare-fun res!739737 () Bool)

(assert (=> b!1108436 (=> (not res!739737) (not e!632310))))

(assert (=> b!1108436 (= res!739737 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24186))))

(declare-fun b!1108437 () Bool)

(declare-fun res!739731 () Bool)

(assert (=> b!1108437 (=> (not res!739731) (not e!632310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108437 (= res!739731 (validKeyInArray!0 k0!934))))

(declare-fun b!1108438 () Bool)

(declare-fun res!739732 () Bool)

(assert (=> b!1108438 (=> (not res!739732) (not e!632310))))

(assert (=> b!1108438 (= res!739732 (and (= (size!35146 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35147 _keys!1208) (size!35146 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108439 () Bool)

(assert (=> b!1108439 (= e!632310 e!632308)))

(declare-fun res!739734 () Bool)

(assert (=> b!1108439 (=> (not res!739734) (not e!632308))))

(assert (=> b!1108439 (= res!739734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495629 mask!1564))))

(assert (=> b!1108439 (= lt!495629 (array!71913 (store (arr!34609 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35147 _keys!1208)))))

(declare-fun mapNonEmpty!43138 () Bool)

(declare-fun tp!82160 () Bool)

(declare-fun e!632305 () Bool)

(assert (=> mapNonEmpty!43138 (= mapRes!43138 (and tp!82160 e!632305))))

(declare-fun mapValue!43138 () ValueCell!13064)

(declare-fun mapRest!43138 () (Array (_ BitVec 32) ValueCell!13064))

(declare-fun mapKey!43138 () (_ BitVec 32))

(assert (=> mapNonEmpty!43138 (= (arr!34608 _values!996) (store mapRest!43138 mapKey!43138 mapValue!43138))))

(declare-fun b!1108440 () Bool)

(assert (=> b!1108440 (= e!632308 (not e!632307))))

(declare-fun res!739735 () Bool)

(assert (=> b!1108440 (=> res!739735 e!632307)))

(assert (=> b!1108440 (= res!739735 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35147 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108440 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495630 () Unit!36191)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71912 (_ BitVec 64) (_ BitVec 32)) Unit!36191)

(assert (=> b!1108440 (= lt!495630 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108441 () Bool)

(declare-fun res!739733 () Bool)

(assert (=> b!1108441 (=> (not res!739733) (not e!632310))))

(assert (=> b!1108441 (= res!739733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35147 _keys!1208))))))

(declare-fun b!1108442 () Bool)

(declare-fun res!739740 () Bool)

(assert (=> b!1108442 (=> (not res!739740) (not e!632310))))

(assert (=> b!1108442 (= res!739740 (= (select (arr!34609 _keys!1208) i!673) k0!934))))

(declare-fun b!1108443 () Bool)

(assert (=> b!1108443 (= e!632305 tp_is_empty!27547)))

(assert (= (and start!97310 res!739736) b!1108434))

(assert (= (and b!1108434 res!739738) b!1108438))

(assert (= (and b!1108438 res!739732) b!1108435))

(assert (= (and b!1108435 res!739739) b!1108436))

(assert (= (and b!1108436 res!739737) b!1108441))

(assert (= (and b!1108441 res!739733) b!1108437))

(assert (= (and b!1108437 res!739731) b!1108442))

(assert (= (and b!1108442 res!739740) b!1108439))

(assert (= (and b!1108439 res!739734) b!1108428))

(assert (= (and b!1108428 res!739741) b!1108440))

(assert (= (and b!1108440 (not res!739735)) b!1108432))

(assert (= (and b!1108432 c!109089) b!1108431))

(assert (= (and b!1108432 (not c!109089)) b!1108429))

(assert (= (or b!1108431 b!1108429) bm!46532))

(assert (= (or b!1108431 b!1108429) bm!46531))

(assert (= (and b!1108433 condMapEmpty!43138) mapIsEmpty!43138))

(assert (= (and b!1108433 (not condMapEmpty!43138)) mapNonEmpty!43138))

(get-info :version)

(assert (= (and mapNonEmpty!43138 ((_ is ValueCellFull!13064) mapValue!43138)) b!1108443))

(assert (= (and b!1108433 ((_ is ValueCellFull!13064) mapDefault!43138)) b!1108430))

(assert (= start!97310 b!1108433))

(declare-fun b_lambda!18289 () Bool)

(assert (=> (not b_lambda!18289) (not bm!46532)))

(declare-fun t!34511 () Bool)

(declare-fun tb!8145 () Bool)

(assert (=> (and start!97310 (= defaultEntry!1004 defaultEntry!1004) t!34511) tb!8145))

(declare-fun result!16859 () Bool)

(assert (=> tb!8145 (= result!16859 tp_is_empty!27547)))

(assert (=> bm!46532 t!34511))

(declare-fun b_and!37387 () Bool)

(assert (= b_and!37385 (and (=> t!34511 result!16859) b_and!37387)))

(declare-fun m!1026429 () Bool)

(assert (=> b!1108434 m!1026429))

(declare-fun m!1026431 () Bool)

(assert (=> b!1108436 m!1026431))

(declare-fun m!1026433 () Bool)

(assert (=> b!1108432 m!1026433))

(declare-fun m!1026435 () Bool)

(assert (=> b!1108435 m!1026435))

(declare-fun m!1026437 () Bool)

(assert (=> bm!46531 m!1026437))

(declare-fun m!1026439 () Bool)

(assert (=> start!97310 m!1026439))

(declare-fun m!1026441 () Bool)

(assert (=> start!97310 m!1026441))

(declare-fun m!1026443 () Bool)

(assert (=> b!1108431 m!1026443))

(declare-fun m!1026445 () Bool)

(assert (=> bm!46532 m!1026445))

(declare-fun m!1026447 () Bool)

(assert (=> bm!46532 m!1026447))

(declare-fun m!1026449 () Bool)

(assert (=> bm!46532 m!1026449))

(declare-fun m!1026451 () Bool)

(assert (=> mapNonEmpty!43138 m!1026451))

(declare-fun m!1026453 () Bool)

(assert (=> b!1108439 m!1026453))

(declare-fun m!1026455 () Bool)

(assert (=> b!1108439 m!1026455))

(declare-fun m!1026457 () Bool)

(assert (=> b!1108440 m!1026457))

(declare-fun m!1026459 () Bool)

(assert (=> b!1108440 m!1026459))

(declare-fun m!1026461 () Bool)

(assert (=> b!1108442 m!1026461))

(declare-fun m!1026463 () Bool)

(assert (=> b!1108428 m!1026463))

(declare-fun m!1026465 () Bool)

(assert (=> b!1108437 m!1026465))

(check-sat (not b!1108436) (not bm!46531) (not b!1108437) tp_is_empty!27547 (not b!1108431) (not bm!46532) (not mapNonEmpty!43138) (not b!1108435) b_and!37387 (not b_next!23287) (not b!1108428) (not b!1108432) (not b!1108439) (not start!97310) (not b!1108440) (not b_lambda!18289) (not b!1108434))
(check-sat b_and!37387 (not b_next!23287))
