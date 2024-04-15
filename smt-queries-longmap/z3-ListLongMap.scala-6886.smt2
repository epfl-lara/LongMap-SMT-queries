; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86562 () Bool)

(assert start!86562)

(declare-fun b!1003411 () Bool)

(declare-fun res!673019 () Bool)

(declare-fun e!565124 () Bool)

(assert (=> b!1003411 (=> (not res!673019) (not e!565124))))

(declare-datatypes ((array!63310 0))(
  ( (array!63311 (arr!30480 (Array (_ BitVec 32) (_ BitVec 64))) (size!30984 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63310)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003411 (= res!673019 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30984 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30984 a!3219))))))

(declare-fun b!1003412 () Bool)

(declare-fun e!565125 () Bool)

(declare-fun e!565121 () Bool)

(assert (=> b!1003412 (= e!565125 e!565121)))

(declare-fun res!673014 () Bool)

(assert (=> b!1003412 (=> (not res!673014) (not e!565121))))

(declare-fun lt!443542 () (_ BitVec 32))

(assert (=> b!1003412 (= res!673014 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443542 #b00000000000000000000000000000000) (bvslt lt!443542 (size!30984 a!3219))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003412 (= lt!443542 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003413 () Bool)

(declare-fun res!673025 () Bool)

(declare-fun e!565123 () Bool)

(assert (=> b!1003413 (=> (not res!673025) (not e!565123))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003413 (= res!673025 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003414 () Bool)

(declare-fun res!673016 () Bool)

(assert (=> b!1003414 (=> (not res!673016) (not e!565125))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003414 (= res!673016 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003415 () Bool)

(declare-fun res!673015 () Bool)

(assert (=> b!1003415 (=> (not res!673015) (not e!565123))))

(declare-fun arrayContainsKey!0 (array!63310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003415 (= res!673015 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003416 () Bool)

(assert (=> b!1003416 (= e!565121 false)))

(declare-datatypes ((SeekEntryResult!9437 0))(
  ( (MissingZero!9437 (index!40119 (_ BitVec 32))) (Found!9437 (index!40120 (_ BitVec 32))) (Intermediate!9437 (undefined!10249 Bool) (index!40121 (_ BitVec 32)) (x!87540 (_ BitVec 32))) (Undefined!9437) (MissingVacant!9437 (index!40122 (_ BitVec 32))) )
))
(declare-fun lt!443539 () SeekEntryResult!9437)

(declare-fun lt!443538 () (_ BitVec 64))

(declare-fun lt!443541 () array!63310)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63310 (_ BitVec 32)) SeekEntryResult!9437)

(assert (=> b!1003416 (= lt!443539 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443542 lt!443538 lt!443541 mask!3464))))

(declare-fun b!1003417 () Bool)

(declare-fun e!565127 () Bool)

(assert (=> b!1003417 (= e!565127 e!565125)))

(declare-fun res!673020 () Bool)

(assert (=> b!1003417 (=> (not res!673020) (not e!565125))))

(declare-fun lt!443540 () SeekEntryResult!9437)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003417 (= res!673020 (not (= lt!443540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443538 mask!3464) lt!443538 lt!443541 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1003417 (= lt!443538 (select (store (arr!30480 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003417 (= lt!443541 (array!63311 (store (arr!30480 a!3219) i!1194 k0!2224) (size!30984 a!3219)))))

(declare-fun b!1003418 () Bool)

(assert (=> b!1003418 (= e!565123 e!565124)))

(declare-fun res!673026 () Bool)

(assert (=> b!1003418 (=> (not res!673026) (not e!565124))))

(declare-fun lt!443545 () SeekEntryResult!9437)

(assert (=> b!1003418 (= res!673026 (or (= lt!443545 (MissingVacant!9437 i!1194)) (= lt!443545 (MissingZero!9437 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63310 (_ BitVec 32)) SeekEntryResult!9437)

(assert (=> b!1003418 (= lt!443545 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!673027 () Bool)

(assert (=> start!86562 (=> (not res!673027) (not e!565123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86562 (= res!673027 (validMask!0 mask!3464))))

(assert (=> start!86562 e!565123))

(declare-fun array_inv!23623 (array!63310) Bool)

(assert (=> start!86562 (array_inv!23623 a!3219)))

(assert (=> start!86562 true))

(declare-fun b!1003419 () Bool)

(declare-fun res!673028 () Bool)

(assert (=> b!1003419 (=> (not res!673028) (not e!565124))))

(declare-datatypes ((List!21222 0))(
  ( (Nil!21219) (Cons!21218 (h!22395 (_ BitVec 64)) (t!30214 List!21222)) )
))
(declare-fun arrayNoDuplicates!0 (array!63310 (_ BitVec 32) List!21222) Bool)

(assert (=> b!1003419 (= res!673028 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21219))))

(declare-fun b!1003420 () Bool)

(declare-fun res!673023 () Bool)

(assert (=> b!1003420 (=> (not res!673023) (not e!565125))))

(declare-fun lt!443543 () SeekEntryResult!9437)

(assert (=> b!1003420 (= res!673023 (not (= lt!443543 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443538 lt!443541 mask!3464))))))

(declare-fun b!1003421 () Bool)

(declare-fun res!673024 () Bool)

(assert (=> b!1003421 (=> (not res!673024) (not e!565123))))

(assert (=> b!1003421 (= res!673024 (validKeyInArray!0 (select (arr!30480 a!3219) j!170)))))

(declare-fun b!1003422 () Bool)

(declare-fun res!673013 () Bool)

(assert (=> b!1003422 (=> (not res!673013) (not e!565123))))

(assert (=> b!1003422 (= res!673013 (and (= (size!30984 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30984 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30984 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003423 () Bool)

(declare-fun e!565126 () Bool)

(assert (=> b!1003423 (= e!565126 e!565127)))

(declare-fun res!673022 () Bool)

(assert (=> b!1003423 (=> (not res!673022) (not e!565127))))

(declare-fun lt!443544 () SeekEntryResult!9437)

(assert (=> b!1003423 (= res!673022 (= lt!443543 lt!443544))))

(assert (=> b!1003423 (= lt!443543 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30480 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003424 () Bool)

(assert (=> b!1003424 (= e!565124 e!565126)))

(declare-fun res!673021 () Bool)

(assert (=> b!1003424 (=> (not res!673021) (not e!565126))))

(assert (=> b!1003424 (= res!673021 (= lt!443540 lt!443544))))

(assert (=> b!1003424 (= lt!443544 (Intermediate!9437 false resIndex!38 resX!38))))

(assert (=> b!1003424 (= lt!443540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30480 a!3219) j!170) mask!3464) (select (arr!30480 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003425 () Bool)

(declare-fun res!673018 () Bool)

(assert (=> b!1003425 (=> (not res!673018) (not e!565124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63310 (_ BitVec 32)) Bool)

(assert (=> b!1003425 (= res!673018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003426 () Bool)

(declare-fun res!673017 () Bool)

(assert (=> b!1003426 (=> (not res!673017) (not e!565121))))

(assert (=> b!1003426 (= res!673017 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443542 (select (arr!30480 a!3219) j!170) a!3219 mask!3464) lt!443544))))

(assert (= (and start!86562 res!673027) b!1003422))

(assert (= (and b!1003422 res!673013) b!1003421))

(assert (= (and b!1003421 res!673024) b!1003413))

(assert (= (and b!1003413 res!673025) b!1003415))

(assert (= (and b!1003415 res!673015) b!1003418))

(assert (= (and b!1003418 res!673026) b!1003425))

(assert (= (and b!1003425 res!673018) b!1003419))

(assert (= (and b!1003419 res!673028) b!1003411))

(assert (= (and b!1003411 res!673019) b!1003424))

(assert (= (and b!1003424 res!673021) b!1003423))

(assert (= (and b!1003423 res!673022) b!1003417))

(assert (= (and b!1003417 res!673020) b!1003420))

(assert (= (and b!1003420 res!673023) b!1003414))

(assert (= (and b!1003414 res!673016) b!1003412))

(assert (= (and b!1003412 res!673014) b!1003426))

(assert (= (and b!1003426 res!673017) b!1003416))

(declare-fun m!928579 () Bool)

(assert (=> b!1003420 m!928579))

(declare-fun m!928581 () Bool)

(assert (=> b!1003418 m!928581))

(declare-fun m!928583 () Bool)

(assert (=> b!1003426 m!928583))

(assert (=> b!1003426 m!928583))

(declare-fun m!928585 () Bool)

(assert (=> b!1003426 m!928585))

(assert (=> b!1003423 m!928583))

(assert (=> b!1003423 m!928583))

(declare-fun m!928587 () Bool)

(assert (=> b!1003423 m!928587))

(declare-fun m!928589 () Bool)

(assert (=> b!1003416 m!928589))

(assert (=> b!1003421 m!928583))

(assert (=> b!1003421 m!928583))

(declare-fun m!928591 () Bool)

(assert (=> b!1003421 m!928591))

(assert (=> b!1003424 m!928583))

(assert (=> b!1003424 m!928583))

(declare-fun m!928593 () Bool)

(assert (=> b!1003424 m!928593))

(assert (=> b!1003424 m!928593))

(assert (=> b!1003424 m!928583))

(declare-fun m!928595 () Bool)

(assert (=> b!1003424 m!928595))

(declare-fun m!928597 () Bool)

(assert (=> b!1003419 m!928597))

(declare-fun m!928599 () Bool)

(assert (=> b!1003413 m!928599))

(declare-fun m!928601 () Bool)

(assert (=> b!1003412 m!928601))

(declare-fun m!928603 () Bool)

(assert (=> start!86562 m!928603))

(declare-fun m!928605 () Bool)

(assert (=> start!86562 m!928605))

(declare-fun m!928607 () Bool)

(assert (=> b!1003415 m!928607))

(declare-fun m!928609 () Bool)

(assert (=> b!1003425 m!928609))

(declare-fun m!928611 () Bool)

(assert (=> b!1003417 m!928611))

(assert (=> b!1003417 m!928611))

(declare-fun m!928613 () Bool)

(assert (=> b!1003417 m!928613))

(declare-fun m!928615 () Bool)

(assert (=> b!1003417 m!928615))

(declare-fun m!928617 () Bool)

(assert (=> b!1003417 m!928617))

(check-sat (not b!1003420) (not b!1003423) (not b!1003412) (not b!1003417) (not b!1003425) (not b!1003416) (not b!1003419) (not start!86562) (not b!1003421) (not b!1003426) (not b!1003424) (not b!1003418) (not b!1003415) (not b!1003413))
(check-sat)
