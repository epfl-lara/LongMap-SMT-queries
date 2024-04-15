; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120038 () Bool)

(assert start!120038)

(declare-fun b!1397446 () Bool)

(declare-fun res!936415 () Bool)

(declare-fun e!791144 () Bool)

(assert (=> b!1397446 (=> (not res!936415) (not e!791144))))

(declare-datatypes ((array!95520 0))(
  ( (array!95521 (arr!46114 (Array (_ BitVec 32) (_ BitVec 64))) (size!46666 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95520)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397446 (= res!936415 (validKeyInArray!0 (select (arr!46114 a!2901) j!112)))))

(declare-fun b!1397448 () Bool)

(declare-fun res!936412 () Bool)

(assert (=> b!1397448 (=> (not res!936412) (not e!791144))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95520 (_ BitVec 32)) Bool)

(assert (=> b!1397448 (= res!936412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397449 () Bool)

(declare-fun e!791141 () Bool)

(assert (=> b!1397449 (= e!791141 true)))

(declare-fun lt!614081 () array!95520)

(declare-fun lt!614085 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10457 0))(
  ( (MissingZero!10457 (index!44199 (_ BitVec 32))) (Found!10457 (index!44200 (_ BitVec 32))) (Intermediate!10457 (undefined!11269 Bool) (index!44201 (_ BitVec 32)) (x!125852 (_ BitVec 32))) (Undefined!10457) (MissingVacant!10457 (index!44202 (_ BitVec 32))) )
))
(declare-fun lt!614084 () SeekEntryResult!10457)

(declare-fun lt!614087 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95520 (_ BitVec 32)) SeekEntryResult!10457)

(assert (=> b!1397449 (= lt!614084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614087 lt!614085 lt!614081 mask!2840))))

(declare-fun b!1397450 () Bool)

(declare-fun res!936416 () Bool)

(assert (=> b!1397450 (=> (not res!936416) (not e!791144))))

(declare-datatypes ((List!32711 0))(
  ( (Nil!32708) (Cons!32707 (h!33949 (_ BitVec 64)) (t!47397 List!32711)) )
))
(declare-fun arrayNoDuplicates!0 (array!95520 (_ BitVec 32) List!32711) Bool)

(assert (=> b!1397450 (= res!936416 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32708))))

(declare-fun b!1397451 () Bool)

(declare-fun res!936414 () Bool)

