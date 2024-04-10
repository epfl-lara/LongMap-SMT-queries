; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85668 () Bool)

(assert start!85668)

(declare-fun b!994411 () Bool)

(declare-fun res!664917 () Bool)

(declare-fun e!561207 () Bool)

(assert (=> b!994411 (=> (not res!664917) (not e!561207))))

(declare-datatypes ((array!62887 0))(
  ( (array!62888 (arr!30283 (Array (_ BitVec 32) (_ BitVec 64))) (size!30785 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62887)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994411 (= res!664917 (validKeyInArray!0 (select (arr!30283 a!3219) j!170)))))

(declare-fun b!994413 () Bool)

(assert (=> b!994413 (= e!561207 (and (bvslt #b00000000000000000000000000000000 (size!30785 a!3219)) (bvsge (size!30785 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!994410 () Bool)

(declare-fun res!664920 () Bool)

(assert (=> b!994410 (=> (not res!664920) (not e!561207))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994410 (= res!664920 (and (= (size!30785 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30785 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30785 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994412 () Bool)

(declare-fun res!664918 () Bool)

(assert (=> b!994412 (=> (not res!664918) (not e!561207))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!994412 (= res!664918 (validKeyInArray!0 k!2224))))

(declare-fun res!664919 () Bool)

(assert (=> start!85668 (=> (not res!664919) (not e!561207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85668 (= res!664919 (validMask!0 mask!3464))))

(assert (=> start!85668 e!561207))

(declare-fun array_inv!23407 (array!62887) Bool)

(assert (=> start!85668 (array_inv!23407 a!3219)))

(assert (=> start!85668 true))

(assert (= (and start!85668 res!664919) b!994410))

(assert (= (and b!994410 res!664920) b!994411))

(assert (= (and b!994411 res!664917) b!994412))

(assert (= (and b!994412 res!664918) b!994413))

(declare-fun m!922001 () Bool)

(assert (=> b!994411 m!922001))

(assert (=> b!994411 m!922001))

(declare-fun m!922003 () Bool)

(assert (=> b!994411 m!922003))

(declare-fun m!922005 () Bool)

(assert (=> b!994412 m!922005))

(declare-fun m!922007 () Bool)

(assert (=> start!85668 m!922007))

(declare-fun m!922009 () Bool)

(assert (=> start!85668 m!922009))

(push 1)

(assert (not b!994411))

(assert (not start!85668))

(assert (not b!994412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

