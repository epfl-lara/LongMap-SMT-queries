; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118234 () Bool)

(assert start!118234)

(declare-fun b!1383140 () Bool)

(declare-fun res!924731 () Bool)

(declare-fun e!783953 () Bool)

(assert (=> b!1383140 (=> (not res!924731) (not e!783953))))

(declare-datatypes ((array!94537 0))(
  ( (array!94538 (arr!45646 (Array (_ BitVec 32) (_ BitVec 64))) (size!46196 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94537)

(declare-datatypes ((List!32174 0))(
  ( (Nil!32171) (Cons!32170 (h!33379 (_ BitVec 64)) (t!46868 List!32174)) )
))
(declare-fun arrayNoDuplicates!0 (array!94537 (_ BitVec 32) List!32174) Bool)

(assert (=> b!1383140 (= res!924731 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32171))))

(declare-fun b!1383138 () Bool)

(declare-fun res!924730 () Bool)

(assert (=> b!1383138 (=> (not res!924730) (not e!783953))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383138 (= res!924730 (and (= (size!46196 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46196 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46196 a!2938))))))

(declare-fun res!924732 () Bool)

(assert (=> start!118234 (=> (not res!924732) (not e!783953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118234 (= res!924732 (validMask!0 mask!2987))))

(assert (=> start!118234 e!783953))

(assert (=> start!118234 true))

(declare-fun array_inv!34674 (array!94537) Bool)

(assert (=> start!118234 (array_inv!34674 a!2938)))

(declare-fun b!1383139 () Bool)

(declare-fun res!924733 () Bool)

(assert (=> b!1383139 (=> (not res!924733) (not e!783953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383139 (= res!924733 (validKeyInArray!0 (select (arr!45646 a!2938) i!1065)))))

(declare-fun b!1383141 () Bool)

(assert (=> b!1383141 (= e!783953 false)))

(declare-fun lt!608541 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94537 (_ BitVec 32)) Bool)

(assert (=> b!1383141 (= lt!608541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118234 res!924732) b!1383138))

(assert (= (and b!1383138 res!924730) b!1383139))

(assert (= (and b!1383139 res!924733) b!1383140))

(assert (= (and b!1383140 res!924731) b!1383141))

(declare-fun m!1268241 () Bool)

(assert (=> b!1383140 m!1268241))

(declare-fun m!1268243 () Bool)

(assert (=> start!118234 m!1268243))

(declare-fun m!1268245 () Bool)

(assert (=> start!118234 m!1268245))

(declare-fun m!1268247 () Bool)

(assert (=> b!1383139 m!1268247))

(assert (=> b!1383139 m!1268247))

(declare-fun m!1268249 () Bool)

(assert (=> b!1383139 m!1268249))

(declare-fun m!1268251 () Bool)

(assert (=> b!1383141 m!1268251))

(push 1)

(assert (not b!1383141))

(assert (not b!1383139))

(assert (not start!118234))

(assert (not b!1383140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

