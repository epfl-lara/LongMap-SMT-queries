; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135028 () Bool)

(assert start!135028)

(declare-fun res!1074387 () Bool)

(declare-fun e!876740 () Bool)

(assert (=> start!135028 (=> (not res!1074387) (not e!876740))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135028 (= res!1074387 (validMask!0 mask!889))))

(assert (=> start!135028 e!876740))

(assert (=> start!135028 true))

(declare-datatypes ((array!104968 0))(
  ( (array!104969 (arr!50647 (Array (_ BitVec 32) (_ BitVec 64))) (size!51199 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104968)

(declare-fun array_inv!39583 (array!104968) Bool)

(assert (=> start!135028 (array_inv!39583 _keys!600)))

(declare-fun b!1572339 () Bool)

(declare-fun res!1074386 () Bool)

(assert (=> b!1572339 (=> (not res!1074386) (not e!876740))))

(assert (=> b!1572339 (= res!1074386 (= (size!51199 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572340 () Bool)

(declare-fun res!1074385 () Bool)

(assert (=> b!1572340 (=> (not res!1074385) (not e!876740))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572340 (= res!1074385 (validKeyInArray!0 k!754))))

(declare-fun b!1572341 () Bool)

(assert (=> b!1572341 (= e!876740 false)))

(declare-datatypes ((SeekEntryResult!13595 0))(
  ( (MissingZero!13595 (index!56778 (_ BitVec 32))) (Found!13595 (index!56779 (_ BitVec 32))) (Intermediate!13595 (undefined!14407 Bool) (index!56780 (_ BitVec 32)) (x!141552 (_ BitVec 32))) (Undefined!13595) (MissingVacant!13595 (index!56781 (_ BitVec 32))) )
))
(declare-fun lt!673788 () SeekEntryResult!13595)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104968 (_ BitVec 32)) SeekEntryResult!13595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572341 (= lt!673788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135028 res!1074387) b!1572339))

(assert (= (and b!1572339 res!1074386) b!1572340))

(assert (= (and b!1572340 res!1074385) b!1572341))

(declare-fun m!1445429 () Bool)

(assert (=> start!135028 m!1445429))

(declare-fun m!1445431 () Bool)

(assert (=> start!135028 m!1445431))

(declare-fun m!1445433 () Bool)

(assert (=> b!1572340 m!1445433))

(declare-fun m!1445435 () Bool)

(assert (=> b!1572341 m!1445435))

(assert (=> b!1572341 m!1445435))

(declare-fun m!1445437 () Bool)

(assert (=> b!1572341 m!1445437))

(push 1)

(assert (not start!135028))

(assert (not b!1572341))

(assert (not b!1572340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

