; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135080 () Bool)

(assert start!135080)

(declare-fun res!1074523 () Bool)

(declare-fun e!876944 () Bool)

(assert (=> start!135080 (=> (not res!1074523) (not e!876944))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135080 (= res!1074523 (validMask!0 mask!889))))

(assert (=> start!135080 e!876944))

(assert (=> start!135080 true))

(declare-datatypes ((array!105042 0))(
  ( (array!105043 (arr!50683 (Array (_ BitVec 32) (_ BitVec 64))) (size!51233 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105042)

(declare-fun array_inv!39410 (array!105042) Bool)

(assert (=> start!135080 (array_inv!39410 _keys!600)))

(declare-fun b!1572661 () Bool)

(declare-fun res!1074525 () Bool)

(assert (=> b!1572661 (=> (not res!1074525) (not e!876944))))

(assert (=> b!1572661 (= res!1074525 (= (size!51233 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572662 () Bool)

(declare-fun res!1074524 () Bool)

(assert (=> b!1572662 (=> (not res!1074524) (not e!876944))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572662 (= res!1074524 (validKeyInArray!0 k!754))))

(declare-fun b!1572663 () Bool)

(assert (=> b!1572663 (= e!876944 false)))

(declare-datatypes ((SeekEntryResult!13596 0))(
  ( (MissingZero!13596 (index!56782 (_ BitVec 32))) (Found!13596 (index!56783 (_ BitVec 32))) (Intermediate!13596 (undefined!14408 Bool) (index!56784 (_ BitVec 32)) (x!141566 (_ BitVec 32))) (Undefined!13596) (MissingVacant!13596 (index!56785 (_ BitVec 32))) )
))
(declare-fun lt!674077 () SeekEntryResult!13596)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105042 (_ BitVec 32)) SeekEntryResult!13596)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572663 (= lt!674077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135080 res!1074523) b!1572661))

(assert (= (and b!1572661 res!1074525) b!1572662))

(assert (= (and b!1572662 res!1074524) b!1572663))

(declare-fun m!1446331 () Bool)

(assert (=> start!135080 m!1446331))

(declare-fun m!1446333 () Bool)

(assert (=> start!135080 m!1446333))

(declare-fun m!1446335 () Bool)

(assert (=> b!1572662 m!1446335))

(declare-fun m!1446337 () Bool)

(assert (=> b!1572663 m!1446337))

(assert (=> b!1572663 m!1446337))

(declare-fun m!1446339 () Bool)

(assert (=> b!1572663 m!1446339))

(push 1)

(assert (not start!135080))

(assert (not b!1572663))

(assert (not b!1572662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

