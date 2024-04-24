; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87352 () Bool)

(assert start!87352)

(declare-fun b!1011453 () Bool)

(declare-fun res!679042 () Bool)

(declare-fun e!569151 () Bool)

(assert (=> b!1011453 (=> (not res!679042) (not e!569151))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9520 0))(
  ( (MissingZero!9520 (index!40451 (_ BitVec 32))) (Found!9520 (index!40452 (_ BitVec 32))) (Intermediate!9520 (undefined!10332 Bool) (index!40453 (_ BitVec 32)) (x!88018 (_ BitVec 32))) (Undefined!9520) (MissingVacant!9520 (index!40454 (_ BitVec 32))) )
))
(declare-fun lt!446961 () SeekEntryResult!9520)

(declare-fun lt!446965 () (_ BitVec 64))

(declare-datatypes ((array!63681 0))(
  ( (array!63682 (arr!30652 (Array (_ BitVec 32) (_ BitVec 64))) (size!31155 (_ BitVec 32))) )
))
(declare-fun lt!446962 () array!63681)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63681 (_ BitVec 32)) SeekEntryResult!9520)

(assert (=> b!1011453 (= res!679042 (not (= lt!446961 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446965 lt!446962 mask!3464))))))

(declare-fun b!1011454 () Bool)

(declare-fun res!679043 () Bool)

(declare-fun e!569153 () Bool)

(assert (=> b!1011454 (=> (not res!679043) (not e!569153))))

(declare-fun a!3219 () array!63681)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011454 (= res!679043 (validKeyInArray!0 (select (arr!30652 a!3219) j!170)))))

(declare-fun b!1011455 () Bool)

(assert (=> b!1011455 (= e!569151 false)))

