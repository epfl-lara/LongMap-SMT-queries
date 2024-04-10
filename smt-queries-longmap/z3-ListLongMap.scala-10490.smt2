; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123518 () Bool)

(assert start!123518)

(declare-fun b!1431731 () Bool)

(declare-fun res!965608 () Bool)

(declare-fun e!808301 () Bool)

(assert (=> b!1431731 (=> (not res!965608) (not e!808301))))

(declare-datatypes ((array!97490 0))(
  ( (array!97491 (arr!47052 (Array (_ BitVec 32) (_ BitVec 64))) (size!47602 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97490)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431731 (= res!965608 (validKeyInArray!0 (select (arr!47052 a!2831) j!81)))))

(declare-fun b!1431732 () Bool)

(declare-fun e!808297 () Bool)

(assert (=> b!1431732 (= e!808297 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!630290 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431732 (= lt!630290 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!965605 () Bool)

(assert (=> start!123518 (=> (not res!965605) (not e!808301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123518 (= res!965605 (validMask!0 mask!2608))))

(assert (=> start!123518 e!808301))

(assert (=> start!123518 true))

(declare-fun array_inv!36080 (array!97490) Bool)

(assert (=> start!123518 (array_inv!36080 a!2831)))

(declare-fun b!1431733 () Bool)

(declare-fun res!965601 () Bool)

(assert (=> b!1431733 (=> (not res!965601) (not e!808301))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1431733 (= res!965601 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47602 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47602 a!2831))))))

(declare-fun b!1431734 () Bool)

(declare-fun e!808300 () Bool)

(assert (=> b!1431734 (= e!808301 e!808300)))

(declare-fun res!965596 () Bool)

(assert (=> b!1431734 (=> (not res!965596) (not e!808300))))

(declare-datatypes ((SeekEntryResult!11331 0))(
  ( (MissingZero!11331 (index!47716 (_ BitVec 32))) (Found!11331 (index!47717 (_ BitVec 32))) (Intermediate!11331 (undefined!12143 Bool) (index!47718 (_ BitVec 32)) (x!129365 (_ BitVec 32))) (Undefined!11331) (MissingVacant!11331 (index!47719 (_ BitVec 32))) )
))
(declare-fun lt!630292 () SeekEntryResult!11331)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97490 (_ BitVec 32)) SeekEntryResult!11331)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431734 (= res!965596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47052 a!2831) j!81) mask!2608) (select (arr!47052 a!2831) j!81) a!2831 mask!2608) lt!630292))))

(assert (=> b!1431734 (= lt!630292 (Intermediate!11331 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431735 () Bool)

(declare-fun res!965597 () Bool)

(declare-fun e!808298 () Bool)

(assert (=> b!1431735 (=> (not res!965597) (not e!808298))))

(assert (=> b!1431735 (= res!965597 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47052 a!2831) j!81) a!2831 mask!2608) lt!630292))))

(declare-fun b!1431736 () Bool)

(assert (=> b!1431736 (= e!808298 (not e!808297))))

(declare-fun res!965599 () Bool)

