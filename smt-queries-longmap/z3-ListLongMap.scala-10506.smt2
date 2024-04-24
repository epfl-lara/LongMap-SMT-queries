; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123964 () Bool)

(assert start!123964)

(declare-fun b!1435697 () Bool)

(declare-fun res!968329 () Bool)

(declare-fun e!810401 () Bool)

(assert (=> b!1435697 (=> (not res!968329) (not e!810401))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97703 0))(
  ( (array!97704 (arr!47152 (Array (_ BitVec 32) (_ BitVec 64))) (size!47703 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97703)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435697 (= res!968329 (and (= (size!47703 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47703 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47703 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435698 () Bool)

(declare-fun res!968322 () Bool)

(assert (=> b!1435698 (=> (not res!968322) (not e!810401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97703 (_ BitVec 32)) Bool)

(assert (=> b!1435698 (= res!968322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435699 () Bool)

(declare-fun lt!631921 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11333 0))(
  ( (MissingZero!11333 (index!47724 (_ BitVec 32))) (Found!11333 (index!47725 (_ BitVec 32))) (Intermediate!11333 (undefined!12145 Bool) (index!47726 (_ BitVec 32)) (x!129537 (_ BitVec 32))) (Undefined!11333) (MissingVacant!11333 (index!47727 (_ BitVec 32))) )
))
(declare-fun lt!631920 () SeekEntryResult!11333)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun e!810403 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97703 (_ BitVec 32)) SeekEntryResult!11333)

(assert (=> b!1435699 (= e!810403 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631921 (select (arr!47152 a!2831) j!81) a!2831 mask!2608) lt!631920))))

(declare-fun b!1435700 () Bool)

(declare-fun e!810402 () Bool)

(assert (=> b!1435700 (= e!810402 e!810403)))

(declare-fun res!968331 () Bool)

(assert (=> b!1435700 (=> res!968331 e!810403)))

(assert (=> b!1435700 (= res!968331 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631921 #b00000000000000000000000000000000) (bvsge lt!631921 (size!47703 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435700 (= lt!631921 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1435701 () Bool)

(declare-fun res!968326 () Bool)

(assert (=> b!1435701 (=> (not res!968326) (not e!810401))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1435701 (= res!968326 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47703 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47703 a!2831))))))

(declare-fun b!1435702 () Bool)

(declare-fun res!968323 () Bool)

(declare-fun e!810399 () Bool)

(assert (=> b!1435702 (=> (not res!968323) (not e!810399))))

(declare-fun lt!631919 () array!97703)

(declare-fun lt!631917 () SeekEntryResult!11333)

(declare-fun lt!631922 () (_ BitVec 64))

(assert (=> b!1435702 (= res!968323 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631922 lt!631919 mask!2608) lt!631917))))

(declare-fun b!1435703 () Bool)

(declare-fun e!810400 () Bool)

(assert (=> b!1435703 (= e!810401 e!810400)))

(declare-fun res!968333 () Bool)

(assert (=> b!1435703 (=> (not res!968333) (not e!810400))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435703 (= res!968333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608) (select (arr!47152 a!2831) j!81) a!2831 mask!2608) lt!631920))))

