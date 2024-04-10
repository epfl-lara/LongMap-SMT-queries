; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85718 () Bool)

(assert start!85718)

(declare-fun b!994682 () Bool)

(declare-fun res!665191 () Bool)

(declare-fun e!561316 () Bool)

(assert (=> b!994682 (=> (not res!665191) (not e!561316))))

(declare-datatypes ((array!62924 0))(
  ( (array!62925 (arr!30301 (Array (_ BitVec 32) (_ BitVec 64))) (size!30803 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62924)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994682 (= res!665191 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994684 () Bool)

(assert (=> b!994684 (= e!561316 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9233 0))(
  ( (MissingZero!9233 (index!39303 (_ BitVec 32))) (Found!9233 (index!39304 (_ BitVec 32))) (Intermediate!9233 (undefined!10045 Bool) (index!39305 (_ BitVec 32)) (x!86754 (_ BitVec 32))) (Undefined!9233) (MissingVacant!9233 (index!39306 (_ BitVec 32))) )
))
(declare-fun lt!440744 () SeekEntryResult!9233)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62924 (_ BitVec 32)) SeekEntryResult!9233)

(assert (=> b!994684 (= lt!440744 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994685 () Bool)

(declare-fun res!665193 () Bool)

(assert (=> b!994685 (=> (not res!665193) (not e!561316))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994685 (= res!665193 (validKeyInArray!0 (select (arr!30301 a!3219) j!170)))))

(declare-fun b!994686 () Bool)

(declare-fun res!665189 () Bool)

(assert (=> b!994686 (=> (not res!665189) (not e!561316))))

(assert (=> b!994686 (= res!665189 (validKeyInArray!0 k!2224))))

(declare-fun res!665192 () Bool)

(assert (=> start!85718 (=> (not res!665192) (not e!561316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85718 (= res!665192 (validMask!0 mask!3464))))

(assert (=> start!85718 e!561316))

(declare-fun array_inv!23425 (array!62924) Bool)

(assert (=> start!85718 (array_inv!23425 a!3219)))

(assert (=> start!85718 true))

(declare-fun b!994683 () Bool)

(declare-fun res!665190 () Bool)

(assert (=> b!994683 (=> (not res!665190) (not e!561316))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994683 (= res!665190 (and (= (size!30803 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30803 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30803 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85718 res!665192) b!994683))

(assert (= (and b!994683 res!665190) b!994685))

(assert (= (and b!994685 res!665193) b!994686))

(assert (= (and b!994686 res!665189) b!994682))

(assert (= (and b!994682 res!665191) b!994684))

(declare-fun m!922235 () Bool)

(assert (=> b!994685 m!922235))

(assert (=> b!994685 m!922235))

(declare-fun m!922237 () Bool)

(assert (=> b!994685 m!922237))

(declare-fun m!922239 () Bool)

(assert (=> start!85718 m!922239))

(declare-fun m!922241 () Bool)

(assert (=> start!85718 m!922241))

(declare-fun m!922243 () Bool)

(assert (=> b!994686 m!922243))

(declare-fun m!922245 () Bool)

(assert (=> b!994684 m!922245))

(declare-fun m!922247 () Bool)

(assert (=> b!994682 m!922247))

(push 1)

(assert (not b!994686))

(assert (not start!85718))

(assert (not b!994684))

(assert (not b!994682))

(assert (not b!994685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

