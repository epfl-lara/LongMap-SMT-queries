; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120014 () Bool)

(assert start!120014)

(declare-fun b!1397122 () Bool)

(declare-fun res!936087 () Bool)

(declare-fun e!790961 () Bool)

(assert (=> b!1397122 (=> (not res!936087) (not e!790961))))

(declare-datatypes ((array!95496 0))(
  ( (array!95497 (arr!46102 (Array (_ BitVec 32) (_ BitVec 64))) (size!46654 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95496)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397122 (= res!936087 (validKeyInArray!0 (select (arr!46102 a!2901) i!1037)))))

(declare-fun b!1397123 () Bool)

(declare-fun res!936086 () Bool)

(assert (=> b!1397123 (=> (not res!936086) (not e!790961))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95496 (_ BitVec 32)) Bool)

(assert (=> b!1397123 (= res!936086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397124 () Bool)

(declare-fun e!790963 () Bool)

(assert (=> b!1397124 (= e!790963 true)))

(declare-datatypes ((SeekEntryResult!10445 0))(
  ( (MissingZero!10445 (index!44151 (_ BitVec 32))) (Found!10445 (index!44152 (_ BitVec 32))) (Intermediate!10445 (undefined!11257 Bool) (index!44153 (_ BitVec 32)) (x!125808 (_ BitVec 32))) (Undefined!10445) (MissingVacant!10445 (index!44154 (_ BitVec 32))) )
))
(declare-fun lt!613832 () SeekEntryResult!10445)

(declare-fun lt!613831 () array!95496)

(declare-fun lt!613830 () (_ BitVec 32))

(declare-fun lt!613833 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95496 (_ BitVec 32)) SeekEntryResult!10445)

(assert (=> b!1397124 (= lt!613832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613830 lt!613833 lt!613831 mask!2840))))

(declare-fun b!1397125 () Bool)

(declare-fun res!936091 () Bool)

(assert (=> b!1397125 (=> (not res!936091) (not e!790961))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397125 (= res!936091 (and (= (size!46654 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46654 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46654 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397126 () Bool)

(declare-fun e!790962 () Bool)

(assert (=> b!1397126 (= e!790962 e!790963)))

(declare-fun res!936092 () Bool)

(assert (=> b!1397126 (=> res!936092 e!790963)))

(declare-fun lt!613835 () SeekEntryResult!10445)

(declare-fun lt!613829 () SeekEntryResult!10445)

(get-info :version)

(assert (=> b!1397126 (= res!936092 (or (= lt!613835 lt!613829) (not ((_ is Intermediate!10445) lt!613829)) (bvslt (x!125808 lt!613835) #b00000000000000000000000000000000) (bvsgt (x!125808 lt!613835) #b01111111111111111111111111111110) (bvslt lt!613830 #b00000000000000000000000000000000) (bvsge lt!613830 (size!46654 a!2901)) (bvslt (index!44153 lt!613835) #b00000000000000000000000000000000) (bvsge (index!44153 lt!613835) (size!46654 a!2901)) (not (= lt!613835 (Intermediate!10445 false (index!44153 lt!613835) (x!125808 lt!613835)))) (not (= lt!613829 (Intermediate!10445 (undefined!11257 lt!613829) (index!44153 lt!613829) (x!125808 lt!613829))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397126 (= lt!613829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613833 mask!2840) lt!613833 lt!613831 mask!2840))))

(assert (=> b!1397126 (= lt!613833 (select (store (arr!46102 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397126 (= lt!613831 (array!95497 (store (arr!46102 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46654 a!2901)))))

(declare-fun b!1397127 () Bool)

(declare-fun e!790964 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95496 (_ BitVec 32)) SeekEntryResult!10445)

(assert (=> b!1397127 (= e!790964 (= (seekEntryOrOpen!0 (select (arr!46102 a!2901) j!112) a!2901 mask!2840) (Found!10445 j!112)))))

(declare-fun b!1397129 () Bool)

(assert (=> b!1397129 (= e!790961 (not e!790962))))

(declare-fun res!936093 () Bool)

(assert (=> b!1397129 (=> res!936093 e!790962)))

(assert (=> b!1397129 (= res!936093 (or (not ((_ is Intermediate!10445) lt!613835)) (undefined!11257 lt!613835)))))

(assert (=> b!1397129 e!790964))

(declare-fun res!936089 () Bool)

(assert (=> b!1397129 (=> (not res!936089) (not e!790964))))

(assert (=> b!1397129 (= res!936089 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46737 0))(
  ( (Unit!46738) )
))
(declare-fun lt!613834 () Unit!46737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46737)

(assert (=> b!1397129 (= lt!613834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397129 (= lt!613835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613830 (select (arr!46102 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397129 (= lt!613830 (toIndex!0 (select (arr!46102 a!2901) j!112) mask!2840))))

(declare-fun b!1397130 () Bool)

(declare-fun res!936094 () Bool)

(assert (=> b!1397130 (=> (not res!936094) (not e!790961))))

(assert (=> b!1397130 (= res!936094 (validKeyInArray!0 (select (arr!46102 a!2901) j!112)))))

(declare-fun b!1397128 () Bool)

(declare-fun res!936090 () Bool)

(assert (=> b!1397128 (=> (not res!936090) (not e!790961))))

(declare-datatypes ((List!32699 0))(
  ( (Nil!32696) (Cons!32695 (h!33937 (_ BitVec 64)) (t!47385 List!32699)) )
))
(declare-fun arrayNoDuplicates!0 (array!95496 (_ BitVec 32) List!32699) Bool)

(assert (=> b!1397128 (= res!936090 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32696))))

(declare-fun res!936088 () Bool)

(assert (=> start!120014 (=> (not res!936088) (not e!790961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120014 (= res!936088 (validMask!0 mask!2840))))

(assert (=> start!120014 e!790961))

(assert (=> start!120014 true))

(declare-fun array_inv!35335 (array!95496) Bool)

(assert (=> start!120014 (array_inv!35335 a!2901)))

(assert (= (and start!120014 res!936088) b!1397125))

(assert (= (and b!1397125 res!936091) b!1397122))

(assert (= (and b!1397122 res!936087) b!1397130))

(assert (= (and b!1397130 res!936094) b!1397123))

(assert (= (and b!1397123 res!936086) b!1397128))

(assert (= (and b!1397128 res!936090) b!1397129))

(assert (= (and b!1397129 res!936089) b!1397127))

(assert (= (and b!1397129 (not res!936093)) b!1397126))

(assert (= (and b!1397126 (not res!936092)) b!1397124))

(declare-fun m!1283359 () Bool)

(assert (=> start!120014 m!1283359))

(declare-fun m!1283361 () Bool)

(assert (=> start!120014 m!1283361))

(declare-fun m!1283363 () Bool)

(assert (=> b!1397122 m!1283363))

(assert (=> b!1397122 m!1283363))

(declare-fun m!1283365 () Bool)

(assert (=> b!1397122 m!1283365))

(declare-fun m!1283367 () Bool)

(assert (=> b!1397126 m!1283367))

(assert (=> b!1397126 m!1283367))

(declare-fun m!1283369 () Bool)

(assert (=> b!1397126 m!1283369))

(declare-fun m!1283371 () Bool)

(assert (=> b!1397126 m!1283371))

(declare-fun m!1283373 () Bool)

(assert (=> b!1397126 m!1283373))

(declare-fun m!1283375 () Bool)

(assert (=> b!1397130 m!1283375))

(assert (=> b!1397130 m!1283375))

(declare-fun m!1283377 () Bool)

(assert (=> b!1397130 m!1283377))

(assert (=> b!1397127 m!1283375))

(assert (=> b!1397127 m!1283375))

(declare-fun m!1283379 () Bool)

(assert (=> b!1397127 m!1283379))

(assert (=> b!1397129 m!1283375))

(declare-fun m!1283381 () Bool)

(assert (=> b!1397129 m!1283381))

(assert (=> b!1397129 m!1283375))

(declare-fun m!1283383 () Bool)

(assert (=> b!1397129 m!1283383))

(assert (=> b!1397129 m!1283375))

(declare-fun m!1283385 () Bool)

(assert (=> b!1397129 m!1283385))

(declare-fun m!1283387 () Bool)

(assert (=> b!1397129 m!1283387))

(declare-fun m!1283389 () Bool)

(assert (=> b!1397123 m!1283389))

(declare-fun m!1283391 () Bool)

(assert (=> b!1397124 m!1283391))

(declare-fun m!1283393 () Bool)

(assert (=> b!1397128 m!1283393))

(check-sat (not b!1397124) (not b!1397129) (not b!1397126) (not b!1397127) (not start!120014) (not b!1397130) (not b!1397128) (not b!1397122) (not b!1397123))
(check-sat)
