; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119272 () Bool)

(assert start!119272)

(declare-fun res!930908 () Bool)

(declare-fun e!787659 () Bool)

(assert (=> start!119272 (=> (not res!930908) (not e!787659))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119272 (= res!930908 (validMask!0 mask!2840))))

(assert (=> start!119272 e!787659))

(assert (=> start!119272 true))

(declare-datatypes ((array!95158 0))(
  ( (array!95159 (arr!45943 (Array (_ BitVec 32) (_ BitVec 64))) (size!46493 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95158)

(declare-fun array_inv!34971 (array!95158) Bool)

(assert (=> start!119272 (array_inv!34971 a!2901)))

(declare-fun e!787660 () Bool)

(declare-fun b!1390893 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10260 0))(
  ( (MissingZero!10260 (index!43411 (_ BitVec 32))) (Found!10260 (index!43412 (_ BitVec 32))) (Intermediate!10260 (undefined!11072 Bool) (index!43413 (_ BitVec 32)) (x!125088 (_ BitVec 32))) (Undefined!10260) (MissingVacant!10260 (index!43414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95158 (_ BitVec 32)) SeekEntryResult!10260)

(assert (=> b!1390893 (= e!787660 (= (seekEntryOrOpen!0 (select (arr!45943 a!2901) j!112) a!2901 mask!2840) (Found!10260 j!112)))))

(declare-fun b!1390894 () Bool)

(declare-fun res!930909 () Bool)

(assert (=> b!1390894 (=> (not res!930909) (not e!787659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390894 (= res!930909 (validKeyInArray!0 (select (arr!45943 a!2901) j!112)))))

(declare-fun b!1390895 () Bool)

(declare-fun res!930913 () Bool)

(assert (=> b!1390895 (=> (not res!930913) (not e!787659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95158 (_ BitVec 32)) Bool)

(assert (=> b!1390895 (= res!930913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390896 () Bool)

(declare-fun res!930912 () Bool)

(assert (=> b!1390896 (=> (not res!930912) (not e!787659))))

(declare-datatypes ((List!32462 0))(
  ( (Nil!32459) (Cons!32458 (h!33679 (_ BitVec 64)) (t!47156 List!32462)) )
))
(declare-fun arrayNoDuplicates!0 (array!95158 (_ BitVec 32) List!32462) Bool)

(assert (=> b!1390896 (= res!930912 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32459))))

(declare-fun b!1390897 () Bool)

(declare-fun res!930907 () Bool)

(assert (=> b!1390897 (=> (not res!930907) (not e!787659))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390897 (= res!930907 (validKeyInArray!0 (select (arr!45943 a!2901) i!1037)))))

(declare-fun b!1390898 () Bool)

(declare-fun res!930911 () Bool)

(assert (=> b!1390898 (=> (not res!930911) (not e!787659))))

(assert (=> b!1390898 (= res!930911 (and (= (size!46493 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46493 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46493 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390899 () Bool)

(assert (=> b!1390899 (= e!787659 (not true))))

(assert (=> b!1390899 e!787660))

(declare-fun res!930910 () Bool)

(assert (=> b!1390899 (=> (not res!930910) (not e!787660))))

(assert (=> b!1390899 (= res!930910 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46524 0))(
  ( (Unit!46525) )
))
(declare-fun lt!610997 () Unit!46524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46524)

(assert (=> b!1390899 (= lt!610997 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610998 () SeekEntryResult!10260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95158 (_ BitVec 32)) SeekEntryResult!10260)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390899 (= lt!610998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45943 a!2901) j!112) mask!2840) (select (arr!45943 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119272 res!930908) b!1390898))

(assert (= (and b!1390898 res!930911) b!1390897))

(assert (= (and b!1390897 res!930907) b!1390894))

(assert (= (and b!1390894 res!930909) b!1390895))

(assert (= (and b!1390895 res!930913) b!1390896))

(assert (= (and b!1390896 res!930912) b!1390899))

(assert (= (and b!1390899 res!930910) b!1390893))

(declare-fun m!1276693 () Bool)

(assert (=> b!1390896 m!1276693))

(declare-fun m!1276695 () Bool)

(assert (=> b!1390897 m!1276695))

(assert (=> b!1390897 m!1276695))

(declare-fun m!1276697 () Bool)

(assert (=> b!1390897 m!1276697))

(declare-fun m!1276699 () Bool)

(assert (=> b!1390894 m!1276699))

(assert (=> b!1390894 m!1276699))

(declare-fun m!1276701 () Bool)

(assert (=> b!1390894 m!1276701))

(assert (=> b!1390893 m!1276699))

(assert (=> b!1390893 m!1276699))

(declare-fun m!1276703 () Bool)

(assert (=> b!1390893 m!1276703))

(declare-fun m!1276705 () Bool)

(assert (=> start!119272 m!1276705))

(declare-fun m!1276707 () Bool)

(assert (=> start!119272 m!1276707))

(assert (=> b!1390899 m!1276699))

(declare-fun m!1276709 () Bool)

(assert (=> b!1390899 m!1276709))

(assert (=> b!1390899 m!1276699))

(declare-fun m!1276711 () Bool)

(assert (=> b!1390899 m!1276711))

(assert (=> b!1390899 m!1276709))

(assert (=> b!1390899 m!1276699))

(declare-fun m!1276713 () Bool)

(assert (=> b!1390899 m!1276713))

(declare-fun m!1276715 () Bool)

(assert (=> b!1390899 m!1276715))

(declare-fun m!1276717 () Bool)

(assert (=> b!1390895 m!1276717))

(push 1)

(assert (not b!1390893))

(assert (not b!1390899))

(assert (not b!1390894))

(assert (not b!1390896))

(assert (not b!1390897))

(assert (not start!119272))

(assert (not b!1390895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

