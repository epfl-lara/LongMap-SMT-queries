; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122744 () Bool)

(assert start!122744)

(declare-fun b!1422510 () Bool)

(declare-fun res!958007 () Bool)

(declare-fun e!804172 () Bool)

(assert (=> b!1422510 (=> (not res!958007) (not e!804172))))

(declare-datatypes ((array!97062 0))(
  ( (array!97063 (arr!46849 (Array (_ BitVec 32) (_ BitVec 64))) (size!47401 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97062)

(declare-datatypes ((List!33437 0))(
  ( (Nil!33434) (Cons!33433 (h!34735 (_ BitVec 64)) (t!48123 List!33437)) )
))
(declare-fun arrayNoDuplicates!0 (array!97062 (_ BitVec 32) List!33437) Bool)

(assert (=> b!1422510 (= res!958007 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33434))))

(declare-fun b!1422511 () Bool)

(declare-fun res!958006 () Bool)

(declare-fun e!804171 () Bool)

(assert (=> b!1422511 (=> res!958006 e!804171)))

(declare-fun lt!626558 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11161 0))(
  ( (MissingZero!11161 (index!47036 (_ BitVec 32))) (Found!11161 (index!47037 (_ BitVec 32))) (Intermediate!11161 (undefined!11973 Bool) (index!47038 (_ BitVec 32)) (x!128672 (_ BitVec 32))) (Undefined!11161) (MissingVacant!11161 (index!47039 (_ BitVec 32))) )
))
(declare-fun lt!626555 () SeekEntryResult!11161)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97062 (_ BitVec 32)) SeekEntryResult!11161)

(assert (=> b!1422511 (= res!958006 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626558 (select (arr!46849 a!2831) j!81) a!2831 mask!2608) lt!626555)))))

(declare-fun b!1422512 () Bool)

(declare-fun res!957995 () Bool)

(declare-fun e!804167 () Bool)

(assert (=> b!1422512 (=> (not res!957995) (not e!804167))))

(declare-fun lt!626557 () SeekEntryResult!11161)

(declare-fun lt!626553 () array!97062)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!626554 () (_ BitVec 64))

(assert (=> b!1422512 (= res!957995 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626554 lt!626553 mask!2608) lt!626557))))

(declare-fun b!1422513 () Bool)

(declare-fun res!958000 () Bool)

(assert (=> b!1422513 (=> (not res!958000) (not e!804167))))

(assert (=> b!1422513 (= res!958000 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46849 a!2831) j!81) a!2831 mask!2608) lt!626555))))

(declare-fun b!1422514 () Bool)

(declare-fun e!804168 () Bool)

(assert (=> b!1422514 (= e!804168 e!804167)))

(declare-fun res!957996 () Bool)

