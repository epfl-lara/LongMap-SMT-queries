; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121982 () Bool)

(assert start!121982)

(declare-fun b!1415699 () Bool)

(declare-fun res!951741 () Bool)

(declare-fun e!801255 () Bool)

(assert (=> b!1415699 (=> (not res!951741) (not e!801255))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96668 0))(
  ( (array!96669 (arr!46665 (Array (_ BitVec 32) (_ BitVec 64))) (size!47215 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96668)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415699 (= res!951741 (and (= (size!47215 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47215 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47215 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!801254 () Bool)

(declare-fun lt!624323 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10976 0))(
  ( (MissingZero!10976 (index!46296 (_ BitVec 32))) (Found!10976 (index!46297 (_ BitVec 32))) (Intermediate!10976 (undefined!11788 Bool) (index!46298 (_ BitVec 32)) (x!127903 (_ BitVec 32))) (Undefined!10976) (MissingVacant!10976 (index!46299 (_ BitVec 32))) )
))
(declare-fun lt!624322 () SeekEntryResult!10976)

(declare-fun lt!624325 () array!96668)

(declare-fun b!1415700 () Bool)

(declare-fun lt!624327 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96668 (_ BitVec 32)) SeekEntryResult!10976)

(assert (=> b!1415700 (= e!801254 (= lt!624322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624327 lt!624323 lt!624325 mask!2840)))))

(declare-fun b!1415701 () Bool)

(declare-fun e!801256 () Bool)

(assert (=> b!1415701 (= e!801255 (not e!801256))))

(declare-fun res!951744 () Bool)

(assert (=> b!1415701 (=> res!951744 e!801256)))

(declare-fun lt!624324 () SeekEntryResult!10976)

(get-info :version)

(assert (=> b!1415701 (= res!951744 (or (not ((_ is Intermediate!10976) lt!624324)) (undefined!11788 lt!624324)))))

(declare-fun e!801260 () Bool)

(assert (=> b!1415701 e!801260))

(declare-fun res!951748 () Bool)

(assert (=> b!1415701 (=> (not res!951748) (not e!801260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96668 (_ BitVec 32)) Bool)

(assert (=> b!1415701 (= res!951748 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47926 0))(
  ( (Unit!47927) )
))
(declare-fun lt!624326 () Unit!47926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47926)

(assert (=> b!1415701 (= lt!624326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415701 (= lt!624324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624327 (select (arr!46665 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415701 (= lt!624327 (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840))))

(declare-fun b!1415702 () Bool)

(declare-fun res!951747 () Bool)

(assert (=> b!1415702 (=> (not res!951747) (not e!801255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415702 (= res!951747 (validKeyInArray!0 (select (arr!46665 a!2901) i!1037)))))

(declare-fun b!1415703 () Bool)

(declare-fun res!951742 () Bool)

(assert (=> b!1415703 (=> (not res!951742) (not e!801255))))

(assert (=> b!1415703 (= res!951742 (validKeyInArray!0 (select (arr!46665 a!2901) j!112)))))

(declare-fun e!801257 () Bool)

(declare-fun b!1415704 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96668 (_ BitVec 32)) SeekEntryResult!10976)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96668 (_ BitVec 32)) SeekEntryResult!10976)

(assert (=> b!1415704 (= e!801257 (= (seekEntryOrOpen!0 lt!624323 lt!624325 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127903 lt!624322) (index!46298 lt!624322) (index!46298 lt!624322) (select (arr!46665 a!2901) j!112) lt!624325 mask!2840)))))

(declare-fun b!1415705 () Bool)

(declare-fun res!951743 () Bool)

(assert (=> b!1415705 (=> (not res!951743) (not e!801255))))

(declare-datatypes ((List!33184 0))(
  ( (Nil!33181) (Cons!33180 (h!34467 (_ BitVec 64)) (t!47878 List!33184)) )
))
(declare-fun arrayNoDuplicates!0 (array!96668 (_ BitVec 32) List!33184) Bool)

(assert (=> b!1415705 (= res!951743 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33181))))

(declare-fun b!1415707 () Bool)

(assert (=> b!1415707 (= e!801260 (= (seekEntryOrOpen!0 (select (arr!46665 a!2901) j!112) a!2901 mask!2840) (Found!10976 j!112)))))

(declare-fun b!1415708 () Bool)

(declare-fun res!951746 () Bool)

(assert (=> b!1415708 (=> (not res!951746) (not e!801255))))

(assert (=> b!1415708 (= res!951746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415709 () Bool)

(declare-fun e!801258 () Bool)

(assert (=> b!1415709 (= e!801256 e!801258)))

(declare-fun res!951745 () Bool)

(assert (=> b!1415709 (=> res!951745 e!801258)))

(assert (=> b!1415709 (= res!951745 (or (= lt!624324 lt!624322) (not ((_ is Intermediate!10976) lt!624322))))))

(assert (=> b!1415709 (= lt!624322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624323 mask!2840) lt!624323 lt!624325 mask!2840))))

(assert (=> b!1415709 (= lt!624323 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415709 (= lt!624325 (array!96669 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47215 a!2901)))))

(declare-fun b!1415706 () Bool)

(assert (=> b!1415706 (= e!801258 e!801254)))

(declare-fun res!951749 () Bool)

(assert (=> b!1415706 (=> res!951749 e!801254)))

(assert (=> b!1415706 (= res!951749 (or (bvslt (x!127903 lt!624324) #b00000000000000000000000000000000) (bvsgt (x!127903 lt!624324) #b01111111111111111111111111111110) (bvslt (x!127903 lt!624322) #b00000000000000000000000000000000) (bvsgt (x!127903 lt!624322) #b01111111111111111111111111111110) (bvslt lt!624327 #b00000000000000000000000000000000) (bvsge lt!624327 (size!47215 a!2901)) (bvslt (index!46298 lt!624324) #b00000000000000000000000000000000) (bvsge (index!46298 lt!624324) (size!47215 a!2901)) (bvslt (index!46298 lt!624322) #b00000000000000000000000000000000) (bvsge (index!46298 lt!624322) (size!47215 a!2901)) (not (= lt!624324 (Intermediate!10976 false (index!46298 lt!624324) (x!127903 lt!624324)))) (not (= lt!624322 (Intermediate!10976 false (index!46298 lt!624322) (x!127903 lt!624322))))))))

(assert (=> b!1415706 e!801257))

(declare-fun res!951750 () Bool)

(assert (=> b!1415706 (=> (not res!951750) (not e!801257))))

(assert (=> b!1415706 (= res!951750 (and (not (undefined!11788 lt!624322)) (= (index!46298 lt!624322) i!1037) (bvslt (x!127903 lt!624322) (x!127903 lt!624324)) (= (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46298 lt!624322)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624321 () Unit!47926)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47926)

(assert (=> b!1415706 (= lt!624321 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624327 (x!127903 lt!624324) (index!46298 lt!624324) (x!127903 lt!624322) (index!46298 lt!624322) (undefined!11788 lt!624322) mask!2840))))

(declare-fun res!951751 () Bool)

(assert (=> start!121982 (=> (not res!951751) (not e!801255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121982 (= res!951751 (validMask!0 mask!2840))))

(assert (=> start!121982 e!801255))

(assert (=> start!121982 true))

(declare-fun array_inv!35693 (array!96668) Bool)

(assert (=> start!121982 (array_inv!35693 a!2901)))

(assert (= (and start!121982 res!951751) b!1415699))

(assert (= (and b!1415699 res!951741) b!1415702))

(assert (= (and b!1415702 res!951747) b!1415703))

(assert (= (and b!1415703 res!951742) b!1415708))

(assert (= (and b!1415708 res!951746) b!1415705))

(assert (= (and b!1415705 res!951743) b!1415701))

(assert (= (and b!1415701 res!951748) b!1415707))

(assert (= (and b!1415701 (not res!951744)) b!1415709))

(assert (= (and b!1415709 (not res!951745)) b!1415706))

(assert (= (and b!1415706 res!951750) b!1415704))

(assert (= (and b!1415706 (not res!951749)) b!1415700))

(declare-fun m!1306079 () Bool)

(assert (=> b!1415704 m!1306079))

(declare-fun m!1306081 () Bool)

(assert (=> b!1415704 m!1306081))

(assert (=> b!1415704 m!1306081))

(declare-fun m!1306083 () Bool)

(assert (=> b!1415704 m!1306083))

(declare-fun m!1306085 () Bool)

(assert (=> b!1415705 m!1306085))

(assert (=> b!1415703 m!1306081))

(assert (=> b!1415703 m!1306081))

(declare-fun m!1306087 () Bool)

(assert (=> b!1415703 m!1306087))

(declare-fun m!1306089 () Bool)

(assert (=> start!121982 m!1306089))

(declare-fun m!1306091 () Bool)

(assert (=> start!121982 m!1306091))

(assert (=> b!1415707 m!1306081))

(assert (=> b!1415707 m!1306081))

(declare-fun m!1306093 () Bool)

(assert (=> b!1415707 m!1306093))

(declare-fun m!1306095 () Bool)

(assert (=> b!1415702 m!1306095))

(assert (=> b!1415702 m!1306095))

(declare-fun m!1306097 () Bool)

(assert (=> b!1415702 m!1306097))

(declare-fun m!1306099 () Bool)

(assert (=> b!1415709 m!1306099))

(assert (=> b!1415709 m!1306099))

(declare-fun m!1306101 () Bool)

(assert (=> b!1415709 m!1306101))

(declare-fun m!1306103 () Bool)

(assert (=> b!1415709 m!1306103))

(declare-fun m!1306105 () Bool)

(assert (=> b!1415709 m!1306105))

(assert (=> b!1415701 m!1306081))

(declare-fun m!1306107 () Bool)

(assert (=> b!1415701 m!1306107))

(assert (=> b!1415701 m!1306081))

(declare-fun m!1306109 () Bool)

(assert (=> b!1415701 m!1306109))

(assert (=> b!1415701 m!1306081))

(declare-fun m!1306111 () Bool)

(assert (=> b!1415701 m!1306111))

(declare-fun m!1306113 () Bool)

(assert (=> b!1415701 m!1306113))

(declare-fun m!1306115 () Bool)

(assert (=> b!1415708 m!1306115))

(assert (=> b!1415706 m!1306103))

(declare-fun m!1306117 () Bool)

(assert (=> b!1415706 m!1306117))

(declare-fun m!1306119 () Bool)

(assert (=> b!1415706 m!1306119))

(declare-fun m!1306121 () Bool)

(assert (=> b!1415700 m!1306121))

(check-sat (not b!1415703) (not b!1415701) (not b!1415707) (not b!1415704) (not b!1415706) (not b!1415705) (not start!121982) (not b!1415708) (not b!1415702) (not b!1415700) (not b!1415709))
(check-sat)
