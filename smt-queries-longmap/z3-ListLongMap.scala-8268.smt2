; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100558 () Bool)

(assert start!100558)

(declare-fun b_free!25881 () Bool)

(declare-fun b_next!25881 () Bool)

(assert (=> start!100558 (= b_free!25881 (not b_next!25881))))

(declare-fun tp!90632 () Bool)

(declare-fun b_and!42649 () Bool)

(assert (=> start!100558 (= tp!90632 b_and!42649)))

(declare-fun b!1202523 () Bool)

(declare-fun e!682849 () Bool)

(declare-fun e!682861 () Bool)

(assert (=> b!1202523 (= e!682849 (not e!682861))))

(declare-fun res!800375 () Bool)

(assert (=> b!1202523 (=> res!800375 e!682861)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202523 (= res!800375 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77943 0))(
  ( (array!77944 (arr!37616 (Array (_ BitVec 32) (_ BitVec 64))) (size!38152 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77943)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202523 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39865 0))(
  ( (Unit!39866) )
))
(declare-fun lt!545051 () Unit!39865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77943 (_ BitVec 64) (_ BitVec 32)) Unit!39865)

(assert (=> b!1202523 (= lt!545051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202524 () Bool)

(declare-fun e!682855 () Bool)

(assert (=> b!1202524 (= e!682855 e!682849)))

(declare-fun res!800374 () Bool)

(assert (=> b!1202524 (=> (not res!800374) (not e!682849))))

(declare-fun lt!545053 () array!77943)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77943 (_ BitVec 32)) Bool)

(assert (=> b!1202524 (= res!800374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545053 mask!1564))))

