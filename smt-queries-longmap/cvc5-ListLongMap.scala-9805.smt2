; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116474 () Bool)

(assert start!116474)

(declare-fun res!917242 () Bool)

(declare-fun e!778388 () Bool)

(assert (=> start!116474 (=> (not res!917242) (not e!778388))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93133 0))(
  ( (array!93134 (arr!44973 (Array (_ BitVec 32) (_ BitVec 64))) (size!45525 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93133)

(assert (=> start!116474 (= res!917242 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45525 a!4142))))))

(assert (=> start!116474 e!778388))

(assert (=> start!116474 true))

(declare-fun array_inv!34206 (array!93133) Bool)

(assert (=> start!116474 (array_inv!34206 a!4142)))

(declare-fun b!1374014 () Bool)

(declare-fun res!917241 () Bool)

(assert (=> b!1374014 (=> (not res!917241) (not e!778388))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374014 (= res!917241 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374013 () Bool)

(declare-fun res!917243 () Bool)

(assert (=> b!1374013 (=> (not res!917243) (not e!778388))))

(assert (=> b!1374013 (= res!917243 (validKeyInArray!0 (select (arr!44973 a!4142) i!1457)))))

(declare-fun b!1374016 () Bool)

(assert (=> b!1374016 (= e!778388 false)))

(declare-fun lt!603045 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93133 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374016 (= lt!603045 (arrayCountValidKeys!0 (array!93134 (store (arr!44973 a!4142) i!1457 k!2959) (size!45525 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603044 () (_ BitVec 32))

(assert (=> b!1374016 (= lt!603044 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374015 () Bool)

(declare-fun res!917240 () Bool)

(assert (=> b!1374015 (=> (not res!917240) (not e!778388))))

(assert (=> b!1374015 (= res!917240 (and (bvslt (size!45525 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45525 a!4142))))))

(assert (= (and start!116474 res!917242) b!1374013))

(assert (= (and b!1374013 res!917243) b!1374014))

(assert (= (and b!1374014 res!917241) b!1374015))

(assert (= (and b!1374015 res!917240) b!1374016))

(declare-fun m!1256773 () Bool)

(assert (=> start!116474 m!1256773))

(declare-fun m!1256775 () Bool)

(assert (=> b!1374014 m!1256775))

(declare-fun m!1256777 () Bool)

(assert (=> b!1374013 m!1256777))

(assert (=> b!1374013 m!1256777))

(declare-fun m!1256779 () Bool)

(assert (=> b!1374013 m!1256779))

(declare-fun m!1256781 () Bool)

(assert (=> b!1374016 m!1256781))

(declare-fun m!1256783 () Bool)

(assert (=> b!1374016 m!1256783))

(declare-fun m!1256785 () Bool)

(assert (=> b!1374016 m!1256785))

(push 1)

(assert (not b!1374014))

(assert (not b!1374013))

(assert (not start!116474))

(assert (not b!1374016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

