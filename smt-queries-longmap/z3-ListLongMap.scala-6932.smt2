; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87264 () Bool)

(assert start!87264)

(declare-fun b!1011372 () Bool)

(declare-fun res!679394 () Bool)

(declare-fun e!568972 () Bool)

(assert (=> b!1011372 (=> (not res!679394) (not e!568972))))

(declare-datatypes ((array!63607 0))(
  ( (array!63608 (arr!30618 (Array (_ BitVec 32) (_ BitVec 64))) (size!31122 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63607)

(declare-datatypes ((List!21360 0))(
  ( (Nil!21357) (Cons!21356 (h!22554 (_ BitVec 64)) (t!30352 List!21360)) )
))
(declare-fun arrayNoDuplicates!0 (array!63607 (_ BitVec 32) List!21360) Bool)

(assert (=> b!1011372 (= res!679394 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21357))))

(declare-fun b!1011373 () Bool)

(declare-fun res!679401 () Bool)

(declare-fun e!568970 () Bool)

(assert (=> b!1011373 (=> (not res!679401) (not e!568970))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011373 (= res!679401 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011374 () Bool)

(declare-fun res!679391 () Bool)

(assert (=> b!1011374 (=> (not res!679391) (not e!568970))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011374 (= res!679391 (and (= (size!31122 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31122 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31122 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011375 () Bool)

(declare-fun e!568971 () Bool)

(declare-fun e!568968 () Bool)

(assert (=> b!1011375 (= e!568971 e!568968)))

(declare-fun res!679398 () Bool)

(assert (=> b!1011375 (=> (not res!679398) (not e!568968))))

(declare-datatypes ((SeekEntryResult!9575 0))(
  ( (MissingZero!9575 (index!40671 (_ BitVec 32))) (Found!9575 (index!40672 (_ BitVec 32))) (Intermediate!9575 (undefined!10387 Bool) (index!40673 (_ BitVec 32)) (x!88106 (_ BitVec 32))) (Undefined!9575) (MissingVacant!9575 (index!40674 (_ BitVec 32))) )
))
(declare-fun lt!446848 () SeekEntryResult!9575)

(declare-fun lt!446851 () SeekEntryResult!9575)

(assert (=> b!1011375 (= res!679398 (= lt!446848 lt!446851))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63607 (_ BitVec 32)) SeekEntryResult!9575)

(assert (=> b!1011375 (= lt!446848 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30618 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011376 () Bool)

(declare-fun e!568967 () Bool)

(assert (=> b!1011376 (= e!568968 e!568967)))

(declare-fun res!679400 () Bool)

(assert (=> b!1011376 (=> (not res!679400) (not e!568967))))

(declare-fun lt!446846 () SeekEntryResult!9575)

(declare-fun lt!446850 () array!63607)

(declare-fun lt!446847 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011376 (= res!679400 (not (= lt!446846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446847 mask!3464) lt!446847 lt!446850 mask!3464))))))

(assert (=> b!1011376 (= lt!446847 (select (store (arr!30618 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011376 (= lt!446850 (array!63608 (store (arr!30618 a!3219) i!1194 k0!2224) (size!31122 a!3219)))))

(declare-fun res!679406 () Bool)

(assert (=> start!87264 (=> (not res!679406) (not e!568970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87264 (= res!679406 (validMask!0 mask!3464))))

(assert (=> start!87264 e!568970))

(declare-fun array_inv!23761 (array!63607) Bool)

(assert (=> start!87264 (array_inv!23761 a!3219)))

(assert (=> start!87264 true))

(declare-fun b!1011377 () Bool)

(declare-fun e!568969 () Bool)

(assert (=> b!1011377 (= e!568967 e!568969)))

(declare-fun res!679403 () Bool)

(assert (=> b!1011377 (=> (not res!679403) (not e!568969))))

(declare-fun lt!446844 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011377 (= res!679403 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446844 #b00000000000000000000000000000000) (bvslt lt!446844 (size!31122 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011377 (= lt!446844 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011378 () Bool)

(declare-fun res!679402 () Bool)

(declare-fun e!568973 () Bool)

(assert (=> b!1011378 (=> (not res!679402) (not e!568973))))

(declare-fun lt!446849 () SeekEntryResult!9575)

(assert (=> b!1011378 (= res!679402 (not (= lt!446849 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446844 lt!446847 lt!446850 mask!3464))))))

(declare-fun b!1011379 () Bool)

(declare-fun res!679397 () Bool)

(assert (=> b!1011379 (=> (not res!679397) (not e!568972))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1011379 (= res!679397 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31122 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31122 a!3219))))))

(declare-fun b!1011380 () Bool)

(declare-fun res!679405 () Bool)

(assert (=> b!1011380 (=> (not res!679405) (not e!568967))))

(assert (=> b!1011380 (= res!679405 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011381 () Bool)

(assert (=> b!1011381 (= e!568969 e!568973)))

(declare-fun res!679392 () Bool)

(assert (=> b!1011381 (=> (not res!679392) (not e!568973))))

(assert (=> b!1011381 (= res!679392 (= lt!446849 lt!446851))))

(assert (=> b!1011381 (= lt!446849 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446844 (select (arr!30618 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011382 () Bool)

(declare-fun res!679396 () Bool)

(assert (=> b!1011382 (=> (not res!679396) (not e!568970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011382 (= res!679396 (validKeyInArray!0 (select (arr!30618 a!3219) j!170)))))

(declare-fun b!1011383 () Bool)

(assert (=> b!1011383 (= e!568973 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1245)) (bvsub #b01111111111111111111111111111110 x!1245)))))

(declare-fun b!1011384 () Bool)

(declare-fun res!679399 () Bool)

(assert (=> b!1011384 (=> (not res!679399) (not e!568970))))

(assert (=> b!1011384 (= res!679399 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011385 () Bool)

(assert (=> b!1011385 (= e!568970 e!568972)))

(declare-fun res!679395 () Bool)

(assert (=> b!1011385 (=> (not res!679395) (not e!568972))))

(declare-fun lt!446845 () SeekEntryResult!9575)

(assert (=> b!1011385 (= res!679395 (or (= lt!446845 (MissingVacant!9575 i!1194)) (= lt!446845 (MissingZero!9575 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63607 (_ BitVec 32)) SeekEntryResult!9575)

(assert (=> b!1011385 (= lt!446845 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011386 () Bool)

(declare-fun res!679390 () Bool)

(assert (=> b!1011386 (=> (not res!679390) (not e!568972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63607 (_ BitVec 32)) Bool)

(assert (=> b!1011386 (= res!679390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011387 () Bool)

(declare-fun res!679393 () Bool)

(assert (=> b!1011387 (=> (not res!679393) (not e!568967))))

(assert (=> b!1011387 (= res!679393 (not (= lt!446848 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446847 lt!446850 mask!3464))))))

(declare-fun b!1011388 () Bool)

(assert (=> b!1011388 (= e!568972 e!568971)))

(declare-fun res!679404 () Bool)

(assert (=> b!1011388 (=> (not res!679404) (not e!568971))))

(assert (=> b!1011388 (= res!679404 (= lt!446846 lt!446851))))

(assert (=> b!1011388 (= lt!446851 (Intermediate!9575 false resIndex!38 resX!38))))

(assert (=> b!1011388 (= lt!446846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30618 a!3219) j!170) mask!3464) (select (arr!30618 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87264 res!679406) b!1011374))

(assert (= (and b!1011374 res!679391) b!1011382))

(assert (= (and b!1011382 res!679396) b!1011384))

(assert (= (and b!1011384 res!679399) b!1011373))

(assert (= (and b!1011373 res!679401) b!1011385))

(assert (= (and b!1011385 res!679395) b!1011386))

(assert (= (and b!1011386 res!679390) b!1011372))

(assert (= (and b!1011372 res!679394) b!1011379))

(assert (= (and b!1011379 res!679397) b!1011388))

(assert (= (and b!1011388 res!679404) b!1011375))

(assert (= (and b!1011375 res!679398) b!1011376))

(assert (= (and b!1011376 res!679400) b!1011387))

(assert (= (and b!1011387 res!679393) b!1011380))

(assert (= (and b!1011380 res!679405) b!1011377))

(assert (= (and b!1011377 res!679403) b!1011381))

(assert (= (and b!1011381 res!679392) b!1011378))

(assert (= (and b!1011378 res!679402) b!1011383))

(declare-fun m!934855 () Bool)

(assert (=> b!1011377 m!934855))

(declare-fun m!934857 () Bool)

(assert (=> b!1011378 m!934857))

(declare-fun m!934859 () Bool)

(assert (=> b!1011384 m!934859))

(declare-fun m!934861 () Bool)

(assert (=> b!1011386 m!934861))

(declare-fun m!934863 () Bool)

(assert (=> b!1011385 m!934863))

(declare-fun m!934865 () Bool)

(assert (=> b!1011382 m!934865))

(assert (=> b!1011382 m!934865))

(declare-fun m!934867 () Bool)

(assert (=> b!1011382 m!934867))

(declare-fun m!934869 () Bool)

(assert (=> b!1011373 m!934869))

(declare-fun m!934871 () Bool)

(assert (=> start!87264 m!934871))

(declare-fun m!934873 () Bool)

(assert (=> start!87264 m!934873))

(declare-fun m!934875 () Bool)

(assert (=> b!1011376 m!934875))

(assert (=> b!1011376 m!934875))

(declare-fun m!934877 () Bool)

(assert (=> b!1011376 m!934877))

(declare-fun m!934879 () Bool)

(assert (=> b!1011376 m!934879))

(declare-fun m!934881 () Bool)

(assert (=> b!1011376 m!934881))

(declare-fun m!934883 () Bool)

(assert (=> b!1011387 m!934883))

(declare-fun m!934885 () Bool)

(assert (=> b!1011372 m!934885))

(assert (=> b!1011381 m!934865))

(assert (=> b!1011381 m!934865))

(declare-fun m!934887 () Bool)

(assert (=> b!1011381 m!934887))

(assert (=> b!1011388 m!934865))

(assert (=> b!1011388 m!934865))

(declare-fun m!934889 () Bool)

(assert (=> b!1011388 m!934889))

(assert (=> b!1011388 m!934889))

(assert (=> b!1011388 m!934865))

(declare-fun m!934891 () Bool)

(assert (=> b!1011388 m!934891))

(assert (=> b!1011375 m!934865))

(assert (=> b!1011375 m!934865))

(declare-fun m!934893 () Bool)

(assert (=> b!1011375 m!934893))

(check-sat (not b!1011381) (not b!1011388) (not b!1011376) (not b!1011378) (not b!1011377) (not b!1011387) (not b!1011382) (not b!1011373) (not b!1011375) (not start!87264) (not b!1011385) (not b!1011386) (not b!1011384) (not b!1011372))
(check-sat)
