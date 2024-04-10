; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85742 () Bool)

(assert start!85742)

(declare-fun b!994866 () Bool)

(declare-fun res!665377 () Bool)

(declare-fun e!561389 () Bool)

(assert (=> b!994866 (=> (not res!665377) (not e!561389))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994866 (= res!665377 (validKeyInArray!0 k!2224))))

(declare-fun b!994867 () Bool)

(declare-fun res!665378 () Bool)

(assert (=> b!994867 (=> (not res!665378) (not e!561389))))

(declare-datatypes ((array!62948 0))(
  ( (array!62949 (arr!30313 (Array (_ BitVec 32) (_ BitVec 64))) (size!30815 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62948)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994867 (= res!665378 (validKeyInArray!0 (select (arr!30313 a!3219) j!170)))))

(declare-fun b!994868 () Bool)

(declare-fun res!665376 () Bool)

(declare-fun e!561391 () Bool)

(assert (=> b!994868 (=> (not res!665376) (not e!561391))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62948 (_ BitVec 32)) Bool)

(assert (=> b!994868 (= res!665376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994869 () Bool)

(declare-fun res!665374 () Bool)

(assert (=> b!994869 (=> (not res!665374) (not e!561389))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994869 (= res!665374 (and (= (size!30815 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30815 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30815 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994870 () Bool)

(declare-fun res!665379 () Bool)

(assert (=> b!994870 (=> (not res!665379) (not e!561389))))

(declare-fun arrayContainsKey!0 (array!62948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994870 (= res!665379 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994871 () Bool)

(assert (=> b!994871 (= e!561389 e!561391)))

(declare-fun res!665373 () Bool)

(assert (=> b!994871 (=> (not res!665373) (not e!561391))))

(declare-datatypes ((SeekEntryResult!9245 0))(
  ( (MissingZero!9245 (index!39351 (_ BitVec 32))) (Found!9245 (index!39352 (_ BitVec 32))) (Intermediate!9245 (undefined!10057 Bool) (index!39353 (_ BitVec 32)) (x!86798 (_ BitVec 32))) (Undefined!9245) (MissingVacant!9245 (index!39354 (_ BitVec 32))) )
))
(declare-fun lt!440780 () SeekEntryResult!9245)

(assert (=> b!994871 (= res!665373 (or (= lt!440780 (MissingVacant!9245 i!1194)) (= lt!440780 (MissingZero!9245 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62948 (_ BitVec 32)) SeekEntryResult!9245)

(assert (=> b!994871 (= lt!440780 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994872 () Bool)

(assert (=> b!994872 (= e!561391 (bvsgt #b00000000000000000000000000000000 (size!30815 a!3219)))))

(declare-fun res!665375 () Bool)

(assert (=> start!85742 (=> (not res!665375) (not e!561389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85742 (= res!665375 (validMask!0 mask!3464))))

(assert (=> start!85742 e!561389))

(declare-fun array_inv!23437 (array!62948) Bool)

(assert (=> start!85742 (array_inv!23437 a!3219)))

(assert (=> start!85742 true))

(assert (= (and start!85742 res!665375) b!994869))

(assert (= (and b!994869 res!665374) b!994867))

(assert (= (and b!994867 res!665378) b!994866))

(assert (= (and b!994866 res!665377) b!994870))

(assert (= (and b!994870 res!665379) b!994871))

(assert (= (and b!994871 res!665373) b!994868))

(assert (= (and b!994868 res!665376) b!994872))

(declare-fun m!922403 () Bool)

(assert (=> b!994866 m!922403))

(declare-fun m!922405 () Bool)

(assert (=> b!994871 m!922405))

(declare-fun m!922407 () Bool)

(assert (=> start!85742 m!922407))

(declare-fun m!922409 () Bool)

(assert (=> start!85742 m!922409))

(declare-fun m!922411 () Bool)

(assert (=> b!994867 m!922411))

(assert (=> b!994867 m!922411))

(declare-fun m!922413 () Bool)

(assert (=> b!994867 m!922413))

(declare-fun m!922415 () Bool)

(assert (=> b!994870 m!922415))

(declare-fun m!922417 () Bool)

(assert (=> b!994868 m!922417))

(push 1)

