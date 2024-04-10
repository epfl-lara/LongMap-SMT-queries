; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51912 () Bool)

(assert start!51912)

(declare-fun b!567473 () Bool)

(declare-fun res!358061 () Bool)

(declare-fun e!326535 () Bool)

(assert (=> b!567473 (=> (not res!358061) (not e!326535))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567473 (= res!358061 (validKeyInArray!0 k!1914))))

(declare-fun b!567474 () Bool)

(declare-fun e!326534 () Bool)

(assert (=> b!567474 (= e!326534 (not true))))

(declare-fun e!326532 () Bool)

(assert (=> b!567474 e!326532))

(declare-fun res!358062 () Bool)

(assert (=> b!567474 (=> (not res!358062) (not e!326532))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35606 0))(
  ( (array!35607 (arr!17099 (Array (_ BitVec 32) (_ BitVec 64))) (size!17463 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35606)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35606 (_ BitVec 32)) Bool)

(assert (=> b!567474 (= res!358062 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17798 0))(
  ( (Unit!17799) )
))
(declare-fun lt!258523 () Unit!17798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17798)

(assert (=> b!567474 (= lt!258523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567475 () Bool)

(assert (=> b!567475 (= e!326535 e!326534)))

(declare-fun res!358060 () Bool)

(assert (=> b!567475 (=> (not res!358060) (not e!326534))))

(declare-datatypes ((SeekEntryResult!5548 0))(
  ( (MissingZero!5548 (index!24419 (_ BitVec 32))) (Found!5548 (index!24420 (_ BitVec 32))) (Intermediate!5548 (undefined!6360 Bool) (index!24421 (_ BitVec 32)) (x!53285 (_ BitVec 32))) (Undefined!5548) (MissingVacant!5548 (index!24422 (_ BitVec 32))) )
))
(declare-fun lt!258522 () SeekEntryResult!5548)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567475 (= res!358060 (or (= lt!258522 (MissingZero!5548 i!1132)) (= lt!258522 (MissingVacant!5548 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35606 (_ BitVec 32)) SeekEntryResult!5548)

(assert (=> b!567475 (= lt!258522 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567476 () Bool)

(declare-fun res!358063 () Bool)

(assert (=> b!567476 (=> (not res!358063) (not e!326534))))

(assert (=> b!567476 (= res!358063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567477 () Bool)

(assert (=> b!567477 (= e!326532 (= (seekEntryOrOpen!0 (select (arr!17099 a!3118) j!142) a!3118 mask!3119) (Found!5548 j!142)))))

(declare-fun b!567478 () Bool)

(declare-fun res!358059 () Bool)

(assert (=> b!567478 (=> (not res!358059) (not e!326535))))

(assert (=> b!567478 (= res!358059 (and (= (size!17463 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17463 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17463 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567479 () Bool)

(declare-fun res!358067 () Bool)

(assert (=> b!567479 (=> (not res!358067) (not e!326535))))

(assert (=> b!567479 (= res!358067 (validKeyInArray!0 (select (arr!17099 a!3118) j!142)))))

(declare-fun res!358058 () Bool)

(assert (=> start!51912 (=> (not res!358058) (not e!326535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51912 (= res!358058 (validMask!0 mask!3119))))

(assert (=> start!51912 e!326535))

(assert (=> start!51912 true))

(declare-fun array_inv!12895 (array!35606) Bool)

(assert (=> start!51912 (array_inv!12895 a!3118)))

(declare-fun b!567480 () Bool)

(declare-fun res!358064 () Bool)

(assert (=> b!567480 (=> (not res!358064) (not e!326534))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35606 (_ BitVec 32)) SeekEntryResult!5548)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567480 (= res!358064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17099 a!3118) j!142) mask!3119) (select (arr!17099 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17099 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17099 a!3118) i!1132 k!1914) j!142) (array!35607 (store (arr!17099 a!3118) i!1132 k!1914) (size!17463 a!3118)) mask!3119)))))

(declare-fun b!567481 () Bool)

(declare-fun res!358065 () Bool)

(assert (=> b!567481 (=> (not res!358065) (not e!326535))))

(declare-fun arrayContainsKey!0 (array!35606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567481 (= res!358065 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567482 () Bool)

(declare-fun res!358066 () Bool)

(assert (=> b!567482 (=> (not res!358066) (not e!326534))))

(declare-datatypes ((List!11179 0))(
  ( (Nil!11176) (Cons!11175 (h!12187 (_ BitVec 64)) (t!17407 List!11179)) )
))
(declare-fun arrayNoDuplicates!0 (array!35606 (_ BitVec 32) List!11179) Bool)

(assert (=> b!567482 (= res!358066 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11176))))

(assert (= (and start!51912 res!358058) b!567478))

(assert (= (and b!567478 res!358059) b!567479))

(assert (= (and b!567479 res!358067) b!567473))

(assert (= (and b!567473 res!358061) b!567481))

(assert (= (and b!567481 res!358065) b!567475))

(assert (= (and b!567475 res!358060) b!567476))

(assert (= (and b!567476 res!358063) b!567482))

(assert (= (and b!567482 res!358066) b!567480))

(assert (= (and b!567480 res!358064) b!567474))

(assert (= (and b!567474 res!358062) b!567477))

(declare-fun m!546069 () Bool)

(assert (=> b!567476 m!546069))

(declare-fun m!546071 () Bool)

(assert (=> b!567475 m!546071))

(declare-fun m!546073 () Bool)

(assert (=> b!567480 m!546073))

(declare-fun m!546075 () Bool)

(assert (=> b!567480 m!546075))

(assert (=> b!567480 m!546073))

(declare-fun m!546077 () Bool)

(assert (=> b!567480 m!546077))

(declare-fun m!546079 () Bool)

(assert (=> b!567480 m!546079))

(assert (=> b!567480 m!546077))

(declare-fun m!546081 () Bool)

(assert (=> b!567480 m!546081))

(assert (=> b!567480 m!546075))

(assert (=> b!567480 m!546073))

(declare-fun m!546083 () Bool)

(assert (=> b!567480 m!546083))

(declare-fun m!546085 () Bool)

(assert (=> b!567480 m!546085))

(assert (=> b!567480 m!546077))

(assert (=> b!567480 m!546079))

(declare-fun m!546087 () Bool)

(assert (=> start!51912 m!546087))

(declare-fun m!546089 () Bool)

(assert (=> start!51912 m!546089))

(declare-fun m!546091 () Bool)

(assert (=> b!567482 m!546091))

(assert (=> b!567479 m!546073))

(assert (=> b!567479 m!546073))

(declare-fun m!546093 () Bool)

(assert (=> b!567479 m!546093))

(declare-fun m!546095 () Bool)

(assert (=> b!567481 m!546095))

(assert (=> b!567477 m!546073))

(assert (=> b!567477 m!546073))

(declare-fun m!546097 () Bool)

(assert (=> b!567477 m!546097))

(declare-fun m!546099 () Bool)

(assert (=> b!567474 m!546099))

(declare-fun m!546101 () Bool)

(assert (=> b!567474 m!546101))

(declare-fun m!546103 () Bool)

(assert (=> b!567473 m!546103))

(push 1)

