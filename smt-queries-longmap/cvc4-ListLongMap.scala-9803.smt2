; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116472 () Bool)

(assert start!116472)

(declare-fun b!1374016 () Bool)

(declare-fun e!778387 () Bool)

(assert (=> b!1374016 (= e!778387 false)))

(declare-fun lt!603196 () (_ BitVec 32))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93172 0))(
  ( (array!93173 (arr!44992 (Array (_ BitVec 32) (_ BitVec 64))) (size!45542 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93172)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93172 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374016 (= lt!603196 (arrayCountValidKeys!0 (array!93173 (store (arr!44992 a!4142) i!1457 k!2959) (size!45542 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603195 () (_ BitVec 32))

(assert (=> b!1374016 (= lt!603195 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917199 () Bool)

(assert (=> start!116472 (=> (not res!917199) (not e!778387))))

(assert (=> start!116472 (= res!917199 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45542 a!4142))))))

(assert (=> start!116472 e!778387))

(assert (=> start!116472 true))

(declare-fun array_inv!34020 (array!93172) Bool)

(assert (=> start!116472 (array_inv!34020 a!4142)))

(declare-fun b!1374015 () Bool)

(declare-fun res!917198 () Bool)

(assert (=> b!1374015 (=> (not res!917198) (not e!778387))))

(assert (=> b!1374015 (= res!917198 (and (bvslt (size!45542 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45542 a!4142))))))

(declare-fun b!1374014 () Bool)

(declare-fun res!917200 () Bool)

(assert (=> b!1374014 (=> (not res!917200) (not e!778387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374014 (= res!917200 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374013 () Bool)

(declare-fun res!917197 () Bool)

(assert (=> b!1374013 (=> (not res!917197) (not e!778387))))

(assert (=> b!1374013 (= res!917197 (validKeyInArray!0 (select (arr!44992 a!4142) i!1457)))))

(assert (= (and start!116472 res!917199) b!1374013))

(assert (= (and b!1374013 res!917197) b!1374014))

(assert (= (and b!1374014 res!917200) b!1374015))

(assert (= (and b!1374015 res!917198) b!1374016))

(declare-fun m!1257215 () Bool)

(assert (=> b!1374016 m!1257215))

(declare-fun m!1257217 () Bool)

(assert (=> b!1374016 m!1257217))

(declare-fun m!1257219 () Bool)

(assert (=> b!1374016 m!1257219))

(declare-fun m!1257221 () Bool)

(assert (=> start!116472 m!1257221))

(declare-fun m!1257223 () Bool)

(assert (=> b!1374014 m!1257223))

(declare-fun m!1257225 () Bool)

(assert (=> b!1374013 m!1257225))

(assert (=> b!1374013 m!1257225))

(declare-fun m!1257227 () Bool)

(assert (=> b!1374013 m!1257227))

(push 1)

(assert (not b!1374014))

(assert (not start!116472))

(assert (not b!1374013))

(assert (not b!1374016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

