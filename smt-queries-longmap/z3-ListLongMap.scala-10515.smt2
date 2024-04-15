; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123944 () Bool)

(assert start!123944)

(declare-fun b!1435841 () Bool)

(declare-fun res!968920 () Bool)

(declare-fun e!810302 () Bool)

(assert (=> b!1435841 (=> (not res!968920) (not e!810302))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97605 0))(
  ( (array!97606 (arr!47101 (Array (_ BitVec 32) (_ BitVec 64))) (size!47653 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97605)

(assert (=> b!1435841 (= res!968920 (and (= (size!47653 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47653 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47653 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435842 () Bool)

(declare-fun e!810303 () Bool)

(assert (=> b!1435842 (= e!810302 e!810303)))

(declare-fun res!968921 () Bool)

(assert (=> b!1435842 (=> res!968921 e!810303)))

(declare-datatypes ((List!33680 0))(
  ( (Nil!33677) (Cons!33676 (h!35011 (_ BitVec 64)) (t!48366 List!33680)) )
))
(declare-fun contains!9841 (List!33680 (_ BitVec 64)) Bool)

(assert (=> b!1435842 (= res!968921 (contains!9841 Nil!33677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!968918 () Bool)

(assert (=> start!123944 (=> (not res!968918) (not e!810302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123944 (= res!968918 (validMask!0 mask!2687))))

(assert (=> start!123944 e!810302))

(assert (=> start!123944 true))

(declare-fun array_inv!36334 (array!97605) Bool)

(assert (=> start!123944 (array_inv!36334 a!2862)))

(declare-fun b!1435843 () Bool)

(assert (=> b!1435843 (= e!810303 (contains!9841 Nil!33677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435844 () Bool)

(declare-fun res!968917 () Bool)

(assert (=> b!1435844 (=> (not res!968917) (not e!810302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435844 (= res!968917 (validKeyInArray!0 (select (arr!47101 a!2862) i!1006)))))

(declare-fun b!1435845 () Bool)

(declare-fun res!968916 () Bool)

(assert (=> b!1435845 (=> (not res!968916) (not e!810302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97605 (_ BitVec 32)) Bool)

(assert (=> b!1435845 (= res!968916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435846 () Bool)

(declare-fun res!968919 () Bool)

(assert (=> b!1435846 (=> (not res!968919) (not e!810302))))

(assert (=> b!1435846 (= res!968919 (and (bvsle #b00000000000000000000000000000000 (size!47653 a!2862)) (bvslt (size!47653 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1435847 () Bool)

(declare-fun res!968922 () Bool)

(assert (=> b!1435847 (=> (not res!968922) (not e!810302))))

(declare-fun noDuplicate!2637 (List!33680) Bool)

(assert (=> b!1435847 (= res!968922 (noDuplicate!2637 Nil!33677))))

(declare-fun b!1435848 () Bool)

(declare-fun res!968923 () Bool)

(assert (=> b!1435848 (=> (not res!968923) (not e!810302))))

(assert (=> b!1435848 (= res!968923 (validKeyInArray!0 (select (arr!47101 a!2862) j!93)))))

(assert (= (and start!123944 res!968918) b!1435841))

(assert (= (and b!1435841 res!968920) b!1435844))

(assert (= (and b!1435844 res!968917) b!1435848))

(assert (= (and b!1435848 res!968923) b!1435845))

(assert (= (and b!1435845 res!968916) b!1435846))

(assert (= (and b!1435846 res!968919) b!1435847))

(assert (= (and b!1435847 res!968922) b!1435842))

(assert (= (and b!1435842 (not res!968921)) b!1435843))

(declare-fun m!1324703 () Bool)

(assert (=> b!1435847 m!1324703))

(declare-fun m!1324705 () Bool)

(assert (=> b!1435842 m!1324705))

(declare-fun m!1324707 () Bool)

(assert (=> b!1435844 m!1324707))

(assert (=> b!1435844 m!1324707))

(declare-fun m!1324709 () Bool)

(assert (=> b!1435844 m!1324709))

(declare-fun m!1324711 () Bool)

(assert (=> b!1435843 m!1324711))

(declare-fun m!1324713 () Bool)

(assert (=> b!1435848 m!1324713))

(assert (=> b!1435848 m!1324713))

(declare-fun m!1324715 () Bool)

(assert (=> b!1435848 m!1324715))

(declare-fun m!1324717 () Bool)

(assert (=> start!123944 m!1324717))

(declare-fun m!1324719 () Bool)

(assert (=> start!123944 m!1324719))

(declare-fun m!1324721 () Bool)

(assert (=> b!1435845 m!1324721))

(check-sat (not b!1435848) (not start!123944) (not b!1435844) (not b!1435845) (not b!1435847) (not b!1435843) (not b!1435842))
(check-sat)
(get-model)

(declare-fun d!154317 () Bool)

(declare-fun res!968976 () Bool)

(declare-fun e!810326 () Bool)

(assert (=> d!154317 (=> res!968976 e!810326)))

(get-info :version)

(assert (=> d!154317 (= res!968976 ((_ is Nil!33677) Nil!33677))))

(assert (=> d!154317 (= (noDuplicate!2637 Nil!33677) e!810326)))

(declare-fun b!1435901 () Bool)

(declare-fun e!810327 () Bool)

(assert (=> b!1435901 (= e!810326 e!810327)))

(declare-fun res!968977 () Bool)

(assert (=> b!1435901 (=> (not res!968977) (not e!810327))))

(assert (=> b!1435901 (= res!968977 (not (contains!9841 (t!48366 Nil!33677) (h!35011 Nil!33677))))))

(declare-fun b!1435902 () Bool)

(assert (=> b!1435902 (= e!810327 (noDuplicate!2637 (t!48366 Nil!33677)))))

(assert (= (and d!154317 (not res!968976)) b!1435901))

(assert (= (and b!1435901 res!968977) b!1435902))

(declare-fun m!1324763 () Bool)

(assert (=> b!1435901 m!1324763))

(declare-fun m!1324765 () Bool)

(assert (=> b!1435902 m!1324765))

(assert (=> b!1435847 d!154317))

(declare-fun d!154319 () Bool)

(declare-fun lt!631824 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!769 (List!33680) (InoxSet (_ BitVec 64)))

(assert (=> d!154319 (= lt!631824 (select (content!769 Nil!33677) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810333 () Bool)

(assert (=> d!154319 (= lt!631824 e!810333)))

(declare-fun res!968983 () Bool)

(assert (=> d!154319 (=> (not res!968983) (not e!810333))))

(assert (=> d!154319 (= res!968983 ((_ is Cons!33676) Nil!33677))))

(assert (=> d!154319 (= (contains!9841 Nil!33677 #b0000000000000000000000000000000000000000000000000000000000000000) lt!631824)))

(declare-fun b!1435907 () Bool)

(declare-fun e!810332 () Bool)

(assert (=> b!1435907 (= e!810333 e!810332)))

(declare-fun res!968982 () Bool)

(assert (=> b!1435907 (=> res!968982 e!810332)))

(assert (=> b!1435907 (= res!968982 (= (h!35011 Nil!33677) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435908 () Bool)

(assert (=> b!1435908 (= e!810332 (contains!9841 (t!48366 Nil!33677) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154319 res!968983) b!1435907))

(assert (= (and b!1435907 (not res!968982)) b!1435908))

(declare-fun m!1324767 () Bool)

(assert (=> d!154319 m!1324767))

(declare-fun m!1324769 () Bool)

(assert (=> d!154319 m!1324769))

(declare-fun m!1324771 () Bool)

(assert (=> b!1435908 m!1324771))

(assert (=> b!1435842 d!154319))

(declare-fun d!154321 () Bool)

(declare-fun lt!631825 () Bool)

(assert (=> d!154321 (= lt!631825 (select (content!769 Nil!33677) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810335 () Bool)

(assert (=> d!154321 (= lt!631825 e!810335)))

(declare-fun res!968985 () Bool)

(assert (=> d!154321 (=> (not res!968985) (not e!810335))))

(assert (=> d!154321 (= res!968985 ((_ is Cons!33676) Nil!33677))))

(assert (=> d!154321 (= (contains!9841 Nil!33677 #b1000000000000000000000000000000000000000000000000000000000000000) lt!631825)))

(declare-fun b!1435909 () Bool)

(declare-fun e!810334 () Bool)

(assert (=> b!1435909 (= e!810335 e!810334)))

(declare-fun res!968984 () Bool)

(assert (=> b!1435909 (=> res!968984 e!810334)))

(assert (=> b!1435909 (= res!968984 (= (h!35011 Nil!33677) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435910 () Bool)

(assert (=> b!1435910 (= e!810334 (contains!9841 (t!48366 Nil!33677) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154321 res!968985) b!1435909))

(assert (= (and b!1435909 (not res!968984)) b!1435910))

(assert (=> d!154321 m!1324767))

(declare-fun m!1324773 () Bool)

(assert (=> d!154321 m!1324773))

(declare-fun m!1324775 () Bool)

(assert (=> b!1435910 m!1324775))

(assert (=> b!1435843 d!154321))

(declare-fun d!154323 () Bool)

(assert (=> d!154323 (= (validKeyInArray!0 (select (arr!47101 a!2862) j!93)) (and (not (= (select (arr!47101 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47101 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435848 d!154323))

(declare-fun d!154325 () Bool)

(assert (=> d!154325 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123944 d!154325))

(declare-fun d!154337 () Bool)

(assert (=> d!154337 (= (array_inv!36334 a!2862) (bvsge (size!47653 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123944 d!154337))

(declare-fun d!154341 () Bool)

(assert (=> d!154341 (= (validKeyInArray!0 (select (arr!47101 a!2862) i!1006)) (and (not (= (select (arr!47101 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47101 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435844 d!154341))

(declare-fun b!1435969 () Bool)

(declare-fun e!810387 () Bool)

(declare-fun call!67565 () Bool)

(assert (=> b!1435969 (= e!810387 call!67565)))

(declare-fun b!1435970 () Bool)

(declare-fun e!810388 () Bool)

(assert (=> b!1435970 (= e!810388 call!67565)))

(declare-fun b!1435971 () Bool)

(assert (=> b!1435971 (= e!810388 e!810387)))

(declare-fun lt!631857 () (_ BitVec 64))

(assert (=> b!1435971 (= lt!631857 (select (arr!47101 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48387 0))(
  ( (Unit!48388) )
))
(declare-fun lt!631859 () Unit!48387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97605 (_ BitVec 64) (_ BitVec 32)) Unit!48387)

(assert (=> b!1435971 (= lt!631859 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!631857 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435971 (arrayContainsKey!0 a!2862 lt!631857 #b00000000000000000000000000000000)))

(declare-fun lt!631858 () Unit!48387)

(assert (=> b!1435971 (= lt!631858 lt!631859)))

(declare-fun res!969029 () Bool)

(declare-datatypes ((SeekEntryResult!11400 0))(
  ( (MissingZero!11400 (index!47992 (_ BitVec 32))) (Found!11400 (index!47993 (_ BitVec 32))) (Intermediate!11400 (undefined!12212 Bool) (index!47994 (_ BitVec 32)) (x!129665 (_ BitVec 32))) (Undefined!11400) (MissingVacant!11400 (index!47995 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97605 (_ BitVec 32)) SeekEntryResult!11400)

(assert (=> b!1435971 (= res!969029 (= (seekEntryOrOpen!0 (select (arr!47101 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11400 #b00000000000000000000000000000000)))))

(assert (=> b!1435971 (=> (not res!969029) (not e!810387))))

(declare-fun b!1435972 () Bool)

(declare-fun e!810386 () Bool)

(assert (=> b!1435972 (= e!810386 e!810388)))

(declare-fun c!132976 () Bool)

(assert (=> b!1435972 (= c!132976 (validKeyInArray!0 (select (arr!47101 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67562 () Bool)

(assert (=> bm!67562 (= call!67565 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!154343 () Bool)

(declare-fun res!969028 () Bool)

(assert (=> d!154343 (=> res!969028 e!810386)))

(assert (=> d!154343 (= res!969028 (bvsge #b00000000000000000000000000000000 (size!47653 a!2862)))))

(assert (=> d!154343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810386)))

(assert (= (and d!154343 (not res!969028)) b!1435972))

(assert (= (and b!1435972 c!132976) b!1435971))

(assert (= (and b!1435972 (not c!132976)) b!1435970))

(assert (= (and b!1435971 res!969029) b!1435969))

(assert (= (or b!1435969 b!1435970) bm!67562))

(declare-fun m!1324825 () Bool)

(assert (=> b!1435971 m!1324825))

(declare-fun m!1324827 () Bool)

(assert (=> b!1435971 m!1324827))

(declare-fun m!1324829 () Bool)

(assert (=> b!1435971 m!1324829))

(assert (=> b!1435971 m!1324825))

(declare-fun m!1324831 () Bool)

(assert (=> b!1435971 m!1324831))

(assert (=> b!1435972 m!1324825))

(assert (=> b!1435972 m!1324825))

(declare-fun m!1324833 () Bool)

(assert (=> b!1435972 m!1324833))

(declare-fun m!1324835 () Bool)

(assert (=> bm!67562 m!1324835))

(assert (=> b!1435845 d!154343))

(check-sat (not d!154319) (not bm!67562) (not b!1435902) (not b!1435910) (not d!154321) (not b!1435908) (not b!1435901) (not b!1435972) (not b!1435971))
(check-sat)
