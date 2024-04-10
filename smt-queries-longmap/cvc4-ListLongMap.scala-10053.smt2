; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118456 () Bool)

(assert start!118456)

(declare-fun b!1385324 () Bool)

(declare-fun res!926578 () Bool)

(declare-fun e!784934 () Bool)

(assert (=> b!1385324 (=> (not res!926578) (not e!784934))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94732 0))(
  ( (array!94733 (arr!45742 (Array (_ BitVec 32) (_ BitVec 64))) (size!46292 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94732)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385324 (= res!926578 (and (= (size!46292 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46292 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46292 a!2938))))))

(declare-fun b!1385325 () Bool)

(declare-fun res!926574 () Bool)

(assert (=> b!1385325 (=> (not res!926574) (not e!784934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385325 (= res!926574 (validKeyInArray!0 (select (arr!45742 a!2938) i!1065)))))

(declare-fun b!1385326 () Bool)

(declare-fun res!926576 () Bool)

(assert (=> b!1385326 (=> (not res!926576) (not e!784934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94732 (_ BitVec 32)) Bool)

(assert (=> b!1385326 (= res!926576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385327 () Bool)

(assert (=> b!1385327 (= e!784934 (bvslt (bvsub (size!46292 a!2938) startIndex!16) #b00000000000000000000000000000000))))

(declare-fun res!926577 () Bool)

(assert (=> start!118456 (=> (not res!926577) (not e!784934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118456 (= res!926577 (validMask!0 mask!2987))))

(assert (=> start!118456 e!784934))

(assert (=> start!118456 true))

(declare-fun array_inv!34770 (array!94732) Bool)

(assert (=> start!118456 (array_inv!34770 a!2938)))

(declare-fun b!1385328 () Bool)

(declare-fun res!926575 () Bool)

(assert (=> b!1385328 (=> (not res!926575) (not e!784934))))

(declare-datatypes ((List!32270 0))(
  ( (Nil!32267) (Cons!32266 (h!33475 (_ BitVec 64)) (t!46964 List!32270)) )
))
(declare-fun arrayNoDuplicates!0 (array!94732 (_ BitVec 32) List!32270) Bool)

(assert (=> b!1385328 (= res!926575 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32267))))

(assert (= (and start!118456 res!926577) b!1385324))

(assert (= (and b!1385324 res!926578) b!1385325))

(assert (= (and b!1385325 res!926574) b!1385328))

(assert (= (and b!1385328 res!926575) b!1385326))

(assert (= (and b!1385326 res!926576) b!1385327))

(declare-fun m!1270617 () Bool)

(assert (=> b!1385325 m!1270617))

(assert (=> b!1385325 m!1270617))

(declare-fun m!1270619 () Bool)

(assert (=> b!1385325 m!1270619))

(declare-fun m!1270621 () Bool)

(assert (=> b!1385326 m!1270621))

(declare-fun m!1270623 () Bool)

(assert (=> start!118456 m!1270623))

(declare-fun m!1270625 () Bool)

(assert (=> start!118456 m!1270625))

(declare-fun m!1270627 () Bool)

(assert (=> b!1385328 m!1270627))

(push 1)

(assert (not start!118456))

(assert (not b!1385325))

(assert (not b!1385328))

(assert (not b!1385326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

