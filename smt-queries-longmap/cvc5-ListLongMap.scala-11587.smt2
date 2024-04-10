; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135074 () Bool)

(assert start!135074)

(declare-fun res!1074497 () Bool)

(declare-fun e!876926 () Bool)

(assert (=> start!135074 (=> (not res!1074497) (not e!876926))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135074 (= res!1074497 (validMask!0 mask!889))))

(assert (=> start!135074 e!876926))

(assert (=> start!135074 true))

(declare-datatypes ((array!105036 0))(
  ( (array!105037 (arr!50680 (Array (_ BitVec 32) (_ BitVec 64))) (size!51230 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105036)

(declare-fun array_inv!39407 (array!105036) Bool)

(assert (=> start!135074 (array_inv!39407 _keys!600)))

(declare-fun b!1572634 () Bool)

(declare-fun res!1074496 () Bool)

(assert (=> b!1572634 (=> (not res!1074496) (not e!876926))))

(assert (=> b!1572634 (= res!1074496 (= (size!51230 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572635 () Bool)

(declare-fun res!1074498 () Bool)

(assert (=> b!1572635 (=> (not res!1074498) (not e!876926))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572635 (= res!1074498 (validKeyInArray!0 k!754))))

(declare-fun b!1572636 () Bool)

(assert (=> b!1572636 (= e!876926 false)))

(declare-datatypes ((SeekEntryResult!13593 0))(
  ( (MissingZero!13593 (index!56770 (_ BitVec 32))) (Found!13593 (index!56771 (_ BitVec 32))) (Intermediate!13593 (undefined!14405 Bool) (index!56772 (_ BitVec 32)) (x!141555 (_ BitVec 32))) (Undefined!13593) (MissingVacant!13593 (index!56773 (_ BitVec 32))) )
))
(declare-fun lt!674068 () SeekEntryResult!13593)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105036 (_ BitVec 32)) SeekEntryResult!13593)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572636 (= lt!674068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135074 res!1074497) b!1572634))

(assert (= (and b!1572634 res!1074496) b!1572635))

(assert (= (and b!1572635 res!1074498) b!1572636))

(declare-fun m!1446301 () Bool)

(assert (=> start!135074 m!1446301))

(declare-fun m!1446303 () Bool)

(assert (=> start!135074 m!1446303))

(declare-fun m!1446305 () Bool)

(assert (=> b!1572635 m!1446305))

(declare-fun m!1446307 () Bool)

(assert (=> b!1572636 m!1446307))

(assert (=> b!1572636 m!1446307))

(declare-fun m!1446309 () Bool)

(assert (=> b!1572636 m!1446309))

(push 1)

(assert (not start!135074))

(assert (not b!1572636))

(assert (not b!1572635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

