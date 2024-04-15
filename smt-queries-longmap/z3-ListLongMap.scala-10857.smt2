; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127070 () Bool)

(assert start!127070)

(declare-fun b!1493883 () Bool)

(declare-fun e!836762 () Bool)

(declare-fun e!836767 () Bool)

(assert (=> b!1493883 (= e!836762 e!836767)))

(declare-fun res!1016512 () Bool)

(assert (=> b!1493883 (=> (not res!1016512) (not e!836767))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99715 0))(
  ( (array!99716 (arr!48127 (Array (_ BitVec 32) (_ BitVec 64))) (size!48679 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99715)

(assert (=> b!1493883 (= res!1016512 (= (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650994 () array!99715)

(assert (=> b!1493883 (= lt!650994 (array!99716 (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48679 a!2862)))))

(declare-fun b!1493884 () Bool)

(declare-fun res!1016510 () Bool)

(declare-fun e!836763 () Bool)

(assert (=> b!1493884 (=> (not res!1016510) (not e!836763))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12392 0))(
  ( (MissingZero!12392 (index!51960 (_ BitVec 32))) (Found!12392 (index!51961 (_ BitVec 32))) (Intermediate!12392 (undefined!13204 Bool) (index!51962 (_ BitVec 32)) (x!133553 (_ BitVec 32))) (Undefined!12392) (MissingVacant!12392 (index!51963 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99715 (_ BitVec 32)) SeekEntryResult!12392)

(assert (=> b!1493884 (= res!1016510 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) (Found!12392 j!93)))))

(declare-fun e!836761 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1493885 () Bool)

(declare-fun lt!650995 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99715 (_ BitVec 32)) SeekEntryResult!12392)

(assert (=> b!1493885 (= e!836761 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650995 lt!650994 mask!2687) (seekEntryOrOpen!0 lt!650995 lt!650994 mask!2687)))))

(declare-fun b!1493886 () Bool)

(declare-fun e!836766 () Bool)

(declare-fun e!836760 () Bool)

(assert (=> b!1493886 (= e!836766 e!836760)))

(declare-fun res!1016508 () Bool)

(assert (=> b!1493886 (=> (not res!1016508) (not e!836760))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!650993 () SeekEntryResult!12392)

(assert (=> b!1493886 (= res!1016508 (= lt!650993 (Intermediate!12392 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99715 (_ BitVec 32)) SeekEntryResult!12392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493886 (= lt!650993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650995 mask!2687) lt!650995 lt!650994 mask!2687))))

(assert (=> b!1493886 (= lt!650995 (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!836764 () Bool)

(declare-fun b!1493887 () Bool)

(declare-fun lt!650996 () (_ BitVec 32))

(declare-fun lt!650992 () SeekEntryResult!12392)

(assert (=> b!1493887 (= e!836764 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650996 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650992))))

(declare-fun b!1493888 () Bool)

(declare-fun res!1016511 () Bool)

(assert (=> b!1493888 (=> (not res!1016511) (not e!836760))))

(assert (=> b!1493888 (= res!1016511 e!836761)))

(declare-fun c!138223 () Bool)

(assert (=> b!1493888 (= c!138223 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493889 () Bool)

(declare-fun res!1016503 () Bool)

(assert (=> b!1493889 (=> (not res!1016503) (not e!836766))))

(assert (=> b!1493889 (= res!1016503 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650992))))

(declare-fun b!1493890 () Bool)

(assert (=> b!1493890 (= e!836767 e!836766)))

(declare-fun res!1016518 () Bool)

(assert (=> b!1493890 (=> (not res!1016518) (not e!836766))))

(assert (=> b!1493890 (= res!1016518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650992))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493890 (= lt!650992 (Intermediate!12392 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493892 () Bool)

(declare-fun res!1016504 () Bool)

(assert (=> b!1493892 (=> (not res!1016504) (not e!836762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493892 (= res!1016504 (validKeyInArray!0 (select (arr!48127 a!2862) j!93)))))

(declare-fun b!1493893 () Bool)

(declare-fun e!836768 () Bool)

(assert (=> b!1493893 (= e!836768 e!836764)))

(declare-fun res!1016517 () Bool)

(assert (=> b!1493893 (=> res!1016517 e!836764)))

(assert (=> b!1493893 (= res!1016517 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!650996 #b00000000000000000000000000000000) (bvsge lt!650996 (size!48679 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493893 (= lt!650996 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493894 () Bool)

(assert (=> b!1493894 (= e!836760 (not e!836768))))

(declare-fun res!1016516 () Bool)

(assert (=> b!1493894 (=> res!1016516 e!836768)))

(assert (=> b!1493894 (= res!1016516 (or (and (= (select (arr!48127 a!2862) index!646) (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48127 a!2862) index!646) (select (arr!48127 a!2862) j!93))) (= (select (arr!48127 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493894 e!836763))

(declare-fun res!1016509 () Bool)

(assert (=> b!1493894 (=> (not res!1016509) (not e!836763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99715 (_ BitVec 32)) Bool)

(assert (=> b!1493894 (= res!1016509 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49965 0))(
  ( (Unit!49966) )
))
(declare-fun lt!650991 () Unit!49965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49965)

(assert (=> b!1493894 (= lt!650991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493895 () Bool)

(declare-fun res!1016505 () Bool)

(assert (=> b!1493895 (=> (not res!1016505) (not e!836762))))

(declare-datatypes ((List!34706 0))(
  ( (Nil!34703) (Cons!34702 (h!36091 (_ BitVec 64)) (t!49392 List!34706)) )
))
(declare-fun arrayNoDuplicates!0 (array!99715 (_ BitVec 32) List!34706) Bool)

(assert (=> b!1493895 (= res!1016505 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34703))))

(declare-fun b!1493896 () Bool)

(assert (=> b!1493896 (= e!836761 (= lt!650993 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650995 lt!650994 mask!2687)))))

(declare-fun b!1493897 () Bool)

(declare-fun res!1016514 () Bool)

(assert (=> b!1493897 (=> (not res!1016514) (not e!836762))))

(assert (=> b!1493897 (= res!1016514 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48679 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48679 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48679 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493898 () Bool)

(declare-fun res!1016515 () Bool)

(assert (=> b!1493898 (=> (not res!1016515) (not e!836762))))

(assert (=> b!1493898 (= res!1016515 (validKeyInArray!0 (select (arr!48127 a!2862) i!1006)))))

(declare-fun b!1493899 () Bool)

(declare-fun res!1016513 () Bool)

(assert (=> b!1493899 (=> (not res!1016513) (not e!836760))))

(assert (=> b!1493899 (= res!1016513 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493900 () Bool)

(assert (=> b!1493900 (= e!836763 (or (= (select (arr!48127 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48127 a!2862) intermediateBeforeIndex!19) (select (arr!48127 a!2862) j!93))))))

(declare-fun b!1493901 () Bool)

(declare-fun res!1016507 () Bool)

(assert (=> b!1493901 (=> (not res!1016507) (not e!836762))))

(assert (=> b!1493901 (= res!1016507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493891 () Bool)

(declare-fun res!1016506 () Bool)

(assert (=> b!1493891 (=> (not res!1016506) (not e!836762))))

(assert (=> b!1493891 (= res!1016506 (and (= (size!48679 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48679 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48679 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1016502 () Bool)

(assert (=> start!127070 (=> (not res!1016502) (not e!836762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127070 (= res!1016502 (validMask!0 mask!2687))))

(assert (=> start!127070 e!836762))

(assert (=> start!127070 true))

(declare-fun array_inv!37360 (array!99715) Bool)

(assert (=> start!127070 (array_inv!37360 a!2862)))

(assert (= (and start!127070 res!1016502) b!1493891))

(assert (= (and b!1493891 res!1016506) b!1493898))

(assert (= (and b!1493898 res!1016515) b!1493892))

(assert (= (and b!1493892 res!1016504) b!1493901))

(assert (= (and b!1493901 res!1016507) b!1493895))

(assert (= (and b!1493895 res!1016505) b!1493897))

(assert (= (and b!1493897 res!1016514) b!1493883))

(assert (= (and b!1493883 res!1016512) b!1493890))

(assert (= (and b!1493890 res!1016518) b!1493889))

(assert (= (and b!1493889 res!1016503) b!1493886))

(assert (= (and b!1493886 res!1016508) b!1493888))

(assert (= (and b!1493888 c!138223) b!1493896))

(assert (= (and b!1493888 (not c!138223)) b!1493885))

(assert (= (and b!1493888 res!1016511) b!1493899))

(assert (= (and b!1493899 res!1016513) b!1493894))

(assert (= (and b!1493894 res!1016509) b!1493884))

(assert (= (and b!1493884 res!1016510) b!1493900))

(assert (= (and b!1493894 (not res!1016516)) b!1493893))

(assert (= (and b!1493893 (not res!1016517)) b!1493887))

(declare-fun m!1377099 () Bool)

(assert (=> b!1493898 m!1377099))

(assert (=> b!1493898 m!1377099))

(declare-fun m!1377101 () Bool)

(assert (=> b!1493898 m!1377101))

(declare-fun m!1377103 () Bool)

(assert (=> b!1493889 m!1377103))

(assert (=> b!1493889 m!1377103))

(declare-fun m!1377105 () Bool)

(assert (=> b!1493889 m!1377105))

(assert (=> b!1493890 m!1377103))

(assert (=> b!1493890 m!1377103))

(declare-fun m!1377107 () Bool)

(assert (=> b!1493890 m!1377107))

(assert (=> b!1493890 m!1377107))

(assert (=> b!1493890 m!1377103))

(declare-fun m!1377109 () Bool)

(assert (=> b!1493890 m!1377109))

(declare-fun m!1377111 () Bool)

(assert (=> b!1493896 m!1377111))

(declare-fun m!1377113 () Bool)

(assert (=> b!1493886 m!1377113))

(assert (=> b!1493886 m!1377113))

(declare-fun m!1377115 () Bool)

(assert (=> b!1493886 m!1377115))

(declare-fun m!1377117 () Bool)

(assert (=> b!1493886 m!1377117))

(declare-fun m!1377119 () Bool)

(assert (=> b!1493886 m!1377119))

(declare-fun m!1377121 () Bool)

(assert (=> b!1493901 m!1377121))

(declare-fun m!1377123 () Bool)

(assert (=> b!1493885 m!1377123))

(declare-fun m!1377125 () Bool)

(assert (=> b!1493885 m!1377125))

(declare-fun m!1377127 () Bool)

(assert (=> start!127070 m!1377127))

(declare-fun m!1377129 () Bool)

(assert (=> start!127070 m!1377129))

(declare-fun m!1377131 () Bool)

(assert (=> b!1493895 m!1377131))

(declare-fun m!1377133 () Bool)

(assert (=> b!1493900 m!1377133))

(assert (=> b!1493900 m!1377103))

(assert (=> b!1493892 m!1377103))

(assert (=> b!1493892 m!1377103))

(declare-fun m!1377135 () Bool)

(assert (=> b!1493892 m!1377135))

(declare-fun m!1377137 () Bool)

(assert (=> b!1493893 m!1377137))

(assert (=> b!1493884 m!1377103))

(assert (=> b!1493884 m!1377103))

(declare-fun m!1377139 () Bool)

(assert (=> b!1493884 m!1377139))

(assert (=> b!1493883 m!1377117))

(declare-fun m!1377141 () Bool)

(assert (=> b!1493883 m!1377141))

(assert (=> b!1493887 m!1377103))

(assert (=> b!1493887 m!1377103))

(declare-fun m!1377143 () Bool)

(assert (=> b!1493887 m!1377143))

(declare-fun m!1377145 () Bool)

(assert (=> b!1493894 m!1377145))

(assert (=> b!1493894 m!1377117))

(declare-fun m!1377147 () Bool)

(assert (=> b!1493894 m!1377147))

(declare-fun m!1377149 () Bool)

(assert (=> b!1493894 m!1377149))

(declare-fun m!1377151 () Bool)

(assert (=> b!1493894 m!1377151))

(assert (=> b!1493894 m!1377103))

(check-sat (not b!1493889) (not b!1493890) (not b!1493885) (not b!1493893) (not start!127070) (not b!1493898) (not b!1493896) (not b!1493887) (not b!1493892) (not b!1493901) (not b!1493894) (not b!1493886) (not b!1493895) (not b!1493884))
(check-sat)
(get-model)

(declare-fun b!1494026 () Bool)

(declare-fun e!836833 () Bool)

(declare-fun call!67946 () Bool)

(assert (=> b!1494026 (= e!836833 call!67946)))

(declare-fun d!156793 () Bool)

(declare-fun res!1016628 () Bool)

(declare-fun e!836834 () Bool)

(assert (=> d!156793 (=> res!1016628 e!836834)))

(assert (=> d!156793 (= res!1016628 (bvsge #b00000000000000000000000000000000 (size!48679 a!2862)))))

(assert (=> d!156793 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34703) e!836834)))

(declare-fun b!1494027 () Bool)

(declare-fun e!836831 () Bool)

(declare-fun contains!9896 (List!34706 (_ BitVec 64)) Bool)

(assert (=> b!1494027 (= e!836831 (contains!9896 Nil!34703 (select (arr!48127 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67943 () Bool)

(declare-fun c!138232 () Bool)

(assert (=> bm!67943 (= call!67946 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138232 (Cons!34702 (select (arr!48127 a!2862) #b00000000000000000000000000000000) Nil!34703) Nil!34703)))))

(declare-fun b!1494028 () Bool)

(declare-fun e!836832 () Bool)

(assert (=> b!1494028 (= e!836834 e!836832)))

(declare-fun res!1016627 () Bool)

(assert (=> b!1494028 (=> (not res!1016627) (not e!836832))))

(assert (=> b!1494028 (= res!1016627 (not e!836831))))

(declare-fun res!1016629 () Bool)

(assert (=> b!1494028 (=> (not res!1016629) (not e!836831))))

(assert (=> b!1494028 (= res!1016629 (validKeyInArray!0 (select (arr!48127 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1494029 () Bool)

(assert (=> b!1494029 (= e!836833 call!67946)))

(declare-fun b!1494030 () Bool)

(assert (=> b!1494030 (= e!836832 e!836833)))

(assert (=> b!1494030 (= c!138232 (validKeyInArray!0 (select (arr!48127 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156793 (not res!1016628)) b!1494028))

(assert (= (and b!1494028 res!1016629) b!1494027))

(assert (= (and b!1494028 res!1016627) b!1494030))

(assert (= (and b!1494030 c!138232) b!1494026))

(assert (= (and b!1494030 (not c!138232)) b!1494029))

(assert (= (or b!1494026 b!1494029) bm!67943))

(declare-fun m!1377261 () Bool)

(assert (=> b!1494027 m!1377261))

(assert (=> b!1494027 m!1377261))

(declare-fun m!1377263 () Bool)

(assert (=> b!1494027 m!1377263))

(assert (=> bm!67943 m!1377261))

(declare-fun m!1377265 () Bool)

(assert (=> bm!67943 m!1377265))

(assert (=> b!1494028 m!1377261))

(assert (=> b!1494028 m!1377261))

(declare-fun m!1377267 () Bool)

(assert (=> b!1494028 m!1377267))

(assert (=> b!1494030 m!1377261))

(assert (=> b!1494030 m!1377261))

(assert (=> b!1494030 m!1377267))

(assert (=> b!1493895 d!156793))

(declare-fun b!1494043 () Bool)

(declare-fun e!836843 () SeekEntryResult!12392)

(declare-fun e!836842 () SeekEntryResult!12392)

(assert (=> b!1494043 (= e!836843 e!836842)))

(declare-fun lt!651039 () (_ BitVec 64))

(declare-fun lt!651041 () SeekEntryResult!12392)

(assert (=> b!1494043 (= lt!651039 (select (arr!48127 a!2862) (index!51962 lt!651041)))))

(declare-fun c!138240 () Bool)

(assert (=> b!1494043 (= c!138240 (= lt!651039 (select (arr!48127 a!2862) j!93)))))

(declare-fun b!1494044 () Bool)

(declare-fun e!836841 () SeekEntryResult!12392)

(assert (=> b!1494044 (= e!836841 (MissingZero!12392 (index!51962 lt!651041)))))

(declare-fun b!1494045 () Bool)

(declare-fun c!138239 () Bool)

(assert (=> b!1494045 (= c!138239 (= lt!651039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494045 (= e!836842 e!836841)))

(declare-fun d!156795 () Bool)

(declare-fun lt!651040 () SeekEntryResult!12392)

(get-info :version)

(assert (=> d!156795 (and (or ((_ is Undefined!12392) lt!651040) (not ((_ is Found!12392) lt!651040)) (and (bvsge (index!51961 lt!651040) #b00000000000000000000000000000000) (bvslt (index!51961 lt!651040) (size!48679 a!2862)))) (or ((_ is Undefined!12392) lt!651040) ((_ is Found!12392) lt!651040) (not ((_ is MissingZero!12392) lt!651040)) (and (bvsge (index!51960 lt!651040) #b00000000000000000000000000000000) (bvslt (index!51960 lt!651040) (size!48679 a!2862)))) (or ((_ is Undefined!12392) lt!651040) ((_ is Found!12392) lt!651040) ((_ is MissingZero!12392) lt!651040) (not ((_ is MissingVacant!12392) lt!651040)) (and (bvsge (index!51963 lt!651040) #b00000000000000000000000000000000) (bvslt (index!51963 lt!651040) (size!48679 a!2862)))) (or ((_ is Undefined!12392) lt!651040) (ite ((_ is Found!12392) lt!651040) (= (select (arr!48127 a!2862) (index!51961 lt!651040)) (select (arr!48127 a!2862) j!93)) (ite ((_ is MissingZero!12392) lt!651040) (= (select (arr!48127 a!2862) (index!51960 lt!651040)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12392) lt!651040) (= (select (arr!48127 a!2862) (index!51963 lt!651040)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156795 (= lt!651040 e!836843)))

(declare-fun c!138241 () Bool)

(assert (=> d!156795 (= c!138241 (and ((_ is Intermediate!12392) lt!651041) (undefined!13204 lt!651041)))))

(assert (=> d!156795 (= lt!651041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156795 (validMask!0 mask!2687)))

(assert (=> d!156795 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!651040)))

(declare-fun b!1494046 () Bool)

(assert (=> b!1494046 (= e!836843 Undefined!12392)))

(declare-fun b!1494047 () Bool)

(assert (=> b!1494047 (= e!836842 (Found!12392 (index!51962 lt!651041)))))

(declare-fun b!1494048 () Bool)

(assert (=> b!1494048 (= e!836841 (seekKeyOrZeroReturnVacant!0 (x!133553 lt!651041) (index!51962 lt!651041) (index!51962 lt!651041) (select (arr!48127 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!156795 c!138241) b!1494046))

(assert (= (and d!156795 (not c!138241)) b!1494043))

(assert (= (and b!1494043 c!138240) b!1494047))

(assert (= (and b!1494043 (not c!138240)) b!1494045))

(assert (= (and b!1494045 c!138239) b!1494044))

(assert (= (and b!1494045 (not c!138239)) b!1494048))

(declare-fun m!1377269 () Bool)

(assert (=> b!1494043 m!1377269))

(assert (=> d!156795 m!1377127))

(assert (=> d!156795 m!1377103))

(assert (=> d!156795 m!1377107))

(declare-fun m!1377271 () Bool)

(assert (=> d!156795 m!1377271))

(assert (=> d!156795 m!1377107))

(assert (=> d!156795 m!1377103))

(assert (=> d!156795 m!1377109))

(declare-fun m!1377273 () Bool)

(assert (=> d!156795 m!1377273))

(declare-fun m!1377275 () Bool)

(assert (=> d!156795 m!1377275))

(assert (=> b!1494048 m!1377103))

(declare-fun m!1377277 () Bool)

(assert (=> b!1494048 m!1377277))

(assert (=> b!1493884 d!156795))

(declare-fun d!156797 () Bool)

(assert (=> d!156797 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127070 d!156797))

(declare-fun d!156799 () Bool)

(assert (=> d!156799 (= (array_inv!37360 a!2862) (bvsge (size!48679 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127070 d!156799))

(declare-fun b!1494057 () Bool)

(declare-fun e!836852 () Bool)

(declare-fun call!67949 () Bool)

(assert (=> b!1494057 (= e!836852 call!67949)))

(declare-fun b!1494058 () Bool)

(declare-fun e!836850 () Bool)

(assert (=> b!1494058 (= e!836852 e!836850)))

(declare-fun lt!651050 () (_ BitVec 64))

(assert (=> b!1494058 (= lt!651050 (select (arr!48127 a!2862) j!93))))

(declare-fun lt!651048 () Unit!49965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99715 (_ BitVec 64) (_ BitVec 32)) Unit!49965)

(assert (=> b!1494058 (= lt!651048 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651050 j!93))))

(declare-fun arrayContainsKey!0 (array!99715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1494058 (arrayContainsKey!0 a!2862 lt!651050 #b00000000000000000000000000000000)))

(declare-fun lt!651049 () Unit!49965)

(assert (=> b!1494058 (= lt!651049 lt!651048)))

(declare-fun res!1016635 () Bool)

(assert (=> b!1494058 (= res!1016635 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) (Found!12392 j!93)))))

(assert (=> b!1494058 (=> (not res!1016635) (not e!836850))))

(declare-fun b!1494059 () Bool)

(assert (=> b!1494059 (= e!836850 call!67949)))

(declare-fun bm!67946 () Bool)

(assert (=> bm!67946 (= call!67949 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494060 () Bool)

(declare-fun e!836851 () Bool)

(assert (=> b!1494060 (= e!836851 e!836852)))

(declare-fun c!138244 () Bool)

(assert (=> b!1494060 (= c!138244 (validKeyInArray!0 (select (arr!48127 a!2862) j!93)))))

(declare-fun d!156801 () Bool)

(declare-fun res!1016634 () Bool)

(assert (=> d!156801 (=> res!1016634 e!836851)))

(assert (=> d!156801 (= res!1016634 (bvsge j!93 (size!48679 a!2862)))))

(assert (=> d!156801 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!836851)))

(assert (= (and d!156801 (not res!1016634)) b!1494060))

(assert (= (and b!1494060 c!138244) b!1494058))

(assert (= (and b!1494060 (not c!138244)) b!1494057))

(assert (= (and b!1494058 res!1016635) b!1494059))

(assert (= (or b!1494059 b!1494057) bm!67946))

(assert (=> b!1494058 m!1377103))

(declare-fun m!1377279 () Bool)

(assert (=> b!1494058 m!1377279))

(declare-fun m!1377281 () Bool)

(assert (=> b!1494058 m!1377281))

(assert (=> b!1494058 m!1377103))

(assert (=> b!1494058 m!1377139))

(declare-fun m!1377283 () Bool)

(assert (=> bm!67946 m!1377283))

(assert (=> b!1494060 m!1377103))

(assert (=> b!1494060 m!1377103))

(assert (=> b!1494060 m!1377135))

(assert (=> b!1493894 d!156801))

(declare-fun d!156803 () Bool)

(assert (=> d!156803 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651053 () Unit!49965)

(declare-fun choose!38 (array!99715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49965)

(assert (=> d!156803 (= lt!651053 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156803 (validMask!0 mask!2687)))

(assert (=> d!156803 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651053)))

(declare-fun bs!42853 () Bool)

(assert (= bs!42853 d!156803))

(assert (=> bs!42853 m!1377151))

(declare-fun m!1377285 () Bool)

(assert (=> bs!42853 m!1377285))

(assert (=> bs!42853 m!1377127))

(assert (=> b!1493894 d!156803))

(declare-fun b!1494101 () Bool)

(declare-fun e!836882 () SeekEntryResult!12392)

(assert (=> b!1494101 (= e!836882 (Intermediate!12392 true index!646 x!665))))

(declare-fun b!1494102 () Bool)

(declare-fun e!836883 () SeekEntryResult!12392)

(assert (=> b!1494102 (= e!836883 (Intermediate!12392 false index!646 x!665))))

(declare-fun b!1494103 () Bool)

(assert (=> b!1494103 (= e!836883 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650995 lt!650994 mask!2687))))

(declare-fun b!1494104 () Bool)

(declare-fun e!836881 () Bool)

(declare-fun e!836880 () Bool)

(assert (=> b!1494104 (= e!836881 e!836880)))

(declare-fun res!1016654 () Bool)

(declare-fun lt!651068 () SeekEntryResult!12392)

(assert (=> b!1494104 (= res!1016654 (and ((_ is Intermediate!12392) lt!651068) (not (undefined!13204 lt!651068)) (bvslt (x!133553 lt!651068) #b01111111111111111111111111111110) (bvsge (x!133553 lt!651068) #b00000000000000000000000000000000) (bvsge (x!133553 lt!651068) x!665)))))

(assert (=> b!1494104 (=> (not res!1016654) (not e!836880))))

(declare-fun b!1494105 () Bool)

(assert (=> b!1494105 (and (bvsge (index!51962 lt!651068) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651068) (size!48679 lt!650994)))))

(declare-fun res!1016655 () Bool)

(assert (=> b!1494105 (= res!1016655 (= (select (arr!48127 lt!650994) (index!51962 lt!651068)) lt!650995))))

(declare-fun e!836884 () Bool)

(assert (=> b!1494105 (=> res!1016655 e!836884)))

(assert (=> b!1494105 (= e!836880 e!836884)))

(declare-fun b!1494106 () Bool)

(assert (=> b!1494106 (= e!836881 (bvsge (x!133553 lt!651068) #b01111111111111111111111111111110))))

(declare-fun b!1494107 () Bool)

(assert (=> b!1494107 (= e!836882 e!836883)))

(declare-fun c!138258 () Bool)

(declare-fun lt!651067 () (_ BitVec 64))

(assert (=> b!1494107 (= c!138258 (or (= lt!651067 lt!650995) (= (bvadd lt!651067 lt!651067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494108 () Bool)

(assert (=> b!1494108 (and (bvsge (index!51962 lt!651068) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651068) (size!48679 lt!650994)))))

(assert (=> b!1494108 (= e!836884 (= (select (arr!48127 lt!650994) (index!51962 lt!651068)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156805 () Bool)

(assert (=> d!156805 e!836881))

(declare-fun c!138256 () Bool)

(assert (=> d!156805 (= c!138256 (and ((_ is Intermediate!12392) lt!651068) (undefined!13204 lt!651068)))))

(assert (=> d!156805 (= lt!651068 e!836882)))

(declare-fun c!138257 () Bool)

(assert (=> d!156805 (= c!138257 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156805 (= lt!651067 (select (arr!48127 lt!650994) index!646))))

(assert (=> d!156805 (validMask!0 mask!2687)))

(assert (=> d!156805 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650995 lt!650994 mask!2687) lt!651068)))

(declare-fun b!1494109 () Bool)

(assert (=> b!1494109 (and (bvsge (index!51962 lt!651068) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651068) (size!48679 lt!650994)))))

(declare-fun res!1016656 () Bool)

(assert (=> b!1494109 (= res!1016656 (= (select (arr!48127 lt!650994) (index!51962 lt!651068)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494109 (=> res!1016656 e!836884)))

(assert (= (and d!156805 c!138257) b!1494101))

(assert (= (and d!156805 (not c!138257)) b!1494107))

(assert (= (and b!1494107 c!138258) b!1494102))

(assert (= (and b!1494107 (not c!138258)) b!1494103))

(assert (= (and d!156805 c!138256) b!1494106))

(assert (= (and d!156805 (not c!138256)) b!1494104))

(assert (= (and b!1494104 res!1016654) b!1494105))

(assert (= (and b!1494105 (not res!1016655)) b!1494109))

(assert (= (and b!1494109 (not res!1016656)) b!1494108))

(declare-fun m!1377299 () Bool)

(assert (=> d!156805 m!1377299))

(assert (=> d!156805 m!1377127))

(declare-fun m!1377301 () Bool)

(assert (=> b!1494109 m!1377301))

(assert (=> b!1494103 m!1377137))

(assert (=> b!1494103 m!1377137))

(declare-fun m!1377303 () Bool)

(assert (=> b!1494103 m!1377303))

(assert (=> b!1494105 m!1377301))

(assert (=> b!1494108 m!1377301))

(assert (=> b!1493896 d!156805))

(declare-fun b!1494163 () Bool)

(declare-fun e!836916 () SeekEntryResult!12392)

(assert (=> b!1494163 (= e!836916 (MissingVacant!12392 intermediateAfterIndex!19))))

(declare-fun b!1494164 () Bool)

(declare-fun e!836915 () SeekEntryResult!12392)

(assert (=> b!1494164 (= e!836915 (Found!12392 index!646))))

(declare-fun b!1494165 () Bool)

(declare-fun e!836917 () SeekEntryResult!12392)

(assert (=> b!1494165 (= e!836917 Undefined!12392)))

(declare-fun b!1494166 () Bool)

(assert (=> b!1494166 (= e!836917 e!836915)))

(declare-fun c!138278 () Bool)

(declare-fun lt!651088 () (_ BitVec 64))

(assert (=> b!1494166 (= c!138278 (= lt!651088 lt!650995))))

(declare-fun b!1494167 () Bool)

(assert (=> b!1494167 (= e!836916 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650995 lt!650994 mask!2687))))

(declare-fun lt!651087 () SeekEntryResult!12392)

(declare-fun d!156815 () Bool)

(assert (=> d!156815 (and (or ((_ is Undefined!12392) lt!651087) (not ((_ is Found!12392) lt!651087)) (and (bvsge (index!51961 lt!651087) #b00000000000000000000000000000000) (bvslt (index!51961 lt!651087) (size!48679 lt!650994)))) (or ((_ is Undefined!12392) lt!651087) ((_ is Found!12392) lt!651087) (not ((_ is MissingVacant!12392) lt!651087)) (not (= (index!51963 lt!651087) intermediateAfterIndex!19)) (and (bvsge (index!51963 lt!651087) #b00000000000000000000000000000000) (bvslt (index!51963 lt!651087) (size!48679 lt!650994)))) (or ((_ is Undefined!12392) lt!651087) (ite ((_ is Found!12392) lt!651087) (= (select (arr!48127 lt!650994) (index!51961 lt!651087)) lt!650995) (and ((_ is MissingVacant!12392) lt!651087) (= (index!51963 lt!651087) intermediateAfterIndex!19) (= (select (arr!48127 lt!650994) (index!51963 lt!651087)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156815 (= lt!651087 e!836917)))

(declare-fun c!138279 () Bool)

(assert (=> d!156815 (= c!138279 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156815 (= lt!651088 (select (arr!48127 lt!650994) index!646))))

(assert (=> d!156815 (validMask!0 mask!2687)))

(assert (=> d!156815 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650995 lt!650994 mask!2687) lt!651087)))

(declare-fun b!1494168 () Bool)

(declare-fun c!138280 () Bool)

(assert (=> b!1494168 (= c!138280 (= lt!651088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494168 (= e!836915 e!836916)))

(assert (= (and d!156815 c!138279) b!1494165))

(assert (= (and d!156815 (not c!138279)) b!1494166))

(assert (= (and b!1494166 c!138278) b!1494164))

(assert (= (and b!1494166 (not c!138278)) b!1494168))

(assert (= (and b!1494168 c!138280) b!1494163))

(assert (= (and b!1494168 (not c!138280)) b!1494167))

(assert (=> b!1494167 m!1377137))

(assert (=> b!1494167 m!1377137))

(declare-fun m!1377321 () Bool)

(assert (=> b!1494167 m!1377321))

(declare-fun m!1377323 () Bool)

(assert (=> d!156815 m!1377323))

(declare-fun m!1377325 () Bool)

(assert (=> d!156815 m!1377325))

(assert (=> d!156815 m!1377299))

(assert (=> d!156815 m!1377127))

(assert (=> b!1493885 d!156815))

(declare-fun b!1494177 () Bool)

(declare-fun e!836924 () SeekEntryResult!12392)

(declare-fun e!836923 () SeekEntryResult!12392)

(assert (=> b!1494177 (= e!836924 e!836923)))

(declare-fun lt!651093 () (_ BitVec 64))

(declare-fun lt!651095 () SeekEntryResult!12392)

(assert (=> b!1494177 (= lt!651093 (select (arr!48127 lt!650994) (index!51962 lt!651095)))))

(declare-fun c!138286 () Bool)

(assert (=> b!1494177 (= c!138286 (= lt!651093 lt!650995))))

(declare-fun b!1494178 () Bool)

(declare-fun e!836922 () SeekEntryResult!12392)

(assert (=> b!1494178 (= e!836922 (MissingZero!12392 (index!51962 lt!651095)))))

(declare-fun b!1494179 () Bool)

(declare-fun c!138285 () Bool)

(assert (=> b!1494179 (= c!138285 (= lt!651093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494179 (= e!836923 e!836922)))

(declare-fun d!156825 () Bool)

(declare-fun lt!651094 () SeekEntryResult!12392)

(assert (=> d!156825 (and (or ((_ is Undefined!12392) lt!651094) (not ((_ is Found!12392) lt!651094)) (and (bvsge (index!51961 lt!651094) #b00000000000000000000000000000000) (bvslt (index!51961 lt!651094) (size!48679 lt!650994)))) (or ((_ is Undefined!12392) lt!651094) ((_ is Found!12392) lt!651094) (not ((_ is MissingZero!12392) lt!651094)) (and (bvsge (index!51960 lt!651094) #b00000000000000000000000000000000) (bvslt (index!51960 lt!651094) (size!48679 lt!650994)))) (or ((_ is Undefined!12392) lt!651094) ((_ is Found!12392) lt!651094) ((_ is MissingZero!12392) lt!651094) (not ((_ is MissingVacant!12392) lt!651094)) (and (bvsge (index!51963 lt!651094) #b00000000000000000000000000000000) (bvslt (index!51963 lt!651094) (size!48679 lt!650994)))) (or ((_ is Undefined!12392) lt!651094) (ite ((_ is Found!12392) lt!651094) (= (select (arr!48127 lt!650994) (index!51961 lt!651094)) lt!650995) (ite ((_ is MissingZero!12392) lt!651094) (= (select (arr!48127 lt!650994) (index!51960 lt!651094)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12392) lt!651094) (= (select (arr!48127 lt!650994) (index!51963 lt!651094)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156825 (= lt!651094 e!836924)))

(declare-fun c!138287 () Bool)

(assert (=> d!156825 (= c!138287 (and ((_ is Intermediate!12392) lt!651095) (undefined!13204 lt!651095)))))

(assert (=> d!156825 (= lt!651095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650995 mask!2687) lt!650995 lt!650994 mask!2687))))

(assert (=> d!156825 (validMask!0 mask!2687)))

(assert (=> d!156825 (= (seekEntryOrOpen!0 lt!650995 lt!650994 mask!2687) lt!651094)))

(declare-fun b!1494180 () Bool)

(assert (=> b!1494180 (= e!836924 Undefined!12392)))

(declare-fun b!1494181 () Bool)

(assert (=> b!1494181 (= e!836923 (Found!12392 (index!51962 lt!651095)))))

(declare-fun b!1494182 () Bool)

(assert (=> b!1494182 (= e!836922 (seekKeyOrZeroReturnVacant!0 (x!133553 lt!651095) (index!51962 lt!651095) (index!51962 lt!651095) lt!650995 lt!650994 mask!2687))))

(assert (= (and d!156825 c!138287) b!1494180))

(assert (= (and d!156825 (not c!138287)) b!1494177))

(assert (= (and b!1494177 c!138286) b!1494181))

(assert (= (and b!1494177 (not c!138286)) b!1494179))

(assert (= (and b!1494179 c!138285) b!1494178))

(assert (= (and b!1494179 (not c!138285)) b!1494182))

(declare-fun m!1377327 () Bool)

(assert (=> b!1494177 m!1377327))

(assert (=> d!156825 m!1377127))

(assert (=> d!156825 m!1377113))

(declare-fun m!1377329 () Bool)

(assert (=> d!156825 m!1377329))

(assert (=> d!156825 m!1377113))

(assert (=> d!156825 m!1377115))

(declare-fun m!1377331 () Bool)

(assert (=> d!156825 m!1377331))

(declare-fun m!1377333 () Bool)

(assert (=> d!156825 m!1377333))

(declare-fun m!1377335 () Bool)

(assert (=> b!1494182 m!1377335))

(assert (=> b!1493885 d!156825))

(declare-fun d!156827 () Bool)

(assert (=> d!156827 (= (validKeyInArray!0 (select (arr!48127 a!2862) j!93)) (and (not (= (select (arr!48127 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48127 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1493892 d!156827))

(declare-fun d!156829 () Bool)

(declare-fun lt!651098 () (_ BitVec 32))

(assert (=> d!156829 (and (bvsge lt!651098 #b00000000000000000000000000000000) (bvslt lt!651098 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156829 (= lt!651098 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156829 (validMask!0 mask!2687)))

(assert (=> d!156829 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651098)))

(declare-fun bs!42854 () Bool)

(assert (= bs!42854 d!156829))

(declare-fun m!1377337 () Bool)

(assert (=> bs!42854 m!1377337))

(assert (=> bs!42854 m!1377127))

(assert (=> b!1493893 d!156829))

(declare-fun b!1494193 () Bool)

(declare-fun e!836933 () SeekEntryResult!12392)

(assert (=> b!1494193 (= e!836933 (Intermediate!12392 true index!646 x!665))))

(declare-fun b!1494194 () Bool)

(declare-fun e!836934 () SeekEntryResult!12392)

(assert (=> b!1494194 (= e!836934 (Intermediate!12392 false index!646 x!665))))

(declare-fun b!1494195 () Bool)

(assert (=> b!1494195 (= e!836934 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494196 () Bool)

(declare-fun e!836932 () Bool)

(declare-fun e!836931 () Bool)

(assert (=> b!1494196 (= e!836932 e!836931)))

(declare-fun res!1016679 () Bool)

(declare-fun lt!651100 () SeekEntryResult!12392)

(assert (=> b!1494196 (= res!1016679 (and ((_ is Intermediate!12392) lt!651100) (not (undefined!13204 lt!651100)) (bvslt (x!133553 lt!651100) #b01111111111111111111111111111110) (bvsge (x!133553 lt!651100) #b00000000000000000000000000000000) (bvsge (x!133553 lt!651100) x!665)))))

(assert (=> b!1494196 (=> (not res!1016679) (not e!836931))))

(declare-fun b!1494197 () Bool)

(assert (=> b!1494197 (and (bvsge (index!51962 lt!651100) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651100) (size!48679 a!2862)))))

(declare-fun res!1016680 () Bool)

(assert (=> b!1494197 (= res!1016680 (= (select (arr!48127 a!2862) (index!51962 lt!651100)) (select (arr!48127 a!2862) j!93)))))

(declare-fun e!836935 () Bool)

(assert (=> b!1494197 (=> res!1016680 e!836935)))

(assert (=> b!1494197 (= e!836931 e!836935)))

(declare-fun b!1494198 () Bool)

(assert (=> b!1494198 (= e!836932 (bvsge (x!133553 lt!651100) #b01111111111111111111111111111110))))

(declare-fun b!1494199 () Bool)

(assert (=> b!1494199 (= e!836933 e!836934)))

(declare-fun lt!651099 () (_ BitVec 64))

(declare-fun c!138292 () Bool)

(assert (=> b!1494199 (= c!138292 (or (= lt!651099 (select (arr!48127 a!2862) j!93)) (= (bvadd lt!651099 lt!651099) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494200 () Bool)

(assert (=> b!1494200 (and (bvsge (index!51962 lt!651100) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651100) (size!48679 a!2862)))))

(assert (=> b!1494200 (= e!836935 (= (select (arr!48127 a!2862) (index!51962 lt!651100)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156831 () Bool)

(assert (=> d!156831 e!836932))

(declare-fun c!138290 () Bool)

(assert (=> d!156831 (= c!138290 (and ((_ is Intermediate!12392) lt!651100) (undefined!13204 lt!651100)))))

(assert (=> d!156831 (= lt!651100 e!836933)))

(declare-fun c!138291 () Bool)

(assert (=> d!156831 (= c!138291 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156831 (= lt!651099 (select (arr!48127 a!2862) index!646))))

(assert (=> d!156831 (validMask!0 mask!2687)))

(assert (=> d!156831 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!651100)))

(declare-fun b!1494201 () Bool)

(assert (=> b!1494201 (and (bvsge (index!51962 lt!651100) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651100) (size!48679 a!2862)))))

(declare-fun res!1016681 () Bool)

(assert (=> b!1494201 (= res!1016681 (= (select (arr!48127 a!2862) (index!51962 lt!651100)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494201 (=> res!1016681 e!836935)))

(assert (= (and d!156831 c!138291) b!1494193))

(assert (= (and d!156831 (not c!138291)) b!1494199))

(assert (= (and b!1494199 c!138292) b!1494194))

(assert (= (and b!1494199 (not c!138292)) b!1494195))

(assert (= (and d!156831 c!138290) b!1494198))

(assert (= (and d!156831 (not c!138290)) b!1494196))

(assert (= (and b!1494196 res!1016679) b!1494197))

(assert (= (and b!1494197 (not res!1016680)) b!1494201))

(assert (= (and b!1494201 (not res!1016681)) b!1494200))

(assert (=> d!156831 m!1377149))

(assert (=> d!156831 m!1377127))

(declare-fun m!1377339 () Bool)

(assert (=> b!1494201 m!1377339))

(assert (=> b!1494195 m!1377137))

(assert (=> b!1494195 m!1377137))

(assert (=> b!1494195 m!1377103))

(declare-fun m!1377343 () Bool)

(assert (=> b!1494195 m!1377343))

(assert (=> b!1494197 m!1377339))

(assert (=> b!1494200 m!1377339))

(assert (=> b!1493889 d!156831))

(declare-fun b!1494211 () Bool)

(declare-fun e!836943 () Bool)

(declare-fun call!67956 () Bool)

(assert (=> b!1494211 (= e!836943 call!67956)))

(declare-fun b!1494212 () Bool)

(declare-fun e!836941 () Bool)

(assert (=> b!1494212 (= e!836943 e!836941)))

(declare-fun lt!651105 () (_ BitVec 64))

(assert (=> b!1494212 (= lt!651105 (select (arr!48127 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651103 () Unit!49965)

(assert (=> b!1494212 (= lt!651103 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651105 #b00000000000000000000000000000000))))

(assert (=> b!1494212 (arrayContainsKey!0 a!2862 lt!651105 #b00000000000000000000000000000000)))

(declare-fun lt!651104 () Unit!49965)

(assert (=> b!1494212 (= lt!651104 lt!651103)))

(declare-fun res!1016686 () Bool)

(assert (=> b!1494212 (= res!1016686 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12392 #b00000000000000000000000000000000)))))

(assert (=> b!1494212 (=> (not res!1016686) (not e!836941))))

(declare-fun b!1494213 () Bool)

(assert (=> b!1494213 (= e!836941 call!67956)))

(declare-fun bm!67953 () Bool)

(assert (=> bm!67953 (= call!67956 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494214 () Bool)

(declare-fun e!836942 () Bool)

(assert (=> b!1494214 (= e!836942 e!836943)))

(declare-fun c!138296 () Bool)

(assert (=> b!1494214 (= c!138296 (validKeyInArray!0 (select (arr!48127 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156833 () Bool)

(declare-fun res!1016685 () Bool)

(assert (=> d!156833 (=> res!1016685 e!836942)))

(assert (=> d!156833 (= res!1016685 (bvsge #b00000000000000000000000000000000 (size!48679 a!2862)))))

(assert (=> d!156833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!836942)))

(assert (= (and d!156833 (not res!1016685)) b!1494214))

(assert (= (and b!1494214 c!138296) b!1494212))

(assert (= (and b!1494214 (not c!138296)) b!1494211))

(assert (= (and b!1494212 res!1016686) b!1494213))

(assert (= (or b!1494213 b!1494211) bm!67953))

(assert (=> b!1494212 m!1377261))

(declare-fun m!1377351 () Bool)

(assert (=> b!1494212 m!1377351))

(declare-fun m!1377353 () Bool)

(assert (=> b!1494212 m!1377353))

(assert (=> b!1494212 m!1377261))

(declare-fun m!1377355 () Bool)

(assert (=> b!1494212 m!1377355))

(declare-fun m!1377357 () Bool)

(assert (=> bm!67953 m!1377357))

(assert (=> b!1494214 m!1377261))

(assert (=> b!1494214 m!1377261))

(assert (=> b!1494214 m!1377267))

(assert (=> b!1493901 d!156833))

(declare-fun e!836946 () SeekEntryResult!12392)

(declare-fun b!1494215 () Bool)

(assert (=> b!1494215 (= e!836946 (Intermediate!12392 true (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494216 () Bool)

(declare-fun e!836947 () SeekEntryResult!12392)

(assert (=> b!1494216 (= e!836947 (Intermediate!12392 false (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494217 () Bool)

(assert (=> b!1494217 (= e!836947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494218 () Bool)

(declare-fun e!836945 () Bool)

(declare-fun e!836944 () Bool)

(assert (=> b!1494218 (= e!836945 e!836944)))

(declare-fun res!1016688 () Bool)

(declare-fun lt!651107 () SeekEntryResult!12392)

(assert (=> b!1494218 (= res!1016688 (and ((_ is Intermediate!12392) lt!651107) (not (undefined!13204 lt!651107)) (bvslt (x!133553 lt!651107) #b01111111111111111111111111111110) (bvsge (x!133553 lt!651107) #b00000000000000000000000000000000) (bvsge (x!133553 lt!651107) #b00000000000000000000000000000000)))))

(assert (=> b!1494218 (=> (not res!1016688) (not e!836944))))

(declare-fun b!1494219 () Bool)

(assert (=> b!1494219 (and (bvsge (index!51962 lt!651107) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651107) (size!48679 a!2862)))))

(declare-fun res!1016689 () Bool)

(assert (=> b!1494219 (= res!1016689 (= (select (arr!48127 a!2862) (index!51962 lt!651107)) (select (arr!48127 a!2862) j!93)))))

(declare-fun e!836948 () Bool)

(assert (=> b!1494219 (=> res!1016689 e!836948)))

(assert (=> b!1494219 (= e!836944 e!836948)))

(declare-fun b!1494220 () Bool)

(assert (=> b!1494220 (= e!836945 (bvsge (x!133553 lt!651107) #b01111111111111111111111111111110))))

(declare-fun b!1494221 () Bool)

(assert (=> b!1494221 (= e!836946 e!836947)))

(declare-fun c!138299 () Bool)

(declare-fun lt!651106 () (_ BitVec 64))

(assert (=> b!1494221 (= c!138299 (or (= lt!651106 (select (arr!48127 a!2862) j!93)) (= (bvadd lt!651106 lt!651106) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494222 () Bool)

(assert (=> b!1494222 (and (bvsge (index!51962 lt!651107) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651107) (size!48679 a!2862)))))

(assert (=> b!1494222 (= e!836948 (= (select (arr!48127 a!2862) (index!51962 lt!651107)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156837 () Bool)

(assert (=> d!156837 e!836945))

(declare-fun c!138297 () Bool)

(assert (=> d!156837 (= c!138297 (and ((_ is Intermediate!12392) lt!651107) (undefined!13204 lt!651107)))))

(assert (=> d!156837 (= lt!651107 e!836946)))

(declare-fun c!138298 () Bool)

(assert (=> d!156837 (= c!138298 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156837 (= lt!651106 (select (arr!48127 a!2862) (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687)))))

(assert (=> d!156837 (validMask!0 mask!2687)))

(assert (=> d!156837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!651107)))

(declare-fun b!1494223 () Bool)

(assert (=> b!1494223 (and (bvsge (index!51962 lt!651107) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651107) (size!48679 a!2862)))))

(declare-fun res!1016690 () Bool)

(assert (=> b!1494223 (= res!1016690 (= (select (arr!48127 a!2862) (index!51962 lt!651107)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494223 (=> res!1016690 e!836948)))

(assert (= (and d!156837 c!138298) b!1494215))

(assert (= (and d!156837 (not c!138298)) b!1494221))

(assert (= (and b!1494221 c!138299) b!1494216))

(assert (= (and b!1494221 (not c!138299)) b!1494217))

(assert (= (and d!156837 c!138297) b!1494220))

(assert (= (and d!156837 (not c!138297)) b!1494218))

(assert (= (and b!1494218 res!1016688) b!1494219))

(assert (= (and b!1494219 (not res!1016689)) b!1494223))

(assert (= (and b!1494223 (not res!1016690)) b!1494222))

(assert (=> d!156837 m!1377107))

(declare-fun m!1377359 () Bool)

(assert (=> d!156837 m!1377359))

(assert (=> d!156837 m!1377127))

(declare-fun m!1377361 () Bool)

(assert (=> b!1494223 m!1377361))

(assert (=> b!1494217 m!1377107))

(declare-fun m!1377363 () Bool)

(assert (=> b!1494217 m!1377363))

(assert (=> b!1494217 m!1377363))

(assert (=> b!1494217 m!1377103))

(declare-fun m!1377365 () Bool)

(assert (=> b!1494217 m!1377365))

(assert (=> b!1494219 m!1377361))

(assert (=> b!1494222 m!1377361))

(assert (=> b!1493890 d!156837))

(declare-fun d!156843 () Bool)

(declare-fun lt!651129 () (_ BitVec 32))

(declare-fun lt!651128 () (_ BitVec 32))

(assert (=> d!156843 (= lt!651129 (bvmul (bvxor lt!651128 (bvlshr lt!651128 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156843 (= lt!651128 ((_ extract 31 0) (bvand (bvxor (select (arr!48127 a!2862) j!93) (bvlshr (select (arr!48127 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156843 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1016694 (let ((h!36096 ((_ extract 31 0) (bvand (bvxor (select (arr!48127 a!2862) j!93) (bvlshr (select (arr!48127 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133563 (bvmul (bvxor h!36096 (bvlshr h!36096 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133563 (bvlshr x!133563 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1016694 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1016694 #b00000000000000000000000000000000))))))

(assert (=> d!156843 (= (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) (bvand (bvxor lt!651129 (bvlshr lt!651129 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1493890 d!156843))

(declare-fun b!1494260 () Bool)

(declare-fun e!836971 () SeekEntryResult!12392)

(assert (=> b!1494260 (= e!836971 (Intermediate!12392 true lt!650996 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494261 () Bool)

(declare-fun e!836972 () SeekEntryResult!12392)

(assert (=> b!1494261 (= e!836972 (Intermediate!12392 false lt!650996 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494262 () Bool)

(assert (=> b!1494262 (= e!836972 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!650996 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494263 () Bool)

(declare-fun e!836970 () Bool)

(declare-fun e!836969 () Bool)

(assert (=> b!1494263 (= e!836970 e!836969)))

(declare-fun res!1016704 () Bool)

(declare-fun lt!651133 () SeekEntryResult!12392)

(assert (=> b!1494263 (= res!1016704 (and ((_ is Intermediate!12392) lt!651133) (not (undefined!13204 lt!651133)) (bvslt (x!133553 lt!651133) #b01111111111111111111111111111110) (bvsge (x!133553 lt!651133) #b00000000000000000000000000000000) (bvsge (x!133553 lt!651133) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1494263 (=> (not res!1016704) (not e!836969))))

(declare-fun b!1494264 () Bool)

(assert (=> b!1494264 (and (bvsge (index!51962 lt!651133) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651133) (size!48679 a!2862)))))

(declare-fun res!1016705 () Bool)

(assert (=> b!1494264 (= res!1016705 (= (select (arr!48127 a!2862) (index!51962 lt!651133)) (select (arr!48127 a!2862) j!93)))))

(declare-fun e!836973 () Bool)

(assert (=> b!1494264 (=> res!1016705 e!836973)))

(assert (=> b!1494264 (= e!836969 e!836973)))

(declare-fun b!1494265 () Bool)

(assert (=> b!1494265 (= e!836970 (bvsge (x!133553 lt!651133) #b01111111111111111111111111111110))))

(declare-fun b!1494266 () Bool)

(assert (=> b!1494266 (= e!836971 e!836972)))

(declare-fun c!138314 () Bool)

(declare-fun lt!651132 () (_ BitVec 64))

(assert (=> b!1494266 (= c!138314 (or (= lt!651132 (select (arr!48127 a!2862) j!93)) (= (bvadd lt!651132 lt!651132) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494267 () Bool)

(assert (=> b!1494267 (and (bvsge (index!51962 lt!651133) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651133) (size!48679 a!2862)))))

(assert (=> b!1494267 (= e!836973 (= (select (arr!48127 a!2862) (index!51962 lt!651133)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156857 () Bool)

(assert (=> d!156857 e!836970))

(declare-fun c!138312 () Bool)

(assert (=> d!156857 (= c!138312 (and ((_ is Intermediate!12392) lt!651133) (undefined!13204 lt!651133)))))

(assert (=> d!156857 (= lt!651133 e!836971)))

(declare-fun c!138313 () Bool)

(assert (=> d!156857 (= c!138313 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156857 (= lt!651132 (select (arr!48127 a!2862) lt!650996))))

(assert (=> d!156857 (validMask!0 mask!2687)))

(assert (=> d!156857 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650996 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!651133)))

(declare-fun b!1494268 () Bool)

(assert (=> b!1494268 (and (bvsge (index!51962 lt!651133) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651133) (size!48679 a!2862)))))

(declare-fun res!1016706 () Bool)

(assert (=> b!1494268 (= res!1016706 (= (select (arr!48127 a!2862) (index!51962 lt!651133)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494268 (=> res!1016706 e!836973)))

(assert (= (and d!156857 c!138313) b!1494260))

(assert (= (and d!156857 (not c!138313)) b!1494266))

(assert (= (and b!1494266 c!138314) b!1494261))

(assert (= (and b!1494266 (not c!138314)) b!1494262))

(assert (= (and d!156857 c!138312) b!1494265))

(assert (= (and d!156857 (not c!138312)) b!1494263))

(assert (= (and b!1494263 res!1016704) b!1494264))

(assert (= (and b!1494264 (not res!1016705)) b!1494268))

(assert (= (and b!1494268 (not res!1016706)) b!1494267))

(declare-fun m!1377399 () Bool)

(assert (=> d!156857 m!1377399))

(assert (=> d!156857 m!1377127))

(declare-fun m!1377401 () Bool)

(assert (=> b!1494268 m!1377401))

(declare-fun m!1377403 () Bool)

(assert (=> b!1494262 m!1377403))

(assert (=> b!1494262 m!1377403))

(assert (=> b!1494262 m!1377103))

(declare-fun m!1377405 () Bool)

(assert (=> b!1494262 m!1377405))

(assert (=> b!1494264 m!1377401))

(assert (=> b!1494267 m!1377401))

(assert (=> b!1493887 d!156857))

(declare-fun b!1494269 () Bool)

(declare-fun e!836976 () SeekEntryResult!12392)

(assert (=> b!1494269 (= e!836976 (Intermediate!12392 true (toIndex!0 lt!650995 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494270 () Bool)

(declare-fun e!836977 () SeekEntryResult!12392)

(assert (=> b!1494270 (= e!836977 (Intermediate!12392 false (toIndex!0 lt!650995 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494271 () Bool)

(assert (=> b!1494271 (= e!836977 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650995 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650995 lt!650994 mask!2687))))

(declare-fun b!1494272 () Bool)

(declare-fun e!836975 () Bool)

(declare-fun e!836974 () Bool)

(assert (=> b!1494272 (= e!836975 e!836974)))

(declare-fun res!1016707 () Bool)

(declare-fun lt!651136 () SeekEntryResult!12392)

(assert (=> b!1494272 (= res!1016707 (and ((_ is Intermediate!12392) lt!651136) (not (undefined!13204 lt!651136)) (bvslt (x!133553 lt!651136) #b01111111111111111111111111111110) (bvsge (x!133553 lt!651136) #b00000000000000000000000000000000) (bvsge (x!133553 lt!651136) #b00000000000000000000000000000000)))))

(assert (=> b!1494272 (=> (not res!1016707) (not e!836974))))

(declare-fun b!1494273 () Bool)

(assert (=> b!1494273 (and (bvsge (index!51962 lt!651136) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651136) (size!48679 lt!650994)))))

(declare-fun res!1016708 () Bool)

(assert (=> b!1494273 (= res!1016708 (= (select (arr!48127 lt!650994) (index!51962 lt!651136)) lt!650995))))

(declare-fun e!836978 () Bool)

(assert (=> b!1494273 (=> res!1016708 e!836978)))

(assert (=> b!1494273 (= e!836974 e!836978)))

(declare-fun b!1494274 () Bool)

(assert (=> b!1494274 (= e!836975 (bvsge (x!133553 lt!651136) #b01111111111111111111111111111110))))

(declare-fun b!1494275 () Bool)

(assert (=> b!1494275 (= e!836976 e!836977)))

(declare-fun c!138317 () Bool)

(declare-fun lt!651135 () (_ BitVec 64))

(assert (=> b!1494275 (= c!138317 (or (= lt!651135 lt!650995) (= (bvadd lt!651135 lt!651135) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494276 () Bool)

(assert (=> b!1494276 (and (bvsge (index!51962 lt!651136) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651136) (size!48679 lt!650994)))))

(assert (=> b!1494276 (= e!836978 (= (select (arr!48127 lt!650994) (index!51962 lt!651136)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156861 () Bool)

(assert (=> d!156861 e!836975))

(declare-fun c!138315 () Bool)

(assert (=> d!156861 (= c!138315 (and ((_ is Intermediate!12392) lt!651136) (undefined!13204 lt!651136)))))

(assert (=> d!156861 (= lt!651136 e!836976)))

(declare-fun c!138316 () Bool)

(assert (=> d!156861 (= c!138316 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156861 (= lt!651135 (select (arr!48127 lt!650994) (toIndex!0 lt!650995 mask!2687)))))

(assert (=> d!156861 (validMask!0 mask!2687)))

(assert (=> d!156861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650995 mask!2687) lt!650995 lt!650994 mask!2687) lt!651136)))

(declare-fun b!1494277 () Bool)

(assert (=> b!1494277 (and (bvsge (index!51962 lt!651136) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651136) (size!48679 lt!650994)))))

(declare-fun res!1016709 () Bool)

(assert (=> b!1494277 (= res!1016709 (= (select (arr!48127 lt!650994) (index!51962 lt!651136)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494277 (=> res!1016709 e!836978)))

(assert (= (and d!156861 c!138316) b!1494269))

(assert (= (and d!156861 (not c!138316)) b!1494275))

(assert (= (and b!1494275 c!138317) b!1494270))

(assert (= (and b!1494275 (not c!138317)) b!1494271))

(assert (= (and d!156861 c!138315) b!1494274))

(assert (= (and d!156861 (not c!138315)) b!1494272))

(assert (= (and b!1494272 res!1016707) b!1494273))

(assert (= (and b!1494273 (not res!1016708)) b!1494277))

(assert (= (and b!1494277 (not res!1016709)) b!1494276))

(assert (=> d!156861 m!1377113))

(declare-fun m!1377407 () Bool)

(assert (=> d!156861 m!1377407))

(assert (=> d!156861 m!1377127))

(declare-fun m!1377409 () Bool)

(assert (=> b!1494277 m!1377409))

(assert (=> b!1494271 m!1377113))

(declare-fun m!1377411 () Bool)

(assert (=> b!1494271 m!1377411))

(assert (=> b!1494271 m!1377411))

(declare-fun m!1377413 () Bool)

(assert (=> b!1494271 m!1377413))

(assert (=> b!1494273 m!1377409))

(assert (=> b!1494276 m!1377409))

(assert (=> b!1493886 d!156861))

(declare-fun d!156863 () Bool)

(declare-fun lt!651138 () (_ BitVec 32))

(declare-fun lt!651137 () (_ BitVec 32))

(assert (=> d!156863 (= lt!651138 (bvmul (bvxor lt!651137 (bvlshr lt!651137 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156863 (= lt!651137 ((_ extract 31 0) (bvand (bvxor lt!650995 (bvlshr lt!650995 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156863 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1016694 (let ((h!36096 ((_ extract 31 0) (bvand (bvxor lt!650995 (bvlshr lt!650995 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133563 (bvmul (bvxor h!36096 (bvlshr h!36096 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133563 (bvlshr x!133563 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1016694 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1016694 #b00000000000000000000000000000000))))))

(assert (=> d!156863 (= (toIndex!0 lt!650995 mask!2687) (bvand (bvxor lt!651138 (bvlshr lt!651138 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1493886 d!156863))

(declare-fun d!156865 () Bool)

(assert (=> d!156865 (= (validKeyInArray!0 (select (arr!48127 a!2862) i!1006)) (and (not (= (select (arr!48127 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48127 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1493898 d!156865))

(check-sat (not b!1494103) (not b!1494217) (not b!1494060) (not b!1494214) (not d!156857) (not b!1494195) (not d!156837) (not bm!67953) (not b!1494048) (not b!1494271) (not d!156803) (not bm!67943) (not b!1494027) (not d!156831) (not d!156861) (not b!1494028) (not b!1494058) (not d!156795) (not d!156815) (not bm!67946) (not b!1494030) (not b!1494212) (not d!156829) (not d!156805) (not b!1494167) (not b!1494262) (not d!156825) (not b!1494182))
(check-sat)