(assert (=> b!1431736 (=> res!965599 e!808297)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431736 (= res!965599 (or (= (select (arr!47052 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47052 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47052 a!2831) index!585) (select (arr!47052 a!2831) j!81)) (= (select (store (arr!47052 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808299 () Bool)

(assert (=> b!1431736 e!808299))

(declare-fun res!965600 () Bool)

(assert (=> b!1431736 (=> (not res!965600) (not e!808299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97490 (_ BitVec 32)) Bool)

(assert (=> b!1431736 (= res!965600 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48408 0))(
  ( (Unit!48409) )
))
(declare-fun lt!630289 () Unit!48408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48408)

(assert (=> b!1431736 (= lt!630289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431737 () Bool)

(assert (=> b!1431737 (= e!808300 e!808298)))

(declare-fun res!965607 () Bool)

(assert (=> b!1431737 (=> (not res!965607) (not e!808298))))

(declare-fun lt!630294 () SeekEntryResult!11331)

(declare-fun lt!630293 () array!97490)

(declare-fun lt!630291 () (_ BitVec 64))

(assert (=> b!1431737 (= res!965607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630291 mask!2608) lt!630291 lt!630293 mask!2608) lt!630294))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431737 (= lt!630294 (Intermediate!11331 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431737 (= lt!630291 (select (store (arr!47052 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431737 (= lt!630293 (array!97491 (store (arr!47052 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47602 a!2831)))))

(declare-fun b!1431738 () Bool)

(declare-fun res!965606 () Bool)

(assert (=> b!1431738 (=> (not res!965606) (not e!808301))))

(assert (=> b!1431738 (= res!965606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431739 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97490 (_ BitVec 32)) SeekEntryResult!11331)

(assert (=> b!1431739 (= e!808299 (= (seekEntryOrOpen!0 (select (arr!47052 a!2831) j!81) a!2831 mask!2608) (Found!11331 j!81)))))

(declare-fun b!1431740 () Bool)

(declare-fun res!965604 () Bool)

(assert (=> b!1431740 (=> (not res!965604) (not e!808301))))

(assert (=> b!1431740 (= res!965604 (and (= (size!47602 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47602 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47602 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431741 () Bool)

(declare-fun res!965595 () Bool)

(assert (=> b!1431741 (=> (not res!965595) (not e!808301))))

(assert (=> b!1431741 (= res!965595 (validKeyInArray!0 (select (arr!47052 a!2831) i!982)))))

(declare-fun b!1431742 () Bool)

(declare-fun res!965602 () Bool)

(assert (=> b!1431742 (=> (not res!965602) (not e!808298))))

(assert (=> b!1431742 (= res!965602 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431743 () Bool)

(declare-fun res!965603 () Bool)

(assert (=> b!1431743 (=> (not res!965603) (not e!808301))))

(declare-datatypes ((List!33562 0))(
  ( (Nil!33559) (Cons!33558 (h!34881 (_ BitVec 64)) (t!48256 List!33562)) )
))
(declare-fun arrayNoDuplicates!0 (array!97490 (_ BitVec 32) List!33562) Bool)

(assert (=> b!1431743 (= res!965603 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33559))))

(declare-fun b!1431744 () Bool)

(declare-fun res!965598 () Bool)

(assert (=> b!1431744 (=> (not res!965598) (not e!808298))))

(assert (=> b!1431744 (= res!965598 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630291 lt!630293 mask!2608) lt!630294))))

(assert (= (and start!123518 res!965605) b!1431740))

(assert (= (and b!1431740 res!965604) b!1431741))

(assert (= (and b!1431741 res!965595) b!1431731))

(assert (= (and b!1431731 res!965608) b!1431738))

(assert (= (and b!1431738 res!965606) b!1431743))

(assert (= (and b!1431743 res!965603) b!1431733))

(assert (= (and b!1431733 res!965601) b!1431734))

(assert (= (and b!1431734 res!965596) b!1431737))

(assert (= (and b!1431737 res!965607) b!1431735))

(assert (= (and b!1431735 res!965597) b!1431744))

(assert (= (and b!1431744 res!965598) b!1431742))

(assert (= (and b!1431742 res!965602) b!1431736))

(assert (= (and b!1431736 res!965600) b!1431739))

(assert (= (and b!1431736 (not res!965599)) b!1431732))

(declare-fun m!1321505 () Bool)

(assert (=> b!1431737 m!1321505))

(assert (=> b!1431737 m!1321505))

(declare-fun m!1321507 () Bool)

(assert (=> b!1431737 m!1321507))

(declare-fun m!1321509 () Bool)

(assert (=> b!1431737 m!1321509))

(declare-fun m!1321511 () Bool)

(assert (=> b!1431737 m!1321511))

(declare-fun m!1321513 () Bool)

(assert (=> b!1431731 m!1321513))

(assert (=> b!1431731 m!1321513))

(declare-fun m!1321515 () Bool)

(assert (=> b!1431731 m!1321515))

(assert (=> b!1431739 m!1321513))

(assert (=> b!1431739 m!1321513))

(declare-fun m!1321517 () Bool)

(assert (=> b!1431739 m!1321517))

(declare-fun m!1321519 () Bool)

(assert (=> b!1431738 m!1321519))

(declare-fun m!1321521 () Bool)

(assert (=> b!1431743 m!1321521))

(declare-fun m!1321523 () Bool)

(assert (=> start!123518 m!1321523))

(declare-fun m!1321525 () Bool)

(assert (=> start!123518 m!1321525))

(assert (=> b!1431735 m!1321513))

(assert (=> b!1431735 m!1321513))

(declare-fun m!1321527 () Bool)

(assert (=> b!1431735 m!1321527))

(declare-fun m!1321529 () Bool)

(assert (=> b!1431732 m!1321529))

(assert (=> b!1431736 m!1321509))

(declare-fun m!1321531 () Bool)

(assert (=> b!1431736 m!1321531))

(declare-fun m!1321533 () Bool)

(assert (=> b!1431736 m!1321533))

(declare-fun m!1321535 () Bool)

(assert (=> b!1431736 m!1321535))

(assert (=> b!1431736 m!1321513))

(declare-fun m!1321537 () Bool)

(assert (=> b!1431736 m!1321537))

(declare-fun m!1321539 () Bool)

(assert (=> b!1431744 m!1321539))

(assert (=> b!1431734 m!1321513))

(assert (=> b!1431734 m!1321513))

(declare-fun m!1321541 () Bool)

(assert (=> b!1431734 m!1321541))

(assert (=> b!1431734 m!1321541))

(assert (=> b!1431734 m!1321513))

(declare-fun m!1321543 () Bool)

(assert (=> b!1431734 m!1321543))

(declare-fun m!1321545 () Bool)

(assert (=> b!1431741 m!1321545))

(assert (=> b!1431741 m!1321545))

(declare-fun m!1321547 () Bool)

(assert (=> b!1431741 m!1321547))

(check-sat (not b!1431734) (not b!1431739) (not b!1431738) (not b!1431735) (not b!1431731) (not b!1431736) (not b!1431741) (not b!1431737) (not b!1431744) (not start!123518) (not b!1431732) (not b!1431743))
(check-sat)
