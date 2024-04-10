; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120456 () Bool)

(assert start!120456)

(declare-fun b!1402503 () Bool)

(declare-fun res!941016 () Bool)

(declare-fun e!794174 () Bool)

(assert (=> b!1402503 (=> (not res!941016) (not e!794174))))

(declare-datatypes ((array!95865 0))(
  ( (array!95866 (arr!46283 (Array (_ BitVec 32) (_ BitVec 64))) (size!46833 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95865)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402503 (= res!941016 (validKeyInArray!0 (select (arr!46283 a!2901) j!112)))))

(declare-fun b!1402504 () Bool)

(declare-fun res!941023 () Bool)

(assert (=> b!1402504 (=> (not res!941023) (not e!794174))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402504 (= res!941023 (validKeyInArray!0 (select (arr!46283 a!2901) i!1037)))))

(declare-fun b!1402505 () Bool)

(declare-fun res!941015 () Bool)

(assert (=> b!1402505 (=> (not res!941015) (not e!794174))))

(declare-datatypes ((List!32802 0))(
  ( (Nil!32799) (Cons!32798 (h!34046 (_ BitVec 64)) (t!47496 List!32802)) )
))
(declare-fun arrayNoDuplicates!0 (array!95865 (_ BitVec 32) List!32802) Bool)

(assert (=> b!1402505 (= res!941015 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32799))))

(declare-fun b!1402506 () Bool)

(declare-fun res!941020 () Bool)

(assert (=> b!1402506 (=> (not res!941020) (not e!794174))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1402506 (= res!941020 (and (= (size!46833 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46833 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46833 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402507 () Bool)

(declare-fun res!941019 () Bool)

(declare-fun e!794170 () Bool)

(assert (=> b!1402507 (=> res!941019 e!794170)))

(declare-fun lt!617788 () (_ BitVec 64))

(declare-fun lt!617785 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10600 0))(
  ( (MissingZero!10600 (index!44777 (_ BitVec 32))) (Found!10600 (index!44778 (_ BitVec 32))) (Intermediate!10600 (undefined!11412 Bool) (index!44779 (_ BitVec 32)) (x!126403 (_ BitVec 32))) (Undefined!10600) (MissingVacant!10600 (index!44780 (_ BitVec 32))) )
))
(declare-fun lt!617786 () SeekEntryResult!10600)

(declare-fun lt!617791 () array!95865)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95865 (_ BitVec 32)) SeekEntryResult!10600)

(assert (=> b!1402507 (= res!941019 (not (= lt!617786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617785 lt!617788 lt!617791 mask!2840))))))

(declare-fun b!1402508 () Bool)

(declare-fun res!941021 () Bool)

(assert (=> b!1402508 (=> (not res!941021) (not e!794174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95865 (_ BitVec 32)) Bool)

(assert (=> b!1402508 (= res!941021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402510 () Bool)

(declare-fun e!794173 () Bool)

(declare-fun e!794171 () Bool)

(assert (=> b!1402510 (= e!794173 e!794171)))

(declare-fun res!941014 () Bool)

(assert (=> b!1402510 (=> res!941014 e!794171)))

(declare-fun lt!617792 () SeekEntryResult!10600)

(assert (=> b!1402510 (= res!941014 (or (= lt!617792 lt!617786) (not (is-Intermediate!10600 lt!617786))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402510 (= lt!617786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617788 mask!2840) lt!617788 lt!617791 mask!2840))))

(assert (=> b!1402510 (= lt!617788 (select (store (arr!46283 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402510 (= lt!617791 (array!95866 (store (arr!46283 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46833 a!2901)))))

(declare-fun b!1402511 () Bool)

(assert (=> b!1402511 (= e!794171 e!794170)))

(declare-fun res!941018 () Bool)

(assert (=> b!1402511 (=> res!941018 e!794170)))

(assert (=> b!1402511 (= res!941018 (or (bvslt (x!126403 lt!617792) #b00000000000000000000000000000000) (bvsgt (x!126403 lt!617792) #b01111111111111111111111111111110) (bvslt (x!126403 lt!617786) #b00000000000000000000000000000000) (bvsgt (x!126403 lt!617786) #b01111111111111111111111111111110) (bvslt lt!617785 #b00000000000000000000000000000000) (bvsge lt!617785 (size!46833 a!2901)) (bvslt (index!44779 lt!617792) #b00000000000000000000000000000000) (bvsge (index!44779 lt!617792) (size!46833 a!2901)) (bvslt (index!44779 lt!617786) #b00000000000000000000000000000000) (bvsge (index!44779 lt!617786) (size!46833 a!2901)) (not (= lt!617792 (Intermediate!10600 false (index!44779 lt!617792) (x!126403 lt!617792)))) (not (= lt!617786 (Intermediate!10600 false (index!44779 lt!617786) (x!126403 lt!617786))))))))

(declare-fun lt!617790 () SeekEntryResult!10600)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95865 (_ BitVec 32)) SeekEntryResult!10600)

(assert (=> b!1402511 (= lt!617790 (seekKeyOrZeroReturnVacant!0 (x!126403 lt!617786) (index!44779 lt!617786) (index!44779 lt!617786) (select (arr!46283 a!2901) j!112) lt!617791 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95865 (_ BitVec 32)) SeekEntryResult!10600)

(assert (=> b!1402511 (= lt!617790 (seekEntryOrOpen!0 lt!617788 lt!617791 mask!2840))))

(assert (=> b!1402511 (and (not (undefined!11412 lt!617786)) (= (index!44779 lt!617786) i!1037) (bvslt (x!126403 lt!617786) (x!126403 lt!617792)) (= (select (store (arr!46283 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44779 lt!617786)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47204 0))(
  ( (Unit!47205) )
))
(declare-fun lt!617793 () Unit!47204)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47204)

(assert (=> b!1402511 (= lt!617793 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617785 (x!126403 lt!617792) (index!44779 lt!617792) (x!126403 lt!617786) (index!44779 lt!617786) (undefined!11412 lt!617786) mask!2840))))

(declare-fun b!1402512 () Bool)

(assert (=> b!1402512 (= e!794174 (not e!794173))))

(declare-fun res!941017 () Bool)

(assert (=> b!1402512 (=> res!941017 e!794173)))

(assert (=> b!1402512 (= res!941017 (or (not (is-Intermediate!10600 lt!617792)) (undefined!11412 lt!617792)))))

(declare-fun lt!617789 () SeekEntryResult!10600)

(assert (=> b!1402512 (= lt!617789 (Found!10600 j!112))))

(assert (=> b!1402512 (= lt!617789 (seekEntryOrOpen!0 (select (arr!46283 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402512 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617784 () Unit!47204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47204)

(assert (=> b!1402512 (= lt!617784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402512 (= lt!617792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617785 (select (arr!46283 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402512 (= lt!617785 (toIndex!0 (select (arr!46283 a!2901) j!112) mask!2840))))

(declare-fun b!1402509 () Bool)

(assert (=> b!1402509 (= e!794170 true)))

(assert (=> b!1402509 (= lt!617789 lt!617790)))

(declare-fun lt!617787 () Unit!47204)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47204)

(assert (=> b!1402509 (= lt!617787 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617785 (x!126403 lt!617792) (index!44779 lt!617792) (x!126403 lt!617786) (index!44779 lt!617786) mask!2840))))

(declare-fun res!941022 () Bool)

(assert (=> start!120456 (=> (not res!941022) (not e!794174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120456 (= res!941022 (validMask!0 mask!2840))))

(assert (=> start!120456 e!794174))

(assert (=> start!120456 true))

(declare-fun array_inv!35311 (array!95865) Bool)

(assert (=> start!120456 (array_inv!35311 a!2901)))

(assert (= (and start!120456 res!941022) b!1402506))

(assert (= (and b!1402506 res!941020) b!1402504))

(assert (= (and b!1402504 res!941023) b!1402503))

(assert (= (and b!1402503 res!941016) b!1402508))

(assert (= (and b!1402508 res!941021) b!1402505))

(assert (= (and b!1402505 res!941015) b!1402512))

(assert (= (and b!1402512 (not res!941017)) b!1402510))

(assert (= (and b!1402510 (not res!941014)) b!1402511))

(assert (= (and b!1402511 (not res!941018)) b!1402507))

(assert (= (and b!1402507 (not res!941019)) b!1402509))

(declare-fun m!1290699 () Bool)

(assert (=> b!1402510 m!1290699))

(assert (=> b!1402510 m!1290699))

(declare-fun m!1290701 () Bool)

(assert (=> b!1402510 m!1290701))

(declare-fun m!1290703 () Bool)

(assert (=> b!1402510 m!1290703))

(declare-fun m!1290705 () Bool)

(assert (=> b!1402510 m!1290705))

(declare-fun m!1290707 () Bool)

(assert (=> b!1402511 m!1290707))

(declare-fun m!1290709 () Bool)

(assert (=> b!1402511 m!1290709))

(declare-fun m!1290711 () Bool)

(assert (=> b!1402511 m!1290711))

(declare-fun m!1290713 () Bool)

(assert (=> b!1402511 m!1290713))

(assert (=> b!1402511 m!1290703))

(declare-fun m!1290715 () Bool)

(assert (=> b!1402511 m!1290715))

(assert (=> b!1402511 m!1290707))

(declare-fun m!1290717 () Bool)

(assert (=> b!1402504 m!1290717))

(assert (=> b!1402504 m!1290717))

(declare-fun m!1290719 () Bool)

(assert (=> b!1402504 m!1290719))

(assert (=> b!1402503 m!1290707))

(assert (=> b!1402503 m!1290707))

(declare-fun m!1290721 () Bool)

(assert (=> b!1402503 m!1290721))

(declare-fun m!1290723 () Bool)

(assert (=> b!1402507 m!1290723))

(declare-fun m!1290725 () Bool)

(assert (=> b!1402505 m!1290725))

(declare-fun m!1290727 () Bool)

(assert (=> b!1402508 m!1290727))

(assert (=> b!1402512 m!1290707))

(declare-fun m!1290729 () Bool)

(assert (=> b!1402512 m!1290729))

(assert (=> b!1402512 m!1290707))

(declare-fun m!1290731 () Bool)

(assert (=> b!1402512 m!1290731))

(assert (=> b!1402512 m!1290707))

(declare-fun m!1290733 () Bool)

(assert (=> b!1402512 m!1290733))

(declare-fun m!1290735 () Bool)

(assert (=> b!1402512 m!1290735))

(assert (=> b!1402512 m!1290707))

(declare-fun m!1290737 () Bool)

(assert (=> b!1402512 m!1290737))

(declare-fun m!1290739 () Bool)

(assert (=> start!120456 m!1290739))

(declare-fun m!1290741 () Bool)

(assert (=> start!120456 m!1290741))

(declare-fun m!1290743 () Bool)

(assert (=> b!1402509 m!1290743))

(push 1)

