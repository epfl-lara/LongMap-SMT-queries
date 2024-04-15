; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121412 () Bool)

(assert start!121412)

(declare-datatypes ((SeekEntryResult!10859 0))(
  ( (MissingZero!10859 (index!45813 (_ BitVec 32))) (Found!10859 (index!45814 (_ BitVec 32))) (Intermediate!10859 (undefined!11671 Bool) (index!45815 (_ BitVec 32)) (x!127411 (_ BitVec 32))) (Undefined!10859) (MissingVacant!10859 (index!45816 (_ BitVec 32))) )
))
(declare-fun lt!621086 () SeekEntryResult!10859)

(declare-fun lt!621083 () SeekEntryResult!10859)

(declare-fun e!798261 () Bool)

(declare-fun b!1410578 () Bool)

(declare-fun lt!621085 () (_ BitVec 32))

(declare-datatypes ((array!96366 0))(
  ( (array!96367 (arr!46522 (Array (_ BitVec 32) (_ BitVec 64))) (size!47074 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96366)

(get-info :version)

(assert (=> b!1410578 (= e!798261 (or (= lt!621086 lt!621083) (not ((_ is Intermediate!10859) lt!621083)) (bvslt (x!127411 lt!621086) #b00000000000000000000000000000000) (bvsgt (x!127411 lt!621086) #b01111111111111111111111111111110) (bvslt lt!621085 #b00000000000000000000000000000000) (bvsge lt!621085 (size!47074 a!2901)) (bvslt (index!45815 lt!621086) #b00000000000000000000000000000000) (bvsge (index!45815 lt!621086) (size!47074 a!2901)) (= lt!621086 (Intermediate!10859 false (index!45815 lt!621086) (x!127411 lt!621086)))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96366 (_ BitVec 32)) SeekEntryResult!10859)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410578 (= lt!621083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96367 (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47074 a!2901)) mask!2840))))

(declare-fun b!1410579 () Bool)

(declare-fun res!947861 () Bool)

(declare-fun e!798263 () Bool)

(assert (=> b!1410579 (=> (not res!947861) (not e!798263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410579 (= res!947861 (validKeyInArray!0 (select (arr!46522 a!2901) i!1037)))))

(declare-fun e!798262 () Bool)

(declare-fun b!1410580 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96366 (_ BitVec 32)) SeekEntryResult!10859)

(assert (=> b!1410580 (= e!798262 (= (seekEntryOrOpen!0 (select (arr!46522 a!2901) j!112) a!2901 mask!2840) (Found!10859 j!112)))))

(declare-fun b!1410581 () Bool)

(declare-fun res!947856 () Bool)

(assert (=> b!1410581 (=> (not res!947856) (not e!798263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96366 (_ BitVec 32)) Bool)

(assert (=> b!1410581 (= res!947856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410582 () Bool)

(declare-fun res!947860 () Bool)

(assert (=> b!1410582 (=> (not res!947860) (not e!798263))))

(declare-datatypes ((List!33119 0))(
  ( (Nil!33116) (Cons!33115 (h!34387 (_ BitVec 64)) (t!47805 List!33119)) )
))
(declare-fun arrayNoDuplicates!0 (array!96366 (_ BitVec 32) List!33119) Bool)

(assert (=> b!1410582 (= res!947860 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33116))))

(declare-fun b!1410583 () Bool)

(assert (=> b!1410583 (= e!798263 (not e!798261))))

(declare-fun res!947862 () Bool)

(assert (=> b!1410583 (=> res!947862 e!798261)))

(assert (=> b!1410583 (= res!947862 (or (not ((_ is Intermediate!10859) lt!621086)) (undefined!11671 lt!621086)))))

(assert (=> b!1410583 e!798262))

(declare-fun res!947857 () Bool)

(assert (=> b!1410583 (=> (not res!947857) (not e!798262))))

(assert (=> b!1410583 (= res!947857 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47535 0))(
  ( (Unit!47536) )
))
(declare-fun lt!621084 () Unit!47535)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47535)

(assert (=> b!1410583 (= lt!621084 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410583 (= lt!621086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621085 (select (arr!46522 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410583 (= lt!621085 (toIndex!0 (select (arr!46522 a!2901) j!112) mask!2840))))

(declare-fun res!947863 () Bool)

(assert (=> start!121412 (=> (not res!947863) (not e!798263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121412 (= res!947863 (validMask!0 mask!2840))))

(assert (=> start!121412 e!798263))

(assert (=> start!121412 true))

(declare-fun array_inv!35755 (array!96366) Bool)

(assert (=> start!121412 (array_inv!35755 a!2901)))

(declare-fun b!1410584 () Bool)

(declare-fun res!947859 () Bool)

(assert (=> b!1410584 (=> (not res!947859) (not e!798263))))

(assert (=> b!1410584 (= res!947859 (and (= (size!47074 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47074 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47074 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410585 () Bool)

(declare-fun res!947858 () Bool)

(assert (=> b!1410585 (=> (not res!947858) (not e!798263))))

(assert (=> b!1410585 (= res!947858 (validKeyInArray!0 (select (arr!46522 a!2901) j!112)))))

(assert (= (and start!121412 res!947863) b!1410584))

(assert (= (and b!1410584 res!947859) b!1410579))

(assert (= (and b!1410579 res!947861) b!1410585))

(assert (= (and b!1410585 res!947858) b!1410581))

(assert (= (and b!1410581 res!947856) b!1410582))

(assert (= (and b!1410582 res!947860) b!1410583))

(assert (= (and b!1410583 res!947857) b!1410580))

(assert (= (and b!1410583 (not res!947862)) b!1410578))

(declare-fun m!1299727 () Bool)

(assert (=> b!1410582 m!1299727))

(declare-fun m!1299729 () Bool)

(assert (=> b!1410581 m!1299729))

(declare-fun m!1299731 () Bool)

(assert (=> b!1410585 m!1299731))

(assert (=> b!1410585 m!1299731))

(declare-fun m!1299733 () Bool)

(assert (=> b!1410585 m!1299733))

(declare-fun m!1299735 () Bool)

(assert (=> b!1410579 m!1299735))

(assert (=> b!1410579 m!1299735))

(declare-fun m!1299737 () Bool)

(assert (=> b!1410579 m!1299737))

(assert (=> b!1410580 m!1299731))

(assert (=> b!1410580 m!1299731))

(declare-fun m!1299739 () Bool)

(assert (=> b!1410580 m!1299739))

(declare-fun m!1299741 () Bool)

(assert (=> start!121412 m!1299741))

(declare-fun m!1299743 () Bool)

(assert (=> start!121412 m!1299743))

(declare-fun m!1299745 () Bool)

(assert (=> b!1410578 m!1299745))

(declare-fun m!1299747 () Bool)

(assert (=> b!1410578 m!1299747))

(assert (=> b!1410578 m!1299747))

(declare-fun m!1299749 () Bool)

(assert (=> b!1410578 m!1299749))

(assert (=> b!1410578 m!1299749))

(assert (=> b!1410578 m!1299747))

(declare-fun m!1299751 () Bool)

(assert (=> b!1410578 m!1299751))

(assert (=> b!1410583 m!1299731))

(declare-fun m!1299753 () Bool)

(assert (=> b!1410583 m!1299753))

(assert (=> b!1410583 m!1299731))

(assert (=> b!1410583 m!1299731))

(declare-fun m!1299755 () Bool)

(assert (=> b!1410583 m!1299755))

(declare-fun m!1299757 () Bool)

(assert (=> b!1410583 m!1299757))

(declare-fun m!1299759 () Bool)

(assert (=> b!1410583 m!1299759))

(check-sat (not b!1410581) (not b!1410580) (not b!1410578) (not b!1410582) (not b!1410579) (not b!1410583) (not b!1410585) (not start!121412))
(check-sat)
