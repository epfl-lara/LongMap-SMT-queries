; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136358 () Bool)

(assert start!136358)

(declare-fun res!1077491 () Bool)

(declare-fun e!880318 () Bool)

(assert (=> start!136358 (=> (not res!1077491) (not e!880318))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136358 (= res!1077491 (validMask!0 mask!898))))

(assert (=> start!136358 e!880318))

(assert (=> start!136358 true))

(declare-datatypes ((array!105564 0))(
  ( (array!105565 (arr!50910 (Array (_ BitVec 32) (_ BitVec 64))) (size!51461 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105564)

(declare-fun array_inv!39865 (array!105564) Bool)

(assert (=> start!136358 (array_inv!39865 _keys!605)))

(declare-fun b!1578076 () Bool)

(declare-fun res!1077490 () Bool)

(assert (=> b!1578076 (=> (not res!1077490) (not e!880318))))

(assert (=> b!1578076 (= res!1077490 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51461 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578077 () Bool)

(declare-fun res!1077489 () Bool)

(assert (=> b!1578077 (=> (not res!1077489) (not e!880318))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578077 (= res!1077489 (validKeyInArray!0 k!761))))

(declare-fun b!1578078 () Bool)

(assert (=> b!1578078 (= e!880318 false)))

(declare-datatypes ((SeekEntryResult!13669 0))(
  ( (MissingZero!13669 (index!57074 (_ BitVec 32))) (Found!13669 (index!57075 (_ BitVec 32))) (Intermediate!13669 (undefined!14481 Bool) (index!57076 (_ BitVec 32)) (x!142242 (_ BitVec 32))) (Undefined!13669) (MissingVacant!13669 (index!57077 (_ BitVec 32))) )
))
(declare-fun lt!676179 () SeekEntryResult!13669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105564 (_ BitVec 32)) SeekEntryResult!13669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578078 (= lt!676179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136358 res!1077491) b!1578076))

(assert (= (and b!1578076 res!1077490) b!1578077))

(assert (= (and b!1578077 res!1077489) b!1578078))

(declare-fun m!1450877 () Bool)

(assert (=> start!136358 m!1450877))

(declare-fun m!1450879 () Bool)

(assert (=> start!136358 m!1450879))

(declare-fun m!1450881 () Bool)

(assert (=> b!1578077 m!1450881))

(declare-fun m!1450883 () Bool)

(assert (=> b!1578078 m!1450883))

(assert (=> b!1578078 m!1450883))

(declare-fun m!1450885 () Bool)

(assert (=> b!1578078 m!1450885))

(push 1)

(assert (not b!1578077))

(assert (not b!1578078))

(assert (not start!136358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

