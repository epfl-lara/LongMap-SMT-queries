; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98374 () Bool)

(assert start!98374)

(declare-fun b_free!23839 () Bool)

(declare-fun b_next!23839 () Bool)

(assert (=> start!98374 (= b_free!23839 (not b_next!23839))))

(declare-fun tp!84221 () Bool)

(declare-fun b_and!38471 () Bool)

(assert (=> start!98374 (= tp!84221 b_and!38471)))

(declare-fun b!1129418 () Bool)

(declare-fun res!754396 () Bool)

(declare-fun e!642905 () Bool)

(assert (=> b!1129418 (=> (not res!754396) (not e!642905))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73643 0))(
  ( (array!73644 (arr!35468 (Array (_ BitVec 32) (_ BitVec 64))) (size!36005 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73643)

(assert (=> b!1129418 (= res!754396 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36005 _keys!1208))))))

(declare-fun b!1129419 () Bool)

(declare-fun e!642906 () Bool)

(assert (=> b!1129419 (= e!642906 true)))

(declare-datatypes ((V!42953 0))(
  ( (V!42954 (val!14241 Int)) )
))
(declare-fun zeroValue!944 () V!42953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!501350 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42953)

(declare-datatypes ((ValueCell!13475 0))(
  ( (ValueCellFull!13475 (v!16870 V!42953)) (EmptyCell!13475) )
))
(declare-datatypes ((array!73645 0))(
  ( (array!73646 (arr!35469 (Array (_ BitVec 32) ValueCell!13475)) (size!36006 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73645)

(declare-datatypes ((tuple2!17938 0))(
  ( (tuple2!17939 (_1!8980 (_ BitVec 64)) (_2!8980 V!42953)) )
))
(declare-datatypes ((List!24717 0))(
  ( (Nil!24714) (Cons!24713 (h!25931 tuple2!17938) (t!35540 List!24717)) )
))
(declare-datatypes ((ListLongMap!15915 0))(
  ( (ListLongMap!15916 (toList!7973 List!24717)) )
))
(declare-fun contains!6513 (ListLongMap!15915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4493 (array!73643 array!73645 (_ BitVec 32) (_ BitVec 32) V!42953 V!42953 (_ BitVec 32) Int) ListLongMap!15915)

(assert (=> b!1129419 (= lt!501350 (contains!6513 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1129420 () Bool)

(declare-fun res!754400 () Bool)

(assert (=> b!1129420 (=> (not res!754400) (not e!642905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73643 (_ BitVec 32)) Bool)

(assert (=> b!1129420 (= res!754400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129421 () Bool)

(declare-fun e!642911 () Bool)

(assert (=> b!1129421 (= e!642905 e!642911)))

(declare-fun res!754403 () Bool)

(assert (=> b!1129421 (=> (not res!754403) (not e!642911))))

(declare-fun lt!501347 () array!73643)

(assert (=> b!1129421 (= res!754403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501347 mask!1564))))

(assert (=> b!1129421 (= lt!501347 (array!73644 (store (arr!35468 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36005 _keys!1208)))))

(declare-fun res!754405 () Bool)

(assert (=> start!98374 (=> (not res!754405) (not e!642905))))

(assert (=> start!98374 (= res!754405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36005 _keys!1208))))))

(assert (=> start!98374 e!642905))

(declare-fun tp_is_empty!28369 () Bool)

(assert (=> start!98374 tp_is_empty!28369))

(declare-fun array_inv!27270 (array!73643) Bool)

(assert (=> start!98374 (array_inv!27270 _keys!1208)))

(assert (=> start!98374 true))

(assert (=> start!98374 tp!84221))

(declare-fun e!642909 () Bool)

(declare-fun array_inv!27271 (array!73645) Bool)

(assert (=> start!98374 (and (array_inv!27271 _values!996) e!642909)))

(declare-fun call!47867 () ListLongMap!15915)

(declare-fun bm!47863 () Bool)

(declare-fun lt!501349 () array!73645)

(assert (=> bm!47863 (= call!47867 (getCurrentListMapNoExtraKeys!4493 lt!501347 lt!501349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129422 () Bool)

(declare-fun e!642907 () Bool)

(declare-fun e!642903 () Bool)

(assert (=> b!1129422 (= e!642907 e!642903)))

(declare-fun res!754394 () Bool)

(assert (=> b!1129422 (=> res!754394 e!642903)))

(assert (=> b!1129422 (= res!754394 (not (= from!1455 i!673)))))

(declare-fun lt!501352 () ListLongMap!15915)

(assert (=> b!1129422 (= lt!501352 (getCurrentListMapNoExtraKeys!4493 lt!501347 lt!501349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2560 (Int (_ BitVec 64)) V!42953)

(assert (=> b!1129422 (= lt!501349 (array!73646 (store (arr!35469 _values!996) i!673 (ValueCellFull!13475 (dynLambda!2560 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36006 _values!996)))))

(declare-fun lt!501348 () ListLongMap!15915)

(assert (=> b!1129422 (= lt!501348 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129423 () Bool)

(declare-fun res!754401 () Bool)

(assert (=> b!1129423 (=> (not res!754401) (not e!642905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129423 (= res!754401 (validKeyInArray!0 k0!934))))

(declare-fun b!1129424 () Bool)

(declare-fun res!754402 () Bool)

(assert (=> b!1129424 (=> (not res!754402) (not e!642905))))

(assert (=> b!1129424 (= res!754402 (= (select (arr!35468 _keys!1208) i!673) k0!934))))

(declare-fun b!1129425 () Bool)

(assert (=> b!1129425 (= e!642911 (not e!642907))))

(declare-fun res!754404 () Bool)

(assert (=> b!1129425 (=> res!754404 e!642907)))

(assert (=> b!1129425 (= res!754404 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129425 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36947 0))(
  ( (Unit!36948) )
))
(declare-fun lt!501346 () Unit!36947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73643 (_ BitVec 64) (_ BitVec 32)) Unit!36947)

(assert (=> b!1129425 (= lt!501346 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129426 () Bool)

(assert (=> b!1129426 (= e!642903 e!642906)))

(declare-fun res!754395 () Bool)

(assert (=> b!1129426 (=> res!754395 e!642906)))

(assert (=> b!1129426 (= res!754395 (not (= (select (arr!35468 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642910 () Bool)

(assert (=> b!1129426 e!642910))

(declare-fun c!110159 () Bool)

(assert (=> b!1129426 (= c!110159 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501351 () Unit!36947)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!403 (array!73643 array!73645 (_ BitVec 32) (_ BitVec 32) V!42953 V!42953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36947)

(assert (=> b!1129426 (= lt!501351 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129427 () Bool)

(declare-fun call!47866 () ListLongMap!15915)

(assert (=> b!1129427 (= e!642910 (= call!47867 call!47866))))

(declare-fun bm!47864 () Bool)

(assert (=> bm!47864 (= call!47866 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129428 () Bool)

(declare-fun res!754399 () Bool)

(assert (=> b!1129428 (=> (not res!754399) (not e!642905))))

(declare-datatypes ((List!24718 0))(
  ( (Nil!24715) (Cons!24714 (h!25932 (_ BitVec 64)) (t!35541 List!24718)) )
))
(declare-fun arrayNoDuplicates!0 (array!73643 (_ BitVec 32) List!24718) Bool)

(assert (=> b!1129428 (= res!754399 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24715))))

(declare-fun mapIsEmpty!44371 () Bool)

(declare-fun mapRes!44371 () Bool)

(assert (=> mapIsEmpty!44371 mapRes!44371))

(declare-fun b!1129429 () Bool)

(declare-fun res!754398 () Bool)

(assert (=> b!1129429 (=> (not res!754398) (not e!642905))))

(assert (=> b!1129429 (= res!754398 (and (= (size!36006 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36005 _keys!1208) (size!36006 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44371 () Bool)

(declare-fun tp!84220 () Bool)

(declare-fun e!642908 () Bool)

(assert (=> mapNonEmpty!44371 (= mapRes!44371 (and tp!84220 e!642908))))

(declare-fun mapKey!44371 () (_ BitVec 32))

(declare-fun mapRest!44371 () (Array (_ BitVec 32) ValueCell!13475))

(declare-fun mapValue!44371 () ValueCell!13475)

(assert (=> mapNonEmpty!44371 (= (arr!35469 _values!996) (store mapRest!44371 mapKey!44371 mapValue!44371))))

(declare-fun b!1129430 () Bool)

(declare-fun -!1143 (ListLongMap!15915 (_ BitVec 64)) ListLongMap!15915)

(assert (=> b!1129430 (= e!642910 (= call!47867 (-!1143 call!47866 k0!934)))))

(declare-fun b!1129431 () Bool)

(declare-fun res!754393 () Bool)

(assert (=> b!1129431 (=> (not res!754393) (not e!642911))))

(assert (=> b!1129431 (= res!754393 (arrayNoDuplicates!0 lt!501347 #b00000000000000000000000000000000 Nil!24715))))

(declare-fun b!1129432 () Bool)

(declare-fun e!642904 () Bool)

(assert (=> b!1129432 (= e!642904 tp_is_empty!28369)))

(declare-fun b!1129433 () Bool)

(assert (=> b!1129433 (= e!642909 (and e!642904 mapRes!44371))))

(declare-fun condMapEmpty!44371 () Bool)

(declare-fun mapDefault!44371 () ValueCell!13475)

(assert (=> b!1129433 (= condMapEmpty!44371 (= (arr!35469 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13475)) mapDefault!44371)))))

(declare-fun b!1129434 () Bool)

(assert (=> b!1129434 (= e!642908 tp_is_empty!28369)))

(declare-fun b!1129435 () Bool)

(declare-fun res!754397 () Bool)

(assert (=> b!1129435 (=> (not res!754397) (not e!642905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129435 (= res!754397 (validMask!0 mask!1564))))

(assert (= (and start!98374 res!754405) b!1129435))

(assert (= (and b!1129435 res!754397) b!1129429))

(assert (= (and b!1129429 res!754398) b!1129420))

(assert (= (and b!1129420 res!754400) b!1129428))

(assert (= (and b!1129428 res!754399) b!1129418))

(assert (= (and b!1129418 res!754396) b!1129423))

(assert (= (and b!1129423 res!754401) b!1129424))

(assert (= (and b!1129424 res!754402) b!1129421))

(assert (= (and b!1129421 res!754403) b!1129431))

(assert (= (and b!1129431 res!754393) b!1129425))

(assert (= (and b!1129425 (not res!754404)) b!1129422))

(assert (= (and b!1129422 (not res!754394)) b!1129426))

(assert (= (and b!1129426 c!110159) b!1129430))

(assert (= (and b!1129426 (not c!110159)) b!1129427))

(assert (= (or b!1129430 b!1129427) bm!47863))

(assert (= (or b!1129430 b!1129427) bm!47864))

(assert (= (and b!1129426 (not res!754395)) b!1129419))

(assert (= (and b!1129433 condMapEmpty!44371) mapIsEmpty!44371))

(assert (= (and b!1129433 (not condMapEmpty!44371)) mapNonEmpty!44371))

(get-info :version)

(assert (= (and mapNonEmpty!44371 ((_ is ValueCellFull!13475) mapValue!44371)) b!1129434))

(assert (= (and b!1129433 ((_ is ValueCellFull!13475) mapDefault!44371)) b!1129432))

(assert (= start!98374 b!1129433))

(declare-fun b_lambda!18819 () Bool)

(assert (=> (not b_lambda!18819) (not b!1129422)))

(declare-fun t!35539 () Bool)

(declare-fun tb!8643 () Bool)

(assert (=> (and start!98374 (= defaultEntry!1004 defaultEntry!1004) t!35539) tb!8643))

(declare-fun result!17855 () Bool)

(assert (=> tb!8643 (= result!17855 tp_is_empty!28369)))

(assert (=> b!1129422 t!35539))

(declare-fun b_and!38473 () Bool)

(assert (= b_and!38471 (and (=> t!35539 result!17855) b_and!38473)))

(declare-fun m!1043429 () Bool)

(assert (=> bm!47864 m!1043429))

(declare-fun m!1043431 () Bool)

(assert (=> b!1129426 m!1043431))

(declare-fun m!1043433 () Bool)

(assert (=> b!1129426 m!1043433))

(declare-fun m!1043435 () Bool)

(assert (=> b!1129425 m!1043435))

(declare-fun m!1043437 () Bool)

(assert (=> b!1129425 m!1043437))

(declare-fun m!1043439 () Bool)

(assert (=> mapNonEmpty!44371 m!1043439))

(declare-fun m!1043441 () Bool)

(assert (=> b!1129435 m!1043441))

(declare-fun m!1043443 () Bool)

(assert (=> b!1129424 m!1043443))

(declare-fun m!1043445 () Bool)

(assert (=> b!1129428 m!1043445))

(declare-fun m!1043447 () Bool)

(assert (=> b!1129420 m!1043447))

(declare-fun m!1043449 () Bool)

(assert (=> start!98374 m!1043449))

(declare-fun m!1043451 () Bool)

(assert (=> start!98374 m!1043451))

(declare-fun m!1043453 () Bool)

(assert (=> b!1129430 m!1043453))

(assert (=> b!1129419 m!1043429))

(assert (=> b!1129419 m!1043429))

(declare-fun m!1043455 () Bool)

(assert (=> b!1129419 m!1043455))

(declare-fun m!1043457 () Bool)

(assert (=> bm!47863 m!1043457))

(declare-fun m!1043459 () Bool)

(assert (=> b!1129422 m!1043459))

(declare-fun m!1043461 () Bool)

(assert (=> b!1129422 m!1043461))

(declare-fun m!1043463 () Bool)

(assert (=> b!1129422 m!1043463))

(declare-fun m!1043465 () Bool)

(assert (=> b!1129422 m!1043465))

(declare-fun m!1043467 () Bool)

(assert (=> b!1129423 m!1043467))

(declare-fun m!1043469 () Bool)

(assert (=> b!1129421 m!1043469))

(declare-fun m!1043471 () Bool)

(assert (=> b!1129421 m!1043471))

(declare-fun m!1043473 () Bool)

(assert (=> b!1129431 m!1043473))

(check-sat (not b!1129421) (not b_lambda!18819) (not b!1129426) (not bm!47863) (not b!1129420) b_and!38473 (not b!1129431) tp_is_empty!28369 (not mapNonEmpty!44371) (not b!1129435) (not start!98374) (not b_next!23839) (not bm!47864) (not b!1129428) (not b!1129419) (not b!1129430) (not b!1129422) (not b!1129425) (not b!1129423))
(check-sat b_and!38473 (not b_next!23839))
