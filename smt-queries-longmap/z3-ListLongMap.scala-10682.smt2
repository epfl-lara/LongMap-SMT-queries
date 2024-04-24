; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125508 () Bool)

(assert start!125508)

(declare-fun b!1462771 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!822504 () Bool)

(declare-datatypes ((array!98794 0))(
  ( (array!98795 (arr!47680 (Array (_ BitVec 32) (_ BitVec 64))) (size!48231 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98794)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1462771 (= e!822504 (or (= (select (arr!47680 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47680 a!2862) intermediateBeforeIndex!19) (select (arr!47680 a!2862) j!93))))))

(declare-fun b!1462772 () Bool)

(declare-fun res!991358 () Bool)

(declare-fun e!822507 () Bool)

(assert (=> b!1462772 (=> (not res!991358) (not e!822507))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11829 0))(
  ( (MissingZero!11829 (index!49708 (_ BitVec 32))) (Found!11829 (index!49709 (_ BitVec 32))) (Intermediate!11829 (undefined!12641 Bool) (index!49710 (_ BitVec 32)) (x!131495 (_ BitVec 32))) (Undefined!11829) (MissingVacant!11829 (index!49711 (_ BitVec 32))) )
))
(declare-fun lt!640652 () SeekEntryResult!11829)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11829)

(assert (=> b!1462772 (= res!991358 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!640652))))

(declare-fun b!1462773 () Bool)

(declare-fun res!991370 () Bool)

(declare-fun e!822506 () Bool)

