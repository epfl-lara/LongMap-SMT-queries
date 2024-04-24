; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51132 () Bool)

(assert start!51132)

(declare-fun b!558489 () Bool)

(declare-fun res!350249 () Bool)

(declare-fun e!321745 () Bool)

(assert (=> b!558489 (=> (not res!350249) (not e!321745))))

(declare-datatypes ((array!35133 0))(
  ( (array!35134 (arr!16870 (Array (_ BitVec 32) (_ BitVec 64))) (size!17234 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35133)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35133 (_ BitVec 32)) Bool)

(assert (=> b!558489 (= res!350249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558490 () Bool)

(declare-fun e!321746 () Bool)

(declare-fun e!321750 () Bool)

(assert (=> b!558490 (= e!321746 e!321750)))

(declare-fun res!350248 () Bool)

(assert (=> b!558490 (=> res!350248 e!321750)))

(declare-datatypes ((SeekEntryResult!5275 0))(
  ( (MissingZero!5275 (index!23327 (_ BitVec 32))) (Found!5275 (index!23328 (_ BitVec 32))) (Intermediate!5275 (undefined!6087 Bool) (index!23329 (_ BitVec 32)) (x!52378 (_ BitVec 32))) (Undefined!5275) (MissingVacant!5275 (index!23330 (_ BitVec 32))) )
))
(declare-fun lt!253807 () SeekEntryResult!5275)

(declare-fun j!142 () (_ BitVec 32))

(get-info :version)

(assert (=> b!558490 (= res!350248 (or (undefined!6087 lt!253807) (not ((_ is Intermediate!5275) lt!253807)) (= (select (arr!16870 a!3118) (index!23329 lt!253807)) (select (arr!16870 a!3118) j!142)) (= (select (arr!16870 a!3118) (index!23329 lt!253807)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558491 () Bool)

(declare-fun res!350255 () Bool)

(declare-fun e!321747 () Bool)

(assert (=> b!558491 (=> (not res!350255) (not e!321747))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558491 (= res!350255 (and (= (size!17234 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17234 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17234 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!253808 () SeekEntryResult!5275)

(declare-fun b!558492 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35133 (_ BitVec 32)) SeekEntryResult!5275)

(assert (=> b!558492 (= e!321750 (= lt!253808 (seekKeyOrZeroReturnVacant!0 (x!52378 lt!253807) (index!23329 lt!253807) (index!23329 lt!253807) (select (arr!16870 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558493 () Bool)

(assert (=> b!558493 (= e!321747 e!321745)))

(declare-fun res!350256 () Bool)

(assert (=> b!558493 (=> (not res!350256) (not e!321745))))

(declare-fun lt!253810 () SeekEntryResult!5275)

(assert (=> b!558493 (= res!350256 (or (= lt!253810 (MissingZero!5275 i!1132)) (= lt!253810 (MissingVacant!5275 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35133 (_ BitVec 32)) SeekEntryResult!5275)

(assert (=> b!558493 (= lt!253810 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558494 () Bool)

(declare-fun res!350252 () Bool)

(assert (=> b!558494 (=> (not res!350252) (not e!321747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558494 (= res!350252 (validKeyInArray!0 (select (arr!16870 a!3118) j!142)))))

(declare-fun res!350251 () Bool)

(assert (=> start!51132 (=> (not res!350251) (not e!321747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51132 (= res!350251 (validMask!0 mask!3119))))

(assert (=> start!51132 e!321747))

(assert (=> start!51132 true))

(declare-fun array_inv!12729 (array!35133) Bool)

(assert (=> start!51132 (array_inv!12729 a!3118)))

(declare-fun b!558495 () Bool)

(declare-fun res!350254 () Bool)

(assert (=> b!558495 (=> (not res!350254) (not e!321747))))

(declare-fun arrayContainsKey!0 (array!35133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558495 (= res!350254 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558496 () Bool)

(declare-fun e!321748 () Bool)

(assert (=> b!558496 (= e!321748 (not true))))

(assert (=> b!558496 e!321746))

(declare-fun res!350257 () Bool)

(assert (=> b!558496 (=> (not res!350257) (not e!321746))))

(assert (=> b!558496 (= res!350257 (= lt!253808 (Found!5275 j!142)))))

(assert (=> b!558496 (= lt!253808 (seekEntryOrOpen!0 (select (arr!16870 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558496 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17395 0))(
  ( (Unit!17396) )
))
(declare-fun lt!253806 () Unit!17395)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17395)

(assert (=> b!558496 (= lt!253806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558497 () Bool)

(assert (=> b!558497 (= e!321745 e!321748)))

(declare-fun res!350247 () Bool)

(assert (=> b!558497 (=> (not res!350247) (not e!321748))))

(declare-fun lt!253809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35133 (_ BitVec 32)) SeekEntryResult!5275)

(assert (=> b!558497 (= res!350247 (= lt!253807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253809 (select (store (arr!16870 a!3118) i!1132 k0!1914) j!142) (array!35134 (store (arr!16870 a!3118) i!1132 k0!1914) (size!17234 a!3118)) mask!3119)))))

(declare-fun lt!253805 () (_ BitVec 32))

(assert (=> b!558497 (= lt!253807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253805 (select (arr!16870 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558497 (= lt!253809 (toIndex!0 (select (store (arr!16870 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558497 (= lt!253805 (toIndex!0 (select (arr!16870 a!3118) j!142) mask!3119))))

(declare-fun b!558498 () Bool)

(declare-fun res!350253 () Bool)

(assert (=> b!558498 (=> (not res!350253) (not e!321745))))

(declare-datatypes ((List!10857 0))(
  ( (Nil!10854) (Cons!10853 (h!11850 (_ BitVec 64)) (t!17077 List!10857)) )
))
(declare-fun arrayNoDuplicates!0 (array!35133 (_ BitVec 32) List!10857) Bool)

(assert (=> b!558498 (= res!350253 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10854))))

(declare-fun b!558499 () Bool)

(declare-fun res!350250 () Bool)

(assert (=> b!558499 (=> (not res!350250) (not e!321747))))

(assert (=> b!558499 (= res!350250 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51132 res!350251) b!558491))

(assert (= (and b!558491 res!350255) b!558494))

(assert (= (and b!558494 res!350252) b!558499))

(assert (= (and b!558499 res!350250) b!558495))

(assert (= (and b!558495 res!350254) b!558493))

(assert (= (and b!558493 res!350256) b!558489))

(assert (= (and b!558489 res!350249) b!558498))

(assert (= (and b!558498 res!350253) b!558497))

(assert (= (and b!558497 res!350247) b!558496))

(assert (= (and b!558496 res!350257) b!558490))

(assert (= (and b!558490 (not res!350248)) b!558492))

(declare-fun m!536573 () Bool)

(assert (=> b!558497 m!536573))

(declare-fun m!536575 () Bool)

(assert (=> b!558497 m!536575))

(declare-fun m!536577 () Bool)

(assert (=> b!558497 m!536577))

(assert (=> b!558497 m!536573))

(declare-fun m!536579 () Bool)

(assert (=> b!558497 m!536579))

(assert (=> b!558497 m!536575))

(declare-fun m!536581 () Bool)

(assert (=> b!558497 m!536581))

(assert (=> b!558497 m!536573))

(declare-fun m!536583 () Bool)

(assert (=> b!558497 m!536583))

(assert (=> b!558497 m!536575))

(declare-fun m!536585 () Bool)

(assert (=> b!558497 m!536585))

(declare-fun m!536587 () Bool)

(assert (=> start!51132 m!536587))

(declare-fun m!536589 () Bool)

(assert (=> start!51132 m!536589))

(declare-fun m!536591 () Bool)

(assert (=> b!558499 m!536591))

(declare-fun m!536593 () Bool)

(assert (=> b!558498 m!536593))

(assert (=> b!558496 m!536573))

(assert (=> b!558496 m!536573))

(declare-fun m!536595 () Bool)

(assert (=> b!558496 m!536595))

(declare-fun m!536597 () Bool)

(assert (=> b!558496 m!536597))

(declare-fun m!536599 () Bool)

(assert (=> b!558496 m!536599))

(declare-fun m!536601 () Bool)

(assert (=> b!558495 m!536601))

(declare-fun m!536603 () Bool)

(assert (=> b!558490 m!536603))

(assert (=> b!558490 m!536573))

(declare-fun m!536605 () Bool)

(assert (=> b!558489 m!536605))

(assert (=> b!558494 m!536573))

(assert (=> b!558494 m!536573))

(declare-fun m!536607 () Bool)

(assert (=> b!558494 m!536607))

(assert (=> b!558492 m!536573))

(assert (=> b!558492 m!536573))

(declare-fun m!536609 () Bool)

(assert (=> b!558492 m!536609))

(declare-fun m!536611 () Bool)

(assert (=> b!558493 m!536611))

(check-sat (not b!558496) (not b!558499) (not b!558497) (not b!558498) (not b!558493) (not start!51132) (not b!558492) (not b!558494) (not b!558489) (not b!558495))
(check-sat)
