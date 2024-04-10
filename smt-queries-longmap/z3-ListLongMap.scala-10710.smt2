; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125400 () Bool)

(assert start!125400)

(declare-fun b!1466673 () Bool)

(declare-fun res!995337 () Bool)

(declare-fun e!823956 () Bool)

(assert (=> b!1466673 (=> res!995337 e!823956)))

(declare-fun e!823954 () Bool)

(assert (=> b!1466673 (= res!995337 e!823954)))

(declare-fun c!135180 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466673 (= c!135180 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466674 () Bool)

(declare-fun res!995342 () Bool)

(declare-fun e!823957 () Bool)

(assert (=> b!1466674 (=> (not res!995342) (not e!823957))))

(declare-datatypes ((SeekEntryResult!11964 0))(
  ( (MissingZero!11964 (index!50248 (_ BitVec 32))) (Found!11964 (index!50249 (_ BitVec 32))) (Intermediate!11964 (undefined!12776 Bool) (index!50250 (_ BitVec 32)) (x!131821 (_ BitVec 32))) (Undefined!11964) (MissingVacant!11964 (index!50251 (_ BitVec 32))) )
))
(declare-fun lt!641841 () SeekEntryResult!11964)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98848 0))(
  ( (array!98849 (arr!47712 (Array (_ BitVec 32) (_ BitVec 64))) (size!48262 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98848)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98848 (_ BitVec 32)) SeekEntryResult!11964)

(assert (=> b!1466674 (= res!995342 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47712 a!2862) j!93) a!2862 mask!2687) lt!641841))))

(declare-fun lt!641837 () SeekEntryResult!11964)

(declare-fun lt!641838 () (_ BitVec 32))

(declare-fun b!1466675 () Bool)

(declare-fun lt!641842 () (_ BitVec 64))

(declare-fun lt!641844 () array!98848)

(assert (=> b!1466675 (= e!823954 (not (= lt!641837 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641838 lt!641842 lt!641844 mask!2687))))))

(declare-fun b!1466676 () Bool)

(declare-fun e!823955 () Bool)

(assert (=> b!1466676 (= e!823957 e!823955)))

(declare-fun res!995339 () Bool)

