; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85672 () Bool)

(assert start!85672)

(declare-fun b!994437 () Bool)

(declare-fun e!561220 () Bool)

(declare-datatypes ((array!62891 0))(
  ( (array!62892 (arr!30285 (Array (_ BitVec 32) (_ BitVec 64))) (size!30787 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62891)

(assert (=> b!994437 (= e!561220 (and (bvslt #b00000000000000000000000000000000 (size!30787 a!3219)) (bvsge (size!30787 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!994435 () Bool)

(declare-fun res!664943 () Bool)

(assert (=> b!994435 (=> (not res!664943) (not e!561220))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994435 (= res!664943 (validKeyInArray!0 (select (arr!30285 a!3219) j!170)))))

(declare-fun b!994434 () Bool)

(declare-fun res!664944 () Bool)

(assert (=> b!994434 (=> (not res!664944) (not e!561220))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994434 (= res!664944 (and (= (size!30787 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30787 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30787 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994436 () Bool)

(declare-fun res!664942 () Bool)

(assert (=> b!994436 (=> (not res!664942) (not e!561220))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!994436 (= res!664942 (validKeyInArray!0 k!2224))))

(declare-fun res!664941 () Bool)

(assert (=> start!85672 (=> (not res!664941) (not e!561220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85672 (= res!664941 (validMask!0 mask!3464))))

(assert (=> start!85672 e!561220))

(declare-fun array_inv!23409 (array!62891) Bool)

(assert (=> start!85672 (array_inv!23409 a!3219)))

(assert (=> start!85672 true))

(assert (= (and start!85672 res!664941) b!994434))

(assert (= (and b!994434 res!664944) b!994435))

(assert (= (and b!994435 res!664943) b!994436))

(assert (= (and b!994436 res!664942) b!994437))

(declare-fun m!922021 () Bool)

(assert (=> b!994435 m!922021))

(assert (=> b!994435 m!922021))

(declare-fun m!922023 () Bool)

(assert (=> b!994435 m!922023))

(declare-fun m!922025 () Bool)

(assert (=> b!994436 m!922025))

(declare-fun m!922027 () Bool)

(assert (=> start!85672 m!922027))

(declare-fun m!922029 () Bool)

(assert (=> start!85672 m!922029))

(push 1)

(assert (not b!994436))

(assert (not b!994435))

(assert (not start!85672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

