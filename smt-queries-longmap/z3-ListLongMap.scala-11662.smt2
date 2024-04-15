; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136342 () Bool)

(assert start!136342)

(declare-fun res!1077367 () Bool)

(declare-fun e!879535 () Bool)

(assert (=> start!136342 (=> (not res!1077367) (not e!879535))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136342 (= res!1077367 (validMask!0 mask!910))))

(assert (=> start!136342 e!879535))

(assert (=> start!136342 true))

(declare-datatypes ((array!105500 0))(
  ( (array!105501 (arr!50870 (Array (_ BitVec 32) (_ BitVec 64))) (size!51422 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105500)

(declare-fun array_inv!39806 (array!105500) Bool)

(assert (=> start!136342 (array_inv!39806 _keys!610)))

(declare-fun b!1576920 () Bool)

(declare-fun res!1077368 () Bool)

(assert (=> b!1576920 (=> (not res!1077368) (not e!879535))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1576920 (= res!1077368 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51422 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1576921 () Bool)

(declare-fun res!1077369 () Bool)

(assert (=> b!1576921 (=> (not res!1077369) (not e!879535))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576921 (= res!1077369 (validKeyInArray!0 k0!768))))

(declare-fun b!1576922 () Bool)

(assert (=> b!1576922 (= e!879535 (bvsge ee!12 (size!51422 _keys!610)))))

(assert (= (and start!136342 res!1077367) b!1576920))

(assert (= (and b!1576920 res!1077368) b!1576921))

(assert (= (and b!1576921 res!1077369) b!1576922))

(declare-fun m!1448649 () Bool)

(assert (=> start!136342 m!1448649))

(declare-fun m!1448651 () Bool)

(assert (=> start!136342 m!1448651))

(declare-fun m!1448653 () Bool)

(assert (=> b!1576921 m!1448653))

(check-sat (not b!1576921) (not start!136342))
(check-sat)
