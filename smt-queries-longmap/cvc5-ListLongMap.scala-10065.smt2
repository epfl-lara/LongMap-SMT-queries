; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118524 () Bool)

(assert start!118524)

(declare-fun b!1385715 () Bool)

(declare-fun res!927009 () Bool)

(declare-fun e!785119 () Bool)

(assert (=> b!1385715 (=> (not res!927009) (not e!785119))))

(declare-datatypes ((array!94753 0))(
  ( (array!94754 (arr!45753 (Array (_ BitVec 32) (_ BitVec 64))) (size!46305 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94753)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385715 (= res!927009 (and (= (size!46305 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46305 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46305 a!2938))))))

(declare-fun b!1385718 () Bool)

(assert (=> b!1385718 (= e!785119 false)))

(declare-fun lt!609131 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94753 (_ BitVec 32)) Bool)

(assert (=> b!1385718 (= lt!609131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927008 () Bool)

(assert (=> start!118524 (=> (not res!927008) (not e!785119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118524 (= res!927008 (validMask!0 mask!2987))))

(assert (=> start!118524 e!785119))

(assert (=> start!118524 true))

(declare-fun array_inv!34986 (array!94753) Bool)

(assert (=> start!118524 (array_inv!34986 a!2938)))

(declare-fun b!1385716 () Bool)

(declare-fun res!927010 () Bool)

(assert (=> b!1385716 (=> (not res!927010) (not e!785119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385716 (= res!927010 (validKeyInArray!0 (select (arr!45753 a!2938) i!1065)))))

(declare-fun b!1385717 () Bool)

(declare-fun res!927011 () Bool)

(assert (=> b!1385717 (=> (not res!927011) (not e!785119))))

(declare-datatypes ((List!32359 0))(
  ( (Nil!32356) (Cons!32355 (h!33564 (_ BitVec 64)) (t!47045 List!32359)) )
))
(declare-fun arrayNoDuplicates!0 (array!94753 (_ BitVec 32) List!32359) Bool)

(assert (=> b!1385717 (= res!927011 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32356))))

(assert (= (and start!118524 res!927008) b!1385715))

(assert (= (and b!1385715 res!927009) b!1385716))

(assert (= (and b!1385716 res!927010) b!1385717))

(assert (= (and b!1385717 res!927011) b!1385718))

(declare-fun m!1270557 () Bool)

(assert (=> b!1385718 m!1270557))

(declare-fun m!1270559 () Bool)

(assert (=> start!118524 m!1270559))

(declare-fun m!1270561 () Bool)

(assert (=> start!118524 m!1270561))

(declare-fun m!1270563 () Bool)

(assert (=> b!1385716 m!1270563))

(assert (=> b!1385716 m!1270563))

(declare-fun m!1270565 () Bool)

(assert (=> b!1385716 m!1270565))

(declare-fun m!1270567 () Bool)

(assert (=> b!1385717 m!1270567))

(push 1)

(assert (not b!1385718))

(assert (not b!1385716))

(assert (not start!118524))

(assert (not b!1385717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

