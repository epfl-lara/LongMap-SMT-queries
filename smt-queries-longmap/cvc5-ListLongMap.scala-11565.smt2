; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135160 () Bool)

(assert start!135160)

(declare-fun res!1074625 () Bool)

(declare-fun e!877826 () Bool)

(assert (=> start!135160 (=> (not res!1074625) (not e!877826))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135160 (= res!1074625 (validMask!0 mask!889))))

(assert (=> start!135160 e!877826))

(assert (=> start!135160 true))

(declare-datatypes ((array!105009 0))(
  ( (array!105010 (arr!50670 (Array (_ BitVec 32) (_ BitVec 64))) (size!51221 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105009)

(declare-fun array_inv!39625 (array!105009) Bool)

(assert (=> start!135160 (array_inv!39625 _keys!600)))

(declare-fun b!1574089 () Bool)

(declare-fun res!1074626 () Bool)

(assert (=> b!1574089 (=> (not res!1074626) (not e!877826))))

(assert (=> b!1574089 (= res!1074626 (= (size!51221 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574090 () Bool)

(declare-fun res!1074624 () Bool)

(assert (=> b!1574090 (=> (not res!1074624) (not e!877826))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574090 (= res!1074624 (validKeyInArray!0 k!754))))

(declare-fun b!1574091 () Bool)

(assert (=> b!1574091 (= e!877826 false)))

(declare-fun lt!674568 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574091 (= lt!674568 (toIndex!0 k!754 mask!889))))

(assert (= (and start!135160 res!1074625) b!1574089))

(assert (= (and b!1574089 res!1074626) b!1574090))

(assert (= (and b!1574090 res!1074624) b!1574091))

(declare-fun m!1447801 () Bool)

(assert (=> start!135160 m!1447801))

(declare-fun m!1447803 () Bool)

(assert (=> start!135160 m!1447803))

(declare-fun m!1447805 () Bool)

(assert (=> b!1574090 m!1447805))

(declare-fun m!1447807 () Bool)

(assert (=> b!1574091 m!1447807))

(push 1)

(assert (not b!1574090))

(assert (not b!1574091))

(assert (not start!135160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

