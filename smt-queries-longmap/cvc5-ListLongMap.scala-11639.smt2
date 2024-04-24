; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136292 () Bool)

(assert start!136292)

(declare-fun res!1077299 () Bool)

(declare-fun e!880166 () Bool)

(assert (=> start!136292 (=> (not res!1077299) (not e!880166))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136292 (= res!1077299 (validMask!0 mask!898))))

(assert (=> start!136292 e!880166))

(assert (=> start!136292 true))

(declare-datatypes ((array!105525 0))(
  ( (array!105526 (arr!50892 (Array (_ BitVec 32) (_ BitVec 64))) (size!51443 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105525)

(declare-fun array_inv!39847 (array!105525) Bool)

(assert (=> start!136292 (array_inv!39847 _keys!605)))

(declare-fun b!1577833 () Bool)

(declare-fun res!1077298 () Bool)

(assert (=> b!1577833 (=> (not res!1077298) (not e!880166))))

(assert (=> b!1577833 (= res!1077298 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51443 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577834 () Bool)

(declare-fun res!1077297 () Bool)

(assert (=> b!1577834 (=> (not res!1077297) (not e!880166))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577834 (= res!1077297 (validKeyInArray!0 k!761))))

(declare-fun b!1577835 () Bool)

(assert (=> b!1577835 (= e!880166 false)))

(declare-datatypes ((SeekEntryResult!13651 0))(
  ( (MissingZero!13651 (index!57002 (_ BitVec 32))) (Found!13651 (index!57003 (_ BitVec 32))) (Intermediate!13651 (undefined!14463 Bool) (index!57004 (_ BitVec 32)) (x!142170 (_ BitVec 32))) (Undefined!13651) (MissingVacant!13651 (index!57005 (_ BitVec 32))) )
))
(declare-fun lt!676089 () SeekEntryResult!13651)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105525 (_ BitVec 32)) SeekEntryResult!13651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577835 (= lt!676089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136292 res!1077299) b!1577833))

(assert (= (and b!1577833 res!1077298) b!1577834))

(assert (= (and b!1577834 res!1077297) b!1577835))

(declare-fun m!1450667 () Bool)

(assert (=> start!136292 m!1450667))

(declare-fun m!1450669 () Bool)

(assert (=> start!136292 m!1450669))

(declare-fun m!1450671 () Bool)

(assert (=> b!1577834 m!1450671))

(declare-fun m!1450673 () Bool)

(assert (=> b!1577835 m!1450673))

(assert (=> b!1577835 m!1450673))

(declare-fun m!1450675 () Bool)

(assert (=> b!1577835 m!1450675))

(push 1)

(assert (not b!1577835))

(assert (not b!1577834))

(assert (not start!136292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

