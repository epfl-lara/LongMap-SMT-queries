; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135240 () Bool)

(assert start!135240)

(declare-fun b!1573328 () Bool)

(declare-fun e!877359 () Bool)

(declare-fun e!877361 () Bool)

(assert (=> b!1573328 (= e!877359 e!877361)))

(declare-fun res!1074929 () Bool)

(assert (=> b!1573328 (=> (not res!1074929) (not e!877361))))

(declare-datatypes ((SeekEntryResult!13625 0))(
  ( (MissingZero!13625 (index!56898 (_ BitVec 32))) (Found!13625 (index!56899 (_ BitVec 32))) (Intermediate!13625 (undefined!14437 Bool) (index!56900 (_ BitVec 32)) (x!141691 (_ BitVec 32))) (Undefined!13625) (MissingVacant!13625 (index!56901 (_ BitVec 32))) )
))
(declare-fun lt!674362 () SeekEntryResult!13625)

(declare-fun k!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105109 0))(
  ( (array!105110 (arr!50712 (Array (_ BitVec 32) (_ BitVec 64))) (size!51262 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105109)

(assert (=> b!1573328 (= res!1074929 (and (not (undefined!14437 lt!674362)) (is-Intermediate!13625 lt!674362) (not (= (select (arr!50712 _keys!600) (index!56900 lt!674362)) k!754)) (not (= (select (arr!50712 _keys!600) (index!56900 lt!674362)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50712 _keys!600) (index!56900 lt!674362)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56900 lt!674362) #b00000000000000000000000000000000) (bvslt (index!56900 lt!674362) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105109 (_ BitVec 32)) SeekEntryResult!13625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573328 (= lt!674362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun res!1074928 () Bool)

(assert (=> start!135240 (=> (not res!1074928) (not e!877359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135240 (= res!1074928 (validMask!0 mask!889))))

(assert (=> start!135240 e!877359))

(assert (=> start!135240 true))

(declare-fun array_inv!39439 (array!105109) Bool)

(assert (=> start!135240 (array_inv!39439 _keys!600)))

(declare-fun b!1573326 () Bool)

(declare-fun res!1074927 () Bool)

(assert (=> b!1573326 (=> (not res!1074927) (not e!877359))))

(assert (=> b!1573326 (= res!1074927 (= (size!51262 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573329 () Bool)

(declare-fun lt!674361 () SeekEntryResult!13625)

(assert (=> b!1573329 (= e!877361 (and (not (is-MissingVacant!13625 lt!674361)) (is-Found!13625 lt!674361) (not (= (select (arr!50712 _keys!600) (index!56899 lt!674361)) k!754))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105109 (_ BitVec 32)) SeekEntryResult!13625)

(assert (=> b!1573329 (= lt!674361 (seekKeyOrZeroReturnVacant!0 (x!141691 lt!674362) (index!56900 lt!674362) (index!56900 lt!674362) k!754 _keys!600 mask!889))))

(declare-fun b!1573327 () Bool)

(declare-fun res!1074930 () Bool)

(assert (=> b!1573327 (=> (not res!1074930) (not e!877359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573327 (= res!1074930 (validKeyInArray!0 k!754))))

(assert (= (and start!135240 res!1074928) b!1573326))

(assert (= (and b!1573326 res!1074927) b!1573327))

(assert (= (and b!1573327 res!1074930) b!1573328))

(assert (= (and b!1573328 res!1074929) b!1573329))

(declare-fun m!1446819 () Bool)

(assert (=> b!1573328 m!1446819))

(declare-fun m!1446821 () Bool)

(assert (=> b!1573328 m!1446821))

(assert (=> b!1573328 m!1446821))

(declare-fun m!1446823 () Bool)

(assert (=> b!1573328 m!1446823))

(declare-fun m!1446825 () Bool)

(assert (=> start!135240 m!1446825))

(declare-fun m!1446827 () Bool)

(assert (=> start!135240 m!1446827))

(declare-fun m!1446829 () Bool)

(assert (=> b!1573329 m!1446829))

(declare-fun m!1446831 () Bool)

(assert (=> b!1573329 m!1446831))

(declare-fun m!1446833 () Bool)

(assert (=> b!1573327 m!1446833))

(push 1)

(assert (not b!1573329))

(assert (not b!1573328))

(assert (not start!135240))

(assert (not b!1573327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

