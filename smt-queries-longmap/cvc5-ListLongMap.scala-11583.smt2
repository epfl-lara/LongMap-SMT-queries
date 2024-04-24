; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135406 () Bool)

(assert start!135406)

(declare-fun res!1075208 () Bool)

(declare-fun e!878285 () Bool)

(assert (=> start!135406 (=> (not res!1075208) (not e!878285))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135406 (= res!1075208 (validMask!0 mask!889))))

(assert (=> start!135406 e!878285))

(assert (=> start!135406 true))

(declare-datatypes ((array!105132 0))(
  ( (array!105133 (arr!50724 (Array (_ BitVec 32) (_ BitVec 64))) (size!51275 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105132)

(declare-fun array_inv!39679 (array!105132) Bool)

(assert (=> start!135406 (array_inv!39679 _keys!600)))

(declare-fun b!1574818 () Bool)

(declare-fun res!1075206 () Bool)

(assert (=> b!1574818 (=> (not res!1075206) (not e!878285))))

(assert (=> b!1574818 (= res!1075206 (= (size!51275 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574819 () Bool)

(declare-fun res!1075207 () Bool)

(assert (=> b!1574819 (=> (not res!1075207) (not e!878285))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574819 (= res!1075207 (validKeyInArray!0 k!754))))

(declare-fun b!1574820 () Bool)

(assert (=> b!1574820 (= e!878285 false)))

(declare-datatypes ((SeekEntryResult!13531 0))(
  ( (MissingZero!13531 (index!56522 (_ BitVec 32))) (Found!13531 (index!56523 (_ BitVec 32))) (Intermediate!13531 (undefined!14343 Bool) (index!56524 (_ BitVec 32)) (x!141500 (_ BitVec 32))) (Undefined!13531) (MissingVacant!13531 (index!56525 (_ BitVec 32))) )
))
(declare-fun lt!674874 () SeekEntryResult!13531)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105132 (_ BitVec 32)) SeekEntryResult!13531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574820 (= lt!674874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135406 res!1075208) b!1574818))

(assert (= (and b!1574818 res!1075206) b!1574819))

(assert (= (and b!1574819 res!1075207) b!1574820))

(declare-fun m!1448405 () Bool)

(assert (=> start!135406 m!1448405))

(declare-fun m!1448407 () Bool)

(assert (=> start!135406 m!1448407))

(declare-fun m!1448409 () Bool)

(assert (=> b!1574819 m!1448409))

(declare-fun m!1448411 () Bool)

(assert (=> b!1574820 m!1448411))

(assert (=> b!1574820 m!1448411))

(declare-fun m!1448413 () Bool)

(assert (=> b!1574820 m!1448413))

(push 1)

(assert (not b!1574820))

(assert (not start!135406))

(assert (not b!1574819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

