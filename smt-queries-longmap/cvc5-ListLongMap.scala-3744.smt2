; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51458 () Bool)

(assert start!51458)

(declare-fun b!562602 () Bool)

(declare-fun e!324229 () Bool)

(declare-fun e!324231 () Bool)

(assert (=> b!562602 (= e!324229 e!324231)))

(declare-fun res!353760 () Bool)

(assert (=> b!562602 (=> res!353760 e!324231)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256439 () (_ BitVec 64))

(declare-datatypes ((array!35323 0))(
  ( (array!35324 (arr!16962 (Array (_ BitVec 32) (_ BitVec 64))) (size!17326 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35323)

(assert (=> b!562602 (= res!353760 (or (= lt!256439 (select (arr!16962 a!3118) j!142)) (= lt!256439 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5411 0))(
  ( (MissingZero!5411 (index!23871 (_ BitVec 32))) (Found!5411 (index!23872 (_ BitVec 32))) (Intermediate!5411 (undefined!6223 Bool) (index!23873 (_ BitVec 32)) (x!52770 (_ BitVec 32))) (Undefined!5411) (MissingVacant!5411 (index!23874 (_ BitVec 32))) )
))
(declare-fun lt!256435 () SeekEntryResult!5411)

(assert (=> b!562602 (= lt!256439 (select (arr!16962 a!3118) (index!23873 lt!256435)))))

(declare-fun b!562603 () Bool)

(declare-fun e!324234 () Bool)

(declare-fun e!324233 () Bool)

(assert (=> b!562603 (= e!324234 e!324233)))

(declare-fun res!353763 () Bool)

(assert (=> b!562603 (=> (not res!353763) (not e!324233))))

(declare-fun lt!256441 () (_ BitVec 64))

(declare-fun lt!256431 () (_ BitVec 32))

(declare-fun lt!256438 () array!35323)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35323 (_ BitVec 32)) SeekEntryResult!5411)

(assert (=> b!562603 (= res!353763 (= lt!256435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256431 lt!256441 lt!256438 mask!3119)))))

(declare-fun lt!256436 () (_ BitVec 32))

(assert (=> b!562603 (= lt!256435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256436 (select (arr!16962 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562603 (= lt!256431 (toIndex!0 lt!256441 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562603 (= lt!256441 (select (store (arr!16962 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562603 (= lt!256436 (toIndex!0 (select (arr!16962 a!3118) j!142) mask!3119))))

(assert (=> b!562603 (= lt!256438 (array!35324 (store (arr!16962 a!3118) i!1132 k!1914) (size!17326 a!3118)))))

(declare-fun b!562604 () Bool)

(declare-fun e!324230 () Bool)

(assert (=> b!562604 (= e!324230 e!324234)))

(declare-fun res!353759 () Bool)

(assert (=> b!562604 (=> (not res!353759) (not e!324234))))

(declare-fun lt!256440 () SeekEntryResult!5411)

(assert (=> b!562604 (= res!353759 (or (= lt!256440 (MissingZero!5411 i!1132)) (= lt!256440 (MissingVacant!5411 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35323 (_ BitVec 32)) SeekEntryResult!5411)

(assert (=> b!562604 (= lt!256440 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562605 () Bool)

(declare-fun e!324232 () Bool)

(assert (=> b!562605 (= e!324231 e!324232)))

(declare-fun res!353754 () Bool)

(assert (=> b!562605 (=> res!353754 e!324232)))

(declare-fun lt!256430 () SeekEntryResult!5411)

(declare-fun lt!256432 () SeekEntryResult!5411)

(assert (=> b!562605 (= res!353754 (or (bvslt (index!23873 lt!256435) #b00000000000000000000000000000000) (bvsge (index!23873 lt!256435) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52770 lt!256435) #b01111111111111111111111111111110) (bvslt (x!52770 lt!256435) #b00000000000000000000000000000000) (not (= lt!256439 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16962 a!3118) i!1132 k!1914) (index!23873 lt!256435)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256430 lt!256432))))))

(declare-fun lt!256428 () SeekEntryResult!5411)

(declare-fun lt!256433 () SeekEntryResult!5411)

(assert (=> b!562605 (= lt!256428 lt!256433)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35323 (_ BitVec 32)) SeekEntryResult!5411)

(assert (=> b!562605 (= lt!256433 (seekKeyOrZeroReturnVacant!0 (x!52770 lt!256435) (index!23873 lt!256435) (index!23873 lt!256435) lt!256441 lt!256438 mask!3119))))

(assert (=> b!562605 (= lt!256428 (seekEntryOrOpen!0 lt!256441 lt!256438 mask!3119))))

(declare-fun lt!256437 () SeekEntryResult!5411)

(assert (=> b!562605 (= lt!256437 lt!256430)))

(assert (=> b!562605 (= lt!256430 (seekKeyOrZeroReturnVacant!0 (x!52770 lt!256435) (index!23873 lt!256435) (index!23873 lt!256435) (select (arr!16962 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562606 () Bool)

(assert (=> b!562606 (= e!324233 (not e!324229))))

(declare-fun res!353761 () Bool)

(assert (=> b!562606 (=> res!353761 e!324229)))

(assert (=> b!562606 (= res!353761 (or (undefined!6223 lt!256435) (not (is-Intermediate!5411 lt!256435))))))

(assert (=> b!562606 (= lt!256437 lt!256432)))

(assert (=> b!562606 (= lt!256432 (Found!5411 j!142))))

(assert (=> b!562606 (= lt!256437 (seekEntryOrOpen!0 (select (arr!16962 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35323 (_ BitVec 32)) Bool)

(assert (=> b!562606 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17596 0))(
  ( (Unit!17597) )
))
(declare-fun lt!256434 () Unit!17596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17596)

(assert (=> b!562606 (= lt!256434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562607 () Bool)

(assert (=> b!562607 (= e!324232 true)))

(assert (=> b!562607 (= lt!256430 lt!256433)))

(declare-fun lt!256429 () Unit!17596)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17596)

(assert (=> b!562607 (= lt!256429 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52770 lt!256435) (index!23873 lt!256435) (index!23873 lt!256435) mask!3119))))

(declare-fun b!562609 () Bool)

(declare-fun res!353756 () Bool)

(assert (=> b!562609 (=> (not res!353756) (not e!324234))))

(declare-datatypes ((List!11042 0))(
  ( (Nil!11039) (Cons!11038 (h!12041 (_ BitVec 64)) (t!17270 List!11042)) )
))
(declare-fun arrayNoDuplicates!0 (array!35323 (_ BitVec 32) List!11042) Bool)

(assert (=> b!562609 (= res!353756 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11039))))

(declare-fun b!562610 () Bool)

(declare-fun res!353764 () Bool)

(assert (=> b!562610 (=> (not res!353764) (not e!324234))))

(assert (=> b!562610 (= res!353764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562611 () Bool)

(declare-fun res!353762 () Bool)

(assert (=> b!562611 (=> (not res!353762) (not e!324230))))

(declare-fun arrayContainsKey!0 (array!35323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562611 (= res!353762 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562612 () Bool)

(declare-fun res!353765 () Bool)

(assert (=> b!562612 (=> (not res!353765) (not e!324230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562612 (= res!353765 (validKeyInArray!0 (select (arr!16962 a!3118) j!142)))))

(declare-fun b!562613 () Bool)

(declare-fun res!353758 () Bool)

(assert (=> b!562613 (=> (not res!353758) (not e!324230))))

(assert (=> b!562613 (= res!353758 (and (= (size!17326 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17326 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17326 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!353757 () Bool)

(assert (=> start!51458 (=> (not res!353757) (not e!324230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51458 (= res!353757 (validMask!0 mask!3119))))

(assert (=> start!51458 e!324230))

(assert (=> start!51458 true))

(declare-fun array_inv!12758 (array!35323) Bool)

(assert (=> start!51458 (array_inv!12758 a!3118)))

(declare-fun b!562608 () Bool)

(declare-fun res!353755 () Bool)

(assert (=> b!562608 (=> (not res!353755) (not e!324230))))

(assert (=> b!562608 (= res!353755 (validKeyInArray!0 k!1914))))

(assert (= (and start!51458 res!353757) b!562613))

(assert (= (and b!562613 res!353758) b!562612))

(assert (= (and b!562612 res!353765) b!562608))

(assert (= (and b!562608 res!353755) b!562611))

(assert (= (and b!562611 res!353762) b!562604))

(assert (= (and b!562604 res!353759) b!562610))

(assert (= (and b!562610 res!353764) b!562609))

(assert (= (and b!562609 res!353756) b!562603))

(assert (= (and b!562603 res!353763) b!562606))

(assert (= (and b!562606 (not res!353761)) b!562602))

(assert (= (and b!562602 (not res!353760)) b!562605))

(assert (= (and b!562605 (not res!353754)) b!562607))

(declare-fun m!540693 () Bool)

(assert (=> b!562610 m!540693))

(declare-fun m!540695 () Bool)

(assert (=> start!51458 m!540695))

(declare-fun m!540697 () Bool)

(assert (=> start!51458 m!540697))

(declare-fun m!540699 () Bool)

(assert (=> b!562602 m!540699))

(declare-fun m!540701 () Bool)

(assert (=> b!562602 m!540701))

(declare-fun m!540703 () Bool)

(assert (=> b!562609 m!540703))

(declare-fun m!540705 () Bool)

(assert (=> b!562605 m!540705))

(assert (=> b!562605 m!540699))

(declare-fun m!540707 () Bool)

(assert (=> b!562605 m!540707))

(assert (=> b!562605 m!540699))

(declare-fun m!540709 () Bool)

(assert (=> b!562605 m!540709))

(declare-fun m!540711 () Bool)

(assert (=> b!562605 m!540711))

(declare-fun m!540713 () Bool)

(assert (=> b!562605 m!540713))

(assert (=> b!562606 m!540699))

(assert (=> b!562606 m!540699))

(declare-fun m!540715 () Bool)

(assert (=> b!562606 m!540715))

(declare-fun m!540717 () Bool)

(assert (=> b!562606 m!540717))

(declare-fun m!540719 () Bool)

(assert (=> b!562606 m!540719))

(assert (=> b!562603 m!540699))

(declare-fun m!540721 () Bool)

(assert (=> b!562603 m!540721))

(assert (=> b!562603 m!540699))

(declare-fun m!540723 () Bool)

(assert (=> b!562603 m!540723))

(assert (=> b!562603 m!540699))

(declare-fun m!540725 () Bool)

(assert (=> b!562603 m!540725))

(declare-fun m!540727 () Bool)

(assert (=> b!562603 m!540727))

(declare-fun m!540729 () Bool)

(assert (=> b!562603 m!540729))

(assert (=> b!562603 m!540713))

(declare-fun m!540731 () Bool)

(assert (=> b!562608 m!540731))

(declare-fun m!540733 () Bool)

(assert (=> b!562611 m!540733))

(declare-fun m!540735 () Bool)

(assert (=> b!562604 m!540735))

(assert (=> b!562612 m!540699))

(assert (=> b!562612 m!540699))

(declare-fun m!540737 () Bool)

(assert (=> b!562612 m!540737))

(declare-fun m!540739 () Bool)

(assert (=> b!562607 m!540739))

(push 1)

