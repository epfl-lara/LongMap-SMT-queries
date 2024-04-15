; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50786 () Bool)

(assert start!50786)

(declare-fun b!555494 () Bool)

(declare-fun res!348049 () Bool)

(declare-fun e!320108 () Bool)

(assert (=> b!555494 (=> (not res!348049) (not e!320108))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555494 (= res!348049 (validKeyInArray!0 k0!1914))))

(declare-fun b!555495 () Bool)

(declare-fun res!348051 () Bool)

(declare-fun e!320109 () Bool)

(assert (=> b!555495 (=> (not res!348051) (not e!320109))))

(declare-datatypes ((array!35020 0))(
  ( (array!35021 (arr!16820 (Array (_ BitVec 32) (_ BitVec 64))) (size!17185 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35020)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35020 (_ BitVec 32)) Bool)

(assert (=> b!555495 (= res!348051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555496 () Bool)

(declare-fun e!320106 () Bool)

(assert (=> b!555496 (= e!320109 e!320106)))

(declare-fun res!348050 () Bool)

(assert (=> b!555496 (=> (not res!348050) (not e!320106))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5266 0))(
  ( (MissingZero!5266 (index!23291 (_ BitVec 32))) (Found!5266 (index!23292 (_ BitVec 32))) (Intermediate!5266 (undefined!6078 Bool) (index!23293 (_ BitVec 32)) (x!52199 (_ BitVec 32))) (Undefined!5266) (MissingVacant!5266 (index!23294 (_ BitVec 32))) )
))
(declare-fun lt!252401 () SeekEntryResult!5266)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!252402 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35020 (_ BitVec 32)) SeekEntryResult!5266)

(assert (=> b!555496 (= res!348050 (= lt!252401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252402 (select (store (arr!16820 a!3118) i!1132 k0!1914) j!142) (array!35021 (store (arr!16820 a!3118) i!1132 k0!1914) (size!17185 a!3118)) mask!3119)))))

(declare-fun lt!252399 () (_ BitVec 32))

