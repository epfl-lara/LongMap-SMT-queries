; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121980 () Bool)

(assert start!121980)

(declare-fun b!1415666 () Bool)

(declare-fun res!951713 () Bool)

(declare-fun e!801235 () Bool)

(assert (=> b!1415666 (=> (not res!951713) (not e!801235))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96666 0))(
  ( (array!96667 (arr!46664 (Array (_ BitVec 32) (_ BitVec 64))) (size!47214 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96666)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415666 (= res!951713 (and (= (size!47214 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47214 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47214 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415667 () Bool)

(declare-fun e!801237 () Bool)

(assert (=> b!1415667 (= e!801235 (not e!801237))))

(declare-fun res!951718 () Bool)

(assert (=> b!1415667 (=> res!951718 e!801237)))

(declare-datatypes ((SeekEntryResult!10975 0))(
  ( (MissingZero!10975 (index!46292 (_ BitVec 32))) (Found!10975 (index!46293 (_ BitVec 32))) (Intermediate!10975 (undefined!11787 Bool) (index!46294 (_ BitVec 32)) (x!127902 (_ BitVec 32))) (Undefined!10975) (MissingVacant!10975 (index!46295 (_ BitVec 32))) )
))
(declare-fun lt!624300 () SeekEntryResult!10975)

(assert (=> b!1415667 (= res!951718 (or (not (is-Intermediate!10975 lt!624300)) (undefined!11787 lt!624300)))))

(declare-fun e!801238 () Bool)

(assert (=> b!1415667 e!801238))

(declare-fun res!951709 () Bool)

(assert (=> b!1415667 (=> (not res!951709) (not e!801238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96666 (_ BitVec 32)) Bool)

(assert (=> b!1415667 (= res!951709 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47924 0))(
  ( (Unit!47925) )
))
(declare-fun lt!624302 () Unit!47924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47924)

(assert (=> b!1415667 (= lt!624302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624306 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96666 (_ BitVec 32)) SeekEntryResult!10975)

(assert (=> b!1415667 (= lt!624300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624306 (select (arr!46664 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415667 (= lt!624306 (toIndex!0 (select (arr!46664 a!2901) j!112) mask!2840))))

(declare-fun b!1415668 () Bool)

(declare-fun e!801233 () Bool)

(declare-fun e!801239 () Bool)

(assert (=> b!1415668 (= e!801233 e!801239)))

(declare-fun res!951710 () Bool)

(assert (=> b!1415668 (=> res!951710 e!801239)))

(declare-fun lt!624305 () SeekEntryResult!10975)

(assert (=> b!1415668 (= res!951710 (or (bvslt (x!127902 lt!624300) #b00000000000000000000000000000000) (bvsgt (x!127902 lt!624300) #b01111111111111111111111111111110) (bvslt (x!127902 lt!624305) #b00000000000000000000000000000000) (bvsgt (x!127902 lt!624305) #b01111111111111111111111111111110) (bvslt lt!624306 #b00000000000000000000000000000000) (bvsge lt!624306 (size!47214 a!2901)) (bvslt (index!46294 lt!624300) #b00000000000000000000000000000000) (bvsge (index!46294 lt!624300) (size!47214 a!2901)) (bvslt (index!46294 lt!624305) #b00000000000000000000000000000000) (bvsge (index!46294 lt!624305) (size!47214 a!2901)) (not (= lt!624300 (Intermediate!10975 false (index!46294 lt!624300) (x!127902 lt!624300)))) (not (= lt!624305 (Intermediate!10975 false (index!46294 lt!624305) (x!127902 lt!624305))))))))

(declare-fun e!801234 () Bool)

(assert (=> b!1415668 e!801234))

(declare-fun res!951717 () Bool)

(assert (=> b!1415668 (=> (not res!951717) (not e!801234))))

(assert (=> b!1415668 (= res!951717 (and (not (undefined!11787 lt!624305)) (= (index!46294 lt!624305) i!1037) (bvslt (x!127902 lt!624305) (x!127902 lt!624300)) (= (select (store (arr!46664 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46294 lt!624305)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624301 () Unit!47924)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47924)

(assert (=> b!1415668 (= lt!624301 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624306 (x!127902 lt!624300) (index!46294 lt!624300) (x!127902 lt!624305) (index!46294 lt!624305) (undefined!11787 lt!624305) mask!2840))))

(declare-fun b!1415669 () Bool)

(declare-fun res!951714 () Bool)

(assert (=> b!1415669 (=> (not res!951714) (not e!801235))))

(declare-datatypes ((List!33183 0))(
  ( (Nil!33180) (Cons!33179 (h!34466 (_ BitVec 64)) (t!47877 List!33183)) )
))
(declare-fun arrayNoDuplicates!0 (array!96666 (_ BitVec 32) List!33183) Bool)

(assert (=> b!1415669 (= res!951714 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33180))))

(declare-fun b!1415670 () Bool)

(declare-fun lt!624303 () array!96666)

(declare-fun lt!624304 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96666 (_ BitVec 32)) SeekEntryResult!10975)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96666 (_ BitVec 32)) SeekEntryResult!10975)

(assert (=> b!1415670 (= e!801234 (= (seekEntryOrOpen!0 lt!624304 lt!624303 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127902 lt!624305) (index!46294 lt!624305) (index!46294 lt!624305) (select (arr!46664 a!2901) j!112) lt!624303 mask!2840)))))

(declare-fun b!1415671 () Bool)

(assert (=> b!1415671 (= e!801238 (= (seekEntryOrOpen!0 (select (arr!46664 a!2901) j!112) a!2901 mask!2840) (Found!10975 j!112)))))

(declare-fun b!1415673 () Bool)

(assert (=> b!1415673 (= e!801237 e!801233)))

(declare-fun res!951711 () Bool)

(assert (=> b!1415673 (=> res!951711 e!801233)))

(assert (=> b!1415673 (= res!951711 (or (= lt!624300 lt!624305) (not (is-Intermediate!10975 lt!624305))))))

(assert (=> b!1415673 (= lt!624305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624304 mask!2840) lt!624304 lt!624303 mask!2840))))

(assert (=> b!1415673 (= lt!624304 (select (store (arr!46664 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415673 (= lt!624303 (array!96667 (store (arr!46664 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47214 a!2901)))))

(declare-fun b!1415674 () Bool)

(declare-fun res!951712 () Bool)

(assert (=> b!1415674 (=> (not res!951712) (not e!801235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415674 (= res!951712 (validKeyInArray!0 (select (arr!46664 a!2901) j!112)))))

(declare-fun b!1415675 () Bool)

(declare-fun res!951716 () Bool)

(assert (=> b!1415675 (=> (not res!951716) (not e!801235))))

(assert (=> b!1415675 (= res!951716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415676 () Bool)

(declare-fun res!951708 () Bool)

(assert (=> b!1415676 (=> (not res!951708) (not e!801235))))

(assert (=> b!1415676 (= res!951708 (validKeyInArray!0 (select (arr!46664 a!2901) i!1037)))))

(declare-fun res!951715 () Bool)

(assert (=> start!121980 (=> (not res!951715) (not e!801235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121980 (= res!951715 (validMask!0 mask!2840))))

(assert (=> start!121980 e!801235))

(assert (=> start!121980 true))

(declare-fun array_inv!35692 (array!96666) Bool)

(assert (=> start!121980 (array_inv!35692 a!2901)))

(declare-fun b!1415672 () Bool)

(assert (=> b!1415672 (= e!801239 (= lt!624305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624306 lt!624304 lt!624303 mask!2840)))))

(assert (= (and start!121980 res!951715) b!1415666))

(assert (= (and b!1415666 res!951713) b!1415676))

(assert (= (and b!1415676 res!951708) b!1415674))

(assert (= (and b!1415674 res!951712) b!1415675))

(assert (= (and b!1415675 res!951716) b!1415669))

(assert (= (and b!1415669 res!951714) b!1415667))

(assert (= (and b!1415667 res!951709) b!1415671))

(assert (= (and b!1415667 (not res!951718)) b!1415673))

(assert (= (and b!1415673 (not res!951711)) b!1415668))

(assert (= (and b!1415668 res!951717) b!1415670))

(assert (= (and b!1415668 (not res!951710)) b!1415672))

(declare-fun m!1306035 () Bool)

(assert (=> b!1415674 m!1306035))

(assert (=> b!1415674 m!1306035))

(declare-fun m!1306037 () Bool)

(assert (=> b!1415674 m!1306037))

(declare-fun m!1306039 () Bool)

(assert (=> start!121980 m!1306039))

(declare-fun m!1306041 () Bool)

(assert (=> start!121980 m!1306041))

(declare-fun m!1306043 () Bool)

(assert (=> b!1415676 m!1306043))

(assert (=> b!1415676 m!1306043))

(declare-fun m!1306045 () Bool)

(assert (=> b!1415676 m!1306045))

(declare-fun m!1306047 () Bool)

(assert (=> b!1415670 m!1306047))

(assert (=> b!1415670 m!1306035))

(assert (=> b!1415670 m!1306035))

(declare-fun m!1306049 () Bool)

(assert (=> b!1415670 m!1306049))

(assert (=> b!1415671 m!1306035))

(assert (=> b!1415671 m!1306035))

(declare-fun m!1306051 () Bool)

(assert (=> b!1415671 m!1306051))

(declare-fun m!1306053 () Bool)

(assert (=> b!1415675 m!1306053))

(declare-fun m!1306055 () Bool)

(assert (=> b!1415672 m!1306055))

(assert (=> b!1415667 m!1306035))

(declare-fun m!1306057 () Bool)

(assert (=> b!1415667 m!1306057))

(assert (=> b!1415667 m!1306035))

(declare-fun m!1306059 () Bool)

(assert (=> b!1415667 m!1306059))

(declare-fun m!1306061 () Bool)

(assert (=> b!1415667 m!1306061))

(assert (=> b!1415667 m!1306035))

(declare-fun m!1306063 () Bool)

(assert (=> b!1415667 m!1306063))

(declare-fun m!1306065 () Bool)

(assert (=> b!1415668 m!1306065))

(declare-fun m!1306067 () Bool)

(assert (=> b!1415668 m!1306067))

(declare-fun m!1306069 () Bool)

(assert (=> b!1415668 m!1306069))

(declare-fun m!1306071 () Bool)

(assert (=> b!1415669 m!1306071))

(declare-fun m!1306073 () Bool)

(assert (=> b!1415673 m!1306073))

(assert (=> b!1415673 m!1306073))

(declare-fun m!1306075 () Bool)

(assert (=> b!1415673 m!1306075))

(assert (=> b!1415673 m!1306065))

(declare-fun m!1306077 () Bool)

(assert (=> b!1415673 m!1306077))

(push 1)

