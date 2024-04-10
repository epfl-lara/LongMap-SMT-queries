; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86398 () Bool)

(assert start!86398)

(declare-fun b!999940 () Bool)

(declare-fun res!669424 () Bool)

(declare-fun e!563720 () Bool)

(assert (=> b!999940 (=> (not res!669424) (not e!563720))))

(declare-datatypes ((array!63199 0))(
  ( (array!63200 (arr!30425 (Array (_ BitVec 32) (_ BitVec 64))) (size!30927 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63199)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999940 (= res!669424 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999941 () Bool)

(declare-fun res!669426 () Bool)

(declare-fun e!563722 () Bool)

(assert (=> b!999941 (=> (not res!669426) (not e!563722))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9357 0))(
  ( (MissingZero!9357 (index!39799 (_ BitVec 32))) (Found!9357 (index!39800 (_ BitVec 32))) (Intermediate!9357 (undefined!10169 Bool) (index!39801 (_ BitVec 32)) (x!87233 (_ BitVec 32))) (Undefined!9357) (MissingVacant!9357 (index!39802 (_ BitVec 32))) )
))
(declare-fun lt!442159 () SeekEntryResult!9357)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63199 (_ BitVec 32)) SeekEntryResult!9357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999941 (= res!669426 (not (= lt!442159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30425 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30425 a!3219) i!1194 k0!2224) j!170) (array!63200 (store (arr!30425 a!3219) i!1194 k0!2224) (size!30927 a!3219)) mask!3464))))))

(declare-fun b!999942 () Bool)

(declare-fun res!669423 () Bool)

(assert (=> b!999942 (=> (not res!669423) (not e!563720))))

