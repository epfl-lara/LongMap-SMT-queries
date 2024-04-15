; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46836 () Bool)

(assert start!46836)

(declare-fun b!516885 () Bool)

(declare-fun res!316410 () Bool)

(declare-fun e!301608 () Bool)

(assert (=> b!516885 (=> (not res!316410) (not e!301608))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33101 0))(
  ( (array!33102 (arr!15917 (Array (_ BitVec 32) (_ BitVec 64))) (size!16282 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33101)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516885 (= res!316410 (and (= (size!16282 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16282 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16282 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516886 () Bool)

(declare-fun e!301609 () Bool)

(assert (=> b!516886 (= e!301608 e!301609)))

(declare-fun res!316412 () Bool)

(assert (=> b!516886 (=> (not res!316412) (not e!301609))))

(declare-datatypes ((SeekEntryResult!4381 0))(
  ( (MissingZero!4381 (index!19712 (_ BitVec 32))) (Found!4381 (index!19713 (_ BitVec 32))) (Intermediate!4381 (undefined!5193 Bool) (index!19714 (_ BitVec 32)) (x!48681 (_ BitVec 32))) (Undefined!4381) (MissingVacant!4381 (index!19715 (_ BitVec 32))) )
))
(declare-fun lt!236507 () SeekEntryResult!4381)

(assert (=> b!516886 (= res!316412 (or (= lt!236507 (MissingZero!4381 i!1204)) (= lt!236507 (MissingVacant!4381 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33101 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!516886 (= lt!236507 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516887 () Bool)

(declare-fun res!316409 () Bool)

(assert (=> b!516887 (=> (not res!316409) (not e!301609))))

(declare-datatypes ((List!10114 0))(
  ( (Nil!10111) (Cons!10110 (h!11011 (_ BitVec 64)) (t!16333 List!10114)) )
))
(declare-fun arrayNoDuplicates!0 (array!33101 (_ BitVec 32) List!10114) Bool)

(assert (=> b!516887 (= res!316409 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10111))))

(declare-fun e!301607 () Bool)

(declare-fun lt!236506 () (_ BitVec 32))

(declare-fun lt!236505 () SeekEntryResult!4381)

(declare-fun b!516888 () Bool)

(assert (=> b!516888 (= e!301607 (or (not (= (select (arr!15917 a!3235) (index!19714 lt!236505)) (select (arr!15917 a!3235) j!176))) (bvsgt (x!48681 lt!236505) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48681 lt!236505)) (and (bvsge lt!236506 #b00000000000000000000000000000000) (bvslt lt!236506 (size!16282 a!3235)))))))

(assert (=> b!516888 (and (bvslt (x!48681 lt!236505) #b01111111111111111111111111111110) (or (= (select (arr!15917 a!3235) (index!19714 lt!236505)) (select (arr!15917 a!3235) j!176)) (= (select (arr!15917 a!3235) (index!19714 lt!236505)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15917 a!3235) (index!19714 lt!236505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516889 () Bool)

(declare-fun res!316413 () Bool)

(assert (=> b!516889 (=> (not res!316413) (not e!301609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33101 (_ BitVec 32)) Bool)

(assert (=> b!516889 (= res!316413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516890 () Bool)

(declare-fun e!301610 () Bool)

(assert (=> b!516890 (= e!301610 (= (seekEntryOrOpen!0 (select (arr!15917 a!3235) j!176) a!3235 mask!3524) (Found!4381 j!176)))))

(declare-fun b!516891 () Bool)

(declare-fun res!316416 () Bool)

(assert (=> b!516891 (=> (not res!316416) (not e!301608))))

(declare-fun arrayContainsKey!0 (array!33101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516891 (= res!316416 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516893 () Bool)

(assert (=> b!516893 (= e!301609 (not e!301607))))

(declare-fun res!316417 () Bool)

(assert (=> b!516893 (=> res!316417 e!301607)))

(declare-fun lt!236509 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33101 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!516893 (= res!316417 (= lt!236505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236509 (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235)) mask!3524)))))

(assert (=> b!516893 (= lt!236505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236506 (select (arr!15917 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516893 (= lt!236509 (toIndex!0 (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516893 (= lt!236506 (toIndex!0 (select (arr!15917 a!3235) j!176) mask!3524))))

(assert (=> b!516893 e!301610))

(declare-fun res!316415 () Bool)

(assert (=> b!516893 (=> (not res!316415) (not e!301610))))

(assert (=> b!516893 (= res!316415 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16006 0))(
  ( (Unit!16007) )
))
(declare-fun lt!236508 () Unit!16006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16006)

(assert (=> b!516893 (= lt!236508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516894 () Bool)

(declare-fun res!316408 () Bool)

(assert (=> b!516894 (=> (not res!316408) (not e!301608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516894 (= res!316408 (validKeyInArray!0 k0!2280))))

(declare-fun b!516895 () Bool)

(declare-fun res!316411 () Bool)

(assert (=> b!516895 (=> res!316411 e!301607)))

(get-info :version)

(assert (=> b!516895 (= res!316411 (or (undefined!5193 lt!236505) (not ((_ is Intermediate!4381) lt!236505))))))

(declare-fun b!516892 () Bool)

(declare-fun res!316418 () Bool)

(assert (=> b!516892 (=> (not res!316418) (not e!301608))))

(assert (=> b!516892 (= res!316418 (validKeyInArray!0 (select (arr!15917 a!3235) j!176)))))

(declare-fun res!316414 () Bool)

(assert (=> start!46836 (=> (not res!316414) (not e!301608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46836 (= res!316414 (validMask!0 mask!3524))))

(assert (=> start!46836 e!301608))

(assert (=> start!46836 true))

(declare-fun array_inv!11800 (array!33101) Bool)

(assert (=> start!46836 (array_inv!11800 a!3235)))

(assert (= (and start!46836 res!316414) b!516885))

(assert (= (and b!516885 res!316410) b!516892))

(assert (= (and b!516892 res!316418) b!516894))

(assert (= (and b!516894 res!316408) b!516891))

(assert (= (and b!516891 res!316416) b!516886))

(assert (= (and b!516886 res!316412) b!516889))

(assert (= (and b!516889 res!316413) b!516887))

(assert (= (and b!516887 res!316409) b!516893))

(assert (= (and b!516893 res!316415) b!516890))

(assert (= (and b!516893 (not res!316417)) b!516895))

(assert (= (and b!516895 (not res!316411)) b!516888))

(declare-fun m!497869 () Bool)

(assert (=> b!516892 m!497869))

(assert (=> b!516892 m!497869))

(declare-fun m!497871 () Bool)

(assert (=> b!516892 m!497871))

(declare-fun m!497873 () Bool)

(assert (=> b!516891 m!497873))

(declare-fun m!497875 () Bool)

(assert (=> b!516888 m!497875))

(assert (=> b!516888 m!497869))

(declare-fun m!497877 () Bool)

(assert (=> b!516894 m!497877))

(declare-fun m!497879 () Bool)

(assert (=> b!516886 m!497879))

(declare-fun m!497881 () Bool)

(assert (=> start!46836 m!497881))

(declare-fun m!497883 () Bool)

(assert (=> start!46836 m!497883))

(declare-fun m!497885 () Bool)

(assert (=> b!516887 m!497885))

(declare-fun m!497887 () Bool)

(assert (=> b!516893 m!497887))

(assert (=> b!516893 m!497869))

(declare-fun m!497889 () Bool)

(assert (=> b!516893 m!497889))

(declare-fun m!497891 () Bool)

(assert (=> b!516893 m!497891))

(declare-fun m!497893 () Bool)

(assert (=> b!516893 m!497893))

(assert (=> b!516893 m!497869))

(declare-fun m!497895 () Bool)

(assert (=> b!516893 m!497895))

(assert (=> b!516893 m!497893))

(declare-fun m!497897 () Bool)

(assert (=> b!516893 m!497897))

(assert (=> b!516893 m!497869))

(declare-fun m!497899 () Bool)

(assert (=> b!516893 m!497899))

(assert (=> b!516893 m!497893))

(declare-fun m!497901 () Bool)

(assert (=> b!516893 m!497901))

(assert (=> b!516890 m!497869))

(assert (=> b!516890 m!497869))

(declare-fun m!497903 () Bool)

(assert (=> b!516890 m!497903))

(declare-fun m!497905 () Bool)

(assert (=> b!516889 m!497905))

(check-sat (not start!46836) (not b!516889) (not b!516891) (not b!516893) (not b!516887) (not b!516894) (not b!516890) (not b!516892) (not b!516886))
(check-sat)
(get-model)

(declare-fun d!79465 () Bool)

(assert (=> d!79465 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46836 d!79465))

(declare-fun d!79467 () Bool)

(assert (=> d!79467 (= (array_inv!11800 a!3235) (bvsge (size!16282 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46836 d!79467))

(declare-fun d!79469 () Bool)

(declare-fun res!316490 () Bool)

(declare-fun e!301648 () Bool)

(assert (=> d!79469 (=> res!316490 e!301648)))

(assert (=> d!79469 (= res!316490 (bvsge #b00000000000000000000000000000000 (size!16282 a!3235)))))

(assert (=> d!79469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301648)))

(declare-fun b!516970 () Bool)

(declare-fun e!301650 () Bool)

(declare-fun call!31639 () Bool)

(assert (=> b!516970 (= e!301650 call!31639)))

(declare-fun b!516971 () Bool)

(declare-fun e!301649 () Bool)

(assert (=> b!516971 (= e!301649 e!301650)))

(declare-fun lt!236547 () (_ BitVec 64))

(assert (=> b!516971 (= lt!236547 (select (arr!15917 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236548 () Unit!16006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33101 (_ BitVec 64) (_ BitVec 32)) Unit!16006)

(assert (=> b!516971 (= lt!236548 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236547 #b00000000000000000000000000000000))))

(assert (=> b!516971 (arrayContainsKey!0 a!3235 lt!236547 #b00000000000000000000000000000000)))

(declare-fun lt!236546 () Unit!16006)

(assert (=> b!516971 (= lt!236546 lt!236548)))

(declare-fun res!316489 () Bool)

(assert (=> b!516971 (= res!316489 (= (seekEntryOrOpen!0 (select (arr!15917 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4381 #b00000000000000000000000000000000)))))

(assert (=> b!516971 (=> (not res!316489) (not e!301650))))

(declare-fun b!516972 () Bool)

(assert (=> b!516972 (= e!301648 e!301649)))

(declare-fun c!60531 () Bool)

(assert (=> b!516972 (= c!60531 (validKeyInArray!0 (select (arr!15917 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31636 () Bool)

(assert (=> bm!31636 (= call!31639 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!516973 () Bool)

(assert (=> b!516973 (= e!301649 call!31639)))

(assert (= (and d!79469 (not res!316490)) b!516972))

(assert (= (and b!516972 c!60531) b!516971))

(assert (= (and b!516972 (not c!60531)) b!516973))

(assert (= (and b!516971 res!316489) b!516970))

(assert (= (or b!516970 b!516973) bm!31636))

(declare-fun m!497983 () Bool)

(assert (=> b!516971 m!497983))

(declare-fun m!497985 () Bool)

(assert (=> b!516971 m!497985))

(declare-fun m!497987 () Bool)

(assert (=> b!516971 m!497987))

(assert (=> b!516971 m!497983))

(declare-fun m!497989 () Bool)

(assert (=> b!516971 m!497989))

(assert (=> b!516972 m!497983))

(assert (=> b!516972 m!497983))

(declare-fun m!497991 () Bool)

(assert (=> b!516972 m!497991))

(declare-fun m!497993 () Bool)

(assert (=> bm!31636 m!497993))

(assert (=> b!516889 d!79469))

(declare-fun d!79471 () Bool)

(assert (=> d!79471 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516894 d!79471))

(declare-fun d!79473 () Bool)

(declare-fun res!316495 () Bool)

(declare-fun e!301655 () Bool)

(assert (=> d!79473 (=> res!316495 e!301655)))

(assert (=> d!79473 (= res!316495 (= (select (arr!15917 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79473 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!301655)))

(declare-fun b!516978 () Bool)

(declare-fun e!301656 () Bool)

(assert (=> b!516978 (= e!301655 e!301656)))

(declare-fun res!316496 () Bool)

(assert (=> b!516978 (=> (not res!316496) (not e!301656))))

(assert (=> b!516978 (= res!316496 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16282 a!3235)))))

(declare-fun b!516979 () Bool)

(assert (=> b!516979 (= e!301656 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79473 (not res!316495)) b!516978))

(assert (= (and b!516978 res!316496) b!516979))

(assert (=> d!79473 m!497983))

(declare-fun m!497995 () Bool)

(assert (=> b!516979 m!497995))

(assert (=> b!516891 d!79473))

(declare-fun b!516992 () Bool)

(declare-fun e!301665 () SeekEntryResult!4381)

(assert (=> b!516992 (= e!301665 Undefined!4381)))

(declare-fun d!79475 () Bool)

(declare-fun lt!236557 () SeekEntryResult!4381)

(assert (=> d!79475 (and (or ((_ is Undefined!4381) lt!236557) (not ((_ is Found!4381) lt!236557)) (and (bvsge (index!19713 lt!236557) #b00000000000000000000000000000000) (bvslt (index!19713 lt!236557) (size!16282 a!3235)))) (or ((_ is Undefined!4381) lt!236557) ((_ is Found!4381) lt!236557) (not ((_ is MissingZero!4381) lt!236557)) (and (bvsge (index!19712 lt!236557) #b00000000000000000000000000000000) (bvslt (index!19712 lt!236557) (size!16282 a!3235)))) (or ((_ is Undefined!4381) lt!236557) ((_ is Found!4381) lt!236557) ((_ is MissingZero!4381) lt!236557) (not ((_ is MissingVacant!4381) lt!236557)) (and (bvsge (index!19715 lt!236557) #b00000000000000000000000000000000) (bvslt (index!19715 lt!236557) (size!16282 a!3235)))) (or ((_ is Undefined!4381) lt!236557) (ite ((_ is Found!4381) lt!236557) (= (select (arr!15917 a!3235) (index!19713 lt!236557)) (select (arr!15917 a!3235) j!176)) (ite ((_ is MissingZero!4381) lt!236557) (= (select (arr!15917 a!3235) (index!19712 lt!236557)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4381) lt!236557) (= (select (arr!15917 a!3235) (index!19715 lt!236557)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79475 (= lt!236557 e!301665)))

(declare-fun c!60540 () Bool)

(declare-fun lt!236555 () SeekEntryResult!4381)

(assert (=> d!79475 (= c!60540 (and ((_ is Intermediate!4381) lt!236555) (undefined!5193 lt!236555)))))

(assert (=> d!79475 (= lt!236555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15917 a!3235) j!176) mask!3524) (select (arr!15917 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79475 (validMask!0 mask!3524)))

(assert (=> d!79475 (= (seekEntryOrOpen!0 (select (arr!15917 a!3235) j!176) a!3235 mask!3524) lt!236557)))

(declare-fun b!516993 () Bool)

(declare-fun e!301663 () SeekEntryResult!4381)

(assert (=> b!516993 (= e!301665 e!301663)))

(declare-fun lt!236556 () (_ BitVec 64))

(assert (=> b!516993 (= lt!236556 (select (arr!15917 a!3235) (index!19714 lt!236555)))))

(declare-fun c!60539 () Bool)

(assert (=> b!516993 (= c!60539 (= lt!236556 (select (arr!15917 a!3235) j!176)))))

(declare-fun b!516994 () Bool)

(declare-fun c!60538 () Bool)

(assert (=> b!516994 (= c!60538 (= lt!236556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301664 () SeekEntryResult!4381)

(assert (=> b!516994 (= e!301663 e!301664)))

(declare-fun b!516995 () Bool)

(assert (=> b!516995 (= e!301663 (Found!4381 (index!19714 lt!236555)))))

(declare-fun b!516996 () Bool)

(assert (=> b!516996 (= e!301664 (MissingZero!4381 (index!19714 lt!236555)))))

(declare-fun b!516997 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33101 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!516997 (= e!301664 (seekKeyOrZeroReturnVacant!0 (x!48681 lt!236555) (index!19714 lt!236555) (index!19714 lt!236555) (select (arr!15917 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79475 c!60540) b!516992))

(assert (= (and d!79475 (not c!60540)) b!516993))

(assert (= (and b!516993 c!60539) b!516995))

(assert (= (and b!516993 (not c!60539)) b!516994))

(assert (= (and b!516994 c!60538) b!516996))

(assert (= (and b!516994 (not c!60538)) b!516997))

(assert (=> d!79475 m!497869))

(assert (=> d!79475 m!497899))

(assert (=> d!79475 m!497881))

(declare-fun m!497997 () Bool)

(assert (=> d!79475 m!497997))

(assert (=> d!79475 m!497899))

(assert (=> d!79475 m!497869))

(declare-fun m!497999 () Bool)

(assert (=> d!79475 m!497999))

(declare-fun m!498001 () Bool)

(assert (=> d!79475 m!498001))

(declare-fun m!498003 () Bool)

(assert (=> d!79475 m!498003))

(declare-fun m!498005 () Bool)

(assert (=> b!516993 m!498005))

(assert (=> b!516997 m!497869))

(declare-fun m!498007 () Bool)

(assert (=> b!516997 m!498007))

(assert (=> b!516890 d!79475))

(declare-fun b!517023 () Bool)

(declare-fun e!301688 () Bool)

(declare-fun e!301686 () Bool)

(assert (=> b!517023 (= e!301688 e!301686)))

(declare-fun res!316513 () Bool)

(assert (=> b!517023 (=> (not res!316513) (not e!301686))))

(declare-fun e!301689 () Bool)

(assert (=> b!517023 (= res!316513 (not e!301689))))

(declare-fun res!316514 () Bool)

(assert (=> b!517023 (=> (not res!316514) (not e!301689))))

(assert (=> b!517023 (= res!316514 (validKeyInArray!0 (select (arr!15917 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517024 () Bool)

(declare-fun e!301687 () Bool)

(declare-fun call!31645 () Bool)

(assert (=> b!517024 (= e!301687 call!31645)))

(declare-fun d!79487 () Bool)

(declare-fun res!316515 () Bool)

(assert (=> d!79487 (=> res!316515 e!301688)))

(assert (=> d!79487 (= res!316515 (bvsge #b00000000000000000000000000000000 (size!16282 a!3235)))))

(assert (=> d!79487 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10111) e!301688)))

(declare-fun b!517025 () Bool)

(assert (=> b!517025 (= e!301687 call!31645)))

(declare-fun b!517026 () Bool)

(declare-fun contains!2729 (List!10114 (_ BitVec 64)) Bool)

(assert (=> b!517026 (= e!301689 (contains!2729 Nil!10111 (select (arr!15917 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31642 () Bool)

(declare-fun c!60546 () Bool)

(assert (=> bm!31642 (= call!31645 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60546 (Cons!10110 (select (arr!15917 a!3235) #b00000000000000000000000000000000) Nil!10111) Nil!10111)))))

(declare-fun b!517027 () Bool)

(assert (=> b!517027 (= e!301686 e!301687)))

(assert (=> b!517027 (= c!60546 (validKeyInArray!0 (select (arr!15917 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79487 (not res!316515)) b!517023))

(assert (= (and b!517023 res!316514) b!517026))

(assert (= (and b!517023 res!316513) b!517027))

(assert (= (and b!517027 c!60546) b!517024))

(assert (= (and b!517027 (not c!60546)) b!517025))

(assert (= (or b!517024 b!517025) bm!31642))

(assert (=> b!517023 m!497983))

(assert (=> b!517023 m!497983))

(assert (=> b!517023 m!497991))

(assert (=> b!517026 m!497983))

(assert (=> b!517026 m!497983))

(declare-fun m!498017 () Bool)

(assert (=> b!517026 m!498017))

(assert (=> bm!31642 m!497983))

(declare-fun m!498019 () Bool)

(assert (=> bm!31642 m!498019))

(assert (=> b!517027 m!497983))

(assert (=> b!517027 m!497983))

(assert (=> b!517027 m!497991))

(assert (=> b!516887 d!79487))

(declare-fun d!79495 () Bool)

(assert (=> d!79495 (= (validKeyInArray!0 (select (arr!15917 a!3235) j!176)) (and (not (= (select (arr!15917 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15917 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516892 d!79495))

(declare-fun b!517028 () Bool)

(declare-fun e!301692 () SeekEntryResult!4381)

(assert (=> b!517028 (= e!301692 Undefined!4381)))

(declare-fun d!79497 () Bool)

(declare-fun lt!236566 () SeekEntryResult!4381)

(assert (=> d!79497 (and (or ((_ is Undefined!4381) lt!236566) (not ((_ is Found!4381) lt!236566)) (and (bvsge (index!19713 lt!236566) #b00000000000000000000000000000000) (bvslt (index!19713 lt!236566) (size!16282 a!3235)))) (or ((_ is Undefined!4381) lt!236566) ((_ is Found!4381) lt!236566) (not ((_ is MissingZero!4381) lt!236566)) (and (bvsge (index!19712 lt!236566) #b00000000000000000000000000000000) (bvslt (index!19712 lt!236566) (size!16282 a!3235)))) (or ((_ is Undefined!4381) lt!236566) ((_ is Found!4381) lt!236566) ((_ is MissingZero!4381) lt!236566) (not ((_ is MissingVacant!4381) lt!236566)) (and (bvsge (index!19715 lt!236566) #b00000000000000000000000000000000) (bvslt (index!19715 lt!236566) (size!16282 a!3235)))) (or ((_ is Undefined!4381) lt!236566) (ite ((_ is Found!4381) lt!236566) (= (select (arr!15917 a!3235) (index!19713 lt!236566)) k0!2280) (ite ((_ is MissingZero!4381) lt!236566) (= (select (arr!15917 a!3235) (index!19712 lt!236566)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4381) lt!236566) (= (select (arr!15917 a!3235) (index!19715 lt!236566)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79497 (= lt!236566 e!301692)))

(declare-fun c!60549 () Bool)

(declare-fun lt!236564 () SeekEntryResult!4381)

(assert (=> d!79497 (= c!60549 (and ((_ is Intermediate!4381) lt!236564) (undefined!5193 lt!236564)))))

(assert (=> d!79497 (= lt!236564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79497 (validMask!0 mask!3524)))

(assert (=> d!79497 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!236566)))

(declare-fun b!517029 () Bool)

(declare-fun e!301690 () SeekEntryResult!4381)

(assert (=> b!517029 (= e!301692 e!301690)))

(declare-fun lt!236565 () (_ BitVec 64))

(assert (=> b!517029 (= lt!236565 (select (arr!15917 a!3235) (index!19714 lt!236564)))))

(declare-fun c!60548 () Bool)

(assert (=> b!517029 (= c!60548 (= lt!236565 k0!2280))))

(declare-fun b!517030 () Bool)

(declare-fun c!60547 () Bool)

(assert (=> b!517030 (= c!60547 (= lt!236565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301691 () SeekEntryResult!4381)

(assert (=> b!517030 (= e!301690 e!301691)))

(declare-fun b!517031 () Bool)

(assert (=> b!517031 (= e!301690 (Found!4381 (index!19714 lt!236564)))))

(declare-fun b!517032 () Bool)

(assert (=> b!517032 (= e!301691 (MissingZero!4381 (index!19714 lt!236564)))))

(declare-fun b!517033 () Bool)

(assert (=> b!517033 (= e!301691 (seekKeyOrZeroReturnVacant!0 (x!48681 lt!236564) (index!19714 lt!236564) (index!19714 lt!236564) k0!2280 a!3235 mask!3524))))

(assert (= (and d!79497 c!60549) b!517028))

(assert (= (and d!79497 (not c!60549)) b!517029))

(assert (= (and b!517029 c!60548) b!517031))

(assert (= (and b!517029 (not c!60548)) b!517030))

(assert (= (and b!517030 c!60547) b!517032))

(assert (= (and b!517030 (not c!60547)) b!517033))

(declare-fun m!498021 () Bool)

(assert (=> d!79497 m!498021))

(assert (=> d!79497 m!497881))

(declare-fun m!498023 () Bool)

(assert (=> d!79497 m!498023))

(assert (=> d!79497 m!498021))

(declare-fun m!498025 () Bool)

(assert (=> d!79497 m!498025))

(declare-fun m!498027 () Bool)

(assert (=> d!79497 m!498027))

(declare-fun m!498029 () Bool)

(assert (=> d!79497 m!498029))

(declare-fun m!498031 () Bool)

(assert (=> b!517029 m!498031))

(declare-fun m!498033 () Bool)

(assert (=> b!517033 m!498033))

(assert (=> b!516886 d!79497))

(declare-fun b!517103 () Bool)

(declare-fun e!301737 () Bool)

(declare-fun lt!236606 () SeekEntryResult!4381)

(assert (=> b!517103 (= e!301737 (bvsge (x!48681 lt!236606) #b01111111111111111111111111111110))))

(declare-fun e!301739 () SeekEntryResult!4381)

(declare-fun b!517104 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517104 (= e!301739 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236506 #b00000000000000000000000000000000 mask!3524) (select (arr!15917 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517105 () Bool)

(assert (=> b!517105 (and (bvsge (index!19714 lt!236606) #b00000000000000000000000000000000) (bvslt (index!19714 lt!236606) (size!16282 a!3235)))))

(declare-fun res!316546 () Bool)

(assert (=> b!517105 (= res!316546 (= (select (arr!15917 a!3235) (index!19714 lt!236606)) (select (arr!15917 a!3235) j!176)))))

(declare-fun e!301736 () Bool)

(assert (=> b!517105 (=> res!316546 e!301736)))

(declare-fun e!301740 () Bool)

(assert (=> b!517105 (= e!301740 e!301736)))

(declare-fun b!517106 () Bool)

(assert (=> b!517106 (and (bvsge (index!19714 lt!236606) #b00000000000000000000000000000000) (bvslt (index!19714 lt!236606) (size!16282 a!3235)))))

(declare-fun res!316545 () Bool)

(assert (=> b!517106 (= res!316545 (= (select (arr!15917 a!3235) (index!19714 lt!236606)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517106 (=> res!316545 e!301736)))

(declare-fun d!79499 () Bool)

(assert (=> d!79499 e!301737))

(declare-fun c!60573 () Bool)

(assert (=> d!79499 (= c!60573 (and ((_ is Intermediate!4381) lt!236606) (undefined!5193 lt!236606)))))

(declare-fun e!301738 () SeekEntryResult!4381)

(assert (=> d!79499 (= lt!236606 e!301738)))

(declare-fun c!60571 () Bool)

(assert (=> d!79499 (= c!60571 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236607 () (_ BitVec 64))

(assert (=> d!79499 (= lt!236607 (select (arr!15917 a!3235) lt!236506))))

(assert (=> d!79499 (validMask!0 mask!3524)))

(assert (=> d!79499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236506 (select (arr!15917 a!3235) j!176) a!3235 mask!3524) lt!236606)))

(declare-fun b!517107 () Bool)

(assert (=> b!517107 (= e!301737 e!301740)))

(declare-fun res!316544 () Bool)

(assert (=> b!517107 (= res!316544 (and ((_ is Intermediate!4381) lt!236606) (not (undefined!5193 lt!236606)) (bvslt (x!48681 lt!236606) #b01111111111111111111111111111110) (bvsge (x!48681 lt!236606) #b00000000000000000000000000000000) (bvsge (x!48681 lt!236606) #b00000000000000000000000000000000)))))

(assert (=> b!517107 (=> (not res!316544) (not e!301740))))

(declare-fun b!517108 () Bool)

(assert (=> b!517108 (= e!301738 e!301739)))

(declare-fun c!60572 () Bool)

(assert (=> b!517108 (= c!60572 (or (= lt!236607 (select (arr!15917 a!3235) j!176)) (= (bvadd lt!236607 lt!236607) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517109 () Bool)

(assert (=> b!517109 (= e!301739 (Intermediate!4381 false lt!236506 #b00000000000000000000000000000000))))

(declare-fun b!517110 () Bool)

(assert (=> b!517110 (and (bvsge (index!19714 lt!236606) #b00000000000000000000000000000000) (bvslt (index!19714 lt!236606) (size!16282 a!3235)))))

(assert (=> b!517110 (= e!301736 (= (select (arr!15917 a!3235) (index!19714 lt!236606)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517111 () Bool)

(assert (=> b!517111 (= e!301738 (Intermediate!4381 true lt!236506 #b00000000000000000000000000000000))))

(assert (= (and d!79499 c!60571) b!517111))

(assert (= (and d!79499 (not c!60571)) b!517108))

(assert (= (and b!517108 c!60572) b!517109))

(assert (= (and b!517108 (not c!60572)) b!517104))

(assert (= (and d!79499 c!60573) b!517103))

(assert (= (and d!79499 (not c!60573)) b!517107))

(assert (= (and b!517107 res!316544) b!517105))

(assert (= (and b!517105 (not res!316546)) b!517106))

(assert (= (and b!517106 (not res!316545)) b!517110))

(declare-fun m!498059 () Bool)

(assert (=> b!517104 m!498059))

(assert (=> b!517104 m!498059))

(assert (=> b!517104 m!497869))

(declare-fun m!498061 () Bool)

(assert (=> b!517104 m!498061))

(declare-fun m!498063 () Bool)

(assert (=> b!517110 m!498063))

(assert (=> b!517106 m!498063))

(declare-fun m!498065 () Bool)

(assert (=> d!79499 m!498065))

(assert (=> d!79499 m!497881))

(assert (=> b!517105 m!498063))

(assert (=> b!516893 d!79499))

(declare-fun d!79513 () Bool)

(declare-fun lt!236616 () (_ BitVec 32))

(declare-fun lt!236615 () (_ BitVec 32))

(assert (=> d!79513 (= lt!236616 (bvmul (bvxor lt!236615 (bvlshr lt!236615 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79513 (= lt!236615 ((_ extract 31 0) (bvand (bvxor (select (arr!15917 a!3235) j!176) (bvlshr (select (arr!15917 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79513 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316547 (let ((h!11016 ((_ extract 31 0) (bvand (bvxor (select (arr!15917 a!3235) j!176) (bvlshr (select (arr!15917 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48688 (bvmul (bvxor h!11016 (bvlshr h!11016 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48688 (bvlshr x!48688 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316547 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316547 #b00000000000000000000000000000000))))))

(assert (=> d!79513 (= (toIndex!0 (select (arr!15917 a!3235) j!176) mask!3524) (bvand (bvxor lt!236616 (bvlshr lt!236616 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516893 d!79513))

(declare-fun d!79517 () Bool)

(declare-fun res!316551 () Bool)

(declare-fun e!301744 () Bool)

(assert (=> d!79517 (=> res!316551 e!301744)))

(assert (=> d!79517 (= res!316551 (bvsge j!176 (size!16282 a!3235)))))

(assert (=> d!79517 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301744)))

(declare-fun b!517116 () Bool)

(declare-fun e!301746 () Bool)

(declare-fun call!31653 () Bool)

(assert (=> b!517116 (= e!301746 call!31653)))

(declare-fun b!517117 () Bool)

(declare-fun e!301745 () Bool)

(assert (=> b!517117 (= e!301745 e!301746)))

(declare-fun lt!236618 () (_ BitVec 64))

(assert (=> b!517117 (= lt!236618 (select (arr!15917 a!3235) j!176))))

(declare-fun lt!236619 () Unit!16006)

(assert (=> b!517117 (= lt!236619 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236618 j!176))))

(assert (=> b!517117 (arrayContainsKey!0 a!3235 lt!236618 #b00000000000000000000000000000000)))

(declare-fun lt!236617 () Unit!16006)

(assert (=> b!517117 (= lt!236617 lt!236619)))

(declare-fun res!316550 () Bool)

(assert (=> b!517117 (= res!316550 (= (seekEntryOrOpen!0 (select (arr!15917 a!3235) j!176) a!3235 mask!3524) (Found!4381 j!176)))))

(assert (=> b!517117 (=> (not res!316550) (not e!301746))))

(declare-fun b!517118 () Bool)

(assert (=> b!517118 (= e!301744 e!301745)))

(declare-fun c!60575 () Bool)

(assert (=> b!517118 (= c!60575 (validKeyInArray!0 (select (arr!15917 a!3235) j!176)))))

(declare-fun bm!31650 () Bool)

(assert (=> bm!31650 (= call!31653 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517119 () Bool)

(assert (=> b!517119 (= e!301745 call!31653)))

(assert (= (and d!79517 (not res!316551)) b!517118))

(assert (= (and b!517118 c!60575) b!517117))

(assert (= (and b!517118 (not c!60575)) b!517119))

(assert (= (and b!517117 res!316550) b!517116))

(assert (= (or b!517116 b!517119) bm!31650))

(assert (=> b!517117 m!497869))

(declare-fun m!498073 () Bool)

(assert (=> b!517117 m!498073))

(declare-fun m!498075 () Bool)

(assert (=> b!517117 m!498075))

(assert (=> b!517117 m!497869))

(assert (=> b!517117 m!497903))

(assert (=> b!517118 m!497869))

(assert (=> b!517118 m!497869))

(assert (=> b!517118 m!497871))

(declare-fun m!498077 () Bool)

(assert (=> bm!31650 m!498077))

(assert (=> b!516893 d!79517))

(declare-fun d!79519 () Bool)

(assert (=> d!79519 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236633 () Unit!16006)

(declare-fun choose!38 (array!33101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16006)

(assert (=> d!79519 (= lt!236633 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79519 (validMask!0 mask!3524)))

(assert (=> d!79519 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236633)))

(declare-fun bs!16308 () Bool)

(assert (= bs!16308 d!79519))

(assert (=> bs!16308 m!497895))

(declare-fun m!498089 () Bool)

(assert (=> bs!16308 m!498089))

(assert (=> bs!16308 m!497881))

(assert (=> b!516893 d!79519))

(declare-fun b!517137 () Bool)

(declare-fun e!301757 () Bool)

(declare-fun lt!236634 () SeekEntryResult!4381)

(assert (=> b!517137 (= e!301757 (bvsge (x!48681 lt!236634) #b01111111111111111111111111111110))))

(declare-fun e!301759 () SeekEntryResult!4381)

(declare-fun b!517138 () Bool)

(assert (=> b!517138 (= e!301759 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236509 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235)) mask!3524))))

(declare-fun b!517139 () Bool)

(assert (=> b!517139 (and (bvsge (index!19714 lt!236634) #b00000000000000000000000000000000) (bvslt (index!19714 lt!236634) (size!16282 (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235)))))))

(declare-fun res!316557 () Bool)

(assert (=> b!517139 (= res!316557 (= (select (arr!15917 (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235))) (index!19714 lt!236634)) (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!301756 () Bool)

(assert (=> b!517139 (=> res!316557 e!301756)))

(declare-fun e!301760 () Bool)

(assert (=> b!517139 (= e!301760 e!301756)))

(declare-fun b!517140 () Bool)

(assert (=> b!517140 (and (bvsge (index!19714 lt!236634) #b00000000000000000000000000000000) (bvslt (index!19714 lt!236634) (size!16282 (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235)))))))

(declare-fun res!316556 () Bool)

(assert (=> b!517140 (= res!316556 (= (select (arr!15917 (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235))) (index!19714 lt!236634)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517140 (=> res!316556 e!301756)))

(declare-fun d!79527 () Bool)

(assert (=> d!79527 e!301757))

(declare-fun c!60585 () Bool)

(assert (=> d!79527 (= c!60585 (and ((_ is Intermediate!4381) lt!236634) (undefined!5193 lt!236634)))))

(declare-fun e!301758 () SeekEntryResult!4381)

(assert (=> d!79527 (= lt!236634 e!301758)))

(declare-fun c!60583 () Bool)

(assert (=> d!79527 (= c!60583 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236635 () (_ BitVec 64))

(assert (=> d!79527 (= lt!236635 (select (arr!15917 (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235))) lt!236509))))

(assert (=> d!79527 (validMask!0 mask!3524)))

(assert (=> d!79527 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236509 (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235)) mask!3524) lt!236634)))

(declare-fun b!517141 () Bool)

(assert (=> b!517141 (= e!301757 e!301760)))

(declare-fun res!316555 () Bool)

(assert (=> b!517141 (= res!316555 (and ((_ is Intermediate!4381) lt!236634) (not (undefined!5193 lt!236634)) (bvslt (x!48681 lt!236634) #b01111111111111111111111111111110) (bvsge (x!48681 lt!236634) #b00000000000000000000000000000000) (bvsge (x!48681 lt!236634) #b00000000000000000000000000000000)))))

(assert (=> b!517141 (=> (not res!316555) (not e!301760))))

(declare-fun b!517142 () Bool)

(assert (=> b!517142 (= e!301758 e!301759)))

(declare-fun c!60584 () Bool)

(assert (=> b!517142 (= c!60584 (or (= lt!236635 (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236635 lt!236635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517143 () Bool)

(assert (=> b!517143 (= e!301759 (Intermediate!4381 false lt!236509 #b00000000000000000000000000000000))))

(declare-fun b!517144 () Bool)

(assert (=> b!517144 (and (bvsge (index!19714 lt!236634) #b00000000000000000000000000000000) (bvslt (index!19714 lt!236634) (size!16282 (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235)))))))

(assert (=> b!517144 (= e!301756 (= (select (arr!15917 (array!33102 (store (arr!15917 a!3235) i!1204 k0!2280) (size!16282 a!3235))) (index!19714 lt!236634)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517145 () Bool)

(assert (=> b!517145 (= e!301758 (Intermediate!4381 true lt!236509 #b00000000000000000000000000000000))))

(assert (= (and d!79527 c!60583) b!517145))

(assert (= (and d!79527 (not c!60583)) b!517142))

(assert (= (and b!517142 c!60584) b!517143))

(assert (= (and b!517142 (not c!60584)) b!517138))

(assert (= (and d!79527 c!60585) b!517137))

(assert (= (and d!79527 (not c!60585)) b!517141))

(assert (= (and b!517141 res!316555) b!517139))

(assert (= (and b!517139 (not res!316557)) b!517140))

(assert (= (and b!517140 (not res!316556)) b!517144))

(declare-fun m!498091 () Bool)

(assert (=> b!517138 m!498091))

(assert (=> b!517138 m!498091))

(assert (=> b!517138 m!497893))

(declare-fun m!498093 () Bool)

(assert (=> b!517138 m!498093))

(declare-fun m!498095 () Bool)

(assert (=> b!517144 m!498095))

(assert (=> b!517140 m!498095))

(declare-fun m!498097 () Bool)

(assert (=> d!79527 m!498097))

(assert (=> d!79527 m!497881))

(assert (=> b!517139 m!498095))

(assert (=> b!516893 d!79527))

(declare-fun d!79529 () Bool)

(declare-fun lt!236637 () (_ BitVec 32))

(declare-fun lt!236636 () (_ BitVec 32))

(assert (=> d!79529 (= lt!236637 (bvmul (bvxor lt!236636 (bvlshr lt!236636 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79529 (= lt!236636 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79529 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316547 (let ((h!11016 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48688 (bvmul (bvxor h!11016 (bvlshr h!11016 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48688 (bvlshr x!48688 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316547 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316547 #b00000000000000000000000000000000))))))

(assert (=> d!79529 (= (toIndex!0 (select (store (arr!15917 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236637 (bvlshr lt!236637 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516893 d!79529))

(check-sat (not b!517118) (not b!516997) (not b!516979) (not b!517117) (not d!79475) (not b!517033) (not d!79499) (not b!517104) (not bm!31642) (not b!517023) (not b!516972) (not b!517026) (not b!517138) (not b!516971) (not d!79497) (not d!79519) (not bm!31650) (not d!79527) (not b!517027) (not bm!31636))
(check-sat)
