; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36064 () Bool)

(assert start!36064)

(declare-fun res!201489 () Bool)

(declare-fun e!221790 () Bool)

(assert (=> start!36064 (=> (not res!201489) (not e!221790))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20390 0))(
  ( (array!20391 (arr!9678 (Array (_ BitVec 32) (_ BitVec 64))) (size!10030 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20390)

(assert (=> start!36064 (= res!201489 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10030 a!4392))))))

(assert (=> start!36064 e!221790))

(assert (=> start!36064 true))

(declare-fun array_inv!7150 (array!20390) Bool)

(assert (=> start!36064 (array_inv!7150 a!4392)))

(declare-fun b!362106 () Bool)

(declare-fun res!201490 () Bool)

(assert (=> b!362106 (=> (not res!201490) (not e!221790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362106 (= res!201490 (validKeyInArray!0 (select (arr!9678 a!4392) i!1487)))))

(declare-fun b!362107 () Bool)

(assert (=> b!362107 (= e!221790 (and (bvslt (size!10030 a!4392) #b01111111111111111111111111111111) (bvsgt i!1487 (bvadd #b00000000000000000000000000000001 i!1487))))))

(assert (= (and start!36064 res!201489) b!362106))

(assert (= (and b!362106 res!201490) b!362107))

(declare-fun m!358921 () Bool)

(assert (=> start!36064 m!358921))

(declare-fun m!358923 () Bool)

(assert (=> b!362106 m!358923))

(assert (=> b!362106 m!358923))

(declare-fun m!358925 () Bool)

(assert (=> b!362106 m!358925))

(check-sat (not start!36064) (not b!362106))
(check-sat)
