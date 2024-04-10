; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45706 () Bool)

(assert start!45706)

(declare-fun b!504931 () Bool)

(declare-datatypes ((Unit!15388 0))(
  ( (Unit!15389) )
))
(declare-fun e!295619 () Unit!15388)

(declare-fun Unit!15390 () Unit!15388)

(assert (=> b!504931 (= e!295619 Unit!15390)))

(declare-fun lt!229990 () Unit!15388)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32462 0))(
  ( (array!32463 (arr!15611 (Array (_ BitVec 32) (_ BitVec 64))) (size!15975 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32462)

(declare-fun lt!229991 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4078 0))(
  ( (MissingZero!4078 (index!18500 (_ BitVec 32))) (Found!4078 (index!18501 (_ BitVec 32))) (Intermediate!4078 (undefined!4890 Bool) (index!18502 (_ BitVec 32)) (x!47511 (_ BitVec 32))) (Undefined!4078) (MissingVacant!4078 (index!18503 (_ BitVec 32))) )
))
(declare-fun lt!229994 () SeekEntryResult!4078)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15388)

(assert (=> b!504931 (= lt!229990 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229991 #b00000000000000000000000000000000 (index!18502 lt!229994) (x!47511 lt!229994) mask!3524))))

(declare-fun res!306066 () Bool)

(declare-fun lt!229995 () array!32462)

(declare-fun lt!229996 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32462 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!504931 (= res!306066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229991 lt!229996 lt!229995 mask!3524) (Intermediate!4078 false (index!18502 lt!229994) (x!47511 lt!229994))))))

(declare-fun e!295620 () Bool)

(assert (=> b!504931 (=> (not res!306066) (not e!295620))))

(assert (=> b!504931 e!295620))

(declare-fun b!504932 () Bool)

(declare-fun res!306067 () Bool)

(declare-fun e!295614 () Bool)

(assert (=> b!504932 (=> res!306067 e!295614)))

(declare-fun e!295616 () Bool)

(assert (=> b!504932 (= res!306067 e!295616)))

(declare-fun res!306054 () Bool)

(assert (=> b!504932 (=> (not res!306054) (not e!295616))))

