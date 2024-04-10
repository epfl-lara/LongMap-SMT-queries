; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135096 () Bool)

(assert start!135096)

(declare-fun res!1074597 () Bool)

(declare-fun e!876991 () Bool)

(assert (=> start!135096 (=> (not res!1074597) (not e!876991))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135096 (= res!1074597 (validMask!0 mask!889))))

(assert (=> start!135096 e!876991))

(assert (=> start!135096 true))

(declare-datatypes ((array!105058 0))(
  ( (array!105059 (arr!50691 (Array (_ BitVec 32) (_ BitVec 64))) (size!51241 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105058)

(declare-fun array_inv!39418 (array!105058) Bool)

(assert (=> start!135096 (array_inv!39418 _keys!600)))

(declare-fun b!1572733 () Bool)

(declare-fun res!1074595 () Bool)

(assert (=> b!1572733 (=> (not res!1074595) (not e!876991))))

(assert (=> b!1572733 (= res!1074595 (= (size!51241 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572734 () Bool)

(declare-fun res!1074596 () Bool)

(assert (=> b!1572734 (=> (not res!1074596) (not e!876991))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572734 (= res!1074596 (validKeyInArray!0 k!754))))

(declare-fun b!1572735 () Bool)

(assert (=> b!1572735 (= e!876991 false)))

(declare-datatypes ((SeekEntryResult!13604 0))(
  ( (MissingZero!13604 (index!56814 (_ BitVec 32))) (Found!13604 (index!56815 (_ BitVec 32))) (Intermediate!13604 (undefined!14416 Bool) (index!56816 (_ BitVec 32)) (x!141590 (_ BitVec 32))) (Undefined!13604) (MissingVacant!13604 (index!56817 (_ BitVec 32))) )
))
(declare-fun lt!674101 () SeekEntryResult!13604)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105058 (_ BitVec 32)) SeekEntryResult!13604)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572735 (= lt!674101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135096 res!1074597) b!1572733))

(assert (= (and b!1572733 res!1074595) b!1572734))

(assert (= (and b!1572734 res!1074596) b!1572735))

(declare-fun m!1446411 () Bool)

(assert (=> start!135096 m!1446411))

(declare-fun m!1446413 () Bool)

(assert (=> start!135096 m!1446413))

(declare-fun m!1446415 () Bool)

(assert (=> b!1572734 m!1446415))

(declare-fun m!1446417 () Bool)

(assert (=> b!1572735 m!1446417))

(assert (=> b!1572735 m!1446417))

(declare-fun m!1446419 () Bool)

(assert (=> b!1572735 m!1446419))

(push 1)

(assert (not b!1572735))

(assert (not start!135096))

(assert (not b!1572734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

