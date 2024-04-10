; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131448 () Bool)

(assert start!131448)

(declare-fun b!1540844 () Bool)

(declare-fun e!856963 () Bool)

(assert (=> b!1540844 (= e!856963 false)))

(declare-datatypes ((array!102351 0))(
  ( (array!102352 (arr!49384 (Array (_ BitVec 32) (_ BitVec 64))) (size!49934 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102351)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun lt!665524 () Bool)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102351 (_ BitVec 32)) Bool)

(assert (=> b!1540844 (= lt!665524 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540841 () Bool)

(declare-fun res!1057389 () Bool)

(assert (=> b!1540841 (=> (not res!1057389) (not e!856963))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540841 (= res!1057389 (and (= (size!49934 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49934 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49934 a!3920))))))

(declare-fun b!1540842 () Bool)

(declare-fun res!1057387 () Bool)

(assert (=> b!1540842 (=> (not res!1057387) (not e!856963))))

(assert (=> b!1540842 (= res!1057387 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540843 () Bool)

(declare-fun res!1057388 () Bool)

(assert (=> b!1540843 (=> (not res!1057388) (not e!856963))))

(assert (=> b!1540843 (= res!1057388 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49934 a!3920))))))

(declare-fun res!1057390 () Bool)

(assert (=> start!131448 (=> (not res!1057390) (not e!856963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131448 (= res!1057390 (validMask!0 mask!4052))))

(assert (=> start!131448 e!856963))

(assert (=> start!131448 true))

(declare-fun array_inv!38412 (array!102351) Bool)

(assert (=> start!131448 (array_inv!38412 a!3920)))

(assert (= (and start!131448 res!1057390) b!1540841))

(assert (= (and b!1540841 res!1057389) b!1540842))

(assert (= (and b!1540842 res!1057387) b!1540843))

(assert (= (and b!1540843 res!1057388) b!1540844))

(declare-fun m!1422931 () Bool)

(assert (=> b!1540844 m!1422931))

(declare-fun m!1422933 () Bool)

(assert (=> b!1540842 m!1422933))

(declare-fun m!1422935 () Bool)

(assert (=> start!131448 m!1422935))

(declare-fun m!1422937 () Bool)

(assert (=> start!131448 m!1422937))

(push 1)

(assert (not b!1540842))

(assert (not start!131448))

(assert (not b!1540844))

(check-sat)

(pop 1)

