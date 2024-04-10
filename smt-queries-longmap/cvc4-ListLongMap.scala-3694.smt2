; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50784 () Bool)

(assert start!50784)

(declare-fun b!555576 () Bool)

(declare-fun res!347988 () Bool)

(declare-fun e!320199 () Bool)

(assert (=> b!555576 (=> (not res!347988) (not e!320199))))

(declare-datatypes ((array!35009 0))(
  ( (array!35010 (arr!16814 (Array (_ BitVec 32) (_ BitVec 64))) (size!17178 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35009)

(declare-datatypes ((List!10894 0))(
  ( (Nil!10891) (Cons!10890 (h!11875 (_ BitVec 64)) (t!17122 List!10894)) )
))
(declare-fun arrayNoDuplicates!0 (array!35009 (_ BitVec 32) List!10894) Bool)

(assert (=> b!555576 (= res!347988 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10891))))

(declare-fun b!555577 () Bool)

(declare-fun res!347996 () Bool)

(declare-fun e!320196 () Bool)

(assert (=> b!555577 (=> (not res!347996) (not e!320196))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555577 (= res!347996 (and (= (size!17178 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17178 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17178 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555578 () Bool)

(declare-fun res!347992 () Bool)

(assert (=> b!555578 (=> (not res!347992) (not e!320196))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555578 (= res!347992 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555579 () Bool)

(declare-fun res!347995 () Bool)

(assert (=> b!555579 (=> (not res!347995) (not e!320196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555579 (= res!347995 (validKeyInArray!0 (select (arr!16814 a!3118) j!142)))))

(declare-fun res!347991 () Bool)

(assert (=> start!50784 (=> (not res!347991) (not e!320196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50784 (= res!347991 (validMask!0 mask!3119))))

(assert (=> start!50784 e!320196))

(assert (=> start!50784 true))

(declare-fun array_inv!12610 (array!35009) Bool)

(assert (=> start!50784 (array_inv!12610 a!3118)))

(declare-fun b!555580 () Bool)

(declare-fun e!320197 () Bool)

(assert (=> b!555580 (= e!320197 (not true))))

(declare-datatypes ((SeekEntryResult!5263 0))(
  ( (MissingZero!5263 (index!23279 (_ BitVec 32))) (Found!5263 (index!23280 (_ BitVec 32))) (Intermediate!5263 (undefined!6075 Bool) (index!23281 (_ BitVec 32)) (x!52177 (_ BitVec 32))) (Undefined!5263) (MissingVacant!5263 (index!23282 (_ BitVec 32))) )
))
(declare-fun lt!252511 () SeekEntryResult!5263)

(declare-fun lt!252506 () SeekEntryResult!5263)

(assert (=> b!555580 (and (= lt!252511 (Found!5263 j!142)) (or (undefined!6075 lt!252506) (not (is-Intermediate!5263 lt!252506)) (= (select (arr!16814 a!3118) (index!23281 lt!252506)) (select (arr!16814 a!3118) j!142)) (not (= (select (arr!16814 a!3118) (index!23281 lt!252506)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252511 (MissingZero!5263 (index!23281 lt!252506)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35009 (_ BitVec 32)) SeekEntryResult!5263)

(assert (=> b!555580 (= lt!252511 (seekEntryOrOpen!0 (select (arr!16814 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35009 (_ BitVec 32)) Bool)

(assert (=> b!555580 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17300 0))(
  ( (Unit!17301) )
))
(declare-fun lt!252508 () Unit!17300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17300)

(assert (=> b!555580 (= lt!252508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555581 () Bool)

(assert (=> b!555581 (= e!320196 e!320199)))

(declare-fun res!347989 () Bool)

(assert (=> b!555581 (=> (not res!347989) (not e!320199))))

(declare-fun lt!252510 () SeekEntryResult!5263)

(assert (=> b!555581 (= res!347989 (or (= lt!252510 (MissingZero!5263 i!1132)) (= lt!252510 (MissingVacant!5263 i!1132))))))

(assert (=> b!555581 (= lt!252510 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555582 () Bool)

(assert (=> b!555582 (= e!320199 e!320197)))

(declare-fun res!347994 () Bool)

(assert (=> b!555582 (=> (not res!347994) (not e!320197))))

(declare-fun lt!252507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35009 (_ BitVec 32)) SeekEntryResult!5263)

(assert (=> b!555582 (= res!347994 (= lt!252506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252507 (select (store (arr!16814 a!3118) i!1132 k!1914) j!142) (array!35010 (store (arr!16814 a!3118) i!1132 k!1914) (size!17178 a!3118)) mask!3119)))))

(declare-fun lt!252509 () (_ BitVec 32))

(assert (=> b!555582 (= lt!252506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252509 (select (arr!16814 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555582 (= lt!252507 (toIndex!0 (select (store (arr!16814 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555582 (= lt!252509 (toIndex!0 (select (arr!16814 a!3118) j!142) mask!3119))))

(declare-fun b!555583 () Bool)

(declare-fun res!347990 () Bool)

(assert (=> b!555583 (=> (not res!347990) (not e!320196))))

(assert (=> b!555583 (= res!347990 (validKeyInArray!0 k!1914))))

(declare-fun b!555584 () Bool)

(declare-fun res!347993 () Bool)

(assert (=> b!555584 (=> (not res!347993) (not e!320199))))

(assert (=> b!555584 (= res!347993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50784 res!347991) b!555577))

(assert (= (and b!555577 res!347996) b!555579))

(assert (= (and b!555579 res!347995) b!555583))

(assert (= (and b!555583 res!347990) b!555578))

(assert (= (and b!555578 res!347992) b!555581))

(assert (= (and b!555581 res!347989) b!555584))

(assert (= (and b!555584 res!347993) b!555576))

(assert (= (and b!555576 res!347988) b!555582))

(assert (= (and b!555582 res!347994) b!555580))

(declare-fun m!533317 () Bool)

(assert (=> b!555581 m!533317))

(declare-fun m!533319 () Bool)

(assert (=> b!555582 m!533319))

(declare-fun m!533321 () Bool)

(assert (=> b!555582 m!533321))

(assert (=> b!555582 m!533319))

(declare-fun m!533323 () Bool)

(assert (=> b!555582 m!533323))

(assert (=> b!555582 m!533319))

(declare-fun m!533325 () Bool)

(assert (=> b!555582 m!533325))

(assert (=> b!555582 m!533323))

(declare-fun m!533327 () Bool)

(assert (=> b!555582 m!533327))

(declare-fun m!533329 () Bool)

(assert (=> b!555582 m!533329))

(assert (=> b!555582 m!533323))

(declare-fun m!533331 () Bool)

(assert (=> b!555582 m!533331))

(declare-fun m!533333 () Bool)

(assert (=> b!555578 m!533333))

(declare-fun m!533335 () Bool)

(assert (=> b!555583 m!533335))

(assert (=> b!555579 m!533319))

(assert (=> b!555579 m!533319))

(declare-fun m!533337 () Bool)

(assert (=> b!555579 m!533337))

(declare-fun m!533339 () Bool)

(assert (=> start!50784 m!533339))

(declare-fun m!533341 () Bool)

(assert (=> start!50784 m!533341))

(declare-fun m!533343 () Bool)

(assert (=> b!555584 m!533343))

(declare-fun m!533345 () Bool)

(assert (=> b!555576 m!533345))

(assert (=> b!555580 m!533319))

(declare-fun m!533347 () Bool)

(assert (=> b!555580 m!533347))

(declare-fun m!533349 () Bool)

(assert (=> b!555580 m!533349))

(declare-fun m!533351 () Bool)

(assert (=> b!555580 m!533351))

(assert (=> b!555580 m!533319))

(declare-fun m!533353 () Bool)

(assert (=> b!555580 m!533353))

(push 1)