(assert (=> b!1466676 (=> (not res!995339) (not e!823955))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466676 (= res!995339 (= lt!641837 (Intermediate!11964 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466676 (= lt!641837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641842 mask!2687) lt!641842 lt!641844 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466676 (= lt!641842 (select (store (arr!47712 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466677 () Bool)

(declare-fun res!995349 () Bool)

(assert (=> b!1466677 (=> (not res!995349) (not e!823955))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466677 (= res!995349 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466678 () Bool)

(declare-fun res!995347 () Bool)

(declare-fun e!823958 () Bool)

(assert (=> b!1466678 (=> (not res!995347) (not e!823958))))

(declare-datatypes ((List!34213 0))(
  ( (Nil!34210) (Cons!34209 (h!35559 (_ BitVec 64)) (t!48907 List!34213)) )
))
(declare-fun arrayNoDuplicates!0 (array!98848 (_ BitVec 32) List!34213) Bool)

(assert (=> b!1466678 (= res!995347 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34210))))

(declare-fun b!1466679 () Bool)

(declare-fun e!823950 () Bool)

(assert (=> b!1466679 (= e!823955 (not e!823950))))

(declare-fun res!995350 () Bool)

(assert (=> b!1466679 (=> res!995350 e!823950)))

(assert (=> b!1466679 (= res!995350 (or (and (= (select (arr!47712 a!2862) index!646) (select (store (arr!47712 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47712 a!2862) index!646) (select (arr!47712 a!2862) j!93))) (= (select (arr!47712 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!641843 () SeekEntryResult!11964)

(assert (=> b!1466679 (and (= lt!641843 (Found!11964 j!93)) (or (= (select (arr!47712 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47712 a!2862) intermediateBeforeIndex!19) (select (arr!47712 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98848 (_ BitVec 32)) SeekEntryResult!11964)

(assert (=> b!1466679 (= lt!641843 (seekEntryOrOpen!0 (select (arr!47712 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98848 (_ BitVec 32)) Bool)

(assert (=> b!1466679 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49424 0))(
  ( (Unit!49425) )
))
(declare-fun lt!641840 () Unit!49424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49424)

(assert (=> b!1466679 (= lt!641840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466680 () Bool)

(assert (=> b!1466680 (= e!823956 true)))

(assert (=> b!1466680 (= lt!641843 (seekEntryOrOpen!0 lt!641842 lt!641844 mask!2687))))

(declare-fun lt!641839 () Unit!49424)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49424)

(assert (=> b!1466680 (= lt!641839 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641838 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466681 () Bool)

(declare-fun res!995336 () Bool)

(assert (=> b!1466681 (=> (not res!995336) (not e!823958))))

(assert (=> b!1466681 (= res!995336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466682 () Bool)

(declare-fun res!995346 () Bool)

(assert (=> b!1466682 (=> (not res!995346) (not e!823958))))

(assert (=> b!1466682 (= res!995346 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48262 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48262 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48262 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466683 () Bool)

(declare-fun res!995351 () Bool)

(assert (=> b!1466683 (=> (not res!995351) (not e!823958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466683 (= res!995351 (validKeyInArray!0 (select (arr!47712 a!2862) j!93)))))

(declare-fun e!823953 () Bool)

(declare-fun b!1466684 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98848 (_ BitVec 32)) SeekEntryResult!11964)

(assert (=> b!1466684 (= e!823953 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641842 lt!641844 mask!2687) (seekEntryOrOpen!0 lt!641842 lt!641844 mask!2687)))))

(declare-fun b!1466685 () Bool)

(declare-fun res!995338 () Bool)

(assert (=> b!1466685 (=> (not res!995338) (not e!823958))))

(assert (=> b!1466685 (= res!995338 (validKeyInArray!0 (select (arr!47712 a!2862) i!1006)))))

(declare-fun b!1466686 () Bool)

(declare-fun res!995352 () Bool)

(assert (=> b!1466686 (=> (not res!995352) (not e!823955))))

(assert (=> b!1466686 (= res!995352 e!823953)))

(declare-fun c!135179 () Bool)

(assert (=> b!1466686 (= c!135179 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466688 () Bool)

(assert (=> b!1466688 (= e!823953 (= lt!641837 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641842 lt!641844 mask!2687)))))

(declare-fun b!1466689 () Bool)

(declare-fun e!823952 () Bool)

(assert (=> b!1466689 (= e!823952 e!823957)))

(declare-fun res!995348 () Bool)

(assert (=> b!1466689 (=> (not res!995348) (not e!823957))))

(assert (=> b!1466689 (= res!995348 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47712 a!2862) j!93) mask!2687) (select (arr!47712 a!2862) j!93) a!2862 mask!2687) lt!641841))))

(assert (=> b!1466689 (= lt!641841 (Intermediate!11964 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466690 () Bool)

(declare-fun res!995345 () Bool)

(assert (=> b!1466690 (=> res!995345 e!823956)))

(assert (=> b!1466690 (= res!995345 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641838 (select (arr!47712 a!2862) j!93) a!2862 mask!2687) lt!641841)))))

(declare-fun b!1466691 () Bool)

(assert (=> b!1466691 (= e!823950 e!823956)))

(declare-fun res!995341 () Bool)

(assert (=> b!1466691 (=> res!995341 e!823956)))

(assert (=> b!1466691 (= res!995341 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641838 #b00000000000000000000000000000000) (bvsge lt!641838 (size!48262 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466691 (= lt!641838 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466692 () Bool)

(assert (=> b!1466692 (= e!823954 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641838 intermediateAfterIndex!19 lt!641842 lt!641844 mask!2687) (seekEntryOrOpen!0 lt!641842 lt!641844 mask!2687))))))

(declare-fun b!1466693 () Bool)

(declare-fun res!995344 () Bool)

(assert (=> b!1466693 (=> (not res!995344) (not e!823958))))

(assert (=> b!1466693 (= res!995344 (and (= (size!48262 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48262 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48262 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466694 () Bool)

(assert (=> b!1466694 (= e!823958 e!823952)))

(declare-fun res!995343 () Bool)

(assert (=> b!1466694 (=> (not res!995343) (not e!823952))))

(assert (=> b!1466694 (= res!995343 (= (select (store (arr!47712 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466694 (= lt!641844 (array!98849 (store (arr!47712 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48262 a!2862)))))

(declare-fun b!1466687 () Bool)

(declare-fun res!995340 () Bool)

(assert (=> b!1466687 (=> res!995340 e!823956)))

(assert (=> b!1466687 (= res!995340 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun res!995353 () Bool)

(assert (=> start!125400 (=> (not res!995353) (not e!823958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125400 (= res!995353 (validMask!0 mask!2687))))

(assert (=> start!125400 e!823958))

(assert (=> start!125400 true))

(declare-fun array_inv!36740 (array!98848) Bool)

(assert (=> start!125400 (array_inv!36740 a!2862)))

(assert (= (and start!125400 res!995353) b!1466693))

(assert (= (and b!1466693 res!995344) b!1466685))

(assert (= (and b!1466685 res!995338) b!1466683))

(assert (= (and b!1466683 res!995351) b!1466681))

(assert (= (and b!1466681 res!995336) b!1466678))

(assert (= (and b!1466678 res!995347) b!1466682))

(assert (= (and b!1466682 res!995346) b!1466694))

(assert (= (and b!1466694 res!995343) b!1466689))

(assert (= (and b!1466689 res!995348) b!1466674))

(assert (= (and b!1466674 res!995342) b!1466676))

(assert (= (and b!1466676 res!995339) b!1466686))

(assert (= (and b!1466686 c!135179) b!1466688))

(assert (= (and b!1466686 (not c!135179)) b!1466684))

(assert (= (and b!1466686 res!995352) b!1466677))

(assert (= (and b!1466677 res!995349) b!1466679))

(assert (= (and b!1466679 (not res!995350)) b!1466691))

(assert (= (and b!1466691 (not res!995341)) b!1466690))

(assert (= (and b!1466690 (not res!995345)) b!1466673))

(assert (= (and b!1466673 c!135180) b!1466675))

(assert (= (and b!1466673 (not c!135180)) b!1466692))

(assert (= (and b!1466673 (not res!995337)) b!1466687))

(assert (= (and b!1466687 (not res!995340)) b!1466680))

(declare-fun m!1353643 () Bool)

(assert (=> b!1466689 m!1353643))

(assert (=> b!1466689 m!1353643))

(declare-fun m!1353645 () Bool)

(assert (=> b!1466689 m!1353645))

(assert (=> b!1466689 m!1353645))

(assert (=> b!1466689 m!1353643))

(declare-fun m!1353647 () Bool)

(assert (=> b!1466689 m!1353647))

(declare-fun m!1353649 () Bool)

(assert (=> b!1466688 m!1353649))

(declare-fun m!1353651 () Bool)

(assert (=> b!1466676 m!1353651))

(assert (=> b!1466676 m!1353651))

(declare-fun m!1353653 () Bool)

(assert (=> b!1466676 m!1353653))

(declare-fun m!1353655 () Bool)

(assert (=> b!1466676 m!1353655))

(declare-fun m!1353657 () Bool)

(assert (=> b!1466676 m!1353657))

(declare-fun m!1353659 () Bool)

(assert (=> start!125400 m!1353659))

(declare-fun m!1353661 () Bool)

(assert (=> start!125400 m!1353661))

(declare-fun m!1353663 () Bool)

(assert (=> b!1466681 m!1353663))

(declare-fun m!1353665 () Bool)

(assert (=> b!1466692 m!1353665))

(declare-fun m!1353667 () Bool)

(assert (=> b!1466692 m!1353667))

(declare-fun m!1353669 () Bool)

(assert (=> b!1466675 m!1353669))

(assert (=> b!1466680 m!1353667))

(declare-fun m!1353671 () Bool)

(assert (=> b!1466680 m!1353671))

(assert (=> b!1466674 m!1353643))

(assert (=> b!1466674 m!1353643))

(declare-fun m!1353673 () Bool)

(assert (=> b!1466674 m!1353673))

(assert (=> b!1466694 m!1353655))

(declare-fun m!1353675 () Bool)

(assert (=> b!1466694 m!1353675))

(declare-fun m!1353677 () Bool)

(assert (=> b!1466678 m!1353677))

(declare-fun m!1353679 () Bool)

(assert (=> b!1466691 m!1353679))

(declare-fun m!1353681 () Bool)

(assert (=> b!1466679 m!1353681))

(assert (=> b!1466679 m!1353655))

(declare-fun m!1353683 () Bool)

(assert (=> b!1466679 m!1353683))

(declare-fun m!1353685 () Bool)

(assert (=> b!1466679 m!1353685))

(declare-fun m!1353687 () Bool)

(assert (=> b!1466679 m!1353687))

(assert (=> b!1466679 m!1353643))

(declare-fun m!1353689 () Bool)

(assert (=> b!1466679 m!1353689))

(declare-fun m!1353691 () Bool)

(assert (=> b!1466679 m!1353691))

(assert (=> b!1466679 m!1353643))

(declare-fun m!1353693 () Bool)

(assert (=> b!1466685 m!1353693))

(assert (=> b!1466685 m!1353693))

(declare-fun m!1353695 () Bool)

(assert (=> b!1466685 m!1353695))

(assert (=> b!1466683 m!1353643))

(assert (=> b!1466683 m!1353643))

(declare-fun m!1353697 () Bool)

(assert (=> b!1466683 m!1353697))

(assert (=> b!1466690 m!1353643))

(assert (=> b!1466690 m!1353643))

(declare-fun m!1353699 () Bool)

(assert (=> b!1466690 m!1353699))

(declare-fun m!1353701 () Bool)

(assert (=> b!1466684 m!1353701))

(assert (=> b!1466684 m!1353667))

(check-sat (not b!1466685) (not b!1466691) (not b!1466684) (not b!1466690) (not b!1466675) (not b!1466676) (not b!1466678) (not b!1466689) (not b!1466688) (not b!1466681) (not b!1466680) (not b!1466683) (not b!1466674) (not b!1466679) (not start!125400) (not b!1466692))
(check-sat)
