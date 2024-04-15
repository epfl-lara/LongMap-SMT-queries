; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131430 () Bool)

(assert start!131430)

(declare-fun b!1540740 () Bool)

(declare-fun e!856861 () Bool)

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540740 (= e!856861 (not (bvsge newFrom!293 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!102331 0))(
  ( (array!102332 (arr!49375 (Array (_ BitVec 32) (_ BitVec 64))) (size!49927 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102331)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102331 (_ BitVec 32)) Bool)

(assert (=> b!1540740 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-fun from!3298 () (_ BitVec 32))

(declare-datatypes ((Unit!51293 0))(
  ( (Unit!51294) )
))
(declare-fun lt!665286 () Unit!51293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51293)

(assert (=> b!1540740 (= lt!665286 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun res!1057473 () Bool)

(assert (=> start!131430 (=> (not res!1057473) (not e!856861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131430 (= res!1057473 (validMask!0 mask!4052))))

(assert (=> start!131430 e!856861))

(assert (=> start!131430 true))

(declare-fun array_inv!38608 (array!102331) Bool)

(assert (=> start!131430 (array_inv!38608 a!3920)))

(declare-fun b!1540741 () Bool)

(declare-fun res!1057470 () Bool)

(assert (=> b!1540741 (=> (not res!1057470) (not e!856861))))

(assert (=> b!1540741 (= res!1057470 (and (= (size!49927 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49927 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49927 a!3920))))))

(declare-fun b!1540742 () Bool)

(declare-fun res!1057474 () Bool)

(assert (=> b!1540742 (=> (not res!1057474) (not e!856861))))

(assert (=> b!1540742 (= res!1057474 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540743 () Bool)

(declare-fun res!1057471 () Bool)

(assert (=> b!1540743 (=> (not res!1057471) (not e!856861))))

(assert (=> b!1540743 (= res!1057471 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540744 () Bool)

(declare-fun res!1057472 () Bool)

(assert (=> b!1540744 (=> (not res!1057472) (not e!856861))))

(assert (=> b!1540744 (= res!1057472 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49927 a!3920))))))

(assert (= (and start!131430 res!1057473) b!1540741))

(assert (= (and b!1540741 res!1057470) b!1540742))

(assert (= (and b!1540742 res!1057474) b!1540744))

(assert (= (and b!1540744 res!1057472) b!1540743))

(assert (= (and b!1540743 res!1057471) b!1540740))

(declare-fun m!1422191 () Bool)

(assert (=> b!1540740 m!1422191))

(declare-fun m!1422193 () Bool)

(assert (=> b!1540740 m!1422193))

(declare-fun m!1422195 () Bool)

(assert (=> start!131430 m!1422195))

(declare-fun m!1422197 () Bool)

(assert (=> start!131430 m!1422197))

(declare-fun m!1422199 () Bool)

(assert (=> b!1540742 m!1422199))

(declare-fun m!1422201 () Bool)

(assert (=> b!1540743 m!1422201))

(check-sat (not b!1540740) (not b!1540743) (not b!1540742) (not start!131430))
(check-sat)
