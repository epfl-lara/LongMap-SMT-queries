; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136834 () Bool)

(assert start!136834)

(declare-fun res!1078492 () Bool)

(declare-fun e!881333 () Bool)

(assert (=> start!136834 (=> (not res!1078492) (not e!881333))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136834 (= res!1078492 (validMask!0 mask!910))))

(assert (=> start!136834 e!881333))

(assert (=> start!136834 true))

(declare-datatypes ((array!105725 0))(
  ( (array!105726 (arr!50974 (Array (_ BitVec 32) (_ BitVec 64))) (size!51525 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105725)

(declare-fun array_inv!39929 (array!105725) Bool)

(assert (=> start!136834 (array_inv!39929 _keys!610)))

(declare-fun b!1579804 () Bool)

(declare-fun res!1078493 () Bool)

(assert (=> b!1579804 (=> (not res!1078493) (not e!881333))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1579804 (= res!1078493 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51525 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579805 () Bool)

(declare-fun res!1078491 () Bool)

(assert (=> b!1579805 (=> (not res!1078491) (not e!881333))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579805 (= res!1078491 (validKeyInArray!0 k0!768))))

(declare-fun b!1579806 () Bool)

(assert (=> b!1579806 (= e!881333 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50974 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50974 _keys!610) ee!12) (select (arr!50974 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50974 _keys!610) ee!12) k0!768)) (not (= (select (arr!50974 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50974 _keys!610) ee!12) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136834 res!1078492) b!1579804))

(assert (= (and b!1579804 res!1078493) b!1579805))

(assert (= (and b!1579805 res!1078491) b!1579806))

(declare-fun m!1451913 () Bool)

(assert (=> start!136834 m!1451913))

(declare-fun m!1451915 () Bool)

(assert (=> start!136834 m!1451915))

(declare-fun m!1451917 () Bool)

(assert (=> b!1579805 m!1451917))

(declare-fun m!1451919 () Bool)

(assert (=> b!1579806 m!1451919))

(check-sat (not start!136834) (not b!1579805))
(check-sat)
