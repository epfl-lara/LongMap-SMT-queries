; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51340 () Bool)

(assert start!51340)

(declare-fun b!560321 () Bool)

(declare-fun res!351473 () Bool)

(declare-fun e!322837 () Bool)

(assert (=> b!560321 (=> (not res!351473) (not e!322837))))

(declare-datatypes ((array!35205 0))(
  ( (array!35206 (arr!16903 (Array (_ BitVec 32) (_ BitVec 64))) (size!17267 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35205)

(declare-datatypes ((List!10983 0))(
  ( (Nil!10980) (Cons!10979 (h!11982 (_ BitVec 64)) (t!17211 List!10983)) )
))
(declare-fun arrayNoDuplicates!0 (array!35205 (_ BitVec 32) List!10983) Bool)

(assert (=> b!560321 (= res!351473 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10980))))

(declare-fun b!560322 () Bool)

(declare-fun e!322832 () Bool)

(assert (=> b!560322 (= e!322837 e!322832)))

(declare-fun res!351475 () Bool)

(assert (=> b!560322 (=> (not res!351475) (not e!322832))))

(declare-fun lt!254742 () array!35205)

(declare-datatypes ((SeekEntryResult!5352 0))(
  ( (MissingZero!5352 (index!23635 (_ BitVec 32))) (Found!5352 (index!23636 (_ BitVec 32))) (Intermediate!5352 (undefined!6164 Bool) (index!23637 (_ BitVec 32)) (x!52551 (_ BitVec 32))) (Undefined!5352) (MissingVacant!5352 (index!23638 (_ BitVec 32))) )
))
(declare-fun lt!254735 () SeekEntryResult!5352)

(declare-fun lt!254739 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!254738 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35205 (_ BitVec 32)) SeekEntryResult!5352)

(assert (=> b!560322 (= res!351475 (= lt!254735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254739 lt!254738 lt!254742 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254743 () (_ BitVec 32))

(assert (=> b!560322 (= lt!254735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254743 (select (arr!16903 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560322 (= lt!254739 (toIndex!0 lt!254738 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560322 (= lt!254738 (select (store (arr!16903 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560322 (= lt!254743 (toIndex!0 (select (arr!16903 a!3118) j!142) mask!3119))))

(assert (=> b!560322 (= lt!254742 (array!35206 (store (arr!16903 a!3118) i!1132 k0!1914) (size!17267 a!3118)))))

(declare-fun b!560323 () Bool)

(declare-fun e!322835 () Bool)

(assert (=> b!560323 (= e!322835 e!322837)))

(declare-fun res!351476 () Bool)

(assert (=> b!560323 (=> (not res!351476) (not e!322837))))

(declare-fun lt!254741 () SeekEntryResult!5352)

(assert (=> b!560323 (= res!351476 (or (= lt!254741 (MissingZero!5352 i!1132)) (= lt!254741 (MissingVacant!5352 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35205 (_ BitVec 32)) SeekEntryResult!5352)

(assert (=> b!560323 (= lt!254741 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560324 () Bool)

(declare-fun res!351479 () Bool)

(assert (=> b!560324 (=> (not res!351479) (not e!322835))))

(declare-fun arrayContainsKey!0 (array!35205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560324 (= res!351479 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560325 () Bool)

(declare-fun e!322839 () Bool)

(declare-fun e!322834 () Bool)

(assert (=> b!560325 (= e!322839 e!322834)))

(declare-fun res!351482 () Bool)

(assert (=> b!560325 (=> (not res!351482) (not e!322834))))

(declare-fun lt!254736 () SeekEntryResult!5352)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35205 (_ BitVec 32)) SeekEntryResult!5352)

(assert (=> b!560325 (= res!351482 (= lt!254736 (seekKeyOrZeroReturnVacant!0 (x!52551 lt!254735) (index!23637 lt!254735) (index!23637 lt!254735) (select (arr!16903 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560327 () Bool)

(assert (=> b!560327 (= e!322832 (not true))))

(declare-fun e!322838 () Bool)

(assert (=> b!560327 e!322838))

(declare-fun res!351483 () Bool)

(assert (=> b!560327 (=> (not res!351483) (not e!322838))))

(assert (=> b!560327 (= res!351483 (= lt!254736 (Found!5352 j!142)))))

(assert (=> b!560327 (= lt!254736 (seekEntryOrOpen!0 (select (arr!16903 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35205 (_ BitVec 32)) Bool)

(assert (=> b!560327 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17478 0))(
  ( (Unit!17479) )
))
(declare-fun lt!254740 () Unit!17478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17478)

(assert (=> b!560327 (= lt!254740 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560328 () Bool)

(assert (=> b!560328 (= e!322834 (= (seekEntryOrOpen!0 lt!254738 lt!254742 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52551 lt!254735) (index!23637 lt!254735) (index!23637 lt!254735) lt!254738 lt!254742 mask!3119)))))

(declare-fun b!560329 () Bool)

(declare-fun e!322836 () Bool)

(assert (=> b!560329 (= e!322838 e!322836)))

(declare-fun res!351485 () Bool)

(assert (=> b!560329 (=> res!351485 e!322836)))

(get-info :version)

(assert (=> b!560329 (= res!351485 (or (undefined!6164 lt!254735) (not ((_ is Intermediate!5352) lt!254735))))))

(declare-fun b!560330 () Bool)

(declare-fun res!351478 () Bool)

(assert (=> b!560330 (=> (not res!351478) (not e!322835))))

(assert (=> b!560330 (= res!351478 (and (= (size!17267 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17267 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17267 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560331 () Bool)

(declare-fun res!351484 () Bool)

(assert (=> b!560331 (=> (not res!351484) (not e!322835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560331 (= res!351484 (validKeyInArray!0 (select (arr!16903 a!3118) j!142)))))

(declare-fun res!351477 () Bool)

(assert (=> start!51340 (=> (not res!351477) (not e!322835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51340 (= res!351477 (validMask!0 mask!3119))))

(assert (=> start!51340 e!322835))

(assert (=> start!51340 true))

(declare-fun array_inv!12699 (array!35205) Bool)

(assert (=> start!51340 (array_inv!12699 a!3118)))

(declare-fun b!560326 () Bool)

(assert (=> b!560326 (= e!322836 e!322839)))

(declare-fun res!351474 () Bool)

(assert (=> b!560326 (=> res!351474 e!322839)))

(declare-fun lt!254737 () (_ BitVec 64))

(assert (=> b!560326 (= res!351474 (or (= lt!254737 (select (arr!16903 a!3118) j!142)) (= lt!254737 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560326 (= lt!254737 (select (arr!16903 a!3118) (index!23637 lt!254735)))))

(declare-fun b!560332 () Bool)

(declare-fun res!351480 () Bool)

(assert (=> b!560332 (=> (not res!351480) (not e!322837))))

(assert (=> b!560332 (= res!351480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560333 () Bool)

(declare-fun res!351481 () Bool)

(assert (=> b!560333 (=> (not res!351481) (not e!322835))))

(assert (=> b!560333 (= res!351481 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51340 res!351477) b!560330))

(assert (= (and b!560330 res!351478) b!560331))

(assert (= (and b!560331 res!351484) b!560333))

(assert (= (and b!560333 res!351481) b!560324))

(assert (= (and b!560324 res!351479) b!560323))

(assert (= (and b!560323 res!351476) b!560332))

(assert (= (and b!560332 res!351480) b!560321))

(assert (= (and b!560321 res!351473) b!560322))

(assert (= (and b!560322 res!351475) b!560327))

(assert (= (and b!560327 res!351483) b!560329))

(assert (= (and b!560329 (not res!351485)) b!560326))

(assert (= (and b!560326 (not res!351474)) b!560325))

(assert (= (and b!560325 res!351482) b!560328))

(declare-fun m!538073 () Bool)

(assert (=> b!560328 m!538073))

(declare-fun m!538075 () Bool)

(assert (=> b!560328 m!538075))

(declare-fun m!538077 () Bool)

(assert (=> b!560322 m!538077))

(declare-fun m!538079 () Bool)

(assert (=> b!560322 m!538079))

(assert (=> b!560322 m!538077))

(declare-fun m!538081 () Bool)

(assert (=> b!560322 m!538081))

(declare-fun m!538083 () Bool)

(assert (=> b!560322 m!538083))

(assert (=> b!560322 m!538077))

(declare-fun m!538085 () Bool)

(assert (=> b!560322 m!538085))

(declare-fun m!538087 () Bool)

(assert (=> b!560322 m!538087))

(declare-fun m!538089 () Bool)

(assert (=> b!560322 m!538089))

(declare-fun m!538091 () Bool)

(assert (=> b!560333 m!538091))

(declare-fun m!538093 () Bool)

(assert (=> start!51340 m!538093))

(declare-fun m!538095 () Bool)

(assert (=> start!51340 m!538095))

(declare-fun m!538097 () Bool)

(assert (=> b!560321 m!538097))

(assert (=> b!560331 m!538077))

(assert (=> b!560331 m!538077))

(declare-fun m!538099 () Bool)

(assert (=> b!560331 m!538099))

(assert (=> b!560327 m!538077))

(assert (=> b!560327 m!538077))

(declare-fun m!538101 () Bool)

(assert (=> b!560327 m!538101))

(declare-fun m!538103 () Bool)

(assert (=> b!560327 m!538103))

(declare-fun m!538105 () Bool)

(assert (=> b!560327 m!538105))

(declare-fun m!538107 () Bool)

(assert (=> b!560324 m!538107))

(assert (=> b!560326 m!538077))

(declare-fun m!538109 () Bool)

(assert (=> b!560326 m!538109))

(declare-fun m!538111 () Bool)

(assert (=> b!560323 m!538111))

(assert (=> b!560325 m!538077))

(assert (=> b!560325 m!538077))

(declare-fun m!538113 () Bool)

(assert (=> b!560325 m!538113))

(declare-fun m!538115 () Bool)

(assert (=> b!560332 m!538115))

(check-sat (not start!51340) (not b!560322) (not b!560325) (not b!560332) (not b!560328) (not b!560323) (not b!560333) (not b!560321) (not b!560331) (not b!560327) (not b!560324))
(check-sat)
