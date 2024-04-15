; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122564 () Bool)

(assert start!122564)

(declare-fun b!1419517 () Bool)

(declare-fun res!955006 () Bool)

(declare-fun e!803133 () Bool)

(assert (=> b!1419517 (=> (not res!955006) (not e!803133))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96882 0))(
  ( (array!96883 (arr!46759 (Array (_ BitVec 32) (_ BitVec 64))) (size!47311 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96882)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419517 (= res!955006 (and (= (size!47311 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47311 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47311 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419518 () Bool)

(declare-fun res!955009 () Bool)

(assert (=> b!1419518 (=> (not res!955009) (not e!803133))))

(declare-datatypes ((List!33347 0))(
  ( (Nil!33344) (Cons!33343 (h!34645 (_ BitVec 64)) (t!48033 List!33347)) )
))
(declare-fun arrayNoDuplicates!0 (array!96882 (_ BitVec 32) List!33347) Bool)

(assert (=> b!1419518 (= res!955009 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33344))))

(declare-fun b!1419519 () Bool)

(declare-fun res!955001 () Bool)

(assert (=> b!1419519 (=> (not res!955001) (not e!803133))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11071 0))(
  ( (MissingZero!11071 (index!46676 (_ BitVec 32))) (Found!11071 (index!46677 (_ BitVec 32))) (Intermediate!11071 (undefined!11883 Bool) (index!46678 (_ BitVec 32)) (x!128342 (_ BitVec 32))) (Undefined!11071) (MissingVacant!11071 (index!46679 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96882 (_ BitVec 32)) SeekEntryResult!11071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419519 (= res!955001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46759 a!2831) j!81) mask!2608) (select (arr!46759 a!2831) j!81) a!2831 mask!2608) (Intermediate!11071 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419520 () Bool)

(declare-fun res!955003 () Bool)

(assert (=> b!1419520 (=> (not res!955003) (not e!803133))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419520 (= res!955003 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47311 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47311 a!2831))))))

(declare-fun b!1419521 () Bool)

(declare-fun e!803135 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419521 (= e!803135 (not (validKeyInArray!0 (select (store (arr!46759 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1419522 () Bool)

(assert (=> b!1419522 (= e!803133 e!803135)))

(declare-fun res!955004 () Bool)

(assert (=> b!1419522 (=> (not res!955004) (not e!803135))))

(declare-fun lt!625649 () (_ BitVec 32))

(assert (=> b!1419522 (= res!955004 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge lt!625649 #b00000000000000000000000000000000) (bvslt lt!625649 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(assert (=> b!1419522 (= lt!625649 (toIndex!0 (select (store (arr!46759 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun res!955005 () Bool)

(assert (=> start!122564 (=> (not res!955005) (not e!803133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122564 (= res!955005 (validMask!0 mask!2608))))

(assert (=> start!122564 e!803133))

(assert (=> start!122564 true))

(declare-fun array_inv!35992 (array!96882) Bool)

(assert (=> start!122564 (array_inv!35992 a!2831)))

(declare-fun b!1419523 () Bool)

(declare-fun res!955008 () Bool)

(assert (=> b!1419523 (=> (not res!955008) (not e!803133))))

(assert (=> b!1419523 (= res!955008 (validKeyInArray!0 (select (arr!46759 a!2831) i!982)))))

(declare-fun b!1419524 () Bool)

(declare-fun res!955007 () Bool)

(assert (=> b!1419524 (=> (not res!955007) (not e!803133))))

(assert (=> b!1419524 (= res!955007 (validKeyInArray!0 (select (arr!46759 a!2831) j!81)))))

(declare-fun b!1419525 () Bool)

(declare-fun res!955002 () Bool)

(assert (=> b!1419525 (=> (not res!955002) (not e!803133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96882 (_ BitVec 32)) Bool)

(assert (=> b!1419525 (= res!955002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122564 res!955005) b!1419517))

(assert (= (and b!1419517 res!955006) b!1419523))

(assert (= (and b!1419523 res!955008) b!1419524))

(assert (= (and b!1419524 res!955007) b!1419525))

(assert (= (and b!1419525 res!955002) b!1419518))

(assert (= (and b!1419518 res!955009) b!1419520))

(assert (= (and b!1419520 res!955003) b!1419519))

(assert (= (and b!1419519 res!955001) b!1419522))

(assert (= (and b!1419522 res!955004) b!1419521))

(declare-fun m!1309485 () Bool)

(assert (=> b!1419525 m!1309485))

(declare-fun m!1309487 () Bool)

(assert (=> b!1419524 m!1309487))

(assert (=> b!1419524 m!1309487))

(declare-fun m!1309489 () Bool)

(assert (=> b!1419524 m!1309489))

(declare-fun m!1309491 () Bool)

(assert (=> start!122564 m!1309491))

(declare-fun m!1309493 () Bool)

(assert (=> start!122564 m!1309493))

(declare-fun m!1309495 () Bool)

(assert (=> b!1419521 m!1309495))

(declare-fun m!1309497 () Bool)

(assert (=> b!1419521 m!1309497))

(assert (=> b!1419521 m!1309497))

(declare-fun m!1309499 () Bool)

(assert (=> b!1419521 m!1309499))

(assert (=> b!1419522 m!1309495))

(assert (=> b!1419522 m!1309497))

(assert (=> b!1419522 m!1309497))

(declare-fun m!1309501 () Bool)

(assert (=> b!1419522 m!1309501))

(declare-fun m!1309503 () Bool)

(assert (=> b!1419523 m!1309503))

(assert (=> b!1419523 m!1309503))

(declare-fun m!1309505 () Bool)

(assert (=> b!1419523 m!1309505))

(declare-fun m!1309507 () Bool)

(assert (=> b!1419518 m!1309507))

(assert (=> b!1419519 m!1309487))

(assert (=> b!1419519 m!1309487))

(declare-fun m!1309509 () Bool)

(assert (=> b!1419519 m!1309509))

(assert (=> b!1419519 m!1309509))

(assert (=> b!1419519 m!1309487))

(declare-fun m!1309511 () Bool)

(assert (=> b!1419519 m!1309511))

(check-sat (not b!1419521) (not b!1419523) (not start!122564) (not b!1419518) (not b!1419519) (not b!1419525) (not b!1419524) (not b!1419522))
(check-sat)
