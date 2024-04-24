; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120750 () Bool)

(assert start!120750)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96081 0))(
  ( (array!96082 (arr!46389 (Array (_ BitVec 32) (_ BitVec 64))) (size!46940 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96081)

(declare-fun b!1404966 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!795553 () Bool)

(declare-datatypes ((SeekEntryResult!10609 0))(
  ( (MissingZero!10609 (index!44813 (_ BitVec 32))) (Found!10609 (index!44814 (_ BitVec 32))) (Intermediate!10609 (undefined!11421 Bool) (index!44815 (_ BitVec 32)) (x!126567 (_ BitVec 32))) (Undefined!10609) (MissingVacant!10609 (index!44816 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96081 (_ BitVec 32)) SeekEntryResult!10609)

(assert (=> b!1404966 (= e!795553 (= (seekEntryOrOpen!0 (select (arr!46389 a!2901) j!112) a!2901 mask!2840) (Found!10609 j!112)))))

(declare-fun b!1404967 () Bool)

(declare-fun res!942794 () Bool)

(declare-fun e!795554 () Bool)

(assert (=> b!1404967 (=> (not res!942794) (not e!795554))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404967 (= res!942794 (validKeyInArray!0 (select (arr!46389 a!2901) i!1037)))))

(declare-fun b!1404968 () Bool)

(declare-fun res!942798 () Bool)

(assert (=> b!1404968 (=> (not res!942798) (not e!795554))))

(assert (=> b!1404968 (= res!942798 (validKeyInArray!0 (select (arr!46389 a!2901) j!112)))))

(declare-fun b!1404969 () Bool)

(assert (=> b!1404969 (= e!795554 (not true))))

(assert (=> b!1404969 e!795553))

(declare-fun res!942797 () Bool)

(assert (=> b!1404969 (=> (not res!942797) (not e!795553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96081 (_ BitVec 32)) Bool)

(assert (=> b!1404969 (= res!942797 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47249 0))(
  ( (Unit!47250) )
))
(declare-fun lt!618917 () Unit!47249)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47249)

(assert (=> b!1404969 (= lt!618917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618916 () SeekEntryResult!10609)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96081 (_ BitVec 32)) SeekEntryResult!10609)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404969 (= lt!618916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46389 a!2901) j!112) mask!2840) (select (arr!46389 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404970 () Bool)

(declare-fun res!942799 () Bool)

(assert (=> b!1404970 (=> (not res!942799) (not e!795554))))

(assert (=> b!1404970 (= res!942799 (and (= (size!46940 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46940 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46940 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404971 () Bool)

(declare-fun res!942795 () Bool)

(assert (=> b!1404971 (=> (not res!942795) (not e!795554))))

(declare-datatypes ((List!32895 0))(
  ( (Nil!32892) (Cons!32891 (h!34147 (_ BitVec 64)) (t!47581 List!32895)) )
))
(declare-fun arrayNoDuplicates!0 (array!96081 (_ BitVec 32) List!32895) Bool)

(assert (=> b!1404971 (= res!942795 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32892))))

(declare-fun res!942793 () Bool)

(assert (=> start!120750 (=> (not res!942793) (not e!795554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120750 (= res!942793 (validMask!0 mask!2840))))

(assert (=> start!120750 e!795554))

(assert (=> start!120750 true))

(declare-fun array_inv!35670 (array!96081) Bool)

(assert (=> start!120750 (array_inv!35670 a!2901)))

(declare-fun b!1404972 () Bool)

(declare-fun res!942796 () Bool)

(assert (=> b!1404972 (=> (not res!942796) (not e!795554))))

(assert (=> b!1404972 (= res!942796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120750 res!942793) b!1404970))

(assert (= (and b!1404970 res!942799) b!1404967))

(assert (= (and b!1404967 res!942794) b!1404968))

(assert (= (and b!1404968 res!942798) b!1404972))

(assert (= (and b!1404972 res!942796) b!1404971))

(assert (= (and b!1404971 res!942795) b!1404969))

(assert (= (and b!1404969 res!942797) b!1404966))

(declare-fun m!1293947 () Bool)

(assert (=> b!1404971 m!1293947))

(declare-fun m!1293949 () Bool)

(assert (=> b!1404969 m!1293949))

(declare-fun m!1293951 () Bool)

(assert (=> b!1404969 m!1293951))

(assert (=> b!1404969 m!1293949))

(declare-fun m!1293953 () Bool)

(assert (=> b!1404969 m!1293953))

(assert (=> b!1404969 m!1293951))

(assert (=> b!1404969 m!1293949))

(declare-fun m!1293955 () Bool)

(assert (=> b!1404969 m!1293955))

(declare-fun m!1293957 () Bool)

(assert (=> b!1404969 m!1293957))

(declare-fun m!1293959 () Bool)

(assert (=> start!120750 m!1293959))

(declare-fun m!1293961 () Bool)

(assert (=> start!120750 m!1293961))

(declare-fun m!1293963 () Bool)

(assert (=> b!1404972 m!1293963))

(declare-fun m!1293965 () Bool)

(assert (=> b!1404967 m!1293965))

(assert (=> b!1404967 m!1293965))

(declare-fun m!1293967 () Bool)

(assert (=> b!1404967 m!1293967))

(assert (=> b!1404968 m!1293949))

(assert (=> b!1404968 m!1293949))

(declare-fun m!1293969 () Bool)

(assert (=> b!1404968 m!1293969))

(assert (=> b!1404966 m!1293949))

(assert (=> b!1404966 m!1293949))

(declare-fun m!1293971 () Bool)

(assert (=> b!1404966 m!1293971))

(push 1)

(assert (not b!1404969))

(assert (not b!1404966))

(assert (not b!1404968))

(assert (not start!120750))

(assert (not b!1404972))

(assert (not b!1404971))

(assert (not b!1404967))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

