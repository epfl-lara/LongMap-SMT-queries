; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136810 () Bool)

(assert start!136810)

(declare-fun res!1078383 () Bool)

(declare-fun e!881260 () Bool)

(assert (=> start!136810 (=> (not res!1078383) (not e!881260))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136810 (= res!1078383 (validMask!0 mask!910))))

(assert (=> start!136810 e!881260))

(assert (=> start!136810 true))

(declare-datatypes ((array!105701 0))(
  ( (array!105702 (arr!50962 (Array (_ BitVec 32) (_ BitVec 64))) (size!51513 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105701)

(declare-fun array_inv!39917 (array!105701) Bool)

(assert (=> start!136810 (array_inv!39917 _keys!610)))

(declare-fun b!1579696 () Bool)

(declare-fun res!1078384 () Bool)

(assert (=> b!1579696 (=> (not res!1078384) (not e!881260))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1579696 (= res!1078384 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51513 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579697 () Bool)

(declare-fun res!1078385 () Bool)

(assert (=> b!1579697 (=> (not res!1078385) (not e!881260))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579697 (= res!1078385 (validKeyInArray!0 k0!768))))

(declare-fun b!1579698 () Bool)

(assert (=> b!1579698 (= e!881260 (bvsge ee!12 (size!51513 _keys!610)))))

(assert (= (and start!136810 res!1078383) b!1579696))

(assert (= (and b!1579696 res!1078384) b!1579697))

(assert (= (and b!1579697 res!1078385) b!1579698))

(declare-fun m!1451823 () Bool)

(assert (=> start!136810 m!1451823))

(declare-fun m!1451825 () Bool)

(assert (=> start!136810 m!1451825))

(declare-fun m!1451827 () Bool)

(assert (=> b!1579697 m!1451827))

(check-sat (not start!136810) (not b!1579697))
(check-sat)
