; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135150 () Bool)

(assert start!135150)

(declare-fun b!1572951 () Bool)

(declare-fun e!877135 () Bool)

(assert (=> b!1572951 (= e!877135 false)))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105085 0))(
  ( (array!105086 (arr!50703 (Array (_ BitVec 32) (_ BitVec 64))) (size!51253 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105085)

(declare-datatypes ((SeekEntryResult!13616 0))(
  ( (MissingZero!13616 (index!56862 (_ BitVec 32))) (Found!13616 (index!56863 (_ BitVec 32))) (Intermediate!13616 (undefined!14428 Bool) (index!56864 (_ BitVec 32)) (x!141640 (_ BitVec 32))) (Undefined!13616) (MissingVacant!13616 (index!56865 (_ BitVec 32))) )
))
(declare-fun lt!674199 () SeekEntryResult!13616)

(declare-fun lt!674200 () SeekEntryResult!13616)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105085 (_ BitVec 32)) SeekEntryResult!13616)

(assert (=> b!1572951 (= lt!674200 (seekKeyOrZeroReturnVacant!0 (x!141640 lt!674199) (index!56864 lt!674199) (index!56864 lt!674199) k!754 _keys!600 mask!889))))

(declare-fun res!1074761 () Bool)

(declare-fun e!877136 () Bool)

(assert (=> start!135150 (=> (not res!1074761) (not e!877136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135150 (= res!1074761 (validMask!0 mask!889))))

(assert (=> start!135150 e!877136))

(assert (=> start!135150 true))

(declare-fun array_inv!39430 (array!105085) Bool)

(assert (=> start!135150 (array_inv!39430 _keys!600)))

(declare-fun b!1572948 () Bool)

(declare-fun res!1074760 () Bool)

(assert (=> b!1572948 (=> (not res!1074760) (not e!877136))))

(assert (=> b!1572948 (= res!1074760 (= (size!51253 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572950 () Bool)

(assert (=> b!1572950 (= e!877136 e!877135)))

(declare-fun res!1074759 () Bool)

(assert (=> b!1572950 (=> (not res!1074759) (not e!877135))))

(assert (=> b!1572950 (= res!1074759 (and (not (undefined!14428 lt!674199)) (is-Intermediate!13616 lt!674199) (not (= (select (arr!50703 _keys!600) (index!56864 lt!674199)) k!754)) (not (= (select (arr!50703 _keys!600) (index!56864 lt!674199)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50703 _keys!600) (index!56864 lt!674199)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56864 lt!674199) #b00000000000000000000000000000000) (bvslt (index!56864 lt!674199) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105085 (_ BitVec 32)) SeekEntryResult!13616)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572950 (= lt!674199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572949 () Bool)

(declare-fun res!1074762 () Bool)

(assert (=> b!1572949 (=> (not res!1074762) (not e!877136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572949 (= res!1074762 (validKeyInArray!0 k!754))))

(assert (= (and start!135150 res!1074761) b!1572948))

(assert (= (and b!1572948 res!1074760) b!1572949))

(assert (= (and b!1572949 res!1074762) b!1572950))

(assert (= (and b!1572950 res!1074759) b!1572951))

(declare-fun m!1446593 () Bool)

(assert (=> b!1572951 m!1446593))

(declare-fun m!1446595 () Bool)

(assert (=> start!135150 m!1446595))

(declare-fun m!1446597 () Bool)

(assert (=> start!135150 m!1446597))

(declare-fun m!1446599 () Bool)

(assert (=> b!1572950 m!1446599))

(declare-fun m!1446601 () Bool)

(assert (=> b!1572950 m!1446601))

(assert (=> b!1572950 m!1446601))

(declare-fun m!1446603 () Bool)

(assert (=> b!1572950 m!1446603))

(declare-fun m!1446605 () Bool)

(assert (=> b!1572949 m!1446605))

(push 1)

