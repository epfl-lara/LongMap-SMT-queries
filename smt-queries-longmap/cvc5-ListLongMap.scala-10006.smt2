; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118290 () Bool)

(assert start!118290)

(declare-fun b!1383839 () Bool)

(declare-fun res!924643 () Bool)

(declare-fun e!784462 () Bool)

(assert (=> b!1383839 (=> (not res!924643) (not e!784462))))

(declare-datatypes ((array!94550 0))(
  ( (array!94551 (arr!45654 (Array (_ BitVec 32) (_ BitVec 64))) (size!46205 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94550)

(declare-datatypes ((List!32175 0))(
  ( (Nil!32172) (Cons!32171 (h!33389 (_ BitVec 64)) (t!46861 List!32175)) )
))
(declare-fun arrayNoDuplicates!0 (array!94550 (_ BitVec 32) List!32175) Bool)

(assert (=> b!1383839 (= res!924643 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32172))))

(declare-fun b!1383837 () Bool)

(declare-fun res!924641 () Bool)

(assert (=> b!1383837 (=> (not res!924641) (not e!784462))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383837 (= res!924641 (and (= (size!46205 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46205 a!2971))))))

(declare-fun b!1383838 () Bool)

(declare-fun res!924642 () Bool)

(assert (=> b!1383838 (=> (not res!924642) (not e!784462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383838 (= res!924642 (validKeyInArray!0 (select (arr!45654 a!2971) i!1094)))))

(declare-fun b!1383840 () Bool)

(assert (=> b!1383840 (= e!784462 false)))

(declare-fun lt!608919 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94550 (_ BitVec 32)) Bool)

(assert (=> b!1383840 (= lt!608919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924640 () Bool)

(assert (=> start!118290 (=> (not res!924640) (not e!784462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118290 (= res!924640 (validMask!0 mask!3034))))

(assert (=> start!118290 e!784462))

(assert (=> start!118290 true))

(declare-fun array_inv!34935 (array!94550) Bool)

(assert (=> start!118290 (array_inv!34935 a!2971)))

(assert (= (and start!118290 res!924640) b!1383837))

(assert (= (and b!1383837 res!924641) b!1383838))

(assert (= (and b!1383838 res!924642) b!1383839))

(assert (= (and b!1383839 res!924643) b!1383840))

(declare-fun m!1269291 () Bool)

(assert (=> b!1383839 m!1269291))

(declare-fun m!1269293 () Bool)

(assert (=> b!1383838 m!1269293))

(assert (=> b!1383838 m!1269293))

(declare-fun m!1269295 () Bool)

(assert (=> b!1383838 m!1269295))

(declare-fun m!1269297 () Bool)

(assert (=> b!1383840 m!1269297))

(declare-fun m!1269299 () Bool)

(assert (=> start!118290 m!1269299))

(declare-fun m!1269301 () Bool)

(assert (=> start!118290 m!1269301))

(push 1)

(assert (not b!1383838))

(assert (not start!118290))

(assert (not b!1383839))

(assert (not b!1383840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

