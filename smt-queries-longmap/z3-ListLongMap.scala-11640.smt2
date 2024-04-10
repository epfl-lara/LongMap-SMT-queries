; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135872 () Bool)

(assert start!135872)

(declare-fun res!1076456 () Bool)

(declare-fun e!878669 () Bool)

(assert (=> start!135872 (=> (not res!1076456) (not e!878669))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135872 (= res!1076456 (validMask!0 mask!898))))

(assert (=> start!135872 e!878669))

(assert (=> start!135872 true))

(declare-datatypes ((array!105404 0))(
  ( (array!105405 (arr!50840 (Array (_ BitVec 32) (_ BitVec 64))) (size!51390 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105404)

(declare-fun array_inv!39567 (array!105404) Bool)

(assert (=> start!135872 (array_inv!39567 _keys!605)))

(declare-fun b!1575415 () Bool)

(declare-fun res!1076455 () Bool)

(assert (=> b!1575415 (=> (not res!1076455) (not e!878669))))

(assert (=> b!1575415 (= res!1076455 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51390 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575416 () Bool)

(declare-fun res!1076457 () Bool)

(assert (=> b!1575416 (=> (not res!1076457) (not e!878669))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575416 (= res!1076457 (validKeyInArray!0 k0!761))))

(declare-fun b!1575417 () Bool)

(assert (=> b!1575417 (= e!878669 false)))

(declare-datatypes ((SeekEntryResult!13705 0))(
  ( (MissingZero!13705 (index!57218 (_ BitVec 32))) (Found!13705 (index!57219 (_ BitVec 32))) (Intermediate!13705 (undefined!14517 Bool) (index!57220 (_ BitVec 32)) (x!142181 (_ BitVec 32))) (Undefined!13705) (MissingVacant!13705 (index!57221 (_ BitVec 32))) )
))
(declare-fun lt!675187 () SeekEntryResult!13705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105404 (_ BitVec 32)) SeekEntryResult!13705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575417 (= lt!675187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135872 res!1076456) b!1575415))

(assert (= (and b!1575415 res!1076455) b!1575416))

(assert (= (and b!1575416 res!1076457) b!1575417))

(declare-fun m!1448429 () Bool)

(assert (=> start!135872 m!1448429))

(declare-fun m!1448431 () Bool)

(assert (=> start!135872 m!1448431))

(declare-fun m!1448433 () Bool)

(assert (=> b!1575416 m!1448433))

(declare-fun m!1448435 () Bool)

(assert (=> b!1575417 m!1448435))

(assert (=> b!1575417 m!1448435))

(declare-fun m!1448437 () Bool)

(assert (=> b!1575417 m!1448437))

(check-sat (not start!135872) (not b!1575417) (not b!1575416))
