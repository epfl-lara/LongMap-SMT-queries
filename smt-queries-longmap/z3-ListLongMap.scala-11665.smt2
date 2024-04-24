; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136822 () Bool)

(assert start!136822)

(declare-fun res!1078437 () Bool)

(declare-fun e!881296 () Bool)

(assert (=> start!136822 (=> (not res!1078437) (not e!881296))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136822 (= res!1078437 (validMask!0 mask!910))))

(assert (=> start!136822 e!881296))

(assert (=> start!136822 true))

(declare-datatypes ((array!105713 0))(
  ( (array!105714 (arr!50968 (Array (_ BitVec 32) (_ BitVec 64))) (size!51519 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105713)

(declare-fun array_inv!39923 (array!105713) Bool)

(assert (=> start!136822 (array_inv!39923 _keys!610)))

(declare-fun b!1579750 () Bool)

(declare-fun res!1078439 () Bool)

(assert (=> b!1579750 (=> (not res!1078439) (not e!881296))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1579750 (= res!1078439 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51519 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579751 () Bool)

(declare-fun res!1078438 () Bool)

(assert (=> b!1579751 (=> (not res!1078438) (not e!881296))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579751 (= res!1078438 (validKeyInArray!0 k0!768))))

(declare-fun b!1579752 () Bool)

(assert (=> b!1579752 (= e!881296 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50968 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50968 _keys!610) ee!12) (select (arr!50968 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50968 _keys!610) ee!12) k0!768)) (bvsge ee!12 (size!51519 _keys!610))))))

(assert (= (and start!136822 res!1078437) b!1579750))

(assert (= (and b!1579750 res!1078439) b!1579751))

(assert (= (and b!1579751 res!1078438) b!1579752))

(declare-fun m!1451865 () Bool)

(assert (=> start!136822 m!1451865))

(declare-fun m!1451867 () Bool)

(assert (=> start!136822 m!1451867))

(declare-fun m!1451869 () Bool)

(assert (=> b!1579751 m!1451869))

(declare-fun m!1451871 () Bool)

(assert (=> b!1579752 m!1451871))

(check-sat (not b!1579751) (not start!136822))
(check-sat)
