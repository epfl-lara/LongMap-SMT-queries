; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136840 () Bool)

(assert start!136840)

(declare-fun b!1579833 () Bool)

(declare-fun res!1078520 () Bool)

(declare-fun e!881350 () Bool)

(assert (=> b!1579833 (=> (not res!1078520) (not e!881350))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105731 0))(
  ( (array!105732 (arr!50977 (Array (_ BitVec 32) (_ BitVec 64))) (size!51528 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105731)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1579833 (= res!1078520 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51528 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1078522 () Bool)

(assert (=> start!136840 (=> (not res!1078522) (not e!881350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136840 (= res!1078522 (validMask!0 mask!910))))

(assert (=> start!136840 e!881350))

(assert (=> start!136840 true))

(declare-fun array_inv!39932 (array!105731) Bool)

(assert (=> start!136840 (array_inv!39932 _keys!610)))

(declare-fun b!1579836 () Bool)

(assert (=> b!1579836 (= e!881350 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!458)) (bvsub #b01111111111111111111111111111110 x!458)))))

(declare-fun lt!676884 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579836 (= lt!676884 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(declare-fun b!1579834 () Bool)

(declare-fun res!1078521 () Bool)

(assert (=> b!1579834 (=> (not res!1078521) (not e!881350))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579834 (= res!1078521 (validKeyInArray!0 k0!768))))

(declare-fun b!1579835 () Bool)

(declare-fun res!1078523 () Bool)

(assert (=> b!1579835 (=> (not res!1078523) (not e!881350))))

(assert (=> b!1579835 (= res!1078523 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50977 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50977 _keys!610) ee!12) (select (arr!50977 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136840 res!1078522) b!1579833))

(assert (= (and b!1579833 res!1078520) b!1579834))

(assert (= (and b!1579834 res!1078521) b!1579835))

(assert (= (and b!1579835 res!1078523) b!1579836))

(declare-fun m!1451937 () Bool)

(assert (=> start!136840 m!1451937))

(declare-fun m!1451939 () Bool)

(assert (=> start!136840 m!1451939))

(declare-fun m!1451941 () Bool)

(assert (=> b!1579836 m!1451941))

(declare-fun m!1451943 () Bool)

(assert (=> b!1579834 m!1451943))

(declare-fun m!1451945 () Bool)

(assert (=> b!1579835 m!1451945))

(check-sat (not b!1579834) (not start!136840) (not b!1579836))
(check-sat)
