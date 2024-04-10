; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52056 () Bool)

(assert start!52056)

(declare-fun b!568433 () Bool)

(declare-fun res!358638 () Bool)

(declare-fun e!327075 () Bool)

(assert (=> b!568433 (=> (not res!358638) (not e!327075))))

(declare-datatypes ((array!35636 0))(
  ( (array!35637 (arr!17111 (Array (_ BitVec 32) (_ BitVec 64))) (size!17475 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35636)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35636 (_ BitVec 32)) Bool)

(assert (=> b!568433 (= res!358638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568434 () Bool)

(assert (=> b!568434 (= e!327075 (not true))))

(declare-fun e!327076 () Bool)

(assert (=> b!568434 e!327076))

(declare-fun res!358636 () Bool)

(assert (=> b!568434 (=> (not res!358636) (not e!327076))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!568434 (= res!358636 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17822 0))(
  ( (Unit!17823) )
))
(declare-fun lt!258943 () Unit!17822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17822)

(assert (=> b!568434 (= lt!258943 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568435 () Bool)

(declare-fun e!327077 () Bool)

(assert (=> b!568435 (= e!327077 e!327075)))

(declare-fun res!358642 () Bool)

(assert (=> b!568435 (=> (not res!358642) (not e!327075))))

(declare-datatypes ((SeekEntryResult!5560 0))(
  ( (MissingZero!5560 (index!24467 (_ BitVec 32))) (Found!5560 (index!24468 (_ BitVec 32))) (Intermediate!5560 (undefined!6372 Bool) (index!24469 (_ BitVec 32)) (x!53341 (_ BitVec 32))) (Undefined!5560) (MissingVacant!5560 (index!24470 (_ BitVec 32))) )
))
(declare-fun lt!258942 () SeekEntryResult!5560)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568435 (= res!358642 (or (= lt!258942 (MissingZero!5560 i!1132)) (= lt!258942 (MissingVacant!5560 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35636 (_ BitVec 32)) SeekEntryResult!5560)

(assert (=> b!568435 (= lt!258942 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!568436 () Bool)

(declare-fun res!358635 () Bool)

(assert (=> b!568436 (=> (not res!358635) (not e!327077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568436 (= res!358635 (validKeyInArray!0 (select (arr!17111 a!3118) j!142)))))

(declare-fun b!568437 () Bool)

(declare-fun res!358634 () Bool)

(assert (=> b!568437 (=> (not res!358634) (not e!327077))))

(assert (=> b!568437 (= res!358634 (and (= (size!17475 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17475 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17475 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568438 () Bool)

(declare-fun res!358640 () Bool)

(assert (=> b!568438 (=> (not res!358640) (not e!327077))))

(declare-fun arrayContainsKey!0 (array!35636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568438 (= res!358640 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568439 () Bool)

(declare-fun res!358639 () Bool)

(assert (=> b!568439 (=> (not res!358639) (not e!327075))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35636 (_ BitVec 32)) SeekEntryResult!5560)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568439 (= res!358639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17111 a!3118) j!142) mask!3119) (select (arr!17111 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17111 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17111 a!3118) i!1132 k!1914) j!142) (array!35637 (store (arr!17111 a!3118) i!1132 k!1914) (size!17475 a!3118)) mask!3119)))))

(declare-fun b!568440 () Bool)

(declare-fun res!358641 () Bool)

(assert (=> b!568440 (=> (not res!358641) (not e!327075))))

(declare-datatypes ((List!11191 0))(
  ( (Nil!11188) (Cons!11187 (h!12205 (_ BitVec 64)) (t!17419 List!11191)) )
))
(declare-fun arrayNoDuplicates!0 (array!35636 (_ BitVec 32) List!11191) Bool)

(assert (=> b!568440 (= res!358641 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11188))))

(declare-fun res!358643 () Bool)

(assert (=> start!52056 (=> (not res!358643) (not e!327077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52056 (= res!358643 (validMask!0 mask!3119))))

(assert (=> start!52056 e!327077))

(assert (=> start!52056 true))

(declare-fun array_inv!12907 (array!35636) Bool)

(assert (=> start!52056 (array_inv!12907 a!3118)))

(declare-fun b!568441 () Bool)

(assert (=> b!568441 (= e!327076 (= (seekEntryOrOpen!0 (select (arr!17111 a!3118) j!142) a!3118 mask!3119) (Found!5560 j!142)))))

(declare-fun b!568442 () Bool)

(declare-fun res!358637 () Bool)

(assert (=> b!568442 (=> (not res!358637) (not e!327077))))

(assert (=> b!568442 (= res!358637 (validKeyInArray!0 k!1914))))

(assert (= (and start!52056 res!358643) b!568437))

(assert (= (and b!568437 res!358634) b!568436))

(assert (= (and b!568436 res!358635) b!568442))

(assert (= (and b!568442 res!358637) b!568438))

(assert (= (and b!568438 res!358640) b!568435))

(assert (= (and b!568435 res!358642) b!568433))

(assert (= (and b!568433 res!358638) b!568440))

(assert (= (and b!568440 res!358641) b!568439))

(assert (= (and b!568439 res!358639) b!568434))

(assert (= (and b!568434 res!358636) b!568441))

(declare-fun m!546963 () Bool)

(assert (=> b!568439 m!546963))

(declare-fun m!546965 () Bool)

(assert (=> b!568439 m!546965))

(assert (=> b!568439 m!546963))

(declare-fun m!546967 () Bool)

(assert (=> b!568439 m!546967))

(declare-fun m!546969 () Bool)

(assert (=> b!568439 m!546969))

(assert (=> b!568439 m!546967))

(declare-fun m!546971 () Bool)

(assert (=> b!568439 m!546971))

(assert (=> b!568439 m!546965))

(assert (=> b!568439 m!546963))

(declare-fun m!546973 () Bool)

(assert (=> b!568439 m!546973))

(declare-fun m!546975 () Bool)

(assert (=> b!568439 m!546975))

(assert (=> b!568439 m!546967))

(assert (=> b!568439 m!546969))

(declare-fun m!546977 () Bool)

(assert (=> b!568434 m!546977))

(declare-fun m!546979 () Bool)

(assert (=> b!568434 m!546979))

(declare-fun m!546981 () Bool)

(assert (=> b!568440 m!546981))

(declare-fun m!546983 () Bool)

(assert (=> b!568442 m!546983))

(declare-fun m!546985 () Bool)

(assert (=> b!568435 m!546985))

(assert (=> b!568436 m!546963))

(assert (=> b!568436 m!546963))

(declare-fun m!546987 () Bool)

(assert (=> b!568436 m!546987))

(assert (=> b!568441 m!546963))

(assert (=> b!568441 m!546963))

(declare-fun m!546989 () Bool)

(assert (=> b!568441 m!546989))

(declare-fun m!546991 () Bool)

(assert (=> b!568438 m!546991))

(declare-fun m!546993 () Bool)

(assert (=> start!52056 m!546993))

(declare-fun m!546995 () Bool)

(assert (=> start!52056 m!546995))

(declare-fun m!546997 () Bool)

(assert (=> b!568433 m!546997))

(push 1)

