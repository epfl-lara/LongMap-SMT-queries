; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50402 () Bool)

(assert start!50402)

(declare-fun b!551062 () Bool)

(declare-fun res!343982 () Bool)

(declare-fun e!318044 () Bool)

(assert (=> b!551062 (=> (not res!343982) (not e!318044))))

(declare-datatypes ((array!34750 0))(
  ( (array!34751 (arr!16688 (Array (_ BitVec 32) (_ BitVec 64))) (size!17053 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34750)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34750 (_ BitVec 32)) Bool)

(assert (=> b!551062 (= res!343982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551063 () Bool)

(declare-fun res!343985 () Bool)

(assert (=> b!551063 (=> (not res!343985) (not e!318044))))

(declare-datatypes ((List!10807 0))(
  ( (Nil!10804) (Cons!10803 (h!11782 (_ BitVec 64)) (t!17026 List!10807)) )
))
(declare-fun arrayNoDuplicates!0 (array!34750 (_ BitVec 32) List!10807) Bool)

(assert (=> b!551063 (= res!343985 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10804))))

(declare-fun b!551064 () Bool)

(declare-fun res!343984 () Bool)

(declare-fun e!318043 () Bool)

(assert (=> b!551064 (=> (not res!343984) (not e!318043))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551064 (= res!343984 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!551065 () Bool)

(declare-fun e!318045 () Bool)

(declare-datatypes ((SeekEntryResult!5134 0))(
  ( (MissingZero!5134 (index!22763 (_ BitVec 32))) (Found!5134 (index!22764 (_ BitVec 32))) (Intermediate!5134 (undefined!5946 Bool) (index!22765 (_ BitVec 32)) (x!51703 (_ BitVec 32))) (Undefined!5134) (MissingVacant!5134 (index!22766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34750 (_ BitVec 32)) SeekEntryResult!5134)

(assert (=> b!551065 (= e!318045 (= (seekEntryOrOpen!0 (select (arr!16688 a!3118) j!142) a!3118 mask!3119) (Found!5134 j!142)))))

(declare-fun res!343987 () Bool)

(assert (=> start!50402 (=> (not res!343987) (not e!318043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50402 (= res!343987 (validMask!0 mask!3119))))

(assert (=> start!50402 e!318043))

(assert (=> start!50402 true))

(declare-fun array_inv!12571 (array!34750) Bool)

(assert (=> start!50402 (array_inv!12571 a!3118)))

(declare-fun b!551066 () Bool)

(declare-fun res!343988 () Bool)

(assert (=> b!551066 (=> (not res!343988) (not e!318043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551066 (= res!343988 (validKeyInArray!0 (select (arr!16688 a!3118) j!142)))))

(declare-fun b!551067 () Bool)

(declare-fun res!343991 () Bool)

(assert (=> b!551067 (=> (not res!343991) (not e!318043))))

(assert (=> b!551067 (= res!343991 (validKeyInArray!0 k0!1914))))

(declare-fun b!551068 () Bool)

(declare-fun res!343989 () Bool)

(assert (=> b!551068 (=> (not res!343989) (not e!318043))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551068 (= res!343989 (and (= (size!17053 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17053 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17053 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551069 () Bool)

(declare-fun res!343986 () Bool)

(assert (=> b!551069 (=> (not res!343986) (not e!318044))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34750 (_ BitVec 32)) SeekEntryResult!5134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551069 (= res!343986 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16688 a!3118) j!142) mask!3119) (select (arr!16688 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16688 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16688 a!3118) i!1132 k0!1914) j!142) (array!34751 (store (arr!16688 a!3118) i!1132 k0!1914) (size!17053 a!3118)) mask!3119)))))

(declare-fun b!551070 () Bool)

(assert (=> b!551070 (= e!318043 e!318044)))

(declare-fun res!343983 () Bool)

(assert (=> b!551070 (=> (not res!343983) (not e!318044))))

(declare-fun lt!250575 () SeekEntryResult!5134)

(assert (=> b!551070 (= res!343983 (or (= lt!250575 (MissingZero!5134 i!1132)) (= lt!250575 (MissingVacant!5134 i!1132))))))

(assert (=> b!551070 (= lt!250575 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551071 () Bool)

(assert (=> b!551071 (= e!318044 (not true))))

(assert (=> b!551071 e!318045))

(declare-fun res!343990 () Bool)

(assert (=> b!551071 (=> (not res!343990) (not e!318045))))

(assert (=> b!551071 (= res!343990 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17028 0))(
  ( (Unit!17029) )
))
(declare-fun lt!250576 () Unit!17028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17028)

(assert (=> b!551071 (= lt!250576 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50402 res!343987) b!551068))

(assert (= (and b!551068 res!343989) b!551066))

(assert (= (and b!551066 res!343988) b!551067))

(assert (= (and b!551067 res!343991) b!551064))

(assert (= (and b!551064 res!343984) b!551070))

(assert (= (and b!551070 res!343983) b!551062))

(assert (= (and b!551062 res!343982) b!551063))

(assert (= (and b!551063 res!343985) b!551069))

(assert (= (and b!551069 res!343986) b!551071))

(assert (= (and b!551071 res!343990) b!551065))

(declare-fun m!527525 () Bool)

(assert (=> b!551067 m!527525))

(declare-fun m!527527 () Bool)

(assert (=> b!551064 m!527527))

(declare-fun m!527529 () Bool)

(assert (=> start!50402 m!527529))

(declare-fun m!527531 () Bool)

(assert (=> start!50402 m!527531))

(declare-fun m!527533 () Bool)

(assert (=> b!551069 m!527533))

(declare-fun m!527535 () Bool)

(assert (=> b!551069 m!527535))

(assert (=> b!551069 m!527533))

(declare-fun m!527537 () Bool)

(assert (=> b!551069 m!527537))

(declare-fun m!527539 () Bool)

(assert (=> b!551069 m!527539))

(assert (=> b!551069 m!527537))

(declare-fun m!527541 () Bool)

(assert (=> b!551069 m!527541))

(assert (=> b!551069 m!527535))

(assert (=> b!551069 m!527533))

(declare-fun m!527543 () Bool)

(assert (=> b!551069 m!527543))

(declare-fun m!527545 () Bool)

(assert (=> b!551069 m!527545))

(assert (=> b!551069 m!527537))

(assert (=> b!551069 m!527539))

(declare-fun m!527547 () Bool)

(assert (=> b!551063 m!527547))

(declare-fun m!527549 () Bool)

(assert (=> b!551071 m!527549))

(declare-fun m!527551 () Bool)

(assert (=> b!551071 m!527551))

(declare-fun m!527553 () Bool)

(assert (=> b!551062 m!527553))

(assert (=> b!551066 m!527533))

(assert (=> b!551066 m!527533))

(declare-fun m!527555 () Bool)

(assert (=> b!551066 m!527555))

(declare-fun m!527557 () Bool)

(assert (=> b!551070 m!527557))

(assert (=> b!551065 m!527533))

(assert (=> b!551065 m!527533))

(declare-fun m!527559 () Bool)

(assert (=> b!551065 m!527559))

(check-sat (not b!551062) (not b!551069) (not b!551064) (not b!551070) (not b!551063) (not b!551071) (not start!50402) (not b!551067) (not b!551065) (not b!551066))
(check-sat)
