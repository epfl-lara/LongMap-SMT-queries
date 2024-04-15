; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86478 () Bool)

(assert start!86478)

(declare-fun b!1001395 () Bool)

(declare-fun e!564242 () Bool)

(declare-fun e!564243 () Bool)

(assert (=> b!1001395 (= e!564242 e!564243)))

(declare-fun res!670999 () Bool)

(assert (=> b!1001395 (=> (not res!670999) (not e!564243))))

(declare-datatypes ((array!63226 0))(
  ( (array!63227 (arr!30438 (Array (_ BitVec 32) (_ BitVec 64))) (size!30942 (_ BitVec 32))) )
))
(declare-fun lt!442530 () array!63226)

(declare-datatypes ((SeekEntryResult!9395 0))(
  ( (MissingZero!9395 (index!39951 (_ BitVec 32))) (Found!9395 (index!39952 (_ BitVec 32))) (Intermediate!9395 (undefined!10207 Bool) (index!39953 (_ BitVec 32)) (x!87386 (_ BitVec 32))) (Undefined!9395) (MissingVacant!9395 (index!39954 (_ BitVec 32))) )
))
(declare-fun lt!442536 () SeekEntryResult!9395)

(declare-fun lt!442535 () (_ BitVec 64))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63226 (_ BitVec 32)) SeekEntryResult!9395)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001395 (= res!670999 (not (= lt!442536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442535 mask!3464) lt!442535 lt!442530 mask!3464))))))

