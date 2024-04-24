; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122150 () Bool)

(assert start!122150)

(declare-fun b!1416534 () Bool)

(declare-fun res!951898 () Bool)

(declare-fun e!801809 () Bool)

(assert (=> b!1416534 (=> (not res!951898) (not e!801809))))

(declare-datatypes ((array!96758 0))(
  ( (array!96759 (arr!46708 (Array (_ BitVec 32) (_ BitVec 64))) (size!47259 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96758)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96758 (_ BitVec 32)) Bool)

(assert (=> b!1416534 (= res!951898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416535 () Bool)

(declare-fun res!951897 () Bool)

(assert (=> b!1416535 (=> (not res!951897) (not e!801809))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416535 (= res!951897 (validKeyInArray!0 (select (arr!46708 a!2901) j!112)))))

(declare-fun b!1416536 () Bool)

(declare-fun e!801808 () Bool)

(declare-fun e!801807 () Bool)

(assert (=> b!1416536 (= e!801808 e!801807)))

(declare-fun res!951894 () Bool)

(assert (=> b!1416536 (=> res!951894 e!801807)))

(declare-datatypes ((SeekEntryResult!10922 0))(
  ( (MissingZero!10922 (index!46080 (_ BitVec 32))) (Found!10922 (index!46081 (_ BitVec 32))) (Intermediate!10922 (undefined!11734 Bool) (index!46082 (_ BitVec 32)) (x!127844 (_ BitVec 32))) (Undefined!10922) (MissingVacant!10922 (index!46083 (_ BitVec 32))) )
))
(declare-fun lt!624513 () SeekEntryResult!10922)

(declare-fun lt!624510 () SeekEntryResult!10922)

(get-info :version)

(assert (=> b!1416536 (= res!951894 (or (= lt!624513 lt!624510) (not ((_ is Intermediate!10922) lt!624510))))))

(declare-fun lt!624515 () array!96758)

(declare-fun lt!624512 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96758 (_ BitVec 32)) SeekEntryResult!10922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416536 (= lt!624510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624512 mask!2840) lt!624512 lt!624515 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416536 (= lt!624512 (select (store (arr!46708 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416536 (= lt!624515 (array!96759 (store (arr!46708 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47259 a!2901)))))

(declare-fun e!801811 () Bool)

(declare-fun b!1416537 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96758 (_ BitVec 32)) SeekEntryResult!10922)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96758 (_ BitVec 32)) SeekEntryResult!10922)

(assert (=> b!1416537 (= e!801811 (= (seekEntryOrOpen!0 lt!624512 lt!624515 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127844 lt!624510) (index!46082 lt!624510) (index!46082 lt!624510) (select (arr!46708 a!2901) j!112) lt!624515 mask!2840)))))

(declare-fun b!1416538 () Bool)

(declare-fun res!951895 () Bool)

(assert (=> b!1416538 (=> (not res!951895) (not e!801809))))

(declare-datatypes ((List!33214 0))(
  ( (Nil!33211) (Cons!33210 (h!34505 (_ BitVec 64)) (t!47900 List!33214)) )
))
(declare-fun arrayNoDuplicates!0 (array!96758 (_ BitVec 32) List!33214) Bool)

(assert (=> b!1416538 (= res!951895 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33211))))

(declare-fun b!1416540 () Bool)

(assert (=> b!1416540 (= e!801809 (not e!801808))))

(declare-fun res!951900 () Bool)

(assert (=> b!1416540 (=> res!951900 e!801808)))

(assert (=> b!1416540 (= res!951900 (or (not ((_ is Intermediate!10922) lt!624513)) (undefined!11734 lt!624513)))))

(declare-fun e!801810 () Bool)

(assert (=> b!1416540 e!801810))

(declare-fun res!951899 () Bool)

(assert (=> b!1416540 (=> (not res!951899) (not e!801810))))

(assert (=> b!1416540 (= res!951899 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47845 0))(
  ( (Unit!47846) )
))
(declare-fun lt!624511 () Unit!47845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47845)

(assert (=> b!1416540 (= lt!624511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624514 () (_ BitVec 32))

(assert (=> b!1416540 (= lt!624513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624514 (select (arr!46708 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416540 (= lt!624514 (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840))))

(declare-fun b!1416541 () Bool)

(assert (=> b!1416541 (= e!801807 (or (bvslt (x!127844 lt!624513) #b00000000000000000000000000000000) (bvsgt (x!127844 lt!624513) #b01111111111111111111111111111110) (bvslt (x!127844 lt!624510) #b00000000000000000000000000000000) (bvsgt (x!127844 lt!624510) #b01111111111111111111111111111110) (bvslt lt!624514 #b00000000000000000000000000000000) (bvsge lt!624514 (size!47259 a!2901)) (bvslt (index!46082 lt!624513) #b00000000000000000000000000000000) (bvsge (index!46082 lt!624513) (size!47259 a!2901)) (bvslt (index!46082 lt!624510) #b00000000000000000000000000000000) (bvsge (index!46082 lt!624510) (size!47259 a!2901)) (= lt!624513 (Intermediate!10922 false (index!46082 lt!624513) (x!127844 lt!624513)))))))

(assert (=> b!1416541 e!801811))

(declare-fun res!951893 () Bool)

(assert (=> b!1416541 (=> (not res!951893) (not e!801811))))

(assert (=> b!1416541 (= res!951893 (and (not (undefined!11734 lt!624510)) (= (index!46082 lt!624510) i!1037) (bvslt (x!127844 lt!624510) (x!127844 lt!624513)) (= (select (store (arr!46708 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46082 lt!624510)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624509 () Unit!47845)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47845)

(assert (=> b!1416541 (= lt!624509 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624514 (x!127844 lt!624513) (index!46082 lt!624513) (x!127844 lt!624510) (index!46082 lt!624510) (undefined!11734 lt!624510) mask!2840))))

(declare-fun b!1416542 () Bool)

(assert (=> b!1416542 (= e!801810 (= (seekEntryOrOpen!0 (select (arr!46708 a!2901) j!112) a!2901 mask!2840) (Found!10922 j!112)))))

(declare-fun b!1416543 () Bool)

(declare-fun res!951892 () Bool)

(assert (=> b!1416543 (=> (not res!951892) (not e!801809))))

(assert (=> b!1416543 (= res!951892 (validKeyInArray!0 (select (arr!46708 a!2901) i!1037)))))

(declare-fun res!951896 () Bool)

(assert (=> start!122150 (=> (not res!951896) (not e!801809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122150 (= res!951896 (validMask!0 mask!2840))))

(assert (=> start!122150 e!801809))

(assert (=> start!122150 true))

(declare-fun array_inv!35989 (array!96758) Bool)

(assert (=> start!122150 (array_inv!35989 a!2901)))

(declare-fun b!1416539 () Bool)

(declare-fun res!951901 () Bool)

(assert (=> b!1416539 (=> (not res!951901) (not e!801809))))

(assert (=> b!1416539 (= res!951901 (and (= (size!47259 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47259 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47259 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122150 res!951896) b!1416539))

(assert (= (and b!1416539 res!951901) b!1416543))

(assert (= (and b!1416543 res!951892) b!1416535))

(assert (= (and b!1416535 res!951897) b!1416534))

(assert (= (and b!1416534 res!951898) b!1416538))

(assert (= (and b!1416538 res!951895) b!1416540))

(assert (= (and b!1416540 res!951899) b!1416542))

(assert (= (and b!1416540 (not res!951900)) b!1416536))

(assert (= (and b!1416536 (not res!951894)) b!1416541))

(assert (= (and b!1416541 res!951893) b!1416537))

(declare-fun m!1307029 () Bool)

(assert (=> b!1416538 m!1307029))

(declare-fun m!1307031 () Bool)

(assert (=> b!1416534 m!1307031))

(declare-fun m!1307033 () Bool)

(assert (=> b!1416542 m!1307033))

(assert (=> b!1416542 m!1307033))

(declare-fun m!1307035 () Bool)

(assert (=> b!1416542 m!1307035))

(declare-fun m!1307037 () Bool)

(assert (=> b!1416537 m!1307037))

(assert (=> b!1416537 m!1307033))

(assert (=> b!1416537 m!1307033))

(declare-fun m!1307039 () Bool)

(assert (=> b!1416537 m!1307039))

(assert (=> b!1416540 m!1307033))

(declare-fun m!1307041 () Bool)

(assert (=> b!1416540 m!1307041))

(assert (=> b!1416540 m!1307033))

(declare-fun m!1307043 () Bool)

(assert (=> b!1416540 m!1307043))

(assert (=> b!1416540 m!1307033))

(declare-fun m!1307045 () Bool)

(assert (=> b!1416540 m!1307045))

(declare-fun m!1307047 () Bool)

(assert (=> b!1416540 m!1307047))

(declare-fun m!1307049 () Bool)

(assert (=> b!1416536 m!1307049))

(assert (=> b!1416536 m!1307049))

(declare-fun m!1307051 () Bool)

(assert (=> b!1416536 m!1307051))

(declare-fun m!1307053 () Bool)

(assert (=> b!1416536 m!1307053))

(declare-fun m!1307055 () Bool)

(assert (=> b!1416536 m!1307055))

(declare-fun m!1307057 () Bool)

(assert (=> start!122150 m!1307057))

(declare-fun m!1307059 () Bool)

(assert (=> start!122150 m!1307059))

(assert (=> b!1416541 m!1307053))

(declare-fun m!1307061 () Bool)

(assert (=> b!1416541 m!1307061))

(declare-fun m!1307063 () Bool)

(assert (=> b!1416541 m!1307063))

(declare-fun m!1307065 () Bool)

(assert (=> b!1416543 m!1307065))

(assert (=> b!1416543 m!1307065))

(declare-fun m!1307067 () Bool)

(assert (=> b!1416543 m!1307067))

(assert (=> b!1416535 m!1307033))

(assert (=> b!1416535 m!1307033))

(declare-fun m!1307069 () Bool)

(assert (=> b!1416535 m!1307069))

(check-sat (not b!1416538) (not b!1416536) (not b!1416542) (not b!1416535) (not b!1416534) (not b!1416537) (not start!122150) (not b!1416543) (not b!1416541) (not b!1416540))
(check-sat)
