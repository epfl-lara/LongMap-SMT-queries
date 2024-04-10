; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131042 () Bool)

(assert start!131042)

(declare-fun b!1537561 () Bool)

(declare-fun res!1054651 () Bool)

(declare-fun e!855690 () Bool)

(assert (=> b!1537561 (=> (not res!1054651) (not e!855690))))

(declare-datatypes ((array!102140 0))(
  ( (array!102141 (arr!49286 (Array (_ BitVec 32) (_ BitVec 64))) (size!49836 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102140)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537561 (= res!1054651 (validKeyInArray!0 (select (arr!49286 a!2792) i!951)))))

(declare-fun b!1537562 () Bool)

(declare-fun res!1054650 () Bool)

(assert (=> b!1537562 (=> (not res!1054650) (not e!855690))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537562 (= res!1054650 (validKeyInArray!0 (select (arr!49286 a!2792) j!64)))))

(declare-fun res!1054648 () Bool)

(assert (=> start!131042 (=> (not res!1054648) (not e!855690))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131042 (= res!1054648 (validMask!0 mask!2480))))

(assert (=> start!131042 e!855690))

(assert (=> start!131042 true))

(declare-fun array_inv!38314 (array!102140) Bool)

(assert (=> start!131042 (array_inv!38314 a!2792)))

(declare-fun b!1537563 () Bool)

(declare-fun res!1054647 () Bool)

(assert (=> b!1537563 (=> (not res!1054647) (not e!855690))))

(assert (=> b!1537563 (= res!1054647 (and (= (size!49836 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49836 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49836 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537564 () Bool)

(declare-fun res!1054649 () Bool)

(assert (=> b!1537564 (=> (not res!1054649) (not e!855690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102140 (_ BitVec 32)) Bool)

(assert (=> b!1537564 (= res!1054649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537565 () Bool)

(assert (=> b!1537565 (= e!855690 false)))

(declare-fun lt!664750 () Bool)

(declare-datatypes ((List!35760 0))(
  ( (Nil!35757) (Cons!35756 (h!37201 (_ BitVec 64)) (t!50454 List!35760)) )
))
(declare-fun arrayNoDuplicates!0 (array!102140 (_ BitVec 32) List!35760) Bool)

(assert (=> b!1537565 (= lt!664750 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35757))))

(assert (= (and start!131042 res!1054648) b!1537563))

(assert (= (and b!1537563 res!1054647) b!1537561))

(assert (= (and b!1537561 res!1054651) b!1537562))

(assert (= (and b!1537562 res!1054650) b!1537564))

(assert (= (and b!1537564 res!1054649) b!1537565))

(declare-fun m!1420083 () Bool)

(assert (=> b!1537565 m!1420083))

(declare-fun m!1420085 () Bool)

(assert (=> b!1537562 m!1420085))

(assert (=> b!1537562 m!1420085))

(declare-fun m!1420087 () Bool)

(assert (=> b!1537562 m!1420087))

(declare-fun m!1420089 () Bool)

(assert (=> start!131042 m!1420089))

(declare-fun m!1420091 () Bool)

(assert (=> start!131042 m!1420091))

(declare-fun m!1420093 () Bool)

(assert (=> b!1537561 m!1420093))

(assert (=> b!1537561 m!1420093))

(declare-fun m!1420095 () Bool)

(assert (=> b!1537561 m!1420095))

(declare-fun m!1420097 () Bool)

(assert (=> b!1537564 m!1420097))

(push 1)

(assert (not b!1537565))

(assert (not b!1537564))

(assert (not start!131042))

(assert (not b!1537561))

(assert (not b!1537562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

