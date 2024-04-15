; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135034 () Bool)

(assert start!135034)

(declare-fun res!1074412 () Bool)

(declare-fun e!876758 () Bool)

(assert (=> start!135034 (=> (not res!1074412) (not e!876758))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135034 (= res!1074412 (validMask!0 mask!889))))

(assert (=> start!135034 e!876758))

(assert (=> start!135034 true))

(declare-datatypes ((array!104974 0))(
  ( (array!104975 (arr!50650 (Array (_ BitVec 32) (_ BitVec 64))) (size!51202 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104974)

(declare-fun array_inv!39586 (array!104974) Bool)

(assert (=> start!135034 (array_inv!39586 _keys!600)))

(declare-fun b!1572366 () Bool)

(declare-fun res!1074414 () Bool)

(assert (=> b!1572366 (=> (not res!1074414) (not e!876758))))

(assert (=> b!1572366 (= res!1074414 (= (size!51202 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572367 () Bool)

(declare-fun res!1074413 () Bool)

(assert (=> b!1572367 (=> (not res!1074413) (not e!876758))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572367 (= res!1074413 (validKeyInArray!0 k!754))))

(declare-fun b!1572368 () Bool)

(assert (=> b!1572368 (= e!876758 false)))

(declare-datatypes ((SeekEntryResult!13598 0))(
  ( (MissingZero!13598 (index!56790 (_ BitVec 32))) (Found!13598 (index!56791 (_ BitVec 32))) (Intermediate!13598 (undefined!14410 Bool) (index!56792 (_ BitVec 32)) (x!141563 (_ BitVec 32))) (Undefined!13598) (MissingVacant!13598 (index!56793 (_ BitVec 32))) )
))
(declare-fun lt!673797 () SeekEntryResult!13598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104974 (_ BitVec 32)) SeekEntryResult!13598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572368 (= lt!673797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135034 res!1074412) b!1572366))

(assert (= (and b!1572366 res!1074414) b!1572367))

(assert (= (and b!1572367 res!1074413) b!1572368))

(declare-fun m!1445459 () Bool)

(assert (=> start!135034 m!1445459))

(declare-fun m!1445461 () Bool)

(assert (=> start!135034 m!1445461))

(declare-fun m!1445463 () Bool)

(assert (=> b!1572367 m!1445463))

(declare-fun m!1445465 () Bool)

(assert (=> b!1572368 m!1445465))

(assert (=> b!1572368 m!1445465))

(declare-fun m!1445467 () Bool)

(assert (=> b!1572368 m!1445467))

(push 1)

(assert (not b!1572368))

(assert (not start!135034))

(assert (not b!1572367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

