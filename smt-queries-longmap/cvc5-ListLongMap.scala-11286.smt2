; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131576 () Bool)

(assert start!131576)

(declare-fun b!1541452 () Bool)

(declare-fun res!1057976 () Bool)

(declare-fun e!857329 () Bool)

(assert (=> b!1541452 (=> (not res!1057976) (not e!857329))))

(declare-datatypes ((array!102464 0))(
  ( (array!102465 (arr!49439 (Array (_ BitVec 32) (_ BitVec 64))) (size!49989 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102464)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102464 (_ BitVec 32)) Bool)

(assert (=> b!1541452 (= res!1057976 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun res!1057978 () Bool)

(assert (=> start!131576 (=> (not res!1057978) (not e!857329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131576 (= res!1057978 (validMask!0 mask!4052))))

(assert (=> start!131576 e!857329))

(assert (=> start!131576 true))

(declare-fun array_inv!38467 (array!102464) Bool)

(assert (=> start!131576 (array_inv!38467 a!3920)))

(declare-fun b!1541453 () Bool)

(assert (=> b!1541453 (= e!857329 (not true))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541453 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51480 0))(
  ( (Unit!51481) )
))
(declare-fun lt!665689 () Unit!51480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51480)

(assert (=> b!1541453 (= lt!665689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541454 () Bool)

(declare-fun res!1057974 () Bool)

(assert (=> b!1541454 (=> (not res!1057974) (not e!857329))))

(assert (=> b!1541454 (= res!1057974 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49989 a!3920))))))

(declare-fun b!1541455 () Bool)

(declare-fun res!1057975 () Bool)

(assert (=> b!1541455 (=> (not res!1057975) (not e!857329))))

(assert (=> b!1541455 (= res!1057975 (and (= (size!49989 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49989 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49989 a!3920))))))

(declare-fun b!1541456 () Bool)

(declare-fun res!1057977 () Bool)

(assert (=> b!1541456 (=> (not res!1057977) (not e!857329))))

(assert (=> b!1541456 (= res!1057977 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131576 res!1057978) b!1541455))

(assert (= (and b!1541455 res!1057975) b!1541456))

(assert (= (and b!1541456 res!1057977) b!1541454))

(assert (= (and b!1541454 res!1057974) b!1541452))

(assert (= (and b!1541452 res!1057976) b!1541453))

(declare-fun m!1423437 () Bool)

(assert (=> b!1541452 m!1423437))

(declare-fun m!1423439 () Bool)

(assert (=> start!131576 m!1423439))

(declare-fun m!1423441 () Bool)

(assert (=> start!131576 m!1423441))

(declare-fun m!1423443 () Bool)

(assert (=> b!1541453 m!1423443))

(declare-fun m!1423445 () Bool)

(assert (=> b!1541453 m!1423445))

(declare-fun m!1423447 () Bool)

(assert (=> b!1541456 m!1423447))

(push 1)

(assert (not b!1541452))

(assert (not b!1541456))

(assert (not start!131576))

(assert (not b!1541453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

