; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135262 () Bool)

(assert start!135262)

(declare-fun res!1074874 () Bool)

(declare-fun e!877987 () Bool)

(assert (=> start!135262 (=> (not res!1074874) (not e!877987))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135262 (= res!1074874 (validMask!0 mask!889))))

(assert (=> start!135262 e!877987))

(assert (=> start!135262 true))

(declare-datatypes ((array!105069 0))(
  ( (array!105070 (arr!50697 (Array (_ BitVec 32) (_ BitVec 64))) (size!51248 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105069)

(declare-fun array_inv!39652 (array!105069) Bool)

(assert (=> start!135262 (array_inv!39652 _keys!600)))

(declare-fun b!1574332 () Bool)

(declare-fun res!1074873 () Bool)

(assert (=> b!1574332 (=> (not res!1074873) (not e!877987))))

(assert (=> b!1574332 (= res!1074873 (= (size!51248 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574333 () Bool)

(declare-fun res!1074875 () Bool)

(assert (=> b!1574333 (=> (not res!1074875) (not e!877987))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574333 (= res!1074875 (validKeyInArray!0 k!754))))

(declare-fun b!1574334 () Bool)

(assert (=> b!1574334 (= e!877987 false)))

(declare-datatypes ((SeekEntryResult!13504 0))(
  ( (MissingZero!13504 (index!56414 (_ BitVec 32))) (Found!13504 (index!56415 (_ BitVec 32))) (Intermediate!13504 (undefined!14316 Bool) (index!56416 (_ BitVec 32)) (x!141383 (_ BitVec 32))) (Undefined!13504) (MissingVacant!13504 (index!56417 (_ BitVec 32))) )
))
(declare-fun lt!674685 () SeekEntryResult!13504)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105069 (_ BitVec 32)) SeekEntryResult!13504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574334 (= lt!674685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135262 res!1074874) b!1574332))

(assert (= (and b!1574332 res!1074873) b!1574333))

(assert (= (and b!1574333 res!1074875) b!1574334))

(declare-fun m!1448045 () Bool)

(assert (=> start!135262 m!1448045))

(declare-fun m!1448047 () Bool)

(assert (=> start!135262 m!1448047))

(declare-fun m!1448049 () Bool)

(assert (=> b!1574333 m!1448049))

(declare-fun m!1448051 () Bool)

(assert (=> b!1574334 m!1448051))

(assert (=> b!1574334 m!1448051))

(declare-fun m!1448053 () Bool)

(assert (=> b!1574334 m!1448053))

(push 1)

(assert (not b!1574334))

(assert (not start!135262))

(assert (not b!1574333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

