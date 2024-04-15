; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131476 () Bool)

(assert start!131476)

(declare-fun res!1057665 () Bool)

(declare-fun e!856998 () Bool)

(assert (=> start!131476 (=> (not res!1057665) (not e!856998))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131476 (= res!1057665 (validMask!0 mask!4052))))

(assert (=> start!131476 e!856998))

(assert (=> start!131476 true))

(declare-datatypes ((array!102377 0))(
  ( (array!102378 (arr!49398 (Array (_ BitVec 32) (_ BitVec 64))) (size!49950 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102377)

(declare-fun array_inv!38631 (array!102377) Bool)

(assert (=> start!131476 (array_inv!38631 a!3920)))

(declare-fun b!1540935 () Bool)

(declare-fun res!1057666 () Bool)

(assert (=> b!1540935 (=> (not res!1057666) (not e!856998))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540935 (= res!1057666 (and (= (size!49950 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49950 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49950 a!3920))))))

(declare-fun b!1540936 () Bool)

(assert (=> b!1540936 (= e!856998 false)))

(declare-fun lt!665346 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102377 (_ BitVec 32)) Bool)

(assert (=> b!1540936 (= lt!665346 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131476 res!1057665) b!1540935))

(assert (= (and b!1540935 res!1057666) b!1540936))

(declare-fun m!1422365 () Bool)

(assert (=> start!131476 m!1422365))

(declare-fun m!1422367 () Bool)

(assert (=> start!131476 m!1422367))

(declare-fun m!1422369 () Bool)

(assert (=> b!1540936 m!1422369))

(push 1)

(assert (not b!1540936))

(assert (not start!131476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

