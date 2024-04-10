; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135092 () Bool)

(assert start!135092)

(declare-fun res!1074578 () Bool)

(declare-fun e!876979 () Bool)

(assert (=> start!135092 (=> (not res!1074578) (not e!876979))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135092 (= res!1074578 (validMask!0 mask!889))))

(assert (=> start!135092 e!876979))

(assert (=> start!135092 true))

(declare-datatypes ((array!105054 0))(
  ( (array!105055 (arr!50689 (Array (_ BitVec 32) (_ BitVec 64))) (size!51239 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105054)

(declare-fun array_inv!39416 (array!105054) Bool)

(assert (=> start!135092 (array_inv!39416 _keys!600)))

(declare-fun b!1572715 () Bool)

(declare-fun res!1074577 () Bool)

(assert (=> b!1572715 (=> (not res!1074577) (not e!876979))))

(assert (=> b!1572715 (= res!1074577 (= (size!51239 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572716 () Bool)

(declare-fun res!1074579 () Bool)

(assert (=> b!1572716 (=> (not res!1074579) (not e!876979))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572716 (= res!1074579 (validKeyInArray!0 k!754))))

(declare-fun b!1572717 () Bool)

(assert (=> b!1572717 (= e!876979 false)))

(declare-datatypes ((SeekEntryResult!13602 0))(
  ( (MissingZero!13602 (index!56806 (_ BitVec 32))) (Found!13602 (index!56807 (_ BitVec 32))) (Intermediate!13602 (undefined!14414 Bool) (index!56808 (_ BitVec 32)) (x!141588 (_ BitVec 32))) (Undefined!13602) (MissingVacant!13602 (index!56809 (_ BitVec 32))) )
))
(declare-fun lt!674095 () SeekEntryResult!13602)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105054 (_ BitVec 32)) SeekEntryResult!13602)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572717 (= lt!674095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135092 res!1074578) b!1572715))

(assert (= (and b!1572715 res!1074577) b!1572716))

(assert (= (and b!1572716 res!1074579) b!1572717))

(declare-fun m!1446391 () Bool)

(assert (=> start!135092 m!1446391))

(declare-fun m!1446393 () Bool)

(assert (=> start!135092 m!1446393))

(declare-fun m!1446395 () Bool)

(assert (=> b!1572716 m!1446395))

(declare-fun m!1446397 () Bool)

(assert (=> b!1572717 m!1446397))

(assert (=> b!1572717 m!1446397))

(declare-fun m!1446399 () Bool)

(assert (=> b!1572717 m!1446399))

(push 1)

(assert (not b!1572717))

(assert (not start!135092))

(assert (not b!1572716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

