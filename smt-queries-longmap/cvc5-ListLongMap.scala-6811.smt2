; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85688 () Bool)

(assert start!85688)

(declare-fun res!664955 () Bool)

(declare-fun e!561225 () Bool)

(assert (=> start!85688 (=> (not res!664955) (not e!561225))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85688 (= res!664955 (validMask!0 mask!3464))))

(assert (=> start!85688 e!561225))

(declare-datatypes ((array!62894 0))(
  ( (array!62895 (arr!30286 (Array (_ BitVec 32) (_ BitVec 64))) (size!30788 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62894)

(declare-fun array_inv!23410 (array!62894) Bool)

(assert (=> start!85688 (array_inv!23410 a!3219)))

(assert (=> start!85688 true))

(declare-fun b!994448 () Bool)

(declare-fun res!664958 () Bool)

(assert (=> b!994448 (=> (not res!664958) (not e!561225))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994448 (= res!664958 (validKeyInArray!0 k!2224))))

(declare-fun b!994449 () Bool)

(declare-fun res!664956 () Bool)

(assert (=> b!994449 (=> (not res!664956) (not e!561225))))

(declare-fun arrayContainsKey!0 (array!62894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994449 (= res!664956 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994450 () Bool)

(assert (=> b!994450 (= e!561225 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!994451 () Bool)

(declare-fun res!664959 () Bool)

(assert (=> b!994451 (=> (not res!664959) (not e!561225))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994451 (= res!664959 (and (= (size!30788 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30788 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30788 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994452 () Bool)

(declare-fun res!664957 () Bool)

(assert (=> b!994452 (=> (not res!664957) (not e!561225))))

(assert (=> b!994452 (= res!664957 (validKeyInArray!0 (select (arr!30286 a!3219) j!170)))))

(assert (= (and start!85688 res!664955) b!994451))

(assert (= (and b!994451 res!664959) b!994452))

(assert (= (and b!994452 res!664957) b!994448))

(assert (= (and b!994448 res!664958) b!994449))

(assert (= (and b!994449 res!664956) b!994450))

(declare-fun m!922031 () Bool)

(assert (=> start!85688 m!922031))

(declare-fun m!922033 () Bool)

(assert (=> start!85688 m!922033))

(declare-fun m!922035 () Bool)

(assert (=> b!994448 m!922035))

(declare-fun m!922037 () Bool)

(assert (=> b!994449 m!922037))

(declare-fun m!922039 () Bool)

(assert (=> b!994452 m!922039))

(assert (=> b!994452 m!922039))

(declare-fun m!922041 () Bool)

(assert (=> b!994452 m!922041))

(push 1)

(assert (not b!994449))

(assert (not b!994448))

(assert (not start!85688))

(assert (not b!994452))

(check-sat)

