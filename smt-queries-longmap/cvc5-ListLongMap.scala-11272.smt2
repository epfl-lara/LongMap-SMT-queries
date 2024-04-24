; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131890 () Bool)

(assert start!131890)

(declare-fun b!1543474 () Bool)

(declare-fun res!1058448 () Bool)

(declare-fun e!858562 () Bool)

(assert (=> b!1543474 (=> (not res!1058448) (not e!858562))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102501 0))(
  ( (array!102502 (arr!49452 (Array (_ BitVec 32) (_ BitVec 64))) (size!50003 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102501)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543474 (= res!1058448 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!50003 a!3920))))))

(declare-fun res!1058444 () Bool)

(assert (=> start!131890 (=> (not res!1058444) (not e!858562))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131890 (= res!1058444 (validMask!0 mask!4052))))

(assert (=> start!131890 e!858562))

(assert (=> start!131890 true))

(declare-fun array_inv!38733 (array!102501) Bool)

(assert (=> start!131890 (array_inv!38733 a!3920)))

(declare-fun b!1543475 () Bool)

(declare-fun res!1058445 () Bool)

(assert (=> b!1543475 (=> (not res!1058445) (not e!858562))))

(assert (=> b!1543475 (= res!1058445 (and (= (size!50003 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50003 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50003 a!3920))))))

(declare-fun b!1543476 () Bool)

(assert (=> b!1543476 (= e!858562 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102501 (_ BitVec 32)) Bool)

(assert (=> b!1543476 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51389 0))(
  ( (Unit!51390) )
))
(declare-fun lt!666477 () Unit!51389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51389)

(assert (=> b!1543476 (= lt!666477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1543477 () Bool)

(declare-fun res!1058447 () Bool)

(assert (=> b!1543477 (=> (not res!1058447) (not e!858562))))

(assert (=> b!1543477 (= res!1058447 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543478 () Bool)

(declare-fun res!1058446 () Bool)

(assert (=> b!1543478 (=> (not res!1058446) (not e!858562))))

(assert (=> b!1543478 (= res!1058446 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131890 res!1058444) b!1543475))

(assert (= (and b!1543475 res!1058445) b!1543477))

(assert (= (and b!1543477 res!1058447) b!1543474))

(assert (= (and b!1543474 res!1058448) b!1543478))

(assert (= (and b!1543478 res!1058446) b!1543476))

(declare-fun m!1425329 () Bool)

(assert (=> start!131890 m!1425329))

(declare-fun m!1425331 () Bool)

(assert (=> start!131890 m!1425331))

(declare-fun m!1425333 () Bool)

(assert (=> b!1543476 m!1425333))

(declare-fun m!1425335 () Bool)

(assert (=> b!1543476 m!1425335))

(declare-fun m!1425337 () Bool)

(assert (=> b!1543477 m!1425337))

(declare-fun m!1425339 () Bool)

(assert (=> b!1543478 m!1425339))

(push 1)

(assert (not b!1543477))

(assert (not b!1543476))

(assert (not start!131890))

(assert (not b!1543478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

