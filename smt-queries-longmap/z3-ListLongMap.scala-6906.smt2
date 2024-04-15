; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86790 () Bool)

(assert start!86790)

(declare-fun b!1006200 () Bool)

(declare-fun res!675421 () Bool)

(declare-fun e!566358 () Bool)

(assert (=> b!1006200 (=> (not res!675421) (not e!566358))))

(declare-datatypes ((array!63436 0))(
  ( (array!63437 (arr!30540 (Array (_ BitVec 32) (_ BitVec 64))) (size!31044 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63436)

(declare-datatypes ((List!21282 0))(
  ( (Nil!21279) (Cons!21278 (h!22461 (_ BitVec 64)) (t!30274 List!21282)) )
))
(declare-fun arrayNoDuplicates!0 (array!63436 (_ BitVec 32) List!21282) Bool)

(assert (=> b!1006200 (= res!675421 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21279))))

(declare-fun b!1006201 () Bool)

(declare-fun res!675419 () Bool)

(declare-fun e!566359 () Bool)

(assert (=> b!1006201 (=> (not res!675419) (not e!566359))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006201 (= res!675419 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006202 () Bool)

(declare-fun res!675413 () Bool)

(declare-fun e!566357 () Bool)

(assert (=> b!1006202 (=> (not res!675413) (not e!566357))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9497 0))(
  ( (MissingZero!9497 (index!40359 (_ BitVec 32))) (Found!9497 (index!40360 (_ BitVec 32))) (Intermediate!9497 (undefined!10309 Bool) (index!40361 (_ BitVec 32)) (x!87772 (_ BitVec 32))) (Undefined!9497) (MissingVacant!9497 (index!40362 (_ BitVec 32))) )
))
(declare-fun lt!444548 () SeekEntryResult!9497)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63436 (_ BitVec 32)) SeekEntryResult!9497)

(assert (=> b!1006202 (= res!675413 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30540 a!3219) j!170) a!3219 mask!3464) lt!444548))))

(declare-fun b!1006203 () Bool)

(declare-fun res!675415 () Bool)

(assert (=> b!1006203 (=> (not res!675415) (not e!566359))))

(assert (=> b!1006203 (= res!675415 (validKeyInArray!0 (select (arr!30540 a!3219) j!170)))))

(declare-fun b!1006205 () Bool)

(declare-fun res!675422 () Bool)

(assert (=> b!1006205 (=> (not res!675422) (not e!566359))))

(declare-fun arrayContainsKey!0 (array!63436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006205 (= res!675422 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006206 () Bool)

(declare-fun res!675417 () Bool)

(assert (=> b!1006206 (=> (not res!675417) (not e!566358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63436 (_ BitVec 32)) Bool)

(assert (=> b!1006206 (= res!675417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006207 () Bool)

(assert (=> b!1006207 (= e!566357 false)))

(declare-fun lt!444550 () SeekEntryResult!9497)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006207 (= lt!444550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30540 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30540 a!3219) i!1194 k0!2224) j!170) (array!63437 (store (arr!30540 a!3219) i!1194 k0!2224) (size!31044 a!3219)) mask!3464))))

(declare-fun b!1006208 () Bool)

(declare-fun res!675412 () Bool)

(assert (=> b!1006208 (=> (not res!675412) (not e!566358))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006208 (= res!675412 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31044 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31044 a!3219))))))

(declare-fun res!675418 () Bool)

(assert (=> start!86790 (=> (not res!675418) (not e!566359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86790 (= res!675418 (validMask!0 mask!3464))))

(assert (=> start!86790 e!566359))

(declare-fun array_inv!23683 (array!63436) Bool)

(assert (=> start!86790 (array_inv!23683 a!3219)))

(assert (=> start!86790 true))

(declare-fun b!1006204 () Bool)

(assert (=> b!1006204 (= e!566358 e!566357)))

(declare-fun res!675420 () Bool)

(assert (=> b!1006204 (=> (not res!675420) (not e!566357))))

(assert (=> b!1006204 (= res!675420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30540 a!3219) j!170) mask!3464) (select (arr!30540 a!3219) j!170) a!3219 mask!3464) lt!444548))))