(assert (=> b!1435703 (= lt!631920 (Intermediate!11333 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun e!810398 () Bool)

(declare-fun b!1435704 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97703 (_ BitVec 32)) SeekEntryResult!11333)

(assert (=> b!1435704 (= e!810398 (= (seekEntryOrOpen!0 (select (arr!47152 a!2831) j!81) a!2831 mask!2608) (Found!11333 j!81)))))

(declare-fun b!1435705 () Bool)

(assert (=> b!1435705 (= e!810400 e!810399)))

(declare-fun res!968330 () Bool)

(assert (=> b!1435705 (=> (not res!968330) (not e!810399))))

(assert (=> b!1435705 (= res!968330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631922 mask!2608) lt!631922 lt!631919 mask!2608) lt!631917))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435705 (= lt!631917 (Intermediate!11333 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435705 (= lt!631922 (select (store (arr!47152 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435705 (= lt!631919 (array!97704 (store (arr!47152 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47703 a!2831)))))

(declare-fun b!1435706 () Bool)

(declare-fun res!968327 () Bool)

(assert (=> b!1435706 (=> (not res!968327) (not e!810401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435706 (= res!968327 (validKeyInArray!0 (select (arr!47152 a!2831) i!982)))))

(declare-fun b!1435696 () Bool)

(declare-fun res!968325 () Bool)

(assert (=> b!1435696 (=> (not res!968325) (not e!810399))))

(assert (=> b!1435696 (= res!968325 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47152 a!2831) j!81) a!2831 mask!2608) lt!631920))))

(declare-fun res!968324 () Bool)

(assert (=> start!123964 (=> (not res!968324) (not e!810401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123964 (= res!968324 (validMask!0 mask!2608))))

(assert (=> start!123964 e!810401))

(assert (=> start!123964 true))

(declare-fun array_inv!36433 (array!97703) Bool)

(assert (=> start!123964 (array_inv!36433 a!2831)))

(declare-fun b!1435707 () Bool)

(declare-fun res!968332 () Bool)

(assert (=> b!1435707 (=> (not res!968332) (not e!810399))))

(assert (=> b!1435707 (= res!968332 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435708 () Bool)

(declare-fun res!968334 () Bool)

(assert (=> b!1435708 (=> (not res!968334) (not e!810401))))

(assert (=> b!1435708 (= res!968334 (validKeyInArray!0 (select (arr!47152 a!2831) j!81)))))

(declare-fun b!1435709 () Bool)

(assert (=> b!1435709 (= e!810399 (not e!810402))))

(declare-fun res!968335 () Bool)

(assert (=> b!1435709 (=> res!968335 e!810402)))

(assert (=> b!1435709 (= res!968335 (or (= (select (arr!47152 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47152 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47152 a!2831) index!585) (select (arr!47152 a!2831) j!81)) (= (select (store (arr!47152 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435709 e!810398))

(declare-fun res!968328 () Bool)

(assert (=> b!1435709 (=> (not res!968328) (not e!810398))))

(assert (=> b!1435709 (= res!968328 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48443 0))(
  ( (Unit!48444) )
))
(declare-fun lt!631918 () Unit!48443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48443)

(assert (=> b!1435709 (= lt!631918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435710 () Bool)

(declare-fun res!968321 () Bool)

(assert (=> b!1435710 (=> (not res!968321) (not e!810401))))

(declare-datatypes ((List!33649 0))(
  ( (Nil!33646) (Cons!33645 (h!34985 (_ BitVec 64)) (t!48335 List!33649)) )
))
(declare-fun arrayNoDuplicates!0 (array!97703 (_ BitVec 32) List!33649) Bool)

(assert (=> b!1435710 (= res!968321 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33646))))

(assert (= (and start!123964 res!968324) b!1435697))

(assert (= (and b!1435697 res!968329) b!1435706))

(assert (= (and b!1435706 res!968327) b!1435708))

(assert (= (and b!1435708 res!968334) b!1435698))

(assert (= (and b!1435698 res!968322) b!1435710))

(assert (= (and b!1435710 res!968321) b!1435701))

(assert (= (and b!1435701 res!968326) b!1435703))

(assert (= (and b!1435703 res!968333) b!1435705))

(assert (= (and b!1435705 res!968330) b!1435696))

(assert (= (and b!1435696 res!968325) b!1435702))

(assert (= (and b!1435702 res!968323) b!1435707))

(assert (= (and b!1435707 res!968332) b!1435709))

(assert (= (and b!1435709 res!968328) b!1435704))

(assert (= (and b!1435709 (not res!968335)) b!1435700))

(assert (= (and b!1435700 (not res!968331)) b!1435699))

(declare-fun m!1325431 () Bool)

(assert (=> b!1435703 m!1325431))

(assert (=> b!1435703 m!1325431))

(declare-fun m!1325433 () Bool)

(assert (=> b!1435703 m!1325433))

(assert (=> b!1435703 m!1325433))

(assert (=> b!1435703 m!1325431))

(declare-fun m!1325435 () Bool)

(assert (=> b!1435703 m!1325435))

(declare-fun m!1325437 () Bool)

(assert (=> b!1435706 m!1325437))

(assert (=> b!1435706 m!1325437))

(declare-fun m!1325439 () Bool)

(assert (=> b!1435706 m!1325439))

(declare-fun m!1325441 () Bool)

(assert (=> b!1435702 m!1325441))

(assert (=> b!1435699 m!1325431))

(assert (=> b!1435699 m!1325431))

(declare-fun m!1325443 () Bool)

(assert (=> b!1435699 m!1325443))

(declare-fun m!1325445 () Bool)

(assert (=> b!1435700 m!1325445))

(declare-fun m!1325447 () Bool)

(assert (=> b!1435710 m!1325447))

(declare-fun m!1325449 () Bool)

(assert (=> start!123964 m!1325449))

(declare-fun m!1325451 () Bool)

(assert (=> start!123964 m!1325451))

(assert (=> b!1435696 m!1325431))

(assert (=> b!1435696 m!1325431))

(declare-fun m!1325453 () Bool)

(assert (=> b!1435696 m!1325453))

(declare-fun m!1325455 () Bool)

(assert (=> b!1435705 m!1325455))

(assert (=> b!1435705 m!1325455))

(declare-fun m!1325457 () Bool)

(assert (=> b!1435705 m!1325457))

(declare-fun m!1325459 () Bool)

(assert (=> b!1435705 m!1325459))

(declare-fun m!1325461 () Bool)

(assert (=> b!1435705 m!1325461))

(declare-fun m!1325463 () Bool)

(assert (=> b!1435698 m!1325463))

(assert (=> b!1435704 m!1325431))

(assert (=> b!1435704 m!1325431))

(declare-fun m!1325465 () Bool)

(assert (=> b!1435704 m!1325465))

(assert (=> b!1435709 m!1325459))

(declare-fun m!1325467 () Bool)

(assert (=> b!1435709 m!1325467))

(declare-fun m!1325469 () Bool)

(assert (=> b!1435709 m!1325469))

(declare-fun m!1325471 () Bool)

(assert (=> b!1435709 m!1325471))

(assert (=> b!1435709 m!1325431))

(declare-fun m!1325473 () Bool)

(assert (=> b!1435709 m!1325473))

(assert (=> b!1435708 m!1325431))

(assert (=> b!1435708 m!1325431))

(declare-fun m!1325475 () Bool)

(assert (=> b!1435708 m!1325475))

(check-sat (not b!1435699) (not b!1435696) (not b!1435706) (not b!1435708) (not b!1435703) (not b!1435698) (not b!1435710) (not b!1435700) (not start!123964) (not b!1435704) (not b!1435705) (not b!1435702) (not b!1435709))
(check-sat)
(get-model)

(declare-fun b!1435811 () Bool)

(declare-fun e!810458 () Bool)

(declare-fun call!67599 () Bool)

(assert (=> b!1435811 (= e!810458 call!67599)))

(declare-fun b!1435812 () Bool)

(declare-fun e!810455 () Bool)

(declare-fun contains!9918 (List!33649 (_ BitVec 64)) Bool)

(assert (=> b!1435812 (= e!810455 (contains!9918 Nil!33646 (select (arr!47152 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435813 () Bool)

(declare-fun e!810457 () Bool)

(assert (=> b!1435813 (= e!810457 e!810458)))

(declare-fun c!133198 () Bool)

(assert (=> b!1435813 (= c!133198 (validKeyInArray!0 (select (arr!47152 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435814 () Bool)

(assert (=> b!1435814 (= e!810458 call!67599)))

(declare-fun bm!67596 () Bool)

(assert (=> bm!67596 (= call!67599 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133198 (Cons!33645 (select (arr!47152 a!2831) #b00000000000000000000000000000000) Nil!33646) Nil!33646)))))

(declare-fun b!1435815 () Bool)

(declare-fun e!810456 () Bool)

(assert (=> b!1435815 (= e!810456 e!810457)))

(declare-fun res!968434 () Bool)

(assert (=> b!1435815 (=> (not res!968434) (not e!810457))))

(assert (=> b!1435815 (= res!968434 (not e!810455))))

(declare-fun res!968433 () Bool)

(assert (=> b!1435815 (=> (not res!968433) (not e!810455))))

(assert (=> b!1435815 (= res!968433 (validKeyInArray!0 (select (arr!47152 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!154591 () Bool)

(declare-fun res!968432 () Bool)

(assert (=> d!154591 (=> res!968432 e!810456)))

(assert (=> d!154591 (= res!968432 (bvsge #b00000000000000000000000000000000 (size!47703 a!2831)))))

(assert (=> d!154591 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33646) e!810456)))

(assert (= (and d!154591 (not res!968432)) b!1435815))

(assert (= (and b!1435815 res!968433) b!1435812))

(assert (= (and b!1435815 res!968434) b!1435813))

(assert (= (and b!1435813 c!133198) b!1435814))

(assert (= (and b!1435813 (not c!133198)) b!1435811))

(assert (= (or b!1435814 b!1435811) bm!67596))

(declare-fun m!1325569 () Bool)

(assert (=> b!1435812 m!1325569))

(assert (=> b!1435812 m!1325569))

(declare-fun m!1325571 () Bool)

(assert (=> b!1435812 m!1325571))

(assert (=> b!1435813 m!1325569))

(assert (=> b!1435813 m!1325569))

(declare-fun m!1325573 () Bool)

(assert (=> b!1435813 m!1325573))

(assert (=> bm!67596 m!1325569))

(declare-fun m!1325575 () Bool)

(assert (=> bm!67596 m!1325575))

(assert (=> b!1435815 m!1325569))

(assert (=> b!1435815 m!1325569))

(assert (=> b!1435815 m!1325573))

(assert (=> b!1435710 d!154591))

(declare-fun b!1435834 () Bool)

(declare-fun e!810473 () Bool)

(declare-fun lt!631964 () SeekEntryResult!11333)

(assert (=> b!1435834 (= e!810473 (bvsge (x!129537 lt!631964) #b01111111111111111111111111111110))))

(declare-fun b!1435835 () Bool)

(declare-fun e!810470 () SeekEntryResult!11333)

(declare-fun e!810472 () SeekEntryResult!11333)

(assert (=> b!1435835 (= e!810470 e!810472)))

(declare-fun c!133206 () Bool)

(declare-fun lt!631963 () (_ BitVec 64))

(assert (=> b!1435835 (= c!133206 (or (= lt!631963 (select (arr!47152 a!2831) j!81)) (= (bvadd lt!631963 lt!631963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435836 () Bool)

(assert (=> b!1435836 (and (bvsge (index!47726 lt!631964) #b00000000000000000000000000000000) (bvslt (index!47726 lt!631964) (size!47703 a!2831)))))

(declare-fun e!810471 () Bool)

(assert (=> b!1435836 (= e!810471 (= (select (arr!47152 a!2831) (index!47726 lt!631964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435837 () Bool)

(assert (=> b!1435837 (= e!810472 (Intermediate!11333 false lt!631921 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435838 () Bool)

(assert (=> b!1435838 (and (bvsge (index!47726 lt!631964) #b00000000000000000000000000000000) (bvslt (index!47726 lt!631964) (size!47703 a!2831)))))

(declare-fun res!968441 () Bool)

(assert (=> b!1435838 (= res!968441 (= (select (arr!47152 a!2831) (index!47726 lt!631964)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435838 (=> res!968441 e!810471)))

(declare-fun b!1435839 () Bool)

(declare-fun e!810469 () Bool)

(assert (=> b!1435839 (= e!810473 e!810469)))

(declare-fun res!968442 () Bool)

(get-info :version)

(assert (=> b!1435839 (= res!968442 (and ((_ is Intermediate!11333) lt!631964) (not (undefined!12145 lt!631964)) (bvslt (x!129537 lt!631964) #b01111111111111111111111111111110) (bvsge (x!129537 lt!631964) #b00000000000000000000000000000000) (bvsge (x!129537 lt!631964) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1435839 (=> (not res!968442) (not e!810469))))

(declare-fun b!1435840 () Bool)

(assert (=> b!1435840 (and (bvsge (index!47726 lt!631964) #b00000000000000000000000000000000) (bvslt (index!47726 lt!631964) (size!47703 a!2831)))))

(declare-fun res!968443 () Bool)

(assert (=> b!1435840 (= res!968443 (= (select (arr!47152 a!2831) (index!47726 lt!631964)) (select (arr!47152 a!2831) j!81)))))

(assert (=> b!1435840 (=> res!968443 e!810471)))

(assert (=> b!1435840 (= e!810469 e!810471)))

(declare-fun d!154593 () Bool)

(assert (=> d!154593 e!810473))

(declare-fun c!133207 () Bool)

(assert (=> d!154593 (= c!133207 (and ((_ is Intermediate!11333) lt!631964) (undefined!12145 lt!631964)))))

(assert (=> d!154593 (= lt!631964 e!810470)))

(declare-fun c!133205 () Bool)

(assert (=> d!154593 (= c!133205 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154593 (= lt!631963 (select (arr!47152 a!2831) lt!631921))))

(assert (=> d!154593 (validMask!0 mask!2608)))

(assert (=> d!154593 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631921 (select (arr!47152 a!2831) j!81) a!2831 mask!2608) lt!631964)))

(declare-fun b!1435841 () Bool)

(assert (=> b!1435841 (= e!810470 (Intermediate!11333 true lt!631921 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435842 () Bool)

(assert (=> b!1435842 (= e!810472 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631921 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47152 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154593 c!133205) b!1435841))

(assert (= (and d!154593 (not c!133205)) b!1435835))

(assert (= (and b!1435835 c!133206) b!1435837))

(assert (= (and b!1435835 (not c!133206)) b!1435842))

(assert (= (and d!154593 c!133207) b!1435834))

(assert (= (and d!154593 (not c!133207)) b!1435839))

(assert (= (and b!1435839 res!968442) b!1435840))

(assert (= (and b!1435840 (not res!968443)) b!1435838))

(assert (= (and b!1435838 (not res!968441)) b!1435836))

(declare-fun m!1325577 () Bool)

(assert (=> b!1435838 m!1325577))

(declare-fun m!1325579 () Bool)

(assert (=> d!154593 m!1325579))

(assert (=> d!154593 m!1325449))

(assert (=> b!1435836 m!1325577))

(assert (=> b!1435840 m!1325577))

(declare-fun m!1325581 () Bool)

(assert (=> b!1435842 m!1325581))

(assert (=> b!1435842 m!1325581))

(assert (=> b!1435842 m!1325431))

(declare-fun m!1325583 () Bool)

(assert (=> b!1435842 m!1325583))

(assert (=> b!1435699 d!154593))

(declare-fun d!154595 () Bool)

(declare-fun lt!631967 () (_ BitVec 32))

(assert (=> d!154595 (and (bvsge lt!631967 #b00000000000000000000000000000000) (bvslt lt!631967 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154595 (= lt!631967 (choose!52 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(assert (=> d!154595 (validMask!0 mask!2608)))

(assert (=> d!154595 (= (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) lt!631967)))

(declare-fun bs!41764 () Bool)

(assert (= bs!41764 d!154595))

(declare-fun m!1325585 () Bool)

(assert (=> bs!41764 m!1325585))

(assert (=> bs!41764 m!1325449))

(assert (=> b!1435700 d!154595))

(declare-fun d!154597 () Bool)

(assert (=> d!154597 (= (validKeyInArray!0 (select (arr!47152 a!2831) j!81)) (and (not (= (select (arr!47152 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47152 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435708 d!154597))

(declare-fun b!1435851 () Bool)

(declare-fun e!810482 () Bool)

(declare-fun call!67602 () Bool)

(assert (=> b!1435851 (= e!810482 call!67602)))

(declare-fun d!154599 () Bool)

(declare-fun res!968448 () Bool)

(declare-fun e!810481 () Bool)

(assert (=> d!154599 (=> res!968448 e!810481)))

(assert (=> d!154599 (= res!968448 (bvsge #b00000000000000000000000000000000 (size!47703 a!2831)))))

(assert (=> d!154599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!810481)))

(declare-fun b!1435852 () Bool)

(declare-fun e!810480 () Bool)

(assert (=> b!1435852 (= e!810481 e!810480)))

(declare-fun c!133210 () Bool)

(assert (=> b!1435852 (= c!133210 (validKeyInArray!0 (select (arr!47152 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435853 () Bool)

(assert (=> b!1435853 (= e!810480 e!810482)))

(declare-fun lt!631976 () (_ BitVec 64))

(assert (=> b!1435853 (= lt!631976 (select (arr!47152 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631974 () Unit!48443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97703 (_ BitVec 64) (_ BitVec 32)) Unit!48443)

(assert (=> b!1435853 (= lt!631974 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631976 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435853 (arrayContainsKey!0 a!2831 lt!631976 #b00000000000000000000000000000000)))

(declare-fun lt!631975 () Unit!48443)

(assert (=> b!1435853 (= lt!631975 lt!631974)))

(declare-fun res!968449 () Bool)

(assert (=> b!1435853 (= res!968449 (= (seekEntryOrOpen!0 (select (arr!47152 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11333 #b00000000000000000000000000000000)))))

(assert (=> b!1435853 (=> (not res!968449) (not e!810482))))

(declare-fun bm!67599 () Bool)

(assert (=> bm!67599 (= call!67602 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1435854 () Bool)

(assert (=> b!1435854 (= e!810480 call!67602)))

(assert (= (and d!154599 (not res!968448)) b!1435852))

(assert (= (and b!1435852 c!133210) b!1435853))

(assert (= (and b!1435852 (not c!133210)) b!1435854))

(assert (= (and b!1435853 res!968449) b!1435851))

(assert (= (or b!1435851 b!1435854) bm!67599))

(assert (=> b!1435852 m!1325569))

(assert (=> b!1435852 m!1325569))

(assert (=> b!1435852 m!1325573))

(assert (=> b!1435853 m!1325569))

(declare-fun m!1325587 () Bool)

(assert (=> b!1435853 m!1325587))

(declare-fun m!1325589 () Bool)

(assert (=> b!1435853 m!1325589))

(assert (=> b!1435853 m!1325569))

(declare-fun m!1325591 () Bool)

(assert (=> b!1435853 m!1325591))

(declare-fun m!1325593 () Bool)

(assert (=> bm!67599 m!1325593))

(assert (=> b!1435698 d!154599))

(declare-fun d!154603 () Bool)

(assert (=> d!154603 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123964 d!154603))

(declare-fun d!154609 () Bool)

(assert (=> d!154609 (= (array_inv!36433 a!2831) (bvsge (size!47703 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123964 d!154609))

(declare-fun b!1435871 () Bool)

(declare-fun e!810497 () Bool)

(declare-fun call!67607 () Bool)

(assert (=> b!1435871 (= e!810497 call!67607)))

(declare-fun d!154611 () Bool)

(declare-fun res!968458 () Bool)

(declare-fun e!810496 () Bool)

(assert (=> d!154611 (=> res!968458 e!810496)))

(assert (=> d!154611 (= res!968458 (bvsge j!81 (size!47703 a!2831)))))

(assert (=> d!154611 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!810496)))

(declare-fun b!1435872 () Bool)

(declare-fun e!810495 () Bool)

(assert (=> b!1435872 (= e!810496 e!810495)))

(declare-fun c!133215 () Bool)

(assert (=> b!1435872 (= c!133215 (validKeyInArray!0 (select (arr!47152 a!2831) j!81)))))

(declare-fun b!1435873 () Bool)

(assert (=> b!1435873 (= e!810495 e!810497)))

(declare-fun lt!631994 () (_ BitVec 64))

(assert (=> b!1435873 (= lt!631994 (select (arr!47152 a!2831) j!81))))

(declare-fun lt!631992 () Unit!48443)

(assert (=> b!1435873 (= lt!631992 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631994 j!81))))

(assert (=> b!1435873 (arrayContainsKey!0 a!2831 lt!631994 #b00000000000000000000000000000000)))

(declare-fun lt!631993 () Unit!48443)

(assert (=> b!1435873 (= lt!631993 lt!631992)))

(declare-fun res!968459 () Bool)

(assert (=> b!1435873 (= res!968459 (= (seekEntryOrOpen!0 (select (arr!47152 a!2831) j!81) a!2831 mask!2608) (Found!11333 j!81)))))

(assert (=> b!1435873 (=> (not res!968459) (not e!810497))))

(declare-fun bm!67604 () Bool)

(assert (=> bm!67604 (= call!67607 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1435874 () Bool)

(assert (=> b!1435874 (= e!810495 call!67607)))

(assert (= (and d!154611 (not res!968458)) b!1435872))

(assert (= (and b!1435872 c!133215) b!1435873))

(assert (= (and b!1435872 (not c!133215)) b!1435874))

(assert (= (and b!1435873 res!968459) b!1435871))

(assert (= (or b!1435871 b!1435874) bm!67604))

(assert (=> b!1435872 m!1325431))

(assert (=> b!1435872 m!1325431))

(assert (=> b!1435872 m!1325475))

(assert (=> b!1435873 m!1325431))

(declare-fun m!1325615 () Bool)

(assert (=> b!1435873 m!1325615))

(declare-fun m!1325617 () Bool)

(assert (=> b!1435873 m!1325617))

(assert (=> b!1435873 m!1325431))

(assert (=> b!1435873 m!1325465))

(declare-fun m!1325619 () Bool)

(assert (=> bm!67604 m!1325619))

(assert (=> b!1435709 d!154611))

(declare-fun d!154617 () Bool)

(assert (=> d!154617 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631997 () Unit!48443)

(declare-fun choose!38 (array!97703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48443)

(assert (=> d!154617 (= lt!631997 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154617 (validMask!0 mask!2608)))

(assert (=> d!154617 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631997)))

(declare-fun bs!41766 () Bool)

(assert (= bs!41766 d!154617))

(assert (=> bs!41766 m!1325471))

(declare-fun m!1325621 () Bool)

(assert (=> bs!41766 m!1325621))

(assert (=> bs!41766 m!1325449))

(assert (=> b!1435709 d!154617))

(declare-fun b!1435875 () Bool)

(declare-fun e!810502 () Bool)

(declare-fun lt!631999 () SeekEntryResult!11333)

(assert (=> b!1435875 (= e!810502 (bvsge (x!129537 lt!631999) #b01111111111111111111111111111110))))

(declare-fun b!1435876 () Bool)

(declare-fun e!810499 () SeekEntryResult!11333)

(declare-fun e!810501 () SeekEntryResult!11333)

(assert (=> b!1435876 (= e!810499 e!810501)))

(declare-fun c!133217 () Bool)

(declare-fun lt!631998 () (_ BitVec 64))

(assert (=> b!1435876 (= c!133217 (or (= lt!631998 lt!631922) (= (bvadd lt!631998 lt!631998) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435877 () Bool)

(assert (=> b!1435877 (and (bvsge (index!47726 lt!631999) #b00000000000000000000000000000000) (bvslt (index!47726 lt!631999) (size!47703 lt!631919)))))

(declare-fun e!810500 () Bool)

(assert (=> b!1435877 (= e!810500 (= (select (arr!47152 lt!631919) (index!47726 lt!631999)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435878 () Bool)

(assert (=> b!1435878 (= e!810501 (Intermediate!11333 false (toIndex!0 lt!631922 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435879 () Bool)

(assert (=> b!1435879 (and (bvsge (index!47726 lt!631999) #b00000000000000000000000000000000) (bvslt (index!47726 lt!631999) (size!47703 lt!631919)))))

(declare-fun res!968460 () Bool)

(assert (=> b!1435879 (= res!968460 (= (select (arr!47152 lt!631919) (index!47726 lt!631999)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435879 (=> res!968460 e!810500)))

(declare-fun b!1435880 () Bool)

(declare-fun e!810498 () Bool)

(assert (=> b!1435880 (= e!810502 e!810498)))

(declare-fun res!968461 () Bool)

(assert (=> b!1435880 (= res!968461 (and ((_ is Intermediate!11333) lt!631999) (not (undefined!12145 lt!631999)) (bvslt (x!129537 lt!631999) #b01111111111111111111111111111110) (bvsge (x!129537 lt!631999) #b00000000000000000000000000000000) (bvsge (x!129537 lt!631999) #b00000000000000000000000000000000)))))

(assert (=> b!1435880 (=> (not res!968461) (not e!810498))))

(declare-fun b!1435881 () Bool)

(assert (=> b!1435881 (and (bvsge (index!47726 lt!631999) #b00000000000000000000000000000000) (bvslt (index!47726 lt!631999) (size!47703 lt!631919)))))

(declare-fun res!968462 () Bool)

(assert (=> b!1435881 (= res!968462 (= (select (arr!47152 lt!631919) (index!47726 lt!631999)) lt!631922))))

(assert (=> b!1435881 (=> res!968462 e!810500)))

(assert (=> b!1435881 (= e!810498 e!810500)))

(declare-fun d!154621 () Bool)

(assert (=> d!154621 e!810502))

(declare-fun c!133218 () Bool)

(assert (=> d!154621 (= c!133218 (and ((_ is Intermediate!11333) lt!631999) (undefined!12145 lt!631999)))))

(assert (=> d!154621 (= lt!631999 e!810499)))

(declare-fun c!133216 () Bool)

(assert (=> d!154621 (= c!133216 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154621 (= lt!631998 (select (arr!47152 lt!631919) (toIndex!0 lt!631922 mask!2608)))))

(assert (=> d!154621 (validMask!0 mask!2608)))

(assert (=> d!154621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631922 mask!2608) lt!631922 lt!631919 mask!2608) lt!631999)))

(declare-fun b!1435882 () Bool)

(assert (=> b!1435882 (= e!810499 (Intermediate!11333 true (toIndex!0 lt!631922 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435883 () Bool)

(assert (=> b!1435883 (= e!810501 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631922 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!631922 lt!631919 mask!2608))))

(assert (= (and d!154621 c!133216) b!1435882))

(assert (= (and d!154621 (not c!133216)) b!1435876))

(assert (= (and b!1435876 c!133217) b!1435878))

(assert (= (and b!1435876 (not c!133217)) b!1435883))

(assert (= (and d!154621 c!133218) b!1435875))

(assert (= (and d!154621 (not c!133218)) b!1435880))

(assert (= (and b!1435880 res!968461) b!1435881))

(assert (= (and b!1435881 (not res!968462)) b!1435879))

(assert (= (and b!1435879 (not res!968460)) b!1435877))

(declare-fun m!1325623 () Bool)

(assert (=> b!1435879 m!1325623))

(assert (=> d!154621 m!1325455))

(declare-fun m!1325625 () Bool)

(assert (=> d!154621 m!1325625))

(assert (=> d!154621 m!1325449))

(assert (=> b!1435877 m!1325623))

(assert (=> b!1435881 m!1325623))

(assert (=> b!1435883 m!1325455))

(declare-fun m!1325627 () Bool)

(assert (=> b!1435883 m!1325627))

(assert (=> b!1435883 m!1325627))

(declare-fun m!1325629 () Bool)

(assert (=> b!1435883 m!1325629))

(assert (=> b!1435705 d!154621))

(declare-fun d!154623 () Bool)

(declare-fun lt!632008 () (_ BitVec 32))

(declare-fun lt!632007 () (_ BitVec 32))

(assert (=> d!154623 (= lt!632008 (bvmul (bvxor lt!632007 (bvlshr lt!632007 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154623 (= lt!632007 ((_ extract 31 0) (bvand (bvxor lt!631922 (bvlshr lt!631922 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154623 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968463 (let ((h!34988 ((_ extract 31 0) (bvand (bvxor lt!631922 (bvlshr lt!631922 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129543 (bvmul (bvxor h!34988 (bvlshr h!34988 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129543 (bvlshr x!129543 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968463 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968463 #b00000000000000000000000000000000))))))

(assert (=> d!154623 (= (toIndex!0 lt!631922 mask!2608) (bvand (bvxor lt!632008 (bvlshr lt!632008 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1435705 d!154623))

(declare-fun d!154631 () Bool)

(assert (=> d!154631 (= (validKeyInArray!0 (select (arr!47152 a!2831) i!982)) (and (not (= (select (arr!47152 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47152 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435706 d!154631))

(declare-fun b!1435884 () Bool)

(declare-fun e!810507 () Bool)

(declare-fun lt!632010 () SeekEntryResult!11333)

(assert (=> b!1435884 (= e!810507 (bvsge (x!129537 lt!632010) #b01111111111111111111111111111110))))

(declare-fun b!1435885 () Bool)

(declare-fun e!810504 () SeekEntryResult!11333)

(declare-fun e!810506 () SeekEntryResult!11333)

(assert (=> b!1435885 (= e!810504 e!810506)))

(declare-fun lt!632009 () (_ BitVec 64))

(declare-fun c!133220 () Bool)

(assert (=> b!1435885 (= c!133220 (or (= lt!632009 (select (arr!47152 a!2831) j!81)) (= (bvadd lt!632009 lt!632009) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435886 () Bool)

(assert (=> b!1435886 (and (bvsge (index!47726 lt!632010) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632010) (size!47703 a!2831)))))

(declare-fun e!810505 () Bool)

(assert (=> b!1435886 (= e!810505 (= (select (arr!47152 a!2831) (index!47726 lt!632010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435887 () Bool)

(assert (=> b!1435887 (= e!810506 (Intermediate!11333 false index!585 x!605))))

(declare-fun b!1435888 () Bool)

(assert (=> b!1435888 (and (bvsge (index!47726 lt!632010) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632010) (size!47703 a!2831)))))

(declare-fun res!968464 () Bool)

(assert (=> b!1435888 (= res!968464 (= (select (arr!47152 a!2831) (index!47726 lt!632010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435888 (=> res!968464 e!810505)))

(declare-fun b!1435889 () Bool)

(declare-fun e!810503 () Bool)

(assert (=> b!1435889 (= e!810507 e!810503)))

(declare-fun res!968465 () Bool)

(assert (=> b!1435889 (= res!968465 (and ((_ is Intermediate!11333) lt!632010) (not (undefined!12145 lt!632010)) (bvslt (x!129537 lt!632010) #b01111111111111111111111111111110) (bvsge (x!129537 lt!632010) #b00000000000000000000000000000000) (bvsge (x!129537 lt!632010) x!605)))))

(assert (=> b!1435889 (=> (not res!968465) (not e!810503))))

(declare-fun b!1435890 () Bool)

(assert (=> b!1435890 (and (bvsge (index!47726 lt!632010) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632010) (size!47703 a!2831)))))

(declare-fun res!968466 () Bool)

(assert (=> b!1435890 (= res!968466 (= (select (arr!47152 a!2831) (index!47726 lt!632010)) (select (arr!47152 a!2831) j!81)))))

(assert (=> b!1435890 (=> res!968466 e!810505)))

(assert (=> b!1435890 (= e!810503 e!810505)))

(declare-fun d!154633 () Bool)

(assert (=> d!154633 e!810507))

(declare-fun c!133221 () Bool)

(assert (=> d!154633 (= c!133221 (and ((_ is Intermediate!11333) lt!632010) (undefined!12145 lt!632010)))))

(assert (=> d!154633 (= lt!632010 e!810504)))

(declare-fun c!133219 () Bool)

(assert (=> d!154633 (= c!133219 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154633 (= lt!632009 (select (arr!47152 a!2831) index!585))))

(assert (=> d!154633 (validMask!0 mask!2608)))

(assert (=> d!154633 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47152 a!2831) j!81) a!2831 mask!2608) lt!632010)))

(declare-fun b!1435891 () Bool)

(assert (=> b!1435891 (= e!810504 (Intermediate!11333 true index!585 x!605))))

(declare-fun b!1435892 () Bool)

(assert (=> b!1435892 (= e!810506 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47152 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154633 c!133219) b!1435891))

(assert (= (and d!154633 (not c!133219)) b!1435885))

(assert (= (and b!1435885 c!133220) b!1435887))

(assert (= (and b!1435885 (not c!133220)) b!1435892))

(assert (= (and d!154633 c!133221) b!1435884))

(assert (= (and d!154633 (not c!133221)) b!1435889))

(assert (= (and b!1435889 res!968465) b!1435890))

(assert (= (and b!1435890 (not res!968466)) b!1435888))

(assert (= (and b!1435888 (not res!968464)) b!1435886))

(declare-fun m!1325633 () Bool)

(assert (=> b!1435888 m!1325633))

(assert (=> d!154633 m!1325469))

(assert (=> d!154633 m!1325449))

(assert (=> b!1435886 m!1325633))

(assert (=> b!1435890 m!1325633))

(declare-fun m!1325635 () Bool)

(assert (=> b!1435892 m!1325635))

(assert (=> b!1435892 m!1325635))

(assert (=> b!1435892 m!1325431))

(declare-fun m!1325637 () Bool)

(assert (=> b!1435892 m!1325637))

(assert (=> b!1435696 d!154633))

(declare-fun b!1435893 () Bool)

(declare-fun e!810512 () Bool)

(declare-fun lt!632012 () SeekEntryResult!11333)

(assert (=> b!1435893 (= e!810512 (bvsge (x!129537 lt!632012) #b01111111111111111111111111111110))))

(declare-fun b!1435894 () Bool)

(declare-fun e!810509 () SeekEntryResult!11333)

(declare-fun e!810511 () SeekEntryResult!11333)

(assert (=> b!1435894 (= e!810509 e!810511)))

(declare-fun c!133223 () Bool)

(declare-fun lt!632011 () (_ BitVec 64))

(assert (=> b!1435894 (= c!133223 (or (= lt!632011 lt!631922) (= (bvadd lt!632011 lt!632011) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435895 () Bool)

(assert (=> b!1435895 (and (bvsge (index!47726 lt!632012) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632012) (size!47703 lt!631919)))))

(declare-fun e!810510 () Bool)

(assert (=> b!1435895 (= e!810510 (= (select (arr!47152 lt!631919) (index!47726 lt!632012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435896 () Bool)

(assert (=> b!1435896 (= e!810511 (Intermediate!11333 false index!585 x!605))))

(declare-fun b!1435897 () Bool)

(assert (=> b!1435897 (and (bvsge (index!47726 lt!632012) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632012) (size!47703 lt!631919)))))

(declare-fun res!968467 () Bool)

(assert (=> b!1435897 (= res!968467 (= (select (arr!47152 lt!631919) (index!47726 lt!632012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435897 (=> res!968467 e!810510)))

(declare-fun b!1435898 () Bool)

(declare-fun e!810508 () Bool)

(assert (=> b!1435898 (= e!810512 e!810508)))

(declare-fun res!968468 () Bool)

(assert (=> b!1435898 (= res!968468 (and ((_ is Intermediate!11333) lt!632012) (not (undefined!12145 lt!632012)) (bvslt (x!129537 lt!632012) #b01111111111111111111111111111110) (bvsge (x!129537 lt!632012) #b00000000000000000000000000000000) (bvsge (x!129537 lt!632012) x!605)))))

(assert (=> b!1435898 (=> (not res!968468) (not e!810508))))

(declare-fun b!1435899 () Bool)

(assert (=> b!1435899 (and (bvsge (index!47726 lt!632012) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632012) (size!47703 lt!631919)))))

(declare-fun res!968469 () Bool)

(assert (=> b!1435899 (= res!968469 (= (select (arr!47152 lt!631919) (index!47726 lt!632012)) lt!631922))))

(assert (=> b!1435899 (=> res!968469 e!810510)))

(assert (=> b!1435899 (= e!810508 e!810510)))

(declare-fun d!154635 () Bool)

(assert (=> d!154635 e!810512))

(declare-fun c!133224 () Bool)

(assert (=> d!154635 (= c!133224 (and ((_ is Intermediate!11333) lt!632012) (undefined!12145 lt!632012)))))

(assert (=> d!154635 (= lt!632012 e!810509)))

(declare-fun c!133222 () Bool)

(assert (=> d!154635 (= c!133222 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154635 (= lt!632011 (select (arr!47152 lt!631919) index!585))))

(assert (=> d!154635 (validMask!0 mask!2608)))

(assert (=> d!154635 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631922 lt!631919 mask!2608) lt!632012)))

(declare-fun b!1435900 () Bool)

(assert (=> b!1435900 (= e!810509 (Intermediate!11333 true index!585 x!605))))

(declare-fun b!1435901 () Bool)

(assert (=> b!1435901 (= e!810511 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!631922 lt!631919 mask!2608))))

(assert (= (and d!154635 c!133222) b!1435900))

(assert (= (and d!154635 (not c!133222)) b!1435894))

(assert (= (and b!1435894 c!133223) b!1435896))

(assert (= (and b!1435894 (not c!133223)) b!1435901))

(assert (= (and d!154635 c!133224) b!1435893))

(assert (= (and d!154635 (not c!133224)) b!1435898))

(assert (= (and b!1435898 res!968468) b!1435899))

(assert (= (and b!1435899 (not res!968469)) b!1435897))

(assert (= (and b!1435897 (not res!968467)) b!1435895))

(declare-fun m!1325639 () Bool)

(assert (=> b!1435897 m!1325639))

(declare-fun m!1325641 () Bool)

(assert (=> d!154635 m!1325641))

(assert (=> d!154635 m!1325449))

(assert (=> b!1435895 m!1325639))

(assert (=> b!1435899 m!1325639))

(assert (=> b!1435901 m!1325635))

(assert (=> b!1435901 m!1325635))

(declare-fun m!1325643 () Bool)

(assert (=> b!1435901 m!1325643))

(assert (=> b!1435702 d!154635))

(declare-fun b!1435912 () Bool)

(declare-fun e!810525 () Bool)

(declare-fun lt!632014 () SeekEntryResult!11333)

(assert (=> b!1435912 (= e!810525 (bvsge (x!129537 lt!632014) #b01111111111111111111111111111110))))

(declare-fun b!1435913 () Bool)

(declare-fun e!810522 () SeekEntryResult!11333)

(declare-fun e!810524 () SeekEntryResult!11333)

(assert (=> b!1435913 (= e!810522 e!810524)))

(declare-fun c!133228 () Bool)

(declare-fun lt!632013 () (_ BitVec 64))

(assert (=> b!1435913 (= c!133228 (or (= lt!632013 (select (arr!47152 a!2831) j!81)) (= (bvadd lt!632013 lt!632013) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435914 () Bool)

(assert (=> b!1435914 (and (bvsge (index!47726 lt!632014) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632014) (size!47703 a!2831)))))

(declare-fun e!810523 () Bool)

(assert (=> b!1435914 (= e!810523 (= (select (arr!47152 a!2831) (index!47726 lt!632014)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435915 () Bool)

(assert (=> b!1435915 (= e!810524 (Intermediate!11333 false (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435916 () Bool)

(assert (=> b!1435916 (and (bvsge (index!47726 lt!632014) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632014) (size!47703 a!2831)))))

(declare-fun res!968476 () Bool)

(assert (=> b!1435916 (= res!968476 (= (select (arr!47152 a!2831) (index!47726 lt!632014)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435916 (=> res!968476 e!810523)))

(declare-fun b!1435917 () Bool)

(declare-fun e!810521 () Bool)

(assert (=> b!1435917 (= e!810525 e!810521)))

(declare-fun res!968477 () Bool)

(assert (=> b!1435917 (= res!968477 (and ((_ is Intermediate!11333) lt!632014) (not (undefined!12145 lt!632014)) (bvslt (x!129537 lt!632014) #b01111111111111111111111111111110) (bvsge (x!129537 lt!632014) #b00000000000000000000000000000000) (bvsge (x!129537 lt!632014) #b00000000000000000000000000000000)))))

(assert (=> b!1435917 (=> (not res!968477) (not e!810521))))

(declare-fun b!1435918 () Bool)

(assert (=> b!1435918 (and (bvsge (index!47726 lt!632014) #b00000000000000000000000000000000) (bvslt (index!47726 lt!632014) (size!47703 a!2831)))))

(declare-fun res!968478 () Bool)

(assert (=> b!1435918 (= res!968478 (= (select (arr!47152 a!2831) (index!47726 lt!632014)) (select (arr!47152 a!2831) j!81)))))

(assert (=> b!1435918 (=> res!968478 e!810523)))

(assert (=> b!1435918 (= e!810521 e!810523)))

(declare-fun d!154637 () Bool)

(assert (=> d!154637 e!810525))

(declare-fun c!133229 () Bool)

(assert (=> d!154637 (= c!133229 (and ((_ is Intermediate!11333) lt!632014) (undefined!12145 lt!632014)))))

(assert (=> d!154637 (= lt!632014 e!810522)))

(declare-fun c!133227 () Bool)

(assert (=> d!154637 (= c!133227 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154637 (= lt!632013 (select (arr!47152 a!2831) (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608)))))

(assert (=> d!154637 (validMask!0 mask!2608)))

(assert (=> d!154637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608) (select (arr!47152 a!2831) j!81) a!2831 mask!2608) lt!632014)))

(declare-fun b!1435919 () Bool)

(assert (=> b!1435919 (= e!810522 (Intermediate!11333 true (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435920 () Bool)

(assert (=> b!1435920 (= e!810524 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47152 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154637 c!133227) b!1435919))

(assert (= (and d!154637 (not c!133227)) b!1435913))

(assert (= (and b!1435913 c!133228) b!1435915))

(assert (= (and b!1435913 (not c!133228)) b!1435920))

(assert (= (and d!154637 c!133229) b!1435912))

(assert (= (and d!154637 (not c!133229)) b!1435917))

(assert (= (and b!1435917 res!968477) b!1435918))

(assert (= (and b!1435918 (not res!968478)) b!1435916))

(assert (= (and b!1435916 (not res!968476)) b!1435914))

(declare-fun m!1325645 () Bool)

(assert (=> b!1435916 m!1325645))

(assert (=> d!154637 m!1325433))

(declare-fun m!1325647 () Bool)

(assert (=> d!154637 m!1325647))

(assert (=> d!154637 m!1325449))

(assert (=> b!1435914 m!1325645))

(assert (=> b!1435918 m!1325645))

(assert (=> b!1435920 m!1325433))

(declare-fun m!1325649 () Bool)

(assert (=> b!1435920 m!1325649))

(assert (=> b!1435920 m!1325649))

(assert (=> b!1435920 m!1325431))

(declare-fun m!1325651 () Bool)

(assert (=> b!1435920 m!1325651))

(assert (=> b!1435703 d!154637))

(declare-fun d!154639 () Bool)

(declare-fun lt!632016 () (_ BitVec 32))

(declare-fun lt!632015 () (_ BitVec 32))

(assert (=> d!154639 (= lt!632016 (bvmul (bvxor lt!632015 (bvlshr lt!632015 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154639 (= lt!632015 ((_ extract 31 0) (bvand (bvxor (select (arr!47152 a!2831) j!81) (bvlshr (select (arr!47152 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154639 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968463 (let ((h!34988 ((_ extract 31 0) (bvand (bvxor (select (arr!47152 a!2831) j!81) (bvlshr (select (arr!47152 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129543 (bvmul (bvxor h!34988 (bvlshr h!34988 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129543 (bvlshr x!129543 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968463 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968463 #b00000000000000000000000000000000))))))

(assert (=> d!154639 (= (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608) (bvand (bvxor lt!632016 (bvlshr lt!632016 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1435703 d!154639))

(declare-fun b!1435983 () Bool)

(declare-fun e!810563 () SeekEntryResult!11333)

(assert (=> b!1435983 (= e!810563 Undefined!11333)))

(declare-fun b!1435984 () Bool)

(declare-fun c!133253 () Bool)

(declare-fun lt!632038 () (_ BitVec 64))

(assert (=> b!1435984 (= c!133253 (= lt!632038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810562 () SeekEntryResult!11333)

(declare-fun e!810561 () SeekEntryResult!11333)

(assert (=> b!1435984 (= e!810562 e!810561)))

(declare-fun b!1435985 () Bool)

(declare-fun lt!632037 () SeekEntryResult!11333)

(assert (=> b!1435985 (= e!810562 (Found!11333 (index!47726 lt!632037)))))

(declare-fun b!1435986 () Bool)

(assert (=> b!1435986 (= e!810563 e!810562)))

(assert (=> b!1435986 (= lt!632038 (select (arr!47152 a!2831) (index!47726 lt!632037)))))

(declare-fun c!133252 () Bool)

(assert (=> b!1435986 (= c!133252 (= lt!632038 (select (arr!47152 a!2831) j!81)))))

(declare-fun b!1435987 () Bool)

(assert (=> b!1435987 (= e!810561 (MissingZero!11333 (index!47726 lt!632037)))))

(declare-fun d!154641 () Bool)

(declare-fun lt!632036 () SeekEntryResult!11333)

(assert (=> d!154641 (and (or ((_ is Undefined!11333) lt!632036) (not ((_ is Found!11333) lt!632036)) (and (bvsge (index!47725 lt!632036) #b00000000000000000000000000000000) (bvslt (index!47725 lt!632036) (size!47703 a!2831)))) (or ((_ is Undefined!11333) lt!632036) ((_ is Found!11333) lt!632036) (not ((_ is MissingZero!11333) lt!632036)) (and (bvsge (index!47724 lt!632036) #b00000000000000000000000000000000) (bvslt (index!47724 lt!632036) (size!47703 a!2831)))) (or ((_ is Undefined!11333) lt!632036) ((_ is Found!11333) lt!632036) ((_ is MissingZero!11333) lt!632036) (not ((_ is MissingVacant!11333) lt!632036)) (and (bvsge (index!47727 lt!632036) #b00000000000000000000000000000000) (bvslt (index!47727 lt!632036) (size!47703 a!2831)))) (or ((_ is Undefined!11333) lt!632036) (ite ((_ is Found!11333) lt!632036) (= (select (arr!47152 a!2831) (index!47725 lt!632036)) (select (arr!47152 a!2831) j!81)) (ite ((_ is MissingZero!11333) lt!632036) (= (select (arr!47152 a!2831) (index!47724 lt!632036)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11333) lt!632036) (= (select (arr!47152 a!2831) (index!47727 lt!632036)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154641 (= lt!632036 e!810563)))

(declare-fun c!133254 () Bool)

(assert (=> d!154641 (= c!133254 (and ((_ is Intermediate!11333) lt!632037) (undefined!12145 lt!632037)))))

(assert (=> d!154641 (= lt!632037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47152 a!2831) j!81) mask!2608) (select (arr!47152 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154641 (validMask!0 mask!2608)))

(assert (=> d!154641 (= (seekEntryOrOpen!0 (select (arr!47152 a!2831) j!81) a!2831 mask!2608) lt!632036)))

(declare-fun b!1435988 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97703 (_ BitVec 32)) SeekEntryResult!11333)

(assert (=> b!1435988 (= e!810561 (seekKeyOrZeroReturnVacant!0 (x!129537 lt!632037) (index!47726 lt!632037) (index!47726 lt!632037) (select (arr!47152 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154641 c!133254) b!1435983))

(assert (= (and d!154641 (not c!133254)) b!1435986))

(assert (= (and b!1435986 c!133252) b!1435985))

(assert (= (and b!1435986 (not c!133252)) b!1435984))

(assert (= (and b!1435984 c!133253) b!1435987))

(assert (= (and b!1435984 (not c!133253)) b!1435988))

(declare-fun m!1325667 () Bool)

(assert (=> b!1435986 m!1325667))

(assert (=> d!154641 m!1325433))

(assert (=> d!154641 m!1325431))

(assert (=> d!154641 m!1325435))

(declare-fun m!1325669 () Bool)

(assert (=> d!154641 m!1325669))

(declare-fun m!1325671 () Bool)

(assert (=> d!154641 m!1325671))

(assert (=> d!154641 m!1325431))

(assert (=> d!154641 m!1325433))

(assert (=> d!154641 m!1325449))

(declare-fun m!1325673 () Bool)

(assert (=> d!154641 m!1325673))

(assert (=> b!1435988 m!1325431))

(declare-fun m!1325675 () Bool)

(assert (=> b!1435988 m!1325675))

(assert (=> b!1435704 d!154641))

(check-sat (not bm!67604) (not b!1435901) (not b!1435988) (not b!1435815) (not d!154593) (not d!154637) (not b!1435813) (not b!1435812) (not bm!67596) (not b!1435873) (not bm!67599) (not d!154635) (not b!1435852) (not b!1435853) (not b!1435872) (not d!154621) (not b!1435842) (not d!154633) (not b!1435892) (not d!154617) (not d!154595) (not b!1435920) (not b!1435883) (not d!154641))
(check-sat)
