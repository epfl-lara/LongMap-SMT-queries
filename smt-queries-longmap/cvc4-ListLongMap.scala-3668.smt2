; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50628 () Bool)

(assert start!50628)

(declare-fun b!553334 () Bool)

(declare-fun res!345748 () Bool)

(declare-fun e!319198 () Bool)

(assert (=> b!553334 (=> (not res!345748) (not e!319198))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553334 (= res!345748 (validKeyInArray!0 k!1914))))

(declare-fun b!553335 () Bool)

(declare-fun res!345750 () Bool)

(assert (=> b!553335 (=> (not res!345750) (not e!319198))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34853 0))(
  ( (array!34854 (arr!16736 (Array (_ BitVec 32) (_ BitVec 64))) (size!17100 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34853)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553335 (= res!345750 (and (= (size!17100 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17100 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17100 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!345755 () Bool)

(assert (=> start!50628 (=> (not res!345755) (not e!319198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50628 (= res!345755 (validMask!0 mask!3119))))

(assert (=> start!50628 e!319198))

(assert (=> start!50628 true))

(declare-fun array_inv!12532 (array!34853) Bool)

(assert (=> start!50628 (array_inv!12532 a!3118)))

(declare-fun b!553336 () Bool)

(declare-fun res!345751 () Bool)

(declare-fun e!319197 () Bool)

(assert (=> b!553336 (=> (not res!345751) (not e!319197))))

(declare-datatypes ((List!10816 0))(
  ( (Nil!10813) (Cons!10812 (h!11797 (_ BitVec 64)) (t!17044 List!10816)) )
))
(declare-fun arrayNoDuplicates!0 (array!34853 (_ BitVec 32) List!10816) Bool)

(assert (=> b!553336 (= res!345751 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10813))))

(declare-fun b!553337 () Bool)

(declare-fun res!345746 () Bool)

(assert (=> b!553337 (=> (not res!345746) (not e!319197))))

(declare-datatypes ((SeekEntryResult!5185 0))(
  ( (MissingZero!5185 (index!22967 (_ BitVec 32))) (Found!5185 (index!22968 (_ BitVec 32))) (Intermediate!5185 (undefined!5997 Bool) (index!22969 (_ BitVec 32)) (x!51891 (_ BitVec 32))) (Undefined!5185) (MissingVacant!5185 (index!22970 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34853 (_ BitVec 32)) SeekEntryResult!5185)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553337 (= res!345746 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16736 a!3118) j!142) mask!3119) (select (arr!16736 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16736 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16736 a!3118) i!1132 k!1914) j!142) (array!34854 (store (arr!16736 a!3118) i!1132 k!1914) (size!17100 a!3118)) mask!3119)))))

(declare-fun b!553338 () Bool)

(declare-fun res!345752 () Bool)

(assert (=> b!553338 (=> (not res!345752) (not e!319198))))

(declare-fun arrayContainsKey!0 (array!34853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553338 (= res!345752 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553339 () Bool)

(declare-fun e!319199 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34853 (_ BitVec 32)) SeekEntryResult!5185)

(assert (=> b!553339 (= e!319199 (= (seekEntryOrOpen!0 (select (arr!16736 a!3118) j!142) a!3118 mask!3119) (Found!5185 j!142)))))

(declare-fun b!553340 () Bool)

(assert (=> b!553340 (= e!319197 (not true))))

(assert (=> b!553340 e!319199))

(declare-fun res!345747 () Bool)

(assert (=> b!553340 (=> (not res!345747) (not e!319199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34853 (_ BitVec 32)) Bool)

(assert (=> b!553340 (= res!345747 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17144 0))(
  ( (Unit!17145) )
))
(declare-fun lt!251440 () Unit!17144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17144)

(assert (=> b!553340 (= lt!251440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553341 () Bool)

(declare-fun res!345754 () Bool)

(assert (=> b!553341 (=> (not res!345754) (not e!319198))))

(assert (=> b!553341 (= res!345754 (validKeyInArray!0 (select (arr!16736 a!3118) j!142)))))

(declare-fun b!553342 () Bool)

(assert (=> b!553342 (= e!319198 e!319197)))

(declare-fun res!345753 () Bool)

(assert (=> b!553342 (=> (not res!345753) (not e!319197))))

(declare-fun lt!251439 () SeekEntryResult!5185)

(assert (=> b!553342 (= res!345753 (or (= lt!251439 (MissingZero!5185 i!1132)) (= lt!251439 (MissingVacant!5185 i!1132))))))

(assert (=> b!553342 (= lt!251439 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553343 () Bool)

(declare-fun res!345749 () Bool)

(assert (=> b!553343 (=> (not res!345749) (not e!319197))))

(assert (=> b!553343 (= res!345749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50628 res!345755) b!553335))

(assert (= (and b!553335 res!345750) b!553341))

(assert (= (and b!553341 res!345754) b!553334))

(assert (= (and b!553334 res!345748) b!553338))

(assert (= (and b!553338 res!345752) b!553342))

(assert (= (and b!553342 res!345753) b!553343))

(assert (= (and b!553343 res!345749) b!553336))

(assert (= (and b!553336 res!345751) b!553337))

(assert (= (and b!553337 res!345746) b!553340))

(assert (= (and b!553340 res!345747) b!553339))

(declare-fun m!530397 () Bool)

(assert (=> b!553336 m!530397))

(declare-fun m!530399 () Bool)

(assert (=> b!553340 m!530399))

(declare-fun m!530401 () Bool)

(assert (=> b!553340 m!530401))

(declare-fun m!530403 () Bool)

(assert (=> start!50628 m!530403))

(declare-fun m!530405 () Bool)

(assert (=> start!50628 m!530405))

(declare-fun m!530407 () Bool)

(assert (=> b!553337 m!530407))

(declare-fun m!530409 () Bool)

(assert (=> b!553337 m!530409))

(assert (=> b!553337 m!530407))

(declare-fun m!530411 () Bool)

(assert (=> b!553337 m!530411))

(declare-fun m!530413 () Bool)

(assert (=> b!553337 m!530413))

(assert (=> b!553337 m!530411))

(declare-fun m!530415 () Bool)

(assert (=> b!553337 m!530415))

(assert (=> b!553337 m!530409))

(assert (=> b!553337 m!530407))

(declare-fun m!530417 () Bool)

(assert (=> b!553337 m!530417))

(declare-fun m!530419 () Bool)

(assert (=> b!553337 m!530419))

(assert (=> b!553337 m!530411))

(assert (=> b!553337 m!530413))

(declare-fun m!530421 () Bool)

(assert (=> b!553338 m!530421))

(assert (=> b!553341 m!530407))

(assert (=> b!553341 m!530407))

(declare-fun m!530423 () Bool)

(assert (=> b!553341 m!530423))

(assert (=> b!553339 m!530407))

(assert (=> b!553339 m!530407))

(declare-fun m!530425 () Bool)

(assert (=> b!553339 m!530425))

(declare-fun m!530427 () Bool)

(assert (=> b!553343 m!530427))

(declare-fun m!530429 () Bool)

(assert (=> b!553342 m!530429))

(declare-fun m!530431 () Bool)

(assert (=> b!553334 m!530431))

(push 1)

