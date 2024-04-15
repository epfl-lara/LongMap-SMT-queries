; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86766 () Bool)

(assert start!86766)

(declare-fun b!1005804 () Bool)

(declare-fun res!675024 () Bool)

(declare-fun e!566214 () Bool)

(assert (=> b!1005804 (=> (not res!675024) (not e!566214))))

(declare-datatypes ((array!63412 0))(
  ( (array!63413 (arr!30528 (Array (_ BitVec 32) (_ BitVec 64))) (size!31032 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63412)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005804 (= res!675024 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31032 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31032 a!3219))))))

(declare-fun b!1005805 () Bool)

(declare-fun e!566215 () Bool)

(assert (=> b!1005805 (= e!566215 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!444441 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005805 (= lt!444441 (toIndex!0 (select (store (arr!30528 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!1005806 () Bool)

(declare-fun res!675025 () Bool)

(assert (=> b!1005806 (=> (not res!675025) (not e!566214))))

(declare-datatypes ((List!21270 0))(
  ( (Nil!21267) (Cons!21266 (h!22449 (_ BitVec 64)) (t!30262 List!21270)) )
))
(declare-fun arrayNoDuplicates!0 (array!63412 (_ BitVec 32) List!21270) Bool)

(assert (=> b!1005806 (= res!675025 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21267))))

(declare-fun b!1005807 () Bool)

(declare-fun res!675021 () Bool)

(declare-fun e!566216 () Bool)

(assert (=> b!1005807 (=> (not res!675021) (not e!566216))))

(assert (=> b!1005807 (= res!675021 (and (= (size!31032 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31032 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31032 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005808 () Bool)

(assert (=> b!1005808 (= e!566216 e!566214)))

(declare-fun res!675018 () Bool)

(assert (=> b!1005808 (=> (not res!675018) (not e!566214))))

(declare-datatypes ((SeekEntryResult!9485 0))(
  ( (MissingZero!9485 (index!40311 (_ BitVec 32))) (Found!9485 (index!40312 (_ BitVec 32))) (Intermediate!9485 (undefined!10297 Bool) (index!40313 (_ BitVec 32)) (x!87728 (_ BitVec 32))) (Undefined!9485) (MissingVacant!9485 (index!40314 (_ BitVec 32))) )
))
(declare-fun lt!444442 () SeekEntryResult!9485)

(assert (=> b!1005808 (= res!675018 (or (= lt!444442 (MissingVacant!9485 i!1194)) (= lt!444442 (MissingZero!9485 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63412 (_ BitVec 32)) SeekEntryResult!9485)

(assert (=> b!1005808 (= lt!444442 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005809 () Bool)

(declare-fun res!675017 () Bool)

(assert (=> b!1005809 (=> (not res!675017) (not e!566214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63412 (_ BitVec 32)) Bool)

(assert (=> b!1005809 (= res!675017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005810 () Bool)

(declare-fun res!675016 () Bool)

(assert (=> b!1005810 (=> (not res!675016) (not e!566216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005810 (= res!675016 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005811 () Bool)

(assert (=> b!1005811 (= e!566214 e!566215)))

(declare-fun res!675019 () Bool)

(assert (=> b!1005811 (=> (not res!675019) (not e!566215))))

(declare-fun lt!444440 () SeekEntryResult!9485)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63412 (_ BitVec 32)) SeekEntryResult!9485)

(assert (=> b!1005811 (= res!675019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30528 a!3219) j!170) mask!3464) (select (arr!30528 a!3219) j!170) a!3219 mask!3464) lt!444440))))

(assert (=> b!1005811 (= lt!444440 (Intermediate!9485 false resIndex!38 resX!38))))

(declare-fun b!1005812 () Bool)

(declare-fun res!675023 () Bool)

(assert (=> b!1005812 (=> (not res!675023) (not e!566216))))

(assert (=> b!1005812 (= res!675023 (validKeyInArray!0 (select (arr!30528 a!3219) j!170)))))

(declare-fun res!675026 () Bool)

(assert (=> start!86766 (=> (not res!675026) (not e!566216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86766 (= res!675026 (validMask!0 mask!3464))))

(assert (=> start!86766 e!566216))

(declare-fun array_inv!23671 (array!63412) Bool)

(assert (=> start!86766 (array_inv!23671 a!3219)))

(assert (=> start!86766 true))

(declare-fun b!1005813 () Bool)

(declare-fun res!675022 () Bool)

(assert (=> b!1005813 (=> (not res!675022) (not e!566215))))

(assert (=> b!1005813 (= res!675022 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30528 a!3219) j!170) a!3219 mask!3464) lt!444440))))

(declare-fun b!1005814 () Bool)

(declare-fun res!675020 () Bool)

(assert (=> b!1005814 (=> (not res!675020) (not e!566216))))

(declare-fun arrayContainsKey!0 (array!63412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005814 (= res!675020 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86766 res!675026) b!1005807))

(assert (= (and b!1005807 res!675021) b!1005812))

(assert (= (and b!1005812 res!675023) b!1005810))

(assert (= (and b!1005810 res!675016) b!1005814))

(assert (= (and b!1005814 res!675020) b!1005808))

(assert (= (and b!1005808 res!675018) b!1005809))

(assert (= (and b!1005809 res!675017) b!1005806))

(assert (= (and b!1005806 res!675025) b!1005804))

(assert (= (and b!1005804 res!675024) b!1005811))

(assert (= (and b!1005811 res!675019) b!1005813))

(assert (= (and b!1005813 res!675022) b!1005805))

(declare-fun m!930415 () Bool)

(assert (=> b!1005813 m!930415))

(assert (=> b!1005813 m!930415))

(declare-fun m!930417 () Bool)

(assert (=> b!1005813 m!930417))

(declare-fun m!930419 () Bool)

(assert (=> b!1005814 m!930419))

(declare-fun m!930421 () Bool)

(assert (=> b!1005809 m!930421))

(assert (=> b!1005811 m!930415))

(assert (=> b!1005811 m!930415))

(declare-fun m!930423 () Bool)

(assert (=> b!1005811 m!930423))

(assert (=> b!1005811 m!930423))

(assert (=> b!1005811 m!930415))

(declare-fun m!930425 () Bool)

(assert (=> b!1005811 m!930425))

(declare-fun m!930427 () Bool)

(assert (=> start!86766 m!930427))

(declare-fun m!930429 () Bool)

(assert (=> start!86766 m!930429))

(declare-fun m!930431 () Bool)

(assert (=> b!1005806 m!930431))

(assert (=> b!1005812 m!930415))

(assert (=> b!1005812 m!930415))

(declare-fun m!930433 () Bool)

(assert (=> b!1005812 m!930433))

(declare-fun m!930435 () Bool)

(assert (=> b!1005808 m!930435))

(declare-fun m!930437 () Bool)

(assert (=> b!1005805 m!930437))

(declare-fun m!930439 () Bool)

(assert (=> b!1005805 m!930439))

(assert (=> b!1005805 m!930439))

(declare-fun m!930441 () Bool)

(assert (=> b!1005805 m!930441))

(declare-fun m!930443 () Bool)

(assert (=> b!1005810 m!930443))

(check-sat (not b!1005813) (not b!1005805) (not b!1005810) (not b!1005809) (not b!1005812) (not b!1005811) (not b!1005814) (not b!1005808) (not b!1005806) (not start!86766))
(check-sat)
