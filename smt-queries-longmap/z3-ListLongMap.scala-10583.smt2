; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124638 () Bool)

(assert start!124638)

(declare-fun b!1443685 () Bool)

(declare-fun res!975774 () Bool)

(declare-fun e!813508 () Bool)

(assert (=> b!1443685 (=> (not res!975774) (not e!813508))))

(declare-datatypes ((array!98086 0))(
  ( (array!98087 (arr!47331 (Array (_ BitVec 32) (_ BitVec 64))) (size!47881 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98086)

(declare-datatypes ((List!33832 0))(
  ( (Nil!33829) (Cons!33828 (h!35178 (_ BitVec 64)) (t!48526 List!33832)) )
))
(declare-fun arrayNoDuplicates!0 (array!98086 (_ BitVec 32) List!33832) Bool)

(assert (=> b!1443685 (= res!975774 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33829))))

(declare-fun b!1443686 () Bool)

(declare-fun res!975764 () Bool)

(assert (=> b!1443686 (=> (not res!975764) (not e!813508))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443686 (= res!975764 (validKeyInArray!0 (select (arr!47331 a!2862) i!1006)))))

(declare-fun b!1443687 () Bool)

(declare-fun res!975771 () Bool)

(assert (=> b!1443687 (=> (not res!975771) (not e!813508))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443687 (= res!975771 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47881 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47881 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47881 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!633943 () (_ BitVec 64))

(declare-fun b!1443688 () Bool)

(declare-datatypes ((SeekEntryResult!11583 0))(
  ( (MissingZero!11583 (index!48724 (_ BitVec 32))) (Found!11583 (index!48725 (_ BitVec 32))) (Intermediate!11583 (undefined!12395 Bool) (index!48726 (_ BitVec 32)) (x!130424 (_ BitVec 32))) (Undefined!11583) (MissingVacant!11583 (index!48727 (_ BitVec 32))) )
))
(declare-fun lt!633948 () SeekEntryResult!11583)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633947 () array!98086)

(declare-fun e!813511 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98086 (_ BitVec 32)) SeekEntryResult!11583)

(assert (=> b!1443688 (= e!813511 (= lt!633948 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633943 lt!633947 mask!2687)))))

(declare-fun b!1443690 () Bool)

(declare-fun e!813512 () Bool)

(assert (=> b!1443690 (= e!813512 true)))

(declare-fun lt!633945 () SeekEntryResult!11583)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98086 (_ BitVec 32)) SeekEntryResult!11583)

(assert (=> b!1443690 (= lt!633945 (seekEntryOrOpen!0 lt!633943 lt!633947 mask!2687))))

(declare-fun b!1443691 () Bool)

(declare-fun res!975765 () Bool)

(declare-fun e!813509 () Bool)

(assert (=> b!1443691 (=> (not res!975765) (not e!813509))))

(declare-fun lt!633946 () SeekEntryResult!11583)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443691 (= res!975765 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47331 a!2862) j!93) a!2862 mask!2687) lt!633946))))

(declare-fun e!813510 () Bool)

(declare-fun b!1443692 () Bool)

(assert (=> b!1443692 (= e!813510 (or (= (select (arr!47331 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47331 a!2862) intermediateBeforeIndex!19) (select (arr!47331 a!2862) j!93))))))

(declare-fun b!1443693 () Bool)

(declare-fun res!975770 () Bool)

(assert (=> b!1443693 (=> (not res!975770) (not e!813508))))

(assert (=> b!1443693 (= res!975770 (validKeyInArray!0 (select (arr!47331 a!2862) j!93)))))

(declare-fun b!1443694 () Bool)

(declare-fun res!975762 () Bool)

(assert (=> b!1443694 (=> (not res!975762) (not e!813510))))

(assert (=> b!1443694 (= res!975762 (= (seekEntryOrOpen!0 (select (arr!47331 a!2862) j!93) a!2862 mask!2687) (Found!11583 j!93)))))

(declare-fun b!1443695 () Bool)

(declare-fun res!975766 () Bool)

