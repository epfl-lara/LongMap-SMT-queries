; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34224 () Bool)

(assert start!34224)

(declare-fun b_free!7261 () Bool)

(declare-fun b_next!7261 () Bool)

(assert (=> start!34224 (= b_free!7261 (not b_next!7261))))

(declare-fun tp!25316 () Bool)

(declare-fun b_and!14475 () Bool)

(assert (=> start!34224 (= tp!25316 b_and!14475)))

(declare-fun mapIsEmpty!12246 () Bool)

(declare-fun mapRes!12246 () Bool)

(assert (=> mapIsEmpty!12246 mapRes!12246))

(declare-fun b!341608 () Bool)

(declare-fun res!188894 () Bool)

(declare-fun e!209491 () Bool)

(assert (=> b!341608 (=> (not res!188894) (not e!209491))))

(declare-datatypes ((array!18012 0))(
  ( (array!18013 (arr!8526 (Array (_ BitVec 32) (_ BitVec 64))) (size!8878 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18012)

(declare-datatypes ((List!4811 0))(
  ( (Nil!4808) (Cons!4807 (h!5663 (_ BitVec 64)) (t!9911 List!4811)) )
))
(declare-fun arrayNoDuplicates!0 (array!18012 (_ BitVec 32) List!4811) Bool)

(assert (=> b!341608 (= res!188894 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4808))))

(declare-fun mapNonEmpty!12246 () Bool)

(declare-fun tp!25317 () Bool)

(declare-fun e!209492 () Bool)

(assert (=> mapNonEmpty!12246 (= mapRes!12246 (and tp!25317 e!209492))))

(declare-datatypes ((V!10595 0))(
  ( (V!10596 (val!3651 Int)) )
))
(declare-datatypes ((ValueCell!3263 0))(
  ( (ValueCellFull!3263 (v!5824 V!10595)) (EmptyCell!3263) )
))
(declare-fun mapValue!12246 () ValueCell!3263)

(declare-datatypes ((array!18014 0))(
  ( (array!18015 (arr!8527 (Array (_ BitVec 32) ValueCell!3263)) (size!8879 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18014)

(declare-fun mapRest!12246 () (Array (_ BitVec 32) ValueCell!3263))

(declare-fun mapKey!12246 () (_ BitVec 32))

(assert (=> mapNonEmpty!12246 (= (arr!8527 _values!1525) (store mapRest!12246 mapKey!12246 mapValue!12246))))

(declare-fun b!341609 () Bool)

(declare-fun res!188897 () Bool)

(assert (=> b!341609 (=> (not res!188897) (not e!209491))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10595)

(declare-fun zeroValue!1467 () V!10595)

(declare-datatypes ((tuple2!5208 0))(
  ( (tuple2!5209 (_1!2615 (_ BitVec 64)) (_2!2615 V!10595)) )
))
(declare-datatypes ((List!4812 0))(
  ( (Nil!4809) (Cons!4808 (h!5664 tuple2!5208) (t!9912 List!4812)) )
))
(declare-datatypes ((ListLongMap!4123 0))(
  ( (ListLongMap!4124 (toList!2077 List!4812)) )
))
(declare-fun contains!2150 (ListLongMap!4123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1606 (array!18012 array!18014 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 32) Int) ListLongMap!4123)

(assert (=> b!341609 (= res!188897 (not (contains!2150 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341610 () Bool)

(declare-fun e!209488 () Bool)

(declare-fun tp_is_empty!7213 () Bool)

(assert (=> b!341610 (= e!209488 tp_is_empty!7213)))

(declare-fun b!341612 () Bool)

(declare-fun e!209489 () Bool)

(assert (=> b!341612 (= e!209489 (bvsge #b00000000000000000000000000000000 (size!8878 _keys!1895)))))

(declare-datatypes ((Unit!10584 0))(
  ( (Unit!10585) )
))
(declare-fun lt!161837 () Unit!10584)

(declare-fun e!209490 () Unit!10584)

(assert (=> b!341612 (= lt!161837 e!209490)))

(declare-fun c!52670 () Bool)

(declare-fun arrayContainsKey!0 (array!18012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341612 (= c!52670 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341613 () Bool)

(assert (=> b!341613 (= e!209491 e!209489)))

(declare-fun res!188893 () Bool)

(assert (=> b!341613 (=> (not res!188893) (not e!209489))))

(declare-datatypes ((SeekEntryResult!3247 0))(
  ( (MissingZero!3247 (index!15167 (_ BitVec 32))) (Found!3247 (index!15168 (_ BitVec 32))) (Intermediate!3247 (undefined!4059 Bool) (index!15169 (_ BitVec 32)) (x!33982 (_ BitVec 32))) (Undefined!3247) (MissingVacant!3247 (index!15170 (_ BitVec 32))) )
))
(declare-fun lt!161839 () SeekEntryResult!3247)

(get-info :version)

(assert (=> b!341613 (= res!188893 (and (not ((_ is Found!3247) lt!161839)) (not ((_ is MissingZero!3247) lt!161839)) ((_ is MissingVacant!3247) lt!161839)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18012 (_ BitVec 32)) SeekEntryResult!3247)

(assert (=> b!341613 (= lt!161839 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341614 () Bool)

(declare-fun res!188891 () Bool)

(assert (=> b!341614 (=> (not res!188891) (not e!209491))))

(assert (=> b!341614 (= res!188891 (and (= (size!8879 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8878 _keys!1895) (size!8879 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341615 () Bool)

(declare-fun res!188892 () Bool)

(assert (=> b!341615 (=> (not res!188892) (not e!209491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341615 (= res!188892 (validKeyInArray!0 k0!1348))))

(declare-fun b!341616 () Bool)

(declare-fun e!209486 () Bool)

(assert (=> b!341616 (= e!209486 (and e!209488 mapRes!12246))))

(declare-fun condMapEmpty!12246 () Bool)

(declare-fun mapDefault!12246 () ValueCell!3263)

(assert (=> b!341616 (= condMapEmpty!12246 (= (arr!8527 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3263)) mapDefault!12246)))))

(declare-fun b!341617 () Bool)

(declare-fun Unit!10586 () Unit!10584)

(assert (=> b!341617 (= e!209490 Unit!10586)))

(declare-fun res!188896 () Bool)

(assert (=> start!34224 (=> (not res!188896) (not e!209491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34224 (= res!188896 (validMask!0 mask!2385))))

(assert (=> start!34224 e!209491))

(assert (=> start!34224 true))

(assert (=> start!34224 tp_is_empty!7213))

(assert (=> start!34224 tp!25316))

(declare-fun array_inv!6310 (array!18014) Bool)

(assert (=> start!34224 (and (array_inv!6310 _values!1525) e!209486)))

(declare-fun array_inv!6311 (array!18012) Bool)

(assert (=> start!34224 (array_inv!6311 _keys!1895)))

(declare-fun b!341611 () Bool)

(assert (=> b!341611 (= e!209492 tp_is_empty!7213)))

(declare-fun b!341618 () Bool)

(declare-fun Unit!10587 () Unit!10584)

(assert (=> b!341618 (= e!209490 Unit!10587)))

(declare-fun lt!161838 () Unit!10584)

(declare-fun lemmaArrayContainsKeyThenInListMap!299 (array!18012 array!18014 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 64) (_ BitVec 32) Int) Unit!10584)

(declare-fun arrayScanForKey!0 (array!18012 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341618 (= lt!161838 (lemmaArrayContainsKeyThenInListMap!299 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341618 false))

(declare-fun b!341619 () Bool)

(declare-fun res!188895 () Bool)

(assert (=> b!341619 (=> (not res!188895) (not e!209491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18012 (_ BitVec 32)) Bool)

(assert (=> b!341619 (= res!188895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34224 res!188896) b!341614))

(assert (= (and b!341614 res!188891) b!341619))

(assert (= (and b!341619 res!188895) b!341608))

(assert (= (and b!341608 res!188894) b!341615))

(assert (= (and b!341615 res!188892) b!341609))

(assert (= (and b!341609 res!188897) b!341613))

(assert (= (and b!341613 res!188893) b!341612))

(assert (= (and b!341612 c!52670) b!341618))

(assert (= (and b!341612 (not c!52670)) b!341617))

(assert (= (and b!341616 condMapEmpty!12246) mapIsEmpty!12246))

(assert (= (and b!341616 (not condMapEmpty!12246)) mapNonEmpty!12246))

(assert (= (and mapNonEmpty!12246 ((_ is ValueCellFull!3263) mapValue!12246)) b!341611))

(assert (= (and b!341616 ((_ is ValueCellFull!3263) mapDefault!12246)) b!341610))

(assert (= start!34224 b!341616))

(declare-fun m!344253 () Bool)

(assert (=> start!34224 m!344253))

(declare-fun m!344255 () Bool)

(assert (=> start!34224 m!344255))

(declare-fun m!344257 () Bool)

(assert (=> start!34224 m!344257))

(declare-fun m!344259 () Bool)

(assert (=> b!341615 m!344259))

(declare-fun m!344261 () Bool)

(assert (=> b!341609 m!344261))

(assert (=> b!341609 m!344261))

(declare-fun m!344263 () Bool)

(assert (=> b!341609 m!344263))

(declare-fun m!344265 () Bool)

(assert (=> b!341618 m!344265))

(assert (=> b!341618 m!344265))

(declare-fun m!344267 () Bool)

(assert (=> b!341618 m!344267))

(declare-fun m!344269 () Bool)

(assert (=> mapNonEmpty!12246 m!344269))

(declare-fun m!344271 () Bool)

(assert (=> b!341612 m!344271))

(declare-fun m!344273 () Bool)

(assert (=> b!341619 m!344273))

(declare-fun m!344275 () Bool)

(assert (=> b!341613 m!344275))

(declare-fun m!344277 () Bool)

(assert (=> b!341608 m!344277))

(check-sat (not b!341609) b_and!14475 (not start!34224) (not b_next!7261) (not b!341613) (not b!341615) (not b!341608) (not b!341619) (not mapNonEmpty!12246) (not b!341618) tp_is_empty!7213 (not b!341612))
(check-sat b_and!14475 (not b_next!7261))
(get-model)

(declare-fun d!70983 () Bool)

(assert (=> d!70983 (contains!2150 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!161860 () Unit!10584)

(declare-fun choose!1309 (array!18012 array!18014 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 64) (_ BitVec 32) Int) Unit!10584)

(assert (=> d!70983 (= lt!161860 (choose!1309 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70983 (validMask!0 mask!2385)))

(assert (=> d!70983 (= (lemmaArrayContainsKeyThenInListMap!299 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!161860)))

(declare-fun bs!11746 () Bool)

(assert (= bs!11746 d!70983))

(assert (=> bs!11746 m!344261))

(assert (=> bs!11746 m!344261))

(assert (=> bs!11746 m!344263))

(assert (=> bs!11746 m!344265))

(declare-fun m!344331 () Bool)

(assert (=> bs!11746 m!344331))

(assert (=> bs!11746 m!344253))

(assert (=> b!341618 d!70983))

(declare-fun d!70985 () Bool)

(declare-fun lt!161863 () (_ BitVec 32))

(assert (=> d!70985 (and (or (bvslt lt!161863 #b00000000000000000000000000000000) (bvsge lt!161863 (size!8878 _keys!1895)) (and (bvsge lt!161863 #b00000000000000000000000000000000) (bvslt lt!161863 (size!8878 _keys!1895)))) (bvsge lt!161863 #b00000000000000000000000000000000) (bvslt lt!161863 (size!8878 _keys!1895)) (= (select (arr!8526 _keys!1895) lt!161863) k0!1348))))

(declare-fun e!209537 () (_ BitVec 32))

(assert (=> d!70985 (= lt!161863 e!209537)))

(declare-fun c!52679 () Bool)

(assert (=> d!70985 (= c!52679 (= (select (arr!8526 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8878 _keys!1895)) (bvslt (size!8878 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70985 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!161863)))

(declare-fun b!341696 () Bool)

(assert (=> b!341696 (= e!209537 #b00000000000000000000000000000000)))

(declare-fun b!341697 () Bool)

(assert (=> b!341697 (= e!209537 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70985 c!52679) b!341696))

(assert (= (and d!70985 (not c!52679)) b!341697))

(declare-fun m!344333 () Bool)

(assert (=> d!70985 m!344333))

(declare-fun m!344335 () Bool)

(assert (=> d!70985 m!344335))

(declare-fun m!344337 () Bool)

(assert (=> b!341697 m!344337))

(assert (=> b!341618 d!70985))

(declare-fun b!341708 () Bool)

(declare-fun e!209546 () Bool)

(declare-fun contains!2152 (List!4811 (_ BitVec 64)) Bool)

(assert (=> b!341708 (= e!209546 (contains!2152 Nil!4808 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341709 () Bool)

(declare-fun e!209549 () Bool)

(declare-fun e!209547 () Bool)

(assert (=> b!341709 (= e!209549 e!209547)))

(declare-fun res!188947 () Bool)

(assert (=> b!341709 (=> (not res!188947) (not e!209547))))

(assert (=> b!341709 (= res!188947 (not e!209546))))

(declare-fun res!188948 () Bool)

(assert (=> b!341709 (=> (not res!188948) (not e!209546))))

(assert (=> b!341709 (= res!188948 (validKeyInArray!0 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26552 () Bool)

(declare-fun call!26555 () Bool)

(declare-fun c!52682 () Bool)

(assert (=> bm!26552 (= call!26555 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52682 (Cons!4807 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000) Nil!4808) Nil!4808)))))

(declare-fun b!341710 () Bool)

(declare-fun e!209548 () Bool)

(assert (=> b!341710 (= e!209547 e!209548)))

(assert (=> b!341710 (= c!52682 (validKeyInArray!0 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341711 () Bool)

(assert (=> b!341711 (= e!209548 call!26555)))

(declare-fun d!70987 () Bool)

(declare-fun res!188946 () Bool)

(assert (=> d!70987 (=> res!188946 e!209549)))

(assert (=> d!70987 (= res!188946 (bvsge #b00000000000000000000000000000000 (size!8878 _keys!1895)))))

(assert (=> d!70987 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4808) e!209549)))

(declare-fun b!341712 () Bool)

(assert (=> b!341712 (= e!209548 call!26555)))

(assert (= (and d!70987 (not res!188946)) b!341709))

(assert (= (and b!341709 res!188948) b!341708))

(assert (= (and b!341709 res!188947) b!341710))

(assert (= (and b!341710 c!52682) b!341712))

(assert (= (and b!341710 (not c!52682)) b!341711))

(assert (= (or b!341712 b!341711) bm!26552))

(assert (=> b!341708 m!344335))

(assert (=> b!341708 m!344335))

(declare-fun m!344339 () Bool)

(assert (=> b!341708 m!344339))

(assert (=> b!341709 m!344335))

(assert (=> b!341709 m!344335))

(declare-fun m!344341 () Bool)

(assert (=> b!341709 m!344341))

(assert (=> bm!26552 m!344335))

(declare-fun m!344343 () Bool)

(assert (=> bm!26552 m!344343))

(assert (=> b!341710 m!344335))

(assert (=> b!341710 m!344335))

(assert (=> b!341710 m!344341))

(assert (=> b!341608 d!70987))

(declare-fun d!70989 () Bool)

(declare-fun res!188953 () Bool)

(declare-fun e!209554 () Bool)

(assert (=> d!70989 (=> res!188953 e!209554)))

(assert (=> d!70989 (= res!188953 (= (select (arr!8526 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70989 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!209554)))

(declare-fun b!341717 () Bool)

(declare-fun e!209555 () Bool)

(assert (=> b!341717 (= e!209554 e!209555)))

(declare-fun res!188954 () Bool)

(assert (=> b!341717 (=> (not res!188954) (not e!209555))))

(assert (=> b!341717 (= res!188954 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8878 _keys!1895)))))

(declare-fun b!341718 () Bool)

(assert (=> b!341718 (= e!209555 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70989 (not res!188953)) b!341717))

(assert (= (and b!341717 res!188954) b!341718))

(assert (=> d!70989 m!344335))

(declare-fun m!344345 () Bool)

(assert (=> b!341718 m!344345))

(assert (=> b!341612 d!70989))

(declare-fun b!341727 () Bool)

(declare-fun e!209563 () Bool)

(declare-fun e!209562 () Bool)

(assert (=> b!341727 (= e!209563 e!209562)))

(declare-fun c!52685 () Bool)

(assert (=> b!341727 (= c!52685 (validKeyInArray!0 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26555 () Bool)

(declare-fun call!26558 () Bool)

(assert (=> bm!26555 (= call!26558 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70991 () Bool)

(declare-fun res!188959 () Bool)

(assert (=> d!70991 (=> res!188959 e!209563)))

(assert (=> d!70991 (= res!188959 (bvsge #b00000000000000000000000000000000 (size!8878 _keys!1895)))))

(assert (=> d!70991 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!209563)))

(declare-fun b!341728 () Bool)

(declare-fun e!209564 () Bool)

(assert (=> b!341728 (= e!209564 call!26558)))

(declare-fun b!341729 () Bool)

(assert (=> b!341729 (= e!209562 call!26558)))

(declare-fun b!341730 () Bool)

(assert (=> b!341730 (= e!209562 e!209564)))

(declare-fun lt!161871 () (_ BitVec 64))

(assert (=> b!341730 (= lt!161871 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161870 () Unit!10584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18012 (_ BitVec 64) (_ BitVec 32)) Unit!10584)

(assert (=> b!341730 (= lt!161870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161871 #b00000000000000000000000000000000))))

(assert (=> b!341730 (arrayContainsKey!0 _keys!1895 lt!161871 #b00000000000000000000000000000000)))

(declare-fun lt!161872 () Unit!10584)

(assert (=> b!341730 (= lt!161872 lt!161870)))

(declare-fun res!188960 () Bool)

(assert (=> b!341730 (= res!188960 (= (seekEntryOrOpen!0 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3247 #b00000000000000000000000000000000)))))

(assert (=> b!341730 (=> (not res!188960) (not e!209564))))

(assert (= (and d!70991 (not res!188959)) b!341727))

(assert (= (and b!341727 c!52685) b!341730))

(assert (= (and b!341727 (not c!52685)) b!341729))

(assert (= (and b!341730 res!188960) b!341728))

(assert (= (or b!341728 b!341729) bm!26555))

(assert (=> b!341727 m!344335))

(assert (=> b!341727 m!344335))

(assert (=> b!341727 m!344341))

(declare-fun m!344347 () Bool)

(assert (=> bm!26555 m!344347))

(assert (=> b!341730 m!344335))

(declare-fun m!344349 () Bool)

(assert (=> b!341730 m!344349))

(declare-fun m!344351 () Bool)

(assert (=> b!341730 m!344351))

(assert (=> b!341730 m!344335))

(declare-fun m!344353 () Bool)

(assert (=> b!341730 m!344353))

(assert (=> b!341619 d!70991))

(declare-fun d!70993 () Bool)

(declare-fun lt!161881 () SeekEntryResult!3247)

(assert (=> d!70993 (and (or ((_ is Undefined!3247) lt!161881) (not ((_ is Found!3247) lt!161881)) (and (bvsge (index!15168 lt!161881) #b00000000000000000000000000000000) (bvslt (index!15168 lt!161881) (size!8878 _keys!1895)))) (or ((_ is Undefined!3247) lt!161881) ((_ is Found!3247) lt!161881) (not ((_ is MissingZero!3247) lt!161881)) (and (bvsge (index!15167 lt!161881) #b00000000000000000000000000000000) (bvslt (index!15167 lt!161881) (size!8878 _keys!1895)))) (or ((_ is Undefined!3247) lt!161881) ((_ is Found!3247) lt!161881) ((_ is MissingZero!3247) lt!161881) (not ((_ is MissingVacant!3247) lt!161881)) (and (bvsge (index!15170 lt!161881) #b00000000000000000000000000000000) (bvslt (index!15170 lt!161881) (size!8878 _keys!1895)))) (or ((_ is Undefined!3247) lt!161881) (ite ((_ is Found!3247) lt!161881) (= (select (arr!8526 _keys!1895) (index!15168 lt!161881)) k0!1348) (ite ((_ is MissingZero!3247) lt!161881) (= (select (arr!8526 _keys!1895) (index!15167 lt!161881)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3247) lt!161881) (= (select (arr!8526 _keys!1895) (index!15170 lt!161881)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!209571 () SeekEntryResult!3247)

(assert (=> d!70993 (= lt!161881 e!209571)))

(declare-fun c!52693 () Bool)

(declare-fun lt!161880 () SeekEntryResult!3247)

(assert (=> d!70993 (= c!52693 (and ((_ is Intermediate!3247) lt!161880) (undefined!4059 lt!161880)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18012 (_ BitVec 32)) SeekEntryResult!3247)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70993 (= lt!161880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70993 (validMask!0 mask!2385)))

(assert (=> d!70993 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161881)))

(declare-fun b!341743 () Bool)

(declare-fun e!209573 () SeekEntryResult!3247)

(assert (=> b!341743 (= e!209573 (MissingZero!3247 (index!15169 lt!161880)))))

(declare-fun b!341744 () Bool)

(declare-fun c!52694 () Bool)

(declare-fun lt!161879 () (_ BitVec 64))

(assert (=> b!341744 (= c!52694 (= lt!161879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!209572 () SeekEntryResult!3247)

(assert (=> b!341744 (= e!209572 e!209573)))

(declare-fun b!341745 () Bool)

(assert (=> b!341745 (= e!209571 Undefined!3247)))

(declare-fun b!341746 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18012 (_ BitVec 32)) SeekEntryResult!3247)

(assert (=> b!341746 (= e!209573 (seekKeyOrZeroReturnVacant!0 (x!33982 lt!161880) (index!15169 lt!161880) (index!15169 lt!161880) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341747 () Bool)

(assert (=> b!341747 (= e!209571 e!209572)))

(assert (=> b!341747 (= lt!161879 (select (arr!8526 _keys!1895) (index!15169 lt!161880)))))

(declare-fun c!52692 () Bool)

(assert (=> b!341747 (= c!52692 (= lt!161879 k0!1348))))

(declare-fun b!341748 () Bool)

(assert (=> b!341748 (= e!209572 (Found!3247 (index!15169 lt!161880)))))

(assert (= (and d!70993 c!52693) b!341745))

(assert (= (and d!70993 (not c!52693)) b!341747))

(assert (= (and b!341747 c!52692) b!341748))

(assert (= (and b!341747 (not c!52692)) b!341744))

(assert (= (and b!341744 c!52694) b!341743))

(assert (= (and b!341744 (not c!52694)) b!341746))

(declare-fun m!344355 () Bool)

(assert (=> d!70993 m!344355))

(declare-fun m!344357 () Bool)

(assert (=> d!70993 m!344357))

(assert (=> d!70993 m!344253))

(assert (=> d!70993 m!344355))

(declare-fun m!344359 () Bool)

(assert (=> d!70993 m!344359))

(declare-fun m!344361 () Bool)

(assert (=> d!70993 m!344361))

(declare-fun m!344363 () Bool)

(assert (=> d!70993 m!344363))

(declare-fun m!344365 () Bool)

(assert (=> b!341746 m!344365))

(declare-fun m!344367 () Bool)

(assert (=> b!341747 m!344367))

(assert (=> b!341613 d!70993))

(declare-fun d!70995 () Bool)

(assert (=> d!70995 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341615 d!70995))

(declare-fun d!70997 () Bool)

(declare-fun e!209579 () Bool)

(assert (=> d!70997 e!209579))

(declare-fun res!188963 () Bool)

(assert (=> d!70997 (=> res!188963 e!209579)))

(declare-fun lt!161890 () Bool)

(assert (=> d!70997 (= res!188963 (not lt!161890))))

(declare-fun lt!161891 () Bool)

(assert (=> d!70997 (= lt!161890 lt!161891)))

(declare-fun lt!161892 () Unit!10584)

(declare-fun e!209578 () Unit!10584)

(assert (=> d!70997 (= lt!161892 e!209578)))

(declare-fun c!52697 () Bool)

(assert (=> d!70997 (= c!52697 lt!161891)))

(declare-fun containsKey!326 (List!4812 (_ BitVec 64)) Bool)

(assert (=> d!70997 (= lt!161891 (containsKey!326 (toList!2077 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70997 (= (contains!2150 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161890)))

(declare-fun b!341755 () Bool)

(declare-fun lt!161893 () Unit!10584)

(assert (=> b!341755 (= e!209578 lt!161893)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!274 (List!4812 (_ BitVec 64)) Unit!10584)

(assert (=> b!341755 (= lt!161893 (lemmaContainsKeyImpliesGetValueByKeyDefined!274 (toList!2077 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!341 0))(
  ( (Some!340 (v!5827 V!10595)) (None!339) )
))
(declare-fun isDefined!275 (Option!341) Bool)

(declare-fun getValueByKey!335 (List!4812 (_ BitVec 64)) Option!341)

(assert (=> b!341755 (isDefined!275 (getValueByKey!335 (toList!2077 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!341756 () Bool)

(declare-fun Unit!10592 () Unit!10584)

(assert (=> b!341756 (= e!209578 Unit!10592)))

(declare-fun b!341757 () Bool)

(assert (=> b!341757 (= e!209579 (isDefined!275 (getValueByKey!335 (toList!2077 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70997 c!52697) b!341755))

(assert (= (and d!70997 (not c!52697)) b!341756))

(assert (= (and d!70997 (not res!188963)) b!341757))

(declare-fun m!344369 () Bool)

(assert (=> d!70997 m!344369))

(declare-fun m!344371 () Bool)

(assert (=> b!341755 m!344371))

(declare-fun m!344373 () Bool)

(assert (=> b!341755 m!344373))

(assert (=> b!341755 m!344373))

(declare-fun m!344375 () Bool)

(assert (=> b!341755 m!344375))

(assert (=> b!341757 m!344373))

(assert (=> b!341757 m!344373))

(assert (=> b!341757 m!344375))

(assert (=> b!341609 d!70997))

(declare-fun b!341800 () Bool)

(declare-fun res!188990 () Bool)

(declare-fun e!209612 () Bool)

(assert (=> b!341800 (=> (not res!188990) (not e!209612))))

(declare-fun e!209606 () Bool)

(assert (=> b!341800 (= res!188990 e!209606)))

(declare-fun c!52712 () Bool)

(assert (=> b!341800 (= c!52712 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!70999 () Bool)

(assert (=> d!70999 e!209612))

(declare-fun res!188985 () Bool)

(assert (=> d!70999 (=> (not res!188985) (not e!209612))))

(assert (=> d!70999 (= res!188985 (or (bvsge #b00000000000000000000000000000000 (size!8878 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8878 _keys!1895)))))))

(declare-fun lt!161954 () ListLongMap!4123)

(declare-fun lt!161951 () ListLongMap!4123)

(assert (=> d!70999 (= lt!161954 lt!161951)))

(declare-fun lt!161938 () Unit!10584)

(declare-fun e!209608 () Unit!10584)

(assert (=> d!70999 (= lt!161938 e!209608)))

(declare-fun c!52711 () Bool)

(declare-fun e!209613 () Bool)

(assert (=> d!70999 (= c!52711 e!209613)))

(declare-fun res!188982 () Bool)

(assert (=> d!70999 (=> (not res!188982) (not e!209613))))

(assert (=> d!70999 (= res!188982 (bvslt #b00000000000000000000000000000000 (size!8878 _keys!1895)))))

(declare-fun e!209615 () ListLongMap!4123)

(assert (=> d!70999 (= lt!161951 e!209615)))

(declare-fun c!52714 () Bool)

(assert (=> d!70999 (= c!52714 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70999 (validMask!0 mask!2385)))

(assert (=> d!70999 (= (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161954)))

(declare-fun b!341801 () Bool)

(declare-fun e!209610 () Bool)

(declare-fun e!209618 () Bool)

(assert (=> b!341801 (= e!209610 e!209618)))

(declare-fun res!188988 () Bool)

(assert (=> b!341801 (=> (not res!188988) (not e!209618))))

(assert (=> b!341801 (= res!188988 (contains!2150 lt!161954 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!341801 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8878 _keys!1895)))))

(declare-fun b!341802 () Bool)

(declare-fun res!188984 () Bool)

(assert (=> b!341802 (=> (not res!188984) (not e!209612))))

(assert (=> b!341802 (= res!188984 e!209610)))

(declare-fun res!188983 () Bool)

(assert (=> b!341802 (=> res!188983 e!209610)))

(declare-fun e!209609 () Bool)

(assert (=> b!341802 (= res!188983 (not e!209609))))

(declare-fun res!188986 () Bool)

(assert (=> b!341802 (=> (not res!188986) (not e!209609))))

(assert (=> b!341802 (= res!188986 (bvslt #b00000000000000000000000000000000 (size!8878 _keys!1895)))))

(declare-fun bm!26570 () Bool)

(declare-fun call!26574 () Bool)

(assert (=> bm!26570 (= call!26574 (contains!2150 lt!161954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341803 () Bool)

(declare-fun e!209616 () ListLongMap!4123)

(declare-fun call!26573 () ListLongMap!4123)

(assert (=> b!341803 (= e!209616 call!26573)))

(declare-fun b!341804 () Bool)

(assert (=> b!341804 (= e!209613 (validKeyInArray!0 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341805 () Bool)

(declare-fun e!209611 () Bool)

(declare-fun apply!276 (ListLongMap!4123 (_ BitVec 64)) V!10595)

(assert (=> b!341805 (= e!209611 (= (apply!276 lt!161954 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!341806 () Bool)

(assert (=> b!341806 (= e!209609 (validKeyInArray!0 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341807 () Bool)

(declare-fun lt!161948 () Unit!10584)

(assert (=> b!341807 (= e!209608 lt!161948)))

(declare-fun lt!161959 () ListLongMap!4123)

(declare-fun getCurrentListMapNoExtraKeys!592 (array!18012 array!18014 (_ BitVec 32) (_ BitVec 32) V!10595 V!10595 (_ BitVec 32) Int) ListLongMap!4123)

(assert (=> b!341807 (= lt!161959 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161958 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161958 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161957 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161957 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161950 () Unit!10584)

(declare-fun addStillContains!252 (ListLongMap!4123 (_ BitVec 64) V!10595 (_ BitVec 64)) Unit!10584)

(assert (=> b!341807 (= lt!161950 (addStillContains!252 lt!161959 lt!161958 zeroValue!1467 lt!161957))))

(declare-fun +!727 (ListLongMap!4123 tuple2!5208) ListLongMap!4123)

(assert (=> b!341807 (contains!2150 (+!727 lt!161959 (tuple2!5209 lt!161958 zeroValue!1467)) lt!161957)))

(declare-fun lt!161946 () Unit!10584)

(assert (=> b!341807 (= lt!161946 lt!161950)))

(declare-fun lt!161943 () ListLongMap!4123)

(assert (=> b!341807 (= lt!161943 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161949 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161949 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161942 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161942 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161956 () Unit!10584)

(declare-fun addApplyDifferent!252 (ListLongMap!4123 (_ BitVec 64) V!10595 (_ BitVec 64)) Unit!10584)

(assert (=> b!341807 (= lt!161956 (addApplyDifferent!252 lt!161943 lt!161949 minValue!1467 lt!161942))))

(assert (=> b!341807 (= (apply!276 (+!727 lt!161943 (tuple2!5209 lt!161949 minValue!1467)) lt!161942) (apply!276 lt!161943 lt!161942))))

(declare-fun lt!161953 () Unit!10584)

(assert (=> b!341807 (= lt!161953 lt!161956)))

(declare-fun lt!161947 () ListLongMap!4123)

(assert (=> b!341807 (= lt!161947 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161955 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161955 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161945 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161945 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161940 () Unit!10584)

(assert (=> b!341807 (= lt!161940 (addApplyDifferent!252 lt!161947 lt!161955 zeroValue!1467 lt!161945))))

(assert (=> b!341807 (= (apply!276 (+!727 lt!161947 (tuple2!5209 lt!161955 zeroValue!1467)) lt!161945) (apply!276 lt!161947 lt!161945))))

(declare-fun lt!161944 () Unit!10584)

(assert (=> b!341807 (= lt!161944 lt!161940)))

(declare-fun lt!161952 () ListLongMap!4123)

(assert (=> b!341807 (= lt!161952 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161939 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161939 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161941 () (_ BitVec 64))

(assert (=> b!341807 (= lt!161941 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!341807 (= lt!161948 (addApplyDifferent!252 lt!161952 lt!161939 minValue!1467 lt!161941))))

(assert (=> b!341807 (= (apply!276 (+!727 lt!161952 (tuple2!5209 lt!161939 minValue!1467)) lt!161941) (apply!276 lt!161952 lt!161941))))

(declare-fun b!341808 () Bool)

(declare-fun e!209617 () Bool)

(assert (=> b!341808 (= e!209606 e!209617)))

(declare-fun res!188987 () Bool)

(assert (=> b!341808 (= res!188987 call!26574)))

(assert (=> b!341808 (=> (not res!188987) (not e!209617))))

(declare-fun b!341809 () Bool)

(assert (=> b!341809 (= e!209606 (not call!26574))))

(declare-fun b!341810 () Bool)

(declare-fun call!26576 () ListLongMap!4123)

(assert (=> b!341810 (= e!209616 call!26576)))

(declare-fun b!341811 () Bool)

(declare-fun e!209607 () ListLongMap!4123)

(assert (=> b!341811 (= e!209615 e!209607)))

(declare-fun c!52710 () Bool)

(assert (=> b!341811 (= c!52710 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!341812 () Bool)

(declare-fun get!4632 (ValueCell!3263 V!10595) V!10595)

(declare-fun dynLambda!619 (Int (_ BitVec 64)) V!10595)

(assert (=> b!341812 (= e!209618 (= (apply!276 lt!161954 (select (arr!8526 _keys!1895) #b00000000000000000000000000000000)) (get!4632 (select (arr!8527 _values!1525) #b00000000000000000000000000000000) (dynLambda!619 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8879 _values!1525)))))

(assert (=> b!341812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8878 _keys!1895)))))

(declare-fun bm!26571 () Bool)

(declare-fun call!26575 () ListLongMap!4123)

(assert (=> bm!26571 (= call!26573 call!26575)))

(declare-fun bm!26572 () Bool)

(declare-fun call!26578 () Bool)

(assert (=> bm!26572 (= call!26578 (contains!2150 lt!161954 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341813 () Bool)

(assert (=> b!341813 (= e!209607 call!26573)))

(declare-fun b!341814 () Bool)

(assert (=> b!341814 (= e!209615 (+!727 call!26575 (tuple2!5209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!341815 () Bool)

(declare-fun e!209614 () Bool)

(assert (=> b!341815 (= e!209614 (not call!26578))))

(declare-fun bm!26573 () Bool)

(declare-fun call!26579 () ListLongMap!4123)

(assert (=> bm!26573 (= call!26576 call!26579)))

(declare-fun b!341816 () Bool)

(declare-fun Unit!10593 () Unit!10584)

(assert (=> b!341816 (= e!209608 Unit!10593)))

(declare-fun bm!26574 () Bool)

(declare-fun call!26577 () ListLongMap!4123)

(assert (=> bm!26574 (= call!26577 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26575 () Bool)

(assert (=> bm!26575 (= call!26579 call!26577)))

(declare-fun bm!26576 () Bool)

(assert (=> bm!26576 (= call!26575 (+!727 (ite c!52714 call!26577 (ite c!52710 call!26579 call!26576)) (ite (or c!52714 c!52710) (tuple2!5209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!341817 () Bool)

(declare-fun c!52713 () Bool)

(assert (=> b!341817 (= c!52713 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!341817 (= e!209607 e!209616)))

(declare-fun b!341818 () Bool)

(assert (=> b!341818 (= e!209612 e!209614)))

(declare-fun c!52715 () Bool)

(assert (=> b!341818 (= c!52715 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!341819 () Bool)

(assert (=> b!341819 (= e!209617 (= (apply!276 lt!161954 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!341820 () Bool)

(assert (=> b!341820 (= e!209614 e!209611)))

(declare-fun res!188989 () Bool)

(assert (=> b!341820 (= res!188989 call!26578)))

(assert (=> b!341820 (=> (not res!188989) (not e!209611))))

(assert (= (and d!70999 c!52714) b!341814))

(assert (= (and d!70999 (not c!52714)) b!341811))

(assert (= (and b!341811 c!52710) b!341813))

(assert (= (and b!341811 (not c!52710)) b!341817))

(assert (= (and b!341817 c!52713) b!341803))

(assert (= (and b!341817 (not c!52713)) b!341810))

(assert (= (or b!341803 b!341810) bm!26573))

(assert (= (or b!341813 bm!26573) bm!26575))

(assert (= (or b!341813 b!341803) bm!26571))

(assert (= (or b!341814 bm!26575) bm!26574))

(assert (= (or b!341814 bm!26571) bm!26576))

(assert (= (and d!70999 res!188982) b!341804))

(assert (= (and d!70999 c!52711) b!341807))

(assert (= (and d!70999 (not c!52711)) b!341816))

(assert (= (and d!70999 res!188985) b!341802))

(assert (= (and b!341802 res!188986) b!341806))

(assert (= (and b!341802 (not res!188983)) b!341801))

(assert (= (and b!341801 res!188988) b!341812))

(assert (= (and b!341802 res!188984) b!341800))

(assert (= (and b!341800 c!52712) b!341808))

(assert (= (and b!341800 (not c!52712)) b!341809))

(assert (= (and b!341808 res!188987) b!341819))

(assert (= (or b!341808 b!341809) bm!26570))

(assert (= (and b!341800 res!188990) b!341818))

(assert (= (and b!341818 c!52715) b!341820))

(assert (= (and b!341818 (not c!52715)) b!341815))

(assert (= (and b!341820 res!188989) b!341805))

(assert (= (or b!341820 b!341815) bm!26572))

(declare-fun b_lambda!8465 () Bool)

(assert (=> (not b_lambda!8465) (not b!341812)))

(declare-fun t!9916 () Bool)

(declare-fun tb!3059 () Bool)

(assert (=> (and start!34224 (= defaultEntry!1528 defaultEntry!1528) t!9916) tb!3059))

(declare-fun result!5523 () Bool)

(assert (=> tb!3059 (= result!5523 tp_is_empty!7213)))

(assert (=> b!341812 t!9916))

(declare-fun b_and!14481 () Bool)

(assert (= b_and!14475 (and (=> t!9916 result!5523) b_and!14481)))

(declare-fun m!344377 () Bool)

(assert (=> b!341807 m!344377))

(declare-fun m!344379 () Bool)

(assert (=> b!341807 m!344379))

(declare-fun m!344381 () Bool)

(assert (=> b!341807 m!344381))

(declare-fun m!344383 () Bool)

(assert (=> b!341807 m!344383))

(declare-fun m!344385 () Bool)

(assert (=> b!341807 m!344385))

(declare-fun m!344387 () Bool)

(assert (=> b!341807 m!344387))

(declare-fun m!344389 () Bool)

(assert (=> b!341807 m!344389))

(declare-fun m!344391 () Bool)

(assert (=> b!341807 m!344391))

(declare-fun m!344393 () Bool)

(assert (=> b!341807 m!344393))

(declare-fun m!344395 () Bool)

(assert (=> b!341807 m!344395))

(assert (=> b!341807 m!344377))

(declare-fun m!344397 () Bool)

(assert (=> b!341807 m!344397))

(assert (=> b!341807 m!344335))

(assert (=> b!341807 m!344381))

(declare-fun m!344399 () Bool)

(assert (=> b!341807 m!344399))

(assert (=> b!341807 m!344389))

(declare-fun m!344401 () Bool)

(assert (=> b!341807 m!344401))

(declare-fun m!344403 () Bool)

(assert (=> b!341807 m!344403))

(declare-fun m!344405 () Bool)

(assert (=> b!341807 m!344405))

(assert (=> b!341807 m!344401))

(declare-fun m!344407 () Bool)

(assert (=> b!341807 m!344407))

(assert (=> bm!26574 m!344385))

(declare-fun m!344409 () Bool)

(assert (=> bm!26576 m!344409))

(assert (=> b!341806 m!344335))

(assert (=> b!341806 m!344335))

(assert (=> b!341806 m!344341))

(declare-fun m!344411 () Bool)

(assert (=> b!341805 m!344411))

(declare-fun m!344413 () Bool)

(assert (=> bm!26570 m!344413))

(declare-fun m!344415 () Bool)

(assert (=> b!341814 m!344415))

(assert (=> b!341812 m!344335))

(declare-fun m!344417 () Bool)

(assert (=> b!341812 m!344417))

(declare-fun m!344419 () Bool)

(assert (=> b!341812 m!344419))

(declare-fun m!344421 () Bool)

(assert (=> b!341812 m!344421))

(assert (=> b!341812 m!344335))

(declare-fun m!344423 () Bool)

(assert (=> b!341812 m!344423))

(assert (=> b!341812 m!344417))

(assert (=> b!341812 m!344419))

(assert (=> d!70999 m!344253))

(assert (=> b!341804 m!344335))

(assert (=> b!341804 m!344335))

(assert (=> b!341804 m!344341))

(declare-fun m!344425 () Bool)

(assert (=> b!341819 m!344425))

(assert (=> b!341801 m!344335))

(assert (=> b!341801 m!344335))

(declare-fun m!344427 () Bool)

(assert (=> b!341801 m!344427))

(declare-fun m!344429 () Bool)

(assert (=> bm!26572 m!344429))

(assert (=> b!341609 d!70999))

(declare-fun d!71001 () Bool)

(assert (=> d!71001 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34224 d!71001))

(declare-fun d!71003 () Bool)

(assert (=> d!71003 (= (array_inv!6310 _values!1525) (bvsge (size!8879 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34224 d!71003))

(declare-fun d!71005 () Bool)

(assert (=> d!71005 (= (array_inv!6311 _keys!1895) (bvsge (size!8878 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34224 d!71005))

(declare-fun mapNonEmpty!12255 () Bool)

(declare-fun mapRes!12255 () Bool)

(declare-fun tp!25332 () Bool)

(declare-fun e!209623 () Bool)

(assert (=> mapNonEmpty!12255 (= mapRes!12255 (and tp!25332 e!209623))))

(declare-fun mapValue!12255 () ValueCell!3263)

(declare-fun mapKey!12255 () (_ BitVec 32))

(declare-fun mapRest!12255 () (Array (_ BitVec 32) ValueCell!3263))

(assert (=> mapNonEmpty!12255 (= mapRest!12246 (store mapRest!12255 mapKey!12255 mapValue!12255))))

(declare-fun condMapEmpty!12255 () Bool)

(declare-fun mapDefault!12255 () ValueCell!3263)

(assert (=> mapNonEmpty!12246 (= condMapEmpty!12255 (= mapRest!12246 ((as const (Array (_ BitVec 32) ValueCell!3263)) mapDefault!12255)))))

(declare-fun e!209624 () Bool)

(assert (=> mapNonEmpty!12246 (= tp!25317 (and e!209624 mapRes!12255))))

(declare-fun b!341830 () Bool)

(assert (=> b!341830 (= e!209624 tp_is_empty!7213)))

(declare-fun b!341829 () Bool)

(assert (=> b!341829 (= e!209623 tp_is_empty!7213)))

(declare-fun mapIsEmpty!12255 () Bool)

(assert (=> mapIsEmpty!12255 mapRes!12255))

(assert (= (and mapNonEmpty!12246 condMapEmpty!12255) mapIsEmpty!12255))

(assert (= (and mapNonEmpty!12246 (not condMapEmpty!12255)) mapNonEmpty!12255))

(assert (= (and mapNonEmpty!12255 ((_ is ValueCellFull!3263) mapValue!12255)) b!341829))

(assert (= (and mapNonEmpty!12246 ((_ is ValueCellFull!3263) mapDefault!12255)) b!341830))

(declare-fun m!344431 () Bool)

(assert (=> mapNonEmpty!12255 m!344431))

(declare-fun b_lambda!8467 () Bool)

(assert (= b_lambda!8465 (or (and start!34224 b_free!7261) b_lambda!8467)))

(check-sat (not b!341710) (not b!341805) (not b!341812) (not b_next!7261) (not bm!26555) (not b!341804) (not b!341806) (not b!341727) (not b!341718) (not b!341755) (not b!341709) (not bm!26552) (not bm!26572) (not bm!26574) (not b!341801) (not d!70997) (not b_lambda!8467) (not b!341730) (not b!341807) (not d!70999) (not b!341746) (not b!341708) (not mapNonEmpty!12255) b_and!14481 (not bm!26576) (not b!341819) (not b!341814) (not b!341697) (not d!70993) tp_is_empty!7213 (not d!70983) (not b!341757) (not bm!26570))
(check-sat b_and!14481 (not b_next!7261))
