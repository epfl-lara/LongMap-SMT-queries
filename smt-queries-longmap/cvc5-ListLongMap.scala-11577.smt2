; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135310 () Bool)

(assert start!135310)

(declare-fun res!1074985 () Bool)

(declare-fun e!878087 () Bool)

(assert (=> start!135310 (=> (not res!1074985) (not e!878087))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135310 (= res!1074985 (validMask!0 mask!889))))

(assert (=> start!135310 e!878087))

(assert (=> start!135310 true))

(declare-datatypes ((array!105090 0))(
  ( (array!105091 (arr!50706 (Array (_ BitVec 32) (_ BitVec 64))) (size!51257 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105090)

(declare-fun array_inv!39661 (array!105090) Bool)

(assert (=> start!135310 (array_inv!39661 _keys!600)))

(declare-fun b!1574494 () Bool)

(declare-fun res!1074986 () Bool)

(assert (=> b!1574494 (=> (not res!1074986) (not e!878087))))

(assert (=> b!1574494 (= res!1074986 (= (size!51257 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574495 () Bool)

(declare-fun res!1074984 () Bool)

(assert (=> b!1574495 (=> (not res!1074984) (not e!878087))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574495 (= res!1074984 (validKeyInArray!0 k!754))))

(declare-fun b!1574496 () Bool)

(assert (=> b!1574496 (= e!878087 false)))

(declare-datatypes ((SeekEntryResult!13513 0))(
  ( (MissingZero!13513 (index!56450 (_ BitVec 32))) (Found!13513 (index!56451 (_ BitVec 32))) (Intermediate!13513 (undefined!14325 Bool) (index!56452 (_ BitVec 32)) (x!141422 (_ BitVec 32))) (Undefined!13513) (MissingVacant!13513 (index!56453 (_ BitVec 32))) )
))
(declare-fun lt!674748 () SeekEntryResult!13513)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105090 (_ BitVec 32)) SeekEntryResult!13513)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574496 (= lt!674748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135310 res!1074985) b!1574494))

(assert (= (and b!1574494 res!1074986) b!1574495))

(assert (= (and b!1574495 res!1074984) b!1574496))

(declare-fun m!1448165 () Bool)

(assert (=> start!135310 m!1448165))

(declare-fun m!1448167 () Bool)

(assert (=> start!135310 m!1448167))

(declare-fun m!1448169 () Bool)

(assert (=> b!1574495 m!1448169))

(declare-fun m!1448171 () Bool)

(assert (=> b!1574496 m!1448171))

(assert (=> b!1574496 m!1448171))

(declare-fun m!1448173 () Bool)

(assert (=> b!1574496 m!1448173))

(push 1)

(assert (not b!1574496))

(assert (not b!1574495))

(assert (not start!135310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

