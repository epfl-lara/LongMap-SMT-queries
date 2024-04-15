; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50486 () Bool)

(assert start!50486)

(declare-fun b!551713 () Bool)

(declare-fun res!344450 () Bool)

(declare-fun e!318373 () Bool)

(assert (=> b!551713 (=> (not res!344450) (not e!318373))))

(declare-datatypes ((array!34777 0))(
  ( (array!34778 (arr!16700 (Array (_ BitVec 32) (_ BitVec 64))) (size!17065 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34777)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551713 (= res!344450 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551714 () Bool)

(declare-fun e!318372 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!551714 (= e!318372 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318374 () Bool)

(assert (=> b!551714 e!318374))

(declare-fun res!344453 () Bool)

(assert (=> b!551714 (=> (not res!344453) (not e!318374))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34777 (_ BitVec 32)) Bool)

(assert (=> b!551714 (= res!344453 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17052 0))(
  ( (Unit!17053) )
))
(declare-fun lt!250777 () Unit!17052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17052)

(assert (=> b!551714 (= lt!250777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551715 () Bool)

(declare-fun res!344458 () Bool)

(assert (=> b!551715 (=> (not res!344458) (not e!318372))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5146 0))(
  ( (MissingZero!5146 (index!22811 (_ BitVec 32))) (Found!5146 (index!22812 (_ BitVec 32))) (Intermediate!5146 (undefined!5958 Bool) (index!22813 (_ BitVec 32)) (x!51753 (_ BitVec 32))) (Undefined!5146) (MissingVacant!5146 (index!22814 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34777 (_ BitVec 32)) SeekEntryResult!5146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551715 (= res!344458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16700 a!3118) j!142) mask!3119) (select (arr!16700 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16700 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16700 a!3118) i!1132 k0!1914) j!142) (array!34778 (store (arr!16700 a!3118) i!1132 k0!1914) (size!17065 a!3118)) mask!3119)))))

(declare-fun b!551716 () Bool)

(declare-fun res!344451 () Bool)

(assert (=> b!551716 (=> (not res!344451) (not e!318372))))

(declare-datatypes ((List!10819 0))(
  ( (Nil!10816) (Cons!10815 (h!11797 (_ BitVec 64)) (t!17038 List!10819)) )
))
(declare-fun arrayNoDuplicates!0 (array!34777 (_ BitVec 32) List!10819) Bool)

(assert (=> b!551716 (= res!344451 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10816))))

(declare-fun res!344459 () Bool)

(assert (=> start!50486 (=> (not res!344459) (not e!318373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50486 (= res!344459 (validMask!0 mask!3119))))

(assert (=> start!50486 e!318373))

(assert (=> start!50486 true))

(declare-fun array_inv!12583 (array!34777) Bool)

(assert (=> start!50486 (array_inv!12583 a!3118)))

(declare-fun b!551717 () Bool)

(declare-fun res!344457 () Bool)

(assert (=> b!551717 (=> (not res!344457) (not e!318372))))

(assert (=> b!551717 (= res!344457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551718 () Bool)

(declare-fun res!344452 () Bool)

(assert (=> b!551718 (=> (not res!344452) (not e!318373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551718 (= res!344452 (validKeyInArray!0 k0!1914))))

(declare-fun b!551719 () Bool)

(declare-fun res!344455 () Bool)

(assert (=> b!551719 (=> (not res!344455) (not e!318373))))

(assert (=> b!551719 (= res!344455 (validKeyInArray!0 (select (arr!16700 a!3118) j!142)))))

(declare-fun b!551720 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34777 (_ BitVec 32)) SeekEntryResult!5146)

(assert (=> b!551720 (= e!318374 (= (seekEntryOrOpen!0 (select (arr!16700 a!3118) j!142) a!3118 mask!3119) (Found!5146 j!142)))))

(declare-fun b!551721 () Bool)

(assert (=> b!551721 (= e!318373 e!318372)))

(declare-fun res!344456 () Bool)

(assert (=> b!551721 (=> (not res!344456) (not e!318372))))

(declare-fun lt!250776 () SeekEntryResult!5146)

(assert (=> b!551721 (= res!344456 (or (= lt!250776 (MissingZero!5146 i!1132)) (= lt!250776 (MissingVacant!5146 i!1132))))))

(assert (=> b!551721 (= lt!250776 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551722 () Bool)

(declare-fun res!344454 () Bool)

(assert (=> b!551722 (=> (not res!344454) (not e!318373))))

(assert (=> b!551722 (= res!344454 (and (= (size!17065 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17065 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17065 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50486 res!344459) b!551722))

(assert (= (and b!551722 res!344454) b!551719))

(assert (= (and b!551719 res!344455) b!551718))

(assert (= (and b!551718 res!344452) b!551713))

(assert (= (and b!551713 res!344450) b!551721))

(assert (= (and b!551721 res!344456) b!551717))

(assert (= (and b!551717 res!344457) b!551716))

(assert (= (and b!551716 res!344451) b!551715))

(assert (= (and b!551715 res!344458) b!551714))

(assert (= (and b!551714 res!344453) b!551720))

(declare-fun m!528155 () Bool)

(assert (=> b!551720 m!528155))

(assert (=> b!551720 m!528155))

(declare-fun m!528157 () Bool)

(assert (=> b!551720 m!528157))

(declare-fun m!528159 () Bool)

(assert (=> b!551718 m!528159))

(declare-fun m!528161 () Bool)

(assert (=> b!551717 m!528161))

(assert (=> b!551719 m!528155))

(assert (=> b!551719 m!528155))

(declare-fun m!528163 () Bool)

(assert (=> b!551719 m!528163))

(declare-fun m!528165 () Bool)

(assert (=> b!551713 m!528165))

(assert (=> b!551715 m!528155))

(declare-fun m!528167 () Bool)

(assert (=> b!551715 m!528167))

(assert (=> b!551715 m!528155))

(declare-fun m!528169 () Bool)

(assert (=> b!551715 m!528169))

(declare-fun m!528171 () Bool)

(assert (=> b!551715 m!528171))

(assert (=> b!551715 m!528169))

(declare-fun m!528173 () Bool)

(assert (=> b!551715 m!528173))

(assert (=> b!551715 m!528167))

(assert (=> b!551715 m!528155))

(declare-fun m!528175 () Bool)

(assert (=> b!551715 m!528175))

(declare-fun m!528177 () Bool)

(assert (=> b!551715 m!528177))

(assert (=> b!551715 m!528169))

(assert (=> b!551715 m!528171))

(declare-fun m!528179 () Bool)

(assert (=> start!50486 m!528179))

(declare-fun m!528181 () Bool)

(assert (=> start!50486 m!528181))

(declare-fun m!528183 () Bool)

(assert (=> b!551721 m!528183))

(declare-fun m!528185 () Bool)

(assert (=> b!551714 m!528185))

(declare-fun m!528187 () Bool)

(assert (=> b!551714 m!528187))

(declare-fun m!528189 () Bool)

(assert (=> b!551716 m!528189))

(check-sat (not b!551713) (not b!551720) (not b!551717) (not b!551718) (not b!551714) (not b!551719) (not start!50486) (not b!551715) (not b!551721) (not b!551716))
(check-sat)