(declare-fun lt!446963 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011455 (= lt!446963 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1011456 () Bool)

(declare-fun res!679031 () Bool)

(assert (=> b!1011456 (=> (not res!679031) (not e!569153))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1011456 (= res!679031 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011457 () Bool)

(declare-fun e!569150 () Bool)

(declare-fun e!569152 () Bool)

(assert (=> b!1011457 (= e!569150 e!569152)))

(declare-fun res!679033 () Bool)

(assert (=> b!1011457 (=> (not res!679033) (not e!569152))))

(declare-fun lt!446964 () SeekEntryResult!9520)

(declare-fun lt!446966 () SeekEntryResult!9520)

(assert (=> b!1011457 (= res!679033 (= lt!446964 lt!446966))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011457 (= lt!446966 (Intermediate!9520 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011457 (= lt!446964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30652 a!3219) j!170) mask!3464) (select (arr!30652 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011459 () Bool)

(declare-fun res!679034 () Bool)

(assert (=> b!1011459 (=> (not res!679034) (not e!569151))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011459 (= res!679034 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011460 () Bool)

(declare-fun e!569154 () Bool)

(assert (=> b!1011460 (= e!569152 e!569154)))

(declare-fun res!679030 () Bool)

(assert (=> b!1011460 (=> (not res!679030) (not e!569154))))

(assert (=> b!1011460 (= res!679030 (= lt!446961 lt!446966))))

(assert (=> b!1011460 (= lt!446961 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30652 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011461 () Bool)

(declare-fun res!679039 () Bool)

(assert (=> b!1011461 (=> (not res!679039) (not e!569150))))

(declare-datatypes ((List!21299 0))(
  ( (Nil!21296) (Cons!21295 (h!22496 (_ BitVec 64)) (t!30292 List!21299)) )
))
(declare-fun arrayNoDuplicates!0 (array!63681 (_ BitVec 32) List!21299) Bool)

(assert (=> b!1011461 (= res!679039 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21296))))

(declare-fun b!1011462 () Bool)

(assert (=> b!1011462 (= e!569154 e!569151)))

(declare-fun res!679032 () Bool)

(assert (=> b!1011462 (=> (not res!679032) (not e!569151))))

(assert (=> b!1011462 (= res!679032 (not (= lt!446964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446965 mask!3464) lt!446965 lt!446962 mask!3464))))))

(assert (=> b!1011462 (= lt!446965 (select (store (arr!30652 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011462 (= lt!446962 (array!63682 (store (arr!30652 a!3219) i!1194 k0!2224) (size!31155 a!3219)))))

(declare-fun b!1011463 () Bool)

(declare-fun res!679036 () Bool)

(assert (=> b!1011463 (=> (not res!679036) (not e!569150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63681 (_ BitVec 32)) Bool)

(assert (=> b!1011463 (= res!679036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011464 () Bool)

(assert (=> b!1011464 (= e!569153 e!569150)))

(declare-fun res!679038 () Bool)

(assert (=> b!1011464 (=> (not res!679038) (not e!569150))))

(declare-fun lt!446960 () SeekEntryResult!9520)

(assert (=> b!1011464 (= res!679038 (or (= lt!446960 (MissingVacant!9520 i!1194)) (= lt!446960 (MissingZero!9520 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63681 (_ BitVec 32)) SeekEntryResult!9520)

(assert (=> b!1011464 (= lt!446960 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011465 () Bool)

(declare-fun res!679040 () Bool)

(assert (=> b!1011465 (=> (not res!679040) (not e!569153))))

(declare-fun arrayContainsKey!0 (array!63681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011465 (= res!679040 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011466 () Bool)

(declare-fun res!679041 () Bool)

(assert (=> b!1011466 (=> (not res!679041) (not e!569153))))

(assert (=> b!1011466 (= res!679041 (and (= (size!31155 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31155 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31155 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011458 () Bool)

(declare-fun res!679035 () Bool)

(assert (=> b!1011458 (=> (not res!679035) (not e!569150))))

(assert (=> b!1011458 (= res!679035 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31155 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31155 a!3219))))))

(declare-fun res!679037 () Bool)

(assert (=> start!87352 (=> (not res!679037) (not e!569153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87352 (= res!679037 (validMask!0 mask!3464))))

(assert (=> start!87352 e!569153))

(declare-fun array_inv!23788 (array!63681) Bool)

(assert (=> start!87352 (array_inv!23788 a!3219)))

(assert (=> start!87352 true))

(assert (= (and start!87352 res!679037) b!1011466))

(assert (= (and b!1011466 res!679041) b!1011454))

(assert (= (and b!1011454 res!679043) b!1011456))

(assert (= (and b!1011456 res!679031) b!1011465))

(assert (= (and b!1011465 res!679040) b!1011464))

(assert (= (and b!1011464 res!679038) b!1011463))

(assert (= (and b!1011463 res!679036) b!1011461))

(assert (= (and b!1011461 res!679039) b!1011458))

(assert (= (and b!1011458 res!679035) b!1011457))

(assert (= (and b!1011457 res!679033) b!1011460))

(assert (= (and b!1011460 res!679030) b!1011462))

(assert (= (and b!1011462 res!679032) b!1011453))

(assert (= (and b!1011453 res!679042) b!1011459))

(assert (= (and b!1011459 res!679034) b!1011455))

(declare-fun m!936125 () Bool)

(assert (=> b!1011464 m!936125))

(declare-fun m!936127 () Bool)

(assert (=> b!1011460 m!936127))

(assert (=> b!1011460 m!936127))

(declare-fun m!936129 () Bool)

(assert (=> b!1011460 m!936129))

(declare-fun m!936131 () Bool)

(assert (=> b!1011465 m!936131))

(declare-fun m!936133 () Bool)

(assert (=> b!1011462 m!936133))

(assert (=> b!1011462 m!936133))

(declare-fun m!936135 () Bool)

(assert (=> b!1011462 m!936135))

(declare-fun m!936137 () Bool)

(assert (=> b!1011462 m!936137))

(declare-fun m!936139 () Bool)

(assert (=> b!1011462 m!936139))

(declare-fun m!936141 () Bool)

(assert (=> b!1011453 m!936141))

(declare-fun m!936143 () Bool)

(assert (=> b!1011461 m!936143))

(assert (=> b!1011457 m!936127))

(assert (=> b!1011457 m!936127))

(declare-fun m!936145 () Bool)

(assert (=> b!1011457 m!936145))

(assert (=> b!1011457 m!936145))

(assert (=> b!1011457 m!936127))

(declare-fun m!936147 () Bool)

(assert (=> b!1011457 m!936147))

(assert (=> b!1011454 m!936127))

(assert (=> b!1011454 m!936127))

(declare-fun m!936149 () Bool)

(assert (=> b!1011454 m!936149))

(declare-fun m!936151 () Bool)

(assert (=> start!87352 m!936151))

(declare-fun m!936153 () Bool)

(assert (=> start!87352 m!936153))

(declare-fun m!936155 () Bool)

(assert (=> b!1011456 m!936155))

(declare-fun m!936157 () Bool)

(assert (=> b!1011463 m!936157))

(declare-fun m!936159 () Bool)

(assert (=> b!1011455 m!936159))

(check-sat (not b!1011462) (not b!1011464) (not b!1011457) (not b!1011453) (not b!1011461) (not b!1011454) (not start!87352) (not b!1011460) (not b!1011463) (not b!1011455) (not b!1011465) (not b!1011456))
(check-sat)
