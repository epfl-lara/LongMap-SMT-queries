; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34540 () Bool)

(assert start!34540)

(declare-fun b_free!7459 () Bool)

(declare-fun b_next!7459 () Bool)

(assert (=> start!34540 (= b_free!7459 (not b_next!7459))))

(declare-fun tp!25926 () Bool)

(declare-fun b_and!14683 () Bool)

(assert (=> start!34540 (= tp!25926 b_and!14683)))

(declare-fun b!345320 () Bool)

(declare-fun res!191068 () Bool)

(declare-fun e!211647 () Bool)

(assert (=> b!345320 (=> (not res!191068) (not e!211647))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10859 0))(
  ( (V!10860 (val!3750 Int)) )
))
(declare-fun zeroValue!1467 () V!10859)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3362 0))(
  ( (ValueCellFull!3362 (v!5928 V!10859)) (EmptyCell!3362) )
))
(declare-datatypes ((array!18402 0))(
  ( (array!18403 (arr!8716 (Array (_ BitVec 32) ValueCell!3362)) (size!9068 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18402)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10859)

(declare-datatypes ((array!18404 0))(
  ( (array!18405 (arr!8717 (Array (_ BitVec 32) (_ BitVec 64))) (size!9069 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18404)

(declare-datatypes ((tuple2!5344 0))(
  ( (tuple2!5345 (_1!2683 (_ BitVec 64)) (_2!2683 V!10859)) )
))
(declare-datatypes ((List!4949 0))(
  ( (Nil!4946) (Cons!4945 (h!5801 tuple2!5344) (t!10059 List!4949)) )
))
(declare-datatypes ((ListLongMap!4259 0))(
  ( (ListLongMap!4260 (toList!2145 List!4949)) )
))
(declare-fun contains!2223 (ListLongMap!4259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1674 (array!18404 array!18402 (_ BitVec 32) (_ BitVec 32) V!10859 V!10859 (_ BitVec 32) Int) ListLongMap!4259)

(assert (=> b!345320 (= res!191068 (not (contains!2223 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!191069 () Bool)

(assert (=> start!34540 (=> (not res!191069) (not e!211647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34540 (= res!191069 (validMask!0 mask!2385))))

(assert (=> start!34540 e!211647))

(assert (=> start!34540 true))

(declare-fun tp_is_empty!7411 () Bool)

(assert (=> start!34540 tp_is_empty!7411))

(assert (=> start!34540 tp!25926))

(declare-fun e!211644 () Bool)

(declare-fun array_inv!6440 (array!18402) Bool)

(assert (=> start!34540 (and (array_inv!6440 _values!1525) e!211644)))

(declare-fun array_inv!6441 (array!18404) Bool)

(assert (=> start!34540 (array_inv!6441 _keys!1895)))

(declare-fun mapIsEmpty!12558 () Bool)

(declare-fun mapRes!12558 () Bool)

(assert (=> mapIsEmpty!12558 mapRes!12558))

(declare-fun mapNonEmpty!12558 () Bool)

(declare-fun tp!25925 () Bool)

(declare-fun e!211645 () Bool)

(assert (=> mapNonEmpty!12558 (= mapRes!12558 (and tp!25925 e!211645))))

(declare-fun mapKey!12558 () (_ BitVec 32))

(declare-fun mapRest!12558 () (Array (_ BitVec 32) ValueCell!3362))

(declare-fun mapValue!12558 () ValueCell!3362)

(assert (=> mapNonEmpty!12558 (= (arr!8716 _values!1525) (store mapRest!12558 mapKey!12558 mapValue!12558))))

(declare-fun b!345321 () Bool)

(declare-fun res!191066 () Bool)

(assert (=> b!345321 (=> (not res!191066) (not e!211647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18404 (_ BitVec 32)) Bool)

(assert (=> b!345321 (= res!191066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345322 () Bool)

(declare-fun e!211648 () Bool)

(assert (=> b!345322 (= e!211647 e!211648)))

(declare-fun res!191067 () Bool)

(assert (=> b!345322 (=> (not res!191067) (not e!211648))))

(declare-datatypes ((SeekEntryResult!3313 0))(
  ( (MissingZero!3313 (index!15431 (_ BitVec 32))) (Found!3313 (index!15432 (_ BitVec 32))) (Intermediate!3313 (undefined!4125 Bool) (index!15433 (_ BitVec 32)) (x!34362 (_ BitVec 32))) (Undefined!3313) (MissingVacant!3313 (index!15434 (_ BitVec 32))) )
))
(declare-fun lt!162877 () SeekEntryResult!3313)

(get-info :version)

(assert (=> b!345322 (= res!191067 (and ((_ is Found!3313) lt!162877) (= (select (arr!8717 _keys!1895) (index!15432 lt!162877)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18404 (_ BitVec 32)) SeekEntryResult!3313)

(assert (=> b!345322 (= lt!162877 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345323 () Bool)

(declare-fun arrayContainsKey!0 (array!18404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345323 (= e!211648 (not (arrayContainsKey!0 _keys!1895 k0!1348 (index!15432 lt!162877))))))

(declare-fun b!345324 () Bool)

(declare-fun res!191070 () Bool)

(assert (=> b!345324 (=> (not res!191070) (not e!211647))))

(declare-datatypes ((List!4950 0))(
  ( (Nil!4947) (Cons!4946 (h!5802 (_ BitVec 64)) (t!10060 List!4950)) )
))
(declare-fun arrayNoDuplicates!0 (array!18404 (_ BitVec 32) List!4950) Bool)

(assert (=> b!345324 (= res!191070 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4947))))

(declare-fun b!345325 () Bool)

(declare-fun res!191072 () Bool)

(assert (=> b!345325 (=> (not res!191072) (not e!211647))))

(assert (=> b!345325 (= res!191072 (and (= (size!9068 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9069 _keys!1895) (size!9068 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345326 () Bool)

(declare-fun e!211649 () Bool)

(assert (=> b!345326 (= e!211644 (and e!211649 mapRes!12558))))

(declare-fun condMapEmpty!12558 () Bool)

(declare-fun mapDefault!12558 () ValueCell!3362)

(assert (=> b!345326 (= condMapEmpty!12558 (= (arr!8716 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3362)) mapDefault!12558)))))

(declare-fun b!345327 () Bool)

(declare-fun res!191071 () Bool)

(assert (=> b!345327 (=> (not res!191071) (not e!211647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345327 (= res!191071 (validKeyInArray!0 k0!1348))))

(declare-fun b!345328 () Bool)

(assert (=> b!345328 (= e!211649 tp_is_empty!7411)))

(declare-fun b!345329 () Bool)

(assert (=> b!345329 (= e!211645 tp_is_empty!7411)))

(assert (= (and start!34540 res!191069) b!345325))

(assert (= (and b!345325 res!191072) b!345321))

(assert (= (and b!345321 res!191066) b!345324))

(assert (= (and b!345324 res!191070) b!345327))

(assert (= (and b!345327 res!191071) b!345320))

(assert (= (and b!345320 res!191068) b!345322))

(assert (= (and b!345322 res!191067) b!345323))

(assert (= (and b!345326 condMapEmpty!12558) mapIsEmpty!12558))

(assert (= (and b!345326 (not condMapEmpty!12558)) mapNonEmpty!12558))

(assert (= (and mapNonEmpty!12558 ((_ is ValueCellFull!3362) mapValue!12558)) b!345329))

(assert (= (and b!345326 ((_ is ValueCellFull!3362) mapDefault!12558)) b!345328))

(assert (= start!34540 b!345326))

(declare-fun m!346981 () Bool)

(assert (=> b!345327 m!346981))

(declare-fun m!346983 () Bool)

(assert (=> start!34540 m!346983))

(declare-fun m!346985 () Bool)

(assert (=> start!34540 m!346985))

(declare-fun m!346987 () Bool)

(assert (=> start!34540 m!346987))

(declare-fun m!346989 () Bool)

(assert (=> b!345321 m!346989))

(declare-fun m!346991 () Bool)

(assert (=> b!345324 m!346991))

(declare-fun m!346993 () Bool)

(assert (=> b!345323 m!346993))

(declare-fun m!346995 () Bool)

(assert (=> mapNonEmpty!12558 m!346995))

(declare-fun m!346997 () Bool)

(assert (=> b!345322 m!346997))

(declare-fun m!346999 () Bool)

(assert (=> b!345322 m!346999))

(declare-fun m!347001 () Bool)

(assert (=> b!345320 m!347001))

(assert (=> b!345320 m!347001))

(declare-fun m!347003 () Bool)

(assert (=> b!345320 m!347003))

(check-sat (not b!345323) (not mapNonEmpty!12558) b_and!14683 (not b!345320) (not b!345324) (not b_next!7459) (not b!345327) (not b!345321) (not b!345322) (not start!34540) tp_is_empty!7411)
(check-sat b_and!14683 (not b_next!7459))
(get-model)

(declare-fun d!71167 () Bool)

(declare-fun res!191123 () Bool)

(declare-fun e!211694 () Bool)

(assert (=> d!71167 (=> res!191123 e!211694)))

(assert (=> d!71167 (= res!191123 (bvsge #b00000000000000000000000000000000 (size!9069 _keys!1895)))))

(assert (=> d!71167 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4947) e!211694)))

(declare-fun b!345400 () Bool)

(declare-fun e!211695 () Bool)

(declare-fun call!26690 () Bool)

(assert (=> b!345400 (= e!211695 call!26690)))

(declare-fun bm!26687 () Bool)

(declare-fun c!52970 () Bool)

(assert (=> bm!26687 (= call!26690 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52970 (Cons!4946 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000) Nil!4947) Nil!4947)))))

(declare-fun b!345401 () Bool)

(declare-fun e!211696 () Bool)

(assert (=> b!345401 (= e!211696 e!211695)))

(assert (=> b!345401 (= c!52970 (validKeyInArray!0 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345402 () Bool)

(declare-fun e!211697 () Bool)

(declare-fun contains!2224 (List!4950 (_ BitVec 64)) Bool)

(assert (=> b!345402 (= e!211697 (contains!2224 Nil!4947 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345403 () Bool)

(assert (=> b!345403 (= e!211694 e!211696)))

(declare-fun res!191121 () Bool)

(assert (=> b!345403 (=> (not res!191121) (not e!211696))))

(assert (=> b!345403 (= res!191121 (not e!211697))))

(declare-fun res!191122 () Bool)

(assert (=> b!345403 (=> (not res!191122) (not e!211697))))

(assert (=> b!345403 (= res!191122 (validKeyInArray!0 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345404 () Bool)

(assert (=> b!345404 (= e!211695 call!26690)))

(assert (= (and d!71167 (not res!191123)) b!345403))

(assert (= (and b!345403 res!191122) b!345402))

(assert (= (and b!345403 res!191121) b!345401))

(assert (= (and b!345401 c!52970) b!345404))

(assert (= (and b!345401 (not c!52970)) b!345400))

(assert (= (or b!345404 b!345400) bm!26687))

(declare-fun m!347053 () Bool)

(assert (=> bm!26687 m!347053))

(declare-fun m!347055 () Bool)

(assert (=> bm!26687 m!347055))

(assert (=> b!345401 m!347053))

(assert (=> b!345401 m!347053))

(declare-fun m!347057 () Bool)

(assert (=> b!345401 m!347057))

(assert (=> b!345402 m!347053))

(assert (=> b!345402 m!347053))

(declare-fun m!347059 () Bool)

(assert (=> b!345402 m!347059))

(assert (=> b!345403 m!347053))

(assert (=> b!345403 m!347053))

(assert (=> b!345403 m!347057))

(assert (=> b!345324 d!71167))

(declare-fun d!71169 () Bool)

(declare-fun lt!162892 () SeekEntryResult!3313)

(assert (=> d!71169 (and (or ((_ is Undefined!3313) lt!162892) (not ((_ is Found!3313) lt!162892)) (and (bvsge (index!15432 lt!162892) #b00000000000000000000000000000000) (bvslt (index!15432 lt!162892) (size!9069 _keys!1895)))) (or ((_ is Undefined!3313) lt!162892) ((_ is Found!3313) lt!162892) (not ((_ is MissingZero!3313) lt!162892)) (and (bvsge (index!15431 lt!162892) #b00000000000000000000000000000000) (bvslt (index!15431 lt!162892) (size!9069 _keys!1895)))) (or ((_ is Undefined!3313) lt!162892) ((_ is Found!3313) lt!162892) ((_ is MissingZero!3313) lt!162892) (not ((_ is MissingVacant!3313) lt!162892)) (and (bvsge (index!15434 lt!162892) #b00000000000000000000000000000000) (bvslt (index!15434 lt!162892) (size!9069 _keys!1895)))) (or ((_ is Undefined!3313) lt!162892) (ite ((_ is Found!3313) lt!162892) (= (select (arr!8717 _keys!1895) (index!15432 lt!162892)) k0!1348) (ite ((_ is MissingZero!3313) lt!162892) (= (select (arr!8717 _keys!1895) (index!15431 lt!162892)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3313) lt!162892) (= (select (arr!8717 _keys!1895) (index!15434 lt!162892)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!211704 () SeekEntryResult!3313)

(assert (=> d!71169 (= lt!162892 e!211704)))

(declare-fun c!52979 () Bool)

(declare-fun lt!162890 () SeekEntryResult!3313)

(assert (=> d!71169 (= c!52979 (and ((_ is Intermediate!3313) lt!162890) (undefined!4125 lt!162890)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18404 (_ BitVec 32)) SeekEntryResult!3313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71169 (= lt!162890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71169 (validMask!0 mask!2385)))

(assert (=> d!71169 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162892)))

(declare-fun b!345417 () Bool)

(assert (=> b!345417 (= e!211704 Undefined!3313)))

(declare-fun b!345418 () Bool)

(declare-fun e!211706 () SeekEntryResult!3313)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18404 (_ BitVec 32)) SeekEntryResult!3313)

(assert (=> b!345418 (= e!211706 (seekKeyOrZeroReturnVacant!0 (x!34362 lt!162890) (index!15433 lt!162890) (index!15433 lt!162890) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345419 () Bool)

(declare-fun e!211705 () SeekEntryResult!3313)

(assert (=> b!345419 (= e!211704 e!211705)))

(declare-fun lt!162891 () (_ BitVec 64))

(assert (=> b!345419 (= lt!162891 (select (arr!8717 _keys!1895) (index!15433 lt!162890)))))

(declare-fun c!52977 () Bool)

(assert (=> b!345419 (= c!52977 (= lt!162891 k0!1348))))

(declare-fun b!345420 () Bool)

(assert (=> b!345420 (= e!211705 (Found!3313 (index!15433 lt!162890)))))

(declare-fun b!345421 () Bool)

(assert (=> b!345421 (= e!211706 (MissingZero!3313 (index!15433 lt!162890)))))

(declare-fun b!345422 () Bool)

(declare-fun c!52978 () Bool)

(assert (=> b!345422 (= c!52978 (= lt!162891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!345422 (= e!211705 e!211706)))

(assert (= (and d!71169 c!52979) b!345417))

(assert (= (and d!71169 (not c!52979)) b!345419))

(assert (= (and b!345419 c!52977) b!345420))

(assert (= (and b!345419 (not c!52977)) b!345422))

(assert (= (and b!345422 c!52978) b!345421))

(assert (= (and b!345422 (not c!52978)) b!345418))

(declare-fun m!347061 () Bool)

(assert (=> d!71169 m!347061))

(declare-fun m!347063 () Bool)

(assert (=> d!71169 m!347063))

(declare-fun m!347065 () Bool)

(assert (=> d!71169 m!347065))

(declare-fun m!347067 () Bool)

(assert (=> d!71169 m!347067))

(assert (=> d!71169 m!346983))

(declare-fun m!347069 () Bool)

(assert (=> d!71169 m!347069))

(assert (=> d!71169 m!347061))

(declare-fun m!347071 () Bool)

(assert (=> b!345418 m!347071))

(declare-fun m!347073 () Bool)

(assert (=> b!345419 m!347073))

(assert (=> b!345322 d!71169))

(declare-fun d!71171 () Bool)

(assert (=> d!71171 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345327 d!71171))

(declare-fun d!71173 () Bool)

(declare-fun res!191129 () Bool)

(declare-fun e!211715 () Bool)

(assert (=> d!71173 (=> res!191129 e!211715)))

(assert (=> d!71173 (= res!191129 (bvsge #b00000000000000000000000000000000 (size!9069 _keys!1895)))))

(assert (=> d!71173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211715)))

(declare-fun b!345431 () Bool)

(declare-fun e!211713 () Bool)

(assert (=> b!345431 (= e!211715 e!211713)))

(declare-fun c!52982 () Bool)

(assert (=> b!345431 (= c!52982 (validKeyInArray!0 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345432 () Bool)

(declare-fun call!26693 () Bool)

(assert (=> b!345432 (= e!211713 call!26693)))

(declare-fun b!345433 () Bool)

(declare-fun e!211714 () Bool)

(assert (=> b!345433 (= e!211713 e!211714)))

(declare-fun lt!162901 () (_ BitVec 64))

(assert (=> b!345433 (= lt!162901 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10701 0))(
  ( (Unit!10702) )
))
(declare-fun lt!162899 () Unit!10701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18404 (_ BitVec 64) (_ BitVec 32)) Unit!10701)

(assert (=> b!345433 (= lt!162899 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162901 #b00000000000000000000000000000000))))

(assert (=> b!345433 (arrayContainsKey!0 _keys!1895 lt!162901 #b00000000000000000000000000000000)))

(declare-fun lt!162900 () Unit!10701)

(assert (=> b!345433 (= lt!162900 lt!162899)))

(declare-fun res!191128 () Bool)

(assert (=> b!345433 (= res!191128 (= (seekEntryOrOpen!0 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3313 #b00000000000000000000000000000000)))))

(assert (=> b!345433 (=> (not res!191128) (not e!211714))))

(declare-fun b!345434 () Bool)

(assert (=> b!345434 (= e!211714 call!26693)))

(declare-fun bm!26690 () Bool)

(assert (=> bm!26690 (= call!26693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71173 (not res!191129)) b!345431))

(assert (= (and b!345431 c!52982) b!345433))

(assert (= (and b!345431 (not c!52982)) b!345432))

(assert (= (and b!345433 res!191128) b!345434))

(assert (= (or b!345434 b!345432) bm!26690))

(assert (=> b!345431 m!347053))

(assert (=> b!345431 m!347053))

(assert (=> b!345431 m!347057))

(assert (=> b!345433 m!347053))

(declare-fun m!347075 () Bool)

(assert (=> b!345433 m!347075))

(declare-fun m!347077 () Bool)

(assert (=> b!345433 m!347077))

(assert (=> b!345433 m!347053))

(declare-fun m!347079 () Bool)

(assert (=> b!345433 m!347079))

(declare-fun m!347081 () Bool)

(assert (=> bm!26690 m!347081))

(assert (=> b!345321 d!71173))

(declare-fun d!71175 () Bool)

(assert (=> d!71175 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34540 d!71175))

(declare-fun d!71177 () Bool)

(assert (=> d!71177 (= (array_inv!6440 _values!1525) (bvsge (size!9068 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34540 d!71177))

(declare-fun d!71179 () Bool)

(assert (=> d!71179 (= (array_inv!6441 _keys!1895) (bvsge (size!9069 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34540 d!71179))

(declare-fun d!71181 () Bool)

(declare-fun e!211721 () Bool)

(assert (=> d!71181 e!211721))

(declare-fun res!191132 () Bool)

(assert (=> d!71181 (=> res!191132 e!211721)))

(declare-fun lt!162911 () Bool)

(assert (=> d!71181 (= res!191132 (not lt!162911))))

(declare-fun lt!162913 () Bool)

(assert (=> d!71181 (= lt!162911 lt!162913)))

(declare-fun lt!162912 () Unit!10701)

(declare-fun e!211720 () Unit!10701)

(assert (=> d!71181 (= lt!162912 e!211720)))

(declare-fun c!52985 () Bool)

(assert (=> d!71181 (= c!52985 lt!162913)))

(declare-fun containsKey!331 (List!4949 (_ BitVec 64)) Bool)

(assert (=> d!71181 (= lt!162913 (containsKey!331 (toList!2145 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71181 (= (contains!2223 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162911)))

(declare-fun b!345441 () Bool)

(declare-fun lt!162910 () Unit!10701)

(assert (=> b!345441 (= e!211720 lt!162910)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!279 (List!4949 (_ BitVec 64)) Unit!10701)

(assert (=> b!345441 (= lt!162910 (lemmaContainsKeyImpliesGetValueByKeyDefined!279 (toList!2145 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!346 0))(
  ( (Some!345 (v!5931 V!10859)) (None!344) )
))
(declare-fun isDefined!280 (Option!346) Bool)

(declare-fun getValueByKey!340 (List!4949 (_ BitVec 64)) Option!346)

(assert (=> b!345441 (isDefined!280 (getValueByKey!340 (toList!2145 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345442 () Bool)

(declare-fun Unit!10703 () Unit!10701)

(assert (=> b!345442 (= e!211720 Unit!10703)))

(declare-fun b!345443 () Bool)

(assert (=> b!345443 (= e!211721 (isDefined!280 (getValueByKey!340 (toList!2145 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71181 c!52985) b!345441))

(assert (= (and d!71181 (not c!52985)) b!345442))

(assert (= (and d!71181 (not res!191132)) b!345443))

(declare-fun m!347083 () Bool)

(assert (=> d!71181 m!347083))

(declare-fun m!347085 () Bool)

(assert (=> b!345441 m!347085))

(declare-fun m!347087 () Bool)

(assert (=> b!345441 m!347087))

(assert (=> b!345441 m!347087))

(declare-fun m!347089 () Bool)

(assert (=> b!345441 m!347089))

(assert (=> b!345443 m!347087))

(assert (=> b!345443 m!347087))

(assert (=> b!345443 m!347089))

(assert (=> b!345320 d!71181))

(declare-fun bm!26705 () Bool)

(declare-fun call!26709 () ListLongMap!4259)

(declare-fun call!26713 () ListLongMap!4259)

(assert (=> bm!26705 (= call!26709 call!26713)))

(declare-fun b!345486 () Bool)

(declare-fun e!211760 () ListLongMap!4259)

(assert (=> b!345486 (= e!211760 call!26709)))

(declare-fun bm!26706 () Bool)

(declare-fun call!26714 () Bool)

(declare-fun lt!162968 () ListLongMap!4259)

(assert (=> bm!26706 (= call!26714 (contains!2223 lt!162968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345487 () Bool)

(declare-fun e!211758 () Bool)

(declare-fun call!26708 () Bool)

(assert (=> b!345487 (= e!211758 (not call!26708))))

(declare-fun bm!26707 () Bool)

(declare-fun call!26710 () ListLongMap!4259)

(declare-fun call!26711 () ListLongMap!4259)

(assert (=> bm!26707 (= call!26710 call!26711)))

(declare-fun b!345488 () Bool)

(declare-fun e!211754 () Bool)

(assert (=> b!345488 (= e!211754 (not call!26714))))

(declare-fun b!345489 () Bool)

(declare-fun e!211751 () ListLongMap!4259)

(assert (=> b!345489 (= e!211751 call!26709)))

(declare-fun b!345490 () Bool)

(declare-fun res!191155 () Bool)

(declare-fun e!211750 () Bool)

(assert (=> b!345490 (=> (not res!191155) (not e!211750))))

(declare-fun e!211752 () Bool)

(assert (=> b!345490 (= res!191155 e!211752)))

(declare-fun res!191156 () Bool)

(assert (=> b!345490 (=> res!191156 e!211752)))

(declare-fun e!211749 () Bool)

(assert (=> b!345490 (= res!191156 (not e!211749))))

(declare-fun res!191157 () Bool)

(assert (=> b!345490 (=> (not res!191157) (not e!211749))))

(assert (=> b!345490 (= res!191157 (bvslt #b00000000000000000000000000000000 (size!9069 _keys!1895)))))

(declare-fun b!345491 () Bool)

(declare-fun e!211756 () Bool)

(declare-fun apply!281 (ListLongMap!4259 (_ BitVec 64)) V!10859)

(assert (=> b!345491 (= e!211756 (= (apply!281 lt!162968 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun d!71183 () Bool)

(assert (=> d!71183 e!211750))

(declare-fun res!191158 () Bool)

(assert (=> d!71183 (=> (not res!191158) (not e!211750))))

(assert (=> d!71183 (= res!191158 (or (bvsge #b00000000000000000000000000000000 (size!9069 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9069 _keys!1895)))))))

(declare-fun lt!162979 () ListLongMap!4259)

(assert (=> d!71183 (= lt!162968 lt!162979)))

(declare-fun lt!162971 () Unit!10701)

(declare-fun e!211755 () Unit!10701)

(assert (=> d!71183 (= lt!162971 e!211755)))

(declare-fun c!52999 () Bool)

(declare-fun e!211757 () Bool)

(assert (=> d!71183 (= c!52999 e!211757)))

(declare-fun res!191159 () Bool)

(assert (=> d!71183 (=> (not res!191159) (not e!211757))))

(assert (=> d!71183 (= res!191159 (bvslt #b00000000000000000000000000000000 (size!9069 _keys!1895)))))

(declare-fun e!211753 () ListLongMap!4259)

(assert (=> d!71183 (= lt!162979 e!211753)))

(declare-fun c!52998 () Bool)

(assert (=> d!71183 (= c!52998 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71183 (validMask!0 mask!2385)))

(assert (=> d!71183 (= (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162968)))

(declare-fun bm!26708 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!597 (array!18404 array!18402 (_ BitVec 32) (_ BitVec 32) V!10859 V!10859 (_ BitVec 32) Int) ListLongMap!4259)

(assert (=> bm!26708 (= call!26711 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345492 () Bool)

(declare-fun lt!162969 () Unit!10701)

(assert (=> b!345492 (= e!211755 lt!162969)))

(declare-fun lt!162963 () ListLongMap!4259)

(assert (=> b!345492 (= lt!162963 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162970 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162967 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162967 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162965 () Unit!10701)

(declare-fun addStillContains!257 (ListLongMap!4259 (_ BitVec 64) V!10859 (_ BitVec 64)) Unit!10701)

(assert (=> b!345492 (= lt!162965 (addStillContains!257 lt!162963 lt!162970 zeroValue!1467 lt!162967))))

(declare-fun +!732 (ListLongMap!4259 tuple2!5344) ListLongMap!4259)

(assert (=> b!345492 (contains!2223 (+!732 lt!162963 (tuple2!5345 lt!162970 zeroValue!1467)) lt!162967)))

(declare-fun lt!162961 () Unit!10701)

(assert (=> b!345492 (= lt!162961 lt!162965)))

(declare-fun lt!162959 () ListLongMap!4259)

(assert (=> b!345492 (= lt!162959 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162975 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162964 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162964 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162958 () Unit!10701)

(declare-fun addApplyDifferent!257 (ListLongMap!4259 (_ BitVec 64) V!10859 (_ BitVec 64)) Unit!10701)

(assert (=> b!345492 (= lt!162958 (addApplyDifferent!257 lt!162959 lt!162975 minValue!1467 lt!162964))))

(assert (=> b!345492 (= (apply!281 (+!732 lt!162959 (tuple2!5345 lt!162975 minValue!1467)) lt!162964) (apply!281 lt!162959 lt!162964))))

(declare-fun lt!162972 () Unit!10701)

(assert (=> b!345492 (= lt!162972 lt!162958)))

(declare-fun lt!162973 () ListLongMap!4259)

(assert (=> b!345492 (= lt!162973 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162960 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162974 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162974 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162976 () Unit!10701)

(assert (=> b!345492 (= lt!162976 (addApplyDifferent!257 lt!162973 lt!162960 zeroValue!1467 lt!162974))))

(assert (=> b!345492 (= (apply!281 (+!732 lt!162973 (tuple2!5345 lt!162960 zeroValue!1467)) lt!162974) (apply!281 lt!162973 lt!162974))))

(declare-fun lt!162966 () Unit!10701)

(assert (=> b!345492 (= lt!162966 lt!162976)))

(declare-fun lt!162978 () ListLongMap!4259)

(assert (=> b!345492 (= lt!162978 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162977 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162977 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162962 () (_ BitVec 64))

(assert (=> b!345492 (= lt!162962 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345492 (= lt!162969 (addApplyDifferent!257 lt!162978 lt!162977 minValue!1467 lt!162962))))

(assert (=> b!345492 (= (apply!281 (+!732 lt!162978 (tuple2!5345 lt!162977 minValue!1467)) lt!162962) (apply!281 lt!162978 lt!162962))))

(declare-fun bm!26709 () Bool)

(declare-fun c!53000 () Bool)

(declare-fun call!26712 () ListLongMap!4259)

(assert (=> bm!26709 (= call!26713 (+!732 (ite c!52998 call!26711 (ite c!53000 call!26710 call!26712)) (ite (or c!52998 c!53000) (tuple2!5345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345493 () Bool)

(assert (=> b!345493 (= e!211757 (validKeyInArray!0 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345494 () Bool)

(declare-fun c!53002 () Bool)

(assert (=> b!345494 (= c!53002 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!345494 (= e!211760 e!211751)))

(declare-fun b!345495 () Bool)

(assert (=> b!345495 (= e!211753 (+!732 call!26713 (tuple2!5345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!345496 () Bool)

(declare-fun e!211759 () Bool)

(declare-fun get!4703 (ValueCell!3362 V!10859) V!10859)

(declare-fun dynLambda!624 (Int (_ BitVec 64)) V!10859)

(assert (=> b!345496 (= e!211759 (= (apply!281 lt!162968 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)) (get!4703 (select (arr!8716 _values!1525) #b00000000000000000000000000000000) (dynLambda!624 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9068 _values!1525)))))

(assert (=> b!345496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9069 _keys!1895)))))

(declare-fun bm!26710 () Bool)

(assert (=> bm!26710 (= call!26708 (contains!2223 lt!162968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345497 () Bool)

(declare-fun res!191153 () Bool)

(assert (=> b!345497 (=> (not res!191153) (not e!211750))))

(assert (=> b!345497 (= res!191153 e!211758)))

(declare-fun c!53003 () Bool)

(assert (=> b!345497 (= c!53003 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345498 () Bool)

(assert (=> b!345498 (= e!211752 e!211759)))

(declare-fun res!191151 () Bool)

(assert (=> b!345498 (=> (not res!191151) (not e!211759))))

(assert (=> b!345498 (= res!191151 (contains!2223 lt!162968 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345498 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9069 _keys!1895)))))

(declare-fun b!345499 () Bool)

(assert (=> b!345499 (= e!211749 (validKeyInArray!0 (select (arr!8717 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345500 () Bool)

(assert (=> b!345500 (= e!211753 e!211760)))

(assert (=> b!345500 (= c!53000 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345501 () Bool)

(declare-fun Unit!10704 () Unit!10701)

(assert (=> b!345501 (= e!211755 Unit!10704)))

(declare-fun b!345502 () Bool)

(declare-fun e!211748 () Bool)

(assert (=> b!345502 (= e!211748 (= (apply!281 lt!162968 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345503 () Bool)

(assert (=> b!345503 (= e!211754 e!211748)))

(declare-fun res!191154 () Bool)

(assert (=> b!345503 (= res!191154 call!26714)))

(assert (=> b!345503 (=> (not res!191154) (not e!211748))))

(declare-fun bm!26711 () Bool)

(assert (=> bm!26711 (= call!26712 call!26710)))

(declare-fun b!345504 () Bool)

(assert (=> b!345504 (= e!211751 call!26712)))

(declare-fun b!345505 () Bool)

(assert (=> b!345505 (= e!211750 e!211754)))

(declare-fun c!53001 () Bool)

(assert (=> b!345505 (= c!53001 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345506 () Bool)

(assert (=> b!345506 (= e!211758 e!211756)))

(declare-fun res!191152 () Bool)

(assert (=> b!345506 (= res!191152 call!26708)))

(assert (=> b!345506 (=> (not res!191152) (not e!211756))))

(assert (= (and d!71183 c!52998) b!345495))

(assert (= (and d!71183 (not c!52998)) b!345500))

(assert (= (and b!345500 c!53000) b!345486))

(assert (= (and b!345500 (not c!53000)) b!345494))

(assert (= (and b!345494 c!53002) b!345489))

(assert (= (and b!345494 (not c!53002)) b!345504))

(assert (= (or b!345489 b!345504) bm!26711))

(assert (= (or b!345486 bm!26711) bm!26707))

(assert (= (or b!345486 b!345489) bm!26705))

(assert (= (or b!345495 bm!26707) bm!26708))

(assert (= (or b!345495 bm!26705) bm!26709))

(assert (= (and d!71183 res!191159) b!345493))

(assert (= (and d!71183 c!52999) b!345492))

(assert (= (and d!71183 (not c!52999)) b!345501))

(assert (= (and d!71183 res!191158) b!345490))

(assert (= (and b!345490 res!191157) b!345499))

(assert (= (and b!345490 (not res!191156)) b!345498))

(assert (= (and b!345498 res!191151) b!345496))

(assert (= (and b!345490 res!191155) b!345497))

(assert (= (and b!345497 c!53003) b!345506))

(assert (= (and b!345497 (not c!53003)) b!345487))

(assert (= (and b!345506 res!191152) b!345491))

(assert (= (or b!345506 b!345487) bm!26710))

(assert (= (and b!345497 res!191153) b!345505))

(assert (= (and b!345505 c!53001) b!345503))

(assert (= (and b!345505 (not c!53001)) b!345488))

(assert (= (and b!345503 res!191154) b!345502))

(assert (= (or b!345503 b!345488) bm!26706))

(declare-fun b_lambda!8485 () Bool)

(assert (=> (not b_lambda!8485) (not b!345496)))

(declare-fun t!10062 () Bool)

(declare-fun tb!3069 () Bool)

(assert (=> (and start!34540 (= defaultEntry!1528 defaultEntry!1528) t!10062) tb!3069))

(declare-fun result!5553 () Bool)

(assert (=> tb!3069 (= result!5553 tp_is_empty!7411)))

(assert (=> b!345496 t!10062))

(declare-fun b_and!14689 () Bool)

(assert (= b_and!14683 (and (=> t!10062 result!5553) b_and!14689)))

(assert (=> d!71183 m!346983))

(assert (=> b!345493 m!347053))

(assert (=> b!345493 m!347053))

(assert (=> b!345493 m!347057))

(declare-fun m!347091 () Bool)

(assert (=> bm!26710 m!347091))

(assert (=> b!345498 m!347053))

(assert (=> b!345498 m!347053))

(declare-fun m!347093 () Bool)

(assert (=> b!345498 m!347093))

(declare-fun m!347095 () Bool)

(assert (=> b!345491 m!347095))

(declare-fun m!347097 () Bool)

(assert (=> b!345496 m!347097))

(declare-fun m!347099 () Bool)

(assert (=> b!345496 m!347099))

(declare-fun m!347101 () Bool)

(assert (=> b!345496 m!347101))

(assert (=> b!345496 m!347097))

(assert (=> b!345496 m!347053))

(declare-fun m!347103 () Bool)

(assert (=> b!345496 m!347103))

(assert (=> b!345496 m!347099))

(assert (=> b!345496 m!347053))

(declare-fun m!347105 () Bool)

(assert (=> b!345492 m!347105))

(declare-fun m!347107 () Bool)

(assert (=> b!345492 m!347107))

(declare-fun m!347109 () Bool)

(assert (=> b!345492 m!347109))

(declare-fun m!347111 () Bool)

(assert (=> b!345492 m!347111))

(declare-fun m!347113 () Bool)

(assert (=> b!345492 m!347113))

(declare-fun m!347115 () Bool)

(assert (=> b!345492 m!347115))

(declare-fun m!347117 () Bool)

(assert (=> b!345492 m!347117))

(assert (=> b!345492 m!347111))

(declare-fun m!347119 () Bool)

(assert (=> b!345492 m!347119))

(declare-fun m!347121 () Bool)

(assert (=> b!345492 m!347121))

(declare-fun m!347123 () Bool)

(assert (=> b!345492 m!347123))

(assert (=> b!345492 m!347109))

(declare-fun m!347125 () Bool)

(assert (=> b!345492 m!347125))

(declare-fun m!347127 () Bool)

(assert (=> b!345492 m!347127))

(assert (=> b!345492 m!347053))

(declare-fun m!347129 () Bool)

(assert (=> b!345492 m!347129))

(declare-fun m!347131 () Bool)

(assert (=> b!345492 m!347131))

(assert (=> b!345492 m!347121))

(assert (=> b!345492 m!347115))

(declare-fun m!347133 () Bool)

(assert (=> b!345492 m!347133))

(declare-fun m!347135 () Bool)

(assert (=> b!345492 m!347135))

(declare-fun m!347137 () Bool)

(assert (=> b!345502 m!347137))

(assert (=> b!345499 m!347053))

(assert (=> b!345499 m!347053))

(assert (=> b!345499 m!347057))

(declare-fun m!347139 () Bool)

(assert (=> b!345495 m!347139))

(declare-fun m!347141 () Bool)

(assert (=> bm!26706 m!347141))

(declare-fun m!347143 () Bool)

(assert (=> bm!26709 m!347143))

(assert (=> bm!26708 m!347117))

(assert (=> b!345320 d!71183))

(declare-fun d!71185 () Bool)

(declare-fun res!191164 () Bool)

(declare-fun e!211765 () Bool)

(assert (=> d!71185 (=> res!191164 e!211765)))

(assert (=> d!71185 (= res!191164 (= (select (arr!8717 _keys!1895) (index!15432 lt!162877)) k0!1348))))

(assert (=> d!71185 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15432 lt!162877)) e!211765)))

(declare-fun b!345513 () Bool)

(declare-fun e!211766 () Bool)

(assert (=> b!345513 (= e!211765 e!211766)))

(declare-fun res!191165 () Bool)

(assert (=> b!345513 (=> (not res!191165) (not e!211766))))

(assert (=> b!345513 (= res!191165 (bvslt (bvadd (index!15432 lt!162877) #b00000000000000000000000000000001) (size!9069 _keys!1895)))))

(declare-fun b!345514 () Bool)

(assert (=> b!345514 (= e!211766 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15432 lt!162877) #b00000000000000000000000000000001)))))

(assert (= (and d!71185 (not res!191164)) b!345513))

(assert (= (and b!345513 res!191165) b!345514))

(assert (=> d!71185 m!346997))

(declare-fun m!347145 () Bool)

(assert (=> b!345514 m!347145))

(assert (=> b!345323 d!71185))

(declare-fun condMapEmpty!12567 () Bool)

(declare-fun mapDefault!12567 () ValueCell!3362)

(assert (=> mapNonEmpty!12558 (= condMapEmpty!12567 (= mapRest!12558 ((as const (Array (_ BitVec 32) ValueCell!3362)) mapDefault!12567)))))

(declare-fun e!211771 () Bool)

(declare-fun mapRes!12567 () Bool)

(assert (=> mapNonEmpty!12558 (= tp!25925 (and e!211771 mapRes!12567))))

(declare-fun mapIsEmpty!12567 () Bool)

(assert (=> mapIsEmpty!12567 mapRes!12567))

(declare-fun b!345521 () Bool)

(declare-fun e!211772 () Bool)

(assert (=> b!345521 (= e!211772 tp_is_empty!7411)))

(declare-fun mapNonEmpty!12567 () Bool)

(declare-fun tp!25941 () Bool)

(assert (=> mapNonEmpty!12567 (= mapRes!12567 (and tp!25941 e!211772))))

(declare-fun mapRest!12567 () (Array (_ BitVec 32) ValueCell!3362))

(declare-fun mapValue!12567 () ValueCell!3362)

(declare-fun mapKey!12567 () (_ BitVec 32))

(assert (=> mapNonEmpty!12567 (= mapRest!12558 (store mapRest!12567 mapKey!12567 mapValue!12567))))

(declare-fun b!345522 () Bool)

(assert (=> b!345522 (= e!211771 tp_is_empty!7411)))

(assert (= (and mapNonEmpty!12558 condMapEmpty!12567) mapIsEmpty!12567))

(assert (= (and mapNonEmpty!12558 (not condMapEmpty!12567)) mapNonEmpty!12567))

(assert (= (and mapNonEmpty!12567 ((_ is ValueCellFull!3362) mapValue!12567)) b!345521))

(assert (= (and mapNonEmpty!12558 ((_ is ValueCellFull!3362) mapDefault!12567)) b!345522))

(declare-fun m!347147 () Bool)

(assert (=> mapNonEmpty!12567 m!347147))

(declare-fun b_lambda!8487 () Bool)

(assert (= b_lambda!8485 (or (and start!34540 b_free!7459) b_lambda!8487)))

(check-sat (not b!345492) (not b_lambda!8487) b_and!14689 (not b!345433) (not bm!26708) (not bm!26690) (not bm!26706) (not b!345431) (not b!345502) (not b!345403) (not d!71169) (not b!345499) tp_is_empty!7411 (not bm!26709) (not b!345493) (not b!345402) (not b!345441) (not bm!26687) (not b_next!7459) (not mapNonEmpty!12567) (not b!345498) (not b!345443) (not b!345491) (not d!71181) (not b!345496) (not b!345418) (not d!71183) (not b!345401) (not b!345514) (not bm!26710) (not b!345495))
(check-sat b_and!14689 (not b_next!7459))
