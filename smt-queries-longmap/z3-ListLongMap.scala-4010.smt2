; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54534 () Bool)

(assert start!54534)

(declare-fun b!595792 () Bool)

(declare-fun res!381636 () Bool)

(declare-fun e!340413 () Bool)

(assert (=> b!595792 (=> (not res!381636) (not e!340413))))

(declare-datatypes ((array!36994 0))(
  ( (array!36995 (arr!17761 (Array (_ BitVec 32) (_ BitVec 64))) (size!18125 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36994)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36994 (_ BitVec 32)) Bool)

(assert (=> b!595792 (= res!381636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595793 () Bool)

(declare-fun e!340408 () Bool)

(declare-fun e!340411 () Bool)

(assert (=> b!595793 (= e!340408 e!340411)))

(declare-fun res!381638 () Bool)

(assert (=> b!595793 (=> res!381638 e!340411)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270563 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!270559 () (_ BitVec 64))

(assert (=> b!595793 (= res!381638 (or (not (= (select (arr!17761 a!2986) j!136) lt!270559)) (not (= (select (arr!17761 a!2986) j!136) lt!270563)) (bvsge j!136 index!984)))))

(declare-fun b!595794 () Bool)

(declare-fun res!381652 () Bool)

(declare-fun e!340401 () Bool)

(assert (=> b!595794 (=> res!381652 e!340401)))

(declare-datatypes ((List!11802 0))(
  ( (Nil!11799) (Cons!11798 (h!12843 (_ BitVec 64)) (t!18030 List!11802)) )
))
(declare-fun noDuplicate!256 (List!11802) Bool)

(assert (=> b!595794 (= res!381652 (not (noDuplicate!256 Nil!11799)))))

(declare-fun b!595795 () Bool)

(declare-fun res!381639 () Bool)

(declare-fun e!340403 () Bool)

(assert (=> b!595795 (=> (not res!381639) (not e!340403))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595795 (= res!381639 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595796 () Bool)

(declare-fun res!381637 () Bool)

(assert (=> b!595796 (=> (not res!381637) (not e!340413))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!595796 (= res!381637 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17761 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595797 () Bool)

(declare-fun e!340402 () Bool)

(assert (=> b!595797 (= e!340411 e!340402)))

(declare-fun res!381647 () Bool)

(assert (=> b!595797 (=> (not res!381647) (not e!340402))))

(declare-fun lt!270554 () array!36994)

(assert (=> b!595797 (= res!381647 (arrayContainsKey!0 lt!270554 (select (arr!17761 a!2986) j!136) j!136))))

(declare-fun b!595798 () Bool)

(declare-fun res!381650 () Bool)

(assert (=> b!595798 (=> res!381650 e!340401)))

(declare-fun contains!2937 (List!11802 (_ BitVec 64)) Bool)

(assert (=> b!595798 (= res!381650 (contains!2937 Nil!11799 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595799 () Bool)

(declare-datatypes ((Unit!18722 0))(
  ( (Unit!18723) )
))
(declare-fun e!340404 () Unit!18722)

(declare-fun Unit!18724 () Unit!18722)

(assert (=> b!595799 (= e!340404 Unit!18724)))

(assert (=> b!595799 false))

(declare-fun b!595800 () Bool)

(declare-fun e!340410 () Bool)

(assert (=> b!595800 (= e!340410 e!340401)))

(declare-fun res!381646 () Bool)

(assert (=> b!595800 (=> res!381646 e!340401)))

(assert (=> b!595800 (= res!381646 (or (bvsge (size!18125 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18125 a!2986))))))

(assert (=> b!595800 (arrayContainsKey!0 lt!270554 (select (arr!17761 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270556 () Unit!18722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36994 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18722)

(assert (=> b!595800 (= lt!270556 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270554 (select (arr!17761 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595801 () Bool)

(declare-fun Unit!18725 () Unit!18722)

(assert (=> b!595801 (= e!340404 Unit!18725)))

(declare-fun b!595802 () Bool)

(declare-fun res!381649 () Bool)

(assert (=> b!595802 (=> (not res!381649) (not e!340403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595802 (= res!381649 (validKeyInArray!0 (select (arr!17761 a!2986) j!136)))))

(declare-fun b!595804 () Bool)

(declare-fun res!381644 () Bool)

(assert (=> b!595804 (=> res!381644 e!340401)))

(assert (=> b!595804 (= res!381644 (contains!2937 Nil!11799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595805 () Bool)

(declare-fun e!340407 () Bool)

(declare-fun e!340406 () Bool)

(assert (=> b!595805 (= e!340407 e!340406)))

(declare-fun res!381651 () Bool)

(assert (=> b!595805 (=> (not res!381651) (not e!340406))))

(declare-datatypes ((SeekEntryResult!6201 0))(
  ( (MissingZero!6201 (index!27052 (_ BitVec 32))) (Found!6201 (index!27053 (_ BitVec 32))) (Intermediate!6201 (undefined!7013 Bool) (index!27054 (_ BitVec 32)) (x!55853 (_ BitVec 32))) (Undefined!6201) (MissingVacant!6201 (index!27055 (_ BitVec 32))) )
))
(declare-fun lt!270557 () SeekEntryResult!6201)

(assert (=> b!595805 (= res!381651 (and (= lt!270557 (Found!6201 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17761 a!2986) index!984) (select (arr!17761 a!2986) j!136))) (not (= (select (arr!17761 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36994 (_ BitVec 32)) SeekEntryResult!6201)

(assert (=> b!595805 (= lt!270557 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17761 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595806 () Bool)

(declare-fun res!381642 () Bool)

(assert (=> b!595806 (=> (not res!381642) (not e!340403))))

(assert (=> b!595806 (= res!381642 (validKeyInArray!0 k0!1786))))

(declare-fun b!595807 () Bool)

(assert (=> b!595807 (= e!340402 (arrayContainsKey!0 lt!270554 (select (arr!17761 a!2986) j!136) index!984))))

(declare-fun b!595808 () Bool)

(declare-fun e!340405 () Bool)

(assert (=> b!595808 (= e!340405 e!340410)))

(declare-fun res!381640 () Bool)

(assert (=> b!595808 (=> res!381640 e!340410)))

(assert (=> b!595808 (= res!381640 (or (not (= (select (arr!17761 a!2986) j!136) lt!270559)) (not (= (select (arr!17761 a!2986) j!136) lt!270563)) (bvsge j!136 index!984)))))

(assert (=> b!595808 e!340408))

(declare-fun res!381655 () Bool)

(assert (=> b!595808 (=> (not res!381655) (not e!340408))))

(assert (=> b!595808 (= res!381655 (= lt!270563 (select (arr!17761 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595808 (= lt!270563 (select (store (arr!17761 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595809 () Bool)

(assert (=> b!595809 (= e!340401 true)))

(declare-fun lt!270555 () Bool)

(assert (=> b!595809 (= lt!270555 (contains!2937 Nil!11799 k0!1786))))

(declare-fun b!595810 () Bool)

(declare-fun res!381643 () Bool)

(assert (=> b!595810 (=> (not res!381643) (not e!340403))))

(assert (=> b!595810 (= res!381643 (and (= (size!18125 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18125 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18125 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595811 () Bool)

(declare-fun e!340409 () Bool)

(declare-fun lt!270562 () SeekEntryResult!6201)

(assert (=> b!595811 (= e!340409 (= lt!270557 lt!270562))))

(declare-fun b!595812 () Bool)

(declare-fun res!381653 () Bool)

(assert (=> b!595812 (=> (not res!381653) (not e!340413))))

(declare-fun arrayNoDuplicates!0 (array!36994 (_ BitVec 32) List!11802) Bool)

(assert (=> b!595812 (= res!381653 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11799))))

(declare-fun b!595813 () Bool)

(assert (=> b!595813 (= e!340403 e!340413)))

(declare-fun res!381641 () Bool)

(assert (=> b!595813 (=> (not res!381641) (not e!340413))))

(declare-fun lt!270564 () SeekEntryResult!6201)

(assert (=> b!595813 (= res!381641 (or (= lt!270564 (MissingZero!6201 i!1108)) (= lt!270564 (MissingVacant!6201 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36994 (_ BitVec 32)) SeekEntryResult!6201)

(assert (=> b!595813 (= lt!270564 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595814 () Bool)

(assert (=> b!595814 (= e!340413 e!340407)))

(declare-fun res!381645 () Bool)

(assert (=> b!595814 (=> (not res!381645) (not e!340407))))

(assert (=> b!595814 (= res!381645 (= (select (store (arr!17761 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595814 (= lt!270554 (array!36995 (store (arr!17761 a!2986) i!1108 k0!1786) (size!18125 a!2986)))))

(declare-fun b!595803 () Bool)

(assert (=> b!595803 (= e!340406 (not e!340405))))

(declare-fun res!381656 () Bool)

(assert (=> b!595803 (=> res!381656 e!340405)))

(declare-fun lt!270560 () SeekEntryResult!6201)

(assert (=> b!595803 (= res!381656 (not (= lt!270560 (Found!6201 index!984))))))

(declare-fun lt!270565 () Unit!18722)

(assert (=> b!595803 (= lt!270565 e!340404)))

(declare-fun c!67445 () Bool)

(assert (=> b!595803 (= c!67445 (= lt!270560 Undefined!6201))))

(assert (=> b!595803 (= lt!270560 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270559 lt!270554 mask!3053))))

(assert (=> b!595803 e!340409))

(declare-fun res!381654 () Bool)

(assert (=> b!595803 (=> (not res!381654) (not e!340409))))

(declare-fun lt!270561 () (_ BitVec 32))

(assert (=> b!595803 (= res!381654 (= lt!270562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270561 vacantSpotIndex!68 lt!270559 lt!270554 mask!3053)))))

(assert (=> b!595803 (= lt!270562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270561 vacantSpotIndex!68 (select (arr!17761 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595803 (= lt!270559 (select (store (arr!17761 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270558 () Unit!18722)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36994 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18722)

(assert (=> b!595803 (= lt!270558 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270561 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595803 (= lt!270561 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!381648 () Bool)

(assert (=> start!54534 (=> (not res!381648) (not e!340403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54534 (= res!381648 (validMask!0 mask!3053))))

(assert (=> start!54534 e!340403))

(assert (=> start!54534 true))

(declare-fun array_inv!13557 (array!36994) Bool)

(assert (=> start!54534 (array_inv!13557 a!2986)))

(assert (= (and start!54534 res!381648) b!595810))

(assert (= (and b!595810 res!381643) b!595802))

(assert (= (and b!595802 res!381649) b!595806))

(assert (= (and b!595806 res!381642) b!595795))

(assert (= (and b!595795 res!381639) b!595813))

(assert (= (and b!595813 res!381641) b!595792))

(assert (= (and b!595792 res!381636) b!595812))

(assert (= (and b!595812 res!381653) b!595796))

(assert (= (and b!595796 res!381637) b!595814))

(assert (= (and b!595814 res!381645) b!595805))

(assert (= (and b!595805 res!381651) b!595803))

(assert (= (and b!595803 res!381654) b!595811))

(assert (= (and b!595803 c!67445) b!595799))

(assert (= (and b!595803 (not c!67445)) b!595801))

(assert (= (and b!595803 (not res!381656)) b!595808))

(assert (= (and b!595808 res!381655) b!595793))

(assert (= (and b!595793 (not res!381638)) b!595797))

(assert (= (and b!595797 res!381647) b!595807))

(assert (= (and b!595808 (not res!381640)) b!595800))

(assert (= (and b!595800 (not res!381646)) b!595794))

(assert (= (and b!595794 (not res!381652)) b!595804))

(assert (= (and b!595804 (not res!381644)) b!595798))

(assert (= (and b!595798 (not res!381650)) b!595809))

(declare-fun m!573387 () Bool)

(assert (=> b!595809 m!573387))

(declare-fun m!573389 () Bool)

(assert (=> b!595797 m!573389))

(assert (=> b!595797 m!573389))

(declare-fun m!573391 () Bool)

(assert (=> b!595797 m!573391))

(declare-fun m!573393 () Bool)

(assert (=> b!595814 m!573393))

(declare-fun m!573395 () Bool)

(assert (=> b!595814 m!573395))

(declare-fun m!573397 () Bool)

(assert (=> b!595794 m!573397))

(declare-fun m!573399 () Bool)

(assert (=> b!595813 m!573399))

(assert (=> b!595802 m!573389))

(assert (=> b!595802 m!573389))

(declare-fun m!573401 () Bool)

(assert (=> b!595802 m!573401))

(declare-fun m!573403 () Bool)

(assert (=> b!595804 m!573403))

(declare-fun m!573405 () Bool)

(assert (=> b!595803 m!573405))

(declare-fun m!573407 () Bool)

(assert (=> b!595803 m!573407))

(assert (=> b!595803 m!573393))

(declare-fun m!573409 () Bool)

(assert (=> b!595803 m!573409))

(assert (=> b!595803 m!573389))

(declare-fun m!573411 () Bool)

(assert (=> b!595803 m!573411))

(assert (=> b!595803 m!573389))

(declare-fun m!573413 () Bool)

(assert (=> b!595803 m!573413))

(declare-fun m!573415 () Bool)

(assert (=> b!595803 m!573415))

(declare-fun m!573417 () Bool)

(assert (=> b!595812 m!573417))

(assert (=> b!595807 m!573389))

(assert (=> b!595807 m!573389))

(declare-fun m!573419 () Bool)

(assert (=> b!595807 m!573419))

(declare-fun m!573421 () Bool)

(assert (=> b!595798 m!573421))

(declare-fun m!573423 () Bool)

(assert (=> b!595805 m!573423))

(assert (=> b!595805 m!573389))

(assert (=> b!595805 m!573389))

(declare-fun m!573425 () Bool)

(assert (=> b!595805 m!573425))

(declare-fun m!573427 () Bool)

(assert (=> start!54534 m!573427))

(declare-fun m!573429 () Bool)

(assert (=> start!54534 m!573429))

(assert (=> b!595800 m!573389))

(assert (=> b!595800 m!573389))

(declare-fun m!573431 () Bool)

(assert (=> b!595800 m!573431))

(assert (=> b!595800 m!573389))

(declare-fun m!573433 () Bool)

(assert (=> b!595800 m!573433))

(declare-fun m!573435 () Bool)

(assert (=> b!595796 m!573435))

(declare-fun m!573437 () Bool)

(assert (=> b!595795 m!573437))

(declare-fun m!573439 () Bool)

(assert (=> b!595792 m!573439))

(assert (=> b!595793 m!573389))

(assert (=> b!595808 m!573389))

(assert (=> b!595808 m!573393))

(declare-fun m!573441 () Bool)

(assert (=> b!595808 m!573441))

(declare-fun m!573443 () Bool)

(assert (=> b!595806 m!573443))

(check-sat (not b!595795) (not b!595806) (not start!54534) (not b!595813) (not b!595807) (not b!595804) (not b!595797) (not b!595802) (not b!595794) (not b!595800) (not b!595809) (not b!595812) (not b!595803) (not b!595798) (not b!595792) (not b!595805))
(check-sat)
