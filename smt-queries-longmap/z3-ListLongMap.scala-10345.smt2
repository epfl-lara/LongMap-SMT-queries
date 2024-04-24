; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121808 () Bool)

(assert start!121808)

(declare-fun b!1414056 () Bool)

(declare-fun res!950362 () Bool)

(declare-fun e!800327 () Bool)

(assert (=> b!1414056 (=> (not res!950362) (not e!800327))))

(declare-datatypes ((array!96668 0))(
  ( (array!96669 (arr!46669 (Array (_ BitVec 32) (_ BitVec 64))) (size!47220 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96668)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96668 (_ BitVec 32)) Bool)

(assert (=> b!1414056 (= res!950362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414057 () Bool)

(declare-fun res!950370 () Bool)

(assert (=> b!1414057 (=> (not res!950370) (not e!800327))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414057 (= res!950370 (validKeyInArray!0 (select (arr!46669 a!2901) i!1037)))))

(declare-fun b!1414058 () Bool)

(declare-fun res!950365 () Bool)

(assert (=> b!1414058 (=> (not res!950365) (not e!800327))))

(declare-datatypes ((List!33175 0))(
  ( (Nil!33172) (Cons!33171 (h!34454 (_ BitVec 64)) (t!47861 List!33175)) )
))
(declare-fun arrayNoDuplicates!0 (array!96668 (_ BitVec 32) List!33175) Bool)

(assert (=> b!1414058 (= res!950365 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33172))))

(declare-fun res!950369 () Bool)

(assert (=> start!121808 (=> (not res!950369) (not e!800327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121808 (= res!950369 (validMask!0 mask!2840))))

(assert (=> start!121808 e!800327))

(assert (=> start!121808 true))

(declare-fun array_inv!35950 (array!96668) Bool)

(assert (=> start!121808 (array_inv!35950 a!2901)))

(declare-fun b!1414059 () Bool)

(declare-fun res!950367 () Bool)

(assert (=> b!1414059 (=> (not res!950367) (not e!800327))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1414059 (= res!950367 (and (= (size!47220 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47220 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47220 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414060 () Bool)

(declare-fun e!800329 () Bool)

(declare-fun e!800325 () Bool)

(assert (=> b!1414060 (= e!800329 e!800325)))

(declare-fun res!950363 () Bool)

(assert (=> b!1414060 (=> res!950363 e!800325)))

(declare-datatypes ((SeekEntryResult!10883 0))(
  ( (MissingZero!10883 (index!45912 (_ BitVec 32))) (Found!10883 (index!45913 (_ BitVec 32))) (Intermediate!10883 (undefined!11695 Bool) (index!45914 (_ BitVec 32)) (x!127653 (_ BitVec 32))) (Undefined!10883) (MissingVacant!10883 (index!45915 (_ BitVec 32))) )
))
(declare-fun lt!623071 () SeekEntryResult!10883)

(declare-fun lt!623072 () SeekEntryResult!10883)

(get-info :version)

(assert (=> b!1414060 (= res!950363 (or (= lt!623071 lt!623072) (not ((_ is Intermediate!10883) lt!623072))))))

(declare-fun lt!623068 () (_ BitVec 64))

(declare-fun lt!623067 () array!96668)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96668 (_ BitVec 32)) SeekEntryResult!10883)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414060 (= lt!623072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623068 mask!2840) lt!623068 lt!623067 mask!2840))))

(assert (=> b!1414060 (= lt!623068 (select (store (arr!46669 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414060 (= lt!623067 (array!96669 (store (arr!46669 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47220 a!2901)))))

(declare-fun b!1414061 () Bool)

(declare-fun e!800326 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96668 (_ BitVec 32)) SeekEntryResult!10883)

(assert (=> b!1414061 (= e!800326 (= (seekEntryOrOpen!0 (select (arr!46669 a!2901) j!112) a!2901 mask!2840) (Found!10883 j!112)))))

(declare-fun b!1414062 () Bool)

(declare-fun e!800328 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96668 (_ BitVec 32)) SeekEntryResult!10883)

(assert (=> b!1414062 (= e!800328 (= (seekEntryOrOpen!0 lt!623068 lt!623067 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127653 lt!623072) (index!45914 lt!623072) (index!45914 lt!623072) (select (arr!46669 a!2901) j!112) lt!623067 mask!2840)))))

(declare-fun b!1414063 () Bool)

(declare-fun res!950368 () Bool)

(assert (=> b!1414063 (=> (not res!950368) (not e!800327))))

(assert (=> b!1414063 (= res!950368 (validKeyInArray!0 (select (arr!46669 a!2901) j!112)))))

(declare-fun b!1414064 () Bool)

(assert (=> b!1414064 (= e!800327 (not e!800329))))

(declare-fun res!950371 () Bool)

(assert (=> b!1414064 (=> res!950371 e!800329)))

(assert (=> b!1414064 (= res!950371 (or (not ((_ is Intermediate!10883) lt!623071)) (undefined!11695 lt!623071)))))

(assert (=> b!1414064 e!800326))

(declare-fun res!950366 () Bool)

(assert (=> b!1414064 (=> (not res!950366) (not e!800326))))

(assert (=> b!1414064 (= res!950366 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47767 0))(
  ( (Unit!47768) )
))
(declare-fun lt!623069 () Unit!47767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47767)

(assert (=> b!1414064 (= lt!623069 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623066 () (_ BitVec 32))

(assert (=> b!1414064 (= lt!623071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623066 (select (arr!46669 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414064 (= lt!623066 (toIndex!0 (select (arr!46669 a!2901) j!112) mask!2840))))

(declare-fun b!1414065 () Bool)

(assert (=> b!1414065 (= e!800325 true)))

(assert (=> b!1414065 e!800328))

(declare-fun res!950364 () Bool)

(assert (=> b!1414065 (=> (not res!950364) (not e!800328))))

(assert (=> b!1414065 (= res!950364 (and (not (undefined!11695 lt!623072)) (= (index!45914 lt!623072) i!1037) (bvslt (x!127653 lt!623072) (x!127653 lt!623071)) (= (select (store (arr!46669 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45914 lt!623072)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623070 () Unit!47767)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47767)

(assert (=> b!1414065 (= lt!623070 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623066 (x!127653 lt!623071) (index!45914 lt!623071) (x!127653 lt!623072) (index!45914 lt!623072) (undefined!11695 lt!623072) mask!2840))))

(assert (= (and start!121808 res!950369) b!1414059))

(assert (= (and b!1414059 res!950367) b!1414057))

(assert (= (and b!1414057 res!950370) b!1414063))

(assert (= (and b!1414063 res!950368) b!1414056))

(assert (= (and b!1414056 res!950362) b!1414058))

(assert (= (and b!1414058 res!950365) b!1414064))

(assert (= (and b!1414064 res!950366) b!1414061))

(assert (= (and b!1414064 (not res!950371)) b!1414060))

(assert (= (and b!1414060 (not res!950363)) b!1414065))

(assert (= (and b!1414065 res!950364) b!1414062))

(declare-fun m!1304503 () Bool)

(assert (=> b!1414058 m!1304503))

(declare-fun m!1304505 () Bool)

(assert (=> b!1414056 m!1304505))

(declare-fun m!1304507 () Bool)

(assert (=> b!1414060 m!1304507))

(assert (=> b!1414060 m!1304507))

(declare-fun m!1304509 () Bool)

(assert (=> b!1414060 m!1304509))

(declare-fun m!1304511 () Bool)

(assert (=> b!1414060 m!1304511))

(declare-fun m!1304513 () Bool)

(assert (=> b!1414060 m!1304513))

(assert (=> b!1414065 m!1304511))

(declare-fun m!1304515 () Bool)

(assert (=> b!1414065 m!1304515))

(declare-fun m!1304517 () Bool)

(assert (=> b!1414065 m!1304517))

(declare-fun m!1304519 () Bool)

(assert (=> b!1414064 m!1304519))

(declare-fun m!1304521 () Bool)

(assert (=> b!1414064 m!1304521))

(assert (=> b!1414064 m!1304519))

(assert (=> b!1414064 m!1304519))

(declare-fun m!1304523 () Bool)

(assert (=> b!1414064 m!1304523))

(declare-fun m!1304525 () Bool)

(assert (=> b!1414064 m!1304525))

(declare-fun m!1304527 () Bool)

(assert (=> b!1414064 m!1304527))

(declare-fun m!1304529 () Bool)

(assert (=> b!1414057 m!1304529))

(assert (=> b!1414057 m!1304529))

(declare-fun m!1304531 () Bool)

(assert (=> b!1414057 m!1304531))

(declare-fun m!1304533 () Bool)

(assert (=> start!121808 m!1304533))

(declare-fun m!1304535 () Bool)

(assert (=> start!121808 m!1304535))

(assert (=> b!1414061 m!1304519))

(assert (=> b!1414061 m!1304519))

(declare-fun m!1304537 () Bool)

(assert (=> b!1414061 m!1304537))

(assert (=> b!1414063 m!1304519))

(assert (=> b!1414063 m!1304519))

(declare-fun m!1304539 () Bool)

(assert (=> b!1414063 m!1304539))

(declare-fun m!1304541 () Bool)

(assert (=> b!1414062 m!1304541))

(assert (=> b!1414062 m!1304519))

(assert (=> b!1414062 m!1304519))

(declare-fun m!1304543 () Bool)

(assert (=> b!1414062 m!1304543))

(check-sat (not b!1414058) (not b!1414056) (not b!1414064) (not start!121808) (not b!1414060) (not b!1414065) (not b!1414063) (not b!1414062) (not b!1414061) (not b!1414057))
(check-sat)
