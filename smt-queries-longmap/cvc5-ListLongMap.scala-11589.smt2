; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135086 () Bool)

(assert start!135086)

(declare-fun res!1074550 () Bool)

(declare-fun e!876961 () Bool)

(assert (=> start!135086 (=> (not res!1074550) (not e!876961))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135086 (= res!1074550 (validMask!0 mask!889))))

(assert (=> start!135086 e!876961))

(assert (=> start!135086 true))

(declare-datatypes ((array!105048 0))(
  ( (array!105049 (arr!50686 (Array (_ BitVec 32) (_ BitVec 64))) (size!51236 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105048)

(declare-fun array_inv!39413 (array!105048) Bool)

(assert (=> start!135086 (array_inv!39413 _keys!600)))

(declare-fun b!1572688 () Bool)

(declare-fun res!1074551 () Bool)

(assert (=> b!1572688 (=> (not res!1074551) (not e!876961))))

(assert (=> b!1572688 (= res!1074551 (= (size!51236 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572689 () Bool)

(declare-fun res!1074552 () Bool)

(assert (=> b!1572689 (=> (not res!1074552) (not e!876961))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572689 (= res!1074552 (validKeyInArray!0 k!754))))

(declare-fun b!1572690 () Bool)

(assert (=> b!1572690 (= e!876961 false)))

(declare-datatypes ((SeekEntryResult!13599 0))(
  ( (MissingZero!13599 (index!56794 (_ BitVec 32))) (Found!13599 (index!56795 (_ BitVec 32))) (Intermediate!13599 (undefined!14411 Bool) (index!56796 (_ BitVec 32)) (x!141577 (_ BitVec 32))) (Undefined!13599) (MissingVacant!13599 (index!56797 (_ BitVec 32))) )
))
(declare-fun lt!674086 () SeekEntryResult!13599)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105048 (_ BitVec 32)) SeekEntryResult!13599)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572690 (= lt!674086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135086 res!1074550) b!1572688))

(assert (= (and b!1572688 res!1074551) b!1572689))

(assert (= (and b!1572689 res!1074552) b!1572690))

(declare-fun m!1446361 () Bool)

(assert (=> start!135086 m!1446361))

(declare-fun m!1446363 () Bool)

(assert (=> start!135086 m!1446363))

(declare-fun m!1446365 () Bool)

(assert (=> b!1572689 m!1446365))

(declare-fun m!1446367 () Bool)

(assert (=> b!1572690 m!1446367))

(assert (=> b!1572690 m!1446367))

(declare-fun m!1446369 () Bool)

(assert (=> b!1572690 m!1446369))

(push 1)

(assert (not start!135086))

(assert (not b!1572689))

(assert (not b!1572690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

