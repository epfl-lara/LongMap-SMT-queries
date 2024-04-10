; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134988 () Bool)

(assert start!134988)

(declare-fun res!1074321 () Bool)

(declare-fun e!876758 () Bool)

(assert (=> start!134988 (=> (not res!1074321) (not e!876758))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134988 (= res!1074321 (validMask!0 mask!889))))

(assert (=> start!134988 e!876758))

(assert (=> start!134988 true))

(declare-datatypes ((array!105004 0))(
  ( (array!105005 (arr!50667 (Array (_ BitVec 32) (_ BitVec 64))) (size!51217 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105004)

(declare-fun array_inv!39394 (array!105004) Bool)

(assert (=> start!134988 (array_inv!39394 _keys!600)))

(declare-fun b!1572355 () Bool)

(declare-fun res!1074319 () Bool)

(assert (=> b!1572355 (=> (not res!1074319) (not e!876758))))

(assert (=> b!1572355 (= res!1074319 (= (size!51217 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572356 () Bool)

(declare-fun res!1074320 () Bool)

(assert (=> b!1572356 (=> (not res!1074320) (not e!876758))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572356 (= res!1074320 (validKeyInArray!0 k!754))))

(declare-fun b!1572357 () Bool)

(assert (=> b!1572357 (= e!876758 false)))

(declare-datatypes ((SeekEntryResult!13580 0))(
  ( (MissingZero!13580 (index!56718 (_ BitVec 32))) (Found!13580 (index!56719 (_ BitVec 32))) (Intermediate!13580 (undefined!14392 Bool) (index!56720 (_ BitVec 32)) (x!141490 (_ BitVec 32))) (Undefined!13580) (MissingVacant!13580 (index!56721 (_ BitVec 32))) )
))
(declare-fun lt!673957 () SeekEntryResult!13580)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105004 (_ BitVec 32)) SeekEntryResult!13580)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572357 (= lt!673957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134988 res!1074321) b!1572355))

(assert (= (and b!1572355 res!1074319) b!1572356))

(assert (= (and b!1572356 res!1074320) b!1572357))

(declare-fun m!1446117 () Bool)

(assert (=> start!134988 m!1446117))

(declare-fun m!1446119 () Bool)

(assert (=> start!134988 m!1446119))

(declare-fun m!1446121 () Bool)

(assert (=> b!1572356 m!1446121))

(declare-fun m!1446123 () Bool)

(assert (=> b!1572357 m!1446123))

(assert (=> b!1572357 m!1446123))

(declare-fun m!1446125 () Bool)

(assert (=> b!1572357 m!1446125))

(push 1)

(assert (not start!134988))

(assert (not b!1572357))

(assert (not b!1572356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

