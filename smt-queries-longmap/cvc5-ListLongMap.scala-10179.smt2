; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120000 () Bool)

(assert start!120000)

(declare-fun res!935873 () Bool)

(declare-fun e!790867 () Bool)

(assert (=> start!120000 (=> (not res!935873) (not e!790867))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120000 (= res!935873 (validMask!0 mask!2840))))

(assert (=> start!120000 e!790867))

(assert (=> start!120000 true))

(declare-datatypes ((array!95529 0))(
  ( (array!95530 (arr!46118 (Array (_ BitVec 32) (_ BitVec 64))) (size!46668 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95529)

(declare-fun array_inv!35146 (array!95529) Bool)

(assert (=> start!120000 (array_inv!35146 a!2901)))

(declare-fun b!1396960 () Bool)

(declare-fun e!790866 () Bool)

(assert (=> b!1396960 (= e!790867 (not e!790866))))

(declare-fun res!935875 () Bool)

(assert (=> b!1396960 (=> res!935875 e!790866)))

(declare-datatypes ((SeekEntryResult!10435 0))(
  ( (MissingZero!10435 (index!44111 (_ BitVec 32))) (Found!10435 (index!44112 (_ BitVec 32))) (Intermediate!10435 (undefined!11247 Bool) (index!44113 (_ BitVec 32)) (x!125777 (_ BitVec 32))) (Undefined!10435) (MissingVacant!10435 (index!44114 (_ BitVec 32))) )
))
(declare-fun lt!613834 () SeekEntryResult!10435)

(assert (=> b!1396960 (= res!935875 (or (not (is-Intermediate!10435 lt!613834)) (undefined!11247 lt!613834)))))

(declare-fun e!790865 () Bool)

(assert (=> b!1396960 e!790865))

(declare-fun res!935881 () Bool)

(assert (=> b!1396960 (=> (not res!935881) (not e!790865))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95529 (_ BitVec 32)) Bool)

(assert (=> b!1396960 (= res!935881 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46874 0))(
  ( (Unit!46875) )
))
(declare-fun lt!613836 () Unit!46874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46874)

(assert (=> b!1396960 (= lt!613836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613832 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95529 (_ BitVec 32)) SeekEntryResult!10435)

(assert (=> b!1396960 (= lt!613834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613832 (select (arr!46118 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396960 (= lt!613832 (toIndex!0 (select (arr!46118 a!2901) j!112) mask!2840))))

(declare-fun b!1396961 () Bool)

(declare-fun e!790868 () Bool)

(assert (=> b!1396961 (= e!790868 true)))

(declare-fun lt!613830 () (_ BitVec 64))

(declare-fun lt!613831 () array!95529)

(declare-fun lt!613835 () SeekEntryResult!10435)

(assert (=> b!1396961 (= lt!613835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613832 lt!613830 lt!613831 mask!2840))))

(declare-fun b!1396962 () Bool)

(declare-fun res!935880 () Bool)

(assert (=> b!1396962 (=> (not res!935880) (not e!790867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396962 (= res!935880 (validKeyInArray!0 (select (arr!46118 a!2901) j!112)))))

(declare-fun b!1396963 () Bool)

(declare-fun res!935874 () Bool)

(assert (=> b!1396963 (=> (not res!935874) (not e!790867))))

(declare-datatypes ((List!32637 0))(
  ( (Nil!32634) (Cons!32633 (h!33875 (_ BitVec 64)) (t!47331 List!32637)) )
))
(declare-fun arrayNoDuplicates!0 (array!95529 (_ BitVec 32) List!32637) Bool)

(assert (=> b!1396963 (= res!935874 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32634))))

(declare-fun b!1396964 () Bool)

(declare-fun res!935879 () Bool)

(assert (=> b!1396964 (=> (not res!935879) (not e!790867))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396964 (= res!935879 (validKeyInArray!0 (select (arr!46118 a!2901) i!1037)))))

(declare-fun b!1396965 () Bool)

(declare-fun res!935878 () Bool)

(assert (=> b!1396965 (=> (not res!935878) (not e!790867))))

(assert (=> b!1396965 (= res!935878 (and (= (size!46668 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46668 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46668 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396966 () Bool)

(assert (=> b!1396966 (= e!790866 e!790868)))

(declare-fun res!935876 () Bool)

(assert (=> b!1396966 (=> res!935876 e!790868)))

(declare-fun lt!613833 () SeekEntryResult!10435)

(assert (=> b!1396966 (= res!935876 (or (= lt!613834 lt!613833) (not (is-Intermediate!10435 lt!613833)) (bvslt (x!125777 lt!613834) #b00000000000000000000000000000000) (bvsgt (x!125777 lt!613834) #b01111111111111111111111111111110) (bvslt lt!613832 #b00000000000000000000000000000000) (bvsge lt!613832 (size!46668 a!2901)) (bvslt (index!44113 lt!613834) #b00000000000000000000000000000000) (bvsge (index!44113 lt!613834) (size!46668 a!2901)) (not (= lt!613834 (Intermediate!10435 false (index!44113 lt!613834) (x!125777 lt!613834)))) (not (= lt!613833 (Intermediate!10435 (undefined!11247 lt!613833) (index!44113 lt!613833) (x!125777 lt!613833))))))))

(assert (=> b!1396966 (= lt!613833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613830 mask!2840) lt!613830 lt!613831 mask!2840))))

(assert (=> b!1396966 (= lt!613830 (select (store (arr!46118 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396966 (= lt!613831 (array!95530 (store (arr!46118 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46668 a!2901)))))

(declare-fun b!1396967 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95529 (_ BitVec 32)) SeekEntryResult!10435)

(assert (=> b!1396967 (= e!790865 (= (seekEntryOrOpen!0 (select (arr!46118 a!2901) j!112) a!2901 mask!2840) (Found!10435 j!112)))))

(declare-fun b!1396968 () Bool)

(declare-fun res!935877 () Bool)

(assert (=> b!1396968 (=> (not res!935877) (not e!790867))))

(assert (=> b!1396968 (= res!935877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120000 res!935873) b!1396965))

(assert (= (and b!1396965 res!935878) b!1396964))

(assert (= (and b!1396964 res!935879) b!1396962))

(assert (= (and b!1396962 res!935880) b!1396968))

(assert (= (and b!1396968 res!935877) b!1396963))

(assert (= (and b!1396963 res!935874) b!1396960))

(assert (= (and b!1396960 res!935881) b!1396967))

(assert (= (and b!1396960 (not res!935875)) b!1396966))

(assert (= (and b!1396966 (not res!935876)) b!1396961))

(declare-fun m!1283571 () Bool)

(assert (=> b!1396967 m!1283571))

(assert (=> b!1396967 m!1283571))

(declare-fun m!1283573 () Bool)

(assert (=> b!1396967 m!1283573))

(declare-fun m!1283575 () Bool)

(assert (=> start!120000 m!1283575))

(declare-fun m!1283577 () Bool)

(assert (=> start!120000 m!1283577))

(assert (=> b!1396962 m!1283571))

(assert (=> b!1396962 m!1283571))

(declare-fun m!1283579 () Bool)

(assert (=> b!1396962 m!1283579))

(assert (=> b!1396960 m!1283571))

(declare-fun m!1283581 () Bool)

(assert (=> b!1396960 m!1283581))

(assert (=> b!1396960 m!1283571))

(declare-fun m!1283583 () Bool)

(assert (=> b!1396960 m!1283583))

(assert (=> b!1396960 m!1283571))

(declare-fun m!1283585 () Bool)

(assert (=> b!1396960 m!1283585))

(declare-fun m!1283587 () Bool)

(assert (=> b!1396960 m!1283587))

(declare-fun m!1283589 () Bool)

(assert (=> b!1396964 m!1283589))

(assert (=> b!1396964 m!1283589))

(declare-fun m!1283591 () Bool)

(assert (=> b!1396964 m!1283591))

(declare-fun m!1283593 () Bool)

(assert (=> b!1396961 m!1283593))

(declare-fun m!1283595 () Bool)

(assert (=> b!1396963 m!1283595))

(declare-fun m!1283597 () Bool)

(assert (=> b!1396966 m!1283597))

(assert (=> b!1396966 m!1283597))

(declare-fun m!1283599 () Bool)

(assert (=> b!1396966 m!1283599))

(declare-fun m!1283601 () Bool)

(assert (=> b!1396966 m!1283601))

(declare-fun m!1283603 () Bool)

(assert (=> b!1396966 m!1283603))

(declare-fun m!1283605 () Bool)

(assert (=> b!1396968 m!1283605))

(push 1)

(assert (not b!1396960))

(assert (not b!1396967))

(assert (not start!120000))

(assert (not b!1396962))

(assert (not b!1396968))

(assert (not b!1396961))

(assert (not b!1396963))

(assert (not b!1396964))

(assert (not b!1396966))

(check-sat)