(assert (=> b!1202524 (= lt!545053 (array!77944 (store (arr!37616 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38152 _keys!1208)))))

(declare-fun b!1202525 () Bool)

(declare-fun res!800370 () Bool)

(assert (=> b!1202525 (=> (not res!800370) (not e!682855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202525 (= res!800370 (validMask!0 mask!1564))))

(declare-fun b!1202526 () Bool)

(declare-fun e!682853 () Bool)

(declare-fun tp_is_empty!30585 () Bool)

(assert (=> b!1202526 (= e!682853 tp_is_empty!30585)))

(declare-fun bm!57769 () Bool)

(declare-datatypes ((V!45907 0))(
  ( (V!45908 (val!15349 Int)) )
))
(declare-datatypes ((tuple2!19670 0))(
  ( (tuple2!19671 (_1!9846 (_ BitVec 64)) (_2!9846 V!45907)) )
))
(declare-datatypes ((List!26481 0))(
  ( (Nil!26478) (Cons!26477 (h!27686 tuple2!19670) (t!39342 List!26481)) )
))
(declare-datatypes ((ListLongMap!17639 0))(
  ( (ListLongMap!17640 (toList!8835 List!26481)) )
))
(declare-fun call!57775 () ListLongMap!17639)

(declare-fun call!57779 () ListLongMap!17639)

(assert (=> bm!57769 (= call!57775 call!57779)))

(declare-fun b!1202527 () Bool)

(declare-fun e!682857 () Bool)

(declare-fun e!682850 () Bool)

(assert (=> b!1202527 (= e!682857 e!682850)))

(declare-fun res!800366 () Bool)

(assert (=> b!1202527 (=> res!800366 e!682850)))

(assert (=> b!1202527 (= res!800366 (not (= (select (arr!37616 _keys!1208) from!1455) k0!934)))))

(declare-fun e!682852 () Bool)

(assert (=> b!1202527 e!682852))

(declare-fun c!117686 () Bool)

(assert (=> b!1202527 (= c!117686 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45907)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!545044 () Unit!39865)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14583 0))(
  ( (ValueCellFull!14583 (v!17987 V!45907)) (EmptyCell!14583) )
))
(declare-datatypes ((array!77945 0))(
  ( (array!77946 (arr!37617 (Array (_ BitVec 32) ValueCell!14583)) (size!38153 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77945)

(declare-fun minValue!944 () V!45907)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1008 (array!77943 array!77945 (_ BitVec 32) (_ BitVec 32) V!45907 V!45907 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39865)

(assert (=> b!1202527 (= lt!545044 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1008 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202529 () Bool)

(declare-fun res!800371 () Bool)

(assert (=> b!1202529 (=> (not res!800371) (not e!682855))))

(assert (=> b!1202529 (= res!800371 (and (= (size!38153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38152 _keys!1208) (size!38153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202530 () Bool)

(declare-fun res!800363 () Bool)

(assert (=> b!1202530 (=> (not res!800363) (not e!682855))))

(assert (=> b!1202530 (= res!800363 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38152 _keys!1208))))))

(declare-fun b!1202531 () Bool)

(declare-fun e!682851 () Unit!39865)

(declare-fun Unit!39867 () Unit!39865)

(assert (=> b!1202531 (= e!682851 Unit!39867)))

(declare-fun b!1202532 () Bool)

(declare-fun e!682860 () Bool)

(assert (=> b!1202532 (= e!682860 true)))

(declare-fun lt!545056 () Unit!39865)

(declare-fun e!682859 () Unit!39865)

(assert (=> b!1202532 (= lt!545056 e!682859)))

(declare-fun c!117684 () Bool)

(declare-fun lt!545046 () Bool)

(assert (=> b!1202532 (= c!117684 (and (not lt!545046) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202532 (= lt!545046 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202533 () Bool)

(declare-fun e!682848 () Unit!39865)

(assert (=> b!1202533 (= e!682859 e!682848)))

(declare-fun c!117683 () Bool)

(assert (=> b!1202533 (= c!117683 (and (not lt!545046) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202534 () Bool)

(declare-fun c!117685 () Bool)

(assert (=> b!1202534 (= c!117685 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545046))))

(assert (=> b!1202534 (= e!682848 e!682851)))

(declare-fun b!1202535 () Bool)

(assert (=> b!1202535 (= e!682861 e!682857)))

(declare-fun res!800372 () Bool)

(assert (=> b!1202535 (=> res!800372 e!682857)))

(assert (=> b!1202535 (= res!800372 (not (= from!1455 i!673)))))

(declare-fun lt!545054 () array!77945)

(declare-fun lt!545047 () ListLongMap!17639)

(declare-fun getCurrentListMapNoExtraKeys!5271 (array!77943 array!77945 (_ BitVec 32) (_ BitVec 32) V!45907 V!45907 (_ BitVec 32) Int) ListLongMap!17639)

(assert (=> b!1202535 (= lt!545047 (getCurrentListMapNoExtraKeys!5271 lt!545053 lt!545054 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3186 (Int (_ BitVec 64)) V!45907)

(assert (=> b!1202535 (= lt!545054 (array!77946 (store (arr!37617 _values!996) i!673 (ValueCellFull!14583 (dynLambda!3186 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38153 _values!996)))))

(declare-fun lt!545043 () ListLongMap!17639)

(assert (=> b!1202535 (= lt!545043 (getCurrentListMapNoExtraKeys!5271 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57770 () Bool)

(declare-fun call!57777 () Unit!39865)

(declare-fun call!57772 () Unit!39865)

(assert (=> bm!57770 (= call!57777 call!57772)))

(declare-fun b!1202536 () Bool)

(declare-fun res!800368 () Bool)

(assert (=> b!1202536 (=> (not res!800368) (not e!682855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202536 (= res!800368 (validKeyInArray!0 k0!934))))

(declare-fun b!1202537 () Bool)

(declare-fun res!800376 () Bool)

(assert (=> b!1202537 (=> (not res!800376) (not e!682855))))

(declare-datatypes ((List!26482 0))(
  ( (Nil!26479) (Cons!26478 (h!27687 (_ BitVec 64)) (t!39343 List!26482)) )
))
(declare-fun arrayNoDuplicates!0 (array!77943 (_ BitVec 32) List!26482) Bool)

(assert (=> b!1202537 (= res!800376 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26479))))

(declare-fun bm!57771 () Bool)

(declare-fun call!57778 () Bool)

(declare-fun call!57774 () Bool)

(assert (=> bm!57771 (= call!57778 call!57774)))

(declare-fun b!1202538 () Bool)

(assert (=> b!1202538 call!57778))

(declare-fun lt!545048 () Unit!39865)

(assert (=> b!1202538 (= lt!545048 call!57777)))

(assert (=> b!1202538 (= e!682848 lt!545048)))

(declare-fun b!1202539 () Bool)

(declare-fun res!800369 () Bool)

(assert (=> b!1202539 (=> (not res!800369) (not e!682849))))

(assert (=> b!1202539 (= res!800369 (arrayNoDuplicates!0 lt!545053 #b00000000000000000000000000000000 Nil!26479))))

(declare-fun b!1202540 () Bool)

(declare-fun res!800364 () Bool)

(assert (=> b!1202540 (=> (not res!800364) (not e!682855))))

(assert (=> b!1202540 (= res!800364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202541 () Bool)

(declare-fun lt!545055 () Unit!39865)

(assert (=> b!1202541 (= e!682859 lt!545055)))

(declare-fun lt!545050 () Unit!39865)

(declare-fun lt!545045 () ListLongMap!17639)

(declare-fun addStillContains!991 (ListLongMap!17639 (_ BitVec 64) V!45907 (_ BitVec 64)) Unit!39865)

(assert (=> b!1202541 (= lt!545050 (addStillContains!991 lt!545045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!545052 () ListLongMap!17639)

(declare-fun +!3963 (ListLongMap!17639 tuple2!19670) ListLongMap!17639)

(assert (=> b!1202541 (= lt!545052 (+!3963 lt!545045 (tuple2!19671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1202541 call!57774))

(assert (=> b!1202541 (= lt!545055 call!57772)))

(declare-fun contains!6890 (ListLongMap!17639 (_ BitVec 64)) Bool)

(assert (=> b!1202541 (contains!6890 call!57779 k0!934)))

(declare-fun bm!57772 () Bool)

(assert (=> bm!57772 (= call!57774 (contains!6890 (ite c!117684 lt!545052 call!57775) k0!934))))

(declare-fun res!800365 () Bool)

(assert (=> start!100558 (=> (not res!800365) (not e!682855))))

(assert (=> start!100558 (= res!800365 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38152 _keys!1208))))))

(assert (=> start!100558 e!682855))

(assert (=> start!100558 tp_is_empty!30585))

(declare-fun array_inv!28662 (array!77943) Bool)

(assert (=> start!100558 (array_inv!28662 _keys!1208)))

(assert (=> start!100558 true))

(assert (=> start!100558 tp!90632))

(declare-fun e!682858 () Bool)

(declare-fun array_inv!28663 (array!77945) Bool)

(assert (=> start!100558 (and (array_inv!28663 _values!996) e!682858)))

(declare-fun b!1202528 () Bool)

(declare-fun call!57773 () ListLongMap!17639)

(declare-fun call!57776 () ListLongMap!17639)

(assert (=> b!1202528 (= e!682852 (= call!57773 call!57776))))

(declare-fun b!1202542 () Bool)

(declare-fun res!800367 () Bool)

(assert (=> b!1202542 (=> (not res!800367) (not e!682855))))

(assert (=> b!1202542 (= res!800367 (= (select (arr!37616 _keys!1208) i!673) k0!934))))

(declare-fun bm!57773 () Bool)

(assert (=> bm!57773 (= call!57779 (+!3963 (ite c!117684 lt!545052 lt!545045) (ite c!117684 (tuple2!19671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117683 (tuple2!19671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202543 () Bool)

(declare-fun e!682856 () Bool)

(declare-fun mapRes!47720 () Bool)

(assert (=> b!1202543 (= e!682858 (and e!682856 mapRes!47720))))

(declare-fun condMapEmpty!47720 () Bool)

(declare-fun mapDefault!47720 () ValueCell!14583)

(assert (=> b!1202543 (= condMapEmpty!47720 (= (arr!37617 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14583)) mapDefault!47720)))))

(declare-fun bm!57774 () Bool)

(assert (=> bm!57774 (= call!57776 (getCurrentListMapNoExtraKeys!5271 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57775 () Bool)

(assert (=> bm!57775 (= call!57772 (addStillContains!991 (ite c!117684 lt!545052 lt!545045) (ite c!117684 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117683 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117684 minValue!944 (ite c!117683 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!47720 () Bool)

(declare-fun tp!90633 () Bool)

(assert (=> mapNonEmpty!47720 (= mapRes!47720 (and tp!90633 e!682853))))

(declare-fun mapValue!47720 () ValueCell!14583)

(declare-fun mapRest!47720 () (Array (_ BitVec 32) ValueCell!14583))

(declare-fun mapKey!47720 () (_ BitVec 32))

(assert (=> mapNonEmpty!47720 (= (arr!37617 _values!996) (store mapRest!47720 mapKey!47720 mapValue!47720))))

(declare-fun b!1202544 () Bool)

(declare-fun lt!545049 () Unit!39865)

(assert (=> b!1202544 (= e!682851 lt!545049)))

(assert (=> b!1202544 (= lt!545049 call!57777)))

(assert (=> b!1202544 call!57778))

(declare-fun b!1202545 () Bool)

(declare-fun -!1803 (ListLongMap!17639 (_ BitVec 64)) ListLongMap!17639)

(assert (=> b!1202545 (= e!682852 (= call!57773 (-!1803 call!57776 k0!934)))))

(declare-fun bm!57776 () Bool)

(assert (=> bm!57776 (= call!57773 (getCurrentListMapNoExtraKeys!5271 lt!545053 lt!545054 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202546 () Bool)

(assert (=> b!1202546 (= e!682850 e!682860)))

(declare-fun res!800373 () Bool)

(assert (=> b!1202546 (=> res!800373 e!682860)))

(assert (=> b!1202546 (= res!800373 (not (contains!6890 lt!545045 k0!934)))))

(assert (=> b!1202546 (= lt!545045 (getCurrentListMapNoExtraKeys!5271 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202547 () Bool)

(assert (=> b!1202547 (= e!682856 tp_is_empty!30585)))

(declare-fun mapIsEmpty!47720 () Bool)

(assert (=> mapIsEmpty!47720 mapRes!47720))

(assert (= (and start!100558 res!800365) b!1202525))

(assert (= (and b!1202525 res!800370) b!1202529))

(assert (= (and b!1202529 res!800371) b!1202540))

(assert (= (and b!1202540 res!800364) b!1202537))

(assert (= (and b!1202537 res!800376) b!1202530))

(assert (= (and b!1202530 res!800363) b!1202536))

(assert (= (and b!1202536 res!800368) b!1202542))

(assert (= (and b!1202542 res!800367) b!1202524))

(assert (= (and b!1202524 res!800374) b!1202539))

(assert (= (and b!1202539 res!800369) b!1202523))

(assert (= (and b!1202523 (not res!800375)) b!1202535))

(assert (= (and b!1202535 (not res!800372)) b!1202527))

(assert (= (and b!1202527 c!117686) b!1202545))

(assert (= (and b!1202527 (not c!117686)) b!1202528))

(assert (= (or b!1202545 b!1202528) bm!57774))

(assert (= (or b!1202545 b!1202528) bm!57776))

(assert (= (and b!1202527 (not res!800366)) b!1202546))

(assert (= (and b!1202546 (not res!800373)) b!1202532))

(assert (= (and b!1202532 c!117684) b!1202541))

(assert (= (and b!1202532 (not c!117684)) b!1202533))

(assert (= (and b!1202533 c!117683) b!1202538))

(assert (= (and b!1202533 (not c!117683)) b!1202534))

(assert (= (and b!1202534 c!117685) b!1202544))

(assert (= (and b!1202534 (not c!117685)) b!1202531))

(assert (= (or b!1202538 b!1202544) bm!57770))

(assert (= (or b!1202538 b!1202544) bm!57769))

(assert (= (or b!1202538 b!1202544) bm!57771))

(assert (= (or b!1202541 bm!57771) bm!57772))

(assert (= (or b!1202541 bm!57770) bm!57775))

(assert (= (or b!1202541 bm!57769) bm!57773))

(assert (= (and b!1202543 condMapEmpty!47720) mapIsEmpty!47720))

(assert (= (and b!1202543 (not condMapEmpty!47720)) mapNonEmpty!47720))

(get-info :version)

(assert (= (and mapNonEmpty!47720 ((_ is ValueCellFull!14583) mapValue!47720)) b!1202526))

(assert (= (and b!1202543 ((_ is ValueCellFull!14583) mapDefault!47720)) b!1202547))

(assert (= start!100558 b!1202543))

(declare-fun b_lambda!21077 () Bool)

(assert (=> (not b_lambda!21077) (not b!1202535)))

(declare-fun t!39341 () Bool)

(declare-fun tb!10681 () Bool)

(assert (=> (and start!100558 (= defaultEntry!1004 defaultEntry!1004) t!39341) tb!10681))

(declare-fun result!21939 () Bool)

(assert (=> tb!10681 (= result!21939 tp_is_empty!30585)))

(assert (=> b!1202535 t!39341))

(declare-fun b_and!42651 () Bool)

(assert (= b_and!42649 (and (=> t!39341 result!21939) b_and!42651)))

(declare-fun m!1108361 () Bool)

(assert (=> b!1202527 m!1108361))

(declare-fun m!1108363 () Bool)

(assert (=> b!1202527 m!1108363))

(declare-fun m!1108365 () Bool)

(assert (=> b!1202537 m!1108365))

(declare-fun m!1108367 () Bool)

(assert (=> b!1202525 m!1108367))

(declare-fun m!1108369 () Bool)

(assert (=> b!1202523 m!1108369))

(declare-fun m!1108371 () Bool)

(assert (=> b!1202523 m!1108371))

(declare-fun m!1108373 () Bool)

(assert (=> b!1202524 m!1108373))

(declare-fun m!1108375 () Bool)

(assert (=> b!1202524 m!1108375))

(declare-fun m!1108377 () Bool)

(assert (=> b!1202541 m!1108377))

(declare-fun m!1108379 () Bool)

(assert (=> b!1202541 m!1108379))

(declare-fun m!1108381 () Bool)

(assert (=> b!1202541 m!1108381))

(declare-fun m!1108383 () Bool)

(assert (=> bm!57774 m!1108383))

(declare-fun m!1108385 () Bool)

(assert (=> b!1202536 m!1108385))

(declare-fun m!1108387 () Bool)

(assert (=> bm!57775 m!1108387))

(declare-fun m!1108389 () Bool)

(assert (=> b!1202535 m!1108389))

(declare-fun m!1108391 () Bool)

(assert (=> b!1202535 m!1108391))

(declare-fun m!1108393 () Bool)

(assert (=> b!1202535 m!1108393))

(declare-fun m!1108395 () Bool)

(assert (=> b!1202535 m!1108395))

(declare-fun m!1108397 () Bool)

(assert (=> bm!57773 m!1108397))

(declare-fun m!1108399 () Bool)

(assert (=> bm!57776 m!1108399))

(declare-fun m!1108401 () Bool)

(assert (=> bm!57772 m!1108401))

(declare-fun m!1108403 () Bool)

(assert (=> b!1202545 m!1108403))

(declare-fun m!1108405 () Bool)

(assert (=> b!1202539 m!1108405))

(declare-fun m!1108407 () Bool)

(assert (=> b!1202542 m!1108407))

(declare-fun m!1108409 () Bool)

(assert (=> mapNonEmpty!47720 m!1108409))

(declare-fun m!1108411 () Bool)

(assert (=> b!1202546 m!1108411))

(assert (=> b!1202546 m!1108383))

(declare-fun m!1108413 () Bool)

(assert (=> b!1202540 m!1108413))

(declare-fun m!1108415 () Bool)

(assert (=> start!100558 m!1108415))

(declare-fun m!1108417 () Bool)

(assert (=> start!100558 m!1108417))

(check-sat (not b!1202546) (not b!1202535) (not b!1202523) (not mapNonEmpty!47720) (not b!1202527) tp_is_empty!30585 (not b!1202539) (not b_next!25881) (not b!1202537) (not b!1202524) (not bm!57774) (not b_lambda!21077) (not bm!57776) (not b!1202541) (not b!1202545) (not b!1202540) (not bm!57773) (not bm!57772) (not b!1202536) (not b!1202525) (not start!100558) (not bm!57775) b_and!42651)
(check-sat b_and!42651 (not b_next!25881))
