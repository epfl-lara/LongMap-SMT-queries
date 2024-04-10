; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135626 () Bool)

(assert start!135626)

(declare-fun res!1075875 () Bool)

(declare-fun e!878156 () Bool)

(assert (=> start!135626 (=> (not res!1075875) (not e!878156))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135626 (= res!1075875 (validMask!0 mask!898))))

(assert (=> start!135626 e!878156))

(assert (=> start!135626 true))

(declare-datatypes ((array!105293 0))(
  ( (array!105294 (arr!50792 (Array (_ BitVec 32) (_ BitVec 64))) (size!51342 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105293)

(declare-fun array_inv!39519 (array!105293) Bool)

(assert (=> start!135626 (array_inv!39519 _keys!605)))

(declare-fun b!1574578 () Bool)

(declare-fun res!1075873 () Bool)

(assert (=> b!1574578 (=> (not res!1075873) (not e!878156))))

(assert (=> b!1574578 (= res!1075873 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51342 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574579 () Bool)

(declare-fun res!1075874 () Bool)

(assert (=> b!1574579 (=> (not res!1075874) (not e!878156))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574579 (= res!1075874 (validKeyInArray!0 k0!761))))

(declare-fun b!1574580 () Bool)

(assert (=> b!1574580 (= e!878156 false)))

(declare-datatypes ((SeekEntryResult!13657 0))(
  ( (MissingZero!13657 (index!57026 (_ BitVec 32))) (Found!13657 (index!57027 (_ BitVec 32))) (Intermediate!13657 (undefined!14469 Bool) (index!57028 (_ BitVec 32)) (x!141975 (_ BitVec 32))) (Undefined!13657) (MissingVacant!13657 (index!57029 (_ BitVec 32))) )
))
(declare-fun lt!674863 () SeekEntryResult!13657)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105293 (_ BitVec 32)) SeekEntryResult!13657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574580 (= lt!674863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135626 res!1075875) b!1574578))

(assert (= (and b!1574578 res!1075873) b!1574579))

(assert (= (and b!1574579 res!1075874) b!1574580))

(declare-fun m!1447805 () Bool)

(assert (=> start!135626 m!1447805))

(declare-fun m!1447807 () Bool)

(assert (=> start!135626 m!1447807))

(declare-fun m!1447809 () Bool)

(assert (=> b!1574579 m!1447809))

(declare-fun m!1447811 () Bool)

(assert (=> b!1574580 m!1447811))

(assert (=> b!1574580 m!1447811))

(declare-fun m!1447813 () Bool)

(assert (=> b!1574580 m!1447813))

(check-sat (not b!1574580) (not start!135626) (not b!1574579))
(check-sat)
