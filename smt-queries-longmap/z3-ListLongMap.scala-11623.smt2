; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135620 () Bool)

(assert start!135620)

(declare-fun res!1075846 () Bool)

(declare-fun e!878137 () Bool)

(assert (=> start!135620 (=> (not res!1075846) (not e!878137))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135620 (= res!1075846 (validMask!0 mask!898))))

(assert (=> start!135620 e!878137))

(assert (=> start!135620 true))

(declare-datatypes ((array!105287 0))(
  ( (array!105288 (arr!50789 (Array (_ BitVec 32) (_ BitVec 64))) (size!51339 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105287)

(declare-fun array_inv!39516 (array!105287) Bool)

(assert (=> start!135620 (array_inv!39516 _keys!605)))

(declare-fun b!1574551 () Bool)

(declare-fun res!1075847 () Bool)

(assert (=> b!1574551 (=> (not res!1075847) (not e!878137))))

(assert (=> b!1574551 (= res!1075847 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51339 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574552 () Bool)

(declare-fun res!1075848 () Bool)

(assert (=> b!1574552 (=> (not res!1075848) (not e!878137))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574552 (= res!1075848 (validKeyInArray!0 k0!761))))

(declare-fun b!1574553 () Bool)

(assert (=> b!1574553 (= e!878137 false)))

(declare-datatypes ((SeekEntryResult!13654 0))(
  ( (MissingZero!13654 (index!57014 (_ BitVec 32))) (Found!13654 (index!57015 (_ BitVec 32))) (Intermediate!13654 (undefined!14466 Bool) (index!57016 (_ BitVec 32)) (x!141964 (_ BitVec 32))) (Undefined!13654) (MissingVacant!13654 (index!57017 (_ BitVec 32))) )
))
(declare-fun lt!674854 () SeekEntryResult!13654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105287 (_ BitVec 32)) SeekEntryResult!13654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574553 (= lt!674854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135620 res!1075846) b!1574551))

(assert (= (and b!1574551 res!1075847) b!1574552))

(assert (= (and b!1574552 res!1075848) b!1574553))

(declare-fun m!1447775 () Bool)

(assert (=> start!135620 m!1447775))

(declare-fun m!1447777 () Bool)

(assert (=> start!135620 m!1447777))

(declare-fun m!1447779 () Bool)

(assert (=> b!1574552 m!1447779))

(declare-fun m!1447781 () Bool)

(assert (=> b!1574553 m!1447781))

(assert (=> b!1574553 m!1447781))

(declare-fun m!1447783 () Bool)

(assert (=> b!1574553 m!1447783))

(check-sat (not start!135620) (not b!1574553) (not b!1574552))
