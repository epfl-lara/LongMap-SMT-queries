; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131446 () Bool)

(assert start!131446)

(declare-fun res!1057566 () Bool)

(declare-fun e!856909 () Bool)

(assert (=> start!131446 (=> (not res!1057566) (not e!856909))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131446 (= res!1057566 (validMask!0 mask!4052))))

(assert (=> start!131446 e!856909))

(assert (=> start!131446 true))

(declare-datatypes ((array!102347 0))(
  ( (array!102348 (arr!49383 (Array (_ BitVec 32) (_ BitVec 64))) (size!49935 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102347)

(declare-fun array_inv!38616 (array!102347) Bool)

(assert (=> start!131446 (array_inv!38616 a!3920)))

(declare-fun b!1540836 () Bool)

(declare-fun res!1057567 () Bool)

(assert (=> b!1540836 (=> (not res!1057567) (not e!856909))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540836 (= res!1057567 (and (= (size!49935 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49935 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49935 a!3920))))))

(declare-fun b!1540837 () Bool)

(assert (=> b!1540837 (= e!856909 false)))

(declare-fun lt!665310 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102347 (_ BitVec 32)) Bool)

(assert (=> b!1540837 (= lt!665310 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131446 res!1057566) b!1540836))

(assert (= (and b!1540836 res!1057567) b!1540837))

(declare-fun m!1422275 () Bool)

(assert (=> start!131446 m!1422275))

(declare-fun m!1422277 () Bool)

(assert (=> start!131446 m!1422277))

(declare-fun m!1422279 () Bool)

(assert (=> b!1540837 m!1422279))

(push 1)

(assert (not start!131446))

(assert (not b!1540837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

