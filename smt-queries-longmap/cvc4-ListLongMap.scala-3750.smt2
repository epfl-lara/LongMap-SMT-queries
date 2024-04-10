; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51498 () Bool)

(assert start!51498)

(declare-fun b!563315 () Bool)

(declare-fun res!354473 () Bool)

(declare-fun e!324633 () Bool)

(assert (=> b!563315 (=> (not res!354473) (not e!324633))))

(declare-datatypes ((array!35363 0))(
  ( (array!35364 (arr!16982 (Array (_ BitVec 32) (_ BitVec 64))) (size!17346 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35363)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563315 (= res!354473 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!354471 () Bool)

(assert (=> start!51498 (=> (not res!354471) (not e!324633))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51498 (= res!354471 (validMask!0 mask!3119))))

(assert (=> start!51498 e!324633))

(assert (=> start!51498 true))

(declare-fun array_inv!12778 (array!35363) Bool)

(assert (=> start!51498 (array_inv!12778 a!3118)))

(declare-fun b!563316 () Bool)

(declare-fun res!354476 () Bool)

(assert (=> b!563316 (=> (not res!354476) (not e!324633))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563316 (= res!354476 (validKeyInArray!0 (select (arr!16982 a!3118) j!142)))))

(declare-fun b!563317 () Bool)

(declare-fun res!354475 () Bool)

(declare-fun e!324635 () Bool)

(assert (=> b!563317 (=> (not res!354475) (not e!324635))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5431 0))(
  ( (MissingZero!5431 (index!23951 (_ BitVec 32))) (Found!5431 (index!23952 (_ BitVec 32))) (Intermediate!5431 (undefined!6243 Bool) (index!23953 (_ BitVec 32)) (x!52838 (_ BitVec 32))) (Undefined!5431) (MissingVacant!5431 (index!23954 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35363 (_ BitVec 32)) SeekEntryResult!5431)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563317 (= res!354475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16982 a!3118) j!142) mask!3119) (select (arr!16982 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16982 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16982 a!3118) i!1132 k!1914) j!142) (array!35364 (store (arr!16982 a!3118) i!1132 k!1914) (size!17346 a!3118)) mask!3119)))))

(declare-fun b!563318 () Bool)

(declare-fun res!354467 () Bool)

(assert (=> b!563318 (=> (not res!354467) (not e!324633))))

(assert (=> b!563318 (= res!354467 (and (= (size!17346 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17346 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17346 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563319 () Bool)

(assert (=> b!563319 (= e!324635 (not true))))

(declare-fun e!324636 () Bool)

(assert (=> b!563319 e!324636))

(declare-fun res!354470 () Bool)

(assert (=> b!563319 (=> (not res!354470) (not e!324636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35363 (_ BitVec 32)) Bool)

(assert (=> b!563319 (= res!354470 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17636 0))(
  ( (Unit!17637) )
))
(declare-fun lt!257173 () Unit!17636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17636)

(assert (=> b!563319 (= lt!257173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563320 () Bool)

(declare-fun res!354468 () Bool)

(assert (=> b!563320 (=> (not res!354468) (not e!324635))))

(declare-datatypes ((List!11062 0))(
  ( (Nil!11059) (Cons!11058 (h!12061 (_ BitVec 64)) (t!17290 List!11062)) )
))
(declare-fun arrayNoDuplicates!0 (array!35363 (_ BitVec 32) List!11062) Bool)

(assert (=> b!563320 (= res!354468 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11059))))

(declare-fun b!563321 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35363 (_ BitVec 32)) SeekEntryResult!5431)

(assert (=> b!563321 (= e!324636 (= (seekEntryOrOpen!0 (select (arr!16982 a!3118) j!142) a!3118 mask!3119) (Found!5431 j!142)))))

(declare-fun b!563322 () Bool)

(declare-fun res!354474 () Bool)

(assert (=> b!563322 (=> (not res!354474) (not e!324633))))

(assert (=> b!563322 (= res!354474 (validKeyInArray!0 k!1914))))

(declare-fun b!563323 () Bool)

(declare-fun res!354472 () Bool)

(assert (=> b!563323 (=> (not res!354472) (not e!324635))))

(assert (=> b!563323 (= res!354472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563324 () Bool)

(assert (=> b!563324 (= e!324633 e!324635)))

(declare-fun res!354469 () Bool)

(assert (=> b!563324 (=> (not res!354469) (not e!324635))))

(declare-fun lt!257172 () SeekEntryResult!5431)

(assert (=> b!563324 (= res!354469 (or (= lt!257172 (MissingZero!5431 i!1132)) (= lt!257172 (MissingVacant!5431 i!1132))))))

(assert (=> b!563324 (= lt!257172 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51498 res!354471) b!563318))

(assert (= (and b!563318 res!354467) b!563316))

(assert (= (and b!563316 res!354476) b!563322))

(assert (= (and b!563322 res!354474) b!563315))

(assert (= (and b!563315 res!354473) b!563324))

(assert (= (and b!563324 res!354469) b!563323))

(assert (= (and b!563323 res!354472) b!563320))

(assert (= (and b!563320 res!354468) b!563317))

(assert (= (and b!563317 res!354475) b!563319))

(assert (= (and b!563319 res!354470) b!563321))

(declare-fun m!541635 () Bool)

(assert (=> b!563324 m!541635))

(declare-fun m!541637 () Bool)

(assert (=> b!563322 m!541637))

(declare-fun m!541639 () Bool)

(assert (=> b!563320 m!541639))

(declare-fun m!541641 () Bool)

(assert (=> start!51498 m!541641))

(declare-fun m!541643 () Bool)

(assert (=> start!51498 m!541643))

(declare-fun m!541645 () Bool)

(assert (=> b!563317 m!541645))

(declare-fun m!541647 () Bool)

(assert (=> b!563317 m!541647))

(assert (=> b!563317 m!541645))

(declare-fun m!541649 () Bool)

(assert (=> b!563317 m!541649))

(declare-fun m!541651 () Bool)

(assert (=> b!563317 m!541651))

(assert (=> b!563317 m!541649))

(declare-fun m!541653 () Bool)

(assert (=> b!563317 m!541653))

(assert (=> b!563317 m!541647))

(assert (=> b!563317 m!541645))

(declare-fun m!541655 () Bool)

(assert (=> b!563317 m!541655))

(declare-fun m!541657 () Bool)

(assert (=> b!563317 m!541657))

(assert (=> b!563317 m!541649))

(assert (=> b!563317 m!541651))

(declare-fun m!541659 () Bool)

(assert (=> b!563319 m!541659))

(declare-fun m!541661 () Bool)

(assert (=> b!563319 m!541661))

(declare-fun m!541663 () Bool)

(assert (=> b!563315 m!541663))

(assert (=> b!563316 m!541645))

(assert (=> b!563316 m!541645))

(declare-fun m!541665 () Bool)

(assert (=> b!563316 m!541665))

(assert (=> b!563321 m!541645))

(assert (=> b!563321 m!541645))

(declare-fun m!541667 () Bool)

(assert (=> b!563321 m!541667))

(declare-fun m!541669 () Bool)

(assert (=> b!563323 m!541669))

(push 1)

