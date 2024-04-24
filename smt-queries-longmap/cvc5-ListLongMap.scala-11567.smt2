; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135196 () Bool)

(assert start!135196)

(declare-fun res!1074681 () Bool)

(declare-fun e!877861 () Bool)

(assert (=> start!135196 (=> (not res!1074681) (not e!877861))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135196 (= res!1074681 (validMask!0 mask!889))))

(assert (=> start!135196 e!877861))

(assert (=> start!135196 true))

(declare-datatypes ((array!105024 0))(
  ( (array!105025 (arr!50676 (Array (_ BitVec 32) (_ BitVec 64))) (size!51227 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105024)

(declare-fun array_inv!39631 (array!105024) Bool)

(assert (=> start!135196 (array_inv!39631 _keys!600)))

(declare-fun b!1574143 () Bool)

(declare-fun res!1074682 () Bool)

(assert (=> b!1574143 (=> (not res!1074682) (not e!877861))))

(assert (=> b!1574143 (= res!1074682 (= (size!51227 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574144 () Bool)

(declare-fun res!1074683 () Bool)

(assert (=> b!1574144 (=> (not res!1074683) (not e!877861))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574144 (= res!1074683 (validKeyInArray!0 k!754))))

(declare-fun b!1574145 () Bool)

(assert (=> b!1574145 (= e!877861 false)))

(declare-fun lt!674604 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574145 (= lt!674604 (toIndex!0 k!754 mask!889))))

(assert (= (and start!135196 res!1074681) b!1574143))

(assert (= (and b!1574143 res!1074682) b!1574144))

(assert (= (and b!1574144 res!1074683) b!1574145))

(declare-fun m!1447849 () Bool)

(assert (=> start!135196 m!1447849))

(declare-fun m!1447851 () Bool)

(assert (=> start!135196 m!1447851))

(declare-fun m!1447853 () Bool)

(assert (=> b!1574144 m!1447853))

(declare-fun m!1447855 () Bool)

(assert (=> b!1574145 m!1447855))

(push 1)

(assert (not b!1574144))

(assert (not b!1574145))

(assert (not start!135196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

