; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123146 () Bool)

(assert start!123146)

(declare-fun b!1427850 () Bool)

(declare-fun res!962741 () Bool)

(declare-fun e!806449 () Bool)

(assert (=> b!1427850 (=> (not res!962741) (not e!806449))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11275 0))(
  ( (MissingZero!11275 (index!47492 (_ BitVec 32))) (Found!11275 (index!47493 (_ BitVec 32))) (Intermediate!11275 (undefined!12087 Bool) (index!47494 (_ BitVec 32)) (x!129124 (_ BitVec 32))) (Undefined!11275) (MissingVacant!11275 (index!47495 (_ BitVec 32))) )
))
(declare-fun lt!628584 () SeekEntryResult!11275)

(declare-datatypes ((array!97311 0))(
  ( (array!97312 (arr!46969 (Array (_ BitVec 32) (_ BitVec 64))) (size!47521 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97311)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97311 (_ BitVec 32)) SeekEntryResult!11275)

(assert (=> b!1427850 (= res!962741 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46969 a!2831) j!81) a!2831 mask!2608) lt!628584))))

(declare-fun b!1427851 () Bool)

(declare-fun res!962731 () Bool)

(declare-fun e!806451 () Bool)

(assert (=> b!1427851 (=> (not res!962731) (not e!806451))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427851 (= res!962731 (validKeyInArray!0 (select (arr!46969 a!2831) i!982)))))

(declare-fun b!1427852 () Bool)

(declare-fun res!962735 () Bool)

(assert (=> b!1427852 (=> (not res!962735) (not e!806451))))

(assert (=> b!1427852 (= res!962735 (and (= (size!47521 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47521 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47521 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427853 () Bool)

(declare-fun res!962738 () Bool)

(assert (=> b!1427853 (=> (not res!962738) (not e!806451))))

(assert (=> b!1427853 (= res!962738 (validKeyInArray!0 (select (arr!46969 a!2831) j!81)))))

(declare-fun b!1427854 () Bool)

(declare-fun e!806453 () Bool)

(assert (=> b!1427854 (= e!806451 e!806453)))

(declare-fun res!962739 () Bool)

(assert (=> b!1427854 (=> (not res!962739) (not e!806453))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427854 (= res!962739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46969 a!2831) j!81) mask!2608) (select (arr!46969 a!2831) j!81) a!2831 mask!2608) lt!628584))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427854 (= lt!628584 (Intermediate!11275 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427856 () Bool)

(declare-fun res!962732 () Bool)

(assert (=> b!1427856 (=> (not res!962732) (not e!806451))))

(assert (=> b!1427856 (= res!962732 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47521 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47521 a!2831))))))

(declare-fun b!1427857 () Bool)

(declare-fun res!962734 () Bool)