(assert (=> b!555496 (= lt!252401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252399 (select (arr!16820 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555496 (= lt!252402 (toIndex!0 (select (store (arr!16820 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555496 (= lt!252399 (toIndex!0 (select (arr!16820 a!3118) j!142) mask!3119))))

(declare-fun b!555497 () Bool)

(assert (=> b!555497 (= e!320108 e!320109)))

(declare-fun res!348053 () Bool)

(assert (=> b!555497 (=> (not res!348053) (not e!320109))))

(declare-fun lt!252400 () SeekEntryResult!5266)

(assert (=> b!555497 (= res!348053 (or (= lt!252400 (MissingZero!5266 i!1132)) (= lt!252400 (MissingVacant!5266 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35020 (_ BitVec 32)) SeekEntryResult!5266)

(assert (=> b!555497 (= lt!252400 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555498 () Bool)

(declare-fun res!348052 () Bool)

(assert (=> b!555498 (=> (not res!348052) (not e!320108))))

(declare-fun arrayContainsKey!0 (array!35020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555498 (= res!348052 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555499 () Bool)

(declare-fun res!348056 () Bool)

(assert (=> b!555499 (=> (not res!348056) (not e!320108))))

(assert (=> b!555499 (= res!348056 (and (= (size!17185 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17185 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17185 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555500 () Bool)

(declare-fun res!348048 () Bool)

(assert (=> b!555500 (=> (not res!348048) (not e!320109))))

(declare-datatypes ((List!10939 0))(
  ( (Nil!10936) (Cons!10935 (h!11920 (_ BitVec 64)) (t!17158 List!10939)) )
))
(declare-fun arrayNoDuplicates!0 (array!35020 (_ BitVec 32) List!10939) Bool)

(assert (=> b!555500 (= res!348048 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10936))))

(declare-fun b!555501 () Bool)

(assert (=> b!555501 (= e!320106 (not true))))

(declare-fun lt!252398 () SeekEntryResult!5266)

(get-info :version)

(assert (=> b!555501 (and (= lt!252398 (Found!5266 j!142)) (or (undefined!6078 lt!252401) (not ((_ is Intermediate!5266) lt!252401)) (= (select (arr!16820 a!3118) (index!23293 lt!252401)) (select (arr!16820 a!3118) j!142)) (not (= (select (arr!16820 a!3118) (index!23293 lt!252401)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252398 (MissingZero!5266 (index!23293 lt!252401)))))))

(assert (=> b!555501 (= lt!252398 (seekEntryOrOpen!0 (select (arr!16820 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555501 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17292 0))(
  ( (Unit!17293) )
))
(declare-fun lt!252403 () Unit!17292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17292)

(assert (=> b!555501 (= lt!252403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!348054 () Bool)

(assert (=> start!50786 (=> (not res!348054) (not e!320108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50786 (= res!348054 (validMask!0 mask!3119))))

(assert (=> start!50786 e!320108))

(assert (=> start!50786 true))

(declare-fun array_inv!12703 (array!35020) Bool)

(assert (=> start!50786 (array_inv!12703 a!3118)))

(declare-fun b!555502 () Bool)

(declare-fun res!348055 () Bool)

(assert (=> b!555502 (=> (not res!348055) (not e!320108))))

(assert (=> b!555502 (= res!348055 (validKeyInArray!0 (select (arr!16820 a!3118) j!142)))))

(assert (= (and start!50786 res!348054) b!555499))

(assert (= (and b!555499 res!348056) b!555502))

(assert (= (and b!555502 res!348055) b!555494))

(assert (= (and b!555494 res!348049) b!555498))

(assert (= (and b!555498 res!348052) b!555497))

(assert (= (and b!555497 res!348053) b!555495))

(assert (= (and b!555495 res!348051) b!555500))

(assert (= (and b!555500 res!348048) b!555496))

(assert (= (and b!555496 res!348050) b!555501))

(declare-fun m!532811 () Bool)

(assert (=> b!555494 m!532811))

(declare-fun m!532813 () Bool)

(assert (=> b!555497 m!532813))

(declare-fun m!532815 () Bool)

(assert (=> b!555498 m!532815))

(declare-fun m!532817 () Bool)

(assert (=> b!555500 m!532817))

(declare-fun m!532819 () Bool)

(assert (=> b!555495 m!532819))

(declare-fun m!532821 () Bool)

(assert (=> b!555501 m!532821))

(declare-fun m!532823 () Bool)

(assert (=> b!555501 m!532823))

(declare-fun m!532825 () Bool)

(assert (=> b!555501 m!532825))

(declare-fun m!532827 () Bool)

(assert (=> b!555501 m!532827))

(assert (=> b!555501 m!532821))

(declare-fun m!532829 () Bool)

(assert (=> b!555501 m!532829))

(assert (=> b!555502 m!532821))

(assert (=> b!555502 m!532821))

(declare-fun m!532831 () Bool)

(assert (=> b!555502 m!532831))

(declare-fun m!532833 () Bool)

(assert (=> b!555496 m!532833))

(declare-fun m!532835 () Bool)

(assert (=> b!555496 m!532835))

(assert (=> b!555496 m!532821))

(declare-fun m!532837 () Bool)

(assert (=> b!555496 m!532837))

(assert (=> b!555496 m!532821))

(declare-fun m!532839 () Bool)

(assert (=> b!555496 m!532839))

(assert (=> b!555496 m!532821))

(assert (=> b!555496 m!532833))

(declare-fun m!532841 () Bool)

(assert (=> b!555496 m!532841))

(assert (=> b!555496 m!532833))

(declare-fun m!532843 () Bool)

(assert (=> b!555496 m!532843))

(declare-fun m!532845 () Bool)

(assert (=> start!50786 m!532845))

(declare-fun m!532847 () Bool)

(assert (=> start!50786 m!532847))

(check-sat (not b!555497) (not b!555498) (not b!555496) (not start!50786) (not b!555495) (not b!555494) (not b!555501) (not b!555500) (not b!555502))
(check-sat)
