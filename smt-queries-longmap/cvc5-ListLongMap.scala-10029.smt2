; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118494 () Bool)

(assert start!118494)

(declare-fun b!1384736 () Bool)

(declare-fun res!925538 () Bool)

(declare-fun e!784945 () Bool)

(assert (=> b!1384736 (=> (not res!925538) (not e!784945))))

(declare-datatypes ((array!94695 0))(
  ( (array!94696 (arr!45723 (Array (_ BitVec 32) (_ BitVec 64))) (size!46274 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94695)

(declare-datatypes ((List!32238 0))(
  ( (Nil!32235) (Cons!32234 (h!33452 (_ BitVec 64)) (t!46924 List!32238)) )
))
(declare-fun arrayNoDuplicates!0 (array!94695 (_ BitVec 32) List!32238) Bool)

(assert (=> b!1384736 (= res!925538 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32235))))

(declare-fun res!925539 () Bool)

(assert (=> start!118494 (=> (not res!925539) (not e!784945))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118494 (= res!925539 (validMask!0 mask!2987))))

(assert (=> start!118494 e!784945))

(assert (=> start!118494 true))

(declare-fun array_inv!35004 (array!94695) Bool)

(assert (=> start!118494 (array_inv!35004 a!2938)))

(declare-fun b!1384735 () Bool)

(declare-fun res!925540 () Bool)

(assert (=> b!1384735 (=> (not res!925540) (not e!784945))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384735 (= res!925540 (validKeyInArray!0 (select (arr!45723 a!2938) i!1065)))))

(declare-fun b!1384737 () Bool)

(assert (=> b!1384737 (= e!784945 false)))

(declare-fun lt!609093 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94695 (_ BitVec 32)) Bool)

(assert (=> b!1384737 (= lt!609093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384734 () Bool)

(declare-fun res!925537 () Bool)

(assert (=> b!1384734 (=> (not res!925537) (not e!784945))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384734 (= res!925537 (and (= (size!46274 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46274 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46274 a!2938))))))

(assert (= (and start!118494 res!925539) b!1384734))

(assert (= (and b!1384734 res!925537) b!1384735))

(assert (= (and b!1384735 res!925540) b!1384736))

(assert (= (and b!1384736 res!925538) b!1384737))

(declare-fun m!1270161 () Bool)

(assert (=> b!1384736 m!1270161))

(declare-fun m!1270163 () Bool)

(assert (=> start!118494 m!1270163))

(declare-fun m!1270165 () Bool)

(assert (=> start!118494 m!1270165))

(declare-fun m!1270167 () Bool)

(assert (=> b!1384735 m!1270167))

(assert (=> b!1384735 m!1270167))

(declare-fun m!1270169 () Bool)

(assert (=> b!1384735 m!1270169))

(declare-fun m!1270171 () Bool)

(assert (=> b!1384737 m!1270171))

(push 1)

(assert (not b!1384735))

(assert (not start!118494))

(assert (not b!1384736))

(assert (not b!1384737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

