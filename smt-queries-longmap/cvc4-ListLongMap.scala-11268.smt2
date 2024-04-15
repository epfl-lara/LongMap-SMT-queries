; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131402 () Bool)

(assert start!131402)

(declare-fun b!1540554 () Bool)

(declare-fun res!1057285 () Bool)

(declare-fun e!856776 () Bool)

(assert (=> b!1540554 (=> (not res!1057285) (not e!856776))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102303 0))(
  ( (array!102304 (arr!49361 (Array (_ BitVec 32) (_ BitVec 64))) (size!49913 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102303)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540554 (= res!1057285 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49913 a!3920))))))

(declare-fun b!1540552 () Bool)

(declare-fun res!1057284 () Bool)

(assert (=> b!1540552 (=> (not res!1057284) (not e!856776))))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540552 (= res!1057284 (and (= (size!49913 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49913 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49913 a!3920))))))

(declare-fun b!1540553 () Bool)

(declare-fun res!1057283 () Bool)

(assert (=> b!1540553 (=> (not res!1057283) (not e!856776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102303 (_ BitVec 32)) Bool)

(assert (=> b!1540553 (= res!1057283 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540555 () Bool)

(assert (=> b!1540555 (= e!856776 false)))

(declare-fun lt!665244 () Bool)

(assert (=> b!1540555 (= lt!665244 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun res!1057282 () Bool)

(assert (=> start!131402 (=> (not res!1057282) (not e!856776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131402 (= res!1057282 (validMask!0 mask!4052))))

(assert (=> start!131402 e!856776))

(assert (=> start!131402 true))

(declare-fun array_inv!38594 (array!102303) Bool)

(assert (=> start!131402 (array_inv!38594 a!3920)))

(assert (= (and start!131402 res!1057282) b!1540552))

(assert (= (and b!1540552 res!1057284) b!1540553))

(assert (= (and b!1540553 res!1057283) b!1540554))

(assert (= (and b!1540554 res!1057285) b!1540555))

(declare-fun m!1422055 () Bool)

(assert (=> b!1540553 m!1422055))

(declare-fun m!1422057 () Bool)

(assert (=> b!1540555 m!1422057))

(declare-fun m!1422059 () Bool)

(assert (=> start!131402 m!1422059))

(declare-fun m!1422061 () Bool)

(assert (=> start!131402 m!1422061))

(push 1)

(assert (not b!1540555))

(assert (not start!131402))

(assert (not b!1540553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

