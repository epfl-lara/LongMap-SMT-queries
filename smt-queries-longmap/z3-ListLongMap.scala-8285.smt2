; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100940 () Bool)

(assert start!100940)

(declare-fun b_free!25981 () Bool)

(declare-fun b_next!25981 () Bool)

(assert (=> start!100940 (= b_free!25981 (not b_next!25981))))

(declare-fun tp!90955 () Bool)

(declare-fun b_and!42999 () Bool)

(assert (=> start!100940 (= tp!90955 b_and!42999)))

(declare-datatypes ((V!46041 0))(
  ( (V!46042 (val!15399 Int)) )
))
(declare-fun zeroValue!944 () V!46041)

(declare-fun bm!59165 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!39902 0))(
  ( (Unit!39903) )
))
(declare-fun call!59175 () Unit!39902)

(declare-datatypes ((tuple2!19840 0))(
  ( (tuple2!19841 (_1!9931 (_ BitVec 64)) (_2!9931 V!46041)) )
))
(declare-datatypes ((List!26620 0))(
  ( (Nil!26617) (Cons!26616 (h!27825 tuple2!19840) (t!39572 List!26620)) )
))
(declare-datatypes ((ListLongMap!17809 0))(
  ( (ListLongMap!17810 (toList!8920 List!26620)) )
))
(declare-fun lt!548361 () ListLongMap!17809)

(declare-fun lt!548371 () ListLongMap!17809)

(declare-fun minValue!944 () V!46041)

(declare-fun c!118904 () Bool)

(declare-fun c!118903 () Bool)

(declare-fun addStillContains!1031 (ListLongMap!17809 (_ BitVec 64) V!46041 (_ BitVec 64)) Unit!39902)

