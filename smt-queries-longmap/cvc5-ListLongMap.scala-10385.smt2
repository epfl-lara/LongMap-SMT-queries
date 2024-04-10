; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122286 () Bool)

(assert start!122286)

(declare-fun b!1417970 () Bool)

(declare-fun res!953670 () Bool)

(declare-fun e!802466 () Bool)

(assert (=> b!1417970 (=> (not res!953670) (not e!802466))))

(declare-datatypes ((array!96822 0))(
  ( (array!96823 (arr!46736 (Array (_ BitVec 32) (_ BitVec 64))) (size!47286 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96822)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417970 (= res!953670 (validKeyInArray!0 (select (arr!46736 a!2831) j!81)))))

(declare-fun b!1417971 () Bool)

(declare-fun res!953668 () Bool)

(assert (=> b!1417971 (=> (not res!953668) (not e!802466))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417971 (= res!953668 (and (= (size!47286 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47286 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47286 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417972 () Bool)

(declare-fun res!953669 () Bool)

(assert (=> b!1417972 (=> (not res!953669) (not e!802466))))

(assert (=> b!1417972 (= res!953669 (validKeyInArray!0 (select (arr!46736 a!2831) i!982)))))

(declare-fun b!1417973 () Bool)

(declare-fun res!953671 () Bool)

(assert (=> b!1417973 (=> (not res!953671) (not e!802466))))

(assert (=> b!1417973 (= res!953671 (and (bvsle #b00000000000000000000000000000000 (size!47286 a!2831)) (bvslt (size!47286 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1417975 () Bool)

(declare-fun res!953665 () Bool)

(assert (=> b!1417975 (=> (not res!953665) (not e!802466))))

(declare-datatypes ((List!33246 0))(
  ( (Nil!33243) (Cons!33242 (h!34535 (_ BitVec 64)) (t!47940 List!33246)) )
))
(declare-fun noDuplicate!2609 (List!33246) Bool)

(assert (=> b!1417975 (= res!953665 (noDuplicate!2609 Nil!33243))))

(declare-fun b!1417974 () Bool)

(declare-fun e!802464 () Bool)

(declare-fun contains!9834 (List!33246 (_ BitVec 64)) Bool)

(assert (=> b!1417974 (= e!802464 (contains!9834 Nil!33243 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!953666 () Bool)

(assert (=> start!122286 (=> (not res!953666) (not e!802466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122286 (= res!953666 (validMask!0 mask!2608))))

(assert (=> start!122286 e!802466))

(assert (=> start!122286 true))

(declare-fun array_inv!35764 (array!96822) Bool)

(assert (=> start!122286 (array_inv!35764 a!2831)))

(declare-fun b!1417976 () Bool)

(declare-fun res!953667 () Bool)

(assert (=> b!1417976 (=> (not res!953667) (not e!802466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96822 (_ BitVec 32)) Bool)

(assert (=> b!1417976 (= res!953667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417977 () Bool)

(assert (=> b!1417977 (= e!802466 e!802464)))

(declare-fun res!953664 () Bool)

(assert (=> b!1417977 (=> res!953664 e!802464)))

(assert (=> b!1417977 (= res!953664 (contains!9834 Nil!33243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!122286 res!953666) b!1417971))

(assert (= (and b!1417971 res!953668) b!1417972))

(assert (= (and b!1417972 res!953669) b!1417970))

(assert (= (and b!1417970 res!953670) b!1417976))

(assert (= (and b!1417976 res!953667) b!1417973))

(assert (= (and b!1417973 res!953671) b!1417975))

(assert (= (and b!1417975 res!953665) b!1417977))

(assert (= (and b!1417977 (not res!953664)) b!1417974))

(declare-fun m!1308729 () Bool)

(assert (=> b!1417972 m!1308729))

(assert (=> b!1417972 m!1308729))

(declare-fun m!1308731 () Bool)

(assert (=> b!1417972 m!1308731))

(declare-fun m!1308733 () Bool)

(assert (=> b!1417975 m!1308733))

(declare-fun m!1308735 () Bool)

(assert (=> b!1417976 m!1308735))

(declare-fun m!1308737 () Bool)

(assert (=> b!1417974 m!1308737))

(declare-fun m!1308739 () Bool)

(assert (=> b!1417977 m!1308739))

(declare-fun m!1308741 () Bool)

(assert (=> b!1417970 m!1308741))

(assert (=> b!1417970 m!1308741))

(declare-fun m!1308743 () Bool)

(assert (=> b!1417970 m!1308743))

(declare-fun m!1308745 () Bool)

(assert (=> start!122286 m!1308745))

(declare-fun m!1308747 () Bool)

(assert (=> start!122286 m!1308747))

(push 1)

(assert (not start!122286))

(assert (not b!1417975))

(assert (not b!1417970))

(assert (not b!1417974))

(assert (not b!1417976))

(assert (not b!1417977))

(assert (not b!1417972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152789 () Bool)

(assert (=> d!152789 (= (validKeyInArray!0 (select (arr!46736 a!2831) j!81)) (and (not (= (select (arr!46736 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46736 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417970 d!152789))

(declare-fun d!152793 () Bool)

(declare-fun res!953734 () Bool)

(declare-fun e!802499 () Bool)

(assert (=> d!152793 (=> res!953734 e!802499)))

(assert (=> d!152793 (= res!953734 (is-Nil!33243 Nil!33243))))

(assert (=> d!152793 (= (noDuplicate!2609 Nil!33243) e!802499)))

(declare-fun b!1418040 () Bool)

(declare-fun e!802500 () Bool)

(assert (=> b!1418040 (= e!802499 e!802500)))

(declare-fun res!953735 () Bool)

(assert (=> b!1418040 (=> (not res!953735) (not e!802500))))

(assert (=> b!1418040 (= res!953735 (not (contains!9834 (t!47940 Nil!33243) (h!34535 Nil!33243))))))

(declare-fun b!1418041 () Bool)

(assert (=> b!1418041 (= e!802500 (noDuplicate!2609 (t!47940 Nil!33243)))))

(assert (= (and d!152793 (not res!953734)) b!1418040))

(assert (= (and b!1418040 res!953735) b!1418041))

(declare-fun m!1308795 () Bool)

(assert (=> b!1418040 m!1308795))

(declare-fun m!1308797 () Bool)

(assert (=> b!1418041 m!1308797))

(assert (=> b!1417975 d!152793))

(declare-fun bm!67245 () Bool)

(declare-fun call!67248 () Bool)

(assert (=> bm!67245 (= call!67248 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418080 () Bool)

(declare-fun e!802533 () Bool)

(declare-fun e!802532 () Bool)

(assert (=> b!1418080 (= e!802533 e!802532)))

(declare-fun lt!625524 () (_ BitVec 64))

(assert (=> b!1418080 (= lt!625524 (select (arr!46736 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48056 0))(
  ( (Unit!48057) )
))
(declare-fun lt!625525 () Unit!48056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96822 (_ BitVec 64) (_ BitVec 32)) Unit!48056)

(assert (=> b!1418080 (= lt!625525 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625524 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418080 (arrayContainsKey!0 a!2831 lt!625524 #b00000000000000000000000000000000)))

(declare-fun lt!625523 () Unit!48056)

(assert (=> b!1418080 (= lt!625523 lt!625525)))

(declare-fun res!953761 () Bool)

(declare-datatypes ((SeekEntryResult!11041 0))(
  ( (MissingZero!11041 (index!46556 (_ BitVec 32))) (Found!11041 (index!46557 (_ BitVec 32))) (Intermediate!11041 (undefined!11853 Bool) (index!46558 (_ BitVec 32)) (x!128172 (_ BitVec 32))) (Undefined!11041) (MissingVacant!11041 (index!46559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96822 (_ BitVec 32)) SeekEntryResult!11041)

(assert (=> b!1418080 (= res!953761 (= (seekEntryOrOpen!0 (select (arr!46736 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11041 #b00000000000000000000000000000000)))))

(assert (=> b!1418080 (=> (not res!953761) (not e!802532))))

(declare-fun b!1418081 () Bool)

(assert (=> b!1418081 (= e!802533 call!67248)))

(declare-fun d!152795 () Bool)

(declare-fun res!953760 () Bool)

(declare-fun e!802534 () Bool)

(assert (=> d!152795 (=> res!953760 e!802534)))

(assert (=> d!152795 (= res!953760 (bvsge #b00000000000000000000000000000000 (size!47286 a!2831)))))

(assert (=> d!152795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802534)))

(declare-fun b!1418082 () Bool)

(assert (=> b!1418082 (= e!802532 call!67248)))

(declare-fun b!1418083 () Bool)

(assert (=> b!1418083 (= e!802534 e!802533)))

(declare-fun c!131642 () Bool)

(assert (=> b!1418083 (= c!131642 (validKeyInArray!0 (select (arr!46736 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152795 (not res!953760)) b!1418083))

(assert (= (and b!1418083 c!131642) b!1418080))

(assert (= (and b!1418083 (not c!131642)) b!1418081))

(assert (= (and b!1418080 res!953761) b!1418082))

(assert (= (or b!1418082 b!1418081) bm!67245))

(declare-fun m!1308825 () Bool)

(assert (=> bm!67245 m!1308825))

(declare-fun m!1308827 () Bool)

(assert (=> b!1418080 m!1308827))

(declare-fun m!1308829 () Bool)

(assert (=> b!1418080 m!1308829))

(declare-fun m!1308831 () Bool)

(assert (=> b!1418080 m!1308831))

(assert (=> b!1418080 m!1308827))

(declare-fun m!1308833 () Bool)

(assert (=> b!1418080 m!1308833))

(assert (=> b!1418083 m!1308827))

(assert (=> b!1418083 m!1308827))

(declare-fun m!1308835 () Bool)

(assert (=> b!1418083 m!1308835))

(assert (=> b!1417976 d!152795))

(declare-fun d!152811 () Bool)

(assert (=> d!152811 (= (validKeyInArray!0 (select (arr!46736 a!2831) i!982)) (and (not (= (select (arr!46736 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46736 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417972 d!152811))

(declare-fun d!152813 () Bool)

(declare-fun lt!625531 () Bool)

(declare-fun content!771 (List!33246) (Set (_ BitVec 64)))

(assert (=> d!152813 (= lt!625531 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!771 Nil!33243)))))

(declare-fun e!802545 () Bool)

(assert (=> d!152813 (= lt!625531 e!802545)))

(declare-fun res!953770 () Bool)

(assert (=> d!152813 (=> (not res!953770) (not e!802545))))

(assert (=> d!152813 (= res!953770 (is-Cons!33242 Nil!33243))))

(assert (=> d!152813 (= (contains!9834 Nil!33243 #b0000000000000000000000000000000000000000000000000000000000000000) lt!625531)))

(declare-fun b!1418094 () Bool)

(declare-fun e!802544 () Bool)

(assert (=> b!1418094 (= e!802545 e!802544)))

(declare-fun res!953771 () Bool)

(assert (=> b!1418094 (=> res!953771 e!802544)))

(assert (=> b!1418094 (= res!953771 (= (h!34535 Nil!33243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1418095 () Bool)

(assert (=> b!1418095 (= e!802544 (contains!9834 (t!47940 Nil!33243) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152813 res!953770) b!1418094))

(assert (= (and b!1418094 (not res!953771)) b!1418095))

(declare-fun m!1308849 () Bool)

(assert (=> d!152813 m!1308849))

(declare-fun m!1308851 () Bool)

