; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135596 () Bool)

(assert start!135596)

(declare-fun res!1075781 () Bool)

(declare-fun e!877982 () Bool)

(assert (=> start!135596 (=> (not res!1075781) (not e!877982))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135596 (= res!1075781 (validMask!0 mask!898))))

(assert (=> start!135596 e!877982))

(assert (=> start!135596 true))

(declare-datatypes ((array!105231 0))(
  ( (array!105232 (arr!50761 (Array (_ BitVec 32) (_ BitVec 64))) (size!51313 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105231)

(declare-fun array_inv!39697 (array!105231) Bool)

(assert (=> start!135596 (array_inv!39697 _keys!605)))

(declare-fun b!1574301 () Bool)

(declare-fun res!1075782 () Bool)

(assert (=> b!1574301 (=> (not res!1075782) (not e!877982))))

(assert (=> b!1574301 (= res!1075782 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51313 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574302 () Bool)

(declare-fun res!1075780 () Bool)

(assert (=> b!1574302 (=> (not res!1075780) (not e!877982))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574302 (= res!1075780 (validKeyInArray!0 k!761))))

(declare-fun b!1574303 () Bool)

(assert (=> b!1574303 (= e!877982 false)))

(declare-datatypes ((SeekEntryResult!13661 0))(
  ( (MissingZero!13661 (index!57042 (_ BitVec 32))) (Found!13661 (index!57043 (_ BitVec 32))) (Intermediate!13661 (undefined!14473 Bool) (index!57044 (_ BitVec 32)) (x!141982 (_ BitVec 32))) (Undefined!13661) (MissingVacant!13661 (index!57045 (_ BitVec 32))) )
))
(declare-fun lt!674589 () SeekEntryResult!13661)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105231 (_ BitVec 32)) SeekEntryResult!13661)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574303 (= lt!674589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135596 res!1075781) b!1574301))

(assert (= (and b!1574301 res!1075782) b!1574302))

(assert (= (and b!1574302 res!1075780) b!1574303))

(declare-fun m!1446953 () Bool)

(assert (=> start!135596 m!1446953))

(declare-fun m!1446955 () Bool)

(assert (=> start!135596 m!1446955))

(declare-fun m!1446957 () Bool)

(assert (=> b!1574302 m!1446957))

(declare-fun m!1446959 () Bool)

(assert (=> b!1574303 m!1446959))

(assert (=> b!1574303 m!1446959))

(declare-fun m!1446961 () Bool)

(assert (=> b!1574303 m!1446961))

(push 1)

(assert (not b!1574302))

(assert (not start!135596))

(assert (not b!1574303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

