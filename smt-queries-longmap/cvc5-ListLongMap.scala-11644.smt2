; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136352 () Bool)

(assert start!136352)

(declare-fun res!1077462 () Bool)

(declare-fun e!880300 () Bool)

(assert (=> start!136352 (=> (not res!1077462) (not e!880300))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136352 (= res!1077462 (validMask!0 mask!898))))

(assert (=> start!136352 e!880300))

(assert (=> start!136352 true))

(declare-datatypes ((array!105558 0))(
  ( (array!105559 (arr!50907 (Array (_ BitVec 32) (_ BitVec 64))) (size!51458 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105558)

(declare-fun array_inv!39862 (array!105558) Bool)

(assert (=> start!136352 (array_inv!39862 _keys!605)))

(declare-fun b!1578049 () Bool)

(declare-fun res!1077463 () Bool)

(assert (=> b!1578049 (=> (not res!1077463) (not e!880300))))

(assert (=> b!1578049 (= res!1077463 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51458 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578050 () Bool)

(declare-fun res!1077464 () Bool)

(assert (=> b!1578050 (=> (not res!1077464) (not e!880300))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578050 (= res!1077464 (validKeyInArray!0 k!761))))

(declare-fun b!1578051 () Bool)

(assert (=> b!1578051 (= e!880300 false)))

(declare-datatypes ((SeekEntryResult!13666 0))(
  ( (MissingZero!13666 (index!57062 (_ BitVec 32))) (Found!13666 (index!57063 (_ BitVec 32))) (Intermediate!13666 (undefined!14478 Bool) (index!57064 (_ BitVec 32)) (x!142231 (_ BitVec 32))) (Undefined!13666) (MissingVacant!13666 (index!57065 (_ BitVec 32))) )
))
(declare-fun lt!676170 () SeekEntryResult!13666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105558 (_ BitVec 32)) SeekEntryResult!13666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578051 (= lt!676170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136352 res!1077462) b!1578049))

(assert (= (and b!1578049 res!1077463) b!1578050))

(assert (= (and b!1578050 res!1077464) b!1578051))

(declare-fun m!1450847 () Bool)

(assert (=> start!136352 m!1450847))

(declare-fun m!1450849 () Bool)

(assert (=> start!136352 m!1450849))

(declare-fun m!1450851 () Bool)

(assert (=> b!1578050 m!1450851))

(declare-fun m!1450853 () Bool)

(assert (=> b!1578051 m!1450853))

(assert (=> b!1578051 m!1450853))

(declare-fun m!1450855 () Bool)

(assert (=> b!1578051 m!1450855))

(push 1)

(assert (not b!1578051))

(assert (not b!1578050))

(assert (not start!136352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

