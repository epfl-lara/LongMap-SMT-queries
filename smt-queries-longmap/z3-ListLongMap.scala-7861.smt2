; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97904 () Bool)

(assert start!97904)

(declare-fun b_free!23611 () Bool)

(declare-fun b_next!23611 () Bool)

(assert (=> start!97904 (= b_free!23611 (not b_next!23611))))

(declare-fun tp!83536 () Bool)

(declare-fun b_and!37983 () Bool)

(assert (=> start!97904 (= tp!83536 b_and!37983)))

(declare-fun mapNonEmpty!44029 () Bool)

(declare-fun mapRes!44029 () Bool)

(declare-fun tp!83537 () Bool)

(declare-fun e!638483 () Bool)

(assert (=> mapNonEmpty!44029 (= mapRes!44029 (and tp!83537 e!638483))))

(declare-datatypes ((V!42649 0))(
  ( (V!42650 (val!14127 Int)) )
))
(declare-datatypes ((ValueCell!13361 0))(
  ( (ValueCellFull!13361 (v!16759 V!42649)) (EmptyCell!13361) )
))
(declare-fun mapValue!44029 () ValueCell!13361)

(declare-fun mapRest!44029 () (Array (_ BitVec 32) ValueCell!13361))

(declare-fun mapKey!44029 () (_ BitVec 32))