(assert (=> b!999942 (= res!669423 (and (= (size!30927 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30927 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30927 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999943 () Bool)

(declare-fun res!669418 () Bool)

(assert (=> b!999943 (=> (not res!669418) (not e!563720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999943 (= res!669418 (validKeyInArray!0 k0!2224))))

(declare-fun b!999944 () Bool)

(declare-fun e!563719 () Bool)

(assert (=> b!999944 (= e!563720 e!563719)))

(declare-fun res!669425 () Bool)

(assert (=> b!999944 (=> (not res!669425) (not e!563719))))

(declare-fun lt!442160 () SeekEntryResult!9357)

(assert (=> b!999944 (= res!669425 (or (= lt!442160 (MissingVacant!9357 i!1194)) (= lt!442160 (MissingZero!9357 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63199 (_ BitVec 32)) SeekEntryResult!9357)

(assert (=> b!999944 (= lt!442160 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999945 () Bool)

(declare-fun res!669421 () Bool)

(assert (=> b!999945 (=> (not res!669421) (not e!563719))))

(declare-datatypes ((List!21101 0))(
  ( (Nil!21098) (Cons!21097 (h!22274 (_ BitVec 64)) (t!30102 List!21101)) )
))
(declare-fun arrayNoDuplicates!0 (array!63199 (_ BitVec 32) List!21101) Bool)

(assert (=> b!999945 (= res!669421 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21098))))

(declare-fun b!999946 () Bool)

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!999946 (= e!563722 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!999947 () Bool)

(declare-fun res!669420 () Bool)

(assert (=> b!999947 (=> (not res!669420) (not e!563720))))

(assert (=> b!999947 (= res!669420 (validKeyInArray!0 (select (arr!30425 a!3219) j!170)))))

(declare-fun res!669427 () Bool)

(assert (=> start!86398 (=> (not res!669427) (not e!563720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86398 (= res!669427 (validMask!0 mask!3464))))

(assert (=> start!86398 e!563720))

(declare-fun array_inv!23549 (array!63199) Bool)

(assert (=> start!86398 (array_inv!23549 a!3219)))

(assert (=> start!86398 true))

(declare-fun b!999948 () Bool)

(assert (=> b!999948 (= e!563719 e!563722)))

(declare-fun res!669422 () Bool)

(assert (=> b!999948 (=> (not res!669422) (not e!563722))))

(declare-fun lt!442158 () SeekEntryResult!9357)

(assert (=> b!999948 (= res!669422 (= lt!442159 lt!442158))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999948 (= lt!442158 (Intermediate!9357 false resIndex!38 resX!38))))

(assert (=> b!999948 (= lt!442159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30425 a!3219) j!170) mask!3464) (select (arr!30425 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999949 () Bool)

(declare-fun res!669419 () Bool)

(assert (=> b!999949 (=> (not res!669419) (not e!563719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63199 (_ BitVec 32)) Bool)

(assert (=> b!999949 (= res!669419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999950 () Bool)

(declare-fun res!669428 () Bool)

(assert (=> b!999950 (=> (not res!669428) (not e!563719))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999950 (= res!669428 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30927 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30927 a!3219))))))

(declare-fun b!999951 () Bool)

(declare-fun res!669429 () Bool)

(assert (=> b!999951 (=> (not res!669429) (not e!563722))))

(assert (=> b!999951 (= res!669429 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30425 a!3219) j!170) a!3219 mask!3464) lt!442158))))

(assert (= (and start!86398 res!669427) b!999942))

(assert (= (and b!999942 res!669423) b!999947))

(assert (= (and b!999947 res!669420) b!999943))

(assert (= (and b!999943 res!669418) b!999940))

(assert (= (and b!999940 res!669424) b!999944))

(assert (= (and b!999944 res!669425) b!999949))

(assert (= (and b!999949 res!669419) b!999945))

(assert (= (and b!999945 res!669421) b!999950))

(assert (= (and b!999950 res!669428) b!999948))

(assert (= (and b!999948 res!669422) b!999951))

(assert (= (and b!999951 res!669429) b!999941))

(assert (= (and b!999941 res!669426) b!999946))

(declare-fun m!926143 () Bool)

(assert (=> b!999941 m!926143))

(declare-fun m!926145 () Bool)

(assert (=> b!999941 m!926145))

(assert (=> b!999941 m!926145))

(declare-fun m!926147 () Bool)

(assert (=> b!999941 m!926147))

(assert (=> b!999941 m!926147))

(assert (=> b!999941 m!926145))

(declare-fun m!926149 () Bool)

(assert (=> b!999941 m!926149))

(declare-fun m!926151 () Bool)

(assert (=> b!999951 m!926151))

(assert (=> b!999951 m!926151))

(declare-fun m!926153 () Bool)

(assert (=> b!999951 m!926153))

(declare-fun m!926155 () Bool)

(assert (=> start!86398 m!926155))

(declare-fun m!926157 () Bool)

(assert (=> start!86398 m!926157))

(assert (=> b!999947 m!926151))

(assert (=> b!999947 m!926151))

(declare-fun m!926159 () Bool)

(assert (=> b!999947 m!926159))

(declare-fun m!926161 () Bool)

(assert (=> b!999943 m!926161))

(declare-fun m!926163 () Bool)

(assert (=> b!999940 m!926163))

(declare-fun m!926165 () Bool)

(assert (=> b!999944 m!926165))

(declare-fun m!926167 () Bool)

(assert (=> b!999949 m!926167))

(assert (=> b!999948 m!926151))

(assert (=> b!999948 m!926151))

(declare-fun m!926169 () Bool)

(assert (=> b!999948 m!926169))

(assert (=> b!999948 m!926169))

(assert (=> b!999948 m!926151))

(declare-fun m!926171 () Bool)

(assert (=> b!999948 m!926171))

(declare-fun m!926173 () Bool)

(assert (=> b!999945 m!926173))

(check-sat (not b!999945) (not b!999943) (not b!999951) (not b!999949) (not b!999941) (not start!86398) (not b!999947) (not b!999944) (not b!999948) (not b!999940))
(check-sat)
