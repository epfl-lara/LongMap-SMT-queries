; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120024 () Bool)

(assert start!120024)

(declare-fun b!1397284 () Bool)

(declare-fun e!791046 () Bool)

(declare-fun e!791045 () Bool)

(assert (=> b!1397284 (= e!791046 e!791045)))

(declare-fun res!936199 () Bool)

(assert (=> b!1397284 (=> res!936199 e!791045)))

(declare-datatypes ((array!95553 0))(
  ( (array!95554 (arr!46130 (Array (_ BitVec 32) (_ BitVec 64))) (size!46680 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95553)

(declare-datatypes ((SeekEntryResult!10447 0))(
  ( (MissingZero!10447 (index!44159 (_ BitVec 32))) (Found!10447 (index!44160 (_ BitVec 32))) (Intermediate!10447 (undefined!11259 Bool) (index!44161 (_ BitVec 32)) (x!125821 (_ BitVec 32))) (Undefined!10447) (MissingVacant!10447 (index!44162 (_ BitVec 32))) )
))
(declare-fun lt!614085 () SeekEntryResult!10447)

(declare-fun lt!614088 () SeekEntryResult!10447)

(declare-fun lt!614082 () (_ BitVec 32))

(assert (=> b!1397284 (= res!936199 (or (= lt!614085 lt!614088) (not (is-Intermediate!10447 lt!614088)) (bvslt (x!125821 lt!614085) #b00000000000000000000000000000000) (bvsgt (x!125821 lt!614085) #b01111111111111111111111111111110) (bvslt lt!614082 #b00000000000000000000000000000000) (bvsge lt!614082 (size!46680 a!2901)) (bvslt (index!44161 lt!614085) #b00000000000000000000000000000000) (bvsge (index!44161 lt!614085) (size!46680 a!2901)) (not (= lt!614085 (Intermediate!10447 false (index!44161 lt!614085) (x!125821 lt!614085)))) (not (= lt!614088 (Intermediate!10447 (undefined!11259 lt!614088) (index!44161 lt!614088) (x!125821 lt!614088))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!614086 () (_ BitVec 64))

(declare-fun lt!614083 () array!95553)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95553 (_ BitVec 32)) SeekEntryResult!10447)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397284 (= lt!614088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614086 mask!2840) lt!614086 lt!614083 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397284 (= lt!614086 (select (store (arr!46130 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397284 (= lt!614083 (array!95554 (store (arr!46130 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46680 a!2901)))))

(declare-fun b!1397285 () Bool)

(declare-fun res!936198 () Bool)

(declare-fun e!791044 () Bool)

(assert (=> b!1397285 (=> (not res!936198) (not e!791044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397285 (= res!936198 (validKeyInArray!0 (select (arr!46130 a!2901) j!112)))))

(declare-fun b!1397286 () Bool)

(declare-fun res!936202 () Bool)

(assert (=> b!1397286 (=> (not res!936202) (not e!791044))))

(declare-datatypes ((List!32649 0))(
  ( (Nil!32646) (Cons!32645 (h!33887 (_ BitVec 64)) (t!47343 List!32649)) )
))
(declare-fun arrayNoDuplicates!0 (array!95553 (_ BitVec 32) List!32649) Bool)

(assert (=> b!1397286 (= res!936202 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32646))))

(declare-fun b!1397287 () Bool)

(declare-fun res!936197 () Bool)

(assert (=> b!1397287 (=> (not res!936197) (not e!791044))))

(assert (=> b!1397287 (= res!936197 (and (= (size!46680 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46680 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46680 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397289 () Bool)

(assert (=> b!1397289 (= e!791045 true)))

(declare-fun lt!614084 () SeekEntryResult!10447)

(assert (=> b!1397289 (= lt!614084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614082 lt!614086 lt!614083 mask!2840))))

(declare-fun b!1397290 () Bool)

(declare-fun res!936201 () Bool)

(assert (=> b!1397290 (=> (not res!936201) (not e!791044))))

(assert (=> b!1397290 (= res!936201 (validKeyInArray!0 (select (arr!46130 a!2901) i!1037)))))

(declare-fun b!1397291 () Bool)

(declare-fun e!791047 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95553 (_ BitVec 32)) SeekEntryResult!10447)

(assert (=> b!1397291 (= e!791047 (= (seekEntryOrOpen!0 (select (arr!46130 a!2901) j!112) a!2901 mask!2840) (Found!10447 j!112)))))

(declare-fun b!1397292 () Bool)

(assert (=> b!1397292 (= e!791044 (not e!791046))))

(declare-fun res!936200 () Bool)

(assert (=> b!1397292 (=> res!936200 e!791046)))

(assert (=> b!1397292 (= res!936200 (or (not (is-Intermediate!10447 lt!614085)) (undefined!11259 lt!614085)))))

(assert (=> b!1397292 e!791047))

(declare-fun res!936205 () Bool)

(assert (=> b!1397292 (=> (not res!936205) (not e!791047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95553 (_ BitVec 32)) Bool)

(assert (=> b!1397292 (= res!936205 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46898 0))(
  ( (Unit!46899) )
))
(declare-fun lt!614087 () Unit!46898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46898)

(assert (=> b!1397292 (= lt!614087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397292 (= lt!614085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614082 (select (arr!46130 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397292 (= lt!614082 (toIndex!0 (select (arr!46130 a!2901) j!112) mask!2840))))

(declare-fun b!1397288 () Bool)

(declare-fun res!936204 () Bool)

(assert (=> b!1397288 (=> (not res!936204) (not e!791044))))

(assert (=> b!1397288 (= res!936204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!936203 () Bool)

(assert (=> start!120024 (=> (not res!936203) (not e!791044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120024 (= res!936203 (validMask!0 mask!2840))))

(assert (=> start!120024 e!791044))

(assert (=> start!120024 true))

(declare-fun array_inv!35158 (array!95553) Bool)

(assert (=> start!120024 (array_inv!35158 a!2901)))

(assert (= (and start!120024 res!936203) b!1397287))

(assert (= (and b!1397287 res!936197) b!1397290))

(assert (= (and b!1397290 res!936201) b!1397285))

(assert (= (and b!1397285 res!936198) b!1397288))

(assert (= (and b!1397288 res!936204) b!1397286))

(assert (= (and b!1397286 res!936202) b!1397292))

(assert (= (and b!1397292 res!936205) b!1397291))

(assert (= (and b!1397292 (not res!936200)) b!1397284))

(assert (= (and b!1397284 (not res!936199)) b!1397289))

(declare-fun m!1284003 () Bool)

(assert (=> b!1397285 m!1284003))

(assert (=> b!1397285 m!1284003))

(declare-fun m!1284005 () Bool)

(assert (=> b!1397285 m!1284005))

(declare-fun m!1284007 () Bool)

(assert (=> b!1397284 m!1284007))

(assert (=> b!1397284 m!1284007))

(declare-fun m!1284009 () Bool)

(assert (=> b!1397284 m!1284009))

(declare-fun m!1284011 () Bool)

(assert (=> b!1397284 m!1284011))

(declare-fun m!1284013 () Bool)

(assert (=> b!1397284 m!1284013))

(declare-fun m!1284015 () Bool)

(assert (=> b!1397290 m!1284015))

(assert (=> b!1397290 m!1284015))

(declare-fun m!1284017 () Bool)

(assert (=> b!1397290 m!1284017))

(declare-fun m!1284019 () Bool)

(assert (=> start!120024 m!1284019))

(declare-fun m!1284021 () Bool)

(assert (=> start!120024 m!1284021))

(declare-fun m!1284023 () Bool)

(assert (=> b!1397289 m!1284023))

(assert (=> b!1397292 m!1284003))

(declare-fun m!1284025 () Bool)

(assert (=> b!1397292 m!1284025))

(assert (=> b!1397292 m!1284003))

(assert (=> b!1397292 m!1284003))

(declare-fun m!1284027 () Bool)

(assert (=> b!1397292 m!1284027))

(declare-fun m!1284029 () Bool)

(assert (=> b!1397292 m!1284029))

(declare-fun m!1284031 () Bool)

(assert (=> b!1397292 m!1284031))

(declare-fun m!1284033 () Bool)

(assert (=> b!1397288 m!1284033))

(assert (=> b!1397291 m!1284003))

(assert (=> b!1397291 m!1284003))

(declare-fun m!1284035 () Bool)

(assert (=> b!1397291 m!1284035))

(declare-fun m!1284037 () Bool)

(assert (=> b!1397286 m!1284037))

(push 1)

