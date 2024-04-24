; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136310 () Bool)

(assert start!136310)

(declare-fun res!1077380 () Bool)

(declare-fun e!880220 () Bool)

(assert (=> start!136310 (=> (not res!1077380) (not e!880220))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136310 (= res!1077380 (validMask!0 mask!898))))

(assert (=> start!136310 e!880220))

(assert (=> start!136310 true))

(declare-datatypes ((array!105543 0))(
  ( (array!105544 (arr!50901 (Array (_ BitVec 32) (_ BitVec 64))) (size!51452 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105543)

(declare-fun array_inv!39856 (array!105543) Bool)

(assert (=> start!136310 (array_inv!39856 _keys!605)))

(declare-fun b!1577914 () Bool)

(declare-fun res!1077378 () Bool)

(assert (=> b!1577914 (=> (not res!1077378) (not e!880220))))

(assert (=> b!1577914 (= res!1077378 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51452 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577915 () Bool)

(declare-fun res!1077379 () Bool)

(assert (=> b!1577915 (=> (not res!1077379) (not e!880220))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577915 (= res!1077379 (validKeyInArray!0 k!761))))

(declare-fun b!1577916 () Bool)

(assert (=> b!1577916 (= e!880220 false)))

(declare-datatypes ((SeekEntryResult!13660 0))(
  ( (MissingZero!13660 (index!57038 (_ BitVec 32))) (Found!13660 (index!57039 (_ BitVec 32))) (Intermediate!13660 (undefined!14472 Bool) (index!57040 (_ BitVec 32)) (x!142203 (_ BitVec 32))) (Undefined!13660) (MissingVacant!13660 (index!57041 (_ BitVec 32))) )
))
(declare-fun lt!676116 () SeekEntryResult!13660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105543 (_ BitVec 32)) SeekEntryResult!13660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577916 (= lt!676116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136310 res!1077380) b!1577914))

(assert (= (and b!1577914 res!1077378) b!1577915))

(assert (= (and b!1577915 res!1077379) b!1577916))

(declare-fun m!1450757 () Bool)

(assert (=> start!136310 m!1450757))

(declare-fun m!1450759 () Bool)

(assert (=> start!136310 m!1450759))

(declare-fun m!1450761 () Bool)

(assert (=> b!1577915 m!1450761))

(declare-fun m!1450763 () Bool)

(assert (=> b!1577916 m!1450763))

(assert (=> b!1577916 m!1450763))

(declare-fun m!1450765 () Bool)

(assert (=> b!1577916 m!1450765))

(push 1)

(assert (not b!1577915))

(assert (not b!1577916))

(assert (not start!136310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

