; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120402 () Bool)

(assert start!120402)

(declare-fun b!1401641 () Bool)

(declare-fun res!940152 () Bool)

(declare-fun e!793667 () Bool)

(assert (=> b!1401641 (=> (not res!940152) (not e!793667))))

(declare-datatypes ((array!95811 0))(
  ( (array!95812 (arr!46256 (Array (_ BitVec 32) (_ BitVec 64))) (size!46806 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95811)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401641 (= res!940152 (validKeyInArray!0 (select (arr!46256 a!2901) i!1037)))))

(declare-fun b!1401642 () Bool)

(declare-fun res!940155 () Bool)

(assert (=> b!1401642 (=> (not res!940155) (not e!793667))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95811 (_ BitVec 32)) Bool)

(assert (=> b!1401642 (= res!940155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401643 () Bool)

(declare-fun res!940162 () Bool)

(assert (=> b!1401643 (=> (not res!940162) (not e!793667))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401643 (= res!940162 (validKeyInArray!0 (select (arr!46256 a!2901) j!112)))))

(declare-fun res!940159 () Bool)

(assert (=> start!120402 (=> (not res!940159) (not e!793667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120402 (= res!940159 (validMask!0 mask!2840))))

(assert (=> start!120402 e!793667))

(assert (=> start!120402 true))

(declare-fun array_inv!35284 (array!95811) Bool)

(assert (=> start!120402 (array_inv!35284 a!2901)))

(declare-fun b!1401644 () Bool)

(declare-fun e!793663 () Bool)

(declare-fun e!793664 () Bool)

(assert (=> b!1401644 (= e!793663 e!793664)))

(declare-fun res!940156 () Bool)

(assert (=> b!1401644 (=> res!940156 e!793664)))

(declare-datatypes ((SeekEntryResult!10573 0))(
  ( (MissingZero!10573 (index!44669 (_ BitVec 32))) (Found!10573 (index!44670 (_ BitVec 32))) (Intermediate!10573 (undefined!11385 Bool) (index!44671 (_ BitVec 32)) (x!126304 (_ BitVec 32))) (Undefined!10573) (MissingVacant!10573 (index!44672 (_ BitVec 32))) )
))
(declare-fun lt!617081 () SeekEntryResult!10573)

(declare-fun lt!617085 () SeekEntryResult!10573)

(assert (=> b!1401644 (= res!940156 (or (= lt!617081 lt!617085) (not (is-Intermediate!10573 lt!617085))))))

(declare-fun lt!617084 () array!95811)

(declare-fun lt!617080 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95811 (_ BitVec 32)) SeekEntryResult!10573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401644 (= lt!617085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617080 mask!2840) lt!617080 lt!617084 mask!2840))))

(assert (=> b!1401644 (= lt!617080 (select (store (arr!46256 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401644 (= lt!617084 (array!95812 (store (arr!46256 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46806 a!2901)))))

(declare-fun b!1401645 () Bool)

(declare-fun e!793661 () Bool)

(assert (=> b!1401645 (= e!793661 true)))

(declare-fun lt!617083 () SeekEntryResult!10573)

(declare-fun lt!617079 () (_ BitVec 32))

(assert (=> b!1401645 (= lt!617083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617079 lt!617080 lt!617084 mask!2840))))

(declare-fun b!1401646 () Bool)

(declare-fun res!940154 () Bool)

(assert (=> b!1401646 (=> (not res!940154) (not e!793667))))

(assert (=> b!1401646 (= res!940154 (and (= (size!46806 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46806 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46806 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401647 () Bool)

(declare-fun e!793666 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95811 (_ BitVec 32)) SeekEntryResult!10573)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95811 (_ BitVec 32)) SeekEntryResult!10573)

(assert (=> b!1401647 (= e!793666 (= (seekEntryOrOpen!0 lt!617080 lt!617084 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126304 lt!617085) (index!44671 lt!617085) (index!44671 lt!617085) (select (arr!46256 a!2901) j!112) lt!617084 mask!2840)))))

(declare-fun b!1401648 () Bool)

(assert (=> b!1401648 (= e!793664 e!793661)))

(declare-fun res!940157 () Bool)

(assert (=> b!1401648 (=> res!940157 e!793661)))

(assert (=> b!1401648 (= res!940157 (or (bvslt (x!126304 lt!617081) #b00000000000000000000000000000000) (bvsgt (x!126304 lt!617081) #b01111111111111111111111111111110) (bvslt (x!126304 lt!617085) #b00000000000000000000000000000000) (bvsgt (x!126304 lt!617085) #b01111111111111111111111111111110) (bvslt lt!617079 #b00000000000000000000000000000000) (bvsge lt!617079 (size!46806 a!2901)) (bvslt (index!44671 lt!617081) #b00000000000000000000000000000000) (bvsge (index!44671 lt!617081) (size!46806 a!2901)) (bvslt (index!44671 lt!617085) #b00000000000000000000000000000000) (bvsge (index!44671 lt!617085) (size!46806 a!2901)) (not (= lt!617081 (Intermediate!10573 false (index!44671 lt!617081) (x!126304 lt!617081)))) (not (= lt!617085 (Intermediate!10573 false (index!44671 lt!617085) (x!126304 lt!617085))))))))

(assert (=> b!1401648 e!793666))

(declare-fun res!940161 () Bool)

(assert (=> b!1401648 (=> (not res!940161) (not e!793666))))

(assert (=> b!1401648 (= res!940161 (and (not (undefined!11385 lt!617085)) (= (index!44671 lt!617085) i!1037) (bvslt (x!126304 lt!617085) (x!126304 lt!617081)) (= (select (store (arr!46256 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44671 lt!617085)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47150 0))(
  ( (Unit!47151) )
))
(declare-fun lt!617078 () Unit!47150)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47150)

(assert (=> b!1401648 (= lt!617078 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617079 (x!126304 lt!617081) (index!44671 lt!617081) (x!126304 lt!617085) (index!44671 lt!617085) (undefined!11385 lt!617085) mask!2840))))

(declare-fun b!1401649 () Bool)

(assert (=> b!1401649 (= e!793667 (not e!793663))))

(declare-fun res!940158 () Bool)

(assert (=> b!1401649 (=> res!940158 e!793663)))

(assert (=> b!1401649 (= res!940158 (or (not (is-Intermediate!10573 lt!617081)) (undefined!11385 lt!617081)))))

(declare-fun e!793662 () Bool)

(assert (=> b!1401649 e!793662))

(declare-fun res!940160 () Bool)

(assert (=> b!1401649 (=> (not res!940160) (not e!793662))))

(assert (=> b!1401649 (= res!940160 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617082 () Unit!47150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47150)

(assert (=> b!1401649 (= lt!617082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401649 (= lt!617081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617079 (select (arr!46256 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401649 (= lt!617079 (toIndex!0 (select (arr!46256 a!2901) j!112) mask!2840))))

(declare-fun b!1401650 () Bool)

(declare-fun res!940153 () Bool)

(assert (=> b!1401650 (=> (not res!940153) (not e!793667))))

(declare-datatypes ((List!32775 0))(
  ( (Nil!32772) (Cons!32771 (h!34019 (_ BitVec 64)) (t!47469 List!32775)) )
))
(declare-fun arrayNoDuplicates!0 (array!95811 (_ BitVec 32) List!32775) Bool)

(assert (=> b!1401650 (= res!940153 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32772))))

(declare-fun b!1401651 () Bool)

(assert (=> b!1401651 (= e!793662 (= (seekEntryOrOpen!0 (select (arr!46256 a!2901) j!112) a!2901 mask!2840) (Found!10573 j!112)))))

(assert (= (and start!120402 res!940159) b!1401646))

(assert (= (and b!1401646 res!940154) b!1401641))

(assert (= (and b!1401641 res!940152) b!1401643))

(assert (= (and b!1401643 res!940162) b!1401642))

(assert (= (and b!1401642 res!940155) b!1401650))

(assert (= (and b!1401650 res!940153) b!1401649))

(assert (= (and b!1401649 res!940160) b!1401651))

(assert (= (and b!1401649 (not res!940158)) b!1401644))

(assert (= (and b!1401644 (not res!940156)) b!1401648))

(assert (= (and b!1401648 res!940161) b!1401647))

(assert (= (and b!1401648 (not res!940157)) b!1401645))

(declare-fun m!1289493 () Bool)

(assert (=> start!120402 m!1289493))

(declare-fun m!1289495 () Bool)

(assert (=> start!120402 m!1289495))

(declare-fun m!1289497 () Bool)

(assert (=> b!1401649 m!1289497))

(declare-fun m!1289499 () Bool)

(assert (=> b!1401649 m!1289499))

(assert (=> b!1401649 m!1289497))

(declare-fun m!1289501 () Bool)

(assert (=> b!1401649 m!1289501))

(assert (=> b!1401649 m!1289497))

(declare-fun m!1289503 () Bool)

(assert (=> b!1401649 m!1289503))

(declare-fun m!1289505 () Bool)

(assert (=> b!1401649 m!1289505))

(declare-fun m!1289507 () Bool)

(assert (=> b!1401644 m!1289507))

(assert (=> b!1401644 m!1289507))

(declare-fun m!1289509 () Bool)

(assert (=> b!1401644 m!1289509))

(declare-fun m!1289511 () Bool)

(assert (=> b!1401644 m!1289511))

(declare-fun m!1289513 () Bool)

(assert (=> b!1401644 m!1289513))

(assert (=> b!1401648 m!1289511))

(declare-fun m!1289515 () Bool)

(assert (=> b!1401648 m!1289515))

(declare-fun m!1289517 () Bool)

(assert (=> b!1401648 m!1289517))

(declare-fun m!1289519 () Bool)

(assert (=> b!1401642 m!1289519))

(assert (=> b!1401651 m!1289497))

(assert (=> b!1401651 m!1289497))

(declare-fun m!1289521 () Bool)

(assert (=> b!1401651 m!1289521))

(assert (=> b!1401643 m!1289497))

(assert (=> b!1401643 m!1289497))

(declare-fun m!1289523 () Bool)

(assert (=> b!1401643 m!1289523))

(declare-fun m!1289525 () Bool)

(assert (=> b!1401641 m!1289525))

(assert (=> b!1401641 m!1289525))

(declare-fun m!1289527 () Bool)

(assert (=> b!1401641 m!1289527))

(declare-fun m!1289529 () Bool)

(assert (=> b!1401650 m!1289529))

(declare-fun m!1289531 () Bool)

(assert (=> b!1401647 m!1289531))

(assert (=> b!1401647 m!1289497))

(assert (=> b!1401647 m!1289497))

(declare-fun m!1289533 () Bool)

(assert (=> b!1401647 m!1289533))

(declare-fun m!1289535 () Bool)

(assert (=> b!1401645 m!1289535))

(push 1)

