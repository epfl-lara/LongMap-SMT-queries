; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134982 () Bool)

(assert start!134982)

(declare-fun res!1074292 () Bool)

(declare-fun e!876740 () Bool)

(assert (=> start!134982 (=> (not res!1074292) (not e!876740))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134982 (= res!1074292 (validMask!0 mask!889))))

(assert (=> start!134982 e!876740))

(assert (=> start!134982 true))

(declare-datatypes ((array!104998 0))(
  ( (array!104999 (arr!50664 (Array (_ BitVec 32) (_ BitVec 64))) (size!51214 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104998)

(declare-fun array_inv!39391 (array!104998) Bool)

(assert (=> start!134982 (array_inv!39391 _keys!600)))

(declare-fun b!1572328 () Bool)

(declare-fun res!1074294 () Bool)

(assert (=> b!1572328 (=> (not res!1074294) (not e!876740))))

(assert (=> b!1572328 (= res!1074294 (= (size!51214 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572329 () Bool)

(declare-fun res!1074293 () Bool)

(assert (=> b!1572329 (=> (not res!1074293) (not e!876740))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572329 (= res!1074293 (validKeyInArray!0 k!754))))

(declare-fun b!1572330 () Bool)

(assert (=> b!1572330 (= e!876740 false)))

(declare-datatypes ((SeekEntryResult!13577 0))(
  ( (MissingZero!13577 (index!56706 (_ BitVec 32))) (Found!13577 (index!56707 (_ BitVec 32))) (Intermediate!13577 (undefined!14389 Bool) (index!56708 (_ BitVec 32)) (x!141479 (_ BitVec 32))) (Undefined!13577) (MissingVacant!13577 (index!56709 (_ BitVec 32))) )
))
(declare-fun lt!673948 () SeekEntryResult!13577)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104998 (_ BitVec 32)) SeekEntryResult!13577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572330 (= lt!673948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134982 res!1074292) b!1572328))

(assert (= (and b!1572328 res!1074294) b!1572329))

(assert (= (and b!1572329 res!1074293) b!1572330))

(declare-fun m!1446087 () Bool)

(assert (=> start!134982 m!1446087))

(declare-fun m!1446089 () Bool)

(assert (=> start!134982 m!1446089))

(declare-fun m!1446091 () Bool)

(assert (=> b!1572329 m!1446091))

(declare-fun m!1446093 () Bool)

(assert (=> b!1572330 m!1446093))

(assert (=> b!1572330 m!1446093))

(declare-fun m!1446095 () Bool)

(assert (=> b!1572330 m!1446095))

(push 1)

(assert (not b!1572330))

(assert (not start!134982))

(assert (not b!1572329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

