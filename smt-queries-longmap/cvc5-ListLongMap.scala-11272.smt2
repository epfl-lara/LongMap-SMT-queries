; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131428 () Bool)

(assert start!131428)

(declare-fun b!1540725 () Bool)

(declare-fun res!1057458 () Bool)

(declare-fun e!856854 () Bool)

(assert (=> b!1540725 (=> (not res!1057458) (not e!856854))))

(declare-datatypes ((array!102329 0))(
  ( (array!102330 (arr!49374 (Array (_ BitVec 32) (_ BitVec 64))) (size!49926 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102329)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102329 (_ BitVec 32)) Bool)

(assert (=> b!1540725 (= res!1057458 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057457 () Bool)

(assert (=> start!131428 (=> (not res!1057457) (not e!856854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131428 (= res!1057457 (validMask!0 mask!4052))))

(assert (=> start!131428 e!856854))

(assert (=> start!131428 true))

(declare-fun array_inv!38607 (array!102329) Bool)

(assert (=> start!131428 (array_inv!38607 a!3920)))

(declare-fun b!1540726 () Bool)

(assert (=> b!1540726 (= e!856854 (not true))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540726 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51291 0))(
  ( (Unit!51292) )
))
(declare-fun lt!665283 () Unit!51291)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51291)

(assert (=> b!1540726 (= lt!665283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1540727 () Bool)

(declare-fun res!1057455 () Bool)

(assert (=> b!1540727 (=> (not res!1057455) (not e!856854))))

(assert (=> b!1540727 (= res!1057455 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49926 a!3920))))))

(declare-fun b!1540728 () Bool)

(declare-fun res!1057456 () Bool)

(assert (=> b!1540728 (=> (not res!1057456) (not e!856854))))

(assert (=> b!1540728 (= res!1057456 (and (= (size!49926 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49926 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49926 a!3920))))))

(declare-fun b!1540729 () Bool)

(declare-fun res!1057459 () Bool)

(assert (=> b!1540729 (=> (not res!1057459) (not e!856854))))

(assert (=> b!1540729 (= res!1057459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131428 res!1057457) b!1540728))

(assert (= (and b!1540728 res!1057456) b!1540725))

(assert (= (and b!1540725 res!1057458) b!1540727))

(assert (= (and b!1540727 res!1057455) b!1540729))

(assert (= (and b!1540729 res!1057459) b!1540726))

(declare-fun m!1422179 () Bool)

(assert (=> b!1540725 m!1422179))

(declare-fun m!1422181 () Bool)

(assert (=> start!131428 m!1422181))

(declare-fun m!1422183 () Bool)

(assert (=> start!131428 m!1422183))

(declare-fun m!1422185 () Bool)

(assert (=> b!1540726 m!1422185))

(declare-fun m!1422187 () Bool)

(assert (=> b!1540726 m!1422187))

(declare-fun m!1422189 () Bool)

(assert (=> b!1540729 m!1422189))

(push 1)

(assert (not b!1540725))

(assert (not b!1540726))

(assert (not start!131428))

(assert (not b!1540729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

