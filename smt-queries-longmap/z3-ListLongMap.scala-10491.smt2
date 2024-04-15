; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123506 () Bool)

(assert start!123506)

(declare-fun b!1431647 () Bool)

(declare-fun res!965626 () Bool)

(declare-fun e!808238 () Bool)

(assert (=> b!1431647 (=> (not res!965626) (not e!808238))))

(declare-datatypes ((array!97443 0))(
  ( (array!97444 (arr!47029 (Array (_ BitVec 32) (_ BitVec 64))) (size!47581 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97443)

(declare-datatypes ((List!33617 0))(
  ( (Nil!33614) (Cons!33613 (h!34936 (_ BitVec 64)) (t!48303 List!33617)) )
))
(declare-fun arrayNoDuplicates!0 (array!97443 (_ BitVec 32) List!33617) Bool)

(assert (=> b!1431647 (= res!965626 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33614))))

(declare-fun b!1431648 () Bool)

(declare-fun res!965621 () Bool)

(assert (=> b!1431648 (=> (not res!965621) (not e!808238))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431648 (= res!965621 (and (= (size!47581 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47581 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47581 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431649 () Bool)

(declare-fun res!965629 () Bool)

(assert (=> b!1431649 (=> (not res!965629) (not e!808238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97443 (_ BitVec 32)) Bool)

(assert (=> b!1431649 (= res!965629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431650 () Bool)

(declare-fun res!965624 () Bool)

(declare-fun e!808242 () Bool)

(assert (=> b!1431650 (=> (not res!965624) (not e!808242))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431650 (= res!965624 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431651 () Bool)

(declare-fun e!808241 () Bool)

(assert (=> b!1431651 (= e!808242 (not e!808241))))

(declare-fun res!965625 () Bool)

(assert (=> b!1431651 (=> res!965625 e!808241)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1431651 (= res!965625 (or (= (select (arr!47029 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47029 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47029 a!2831) index!585) (select (arr!47029 a!2831) j!81)) (= (select (store (arr!47029 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808240 () Bool)

(assert (=> b!1431651 e!808240))

(declare-fun res!965618 () Bool)

(assert (=> b!1431651 (=> (not res!965618) (not e!808240))))

(assert (=> b!1431651 (= res!965618 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48255 0))(
  ( (Unit!48256) )
))
(declare-fun lt!630105 () Unit!48255)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48255)

(assert (=> b!1431651 (= lt!630105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431652 () Bool)

(declare-fun res!965620 () Bool)

(assert (=> b!1431652 (=> (not res!965620) (not e!808242))))

(declare-datatypes ((SeekEntryResult!11335 0))(
  ( (MissingZero!11335 (index!47732 (_ BitVec 32))) (Found!11335 (index!47733 (_ BitVec 32))) (Intermediate!11335 (undefined!12147 Bool) (index!47734 (_ BitVec 32)) (x!129372 (_ BitVec 32))) (Undefined!11335) (MissingVacant!11335 (index!47735 (_ BitVec 32))) )
))
(declare-fun lt!630103 () SeekEntryResult!11335)

(declare-fun lt!630101 () array!97443)

(declare-fun lt!630100 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97443 (_ BitVec 32)) SeekEntryResult!11335)

(assert (=> b!1431652 (= res!965620 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630100 lt!630101 mask!2608) lt!630103))))

(declare-fun b!1431653 () Bool)

(declare-fun e!808239 () Bool)

(assert (=> b!1431653 (= e!808238 e!808239)))

(declare-fun res!965622 () Bool)

(assert (=> b!1431653 (=> (not res!965622) (not e!808239))))

(declare-fun lt!630104 () SeekEntryResult!11335)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431653 (= res!965622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47029 a!2831) j!81) mask!2608) (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!630104))))

(assert (=> b!1431653 (= lt!630104 (Intermediate!11335 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431655 () Bool)

(declare-fun res!965619 () Bool)

(assert (=> b!1431655 (=> (not res!965619) (not e!808238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431655 (= res!965619 (validKeyInArray!0 (select (arr!47029 a!2831) j!81)))))

(declare-fun b!1431656 () Bool)

(assert (=> b!1431656 (= e!808239 e!808242)))

(declare-fun res!965627 () Bool)

(assert (=> b!1431656 (=> (not res!965627) (not e!808242))))

(assert (=> b!1431656 (= res!965627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630100 mask!2608) lt!630100 lt!630101 mask!2608) lt!630103))))

(assert (=> b!1431656 (= lt!630103 (Intermediate!11335 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431656 (= lt!630100 (select (store (arr!47029 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431656 (= lt!630101 (array!97444 (store (arr!47029 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47581 a!2831)))))

(declare-fun b!1431657 () Bool)

(declare-fun res!965628 () Bool)

(assert (=> b!1431657 (=> (not res!965628) (not e!808238))))

(assert (=> b!1431657 (= res!965628 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47581 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47581 a!2831))))))

(declare-fun b!1431658 () Bool)

(declare-fun res!965617 () Bool)

(assert (=> b!1431658 (=> (not res!965617) (not e!808242))))

(assert (=> b!1431658 (= res!965617 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) lt!630104))))

(declare-fun b!1431654 () Bool)

(assert (=> b!1431654 (= e!808241 true)))

(declare-fun lt!630102 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431654 (= lt!630102 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!965623 () Bool)

(assert (=> start!123506 (=> (not res!965623) (not e!808238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123506 (= res!965623 (validMask!0 mask!2608))))

(assert (=> start!123506 e!808238))

(assert (=> start!123506 true))

(declare-fun array_inv!36262 (array!97443) Bool)

(assert (=> start!123506 (array_inv!36262 a!2831)))

(declare-fun b!1431659 () Bool)

(declare-fun res!965616 () Bool)

(assert (=> b!1431659 (=> (not res!965616) (not e!808238))))

(assert (=> b!1431659 (= res!965616 (validKeyInArray!0 (select (arr!47029 a!2831) i!982)))))

(declare-fun b!1431660 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97443 (_ BitVec 32)) SeekEntryResult!11335)

(assert (=> b!1431660 (= e!808240 (= (seekEntryOrOpen!0 (select (arr!47029 a!2831) j!81) a!2831 mask!2608) (Found!11335 j!81)))))

(assert (= (and start!123506 res!965623) b!1431648))

(assert (= (and b!1431648 res!965621) b!1431659))

(assert (= (and b!1431659 res!965616) b!1431655))

(assert (= (and b!1431655 res!965619) b!1431649))

(assert (= (and b!1431649 res!965629) b!1431647))

(assert (= (and b!1431647 res!965626) b!1431657))

(assert (= (and b!1431657 res!965628) b!1431653))

(assert (= (and b!1431653 res!965622) b!1431656))

(assert (= (and b!1431656 res!965627) b!1431658))

(assert (= (and b!1431658 res!965617) b!1431652))

(assert (= (and b!1431652 res!965620) b!1431650))

(assert (= (and b!1431650 res!965624) b!1431651))

(assert (= (and b!1431651 res!965618) b!1431660))

(assert (= (and b!1431651 (not res!965625)) b!1431654))

(declare-fun m!1320941 () Bool)

(assert (=> b!1431660 m!1320941))

(assert (=> b!1431660 m!1320941))

(declare-fun m!1320943 () Bool)

(assert (=> b!1431660 m!1320943))

(assert (=> b!1431658 m!1320941))

(assert (=> b!1431658 m!1320941))

(declare-fun m!1320945 () Bool)

(assert (=> b!1431658 m!1320945))

(declare-fun m!1320947 () Bool)

(assert (=> b!1431647 m!1320947))

(declare-fun m!1320949 () Bool)

(assert (=> b!1431656 m!1320949))

(assert (=> b!1431656 m!1320949))

(declare-fun m!1320951 () Bool)

(assert (=> b!1431656 m!1320951))

(declare-fun m!1320953 () Bool)

(assert (=> b!1431656 m!1320953))

(declare-fun m!1320955 () Bool)

(assert (=> b!1431656 m!1320955))

(declare-fun m!1320957 () Bool)

(assert (=> b!1431649 m!1320957))

(declare-fun m!1320959 () Bool)

(assert (=> b!1431654 m!1320959))

(assert (=> b!1431651 m!1320953))

(declare-fun m!1320961 () Bool)

(assert (=> b!1431651 m!1320961))

(declare-fun m!1320963 () Bool)

(assert (=> b!1431651 m!1320963))

(declare-fun m!1320965 () Bool)

(assert (=> b!1431651 m!1320965))

(assert (=> b!1431651 m!1320941))

(declare-fun m!1320967 () Bool)

(assert (=> b!1431651 m!1320967))

(assert (=> b!1431653 m!1320941))

(assert (=> b!1431653 m!1320941))

(declare-fun m!1320969 () Bool)

(assert (=> b!1431653 m!1320969))

(assert (=> b!1431653 m!1320969))

(assert (=> b!1431653 m!1320941))

(declare-fun m!1320971 () Bool)

(assert (=> b!1431653 m!1320971))

(assert (=> b!1431655 m!1320941))

(assert (=> b!1431655 m!1320941))

(declare-fun m!1320973 () Bool)

(assert (=> b!1431655 m!1320973))

(declare-fun m!1320975 () Bool)

(assert (=> b!1431659 m!1320975))

(assert (=> b!1431659 m!1320975))

(declare-fun m!1320977 () Bool)

(assert (=> b!1431659 m!1320977))

(declare-fun m!1320979 () Bool)

(assert (=> start!123506 m!1320979))

(declare-fun m!1320981 () Bool)

(assert (=> start!123506 m!1320981))

(declare-fun m!1320983 () Bool)

(assert (=> b!1431652 m!1320983))

(check-sat (not b!1431658) (not b!1431654) (not b!1431652) (not b!1431655) (not b!1431656) (not b!1431647) (not b!1431649) (not b!1431660) (not b!1431659) (not b!1431651) (not b!1431653) (not start!123506))
(check-sat)
