; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118422 () Bool)

(assert start!118422)

(declare-fun res!925106 () Bool)

(declare-fun e!784729 () Bool)

(assert (=> start!118422 (=> (not res!925106) (not e!784729))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118422 (= res!925106 (validMask!0 mask!2987))))

(assert (=> start!118422 e!784729))

(assert (=> start!118422 true))

(declare-datatypes ((array!94623 0))(
  ( (array!94624 (arr!45687 (Array (_ BitVec 32) (_ BitVec 64))) (size!46238 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94623)

(declare-fun array_inv!34968 (array!94623) Bool)

(assert (=> start!118422 (array_inv!34968 a!2938)))

(declare-fun b!1384303 () Bool)

(declare-fun res!925108 () Bool)

(assert (=> b!1384303 (=> (not res!925108) (not e!784729))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384303 (= res!925108 (and (= (size!46238 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46238 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46238 a!2938))))))

(declare-fun b!1384304 () Bool)

(declare-fun res!925107 () Bool)

(assert (=> b!1384304 (=> (not res!925107) (not e!784729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384304 (= res!925107 (validKeyInArray!0 (select (arr!45687 a!2938) i!1065)))))

(declare-fun b!1384305 () Bool)

(assert (=> b!1384305 (= e!784729 false)))

(declare-fun lt!608994 () Bool)

(declare-datatypes ((List!32202 0))(
  ( (Nil!32199) (Cons!32198 (h!33416 (_ BitVec 64)) (t!46888 List!32202)) )
))
(declare-fun arrayNoDuplicates!0 (array!94623 (_ BitVec 32) List!32202) Bool)

(assert (=> b!1384305 (= lt!608994 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32199))))

(assert (= (and start!118422 res!925106) b!1384303))

(assert (= (and b!1384303 res!925108) b!1384304))

(assert (= (and b!1384304 res!925107) b!1384305))

(declare-fun m!1269737 () Bool)

(assert (=> start!118422 m!1269737))

(declare-fun m!1269739 () Bool)

(assert (=> start!118422 m!1269739))

(declare-fun m!1269741 () Bool)

(assert (=> b!1384304 m!1269741))

(assert (=> b!1384304 m!1269741))

(declare-fun m!1269743 () Bool)

(assert (=> b!1384304 m!1269743))

(declare-fun m!1269745 () Bool)

(assert (=> b!1384305 m!1269745))

(push 1)

(assert (not b!1384305))

(assert (not b!1384304))

(assert (not start!118422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

