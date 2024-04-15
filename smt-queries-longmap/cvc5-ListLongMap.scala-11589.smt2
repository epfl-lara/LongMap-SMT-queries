; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135040 () Bool)

(assert start!135040)

(declare-fun res!1074441 () Bool)

(declare-fun e!876776 () Bool)

(assert (=> start!135040 (=> (not res!1074441) (not e!876776))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135040 (= res!1074441 (validMask!0 mask!889))))

(assert (=> start!135040 e!876776))

(assert (=> start!135040 true))

(declare-datatypes ((array!104980 0))(
  ( (array!104981 (arr!50653 (Array (_ BitVec 32) (_ BitVec 64))) (size!51205 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104980)

(declare-fun array_inv!39589 (array!104980) Bool)

(assert (=> start!135040 (array_inv!39589 _keys!600)))

(declare-fun b!1572393 () Bool)

(declare-fun res!1074440 () Bool)

(assert (=> b!1572393 (=> (not res!1074440) (not e!876776))))

(assert (=> b!1572393 (= res!1074440 (= (size!51205 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572394 () Bool)

(declare-fun res!1074439 () Bool)

(assert (=> b!1572394 (=> (not res!1074439) (not e!876776))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572394 (= res!1074439 (validKeyInArray!0 k!754))))

(declare-fun b!1572395 () Bool)

(assert (=> b!1572395 (= e!876776 false)))

(declare-datatypes ((SeekEntryResult!13601 0))(
  ( (MissingZero!13601 (index!56802 (_ BitVec 32))) (Found!13601 (index!56803 (_ BitVec 32))) (Intermediate!13601 (undefined!14413 Bool) (index!56804 (_ BitVec 32)) (x!141574 (_ BitVec 32))) (Undefined!13601) (MissingVacant!13601 (index!56805 (_ BitVec 32))) )
))
(declare-fun lt!673806 () SeekEntryResult!13601)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104980 (_ BitVec 32)) SeekEntryResult!13601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572395 (= lt!673806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135040 res!1074441) b!1572393))

(assert (= (and b!1572393 res!1074440) b!1572394))

(assert (= (and b!1572394 res!1074439) b!1572395))

(declare-fun m!1445489 () Bool)

(assert (=> start!135040 m!1445489))

(declare-fun m!1445491 () Bool)

(assert (=> start!135040 m!1445491))

(declare-fun m!1445493 () Bool)

(assert (=> b!1572394 m!1445493))

(declare-fun m!1445495 () Bool)

(assert (=> b!1572395 m!1445495))

(assert (=> b!1572395 m!1445495))

(declare-fun m!1445497 () Bool)

(assert (=> b!1572395 m!1445497))

(push 1)

(assert (not b!1572394))

(assert (not b!1572395))

(assert (not start!135040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

