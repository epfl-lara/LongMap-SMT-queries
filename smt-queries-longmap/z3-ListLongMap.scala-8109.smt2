; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99756 () Bool)

(assert start!99756)

(declare-fun b_free!25099 () Bool)

(declare-fun b_next!25099 () Bool)

(assert (=> start!99756 (= b_free!25099 (not b_next!25099))))

(declare-fun tp!88011 () Bool)

(declare-fun b_and!41067 () Bool)

(assert (=> start!99756 (= tp!88011 b_and!41067)))

(declare-fun b!1178349 () Bool)

(declare-fun res!782344 () Bool)

(declare-fun e!669948 () Bool)

(assert (=> b!1178349 (=> (not res!782344) (not e!669948))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178349 (= res!782344 (validMask!0 mask!1564))))

(declare-fun b!1178350 () Bool)

(declare-fun e!669938 () Bool)

(declare-fun e!669941 () Bool)

(declare-fun mapRes!46271 () Bool)

(assert (=> b!1178350 (= e!669938 (and e!669941 mapRes!46271))))

(declare-fun condMapEmpty!46271 () Bool)

(declare-datatypes ((V!44633 0))(
  ( (V!44634 (val!14871 Int)) )
))
(declare-datatypes ((ValueCell!14105 0))(
  ( (ValueCellFull!14105 (v!17505 V!44633)) (EmptyCell!14105) )
))
(declare-datatypes ((array!76113 0))(
  ( (array!76114 (arr!36700 (Array (_ BitVec 32) ValueCell!14105)) (size!37237 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76113)

(declare-fun mapDefault!46271 () ValueCell!14105)

(assert (=> b!1178350 (= condMapEmpty!46271 (= (arr!36700 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14105)) mapDefault!46271)))))

(declare-fun b!1178351 () Bool)

(declare-fun res!782350 () Bool)

(assert (=> b!1178351 (=> (not res!782350) (not e!669948))))

(declare-datatypes ((array!76115 0))(
  ( (array!76116 (arr!36701 (Array (_ BitVec 32) (_ BitVec 64))) (size!37238 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76115)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1178351 (= res!782350 (and (= (size!37237 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37238 _keys!1208) (size!37237 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178352 () Bool)

(declare-fun res!782348 () Bool)

(assert (=> b!1178352 (=> (not res!782348) (not e!669948))))

(declare-datatypes ((List!25800 0))(
  ( (Nil!25797) (Cons!25796 (h!27014 (_ BitVec 64)) (t!37883 List!25800)) )
))
(declare-fun arrayNoDuplicates!0 (array!76115 (_ BitVec 32) List!25800) Bool)

(assert (=> b!1178352 (= res!782348 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25797))))

(declare-fun b!1178353 () Bool)

(declare-datatypes ((Unit!38862 0))(
  ( (Unit!38863) )
))
(declare-fun e!669950 () Unit!38862)

(declare-fun Unit!38864 () Unit!38862)

(assert (=> b!1178353 (= e!669950 Unit!38864)))

(declare-fun lt!531888 () Unit!38862)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76115 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38862)

(assert (=> b!1178353 (= lt!531888 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178353 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531886 () Unit!38862)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76115 (_ BitVec 32) (_ BitVec 32)) Unit!38862)

(assert (=> b!1178353 (= lt!531886 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178353 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25797)))

(declare-fun lt!531878 () Unit!38862)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76115 (_ BitVec 64) (_ BitVec 32) List!25800) Unit!38862)

(assert (=> b!1178353 (= lt!531878 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25797))))

(assert (=> b!1178353 false))

(declare-fun b!1178354 () Bool)

(declare-fun e!669942 () Bool)

(declare-fun e!669949 () Bool)

(assert (=> b!1178354 (= e!669942 e!669949)))

(declare-fun res!782345 () Bool)

(assert (=> b!1178354 (=> res!782345 e!669949)))

(assert (=> b!1178354 (= res!782345 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44633)

(declare-fun lt!531881 () array!76115)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44633)

(declare-fun lt!531890 () array!76113)

(declare-datatypes ((tuple2!19068 0))(
  ( (tuple2!19069 (_1!9545 (_ BitVec 64)) (_2!9545 V!44633)) )
))
(declare-datatypes ((List!25801 0))(
  ( (Nil!25798) (Cons!25797 (h!27015 tuple2!19068) (t!37884 List!25801)) )
))
(declare-datatypes ((ListLongMap!17045 0))(
  ( (ListLongMap!17046 (toList!8538 List!25801)) )
))
(declare-fun lt!531884 () ListLongMap!17045)

(declare-fun getCurrentListMapNoExtraKeys!5019 (array!76115 array!76113 (_ BitVec 32) (_ BitVec 32) V!44633 V!44633 (_ BitVec 32) Int) ListLongMap!17045)

(assert (=> b!1178354 (= lt!531884 (getCurrentListMapNoExtraKeys!5019 lt!531881 lt!531890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531880 () V!44633)

(assert (=> b!1178354 (= lt!531890 (array!76114 (store (arr!36700 _values!996) i!673 (ValueCellFull!14105 lt!531880)) (size!37237 _values!996)))))

(declare-fun dynLambda!2993 (Int (_ BitVec 64)) V!44633)

(assert (=> b!1178354 (= lt!531880 (dynLambda!2993 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531879 () ListLongMap!17045)

(assert (=> b!1178354 (= lt!531879 (getCurrentListMapNoExtraKeys!5019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!782357 () Bool)

(assert (=> start!99756 (=> (not res!782357) (not e!669948))))

(assert (=> start!99756 (= res!782357 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37238 _keys!1208))))))

(assert (=> start!99756 e!669948))

(declare-fun tp_is_empty!29629 () Bool)

(assert (=> start!99756 tp_is_empty!29629))

(declare-fun array_inv!28104 (array!76115) Bool)

(assert (=> start!99756 (array_inv!28104 _keys!1208)))

(assert (=> start!99756 true))

(assert (=> start!99756 tp!88011))

(declare-fun array_inv!28105 (array!76113) Bool)

(assert (=> start!99756 (and (array_inv!28105 _values!996) e!669938)))

(declare-fun mapIsEmpty!46271 () Bool)

(assert (=> mapIsEmpty!46271 mapRes!46271))

(declare-fun mapNonEmpty!46271 () Bool)

(declare-fun tp!88010 () Bool)

(declare-fun e!669945 () Bool)

(assert (=> mapNonEmpty!46271 (= mapRes!46271 (and tp!88010 e!669945))))

(declare-fun mapKey!46271 () (_ BitVec 32))

(declare-fun mapValue!46271 () ValueCell!14105)

(declare-fun mapRest!46271 () (Array (_ BitVec 32) ValueCell!14105))

(assert (=> mapNonEmpty!46271 (= (arr!36700 _values!996) (store mapRest!46271 mapKey!46271 mapValue!46271))))

(declare-fun b!1178355 () Bool)

(declare-fun e!669939 () Bool)

(assert (=> b!1178355 (= e!669939 (not e!669942))))

(declare-fun res!782346 () Bool)

(assert (=> b!1178355 (=> res!782346 e!669942)))

(assert (=> b!1178355 (= res!782346 (bvsgt from!1455 i!673))))

(assert (=> b!1178355 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531883 () Unit!38862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76115 (_ BitVec 64) (_ BitVec 32)) Unit!38862)

(assert (=> b!1178355 (= lt!531883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178356 () Bool)

(assert (=> b!1178356 (= e!669948 e!669939)))

(declare-fun res!782352 () Bool)

(assert (=> b!1178356 (=> (not res!782352) (not e!669939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76115 (_ BitVec 32)) Bool)

(assert (=> b!1178356 (= res!782352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531881 mask!1564))))

(assert (=> b!1178356 (= lt!531881 (array!76116 (store (arr!36701 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37238 _keys!1208)))))

(declare-fun b!1178357 () Bool)

(declare-fun e!669944 () Bool)

(assert (=> b!1178357 (= e!669944 true)))

(declare-fun e!669943 () Bool)

(assert (=> b!1178357 e!669943))

(declare-fun res!782342 () Bool)

(assert (=> b!1178357 (=> (not res!782342) (not e!669943))))

(assert (=> b!1178357 (= res!782342 (not (= (select (arr!36701 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531892 () Unit!38862)

(assert (=> b!1178357 (= lt!531892 e!669950)))

(declare-fun c!117170 () Bool)

(assert (=> b!1178357 (= c!117170 (= (select (arr!36701 _keys!1208) from!1455) k0!934))))

(declare-fun e!669946 () Bool)

(assert (=> b!1178357 e!669946))

(declare-fun res!782347 () Bool)

(assert (=> b!1178357 (=> (not res!782347) (not e!669946))))

(declare-fun lt!531887 () tuple2!19068)

(declare-fun lt!531882 () ListLongMap!17045)

(declare-fun +!3866 (ListLongMap!17045 tuple2!19068) ListLongMap!17045)

(assert (=> b!1178357 (= res!782347 (= lt!531884 (+!3866 lt!531882 lt!531887)))))

(declare-fun get!18783 (ValueCell!14105 V!44633) V!44633)

(assert (=> b!1178357 (= lt!531887 (tuple2!19069 (select (arr!36701 _keys!1208) from!1455) (get!18783 (select (arr!36700 _values!996) from!1455) lt!531880)))))

(declare-fun b!1178358 () Bool)

(assert (=> b!1178358 (= e!669949 e!669944)))

(declare-fun res!782354 () Bool)

(assert (=> b!1178358 (=> res!782354 e!669944)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178358 (= res!782354 (not (validKeyInArray!0 (select (arr!36701 _keys!1208) from!1455))))))

(declare-fun lt!531885 () ListLongMap!17045)

(assert (=> b!1178358 (= lt!531885 lt!531882)))

(declare-fun lt!531889 () ListLongMap!17045)

(declare-fun -!1574 (ListLongMap!17045 (_ BitVec 64)) ListLongMap!17045)

(assert (=> b!1178358 (= lt!531882 (-!1574 lt!531889 k0!934))))

(assert (=> b!1178358 (= lt!531885 (getCurrentListMapNoExtraKeys!5019 lt!531881 lt!531890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178358 (= lt!531889 (getCurrentListMapNoExtraKeys!5019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531891 () Unit!38862)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!799 (array!76115 array!76113 (_ BitVec 32) (_ BitVec 32) V!44633 V!44633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38862)

(assert (=> b!1178358 (= lt!531891 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178359 () Bool)

(declare-fun res!782343 () Bool)

(assert (=> b!1178359 (=> (not res!782343) (not e!669948))))

(assert (=> b!1178359 (= res!782343 (validKeyInArray!0 k0!934))))

(declare-fun b!1178360 () Bool)

(declare-fun e!669940 () Bool)

(assert (=> b!1178360 (= e!669946 e!669940)))

(declare-fun res!782351 () Bool)

(assert (=> b!1178360 (=> res!782351 e!669940)))

(assert (=> b!1178360 (= res!782351 (not (= (select (arr!36701 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178361 () Bool)

(declare-fun res!782353 () Bool)

(assert (=> b!1178361 (=> (not res!782353) (not e!669948))))

(assert (=> b!1178361 (= res!782353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178362 () Bool)

(declare-fun Unit!38865 () Unit!38862)

(assert (=> b!1178362 (= e!669950 Unit!38865)))

(declare-fun b!1178363 () Bool)

(assert (=> b!1178363 (= e!669943 (= lt!531879 (+!3866 lt!531889 lt!531887)))))

(declare-fun b!1178364 () Bool)

(assert (=> b!1178364 (= e!669945 tp_is_empty!29629)))

(declare-fun b!1178365 () Bool)

(assert (=> b!1178365 (= e!669940 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178366 () Bool)

(declare-fun res!782349 () Bool)

(assert (=> b!1178366 (=> (not res!782349) (not e!669939))))

(assert (=> b!1178366 (= res!782349 (arrayNoDuplicates!0 lt!531881 #b00000000000000000000000000000000 Nil!25797))))

(declare-fun b!1178367 () Bool)

(declare-fun res!782356 () Bool)

(assert (=> b!1178367 (=> (not res!782356) (not e!669948))))

(assert (=> b!1178367 (= res!782356 (= (select (arr!36701 _keys!1208) i!673) k0!934))))

(declare-fun b!1178368 () Bool)

(assert (=> b!1178368 (= e!669941 tp_is_empty!29629)))

(declare-fun b!1178369 () Bool)

(declare-fun res!782355 () Bool)

(assert (=> b!1178369 (=> (not res!782355) (not e!669948))))

(assert (=> b!1178369 (= res!782355 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37238 _keys!1208))))))

(assert (= (and start!99756 res!782357) b!1178349))

(assert (= (and b!1178349 res!782344) b!1178351))

(assert (= (and b!1178351 res!782350) b!1178361))

(assert (= (and b!1178361 res!782353) b!1178352))

(assert (= (and b!1178352 res!782348) b!1178369))

(assert (= (and b!1178369 res!782355) b!1178359))

(assert (= (and b!1178359 res!782343) b!1178367))

(assert (= (and b!1178367 res!782356) b!1178356))

(assert (= (and b!1178356 res!782352) b!1178366))

(assert (= (and b!1178366 res!782349) b!1178355))

(assert (= (and b!1178355 (not res!782346)) b!1178354))

(assert (= (and b!1178354 (not res!782345)) b!1178358))

(assert (= (and b!1178358 (not res!782354)) b!1178357))

(assert (= (and b!1178357 res!782347) b!1178360))

(assert (= (and b!1178360 (not res!782351)) b!1178365))

(assert (= (and b!1178357 c!117170) b!1178353))

(assert (= (and b!1178357 (not c!117170)) b!1178362))

(assert (= (and b!1178357 res!782342) b!1178363))

(assert (= (and b!1178350 condMapEmpty!46271) mapIsEmpty!46271))

(assert (= (and b!1178350 (not condMapEmpty!46271)) mapNonEmpty!46271))

(get-info :version)

(assert (= (and mapNonEmpty!46271 ((_ is ValueCellFull!14105) mapValue!46271)) b!1178364))

(assert (= (and b!1178350 ((_ is ValueCellFull!14105) mapDefault!46271)) b!1178368))

(assert (= start!99756 b!1178350))

(declare-fun b_lambda!20237 () Bool)

(assert (=> (not b_lambda!20237) (not b!1178354)))

(declare-fun t!37882 () Bool)

(declare-fun tb!9903 () Bool)

(assert (=> (and start!99756 (= defaultEntry!1004 defaultEntry!1004) t!37882) tb!9903))

(declare-fun result!20381 () Bool)

(assert (=> tb!9903 (= result!20381 tp_is_empty!29629)))

(assert (=> b!1178354 t!37882))

(declare-fun b_and!41069 () Bool)

(assert (= b_and!41067 (and (=> t!37882 result!20381) b_and!41069)))

(declare-fun m!1086573 () Bool)

(assert (=> b!1178359 m!1086573))

(declare-fun m!1086575 () Bool)

(assert (=> start!99756 m!1086575))

(declare-fun m!1086577 () Bool)

(assert (=> start!99756 m!1086577))

(declare-fun m!1086579 () Bool)

(assert (=> b!1178366 m!1086579))

(declare-fun m!1086581 () Bool)

(assert (=> b!1178363 m!1086581))

(declare-fun m!1086583 () Bool)

(assert (=> b!1178356 m!1086583))

(declare-fun m!1086585 () Bool)

(assert (=> b!1178356 m!1086585))

(declare-fun m!1086587 () Bool)

(assert (=> b!1178352 m!1086587))

(declare-fun m!1086589 () Bool)

(assert (=> b!1178365 m!1086589))

(declare-fun m!1086591 () Bool)

(assert (=> b!1178361 m!1086591))

(declare-fun m!1086593 () Bool)

(assert (=> b!1178360 m!1086593))

(declare-fun m!1086595 () Bool)

(assert (=> b!1178367 m!1086595))

(declare-fun m!1086597 () Bool)

(assert (=> b!1178354 m!1086597))

(declare-fun m!1086599 () Bool)

(assert (=> b!1178354 m!1086599))

(declare-fun m!1086601 () Bool)

(assert (=> b!1178354 m!1086601))

(declare-fun m!1086603 () Bool)

(assert (=> b!1178354 m!1086603))

(assert (=> b!1178357 m!1086593))

(declare-fun m!1086605 () Bool)

(assert (=> b!1178357 m!1086605))

(declare-fun m!1086607 () Bool)

(assert (=> b!1178357 m!1086607))

(assert (=> b!1178357 m!1086607))

(declare-fun m!1086609 () Bool)

(assert (=> b!1178357 m!1086609))

(declare-fun m!1086611 () Bool)

(assert (=> b!1178349 m!1086611))

(declare-fun m!1086613 () Bool)

(assert (=> b!1178353 m!1086613))

(declare-fun m!1086615 () Bool)

(assert (=> b!1178353 m!1086615))

(declare-fun m!1086617 () Bool)

(assert (=> b!1178353 m!1086617))

(declare-fun m!1086619 () Bool)

(assert (=> b!1178353 m!1086619))

(declare-fun m!1086621 () Bool)

(assert (=> b!1178353 m!1086621))

(declare-fun m!1086623 () Bool)

(assert (=> b!1178355 m!1086623))

(declare-fun m!1086625 () Bool)

(assert (=> b!1178355 m!1086625))

(declare-fun m!1086627 () Bool)

(assert (=> mapNonEmpty!46271 m!1086627))

(declare-fun m!1086629 () Bool)

(assert (=> b!1178358 m!1086629))

(declare-fun m!1086631 () Bool)

(assert (=> b!1178358 m!1086631))

(declare-fun m!1086633 () Bool)

(assert (=> b!1178358 m!1086633))

(assert (=> b!1178358 m!1086593))

(declare-fun m!1086635 () Bool)

(assert (=> b!1178358 m!1086635))

(assert (=> b!1178358 m!1086593))

(declare-fun m!1086637 () Bool)

(assert (=> b!1178358 m!1086637))

(check-sat (not b_next!25099) (not b!1178363) (not b!1178355) (not b!1178356) (not b!1178361) (not b_lambda!20237) (not b!1178349) tp_is_empty!29629 b_and!41069 (not b!1178365) (not b!1178357) (not mapNonEmpty!46271) (not b!1178354) (not b!1178353) (not start!99756) (not b!1178366) (not b!1178359) (not b!1178358) (not b!1178352))
(check-sat b_and!41069 (not b_next!25099))
