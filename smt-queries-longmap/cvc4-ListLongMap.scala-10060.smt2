; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118498 () Bool)

(assert start!118498)

(declare-fun b!1385578 () Bool)

(declare-fun res!926828 () Bool)

(declare-fun e!785059 () Bool)

(assert (=> b!1385578 (=> (not res!926828) (not e!785059))))

(declare-datatypes ((array!94774 0))(
  ( (array!94775 (arr!45763 (Array (_ BitVec 32) (_ BitVec 64))) (size!46313 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94774)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385578 (= res!926828 (validKeyInArray!0 (select (arr!45763 a!2938) i!1065)))))

(declare-fun b!1385577 () Bool)

(declare-fun res!926829 () Bool)

(assert (=> b!1385577 (=> (not res!926829) (not e!785059))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385577 (= res!926829 (and (= (size!46313 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46313 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46313 a!2938))))))

(declare-fun b!1385580 () Bool)

(assert (=> b!1385580 (= e!785059 false)))

(declare-fun lt!609279 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94774 (_ BitVec 32)) Bool)

(assert (=> b!1385580 (= lt!609279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385579 () Bool)

(declare-fun res!926830 () Bool)

(assert (=> b!1385579 (=> (not res!926830) (not e!785059))))

(declare-datatypes ((List!32291 0))(
  ( (Nil!32288) (Cons!32287 (h!33496 (_ BitVec 64)) (t!46985 List!32291)) )
))
(declare-fun arrayNoDuplicates!0 (array!94774 (_ BitVec 32) List!32291) Bool)

(assert (=> b!1385579 (= res!926830 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32288))))

(declare-fun res!926827 () Bool)

(assert (=> start!118498 (=> (not res!926827) (not e!785059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118498 (= res!926827 (validMask!0 mask!2987))))

(assert (=> start!118498 e!785059))

(assert (=> start!118498 true))

(declare-fun array_inv!34791 (array!94774) Bool)

(assert (=> start!118498 (array_inv!34791 a!2938)))

(assert (= (and start!118498 res!926827) b!1385577))

(assert (= (and b!1385577 res!926829) b!1385578))

(assert (= (and b!1385578 res!926828) b!1385579))

(assert (= (and b!1385579 res!926830) b!1385580))

(declare-fun m!1270869 () Bool)

(assert (=> b!1385578 m!1270869))

(assert (=> b!1385578 m!1270869))

(declare-fun m!1270871 () Bool)

(assert (=> b!1385578 m!1270871))

(declare-fun m!1270873 () Bool)

(assert (=> b!1385580 m!1270873))

(declare-fun m!1270875 () Bool)

(assert (=> b!1385579 m!1270875))

(declare-fun m!1270877 () Bool)

(assert (=> start!118498 m!1270877))

(declare-fun m!1270879 () Bool)

(assert (=> start!118498 m!1270879))

(push 1)

(assert (not start!118498))

(assert (not b!1385579))

(assert (not b!1385578))

(assert (not b!1385580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