(assert (=> b!1397451 (=> (not res!936414) (not e!791144))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397451 (= res!936414 (and (= (size!46666 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46666 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46666 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!791142 () Bool)

(declare-fun b!1397452 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95520 (_ BitVec 32)) SeekEntryResult!10457)

(assert (=> b!1397452 (= e!791142 (= (seekEntryOrOpen!0 (select (arr!46114 a!2901) j!112) a!2901 mask!2840) (Found!10457 j!112)))))

(declare-fun b!1397453 () Bool)

(declare-fun res!936413 () Bool)

(assert (=> b!1397453 (=> (not res!936413) (not e!791144))))

(assert (=> b!1397453 (= res!936413 (validKeyInArray!0 (select (arr!46114 a!2901) i!1037)))))

(declare-fun b!1397454 () Bool)

(declare-fun e!791140 () Bool)

(assert (=> b!1397454 (= e!791144 (not e!791140))))

(declare-fun res!936411 () Bool)

(assert (=> b!1397454 (=> res!936411 e!791140)))

(declare-fun lt!614086 () SeekEntryResult!10457)

(get-info :version)

(assert (=> b!1397454 (= res!936411 (or (not ((_ is Intermediate!10457) lt!614086)) (undefined!11269 lt!614086)))))

(assert (=> b!1397454 e!791142))

(declare-fun res!936417 () Bool)

(assert (=> b!1397454 (=> (not res!936417) (not e!791142))))

(assert (=> b!1397454 (= res!936417 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46761 0))(
  ( (Unit!46762) )
))
(declare-fun lt!614083 () Unit!46761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46761)

(assert (=> b!1397454 (= lt!614083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397454 (= lt!614086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614087 (select (arr!46114 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397454 (= lt!614087 (toIndex!0 (select (arr!46114 a!2901) j!112) mask!2840))))

(declare-fun res!936410 () Bool)

(assert (=> start!120038 (=> (not res!936410) (not e!791144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120038 (= res!936410 (validMask!0 mask!2840))))

(assert (=> start!120038 e!791144))

(assert (=> start!120038 true))

(declare-fun array_inv!35347 (array!95520) Bool)

(assert (=> start!120038 (array_inv!35347 a!2901)))

(declare-fun b!1397447 () Bool)

(assert (=> b!1397447 (= e!791140 e!791141)))

(declare-fun res!936418 () Bool)

(assert (=> b!1397447 (=> res!936418 e!791141)))

(declare-fun lt!614082 () SeekEntryResult!10457)

(assert (=> b!1397447 (= res!936418 (or (= lt!614086 lt!614082) (not ((_ is Intermediate!10457) lt!614082)) (bvslt (x!125852 lt!614086) #b00000000000000000000000000000000) (bvsgt (x!125852 lt!614086) #b01111111111111111111111111111110) (bvslt lt!614087 #b00000000000000000000000000000000) (bvsge lt!614087 (size!46666 a!2901)) (bvslt (index!44201 lt!614086) #b00000000000000000000000000000000) (bvsge (index!44201 lt!614086) (size!46666 a!2901)) (not (= lt!614086 (Intermediate!10457 false (index!44201 lt!614086) (x!125852 lt!614086)))) (not (= lt!614082 (Intermediate!10457 (undefined!11269 lt!614082) (index!44201 lt!614082) (x!125852 lt!614082))))))))

(assert (=> b!1397447 (= lt!614082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614085 mask!2840) lt!614085 lt!614081 mask!2840))))

(assert (=> b!1397447 (= lt!614085 (select (store (arr!46114 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397447 (= lt!614081 (array!95521 (store (arr!46114 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46666 a!2901)))))

(assert (= (and start!120038 res!936410) b!1397451))

(assert (= (and b!1397451 res!936414) b!1397453))

(assert (= (and b!1397453 res!936413) b!1397446))

(assert (= (and b!1397446 res!936415) b!1397448))

(assert (= (and b!1397448 res!936412) b!1397450))

(assert (= (and b!1397450 res!936416) b!1397454))

(assert (= (and b!1397454 res!936417) b!1397452))

(assert (= (and b!1397454 (not res!936411)) b!1397447))

(assert (= (and b!1397447 (not res!936418)) b!1397449))

(declare-fun m!1283791 () Bool)

(assert (=> b!1397446 m!1283791))

(assert (=> b!1397446 m!1283791))

(declare-fun m!1283793 () Bool)

(assert (=> b!1397446 m!1283793))

(declare-fun m!1283795 () Bool)

(assert (=> b!1397448 m!1283795))

(declare-fun m!1283797 () Bool)

(assert (=> b!1397453 m!1283797))

(assert (=> b!1397453 m!1283797))

(declare-fun m!1283799 () Bool)

(assert (=> b!1397453 m!1283799))

(declare-fun m!1283801 () Bool)

(assert (=> b!1397447 m!1283801))

(assert (=> b!1397447 m!1283801))

(declare-fun m!1283803 () Bool)

(assert (=> b!1397447 m!1283803))

(declare-fun m!1283805 () Bool)

(assert (=> b!1397447 m!1283805))

(declare-fun m!1283807 () Bool)

(assert (=> b!1397447 m!1283807))

(declare-fun m!1283809 () Bool)

(assert (=> b!1397449 m!1283809))

(assert (=> b!1397454 m!1283791))

(declare-fun m!1283811 () Bool)

(assert (=> b!1397454 m!1283811))

(assert (=> b!1397454 m!1283791))

(declare-fun m!1283813 () Bool)

(assert (=> b!1397454 m!1283813))

(assert (=> b!1397454 m!1283791))

(declare-fun m!1283815 () Bool)

(assert (=> b!1397454 m!1283815))

(declare-fun m!1283817 () Bool)

(assert (=> b!1397454 m!1283817))

(assert (=> b!1397452 m!1283791))

(assert (=> b!1397452 m!1283791))

(declare-fun m!1283819 () Bool)

(assert (=> b!1397452 m!1283819))

(declare-fun m!1283821 () Bool)

(assert (=> b!1397450 m!1283821))

(declare-fun m!1283823 () Bool)

(assert (=> start!120038 m!1283823))

(declare-fun m!1283825 () Bool)

(assert (=> start!120038 m!1283825))

(check-sat (not b!1397447) (not b!1397452) (not b!1397453) (not b!1397449) (not start!120038) (not b!1397450) (not b!1397454) (not b!1397446) (not b!1397448))
(check-sat)
