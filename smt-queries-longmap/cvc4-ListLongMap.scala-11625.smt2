; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136056 () Bool)

(assert start!136056)

(declare-fun res!1076760 () Bool)

(declare-fun e!879683 () Bool)

(assert (=> start!136056 (=> (not res!1076760) (not e!879683))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136056 (= res!1076760 (validMask!0 mask!898))))

(assert (=> start!136056 e!879683))

(assert (=> start!136056 true))

(declare-datatypes ((array!105424 0))(
  ( (array!105425 (arr!50849 (Array (_ BitVec 32) (_ BitVec 64))) (size!51400 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105424)

(declare-fun array_inv!39804 (array!105424) Bool)

(assert (=> start!136056 (array_inv!39804 _keys!605)))

(declare-fun b!1577041 () Bool)

(declare-fun res!1076761 () Bool)

(assert (=> b!1577041 (=> (not res!1076761) (not e!879683))))

(assert (=> b!1577041 (= res!1076761 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51400 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577042 () Bool)

(declare-fun res!1076762 () Bool)

(assert (=> b!1577042 (=> (not res!1076762) (not e!879683))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577042 (= res!1076762 (validKeyInArray!0 k!761))))

(declare-fun b!1577043 () Bool)

(assert (=> b!1577043 (= e!879683 false)))

(declare-datatypes ((SeekEntryResult!13608 0))(
  ( (MissingZero!13608 (index!56830 (_ BitVec 32))) (Found!13608 (index!56831 (_ BitVec 32))) (Intermediate!13608 (undefined!14420 Bool) (index!56832 (_ BitVec 32)) (x!141985 (_ BitVec 32))) (Undefined!13608) (MissingVacant!13608 (index!56833 (_ BitVec 32))) )
))
(declare-fun lt!675780 () SeekEntryResult!13608)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105424 (_ BitVec 32)) SeekEntryResult!13608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577043 (= lt!675780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136056 res!1076760) b!1577041))

(assert (= (and b!1577041 res!1076761) b!1577042))

(assert (= (and b!1577042 res!1076762) b!1577043))

(declare-fun m!1450093 () Bool)

(assert (=> start!136056 m!1450093))

(declare-fun m!1450095 () Bool)

(assert (=> start!136056 m!1450095))

(declare-fun m!1450097 () Bool)

(assert (=> b!1577042 m!1450097))

(declare-fun m!1450099 () Bool)

(assert (=> b!1577043 m!1450099))

(assert (=> b!1577043 m!1450099))

(declare-fun m!1450101 () Bool)

(assert (=> b!1577043 m!1450101))

(push 1)

(assert (not b!1577043))

(assert (not start!136056))

(assert (not b!1577042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

