; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86554 () Bool)

(assert start!86554)

(declare-fun b!1000527 () Bool)

(declare-fun res!669447 () Bool)

(declare-fun e!564207 () Bool)

(assert (=> b!1000527 (=> (not res!669447) (not e!564207))))

(declare-datatypes ((array!63225 0))(
  ( (array!63226 (arr!30433 (Array (_ BitVec 32) (_ BitVec 64))) (size!30936 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63225)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63225 (_ BitVec 32)) Bool)

(assert (=> b!1000527 (= res!669447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000528 () Bool)

(declare-fun res!669441 () Bool)

(declare-fun e!564206 () Bool)

(assert (=> b!1000528 (=> (not res!669441) (not e!564206))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000528 (= res!669441 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000529 () Bool)

(declare-fun res!669443 () Bool)

(assert (=> b!1000529 (=> (not res!669443) (not e!564206))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000529 (= res!669443 (validKeyInArray!0 (select (arr!30433 a!3219) j!170)))))

(declare-fun b!1000530 () Bool)

(declare-fun res!669439 () Bool)

(assert (=> b!1000530 (=> (not res!669439) (not e!564206))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000530 (= res!669439 (and (= (size!30936 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30936 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30936 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000531 () Bool)

(declare-fun res!669449 () Bool)

(assert (=> b!1000531 (=> (not res!669449) (not e!564207))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000531 (= res!669449 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30936 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30936 a!3219))))))

(declare-fun b!1000533 () Bool)

(assert (=> b!1000533 (= e!564206 e!564207)))

(declare-fun res!669440 () Bool)

(assert (=> b!1000533 (=> (not res!669440) (not e!564207))))

(declare-datatypes ((SeekEntryResult!9301 0))(
  ( (MissingZero!9301 (index!39575 (_ BitVec 32))) (Found!9301 (index!39576 (_ BitVec 32))) (Intermediate!9301 (undefined!10113 Bool) (index!39577 (_ BitVec 32)) (x!87167 (_ BitVec 32))) (Undefined!9301) (MissingVacant!9301 (index!39578 (_ BitVec 32))) )
))
(declare-fun lt!442436 () SeekEntryResult!9301)

(assert (=> b!1000533 (= res!669440 (or (= lt!442436 (MissingVacant!9301 i!1194)) (= lt!442436 (MissingZero!9301 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63225 (_ BitVec 32)) SeekEntryResult!9301)

(assert (=> b!1000533 (= lt!442436 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000534 () Bool)

(declare-fun e!564204 () Bool)

(assert (=> b!1000534 (= e!564207 e!564204)))

(declare-fun res!669448 () Bool)

(assert (=> b!1000534 (=> (not res!669448) (not e!564204))))

(declare-fun lt!442434 () SeekEntryResult!9301)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63225 (_ BitVec 32)) SeekEntryResult!9301)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000534 (= res!669448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30433 a!3219) j!170) mask!3464) (select (arr!30433 a!3219) j!170) a!3219 mask!3464) lt!442434))))

(assert (=> b!1000534 (= lt!442434 (Intermediate!9301 false resIndex!38 resX!38))))

(declare-fun b!1000535 () Bool)

(assert (=> b!1000535 (= e!564204 false)))

(declare-fun lt!442435 () SeekEntryResult!9301)

(assert (=> b!1000535 (= lt!442435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30433 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30433 a!3219) i!1194 k0!2224) j!170) (array!63226 (store (arr!30433 a!3219) i!1194 k0!2224) (size!30936 a!3219)) mask!3464))))

(declare-fun b!1000536 () Bool)

(declare-fun res!669445 () Bool)

(assert (=> b!1000536 (=> (not res!669445) (not e!564204))))

(assert (=> b!1000536 (= res!669445 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30433 a!3219) j!170) a!3219 mask!3464) lt!442434))))

(declare-fun b!1000537 () Bool)

(declare-fun res!669442 () Bool)

(assert (=> b!1000537 (=> (not res!669442) (not e!564206))))

(assert (=> b!1000537 (= res!669442 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000532 () Bool)

(declare-fun res!669444 () Bool)

(assert (=> b!1000532 (=> (not res!669444) (not e!564207))))

(declare-datatypes ((List!21080 0))(
  ( (Nil!21077) (Cons!21076 (h!22259 (_ BitVec 64)) (t!30073 List!21080)) )
))
(declare-fun arrayNoDuplicates!0 (array!63225 (_ BitVec 32) List!21080) Bool)

(assert (=> b!1000532 (= res!669444 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21077))))

(declare-fun res!669446 () Bool)

(assert (=> start!86554 (=> (not res!669446) (not e!564206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86554 (= res!669446 (validMask!0 mask!3464))))

(assert (=> start!86554 e!564206))

(declare-fun array_inv!23569 (array!63225) Bool)

(assert (=> start!86554 (array_inv!23569 a!3219)))

(assert (=> start!86554 true))

(assert (= (and start!86554 res!669446) b!1000530))

(assert (= (and b!1000530 res!669439) b!1000529))

(assert (= (and b!1000529 res!669443) b!1000537))

(assert (= (and b!1000537 res!669442) b!1000528))

(assert (= (and b!1000528 res!669441) b!1000533))

(assert (= (and b!1000533 res!669440) b!1000527))

(assert (= (and b!1000527 res!669447) b!1000532))

(assert (= (and b!1000532 res!669444) b!1000531))

(assert (= (and b!1000531 res!669449) b!1000534))

(assert (= (and b!1000534 res!669448) b!1000536))

(assert (= (and b!1000536 res!669445) b!1000535))

(declare-fun m!927161 () Bool)

(assert (=> start!86554 m!927161))

(declare-fun m!927163 () Bool)

(assert (=> start!86554 m!927163))

(declare-fun m!927165 () Bool)

(assert (=> b!1000529 m!927165))

(assert (=> b!1000529 m!927165))

(declare-fun m!927167 () Bool)

(assert (=> b!1000529 m!927167))

(assert (=> b!1000536 m!927165))

(assert (=> b!1000536 m!927165))

(declare-fun m!927169 () Bool)

(assert (=> b!1000536 m!927169))

(declare-fun m!927171 () Bool)

(assert (=> b!1000528 m!927171))

(declare-fun m!927173 () Bool)

(assert (=> b!1000532 m!927173))

(declare-fun m!927175 () Bool)

(assert (=> b!1000527 m!927175))

(declare-fun m!927177 () Bool)

(assert (=> b!1000535 m!927177))

(declare-fun m!927179 () Bool)

(assert (=> b!1000535 m!927179))

(assert (=> b!1000535 m!927179))

(declare-fun m!927181 () Bool)

(assert (=> b!1000535 m!927181))

(assert (=> b!1000535 m!927181))

(assert (=> b!1000535 m!927179))

(declare-fun m!927183 () Bool)

(assert (=> b!1000535 m!927183))

(declare-fun m!927185 () Bool)

(assert (=> b!1000537 m!927185))

(assert (=> b!1000534 m!927165))

(assert (=> b!1000534 m!927165))

(declare-fun m!927187 () Bool)

(assert (=> b!1000534 m!927187))

(assert (=> b!1000534 m!927187))

(assert (=> b!1000534 m!927165))

(declare-fun m!927189 () Bool)

(assert (=> b!1000534 m!927189))

(declare-fun m!927191 () Bool)

(assert (=> b!1000533 m!927191))

(check-sat (not b!1000533) (not b!1000532) (not b!1000529) (not b!1000528) (not start!86554) (not b!1000536) (not b!1000537) (not b!1000527) (not b!1000535) (not b!1000534))
(check-sat)
