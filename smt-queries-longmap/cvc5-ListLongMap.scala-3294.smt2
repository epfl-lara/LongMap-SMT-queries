; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45708 () Bool)

(assert start!45708)

(declare-fun b!504982 () Bool)

(declare-fun res!306100 () Bool)

(declare-fun e!295645 () Bool)

(assert (=> b!504982 (=> res!306100 e!295645)))

(declare-fun e!295642 () Bool)

(assert (=> b!504982 (= res!306100 e!295642)))

(declare-fun res!306102 () Bool)

(assert (=> b!504982 (=> (not res!306102) (not e!295642))))

(declare-datatypes ((SeekEntryResult!4079 0))(
  ( (MissingZero!4079 (index!18504 (_ BitVec 32))) (Found!4079 (index!18505 (_ BitVec 32))) (Intermediate!4079 (undefined!4891 Bool) (index!18506 (_ BitVec 32)) (x!47520 (_ BitVec 32))) (Undefined!4079) (MissingVacant!4079 (index!18507 (_ BitVec 32))) )
))
(declare-fun lt!230032 () SeekEntryResult!4079)

(assert (=> b!504982 (= res!306102 (bvsgt #b00000000000000000000000000000000 (x!47520 lt!230032)))))

(declare-fun res!306107 () Bool)

(declare-fun e!295639 () Bool)

(assert (=> start!45708 (=> (not res!306107) (not e!295639))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45708 (= res!306107 (validMask!0 mask!3524))))

(assert (=> start!45708 e!295639))

(assert (=> start!45708 true))

(declare-datatypes ((array!32464 0))(
  ( (array!32465 (arr!15612 (Array (_ BitVec 32) (_ BitVec 64))) (size!15976 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32464)

(declare-fun array_inv!11408 (array!32464) Bool)

(assert (=> start!45708 (array_inv!11408 a!3235)))

(declare-fun b!504983 () Bool)

(declare-fun res!306112 () Bool)

(assert (=> b!504983 (=> (not res!306112) (not e!295639))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504983 (= res!306112 (validKeyInArray!0 (select (arr!15612 a!3235) j!176)))))

(declare-fun b!504984 () Bool)

(declare-datatypes ((Unit!15392 0))(
  ( (Unit!15393) )
))
(declare-fun e!295644 () Unit!15392)

(declare-fun Unit!15394 () Unit!15392)

(assert (=> b!504984 (= e!295644 Unit!15394)))

(declare-fun lt!230031 () Unit!15392)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!230027 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15392)

(assert (=> b!504984 (= lt!230031 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230027 #b00000000000000000000000000000000 (index!18506 lt!230032) (x!47520 lt!230032) mask!3524))))

(declare-fun res!306101 () Bool)

(declare-fun lt!230030 () (_ BitVec 64))

(declare-fun lt!230023 () array!32464)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32464 (_ BitVec 32)) SeekEntryResult!4079)

(assert (=> b!504984 (= res!306101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230027 lt!230030 lt!230023 mask!3524) (Intermediate!4079 false (index!18506 lt!230032) (x!47520 lt!230032))))))

(declare-fun e!295643 () Bool)

(assert (=> b!504984 (=> (not res!306101) (not e!295643))))

(assert (=> b!504984 e!295643))

(declare-fun b!504985 () Bool)

(assert (=> b!504985 (= e!295643 false)))

(declare-fun b!504986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32464 (_ BitVec 32)) SeekEntryResult!4079)

(assert (=> b!504986 (= e!295642 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230027 (index!18506 lt!230032) (select (arr!15612 a!3235) j!176) a!3235 mask!3524) (Found!4079 j!176))))))

(declare-fun b!504987 () Bool)

(declare-fun e!295641 () Bool)

(assert (=> b!504987 (= e!295641 e!295645)))

(declare-fun res!306105 () Bool)

(assert (=> b!504987 (=> res!306105 e!295645)))

(assert (=> b!504987 (= res!306105 (or (bvsgt (x!47520 lt!230032) #b01111111111111111111111111111110) (bvslt lt!230027 #b00000000000000000000000000000000) (bvsge lt!230027 (size!15976 a!3235)) (bvslt (index!18506 lt!230032) #b00000000000000000000000000000000) (bvsge (index!18506 lt!230032) (size!15976 a!3235)) (not (= lt!230032 (Intermediate!4079 false (index!18506 lt!230032) (x!47520 lt!230032))))))))

(assert (=> b!504987 (= (index!18506 lt!230032) i!1204)))

(declare-fun lt!230025 () Unit!15392)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15392)

(assert (=> b!504987 (= lt!230025 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230027 #b00000000000000000000000000000000 (index!18506 lt!230032) (x!47520 lt!230032) mask!3524))))

(assert (=> b!504987 (and (or (= (select (arr!15612 a!3235) (index!18506 lt!230032)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15612 a!3235) (index!18506 lt!230032)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15612 a!3235) (index!18506 lt!230032)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15612 a!3235) (index!18506 lt!230032)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230022 () Unit!15392)

(assert (=> b!504987 (= lt!230022 e!295644)))

(declare-fun c!59720 () Bool)

(assert (=> b!504987 (= c!59720 (= (select (arr!15612 a!3235) (index!18506 lt!230032)) (select (arr!15612 a!3235) j!176)))))

(assert (=> b!504987 (and (bvslt (x!47520 lt!230032) #b01111111111111111111111111111110) (or (= (select (arr!15612 a!3235) (index!18506 lt!230032)) (select (arr!15612 a!3235) j!176)) (= (select (arr!15612 a!3235) (index!18506 lt!230032)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15612 a!3235) (index!18506 lt!230032)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504988 () Bool)

(declare-fun res!306106 () Bool)

(assert (=> b!504988 (=> res!306106 e!295641)))

(assert (=> b!504988 (= res!306106 (or (undefined!4891 lt!230032) (not (is-Intermediate!4079 lt!230032))))))

(declare-fun b!504989 () Bool)

(declare-fun res!306109 () Bool)

(assert (=> b!504989 (=> (not res!306109) (not e!295639))))

(assert (=> b!504989 (= res!306109 (validKeyInArray!0 k!2280))))

(declare-fun b!504990 () Bool)

(declare-fun e!295646 () Bool)

(assert (=> b!504990 (= e!295646 (not e!295641))))

(declare-fun res!306111 () Bool)

(assert (=> b!504990 (=> res!306111 e!295641)))

(declare-fun lt!230029 () (_ BitVec 32))

(assert (=> b!504990 (= res!306111 (= lt!230032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230029 lt!230030 lt!230023 mask!3524)))))

(assert (=> b!504990 (= lt!230032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230027 (select (arr!15612 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504990 (= lt!230029 (toIndex!0 lt!230030 mask!3524))))

(assert (=> b!504990 (= lt!230030 (select (store (arr!15612 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504990 (= lt!230027 (toIndex!0 (select (arr!15612 a!3235) j!176) mask!3524))))

(assert (=> b!504990 (= lt!230023 (array!32465 (store (arr!15612 a!3235) i!1204 k!2280) (size!15976 a!3235)))))

(declare-fun e!295640 () Bool)

(assert (=> b!504990 e!295640))

(declare-fun res!306104 () Bool)

(assert (=> b!504990 (=> (not res!306104) (not e!295640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32464 (_ BitVec 32)) Bool)

(assert (=> b!504990 (= res!306104 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230028 () Unit!15392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15392)

(assert (=> b!504990 (= lt!230028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504991 () Bool)

(declare-fun Unit!15395 () Unit!15392)

(assert (=> b!504991 (= e!295644 Unit!15395)))

(declare-fun b!504992 () Bool)

(declare-fun res!306099 () Bool)

(assert (=> b!504992 (=> (not res!306099) (not e!295646))))

(assert (=> b!504992 (= res!306099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504993 () Bool)

(declare-fun res!306110 () Bool)

(assert (=> b!504993 (=> (not res!306110) (not e!295639))))

(declare-fun arrayContainsKey!0 (array!32464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504993 (= res!306110 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504994 () Bool)

(declare-fun res!306103 () Bool)

(assert (=> b!504994 (=> (not res!306103) (not e!295639))))

(assert (=> b!504994 (= res!306103 (and (= (size!15976 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15976 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15976 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504995 () Bool)

(declare-fun res!306113 () Bool)

(assert (=> b!504995 (=> (not res!306113) (not e!295646))))

(declare-datatypes ((List!9770 0))(
  ( (Nil!9767) (Cons!9766 (h!10643 (_ BitVec 64)) (t!15998 List!9770)) )
))
(declare-fun arrayNoDuplicates!0 (array!32464 (_ BitVec 32) List!9770) Bool)

(assert (=> b!504995 (= res!306113 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9767))))

(declare-fun b!504996 () Bool)

(assert (=> b!504996 (= e!295645 true)))

(declare-fun lt!230024 () SeekEntryResult!4079)

(assert (=> b!504996 (= lt!230024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230027 lt!230030 lt!230023 mask!3524))))

(declare-fun b!504997 () Bool)

(assert (=> b!504997 (= e!295639 e!295646)))

(declare-fun res!306108 () Bool)

(assert (=> b!504997 (=> (not res!306108) (not e!295646))))

(declare-fun lt!230026 () SeekEntryResult!4079)

(assert (=> b!504997 (= res!306108 (or (= lt!230026 (MissingZero!4079 i!1204)) (= lt!230026 (MissingVacant!4079 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32464 (_ BitVec 32)) SeekEntryResult!4079)

(assert (=> b!504997 (= lt!230026 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504998 () Bool)

(assert (=> b!504998 (= e!295640 (= (seekEntryOrOpen!0 (select (arr!15612 a!3235) j!176) a!3235 mask!3524) (Found!4079 j!176)))))

(assert (= (and start!45708 res!306107) b!504994))

(assert (= (and b!504994 res!306103) b!504983))

(assert (= (and b!504983 res!306112) b!504989))

(assert (= (and b!504989 res!306109) b!504993))

(assert (= (and b!504993 res!306110) b!504997))

(assert (= (and b!504997 res!306108) b!504992))

(assert (= (and b!504992 res!306099) b!504995))

(assert (= (and b!504995 res!306113) b!504990))

(assert (= (and b!504990 res!306104) b!504998))

(assert (= (and b!504990 (not res!306111)) b!504988))

(assert (= (and b!504988 (not res!306106)) b!504987))

(assert (= (and b!504987 c!59720) b!504984))

(assert (= (and b!504987 (not c!59720)) b!504991))

(assert (= (and b!504984 res!306101) b!504985))

(assert (= (and b!504987 (not res!306105)) b!504982))

(assert (= (and b!504982 res!306102) b!504986))

(assert (= (and b!504982 (not res!306100)) b!504996))

(declare-fun m!485667 () Bool)

(assert (=> start!45708 m!485667))

(declare-fun m!485669 () Bool)

(assert (=> start!45708 m!485669))

(declare-fun m!485671 () Bool)

(assert (=> b!504996 m!485671))

(declare-fun m!485673 () Bool)

(assert (=> b!504998 m!485673))

(assert (=> b!504998 m!485673))

(declare-fun m!485675 () Bool)

(assert (=> b!504998 m!485675))

(assert (=> b!504986 m!485673))

(assert (=> b!504986 m!485673))

(declare-fun m!485677 () Bool)

(assert (=> b!504986 m!485677))

(declare-fun m!485679 () Bool)

(assert (=> b!504989 m!485679))

(declare-fun m!485681 () Bool)

(assert (=> b!504992 m!485681))

(declare-fun m!485683 () Bool)

(assert (=> b!504997 m!485683))

(declare-fun m!485685 () Bool)

(assert (=> b!504984 m!485685))

(assert (=> b!504984 m!485671))

(declare-fun m!485687 () Bool)

(assert (=> b!504987 m!485687))

(declare-fun m!485689 () Bool)

(assert (=> b!504987 m!485689))

(assert (=> b!504987 m!485673))

(assert (=> b!504990 m!485673))

(declare-fun m!485691 () Bool)

(assert (=> b!504990 m!485691))

(declare-fun m!485693 () Bool)

(assert (=> b!504990 m!485693))

(declare-fun m!485695 () Bool)

(assert (=> b!504990 m!485695))

(declare-fun m!485697 () Bool)

(assert (=> b!504990 m!485697))

(declare-fun m!485699 () Bool)

(assert (=> b!504990 m!485699))

(assert (=> b!504990 m!485673))

(declare-fun m!485701 () Bool)

(assert (=> b!504990 m!485701))

(assert (=> b!504990 m!485673))

(declare-fun m!485703 () Bool)

(assert (=> b!504990 m!485703))

(declare-fun m!485705 () Bool)

(assert (=> b!504990 m!485705))

(declare-fun m!485707 () Bool)

(assert (=> b!504995 m!485707))

(declare-fun m!485709 () Bool)

(assert (=> b!504993 m!485709))

(assert (=> b!504983 m!485673))

(assert (=> b!504983 m!485673))

(declare-fun m!485711 () Bool)

(assert (=> b!504983 m!485711))

(push 1)