(declare-fun a!3219 () array!63226)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1001395 (= lt!442535 (select (store (arr!30438 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001395 (= lt!442530 (array!63227 (store (arr!30438 a!3219) i!1194 k0!2224) (size!30942 a!3219)))))

(declare-fun b!1001396 () Bool)

(declare-fun e!564240 () Bool)

(assert (=> b!1001396 (= e!564240 e!564242)))

(declare-fun res!671009 () Bool)

(assert (=> b!1001396 (=> (not res!671009) (not e!564242))))

(declare-fun lt!442537 () SeekEntryResult!9395)

(declare-fun lt!442531 () SeekEntryResult!9395)

(assert (=> b!1001396 (= res!671009 (= lt!442537 lt!442531))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001396 (= lt!442537 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30438 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001397 () Bool)

(declare-fun res!671002 () Bool)

(declare-fun e!564241 () Bool)

(assert (=> b!1001397 (=> (not res!671002) (not e!564241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63226 (_ BitVec 32)) Bool)

(assert (=> b!1001397 (= res!671002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001398 () Bool)

(declare-fun res!671001 () Bool)

(declare-fun e!564244 () Bool)

(assert (=> b!1001398 (=> (not res!671001) (not e!564244))))

(assert (=> b!1001398 (= res!671001 (and (= (size!30942 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30942 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30942 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001399 () Bool)

(declare-fun e!564245 () Bool)

(assert (=> b!1001399 (= e!564243 e!564245)))

(declare-fun res!671011 () Bool)

(assert (=> b!1001399 (=> (not res!671011) (not e!564245))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!442533 () (_ BitVec 32))

(assert (=> b!1001399 (= res!671011 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442533 #b00000000000000000000000000000000) (bvslt lt!442533 (size!30942 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001399 (= lt!442533 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001400 () Bool)

(declare-fun res!671006 () Bool)

(assert (=> b!1001400 (=> (not res!671006) (not e!564244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001400 (= res!671006 (validKeyInArray!0 k0!2224))))

(declare-fun res!670997 () Bool)

(assert (=> start!86478 (=> (not res!670997) (not e!564244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86478 (= res!670997 (validMask!0 mask!3464))))

(assert (=> start!86478 e!564244))

(declare-fun array_inv!23581 (array!63226) Bool)

(assert (=> start!86478 (array_inv!23581 a!3219)))

(assert (=> start!86478 true))

(declare-fun b!1001401 () Bool)

(declare-fun res!671003 () Bool)

(assert (=> b!1001401 (=> (not res!671003) (not e!564241))))

(declare-datatypes ((List!21180 0))(
  ( (Nil!21177) (Cons!21176 (h!22353 (_ BitVec 64)) (t!30172 List!21180)) )
))
(declare-fun arrayNoDuplicates!0 (array!63226 (_ BitVec 32) List!21180) Bool)

(assert (=> b!1001401 (= res!671003 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21177))))

(declare-fun b!1001402 () Bool)

(declare-fun res!671010 () Bool)

(assert (=> b!1001402 (=> (not res!671010) (not e!564245))))

(assert (=> b!1001402 (= res!671010 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442533 (select (arr!30438 a!3219) j!170) a!3219 mask!3464) lt!442531))))

(declare-fun b!1001403 () Bool)

(declare-fun res!671000 () Bool)

(assert (=> b!1001403 (=> (not res!671000) (not e!564244))))

(declare-fun arrayContainsKey!0 (array!63226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001403 (= res!671000 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001404 () Bool)

(declare-fun res!671008 () Bool)

(assert (=> b!1001404 (=> (not res!671008) (not e!564243))))

(assert (=> b!1001404 (= res!671008 (not (= lt!442537 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442535 lt!442530 mask!3464))))))

(declare-fun b!1001405 () Bool)

(declare-fun res!671004 () Bool)

(assert (=> b!1001405 (=> (not res!671004) (not e!564244))))

(assert (=> b!1001405 (= res!671004 (validKeyInArray!0 (select (arr!30438 a!3219) j!170)))))

(declare-fun b!1001406 () Bool)

(assert (=> b!1001406 (= e!564241 e!564240)))

(declare-fun res!671012 () Bool)

(assert (=> b!1001406 (=> (not res!671012) (not e!564240))))

(assert (=> b!1001406 (= res!671012 (= lt!442536 lt!442531))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001406 (= lt!442531 (Intermediate!9395 false resIndex!38 resX!38))))

(assert (=> b!1001406 (= lt!442536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30438 a!3219) j!170) mask!3464) (select (arr!30438 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001407 () Bool)

(assert (=> b!1001407 (= e!564245 false)))

(declare-fun lt!442532 () SeekEntryResult!9395)

(assert (=> b!1001407 (= lt!442532 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442533 lt!442535 lt!442530 mask!3464))))

(declare-fun b!1001408 () Bool)

(declare-fun res!671007 () Bool)

(assert (=> b!1001408 (=> (not res!671007) (not e!564241))))

(assert (=> b!1001408 (= res!671007 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30942 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30942 a!3219))))))

(declare-fun b!1001409 () Bool)

(declare-fun res!671005 () Bool)

(assert (=> b!1001409 (=> (not res!671005) (not e!564243))))

(assert (=> b!1001409 (= res!671005 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001410 () Bool)

(assert (=> b!1001410 (= e!564244 e!564241)))

(declare-fun res!670998 () Bool)

(assert (=> b!1001410 (=> (not res!670998) (not e!564241))))

(declare-fun lt!442534 () SeekEntryResult!9395)

(assert (=> b!1001410 (= res!670998 (or (= lt!442534 (MissingVacant!9395 i!1194)) (= lt!442534 (MissingZero!9395 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63226 (_ BitVec 32)) SeekEntryResult!9395)

(assert (=> b!1001410 (= lt!442534 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86478 res!670997) b!1001398))

(assert (= (and b!1001398 res!671001) b!1001405))

(assert (= (and b!1001405 res!671004) b!1001400))

(assert (= (and b!1001400 res!671006) b!1001403))

(assert (= (and b!1001403 res!671000) b!1001410))

(assert (= (and b!1001410 res!670998) b!1001397))

(assert (= (and b!1001397 res!671002) b!1001401))

(assert (= (and b!1001401 res!671003) b!1001408))

(assert (= (and b!1001408 res!671007) b!1001406))

(assert (= (and b!1001406 res!671012) b!1001396))

(assert (= (and b!1001396 res!671009) b!1001395))

(assert (= (and b!1001395 res!670999) b!1001404))

(assert (= (and b!1001404 res!671008) b!1001409))

(assert (= (and b!1001409 res!671005) b!1001399))

(assert (= (and b!1001399 res!671011) b!1001402))

(assert (= (and b!1001402 res!671010) b!1001407))

(declare-fun m!926899 () Bool)

(assert (=> b!1001401 m!926899))

(declare-fun m!926901 () Bool)

(assert (=> b!1001400 m!926901))

(declare-fun m!926903 () Bool)

(assert (=> b!1001404 m!926903))

(declare-fun m!926905 () Bool)

(assert (=> b!1001405 m!926905))

(assert (=> b!1001405 m!926905))

(declare-fun m!926907 () Bool)

(assert (=> b!1001405 m!926907))

(declare-fun m!926909 () Bool)

(assert (=> b!1001410 m!926909))

(assert (=> b!1001402 m!926905))

(assert (=> b!1001402 m!926905))

(declare-fun m!926911 () Bool)

(assert (=> b!1001402 m!926911))

(declare-fun m!926913 () Bool)

(assert (=> start!86478 m!926913))

(declare-fun m!926915 () Bool)

(assert (=> start!86478 m!926915))

(declare-fun m!926917 () Bool)

(assert (=> b!1001395 m!926917))

(assert (=> b!1001395 m!926917))

(declare-fun m!926919 () Bool)

(assert (=> b!1001395 m!926919))

(declare-fun m!926921 () Bool)

(assert (=> b!1001395 m!926921))

(declare-fun m!926923 () Bool)

(assert (=> b!1001395 m!926923))

(declare-fun m!926925 () Bool)

(assert (=> b!1001403 m!926925))

(assert (=> b!1001406 m!926905))

(assert (=> b!1001406 m!926905))

(declare-fun m!926927 () Bool)

(assert (=> b!1001406 m!926927))

(assert (=> b!1001406 m!926927))

(assert (=> b!1001406 m!926905))

(declare-fun m!926929 () Bool)

(assert (=> b!1001406 m!926929))

(declare-fun m!926931 () Bool)

(assert (=> b!1001397 m!926931))

(declare-fun m!926933 () Bool)

(assert (=> b!1001399 m!926933))

(declare-fun m!926935 () Bool)

(assert (=> b!1001407 m!926935))

(assert (=> b!1001396 m!926905))

(assert (=> b!1001396 m!926905))

(declare-fun m!926937 () Bool)

(assert (=> b!1001396 m!926937))

(check-sat (not b!1001402) (not b!1001405) (not b!1001395) (not b!1001403) (not b!1001400) (not b!1001401) (not b!1001399) (not b!1001404) (not b!1001410) (not b!1001407) (not b!1001397) (not b!1001406) (not b!1001396) (not start!86478))
(check-sat)
