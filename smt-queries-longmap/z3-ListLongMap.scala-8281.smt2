; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100812 () Bool)

(assert start!100812)

(declare-fun b_free!25957 () Bool)

(declare-fun b_next!25957 () Bool)

(assert (=> start!100812 (= b_free!25957 (not b_next!25957))))

(declare-fun tp!90876 () Bool)

(declare-fun b_and!42893 () Bool)

(assert (=> start!100812 (= tp!90876 b_and!42893)))

(declare-fun b!1206769 () Bool)

(declare-datatypes ((Unit!39841 0))(
  ( (Unit!39842) )
))
(declare-fun e!685317 () Unit!39841)

(declare-fun Unit!39843 () Unit!39841)

(assert (=> b!1206769 (= e!685317 Unit!39843)))

(declare-fun b!1206770 () Bool)

(declare-datatypes ((array!78016 0))(
  ( (array!78017 (arr!37648 (Array (_ BitVec 32) (_ BitVec 64))) (size!38186 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78016)

(declare-fun e!685312 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206770 (= e!685312 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206771 () Bool)

(declare-fun res!802480 () Bool)

(declare-fun e!685305 () Bool)

(assert (=> b!1206771 (=> (not res!802480) (not e!685305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206771 (= res!802480 (validKeyInArray!0 k0!934))))

(declare-fun b!1206772 () Bool)

(declare-fun e!685313 () Bool)

(declare-fun e!685319 () Bool)

(assert (=> b!1206772 (= e!685313 e!685319)))

(declare-fun res!802476 () Bool)

(assert (=> b!1206772 (=> res!802476 e!685319)))

(assert (=> b!1206772 (= res!802476 (not (= (select (arr!37648 _keys!1208) from!1455) k0!934)))))

(declare-fun e!685308 () Bool)

(assert (=> b!1206772 e!685308))

(declare-fun c!118526 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206772 (= c!118526 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!46009 0))(
  ( (V!46010 (val!15387 Int)) )
))
(declare-fun zeroValue!944 () V!46009)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14621 0))(
  ( (ValueCellFull!14621 (v!18031 V!46009)) (EmptyCell!14621) )
))
(declare-datatypes ((array!78018 0))(
  ( (array!78019 (arr!37649 (Array (_ BitVec 32) ValueCell!14621)) (size!38187 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78018)

(declare-fun minValue!944 () V!46009)

(declare-fun lt!547361 () Unit!39841)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1038 (array!78016 array!78018 (_ BitVec 32) (_ BitVec 32) V!46009 V!46009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39841)

(assert (=> b!1206772 (= lt!547361 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206773 () Bool)

(declare-fun e!685315 () Bool)

(assert (=> b!1206773 (= e!685315 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206774 () Bool)

(declare-fun e!685306 () Bool)

(declare-fun e!685316 () Bool)

(assert (=> b!1206774 (= e!685306 (not e!685316))))

(declare-fun res!802468 () Bool)

(assert (=> b!1206774 (=> res!802468 e!685316)))

(assert (=> b!1206774 (= res!802468 (bvsgt from!1455 i!673))))

(assert (=> b!1206774 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547366 () Unit!39841)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78016 (_ BitVec 64) (_ BitVec 32)) Unit!39841)

(assert (=> b!1206774 (= lt!547366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1206775 () Bool)

(declare-fun res!802477 () Bool)

(assert (=> b!1206775 (=> (not res!802477) (not e!685305))))

(assert (=> b!1206775 (= res!802477 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38186 _keys!1208))))))

(declare-fun b!1206776 () Bool)

(declare-fun c!118524 () Bool)

(declare-fun lt!547360 () Bool)

(assert (=> b!1206776 (= c!118524 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547360))))

(declare-fun e!685318 () Unit!39841)

(assert (=> b!1206776 (= e!685318 e!685317)))

(declare-fun b!1206777 () Bool)

(declare-fun e!685304 () Unit!39841)

(declare-fun lt!547356 () Unit!39841)

(assert (=> b!1206777 (= e!685304 lt!547356)))

(declare-fun lt!547362 () Unit!39841)

(declare-datatypes ((tuple2!19816 0))(
  ( (tuple2!19817 (_1!9919 (_ BitVec 64)) (_2!9919 V!46009)) )
))
(declare-datatypes ((List!26598 0))(
  ( (Nil!26595) (Cons!26594 (h!27803 tuple2!19816) (t!39526 List!26598)) )
))
(declare-datatypes ((ListLongMap!17785 0))(
  ( (ListLongMap!17786 (toList!8908 List!26598)) )
))
(declare-fun lt!547358 () ListLongMap!17785)

(declare-fun addStillContains!1020 (ListLongMap!17785 (_ BitVec 64) V!46009 (_ BitVec 64)) Unit!39841)

(assert (=> b!1206777 (= lt!547362 (addStillContains!1020 lt!547358 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!547364 () ListLongMap!17785)

(declare-fun call!58815 () ListLongMap!17785)

(assert (=> b!1206777 (= lt!547364 call!58815)))

(declare-fun call!58813 () Bool)

(assert (=> b!1206777 call!58813))

(declare-fun call!58816 () Unit!39841)

(assert (=> b!1206777 (= lt!547356 call!58816)))

(declare-fun contains!6908 (ListLongMap!17785 (_ BitVec 64)) Bool)

(declare-fun +!4036 (ListLongMap!17785 tuple2!19816) ListLongMap!17785)

(assert (=> b!1206777 (contains!6908 (+!4036 lt!547364 (tuple2!19817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!58807 () Bool)

(declare-fun call!58814 () ListLongMap!17785)

(declare-fun lt!547355 () array!78018)

(declare-fun lt!547367 () array!78016)

(declare-fun getCurrentListMapNoExtraKeys!5351 (array!78016 array!78018 (_ BitVec 32) (_ BitVec 32) V!46009 V!46009 (_ BitVec 32) Int) ListLongMap!17785)

(assert (=> bm!58807 (= call!58814 (getCurrentListMapNoExtraKeys!5351 lt!547367 lt!547355 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206778 () Bool)

(declare-fun e!685311 () Bool)

(declare-fun tp_is_empty!30661 () Bool)

(assert (=> b!1206778 (= e!685311 tp_is_empty!30661)))

(declare-fun b!1206779 () Bool)

(declare-fun call!58812 () Bool)

(assert (=> b!1206779 call!58812))

(declare-fun lt!547359 () Unit!39841)

(declare-fun call!58810 () Unit!39841)

(assert (=> b!1206779 (= lt!547359 call!58810)))

(assert (=> b!1206779 (= e!685318 lt!547359)))

(declare-fun bm!58808 () Bool)

(assert (=> bm!58808 (= call!58812 call!58813)))

(declare-fun b!1206780 () Bool)

(assert (=> b!1206780 (= e!685316 e!685313)))

(declare-fun res!802474 () Bool)

(assert (=> b!1206780 (=> res!802474 e!685313)))

(assert (=> b!1206780 (= res!802474 (not (= from!1455 i!673)))))

(declare-fun lt!547352 () ListLongMap!17785)

(assert (=> b!1206780 (= lt!547352 (getCurrentListMapNoExtraKeys!5351 lt!547367 lt!547355 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3216 (Int (_ BitVec 64)) V!46009)

(assert (=> b!1206780 (= lt!547355 (array!78019 (store (arr!37649 _values!996) i!673 (ValueCellFull!14621 (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38187 _values!996)))))

(declare-fun lt!547353 () ListLongMap!17785)

(assert (=> b!1206780 (= lt!547353 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206781 () Bool)

(declare-fun res!802481 () Bool)

(assert (=> b!1206781 (=> (not res!802481) (not e!685305))))

(declare-datatypes ((List!26599 0))(
  ( (Nil!26596) (Cons!26595 (h!27804 (_ BitVec 64)) (t!39527 List!26599)) )
))
(declare-fun arrayNoDuplicates!0 (array!78016 (_ BitVec 32) List!26599) Bool)

(assert (=> b!1206781 (= res!802481 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26596))))

(declare-fun b!1206782 () Bool)

(declare-fun res!802482 () Bool)

(assert (=> b!1206782 (=> (not res!802482) (not e!685306))))

(assert (=> b!1206782 (= res!802482 (arrayNoDuplicates!0 lt!547367 #b00000000000000000000000000000000 Nil!26596))))

(declare-fun b!1206783 () Bool)

(declare-fun res!802471 () Bool)

(assert (=> b!1206783 (=> (not res!802471) (not e!685305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78016 (_ BitVec 32)) Bool)

(assert (=> b!1206783 (= res!802471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!58809 () Bool)

(declare-fun call!58817 () ListLongMap!17785)

(assert (=> bm!58809 (= call!58817 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206784 () Bool)

(declare-fun e!685310 () Bool)

(assert (=> b!1206784 (= e!685319 e!685310)))

(declare-fun res!802472 () Bool)

(assert (=> b!1206784 (=> res!802472 e!685310)))

(assert (=> b!1206784 (= res!802472 (not (contains!6908 lt!547358 k0!934)))))

(assert (=> b!1206784 (= lt!547358 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206785 () Bool)

(declare-fun e!685314 () Bool)

(assert (=> b!1206785 (= e!685314 tp_is_empty!30661)))

(declare-fun res!802470 () Bool)

(assert (=> start!100812 (=> (not res!802470) (not e!685305))))

(assert (=> start!100812 (= res!802470 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38186 _keys!1208))))))

(assert (=> start!100812 e!685305))

(assert (=> start!100812 tp_is_empty!30661))

(declare-fun array_inv!28790 (array!78016) Bool)

(assert (=> start!100812 (array_inv!28790 _keys!1208)))

(assert (=> start!100812 true))

(assert (=> start!100812 tp!90876))

(declare-fun e!685309 () Bool)

(declare-fun array_inv!28791 (array!78018) Bool)

(assert (=> start!100812 (and (array_inv!28791 _values!996) e!685309)))

(declare-fun c!118525 () Bool)

(declare-fun c!118527 () Bool)

(declare-fun bm!58810 () Bool)

(assert (=> bm!58810 (= call!58815 (+!4036 lt!547358 (ite (or c!118525 c!118527) (tuple2!19817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapNonEmpty!47850 () Bool)

(declare-fun mapRes!47850 () Bool)

(declare-fun tp!90877 () Bool)

(assert (=> mapNonEmpty!47850 (= mapRes!47850 (and tp!90877 e!685311))))

(declare-fun mapKey!47850 () (_ BitVec 32))

(declare-fun mapRest!47850 () (Array (_ BitVec 32) ValueCell!14621))

(declare-fun mapValue!47850 () ValueCell!14621)

(assert (=> mapNonEmpty!47850 (= (arr!37649 _values!996) (store mapRest!47850 mapKey!47850 mapValue!47850))))

(declare-fun b!1206786 () Bool)

(declare-fun res!802479 () Bool)

(assert (=> b!1206786 (=> (not res!802479) (not e!685305))))

(assert (=> b!1206786 (= res!802479 (= (select (arr!37648 _keys!1208) i!673) k0!934))))

(declare-fun call!58811 () ListLongMap!17785)

(declare-fun bm!58811 () Bool)

(assert (=> bm!58811 (= call!58813 (contains!6908 (ite c!118525 lt!547364 call!58811) k0!934))))

(declare-fun b!1206787 () Bool)

(declare-fun lt!547354 () Unit!39841)

(assert (=> b!1206787 (= e!685317 lt!547354)))

(assert (=> b!1206787 (= lt!547354 call!58810)))

(assert (=> b!1206787 call!58812))

(declare-fun bm!58812 () Bool)

(assert (=> bm!58812 (= call!58811 call!58815)))

(declare-fun b!1206788 () Bool)

(assert (=> b!1206788 (= e!685310 true)))

(assert (=> b!1206788 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26596)))

(declare-fun lt!547365 () Unit!39841)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78016 (_ BitVec 32) (_ BitVec 32)) Unit!39841)

(assert (=> b!1206788 (= lt!547365 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1206788 e!685312))

(declare-fun res!802478 () Bool)

(assert (=> b!1206788 (=> (not res!802478) (not e!685312))))

(assert (=> b!1206788 (= res!802478 e!685315)))

(declare-fun c!118523 () Bool)

(assert (=> b!1206788 (= c!118523 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547363 () Unit!39841)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!568 (array!78016 array!78018 (_ BitVec 32) (_ BitVec 32) V!46009 V!46009 (_ BitVec 64) (_ BitVec 32) Int) Unit!39841)

(assert (=> b!1206788 (= lt!547363 (lemmaListMapContainsThenArrayContainsFrom!568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547357 () Unit!39841)

(assert (=> b!1206788 (= lt!547357 e!685304)))

(assert (=> b!1206788 (= c!118525 (and (not lt!547360) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206788 (= lt!547360 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58813 () Bool)

(assert (=> bm!58813 (= call!58816 (addStillContains!1020 (ite c!118525 lt!547364 lt!547358) (ite c!118525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118527 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118525 minValue!944 (ite c!118527 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1206789 () Bool)

(assert (=> b!1206789 (= e!685305 e!685306)))

(declare-fun res!802469 () Bool)

(assert (=> b!1206789 (=> (not res!802469) (not e!685306))))

(assert (=> b!1206789 (= res!802469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547367 mask!1564))))

(assert (=> b!1206789 (= lt!547367 (array!78017 (store (arr!37648 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38186 _keys!1208)))))

(declare-fun b!1206790 () Bool)

(declare-fun res!802475 () Bool)

(assert (=> b!1206790 (=> (not res!802475) (not e!685305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206790 (= res!802475 (validMask!0 mask!1564))))

(declare-fun bm!58814 () Bool)

(assert (=> bm!58814 (= call!58810 call!58816)))

(declare-fun b!1206791 () Bool)

(assert (=> b!1206791 (= e!685308 (= call!58814 call!58817))))

(declare-fun b!1206792 () Bool)

(declare-fun res!802473 () Bool)

(assert (=> b!1206792 (=> (not res!802473) (not e!685305))))

(assert (=> b!1206792 (= res!802473 (and (= (size!38187 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38186 _keys!1208) (size!38187 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47850 () Bool)

(assert (=> mapIsEmpty!47850 mapRes!47850))

(declare-fun b!1206793 () Bool)

(assert (=> b!1206793 (= e!685315 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547360) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206794 () Bool)

(declare-fun -!1794 (ListLongMap!17785 (_ BitVec 64)) ListLongMap!17785)

(assert (=> b!1206794 (= e!685308 (= call!58814 (-!1794 call!58817 k0!934)))))

(declare-fun b!1206795 () Bool)

(assert (=> b!1206795 (= e!685304 e!685318)))

(assert (=> b!1206795 (= c!118527 (and (not lt!547360) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206796 () Bool)

(assert (=> b!1206796 (= e!685309 (and e!685314 mapRes!47850))))

(declare-fun condMapEmpty!47850 () Bool)

(declare-fun mapDefault!47850 () ValueCell!14621)

(assert (=> b!1206796 (= condMapEmpty!47850 (= (arr!37649 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14621)) mapDefault!47850)))))

(assert (= (and start!100812 res!802470) b!1206790))

(assert (= (and b!1206790 res!802475) b!1206792))

(assert (= (and b!1206792 res!802473) b!1206783))

(assert (= (and b!1206783 res!802471) b!1206781))

(assert (= (and b!1206781 res!802481) b!1206775))

(assert (= (and b!1206775 res!802477) b!1206771))

(assert (= (and b!1206771 res!802480) b!1206786))

(assert (= (and b!1206786 res!802479) b!1206789))

(assert (= (and b!1206789 res!802469) b!1206782))

(assert (= (and b!1206782 res!802482) b!1206774))

(assert (= (and b!1206774 (not res!802468)) b!1206780))

(assert (= (and b!1206780 (not res!802474)) b!1206772))

(assert (= (and b!1206772 c!118526) b!1206794))

(assert (= (and b!1206772 (not c!118526)) b!1206791))

(assert (= (or b!1206794 b!1206791) bm!58807))

(assert (= (or b!1206794 b!1206791) bm!58809))

(assert (= (and b!1206772 (not res!802476)) b!1206784))

(assert (= (and b!1206784 (not res!802472)) b!1206788))

(assert (= (and b!1206788 c!118525) b!1206777))

(assert (= (and b!1206788 (not c!118525)) b!1206795))

(assert (= (and b!1206795 c!118527) b!1206779))

(assert (= (and b!1206795 (not c!118527)) b!1206776))

(assert (= (and b!1206776 c!118524) b!1206787))

(assert (= (and b!1206776 (not c!118524)) b!1206769))

(assert (= (or b!1206779 b!1206787) bm!58814))

(assert (= (or b!1206779 b!1206787) bm!58812))

(assert (= (or b!1206779 b!1206787) bm!58808))

(assert (= (or b!1206777 bm!58808) bm!58811))

(assert (= (or b!1206777 bm!58814) bm!58813))

(assert (= (or b!1206777 bm!58812) bm!58810))

(assert (= (and b!1206788 c!118523) b!1206773))

(assert (= (and b!1206788 (not c!118523)) b!1206793))

(assert (= (and b!1206788 res!802478) b!1206770))

(assert (= (and b!1206796 condMapEmpty!47850) mapIsEmpty!47850))

(assert (= (and b!1206796 (not condMapEmpty!47850)) mapNonEmpty!47850))

(get-info :version)

(assert (= (and mapNonEmpty!47850 ((_ is ValueCellFull!14621) mapValue!47850)) b!1206778))

(assert (= (and b!1206796 ((_ is ValueCellFull!14621) mapDefault!47850)) b!1206785))

(assert (= start!100812 b!1206796))

(declare-fun b_lambda!21373 () Bool)

(assert (=> (not b_lambda!21373) (not b!1206780)))

(declare-fun t!39525 () Bool)

(declare-fun tb!10749 () Bool)

(assert (=> (and start!100812 (= defaultEntry!1004 defaultEntry!1004) t!39525) tb!10749))

(declare-fun result!22093 () Bool)

(assert (=> tb!10749 (= result!22093 tp_is_empty!30661)))

(assert (=> b!1206780 t!39525))

(declare-fun b_and!42895 () Bool)

(assert (= b_and!42893 (and (=> t!39525 result!22093) b_and!42895)))

(declare-fun m!1111911 () Bool)

(assert (=> b!1206771 m!1111911))

(declare-fun m!1111913 () Bool)

(assert (=> b!1206774 m!1111913))

(declare-fun m!1111915 () Bool)

(assert (=> b!1206774 m!1111915))

(declare-fun m!1111917 () Bool)

(assert (=> bm!58813 m!1111917))

(declare-fun m!1111919 () Bool)

(assert (=> b!1206782 m!1111919))

(declare-fun m!1111921 () Bool)

(assert (=> b!1206788 m!1111921))

(declare-fun m!1111923 () Bool)

(assert (=> b!1206788 m!1111923))

(declare-fun m!1111925 () Bool)

(assert (=> b!1206788 m!1111925))

(declare-fun m!1111927 () Bool)

(assert (=> b!1206781 m!1111927))

(declare-fun m!1111929 () Bool)

(assert (=> b!1206772 m!1111929))

(declare-fun m!1111931 () Bool)

(assert (=> b!1206772 m!1111931))

(declare-fun m!1111933 () Bool)

(assert (=> b!1206789 m!1111933))

(declare-fun m!1111935 () Bool)

(assert (=> b!1206789 m!1111935))

(declare-fun m!1111937 () Bool)

(assert (=> start!100812 m!1111937))

(declare-fun m!1111939 () Bool)

(assert (=> start!100812 m!1111939))

(declare-fun m!1111941 () Bool)

(assert (=> bm!58809 m!1111941))

(declare-fun m!1111943 () Bool)

(assert (=> b!1206783 m!1111943))

(declare-fun m!1111945 () Bool)

(assert (=> bm!58807 m!1111945))

(declare-fun m!1111947 () Bool)

(assert (=> b!1206780 m!1111947))

(declare-fun m!1111949 () Bool)

(assert (=> b!1206780 m!1111949))

(declare-fun m!1111951 () Bool)

(assert (=> b!1206780 m!1111951))

(declare-fun m!1111953 () Bool)

(assert (=> b!1206780 m!1111953))

(declare-fun m!1111955 () Bool)

(assert (=> b!1206777 m!1111955))

(declare-fun m!1111957 () Bool)

(assert (=> b!1206777 m!1111957))

(assert (=> b!1206777 m!1111957))

(declare-fun m!1111959 () Bool)

(assert (=> b!1206777 m!1111959))

(declare-fun m!1111961 () Bool)

(assert (=> b!1206773 m!1111961))

(assert (=> b!1206770 m!1111961))

(declare-fun m!1111963 () Bool)

(assert (=> bm!58810 m!1111963))

(declare-fun m!1111965 () Bool)

(assert (=> b!1206790 m!1111965))

(declare-fun m!1111967 () Bool)

(assert (=> bm!58811 m!1111967))

(declare-fun m!1111969 () Bool)

(assert (=> b!1206786 m!1111969))

(declare-fun m!1111971 () Bool)

(assert (=> b!1206794 m!1111971))

(declare-fun m!1111973 () Bool)

(assert (=> b!1206784 m!1111973))

(assert (=> b!1206784 m!1111941))

(declare-fun m!1111975 () Bool)

(assert (=> mapNonEmpty!47850 m!1111975))

(check-sat (not bm!58811) (not b!1206770) b_and!42895 (not b!1206780) (not b!1206774) (not b!1206772) (not b!1206782) (not b!1206789) (not mapNonEmpty!47850) (not bm!58813) (not b!1206784) (not bm!58809) (not b!1206788) (not b!1206777) (not bm!58807) (not b_lambda!21373) (not start!100812) (not b!1206781) (not b!1206771) tp_is_empty!30661 (not b_next!25957) (not b!1206773) (not bm!58810) (not b!1206783) (not b!1206790) (not b!1206794))
(check-sat b_and!42895 (not b_next!25957))