(assert (=> b!1422514 (=> (not res!957996) (not e!804167))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422514 (= res!957996 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626554 mask!2608) lt!626554 lt!626553 mask!2608) lt!626557))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422514 (= lt!626557 (Intermediate!11161 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422514 (= lt!626554 (select (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422514 (= lt!626553 (array!97063 (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47401 a!2831)))))

(declare-fun b!1422515 () Bool)

(declare-fun e!804169 () Bool)

(assert (=> b!1422515 (= e!804169 e!804171)))

(declare-fun res!957997 () Bool)

(assert (=> b!1422515 (=> res!957997 e!804171)))

(assert (=> b!1422515 (= res!957997 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626558 #b00000000000000000000000000000000) (bvsge lt!626558 (size!47401 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422515 (= lt!626558 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422516 () Bool)

(declare-fun res!957999 () Bool)

(assert (=> b!1422516 (=> (not res!957999) (not e!804172))))

(assert (=> b!1422516 (= res!957999 (and (= (size!47401 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47401 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47401 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422517 () Bool)

(assert (=> b!1422517 (= e!804172 e!804168)))

(declare-fun res!958001 () Bool)

(assert (=> b!1422517 (=> (not res!958001) (not e!804168))))

(assert (=> b!1422517 (= res!958001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46849 a!2831) j!81) mask!2608) (select (arr!46849 a!2831) j!81) a!2831 mask!2608) lt!626555))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422517 (= lt!626555 (Intermediate!11161 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!958003 () Bool)

(assert (=> start!122744 (=> (not res!958003) (not e!804172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122744 (= res!958003 (validMask!0 mask!2608))))

(assert (=> start!122744 e!804172))

(assert (=> start!122744 true))

(declare-fun array_inv!36082 (array!97062) Bool)

(assert (=> start!122744 (array_inv!36082 a!2831)))

(declare-fun b!1422518 () Bool)

(declare-fun res!957994 () Bool)

(assert (=> b!1422518 (=> (not res!957994) (not e!804172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422518 (= res!957994 (validKeyInArray!0 (select (arr!46849 a!2831) i!982)))))

(declare-fun b!1422519 () Bool)

(assert (=> b!1422519 (= e!804167 (not e!804169))))

(declare-fun res!958008 () Bool)

(assert (=> b!1422519 (=> res!958008 e!804169)))

(assert (=> b!1422519 (= res!958008 (or (= (select (arr!46849 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46849 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46849 a!2831) index!585) (select (arr!46849 a!2831) j!81)) (= (select (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804170 () Bool)

(assert (=> b!1422519 e!804170))

(declare-fun res!958009 () Bool)

(assert (=> b!1422519 (=> (not res!958009) (not e!804170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97062 (_ BitVec 32)) Bool)

(assert (=> b!1422519 (= res!958009 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47997 0))(
  ( (Unit!47998) )
))
(declare-fun lt!626552 () Unit!47997)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47997)

(assert (=> b!1422519 (= lt!626552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422520 () Bool)

(declare-fun res!958002 () Bool)

(assert (=> b!1422520 (=> (not res!958002) (not e!804167))))

(assert (=> b!1422520 (= res!958002 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422521 () Bool)

(declare-fun res!958004 () Bool)

(assert (=> b!1422521 (=> (not res!958004) (not e!804172))))

(assert (=> b!1422521 (= res!958004 (validKeyInArray!0 (select (arr!46849 a!2831) j!81)))))

(declare-fun b!1422522 () Bool)

(declare-fun res!958005 () Bool)

(assert (=> b!1422522 (=> (not res!958005) (not e!804172))))

(assert (=> b!1422522 (= res!958005 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47401 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47401 a!2831))))))

(declare-fun b!1422523 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97062 (_ BitVec 32)) SeekEntryResult!11161)

(assert (=> b!1422523 (= e!804170 (= (seekEntryOrOpen!0 (select (arr!46849 a!2831) j!81) a!2831 mask!2608) (Found!11161 j!81)))))

(declare-fun b!1422524 () Bool)

(assert (=> b!1422524 (= e!804171 true)))

(declare-fun lt!626556 () SeekEntryResult!11161)

(assert (=> b!1422524 (= lt!626556 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626558 lt!626554 lt!626553 mask!2608))))

(declare-fun b!1422525 () Bool)

(declare-fun res!957998 () Bool)

(assert (=> b!1422525 (=> (not res!957998) (not e!804172))))

(assert (=> b!1422525 (= res!957998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122744 res!958003) b!1422516))

(assert (= (and b!1422516 res!957999) b!1422518))

(assert (= (and b!1422518 res!957994) b!1422521))

(assert (= (and b!1422521 res!958004) b!1422525))

(assert (= (and b!1422525 res!957998) b!1422510))

(assert (= (and b!1422510 res!958007) b!1422522))

(assert (= (and b!1422522 res!958005) b!1422517))

(assert (= (and b!1422517 res!958001) b!1422514))

(assert (= (and b!1422514 res!957996) b!1422513))

(assert (= (and b!1422513 res!958000) b!1422512))

(assert (= (and b!1422512 res!957995) b!1422520))

(assert (= (and b!1422520 res!958002) b!1422519))

(assert (= (and b!1422519 res!958009) b!1422523))

(assert (= (and b!1422519 (not res!958008)) b!1422515))

(assert (= (and b!1422515 (not res!957997)) b!1422511))

(assert (= (and b!1422511 (not res!958006)) b!1422524))

(declare-fun m!1312587 () Bool)

(assert (=> b!1422518 m!1312587))

(assert (=> b!1422518 m!1312587))

(declare-fun m!1312589 () Bool)

(assert (=> b!1422518 m!1312589))

(declare-fun m!1312591 () Bool)

(assert (=> start!122744 m!1312591))

(declare-fun m!1312593 () Bool)

(assert (=> start!122744 m!1312593))

(declare-fun m!1312595 () Bool)

(assert (=> b!1422517 m!1312595))

(assert (=> b!1422517 m!1312595))

(declare-fun m!1312597 () Bool)

(assert (=> b!1422517 m!1312597))

(assert (=> b!1422517 m!1312597))

(assert (=> b!1422517 m!1312595))

(declare-fun m!1312599 () Bool)

(assert (=> b!1422517 m!1312599))

(assert (=> b!1422523 m!1312595))

(assert (=> b!1422523 m!1312595))

(declare-fun m!1312601 () Bool)

(assert (=> b!1422523 m!1312601))

(declare-fun m!1312603 () Bool)

(assert (=> b!1422512 m!1312603))

(declare-fun m!1312605 () Bool)

(assert (=> b!1422519 m!1312605))

(declare-fun m!1312607 () Bool)

(assert (=> b!1422519 m!1312607))

(declare-fun m!1312609 () Bool)

(assert (=> b!1422519 m!1312609))

(declare-fun m!1312611 () Bool)

(assert (=> b!1422519 m!1312611))

(assert (=> b!1422519 m!1312595))

(declare-fun m!1312613 () Bool)

(assert (=> b!1422519 m!1312613))

(assert (=> b!1422513 m!1312595))

(assert (=> b!1422513 m!1312595))

(declare-fun m!1312615 () Bool)

(assert (=> b!1422513 m!1312615))

(declare-fun m!1312617 () Bool)

(assert (=> b!1422514 m!1312617))

(assert (=> b!1422514 m!1312617))

(declare-fun m!1312619 () Bool)

(assert (=> b!1422514 m!1312619))

(assert (=> b!1422514 m!1312605))

(declare-fun m!1312621 () Bool)

(assert (=> b!1422514 m!1312621))

(assert (=> b!1422511 m!1312595))

(assert (=> b!1422511 m!1312595))

(declare-fun m!1312623 () Bool)

(assert (=> b!1422511 m!1312623))

(assert (=> b!1422521 m!1312595))

(assert (=> b!1422521 m!1312595))

(declare-fun m!1312625 () Bool)

(assert (=> b!1422521 m!1312625))

(declare-fun m!1312627 () Bool)

(assert (=> b!1422510 m!1312627))

(declare-fun m!1312629 () Bool)

(assert (=> b!1422515 m!1312629))

(declare-fun m!1312631 () Bool)

(assert (=> b!1422524 m!1312631))

(declare-fun m!1312633 () Bool)

(assert (=> b!1422525 m!1312633))

(check-sat (not b!1422517) (not b!1422525) (not b!1422518) (not b!1422511) (not b!1422524) (not b!1422521) (not b!1422510) (not b!1422519) (not b!1422513) (not b!1422514) (not b!1422515) (not b!1422512) (not start!122744) (not b!1422523))
(check-sat)