(assert (=> b!1427857 (=> (not res!962734) (not e!806451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97311 (_ BitVec 32)) Bool)

(assert (=> b!1427857 (= res!962734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427858 () Bool)

(declare-fun res!962742 () Bool)

(assert (=> b!1427858 (=> (not res!962742) (not e!806449))))

(declare-fun lt!628582 () (_ BitVec 64))

(declare-fun lt!628583 () array!97311)

(declare-fun lt!628586 () SeekEntryResult!11275)

(assert (=> b!1427858 (= res!962742 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628582 lt!628583 mask!2608) lt!628586))))

(declare-fun b!1427859 () Bool)

(assert (=> b!1427859 (= e!806449 (not true))))

(declare-fun e!806452 () Bool)

(assert (=> b!1427859 e!806452))

(declare-fun res!962736 () Bool)

(assert (=> b!1427859 (=> (not res!962736) (not e!806452))))

(assert (=> b!1427859 (= res!962736 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48135 0))(
  ( (Unit!48136) )
))
(declare-fun lt!628585 () Unit!48135)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48135)

(assert (=> b!1427859 (= lt!628585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427860 () Bool)

(assert (=> b!1427860 (= e!806453 e!806449)))

(declare-fun res!962740 () Bool)

(assert (=> b!1427860 (=> (not res!962740) (not e!806449))))

(assert (=> b!1427860 (= res!962740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628582 mask!2608) lt!628582 lt!628583 mask!2608) lt!628586))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427860 (= lt!628586 (Intermediate!11275 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427860 (= lt!628582 (select (store (arr!46969 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427860 (= lt!628583 (array!97312 (store (arr!46969 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47521 a!2831)))))

(declare-fun b!1427861 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97311 (_ BitVec 32)) SeekEntryResult!11275)

(assert (=> b!1427861 (= e!806452 (= (seekEntryOrOpen!0 (select (arr!46969 a!2831) j!81) a!2831 mask!2608) (Found!11275 j!81)))))

(declare-fun b!1427862 () Bool)

(declare-fun res!962733 () Bool)

(assert (=> b!1427862 (=> (not res!962733) (not e!806451))))

(declare-datatypes ((List!33557 0))(
  ( (Nil!33554) (Cons!33553 (h!34864 (_ BitVec 64)) (t!48243 List!33557)) )
))
(declare-fun arrayNoDuplicates!0 (array!97311 (_ BitVec 32) List!33557) Bool)

(assert (=> b!1427862 (= res!962733 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33554))))

(declare-fun b!1427855 () Bool)

(declare-fun res!962743 () Bool)

(assert (=> b!1427855 (=> (not res!962743) (not e!806449))))

(assert (=> b!1427855 (= res!962743 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!962737 () Bool)

(assert (=> start!123146 (=> (not res!962737) (not e!806451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123146 (= res!962737 (validMask!0 mask!2608))))

(assert (=> start!123146 e!806451))

(assert (=> start!123146 true))

(declare-fun array_inv!36202 (array!97311) Bool)

(assert (=> start!123146 (array_inv!36202 a!2831)))

(assert (= (and start!123146 res!962737) b!1427852))

(assert (= (and b!1427852 res!962735) b!1427851))

(assert (= (and b!1427851 res!962731) b!1427853))

(assert (= (and b!1427853 res!962738) b!1427857))

(assert (= (and b!1427857 res!962734) b!1427862))

(assert (= (and b!1427862 res!962733) b!1427856))

(assert (= (and b!1427856 res!962732) b!1427854))

(assert (= (and b!1427854 res!962739) b!1427860))

(assert (= (and b!1427860 res!962740) b!1427850))

(assert (= (and b!1427850 res!962741) b!1427858))

(assert (= (and b!1427858 res!962742) b!1427855))

(assert (= (and b!1427855 res!962743) b!1427859))

(assert (= (and b!1427859 res!962736) b!1427861))

(declare-fun m!1317627 () Bool)

(assert (=> b!1427854 m!1317627))

(assert (=> b!1427854 m!1317627))

(declare-fun m!1317629 () Bool)

(assert (=> b!1427854 m!1317629))

(assert (=> b!1427854 m!1317629))

(assert (=> b!1427854 m!1317627))

(declare-fun m!1317631 () Bool)

(assert (=> b!1427854 m!1317631))

(assert (=> b!1427850 m!1317627))

(assert (=> b!1427850 m!1317627))

(declare-fun m!1317633 () Bool)

(assert (=> b!1427850 m!1317633))

(declare-fun m!1317635 () Bool)

(assert (=> b!1427860 m!1317635))

(assert (=> b!1427860 m!1317635))

(declare-fun m!1317637 () Bool)

(assert (=> b!1427860 m!1317637))

(declare-fun m!1317639 () Bool)

(assert (=> b!1427860 m!1317639))

(declare-fun m!1317641 () Bool)

(assert (=> b!1427860 m!1317641))

(declare-fun m!1317643 () Bool)

(assert (=> b!1427862 m!1317643))

(declare-fun m!1317645 () Bool)

(assert (=> b!1427857 m!1317645))

(assert (=> b!1427853 m!1317627))

(assert (=> b!1427853 m!1317627))

(declare-fun m!1317647 () Bool)

(assert (=> b!1427853 m!1317647))

(declare-fun m!1317649 () Bool)

(assert (=> b!1427851 m!1317649))

(assert (=> b!1427851 m!1317649))

(declare-fun m!1317651 () Bool)

(assert (=> b!1427851 m!1317651))

(declare-fun m!1317653 () Bool)

(assert (=> b!1427859 m!1317653))

(declare-fun m!1317655 () Bool)

(assert (=> b!1427859 m!1317655))

(assert (=> b!1427861 m!1317627))

(assert (=> b!1427861 m!1317627))

(declare-fun m!1317657 () Bool)

(assert (=> b!1427861 m!1317657))

(declare-fun m!1317659 () Bool)

(assert (=> b!1427858 m!1317659))

(declare-fun m!1317661 () Bool)

(assert (=> start!123146 m!1317661))

(declare-fun m!1317663 () Bool)

(assert (=> start!123146 m!1317663))

(check-sat (not b!1427850) (not b!1427861) (not b!1427857) (not b!1427851) (not b!1427860) (not b!1427854) (not b!1427859) (not start!123146) (not b!1427858) (not b!1427853) (not b!1427862))
(check-sat)