(assert (=> b!1462773 (=> (not res!991370) (not e!822506))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462773 (= res!991370 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462774 () Bool)

(declare-fun e!822511 () Bool)

(assert (=> b!1462774 (= e!822506 (not e!822511))))

(declare-fun res!991362 () Bool)

(assert (=> b!1462774 (=> res!991362 e!822511)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462774 (= res!991362 (or (and (= (select (arr!47680 a!2862) index!646) (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47680 a!2862) index!646) (select (arr!47680 a!2862) j!93))) (= (select (arr!47680 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462774 e!822504))

(declare-fun res!991365 () Bool)

(assert (=> b!1462774 (=> (not res!991365) (not e!822504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98794 (_ BitVec 32)) Bool)

(assert (=> b!1462774 (= res!991365 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49187 0))(
  ( (Unit!49188) )
))
(declare-fun lt!640653 () Unit!49187)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49187)

(assert (=> b!1462774 (= lt!640653 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!640651 () SeekEntryResult!11829)

(declare-fun b!1462775 () Bool)

(declare-fun lt!640649 () array!98794)

(declare-fun e!822512 () Bool)

(declare-fun lt!640648 () (_ BitVec 32))

(declare-fun lt!640654 () (_ BitVec 64))

(assert (=> b!1462775 (= e!822512 (not (= lt!640651 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640648 lt!640654 lt!640649 mask!2687))))))

(declare-fun b!1462776 () Bool)

(declare-fun res!991373 () Bool)

(assert (=> b!1462776 (=> (not res!991373) (not e!822504))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11829)

(assert (=> b!1462776 (= res!991373 (= (seekEntryOrOpen!0 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) (Found!11829 j!93)))))

(declare-fun res!991368 () Bool)

(declare-fun e!822513 () Bool)

(assert (=> start!125508 (=> (not res!991368) (not e!822513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125508 (= res!991368 (validMask!0 mask!2687))))

(assert (=> start!125508 e!822513))

(assert (=> start!125508 true))

(declare-fun array_inv!36961 (array!98794) Bool)

(assert (=> start!125508 (array_inv!36961 a!2862)))

(declare-fun b!1462777 () Bool)

(declare-fun res!991359 () Bool)

(assert (=> b!1462777 (=> (not res!991359) (not e!822506))))

(declare-fun e!822510 () Bool)

(assert (=> b!1462777 (= res!991359 e!822510)))

(declare-fun c!135228 () Bool)

(assert (=> b!1462777 (= c!135228 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462778 () Bool)

(declare-fun res!991372 () Bool)

(assert (=> b!1462778 (=> (not res!991372) (not e!822513))))

(assert (=> b!1462778 (= res!991372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462779 () Bool)

(declare-fun e!822508 () Bool)

(assert (=> b!1462779 (= e!822508 true)))

(declare-fun lt!640650 () Bool)

(assert (=> b!1462779 (= lt!640650 e!822512)))

(declare-fun c!135229 () Bool)

(assert (=> b!1462779 (= c!135229 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462780 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98794 (_ BitVec 32)) SeekEntryResult!11829)

(assert (=> b!1462780 (= e!822510 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640654 lt!640649 mask!2687) (seekEntryOrOpen!0 lt!640654 lt!640649 mask!2687)))))

(declare-fun b!1462781 () Bool)

(assert (=> b!1462781 (= e!822507 e!822506)))

(declare-fun res!991357 () Bool)

(assert (=> b!1462781 (=> (not res!991357) (not e!822506))))

(assert (=> b!1462781 (= res!991357 (= lt!640651 (Intermediate!11829 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462781 (= lt!640651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640654 mask!2687) lt!640654 lt!640649 mask!2687))))

(assert (=> b!1462781 (= lt!640654 (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462782 () Bool)

(declare-fun res!991361 () Bool)

(assert (=> b!1462782 (=> (not res!991361) (not e!822513))))

(assert (=> b!1462782 (= res!991361 (and (= (size!48231 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48231 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48231 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462783 () Bool)

(assert (=> b!1462783 (= e!822512 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640648 intermediateAfterIndex!19 lt!640654 lt!640649 mask!2687) (seekEntryOrOpen!0 lt!640654 lt!640649 mask!2687))))))

(declare-fun b!1462784 () Bool)

(declare-fun res!991364 () Bool)

(assert (=> b!1462784 (=> (not res!991364) (not e!822513))))

(declare-datatypes ((List!34168 0))(
  ( (Nil!34165) (Cons!34164 (h!35528 (_ BitVec 64)) (t!48854 List!34168)) )
))
(declare-fun arrayNoDuplicates!0 (array!98794 (_ BitVec 32) List!34168) Bool)

(assert (=> b!1462784 (= res!991364 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34165))))

(declare-fun b!1462785 () Bool)

(declare-fun res!991366 () Bool)

(assert (=> b!1462785 (=> res!991366 e!822508)))

(assert (=> b!1462785 (= res!991366 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640648 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!640652)))))

(declare-fun b!1462786 () Bool)

(assert (=> b!1462786 (= e!822510 (= lt!640651 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640654 lt!640649 mask!2687)))))

(declare-fun b!1462787 () Bool)

(declare-fun e!822505 () Bool)

(assert (=> b!1462787 (= e!822513 e!822505)))

(declare-fun res!991363 () Bool)

(assert (=> b!1462787 (=> (not res!991363) (not e!822505))))

(assert (=> b!1462787 (= res!991363 (= (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462787 (= lt!640649 (array!98795 (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48231 a!2862)))))

(declare-fun b!1462788 () Bool)

(declare-fun res!991371 () Bool)

(assert (=> b!1462788 (=> (not res!991371) (not e!822513))))

(assert (=> b!1462788 (= res!991371 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48231 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48231 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48231 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462789 () Bool)

(assert (=> b!1462789 (= e!822505 e!822507)))

(declare-fun res!991356 () Bool)

(assert (=> b!1462789 (=> (not res!991356) (not e!822507))))

(assert (=> b!1462789 (= res!991356 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47680 a!2862) j!93) mask!2687) (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!640652))))

(assert (=> b!1462789 (= lt!640652 (Intermediate!11829 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462790 () Bool)

(declare-fun res!991369 () Bool)

(assert (=> b!1462790 (=> (not res!991369) (not e!822513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462790 (= res!991369 (validKeyInArray!0 (select (arr!47680 a!2862) i!1006)))))

(declare-fun b!1462791 () Bool)

(assert (=> b!1462791 (= e!822511 e!822508)))

(declare-fun res!991367 () Bool)

(assert (=> b!1462791 (=> res!991367 e!822508)))

(assert (=> b!1462791 (= res!991367 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640648 #b00000000000000000000000000000000) (bvsge lt!640648 (size!48231 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462791 (= lt!640648 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1462792 () Bool)

(declare-fun res!991360 () Bool)

(assert (=> b!1462792 (=> (not res!991360) (not e!822513))))

(assert (=> b!1462792 (= res!991360 (validKeyInArray!0 (select (arr!47680 a!2862) j!93)))))

(assert (= (and start!125508 res!991368) b!1462782))

(assert (= (and b!1462782 res!991361) b!1462790))

(assert (= (and b!1462790 res!991369) b!1462792))

(assert (= (and b!1462792 res!991360) b!1462778))

(assert (= (and b!1462778 res!991372) b!1462784))

(assert (= (and b!1462784 res!991364) b!1462788))

(assert (= (and b!1462788 res!991371) b!1462787))

(assert (= (and b!1462787 res!991363) b!1462789))

(assert (= (and b!1462789 res!991356) b!1462772))

(assert (= (and b!1462772 res!991358) b!1462781))

(assert (= (and b!1462781 res!991357) b!1462777))

(assert (= (and b!1462777 c!135228) b!1462786))

(assert (= (and b!1462777 (not c!135228)) b!1462780))

(assert (= (and b!1462777 res!991359) b!1462773))

(assert (= (and b!1462773 res!991370) b!1462774))

(assert (= (and b!1462774 res!991365) b!1462776))

(assert (= (and b!1462776 res!991373) b!1462771))

(assert (= (and b!1462774 (not res!991362)) b!1462791))

(assert (= (and b!1462791 (not res!991367)) b!1462785))

(assert (= (and b!1462785 (not res!991366)) b!1462779))

(assert (= (and b!1462779 c!135229) b!1462775))

(assert (= (and b!1462779 (not c!135229)) b!1462783))

(declare-fun m!1350373 () Bool)

(assert (=> b!1462791 m!1350373))

(declare-fun m!1350375 () Bool)

(assert (=> b!1462786 m!1350375))

(declare-fun m!1350377 () Bool)

(assert (=> b!1462781 m!1350377))

(assert (=> b!1462781 m!1350377))

(declare-fun m!1350379 () Bool)

(assert (=> b!1462781 m!1350379))

(declare-fun m!1350381 () Bool)

(assert (=> b!1462781 m!1350381))

(declare-fun m!1350383 () Bool)

(assert (=> b!1462781 m!1350383))

(declare-fun m!1350385 () Bool)

(assert (=> b!1462785 m!1350385))

(assert (=> b!1462785 m!1350385))

(declare-fun m!1350387 () Bool)

(assert (=> b!1462785 m!1350387))

(assert (=> b!1462772 m!1350385))

(assert (=> b!1462772 m!1350385))

(declare-fun m!1350389 () Bool)

(assert (=> b!1462772 m!1350389))

(assert (=> b!1462787 m!1350381))

(declare-fun m!1350391 () Bool)

(assert (=> b!1462787 m!1350391))

(declare-fun m!1350393 () Bool)

(assert (=> b!1462775 m!1350393))

(declare-fun m!1350395 () Bool)

(assert (=> b!1462771 m!1350395))

(assert (=> b!1462771 m!1350385))

(declare-fun m!1350397 () Bool)

(assert (=> b!1462783 m!1350397))

(declare-fun m!1350399 () Bool)

(assert (=> b!1462783 m!1350399))

(assert (=> b!1462776 m!1350385))

(assert (=> b!1462776 m!1350385))

(declare-fun m!1350401 () Bool)

(assert (=> b!1462776 m!1350401))

(declare-fun m!1350403 () Bool)

(assert (=> b!1462780 m!1350403))

(assert (=> b!1462780 m!1350399))

(declare-fun m!1350405 () Bool)

(assert (=> b!1462790 m!1350405))

(assert (=> b!1462790 m!1350405))

(declare-fun m!1350407 () Bool)

(assert (=> b!1462790 m!1350407))

(assert (=> b!1462789 m!1350385))

(assert (=> b!1462789 m!1350385))

(declare-fun m!1350409 () Bool)

(assert (=> b!1462789 m!1350409))

(assert (=> b!1462789 m!1350409))

(assert (=> b!1462789 m!1350385))

(declare-fun m!1350411 () Bool)

(assert (=> b!1462789 m!1350411))

(declare-fun m!1350413 () Bool)

(assert (=> b!1462774 m!1350413))

(assert (=> b!1462774 m!1350381))

(declare-fun m!1350415 () Bool)

(assert (=> b!1462774 m!1350415))

(declare-fun m!1350417 () Bool)

(assert (=> b!1462774 m!1350417))

(declare-fun m!1350419 () Bool)

(assert (=> b!1462774 m!1350419))

(assert (=> b!1462774 m!1350385))

(assert (=> b!1462792 m!1350385))

(assert (=> b!1462792 m!1350385))

(declare-fun m!1350421 () Bool)

(assert (=> b!1462792 m!1350421))

(declare-fun m!1350423 () Bool)

(assert (=> b!1462784 m!1350423))

(declare-fun m!1350425 () Bool)

(assert (=> start!125508 m!1350425))

(declare-fun m!1350427 () Bool)

(assert (=> start!125508 m!1350427))

(declare-fun m!1350429 () Bool)

(assert (=> b!1462778 m!1350429))

(check-sat (not b!1462791) (not b!1462785) (not b!1462781) (not b!1462780) (not b!1462778) (not b!1462786) (not b!1462790) (not b!1462789) (not b!1462774) (not b!1462772) (not b!1462783) (not b!1462792) (not b!1462776) (not b!1462775) (not start!125508) (not b!1462784))
(check-sat)
