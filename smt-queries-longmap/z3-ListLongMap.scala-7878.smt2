; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98014 () Bool)

(assert start!98014)

(declare-fun b_free!23715 () Bool)

(declare-fun b_next!23715 () Bool)

(assert (=> start!98014 (= b_free!23715 (not b_next!23715))))

(declare-fun tp!83848 () Bool)

(declare-fun b_and!38213 () Bool)

(assert (=> start!98014 (= tp!83848 b_and!38213)))

(declare-fun b!1124512 () Bool)

(declare-fun e!640140 () Bool)

(declare-fun e!640141 () Bool)

(declare-fun mapRes!44185 () Bool)

(assert (=> b!1124512 (= e!640140 (and e!640141 mapRes!44185))))

(declare-fun condMapEmpty!44185 () Bool)

(declare-datatypes ((V!42787 0))(
  ( (V!42788 (val!14179 Int)) )
))
(declare-datatypes ((ValueCell!13413 0))(
  ( (ValueCellFull!13413 (v!16812 V!42787)) (EmptyCell!13413) )
))
(declare-datatypes ((array!73357 0))(
  ( (array!73358 (arr!35331 (Array (_ BitVec 32) ValueCell!13413)) (size!35867 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73357)

(declare-fun mapDefault!44185 () ValueCell!13413)

(assert (=> b!1124512 (= condMapEmpty!44185 (= (arr!35331 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13413)) mapDefault!44185)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1124513 () Bool)

(declare-fun e!640142 () Bool)

(declare-datatypes ((tuple2!17812 0))(
  ( (tuple2!17813 (_1!8917 (_ BitVec 64)) (_2!8917 V!42787)) )
))
(declare-datatypes ((List!24591 0))(
  ( (Nil!24588) (Cons!24587 (h!25796 tuple2!17812) (t!35298 List!24591)) )
))
(declare-datatypes ((ListLongMap!15781 0))(
  ( (ListLongMap!15782 (toList!7906 List!24591)) )
))
(declare-fun call!47428 () ListLongMap!15781)

(declare-fun call!47427 () ListLongMap!15781)

(declare-fun -!1110 (ListLongMap!15781 (_ BitVec 64)) ListLongMap!15781)

(assert (=> b!1124513 (= e!640142 (= call!47427 (-!1110 call!47428 k0!934)))))

(declare-fun b!1124514 () Bool)

(declare-fun res!751350 () Bool)

(declare-fun e!640144 () Bool)

(assert (=> b!1124514 (=> (not res!751350) (not e!640144))))

(declare-datatypes ((array!73359 0))(
  ( (array!73360 (arr!35332 (Array (_ BitVec 32) (_ BitVec 64))) (size!35868 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73359)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124514 (= res!751350 (= (select (arr!35332 _keys!1208) i!673) k0!934))))

(declare-fun b!1124515 () Bool)

(declare-fun e!640139 () Bool)

(declare-fun e!640145 () Bool)

(assert (=> b!1124515 (= e!640139 e!640145)))

(declare-fun res!751359 () Bool)

(assert (=> b!1124515 (=> res!751359 e!640145)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1124515 (= res!751359 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42787)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499493 () ListLongMap!15781)

(declare-fun lt!499489 () array!73359)

(declare-fun minValue!944 () V!42787)

(declare-fun lt!499490 () array!73357)

(declare-fun getCurrentListMapNoExtraKeys!4394 (array!73359 array!73357 (_ BitVec 32) (_ BitVec 32) V!42787 V!42787 (_ BitVec 32) Int) ListLongMap!15781)

(assert (=> b!1124515 (= lt!499493 (getCurrentListMapNoExtraKeys!4394 lt!499489 lt!499490 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2489 (Int (_ BitVec 64)) V!42787)

(assert (=> b!1124515 (= lt!499490 (array!73358 (store (arr!35331 _values!996) i!673 (ValueCellFull!13413 (dynLambda!2489 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35867 _values!996)))))

(declare-fun lt!499491 () ListLongMap!15781)

(assert (=> b!1124515 (= lt!499491 (getCurrentListMapNoExtraKeys!4394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124516 () Bool)

(declare-fun e!640146 () Bool)

(assert (=> b!1124516 (= e!640144 e!640146)))

(declare-fun res!751351 () Bool)

(assert (=> b!1124516 (=> (not res!751351) (not e!640146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73359 (_ BitVec 32)) Bool)

(assert (=> b!1124516 (= res!751351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499489 mask!1564))))

(assert (=> b!1124516 (= lt!499489 (array!73360 (store (arr!35332 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35868 _keys!1208)))))

(declare-fun b!1124517 () Bool)

(declare-fun e!640149 () Bool)

(assert (=> b!1124517 (= e!640149 true)))

(declare-fun lt!499492 () ListLongMap!15781)

(declare-fun contains!6444 (ListLongMap!15781 (_ BitVec 64)) Bool)

(declare-fun +!3415 (ListLongMap!15781 tuple2!17812) ListLongMap!15781)

(assert (=> b!1124517 (contains!6444 (+!3415 lt!499492 (tuple2!17813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!36864 0))(
  ( (Unit!36865) )
))
(declare-fun lt!499496 () Unit!36864)

(declare-fun addStillContains!677 (ListLongMap!15781 (_ BitVec 64) V!42787 (_ BitVec 64)) Unit!36864)

(assert (=> b!1124517 (= lt!499496 (addStillContains!677 lt!499492 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124518 () Bool)

(declare-fun res!751347 () Bool)

(assert (=> b!1124518 (=> (not res!751347) (not e!640144))))

(assert (=> b!1124518 (= res!751347 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35868 _keys!1208))))))

(declare-fun b!1124519 () Bool)

(assert (=> b!1124519 (= e!640142 (= call!47427 call!47428))))

(declare-fun mapNonEmpty!44185 () Bool)

(declare-fun tp!83849 () Bool)

(declare-fun e!640143 () Bool)

(assert (=> mapNonEmpty!44185 (= mapRes!44185 (and tp!83849 e!640143))))

(declare-fun mapRest!44185 () (Array (_ BitVec 32) ValueCell!13413))

(declare-fun mapKey!44185 () (_ BitVec 32))

(declare-fun mapValue!44185 () ValueCell!13413)

(assert (=> mapNonEmpty!44185 (= (arr!35331 _values!996) (store mapRest!44185 mapKey!44185 mapValue!44185))))

(declare-fun b!1124520 () Bool)

(declare-fun res!751355 () Bool)

(assert (=> b!1124520 (=> (not res!751355) (not e!640146))))

(declare-datatypes ((List!24592 0))(
  ( (Nil!24589) (Cons!24588 (h!25797 (_ BitVec 64)) (t!35299 List!24592)) )
))
(declare-fun arrayNoDuplicates!0 (array!73359 (_ BitVec 32) List!24592) Bool)

(assert (=> b!1124520 (= res!751355 (arrayNoDuplicates!0 lt!499489 #b00000000000000000000000000000000 Nil!24589))))

(declare-fun b!1124521 () Bool)

(declare-fun res!751354 () Bool)

(assert (=> b!1124521 (=> res!751354 e!640149)))

(assert (=> b!1124521 (= res!751354 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124522 () Bool)

(declare-fun res!751358 () Bool)

(assert (=> b!1124522 (=> (not res!751358) (not e!640144))))

(assert (=> b!1124522 (= res!751358 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24589))))

(declare-fun b!1124523 () Bool)

(declare-fun tp_is_empty!28245 () Bool)

(assert (=> b!1124523 (= e!640143 tp_is_empty!28245)))

(declare-fun b!1124524 () Bool)

(declare-fun e!640148 () Bool)

(assert (=> b!1124524 (= e!640145 e!640148)))

(declare-fun res!751356 () Bool)

(assert (=> b!1124524 (=> res!751356 e!640148)))

(assert (=> b!1124524 (= res!751356 (not (= (select (arr!35332 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124524 e!640142))

(declare-fun c!109563 () Bool)

(assert (=> b!1124524 (= c!109563 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499495 () Unit!36864)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!356 (array!73359 array!73357 (_ BitVec 32) (_ BitVec 32) V!42787 V!42787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36864)

(assert (=> b!1124524 (= lt!499495 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124525 () Bool)

(declare-fun res!751349 () Bool)

(assert (=> b!1124525 (=> (not res!751349) (not e!640144))))

(assert (=> b!1124525 (= res!751349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47424 () Bool)

(assert (=> bm!47424 (= call!47428 (getCurrentListMapNoExtraKeys!4394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44185 () Bool)

(assert (=> mapIsEmpty!44185 mapRes!44185))

(declare-fun b!1124526 () Bool)

(declare-fun res!751353 () Bool)

(assert (=> b!1124526 (=> (not res!751353) (not e!640144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124526 (= res!751353 (validMask!0 mask!1564))))

(declare-fun b!1124527 () Bool)

(declare-fun res!751352 () Bool)

(assert (=> b!1124527 (=> (not res!751352) (not e!640144))))

(assert (=> b!1124527 (= res!751352 (and (= (size!35867 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35868 _keys!1208) (size!35867 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124528 () Bool)

(assert (=> b!1124528 (= e!640141 tp_is_empty!28245)))

(declare-fun res!751348 () Bool)

(assert (=> start!98014 (=> (not res!751348) (not e!640144))))

(assert (=> start!98014 (= res!751348 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35868 _keys!1208))))))

(assert (=> start!98014 e!640144))

(assert (=> start!98014 tp_is_empty!28245))

(declare-fun array_inv!27120 (array!73359) Bool)

(assert (=> start!98014 (array_inv!27120 _keys!1208)))

(assert (=> start!98014 true))

(assert (=> start!98014 tp!83848))

(declare-fun array_inv!27121 (array!73357) Bool)

(assert (=> start!98014 (and (array_inv!27121 _values!996) e!640140)))

(declare-fun b!1124529 () Bool)

(assert (=> b!1124529 (= e!640146 (not e!640139))))

(declare-fun res!751346 () Bool)

(assert (=> b!1124529 (=> res!751346 e!640139)))

(assert (=> b!1124529 (= res!751346 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124529 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499494 () Unit!36864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73359 (_ BitVec 64) (_ BitVec 32)) Unit!36864)

(assert (=> b!1124529 (= lt!499494 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124530 () Bool)

(declare-fun res!751357 () Bool)

(assert (=> b!1124530 (=> (not res!751357) (not e!640144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124530 (= res!751357 (validKeyInArray!0 k0!934))))

(declare-fun b!1124531 () Bool)

(assert (=> b!1124531 (= e!640148 e!640149)))

(declare-fun res!751360 () Bool)

(assert (=> b!1124531 (=> res!751360 e!640149)))

(assert (=> b!1124531 (= res!751360 (not (contains!6444 lt!499492 k0!934)))))

(assert (=> b!1124531 (= lt!499492 (getCurrentListMapNoExtraKeys!4394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47425 () Bool)

(assert (=> bm!47425 (= call!47427 (getCurrentListMapNoExtraKeys!4394 lt!499489 lt!499490 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98014 res!751348) b!1124526))

(assert (= (and b!1124526 res!751353) b!1124527))

(assert (= (and b!1124527 res!751352) b!1124525))

(assert (= (and b!1124525 res!751349) b!1124522))

(assert (= (and b!1124522 res!751358) b!1124518))

(assert (= (and b!1124518 res!751347) b!1124530))

(assert (= (and b!1124530 res!751357) b!1124514))

(assert (= (and b!1124514 res!751350) b!1124516))

(assert (= (and b!1124516 res!751351) b!1124520))

(assert (= (and b!1124520 res!751355) b!1124529))

(assert (= (and b!1124529 (not res!751346)) b!1124515))

(assert (= (and b!1124515 (not res!751359)) b!1124524))

(assert (= (and b!1124524 c!109563) b!1124513))

(assert (= (and b!1124524 (not c!109563)) b!1124519))

(assert (= (or b!1124513 b!1124519) bm!47425))

(assert (= (or b!1124513 b!1124519) bm!47424))

(assert (= (and b!1124524 (not res!751356)) b!1124531))

(assert (= (and b!1124531 (not res!751360)) b!1124521))

(assert (= (and b!1124521 (not res!751354)) b!1124517))

(assert (= (and b!1124512 condMapEmpty!44185) mapIsEmpty!44185))

(assert (= (and b!1124512 (not condMapEmpty!44185)) mapNonEmpty!44185))

(get-info :version)

(assert (= (and mapNonEmpty!44185 ((_ is ValueCellFull!13413) mapValue!44185)) b!1124523))

(assert (= (and b!1124512 ((_ is ValueCellFull!13413) mapDefault!44185)) b!1124528))

(assert (= start!98014 b!1124512))

(declare-fun b_lambda!18685 () Bool)

(assert (=> (not b_lambda!18685) (not b!1124515)))

(declare-fun t!35297 () Bool)

(declare-fun tb!8527 () Bool)

(assert (=> (and start!98014 (= defaultEntry!1004 defaultEntry!1004) t!35297) tb!8527))

(declare-fun result!17615 () Bool)

(assert (=> tb!8527 (= result!17615 tp_is_empty!28245)))

(assert (=> b!1124515 t!35297))

(declare-fun b_and!38215 () Bool)

(assert (= b_and!38213 (and (=> t!35297 result!17615) b_and!38215)))

(declare-fun m!1038799 () Bool)

(assert (=> b!1124525 m!1038799))

(declare-fun m!1038801 () Bool)

(assert (=> mapNonEmpty!44185 m!1038801))

(declare-fun m!1038803 () Bool)

(assert (=> b!1124520 m!1038803))

(declare-fun m!1038805 () Bool)

(assert (=> b!1124524 m!1038805))

(declare-fun m!1038807 () Bool)

(assert (=> b!1124524 m!1038807))

(declare-fun m!1038809 () Bool)

(assert (=> b!1124526 m!1038809))

(declare-fun m!1038811 () Bool)

(assert (=> b!1124516 m!1038811))

(declare-fun m!1038813 () Bool)

(assert (=> b!1124516 m!1038813))

(declare-fun m!1038815 () Bool)

(assert (=> bm!47424 m!1038815))

(declare-fun m!1038817 () Bool)

(assert (=> bm!47425 m!1038817))

(declare-fun m!1038819 () Bool)

(assert (=> b!1124522 m!1038819))

(declare-fun m!1038821 () Bool)

(assert (=> b!1124517 m!1038821))

(assert (=> b!1124517 m!1038821))

(declare-fun m!1038823 () Bool)

(assert (=> b!1124517 m!1038823))

(declare-fun m!1038825 () Bool)

(assert (=> b!1124517 m!1038825))

(declare-fun m!1038827 () Bool)

(assert (=> b!1124530 m!1038827))

(declare-fun m!1038829 () Bool)

(assert (=> start!98014 m!1038829))

(declare-fun m!1038831 () Bool)

(assert (=> start!98014 m!1038831))

(declare-fun m!1038833 () Bool)

(assert (=> b!1124515 m!1038833))

(declare-fun m!1038835 () Bool)

(assert (=> b!1124515 m!1038835))

(declare-fun m!1038837 () Bool)

(assert (=> b!1124515 m!1038837))

(declare-fun m!1038839 () Bool)

(assert (=> b!1124515 m!1038839))

(declare-fun m!1038841 () Bool)

(assert (=> b!1124514 m!1038841))

(declare-fun m!1038843 () Bool)

(assert (=> b!1124529 m!1038843))

(declare-fun m!1038845 () Bool)

(assert (=> b!1124529 m!1038845))

(declare-fun m!1038847 () Bool)

(assert (=> b!1124531 m!1038847))

(assert (=> b!1124531 m!1038815))

(declare-fun m!1038849 () Bool)

(assert (=> b!1124513 m!1038849))

(check-sat (not b!1124522) (not b_next!23715) (not bm!47424) b_and!38215 (not b!1124529) (not b_lambda!18685) (not mapNonEmpty!44185) (not b!1124516) (not b!1124515) tp_is_empty!28245 (not start!98014) (not b!1124526) (not b!1124517) (not b!1124531) (not b!1124530) (not bm!47425) (not b!1124513) (not b!1124525) (not b!1124520) (not b!1124524))
(check-sat b_and!38215 (not b_next!23715))
