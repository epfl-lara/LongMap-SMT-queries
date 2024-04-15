; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86376 () Bool)

(assert start!86376)

(declare-fun res!669091 () Bool)

(declare-fun e!563504 () Bool)

(assert (=> start!86376 (=> (not res!669091) (not e!563504))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86376 (= res!669091 (validMask!0 mask!3464))))

(assert (=> start!86376 e!563504))

(declare-datatypes ((array!63124 0))(
  ( (array!63125 (arr!30387 (Array (_ BitVec 32) (_ BitVec 64))) (size!30891 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63124)

(declare-fun array_inv!23530 (array!63124) Bool)

(assert (=> start!86376 (array_inv!23530 a!3219)))

(assert (=> start!86376 true))

(declare-fun b!999479 () Bool)

(declare-fun e!563506 () Bool)

(assert (=> b!999479 (= e!563506 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!999480 () Bool)

(declare-fun res!669081 () Bool)

(declare-fun e!563507 () Bool)

(assert (=> b!999480 (=> (not res!669081) (not e!563507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63124 (_ BitVec 32)) Bool)

(assert (=> b!999480 (= res!669081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999481 () Bool)

(declare-fun res!669087 () Bool)

(assert (=> b!999481 (=> (not res!669087) (not e!563504))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999481 (= res!669087 (validKeyInArray!0 k0!2224))))

(declare-fun b!999482 () Bool)

(declare-fun res!669084 () Bool)

(assert (=> b!999482 (=> (not res!669084) (not e!563506))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9344 0))(
  ( (MissingZero!9344 (index!39747 (_ BitVec 32))) (Found!9344 (index!39748 (_ BitVec 32))) (Intermediate!9344 (undefined!10156 Bool) (index!39749 (_ BitVec 32)) (x!87199 (_ BitVec 32))) (Undefined!9344) (MissingVacant!9344 (index!39750 (_ BitVec 32))) )
))
(declare-fun lt!441865 () SeekEntryResult!9344)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63124 (_ BitVec 32)) SeekEntryResult!9344)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999482 (= res!669084 (not (= lt!441865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30387 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30387 a!3219) i!1194 k0!2224) j!170) (array!63125 (store (arr!30387 a!3219) i!1194 k0!2224) (size!30891 a!3219)) mask!3464))))))

(declare-fun b!999483 () Bool)

(assert (=> b!999483 (= e!563504 e!563507)))

(declare-fun res!669088 () Bool)

(assert (=> b!999483 (=> (not res!669088) (not e!563507))))

(declare-fun lt!441864 () SeekEntryResult!9344)

(assert (=> b!999483 (= res!669088 (or (= lt!441864 (MissingVacant!9344 i!1194)) (= lt!441864 (MissingZero!9344 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63124 (_ BitVec 32)) SeekEntryResult!9344)

(assert (=> b!999483 (= lt!441864 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999484 () Bool)

(declare-fun res!669086 () Bool)

(assert (=> b!999484 (=> (not res!669086) (not e!563504))))

(declare-fun arrayContainsKey!0 (array!63124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999484 (= res!669086 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999485 () Bool)

(assert (=> b!999485 (= e!563507 e!563506)))

(declare-fun res!669085 () Bool)

(assert (=> b!999485 (=> (not res!669085) (not e!563506))))

(declare-fun lt!441863 () SeekEntryResult!9344)

(assert (=> b!999485 (= res!669085 (= lt!441865 lt!441863))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999485 (= lt!441863 (Intermediate!9344 false resIndex!38 resX!38))))

(assert (=> b!999485 (= lt!441865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30387 a!3219) j!170) mask!3464) (select (arr!30387 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999486 () Bool)

(declare-fun res!669089 () Bool)

(assert (=> b!999486 (=> (not res!669089) (not e!563507))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!999486 (= res!669089 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30891 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30891 a!3219))))))

(declare-fun b!999487 () Bool)

(declare-fun res!669092 () Bool)

(assert (=> b!999487 (=> (not res!669092) (not e!563506))))

(assert (=> b!999487 (= res!669092 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30387 a!3219) j!170) a!3219 mask!3464) lt!441863))))

(declare-fun b!999488 () Bool)

(declare-fun res!669090 () Bool)

(assert (=> b!999488 (=> (not res!669090) (not e!563504))))

(assert (=> b!999488 (= res!669090 (validKeyInArray!0 (select (arr!30387 a!3219) j!170)))))

(declare-fun b!999489 () Bool)

(declare-fun res!669083 () Bool)

(assert (=> b!999489 (=> (not res!669083) (not e!563504))))

(assert (=> b!999489 (= res!669083 (and (= (size!30891 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30891 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30891 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999490 () Bool)

(declare-fun res!669082 () Bool)

(assert (=> b!999490 (=> (not res!669082) (not e!563507))))

(declare-datatypes ((List!21129 0))(
  ( (Nil!21126) (Cons!21125 (h!22302 (_ BitVec 64)) (t!30121 List!21129)) )
))
(declare-fun arrayNoDuplicates!0 (array!63124 (_ BitVec 32) List!21129) Bool)

(assert (=> b!999490 (= res!669082 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21126))))

(assert (= (and start!86376 res!669091) b!999489))

(assert (= (and b!999489 res!669083) b!999488))

(assert (= (and b!999488 res!669090) b!999481))

(assert (= (and b!999481 res!669087) b!999484))

(assert (= (and b!999484 res!669086) b!999483))

(assert (= (and b!999483 res!669088) b!999480))

(assert (= (and b!999480 res!669081) b!999490))

(assert (= (and b!999490 res!669082) b!999486))

(assert (= (and b!999486 res!669089) b!999485))

(assert (= (and b!999485 res!669085) b!999487))

(assert (= (and b!999487 res!669092) b!999482))

(assert (= (and b!999482 res!669084) b!999479))

(declare-fun m!925189 () Bool)

(assert (=> b!999484 m!925189))

(declare-fun m!925191 () Bool)

(assert (=> b!999487 m!925191))

(assert (=> b!999487 m!925191))

(declare-fun m!925193 () Bool)

(assert (=> b!999487 m!925193))

(declare-fun m!925195 () Bool)

(assert (=> b!999490 m!925195))

(declare-fun m!925197 () Bool)

(assert (=> b!999483 m!925197))

(assert (=> b!999488 m!925191))

(assert (=> b!999488 m!925191))

(declare-fun m!925199 () Bool)

(assert (=> b!999488 m!925199))

(declare-fun m!925201 () Bool)

(assert (=> start!86376 m!925201))

(declare-fun m!925203 () Bool)

(assert (=> start!86376 m!925203))

(declare-fun m!925205 () Bool)

(assert (=> b!999480 m!925205))

(declare-fun m!925207 () Bool)

(assert (=> b!999482 m!925207))

(declare-fun m!925209 () Bool)

(assert (=> b!999482 m!925209))

(assert (=> b!999482 m!925209))

(declare-fun m!925211 () Bool)

(assert (=> b!999482 m!925211))

(assert (=> b!999482 m!925211))

(assert (=> b!999482 m!925209))

(declare-fun m!925213 () Bool)

(assert (=> b!999482 m!925213))

(assert (=> b!999485 m!925191))

(assert (=> b!999485 m!925191))

(declare-fun m!925215 () Bool)

(assert (=> b!999485 m!925215))

(assert (=> b!999485 m!925215))

(assert (=> b!999485 m!925191))

(declare-fun m!925217 () Bool)

(assert (=> b!999485 m!925217))

(declare-fun m!925219 () Bool)

(assert (=> b!999481 m!925219))

(check-sat (not b!999490) (not b!999487) (not b!999488) (not b!999482) (not b!999480) (not b!999484) (not b!999481) (not start!86376) (not b!999483) (not b!999485))
(check-sat)
