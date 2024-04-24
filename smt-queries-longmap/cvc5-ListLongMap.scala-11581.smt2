; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135394 () Bool)

(assert start!135394)

(declare-fun res!1075152 () Bool)

(declare-fun e!878249 () Bool)

(assert (=> start!135394 (=> (not res!1075152) (not e!878249))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135394 (= res!1075152 (validMask!0 mask!889))))

(assert (=> start!135394 e!878249))

(assert (=> start!135394 true))

(declare-datatypes ((array!105120 0))(
  ( (array!105121 (arr!50718 (Array (_ BitVec 32) (_ BitVec 64))) (size!51269 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105120)

(declare-fun array_inv!39673 (array!105120) Bool)

(assert (=> start!135394 (array_inv!39673 _keys!600)))

(declare-fun b!1574764 () Bool)

(declare-fun res!1075154 () Bool)

(assert (=> b!1574764 (=> (not res!1075154) (not e!878249))))

(assert (=> b!1574764 (= res!1075154 (= (size!51269 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574765 () Bool)

(declare-fun res!1075153 () Bool)

(assert (=> b!1574765 (=> (not res!1075153) (not e!878249))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574765 (= res!1075153 (validKeyInArray!0 k!754))))

(declare-fun b!1574766 () Bool)

(assert (=> b!1574766 (= e!878249 false)))

(declare-datatypes ((SeekEntryResult!13525 0))(
  ( (MissingZero!13525 (index!56498 (_ BitVec 32))) (Found!13525 (index!56499 (_ BitVec 32))) (Intermediate!13525 (undefined!14337 Bool) (index!56500 (_ BitVec 32)) (x!141478 (_ BitVec 32))) (Undefined!13525) (MissingVacant!13525 (index!56501 (_ BitVec 32))) )
))
(declare-fun lt!674856 () SeekEntryResult!13525)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105120 (_ BitVec 32)) SeekEntryResult!13525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574766 (= lt!674856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135394 res!1075152) b!1574764))

(assert (= (and b!1574764 res!1075154) b!1574765))

(assert (= (and b!1574765 res!1075153) b!1574766))

(declare-fun m!1448345 () Bool)

(assert (=> start!135394 m!1448345))

(declare-fun m!1448347 () Bool)

(assert (=> start!135394 m!1448347))

(declare-fun m!1448349 () Bool)

(assert (=> b!1574765 m!1448349))

(declare-fun m!1448351 () Bool)

(assert (=> b!1574766 m!1448351))

(assert (=> b!1574766 m!1448351))

(declare-fun m!1448353 () Bool)

(assert (=> b!1574766 m!1448353))

(push 1)

(assert (not start!135394))

(assert (not b!1574766))

(assert (not b!1574765))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