(assert (=> b!504932 (= res!306054 (bvsgt #b00000000000000000000000000000000 (x!47511 lt!229994)))))

(declare-fun b!504933 () Bool)

(declare-fun res!306058 () Bool)

(declare-fun e!295612 () Bool)

(assert (=> b!504933 (=> (not res!306058) (not e!295612))))

(declare-datatypes ((List!9769 0))(
  ( (Nil!9766) (Cons!9765 (h!10642 (_ BitVec 64)) (t!15997 List!9769)) )
))
(declare-fun arrayNoDuplicates!0 (array!32462 (_ BitVec 32) List!9769) Bool)

(assert (=> b!504933 (= res!306058 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9766))))

(declare-fun b!504934 () Bool)

(declare-fun res!306059 () Bool)

(declare-fun e!295617 () Bool)

(assert (=> b!504934 (=> (not res!306059) (not e!295617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504934 (= res!306059 (validKeyInArray!0 (select (arr!15611 a!3235) j!176)))))

(declare-fun b!504935 () Bool)

(declare-fun res!306065 () Bool)

(declare-fun e!295618 () Bool)

(assert (=> b!504935 (=> res!306065 e!295618)))

(assert (=> b!504935 (= res!306065 (or (undefined!4890 lt!229994) (not (is-Intermediate!4078 lt!229994))))))

(declare-fun b!504936 () Bool)

(declare-fun res!306056 () Bool)

(assert (=> b!504936 (=> (not res!306056) (not e!295617))))

(assert (=> b!504936 (= res!306056 (validKeyInArray!0 k!2280))))

(declare-fun b!504937 () Bool)

(assert (=> b!504937 (= e!295620 false)))

(declare-fun b!504938 () Bool)

(declare-fun res!306063 () Bool)

(assert (=> b!504938 (=> (not res!306063) (not e!295612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32462 (_ BitVec 32)) Bool)

(assert (=> b!504938 (= res!306063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504939 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32462 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!504939 (= e!295616 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229991 (index!18502 lt!229994) (select (arr!15611 a!3235) j!176) a!3235 mask!3524) (Found!4078 j!176))))))

(declare-fun b!504940 () Bool)

(assert (=> b!504940 (= e!295614 true)))

(declare-fun lt!229989 () SeekEntryResult!4078)

(assert (=> b!504940 (= lt!229989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229991 lt!229996 lt!229995 mask!3524))))

(declare-fun res!306061 () Bool)

(assert (=> start!45706 (=> (not res!306061) (not e!295617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45706 (= res!306061 (validMask!0 mask!3524))))

(assert (=> start!45706 e!295617))

(assert (=> start!45706 true))

(declare-fun array_inv!11407 (array!32462) Bool)

(assert (=> start!45706 (array_inv!11407 a!3235)))

(declare-fun b!504941 () Bool)

(declare-fun res!306068 () Bool)

(assert (=> b!504941 (=> (not res!306068) (not e!295617))))

(declare-fun arrayContainsKey!0 (array!32462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504941 (= res!306068 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504942 () Bool)

(assert (=> b!504942 (= e!295617 e!295612)))

(declare-fun res!306057 () Bool)

(assert (=> b!504942 (=> (not res!306057) (not e!295612))))

(declare-fun lt!229999 () SeekEntryResult!4078)

(assert (=> b!504942 (= res!306057 (or (= lt!229999 (MissingZero!4078 i!1204)) (= lt!229999 (MissingVacant!4078 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32462 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!504942 (= lt!229999 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!295613 () Bool)

(declare-fun b!504943 () Bool)

(assert (=> b!504943 (= e!295613 (= (seekEntryOrOpen!0 (select (arr!15611 a!3235) j!176) a!3235 mask!3524) (Found!4078 j!176)))))

(declare-fun b!504944 () Bool)

(declare-fun Unit!15391 () Unit!15388)

(assert (=> b!504944 (= e!295619 Unit!15391)))

(declare-fun b!504945 () Bool)

(assert (=> b!504945 (= e!295618 e!295614)))

(declare-fun res!306064 () Bool)

(assert (=> b!504945 (=> res!306064 e!295614)))

(assert (=> b!504945 (= res!306064 (or (bvsgt (x!47511 lt!229994) #b01111111111111111111111111111110) (bvslt lt!229991 #b00000000000000000000000000000000) (bvsge lt!229991 (size!15975 a!3235)) (bvslt (index!18502 lt!229994) #b00000000000000000000000000000000) (bvsge (index!18502 lt!229994) (size!15975 a!3235)) (not (= lt!229994 (Intermediate!4078 false (index!18502 lt!229994) (x!47511 lt!229994))))))))

(assert (=> b!504945 (= (index!18502 lt!229994) i!1204)))

(declare-fun lt!229993 () Unit!15388)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15388)

(assert (=> b!504945 (= lt!229993 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229991 #b00000000000000000000000000000000 (index!18502 lt!229994) (x!47511 lt!229994) mask!3524))))

(assert (=> b!504945 (and (or (= (select (arr!15611 a!3235) (index!18502 lt!229994)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15611 a!3235) (index!18502 lt!229994)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15611 a!3235) (index!18502 lt!229994)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15611 a!3235) (index!18502 lt!229994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229997 () Unit!15388)

(assert (=> b!504945 (= lt!229997 e!295619)))

(declare-fun c!59717 () Bool)

(assert (=> b!504945 (= c!59717 (= (select (arr!15611 a!3235) (index!18502 lt!229994)) (select (arr!15611 a!3235) j!176)))))

(assert (=> b!504945 (and (bvslt (x!47511 lt!229994) #b01111111111111111111111111111110) (or (= (select (arr!15611 a!3235) (index!18502 lt!229994)) (select (arr!15611 a!3235) j!176)) (= (select (arr!15611 a!3235) (index!18502 lt!229994)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15611 a!3235) (index!18502 lt!229994)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504946 () Bool)

(declare-fun res!306060 () Bool)

(assert (=> b!504946 (=> (not res!306060) (not e!295617))))

(assert (=> b!504946 (= res!306060 (and (= (size!15975 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15975 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15975 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504947 () Bool)

(assert (=> b!504947 (= e!295612 (not e!295618))))

(declare-fun res!306062 () Bool)

(assert (=> b!504947 (=> res!306062 e!295618)))

(declare-fun lt!229992 () (_ BitVec 32))

(assert (=> b!504947 (= res!306062 (= lt!229994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229992 lt!229996 lt!229995 mask!3524)))))

(assert (=> b!504947 (= lt!229994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229991 (select (arr!15611 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504947 (= lt!229992 (toIndex!0 lt!229996 mask!3524))))

(assert (=> b!504947 (= lt!229996 (select (store (arr!15611 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504947 (= lt!229991 (toIndex!0 (select (arr!15611 a!3235) j!176) mask!3524))))

(assert (=> b!504947 (= lt!229995 (array!32463 (store (arr!15611 a!3235) i!1204 k!2280) (size!15975 a!3235)))))

(assert (=> b!504947 e!295613))

(declare-fun res!306055 () Bool)

(assert (=> b!504947 (=> (not res!306055) (not e!295613))))

(assert (=> b!504947 (= res!306055 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229998 () Unit!15388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15388)

(assert (=> b!504947 (= lt!229998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45706 res!306061) b!504946))

(assert (= (and b!504946 res!306060) b!504934))

(assert (= (and b!504934 res!306059) b!504936))

(assert (= (and b!504936 res!306056) b!504941))

(assert (= (and b!504941 res!306068) b!504942))

(assert (= (and b!504942 res!306057) b!504938))

(assert (= (and b!504938 res!306063) b!504933))

(assert (= (and b!504933 res!306058) b!504947))

(assert (= (and b!504947 res!306055) b!504943))

(assert (= (and b!504947 (not res!306062)) b!504935))

(assert (= (and b!504935 (not res!306065)) b!504945))

(assert (= (and b!504945 c!59717) b!504931))

(assert (= (and b!504945 (not c!59717)) b!504944))

(assert (= (and b!504931 res!306066) b!504937))

(assert (= (and b!504945 (not res!306064)) b!504932))

(assert (= (and b!504932 res!306054) b!504939))

(assert (= (and b!504932 (not res!306067)) b!504940))

(declare-fun m!485621 () Bool)

(assert (=> b!504945 m!485621))

(declare-fun m!485623 () Bool)

(assert (=> b!504945 m!485623))

(declare-fun m!485625 () Bool)

(assert (=> b!504945 m!485625))

(assert (=> b!504943 m!485625))

(assert (=> b!504943 m!485625))

(declare-fun m!485627 () Bool)

(assert (=> b!504943 m!485627))

(declare-fun m!485629 () Bool)

(assert (=> b!504938 m!485629))

(declare-fun m!485631 () Bool)

(assert (=> b!504940 m!485631))

(declare-fun m!485633 () Bool)

(assert (=> start!45706 m!485633))

(declare-fun m!485635 () Bool)

(assert (=> start!45706 m!485635))

(declare-fun m!485637 () Bool)

(assert (=> b!504933 m!485637))

(declare-fun m!485639 () Bool)

(assert (=> b!504942 m!485639))

(declare-fun m!485641 () Bool)

(assert (=> b!504936 m!485641))

(declare-fun m!485643 () Bool)

(assert (=> b!504941 m!485643))

(declare-fun m!485645 () Bool)

(assert (=> b!504931 m!485645))

(assert (=> b!504931 m!485631))

(declare-fun m!485647 () Bool)

(assert (=> b!504947 m!485647))

(declare-fun m!485649 () Bool)

(assert (=> b!504947 m!485649))

(declare-fun m!485651 () Bool)

(assert (=> b!504947 m!485651))

(declare-fun m!485653 () Bool)

(assert (=> b!504947 m!485653))

(assert (=> b!504947 m!485625))

(declare-fun m!485655 () Bool)

(assert (=> b!504947 m!485655))

(assert (=> b!504947 m!485625))

(assert (=> b!504947 m!485625))

(declare-fun m!485657 () Bool)

(assert (=> b!504947 m!485657))

(declare-fun m!485659 () Bool)

(assert (=> b!504947 m!485659))

(declare-fun m!485661 () Bool)

(assert (=> b!504947 m!485661))

(assert (=> b!504939 m!485625))

(assert (=> b!504939 m!485625))

(declare-fun m!485663 () Bool)

(assert (=> b!504939 m!485663))

(assert (=> b!504934 m!485625))

(assert (=> b!504934 m!485625))

(declare-fun m!485665 () Bool)

(assert (=> b!504934 m!485665))

(push 1)

