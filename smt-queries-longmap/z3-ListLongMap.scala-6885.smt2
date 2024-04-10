; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86566 () Bool)

(assert start!86566)

(declare-fun b!1003533 () Bool)

(declare-fun res!673020 () Bool)

(declare-fun e!565213 () Bool)

(assert (=> b!1003533 (=> (not res!673020) (not e!565213))))

(declare-datatypes ((array!63367 0))(
  ( (array!63368 (arr!30509 (Array (_ BitVec 32) (_ BitVec 64))) (size!31011 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63367)

(declare-datatypes ((List!21185 0))(
  ( (Nil!21182) (Cons!21181 (h!22358 (_ BitVec 64)) (t!30186 List!21185)) )
))
(declare-fun arrayNoDuplicates!0 (array!63367 (_ BitVec 32) List!21185) Bool)

(assert (=> b!1003533 (= res!673020 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21182))))

(declare-fun b!1003534 () Bool)

(declare-fun res!673026 () Bool)

(declare-fun e!565212 () Bool)

(assert (=> b!1003534 (=> (not res!673026) (not e!565212))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9441 0))(
  ( (MissingZero!9441 (index!40135 (_ BitVec 32))) (Found!9441 (index!40136 (_ BitVec 32))) (Intermediate!9441 (undefined!10253 Bool) (index!40137 (_ BitVec 32)) (x!87541 (_ BitVec 32))) (Undefined!9441) (MissingVacant!9441 (index!40138 (_ BitVec 32))) )
))
(declare-fun lt!443726 () SeekEntryResult!9441)

(declare-fun lt!443727 () array!63367)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!443724 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63367 (_ BitVec 32)) SeekEntryResult!9441)

(assert (=> b!1003534 (= res!673026 (not (= lt!443726 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443724 lt!443727 mask!3464))))))

(declare-fun b!1003535 () Bool)

(declare-fun e!565214 () Bool)

(assert (=> b!1003535 (= e!565213 e!565214)))

(declare-fun res!673022 () Bool)

(assert (=> b!1003535 (=> (not res!673022) (not e!565214))))

(declare-fun lt!443723 () SeekEntryResult!9441)

(declare-fun lt!443722 () SeekEntryResult!9441)

