; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50868 () Bool)

(assert start!50868)

(declare-fun e!320562 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!556309 () Bool)

(declare-datatypes ((array!35040 0))(
  ( (array!35041 (arr!16828 (Array (_ BitVec 32) (_ BitVec 64))) (size!17192 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35040)

(declare-datatypes ((SeekEntryResult!5233 0))(
  ( (MissingZero!5233 (index!23159 (_ BitVec 32))) (Found!5233 (index!23160 (_ BitVec 32))) (Intermediate!5233 (undefined!6045 Bool) (index!23161 (_ BitVec 32)) (x!52206 (_ BitVec 32))) (Undefined!5233) (MissingVacant!5233 (index!23162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35040 (_ BitVec 32)) SeekEntryResult!5233)

(assert (=> b!556309 (= e!320562 (= (seekEntryOrOpen!0 (select (arr!16828 a!3118) j!142) a!3118 mask!3119) (Found!5233 j!142)))))

(declare-fun b!556310 () Bool)

(declare-fun res!348616 () Bool)

(declare-fun e!320565 () Bool)

(assert (=> b!556310 (=> (not res!348616) (not e!320565))))

(declare-datatypes ((List!10815 0))(
  ( (Nil!10812) (Cons!10811 (h!11799 (_ BitVec 64)) (t!17035 List!10815)) )
))
(declare-fun arrayNoDuplicates!0 (array!35040 (_ BitVec 32) List!10815) Bool)

(assert (=> b!556310 (= res!348616 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10812))))

(declare-fun b!556311 () Bool)

(assert (=> b!556311 (= e!320565 (not true))))

(assert (=> b!556311 e!320562))

(declare-fun res!348620 () Bool)

(assert (=> b!556311 (=> (not res!348620) (not e!320562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35040 (_ BitVec 32)) Bool)

(assert (=> b!556311 (= res!348620 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17311 0))(
  ( (Unit!17312) )
))
(declare-fun lt!252906 () Unit!17311)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17311)

(assert (=> b!556311 (= lt!252906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556312 () Bool)

(declare-fun e!320564 () Bool)

(assert (=> b!556312 (= e!320564 e!320565)))

(declare-fun res!348625 () Bool)

(assert (=> b!556312 (=> (not res!348625) (not e!320565))))

(declare-fun lt!252907 () SeekEntryResult!5233)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556312 (= res!348625 (or (= lt!252907 (MissingZero!5233 i!1132)) (= lt!252907 (MissingVacant!5233 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!556312 (= lt!252907 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!348618 () Bool)

(assert (=> start!50868 (=> (not res!348618) (not e!320564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50868 (= res!348618 (validMask!0 mask!3119))))

(assert (=> start!50868 e!320564))

(assert (=> start!50868 true))

(declare-fun array_inv!12687 (array!35040) Bool)

(assert (=> start!50868 (array_inv!12687 a!3118)))

(declare-fun b!556313 () Bool)

(declare-fun res!348623 () Bool)

(assert (=> b!556313 (=> (not res!348623) (not e!320564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556313 (= res!348623 (validKeyInArray!0 (select (arr!16828 a!3118) j!142)))))

(declare-fun b!556314 () Bool)

(declare-fun res!348621 () Bool)

(assert (=> b!556314 (=> (not res!348621) (not e!320564))))

(assert (=> b!556314 (= res!348621 (validKeyInArray!0 k0!1914))))

(declare-fun b!556315 () Bool)

(declare-fun res!348619 () Bool)

(assert (=> b!556315 (=> (not res!348619) (not e!320565))))

(assert (=> b!556315 (= res!348619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556316 () Bool)

(declare-fun res!348622 () Bool)

(assert (=> b!556316 (=> (not res!348622) (not e!320564))))

(assert (=> b!556316 (= res!348622 (and (= (size!17192 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17192 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17192 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556317 () Bool)

(declare-fun res!348624 () Bool)

(assert (=> b!556317 (=> (not res!348624) (not e!320564))))

(declare-fun arrayContainsKey!0 (array!35040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556317 (= res!348624 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556318 () Bool)

(declare-fun res!348617 () Bool)

(assert (=> b!556318 (=> (not res!348617) (not e!320565))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35040 (_ BitVec 32)) SeekEntryResult!5233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556318 (= res!348617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16828 a!3118) j!142) mask!3119) (select (arr!16828 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16828 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16828 a!3118) i!1132 k0!1914) j!142) (array!35041 (store (arr!16828 a!3118) i!1132 k0!1914) (size!17192 a!3118)) mask!3119)))))

(assert (= (and start!50868 res!348618) b!556316))

(assert (= (and b!556316 res!348622) b!556313))

(assert (= (and b!556313 res!348623) b!556314))

(assert (= (and b!556314 res!348621) b!556317))

(assert (= (and b!556317 res!348624) b!556312))

(assert (= (and b!556312 res!348625) b!556315))

(assert (= (and b!556315 res!348619) b!556310))

(assert (= (and b!556310 res!348616) b!556318))

(assert (= (and b!556318 res!348617) b!556311))

(assert (= (and b!556311 res!348620) b!556309))

(declare-fun m!534371 () Bool)

(assert (=> b!556309 m!534371))

(assert (=> b!556309 m!534371))

(declare-fun m!534373 () Bool)

(assert (=> b!556309 m!534373))

(assert (=> b!556313 m!534371))

(assert (=> b!556313 m!534371))

(declare-fun m!534375 () Bool)

(assert (=> b!556313 m!534375))

(declare-fun m!534377 () Bool)

(assert (=> b!556310 m!534377))

(declare-fun m!534379 () Bool)

(assert (=> start!50868 m!534379))

(declare-fun m!534381 () Bool)

(assert (=> start!50868 m!534381))

(declare-fun m!534383 () Bool)

(assert (=> b!556314 m!534383))

(declare-fun m!534385 () Bool)

(assert (=> b!556315 m!534385))

(assert (=> b!556318 m!534371))

(declare-fun m!534387 () Bool)

(assert (=> b!556318 m!534387))

(assert (=> b!556318 m!534371))

(declare-fun m!534389 () Bool)

(assert (=> b!556318 m!534389))

(declare-fun m!534391 () Bool)

(assert (=> b!556318 m!534391))

(assert (=> b!556318 m!534389))

(declare-fun m!534393 () Bool)

(assert (=> b!556318 m!534393))

(assert (=> b!556318 m!534387))

(assert (=> b!556318 m!534371))

(declare-fun m!534395 () Bool)

(assert (=> b!556318 m!534395))

(declare-fun m!534397 () Bool)

(assert (=> b!556318 m!534397))

(assert (=> b!556318 m!534389))

(assert (=> b!556318 m!534391))

(declare-fun m!534399 () Bool)

(assert (=> b!556312 m!534399))

(declare-fun m!534401 () Bool)

(assert (=> b!556317 m!534401))

(declare-fun m!534403 () Bool)

(assert (=> b!556311 m!534403))

(declare-fun m!534405 () Bool)

(assert (=> b!556311 m!534405))

(check-sat (not b!556315) (not b!556309) (not b!556313) (not b!556311) (not b!556310) (not b!556317) (not b!556318) (not start!50868) (not b!556312) (not b!556314))
(check-sat)
