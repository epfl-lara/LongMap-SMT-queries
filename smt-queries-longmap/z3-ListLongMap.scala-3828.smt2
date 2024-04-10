; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52456 () Bool)

(assert start!52456)

(declare-fun lt!261530 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5664 0))(
  ( (MissingZero!5664 (index!24883 (_ BitVec 32))) (Found!5664 (index!24884 (_ BitVec 32))) (Intermediate!5664 (undefined!6476 Bool) (index!24885 (_ BitVec 32)) (x!53749 (_ BitVec 32))) (Undefined!5664) (MissingVacant!5664 (index!24886 (_ BitVec 32))) )
))
(declare-fun lt!261527 () SeekEntryResult!5664)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!329533 () Bool)

(declare-datatypes ((array!35853 0))(
  ( (array!35854 (arr!17215 (Array (_ BitVec 32) (_ BitVec 64))) (size!17579 (_ BitVec 32))) )
))
(declare-fun lt!261525 () array!35853)

(declare-fun b!572855 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35853 (_ BitVec 32)) SeekEntryResult!5664)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35853 (_ BitVec 32)) SeekEntryResult!5664)

(assert (=> b!572855 (= e!329533 (= (seekEntryOrOpen!0 lt!261530 lt!261525 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53749 lt!261527) (index!24885 lt!261527) (index!24885 lt!261527) lt!261530 lt!261525 mask!3119)))))

(declare-fun b!572856 () Bool)

(declare-fun e!329531 () Bool)

(declare-fun e!329534 () Bool)

(assert (=> b!572856 (= e!329531 e!329534)))

(declare-fun res!362367 () Bool)

(assert (=> b!572856 (=> (not res!362367) (not e!329534))))

(declare-fun lt!261528 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35853 (_ BitVec 32)) SeekEntryResult!5664)

(assert (=> b!572856 (= res!362367 (= lt!261527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261528 lt!261530 lt!261525 mask!3119)))))

(declare-fun a!3118 () array!35853)

