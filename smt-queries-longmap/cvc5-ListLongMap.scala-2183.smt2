; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36422 () Bool)

(assert start!36422)

(declare-fun b!364078 () Bool)

(declare-fun res!203380 () Bool)

(declare-fun e!222882 () Bool)

(assert (=> b!364078 (=> (not res!203380) (not e!222882))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364078 (= res!203380 (validKeyInArray!0 k!2974))))

(declare-fun b!364080 () Bool)

(assert (=> b!364080 (= e!222882 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168247 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20698 0))(
  ( (array!20699 (arr!9828 (Array (_ BitVec 32) (_ BitVec 64))) (size!10181 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20698)

(declare-fun arrayCountValidKeys!0 (array!20698 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364080 (= lt!168247 (arrayCountValidKeys!0 (array!20699 (store (arr!9828 a!4289) i!1472 k!2974) (size!10181 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168246 () (_ BitVec 32))

(assert (=> b!364080 (= lt!168246 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364079 () Bool)

(declare-fun res!203382 () Bool)

(assert (=> b!364079 (=> (not res!203382) (not e!222882))))

(assert (=> b!364079 (= res!203382 (and (bvslt (size!10181 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10181 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364077 () Bool)

(declare-fun res!203383 () Bool)

(assert (=> b!364077 (=> (not res!203383) (not e!222882))))

(assert (=> b!364077 (= res!203383 (not (validKeyInArray!0 (select (arr!9828 a!4289) i!1472))))))

(declare-fun res!203381 () Bool)

(assert (=> start!36422 (=> (not res!203381) (not e!222882))))

(assert (=> start!36422 (= res!203381 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10181 a!4289))))))

(assert (=> start!36422 e!222882))

(assert (=> start!36422 true))

(declare-fun array_inv!7277 (array!20698) Bool)

(assert (=> start!36422 (array_inv!7277 a!4289)))

(assert (= (and start!36422 res!203381) b!364077))

(assert (= (and b!364077 res!203383) b!364078))

(assert (= (and b!364078 res!203380) b!364079))

(assert (= (and b!364079 res!203382) b!364080))

(declare-fun m!361133 () Bool)

(assert (=> b!364078 m!361133))

(declare-fun m!361135 () Bool)

(assert (=> b!364080 m!361135))

(declare-fun m!361137 () Bool)

(assert (=> b!364080 m!361137))

(declare-fun m!361139 () Bool)

(assert (=> b!364080 m!361139))

(declare-fun m!361141 () Bool)

(assert (=> b!364077 m!361141))

(assert (=> b!364077 m!361141))

(declare-fun m!361143 () Bool)

(assert (=> b!364077 m!361143))

(declare-fun m!361145 () Bool)

(assert (=> start!36422 m!361145))

(push 1)

(assert (not b!364077))

(assert (not b!364078))

(assert (not b!364080))

(assert (not start!36422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

