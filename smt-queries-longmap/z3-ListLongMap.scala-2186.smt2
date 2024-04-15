; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36436 () Bool)

(assert start!36436)

(declare-fun b!364193 () Bool)

(declare-fun res!203498 () Bool)

(declare-fun e!222936 () Bool)

(assert (=> b!364193 (=> (not res!203498) (not e!222936))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((array!20712 0))(
  ( (array!20713 (arr!9835 (Array (_ BitVec 32) (_ BitVec 64))) (size!10188 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20712)

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364193 (= res!203498 (and (bvslt (size!10188 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10188 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364194 () Bool)

(declare-fun e!222935 () Bool)

(assert (=> b!364194 (= e!222936 e!222935)))

(declare-fun res!203496 () Bool)

(assert (=> b!364194 (=> (not res!203496) (not e!222935))))

(declare-fun lt!168270 () (_ BitVec 32))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20712 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364194 (= res!203496 (= (arrayCountValidKeys!0 (array!20713 (store (arr!9835 a!4289) i!1472 k0!2974) (size!10188 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168270)))))

(assert (=> b!364194 (= lt!168270 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364195 () Bool)

(assert (=> b!364195 (= e!222935 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(assert (=> b!364195 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168270) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11300 0))(
  ( (Unit!11301) )
))
(declare-fun lt!168271 () Unit!11300)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11300)

(assert (=> b!364195 (= lt!168271 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364196 () Bool)

(declare-fun res!203500 () Bool)

(assert (=> b!364196 (=> (not res!203500) (not e!222936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364196 (= res!203500 (not (validKeyInArray!0 (select (arr!9835 a!4289) i!1472))))))

(declare-fun b!364197 () Bool)

(declare-fun res!203497 () Bool)

(assert (=> b!364197 (=> (not res!203497) (not e!222936))))

(assert (=> b!364197 (= res!203497 (validKeyInArray!0 k0!2974))))

(declare-fun res!203495 () Bool)

(assert (=> start!36436 (=> (not res!203495) (not e!222936))))

(assert (=> start!36436 (= res!203495 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10188 a!4289))))))

(assert (=> start!36436 e!222936))

(assert (=> start!36436 true))

(declare-fun array_inv!7284 (array!20712) Bool)

(assert (=> start!36436 (array_inv!7284 a!4289)))

(declare-fun b!364192 () Bool)

(declare-fun res!203499 () Bool)

(assert (=> b!364192 (=> (not res!203499) (not e!222935))))

(assert (=> b!364192 (= res!203499 (bvsgt from!3650 #b00000000000000000000000000000000))))

(assert (= (and start!36436 res!203495) b!364196))

(assert (= (and b!364196 res!203500) b!364197))

(assert (= (and b!364197 res!203497) b!364193))

(assert (= (and b!364193 res!203498) b!364194))

(assert (= (and b!364194 res!203496) b!364192))

(assert (= (and b!364192 res!203499) b!364195))

(declare-fun m!361249 () Bool)

(assert (=> start!36436 m!361249))

(declare-fun m!361251 () Bool)

(assert (=> b!364196 m!361251))

(assert (=> b!364196 m!361251))

(declare-fun m!361253 () Bool)

(assert (=> b!364196 m!361253))

(declare-fun m!361255 () Bool)

(assert (=> b!364194 m!361255))

(declare-fun m!361257 () Bool)

(assert (=> b!364194 m!361257))

(declare-fun m!361259 () Bool)

(assert (=> b!364194 m!361259))

(declare-fun m!361261 () Bool)

(assert (=> b!364197 m!361261))

(declare-fun m!361263 () Bool)

(assert (=> b!364195 m!361263))

(declare-fun m!361265 () Bool)

(assert (=> b!364195 m!361265))

(declare-fun m!361267 () Bool)

(assert (=> b!364195 m!361267))

(check-sat (not b!364197) (not start!36436) (not b!364196) (not b!364194) (not b!364195))
(check-sat)
