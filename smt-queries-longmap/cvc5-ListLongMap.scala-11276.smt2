; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131452 () Bool)

(assert start!131452)

(declare-fun res!1057584 () Bool)

(declare-fun e!856926 () Bool)

(assert (=> start!131452 (=> (not res!1057584) (not e!856926))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131452 (= res!1057584 (validMask!0 mask!4052))))

(assert (=> start!131452 e!856926))

(assert (=> start!131452 true))

(declare-datatypes ((array!102353 0))(
  ( (array!102354 (arr!49386 (Array (_ BitVec 32) (_ BitVec 64))) (size!49938 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102353)

(declare-fun array_inv!38619 (array!102353) Bool)

(assert (=> start!131452 (array_inv!38619 a!3920)))

(declare-fun b!1540854 () Bool)

(declare-fun res!1057585 () Bool)

(assert (=> b!1540854 (=> (not res!1057585) (not e!856926))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540854 (= res!1057585 (and (= (size!49938 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49938 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49938 a!3920))))))

(declare-fun b!1540855 () Bool)

(assert (=> b!1540855 (= e!856926 false)))

(declare-fun lt!665319 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102353 (_ BitVec 32)) Bool)

(assert (=> b!1540855 (= lt!665319 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131452 res!1057584) b!1540854))

(assert (= (and b!1540854 res!1057585) b!1540855))

(declare-fun m!1422293 () Bool)

(assert (=> start!131452 m!1422293))

(declare-fun m!1422295 () Bool)

(assert (=> start!131452 m!1422295))

(declare-fun m!1422297 () Bool)

(assert (=> b!1540855 m!1422297))

(push 1)

(assert (not b!1540855))

(assert (not start!131452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

