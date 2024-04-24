; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51120 () Bool)

(assert start!51120)

(declare-fun b!558282 () Bool)

(declare-fun res!350045 () Bool)

(declare-fun e!321630 () Bool)

(assert (=> b!558282 (=> (not res!350045) (not e!321630))))

(declare-datatypes ((array!35121 0))(
  ( (array!35122 (arr!16864 (Array (_ BitVec 32) (_ BitVec 64))) (size!17228 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35121)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35121 (_ BitVec 32)) Bool)

(assert (=> b!558282 (= res!350045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558283 () Bool)

(declare-fun e!321632 () Bool)

(assert (=> b!558283 (= e!321630 e!321632)))

(declare-fun res!350048 () Bool)

(assert (=> b!558283 (=> (not res!350048) (not e!321632))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253701 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5269 0))(
  ( (MissingZero!5269 (index!23303 (_ BitVec 32))) (Found!5269 (index!23304 (_ BitVec 32))) (Intermediate!5269 (undefined!6081 Bool) (index!23305 (_ BitVec 32)) (x!52356 (_ BitVec 32))) (Undefined!5269) (MissingVacant!5269 (index!23306 (_ BitVec 32))) )
))
(declare-fun lt!253699 () SeekEntryResult!5269)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35121 (_ BitVec 32)) SeekEntryResult!5269)

(assert (=> b!558283 (= res!350048 (= lt!253699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253701 (select (store (arr!16864 a!3118) i!1132 k0!1914) j!142) (array!35122 (store (arr!16864 a!3118) i!1132 k0!1914) (size!17228 a!3118)) mask!3119)))))

(declare-fun lt!253700 () (_ BitVec 32))

