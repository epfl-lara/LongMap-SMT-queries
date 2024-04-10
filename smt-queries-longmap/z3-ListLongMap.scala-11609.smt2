; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135462 () Bool)

(assert start!135462)

(declare-fun res!1075431 () Bool)

(declare-fun e!877858 () Bool)

(assert (=> start!135462 (=> (not res!1075431) (not e!877858))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135462 (= res!1075431 (validMask!0 mask!877))))

(assert (=> start!135462 e!877858))

(assert (=> start!135462 true))

(declare-datatypes ((array!105193 0))(
  ( (array!105194 (arr!50747 (Array (_ BitVec 32) (_ BitVec 64))) (size!51297 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105193)

(declare-fun array_inv!39474 (array!105193) Bool)

(assert (=> start!135462 (array_inv!39474 _keys!591)))

(declare-fun b!1574137 () Bool)

(declare-fun res!1075430 () Bool)

(assert (=> b!1574137 (=> (not res!1075430) (not e!877858))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574137 (= res!1075430 (and (= (size!51297 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51297 _keys!591)) (bvslt i!537 (size!51297 _keys!591))))))

(declare-fun b!1574138 () Bool)

(declare-fun res!1075429 () Bool)

(assert (=> b!1574138 (=> (not res!1075429) (not e!877858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574138 (= res!1075429 (validKeyInArray!0 (select (arr!50747 _keys!591) i!537)))))

(declare-fun b!1574139 () Bool)

(assert (=> b!1574139 (= e!877858 (not true))))

(declare-datatypes ((SeekEntryResult!13648 0))(
  ( (MissingZero!13648 (index!56990 (_ BitVec 32))) (Found!13648 (index!56991 (_ BitVec 32))) (Intermediate!13648 (undefined!14460 Bool) (index!56992 (_ BitVec 32)) (x!141843 (_ BitVec 32))) (Undefined!13648) (MissingVacant!13648 (index!56993 (_ BitVec 32))) )
))
(declare-fun lt!674751 () SeekEntryResult!13648)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105193 (_ BitVec 32)) SeekEntryResult!13648)

(assert (=> b!1574139 (= lt!674751 (seekEntryOrOpen!0 (select (arr!50747 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574139 (arrayContainsKey!0 _keys!591 (select (arr!50747 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52158 0))(
  ( (Unit!52159) )
))
(declare-fun lt!674752 () Unit!52158)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105193 (_ BitVec 64) (_ BitVec 32)) Unit!52158)

(assert (=> b!1574139 (= lt!674752 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50747 _keys!591) i!537) i!537))))

(assert (= (and start!135462 res!1075431) b!1574137))

(assert (= (and b!1574137 res!1075430) b!1574138))

(assert (= (and b!1574138 res!1075429) b!1574139))

(declare-fun m!1447389 () Bool)

(assert (=> start!135462 m!1447389))

(declare-fun m!1447391 () Bool)

(assert (=> start!135462 m!1447391))

(declare-fun m!1447393 () Bool)

(assert (=> b!1574138 m!1447393))

(assert (=> b!1574138 m!1447393))

(declare-fun m!1447395 () Bool)

(assert (=> b!1574138 m!1447395))

(assert (=> b!1574139 m!1447393))

(assert (=> b!1574139 m!1447393))

(declare-fun m!1447397 () Bool)

(assert (=> b!1574139 m!1447397))

(assert (=> b!1574139 m!1447393))

(declare-fun m!1447399 () Bool)

(assert (=> b!1574139 m!1447399))

(assert (=> b!1574139 m!1447393))

(declare-fun m!1447401 () Bool)

(assert (=> b!1574139 m!1447401))

(check-sat (not b!1574139) (not start!135462) (not b!1574138))
