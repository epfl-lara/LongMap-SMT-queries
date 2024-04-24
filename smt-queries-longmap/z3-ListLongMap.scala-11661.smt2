; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136798 () Bool)

(assert start!136798)

(declare-fun b!1579627 () Bool)

(declare-fun res!1078316 () Bool)

(declare-fun e!881225 () Bool)

(assert (=> b!1579627 (=> (not res!1078316) (not e!881225))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579627 (= res!1078316 (validKeyInArray!0 k0!768))))

(declare-fun b!1579629 () Bool)

(declare-fun x!458 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun lt!676866 () (_ BitVec 32))

(assert (=> b!1579629 (= e!881225 (and (bvsge lt!676866 #b00000000000000000000000000000000) (bvslt lt!676866 (bvadd #b00000000000000000000000000000001 mask!910)) (bvslt (bvadd #b00000000000000000000000000000001 x!458) #b00000000000000000000000000000000)))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579629 (= lt!676866 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(declare-fun b!1579626 () Bool)

(declare-fun res!1078313 () Bool)

(assert (=> b!1579626 (=> (not res!1078313) (not e!881225))))

(declare-datatypes ((array!105689 0))(
  ( (array!105690 (arr!50956 (Array (_ BitVec 32) (_ BitVec 64))) (size!51507 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105689)

(assert (=> b!1579626 (= res!1078313 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51507 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1078314 () Bool)

(assert (=> start!136798 (=> (not res!1078314) (not e!881225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136798 (= res!1078314 (validMask!0 mask!910))))

(assert (=> start!136798 e!881225))

(assert (=> start!136798 true))

(declare-fun array_inv!39911 (array!105689) Bool)

(assert (=> start!136798 (array_inv!39911 _keys!610)))

(declare-fun b!1579628 () Bool)

(declare-fun res!1078315 () Bool)

(assert (=> b!1579628 (=> (not res!1078315) (not e!881225))))

(assert (=> b!1579628 (= res!1078315 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50956 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50956 _keys!610) ee!12) (select (arr!50956 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136798 res!1078314) b!1579626))

(assert (= (and b!1579626 res!1078313) b!1579627))

(assert (= (and b!1579627 res!1078316) b!1579628))

(assert (= (and b!1579628 res!1078315) b!1579629))

(declare-fun m!1451763 () Bool)

(assert (=> b!1579627 m!1451763))

(declare-fun m!1451765 () Bool)

(assert (=> b!1579629 m!1451765))

(declare-fun m!1451767 () Bool)

(assert (=> start!136798 m!1451767))

(declare-fun m!1451769 () Bool)

(assert (=> start!136798 m!1451769))

(declare-fun m!1451771 () Bool)

(assert (=> b!1579628 m!1451771))

(check-sat (not b!1579629) (not start!136798) (not b!1579627))
(check-sat)
