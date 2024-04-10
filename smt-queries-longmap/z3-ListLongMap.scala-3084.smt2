; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43398 () Bool)

(assert start!43398)

(declare-fun b_free!12225 () Bool)

(declare-fun b_next!12225 () Bool)

(assert (=> start!43398 (= b_free!12225 (not b_next!12225))))

(declare-fun tp!42951 () Bool)

(declare-fun b_and!20981 () Bool)

(assert (=> start!43398 (= tp!42951 b_and!20981)))

(declare-fun res!286781 () Bool)

(declare-fun e!282961 () Bool)

(assert (=> start!43398 (=> (not res!286781) (not e!282961))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43398 (= res!286781 (validMask!0 mask!2352))))

(assert (=> start!43398 e!282961))

(assert (=> start!43398 true))

(declare-fun tp_is_empty!13737 () Bool)

(assert (=> start!43398 tp_is_empty!13737))

(declare-datatypes ((V!19387 0))(
  ( (V!19388 (val!6916 Int)) )
))
(declare-datatypes ((ValueCell!6507 0))(
  ( (ValueCellFull!6507 (v!9207 V!19387)) (EmptyCell!6507) )
))
(declare-datatypes ((array!31135 0))(
  ( (array!31136 (arr!14972 (Array (_ BitVec 32) ValueCell!6507)) (size!15330 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31135)

(declare-fun e!282962 () Bool)

(declare-fun array_inv!10798 (array!31135) Bool)

(assert (=> start!43398 (and (array_inv!10798 _values!1516) e!282962)))

(assert (=> start!43398 tp!42951))

(declare-datatypes ((array!31137 0))(
  ( (array!31138 (arr!14973 (Array (_ BitVec 32) (_ BitVec 64))) (size!15331 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31137)

(declare-fun array_inv!10799 (array!31137) Bool)

(assert (=> start!43398 (array_inv!10799 _keys!1874)))

(declare-fun lt!218262 () (_ BitVec 32))

(declare-fun b!480924 () Bool)

(assert (=> b!480924 (= e!282961 (not (or (not (= (size!15331 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsge lt!218262 #b00000000000000000000000000000000))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31137 (_ BitVec 32)) Bool)

(assert (=> b!480924 (arrayForallSeekEntryOrOpenFound!0 lt!218262 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14104 0))(
  ( (Unit!14105) )
))
(declare-fun lt!218263 () Unit!14104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14104)

(assert (=> b!480924 (= lt!218263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218262))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31137 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480924 (= lt!218262 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!282963 () Bool)

(assert (=> b!480924 e!282963))

(declare-fun c!57823 () Bool)

(assert (=> b!480924 (= c!57823 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218261 () Unit!14104)

(declare-fun minValue!1458 () V!19387)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19387)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!125 (array!31137 array!31135 (_ BitVec 32) (_ BitVec 32) V!19387 V!19387 (_ BitVec 64) Int) Unit!14104)

(assert (=> b!480924 (= lt!218261 (lemmaKeyInListMapIsInArray!125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480925 () Bool)

(declare-fun e!282958 () Bool)

(assert (=> b!480925 (= e!282958 tp_is_empty!13737)))

(declare-fun mapNonEmpty!22309 () Bool)

(declare-fun mapRes!22309 () Bool)

(declare-fun tp!42952 () Bool)

(declare-fun e!282960 () Bool)

(assert (=> mapNonEmpty!22309 (= mapRes!22309 (and tp!42952 e!282960))))

(declare-fun mapRest!22309 () (Array (_ BitVec 32) ValueCell!6507))

(declare-fun mapKey!22309 () (_ BitVec 32))

(declare-fun mapValue!22309 () ValueCell!6507)

(assert (=> mapNonEmpty!22309 (= (arr!14972 _values!1516) (store mapRest!22309 mapKey!22309 mapValue!22309))))

(declare-fun b!480926 () Bool)

(declare-fun res!286780 () Bool)

(assert (=> b!480926 (=> (not res!286780) (not e!282961))))

(assert (=> b!480926 (= res!286780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480927 () Bool)

(declare-fun res!286784 () Bool)

(assert (=> b!480927 (=> (not res!286784) (not e!282961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480927 (= res!286784 (validKeyInArray!0 k0!1332))))

(declare-fun b!480928 () Bool)

(declare-fun res!286782 () Bool)

(assert (=> b!480928 (=> (not res!286782) (not e!282961))))

(declare-datatypes ((List!9152 0))(
  ( (Nil!9149) (Cons!9148 (h!10004 (_ BitVec 64)) (t!15362 List!9152)) )
))
(declare-fun arrayNoDuplicates!0 (array!31137 (_ BitVec 32) List!9152) Bool)

(assert (=> b!480928 (= res!286782 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9149))))

(declare-fun b!480929 () Bool)

(assert (=> b!480929 (= e!282963 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22309 () Bool)

(assert (=> mapIsEmpty!22309 mapRes!22309))

(declare-fun b!480930 () Bool)

(assert (=> b!480930 (= e!282960 tp_is_empty!13737)))

(declare-fun b!480931 () Bool)

(declare-fun arrayContainsKey!0 (array!31137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480931 (= e!282963 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480932 () Bool)

(declare-fun res!286785 () Bool)

(assert (=> b!480932 (=> (not res!286785) (not e!282961))))

(assert (=> b!480932 (= res!286785 (and (= (size!15330 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15331 _keys!1874) (size!15330 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480933 () Bool)

(declare-fun res!286783 () Bool)

(assert (=> b!480933 (=> (not res!286783) (not e!282961))))

(declare-datatypes ((tuple2!9074 0))(
  ( (tuple2!9075 (_1!4548 (_ BitVec 64)) (_2!4548 V!19387)) )
))
(declare-datatypes ((List!9153 0))(
  ( (Nil!9150) (Cons!9149 (h!10005 tuple2!9074) (t!15363 List!9153)) )
))
(declare-datatypes ((ListLongMap!7987 0))(
  ( (ListLongMap!7988 (toList!4009 List!9153)) )
))
(declare-fun contains!2621 (ListLongMap!7987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2328 (array!31137 array!31135 (_ BitVec 32) (_ BitVec 32) V!19387 V!19387 (_ BitVec 32) Int) ListLongMap!7987)

(assert (=> b!480933 (= res!286783 (contains!2621 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480934 () Bool)

(assert (=> b!480934 (= e!282962 (and e!282958 mapRes!22309))))

(declare-fun condMapEmpty!22309 () Bool)

(declare-fun mapDefault!22309 () ValueCell!6507)

(assert (=> b!480934 (= condMapEmpty!22309 (= (arr!14972 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6507)) mapDefault!22309)))))

(assert (= (and start!43398 res!286781) b!480932))

(assert (= (and b!480932 res!286785) b!480926))

(assert (= (and b!480926 res!286780) b!480928))

(assert (= (and b!480928 res!286782) b!480933))

(assert (= (and b!480933 res!286783) b!480927))

(assert (= (and b!480927 res!286784) b!480924))

(assert (= (and b!480924 c!57823) b!480931))

(assert (= (and b!480924 (not c!57823)) b!480929))

(assert (= (and b!480934 condMapEmpty!22309) mapIsEmpty!22309))

(assert (= (and b!480934 (not condMapEmpty!22309)) mapNonEmpty!22309))

(get-info :version)

(assert (= (and mapNonEmpty!22309 ((_ is ValueCellFull!6507) mapValue!22309)) b!480930))

(assert (= (and b!480934 ((_ is ValueCellFull!6507) mapDefault!22309)) b!480925))

(assert (= start!43398 b!480934))

(declare-fun m!462471 () Bool)

(assert (=> b!480927 m!462471))

(declare-fun m!462473 () Bool)

(assert (=> b!480931 m!462473))

(declare-fun m!462475 () Bool)

(assert (=> b!480928 m!462475))

(declare-fun m!462477 () Bool)

(assert (=> start!43398 m!462477))

(declare-fun m!462479 () Bool)

(assert (=> start!43398 m!462479))

(declare-fun m!462481 () Bool)

(assert (=> start!43398 m!462481))

(declare-fun m!462483 () Bool)

(assert (=> mapNonEmpty!22309 m!462483))

(declare-fun m!462485 () Bool)

(assert (=> b!480924 m!462485))

(declare-fun m!462487 () Bool)

(assert (=> b!480924 m!462487))

(declare-fun m!462489 () Bool)

(assert (=> b!480924 m!462489))

(declare-fun m!462491 () Bool)

(assert (=> b!480924 m!462491))

(declare-fun m!462493 () Bool)

(assert (=> b!480926 m!462493))

(declare-fun m!462495 () Bool)

(assert (=> b!480933 m!462495))

(assert (=> b!480933 m!462495))

(declare-fun m!462497 () Bool)

(assert (=> b!480933 m!462497))

(check-sat (not mapNonEmpty!22309) (not b!480927) (not b_next!12225) tp_is_empty!13737 (not b!480928) (not b!480926) b_and!20981 (not b!480924) (not start!43398) (not b!480933) (not b!480931))
(check-sat b_and!20981 (not b_next!12225))
(get-model)

(declare-fun d!76741 () Bool)

(declare-fun res!286808 () Bool)

(declare-fun e!282986 () Bool)

(assert (=> d!76741 (=> res!286808 e!282986)))

(assert (=> d!76741 (= res!286808 (= (select (arr!14973 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76741 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282986)))

(declare-fun b!480972 () Bool)

(declare-fun e!282987 () Bool)

(assert (=> b!480972 (= e!282986 e!282987)))

(declare-fun res!286809 () Bool)

(assert (=> b!480972 (=> (not res!286809) (not e!282987))))

(assert (=> b!480972 (= res!286809 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15331 _keys!1874)))))

(declare-fun b!480973 () Bool)

(assert (=> b!480973 (= e!282987 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76741 (not res!286808)) b!480972))

(assert (= (and b!480972 res!286809) b!480973))

(declare-fun m!462527 () Bool)

(assert (=> d!76741 m!462527))

(declare-fun m!462529 () Bool)

(assert (=> b!480973 m!462529))

(assert (=> b!480931 d!76741))

(declare-fun d!76743 () Bool)

(assert (=> d!76743 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480927 d!76743))

(declare-fun b!480982 () Bool)

(declare-fun e!282995 () Bool)

(declare-fun e!282994 () Bool)

(assert (=> b!480982 (= e!282995 e!282994)))

(declare-fun lt!218281 () (_ BitVec 64))

(assert (=> b!480982 (= lt!218281 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218279 () Unit!14104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31137 (_ BitVec 64) (_ BitVec 32)) Unit!14104)

(assert (=> b!480982 (= lt!218279 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218281 #b00000000000000000000000000000000))))

(assert (=> b!480982 (arrayContainsKey!0 _keys!1874 lt!218281 #b00000000000000000000000000000000)))

(declare-fun lt!218280 () Unit!14104)

(assert (=> b!480982 (= lt!218280 lt!218279)))

(declare-fun res!286814 () Bool)

(declare-datatypes ((SeekEntryResult!3570 0))(
  ( (MissingZero!3570 (index!16459 (_ BitVec 32))) (Found!3570 (index!16460 (_ BitVec 32))) (Intermediate!3570 (undefined!4382 Bool) (index!16461 (_ BitVec 32)) (x!45176 (_ BitVec 32))) (Undefined!3570) (MissingVacant!3570 (index!16462 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31137 (_ BitVec 32)) SeekEntryResult!3570)

(assert (=> b!480982 (= res!286814 (= (seekEntryOrOpen!0 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3570 #b00000000000000000000000000000000)))))

(assert (=> b!480982 (=> (not res!286814) (not e!282994))))

(declare-fun b!480983 () Bool)

(declare-fun e!282996 () Bool)

(assert (=> b!480983 (= e!282996 e!282995)))

(declare-fun c!57829 () Bool)

(assert (=> b!480983 (= c!57829 (validKeyInArray!0 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76745 () Bool)

(declare-fun res!286815 () Bool)

(assert (=> d!76745 (=> res!286815 e!282996)))

(assert (=> d!76745 (= res!286815 (bvsge #b00000000000000000000000000000000 (size!15331 _keys!1874)))))

(assert (=> d!76745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282996)))

(declare-fun bm!30901 () Bool)

(declare-fun call!30904 () Bool)

(assert (=> bm!30901 (= call!30904 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!480984 () Bool)

(assert (=> b!480984 (= e!282994 call!30904)))

(declare-fun b!480985 () Bool)

(assert (=> b!480985 (= e!282995 call!30904)))

(assert (= (and d!76745 (not res!286815)) b!480983))

(assert (= (and b!480983 c!57829) b!480982))

(assert (= (and b!480983 (not c!57829)) b!480985))

(assert (= (and b!480982 res!286814) b!480984))

(assert (= (or b!480984 b!480985) bm!30901))

(assert (=> b!480982 m!462527))

(declare-fun m!462531 () Bool)

(assert (=> b!480982 m!462531))

(declare-fun m!462533 () Bool)

(assert (=> b!480982 m!462533))

(assert (=> b!480982 m!462527))

(declare-fun m!462535 () Bool)

(assert (=> b!480982 m!462535))

(assert (=> b!480983 m!462527))

(assert (=> b!480983 m!462527))

(declare-fun m!462537 () Bool)

(assert (=> b!480983 m!462537))

(declare-fun m!462539 () Bool)

(assert (=> bm!30901 m!462539))

(assert (=> b!480926 d!76745))

(declare-fun b!480996 () Bool)

(declare-fun e!283005 () Bool)

(declare-fun e!283006 () Bool)

(assert (=> b!480996 (= e!283005 e!283006)))

(declare-fun res!286823 () Bool)

(assert (=> b!480996 (=> (not res!286823) (not e!283006))))

(declare-fun e!283007 () Bool)

(assert (=> b!480996 (= res!286823 (not e!283007))))

(declare-fun res!286822 () Bool)

(assert (=> b!480996 (=> (not res!286822) (not e!283007))))

(assert (=> b!480996 (= res!286822 (validKeyInArray!0 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480997 () Bool)

(declare-fun contains!2622 (List!9152 (_ BitVec 64)) Bool)

(assert (=> b!480997 (= e!283007 (contains!2622 Nil!9149 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480998 () Bool)

(declare-fun e!283008 () Bool)

(declare-fun call!30907 () Bool)

(assert (=> b!480998 (= e!283008 call!30907)))

(declare-fun b!480999 () Bool)

(assert (=> b!480999 (= e!283006 e!283008)))

(declare-fun c!57832 () Bool)

(assert (=> b!480999 (= c!57832 (validKeyInArray!0 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30904 () Bool)

(assert (=> bm!30904 (= call!30907 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57832 (Cons!9148 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000) Nil!9149) Nil!9149)))))

(declare-fun d!76747 () Bool)

(declare-fun res!286824 () Bool)

(assert (=> d!76747 (=> res!286824 e!283005)))

(assert (=> d!76747 (= res!286824 (bvsge #b00000000000000000000000000000000 (size!15331 _keys!1874)))))

(assert (=> d!76747 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9149) e!283005)))

(declare-fun b!481000 () Bool)

(assert (=> b!481000 (= e!283008 call!30907)))

(assert (= (and d!76747 (not res!286824)) b!480996))

(assert (= (and b!480996 res!286822) b!480997))

(assert (= (and b!480996 res!286823) b!480999))

(assert (= (and b!480999 c!57832) b!481000))

(assert (= (and b!480999 (not c!57832)) b!480998))

(assert (= (or b!481000 b!480998) bm!30904))

(assert (=> b!480996 m!462527))

(assert (=> b!480996 m!462527))

(assert (=> b!480996 m!462537))

(assert (=> b!480997 m!462527))

(assert (=> b!480997 m!462527))

(declare-fun m!462541 () Bool)

(assert (=> b!480997 m!462541))

(assert (=> b!480999 m!462527))

(assert (=> b!480999 m!462527))

(assert (=> b!480999 m!462537))

(assert (=> bm!30904 m!462527))

(declare-fun m!462543 () Bool)

(assert (=> bm!30904 m!462543))

(assert (=> b!480928 d!76747))

(declare-fun b!481001 () Bool)

(declare-fun e!283010 () Bool)

(declare-fun e!283009 () Bool)

(assert (=> b!481001 (= e!283010 e!283009)))

(declare-fun lt!218284 () (_ BitVec 64))

(assert (=> b!481001 (= lt!218284 (select (arr!14973 _keys!1874) lt!218262))))

(declare-fun lt!218282 () Unit!14104)

(assert (=> b!481001 (= lt!218282 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218284 lt!218262))))

(assert (=> b!481001 (arrayContainsKey!0 _keys!1874 lt!218284 #b00000000000000000000000000000000)))

(declare-fun lt!218283 () Unit!14104)

(assert (=> b!481001 (= lt!218283 lt!218282)))

(declare-fun res!286825 () Bool)

(assert (=> b!481001 (= res!286825 (= (seekEntryOrOpen!0 (select (arr!14973 _keys!1874) lt!218262) _keys!1874 mask!2352) (Found!3570 lt!218262)))))

(assert (=> b!481001 (=> (not res!286825) (not e!283009))))

(declare-fun b!481002 () Bool)

(declare-fun e!283011 () Bool)

(assert (=> b!481002 (= e!283011 e!283010)))

(declare-fun c!57833 () Bool)

(assert (=> b!481002 (= c!57833 (validKeyInArray!0 (select (arr!14973 _keys!1874) lt!218262)))))

(declare-fun d!76749 () Bool)

(declare-fun res!286826 () Bool)

(assert (=> d!76749 (=> res!286826 e!283011)))

(assert (=> d!76749 (= res!286826 (bvsge lt!218262 (size!15331 _keys!1874)))))

(assert (=> d!76749 (= (arrayForallSeekEntryOrOpenFound!0 lt!218262 _keys!1874 mask!2352) e!283011)))

(declare-fun call!30908 () Bool)

(declare-fun bm!30905 () Bool)

(assert (=> bm!30905 (= call!30908 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218262 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!481003 () Bool)

(assert (=> b!481003 (= e!283009 call!30908)))

(declare-fun b!481004 () Bool)

(assert (=> b!481004 (= e!283010 call!30908)))

(assert (= (and d!76749 (not res!286826)) b!481002))

(assert (= (and b!481002 c!57833) b!481001))

(assert (= (and b!481002 (not c!57833)) b!481004))

(assert (= (and b!481001 res!286825) b!481003))

(assert (= (or b!481003 b!481004) bm!30905))

(declare-fun m!462545 () Bool)

(assert (=> b!481001 m!462545))

(declare-fun m!462547 () Bool)

(assert (=> b!481001 m!462547))

(declare-fun m!462549 () Bool)

(assert (=> b!481001 m!462549))

(assert (=> b!481001 m!462545))

(declare-fun m!462551 () Bool)

(assert (=> b!481001 m!462551))

(assert (=> b!481002 m!462545))

(assert (=> b!481002 m!462545))

(declare-fun m!462553 () Bool)

(assert (=> b!481002 m!462553))

(declare-fun m!462555 () Bool)

(assert (=> bm!30905 m!462555))

(assert (=> b!480924 d!76749))

(declare-fun d!76751 () Bool)

(assert (=> d!76751 (arrayForallSeekEntryOrOpenFound!0 lt!218262 _keys!1874 mask!2352)))

(declare-fun lt!218287 () Unit!14104)

(declare-fun choose!38 (array!31137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14104)

(assert (=> d!76751 (= lt!218287 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218262))))

(assert (=> d!76751 (validMask!0 mask!2352)))

(assert (=> d!76751 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218262) lt!218287)))

(declare-fun bs!15300 () Bool)

(assert (= bs!15300 d!76751))

(assert (=> bs!15300 m!462485))

(declare-fun m!462557 () Bool)

(assert (=> bs!15300 m!462557))

(assert (=> bs!15300 m!462477))

(assert (=> b!480924 d!76751))

(declare-fun d!76753 () Bool)

(declare-fun lt!218290 () (_ BitVec 32))

(assert (=> d!76753 (and (or (bvslt lt!218290 #b00000000000000000000000000000000) (bvsge lt!218290 (size!15331 _keys!1874)) (and (bvsge lt!218290 #b00000000000000000000000000000000) (bvslt lt!218290 (size!15331 _keys!1874)))) (bvsge lt!218290 #b00000000000000000000000000000000) (bvslt lt!218290 (size!15331 _keys!1874)) (= (select (arr!14973 _keys!1874) lt!218290) k0!1332))))

(declare-fun e!283014 () (_ BitVec 32))

(assert (=> d!76753 (= lt!218290 e!283014)))

(declare-fun c!57836 () Bool)

(assert (=> d!76753 (= c!57836 (= (select (arr!14973 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15331 _keys!1874)) (bvslt (size!15331 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76753 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218290)))

(declare-fun b!481009 () Bool)

(assert (=> b!481009 (= e!283014 #b00000000000000000000000000000000)))

(declare-fun b!481010 () Bool)

(assert (=> b!481010 (= e!283014 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76753 c!57836) b!481009))

(assert (= (and d!76753 (not c!57836)) b!481010))

(declare-fun m!462559 () Bool)

(assert (=> d!76753 m!462559))

(assert (=> d!76753 m!462527))

(declare-fun m!462561 () Bool)

(assert (=> b!481010 m!462561))

(assert (=> b!480924 d!76753))

(declare-fun d!76755 () Bool)

(declare-fun e!283017 () Bool)

(assert (=> d!76755 e!283017))

(declare-fun c!57839 () Bool)

(assert (=> d!76755 (= c!57839 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218293 () Unit!14104)

(declare-fun choose!1376 (array!31137 array!31135 (_ BitVec 32) (_ BitVec 32) V!19387 V!19387 (_ BitVec 64) Int) Unit!14104)

(assert (=> d!76755 (= lt!218293 (choose!1376 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76755 (validMask!0 mask!2352)))

(assert (=> d!76755 (= (lemmaKeyInListMapIsInArray!125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218293)))

(declare-fun b!481015 () Bool)

(assert (=> b!481015 (= e!283017 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481016 () Bool)

(assert (=> b!481016 (= e!283017 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76755 c!57839) b!481015))

(assert (= (and d!76755 (not c!57839)) b!481016))

(declare-fun m!462563 () Bool)

(assert (=> d!76755 m!462563))

(assert (=> d!76755 m!462477))

(assert (=> b!481015 m!462473))

(assert (=> b!480924 d!76755))

(declare-fun d!76757 () Bool)

(declare-fun e!283023 () Bool)

(assert (=> d!76757 e!283023))

(declare-fun res!286829 () Bool)

(assert (=> d!76757 (=> res!286829 e!283023)))

(declare-fun lt!218302 () Bool)

(assert (=> d!76757 (= res!286829 (not lt!218302))))

(declare-fun lt!218303 () Bool)

(assert (=> d!76757 (= lt!218302 lt!218303)))

(declare-fun lt!218305 () Unit!14104)

(declare-fun e!283022 () Unit!14104)

(assert (=> d!76757 (= lt!218305 e!283022)))

(declare-fun c!57842 () Bool)

(assert (=> d!76757 (= c!57842 lt!218303)))

(declare-fun containsKey!356 (List!9153 (_ BitVec 64)) Bool)

(assert (=> d!76757 (= lt!218303 (containsKey!356 (toList!4009 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76757 (= (contains!2621 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218302)))

(declare-fun b!481023 () Bool)

(declare-fun lt!218304 () Unit!14104)

(assert (=> b!481023 (= e!283022 lt!218304)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!304 (List!9153 (_ BitVec 64)) Unit!14104)

(assert (=> b!481023 (= lt!218304 (lemmaContainsKeyImpliesGetValueByKeyDefined!304 (toList!4009 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!400 0))(
  ( (Some!399 (v!9209 V!19387)) (None!398) )
))
(declare-fun isDefined!305 (Option!400) Bool)

(declare-fun getValueByKey!394 (List!9153 (_ BitVec 64)) Option!400)

(assert (=> b!481023 (isDefined!305 (getValueByKey!394 (toList!4009 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!481024 () Bool)

(declare-fun Unit!14106 () Unit!14104)

(assert (=> b!481024 (= e!283022 Unit!14106)))

(declare-fun b!481025 () Bool)

(assert (=> b!481025 (= e!283023 (isDefined!305 (getValueByKey!394 (toList!4009 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76757 c!57842) b!481023))

(assert (= (and d!76757 (not c!57842)) b!481024))

(assert (= (and d!76757 (not res!286829)) b!481025))

(declare-fun m!462565 () Bool)

(assert (=> d!76757 m!462565))

(declare-fun m!462567 () Bool)

(assert (=> b!481023 m!462567))

(declare-fun m!462569 () Bool)

(assert (=> b!481023 m!462569))

(assert (=> b!481023 m!462569))

(declare-fun m!462571 () Bool)

(assert (=> b!481023 m!462571))

(assert (=> b!481025 m!462569))

(assert (=> b!481025 m!462569))

(assert (=> b!481025 m!462571))

(assert (=> b!480933 d!76757))

(declare-fun b!481068 () Bool)

(declare-fun e!283050 () ListLongMap!7987)

(declare-fun call!30928 () ListLongMap!7987)

(assert (=> b!481068 (= e!283050 call!30928)))

(declare-fun b!481069 () Bool)

(declare-fun e!283058 () Unit!14104)

(declare-fun Unit!14107 () Unit!14104)

(assert (=> b!481069 (= e!283058 Unit!14107)))

(declare-fun b!481070 () Bool)

(declare-fun e!283059 () ListLongMap!7987)

(declare-fun call!30925 () ListLongMap!7987)

(declare-fun +!1773 (ListLongMap!7987 tuple2!9074) ListLongMap!7987)

(assert (=> b!481070 (= e!283059 (+!1773 call!30925 (tuple2!9075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!481071 () Bool)

(declare-fun c!57859 () Bool)

(assert (=> b!481071 (= c!57859 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!283055 () ListLongMap!7987)

(assert (=> b!481071 (= e!283050 e!283055)))

(declare-fun b!481072 () Bool)

(declare-fun e!283053 () Bool)

(declare-fun e!283060 () Bool)

(assert (=> b!481072 (= e!283053 e!283060)))

(declare-fun c!57857 () Bool)

(assert (=> b!481072 (= c!57857 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!481073 () Bool)

(declare-fun e!283052 () Bool)

(declare-fun lt!218351 () ListLongMap!7987)

(declare-fun apply!341 (ListLongMap!7987 (_ BitVec 64)) V!19387)

(assert (=> b!481073 (= e!283052 (= (apply!341 lt!218351 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!481074 () Bool)

(declare-fun e!283061 () Bool)

(declare-fun get!7258 (ValueCell!6507 V!19387) V!19387)

(declare-fun dynLambda!952 (Int (_ BitVec 64)) V!19387)

(assert (=> b!481074 (= e!283061 (= (apply!341 lt!218351 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)) (get!7258 (select (arr!14972 _values!1516) #b00000000000000000000000000000000) (dynLambda!952 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!481074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15330 _values!1516)))))

(assert (=> b!481074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15331 _keys!1874)))))

(declare-fun call!30926 () ListLongMap!7987)

(declare-fun bm!30920 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2110 (array!31137 array!31135 (_ BitVec 32) (_ BitVec 32) V!19387 V!19387 (_ BitVec 32) Int) ListLongMap!7987)

(assert (=> bm!30920 (= call!30926 (getCurrentListMapNoExtraKeys!2110 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!481075 () Bool)

(declare-fun e!283056 () Bool)

(assert (=> b!481075 (= e!283060 e!283056)))

(declare-fun res!286854 () Bool)

(declare-fun call!30927 () Bool)

(assert (=> b!481075 (= res!286854 call!30927)))

(assert (=> b!481075 (=> (not res!286854) (not e!283056))))

(declare-fun d!76759 () Bool)

(assert (=> d!76759 e!283053))

(declare-fun res!286852 () Bool)

(assert (=> d!76759 (=> (not res!286852) (not e!283053))))

(assert (=> d!76759 (= res!286852 (or (bvsge #b00000000000000000000000000000000 (size!15331 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15331 _keys!1874)))))))

(declare-fun lt!218363 () ListLongMap!7987)

(assert (=> d!76759 (= lt!218351 lt!218363)))

(declare-fun lt!218370 () Unit!14104)

(assert (=> d!76759 (= lt!218370 e!283058)))

(declare-fun c!57860 () Bool)

(declare-fun e!283062 () Bool)

(assert (=> d!76759 (= c!57860 e!283062)))

(declare-fun res!286850 () Bool)

(assert (=> d!76759 (=> (not res!286850) (not e!283062))))

(assert (=> d!76759 (= res!286850 (bvslt #b00000000000000000000000000000000 (size!15331 _keys!1874)))))

(assert (=> d!76759 (= lt!218363 e!283059)))

(declare-fun c!57856 () Bool)

(assert (=> d!76759 (= c!57856 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76759 (validMask!0 mask!2352)))

(assert (=> d!76759 (= (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218351)))

(declare-fun bm!30921 () Bool)

(assert (=> bm!30921 (= call!30927 (contains!2621 lt!218351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30922 () Bool)

(assert (=> bm!30922 (= call!30928 call!30925)))

(declare-fun b!481076 () Bool)

(declare-fun e!283057 () Bool)

(declare-fun call!30929 () Bool)

(assert (=> b!481076 (= e!283057 (not call!30929))))

(declare-fun b!481077 () Bool)

(assert (=> b!481077 (= e!283059 e!283050)))

(declare-fun c!57855 () Bool)

(assert (=> b!481077 (= c!57855 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30923 () Bool)

(declare-fun call!30923 () ListLongMap!7987)

(declare-fun call!30924 () ListLongMap!7987)

(assert (=> bm!30923 (= call!30923 call!30924)))

(declare-fun b!481078 () Bool)

(assert (=> b!481078 (= e!283060 (not call!30927))))

(declare-fun b!481079 () Bool)

(declare-fun res!286851 () Bool)

(assert (=> b!481079 (=> (not res!286851) (not e!283053))))

(declare-fun e!283051 () Bool)

(assert (=> b!481079 (= res!286851 e!283051)))

(declare-fun res!286849 () Bool)

(assert (=> b!481079 (=> res!286849 e!283051)))

(declare-fun e!283054 () Bool)

(assert (=> b!481079 (= res!286849 (not e!283054))))

(declare-fun res!286855 () Bool)

(assert (=> b!481079 (=> (not res!286855) (not e!283054))))

(assert (=> b!481079 (= res!286855 (bvslt #b00000000000000000000000000000000 (size!15331 _keys!1874)))))

(declare-fun bm!30924 () Bool)

(assert (=> bm!30924 (= call!30925 (+!1773 (ite c!57856 call!30926 (ite c!57855 call!30924 call!30923)) (ite (or c!57856 c!57855) (tuple2!9075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!481080 () Bool)

(assert (=> b!481080 (= e!283055 call!30923)))

(declare-fun b!481081 () Bool)

(assert (=> b!481081 (= e!283057 e!283052)))

(declare-fun res!286853 () Bool)

(assert (=> b!481081 (= res!286853 call!30929)))

(assert (=> b!481081 (=> (not res!286853) (not e!283052))))

(declare-fun b!481082 () Bool)

(assert (=> b!481082 (= e!283062 (validKeyInArray!0 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481083 () Bool)

(assert (=> b!481083 (= e!283056 (= (apply!341 lt!218351 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!481084 () Bool)

(assert (=> b!481084 (= e!283054 (validKeyInArray!0 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481085 () Bool)

(declare-fun lt!218354 () Unit!14104)

(assert (=> b!481085 (= e!283058 lt!218354)))

(declare-fun lt!218358 () ListLongMap!7987)

(assert (=> b!481085 (= lt!218358 (getCurrentListMapNoExtraKeys!2110 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218364 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218364 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218350 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218350 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218361 () Unit!14104)

(declare-fun addStillContains!299 (ListLongMap!7987 (_ BitVec 64) V!19387 (_ BitVec 64)) Unit!14104)

(assert (=> b!481085 (= lt!218361 (addStillContains!299 lt!218358 lt!218364 zeroValue!1458 lt!218350))))

(assert (=> b!481085 (contains!2621 (+!1773 lt!218358 (tuple2!9075 lt!218364 zeroValue!1458)) lt!218350)))

(declare-fun lt!218366 () Unit!14104)

(assert (=> b!481085 (= lt!218366 lt!218361)))

(declare-fun lt!218355 () ListLongMap!7987)

(assert (=> b!481085 (= lt!218355 (getCurrentListMapNoExtraKeys!2110 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218353 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218353 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218352 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218352 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218368 () Unit!14104)

(declare-fun addApplyDifferent!299 (ListLongMap!7987 (_ BitVec 64) V!19387 (_ BitVec 64)) Unit!14104)

(assert (=> b!481085 (= lt!218368 (addApplyDifferent!299 lt!218355 lt!218353 minValue!1458 lt!218352))))

(assert (=> b!481085 (= (apply!341 (+!1773 lt!218355 (tuple2!9075 lt!218353 minValue!1458)) lt!218352) (apply!341 lt!218355 lt!218352))))

(declare-fun lt!218365 () Unit!14104)

(assert (=> b!481085 (= lt!218365 lt!218368)))

(declare-fun lt!218369 () ListLongMap!7987)

(assert (=> b!481085 (= lt!218369 (getCurrentListMapNoExtraKeys!2110 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218360 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218356 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218356 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218357 () Unit!14104)

(assert (=> b!481085 (= lt!218357 (addApplyDifferent!299 lt!218369 lt!218360 zeroValue!1458 lt!218356))))

(assert (=> b!481085 (= (apply!341 (+!1773 lt!218369 (tuple2!9075 lt!218360 zeroValue!1458)) lt!218356) (apply!341 lt!218369 lt!218356))))

(declare-fun lt!218367 () Unit!14104)

(assert (=> b!481085 (= lt!218367 lt!218357)))

(declare-fun lt!218359 () ListLongMap!7987)

(assert (=> b!481085 (= lt!218359 (getCurrentListMapNoExtraKeys!2110 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218371 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218362 () (_ BitVec 64))

(assert (=> b!481085 (= lt!218362 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!481085 (= lt!218354 (addApplyDifferent!299 lt!218359 lt!218371 minValue!1458 lt!218362))))

(assert (=> b!481085 (= (apply!341 (+!1773 lt!218359 (tuple2!9075 lt!218371 minValue!1458)) lt!218362) (apply!341 lt!218359 lt!218362))))

(declare-fun bm!30925 () Bool)

(assert (=> bm!30925 (= call!30924 call!30926)))

(declare-fun b!481086 () Bool)

(assert (=> b!481086 (= e!283051 e!283061)))

(declare-fun res!286848 () Bool)

(assert (=> b!481086 (=> (not res!286848) (not e!283061))))

(assert (=> b!481086 (= res!286848 (contains!2621 lt!218351 (select (arr!14973 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!481086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15331 _keys!1874)))))

(declare-fun bm!30926 () Bool)

(assert (=> bm!30926 (= call!30929 (contains!2621 lt!218351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481087 () Bool)

(assert (=> b!481087 (= e!283055 call!30928)))

(declare-fun b!481088 () Bool)

(declare-fun res!286856 () Bool)

(assert (=> b!481088 (=> (not res!286856) (not e!283053))))

(assert (=> b!481088 (= res!286856 e!283057)))

(declare-fun c!57858 () Bool)

(assert (=> b!481088 (= c!57858 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!76759 c!57856) b!481070))

(assert (= (and d!76759 (not c!57856)) b!481077))

(assert (= (and b!481077 c!57855) b!481068))

(assert (= (and b!481077 (not c!57855)) b!481071))

(assert (= (and b!481071 c!57859) b!481087))

(assert (= (and b!481071 (not c!57859)) b!481080))

(assert (= (or b!481087 b!481080) bm!30923))

(assert (= (or b!481068 bm!30923) bm!30925))

(assert (= (or b!481068 b!481087) bm!30922))

(assert (= (or b!481070 bm!30925) bm!30920))

(assert (= (or b!481070 bm!30922) bm!30924))

(assert (= (and d!76759 res!286850) b!481082))

(assert (= (and d!76759 c!57860) b!481085))

(assert (= (and d!76759 (not c!57860)) b!481069))

(assert (= (and d!76759 res!286852) b!481079))

(assert (= (and b!481079 res!286855) b!481084))

(assert (= (and b!481079 (not res!286849)) b!481086))

(assert (= (and b!481086 res!286848) b!481074))

(assert (= (and b!481079 res!286851) b!481088))

(assert (= (and b!481088 c!57858) b!481081))

(assert (= (and b!481088 (not c!57858)) b!481076))

(assert (= (and b!481081 res!286853) b!481073))

(assert (= (or b!481081 b!481076) bm!30926))

(assert (= (and b!481088 res!286856) b!481072))

(assert (= (and b!481072 c!57857) b!481075))

(assert (= (and b!481072 (not c!57857)) b!481078))

(assert (= (and b!481075 res!286854) b!481083))

(assert (= (or b!481075 b!481078) bm!30921))

(declare-fun b_lambda!10799 () Bool)

(assert (=> (not b_lambda!10799) (not b!481074)))

(declare-fun t!15365 () Bool)

(declare-fun tb!4163 () Bool)

(assert (=> (and start!43398 (= defaultEntry!1519 defaultEntry!1519) t!15365) tb!4163))

(declare-fun result!7757 () Bool)

(assert (=> tb!4163 (= result!7757 tp_is_empty!13737)))

(assert (=> b!481074 t!15365))

(declare-fun b_and!20985 () Bool)

(assert (= b_and!20981 (and (=> t!15365 result!7757) b_and!20985)))

(declare-fun m!462573 () Bool)

(assert (=> b!481083 m!462573))

(assert (=> b!481084 m!462527))

(assert (=> b!481084 m!462527))

(assert (=> b!481084 m!462537))

(declare-fun m!462575 () Bool)

(assert (=> bm!30921 m!462575))

(assert (=> d!76759 m!462477))

(assert (=> b!481086 m!462527))

(assert (=> b!481086 m!462527))

(declare-fun m!462577 () Bool)

(assert (=> b!481086 m!462577))

(assert (=> b!481082 m!462527))

(assert (=> b!481082 m!462527))

(assert (=> b!481082 m!462537))

(assert (=> b!481074 m!462527))

(declare-fun m!462579 () Bool)

(assert (=> b!481074 m!462579))

(declare-fun m!462581 () Bool)

(assert (=> b!481074 m!462581))

(declare-fun m!462583 () Bool)

(assert (=> b!481074 m!462583))

(assert (=> b!481074 m!462527))

(declare-fun m!462585 () Bool)

(assert (=> b!481074 m!462585))

(assert (=> b!481074 m!462581))

(assert (=> b!481074 m!462579))

(declare-fun m!462587 () Bool)

(assert (=> bm!30924 m!462587))

(declare-fun m!462589 () Bool)

(assert (=> bm!30920 m!462589))

(declare-fun m!462591 () Bool)

(assert (=> b!481085 m!462591))

(declare-fun m!462593 () Bool)

(assert (=> b!481085 m!462593))

(assert (=> b!481085 m!462589))

(declare-fun m!462595 () Bool)

(assert (=> b!481085 m!462595))

(declare-fun m!462597 () Bool)

(assert (=> b!481085 m!462597))

(declare-fun m!462599 () Bool)

(assert (=> b!481085 m!462599))

(declare-fun m!462601 () Bool)

(assert (=> b!481085 m!462601))

(declare-fun m!462603 () Bool)

(assert (=> b!481085 m!462603))

(declare-fun m!462605 () Bool)

(assert (=> b!481085 m!462605))

(declare-fun m!462607 () Bool)

(assert (=> b!481085 m!462607))

(assert (=> b!481085 m!462527))

(declare-fun m!462609 () Bool)

(assert (=> b!481085 m!462609))

(assert (=> b!481085 m!462599))

(declare-fun m!462611 () Bool)

(assert (=> b!481085 m!462611))

(declare-fun m!462613 () Bool)

(assert (=> b!481085 m!462613))

(declare-fun m!462615 () Bool)

(assert (=> b!481085 m!462615))

(assert (=> b!481085 m!462607))

(declare-fun m!462617 () Bool)

(assert (=> b!481085 m!462617))

(assert (=> b!481085 m!462595))

(assert (=> b!481085 m!462593))

(declare-fun m!462619 () Bool)

(assert (=> b!481085 m!462619))

(declare-fun m!462621 () Bool)

(assert (=> bm!30926 m!462621))

(declare-fun m!462623 () Bool)

(assert (=> b!481073 m!462623))

(declare-fun m!462625 () Bool)

(assert (=> b!481070 m!462625))

(assert (=> b!480933 d!76759))

(declare-fun d!76761 () Bool)

(assert (=> d!76761 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43398 d!76761))

(declare-fun d!76763 () Bool)

(assert (=> d!76763 (= (array_inv!10798 _values!1516) (bvsge (size!15330 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43398 d!76763))

(declare-fun d!76765 () Bool)

(assert (=> d!76765 (= (array_inv!10799 _keys!1874) (bvsge (size!15331 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43398 d!76765))

(declare-fun mapIsEmpty!22315 () Bool)

(declare-fun mapRes!22315 () Bool)

(assert (=> mapIsEmpty!22315 mapRes!22315))

(declare-fun mapNonEmpty!22315 () Bool)

(declare-fun tp!42961 () Bool)

(declare-fun e!283068 () Bool)

(assert (=> mapNonEmpty!22315 (= mapRes!22315 (and tp!42961 e!283068))))

(declare-fun mapValue!22315 () ValueCell!6507)

(declare-fun mapKey!22315 () (_ BitVec 32))

(declare-fun mapRest!22315 () (Array (_ BitVec 32) ValueCell!6507))

(assert (=> mapNonEmpty!22315 (= mapRest!22309 (store mapRest!22315 mapKey!22315 mapValue!22315))))

(declare-fun b!481098 () Bool)

(declare-fun e!283067 () Bool)

(assert (=> b!481098 (= e!283067 tp_is_empty!13737)))

(declare-fun b!481097 () Bool)

(assert (=> b!481097 (= e!283068 tp_is_empty!13737)))

(declare-fun condMapEmpty!22315 () Bool)

(declare-fun mapDefault!22315 () ValueCell!6507)

(assert (=> mapNonEmpty!22309 (= condMapEmpty!22315 (= mapRest!22309 ((as const (Array (_ BitVec 32) ValueCell!6507)) mapDefault!22315)))))

(assert (=> mapNonEmpty!22309 (= tp!42952 (and e!283067 mapRes!22315))))

(assert (= (and mapNonEmpty!22309 condMapEmpty!22315) mapIsEmpty!22315))

(assert (= (and mapNonEmpty!22309 (not condMapEmpty!22315)) mapNonEmpty!22315))

(assert (= (and mapNonEmpty!22315 ((_ is ValueCellFull!6507) mapValue!22315)) b!481097))

(assert (= (and mapNonEmpty!22309 ((_ is ValueCellFull!6507) mapDefault!22315)) b!481098))

(declare-fun m!462627 () Bool)

(assert (=> mapNonEmpty!22315 m!462627))

(declare-fun b_lambda!10801 () Bool)

(assert (= b_lambda!10799 (or (and start!43398 b_free!12225) b_lambda!10801)))

(check-sat (not b!481085) (not bm!30905) (not b!480997) (not b!481002) (not b!481010) (not bm!30926) (not b_lambda!10801) (not b!480983) (not b!481084) (not d!76751) (not bm!30904) (not b!481082) (not mapNonEmpty!22315) (not bm!30901) (not bm!30924) (not bm!30920) (not b!480982) (not b!480973) (not b!481023) (not b_next!12225) (not b!481015) (not b!480999) tp_is_empty!13737 (not b!481074) (not d!76757) (not bm!30921) (not b!481025) (not d!76755) (not b!480996) (not d!76759) (not b!481083) (not b!481070) (not b!481086) (not b!481073) (not b!481001) b_and!20985)
(check-sat b_and!20985 (not b_next!12225))
