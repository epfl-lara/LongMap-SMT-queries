; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123560 () Bool)

(assert start!123560)

(declare-fun b!1432781 () Bool)

(declare-fun res!966752 () Bool)

(declare-fun e!808723 () Bool)

(assert (=> b!1432781 (=> (not res!966752) (not e!808723))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97497 0))(
  ( (array!97498 (arr!47056 (Array (_ BitVec 32) (_ BitVec 64))) (size!47608 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97497)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432781 (= res!966752 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47608 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47608 a!2831))))))

(declare-fun b!1432782 () Bool)

(declare-fun res!966757 () Bool)

(declare-fun e!808726 () Bool)

(assert (=> b!1432782 (=> (not res!966757) (not e!808726))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11362 0))(
  ( (MissingZero!11362 (index!47840 (_ BitVec 32))) (Found!11362 (index!47841 (_ BitVec 32))) (Intermediate!11362 (undefined!12174 Bool) (index!47842 (_ BitVec 32)) (x!129471 (_ BitVec 32))) (Undefined!11362) (MissingVacant!11362 (index!47843 (_ BitVec 32))) )
))
(declare-fun lt!630591 () SeekEntryResult!11362)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97497 (_ BitVec 32)) SeekEntryResult!11362)

(assert (=> b!1432782 (= res!966757 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!630591))))

(declare-fun e!808724 () Bool)

(declare-fun b!1432783 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97497 (_ BitVec 32)) SeekEntryResult!11362)

(assert (=> b!1432783 (= e!808724 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) (Found!11362 j!81)))))

(declare-fun b!1432784 () Bool)

(declare-fun res!966758 () Bool)

