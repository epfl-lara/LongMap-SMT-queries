; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86548 () Bool)

(assert start!86548)

(declare-fun b!1003101 () Bool)

(declare-fun e!565027 () Bool)

(declare-fun e!565026 () Bool)

(assert (=> b!1003101 (= e!565027 e!565026)))

(declare-fun res!672583 () Bool)

(assert (=> b!1003101 (=> (not res!672583) (not e!565026))))

(declare-datatypes ((SeekEntryResult!9432 0))(
  ( (MissingZero!9432 (index!40099 (_ BitVec 32))) (Found!9432 (index!40100 (_ BitVec 32))) (Intermediate!9432 (undefined!10244 Bool) (index!40101 (_ BitVec 32)) (x!87508 (_ BitVec 32))) (Undefined!9432) (MissingVacant!9432 (index!40102 (_ BitVec 32))) )
))
(declare-fun lt!443508 () SeekEntryResult!9432)

(declare-fun lt!443513 () SeekEntryResult!9432)

(assert (=> b!1003101 (= res!672583 (= lt!443508 lt!443513))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003101 (= lt!443513 (Intermediate!9432 false resIndex!38 resX!38))))

(declare-datatypes ((array!63349 0))(
  ( (array!63350 (arr!30500 (Array (_ BitVec 32) (_ BitVec 64))) (size!31002 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63349)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63349 (_ BitVec 32)) SeekEntryResult!9432)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003101 (= lt!443508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30500 a!3219) j!170) mask!3464) (select (arr!30500 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003102 () Bool)

(declare-fun res!672589 () Bool)

(declare-fun e!565022 () Bool)

(assert (=> b!1003102 (=> (not res!672589) (not e!565022))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003102 (= res!672589 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003104 () Bool)

(declare-fun res!672581 () Bool)

(assert (=> b!1003104 (=> (not res!672581) (not e!565027))))

(declare-datatypes ((List!21176 0))(
  ( (Nil!21173) (Cons!21172 (h!22349 (_ BitVec 64)) (t!30177 List!21176)) )
))
(declare-fun arrayNoDuplicates!0 (array!63349 (_ BitVec 32) List!21176) Bool)

(assert (=> b!1003104 (= res!672581 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21173))))

(declare-fun b!1003105 () Bool)

(declare-fun e!565021 () Bool)

(assert (=> b!1003105 (= e!565021 e!565022)))

(declare-fun res!672580 () Bool)

(assert (=> b!1003105 (=> (not res!672580) (not e!565022))))

(declare-fun lt!443509 () array!63349)

(declare-fun lt!443511 () (_ BitVec 64))

(assert (=> b!1003105 (= res!672580 (not (= lt!443508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443511 mask!3464) lt!443511 lt!443509 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1003105 (= lt!443511 (select (store (arr!30500 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003105 (= lt!443509 (array!63350 (store (arr!30500 a!3219) i!1194 k0!2224) (size!31002 a!3219)))))

(declare-fun b!1003106 () Bool)

(declare-fun e!565024 () Bool)

(assert (=> b!1003106 (= e!565022 e!565024)))

(declare-fun res!672594 () Bool)

(assert (=> b!1003106 (=> (not res!672594) (not e!565024))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443506 () (_ BitVec 32))

(assert (=> b!1003106 (= res!672594 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443506 #b00000000000000000000000000000000) (bvslt lt!443506 (size!31002 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003106 (= lt!443506 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003107 () Bool)

(declare-fun res!672592 () Bool)

(assert (=> b!1003107 (=> (not res!672592) (not e!565024))))

(assert (=> b!1003107 (= res!672592 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443506 (select (arr!30500 a!3219) j!170) a!3219 mask!3464) lt!443513))))

(declare-fun b!1003108 () Bool)

(assert (=> b!1003108 (= e!565024 false)))

(declare-fun lt!443510 () SeekEntryResult!9432)

(assert (=> b!1003108 (= lt!443510 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443506 lt!443511 lt!443509 mask!3464))))

(declare-fun b!1003109 () Bool)

(declare-fun e!565025 () Bool)

(assert (=> b!1003109 (= e!565025 e!565027)))

(declare-fun res!672588 () Bool)

(assert (=> b!1003109 (=> (not res!672588) (not e!565027))))

(declare-fun lt!443507 () SeekEntryResult!9432)

(assert (=> b!1003109 (= res!672588 (or (= lt!443507 (MissingVacant!9432 i!1194)) (= lt!443507 (MissingZero!9432 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63349 (_ BitVec 32)) SeekEntryResult!9432)

(assert (=> b!1003109 (= lt!443507 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003110 () Bool)

(assert (=> b!1003110 (= e!565026 e!565021)))

(declare-fun res!672579 () Bool)

(assert (=> b!1003110 (=> (not res!672579) (not e!565021))))

(declare-fun lt!443512 () SeekEntryResult!9432)

(assert (=> b!1003110 (= res!672579 (= lt!443512 lt!443513))))

(assert (=> b!1003110 (= lt!443512 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30500 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003111 () Bool)

(declare-fun res!672591 () Bool)

(assert (=> b!1003111 (=> (not res!672591) (not e!565022))))

(assert (=> b!1003111 (= res!672591 (not (= lt!443512 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443511 lt!443509 mask!3464))))))

(declare-fun b!1003112 () Bool)

(declare-fun res!672585 () Bool)

(assert (=> b!1003112 (=> (not res!672585) (not e!565025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003112 (= res!672585 (validKeyInArray!0 (select (arr!30500 a!3219) j!170)))))

(declare-fun res!672593 () Bool)

(assert (=> start!86548 (=> (not res!672593) (not e!565025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86548 (= res!672593 (validMask!0 mask!3464))))

(assert (=> start!86548 e!565025))

(declare-fun array_inv!23624 (array!63349) Bool)

(assert (=> start!86548 (array_inv!23624 a!3219)))

(assert (=> start!86548 true))

(declare-fun b!1003103 () Bool)

(declare-fun res!672582 () Bool)

(assert (=> b!1003103 (=> (not res!672582) (not e!565027))))

(assert (=> b!1003103 (= res!672582 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31002 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31002 a!3219))))))

(declare-fun b!1003113 () Bool)

(declare-fun res!672587 () Bool)

(assert (=> b!1003113 (=> (not res!672587) (not e!565025))))

(assert (=> b!1003113 (= res!672587 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003114 () Bool)

(declare-fun res!672584 () Bool)

(assert (=> b!1003114 (=> (not res!672584) (not e!565025))))

(assert (=> b!1003114 (= res!672584 (and (= (size!31002 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31002 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31002 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003115 () Bool)

(declare-fun res!672586 () Bool)

(assert (=> b!1003115 (=> (not res!672586) (not e!565025))))

(declare-fun arrayContainsKey!0 (array!63349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003115 (= res!672586 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003116 () Bool)

(declare-fun res!672590 () Bool)

(assert (=> b!1003116 (=> (not res!672590) (not e!565027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63349 (_ BitVec 32)) Bool)

(assert (=> b!1003116 (= res!672590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86548 res!672593) b!1003114))

(assert (= (and b!1003114 res!672584) b!1003112))

(assert (= (and b!1003112 res!672585) b!1003113))

(assert (= (and b!1003113 res!672587) b!1003115))

(assert (= (and b!1003115 res!672586) b!1003109))

(assert (= (and b!1003109 res!672588) b!1003116))

(assert (= (and b!1003116 res!672590) b!1003104))

(assert (= (and b!1003104 res!672581) b!1003103))

(assert (= (and b!1003103 res!672582) b!1003101))

(assert (= (and b!1003101 res!672583) b!1003110))

(assert (= (and b!1003110 res!672579) b!1003105))

(assert (= (and b!1003105 res!672580) b!1003111))

(assert (= (and b!1003111 res!672591) b!1003102))

(assert (= (and b!1003102 res!672589) b!1003106))

(assert (= (and b!1003106 res!672594) b!1003107))

(assert (= (and b!1003107 res!672592) b!1003108))

(declare-fun m!928869 () Bool)

(assert (=> b!1003110 m!928869))

(assert (=> b!1003110 m!928869))

(declare-fun m!928871 () Bool)

(assert (=> b!1003110 m!928871))

(declare-fun m!928873 () Bool)

(assert (=> b!1003111 m!928873))

(declare-fun m!928875 () Bool)

(assert (=> b!1003106 m!928875))

(declare-fun m!928877 () Bool)

(assert (=> b!1003108 m!928877))

(declare-fun m!928879 () Bool)

(assert (=> b!1003104 m!928879))

(declare-fun m!928881 () Bool)

(assert (=> b!1003105 m!928881))

(assert (=> b!1003105 m!928881))

(declare-fun m!928883 () Bool)

(assert (=> b!1003105 m!928883))

(declare-fun m!928885 () Bool)

(assert (=> b!1003105 m!928885))

(declare-fun m!928887 () Bool)

(assert (=> b!1003105 m!928887))

(declare-fun m!928889 () Bool)

(assert (=> b!1003115 m!928889))

(declare-fun m!928891 () Bool)

(assert (=> b!1003109 m!928891))

(assert (=> b!1003112 m!928869))

(assert (=> b!1003112 m!928869))

(declare-fun m!928893 () Bool)

(assert (=> b!1003112 m!928893))

(declare-fun m!928895 () Bool)

(assert (=> b!1003116 m!928895))

(assert (=> b!1003101 m!928869))

(assert (=> b!1003101 m!928869))

(declare-fun m!928897 () Bool)

(assert (=> b!1003101 m!928897))

(assert (=> b!1003101 m!928897))

(assert (=> b!1003101 m!928869))

(declare-fun m!928899 () Bool)

(assert (=> b!1003101 m!928899))

(declare-fun m!928901 () Bool)

(assert (=> b!1003113 m!928901))

(assert (=> b!1003107 m!928869))

(assert (=> b!1003107 m!928869))

(declare-fun m!928903 () Bool)

(assert (=> b!1003107 m!928903))

(declare-fun m!928905 () Bool)

(assert (=> start!86548 m!928905))

(declare-fun m!928907 () Bool)

(assert (=> start!86548 m!928907))

(check-sat (not b!1003111) (not b!1003107) (not b!1003104) (not b!1003112) (not start!86548) (not b!1003113) (not b!1003106) (not b!1003109) (not b!1003108) (not b!1003110) (not b!1003116) (not b!1003105) (not b!1003115) (not b!1003101))
(check-sat)
