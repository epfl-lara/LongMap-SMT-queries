; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136052 () Bool)

(assert start!136052)

(declare-fun res!1076744 () Bool)

(declare-fun e!879671 () Bool)

(assert (=> start!136052 (=> (not res!1076744) (not e!879671))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136052 (= res!1076744 (validMask!0 mask!898))))

(assert (=> start!136052 e!879671))

(assert (=> start!136052 true))

(declare-datatypes ((array!105420 0))(
  ( (array!105421 (arr!50847 (Array (_ BitVec 32) (_ BitVec 64))) (size!51398 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105420)

(declare-fun array_inv!39802 (array!105420) Bool)

(assert (=> start!136052 (array_inv!39802 _keys!605)))

(declare-fun b!1577023 () Bool)

(declare-fun res!1076743 () Bool)

(assert (=> b!1577023 (=> (not res!1076743) (not e!879671))))

(assert (=> b!1577023 (= res!1076743 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51398 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577024 () Bool)

(declare-fun res!1076742 () Bool)

(assert (=> b!1577024 (=> (not res!1076742) (not e!879671))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577024 (= res!1076742 (validKeyInArray!0 k!761))))

(declare-fun b!1577025 () Bool)

(assert (=> b!1577025 (= e!879671 false)))

(declare-datatypes ((SeekEntryResult!13606 0))(
  ( (MissingZero!13606 (index!56822 (_ BitVec 32))) (Found!13606 (index!56823 (_ BitVec 32))) (Intermediate!13606 (undefined!14418 Bool) (index!56824 (_ BitVec 32)) (x!141975 (_ BitVec 32))) (Undefined!13606) (MissingVacant!13606 (index!56825 (_ BitVec 32))) )
))
(declare-fun lt!675774 () SeekEntryResult!13606)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105420 (_ BitVec 32)) SeekEntryResult!13606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577025 (= lt!675774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136052 res!1076744) b!1577023))

(assert (= (and b!1577023 res!1076743) b!1577024))

(assert (= (and b!1577024 res!1076742) b!1577025))

(declare-fun m!1450073 () Bool)

(assert (=> start!136052 m!1450073))

(declare-fun m!1450075 () Bool)

(assert (=> start!136052 m!1450075))

(declare-fun m!1450077 () Bool)

(assert (=> b!1577024 m!1450077))

(declare-fun m!1450079 () Bool)

(assert (=> b!1577025 m!1450079))

(assert (=> b!1577025 m!1450079))

(declare-fun m!1450081 () Bool)

(assert (=> b!1577025 m!1450081))

(push 1)

(assert (not b!1577025))

(assert (not start!136052))

(assert (not b!1577024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

