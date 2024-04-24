; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127476 () Bool)

(assert start!127476)

(declare-fun b!1496716 () Bool)

(declare-fun res!1017692 () Bool)

(declare-fun e!838461 () Bool)

(assert (=> b!1496716 (=> res!1017692 e!838461)))

(declare-fun lt!652228 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12348 0))(
  ( (MissingZero!12348 (index!51784 (_ BitVec 32))) (Found!12348 (index!51785 (_ BitVec 32))) (Intermediate!12348 (undefined!13160 Bool) (index!51786 (_ BitVec 32)) (x!133577 (_ BitVec 32))) (Undefined!12348) (MissingVacant!12348 (index!51787 (_ BitVec 32))) )
))
(declare-fun lt!652227 () SeekEntryResult!12348)

(declare-datatypes ((array!99898 0))(
  ( (array!99899 (arr!48211 (Array (_ BitVec 32) (_ BitVec 64))) (size!48762 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99898)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99898 (_ BitVec 32)) SeekEntryResult!12348)

(assert (=> b!1496716 (= res!1017692 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652228 (select (arr!48211 a!2862) j!93) a!2862 mask!2687) lt!652227)))))

(declare-fun b!1496717 () Bool)

(declare-fun res!1017693 () Bool)

(declare-fun e!838463 () Bool)

(assert (=> b!1496717 (=> (not res!1017693) (not e!838463))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496717 (= res!1017693 (validKeyInArray!0 (select (arr!48211 a!2862) i!1006)))))

(declare-fun b!1496718 () Bool)

(declare-fun res!1017687 () Bool)

(assert (=> b!1496718 (=> (not res!1017687) (not e!838463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99898 (_ BitVec 32)) Bool)

(assert (=> b!1496718 (= res!1017687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!652224 () (_ BitVec 64))

(declare-fun lt!652225 () array!99898)

(declare-fun e!838458 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1496719 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99898 (_ BitVec 32)) SeekEntryResult!12348)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99898 (_ BitVec 32)) SeekEntryResult!12348)

(assert (=> b!1496719 (= e!838458 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652224 lt!652225 mask!2687) (seekEntryOrOpen!0 lt!652224 lt!652225 mask!2687)))))

(declare-fun b!1496720 () Bool)

(declare-fun res!1017685 () Bool)

(assert (=> b!1496720 (=> (not res!1017685) (not e!838463))))

