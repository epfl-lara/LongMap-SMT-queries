; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86920 () Bool)

(assert start!86920)

(declare-fun b!1008096 () Bool)

(declare-fun res!676992 () Bool)

(declare-fun e!567266 () Bool)

(assert (=> b!1008096 (=> (not res!676992) (not e!567266))))

(declare-datatypes ((array!63568 0))(
  ( (array!63569 (arr!30605 (Array (_ BitVec 32) (_ BitVec 64))) (size!31107 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63568)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008096 (= res!676992 (validKeyInArray!0 (select (arr!30605 a!3219) j!170)))))

(declare-fun b!1008097 () Bool)

(declare-fun res!676999 () Bool)

(declare-fun e!567270 () Bool)

(assert (=> b!1008097 (=> (not res!676999) (not e!567270))))

(declare-datatypes ((List!21281 0))(
  ( (Nil!21278) (Cons!21277 (h!22463 (_ BitVec 64)) (t!30282 List!21281)) )
))
(declare-fun arrayNoDuplicates!0 (array!63568 (_ BitVec 32) List!21281) Bool)

(assert (=> b!1008097 (= res!676999 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21278))))

(declare-fun b!1008098 () Bool)

(declare-fun e!567271 () Bool)

(assert (=> b!1008098 (= e!567271 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445532 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008098 (= lt!445532 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008099 () Bool)

(declare-fun res!676998 () Bool)

(assert (=> b!1008099 (=> (not res!676998) (not e!567271))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008099 (= res!676998 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008100 () Bool)

(declare-fun e!567269 () Bool)

(assert (=> b!1008100 (= e!567270 e!567269)))

(declare-fun res!676990 () Bool)

(assert (=> b!1008100 (=> (not res!676990) (not e!567269))))

(declare-datatypes ((SeekEntryResult!9537 0))(
  ( (MissingZero!9537 (index!40519 (_ BitVec 32))) (Found!9537 (index!40520 (_ BitVec 32))) (Intermediate!9537 (undefined!10349 Bool) (index!40521 (_ BitVec 32)) (x!87911 (_ BitVec 32))) (Undefined!9537) (MissingVacant!9537 (index!40522 (_ BitVec 32))) )
))
(declare-fun lt!445531 () SeekEntryResult!9537)

(declare-fun lt!445526 () SeekEntryResult!9537)

(assert (=> b!1008100 (= res!676990 (= lt!445531 lt!445526))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008100 (= lt!445526 (Intermediate!9537 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63568 (_ BitVec 32)) SeekEntryResult!9537)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008100 (= lt!445531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30605 a!3219) j!170) mask!3464) (select (arr!30605 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008101 () Bool)

(declare-fun e!567267 () Bool)

(assert (=> b!1008101 (= e!567269 e!567267)))

(declare-fun res!676995 () Bool)

(assert (=> b!1008101 (=> (not res!676995) (not e!567267))))

(declare-fun lt!445530 () SeekEntryResult!9537)

(assert (=> b!1008101 (= res!676995 (= lt!445530 lt!445526))))

(assert (=> b!1008101 (= lt!445530 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30605 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008102 () Bool)

(declare-fun res!676991 () Bool)

(assert (=> b!1008102 (=> (not res!676991) (not e!567270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63568 (_ BitVec 32)) Bool)

(assert (=> b!1008102 (= res!676991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008103 () Bool)

(declare-fun res!676997 () Bool)

(assert (=> b!1008103 (=> (not res!676997) (not e!567266))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1008103 (= res!676997 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008104 () Bool)

(declare-fun res!676988 () Bool)

(assert (=> b!1008104 (=> (not res!676988) (not e!567266))))

(declare-fun arrayContainsKey!0 (array!63568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008104 (= res!676988 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008105 () Bool)

(assert (=> b!1008105 (= e!567266 e!567270)))

(declare-fun res!677001 () Bool)

(assert (=> b!1008105 (=> (not res!677001) (not e!567270))))

(declare-fun lt!445528 () SeekEntryResult!9537)

(assert (=> b!1008105 (= res!677001 (or (= lt!445528 (MissingVacant!9537 i!1194)) (= lt!445528 (MissingZero!9537 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63568 (_ BitVec 32)) SeekEntryResult!9537)

(assert (=> b!1008105 (= lt!445528 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008106 () Bool)

(declare-fun res!676993 () Bool)

(assert (=> b!1008106 (=> (not res!676993) (not e!567270))))

(assert (=> b!1008106 (= res!676993 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31107 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31107 a!3219))))))

(declare-fun b!1008095 () Bool)

(assert (=> b!1008095 (= e!567267 e!567271)))

(declare-fun res!677000 () Bool)

(assert (=> b!1008095 (=> (not res!677000) (not e!567271))))

(declare-fun lt!445527 () (_ BitVec 64))

(declare-fun lt!445529 () array!63568)

(assert (=> b!1008095 (= res!677000 (not (= lt!445531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445527 mask!3464) lt!445527 lt!445529 mask!3464))))))

(assert (=> b!1008095 (= lt!445527 (select (store (arr!30605 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008095 (= lt!445529 (array!63569 (store (arr!30605 a!3219) i!1194 k0!2224) (size!31107 a!3219)))))

(declare-fun res!676996 () Bool)

(assert (=> start!86920 (=> (not res!676996) (not e!567266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86920 (= res!676996 (validMask!0 mask!3464))))

(assert (=> start!86920 e!567266))

(declare-fun array_inv!23729 (array!63568) Bool)

(assert (=> start!86920 (array_inv!23729 a!3219)))

(assert (=> start!86920 true))

(declare-fun b!1008107 () Bool)

(declare-fun res!676989 () Bool)

(assert (=> b!1008107 (=> (not res!676989) (not e!567271))))

(assert (=> b!1008107 (= res!676989 (not (= lt!445530 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445527 lt!445529 mask!3464))))))

(declare-fun b!1008108 () Bool)

(declare-fun res!676994 () Bool)

(assert (=> b!1008108 (=> (not res!676994) (not e!567266))))

(assert (=> b!1008108 (= res!676994 (and (= (size!31107 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31107 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31107 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86920 res!676996) b!1008108))

(assert (= (and b!1008108 res!676994) b!1008096))

(assert (= (and b!1008096 res!676992) b!1008103))

(assert (= (and b!1008103 res!676997) b!1008104))

(assert (= (and b!1008104 res!676988) b!1008105))

(assert (= (and b!1008105 res!677001) b!1008102))

(assert (= (and b!1008102 res!676991) b!1008097))

(assert (= (and b!1008097 res!676999) b!1008106))

(assert (= (and b!1008106 res!676993) b!1008100))

(assert (= (and b!1008100 res!676990) b!1008101))

(assert (= (and b!1008101 res!676995) b!1008095))

(assert (= (and b!1008095 res!677000) b!1008107))

(assert (= (and b!1008107 res!676989) b!1008099))

(assert (= (and b!1008099 res!676998) b!1008098))

(declare-fun m!932891 () Bool)

(assert (=> b!1008097 m!932891))

(declare-fun m!932893 () Bool)

(assert (=> b!1008096 m!932893))

(assert (=> b!1008096 m!932893))

(declare-fun m!932895 () Bool)

(assert (=> b!1008096 m!932895))

(declare-fun m!932897 () Bool)

(assert (=> b!1008098 m!932897))

(declare-fun m!932899 () Bool)

(assert (=> b!1008104 m!932899))

(declare-fun m!932901 () Bool)

(assert (=> start!86920 m!932901))

(declare-fun m!932903 () Bool)

(assert (=> start!86920 m!932903))

(declare-fun m!932905 () Bool)

(assert (=> b!1008105 m!932905))

(assert (=> b!1008100 m!932893))

(assert (=> b!1008100 m!932893))

(declare-fun m!932907 () Bool)

(assert (=> b!1008100 m!932907))

(assert (=> b!1008100 m!932907))

(assert (=> b!1008100 m!932893))

(declare-fun m!932909 () Bool)

(assert (=> b!1008100 m!932909))

(declare-fun m!932911 () Bool)

(assert (=> b!1008102 m!932911))

(declare-fun m!932913 () Bool)

(assert (=> b!1008103 m!932913))

(declare-fun m!932915 () Bool)

(assert (=> b!1008107 m!932915))

(declare-fun m!932917 () Bool)

(assert (=> b!1008095 m!932917))

(assert (=> b!1008095 m!932917))

(declare-fun m!932919 () Bool)

(assert (=> b!1008095 m!932919))

(declare-fun m!932921 () Bool)

(assert (=> b!1008095 m!932921))

(declare-fun m!932923 () Bool)

(assert (=> b!1008095 m!932923))

(assert (=> b!1008101 m!932893))

(assert (=> b!1008101 m!932893))

(declare-fun m!932925 () Bool)

(assert (=> b!1008101 m!932925))

(check-sat (not b!1008102) (not start!86920) (not b!1008095) (not b!1008103) (not b!1008100) (not b!1008105) (not b!1008096) (not b!1008104) (not b!1008098) (not b!1008101) (not b!1008097) (not b!1008107))
(check-sat)
