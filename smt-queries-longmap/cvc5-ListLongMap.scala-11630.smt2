; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136118 () Bool)

(assert start!136118)

(declare-fun res!1076934 () Bool)

(declare-fun e!879823 () Bool)

(assert (=> start!136118 (=> (not res!1076934) (not e!879823))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136118 (= res!1076934 (validMask!0 mask!898))))

(assert (=> start!136118 e!879823))

(assert (=> start!136118 true))

(declare-datatypes ((array!105459 0))(
  ( (array!105460 (arr!50865 (Array (_ BitVec 32) (_ BitVec 64))) (size!51416 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105459)

(declare-fun array_inv!39820 (array!105459) Bool)

(assert (=> start!136118 (array_inv!39820 _keys!605)))

(declare-fun b!1577266 () Bool)

(declare-fun res!1076935 () Bool)

(assert (=> b!1577266 (=> (not res!1076935) (not e!879823))))

(assert (=> b!1577266 (= res!1076935 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51416 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577267 () Bool)

(declare-fun res!1076936 () Bool)

(assert (=> b!1577267 (=> (not res!1076936) (not e!879823))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577267 (= res!1076936 (validKeyInArray!0 k!761))))

(declare-fun b!1577268 () Bool)

(assert (=> b!1577268 (= e!879823 false)))

(declare-datatypes ((SeekEntryResult!13624 0))(
  ( (MissingZero!13624 (index!56894 (_ BitVec 32))) (Found!13624 (index!56895 (_ BitVec 32))) (Intermediate!13624 (undefined!14436 Bool) (index!56896 (_ BitVec 32)) (x!142047 (_ BitVec 32))) (Undefined!13624) (MissingVacant!13624 (index!56897 (_ BitVec 32))) )
))
(declare-fun lt!675864 () SeekEntryResult!13624)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105459 (_ BitVec 32)) SeekEntryResult!13624)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577268 (= lt!675864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136118 res!1076934) b!1577266))

(assert (= (and b!1577266 res!1076935) b!1577267))

(assert (= (and b!1577267 res!1076936) b!1577268))

(declare-fun m!1450283 () Bool)

(assert (=> start!136118 m!1450283))

(declare-fun m!1450285 () Bool)

(assert (=> start!136118 m!1450285))

(declare-fun m!1450287 () Bool)

(assert (=> b!1577267 m!1450287))

(declare-fun m!1450289 () Bool)

(assert (=> b!1577268 m!1450289))

(assert (=> b!1577268 m!1450289))

(declare-fun m!1450291 () Bool)

(assert (=> b!1577268 m!1450291))

(push 1)

(assert (not b!1577268))

(assert (not start!136118))

(assert (not b!1577267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

