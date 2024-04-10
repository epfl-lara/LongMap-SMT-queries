; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100528 () Bool)

(assert start!100528)

(declare-fun b_free!25851 () Bool)

(declare-fun b_next!25851 () Bool)

(assert (=> start!100528 (= b_free!25851 (not b_next!25851))))

(declare-fun tp!90543 () Bool)

(declare-fun b_and!42589 () Bool)

(assert (=> start!100528 (= tp!90543 b_and!42589)))

(declare-fun b!1201368 () Bool)

(declare-fun res!799744 () Bool)

(declare-fun e!682226 () Bool)

(assert (=> b!1201368 (=> (not res!799744) (not e!682226))))

(declare-datatypes ((array!77883 0))(
  ( (array!77884 (arr!37586 (Array (_ BitVec 32) (_ BitVec 64))) (size!38122 (_ BitVec 32))) )
))
(declare-fun lt!544414 () array!77883)

(declare-datatypes ((List!26458 0))(
  ( (Nil!26455) (Cons!26454 (h!27663 (_ BitVec 64)) (t!39289 List!26458)) )
))
(declare-fun arrayNoDuplicates!0 (array!77883 (_ BitVec 32) List!26458) Bool)

(assert (=> b!1201368 (= res!799744 (arrayNoDuplicates!0 lt!544414 #b00000000000000000000000000000000 Nil!26455))))

(declare-datatypes ((V!45867 0))(
  ( (V!45868 (val!15334 Int)) )
))
(declare-fun zeroValue!944 () V!45867)

(declare-fun c!117503 () Bool)

(declare-datatypes ((tuple2!19640 0))(
  ( (tuple2!19641 (_1!9831 (_ BitVec 64)) (_2!9831 V!45867)) )
))
(declare-datatypes ((List!26459 0))(
  ( (Nil!26456) (Cons!26455 (h!27664 tuple2!19640) (t!39290 List!26459)) )
))
(declare-datatypes ((ListLongMap!17609 0))(
  ( (ListLongMap!17610 (toList!8820 List!26459)) )
))
(declare-fun lt!544413 () ListLongMap!17609)

(declare-datatypes ((Unit!39829 0))(
  ( (Unit!39830) )
))
(declare-fun call!57418 () Unit!39829)

(declare-fun lt!544421 () ListLongMap!17609)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!57409 () Bool)

(declare-fun minValue!944 () V!45867)

(declare-fun c!117505 () Bool)

(declare-fun addStillContains!979 (ListLongMap!17609 (_ BitVec 64) V!45867 (_ BitVec 64)) Unit!39829)

(assert (=> bm!57409 (= call!57418 (addStillContains!979 (ite c!117505 lt!544421 lt!544413) (ite c!117505 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117503 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117505 minValue!944 (ite c!117503 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1201369 () Bool)

(declare-fun c!117506 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!544415 () Bool)

(assert (=> b!1201369 (= c!117506 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544415))))

(declare-fun e!682220 () Unit!39829)

(declare-fun e!682227 () Unit!39829)

(assert (=> b!1201369 (= e!682220 e!682227)))

(declare-fun b!1201370 () Bool)

(declare-fun res!799736 () Bool)

(declare-fun e!682228 () Bool)

(assert (=> b!1201370 (=> (not res!799736) (not e!682228))))

(declare-fun _keys!1208 () array!77883)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77883 (_ BitVec 32)) Bool)

(assert (=> b!1201370 (= res!799736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201371 () Bool)

(declare-fun res!799738 () Bool)

(assert (=> b!1201371 (=> (not res!799738) (not e!682228))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201371 (= res!799738 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38122 _keys!1208))))))

(declare-fun call!57412 () Bool)

(declare-fun bm!57410 () Bool)

(declare-fun call!57419 () ListLongMap!17609)

(declare-fun contains!6878 (ListLongMap!17609 (_ BitVec 64)) Bool)

(assert (=> bm!57410 (= call!57412 (contains!6878 (ite c!117505 lt!544421 call!57419) k0!934))))

(declare-fun b!1201372 () Bool)

(declare-fun e!682223 () Bool)

(declare-fun e!682229 () Bool)

(assert (=> b!1201372 (= e!682223 e!682229)))

(declare-fun res!799737 () Bool)

(assert (=> b!1201372 (=> res!799737 e!682229)))

(assert (=> b!1201372 (= res!799737 (not (contains!6878 lt!544413 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14568 0))(
  ( (ValueCellFull!14568 (v!17972 V!45867)) (EmptyCell!14568) )
))
(declare-datatypes ((array!77885 0))(
  ( (array!77886 (arr!37587 (Array (_ BitVec 32) ValueCell!14568)) (size!38123 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77885)

(declare-fun getCurrentListMapNoExtraKeys!5259 (array!77883 array!77885 (_ BitVec 32) (_ BitVec 32) V!45867 V!45867 (_ BitVec 32) Int) ListLongMap!17609)

(assert (=> b!1201372 (= lt!544413 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201373 () Bool)

(declare-fun res!799734 () Bool)

(assert (=> b!1201373 (=> (not res!799734) (not e!682228))))

(assert (=> b!1201373 (= res!799734 (and (= (size!38123 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38122 _keys!1208) (size!38123 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!57416 () ListLongMap!17609)

(declare-fun call!57415 () ListLongMap!17609)

(declare-fun e!682218 () Bool)

(declare-fun b!1201374 () Bool)

(declare-fun -!1793 (ListLongMap!17609 (_ BitVec 64)) ListLongMap!17609)

(assert (=> b!1201374 (= e!682218 (= call!57415 (-!1793 call!57416 k0!934)))))

(declare-fun b!1201376 () Bool)

(declare-fun e!682230 () Bool)

(declare-fun tp_is_empty!30555 () Bool)

(assert (=> b!1201376 (= e!682230 tp_is_empty!30555)))

(declare-fun b!1201377 () Bool)

(declare-fun e!682225 () Bool)

(assert (=> b!1201377 (= e!682225 tp_is_empty!30555)))

(declare-fun b!1201378 () Bool)

(declare-fun e!682219 () Bool)

(assert (=> b!1201378 (= e!682226 (not e!682219))))

(declare-fun res!799733 () Bool)

(assert (=> b!1201378 (=> res!799733 e!682219)))

(assert (=> b!1201378 (= res!799733 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201378 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544416 () Unit!39829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77883 (_ BitVec 64) (_ BitVec 32)) Unit!39829)

(assert (=> b!1201378 (= lt!544416 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201379 () Bool)

(declare-fun res!799739 () Bool)

(assert (=> b!1201379 (=> (not res!799739) (not e!682228))))

(assert (=> b!1201379 (= res!799739 (= (select (arr!37586 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47675 () Bool)

(declare-fun mapRes!47675 () Bool)

(assert (=> mapIsEmpty!47675 mapRes!47675))

(declare-fun b!1201380 () Bool)

(declare-fun e!682224 () Unit!39829)

(assert (=> b!1201380 (= e!682224 e!682220)))

(assert (=> b!1201380 (= c!117503 (and (not lt!544415) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201381 () Bool)

(declare-fun e!682221 () Bool)

(assert (=> b!1201381 (= e!682221 (and e!682230 mapRes!47675))))

(declare-fun condMapEmpty!47675 () Bool)

(declare-fun mapDefault!47675 () ValueCell!14568)

(assert (=> b!1201381 (= condMapEmpty!47675 (= (arr!37587 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14568)) mapDefault!47675)))))

(declare-fun b!1201382 () Bool)

(declare-fun e!682222 () Bool)

(assert (=> b!1201382 (= e!682222 e!682223)))

(declare-fun res!799735 () Bool)

(assert (=> b!1201382 (=> res!799735 e!682223)))

(assert (=> b!1201382 (= res!799735 (not (= (select (arr!37586 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201382 e!682218))

(declare-fun c!117504 () Bool)

(assert (=> b!1201382 (= c!117504 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544424 () Unit!39829)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!999 (array!77883 array!77885 (_ BitVec 32) (_ BitVec 32) V!45867 V!45867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39829)

(assert (=> b!1201382 (= lt!544424 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!999 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47675 () Bool)

(declare-fun tp!90542 () Bool)

(assert (=> mapNonEmpty!47675 (= mapRes!47675 (and tp!90542 e!682225))))

(declare-fun mapKey!47675 () (_ BitVec 32))

(declare-fun mapRest!47675 () (Array (_ BitVec 32) ValueCell!14568))

(declare-fun mapValue!47675 () ValueCell!14568)

(assert (=> mapNonEmpty!47675 (= (arr!37587 _values!996) (store mapRest!47675 mapKey!47675 mapValue!47675))))

(declare-fun bm!57411 () Bool)

(declare-fun call!57413 () Unit!39829)

(assert (=> bm!57411 (= call!57413 call!57418)))

(declare-fun b!1201383 () Bool)

(assert (=> b!1201383 (= e!682218 (= call!57416 call!57415))))

(declare-fun call!57414 () ListLongMap!17609)

(declare-fun bm!57412 () Bool)

(declare-fun +!3952 (ListLongMap!17609 tuple2!19640) ListLongMap!17609)

(assert (=> bm!57412 (= call!57414 (+!3952 (ite c!117505 lt!544421 lt!544413) (ite c!117505 (tuple2!19641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117503 (tuple2!19641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1201384 () Bool)

(declare-fun res!799742 () Bool)

(assert (=> b!1201384 (=> (not res!799742) (not e!682228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201384 (= res!799742 (validMask!0 mask!1564))))

(declare-fun bm!57413 () Bool)

(declare-fun call!57417 () Bool)

(assert (=> bm!57413 (= call!57417 call!57412)))

(declare-fun b!1201385 () Bool)

(declare-fun res!799741 () Bool)

(assert (=> b!1201385 (=> (not res!799741) (not e!682228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201385 (= res!799741 (validKeyInArray!0 k0!934))))

(declare-fun b!1201386 () Bool)

(declare-fun lt!544417 () Unit!39829)

(assert (=> b!1201386 (= e!682224 lt!544417)))

(declare-fun lt!544423 () Unit!39829)

(assert (=> b!1201386 (= lt!544423 (addStillContains!979 lt!544413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1201386 (= lt!544421 (+!3952 lt!544413 (tuple2!19641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1201386 call!57412))

(assert (=> b!1201386 (= lt!544417 call!57418)))

(assert (=> b!1201386 (contains!6878 call!57414 k0!934)))

(declare-fun b!1201387 () Bool)

(assert (=> b!1201387 (= e!682229 true)))

(declare-fun lt!544420 () Unit!39829)

(assert (=> b!1201387 (= lt!544420 e!682224)))

(assert (=> b!1201387 (= c!117505 (and (not lt!544415) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201387 (= lt!544415 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201388 () Bool)

(declare-fun res!799740 () Bool)

(assert (=> b!1201388 (=> (not res!799740) (not e!682228))))

(assert (=> b!1201388 (= res!799740 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26455))))

(declare-fun b!1201389 () Bool)

(declare-fun lt!544419 () Unit!39829)

(assert (=> b!1201389 (= e!682227 lt!544419)))

(assert (=> b!1201389 (= lt!544419 call!57413)))

(assert (=> b!1201389 call!57417))

(declare-fun lt!544422 () array!77885)

(declare-fun bm!57414 () Bool)

(assert (=> bm!57414 (= call!57416 (getCurrentListMapNoExtraKeys!5259 (ite c!117504 _keys!1208 lt!544414) (ite c!117504 _values!996 lt!544422) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201390 () Bool)

(assert (=> b!1201390 call!57417))

(declare-fun lt!544418 () Unit!39829)

(assert (=> b!1201390 (= lt!544418 call!57413)))

(assert (=> b!1201390 (= e!682220 lt!544418)))

(declare-fun bm!57415 () Bool)

(assert (=> bm!57415 (= call!57415 (getCurrentListMapNoExtraKeys!5259 (ite c!117504 lt!544414 _keys!1208) (ite c!117504 lt!544422 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57416 () Bool)

(assert (=> bm!57416 (= call!57419 call!57414)))

(declare-fun b!1201375 () Bool)

(declare-fun Unit!39831 () Unit!39829)

(assert (=> b!1201375 (= e!682227 Unit!39831)))

(declare-fun res!799745 () Bool)

(assert (=> start!100528 (=> (not res!799745) (not e!682228))))

(assert (=> start!100528 (= res!799745 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38122 _keys!1208))))))

(assert (=> start!100528 e!682228))

(assert (=> start!100528 tp_is_empty!30555))

(declare-fun array_inv!28644 (array!77883) Bool)

(assert (=> start!100528 (array_inv!28644 _keys!1208)))

(assert (=> start!100528 true))

(assert (=> start!100528 tp!90543))

(declare-fun array_inv!28645 (array!77885) Bool)

(assert (=> start!100528 (and (array_inv!28645 _values!996) e!682221)))

(declare-fun b!1201391 () Bool)

(assert (=> b!1201391 (= e!682228 e!682226)))

(declare-fun res!799743 () Bool)

(assert (=> b!1201391 (=> (not res!799743) (not e!682226))))

(assert (=> b!1201391 (= res!799743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544414 mask!1564))))

(assert (=> b!1201391 (= lt!544414 (array!77884 (store (arr!37586 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38122 _keys!1208)))))

(declare-fun b!1201392 () Bool)

(assert (=> b!1201392 (= e!682219 e!682222)))

(declare-fun res!799746 () Bool)

(assert (=> b!1201392 (=> res!799746 e!682222)))

(assert (=> b!1201392 (= res!799746 (not (= from!1455 i!673)))))

(declare-fun lt!544425 () ListLongMap!17609)

(assert (=> b!1201392 (= lt!544425 (getCurrentListMapNoExtraKeys!5259 lt!544414 lt!544422 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3176 (Int (_ BitVec 64)) V!45867)

(assert (=> b!1201392 (= lt!544422 (array!77886 (store (arr!37587 _values!996) i!673 (ValueCellFull!14568 (dynLambda!3176 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38123 _values!996)))))

(declare-fun lt!544426 () ListLongMap!17609)

(assert (=> b!1201392 (= lt!544426 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100528 res!799745) b!1201384))

(assert (= (and b!1201384 res!799742) b!1201373))

(assert (= (and b!1201373 res!799734) b!1201370))

(assert (= (and b!1201370 res!799736) b!1201388))

(assert (= (and b!1201388 res!799740) b!1201371))

(assert (= (and b!1201371 res!799738) b!1201385))

(assert (= (and b!1201385 res!799741) b!1201379))

(assert (= (and b!1201379 res!799739) b!1201391))

(assert (= (and b!1201391 res!799743) b!1201368))

(assert (= (and b!1201368 res!799744) b!1201378))

(assert (= (and b!1201378 (not res!799733)) b!1201392))

(assert (= (and b!1201392 (not res!799746)) b!1201382))

(assert (= (and b!1201382 c!117504) b!1201374))

(assert (= (and b!1201382 (not c!117504)) b!1201383))

(assert (= (or b!1201374 b!1201383) bm!57414))

(assert (= (or b!1201374 b!1201383) bm!57415))

(assert (= (and b!1201382 (not res!799735)) b!1201372))

(assert (= (and b!1201372 (not res!799737)) b!1201387))

(assert (= (and b!1201387 c!117505) b!1201386))

(assert (= (and b!1201387 (not c!117505)) b!1201380))

(assert (= (and b!1201380 c!117503) b!1201390))

(assert (= (and b!1201380 (not c!117503)) b!1201369))

(assert (= (and b!1201369 c!117506) b!1201389))

(assert (= (and b!1201369 (not c!117506)) b!1201375))

(assert (= (or b!1201390 b!1201389) bm!57411))

(assert (= (or b!1201390 b!1201389) bm!57416))

(assert (= (or b!1201390 b!1201389) bm!57413))

(assert (= (or b!1201386 bm!57413) bm!57410))

(assert (= (or b!1201386 bm!57411) bm!57409))

(assert (= (or b!1201386 bm!57416) bm!57412))

(assert (= (and b!1201381 condMapEmpty!47675) mapIsEmpty!47675))

(assert (= (and b!1201381 (not condMapEmpty!47675)) mapNonEmpty!47675))

(get-info :version)

(assert (= (and mapNonEmpty!47675 ((_ is ValueCellFull!14568) mapValue!47675)) b!1201377))

(assert (= (and b!1201381 ((_ is ValueCellFull!14568) mapDefault!47675)) b!1201376))

(assert (= start!100528 b!1201381))

(declare-fun b_lambda!21047 () Bool)

(assert (=> (not b_lambda!21047) (not b!1201392)))

(declare-fun t!39288 () Bool)

(declare-fun tb!10651 () Bool)

(assert (=> (and start!100528 (= defaultEntry!1004 defaultEntry!1004) t!39288) tb!10651))

(declare-fun result!21879 () Bool)

(assert (=> tb!10651 (= result!21879 tp_is_empty!30555)))

(assert (=> b!1201392 t!39288))

(declare-fun b_and!42591 () Bool)

(assert (= b_and!42589 (and (=> t!39288 result!21879) b_and!42591)))

(declare-fun m!1107489 () Bool)

(assert (=> b!1201368 m!1107489))

(declare-fun m!1107491 () Bool)

(assert (=> b!1201370 m!1107491))

(declare-fun m!1107493 () Bool)

(assert (=> b!1201388 m!1107493))

(declare-fun m!1107495 () Bool)

(assert (=> b!1201392 m!1107495))

(declare-fun m!1107497 () Bool)

(assert (=> b!1201392 m!1107497))

(declare-fun m!1107499 () Bool)

(assert (=> b!1201392 m!1107499))

(declare-fun m!1107501 () Bool)

(assert (=> b!1201392 m!1107501))

(declare-fun m!1107503 () Bool)

(assert (=> b!1201379 m!1107503))

(declare-fun m!1107505 () Bool)

(assert (=> bm!57414 m!1107505))

(declare-fun m!1107507 () Bool)

(assert (=> bm!57409 m!1107507))

(declare-fun m!1107509 () Bool)

(assert (=> b!1201378 m!1107509))

(declare-fun m!1107511 () Bool)

(assert (=> b!1201378 m!1107511))

(declare-fun m!1107513 () Bool)

(assert (=> b!1201372 m!1107513))

(declare-fun m!1107515 () Bool)

(assert (=> b!1201372 m!1107515))

(declare-fun m!1107517 () Bool)

(assert (=> b!1201382 m!1107517))

(declare-fun m!1107519 () Bool)

(assert (=> b!1201382 m!1107519))

(declare-fun m!1107521 () Bool)

(assert (=> mapNonEmpty!47675 m!1107521))

(declare-fun m!1107523 () Bool)

(assert (=> bm!57415 m!1107523))

(declare-fun m!1107525 () Bool)

(assert (=> b!1201391 m!1107525))

(declare-fun m!1107527 () Bool)

(assert (=> b!1201391 m!1107527))

(declare-fun m!1107529 () Bool)

(assert (=> b!1201386 m!1107529))

(declare-fun m!1107531 () Bool)

(assert (=> b!1201386 m!1107531))

(declare-fun m!1107533 () Bool)

(assert (=> b!1201386 m!1107533))

(declare-fun m!1107535 () Bool)

(assert (=> b!1201384 m!1107535))

(declare-fun m!1107537 () Bool)

(assert (=> b!1201385 m!1107537))

(declare-fun m!1107539 () Bool)

(assert (=> bm!57412 m!1107539))

(declare-fun m!1107541 () Bool)

(assert (=> bm!57410 m!1107541))

(declare-fun m!1107543 () Bool)

(assert (=> b!1201374 m!1107543))

(declare-fun m!1107545 () Bool)

(assert (=> start!100528 m!1107545))

(declare-fun m!1107547 () Bool)

(assert (=> start!100528 m!1107547))

(check-sat (not bm!57409) (not b!1201378) (not b!1201368) (not b!1201372) (not bm!57414) (not bm!57412) (not b!1201385) (not b!1201382) (not b!1201392) (not start!100528) (not bm!57410) (not b!1201391) (not b_lambda!21047) (not bm!57415) (not b!1201386) (not b!1201388) (not mapNonEmpty!47675) (not b_next!25851) b_and!42591 (not b!1201374) (not b!1201384) (not b!1201370) tp_is_empty!30555)
(check-sat b_and!42591 (not b_next!25851))
