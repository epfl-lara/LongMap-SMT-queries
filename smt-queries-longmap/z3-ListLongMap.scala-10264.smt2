; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120692 () Bool)

(assert start!120692)

(declare-fun b!1404762 () Bool)

(declare-fun e!795221 () Bool)

(declare-datatypes ((SeekEntryResult!10685 0))(
  ( (MissingZero!10685 (index!45117 (_ BitVec 32))) (Found!10685 (index!45118 (_ BitVec 32))) (Intermediate!10685 (undefined!11497 Bool) (index!45119 (_ BitVec 32)) (x!126734 (_ BitVec 32))) (Undefined!10685) (MissingVacant!10685 (index!45120 (_ BitVec 32))) )
))
(declare-fun lt!618791 () SeekEntryResult!10685)

(get-info :version)

(assert (=> b!1404762 (= e!795221 (not (or (not ((_ is Intermediate!10685) lt!618791)) (not (undefined!11497 lt!618791)))))))

(declare-fun e!795219 () Bool)

(assert (=> b!1404762 e!795219))

(declare-fun res!943126 () Bool)

(assert (=> b!1404762 (=> (not res!943126) (not e!795219))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96050 0))(
  ( (array!96051 (arr!46374 (Array (_ BitVec 32) (_ BitVec 64))) (size!46924 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96050)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96050 (_ BitVec 32)) Bool)

(assert (=> b!1404762 (= res!943126 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47344 0))(
  ( (Unit!47345) )
))
(declare-fun lt!618792 () Unit!47344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47344)

(assert (=> b!1404762 (= lt!618792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96050 (_ BitVec 32)) SeekEntryResult!10685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404762 (= lt!618791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) (select (arr!46374 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943127 () Bool)

(assert (=> start!120692 (=> (not res!943127) (not e!795221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120692 (= res!943127 (validMask!0 mask!2840))))

(assert (=> start!120692 e!795221))

(assert (=> start!120692 true))

(declare-fun array_inv!35402 (array!96050) Bool)

(assert (=> start!120692 (array_inv!35402 a!2901)))

(declare-fun b!1404763 () Bool)

(declare-fun res!943128 () Bool)

(assert (=> b!1404763 (=> (not res!943128) (not e!795221))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404763 (= res!943128 (and (= (size!46924 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46924 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46924 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404764 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96050 (_ BitVec 32)) SeekEntryResult!10685)

(assert (=> b!1404764 (= e!795219 (= (seekEntryOrOpen!0 (select (arr!46374 a!2901) j!112) a!2901 mask!2840) (Found!10685 j!112)))))

(declare-fun b!1404765 () Bool)

(declare-fun res!943129 () Bool)

(assert (=> b!1404765 (=> (not res!943129) (not e!795221))))

(assert (=> b!1404765 (= res!943129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404766 () Bool)

(declare-fun res!943132 () Bool)

(assert (=> b!1404766 (=> (not res!943132) (not e!795221))))

(declare-datatypes ((List!32893 0))(
  ( (Nil!32890) (Cons!32889 (h!34140 (_ BitVec 64)) (t!47587 List!32893)) )
))
(declare-fun arrayNoDuplicates!0 (array!96050 (_ BitVec 32) List!32893) Bool)

(assert (=> b!1404766 (= res!943132 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32890))))

(declare-fun b!1404767 () Bool)

(declare-fun res!943131 () Bool)

(assert (=> b!1404767 (=> (not res!943131) (not e!795221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404767 (= res!943131 (validKeyInArray!0 (select (arr!46374 a!2901) i!1037)))))

(declare-fun b!1404768 () Bool)

(declare-fun res!943130 () Bool)

(assert (=> b!1404768 (=> (not res!943130) (not e!795221))))

(assert (=> b!1404768 (= res!943130 (validKeyInArray!0 (select (arr!46374 a!2901) j!112)))))

(assert (= (and start!120692 res!943127) b!1404763))

(assert (= (and b!1404763 res!943128) b!1404767))

(assert (= (and b!1404767 res!943131) b!1404768))

(assert (= (and b!1404768 res!943130) b!1404765))

(assert (= (and b!1404765 res!943129) b!1404766))

(assert (= (and b!1404766 res!943132) b!1404762))

(assert (= (and b!1404762 res!943126) b!1404764))

(declare-fun m!1293539 () Bool)

(assert (=> b!1404765 m!1293539))

(declare-fun m!1293541 () Bool)

(assert (=> b!1404767 m!1293541))

(assert (=> b!1404767 m!1293541))

(declare-fun m!1293543 () Bool)

(assert (=> b!1404767 m!1293543))

(declare-fun m!1293545 () Bool)

(assert (=> b!1404768 m!1293545))

(assert (=> b!1404768 m!1293545))

(declare-fun m!1293547 () Bool)

(assert (=> b!1404768 m!1293547))

(declare-fun m!1293549 () Bool)

(assert (=> b!1404766 m!1293549))

(assert (=> b!1404762 m!1293545))

(declare-fun m!1293551 () Bool)

(assert (=> b!1404762 m!1293551))

(assert (=> b!1404762 m!1293545))

(declare-fun m!1293553 () Bool)

(assert (=> b!1404762 m!1293553))

(assert (=> b!1404762 m!1293551))

(assert (=> b!1404762 m!1293545))

(declare-fun m!1293555 () Bool)

(assert (=> b!1404762 m!1293555))

(declare-fun m!1293557 () Bool)

(assert (=> b!1404762 m!1293557))

(declare-fun m!1293559 () Bool)

(assert (=> start!120692 m!1293559))

(declare-fun m!1293561 () Bool)

(assert (=> start!120692 m!1293561))

(assert (=> b!1404764 m!1293545))

(assert (=> b!1404764 m!1293545))

(declare-fun m!1293563 () Bool)

(assert (=> b!1404764 m!1293563))

(check-sat (not b!1404765) (not b!1404764) (not b!1404762) (not b!1404768) (not b!1404766) (not b!1404767) (not start!120692))
(check-sat)
(get-model)

(declare-fun d!151317 () Bool)

(assert (=> d!151317 (= (validKeyInArray!0 (select (arr!46374 a!2901) i!1037)) (and (not (= (select (arr!46374 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46374 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404767 d!151317))

(declare-fun bm!66930 () Bool)

(declare-fun call!66933 () Bool)

(declare-fun c!130283 () Bool)

(assert (=> bm!66930 (= call!66933 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130283 (Cons!32889 (select (arr!46374 a!2901) #b00000000000000000000000000000000) Nil!32890) Nil!32890)))))

(declare-fun b!1404808 () Bool)

(declare-fun e!795248 () Bool)

(assert (=> b!1404808 (= e!795248 call!66933)))

(declare-fun d!151319 () Bool)

(declare-fun res!943164 () Bool)

(declare-fun e!795247 () Bool)

(assert (=> d!151319 (=> res!943164 e!795247)))

(assert (=> d!151319 (= res!943164 (bvsge #b00000000000000000000000000000000 (size!46924 a!2901)))))

(assert (=> d!151319 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32890) e!795247)))

(declare-fun b!1404809 () Bool)

(assert (=> b!1404809 (= e!795248 call!66933)))

(declare-fun b!1404810 () Bool)

(declare-fun e!795245 () Bool)

(assert (=> b!1404810 (= e!795245 e!795248)))

(assert (=> b!1404810 (= c!130283 (validKeyInArray!0 (select (arr!46374 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404811 () Bool)

(assert (=> b!1404811 (= e!795247 e!795245)))

(declare-fun res!943166 () Bool)

(assert (=> b!1404811 (=> (not res!943166) (not e!795245))))

(declare-fun e!795246 () Bool)

(assert (=> b!1404811 (= res!943166 (not e!795246))))

(declare-fun res!943165 () Bool)

(assert (=> b!1404811 (=> (not res!943165) (not e!795246))))

(assert (=> b!1404811 (= res!943165 (validKeyInArray!0 (select (arr!46374 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404812 () Bool)

(declare-fun contains!9791 (List!32893 (_ BitVec 64)) Bool)

(assert (=> b!1404812 (= e!795246 (contains!9791 Nil!32890 (select (arr!46374 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151319 (not res!943164)) b!1404811))

(assert (= (and b!1404811 res!943165) b!1404812))

(assert (= (and b!1404811 res!943166) b!1404810))

(assert (= (and b!1404810 c!130283) b!1404808))

(assert (= (and b!1404810 (not c!130283)) b!1404809))

(assert (= (or b!1404808 b!1404809) bm!66930))

(declare-fun m!1293591 () Bool)

(assert (=> bm!66930 m!1293591))

(declare-fun m!1293593 () Bool)

(assert (=> bm!66930 m!1293593))

(assert (=> b!1404810 m!1293591))

(assert (=> b!1404810 m!1293591))

(declare-fun m!1293595 () Bool)

(assert (=> b!1404810 m!1293595))

(assert (=> b!1404811 m!1293591))

(assert (=> b!1404811 m!1293591))

(assert (=> b!1404811 m!1293595))

(assert (=> b!1404812 m!1293591))

(assert (=> b!1404812 m!1293591))

(declare-fun m!1293597 () Bool)

(assert (=> b!1404812 m!1293597))

(assert (=> b!1404766 d!151319))

(declare-fun d!151325 () Bool)

(assert (=> d!151325 (= (validKeyInArray!0 (select (arr!46374 a!2901) j!112)) (and (not (= (select (arr!46374 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46374 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404768 d!151325))

(declare-fun d!151327 () Bool)

(declare-fun res!943174 () Bool)

(declare-fun e!795259 () Bool)

(assert (=> d!151327 (=> res!943174 e!795259)))

(assert (=> d!151327 (= res!943174 (bvsge j!112 (size!46924 a!2901)))))

(assert (=> d!151327 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795259)))

(declare-fun b!1404825 () Bool)

(declare-fun e!795258 () Bool)

(declare-fun call!66937 () Bool)

(assert (=> b!1404825 (= e!795258 call!66937)))

(declare-fun b!1404826 () Bool)

(assert (=> b!1404826 (= e!795259 e!795258)))

(declare-fun c!130287 () Bool)

(assert (=> b!1404826 (= c!130287 (validKeyInArray!0 (select (arr!46374 a!2901) j!112)))))

(declare-fun b!1404827 () Bool)

(declare-fun e!795260 () Bool)

(assert (=> b!1404827 (= e!795258 e!795260)))

(declare-fun lt!618819 () (_ BitVec 64))

(assert (=> b!1404827 (= lt!618819 (select (arr!46374 a!2901) j!112))))

(declare-fun lt!618818 () Unit!47344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96050 (_ BitVec 64) (_ BitVec 32)) Unit!47344)

(assert (=> b!1404827 (= lt!618818 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618819 j!112))))

(declare-fun arrayContainsKey!0 (array!96050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404827 (arrayContainsKey!0 a!2901 lt!618819 #b00000000000000000000000000000000)))

(declare-fun lt!618817 () Unit!47344)

(assert (=> b!1404827 (= lt!618817 lt!618818)))

(declare-fun res!943173 () Bool)

(assert (=> b!1404827 (= res!943173 (= (seekEntryOrOpen!0 (select (arr!46374 a!2901) j!112) a!2901 mask!2840) (Found!10685 j!112)))))

(assert (=> b!1404827 (=> (not res!943173) (not e!795260))))

(declare-fun b!1404828 () Bool)

(assert (=> b!1404828 (= e!795260 call!66937)))

(declare-fun bm!66934 () Bool)

(assert (=> bm!66934 (= call!66937 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151327 (not res!943174)) b!1404826))

(assert (= (and b!1404826 c!130287) b!1404827))

(assert (= (and b!1404826 (not c!130287)) b!1404825))

(assert (= (and b!1404827 res!943173) b!1404828))

(assert (= (or b!1404828 b!1404825) bm!66934))

(assert (=> b!1404826 m!1293545))

(assert (=> b!1404826 m!1293545))

(assert (=> b!1404826 m!1293547))

(assert (=> b!1404827 m!1293545))

(declare-fun m!1293607 () Bool)

(assert (=> b!1404827 m!1293607))

(declare-fun m!1293609 () Bool)

(assert (=> b!1404827 m!1293609))

(assert (=> b!1404827 m!1293545))

(assert (=> b!1404827 m!1293563))

(declare-fun m!1293611 () Bool)

(assert (=> bm!66934 m!1293611))

(assert (=> b!1404762 d!151327))

(declare-fun d!151337 () Bool)

(assert (=> d!151337 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618822 () Unit!47344)

(declare-fun choose!38 (array!96050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47344)

(assert (=> d!151337 (= lt!618822 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151337 (validMask!0 mask!2840)))

(assert (=> d!151337 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618822)))

(declare-fun bs!40929 () Bool)

(assert (= bs!40929 d!151337))

(assert (=> bs!40929 m!1293557))

(declare-fun m!1293613 () Bool)

(assert (=> bs!40929 m!1293613))

(assert (=> bs!40929 m!1293559))

(assert (=> b!1404762 d!151337))

(declare-fun b!1404909 () Bool)

(declare-fun e!795313 () SeekEntryResult!10685)

(assert (=> b!1404909 (= e!795313 (Intermediate!10685 false (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404910 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404910 (= e!795313 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46374 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404911 () Bool)

(declare-fun e!795316 () SeekEntryResult!10685)

(assert (=> b!1404911 (= e!795316 e!795313)))

(declare-fun lt!618857 () (_ BitVec 64))

(declare-fun c!130312 () Bool)

(assert (=> b!1404911 (= c!130312 (or (= lt!618857 (select (arr!46374 a!2901) j!112)) (= (bvadd lt!618857 lt!618857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151339 () Bool)

(declare-fun e!795314 () Bool)

(assert (=> d!151339 e!795314))

(declare-fun c!130311 () Bool)

(declare-fun lt!618858 () SeekEntryResult!10685)

(assert (=> d!151339 (= c!130311 (and ((_ is Intermediate!10685) lt!618858) (undefined!11497 lt!618858)))))

(assert (=> d!151339 (= lt!618858 e!795316)))

(declare-fun c!130313 () Bool)

(assert (=> d!151339 (= c!130313 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151339 (= lt!618857 (select (arr!46374 a!2901) (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840)))))

(assert (=> d!151339 (validMask!0 mask!2840)))

(assert (=> d!151339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) (select (arr!46374 a!2901) j!112) a!2901 mask!2840) lt!618858)))

(declare-fun b!1404912 () Bool)

(assert (=> b!1404912 (and (bvsge (index!45119 lt!618858) #b00000000000000000000000000000000) (bvslt (index!45119 lt!618858) (size!46924 a!2901)))))

(declare-fun res!943210 () Bool)

(assert (=> b!1404912 (= res!943210 (= (select (arr!46374 a!2901) (index!45119 lt!618858)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795315 () Bool)

(assert (=> b!1404912 (=> res!943210 e!795315)))

(declare-fun b!1404913 () Bool)

(assert (=> b!1404913 (= e!795316 (Intermediate!10685 true (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404914 () Bool)

(assert (=> b!1404914 (and (bvsge (index!45119 lt!618858) #b00000000000000000000000000000000) (bvslt (index!45119 lt!618858) (size!46924 a!2901)))))

(assert (=> b!1404914 (= e!795315 (= (select (arr!46374 a!2901) (index!45119 lt!618858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404915 () Bool)

(declare-fun e!795317 () Bool)

(assert (=> b!1404915 (= e!795314 e!795317)))

(declare-fun res!943212 () Bool)

(assert (=> b!1404915 (= res!943212 (and ((_ is Intermediate!10685) lt!618858) (not (undefined!11497 lt!618858)) (bvslt (x!126734 lt!618858) #b01111111111111111111111111111110) (bvsge (x!126734 lt!618858) #b00000000000000000000000000000000) (bvsge (x!126734 lt!618858) #b00000000000000000000000000000000)))))

(assert (=> b!1404915 (=> (not res!943212) (not e!795317))))

(declare-fun b!1404916 () Bool)

(assert (=> b!1404916 (= e!795314 (bvsge (x!126734 lt!618858) #b01111111111111111111111111111110))))

(declare-fun b!1404917 () Bool)

(assert (=> b!1404917 (and (bvsge (index!45119 lt!618858) #b00000000000000000000000000000000) (bvslt (index!45119 lt!618858) (size!46924 a!2901)))))

(declare-fun res!943211 () Bool)

(assert (=> b!1404917 (= res!943211 (= (select (arr!46374 a!2901) (index!45119 lt!618858)) (select (arr!46374 a!2901) j!112)))))

(assert (=> b!1404917 (=> res!943211 e!795315)))

(assert (=> b!1404917 (= e!795317 e!795315)))

(assert (= (and d!151339 c!130313) b!1404913))

(assert (= (and d!151339 (not c!130313)) b!1404911))

(assert (= (and b!1404911 c!130312) b!1404909))

(assert (= (and b!1404911 (not c!130312)) b!1404910))

(assert (= (and d!151339 c!130311) b!1404916))

(assert (= (and d!151339 (not c!130311)) b!1404915))

(assert (= (and b!1404915 res!943212) b!1404917))

(assert (= (and b!1404917 (not res!943211)) b!1404912))

(assert (= (and b!1404912 (not res!943210)) b!1404914))

(declare-fun m!1293659 () Bool)

(assert (=> b!1404914 m!1293659))

(assert (=> d!151339 m!1293551))

(declare-fun m!1293661 () Bool)

(assert (=> d!151339 m!1293661))

(assert (=> d!151339 m!1293559))

(assert (=> b!1404912 m!1293659))

(assert (=> b!1404910 m!1293551))

(declare-fun m!1293663 () Bool)

(assert (=> b!1404910 m!1293663))

(assert (=> b!1404910 m!1293663))

(assert (=> b!1404910 m!1293545))

(declare-fun m!1293665 () Bool)

(assert (=> b!1404910 m!1293665))

(assert (=> b!1404917 m!1293659))

(assert (=> b!1404762 d!151339))

(declare-fun d!151359 () Bool)

(declare-fun lt!618864 () (_ BitVec 32))

(declare-fun lt!618863 () (_ BitVec 32))

(assert (=> d!151359 (= lt!618864 (bvmul (bvxor lt!618863 (bvlshr lt!618863 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151359 (= lt!618863 ((_ extract 31 0) (bvand (bvxor (select (arr!46374 a!2901) j!112) (bvlshr (select (arr!46374 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151359 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943213 (let ((h!34143 ((_ extract 31 0) (bvand (bvxor (select (arr!46374 a!2901) j!112) (bvlshr (select (arr!46374 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126739 (bvmul (bvxor h!34143 (bvlshr h!34143 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126739 (bvlshr x!126739 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943213 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943213 #b00000000000000000000000000000000))))))

(assert (=> d!151359 (= (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) (bvand (bvxor lt!618864 (bvlshr lt!618864 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404762 d!151359))

(declare-fun b!1404969 () Bool)

(declare-fun e!795347 () SeekEntryResult!10685)

(declare-fun lt!618891 () SeekEntryResult!10685)

(assert (=> b!1404969 (= e!795347 (MissingZero!10685 (index!45119 lt!618891)))))

(declare-fun b!1404970 () Bool)

(declare-fun e!795346 () SeekEntryResult!10685)

(assert (=> b!1404970 (= e!795346 Undefined!10685)))

(declare-fun b!1404971 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96050 (_ BitVec 32)) SeekEntryResult!10685)

(assert (=> b!1404971 (= e!795347 (seekKeyOrZeroReturnVacant!0 (x!126734 lt!618891) (index!45119 lt!618891) (index!45119 lt!618891) (select (arr!46374 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404972 () Bool)

(declare-fun c!130335 () Bool)

(declare-fun lt!618889 () (_ BitVec 64))

(assert (=> b!1404972 (= c!130335 (= lt!618889 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795345 () SeekEntryResult!10685)

(assert (=> b!1404972 (= e!795345 e!795347)))

(declare-fun b!1404973 () Bool)

(assert (=> b!1404973 (= e!795345 (Found!10685 (index!45119 lt!618891)))))

(declare-fun b!1404974 () Bool)

(assert (=> b!1404974 (= e!795346 e!795345)))

(assert (=> b!1404974 (= lt!618889 (select (arr!46374 a!2901) (index!45119 lt!618891)))))

(declare-fun c!130336 () Bool)

(assert (=> b!1404974 (= c!130336 (= lt!618889 (select (arr!46374 a!2901) j!112)))))

(declare-fun d!151361 () Bool)

(declare-fun lt!618890 () SeekEntryResult!10685)

(assert (=> d!151361 (and (or ((_ is Undefined!10685) lt!618890) (not ((_ is Found!10685) lt!618890)) (and (bvsge (index!45118 lt!618890) #b00000000000000000000000000000000) (bvslt (index!45118 lt!618890) (size!46924 a!2901)))) (or ((_ is Undefined!10685) lt!618890) ((_ is Found!10685) lt!618890) (not ((_ is MissingZero!10685) lt!618890)) (and (bvsge (index!45117 lt!618890) #b00000000000000000000000000000000) (bvslt (index!45117 lt!618890) (size!46924 a!2901)))) (or ((_ is Undefined!10685) lt!618890) ((_ is Found!10685) lt!618890) ((_ is MissingZero!10685) lt!618890) (not ((_ is MissingVacant!10685) lt!618890)) (and (bvsge (index!45120 lt!618890) #b00000000000000000000000000000000) (bvslt (index!45120 lt!618890) (size!46924 a!2901)))) (or ((_ is Undefined!10685) lt!618890) (ite ((_ is Found!10685) lt!618890) (= (select (arr!46374 a!2901) (index!45118 lt!618890)) (select (arr!46374 a!2901) j!112)) (ite ((_ is MissingZero!10685) lt!618890) (= (select (arr!46374 a!2901) (index!45117 lt!618890)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10685) lt!618890) (= (select (arr!46374 a!2901) (index!45120 lt!618890)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151361 (= lt!618890 e!795346)))

(declare-fun c!130337 () Bool)

(assert (=> d!151361 (= c!130337 (and ((_ is Intermediate!10685) lt!618891) (undefined!11497 lt!618891)))))

(assert (=> d!151361 (= lt!618891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) (select (arr!46374 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151361 (validMask!0 mask!2840)))

(assert (=> d!151361 (= (seekEntryOrOpen!0 (select (arr!46374 a!2901) j!112) a!2901 mask!2840) lt!618890)))

(assert (= (and d!151361 c!130337) b!1404970))

(assert (= (and d!151361 (not c!130337)) b!1404974))

(assert (= (and b!1404974 c!130336) b!1404973))

(assert (= (and b!1404974 (not c!130336)) b!1404972))

(assert (= (and b!1404972 c!130335) b!1404969))

(assert (= (and b!1404972 (not c!130335)) b!1404971))

(assert (=> b!1404971 m!1293545))

(declare-fun m!1293675 () Bool)

(assert (=> b!1404971 m!1293675))

(declare-fun m!1293677 () Bool)

(assert (=> b!1404974 m!1293677))

(assert (=> d!151361 m!1293551))

(assert (=> d!151361 m!1293545))

(assert (=> d!151361 m!1293555))

(declare-fun m!1293679 () Bool)

(assert (=> d!151361 m!1293679))

(assert (=> d!151361 m!1293545))

(assert (=> d!151361 m!1293551))

(declare-fun m!1293681 () Bool)

(assert (=> d!151361 m!1293681))

(declare-fun m!1293683 () Bool)

(assert (=> d!151361 m!1293683))

(assert (=> d!151361 m!1293559))

(assert (=> b!1404764 d!151361))

(declare-fun d!151371 () Bool)

(assert (=> d!151371 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120692 d!151371))

(declare-fun d!151377 () Bool)

(assert (=> d!151377 (= (array_inv!35402 a!2901) (bvsge (size!46924 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120692 d!151377))

(declare-fun d!151379 () Bool)

(declare-fun res!943231 () Bool)

(declare-fun e!795360 () Bool)

(assert (=> d!151379 (=> res!943231 e!795360)))

(assert (=> d!151379 (= res!943231 (bvsge #b00000000000000000000000000000000 (size!46924 a!2901)))))

(assert (=> d!151379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795360)))

(declare-fun b!1404991 () Bool)

(declare-fun e!795359 () Bool)

(declare-fun call!66948 () Bool)

(assert (=> b!1404991 (= e!795359 call!66948)))

(declare-fun b!1404992 () Bool)

(assert (=> b!1404992 (= e!795360 e!795359)))

(declare-fun c!130343 () Bool)

(assert (=> b!1404992 (= c!130343 (validKeyInArray!0 (select (arr!46374 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404993 () Bool)

(declare-fun e!795361 () Bool)

(assert (=> b!1404993 (= e!795359 e!795361)))

(declare-fun lt!618897 () (_ BitVec 64))

(assert (=> b!1404993 (= lt!618897 (select (arr!46374 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618896 () Unit!47344)

(assert (=> b!1404993 (= lt!618896 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618897 #b00000000000000000000000000000000))))

(assert (=> b!1404993 (arrayContainsKey!0 a!2901 lt!618897 #b00000000000000000000000000000000)))

(declare-fun lt!618895 () Unit!47344)

(assert (=> b!1404993 (= lt!618895 lt!618896)))

(declare-fun res!943230 () Bool)

(assert (=> b!1404993 (= res!943230 (= (seekEntryOrOpen!0 (select (arr!46374 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10685 #b00000000000000000000000000000000)))))

(assert (=> b!1404993 (=> (not res!943230) (not e!795361))))

(declare-fun b!1404994 () Bool)

(assert (=> b!1404994 (= e!795361 call!66948)))

(declare-fun bm!66945 () Bool)

(assert (=> bm!66945 (= call!66948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151379 (not res!943231)) b!1404992))

(assert (= (and b!1404992 c!130343) b!1404993))

(assert (= (and b!1404992 (not c!130343)) b!1404991))

(assert (= (and b!1404993 res!943230) b!1404994))

(assert (= (or b!1404994 b!1404991) bm!66945))

(assert (=> b!1404992 m!1293591))

(assert (=> b!1404992 m!1293591))

(assert (=> b!1404992 m!1293595))

(assert (=> b!1404993 m!1293591))

(declare-fun m!1293695 () Bool)

(assert (=> b!1404993 m!1293695))

(declare-fun m!1293697 () Bool)

(assert (=> b!1404993 m!1293697))

(assert (=> b!1404993 m!1293591))

(declare-fun m!1293699 () Bool)

(assert (=> b!1404993 m!1293699))

(declare-fun m!1293701 () Bool)

(assert (=> bm!66945 m!1293701))

(assert (=> b!1404765 d!151379))

(check-sat (not b!1404992) (not bm!66934) (not b!1404811) (not b!1404971) (not b!1404810) (not d!151339) (not b!1404812) (not b!1404826) (not bm!66930) (not bm!66945) (not d!151361) (not b!1404827) (not d!151337) (not b!1404993) (not b!1404910))
