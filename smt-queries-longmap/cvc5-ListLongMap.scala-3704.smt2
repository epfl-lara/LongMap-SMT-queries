; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50840 () Bool)

(assert start!50840)

(declare-fun b!556379 () Bool)

(declare-fun res!348791 () Bool)

(declare-fun e!320546 () Bool)

(assert (=> b!556379 (=> (not res!348791) (not e!320546))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35065 0))(
  ( (array!35066 (arr!16842 (Array (_ BitVec 32) (_ BitVec 64))) (size!17206 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35065)

(assert (=> b!556379 (= res!348791 (and (= (size!17206 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17206 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17206 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556380 () Bool)

(declare-fun res!348793 () Bool)

(declare-fun e!320543 () Bool)

(assert (=> b!556380 (=> (not res!348793) (not e!320543))))

(declare-datatypes ((List!10922 0))(
  ( (Nil!10919) (Cons!10918 (h!11903 (_ BitVec 64)) (t!17150 List!10922)) )
))
(declare-fun arrayNoDuplicates!0 (array!35065 (_ BitVec 32) List!10922) Bool)

(assert (=> b!556380 (= res!348793 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10919))))

(declare-fun b!556381 () Bool)

(declare-fun res!348795 () Bool)

(assert (=> b!556381 (=> (not res!348795) (not e!320546))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556381 (= res!348795 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556382 () Bool)

(declare-fun e!320544 () Bool)

(assert (=> b!556382 (= e!320543 e!320544)))

(declare-fun res!348797 () Bool)

(assert (=> b!556382 (=> (not res!348797) (not e!320544))))

(declare-fun lt!252856 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5291 0))(
  ( (MissingZero!5291 (index!23391 (_ BitVec 32))) (Found!5291 (index!23392 (_ BitVec 32))) (Intermediate!5291 (undefined!6103 Bool) (index!23393 (_ BitVec 32)) (x!52285 (_ BitVec 32))) (Undefined!5291) (MissingVacant!5291 (index!23394 (_ BitVec 32))) )
))
(declare-fun lt!252855 () SeekEntryResult!5291)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35065 (_ BitVec 32)) SeekEntryResult!5291)

(assert (=> b!556382 (= res!348797 (= lt!252855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252856 (select (store (arr!16842 a!3118) i!1132 k!1914) j!142) (array!35066 (store (arr!16842 a!3118) i!1132 k!1914) (size!17206 a!3118)) mask!3119)))))

(declare-fun lt!252859 () (_ BitVec 32))

(assert (=> b!556382 (= lt!252855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252859 (select (arr!16842 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556382 (= lt!252856 (toIndex!0 (select (store (arr!16842 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!556382 (= lt!252859 (toIndex!0 (select (arr!16842 a!3118) j!142) mask!3119))))

(declare-fun b!556383 () Bool)

(declare-fun res!348792 () Bool)

(assert (=> b!556383 (=> (not res!348792) (not e!320543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35065 (_ BitVec 32)) Bool)

(assert (=> b!556383 (= res!348792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556385 () Bool)

(declare-fun e!320545 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35065 (_ BitVec 32)) SeekEntryResult!5291)

(assert (=> b!556385 (= e!320545 (= (seekEntryOrOpen!0 (select (arr!16842 a!3118) j!142) a!3118 mask!3119) (Found!5291 j!142)))))

(declare-fun b!556386 () Bool)

(declare-fun res!348800 () Bool)

(assert (=> b!556386 (=> (not res!348800) (not e!320546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556386 (= res!348800 (validKeyInArray!0 k!1914))))

(declare-fun b!556387 () Bool)

(declare-fun res!348798 () Bool)

(assert (=> b!556387 (=> (not res!348798) (not e!320546))))

(assert (=> b!556387 (= res!348798 (validKeyInArray!0 (select (arr!16842 a!3118) j!142)))))

(declare-fun b!556388 () Bool)

(assert (=> b!556388 (= e!320544 (not (or (not (is-Intermediate!5291 lt!252855)) (undefined!6103 lt!252855) (= (select (arr!16842 a!3118) (index!23393 lt!252855)) (select (arr!16842 a!3118) j!142)) (= (select (arr!16842 a!3118) (index!23393 lt!252855)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!556388 e!320545))

(declare-fun res!348794 () Bool)

(assert (=> b!556388 (=> (not res!348794) (not e!320545))))

(assert (=> b!556388 (= res!348794 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17356 0))(
  ( (Unit!17357) )
))
(declare-fun lt!252857 () Unit!17356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35065 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17356)

(assert (=> b!556388 (= lt!252857 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!348796 () Bool)

(assert (=> start!50840 (=> (not res!348796) (not e!320546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50840 (= res!348796 (validMask!0 mask!3119))))

(assert (=> start!50840 e!320546))

(assert (=> start!50840 true))

(declare-fun array_inv!12638 (array!35065) Bool)

(assert (=> start!50840 (array_inv!12638 a!3118)))

(declare-fun b!556384 () Bool)

(assert (=> b!556384 (= e!320546 e!320543)))

(declare-fun res!348799 () Bool)

(assert (=> b!556384 (=> (not res!348799) (not e!320543))))

(declare-fun lt!252858 () SeekEntryResult!5291)

(assert (=> b!556384 (= res!348799 (or (= lt!252858 (MissingZero!5291 i!1132)) (= lt!252858 (MissingVacant!5291 i!1132))))))

(assert (=> b!556384 (= lt!252858 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50840 res!348796) b!556379))

(assert (= (and b!556379 res!348791) b!556387))

(assert (= (and b!556387 res!348798) b!556386))

(assert (= (and b!556386 res!348800) b!556381))

(assert (= (and b!556381 res!348795) b!556384))

(assert (= (and b!556384 res!348799) b!556383))

(assert (= (and b!556383 res!348792) b!556380))

(assert (= (and b!556380 res!348793) b!556382))

(assert (= (and b!556382 res!348797) b!556388))

(assert (= (and b!556388 res!348794) b!556385))

(declare-fun m!534357 () Bool)

(assert (=> b!556387 m!534357))

(assert (=> b!556387 m!534357))

(declare-fun m!534359 () Bool)

(assert (=> b!556387 m!534359))

(declare-fun m!534361 () Bool)

(assert (=> start!50840 m!534361))

(declare-fun m!534363 () Bool)

(assert (=> start!50840 m!534363))

(declare-fun m!534365 () Bool)

(assert (=> b!556381 m!534365))

(declare-fun m!534367 () Bool)

(assert (=> b!556383 m!534367))

(declare-fun m!534369 () Bool)

(assert (=> b!556384 m!534369))

(declare-fun m!534371 () Bool)

(assert (=> b!556386 m!534371))

(declare-fun m!534373 () Bool)

(assert (=> b!556380 m!534373))

(declare-fun m!534375 () Bool)

(assert (=> b!556388 m!534375))

(assert (=> b!556388 m!534357))

(declare-fun m!534377 () Bool)

(assert (=> b!556388 m!534377))

(declare-fun m!534379 () Bool)

(assert (=> b!556388 m!534379))

(assert (=> b!556382 m!534357))

(declare-fun m!534381 () Bool)

(assert (=> b!556382 m!534381))

(assert (=> b!556382 m!534357))

(declare-fun m!534383 () Bool)

(assert (=> b!556382 m!534383))

(assert (=> b!556382 m!534357))

(declare-fun m!534385 () Bool)

(assert (=> b!556382 m!534385))

(declare-fun m!534387 () Bool)

(assert (=> b!556382 m!534387))

(assert (=> b!556382 m!534385))

(declare-fun m!534389 () Bool)

(assert (=> b!556382 m!534389))

(assert (=> b!556382 m!534385))

(declare-fun m!534391 () Bool)

(assert (=> b!556382 m!534391))

(assert (=> b!556385 m!534357))

(assert (=> b!556385 m!534357))

(declare-fun m!534393 () Bool)

(assert (=> b!556385 m!534393))

(push 1)

