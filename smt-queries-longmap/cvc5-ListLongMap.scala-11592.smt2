; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135134 () Bool)

(assert start!135134)

(declare-fun b!1572852 () Bool)

(declare-fun res!1074664 () Bool)

(declare-fun e!877063 () Bool)

(assert (=> b!1572852 (=> (not res!1074664) (not e!877063))))

(declare-datatypes ((array!105069 0))(
  ( (array!105070 (arr!50695 (Array (_ BitVec 32) (_ BitVec 64))) (size!51245 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105069)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1572852 (= res!1074664 (= (size!51245 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun res!1074666 () Bool)

(assert (=> start!135134 (=> (not res!1074666) (not e!877063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135134 (= res!1074666 (validMask!0 mask!889))))

(assert (=> start!135134 e!877063))

(assert (=> start!135134 true))

(declare-fun array_inv!39422 (array!105069) Bool)

(assert (=> start!135134 (array_inv!39422 _keys!600)))

(declare-fun b!1572853 () Bool)

(declare-fun res!1074665 () Bool)

(assert (=> b!1572853 (=> (not res!1074665) (not e!877063))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572853 (= res!1074665 (validKeyInArray!0 k!754))))

(declare-fun b!1572855 () Bool)

(declare-fun e!877062 () Bool)

(assert (=> b!1572855 (= e!877062 false)))

(declare-datatypes ((SeekEntryResult!13608 0))(
  ( (MissingZero!13608 (index!56830 (_ BitVec 32))) (Found!13608 (index!56831 (_ BitVec 32))) (Intermediate!13608 (undefined!14420 Bool) (index!56832 (_ BitVec 32)) (x!141616 (_ BitVec 32))) (Undefined!13608) (MissingVacant!13608 (index!56833 (_ BitVec 32))) )
))
(declare-fun lt!674152 () SeekEntryResult!13608)

(declare-fun lt!674151 () SeekEntryResult!13608)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105069 (_ BitVec 32)) SeekEntryResult!13608)

(assert (=> b!1572855 (= lt!674152 (seekKeyOrZeroReturnVacant!0 (x!141616 lt!674151) (index!56832 lt!674151) (index!56832 lt!674151) k!754 _keys!600 mask!889))))

(declare-fun b!1572854 () Bool)

(assert (=> b!1572854 (= e!877063 e!877062)))

(declare-fun res!1074663 () Bool)

(assert (=> b!1572854 (=> (not res!1074663) (not e!877062))))

(assert (=> b!1572854 (= res!1074663 (and (not (undefined!14420 lt!674151)) (is-Intermediate!13608 lt!674151) (not (= (select (arr!50695 _keys!600) (index!56832 lt!674151)) k!754)) (not (= (select (arr!50695 _keys!600) (index!56832 lt!674151)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50695 _keys!600) (index!56832 lt!674151)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56832 lt!674151) #b00000000000000000000000000000000) (bvslt (index!56832 lt!674151) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105069 (_ BitVec 32)) SeekEntryResult!13608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572854 (= lt!674151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135134 res!1074666) b!1572852))

(assert (= (and b!1572852 res!1074664) b!1572853))

(assert (= (and b!1572853 res!1074665) b!1572854))

(assert (= (and b!1572854 res!1074663) b!1572855))

(declare-fun m!1446481 () Bool)

(assert (=> start!135134 m!1446481))

(declare-fun m!1446483 () Bool)

(assert (=> start!135134 m!1446483))

(declare-fun m!1446485 () Bool)

(assert (=> b!1572853 m!1446485))

(declare-fun m!1446487 () Bool)

(assert (=> b!1572855 m!1446487))

(declare-fun m!1446489 () Bool)

(assert (=> b!1572854 m!1446489))

(declare-fun m!1446491 () Bool)

(assert (=> b!1572854 m!1446491))

(assert (=> b!1572854 m!1446491))

(declare-fun m!1446493 () Bool)

(assert (=> b!1572854 m!1446493))

(push 1)

(assert (not b!1572854))

(assert (not start!135134))

(assert (not b!1572855))

(assert (not b!1572853))

(check-sat)

