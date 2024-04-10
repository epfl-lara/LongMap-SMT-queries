; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93496 () Bool)

(assert start!93496)

(declare-fun res!707335 () Bool)

(declare-fun e!602410 () Bool)

(assert (=> start!93496 (=> (not res!707335) (not e!602410))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66795 0))(
  ( (array!66796 (arr!32115 (Array (_ BitVec 32) (_ BitVec 64))) (size!32651 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66795)

(assert (=> start!93496 (= res!707335 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32651 a!3475)) (bvslt (size!32651 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93496 e!602410))

(assert (=> start!93496 true))

(declare-fun array_inv!24895 (array!66795) Bool)

(assert (=> start!93496 (array_inv!24895 a!3475)))

(declare-fun b!1058760 () Bool)

(declare-fun res!707336 () Bool)

(assert (=> b!1058760 (=> (not res!707336) (not e!602410))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058760 (= res!707336 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058761 () Bool)

(declare-fun res!707334 () Bool)

(assert (=> b!1058761 (=> (not res!707334) (not e!602410))))

(assert (=> b!1058761 (= res!707334 (and (not (= (select (arr!32115 a!3475) from!2850) k!2741)) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32651 a!3475))))))

(declare-fun b!1058762 () Bool)

(assert (=> b!1058762 (= e!602410 (not (arrayContainsKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850))))))

(assert (= (and start!93496 res!707335) b!1058760))

(assert (= (and b!1058760 res!707336) b!1058761))

(assert (= (and b!1058761 res!707334) b!1058762))

(declare-fun m!978413 () Bool)

(assert (=> start!93496 m!978413))

(declare-fun m!978415 () Bool)

(assert (=> b!1058760 m!978415))

(declare-fun m!978417 () Bool)

(assert (=> b!1058761 m!978417))

(declare-fun m!978419 () Bool)

(assert (=> b!1058762 m!978419))

(push 1)

(assert (not start!93496))

(assert (not b!1058760))

(assert (not b!1058762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

