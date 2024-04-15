; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131398 () Bool)

(assert start!131398)

(declare-fun b!1540529 () Bool)

(declare-fun res!1057261 () Bool)

(declare-fun e!856764 () Bool)

(assert (=> b!1540529 (=> (not res!1057261) (not e!856764))))

(declare-datatypes ((array!102299 0))(
  ( (array!102300 (arr!49359 (Array (_ BitVec 32) (_ BitVec 64))) (size!49911 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102299)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102299 (_ BitVec 32)) Bool)

(assert (=> b!1540529 (= res!1057261 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540531 () Bool)

(assert (=> b!1540531 (= e!856764 false)))

(declare-fun lt!665238 () Bool)

(assert (=> b!1540531 (= lt!665238 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540528 () Bool)

(declare-fun res!1057260 () Bool)

(assert (=> b!1540528 (=> (not res!1057260) (not e!856764))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540528 (= res!1057260 (and (= (size!49911 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49911 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49911 a!3920))))))

(declare-fun b!1540530 () Bool)

(declare-fun res!1057259 () Bool)

(assert (=> b!1540530 (=> (not res!1057259) (not e!856764))))

(assert (=> b!1540530 (= res!1057259 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49911 a!3920))))))

(declare-fun res!1057258 () Bool)

(assert (=> start!131398 (=> (not res!1057258) (not e!856764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131398 (= res!1057258 (validMask!0 mask!4052))))

(assert (=> start!131398 e!856764))

(assert (=> start!131398 true))

(declare-fun array_inv!38592 (array!102299) Bool)

(assert (=> start!131398 (array_inv!38592 a!3920)))

(assert (= (and start!131398 res!1057258) b!1540528))

(assert (= (and b!1540528 res!1057260) b!1540529))

(assert (= (and b!1540529 res!1057261) b!1540530))

(assert (= (and b!1540530 res!1057259) b!1540531))

(declare-fun m!1422039 () Bool)

(assert (=> b!1540529 m!1422039))

(declare-fun m!1422041 () Bool)

(assert (=> b!1540531 m!1422041))

(declare-fun m!1422043 () Bool)

(assert (=> start!131398 m!1422043))

(declare-fun m!1422045 () Bool)

(assert (=> start!131398 m!1422045))

(push 1)

(assert (not b!1540531))

(assert (not b!1540529))

(assert (not start!131398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

