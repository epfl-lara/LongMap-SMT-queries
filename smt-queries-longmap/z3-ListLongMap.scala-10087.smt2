; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118766 () Bool)

(assert start!118766)

(declare-fun b!1387920 () Bool)

(declare-fun res!928556 () Bool)

(declare-fun e!786197 () Bool)

(assert (=> b!1387920 (=> (not res!928556) (not e!786197))))

(declare-datatypes ((array!94937 0))(
  ( (array!94938 (arr!45843 (Array (_ BitVec 32) (_ BitVec 64))) (size!46393 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94937)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387920 (= res!928556 (validKeyInArray!0 (select (arr!45843 a!2938) i!1065)))))

(declare-fun b!1387921 () Bool)

(declare-datatypes ((Unit!46400 0))(
  ( (Unit!46401) )
))
(declare-fun e!786195 () Unit!46400)

(declare-fun Unit!46402 () Unit!46400)

(assert (=> b!1387921 (= e!786195 Unit!46402)))

(declare-fun b!1387922 () Bool)

(declare-fun res!928553 () Bool)

(assert (=> b!1387922 (=> (not res!928553) (not e!786197))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94937 (_ BitVec 32)) Bool)

(assert (=> b!1387922 (= res!928553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387923 () Bool)

(declare-fun e!786194 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387923 (= e!786194 (validKeyInArray!0 (select (arr!45843 a!2938) startIndex!16)))))

(declare-fun b!1387925 () Bool)

(declare-fun e!786193 () Bool)

(assert (=> b!1387925 (= e!786197 e!786193)))

(declare-fun res!928557 () Bool)

(assert (=> b!1387925 (=> (not res!928557) (not e!786193))))

(assert (=> b!1387925 (= res!928557 (bvsge startIndex!16 (bvsub (size!46393 a!2938) #b00000000000000000000000000000001)))))

(declare-fun lt!610094 () Unit!46400)

(assert (=> b!1387925 (= lt!610094 e!786195)))

(declare-fun c!129126 () Bool)

(assert (=> b!1387925 (= c!129126 e!786194)))

(declare-fun res!928558 () Bool)

(assert (=> b!1387925 (=> (not res!928558) (not e!786194))))

(assert (=> b!1387925 (= res!928558 (not (= startIndex!16 i!1065)))))

(declare-fun lt!610095 () array!94937)

(assert (=> b!1387925 (= lt!610095 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)))))

(declare-fun b!1387926 () Bool)

(assert (=> b!1387926 (= e!786193 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610095 mask!2987)))))

(declare-fun b!1387927 () Bool)

(declare-fun res!928552 () Bool)

(assert (=> b!1387927 (=> (not res!928552) (not e!786197))))

(declare-datatypes ((List!32371 0))(
  ( (Nil!32368) (Cons!32367 (h!33579 (_ BitVec 64)) (t!47065 List!32371)) )
))
(declare-fun arrayNoDuplicates!0 (array!94937 (_ BitVec 32) List!32371) Bool)

(assert (=> b!1387927 (= res!928552 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32368))))

(declare-fun b!1387928 () Bool)

(declare-fun res!928554 () Bool)

(assert (=> b!1387928 (=> (not res!928554) (not e!786197))))

(assert (=> b!1387928 (= res!928554 (and (not (= (select (arr!45843 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45843 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387929 () Bool)

(declare-fun res!928555 () Bool)

(assert (=> b!1387929 (=> (not res!928555) (not e!786197))))

(assert (=> b!1387929 (= res!928555 (and (= (size!46393 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46393 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46393 a!2938))))))

(declare-fun res!928551 () Bool)

(assert (=> start!118766 (=> (not res!928551) (not e!786197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118766 (= res!928551 (validMask!0 mask!2987))))

(assert (=> start!118766 e!786197))

(assert (=> start!118766 true))

(declare-fun array_inv!34871 (array!94937) Bool)

(assert (=> start!118766 (array_inv!34871 a!2938)))

(declare-fun b!1387924 () Bool)

(declare-fun lt!610092 () Unit!46400)

(assert (=> b!1387924 (= e!786195 lt!610092)))

(declare-fun lt!610093 () Unit!46400)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46400)

(assert (=> b!1387924 (= lt!610093 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10186 0))(
  ( (MissingZero!10186 (index!43115 (_ BitVec 32))) (Found!10186 (index!43116 (_ BitVec 32))) (Intermediate!10186 (undefined!10998 Bool) (index!43117 (_ BitVec 32)) (x!124732 (_ BitVec 32))) (Undefined!10186) (MissingVacant!10186 (index!43118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94937 (_ BitVec 32)) SeekEntryResult!10186)

(assert (=> b!1387924 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46400)

(assert (=> b!1387924 (= lt!610092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387924 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118766 res!928551) b!1387929))

(assert (= (and b!1387929 res!928555) b!1387920))

(assert (= (and b!1387920 res!928556) b!1387927))

(assert (= (and b!1387927 res!928552) b!1387922))

(assert (= (and b!1387922 res!928553) b!1387928))

(assert (= (and b!1387928 res!928554) b!1387925))

(assert (= (and b!1387925 res!928558) b!1387923))

(assert (= (and b!1387925 c!129126) b!1387924))

(assert (= (and b!1387925 (not c!129126)) b!1387921))

(assert (= (and b!1387925 res!928557) b!1387926))

(declare-fun m!1273577 () Bool)

(assert (=> b!1387928 m!1273577))

(declare-fun m!1273579 () Bool)

(assert (=> b!1387927 m!1273579))

(declare-fun m!1273581 () Bool)

(assert (=> b!1387923 m!1273581))

(assert (=> b!1387923 m!1273581))

(declare-fun m!1273583 () Bool)

(assert (=> b!1387923 m!1273583))

(declare-fun m!1273585 () Bool)

(assert (=> start!118766 m!1273585))

(declare-fun m!1273587 () Bool)

(assert (=> start!118766 m!1273587))

(declare-fun m!1273589 () Bool)

(assert (=> b!1387926 m!1273589))

(declare-fun m!1273591 () Bool)

(assert (=> b!1387924 m!1273591))

(declare-fun m!1273593 () Bool)

(assert (=> b!1387924 m!1273593))

(declare-fun m!1273595 () Bool)

(assert (=> b!1387924 m!1273595))

(assert (=> b!1387924 m!1273593))

(declare-fun m!1273597 () Bool)

(assert (=> b!1387924 m!1273597))

(declare-fun m!1273599 () Bool)

(assert (=> b!1387924 m!1273599))

(assert (=> b!1387924 m!1273581))

(declare-fun m!1273601 () Bool)

(assert (=> b!1387924 m!1273601))

(assert (=> b!1387924 m!1273581))

(declare-fun m!1273603 () Bool)

(assert (=> b!1387924 m!1273603))

(assert (=> b!1387920 m!1273577))

(assert (=> b!1387920 m!1273577))

(declare-fun m!1273605 () Bool)

(assert (=> b!1387920 m!1273605))

(assert (=> b!1387925 m!1273595))

(declare-fun m!1273607 () Bool)

(assert (=> b!1387922 m!1273607))

(check-sat (not b!1387922) (not b!1387927) (not start!118766) (not b!1387923) (not b!1387926) (not b!1387924) (not b!1387920))
(check-sat)
(get-model)

(declare-fun d!149727 () Bool)

(assert (=> d!149727 (= (validKeyInArray!0 (select (arr!45843 a!2938) startIndex!16)) (and (not (= (select (arr!45843 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45843 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387923 d!149727))

(declare-fun d!149729 () Bool)

(declare-fun res!928590 () Bool)

(declare-fun e!786222 () Bool)

(assert (=> d!149729 (=> res!928590 e!786222)))

(assert (=> d!149729 (= res!928590 (bvsge #b00000000000000000000000000000000 (size!46393 a!2938)))))

(assert (=> d!149729 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32368) e!786222)))

(declare-fun b!1387970 () Bool)

(declare-fun e!786221 () Bool)

(declare-fun call!66601 () Bool)

(assert (=> b!1387970 (= e!786221 call!66601)))

(declare-fun bm!66598 () Bool)

(declare-fun c!129132 () Bool)

(assert (=> bm!66598 (= call!66601 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129132 (Cons!32367 (select (arr!45843 a!2938) #b00000000000000000000000000000000) Nil!32368) Nil!32368)))))

(declare-fun b!1387971 () Bool)

(assert (=> b!1387971 (= e!786221 call!66601)))

(declare-fun b!1387972 () Bool)

(declare-fun e!786223 () Bool)

(assert (=> b!1387972 (= e!786222 e!786223)))

(declare-fun res!928589 () Bool)

(assert (=> b!1387972 (=> (not res!928589) (not e!786223))))

(declare-fun e!786224 () Bool)

(assert (=> b!1387972 (= res!928589 (not e!786224))))

(declare-fun res!928591 () Bool)

(assert (=> b!1387972 (=> (not res!928591) (not e!786224))))

(assert (=> b!1387972 (= res!928591 (validKeyInArray!0 (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387973 () Bool)

(assert (=> b!1387973 (= e!786223 e!786221)))

(assert (=> b!1387973 (= c!129132 (validKeyInArray!0 (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387974 () Bool)

(declare-fun contains!9748 (List!32371 (_ BitVec 64)) Bool)

(assert (=> b!1387974 (= e!786224 (contains!9748 Nil!32368 (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149729 (not res!928590)) b!1387972))

(assert (= (and b!1387972 res!928591) b!1387974))

(assert (= (and b!1387972 res!928589) b!1387973))

(assert (= (and b!1387973 c!129132) b!1387970))

(assert (= (and b!1387973 (not c!129132)) b!1387971))

(assert (= (or b!1387970 b!1387971) bm!66598))

(declare-fun m!1273641 () Bool)

(assert (=> bm!66598 m!1273641))

(declare-fun m!1273643 () Bool)

(assert (=> bm!66598 m!1273643))

(assert (=> b!1387972 m!1273641))

(assert (=> b!1387972 m!1273641))

(declare-fun m!1273645 () Bool)

(assert (=> b!1387972 m!1273645))

(assert (=> b!1387973 m!1273641))

(assert (=> b!1387973 m!1273641))

(assert (=> b!1387973 m!1273645))

(assert (=> b!1387974 m!1273641))

(assert (=> b!1387974 m!1273641))

(declare-fun m!1273647 () Bool)

(assert (=> b!1387974 m!1273647))

(assert (=> b!1387927 d!149729))

(declare-fun b!1387983 () Bool)

(declare-fun e!786231 () Bool)

(declare-fun call!66604 () Bool)

(assert (=> b!1387983 (= e!786231 call!66604)))

(declare-fun b!1387984 () Bool)

(declare-fun e!786233 () Bool)

(assert (=> b!1387984 (= e!786233 e!786231)))

(declare-fun c!129135 () Bool)

(assert (=> b!1387984 (= c!129135 (validKeyInArray!0 (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(declare-fun d!149731 () Bool)

(declare-fun res!928596 () Bool)

(assert (=> d!149731 (=> res!928596 e!786233)))

(assert (=> d!149731 (= res!928596 (bvsge #b00000000000000000000000000000000 (size!46393 a!2938)))))

(assert (=> d!149731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!786233)))

(declare-fun b!1387985 () Bool)

(declare-fun e!786232 () Bool)

(assert (=> b!1387985 (= e!786232 call!66604)))

(declare-fun b!1387986 () Bool)

(assert (=> b!1387986 (= e!786231 e!786232)))

(declare-fun lt!610116 () (_ BitVec 64))

(assert (=> b!1387986 (= lt!610116 (select (arr!45843 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!610115 () Unit!46400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94937 (_ BitVec 64) (_ BitVec 32)) Unit!46400)

(assert (=> b!1387986 (= lt!610115 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610116 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1387986 (arrayContainsKey!0 a!2938 lt!610116 #b00000000000000000000000000000000)))

(declare-fun lt!610114 () Unit!46400)

(assert (=> b!1387986 (= lt!610114 lt!610115)))

(declare-fun res!928597 () Bool)

(assert (=> b!1387986 (= res!928597 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10186 #b00000000000000000000000000000000)))))

(assert (=> b!1387986 (=> (not res!928597) (not e!786232))))

(declare-fun bm!66601 () Bool)

(assert (=> bm!66601 (= call!66604 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(assert (= (and d!149731 (not res!928596)) b!1387984))

(assert (= (and b!1387984 c!129135) b!1387986))

(assert (= (and b!1387984 (not c!129135)) b!1387983))

(assert (= (and b!1387986 res!928597) b!1387985))

(assert (= (or b!1387985 b!1387983) bm!66601))

(assert (=> b!1387984 m!1273641))

(assert (=> b!1387984 m!1273641))

(assert (=> b!1387984 m!1273645))

(assert (=> b!1387986 m!1273641))

(declare-fun m!1273649 () Bool)

(assert (=> b!1387986 m!1273649))

(declare-fun m!1273651 () Bool)

(assert (=> b!1387986 m!1273651))

(assert (=> b!1387986 m!1273641))

(declare-fun m!1273653 () Bool)

(assert (=> b!1387986 m!1273653))

(declare-fun m!1273655 () Bool)

(assert (=> bm!66601 m!1273655))

(assert (=> b!1387922 d!149731))

(declare-fun d!149733 () Bool)

(assert (=> d!149733 (= (validKeyInArray!0 (select (arr!45843 a!2938) i!1065)) (and (not (= (select (arr!45843 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45843 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387920 d!149733))

(declare-fun b!1387987 () Bool)

(declare-fun e!786234 () Bool)

(declare-fun call!66605 () Bool)

(assert (=> b!1387987 (= e!786234 call!66605)))

(declare-fun b!1387988 () Bool)

(declare-fun e!786236 () Bool)

(assert (=> b!1387988 (= e!786236 e!786234)))

(declare-fun c!129136 () Bool)

(assert (=> b!1387988 (= c!129136 (validKeyInArray!0 (select (arr!45843 lt!610095) startIndex!16)))))

(declare-fun d!149735 () Bool)

(declare-fun res!928598 () Bool)

(assert (=> d!149735 (=> res!928598 e!786236)))

(assert (=> d!149735 (= res!928598 (bvsge startIndex!16 (size!46393 lt!610095)))))

(assert (=> d!149735 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610095 mask!2987) e!786236)))

(declare-fun b!1387989 () Bool)

(declare-fun e!786235 () Bool)

(assert (=> b!1387989 (= e!786235 call!66605)))

(declare-fun b!1387990 () Bool)

(assert (=> b!1387990 (= e!786234 e!786235)))

(declare-fun lt!610119 () (_ BitVec 64))

(assert (=> b!1387990 (= lt!610119 (select (arr!45843 lt!610095) startIndex!16))))

(declare-fun lt!610118 () Unit!46400)

(assert (=> b!1387990 (= lt!610118 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610095 lt!610119 startIndex!16))))

(assert (=> b!1387990 (arrayContainsKey!0 lt!610095 lt!610119 #b00000000000000000000000000000000)))

(declare-fun lt!610117 () Unit!46400)

(assert (=> b!1387990 (= lt!610117 lt!610118)))

(declare-fun res!928599 () Bool)

(assert (=> b!1387990 (= res!928599 (= (seekEntryOrOpen!0 (select (arr!45843 lt!610095) startIndex!16) lt!610095 mask!2987) (Found!10186 startIndex!16)))))

(assert (=> b!1387990 (=> (not res!928599) (not e!786235))))

(declare-fun bm!66602 () Bool)

(assert (=> bm!66602 (= call!66605 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610095 mask!2987))))

(assert (= (and d!149735 (not res!928598)) b!1387988))

(assert (= (and b!1387988 c!129136) b!1387990))

(assert (= (and b!1387988 (not c!129136)) b!1387987))

(assert (= (and b!1387990 res!928599) b!1387989))

(assert (= (or b!1387989 b!1387987) bm!66602))

(declare-fun m!1273657 () Bool)

(assert (=> b!1387988 m!1273657))

(assert (=> b!1387988 m!1273657))

(declare-fun m!1273659 () Bool)

(assert (=> b!1387988 m!1273659))

(assert (=> b!1387990 m!1273657))

(declare-fun m!1273661 () Bool)

(assert (=> b!1387990 m!1273661))

(declare-fun m!1273663 () Bool)

(assert (=> b!1387990 m!1273663))

(assert (=> b!1387990 m!1273657))

(declare-fun m!1273665 () Bool)

(assert (=> b!1387990 m!1273665))

(declare-fun m!1273667 () Bool)

(assert (=> bm!66602 m!1273667))

(assert (=> b!1387926 d!149735))

(declare-fun b!1387991 () Bool)

(declare-fun e!786237 () Bool)

(declare-fun call!66606 () Bool)

(assert (=> b!1387991 (= e!786237 call!66606)))

(declare-fun b!1387992 () Bool)

(declare-fun e!786239 () Bool)

(assert (=> b!1387992 (= e!786239 e!786237)))

(declare-fun c!129137 () Bool)

(assert (=> b!1387992 (= c!129137 (validKeyInArray!0 (select (arr!45843 a!2938) startIndex!16)))))

(declare-fun d!149737 () Bool)

(declare-fun res!928600 () Bool)

(assert (=> d!149737 (=> res!928600 e!786239)))

(assert (=> d!149737 (= res!928600 (bvsge startIndex!16 (size!46393 a!2938)))))

(assert (=> d!149737 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!786239)))

(declare-fun b!1387993 () Bool)

(declare-fun e!786238 () Bool)

(assert (=> b!1387993 (= e!786238 call!66606)))

(declare-fun b!1387994 () Bool)

(assert (=> b!1387994 (= e!786237 e!786238)))

(declare-fun lt!610122 () (_ BitVec 64))

(assert (=> b!1387994 (= lt!610122 (select (arr!45843 a!2938) startIndex!16))))

(declare-fun lt!610121 () Unit!46400)

(assert (=> b!1387994 (= lt!610121 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610122 startIndex!16))))

(assert (=> b!1387994 (arrayContainsKey!0 a!2938 lt!610122 #b00000000000000000000000000000000)))

(declare-fun lt!610120 () Unit!46400)

(assert (=> b!1387994 (= lt!610120 lt!610121)))

(declare-fun res!928601 () Bool)

(assert (=> b!1387994 (= res!928601 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) (Found!10186 startIndex!16)))))

(assert (=> b!1387994 (=> (not res!928601) (not e!786238))))

(declare-fun bm!66603 () Bool)

(assert (=> bm!66603 (= call!66606 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(assert (= (and d!149737 (not res!928600)) b!1387992))

(assert (= (and b!1387992 c!129137) b!1387994))

(assert (= (and b!1387992 (not c!129137)) b!1387991))

(assert (= (and b!1387994 res!928601) b!1387993))

(assert (= (or b!1387993 b!1387991) bm!66603))

(assert (=> b!1387992 m!1273581))

(assert (=> b!1387992 m!1273581))

(assert (=> b!1387992 m!1273583))

(assert (=> b!1387994 m!1273581))

(declare-fun m!1273669 () Bool)

(assert (=> b!1387994 m!1273669))

(declare-fun m!1273671 () Bool)

(assert (=> b!1387994 m!1273671))

(assert (=> b!1387994 m!1273581))

(assert (=> b!1387994 m!1273601))

(declare-fun m!1273673 () Bool)

(assert (=> bm!66603 m!1273673))

(assert (=> b!1387924 d!149737))

(declare-fun d!149739 () Bool)

(declare-fun e!786254 () Bool)

(assert (=> d!149739 e!786254))

(declare-fun res!928613 () Bool)

(assert (=> d!149739 (=> (not res!928613) (not e!786254))))

(assert (=> d!149739 (= res!928613 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46393 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46393 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46393 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46393 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46393 a!2938))))))

(declare-fun lt!610125 () Unit!46400)

(declare-fun choose!14 (array!94937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46400)

(assert (=> d!149739 (= lt!610125 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149739 (validMask!0 mask!2987)))

(assert (=> d!149739 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!610125)))

(declare-fun b!1388012 () Bool)

(assert (=> b!1388012 (= e!786254 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)) mask!2987)))))

(assert (= (and d!149739 res!928613) b!1388012))

(declare-fun m!1273683 () Bool)

(assert (=> d!149739 m!1273683))

(assert (=> d!149739 m!1273585))

(assert (=> b!1388012 m!1273593))

(declare-fun m!1273685 () Bool)

(assert (=> b!1388012 m!1273685))

(assert (=> b!1388012 m!1273581))

(assert (=> b!1388012 m!1273601))

(assert (=> b!1388012 m!1273581))

(assert (=> b!1388012 m!1273595))

(assert (=> b!1388012 m!1273593))

(assert (=> b!1387924 d!149739))

(declare-fun b!1388063 () Bool)

(declare-fun e!786290 () SeekEntryResult!10186)

(declare-fun lt!610154 () SeekEntryResult!10186)

(assert (=> b!1388063 (= e!786290 (MissingZero!10186 (index!43117 lt!610154)))))

(declare-fun b!1388064 () Bool)

(declare-fun e!786291 () SeekEntryResult!10186)

(assert (=> b!1388064 (= e!786291 Undefined!10186)))

(declare-fun b!1388065 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94937 (_ BitVec 32)) SeekEntryResult!10186)

(assert (=> b!1388065 (= e!786290 (seekKeyOrZeroReturnVacant!0 (x!124732 lt!610154) (index!43117 lt!610154) (index!43117 lt!610154) (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388066 () Bool)

(declare-fun c!129158 () Bool)

(declare-fun lt!610155 () (_ BitVec 64))

(assert (=> b!1388066 (= c!129158 (= lt!610155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786292 () SeekEntryResult!10186)

(assert (=> b!1388066 (= e!786292 e!786290)))

(declare-fun d!149749 () Bool)

(declare-fun lt!610153 () SeekEntryResult!10186)

(get-info :version)

(assert (=> d!149749 (and (or ((_ is Undefined!10186) lt!610153) (not ((_ is Found!10186) lt!610153)) (and (bvsge (index!43116 lt!610153) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610153) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610153) ((_ is Found!10186) lt!610153) (not ((_ is MissingZero!10186) lt!610153)) (and (bvsge (index!43115 lt!610153) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610153) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610153) ((_ is Found!10186) lt!610153) ((_ is MissingZero!10186) lt!610153) (not ((_ is MissingVacant!10186) lt!610153)) (and (bvsge (index!43118 lt!610153) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610153) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610153) (ite ((_ is Found!10186) lt!610153) (= (select (arr!45843 a!2938) (index!43116 lt!610153)) (select (arr!45843 a!2938) startIndex!16)) (ite ((_ is MissingZero!10186) lt!610153) (= (select (arr!45843 a!2938) (index!43115 lt!610153)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610153) (= (select (arr!45843 a!2938) (index!43118 lt!610153)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149749 (= lt!610153 e!786291)))

(declare-fun c!129156 () Bool)

(assert (=> d!149749 (= c!129156 (and ((_ is Intermediate!10186) lt!610154) (undefined!10998 lt!610154)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94937 (_ BitVec 32)) SeekEntryResult!10186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149749 (= lt!610154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45843 a!2938) startIndex!16) mask!2987) (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149749 (validMask!0 mask!2987)))

(assert (=> d!149749 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) lt!610153)))

(declare-fun b!1388067 () Bool)

(assert (=> b!1388067 (= e!786291 e!786292)))

(assert (=> b!1388067 (= lt!610155 (select (arr!45843 a!2938) (index!43117 lt!610154)))))

(declare-fun c!129157 () Bool)

(assert (=> b!1388067 (= c!129157 (= lt!610155 (select (arr!45843 a!2938) startIndex!16)))))

(declare-fun b!1388068 () Bool)

(assert (=> b!1388068 (= e!786292 (Found!10186 (index!43117 lt!610154)))))

(assert (= (and d!149749 c!129156) b!1388064))

(assert (= (and d!149749 (not c!129156)) b!1388067))

(assert (= (and b!1388067 c!129157) b!1388068))

(assert (= (and b!1388067 (not c!129157)) b!1388066))

(assert (= (and b!1388066 c!129158) b!1388063))

(assert (= (and b!1388066 (not c!129158)) b!1388065))

(assert (=> b!1388065 m!1273581))

(declare-fun m!1273719 () Bool)

(assert (=> b!1388065 m!1273719))

(assert (=> d!149749 m!1273585))

(declare-fun m!1273721 () Bool)

(assert (=> d!149749 m!1273721))

(assert (=> d!149749 m!1273581))

(declare-fun m!1273723 () Bool)

(assert (=> d!149749 m!1273723))

(declare-fun m!1273725 () Bool)

(assert (=> d!149749 m!1273725))

(assert (=> d!149749 m!1273723))

(assert (=> d!149749 m!1273581))

(declare-fun m!1273727 () Bool)

(assert (=> d!149749 m!1273727))

(declare-fun m!1273729 () Bool)

(assert (=> d!149749 m!1273729))

(declare-fun m!1273731 () Bool)

(assert (=> b!1388067 m!1273731))

(assert (=> b!1387924 d!149749))

(declare-fun d!149769 () Bool)

(assert (=> d!149769 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!610164 () Unit!46400)

(declare-fun choose!38 (array!94937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46400)

(assert (=> d!149769 (= lt!610164 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149769 (validMask!0 mask!2987)))

(assert (=> d!149769 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!610164)))

(declare-fun bs!40341 () Bool)

(assert (= bs!40341 d!149769))

(assert (=> bs!40341 m!1273603))

(declare-fun m!1273749 () Bool)

(assert (=> bs!40341 m!1273749))

(assert (=> bs!40341 m!1273585))

(assert (=> b!1387924 d!149769))

(declare-fun b!1388078 () Bool)

(declare-fun e!786300 () SeekEntryResult!10186)

(declare-fun lt!610166 () SeekEntryResult!10186)

(assert (=> b!1388078 (= e!786300 (MissingZero!10186 (index!43117 lt!610166)))))

(declare-fun b!1388079 () Bool)

(declare-fun e!786301 () SeekEntryResult!10186)

(assert (=> b!1388079 (= e!786301 Undefined!10186)))

(declare-fun b!1388080 () Bool)

(assert (=> b!1388080 (= e!786300 (seekKeyOrZeroReturnVacant!0 (x!124732 lt!610166) (index!43117 lt!610166) (index!43117 lt!610166) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987))))

(declare-fun b!1388081 () Bool)

(declare-fun c!129163 () Bool)

(declare-fun lt!610167 () (_ BitVec 64))

(assert (=> b!1388081 (= c!129163 (= lt!610167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786302 () SeekEntryResult!10186)

(assert (=> b!1388081 (= e!786302 e!786300)))

(declare-fun d!149777 () Bool)

(declare-fun lt!610165 () SeekEntryResult!10186)

(assert (=> d!149777 (and (or ((_ is Undefined!10186) lt!610165) (not ((_ is Found!10186) lt!610165)) (and (bvsge (index!43116 lt!610165) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610165) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610165) ((_ is Found!10186) lt!610165) (not ((_ is MissingZero!10186) lt!610165)) (and (bvsge (index!43115 lt!610165) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610165) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610165) ((_ is Found!10186) lt!610165) ((_ is MissingZero!10186) lt!610165) (not ((_ is MissingVacant!10186) lt!610165)) (and (bvsge (index!43118 lt!610165) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610165) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610165) (ite ((_ is Found!10186) lt!610165) (= (select (arr!45843 lt!610095) (index!43116 lt!610165)) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10186) lt!610165) (= (select (arr!45843 lt!610095) (index!43115 lt!610165)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610165) (= (select (arr!45843 lt!610095) (index!43118 lt!610165)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149777 (= lt!610165 e!786301)))

(declare-fun c!129161 () Bool)

(assert (=> d!149777 (= c!129161 (and ((_ is Intermediate!10186) lt!610166) (undefined!10998 lt!610166)))))

(assert (=> d!149777 (= lt!610166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987))))

(assert (=> d!149777 (validMask!0 mask!2987)))

(assert (=> d!149777 (= (seekEntryOrOpen!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987) lt!610165)))

(declare-fun b!1388082 () Bool)

(assert (=> b!1388082 (= e!786301 e!786302)))

(assert (=> b!1388082 (= lt!610167 (select (arr!45843 lt!610095) (index!43117 lt!610166)))))

(declare-fun c!129162 () Bool)

(assert (=> b!1388082 (= c!129162 (= lt!610167 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388083 () Bool)

(assert (=> b!1388083 (= e!786302 (Found!10186 (index!43117 lt!610166)))))

(assert (= (and d!149777 c!129161) b!1388079))

(assert (= (and d!149777 (not c!129161)) b!1388082))

(assert (= (and b!1388082 c!129162) b!1388083))

(assert (= (and b!1388082 (not c!129162)) b!1388081))

(assert (= (and b!1388081 c!129163) b!1388078))

(assert (= (and b!1388081 (not c!129163)) b!1388080))

(assert (=> b!1388080 m!1273593))

(declare-fun m!1273751 () Bool)

(assert (=> b!1388080 m!1273751))

(assert (=> d!149777 m!1273585))

(declare-fun m!1273753 () Bool)

(assert (=> d!149777 m!1273753))

(assert (=> d!149777 m!1273593))

(declare-fun m!1273755 () Bool)

(assert (=> d!149777 m!1273755))

(declare-fun m!1273757 () Bool)

(assert (=> d!149777 m!1273757))

(assert (=> d!149777 m!1273755))

(assert (=> d!149777 m!1273593))

(declare-fun m!1273759 () Bool)

(assert (=> d!149777 m!1273759))

(declare-fun m!1273761 () Bool)

(assert (=> d!149777 m!1273761))

(declare-fun m!1273763 () Bool)

(assert (=> b!1388082 m!1273763))

(assert (=> b!1387924 d!149777))

(declare-fun d!149779 () Bool)

(assert (=> d!149779 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118766 d!149779))

(declare-fun d!149785 () Bool)

(assert (=> d!149785 (= (array_inv!34871 a!2938) (bvsge (size!46393 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118766 d!149785))

(check-sat (not b!1387988) (not b!1387974) (not d!149739) (not b!1388080) (not bm!66603) (not bm!66601) (not b!1388065) (not b!1387994) (not d!149777) (not b!1387990) (not b!1387973) (not b!1387984) (not bm!66598) (not d!149749) (not b!1387992) (not b!1388012) (not bm!66602) (not b!1387986) (not d!149769) (not b!1387972))
(check-sat)
(get-model)

(assert (=> d!149769 d!149737))

(declare-fun d!149799 () Bool)

(assert (=> d!149799 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149799 true))

(declare-fun _$72!137 () Unit!46400)

(assert (=> d!149799 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!137)))

(declare-fun bs!40343 () Bool)

(assert (= bs!40343 d!149799))

(assert (=> bs!40343 m!1273603))

(assert (=> d!149769 d!149799))

(assert (=> d!149769 d!149779))

(declare-fun b!1388176 () Bool)

(declare-fun lt!610221 () SeekEntryResult!10186)

(assert (=> b!1388176 (and (bvsge (index!43117 lt!610221) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610221) (size!46393 lt!610095)))))

(declare-fun e!786362 () Bool)

(assert (=> b!1388176 (= e!786362 (= (select (arr!45843 lt!610095) (index!43117 lt!610221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388177 () Bool)

(assert (=> b!1388177 (and (bvsge (index!43117 lt!610221) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610221) (size!46393 lt!610095)))))

(declare-fun res!928661 () Bool)

(assert (=> b!1388177 (= res!928661 (= (select (arr!45843 lt!610095) (index!43117 lt!610221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388177 (=> res!928661 e!786362)))

(declare-fun b!1388178 () Bool)

(assert (=> b!1388178 (and (bvsge (index!43117 lt!610221) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610221) (size!46393 lt!610095)))))

(declare-fun res!928663 () Bool)

(assert (=> b!1388178 (= res!928663 (= (select (arr!45843 lt!610095) (index!43117 lt!610221)) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1388178 (=> res!928663 e!786362)))

(declare-fun e!786358 () Bool)

(assert (=> b!1388178 (= e!786358 e!786362)))

(declare-fun d!149801 () Bool)

(declare-fun e!786359 () Bool)

(assert (=> d!149801 e!786359))

(declare-fun c!129200 () Bool)

(assert (=> d!149801 (= c!129200 (and ((_ is Intermediate!10186) lt!610221) (undefined!10998 lt!610221)))))

(declare-fun e!786360 () SeekEntryResult!10186)

(assert (=> d!149801 (= lt!610221 e!786360)))

(declare-fun c!129199 () Bool)

(assert (=> d!149801 (= c!129199 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!610220 () (_ BitVec 64))

(assert (=> d!149801 (= lt!610220 (select (arr!45843 lt!610095) (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149801 (validMask!0 mask!2987)))

(assert (=> d!149801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987) lt!610221)))

(declare-fun b!1388179 () Bool)

(assert (=> b!1388179 (= e!786360 (Intermediate!10186 true (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun e!786361 () SeekEntryResult!10186)

(declare-fun b!1388180 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1388180 (= e!786361 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987))))

(declare-fun b!1388181 () Bool)

(assert (=> b!1388181 (= e!786360 e!786361)))

(declare-fun c!129201 () Bool)

(assert (=> b!1388181 (= c!129201 (or (= lt!610220 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!610220 lt!610220) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388182 () Bool)

(assert (=> b!1388182 (= e!786361 (Intermediate!10186 false (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388183 () Bool)

(assert (=> b!1388183 (= e!786359 (bvsge (x!124732 lt!610221) #b01111111111111111111111111111110))))

(declare-fun b!1388184 () Bool)

(assert (=> b!1388184 (= e!786359 e!786358)))

(declare-fun res!928662 () Bool)

(assert (=> b!1388184 (= res!928662 (and ((_ is Intermediate!10186) lt!610221) (not (undefined!10998 lt!610221)) (bvslt (x!124732 lt!610221) #b01111111111111111111111111111110) (bvsge (x!124732 lt!610221) #b00000000000000000000000000000000) (bvsge (x!124732 lt!610221) #b00000000000000000000000000000000)))))

(assert (=> b!1388184 (=> (not res!928662) (not e!786358))))

(assert (= (and d!149801 c!129199) b!1388179))

(assert (= (and d!149801 (not c!129199)) b!1388181))

(assert (= (and b!1388181 c!129201) b!1388182))

(assert (= (and b!1388181 (not c!129201)) b!1388180))

(assert (= (and d!149801 c!129200) b!1388183))

(assert (= (and d!149801 (not c!129200)) b!1388184))

(assert (= (and b!1388184 res!928662) b!1388178))

(assert (= (and b!1388178 (not res!928663)) b!1388177))

(assert (= (and b!1388177 (not res!928661)) b!1388176))

(declare-fun m!1273865 () Bool)

(assert (=> b!1388178 m!1273865))

(assert (=> b!1388180 m!1273755))

(declare-fun m!1273867 () Bool)

(assert (=> b!1388180 m!1273867))

(assert (=> b!1388180 m!1273867))

(assert (=> b!1388180 m!1273593))

(declare-fun m!1273869 () Bool)

(assert (=> b!1388180 m!1273869))

(assert (=> d!149801 m!1273755))

(declare-fun m!1273871 () Bool)

(assert (=> d!149801 m!1273871))

(assert (=> d!149801 m!1273585))

(assert (=> b!1388177 m!1273865))

(assert (=> b!1388176 m!1273865))

(assert (=> d!149777 d!149801))

(declare-fun d!149813 () Bool)

(declare-fun lt!610230 () (_ BitVec 32))

(declare-fun lt!610229 () (_ BitVec 32))

(assert (=> d!149813 (= lt!610230 (bvmul (bvxor lt!610229 (bvlshr lt!610229 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149813 (= lt!610229 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149813 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928668 (let ((h!33581 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124735 (bvmul (bvxor h!33581 (bvlshr h!33581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124735 (bvlshr x!124735 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928668 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928668 #b00000000000000000000000000000000))))))

(assert (=> d!149813 (= (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!610230 (bvlshr lt!610230 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149777 d!149813))

(assert (=> d!149777 d!149779))

(declare-fun d!149819 () Bool)

(assert (=> d!149819 (= (validKeyInArray!0 (select (arr!45843 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45843 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45843 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387984 d!149819))

(declare-fun d!149821 () Bool)

(declare-fun lt!610233 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!765 (List!32371) (InoxSet (_ BitVec 64)))

(assert (=> d!149821 (= lt!610233 (select (content!765 Nil!32368) (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(declare-fun e!786377 () Bool)

(assert (=> d!149821 (= lt!610233 e!786377)))

(declare-fun res!928676 () Bool)

(assert (=> d!149821 (=> (not res!928676) (not e!786377))))

(assert (=> d!149821 (= res!928676 ((_ is Cons!32367) Nil!32368))))

(assert (=> d!149821 (= (contains!9748 Nil!32368 (select (arr!45843 a!2938) #b00000000000000000000000000000000)) lt!610233)))

(declare-fun b!1388201 () Bool)

(declare-fun e!786376 () Bool)

(assert (=> b!1388201 (= e!786377 e!786376)))

(declare-fun res!928675 () Bool)

(assert (=> b!1388201 (=> res!928675 e!786376)))

(assert (=> b!1388201 (= res!928675 (= (h!33579 Nil!32368) (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388202 () Bool)

(assert (=> b!1388202 (= e!786376 (contains!9748 (t!47065 Nil!32368) (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149821 res!928676) b!1388201))

(assert (= (and b!1388201 (not res!928675)) b!1388202))

(declare-fun m!1273891 () Bool)

(assert (=> d!149821 m!1273891))

(assert (=> d!149821 m!1273641))

(declare-fun m!1273893 () Bool)

(assert (=> d!149821 m!1273893))

(assert (=> b!1388202 m!1273641))

(declare-fun m!1273895 () Bool)

(assert (=> b!1388202 m!1273895))

(assert (=> b!1387974 d!149821))

(declare-fun b!1388203 () Bool)

(declare-fun e!786378 () Bool)

(declare-fun call!66623 () Bool)

(assert (=> b!1388203 (= e!786378 call!66623)))

(declare-fun b!1388204 () Bool)

(declare-fun e!786380 () Bool)

(assert (=> b!1388204 (= e!786380 e!786378)))

(declare-fun c!129205 () Bool)

(assert (=> b!1388204 (= c!129205 (validKeyInArray!0 (select (arr!45843 lt!610095) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!149825 () Bool)

(declare-fun res!928677 () Bool)

(assert (=> d!149825 (=> res!928677 e!786380)))

(assert (=> d!149825 (= res!928677 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46393 lt!610095)))))

(assert (=> d!149825 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610095 mask!2987) e!786380)))

(declare-fun b!1388205 () Bool)

(declare-fun e!786379 () Bool)

(assert (=> b!1388205 (= e!786379 call!66623)))

(declare-fun b!1388206 () Bool)

(assert (=> b!1388206 (= e!786378 e!786379)))

(declare-fun lt!610236 () (_ BitVec 64))

(assert (=> b!1388206 (= lt!610236 (select (arr!45843 lt!610095) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610235 () Unit!46400)

(assert (=> b!1388206 (= lt!610235 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610095 lt!610236 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388206 (arrayContainsKey!0 lt!610095 lt!610236 #b00000000000000000000000000000000)))

(declare-fun lt!610234 () Unit!46400)

(assert (=> b!1388206 (= lt!610234 lt!610235)))

(declare-fun res!928678 () Bool)

(assert (=> b!1388206 (= res!928678 (= (seekEntryOrOpen!0 (select (arr!45843 lt!610095) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!610095 mask!2987) (Found!10186 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388206 (=> (not res!928678) (not e!786379))))

(declare-fun bm!66620 () Bool)

(assert (=> bm!66620 (= call!66623 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!610095 mask!2987))))

(assert (= (and d!149825 (not res!928677)) b!1388204))

(assert (= (and b!1388204 c!129205) b!1388206))

(assert (= (and b!1388204 (not c!129205)) b!1388203))

(assert (= (and b!1388206 res!928678) b!1388205))

(assert (= (or b!1388205 b!1388203) bm!66620))

(declare-fun m!1273897 () Bool)

(assert (=> b!1388204 m!1273897))

(assert (=> b!1388204 m!1273897))

(declare-fun m!1273899 () Bool)

(assert (=> b!1388204 m!1273899))

(assert (=> b!1388206 m!1273897))

(declare-fun m!1273901 () Bool)

(assert (=> b!1388206 m!1273901))

(declare-fun m!1273903 () Bool)

(assert (=> b!1388206 m!1273903))

(assert (=> b!1388206 m!1273897))

(declare-fun m!1273905 () Bool)

(assert (=> b!1388206 m!1273905))

(declare-fun m!1273907 () Bool)

(assert (=> bm!66620 m!1273907))

(assert (=> bm!66602 d!149825))

(declare-fun d!149827 () Bool)

(assert (=> d!149827 (arrayContainsKey!0 lt!610095 lt!610119 #b00000000000000000000000000000000)))

(declare-fun lt!610239 () Unit!46400)

(declare-fun choose!13 (array!94937 (_ BitVec 64) (_ BitVec 32)) Unit!46400)

(assert (=> d!149827 (= lt!610239 (choose!13 lt!610095 lt!610119 startIndex!16))))

(assert (=> d!149827 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149827 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610095 lt!610119 startIndex!16) lt!610239)))

(declare-fun bs!40346 () Bool)

(assert (= bs!40346 d!149827))

(assert (=> bs!40346 m!1273663))

(declare-fun m!1273909 () Bool)

(assert (=> bs!40346 m!1273909))

(assert (=> b!1387990 d!149827))

(declare-fun d!149829 () Bool)

(declare-fun res!928683 () Bool)

(declare-fun e!786385 () Bool)

(assert (=> d!149829 (=> res!928683 e!786385)))

(assert (=> d!149829 (= res!928683 (= (select (arr!45843 lt!610095) #b00000000000000000000000000000000) lt!610119))))

(assert (=> d!149829 (= (arrayContainsKey!0 lt!610095 lt!610119 #b00000000000000000000000000000000) e!786385)))

(declare-fun b!1388211 () Bool)

(declare-fun e!786386 () Bool)

(assert (=> b!1388211 (= e!786385 e!786386)))

(declare-fun res!928684 () Bool)

(assert (=> b!1388211 (=> (not res!928684) (not e!786386))))

(assert (=> b!1388211 (= res!928684 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46393 lt!610095)))))

(declare-fun b!1388212 () Bool)

(assert (=> b!1388212 (= e!786386 (arrayContainsKey!0 lt!610095 lt!610119 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149829 (not res!928683)) b!1388211))

(assert (= (and b!1388211 res!928684) b!1388212))

(declare-fun m!1273911 () Bool)

(assert (=> d!149829 m!1273911))

(declare-fun m!1273913 () Bool)

(assert (=> b!1388212 m!1273913))

(assert (=> b!1387990 d!149829))

(declare-fun b!1388213 () Bool)

(declare-fun e!786387 () SeekEntryResult!10186)

(declare-fun lt!610241 () SeekEntryResult!10186)

(assert (=> b!1388213 (= e!786387 (MissingZero!10186 (index!43117 lt!610241)))))

(declare-fun b!1388214 () Bool)

(declare-fun e!786388 () SeekEntryResult!10186)

(assert (=> b!1388214 (= e!786388 Undefined!10186)))

(declare-fun b!1388215 () Bool)

(assert (=> b!1388215 (= e!786387 (seekKeyOrZeroReturnVacant!0 (x!124732 lt!610241) (index!43117 lt!610241) (index!43117 lt!610241) (select (arr!45843 lt!610095) startIndex!16) lt!610095 mask!2987))))

(declare-fun b!1388216 () Bool)

(declare-fun c!129208 () Bool)

(declare-fun lt!610242 () (_ BitVec 64))

(assert (=> b!1388216 (= c!129208 (= lt!610242 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786389 () SeekEntryResult!10186)

(assert (=> b!1388216 (= e!786389 e!786387)))

(declare-fun d!149831 () Bool)

(declare-fun lt!610240 () SeekEntryResult!10186)

(assert (=> d!149831 (and (or ((_ is Undefined!10186) lt!610240) (not ((_ is Found!10186) lt!610240)) (and (bvsge (index!43116 lt!610240) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610240) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610240) ((_ is Found!10186) lt!610240) (not ((_ is MissingZero!10186) lt!610240)) (and (bvsge (index!43115 lt!610240) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610240) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610240) ((_ is Found!10186) lt!610240) ((_ is MissingZero!10186) lt!610240) (not ((_ is MissingVacant!10186) lt!610240)) (and (bvsge (index!43118 lt!610240) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610240) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610240) (ite ((_ is Found!10186) lt!610240) (= (select (arr!45843 lt!610095) (index!43116 lt!610240)) (select (arr!45843 lt!610095) startIndex!16)) (ite ((_ is MissingZero!10186) lt!610240) (= (select (arr!45843 lt!610095) (index!43115 lt!610240)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610240) (= (select (arr!45843 lt!610095) (index!43118 lt!610240)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149831 (= lt!610240 e!786388)))

(declare-fun c!129206 () Bool)

(assert (=> d!149831 (= c!129206 (and ((_ is Intermediate!10186) lt!610241) (undefined!10998 lt!610241)))))

(assert (=> d!149831 (= lt!610241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45843 lt!610095) startIndex!16) mask!2987) (select (arr!45843 lt!610095) startIndex!16) lt!610095 mask!2987))))

(assert (=> d!149831 (validMask!0 mask!2987)))

(assert (=> d!149831 (= (seekEntryOrOpen!0 (select (arr!45843 lt!610095) startIndex!16) lt!610095 mask!2987) lt!610240)))

(declare-fun b!1388217 () Bool)

(assert (=> b!1388217 (= e!786388 e!786389)))

(assert (=> b!1388217 (= lt!610242 (select (arr!45843 lt!610095) (index!43117 lt!610241)))))

(declare-fun c!129207 () Bool)

(assert (=> b!1388217 (= c!129207 (= lt!610242 (select (arr!45843 lt!610095) startIndex!16)))))

(declare-fun b!1388218 () Bool)

(assert (=> b!1388218 (= e!786389 (Found!10186 (index!43117 lt!610241)))))

(assert (= (and d!149831 c!129206) b!1388214))

(assert (= (and d!149831 (not c!129206)) b!1388217))

(assert (= (and b!1388217 c!129207) b!1388218))

(assert (= (and b!1388217 (not c!129207)) b!1388216))

(assert (= (and b!1388216 c!129208) b!1388213))

(assert (= (and b!1388216 (not c!129208)) b!1388215))

(assert (=> b!1388215 m!1273657))

(declare-fun m!1273915 () Bool)

(assert (=> b!1388215 m!1273915))

(assert (=> d!149831 m!1273585))

(declare-fun m!1273917 () Bool)

(assert (=> d!149831 m!1273917))

(assert (=> d!149831 m!1273657))

(declare-fun m!1273919 () Bool)

(assert (=> d!149831 m!1273919))

(declare-fun m!1273921 () Bool)

(assert (=> d!149831 m!1273921))

(assert (=> d!149831 m!1273919))

(assert (=> d!149831 m!1273657))

(declare-fun m!1273923 () Bool)

(assert (=> d!149831 m!1273923))

(declare-fun m!1273925 () Bool)

(assert (=> d!149831 m!1273925))

(declare-fun m!1273927 () Bool)

(assert (=> b!1388217 m!1273927))

(assert (=> b!1387990 d!149831))

(assert (=> b!1388012 d!149749))

(declare-fun b!1388219 () Bool)

(declare-fun e!786390 () SeekEntryResult!10186)

(declare-fun lt!610244 () SeekEntryResult!10186)

(assert (=> b!1388219 (= e!786390 (MissingZero!10186 (index!43117 lt!610244)))))

(declare-fun b!1388220 () Bool)

(declare-fun e!786391 () SeekEntryResult!10186)

(assert (=> b!1388220 (= e!786391 Undefined!10186)))

(declare-fun b!1388221 () Bool)

(assert (=> b!1388221 (= e!786390 (seekKeyOrZeroReturnVacant!0 (x!124732 lt!610244) (index!43117 lt!610244) (index!43117 lt!610244) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)) mask!2987))))

(declare-fun b!1388222 () Bool)

(declare-fun c!129211 () Bool)

(declare-fun lt!610245 () (_ BitVec 64))

(assert (=> b!1388222 (= c!129211 (= lt!610245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786392 () SeekEntryResult!10186)

(assert (=> b!1388222 (= e!786392 e!786390)))

(declare-fun lt!610243 () SeekEntryResult!10186)

(declare-fun d!149833 () Bool)

(assert (=> d!149833 (and (or ((_ is Undefined!10186) lt!610243) (not ((_ is Found!10186) lt!610243)) (and (bvsge (index!43116 lt!610243) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610243) (size!46393 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)))))) (or ((_ is Undefined!10186) lt!610243) ((_ is Found!10186) lt!610243) (not ((_ is MissingZero!10186) lt!610243)) (and (bvsge (index!43115 lt!610243) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610243) (size!46393 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)))))) (or ((_ is Undefined!10186) lt!610243) ((_ is Found!10186) lt!610243) ((_ is MissingZero!10186) lt!610243) (not ((_ is MissingVacant!10186) lt!610243)) (and (bvsge (index!43118 lt!610243) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610243) (size!46393 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)))))) (or ((_ is Undefined!10186) lt!610243) (ite ((_ is Found!10186) lt!610243) (= (select (arr!45843 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938))) (index!43116 lt!610243)) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10186) lt!610243) (= (select (arr!45843 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938))) (index!43115 lt!610243)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610243) (= (select (arr!45843 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938))) (index!43118 lt!610243)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149833 (= lt!610243 e!786391)))

(declare-fun c!129209 () Bool)

(assert (=> d!149833 (= c!129209 (and ((_ is Intermediate!10186) lt!610244) (undefined!10998 lt!610244)))))

(assert (=> d!149833 (= lt!610244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)) mask!2987))))

(assert (=> d!149833 (validMask!0 mask!2987)))

(assert (=> d!149833 (= (seekEntryOrOpen!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)) mask!2987) lt!610243)))

(declare-fun b!1388223 () Bool)

(assert (=> b!1388223 (= e!786391 e!786392)))

(assert (=> b!1388223 (= lt!610245 (select (arr!45843 (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938))) (index!43117 lt!610244)))))

(declare-fun c!129210 () Bool)

(assert (=> b!1388223 (= c!129210 (= lt!610245 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388224 () Bool)

(assert (=> b!1388224 (= e!786392 (Found!10186 (index!43117 lt!610244)))))

(assert (= (and d!149833 c!129209) b!1388220))

(assert (= (and d!149833 (not c!129209)) b!1388223))

(assert (= (and b!1388223 c!129210) b!1388224))

(assert (= (and b!1388223 (not c!129210)) b!1388222))

(assert (= (and b!1388222 c!129211) b!1388219))

(assert (= (and b!1388222 (not c!129211)) b!1388221))

(assert (=> b!1388221 m!1273593))

(declare-fun m!1273929 () Bool)

(assert (=> b!1388221 m!1273929))

(assert (=> d!149833 m!1273585))

(declare-fun m!1273931 () Bool)

(assert (=> d!149833 m!1273931))

(assert (=> d!149833 m!1273593))

(assert (=> d!149833 m!1273755))

(declare-fun m!1273933 () Bool)

(assert (=> d!149833 m!1273933))

(assert (=> d!149833 m!1273755))

(assert (=> d!149833 m!1273593))

(declare-fun m!1273935 () Bool)

(assert (=> d!149833 m!1273935))

(declare-fun m!1273937 () Bool)

(assert (=> d!149833 m!1273937))

(declare-fun m!1273939 () Bool)

(assert (=> b!1388223 m!1273939))

(assert (=> b!1388012 d!149833))

(declare-fun d!149835 () Bool)

(assert (=> d!149835 (arrayContainsKey!0 a!2938 lt!610122 #b00000000000000000000000000000000)))

(declare-fun lt!610246 () Unit!46400)

(assert (=> d!149835 (= lt!610246 (choose!13 a!2938 lt!610122 startIndex!16))))

(assert (=> d!149835 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149835 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610122 startIndex!16) lt!610246)))

(declare-fun bs!40347 () Bool)

(assert (= bs!40347 d!149835))

(assert (=> bs!40347 m!1273671))

(declare-fun m!1273941 () Bool)

(assert (=> bs!40347 m!1273941))

(assert (=> b!1387994 d!149835))

(declare-fun d!149837 () Bool)

(declare-fun res!928685 () Bool)

(declare-fun e!786393 () Bool)

(assert (=> d!149837 (=> res!928685 e!786393)))

(assert (=> d!149837 (= res!928685 (= (select (arr!45843 a!2938) #b00000000000000000000000000000000) lt!610122))))

(assert (=> d!149837 (= (arrayContainsKey!0 a!2938 lt!610122 #b00000000000000000000000000000000) e!786393)))

(declare-fun b!1388225 () Bool)

(declare-fun e!786394 () Bool)

(assert (=> b!1388225 (= e!786393 e!786394)))

(declare-fun res!928686 () Bool)

(assert (=> b!1388225 (=> (not res!928686) (not e!786394))))

(assert (=> b!1388225 (= res!928686 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46393 a!2938)))))

(declare-fun b!1388226 () Bool)

(assert (=> b!1388226 (= e!786394 (arrayContainsKey!0 a!2938 lt!610122 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149837 (not res!928685)) b!1388225))

(assert (= (and b!1388225 res!928686) b!1388226))

(assert (=> d!149837 m!1273641))

(declare-fun m!1273943 () Bool)

(assert (=> b!1388226 m!1273943))

(assert (=> b!1387994 d!149837))

(assert (=> b!1387994 d!149749))

(assert (=> b!1387973 d!149819))

(declare-fun b!1388227 () Bool)

(declare-fun e!786395 () Bool)

(declare-fun call!66624 () Bool)

(assert (=> b!1388227 (= e!786395 call!66624)))

(declare-fun b!1388228 () Bool)

(declare-fun e!786397 () Bool)

(assert (=> b!1388228 (= e!786397 e!786395)))

(declare-fun c!129212 () Bool)

(assert (=> b!1388228 (= c!129212 (validKeyInArray!0 (select (arr!45843 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!149839 () Bool)

(declare-fun res!928687 () Bool)

(assert (=> d!149839 (=> res!928687 e!786397)))

(assert (=> d!149839 (= res!928687 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46393 a!2938)))))

(assert (=> d!149839 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!786397)))

(declare-fun b!1388229 () Bool)

(declare-fun e!786396 () Bool)

(assert (=> b!1388229 (= e!786396 call!66624)))

(declare-fun b!1388230 () Bool)

(assert (=> b!1388230 (= e!786395 e!786396)))

(declare-fun lt!610249 () (_ BitVec 64))

(assert (=> b!1388230 (= lt!610249 (select (arr!45843 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610248 () Unit!46400)

(assert (=> b!1388230 (= lt!610248 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610249 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388230 (arrayContainsKey!0 a!2938 lt!610249 #b00000000000000000000000000000000)))

(declare-fun lt!610247 () Unit!46400)

(assert (=> b!1388230 (= lt!610247 lt!610248)))

(declare-fun res!928688 () Bool)

(assert (=> b!1388230 (= res!928688 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10186 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388230 (=> (not res!928688) (not e!786396))))

(declare-fun bm!66621 () Bool)

(assert (=> bm!66621 (= call!66624 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(assert (= (and d!149839 (not res!928687)) b!1388228))

(assert (= (and b!1388228 c!129212) b!1388230))

(assert (= (and b!1388228 (not c!129212)) b!1388227))

(assert (= (and b!1388230 res!928688) b!1388229))

(assert (= (or b!1388229 b!1388227) bm!66621))

(declare-fun m!1273945 () Bool)

(assert (=> b!1388228 m!1273945))

(assert (=> b!1388228 m!1273945))

(declare-fun m!1273947 () Bool)

(assert (=> b!1388228 m!1273947))

(assert (=> b!1388230 m!1273945))

(declare-fun m!1273949 () Bool)

(assert (=> b!1388230 m!1273949))

(declare-fun m!1273951 () Bool)

(assert (=> b!1388230 m!1273951))

(assert (=> b!1388230 m!1273945))

(declare-fun m!1273953 () Bool)

(assert (=> b!1388230 m!1273953))

(declare-fun m!1273955 () Bool)

(assert (=> bm!66621 m!1273955))

(assert (=> bm!66603 d!149839))

(declare-fun d!149841 () Bool)

(assert (=> d!149841 (= (validKeyInArray!0 (select (arr!45843 lt!610095) startIndex!16)) (and (not (= (select (arr!45843 lt!610095) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45843 lt!610095) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387988 d!149841))

(assert (=> b!1387972 d!149819))

(declare-fun d!149843 () Bool)

(assert (=> d!149843 (arrayContainsKey!0 a!2938 lt!610116 #b00000000000000000000000000000000)))

(declare-fun lt!610250 () Unit!46400)

(assert (=> d!149843 (= lt!610250 (choose!13 a!2938 lt!610116 #b00000000000000000000000000000000))))

(assert (=> d!149843 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149843 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610116 #b00000000000000000000000000000000) lt!610250)))

(declare-fun bs!40348 () Bool)

(assert (= bs!40348 d!149843))

(assert (=> bs!40348 m!1273651))

(declare-fun m!1273957 () Bool)

(assert (=> bs!40348 m!1273957))

(assert (=> b!1387986 d!149843))

(declare-fun d!149845 () Bool)

(declare-fun res!928689 () Bool)

(declare-fun e!786398 () Bool)

(assert (=> d!149845 (=> res!928689 e!786398)))

(assert (=> d!149845 (= res!928689 (= (select (arr!45843 a!2938) #b00000000000000000000000000000000) lt!610116))))

(assert (=> d!149845 (= (arrayContainsKey!0 a!2938 lt!610116 #b00000000000000000000000000000000) e!786398)))

(declare-fun b!1388231 () Bool)

(declare-fun e!786399 () Bool)

(assert (=> b!1388231 (= e!786398 e!786399)))

(declare-fun res!928690 () Bool)

(assert (=> b!1388231 (=> (not res!928690) (not e!786399))))

(assert (=> b!1388231 (= res!928690 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46393 a!2938)))))

(declare-fun b!1388232 () Bool)

(assert (=> b!1388232 (= e!786399 (arrayContainsKey!0 a!2938 lt!610116 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149845 (not res!928689)) b!1388231))

(assert (= (and b!1388231 res!928690) b!1388232))

(assert (=> d!149845 m!1273641))

(declare-fun m!1273959 () Bool)

(assert (=> b!1388232 m!1273959))

(assert (=> b!1387986 d!149845))

(declare-fun b!1388233 () Bool)

(declare-fun e!786400 () SeekEntryResult!10186)

(declare-fun lt!610252 () SeekEntryResult!10186)

(assert (=> b!1388233 (= e!786400 (MissingZero!10186 (index!43117 lt!610252)))))

(declare-fun b!1388234 () Bool)

(declare-fun e!786401 () SeekEntryResult!10186)

(assert (=> b!1388234 (= e!786401 Undefined!10186)))

(declare-fun b!1388235 () Bool)

(assert (=> b!1388235 (= e!786400 (seekKeyOrZeroReturnVacant!0 (x!124732 lt!610252) (index!43117 lt!610252) (index!43117 lt!610252) (select (arr!45843 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1388236 () Bool)

(declare-fun c!129215 () Bool)

(declare-fun lt!610253 () (_ BitVec 64))

(assert (=> b!1388236 (= c!129215 (= lt!610253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786402 () SeekEntryResult!10186)

(assert (=> b!1388236 (= e!786402 e!786400)))

(declare-fun d!149847 () Bool)

(declare-fun lt!610251 () SeekEntryResult!10186)

(assert (=> d!149847 (and (or ((_ is Undefined!10186) lt!610251) (not ((_ is Found!10186) lt!610251)) (and (bvsge (index!43116 lt!610251) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610251) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610251) ((_ is Found!10186) lt!610251) (not ((_ is MissingZero!10186) lt!610251)) (and (bvsge (index!43115 lt!610251) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610251) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610251) ((_ is Found!10186) lt!610251) ((_ is MissingZero!10186) lt!610251) (not ((_ is MissingVacant!10186) lt!610251)) (and (bvsge (index!43118 lt!610251) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610251) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610251) (ite ((_ is Found!10186) lt!610251) (= (select (arr!45843 a!2938) (index!43116 lt!610251)) (select (arr!45843 a!2938) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10186) lt!610251) (= (select (arr!45843 a!2938) (index!43115 lt!610251)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610251) (= (select (arr!45843 a!2938) (index!43118 lt!610251)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149847 (= lt!610251 e!786401)))

(declare-fun c!129213 () Bool)

(assert (=> d!149847 (= c!129213 (and ((_ is Intermediate!10186) lt!610252) (undefined!10998 lt!610252)))))

(assert (=> d!149847 (= lt!610252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45843 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45843 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149847 (validMask!0 mask!2987)))

(assert (=> d!149847 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!610251)))

(declare-fun b!1388237 () Bool)

(assert (=> b!1388237 (= e!786401 e!786402)))

(assert (=> b!1388237 (= lt!610253 (select (arr!45843 a!2938) (index!43117 lt!610252)))))

(declare-fun c!129214 () Bool)

(assert (=> b!1388237 (= c!129214 (= lt!610253 (select (arr!45843 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388238 () Bool)

(assert (=> b!1388238 (= e!786402 (Found!10186 (index!43117 lt!610252)))))

(assert (= (and d!149847 c!129213) b!1388234))

(assert (= (and d!149847 (not c!129213)) b!1388237))

(assert (= (and b!1388237 c!129214) b!1388238))

(assert (= (and b!1388237 (not c!129214)) b!1388236))

(assert (= (and b!1388236 c!129215) b!1388233))

(assert (= (and b!1388236 (not c!129215)) b!1388235))

(assert (=> b!1388235 m!1273641))

(declare-fun m!1273961 () Bool)

(assert (=> b!1388235 m!1273961))

(assert (=> d!149847 m!1273585))

(declare-fun m!1273963 () Bool)

(assert (=> d!149847 m!1273963))

(assert (=> d!149847 m!1273641))

(declare-fun m!1273965 () Bool)

(assert (=> d!149847 m!1273965))

(declare-fun m!1273967 () Bool)

(assert (=> d!149847 m!1273967))

(assert (=> d!149847 m!1273965))

(assert (=> d!149847 m!1273641))

(declare-fun m!1273969 () Bool)

(assert (=> d!149847 m!1273969))

(declare-fun m!1273971 () Bool)

(assert (=> d!149847 m!1273971))

(declare-fun m!1273973 () Bool)

(assert (=> b!1388237 m!1273973))

(assert (=> b!1387986 d!149847))

(declare-fun e!786433 () SeekEntryResult!10186)

(declare-fun b!1388291 () Bool)

(assert (=> b!1388291 (= e!786433 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124732 lt!610166) #b00000000000000000000000000000001) (nextIndex!0 (index!43117 lt!610166) (x!124732 lt!610166) mask!2987) (index!43117 lt!610166) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987))))

(declare-fun b!1388292 () Bool)

(assert (=> b!1388292 (= e!786433 (MissingVacant!10186 (index!43117 lt!610166)))))

(declare-fun b!1388293 () Bool)

(declare-fun e!786432 () SeekEntryResult!10186)

(declare-fun e!786434 () SeekEntryResult!10186)

(assert (=> b!1388293 (= e!786432 e!786434)))

(declare-fun lt!610277 () (_ BitVec 64))

(declare-fun c!129239 () Bool)

(assert (=> b!1388293 (= c!129239 (= lt!610277 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun lt!610276 () SeekEntryResult!10186)

(declare-fun d!149849 () Bool)

(assert (=> d!149849 (and (or ((_ is Undefined!10186) lt!610276) (not ((_ is Found!10186) lt!610276)) (and (bvsge (index!43116 lt!610276) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610276) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610276) ((_ is Found!10186) lt!610276) (not ((_ is MissingVacant!10186) lt!610276)) (not (= (index!43118 lt!610276) (index!43117 lt!610166))) (and (bvsge (index!43118 lt!610276) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610276) (size!46393 lt!610095)))) (or ((_ is Undefined!10186) lt!610276) (ite ((_ is Found!10186) lt!610276) (= (select (arr!45843 lt!610095) (index!43116 lt!610276)) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and ((_ is MissingVacant!10186) lt!610276) (= (index!43118 lt!610276) (index!43117 lt!610166)) (= (select (arr!45843 lt!610095) (index!43118 lt!610276)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149849 (= lt!610276 e!786432)))

(declare-fun c!129240 () Bool)

(assert (=> d!149849 (= c!129240 (bvsge (x!124732 lt!610166) #b01111111111111111111111111111110))))

(assert (=> d!149849 (= lt!610277 (select (arr!45843 lt!610095) (index!43117 lt!610166)))))

(assert (=> d!149849 (validMask!0 mask!2987)))

(assert (=> d!149849 (= (seekKeyOrZeroReturnVacant!0 (x!124732 lt!610166) (index!43117 lt!610166) (index!43117 lt!610166) (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610095 mask!2987) lt!610276)))

(declare-fun b!1388294 () Bool)

(assert (=> b!1388294 (= e!786434 (Found!10186 (index!43117 lt!610166)))))

(declare-fun b!1388295 () Bool)

(assert (=> b!1388295 (= e!786432 Undefined!10186)))

(declare-fun b!1388296 () Bool)

(declare-fun c!129241 () Bool)

(assert (=> b!1388296 (= c!129241 (= lt!610277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388296 (= e!786434 e!786433)))

(assert (= (and d!149849 c!129240) b!1388295))

(assert (= (and d!149849 (not c!129240)) b!1388293))

(assert (= (and b!1388293 c!129239) b!1388294))

(assert (= (and b!1388293 (not c!129239)) b!1388296))

(assert (= (and b!1388296 c!129241) b!1388292))

(assert (= (and b!1388296 (not c!129241)) b!1388291))

(declare-fun m!1274033 () Bool)

(assert (=> b!1388291 m!1274033))

(assert (=> b!1388291 m!1274033))

(assert (=> b!1388291 m!1273593))

(declare-fun m!1274035 () Bool)

(assert (=> b!1388291 m!1274035))

(declare-fun m!1274037 () Bool)

(assert (=> d!149849 m!1274037))

(declare-fun m!1274039 () Bool)

(assert (=> d!149849 m!1274039))

(assert (=> d!149849 m!1273763))

(assert (=> d!149849 m!1273585))

(assert (=> b!1388080 d!149849))

(declare-fun b!1388297 () Bool)

(declare-fun e!786436 () SeekEntryResult!10186)

(assert (=> b!1388297 (= e!786436 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124732 lt!610154) #b00000000000000000000000000000001) (nextIndex!0 (index!43117 lt!610154) (x!124732 lt!610154) mask!2987) (index!43117 lt!610154) (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388298 () Bool)

(assert (=> b!1388298 (= e!786436 (MissingVacant!10186 (index!43117 lt!610154)))))

(declare-fun b!1388299 () Bool)

(declare-fun e!786435 () SeekEntryResult!10186)

(declare-fun e!786437 () SeekEntryResult!10186)

(assert (=> b!1388299 (= e!786435 e!786437)))

(declare-fun c!129242 () Bool)

(declare-fun lt!610279 () (_ BitVec 64))

(assert (=> b!1388299 (= c!129242 (= lt!610279 (select (arr!45843 a!2938) startIndex!16)))))

(declare-fun lt!610278 () SeekEntryResult!10186)

(declare-fun d!149865 () Bool)

(assert (=> d!149865 (and (or ((_ is Undefined!10186) lt!610278) (not ((_ is Found!10186) lt!610278)) (and (bvsge (index!43116 lt!610278) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610278) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610278) ((_ is Found!10186) lt!610278) (not ((_ is MissingVacant!10186) lt!610278)) (not (= (index!43118 lt!610278) (index!43117 lt!610154))) (and (bvsge (index!43118 lt!610278) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610278) (size!46393 a!2938)))) (or ((_ is Undefined!10186) lt!610278) (ite ((_ is Found!10186) lt!610278) (= (select (arr!45843 a!2938) (index!43116 lt!610278)) (select (arr!45843 a!2938) startIndex!16)) (and ((_ is MissingVacant!10186) lt!610278) (= (index!43118 lt!610278) (index!43117 lt!610154)) (= (select (arr!45843 a!2938) (index!43118 lt!610278)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149865 (= lt!610278 e!786435)))

(declare-fun c!129243 () Bool)

(assert (=> d!149865 (= c!129243 (bvsge (x!124732 lt!610154) #b01111111111111111111111111111110))))

(assert (=> d!149865 (= lt!610279 (select (arr!45843 a!2938) (index!43117 lt!610154)))))

(assert (=> d!149865 (validMask!0 mask!2987)))

(assert (=> d!149865 (= (seekKeyOrZeroReturnVacant!0 (x!124732 lt!610154) (index!43117 lt!610154) (index!43117 lt!610154) (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) lt!610278)))

(declare-fun b!1388300 () Bool)

(assert (=> b!1388300 (= e!786437 (Found!10186 (index!43117 lt!610154)))))

(declare-fun b!1388301 () Bool)

(assert (=> b!1388301 (= e!786435 Undefined!10186)))

(declare-fun b!1388302 () Bool)

(declare-fun c!129244 () Bool)

(assert (=> b!1388302 (= c!129244 (= lt!610279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388302 (= e!786437 e!786436)))

(assert (= (and d!149865 c!129243) b!1388301))

(assert (= (and d!149865 (not c!129243)) b!1388299))

(assert (= (and b!1388299 c!129242) b!1388300))

(assert (= (and b!1388299 (not c!129242)) b!1388302))

(assert (= (and b!1388302 c!129244) b!1388298))

(assert (= (and b!1388302 (not c!129244)) b!1388297))

(declare-fun m!1274041 () Bool)

(assert (=> b!1388297 m!1274041))

(assert (=> b!1388297 m!1274041))

(assert (=> b!1388297 m!1273581))

(declare-fun m!1274043 () Bool)

(assert (=> b!1388297 m!1274043))

(declare-fun m!1274045 () Bool)

(assert (=> d!149865 m!1274045))

(declare-fun m!1274047 () Bool)

(assert (=> d!149865 m!1274047))

(assert (=> d!149865 m!1273731))

(assert (=> d!149865 m!1273585))

(assert (=> b!1388065 d!149865))

(declare-fun d!149867 () Bool)

(declare-fun res!928698 () Bool)

(declare-fun e!786439 () Bool)

(assert (=> d!149867 (=> res!928698 e!786439)))

(assert (=> d!149867 (= res!928698 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46393 a!2938)))))

(assert (=> d!149867 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129132 (Cons!32367 (select (arr!45843 a!2938) #b00000000000000000000000000000000) Nil!32368) Nil!32368)) e!786439)))

(declare-fun b!1388303 () Bool)

(declare-fun e!786438 () Bool)

(declare-fun call!66627 () Bool)

(assert (=> b!1388303 (= e!786438 call!66627)))

(declare-fun c!129245 () Bool)

(declare-fun bm!66624 () Bool)

(assert (=> bm!66624 (= call!66627 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129245 (Cons!32367 (select (arr!45843 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!129132 (Cons!32367 (select (arr!45843 a!2938) #b00000000000000000000000000000000) Nil!32368) Nil!32368)) (ite c!129132 (Cons!32367 (select (arr!45843 a!2938) #b00000000000000000000000000000000) Nil!32368) Nil!32368))))))

(declare-fun b!1388304 () Bool)

(assert (=> b!1388304 (= e!786438 call!66627)))

(declare-fun b!1388305 () Bool)

(declare-fun e!786440 () Bool)

(assert (=> b!1388305 (= e!786439 e!786440)))

(declare-fun res!928697 () Bool)

(assert (=> b!1388305 (=> (not res!928697) (not e!786440))))

(declare-fun e!786441 () Bool)

(assert (=> b!1388305 (= res!928697 (not e!786441))))

(declare-fun res!928699 () Bool)

(assert (=> b!1388305 (=> (not res!928699) (not e!786441))))

(assert (=> b!1388305 (= res!928699 (validKeyInArray!0 (select (arr!45843 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388306 () Bool)

(assert (=> b!1388306 (= e!786440 e!786438)))

(assert (=> b!1388306 (= c!129245 (validKeyInArray!0 (select (arr!45843 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388307 () Bool)

(assert (=> b!1388307 (= e!786441 (contains!9748 (ite c!129132 (Cons!32367 (select (arr!45843 a!2938) #b00000000000000000000000000000000) Nil!32368) Nil!32368) (select (arr!45843 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!149867 (not res!928698)) b!1388305))

(assert (= (and b!1388305 res!928699) b!1388307))

(assert (= (and b!1388305 res!928697) b!1388306))

(assert (= (and b!1388306 c!129245) b!1388303))

(assert (= (and b!1388306 (not c!129245)) b!1388304))

(assert (= (or b!1388303 b!1388304) bm!66624))

(declare-fun m!1274049 () Bool)

(assert (=> bm!66624 m!1274049))

(declare-fun m!1274051 () Bool)

(assert (=> bm!66624 m!1274051))

(assert (=> b!1388305 m!1274049))

(assert (=> b!1388305 m!1274049))

(declare-fun m!1274053 () Bool)

(assert (=> b!1388305 m!1274053))

(assert (=> b!1388306 m!1274049))

(assert (=> b!1388306 m!1274049))

(assert (=> b!1388306 m!1274053))

(assert (=> b!1388307 m!1274049))

(assert (=> b!1388307 m!1274049))

(declare-fun m!1274055 () Bool)

(assert (=> b!1388307 m!1274055))

(assert (=> bm!66598 d!149867))

(declare-fun b!1388308 () Bool)

(declare-fun e!786442 () Bool)

(declare-fun call!66628 () Bool)

(assert (=> b!1388308 (= e!786442 call!66628)))

(declare-fun b!1388309 () Bool)

(declare-fun e!786444 () Bool)

(assert (=> b!1388309 (= e!786444 e!786442)))

(declare-fun c!129246 () Bool)

(assert (=> b!1388309 (= c!129246 (validKeyInArray!0 (select (arr!45843 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!149869 () Bool)

(declare-fun res!928700 () Bool)

(assert (=> d!149869 (=> res!928700 e!786444)))

(assert (=> d!149869 (= res!928700 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46393 a!2938)))))

(assert (=> d!149869 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!786444)))

(declare-fun b!1388310 () Bool)

(declare-fun e!786443 () Bool)

(assert (=> b!1388310 (= e!786443 call!66628)))

(declare-fun b!1388311 () Bool)

(assert (=> b!1388311 (= e!786442 e!786443)))

(declare-fun lt!610282 () (_ BitVec 64))

(assert (=> b!1388311 (= lt!610282 (select (arr!45843 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!610281 () Unit!46400)

(assert (=> b!1388311 (= lt!610281 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610282 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1388311 (arrayContainsKey!0 a!2938 lt!610282 #b00000000000000000000000000000000)))

(declare-fun lt!610280 () Unit!46400)

(assert (=> b!1388311 (= lt!610280 lt!610281)))

(declare-fun res!928701 () Bool)

(assert (=> b!1388311 (= res!928701 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1388311 (=> (not res!928701) (not e!786443))))

(declare-fun bm!66625 () Bool)

(assert (=> bm!66625 (= call!66628 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(assert (= (and d!149869 (not res!928700)) b!1388309))

(assert (= (and b!1388309 c!129246) b!1388311))

(assert (= (and b!1388309 (not c!129246)) b!1388308))

(assert (= (and b!1388311 res!928701) b!1388310))

(assert (= (or b!1388310 b!1388308) bm!66625))

(assert (=> b!1388309 m!1274049))

(assert (=> b!1388309 m!1274049))

(assert (=> b!1388309 m!1274053))

(assert (=> b!1388311 m!1274049))

(declare-fun m!1274057 () Bool)

(assert (=> b!1388311 m!1274057))

(declare-fun m!1274059 () Bool)

(assert (=> b!1388311 m!1274059))

(assert (=> b!1388311 m!1274049))

(declare-fun m!1274061 () Bool)

(assert (=> b!1388311 m!1274061))

(declare-fun m!1274063 () Bool)

(assert (=> bm!66625 m!1274063))

(assert (=> bm!66601 d!149869))

(declare-fun d!149871 () Bool)

(assert (=> d!149871 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94938 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46393 a!2938)) mask!2987))))

(assert (=> d!149871 true))

(declare-fun _$42!28 () Unit!46400)

(assert (=> d!149871 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!28)))

(declare-fun bs!40350 () Bool)

(assert (= bs!40350 d!149871))

(assert (=> bs!40350 m!1273593))

(assert (=> bs!40350 m!1273581))

(assert (=> bs!40350 m!1273601))

(assert (=> bs!40350 m!1273581))

(assert (=> bs!40350 m!1273595))

(assert (=> bs!40350 m!1273593))

(assert (=> bs!40350 m!1273685))

(assert (=> d!149739 d!149871))

(assert (=> d!149739 d!149779))

(declare-fun b!1388322 () Bool)

(declare-fun lt!610288 () SeekEntryResult!10186)

(assert (=> b!1388322 (and (bvsge (index!43117 lt!610288) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610288) (size!46393 a!2938)))))

(declare-fun e!786453 () Bool)

(assert (=> b!1388322 (= e!786453 (= (select (arr!45843 a!2938) (index!43117 lt!610288)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388323 () Bool)

(assert (=> b!1388323 (and (bvsge (index!43117 lt!610288) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610288) (size!46393 a!2938)))))

(declare-fun res!928702 () Bool)

(assert (=> b!1388323 (= res!928702 (= (select (arr!45843 a!2938) (index!43117 lt!610288)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388323 (=> res!928702 e!786453)))

(declare-fun b!1388324 () Bool)

(assert (=> b!1388324 (and (bvsge (index!43117 lt!610288) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610288) (size!46393 a!2938)))))

(declare-fun res!928704 () Bool)

(assert (=> b!1388324 (= res!928704 (= (select (arr!45843 a!2938) (index!43117 lt!610288)) (select (arr!45843 a!2938) startIndex!16)))))

(assert (=> b!1388324 (=> res!928704 e!786453)))

(declare-fun e!786449 () Bool)

(assert (=> b!1388324 (= e!786449 e!786453)))

(declare-fun d!149873 () Bool)

(declare-fun e!786450 () Bool)

(assert (=> d!149873 e!786450))

(declare-fun c!129252 () Bool)

(assert (=> d!149873 (= c!129252 (and ((_ is Intermediate!10186) lt!610288) (undefined!10998 lt!610288)))))

(declare-fun e!786451 () SeekEntryResult!10186)

(assert (=> d!149873 (= lt!610288 e!786451)))

(declare-fun c!129251 () Bool)

(assert (=> d!149873 (= c!129251 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!610287 () (_ BitVec 64))

(assert (=> d!149873 (= lt!610287 (select (arr!45843 a!2938) (toIndex!0 (select (arr!45843 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!149873 (validMask!0 mask!2987)))

(assert (=> d!149873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45843 a!2938) startIndex!16) mask!2987) (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) lt!610288)))

(declare-fun b!1388325 () Bool)

(assert (=> b!1388325 (= e!786451 (Intermediate!10186 true (toIndex!0 (select (arr!45843 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun e!786452 () SeekEntryResult!10186)

(declare-fun b!1388326 () Bool)

(assert (=> b!1388326 (= e!786452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45843 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388327 () Bool)

(assert (=> b!1388327 (= e!786451 e!786452)))

(declare-fun c!129253 () Bool)

(assert (=> b!1388327 (= c!129253 (or (= lt!610287 (select (arr!45843 a!2938) startIndex!16)) (= (bvadd lt!610287 lt!610287) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388328 () Bool)

(assert (=> b!1388328 (= e!786452 (Intermediate!10186 false (toIndex!0 (select (arr!45843 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388329 () Bool)

(assert (=> b!1388329 (= e!786450 (bvsge (x!124732 lt!610288) #b01111111111111111111111111111110))))

(declare-fun b!1388330 () Bool)

(assert (=> b!1388330 (= e!786450 e!786449)))

(declare-fun res!928703 () Bool)

(assert (=> b!1388330 (= res!928703 (and ((_ is Intermediate!10186) lt!610288) (not (undefined!10998 lt!610288)) (bvslt (x!124732 lt!610288) #b01111111111111111111111111111110) (bvsge (x!124732 lt!610288) #b00000000000000000000000000000000) (bvsge (x!124732 lt!610288) #b00000000000000000000000000000000)))))

(assert (=> b!1388330 (=> (not res!928703) (not e!786449))))

(assert (= (and d!149873 c!129251) b!1388325))

(assert (= (and d!149873 (not c!129251)) b!1388327))

(assert (= (and b!1388327 c!129253) b!1388328))

(assert (= (and b!1388327 (not c!129253)) b!1388326))

(assert (= (and d!149873 c!129252) b!1388329))

(assert (= (and d!149873 (not c!129252)) b!1388330))

(assert (= (and b!1388330 res!928703) b!1388324))

(assert (= (and b!1388324 (not res!928704)) b!1388323))

(assert (= (and b!1388323 (not res!928702)) b!1388322))

(declare-fun m!1274065 () Bool)

(assert (=> b!1388324 m!1274065))

(assert (=> b!1388326 m!1273723))

(declare-fun m!1274067 () Bool)

(assert (=> b!1388326 m!1274067))

(assert (=> b!1388326 m!1274067))

(assert (=> b!1388326 m!1273581))

(declare-fun m!1274069 () Bool)

(assert (=> b!1388326 m!1274069))

(assert (=> d!149873 m!1273723))

(declare-fun m!1274071 () Bool)

(assert (=> d!149873 m!1274071))

(assert (=> d!149873 m!1273585))

(assert (=> b!1388323 m!1274065))

(assert (=> b!1388322 m!1274065))

(assert (=> d!149749 d!149873))

(declare-fun d!149875 () Bool)

(declare-fun lt!610290 () (_ BitVec 32))

(declare-fun lt!610289 () (_ BitVec 32))

(assert (=> d!149875 (= lt!610290 (bvmul (bvxor lt!610289 (bvlshr lt!610289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149875 (= lt!610289 ((_ extract 31 0) (bvand (bvxor (select (arr!45843 a!2938) startIndex!16) (bvlshr (select (arr!45843 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149875 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928668 (let ((h!33581 ((_ extract 31 0) (bvand (bvxor (select (arr!45843 a!2938) startIndex!16) (bvlshr (select (arr!45843 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124735 (bvmul (bvxor h!33581 (bvlshr h!33581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124735 (bvlshr x!124735 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928668 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928668 #b00000000000000000000000000000000))))))

(assert (=> d!149875 (= (toIndex!0 (select (arr!45843 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!610290 (bvlshr lt!610290 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149749 d!149875))

(assert (=> d!149749 d!149779))

(assert (=> b!1387992 d!149727))

(check-sat (not b!1388206) (not d!149835) (not b!1388297) (not d!149821) (not d!149873) (not b!1388311) (not d!149847) (not b!1388226) (not d!149843) (not d!149799) (not b!1388305) (not b!1388180) (not b!1388326) (not d!149833) (not bm!66624) (not d!149865) (not b!1388309) (not b!1388235) (not b!1388202) (not bm!66620) (not b!1388204) (not b!1388230) (not b!1388221) (not bm!66621) (not d!149831) (not b!1388212) (not d!149849) (not b!1388232) (not bm!66625) (not d!149801) (not b!1388215) (not d!149871) (not b!1388228) (not b!1388291) (not d!149827) (not b!1388306) (not b!1388307))
(check-sat)
