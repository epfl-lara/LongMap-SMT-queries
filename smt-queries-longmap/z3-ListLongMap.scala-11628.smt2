; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136102 () Bool)

(assert start!136102)

(declare-fun res!1076862 () Bool)

(declare-fun e!879775 () Bool)

(assert (=> start!136102 (=> (not res!1076862) (not e!879775))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136102 (= res!1076862 (validMask!0 mask!898))))

(assert (=> start!136102 e!879775))

(assert (=> start!136102 true))

(declare-datatypes ((array!105443 0))(
  ( (array!105444 (arr!50857 (Array (_ BitVec 32) (_ BitVec 64))) (size!51408 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105443)

(declare-fun array_inv!39812 (array!105443) Bool)

(assert (=> start!136102 (array_inv!39812 _keys!605)))

(declare-fun b!1577194 () Bool)

(declare-fun res!1076863 () Bool)

(assert (=> b!1577194 (=> (not res!1076863) (not e!879775))))

(assert (=> b!1577194 (= res!1076863 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51408 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577195 () Bool)

(declare-fun res!1076864 () Bool)

(assert (=> b!1577195 (=> (not res!1076864) (not e!879775))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577195 (= res!1076864 (validKeyInArray!0 k0!761))))

(declare-fun b!1577196 () Bool)

(assert (=> b!1577196 (= e!879775 false)))

(declare-datatypes ((SeekEntryResult!13616 0))(
  ( (MissingZero!13616 (index!56862 (_ BitVec 32))) (Found!13616 (index!56863 (_ BitVec 32))) (Intermediate!13616 (undefined!14428 Bool) (index!56864 (_ BitVec 32)) (x!142023 (_ BitVec 32))) (Undefined!13616) (MissingVacant!13616 (index!56865 (_ BitVec 32))) )
))
(declare-fun lt!675840 () SeekEntryResult!13616)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105443 (_ BitVec 32)) SeekEntryResult!13616)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577196 (= lt!675840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136102 res!1076862) b!1577194))

(assert (= (and b!1577194 res!1076863) b!1577195))

(assert (= (and b!1577195 res!1076864) b!1577196))

(declare-fun m!1450203 () Bool)

(assert (=> start!136102 m!1450203))

(declare-fun m!1450205 () Bool)

(assert (=> start!136102 m!1450205))

(declare-fun m!1450207 () Bool)

(assert (=> b!1577195 m!1450207))

(declare-fun m!1450209 () Bool)

(assert (=> b!1577196 m!1450209))

(assert (=> b!1577196 m!1450209))

(declare-fun m!1450211 () Bool)

(assert (=> b!1577196 m!1450211))

(check-sat (not start!136102) (not b!1577196) (not b!1577195))
(check-sat)
