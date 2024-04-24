; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136828 () Bool)

(assert start!136828)

(declare-fun res!1078466 () Bool)

(declare-fun e!881314 () Bool)

(assert (=> start!136828 (=> (not res!1078466) (not e!881314))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136828 (= res!1078466 (validMask!0 mask!910))))

(assert (=> start!136828 e!881314))

(assert (=> start!136828 true))

(declare-datatypes ((array!105719 0))(
  ( (array!105720 (arr!50971 (Array (_ BitVec 32) (_ BitVec 64))) (size!51522 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105719)

(declare-fun array_inv!39926 (array!105719) Bool)

(assert (=> start!136828 (array_inv!39926 _keys!610)))

(declare-fun b!1579777 () Bool)

(declare-fun res!1078465 () Bool)

(assert (=> b!1579777 (=> (not res!1078465) (not e!881314))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1579777 (= res!1078465 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51522 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579778 () Bool)

(declare-fun res!1078464 () Bool)

(assert (=> b!1579778 (=> (not res!1078464) (not e!881314))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579778 (= res!1078464 (validKeyInArray!0 k0!768))))

(declare-fun b!1579779 () Bool)

(assert (=> b!1579779 (= e!881314 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50971 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50971 _keys!610) ee!12) (select (arr!50971 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50971 _keys!610) ee!12) k0!768)) (not (= (select (arr!50971 _keys!610) ee!12) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51522 _keys!610))))))

(assert (= (and start!136828 res!1078466) b!1579777))

(assert (= (and b!1579777 res!1078465) b!1579778))

(assert (= (and b!1579778 res!1078464) b!1579779))

(declare-fun m!1451889 () Bool)

(assert (=> start!136828 m!1451889))

(declare-fun m!1451891 () Bool)

(assert (=> start!136828 m!1451891))

(declare-fun m!1451893 () Bool)

(assert (=> b!1579778 m!1451893))

(declare-fun m!1451895 () Bool)

(assert (=> b!1579779 m!1451895))

(check-sat (not start!136828) (not b!1579778))
(check-sat)
