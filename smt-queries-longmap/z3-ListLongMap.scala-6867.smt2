; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86458 () Bool)

(assert start!86458)

(declare-fun b!1001007 () Bool)

(declare-fun res!670491 () Bool)

(declare-fun e!564098 () Bool)

(assert (=> b!1001007 (=> (not res!670491) (not e!564098))))

(declare-datatypes ((array!63259 0))(
  ( (array!63260 (arr!30455 (Array (_ BitVec 32) (_ BitVec 64))) (size!30957 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63259)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001007 (= res!670491 (validKeyInArray!0 (select (arr!30455 a!3219) j!170)))))

(declare-fun b!1001008 () Bool)

(declare-fun res!670488 () Bool)

(assert (=> b!1001008 (=> (not res!670488) (not e!564098))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1001008 (= res!670488 (validKeyInArray!0 k0!2224))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun b!1001009 () Bool)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun e!564101 () Bool)

(assert (=> b!1001009 (= e!564101 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!1001010 () Bool)

(declare-fun e!564102 () Bool)

(declare-fun e!564100 () Bool)

(assert (=> b!1001010 (= e!564102 e!564100)))

(declare-fun res!670487 () Bool)

(assert (=> b!1001010 (=> (not res!670487) (not e!564100))))

(declare-datatypes ((SeekEntryResult!9387 0))(
  ( (MissingZero!9387 (index!39919 (_ BitVec 32))) (Found!9387 (index!39920 (_ BitVec 32))) (Intermediate!9387 (undefined!10199 Bool) (index!39921 (_ BitVec 32)) (x!87343 (_ BitVec 32))) (Undefined!9387) (MissingVacant!9387 (index!39922 (_ BitVec 32))) )
))
(declare-fun lt!442473 () SeekEntryResult!9387)

(declare-fun lt!442470 () SeekEntryResult!9387)

(assert (=> b!1001010 (= res!670487 (= lt!442473 lt!442470))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001010 (= lt!442470 (Intermediate!9387 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63259 (_ BitVec 32)) SeekEntryResult!9387)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001010 (= lt!442473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30455 a!3219) j!170) mask!3464) (select (arr!30455 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001012 () Bool)

(declare-fun res!670492 () Bool)

(assert (=> b!1001012 (=> (not res!670492) (not e!564102))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001012 (= res!670492 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30957 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30957 a!3219))))))

(declare-fun b!1001013 () Bool)

(declare-fun e!564099 () Bool)

(assert (=> b!1001013 (= e!564100 e!564099)))

(declare-fun res!670486 () Bool)

(assert (=> b!1001013 (=> (not res!670486) (not e!564099))))

(declare-fun lt!442475 () SeekEntryResult!9387)

(assert (=> b!1001013 (= res!670486 (= lt!442475 lt!442470))))

(assert (=> b!1001013 (= lt!442475 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30455 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001014 () Bool)

(assert (=> b!1001014 (= e!564099 e!564101)))

(declare-fun res!670489 () Bool)

(assert (=> b!1001014 (=> (not res!670489) (not e!564101))))

(declare-fun lt!442472 () array!63259)

(declare-fun lt!442474 () (_ BitVec 64))

(assert (=> b!1001014 (= res!670489 (not (= lt!442473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442474 mask!3464) lt!442474 lt!442472 mask!3464))))))

(assert (=> b!1001014 (= lt!442474 (select (store (arr!30455 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001014 (= lt!442472 (array!63260 (store (arr!30455 a!3219) i!1194 k0!2224) (size!30957 a!3219)))))

(declare-fun b!1001015 () Bool)

(declare-fun res!670497 () Bool)

(assert (=> b!1001015 (=> (not res!670497) (not e!564102))))

(declare-datatypes ((List!21131 0))(
  ( (Nil!21128) (Cons!21127 (h!22304 (_ BitVec 64)) (t!30132 List!21131)) )
))
(declare-fun arrayNoDuplicates!0 (array!63259 (_ BitVec 32) List!21131) Bool)

(assert (=> b!1001015 (= res!670497 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21128))))

(declare-fun b!1001016 () Bool)

(declare-fun res!670490 () Bool)

(assert (=> b!1001016 (=> (not res!670490) (not e!564098))))

(declare-fun arrayContainsKey!0 (array!63259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001016 (= res!670490 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001017 () Bool)

(assert (=> b!1001017 (= e!564098 e!564102)))

(declare-fun res!670494 () Bool)

(assert (=> b!1001017 (=> (not res!670494) (not e!564102))))

(declare-fun lt!442471 () SeekEntryResult!9387)

(assert (=> b!1001017 (= res!670494 (or (= lt!442471 (MissingVacant!9387 i!1194)) (= lt!442471 (MissingZero!9387 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63259 (_ BitVec 32)) SeekEntryResult!9387)

(assert (=> b!1001017 (= lt!442471 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001011 () Bool)

(declare-fun res!670493 () Bool)

(assert (=> b!1001011 (=> (not res!670493) (not e!564101))))

(assert (=> b!1001011 (= res!670493 (not (= lt!442475 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442474 lt!442472 mask!3464))))))

(declare-fun res!670485 () Bool)

(assert (=> start!86458 (=> (not res!670485) (not e!564098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86458 (= res!670485 (validMask!0 mask!3464))))

(assert (=> start!86458 e!564098))

(declare-fun array_inv!23579 (array!63259) Bool)

(assert (=> start!86458 (array_inv!23579 a!3219)))

(assert (=> start!86458 true))

(declare-fun b!1001018 () Bool)

(declare-fun res!670495 () Bool)

(assert (=> b!1001018 (=> (not res!670495) (not e!564102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63259 (_ BitVec 32)) Bool)

(assert (=> b!1001018 (= res!670495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001019 () Bool)

(declare-fun res!670496 () Bool)

(assert (=> b!1001019 (=> (not res!670496) (not e!564098))))

(assert (=> b!1001019 (= res!670496 (and (= (size!30957 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30957 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30957 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86458 res!670485) b!1001019))

(assert (= (and b!1001019 res!670496) b!1001007))

(assert (= (and b!1001007 res!670491) b!1001008))

(assert (= (and b!1001008 res!670488) b!1001016))

(assert (= (and b!1001016 res!670490) b!1001017))

(assert (= (and b!1001017 res!670494) b!1001018))

(assert (= (and b!1001018 res!670495) b!1001015))

(assert (= (and b!1001015 res!670497) b!1001012))

(assert (= (and b!1001012 res!670492) b!1001010))

(assert (= (and b!1001010 res!670487) b!1001013))

(assert (= (and b!1001013 res!670486) b!1001014))

(assert (= (and b!1001014 res!670489) b!1001011))

(assert (= (and b!1001011 res!670493) b!1001009))

(declare-fun m!927117 () Bool)

(assert (=> b!1001010 m!927117))

(assert (=> b!1001010 m!927117))

(declare-fun m!927119 () Bool)

(assert (=> b!1001010 m!927119))

(assert (=> b!1001010 m!927119))

(assert (=> b!1001010 m!927117))

(declare-fun m!927121 () Bool)

(assert (=> b!1001010 m!927121))

(declare-fun m!927123 () Bool)

(assert (=> b!1001017 m!927123))

(declare-fun m!927125 () Bool)

(assert (=> b!1001011 m!927125))

(assert (=> b!1001007 m!927117))

(assert (=> b!1001007 m!927117))

(declare-fun m!927127 () Bool)

(assert (=> b!1001007 m!927127))

(declare-fun m!927129 () Bool)

(assert (=> b!1001008 m!927129))

(declare-fun m!927131 () Bool)

(assert (=> b!1001014 m!927131))

(assert (=> b!1001014 m!927131))

(declare-fun m!927133 () Bool)

(assert (=> b!1001014 m!927133))

(declare-fun m!927135 () Bool)

(assert (=> b!1001014 m!927135))

(declare-fun m!927137 () Bool)

(assert (=> b!1001014 m!927137))

(declare-fun m!927139 () Bool)

(assert (=> start!86458 m!927139))

(declare-fun m!927141 () Bool)

(assert (=> start!86458 m!927141))

(declare-fun m!927143 () Bool)

(assert (=> b!1001016 m!927143))

(assert (=> b!1001013 m!927117))

(assert (=> b!1001013 m!927117))

(declare-fun m!927145 () Bool)

(assert (=> b!1001013 m!927145))

(declare-fun m!927147 () Bool)

(assert (=> b!1001018 m!927147))

(declare-fun m!927149 () Bool)

(assert (=> b!1001015 m!927149))

(check-sat (not b!1001007) (not b!1001008) (not b!1001017) (not b!1001010) (not b!1001013) (not b!1001014) (not start!86458) (not b!1001018) (not b!1001011) (not b!1001016) (not b!1001015))
(check-sat)
