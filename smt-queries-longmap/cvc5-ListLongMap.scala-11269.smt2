; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131872 () Bool)

(assert start!131872)

(declare-fun b!1543352 () Bool)

(declare-fun e!858508 () Bool)

(assert (=> b!1543352 (= e!858508 false)))

(declare-datatypes ((array!102483 0))(
  ( (array!102484 (arr!49443 (Array (_ BitVec 32) (_ BitVec 64))) (size!49994 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102483)

(declare-fun lt!666450 () Bool)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102483 (_ BitVec 32)) Bool)

(assert (=> b!1543352 (= lt!666450 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543349 () Bool)

(declare-fun res!1058322 () Bool)

(assert (=> b!1543349 (=> (not res!1058322) (not e!858508))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1543349 (= res!1058322 (and (= (size!49994 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49994 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49994 a!3920))))))

(declare-fun b!1543351 () Bool)

(declare-fun res!1058321 () Bool)

(assert (=> b!1543351 (=> (not res!1058321) (not e!858508))))

(assert (=> b!1543351 (= res!1058321 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49994 a!3920))))))

(declare-fun res!1058319 () Bool)

(assert (=> start!131872 (=> (not res!1058319) (not e!858508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131872 (= res!1058319 (validMask!0 mask!4052))))

(assert (=> start!131872 e!858508))

(assert (=> start!131872 true))

(declare-fun array_inv!38724 (array!102483) Bool)

(assert (=> start!131872 (array_inv!38724 a!3920)))

(declare-fun b!1543350 () Bool)

(declare-fun res!1058320 () Bool)

(assert (=> b!1543350 (=> (not res!1058320) (not e!858508))))

(assert (=> b!1543350 (= res!1058320 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131872 res!1058319) b!1543349))

(assert (= (and b!1543349 res!1058322) b!1543350))

(assert (= (and b!1543350 res!1058320) b!1543351))

(assert (= (and b!1543351 res!1058321) b!1543352))

(declare-fun m!1425237 () Bool)

(assert (=> b!1543352 m!1425237))

(declare-fun m!1425239 () Bool)

(assert (=> start!131872 m!1425239))

(declare-fun m!1425241 () Bool)

(assert (=> start!131872 m!1425241))

(declare-fun m!1425243 () Bool)

(assert (=> b!1543350 m!1425243))

(push 1)

(assert (not b!1543352))

(assert (not start!131872))

(assert (not b!1543350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

