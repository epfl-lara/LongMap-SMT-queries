; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135602 () Bool)

(assert start!135602)

(declare-fun res!1075809 () Bool)

(declare-fun e!878000 () Bool)

(assert (=> start!135602 (=> (not res!1075809) (not e!878000))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135602 (= res!1075809 (validMask!0 mask!898))))

(assert (=> start!135602 e!878000))

(assert (=> start!135602 true))

(declare-datatypes ((array!105237 0))(
  ( (array!105238 (arr!50764 (Array (_ BitVec 32) (_ BitVec 64))) (size!51316 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105237)

(declare-fun array_inv!39700 (array!105237) Bool)

(assert (=> start!135602 (array_inv!39700 _keys!605)))

(declare-fun b!1574328 () Bool)

(declare-fun res!1075807 () Bool)

(assert (=> b!1574328 (=> (not res!1075807) (not e!878000))))

(assert (=> b!1574328 (= res!1075807 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51316 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574329 () Bool)

(declare-fun res!1075808 () Bool)

(assert (=> b!1574329 (=> (not res!1075808) (not e!878000))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574329 (= res!1075808 (validKeyInArray!0 k!761))))

(declare-fun b!1574330 () Bool)

(assert (=> b!1574330 (= e!878000 false)))

(declare-datatypes ((SeekEntryResult!13664 0))(
  ( (MissingZero!13664 (index!57054 (_ BitVec 32))) (Found!13664 (index!57055 (_ BitVec 32))) (Intermediate!13664 (undefined!14476 Bool) (index!57056 (_ BitVec 32)) (x!141993 (_ BitVec 32))) (Undefined!13664) (MissingVacant!13664 (index!57057 (_ BitVec 32))) )
))
(declare-fun lt!674598 () SeekEntryResult!13664)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105237 (_ BitVec 32)) SeekEntryResult!13664)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574330 (= lt!674598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135602 res!1075809) b!1574328))

(assert (= (and b!1574328 res!1075807) b!1574329))

(assert (= (and b!1574329 res!1075808) b!1574330))

(declare-fun m!1446983 () Bool)

(assert (=> start!135602 m!1446983))

(declare-fun m!1446985 () Bool)

(assert (=> start!135602 m!1446985))

(declare-fun m!1446987 () Bool)

(assert (=> b!1574329 m!1446987))

(declare-fun m!1446989 () Bool)

(assert (=> b!1574330 m!1446989))

(assert (=> b!1574330 m!1446989))

(declare-fun m!1446991 () Bool)

(assert (=> b!1574330 m!1446991))

(push 1)

(assert (not b!1574330))

(assert (not start!135602))

(assert (not b!1574329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

