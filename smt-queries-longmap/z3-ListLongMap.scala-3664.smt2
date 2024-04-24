; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50646 () Bool)

(assert start!50646)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!319152 () Bool)

(declare-datatypes ((array!34818 0))(
  ( (array!34819 (arr!16717 (Array (_ BitVec 32) (_ BitVec 64))) (size!17081 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34818)

(declare-fun b!553114 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5122 0))(
  ( (MissingZero!5122 (index!22715 (_ BitVec 32))) (Found!5122 (index!22716 (_ BitVec 32))) (Intermediate!5122 (undefined!5934 Bool) (index!22717 (_ BitVec 32)) (x!51799 (_ BitVec 32))) (Undefined!5122) (MissingVacant!5122 (index!22718 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34818 (_ BitVec 32)) SeekEntryResult!5122)

(assert (=> b!553114 (= e!319152 (= (seekEntryOrOpen!0 (select (arr!16717 a!3118) j!142) a!3118 mask!3119) (Found!5122 j!142)))))

(declare-fun b!553115 () Bool)

(declare-fun res!345421 () Bool)

(declare-fun e!319151 () Bool)

(assert (=> b!553115 (=> (not res!345421) (not e!319151))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34818 (_ BitVec 32)) SeekEntryResult!5122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553115 (= res!345421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16717 a!3118) j!142) mask!3119) (select (arr!16717 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16717 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16717 a!3118) i!1132 k0!1914) j!142) (array!34819 (store (arr!16717 a!3118) i!1132 k0!1914) (size!17081 a!3118)) mask!3119)))))

(declare-fun b!553117 () Bool)

(declare-fun res!345428 () Bool)

(declare-fun e!319149 () Bool)

(assert (=> b!553117 (=> (not res!345428) (not e!319149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553117 (= res!345428 (validKeyInArray!0 (select (arr!16717 a!3118) j!142)))))

(declare-fun b!553118 () Bool)

(assert (=> b!553118 (= e!319151 (not true))))

(assert (=> b!553118 e!319152))

(declare-fun res!345424 () Bool)

(assert (=> b!553118 (=> (not res!345424) (not e!319152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34818 (_ BitVec 32)) Bool)

(assert (=> b!553118 (= res!345424 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17089 0))(
  ( (Unit!17090) )
))
(declare-fun lt!251440 () Unit!17089)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17089)

(assert (=> b!553118 (= lt!251440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553119 () Bool)

(declare-fun res!345423 () Bool)

(assert (=> b!553119 (=> (not res!345423) (not e!319149))))

(assert (=> b!553119 (= res!345423 (validKeyInArray!0 k0!1914))))

(declare-fun b!553120 () Bool)

(declare-fun res!345429 () Bool)

(assert (=> b!553120 (=> (not res!345429) (not e!319151))))

(assert (=> b!553120 (= res!345429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553121 () Bool)

(declare-fun res!345430 () Bool)

(assert (=> b!553121 (=> (not res!345430) (not e!319149))))

(declare-fun arrayContainsKey!0 (array!34818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553121 (= res!345430 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!345425 () Bool)

(assert (=> start!50646 (=> (not res!345425) (not e!319149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50646 (= res!345425 (validMask!0 mask!3119))))

(assert (=> start!50646 e!319149))

(assert (=> start!50646 true))

(declare-fun array_inv!12576 (array!34818) Bool)

(assert (=> start!50646 (array_inv!12576 a!3118)))

(declare-fun b!553116 () Bool)

(declare-fun res!345427 () Bool)

(assert (=> b!553116 (=> (not res!345427) (not e!319151))))

(declare-datatypes ((List!10704 0))(
  ( (Nil!10701) (Cons!10700 (h!11688 (_ BitVec 64)) (t!16924 List!10704)) )
))
(declare-fun arrayNoDuplicates!0 (array!34818 (_ BitVec 32) List!10704) Bool)

(assert (=> b!553116 (= res!345427 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10701))))

(declare-fun b!553122 () Bool)

(declare-fun res!345426 () Bool)

(assert (=> b!553122 (=> (not res!345426) (not e!319149))))

(assert (=> b!553122 (= res!345426 (and (= (size!17081 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17081 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17081 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553123 () Bool)

(assert (=> b!553123 (= e!319149 e!319151)))

(declare-fun res!345422 () Bool)

(assert (=> b!553123 (=> (not res!345422) (not e!319151))))

(declare-fun lt!251439 () SeekEntryResult!5122)

(assert (=> b!553123 (= res!345422 (or (= lt!251439 (MissingZero!5122 i!1132)) (= lt!251439 (MissingVacant!5122 i!1132))))))

(assert (=> b!553123 (= lt!251439 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50646 res!345425) b!553122))

(assert (= (and b!553122 res!345426) b!553117))

(assert (= (and b!553117 res!345428) b!553119))

(assert (= (and b!553119 res!345423) b!553121))

(assert (= (and b!553121 res!345430) b!553123))

(assert (= (and b!553123 res!345422) b!553120))

(assert (= (and b!553120 res!345429) b!553116))

(assert (= (and b!553116 res!345427) b!553115))

(assert (= (and b!553115 res!345421) b!553118))

(assert (= (and b!553118 res!345424) b!553114))

(declare-fun m!530231 () Bool)

(assert (=> start!50646 m!530231))

(declare-fun m!530233 () Bool)

(assert (=> start!50646 m!530233))

(declare-fun m!530235 () Bool)

(assert (=> b!553117 m!530235))

(assert (=> b!553117 m!530235))

(declare-fun m!530237 () Bool)

(assert (=> b!553117 m!530237))

(declare-fun m!530239 () Bool)

(assert (=> b!553118 m!530239))

(declare-fun m!530241 () Bool)

(assert (=> b!553118 m!530241))

(declare-fun m!530243 () Bool)

(assert (=> b!553120 m!530243))

(declare-fun m!530245 () Bool)

(assert (=> b!553121 m!530245))

(declare-fun m!530247 () Bool)

(assert (=> b!553119 m!530247))

(declare-fun m!530249 () Bool)

(assert (=> b!553116 m!530249))

(assert (=> b!553114 m!530235))

(assert (=> b!553114 m!530235))

(declare-fun m!530251 () Bool)

(assert (=> b!553114 m!530251))

(declare-fun m!530253 () Bool)

(assert (=> b!553123 m!530253))

(assert (=> b!553115 m!530235))

(declare-fun m!530255 () Bool)

(assert (=> b!553115 m!530255))

(assert (=> b!553115 m!530235))

(declare-fun m!530257 () Bool)

(assert (=> b!553115 m!530257))

(declare-fun m!530259 () Bool)

(assert (=> b!553115 m!530259))

(assert (=> b!553115 m!530257))

(declare-fun m!530261 () Bool)

(assert (=> b!553115 m!530261))

(assert (=> b!553115 m!530255))

(assert (=> b!553115 m!530235))

(declare-fun m!530263 () Bool)

(assert (=> b!553115 m!530263))

(declare-fun m!530265 () Bool)

(assert (=> b!553115 m!530265))

(assert (=> b!553115 m!530257))

(assert (=> b!553115 m!530259))

(check-sat (not b!553120) (not b!553114) (not b!553116) (not b!553115) (not b!553121) (not b!553118) (not start!50646) (not b!553123) (not b!553119) (not b!553117))
(check-sat)