(assert (=> b!1006204 (= lt!444548 (Intermediate!9497 false resIndex!38 resX!38))))

(declare-fun b!1006209 () Bool)

(declare-fun res!675416 () Bool)

(assert (=> b!1006209 (=> (not res!675416) (not e!566359))))

(assert (=> b!1006209 (= res!675416 (and (= (size!31044 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31044 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31044 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006210 () Bool)

(assert (=> b!1006210 (= e!566359 e!566358)))

(declare-fun res!675414 () Bool)

(assert (=> b!1006210 (=> (not res!675414) (not e!566358))))

(declare-fun lt!444549 () SeekEntryResult!9497)

(assert (=> b!1006210 (= res!675414 (or (= lt!444549 (MissingVacant!9497 i!1194)) (= lt!444549 (MissingZero!9497 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63436 (_ BitVec 32)) SeekEntryResult!9497)

(assert (=> b!1006210 (= lt!444549 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86790 res!675418) b!1006209))

(assert (= (and b!1006209 res!675416) b!1006203))

(assert (= (and b!1006203 res!675415) b!1006201))

(assert (= (and b!1006201 res!675419) b!1006205))

(assert (= (and b!1006205 res!675422) b!1006210))

(assert (= (and b!1006210 res!675414) b!1006206))

(assert (= (and b!1006206 res!675417) b!1006200))

(assert (= (and b!1006200 res!675421) b!1006208))

(assert (= (and b!1006208 res!675412) b!1006204))

(assert (= (and b!1006204 res!675420) b!1006202))

(assert (= (and b!1006202 res!675413) b!1006207))

(declare-fun m!930787 () Bool)

(assert (=> b!1006203 m!930787))

(assert (=> b!1006203 m!930787))

(declare-fun m!930789 () Bool)

(assert (=> b!1006203 m!930789))

(declare-fun m!930791 () Bool)

(assert (=> b!1006207 m!930791))

(declare-fun m!930793 () Bool)

(assert (=> b!1006207 m!930793))

(assert (=> b!1006207 m!930793))

(declare-fun m!930795 () Bool)

(assert (=> b!1006207 m!930795))

(assert (=> b!1006207 m!930795))

(assert (=> b!1006207 m!930793))

(declare-fun m!930797 () Bool)

(assert (=> b!1006207 m!930797))

(assert (=> b!1006202 m!930787))

(assert (=> b!1006202 m!930787))

(declare-fun m!930799 () Bool)

(assert (=> b!1006202 m!930799))

(declare-fun m!930801 () Bool)

(assert (=> b!1006200 m!930801))

(declare-fun m!930803 () Bool)

(assert (=> start!86790 m!930803))

(declare-fun m!930805 () Bool)

(assert (=> start!86790 m!930805))

(declare-fun m!930807 () Bool)

(assert (=> b!1006201 m!930807))

(declare-fun m!930809 () Bool)

(assert (=> b!1006210 m!930809))

(declare-fun m!930811 () Bool)

(assert (=> b!1006206 m!930811))

(declare-fun m!930813 () Bool)

(assert (=> b!1006205 m!930813))

(assert (=> b!1006204 m!930787))

(assert (=> b!1006204 m!930787))

(declare-fun m!930815 () Bool)

(assert (=> b!1006204 m!930815))

(assert (=> b!1006204 m!930815))

(assert (=> b!1006204 m!930787))

(declare-fun m!930817 () Bool)

(assert (=> b!1006204 m!930817))

(check-sat (not b!1006205) (not start!86790) (not b!1006201) (not b!1006200) (not b!1006207) (not b!1006206) (not b!1006202) (not b!1006210) (not b!1006204) (not b!1006203))
(check-sat)
