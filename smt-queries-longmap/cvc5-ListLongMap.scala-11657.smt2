; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136754 () Bool)

(assert start!136754)

(declare-fun b!1579508 () Bool)

(declare-fun res!1078196 () Bool)

(declare-fun e!881165 () Bool)

(assert (=> b!1579508 (=> (not res!1078196) (not e!881165))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k!768 () (_ BitVec 64))

(declare-datatypes ((array!105666 0))(
  ( (array!105667 (arr!50946 (Array (_ BitVec 32) (_ BitVec 64))) (size!51497 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105666)

(assert (=> b!1579508 (= res!1078196 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50946 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50946 _keys!610) ee!12) (select (arr!50946 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078193 () Bool)

(assert (=> start!136754 (=> (not res!1078193) (not e!881165))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136754 (= res!1078193 (validMask!0 mask!910))))

(assert (=> start!136754 e!881165))

(assert (=> start!136754 true))

(declare-fun array_inv!39901 (array!105666) Bool)

(assert (=> start!136754 (array_inv!39901 _keys!610)))

(declare-fun b!1579509 () Bool)

(assert (=> b!1579509 (= e!881165 false)))

(declare-fun lt!676827 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579509 (= lt!676827 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(declare-fun b!1579506 () Bool)

(declare-fun res!1078194 () Bool)

(assert (=> b!1579506 (=> (not res!1078194) (not e!881165))))

(assert (=> b!1579506 (= res!1078194 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51497 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579507 () Bool)

(declare-fun res!1078195 () Bool)

(assert (=> b!1579507 (=> (not res!1078195) (not e!881165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579507 (= res!1078195 (validKeyInArray!0 k!768))))

(assert (= (and start!136754 res!1078193) b!1579506))

(assert (= (and b!1579506 res!1078194) b!1579507))

(assert (= (and b!1579507 res!1078195) b!1579508))

(assert (= (and b!1579508 res!1078196) b!1579509))

(declare-fun m!1451657 () Bool)

(assert (=> b!1579508 m!1451657))

(declare-fun m!1451659 () Bool)

(assert (=> start!136754 m!1451659))

(declare-fun m!1451661 () Bool)

(assert (=> start!136754 m!1451661))

(declare-fun m!1451663 () Bool)

(assert (=> b!1579509 m!1451663))

(declare-fun m!1451665 () Bool)

(assert (=> b!1579507 m!1451665))

(push 1)

(assert (not start!136754))

(assert (not b!1579509))

(assert (not b!1579507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

