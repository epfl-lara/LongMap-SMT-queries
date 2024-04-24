; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135244 () Bool)

(assert start!135244)

(declare-fun res!1074794 () Bool)

(declare-fun e!877933 () Bool)

(assert (=> start!135244 (=> (not res!1074794) (not e!877933))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135244 (= res!1074794 (validMask!0 mask!889))))

(assert (=> start!135244 e!877933))

(assert (=> start!135244 true))

(declare-datatypes ((array!105051 0))(
  ( (array!105052 (arr!50688 (Array (_ BitVec 32) (_ BitVec 64))) (size!51239 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105051)

(declare-fun array_inv!39643 (array!105051) Bool)

(assert (=> start!135244 (array_inv!39643 _keys!600)))

(declare-fun b!1574251 () Bool)

(declare-fun res!1074793 () Bool)

(assert (=> b!1574251 (=> (not res!1074793) (not e!877933))))

(assert (=> b!1574251 (= res!1074793 (= (size!51239 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574252 () Bool)

(declare-fun res!1074792 () Bool)

(assert (=> b!1574252 (=> (not res!1074792) (not e!877933))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574252 (= res!1074792 (validKeyInArray!0 k!754))))

(declare-fun b!1574253 () Bool)

(assert (=> b!1574253 (= e!877933 false)))

(declare-datatypes ((SeekEntryResult!13495 0))(
  ( (MissingZero!13495 (index!56378 (_ BitVec 32))) (Found!13495 (index!56379 (_ BitVec 32))) (Intermediate!13495 (undefined!14307 Bool) (index!56380 (_ BitVec 32)) (x!141350 (_ BitVec 32))) (Undefined!13495) (MissingVacant!13495 (index!56381 (_ BitVec 32))) )
))
(declare-fun lt!674658 () SeekEntryResult!13495)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105051 (_ BitVec 32)) SeekEntryResult!13495)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574253 (= lt!674658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135244 res!1074794) b!1574251))

(assert (= (and b!1574251 res!1074793) b!1574252))

(assert (= (and b!1574252 res!1074792) b!1574253))

(declare-fun m!1447949 () Bool)

(assert (=> start!135244 m!1447949))

(declare-fun m!1447951 () Bool)

(assert (=> start!135244 m!1447951))

(declare-fun m!1447953 () Bool)

(assert (=> b!1574252 m!1447953))

(declare-fun m!1447955 () Bool)

(assert (=> b!1574253 m!1447955))

(assert (=> b!1574253 m!1447955))

(declare-fun m!1447957 () Bool)

(assert (=> b!1574253 m!1447957))

(push 1)

(assert (not b!1574253))

(assert (not start!135244))

(assert (not b!1574252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

