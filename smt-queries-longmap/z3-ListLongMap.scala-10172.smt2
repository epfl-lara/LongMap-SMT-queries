; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120146 () Bool)

(assert start!120146)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95597 0))(
  ( (array!95598 (arr!46150 (Array (_ BitVec 32) (_ BitVec 64))) (size!46701 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95597)

(declare-fun e!791291 () Bool)

(declare-fun b!1397533 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10370 0))(
  ( (MissingZero!10370 (index!43851 (_ BitVec 32))) (Found!10370 (index!43852 (_ BitVec 32))) (Intermediate!10370 (undefined!11182 Bool) (index!43853 (_ BitVec 32)) (x!125675 (_ BitVec 32))) (Undefined!10370) (MissingVacant!10370 (index!43854 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95597 (_ BitVec 32)) SeekEntryResult!10370)

(assert (=> b!1397533 (= e!791291 (= (seekEntryOrOpen!0 (select (arr!46150 a!2901) j!112) a!2901 mask!2840) (Found!10370 j!112)))))

(declare-fun b!1397534 () Bool)

(declare-fun e!791287 () Bool)

(assert (=> b!1397534 (= e!791287 true)))

(declare-fun lt!613787 () array!95597)

(declare-fun lt!613790 () (_ BitVec 64))

(declare-fun lt!613792 () (_ BitVec 32))

(declare-fun lt!613788 () SeekEntryResult!10370)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95597 (_ BitVec 32)) SeekEntryResult!10370)

(assert (=> b!1397534 (= lt!613788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613792 lt!613790 lt!613787 mask!2840))))

(declare-fun res!935768 () Bool)

(declare-fun e!791288 () Bool)

(assert (=> start!120146 (=> (not res!935768) (not e!791288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120146 (= res!935768 (validMask!0 mask!2840))))

(assert (=> start!120146 e!791288))

(assert (=> start!120146 true))

(declare-fun array_inv!35431 (array!95597) Bool)

(assert (=> start!120146 (array_inv!35431 a!2901)))

(declare-fun b!1397535 () Bool)

(declare-fun res!935764 () Bool)

(assert (=> b!1397535 (=> (not res!935764) (not e!791288))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397535 (= res!935764 (validKeyInArray!0 (select (arr!46150 a!2901) i!1037)))))

(declare-fun b!1397536 () Bool)

(declare-fun e!791289 () Bool)

(assert (=> b!1397536 (= e!791288 (not e!791289))))

(declare-fun res!935765 () Bool)

(assert (=> b!1397536 (=> res!935765 e!791289)))

(declare-fun lt!613793 () SeekEntryResult!10370)

(get-info :version)

(assert (=> b!1397536 (= res!935765 (or (not ((_ is Intermediate!10370) lt!613793)) (undefined!11182 lt!613793)))))

(assert (=> b!1397536 e!791291))

(declare-fun res!935767 () Bool)

(assert (=> b!1397536 (=> (not res!935767) (not e!791291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95597 (_ BitVec 32)) Bool)

(assert (=> b!1397536 (= res!935767 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46771 0))(
  ( (Unit!46772) )
))
(declare-fun lt!613789 () Unit!46771)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46771)

(assert (=> b!1397536 (= lt!613789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397536 (= lt!613793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613792 (select (arr!46150 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397536 (= lt!613792 (toIndex!0 (select (arr!46150 a!2901) j!112) mask!2840))))

(declare-fun b!1397537 () Bool)

(declare-fun res!935763 () Bool)

(assert (=> b!1397537 (=> (not res!935763) (not e!791288))))

(assert (=> b!1397537 (= res!935763 (and (= (size!46701 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46701 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46701 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397538 () Bool)

(declare-fun res!935770 () Bool)

(assert (=> b!1397538 (=> (not res!935770) (not e!791288))))

(assert (=> b!1397538 (= res!935770 (validKeyInArray!0 (select (arr!46150 a!2901) j!112)))))

(declare-fun b!1397539 () Bool)

(declare-fun res!935766 () Bool)

(assert (=> b!1397539 (=> (not res!935766) (not e!791288))))

(assert (=> b!1397539 (= res!935766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397540 () Bool)

(assert (=> b!1397540 (= e!791289 e!791287)))

(declare-fun res!935762 () Bool)

(assert (=> b!1397540 (=> res!935762 e!791287)))

(declare-fun lt!613791 () SeekEntryResult!10370)

(assert (=> b!1397540 (= res!935762 (or (= lt!613793 lt!613791) (not ((_ is Intermediate!10370) lt!613791)) (bvslt (x!125675 lt!613793) #b00000000000000000000000000000000) (bvsgt (x!125675 lt!613793) #b01111111111111111111111111111110) (bvslt lt!613792 #b00000000000000000000000000000000) (bvsge lt!613792 (size!46701 a!2901)) (bvslt (index!43853 lt!613793) #b00000000000000000000000000000000) (bvsge (index!43853 lt!613793) (size!46701 a!2901)) (not (= lt!613793 (Intermediate!10370 false (index!43853 lt!613793) (x!125675 lt!613793)))) (not (= lt!613791 (Intermediate!10370 (undefined!11182 lt!613791) (index!43853 lt!613791) (x!125675 lt!613791))))))))

(assert (=> b!1397540 (= lt!613791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613790 mask!2840) lt!613790 lt!613787 mask!2840))))

(assert (=> b!1397540 (= lt!613790 (select (store (arr!46150 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397540 (= lt!613787 (array!95598 (store (arr!46150 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46701 a!2901)))))

(declare-fun b!1397541 () Bool)

(declare-fun res!935769 () Bool)

(assert (=> b!1397541 (=> (not res!935769) (not e!791288))))

(declare-datatypes ((List!32656 0))(
  ( (Nil!32653) (Cons!32652 (h!33902 (_ BitVec 64)) (t!47342 List!32656)) )
))
(declare-fun arrayNoDuplicates!0 (array!95597 (_ BitVec 32) List!32656) Bool)

(assert (=> b!1397541 (= res!935769 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32653))))

(assert (= (and start!120146 res!935768) b!1397537))

(assert (= (and b!1397537 res!935763) b!1397535))

(assert (= (and b!1397535 res!935764) b!1397538))

(assert (= (and b!1397538 res!935770) b!1397539))

(assert (= (and b!1397539 res!935766) b!1397541))

(assert (= (and b!1397541 res!935769) b!1397536))

(assert (= (and b!1397536 res!935767) b!1397533))

(assert (= (and b!1397536 (not res!935765)) b!1397540))

(assert (= (and b!1397540 (not res!935762)) b!1397534))

(declare-fun m!1284187 () Bool)

(assert (=> b!1397538 m!1284187))

(assert (=> b!1397538 m!1284187))

(declare-fun m!1284189 () Bool)

(assert (=> b!1397538 m!1284189))

(assert (=> b!1397533 m!1284187))

(assert (=> b!1397533 m!1284187))

(declare-fun m!1284191 () Bool)

(assert (=> b!1397533 m!1284191))

(declare-fun m!1284193 () Bool)

(assert (=> start!120146 m!1284193))

(declare-fun m!1284195 () Bool)

(assert (=> start!120146 m!1284195))

(declare-fun m!1284197 () Bool)

(assert (=> b!1397540 m!1284197))

(assert (=> b!1397540 m!1284197))

(declare-fun m!1284199 () Bool)

(assert (=> b!1397540 m!1284199))

(declare-fun m!1284201 () Bool)

(assert (=> b!1397540 m!1284201))

(declare-fun m!1284203 () Bool)

(assert (=> b!1397540 m!1284203))

(declare-fun m!1284205 () Bool)

(assert (=> b!1397535 m!1284205))

(assert (=> b!1397535 m!1284205))

(declare-fun m!1284207 () Bool)

(assert (=> b!1397535 m!1284207))

(declare-fun m!1284209 () Bool)

(assert (=> b!1397534 m!1284209))

(assert (=> b!1397536 m!1284187))

(declare-fun m!1284211 () Bool)

(assert (=> b!1397536 m!1284211))

(assert (=> b!1397536 m!1284187))

(declare-fun m!1284213 () Bool)

(assert (=> b!1397536 m!1284213))

(assert (=> b!1397536 m!1284187))

(declare-fun m!1284215 () Bool)

(assert (=> b!1397536 m!1284215))

(declare-fun m!1284217 () Bool)

(assert (=> b!1397536 m!1284217))

(declare-fun m!1284219 () Bool)

(assert (=> b!1397541 m!1284219))

(declare-fun m!1284221 () Bool)

(assert (=> b!1397539 m!1284221))

(check-sat (not b!1397540) (not b!1397541) (not b!1397534) (not b!1397536) (not b!1397538) (not b!1397535) (not b!1397539) (not start!120146) (not b!1397533))
(check-sat)
