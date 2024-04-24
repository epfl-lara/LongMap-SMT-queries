; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86578 () Bool)

(assert start!86578)

(declare-fun b!1000943 () Bool)

(declare-fun res!669863 () Bool)

(declare-fun e!564351 () Bool)

(assert (=> b!1000943 (=> (not res!669863) (not e!564351))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000943 (= res!669863 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000944 () Bool)

(declare-fun res!669855 () Bool)

(assert (=> b!1000944 (=> (not res!669855) (not e!564351))))

(declare-datatypes ((array!63249 0))(
  ( (array!63250 (arr!30445 (Array (_ BitVec 32) (_ BitVec 64))) (size!30948 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63249)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000944 (= res!669855 (and (= (size!30948 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30948 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30948 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000945 () Bool)

(declare-fun res!669856 () Bool)

(assert (=> b!1000945 (=> (not res!669856) (not e!564351))))

(declare-fun arrayContainsKey!0 (array!63249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000945 (= res!669856 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000946 () Bool)

(declare-fun res!669862 () Bool)

(declare-fun e!564348 () Bool)

(assert (=> b!1000946 (=> (not res!669862) (not e!564348))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000946 (= res!669862 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30948 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30948 a!3219))))))

(declare-fun b!1000947 () Bool)

(declare-fun res!669860 () Bool)

(declare-fun e!564349 () Bool)

(assert (=> b!1000947 (=> (not res!669860) (not e!564349))))

(declare-datatypes ((SeekEntryResult!9313 0))(
  ( (MissingZero!9313 (index!39623 (_ BitVec 32))) (Found!9313 (index!39624 (_ BitVec 32))) (Intermediate!9313 (undefined!10125 Bool) (index!39625 (_ BitVec 32)) (x!87211 (_ BitVec 32))) (Undefined!9313) (MissingVacant!9313 (index!39626 (_ BitVec 32))) )
))
(declare-fun lt!442542 () SeekEntryResult!9313)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63249 (_ BitVec 32)) SeekEntryResult!9313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000947 (= res!669860 (not (= lt!442542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30445 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30445 a!3219) i!1194 k0!2224) j!170) (array!63250 (store (arr!30445 a!3219) i!1194 k0!2224) (size!30948 a!3219)) mask!3464))))))

(declare-fun b!1000948 () Bool)

(assert (=> b!1000948 (= e!564351 e!564348)))

(declare-fun res!669857 () Bool)

(assert (=> b!1000948 (=> (not res!669857) (not e!564348))))

(declare-fun lt!442544 () SeekEntryResult!9313)

(assert (=> b!1000948 (= res!669857 (or (= lt!442544 (MissingVacant!9313 i!1194)) (= lt!442544 (MissingZero!9313 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63249 (_ BitVec 32)) SeekEntryResult!9313)

(assert (=> b!1000948 (= lt!442544 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000949 () Bool)

(assert (=> b!1000949 (= e!564349 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000950 () Bool)

(declare-fun res!669865 () Bool)

(assert (=> b!1000950 (=> (not res!669865) (not e!564348))))

(declare-datatypes ((List!21092 0))(
  ( (Nil!21089) (Cons!21088 (h!22271 (_ BitVec 64)) (t!30085 List!21092)) )
))
(declare-fun arrayNoDuplicates!0 (array!63249 (_ BitVec 32) List!21092) Bool)

(assert (=> b!1000950 (= res!669865 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21089))))

(declare-fun res!669859 () Bool)

(assert (=> start!86578 (=> (not res!669859) (not e!564351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86578 (= res!669859 (validMask!0 mask!3464))))

(assert (=> start!86578 e!564351))

(declare-fun array_inv!23581 (array!63249) Bool)

(assert (=> start!86578 (array_inv!23581 a!3219)))

(assert (=> start!86578 true))

(declare-fun b!1000951 () Bool)

(declare-fun res!669866 () Bool)

(assert (=> b!1000951 (=> (not res!669866) (not e!564349))))

(declare-fun lt!442543 () SeekEntryResult!9313)

(assert (=> b!1000951 (= res!669866 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30445 a!3219) j!170) a!3219 mask!3464) lt!442543))))

(declare-fun b!1000952 () Bool)

(assert (=> b!1000952 (= e!564348 e!564349)))

(declare-fun res!669864 () Bool)

(assert (=> b!1000952 (=> (not res!669864) (not e!564349))))

(assert (=> b!1000952 (= res!669864 (= lt!442542 lt!442543))))

(assert (=> b!1000952 (= lt!442543 (Intermediate!9313 false resIndex!38 resX!38))))

(assert (=> b!1000952 (= lt!442542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30445 a!3219) j!170) mask!3464) (select (arr!30445 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000953 () Bool)

(declare-fun res!669861 () Bool)

(assert (=> b!1000953 (=> (not res!669861) (not e!564348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63249 (_ BitVec 32)) Bool)

(assert (=> b!1000953 (= res!669861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000954 () Bool)

(declare-fun res!669858 () Bool)

(assert (=> b!1000954 (=> (not res!669858) (not e!564351))))

(assert (=> b!1000954 (= res!669858 (validKeyInArray!0 (select (arr!30445 a!3219) j!170)))))

(assert (= (and start!86578 res!669859) b!1000944))

(assert (= (and b!1000944 res!669855) b!1000954))

(assert (= (and b!1000954 res!669858) b!1000943))

(assert (= (and b!1000943 res!669863) b!1000945))

(assert (= (and b!1000945 res!669856) b!1000948))

(assert (= (and b!1000948 res!669857) b!1000953))

(assert (= (and b!1000953 res!669861) b!1000950))

(assert (= (and b!1000950 res!669865) b!1000946))

(assert (= (and b!1000946 res!669862) b!1000952))

(assert (= (and b!1000952 res!669864) b!1000951))

(assert (= (and b!1000951 res!669866) b!1000947))

(assert (= (and b!1000947 res!669860) b!1000949))

(declare-fun m!927545 () Bool)

(assert (=> b!1000943 m!927545))

(declare-fun m!927547 () Bool)

(assert (=> b!1000951 m!927547))

(assert (=> b!1000951 m!927547))

(declare-fun m!927549 () Bool)

(assert (=> b!1000951 m!927549))

(assert (=> b!1000954 m!927547))

(assert (=> b!1000954 m!927547))

(declare-fun m!927551 () Bool)

(assert (=> b!1000954 m!927551))

(assert (=> b!1000952 m!927547))

(assert (=> b!1000952 m!927547))

(declare-fun m!927553 () Bool)

(assert (=> b!1000952 m!927553))

(assert (=> b!1000952 m!927553))

(assert (=> b!1000952 m!927547))

(declare-fun m!927555 () Bool)

(assert (=> b!1000952 m!927555))

(declare-fun m!927557 () Bool)

(assert (=> b!1000953 m!927557))

(declare-fun m!927559 () Bool)

(assert (=> b!1000948 m!927559))

(declare-fun m!927561 () Bool)

(assert (=> b!1000947 m!927561))

(declare-fun m!927563 () Bool)

(assert (=> b!1000947 m!927563))

(assert (=> b!1000947 m!927563))

(declare-fun m!927565 () Bool)

(assert (=> b!1000947 m!927565))

(assert (=> b!1000947 m!927565))

(assert (=> b!1000947 m!927563))

(declare-fun m!927567 () Bool)

(assert (=> b!1000947 m!927567))

(declare-fun m!927569 () Bool)

(assert (=> b!1000945 m!927569))

(declare-fun m!927571 () Bool)

(assert (=> start!86578 m!927571))

(declare-fun m!927573 () Bool)

(assert (=> start!86578 m!927573))

(declare-fun m!927575 () Bool)

(assert (=> b!1000950 m!927575))

(check-sat (not start!86578) (not b!1000950) (not b!1000954) (not b!1000943) (not b!1000953) (not b!1000945) (not b!1000948) (not b!1000951) (not b!1000947) (not b!1000952))
(check-sat)
