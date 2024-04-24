; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136298 () Bool)

(assert start!136298)

(declare-fun res!1077325 () Bool)

(declare-fun e!880184 () Bool)

(assert (=> start!136298 (=> (not res!1077325) (not e!880184))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136298 (= res!1077325 (validMask!0 mask!898))))

(assert (=> start!136298 e!880184))

(assert (=> start!136298 true))

(declare-datatypes ((array!105531 0))(
  ( (array!105532 (arr!50895 (Array (_ BitVec 32) (_ BitVec 64))) (size!51446 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105531)

(declare-fun array_inv!39850 (array!105531) Bool)

(assert (=> start!136298 (array_inv!39850 _keys!605)))

(declare-fun b!1577860 () Bool)

(declare-fun res!1077326 () Bool)

(assert (=> b!1577860 (=> (not res!1077326) (not e!880184))))

(assert (=> b!1577860 (= res!1077326 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51446 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577861 () Bool)

(declare-fun res!1077324 () Bool)

(assert (=> b!1577861 (=> (not res!1077324) (not e!880184))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577861 (= res!1077324 (validKeyInArray!0 k!761))))

(declare-fun b!1577862 () Bool)

(assert (=> b!1577862 (= e!880184 false)))

(declare-datatypes ((SeekEntryResult!13654 0))(
  ( (MissingZero!13654 (index!57014 (_ BitVec 32))) (Found!13654 (index!57015 (_ BitVec 32))) (Intermediate!13654 (undefined!14466 Bool) (index!57016 (_ BitVec 32)) (x!142181 (_ BitVec 32))) (Undefined!13654) (MissingVacant!13654 (index!57017 (_ BitVec 32))) )
))
(declare-fun lt!676098 () SeekEntryResult!13654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105531 (_ BitVec 32)) SeekEntryResult!13654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577862 (= lt!676098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136298 res!1077325) b!1577860))

(assert (= (and b!1577860 res!1077326) b!1577861))

(assert (= (and b!1577861 res!1077324) b!1577862))

(declare-fun m!1450697 () Bool)

(assert (=> start!136298 m!1450697))

(declare-fun m!1450699 () Bool)

(assert (=> start!136298 m!1450699))

(declare-fun m!1450701 () Bool)

(assert (=> b!1577861 m!1450701))

(declare-fun m!1450703 () Bool)

(assert (=> b!1577862 m!1450703))

(assert (=> b!1577862 m!1450703))

(declare-fun m!1450705 () Bool)

(assert (=> b!1577862 m!1450705))

(push 1)

(assert (not b!1577862))

(assert (not start!136298))

(assert (not b!1577861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

