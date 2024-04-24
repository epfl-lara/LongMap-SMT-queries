; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135490 () Bool)

(assert start!135490)

(declare-fun res!1075376 () Bool)

(declare-fun e!878446 () Bool)

(assert (=> start!135490 (=> (not res!1075376) (not e!878446))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135490 (= res!1075376 (validMask!0 mask!889))))

(assert (=> start!135490 e!878446))

(assert (=> start!135490 true))

(declare-datatypes ((array!105162 0))(
  ( (array!105163 (arr!50736 (Array (_ BitVec 32) (_ BitVec 64))) (size!51287 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105162)

(declare-fun array_inv!39691 (array!105162) Bool)

(assert (=> start!135490 (array_inv!39691 _keys!600)))

(declare-fun b!1575088 () Bool)

(declare-fun res!1075375 () Bool)

(assert (=> b!1575088 (=> (not res!1075375) (not e!878446))))

(assert (=> b!1575088 (= res!1075375 (= (size!51287 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575089 () Bool)

(declare-fun res!1075374 () Bool)

(assert (=> b!1575089 (=> (not res!1075374) (not e!878446))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575089 (= res!1075374 (validKeyInArray!0 k!754))))

(declare-fun b!1575090 () Bool)

(assert (=> b!1575090 (= e!878446 false)))

(declare-datatypes ((SeekEntryResult!13543 0))(
  ( (MissingZero!13543 (index!56570 (_ BitVec 32))) (Found!13543 (index!56571 (_ BitVec 32))) (Intermediate!13543 (undefined!14355 Bool) (index!56572 (_ BitVec 32)) (x!141556 (_ BitVec 32))) (Undefined!13543) (MissingVacant!13543 (index!56573 (_ BitVec 32))) )
))
(declare-fun lt!674982 () SeekEntryResult!13543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105162 (_ BitVec 32)) SeekEntryResult!13543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575090 (= lt!674982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135490 res!1075376) b!1575088))

(assert (= (and b!1575088 res!1075375) b!1575089))

(assert (= (and b!1575089 res!1075374) b!1575090))

(declare-fun m!1448579 () Bool)

(assert (=> start!135490 m!1448579))

(declare-fun m!1448581 () Bool)

(assert (=> start!135490 m!1448581))

(declare-fun m!1448583 () Bool)

(assert (=> b!1575089 m!1448583))

(declare-fun m!1448585 () Bool)

(assert (=> b!1575090 m!1448585))

(assert (=> b!1575090 m!1448585))

(declare-fun m!1448587 () Bool)

(assert (=> b!1575090 m!1448587))

(push 1)

(assert (not b!1575089))

(assert (not start!135490))

(assert (not b!1575090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

