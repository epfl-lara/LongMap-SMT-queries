; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131442 () Bool)

(assert start!131442)

(declare-fun b!1540808 () Bool)

(declare-fun e!856944 () Bool)

(assert (=> b!1540808 (= e!856944 false)))

(declare-datatypes ((array!102345 0))(
  ( (array!102346 (arr!49381 (Array (_ BitVec 32) (_ BitVec 64))) (size!49931 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102345)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun lt!665515 () Bool)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102345 (_ BitVec 32)) Bool)

(assert (=> b!1540808 (= lt!665515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540807 () Bool)

(declare-fun res!1057354 () Bool)

(assert (=> b!1540807 (=> (not res!1057354) (not e!856944))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540807 (= res!1057354 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49931 a!3920))))))

(declare-fun res!1057351 () Bool)

(assert (=> start!131442 (=> (not res!1057351) (not e!856944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131442 (= res!1057351 (validMask!0 mask!4052))))

(assert (=> start!131442 e!856944))

(assert (=> start!131442 true))

(declare-fun array_inv!38409 (array!102345) Bool)

(assert (=> start!131442 (array_inv!38409 a!3920)))

(declare-fun b!1540806 () Bool)

(declare-fun res!1057353 () Bool)

(assert (=> b!1540806 (=> (not res!1057353) (not e!856944))))

(assert (=> b!1540806 (= res!1057353 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540805 () Bool)

(declare-fun res!1057352 () Bool)

(assert (=> b!1540805 (=> (not res!1057352) (not e!856944))))

(assert (=> b!1540805 (= res!1057352 (and (= (size!49931 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49931 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49931 a!3920))))))

(assert (= (and start!131442 res!1057351) b!1540805))

(assert (= (and b!1540805 res!1057352) b!1540806))

(assert (= (and b!1540806 res!1057353) b!1540807))

(assert (= (and b!1540807 res!1057354) b!1540808))

(declare-fun m!1422907 () Bool)

(assert (=> b!1540808 m!1422907))

(declare-fun m!1422909 () Bool)

(assert (=> start!131442 m!1422909))

(declare-fun m!1422911 () Bool)

(assert (=> start!131442 m!1422911))

(declare-fun m!1422913 () Bool)

(assert (=> b!1540806 m!1422913))

(push 1)

(assert (not start!131442))

(assert (not b!1540806))

(assert (not b!1540808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

