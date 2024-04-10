; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36078 () Bool)

(assert start!36078)

(declare-fun res!201492 () Bool)

(declare-fun e!221824 () Bool)

(assert (=> start!36078 (=> (not res!201492) (not e!221824))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20409 0))(
  ( (array!20410 (arr!9688 (Array (_ BitVec 32) (_ BitVec 64))) (size!10040 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20409)

(assert (=> start!36078 (= res!201492 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10040 a!4392))))))

(assert (=> start!36078 e!221824))

(assert (=> start!36078 true))

(declare-fun array_inv!7130 (array!20409) Bool)

(assert (=> start!36078 (array_inv!7130 a!4392)))

(declare-fun b!362159 () Bool)

(declare-fun res!201493 () Bool)

(assert (=> b!362159 (=> (not res!201493) (not e!221824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362159 (= res!201493 (validKeyInArray!0 (select (arr!9688 a!4392) i!1487)))))

(declare-fun b!362160 () Bool)

(assert (=> b!362160 (= e!221824 (and (bvslt (size!10040 a!4392) #b01111111111111111111111111111111) (bvsgt i!1487 (bvadd #b00000000000000000000000000000001 i!1487))))))

(assert (= (and start!36078 res!201492) b!362159))

(assert (= (and b!362159 res!201493) b!362160))

(declare-fun m!358697 () Bool)

(assert (=> start!36078 m!358697))

(declare-fun m!358699 () Bool)

(assert (=> b!362159 m!358699))

(assert (=> b!362159 m!358699))

(declare-fun m!358701 () Bool)

(assert (=> b!362159 m!358701))

(push 1)

(assert (not start!36078))

(assert (not b!362159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

