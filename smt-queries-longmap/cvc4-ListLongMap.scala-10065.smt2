; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118528 () Bool)

(assert start!118528)

(declare-fun b!1385784 () Bool)

(declare-fun res!927036 () Bool)

(declare-fun e!785149 () Bool)

(assert (=> b!1385784 (=> (not res!927036) (not e!785149))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94804 0))(
  ( (array!94805 (arr!45778 (Array (_ BitVec 32) (_ BitVec 64))) (size!46328 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94804)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385784 (= res!927036 (and (= (size!46328 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46328 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46328 a!2938))))))

(declare-fun res!927037 () Bool)

(assert (=> start!118528 (=> (not res!927037) (not e!785149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118528 (= res!927037 (validMask!0 mask!2987))))

(assert (=> start!118528 e!785149))

(assert (=> start!118528 true))

(declare-fun array_inv!34806 (array!94804) Bool)

(assert (=> start!118528 (array_inv!34806 a!2938)))

(declare-fun b!1385787 () Bool)

(assert (=> b!1385787 (= e!785149 false)))

(declare-fun lt!609315 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94804 (_ BitVec 32)) Bool)

(assert (=> b!1385787 (= lt!609315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385785 () Bool)

(declare-fun res!927034 () Bool)

(assert (=> b!1385785 (=> (not res!927034) (not e!785149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385785 (= res!927034 (validKeyInArray!0 (select (arr!45778 a!2938) i!1065)))))

(declare-fun b!1385786 () Bool)

(declare-fun res!927035 () Bool)

(assert (=> b!1385786 (=> (not res!927035) (not e!785149))))

(declare-datatypes ((List!32306 0))(
  ( (Nil!32303) (Cons!32302 (h!33511 (_ BitVec 64)) (t!47000 List!32306)) )
))
(declare-fun arrayNoDuplicates!0 (array!94804 (_ BitVec 32) List!32306) Bool)

(assert (=> b!1385786 (= res!927035 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32303))))

(assert (= (and start!118528 res!927037) b!1385784))

(assert (= (and b!1385784 res!927036) b!1385785))

(assert (= (and b!1385785 res!927034) b!1385786))

(assert (= (and b!1385786 res!927035) b!1385787))

(declare-fun m!1271061 () Bool)

(assert (=> start!118528 m!1271061))

(declare-fun m!1271063 () Bool)

(assert (=> start!118528 m!1271063))

(declare-fun m!1271065 () Bool)

(assert (=> b!1385787 m!1271065))

(declare-fun m!1271067 () Bool)

(assert (=> b!1385785 m!1271067))

(assert (=> b!1385785 m!1271067))

(declare-fun m!1271069 () Bool)

(assert (=> b!1385785 m!1271069))

(declare-fun m!1271071 () Bool)

(assert (=> b!1385786 m!1271071))

(push 1)

(assert (not b!1385787))

(assert (not b!1385785))

(assert (not start!118528))

(assert (not b!1385786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

