; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121976 () Bool)

(assert start!121976)

(declare-fun res!951685 () Bool)

(declare-fun e!801198 () Bool)

(assert (=> start!121976 (=> (not res!951685) (not e!801198))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121976 (= res!951685 (validMask!0 mask!2840))))

(assert (=> start!121976 e!801198))

(assert (=> start!121976 true))

(declare-datatypes ((array!96615 0))(
  ( (array!96616 (arr!46639 (Array (_ BitVec 32) (_ BitVec 64))) (size!47191 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96615)

(declare-fun array_inv!35872 (array!96615) Bool)

(assert (=> start!121976 (array_inv!35872 a!2901)))

(declare-fun b!1415585 () Bool)

(declare-fun res!951683 () Bool)

(assert (=> b!1415585 (=> (not res!951683) (not e!801198))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415585 (= res!951683 (validKeyInArray!0 (select (arr!46639 a!2901) i!1037)))))

(declare-fun b!1415586 () Bool)

(declare-fun res!951682 () Bool)

(assert (=> b!1415586 (=> (not res!951682) (not e!801198))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415586 (= res!951682 (validKeyInArray!0 (select (arr!46639 a!2901) j!112)))))

(declare-fun b!1415587 () Bool)

(declare-fun e!801200 () Bool)

(declare-fun e!801199 () Bool)

(assert (=> b!1415587 (= e!801200 e!801199)))

(declare-fun res!951681 () Bool)

(assert (=> b!1415587 (=> res!951681 e!801199)))

(declare-datatypes ((SeekEntryResult!10976 0))(
  ( (MissingZero!10976 (index!46296 (_ BitVec 32))) (Found!10976 (index!46297 (_ BitVec 32))) (Intermediate!10976 (undefined!11788 Bool) (index!46298 (_ BitVec 32)) (x!127900 (_ BitVec 32))) (Undefined!10976) (MissingVacant!10976 (index!46299 (_ BitVec 32))) )
))
(declare-fun lt!624115 () SeekEntryResult!10976)

(declare-fun lt!624112 () SeekEntryResult!10976)

(get-info :version)

(assert (=> b!1415587 (= res!951681 (or (= lt!624115 lt!624112) (not ((_ is Intermediate!10976) lt!624112))))))

(declare-fun lt!624116 () array!96615)

(declare-fun lt!624110 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96615 (_ BitVec 32)) SeekEntryResult!10976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415587 (= lt!624112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624110 mask!2840) lt!624110 lt!624116 mask!2840))))

