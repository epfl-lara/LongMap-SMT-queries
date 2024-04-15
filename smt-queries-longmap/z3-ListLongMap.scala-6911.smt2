; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86874 () Bool)

(assert start!86874)

(declare-fun res!676109 () Bool)

(declare-fun e!566794 () Bool)

(assert (=> start!86874 (=> (not res!676109) (not e!566794))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86874 (= res!676109 (validMask!0 mask!3464))))

(assert (=> start!86874 e!566794))

(declare-datatypes ((array!63469 0))(
  ( (array!63470 (arr!30555 (Array (_ BitVec 32) (_ BitVec 64))) (size!31059 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63469)

(declare-fun array_inv!23698 (array!63469) Bool)

(assert (=> start!86874 (array_inv!23698 a!3219)))

(assert (=> start!86874 true))

(declare-fun b!1007079 () Bool)

(declare-fun res!676108 () Bool)

(assert (=> b!1007079 (=> (not res!676108) (not e!566794))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007079 (= res!676108 (validKeyInArray!0 (select (arr!30555 a!3219) j!170)))))

(declare-fun b!1007080 () Bool)

(declare-fun e!566793 () Bool)

(assert (=> b!1007080 (= e!566794 e!566793)))

(declare-fun res!676104 () Bool)

(assert (=> b!1007080 (=> (not res!676104) (not e!566793))))

(declare-datatypes ((SeekEntryResult!9512 0))(
  ( (MissingZero!9512 (index!40419 (_ BitVec 32))) (Found!9512 (index!40420 (_ BitVec 32))) (Intermediate!9512 (undefined!10324 Bool) (index!40421 (_ BitVec 32)) (x!87833 (_ BitVec 32))) (Undefined!9512) (MissingVacant!9512 (index!40422 (_ BitVec 32))) )
))
(declare-fun lt!444897 () SeekEntryResult!9512)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007080 (= res!676104 (or (= lt!444897 (MissingVacant!9512 i!1194)) (= lt!444897 (MissingZero!9512 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63469 (_ BitVec 32)) SeekEntryResult!9512)

(assert (=> b!1007080 (= lt!444897 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007081 () Bool)

(declare-fun e!566796 () Bool)

(declare-fun e!566797 () Bool)

(assert (=> b!1007081 (= e!566796 e!566797)))

(declare-fun res!676098 () Bool)

(assert (=> b!1007081 (=> (not res!676098) (not e!566797))))

(declare-fun lt!444899 () array!63469)

(declare-fun lt!444896 () SeekEntryResult!9512)

(declare-fun lt!444900 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63469 (_ BitVec 32)) SeekEntryResult!9512)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007081 (= res!676098 (not (= lt!444896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444900 mask!3464) lt!444900 lt!444899 mask!3464))))))

(assert (=> b!1007081 (= lt!444900 (select (store (arr!30555 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007081 (= lt!444899 (array!63470 (store (arr!30555 a!3219) i!1194 k0!2224) (size!31059 a!3219)))))

(declare-fun b!1007082 () Bool)

(declare-fun res!676100 () Bool)

(assert (=> b!1007082 (=> (not res!676100) (not e!566794))))

(declare-fun arrayContainsKey!0 (array!63469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007082 (= res!676100 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007083 () Bool)

(declare-fun e!566795 () Bool)

(assert (=> b!1007083 (= e!566793 e!566795)))

(declare-fun res!676099 () Bool)

(assert (=> b!1007083 (=> (not res!676099) (not e!566795))))

(declare-fun lt!444901 () SeekEntryResult!9512)

(assert (=> b!1007083 (= res!676099 (= lt!444896 lt!444901))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007083 (= lt!444901 (Intermediate!9512 false resIndex!38 resX!38))))

(assert (=> b!1007083 (= lt!444896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30555 a!3219) j!170) mask!3464) (select (arr!30555 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007084 () Bool)

(declare-fun res!676102 () Bool)

(assert (=> b!1007084 (=> (not res!676102) (not e!566793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63469 (_ BitVec 32)) Bool)

(assert (=> b!1007084 (= res!676102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007085 () Bool)

(declare-fun res!676106 () Bool)

(assert (=> b!1007085 (=> (not res!676106) (not e!566794))))

(assert (=> b!1007085 (= res!676106 (and (= (size!31059 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31059 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31059 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007086 () Bool)

(declare-fun res!676101 () Bool)

(assert (=> b!1007086 (=> (not res!676101) (not e!566797))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1007086 (= res!676101 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007087 () Bool)

(declare-fun res!676105 () Bool)

(assert (=> b!1007087 (=> (not res!676105) (not e!566797))))

(declare-fun lt!444898 () SeekEntryResult!9512)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007087 (= res!676105 (not (= lt!444898 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444900 lt!444899 mask!3464))))))

(declare-fun b!1007088 () Bool)

(assert (=> b!1007088 (= e!566795 e!566796)))

(declare-fun res!676096 () Bool)

(assert (=> b!1007088 (=> (not res!676096) (not e!566796))))

(assert (=> b!1007088 (= res!676096 (= lt!444898 lt!444901))))

(assert (=> b!1007088 (= lt!444898 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30555 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007089 () Bool)

(assert (=> b!1007089 (= e!566797 false)))

(declare-fun lt!444895 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007089 (= lt!444895 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007090 () Bool)

(declare-fun res!676107 () Bool)

(assert (=> b!1007090 (=> (not res!676107) (not e!566794))))

(assert (=> b!1007090 (= res!676107 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007091 () Bool)

(declare-fun res!676097 () Bool)

(assert (=> b!1007091 (=> (not res!676097) (not e!566793))))

(declare-datatypes ((List!21297 0))(
  ( (Nil!21294) (Cons!21293 (h!22479 (_ BitVec 64)) (t!30289 List!21297)) )
))
(declare-fun arrayNoDuplicates!0 (array!63469 (_ BitVec 32) List!21297) Bool)

(assert (=> b!1007091 (= res!676097 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21294))))

(declare-fun b!1007092 () Bool)

(declare-fun res!676103 () Bool)

(assert (=> b!1007092 (=> (not res!676103) (not e!566793))))

(assert (=> b!1007092 (= res!676103 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31059 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31059 a!3219))))))

(assert (= (and start!86874 res!676109) b!1007085))

(assert (= (and b!1007085 res!676106) b!1007079))

(assert (= (and b!1007079 res!676108) b!1007090))

(assert (= (and b!1007090 res!676107) b!1007082))

(assert (= (and b!1007082 res!676100) b!1007080))

(assert (= (and b!1007080 res!676104) b!1007084))

(assert (= (and b!1007084 res!676102) b!1007091))

(assert (= (and b!1007091 res!676097) b!1007092))

(assert (= (and b!1007092 res!676103) b!1007083))

(assert (= (and b!1007083 res!676099) b!1007088))

(assert (= (and b!1007088 res!676096) b!1007081))

(assert (= (and b!1007081 res!676098) b!1007087))

(assert (= (and b!1007087 res!676105) b!1007086))

(assert (= (and b!1007086 res!676101) b!1007089))

(declare-fun m!931477 () Bool)

(assert (=> b!1007091 m!931477))

(declare-fun m!931479 () Bool)

(assert (=> b!1007088 m!931479))

(assert (=> b!1007088 m!931479))

(declare-fun m!931481 () Bool)

(assert (=> b!1007088 m!931481))

(declare-fun m!931483 () Bool)

(assert (=> b!1007084 m!931483))

(declare-fun m!931485 () Bool)

(assert (=> b!1007087 m!931485))

(declare-fun m!931487 () Bool)

(assert (=> b!1007080 m!931487))

(declare-fun m!931489 () Bool)

(assert (=> b!1007090 m!931489))

(assert (=> b!1007079 m!931479))

(assert (=> b!1007079 m!931479))

(declare-fun m!931491 () Bool)

(assert (=> b!1007079 m!931491))

(declare-fun m!931493 () Bool)

(assert (=> b!1007089 m!931493))

(declare-fun m!931495 () Bool)

(assert (=> start!86874 m!931495))

(declare-fun m!931497 () Bool)

(assert (=> start!86874 m!931497))

(assert (=> b!1007083 m!931479))

(assert (=> b!1007083 m!931479))

(declare-fun m!931499 () Bool)

(assert (=> b!1007083 m!931499))

(assert (=> b!1007083 m!931499))

(assert (=> b!1007083 m!931479))

(declare-fun m!931501 () Bool)

(assert (=> b!1007083 m!931501))

(declare-fun m!931503 () Bool)

(assert (=> b!1007082 m!931503))

(declare-fun m!931505 () Bool)

(assert (=> b!1007081 m!931505))

(assert (=> b!1007081 m!931505))

(declare-fun m!931507 () Bool)

(assert (=> b!1007081 m!931507))

(declare-fun m!931509 () Bool)

(assert (=> b!1007081 m!931509))

(declare-fun m!931511 () Bool)

(assert (=> b!1007081 m!931511))

(check-sat (not b!1007079) (not b!1007091) (not start!86874) (not b!1007084) (not b!1007082) (not b!1007083) (not b!1007088) (not b!1007080) (not b!1007089) (not b!1007081) (not b!1007087) (not b!1007090))
(check-sat)
