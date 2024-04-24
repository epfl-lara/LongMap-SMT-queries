; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118410 () Bool)

(assert start!118410)

(declare-fun res!925054 () Bool)

(declare-fun e!784692 () Bool)

(assert (=> start!118410 (=> (not res!925054) (not e!784692))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118410 (= res!925054 (validMask!0 mask!2987))))

(assert (=> start!118410 e!784692))

(assert (=> start!118410 true))

(declare-datatypes ((array!94611 0))(
  ( (array!94612 (arr!45681 (Array (_ BitVec 32) (_ BitVec 64))) (size!46232 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94611)

(declare-fun array_inv!34962 (array!94611) Bool)

(assert (=> start!118410 (array_inv!34962 a!2938)))

(declare-fun b!1384249 () Bool)

(declare-fun res!925052 () Bool)

(assert (=> b!1384249 (=> (not res!925052) (not e!784692))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384249 (= res!925052 (and (= (size!46232 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46232 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46232 a!2938))))))

(declare-fun b!1384250 () Bool)

(declare-fun res!925053 () Bool)

(assert (=> b!1384250 (=> (not res!925053) (not e!784692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384250 (= res!925053 (validKeyInArray!0 (select (arr!45681 a!2938) i!1065)))))

(declare-fun b!1384251 () Bool)

(assert (=> b!1384251 (= e!784692 false)))

(declare-fun lt!608976 () Bool)

(declare-datatypes ((List!32196 0))(
  ( (Nil!32193) (Cons!32192 (h!33410 (_ BitVec 64)) (t!46882 List!32196)) )
))
(declare-fun arrayNoDuplicates!0 (array!94611 (_ BitVec 32) List!32196) Bool)

(assert (=> b!1384251 (= lt!608976 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32193))))

(assert (= (and start!118410 res!925054) b!1384249))

(assert (= (and b!1384249 res!925052) b!1384250))

(assert (= (and b!1384250 res!925053) b!1384251))

(declare-fun m!1269677 () Bool)

(assert (=> start!118410 m!1269677))

(declare-fun m!1269679 () Bool)

(assert (=> start!118410 m!1269679))

(declare-fun m!1269681 () Bool)

(assert (=> b!1384250 m!1269681))

(assert (=> b!1384250 m!1269681))

(declare-fun m!1269683 () Bool)

(assert (=> b!1384250 m!1269683))

(declare-fun m!1269685 () Bool)

(assert (=> b!1384251 m!1269685))

(push 1)

(assert (not b!1384251))

(assert (not b!1384250))

(assert (not start!118410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

