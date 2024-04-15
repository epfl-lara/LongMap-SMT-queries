; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135584 () Bool)

(assert start!135584)

(declare-fun res!1075726 () Bool)

(declare-fun e!877945 () Bool)

(assert (=> start!135584 (=> (not res!1075726) (not e!877945))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135584 (= res!1075726 (validMask!0 mask!898))))

(assert (=> start!135584 e!877945))

(assert (=> start!135584 true))

(declare-datatypes ((array!105219 0))(
  ( (array!105220 (arr!50755 (Array (_ BitVec 32) (_ BitVec 64))) (size!51307 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105219)

(declare-fun array_inv!39691 (array!105219) Bool)

(assert (=> start!135584 (array_inv!39691 _keys!605)))

(declare-fun b!1574247 () Bool)

(declare-fun res!1075728 () Bool)

(assert (=> b!1574247 (=> (not res!1075728) (not e!877945))))

(assert (=> b!1574247 (= res!1075728 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51307 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574248 () Bool)

(declare-fun res!1075727 () Bool)

(assert (=> b!1574248 (=> (not res!1075727) (not e!877945))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574248 (= res!1075727 (validKeyInArray!0 k!761))))

(declare-fun b!1574249 () Bool)

(assert (=> b!1574249 (= e!877945 false)))

(declare-datatypes ((SeekEntryResult!13655 0))(
  ( (MissingZero!13655 (index!57018 (_ BitVec 32))) (Found!13655 (index!57019 (_ BitVec 32))) (Intermediate!13655 (undefined!14467 Bool) (index!57020 (_ BitVec 32)) (x!141960 (_ BitVec 32))) (Undefined!13655) (MissingVacant!13655 (index!57021 (_ BitVec 32))) )
))
(declare-fun lt!674571 () SeekEntryResult!13655)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105219 (_ BitVec 32)) SeekEntryResult!13655)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574249 (= lt!674571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135584 res!1075726) b!1574247))

(assert (= (and b!1574247 res!1075728) b!1574248))

(assert (= (and b!1574248 res!1075727) b!1574249))

(declare-fun m!1446893 () Bool)

(assert (=> start!135584 m!1446893))

(declare-fun m!1446895 () Bool)

(assert (=> start!135584 m!1446895))

(declare-fun m!1446897 () Bool)

(assert (=> b!1574248 m!1446897))

(declare-fun m!1446899 () Bool)

(assert (=> b!1574249 m!1446899))

(assert (=> b!1574249 m!1446899))

(declare-fun m!1446901 () Bool)

(assert (=> b!1574249 m!1446901))

(push 1)

(assert (not b!1574248))

(assert (not start!135584))

(assert (not b!1574249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