(assert (=> bm!59165 (= call!59175 (addStillContains!1031 (ite c!118904 lt!548371 lt!548361) (ite c!118904 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118903 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118904 minValue!944 (ite c!118903 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1208523 () Bool)

(declare-fun e!686368 () Bool)

(declare-fun e!686360 () Bool)

(declare-fun mapRes!47893 () Bool)

(assert (=> b!1208523 (= e!686368 (and e!686360 mapRes!47893))))

(declare-fun condMapEmpty!47893 () Bool)

(declare-datatypes ((ValueCell!14633 0))(
  ( (ValueCellFull!14633 (v!18047 V!46041)) (EmptyCell!14633) )
))
(declare-datatypes ((array!78068 0))(
  ( (array!78069 (arr!37672 (Array (_ BitVec 32) ValueCell!14633)) (size!38210 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78068)

(declare-fun mapDefault!47893 () ValueCell!14633)

(assert (=> b!1208523 (= condMapEmpty!47893 (= (arr!37672 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14633)) mapDefault!47893)))))

(declare-fun b!1208524 () Bool)

(declare-fun e!686361 () Bool)

(declare-fun e!686362 () Bool)

(assert (=> b!1208524 (= e!686361 e!686362)))

(declare-fun res!803315 () Bool)

(assert (=> b!1208524 (=> (not res!803315) (not e!686362))))

(declare-datatypes ((array!78070 0))(
  ( (array!78071 (arr!37673 (Array (_ BitVec 32) (_ BitVec 64))) (size!38211 (_ BitVec 32))) )
))
(declare-fun lt!548359 () array!78070)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78070 (_ BitVec 32)) Bool)

(assert (=> b!1208524 (= res!803315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548359 mask!1564))))

(declare-fun _keys!1208 () array!78070)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208524 (= lt!548359 (array!78071 (store (arr!37673 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38211 _keys!1208)))))

(declare-fun bm!59166 () Bool)

(declare-fun call!59174 () Unit!39902)

(assert (=> bm!59166 (= call!59174 call!59175)))

(declare-fun b!1208525 () Bool)

(declare-fun e!686365 () Unit!39902)

(declare-fun lt!548362 () Unit!39902)

(assert (=> b!1208525 (= e!686365 lt!548362)))

(assert (=> b!1208525 (= lt!548362 call!59174)))

(declare-fun call!59168 () Bool)

(assert (=> b!1208525 call!59168))

(declare-fun b!1208526 () Bool)

(declare-fun res!803318 () Bool)

(assert (=> b!1208526 (=> (not res!803318) (not e!686361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208526 (= res!803318 (validMask!0 mask!1564))))

(declare-fun b!1208527 () Bool)

(declare-fun res!803313 () Bool)

(declare-fun e!686367 () Bool)

(assert (=> b!1208527 (=> res!803313 e!686367)))

(declare-datatypes ((List!26621 0))(
  ( (Nil!26618) (Cons!26617 (h!27826 (_ BitVec 64)) (t!39573 List!26621)) )
))
(declare-fun noDuplicate!1639 (List!26621) Bool)

(assert (=> b!1208527 (= res!803313 (not (noDuplicate!1639 Nil!26618)))))

(declare-fun b!1208529 () Bool)

(declare-fun lt!548368 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!686354 () Bool)

(assert (=> b!1208529 (= e!686354 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548368) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1208530 () Bool)

(declare-fun e!686366 () Bool)

(declare-fun e!686351 () Bool)

(assert (=> b!1208530 (= e!686366 e!686351)))

(declare-fun res!803323 () Bool)

(assert (=> b!1208530 (=> res!803323 e!686351)))

(declare-fun contains!6922 (ListLongMap!17809 (_ BitVec 64)) Bool)

(assert (=> b!1208530 (= res!803323 (not (contains!6922 lt!548361 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5363 (array!78070 array!78068 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 32) Int) ListLongMap!17809)

(assert (=> b!1208530 (= lt!548361 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208531 () Bool)

(declare-fun e!686352 () Bool)

(declare-fun arrayContainsKey!0 (array!78070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208531 (= e!686352 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208532 () Bool)

(declare-fun res!803326 () Bool)

(assert (=> b!1208532 (=> (not res!803326) (not e!686361))))

(assert (=> b!1208532 (= res!803326 (and (= (size!38210 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38211 _keys!1208) (size!38210 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208533 () Bool)

(declare-fun res!803312 () Bool)

(assert (=> b!1208533 (=> (not res!803312) (not e!686361))))

(assert (=> b!1208533 (= res!803312 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38211 _keys!1208))))))

(declare-fun b!1208534 () Bool)

(declare-fun e!686355 () Bool)

(assert (=> b!1208534 (= e!686355 e!686366)))

(declare-fun res!803311 () Bool)

(assert (=> b!1208534 (=> res!803311 e!686366)))

(assert (=> b!1208534 (= res!803311 (not (= (select (arr!37673 _keys!1208) from!1455) k0!934)))))

(declare-fun e!686356 () Bool)

(assert (=> b!1208534 e!686356))

(declare-fun c!118902 () Bool)

(assert (=> b!1208534 (= c!118902 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548369 () Unit!39902)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1046 (array!78070 array!78068 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39902)

(assert (=> b!1208534 (= lt!548369 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1046 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208535 () Bool)

(declare-fun e!686359 () Bool)

(declare-fun tp_is_empty!30685 () Bool)

(assert (=> b!1208535 (= e!686359 tp_is_empty!30685)))

(declare-fun b!1208536 () Bool)

(declare-fun call!59170 () ListLongMap!17809)

(declare-fun call!59171 () ListLongMap!17809)

(assert (=> b!1208536 (= e!686356 (= call!59170 call!59171))))

(declare-fun b!1208537 () Bool)

(declare-fun res!803320 () Bool)

(assert (=> b!1208537 (=> (not res!803320) (not e!686361))))

(declare-fun arrayNoDuplicates!0 (array!78070 (_ BitVec 32) List!26621) Bool)

(assert (=> b!1208537 (= res!803320 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26618))))

(declare-fun b!1208538 () Bool)

(declare-fun Unit!39904 () Unit!39902)

(assert (=> b!1208538 (= e!686365 Unit!39904)))

(declare-fun b!1208539 () Bool)

(declare-fun e!686358 () Bool)

(assert (=> b!1208539 (= e!686367 e!686358)))

(declare-fun res!803324 () Bool)

(assert (=> b!1208539 (=> (not res!803324) (not e!686358))))

(declare-fun contains!6923 (List!26621 (_ BitVec 64)) Bool)

(assert (=> b!1208539 (= res!803324 (not (contains!6923 Nil!26618 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208540 () Bool)

(assert (=> b!1208540 (= e!686351 e!686367)))

(declare-fun res!803325 () Bool)

(assert (=> b!1208540 (=> res!803325 e!686367)))

(assert (=> b!1208540 (= res!803325 (or (bvsge (size!38211 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 _keys!1208)) (bvsge from!1455 (size!38211 _keys!1208))))))

(assert (=> b!1208540 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26618)))

(declare-fun lt!548363 () Unit!39902)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78070 (_ BitVec 32) (_ BitVec 32)) Unit!39902)

(assert (=> b!1208540 (= lt!548363 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1208540 e!686352))

(declare-fun res!803314 () Bool)

(assert (=> b!1208540 (=> (not res!803314) (not e!686352))))

(assert (=> b!1208540 (= res!803314 e!686354)))

(declare-fun c!118905 () Bool)

(assert (=> b!1208540 (= c!118905 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548370 () Unit!39902)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!576 (array!78070 array!78068 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 64) (_ BitVec 32) Int) Unit!39902)

(assert (=> b!1208540 (= lt!548370 (lemmaListMapContainsThenArrayContainsFrom!576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548366 () Unit!39902)

(declare-fun e!686363 () Unit!39902)

(assert (=> b!1208540 (= lt!548366 e!686363)))

(assert (=> b!1208540 (= c!118904 (and (not lt!548368) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208540 (= lt!548368 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1208541 () Bool)

(declare-fun -!1804 (ListLongMap!17809 (_ BitVec 64)) ListLongMap!17809)

(assert (=> b!1208541 (= e!686356 (= call!59170 (-!1804 call!59171 k0!934)))))

(declare-fun b!1208542 () Bool)

(assert (=> b!1208542 (= e!686354 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59167 () Bool)

(declare-fun call!59172 () Bool)

(assert (=> bm!59167 (= call!59168 call!59172)))

(declare-fun b!1208543 () Bool)

(declare-fun res!803316 () Bool)

(assert (=> b!1208543 (=> (not res!803316) (not e!686361))))

(assert (=> b!1208543 (= res!803316 (= (select (arr!37673 _keys!1208) i!673) k0!934))))

(declare-fun call!59169 () ListLongMap!17809)

(declare-fun bm!59168 () Bool)

(assert (=> bm!59168 (= call!59172 (contains!6922 (ite c!118904 lt!548371 call!59169) k0!934))))

(declare-fun b!1208528 () Bool)

(declare-fun e!686357 () Bool)

(assert (=> b!1208528 (= e!686362 (not e!686357))))

(declare-fun res!803319 () Bool)

(assert (=> b!1208528 (=> res!803319 e!686357)))

(assert (=> b!1208528 (= res!803319 (bvsgt from!1455 i!673))))

(assert (=> b!1208528 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548364 () Unit!39902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78070 (_ BitVec 64) (_ BitVec 32)) Unit!39902)

(assert (=> b!1208528 (= lt!548364 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!803317 () Bool)

(assert (=> start!100940 (=> (not res!803317) (not e!686361))))

(assert (=> start!100940 (= res!803317 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38211 _keys!1208))))))

(assert (=> start!100940 e!686361))

(assert (=> start!100940 tp_is_empty!30685))

(declare-fun array_inv!28806 (array!78070) Bool)

(assert (=> start!100940 (array_inv!28806 _keys!1208)))

(assert (=> start!100940 true))

(assert (=> start!100940 tp!90955))

(declare-fun array_inv!28807 (array!78068) Bool)

(assert (=> start!100940 (and (array_inv!28807 _values!996) e!686368)))

(declare-fun mapNonEmpty!47893 () Bool)

(declare-fun tp!90956 () Bool)

(assert (=> mapNonEmpty!47893 (= mapRes!47893 (and tp!90956 e!686359))))

(declare-fun mapKey!47893 () (_ BitVec 32))

(declare-fun mapValue!47893 () ValueCell!14633)

(declare-fun mapRest!47893 () (Array (_ BitVec 32) ValueCell!14633))

(assert (=> mapNonEmpty!47893 (= (arr!37672 _values!996) (store mapRest!47893 mapKey!47893 mapValue!47893))))

(declare-fun bm!59169 () Bool)

(declare-fun call!59173 () ListLongMap!17809)

(declare-fun +!4047 (ListLongMap!17809 tuple2!19840) ListLongMap!17809)

(assert (=> bm!59169 (= call!59173 (+!4047 lt!548361 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208544 () Bool)

(declare-fun lt!548365 () Unit!39902)

(assert (=> b!1208544 (= e!686363 lt!548365)))

(declare-fun lt!548358 () Unit!39902)

(assert (=> b!1208544 (= lt!548358 (addStillContains!1031 lt!548361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1208544 (= lt!548371 call!59173)))

(assert (=> b!1208544 call!59172))

(assert (=> b!1208544 (= lt!548365 call!59175)))

(assert (=> b!1208544 (contains!6922 (+!4047 lt!548371 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1208545 () Bool)

(declare-fun res!803327 () Bool)

(assert (=> b!1208545 (=> (not res!803327) (not e!686362))))

(assert (=> b!1208545 (= res!803327 (arrayNoDuplicates!0 lt!548359 #b00000000000000000000000000000000 Nil!26618))))

(declare-fun b!1208546 () Bool)

(assert (=> b!1208546 (= e!686358 (not (contains!6923 Nil!26618 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208547 () Bool)

(assert (=> b!1208547 (= e!686360 tp_is_empty!30685)))

(declare-fun b!1208548 () Bool)

(assert (=> b!1208548 call!59168))

(declare-fun lt!548360 () Unit!39902)

(assert (=> b!1208548 (= lt!548360 call!59174)))

(declare-fun e!686353 () Unit!39902)

(assert (=> b!1208548 (= e!686353 lt!548360)))

(declare-fun mapIsEmpty!47893 () Bool)

(assert (=> mapIsEmpty!47893 mapRes!47893))

(declare-fun b!1208549 () Bool)

(declare-fun res!803322 () Bool)

(assert (=> b!1208549 (=> (not res!803322) (not e!686361))))

(assert (=> b!1208549 (= res!803322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59170 () Bool)

(assert (=> bm!59170 (= call!59171 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208550 () Bool)

(assert (=> b!1208550 (= e!686357 e!686355)))

(declare-fun res!803310 () Bool)

(assert (=> b!1208550 (=> res!803310 e!686355)))

(assert (=> b!1208550 (= res!803310 (not (= from!1455 i!673)))))

(declare-fun lt!548357 () ListLongMap!17809)

(declare-fun lt!548372 () array!78068)

(assert (=> b!1208550 (= lt!548357 (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3227 (Int (_ BitVec 64)) V!46041)

(assert (=> b!1208550 (= lt!548372 (array!78069 (store (arr!37672 _values!996) i!673 (ValueCellFull!14633 (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38210 _values!996)))))

(declare-fun lt!548367 () ListLongMap!17809)

(assert (=> b!1208550 (= lt!548367 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1208551 () Bool)

(assert (=> b!1208551 (= e!686363 e!686353)))

(assert (=> b!1208551 (= c!118903 (and (not lt!548368) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208552 () Bool)

(declare-fun c!118906 () Bool)

(assert (=> b!1208552 (= c!118906 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548368))))

(assert (=> b!1208552 (= e!686353 e!686365)))

(declare-fun bm!59171 () Bool)

(assert (=> bm!59171 (= call!59169 call!59173)))

(declare-fun bm!59172 () Bool)

(assert (=> bm!59172 (= call!59170 (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208553 () Bool)

(declare-fun res!803321 () Bool)

(assert (=> b!1208553 (=> (not res!803321) (not e!686361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208553 (= res!803321 (validKeyInArray!0 k0!934))))

(assert (= (and start!100940 res!803317) b!1208526))

(assert (= (and b!1208526 res!803318) b!1208532))

(assert (= (and b!1208532 res!803326) b!1208549))

(assert (= (and b!1208549 res!803322) b!1208537))

(assert (= (and b!1208537 res!803320) b!1208533))

(assert (= (and b!1208533 res!803312) b!1208553))

(assert (= (and b!1208553 res!803321) b!1208543))

(assert (= (and b!1208543 res!803316) b!1208524))

(assert (= (and b!1208524 res!803315) b!1208545))

(assert (= (and b!1208545 res!803327) b!1208528))

(assert (= (and b!1208528 (not res!803319)) b!1208550))

(assert (= (and b!1208550 (not res!803310)) b!1208534))

(assert (= (and b!1208534 c!118902) b!1208541))

(assert (= (and b!1208534 (not c!118902)) b!1208536))

(assert (= (or b!1208541 b!1208536) bm!59172))

(assert (= (or b!1208541 b!1208536) bm!59170))

(assert (= (and b!1208534 (not res!803311)) b!1208530))

(assert (= (and b!1208530 (not res!803323)) b!1208540))

(assert (= (and b!1208540 c!118904) b!1208544))

(assert (= (and b!1208540 (not c!118904)) b!1208551))

(assert (= (and b!1208551 c!118903) b!1208548))

(assert (= (and b!1208551 (not c!118903)) b!1208552))

(assert (= (and b!1208552 c!118906) b!1208525))

(assert (= (and b!1208552 (not c!118906)) b!1208538))

(assert (= (or b!1208548 b!1208525) bm!59166))

(assert (= (or b!1208548 b!1208525) bm!59171))

(assert (= (or b!1208548 b!1208525) bm!59167))

(assert (= (or b!1208544 bm!59167) bm!59168))

(assert (= (or b!1208544 bm!59166) bm!59165))

(assert (= (or b!1208544 bm!59171) bm!59169))

(assert (= (and b!1208540 c!118905) b!1208542))

(assert (= (and b!1208540 (not c!118905)) b!1208529))

(assert (= (and b!1208540 res!803314) b!1208531))

(assert (= (and b!1208540 (not res!803325)) b!1208527))

(assert (= (and b!1208527 (not res!803313)) b!1208539))

(assert (= (and b!1208539 res!803324) b!1208546))

(assert (= (and b!1208523 condMapEmpty!47893) mapIsEmpty!47893))

(assert (= (and b!1208523 (not condMapEmpty!47893)) mapNonEmpty!47893))

(get-info :version)

(assert (= (and mapNonEmpty!47893 ((_ is ValueCellFull!14633) mapValue!47893)) b!1208535))

(assert (= (and b!1208523 ((_ is ValueCellFull!14633) mapDefault!47893)) b!1208547))

(assert (= start!100940 b!1208523))

(declare-fun b_lambda!21517 () Bool)

(assert (=> (not b_lambda!21517) (not b!1208550)))

(declare-fun t!39571 () Bool)

(declare-fun tb!10773 () Bool)

(assert (=> (and start!100940 (= defaultEntry!1004 defaultEntry!1004) t!39571) tb!10773))

(declare-fun result!22145 () Bool)

(assert (=> tb!10773 (= result!22145 tp_is_empty!30685)))

(assert (=> b!1208550 t!39571))

(declare-fun b_and!43001 () Bool)

(assert (= b_and!42999 (and (=> t!39571 result!22145) b_and!43001)))

(declare-fun m!1113837 () Bool)

(assert (=> b!1208542 m!1113837))

(declare-fun m!1113839 () Bool)

(assert (=> b!1208540 m!1113839))

(declare-fun m!1113841 () Bool)

(assert (=> b!1208540 m!1113841))

(declare-fun m!1113843 () Bool)

(assert (=> b!1208540 m!1113843))

(declare-fun m!1113845 () Bool)

(assert (=> mapNonEmpty!47893 m!1113845))

(declare-fun m!1113847 () Bool)

(assert (=> bm!59168 m!1113847))

(declare-fun m!1113849 () Bool)

(assert (=> bm!59169 m!1113849))

(declare-fun m!1113851 () Bool)

(assert (=> bm!59172 m!1113851))

(declare-fun m!1113853 () Bool)

(assert (=> b!1208550 m!1113853))

(declare-fun m!1113855 () Bool)

(assert (=> b!1208550 m!1113855))

(declare-fun m!1113857 () Bool)

(assert (=> b!1208550 m!1113857))

(declare-fun m!1113859 () Bool)

(assert (=> b!1208550 m!1113859))

(declare-fun m!1113861 () Bool)

(assert (=> b!1208527 m!1113861))

(declare-fun m!1113863 () Bool)

(assert (=> b!1208524 m!1113863))

(declare-fun m!1113865 () Bool)

(assert (=> b!1208524 m!1113865))

(declare-fun m!1113867 () Bool)

(assert (=> b!1208537 m!1113867))

(declare-fun m!1113869 () Bool)

(assert (=> bm!59165 m!1113869))

(declare-fun m!1113871 () Bool)

(assert (=> b!1208526 m!1113871))

(declare-fun m!1113873 () Bool)

(assert (=> b!1208549 m!1113873))

(declare-fun m!1113875 () Bool)

(assert (=> b!1208539 m!1113875))

(assert (=> b!1208531 m!1113837))

(declare-fun m!1113877 () Bool)

(assert (=> b!1208541 m!1113877))

(declare-fun m!1113879 () Bool)

(assert (=> b!1208530 m!1113879))

(declare-fun m!1113881 () Bool)

(assert (=> b!1208530 m!1113881))

(assert (=> bm!59170 m!1113881))

(declare-fun m!1113883 () Bool)

(assert (=> b!1208553 m!1113883))

(declare-fun m!1113885 () Bool)

(assert (=> b!1208534 m!1113885))

(declare-fun m!1113887 () Bool)

(assert (=> b!1208534 m!1113887))

(declare-fun m!1113889 () Bool)

(assert (=> b!1208545 m!1113889))

(declare-fun m!1113891 () Bool)

(assert (=> start!100940 m!1113891))

(declare-fun m!1113893 () Bool)

(assert (=> start!100940 m!1113893))

(declare-fun m!1113895 () Bool)

(assert (=> b!1208546 m!1113895))

(declare-fun m!1113897 () Bool)

(assert (=> b!1208543 m!1113897))

(declare-fun m!1113899 () Bool)

(assert (=> b!1208544 m!1113899))

(declare-fun m!1113901 () Bool)

(assert (=> b!1208544 m!1113901))

(assert (=> b!1208544 m!1113901))

(declare-fun m!1113903 () Bool)

(assert (=> b!1208544 m!1113903))

(declare-fun m!1113905 () Bool)

(assert (=> b!1208528 m!1113905))

(declare-fun m!1113907 () Bool)

(assert (=> b!1208528 m!1113907))

(check-sat (not b!1208530) (not b!1208539) (not b!1208526) (not bm!59169) (not b!1208528) (not b!1208545) (not b!1208553) tp_is_empty!30685 (not b!1208542) (not bm!59170) (not start!100940) (not b!1208544) (not mapNonEmpty!47893) (not bm!59165) (not bm!59168) (not b!1208546) (not b_lambda!21517) (not b_next!25981) (not b!1208527) (not b!1208537) (not b!1208549) (not b!1208534) (not b!1208541) b_and!43001 (not bm!59172) (not b!1208524) (not b!1208540) (not b!1208550) (not b!1208531))
(check-sat b_and!43001 (not b_next!25981))
(get-model)

(declare-fun b_lambda!21523 () Bool)

(assert (= b_lambda!21517 (or (and start!100940 b_free!25981) b_lambda!21523)))

(check-sat (not b!1208530) (not b_next!25981) (not b!1208539) (not b!1208526) (not bm!59169) (not b!1208528) (not b!1208545) (not b!1208553) tp_is_empty!30685 (not bm!59170) (not start!100940) (not b!1208544) (not mapNonEmpty!47893) (not bm!59165) (not bm!59168) (not b!1208546) (not b!1208527) (not b!1208537) (not b!1208549) (not b!1208534) (not b!1208541) b_and!43001 (not bm!59172) (not b!1208524) (not b!1208540) (not b!1208542) (not b_lambda!21523) (not b!1208550) (not b!1208531))
(check-sat b_and!43001 (not b_next!25981))
(get-model)

(declare-fun d!133127 () Bool)

(declare-fun e!686482 () Bool)

(assert (=> d!133127 e!686482))

(declare-fun res!803438 () Bool)

(assert (=> d!133127 (=> res!803438 e!686482)))

(declare-fun lt!548479 () Bool)

(assert (=> d!133127 (= res!803438 (not lt!548479))))

(declare-fun lt!548480 () Bool)

(assert (=> d!133127 (= lt!548479 lt!548480)))

(declare-fun lt!548478 () Unit!39902)

(declare-fun e!686481 () Unit!39902)

(assert (=> d!133127 (= lt!548478 e!686481)))

(declare-fun c!118939 () Bool)

(assert (=> d!133127 (= c!118939 lt!548480)))

(declare-fun containsKey!594 (List!26620 (_ BitVec 64)) Bool)

(assert (=> d!133127 (= lt!548480 (containsKey!594 (toList!8920 lt!548361) k0!934))))

(assert (=> d!133127 (= (contains!6922 lt!548361 k0!934) lt!548479)))

(declare-fun b!1208752 () Bool)

(declare-fun lt!548477 () Unit!39902)

(assert (=> b!1208752 (= e!686481 lt!548477)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!423 (List!26620 (_ BitVec 64)) Unit!39902)

(assert (=> b!1208752 (= lt!548477 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8920 lt!548361) k0!934))))

(declare-datatypes ((Option!691 0))(
  ( (Some!690 (v!18051 V!46041)) (None!689) )
))
(declare-fun isDefined!466 (Option!691) Bool)

(declare-fun getValueByKey!640 (List!26620 (_ BitVec 64)) Option!691)

(assert (=> b!1208752 (isDefined!466 (getValueByKey!640 (toList!8920 lt!548361) k0!934))))

(declare-fun b!1208753 () Bool)

(declare-fun Unit!39908 () Unit!39902)

(assert (=> b!1208753 (= e!686481 Unit!39908)))

(declare-fun b!1208754 () Bool)

(assert (=> b!1208754 (= e!686482 (isDefined!466 (getValueByKey!640 (toList!8920 lt!548361) k0!934)))))

(assert (= (and d!133127 c!118939) b!1208752))

(assert (= (and d!133127 (not c!118939)) b!1208753))

(assert (= (and d!133127 (not res!803438)) b!1208754))

(declare-fun m!1114053 () Bool)

(assert (=> d!133127 m!1114053))

(declare-fun m!1114055 () Bool)

(assert (=> b!1208752 m!1114055))

(declare-fun m!1114057 () Bool)

(assert (=> b!1208752 m!1114057))

(assert (=> b!1208752 m!1114057))

(declare-fun m!1114059 () Bool)

(assert (=> b!1208752 m!1114059))

(assert (=> b!1208754 m!1114057))

(assert (=> b!1208754 m!1114057))

(assert (=> b!1208754 m!1114059))

(assert (=> b!1208530 d!133127))

(declare-fun e!686500 () Bool)

(declare-fun lt!548496 () ListLongMap!17809)

(declare-fun b!1208779 () Bool)

(assert (=> b!1208779 (= e!686500 (= lt!548496 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208780 () Bool)

(declare-fun isEmpty!996 (ListLongMap!17809) Bool)

(assert (=> b!1208780 (= e!686500 (isEmpty!996 lt!548496))))

(declare-fun b!1208781 () Bool)

(declare-fun e!686498 () Bool)

(assert (=> b!1208781 (= e!686498 e!686500)))

(declare-fun c!118951 () Bool)

(assert (=> b!1208781 (= c!118951 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 _keys!1208)))))

(declare-fun b!1208782 () Bool)

(declare-fun res!803450 () Bool)

(declare-fun e!686499 () Bool)

(assert (=> b!1208782 (=> (not res!803450) (not e!686499))))

(assert (=> b!1208782 (= res!803450 (not (contains!6922 lt!548496 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208783 () Bool)

(declare-fun e!686503 () Bool)

(assert (=> b!1208783 (= e!686498 e!686503)))

(assert (=> b!1208783 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 _keys!1208)))))

(declare-fun res!803448 () Bool)

(assert (=> b!1208783 (= res!803448 (contains!6922 lt!548496 (select (arr!37673 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208783 (=> (not res!803448) (not e!686503))))

(declare-fun b!1208784 () Bool)

(assert (=> b!1208784 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 _keys!1208)))))

(assert (=> b!1208784 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38210 _values!996)))))

(declare-fun apply!960 (ListLongMap!17809 (_ BitVec 64)) V!46041)

(declare-fun get!19218 (ValueCell!14633 V!46041) V!46041)

(assert (=> b!1208784 (= e!686503 (= (apply!960 lt!548496 (select (arr!37673 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19218 (select (arr!37672 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208785 () Bool)

(assert (=> b!1208785 (= e!686499 e!686498)))

(declare-fun c!118950 () Bool)

(declare-fun e!686502 () Bool)

(assert (=> b!1208785 (= c!118950 e!686502)))

(declare-fun res!803449 () Bool)

(assert (=> b!1208785 (=> (not res!803449) (not e!686502))))

(assert (=> b!1208785 (= res!803449 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 _keys!1208)))))

(declare-fun b!1208786 () Bool)

(declare-fun e!686497 () ListLongMap!17809)

(assert (=> b!1208786 (= e!686497 (ListLongMap!17810 Nil!26617))))

(declare-fun bm!59223 () Bool)

(declare-fun call!59226 () ListLongMap!17809)

(assert (=> bm!59223 (= call!59226 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208787 () Bool)

(declare-fun e!686501 () ListLongMap!17809)

(assert (=> b!1208787 (= e!686497 e!686501)))

(declare-fun c!118948 () Bool)

(assert (=> b!1208787 (= c!118948 (validKeyInArray!0 (select (arr!37673 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1208789 () Bool)

(assert (=> b!1208789 (= e!686502 (validKeyInArray!0 (select (arr!37673 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208789 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208790 () Bool)

(assert (=> b!1208790 (= e!686501 call!59226)))

(declare-fun b!1208788 () Bool)

(declare-fun lt!548499 () Unit!39902)

(declare-fun lt!548497 () Unit!39902)

(assert (=> b!1208788 (= lt!548499 lt!548497)))

(declare-fun lt!548495 () V!46041)

(declare-fun lt!548498 () ListLongMap!17809)

(declare-fun lt!548500 () (_ BitVec 64))

(declare-fun lt!548501 () (_ BitVec 64))

(assert (=> b!1208788 (not (contains!6922 (+!4047 lt!548498 (tuple2!19841 lt!548501 lt!548495)) lt!548500))))

(declare-fun addStillNotContains!296 (ListLongMap!17809 (_ BitVec 64) V!46041 (_ BitVec 64)) Unit!39902)

(assert (=> b!1208788 (= lt!548497 (addStillNotContains!296 lt!548498 lt!548501 lt!548495 lt!548500))))

(assert (=> b!1208788 (= lt!548500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208788 (= lt!548495 (get!19218 (select (arr!37672 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208788 (= lt!548501 (select (arr!37673 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208788 (= lt!548498 call!59226)))

(assert (=> b!1208788 (= e!686501 (+!4047 call!59226 (tuple2!19841 (select (arr!37673 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19218 (select (arr!37672 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133129 () Bool)

(assert (=> d!133129 e!686499))

(declare-fun res!803447 () Bool)

(assert (=> d!133129 (=> (not res!803447) (not e!686499))))

(assert (=> d!133129 (= res!803447 (not (contains!6922 lt!548496 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133129 (= lt!548496 e!686497)))

(declare-fun c!118949 () Bool)

(assert (=> d!133129 (= c!118949 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 _keys!1208)))))

(assert (=> d!133129 (validMask!0 mask!1564)))

(assert (=> d!133129 (= (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548496)))

(assert (= (and d!133129 c!118949) b!1208786))

(assert (= (and d!133129 (not c!118949)) b!1208787))

(assert (= (and b!1208787 c!118948) b!1208788))

(assert (= (and b!1208787 (not c!118948)) b!1208790))

(assert (= (or b!1208788 b!1208790) bm!59223))

(assert (= (and d!133129 res!803447) b!1208782))

(assert (= (and b!1208782 res!803450) b!1208785))

(assert (= (and b!1208785 res!803449) b!1208789))

(assert (= (and b!1208785 c!118950) b!1208783))

(assert (= (and b!1208785 (not c!118950)) b!1208781))

(assert (= (and b!1208783 res!803448) b!1208784))

(assert (= (and b!1208781 c!118951) b!1208779))

(assert (= (and b!1208781 (not c!118951)) b!1208780))

(declare-fun b_lambda!21525 () Bool)

(assert (=> (not b_lambda!21525) (not b!1208784)))

(assert (=> b!1208784 t!39571))

(declare-fun b_and!43011 () Bool)

(assert (= b_and!43001 (and (=> t!39571 result!22145) b_and!43011)))

(declare-fun b_lambda!21527 () Bool)

(assert (=> (not b_lambda!21527) (not b!1208788)))

(assert (=> b!1208788 t!39571))

(declare-fun b_and!43013 () Bool)

(assert (= b_and!43011 (and (=> t!39571 result!22145) b_and!43013)))

(declare-fun m!1114061 () Bool)

(assert (=> b!1208787 m!1114061))

(assert (=> b!1208787 m!1114061))

(declare-fun m!1114063 () Bool)

(assert (=> b!1208787 m!1114063))

(declare-fun m!1114065 () Bool)

(assert (=> bm!59223 m!1114065))

(assert (=> b!1208783 m!1114061))

(assert (=> b!1208783 m!1114061))

(declare-fun m!1114067 () Bool)

(assert (=> b!1208783 m!1114067))

(declare-fun m!1114069 () Bool)

(assert (=> b!1208780 m!1114069))

(declare-fun m!1114071 () Bool)

(assert (=> b!1208782 m!1114071))

(declare-fun m!1114073 () Bool)

(assert (=> b!1208788 m!1114073))

(assert (=> b!1208788 m!1113855))

(declare-fun m!1114075 () Bool)

(assert (=> b!1208788 m!1114075))

(declare-fun m!1114077 () Bool)

(assert (=> b!1208788 m!1114077))

(declare-fun m!1114079 () Bool)

(assert (=> b!1208788 m!1114079))

(declare-fun m!1114081 () Bool)

(assert (=> b!1208788 m!1114081))

(assert (=> b!1208788 m!1114077))

(assert (=> b!1208788 m!1114061))

(assert (=> b!1208788 m!1114075))

(assert (=> b!1208788 m!1113855))

(declare-fun m!1114083 () Bool)

(assert (=> b!1208788 m!1114083))

(assert (=> b!1208784 m!1113855))

(assert (=> b!1208784 m!1114075))

(assert (=> b!1208784 m!1114061))

(declare-fun m!1114085 () Bool)

(assert (=> b!1208784 m!1114085))

(assert (=> b!1208784 m!1114061))

(assert (=> b!1208784 m!1114075))

(assert (=> b!1208784 m!1113855))

(assert (=> b!1208784 m!1114083))

(assert (=> b!1208789 m!1114061))

(assert (=> b!1208789 m!1114061))

(assert (=> b!1208789 m!1114063))

(assert (=> b!1208779 m!1114065))

(declare-fun m!1114087 () Bool)

(assert (=> d!133129 m!1114087))

(assert (=> d!133129 m!1113871))

(assert (=> b!1208530 d!133129))

(declare-fun d!133131 () Bool)

(declare-fun res!803455 () Bool)

(declare-fun e!686508 () Bool)

(assert (=> d!133131 (=> res!803455 e!686508)))

(assert (=> d!133131 (= res!803455 (= (select (arr!37673 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133131 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!686508)))

(declare-fun b!1208795 () Bool)

(declare-fun e!686509 () Bool)

(assert (=> b!1208795 (= e!686508 e!686509)))

(declare-fun res!803456 () Bool)

(assert (=> b!1208795 (=> (not res!803456) (not e!686509))))

(assert (=> b!1208795 (= res!803456 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38211 _keys!1208)))))

(declare-fun b!1208796 () Bool)

(assert (=> b!1208796 (= e!686509 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133131 (not res!803455)) b!1208795))

(assert (= (and b!1208795 res!803456) b!1208796))

(assert (=> d!133131 m!1114061))

(declare-fun m!1114089 () Bool)

(assert (=> b!1208796 m!1114089))

(assert (=> b!1208531 d!133131))

(declare-fun d!133133 () Bool)

(declare-fun res!803461 () Bool)

(declare-fun e!686514 () Bool)

(assert (=> d!133133 (=> res!803461 e!686514)))

(assert (=> d!133133 (= res!803461 ((_ is Nil!26618) Nil!26618))))

(assert (=> d!133133 (= (noDuplicate!1639 Nil!26618) e!686514)))

(declare-fun b!1208801 () Bool)

(declare-fun e!686515 () Bool)

(assert (=> b!1208801 (= e!686514 e!686515)))

(declare-fun res!803462 () Bool)

(assert (=> b!1208801 (=> (not res!803462) (not e!686515))))

(assert (=> b!1208801 (= res!803462 (not (contains!6923 (t!39573 Nil!26618) (h!27826 Nil!26618))))))

(declare-fun b!1208802 () Bool)

(assert (=> b!1208802 (= e!686515 (noDuplicate!1639 (t!39573 Nil!26618)))))

(assert (= (and d!133133 (not res!803461)) b!1208801))

(assert (= (and b!1208801 res!803462) b!1208802))

(declare-fun m!1114091 () Bool)

(assert (=> b!1208801 m!1114091))

(declare-fun m!1114093 () Bool)

(assert (=> b!1208802 m!1114093))

(assert (=> b!1208527 d!133133))

(declare-fun d!133135 () Bool)

(declare-fun res!803463 () Bool)

(declare-fun e!686516 () Bool)

(assert (=> d!133135 (=> res!803463 e!686516)))

(assert (=> d!133135 (= res!803463 (= (select (arr!37673 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133135 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!686516)))

(declare-fun b!1208803 () Bool)

(declare-fun e!686517 () Bool)

(assert (=> b!1208803 (= e!686516 e!686517)))

(declare-fun res!803464 () Bool)

(assert (=> b!1208803 (=> (not res!803464) (not e!686517))))

(assert (=> b!1208803 (= res!803464 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38211 _keys!1208)))))

(declare-fun b!1208804 () Bool)

(assert (=> b!1208804 (= e!686517 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133135 (not res!803463)) b!1208803))

(assert (= (and b!1208803 res!803464) b!1208804))

(declare-fun m!1114095 () Bool)

(assert (=> d!133135 m!1114095))

(declare-fun m!1114097 () Bool)

(assert (=> b!1208804 m!1114097))

(assert (=> b!1208528 d!133135))

(declare-fun d!133137 () Bool)

(assert (=> d!133137 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548504 () Unit!39902)

(declare-fun choose!13 (array!78070 (_ BitVec 64) (_ BitVec 32)) Unit!39902)

(assert (=> d!133137 (= lt!548504 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133137 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133137 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!548504)))

(declare-fun bs!34137 () Bool)

(assert (= bs!34137 d!133137))

(assert (=> bs!34137 m!1113905))

(declare-fun m!1114099 () Bool)

(assert (=> bs!34137 m!1114099))

(assert (=> b!1208528 d!133137))

(declare-fun bm!59226 () Bool)

(declare-fun call!59229 () Bool)

(declare-fun c!118954 () Bool)

(assert (=> bm!59226 (= call!59229 (arrayNoDuplicates!0 lt!548359 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118954 (Cons!26617 (select (arr!37673 lt!548359) #b00000000000000000000000000000000) Nil!26618) Nil!26618)))))

(declare-fun b!1208815 () Bool)

(declare-fun e!686527 () Bool)

(declare-fun e!686526 () Bool)

(assert (=> b!1208815 (= e!686527 e!686526)))

(declare-fun res!803471 () Bool)

(assert (=> b!1208815 (=> (not res!803471) (not e!686526))))

(declare-fun e!686528 () Bool)

(assert (=> b!1208815 (= res!803471 (not e!686528))))

(declare-fun res!803472 () Bool)

(assert (=> b!1208815 (=> (not res!803472) (not e!686528))))

(assert (=> b!1208815 (= res!803472 (validKeyInArray!0 (select (arr!37673 lt!548359) #b00000000000000000000000000000000)))))

(declare-fun b!1208816 () Bool)

(declare-fun e!686529 () Bool)

(assert (=> b!1208816 (= e!686529 call!59229)))

(declare-fun b!1208817 () Bool)

(assert (=> b!1208817 (= e!686526 e!686529)))

(assert (=> b!1208817 (= c!118954 (validKeyInArray!0 (select (arr!37673 lt!548359) #b00000000000000000000000000000000)))))

(declare-fun b!1208818 () Bool)

(assert (=> b!1208818 (= e!686528 (contains!6923 Nil!26618 (select (arr!37673 lt!548359) #b00000000000000000000000000000000)))))

(declare-fun d!133139 () Bool)

(declare-fun res!803473 () Bool)

(assert (=> d!133139 (=> res!803473 e!686527)))

(assert (=> d!133139 (= res!803473 (bvsge #b00000000000000000000000000000000 (size!38211 lt!548359)))))

(assert (=> d!133139 (= (arrayNoDuplicates!0 lt!548359 #b00000000000000000000000000000000 Nil!26618) e!686527)))

(declare-fun b!1208819 () Bool)

(assert (=> b!1208819 (= e!686529 call!59229)))

(assert (= (and d!133139 (not res!803473)) b!1208815))

(assert (= (and b!1208815 res!803472) b!1208818))

(assert (= (and b!1208815 res!803471) b!1208817))

(assert (= (and b!1208817 c!118954) b!1208819))

(assert (= (and b!1208817 (not c!118954)) b!1208816))

(assert (= (or b!1208819 b!1208816) bm!59226))

(declare-fun m!1114101 () Bool)

(assert (=> bm!59226 m!1114101))

(declare-fun m!1114103 () Bool)

(assert (=> bm!59226 m!1114103))

(assert (=> b!1208815 m!1114101))

(assert (=> b!1208815 m!1114101))

(declare-fun m!1114105 () Bool)

(assert (=> b!1208815 m!1114105))

(assert (=> b!1208817 m!1114101))

(assert (=> b!1208817 m!1114101))

(assert (=> b!1208817 m!1114105))

(assert (=> b!1208818 m!1114101))

(assert (=> b!1208818 m!1114101))

(declare-fun m!1114107 () Bool)

(assert (=> b!1208818 m!1114107))

(assert (=> b!1208545 d!133139))

(declare-fun d!133141 () Bool)

(declare-fun lt!548507 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!544 (List!26621) (InoxSet (_ BitVec 64)))

(assert (=> d!133141 (= lt!548507 (select (content!544 Nil!26618) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!686535 () Bool)

(assert (=> d!133141 (= lt!548507 e!686535)))

(declare-fun res!803478 () Bool)

(assert (=> d!133141 (=> (not res!803478) (not e!686535))))

(assert (=> d!133141 (= res!803478 ((_ is Cons!26617) Nil!26618))))

(assert (=> d!133141 (= (contains!6923 Nil!26618 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548507)))

(declare-fun b!1208824 () Bool)

(declare-fun e!686534 () Bool)

(assert (=> b!1208824 (= e!686535 e!686534)))

(declare-fun res!803479 () Bool)

(assert (=> b!1208824 (=> res!803479 e!686534)))

(assert (=> b!1208824 (= res!803479 (= (h!27826 Nil!26618) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1208825 () Bool)

(assert (=> b!1208825 (= e!686534 (contains!6923 (t!39573 Nil!26618) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133141 res!803478) b!1208824))

(assert (= (and b!1208824 (not res!803479)) b!1208825))

(declare-fun m!1114109 () Bool)

(assert (=> d!133141 m!1114109))

(declare-fun m!1114111 () Bool)

(assert (=> d!133141 m!1114111))

(declare-fun m!1114113 () Bool)

(assert (=> b!1208825 m!1114113))

(assert (=> b!1208546 d!133141))

(declare-fun d!133143 () Bool)

(assert (=> d!133143 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1208526 d!133143))

(declare-fun d!133145 () Bool)

(declare-fun e!686538 () Bool)

(assert (=> d!133145 e!686538))

(declare-fun res!803485 () Bool)

(assert (=> d!133145 (=> (not res!803485) (not e!686538))))

(declare-fun lt!548519 () ListLongMap!17809)

(assert (=> d!133145 (= res!803485 (contains!6922 lt!548519 (_1!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!548516 () List!26620)

(assert (=> d!133145 (= lt!548519 (ListLongMap!17810 lt!548516))))

(declare-fun lt!548518 () Unit!39902)

(declare-fun lt!548517 () Unit!39902)

(assert (=> d!133145 (= lt!548518 lt!548517)))

(assert (=> d!133145 (= (getValueByKey!640 lt!548516 (_1!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!690 (_2!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!316 (List!26620 (_ BitVec 64) V!46041) Unit!39902)

(assert (=> d!133145 (= lt!548517 (lemmaContainsTupThenGetReturnValue!316 lt!548516 (_1!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!409 (List!26620 (_ BitVec 64) V!46041) List!26620)

(assert (=> d!133145 (= lt!548516 (insertStrictlySorted!409 (toList!8920 lt!548361) (_1!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133145 (= (+!4047 lt!548361 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548519)))

(declare-fun b!1208830 () Bool)

(declare-fun res!803484 () Bool)

(assert (=> b!1208830 (=> (not res!803484) (not e!686538))))

(assert (=> b!1208830 (= res!803484 (= (getValueByKey!640 (toList!8920 lt!548519) (_1!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!690 (_2!9931 (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1208831 () Bool)

(declare-fun contains!6926 (List!26620 tuple2!19840) Bool)

(assert (=> b!1208831 (= e!686538 (contains!6926 (toList!8920 lt!548519) (ite (or c!118904 c!118903) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133145 res!803485) b!1208830))

(assert (= (and b!1208830 res!803484) b!1208831))

(declare-fun m!1114115 () Bool)

(assert (=> d!133145 m!1114115))

(declare-fun m!1114117 () Bool)

(assert (=> d!133145 m!1114117))

(declare-fun m!1114119 () Bool)

(assert (=> d!133145 m!1114119))

(declare-fun m!1114121 () Bool)

(assert (=> d!133145 m!1114121))

(declare-fun m!1114123 () Bool)

(assert (=> b!1208830 m!1114123))

(declare-fun m!1114125 () Bool)

(assert (=> b!1208831 m!1114125))

(assert (=> bm!59169 d!133145))

(declare-fun d!133147 () Bool)

(assert (=> d!133147 (contains!6922 (+!4047 lt!548361 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!548522 () Unit!39902)

(declare-fun choose!1818 (ListLongMap!17809 (_ BitVec 64) V!46041 (_ BitVec 64)) Unit!39902)

(assert (=> d!133147 (= lt!548522 (choose!1818 lt!548361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133147 (contains!6922 lt!548361 k0!934)))

(assert (=> d!133147 (= (addStillContains!1031 lt!548361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!548522)))

(declare-fun bs!34138 () Bool)

(assert (= bs!34138 d!133147))

(declare-fun m!1114127 () Bool)

(assert (=> bs!34138 m!1114127))

(assert (=> bs!34138 m!1114127))

(declare-fun m!1114129 () Bool)

(assert (=> bs!34138 m!1114129))

(declare-fun m!1114131 () Bool)

(assert (=> bs!34138 m!1114131))

(assert (=> bs!34138 m!1113879))

(assert (=> b!1208544 d!133147))

(declare-fun d!133149 () Bool)

(declare-fun e!686540 () Bool)

(assert (=> d!133149 e!686540))

(declare-fun res!803486 () Bool)

(assert (=> d!133149 (=> res!803486 e!686540)))

(declare-fun lt!548525 () Bool)

(assert (=> d!133149 (= res!803486 (not lt!548525))))

(declare-fun lt!548526 () Bool)

(assert (=> d!133149 (= lt!548525 lt!548526)))

(declare-fun lt!548524 () Unit!39902)

(declare-fun e!686539 () Unit!39902)

(assert (=> d!133149 (= lt!548524 e!686539)))

(declare-fun c!118955 () Bool)

(assert (=> d!133149 (= c!118955 lt!548526)))

(assert (=> d!133149 (= lt!548526 (containsKey!594 (toList!8920 (+!4047 lt!548371 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133149 (= (contains!6922 (+!4047 lt!548371 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!548525)))

(declare-fun b!1208833 () Bool)

(declare-fun lt!548523 () Unit!39902)

(assert (=> b!1208833 (= e!686539 lt!548523)))

(assert (=> b!1208833 (= lt!548523 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8920 (+!4047 lt!548371 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1208833 (isDefined!466 (getValueByKey!640 (toList!8920 (+!4047 lt!548371 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1208834 () Bool)

(declare-fun Unit!39909 () Unit!39902)

(assert (=> b!1208834 (= e!686539 Unit!39909)))

(declare-fun b!1208835 () Bool)

(assert (=> b!1208835 (= e!686540 (isDefined!466 (getValueByKey!640 (toList!8920 (+!4047 lt!548371 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133149 c!118955) b!1208833))

(assert (= (and d!133149 (not c!118955)) b!1208834))

(assert (= (and d!133149 (not res!803486)) b!1208835))

(declare-fun m!1114133 () Bool)

(assert (=> d!133149 m!1114133))

(declare-fun m!1114135 () Bool)

(assert (=> b!1208833 m!1114135))

(declare-fun m!1114137 () Bool)

(assert (=> b!1208833 m!1114137))

(assert (=> b!1208833 m!1114137))

(declare-fun m!1114139 () Bool)

(assert (=> b!1208833 m!1114139))

(assert (=> b!1208835 m!1114137))

(assert (=> b!1208835 m!1114137))

(assert (=> b!1208835 m!1114139))

(assert (=> b!1208544 d!133149))

(declare-fun d!133151 () Bool)

(declare-fun e!686541 () Bool)

(assert (=> d!133151 e!686541))

(declare-fun res!803488 () Bool)

(assert (=> d!133151 (=> (not res!803488) (not e!686541))))

(declare-fun lt!548530 () ListLongMap!17809)

(assert (=> d!133151 (= res!803488 (contains!6922 lt!548530 (_1!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548527 () List!26620)

(assert (=> d!133151 (= lt!548530 (ListLongMap!17810 lt!548527))))

(declare-fun lt!548529 () Unit!39902)

(declare-fun lt!548528 () Unit!39902)

(assert (=> d!133151 (= lt!548529 lt!548528)))

(assert (=> d!133151 (= (getValueByKey!640 lt!548527 (_1!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!690 (_2!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133151 (= lt!548528 (lemmaContainsTupThenGetReturnValue!316 lt!548527 (_1!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133151 (= lt!548527 (insertStrictlySorted!409 (toList!8920 lt!548371) (_1!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133151 (= (+!4047 lt!548371 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!548530)))

(declare-fun b!1208836 () Bool)

(declare-fun res!803487 () Bool)

(assert (=> b!1208836 (=> (not res!803487) (not e!686541))))

(assert (=> b!1208836 (= res!803487 (= (getValueByKey!640 (toList!8920 lt!548530) (_1!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!690 (_2!9931 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208837 () Bool)

(assert (=> b!1208837 (= e!686541 (contains!6926 (toList!8920 lt!548530) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133151 res!803488) b!1208836))

(assert (= (and b!1208836 res!803487) b!1208837))

(declare-fun m!1114141 () Bool)

(assert (=> d!133151 m!1114141))

(declare-fun m!1114143 () Bool)

(assert (=> d!133151 m!1114143))

(declare-fun m!1114145 () Bool)

(assert (=> d!133151 m!1114145))

(declare-fun m!1114147 () Bool)

(assert (=> d!133151 m!1114147))

(declare-fun m!1114149 () Bool)

(assert (=> b!1208836 m!1114149))

(declare-fun m!1114151 () Bool)

(assert (=> b!1208837 m!1114151))

(assert (=> b!1208544 d!133151))

(declare-fun d!133153 () Bool)

(declare-fun res!803494 () Bool)

(declare-fun e!686548 () Bool)

(assert (=> d!133153 (=> res!803494 e!686548)))

(assert (=> d!133153 (= res!803494 (bvsge #b00000000000000000000000000000000 (size!38211 lt!548359)))))

(assert (=> d!133153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548359 mask!1564) e!686548)))

(declare-fun b!1208846 () Bool)

(declare-fun e!686550 () Bool)

(declare-fun call!59232 () Bool)

(assert (=> b!1208846 (= e!686550 call!59232)))

(declare-fun b!1208847 () Bool)

(assert (=> b!1208847 (= e!686548 e!686550)))

(declare-fun c!118958 () Bool)

(assert (=> b!1208847 (= c!118958 (validKeyInArray!0 (select (arr!37673 lt!548359) #b00000000000000000000000000000000)))))

(declare-fun bm!59229 () Bool)

(assert (=> bm!59229 (= call!59232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!548359 mask!1564))))

(declare-fun b!1208848 () Bool)

(declare-fun e!686549 () Bool)

(assert (=> b!1208848 (= e!686550 e!686549)))

(declare-fun lt!548539 () (_ BitVec 64))

(assert (=> b!1208848 (= lt!548539 (select (arr!37673 lt!548359) #b00000000000000000000000000000000))))

(declare-fun lt!548538 () Unit!39902)

(assert (=> b!1208848 (= lt!548538 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548359 lt!548539 #b00000000000000000000000000000000))))

(assert (=> b!1208848 (arrayContainsKey!0 lt!548359 lt!548539 #b00000000000000000000000000000000)))

(declare-fun lt!548537 () Unit!39902)

(assert (=> b!1208848 (= lt!548537 lt!548538)))

(declare-fun res!803493 () Bool)

(declare-datatypes ((SeekEntryResult!9939 0))(
  ( (MissingZero!9939 (index!42127 (_ BitVec 32))) (Found!9939 (index!42128 (_ BitVec 32))) (Intermediate!9939 (undefined!10751 Bool) (index!42129 (_ BitVec 32)) (x!106646 (_ BitVec 32))) (Undefined!9939) (MissingVacant!9939 (index!42130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78070 (_ BitVec 32)) SeekEntryResult!9939)

(assert (=> b!1208848 (= res!803493 (= (seekEntryOrOpen!0 (select (arr!37673 lt!548359) #b00000000000000000000000000000000) lt!548359 mask!1564) (Found!9939 #b00000000000000000000000000000000)))))

(assert (=> b!1208848 (=> (not res!803493) (not e!686549))))

(declare-fun b!1208849 () Bool)

(assert (=> b!1208849 (= e!686549 call!59232)))

(assert (= (and d!133153 (not res!803494)) b!1208847))

(assert (= (and b!1208847 c!118958) b!1208848))

(assert (= (and b!1208847 (not c!118958)) b!1208846))

(assert (= (and b!1208848 res!803493) b!1208849))

(assert (= (or b!1208849 b!1208846) bm!59229))

(assert (=> b!1208847 m!1114101))

(assert (=> b!1208847 m!1114101))

(assert (=> b!1208847 m!1114105))

(declare-fun m!1114153 () Bool)

(assert (=> bm!59229 m!1114153))

(assert (=> b!1208848 m!1114101))

(declare-fun m!1114155 () Bool)

(assert (=> b!1208848 m!1114155))

(declare-fun m!1114157 () Bool)

(assert (=> b!1208848 m!1114157))

(assert (=> b!1208848 m!1114101))

(declare-fun m!1114159 () Bool)

(assert (=> b!1208848 m!1114159))

(assert (=> b!1208524 d!133153))

(declare-fun d!133155 () Bool)

(declare-fun e!686552 () Bool)

(assert (=> d!133155 e!686552))

(declare-fun res!803495 () Bool)

(assert (=> d!133155 (=> res!803495 e!686552)))

(declare-fun lt!548542 () Bool)

(assert (=> d!133155 (= res!803495 (not lt!548542))))

(declare-fun lt!548543 () Bool)

(assert (=> d!133155 (= lt!548542 lt!548543)))

(declare-fun lt!548541 () Unit!39902)

(declare-fun e!686551 () Unit!39902)

(assert (=> d!133155 (= lt!548541 e!686551)))

(declare-fun c!118959 () Bool)

(assert (=> d!133155 (= c!118959 lt!548543)))

(assert (=> d!133155 (= lt!548543 (containsKey!594 (toList!8920 (ite c!118904 lt!548371 call!59169)) k0!934))))

(assert (=> d!133155 (= (contains!6922 (ite c!118904 lt!548371 call!59169) k0!934) lt!548542)))

(declare-fun b!1208850 () Bool)

(declare-fun lt!548540 () Unit!39902)

(assert (=> b!1208850 (= e!686551 lt!548540)))

(assert (=> b!1208850 (= lt!548540 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8920 (ite c!118904 lt!548371 call!59169)) k0!934))))

(assert (=> b!1208850 (isDefined!466 (getValueByKey!640 (toList!8920 (ite c!118904 lt!548371 call!59169)) k0!934))))

(declare-fun b!1208851 () Bool)

(declare-fun Unit!39910 () Unit!39902)

(assert (=> b!1208851 (= e!686551 Unit!39910)))

(declare-fun b!1208852 () Bool)

(assert (=> b!1208852 (= e!686552 (isDefined!466 (getValueByKey!640 (toList!8920 (ite c!118904 lt!548371 call!59169)) k0!934)))))

(assert (= (and d!133155 c!118959) b!1208850))

(assert (= (and d!133155 (not c!118959)) b!1208851))

(assert (= (and d!133155 (not res!803495)) b!1208852))

(declare-fun m!1114161 () Bool)

(assert (=> d!133155 m!1114161))

(declare-fun m!1114163 () Bool)

(assert (=> b!1208850 m!1114163))

(declare-fun m!1114165 () Bool)

(assert (=> b!1208850 m!1114165))

(assert (=> b!1208850 m!1114165))

(declare-fun m!1114167 () Bool)

(assert (=> b!1208850 m!1114167))

(assert (=> b!1208852 m!1114165))

(assert (=> b!1208852 m!1114165))

(assert (=> b!1208852 m!1114167))

(assert (=> bm!59168 d!133155))

(declare-fun d!133157 () Bool)

(declare-fun lt!548546 () ListLongMap!17809)

(assert (=> d!133157 (not (contains!6922 lt!548546 k0!934))))

(declare-fun removeStrictlySorted!100 (List!26620 (_ BitVec 64)) List!26620)

(assert (=> d!133157 (= lt!548546 (ListLongMap!17810 (removeStrictlySorted!100 (toList!8920 call!59171) k0!934)))))

(assert (=> d!133157 (= (-!1804 call!59171 k0!934) lt!548546)))

(declare-fun bs!34139 () Bool)

(assert (= bs!34139 d!133157))

(declare-fun m!1114169 () Bool)

(assert (=> bs!34139 m!1114169))

(declare-fun m!1114171 () Bool)

(assert (=> bs!34139 m!1114171))

(assert (=> b!1208541 d!133157))

(assert (=> b!1208542 d!133131))

(declare-fun d!133159 () Bool)

(assert (=> d!133159 (contains!6922 (+!4047 (ite c!118904 lt!548371 lt!548361) (tuple2!19841 (ite c!118904 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118903 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118904 minValue!944 (ite c!118903 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!548547 () Unit!39902)

(assert (=> d!133159 (= lt!548547 (choose!1818 (ite c!118904 lt!548371 lt!548361) (ite c!118904 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118903 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118904 minValue!944 (ite c!118903 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133159 (contains!6922 (ite c!118904 lt!548371 lt!548361) k0!934)))

(assert (=> d!133159 (= (addStillContains!1031 (ite c!118904 lt!548371 lt!548361) (ite c!118904 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118903 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118904 minValue!944 (ite c!118903 zeroValue!944 minValue!944)) k0!934) lt!548547)))

(declare-fun bs!34140 () Bool)

(assert (= bs!34140 d!133159))

(declare-fun m!1114173 () Bool)

(assert (=> bs!34140 m!1114173))

(assert (=> bs!34140 m!1114173))

(declare-fun m!1114175 () Bool)

(assert (=> bs!34140 m!1114175))

(declare-fun m!1114177 () Bool)

(assert (=> bs!34140 m!1114177))

(declare-fun m!1114179 () Bool)

(assert (=> bs!34140 m!1114179))

(assert (=> bm!59165 d!133159))

(declare-fun e!686556 () Bool)

(declare-fun lt!548549 () ListLongMap!17809)

(declare-fun b!1208853 () Bool)

(assert (=> b!1208853 (= e!686556 (= lt!548549 (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208854 () Bool)

(assert (=> b!1208854 (= e!686556 (isEmpty!996 lt!548549))))

(declare-fun b!1208855 () Bool)

(declare-fun e!686554 () Bool)

(assert (=> b!1208855 (= e!686554 e!686556)))

(declare-fun c!118963 () Bool)

(assert (=> b!1208855 (= c!118963 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 lt!548359)))))

(declare-fun b!1208856 () Bool)

(declare-fun res!803499 () Bool)

(declare-fun e!686555 () Bool)

(assert (=> b!1208856 (=> (not res!803499) (not e!686555))))

(assert (=> b!1208856 (= res!803499 (not (contains!6922 lt!548549 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208857 () Bool)

(declare-fun e!686559 () Bool)

(assert (=> b!1208857 (= e!686554 e!686559)))

(assert (=> b!1208857 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 lt!548359)))))

(declare-fun res!803497 () Bool)

(assert (=> b!1208857 (= res!803497 (contains!6922 lt!548549 (select (arr!37673 lt!548359) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208857 (=> (not res!803497) (not e!686559))))

(declare-fun b!1208858 () Bool)

(assert (=> b!1208858 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 lt!548359)))))

(assert (=> b!1208858 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38210 lt!548372)))))

(assert (=> b!1208858 (= e!686559 (= (apply!960 lt!548549 (select (arr!37673 lt!548359) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19218 (select (arr!37672 lt!548372) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208859 () Bool)

(assert (=> b!1208859 (= e!686555 e!686554)))

(declare-fun c!118962 () Bool)

(declare-fun e!686558 () Bool)

(assert (=> b!1208859 (= c!118962 e!686558)))

(declare-fun res!803498 () Bool)

(assert (=> b!1208859 (=> (not res!803498) (not e!686558))))

(assert (=> b!1208859 (= res!803498 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 lt!548359)))))

(declare-fun b!1208860 () Bool)

(declare-fun e!686553 () ListLongMap!17809)

(assert (=> b!1208860 (= e!686553 (ListLongMap!17810 Nil!26617))))

(declare-fun call!59233 () ListLongMap!17809)

(declare-fun bm!59230 () Bool)

(assert (=> bm!59230 (= call!59233 (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208861 () Bool)

(declare-fun e!686557 () ListLongMap!17809)

(assert (=> b!1208861 (= e!686553 e!686557)))

(declare-fun c!118960 () Bool)

(assert (=> b!1208861 (= c!118960 (validKeyInArray!0 (select (arr!37673 lt!548359) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1208863 () Bool)

(assert (=> b!1208863 (= e!686558 (validKeyInArray!0 (select (arr!37673 lt!548359) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208863 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208864 () Bool)

(assert (=> b!1208864 (= e!686557 call!59233)))

(declare-fun b!1208862 () Bool)

(declare-fun lt!548552 () Unit!39902)

(declare-fun lt!548550 () Unit!39902)

(assert (=> b!1208862 (= lt!548552 lt!548550)))

(declare-fun lt!548548 () V!46041)

(declare-fun lt!548554 () (_ BitVec 64))

(declare-fun lt!548553 () (_ BitVec 64))

(declare-fun lt!548551 () ListLongMap!17809)

(assert (=> b!1208862 (not (contains!6922 (+!4047 lt!548551 (tuple2!19841 lt!548554 lt!548548)) lt!548553))))

(assert (=> b!1208862 (= lt!548550 (addStillNotContains!296 lt!548551 lt!548554 lt!548548 lt!548553))))

(assert (=> b!1208862 (= lt!548553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208862 (= lt!548548 (get!19218 (select (arr!37672 lt!548372) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208862 (= lt!548554 (select (arr!37673 lt!548359) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208862 (= lt!548551 call!59233)))

(assert (=> b!1208862 (= e!686557 (+!4047 call!59233 (tuple2!19841 (select (arr!37673 lt!548359) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19218 (select (arr!37672 lt!548372) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133161 () Bool)

(assert (=> d!133161 e!686555))

(declare-fun res!803496 () Bool)

(assert (=> d!133161 (=> (not res!803496) (not e!686555))))

(assert (=> d!133161 (= res!803496 (not (contains!6922 lt!548549 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133161 (= lt!548549 e!686553)))

(declare-fun c!118961 () Bool)

(assert (=> d!133161 (= c!118961 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 lt!548359)))))

(assert (=> d!133161 (validMask!0 mask!1564)))

(assert (=> d!133161 (= (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548549)))

(assert (= (and d!133161 c!118961) b!1208860))

(assert (= (and d!133161 (not c!118961)) b!1208861))

(assert (= (and b!1208861 c!118960) b!1208862))

(assert (= (and b!1208861 (not c!118960)) b!1208864))

(assert (= (or b!1208862 b!1208864) bm!59230))

(assert (= (and d!133161 res!803496) b!1208856))

(assert (= (and b!1208856 res!803499) b!1208859))

(assert (= (and b!1208859 res!803498) b!1208863))

(assert (= (and b!1208859 c!118962) b!1208857))

(assert (= (and b!1208859 (not c!118962)) b!1208855))

(assert (= (and b!1208857 res!803497) b!1208858))

(assert (= (and b!1208855 c!118963) b!1208853))

(assert (= (and b!1208855 (not c!118963)) b!1208854))

(declare-fun b_lambda!21529 () Bool)

(assert (=> (not b_lambda!21529) (not b!1208858)))

(assert (=> b!1208858 t!39571))

(declare-fun b_and!43015 () Bool)

(assert (= b_and!43013 (and (=> t!39571 result!22145) b_and!43015)))

(declare-fun b_lambda!21531 () Bool)

(assert (=> (not b_lambda!21531) (not b!1208862)))

(assert (=> b!1208862 t!39571))

(declare-fun b_and!43017 () Bool)

(assert (= b_and!43015 (and (=> t!39571 result!22145) b_and!43017)))

(declare-fun m!1114181 () Bool)

(assert (=> b!1208861 m!1114181))

(assert (=> b!1208861 m!1114181))

(declare-fun m!1114183 () Bool)

(assert (=> b!1208861 m!1114183))

(declare-fun m!1114185 () Bool)

(assert (=> bm!59230 m!1114185))

(assert (=> b!1208857 m!1114181))

(assert (=> b!1208857 m!1114181))

(declare-fun m!1114187 () Bool)

(assert (=> b!1208857 m!1114187))

(declare-fun m!1114189 () Bool)

(assert (=> b!1208854 m!1114189))

(declare-fun m!1114191 () Bool)

(assert (=> b!1208856 m!1114191))

(declare-fun m!1114193 () Bool)

(assert (=> b!1208862 m!1114193))

(assert (=> b!1208862 m!1113855))

(declare-fun m!1114195 () Bool)

(assert (=> b!1208862 m!1114195))

(declare-fun m!1114197 () Bool)

(assert (=> b!1208862 m!1114197))

(declare-fun m!1114199 () Bool)

(assert (=> b!1208862 m!1114199))

(declare-fun m!1114201 () Bool)

(assert (=> b!1208862 m!1114201))

(assert (=> b!1208862 m!1114197))

(assert (=> b!1208862 m!1114181))

(assert (=> b!1208862 m!1114195))

(assert (=> b!1208862 m!1113855))

(declare-fun m!1114203 () Bool)

(assert (=> b!1208862 m!1114203))

(assert (=> b!1208858 m!1113855))

(assert (=> b!1208858 m!1114195))

(assert (=> b!1208858 m!1114181))

(declare-fun m!1114205 () Bool)

(assert (=> b!1208858 m!1114205))

(assert (=> b!1208858 m!1114181))

(assert (=> b!1208858 m!1114195))

(assert (=> b!1208858 m!1113855))

(assert (=> b!1208858 m!1114203))

(assert (=> b!1208863 m!1114181))

(assert (=> b!1208863 m!1114181))

(assert (=> b!1208863 m!1114183))

(assert (=> b!1208853 m!1114185))

(declare-fun m!1114207 () Bool)

(assert (=> d!133161 m!1114207))

(assert (=> d!133161 m!1113871))

(assert (=> bm!59172 d!133161))

(declare-fun d!133163 () Bool)

(declare-fun lt!548555 () Bool)

(assert (=> d!133163 (= lt!548555 (select (content!544 Nil!26618) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!686561 () Bool)

(assert (=> d!133163 (= lt!548555 e!686561)))

(declare-fun res!803500 () Bool)

(assert (=> d!133163 (=> (not res!803500) (not e!686561))))

(assert (=> d!133163 (= res!803500 ((_ is Cons!26617) Nil!26618))))

(assert (=> d!133163 (= (contains!6923 Nil!26618 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548555)))

(declare-fun b!1208865 () Bool)

(declare-fun e!686560 () Bool)

(assert (=> b!1208865 (= e!686561 e!686560)))

(declare-fun res!803501 () Bool)

(assert (=> b!1208865 (=> res!803501 e!686560)))

(assert (=> b!1208865 (= res!803501 (= (h!27826 Nil!26618) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1208866 () Bool)

(assert (=> b!1208866 (= e!686560 (contains!6923 (t!39573 Nil!26618) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133163 res!803500) b!1208865))

(assert (= (and b!1208865 (not res!803501)) b!1208866))

(assert (=> d!133163 m!1114109))

(declare-fun m!1114209 () Bool)

(assert (=> d!133163 m!1114209))

(declare-fun m!1114211 () Bool)

(assert (=> b!1208866 m!1114211))

(assert (=> b!1208539 d!133163))

(declare-fun bm!59231 () Bool)

(declare-fun call!59234 () Bool)

(declare-fun c!118964 () Bool)

(assert (=> bm!59231 (= call!59234 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118964 (Cons!26617 (select (arr!37673 _keys!1208) from!1455) Nil!26618) Nil!26618)))))

(declare-fun b!1208867 () Bool)

(declare-fun e!686563 () Bool)

(declare-fun e!686562 () Bool)

(assert (=> b!1208867 (= e!686563 e!686562)))

(declare-fun res!803502 () Bool)

(assert (=> b!1208867 (=> (not res!803502) (not e!686562))))

(declare-fun e!686564 () Bool)

(assert (=> b!1208867 (= res!803502 (not e!686564))))

(declare-fun res!803503 () Bool)

(assert (=> b!1208867 (=> (not res!803503) (not e!686564))))

(assert (=> b!1208867 (= res!803503 (validKeyInArray!0 (select (arr!37673 _keys!1208) from!1455)))))

(declare-fun b!1208868 () Bool)

(declare-fun e!686565 () Bool)

(assert (=> b!1208868 (= e!686565 call!59234)))

(declare-fun b!1208869 () Bool)

(assert (=> b!1208869 (= e!686562 e!686565)))

(assert (=> b!1208869 (= c!118964 (validKeyInArray!0 (select (arr!37673 _keys!1208) from!1455)))))

(declare-fun b!1208870 () Bool)

(assert (=> b!1208870 (= e!686564 (contains!6923 Nil!26618 (select (arr!37673 _keys!1208) from!1455)))))

(declare-fun d!133165 () Bool)

(declare-fun res!803504 () Bool)

(assert (=> d!133165 (=> res!803504 e!686563)))

(assert (=> d!133165 (= res!803504 (bvsge from!1455 (size!38211 _keys!1208)))))

(assert (=> d!133165 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26618) e!686563)))

(declare-fun b!1208871 () Bool)

(assert (=> b!1208871 (= e!686565 call!59234)))

(assert (= (and d!133165 (not res!803504)) b!1208867))

(assert (= (and b!1208867 res!803503) b!1208870))

(assert (= (and b!1208867 res!803502) b!1208869))

(assert (= (and b!1208869 c!118964) b!1208871))

(assert (= (and b!1208869 (not c!118964)) b!1208868))

(assert (= (or b!1208871 b!1208868) bm!59231))

(assert (=> bm!59231 m!1113885))

(declare-fun m!1114213 () Bool)

(assert (=> bm!59231 m!1114213))

(assert (=> b!1208867 m!1113885))

(assert (=> b!1208867 m!1113885))

(declare-fun m!1114215 () Bool)

(assert (=> b!1208867 m!1114215))

(assert (=> b!1208869 m!1113885))

(assert (=> b!1208869 m!1113885))

(assert (=> b!1208869 m!1114215))

(assert (=> b!1208870 m!1113885))

(assert (=> b!1208870 m!1113885))

(declare-fun m!1114217 () Bool)

(assert (=> b!1208870 m!1114217))

(assert (=> b!1208540 d!133165))

(declare-fun d!133167 () Bool)

(assert (=> d!133167 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26618)))

(declare-fun lt!548558 () Unit!39902)

(declare-fun choose!39 (array!78070 (_ BitVec 32) (_ BitVec 32)) Unit!39902)

(assert (=> d!133167 (= lt!548558 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133167 (bvslt (size!38211 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133167 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!548558)))

(declare-fun bs!34141 () Bool)

(assert (= bs!34141 d!133167))

(assert (=> bs!34141 m!1113839))

(declare-fun m!1114219 () Bool)

(assert (=> bs!34141 m!1114219))

(assert (=> b!1208540 d!133167))

(declare-fun d!133169 () Bool)

(declare-fun e!686568 () Bool)

(assert (=> d!133169 e!686568))

(declare-fun c!118967 () Bool)

(assert (=> d!133169 (= c!118967 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548561 () Unit!39902)

(declare-fun choose!1819 (array!78070 array!78068 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 64) (_ BitVec 32) Int) Unit!39902)

(assert (=> d!133169 (= lt!548561 (choose!1819 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133169 (validMask!0 mask!1564)))

(assert (=> d!133169 (= (lemmaListMapContainsThenArrayContainsFrom!576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548561)))

(declare-fun b!1208876 () Bool)

(assert (=> b!1208876 (= e!686568 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208877 () Bool)

(assert (=> b!1208877 (= e!686568 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133169 c!118967) b!1208876))

(assert (= (and d!133169 (not c!118967)) b!1208877))

(declare-fun m!1114221 () Bool)

(assert (=> d!133169 m!1114221))

(assert (=> d!133169 m!1113871))

(assert (=> b!1208876 m!1113837))

(assert (=> b!1208540 d!133169))

(declare-fun d!133171 () Bool)

(assert (=> d!133171 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208553 d!133171))

(declare-fun d!133173 () Bool)

(assert (=> d!133173 (= (array_inv!28806 _keys!1208) (bvsge (size!38211 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100940 d!133173))

(declare-fun d!133175 () Bool)

(assert (=> d!133175 (= (array_inv!28807 _values!996) (bvsge (size!38210 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100940 d!133175))

(declare-fun bm!59232 () Bool)

(declare-fun call!59235 () Bool)

(declare-fun c!118968 () Bool)

(assert (=> bm!59232 (= call!59235 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118968 (Cons!26617 (select (arr!37673 _keys!1208) #b00000000000000000000000000000000) Nil!26618) Nil!26618)))))

(declare-fun b!1208878 () Bool)

(declare-fun e!686570 () Bool)

(declare-fun e!686569 () Bool)

(assert (=> b!1208878 (= e!686570 e!686569)))

(declare-fun res!803505 () Bool)

(assert (=> b!1208878 (=> (not res!803505) (not e!686569))))

(declare-fun e!686571 () Bool)

(assert (=> b!1208878 (= res!803505 (not e!686571))))

(declare-fun res!803506 () Bool)

(assert (=> b!1208878 (=> (not res!803506) (not e!686571))))

(assert (=> b!1208878 (= res!803506 (validKeyInArray!0 (select (arr!37673 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208879 () Bool)

(declare-fun e!686572 () Bool)

(assert (=> b!1208879 (= e!686572 call!59235)))

(declare-fun b!1208880 () Bool)

(assert (=> b!1208880 (= e!686569 e!686572)))

(assert (=> b!1208880 (= c!118968 (validKeyInArray!0 (select (arr!37673 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208881 () Bool)

(assert (=> b!1208881 (= e!686571 (contains!6923 Nil!26618 (select (arr!37673 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133177 () Bool)

(declare-fun res!803507 () Bool)

(assert (=> d!133177 (=> res!803507 e!686570)))

(assert (=> d!133177 (= res!803507 (bvsge #b00000000000000000000000000000000 (size!38211 _keys!1208)))))

(assert (=> d!133177 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26618) e!686570)))

(declare-fun b!1208882 () Bool)

(assert (=> b!1208882 (= e!686572 call!59235)))

(assert (= (and d!133177 (not res!803507)) b!1208878))

(assert (= (and b!1208878 res!803506) b!1208881))

(assert (= (and b!1208878 res!803505) b!1208880))

(assert (= (and b!1208880 c!118968) b!1208882))

(assert (= (and b!1208880 (not c!118968)) b!1208879))

(assert (= (or b!1208882 b!1208879) bm!59232))

(assert (=> bm!59232 m!1114095))

(declare-fun m!1114223 () Bool)

(assert (=> bm!59232 m!1114223))

(assert (=> b!1208878 m!1114095))

(assert (=> b!1208878 m!1114095))

(declare-fun m!1114225 () Bool)

(assert (=> b!1208878 m!1114225))

(assert (=> b!1208880 m!1114095))

(assert (=> b!1208880 m!1114095))

(assert (=> b!1208880 m!1114225))

(assert (=> b!1208881 m!1114095))

(assert (=> b!1208881 m!1114095))

(declare-fun m!1114227 () Bool)

(assert (=> b!1208881 m!1114227))

(assert (=> b!1208537 d!133177))

(declare-fun d!133179 () Bool)

(declare-fun res!803509 () Bool)

(declare-fun e!686573 () Bool)

(assert (=> d!133179 (=> res!803509 e!686573)))

(assert (=> d!133179 (= res!803509 (bvsge #b00000000000000000000000000000000 (size!38211 _keys!1208)))))

(assert (=> d!133179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!686573)))

(declare-fun b!1208883 () Bool)

(declare-fun e!686575 () Bool)

(declare-fun call!59236 () Bool)

(assert (=> b!1208883 (= e!686575 call!59236)))

(declare-fun b!1208884 () Bool)

(assert (=> b!1208884 (= e!686573 e!686575)))

(declare-fun c!118969 () Bool)

(assert (=> b!1208884 (= c!118969 (validKeyInArray!0 (select (arr!37673 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!59233 () Bool)

(assert (=> bm!59233 (= call!59236 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1208885 () Bool)

(declare-fun e!686574 () Bool)

(assert (=> b!1208885 (= e!686575 e!686574)))

(declare-fun lt!548564 () (_ BitVec 64))

(assert (=> b!1208885 (= lt!548564 (select (arr!37673 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!548563 () Unit!39902)

(assert (=> b!1208885 (= lt!548563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548564 #b00000000000000000000000000000000))))

(assert (=> b!1208885 (arrayContainsKey!0 _keys!1208 lt!548564 #b00000000000000000000000000000000)))

(declare-fun lt!548562 () Unit!39902)

(assert (=> b!1208885 (= lt!548562 lt!548563)))

(declare-fun res!803508 () Bool)

(assert (=> b!1208885 (= res!803508 (= (seekEntryOrOpen!0 (select (arr!37673 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9939 #b00000000000000000000000000000000)))))

(assert (=> b!1208885 (=> (not res!803508) (not e!686574))))

(declare-fun b!1208886 () Bool)

(assert (=> b!1208886 (= e!686574 call!59236)))

(assert (= (and d!133179 (not res!803509)) b!1208884))

(assert (= (and b!1208884 c!118969) b!1208885))

(assert (= (and b!1208884 (not c!118969)) b!1208883))

(assert (= (and b!1208885 res!803508) b!1208886))

(assert (= (or b!1208886 b!1208883) bm!59233))

(assert (=> b!1208884 m!1114095))

(assert (=> b!1208884 m!1114095))

(assert (=> b!1208884 m!1114225))

(declare-fun m!1114229 () Bool)

(assert (=> bm!59233 m!1114229))

(assert (=> b!1208885 m!1114095))

(declare-fun m!1114231 () Bool)

(assert (=> b!1208885 m!1114231))

(declare-fun m!1114233 () Bool)

(assert (=> b!1208885 m!1114233))

(assert (=> b!1208885 m!1114095))

(declare-fun m!1114235 () Bool)

(assert (=> b!1208885 m!1114235))

(assert (=> b!1208549 d!133179))

(declare-fun bm!59238 () Bool)

(declare-fun call!59241 () ListLongMap!17809)

(assert (=> bm!59238 (= call!59241 (getCurrentListMapNoExtraKeys!5363 (array!78071 (store (arr!37673 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38211 _keys!1208)) (array!78069 (store (arr!37672 _values!996) i!673 (ValueCellFull!14633 (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38210 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208893 () Bool)

(declare-fun e!686581 () Bool)

(declare-fun call!59242 () ListLongMap!17809)

(assert (=> b!1208893 (= e!686581 (= call!59241 call!59242))))

(assert (=> b!1208893 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38210 _values!996)))))

(declare-fun b!1208894 () Bool)

(assert (=> b!1208894 (= e!686581 (= call!59241 (-!1804 call!59242 k0!934)))))

(assert (=> b!1208894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38210 _values!996)))))

(declare-fun b!1208895 () Bool)

(declare-fun e!686580 () Bool)

(assert (=> b!1208895 (= e!686580 e!686581)))

(declare-fun c!118972 () Bool)

(assert (=> b!1208895 (= c!118972 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133181 () Bool)

(assert (=> d!133181 e!686580))

(declare-fun res!803512 () Bool)

(assert (=> d!133181 (=> (not res!803512) (not e!686580))))

(assert (=> d!133181 (= res!803512 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38211 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38211 _keys!1208))))))))

(declare-fun lt!548567 () Unit!39902)

(declare-fun choose!1820 (array!78070 array!78068 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39902)

(assert (=> d!133181 (= lt!548567 (choose!1820 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133181 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38211 _keys!1208)))))

(assert (=> d!133181 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1046 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548567)))

(declare-fun bm!59239 () Bool)

(assert (=> bm!59239 (= call!59242 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133181 res!803512) b!1208895))

(assert (= (and b!1208895 c!118972) b!1208894))

(assert (= (and b!1208895 (not c!118972)) b!1208893))

(assert (= (or b!1208894 b!1208893) bm!59239))

(assert (= (or b!1208894 b!1208893) bm!59238))

(declare-fun b_lambda!21533 () Bool)

(assert (=> (not b_lambda!21533) (not bm!59238)))

(assert (=> bm!59238 t!39571))

(declare-fun b_and!43019 () Bool)

(assert (= b_and!43017 (and (=> t!39571 result!22145) b_and!43019)))

(assert (=> bm!59238 m!1113865))

(assert (=> bm!59238 m!1113855))

(assert (=> bm!59238 m!1113857))

(declare-fun m!1114237 () Bool)

(assert (=> bm!59238 m!1114237))

(declare-fun m!1114239 () Bool)

(assert (=> b!1208894 m!1114239))

(declare-fun m!1114241 () Bool)

(assert (=> d!133181 m!1114241))

(assert (=> bm!59239 m!1113881))

(assert (=> b!1208534 d!133181))

(assert (=> bm!59170 d!133129))

(declare-fun e!686585 () Bool)

(declare-fun b!1208896 () Bool)

(declare-fun lt!548569 () ListLongMap!17809)

(assert (=> b!1208896 (= e!686585 (= lt!548569 (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208897 () Bool)

(assert (=> b!1208897 (= e!686585 (isEmpty!996 lt!548569))))

(declare-fun b!1208898 () Bool)

(declare-fun e!686583 () Bool)

(assert (=> b!1208898 (= e!686583 e!686585)))

(declare-fun c!118976 () Bool)

(assert (=> b!1208898 (= c!118976 (bvslt from!1455 (size!38211 lt!548359)))))

(declare-fun b!1208899 () Bool)

(declare-fun res!803516 () Bool)

(declare-fun e!686584 () Bool)

(assert (=> b!1208899 (=> (not res!803516) (not e!686584))))

(assert (=> b!1208899 (= res!803516 (not (contains!6922 lt!548569 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208900 () Bool)

(declare-fun e!686588 () Bool)

(assert (=> b!1208900 (= e!686583 e!686588)))

(assert (=> b!1208900 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38211 lt!548359)))))

(declare-fun res!803514 () Bool)

(assert (=> b!1208900 (= res!803514 (contains!6922 lt!548569 (select (arr!37673 lt!548359) from!1455)))))

(assert (=> b!1208900 (=> (not res!803514) (not e!686588))))

(declare-fun b!1208901 () Bool)

(assert (=> b!1208901 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38211 lt!548359)))))

(assert (=> b!1208901 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38210 lt!548372)))))

(assert (=> b!1208901 (= e!686588 (= (apply!960 lt!548569 (select (arr!37673 lt!548359) from!1455)) (get!19218 (select (arr!37672 lt!548372) from!1455) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208902 () Bool)

(assert (=> b!1208902 (= e!686584 e!686583)))

(declare-fun c!118975 () Bool)

(declare-fun e!686587 () Bool)

(assert (=> b!1208902 (= c!118975 e!686587)))

(declare-fun res!803515 () Bool)

(assert (=> b!1208902 (=> (not res!803515) (not e!686587))))

(assert (=> b!1208902 (= res!803515 (bvslt from!1455 (size!38211 lt!548359)))))

(declare-fun b!1208903 () Bool)

(declare-fun e!686582 () ListLongMap!17809)

(assert (=> b!1208903 (= e!686582 (ListLongMap!17810 Nil!26617))))

(declare-fun bm!59240 () Bool)

(declare-fun call!59243 () ListLongMap!17809)

(assert (=> bm!59240 (= call!59243 (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208904 () Bool)

(declare-fun e!686586 () ListLongMap!17809)

(assert (=> b!1208904 (= e!686582 e!686586)))

(declare-fun c!118973 () Bool)

(assert (=> b!1208904 (= c!118973 (validKeyInArray!0 (select (arr!37673 lt!548359) from!1455)))))

(declare-fun b!1208906 () Bool)

(assert (=> b!1208906 (= e!686587 (validKeyInArray!0 (select (arr!37673 lt!548359) from!1455)))))

(assert (=> b!1208906 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208907 () Bool)

(assert (=> b!1208907 (= e!686586 call!59243)))

(declare-fun b!1208905 () Bool)

(declare-fun lt!548572 () Unit!39902)

(declare-fun lt!548570 () Unit!39902)

(assert (=> b!1208905 (= lt!548572 lt!548570)))

(declare-fun lt!548568 () V!46041)

(declare-fun lt!548574 () (_ BitVec 64))

(declare-fun lt!548573 () (_ BitVec 64))

(declare-fun lt!548571 () ListLongMap!17809)

(assert (=> b!1208905 (not (contains!6922 (+!4047 lt!548571 (tuple2!19841 lt!548574 lt!548568)) lt!548573))))

(assert (=> b!1208905 (= lt!548570 (addStillNotContains!296 lt!548571 lt!548574 lt!548568 lt!548573))))

(assert (=> b!1208905 (= lt!548573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208905 (= lt!548568 (get!19218 (select (arr!37672 lt!548372) from!1455) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208905 (= lt!548574 (select (arr!37673 lt!548359) from!1455))))

(assert (=> b!1208905 (= lt!548571 call!59243)))

(assert (=> b!1208905 (= e!686586 (+!4047 call!59243 (tuple2!19841 (select (arr!37673 lt!548359) from!1455) (get!19218 (select (arr!37672 lt!548372) from!1455) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133183 () Bool)

(assert (=> d!133183 e!686584))

(declare-fun res!803513 () Bool)

(assert (=> d!133183 (=> (not res!803513) (not e!686584))))

(assert (=> d!133183 (= res!803513 (not (contains!6922 lt!548569 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133183 (= lt!548569 e!686582)))

(declare-fun c!118974 () Bool)

(assert (=> d!133183 (= c!118974 (bvsge from!1455 (size!38211 lt!548359)))))

(assert (=> d!133183 (validMask!0 mask!1564)))

(assert (=> d!133183 (= (getCurrentListMapNoExtraKeys!5363 lt!548359 lt!548372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548569)))

(assert (= (and d!133183 c!118974) b!1208903))

(assert (= (and d!133183 (not c!118974)) b!1208904))

(assert (= (and b!1208904 c!118973) b!1208905))

(assert (= (and b!1208904 (not c!118973)) b!1208907))

(assert (= (or b!1208905 b!1208907) bm!59240))

(assert (= (and d!133183 res!803513) b!1208899))

(assert (= (and b!1208899 res!803516) b!1208902))

(assert (= (and b!1208902 res!803515) b!1208906))

(assert (= (and b!1208902 c!118975) b!1208900))

(assert (= (and b!1208902 (not c!118975)) b!1208898))

(assert (= (and b!1208900 res!803514) b!1208901))

(assert (= (and b!1208898 c!118976) b!1208896))

(assert (= (and b!1208898 (not c!118976)) b!1208897))

(declare-fun b_lambda!21535 () Bool)

(assert (=> (not b_lambda!21535) (not b!1208901)))

(assert (=> b!1208901 t!39571))

(declare-fun b_and!43021 () Bool)

(assert (= b_and!43019 (and (=> t!39571 result!22145) b_and!43021)))

(declare-fun b_lambda!21537 () Bool)

(assert (=> (not b_lambda!21537) (not b!1208905)))

(assert (=> b!1208905 t!39571))

(declare-fun b_and!43023 () Bool)

(assert (= b_and!43021 (and (=> t!39571 result!22145) b_and!43023)))

(declare-fun m!1114243 () Bool)

(assert (=> b!1208904 m!1114243))

(assert (=> b!1208904 m!1114243))

(declare-fun m!1114245 () Bool)

(assert (=> b!1208904 m!1114245))

(declare-fun m!1114247 () Bool)

(assert (=> bm!59240 m!1114247))

(assert (=> b!1208900 m!1114243))

(assert (=> b!1208900 m!1114243))

(declare-fun m!1114249 () Bool)

(assert (=> b!1208900 m!1114249))

(declare-fun m!1114251 () Bool)

(assert (=> b!1208897 m!1114251))

(declare-fun m!1114253 () Bool)

(assert (=> b!1208899 m!1114253))

(declare-fun m!1114255 () Bool)

(assert (=> b!1208905 m!1114255))

(assert (=> b!1208905 m!1113855))

(declare-fun m!1114257 () Bool)

(assert (=> b!1208905 m!1114257))

(declare-fun m!1114259 () Bool)

(assert (=> b!1208905 m!1114259))

(declare-fun m!1114261 () Bool)

(assert (=> b!1208905 m!1114261))

(declare-fun m!1114263 () Bool)

(assert (=> b!1208905 m!1114263))

(assert (=> b!1208905 m!1114259))

(assert (=> b!1208905 m!1114243))

(assert (=> b!1208905 m!1114257))

(assert (=> b!1208905 m!1113855))

(declare-fun m!1114265 () Bool)

(assert (=> b!1208905 m!1114265))

(assert (=> b!1208901 m!1113855))

(assert (=> b!1208901 m!1114257))

(assert (=> b!1208901 m!1114243))

(declare-fun m!1114267 () Bool)

(assert (=> b!1208901 m!1114267))

(assert (=> b!1208901 m!1114243))

(assert (=> b!1208901 m!1114257))

(assert (=> b!1208901 m!1113855))

(assert (=> b!1208901 m!1114265))

(assert (=> b!1208906 m!1114243))

(assert (=> b!1208906 m!1114243))

(assert (=> b!1208906 m!1114245))

(assert (=> b!1208896 m!1114247))

(declare-fun m!1114269 () Bool)

(assert (=> d!133183 m!1114269))

(assert (=> d!133183 m!1113871))

(assert (=> b!1208550 d!133183))

(declare-fun e!686592 () Bool)

(declare-fun b!1208908 () Bool)

(declare-fun lt!548576 () ListLongMap!17809)

(assert (=> b!1208908 (= e!686592 (= lt!548576 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208909 () Bool)

(assert (=> b!1208909 (= e!686592 (isEmpty!996 lt!548576))))

(declare-fun b!1208910 () Bool)

(declare-fun e!686590 () Bool)

(assert (=> b!1208910 (= e!686590 e!686592)))

(declare-fun c!118980 () Bool)

(assert (=> b!1208910 (= c!118980 (bvslt from!1455 (size!38211 _keys!1208)))))

(declare-fun b!1208911 () Bool)

(declare-fun res!803520 () Bool)

(declare-fun e!686591 () Bool)

(assert (=> b!1208911 (=> (not res!803520) (not e!686591))))

(assert (=> b!1208911 (= res!803520 (not (contains!6922 lt!548576 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208912 () Bool)

(declare-fun e!686595 () Bool)

(assert (=> b!1208912 (= e!686590 e!686595)))

(assert (=> b!1208912 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38211 _keys!1208)))))

(declare-fun res!803518 () Bool)

(assert (=> b!1208912 (= res!803518 (contains!6922 lt!548576 (select (arr!37673 _keys!1208) from!1455)))))

(assert (=> b!1208912 (=> (not res!803518) (not e!686595))))

(declare-fun b!1208913 () Bool)

(assert (=> b!1208913 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38211 _keys!1208)))))

(assert (=> b!1208913 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38210 _values!996)))))

(assert (=> b!1208913 (= e!686595 (= (apply!960 lt!548576 (select (arr!37673 _keys!1208) from!1455)) (get!19218 (select (arr!37672 _values!996) from!1455) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208914 () Bool)

(assert (=> b!1208914 (= e!686591 e!686590)))

(declare-fun c!118979 () Bool)

(declare-fun e!686594 () Bool)

(assert (=> b!1208914 (= c!118979 e!686594)))

(declare-fun res!803519 () Bool)

(assert (=> b!1208914 (=> (not res!803519) (not e!686594))))

(assert (=> b!1208914 (= res!803519 (bvslt from!1455 (size!38211 _keys!1208)))))

(declare-fun b!1208915 () Bool)

(declare-fun e!686589 () ListLongMap!17809)

(assert (=> b!1208915 (= e!686589 (ListLongMap!17810 Nil!26617))))

(declare-fun call!59244 () ListLongMap!17809)

(declare-fun bm!59241 () Bool)

(assert (=> bm!59241 (= call!59244 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208916 () Bool)

(declare-fun e!686593 () ListLongMap!17809)

(assert (=> b!1208916 (= e!686589 e!686593)))

(declare-fun c!118977 () Bool)

(assert (=> b!1208916 (= c!118977 (validKeyInArray!0 (select (arr!37673 _keys!1208) from!1455)))))

(declare-fun b!1208918 () Bool)

(assert (=> b!1208918 (= e!686594 (validKeyInArray!0 (select (arr!37673 _keys!1208) from!1455)))))

(assert (=> b!1208918 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208919 () Bool)

(assert (=> b!1208919 (= e!686593 call!59244)))

(declare-fun b!1208917 () Bool)

(declare-fun lt!548579 () Unit!39902)

(declare-fun lt!548577 () Unit!39902)

(assert (=> b!1208917 (= lt!548579 lt!548577)))

(declare-fun lt!548581 () (_ BitVec 64))

(declare-fun lt!548575 () V!46041)

(declare-fun lt!548578 () ListLongMap!17809)

(declare-fun lt!548580 () (_ BitVec 64))

(assert (=> b!1208917 (not (contains!6922 (+!4047 lt!548578 (tuple2!19841 lt!548581 lt!548575)) lt!548580))))

(assert (=> b!1208917 (= lt!548577 (addStillNotContains!296 lt!548578 lt!548581 lt!548575 lt!548580))))

(assert (=> b!1208917 (= lt!548580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208917 (= lt!548575 (get!19218 (select (arr!37672 _values!996) from!1455) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208917 (= lt!548581 (select (arr!37673 _keys!1208) from!1455))))

(assert (=> b!1208917 (= lt!548578 call!59244)))

(assert (=> b!1208917 (= e!686593 (+!4047 call!59244 (tuple2!19841 (select (arr!37673 _keys!1208) from!1455) (get!19218 (select (arr!37672 _values!996) from!1455) (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133185 () Bool)

(assert (=> d!133185 e!686591))

(declare-fun res!803517 () Bool)

(assert (=> d!133185 (=> (not res!803517) (not e!686591))))

(assert (=> d!133185 (= res!803517 (not (contains!6922 lt!548576 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133185 (= lt!548576 e!686589)))

(declare-fun c!118978 () Bool)

(assert (=> d!133185 (= c!118978 (bvsge from!1455 (size!38211 _keys!1208)))))

(assert (=> d!133185 (validMask!0 mask!1564)))

(assert (=> d!133185 (= (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548576)))

(assert (= (and d!133185 c!118978) b!1208915))

(assert (= (and d!133185 (not c!118978)) b!1208916))

(assert (= (and b!1208916 c!118977) b!1208917))

(assert (= (and b!1208916 (not c!118977)) b!1208919))

(assert (= (or b!1208917 b!1208919) bm!59241))

(assert (= (and d!133185 res!803517) b!1208911))

(assert (= (and b!1208911 res!803520) b!1208914))

(assert (= (and b!1208914 res!803519) b!1208918))

(assert (= (and b!1208914 c!118979) b!1208912))

(assert (= (and b!1208914 (not c!118979)) b!1208910))

(assert (= (and b!1208912 res!803518) b!1208913))

(assert (= (and b!1208910 c!118980) b!1208908))

(assert (= (and b!1208910 (not c!118980)) b!1208909))

(declare-fun b_lambda!21539 () Bool)

(assert (=> (not b_lambda!21539) (not b!1208913)))

(assert (=> b!1208913 t!39571))

(declare-fun b_and!43025 () Bool)

(assert (= b_and!43023 (and (=> t!39571 result!22145) b_and!43025)))

(declare-fun b_lambda!21541 () Bool)

(assert (=> (not b_lambda!21541) (not b!1208917)))

(assert (=> b!1208917 t!39571))

(declare-fun b_and!43027 () Bool)

(assert (= b_and!43025 (and (=> t!39571 result!22145) b_and!43027)))

(assert (=> b!1208916 m!1113885))

(assert (=> b!1208916 m!1113885))

(assert (=> b!1208916 m!1114215))

(declare-fun m!1114271 () Bool)

(assert (=> bm!59241 m!1114271))

(assert (=> b!1208912 m!1113885))

(assert (=> b!1208912 m!1113885))

(declare-fun m!1114273 () Bool)

(assert (=> b!1208912 m!1114273))

(declare-fun m!1114275 () Bool)

(assert (=> b!1208909 m!1114275))

(declare-fun m!1114277 () Bool)

(assert (=> b!1208911 m!1114277))

(declare-fun m!1114279 () Bool)

(assert (=> b!1208917 m!1114279))

(assert (=> b!1208917 m!1113855))

(declare-fun m!1114281 () Bool)

(assert (=> b!1208917 m!1114281))

(declare-fun m!1114283 () Bool)

(assert (=> b!1208917 m!1114283))

(declare-fun m!1114285 () Bool)

(assert (=> b!1208917 m!1114285))

(declare-fun m!1114287 () Bool)

(assert (=> b!1208917 m!1114287))

(assert (=> b!1208917 m!1114283))

(assert (=> b!1208917 m!1113885))

(assert (=> b!1208917 m!1114281))

(assert (=> b!1208917 m!1113855))

(declare-fun m!1114289 () Bool)

(assert (=> b!1208917 m!1114289))

(assert (=> b!1208913 m!1113855))

(assert (=> b!1208913 m!1114281))

(assert (=> b!1208913 m!1113885))

(declare-fun m!1114291 () Bool)

(assert (=> b!1208913 m!1114291))

(assert (=> b!1208913 m!1113885))

(assert (=> b!1208913 m!1114281))

(assert (=> b!1208913 m!1113855))

(assert (=> b!1208913 m!1114289))

(assert (=> b!1208918 m!1113885))

(assert (=> b!1208918 m!1113885))

(assert (=> b!1208918 m!1114215))

(assert (=> b!1208908 m!1114271))

(declare-fun m!1114293 () Bool)

(assert (=> d!133185 m!1114293))

(assert (=> d!133185 m!1113871))

(assert (=> b!1208550 d!133185))

(declare-fun mapIsEmpty!47902 () Bool)

(declare-fun mapRes!47902 () Bool)

(assert (=> mapIsEmpty!47902 mapRes!47902))

(declare-fun b!1208927 () Bool)

(declare-fun e!686600 () Bool)

(assert (=> b!1208927 (= e!686600 tp_is_empty!30685)))

(declare-fun b!1208926 () Bool)

(declare-fun e!686601 () Bool)

(assert (=> b!1208926 (= e!686601 tp_is_empty!30685)))

(declare-fun condMapEmpty!47902 () Bool)

(declare-fun mapDefault!47902 () ValueCell!14633)

(assert (=> mapNonEmpty!47893 (= condMapEmpty!47902 (= mapRest!47893 ((as const (Array (_ BitVec 32) ValueCell!14633)) mapDefault!47902)))))

(assert (=> mapNonEmpty!47893 (= tp!90956 (and e!686600 mapRes!47902))))

(declare-fun mapNonEmpty!47902 () Bool)

(declare-fun tp!90971 () Bool)

(assert (=> mapNonEmpty!47902 (= mapRes!47902 (and tp!90971 e!686601))))

(declare-fun mapValue!47902 () ValueCell!14633)

(declare-fun mapKey!47902 () (_ BitVec 32))

(declare-fun mapRest!47902 () (Array (_ BitVec 32) ValueCell!14633))

(assert (=> mapNonEmpty!47902 (= mapRest!47893 (store mapRest!47902 mapKey!47902 mapValue!47902))))

(assert (= (and mapNonEmpty!47893 condMapEmpty!47902) mapIsEmpty!47902))

(assert (= (and mapNonEmpty!47893 (not condMapEmpty!47902)) mapNonEmpty!47902))

(assert (= (and mapNonEmpty!47902 ((_ is ValueCellFull!14633) mapValue!47902)) b!1208926))

(assert (= (and mapNonEmpty!47893 ((_ is ValueCellFull!14633) mapDefault!47902)) b!1208927))

(declare-fun m!1114295 () Bool)

(assert (=> mapNonEmpty!47902 m!1114295))

(declare-fun b_lambda!21543 () Bool)

(assert (= b_lambda!21537 (or (and start!100940 b_free!25981) b_lambda!21543)))

(declare-fun b_lambda!21545 () Bool)

(assert (= b_lambda!21541 (or (and start!100940 b_free!25981) b_lambda!21545)))

(declare-fun b_lambda!21547 () Bool)

(assert (= b_lambda!21529 (or (and start!100940 b_free!25981) b_lambda!21547)))

(declare-fun b_lambda!21549 () Bool)

(assert (= b_lambda!21525 (or (and start!100940 b_free!25981) b_lambda!21549)))

(declare-fun b_lambda!21551 () Bool)

(assert (= b_lambda!21531 (or (and start!100940 b_free!25981) b_lambda!21551)))

(declare-fun b_lambda!21553 () Bool)

(assert (= b_lambda!21539 (or (and start!100940 b_free!25981) b_lambda!21553)))

(declare-fun b_lambda!21555 () Bool)

(assert (= b_lambda!21527 (or (and start!100940 b_free!25981) b_lambda!21555)))

(declare-fun b_lambda!21557 () Bool)

(assert (= b_lambda!21535 (or (and start!100940 b_free!25981) b_lambda!21557)))

(declare-fun b_lambda!21559 () Bool)

(assert (= b_lambda!21533 (or (and start!100940 b_free!25981) b_lambda!21559)))

(check-sat (not b!1208909) (not b!1208861) (not b!1208833) (not b!1208825) (not b!1208912) (not b!1208789) b_and!43027 (not d!133129) (not b!1208884) (not b!1208856) (not b!1208900) (not b!1208899) (not d!133163) (not b!1208780) (not b_next!25981) (not b!1208836) (not b!1208869) (not b!1208916) (not b_lambda!21553) (not d!133183) (not d!133169) (not b!1208897) (not b_lambda!21549) (not b!1208901) (not b!1208854) (not b!1208894) (not b_lambda!21551) (not bm!59229) (not b!1208754) (not b!1208878) (not b!1208863) (not b_lambda!21555) (not mapNonEmpty!47902) (not b!1208801) (not b!1208881) (not d!133149) (not b!1208866) (not b!1208913) (not d!133157) (not b!1208876) (not bm!59232) (not b_lambda!21557) (not b!1208904) (not b!1208788) (not b!1208858) (not b!1208779) (not bm!59226) (not b!1208885) (not b!1208752) (not b!1208906) (not d!133145) (not b!1208905) (not b!1208802) (not bm!59241) (not bm!59238) (not b!1208908) (not b!1208783) (not b!1208857) (not d!133161) (not b_lambda!21559) (not b_lambda!21547) (not b!1208918) (not b!1208804) (not b!1208835) (not d!133185) (not b!1208847) (not d!133155) (not b!1208852) (not b!1208870) (not b!1208911) (not b!1208917) (not b!1208830) (not bm!59240) (not d!133141) (not d!133127) (not b_lambda!21545) (not bm!59231) (not b!1208815) (not bm!59223) (not b!1208818) (not d!133151) (not b!1208787) (not bm!59230) (not b!1208896) (not b!1208831) (not b!1208862) (not bm!59233) (not d!133159) (not b!1208837) (not b!1208782) (not bm!59239) (not b!1208850) (not b!1208796) tp_is_empty!30685 (not d!133181) (not d!133147) (not b!1208880) (not b!1208867) (not d!133137) (not b_lambda!21523) (not b!1208848) (not b!1208784) (not d!133167) (not b!1208853) (not b_lambda!21543) (not b!1208817))
(check-sat b_and!43027 (not b_next!25981))
