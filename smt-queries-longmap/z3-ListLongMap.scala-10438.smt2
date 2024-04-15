; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122786 () Bool)

(assert start!122786)

(declare-fun b!1423518 () Bool)

(declare-fun res!959004 () Bool)

(declare-fun e!804611 () Bool)

(assert (=> b!1423518 (=> (not res!959004) (not e!804611))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((array!97104 0))(
  ( (array!97105 (arr!46870 (Array (_ BitVec 32) (_ BitVec 64))) (size!47422 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97104)

(assert (=> b!1423518 (= res!959004 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47422 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47422 a!2831))))))

(declare-fun b!1423519 () Bool)

(declare-fun res!959011 () Bool)

(declare-fun e!804608 () Bool)

(assert (=> b!1423519 (=> res!959011 e!804608)))

(declare-fun lt!626996 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11182 0))(
  ( (MissingZero!11182 (index!47120 (_ BitVec 32))) (Found!11182 (index!47121 (_ BitVec 32))) (Intermediate!11182 (undefined!11994 Bool) (index!47122 (_ BitVec 32)) (x!128749 (_ BitVec 32))) (Undefined!11182) (MissingVacant!11182 (index!47123 (_ BitVec 32))) )
))
(declare-fun lt!626998 () SeekEntryResult!11182)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97104 (_ BitVec 32)) SeekEntryResult!11182)

(assert (=> b!1423519 (= res!959011 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626996 (select (arr!46870 a!2831) j!81) a!2831 mask!2608) lt!626998)))))

(declare-fun b!1423520 () Bool)

(declare-fun res!959005 () Bool)

(declare-fun e!804613 () Bool)

(assert (=> b!1423520 (=> (not res!959005) (not e!804613))))

(assert (=> b!1423520 (= res!959005 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46870 a!2831) j!81) a!2831 mask!2608) lt!626998))))

(declare-fun b!1423521 () Bool)

(declare-fun e!804614 () Bool)

(assert (=> b!1423521 (= e!804613 (not e!804614))))

(declare-fun res!959012 () Bool)