(declare-fun lt!261532 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572856 (= lt!261527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261532 (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572856 (= lt!261528 (toIndex!0 lt!261530 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572856 (= lt!261530 (select (store (arr!17215 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572856 (= lt!261532 (toIndex!0 (select (arr!17215 a!3118) j!142) mask!3119))))

(assert (=> b!572856 (= lt!261525 (array!35854 (store (arr!17215 a!3118) i!1132 k0!1914) (size!17579 a!3118)))))

(declare-fun b!572857 () Bool)

(declare-fun res!362372 () Bool)

(assert (=> b!572857 (=> (not res!362372) (not e!329531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35853 (_ BitVec 32)) Bool)

(assert (=> b!572857 (= res!362372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572858 () Bool)

(declare-fun res!362366 () Bool)

(assert (=> b!572858 (=> (not res!362366) (not e!329531))))

(declare-datatypes ((List!11295 0))(
  ( (Nil!11292) (Cons!11291 (h!12318 (_ BitVec 64)) (t!17523 List!11295)) )
))
(declare-fun arrayNoDuplicates!0 (array!35853 (_ BitVec 32) List!11295) Bool)

(assert (=> b!572858 (= res!362366 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11292))))

(declare-fun b!572859 () Bool)

(declare-fun res!362364 () Bool)

(declare-fun e!329532 () Bool)

(assert (=> b!572859 (=> (not res!362364) (not e!329532))))

(declare-fun arrayContainsKey!0 (array!35853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572859 (= res!362364 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572860 () Bool)

(assert (=> b!572860 (= e!329534 (not true))))

(declare-fun e!329536 () Bool)

(assert (=> b!572860 e!329536))

(declare-fun res!362363 () Bool)

(assert (=> b!572860 (=> (not res!362363) (not e!329536))))

(declare-fun lt!261531 () SeekEntryResult!5664)

(assert (=> b!572860 (= res!362363 (= lt!261531 (Found!5664 j!142)))))

(assert (=> b!572860 (= lt!261531 (seekEntryOrOpen!0 (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572860 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18030 0))(
  ( (Unit!18031) )
))
(declare-fun lt!261526 () Unit!18030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18030)

(assert (=> b!572860 (= lt!261526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!362373 () Bool)

(assert (=> start!52456 (=> (not res!362373) (not e!329532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52456 (= res!362373 (validMask!0 mask!3119))))

(assert (=> start!52456 e!329532))

(assert (=> start!52456 true))

(declare-fun array_inv!13011 (array!35853) Bool)

(assert (=> start!52456 (array_inv!13011 a!3118)))

(declare-fun b!572861 () Bool)

(declare-fun e!329538 () Bool)

(assert (=> b!572861 (= e!329536 e!329538)))

(declare-fun res!362371 () Bool)

(assert (=> b!572861 (=> res!362371 e!329538)))

(get-info :version)

(assert (=> b!572861 (= res!362371 (or (undefined!6476 lt!261527) (not ((_ is Intermediate!5664) lt!261527))))))

(declare-fun b!572862 () Bool)

(declare-fun res!362374 () Bool)

(assert (=> b!572862 (=> (not res!362374) (not e!329532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572862 (= res!362374 (validKeyInArray!0 (select (arr!17215 a!3118) j!142)))))

(declare-fun b!572863 () Bool)

(assert (=> b!572863 (= e!329532 e!329531)))

(declare-fun res!362369 () Bool)

(assert (=> b!572863 (=> (not res!362369) (not e!329531))))

(declare-fun lt!261529 () SeekEntryResult!5664)

(assert (=> b!572863 (= res!362369 (or (= lt!261529 (MissingZero!5664 i!1132)) (= lt!261529 (MissingVacant!5664 i!1132))))))

(assert (=> b!572863 (= lt!261529 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572864 () Bool)

(declare-fun res!362368 () Bool)

(assert (=> b!572864 (=> (not res!362368) (not e!329532))))

(assert (=> b!572864 (= res!362368 (validKeyInArray!0 k0!1914))))

(declare-fun b!572865 () Bool)

(declare-fun e!329537 () Bool)

(assert (=> b!572865 (= e!329538 e!329537)))

(declare-fun res!362370 () Bool)

(assert (=> b!572865 (=> res!362370 e!329537)))

(declare-fun lt!261524 () (_ BitVec 64))

(assert (=> b!572865 (= res!362370 (or (= lt!261524 (select (arr!17215 a!3118) j!142)) (= lt!261524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572865 (= lt!261524 (select (arr!17215 a!3118) (index!24885 lt!261527)))))

(declare-fun b!572866 () Bool)

(declare-fun res!362375 () Bool)

(assert (=> b!572866 (=> (not res!362375) (not e!329532))))

(assert (=> b!572866 (= res!362375 (and (= (size!17579 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17579 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17579 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572867 () Bool)

(assert (=> b!572867 (= e!329537 e!329533)))

(declare-fun res!362365 () Bool)

(assert (=> b!572867 (=> (not res!362365) (not e!329533))))

(assert (=> b!572867 (= res!362365 (= lt!261531 (seekKeyOrZeroReturnVacant!0 (x!53749 lt!261527) (index!24885 lt!261527) (index!24885 lt!261527) (select (arr!17215 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52456 res!362373) b!572866))

(assert (= (and b!572866 res!362375) b!572862))

(assert (= (and b!572862 res!362374) b!572864))

(assert (= (and b!572864 res!362368) b!572859))

(assert (= (and b!572859 res!362364) b!572863))

(assert (= (and b!572863 res!362369) b!572857))

(assert (= (and b!572857 res!362372) b!572858))

(assert (= (and b!572858 res!362366) b!572856))

(assert (= (and b!572856 res!362367) b!572860))

(assert (= (and b!572860 res!362363) b!572861))

(assert (= (and b!572861 (not res!362371)) b!572865))

(assert (= (and b!572865 (not res!362370)) b!572867))

(assert (= (and b!572867 res!362365) b!572855))

(declare-fun m!551885 () Bool)

(assert (=> b!572857 m!551885))

(declare-fun m!551887 () Bool)

(assert (=> b!572863 m!551887))

(declare-fun m!551889 () Bool)

(assert (=> b!572865 m!551889))

(declare-fun m!551891 () Bool)

(assert (=> b!572865 m!551891))

(declare-fun m!551893 () Bool)

(assert (=> b!572859 m!551893))

(declare-fun m!551895 () Bool)

(assert (=> b!572864 m!551895))

(assert (=> b!572862 m!551889))

(assert (=> b!572862 m!551889))

(declare-fun m!551897 () Bool)

(assert (=> b!572862 m!551897))

(assert (=> b!572867 m!551889))

(assert (=> b!572867 m!551889))

(declare-fun m!551899 () Bool)

(assert (=> b!572867 m!551899))

(assert (=> b!572856 m!551889))

(declare-fun m!551901 () Bool)

(assert (=> b!572856 m!551901))

(declare-fun m!551903 () Bool)

(assert (=> b!572856 m!551903))

(assert (=> b!572856 m!551889))

(declare-fun m!551905 () Bool)

(assert (=> b!572856 m!551905))

(declare-fun m!551907 () Bool)

(assert (=> b!572856 m!551907))

(declare-fun m!551909 () Bool)

(assert (=> b!572856 m!551909))

(assert (=> b!572856 m!551889))

(declare-fun m!551911 () Bool)

(assert (=> b!572856 m!551911))

(assert (=> b!572860 m!551889))

(assert (=> b!572860 m!551889))

(declare-fun m!551913 () Bool)

(assert (=> b!572860 m!551913))

(declare-fun m!551915 () Bool)

(assert (=> b!572860 m!551915))

(declare-fun m!551917 () Bool)

(assert (=> b!572860 m!551917))

(declare-fun m!551919 () Bool)

(assert (=> start!52456 m!551919))

(declare-fun m!551921 () Bool)

(assert (=> start!52456 m!551921))

(declare-fun m!551923 () Bool)

(assert (=> b!572858 m!551923))

(declare-fun m!551925 () Bool)

(assert (=> b!572855 m!551925))

(declare-fun m!551927 () Bool)

(assert (=> b!572855 m!551927))

(check-sat (not b!572859) (not b!572864) (not start!52456) (not b!572863) (not b!572867) (not b!572858) (not b!572856) (not b!572862) (not b!572855) (not b!572857) (not b!572860))
(check-sat)
