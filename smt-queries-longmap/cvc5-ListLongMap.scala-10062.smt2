; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118506 () Bool)

(assert start!118506)

(declare-fun b!1385627 () Bool)

(declare-fun res!926878 () Bool)

(declare-fun e!785083 () Bool)

(assert (=> b!1385627 (=> (not res!926878) (not e!785083))))

(declare-datatypes ((array!94782 0))(
  ( (array!94783 (arr!45767 (Array (_ BitVec 32) (_ BitVec 64))) (size!46317 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94782)

(declare-datatypes ((List!32295 0))(
  ( (Nil!32292) (Cons!32291 (h!33500 (_ BitVec 64)) (t!46989 List!32295)) )
))
(declare-fun arrayNoDuplicates!0 (array!94782 (_ BitVec 32) List!32295) Bool)

(assert (=> b!1385627 (= res!926878 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32292))))

(declare-fun res!926876 () Bool)

(assert (=> start!118506 (=> (not res!926876) (not e!785083))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118506 (= res!926876 (validMask!0 mask!2987))))

(assert (=> start!118506 e!785083))

(assert (=> start!118506 true))

(declare-fun array_inv!34795 (array!94782) Bool)

(assert (=> start!118506 (array_inv!34795 a!2938)))

(declare-fun b!1385628 () Bool)

(assert (=> b!1385628 (= e!785083 false)))

(declare-fun lt!609291 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94782 (_ BitVec 32)) Bool)

(assert (=> b!1385628 (= lt!609291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385626 () Bool)

(declare-fun res!926877 () Bool)

(assert (=> b!1385626 (=> (not res!926877) (not e!785083))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385626 (= res!926877 (validKeyInArray!0 (select (arr!45767 a!2938) i!1065)))))

(declare-fun b!1385625 () Bool)

(declare-fun res!926875 () Bool)

(assert (=> b!1385625 (=> (not res!926875) (not e!785083))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385625 (= res!926875 (and (= (size!46317 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46317 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46317 a!2938))))))

(assert (= (and start!118506 res!926876) b!1385625))

(assert (= (and b!1385625 res!926875) b!1385626))

(assert (= (and b!1385626 res!926877) b!1385627))

(assert (= (and b!1385627 res!926878) b!1385628))

(declare-fun m!1270917 () Bool)

(assert (=> b!1385627 m!1270917))

(declare-fun m!1270919 () Bool)

(assert (=> start!118506 m!1270919))

(declare-fun m!1270921 () Bool)

(assert (=> start!118506 m!1270921))

(declare-fun m!1270923 () Bool)

(assert (=> b!1385628 m!1270923))

(declare-fun m!1270925 () Bool)

(assert (=> b!1385626 m!1270925))

(assert (=> b!1385626 m!1270925))

(declare-fun m!1270927 () Bool)

(assert (=> b!1385626 m!1270927))

(push 1)

(assert (not b!1385626))

(assert (not b!1385627))

(assert (not start!118506))

(assert (not b!1385628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

