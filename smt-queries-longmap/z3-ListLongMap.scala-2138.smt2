; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36122 () Bool)

(assert start!36122)

(declare-fun b!362339 () Bool)

(declare-fun e!221924 () Bool)

(assert (=> b!362339 (= e!221924 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166679 () (_ BitVec 32))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-datatypes ((array!20438 0))(
  ( (array!20439 (arr!9701 (Array (_ BitVec 32) (_ BitVec 64))) (size!10053 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20438)

(declare-fun arrayCountValidKeys!0 (array!20438 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362339 (= lt!166679 (arrayCountValidKeys!0 (array!20439 (store (arr!9701 a!4337) i!1478 k0!2980) (size!10053 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166678 () (_ BitVec 32))

(assert (=> b!362339 (= lt!166678 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362337 () Bool)

(declare-fun res!201626 () Bool)

(assert (=> b!362337 (=> (not res!201626) (not e!221924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362337 (= res!201626 (validKeyInArray!0 k0!2980))))

(declare-fun b!362336 () Bool)

(declare-fun res!201625 () Bool)

(assert (=> b!362336 (=> (not res!201625) (not e!221924))))

(assert (=> b!362336 (= res!201625 (not (validKeyInArray!0 (select (arr!9701 a!4337) i!1478))))))

(declare-fun res!201627 () Bool)

(assert (=> start!36122 (=> (not res!201627) (not e!221924))))

(assert (=> start!36122 (= res!201627 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10053 a!4337))))))

(assert (=> start!36122 e!221924))

(assert (=> start!36122 true))

(declare-fun array_inv!7143 (array!20438) Bool)

(assert (=> start!36122 (array_inv!7143 a!4337)))

(declare-fun b!362338 () Bool)

(declare-fun res!201628 () Bool)

(assert (=> b!362338 (=> (not res!201628) (not e!221924))))

(assert (=> b!362338 (= res!201628 (and (bvslt (size!10053 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10053 a!4337))))))

(assert (= (and start!36122 res!201627) b!362336))

(assert (= (and b!362336 res!201625) b!362337))

(assert (= (and b!362337 res!201626) b!362338))

(assert (= (and b!362338 res!201628) b!362339))

(declare-fun m!358855 () Bool)

(assert (=> b!362339 m!358855))

(declare-fun m!358857 () Bool)

(assert (=> b!362339 m!358857))

(declare-fun m!358859 () Bool)

(assert (=> b!362339 m!358859))

(declare-fun m!358861 () Bool)

(assert (=> b!362337 m!358861))

(declare-fun m!358863 () Bool)

(assert (=> b!362336 m!358863))

(assert (=> b!362336 m!358863))

(declare-fun m!358865 () Bool)

(assert (=> b!362336 m!358865))

(declare-fun m!358867 () Bool)

(assert (=> start!36122 m!358867))

(check-sat (not start!36122) (not b!362339) (not b!362337) (not b!362336))
