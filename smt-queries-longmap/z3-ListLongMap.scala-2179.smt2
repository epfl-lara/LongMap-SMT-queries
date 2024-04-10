; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36410 () Bool)

(assert start!36410)

(declare-fun b!364179 () Bool)

(declare-fun res!203343 () Bool)

(declare-fun e!222979 () Bool)

(assert (=> b!364179 (=> (not res!203343) (not e!222979))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20690 0))(
  ( (array!20691 (arr!9824 (Array (_ BitVec 32) (_ BitVec 64))) (size!10176 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20690)

(assert (=> b!364179 (= res!203343 (and (bvslt (size!10176 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10176 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364181 () Bool)

(declare-fun res!203342 () Bool)

(assert (=> b!364181 (=> (not res!203342) (not e!222979))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20690 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364181 (= res!203342 (= (arrayCountValidKeys!0 (array!20691 (store (arr!9824 a!4289) i!1472 k0!2974) (size!10176 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364182 () Bool)

(assert (=> b!364182 (= e!222979 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun b!364183 () Bool)

(declare-fun res!203341 () Bool)

(assert (=> b!364183 (=> (not res!203341) (not e!222979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364183 (= res!203341 (not (validKeyInArray!0 (select (arr!9824 a!4289) i!1472))))))

(declare-fun b!364180 () Bool)

(declare-fun res!203340 () Bool)

(assert (=> b!364180 (=> (not res!203340) (not e!222979))))

(assert (=> b!364180 (= res!203340 (validKeyInArray!0 k0!2974))))

(declare-fun res!203344 () Bool)

(assert (=> start!36410 (=> (not res!203344) (not e!222979))))

(assert (=> start!36410 (= res!203344 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10176 a!4289))))))

(assert (=> start!36410 e!222979))

(assert (=> start!36410 true))

(declare-fun array_inv!7266 (array!20690) Bool)

(assert (=> start!36410 (array_inv!7266 a!4289)))

(assert (= (and start!36410 res!203344) b!364183))

(assert (= (and b!364183 res!203341) b!364180))

(assert (= (and b!364180 res!203340) b!364179))

(assert (= (and b!364179 res!203343) b!364181))

(assert (= (and b!364181 res!203342) b!364182))

(declare-fun m!361675 () Bool)

(assert (=> b!364181 m!361675))

(declare-fun m!361677 () Bool)

(assert (=> b!364181 m!361677))

(declare-fun m!361679 () Bool)

(assert (=> b!364181 m!361679))

(declare-fun m!361681 () Bool)

(assert (=> b!364183 m!361681))

(assert (=> b!364183 m!361681))

(declare-fun m!361683 () Bool)

(assert (=> b!364183 m!361683))

(declare-fun m!361685 () Bool)

(assert (=> b!364180 m!361685))

(declare-fun m!361687 () Bool)

(assert (=> start!36410 m!361687))

(check-sat (not b!364180) (not start!36410) (not b!364183) (not b!364181))
(check-sat)
