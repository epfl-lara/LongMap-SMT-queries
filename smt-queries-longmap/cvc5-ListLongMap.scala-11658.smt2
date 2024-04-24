; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136760 () Bool)

(assert start!136760)

(declare-fun res!1078230 () Bool)

(declare-fun e!881182 () Bool)

(assert (=> start!136760 (=> (not res!1078230) (not e!881182))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136760 (= res!1078230 (validMask!0 mask!910))))

(assert (=> start!136760 e!881182))

(assert (=> start!136760 true))

(declare-datatypes ((array!105672 0))(
  ( (array!105673 (arr!50949 (Array (_ BitVec 32) (_ BitVec 64))) (size!51500 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105672)

(declare-fun array_inv!39904 (array!105672) Bool)

(assert (=> start!136760 (array_inv!39904 _keys!610)))

(declare-fun b!1579544 () Bool)

(declare-fun res!1078229 () Bool)

(assert (=> b!1579544 (=> (not res!1078229) (not e!881182))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1579544 (= res!1078229 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50949 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50949 _keys!610) ee!12) (select (arr!50949 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1579545 () Bool)

(assert (=> b!1579545 (= e!881182 false)))

(declare-fun lt!676836 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579545 (= lt!676836 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(declare-fun b!1579542 () Bool)

(declare-fun res!1078232 () Bool)

(assert (=> b!1579542 (=> (not res!1078232) (not e!881182))))

(assert (=> b!1579542 (= res!1078232 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51500 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579543 () Bool)

(declare-fun res!1078231 () Bool)

(assert (=> b!1579543 (=> (not res!1078231) (not e!881182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579543 (= res!1078231 (validKeyInArray!0 k!768))))

(assert (= (and start!136760 res!1078230) b!1579542))

(assert (= (and b!1579542 res!1078232) b!1579543))

(assert (= (and b!1579543 res!1078231) b!1579544))

(assert (= (and b!1579544 res!1078229) b!1579545))

(declare-fun m!1451687 () Bool)

(assert (=> start!136760 m!1451687))

(declare-fun m!1451689 () Bool)

(assert (=> start!136760 m!1451689))

(declare-fun m!1451691 () Bool)

(assert (=> b!1579544 m!1451691))

(declare-fun m!1451693 () Bool)

(assert (=> b!1579545 m!1451693))

(declare-fun m!1451695 () Bool)

(assert (=> b!1579543 m!1451695))

(push 1)

(assert (not start!136760))

(assert (not b!1579543))

(assert (not b!1579545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

