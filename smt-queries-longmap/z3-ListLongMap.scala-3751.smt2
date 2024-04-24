; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51546 () Bool)

(assert start!51546)

(declare-fun b!563545 () Bool)

(declare-fun res!354601 () Bool)

(declare-fun e!324777 () Bool)

(assert (=> b!563545 (=> (not res!354601) (not e!324777))))

(declare-datatypes ((array!35358 0))(
  ( (array!35359 (arr!16978 (Array (_ BitVec 32) (_ BitVec 64))) (size!17342 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35358)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35358 (_ BitVec 32)) Bool)

(assert (=> b!563545 (= res!354601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563546 () Bool)

(declare-fun res!354597 () Bool)

(declare-fun e!324776 () Bool)

(assert (=> b!563546 (=> (not res!354597) (not e!324776))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563546 (= res!354597 (validKeyInArray!0 k0!1914))))

(declare-fun e!324780 () Bool)

(declare-fun lt!257302 () Bool)

(declare-fun b!563547 () Bool)

(declare-datatypes ((SeekEntryResult!5383 0))(
  ( (MissingZero!5383 (index!23759 (_ BitVec 32))) (Found!5383 (index!23760 (_ BitVec 32))) (Intermediate!5383 (undefined!6195 Bool) (index!23761 (_ BitVec 32)) (x!52801 (_ BitVec 32))) (Undefined!5383) (MissingVacant!5383 (index!23762 (_ BitVec 32))) )
))
(declare-fun lt!257297 () SeekEntryResult!5383)

(assert (=> b!563547 (= e!324780 (not (or (and (not lt!257302) (undefined!6195 lt!257297)) (and (not lt!257302) (not (undefined!6195 lt!257297))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(get-info :version)

(assert (=> b!563547 (= lt!257302 (not ((_ is Intermediate!5383) lt!257297)))))

(declare-fun e!324779 () Bool)

(assert (=> b!563547 e!324779))

(declare-fun res!354599 () Bool)

(assert (=> b!563547 (=> (not res!354599) (not e!324779))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563547 (= res!354599 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17611 0))(
  ( (Unit!17612) )
))
(declare-fun lt!257299 () Unit!17611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17611)

(assert (=> b!563547 (= lt!257299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563548 () Bool)

(declare-fun res!354598 () Bool)

(assert (=> b!563548 (=> (not res!354598) (not e!324776))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563548 (= res!354598 (and (= (size!17342 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17342 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17342 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!354592 () Bool)

(assert (=> start!51546 (=> (not res!354592) (not e!324776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51546 (= res!354592 (validMask!0 mask!3119))))

(assert (=> start!51546 e!324776))

(assert (=> start!51546 true))

(declare-fun array_inv!12837 (array!35358) Bool)

(assert (=> start!51546 (array_inv!12837 a!3118)))

(declare-fun b!563549 () Bool)

(declare-fun res!354593 () Bool)

(assert (=> b!563549 (=> (not res!354593) (not e!324776))))

(declare-fun arrayContainsKey!0 (array!35358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563549 (= res!354593 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563550 () Bool)

(assert (=> b!563550 (= e!324776 e!324777)))

(declare-fun res!354596 () Bool)

(assert (=> b!563550 (=> (not res!354596) (not e!324777))))

(declare-fun lt!257300 () SeekEntryResult!5383)

(assert (=> b!563550 (= res!354596 (or (= lt!257300 (MissingZero!5383 i!1132)) (= lt!257300 (MissingVacant!5383 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35358 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!563550 (= lt!257300 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563551 () Bool)

(assert (=> b!563551 (= e!324779 (= (seekEntryOrOpen!0 (select (arr!16978 a!3118) j!142) a!3118 mask!3119) (Found!5383 j!142)))))

(declare-fun b!563552 () Bool)

(assert (=> b!563552 (= e!324777 e!324780)))

(declare-fun res!354595 () Bool)

(assert (=> b!563552 (=> (not res!354595) (not e!324780))))

(declare-fun lt!257298 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35358 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!563552 (= res!354595 (= lt!257297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257298 (select (store (arr!16978 a!3118) i!1132 k0!1914) j!142) (array!35359 (store (arr!16978 a!3118) i!1132 k0!1914) (size!17342 a!3118)) mask!3119)))))

(declare-fun lt!257301 () (_ BitVec 32))

(assert (=> b!563552 (= lt!257297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257301 (select (arr!16978 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563552 (= lt!257298 (toIndex!0 (select (store (arr!16978 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563552 (= lt!257301 (toIndex!0 (select (arr!16978 a!3118) j!142) mask!3119))))

(declare-fun b!563553 () Bool)

(declare-fun res!354600 () Bool)

(assert (=> b!563553 (=> (not res!354600) (not e!324776))))

(assert (=> b!563553 (= res!354600 (validKeyInArray!0 (select (arr!16978 a!3118) j!142)))))

(declare-fun b!563554 () Bool)

(declare-fun res!354594 () Bool)

(assert (=> b!563554 (=> (not res!354594) (not e!324777))))

(declare-datatypes ((List!10965 0))(
  ( (Nil!10962) (Cons!10961 (h!11967 (_ BitVec 64)) (t!17185 List!10965)) )
))
(declare-fun arrayNoDuplicates!0 (array!35358 (_ BitVec 32) List!10965) Bool)

(assert (=> b!563554 (= res!354594 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10962))))

(assert (= (and start!51546 res!354592) b!563548))

(assert (= (and b!563548 res!354598) b!563553))

(assert (= (and b!563553 res!354600) b!563546))

(assert (= (and b!563546 res!354597) b!563549))

(assert (= (and b!563549 res!354593) b!563550))

(assert (= (and b!563550 res!354596) b!563545))

(assert (= (and b!563545 res!354601) b!563554))

(assert (= (and b!563554 res!354594) b!563552))

(assert (= (and b!563552 res!354595) b!563547))

(assert (= (and b!563547 res!354599) b!563551))

(declare-fun m!542009 () Bool)

(assert (=> b!563545 m!542009))

(declare-fun m!542011 () Bool)

(assert (=> b!563550 m!542011))

(declare-fun m!542013 () Bool)

(assert (=> b!563551 m!542013))

(assert (=> b!563551 m!542013))

(declare-fun m!542015 () Bool)

(assert (=> b!563551 m!542015))

(assert (=> b!563553 m!542013))

(assert (=> b!563553 m!542013))

(declare-fun m!542017 () Bool)

(assert (=> b!563553 m!542017))

(declare-fun m!542019 () Bool)

(assert (=> b!563549 m!542019))

(declare-fun m!542021 () Bool)

(assert (=> b!563554 m!542021))

(declare-fun m!542023 () Bool)

(assert (=> b!563547 m!542023))

(declare-fun m!542025 () Bool)

(assert (=> b!563547 m!542025))

(assert (=> b!563552 m!542013))

(declare-fun m!542027 () Bool)

(assert (=> b!563552 m!542027))

(assert (=> b!563552 m!542013))

(declare-fun m!542029 () Bool)

(assert (=> b!563552 m!542029))

(assert (=> b!563552 m!542029))

(declare-fun m!542031 () Bool)

(assert (=> b!563552 m!542031))

(declare-fun m!542033 () Bool)

(assert (=> b!563552 m!542033))

(assert (=> b!563552 m!542013))

(declare-fun m!542035 () Bool)

(assert (=> b!563552 m!542035))

(assert (=> b!563552 m!542029))

(declare-fun m!542037 () Bool)

(assert (=> b!563552 m!542037))

(declare-fun m!542039 () Bool)

(assert (=> start!51546 m!542039))

(declare-fun m!542041 () Bool)

(assert (=> start!51546 m!542041))

(declare-fun m!542043 () Bool)

(assert (=> b!563546 m!542043))

(check-sat (not b!563549) (not b!563550) (not b!563554) (not b!563552) (not b!563545) (not start!51546) (not b!563553) (not b!563546) (not b!563551) (not b!563547))
(check-sat)
