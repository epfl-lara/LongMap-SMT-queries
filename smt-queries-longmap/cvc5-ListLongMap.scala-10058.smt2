; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118482 () Bool)

(assert start!118482)

(declare-fun b!1385481 () Bool)

(declare-fun res!926733 () Bool)

(declare-fun e!785012 () Bool)

(assert (=> b!1385481 (=> (not res!926733) (not e!785012))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94758 0))(
  ( (array!94759 (arr!45755 (Array (_ BitVec 32) (_ BitVec 64))) (size!46305 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94758)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385481 (= res!926733 (and (= (size!46305 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46305 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46305 a!2938))))))

(declare-fun b!1385483 () Bool)

(declare-fun res!926732 () Bool)

(assert (=> b!1385483 (=> (not res!926732) (not e!785012))))

(declare-datatypes ((List!32283 0))(
  ( (Nil!32280) (Cons!32279 (h!33488 (_ BitVec 64)) (t!46977 List!32283)) )
))
(declare-fun arrayNoDuplicates!0 (array!94758 (_ BitVec 32) List!32283) Bool)

(assert (=> b!1385483 (= res!926732 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32280))))

(declare-fun b!1385484 () Bool)

(assert (=> b!1385484 (= e!785012 false)))

(declare-fun lt!609255 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94758 (_ BitVec 32)) Bool)

(assert (=> b!1385484 (= lt!609255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385482 () Bool)

(declare-fun res!926734 () Bool)

(assert (=> b!1385482 (=> (not res!926734) (not e!785012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385482 (= res!926734 (validKeyInArray!0 (select (arr!45755 a!2938) i!1065)))))

(declare-fun res!926731 () Bool)

(assert (=> start!118482 (=> (not res!926731) (not e!785012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118482 (= res!926731 (validMask!0 mask!2987))))

(assert (=> start!118482 e!785012))

(assert (=> start!118482 true))

(declare-fun array_inv!34783 (array!94758) Bool)

(assert (=> start!118482 (array_inv!34783 a!2938)))

(assert (= (and start!118482 res!926731) b!1385481))

(assert (= (and b!1385481 res!926733) b!1385482))

(assert (= (and b!1385482 res!926734) b!1385483))

(assert (= (and b!1385483 res!926732) b!1385484))

(declare-fun m!1270773 () Bool)

(assert (=> b!1385483 m!1270773))

(declare-fun m!1270775 () Bool)

(assert (=> b!1385484 m!1270775))

(declare-fun m!1270777 () Bool)

(assert (=> b!1385482 m!1270777))

(assert (=> b!1385482 m!1270777))

(declare-fun m!1270779 () Bool)

(assert (=> b!1385482 m!1270779))

(declare-fun m!1270781 () Bool)

(assert (=> start!118482 m!1270781))

(declare-fun m!1270783 () Bool)

(assert (=> start!118482 m!1270783))

(push 1)

(assert (not start!118482))

(assert (not b!1385483))

(assert (not b!1385484))

(assert (not b!1385482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

