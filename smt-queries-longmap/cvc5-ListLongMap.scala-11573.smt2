; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135256 () Bool)

(assert start!135256)

(declare-fun res!1074846 () Bool)

(declare-fun e!877969 () Bool)

(assert (=> start!135256 (=> (not res!1074846) (not e!877969))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135256 (= res!1074846 (validMask!0 mask!889))))

(assert (=> start!135256 e!877969))

(assert (=> start!135256 true))

(declare-datatypes ((array!105063 0))(
  ( (array!105064 (arr!50694 (Array (_ BitVec 32) (_ BitVec 64))) (size!51245 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105063)

(declare-fun array_inv!39649 (array!105063) Bool)

(assert (=> start!135256 (array_inv!39649 _keys!600)))

(declare-fun b!1574305 () Bool)

(declare-fun res!1074847 () Bool)

(assert (=> b!1574305 (=> (not res!1074847) (not e!877969))))

(assert (=> b!1574305 (= res!1074847 (= (size!51245 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574306 () Bool)

(declare-fun res!1074848 () Bool)

(assert (=> b!1574306 (=> (not res!1074848) (not e!877969))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574306 (= res!1074848 (validKeyInArray!0 k!754))))

(declare-fun b!1574307 () Bool)

(assert (=> b!1574307 (= e!877969 false)))

(declare-datatypes ((SeekEntryResult!13501 0))(
  ( (MissingZero!13501 (index!56402 (_ BitVec 32))) (Found!13501 (index!56403 (_ BitVec 32))) (Intermediate!13501 (undefined!14313 Bool) (index!56404 (_ BitVec 32)) (x!141372 (_ BitVec 32))) (Undefined!13501) (MissingVacant!13501 (index!56405 (_ BitVec 32))) )
))
(declare-fun lt!674676 () SeekEntryResult!13501)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105063 (_ BitVec 32)) SeekEntryResult!13501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574307 (= lt!674676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135256 res!1074846) b!1574305))

(assert (= (and b!1574305 res!1074847) b!1574306))

(assert (= (and b!1574306 res!1074848) b!1574307))

(declare-fun m!1448015 () Bool)

(assert (=> start!135256 m!1448015))

(declare-fun m!1448017 () Bool)

(assert (=> start!135256 m!1448017))

(declare-fun m!1448019 () Bool)

(assert (=> b!1574306 m!1448019))

(declare-fun m!1448021 () Bool)

(assert (=> b!1574307 m!1448021))

(assert (=> b!1574307 m!1448021))

(declare-fun m!1448023 () Bool)

(assert (=> b!1574307 m!1448023))

(push 1)

(assert (not b!1574307))

(assert (not start!135256))

(assert (not b!1574306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

