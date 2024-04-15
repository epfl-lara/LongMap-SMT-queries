; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120428 () Bool)

(assert start!120428)

(declare-fun b!1402055 () Bool)

(declare-fun res!940622 () Bool)

(declare-fun e!793940 () Bool)

(assert (=> b!1402055 (=> (not res!940622) (not e!793940))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95790 0))(
  ( (array!95791 (arr!46246 (Array (_ BitVec 32) (_ BitVec 64))) (size!46798 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95790)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402055 (= res!940622 (and (= (size!46798 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46798 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46798 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402056 () Bool)

(declare-fun res!940620 () Bool)

(assert (=> b!1402056 (=> (not res!940620) (not e!793940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402056 (= res!940620 (validKeyInArray!0 (select (arr!46246 a!2901) i!1037)))))

(declare-fun e!793942 () Bool)

(declare-fun b!1402057 () Bool)

(declare-datatypes ((SeekEntryResult!10589 0))(
  ( (MissingZero!10589 (index!44733 (_ BitVec 32))) (Found!10589 (index!44734 (_ BitVec 32))) (Intermediate!10589 (undefined!11401 Bool) (index!44735 (_ BitVec 32)) (x!126357 (_ BitVec 32))) (Undefined!10589) (MissingVacant!10589 (index!44736 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95790 (_ BitVec 32)) SeekEntryResult!10589)

(assert (=> b!1402057 (= e!793942 (= (seekEntryOrOpen!0 (select (arr!46246 a!2901) j!112) a!2901 mask!2840) (Found!10589 j!112)))))

(declare-fun b!1402058 () Bool)

(declare-fun res!940619 () Bool)

(assert (=> b!1402058 (=> (not res!940619) (not e!793940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95790 (_ BitVec 32)) Bool)

(assert (=> b!1402058 (= res!940619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402059 () Bool)

(declare-fun res!940626 () Bool)

(assert (=> b!1402059 (=> (not res!940626) (not e!793940))))

(assert (=> b!1402059 (= res!940626 (validKeyInArray!0 (select (arr!46246 a!2901) j!112)))))

(declare-fun b!1402060 () Bool)

(declare-fun e!793943 () Bool)

(assert (=> b!1402060 (= e!793940 (not e!793943))))

(declare-fun res!940618 () Bool)

(assert (=> b!1402060 (=> res!940618 e!793943)))

(declare-fun lt!617251 () SeekEntryResult!10589)

(get-info :version)

(assert (=> b!1402060 (= res!940618 (or (not ((_ is Intermediate!10589) lt!617251)) (undefined!11401 lt!617251)))))

(assert (=> b!1402060 e!793942))

(declare-fun res!940623 () Bool)

(assert (=> b!1402060 (=> (not res!940623) (not e!793942))))

(assert (=> b!1402060 (= res!940623 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47025 0))(
  ( (Unit!47026) )
))
(declare-fun lt!617252 () Unit!47025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47025)

(assert (=> b!1402060 (= lt!617252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617248 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95790 (_ BitVec 32)) SeekEntryResult!10589)

(assert (=> b!1402060 (= lt!617251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617248 (select (arr!46246 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402060 (= lt!617248 (toIndex!0 (select (arr!46246 a!2901) j!112) mask!2840))))

(declare-fun res!940621 () Bool)

(assert (=> start!120428 (=> (not res!940621) (not e!793940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120428 (= res!940621 (validMask!0 mask!2840))))

(assert (=> start!120428 e!793940))

(assert (=> start!120428 true))

(declare-fun array_inv!35479 (array!95790) Bool)

(assert (=> start!120428 (array_inv!35479 a!2901)))

(declare-fun b!1402061 () Bool)

(declare-fun res!940624 () Bool)

(assert (=> b!1402061 (=> (not res!940624) (not e!793940))))

(declare-datatypes ((List!32843 0))(
  ( (Nil!32840) (Cons!32839 (h!34087 (_ BitVec 64)) (t!47529 List!32843)) )
))
(declare-fun arrayNoDuplicates!0 (array!95790 (_ BitVec 32) List!32843) Bool)

(assert (=> b!1402061 (= res!940624 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32840))))

(declare-fun b!1402062 () Bool)

(declare-fun e!793939 () Bool)

(declare-fun e!793937 () Bool)

(assert (=> b!1402062 (= e!793939 e!793937)))

(declare-fun res!940617 () Bool)

(assert (=> b!1402062 (=> res!940617 e!793937)))

(declare-fun lt!617249 () SeekEntryResult!10589)

(assert (=> b!1402062 (= res!940617 (or (bvslt (x!126357 lt!617251) #b00000000000000000000000000000000) (bvsgt (x!126357 lt!617251) #b01111111111111111111111111111110) (bvslt (x!126357 lt!617249) #b00000000000000000000000000000000) (bvsgt (x!126357 lt!617249) #b01111111111111111111111111111110) (bvslt lt!617248 #b00000000000000000000000000000000) (bvsge lt!617248 (size!46798 a!2901)) (bvslt (index!44735 lt!617251) #b00000000000000000000000000000000) (bvsge (index!44735 lt!617251) (size!46798 a!2901)) (bvslt (index!44735 lt!617249) #b00000000000000000000000000000000) (bvsge (index!44735 lt!617249) (size!46798 a!2901)) (not (= lt!617251 (Intermediate!10589 false (index!44735 lt!617251) (x!126357 lt!617251)))) (not (= lt!617249 (Intermediate!10589 false (index!44735 lt!617249) (x!126357 lt!617249))))))))

(declare-fun e!793938 () Bool)

(assert (=> b!1402062 e!793938))

(declare-fun res!940627 () Bool)

(assert (=> b!1402062 (=> (not res!940627) (not e!793938))))

(assert (=> b!1402062 (= res!940627 (and (not (undefined!11401 lt!617249)) (= (index!44735 lt!617249) i!1037) (bvslt (x!126357 lt!617249) (x!126357 lt!617251)) (= (select (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44735 lt!617249)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617253 () Unit!47025)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47025)

(assert (=> b!1402062 (= lt!617253 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617248 (x!126357 lt!617251) (index!44735 lt!617251) (x!126357 lt!617249) (index!44735 lt!617249) (undefined!11401 lt!617249) mask!2840))))

(declare-fun b!1402063 () Bool)

(declare-fun lt!617254 () (_ BitVec 64))

(declare-fun lt!617250 () array!95790)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95790 (_ BitVec 32)) SeekEntryResult!10589)

(assert (=> b!1402063 (= e!793938 (= (seekEntryOrOpen!0 lt!617254 lt!617250 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126357 lt!617249) (index!44735 lt!617249) (index!44735 lt!617249) (select (arr!46246 a!2901) j!112) lt!617250 mask!2840)))))

(declare-fun b!1402064 () Bool)

(assert (=> b!1402064 (= e!793937 true)))

(declare-fun lt!617255 () SeekEntryResult!10589)

(assert (=> b!1402064 (= lt!617255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617248 lt!617254 lt!617250 mask!2840))))

(declare-fun b!1402065 () Bool)

(assert (=> b!1402065 (= e!793943 e!793939)))

(declare-fun res!940625 () Bool)

(assert (=> b!1402065 (=> res!940625 e!793939)))

(assert (=> b!1402065 (= res!940625 (or (= lt!617251 lt!617249) (not ((_ is Intermediate!10589) lt!617249))))))

(assert (=> b!1402065 (= lt!617249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617254 mask!2840) lt!617254 lt!617250 mask!2840))))

(assert (=> b!1402065 (= lt!617254 (select (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402065 (= lt!617250 (array!95791 (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46798 a!2901)))))

(assert (= (and start!120428 res!940621) b!1402055))

(assert (= (and b!1402055 res!940622) b!1402056))

(assert (= (and b!1402056 res!940620) b!1402059))

(assert (= (and b!1402059 res!940626) b!1402058))

(assert (= (and b!1402058 res!940619) b!1402061))

(assert (= (and b!1402061 res!940624) b!1402060))

(assert (= (and b!1402060 res!940623) b!1402057))

(assert (= (and b!1402060 (not res!940618)) b!1402065))

(assert (= (and b!1402065 (not res!940625)) b!1402062))

(assert (= (and b!1402062 res!940627) b!1402063))

(assert (= (and b!1402062 (not res!940617)) b!1402064))

(declare-fun m!1289617 () Bool)

(assert (=> b!1402056 m!1289617))

(assert (=> b!1402056 m!1289617))

(declare-fun m!1289619 () Bool)

(assert (=> b!1402056 m!1289619))

(declare-fun m!1289621 () Bool)

(assert (=> b!1402065 m!1289621))

(assert (=> b!1402065 m!1289621))

(declare-fun m!1289623 () Bool)

(assert (=> b!1402065 m!1289623))

(declare-fun m!1289625 () Bool)

(assert (=> b!1402065 m!1289625))

(declare-fun m!1289627 () Bool)

(assert (=> b!1402065 m!1289627))

(declare-fun m!1289629 () Bool)

(assert (=> b!1402061 m!1289629))

(declare-fun m!1289631 () Bool)

(assert (=> b!1402060 m!1289631))

(declare-fun m!1289633 () Bool)

(assert (=> b!1402060 m!1289633))

(assert (=> b!1402060 m!1289631))

(declare-fun m!1289635 () Bool)

(assert (=> b!1402060 m!1289635))

(declare-fun m!1289637 () Bool)

(assert (=> b!1402060 m!1289637))

(assert (=> b!1402060 m!1289631))

(declare-fun m!1289639 () Bool)

(assert (=> b!1402060 m!1289639))

(assert (=> b!1402059 m!1289631))

(assert (=> b!1402059 m!1289631))

(declare-fun m!1289641 () Bool)

(assert (=> b!1402059 m!1289641))

(assert (=> b!1402057 m!1289631))

(assert (=> b!1402057 m!1289631))

(declare-fun m!1289643 () Bool)

(assert (=> b!1402057 m!1289643))

(declare-fun m!1289645 () Bool)

(assert (=> b!1402058 m!1289645))

(assert (=> b!1402062 m!1289625))

(declare-fun m!1289647 () Bool)

(assert (=> b!1402062 m!1289647))

(declare-fun m!1289649 () Bool)

(assert (=> b!1402062 m!1289649))

(declare-fun m!1289651 () Bool)

(assert (=> start!120428 m!1289651))

(declare-fun m!1289653 () Bool)

(assert (=> start!120428 m!1289653))

(declare-fun m!1289655 () Bool)

(assert (=> b!1402063 m!1289655))

(assert (=> b!1402063 m!1289631))

(assert (=> b!1402063 m!1289631))

(declare-fun m!1289657 () Bool)

(assert (=> b!1402063 m!1289657))

(declare-fun m!1289659 () Bool)

(assert (=> b!1402064 m!1289659))

(check-sat (not b!1402058) (not b!1402063) (not start!120428) (not b!1402057) (not b!1402062) (not b!1402064) (not b!1402065) (not b!1402060) (not b!1402059) (not b!1402056) (not b!1402061))
(check-sat)
