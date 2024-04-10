; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119898 () Bool)

(assert start!119898)

(declare-fun b!1396064 () Bool)

(declare-fun res!935148 () Bool)

(declare-fun e!790353 () Bool)

(assert (=> b!1396064 (=> (not res!935148) (not e!790353))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95478 0))(
  ( (array!95479 (arr!46094 (Array (_ BitVec 32) (_ BitVec 64))) (size!46644 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95478)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396064 (= res!935148 (and (= (size!46644 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46644 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46644 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396065 () Bool)

(declare-datatypes ((SeekEntryResult!10411 0))(
  ( (MissingZero!10411 (index!44015 (_ BitVec 32))) (Found!10411 (index!44016 (_ BitVec 32))) (Intermediate!10411 (undefined!11223 Bool) (index!44017 (_ BitVec 32)) (x!125683 (_ BitVec 32))) (Undefined!10411) (MissingVacant!10411 (index!44018 (_ BitVec 32))) )
))
(declare-fun lt!613236 () SeekEntryResult!10411)

(declare-fun lt!613234 () SeekEntryResult!10411)

(declare-fun e!790352 () Bool)

(assert (=> b!1396065 (= e!790352 (or (= lt!613236 lt!613234) (not (is-Intermediate!10411 lt!613234)) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95478 (_ BitVec 32)) SeekEntryResult!10411)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396065 (= lt!613234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901)) mask!2840))))

(declare-fun b!1396066 () Bool)

(declare-fun res!935149 () Bool)

(assert (=> b!1396066 (=> (not res!935149) (not e!790353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95478 (_ BitVec 32)) Bool)

(assert (=> b!1396066 (= res!935149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!935142 () Bool)

(assert (=> start!119898 (=> (not res!935142) (not e!790353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119898 (= res!935142 (validMask!0 mask!2840))))

(assert (=> start!119898 e!790353))

(assert (=> start!119898 true))

(declare-fun array_inv!35122 (array!95478) Bool)

(assert (=> start!119898 (array_inv!35122 a!2901)))

(declare-fun b!1396067 () Bool)

(declare-fun res!935145 () Bool)

(assert (=> b!1396067 (=> (not res!935145) (not e!790353))))

(declare-datatypes ((List!32613 0))(
  ( (Nil!32610) (Cons!32609 (h!33848 (_ BitVec 64)) (t!47307 List!32613)) )
))
(declare-fun arrayNoDuplicates!0 (array!95478 (_ BitVec 32) List!32613) Bool)

(assert (=> b!1396067 (= res!935145 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32610))))

(declare-fun b!1396068 () Bool)

(declare-fun e!790355 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95478 (_ BitVec 32)) SeekEntryResult!10411)

(assert (=> b!1396068 (= e!790355 (= (seekEntryOrOpen!0 (select (arr!46094 a!2901) j!112) a!2901 mask!2840) (Found!10411 j!112)))))

(declare-fun b!1396069 () Bool)

(declare-fun res!935144 () Bool)

(assert (=> b!1396069 (=> (not res!935144) (not e!790353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396069 (= res!935144 (validKeyInArray!0 (select (arr!46094 a!2901) j!112)))))

(declare-fun b!1396070 () Bool)

(assert (=> b!1396070 (= e!790353 (not e!790352))))

(declare-fun res!935146 () Bool)

(assert (=> b!1396070 (=> res!935146 e!790352)))

(assert (=> b!1396070 (= res!935146 (or (not (is-Intermediate!10411 lt!613236)) (undefined!11223 lt!613236)))))

(assert (=> b!1396070 e!790355))

(declare-fun res!935143 () Bool)

(assert (=> b!1396070 (=> (not res!935143) (not e!790355))))

(assert (=> b!1396070 (= res!935143 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46826 0))(
  ( (Unit!46827) )
))
(declare-fun lt!613235 () Unit!46826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46826)

(assert (=> b!1396070 (= lt!613235 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396070 (= lt!613236 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840) (select (arr!46094 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396071 () Bool)

(declare-fun res!935147 () Bool)

(assert (=> b!1396071 (=> (not res!935147) (not e!790353))))

(assert (=> b!1396071 (= res!935147 (validKeyInArray!0 (select (arr!46094 a!2901) i!1037)))))

(assert (= (and start!119898 res!935142) b!1396064))

(assert (= (and b!1396064 res!935148) b!1396071))

(assert (= (and b!1396071 res!935147) b!1396069))

(assert (= (and b!1396069 res!935144) b!1396066))

(assert (= (and b!1396066 res!935149) b!1396067))

(assert (= (and b!1396067 res!935145) b!1396070))

(assert (= (and b!1396070 res!935143) b!1396068))

(assert (= (and b!1396070 (not res!935146)) b!1396065))

(declare-fun m!1282563 () Bool)

(assert (=> start!119898 m!1282563))

(declare-fun m!1282565 () Bool)

(assert (=> start!119898 m!1282565))

(declare-fun m!1282567 () Bool)

(assert (=> b!1396065 m!1282567))

(declare-fun m!1282569 () Bool)

(assert (=> b!1396065 m!1282569))

(assert (=> b!1396065 m!1282569))

(declare-fun m!1282571 () Bool)

(assert (=> b!1396065 m!1282571))

(assert (=> b!1396065 m!1282571))

(assert (=> b!1396065 m!1282569))

(declare-fun m!1282573 () Bool)

(assert (=> b!1396065 m!1282573))

(declare-fun m!1282575 () Bool)

(assert (=> b!1396067 m!1282575))

(declare-fun m!1282577 () Bool)

(assert (=> b!1396070 m!1282577))

(declare-fun m!1282579 () Bool)

(assert (=> b!1396070 m!1282579))

(assert (=> b!1396070 m!1282577))

(declare-fun m!1282581 () Bool)

(assert (=> b!1396070 m!1282581))

(assert (=> b!1396070 m!1282579))

(assert (=> b!1396070 m!1282577))

(declare-fun m!1282583 () Bool)

(assert (=> b!1396070 m!1282583))

(declare-fun m!1282585 () Bool)

(assert (=> b!1396070 m!1282585))

(declare-fun m!1282587 () Bool)

(assert (=> b!1396066 m!1282587))

(declare-fun m!1282589 () Bool)

(assert (=> b!1396071 m!1282589))

(assert (=> b!1396071 m!1282589))

(declare-fun m!1282591 () Bool)

(assert (=> b!1396071 m!1282591))

(assert (=> b!1396069 m!1282577))

(assert (=> b!1396069 m!1282577))

(declare-fun m!1282593 () Bool)

(assert (=> b!1396069 m!1282593))

(assert (=> b!1396068 m!1282577))

(assert (=> b!1396068 m!1282577))

(declare-fun m!1282595 () Bool)

(assert (=> b!1396068 m!1282595))

(push 1)

(assert (not b!1396070))

(assert (not b!1396071))

(assert (not b!1396066))

(assert (not b!1396069))

(assert (not start!119898))

(assert (not b!1396067))

(assert (not b!1396065))

(assert (not b!1396068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150811 () Bool)

(assert (=> d!150811 (= (validKeyInArray!0 (select (arr!46094 a!2901) i!1037)) (and (not (= (select (arr!46094 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46094 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396071 d!150811))

(declare-fun d!150813 () Bool)

(assert (=> d!150813 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119898 d!150813))

(declare-fun d!150817 () Bool)

(assert (=> d!150817 (= (array_inv!35122 a!2901) (bvsge (size!46644 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119898 d!150817))

(declare-fun b!1396161 () Bool)

(declare-fun e!790409 () Bool)

(declare-fun e!790408 () Bool)

(assert (=> b!1396161 (= e!790409 e!790408)))

(declare-fun c!129930 () Bool)

(assert (=> b!1396161 (= c!129930 (validKeyInArray!0 (select (arr!46094 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150819 () Bool)

(declare-fun res!935211 () Bool)

(assert (=> d!150819 (=> res!935211 e!790409)))

(assert (=> d!150819 (= res!935211 (bvsge #b00000000000000000000000000000000 (size!46644 a!2901)))))

(assert (=> d!150819 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790409)))

(declare-fun b!1396162 () Bool)

(declare-fun call!66850 () Bool)

(assert (=> b!1396162 (= e!790408 call!66850)))

(declare-fun b!1396163 () Bool)

(declare-fun e!790407 () Bool)

(assert (=> b!1396163 (= e!790407 call!66850)))

(declare-fun bm!66847 () Bool)

(assert (=> bm!66847 (= call!66850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396164 () Bool)

(assert (=> b!1396164 (= e!790408 e!790407)))

(declare-fun lt!613270 () (_ BitVec 64))

(assert (=> b!1396164 (= lt!613270 (select (arr!46094 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613272 () Unit!46826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95478 (_ BitVec 64) (_ BitVec 32)) Unit!46826)

(assert (=> b!1396164 (= lt!613272 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613270 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1396164 (arrayContainsKey!0 a!2901 lt!613270 #b00000000000000000000000000000000)))

(declare-fun lt!613271 () Unit!46826)

(assert (=> b!1396164 (= lt!613271 lt!613272)))

(declare-fun res!935212 () Bool)

(assert (=> b!1396164 (= res!935212 (= (seekEntryOrOpen!0 (select (arr!46094 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10411 #b00000000000000000000000000000000)))))

(assert (=> b!1396164 (=> (not res!935212) (not e!790407))))

(assert (= (and d!150819 (not res!935211)) b!1396161))

(assert (= (and b!1396161 c!129930) b!1396164))

(assert (= (and b!1396161 (not c!129930)) b!1396162))

(assert (= (and b!1396164 res!935212) b!1396163))

(assert (= (or b!1396163 b!1396162) bm!66847))

(declare-fun m!1282683 () Bool)

(assert (=> b!1396161 m!1282683))

(assert (=> b!1396161 m!1282683))

(declare-fun m!1282685 () Bool)

(assert (=> b!1396161 m!1282685))

(declare-fun m!1282687 () Bool)

(assert (=> bm!66847 m!1282687))

(assert (=> b!1396164 m!1282683))

(declare-fun m!1282689 () Bool)

(assert (=> b!1396164 m!1282689))

(declare-fun m!1282691 () Bool)

(assert (=> b!1396164 m!1282691))

(assert (=> b!1396164 m!1282683))

(declare-fun m!1282693 () Bool)

(assert (=> b!1396164 m!1282693))

(assert (=> b!1396066 d!150819))

(declare-fun b!1396223 () Bool)

(declare-fun e!790448 () Bool)

(declare-fun lt!613299 () SeekEntryResult!10411)

(assert (=> b!1396223 (= e!790448 (bvsge (x!125683 lt!613299) #b01111111111111111111111111111110))))

(declare-fun b!1396224 () Bool)

(declare-fun e!790447 () Bool)

(assert (=> b!1396224 (= e!790448 e!790447)))

(declare-fun res!935236 () Bool)

(assert (=> b!1396224 (= res!935236 (and (is-Intermediate!10411 lt!613299) (not (undefined!11223 lt!613299)) (bvslt (x!125683 lt!613299) #b01111111111111111111111111111110) (bvsge (x!125683 lt!613299) #b00000000000000000000000000000000) (bvsge (x!125683 lt!613299) #b00000000000000000000000000000000)))))

(assert (=> b!1396224 (=> (not res!935236) (not e!790447))))

(declare-fun b!1396225 () Bool)

(declare-fun e!790446 () SeekEntryResult!10411)

(declare-fun e!790445 () SeekEntryResult!10411)

(assert (=> b!1396225 (= e!790446 e!790445)))

(declare-fun c!129950 () Bool)

(declare-fun lt!613298 () (_ BitVec 64))

(assert (=> b!1396225 (= c!129950 (or (= lt!613298 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613298 lt!613298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396226 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396226 (= e!790445 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901)) mask!2840))))

(declare-fun b!1396227 () Bool)

(assert (=> b!1396227 (= e!790445 (Intermediate!10411 false (toIndex!0 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396228 () Bool)

(assert (=> b!1396228 (= e!790446 (Intermediate!10411 true (toIndex!0 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150823 () Bool)

(assert (=> d!150823 e!790448))

(declare-fun c!129949 () Bool)

(assert (=> d!150823 (= c!129949 (and (is-Intermediate!10411 lt!613299) (undefined!11223 lt!613299)))))

(assert (=> d!150823 (= lt!613299 e!790446)))

(declare-fun c!129951 () Bool)

(assert (=> d!150823 (= c!129951 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150823 (= lt!613298 (select (arr!46094 (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901))) (toIndex!0 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150823 (validMask!0 mask!2840)))

(assert (=> d!150823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901)) mask!2840) lt!613299)))

(declare-fun b!1396222 () Bool)

(assert (=> b!1396222 (and (bvsge (index!44017 lt!613299) #b00000000000000000000000000000000) (bvslt (index!44017 lt!613299) (size!46644 (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901)))))))

(declare-fun res!935237 () Bool)

(assert (=> b!1396222 (= res!935237 (= (select (arr!46094 (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901))) (index!44017 lt!613299)) (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!790444 () Bool)

(assert (=> b!1396222 (=> res!935237 e!790444)))

(assert (=> b!1396222 (= e!790447 e!790444)))

(declare-fun b!1396229 () Bool)

(assert (=> b!1396229 (and (bvsge (index!44017 lt!613299) #b00000000000000000000000000000000) (bvslt (index!44017 lt!613299) (size!46644 (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901)))))))

(assert (=> b!1396229 (= e!790444 (= (select (arr!46094 (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901))) (index!44017 lt!613299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1396230 () Bool)

(assert (=> b!1396230 (and (bvsge (index!44017 lt!613299) #b00000000000000000000000000000000) (bvslt (index!44017 lt!613299) (size!46644 (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901)))))))

(declare-fun res!935235 () Bool)

(assert (=> b!1396230 (= res!935235 (= (select (arr!46094 (array!95479 (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46644 a!2901))) (index!44017 lt!613299)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396230 (=> res!935235 e!790444)))

(assert (= (and d!150823 c!129951) b!1396228))

(assert (= (and d!150823 (not c!129951)) b!1396225))

(assert (= (and b!1396225 c!129950) b!1396227))

(assert (= (and b!1396225 (not c!129950)) b!1396226))

(assert (= (and d!150823 c!129949) b!1396223))

(assert (= (and d!150823 (not c!129949)) b!1396224))

(assert (= (and b!1396224 res!935236) b!1396222))

(assert (= (and b!1396222 (not res!935237)) b!1396230))

(assert (= (and b!1396230 (not res!935235)) b!1396229))

(assert (=> b!1396226 m!1282571))

(declare-fun m!1282709 () Bool)

(assert (=> b!1396226 m!1282709))

(assert (=> b!1396226 m!1282709))

(assert (=> b!1396226 m!1282569))

(declare-fun m!1282711 () Bool)

(assert (=> b!1396226 m!1282711))

(declare-fun m!1282713 () Bool)

(assert (=> b!1396229 m!1282713))

(assert (=> d!150823 m!1282571))

(declare-fun m!1282715 () Bool)

(assert (=> d!150823 m!1282715))

(assert (=> d!150823 m!1282563))

(assert (=> b!1396222 m!1282713))

(assert (=> b!1396230 m!1282713))

(assert (=> b!1396065 d!150823))

(declare-fun d!150837 () Bool)

(declare-fun lt!613308 () (_ BitVec 32))

(declare-fun lt!613307 () (_ BitVec 32))

(assert (=> d!150837 (= lt!613308 (bvmul (bvxor lt!613307 (bvlshr lt!613307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150837 (= lt!613307 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150837 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935244 (let ((h!33852 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125689 (bvmul (bvxor h!33852 (bvlshr h!33852 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125689 (bvlshr x!125689 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935244 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935244 #b00000000000000000000000000000000))))))

(assert (=> d!150837 (= (toIndex!0 (select (store (arr!46094 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613308 (bvlshr lt!613308 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396065 d!150837))

(declare-fun b!1396264 () Bool)

(declare-fun e!790475 () Bool)

(declare-fun e!790478 () Bool)

(assert (=> b!1396264 (= e!790475 e!790478)))

(declare-fun c!129959 () Bool)

(assert (=> b!1396264 (= c!129959 (validKeyInArray!0 (select (arr!46094 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396265 () Bool)

(declare-fun call!66861 () Bool)

(assert (=> b!1396265 (= e!790478 call!66861)))

(declare-fun bm!66858 () Bool)

(assert (=> bm!66858 (= call!66861 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129959 (Cons!32609 (select (arr!46094 a!2901) #b00000000000000000000000000000000) Nil!32610) Nil!32610)))))

(declare-fun b!1396266 () Bool)

(assert (=> b!1396266 (= e!790478 call!66861)))

(declare-fun d!150843 () Bool)

(declare-fun res!935260 () Bool)

(declare-fun e!790477 () Bool)

(assert (=> d!150843 (=> res!935260 e!790477)))

(assert (=> d!150843 (= res!935260 (bvsge #b00000000000000000000000000000000 (size!46644 a!2901)))))

(assert (=> d!150843 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32610) e!790477)))

(declare-fun b!1396267 () Bool)

(assert (=> b!1396267 (= e!790477 e!790475)))

(declare-fun res!935259 () Bool)

(assert (=> b!1396267 (=> (not res!935259) (not e!790475))))

(declare-fun e!790476 () Bool)

(assert (=> b!1396267 (= res!935259 (not e!790476))))

(declare-fun res!935258 () Bool)

(assert (=> b!1396267 (=> (not res!935258) (not e!790476))))

(assert (=> b!1396267 (= res!935258 (validKeyInArray!0 (select (arr!46094 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396268 () Bool)

(declare-fun contains!9781 (List!32613 (_ BitVec 64)) Bool)

(assert (=> b!1396268 (= e!790476 (contains!9781 Nil!32610 (select (arr!46094 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150843 (not res!935260)) b!1396267))

(assert (= (and b!1396267 res!935258) b!1396268))

(assert (= (and b!1396267 res!935259) b!1396264))

(assert (= (and b!1396264 c!129959) b!1396266))

(assert (= (and b!1396264 (not c!129959)) b!1396265))

(assert (= (or b!1396266 b!1396265) bm!66858))

(assert (=> b!1396264 m!1282683))

(assert (=> b!1396264 m!1282683))

(assert (=> b!1396264 m!1282685))

(assert (=> bm!66858 m!1282683))

(declare-fun m!1282727 () Bool)

(assert (=> bm!66858 m!1282727))

(assert (=> b!1396267 m!1282683))

(assert (=> b!1396267 m!1282683))

(assert (=> b!1396267 m!1282685))

(assert (=> b!1396268 m!1282683))

(assert (=> b!1396268 m!1282683))

(declare-fun m!1282729 () Bool)

(assert (=> b!1396268 m!1282729))

(assert (=> b!1396067 d!150843))

(declare-fun b!1396338 () Bool)

(declare-fun e!790519 () SeekEntryResult!10411)

(declare-fun lt!613353 () SeekEntryResult!10411)

(assert (=> b!1396338 (= e!790519 (MissingZero!10411 (index!44017 lt!613353)))))

(declare-fun b!1396339 () Bool)

(declare-fun c!129983 () Bool)

(declare-fun lt!613355 () (_ BitVec 64))

(assert (=> b!1396339 (= c!129983 (= lt!613355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790520 () SeekEntryResult!10411)

(assert (=> b!1396339 (= e!790520 e!790519)))

(declare-fun d!150845 () Bool)

(declare-fun lt!613354 () SeekEntryResult!10411)

(assert (=> d!150845 (and (or (is-Undefined!10411 lt!613354) (not (is-Found!10411 lt!613354)) (and (bvsge (index!44016 lt!613354) #b00000000000000000000000000000000) (bvslt (index!44016 lt!613354) (size!46644 a!2901)))) (or (is-Undefined!10411 lt!613354) (is-Found!10411 lt!613354) (not (is-MissingZero!10411 lt!613354)) (and (bvsge (index!44015 lt!613354) #b00000000000000000000000000000000) (bvslt (index!44015 lt!613354) (size!46644 a!2901)))) (or (is-Undefined!10411 lt!613354) (is-Found!10411 lt!613354) (is-MissingZero!10411 lt!613354) (not (is-MissingVacant!10411 lt!613354)) (and (bvsge (index!44018 lt!613354) #b00000000000000000000000000000000) (bvslt (index!44018 lt!613354) (size!46644 a!2901)))) (or (is-Undefined!10411 lt!613354) (ite (is-Found!10411 lt!613354) (= (select (arr!46094 a!2901) (index!44016 lt!613354)) (select (arr!46094 a!2901) j!112)) (ite (is-MissingZero!10411 lt!613354) (= (select (arr!46094 a!2901) (index!44015 lt!613354)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10411 lt!613354) (= (select (arr!46094 a!2901) (index!44018 lt!613354)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!790521 () SeekEntryResult!10411)

(assert (=> d!150845 (= lt!613354 e!790521)))

(declare-fun c!129985 () Bool)

(assert (=> d!150845 (= c!129985 (and (is-Intermediate!10411 lt!613353) (undefined!11223 lt!613353)))))

(assert (=> d!150845 (= lt!613353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840) (select (arr!46094 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150845 (validMask!0 mask!2840)))

(assert (=> d!150845 (= (seekEntryOrOpen!0 (select (arr!46094 a!2901) j!112) a!2901 mask!2840) lt!613354)))

(declare-fun b!1396340 () Bool)

(assert (=> b!1396340 (= e!790521 Undefined!10411)))

(declare-fun b!1396341 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95478 (_ BitVec 32)) SeekEntryResult!10411)

(assert (=> b!1396341 (= e!790519 (seekKeyOrZeroReturnVacant!0 (x!125683 lt!613353) (index!44017 lt!613353) (index!44017 lt!613353) (select (arr!46094 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396342 () Bool)

(assert (=> b!1396342 (= e!790520 (Found!10411 (index!44017 lt!613353)))))

(declare-fun b!1396343 () Bool)

(assert (=> b!1396343 (= e!790521 e!790520)))

(assert (=> b!1396343 (= lt!613355 (select (arr!46094 a!2901) (index!44017 lt!613353)))))

(declare-fun c!129986 () Bool)

(assert (=> b!1396343 (= c!129986 (= lt!613355 (select (arr!46094 a!2901) j!112)))))

(assert (= (and d!150845 c!129985) b!1396340))

(assert (= (and d!150845 (not c!129985)) b!1396343))

(assert (= (and b!1396343 c!129986) b!1396342))

(assert (= (and b!1396343 (not c!129986)) b!1396339))

(assert (= (and b!1396339 c!129983) b!1396338))

(assert (= (and b!1396339 (not c!129983)) b!1396341))

(declare-fun m!1282777 () Bool)

(assert (=> d!150845 m!1282777))

(assert (=> d!150845 m!1282579))

(assert (=> d!150845 m!1282577))

(assert (=> d!150845 m!1282583))

(assert (=> d!150845 m!1282577))

(assert (=> d!150845 m!1282579))

(declare-fun m!1282781 () Bool)

(assert (=> d!150845 m!1282781))

(assert (=> d!150845 m!1282563))

(declare-fun m!1282783 () Bool)

(assert (=> d!150845 m!1282783))

(assert (=> b!1396341 m!1282577))

(declare-fun m!1282785 () Bool)

(assert (=> b!1396341 m!1282785))

(declare-fun m!1282787 () Bool)

(assert (=> b!1396343 m!1282787))

(assert (=> b!1396068 d!150845))

(declare-fun b!1396344 () Bool)

(declare-fun e!790524 () Bool)

(declare-fun e!790523 () Bool)

(assert (=> b!1396344 (= e!790524 e!790523)))

(declare-fun c!129987 () Bool)

(assert (=> b!1396344 (= c!129987 (validKeyInArray!0 (select (arr!46094 a!2901) j!112)))))

(declare-fun d!150875 () Bool)

(declare-fun res!935283 () Bool)

(assert (=> d!150875 (=> res!935283 e!790524)))

(assert (=> d!150875 (= res!935283 (bvsge j!112 (size!46644 a!2901)))))

(assert (=> d!150875 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790524)))

(declare-fun b!1396345 () Bool)

(declare-fun call!66865 () Bool)

(assert (=> b!1396345 (= e!790523 call!66865)))

(declare-fun b!1396346 () Bool)

(declare-fun e!790522 () Bool)

(assert (=> b!1396346 (= e!790522 call!66865)))

(declare-fun bm!66862 () Bool)

(assert (=> bm!66862 (= call!66865 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396347 () Bool)

(assert (=> b!1396347 (= e!790523 e!790522)))

(declare-fun lt!613356 () (_ BitVec 64))

(assert (=> b!1396347 (= lt!613356 (select (arr!46094 a!2901) j!112))))

(declare-fun lt!613358 () Unit!46826)

(assert (=> b!1396347 (= lt!613358 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613356 j!112))))

(assert (=> b!1396347 (arrayContainsKey!0 a!2901 lt!613356 #b00000000000000000000000000000000)))

(declare-fun lt!613357 () Unit!46826)

(assert (=> b!1396347 (= lt!613357 lt!613358)))

(declare-fun res!935284 () Bool)

(assert (=> b!1396347 (= res!935284 (= (seekEntryOrOpen!0 (select (arr!46094 a!2901) j!112) a!2901 mask!2840) (Found!10411 j!112)))))

(assert (=> b!1396347 (=> (not res!935284) (not e!790522))))

(assert (= (and d!150875 (not res!935283)) b!1396344))

(assert (= (and b!1396344 c!129987) b!1396347))

(assert (= (and b!1396344 (not c!129987)) b!1396345))

(assert (= (and b!1396347 res!935284) b!1396346))

(assert (= (or b!1396346 b!1396345) bm!66862))

(assert (=> b!1396344 m!1282577))

(assert (=> b!1396344 m!1282577))

(assert (=> b!1396344 m!1282593))

(declare-fun m!1282789 () Bool)

(assert (=> bm!66862 m!1282789))

(assert (=> b!1396347 m!1282577))

(declare-fun m!1282791 () Bool)

(assert (=> b!1396347 m!1282791))

(declare-fun m!1282793 () Bool)

(assert (=> b!1396347 m!1282793))

(assert (=> b!1396347 m!1282577))

(assert (=> b!1396347 m!1282595))

(assert (=> b!1396070 d!150875))

(declare-fun d!150877 () Bool)

(assert (=> d!150877 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613361 () Unit!46826)

(declare-fun choose!38 (array!95478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46826)

(assert (=> d!150877 (= lt!613361 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150877 (validMask!0 mask!2840)))

(assert (=> d!150877 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613361)))

(declare-fun bs!40633 () Bool)

(assert (= bs!40633 d!150877))

(assert (=> bs!40633 m!1282585))

(declare-fun m!1282795 () Bool)

(assert (=> bs!40633 m!1282795))

(assert (=> bs!40633 m!1282563))

(assert (=> b!1396070 d!150877))

(declare-fun b!1396349 () Bool)

(declare-fun e!790529 () Bool)

(declare-fun lt!613363 () SeekEntryResult!10411)

(assert (=> b!1396349 (= e!790529 (bvsge (x!125683 lt!613363) #b01111111111111111111111111111110))))

(declare-fun b!1396350 () Bool)

(declare-fun e!790528 () Bool)

(assert (=> b!1396350 (= e!790529 e!790528)))

(declare-fun res!935286 () Bool)

(assert (=> b!1396350 (= res!935286 (and (is-Intermediate!10411 lt!613363) (not (undefined!11223 lt!613363)) (bvslt (x!125683 lt!613363) #b01111111111111111111111111111110) (bvsge (x!125683 lt!613363) #b00000000000000000000000000000000) (bvsge (x!125683 lt!613363) #b00000000000000000000000000000000)))))

(assert (=> b!1396350 (=> (not res!935286) (not e!790528))))

(declare-fun b!1396351 () Bool)

(declare-fun e!790527 () SeekEntryResult!10411)

(declare-fun e!790526 () SeekEntryResult!10411)

(assert (=> b!1396351 (= e!790527 e!790526)))

(declare-fun lt!613362 () (_ BitVec 64))

(declare-fun c!129989 () Bool)

(assert (=> b!1396351 (= c!129989 (or (= lt!613362 (select (arr!46094 a!2901) j!112)) (= (bvadd lt!613362 lt!613362) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396352 () Bool)

(assert (=> b!1396352 (= e!790526 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46094 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396353 () Bool)

(assert (=> b!1396353 (= e!790526 (Intermediate!10411 false (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396354 () Bool)

(assert (=> b!1396354 (= e!790527 (Intermediate!10411 true (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150879 () Bool)

(assert (=> d!150879 e!790529))

(declare-fun c!129988 () Bool)

(assert (=> d!150879 (= c!129988 (and (is-Intermediate!10411 lt!613363) (undefined!11223 lt!613363)))))

(assert (=> d!150879 (= lt!613363 e!790527)))

(declare-fun c!129990 () Bool)

(assert (=> d!150879 (= c!129990 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150879 (= lt!613362 (select (arr!46094 a!2901) (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840)))))

(assert (=> d!150879 (validMask!0 mask!2840)))

(assert (=> d!150879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840) (select (arr!46094 a!2901) j!112) a!2901 mask!2840) lt!613363)))

(declare-fun b!1396348 () Bool)

(assert (=> b!1396348 (and (bvsge (index!44017 lt!613363) #b00000000000000000000000000000000) (bvslt (index!44017 lt!613363) (size!46644 a!2901)))))

(declare-fun res!935287 () Bool)

(assert (=> b!1396348 (= res!935287 (= (select (arr!46094 a!2901) (index!44017 lt!613363)) (select (arr!46094 a!2901) j!112)))))

(declare-fun e!790525 () Bool)

(assert (=> b!1396348 (=> res!935287 e!790525)))

(assert (=> b!1396348 (= e!790528 e!790525)))

(declare-fun b!1396355 () Bool)

(assert (=> b!1396355 (and (bvsge (index!44017 lt!613363) #b00000000000000000000000000000000) (bvslt (index!44017 lt!613363) (size!46644 a!2901)))))

(assert (=> b!1396355 (= e!790525 (= (select (arr!46094 a!2901) (index!44017 lt!613363)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1396356 () Bool)

(assert (=> b!1396356 (and (bvsge (index!44017 lt!613363) #b00000000000000000000000000000000) (bvslt (index!44017 lt!613363) (size!46644 a!2901)))))

(declare-fun res!935285 () Bool)

(assert (=> b!1396356 (= res!935285 (= (select (arr!46094 a!2901) (index!44017 lt!613363)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396356 (=> res!935285 e!790525)))

(assert (= (and d!150879 c!129990) b!1396354))

(assert (= (and d!150879 (not c!129990)) b!1396351))

(assert (= (and b!1396351 c!129989) b!1396353))

(assert (= (and b!1396351 (not c!129989)) b!1396352))

(assert (= (and d!150879 c!129988) b!1396349))

(assert (= (and d!150879 (not c!129988)) b!1396350))

(assert (= (and b!1396350 res!935286) b!1396348))

(assert (= (and b!1396348 (not res!935287)) b!1396356))

(assert (= (and b!1396356 (not res!935285)) b!1396355))

(assert (=> b!1396352 m!1282579))

(declare-fun m!1282797 () Bool)

(assert (=> b!1396352 m!1282797))

(assert (=> b!1396352 m!1282797))

(assert (=> b!1396352 m!1282577))

(declare-fun m!1282799 () Bool)

(assert (=> b!1396352 m!1282799))

(declare-fun m!1282801 () Bool)

(assert (=> b!1396355 m!1282801))

(assert (=> d!150879 m!1282579))

(declare-fun m!1282803 () Bool)

(assert (=> d!150879 m!1282803))

(assert (=> d!150879 m!1282563))

(assert (=> b!1396348 m!1282801))

(assert (=> b!1396356 m!1282801))

(assert (=> b!1396070 d!150879))

(declare-fun d!150881 () Bool)

(declare-fun lt!613365 () (_ BitVec 32))

(declare-fun lt!613364 () (_ BitVec 32))

(assert (=> d!150881 (= lt!613365 (bvmul (bvxor lt!613364 (bvlshr lt!613364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150881 (= lt!613364 ((_ extract 31 0) (bvand (bvxor (select (arr!46094 a!2901) j!112) (bvlshr (select (arr!46094 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150881 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935244 (let ((h!33852 ((_ extract 31 0) (bvand (bvxor (select (arr!46094 a!2901) j!112) (bvlshr (select (arr!46094 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125689 (bvmul (bvxor h!33852 (bvlshr h!33852 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125689 (bvlshr x!125689 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935244 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935244 #b00000000000000000000000000000000))))))

(assert (=> d!150881 (= (toIndex!0 (select (arr!46094 a!2901) j!112) mask!2840) (bvand (bvxor lt!613365 (bvlshr lt!613365 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396070 d!150881))

(declare-fun d!150883 () Bool)

(assert (=> d!150883 (= (validKeyInArray!0 (select (arr!46094 a!2901) j!112)) (and (not (= (select (arr!46094 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46094 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396069 d!150883))

(push 1)

(assert (not b!1396164))

(assert (not bm!66858))

(assert (not d!150845))

(assert (not bm!66862))

(assert (not b!1396268))

(assert (not b!1396264))

(assert (not b!1396341))

(assert (not b!1396352))

(assert (not d!150877))

(assert (not b!1396344))

(assert (not b!1396347))

(assert (not b!1396161))

(assert (not d!150879))

(assert (not bm!66847))

(assert (not d!150823))

(assert (not b!1396267))

(assert (not b!1396226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

