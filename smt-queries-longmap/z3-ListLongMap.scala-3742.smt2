; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51492 () Bool)

(assert start!51492)

(declare-fun b!562586 () Bool)

(declare-fun res!353641 () Bool)

(declare-fun e!324237 () Bool)

(assert (=> b!562586 (=> (not res!353641) (not e!324237))))

(declare-datatypes ((array!35304 0))(
  ( (array!35305 (arr!16951 (Array (_ BitVec 32) (_ BitVec 64))) (size!17315 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35304)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562586 (= res!353641 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562587 () Bool)

(declare-fun res!353643 () Bool)

(assert (=> b!562587 (=> (not res!353643) (not e!324237))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562587 (= res!353643 (and (= (size!17315 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17315 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17315 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562588 () Bool)

(declare-fun e!324234 () Bool)

(assert (=> b!562588 (= e!324234 true)))

(declare-datatypes ((SeekEntryResult!5356 0))(
  ( (MissingZero!5356 (index!23651 (_ BitVec 32))) (Found!5356 (index!23652 (_ BitVec 32))) (Intermediate!5356 (undefined!6168 Bool) (index!23653 (_ BitVec 32)) (x!52702 (_ BitVec 32))) (Undefined!5356) (MissingVacant!5356 (index!23654 (_ BitVec 32))) )
))
(declare-fun lt!256291 () SeekEntryResult!5356)

(declare-fun lt!256287 () SeekEntryResult!5356)

(assert (=> b!562588 (= lt!256291 lt!256287)))

(declare-datatypes ((Unit!17557 0))(
  ( (Unit!17558) )
))
(declare-fun lt!256290 () Unit!17557)

(declare-fun lt!256296 () SeekEntryResult!5356)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35304 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17557)

(assert (=> b!562588 (= lt!256290 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52702 lt!256296) (index!23653 lt!256296) (index!23653 lt!256296) mask!3119))))

(declare-fun res!353635 () Bool)

(assert (=> start!51492 (=> (not res!353635) (not e!324237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51492 (= res!353635 (validMask!0 mask!3119))))

(assert (=> start!51492 e!324237))

(assert (=> start!51492 true))

(declare-fun array_inv!12810 (array!35304) Bool)

(assert (=> start!51492 (array_inv!12810 a!3118)))

(declare-fun b!562589 () Bool)

(declare-fun res!353640 () Bool)

(assert (=> b!562589 (=> (not res!353640) (not e!324237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562589 (= res!353640 (validKeyInArray!0 k0!1914))))

(declare-fun b!562590 () Bool)

(declare-fun e!324231 () Bool)

(assert (=> b!562590 (= e!324237 e!324231)))

(declare-fun res!353642 () Bool)

(assert (=> b!562590 (=> (not res!353642) (not e!324231))))

(declare-fun lt!256300 () SeekEntryResult!5356)

(assert (=> b!562590 (= res!353642 (or (= lt!256300 (MissingZero!5356 i!1132)) (= lt!256300 (MissingVacant!5356 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35304 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!562590 (= lt!256300 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562591 () Bool)

(declare-fun e!324235 () Bool)

(declare-fun e!324233 () Bool)

(assert (=> b!562591 (= e!324235 e!324233)))

(declare-fun res!353644 () Bool)

(assert (=> b!562591 (=> res!353644 e!324233)))

(declare-fun lt!256289 () (_ BitVec 64))

(assert (=> b!562591 (= res!353644 (or (= lt!256289 (select (arr!16951 a!3118) j!142)) (= lt!256289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562591 (= lt!256289 (select (arr!16951 a!3118) (index!23653 lt!256296)))))

(declare-fun b!562592 () Bool)

(assert (=> b!562592 (= e!324233 e!324234)))

(declare-fun res!353634 () Bool)

(assert (=> b!562592 (=> res!353634 e!324234)))

(declare-fun lt!256298 () SeekEntryResult!5356)

(assert (=> b!562592 (= res!353634 (or (bvslt (index!23653 lt!256296) #b00000000000000000000000000000000) (bvsge (index!23653 lt!256296) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52702 lt!256296) #b01111111111111111111111111111110) (bvslt (x!52702 lt!256296) #b00000000000000000000000000000000) (not (= lt!256289 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16951 a!3118) i!1132 k0!1914) (index!23653 lt!256296)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256291 lt!256298))))))

(declare-fun lt!256293 () SeekEntryResult!5356)

(assert (=> b!562592 (= lt!256293 lt!256287)))

(declare-fun lt!256288 () (_ BitVec 64))

(declare-fun lt!256297 () array!35304)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35304 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!562592 (= lt!256287 (seekKeyOrZeroReturnVacant!0 (x!52702 lt!256296) (index!23653 lt!256296) (index!23653 lt!256296) lt!256288 lt!256297 mask!3119))))

(assert (=> b!562592 (= lt!256293 (seekEntryOrOpen!0 lt!256288 lt!256297 mask!3119))))

(declare-fun lt!256295 () SeekEntryResult!5356)

(assert (=> b!562592 (= lt!256295 lt!256291)))

(assert (=> b!562592 (= lt!256291 (seekKeyOrZeroReturnVacant!0 (x!52702 lt!256296) (index!23653 lt!256296) (index!23653 lt!256296) (select (arr!16951 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562593 () Bool)

(declare-fun e!324232 () Bool)

(assert (=> b!562593 (= e!324232 (not e!324235))))

(declare-fun res!353639 () Bool)

(assert (=> b!562593 (=> res!353639 e!324235)))

(get-info :version)

(assert (=> b!562593 (= res!353639 (or (undefined!6168 lt!256296) (not ((_ is Intermediate!5356) lt!256296))))))

(assert (=> b!562593 (= lt!256295 lt!256298)))

(assert (=> b!562593 (= lt!256298 (Found!5356 j!142))))

(assert (=> b!562593 (= lt!256295 (seekEntryOrOpen!0 (select (arr!16951 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35304 (_ BitVec 32)) Bool)

(assert (=> b!562593 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256299 () Unit!17557)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17557)

(assert (=> b!562593 (= lt!256299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562594 () Bool)

(declare-fun res!353638 () Bool)

(assert (=> b!562594 (=> (not res!353638) (not e!324231))))

(assert (=> b!562594 (= res!353638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562595 () Bool)

(declare-fun res!353637 () Bool)

(assert (=> b!562595 (=> (not res!353637) (not e!324231))))

(declare-datatypes ((List!10938 0))(
  ( (Nil!10935) (Cons!10934 (h!11940 (_ BitVec 64)) (t!17158 List!10938)) )
))
(declare-fun arrayNoDuplicates!0 (array!35304 (_ BitVec 32) List!10938) Bool)

(assert (=> b!562595 (= res!353637 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10935))))

(declare-fun b!562596 () Bool)

(declare-fun res!353636 () Bool)

(assert (=> b!562596 (=> (not res!353636) (not e!324237))))

(assert (=> b!562596 (= res!353636 (validKeyInArray!0 (select (arr!16951 a!3118) j!142)))))

(declare-fun b!562597 () Bool)

(assert (=> b!562597 (= e!324231 e!324232)))

(declare-fun res!353633 () Bool)

(assert (=> b!562597 (=> (not res!353633) (not e!324232))))

(declare-fun lt!256292 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35304 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!562597 (= res!353633 (= lt!256296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256292 lt!256288 lt!256297 mask!3119)))))

(declare-fun lt!256294 () (_ BitVec 32))

(assert (=> b!562597 (= lt!256296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256294 (select (arr!16951 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562597 (= lt!256292 (toIndex!0 lt!256288 mask!3119))))

(assert (=> b!562597 (= lt!256288 (select (store (arr!16951 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562597 (= lt!256294 (toIndex!0 (select (arr!16951 a!3118) j!142) mask!3119))))

(assert (=> b!562597 (= lt!256297 (array!35305 (store (arr!16951 a!3118) i!1132 k0!1914) (size!17315 a!3118)))))

(assert (= (and start!51492 res!353635) b!562587))

(assert (= (and b!562587 res!353643) b!562596))

(assert (= (and b!562596 res!353636) b!562589))

(assert (= (and b!562589 res!353640) b!562586))

(assert (= (and b!562586 res!353641) b!562590))

(assert (= (and b!562590 res!353642) b!562594))

(assert (= (and b!562594 res!353638) b!562595))

(assert (= (and b!562595 res!353637) b!562597))

(assert (= (and b!562597 res!353633) b!562593))

(assert (= (and b!562593 (not res!353639)) b!562591))

(assert (= (and b!562591 (not res!353644)) b!562592))

(assert (= (and b!562592 (not res!353634)) b!562588))

(declare-fun m!540743 () Bool)

(assert (=> b!562597 m!540743))

(declare-fun m!540745 () Bool)

(assert (=> b!562597 m!540745))

(assert (=> b!562597 m!540743))

(declare-fun m!540747 () Bool)

(assert (=> b!562597 m!540747))

(declare-fun m!540749 () Bool)

(assert (=> b!562597 m!540749))

(declare-fun m!540751 () Bool)

(assert (=> b!562597 m!540751))

(declare-fun m!540753 () Bool)

(assert (=> b!562597 m!540753))

(assert (=> b!562597 m!540743))

(declare-fun m!540755 () Bool)

(assert (=> b!562597 m!540755))

(assert (=> b!562592 m!540743))

(declare-fun m!540757 () Bool)

(assert (=> b!562592 m!540757))

(assert (=> b!562592 m!540751))

(declare-fun m!540759 () Bool)

(assert (=> b!562592 m!540759))

(assert (=> b!562592 m!540743))

(declare-fun m!540761 () Bool)

(assert (=> b!562592 m!540761))

(declare-fun m!540763 () Bool)

(assert (=> b!562592 m!540763))

(declare-fun m!540765 () Bool)

(assert (=> b!562595 m!540765))

(declare-fun m!540767 () Bool)

(assert (=> b!562588 m!540767))

(assert (=> b!562591 m!540743))

(declare-fun m!540769 () Bool)

(assert (=> b!562591 m!540769))

(assert (=> b!562596 m!540743))

(assert (=> b!562596 m!540743))

(declare-fun m!540771 () Bool)

(assert (=> b!562596 m!540771))

(assert (=> b!562593 m!540743))

(assert (=> b!562593 m!540743))

(declare-fun m!540773 () Bool)

(assert (=> b!562593 m!540773))

(declare-fun m!540775 () Bool)

(assert (=> b!562593 m!540775))

(declare-fun m!540777 () Bool)

(assert (=> b!562593 m!540777))

(declare-fun m!540779 () Bool)

(assert (=> start!51492 m!540779))

(declare-fun m!540781 () Bool)

(assert (=> start!51492 m!540781))

(declare-fun m!540783 () Bool)

(assert (=> b!562594 m!540783))

(declare-fun m!540785 () Bool)

(assert (=> b!562586 m!540785))

(declare-fun m!540787 () Bool)

(assert (=> b!562590 m!540787))

(declare-fun m!540789 () Bool)

(assert (=> b!562589 m!540789))

(check-sat (not b!562594) (not b!562592) (not b!562586) (not b!562588) (not b!562596) (not b!562593) (not b!562589) (not b!562595) (not b!562597) (not start!51492) (not b!562590))
(check-sat)
