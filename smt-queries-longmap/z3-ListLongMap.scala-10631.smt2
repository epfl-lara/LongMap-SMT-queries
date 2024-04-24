; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125142 () Bool)

(assert start!125142)

(declare-fun res!983311 () Bool)

(declare-fun e!818123 () Bool)

(assert (=> start!125142 (=> (not res!983311) (not e!818123))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125142 (= res!983311 (validMask!0 mask!2687))))

(assert (=> start!125142 e!818123))

(assert (=> start!125142 true))

(declare-datatypes ((array!98485 0))(
  ( (array!98486 (arr!47527 (Array (_ BitVec 32) (_ BitVec 64))) (size!48078 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98485)

(declare-fun array_inv!36808 (array!98485) Bool)

(assert (=> start!125142 (array_inv!36808 a!2862)))

(declare-fun b!1452914 () Bool)

(declare-fun e!818119 () Bool)

(assert (=> b!1452914 (= e!818123 e!818119)))

(declare-fun res!983315 () Bool)

(assert (=> b!1452914 (=> (not res!983315) (not e!818119))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452914 (= res!983315 (= (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637175 () array!98485)

(assert (=> b!1452914 (= lt!637175 (array!98486 (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48078 a!2862)))))

(declare-fun b!1452915 () Bool)

(declare-fun e!818124 () Bool)

(declare-fun lt!637177 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452915 (= e!818124 (validKeyInArray!0 lt!637177))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11676 0))(
  ( (MissingZero!11676 (index!49096 (_ BitVec 32))) (Found!11676 (index!49097 (_ BitVec 32))) (Intermediate!11676 (undefined!12488 Bool) (index!49098 (_ BitVec 32)) (x!130925 (_ BitVec 32))) (Undefined!11676) (MissingVacant!11676 (index!49099 (_ BitVec 32))) )
))
(declare-fun lt!637176 () SeekEntryResult!11676)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!818122 () Bool)

(declare-fun b!1452916 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98485 (_ BitVec 32)) SeekEntryResult!11676)

(assert (=> b!1452916 (= e!818122 (= lt!637176 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637177 lt!637175 mask!2687)))))

(declare-fun b!1452917 () Bool)

(declare-fun res!983313 () Bool)

(assert (=> b!1452917 (=> (not res!983313) (not e!818123))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1452917 (= res!983313 (and (= (size!48078 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48078 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48078 a!2862)) (not (= i!1006 j!93))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!818117 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1452918 () Bool)

(assert (=> b!1452918 (= e!818117 (and (or (= (select (arr!47527 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47527 a!2862) intermediateBeforeIndex!19) (select (arr!47527 a!2862) j!93))) (or (and (= (select (arr!47527 a!2862) index!646) (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47527 a!2862) index!646) (select (arr!47527 a!2862) j!93))) (= (select (arr!47527 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452919 () Bool)

(declare-fun e!818121 () Bool)

(assert (=> b!1452919 (= e!818121 (not e!818124))))

(declare-fun res!983310 () Bool)

(assert (=> b!1452919 (=> res!983310 e!818124)))

(assert (=> b!1452919 (= res!983310 (or (and (= (select (arr!47527 a!2862) index!646) (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47527 a!2862) index!646) (select (arr!47527 a!2862) j!93))) (= (select (arr!47527 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1452919 e!818117))

(declare-fun res!983306 () Bool)

(assert (=> b!1452919 (=> (not res!983306) (not e!818117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98485 (_ BitVec 32)) Bool)

(assert (=> b!1452919 (= res!983306 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48881 0))(
  ( (Unit!48882) )
))
(declare-fun lt!637174 () Unit!48881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48881)

(assert (=> b!1452919 (= lt!637174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452920 () Bool)

(declare-fun e!818120 () Bool)

(assert (=> b!1452920 (= e!818120 e!818121)))

(declare-fun res!983318 () Bool)

(assert (=> b!1452920 (=> (not res!983318) (not e!818121))))

(assert (=> b!1452920 (= res!983318 (= lt!637176 (Intermediate!11676 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452920 (= lt!637176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637177 mask!2687) lt!637177 lt!637175 mask!2687))))

(assert (=> b!1452920 (= lt!637177 (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452921 () Bool)

(declare-fun res!983314 () Bool)

(assert (=> b!1452921 (=> (not res!983314) (not e!818123))))

(assert (=> b!1452921 (= res!983314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98485 (_ BitVec 32)) SeekEntryResult!11676)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98485 (_ BitVec 32)) SeekEntryResult!11676)

(assert (=> b!1452922 (= e!818122 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637177 lt!637175 mask!2687) (seekEntryOrOpen!0 lt!637177 lt!637175 mask!2687)))))

(declare-fun b!1452923 () Bool)

(declare-fun res!983312 () Bool)

(assert (=> b!1452923 (=> (not res!983312) (not e!818117))))

(assert (=> b!1452923 (= res!983312 (= (seekEntryOrOpen!0 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) (Found!11676 j!93)))))

(declare-fun b!1452924 () Bool)

(declare-fun res!983316 () Bool)

(assert (=> b!1452924 (=> (not res!983316) (not e!818123))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452924 (= res!983316 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48078 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48078 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48078 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452925 () Bool)

(declare-fun res!983317 () Bool)

(assert (=> b!1452925 (=> (not res!983317) (not e!818121))))

(assert (=> b!1452925 (= res!983317 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452926 () Bool)

(declare-fun res!983321 () Bool)

(assert (=> b!1452926 (=> (not res!983321) (not e!818123))))

(declare-datatypes ((List!34015 0))(
  ( (Nil!34012) (Cons!34011 (h!35372 (_ BitVec 64)) (t!48701 List!34015)) )
))
(declare-fun arrayNoDuplicates!0 (array!98485 (_ BitVec 32) List!34015) Bool)

(assert (=> b!1452926 (= res!983321 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34012))))

(declare-fun b!1452927 () Bool)

(declare-fun res!983308 () Bool)

(assert (=> b!1452927 (=> (not res!983308) (not e!818121))))

(assert (=> b!1452927 (= res!983308 e!818122)))

(declare-fun c!134323 () Bool)

(assert (=> b!1452927 (= c!134323 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452928 () Bool)

(declare-fun res!983309 () Bool)

(assert (=> b!1452928 (=> (not res!983309) (not e!818123))))

(assert (=> b!1452928 (= res!983309 (validKeyInArray!0 (select (arr!47527 a!2862) j!93)))))

(declare-fun b!1452929 () Bool)

(assert (=> b!1452929 (= e!818119 e!818120)))

(declare-fun res!983320 () Bool)

(assert (=> b!1452929 (=> (not res!983320) (not e!818120))))

(declare-fun lt!637173 () SeekEntryResult!11676)

(assert (=> b!1452929 (= res!983320 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47527 a!2862) j!93) mask!2687) (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!637173))))

(assert (=> b!1452929 (= lt!637173 (Intermediate!11676 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452930 () Bool)

(declare-fun res!983307 () Bool)

(assert (=> b!1452930 (=> (not res!983307) (not e!818120))))

(assert (=> b!1452930 (= res!983307 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!637173))))

(declare-fun b!1452931 () Bool)

(declare-fun res!983319 () Bool)

(assert (=> b!1452931 (=> (not res!983319) (not e!818123))))

(assert (=> b!1452931 (= res!983319 (validKeyInArray!0 (select (arr!47527 a!2862) i!1006)))))

(assert (= (and start!125142 res!983311) b!1452917))

(assert (= (and b!1452917 res!983313) b!1452931))

(assert (= (and b!1452931 res!983319) b!1452928))

(assert (= (and b!1452928 res!983309) b!1452921))

(assert (= (and b!1452921 res!983314) b!1452926))

(assert (= (and b!1452926 res!983321) b!1452924))

(assert (= (and b!1452924 res!983316) b!1452914))

(assert (= (and b!1452914 res!983315) b!1452929))

(assert (= (and b!1452929 res!983320) b!1452930))

(assert (= (and b!1452930 res!983307) b!1452920))

(assert (= (and b!1452920 res!983318) b!1452927))

(assert (= (and b!1452927 c!134323) b!1452916))

(assert (= (and b!1452927 (not c!134323)) b!1452922))

(assert (= (and b!1452927 res!983308) b!1452925))

(assert (= (and b!1452925 res!983317) b!1452919))

(assert (= (and b!1452919 res!983306) b!1452923))

(assert (= (and b!1452923 res!983312) b!1452918))

(assert (= (and b!1452919 (not res!983310)) b!1452915))

(declare-fun m!1341619 () Bool)

(assert (=> b!1452928 m!1341619))

(assert (=> b!1452928 m!1341619))

(declare-fun m!1341621 () Bool)

(assert (=> b!1452928 m!1341621))

(declare-fun m!1341623 () Bool)

(assert (=> start!125142 m!1341623))

(declare-fun m!1341625 () Bool)

(assert (=> start!125142 m!1341625))

(declare-fun m!1341627 () Bool)

(assert (=> b!1452914 m!1341627))

(declare-fun m!1341629 () Bool)

(assert (=> b!1452914 m!1341629))

(declare-fun m!1341631 () Bool)

(assert (=> b!1452921 m!1341631))

(assert (=> b!1452930 m!1341619))

(assert (=> b!1452930 m!1341619))

(declare-fun m!1341633 () Bool)

(assert (=> b!1452930 m!1341633))

(assert (=> b!1452918 m!1341627))

(declare-fun m!1341635 () Bool)

(assert (=> b!1452918 m!1341635))

(declare-fun m!1341637 () Bool)

(assert (=> b!1452918 m!1341637))

(declare-fun m!1341639 () Bool)

(assert (=> b!1452918 m!1341639))

(assert (=> b!1452918 m!1341619))

(declare-fun m!1341641 () Bool)

(assert (=> b!1452922 m!1341641))

(declare-fun m!1341643 () Bool)

(assert (=> b!1452922 m!1341643))

(assert (=> b!1452923 m!1341619))

(assert (=> b!1452923 m!1341619))

(declare-fun m!1341645 () Bool)

(assert (=> b!1452923 m!1341645))

(assert (=> b!1452929 m!1341619))

(assert (=> b!1452929 m!1341619))

(declare-fun m!1341647 () Bool)

(assert (=> b!1452929 m!1341647))

(assert (=> b!1452929 m!1341647))

(assert (=> b!1452929 m!1341619))

(declare-fun m!1341649 () Bool)

(assert (=> b!1452929 m!1341649))

(declare-fun m!1341651 () Bool)

(assert (=> b!1452915 m!1341651))

(declare-fun m!1341653 () Bool)

(assert (=> b!1452926 m!1341653))

(declare-fun m!1341655 () Bool)

(assert (=> b!1452931 m!1341655))

(assert (=> b!1452931 m!1341655))

(declare-fun m!1341657 () Bool)

(assert (=> b!1452931 m!1341657))

(declare-fun m!1341659 () Bool)

(assert (=> b!1452920 m!1341659))

(assert (=> b!1452920 m!1341659))

(declare-fun m!1341661 () Bool)

(assert (=> b!1452920 m!1341661))

(assert (=> b!1452920 m!1341627))

(declare-fun m!1341663 () Bool)

(assert (=> b!1452920 m!1341663))

(declare-fun m!1341665 () Bool)

(assert (=> b!1452919 m!1341665))

(assert (=> b!1452919 m!1341627))

(assert (=> b!1452919 m!1341637))

(assert (=> b!1452919 m!1341639))

(declare-fun m!1341667 () Bool)

(assert (=> b!1452919 m!1341667))

(assert (=> b!1452919 m!1341619))

(declare-fun m!1341669 () Bool)

(assert (=> b!1452916 m!1341669))

(check-sat (not b!1452921) (not b!1452931) (not b!1452922) (not b!1452923) (not start!125142) (not b!1452919) (not b!1452929) (not b!1452920) (not b!1452915) (not b!1452926) (not b!1452928) (not b!1452930) (not b!1452916))
(check-sat)
