; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118470 () Bool)

(assert start!118470)

(declare-fun b!1384593 () Bool)

(declare-fun e!784872 () Bool)

(assert (=> b!1384593 (= e!784872 false)))

(declare-fun lt!609057 () Bool)

(declare-datatypes ((array!94671 0))(
  ( (array!94672 (arr!45711 (Array (_ BitVec 32) (_ BitVec 64))) (size!46262 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94671)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94671 (_ BitVec 32)) Bool)

(assert (=> b!1384593 (= lt!609057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384590 () Bool)

(declare-fun res!925394 () Bool)

(assert (=> b!1384590 (=> (not res!925394) (not e!784872))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384590 (= res!925394 (and (= (size!46262 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46262 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46262 a!2938))))))

(declare-fun res!925396 () Bool)

(assert (=> start!118470 (=> (not res!925396) (not e!784872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118470 (= res!925396 (validMask!0 mask!2987))))

(assert (=> start!118470 e!784872))

(assert (=> start!118470 true))

(declare-fun array_inv!34992 (array!94671) Bool)

(assert (=> start!118470 (array_inv!34992 a!2938)))

(declare-fun b!1384591 () Bool)

(declare-fun res!925393 () Bool)

(assert (=> b!1384591 (=> (not res!925393) (not e!784872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384591 (= res!925393 (validKeyInArray!0 (select (arr!45711 a!2938) i!1065)))))

(declare-fun b!1384592 () Bool)

(declare-fun res!925395 () Bool)

(assert (=> b!1384592 (=> (not res!925395) (not e!784872))))

(declare-datatypes ((List!32226 0))(
  ( (Nil!32223) (Cons!32222 (h!33440 (_ BitVec 64)) (t!46912 List!32226)) )
))
(declare-fun arrayNoDuplicates!0 (array!94671 (_ BitVec 32) List!32226) Bool)

(assert (=> b!1384592 (= res!925395 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32223))))

(assert (= (and start!118470 res!925396) b!1384590))

(assert (= (and b!1384590 res!925394) b!1384591))

(assert (= (and b!1384591 res!925393) b!1384592))

(assert (= (and b!1384592 res!925395) b!1384593))

(declare-fun m!1270017 () Bool)

(assert (=> b!1384593 m!1270017))

(declare-fun m!1270019 () Bool)

(assert (=> start!118470 m!1270019))

(declare-fun m!1270021 () Bool)

(assert (=> start!118470 m!1270021))

(declare-fun m!1270023 () Bool)

(assert (=> b!1384591 m!1270023))

(assert (=> b!1384591 m!1270023))

(declare-fun m!1270025 () Bool)

(assert (=> b!1384591 m!1270025))

(declare-fun m!1270027 () Bool)

(assert (=> b!1384592 m!1270027))

(push 1)

(assert (not b!1384592))

(assert (not start!118470))

(assert (not b!1384591))

(assert (not b!1384593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

