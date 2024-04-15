; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134798 () Bool)

(assert start!134798)

(declare-fun res!1073877 () Bool)

(declare-fun e!876274 () Bool)

(assert (=> start!134798 (=> (not res!1073877) (not e!876274))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134798 (= res!1073877 (validMask!0 mask!889))))

(assert (=> start!134798 e!876274))

(assert (=> start!134798 true))

(declare-datatypes ((array!104873 0))(
  ( (array!104874 (arr!50607 (Array (_ BitVec 32) (_ BitVec 64))) (size!51159 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104873)

(declare-fun array_inv!39543 (array!104873) Bool)

(assert (=> start!134798 (array_inv!39543 _keys!600)))

(declare-fun b!1571574 () Bool)

(declare-fun res!1073875 () Bool)

(assert (=> b!1571574 (=> (not res!1073875) (not e!876274))))

(assert (=> b!1571574 (= res!1073875 (= (size!51159 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571575 () Bool)

(declare-fun res!1073876 () Bool)

(assert (=> b!1571575 (=> (not res!1073876) (not e!876274))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571575 (= res!1073876 (validKeyInArray!0 k!754))))

(declare-fun b!1571576 () Bool)

(assert (=> b!1571576 (= e!876274 false)))

(declare-datatypes ((SeekEntryResult!13555 0))(
  ( (MissingZero!13555 (index!56618 (_ BitVec 32))) (Found!13555 (index!56619 (_ BitVec 32))) (Intermediate!13555 (undefined!14367 Bool) (index!56620 (_ BitVec 32)) (x!141378 (_ BitVec 32))) (Undefined!13555) (MissingVacant!13555 (index!56621 (_ BitVec 32))) )
))
(declare-fun lt!673488 () SeekEntryResult!13555)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104873 (_ BitVec 32)) SeekEntryResult!13555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571576 (= lt!673488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134798 res!1073877) b!1571574))

(assert (= (and b!1571574 res!1073875) b!1571575))

(assert (= (and b!1571575 res!1073876) b!1571576))

(declare-fun m!1444885 () Bool)

(assert (=> start!134798 m!1444885))

(declare-fun m!1444887 () Bool)

(assert (=> start!134798 m!1444887))

(declare-fun m!1444889 () Bool)

(assert (=> b!1571575 m!1444889))

(declare-fun m!1444891 () Bool)

(assert (=> b!1571576 m!1444891))

(assert (=> b!1571576 m!1444891))

(declare-fun m!1444893 () Bool)

(assert (=> b!1571576 m!1444893))

(push 1)

(assert (not b!1571576))

(assert (not start!134798))

(assert (not b!1571575))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