(assert (=> b!1432784 (=> (not res!966758) (not e!808726))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432784 (= res!966758 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432785 () Bool)

(declare-fun res!966756 () Bool)

(assert (=> b!1432785 (=> (not res!966756) (not e!808723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432785 (= res!966756 (validKeyInArray!0 (select (arr!47056 a!2831) j!81)))))

(declare-fun b!1432786 () Bool)

(declare-fun res!966754 () Bool)

(assert (=> b!1432786 (=> (not res!966754) (not e!808723))))

(declare-datatypes ((List!33644 0))(
  ( (Nil!33641) (Cons!33640 (h!34963 (_ BitVec 64)) (t!48330 List!33644)) )
))
(declare-fun arrayNoDuplicates!0 (array!97497 (_ BitVec 32) List!33644) Bool)

(assert (=> b!1432786 (= res!966754 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33641))))

(declare-fun b!1432787 () Bool)

(declare-fun res!966761 () Bool)

(assert (=> b!1432787 (=> (not res!966761) (not e!808726))))

(declare-fun lt!630590 () (_ BitVec 64))

(declare-fun lt!630587 () SeekEntryResult!11362)

(declare-fun lt!630589 () array!97497)

(assert (=> b!1432787 (= res!966761 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630590 lt!630589 mask!2608) lt!630587))))

(declare-fun b!1432788 () Bool)

(declare-fun e!808728 () Bool)

(assert (=> b!1432788 (= e!808726 (not e!808728))))

(declare-fun res!966763 () Bool)

(assert (=> b!1432788 (=> res!966763 e!808728)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432788 (= res!966763 (or (= (select (arr!47056 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47056 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47056 a!2831) index!585) (select (arr!47056 a!2831) j!81)) (= (select (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432788 e!808724))

(declare-fun res!966755 () Bool)

(assert (=> b!1432788 (=> (not res!966755) (not e!808724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97497 (_ BitVec 32)) Bool)

(assert (=> b!1432788 (= res!966755 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48309 0))(
  ( (Unit!48310) )
))
(declare-fun lt!630588 () Unit!48309)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48309)

(assert (=> b!1432788 (= lt!630588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432789 () Bool)

(declare-fun e!808725 () Bool)

(assert (=> b!1432789 (= e!808723 e!808725)))

(declare-fun res!966760 () Bool)

(assert (=> b!1432789 (=> (not res!966760) (not e!808725))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432789 (= res!966760 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!630591))))

(assert (=> b!1432789 (= lt!630591 (Intermediate!11362 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!966750 () Bool)

(assert (=> start!123560 (=> (not res!966750) (not e!808723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123560 (= res!966750 (validMask!0 mask!2608))))

(assert (=> start!123560 e!808723))

(assert (=> start!123560 true))

(declare-fun array_inv!36289 (array!97497) Bool)

(assert (=> start!123560 (array_inv!36289 a!2831)))

(declare-fun b!1432790 () Bool)

(declare-fun res!966753 () Bool)

(assert (=> b!1432790 (=> (not res!966753) (not e!808723))))

(assert (=> b!1432790 (= res!966753 (and (= (size!47608 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47608 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47608 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432791 () Bool)

(declare-fun res!966759 () Bool)

(assert (=> b!1432791 (=> (not res!966759) (not e!808723))))

(assert (=> b!1432791 (= res!966759 (validKeyInArray!0 (select (arr!47056 a!2831) i!982)))))

(declare-fun b!1432792 () Bool)

(declare-fun res!966751 () Bool)

(assert (=> b!1432792 (=> (not res!966751) (not e!808723))))

(assert (=> b!1432792 (= res!966751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432793 () Bool)

(assert (=> b!1432793 (= e!808725 e!808726)))

(declare-fun res!966762 () Bool)

(assert (=> b!1432793 (=> (not res!966762) (not e!808726))))

(assert (=> b!1432793 (= res!966762 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630590 mask!2608) lt!630590 lt!630589 mask!2608) lt!630587))))

(assert (=> b!1432793 (= lt!630587 (Intermediate!11362 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432793 (= lt!630590 (select (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432793 (= lt!630589 (array!97498 (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47608 a!2831)))))

(declare-fun b!1432794 () Bool)

(assert (=> b!1432794 (= e!808728 (and (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110)))))

(declare-fun lt!630586 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432794 (= lt!630586 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!123560 res!966750) b!1432790))

(assert (= (and b!1432790 res!966753) b!1432791))

(assert (= (and b!1432791 res!966759) b!1432785))

(assert (= (and b!1432785 res!966756) b!1432792))

(assert (= (and b!1432792 res!966751) b!1432786))

(assert (= (and b!1432786 res!966754) b!1432781))

(assert (= (and b!1432781 res!966752) b!1432789))

(assert (= (and b!1432789 res!966760) b!1432793))

(assert (= (and b!1432793 res!966762) b!1432782))

(assert (= (and b!1432782 res!966757) b!1432787))

(assert (= (and b!1432787 res!966761) b!1432784))

(assert (= (and b!1432784 res!966758) b!1432788))

(assert (= (and b!1432788 res!966755) b!1432783))

(assert (= (and b!1432788 (not res!966763)) b!1432794))

(declare-fun m!1322129 () Bool)

(assert (=> b!1432791 m!1322129))

(assert (=> b!1432791 m!1322129))

(declare-fun m!1322131 () Bool)

(assert (=> b!1432791 m!1322131))

(declare-fun m!1322133 () Bool)

(assert (=> b!1432785 m!1322133))

(assert (=> b!1432785 m!1322133))

(declare-fun m!1322135 () Bool)

(assert (=> b!1432785 m!1322135))

(declare-fun m!1322137 () Bool)

(assert (=> b!1432793 m!1322137))

(assert (=> b!1432793 m!1322137))

(declare-fun m!1322139 () Bool)

(assert (=> b!1432793 m!1322139))

(declare-fun m!1322141 () Bool)

(assert (=> b!1432793 m!1322141))

(declare-fun m!1322143 () Bool)

(assert (=> b!1432793 m!1322143))

(assert (=> b!1432783 m!1322133))

(assert (=> b!1432783 m!1322133))

(declare-fun m!1322145 () Bool)

(assert (=> b!1432783 m!1322145))

(declare-fun m!1322147 () Bool)

(assert (=> b!1432786 m!1322147))

(declare-fun m!1322149 () Bool)

(assert (=> b!1432792 m!1322149))

(declare-fun m!1322151 () Bool)

(assert (=> b!1432794 m!1322151))

(declare-fun m!1322153 () Bool)

(assert (=> start!123560 m!1322153))

(declare-fun m!1322155 () Bool)

(assert (=> start!123560 m!1322155))

(assert (=> b!1432788 m!1322141))

(declare-fun m!1322157 () Bool)

(assert (=> b!1432788 m!1322157))

(declare-fun m!1322159 () Bool)

(assert (=> b!1432788 m!1322159))

(declare-fun m!1322161 () Bool)

(assert (=> b!1432788 m!1322161))

(assert (=> b!1432788 m!1322133))

(declare-fun m!1322163 () Bool)

(assert (=> b!1432788 m!1322163))

(assert (=> b!1432782 m!1322133))

(assert (=> b!1432782 m!1322133))

(declare-fun m!1322165 () Bool)

(assert (=> b!1432782 m!1322165))

(declare-fun m!1322167 () Bool)

(assert (=> b!1432787 m!1322167))

(assert (=> b!1432789 m!1322133))

(assert (=> b!1432789 m!1322133))

(declare-fun m!1322169 () Bool)

(assert (=> b!1432789 m!1322169))

(assert (=> b!1432789 m!1322169))

(assert (=> b!1432789 m!1322133))

(declare-fun m!1322171 () Bool)

(assert (=> b!1432789 m!1322171))

(check-sat (not b!1432791) (not b!1432793) (not b!1432785) (not b!1432789) (not b!1432792) (not b!1432787) (not b!1432794) (not b!1432788) (not start!123560) (not b!1432782) (not b!1432786) (not b!1432783))
(check-sat)
(get-model)

(declare-fun b!1432889 () Bool)

(declare-fun e!808774 () Bool)

(declare-fun contains!9827 (List!33644 (_ BitVec 64)) Bool)

(assert (=> b!1432889 (= e!808774 (contains!9827 Nil!33641 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432890 () Bool)

(declare-fun e!808773 () Bool)

(declare-fun e!808775 () Bool)

(assert (=> b!1432890 (= e!808773 e!808775)))

(declare-fun res!966855 () Bool)

(assert (=> b!1432890 (=> (not res!966855) (not e!808775))))

(assert (=> b!1432890 (= res!966855 (not e!808774))))

(declare-fun res!966854 () Bool)

(assert (=> b!1432890 (=> (not res!966854) (not e!808774))))

(assert (=> b!1432890 (= res!966854 (validKeyInArray!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432891 () Bool)

(declare-fun e!808776 () Bool)

(assert (=> b!1432891 (= e!808775 e!808776)))

(declare-fun c!132517 () Bool)

(assert (=> b!1432891 (= c!132517 (validKeyInArray!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67454 () Bool)

(declare-fun call!67457 () Bool)

(assert (=> bm!67454 (= call!67457 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132517 (Cons!33640 (select (arr!47056 a!2831) #b00000000000000000000000000000000) Nil!33641) Nil!33641)))))

(declare-fun d!153819 () Bool)

(declare-fun res!966856 () Bool)

(assert (=> d!153819 (=> res!966856 e!808773)))

(assert (=> d!153819 (= res!966856 (bvsge #b00000000000000000000000000000000 (size!47608 a!2831)))))

(assert (=> d!153819 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33641) e!808773)))

(declare-fun b!1432892 () Bool)

(assert (=> b!1432892 (= e!808776 call!67457)))

(declare-fun b!1432893 () Bool)

(assert (=> b!1432893 (= e!808776 call!67457)))

(assert (= (and d!153819 (not res!966856)) b!1432890))

(assert (= (and b!1432890 res!966854) b!1432889))

(assert (= (and b!1432890 res!966855) b!1432891))

(assert (= (and b!1432891 c!132517) b!1432893))

(assert (= (and b!1432891 (not c!132517)) b!1432892))

(assert (= (or b!1432893 b!1432892) bm!67454))

(declare-fun m!1322261 () Bool)

(assert (=> b!1432889 m!1322261))

(assert (=> b!1432889 m!1322261))

(declare-fun m!1322263 () Bool)

(assert (=> b!1432889 m!1322263))

(assert (=> b!1432890 m!1322261))

(assert (=> b!1432890 m!1322261))

(declare-fun m!1322265 () Bool)

(assert (=> b!1432890 m!1322265))

(assert (=> b!1432891 m!1322261))

(assert (=> b!1432891 m!1322261))

(assert (=> b!1432891 m!1322265))

(assert (=> bm!67454 m!1322261))

(declare-fun m!1322267 () Bool)

(assert (=> bm!67454 m!1322267))

(assert (=> b!1432786 d!153819))

(declare-fun d!153821 () Bool)

(assert (=> d!153821 (= (validKeyInArray!0 (select (arr!47056 a!2831) j!81)) (and (not (= (select (arr!47056 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47056 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432785 d!153821))

(declare-fun e!808789 () SeekEntryResult!11362)

(declare-fun b!1432912 () Bool)

(assert (=> b!1432912 (= e!808789 (Intermediate!11362 false (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun e!808787 () SeekEntryResult!11362)

(declare-fun b!1432913 () Bool)

(assert (=> b!1432913 (= e!808787 (Intermediate!11362 true (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1432914 () Bool)

(declare-fun e!808790 () Bool)

(declare-fun lt!630633 () SeekEntryResult!11362)

(assert (=> b!1432914 (= e!808790 (bvsge (x!129471 lt!630633) #b01111111111111111111111111111110))))

(declare-fun b!1432915 () Bool)

(assert (=> b!1432915 (= e!808787 e!808789)))

(declare-fun c!132524 () Bool)

(declare-fun lt!630632 () (_ BitVec 64))

(assert (=> b!1432915 (= c!132524 (or (= lt!630632 (select (arr!47056 a!2831) j!81)) (= (bvadd lt!630632 lt!630632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432916 () Bool)

(assert (=> b!1432916 (= e!808789 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1432917 () Bool)

(declare-fun e!808788 () Bool)

(assert (=> b!1432917 (= e!808790 e!808788)))

(declare-fun res!966865 () Bool)

(get-info :version)

(assert (=> b!1432917 (= res!966865 (and ((_ is Intermediate!11362) lt!630633) (not (undefined!12174 lt!630633)) (bvslt (x!129471 lt!630633) #b01111111111111111111111111111110) (bvsge (x!129471 lt!630633) #b00000000000000000000000000000000) (bvsge (x!129471 lt!630633) #b00000000000000000000000000000000)))))

(assert (=> b!1432917 (=> (not res!966865) (not e!808788))))

(declare-fun b!1432919 () Bool)

(assert (=> b!1432919 (and (bvsge (index!47842 lt!630633) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630633) (size!47608 a!2831)))))

(declare-fun res!966864 () Bool)

(assert (=> b!1432919 (= res!966864 (= (select (arr!47056 a!2831) (index!47842 lt!630633)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808791 () Bool)

(assert (=> b!1432919 (=> res!966864 e!808791)))

(declare-fun b!1432920 () Bool)

(assert (=> b!1432920 (and (bvsge (index!47842 lt!630633) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630633) (size!47608 a!2831)))))

(declare-fun res!966863 () Bool)

(assert (=> b!1432920 (= res!966863 (= (select (arr!47056 a!2831) (index!47842 lt!630633)) (select (arr!47056 a!2831) j!81)))))

(assert (=> b!1432920 (=> res!966863 e!808791)))

(assert (=> b!1432920 (= e!808788 e!808791)))

(declare-fun d!153823 () Bool)

(assert (=> d!153823 e!808790))

(declare-fun c!132526 () Bool)

(assert (=> d!153823 (= c!132526 (and ((_ is Intermediate!11362) lt!630633) (undefined!12174 lt!630633)))))

(assert (=> d!153823 (= lt!630633 e!808787)))

(declare-fun c!132525 () Bool)

(assert (=> d!153823 (= c!132525 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153823 (= lt!630632 (select (arr!47056 a!2831) (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608)))))

(assert (=> d!153823 (validMask!0 mask!2608)))

(assert (=> d!153823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!630633)))

(declare-fun b!1432918 () Bool)

(assert (=> b!1432918 (and (bvsge (index!47842 lt!630633) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630633) (size!47608 a!2831)))))

(assert (=> b!1432918 (= e!808791 (= (select (arr!47056 a!2831) (index!47842 lt!630633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153823 c!132525) b!1432913))

(assert (= (and d!153823 (not c!132525)) b!1432915))

(assert (= (and b!1432915 c!132524) b!1432912))

(assert (= (and b!1432915 (not c!132524)) b!1432916))

(assert (= (and d!153823 c!132526) b!1432914))

(assert (= (and d!153823 (not c!132526)) b!1432917))

(assert (= (and b!1432917 res!966865) b!1432920))

(assert (= (and b!1432920 (not res!966863)) b!1432919))

(assert (= (and b!1432919 (not res!966864)) b!1432918))

(declare-fun m!1322269 () Bool)

(assert (=> b!1432920 m!1322269))

(assert (=> b!1432916 m!1322169))

(declare-fun m!1322271 () Bool)

(assert (=> b!1432916 m!1322271))

(assert (=> b!1432916 m!1322271))

(assert (=> b!1432916 m!1322133))

(declare-fun m!1322273 () Bool)

(assert (=> b!1432916 m!1322273))

(assert (=> d!153823 m!1322169))

(declare-fun m!1322275 () Bool)

(assert (=> d!153823 m!1322275))

(assert (=> d!153823 m!1322153))

(assert (=> b!1432918 m!1322269))

(assert (=> b!1432919 m!1322269))

(assert (=> b!1432789 d!153823))

(declare-fun d!153825 () Bool)

(declare-fun lt!630639 () (_ BitVec 32))

(declare-fun lt!630638 () (_ BitVec 32))

(assert (=> d!153825 (= lt!630639 (bvmul (bvxor lt!630638 (bvlshr lt!630638 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153825 (= lt!630638 ((_ extract 31 0) (bvand (bvxor (select (arr!47056 a!2831) j!81) (bvlshr (select (arr!47056 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153825 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966866 (let ((h!34966 ((_ extract 31 0) (bvand (bvxor (select (arr!47056 a!2831) j!81) (bvlshr (select (arr!47056 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129475 (bvmul (bvxor h!34966 (bvlshr h!34966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129475 (bvlshr x!129475 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966866 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966866 #b00000000000000000000000000000000))))))

(assert (=> d!153825 (= (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (bvand (bvxor lt!630639 (bvlshr lt!630639 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432789 d!153825))

(declare-fun d!153829 () Bool)

(declare-fun res!966872 () Bool)

(declare-fun e!808800 () Bool)

(assert (=> d!153829 (=> res!966872 e!808800)))

(assert (=> d!153829 (= res!966872 (bvsge j!81 (size!47608 a!2831)))))

(assert (=> d!153829 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808800)))

(declare-fun bm!67457 () Bool)

(declare-fun call!67460 () Bool)

(assert (=> bm!67457 (= call!67460 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1432929 () Bool)

(declare-fun e!808799 () Bool)

(assert (=> b!1432929 (= e!808799 call!67460)))

(declare-fun b!1432930 () Bool)

(declare-fun e!808798 () Bool)

(assert (=> b!1432930 (= e!808798 call!67460)))

(declare-fun b!1432931 () Bool)

(assert (=> b!1432931 (= e!808798 e!808799)))

(declare-fun lt!630647 () (_ BitVec 64))

(assert (=> b!1432931 (= lt!630647 (select (arr!47056 a!2831) j!81))))

(declare-fun lt!630648 () Unit!48309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97497 (_ BitVec 64) (_ BitVec 32)) Unit!48309)

(assert (=> b!1432931 (= lt!630648 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630647 j!81))))

(declare-fun arrayContainsKey!0 (array!97497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1432931 (arrayContainsKey!0 a!2831 lt!630647 #b00000000000000000000000000000000)))

(declare-fun lt!630646 () Unit!48309)

(assert (=> b!1432931 (= lt!630646 lt!630648)))

(declare-fun res!966871 () Bool)

(assert (=> b!1432931 (= res!966871 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) (Found!11362 j!81)))))

(assert (=> b!1432931 (=> (not res!966871) (not e!808799))))

(declare-fun b!1432932 () Bool)

(assert (=> b!1432932 (= e!808800 e!808798)))

(declare-fun c!132529 () Bool)

(assert (=> b!1432932 (= c!132529 (validKeyInArray!0 (select (arr!47056 a!2831) j!81)))))

(assert (= (and d!153829 (not res!966872)) b!1432932))

(assert (= (and b!1432932 c!132529) b!1432931))

(assert (= (and b!1432932 (not c!132529)) b!1432930))

(assert (= (and b!1432931 res!966871) b!1432929))

(assert (= (or b!1432929 b!1432930) bm!67457))

(declare-fun m!1322277 () Bool)

(assert (=> bm!67457 m!1322277))

(assert (=> b!1432931 m!1322133))

(declare-fun m!1322279 () Bool)

(assert (=> b!1432931 m!1322279))

(declare-fun m!1322281 () Bool)

(assert (=> b!1432931 m!1322281))

(assert (=> b!1432931 m!1322133))

(assert (=> b!1432931 m!1322145))

(assert (=> b!1432932 m!1322133))

(assert (=> b!1432932 m!1322133))

(assert (=> b!1432932 m!1322135))

(assert (=> b!1432788 d!153829))

(declare-fun d!153835 () Bool)

(assert (=> d!153835 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630663 () Unit!48309)

(declare-fun choose!38 (array!97497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48309)

(assert (=> d!153835 (= lt!630663 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153835 (validMask!0 mask!2608)))

(assert (=> d!153835 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630663)))

(declare-fun bs!41699 () Bool)

(assert (= bs!41699 d!153835))

(assert (=> bs!41699 m!1322161))

(declare-fun m!1322291 () Bool)

(assert (=> bs!41699 m!1322291))

(assert (=> bs!41699 m!1322153))

(assert (=> b!1432788 d!153835))

(declare-fun b!1432945 () Bool)

(declare-fun e!808812 () SeekEntryResult!11362)

(assert (=> b!1432945 (= e!808812 (Intermediate!11362 false index!585 x!605))))

(declare-fun b!1432946 () Bool)

(declare-fun e!808810 () SeekEntryResult!11362)

(assert (=> b!1432946 (= e!808810 (Intermediate!11362 true index!585 x!605))))

(declare-fun b!1432947 () Bool)

(declare-fun e!808813 () Bool)

(declare-fun lt!630665 () SeekEntryResult!11362)

(assert (=> b!1432947 (= e!808813 (bvsge (x!129471 lt!630665) #b01111111111111111111111111111110))))

(declare-fun b!1432948 () Bool)

(assert (=> b!1432948 (= e!808810 e!808812)))

(declare-fun c!132533 () Bool)

(declare-fun lt!630664 () (_ BitVec 64))

(assert (=> b!1432948 (= c!132533 (or (= lt!630664 lt!630590) (= (bvadd lt!630664 lt!630664) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432949 () Bool)

(assert (=> b!1432949 (= e!808812 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630590 lt!630589 mask!2608))))

(declare-fun b!1432950 () Bool)

(declare-fun e!808811 () Bool)

(assert (=> b!1432950 (= e!808813 e!808811)))

(declare-fun res!966881 () Bool)

(assert (=> b!1432950 (= res!966881 (and ((_ is Intermediate!11362) lt!630665) (not (undefined!12174 lt!630665)) (bvslt (x!129471 lt!630665) #b01111111111111111111111111111110) (bvsge (x!129471 lt!630665) #b00000000000000000000000000000000) (bvsge (x!129471 lt!630665) x!605)))))

(assert (=> b!1432950 (=> (not res!966881) (not e!808811))))

(declare-fun b!1432952 () Bool)

(assert (=> b!1432952 (and (bvsge (index!47842 lt!630665) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630665) (size!47608 lt!630589)))))

(declare-fun res!966880 () Bool)

(assert (=> b!1432952 (= res!966880 (= (select (arr!47056 lt!630589) (index!47842 lt!630665)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808814 () Bool)

(assert (=> b!1432952 (=> res!966880 e!808814)))

(declare-fun b!1432953 () Bool)

(assert (=> b!1432953 (and (bvsge (index!47842 lt!630665) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630665) (size!47608 lt!630589)))))

(declare-fun res!966879 () Bool)

(assert (=> b!1432953 (= res!966879 (= (select (arr!47056 lt!630589) (index!47842 lt!630665)) lt!630590))))

(assert (=> b!1432953 (=> res!966879 e!808814)))

(assert (=> b!1432953 (= e!808811 e!808814)))

(declare-fun d!153845 () Bool)

(assert (=> d!153845 e!808813))

(declare-fun c!132535 () Bool)

(assert (=> d!153845 (= c!132535 (and ((_ is Intermediate!11362) lt!630665) (undefined!12174 lt!630665)))))

(assert (=> d!153845 (= lt!630665 e!808810)))

(declare-fun c!132534 () Bool)

(assert (=> d!153845 (= c!132534 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153845 (= lt!630664 (select (arr!47056 lt!630589) index!585))))

(assert (=> d!153845 (validMask!0 mask!2608)))

(assert (=> d!153845 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630590 lt!630589 mask!2608) lt!630665)))

(declare-fun b!1432951 () Bool)

(assert (=> b!1432951 (and (bvsge (index!47842 lt!630665) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630665) (size!47608 lt!630589)))))

(assert (=> b!1432951 (= e!808814 (= (select (arr!47056 lt!630589) (index!47842 lt!630665)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153845 c!132534) b!1432946))

(assert (= (and d!153845 (not c!132534)) b!1432948))

(assert (= (and b!1432948 c!132533) b!1432945))

(assert (= (and b!1432948 (not c!132533)) b!1432949))

(assert (= (and d!153845 c!132535) b!1432947))

(assert (= (and d!153845 (not c!132535)) b!1432950))

(assert (= (and b!1432950 res!966881) b!1432953))

(assert (= (and b!1432953 (not res!966879)) b!1432952))

(assert (= (and b!1432952 (not res!966880)) b!1432951))

(declare-fun m!1322293 () Bool)

(assert (=> b!1432953 m!1322293))

(assert (=> b!1432949 m!1322151))

(assert (=> b!1432949 m!1322151))

(declare-fun m!1322295 () Bool)

(assert (=> b!1432949 m!1322295))

(declare-fun m!1322297 () Bool)

(assert (=> d!153845 m!1322297))

(assert (=> d!153845 m!1322153))

(assert (=> b!1432951 m!1322293))

(assert (=> b!1432952 m!1322293))

(assert (=> b!1432787 d!153845))

(declare-fun d!153847 () Bool)

(declare-fun res!966883 () Bool)

(declare-fun e!808817 () Bool)

(assert (=> d!153847 (=> res!966883 e!808817)))

(assert (=> d!153847 (= res!966883 (bvsge #b00000000000000000000000000000000 (size!47608 a!2831)))))

(assert (=> d!153847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808817)))

(declare-fun bm!67461 () Bool)

(declare-fun call!67464 () Bool)

(assert (=> bm!67461 (= call!67464 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1432954 () Bool)

(declare-fun e!808816 () Bool)

(assert (=> b!1432954 (= e!808816 call!67464)))

(declare-fun b!1432955 () Bool)

(declare-fun e!808815 () Bool)

(assert (=> b!1432955 (= e!808815 call!67464)))

(declare-fun b!1432956 () Bool)

(assert (=> b!1432956 (= e!808815 e!808816)))

(declare-fun lt!630667 () (_ BitVec 64))

(assert (=> b!1432956 (= lt!630667 (select (arr!47056 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630668 () Unit!48309)

(assert (=> b!1432956 (= lt!630668 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630667 #b00000000000000000000000000000000))))

(assert (=> b!1432956 (arrayContainsKey!0 a!2831 lt!630667 #b00000000000000000000000000000000)))

(declare-fun lt!630666 () Unit!48309)

(assert (=> b!1432956 (= lt!630666 lt!630668)))

(declare-fun res!966882 () Bool)

(assert (=> b!1432956 (= res!966882 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11362 #b00000000000000000000000000000000)))))

(assert (=> b!1432956 (=> (not res!966882) (not e!808816))))

(declare-fun b!1432957 () Bool)

(assert (=> b!1432957 (= e!808817 e!808815)))

(declare-fun c!132536 () Bool)

(assert (=> b!1432957 (= c!132536 (validKeyInArray!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153847 (not res!966883)) b!1432957))

(assert (= (and b!1432957 c!132536) b!1432956))

(assert (= (and b!1432957 (not c!132536)) b!1432955))

(assert (= (and b!1432956 res!966882) b!1432954))

(assert (= (or b!1432954 b!1432955) bm!67461))

(declare-fun m!1322299 () Bool)

(assert (=> bm!67461 m!1322299))

(assert (=> b!1432956 m!1322261))

(declare-fun m!1322301 () Bool)

(assert (=> b!1432956 m!1322301))

(declare-fun m!1322303 () Bool)

(assert (=> b!1432956 m!1322303))

(assert (=> b!1432956 m!1322261))

(declare-fun m!1322305 () Bool)

(assert (=> b!1432956 m!1322305))

(assert (=> b!1432957 m!1322261))

(assert (=> b!1432957 m!1322261))

(assert (=> b!1432957 m!1322265))

(assert (=> b!1432792 d!153847))

(declare-fun d!153849 () Bool)

(assert (=> d!153849 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123560 d!153849))

(declare-fun d!153855 () Bool)

(assert (=> d!153855 (= (array_inv!36289 a!2831) (bvsge (size!47608 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123560 d!153855))

(declare-fun d!153857 () Bool)

(assert (=> d!153857 (= (validKeyInArray!0 (select (arr!47056 a!2831) i!982)) (and (not (= (select (arr!47056 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47056 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432791 d!153857))

(declare-fun d!153859 () Bool)

(declare-fun lt!630683 () (_ BitVec 32))

(assert (=> d!153859 (and (bvsge lt!630683 #b00000000000000000000000000000000) (bvslt lt!630683 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!153859 (= lt!630683 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!153859 (validMask!0 mask!2608)))

(assert (=> d!153859 (= (nextIndex!0 index!585 x!605 mask!2608) lt!630683)))

(declare-fun bs!41701 () Bool)

(assert (= bs!41701 d!153859))

(declare-fun m!1322321 () Bool)

(assert (=> bs!41701 m!1322321))

(assert (=> bs!41701 m!1322153))

(assert (=> b!1432794 d!153859))

(declare-fun d!153861 () Bool)

(declare-fun lt!630723 () SeekEntryResult!11362)

(assert (=> d!153861 (and (or ((_ is Undefined!11362) lt!630723) (not ((_ is Found!11362) lt!630723)) (and (bvsge (index!47841 lt!630723) #b00000000000000000000000000000000) (bvslt (index!47841 lt!630723) (size!47608 a!2831)))) (or ((_ is Undefined!11362) lt!630723) ((_ is Found!11362) lt!630723) (not ((_ is MissingZero!11362) lt!630723)) (and (bvsge (index!47840 lt!630723) #b00000000000000000000000000000000) (bvslt (index!47840 lt!630723) (size!47608 a!2831)))) (or ((_ is Undefined!11362) lt!630723) ((_ is Found!11362) lt!630723) ((_ is MissingZero!11362) lt!630723) (not ((_ is MissingVacant!11362) lt!630723)) (and (bvsge (index!47843 lt!630723) #b00000000000000000000000000000000) (bvslt (index!47843 lt!630723) (size!47608 a!2831)))) (or ((_ is Undefined!11362) lt!630723) (ite ((_ is Found!11362) lt!630723) (= (select (arr!47056 a!2831) (index!47841 lt!630723)) (select (arr!47056 a!2831) j!81)) (ite ((_ is MissingZero!11362) lt!630723) (= (select (arr!47056 a!2831) (index!47840 lt!630723)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11362) lt!630723) (= (select (arr!47056 a!2831) (index!47843 lt!630723)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!808865 () SeekEntryResult!11362)

(assert (=> d!153861 (= lt!630723 e!808865)))

(declare-fun c!132570 () Bool)

(declare-fun lt!630722 () SeekEntryResult!11362)

(assert (=> d!153861 (= c!132570 (and ((_ is Intermediate!11362) lt!630722) (undefined!12174 lt!630722)))))

(assert (=> d!153861 (= lt!630722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153861 (validMask!0 mask!2608)))

(assert (=> d!153861 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!630723)))

(declare-fun e!808867 () SeekEntryResult!11362)

(declare-fun b!1433040 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97497 (_ BitVec 32)) SeekEntryResult!11362)

(assert (=> b!1433040 (= e!808867 (seekKeyOrZeroReturnVacant!0 (x!129471 lt!630722) (index!47842 lt!630722) (index!47842 lt!630722) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433041 () Bool)

(declare-fun e!808866 () SeekEntryResult!11362)

(assert (=> b!1433041 (= e!808866 (Found!11362 (index!47842 lt!630722)))))

(declare-fun b!1433042 () Bool)

(declare-fun c!132568 () Bool)

(declare-fun lt!630724 () (_ BitVec 64))

(assert (=> b!1433042 (= c!132568 (= lt!630724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433042 (= e!808866 e!808867)))

(declare-fun b!1433043 () Bool)

(assert (=> b!1433043 (= e!808867 (MissingZero!11362 (index!47842 lt!630722)))))

(declare-fun b!1433044 () Bool)

(assert (=> b!1433044 (= e!808865 Undefined!11362)))

(declare-fun b!1433045 () Bool)

(assert (=> b!1433045 (= e!808865 e!808866)))

(assert (=> b!1433045 (= lt!630724 (select (arr!47056 a!2831) (index!47842 lt!630722)))))

(declare-fun c!132569 () Bool)

(assert (=> b!1433045 (= c!132569 (= lt!630724 (select (arr!47056 a!2831) j!81)))))

(assert (= (and d!153861 c!132570) b!1433044))

(assert (= (and d!153861 (not c!132570)) b!1433045))

(assert (= (and b!1433045 c!132569) b!1433041))

(assert (= (and b!1433045 (not c!132569)) b!1433042))

(assert (= (and b!1433042 c!132568) b!1433043))

(assert (= (and b!1433042 (not c!132568)) b!1433040))

(assert (=> d!153861 m!1322133))

(assert (=> d!153861 m!1322169))

(declare-fun m!1322355 () Bool)

(assert (=> d!153861 m!1322355))

(assert (=> d!153861 m!1322153))

(declare-fun m!1322357 () Bool)

(assert (=> d!153861 m!1322357))

(assert (=> d!153861 m!1322169))

(assert (=> d!153861 m!1322133))

(assert (=> d!153861 m!1322171))

(declare-fun m!1322359 () Bool)

(assert (=> d!153861 m!1322359))

(assert (=> b!1433040 m!1322133))

(declare-fun m!1322361 () Bool)

(assert (=> b!1433040 m!1322361))

(declare-fun m!1322363 () Bool)

(assert (=> b!1433045 m!1322363))

(assert (=> b!1432783 d!153861))

(declare-fun b!1433046 () Bool)

(declare-fun e!808870 () SeekEntryResult!11362)

(assert (=> b!1433046 (= e!808870 (Intermediate!11362 false (toIndex!0 lt!630590 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433047 () Bool)

(declare-fun e!808868 () SeekEntryResult!11362)

(assert (=> b!1433047 (= e!808868 (Intermediate!11362 true (toIndex!0 lt!630590 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433048 () Bool)

(declare-fun e!808871 () Bool)

(declare-fun lt!630726 () SeekEntryResult!11362)

(assert (=> b!1433048 (= e!808871 (bvsge (x!129471 lt!630726) #b01111111111111111111111111111110))))

(declare-fun b!1433049 () Bool)

(assert (=> b!1433049 (= e!808868 e!808870)))

(declare-fun c!132571 () Bool)

(declare-fun lt!630725 () (_ BitVec 64))

(assert (=> b!1433049 (= c!132571 (or (= lt!630725 lt!630590) (= (bvadd lt!630725 lt!630725) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433050 () Bool)

(assert (=> b!1433050 (= e!808870 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630590 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630590 lt!630589 mask!2608))))

(declare-fun b!1433051 () Bool)

(declare-fun e!808869 () Bool)

(assert (=> b!1433051 (= e!808871 e!808869)))

(declare-fun res!966907 () Bool)

(assert (=> b!1433051 (= res!966907 (and ((_ is Intermediate!11362) lt!630726) (not (undefined!12174 lt!630726)) (bvslt (x!129471 lt!630726) #b01111111111111111111111111111110) (bvsge (x!129471 lt!630726) #b00000000000000000000000000000000) (bvsge (x!129471 lt!630726) #b00000000000000000000000000000000)))))

(assert (=> b!1433051 (=> (not res!966907) (not e!808869))))

(declare-fun b!1433053 () Bool)

(assert (=> b!1433053 (and (bvsge (index!47842 lt!630726) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630726) (size!47608 lt!630589)))))

(declare-fun res!966906 () Bool)

(assert (=> b!1433053 (= res!966906 (= (select (arr!47056 lt!630589) (index!47842 lt!630726)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808872 () Bool)

(assert (=> b!1433053 (=> res!966906 e!808872)))

(declare-fun b!1433054 () Bool)

(assert (=> b!1433054 (and (bvsge (index!47842 lt!630726) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630726) (size!47608 lt!630589)))))

(declare-fun res!966905 () Bool)

(assert (=> b!1433054 (= res!966905 (= (select (arr!47056 lt!630589) (index!47842 lt!630726)) lt!630590))))

(assert (=> b!1433054 (=> res!966905 e!808872)))

(assert (=> b!1433054 (= e!808869 e!808872)))

(declare-fun d!153877 () Bool)

(assert (=> d!153877 e!808871))

(declare-fun c!132573 () Bool)

(assert (=> d!153877 (= c!132573 (and ((_ is Intermediate!11362) lt!630726) (undefined!12174 lt!630726)))))

(assert (=> d!153877 (= lt!630726 e!808868)))

(declare-fun c!132572 () Bool)

(assert (=> d!153877 (= c!132572 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153877 (= lt!630725 (select (arr!47056 lt!630589) (toIndex!0 lt!630590 mask!2608)))))

(assert (=> d!153877 (validMask!0 mask!2608)))

(assert (=> d!153877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630590 mask!2608) lt!630590 lt!630589 mask!2608) lt!630726)))

(declare-fun b!1433052 () Bool)

(assert (=> b!1433052 (and (bvsge (index!47842 lt!630726) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630726) (size!47608 lt!630589)))))

(assert (=> b!1433052 (= e!808872 (= (select (arr!47056 lt!630589) (index!47842 lt!630726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153877 c!132572) b!1433047))

(assert (= (and d!153877 (not c!132572)) b!1433049))

(assert (= (and b!1433049 c!132571) b!1433046))

(assert (= (and b!1433049 (not c!132571)) b!1433050))

(assert (= (and d!153877 c!132573) b!1433048))

(assert (= (and d!153877 (not c!132573)) b!1433051))

(assert (= (and b!1433051 res!966907) b!1433054))

(assert (= (and b!1433054 (not res!966905)) b!1433053))

(assert (= (and b!1433053 (not res!966906)) b!1433052))

(declare-fun m!1322365 () Bool)

(assert (=> b!1433054 m!1322365))

(assert (=> b!1433050 m!1322137))

(declare-fun m!1322367 () Bool)

(assert (=> b!1433050 m!1322367))

(assert (=> b!1433050 m!1322367))

(declare-fun m!1322369 () Bool)

(assert (=> b!1433050 m!1322369))

(assert (=> d!153877 m!1322137))

(declare-fun m!1322371 () Bool)

(assert (=> d!153877 m!1322371))

(assert (=> d!153877 m!1322153))

(assert (=> b!1433052 m!1322365))

(assert (=> b!1433053 m!1322365))

(assert (=> b!1432793 d!153877))

(declare-fun d!153879 () Bool)

(declare-fun lt!630728 () (_ BitVec 32))

(declare-fun lt!630727 () (_ BitVec 32))

(assert (=> d!153879 (= lt!630728 (bvmul (bvxor lt!630727 (bvlshr lt!630727 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153879 (= lt!630727 ((_ extract 31 0) (bvand (bvxor lt!630590 (bvlshr lt!630590 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153879 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966866 (let ((h!34966 ((_ extract 31 0) (bvand (bvxor lt!630590 (bvlshr lt!630590 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129475 (bvmul (bvxor h!34966 (bvlshr h!34966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129475 (bvlshr x!129475 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966866 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966866 #b00000000000000000000000000000000))))))

(assert (=> d!153879 (= (toIndex!0 lt!630590 mask!2608) (bvand (bvxor lt!630728 (bvlshr lt!630728 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432793 d!153879))

(declare-fun b!1433055 () Bool)

(declare-fun e!808875 () SeekEntryResult!11362)

(assert (=> b!1433055 (= e!808875 (Intermediate!11362 false index!585 x!605))))

(declare-fun b!1433056 () Bool)

(declare-fun e!808873 () SeekEntryResult!11362)

(assert (=> b!1433056 (= e!808873 (Intermediate!11362 true index!585 x!605))))

(declare-fun b!1433057 () Bool)

(declare-fun e!808876 () Bool)

(declare-fun lt!630730 () SeekEntryResult!11362)

(assert (=> b!1433057 (= e!808876 (bvsge (x!129471 lt!630730) #b01111111111111111111111111111110))))

(declare-fun b!1433058 () Bool)

(assert (=> b!1433058 (= e!808873 e!808875)))

(declare-fun lt!630729 () (_ BitVec 64))

(declare-fun c!132574 () Bool)

(assert (=> b!1433058 (= c!132574 (or (= lt!630729 (select (arr!47056 a!2831) j!81)) (= (bvadd lt!630729 lt!630729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433059 () Bool)

(assert (=> b!1433059 (= e!808875 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433060 () Bool)

(declare-fun e!808874 () Bool)

(assert (=> b!1433060 (= e!808876 e!808874)))

(declare-fun res!966910 () Bool)

(assert (=> b!1433060 (= res!966910 (and ((_ is Intermediate!11362) lt!630730) (not (undefined!12174 lt!630730)) (bvslt (x!129471 lt!630730) #b01111111111111111111111111111110) (bvsge (x!129471 lt!630730) #b00000000000000000000000000000000) (bvsge (x!129471 lt!630730) x!605)))))

(assert (=> b!1433060 (=> (not res!966910) (not e!808874))))

(declare-fun b!1433062 () Bool)

(assert (=> b!1433062 (and (bvsge (index!47842 lt!630730) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630730) (size!47608 a!2831)))))

(declare-fun res!966909 () Bool)

(assert (=> b!1433062 (= res!966909 (= (select (arr!47056 a!2831) (index!47842 lt!630730)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808877 () Bool)

(assert (=> b!1433062 (=> res!966909 e!808877)))

(declare-fun b!1433063 () Bool)

(assert (=> b!1433063 (and (bvsge (index!47842 lt!630730) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630730) (size!47608 a!2831)))))

(declare-fun res!966908 () Bool)

(assert (=> b!1433063 (= res!966908 (= (select (arr!47056 a!2831) (index!47842 lt!630730)) (select (arr!47056 a!2831) j!81)))))

(assert (=> b!1433063 (=> res!966908 e!808877)))

(assert (=> b!1433063 (= e!808874 e!808877)))

(declare-fun d!153881 () Bool)

(assert (=> d!153881 e!808876))

(declare-fun c!132576 () Bool)

(assert (=> d!153881 (= c!132576 (and ((_ is Intermediate!11362) lt!630730) (undefined!12174 lt!630730)))))

(assert (=> d!153881 (= lt!630730 e!808873)))

(declare-fun c!132575 () Bool)

(assert (=> d!153881 (= c!132575 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153881 (= lt!630729 (select (arr!47056 a!2831) index!585))))

(assert (=> d!153881 (validMask!0 mask!2608)))

(assert (=> d!153881 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!630730)))

(declare-fun b!1433061 () Bool)

(assert (=> b!1433061 (and (bvsge (index!47842 lt!630730) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630730) (size!47608 a!2831)))))

(assert (=> b!1433061 (= e!808877 (= (select (arr!47056 a!2831) (index!47842 lt!630730)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153881 c!132575) b!1433056))

(assert (= (and d!153881 (not c!132575)) b!1433058))

(assert (= (and b!1433058 c!132574) b!1433055))

(assert (= (and b!1433058 (not c!132574)) b!1433059))

(assert (= (and d!153881 c!132576) b!1433057))

(assert (= (and d!153881 (not c!132576)) b!1433060))

(assert (= (and b!1433060 res!966910) b!1433063))

(assert (= (and b!1433063 (not res!966908)) b!1433062))

(assert (= (and b!1433062 (not res!966909)) b!1433061))

(declare-fun m!1322373 () Bool)

(assert (=> b!1433063 m!1322373))

(assert (=> b!1433059 m!1322151))

(assert (=> b!1433059 m!1322151))

(assert (=> b!1433059 m!1322133))

(declare-fun m!1322375 () Bool)

(assert (=> b!1433059 m!1322375))

(assert (=> d!153881 m!1322159))

(assert (=> d!153881 m!1322153))

(assert (=> b!1433061 m!1322373))

(assert (=> b!1433062 m!1322373))

(assert (=> b!1432782 d!153881))

(check-sat (not b!1432891) (not b!1432956) (not d!153823) (not b!1433040) (not d!153881) (not d!153877) (not b!1433059) (not d!153861) (not b!1432931) (not bm!67454) (not b!1432890) (not b!1432889) (not b!1432932) (not b!1432949) (not bm!67457) (not b!1432957) (not b!1433050) (not d!153845) (not d!153859) (not d!153835) (not bm!67461) (not b!1432916))
(check-sat)
