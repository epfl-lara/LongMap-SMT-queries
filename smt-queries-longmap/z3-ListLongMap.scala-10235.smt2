; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120458 () Bool)

(assert start!120458)

(declare-fun b!1402512 () Bool)

(declare-fun res!941074 () Bool)

(declare-fun e!794178 () Bool)

(assert (=> b!1402512 (=> (not res!941074) (not e!794178))))

(declare-datatypes ((array!95820 0))(
  ( (array!95821 (arr!46261 (Array (_ BitVec 32) (_ BitVec 64))) (size!46813 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95820)

(declare-datatypes ((List!32858 0))(
  ( (Nil!32855) (Cons!32854 (h!34102 (_ BitVec 64)) (t!47544 List!32858)) )
))
(declare-fun arrayNoDuplicates!0 (array!95820 (_ BitVec 32) List!32858) Bool)

(assert (=> b!1402512 (= res!941074 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32855))))

(declare-fun b!1402513 () Bool)

(declare-fun res!941080 () Bool)

(assert (=> b!1402513 (=> (not res!941080) (not e!794178))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95820 (_ BitVec 32)) Bool)

(assert (=> b!1402513 (= res!941080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402514 () Bool)

(declare-fun res!941082 () Bool)

(assert (=> b!1402514 (=> (not res!941082) (not e!794178))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402514 (= res!941082 (validKeyInArray!0 (select (arr!46261 a!2901) i!1037)))))

(declare-fun b!1402515 () Bool)

(declare-fun e!794176 () Bool)

(declare-fun e!794179 () Bool)

(assert (=> b!1402515 (= e!794176 e!794179)))

(declare-fun res!941076 () Bool)

(assert (=> b!1402515 (=> res!941076 e!794179)))

(declare-datatypes ((SeekEntryResult!10604 0))(
  ( (MissingZero!10604 (index!44793 (_ BitVec 32))) (Found!10604 (index!44794 (_ BitVec 32))) (Intermediate!10604 (undefined!11416 Bool) (index!44795 (_ BitVec 32)) (x!126412 (_ BitVec 32))) (Undefined!10604) (MissingVacant!10604 (index!44796 (_ BitVec 32))) )
))
(declare-fun lt!617687 () SeekEntryResult!10604)

(declare-fun lt!617689 () (_ BitVec 32))

(declare-fun lt!617685 () SeekEntryResult!10604)

(assert (=> b!1402515 (= res!941076 (or (bvslt (x!126412 lt!617687) #b00000000000000000000000000000000) (bvsgt (x!126412 lt!617687) #b01111111111111111111111111111110) (bvslt (x!126412 lt!617685) #b00000000000000000000000000000000) (bvsgt (x!126412 lt!617685) #b01111111111111111111111111111110) (bvslt lt!617689 #b00000000000000000000000000000000) (bvsge lt!617689 (size!46813 a!2901)) (bvslt (index!44795 lt!617687) #b00000000000000000000000000000000) (bvsge (index!44795 lt!617687) (size!46813 a!2901)) (bvslt (index!44795 lt!617685) #b00000000000000000000000000000000) (bvsge (index!44795 lt!617685) (size!46813 a!2901)) (not (= lt!617687 (Intermediate!10604 false (index!44795 lt!617687) (x!126412 lt!617687)))) (not (= lt!617685 (Intermediate!10604 false (index!44795 lt!617685) (x!126412 lt!617685))))))))

(declare-fun lt!617691 () array!95820)

(declare-fun lt!617688 () SeekEntryResult!10604)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95820 (_ BitVec 32)) SeekEntryResult!10604)

(assert (=> b!1402515 (= lt!617688 (seekKeyOrZeroReturnVacant!0 (x!126412 lt!617685) (index!44795 lt!617685) (index!44795 lt!617685) (select (arr!46261 a!2901) j!112) lt!617691 mask!2840))))

(declare-fun lt!617693 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95820 (_ BitVec 32)) SeekEntryResult!10604)

(assert (=> b!1402515 (= lt!617688 (seekEntryOrOpen!0 lt!617693 lt!617691 mask!2840))))

(assert (=> b!1402515 (and (not (undefined!11416 lt!617685)) (= (index!44795 lt!617685) i!1037) (bvslt (x!126412 lt!617685) (x!126412 lt!617687)) (= (select (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44795 lt!617685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47055 0))(
  ( (Unit!47056) )
))
(declare-fun lt!617686 () Unit!47055)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47055)

(assert (=> b!1402515 (= lt!617686 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617689 (x!126412 lt!617687) (index!44795 lt!617687) (x!126412 lt!617685) (index!44795 lt!617685) (undefined!11416 lt!617685) mask!2840))))

(declare-fun b!1402516 () Bool)

(assert (=> b!1402516 (= e!794179 true)))

(declare-fun lt!617690 () SeekEntryResult!10604)

(assert (=> b!1402516 (= lt!617690 lt!617688)))

(declare-fun lt!617684 () Unit!47055)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47055)

(assert (=> b!1402516 (= lt!617684 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617689 (x!126412 lt!617687) (index!44795 lt!617687) (x!126412 lt!617685) (index!44795 lt!617685) mask!2840))))

(declare-fun b!1402517 () Bool)

(declare-fun res!941077 () Bool)

(assert (=> b!1402517 (=> (not res!941077) (not e!794178))))

(assert (=> b!1402517 (= res!941077 (and (= (size!46813 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46813 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46813 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402518 () Bool)

(declare-fun res!941078 () Bool)

(assert (=> b!1402518 (=> (not res!941078) (not e!794178))))

(assert (=> b!1402518 (= res!941078 (validKeyInArray!0 (select (arr!46261 a!2901) j!112)))))

(declare-fun b!1402519 () Bool)

(declare-fun res!941083 () Bool)

(assert (=> b!1402519 (=> res!941083 e!794179)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95820 (_ BitVec 32)) SeekEntryResult!10604)

(assert (=> b!1402519 (= res!941083 (not (= lt!617685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617689 lt!617693 lt!617691 mask!2840))))))

(declare-fun b!1402520 () Bool)

(declare-fun e!794180 () Bool)

(assert (=> b!1402520 (= e!794180 e!794176)))

(declare-fun res!941079 () Bool)

(assert (=> b!1402520 (=> res!941079 e!794176)))

(get-info :version)

(assert (=> b!1402520 (= res!941079 (or (= lt!617687 lt!617685) (not ((_ is Intermediate!10604) lt!617685))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402520 (= lt!617685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617693 mask!2840) lt!617693 lt!617691 mask!2840))))

(assert (=> b!1402520 (= lt!617693 (select (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402520 (= lt!617691 (array!95821 (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46813 a!2901)))))

(declare-fun res!941075 () Bool)

(assert (=> start!120458 (=> (not res!941075) (not e!794178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120458 (= res!941075 (validMask!0 mask!2840))))

(assert (=> start!120458 e!794178))

(assert (=> start!120458 true))

(declare-fun array_inv!35494 (array!95820) Bool)

(assert (=> start!120458 (array_inv!35494 a!2901)))

(declare-fun b!1402521 () Bool)

(assert (=> b!1402521 (= e!794178 (not e!794180))))

(declare-fun res!941081 () Bool)

(assert (=> b!1402521 (=> res!941081 e!794180)))

(assert (=> b!1402521 (= res!941081 (or (not ((_ is Intermediate!10604) lt!617687)) (undefined!11416 lt!617687)))))

(assert (=> b!1402521 (= lt!617690 (Found!10604 j!112))))

(assert (=> b!1402521 (= lt!617690 (seekEntryOrOpen!0 (select (arr!46261 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402521 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617692 () Unit!47055)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47055)

(assert (=> b!1402521 (= lt!617692 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402521 (= lt!617687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617689 (select (arr!46261 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402521 (= lt!617689 (toIndex!0 (select (arr!46261 a!2901) j!112) mask!2840))))

(assert (= (and start!120458 res!941075) b!1402517))

(assert (= (and b!1402517 res!941077) b!1402514))

(assert (= (and b!1402514 res!941082) b!1402518))

(assert (= (and b!1402518 res!941078) b!1402513))

(assert (= (and b!1402513 res!941080) b!1402512))

(assert (= (and b!1402512 res!941074) b!1402521))

(assert (= (and b!1402521 (not res!941081)) b!1402520))

(assert (= (and b!1402520 (not res!941079)) b!1402515))

(assert (= (and b!1402515 (not res!941076)) b!1402519))

(assert (= (and b!1402519 (not res!941083)) b!1402516))

(declare-fun m!1290301 () Bool)

(assert (=> b!1402513 m!1290301))

(declare-fun m!1290303 () Bool)

(assert (=> b!1402519 m!1290303))

(declare-fun m!1290305 () Bool)

(assert (=> b!1402521 m!1290305))

(declare-fun m!1290307 () Bool)

(assert (=> b!1402521 m!1290307))

(assert (=> b!1402521 m!1290305))

(declare-fun m!1290309 () Bool)

(assert (=> b!1402521 m!1290309))

(assert (=> b!1402521 m!1290305))

(declare-fun m!1290311 () Bool)

(assert (=> b!1402521 m!1290311))

(assert (=> b!1402521 m!1290305))

(declare-fun m!1290313 () Bool)

(assert (=> b!1402521 m!1290313))

(declare-fun m!1290315 () Bool)

(assert (=> b!1402521 m!1290315))

(declare-fun m!1290317 () Bool)

(assert (=> b!1402516 m!1290317))

(declare-fun m!1290319 () Bool)

(assert (=> b!1402520 m!1290319))

(assert (=> b!1402520 m!1290319))

(declare-fun m!1290321 () Bool)

(assert (=> b!1402520 m!1290321))

(declare-fun m!1290323 () Bool)

(assert (=> b!1402520 m!1290323))

(declare-fun m!1290325 () Bool)

(assert (=> b!1402520 m!1290325))

(declare-fun m!1290327 () Bool)

(assert (=> b!1402512 m!1290327))

(declare-fun m!1290329 () Bool)

(assert (=> b!1402515 m!1290329))

(declare-fun m!1290331 () Bool)

(assert (=> b!1402515 m!1290331))

(assert (=> b!1402515 m!1290305))

(declare-fun m!1290333 () Bool)

(assert (=> b!1402515 m!1290333))

(assert (=> b!1402515 m!1290305))

(declare-fun m!1290335 () Bool)

(assert (=> b!1402515 m!1290335))

(assert (=> b!1402515 m!1290323))

(assert (=> b!1402518 m!1290305))

(assert (=> b!1402518 m!1290305))

(declare-fun m!1290337 () Bool)

(assert (=> b!1402518 m!1290337))

(declare-fun m!1290339 () Bool)

(assert (=> b!1402514 m!1290339))

(assert (=> b!1402514 m!1290339))

(declare-fun m!1290341 () Bool)

(assert (=> b!1402514 m!1290341))

(declare-fun m!1290343 () Bool)

(assert (=> start!120458 m!1290343))

(declare-fun m!1290345 () Bool)

(assert (=> start!120458 m!1290345))

(check-sat (not b!1402516) (not b!1402521) (not b!1402515) (not b!1402512) (not b!1402518) (not b!1402519) (not b!1402513) (not start!120458) (not b!1402514) (not b!1402520))
(check-sat)
