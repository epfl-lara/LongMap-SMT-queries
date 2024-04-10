; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116456 () Bool)

(assert start!116456)

(declare-fun b!1373918 () Bool)

(declare-fun res!917104 () Bool)

(declare-fun e!778339 () Bool)

(assert (=> b!1373918 (=> (not res!917104) (not e!778339))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373918 (= res!917104 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1373920 () Bool)

(assert (=> b!1373920 (= e!778339 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lt!603147 () (_ BitVec 32))

(declare-datatypes ((array!93156 0))(
  ( (array!93157 (arr!44984 (Array (_ BitVec 32) (_ BitVec 64))) (size!45534 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93156)

(declare-fun arrayCountValidKeys!0 (array!93156 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373920 (= lt!603147 (arrayCountValidKeys!0 (array!93157 (store (arr!44984 a!4142) i!1457 k!2959) (size!45534 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603148 () (_ BitVec 32))

(assert (=> b!1373920 (= lt!603148 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373917 () Bool)

(declare-fun res!917102 () Bool)

(assert (=> b!1373917 (=> (not res!917102) (not e!778339))))

(assert (=> b!1373917 (= res!917102 (validKeyInArray!0 (select (arr!44984 a!4142) i!1457)))))

(declare-fun b!1373919 () Bool)

(declare-fun res!917101 () Bool)

(assert (=> b!1373919 (=> (not res!917101) (not e!778339))))

(assert (=> b!1373919 (= res!917101 (and (bvslt (size!45534 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45534 a!4142))))))

(declare-fun res!917103 () Bool)

(assert (=> start!116456 (=> (not res!917103) (not e!778339))))

(assert (=> start!116456 (= res!917103 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45534 a!4142))))))

(assert (=> start!116456 e!778339))

(assert (=> start!116456 true))

(declare-fun array_inv!34012 (array!93156) Bool)

(assert (=> start!116456 (array_inv!34012 a!4142)))

(assert (= (and start!116456 res!917103) b!1373917))

(assert (= (and b!1373917 res!917102) b!1373918))

(assert (= (and b!1373918 res!917104) b!1373919))

(assert (= (and b!1373919 res!917101) b!1373920))

(declare-fun m!1257103 () Bool)

(assert (=> b!1373918 m!1257103))

(declare-fun m!1257105 () Bool)

(assert (=> b!1373920 m!1257105))

(declare-fun m!1257107 () Bool)

(assert (=> b!1373920 m!1257107))

(declare-fun m!1257109 () Bool)

(assert (=> b!1373920 m!1257109))

(declare-fun m!1257111 () Bool)

(assert (=> b!1373917 m!1257111))

(assert (=> b!1373917 m!1257111))

(declare-fun m!1257113 () Bool)

(assert (=> b!1373917 m!1257113))

(declare-fun m!1257115 () Bool)

(assert (=> start!116456 m!1257115))

(push 1)

(assert (not b!1373918))

(assert (not start!116456))

(assert (not b!1373917))

(assert (not b!1373920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