(assert (=> b!558283 (= lt!253699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253700 (select (arr!16864 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558283 (= lt!253701 (toIndex!0 (select (store (arr!16864 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558283 (= lt!253700 (toIndex!0 (select (arr!16864 a!3118) j!142) mask!3119))))

(declare-fun b!558284 () Bool)

(declare-fun e!321633 () Bool)

(assert (=> b!558284 (= e!321633 e!321630)))

(declare-fun res!350050 () Bool)

(assert (=> b!558284 (=> (not res!350050) (not e!321630))))

(declare-fun lt!253697 () SeekEntryResult!5269)

(assert (=> b!558284 (= res!350050 (or (= lt!253697 (MissingZero!5269 i!1132)) (= lt!253697 (MissingVacant!5269 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35121 (_ BitVec 32)) SeekEntryResult!5269)

(assert (=> b!558284 (= lt!253697 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558285 () Bool)

(declare-fun res!350047 () Bool)

(assert (=> b!558285 (=> (not res!350047) (not e!321633))))

(assert (=> b!558285 (= res!350047 (and (= (size!17228 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17228 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17228 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558286 () Bool)

(declare-fun res!350041 () Bool)

(assert (=> b!558286 (=> (not res!350041) (not e!321633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558286 (= res!350041 (validKeyInArray!0 (select (arr!16864 a!3118) j!142)))))

(declare-fun res!350046 () Bool)

(assert (=> start!51120 (=> (not res!350046) (not e!321633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51120 (= res!350046 (validMask!0 mask!3119))))

(assert (=> start!51120 e!321633))

(assert (=> start!51120 true))

(declare-fun array_inv!12723 (array!35121) Bool)

(assert (=> start!51120 (array_inv!12723 a!3118)))

(declare-fun b!558287 () Bool)

(assert (=> b!558287 (= e!321632 (not true))))

(declare-fun e!321631 () Bool)

(assert (=> b!558287 e!321631))

(declare-fun res!350042 () Bool)

(assert (=> b!558287 (=> (not res!350042) (not e!321631))))

(declare-fun lt!253698 () SeekEntryResult!5269)

(assert (=> b!558287 (= res!350042 (= lt!253698 (Found!5269 j!142)))))

(assert (=> b!558287 (= lt!253698 (seekEntryOrOpen!0 (select (arr!16864 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558287 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17383 0))(
  ( (Unit!17384) )
))
(declare-fun lt!253702 () Unit!17383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17383)

(assert (=> b!558287 (= lt!253702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558288 () Bool)

(declare-fun e!321629 () Bool)

(assert (=> b!558288 (= e!321631 e!321629)))

(declare-fun res!350043 () Bool)

(assert (=> b!558288 (=> res!350043 e!321629)))

(get-info :version)

(assert (=> b!558288 (= res!350043 (or (undefined!6081 lt!253699) (not ((_ is Intermediate!5269) lt!253699)) (= (select (arr!16864 a!3118) (index!23305 lt!253699)) (select (arr!16864 a!3118) j!142)) (= (select (arr!16864 a!3118) (index!23305 lt!253699)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558289 () Bool)

(declare-fun res!350044 () Bool)

(assert (=> b!558289 (=> (not res!350044) (not e!321633))))

(declare-fun arrayContainsKey!0 (array!35121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558289 (= res!350044 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558290 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35121 (_ BitVec 32)) SeekEntryResult!5269)

(assert (=> b!558290 (= e!321629 (= lt!253698 (seekKeyOrZeroReturnVacant!0 (x!52356 lt!253699) (index!23305 lt!253699) (index!23305 lt!253699) (select (arr!16864 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558291 () Bool)

(declare-fun res!350049 () Bool)

(assert (=> b!558291 (=> (not res!350049) (not e!321633))))

(assert (=> b!558291 (= res!350049 (validKeyInArray!0 k0!1914))))

(declare-fun b!558292 () Bool)

(declare-fun res!350040 () Bool)

(assert (=> b!558292 (=> (not res!350040) (not e!321630))))

(declare-datatypes ((List!10851 0))(
  ( (Nil!10848) (Cons!10847 (h!11844 (_ BitVec 64)) (t!17071 List!10851)) )
))
(declare-fun arrayNoDuplicates!0 (array!35121 (_ BitVec 32) List!10851) Bool)

(assert (=> b!558292 (= res!350040 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10848))))

(assert (= (and start!51120 res!350046) b!558285))

(assert (= (and b!558285 res!350047) b!558286))

(assert (= (and b!558286 res!350041) b!558291))

(assert (= (and b!558291 res!350049) b!558289))

(assert (= (and b!558289 res!350044) b!558284))

(assert (= (and b!558284 res!350050) b!558282))

(assert (= (and b!558282 res!350045) b!558292))

(assert (= (and b!558292 res!350040) b!558283))

(assert (= (and b!558283 res!350048) b!558287))

(assert (= (and b!558287 res!350042) b!558288))

(assert (= (and b!558288 (not res!350043)) b!558290))

(declare-fun m!536327 () Bool)

(assert (=> b!558292 m!536327))

(declare-fun m!536329 () Bool)

(assert (=> b!558287 m!536329))

(assert (=> b!558287 m!536329))

(declare-fun m!536331 () Bool)

(assert (=> b!558287 m!536331))

(declare-fun m!536333 () Bool)

(assert (=> b!558287 m!536333))

(declare-fun m!536335 () Bool)

(assert (=> b!558287 m!536335))

(declare-fun m!536337 () Bool)

(assert (=> b!558291 m!536337))

(declare-fun m!536339 () Bool)

(assert (=> b!558282 m!536339))

(assert (=> b!558290 m!536329))

(assert (=> b!558290 m!536329))

(declare-fun m!536341 () Bool)

(assert (=> b!558290 m!536341))

(declare-fun m!536343 () Bool)

(assert (=> b!558289 m!536343))

(assert (=> b!558286 m!536329))

(assert (=> b!558286 m!536329))

(declare-fun m!536345 () Bool)

(assert (=> b!558286 m!536345))

(declare-fun m!536347 () Bool)

(assert (=> b!558284 m!536347))

(assert (=> b!558283 m!536329))

(declare-fun m!536349 () Bool)

(assert (=> b!558283 m!536349))

(assert (=> b!558283 m!536329))

(declare-fun m!536351 () Bool)

(assert (=> b!558283 m!536351))

(declare-fun m!536353 () Bool)

(assert (=> b!558283 m!536353))

(assert (=> b!558283 m!536351))

(declare-fun m!536355 () Bool)

(assert (=> b!558283 m!536355))

(assert (=> b!558283 m!536329))

(declare-fun m!536357 () Bool)

(assert (=> b!558283 m!536357))

(assert (=> b!558283 m!536351))

(declare-fun m!536359 () Bool)

(assert (=> b!558283 m!536359))

(declare-fun m!536361 () Bool)

(assert (=> start!51120 m!536361))

(declare-fun m!536363 () Bool)

(assert (=> start!51120 m!536363))

(declare-fun m!536365 () Bool)

(assert (=> b!558288 m!536365))

(assert (=> b!558288 m!536329))

(check-sat (not b!558282) (not b!558286) (not b!558283) (not b!558284) (not b!558289) (not b!558292) (not start!51120) (not b!558287) (not b!558290) (not b!558291))
(check-sat)
