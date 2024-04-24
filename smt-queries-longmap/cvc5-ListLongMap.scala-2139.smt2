; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36116 () Bool)

(assert start!36116)

(declare-fun b!362337 () Bool)

(declare-fun res!201672 () Bool)

(declare-fun e!221917 () Bool)

(assert (=> b!362337 (=> (not res!201672) (not e!221917))))

(declare-datatypes ((array!20427 0))(
  ( (array!20428 (arr!9695 (Array (_ BitVec 32) (_ BitVec 64))) (size!10047 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20427)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362337 (= res!201672 (and (bvslt (size!10047 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10047 a!4337))))))

(declare-fun b!362336 () Bool)

(declare-fun res!201671 () Bool)

(assert (=> b!362336 (=> (not res!201671) (not e!221917))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362336 (= res!201671 (validKeyInArray!0 k!2980))))

(declare-fun res!201670 () Bool)

(assert (=> start!36116 (=> (not res!201670) (not e!221917))))

(assert (=> start!36116 (= res!201670 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10047 a!4337))))))

(assert (=> start!36116 e!221917))

(assert (=> start!36116 true))

(declare-fun array_inv!7167 (array!20427) Bool)

(assert (=> start!36116 (array_inv!7167 a!4337)))

(declare-fun b!362338 () Bool)

(assert (=> b!362338 (= e!221917 false)))

(declare-fun lt!166722 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20427 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362338 (= lt!166722 (arrayCountValidKeys!0 (array!20428 (store (arr!9695 a!4337) i!1478 k!2980) (size!10047 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166721 () (_ BitVec 32))

(assert (=> b!362338 (= lt!166721 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362335 () Bool)

(declare-fun res!201673 () Bool)

(assert (=> b!362335 (=> (not res!201673) (not e!221917))))

(assert (=> b!362335 (= res!201673 (not (validKeyInArray!0 (select (arr!9695 a!4337) i!1478))))))

(assert (= (and start!36116 res!201670) b!362335))

(assert (= (and b!362335 res!201673) b!362336))

(assert (= (and b!362336 res!201671) b!362337))

(assert (= (and b!362337 res!201672) b!362338))

(declare-fun m!359141 () Bool)

(assert (=> b!362336 m!359141))

(declare-fun m!359143 () Bool)

(assert (=> start!36116 m!359143))

(declare-fun m!359145 () Bool)

(assert (=> b!362338 m!359145))

(declare-fun m!359147 () Bool)

(assert (=> b!362338 m!359147))

(declare-fun m!359149 () Bool)

(assert (=> b!362338 m!359149))

(declare-fun m!359151 () Bool)

(assert (=> b!362335 m!359151))

(assert (=> b!362335 m!359151))

(declare-fun m!359153 () Bool)

(assert (=> b!362335 m!359153))

(push 1)

(assert (not b!362338))

(assert (not b!362336))

(assert (not b!362335))

(assert (not start!36116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

