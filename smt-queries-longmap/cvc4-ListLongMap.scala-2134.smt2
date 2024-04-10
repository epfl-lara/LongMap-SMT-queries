; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36082 () Bool)

(assert start!36082)

(declare-fun res!201504 () Bool)

(declare-fun e!221836 () Bool)

(assert (=> start!36082 (=> (not res!201504) (not e!221836))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20413 0))(
  ( (array!20414 (arr!9690 (Array (_ BitVec 32) (_ BitVec 64))) (size!10042 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20413)

(assert (=> start!36082 (= res!201504 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10042 a!4392))))))

(assert (=> start!36082 e!221836))

(assert (=> start!36082 true))

(declare-fun array_inv!7132 (array!20413) Bool)

(assert (=> start!36082 (array_inv!7132 a!4392)))

(declare-fun b!362171 () Bool)

(declare-fun res!201505 () Bool)

(assert (=> b!362171 (=> (not res!201505) (not e!221836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362171 (= res!201505 (validKeyInArray!0 (select (arr!9690 a!4392) i!1487)))))

(declare-fun b!362172 () Bool)

(assert (=> b!362172 (= e!221836 (and (bvslt (size!10042 a!4392) #b01111111111111111111111111111111) (bvsgt i!1487 (bvadd #b00000000000000000000000000000001 i!1487))))))

(assert (= (and start!36082 res!201504) b!362171))

(assert (= (and b!362171 res!201505) b!362172))

(declare-fun m!358709 () Bool)

(assert (=> start!36082 m!358709))

(declare-fun m!358711 () Bool)

(assert (=> b!362171 m!358711))

(assert (=> b!362171 m!358711))

(declare-fun m!358713 () Bool)

(assert (=> b!362171 m!358713))

(push 1)

(assert (not start!36082))

(assert (not b!362171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

