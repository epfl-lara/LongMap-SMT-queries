; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120086 () Bool)

(assert start!120086)

(declare-fun b!1398121 () Bool)

(declare-fun res!937037 () Bool)

(declare-fun e!791511 () Bool)

(assert (=> b!1398121 (=> (not res!937037) (not e!791511))))

(declare-datatypes ((array!95615 0))(
  ( (array!95616 (arr!46161 (Array (_ BitVec 32) (_ BitVec 64))) (size!46711 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95615)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398121 (= res!937037 (validKeyInArray!0 (select (arr!46161 a!2901) j!112)))))

(declare-fun b!1398122 () Bool)

(declare-fun e!791509 () Bool)

(declare-fun e!791512 () Bool)

(assert (=> b!1398122 (= e!791509 e!791512)))

(declare-fun res!937035 () Bool)

(assert (=> b!1398122 (=> res!937035 e!791512)))

(declare-datatypes ((SeekEntryResult!10478 0))(
  ( (MissingZero!10478 (index!44283 (_ BitVec 32))) (Found!10478 (index!44284 (_ BitVec 32))) (Intermediate!10478 (undefined!11290 Bool) (index!44285 (_ BitVec 32)) (x!125932 (_ BitVec 32))) (Undefined!10478) (MissingVacant!10478 (index!44286 (_ BitVec 32))) )
))
(declare-fun lt!614719 () SeekEntryResult!10478)

(declare-fun lt!614723 () SeekEntryResult!10478)

(get-info :version)

(assert (=> b!1398122 (= res!937035 (or (= lt!614719 lt!614723) (not ((_ is Intermediate!10478) lt!614723))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614721 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95615 (_ BitVec 32)) SeekEntryResult!10478)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398122 (= lt!614723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614721 mask!2840) lt!614721 (array!95616 (store (arr!46161 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46711 a!2901)) mask!2840))))

(assert (=> b!1398122 (= lt!614721 (select (store (arr!46161 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398123 () Bool)

(assert (=> b!1398123 (= e!791511 (not e!791509))))

(declare-fun res!937039 () Bool)

(assert (=> b!1398123 (=> res!937039 e!791509)))

(assert (=> b!1398123 (= res!937039 (or (not ((_ is Intermediate!10478) lt!614719)) (undefined!11290 lt!614719)))))

(declare-fun e!791510 () Bool)

(assert (=> b!1398123 e!791510))

(declare-fun res!937042 () Bool)

(assert (=> b!1398123 (=> (not res!937042) (not e!791510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95615 (_ BitVec 32)) Bool)

(assert (=> b!1398123 (= res!937042 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46960 0))(
  ( (Unit!46961) )
))
(declare-fun lt!614724 () Unit!46960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46960)

(assert (=> b!1398123 (= lt!614724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614722 () (_ BitVec 32))

(assert (=> b!1398123 (= lt!614719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614722 (select (arr!46161 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398123 (= lt!614722 (toIndex!0 (select (arr!46161 a!2901) j!112) mask!2840))))

(declare-fun b!1398124 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95615 (_ BitVec 32)) SeekEntryResult!10478)

(assert (=> b!1398124 (= e!791510 (= (seekEntryOrOpen!0 (select (arr!46161 a!2901) j!112) a!2901 mask!2840) (Found!10478 j!112)))))

(declare-fun res!937038 () Bool)

(assert (=> start!120086 (=> (not res!937038) (not e!791511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120086 (= res!937038 (validMask!0 mask!2840))))

(assert (=> start!120086 e!791511))

(assert (=> start!120086 true))

(declare-fun array_inv!35189 (array!95615) Bool)

(assert (=> start!120086 (array_inv!35189 a!2901)))

(declare-fun b!1398125 () Bool)

(declare-fun res!937034 () Bool)

(assert (=> b!1398125 (=> (not res!937034) (not e!791511))))

(assert (=> b!1398125 (= res!937034 (and (= (size!46711 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46711 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46711 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398126 () Bool)

(declare-fun res!937041 () Bool)

(assert (=> b!1398126 (=> (not res!937041) (not e!791511))))

(assert (=> b!1398126 (= res!937041 (validKeyInArray!0 (select (arr!46161 a!2901) i!1037)))))

(declare-fun b!1398127 () Bool)

(assert (=> b!1398127 (= e!791512 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1398127 (and (not (undefined!11290 lt!614723)) (= (index!44285 lt!614723) i!1037) (bvslt (x!125932 lt!614723) (x!125932 lt!614719)) (= (select (store (arr!46161 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44285 lt!614723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614720 () Unit!46960)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46960)

(assert (=> b!1398127 (= lt!614720 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614722 (x!125932 lt!614719) (index!44285 lt!614719) (x!125932 lt!614723) (index!44285 lt!614723) (undefined!11290 lt!614723) mask!2840))))

(declare-fun b!1398128 () Bool)

(declare-fun res!937040 () Bool)

(assert (=> b!1398128 (=> (not res!937040) (not e!791511))))

(declare-datatypes ((List!32680 0))(
  ( (Nil!32677) (Cons!32676 (h!33918 (_ BitVec 64)) (t!47374 List!32680)) )
))
(declare-fun arrayNoDuplicates!0 (array!95615 (_ BitVec 32) List!32680) Bool)

(assert (=> b!1398128 (= res!937040 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32677))))

(declare-fun b!1398129 () Bool)

(declare-fun res!937036 () Bool)

(assert (=> b!1398129 (=> (not res!937036) (not e!791511))))

(assert (=> b!1398129 (= res!937036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120086 res!937038) b!1398125))

(assert (= (and b!1398125 res!937034) b!1398126))

(assert (= (and b!1398126 res!937041) b!1398121))

(assert (= (and b!1398121 res!937037) b!1398129))

(assert (= (and b!1398129 res!937036) b!1398128))

(assert (= (and b!1398128 res!937040) b!1398123))

(assert (= (and b!1398123 res!937042) b!1398124))

(assert (= (and b!1398123 (not res!937039)) b!1398122))

(assert (= (and b!1398122 (not res!937035)) b!1398127))

(declare-fun m!1285127 () Bool)

(assert (=> start!120086 m!1285127))

(declare-fun m!1285129 () Bool)

(assert (=> start!120086 m!1285129))

(declare-fun m!1285131 () Bool)

(assert (=> b!1398128 m!1285131))

(declare-fun m!1285133 () Bool)

(assert (=> b!1398123 m!1285133))

(declare-fun m!1285135 () Bool)

(assert (=> b!1398123 m!1285135))

(assert (=> b!1398123 m!1285133))

(assert (=> b!1398123 m!1285133))

(declare-fun m!1285137 () Bool)

(assert (=> b!1398123 m!1285137))

(declare-fun m!1285139 () Bool)

(assert (=> b!1398123 m!1285139))

(declare-fun m!1285141 () Bool)

(assert (=> b!1398123 m!1285141))

(assert (=> b!1398124 m!1285133))

(assert (=> b!1398124 m!1285133))

(declare-fun m!1285143 () Bool)

(assert (=> b!1398124 m!1285143))

(declare-fun m!1285145 () Bool)

(assert (=> b!1398126 m!1285145))

(assert (=> b!1398126 m!1285145))

(declare-fun m!1285147 () Bool)

(assert (=> b!1398126 m!1285147))

(declare-fun m!1285149 () Bool)

(assert (=> b!1398122 m!1285149))

(declare-fun m!1285151 () Bool)

(assert (=> b!1398122 m!1285151))

(assert (=> b!1398122 m!1285149))

(declare-fun m!1285153 () Bool)

(assert (=> b!1398122 m!1285153))

(declare-fun m!1285155 () Bool)

(assert (=> b!1398122 m!1285155))

(assert (=> b!1398127 m!1285151))

(declare-fun m!1285157 () Bool)

(assert (=> b!1398127 m!1285157))

(declare-fun m!1285159 () Bool)

(assert (=> b!1398127 m!1285159))

(declare-fun m!1285161 () Bool)

(assert (=> b!1398129 m!1285161))

(assert (=> b!1398121 m!1285133))

(assert (=> b!1398121 m!1285133))

(declare-fun m!1285163 () Bool)

(assert (=> b!1398121 m!1285163))

(check-sat (not b!1398123) (not b!1398122) (not start!120086) (not b!1398121) (not b!1398129) (not b!1398126) (not b!1398124) (not b!1398128) (not b!1398127))
(check-sat)
