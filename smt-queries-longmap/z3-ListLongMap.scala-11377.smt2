; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132186 () Bool)

(assert start!132186)

(declare-fun b_free!31881 () Bool)

(declare-fun b_next!31881 () Bool)

(assert (=> start!132186 (= b_free!31881 (not b_next!31881))))

(declare-fun tp!111897 () Bool)

(declare-fun b_and!51307 () Bool)

(assert (=> start!132186 (= tp!111897 b_and!51307)))

(declare-datatypes ((array!103512 0))(
  ( (array!103513 (arr!49957 (Array (_ BitVec 32) (_ BitVec 64))) (size!50507 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103512)

(declare-datatypes ((V!59319 0))(
  ( (V!59320 (val!19156 Int)) )
))
(declare-fun zeroValue!436 () V!59319)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18168 0))(
  ( (ValueCellFull!18168 (v!21958 V!59319)) (EmptyCell!18168) )
))
(declare-datatypes ((array!103514 0))(
  ( (array!103515 (arr!49958 (Array (_ BitVec 32) ValueCell!18168)) (size!50508 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103514)

(declare-fun minValue!436 () V!59319)

(declare-fun bm!70850 () Bool)

(declare-datatypes ((tuple2!24690 0))(
  ( (tuple2!24691 (_1!12356 (_ BitVec 64)) (_2!12356 V!59319)) )
))
(declare-datatypes ((List!36169 0))(
  ( (Nil!36166) (Cons!36165 (h!37610 tuple2!24690) (t!50877 List!36169)) )
))
(declare-datatypes ((ListLongMap!22299 0))(
  ( (ListLongMap!22300 (toList!11165 List!36169)) )
))
(declare-fun call!70857 () ListLongMap!22299)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6614 (array!103512 array!103514 (_ BitVec 32) (_ BitVec 32) V!59319 V!59319 (_ BitVec 32) Int) ListLongMap!22299)

(assert (=> bm!70850 (= call!70857 (getCurrentListMapNoExtraKeys!6614 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550818 () Bool)

(declare-fun e!863278 () ListLongMap!22299)

(declare-fun call!70854 () ListLongMap!22299)

(declare-fun +!4987 (ListLongMap!22299 tuple2!24690) ListLongMap!22299)

(assert (=> b!1550818 (= e!863278 (+!4987 call!70854 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550819 () Bool)

(declare-fun e!863279 () Bool)

(assert (=> b!1550819 (= e!863279 (not (= (select (arr!49957 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1550820 () Bool)

(declare-fun res!1062157 () Bool)

(declare-fun e!863285 () Bool)

(assert (=> b!1550820 (=> (not res!1062157) (not e!863285))))

(declare-datatypes ((List!36170 0))(
  ( (Nil!36167) (Cons!36166 (h!37611 (_ BitVec 64)) (t!50878 List!36170)) )
))
(declare-fun arrayNoDuplicates!0 (array!103512 (_ BitVec 32) List!36170) Bool)

(assert (=> b!1550820 (= res!1062157 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36167))))

(declare-fun b!1550821 () Bool)

(declare-fun res!1062155 () Bool)

(assert (=> b!1550821 (=> (not res!1062155) (not e!863285))))

(assert (=> b!1550821 (= res!1062155 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50507 _keys!618))))))

(declare-fun b!1550822 () Bool)

(declare-fun res!1062160 () Bool)

(assert (=> b!1550822 (=> (not res!1062160) (not e!863285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103512 (_ BitVec 32)) Bool)

(assert (=> b!1550822 (= res!1062160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58942 () Bool)

(declare-fun mapRes!58942 () Bool)

(assert (=> mapIsEmpty!58942 mapRes!58942))

(declare-fun b!1550823 () Bool)

(declare-fun e!863286 () Bool)

(assert (=> b!1550823 (= e!863286 (not e!863279))))

(declare-fun res!1062154 () Bool)

(assert (=> b!1550823 (=> (not res!1062154) (not e!863279))))

(declare-fun lt!668400 () ListLongMap!22299)

(declare-fun contains!10106 (ListLongMap!22299 (_ BitVec 64)) Bool)

(assert (=> b!1550823 (= res!1062154 (contains!10106 lt!668400 (select (arr!49957 _keys!618) from!762)))))

(assert (=> b!1550823 (contains!10106 (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49957 _keys!618) from!762))))

(declare-datatypes ((Unit!51654 0))(
  ( (Unit!51655) )
))
(declare-fun lt!668399 () Unit!51654)

(declare-fun addStillContains!1288 (ListLongMap!22299 (_ BitVec 64) V!59319 (_ BitVec 64)) Unit!51654)

(assert (=> b!1550823 (= lt!668399 (addStillContains!1288 lt!668400 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49957 _keys!618) from!762)))))

(assert (=> b!1550823 (= lt!668400 (getCurrentListMapNoExtraKeys!6614 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70851 () Bool)

(declare-fun call!70853 () ListLongMap!22299)

(declare-fun call!70855 () ListLongMap!22299)

(assert (=> bm!70851 (= call!70853 call!70855)))

(declare-fun b!1550824 () Bool)

(assert (=> b!1550824 (= e!863285 e!863286)))

(declare-fun res!1062158 () Bool)

(assert (=> b!1550824 (=> (not res!1062158) (not e!863286))))

(assert (=> b!1550824 (= res!1062158 (bvslt from!762 (size!50507 _keys!618)))))

(declare-fun lt!668397 () ListLongMap!22299)

(assert (=> b!1550824 (= lt!668397 e!863278)))

(declare-fun c!142652 () Bool)

(declare-fun lt!668398 () Bool)

(assert (=> b!1550824 (= c!142652 (and (not lt!668398) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550824 (= lt!668398 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1062159 () Bool)

(assert (=> start!132186 (=> (not res!1062159) (not e!863285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132186 (= res!1062159 (validMask!0 mask!926))))

(assert (=> start!132186 e!863285))

(declare-fun array_inv!38841 (array!103512) Bool)

(assert (=> start!132186 (array_inv!38841 _keys!618)))

(declare-fun tp_is_empty!38157 () Bool)

(assert (=> start!132186 tp_is_empty!38157))

(assert (=> start!132186 true))

(assert (=> start!132186 tp!111897))

(declare-fun e!863283 () Bool)

(declare-fun array_inv!38842 (array!103514) Bool)

(assert (=> start!132186 (and (array_inv!38842 _values!470) e!863283)))

(declare-fun b!1550825 () Bool)

(declare-fun e!863287 () ListLongMap!22299)

(declare-fun call!70856 () ListLongMap!22299)

(assert (=> b!1550825 (= e!863287 call!70856)))

(declare-fun b!1550826 () Bool)

(assert (=> b!1550826 (= e!863278 e!863287)))

(declare-fun c!142651 () Bool)

(assert (=> b!1550826 (= c!142651 (and (not lt!668398) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70852 () Bool)

(assert (=> bm!70852 (= call!70856 call!70854)))

(declare-fun b!1550827 () Bool)

(declare-fun c!142650 () Bool)

(assert (=> b!1550827 (= c!142650 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668398))))

(declare-fun e!863280 () ListLongMap!22299)

(assert (=> b!1550827 (= e!863287 e!863280)))

(declare-fun bm!70853 () Bool)

(assert (=> bm!70853 (= call!70854 (+!4987 (ite c!142652 call!70857 (ite c!142651 call!70855 call!70853)) (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550828 () Bool)

(declare-fun e!863282 () Bool)

(assert (=> b!1550828 (= e!863282 tp_is_empty!38157)))

(declare-fun bm!70854 () Bool)

(assert (=> bm!70854 (= call!70855 call!70857)))

(declare-fun b!1550829 () Bool)

(declare-fun res!1062156 () Bool)

(assert (=> b!1550829 (=> (not res!1062156) (not e!863285))))

(assert (=> b!1550829 (= res!1062156 (and (= (size!50508 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50507 _keys!618) (size!50508 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550830 () Bool)

(assert (=> b!1550830 (= e!863283 (and e!863282 mapRes!58942))))

(declare-fun condMapEmpty!58942 () Bool)

(declare-fun mapDefault!58942 () ValueCell!18168)

(assert (=> b!1550830 (= condMapEmpty!58942 (= (arr!49958 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18168)) mapDefault!58942)))))

(declare-fun b!1550831 () Bool)

(assert (=> b!1550831 (= e!863280 call!70856)))

(declare-fun b!1550832 () Bool)

(declare-fun res!1062161 () Bool)

(assert (=> b!1550832 (=> (not res!1062161) (not e!863286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550832 (= res!1062161 (validKeyInArray!0 (select (arr!49957 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58942 () Bool)

(declare-fun tp!111898 () Bool)

(declare-fun e!863284 () Bool)

(assert (=> mapNonEmpty!58942 (= mapRes!58942 (and tp!111898 e!863284))))

(declare-fun mapValue!58942 () ValueCell!18168)

(declare-fun mapKey!58942 () (_ BitVec 32))

(declare-fun mapRest!58942 () (Array (_ BitVec 32) ValueCell!18168))

(assert (=> mapNonEmpty!58942 (= (arr!49958 _values!470) (store mapRest!58942 mapKey!58942 mapValue!58942))))

(declare-fun b!1550833 () Bool)

(assert (=> b!1550833 (= e!863280 call!70853)))

(declare-fun b!1550834 () Bool)

(assert (=> b!1550834 (= e!863284 tp_is_empty!38157)))

(assert (= (and start!132186 res!1062159) b!1550829))

(assert (= (and b!1550829 res!1062156) b!1550822))

(assert (= (and b!1550822 res!1062160) b!1550820))

(assert (= (and b!1550820 res!1062157) b!1550821))

(assert (= (and b!1550821 res!1062155) b!1550824))

(assert (= (and b!1550824 c!142652) b!1550818))

(assert (= (and b!1550824 (not c!142652)) b!1550826))

(assert (= (and b!1550826 c!142651) b!1550825))

(assert (= (and b!1550826 (not c!142651)) b!1550827))

(assert (= (and b!1550827 c!142650) b!1550831))

(assert (= (and b!1550827 (not c!142650)) b!1550833))

(assert (= (or b!1550831 b!1550833) bm!70851))

(assert (= (or b!1550825 bm!70851) bm!70854))

(assert (= (or b!1550825 b!1550831) bm!70852))

(assert (= (or b!1550818 bm!70854) bm!70850))

(assert (= (or b!1550818 bm!70852) bm!70853))

(assert (= (and b!1550824 res!1062158) b!1550832))

(assert (= (and b!1550832 res!1062161) b!1550823))

(assert (= (and b!1550823 res!1062154) b!1550819))

(assert (= (and b!1550830 condMapEmpty!58942) mapIsEmpty!58942))

(assert (= (and b!1550830 (not condMapEmpty!58942)) mapNonEmpty!58942))

(get-info :version)

(assert (= (and mapNonEmpty!58942 ((_ is ValueCellFull!18168) mapValue!58942)) b!1550834))

(assert (= (and b!1550830 ((_ is ValueCellFull!18168) mapDefault!58942)) b!1550828))

(assert (= start!132186 b!1550830))

(declare-fun m!1429589 () Bool)

(assert (=> b!1550832 m!1429589))

(assert (=> b!1550832 m!1429589))

(declare-fun m!1429591 () Bool)

(assert (=> b!1550832 m!1429591))

(assert (=> b!1550819 m!1429589))

(declare-fun m!1429593 () Bool)

(assert (=> b!1550820 m!1429593))

(declare-fun m!1429595 () Bool)

(assert (=> b!1550818 m!1429595))

(declare-fun m!1429597 () Bool)

(assert (=> b!1550823 m!1429597))

(assert (=> b!1550823 m!1429589))

(declare-fun m!1429599 () Bool)

(assert (=> b!1550823 m!1429599))

(declare-fun m!1429601 () Bool)

(assert (=> b!1550823 m!1429601))

(assert (=> b!1550823 m!1429589))

(assert (=> b!1550823 m!1429589))

(declare-fun m!1429603 () Bool)

(assert (=> b!1550823 m!1429603))

(assert (=> b!1550823 m!1429589))

(declare-fun m!1429605 () Bool)

(assert (=> b!1550823 m!1429605))

(assert (=> b!1550823 m!1429597))

(declare-fun m!1429607 () Bool)

(assert (=> b!1550822 m!1429607))

(declare-fun m!1429609 () Bool)

(assert (=> bm!70853 m!1429609))

(declare-fun m!1429611 () Bool)

(assert (=> start!132186 m!1429611))

(declare-fun m!1429613 () Bool)

(assert (=> start!132186 m!1429613))

(declare-fun m!1429615 () Bool)

(assert (=> start!132186 m!1429615))

(assert (=> bm!70850 m!1429601))

(declare-fun m!1429617 () Bool)

(assert (=> mapNonEmpty!58942 m!1429617))

(check-sat (not b!1550832) (not b!1550818) (not b!1550822) (not bm!70853) (not b_next!31881) (not bm!70850) b_and!51307 tp_is_empty!38157 (not mapNonEmpty!58942) (not b!1550823) (not start!132186) (not b!1550820))
(check-sat b_and!51307 (not b_next!31881))
(get-model)

(declare-fun b!1550894 () Bool)

(declare-fun e!863325 () Bool)

(declare-fun call!70875 () Bool)

(assert (=> b!1550894 (= e!863325 call!70875)))

(declare-fun d!160929 () Bool)

(declare-fun res!1062190 () Bool)

(declare-fun e!863326 () Bool)

(assert (=> d!160929 (=> res!1062190 e!863326)))

(assert (=> d!160929 (= res!1062190 (bvsge #b00000000000000000000000000000000 (size!50507 _keys!618)))))

(assert (=> d!160929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!863326)))

(declare-fun b!1550895 () Bool)

(declare-fun e!863324 () Bool)

(assert (=> b!1550895 (= e!863324 e!863325)))

(declare-fun lt!668420 () (_ BitVec 64))

(assert (=> b!1550895 (= lt!668420 (select (arr!49957 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668421 () Unit!51654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103512 (_ BitVec 64) (_ BitVec 32)) Unit!51654)

(assert (=> b!1550895 (= lt!668421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668420 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1550895 (arrayContainsKey!0 _keys!618 lt!668420 #b00000000000000000000000000000000)))

(declare-fun lt!668419 () Unit!51654)

(assert (=> b!1550895 (= lt!668419 lt!668421)))

(declare-fun res!1062191 () Bool)

(declare-datatypes ((SeekEntryResult!13513 0))(
  ( (MissingZero!13513 (index!56450 (_ BitVec 32))) (Found!13513 (index!56451 (_ BitVec 32))) (Intermediate!13513 (undefined!14325 Bool) (index!56452 (_ BitVec 32)) (x!139101 (_ BitVec 32))) (Undefined!13513) (MissingVacant!13513 (index!56453 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103512 (_ BitVec 32)) SeekEntryResult!13513)

(assert (=> b!1550895 (= res!1062191 (= (seekEntryOrOpen!0 (select (arr!49957 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13513 #b00000000000000000000000000000000)))))

(assert (=> b!1550895 (=> (not res!1062191) (not e!863325))))

(declare-fun bm!70872 () Bool)

(assert (=> bm!70872 (= call!70875 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1550896 () Bool)

(assert (=> b!1550896 (= e!863326 e!863324)))

(declare-fun c!142664 () Bool)

(assert (=> b!1550896 (= c!142664 (validKeyInArray!0 (select (arr!49957 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550897 () Bool)

(assert (=> b!1550897 (= e!863324 call!70875)))

(assert (= (and d!160929 (not res!1062190)) b!1550896))

(assert (= (and b!1550896 c!142664) b!1550895))

(assert (= (and b!1550896 (not c!142664)) b!1550897))

(assert (= (and b!1550895 res!1062191) b!1550894))

(assert (= (or b!1550894 b!1550897) bm!70872))

(declare-fun m!1429649 () Bool)

(assert (=> b!1550895 m!1429649))

(declare-fun m!1429651 () Bool)

(assert (=> b!1550895 m!1429651))

(declare-fun m!1429653 () Bool)

(assert (=> b!1550895 m!1429653))

(assert (=> b!1550895 m!1429649))

(declare-fun m!1429655 () Bool)

(assert (=> b!1550895 m!1429655))

(declare-fun m!1429657 () Bool)

(assert (=> bm!70872 m!1429657))

(assert (=> b!1550896 m!1429649))

(assert (=> b!1550896 m!1429649))

(declare-fun m!1429659 () Bool)

(assert (=> b!1550896 m!1429659))

(assert (=> b!1550822 d!160929))

(declare-fun b!1550922 () Bool)

(declare-fun e!863342 () Bool)

(declare-fun e!863343 () Bool)

(assert (=> b!1550922 (= e!863342 e!863343)))

(declare-fun c!142674 () Bool)

(assert (=> b!1550922 (= c!142674 (bvslt from!762 (size!50507 _keys!618)))))

(declare-fun b!1550923 () Bool)

(declare-fun e!863344 () ListLongMap!22299)

(declare-fun call!70878 () ListLongMap!22299)

(assert (=> b!1550923 (= e!863344 call!70878)))

(declare-fun b!1550924 () Bool)

(assert (=> b!1550924 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50507 _keys!618)))))

(assert (=> b!1550924 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50508 _values!470)))))

(declare-fun e!863341 () Bool)

(declare-fun lt!668440 () ListLongMap!22299)

(declare-fun apply!1092 (ListLongMap!22299 (_ BitVec 64)) V!59319)

(declare-fun get!26013 (ValueCell!18168 V!59319) V!59319)

(declare-fun dynLambda!3802 (Int (_ BitVec 64)) V!59319)

(assert (=> b!1550924 (= e!863341 (= (apply!1092 lt!668440 (select (arr!49957 _keys!618) from!762)) (get!26013 (select (arr!49958 _values!470) from!762) (dynLambda!3802 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!70875 () Bool)

(assert (=> bm!70875 (= call!70878 (getCurrentListMapNoExtraKeys!6614 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1550926 () Bool)

(assert (=> b!1550926 (= e!863342 e!863341)))

(assert (=> b!1550926 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50507 _keys!618)))))

(declare-fun res!1062201 () Bool)

(assert (=> b!1550926 (= res!1062201 (contains!10106 lt!668440 (select (arr!49957 _keys!618) from!762)))))

(assert (=> b!1550926 (=> (not res!1062201) (not e!863341))))

(declare-fun b!1550927 () Bool)

(declare-fun lt!668441 () Unit!51654)

(declare-fun lt!668439 () Unit!51654)

(assert (=> b!1550927 (= lt!668441 lt!668439)))

(declare-fun lt!668436 () V!59319)

(declare-fun lt!668438 () ListLongMap!22299)

(declare-fun lt!668442 () (_ BitVec 64))

(declare-fun lt!668437 () (_ BitVec 64))

(assert (=> b!1550927 (not (contains!10106 (+!4987 lt!668438 (tuple2!24691 lt!668437 lt!668436)) lt!668442))))

(declare-fun addStillNotContains!510 (ListLongMap!22299 (_ BitVec 64) V!59319 (_ BitVec 64)) Unit!51654)

(assert (=> b!1550927 (= lt!668439 (addStillNotContains!510 lt!668438 lt!668437 lt!668436 lt!668442))))

(assert (=> b!1550927 (= lt!668442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1550927 (= lt!668436 (get!26013 (select (arr!49958 _values!470) from!762) (dynLambda!3802 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1550927 (= lt!668437 (select (arr!49957 _keys!618) from!762))))

(assert (=> b!1550927 (= lt!668438 call!70878)))

(assert (=> b!1550927 (= e!863344 (+!4987 call!70878 (tuple2!24691 (select (arr!49957 _keys!618) from!762) (get!26013 (select (arr!49958 _values!470) from!762) (dynLambda!3802 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1550928 () Bool)

(declare-fun e!863346 () Bool)

(assert (=> b!1550928 (= e!863346 e!863342)))

(declare-fun c!142673 () Bool)

(declare-fun e!863345 () Bool)

(assert (=> b!1550928 (= c!142673 e!863345)))

(declare-fun res!1062200 () Bool)

(assert (=> b!1550928 (=> (not res!1062200) (not e!863345))))

(assert (=> b!1550928 (= res!1062200 (bvslt from!762 (size!50507 _keys!618)))))

(declare-fun b!1550929 () Bool)

(assert (=> b!1550929 (= e!863345 (validKeyInArray!0 (select (arr!49957 _keys!618) from!762)))))

(assert (=> b!1550929 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1550925 () Bool)

(declare-fun e!863347 () ListLongMap!22299)

(assert (=> b!1550925 (= e!863347 (ListLongMap!22300 Nil!36166))))

(declare-fun d!160931 () Bool)

(assert (=> d!160931 e!863346))

(declare-fun res!1062202 () Bool)

(assert (=> d!160931 (=> (not res!1062202) (not e!863346))))

(assert (=> d!160931 (= res!1062202 (not (contains!10106 lt!668440 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160931 (= lt!668440 e!863347)))

(declare-fun c!142676 () Bool)

(assert (=> d!160931 (= c!142676 (bvsge from!762 (size!50507 _keys!618)))))

(assert (=> d!160931 (validMask!0 mask!926)))

(assert (=> d!160931 (= (getCurrentListMapNoExtraKeys!6614 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668440)))

(declare-fun b!1550930 () Bool)

(assert (=> b!1550930 (= e!863347 e!863344)))

(declare-fun c!142675 () Bool)

(assert (=> b!1550930 (= c!142675 (validKeyInArray!0 (select (arr!49957 _keys!618) from!762)))))

(declare-fun b!1550931 () Bool)

(declare-fun isEmpty!1129 (ListLongMap!22299) Bool)

(assert (=> b!1550931 (= e!863343 (isEmpty!1129 lt!668440))))

(declare-fun b!1550932 () Bool)

(assert (=> b!1550932 (= e!863343 (= lt!668440 (getCurrentListMapNoExtraKeys!6614 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1550933 () Bool)

(declare-fun res!1062203 () Bool)

(assert (=> b!1550933 (=> (not res!1062203) (not e!863346))))

(assert (=> b!1550933 (= res!1062203 (not (contains!10106 lt!668440 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160931 c!142676) b!1550925))

(assert (= (and d!160931 (not c!142676)) b!1550930))

(assert (= (and b!1550930 c!142675) b!1550927))

(assert (= (and b!1550930 (not c!142675)) b!1550923))

(assert (= (or b!1550927 b!1550923) bm!70875))

(assert (= (and d!160931 res!1062202) b!1550933))

(assert (= (and b!1550933 res!1062203) b!1550928))

(assert (= (and b!1550928 res!1062200) b!1550929))

(assert (= (and b!1550928 c!142673) b!1550926))

(assert (= (and b!1550928 (not c!142673)) b!1550922))

(assert (= (and b!1550926 res!1062201) b!1550924))

(assert (= (and b!1550922 c!142674) b!1550932))

(assert (= (and b!1550922 (not c!142674)) b!1550931))

(declare-fun b_lambda!24763 () Bool)

(assert (=> (not b_lambda!24763) (not b!1550924)))

(declare-fun t!50881 () Bool)

(declare-fun tb!12477 () Bool)

(assert (=> (and start!132186 (= defaultEntry!478 defaultEntry!478) t!50881) tb!12477))

(declare-fun result!26067 () Bool)

(assert (=> tb!12477 (= result!26067 tp_is_empty!38157)))

(assert (=> b!1550924 t!50881))

(declare-fun b_and!51311 () Bool)

(assert (= b_and!51307 (and (=> t!50881 result!26067) b_and!51311)))

(declare-fun b_lambda!24765 () Bool)

(assert (=> (not b_lambda!24765) (not b!1550927)))

(assert (=> b!1550927 t!50881))

(declare-fun b_and!51313 () Bool)

(assert (= b_and!51311 (and (=> t!50881 result!26067) b_and!51313)))

(assert (=> b!1550930 m!1429589))

(assert (=> b!1550930 m!1429589))

(assert (=> b!1550930 m!1429591))

(declare-fun m!1429661 () Bool)

(assert (=> b!1550931 m!1429661))

(declare-fun m!1429663 () Bool)

(assert (=> b!1550927 m!1429663))

(declare-fun m!1429665 () Bool)

(assert (=> b!1550927 m!1429665))

(assert (=> b!1550927 m!1429663))

(declare-fun m!1429667 () Bool)

(assert (=> b!1550927 m!1429667))

(declare-fun m!1429669 () Bool)

(assert (=> b!1550927 m!1429669))

(assert (=> b!1550927 m!1429667))

(declare-fun m!1429671 () Bool)

(assert (=> b!1550927 m!1429671))

(declare-fun m!1429673 () Bool)

(assert (=> b!1550927 m!1429673))

(declare-fun m!1429675 () Bool)

(assert (=> b!1550927 m!1429675))

(assert (=> b!1550927 m!1429671))

(assert (=> b!1550927 m!1429589))

(assert (=> b!1550929 m!1429589))

(assert (=> b!1550929 m!1429589))

(assert (=> b!1550929 m!1429591))

(declare-fun m!1429677 () Bool)

(assert (=> d!160931 m!1429677))

(assert (=> d!160931 m!1429611))

(declare-fun m!1429679 () Bool)

(assert (=> b!1550933 m!1429679))

(assert (=> b!1550924 m!1429663))

(assert (=> b!1550924 m!1429589))

(assert (=> b!1550924 m!1429663))

(assert (=> b!1550924 m!1429667))

(assert (=> b!1550924 m!1429669))

(assert (=> b!1550924 m!1429589))

(declare-fun m!1429681 () Bool)

(assert (=> b!1550924 m!1429681))

(assert (=> b!1550924 m!1429667))

(declare-fun m!1429683 () Bool)

(assert (=> b!1550932 m!1429683))

(assert (=> b!1550926 m!1429589))

(assert (=> b!1550926 m!1429589))

(declare-fun m!1429685 () Bool)

(assert (=> b!1550926 m!1429685))

(assert (=> bm!70875 m!1429683))

(assert (=> bm!70850 d!160931))

(declare-fun d!160933 () Bool)

(assert (=> d!160933 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132186 d!160933))

(declare-fun d!160935 () Bool)

(assert (=> d!160935 (= (array_inv!38841 _keys!618) (bvsge (size!50507 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132186 d!160935))

(declare-fun d!160937 () Bool)

(assert (=> d!160937 (= (array_inv!38842 _values!470) (bvsge (size!50508 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132186 d!160937))

(declare-fun d!160939 () Bool)

(declare-fun e!863350 () Bool)

(assert (=> d!160939 e!863350))

(declare-fun res!1062208 () Bool)

(assert (=> d!160939 (=> (not res!1062208) (not e!863350))))

(declare-fun lt!668453 () ListLongMap!22299)

(assert (=> d!160939 (= res!1062208 (contains!10106 lt!668453 (_1!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668452 () List!36169)

(assert (=> d!160939 (= lt!668453 (ListLongMap!22300 lt!668452))))

(declare-fun lt!668454 () Unit!51654)

(declare-fun lt!668451 () Unit!51654)

(assert (=> d!160939 (= lt!668454 lt!668451)))

(declare-datatypes ((Option!805 0))(
  ( (Some!804 (v!21960 V!59319)) (None!803) )
))
(declare-fun getValueByKey!729 (List!36169 (_ BitVec 64)) Option!805)

(assert (=> d!160939 (= (getValueByKey!729 lt!668452 (_1!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!804 (_2!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!371 (List!36169 (_ BitVec 64) V!59319) Unit!51654)

(assert (=> d!160939 (= lt!668451 (lemmaContainsTupThenGetReturnValue!371 lt!668452 (_1!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!500 (List!36169 (_ BitVec 64) V!59319) List!36169)

(assert (=> d!160939 (= lt!668452 (insertStrictlySorted!500 (toList!11165 call!70854) (_1!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160939 (= (+!4987 call!70854 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668453)))

(declare-fun b!1550940 () Bool)

(declare-fun res!1062209 () Bool)

(assert (=> b!1550940 (=> (not res!1062209) (not e!863350))))

(assert (=> b!1550940 (= res!1062209 (= (getValueByKey!729 (toList!11165 lt!668453) (_1!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!804 (_2!12356 (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1550941 () Bool)

(declare-fun contains!10107 (List!36169 tuple2!24690) Bool)

(assert (=> b!1550941 (= e!863350 (contains!10107 (toList!11165 lt!668453) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160939 res!1062208) b!1550940))

(assert (= (and b!1550940 res!1062209) b!1550941))

(declare-fun m!1429687 () Bool)

(assert (=> d!160939 m!1429687))

(declare-fun m!1429689 () Bool)

(assert (=> d!160939 m!1429689))

(declare-fun m!1429691 () Bool)

(assert (=> d!160939 m!1429691))

(declare-fun m!1429693 () Bool)

(assert (=> d!160939 m!1429693))

(declare-fun m!1429695 () Bool)

(assert (=> b!1550940 m!1429695))

(declare-fun m!1429697 () Bool)

(assert (=> b!1550941 m!1429697))

(assert (=> b!1550818 d!160939))

(assert (=> b!1550823 d!160931))

(declare-fun d!160941 () Bool)

(declare-fun e!863355 () Bool)

(assert (=> d!160941 e!863355))

(declare-fun res!1062212 () Bool)

(assert (=> d!160941 (=> res!1062212 e!863355)))

(declare-fun lt!668465 () Bool)

(assert (=> d!160941 (= res!1062212 (not lt!668465))))

(declare-fun lt!668463 () Bool)

(assert (=> d!160941 (= lt!668465 lt!668463)))

(declare-fun lt!668466 () Unit!51654)

(declare-fun e!863356 () Unit!51654)

(assert (=> d!160941 (= lt!668466 e!863356)))

(declare-fun c!142679 () Bool)

(assert (=> d!160941 (= c!142679 lt!668463)))

(declare-fun containsKey!751 (List!36169 (_ BitVec 64)) Bool)

(assert (=> d!160941 (= lt!668463 (containsKey!751 (toList!11165 (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49957 _keys!618) from!762)))))

(assert (=> d!160941 (= (contains!10106 (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49957 _keys!618) from!762)) lt!668465)))

(declare-fun b!1550948 () Bool)

(declare-fun lt!668464 () Unit!51654)

(assert (=> b!1550948 (= e!863356 lt!668464)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!497 (List!36169 (_ BitVec 64)) Unit!51654)

(assert (=> b!1550948 (= lt!668464 (lemmaContainsKeyImpliesGetValueByKeyDefined!497 (toList!11165 (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49957 _keys!618) from!762)))))

(declare-fun isDefined!545 (Option!805) Bool)

(assert (=> b!1550948 (isDefined!545 (getValueByKey!729 (toList!11165 (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49957 _keys!618) from!762)))))

(declare-fun b!1550949 () Bool)

(declare-fun Unit!51656 () Unit!51654)

(assert (=> b!1550949 (= e!863356 Unit!51656)))

(declare-fun b!1550950 () Bool)

(assert (=> b!1550950 (= e!863355 (isDefined!545 (getValueByKey!729 (toList!11165 (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49957 _keys!618) from!762))))))

(assert (= (and d!160941 c!142679) b!1550948))

(assert (= (and d!160941 (not c!142679)) b!1550949))

(assert (= (and d!160941 (not res!1062212)) b!1550950))

(assert (=> d!160941 m!1429589))

(declare-fun m!1429699 () Bool)

(assert (=> d!160941 m!1429699))

(assert (=> b!1550948 m!1429589))

(declare-fun m!1429701 () Bool)

(assert (=> b!1550948 m!1429701))

(assert (=> b!1550948 m!1429589))

(declare-fun m!1429703 () Bool)

(assert (=> b!1550948 m!1429703))

(assert (=> b!1550948 m!1429703))

(declare-fun m!1429705 () Bool)

(assert (=> b!1550948 m!1429705))

(assert (=> b!1550950 m!1429589))

(assert (=> b!1550950 m!1429703))

(assert (=> b!1550950 m!1429703))

(assert (=> b!1550950 m!1429705))

(assert (=> b!1550823 d!160941))

(declare-fun d!160943 () Bool)

(declare-fun e!863357 () Bool)

(assert (=> d!160943 e!863357))

(declare-fun res!1062213 () Bool)

(assert (=> d!160943 (=> (not res!1062213) (not e!863357))))

(declare-fun lt!668469 () ListLongMap!22299)

(assert (=> d!160943 (= res!1062213 (contains!10106 lt!668469 (_1!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!668468 () List!36169)

(assert (=> d!160943 (= lt!668469 (ListLongMap!22300 lt!668468))))

(declare-fun lt!668470 () Unit!51654)

(declare-fun lt!668467 () Unit!51654)

(assert (=> d!160943 (= lt!668470 lt!668467)))

(assert (=> d!160943 (= (getValueByKey!729 lt!668468 (_1!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!804 (_2!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160943 (= lt!668467 (lemmaContainsTupThenGetReturnValue!371 lt!668468 (_1!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160943 (= lt!668468 (insertStrictlySorted!500 (toList!11165 lt!668400) (_1!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160943 (= (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!668469)))

(declare-fun b!1550951 () Bool)

(declare-fun res!1062214 () Bool)

(assert (=> b!1550951 (=> (not res!1062214) (not e!863357))))

(assert (=> b!1550951 (= res!1062214 (= (getValueByKey!729 (toList!11165 lt!668469) (_1!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!804 (_2!12356 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1550952 () Bool)

(assert (=> b!1550952 (= e!863357 (contains!10107 (toList!11165 lt!668469) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!160943 res!1062213) b!1550951))

(assert (= (and b!1550951 res!1062214) b!1550952))

(declare-fun m!1429707 () Bool)

(assert (=> d!160943 m!1429707))

(declare-fun m!1429709 () Bool)

(assert (=> d!160943 m!1429709))

(declare-fun m!1429711 () Bool)

(assert (=> d!160943 m!1429711))

(declare-fun m!1429713 () Bool)

(assert (=> d!160943 m!1429713))

(declare-fun m!1429715 () Bool)

(assert (=> b!1550951 m!1429715))

(declare-fun m!1429717 () Bool)

(assert (=> b!1550952 m!1429717))

(assert (=> b!1550823 d!160943))

(declare-fun d!160945 () Bool)

(assert (=> d!160945 (contains!10106 (+!4987 lt!668400 (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49957 _keys!618) from!762))))

(declare-fun lt!668473 () Unit!51654)

(declare-fun choose!2030 (ListLongMap!22299 (_ BitVec 64) V!59319 (_ BitVec 64)) Unit!51654)

(assert (=> d!160945 (= lt!668473 (choose!2030 lt!668400 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49957 _keys!618) from!762)))))

(assert (=> d!160945 (contains!10106 lt!668400 (select (arr!49957 _keys!618) from!762))))

(assert (=> d!160945 (= (addStillContains!1288 lt!668400 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49957 _keys!618) from!762)) lt!668473)))

(declare-fun bs!44566 () Bool)

(assert (= bs!44566 d!160945))

(assert (=> bs!44566 m!1429597))

(assert (=> bs!44566 m!1429597))

(assert (=> bs!44566 m!1429589))

(assert (=> bs!44566 m!1429599))

(assert (=> bs!44566 m!1429589))

(declare-fun m!1429719 () Bool)

(assert (=> bs!44566 m!1429719))

(assert (=> bs!44566 m!1429589))

(assert (=> bs!44566 m!1429605))

(assert (=> b!1550823 d!160945))

(declare-fun d!160947 () Bool)

(declare-fun e!863358 () Bool)

(assert (=> d!160947 e!863358))

(declare-fun res!1062215 () Bool)

(assert (=> d!160947 (=> res!1062215 e!863358)))

(declare-fun lt!668476 () Bool)

(assert (=> d!160947 (= res!1062215 (not lt!668476))))

(declare-fun lt!668474 () Bool)

(assert (=> d!160947 (= lt!668476 lt!668474)))

(declare-fun lt!668477 () Unit!51654)

(declare-fun e!863359 () Unit!51654)

(assert (=> d!160947 (= lt!668477 e!863359)))

(declare-fun c!142680 () Bool)

(assert (=> d!160947 (= c!142680 lt!668474)))

(assert (=> d!160947 (= lt!668474 (containsKey!751 (toList!11165 lt!668400) (select (arr!49957 _keys!618) from!762)))))

(assert (=> d!160947 (= (contains!10106 lt!668400 (select (arr!49957 _keys!618) from!762)) lt!668476)))

(declare-fun b!1550954 () Bool)

(declare-fun lt!668475 () Unit!51654)

(assert (=> b!1550954 (= e!863359 lt!668475)))

(assert (=> b!1550954 (= lt!668475 (lemmaContainsKeyImpliesGetValueByKeyDefined!497 (toList!11165 lt!668400) (select (arr!49957 _keys!618) from!762)))))

(assert (=> b!1550954 (isDefined!545 (getValueByKey!729 (toList!11165 lt!668400) (select (arr!49957 _keys!618) from!762)))))

(declare-fun b!1550955 () Bool)

(declare-fun Unit!51657 () Unit!51654)

(assert (=> b!1550955 (= e!863359 Unit!51657)))

(declare-fun b!1550956 () Bool)

(assert (=> b!1550956 (= e!863358 (isDefined!545 (getValueByKey!729 (toList!11165 lt!668400) (select (arr!49957 _keys!618) from!762))))))

(assert (= (and d!160947 c!142680) b!1550954))

(assert (= (and d!160947 (not c!142680)) b!1550955))

(assert (= (and d!160947 (not res!1062215)) b!1550956))

(assert (=> d!160947 m!1429589))

(declare-fun m!1429721 () Bool)

(assert (=> d!160947 m!1429721))

(assert (=> b!1550954 m!1429589))

(declare-fun m!1429723 () Bool)

(assert (=> b!1550954 m!1429723))

(assert (=> b!1550954 m!1429589))

(declare-fun m!1429725 () Bool)

(assert (=> b!1550954 m!1429725))

(assert (=> b!1550954 m!1429725))

(declare-fun m!1429727 () Bool)

(assert (=> b!1550954 m!1429727))

(assert (=> b!1550956 m!1429589))

(assert (=> b!1550956 m!1429725))

(assert (=> b!1550956 m!1429725))

(assert (=> b!1550956 m!1429727))

(assert (=> b!1550823 d!160947))

(declare-fun b!1550967 () Bool)

(declare-fun e!863369 () Bool)

(declare-fun call!70881 () Bool)

(assert (=> b!1550967 (= e!863369 call!70881)))

(declare-fun b!1550968 () Bool)

(declare-fun e!863371 () Bool)

(assert (=> b!1550968 (= e!863371 e!863369)))

(declare-fun c!142683 () Bool)

(assert (=> b!1550968 (= c!142683 (validKeyInArray!0 (select (arr!49957 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550969 () Bool)

(declare-fun e!863368 () Bool)

(declare-fun contains!10108 (List!36170 (_ BitVec 64)) Bool)

(assert (=> b!1550969 (= e!863368 (contains!10108 Nil!36167 (select (arr!49957 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550970 () Bool)

(declare-fun e!863370 () Bool)

(assert (=> b!1550970 (= e!863370 e!863371)))

(declare-fun res!1062222 () Bool)

(assert (=> b!1550970 (=> (not res!1062222) (not e!863371))))

(assert (=> b!1550970 (= res!1062222 (not e!863368))))

(declare-fun res!1062223 () Bool)

(assert (=> b!1550970 (=> (not res!1062223) (not e!863368))))

(assert (=> b!1550970 (= res!1062223 (validKeyInArray!0 (select (arr!49957 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160949 () Bool)

(declare-fun res!1062224 () Bool)

(assert (=> d!160949 (=> res!1062224 e!863370)))

(assert (=> d!160949 (= res!1062224 (bvsge #b00000000000000000000000000000000 (size!50507 _keys!618)))))

(assert (=> d!160949 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36167) e!863370)))

(declare-fun bm!70878 () Bool)

(assert (=> bm!70878 (= call!70881 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142683 (Cons!36166 (select (arr!49957 _keys!618) #b00000000000000000000000000000000) Nil!36167) Nil!36167)))))

(declare-fun b!1550971 () Bool)

(assert (=> b!1550971 (= e!863369 call!70881)))

(assert (= (and d!160949 (not res!1062224)) b!1550970))

(assert (= (and b!1550970 res!1062223) b!1550969))

(assert (= (and b!1550970 res!1062222) b!1550968))

(assert (= (and b!1550968 c!142683) b!1550971))

(assert (= (and b!1550968 (not c!142683)) b!1550967))

(assert (= (or b!1550971 b!1550967) bm!70878))

(assert (=> b!1550968 m!1429649))

(assert (=> b!1550968 m!1429649))

(assert (=> b!1550968 m!1429659))

(assert (=> b!1550969 m!1429649))

(assert (=> b!1550969 m!1429649))

(declare-fun m!1429729 () Bool)

(assert (=> b!1550969 m!1429729))

(assert (=> b!1550970 m!1429649))

(assert (=> b!1550970 m!1429649))

(assert (=> b!1550970 m!1429659))

(assert (=> bm!70878 m!1429649))

(declare-fun m!1429731 () Bool)

(assert (=> bm!70878 m!1429731))

(assert (=> b!1550820 d!160949))

(declare-fun d!160951 () Bool)

(declare-fun e!863372 () Bool)

(assert (=> d!160951 e!863372))

(declare-fun res!1062225 () Bool)

(assert (=> d!160951 (=> (not res!1062225) (not e!863372))))

(declare-fun lt!668480 () ListLongMap!22299)

(assert (=> d!160951 (= res!1062225 (contains!10106 lt!668480 (_1!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668479 () List!36169)

(assert (=> d!160951 (= lt!668480 (ListLongMap!22300 lt!668479))))

(declare-fun lt!668481 () Unit!51654)

(declare-fun lt!668478 () Unit!51654)

(assert (=> d!160951 (= lt!668481 lt!668478)))

(assert (=> d!160951 (= (getValueByKey!729 lt!668479 (_1!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!804 (_2!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160951 (= lt!668478 (lemmaContainsTupThenGetReturnValue!371 lt!668479 (_1!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160951 (= lt!668479 (insertStrictlySorted!500 (toList!11165 (ite c!142652 call!70857 (ite c!142651 call!70855 call!70853))) (_1!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160951 (= (+!4987 (ite c!142652 call!70857 (ite c!142651 call!70855 call!70853)) (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668480)))

(declare-fun b!1550972 () Bool)

(declare-fun res!1062226 () Bool)

(assert (=> b!1550972 (=> (not res!1062226) (not e!863372))))

(assert (=> b!1550972 (= res!1062226 (= (getValueByKey!729 (toList!11165 lt!668480) (_1!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!804 (_2!12356 (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1550973 () Bool)

(assert (=> b!1550973 (= e!863372 (contains!10107 (toList!11165 lt!668480) (ite (or c!142652 c!142651) (tuple2!24691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160951 res!1062225) b!1550972))

(assert (= (and b!1550972 res!1062226) b!1550973))

(declare-fun m!1429733 () Bool)

(assert (=> d!160951 m!1429733))

(declare-fun m!1429735 () Bool)

(assert (=> d!160951 m!1429735))

(declare-fun m!1429737 () Bool)

(assert (=> d!160951 m!1429737))

(declare-fun m!1429739 () Bool)

(assert (=> d!160951 m!1429739))

(declare-fun m!1429741 () Bool)

(assert (=> b!1550972 m!1429741))

(declare-fun m!1429743 () Bool)

(assert (=> b!1550973 m!1429743))

(assert (=> bm!70853 d!160951))

(declare-fun d!160953 () Bool)

(assert (=> d!160953 (= (validKeyInArray!0 (select (arr!49957 _keys!618) from!762)) (and (not (= (select (arr!49957 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49957 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1550832 d!160953))

(declare-fun condMapEmpty!58948 () Bool)

(declare-fun mapDefault!58948 () ValueCell!18168)

(assert (=> mapNonEmpty!58942 (= condMapEmpty!58948 (= mapRest!58942 ((as const (Array (_ BitVec 32) ValueCell!18168)) mapDefault!58948)))))

(declare-fun e!863378 () Bool)

(declare-fun mapRes!58948 () Bool)

(assert (=> mapNonEmpty!58942 (= tp!111898 (and e!863378 mapRes!58948))))

(declare-fun b!1550981 () Bool)

(assert (=> b!1550981 (= e!863378 tp_is_empty!38157)))

(declare-fun b!1550980 () Bool)

(declare-fun e!863377 () Bool)

(assert (=> b!1550980 (= e!863377 tp_is_empty!38157)))

(declare-fun mapIsEmpty!58948 () Bool)

(assert (=> mapIsEmpty!58948 mapRes!58948))

(declare-fun mapNonEmpty!58948 () Bool)

(declare-fun tp!111907 () Bool)

(assert (=> mapNonEmpty!58948 (= mapRes!58948 (and tp!111907 e!863377))))

(declare-fun mapRest!58948 () (Array (_ BitVec 32) ValueCell!18168))

(declare-fun mapValue!58948 () ValueCell!18168)

(declare-fun mapKey!58948 () (_ BitVec 32))

(assert (=> mapNonEmpty!58948 (= mapRest!58942 (store mapRest!58948 mapKey!58948 mapValue!58948))))

(assert (= (and mapNonEmpty!58942 condMapEmpty!58948) mapIsEmpty!58948))

(assert (= (and mapNonEmpty!58942 (not condMapEmpty!58948)) mapNonEmpty!58948))

(assert (= (and mapNonEmpty!58948 ((_ is ValueCellFull!18168) mapValue!58948)) b!1550980))

(assert (= (and mapNonEmpty!58942 ((_ is ValueCellFull!18168) mapDefault!58948)) b!1550981))

(declare-fun m!1429745 () Bool)

(assert (=> mapNonEmpty!58948 m!1429745))

(declare-fun b_lambda!24767 () Bool)

(assert (= b_lambda!24765 (or (and start!132186 b_free!31881) b_lambda!24767)))

(declare-fun b_lambda!24769 () Bool)

(assert (= b_lambda!24763 (or (and start!132186 b_free!31881) b_lambda!24769)))

(check-sat (not b!1550952) (not b_lambda!24769) (not b_lambda!24767) (not b!1550956) (not b!1550951) (not b!1550954) (not b!1550929) (not d!160947) (not b_next!31881) (not b!1550968) (not b!1550927) (not b!1550932) (not b!1550941) (not d!160939) (not b!1550970) (not b!1550930) (not d!160951) (not b!1550973) (not b!1550933) (not mapNonEmpty!58948) (not b!1550924) (not bm!70872) (not b!1550948) (not d!160943) (not d!160931) tp_is_empty!38157 (not b!1550969) (not b!1550896) (not b!1550950) (not b!1550972) (not b!1550931) (not bm!70875) (not b!1550926) (not b!1550895) (not bm!70878) (not d!160945) (not b!1550940) b_and!51313 (not d!160941))
(check-sat b_and!51313 (not b_next!31881))
