; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51590 () Bool)

(assert start!51590)

(declare-fun b!564413 () Bool)

(declare-fun e!325038 () Bool)

(declare-datatypes ((array!35464 0))(
  ( (array!35465 (arr!17033 (Array (_ BitVec 32) (_ BitVec 64))) (size!17398 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35464)

(assert (=> b!564413 (= e!325038 (bvsgt #b00000000000000000000000000000000 (size!17398 a!3118)))))

(declare-fun res!355711 () Bool)

(declare-fun e!325036 () Bool)

(assert (=> start!51590 (=> (not res!355711) (not e!325036))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51590 (= res!355711 (validMask!0 mask!3119))))

(assert (=> start!51590 e!325036))

(assert (=> start!51590 true))

(declare-fun array_inv!12916 (array!35464) Bool)

(assert (=> start!51590 (array_inv!12916 a!3118)))

(declare-fun b!564414 () Bool)

(declare-fun res!355710 () Bool)

(assert (=> b!564414 (=> (not res!355710) (not e!325036))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564414 (= res!355710 (validKeyInArray!0 (select (arr!17033 a!3118) j!142)))))

(declare-fun b!564415 () Bool)

(assert (=> b!564415 (= e!325036 e!325038)))

(declare-fun res!355714 () Bool)

(assert (=> b!564415 (=> (not res!355714) (not e!325038))))

(declare-datatypes ((SeekEntryResult!5479 0))(
  ( (MissingZero!5479 (index!24143 (_ BitVec 32))) (Found!5479 (index!24144 (_ BitVec 32))) (Intermediate!5479 (undefined!6291 Bool) (index!24145 (_ BitVec 32)) (x!53025 (_ BitVec 32))) (Undefined!5479) (MissingVacant!5479 (index!24146 (_ BitVec 32))) )
))
(declare-fun lt!257410 () SeekEntryResult!5479)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564415 (= res!355714 (or (= lt!257410 (MissingZero!5479 i!1132)) (= lt!257410 (MissingVacant!5479 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35464 (_ BitVec 32)) SeekEntryResult!5479)

(assert (=> b!564415 (= lt!257410 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564416 () Bool)

(declare-fun res!355709 () Bool)

(assert (=> b!564416 (=> (not res!355709) (not e!325038))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35464 (_ BitVec 32)) SeekEntryResult!5479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564416 (= res!355709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17033 a!3118) j!142) mask!3119) (select (arr!17033 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17033 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17033 a!3118) i!1132 k0!1914) j!142) (array!35465 (store (arr!17033 a!3118) i!1132 k0!1914) (size!17398 a!3118)) mask!3119)))))

(declare-fun b!564417 () Bool)

(declare-fun res!355715 () Bool)

(assert (=> b!564417 (=> (not res!355715) (not e!325036))))

(declare-fun arrayContainsKey!0 (array!35464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564417 (= res!355715 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564418 () Bool)

(declare-fun res!355707 () Bool)

(assert (=> b!564418 (=> (not res!355707) (not e!325036))))

(assert (=> b!564418 (= res!355707 (validKeyInArray!0 k0!1914))))

(declare-fun b!564419 () Bool)

(declare-fun res!355713 () Bool)

(assert (=> b!564419 (=> (not res!355713) (not e!325038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35464 (_ BitVec 32)) Bool)

(assert (=> b!564419 (= res!355713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564420 () Bool)

(declare-fun res!355708 () Bool)

(assert (=> b!564420 (=> (not res!355708) (not e!325038))))

(declare-datatypes ((List!11152 0))(
  ( (Nil!11149) (Cons!11148 (h!12151 (_ BitVec 64)) (t!17371 List!11152)) )
))
(declare-fun arrayNoDuplicates!0 (array!35464 (_ BitVec 32) List!11152) Bool)

(assert (=> b!564420 (= res!355708 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11149))))

(declare-fun b!564421 () Bool)

(declare-fun res!355712 () Bool)

(assert (=> b!564421 (=> (not res!355712) (not e!325036))))

(assert (=> b!564421 (= res!355712 (and (= (size!17398 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17398 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17398 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51590 res!355711) b!564421))

(assert (= (and b!564421 res!355712) b!564414))

(assert (= (and b!564414 res!355710) b!564418))

(assert (= (and b!564418 res!355707) b!564417))

(assert (= (and b!564417 res!355715) b!564415))

(assert (= (and b!564415 res!355714) b!564419))

(assert (= (and b!564419 res!355713) b!564420))

(assert (= (and b!564420 res!355708) b!564416))

(assert (= (and b!564416 res!355709) b!564413))

(declare-fun m!542369 () Bool)

(assert (=> b!564418 m!542369))

(declare-fun m!542371 () Bool)

(assert (=> b!564417 m!542371))

(declare-fun m!542373 () Bool)

(assert (=> start!51590 m!542373))

(declare-fun m!542375 () Bool)

(assert (=> start!51590 m!542375))

(declare-fun m!542377 () Bool)

(assert (=> b!564415 m!542377))

(declare-fun m!542379 () Bool)

(assert (=> b!564414 m!542379))

(assert (=> b!564414 m!542379))

(declare-fun m!542381 () Bool)

(assert (=> b!564414 m!542381))

(assert (=> b!564416 m!542379))

(declare-fun m!542383 () Bool)

(assert (=> b!564416 m!542383))

(assert (=> b!564416 m!542379))

(declare-fun m!542385 () Bool)

(assert (=> b!564416 m!542385))

(declare-fun m!542387 () Bool)

(assert (=> b!564416 m!542387))

(assert (=> b!564416 m!542385))

(declare-fun m!542389 () Bool)

(assert (=> b!564416 m!542389))

(assert (=> b!564416 m!542383))

(assert (=> b!564416 m!542379))

(declare-fun m!542391 () Bool)

(assert (=> b!564416 m!542391))

(declare-fun m!542393 () Bool)

(assert (=> b!564416 m!542393))

(assert (=> b!564416 m!542385))

(assert (=> b!564416 m!542387))

(declare-fun m!542395 () Bool)

(assert (=> b!564419 m!542395))

(declare-fun m!542397 () Bool)

(assert (=> b!564420 m!542397))

(check-sat (not start!51590) (not b!564417) (not b!564415) (not b!564419) (not b!564416) (not b!564418) (not b!564420) (not b!564414))
(check-sat)
