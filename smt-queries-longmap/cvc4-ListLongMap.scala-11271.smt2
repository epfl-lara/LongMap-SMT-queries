; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131882 () Bool)

(assert start!131882)

(declare-fun b!1543414 () Bool)

(declare-fun res!1058388 () Bool)

(declare-fun e!858537 () Bool)

(assert (=> b!1543414 (=> (not res!1058388) (not e!858537))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102493 0))(
  ( (array!102494 (arr!49448 (Array (_ BitVec 32) (_ BitVec 64))) (size!49999 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102493)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1543414 (= res!1058388 (and (= (size!49999 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49999 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49999 a!3920))))))

(declare-fun res!1058386 () Bool)

(assert (=> start!131882 (=> (not res!1058386) (not e!858537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131882 (= res!1058386 (validMask!0 mask!4052))))

(assert (=> start!131882 e!858537))

(assert (=> start!131882 true))

(declare-fun array_inv!38729 (array!102493) Bool)

(assert (=> start!131882 (array_inv!38729 a!3920)))

(declare-fun b!1543415 () Bool)

(assert (=> b!1543415 (= e!858537 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102493 (_ BitVec 32)) Bool)

(assert (=> b!1543415 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51381 0))(
  ( (Unit!51382) )
))
(declare-fun lt!666465 () Unit!51381)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51381)

(assert (=> b!1543415 (= lt!666465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1543416 () Bool)

(declare-fun res!1058385 () Bool)

(assert (=> b!1543416 (=> (not res!1058385) (not e!858537))))

(assert (=> b!1543416 (= res!1058385 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543417 () Bool)

(declare-fun res!1058387 () Bool)

(assert (=> b!1543417 (=> (not res!1058387) (not e!858537))))

(assert (=> b!1543417 (= res!1058387 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543418 () Bool)

(declare-fun res!1058384 () Bool)

(assert (=> b!1543418 (=> (not res!1058384) (not e!858537))))

(assert (=> b!1543418 (= res!1058384 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49999 a!3920))))))

(assert (= (and start!131882 res!1058386) b!1543414))

(assert (= (and b!1543414 res!1058388) b!1543417))

(assert (= (and b!1543417 res!1058387) b!1543418))

(assert (= (and b!1543418 res!1058384) b!1543416))

(assert (= (and b!1543416 res!1058385) b!1543415))

(declare-fun m!1425281 () Bool)

(assert (=> start!131882 m!1425281))

(declare-fun m!1425283 () Bool)

(assert (=> start!131882 m!1425283))

(declare-fun m!1425285 () Bool)

(assert (=> b!1543415 m!1425285))

(declare-fun m!1425287 () Bool)

(assert (=> b!1543415 m!1425287))

(declare-fun m!1425289 () Bool)

(assert (=> b!1543416 m!1425289))

(declare-fun m!1425291 () Bool)

(assert (=> b!1543417 m!1425291))

(push 1)

(assert (not b!1543417))

(assert (not start!131882))

(assert (not b!1543416))

(assert (not b!1543415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