(assert (=> b!1443695 (=> (not res!975766) (not e!813508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98086 (_ BitVec 32)) Bool)

(assert (=> b!1443695 (= res!975766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443696 () Bool)

(declare-fun e!813505 () Bool)

(assert (=> b!1443696 (= e!813508 e!813505)))

(declare-fun res!975761 () Bool)

(assert (=> b!1443696 (=> (not res!975761) (not e!813505))))

(assert (=> b!1443696 (= res!975761 (= (select (store (arr!47331 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443696 (= lt!633947 (array!98087 (store (arr!47331 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47881 a!2862)))))

(declare-fun b!1443697 () Bool)

(declare-fun res!975772 () Bool)

(declare-fun e!813506 () Bool)

(assert (=> b!1443697 (=> (not res!975772) (not e!813506))))

(assert (=> b!1443697 (= res!975772 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443698 () Bool)

(assert (=> b!1443698 (= e!813505 e!813509)))

(declare-fun res!975769 () Bool)

(assert (=> b!1443698 (=> (not res!975769) (not e!813509))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443698 (= res!975769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47331 a!2862) j!93) mask!2687) (select (arr!47331 a!2862) j!93) a!2862 mask!2687) lt!633946))))

(assert (=> b!1443698 (= lt!633946 (Intermediate!11583 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443699 () Bool)

(declare-fun res!975768 () Bool)

(assert (=> b!1443699 (=> (not res!975768) (not e!813508))))

(assert (=> b!1443699 (= res!975768 (and (= (size!47881 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47881 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47881 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443700 () Bool)

(assert (=> b!1443700 (= e!813506 (not e!813512))))

(declare-fun res!975763 () Bool)

(assert (=> b!1443700 (=> res!975763 e!813512)))

(assert (=> b!1443700 (= res!975763 (or (not (= (select (arr!47331 a!2862) index!646) (select (store (arr!47331 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47331 a!2862) index!646) (select (arr!47331 a!2862) j!93)))))))

(assert (=> b!1443700 e!813510))

(declare-fun res!975767 () Bool)

(assert (=> b!1443700 (=> (not res!975767) (not e!813510))))

(assert (=> b!1443700 (= res!975767 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48662 0))(
  ( (Unit!48663) )
))
(declare-fun lt!633944 () Unit!48662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48662)

(assert (=> b!1443700 (= lt!633944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443689 () Bool)

(assert (=> b!1443689 (= e!813509 e!813506)))

(declare-fun res!975760 () Bool)

(assert (=> b!1443689 (=> (not res!975760) (not e!813506))))

(assert (=> b!1443689 (= res!975760 (= lt!633948 (Intermediate!11583 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443689 (= lt!633948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633943 mask!2687) lt!633943 lt!633947 mask!2687))))

(assert (=> b!1443689 (= lt!633943 (select (store (arr!47331 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!975773 () Bool)

(assert (=> start!124638 (=> (not res!975773) (not e!813508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124638 (= res!975773 (validMask!0 mask!2687))))

(assert (=> start!124638 e!813508))

(assert (=> start!124638 true))

(declare-fun array_inv!36359 (array!98086) Bool)

(assert (=> start!124638 (array_inv!36359 a!2862)))

(declare-fun b!1443701 () Bool)

(declare-fun res!975775 () Bool)

(assert (=> b!1443701 (=> (not res!975775) (not e!813506))))

(assert (=> b!1443701 (= res!975775 e!813511)))

(declare-fun c!133473 () Bool)

(assert (=> b!1443701 (= c!133473 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443702 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98086 (_ BitVec 32)) SeekEntryResult!11583)

(assert (=> b!1443702 (= e!813511 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633943 lt!633947 mask!2687) (seekEntryOrOpen!0 lt!633943 lt!633947 mask!2687)))))

(assert (= (and start!124638 res!975773) b!1443699))

(assert (= (and b!1443699 res!975768) b!1443686))

(assert (= (and b!1443686 res!975764) b!1443693))

(assert (= (and b!1443693 res!975770) b!1443695))

(assert (= (and b!1443695 res!975766) b!1443685))

(assert (= (and b!1443685 res!975774) b!1443687))

(assert (= (and b!1443687 res!975771) b!1443696))

(assert (= (and b!1443696 res!975761) b!1443698))

(assert (= (and b!1443698 res!975769) b!1443691))

(assert (= (and b!1443691 res!975765) b!1443689))

(assert (= (and b!1443689 res!975760) b!1443701))

(assert (= (and b!1443701 c!133473) b!1443688))

(assert (= (and b!1443701 (not c!133473)) b!1443702))

(assert (= (and b!1443701 res!975775) b!1443697))

(assert (= (and b!1443697 res!975772) b!1443700))

(assert (= (and b!1443700 res!975767) b!1443694))

(assert (= (and b!1443694 res!975762) b!1443692))

(assert (= (and b!1443700 (not res!975763)) b!1443690))

(declare-fun m!1332753 () Bool)

(assert (=> b!1443685 m!1332753))

(declare-fun m!1332755 () Bool)

(assert (=> b!1443698 m!1332755))

(assert (=> b!1443698 m!1332755))

(declare-fun m!1332757 () Bool)

(assert (=> b!1443698 m!1332757))

(assert (=> b!1443698 m!1332757))

(assert (=> b!1443698 m!1332755))

(declare-fun m!1332759 () Bool)

(assert (=> b!1443698 m!1332759))

(declare-fun m!1332761 () Bool)

(assert (=> b!1443692 m!1332761))

(assert (=> b!1443692 m!1332755))

(assert (=> b!1443694 m!1332755))

(assert (=> b!1443694 m!1332755))

(declare-fun m!1332763 () Bool)

(assert (=> b!1443694 m!1332763))

(declare-fun m!1332765 () Bool)

(assert (=> b!1443700 m!1332765))

(declare-fun m!1332767 () Bool)

(assert (=> b!1443700 m!1332767))

(declare-fun m!1332769 () Bool)

(assert (=> b!1443700 m!1332769))

(declare-fun m!1332771 () Bool)

(assert (=> b!1443700 m!1332771))

(declare-fun m!1332773 () Bool)

(assert (=> b!1443700 m!1332773))

(assert (=> b!1443700 m!1332755))

(declare-fun m!1332775 () Bool)

(assert (=> start!124638 m!1332775))

(declare-fun m!1332777 () Bool)

(assert (=> start!124638 m!1332777))

(declare-fun m!1332779 () Bool)

(assert (=> b!1443702 m!1332779))

(declare-fun m!1332781 () Bool)

(assert (=> b!1443702 m!1332781))

(assert (=> b!1443691 m!1332755))

(assert (=> b!1443691 m!1332755))

(declare-fun m!1332783 () Bool)

(assert (=> b!1443691 m!1332783))

(declare-fun m!1332785 () Bool)

(assert (=> b!1443689 m!1332785))

(assert (=> b!1443689 m!1332785))

(declare-fun m!1332787 () Bool)

(assert (=> b!1443689 m!1332787))

(assert (=> b!1443689 m!1332767))

(declare-fun m!1332789 () Bool)

(assert (=> b!1443689 m!1332789))

(assert (=> b!1443696 m!1332767))

(declare-fun m!1332791 () Bool)

(assert (=> b!1443696 m!1332791))

(declare-fun m!1332793 () Bool)

(assert (=> b!1443686 m!1332793))

(assert (=> b!1443686 m!1332793))

(declare-fun m!1332795 () Bool)

(assert (=> b!1443686 m!1332795))

(assert (=> b!1443690 m!1332781))

(assert (=> b!1443693 m!1332755))

(assert (=> b!1443693 m!1332755))

(declare-fun m!1332797 () Bool)

(assert (=> b!1443693 m!1332797))

(declare-fun m!1332799 () Bool)

(assert (=> b!1443695 m!1332799))

(declare-fun m!1332801 () Bool)

(assert (=> b!1443688 m!1332801))

(check-sat (not b!1443702) (not b!1443698) (not b!1443693) (not b!1443689) (not b!1443694) (not b!1443691) (not b!1443690) (not b!1443686) (not b!1443685) (not start!124638) (not b!1443688) (not b!1443700) (not b!1443695))
(check-sat)
