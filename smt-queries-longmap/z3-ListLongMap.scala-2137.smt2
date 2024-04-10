; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36116 () Bool)

(assert start!36116)

(declare-fun b!362302 () Bool)

(declare-fun res!201589 () Bool)

(declare-fun e!221906 () Bool)

(assert (=> b!362302 (=> (not res!201589) (not e!221906))))

(declare-datatypes ((array!20432 0))(
  ( (array!20433 (arr!9698 (Array (_ BitVec 32) (_ BitVec 64))) (size!10050 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20432)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362302 (= res!201589 (and (bvslt (size!10050 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10050 a!4337))))))

(declare-fun b!362301 () Bool)

(declare-fun res!201592 () Bool)

(assert (=> b!362301 (=> (not res!201592) (not e!221906))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362301 (= res!201592 (validKeyInArray!0 k0!2980))))

(declare-fun b!362300 () Bool)

(declare-fun res!201590 () Bool)

(assert (=> b!362300 (=> (not res!201590) (not e!221906))))

(assert (=> b!362300 (= res!201590 (not (validKeyInArray!0 (select (arr!9698 a!4337) i!1478))))))

(declare-fun res!201591 () Bool)

(assert (=> start!36116 (=> (not res!201591) (not e!221906))))

(assert (=> start!36116 (= res!201591 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10050 a!4337))))))

(assert (=> start!36116 e!221906))

(assert (=> start!36116 true))

(declare-fun array_inv!7140 (array!20432) Bool)

(assert (=> start!36116 (array_inv!7140 a!4337)))

(declare-fun b!362303 () Bool)

(assert (=> b!362303 (= e!221906 false)))

(declare-fun lt!166660 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20432 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362303 (= lt!166660 (arrayCountValidKeys!0 (array!20433 (store (arr!9698 a!4337) i!1478 k0!2980) (size!10050 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166661 () (_ BitVec 32))

(assert (=> b!362303 (= lt!166661 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36116 res!201591) b!362300))

(assert (= (and b!362300 res!201590) b!362301))

(assert (= (and b!362301 res!201592) b!362302))

(assert (= (and b!362302 res!201589) b!362303))

(declare-fun m!358813 () Bool)

(assert (=> b!362301 m!358813))

(declare-fun m!358815 () Bool)

(assert (=> b!362300 m!358815))

(assert (=> b!362300 m!358815))

(declare-fun m!358817 () Bool)

(assert (=> b!362300 m!358817))

(declare-fun m!358819 () Bool)

(assert (=> start!36116 m!358819))

(declare-fun m!358821 () Bool)

(assert (=> b!362303 m!358821))

(declare-fun m!358823 () Bool)

(assert (=> b!362303 m!358823))

(declare-fun m!358825 () Bool)

(assert (=> b!362303 m!358825))

(check-sat (not b!362301) (not b!362300) (not start!36116) (not b!362303))
