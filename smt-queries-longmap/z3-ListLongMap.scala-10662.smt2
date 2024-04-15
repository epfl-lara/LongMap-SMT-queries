; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125080 () Bool)

(assert start!125080)

(declare-fun b!1457079 () Bool)

(declare-fun e!819702 () Bool)

(declare-fun e!819697 () Bool)

(assert (=> b!1457079 (= e!819702 (not e!819697))))

(declare-fun res!987542 () Bool)

(assert (=> b!1457079 (=> res!987542 e!819697)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98506 0))(
  ( (array!98507 (arr!47542 (Array (_ BitVec 32) (_ BitVec 64))) (size!48094 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98506)

(assert (=> b!1457079 (= res!987542 (or (and (= (select (arr!47542 a!2862) index!646) (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47542 a!2862) index!646) (select (arr!47542 a!2862) j!93))) (= (select (arr!47542 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819704 () Bool)

(assert (=> b!1457079 e!819704))

(declare-fun res!987533 () Bool)

(assert (=> b!1457079 (=> (not res!987533) (not e!819704))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98506 (_ BitVec 32)) Bool)

(assert (=> b!1457079 (= res!987533 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48975 0))(
  ( (Unit!48976) )
))
(declare-fun lt!638388 () Unit!48975)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48975)

(assert (=> b!1457079 (= lt!638388 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457080 () Bool)

(declare-fun res!987539 () Bool)

(declare-fun e!819696 () Bool)

(assert (=> b!1457080 (=> (not res!987539) (not e!819696))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457080 (= res!987539 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48094 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48094 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48094 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457081 () Bool)

(declare-fun e!819698 () Bool)

(declare-fun e!819699 () Bool)

(assert (=> b!1457081 (= e!819698 e!819699)))

(declare-fun res!987543 () Bool)

(assert (=> b!1457081 (=> (not res!987543) (not e!819699))))

(declare-datatypes ((SeekEntryResult!11819 0))(
  ( (MissingZero!11819 (index!49668 (_ BitVec 32))) (Found!11819 (index!49669 (_ BitVec 32))) (Intermediate!11819 (undefined!12631 Bool) (index!49670 (_ BitVec 32)) (x!131287 (_ BitVec 32))) (Undefined!11819) (MissingVacant!11819 (index!49671 (_ BitVec 32))) )
))
(declare-fun lt!638391 () SeekEntryResult!11819)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98506 (_ BitVec 32)) SeekEntryResult!11819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457081 (= res!987543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47542 a!2862) j!93) mask!2687) (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!638391))))

(assert (=> b!1457081 (= lt!638391 (Intermediate!11819 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!819703 () Bool)

(declare-fun lt!638386 () array!98506)

(declare-fun lt!638384 () (_ BitVec 64))

(declare-fun b!1457082 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98506 (_ BitVec 32)) SeekEntryResult!11819)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98506 (_ BitVec 32)) SeekEntryResult!11819)

(assert (=> b!1457082 (= e!819703 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638384 lt!638386 mask!2687) (seekEntryOrOpen!0 lt!638384 lt!638386 mask!2687)))))

(declare-fun b!1457084 () Bool)

(declare-fun res!987530 () Bool)

(assert (=> b!1457084 (=> (not res!987530) (not e!819704))))

(assert (=> b!1457084 (= res!987530 (= (seekEntryOrOpen!0 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) (Found!11819 j!93)))))

(declare-fun b!1457085 () Bool)

(declare-fun res!987534 () Bool)

(assert (=> b!1457085 (=> (not res!987534) (not e!819696))))

(declare-datatypes ((List!34121 0))(
  ( (Nil!34118) (Cons!34117 (h!35467 (_ BitVec 64)) (t!48807 List!34121)) )
))
(declare-fun arrayNoDuplicates!0 (array!98506 (_ BitVec 32) List!34121) Bool)

(assert (=> b!1457085 (= res!987534 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34118))))

(declare-fun b!1457086 () Bool)

(declare-fun lt!638390 () SeekEntryResult!11819)

(declare-fun e!819701 () Bool)

(declare-fun lt!638389 () (_ BitVec 32))

(assert (=> b!1457086 (= e!819701 (not (= lt!638390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638389 lt!638384 lt!638386 mask!2687))))))

(declare-fun b!1457087 () Bool)

(assert (=> b!1457087 (= e!819699 e!819702)))

(declare-fun res!987532 () Bool)

(assert (=> b!1457087 (=> (not res!987532) (not e!819702))))

(assert (=> b!1457087 (= res!987532 (= lt!638390 (Intermediate!11819 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457087 (= lt!638390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638384 mask!2687) lt!638384 lt!638386 mask!2687))))

(assert (=> b!1457087 (= lt!638384 (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457088 () Bool)

(assert (=> b!1457088 (= e!819703 (= lt!638390 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638384 lt!638386 mask!2687)))))

(declare-fun b!1457089 () Bool)

(declare-fun res!987544 () Bool)

(assert (=> b!1457089 (=> (not res!987544) (not e!819696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457089 (= res!987544 (validKeyInArray!0 (select (arr!47542 a!2862) i!1006)))))

(declare-fun b!1457090 () Bool)

(declare-fun e!819705 () Bool)

(assert (=> b!1457090 (= e!819705 true)))

(declare-fun lt!638387 () Bool)

(assert (=> b!1457090 (= lt!638387 e!819701)))

(declare-fun c!134290 () Bool)

(assert (=> b!1457090 (= c!134290 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457091 () Bool)

(declare-fun res!987528 () Bool)

(assert (=> b!1457091 (=> (not res!987528) (not e!819702))))

(assert (=> b!1457091 (= res!987528 e!819703)))

(declare-fun c!134289 () Bool)

(assert (=> b!1457091 (= c!134289 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457092 () Bool)

(declare-fun res!987537 () Bool)

(assert (=> b!1457092 (=> (not res!987537) (not e!819699))))

(assert (=> b!1457092 (= res!987537 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!638391))))

(declare-fun b!1457093 () Bool)

(declare-fun res!987538 () Bool)

(assert (=> b!1457093 (=> (not res!987538) (not e!819702))))

(assert (=> b!1457093 (= res!987538 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457094 () Bool)

(declare-fun res!987541 () Bool)

(assert (=> b!1457094 (=> res!987541 e!819705)))

(assert (=> b!1457094 (= res!987541 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638389 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!638391)))))

(declare-fun b!1457095 () Bool)

(declare-fun res!987529 () Bool)

(assert (=> b!1457095 (=> (not res!987529) (not e!819696))))

(assert (=> b!1457095 (= res!987529 (validKeyInArray!0 (select (arr!47542 a!2862) j!93)))))

(declare-fun b!1457096 () Bool)

(declare-fun res!987536 () Bool)

(assert (=> b!1457096 (=> (not res!987536) (not e!819696))))

(assert (=> b!1457096 (= res!987536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457097 () Bool)

(assert (=> b!1457097 (= e!819697 e!819705)))

(declare-fun res!987527 () Bool)

(assert (=> b!1457097 (=> res!987527 e!819705)))

(assert (=> b!1457097 (= res!987527 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638389 #b00000000000000000000000000000000) (bvsge lt!638389 (size!48094 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457097 (= lt!638389 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638385 () SeekEntryResult!11819)

(assert (=> b!1457097 (= lt!638385 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638384 lt!638386 mask!2687))))

(assert (=> b!1457097 (= lt!638385 (seekEntryOrOpen!0 lt!638384 lt!638386 mask!2687))))

(declare-fun b!1457098 () Bool)

(declare-fun res!987535 () Bool)

(assert (=> b!1457098 (=> (not res!987535) (not e!819696))))

(assert (=> b!1457098 (= res!987535 (and (= (size!48094 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48094 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48094 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!987531 () Bool)

(assert (=> start!125080 (=> (not res!987531) (not e!819696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125080 (= res!987531 (validMask!0 mask!2687))))

(assert (=> start!125080 e!819696))

(assert (=> start!125080 true))

(declare-fun array_inv!36775 (array!98506) Bool)

(assert (=> start!125080 (array_inv!36775 a!2862)))

(declare-fun b!1457083 () Bool)

(assert (=> b!1457083 (= e!819701 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638389 intermediateAfterIndex!19 lt!638384 lt!638386 mask!2687) lt!638385)))))

(declare-fun b!1457099 () Bool)

(assert (=> b!1457099 (= e!819704 (and (or (= (select (arr!47542 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47542 a!2862) intermediateBeforeIndex!19) (select (arr!47542 a!2862) j!93))) (let ((bdg!53323 (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47542 a!2862) index!646) bdg!53323) (= (select (arr!47542 a!2862) index!646) (select (arr!47542 a!2862) j!93))) (= (select (arr!47542 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53323 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457100 () Bool)

(assert (=> b!1457100 (= e!819696 e!819698)))

(declare-fun res!987540 () Bool)

(assert (=> b!1457100 (=> (not res!987540) (not e!819698))))

(assert (=> b!1457100 (= res!987540 (= (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457100 (= lt!638386 (array!98507 (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48094 a!2862)))))

(assert (= (and start!125080 res!987531) b!1457098))

(assert (= (and b!1457098 res!987535) b!1457089))

(assert (= (and b!1457089 res!987544) b!1457095))

(assert (= (and b!1457095 res!987529) b!1457096))

(assert (= (and b!1457096 res!987536) b!1457085))

(assert (= (and b!1457085 res!987534) b!1457080))

(assert (= (and b!1457080 res!987539) b!1457100))

(assert (= (and b!1457100 res!987540) b!1457081))

(assert (= (and b!1457081 res!987543) b!1457092))

(assert (= (and b!1457092 res!987537) b!1457087))

(assert (= (and b!1457087 res!987532) b!1457091))

(assert (= (and b!1457091 c!134289) b!1457088))

(assert (= (and b!1457091 (not c!134289)) b!1457082))

(assert (= (and b!1457091 res!987528) b!1457093))

(assert (= (and b!1457093 res!987538) b!1457079))

(assert (= (and b!1457079 res!987533) b!1457084))

(assert (= (and b!1457084 res!987530) b!1457099))

(assert (= (and b!1457079 (not res!987542)) b!1457097))

(assert (= (and b!1457097 (not res!987527)) b!1457094))

(assert (= (and b!1457094 (not res!987541)) b!1457090))

(assert (= (and b!1457090 c!134290) b!1457086))

(assert (= (and b!1457090 (not c!134290)) b!1457083))

(declare-fun m!1344597 () Bool)

(assert (=> b!1457085 m!1344597))

(declare-fun m!1344599 () Bool)

(assert (=> b!1457096 m!1344599))

(declare-fun m!1344601 () Bool)

(assert (=> b!1457084 m!1344601))

(assert (=> b!1457084 m!1344601))

(declare-fun m!1344603 () Bool)

(assert (=> b!1457084 m!1344603))

(assert (=> b!1457092 m!1344601))

(assert (=> b!1457092 m!1344601))

(declare-fun m!1344605 () Bool)

(assert (=> b!1457092 m!1344605))

(declare-fun m!1344607 () Bool)

(assert (=> b!1457088 m!1344607))

(declare-fun m!1344609 () Bool)

(assert (=> b!1457079 m!1344609))

(declare-fun m!1344611 () Bool)

(assert (=> b!1457079 m!1344611))

(declare-fun m!1344613 () Bool)

(assert (=> b!1457079 m!1344613))

(declare-fun m!1344615 () Bool)

(assert (=> b!1457079 m!1344615))

(declare-fun m!1344617 () Bool)

(assert (=> b!1457079 m!1344617))

(assert (=> b!1457079 m!1344601))

(declare-fun m!1344619 () Bool)

(assert (=> b!1457087 m!1344619))

(assert (=> b!1457087 m!1344619))

(declare-fun m!1344621 () Bool)

(assert (=> b!1457087 m!1344621))

(assert (=> b!1457087 m!1344611))

(declare-fun m!1344623 () Bool)

(assert (=> b!1457087 m!1344623))

(assert (=> b!1457094 m!1344601))

(assert (=> b!1457094 m!1344601))

(declare-fun m!1344625 () Bool)

(assert (=> b!1457094 m!1344625))

(assert (=> b!1457081 m!1344601))

(assert (=> b!1457081 m!1344601))

(declare-fun m!1344627 () Bool)

(assert (=> b!1457081 m!1344627))

(assert (=> b!1457081 m!1344627))

(assert (=> b!1457081 m!1344601))

(declare-fun m!1344629 () Bool)

(assert (=> b!1457081 m!1344629))

(declare-fun m!1344631 () Bool)

(assert (=> b!1457089 m!1344631))

(assert (=> b!1457089 m!1344631))

(declare-fun m!1344633 () Bool)

(assert (=> b!1457089 m!1344633))

(declare-fun m!1344635 () Bool)

(assert (=> b!1457086 m!1344635))

(declare-fun m!1344637 () Bool)

(assert (=> start!125080 m!1344637))

(declare-fun m!1344639 () Bool)

(assert (=> start!125080 m!1344639))

(assert (=> b!1457100 m!1344611))

(declare-fun m!1344641 () Bool)

(assert (=> b!1457100 m!1344641))

(declare-fun m!1344643 () Bool)

(assert (=> b!1457083 m!1344643))

(declare-fun m!1344645 () Bool)

(assert (=> b!1457097 m!1344645))

(declare-fun m!1344647 () Bool)

(assert (=> b!1457097 m!1344647))

(declare-fun m!1344649 () Bool)

(assert (=> b!1457097 m!1344649))

(assert (=> b!1457095 m!1344601))

(assert (=> b!1457095 m!1344601))

(declare-fun m!1344651 () Bool)

(assert (=> b!1457095 m!1344651))

(assert (=> b!1457082 m!1344647))

(assert (=> b!1457082 m!1344649))

(assert (=> b!1457099 m!1344611))

(declare-fun m!1344653 () Bool)

(assert (=> b!1457099 m!1344653))

(assert (=> b!1457099 m!1344613))

(assert (=> b!1457099 m!1344615))

(assert (=> b!1457099 m!1344601))

(check-sat (not b!1457084) (not b!1457086) (not b!1457094) (not b!1457079) (not b!1457081) (not b!1457092) (not b!1457087) (not b!1457088) (not b!1457082) (not start!125080) (not b!1457096) (not b!1457083) (not b!1457095) (not b!1457085) (not b!1457097) (not b!1457089))
(check-sat)