(assert (=> b!1496720 (= res!1017685 (and (= (size!48762 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48762 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48762 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496721 () Bool)

(declare-fun res!1017686 () Bool)

(declare-fun e!838464 () Bool)

(assert (=> b!1496721 (=> (not res!1017686) (not e!838464))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496721 (= res!1017686 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496722 () Bool)

(declare-fun lt!652226 () SeekEntryResult!12348)

(declare-fun e!838455 () Bool)

(assert (=> b!1496722 (= e!838455 (= lt!652226 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652228 lt!652224 lt!652225 mask!2687)))))

(declare-fun b!1496723 () Bool)

(declare-fun e!838457 () Bool)

(declare-fun e!838462 () Bool)

(assert (=> b!1496723 (= e!838457 e!838462)))

(declare-fun res!1017691 () Bool)

(assert (=> b!1496723 (=> (not res!1017691) (not e!838462))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496723 (= res!1017691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687) (select (arr!48211 a!2862) j!93) a!2862 mask!2687) lt!652227))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1496723 (= lt!652227 (Intermediate!12348 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496725 () Bool)

(declare-fun res!1017683 () Bool)

(assert (=> b!1496725 (=> (not res!1017683) (not e!838463))))

(declare-datatypes ((List!34699 0))(
  ( (Nil!34696) (Cons!34695 (h!36101 (_ BitVec 64)) (t!49385 List!34699)) )
))
(declare-fun arrayNoDuplicates!0 (array!99898 (_ BitVec 32) List!34699) Bool)

(assert (=> b!1496725 (= res!1017683 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34696))))

(declare-fun b!1496726 () Bool)

(declare-fun res!1017684 () Bool)

(declare-fun e!838460 () Bool)

(assert (=> b!1496726 (=> (not res!1017684) (not e!838460))))

(assert (=> b!1496726 (= res!1017684 (= (seekEntryOrOpen!0 (select (arr!48211 a!2862) j!93) a!2862 mask!2687) (Found!12348 j!93)))))

(declare-fun b!1496727 () Bool)

(assert (=> b!1496727 (= e!838455 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652228 intermediateAfterIndex!19 lt!652224 lt!652225 mask!2687) (seekEntryOrOpen!0 lt!652224 lt!652225 mask!2687)))))

(declare-fun b!1496728 () Bool)

(assert (=> b!1496728 (= e!838462 e!838464)))

(declare-fun res!1017682 () Bool)

(assert (=> b!1496728 (=> (not res!1017682) (not e!838464))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496728 (= res!1017682 (= lt!652226 (Intermediate!12348 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496728 (= lt!652226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652224 mask!2687) lt!652224 lt!652225 mask!2687))))

(assert (=> b!1496728 (= lt!652224 (select (store (arr!48211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496729 () Bool)

(declare-fun res!1017690 () Bool)

(assert (=> b!1496729 (=> (not res!1017690) (not e!838463))))

(assert (=> b!1496729 (= res!1017690 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48762 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48762 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48762 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496730 () Bool)

(declare-fun res!1017688 () Bool)

(assert (=> b!1496730 (=> (not res!1017688) (not e!838463))))

(assert (=> b!1496730 (= res!1017688 (validKeyInArray!0 (select (arr!48211 a!2862) j!93)))))

(declare-fun b!1496731 () Bool)

(declare-fun e!838456 () Bool)

(assert (=> b!1496731 (= e!838464 (not e!838456))))

(declare-fun res!1017696 () Bool)

(assert (=> b!1496731 (=> res!1017696 e!838456)))

(assert (=> b!1496731 (= res!1017696 (or (and (= (select (arr!48211 a!2862) index!646) (select (store (arr!48211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48211 a!2862) index!646) (select (arr!48211 a!2862) j!93))) (= (select (arr!48211 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496731 e!838460))

(declare-fun res!1017689 () Bool)

(assert (=> b!1496731 (=> (not res!1017689) (not e!838460))))

(assert (=> b!1496731 (= res!1017689 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50069 0))(
  ( (Unit!50070) )
))
(declare-fun lt!652223 () Unit!50069)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50069)

(assert (=> b!1496731 (= lt!652223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496732 () Bool)

(assert (=> b!1496732 (= e!838456 e!838461)))

(declare-fun res!1017698 () Bool)

(assert (=> b!1496732 (=> res!1017698 e!838461)))

(assert (=> b!1496732 (= res!1017698 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652228 #b00000000000000000000000000000000) (bvsge lt!652228 (size!48762 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496732 (= lt!652228 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1496733 () Bool)

(declare-fun res!1017694 () Bool)

(assert (=> b!1496733 (=> (not res!1017694) (not e!838464))))

(assert (=> b!1496733 (= res!1017694 e!838458)))

(declare-fun c!139059 () Bool)

(assert (=> b!1496733 (= c!139059 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496724 () Bool)

(assert (=> b!1496724 (= e!838460 (or (= (select (arr!48211 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48211 a!2862) intermediateBeforeIndex!19) (select (arr!48211 a!2862) j!93))))))

(declare-fun res!1017697 () Bool)

(assert (=> start!127476 (=> (not res!1017697) (not e!838463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127476 (= res!1017697 (validMask!0 mask!2687))))

(assert (=> start!127476 e!838463))

(assert (=> start!127476 true))

(declare-fun array_inv!37492 (array!99898) Bool)

(assert (=> start!127476 (array_inv!37492 a!2862)))

(declare-fun b!1496734 () Bool)

(declare-fun res!1017695 () Bool)

(assert (=> b!1496734 (=> (not res!1017695) (not e!838462))))

(assert (=> b!1496734 (= res!1017695 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48211 a!2862) j!93) a!2862 mask!2687) lt!652227))))

(declare-fun b!1496735 () Bool)

(assert (=> b!1496735 (= e!838463 e!838457)))

(declare-fun res!1017681 () Bool)

(assert (=> b!1496735 (=> (not res!1017681) (not e!838457))))

(assert (=> b!1496735 (= res!1017681 (= (select (store (arr!48211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496735 (= lt!652225 (array!99899 (store (arr!48211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48762 a!2862)))))

(declare-fun b!1496736 () Bool)

(assert (=> b!1496736 (= e!838458 (= lt!652226 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652224 lt!652225 mask!2687)))))

(declare-fun b!1496737 () Bool)

(assert (=> b!1496737 (= e!838461 e!838455)))

(declare-fun c!139060 () Bool)

(assert (=> b!1496737 (= c!139060 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!127476 res!1017697) b!1496720))

(assert (= (and b!1496720 res!1017685) b!1496717))

(assert (= (and b!1496717 res!1017693) b!1496730))

(assert (= (and b!1496730 res!1017688) b!1496718))

(assert (= (and b!1496718 res!1017687) b!1496725))

(assert (= (and b!1496725 res!1017683) b!1496729))

(assert (= (and b!1496729 res!1017690) b!1496735))

(assert (= (and b!1496735 res!1017681) b!1496723))

(assert (= (and b!1496723 res!1017691) b!1496734))

(assert (= (and b!1496734 res!1017695) b!1496728))

(assert (= (and b!1496728 res!1017682) b!1496733))

(assert (= (and b!1496733 c!139059) b!1496736))

(assert (= (and b!1496733 (not c!139059)) b!1496719))

(assert (= (and b!1496733 res!1017694) b!1496721))

(assert (= (and b!1496721 res!1017686) b!1496731))

(assert (= (and b!1496731 res!1017689) b!1496726))

(assert (= (and b!1496726 res!1017684) b!1496724))

(assert (= (and b!1496731 (not res!1017696)) b!1496732))

(assert (= (and b!1496732 (not res!1017698)) b!1496716))

(assert (= (and b!1496716 (not res!1017692)) b!1496737))

(assert (= (and b!1496737 c!139060) b!1496722))

(assert (= (and b!1496737 (not c!139060)) b!1496727))

(declare-fun m!1380307 () Bool)

(assert (=> b!1496725 m!1380307))

(declare-fun m!1380309 () Bool)

(assert (=> b!1496716 m!1380309))

(assert (=> b!1496716 m!1380309))

(declare-fun m!1380311 () Bool)

(assert (=> b!1496716 m!1380311))

(declare-fun m!1380313 () Bool)

(assert (=> b!1496724 m!1380313))

(assert (=> b!1496724 m!1380309))

(declare-fun m!1380315 () Bool)

(assert (=> b!1496718 m!1380315))

(assert (=> b!1496730 m!1380309))

(assert (=> b!1496730 m!1380309))

(declare-fun m!1380317 () Bool)

(assert (=> b!1496730 m!1380317))

(declare-fun m!1380319 () Bool)

(assert (=> b!1496735 m!1380319))

(declare-fun m!1380321 () Bool)

(assert (=> b!1496735 m!1380321))

(declare-fun m!1380323 () Bool)

(assert (=> b!1496719 m!1380323))

(declare-fun m!1380325 () Bool)

(assert (=> b!1496719 m!1380325))

(declare-fun m!1380327 () Bool)

(assert (=> b!1496717 m!1380327))

(assert (=> b!1496717 m!1380327))

(declare-fun m!1380329 () Bool)

(assert (=> b!1496717 m!1380329))

(declare-fun m!1380331 () Bool)

(assert (=> b!1496732 m!1380331))

(declare-fun m!1380333 () Bool)

(assert (=> start!127476 m!1380333))

(declare-fun m!1380335 () Bool)

(assert (=> start!127476 m!1380335))

(assert (=> b!1496723 m!1380309))

(assert (=> b!1496723 m!1380309))

(declare-fun m!1380337 () Bool)

(assert (=> b!1496723 m!1380337))

(assert (=> b!1496723 m!1380337))

(assert (=> b!1496723 m!1380309))

(declare-fun m!1380339 () Bool)

(assert (=> b!1496723 m!1380339))

(assert (=> b!1496734 m!1380309))

(assert (=> b!1496734 m!1380309))

(declare-fun m!1380341 () Bool)

(assert (=> b!1496734 m!1380341))

(declare-fun m!1380343 () Bool)

(assert (=> b!1496727 m!1380343))

(assert (=> b!1496727 m!1380325))

(declare-fun m!1380345 () Bool)

(assert (=> b!1496728 m!1380345))

(assert (=> b!1496728 m!1380345))

(declare-fun m!1380347 () Bool)

(assert (=> b!1496728 m!1380347))

(assert (=> b!1496728 m!1380319))

(declare-fun m!1380349 () Bool)

(assert (=> b!1496728 m!1380349))

(declare-fun m!1380351 () Bool)

(assert (=> b!1496736 m!1380351))

(declare-fun m!1380353 () Bool)

(assert (=> b!1496731 m!1380353))

(assert (=> b!1496731 m!1380319))

(declare-fun m!1380355 () Bool)

(assert (=> b!1496731 m!1380355))

(declare-fun m!1380357 () Bool)

(assert (=> b!1496731 m!1380357))

(declare-fun m!1380359 () Bool)

(assert (=> b!1496731 m!1380359))

(assert (=> b!1496731 m!1380309))

(declare-fun m!1380361 () Bool)

(assert (=> b!1496722 m!1380361))

(assert (=> b!1496726 m!1380309))

(assert (=> b!1496726 m!1380309))

(declare-fun m!1380363 () Bool)

(assert (=> b!1496726 m!1380363))

(check-sat (not b!1496726) (not b!1496727) (not b!1496736) (not b!1496718) (not b!1496722) (not b!1496725) (not b!1496719) (not b!1496732) (not b!1496734) (not b!1496728) (not b!1496730) (not b!1496717) (not b!1496731) (not start!127476) (not b!1496716) (not b!1496723))
(check-sat)
(get-model)

(declare-fun d!157661 () Bool)

(declare-fun e!838539 () Bool)

(assert (=> d!157661 e!838539))

(declare-fun c!139081 () Bool)

(declare-fun lt!652270 () SeekEntryResult!12348)

(get-info :version)

(assert (=> d!157661 (= c!139081 (and ((_ is Intermediate!12348) lt!652270) (undefined!13160 lt!652270)))))

(declare-fun e!838537 () SeekEntryResult!12348)

(assert (=> d!157661 (= lt!652270 e!838537)))

(declare-fun c!139079 () Bool)

(assert (=> d!157661 (= c!139079 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!652269 () (_ BitVec 64))

(assert (=> d!157661 (= lt!652269 (select (arr!48211 lt!652225) lt!652228))))

(assert (=> d!157661 (validMask!0 mask!2687)))

(assert (=> d!157661 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652228 lt!652224 lt!652225 mask!2687) lt!652270)))

(declare-fun b!1496888 () Bool)

(assert (=> b!1496888 (and (bvsge (index!51786 lt!652270) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652270) (size!48762 lt!652225)))))

(declare-fun e!838536 () Bool)

(assert (=> b!1496888 (= e!838536 (= (select (arr!48211 lt!652225) (index!51786 lt!652270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496889 () Bool)

(assert (=> b!1496889 (= e!838539 (bvsge (x!133577 lt!652270) #b01111111111111111111111111111110))))

(declare-fun e!838535 () SeekEntryResult!12348)

(declare-fun b!1496890 () Bool)

(assert (=> b!1496890 (= e!838535 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!652228 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) lt!652224 lt!652225 mask!2687))))

(declare-fun b!1496891 () Bool)

(assert (=> b!1496891 (and (bvsge (index!51786 lt!652270) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652270) (size!48762 lt!652225)))))

(declare-fun res!1017814 () Bool)

(assert (=> b!1496891 (= res!1017814 (= (select (arr!48211 lt!652225) (index!51786 lt!652270)) lt!652224))))

(assert (=> b!1496891 (=> res!1017814 e!838536)))

(declare-fun e!838538 () Bool)

(assert (=> b!1496891 (= e!838538 e!838536)))

(declare-fun b!1496892 () Bool)

(assert (=> b!1496892 (= e!838535 (Intermediate!12348 false lt!652228 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1496893 () Bool)

(assert (=> b!1496893 (= e!838537 e!838535)))

(declare-fun c!139080 () Bool)

(assert (=> b!1496893 (= c!139080 (or (= lt!652269 lt!652224) (= (bvadd lt!652269 lt!652269) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496894 () Bool)

(assert (=> b!1496894 (= e!838537 (Intermediate!12348 true lt!652228 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1496895 () Bool)

(assert (=> b!1496895 (and (bvsge (index!51786 lt!652270) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652270) (size!48762 lt!652225)))))

(declare-fun res!1017815 () Bool)

(assert (=> b!1496895 (= res!1017815 (= (select (arr!48211 lt!652225) (index!51786 lt!652270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496895 (=> res!1017815 e!838536)))

(declare-fun b!1496896 () Bool)

(assert (=> b!1496896 (= e!838539 e!838538)))

(declare-fun res!1017813 () Bool)

(assert (=> b!1496896 (= res!1017813 (and ((_ is Intermediate!12348) lt!652270) (not (undefined!13160 lt!652270)) (bvslt (x!133577 lt!652270) #b01111111111111111111111111111110) (bvsge (x!133577 lt!652270) #b00000000000000000000000000000000) (bvsge (x!133577 lt!652270) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1496896 (=> (not res!1017813) (not e!838538))))

(assert (= (and d!157661 c!139079) b!1496894))

(assert (= (and d!157661 (not c!139079)) b!1496893))

(assert (= (and b!1496893 c!139080) b!1496892))

(assert (= (and b!1496893 (not c!139080)) b!1496890))

(assert (= (and d!157661 c!139081) b!1496889))

(assert (= (and d!157661 (not c!139081)) b!1496896))

(assert (= (and b!1496896 res!1017813) b!1496891))

(assert (= (and b!1496891 (not res!1017814)) b!1496895))

(assert (= (and b!1496895 (not res!1017815)) b!1496888))

(declare-fun m!1380481 () Bool)

(assert (=> b!1496888 m!1380481))

(declare-fun m!1380483 () Bool)

(assert (=> b!1496890 m!1380483))

(assert (=> b!1496890 m!1380483))

(declare-fun m!1380485 () Bool)

(assert (=> b!1496890 m!1380485))

(assert (=> b!1496891 m!1380481))

(declare-fun m!1380487 () Bool)

(assert (=> d!157661 m!1380487))

(assert (=> d!157661 m!1380333))

(assert (=> b!1496895 m!1380481))

(assert (=> b!1496722 d!157661))

(declare-fun d!157663 () Bool)

(declare-fun lt!652273 () (_ BitVec 32))

(assert (=> d!157663 (and (bvsge lt!652273 #b00000000000000000000000000000000) (bvslt lt!652273 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157663 (= lt!652273 (choose!52 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> d!157663 (validMask!0 mask!2687)))

(assert (=> d!157663 (= (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!652273)))

(declare-fun bs!42916 () Bool)

(assert (= bs!42916 d!157663))

(declare-fun m!1380489 () Bool)

(assert (=> bs!42916 m!1380489))

(assert (=> bs!42916 m!1380333))

(assert (=> b!1496732 d!157663))

(declare-fun b!1496905 () Bool)

(declare-fun e!838547 () Bool)

(declare-fun call!68094 () Bool)

(assert (=> b!1496905 (= e!838547 call!68094)))

(declare-fun b!1496906 () Bool)

(declare-fun e!838548 () Bool)

(declare-fun e!838546 () Bool)

(assert (=> b!1496906 (= e!838548 e!838546)))

(declare-fun c!139084 () Bool)

(assert (=> b!1496906 (= c!139084 (validKeyInArray!0 (select (arr!48211 a!2862) j!93)))))

(declare-fun d!157665 () Bool)

(declare-fun res!1017821 () Bool)

(assert (=> d!157665 (=> res!1017821 e!838548)))

(assert (=> d!157665 (= res!1017821 (bvsge j!93 (size!48762 a!2862)))))

(assert (=> d!157665 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!838548)))

(declare-fun bm!68091 () Bool)

(assert (=> bm!68091 (= call!68094 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1496907 () Bool)

(assert (=> b!1496907 (= e!838546 e!838547)))

(declare-fun lt!652280 () (_ BitVec 64))

(assert (=> b!1496907 (= lt!652280 (select (arr!48211 a!2862) j!93))))

(declare-fun lt!652282 () Unit!50069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99898 (_ BitVec 64) (_ BitVec 32)) Unit!50069)

(assert (=> b!1496907 (= lt!652282 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!652280 j!93))))

(declare-fun arrayContainsKey!0 (array!99898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1496907 (arrayContainsKey!0 a!2862 lt!652280 #b00000000000000000000000000000000)))

(declare-fun lt!652281 () Unit!50069)

(assert (=> b!1496907 (= lt!652281 lt!652282)))

(declare-fun res!1017820 () Bool)

(assert (=> b!1496907 (= res!1017820 (= (seekEntryOrOpen!0 (select (arr!48211 a!2862) j!93) a!2862 mask!2687) (Found!12348 j!93)))))

(assert (=> b!1496907 (=> (not res!1017820) (not e!838547))))

(declare-fun b!1496908 () Bool)

(assert (=> b!1496908 (= e!838546 call!68094)))

(assert (= (and d!157665 (not res!1017821)) b!1496906))

(assert (= (and b!1496906 c!139084) b!1496907))

(assert (= (and b!1496906 (not c!139084)) b!1496908))

(assert (= (and b!1496907 res!1017820) b!1496905))

(assert (= (or b!1496905 b!1496908) bm!68091))

(assert (=> b!1496906 m!1380309))

(assert (=> b!1496906 m!1380309))

(assert (=> b!1496906 m!1380317))

(declare-fun m!1380491 () Bool)

(assert (=> bm!68091 m!1380491))

(assert (=> b!1496907 m!1380309))

(declare-fun m!1380493 () Bool)

(assert (=> b!1496907 m!1380493))

(declare-fun m!1380495 () Bool)

(assert (=> b!1496907 m!1380495))

(assert (=> b!1496907 m!1380309))

(assert (=> b!1496907 m!1380363))

(assert (=> b!1496731 d!157665))

(declare-fun d!157667 () Bool)

(assert (=> d!157667 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652285 () Unit!50069)

(declare-fun choose!38 (array!99898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50069)

(assert (=> d!157667 (= lt!652285 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157667 (validMask!0 mask!2687)))

(assert (=> d!157667 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!652285)))

(declare-fun bs!42917 () Bool)

(assert (= bs!42917 d!157667))

(assert (=> bs!42917 m!1380359))

(declare-fun m!1380497 () Bool)

(assert (=> bs!42917 m!1380497))

(assert (=> bs!42917 m!1380333))

(assert (=> b!1496731 d!157667))

(declare-fun b!1496921 () Bool)

(declare-fun e!838555 () SeekEntryResult!12348)

(assert (=> b!1496921 (= e!838555 Undefined!12348)))

(declare-fun b!1496922 () Bool)

(declare-fun e!838556 () SeekEntryResult!12348)

(assert (=> b!1496922 (= e!838556 (Found!12348 index!646))))

(declare-fun b!1496923 () Bool)

(declare-fun e!838557 () SeekEntryResult!12348)

(assert (=> b!1496923 (= e!838557 (MissingVacant!12348 intermediateAfterIndex!19))))

(declare-fun d!157669 () Bool)

(declare-fun lt!652291 () SeekEntryResult!12348)

(assert (=> d!157669 (and (or ((_ is Undefined!12348) lt!652291) (not ((_ is Found!12348) lt!652291)) (and (bvsge (index!51785 lt!652291) #b00000000000000000000000000000000) (bvslt (index!51785 lt!652291) (size!48762 lt!652225)))) (or ((_ is Undefined!12348) lt!652291) ((_ is Found!12348) lt!652291) (not ((_ is MissingVacant!12348) lt!652291)) (not (= (index!51787 lt!652291) intermediateAfterIndex!19)) (and (bvsge (index!51787 lt!652291) #b00000000000000000000000000000000) (bvslt (index!51787 lt!652291) (size!48762 lt!652225)))) (or ((_ is Undefined!12348) lt!652291) (ite ((_ is Found!12348) lt!652291) (= (select (arr!48211 lt!652225) (index!51785 lt!652291)) lt!652224) (and ((_ is MissingVacant!12348) lt!652291) (= (index!51787 lt!652291) intermediateAfterIndex!19) (= (select (arr!48211 lt!652225) (index!51787 lt!652291)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157669 (= lt!652291 e!838555)))

(declare-fun c!139092 () Bool)

(assert (=> d!157669 (= c!139092 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!652290 () (_ BitVec 64))

(assert (=> d!157669 (= lt!652290 (select (arr!48211 lt!652225) index!646))))

(assert (=> d!157669 (validMask!0 mask!2687)))

(assert (=> d!157669 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652224 lt!652225 mask!2687) lt!652291)))

(declare-fun b!1496924 () Bool)

(assert (=> b!1496924 (= e!838555 e!838556)))

(declare-fun c!139093 () Bool)

(assert (=> b!1496924 (= c!139093 (= lt!652290 lt!652224))))

(declare-fun b!1496925 () Bool)

(assert (=> b!1496925 (= e!838557 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!652224 lt!652225 mask!2687))))

(declare-fun b!1496926 () Bool)

(declare-fun c!139091 () Bool)

(assert (=> b!1496926 (= c!139091 (= lt!652290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496926 (= e!838556 e!838557)))

(assert (= (and d!157669 c!139092) b!1496921))

(assert (= (and d!157669 (not c!139092)) b!1496924))

(assert (= (and b!1496924 c!139093) b!1496922))

(assert (= (and b!1496924 (not c!139093)) b!1496926))

(assert (= (and b!1496926 c!139091) b!1496923))

(assert (= (and b!1496926 (not c!139091)) b!1496925))

(declare-fun m!1380499 () Bool)

(assert (=> d!157669 m!1380499))

(declare-fun m!1380501 () Bool)

(assert (=> d!157669 m!1380501))

(declare-fun m!1380503 () Bool)

(assert (=> d!157669 m!1380503))

(assert (=> d!157669 m!1380333))

(declare-fun m!1380505 () Bool)

(assert (=> b!1496925 m!1380505))

(assert (=> b!1496925 m!1380505))

(declare-fun m!1380507 () Bool)

(assert (=> b!1496925 m!1380507))

(assert (=> b!1496719 d!157669))

(declare-fun b!1496939 () Bool)

(declare-fun c!139100 () Bool)

(declare-fun lt!652298 () (_ BitVec 64))

(assert (=> b!1496939 (= c!139100 (= lt!652298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838564 () SeekEntryResult!12348)

(declare-fun e!838565 () SeekEntryResult!12348)

(assert (=> b!1496939 (= e!838564 e!838565)))

(declare-fun b!1496940 () Bool)

(declare-fun e!838566 () SeekEntryResult!12348)

(assert (=> b!1496940 (= e!838566 e!838564)))

(declare-fun lt!652299 () SeekEntryResult!12348)

(assert (=> b!1496940 (= lt!652298 (select (arr!48211 lt!652225) (index!51786 lt!652299)))))

(declare-fun c!139102 () Bool)

(assert (=> b!1496940 (= c!139102 (= lt!652298 lt!652224))))

(declare-fun b!1496941 () Bool)

(assert (=> b!1496941 (= e!838565 (MissingZero!12348 (index!51786 lt!652299)))))

(declare-fun d!157671 () Bool)

(declare-fun lt!652300 () SeekEntryResult!12348)

(assert (=> d!157671 (and (or ((_ is Undefined!12348) lt!652300) (not ((_ is Found!12348) lt!652300)) (and (bvsge (index!51785 lt!652300) #b00000000000000000000000000000000) (bvslt (index!51785 lt!652300) (size!48762 lt!652225)))) (or ((_ is Undefined!12348) lt!652300) ((_ is Found!12348) lt!652300) (not ((_ is MissingZero!12348) lt!652300)) (and (bvsge (index!51784 lt!652300) #b00000000000000000000000000000000) (bvslt (index!51784 lt!652300) (size!48762 lt!652225)))) (or ((_ is Undefined!12348) lt!652300) ((_ is Found!12348) lt!652300) ((_ is MissingZero!12348) lt!652300) (not ((_ is MissingVacant!12348) lt!652300)) (and (bvsge (index!51787 lt!652300) #b00000000000000000000000000000000) (bvslt (index!51787 lt!652300) (size!48762 lt!652225)))) (or ((_ is Undefined!12348) lt!652300) (ite ((_ is Found!12348) lt!652300) (= (select (arr!48211 lt!652225) (index!51785 lt!652300)) lt!652224) (ite ((_ is MissingZero!12348) lt!652300) (= (select (arr!48211 lt!652225) (index!51784 lt!652300)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12348) lt!652300) (= (select (arr!48211 lt!652225) (index!51787 lt!652300)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157671 (= lt!652300 e!838566)))

(declare-fun c!139101 () Bool)

(assert (=> d!157671 (= c!139101 (and ((_ is Intermediate!12348) lt!652299) (undefined!13160 lt!652299)))))

(assert (=> d!157671 (= lt!652299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652224 mask!2687) lt!652224 lt!652225 mask!2687))))

(assert (=> d!157671 (validMask!0 mask!2687)))

(assert (=> d!157671 (= (seekEntryOrOpen!0 lt!652224 lt!652225 mask!2687) lt!652300)))

(declare-fun b!1496942 () Bool)

(assert (=> b!1496942 (= e!838564 (Found!12348 (index!51786 lt!652299)))))

(declare-fun b!1496943 () Bool)

(assert (=> b!1496943 (= e!838566 Undefined!12348)))

(declare-fun b!1496944 () Bool)

(assert (=> b!1496944 (= e!838565 (seekKeyOrZeroReturnVacant!0 (x!133577 lt!652299) (index!51786 lt!652299) (index!51786 lt!652299) lt!652224 lt!652225 mask!2687))))

(assert (= (and d!157671 c!139101) b!1496943))

(assert (= (and d!157671 (not c!139101)) b!1496940))

(assert (= (and b!1496940 c!139102) b!1496942))

(assert (= (and b!1496940 (not c!139102)) b!1496939))

(assert (= (and b!1496939 c!139100) b!1496941))

(assert (= (and b!1496939 (not c!139100)) b!1496944))

(declare-fun m!1380509 () Bool)

(assert (=> b!1496940 m!1380509))

(assert (=> d!157671 m!1380345))

(assert (=> d!157671 m!1380347))

(declare-fun m!1380511 () Bool)

(assert (=> d!157671 m!1380511))

(declare-fun m!1380513 () Bool)

(assert (=> d!157671 m!1380513))

(assert (=> d!157671 m!1380333))

(assert (=> d!157671 m!1380345))

(declare-fun m!1380515 () Bool)

(assert (=> d!157671 m!1380515))

(declare-fun m!1380517 () Bool)

(assert (=> b!1496944 m!1380517))

(assert (=> b!1496719 d!157671))

(declare-fun d!157675 () Bool)

(assert (=> d!157675 (= (validKeyInArray!0 (select (arr!48211 a!2862) j!93)) (and (not (= (select (arr!48211 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48211 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1496730 d!157675))

(declare-fun b!1496945 () Bool)

(declare-fun e!838568 () Bool)

(declare-fun call!68095 () Bool)

(assert (=> b!1496945 (= e!838568 call!68095)))

(declare-fun b!1496946 () Bool)

(declare-fun e!838569 () Bool)

(declare-fun e!838567 () Bool)

(assert (=> b!1496946 (= e!838569 e!838567)))

(declare-fun c!139103 () Bool)

(assert (=> b!1496946 (= c!139103 (validKeyInArray!0 (select (arr!48211 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!157677 () Bool)

(declare-fun res!1017823 () Bool)

(assert (=> d!157677 (=> res!1017823 e!838569)))

(assert (=> d!157677 (= res!1017823 (bvsge #b00000000000000000000000000000000 (size!48762 a!2862)))))

(assert (=> d!157677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!838569)))

(declare-fun bm!68092 () Bool)

(assert (=> bm!68092 (= call!68095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1496947 () Bool)

(assert (=> b!1496947 (= e!838567 e!838568)))

(declare-fun lt!652301 () (_ BitVec 64))

(assert (=> b!1496947 (= lt!652301 (select (arr!48211 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!652303 () Unit!50069)

(assert (=> b!1496947 (= lt!652303 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!652301 #b00000000000000000000000000000000))))

(assert (=> b!1496947 (arrayContainsKey!0 a!2862 lt!652301 #b00000000000000000000000000000000)))

(declare-fun lt!652302 () Unit!50069)

(assert (=> b!1496947 (= lt!652302 lt!652303)))

(declare-fun res!1017822 () Bool)

(assert (=> b!1496947 (= res!1017822 (= (seekEntryOrOpen!0 (select (arr!48211 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12348 #b00000000000000000000000000000000)))))

(assert (=> b!1496947 (=> (not res!1017822) (not e!838568))))

(declare-fun b!1496948 () Bool)

(assert (=> b!1496948 (= e!838567 call!68095)))

(assert (= (and d!157677 (not res!1017823)) b!1496946))

(assert (= (and b!1496946 c!139103) b!1496947))

(assert (= (and b!1496946 (not c!139103)) b!1496948))

(assert (= (and b!1496947 res!1017822) b!1496945))

(assert (= (or b!1496945 b!1496948) bm!68092))

(declare-fun m!1380519 () Bool)

(assert (=> b!1496946 m!1380519))

(assert (=> b!1496946 m!1380519))

(declare-fun m!1380521 () Bool)

(assert (=> b!1496946 m!1380521))

(declare-fun m!1380523 () Bool)

(assert (=> bm!68092 m!1380523))

(assert (=> b!1496947 m!1380519))

(declare-fun m!1380525 () Bool)

(assert (=> b!1496947 m!1380525))

(declare-fun m!1380527 () Bool)

(assert (=> b!1496947 m!1380527))

(assert (=> b!1496947 m!1380519))

(declare-fun m!1380529 () Bool)

(assert (=> b!1496947 m!1380529))

(assert (=> b!1496718 d!157677))

(declare-fun d!157679 () Bool)

(assert (=> d!157679 (= (validKeyInArray!0 (select (arr!48211 a!2862) i!1006)) (and (not (= (select (arr!48211 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48211 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1496717 d!157679))

(declare-fun d!157681 () Bool)

(declare-fun e!838574 () Bool)

(assert (=> d!157681 e!838574))

(declare-fun c!139106 () Bool)

(declare-fun lt!652305 () SeekEntryResult!12348)

(assert (=> d!157681 (= c!139106 (and ((_ is Intermediate!12348) lt!652305) (undefined!13160 lt!652305)))))

(declare-fun e!838572 () SeekEntryResult!12348)

(assert (=> d!157681 (= lt!652305 e!838572)))

(declare-fun c!139104 () Bool)

(assert (=> d!157681 (= c!139104 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!652304 () (_ BitVec 64))

(assert (=> d!157681 (= lt!652304 (select (arr!48211 lt!652225) (toIndex!0 lt!652224 mask!2687)))))

(assert (=> d!157681 (validMask!0 mask!2687)))

(assert (=> d!157681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652224 mask!2687) lt!652224 lt!652225 mask!2687) lt!652305)))

(declare-fun b!1496949 () Bool)

(assert (=> b!1496949 (and (bvsge (index!51786 lt!652305) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652305) (size!48762 lt!652225)))))

(declare-fun e!838571 () Bool)

(assert (=> b!1496949 (= e!838571 (= (select (arr!48211 lt!652225) (index!51786 lt!652305)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496950 () Bool)

(assert (=> b!1496950 (= e!838574 (bvsge (x!133577 lt!652305) #b01111111111111111111111111111110))))

(declare-fun b!1496951 () Bool)

(declare-fun e!838570 () SeekEntryResult!12348)

(assert (=> b!1496951 (= e!838570 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!652224 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!652224 lt!652225 mask!2687))))

(declare-fun b!1496952 () Bool)

(assert (=> b!1496952 (and (bvsge (index!51786 lt!652305) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652305) (size!48762 lt!652225)))))

(declare-fun res!1017825 () Bool)

(assert (=> b!1496952 (= res!1017825 (= (select (arr!48211 lt!652225) (index!51786 lt!652305)) lt!652224))))

(assert (=> b!1496952 (=> res!1017825 e!838571)))

(declare-fun e!838573 () Bool)

(assert (=> b!1496952 (= e!838573 e!838571)))

(declare-fun b!1496953 () Bool)

(assert (=> b!1496953 (= e!838570 (Intermediate!12348 false (toIndex!0 lt!652224 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1496954 () Bool)

(assert (=> b!1496954 (= e!838572 e!838570)))

(declare-fun c!139105 () Bool)

(assert (=> b!1496954 (= c!139105 (or (= lt!652304 lt!652224) (= (bvadd lt!652304 lt!652304) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496955 () Bool)

(assert (=> b!1496955 (= e!838572 (Intermediate!12348 true (toIndex!0 lt!652224 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1496956 () Bool)

(assert (=> b!1496956 (and (bvsge (index!51786 lt!652305) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652305) (size!48762 lt!652225)))))

(declare-fun res!1017826 () Bool)

(assert (=> b!1496956 (= res!1017826 (= (select (arr!48211 lt!652225) (index!51786 lt!652305)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496956 (=> res!1017826 e!838571)))

(declare-fun b!1496957 () Bool)

(assert (=> b!1496957 (= e!838574 e!838573)))

(declare-fun res!1017824 () Bool)

(assert (=> b!1496957 (= res!1017824 (and ((_ is Intermediate!12348) lt!652305) (not (undefined!13160 lt!652305)) (bvslt (x!133577 lt!652305) #b01111111111111111111111111111110) (bvsge (x!133577 lt!652305) #b00000000000000000000000000000000) (bvsge (x!133577 lt!652305) #b00000000000000000000000000000000)))))

(assert (=> b!1496957 (=> (not res!1017824) (not e!838573))))

(assert (= (and d!157681 c!139104) b!1496955))

(assert (= (and d!157681 (not c!139104)) b!1496954))

(assert (= (and b!1496954 c!139105) b!1496953))

(assert (= (and b!1496954 (not c!139105)) b!1496951))

(assert (= (and d!157681 c!139106) b!1496950))

(assert (= (and d!157681 (not c!139106)) b!1496957))

(assert (= (and b!1496957 res!1017824) b!1496952))

(assert (= (and b!1496952 (not res!1017825)) b!1496956))

(assert (= (and b!1496956 (not res!1017826)) b!1496949))

(declare-fun m!1380531 () Bool)

(assert (=> b!1496949 m!1380531))

(assert (=> b!1496951 m!1380345))

(declare-fun m!1380533 () Bool)

(assert (=> b!1496951 m!1380533))

(assert (=> b!1496951 m!1380533))

(declare-fun m!1380535 () Bool)

(assert (=> b!1496951 m!1380535))

(assert (=> b!1496952 m!1380531))

(assert (=> d!157681 m!1380345))

(declare-fun m!1380537 () Bool)

(assert (=> d!157681 m!1380537))

(assert (=> d!157681 m!1380333))

(assert (=> b!1496956 m!1380531))

(assert (=> b!1496728 d!157681))

(declare-fun d!157683 () Bool)

(declare-fun lt!652311 () (_ BitVec 32))

(declare-fun lt!652310 () (_ BitVec 32))

(assert (=> d!157683 (= lt!652311 (bvmul (bvxor lt!652310 (bvlshr lt!652310 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157683 (= lt!652310 ((_ extract 31 0) (bvand (bvxor lt!652224 (bvlshr lt!652224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157683 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017827 (let ((h!36104 ((_ extract 31 0) (bvand (bvxor lt!652224 (bvlshr lt!652224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133583 (bvmul (bvxor h!36104 (bvlshr h!36104 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133583 (bvlshr x!133583 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017827 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017827 #b00000000000000000000000000000000))))))

(assert (=> d!157683 (= (toIndex!0 lt!652224 mask!2687) (bvand (bvxor lt!652311 (bvlshr lt!652311 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1496728 d!157683))

(declare-fun b!1496958 () Bool)

(declare-fun e!838575 () SeekEntryResult!12348)

(assert (=> b!1496958 (= e!838575 Undefined!12348)))

(declare-fun b!1496959 () Bool)

(declare-fun e!838576 () SeekEntryResult!12348)

(assert (=> b!1496959 (= e!838576 (Found!12348 lt!652228))))

(declare-fun b!1496960 () Bool)

(declare-fun e!838577 () SeekEntryResult!12348)

(assert (=> b!1496960 (= e!838577 (MissingVacant!12348 intermediateAfterIndex!19))))

(declare-fun lt!652313 () SeekEntryResult!12348)

(declare-fun d!157685 () Bool)

(assert (=> d!157685 (and (or ((_ is Undefined!12348) lt!652313) (not ((_ is Found!12348) lt!652313)) (and (bvsge (index!51785 lt!652313) #b00000000000000000000000000000000) (bvslt (index!51785 lt!652313) (size!48762 lt!652225)))) (or ((_ is Undefined!12348) lt!652313) ((_ is Found!12348) lt!652313) (not ((_ is MissingVacant!12348) lt!652313)) (not (= (index!51787 lt!652313) intermediateAfterIndex!19)) (and (bvsge (index!51787 lt!652313) #b00000000000000000000000000000000) (bvslt (index!51787 lt!652313) (size!48762 lt!652225)))) (or ((_ is Undefined!12348) lt!652313) (ite ((_ is Found!12348) lt!652313) (= (select (arr!48211 lt!652225) (index!51785 lt!652313)) lt!652224) (and ((_ is MissingVacant!12348) lt!652313) (= (index!51787 lt!652313) intermediateAfterIndex!19) (= (select (arr!48211 lt!652225) (index!51787 lt!652313)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157685 (= lt!652313 e!838575)))

(declare-fun c!139108 () Bool)

(assert (=> d!157685 (= c!139108 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!652312 () (_ BitVec 64))

(assert (=> d!157685 (= lt!652312 (select (arr!48211 lt!652225) lt!652228))))

(assert (=> d!157685 (validMask!0 mask!2687)))

(assert (=> d!157685 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652228 intermediateAfterIndex!19 lt!652224 lt!652225 mask!2687) lt!652313)))

(declare-fun b!1496961 () Bool)

(assert (=> b!1496961 (= e!838575 e!838576)))

(declare-fun c!139109 () Bool)

(assert (=> b!1496961 (= c!139109 (= lt!652312 lt!652224))))

(declare-fun b!1496962 () Bool)

(assert (=> b!1496962 (= e!838577 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!652228 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!652224 lt!652225 mask!2687))))

(declare-fun b!1496963 () Bool)

(declare-fun c!139107 () Bool)

(assert (=> b!1496963 (= c!139107 (= lt!652312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496963 (= e!838576 e!838577)))

(assert (= (and d!157685 c!139108) b!1496958))

(assert (= (and d!157685 (not c!139108)) b!1496961))

(assert (= (and b!1496961 c!139109) b!1496959))

(assert (= (and b!1496961 (not c!139109)) b!1496963))

(assert (= (and b!1496963 c!139107) b!1496960))

(assert (= (and b!1496963 (not c!139107)) b!1496962))

(declare-fun m!1380539 () Bool)

(assert (=> d!157685 m!1380539))

(declare-fun m!1380541 () Bool)

(assert (=> d!157685 m!1380541))

(assert (=> d!157685 m!1380487))

(assert (=> d!157685 m!1380333))

(assert (=> b!1496962 m!1380483))

(assert (=> b!1496962 m!1380483))

(declare-fun m!1380543 () Bool)

(assert (=> b!1496962 m!1380543))

(assert (=> b!1496727 d!157685))

(assert (=> b!1496727 d!157671))

(declare-fun d!157687 () Bool)

(declare-fun e!838582 () Bool)

(assert (=> d!157687 e!838582))

(declare-fun c!139112 () Bool)

(declare-fun lt!652315 () SeekEntryResult!12348)

(assert (=> d!157687 (= c!139112 (and ((_ is Intermediate!12348) lt!652315) (undefined!13160 lt!652315)))))

(declare-fun e!838580 () SeekEntryResult!12348)

(assert (=> d!157687 (= lt!652315 e!838580)))

(declare-fun c!139110 () Bool)

(assert (=> d!157687 (= c!139110 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!652314 () (_ BitVec 64))

(assert (=> d!157687 (= lt!652314 (select (arr!48211 a!2862) lt!652228))))

(assert (=> d!157687 (validMask!0 mask!2687)))

(assert (=> d!157687 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652228 (select (arr!48211 a!2862) j!93) a!2862 mask!2687) lt!652315)))

(declare-fun b!1496964 () Bool)

(assert (=> b!1496964 (and (bvsge (index!51786 lt!652315) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652315) (size!48762 a!2862)))))

(declare-fun e!838579 () Bool)

(assert (=> b!1496964 (= e!838579 (= (select (arr!48211 a!2862) (index!51786 lt!652315)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496965 () Bool)

(assert (=> b!1496965 (= e!838582 (bvsge (x!133577 lt!652315) #b01111111111111111111111111111110))))

(declare-fun e!838578 () SeekEntryResult!12348)

(declare-fun b!1496966 () Bool)

(assert (=> b!1496966 (= e!838578 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!652228 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48211 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1496967 () Bool)

(assert (=> b!1496967 (and (bvsge (index!51786 lt!652315) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652315) (size!48762 a!2862)))))

(declare-fun res!1017829 () Bool)

(assert (=> b!1496967 (= res!1017829 (= (select (arr!48211 a!2862) (index!51786 lt!652315)) (select (arr!48211 a!2862) j!93)))))

(assert (=> b!1496967 (=> res!1017829 e!838579)))

(declare-fun e!838581 () Bool)

(assert (=> b!1496967 (= e!838581 e!838579)))

(declare-fun b!1496968 () Bool)

(assert (=> b!1496968 (= e!838578 (Intermediate!12348 false lt!652228 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1496969 () Bool)

(assert (=> b!1496969 (= e!838580 e!838578)))

(declare-fun c!139111 () Bool)

(assert (=> b!1496969 (= c!139111 (or (= lt!652314 (select (arr!48211 a!2862) j!93)) (= (bvadd lt!652314 lt!652314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496970 () Bool)

(assert (=> b!1496970 (= e!838580 (Intermediate!12348 true lt!652228 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1496971 () Bool)

(assert (=> b!1496971 (and (bvsge (index!51786 lt!652315) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652315) (size!48762 a!2862)))))

(declare-fun res!1017830 () Bool)

(assert (=> b!1496971 (= res!1017830 (= (select (arr!48211 a!2862) (index!51786 lt!652315)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496971 (=> res!1017830 e!838579)))

(declare-fun b!1496972 () Bool)

(assert (=> b!1496972 (= e!838582 e!838581)))

(declare-fun res!1017828 () Bool)

(assert (=> b!1496972 (= res!1017828 (and ((_ is Intermediate!12348) lt!652315) (not (undefined!13160 lt!652315)) (bvslt (x!133577 lt!652315) #b01111111111111111111111111111110) (bvsge (x!133577 lt!652315) #b00000000000000000000000000000000) (bvsge (x!133577 lt!652315) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1496972 (=> (not res!1017828) (not e!838581))))

(assert (= (and d!157687 c!139110) b!1496970))

(assert (= (and d!157687 (not c!139110)) b!1496969))

(assert (= (and b!1496969 c!139111) b!1496968))

(assert (= (and b!1496969 (not c!139111)) b!1496966))

(assert (= (and d!157687 c!139112) b!1496965))

(assert (= (and d!157687 (not c!139112)) b!1496972))

(assert (= (and b!1496972 res!1017828) b!1496967))

(assert (= (and b!1496967 (not res!1017829)) b!1496971))

(assert (= (and b!1496971 (not res!1017830)) b!1496964))

(declare-fun m!1380545 () Bool)

(assert (=> b!1496964 m!1380545))

(assert (=> b!1496966 m!1380483))

(assert (=> b!1496966 m!1380483))

(assert (=> b!1496966 m!1380309))

(declare-fun m!1380547 () Bool)

(assert (=> b!1496966 m!1380547))

(assert (=> b!1496967 m!1380545))

(declare-fun m!1380549 () Bool)

(assert (=> d!157687 m!1380549))

(assert (=> d!157687 m!1380333))

(assert (=> b!1496971 m!1380545))

(assert (=> b!1496716 d!157687))

(declare-fun b!1496981 () Bool)

(declare-fun c!139117 () Bool)

(declare-fun lt!652320 () (_ BitVec 64))

(assert (=> b!1496981 (= c!139117 (= lt!652320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838587 () SeekEntryResult!12348)

(declare-fun e!838588 () SeekEntryResult!12348)

(assert (=> b!1496981 (= e!838587 e!838588)))

(declare-fun b!1496982 () Bool)

(declare-fun e!838589 () SeekEntryResult!12348)

(assert (=> b!1496982 (= e!838589 e!838587)))

(declare-fun lt!652321 () SeekEntryResult!12348)

(assert (=> b!1496982 (= lt!652320 (select (arr!48211 a!2862) (index!51786 lt!652321)))))

(declare-fun c!139119 () Bool)

(assert (=> b!1496982 (= c!139119 (= lt!652320 (select (arr!48211 a!2862) j!93)))))

(declare-fun b!1496983 () Bool)

(assert (=> b!1496983 (= e!838588 (MissingZero!12348 (index!51786 lt!652321)))))

(declare-fun d!157689 () Bool)

(declare-fun lt!652322 () SeekEntryResult!12348)

(assert (=> d!157689 (and (or ((_ is Undefined!12348) lt!652322) (not ((_ is Found!12348) lt!652322)) (and (bvsge (index!51785 lt!652322) #b00000000000000000000000000000000) (bvslt (index!51785 lt!652322) (size!48762 a!2862)))) (or ((_ is Undefined!12348) lt!652322) ((_ is Found!12348) lt!652322) (not ((_ is MissingZero!12348) lt!652322)) (and (bvsge (index!51784 lt!652322) #b00000000000000000000000000000000) (bvslt (index!51784 lt!652322) (size!48762 a!2862)))) (or ((_ is Undefined!12348) lt!652322) ((_ is Found!12348) lt!652322) ((_ is MissingZero!12348) lt!652322) (not ((_ is MissingVacant!12348) lt!652322)) (and (bvsge (index!51787 lt!652322) #b00000000000000000000000000000000) (bvslt (index!51787 lt!652322) (size!48762 a!2862)))) (or ((_ is Undefined!12348) lt!652322) (ite ((_ is Found!12348) lt!652322) (= (select (arr!48211 a!2862) (index!51785 lt!652322)) (select (arr!48211 a!2862) j!93)) (ite ((_ is MissingZero!12348) lt!652322) (= (select (arr!48211 a!2862) (index!51784 lt!652322)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12348) lt!652322) (= (select (arr!48211 a!2862) (index!51787 lt!652322)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157689 (= lt!652322 e!838589)))

(declare-fun c!139118 () Bool)

(assert (=> d!157689 (= c!139118 (and ((_ is Intermediate!12348) lt!652321) (undefined!13160 lt!652321)))))

(assert (=> d!157689 (= lt!652321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687) (select (arr!48211 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157689 (validMask!0 mask!2687)))

(assert (=> d!157689 (= (seekEntryOrOpen!0 (select (arr!48211 a!2862) j!93) a!2862 mask!2687) lt!652322)))

(declare-fun b!1496984 () Bool)

(assert (=> b!1496984 (= e!838587 (Found!12348 (index!51786 lt!652321)))))

(declare-fun b!1496985 () Bool)

(assert (=> b!1496985 (= e!838589 Undefined!12348)))

(declare-fun b!1496986 () Bool)

(assert (=> b!1496986 (= e!838588 (seekKeyOrZeroReturnVacant!0 (x!133577 lt!652321) (index!51786 lt!652321) (index!51786 lt!652321) (select (arr!48211 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!157689 c!139118) b!1496985))

(assert (= (and d!157689 (not c!139118)) b!1496982))

(assert (= (and b!1496982 c!139119) b!1496984))

(assert (= (and b!1496982 (not c!139119)) b!1496981))

(assert (= (and b!1496981 c!139117) b!1496983))

(assert (= (and b!1496981 (not c!139117)) b!1496986))

(declare-fun m!1380551 () Bool)

(assert (=> b!1496982 m!1380551))

(assert (=> d!157689 m!1380337))

(assert (=> d!157689 m!1380309))

(assert (=> d!157689 m!1380339))

(declare-fun m!1380553 () Bool)

(assert (=> d!157689 m!1380553))

(declare-fun m!1380555 () Bool)

(assert (=> d!157689 m!1380555))

(assert (=> d!157689 m!1380333))

(assert (=> d!157689 m!1380309))

(assert (=> d!157689 m!1380337))

(declare-fun m!1380557 () Bool)

(assert (=> d!157689 m!1380557))

(assert (=> b!1496986 m!1380309))

(declare-fun m!1380559 () Bool)

(assert (=> b!1496986 m!1380559))

(assert (=> b!1496726 d!157689))

(declare-fun b!1497025 () Bool)

(declare-fun e!838617 () Bool)

(declare-fun e!838616 () Bool)

(assert (=> b!1497025 (= e!838617 e!838616)))

(declare-fun res!1017849 () Bool)

(assert (=> b!1497025 (=> (not res!1017849) (not e!838616))))

(declare-fun e!838615 () Bool)

(assert (=> b!1497025 (= res!1017849 (not e!838615))))

(declare-fun res!1017851 () Bool)

(assert (=> b!1497025 (=> (not res!1017851) (not e!838615))))

(assert (=> b!1497025 (= res!1017851 (validKeyInArray!0 (select (arr!48211 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1497026 () Bool)

(declare-fun e!838614 () Bool)

(declare-fun call!68098 () Bool)

(assert (=> b!1497026 (= e!838614 call!68098)))

(declare-fun d!157691 () Bool)

(declare-fun res!1017850 () Bool)

(assert (=> d!157691 (=> res!1017850 e!838617)))

(assert (=> d!157691 (= res!1017850 (bvsge #b00000000000000000000000000000000 (size!48762 a!2862)))))

(assert (=> d!157691 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34696) e!838617)))

(declare-fun b!1497027 () Bool)

(assert (=> b!1497027 (= e!838614 call!68098)))

(declare-fun b!1497028 () Bool)

(declare-fun contains!9980 (List!34699 (_ BitVec 64)) Bool)

(assert (=> b!1497028 (= e!838615 (contains!9980 Nil!34696 (select (arr!48211 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!68095 () Bool)

(declare-fun c!139130 () Bool)

(assert (=> bm!68095 (= call!68098 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139130 (Cons!34695 (select (arr!48211 a!2862) #b00000000000000000000000000000000) Nil!34696) Nil!34696)))))

(declare-fun b!1497029 () Bool)

(assert (=> b!1497029 (= e!838616 e!838614)))

(assert (=> b!1497029 (= c!139130 (validKeyInArray!0 (select (arr!48211 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157691 (not res!1017850)) b!1497025))

(assert (= (and b!1497025 res!1017851) b!1497028))

(assert (= (and b!1497025 res!1017849) b!1497029))

(assert (= (and b!1497029 c!139130) b!1497027))

(assert (= (and b!1497029 (not c!139130)) b!1497026))

(assert (= (or b!1497027 b!1497026) bm!68095))

(assert (=> b!1497025 m!1380519))

(assert (=> b!1497025 m!1380519))

(assert (=> b!1497025 m!1380521))

(assert (=> b!1497028 m!1380519))

(assert (=> b!1497028 m!1380519))

(declare-fun m!1380577 () Bool)

(assert (=> b!1497028 m!1380577))

(assert (=> bm!68095 m!1380519))

(declare-fun m!1380579 () Bool)

(assert (=> bm!68095 m!1380579))

(assert (=> b!1497029 m!1380519))

(assert (=> b!1497029 m!1380519))

(assert (=> b!1497029 m!1380521))

(assert (=> b!1496725 d!157691))

(declare-fun d!157701 () Bool)

(declare-fun e!838630 () Bool)

(assert (=> d!157701 e!838630))

(declare-fun c!139135 () Bool)

(declare-fun lt!652328 () SeekEntryResult!12348)

(assert (=> d!157701 (= c!139135 (and ((_ is Intermediate!12348) lt!652328) (undefined!13160 lt!652328)))))

(declare-fun e!838628 () SeekEntryResult!12348)

(assert (=> d!157701 (= lt!652328 e!838628)))

(declare-fun c!139133 () Bool)

(assert (=> d!157701 (= c!139133 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!652327 () (_ BitVec 64))

(assert (=> d!157701 (= lt!652327 (select (arr!48211 lt!652225) index!646))))

(assert (=> d!157701 (validMask!0 mask!2687)))

(assert (=> d!157701 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652224 lt!652225 mask!2687) lt!652328)))

(declare-fun b!1497040 () Bool)

(assert (=> b!1497040 (and (bvsge (index!51786 lt!652328) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652328) (size!48762 lt!652225)))))

(declare-fun e!838627 () Bool)

(assert (=> b!1497040 (= e!838627 (= (select (arr!48211 lt!652225) (index!51786 lt!652328)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497041 () Bool)

(assert (=> b!1497041 (= e!838630 (bvsge (x!133577 lt!652328) #b01111111111111111111111111111110))))

(declare-fun e!838626 () SeekEntryResult!12348)

(declare-fun b!1497042 () Bool)

(assert (=> b!1497042 (= e!838626 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!652224 lt!652225 mask!2687))))

(declare-fun b!1497043 () Bool)

(assert (=> b!1497043 (and (bvsge (index!51786 lt!652328) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652328) (size!48762 lt!652225)))))

(declare-fun res!1017860 () Bool)

(assert (=> b!1497043 (= res!1017860 (= (select (arr!48211 lt!652225) (index!51786 lt!652328)) lt!652224))))

(assert (=> b!1497043 (=> res!1017860 e!838627)))

(declare-fun e!838629 () Bool)

(assert (=> b!1497043 (= e!838629 e!838627)))

(declare-fun b!1497044 () Bool)

(assert (=> b!1497044 (= e!838626 (Intermediate!12348 false index!646 x!665))))

(declare-fun b!1497045 () Bool)

(assert (=> b!1497045 (= e!838628 e!838626)))

(declare-fun c!139134 () Bool)

(assert (=> b!1497045 (= c!139134 (or (= lt!652327 lt!652224) (= (bvadd lt!652327 lt!652327) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497046 () Bool)

(assert (=> b!1497046 (= e!838628 (Intermediate!12348 true index!646 x!665))))

(declare-fun b!1497047 () Bool)

(assert (=> b!1497047 (and (bvsge (index!51786 lt!652328) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652328) (size!48762 lt!652225)))))

(declare-fun res!1017861 () Bool)

(assert (=> b!1497047 (= res!1017861 (= (select (arr!48211 lt!652225) (index!51786 lt!652328)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497047 (=> res!1017861 e!838627)))

(declare-fun b!1497048 () Bool)

(assert (=> b!1497048 (= e!838630 e!838629)))

(declare-fun res!1017859 () Bool)

(assert (=> b!1497048 (= res!1017859 (and ((_ is Intermediate!12348) lt!652328) (not (undefined!13160 lt!652328)) (bvslt (x!133577 lt!652328) #b01111111111111111111111111111110) (bvsge (x!133577 lt!652328) #b00000000000000000000000000000000) (bvsge (x!133577 lt!652328) x!665)))))

(assert (=> b!1497048 (=> (not res!1017859) (not e!838629))))

(assert (= (and d!157701 c!139133) b!1497046))

(assert (= (and d!157701 (not c!139133)) b!1497045))

(assert (= (and b!1497045 c!139134) b!1497044))

(assert (= (and b!1497045 (not c!139134)) b!1497042))

(assert (= (and d!157701 c!139135) b!1497041))

(assert (= (and d!157701 (not c!139135)) b!1497048))

(assert (= (and b!1497048 res!1017859) b!1497043))

(assert (= (and b!1497043 (not res!1017860)) b!1497047))

(assert (= (and b!1497047 (not res!1017861)) b!1497040))

(declare-fun m!1380581 () Bool)

(assert (=> b!1497040 m!1380581))

(assert (=> b!1497042 m!1380505))

(assert (=> b!1497042 m!1380505))

(declare-fun m!1380583 () Bool)

(assert (=> b!1497042 m!1380583))

(assert (=> b!1497043 m!1380581))

(assert (=> d!157701 m!1380503))

(assert (=> d!157701 m!1380333))

(assert (=> b!1497047 m!1380581))

(assert (=> b!1496736 d!157701))

(declare-fun d!157703 () Bool)

(assert (=> d!157703 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127476 d!157703))

(declare-fun d!157711 () Bool)

(assert (=> d!157711 (= (array_inv!37492 a!2862) (bvsge (size!48762 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127476 d!157711))

(declare-fun d!157713 () Bool)

(declare-fun e!838644 () Bool)

(assert (=> d!157713 e!838644))

(declare-fun c!139142 () Bool)

(declare-fun lt!652338 () SeekEntryResult!12348)

(assert (=> d!157713 (= c!139142 (and ((_ is Intermediate!12348) lt!652338) (undefined!13160 lt!652338)))))

(declare-fun e!838642 () SeekEntryResult!12348)

(assert (=> d!157713 (= lt!652338 e!838642)))

(declare-fun c!139140 () Bool)

(assert (=> d!157713 (= c!139140 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!652337 () (_ BitVec 64))

(assert (=> d!157713 (= lt!652337 (select (arr!48211 a!2862) (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687)))))

(assert (=> d!157713 (validMask!0 mask!2687)))

(assert (=> d!157713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687) (select (arr!48211 a!2862) j!93) a!2862 mask!2687) lt!652338)))

(declare-fun b!1497063 () Bool)

(assert (=> b!1497063 (and (bvsge (index!51786 lt!652338) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652338) (size!48762 a!2862)))))

(declare-fun e!838641 () Bool)

(assert (=> b!1497063 (= e!838641 (= (select (arr!48211 a!2862) (index!51786 lt!652338)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497064 () Bool)

(assert (=> b!1497064 (= e!838644 (bvsge (x!133577 lt!652338) #b01111111111111111111111111111110))))

(declare-fun b!1497065 () Bool)

(declare-fun e!838640 () SeekEntryResult!12348)

(assert (=> b!1497065 (= e!838640 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48211 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1497066 () Bool)

(assert (=> b!1497066 (and (bvsge (index!51786 lt!652338) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652338) (size!48762 a!2862)))))

(declare-fun res!1017869 () Bool)

(assert (=> b!1497066 (= res!1017869 (= (select (arr!48211 a!2862) (index!51786 lt!652338)) (select (arr!48211 a!2862) j!93)))))

(assert (=> b!1497066 (=> res!1017869 e!838641)))

(declare-fun e!838643 () Bool)

(assert (=> b!1497066 (= e!838643 e!838641)))

(declare-fun b!1497067 () Bool)

(assert (=> b!1497067 (= e!838640 (Intermediate!12348 false (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1497068 () Bool)

(assert (=> b!1497068 (= e!838642 e!838640)))

(declare-fun c!139141 () Bool)

(assert (=> b!1497068 (= c!139141 (or (= lt!652337 (select (arr!48211 a!2862) j!93)) (= (bvadd lt!652337 lt!652337) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497069 () Bool)

(assert (=> b!1497069 (= e!838642 (Intermediate!12348 true (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1497070 () Bool)

(assert (=> b!1497070 (and (bvsge (index!51786 lt!652338) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652338) (size!48762 a!2862)))))

(declare-fun res!1017870 () Bool)

(assert (=> b!1497070 (= res!1017870 (= (select (arr!48211 a!2862) (index!51786 lt!652338)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497070 (=> res!1017870 e!838641)))

(declare-fun b!1497071 () Bool)

(assert (=> b!1497071 (= e!838644 e!838643)))

(declare-fun res!1017868 () Bool)

(assert (=> b!1497071 (= res!1017868 (and ((_ is Intermediate!12348) lt!652338) (not (undefined!13160 lt!652338)) (bvslt (x!133577 lt!652338) #b01111111111111111111111111111110) (bvsge (x!133577 lt!652338) #b00000000000000000000000000000000) (bvsge (x!133577 lt!652338) #b00000000000000000000000000000000)))))

(assert (=> b!1497071 (=> (not res!1017868) (not e!838643))))

(assert (= (and d!157713 c!139140) b!1497069))

(assert (= (and d!157713 (not c!139140)) b!1497068))

(assert (= (and b!1497068 c!139141) b!1497067))

(assert (= (and b!1497068 (not c!139141)) b!1497065))

(assert (= (and d!157713 c!139142) b!1497064))

(assert (= (and d!157713 (not c!139142)) b!1497071))

(assert (= (and b!1497071 res!1017868) b!1497066))

(assert (= (and b!1497066 (not res!1017869)) b!1497070))

(assert (= (and b!1497070 (not res!1017870)) b!1497063))

(declare-fun m!1380599 () Bool)

(assert (=> b!1497063 m!1380599))

(assert (=> b!1497065 m!1380337))

(declare-fun m!1380601 () Bool)

(assert (=> b!1497065 m!1380601))

(assert (=> b!1497065 m!1380601))

(assert (=> b!1497065 m!1380309))

(declare-fun m!1380603 () Bool)

(assert (=> b!1497065 m!1380603))

(assert (=> b!1497066 m!1380599))

(assert (=> d!157713 m!1380337))

(declare-fun m!1380605 () Bool)

(assert (=> d!157713 m!1380605))

(assert (=> d!157713 m!1380333))

(assert (=> b!1497070 m!1380599))

(assert (=> b!1496723 d!157713))

(declare-fun d!157715 () Bool)

(declare-fun lt!652340 () (_ BitVec 32))

(declare-fun lt!652339 () (_ BitVec 32))

(assert (=> d!157715 (= lt!652340 (bvmul (bvxor lt!652339 (bvlshr lt!652339 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157715 (= lt!652339 ((_ extract 31 0) (bvand (bvxor (select (arr!48211 a!2862) j!93) (bvlshr (select (arr!48211 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157715 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017827 (let ((h!36104 ((_ extract 31 0) (bvand (bvxor (select (arr!48211 a!2862) j!93) (bvlshr (select (arr!48211 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133583 (bvmul (bvxor h!36104 (bvlshr h!36104 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133583 (bvlshr x!133583 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017827 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017827 #b00000000000000000000000000000000))))))

(assert (=> d!157715 (= (toIndex!0 (select (arr!48211 a!2862) j!93) mask!2687) (bvand (bvxor lt!652340 (bvlshr lt!652340 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1496723 d!157715))

(declare-fun d!157717 () Bool)

(declare-fun e!838649 () Bool)

(assert (=> d!157717 e!838649))

(declare-fun c!139145 () Bool)

(declare-fun lt!652342 () SeekEntryResult!12348)

(assert (=> d!157717 (= c!139145 (and ((_ is Intermediate!12348) lt!652342) (undefined!13160 lt!652342)))))

(declare-fun e!838647 () SeekEntryResult!12348)

(assert (=> d!157717 (= lt!652342 e!838647)))

(declare-fun c!139143 () Bool)

(assert (=> d!157717 (= c!139143 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!652341 () (_ BitVec 64))

(assert (=> d!157717 (= lt!652341 (select (arr!48211 a!2862) index!646))))

(assert (=> d!157717 (validMask!0 mask!2687)))

(assert (=> d!157717 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48211 a!2862) j!93) a!2862 mask!2687) lt!652342)))

(declare-fun b!1497072 () Bool)

(assert (=> b!1497072 (and (bvsge (index!51786 lt!652342) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652342) (size!48762 a!2862)))))

(declare-fun e!838646 () Bool)

(assert (=> b!1497072 (= e!838646 (= (select (arr!48211 a!2862) (index!51786 lt!652342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497073 () Bool)

(assert (=> b!1497073 (= e!838649 (bvsge (x!133577 lt!652342) #b01111111111111111111111111111110))))

(declare-fun e!838645 () SeekEntryResult!12348)

(declare-fun b!1497074 () Bool)

(assert (=> b!1497074 (= e!838645 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48211 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1497075 () Bool)

(assert (=> b!1497075 (and (bvsge (index!51786 lt!652342) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652342) (size!48762 a!2862)))))

(declare-fun res!1017872 () Bool)

(assert (=> b!1497075 (= res!1017872 (= (select (arr!48211 a!2862) (index!51786 lt!652342)) (select (arr!48211 a!2862) j!93)))))

(assert (=> b!1497075 (=> res!1017872 e!838646)))

(declare-fun e!838648 () Bool)

(assert (=> b!1497075 (= e!838648 e!838646)))

(declare-fun b!1497076 () Bool)

(assert (=> b!1497076 (= e!838645 (Intermediate!12348 false index!646 x!665))))

(declare-fun b!1497077 () Bool)

(assert (=> b!1497077 (= e!838647 e!838645)))

(declare-fun c!139144 () Bool)

(assert (=> b!1497077 (= c!139144 (or (= lt!652341 (select (arr!48211 a!2862) j!93)) (= (bvadd lt!652341 lt!652341) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497078 () Bool)

(assert (=> b!1497078 (= e!838647 (Intermediate!12348 true index!646 x!665))))

(declare-fun b!1497079 () Bool)

(assert (=> b!1497079 (and (bvsge (index!51786 lt!652342) #b00000000000000000000000000000000) (bvslt (index!51786 lt!652342) (size!48762 a!2862)))))

(declare-fun res!1017873 () Bool)

(assert (=> b!1497079 (= res!1017873 (= (select (arr!48211 a!2862) (index!51786 lt!652342)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497079 (=> res!1017873 e!838646)))

(declare-fun b!1497080 () Bool)

(assert (=> b!1497080 (= e!838649 e!838648)))

(declare-fun res!1017871 () Bool)

(assert (=> b!1497080 (= res!1017871 (and ((_ is Intermediate!12348) lt!652342) (not (undefined!13160 lt!652342)) (bvslt (x!133577 lt!652342) #b01111111111111111111111111111110) (bvsge (x!133577 lt!652342) #b00000000000000000000000000000000) (bvsge (x!133577 lt!652342) x!665)))))

(assert (=> b!1497080 (=> (not res!1017871) (not e!838648))))

(assert (= (and d!157717 c!139143) b!1497078))

(assert (= (and d!157717 (not c!139143)) b!1497077))

(assert (= (and b!1497077 c!139144) b!1497076))

(assert (= (and b!1497077 (not c!139144)) b!1497074))

(assert (= (and d!157717 c!139145) b!1497073))

(assert (= (and d!157717 (not c!139145)) b!1497080))

(assert (= (and b!1497080 res!1017871) b!1497075))

(assert (= (and b!1497075 (not res!1017872)) b!1497079))

(assert (= (and b!1497079 (not res!1017873)) b!1497072))

(declare-fun m!1380607 () Bool)

(assert (=> b!1497072 m!1380607))

(assert (=> b!1497074 m!1380505))

(assert (=> b!1497074 m!1380505))

(assert (=> b!1497074 m!1380309))

(declare-fun m!1380609 () Bool)

(assert (=> b!1497074 m!1380609))

(assert (=> b!1497075 m!1380607))

(assert (=> d!157717 m!1380357))

(assert (=> d!157717 m!1380333))

(assert (=> b!1497079 m!1380607))

(assert (=> b!1496734 d!157717))

(check-sat (not b!1496944) (not d!157701) (not bm!68095) (not b!1496946) (not b!1497028) (not bm!68092) (not b!1497042) (not d!157663) (not d!157671) (not d!157713) (not d!157685) (not b!1497025) (not d!157669) (not d!157681) (not d!157717) (not bm!68091) (not b!1496951) (not b!1496962) (not b!1497074) (not d!157661) (not b!1496890) (not d!157667) (not b!1496947) (not b!1496925) (not d!157687) (not b!1496907) (not d!157689) (not b!1496986) (not b!1497065) (not b!1496966) (not b!1496906) (not b!1497029))
(check-sat)
