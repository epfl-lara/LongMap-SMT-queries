; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118446 () Bool)

(assert start!118446)

(declare-fun b!1384448 () Bool)

(declare-fun res!925249 () Bool)

(declare-fun e!784801 () Bool)

(assert (=> b!1384448 (=> (not res!925249) (not e!784801))))

(declare-datatypes ((array!94647 0))(
  ( (array!94648 (arr!45699 (Array (_ BitVec 32) (_ BitVec 64))) (size!46250 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94647)

(declare-datatypes ((List!32214 0))(
  ( (Nil!32211) (Cons!32210 (h!33428 (_ BitVec 64)) (t!46900 List!32214)) )
))
(declare-fun arrayNoDuplicates!0 (array!94647 (_ BitVec 32) List!32214) Bool)

(assert (=> b!1384448 (= res!925249 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32211))))

(declare-fun b!1384446 () Bool)

(declare-fun res!925250 () Bool)

(assert (=> b!1384446 (=> (not res!925250) (not e!784801))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384446 (= res!925250 (and (= (size!46250 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46250 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46250 a!2938))))))

(declare-fun b!1384447 () Bool)

(declare-fun res!925252 () Bool)

(assert (=> b!1384447 (=> (not res!925252) (not e!784801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384447 (= res!925252 (validKeyInArray!0 (select (arr!45699 a!2938) i!1065)))))

(declare-fun res!925251 () Bool)

(assert (=> start!118446 (=> (not res!925251) (not e!784801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118446 (= res!925251 (validMask!0 mask!2987))))

(assert (=> start!118446 e!784801))

(assert (=> start!118446 true))

(declare-fun array_inv!34980 (array!94647) Bool)

(assert (=> start!118446 (array_inv!34980 a!2938)))

(declare-fun b!1384449 () Bool)

(assert (=> b!1384449 (= e!784801 false)))

(declare-fun lt!609021 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94647 (_ BitVec 32)) Bool)

(assert (=> b!1384449 (= lt!609021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118446 res!925251) b!1384446))

(assert (= (and b!1384446 res!925250) b!1384447))

(assert (= (and b!1384447 res!925252) b!1384448))

(assert (= (and b!1384448 res!925249) b!1384449))

(declare-fun m!1269873 () Bool)

(assert (=> b!1384448 m!1269873))

(declare-fun m!1269875 () Bool)

(assert (=> b!1384447 m!1269875))

(assert (=> b!1384447 m!1269875))

(declare-fun m!1269877 () Bool)

(assert (=> b!1384447 m!1269877))

(declare-fun m!1269879 () Bool)

(assert (=> start!118446 m!1269879))

(declare-fun m!1269881 () Bool)

(assert (=> start!118446 m!1269881))

(declare-fun m!1269883 () Bool)

(assert (=> b!1384449 m!1269883))

(push 1)

(assert (not start!118446))

(assert (not b!1384448))

(assert (not b!1384447))

(assert (not b!1384449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

