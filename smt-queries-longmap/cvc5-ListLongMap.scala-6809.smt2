; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85662 () Bool)

(assert start!85662)

(declare-fun b!994375 () Bool)

(declare-fun res!664884 () Bool)

(declare-fun e!561190 () Bool)

(assert (=> b!994375 (=> (not res!664884) (not e!561190))))

(declare-datatypes ((array!62881 0))(
  ( (array!62882 (arr!30280 (Array (_ BitVec 32) (_ BitVec 64))) (size!30782 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62881)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994375 (= res!664884 (validKeyInArray!0 (select (arr!30280 a!3219) j!170)))))

(declare-fun b!994376 () Bool)

(declare-fun res!664881 () Bool)

(assert (=> b!994376 (=> (not res!664881) (not e!561190))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!994376 (= res!664881 (validKeyInArray!0 k!2224))))

(declare-fun res!664882 () Bool)

(assert (=> start!85662 (=> (not res!664882) (not e!561190))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85662 (= res!664882 (validMask!0 mask!3464))))

(assert (=> start!85662 e!561190))

(declare-fun array_inv!23404 (array!62881) Bool)

(assert (=> start!85662 (array_inv!23404 a!3219)))

(assert (=> start!85662 true))

(declare-fun b!994374 () Bool)

(declare-fun res!664883 () Bool)

(assert (=> b!994374 (=> (not res!664883) (not e!561190))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994374 (= res!664883 (and (= (size!30782 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30782 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30782 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994377 () Bool)

(assert (=> b!994377 (= e!561190 (bvsge #b00000000000000000000000000000000 (size!30782 a!3219)))))

(assert (= (and start!85662 res!664882) b!994374))

(assert (= (and b!994374 res!664883) b!994375))

(assert (= (and b!994375 res!664884) b!994376))

(assert (= (and b!994376 res!664881) b!994377))

(declare-fun m!921971 () Bool)

(assert (=> b!994375 m!921971))

(assert (=> b!994375 m!921971))

(declare-fun m!921973 () Bool)

(assert (=> b!994375 m!921973))

(declare-fun m!921975 () Bool)

(assert (=> b!994376 m!921975))

(declare-fun m!921977 () Bool)

(assert (=> start!85662 m!921977))

(declare-fun m!921979 () Bool)

(assert (=> start!85662 m!921979))

(push 1)

(assert (not b!994376))

(assert (not b!994375))

(assert (not start!85662))

(check-sat)

