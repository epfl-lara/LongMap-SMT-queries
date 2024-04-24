; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118278 () Bool)

(assert start!118278)

(declare-fun b!1383759 () Bool)

(declare-fun e!784425 () Bool)

(assert (=> b!1383759 (= e!784425 false)))

(declare-fun lt!608910 () Bool)

(declare-datatypes ((array!94538 0))(
  ( (array!94539 (arr!45648 (Array (_ BitVec 32) (_ BitVec 64))) (size!46199 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94538)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94538 (_ BitVec 32)) Bool)

(assert (=> b!1383759 (= lt!608910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383758 () Bool)

(declare-fun res!924560 () Bool)

(assert (=> b!1383758 (=> (not res!924560) (not e!784425))))

(declare-datatypes ((List!32169 0))(
  ( (Nil!32166) (Cons!32165 (h!33383 (_ BitVec 64)) (t!46855 List!32169)) )
))
(declare-fun arrayNoDuplicates!0 (array!94538 (_ BitVec 32) List!32169) Bool)

(assert (=> b!1383758 (= res!924560 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32166))))

(declare-fun res!924562 () Bool)

(assert (=> start!118278 (=> (not res!924562) (not e!784425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118278 (= res!924562 (validMask!0 mask!3034))))

(assert (=> start!118278 e!784425))

(assert (=> start!118278 true))

(declare-fun array_inv!34929 (array!94538) Bool)

(assert (=> start!118278 (array_inv!34929 a!2971)))

(declare-fun b!1383757 () Bool)

(declare-fun res!924561 () Bool)

(assert (=> b!1383757 (=> (not res!924561) (not e!784425))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383757 (= res!924561 (validKeyInArray!0 (select (arr!45648 a!2971) i!1094)))))

(declare-fun b!1383756 () Bool)

(declare-fun res!924559 () Bool)

(assert (=> b!1383756 (=> (not res!924559) (not e!784425))))

(assert (=> b!1383756 (= res!924559 (and (= (size!46199 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46199 a!2971))))))

(assert (= (and start!118278 res!924562) b!1383756))

(assert (= (and b!1383756 res!924559) b!1383757))

(assert (= (and b!1383757 res!924561) b!1383758))

(assert (= (and b!1383758 res!924560) b!1383759))

(declare-fun m!1269219 () Bool)

(assert (=> b!1383759 m!1269219))

(declare-fun m!1269221 () Bool)

(assert (=> b!1383758 m!1269221))

(declare-fun m!1269223 () Bool)

(assert (=> start!118278 m!1269223))

(declare-fun m!1269225 () Bool)

(assert (=> start!118278 m!1269225))

(declare-fun m!1269227 () Bool)

(assert (=> b!1383757 m!1269227))

(assert (=> b!1383757 m!1269227))

(declare-fun m!1269229 () Bool)

(assert (=> b!1383757 m!1269229))

(push 1)

(assert (not start!118278))

(assert (not b!1383758))

(assert (not b!1383759))

(assert (not b!1383757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