(assert (=> b!1003535 (= res!673022 (= lt!443723 lt!443722))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003535 (= lt!443722 (Intermediate!9441 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003535 (= lt!443723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30509 a!3219) j!170) mask!3464) (select (arr!30509 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003536 () Bool)

(declare-fun res!673012 () Bool)

(declare-fun e!565216 () Bool)

(assert (=> b!1003536 (=> (not res!673012) (not e!565216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003536 (= res!673012 (validKeyInArray!0 (select (arr!30509 a!3219) j!170)))))

(declare-fun b!1003537 () Bool)

(declare-fun res!673014 () Bool)

(assert (=> b!1003537 (=> (not res!673014) (not e!565212))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003537 (= res!673014 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003538 () Bool)

(declare-fun e!565211 () Bool)

(assert (=> b!1003538 (= e!565214 e!565211)))

(declare-fun res!673011 () Bool)

(assert (=> b!1003538 (=> (not res!673011) (not e!565211))))

(assert (=> b!1003538 (= res!673011 (= lt!443726 lt!443722))))

(assert (=> b!1003538 (= lt!443726 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30509 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003539 () Bool)

(declare-fun res!673015 () Bool)

(assert (=> b!1003539 (=> (not res!673015) (not e!565216))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003539 (= res!673015 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003540 () Bool)

(declare-fun res!673017 () Bool)

(assert (=> b!1003540 (=> (not res!673017) (not e!565213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63367 (_ BitVec 32)) Bool)

(assert (=> b!1003540 (= res!673017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003541 () Bool)

(declare-fun e!565210 () Bool)

(assert (=> b!1003541 (= e!565212 e!565210)))

(declare-fun res!673025 () Bool)

(assert (=> b!1003541 (=> (not res!673025) (not e!565210))))

(declare-fun lt!443729 () (_ BitVec 32))

(assert (=> b!1003541 (= res!673025 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443729 #b00000000000000000000000000000000) (bvslt lt!443729 (size!31011 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003541 (= lt!443729 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003542 () Bool)

(assert (=> b!1003542 (= e!565211 e!565212)))

(declare-fun res!673018 () Bool)

(assert (=> b!1003542 (=> (not res!673018) (not e!565212))))

(assert (=> b!1003542 (= res!673018 (not (= lt!443723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443724 mask!3464) lt!443724 lt!443727 mask!3464))))))

(assert (=> b!1003542 (= lt!443724 (select (store (arr!30509 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003542 (= lt!443727 (array!63368 (store (arr!30509 a!3219) i!1194 k0!2224) (size!31011 a!3219)))))

(declare-fun b!1003543 () Bool)

(declare-fun res!673019 () Bool)

(assert (=> b!1003543 (=> (not res!673019) (not e!565216))))

(assert (=> b!1003543 (= res!673019 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003544 () Bool)

(assert (=> b!1003544 (= e!565216 e!565213)))

(declare-fun res!673016 () Bool)

(assert (=> b!1003544 (=> (not res!673016) (not e!565213))))

(declare-fun lt!443728 () SeekEntryResult!9441)

(assert (=> b!1003544 (= res!673016 (or (= lt!443728 (MissingVacant!9441 i!1194)) (= lt!443728 (MissingZero!9441 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63367 (_ BitVec 32)) SeekEntryResult!9441)

(assert (=> b!1003544 (= lt!443728 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003545 () Bool)

(declare-fun res!673021 () Bool)

(assert (=> b!1003545 (=> (not res!673021) (not e!565210))))

(assert (=> b!1003545 (= res!673021 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443729 (select (arr!30509 a!3219) j!170) a!3219 mask!3464) lt!443722))))

(declare-fun b!1003546 () Bool)

(assert (=> b!1003546 (= e!565210 false)))

(declare-fun lt!443725 () SeekEntryResult!9441)

(assert (=> b!1003546 (= lt!443725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443729 lt!443724 lt!443727 mask!3464))))

(declare-fun b!1003547 () Bool)

(declare-fun res!673023 () Bool)

(assert (=> b!1003547 (=> (not res!673023) (not e!565213))))

(assert (=> b!1003547 (= res!673023 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31011 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31011 a!3219))))))

(declare-fun res!673024 () Bool)

(assert (=> start!86566 (=> (not res!673024) (not e!565216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86566 (= res!673024 (validMask!0 mask!3464))))

(assert (=> start!86566 e!565216))

(declare-fun array_inv!23633 (array!63367) Bool)

(assert (=> start!86566 (array_inv!23633 a!3219)))

(assert (=> start!86566 true))

(declare-fun b!1003548 () Bool)

(declare-fun res!673013 () Bool)

(assert (=> b!1003548 (=> (not res!673013) (not e!565216))))

(assert (=> b!1003548 (= res!673013 (and (= (size!31011 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31011 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31011 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86566 res!673024) b!1003548))

(assert (= (and b!1003548 res!673013) b!1003536))

(assert (= (and b!1003536 res!673012) b!1003543))

(assert (= (and b!1003543 res!673019) b!1003539))

(assert (= (and b!1003539 res!673015) b!1003544))

(assert (= (and b!1003544 res!673016) b!1003540))

(assert (= (and b!1003540 res!673017) b!1003533))

(assert (= (and b!1003533 res!673020) b!1003547))

(assert (= (and b!1003547 res!673023) b!1003535))

(assert (= (and b!1003535 res!673022) b!1003538))

(assert (= (and b!1003538 res!673011) b!1003542))

(assert (= (and b!1003542 res!673018) b!1003534))

(assert (= (and b!1003534 res!673026) b!1003537))

(assert (= (and b!1003537 res!673014) b!1003541))

(assert (= (and b!1003541 res!673025) b!1003545))

(assert (= (and b!1003545 res!673021) b!1003546))

(declare-fun m!929229 () Bool)

(assert (=> b!1003543 m!929229))

(declare-fun m!929231 () Bool)

(assert (=> b!1003533 m!929231))

(declare-fun m!929233 () Bool)

(assert (=> b!1003539 m!929233))

(declare-fun m!929235 () Bool)

(assert (=> b!1003536 m!929235))

(assert (=> b!1003536 m!929235))

(declare-fun m!929237 () Bool)

(assert (=> b!1003536 m!929237))

(declare-fun m!929239 () Bool)

(assert (=> b!1003546 m!929239))

(declare-fun m!929241 () Bool)

(assert (=> b!1003541 m!929241))

(assert (=> b!1003545 m!929235))

(assert (=> b!1003545 m!929235))

(declare-fun m!929243 () Bool)

(assert (=> b!1003545 m!929243))

(declare-fun m!929245 () Bool)

(assert (=> b!1003540 m!929245))

(declare-fun m!929247 () Bool)

(assert (=> b!1003542 m!929247))

(assert (=> b!1003542 m!929247))

(declare-fun m!929249 () Bool)

(assert (=> b!1003542 m!929249))

(declare-fun m!929251 () Bool)

(assert (=> b!1003542 m!929251))

(declare-fun m!929253 () Bool)

(assert (=> b!1003542 m!929253))

(assert (=> b!1003538 m!929235))

(assert (=> b!1003538 m!929235))

(declare-fun m!929255 () Bool)

(assert (=> b!1003538 m!929255))

(declare-fun m!929257 () Bool)

(assert (=> b!1003534 m!929257))

(declare-fun m!929259 () Bool)

(assert (=> b!1003544 m!929259))

(assert (=> b!1003535 m!929235))

(assert (=> b!1003535 m!929235))

(declare-fun m!929261 () Bool)

(assert (=> b!1003535 m!929261))

(assert (=> b!1003535 m!929261))

(assert (=> b!1003535 m!929235))

(declare-fun m!929263 () Bool)

(assert (=> b!1003535 m!929263))

(declare-fun m!929265 () Bool)

(assert (=> start!86566 m!929265))

(declare-fun m!929267 () Bool)

(assert (=> start!86566 m!929267))

(check-sat (not b!1003543) (not b!1003535) (not b!1003536) (not b!1003539) (not b!1003533) (not start!86566) (not b!1003542) (not b!1003544) (not b!1003538) (not b!1003545) (not b!1003540) (not b!1003534) (not b!1003541) (not b!1003546))
(check-sat)
