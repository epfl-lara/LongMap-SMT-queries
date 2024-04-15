; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123008 () Bool)

(assert start!123008)

(declare-fun b!1426647 () Bool)

(declare-fun res!961932 () Bool)

(declare-fun e!805848 () Bool)

(assert (=> b!1426647 (=> (not res!961932) (not e!805848))))

(declare-datatypes ((array!97275 0))(
  ( (array!97276 (arr!46954 (Array (_ BitVec 32) (_ BitVec 64))) (size!47506 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97275)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1426647 (= res!961932 (and (= (size!47506 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47506 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47506 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!961942 () Bool)

(assert (=> start!123008 (=> (not res!961942) (not e!805848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123008 (= res!961942 (validMask!0 mask!2608))))

(assert (=> start!123008 e!805848))

(assert (=> start!123008 true))

(declare-fun array_inv!36187 (array!97275) Bool)

(assert (=> start!123008 (array_inv!36187 a!2831)))

(declare-fun b!1426648 () Bool)

(declare-fun res!961937 () Bool)

(assert (=> b!1426648 (=> (not res!961937) (not e!805848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426648 (= res!961937 (validKeyInArray!0 (select (arr!46954 a!2831) i!982)))))

(declare-fun b!1426649 () Bool)

(declare-fun e!805850 () Bool)

(declare-fun e!805846 () Bool)

(assert (=> b!1426649 (= e!805850 e!805846)))

(declare-fun res!961931 () Bool)

(assert (=> b!1426649 (=> (not res!961931) (not e!805846))))

(declare-fun lt!628096 () array!97275)

(declare-fun lt!628097 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11260 0))(
  ( (MissingZero!11260 (index!47432 (_ BitVec 32))) (Found!11260 (index!47433 (_ BitVec 32))) (Intermediate!11260 (undefined!12072 Bool) (index!47434 (_ BitVec 32)) (x!129057 (_ BitVec 32))) (Undefined!11260) (MissingVacant!11260 (index!47435 (_ BitVec 32))) )
))
(declare-fun lt!628095 () SeekEntryResult!11260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97275 (_ BitVec 32)) SeekEntryResult!11260)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426649 (= res!961931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628097 mask!2608) lt!628097 lt!628096 mask!2608) lt!628095))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426649 (= lt!628095 (Intermediate!11260 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426649 (= lt!628097 (select (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426649 (= lt!628096 (array!97276 (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47506 a!2831)))))

(declare-fun b!1426650 () Bool)

(declare-fun res!961935 () Bool)

(assert (=> b!1426650 (=> (not res!961935) (not e!805846))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1426650 (= res!961935 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426651 () Bool)

(declare-fun res!961938 () Bool)

(assert (=> b!1426651 (=> (not res!961938) (not e!805846))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426651 (= res!961938 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628097 lt!628096 mask!2608) lt!628095))))

(declare-fun b!1426652 () Bool)

(assert (=> b!1426652 (= e!805848 e!805850)))

(declare-fun res!961940 () Bool)

(assert (=> b!1426652 (=> (not res!961940) (not e!805850))))

(declare-fun lt!628094 () SeekEntryResult!11260)

(assert (=> b!1426652 (= res!961940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46954 a!2831) j!81) mask!2608) (select (arr!46954 a!2831) j!81) a!2831 mask!2608) lt!628094))))

(assert (=> b!1426652 (= lt!628094 (Intermediate!11260 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426653 () Bool)

(assert (=> b!1426653 (= e!805846 (not true))))

(declare-fun e!805849 () Bool)

(assert (=> b!1426653 e!805849))

(declare-fun res!961941 () Bool)

(assert (=> b!1426653 (=> (not res!961941) (not e!805849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97275 (_ BitVec 32)) Bool)

(assert (=> b!1426653 (= res!961941 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48105 0))(
  ( (Unit!48106) )
))
(declare-fun lt!628093 () Unit!48105)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48105)

(assert (=> b!1426653 (= lt!628093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426654 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97275 (_ BitVec 32)) SeekEntryResult!11260)

(assert (=> b!1426654 (= e!805849 (= (seekEntryOrOpen!0 (select (arr!46954 a!2831) j!81) a!2831 mask!2608) (Found!11260 j!81)))))

(declare-fun b!1426655 () Bool)

(declare-fun res!961936 () Bool)

(assert (=> b!1426655 (=> (not res!961936) (not e!805848))))

(assert (=> b!1426655 (= res!961936 (validKeyInArray!0 (select (arr!46954 a!2831) j!81)))))

(declare-fun b!1426656 () Bool)

(declare-fun res!961930 () Bool)

(assert (=> b!1426656 (=> (not res!961930) (not e!805848))))

(declare-datatypes ((List!33542 0))(
  ( (Nil!33539) (Cons!33538 (h!34843 (_ BitVec 64)) (t!48228 List!33542)) )
))
(declare-fun arrayNoDuplicates!0 (array!97275 (_ BitVec 32) List!33542) Bool)

(assert (=> b!1426656 (= res!961930 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33539))))

(declare-fun b!1426657 () Bool)

(declare-fun res!961933 () Bool)

(assert (=> b!1426657 (=> (not res!961933) (not e!805848))))

(assert (=> b!1426657 (= res!961933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426658 () Bool)

(declare-fun res!961939 () Bool)

(assert (=> b!1426658 (=> (not res!961939) (not e!805848))))

(assert (=> b!1426658 (= res!961939 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47506 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47506 a!2831))))))

(declare-fun b!1426659 () Bool)

(declare-fun res!961934 () Bool)

(assert (=> b!1426659 (=> (not res!961934) (not e!805846))))

(assert (=> b!1426659 (= res!961934 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46954 a!2831) j!81) a!2831 mask!2608) lt!628094))))

(assert (= (and start!123008 res!961942) b!1426647))

(assert (= (and b!1426647 res!961932) b!1426648))

(assert (= (and b!1426648 res!961937) b!1426655))

(assert (= (and b!1426655 res!961936) b!1426657))

(assert (= (and b!1426657 res!961933) b!1426656))

(assert (= (and b!1426656 res!961930) b!1426658))

(assert (= (and b!1426658 res!961939) b!1426652))

(assert (= (and b!1426652 res!961940) b!1426649))

(assert (= (and b!1426649 res!961931) b!1426659))

(assert (= (and b!1426659 res!961934) b!1426651))

(assert (= (and b!1426651 res!961938) b!1426650))

(assert (= (and b!1426650 res!961935) b!1426653))

(assert (= (and b!1426653 res!961941) b!1426654))

(declare-fun m!1316673 () Bool)

(assert (=> start!123008 m!1316673))

(declare-fun m!1316675 () Bool)

(assert (=> start!123008 m!1316675))

(declare-fun m!1316677 () Bool)

(assert (=> b!1426648 m!1316677))

(assert (=> b!1426648 m!1316677))

(declare-fun m!1316679 () Bool)

(assert (=> b!1426648 m!1316679))

(declare-fun m!1316681 () Bool)

(assert (=> b!1426657 m!1316681))

(declare-fun m!1316683 () Bool)

(assert (=> b!1426656 m!1316683))

(declare-fun m!1316685 () Bool)

(assert (=> b!1426654 m!1316685))

(assert (=> b!1426654 m!1316685))

(declare-fun m!1316687 () Bool)

(assert (=> b!1426654 m!1316687))

(assert (=> b!1426659 m!1316685))

(assert (=> b!1426659 m!1316685))

(declare-fun m!1316689 () Bool)

(assert (=> b!1426659 m!1316689))

(declare-fun m!1316691 () Bool)

(assert (=> b!1426649 m!1316691))

(assert (=> b!1426649 m!1316691))

(declare-fun m!1316693 () Bool)

(assert (=> b!1426649 m!1316693))

(declare-fun m!1316695 () Bool)

(assert (=> b!1426649 m!1316695))

(declare-fun m!1316697 () Bool)

(assert (=> b!1426649 m!1316697))

(assert (=> b!1426652 m!1316685))

(assert (=> b!1426652 m!1316685))

(declare-fun m!1316699 () Bool)

(assert (=> b!1426652 m!1316699))

(assert (=> b!1426652 m!1316699))

(assert (=> b!1426652 m!1316685))

(declare-fun m!1316701 () Bool)

(assert (=> b!1426652 m!1316701))

(declare-fun m!1316703 () Bool)

(assert (=> b!1426653 m!1316703))

(declare-fun m!1316705 () Bool)

(assert (=> b!1426653 m!1316705))

(declare-fun m!1316707 () Bool)

(assert (=> b!1426651 m!1316707))

(assert (=> b!1426655 m!1316685))

(assert (=> b!1426655 m!1316685))

(declare-fun m!1316709 () Bool)

(assert (=> b!1426655 m!1316709))

(check-sat (not b!1426659) (not b!1426649) (not b!1426652) (not b!1426654) (not b!1426651) (not b!1426648) (not b!1426657) (not b!1426656) (not b!1426655) (not b!1426653) (not start!123008))
(check-sat)
