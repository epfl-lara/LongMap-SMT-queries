; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134848 () Bool)

(assert start!134848)

(declare-fun res!1074006 () Bool)

(declare-fun e!876472 () Bool)

(assert (=> start!134848 (=> (not res!1074006) (not e!876472))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134848 (= res!1074006 (validMask!0 mask!889))))

(assert (=> start!134848 e!876472))

(assert (=> start!134848 true))

(declare-datatypes ((array!104945 0))(
  ( (array!104946 (arr!50642 (Array (_ BitVec 32) (_ BitVec 64))) (size!51192 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104945)

(declare-fun array_inv!39369 (array!104945) Bool)

(assert (=> start!134848 (array_inv!39369 _keys!600)))

(declare-fun b!1571887 () Bool)

(declare-fun res!1074004 () Bool)

(assert (=> b!1571887 (=> (not res!1074004) (not e!876472))))

(assert (=> b!1571887 (= res!1074004 (= (size!51192 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571888 () Bool)

(declare-fun res!1074005 () Bool)

(assert (=> b!1571888 (=> (not res!1074005) (not e!876472))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571888 (= res!1074005 (validKeyInArray!0 k0!754))))

(declare-fun b!1571889 () Bool)

(assert (=> b!1571889 (= e!876472 false)))

(declare-datatypes ((SeekEntryResult!13555 0))(
  ( (MissingZero!13555 (index!56618 (_ BitVec 32))) (Found!13555 (index!56619 (_ BitVec 32))) (Intermediate!13555 (undefined!14367 Bool) (index!56620 (_ BitVec 32)) (x!141383 (_ BitVec 32))) (Undefined!13555) (MissingVacant!13555 (index!56621 (_ BitVec 32))) )
))
(declare-fun lt!673774 () SeekEntryResult!13555)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104945 (_ BitVec 32)) SeekEntryResult!13555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571889 (= lt!673774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134848 res!1074006) b!1571887))

(assert (= (and b!1571887 res!1074004) b!1571888))

(assert (= (and b!1571888 res!1074005) b!1571889))

(declare-fun m!1445777 () Bool)

(assert (=> start!134848 m!1445777))

(declare-fun m!1445779 () Bool)

(assert (=> start!134848 m!1445779))

(declare-fun m!1445781 () Bool)

(assert (=> b!1571888 m!1445781))

(declare-fun m!1445783 () Bool)

(assert (=> b!1571889 m!1445783))

(assert (=> b!1571889 m!1445783))

(declare-fun m!1445785 () Bool)

(assert (=> b!1571889 m!1445785))

(check-sat (not b!1571888) (not start!134848) (not b!1571889))
(check-sat)
