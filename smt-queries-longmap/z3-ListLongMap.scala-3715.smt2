; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51088 () Bool)

(assert start!51088)

(declare-fun b!558322 () Bool)

(declare-fun res!350191 () Bool)

(declare-fun e!321636 () Bool)

(assert (=> b!558322 (=> (not res!350191) (not e!321636))))

(declare-datatypes ((array!35142 0))(
  ( (array!35143 (arr!16876 (Array (_ BitVec 32) (_ BitVec 64))) (size!17240 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35142)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558322 (= res!350191 (validKeyInArray!0 (select (arr!16876 a!3118) j!142)))))

(declare-fun b!558323 () Bool)

(declare-fun res!350195 () Bool)

(assert (=> b!558323 (=> (not res!350195) (not e!321636))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!558323 (= res!350195 (and (= (size!17240 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17240 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17240 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558324 () Bool)

(declare-fun res!350194 () Bool)

(assert (=> b!558324 (=> (not res!350194) (not e!321636))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558324 (= res!350194 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558325 () Bool)

(declare-fun e!321638 () Bool)

(declare-fun e!321637 () Bool)

(assert (=> b!558325 (= e!321638 e!321637)))

(declare-fun res!350190 () Bool)

(assert (=> b!558325 (=> res!350190 e!321637)))

(declare-datatypes ((SeekEntryResult!5325 0))(
  ( (MissingZero!5325 (index!23527 (_ BitVec 32))) (Found!5325 (index!23528 (_ BitVec 32))) (Intermediate!5325 (undefined!6137 Bool) (index!23529 (_ BitVec 32)) (x!52425 (_ BitVec 32))) (Undefined!5325) (MissingVacant!5325 (index!23530 (_ BitVec 32))) )
))
(declare-fun lt!253712 () SeekEntryResult!5325)

(get-info :version)

(assert (=> b!558325 (= res!350190 (or (undefined!6137 lt!253712) (not ((_ is Intermediate!5325) lt!253712)) (= (select (arr!16876 a!3118) (index!23529 lt!253712)) (select (arr!16876 a!3118) j!142)) (= (select (arr!16876 a!3118) (index!23529 lt!253712)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!253715 () SeekEntryResult!5325)

(declare-fun b!558326 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35142 (_ BitVec 32)) SeekEntryResult!5325)

(assert (=> b!558326 (= e!321637 (= lt!253715 (seekKeyOrZeroReturnVacant!0 (x!52425 lt!253712) (index!23529 lt!253712) (index!23529 lt!253712) (select (arr!16876 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558327 () Bool)

(declare-fun res!350192 () Bool)

(declare-fun e!321635 () Bool)

(assert (=> b!558327 (=> (not res!350192) (not e!321635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35142 (_ BitVec 32)) Bool)

(assert (=> b!558327 (= res!350192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!350185 () Bool)

(assert (=> start!51088 (=> (not res!350185) (not e!321636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51088 (= res!350185 (validMask!0 mask!3119))))

(assert (=> start!51088 e!321636))

(assert (=> start!51088 true))

(declare-fun array_inv!12672 (array!35142) Bool)

(assert (=> start!51088 (array_inv!12672 a!3118)))

(declare-fun b!558328 () Bool)

(declare-fun e!321634 () Bool)

(assert (=> b!558328 (= e!321635 e!321634)))

(declare-fun res!350186 () Bool)

(assert (=> b!558328 (=> (not res!350186) (not e!321634))))

(declare-fun lt!253716 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35142 (_ BitVec 32)) SeekEntryResult!5325)

(assert (=> b!558328 (= res!350186 (= lt!253712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253716 (select (store (arr!16876 a!3118) i!1132 k0!1914) j!142) (array!35143 (store (arr!16876 a!3118) i!1132 k0!1914) (size!17240 a!3118)) mask!3119)))))

(declare-fun lt!253713 () (_ BitVec 32))

(assert (=> b!558328 (= lt!253712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253713 (select (arr!16876 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558328 (= lt!253716 (toIndex!0 (select (store (arr!16876 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558328 (= lt!253713 (toIndex!0 (select (arr!16876 a!3118) j!142) mask!3119))))

(declare-fun b!558329 () Bool)

(declare-fun res!350193 () Bool)

(assert (=> b!558329 (=> (not res!350193) (not e!321636))))

(assert (=> b!558329 (= res!350193 (validKeyInArray!0 k0!1914))))

(declare-fun b!558330 () Bool)

(assert (=> b!558330 (= e!321634 (not true))))

(assert (=> b!558330 e!321638))

(declare-fun res!350188 () Bool)

(assert (=> b!558330 (=> (not res!350188) (not e!321638))))

(assert (=> b!558330 (= res!350188 (= lt!253715 (Found!5325 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35142 (_ BitVec 32)) SeekEntryResult!5325)

(assert (=> b!558330 (= lt!253715 (seekEntryOrOpen!0 (select (arr!16876 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558330 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17424 0))(
  ( (Unit!17425) )
))
(declare-fun lt!253717 () Unit!17424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17424)

(assert (=> b!558330 (= lt!253717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558331 () Bool)

(assert (=> b!558331 (= e!321636 e!321635)))

(declare-fun res!350189 () Bool)

(assert (=> b!558331 (=> (not res!350189) (not e!321635))))

(declare-fun lt!253714 () SeekEntryResult!5325)

(assert (=> b!558331 (= res!350189 (or (= lt!253714 (MissingZero!5325 i!1132)) (= lt!253714 (MissingVacant!5325 i!1132))))))

(assert (=> b!558331 (= lt!253714 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558332 () Bool)

(declare-fun res!350187 () Bool)

(assert (=> b!558332 (=> (not res!350187) (not e!321635))))

(declare-datatypes ((List!10956 0))(
  ( (Nil!10953) (Cons!10952 (h!11946 (_ BitVec 64)) (t!17184 List!10956)) )
))
(declare-fun arrayNoDuplicates!0 (array!35142 (_ BitVec 32) List!10956) Bool)

(assert (=> b!558332 (= res!350187 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10953))))

(assert (= (and start!51088 res!350185) b!558323))

(assert (= (and b!558323 res!350195) b!558322))

(assert (= (and b!558322 res!350191) b!558329))

(assert (= (and b!558329 res!350193) b!558324))

(assert (= (and b!558324 res!350194) b!558331))

(assert (= (and b!558331 res!350189) b!558327))

(assert (= (and b!558327 res!350192) b!558332))

(assert (= (and b!558332 res!350187) b!558328))

(assert (= (and b!558328 res!350186) b!558330))

(assert (= (and b!558330 res!350188) b!558325))

(assert (= (and b!558325 (not res!350190)) b!558326))

(declare-fun m!536275 () Bool)

(assert (=> b!558328 m!536275))

(declare-fun m!536277 () Bool)

(assert (=> b!558328 m!536277))

(assert (=> b!558328 m!536275))

(declare-fun m!536279 () Bool)

(assert (=> b!558328 m!536279))

(assert (=> b!558328 m!536279))

(declare-fun m!536281 () Bool)

(assert (=> b!558328 m!536281))

(declare-fun m!536283 () Bool)

(assert (=> b!558328 m!536283))

(assert (=> b!558328 m!536275))

(declare-fun m!536285 () Bool)

(assert (=> b!558328 m!536285))

(assert (=> b!558328 m!536279))

(declare-fun m!536287 () Bool)

(assert (=> b!558328 m!536287))

(declare-fun m!536289 () Bool)

(assert (=> b!558327 m!536289))

(declare-fun m!536291 () Bool)

(assert (=> b!558324 m!536291))

(assert (=> b!558326 m!536275))

(assert (=> b!558326 m!536275))

(declare-fun m!536293 () Bool)

(assert (=> b!558326 m!536293))

(assert (=> b!558330 m!536275))

(assert (=> b!558330 m!536275))

(declare-fun m!536295 () Bool)

(assert (=> b!558330 m!536295))

(declare-fun m!536297 () Bool)

(assert (=> b!558330 m!536297))

(declare-fun m!536299 () Bool)

(assert (=> b!558330 m!536299))

(declare-fun m!536301 () Bool)

(assert (=> b!558332 m!536301))

(declare-fun m!536303 () Bool)

(assert (=> b!558329 m!536303))

(assert (=> b!558322 m!536275))

(assert (=> b!558322 m!536275))

(declare-fun m!536305 () Bool)

(assert (=> b!558322 m!536305))

(declare-fun m!536307 () Bool)

(assert (=> start!51088 m!536307))

(declare-fun m!536309 () Bool)

(assert (=> start!51088 m!536309))

(declare-fun m!536311 () Bool)

(assert (=> b!558331 m!536311))

(declare-fun m!536313 () Bool)

(assert (=> b!558325 m!536313))

(assert (=> b!558325 m!536275))

(check-sat (not b!558324) (not b!558322) (not b!558329) (not b!558332) (not b!558331) (not b!558327) (not b!558326) (not b!558330) (not start!51088) (not b!558328))
(check-sat)
