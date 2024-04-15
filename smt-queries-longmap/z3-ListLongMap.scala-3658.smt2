; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50492 () Bool)

(assert start!50492)

(declare-fun b!551803 () Bool)

(declare-fun res!344545 () Bool)

(declare-fun e!318408 () Bool)

(assert (=> b!551803 (=> (not res!344545) (not e!318408))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551803 (= res!344545 (validKeyInArray!0 k0!1914))))

(declare-fun b!551804 () Bool)

(declare-fun e!318409 () Bool)

(assert (=> b!551804 (= e!318408 e!318409)))

(declare-fun res!344543 () Bool)

(assert (=> b!551804 (=> (not res!344543) (not e!318409))))

(declare-datatypes ((SeekEntryResult!5149 0))(
  ( (MissingZero!5149 (index!22823 (_ BitVec 32))) (Found!5149 (index!22824 (_ BitVec 32))) (Intermediate!5149 (undefined!5961 Bool) (index!22825 (_ BitVec 32)) (x!51764 (_ BitVec 32))) (Undefined!5149) (MissingVacant!5149 (index!22826 (_ BitVec 32))) )
))
(declare-fun lt!250794 () SeekEntryResult!5149)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551804 (= res!344543 (or (= lt!250794 (MissingZero!5149 i!1132)) (= lt!250794 (MissingVacant!5149 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34783 0))(
  ( (array!34784 (arr!16703 (Array (_ BitVec 32) (_ BitVec 64))) (size!17068 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34783)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34783 (_ BitVec 32)) SeekEntryResult!5149)

(assert (=> b!551804 (= lt!250794 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551805 () Bool)

(declare-fun res!344546 () Bool)

(assert (=> b!551805 (=> (not res!344546) (not e!318409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34783 (_ BitVec 32)) Bool)

(assert (=> b!551805 (= res!344546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551806 () Bool)

(declare-fun res!344547 () Bool)

(assert (=> b!551806 (=> (not res!344547) (not e!318408))))

(declare-fun arrayContainsKey!0 (array!34783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551806 (= res!344547 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551807 () Bool)

(declare-fun res!344542 () Bool)

(assert (=> b!551807 (=> (not res!344542) (not e!318409))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34783 (_ BitVec 32)) SeekEntryResult!5149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551807 (= res!344542 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16703 a!3118) j!142) mask!3119) (select (arr!16703 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16703 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16703 a!3118) i!1132 k0!1914) j!142) (array!34784 (store (arr!16703 a!3118) i!1132 k0!1914) (size!17068 a!3118)) mask!3119)))))

(declare-fun res!344544 () Bool)

(assert (=> start!50492 (=> (not res!344544) (not e!318408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50492 (= res!344544 (validMask!0 mask!3119))))

(assert (=> start!50492 e!318408))

(assert (=> start!50492 true))

(declare-fun array_inv!12586 (array!34783) Bool)

(assert (=> start!50492 (array_inv!12586 a!3118)))

(declare-fun b!551808 () Bool)

(declare-fun res!344541 () Bool)

(assert (=> b!551808 (=> (not res!344541) (not e!318408))))

(assert (=> b!551808 (= res!344541 (and (= (size!17068 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17068 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17068 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551809 () Bool)

(declare-fun res!344549 () Bool)

(assert (=> b!551809 (=> (not res!344549) (not e!318409))))

(declare-datatypes ((List!10822 0))(
  ( (Nil!10819) (Cons!10818 (h!11800 (_ BitVec 64)) (t!17041 List!10822)) )
))
(declare-fun arrayNoDuplicates!0 (array!34783 (_ BitVec 32) List!10822) Bool)

(assert (=> b!551809 (= res!344549 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10819))))

(declare-fun b!551810 () Bool)

(assert (=> b!551810 (= e!318409 (not true))))

(declare-fun e!318410 () Bool)

(assert (=> b!551810 e!318410))

(declare-fun res!344548 () Bool)

(assert (=> b!551810 (=> (not res!344548) (not e!318410))))

(assert (=> b!551810 (= res!344548 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17058 0))(
  ( (Unit!17059) )
))
(declare-fun lt!250795 () Unit!17058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17058)

(assert (=> b!551810 (= lt!250795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551811 () Bool)

(assert (=> b!551811 (= e!318410 (= (seekEntryOrOpen!0 (select (arr!16703 a!3118) j!142) a!3118 mask!3119) (Found!5149 j!142)))))

(declare-fun b!551812 () Bool)

(declare-fun res!344540 () Bool)

(assert (=> b!551812 (=> (not res!344540) (not e!318408))))

(assert (=> b!551812 (= res!344540 (validKeyInArray!0 (select (arr!16703 a!3118) j!142)))))

(assert (= (and start!50492 res!344544) b!551808))

(assert (= (and b!551808 res!344541) b!551812))

(assert (= (and b!551812 res!344540) b!551803))

(assert (= (and b!551803 res!344545) b!551806))

(assert (= (and b!551806 res!344547) b!551804))

(assert (= (and b!551804 res!344543) b!551805))

(assert (= (and b!551805 res!344546) b!551809))

(assert (= (and b!551809 res!344549) b!551807))

(assert (= (and b!551807 res!344542) b!551810))

(assert (= (and b!551810 res!344548) b!551811))

(declare-fun m!528263 () Bool)

(assert (=> b!551805 m!528263))

(declare-fun m!528265 () Bool)

(assert (=> start!50492 m!528265))

(declare-fun m!528267 () Bool)

(assert (=> start!50492 m!528267))

(declare-fun m!528269 () Bool)

(assert (=> b!551807 m!528269))

(declare-fun m!528271 () Bool)

(assert (=> b!551807 m!528271))

(assert (=> b!551807 m!528269))

(declare-fun m!528273 () Bool)

(assert (=> b!551807 m!528273))

(declare-fun m!528275 () Bool)

(assert (=> b!551807 m!528275))

(assert (=> b!551807 m!528273))

(declare-fun m!528277 () Bool)

(assert (=> b!551807 m!528277))

(assert (=> b!551807 m!528271))

(assert (=> b!551807 m!528269))

(declare-fun m!528279 () Bool)

(assert (=> b!551807 m!528279))

(declare-fun m!528281 () Bool)

(assert (=> b!551807 m!528281))

(assert (=> b!551807 m!528273))

(assert (=> b!551807 m!528275))

(declare-fun m!528283 () Bool)

(assert (=> b!551803 m!528283))

(declare-fun m!528285 () Bool)

(assert (=> b!551810 m!528285))

(declare-fun m!528287 () Bool)

(assert (=> b!551810 m!528287))

(assert (=> b!551811 m!528269))

(assert (=> b!551811 m!528269))

(declare-fun m!528289 () Bool)

(assert (=> b!551811 m!528289))

(declare-fun m!528291 () Bool)

(assert (=> b!551804 m!528291))

(declare-fun m!528293 () Bool)

(assert (=> b!551809 m!528293))

(assert (=> b!551812 m!528269))

(assert (=> b!551812 m!528269))

(declare-fun m!528295 () Bool)

(assert (=> b!551812 m!528295))

(declare-fun m!528297 () Bool)

(assert (=> b!551806 m!528297))

(check-sat (not start!50492) (not b!551803) (not b!551805) (not b!551804) (not b!551809) (not b!551810) (not b!551806) (not b!551807) (not b!551811) (not b!551812))
(check-sat)
