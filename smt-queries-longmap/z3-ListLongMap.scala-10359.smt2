; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122156 () Bool)

(assert start!122156)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96764 0))(
  ( (array!96765 (arr!46711 (Array (_ BitVec 32) (_ BitVec 64))) (size!47262 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96764)

(declare-fun b!1416624 () Bool)

(declare-fun e!801863 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10925 0))(
  ( (MissingZero!10925 (index!46092 (_ BitVec 32))) (Found!10925 (index!46093 (_ BitVec 32))) (Intermediate!10925 (undefined!11737 Bool) (index!46094 (_ BitVec 32)) (x!127855 (_ BitVec 32))) (Undefined!10925) (MissingVacant!10925 (index!46095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96764 (_ BitVec 32)) SeekEntryResult!10925)

(assert (=> b!1416624 (= e!801863 (= (seekEntryOrOpen!0 (select (arr!46711 a!2901) j!112) a!2901 mask!2840) (Found!10925 j!112)))))

(declare-fun b!1416626 () Bool)

(declare-fun res!951988 () Bool)

(declare-fun e!801861 () Bool)

(assert (=> b!1416626 (=> (not res!951988) (not e!801861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96764 (_ BitVec 32)) Bool)

(assert (=> b!1416626 (= res!951988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416627 () Bool)

(declare-fun e!801866 () Bool)

(assert (=> b!1416627 (= e!801866 true)))

(declare-fun e!801862 () Bool)

(assert (=> b!1416627 e!801862))

(declare-fun res!951985 () Bool)

(assert (=> b!1416627 (=> (not res!951985) (not e!801862))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!624573 () SeekEntryResult!10925)

(declare-fun lt!624574 () SeekEntryResult!10925)

(assert (=> b!1416627 (= res!951985 (and (not (undefined!11737 lt!624574)) (= (index!46094 lt!624574) i!1037) (bvslt (x!127855 lt!624574) (x!127855 lt!624573)) (= (select (store (arr!46711 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46094 lt!624574)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47851 0))(
  ( (Unit!47852) )
))
(declare-fun lt!624577 () Unit!47851)

(declare-fun lt!624576 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47851)

(assert (=> b!1416627 (= lt!624577 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624576 (x!127855 lt!624573) (index!46094 lt!624573) (x!127855 lt!624574) (index!46094 lt!624574) (undefined!11737 lt!624574) mask!2840))))

(declare-fun b!1416628 () Bool)

(declare-fun e!801865 () Bool)

(assert (=> b!1416628 (= e!801865 e!801866)))

(declare-fun res!951986 () Bool)

(assert (=> b!1416628 (=> res!951986 e!801866)))

(get-info :version)

(assert (=> b!1416628 (= res!951986 (or (= lt!624573 lt!624574) (not ((_ is Intermediate!10925) lt!624574))))))

(declare-fun lt!624572 () (_ BitVec 64))

(declare-fun lt!624575 () array!96764)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96764 (_ BitVec 32)) SeekEntryResult!10925)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416628 (= lt!624574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624572 mask!2840) lt!624572 lt!624575 mask!2840))))

(assert (=> b!1416628 (= lt!624572 (select (store (arr!46711 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416628 (= lt!624575 (array!96765 (store (arr!46711 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47262 a!2901)))))

(declare-fun b!1416629 () Bool)

(assert (=> b!1416629 (= e!801861 (not e!801865))))

(declare-fun res!951984 () Bool)

(assert (=> b!1416629 (=> res!951984 e!801865)))

(assert (=> b!1416629 (= res!951984 (or (not ((_ is Intermediate!10925) lt!624573)) (undefined!11737 lt!624573)))))

(assert (=> b!1416629 e!801863))

(declare-fun res!951991 () Bool)

(assert (=> b!1416629 (=> (not res!951991) (not e!801863))))

(assert (=> b!1416629 (= res!951991 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624578 () Unit!47851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47851)

(assert (=> b!1416629 (= lt!624578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416629 (= lt!624573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624576 (select (arr!46711 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416629 (= lt!624576 (toIndex!0 (select (arr!46711 a!2901) j!112) mask!2840))))

(declare-fun b!1416630 () Bool)

(declare-fun res!951983 () Bool)

(assert (=> b!1416630 (=> (not res!951983) (not e!801861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416630 (= res!951983 (validKeyInArray!0 (select (arr!46711 a!2901) j!112)))))

(declare-fun b!1416631 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96764 (_ BitVec 32)) SeekEntryResult!10925)

(assert (=> b!1416631 (= e!801862 (= (seekEntryOrOpen!0 lt!624572 lt!624575 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127855 lt!624574) (index!46094 lt!624574) (index!46094 lt!624574) (select (arr!46711 a!2901) j!112) lt!624575 mask!2840)))))

(declare-fun b!1416625 () Bool)

(declare-fun res!951982 () Bool)

(assert (=> b!1416625 (=> (not res!951982) (not e!801861))))

(assert (=> b!1416625 (= res!951982 (and (= (size!47262 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47262 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47262 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!951989 () Bool)

(assert (=> start!122156 (=> (not res!951989) (not e!801861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122156 (= res!951989 (validMask!0 mask!2840))))

(assert (=> start!122156 e!801861))

(assert (=> start!122156 true))

(declare-fun array_inv!35992 (array!96764) Bool)

(assert (=> start!122156 (array_inv!35992 a!2901)))

(declare-fun b!1416632 () Bool)

(declare-fun res!951990 () Bool)

(assert (=> b!1416632 (=> (not res!951990) (not e!801861))))

(declare-datatypes ((List!33217 0))(
  ( (Nil!33214) (Cons!33213 (h!34508 (_ BitVec 64)) (t!47903 List!33217)) )
))
(declare-fun arrayNoDuplicates!0 (array!96764 (_ BitVec 32) List!33217) Bool)

(assert (=> b!1416632 (= res!951990 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33214))))

(declare-fun b!1416633 () Bool)

(declare-fun res!951987 () Bool)

(assert (=> b!1416633 (=> (not res!951987) (not e!801861))))

(assert (=> b!1416633 (= res!951987 (validKeyInArray!0 (select (arr!46711 a!2901) i!1037)))))

(assert (= (and start!122156 res!951989) b!1416625))

(assert (= (and b!1416625 res!951982) b!1416633))

(assert (= (and b!1416633 res!951987) b!1416630))

(assert (= (and b!1416630 res!951983) b!1416626))

(assert (= (and b!1416626 res!951988) b!1416632))

(assert (= (and b!1416632 res!951990) b!1416629))

(assert (= (and b!1416629 res!951991) b!1416624))

(assert (= (and b!1416629 (not res!951984)) b!1416628))

(assert (= (and b!1416628 (not res!951986)) b!1416627))

(assert (= (and b!1416627 res!951985) b!1416631))

(declare-fun m!1307155 () Bool)

(assert (=> b!1416628 m!1307155))

(assert (=> b!1416628 m!1307155))

(declare-fun m!1307157 () Bool)

(assert (=> b!1416628 m!1307157))

(declare-fun m!1307159 () Bool)

(assert (=> b!1416628 m!1307159))

(declare-fun m!1307161 () Bool)

(assert (=> b!1416628 m!1307161))

(declare-fun m!1307163 () Bool)

(assert (=> b!1416629 m!1307163))

(declare-fun m!1307165 () Bool)

(assert (=> b!1416629 m!1307165))

(assert (=> b!1416629 m!1307163))

(assert (=> b!1416629 m!1307163))

(declare-fun m!1307167 () Bool)

(assert (=> b!1416629 m!1307167))

(declare-fun m!1307169 () Bool)

(assert (=> b!1416629 m!1307169))

(declare-fun m!1307171 () Bool)

(assert (=> b!1416629 m!1307171))

(assert (=> b!1416624 m!1307163))

(assert (=> b!1416624 m!1307163))

(declare-fun m!1307173 () Bool)

(assert (=> b!1416624 m!1307173))

(declare-fun m!1307175 () Bool)

(assert (=> b!1416631 m!1307175))

(assert (=> b!1416631 m!1307163))

(assert (=> b!1416631 m!1307163))

(declare-fun m!1307177 () Bool)

(assert (=> b!1416631 m!1307177))

(declare-fun m!1307179 () Bool)

(assert (=> b!1416633 m!1307179))

(assert (=> b!1416633 m!1307179))

(declare-fun m!1307181 () Bool)

(assert (=> b!1416633 m!1307181))

(declare-fun m!1307183 () Bool)

(assert (=> b!1416632 m!1307183))

(assert (=> b!1416627 m!1307159))

(declare-fun m!1307185 () Bool)

(assert (=> b!1416627 m!1307185))

(declare-fun m!1307187 () Bool)

(assert (=> b!1416627 m!1307187))

(assert (=> b!1416630 m!1307163))

(assert (=> b!1416630 m!1307163))

(declare-fun m!1307189 () Bool)

(assert (=> b!1416630 m!1307189))

(declare-fun m!1307191 () Bool)

(assert (=> b!1416626 m!1307191))

(declare-fun m!1307193 () Bool)

(assert (=> start!122156 m!1307193))

(declare-fun m!1307195 () Bool)

(assert (=> start!122156 m!1307195))

(check-sat (not b!1416627) (not b!1416630) (not b!1416631) (not b!1416632) (not b!1416633) (not b!1416629) (not b!1416628) (not b!1416626) (not start!122156) (not b!1416624))
(check-sat)
