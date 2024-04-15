; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51314 () Bool)

(assert start!51314)

(declare-fun res!351076 () Bool)

(declare-fun e!322491 () Bool)

(assert (=> start!51314 (=> (not res!351076) (not e!322491))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51314 (= res!351076 (validMask!0 mask!3119))))

(assert (=> start!51314 e!322491))

(assert (=> start!51314 true))

(declare-datatypes ((array!35188 0))(
  ( (array!35189 (arr!16895 (Array (_ BitVec 32) (_ BitVec 64))) (size!17260 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35188)

(declare-fun array_inv!12778 (array!35188) Bool)

(assert (=> start!51314 (array_inv!12778 a!3118)))

(declare-fun b!559770 () Bool)

(declare-fun e!322487 () Bool)

(assert (=> b!559770 (= e!322491 e!322487)))

(declare-fun res!351067 () Bool)

(assert (=> b!559770 (=> (not res!351067) (not e!322487))))

(declare-datatypes ((SeekEntryResult!5341 0))(
  ( (MissingZero!5341 (index!23591 (_ BitVec 32))) (Found!5341 (index!23592 (_ BitVec 32))) (Intermediate!5341 (undefined!6153 Bool) (index!23593 (_ BitVec 32)) (x!52519 (_ BitVec 32))) (Undefined!5341) (MissingVacant!5341 (index!23594 (_ BitVec 32))) )
))
(declare-fun lt!254313 () SeekEntryResult!5341)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559770 (= res!351067 (or (= lt!254313 (MissingZero!5341 i!1132)) (= lt!254313 (MissingVacant!5341 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35188 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!559770 (= lt!254313 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!559771 () Bool)

(declare-fun e!322486 () Bool)

(declare-fun e!322490 () Bool)

(assert (=> b!559771 (= e!322486 (not e!322490))))

(declare-fun res!351074 () Bool)

(assert (=> b!559771 (=> res!351074 e!322490)))

(declare-fun lt!254312 () SeekEntryResult!5341)

(get-info :version)

(assert (=> b!559771 (= res!351074 (or (undefined!6153 lt!254312) (not ((_ is Intermediate!5341) lt!254312))))))

(declare-fun e!322484 () Bool)

(assert (=> b!559771 e!322484))

(declare-fun res!351075 () Bool)

(assert (=> b!559771 (=> (not res!351075) (not e!322484))))

(declare-fun lt!254314 () SeekEntryResult!5341)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!559771 (= res!351075 (= lt!254314 (Found!5341 j!142)))))

(assert (=> b!559771 (= lt!254314 (seekEntryOrOpen!0 (select (arr!16895 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35188 (_ BitVec 32)) Bool)

(assert (=> b!559771 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17442 0))(
  ( (Unit!17443) )
))
(declare-fun lt!254318 () Unit!17442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17442)

(assert (=> b!559771 (= lt!254318 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559772 () Bool)

(declare-fun e!322489 () Bool)

(assert (=> b!559772 (= e!322490 e!322489)))

(declare-fun res!351072 () Bool)

(assert (=> b!559772 (=> res!351072 e!322489)))

(declare-fun lt!254316 () (_ BitVec 64))

(assert (=> b!559772 (= res!351072 (or (= lt!254316 (select (arr!16895 a!3118) j!142)) (= lt!254316 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23593 lt!254312) #b00000000000000000000000000000000) (bvsge (index!23593 lt!254312) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52519 lt!254312) #b01111111111111111111111111111110) (bvslt (x!52519 lt!254312) #b00000000000000000000000000000000) (not (= (select (store (arr!16895 a!3118) i!1132 k0!1914) (index!23593 lt!254312)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559772 (= lt!254316 (select (arr!16895 a!3118) (index!23593 lt!254312)))))

(declare-fun b!559773 () Bool)

(declare-fun e!322488 () Bool)

(declare-fun e!322485 () Bool)

(assert (=> b!559773 (= e!322488 e!322485)))

(declare-fun res!351065 () Bool)

(assert (=> b!559773 (=> res!351065 e!322485)))

(declare-fun lt!254317 () (_ BitVec 64))

(assert (=> b!559773 (= res!351065 (or (= lt!254317 (select (arr!16895 a!3118) j!142)) (= lt!254317 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559773 (= lt!254317 (select (arr!16895 a!3118) (index!23593 lt!254312)))))

(declare-fun b!559774 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35188 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!559774 (= e!322485 (= lt!254314 (seekKeyOrZeroReturnVacant!0 (x!52519 lt!254312) (index!23593 lt!254312) (index!23593 lt!254312) (select (arr!16895 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559775 () Bool)

(declare-fun res!351068 () Bool)

(assert (=> b!559775 (=> (not res!351068) (not e!322491))))

(declare-fun arrayContainsKey!0 (array!35188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559775 (= res!351068 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559776 () Bool)

(declare-fun res!351066 () Bool)

(assert (=> b!559776 (=> (not res!351066) (not e!322491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559776 (= res!351066 (validKeyInArray!0 (select (arr!16895 a!3118) j!142)))))

(declare-fun b!559777 () Bool)

(declare-fun res!351070 () Bool)

(assert (=> b!559777 (=> (not res!351070) (not e!322487))))

(declare-datatypes ((List!11014 0))(
  ( (Nil!11011) (Cons!11010 (h!12013 (_ BitVec 64)) (t!17233 List!11014)) )
))
(declare-fun arrayNoDuplicates!0 (array!35188 (_ BitVec 32) List!11014) Bool)

(assert (=> b!559777 (= res!351070 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11011))))

(declare-fun b!559778 () Bool)

(declare-fun res!351069 () Bool)

(assert (=> b!559778 (=> (not res!351069) (not e!322487))))

(assert (=> b!559778 (= res!351069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559779 () Bool)

(declare-fun res!351073 () Bool)

(assert (=> b!559779 (=> (not res!351073) (not e!322491))))

(assert (=> b!559779 (= res!351073 (validKeyInArray!0 k0!1914))))

(declare-fun b!559780 () Bool)

(declare-fun res!351077 () Bool)

(assert (=> b!559780 (=> (not res!351077) (not e!322491))))

(assert (=> b!559780 (= res!351077 (and (= (size!17260 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17260 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17260 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559781 () Bool)

(declare-fun lt!254315 () (_ BitVec 64))

(assert (=> b!559781 (= e!322489 (validKeyInArray!0 lt!254315))))

(declare-fun b!559782 () Bool)

(assert (=> b!559782 (= e!322487 e!322486)))

(declare-fun res!351071 () Bool)

(assert (=> b!559782 (=> (not res!351071) (not e!322486))))

(declare-fun lt!254319 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35188 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!559782 (= res!351071 (= lt!254312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254319 lt!254315 (array!35189 (store (arr!16895 a!3118) i!1132 k0!1914) (size!17260 a!3118)) mask!3119)))))

(declare-fun lt!254320 () (_ BitVec 32))

(assert (=> b!559782 (= lt!254312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254320 (select (arr!16895 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559782 (= lt!254319 (toIndex!0 lt!254315 mask!3119))))

(assert (=> b!559782 (= lt!254315 (select (store (arr!16895 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!559782 (= lt!254320 (toIndex!0 (select (arr!16895 a!3118) j!142) mask!3119))))

(declare-fun b!559783 () Bool)

(assert (=> b!559783 (= e!322484 e!322488)))

(declare-fun res!351064 () Bool)

(assert (=> b!559783 (=> res!351064 e!322488)))

(assert (=> b!559783 (= res!351064 (or (undefined!6153 lt!254312) (not ((_ is Intermediate!5341) lt!254312))))))

(assert (= (and start!51314 res!351076) b!559780))

(assert (= (and b!559780 res!351077) b!559776))

(assert (= (and b!559776 res!351066) b!559779))

(assert (= (and b!559779 res!351073) b!559775))

(assert (= (and b!559775 res!351068) b!559770))

(assert (= (and b!559770 res!351067) b!559778))

(assert (= (and b!559778 res!351069) b!559777))

(assert (= (and b!559777 res!351070) b!559782))

(assert (= (and b!559782 res!351071) b!559771))

(assert (= (and b!559771 res!351075) b!559783))

(assert (= (and b!559783 (not res!351064)) b!559773))

(assert (= (and b!559773 (not res!351065)) b!559774))

(assert (= (and b!559771 (not res!351074)) b!559772))

(assert (= (and b!559772 (not res!351072)) b!559781))

(declare-fun m!536993 () Bool)

(assert (=> b!559772 m!536993))

(declare-fun m!536995 () Bool)

(assert (=> b!559772 m!536995))

(declare-fun m!536997 () Bool)

(assert (=> b!559772 m!536997))

(declare-fun m!536999 () Bool)

(assert (=> b!559772 m!536999))

(assert (=> b!559771 m!536993))

(assert (=> b!559771 m!536993))

(declare-fun m!537001 () Bool)

(assert (=> b!559771 m!537001))

(declare-fun m!537003 () Bool)

(assert (=> b!559771 m!537003))

(declare-fun m!537005 () Bool)

(assert (=> b!559771 m!537005))

(declare-fun m!537007 () Bool)

(assert (=> start!51314 m!537007))

(declare-fun m!537009 () Bool)

(assert (=> start!51314 m!537009))

(assert (=> b!559773 m!536993))

(assert (=> b!559773 m!536999))

(assert (=> b!559782 m!536993))

(declare-fun m!537011 () Bool)

(assert (=> b!559782 m!537011))

(assert (=> b!559782 m!536993))

(declare-fun m!537013 () Bool)

(assert (=> b!559782 m!537013))

(assert (=> b!559782 m!536993))

(declare-fun m!537015 () Bool)

(assert (=> b!559782 m!537015))

(declare-fun m!537017 () Bool)

(assert (=> b!559782 m!537017))

(assert (=> b!559782 m!536995))

(declare-fun m!537019 () Bool)

(assert (=> b!559782 m!537019))

(declare-fun m!537021 () Bool)

(assert (=> b!559781 m!537021))

(declare-fun m!537023 () Bool)

(assert (=> b!559777 m!537023))

(declare-fun m!537025 () Bool)

(assert (=> b!559779 m!537025))

(assert (=> b!559774 m!536993))

(assert (=> b!559774 m!536993))

(declare-fun m!537027 () Bool)

(assert (=> b!559774 m!537027))

(declare-fun m!537029 () Bool)

(assert (=> b!559770 m!537029))

(declare-fun m!537031 () Bool)

(assert (=> b!559775 m!537031))

(declare-fun m!537033 () Bool)

(assert (=> b!559778 m!537033))

(assert (=> b!559776 m!536993))

(assert (=> b!559776 m!536993))

(declare-fun m!537035 () Bool)

(assert (=> b!559776 m!537035))

(check-sat (not b!559781) (not b!559774) (not b!559777) (not b!559778) (not b!559775) (not b!559770) (not b!559771) (not b!559779) (not b!559776) (not start!51314) (not b!559782))
(check-sat)
