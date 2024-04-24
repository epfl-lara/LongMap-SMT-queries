; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118140 () Bool)

(assert start!118140)

(declare-fun b!1382946 () Bool)

(declare-fun res!923787 () Bool)

(declare-fun e!784038 () Bool)

(assert (=> b!1382946 (=> (not res!923787) (not e!784038))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94427 0))(
  ( (array!94428 (arr!45594 (Array (_ BitVec 32) (_ BitVec 64))) (size!46145 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94427)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382946 (= res!923787 (and (= (size!46145 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46145 a!2971))))))

(declare-fun b!1382947 () Bool)

(declare-fun res!923785 () Bool)

(assert (=> b!1382947 (=> (not res!923785) (not e!784038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382947 (= res!923785 (validKeyInArray!0 (select (arr!45594 a!2971) i!1094)))))

(declare-fun b!1382948 () Bool)

(declare-fun res!923788 () Bool)

(assert (=> b!1382948 (=> (not res!923788) (not e!784038))))

(declare-datatypes ((List!32115 0))(
  ( (Nil!32112) (Cons!32111 (h!33329 (_ BitVec 64)) (t!46801 List!32115)) )
))
(declare-fun arrayNoDuplicates!0 (array!94427 (_ BitVec 32) List!32115) Bool)

(assert (=> b!1382948 (= res!923788 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32112))))

(declare-fun b!1382949 () Bool)

(assert (=> b!1382949 (= e!784038 false)))

(declare-fun lt!608730 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94427 (_ BitVec 32)) Bool)

(assert (=> b!1382949 (= lt!608730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923786 () Bool)

(assert (=> start!118140 (=> (not res!923786) (not e!784038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118140 (= res!923786 (validMask!0 mask!3034))))

(assert (=> start!118140 e!784038))

(assert (=> start!118140 true))

(declare-fun array_inv!34875 (array!94427) Bool)

(assert (=> start!118140 (array_inv!34875 a!2971)))

(assert (= (and start!118140 res!923786) b!1382946))

(assert (= (and b!1382946 res!923787) b!1382947))

(assert (= (and b!1382947 res!923785) b!1382948))

(assert (= (and b!1382948 res!923788) b!1382949))

(declare-fun m!1268451 () Bool)

(assert (=> b!1382947 m!1268451))

(assert (=> b!1382947 m!1268451))

(declare-fun m!1268453 () Bool)

(assert (=> b!1382947 m!1268453))

(declare-fun m!1268455 () Bool)

(assert (=> b!1382948 m!1268455))

(declare-fun m!1268457 () Bool)

(assert (=> b!1382949 m!1268457))

(declare-fun m!1268459 () Bool)

(assert (=> start!118140 m!1268459))

(declare-fun m!1268461 () Bool)

(assert (=> start!118140 m!1268461))

(push 1)

(assert (not b!1382949))

(assert (not start!118140))

(assert (not b!1382948))

(assert (not b!1382947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