(declare-datatypes ((array!73076 0))(
  ( (array!73077 (arr!35191 (Array (_ BitVec 32) ValueCell!13361)) (size!35729 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73076)

(assert (=> mapNonEmpty!44029 (= (arr!35191 _values!996) (store mapRest!44029 mapKey!44029 mapValue!44029))))

(declare-fun b!1121405 () Bool)

(declare-fun res!749193 () Bool)

(declare-fun e!638488 () Bool)

(assert (=> b!1121405 (=> (not res!749193) (not e!638488))))

(declare-datatypes ((array!73078 0))(
  ( (array!73079 (arr!35192 (Array (_ BitVec 32) (_ BitVec 64))) (size!35730 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73078)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121405 (= res!749193 (= (select (arr!35192 _keys!1208) i!673) k0!934))))

(declare-fun b!1121406 () Bool)

(declare-fun res!749184 () Bool)

(declare-fun e!638486 () Bool)

(assert (=> b!1121406 (=> (not res!749184) (not e!638486))))

(declare-fun lt!498192 () array!73078)

(declare-datatypes ((List!24570 0))(
  ( (Nil!24567) (Cons!24566 (h!25775 (_ BitVec 64)) (t!35164 List!24570)) )
))
(declare-fun arrayNoDuplicates!0 (array!73078 (_ BitVec 32) List!24570) Bool)

(assert (=> b!1121406 (= res!749184 (arrayNoDuplicates!0 lt!498192 #b00000000000000000000000000000000 Nil!24567))))

(declare-fun b!1121407 () Bool)

(assert (=> b!1121407 (= e!638488 e!638486)))

(declare-fun res!749187 () Bool)

(assert (=> b!1121407 (=> (not res!749187) (not e!638486))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73078 (_ BitVec 32)) Bool)

(assert (=> b!1121407 (= res!749187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498192 mask!1564))))

(assert (=> b!1121407 (= lt!498192 (array!73079 (store (arr!35192 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35730 _keys!1208)))))

(declare-fun b!1121408 () Bool)

(declare-fun res!749192 () Bool)

(assert (=> b!1121408 (=> (not res!749192) (not e!638488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121408 (= res!749192 (validMask!0 mask!1564))))

(declare-fun b!1121409 () Bool)

(declare-fun res!749191 () Bool)

(assert (=> b!1121409 (=> (not res!749191) (not e!638488))))

(assert (=> b!1121409 (= res!749191 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35730 _keys!1208))))))

(declare-fun b!1121410 () Bool)

(declare-fun res!749185 () Bool)

(assert (=> b!1121410 (=> (not res!749185) (not e!638488))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1121410 (= res!749185 (and (= (size!35729 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35730 _keys!1208) (size!35729 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121411 () Bool)

(declare-fun e!638485 () Bool)

(declare-fun e!638490 () Bool)

(assert (=> b!1121411 (= e!638485 e!638490)))

(declare-fun res!749186 () Bool)

(assert (=> b!1121411 (=> res!749186 e!638490)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1121411 (= res!749186 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42649)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498191 () array!73076)

(declare-datatypes ((tuple2!17798 0))(
  ( (tuple2!17799 (_1!8910 (_ BitVec 64)) (_2!8910 V!42649)) )
))
(declare-datatypes ((List!24571 0))(
  ( (Nil!24568) (Cons!24567 (h!25776 tuple2!17798) (t!35165 List!24571)) )
))
(declare-datatypes ((ListLongMap!15767 0))(
  ( (ListLongMap!15768 (toList!7899 List!24571)) )
))
(declare-fun lt!498193 () ListLongMap!15767)

(declare-fun minValue!944 () V!42649)

(declare-fun getCurrentListMapNoExtraKeys!4407 (array!73078 array!73076 (_ BitVec 32) (_ BitVec 32) V!42649 V!42649 (_ BitVec 32) Int) ListLongMap!15767)

(assert (=> b!1121411 (= lt!498193 (getCurrentListMapNoExtraKeys!4407 lt!498192 lt!498191 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2447 (Int (_ BitVec 64)) V!42649)

(assert (=> b!1121411 (= lt!498191 (array!73077 (store (arr!35191 _values!996) i!673 (ValueCellFull!13361 (dynLambda!2447 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35729 _values!996)))))

(declare-fun lt!498194 () ListLongMap!15767)

(assert (=> b!1121411 (= lt!498194 (getCurrentListMapNoExtraKeys!4407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44029 () Bool)

(assert (=> mapIsEmpty!44029 mapRes!44029))

(declare-fun b!1121412 () Bool)

(declare-fun tp_is_empty!28141 () Bool)

(assert (=> b!1121412 (= e!638483 tp_is_empty!28141)))

(declare-fun bm!47089 () Bool)

(declare-fun call!47093 () ListLongMap!15767)

(assert (=> bm!47089 (= call!47093 (getCurrentListMapNoExtraKeys!4407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121413 () Bool)

(declare-fun res!749183 () Bool)

(assert (=> b!1121413 (=> (not res!749183) (not e!638488))))

(assert (=> b!1121413 (= res!749183 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24567))))

(declare-fun b!1121414 () Bool)

(declare-fun e!638482 () Bool)

(declare-fun call!47092 () ListLongMap!15767)

(assert (=> b!1121414 (= e!638482 (= call!47092 call!47093))))

(declare-fun b!1121415 () Bool)

(declare-fun e!638484 () Bool)

(declare-fun e!638489 () Bool)

(assert (=> b!1121415 (= e!638484 (and e!638489 mapRes!44029))))

(declare-fun condMapEmpty!44029 () Bool)

(declare-fun mapDefault!44029 () ValueCell!13361)

(assert (=> b!1121415 (= condMapEmpty!44029 (= (arr!35191 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13361)) mapDefault!44029)))))

(declare-fun b!1121416 () Bool)

(declare-fun -!1052 (ListLongMap!15767 (_ BitVec 64)) ListLongMap!15767)

(assert (=> b!1121416 (= e!638482 (= call!47092 (-!1052 call!47093 k0!934)))))

(declare-fun b!1121417 () Bool)

(declare-fun res!749189 () Bool)

(assert (=> b!1121417 (=> (not res!749189) (not e!638488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121417 (= res!749189 (validKeyInArray!0 k0!934))))

(declare-fun b!1121418 () Bool)

(assert (=> b!1121418 (= e!638490 true)))

(assert (=> b!1121418 e!638482))

(declare-fun c!109380 () Bool)

(assert (=> b!1121418 (= c!109380 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36625 0))(
  ( (Unit!36626) )
))
(declare-fun lt!498195 () Unit!36625)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!330 (array!73078 array!73076 (_ BitVec 32) (_ BitVec 32) V!42649 V!42649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36625)

(assert (=> b!1121418 (= lt!498195 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!330 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121419 () Bool)

(assert (=> b!1121419 (= e!638486 (not e!638485))))

(declare-fun res!749190 () Bool)

(assert (=> b!1121419 (=> res!749190 e!638485)))

(assert (=> b!1121419 (= res!749190 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121419 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498190 () Unit!36625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73078 (_ BitVec 64) (_ BitVec 32)) Unit!36625)

(assert (=> b!1121419 (= lt!498190 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!47090 () Bool)

(assert (=> bm!47090 (= call!47092 (getCurrentListMapNoExtraKeys!4407 lt!498192 lt!498191 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121420 () Bool)

(declare-fun res!749194 () Bool)

(assert (=> b!1121420 (=> (not res!749194) (not e!638488))))

(assert (=> b!1121420 (= res!749194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121421 () Bool)

(assert (=> b!1121421 (= e!638489 tp_is_empty!28141)))

(declare-fun res!749188 () Bool)

(assert (=> start!97904 (=> (not res!749188) (not e!638488))))

(assert (=> start!97904 (= res!749188 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35730 _keys!1208))))))

(assert (=> start!97904 e!638488))

(assert (=> start!97904 tp_is_empty!28141))

(declare-fun array_inv!27100 (array!73078) Bool)

(assert (=> start!97904 (array_inv!27100 _keys!1208)))

(assert (=> start!97904 true))

(assert (=> start!97904 tp!83536))

(declare-fun array_inv!27101 (array!73076) Bool)

(assert (=> start!97904 (and (array_inv!27101 _values!996) e!638484)))

(assert (= (and start!97904 res!749188) b!1121408))

(assert (= (and b!1121408 res!749192) b!1121410))

(assert (= (and b!1121410 res!749185) b!1121420))

(assert (= (and b!1121420 res!749194) b!1121413))

(assert (= (and b!1121413 res!749183) b!1121409))

(assert (= (and b!1121409 res!749191) b!1121417))

(assert (= (and b!1121417 res!749189) b!1121405))

(assert (= (and b!1121405 res!749193) b!1121407))

(assert (= (and b!1121407 res!749187) b!1121406))

(assert (= (and b!1121406 res!749184) b!1121419))

(assert (= (and b!1121419 (not res!749190)) b!1121411))

(assert (= (and b!1121411 (not res!749186)) b!1121418))

(assert (= (and b!1121418 c!109380) b!1121416))

(assert (= (and b!1121418 (not c!109380)) b!1121414))

(assert (= (or b!1121416 b!1121414) bm!47090))

(assert (= (or b!1121416 b!1121414) bm!47089))

(assert (= (and b!1121415 condMapEmpty!44029) mapIsEmpty!44029))

(assert (= (and b!1121415 (not condMapEmpty!44029)) mapNonEmpty!44029))

(get-info :version)

(assert (= (and mapNonEmpty!44029 ((_ is ValueCellFull!13361) mapValue!44029)) b!1121412))

(assert (= (and b!1121415 ((_ is ValueCellFull!13361) mapDefault!44029)) b!1121421))

(assert (= start!97904 b!1121415))

(declare-fun b_lambda!18563 () Bool)

(assert (=> (not b_lambda!18563) (not b!1121411)))

(declare-fun t!35163 () Bool)

(declare-fun tb!8415 () Bool)

(assert (=> (and start!97904 (= defaultEntry!1004 defaultEntry!1004) t!35163) tb!8415))

(declare-fun result!17399 () Bool)

(assert (=> tb!8415 (= result!17399 tp_is_empty!28141)))

(assert (=> b!1121411 t!35163))

(declare-fun b_and!37985 () Bool)

(assert (= b_and!37983 (and (=> t!35163 result!17399) b_and!37985)))

(declare-fun m!1035729 () Bool)

(assert (=> b!1121406 m!1035729))

(declare-fun m!1035731 () Bool)

(assert (=> b!1121418 m!1035731))

(declare-fun m!1035733 () Bool)

(assert (=> b!1121416 m!1035733))

(declare-fun m!1035735 () Bool)

(assert (=> b!1121408 m!1035735))

(declare-fun m!1035737 () Bool)

(assert (=> b!1121407 m!1035737))

(declare-fun m!1035739 () Bool)

(assert (=> b!1121407 m!1035739))

(declare-fun m!1035741 () Bool)

(assert (=> b!1121411 m!1035741))

(declare-fun m!1035743 () Bool)

(assert (=> b!1121411 m!1035743))

(declare-fun m!1035745 () Bool)

(assert (=> b!1121411 m!1035745))

(declare-fun m!1035747 () Bool)

(assert (=> b!1121411 m!1035747))

(declare-fun m!1035749 () Bool)

(assert (=> b!1121419 m!1035749))

(declare-fun m!1035751 () Bool)

(assert (=> b!1121419 m!1035751))

(declare-fun m!1035753 () Bool)

(assert (=> bm!47090 m!1035753))

(declare-fun m!1035755 () Bool)

(assert (=> b!1121413 m!1035755))

(declare-fun m!1035757 () Bool)

(assert (=> start!97904 m!1035757))

(declare-fun m!1035759 () Bool)

(assert (=> start!97904 m!1035759))

(declare-fun m!1035761 () Bool)

(assert (=> bm!47089 m!1035761))

(declare-fun m!1035763 () Bool)

(assert (=> b!1121405 m!1035763))

(declare-fun m!1035765 () Bool)

(assert (=> b!1121417 m!1035765))

(declare-fun m!1035767 () Bool)

(assert (=> mapNonEmpty!44029 m!1035767))

(declare-fun m!1035769 () Bool)

(assert (=> b!1121420 m!1035769))

(check-sat (not b!1121406) (not b!1121419) (not b_next!23611) (not b!1121407) b_and!37985 (not b!1121418) (not b!1121413) (not b!1121417) tp_is_empty!28141 (not bm!47090) (not b_lambda!18563) (not start!97904) (not b!1121411) (not mapNonEmpty!44029) (not b!1121416) (not bm!47089) (not b!1121420) (not b!1121408))
(check-sat b_and!37985 (not b_next!23611))