(assert (=> b!1423521 (=> res!959012 e!804614)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423521 (= res!959012 (or (= (select (arr!46870 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46870 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46870 a!2831) index!585) (select (arr!46870 a!2831) j!81)) (= (select (store (arr!46870 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804609 () Bool)

(assert (=> b!1423521 e!804609))

(declare-fun res!959016 () Bool)

(assert (=> b!1423521 (=> (not res!959016) (not e!804609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97104 (_ BitVec 32)) Bool)

(assert (=> b!1423521 (= res!959016 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48039 0))(
  ( (Unit!48040) )
))
(declare-fun lt!626994 () Unit!48039)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48039)

(assert (=> b!1423521 (= lt!626994 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423522 () Bool)

(declare-fun res!959015 () Bool)

(assert (=> b!1423522 (=> (not res!959015) (not e!804611))))

(assert (=> b!1423522 (= res!959015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423523 () Bool)

(declare-fun res!959006 () Bool)

(assert (=> b!1423523 (=> (not res!959006) (not e!804613))))

(declare-fun lt!626995 () (_ BitVec 64))

(declare-fun lt!626997 () array!97104)

(declare-fun lt!626993 () SeekEntryResult!11182)

(assert (=> b!1423523 (= res!959006 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626995 lt!626997 mask!2608) lt!626993))))

(declare-fun b!1423524 () Bool)

(declare-fun res!959009 () Bool)

(assert (=> b!1423524 (=> (not res!959009) (not e!804611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423524 (= res!959009 (validKeyInArray!0 (select (arr!46870 a!2831) j!81)))))

(declare-fun b!1423525 () Bool)

(declare-fun res!959007 () Bool)

(assert (=> b!1423525 (=> (not res!959007) (not e!804611))))

(assert (=> b!1423525 (= res!959007 (and (= (size!47422 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47422 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47422 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423526 () Bool)

(declare-fun res!959013 () Bool)

(assert (=> b!1423526 (=> (not res!959013) (not e!804611))))

(declare-datatypes ((List!33458 0))(
  ( (Nil!33455) (Cons!33454 (h!34756 (_ BitVec 64)) (t!48144 List!33458)) )
))
(declare-fun arrayNoDuplicates!0 (array!97104 (_ BitVec 32) List!33458) Bool)

(assert (=> b!1423526 (= res!959013 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33455))))

(declare-fun b!1423527 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97104 (_ BitVec 32)) SeekEntryResult!11182)

(assert (=> b!1423527 (= e!804609 (= (seekEntryOrOpen!0 (select (arr!46870 a!2831) j!81) a!2831 mask!2608) (Found!11182 j!81)))))

(declare-fun b!1423529 () Bool)

(declare-fun res!959014 () Bool)

(assert (=> b!1423529 (=> (not res!959014) (not e!804613))))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1423529 (= res!959014 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423530 () Bool)

(declare-fun e!804612 () Bool)

(assert (=> b!1423530 (= e!804611 e!804612)))

(declare-fun res!959003 () Bool)

(assert (=> b!1423530 (=> (not res!959003) (not e!804612))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423530 (= res!959003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46870 a!2831) j!81) mask!2608) (select (arr!46870 a!2831) j!81) a!2831 mask!2608) lt!626998))))

(assert (=> b!1423530 (= lt!626998 (Intermediate!11182 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423531 () Bool)

(assert (=> b!1423531 (= e!804608 true)))

(declare-fun lt!626999 () SeekEntryResult!11182)

(assert (=> b!1423531 (= lt!626999 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626996 lt!626995 lt!626997 mask!2608))))

(declare-fun b!1423532 () Bool)

(assert (=> b!1423532 (= e!804614 e!804608)))

(declare-fun res!959002 () Bool)

(assert (=> b!1423532 (=> res!959002 e!804608)))

(assert (=> b!1423532 (= res!959002 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626996 #b00000000000000000000000000000000) (bvsge lt!626996 (size!47422 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423532 (= lt!626996 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423533 () Bool)

(assert (=> b!1423533 (= e!804612 e!804613)))

(declare-fun res!959017 () Bool)

(assert (=> b!1423533 (=> (not res!959017) (not e!804613))))

(assert (=> b!1423533 (= res!959017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626995 mask!2608) lt!626995 lt!626997 mask!2608) lt!626993))))

(assert (=> b!1423533 (= lt!626993 (Intermediate!11182 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423533 (= lt!626995 (select (store (arr!46870 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423533 (= lt!626997 (array!97105 (store (arr!46870 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47422 a!2831)))))

(declare-fun b!1423528 () Bool)

(declare-fun res!959008 () Bool)

(assert (=> b!1423528 (=> (not res!959008) (not e!804611))))

(assert (=> b!1423528 (= res!959008 (validKeyInArray!0 (select (arr!46870 a!2831) i!982)))))

(declare-fun res!959010 () Bool)

(assert (=> start!122786 (=> (not res!959010) (not e!804611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122786 (= res!959010 (validMask!0 mask!2608))))

(assert (=> start!122786 e!804611))

(assert (=> start!122786 true))

(declare-fun array_inv!36103 (array!97104) Bool)

(assert (=> start!122786 (array_inv!36103 a!2831)))

(assert (= (and start!122786 res!959010) b!1423525))

(assert (= (and b!1423525 res!959007) b!1423528))

(assert (= (and b!1423528 res!959008) b!1423524))

(assert (= (and b!1423524 res!959009) b!1423522))

(assert (= (and b!1423522 res!959015) b!1423526))

(assert (= (and b!1423526 res!959013) b!1423518))

(assert (= (and b!1423518 res!959004) b!1423530))

(assert (= (and b!1423530 res!959003) b!1423533))

(assert (= (and b!1423533 res!959017) b!1423520))

(assert (= (and b!1423520 res!959005) b!1423523))

(assert (= (and b!1423523 res!959006) b!1423529))

(assert (= (and b!1423529 res!959014) b!1423521))

(assert (= (and b!1423521 res!959016) b!1423527))

(assert (= (and b!1423521 (not res!959012)) b!1423532))

(assert (= (and b!1423532 (not res!959002)) b!1423519))

(assert (= (and b!1423519 (not res!959011)) b!1423531))

(declare-fun m!1313595 () Bool)

(assert (=> b!1423520 m!1313595))

(assert (=> b!1423520 m!1313595))

(declare-fun m!1313597 () Bool)

(assert (=> b!1423520 m!1313597))

(declare-fun m!1313599 () Bool)

(assert (=> b!1423528 m!1313599))

(assert (=> b!1423528 m!1313599))

(declare-fun m!1313601 () Bool)

(assert (=> b!1423528 m!1313601))

(assert (=> b!1423530 m!1313595))

(assert (=> b!1423530 m!1313595))

(declare-fun m!1313603 () Bool)

(assert (=> b!1423530 m!1313603))

(assert (=> b!1423530 m!1313603))

(assert (=> b!1423530 m!1313595))

(declare-fun m!1313605 () Bool)

(assert (=> b!1423530 m!1313605))

(assert (=> b!1423527 m!1313595))

(assert (=> b!1423527 m!1313595))

(declare-fun m!1313607 () Bool)

(assert (=> b!1423527 m!1313607))

(declare-fun m!1313609 () Bool)

(assert (=> b!1423532 m!1313609))

(declare-fun m!1313611 () Bool)

(assert (=> b!1423522 m!1313611))

(assert (=> b!1423524 m!1313595))

(assert (=> b!1423524 m!1313595))

(declare-fun m!1313613 () Bool)

(assert (=> b!1423524 m!1313613))

(declare-fun m!1313615 () Bool)

(assert (=> b!1423523 m!1313615))

(declare-fun m!1313617 () Bool)

(assert (=> b!1423533 m!1313617))

(assert (=> b!1423533 m!1313617))

(declare-fun m!1313619 () Bool)

(assert (=> b!1423533 m!1313619))

(declare-fun m!1313621 () Bool)

(assert (=> b!1423533 m!1313621))

(declare-fun m!1313623 () Bool)

(assert (=> b!1423533 m!1313623))

(assert (=> b!1423521 m!1313621))

(declare-fun m!1313625 () Bool)

(assert (=> b!1423521 m!1313625))

(declare-fun m!1313627 () Bool)

(assert (=> b!1423521 m!1313627))

(declare-fun m!1313629 () Bool)

(assert (=> b!1423521 m!1313629))

(assert (=> b!1423521 m!1313595))

(declare-fun m!1313631 () Bool)

(assert (=> b!1423521 m!1313631))

(declare-fun m!1313633 () Bool)

(assert (=> b!1423531 m!1313633))

(assert (=> b!1423519 m!1313595))

(assert (=> b!1423519 m!1313595))

(declare-fun m!1313635 () Bool)

(assert (=> b!1423519 m!1313635))

(declare-fun m!1313637 () Bool)

(assert (=> start!122786 m!1313637))

(declare-fun m!1313639 () Bool)

(assert (=> start!122786 m!1313639))

(declare-fun m!1313641 () Bool)

(assert (=> b!1423526 m!1313641))

(check-sat (not b!1423526) (not b!1423523) (not b!1423519) (not b!1423522) (not start!122786) (not b!1423524) (not b!1423531) (not b!1423521) (not b!1423532) (not b!1423528) (not b!1423530) (not b!1423533) (not b!1423520) (not b!1423527))
(check-sat)
