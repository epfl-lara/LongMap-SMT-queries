; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50810 () Bool)

(assert start!50810)

(declare-fun b!555838 () Bool)

(declare-fun res!348397 () Bool)

(declare-fun e!320262 () Bool)

(assert (=> b!555838 (=> (not res!348397) (not e!320262))))

(declare-datatypes ((array!35044 0))(
  ( (array!35045 (arr!16832 (Array (_ BitVec 32) (_ BitVec 64))) (size!17197 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35044)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555838 (= res!348397 (validKeyInArray!0 (select (arr!16832 a!3118) j!142)))))

(declare-fun b!555839 () Bool)

(declare-fun e!320261 () Bool)

(assert (=> b!555839 (= e!320262 e!320261)))

(declare-fun res!348395 () Bool)

(assert (=> b!555839 (=> (not res!348395) (not e!320261))))

(declare-datatypes ((SeekEntryResult!5278 0))(
  ( (MissingZero!5278 (index!23339 (_ BitVec 32))) (Found!5278 (index!23340 (_ BitVec 32))) (Intermediate!5278 (undefined!6090 Bool) (index!23341 (_ BitVec 32)) (x!52243 (_ BitVec 32))) (Undefined!5278) (MissingVacant!5278 (index!23342 (_ BitVec 32))) )
))
(declare-fun lt!252561 () SeekEntryResult!5278)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555839 (= res!348395 (or (= lt!252561 (MissingZero!5278 i!1132)) (= lt!252561 (MissingVacant!5278 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35044 (_ BitVec 32)) SeekEntryResult!5278)

(assert (=> b!555839 (= lt!252561 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555840 () Bool)

(declare-fun res!348398 () Bool)

(assert (=> b!555840 (=> (not res!348398) (not e!320261))))

(declare-datatypes ((List!10951 0))(
  ( (Nil!10948) (Cons!10947 (h!11932 (_ BitVec 64)) (t!17170 List!10951)) )
))
(declare-fun arrayNoDuplicates!0 (array!35044 (_ BitVec 32) List!10951) Bool)

(assert (=> b!555840 (= res!348398 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10948))))

(declare-fun b!555841 () Bool)

(declare-fun res!348393 () Bool)

(assert (=> b!555841 (=> (not res!348393) (not e!320262))))

(declare-fun arrayContainsKey!0 (array!35044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555841 (= res!348393 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!348392 () Bool)

(assert (=> start!50810 (=> (not res!348392) (not e!320262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50810 (= res!348392 (validMask!0 mask!3119))))

(assert (=> start!50810 e!320262))

(assert (=> start!50810 true))

(declare-fun array_inv!12715 (array!35044) Bool)

(assert (=> start!50810 (array_inv!12715 a!3118)))

(declare-fun b!555842 () Bool)

(declare-fun res!348400 () Bool)

(assert (=> b!555842 (=> (not res!348400) (not e!320262))))

(assert (=> b!555842 (= res!348400 (validKeyInArray!0 k0!1914))))

(declare-fun b!555843 () Bool)

(declare-fun e!320260 () Bool)

(assert (=> b!555843 (= e!320260 (= (seekEntryOrOpen!0 (select (arr!16832 a!3118) j!142) a!3118 mask!3119) (Found!5278 j!142)))))

(declare-fun b!555844 () Bool)

(declare-fun res!348396 () Bool)

(assert (=> b!555844 (=> (not res!348396) (not e!320261))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35044 (_ BitVec 32)) SeekEntryResult!5278)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555844 (= res!348396 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16832 a!3118) j!142) mask!3119) (select (arr!16832 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16832 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16832 a!3118) i!1132 k0!1914) j!142) (array!35045 (store (arr!16832 a!3118) i!1132 k0!1914) (size!17197 a!3118)) mask!3119)))))

(declare-fun b!555845 () Bool)

(assert (=> b!555845 (= e!320261 (not true))))

(assert (=> b!555845 e!320260))

(declare-fun res!348401 () Bool)

(assert (=> b!555845 (=> (not res!348401) (not e!320260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35044 (_ BitVec 32)) Bool)

(assert (=> b!555845 (= res!348401 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17316 0))(
  ( (Unit!17317) )
))
(declare-fun lt!252562 () Unit!17316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17316)

(assert (=> b!555845 (= lt!252562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555846 () Bool)

(declare-fun res!348399 () Bool)

(assert (=> b!555846 (=> (not res!348399) (not e!320261))))

(assert (=> b!555846 (= res!348399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555847 () Bool)

(declare-fun res!348394 () Bool)

(assert (=> b!555847 (=> (not res!348394) (not e!320262))))

(assert (=> b!555847 (= res!348394 (and (= (size!17197 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17197 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17197 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50810 res!348392) b!555847))

(assert (= (and b!555847 res!348394) b!555838))

(assert (= (and b!555838 res!348397) b!555842))

(assert (= (and b!555842 res!348400) b!555841))

(assert (= (and b!555841 res!348393) b!555839))

(assert (= (and b!555839 res!348395) b!555846))

(assert (= (and b!555846 res!348399) b!555840))

(assert (= (and b!555840 res!348398) b!555844))

(assert (= (and b!555844 res!348396) b!555845))

(assert (= (and b!555845 res!348401) b!555843))

(declare-fun m!533261 () Bool)

(assert (=> b!555844 m!533261))

(declare-fun m!533263 () Bool)

(assert (=> b!555844 m!533263))

(assert (=> b!555844 m!533261))

(declare-fun m!533265 () Bool)

(assert (=> b!555844 m!533265))

(declare-fun m!533267 () Bool)

(assert (=> b!555844 m!533267))

(assert (=> b!555844 m!533265))

(declare-fun m!533269 () Bool)

(assert (=> b!555844 m!533269))

(assert (=> b!555844 m!533263))

(assert (=> b!555844 m!533261))

(declare-fun m!533271 () Bool)

(assert (=> b!555844 m!533271))

(declare-fun m!533273 () Bool)

(assert (=> b!555844 m!533273))

(assert (=> b!555844 m!533265))

(assert (=> b!555844 m!533267))

(declare-fun m!533275 () Bool)

(assert (=> b!555840 m!533275))

(assert (=> b!555838 m!533261))

(assert (=> b!555838 m!533261))

(declare-fun m!533277 () Bool)

(assert (=> b!555838 m!533277))

(declare-fun m!533279 () Bool)

(assert (=> b!555845 m!533279))

(declare-fun m!533281 () Bool)

(assert (=> b!555845 m!533281))

(declare-fun m!533283 () Bool)

(assert (=> b!555841 m!533283))

(declare-fun m!533285 () Bool)

(assert (=> b!555842 m!533285))

(declare-fun m!533287 () Bool)

(assert (=> b!555846 m!533287))

(assert (=> b!555843 m!533261))

(assert (=> b!555843 m!533261))

(declare-fun m!533289 () Bool)

(assert (=> b!555843 m!533289))

(declare-fun m!533291 () Bool)

(assert (=> b!555839 m!533291))

(declare-fun m!533293 () Bool)

(assert (=> start!50810 m!533293))

(declare-fun m!533295 () Bool)

(assert (=> start!50810 m!533295))

(check-sat (not b!555844) (not b!555840) (not b!555839) (not start!50810) (not b!555841) (not b!555838) (not b!555845) (not b!555846) (not b!555842) (not b!555843))
(check-sat)
