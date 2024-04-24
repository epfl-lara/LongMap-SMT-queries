; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118482 () Bool)

(assert start!118482)

(declare-fun b!1384664 () Bool)

(declare-fun res!925467 () Bool)

(declare-fun e!784908 () Bool)

(assert (=> b!1384664 (=> (not res!925467) (not e!784908))))

(declare-datatypes ((array!94683 0))(
  ( (array!94684 (arr!45717 (Array (_ BitVec 32) (_ BitVec 64))) (size!46268 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94683)

(declare-datatypes ((List!32232 0))(
  ( (Nil!32229) (Cons!32228 (h!33446 (_ BitVec 64)) (t!46918 List!32232)) )
))
(declare-fun arrayNoDuplicates!0 (array!94683 (_ BitVec 32) List!32232) Bool)

(assert (=> b!1384664 (= res!925467 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32229))))

(declare-fun b!1384665 () Bool)

(assert (=> b!1384665 (= e!784908 false)))

(declare-fun lt!609075 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94683 (_ BitVec 32)) Bool)

(assert (=> b!1384665 (= lt!609075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384663 () Bool)

(declare-fun res!925465 () Bool)

(assert (=> b!1384663 (=> (not res!925465) (not e!784908))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384663 (= res!925465 (validKeyInArray!0 (select (arr!45717 a!2938) i!1065)))))

(declare-fun b!1384662 () Bool)

(declare-fun res!925468 () Bool)

(assert (=> b!1384662 (=> (not res!925468) (not e!784908))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384662 (= res!925468 (and (= (size!46268 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46268 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46268 a!2938))))))

(declare-fun res!925466 () Bool)

(assert (=> start!118482 (=> (not res!925466) (not e!784908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118482 (= res!925466 (validMask!0 mask!2987))))

(assert (=> start!118482 e!784908))

(assert (=> start!118482 true))

(declare-fun array_inv!34998 (array!94683) Bool)

(assert (=> start!118482 (array_inv!34998 a!2938)))

(assert (= (and start!118482 res!925466) b!1384662))

(assert (= (and b!1384662 res!925468) b!1384663))

(assert (= (and b!1384663 res!925465) b!1384664))

(assert (= (and b!1384664 res!925467) b!1384665))

(declare-fun m!1270089 () Bool)

(assert (=> b!1384664 m!1270089))

(declare-fun m!1270091 () Bool)

(assert (=> b!1384665 m!1270091))

(declare-fun m!1270093 () Bool)

(assert (=> b!1384663 m!1270093))

(assert (=> b!1384663 m!1270093))

(declare-fun m!1270095 () Bool)

(assert (=> b!1384663 m!1270095))

(declare-fun m!1270097 () Bool)

(assert (=> start!118482 m!1270097))

(declare-fun m!1270099 () Bool)

(assert (=> start!118482 m!1270099))

(push 1)

(assert (not b!1384665))

(assert (not start!118482))

(assert (not b!1384664))

(assert (not b!1384663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