(assert (=> b!1415587 (= lt!624110 (select (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415587 (= lt!624116 (array!96616 (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47191 a!2901)))))

(declare-fun b!1415588 () Bool)

(declare-fun res!951687 () Bool)

(assert (=> b!1415588 (=> (not res!951687) (not e!801198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96615 (_ BitVec 32)) Bool)

(assert (=> b!1415588 (= res!951687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!801196 () Bool)

(declare-fun b!1415589 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96615 (_ BitVec 32)) SeekEntryResult!10976)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96615 (_ BitVec 32)) SeekEntryResult!10976)

(assert (=> b!1415589 (= e!801196 (= (seekEntryOrOpen!0 lt!624110 lt!624116 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127900 lt!624112) (index!46298 lt!624112) (index!46298 lt!624112) (select (arr!46639 a!2901) j!112) lt!624116 mask!2840)))))

(declare-fun b!1415590 () Bool)

(assert (=> b!1415590 (= e!801198 (not e!801200))))

(declare-fun res!951680 () Bool)

(assert (=> b!1415590 (=> res!951680 e!801200)))

(assert (=> b!1415590 (= res!951680 (or (not ((_ is Intermediate!10976) lt!624115)) (undefined!11788 lt!624115)))))

(declare-fun e!801194 () Bool)

(assert (=> b!1415590 e!801194))

(declare-fun res!951686 () Bool)

(assert (=> b!1415590 (=> (not res!951686) (not e!801194))))

(assert (=> b!1415590 (= res!951686 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47769 0))(
  ( (Unit!47770) )
))
(declare-fun lt!624113 () Unit!47769)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47769)

(assert (=> b!1415590 (= lt!624113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624114 () (_ BitVec 32))

(assert (=> b!1415590 (= lt!624115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624114 (select (arr!46639 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415590 (= lt!624114 (toIndex!0 (select (arr!46639 a!2901) j!112) mask!2840))))

(declare-fun b!1415591 () Bool)

(declare-fun e!801195 () Bool)

(assert (=> b!1415591 (= e!801199 e!801195)))

(declare-fun res!951678 () Bool)

(assert (=> b!1415591 (=> res!951678 e!801195)))

(assert (=> b!1415591 (= res!951678 (or (bvslt (x!127900 lt!624115) #b00000000000000000000000000000000) (bvsgt (x!127900 lt!624115) #b01111111111111111111111111111110) (bvslt (x!127900 lt!624112) #b00000000000000000000000000000000) (bvsgt (x!127900 lt!624112) #b01111111111111111111111111111110) (bvslt lt!624114 #b00000000000000000000000000000000) (bvsge lt!624114 (size!47191 a!2901)) (bvslt (index!46298 lt!624115) #b00000000000000000000000000000000) (bvsge (index!46298 lt!624115) (size!47191 a!2901)) (bvslt (index!46298 lt!624112) #b00000000000000000000000000000000) (bvsge (index!46298 lt!624112) (size!47191 a!2901)) (not (= lt!624115 (Intermediate!10976 false (index!46298 lt!624115) (x!127900 lt!624115)))) (not (= lt!624112 (Intermediate!10976 false (index!46298 lt!624112) (x!127900 lt!624112))))))))

(assert (=> b!1415591 e!801196))

(declare-fun res!951679 () Bool)

(assert (=> b!1415591 (=> (not res!951679) (not e!801196))))

(assert (=> b!1415591 (= res!951679 (and (not (undefined!11788 lt!624112)) (= (index!46298 lt!624112) i!1037) (bvslt (x!127900 lt!624112) (x!127900 lt!624115)) (= (select (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46298 lt!624112)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624111 () Unit!47769)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47769)

(assert (=> b!1415591 (= lt!624111 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624114 (x!127900 lt!624115) (index!46298 lt!624115) (x!127900 lt!624112) (index!46298 lt!624112) (undefined!11788 lt!624112) mask!2840))))

(declare-fun b!1415592 () Bool)

(assert (=> b!1415592 (= e!801194 (= (seekEntryOrOpen!0 (select (arr!46639 a!2901) j!112) a!2901 mask!2840) (Found!10976 j!112)))))

(declare-fun b!1415593 () Bool)

(declare-fun res!951684 () Bool)

(assert (=> b!1415593 (=> (not res!951684) (not e!801198))))

(assert (=> b!1415593 (= res!951684 (and (= (size!47191 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47191 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47191 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415594 () Bool)

(assert (=> b!1415594 (= e!801195 (= lt!624112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624114 lt!624110 lt!624116 mask!2840)))))

(declare-fun b!1415595 () Bool)

(declare-fun res!951688 () Bool)

(assert (=> b!1415595 (=> (not res!951688) (not e!801198))))

(declare-datatypes ((List!33236 0))(
  ( (Nil!33233) (Cons!33232 (h!34519 (_ BitVec 64)) (t!47922 List!33236)) )
))
(declare-fun arrayNoDuplicates!0 (array!96615 (_ BitVec 32) List!33236) Bool)

(assert (=> b!1415595 (= res!951688 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33233))))

(assert (= (and start!121976 res!951685) b!1415593))

(assert (= (and b!1415593 res!951684) b!1415585))

(assert (= (and b!1415585 res!951683) b!1415586))

(assert (= (and b!1415586 res!951682) b!1415588))

(assert (= (and b!1415588 res!951687) b!1415595))

(assert (= (and b!1415595 res!951688) b!1415590))

(assert (= (and b!1415590 res!951686) b!1415592))

(assert (= (and b!1415590 (not res!951680)) b!1415587))

(assert (= (and b!1415587 (not res!951681)) b!1415591))

(assert (= (and b!1415591 res!951679) b!1415589))

(assert (= (and b!1415591 (not res!951678)) b!1415594))

(declare-fun m!1305499 () Bool)

(assert (=> b!1415587 m!1305499))

(assert (=> b!1415587 m!1305499))

(declare-fun m!1305501 () Bool)

(assert (=> b!1415587 m!1305501))

(declare-fun m!1305503 () Bool)

(assert (=> b!1415587 m!1305503))

(declare-fun m!1305505 () Bool)

(assert (=> b!1415587 m!1305505))

(declare-fun m!1305507 () Bool)

(assert (=> b!1415589 m!1305507))

(declare-fun m!1305509 () Bool)

(assert (=> b!1415589 m!1305509))

(assert (=> b!1415589 m!1305509))

(declare-fun m!1305511 () Bool)

(assert (=> b!1415589 m!1305511))

(assert (=> b!1415586 m!1305509))

(assert (=> b!1415586 m!1305509))

(declare-fun m!1305513 () Bool)

(assert (=> b!1415586 m!1305513))

(declare-fun m!1305515 () Bool)

(assert (=> b!1415595 m!1305515))

(declare-fun m!1305517 () Bool)

(assert (=> b!1415588 m!1305517))

(declare-fun m!1305519 () Bool)

(assert (=> b!1415594 m!1305519))

(assert (=> b!1415590 m!1305509))

(declare-fun m!1305521 () Bool)

(assert (=> b!1415590 m!1305521))

(assert (=> b!1415590 m!1305509))

(declare-fun m!1305523 () Bool)

(assert (=> b!1415590 m!1305523))

(assert (=> b!1415590 m!1305509))

(declare-fun m!1305525 () Bool)

(assert (=> b!1415590 m!1305525))

(declare-fun m!1305527 () Bool)

(assert (=> b!1415590 m!1305527))

(declare-fun m!1305529 () Bool)

(assert (=> b!1415585 m!1305529))

(assert (=> b!1415585 m!1305529))

(declare-fun m!1305531 () Bool)

(assert (=> b!1415585 m!1305531))

(declare-fun m!1305533 () Bool)

(assert (=> start!121976 m!1305533))

(declare-fun m!1305535 () Bool)

(assert (=> start!121976 m!1305535))

(assert (=> b!1415591 m!1305503))

(declare-fun m!1305537 () Bool)

(assert (=> b!1415591 m!1305537))

(declare-fun m!1305539 () Bool)

(assert (=> b!1415591 m!1305539))

(assert (=> b!1415592 m!1305509))

(assert (=> b!1415592 m!1305509))

(declare-fun m!1305541 () Bool)

(assert (=> b!1415592 m!1305541))

(check-sat (not start!121976) (not b!1415591) (not b!1415585) (not b!1415589) (not b!1415586) (not b!1415590) (not b!1415587) (not b!1415592) (not b!1415595) (not b!1415588) (not b!1415594))
(check-sat)
