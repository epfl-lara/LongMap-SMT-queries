; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121598 () Bool)

(assert start!121598)

(declare-fun b!1412565 () Bool)

(declare-fun res!949606 () Bool)

(declare-fun e!799387 () Bool)

(assert (=> b!1412565 (=> (not res!949606) (not e!799387))))

(declare-datatypes ((array!96489 0))(
  ( (array!96490 (arr!46582 (Array (_ BitVec 32) (_ BitVec 64))) (size!47134 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96489)

(declare-datatypes ((List!33179 0))(
  ( (Nil!33176) (Cons!33175 (h!34450 (_ BitVec 64)) (t!47865 List!33179)) )
))
(declare-fun arrayNoDuplicates!0 (array!96489 (_ BitVec 32) List!33179) Bool)

(assert (=> b!1412565 (= res!949606 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33176))))

(declare-fun b!1412566 () Bool)

(declare-fun e!799390 () Bool)

(assert (=> b!1412566 (= e!799387 (not e!799390))))

(declare-fun res!949607 () Bool)

(assert (=> b!1412566 (=> res!949607 e!799390)))

(declare-datatypes ((SeekEntryResult!10919 0))(
  ( (MissingZero!10919 (index!46056 (_ BitVec 32))) (Found!10919 (index!46057 (_ BitVec 32))) (Intermediate!10919 (undefined!11731 Bool) (index!46058 (_ BitVec 32)) (x!127643 (_ BitVec 32))) (Undefined!10919) (MissingVacant!10919 (index!46059 (_ BitVec 32))) )
))
(declare-fun lt!622292 () SeekEntryResult!10919)

(get-info :version)

(assert (=> b!1412566 (= res!949607 (or (not ((_ is Intermediate!10919) lt!622292)) (undefined!11731 lt!622292)))))

(declare-fun e!799389 () Bool)

(assert (=> b!1412566 e!799389))

(declare-fun res!949614 () Bool)

(assert (=> b!1412566 (=> (not res!949614) (not e!799389))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96489 (_ BitVec 32)) Bool)

(assert (=> b!1412566 (= res!949614 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47655 0))(
  ( (Unit!47656) )
))
(declare-fun lt!622289 () Unit!47655)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47655)

(assert (=> b!1412566 (= lt!622289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622293 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96489 (_ BitVec 32)) SeekEntryResult!10919)

(assert (=> b!1412566 (= lt!622292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622293 (select (arr!46582 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412566 (= lt!622293 (toIndex!0 (select (arr!46582 a!2901) j!112) mask!2840))))

(declare-fun b!1412567 () Bool)

(declare-fun res!949615 () Bool)

(assert (=> b!1412567 (=> (not res!949615) (not e!799387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412567 (= res!949615 (validKeyInArray!0 (select (arr!46582 a!2901) j!112)))))

(declare-fun b!1412568 () Bool)

(declare-fun e!799386 () Bool)

(assert (=> b!1412568 (= e!799390 e!799386)))

(declare-fun res!949608 () Bool)

(assert (=> b!1412568 (=> res!949608 e!799386)))

(declare-fun lt!622294 () SeekEntryResult!10919)

(assert (=> b!1412568 (= res!949608 (or (= lt!622292 lt!622294) (not ((_ is Intermediate!10919) lt!622294))))))

(declare-fun lt!622295 () array!96489)

(declare-fun lt!622290 () (_ BitVec 64))

(assert (=> b!1412568 (= lt!622294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622290 mask!2840) lt!622290 lt!622295 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412568 (= lt!622290 (select (store (arr!46582 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412568 (= lt!622295 (array!96490 (store (arr!46582 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47134 a!2901)))))

(declare-fun res!949610 () Bool)

(assert (=> start!121598 (=> (not res!949610) (not e!799387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121598 (= res!949610 (validMask!0 mask!2840))))

(assert (=> start!121598 e!799387))

(assert (=> start!121598 true))

(declare-fun array_inv!35815 (array!96489) Bool)

(assert (=> start!121598 (array_inv!35815 a!2901)))

(declare-fun b!1412569 () Bool)

(declare-fun res!949611 () Bool)

(assert (=> b!1412569 (=> (not res!949611) (not e!799387))))

(assert (=> b!1412569 (= res!949611 (validKeyInArray!0 (select (arr!46582 a!2901) i!1037)))))

(declare-fun b!1412570 () Bool)

(declare-fun res!949609 () Bool)

(assert (=> b!1412570 (=> (not res!949609) (not e!799387))))

(assert (=> b!1412570 (= res!949609 (and (= (size!47134 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47134 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47134 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412571 () Bool)

(declare-fun e!799391 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96489 (_ BitVec 32)) SeekEntryResult!10919)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96489 (_ BitVec 32)) SeekEntryResult!10919)

(assert (=> b!1412571 (= e!799391 (= (seekEntryOrOpen!0 lt!622290 lt!622295 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127643 lt!622294) (index!46058 lt!622294) (index!46058 lt!622294) (select (arr!46582 a!2901) j!112) lt!622295 mask!2840)))))

(declare-fun b!1412572 () Bool)

(assert (=> b!1412572 (= e!799389 (= (seekEntryOrOpen!0 (select (arr!46582 a!2901) j!112) a!2901 mask!2840) (Found!10919 j!112)))))

(declare-fun b!1412573 () Bool)

(assert (=> b!1412573 (= e!799386 true)))

(assert (=> b!1412573 e!799391))

(declare-fun res!949612 () Bool)

(assert (=> b!1412573 (=> (not res!949612) (not e!799391))))

(assert (=> b!1412573 (= res!949612 (and (not (undefined!11731 lt!622294)) (= (index!46058 lt!622294) i!1037) (bvslt (x!127643 lt!622294) (x!127643 lt!622292)) (= (select (store (arr!46582 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46058 lt!622294)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622291 () Unit!47655)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47655)

(assert (=> b!1412573 (= lt!622291 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622293 (x!127643 lt!622292) (index!46058 lt!622292) (x!127643 lt!622294) (index!46058 lt!622294) (undefined!11731 lt!622294) mask!2840))))

(declare-fun b!1412574 () Bool)

(declare-fun res!949613 () Bool)

(assert (=> b!1412574 (=> (not res!949613) (not e!799387))))

(assert (=> b!1412574 (= res!949613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121598 res!949610) b!1412570))

(assert (= (and b!1412570 res!949609) b!1412569))

(assert (= (and b!1412569 res!949611) b!1412567))

(assert (= (and b!1412567 res!949615) b!1412574))

(assert (= (and b!1412574 res!949613) b!1412565))

(assert (= (and b!1412565 res!949606) b!1412566))

(assert (= (and b!1412566 res!949614) b!1412572))

(assert (= (and b!1412566 (not res!949607)) b!1412568))

(assert (= (and b!1412568 (not res!949608)) b!1412573))

(assert (= (and b!1412573 res!949612) b!1412571))

(declare-fun m!1302217 () Bool)

(assert (=> b!1412571 m!1302217))

(declare-fun m!1302219 () Bool)

(assert (=> b!1412571 m!1302219))

(assert (=> b!1412571 m!1302219))

(declare-fun m!1302221 () Bool)

(assert (=> b!1412571 m!1302221))

(assert (=> b!1412567 m!1302219))

(assert (=> b!1412567 m!1302219))

(declare-fun m!1302223 () Bool)

(assert (=> b!1412567 m!1302223))

(assert (=> b!1412572 m!1302219))

(assert (=> b!1412572 m!1302219))

(declare-fun m!1302225 () Bool)

(assert (=> b!1412572 m!1302225))

(declare-fun m!1302227 () Bool)

(assert (=> b!1412568 m!1302227))

(assert (=> b!1412568 m!1302227))

(declare-fun m!1302229 () Bool)

(assert (=> b!1412568 m!1302229))

(declare-fun m!1302231 () Bool)

(assert (=> b!1412568 m!1302231))

(declare-fun m!1302233 () Bool)

(assert (=> b!1412568 m!1302233))

(assert (=> b!1412573 m!1302231))

(declare-fun m!1302235 () Bool)

(assert (=> b!1412573 m!1302235))

(declare-fun m!1302237 () Bool)

(assert (=> b!1412573 m!1302237))

(declare-fun m!1302239 () Bool)

(assert (=> start!121598 m!1302239))

(declare-fun m!1302241 () Bool)

(assert (=> start!121598 m!1302241))

(assert (=> b!1412566 m!1302219))

(declare-fun m!1302243 () Bool)

(assert (=> b!1412566 m!1302243))

(assert (=> b!1412566 m!1302219))

(declare-fun m!1302245 () Bool)

(assert (=> b!1412566 m!1302245))

(declare-fun m!1302247 () Bool)

(assert (=> b!1412566 m!1302247))

(assert (=> b!1412566 m!1302219))

(declare-fun m!1302249 () Bool)

(assert (=> b!1412566 m!1302249))

(declare-fun m!1302251 () Bool)

(assert (=> b!1412569 m!1302251))

(assert (=> b!1412569 m!1302251))

(declare-fun m!1302253 () Bool)

(assert (=> b!1412569 m!1302253))

(declare-fun m!1302255 () Bool)

(assert (=> b!1412565 m!1302255))

(declare-fun m!1302257 () Bool)

(assert (=> b!1412574 m!1302257))

(check-sat (not b!1412565) (not b!1412569) (not b!1412572) (not b!1412567) (not b!1412566) (not b!1412573) (not start!121598) (not b!1412571) (not b!1412568) (not b!1412574))
(check-sat)
