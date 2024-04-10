; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97912 () Bool)

(assert start!97912)

(declare-fun b_free!23613 () Bool)

(declare-fun b_next!23613 () Bool)

(assert (=> start!97912 (= b_free!23613 (not b_next!23613))))

(declare-fun tp!83542 () Bool)

(declare-fun b_and!38009 () Bool)

(assert (=> start!97912 (= tp!83542 b_and!38009)))

(declare-fun b!1121587 () Bool)

(declare-fun e!638595 () Bool)

(declare-fun tp_is_empty!28143 () Bool)

(assert (=> b!1121587 (= e!638595 tp_is_empty!28143)))

(declare-fun b!1121588 () Bool)

(declare-fun res!749294 () Bool)

(declare-fun e!638590 () Bool)

(assert (=> b!1121588 (=> (not res!749294) (not e!638590))))

(declare-datatypes ((array!73167 0))(
  ( (array!73168 (arr!35236 (Array (_ BitVec 32) (_ BitVec 64))) (size!35772 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73167)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73167 (_ BitVec 32)) Bool)

(assert (=> b!1121588 (= res!749294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121589 () Bool)

(declare-fun res!749293 () Bool)

(assert (=> b!1121589 (=> (not res!749293) (not e!638590))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42651 0))(
  ( (V!42652 (val!14128 Int)) )
))
(declare-datatypes ((ValueCell!13362 0))(
  ( (ValueCellFull!13362 (v!16761 V!42651)) (EmptyCell!13362) )
))
(declare-datatypes ((array!73169 0))(
  ( (array!73170 (arr!35237 (Array (_ BitVec 32) ValueCell!13362)) (size!35773 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73169)

(assert (=> b!1121589 (= res!749293 (and (= (size!35773 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35772 _keys!1208) (size!35773 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!749296 () Bool)

(assert (=> start!97912 (=> (not res!749296) (not e!638590))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97912 (= res!749296 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35772 _keys!1208))))))

(assert (=> start!97912 e!638590))

(assert (=> start!97912 tp_is_empty!28143))

(declare-fun array_inv!27056 (array!73167) Bool)

(assert (=> start!97912 (array_inv!27056 _keys!1208)))

(assert (=> start!97912 true))

(assert (=> start!97912 tp!83542))

(declare-fun e!638596 () Bool)

(declare-fun array_inv!27057 (array!73169) Bool)

(assert (=> start!97912 (and (array_inv!27057 _values!996) e!638596)))

(declare-fun b!1121590 () Bool)

(declare-fun res!749288 () Bool)

(declare-fun e!638594 () Bool)

(assert (=> b!1121590 (=> (not res!749288) (not e!638594))))

(declare-fun lt!498412 () array!73167)

(declare-datatypes ((List!24516 0))(
  ( (Nil!24513) (Cons!24512 (h!25721 (_ BitVec 64)) (t!35121 List!24516)) )
))
(declare-fun arrayNoDuplicates!0 (array!73167 (_ BitVec 32) List!24516) Bool)

(assert (=> b!1121590 (= res!749288 (arrayNoDuplicates!0 lt!498412 #b00000000000000000000000000000000 Nil!24513))))

(declare-fun zeroValue!944 () V!42651)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17734 0))(
  ( (tuple2!17735 (_1!8878 (_ BitVec 64)) (_2!8878 V!42651)) )
))
(declare-datatypes ((List!24517 0))(
  ( (Nil!24514) (Cons!24513 (h!25722 tuple2!17734) (t!35122 List!24517)) )
))
(declare-datatypes ((ListLongMap!15703 0))(
  ( (ListLongMap!15704 (toList!7867 List!24517)) )
))
(declare-fun call!47122 () ListLongMap!15703)

(declare-fun minValue!944 () V!42651)

(declare-fun bm!47118 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4356 (array!73167 array!73169 (_ BitVec 32) (_ BitVec 32) V!42651 V!42651 (_ BitVec 32) Int) ListLongMap!15703)

(assert (=> bm!47118 (= call!47122 (getCurrentListMapNoExtraKeys!4356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47121 () ListLongMap!15703)

(declare-fun bm!47119 () Bool)

(declare-fun lt!498413 () array!73169)

(assert (=> bm!47119 (= call!47121 (getCurrentListMapNoExtraKeys!4356 lt!498412 lt!498413 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121591 () Bool)

(declare-fun e!638591 () Bool)

(declare-fun e!638592 () Bool)

(assert (=> b!1121591 (= e!638591 e!638592)))

(declare-fun res!749298 () Bool)

(assert (=> b!1121591 (=> res!749298 e!638592)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121591 (= res!749298 (not (= from!1455 i!673)))))

(declare-fun lt!498410 () ListLongMap!15703)

(assert (=> b!1121591 (= lt!498410 (getCurrentListMapNoExtraKeys!4356 lt!498412 lt!498413 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2456 (Int (_ BitVec 64)) V!42651)

(assert (=> b!1121591 (= lt!498413 (array!73170 (store (arr!35237 _values!996) i!673 (ValueCellFull!13362 (dynLambda!2456 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35773 _values!996)))))

(declare-fun lt!498408 () ListLongMap!15703)

(assert (=> b!1121591 (= lt!498408 (getCurrentListMapNoExtraKeys!4356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121592 () Bool)

(assert (=> b!1121592 (= e!638590 e!638594)))

(declare-fun res!749289 () Bool)

(assert (=> b!1121592 (=> (not res!749289) (not e!638594))))

(assert (=> b!1121592 (= res!749289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498412 mask!1564))))

(assert (=> b!1121592 (= lt!498412 (array!73168 (store (arr!35236 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35772 _keys!1208)))))

(declare-fun b!1121593 () Bool)

(declare-fun res!749297 () Bool)

(assert (=> b!1121593 (=> (not res!749297) (not e!638590))))

(assert (=> b!1121593 (= res!749297 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35772 _keys!1208))))))

(declare-fun e!638593 () Bool)

(declare-fun b!1121594 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1077 (ListLongMap!15703 (_ BitVec 64)) ListLongMap!15703)

(assert (=> b!1121594 (= e!638593 (= call!47121 (-!1077 call!47122 k0!934)))))

(declare-fun b!1121595 () Bool)

(declare-fun e!638598 () Bool)

(assert (=> b!1121595 (= e!638598 tp_is_empty!28143)))

(declare-fun mapNonEmpty!44032 () Bool)

(declare-fun mapRes!44032 () Bool)

(declare-fun tp!83543 () Bool)

(assert (=> mapNonEmpty!44032 (= mapRes!44032 (and tp!83543 e!638595))))

(declare-fun mapValue!44032 () ValueCell!13362)

(declare-fun mapRest!44032 () (Array (_ BitVec 32) ValueCell!13362))

(declare-fun mapKey!44032 () (_ BitVec 32))

(assert (=> mapNonEmpty!44032 (= (arr!35237 _values!996) (store mapRest!44032 mapKey!44032 mapValue!44032))))

(declare-fun b!1121596 () Bool)

(assert (=> b!1121596 (= e!638594 (not e!638591))))

(declare-fun res!749295 () Bool)

(assert (=> b!1121596 (=> res!749295 e!638591)))

(assert (=> b!1121596 (= res!749295 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121596 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36792 0))(
  ( (Unit!36793) )
))
(declare-fun lt!498409 () Unit!36792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73167 (_ BitVec 64) (_ BitVec 32)) Unit!36792)

(assert (=> b!1121596 (= lt!498409 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121597 () Bool)

(declare-fun res!749291 () Bool)

(assert (=> b!1121597 (=> (not res!749291) (not e!638590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121597 (= res!749291 (validKeyInArray!0 k0!934))))

(declare-fun b!1121598 () Bool)

(declare-fun res!749292 () Bool)

(assert (=> b!1121598 (=> (not res!749292) (not e!638590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121598 (= res!749292 (validMask!0 mask!1564))))

(declare-fun b!1121599 () Bool)

(assert (=> b!1121599 (= e!638596 (and e!638598 mapRes!44032))))

(declare-fun condMapEmpty!44032 () Bool)

(declare-fun mapDefault!44032 () ValueCell!13362)

(assert (=> b!1121599 (= condMapEmpty!44032 (= (arr!35237 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13362)) mapDefault!44032)))))

(declare-fun b!1121600 () Bool)

(assert (=> b!1121600 (= e!638592 true)))

(assert (=> b!1121600 e!638593))

(declare-fun c!109410 () Bool)

(assert (=> b!1121600 (= c!109410 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498411 () Unit!36792)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!324 (array!73167 array!73169 (_ BitVec 32) (_ BitVec 32) V!42651 V!42651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36792)

(assert (=> b!1121600 (= lt!498411 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121601 () Bool)

(declare-fun res!749290 () Bool)

(assert (=> b!1121601 (=> (not res!749290) (not e!638590))))

(assert (=> b!1121601 (= res!749290 (= (select (arr!35236 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44032 () Bool)

(assert (=> mapIsEmpty!44032 mapRes!44032))

(declare-fun b!1121602 () Bool)

(declare-fun res!749299 () Bool)

(assert (=> b!1121602 (=> (not res!749299) (not e!638590))))

(assert (=> b!1121602 (= res!749299 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24513))))

(declare-fun b!1121603 () Bool)

(assert (=> b!1121603 (= e!638593 (= call!47121 call!47122))))

(assert (= (and start!97912 res!749296) b!1121598))

(assert (= (and b!1121598 res!749292) b!1121589))

(assert (= (and b!1121589 res!749293) b!1121588))

(assert (= (and b!1121588 res!749294) b!1121602))

(assert (= (and b!1121602 res!749299) b!1121593))

(assert (= (and b!1121593 res!749297) b!1121597))

(assert (= (and b!1121597 res!749291) b!1121601))

(assert (= (and b!1121601 res!749290) b!1121592))

(assert (= (and b!1121592 res!749289) b!1121590))

(assert (= (and b!1121590 res!749288) b!1121596))

(assert (= (and b!1121596 (not res!749295)) b!1121591))

(assert (= (and b!1121591 (not res!749298)) b!1121600))

(assert (= (and b!1121600 c!109410) b!1121594))

(assert (= (and b!1121600 (not c!109410)) b!1121603))

(assert (= (or b!1121594 b!1121603) bm!47119))

(assert (= (or b!1121594 b!1121603) bm!47118))

(assert (= (and b!1121599 condMapEmpty!44032) mapIsEmpty!44032))

(assert (= (and b!1121599 (not condMapEmpty!44032)) mapNonEmpty!44032))

(get-info :version)

(assert (= (and mapNonEmpty!44032 ((_ is ValueCellFull!13362) mapValue!44032)) b!1121587))

(assert (= (and b!1121599 ((_ is ValueCellFull!13362) mapDefault!44032)) b!1121595))

(assert (= start!97912 b!1121599))

(declare-fun b_lambda!18583 () Bool)

(assert (=> (not b_lambda!18583) (not b!1121591)))

(declare-fun t!35120 () Bool)

(declare-fun tb!8425 () Bool)

(assert (=> (and start!97912 (= defaultEntry!1004 defaultEntry!1004) t!35120) tb!8425))

(declare-fun result!17411 () Bool)

(assert (=> tb!8425 (= result!17411 tp_is_empty!28143)))

(assert (=> b!1121591 t!35120))

(declare-fun b_and!38011 () Bool)

(assert (= b_and!38009 (and (=> t!35120 result!17411) b_and!38011)))

(declare-fun m!1036397 () Bool)

(assert (=> b!1121588 m!1036397))

(declare-fun m!1036399 () Bool)

(assert (=> b!1121592 m!1036399))

(declare-fun m!1036401 () Bool)

(assert (=> b!1121592 m!1036401))

(declare-fun m!1036403 () Bool)

(assert (=> start!97912 m!1036403))

(declare-fun m!1036405 () Bool)

(assert (=> start!97912 m!1036405))

(declare-fun m!1036407 () Bool)

(assert (=> b!1121601 m!1036407))

(declare-fun m!1036409 () Bool)

(assert (=> b!1121597 m!1036409))

(declare-fun m!1036411 () Bool)

(assert (=> b!1121600 m!1036411))

(declare-fun m!1036413 () Bool)

(assert (=> bm!47118 m!1036413))

(declare-fun m!1036415 () Bool)

(assert (=> b!1121591 m!1036415))

(declare-fun m!1036417 () Bool)

(assert (=> b!1121591 m!1036417))

(declare-fun m!1036419 () Bool)

(assert (=> b!1121591 m!1036419))

(declare-fun m!1036421 () Bool)

(assert (=> b!1121591 m!1036421))

(declare-fun m!1036423 () Bool)

(assert (=> bm!47119 m!1036423))

(declare-fun m!1036425 () Bool)

(assert (=> b!1121596 m!1036425))

(declare-fun m!1036427 () Bool)

(assert (=> b!1121596 m!1036427))

(declare-fun m!1036429 () Bool)

(assert (=> b!1121598 m!1036429))

(declare-fun m!1036431 () Bool)

(assert (=> b!1121590 m!1036431))

(declare-fun m!1036433 () Bool)

(assert (=> b!1121594 m!1036433))

(declare-fun m!1036435 () Bool)

(assert (=> mapNonEmpty!44032 m!1036435))

(declare-fun m!1036437 () Bool)

(assert (=> b!1121602 m!1036437))

(check-sat (not b!1121598) (not b!1121602) (not b!1121590) (not b!1121594) (not b!1121596) (not b!1121588) (not b_lambda!18583) (not bm!47119) (not b!1121592) (not b!1121597) (not mapNonEmpty!44032) (not bm!47118) b_and!38011 (not start!97912) tp_is_empty!28143 (not b_next!23613) (not b!1121591) (not b!1121600))
(check-sat b_and!38011 (not b_next!23613))
