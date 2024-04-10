; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52168 () Bool)

(assert start!52168)

(declare-fun b!569427 () Bool)

(declare-fun res!359453 () Bool)

(declare-fun e!327574 () Bool)

(assert (=> b!569427 (=> (not res!359453) (not e!327574))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35691 0))(
  ( (array!35692 (arr!17137 (Array (_ BitVec 32) (_ BitVec 64))) (size!17501 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35691)

(assert (=> b!569427 (= res!359453 (and (= (size!17501 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17501 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17501 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569429 () Bool)

(declare-fun res!359449 () Bool)

(assert (=> b!569429 (=> (not res!359449) (not e!327574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569429 (= res!359449 (validKeyInArray!0 (select (arr!17137 a!3118) j!142)))))

(declare-fun b!569430 () Bool)

(declare-fun res!359452 () Bool)

(declare-fun e!327573 () Bool)

(assert (=> b!569430 (=> (not res!359452) (not e!327573))))

(declare-datatypes ((List!11217 0))(
  ( (Nil!11214) (Cons!11213 (h!12234 (_ BitVec 64)) (t!17445 List!11217)) )
))
(declare-fun arrayNoDuplicates!0 (array!35691 (_ BitVec 32) List!11217) Bool)

(assert (=> b!569430 (= res!359452 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11214))))

(declare-fun b!569431 () Bool)

(declare-fun e!327576 () Bool)

(assert (=> b!569431 (= e!327573 e!327576)))

(declare-fun res!359448 () Bool)

(assert (=> b!569431 (=> (not res!359448) (not e!327576))))

(declare-fun lt!259538 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5586 0))(
  ( (MissingZero!5586 (index!24571 (_ BitVec 32))) (Found!5586 (index!24572 (_ BitVec 32))) (Intermediate!5586 (undefined!6398 Bool) (index!24573 (_ BitVec 32)) (x!53445 (_ BitVec 32))) (Undefined!5586) (MissingVacant!5586 (index!24574 (_ BitVec 32))) )
))
(declare-fun lt!259535 () SeekEntryResult!5586)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35691 (_ BitVec 32)) SeekEntryResult!5586)

(assert (=> b!569431 (= res!359448 (= lt!259535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259538 (select (store (arr!17137 a!3118) i!1132 k0!1914) j!142) (array!35692 (store (arr!17137 a!3118) i!1132 k0!1914) (size!17501 a!3118)) mask!3119)))))

(declare-fun lt!259539 () (_ BitVec 32))

(assert (=> b!569431 (= lt!259535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259539 (select (arr!17137 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569431 (= lt!259538 (toIndex!0 (select (store (arr!17137 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569431 (= lt!259539 (toIndex!0 (select (arr!17137 a!3118) j!142) mask!3119))))

(declare-fun b!569432 () Bool)

(declare-fun res!359450 () Bool)

(assert (=> b!569432 (=> (not res!359450) (not e!327573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35691 (_ BitVec 32)) Bool)

(assert (=> b!569432 (= res!359450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569433 () Bool)

(assert (=> b!569433 (= e!327574 e!327573)))

(declare-fun res!359451 () Bool)

(assert (=> b!569433 (=> (not res!359451) (not e!327573))))

(declare-fun lt!259537 () SeekEntryResult!5586)

(assert (=> b!569433 (= res!359451 (or (= lt!259537 (MissingZero!5586 i!1132)) (= lt!259537 (MissingVacant!5586 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35691 (_ BitVec 32)) SeekEntryResult!5586)

(assert (=> b!569433 (= lt!259537 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569434 () Bool)

(declare-fun res!359445 () Bool)

(assert (=> b!569434 (=> (not res!359445) (not e!327574))))

(assert (=> b!569434 (= res!359445 (validKeyInArray!0 k0!1914))))

(declare-fun b!569435 () Bool)

(assert (=> b!569435 (= e!327576 (not true))))

(declare-fun lt!259540 () SeekEntryResult!5586)

(get-info :version)

(assert (=> b!569435 (and (= lt!259540 (Found!5586 j!142)) (or (undefined!6398 lt!259535) (not ((_ is Intermediate!5586) lt!259535)) (= (select (arr!17137 a!3118) (index!24573 lt!259535)) (select (arr!17137 a!3118) j!142)) (not (= (select (arr!17137 a!3118) (index!24573 lt!259535)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259540 (MissingZero!5586 (index!24573 lt!259535)))))))

(assert (=> b!569435 (= lt!259540 (seekEntryOrOpen!0 (select (arr!17137 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569435 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17874 0))(
  ( (Unit!17875) )
))
(declare-fun lt!259536 () Unit!17874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17874)

(assert (=> b!569435 (= lt!259536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359447 () Bool)

(assert (=> start!52168 (=> (not res!359447) (not e!327574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52168 (= res!359447 (validMask!0 mask!3119))))

(assert (=> start!52168 e!327574))

(assert (=> start!52168 true))

(declare-fun array_inv!12933 (array!35691) Bool)

(assert (=> start!52168 (array_inv!12933 a!3118)))

(declare-fun b!569428 () Bool)

(declare-fun res!359446 () Bool)

(assert (=> b!569428 (=> (not res!359446) (not e!327574))))

(declare-fun arrayContainsKey!0 (array!35691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569428 (= res!359446 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52168 res!359447) b!569427))

(assert (= (and b!569427 res!359453) b!569429))

(assert (= (and b!569429 res!359449) b!569434))

(assert (= (and b!569434 res!359445) b!569428))

(assert (= (and b!569428 res!359446) b!569433))

(assert (= (and b!569433 res!359451) b!569432))

(assert (= (and b!569432 res!359450) b!569430))

(assert (= (and b!569430 res!359452) b!569431))

(assert (= (and b!569431 res!359448) b!569435))

(declare-fun m!548153 () Bool)

(assert (=> b!569434 m!548153))

(declare-fun m!548155 () Bool)

(assert (=> b!569428 m!548155))

(declare-fun m!548157 () Bool)

(assert (=> b!569432 m!548157))

(declare-fun m!548159 () Bool)

(assert (=> b!569433 m!548159))

(declare-fun m!548161 () Bool)

(assert (=> b!569429 m!548161))

(assert (=> b!569429 m!548161))

(declare-fun m!548163 () Bool)

(assert (=> b!569429 m!548163))

(declare-fun m!548165 () Bool)

(assert (=> b!569430 m!548165))

(declare-fun m!548167 () Bool)

(assert (=> start!52168 m!548167))

(declare-fun m!548169 () Bool)

(assert (=> start!52168 m!548169))

(assert (=> b!569431 m!548161))

(declare-fun m!548171 () Bool)

(assert (=> b!569431 m!548171))

(assert (=> b!569431 m!548161))

(declare-fun m!548173 () Bool)

(assert (=> b!569431 m!548173))

(assert (=> b!569431 m!548161))

(declare-fun m!548175 () Bool)

(assert (=> b!569431 m!548175))

(assert (=> b!569431 m!548175))

(declare-fun m!548177 () Bool)

(assert (=> b!569431 m!548177))

(declare-fun m!548179 () Bool)

(assert (=> b!569431 m!548179))

(assert (=> b!569431 m!548175))

(declare-fun m!548181 () Bool)

(assert (=> b!569431 m!548181))

(assert (=> b!569435 m!548161))

(declare-fun m!548183 () Bool)

(assert (=> b!569435 m!548183))

(declare-fun m!548185 () Bool)

(assert (=> b!569435 m!548185))

(declare-fun m!548187 () Bool)

(assert (=> b!569435 m!548187))

(assert (=> b!569435 m!548161))

(declare-fun m!548189 () Bool)

(assert (=> b!569435 m!548189))

(check-sat (not b!569429) (not b!569430) (not b!569434) (not b!569428) (not start!52168) (not b!569435) (not b!569432) (not b!569431) (not b!569433))
(check-sat)
