; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118646 () Bool)

(assert start!118646)

(declare-fun b!1387161 () Bool)

(declare-fun res!928207 () Bool)

(declare-fun e!785727 () Bool)

(assert (=> b!1387161 (=> (not res!928207) (not e!785727))))

(declare-datatypes ((array!94922 0))(
  ( (array!94923 (arr!45837 (Array (_ BitVec 32) (_ BitVec 64))) (size!46387 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94922)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387161 (= res!928207 (validKeyInArray!0 (select (arr!45837 a!2938) i!1065)))))

(declare-fun b!1387162 () Bool)

(declare-fun res!928209 () Bool)

(assert (=> b!1387162 (=> (not res!928209) (not e!785727))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94922 (_ BitVec 32)) Bool)

(assert (=> b!1387162 (= res!928209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387163 () Bool)

(declare-datatypes ((Unit!46382 0))(
  ( (Unit!46383) )
))
(declare-fun e!785728 () Unit!46382)

(declare-fun Unit!46384 () Unit!46382)

(assert (=> b!1387163 (= e!785728 Unit!46384)))

(declare-fun b!1387164 () Bool)

(declare-fun res!928204 () Bool)

(assert (=> b!1387164 (=> (not res!928204) (not e!785727))))

(declare-datatypes ((List!32365 0))(
  ( (Nil!32362) (Cons!32361 (h!33570 (_ BitVec 64)) (t!47059 List!32365)) )
))
(declare-fun arrayNoDuplicates!0 (array!94922 (_ BitVec 32) List!32365) Bool)

(assert (=> b!1387164 (= res!928204 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32362))))

(declare-fun b!1387165 () Bool)

(declare-fun res!928210 () Bool)

(assert (=> b!1387165 (=> (not res!928210) (not e!785727))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387165 (= res!928210 (and (= (size!46387 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46387 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46387 a!2938))))))

(declare-fun b!1387166 () Bool)

(declare-fun lt!609732 () Unit!46382)

(assert (=> b!1387166 (= e!785728 lt!609732)))

(declare-fun lt!609730 () Unit!46382)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46382)

(assert (=> b!1387166 (= lt!609730 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun lt!609729 () array!94922)

(declare-datatypes ((SeekEntryResult!10180 0))(
  ( (MissingZero!10180 (index!43091 (_ BitVec 32))) (Found!10180 (index!43092 (_ BitVec 32))) (Intermediate!10180 (undefined!10992 Bool) (index!43093 (_ BitVec 32)) (x!124701 (_ BitVec 32))) (Undefined!10180) (MissingVacant!10180 (index!43094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94922 (_ BitVec 32)) SeekEntryResult!10180)

(assert (=> b!1387166 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46382)

(assert (=> b!1387166 (= lt!609732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387166 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928206 () Bool)

(assert (=> start!118646 (=> (not res!928206) (not e!785727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118646 (= res!928206 (validMask!0 mask!2987))))

(assert (=> start!118646 e!785727))

(assert (=> start!118646 true))

(declare-fun array_inv!34865 (array!94922) Bool)

(assert (=> start!118646 (array_inv!34865 a!2938)))

(declare-fun b!1387167 () Bool)

(declare-fun res!928205 () Bool)

(assert (=> b!1387167 (=> (not res!928205) (not e!785727))))

(assert (=> b!1387167 (= res!928205 (and (not (= (select (arr!45837 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45837 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387168 () Bool)

(declare-fun e!785725 () Bool)

(assert (=> b!1387168 (= e!785725 (validKeyInArray!0 (select (arr!45837 a!2938) startIndex!16)))))

(declare-fun b!1387169 () Bool)

(declare-fun e!785729 () Bool)

(assert (=> b!1387169 (= e!785727 e!785729)))

(declare-fun res!928208 () Bool)

(assert (=> b!1387169 (=> (not res!928208) (not e!785729))))

(assert (=> b!1387169 (= res!928208 (and (bvslt startIndex!16 (bvsub (size!46387 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609728 () Unit!46382)

(assert (=> b!1387169 (= lt!609728 e!785728)))

(declare-fun c!128919 () Bool)

(assert (=> b!1387169 (= c!128919 e!785725)))

(declare-fun res!928203 () Bool)

(assert (=> b!1387169 (=> (not res!928203) (not e!785725))))

(assert (=> b!1387169 (= res!928203 (not (= startIndex!16 i!1065)))))

(assert (=> b!1387169 (= lt!609729 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)))))

(declare-fun b!1387170 () Bool)

(assert (=> b!1387170 (= e!785729 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609729 mask!2987)))))

(assert (=> b!1387170 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609729 mask!2987)))

(declare-fun lt!609731 () Unit!46382)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46382)

(assert (=> b!1387170 (= lt!609731 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(assert (= (and start!118646 res!928206) b!1387165))

(assert (= (and b!1387165 res!928210) b!1387161))

(assert (= (and b!1387161 res!928207) b!1387164))

(assert (= (and b!1387164 res!928204) b!1387162))

(assert (= (and b!1387162 res!928209) b!1387167))

(assert (= (and b!1387167 res!928205) b!1387169))

(assert (= (and b!1387169 res!928203) b!1387168))

(assert (= (and b!1387169 c!128919) b!1387166))

(assert (= (and b!1387169 (not c!128919)) b!1387163))

(assert (= (and b!1387169 res!928208) b!1387170))

(declare-fun m!1272609 () Bool)

(assert (=> b!1387164 m!1272609))

(declare-fun m!1272611 () Bool)

(assert (=> b!1387169 m!1272611))

(declare-fun m!1272613 () Bool)

(assert (=> start!118646 m!1272613))

(declare-fun m!1272615 () Bool)

(assert (=> start!118646 m!1272615))

(declare-fun m!1272617 () Bool)

(assert (=> b!1387161 m!1272617))

(assert (=> b!1387161 m!1272617))

(declare-fun m!1272619 () Bool)

(assert (=> b!1387161 m!1272619))

(assert (=> b!1387167 m!1272617))

(declare-fun m!1272621 () Bool)

(assert (=> b!1387166 m!1272621))

(declare-fun m!1272623 () Bool)

(assert (=> b!1387166 m!1272623))

(assert (=> b!1387166 m!1272611))

(declare-fun m!1272625 () Bool)

(assert (=> b!1387166 m!1272625))

(assert (=> b!1387166 m!1272623))

(declare-fun m!1272627 () Bool)

(assert (=> b!1387166 m!1272627))

(declare-fun m!1272629 () Bool)

(assert (=> b!1387166 m!1272629))

(declare-fun m!1272631 () Bool)

(assert (=> b!1387166 m!1272631))

(assert (=> b!1387166 m!1272629))

(declare-fun m!1272633 () Bool)

(assert (=> b!1387166 m!1272633))

(assert (=> b!1387168 m!1272629))

(assert (=> b!1387168 m!1272629))

(declare-fun m!1272635 () Bool)

(assert (=> b!1387168 m!1272635))

(declare-fun m!1272637 () Bool)

(assert (=> b!1387162 m!1272637))

(declare-fun m!1272639 () Bool)

(assert (=> b!1387170 m!1272639))

(declare-fun m!1272641 () Bool)

(assert (=> b!1387170 m!1272641))

(declare-fun m!1272643 () Bool)

(assert (=> b!1387170 m!1272643))

(check-sat (not b!1387162) (not b!1387166) (not start!118646) (not b!1387164) (not b!1387161) (not b!1387168) (not b!1387170))
(check-sat)
(get-model)

(declare-fun d!149453 () Bool)

(assert (=> d!149453 (= (validKeyInArray!0 (select (arr!45837 a!2938) i!1065)) (and (not (= (select (arr!45837 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45837 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387161 d!149453))

(declare-fun d!149455 () Bool)

(assert (=> d!149455 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118646 d!149455))

(declare-fun d!149457 () Bool)

(assert (=> d!149457 (= (array_inv!34865 a!2938) (bvsge (size!46387 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118646 d!149457))

(declare-fun d!149459 () Bool)

(assert (=> d!149459 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!609750 () Unit!46382)

(declare-fun choose!38 (array!94922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46382)

(assert (=> d!149459 (= lt!609750 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149459 (validMask!0 mask!2987)))

(assert (=> d!149459 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!609750)))

(declare-fun bs!40310 () Bool)

(assert (= bs!40310 d!149459))

(assert (=> bs!40310 m!1272633))

(declare-fun m!1272681 () Bool)

(assert (=> bs!40310 m!1272681))

(assert (=> bs!40310 m!1272613))

(assert (=> b!1387166 d!149459))

(declare-fun call!66556 () Bool)

(declare-fun bm!66553 () Bool)

(assert (=> bm!66553 (= call!66556 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387209 () Bool)

(declare-fun e!785752 () Bool)

(declare-fun e!785751 () Bool)

(assert (=> b!1387209 (= e!785752 e!785751)))

(declare-fun lt!609759 () (_ BitVec 64))

(assert (=> b!1387209 (= lt!609759 (select (arr!45837 a!2938) startIndex!16))))

(declare-fun lt!609758 () Unit!46382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94922 (_ BitVec 64) (_ BitVec 32)) Unit!46382)

(assert (=> b!1387209 (= lt!609758 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609759 startIndex!16))))

(declare-fun arrayContainsKey!0 (array!94922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1387209 (arrayContainsKey!0 a!2938 lt!609759 #b00000000000000000000000000000000)))

(declare-fun lt!609757 () Unit!46382)

(assert (=> b!1387209 (= lt!609757 lt!609758)))

(declare-fun res!928239 () Bool)

(assert (=> b!1387209 (= res!928239 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987) (Found!10180 startIndex!16)))))

(assert (=> b!1387209 (=> (not res!928239) (not e!785751))))

(declare-fun b!1387210 () Bool)

(declare-fun e!785753 () Bool)

(assert (=> b!1387210 (= e!785753 e!785752)))

(declare-fun c!128925 () Bool)

(assert (=> b!1387210 (= c!128925 (validKeyInArray!0 (select (arr!45837 a!2938) startIndex!16)))))

(declare-fun d!149461 () Bool)

(declare-fun res!928240 () Bool)

(assert (=> d!149461 (=> res!928240 e!785753)))

(assert (=> d!149461 (= res!928240 (bvsge startIndex!16 (size!46387 a!2938)))))

(assert (=> d!149461 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!785753)))

(declare-fun b!1387211 () Bool)

(assert (=> b!1387211 (= e!785752 call!66556)))

(declare-fun b!1387212 () Bool)

(assert (=> b!1387212 (= e!785751 call!66556)))

(assert (= (and d!149461 (not res!928240)) b!1387210))

(assert (= (and b!1387210 c!128925) b!1387209))

(assert (= (and b!1387210 (not c!128925)) b!1387211))

(assert (= (and b!1387209 res!928239) b!1387212))

(assert (= (or b!1387212 b!1387211) bm!66553))

(declare-fun m!1272683 () Bool)

(assert (=> bm!66553 m!1272683))

(assert (=> b!1387209 m!1272629))

(declare-fun m!1272685 () Bool)

(assert (=> b!1387209 m!1272685))

(declare-fun m!1272687 () Bool)

(assert (=> b!1387209 m!1272687))

(assert (=> b!1387209 m!1272629))

(assert (=> b!1387209 m!1272631))

(assert (=> b!1387210 m!1272629))

(assert (=> b!1387210 m!1272629))

(assert (=> b!1387210 m!1272635))

(assert (=> b!1387166 d!149461))

(declare-fun d!149465 () Bool)

(declare-fun e!785782 () Bool)

(assert (=> d!149465 e!785782))

(declare-fun res!928262 () Bool)

(assert (=> d!149465 (=> (not res!928262) (not e!785782))))

(assert (=> d!149465 (= res!928262 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46387 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46387 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46387 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46387 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46387 a!2938))))))

(declare-fun lt!609776 () Unit!46382)

(declare-fun choose!14 (array!94922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46382)

(assert (=> d!149465 (= lt!609776 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149465 (validMask!0 mask!2987)))

(assert (=> d!149465 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!609776)))

(declare-fun b!1387248 () Bool)

(assert (=> b!1387248 (= e!785782 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987)))))

(assert (= (and d!149465 res!928262) b!1387248))

(declare-fun m!1272721 () Bool)

(assert (=> d!149465 m!1272721))

(assert (=> d!149465 m!1272613))

(assert (=> b!1387248 m!1272623))

(assert (=> b!1387248 m!1272629))

(assert (=> b!1387248 m!1272623))

(declare-fun m!1272725 () Bool)

(assert (=> b!1387248 m!1272725))

(assert (=> b!1387248 m!1272629))

(assert (=> b!1387248 m!1272631))

(assert (=> b!1387248 m!1272611))

(assert (=> b!1387166 d!149465))

(declare-fun b!1387293 () Bool)

(declare-fun c!128949 () Bool)

(declare-fun lt!609809 () (_ BitVec 64))

(assert (=> b!1387293 (= c!128949 (= lt!609809 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785812 () SeekEntryResult!10180)

(declare-fun e!785811 () SeekEntryResult!10180)

(assert (=> b!1387293 (= e!785812 e!785811)))

(declare-fun b!1387294 () Bool)

(declare-fun e!785813 () SeekEntryResult!10180)

(assert (=> b!1387294 (= e!785813 Undefined!10180)))

(declare-fun lt!609810 () SeekEntryResult!10180)

(declare-fun d!149483 () Bool)

(get-info :version)

(assert (=> d!149483 (and (or ((_ is Undefined!10180) lt!609810) (not ((_ is Found!10180) lt!609810)) (and (bvsge (index!43092 lt!609810) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609810) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609810) ((_ is Found!10180) lt!609810) (not ((_ is MissingZero!10180) lt!609810)) (and (bvsge (index!43091 lt!609810) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609810) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609810) ((_ is Found!10180) lt!609810) ((_ is MissingZero!10180) lt!609810) (not ((_ is MissingVacant!10180) lt!609810)) (and (bvsge (index!43094 lt!609810) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609810) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609810) (ite ((_ is Found!10180) lt!609810) (= (select (arr!45837 lt!609729) (index!43092 lt!609810)) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609810) (= (select (arr!45837 lt!609729) (index!43091 lt!609810)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609810) (= (select (arr!45837 lt!609729) (index!43094 lt!609810)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149483 (= lt!609810 e!785813)))

(declare-fun c!128950 () Bool)

(declare-fun lt!609808 () SeekEntryResult!10180)

(assert (=> d!149483 (= c!128950 (and ((_ is Intermediate!10180) lt!609808) (undefined!10992 lt!609808)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94922 (_ BitVec 32)) SeekEntryResult!10180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149483 (= lt!609808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987))))

(assert (=> d!149483 (validMask!0 mask!2987)))

(assert (=> d!149483 (= (seekEntryOrOpen!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987) lt!609810)))

(declare-fun b!1387295 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94922 (_ BitVec 32)) SeekEntryResult!10180)

(assert (=> b!1387295 (= e!785811 (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609808) (index!43093 lt!609808) (index!43093 lt!609808) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987))))

(declare-fun b!1387296 () Bool)

(assert (=> b!1387296 (= e!785813 e!785812)))

(assert (=> b!1387296 (= lt!609809 (select (arr!45837 lt!609729) (index!43093 lt!609808)))))

(declare-fun c!128951 () Bool)

(assert (=> b!1387296 (= c!128951 (= lt!609809 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387297 () Bool)

(assert (=> b!1387297 (= e!785812 (Found!10180 (index!43093 lt!609808)))))

(declare-fun b!1387298 () Bool)

(assert (=> b!1387298 (= e!785811 (MissingZero!10180 (index!43093 lt!609808)))))

(assert (= (and d!149483 c!128950) b!1387294))

(assert (= (and d!149483 (not c!128950)) b!1387296))

(assert (= (and b!1387296 c!128951) b!1387297))

(assert (= (and b!1387296 (not c!128951)) b!1387293))

(assert (= (and b!1387293 c!128949) b!1387298))

(assert (= (and b!1387293 (not c!128949)) b!1387295))

(declare-fun m!1272753 () Bool)

(assert (=> d!149483 m!1272753))

(assert (=> d!149483 m!1272613))

(declare-fun m!1272755 () Bool)

(assert (=> d!149483 m!1272755))

(assert (=> d!149483 m!1272623))

(declare-fun m!1272757 () Bool)

(assert (=> d!149483 m!1272757))

(declare-fun m!1272759 () Bool)

(assert (=> d!149483 m!1272759))

(declare-fun m!1272761 () Bool)

(assert (=> d!149483 m!1272761))

(assert (=> d!149483 m!1272623))

(assert (=> d!149483 m!1272755))

(assert (=> b!1387295 m!1272623))

(declare-fun m!1272763 () Bool)

(assert (=> b!1387295 m!1272763))

(declare-fun m!1272765 () Bool)

(assert (=> b!1387296 m!1272765))

(assert (=> b!1387166 d!149483))

(declare-fun b!1387305 () Bool)

(declare-fun c!128955 () Bool)

(declare-fun lt!609815 () (_ BitVec 64))

(assert (=> b!1387305 (= c!128955 (= lt!609815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785818 () SeekEntryResult!10180)

(declare-fun e!785817 () SeekEntryResult!10180)

(assert (=> b!1387305 (= e!785818 e!785817)))

(declare-fun b!1387306 () Bool)

(declare-fun e!785819 () SeekEntryResult!10180)

(assert (=> b!1387306 (= e!785819 Undefined!10180)))

(declare-fun d!149495 () Bool)

(declare-fun lt!609816 () SeekEntryResult!10180)

(assert (=> d!149495 (and (or ((_ is Undefined!10180) lt!609816) (not ((_ is Found!10180) lt!609816)) (and (bvsge (index!43092 lt!609816) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609816) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609816) ((_ is Found!10180) lt!609816) (not ((_ is MissingZero!10180) lt!609816)) (and (bvsge (index!43091 lt!609816) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609816) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609816) ((_ is Found!10180) lt!609816) ((_ is MissingZero!10180) lt!609816) (not ((_ is MissingVacant!10180) lt!609816)) (and (bvsge (index!43094 lt!609816) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609816) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609816) (ite ((_ is Found!10180) lt!609816) (= (select (arr!45837 a!2938) (index!43092 lt!609816)) (select (arr!45837 a!2938) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609816) (= (select (arr!45837 a!2938) (index!43091 lt!609816)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609816) (= (select (arr!45837 a!2938) (index!43094 lt!609816)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149495 (= lt!609816 e!785819)))

(declare-fun c!128956 () Bool)

(declare-fun lt!609814 () SeekEntryResult!10180)

(assert (=> d!149495 (= c!128956 (and ((_ is Intermediate!10180) lt!609814) (undefined!10992 lt!609814)))))

(assert (=> d!149495 (= lt!609814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45837 a!2938) startIndex!16) mask!2987) (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149495 (validMask!0 mask!2987)))

(assert (=> d!149495 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987) lt!609816)))

(declare-fun b!1387307 () Bool)

(assert (=> b!1387307 (= e!785817 (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609814) (index!43093 lt!609814) (index!43093 lt!609814) (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387308 () Bool)

(assert (=> b!1387308 (= e!785819 e!785818)))

(assert (=> b!1387308 (= lt!609815 (select (arr!45837 a!2938) (index!43093 lt!609814)))))

(declare-fun c!128957 () Bool)

(assert (=> b!1387308 (= c!128957 (= lt!609815 (select (arr!45837 a!2938) startIndex!16)))))

(declare-fun b!1387309 () Bool)

(assert (=> b!1387309 (= e!785818 (Found!10180 (index!43093 lt!609814)))))

(declare-fun b!1387310 () Bool)

(assert (=> b!1387310 (= e!785817 (MissingZero!10180 (index!43093 lt!609814)))))

(assert (= (and d!149495 c!128956) b!1387306))

(assert (= (and d!149495 (not c!128956)) b!1387308))

(assert (= (and b!1387308 c!128957) b!1387309))

(assert (= (and b!1387308 (not c!128957)) b!1387305))

(assert (= (and b!1387305 c!128955) b!1387310))

(assert (= (and b!1387305 (not c!128955)) b!1387307))

(declare-fun m!1272769 () Bool)

(assert (=> d!149495 m!1272769))

(assert (=> d!149495 m!1272613))

(declare-fun m!1272773 () Bool)

(assert (=> d!149495 m!1272773))

(assert (=> d!149495 m!1272629))

(declare-fun m!1272777 () Bool)

(assert (=> d!149495 m!1272777))

(declare-fun m!1272779 () Bool)

(assert (=> d!149495 m!1272779))

(declare-fun m!1272783 () Bool)

(assert (=> d!149495 m!1272783))

(assert (=> d!149495 m!1272629))

(assert (=> d!149495 m!1272773))

(assert (=> b!1387307 m!1272629))

(declare-fun m!1272787 () Bool)

(assert (=> b!1387307 m!1272787))

(declare-fun m!1272793 () Bool)

(assert (=> b!1387308 m!1272793))

(assert (=> b!1387166 d!149495))

(declare-fun call!66568 () Bool)

(declare-fun bm!66565 () Bool)

(assert (=> bm!66565 (= call!66568 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609729 mask!2987))))

(declare-fun b!1387311 () Bool)

(declare-fun e!785821 () Bool)

(declare-fun e!785820 () Bool)

(assert (=> b!1387311 (= e!785821 e!785820)))

(declare-fun lt!609819 () (_ BitVec 64))

(assert (=> b!1387311 (= lt!609819 (select (arr!45837 lt!609729) startIndex!16))))

(declare-fun lt!609818 () Unit!46382)

(assert (=> b!1387311 (= lt!609818 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609729 lt!609819 startIndex!16))))

(assert (=> b!1387311 (arrayContainsKey!0 lt!609729 lt!609819 #b00000000000000000000000000000000)))

(declare-fun lt!609817 () Unit!46382)

(assert (=> b!1387311 (= lt!609817 lt!609818)))

(declare-fun res!928275 () Bool)

(assert (=> b!1387311 (= res!928275 (= (seekEntryOrOpen!0 (select (arr!45837 lt!609729) startIndex!16) lt!609729 mask!2987) (Found!10180 startIndex!16)))))

(assert (=> b!1387311 (=> (not res!928275) (not e!785820))))

(declare-fun b!1387312 () Bool)

(declare-fun e!785822 () Bool)

(assert (=> b!1387312 (= e!785822 e!785821)))

(declare-fun c!128958 () Bool)

(assert (=> b!1387312 (= c!128958 (validKeyInArray!0 (select (arr!45837 lt!609729) startIndex!16)))))

(declare-fun d!149499 () Bool)

(declare-fun res!928276 () Bool)

(assert (=> d!149499 (=> res!928276 e!785822)))

(assert (=> d!149499 (= res!928276 (bvsge startIndex!16 (size!46387 lt!609729)))))

(assert (=> d!149499 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609729 mask!2987) e!785822)))

(declare-fun b!1387313 () Bool)

(assert (=> b!1387313 (= e!785821 call!66568)))

(declare-fun b!1387314 () Bool)

(assert (=> b!1387314 (= e!785820 call!66568)))

(assert (= (and d!149499 (not res!928276)) b!1387312))

(assert (= (and b!1387312 c!128958) b!1387311))

(assert (= (and b!1387312 (not c!128958)) b!1387313))

(assert (= (and b!1387311 res!928275) b!1387314))

(assert (= (or b!1387314 b!1387313) bm!66565))

(declare-fun m!1272795 () Bool)

(assert (=> bm!66565 m!1272795))

(declare-fun m!1272797 () Bool)

(assert (=> b!1387311 m!1272797))

(declare-fun m!1272799 () Bool)

(assert (=> b!1387311 m!1272799))

(declare-fun m!1272801 () Bool)

(assert (=> b!1387311 m!1272801))

(assert (=> b!1387311 m!1272797))

(declare-fun m!1272803 () Bool)

(assert (=> b!1387311 m!1272803))

(assert (=> b!1387312 m!1272797))

(assert (=> b!1387312 m!1272797))

(declare-fun m!1272805 () Bool)

(assert (=> b!1387312 m!1272805))

(assert (=> b!1387170 d!149499))

(declare-fun call!66569 () Bool)

(declare-fun bm!66566 () Bool)

(assert (=> bm!66566 (= call!66569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!609729 mask!2987))))

(declare-fun b!1387315 () Bool)

(declare-fun e!785824 () Bool)

(declare-fun e!785823 () Bool)

(assert (=> b!1387315 (= e!785824 e!785823)))

(declare-fun lt!609822 () (_ BitVec 64))

(assert (=> b!1387315 (= lt!609822 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!609821 () Unit!46382)

(assert (=> b!1387315 (= lt!609821 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609729 lt!609822 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1387315 (arrayContainsKey!0 lt!609729 lt!609822 #b00000000000000000000000000000000)))

(declare-fun lt!609820 () Unit!46382)

(assert (=> b!1387315 (= lt!609820 lt!609821)))

(declare-fun res!928277 () Bool)

(assert (=> b!1387315 (= res!928277 (= (seekEntryOrOpen!0 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609729 mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1387315 (=> (not res!928277) (not e!785823))))

(declare-fun b!1387316 () Bool)

(declare-fun e!785825 () Bool)

(assert (=> b!1387316 (= e!785825 e!785824)))

(declare-fun c!128959 () Bool)

(assert (=> b!1387316 (= c!128959 (validKeyInArray!0 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun d!149501 () Bool)

(declare-fun res!928278 () Bool)

(assert (=> d!149501 (=> res!928278 e!785825)))

(assert (=> d!149501 (= res!928278 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46387 lt!609729)))))

(assert (=> d!149501 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609729 mask!2987) e!785825)))

(declare-fun b!1387317 () Bool)

(assert (=> b!1387317 (= e!785824 call!66569)))

(declare-fun b!1387318 () Bool)

(assert (=> b!1387318 (= e!785823 call!66569)))

(assert (= (and d!149501 (not res!928278)) b!1387316))

(assert (= (and b!1387316 c!128959) b!1387315))

(assert (= (and b!1387316 (not c!128959)) b!1387317))

(assert (= (and b!1387315 res!928277) b!1387318))

(assert (= (or b!1387318 b!1387317) bm!66566))

(declare-fun m!1272807 () Bool)

(assert (=> bm!66566 m!1272807))

(declare-fun m!1272809 () Bool)

(assert (=> b!1387315 m!1272809))

(declare-fun m!1272811 () Bool)

(assert (=> b!1387315 m!1272811))

(declare-fun m!1272813 () Bool)

(assert (=> b!1387315 m!1272813))

(assert (=> b!1387315 m!1272809))

(declare-fun m!1272815 () Bool)

(assert (=> b!1387315 m!1272815))

(assert (=> b!1387316 m!1272809))

(assert (=> b!1387316 m!1272809))

(declare-fun m!1272817 () Bool)

(assert (=> b!1387316 m!1272817))

(assert (=> b!1387170 d!149501))

(declare-fun d!149503 () Bool)

(declare-fun e!785849 () Bool)

(assert (=> d!149503 e!785849))

(declare-fun res!928287 () Bool)

(assert (=> d!149503 (=> (not res!928287) (not e!785849))))

(assert (=> d!149503 (= res!928287 (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46387 a!2938))))))

(declare-fun lt!609849 () Unit!46382)

(declare-fun choose!23 (array!94922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46382)

(assert (=> d!149503 (= lt!609849 (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(assert (=> d!149503 (validMask!0 mask!2987)))

(assert (=> d!149503 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) lt!609849)))

(declare-fun b!1387357 () Bool)

(assert (=> b!1387357 (= e!785849 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987))))

(assert (= (and d!149503 res!928287) b!1387357))

(declare-fun m!1272879 () Bool)

(assert (=> d!149503 m!1272879))

(assert (=> d!149503 m!1272613))

(assert (=> b!1387357 m!1272611))

(declare-fun m!1272881 () Bool)

(assert (=> b!1387357 m!1272881))

(assert (=> b!1387170 d!149503))

(declare-fun d!149517 () Bool)

(declare-fun res!928299 () Bool)

(declare-fun e!785864 () Bool)

(assert (=> d!149517 (=> res!928299 e!785864)))

(assert (=> d!149517 (= res!928299 (bvsge #b00000000000000000000000000000000 (size!46387 a!2938)))))

(assert (=> d!149517 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32362) e!785864)))

(declare-fun b!1387375 () Bool)

(declare-fun e!785866 () Bool)

(declare-fun e!785865 () Bool)

(assert (=> b!1387375 (= e!785866 e!785865)))

(declare-fun c!128978 () Bool)

(assert (=> b!1387375 (= c!128978 (validKeyInArray!0 (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66573 () Bool)

(declare-fun call!66576 () Bool)

(assert (=> bm!66573 (= call!66576 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128978 (Cons!32361 (select (arr!45837 a!2938) #b00000000000000000000000000000000) Nil!32362) Nil!32362)))))

(declare-fun b!1387376 () Bool)

(assert (=> b!1387376 (= e!785864 e!785866)))

(declare-fun res!928300 () Bool)

(assert (=> b!1387376 (=> (not res!928300) (not e!785866))))

(declare-fun e!785867 () Bool)

(assert (=> b!1387376 (= res!928300 (not e!785867))))

(declare-fun res!928301 () Bool)

(assert (=> b!1387376 (=> (not res!928301) (not e!785867))))

(assert (=> b!1387376 (= res!928301 (validKeyInArray!0 (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387377 () Bool)

(assert (=> b!1387377 (= e!785865 call!66576)))

(declare-fun b!1387378 () Bool)

(declare-fun contains!9746 (List!32365 (_ BitVec 64)) Bool)

(assert (=> b!1387378 (= e!785867 (contains!9746 Nil!32362 (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387379 () Bool)

(assert (=> b!1387379 (= e!785865 call!66576)))

(assert (= (and d!149517 (not res!928299)) b!1387376))

(assert (= (and b!1387376 res!928301) b!1387378))

(assert (= (and b!1387376 res!928300) b!1387375))

(assert (= (and b!1387375 c!128978) b!1387379))

(assert (= (and b!1387375 (not c!128978)) b!1387377))

(assert (= (or b!1387379 b!1387377) bm!66573))

(declare-fun m!1272895 () Bool)

(assert (=> b!1387375 m!1272895))

(assert (=> b!1387375 m!1272895))

(declare-fun m!1272897 () Bool)

(assert (=> b!1387375 m!1272897))

(assert (=> bm!66573 m!1272895))

(declare-fun m!1272899 () Bool)

(assert (=> bm!66573 m!1272899))

(assert (=> b!1387376 m!1272895))

(assert (=> b!1387376 m!1272895))

(assert (=> b!1387376 m!1272897))

(assert (=> b!1387378 m!1272895))

(assert (=> b!1387378 m!1272895))

(declare-fun m!1272901 () Bool)

(assert (=> b!1387378 m!1272901))

(assert (=> b!1387164 d!149517))

(declare-fun d!149523 () Bool)

(assert (=> d!149523 (= (validKeyInArray!0 (select (arr!45837 a!2938) startIndex!16)) (and (not (= (select (arr!45837 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45837 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387168 d!149523))

(declare-fun bm!66574 () Bool)

(declare-fun call!66577 () Bool)

(assert (=> bm!66574 (= call!66577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387380 () Bool)

(declare-fun e!785869 () Bool)

(declare-fun e!785868 () Bool)

(assert (=> b!1387380 (= e!785869 e!785868)))

(declare-fun lt!609858 () (_ BitVec 64))

(assert (=> b!1387380 (= lt!609858 (select (arr!45837 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!609857 () Unit!46382)

(assert (=> b!1387380 (= lt!609857 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609858 #b00000000000000000000000000000000))))

(assert (=> b!1387380 (arrayContainsKey!0 a!2938 lt!609858 #b00000000000000000000000000000000)))

(declare-fun lt!609856 () Unit!46382)

(assert (=> b!1387380 (= lt!609856 lt!609857)))

(declare-fun res!928302 () Bool)

(assert (=> b!1387380 (= res!928302 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10180 #b00000000000000000000000000000000)))))

(assert (=> b!1387380 (=> (not res!928302) (not e!785868))))

(declare-fun b!1387381 () Bool)

(declare-fun e!785870 () Bool)

(assert (=> b!1387381 (= e!785870 e!785869)))

(declare-fun c!128979 () Bool)

(assert (=> b!1387381 (= c!128979 (validKeyInArray!0 (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(declare-fun d!149525 () Bool)

(declare-fun res!928303 () Bool)

(assert (=> d!149525 (=> res!928303 e!785870)))

(assert (=> d!149525 (= res!928303 (bvsge #b00000000000000000000000000000000 (size!46387 a!2938)))))

(assert (=> d!149525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!785870)))

(declare-fun b!1387382 () Bool)

(assert (=> b!1387382 (= e!785869 call!66577)))

(declare-fun b!1387383 () Bool)

(assert (=> b!1387383 (= e!785868 call!66577)))

(assert (= (and d!149525 (not res!928303)) b!1387381))

(assert (= (and b!1387381 c!128979) b!1387380))

(assert (= (and b!1387381 (not c!128979)) b!1387382))

(assert (= (and b!1387380 res!928302) b!1387383))

(assert (= (or b!1387383 b!1387382) bm!66574))

(declare-fun m!1272903 () Bool)

(assert (=> bm!66574 m!1272903))

(assert (=> b!1387380 m!1272895))

(declare-fun m!1272905 () Bool)

(assert (=> b!1387380 m!1272905))

(declare-fun m!1272907 () Bool)

(assert (=> b!1387380 m!1272907))

(assert (=> b!1387380 m!1272895))

(declare-fun m!1272909 () Bool)

(assert (=> b!1387380 m!1272909))

(assert (=> b!1387381 m!1272895))

(assert (=> b!1387381 m!1272895))

(assert (=> b!1387381 m!1272897))

(assert (=> b!1387162 d!149525))

(check-sat (not b!1387295) (not b!1387381) (not b!1387248) (not d!149465) (not b!1387315) (not b!1387378) (not b!1387312) (not b!1387357) (not bm!66566) (not bm!66565) (not d!149459) (not d!149483) (not b!1387210) (not b!1387307) (not bm!66553) (not d!149495) (not b!1387316) (not bm!66573) (not b!1387376) (not b!1387380) (not b!1387311) (not bm!66574) (not d!149503) (not b!1387209) (not b!1387375))
(check-sat)
(get-model)

(declare-fun bm!66580 () Bool)

(declare-fun call!66583 () Bool)

(assert (=> bm!66580 (= call!66583 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387416 () Bool)

(declare-fun e!785896 () Bool)

(declare-fun e!785895 () Bool)

(assert (=> b!1387416 (= e!785896 e!785895)))

(declare-fun lt!609873 () (_ BitVec 64))

(assert (=> b!1387416 (= lt!609873 (select (arr!45837 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609872 () Unit!46382)

(assert (=> b!1387416 (= lt!609872 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609873 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387416 (arrayContainsKey!0 a!2938 lt!609873 #b00000000000000000000000000000000)))

(declare-fun lt!609871 () Unit!46382)

(assert (=> b!1387416 (= lt!609871 lt!609872)))

(declare-fun res!928320 () Bool)

(assert (=> b!1387416 (= res!928320 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10180 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387416 (=> (not res!928320) (not e!785895))))

(declare-fun b!1387417 () Bool)

(declare-fun e!785897 () Bool)

(assert (=> b!1387417 (= e!785897 e!785896)))

(declare-fun c!128988 () Bool)

(assert (=> b!1387417 (= c!128988 (validKeyInArray!0 (select (arr!45837 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!149547 () Bool)

(declare-fun res!928321 () Bool)

(assert (=> d!149547 (=> res!928321 e!785897)))

(assert (=> d!149547 (= res!928321 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46387 a!2938)))))

(assert (=> d!149547 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!785897)))

(declare-fun b!1387418 () Bool)

(assert (=> b!1387418 (= e!785896 call!66583)))

(declare-fun b!1387419 () Bool)

(assert (=> b!1387419 (= e!785895 call!66583)))

(assert (= (and d!149547 (not res!928321)) b!1387417))

(assert (= (and b!1387417 c!128988) b!1387416))

(assert (= (and b!1387417 (not c!128988)) b!1387418))

(assert (= (and b!1387416 res!928320) b!1387419))

(assert (= (or b!1387419 b!1387418) bm!66580))

(declare-fun m!1272957 () Bool)

(assert (=> bm!66580 m!1272957))

(declare-fun m!1272959 () Bool)

(assert (=> b!1387416 m!1272959))

(declare-fun m!1272961 () Bool)

(assert (=> b!1387416 m!1272961))

(declare-fun m!1272963 () Bool)

(assert (=> b!1387416 m!1272963))

(assert (=> b!1387416 m!1272959))

(declare-fun m!1272965 () Bool)

(assert (=> b!1387416 m!1272965))

(assert (=> b!1387417 m!1272959))

(assert (=> b!1387417 m!1272959))

(declare-fun m!1272967 () Bool)

(assert (=> b!1387417 m!1272967))

(assert (=> bm!66553 d!149547))

(declare-fun d!149549 () Bool)

(assert (=> d!149549 (= (validKeyInArray!0 (select (arr!45837 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45837 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45837 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387381 d!149549))

(declare-fun d!149551 () Bool)

(assert (=> d!149551 (arrayContainsKey!0 a!2938 lt!609858 #b00000000000000000000000000000000)))

(declare-fun lt!609876 () Unit!46382)

(declare-fun choose!13 (array!94922 (_ BitVec 64) (_ BitVec 32)) Unit!46382)

(assert (=> d!149551 (= lt!609876 (choose!13 a!2938 lt!609858 #b00000000000000000000000000000000))))

(assert (=> d!149551 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149551 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609858 #b00000000000000000000000000000000) lt!609876)))

(declare-fun bs!40313 () Bool)

(assert (= bs!40313 d!149551))

(assert (=> bs!40313 m!1272907))

(declare-fun m!1272969 () Bool)

(assert (=> bs!40313 m!1272969))

(assert (=> b!1387380 d!149551))

(declare-fun d!149553 () Bool)

(declare-fun res!928326 () Bool)

(declare-fun e!785902 () Bool)

(assert (=> d!149553 (=> res!928326 e!785902)))

(assert (=> d!149553 (= res!928326 (= (select (arr!45837 a!2938) #b00000000000000000000000000000000) lt!609858))))

(assert (=> d!149553 (= (arrayContainsKey!0 a!2938 lt!609858 #b00000000000000000000000000000000) e!785902)))

(declare-fun b!1387424 () Bool)

(declare-fun e!785903 () Bool)

(assert (=> b!1387424 (= e!785902 e!785903)))

(declare-fun res!928327 () Bool)

(assert (=> b!1387424 (=> (not res!928327) (not e!785903))))

(assert (=> b!1387424 (= res!928327 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46387 a!2938)))))

(declare-fun b!1387425 () Bool)

(assert (=> b!1387425 (= e!785903 (arrayContainsKey!0 a!2938 lt!609858 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149553 (not res!928326)) b!1387424))

(assert (= (and b!1387424 res!928327) b!1387425))

(assert (=> d!149553 m!1272895))

(declare-fun m!1272971 () Bool)

(assert (=> b!1387425 m!1272971))

(assert (=> b!1387380 d!149553))

(declare-fun b!1387426 () Bool)

(declare-fun c!128989 () Bool)

(declare-fun lt!609878 () (_ BitVec 64))

(assert (=> b!1387426 (= c!128989 (= lt!609878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785905 () SeekEntryResult!10180)

(declare-fun e!785904 () SeekEntryResult!10180)

(assert (=> b!1387426 (= e!785905 e!785904)))

(declare-fun b!1387427 () Bool)

(declare-fun e!785906 () SeekEntryResult!10180)

(assert (=> b!1387427 (= e!785906 Undefined!10180)))

(declare-fun d!149555 () Bool)

(declare-fun lt!609879 () SeekEntryResult!10180)

(assert (=> d!149555 (and (or ((_ is Undefined!10180) lt!609879) (not ((_ is Found!10180) lt!609879)) (and (bvsge (index!43092 lt!609879) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609879) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609879) ((_ is Found!10180) lt!609879) (not ((_ is MissingZero!10180) lt!609879)) (and (bvsge (index!43091 lt!609879) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609879) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609879) ((_ is Found!10180) lt!609879) ((_ is MissingZero!10180) lt!609879) (not ((_ is MissingVacant!10180) lt!609879)) (and (bvsge (index!43094 lt!609879) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609879) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609879) (ite ((_ is Found!10180) lt!609879) (= (select (arr!45837 a!2938) (index!43092 lt!609879)) (select (arr!45837 a!2938) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10180) lt!609879) (= (select (arr!45837 a!2938) (index!43091 lt!609879)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609879) (= (select (arr!45837 a!2938) (index!43094 lt!609879)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149555 (= lt!609879 e!785906)))

(declare-fun c!128990 () Bool)

(declare-fun lt!609877 () SeekEntryResult!10180)

(assert (=> d!149555 (= c!128990 (and ((_ is Intermediate!10180) lt!609877) (undefined!10992 lt!609877)))))

(assert (=> d!149555 (= lt!609877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45837 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45837 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149555 (validMask!0 mask!2987)))

(assert (=> d!149555 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!609879)))

(declare-fun b!1387428 () Bool)

(assert (=> b!1387428 (= e!785904 (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609877) (index!43093 lt!609877) (index!43093 lt!609877) (select (arr!45837 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1387429 () Bool)

(assert (=> b!1387429 (= e!785906 e!785905)))

(assert (=> b!1387429 (= lt!609878 (select (arr!45837 a!2938) (index!43093 lt!609877)))))

(declare-fun c!128991 () Bool)

(assert (=> b!1387429 (= c!128991 (= lt!609878 (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387430 () Bool)

(assert (=> b!1387430 (= e!785905 (Found!10180 (index!43093 lt!609877)))))

(declare-fun b!1387431 () Bool)

(assert (=> b!1387431 (= e!785904 (MissingZero!10180 (index!43093 lt!609877)))))

(assert (= (and d!149555 c!128990) b!1387427))

(assert (= (and d!149555 (not c!128990)) b!1387429))

(assert (= (and b!1387429 c!128991) b!1387430))

(assert (= (and b!1387429 (not c!128991)) b!1387426))

(assert (= (and b!1387426 c!128989) b!1387431))

(assert (= (and b!1387426 (not c!128989)) b!1387428))

(declare-fun m!1272973 () Bool)

(assert (=> d!149555 m!1272973))

(assert (=> d!149555 m!1272613))

(declare-fun m!1272975 () Bool)

(assert (=> d!149555 m!1272975))

(assert (=> d!149555 m!1272895))

(declare-fun m!1272977 () Bool)

(assert (=> d!149555 m!1272977))

(declare-fun m!1272979 () Bool)

(assert (=> d!149555 m!1272979))

(declare-fun m!1272981 () Bool)

(assert (=> d!149555 m!1272981))

(assert (=> d!149555 m!1272895))

(assert (=> d!149555 m!1272975))

(assert (=> b!1387428 m!1272895))

(declare-fun m!1272983 () Bool)

(assert (=> b!1387428 m!1272983))

(declare-fun m!1272985 () Bool)

(assert (=> b!1387429 m!1272985))

(assert (=> b!1387380 d!149555))

(declare-fun d!149557 () Bool)

(assert (=> d!149557 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987)))

(assert (=> d!149557 true))

(declare-fun _$43!15 () Unit!46382)

(assert (=> d!149557 (= (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) _$43!15)))

(declare-fun bs!40314 () Bool)

(assert (= bs!40314 d!149557))

(assert (=> bs!40314 m!1272611))

(assert (=> bs!40314 m!1272881))

(assert (=> d!149503 d!149557))

(assert (=> d!149503 d!149455))

(declare-fun bm!66581 () Bool)

(declare-fun call!66584 () Bool)

(assert (=> bm!66581 (= call!66584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387444 () Bool)

(declare-fun e!785914 () Bool)

(declare-fun e!785913 () Bool)

(assert (=> b!1387444 (= e!785914 e!785913)))

(declare-fun lt!609886 () (_ BitVec 64))

(assert (=> b!1387444 (= lt!609886 (select (arr!45837 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!609885 () Unit!46382)

(assert (=> b!1387444 (= lt!609885 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609886 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1387444 (arrayContainsKey!0 a!2938 lt!609886 #b00000000000000000000000000000000)))

(declare-fun lt!609884 () Unit!46382)

(assert (=> b!1387444 (= lt!609884 lt!609885)))

(declare-fun res!928328 () Bool)

(assert (=> b!1387444 (= res!928328 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1387444 (=> (not res!928328) (not e!785913))))

(declare-fun b!1387445 () Bool)

(declare-fun e!785915 () Bool)

(assert (=> b!1387445 (= e!785915 e!785914)))

(declare-fun c!128998 () Bool)

(assert (=> b!1387445 (= c!128998 (validKeyInArray!0 (select (arr!45837 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!149559 () Bool)

(declare-fun res!928329 () Bool)

(assert (=> d!149559 (=> res!928329 e!785915)))

(assert (=> d!149559 (= res!928329 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46387 a!2938)))))

(assert (=> d!149559 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!785915)))

(declare-fun b!1387446 () Bool)

(assert (=> b!1387446 (= e!785914 call!66584)))

(declare-fun b!1387447 () Bool)

(assert (=> b!1387447 (= e!785913 call!66584)))

(assert (= (and d!149559 (not res!928329)) b!1387445))

(assert (= (and b!1387445 c!128998) b!1387444))

(assert (= (and b!1387445 (not c!128998)) b!1387446))

(assert (= (and b!1387444 res!928328) b!1387447))

(assert (= (or b!1387447 b!1387446) bm!66581))

(declare-fun m!1272987 () Bool)

(assert (=> bm!66581 m!1272987))

(declare-fun m!1272989 () Bool)

(assert (=> b!1387444 m!1272989))

(declare-fun m!1272991 () Bool)

(assert (=> b!1387444 m!1272991))

(declare-fun m!1272993 () Bool)

(assert (=> b!1387444 m!1272993))

(assert (=> b!1387444 m!1272989))

(declare-fun m!1272995 () Bool)

(assert (=> b!1387444 m!1272995))

(assert (=> b!1387445 m!1272989))

(assert (=> b!1387445 m!1272989))

(declare-fun m!1272997 () Bool)

(assert (=> b!1387445 m!1272997))

(assert (=> bm!66574 d!149559))

(declare-fun d!149561 () Bool)

(assert (=> d!149561 (= (validKeyInArray!0 (select (arr!45837 lt!609729) startIndex!16)) (and (not (= (select (arr!45837 lt!609729) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45837 lt!609729) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387312 d!149561))

(declare-fun call!66585 () Bool)

(declare-fun bm!66582 () Bool)

(assert (=> bm!66582 (= call!66585 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987))))

(declare-fun b!1387448 () Bool)

(declare-fun e!785917 () Bool)

(declare-fun e!785916 () Bool)

(assert (=> b!1387448 (= e!785917 e!785916)))

(declare-fun lt!609889 () (_ BitVec 64))

(assert (=> b!1387448 (= lt!609889 (select (arr!45837 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!609888 () Unit!46382)

(assert (=> b!1387448 (= lt!609888 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) lt!609889 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1387448 (arrayContainsKey!0 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) lt!609889 #b00000000000000000000000000000000)))

(declare-fun lt!609887 () Unit!46382)

(assert (=> b!1387448 (= lt!609887 lt!609888)))

(declare-fun res!928330 () Bool)

(assert (=> b!1387448 (= res!928330 (= (seekEntryOrOpen!0 (select (arr!45837 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1387448 (=> (not res!928330) (not e!785916))))

(declare-fun b!1387449 () Bool)

(declare-fun e!785918 () Bool)

(assert (=> b!1387449 (= e!785918 e!785917)))

(declare-fun c!128999 () Bool)

(assert (=> b!1387449 (= c!128999 (validKeyInArray!0 (select (arr!45837 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun d!149563 () Bool)

(declare-fun res!928331 () Bool)

(assert (=> d!149563 (=> res!928331 e!785918)))

(assert (=> d!149563 (= res!928331 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46387 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)))))))

(assert (=> d!149563 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987) e!785918)))

(declare-fun b!1387450 () Bool)

(assert (=> b!1387450 (= e!785917 call!66585)))

(declare-fun b!1387451 () Bool)

(assert (=> b!1387451 (= e!785916 call!66585)))

(assert (= (and d!149563 (not res!928331)) b!1387449))

(assert (= (and b!1387449 c!128999) b!1387448))

(assert (= (and b!1387449 (not c!128999)) b!1387450))

(assert (= (and b!1387448 res!928330) b!1387451))

(assert (= (or b!1387451 b!1387450) bm!66582))

(declare-fun m!1272999 () Bool)

(assert (=> bm!66582 m!1272999))

(declare-fun m!1273001 () Bool)

(assert (=> b!1387448 m!1273001))

(declare-fun m!1273003 () Bool)

(assert (=> b!1387448 m!1273003))

(declare-fun m!1273005 () Bool)

(assert (=> b!1387448 m!1273005))

(assert (=> b!1387448 m!1273001))

(declare-fun m!1273007 () Bool)

(assert (=> b!1387448 m!1273007))

(assert (=> b!1387449 m!1273001))

(assert (=> b!1387449 m!1273001))

(declare-fun m!1273009 () Bool)

(assert (=> b!1387449 m!1273009))

(assert (=> b!1387357 d!149563))

(declare-fun d!149565 () Bool)

(assert (=> d!149565 (arrayContainsKey!0 lt!609729 lt!609819 #b00000000000000000000000000000000)))

(declare-fun lt!609890 () Unit!46382)

(assert (=> d!149565 (= lt!609890 (choose!13 lt!609729 lt!609819 startIndex!16))))

(assert (=> d!149565 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149565 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609729 lt!609819 startIndex!16) lt!609890)))

(declare-fun bs!40315 () Bool)

(assert (= bs!40315 d!149565))

(assert (=> bs!40315 m!1272801))

(declare-fun m!1273011 () Bool)

(assert (=> bs!40315 m!1273011))

(assert (=> b!1387311 d!149565))

(declare-fun d!149567 () Bool)

(declare-fun res!928332 () Bool)

(declare-fun e!785919 () Bool)

(assert (=> d!149567 (=> res!928332 e!785919)))

(assert (=> d!149567 (= res!928332 (= (select (arr!45837 lt!609729) #b00000000000000000000000000000000) lt!609819))))

(assert (=> d!149567 (= (arrayContainsKey!0 lt!609729 lt!609819 #b00000000000000000000000000000000) e!785919)))

(declare-fun b!1387452 () Bool)

(declare-fun e!785920 () Bool)

(assert (=> b!1387452 (= e!785919 e!785920)))

(declare-fun res!928333 () Bool)

(assert (=> b!1387452 (=> (not res!928333) (not e!785920))))

(assert (=> b!1387452 (= res!928333 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46387 lt!609729)))))

(declare-fun b!1387453 () Bool)

(assert (=> b!1387453 (= e!785920 (arrayContainsKey!0 lt!609729 lt!609819 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149567 (not res!928332)) b!1387452))

(assert (= (and b!1387452 res!928333) b!1387453))

(declare-fun m!1273013 () Bool)

(assert (=> d!149567 m!1273013))

(declare-fun m!1273015 () Bool)

(assert (=> b!1387453 m!1273015))

(assert (=> b!1387311 d!149567))

(declare-fun b!1387460 () Bool)

(declare-fun c!129003 () Bool)

(declare-fun lt!609894 () (_ BitVec 64))

(assert (=> b!1387460 (= c!129003 (= lt!609894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785925 () SeekEntryResult!10180)

(declare-fun e!785924 () SeekEntryResult!10180)

(assert (=> b!1387460 (= e!785925 e!785924)))

(declare-fun b!1387461 () Bool)

(declare-fun e!785926 () SeekEntryResult!10180)

(assert (=> b!1387461 (= e!785926 Undefined!10180)))

(declare-fun d!149569 () Bool)

(declare-fun lt!609895 () SeekEntryResult!10180)

(assert (=> d!149569 (and (or ((_ is Undefined!10180) lt!609895) (not ((_ is Found!10180) lt!609895)) (and (bvsge (index!43092 lt!609895) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609895) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609895) ((_ is Found!10180) lt!609895) (not ((_ is MissingZero!10180) lt!609895)) (and (bvsge (index!43091 lt!609895) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609895) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609895) ((_ is Found!10180) lt!609895) ((_ is MissingZero!10180) lt!609895) (not ((_ is MissingVacant!10180) lt!609895)) (and (bvsge (index!43094 lt!609895) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609895) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609895) (ite ((_ is Found!10180) lt!609895) (= (select (arr!45837 lt!609729) (index!43092 lt!609895)) (select (arr!45837 lt!609729) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609895) (= (select (arr!45837 lt!609729) (index!43091 lt!609895)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609895) (= (select (arr!45837 lt!609729) (index!43094 lt!609895)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149569 (= lt!609895 e!785926)))

(declare-fun c!129004 () Bool)

(declare-fun lt!609893 () SeekEntryResult!10180)

(assert (=> d!149569 (= c!129004 (and ((_ is Intermediate!10180) lt!609893) (undefined!10992 lt!609893)))))

(assert (=> d!149569 (= lt!609893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45837 lt!609729) startIndex!16) mask!2987) (select (arr!45837 lt!609729) startIndex!16) lt!609729 mask!2987))))

(assert (=> d!149569 (validMask!0 mask!2987)))

(assert (=> d!149569 (= (seekEntryOrOpen!0 (select (arr!45837 lt!609729) startIndex!16) lt!609729 mask!2987) lt!609895)))

(declare-fun b!1387462 () Bool)

(assert (=> b!1387462 (= e!785924 (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609893) (index!43093 lt!609893) (index!43093 lt!609893) (select (arr!45837 lt!609729) startIndex!16) lt!609729 mask!2987))))

(declare-fun b!1387463 () Bool)

(assert (=> b!1387463 (= e!785926 e!785925)))

(assert (=> b!1387463 (= lt!609894 (select (arr!45837 lt!609729) (index!43093 lt!609893)))))

(declare-fun c!129005 () Bool)

(assert (=> b!1387463 (= c!129005 (= lt!609894 (select (arr!45837 lt!609729) startIndex!16)))))

(declare-fun b!1387464 () Bool)

(assert (=> b!1387464 (= e!785925 (Found!10180 (index!43093 lt!609893)))))

(declare-fun b!1387465 () Bool)

(assert (=> b!1387465 (= e!785924 (MissingZero!10180 (index!43093 lt!609893)))))

(assert (= (and d!149569 c!129004) b!1387461))

(assert (= (and d!149569 (not c!129004)) b!1387463))

(assert (= (and b!1387463 c!129005) b!1387464))

(assert (= (and b!1387463 (not c!129005)) b!1387460))

(assert (= (and b!1387460 c!129003) b!1387465))

(assert (= (and b!1387460 (not c!129003)) b!1387462))

(declare-fun m!1273025 () Bool)

(assert (=> d!149569 m!1273025))

(assert (=> d!149569 m!1272613))

(declare-fun m!1273027 () Bool)

(assert (=> d!149569 m!1273027))

(assert (=> d!149569 m!1272797))

(declare-fun m!1273029 () Bool)

(assert (=> d!149569 m!1273029))

(declare-fun m!1273031 () Bool)

(assert (=> d!149569 m!1273031))

(declare-fun m!1273033 () Bool)

(assert (=> d!149569 m!1273033))

(assert (=> d!149569 m!1272797))

(assert (=> d!149569 m!1273027))

(assert (=> b!1387462 m!1272797))

(declare-fun m!1273035 () Bool)

(assert (=> b!1387462 m!1273035))

(declare-fun m!1273037 () Bool)

(assert (=> b!1387463 m!1273037))

(assert (=> b!1387311 d!149569))

(declare-fun d!149573 () Bool)

(declare-fun lt!609898 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!761 (List!32365) (InoxSet (_ BitVec 64)))

(assert (=> d!149573 (= lt!609898 (select (content!761 Nil!32362) (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(declare-fun e!785932 () Bool)

(assert (=> d!149573 (= lt!609898 e!785932)))

(declare-fun res!928338 () Bool)

(assert (=> d!149573 (=> (not res!928338) (not e!785932))))

(assert (=> d!149573 (= res!928338 ((_ is Cons!32361) Nil!32362))))

(assert (=> d!149573 (= (contains!9746 Nil!32362 (select (arr!45837 a!2938) #b00000000000000000000000000000000)) lt!609898)))

(declare-fun b!1387470 () Bool)

(declare-fun e!785931 () Bool)

(assert (=> b!1387470 (= e!785932 e!785931)))

(declare-fun res!928339 () Bool)

(assert (=> b!1387470 (=> res!928339 e!785931)))

(assert (=> b!1387470 (= res!928339 (= (h!33570 Nil!32362) (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387471 () Bool)

(assert (=> b!1387471 (= e!785931 (contains!9746 (t!47059 Nil!32362) (select (arr!45837 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149573 res!928338) b!1387470))

(assert (= (and b!1387470 (not res!928339)) b!1387471))

(declare-fun m!1273039 () Bool)

(assert (=> d!149573 m!1273039))

(assert (=> d!149573 m!1272895))

(declare-fun m!1273041 () Bool)

(assert (=> d!149573 m!1273041))

(assert (=> b!1387471 m!1272895))

(declare-fun m!1273043 () Bool)

(assert (=> b!1387471 m!1273043))

(assert (=> b!1387378 d!149573))

(declare-fun d!149575 () Bool)

(assert (=> d!149575 (= (validKeyInArray!0 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16))) (and (not (= (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387316 d!149575))

(assert (=> b!1387248 d!149495))

(declare-fun b!1387472 () Bool)

(declare-fun c!129006 () Bool)

(declare-fun lt!609900 () (_ BitVec 64))

(assert (=> b!1387472 (= c!129006 (= lt!609900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785934 () SeekEntryResult!10180)

(declare-fun e!785933 () SeekEntryResult!10180)

(assert (=> b!1387472 (= e!785934 e!785933)))

(declare-fun b!1387473 () Bool)

(declare-fun e!785935 () SeekEntryResult!10180)

(assert (=> b!1387473 (= e!785935 Undefined!10180)))

(declare-fun d!149577 () Bool)

(declare-fun lt!609901 () SeekEntryResult!10180)

(assert (=> d!149577 (and (or ((_ is Undefined!10180) lt!609901) (not ((_ is Found!10180) lt!609901)) (and (bvsge (index!43092 lt!609901) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609901) (size!46387 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)))))) (or ((_ is Undefined!10180) lt!609901) ((_ is Found!10180) lt!609901) (not ((_ is MissingZero!10180) lt!609901)) (and (bvsge (index!43091 lt!609901) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609901) (size!46387 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)))))) (or ((_ is Undefined!10180) lt!609901) ((_ is Found!10180) lt!609901) ((_ is MissingZero!10180) lt!609901) (not ((_ is MissingVacant!10180) lt!609901)) (and (bvsge (index!43094 lt!609901) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609901) (size!46387 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)))))) (or ((_ is Undefined!10180) lt!609901) (ite ((_ is Found!10180) lt!609901) (= (select (arr!45837 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938))) (index!43092 lt!609901)) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609901) (= (select (arr!45837 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938))) (index!43091 lt!609901)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609901) (= (select (arr!45837 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938))) (index!43094 lt!609901)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149577 (= lt!609901 e!785935)))

(declare-fun c!129007 () Bool)

(declare-fun lt!609899 () SeekEntryResult!10180)

(assert (=> d!149577 (= c!129007 (and ((_ is Intermediate!10180) lt!609899) (undefined!10992 lt!609899)))))

(assert (=> d!149577 (= lt!609899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987))))

(assert (=> d!149577 (validMask!0 mask!2987)))

(assert (=> d!149577 (= (seekEntryOrOpen!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987) lt!609901)))

(declare-fun b!1387474 () Bool)

(assert (=> b!1387474 (= e!785933 (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609899) (index!43093 lt!609899) (index!43093 lt!609899) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987))))

(declare-fun b!1387475 () Bool)

(assert (=> b!1387475 (= e!785935 e!785934)))

(assert (=> b!1387475 (= lt!609900 (select (arr!45837 (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938))) (index!43093 lt!609899)))))

(declare-fun c!129008 () Bool)

(assert (=> b!1387475 (= c!129008 (= lt!609900 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387476 () Bool)

(assert (=> b!1387476 (= e!785934 (Found!10180 (index!43093 lt!609899)))))

(declare-fun b!1387477 () Bool)

(assert (=> b!1387477 (= e!785933 (MissingZero!10180 (index!43093 lt!609899)))))

(assert (= (and d!149577 c!129007) b!1387473))

(assert (= (and d!149577 (not c!129007)) b!1387475))

(assert (= (and b!1387475 c!129008) b!1387476))

(assert (= (and b!1387475 (not c!129008)) b!1387472))

(assert (= (and b!1387472 c!129006) b!1387477))

(assert (= (and b!1387472 (not c!129006)) b!1387474))

(declare-fun m!1273045 () Bool)

(assert (=> d!149577 m!1273045))

(assert (=> d!149577 m!1272613))

(assert (=> d!149577 m!1272755))

(assert (=> d!149577 m!1272623))

(declare-fun m!1273047 () Bool)

(assert (=> d!149577 m!1273047))

(declare-fun m!1273049 () Bool)

(assert (=> d!149577 m!1273049))

(declare-fun m!1273051 () Bool)

(assert (=> d!149577 m!1273051))

(assert (=> d!149577 m!1272623))

(assert (=> d!149577 m!1272755))

(assert (=> b!1387474 m!1272623))

(declare-fun m!1273055 () Bool)

(assert (=> b!1387474 m!1273055))

(declare-fun m!1273059 () Bool)

(assert (=> b!1387475 m!1273059))

(assert (=> b!1387248 d!149577))

(declare-fun d!149581 () Bool)

(assert (=> d!149581 (arrayContainsKey!0 lt!609729 lt!609822 #b00000000000000000000000000000000)))

(declare-fun lt!609905 () Unit!46382)

(assert (=> d!149581 (= lt!609905 (choose!13 lt!609729 lt!609822 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> d!149581 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))

(assert (=> d!149581 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609729 lt!609822 (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609905)))

(declare-fun bs!40317 () Bool)

(assert (= bs!40317 d!149581))

(assert (=> bs!40317 m!1272813))

(declare-fun m!1273069 () Bool)

(assert (=> bs!40317 m!1273069))

(assert (=> b!1387315 d!149581))

(declare-fun d!149585 () Bool)

(declare-fun res!928340 () Bool)

(declare-fun e!785939 () Bool)

(assert (=> d!149585 (=> res!928340 e!785939)))

(assert (=> d!149585 (= res!928340 (= (select (arr!45837 lt!609729) #b00000000000000000000000000000000) lt!609822))))

(assert (=> d!149585 (= (arrayContainsKey!0 lt!609729 lt!609822 #b00000000000000000000000000000000) e!785939)))

(declare-fun b!1387484 () Bool)

(declare-fun e!785940 () Bool)

(assert (=> b!1387484 (= e!785939 e!785940)))

(declare-fun res!928341 () Bool)

(assert (=> b!1387484 (=> (not res!928341) (not e!785940))))

(assert (=> b!1387484 (= res!928341 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46387 lt!609729)))))

(declare-fun b!1387485 () Bool)

(assert (=> b!1387485 (= e!785940 (arrayContainsKey!0 lt!609729 lt!609822 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149585 (not res!928340)) b!1387484))

(assert (= (and b!1387484 res!928341) b!1387485))

(assert (=> d!149585 m!1273013))

(declare-fun m!1273071 () Bool)

(assert (=> b!1387485 m!1273071))

(assert (=> b!1387315 d!149585))

(declare-fun b!1387490 () Bool)

(declare-fun c!129013 () Bool)

(declare-fun lt!609910 () (_ BitVec 64))

(assert (=> b!1387490 (= c!129013 (= lt!609910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785945 () SeekEntryResult!10180)

(declare-fun e!785944 () SeekEntryResult!10180)

(assert (=> b!1387490 (= e!785945 e!785944)))

(declare-fun b!1387491 () Bool)

(declare-fun e!785946 () SeekEntryResult!10180)

(assert (=> b!1387491 (= e!785946 Undefined!10180)))

(declare-fun d!149587 () Bool)

(declare-fun lt!609911 () SeekEntryResult!10180)

(assert (=> d!149587 (and (or ((_ is Undefined!10180) lt!609911) (not ((_ is Found!10180) lt!609911)) (and (bvsge (index!43092 lt!609911) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609911) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609911) ((_ is Found!10180) lt!609911) (not ((_ is MissingZero!10180) lt!609911)) (and (bvsge (index!43091 lt!609911) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609911) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609911) ((_ is Found!10180) lt!609911) ((_ is MissingZero!10180) lt!609911) (not ((_ is MissingVacant!10180) lt!609911)) (and (bvsge (index!43094 lt!609911) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609911) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609911) (ite ((_ is Found!10180) lt!609911) (= (select (arr!45837 lt!609729) (index!43092 lt!609911)) (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16))) (ite ((_ is MissingZero!10180) lt!609911) (= (select (arr!45837 lt!609729) (index!43091 lt!609911)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609911) (= (select (arr!45837 lt!609729) (index!43094 lt!609911)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149587 (= lt!609911 e!785946)))

(declare-fun c!129014 () Bool)

(declare-fun lt!609909 () SeekEntryResult!10180)

(assert (=> d!149587 (= c!129014 (and ((_ is Intermediate!10180) lt!609909) (undefined!10992 lt!609909)))))

(assert (=> d!149587 (= lt!609909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)) mask!2987) (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609729 mask!2987))))

(assert (=> d!149587 (validMask!0 mask!2987)))

(assert (=> d!149587 (= (seekEntryOrOpen!0 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609729 mask!2987) lt!609911)))

(declare-fun b!1387492 () Bool)

(assert (=> b!1387492 (= e!785944 (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609909) (index!43093 lt!609909) (index!43093 lt!609909) (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609729 mask!2987))))

(declare-fun b!1387493 () Bool)

(assert (=> b!1387493 (= e!785946 e!785945)))

(assert (=> b!1387493 (= lt!609910 (select (arr!45837 lt!609729) (index!43093 lt!609909)))))

(declare-fun c!129015 () Bool)

(assert (=> b!1387493 (= c!129015 (= lt!609910 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387494 () Bool)

(assert (=> b!1387494 (= e!785945 (Found!10180 (index!43093 lt!609909)))))

(declare-fun b!1387495 () Bool)

(assert (=> b!1387495 (= e!785944 (MissingZero!10180 (index!43093 lt!609909)))))

(assert (= (and d!149587 c!129014) b!1387491))

(assert (= (and d!149587 (not c!129014)) b!1387493))

(assert (= (and b!1387493 c!129015) b!1387494))

(assert (= (and b!1387493 (not c!129015)) b!1387490))

(assert (= (and b!1387490 c!129013) b!1387495))

(assert (= (and b!1387490 (not c!129013)) b!1387492))

(declare-fun m!1273085 () Bool)

(assert (=> d!149587 m!1273085))

(assert (=> d!149587 m!1272613))

(declare-fun m!1273087 () Bool)

(assert (=> d!149587 m!1273087))

(assert (=> d!149587 m!1272809))

(declare-fun m!1273089 () Bool)

(assert (=> d!149587 m!1273089))

(declare-fun m!1273091 () Bool)

(assert (=> d!149587 m!1273091))

(declare-fun m!1273093 () Bool)

(assert (=> d!149587 m!1273093))

(assert (=> d!149587 m!1272809))

(assert (=> d!149587 m!1273087))

(assert (=> b!1387492 m!1272809))

(declare-fun m!1273095 () Bool)

(assert (=> b!1387492 m!1273095))

(declare-fun m!1273097 () Bool)

(assert (=> b!1387493 m!1273097))

(assert (=> b!1387315 d!149587))

(assert (=> d!149459 d!149461))

(declare-fun d!149593 () Bool)

(assert (=> d!149593 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149593 true))

(declare-fun _$72!128 () Unit!46382)

(assert (=> d!149593 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!128)))

(declare-fun bs!40318 () Bool)

(assert (= bs!40318 d!149593))

(assert (=> bs!40318 m!1272633))

(assert (=> d!149459 d!149593))

(assert (=> d!149459 d!149455))

(assert (=> b!1387210 d!149523))

(declare-fun bm!66584 () Bool)

(declare-fun call!66587 () Bool)

(assert (=> bm!66584 (= call!66587 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!609729 mask!2987))))

(declare-fun b!1387496 () Bool)

(declare-fun e!785948 () Bool)

(declare-fun e!785947 () Bool)

(assert (=> b!1387496 (= e!785948 e!785947)))

(declare-fun lt!609914 () (_ BitVec 64))

(assert (=> b!1387496 (= lt!609914 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609913 () Unit!46382)

(assert (=> b!1387496 (= lt!609913 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609729 lt!609914 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387496 (arrayContainsKey!0 lt!609729 lt!609914 #b00000000000000000000000000000000)))

(declare-fun lt!609912 () Unit!46382)

(assert (=> b!1387496 (= lt!609912 lt!609913)))

(declare-fun res!928344 () Bool)

(assert (=> b!1387496 (= res!928344 (= (seekEntryOrOpen!0 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)) lt!609729 mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387496 (=> (not res!928344) (not e!785947))))

(declare-fun b!1387497 () Bool)

(declare-fun e!785949 () Bool)

(assert (=> b!1387497 (= e!785949 e!785948)))

(declare-fun c!129016 () Bool)

(assert (=> b!1387497 (= c!129016 (validKeyInArray!0 (select (arr!45837 lt!609729) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!149595 () Bool)

(declare-fun res!928345 () Bool)

(assert (=> d!149595 (=> res!928345 e!785949)))

(assert (=> d!149595 (= res!928345 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (size!46387 lt!609729)))))

(assert (=> d!149595 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!609729 mask!2987) e!785949)))

(declare-fun b!1387498 () Bool)

(assert (=> b!1387498 (= e!785948 call!66587)))

(declare-fun b!1387499 () Bool)

(assert (=> b!1387499 (= e!785947 call!66587)))

(assert (= (and d!149595 (not res!928345)) b!1387497))

(assert (= (and b!1387497 c!129016) b!1387496))

(assert (= (and b!1387497 (not c!129016)) b!1387498))

(assert (= (and b!1387496 res!928344) b!1387499))

(assert (= (or b!1387499 b!1387498) bm!66584))

(declare-fun m!1273099 () Bool)

(assert (=> bm!66584 m!1273099))

(declare-fun m!1273101 () Bool)

(assert (=> b!1387496 m!1273101))

(declare-fun m!1273103 () Bool)

(assert (=> b!1387496 m!1273103))

(declare-fun m!1273105 () Bool)

(assert (=> b!1387496 m!1273105))

(assert (=> b!1387496 m!1273101))

(declare-fun m!1273107 () Bool)

(assert (=> b!1387496 m!1273107))

(assert (=> b!1387497 m!1273101))

(assert (=> b!1387497 m!1273101))

(declare-fun m!1273109 () Bool)

(assert (=> b!1387497 m!1273109))

(assert (=> bm!66566 d!149595))

(declare-fun d!149597 () Bool)

(assert (=> d!149597 (arrayContainsKey!0 a!2938 lt!609759 #b00000000000000000000000000000000)))

(declare-fun lt!609915 () Unit!46382)

(assert (=> d!149597 (= lt!609915 (choose!13 a!2938 lt!609759 startIndex!16))))

(assert (=> d!149597 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149597 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609759 startIndex!16) lt!609915)))

(declare-fun bs!40319 () Bool)

(assert (= bs!40319 d!149597))

(assert (=> bs!40319 m!1272687))

(declare-fun m!1273111 () Bool)

(assert (=> bs!40319 m!1273111))

(assert (=> b!1387209 d!149597))

(declare-fun d!149599 () Bool)

(declare-fun res!928346 () Bool)

(declare-fun e!785950 () Bool)

(assert (=> d!149599 (=> res!928346 e!785950)))

(assert (=> d!149599 (= res!928346 (= (select (arr!45837 a!2938) #b00000000000000000000000000000000) lt!609759))))

(assert (=> d!149599 (= (arrayContainsKey!0 a!2938 lt!609759 #b00000000000000000000000000000000) e!785950)))

(declare-fun b!1387500 () Bool)

(declare-fun e!785951 () Bool)

(assert (=> b!1387500 (= e!785950 e!785951)))

(declare-fun res!928347 () Bool)

(assert (=> b!1387500 (=> (not res!928347) (not e!785951))))

(assert (=> b!1387500 (= res!928347 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46387 a!2938)))))

(declare-fun b!1387501 () Bool)

(assert (=> b!1387501 (= e!785951 (arrayContainsKey!0 a!2938 lt!609759 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149599 (not res!928346)) b!1387500))

(assert (= (and b!1387500 res!928347) b!1387501))

(assert (=> d!149599 m!1272895))

(declare-fun m!1273113 () Bool)

(assert (=> b!1387501 m!1273113))

(assert (=> b!1387209 d!149599))

(assert (=> b!1387209 d!149495))

(declare-fun b!1387541 () Bool)

(declare-fun e!785974 () SeekEntryResult!10180)

(declare-fun e!785973 () SeekEntryResult!10180)

(assert (=> b!1387541 (= e!785974 e!785973)))

(declare-fun lt!609927 () (_ BitVec 64))

(declare-fun c!129033 () Bool)

(assert (=> b!1387541 (= c!129033 (= lt!609927 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387542 () Bool)

(declare-fun c!129034 () Bool)

(assert (=> b!1387542 (= c!129034 (= lt!609927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785975 () SeekEntryResult!10180)

(assert (=> b!1387542 (= e!785973 e!785975)))

(declare-fun b!1387543 () Bool)

(assert (=> b!1387543 (= e!785975 (MissingVacant!10180 (index!43093 lt!609808)))))

(declare-fun b!1387544 () Bool)

(assert (=> b!1387544 (= e!785974 Undefined!10180)))

(declare-fun d!149601 () Bool)

(declare-fun lt!609926 () SeekEntryResult!10180)

(assert (=> d!149601 (and (or ((_ is Undefined!10180) lt!609926) (not ((_ is Found!10180) lt!609926)) (and (bvsge (index!43092 lt!609926) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609926) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609926) ((_ is Found!10180) lt!609926) (not ((_ is MissingVacant!10180) lt!609926)) (not (= (index!43094 lt!609926) (index!43093 lt!609808))) (and (bvsge (index!43094 lt!609926) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609926) (size!46387 lt!609729)))) (or ((_ is Undefined!10180) lt!609926) (ite ((_ is Found!10180) lt!609926) (= (select (arr!45837 lt!609729) (index!43092 lt!609926)) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and ((_ is MissingVacant!10180) lt!609926) (= (index!43094 lt!609926) (index!43093 lt!609808)) (= (select (arr!45837 lt!609729) (index!43094 lt!609926)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149601 (= lt!609926 e!785974)))

(declare-fun c!129032 () Bool)

(assert (=> d!149601 (= c!129032 (bvsge (x!124701 lt!609808) #b01111111111111111111111111111110))))

(assert (=> d!149601 (= lt!609927 (select (arr!45837 lt!609729) (index!43093 lt!609808)))))

(assert (=> d!149601 (validMask!0 mask!2987)))

(assert (=> d!149601 (= (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609808) (index!43093 lt!609808) (index!43093 lt!609808) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987) lt!609926)))

(declare-fun b!1387545 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1387545 (= e!785975 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124701 lt!609808) #b00000000000000000000000000000001) (nextIndex!0 (index!43093 lt!609808) (x!124701 lt!609808) mask!2987) (index!43093 lt!609808) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987))))

(declare-fun b!1387546 () Bool)

(assert (=> b!1387546 (= e!785973 (Found!10180 (index!43093 lt!609808)))))

(assert (= (and d!149601 c!129032) b!1387544))

(assert (= (and d!149601 (not c!129032)) b!1387541))

(assert (= (and b!1387541 c!129033) b!1387546))

(assert (= (and b!1387541 (not c!129033)) b!1387542))

(assert (= (and b!1387542 c!129034) b!1387543))

(assert (= (and b!1387542 (not c!129034)) b!1387545))

(declare-fun m!1273123 () Bool)

(assert (=> d!149601 m!1273123))

(declare-fun m!1273125 () Bool)

(assert (=> d!149601 m!1273125))

(assert (=> d!149601 m!1272765))

(assert (=> d!149601 m!1272613))

(declare-fun m!1273127 () Bool)

(assert (=> b!1387545 m!1273127))

(assert (=> b!1387545 m!1273127))

(assert (=> b!1387545 m!1272623))

(declare-fun m!1273129 () Bool)

(assert (=> b!1387545 m!1273129))

(assert (=> b!1387295 d!149601))

(declare-fun e!786017 () SeekEntryResult!10180)

(declare-fun b!1387608 () Bool)

(assert (=> b!1387608 (= e!786017 (Intermediate!10180 true (toIndex!0 (select (arr!45837 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387609 () Bool)

(declare-fun lt!609958 () SeekEntryResult!10180)

(assert (=> b!1387609 (and (bvsge (index!43093 lt!609958) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609958) (size!46387 a!2938)))))

(declare-fun e!786014 () Bool)

(assert (=> b!1387609 (= e!786014 (= (select (arr!45837 a!2938) (index!43093 lt!609958)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786013 () SeekEntryResult!10180)

(declare-fun b!1387610 () Bool)

(assert (=> b!1387610 (= e!786013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45837 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387611 () Bool)

(assert (=> b!1387611 (and (bvsge (index!43093 lt!609958) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609958) (size!46387 a!2938)))))

(declare-fun res!928377 () Bool)

(assert (=> b!1387611 (= res!928377 (= (select (arr!45837 a!2938) (index!43093 lt!609958)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387611 (=> res!928377 e!786014)))

(declare-fun b!1387612 () Bool)

(assert (=> b!1387612 (and (bvsge (index!43093 lt!609958) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609958) (size!46387 a!2938)))))

(declare-fun res!928379 () Bool)

(assert (=> b!1387612 (= res!928379 (= (select (arr!45837 a!2938) (index!43093 lt!609958)) (select (arr!45837 a!2938) startIndex!16)))))

(assert (=> b!1387612 (=> res!928379 e!786014)))

(declare-fun e!786015 () Bool)

(assert (=> b!1387612 (= e!786015 e!786014)))

(declare-fun b!1387613 () Bool)

(declare-fun e!786016 () Bool)

(assert (=> b!1387613 (= e!786016 e!786015)))

(declare-fun res!928378 () Bool)

(assert (=> b!1387613 (= res!928378 (and ((_ is Intermediate!10180) lt!609958) (not (undefined!10992 lt!609958)) (bvslt (x!124701 lt!609958) #b01111111111111111111111111111110) (bvsge (x!124701 lt!609958) #b00000000000000000000000000000000) (bvsge (x!124701 lt!609958) #b00000000000000000000000000000000)))))

(assert (=> b!1387613 (=> (not res!928378) (not e!786015))))

(declare-fun d!149605 () Bool)

(assert (=> d!149605 e!786016))

(declare-fun c!129057 () Bool)

(assert (=> d!149605 (= c!129057 (and ((_ is Intermediate!10180) lt!609958) (undefined!10992 lt!609958)))))

(assert (=> d!149605 (= lt!609958 e!786017)))

(declare-fun c!129058 () Bool)

(assert (=> d!149605 (= c!129058 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!609959 () (_ BitVec 64))

(assert (=> d!149605 (= lt!609959 (select (arr!45837 a!2938) (toIndex!0 (select (arr!45837 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!149605 (validMask!0 mask!2987)))

(assert (=> d!149605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45837 a!2938) startIndex!16) mask!2987) (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987) lt!609958)))

(declare-fun b!1387614 () Bool)

(assert (=> b!1387614 (= e!786017 e!786013)))

(declare-fun c!129056 () Bool)

(assert (=> b!1387614 (= c!129056 (or (= lt!609959 (select (arr!45837 a!2938) startIndex!16)) (= (bvadd lt!609959 lt!609959) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1387615 () Bool)

(assert (=> b!1387615 (= e!786013 (Intermediate!10180 false (toIndex!0 (select (arr!45837 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387616 () Bool)

(assert (=> b!1387616 (= e!786016 (bvsge (x!124701 lt!609958) #b01111111111111111111111111111110))))

(assert (= (and d!149605 c!129058) b!1387608))

(assert (= (and d!149605 (not c!129058)) b!1387614))

(assert (= (and b!1387614 c!129056) b!1387615))

(assert (= (and b!1387614 (not c!129056)) b!1387610))

(assert (= (and d!149605 c!129057) b!1387616))

(assert (= (and d!149605 (not c!129057)) b!1387613))

(assert (= (and b!1387613 res!928378) b!1387612))

(assert (= (and b!1387612 (not res!928379)) b!1387611))

(assert (= (and b!1387611 (not res!928377)) b!1387609))

(declare-fun m!1273213 () Bool)

(assert (=> b!1387612 m!1273213))

(assert (=> b!1387610 m!1272773))

(declare-fun m!1273215 () Bool)

(assert (=> b!1387610 m!1273215))

(assert (=> b!1387610 m!1273215))

(assert (=> b!1387610 m!1272629))

(declare-fun m!1273219 () Bool)

(assert (=> b!1387610 m!1273219))

(assert (=> b!1387609 m!1273213))

(assert (=> d!149605 m!1272773))

(declare-fun m!1273221 () Bool)

(assert (=> d!149605 m!1273221))

(assert (=> d!149605 m!1272613))

(assert (=> b!1387611 m!1273213))

(assert (=> d!149495 d!149605))

(declare-fun d!149637 () Bool)

(declare-fun lt!609969 () (_ BitVec 32))

(declare-fun lt!609968 () (_ BitVec 32))

(assert (=> d!149637 (= lt!609969 (bvmul (bvxor lt!609968 (bvlshr lt!609968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149637 (= lt!609968 ((_ extract 31 0) (bvand (bvxor (select (arr!45837 a!2938) startIndex!16) (bvlshr (select (arr!45837 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149637 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928384 (let ((h!33573 ((_ extract 31 0) (bvand (bvxor (select (arr!45837 a!2938) startIndex!16) (bvlshr (select (arr!45837 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124708 (bvmul (bvxor h!33573 (bvlshr h!33573 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124708 (bvlshr x!124708 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928384 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928384 #b00000000000000000000000000000000))))))

(assert (=> d!149637 (= (toIndex!0 (select (arr!45837 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!609969 (bvlshr lt!609969 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149495 d!149637))

(assert (=> d!149495 d!149455))

(declare-fun b!1387628 () Bool)

(declare-fun e!786031 () SeekEntryResult!10180)

(assert (=> b!1387628 (= e!786031 (Intermediate!10180 true (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387629 () Bool)

(declare-fun lt!609970 () SeekEntryResult!10180)

(assert (=> b!1387629 (and (bvsge (index!43093 lt!609970) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609970) (size!46387 lt!609729)))))

(declare-fun e!786028 () Bool)

(assert (=> b!1387629 (= e!786028 (= (select (arr!45837 lt!609729) (index!43093 lt!609970)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1387630 () Bool)

(declare-fun e!786027 () SeekEntryResult!10180)

(assert (=> b!1387630 (= e!786027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987))))

(declare-fun b!1387631 () Bool)

(assert (=> b!1387631 (and (bvsge (index!43093 lt!609970) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609970) (size!46387 lt!609729)))))

(declare-fun res!928388 () Bool)

(assert (=> b!1387631 (= res!928388 (= (select (arr!45837 lt!609729) (index!43093 lt!609970)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387631 (=> res!928388 e!786028)))

(declare-fun b!1387632 () Bool)

(assert (=> b!1387632 (and (bvsge (index!43093 lt!609970) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609970) (size!46387 lt!609729)))))

(declare-fun res!928390 () Bool)

(assert (=> b!1387632 (= res!928390 (= (select (arr!45837 lt!609729) (index!43093 lt!609970)) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1387632 (=> res!928390 e!786028)))

(declare-fun e!786029 () Bool)

(assert (=> b!1387632 (= e!786029 e!786028)))

(declare-fun b!1387633 () Bool)

(declare-fun e!786030 () Bool)

(assert (=> b!1387633 (= e!786030 e!786029)))

(declare-fun res!928389 () Bool)

(assert (=> b!1387633 (= res!928389 (and ((_ is Intermediate!10180) lt!609970) (not (undefined!10992 lt!609970)) (bvslt (x!124701 lt!609970) #b01111111111111111111111111111110) (bvsge (x!124701 lt!609970) #b00000000000000000000000000000000) (bvsge (x!124701 lt!609970) #b00000000000000000000000000000000)))))

(assert (=> b!1387633 (=> (not res!928389) (not e!786029))))

(declare-fun d!149645 () Bool)

(assert (=> d!149645 e!786030))

(declare-fun c!129062 () Bool)

(assert (=> d!149645 (= c!129062 (and ((_ is Intermediate!10180) lt!609970) (undefined!10992 lt!609970)))))

(assert (=> d!149645 (= lt!609970 e!786031)))

(declare-fun c!129063 () Bool)

(assert (=> d!149645 (= c!129063 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!609971 () (_ BitVec 64))

(assert (=> d!149645 (= lt!609971 (select (arr!45837 lt!609729) (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149645 (validMask!0 mask!2987)))

(assert (=> d!149645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609729 mask!2987) lt!609970)))

(declare-fun b!1387634 () Bool)

(assert (=> b!1387634 (= e!786031 e!786027)))

(declare-fun c!129061 () Bool)

(assert (=> b!1387634 (= c!129061 (or (= lt!609971 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!609971 lt!609971) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1387635 () Bool)

(assert (=> b!1387635 (= e!786027 (Intermediate!10180 false (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387636 () Bool)

(assert (=> b!1387636 (= e!786030 (bvsge (x!124701 lt!609970) #b01111111111111111111111111111110))))

(assert (= (and d!149645 c!129063) b!1387628))

(assert (= (and d!149645 (not c!129063)) b!1387634))

(assert (= (and b!1387634 c!129061) b!1387635))

(assert (= (and b!1387634 (not c!129061)) b!1387630))

(assert (= (and d!149645 c!129062) b!1387636))

(assert (= (and d!149645 (not c!129062)) b!1387633))

(assert (= (and b!1387633 res!928389) b!1387632))

(assert (= (and b!1387632 (not res!928390)) b!1387631))

(assert (= (and b!1387631 (not res!928388)) b!1387629))

(declare-fun m!1273231 () Bool)

(assert (=> b!1387632 m!1273231))

(assert (=> b!1387630 m!1272755))

(declare-fun m!1273233 () Bool)

(assert (=> b!1387630 m!1273233))

(assert (=> b!1387630 m!1273233))

(assert (=> b!1387630 m!1272623))

(declare-fun m!1273239 () Bool)

(assert (=> b!1387630 m!1273239))

(assert (=> b!1387629 m!1273231))

(assert (=> d!149645 m!1272755))

(declare-fun m!1273245 () Bool)

(assert (=> d!149645 m!1273245))

(assert (=> d!149645 m!1272613))

(assert (=> b!1387631 m!1273231))

(assert (=> d!149483 d!149645))

(declare-fun d!149649 () Bool)

(declare-fun lt!609976 () (_ BitVec 32))

(declare-fun lt!609975 () (_ BitVec 32))

(assert (=> d!149649 (= lt!609976 (bvmul (bvxor lt!609975 (bvlshr lt!609975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149649 (= lt!609975 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149649 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928384 (let ((h!33573 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124708 (bvmul (bvxor h!33573 (bvlshr h!33573 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124708 (bvlshr x!124708 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928384 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928384 #b00000000000000000000000000000000))))))

(assert (=> d!149649 (= (toIndex!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!609976 (bvlshr lt!609976 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149483 d!149649))

(assert (=> d!149483 d!149455))

(declare-fun call!66591 () Bool)

(declare-fun bm!66588 () Bool)

(assert (=> bm!66588 (= call!66591 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!609729 mask!2987))))

(declare-fun b!1387641 () Bool)

(declare-fun e!786036 () Bool)

(declare-fun e!786035 () Bool)

(assert (=> b!1387641 (= e!786036 e!786035)))

(declare-fun lt!609979 () (_ BitVec 64))

(assert (=> b!1387641 (= lt!609979 (select (arr!45837 lt!609729) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609978 () Unit!46382)

(assert (=> b!1387641 (= lt!609978 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609729 lt!609979 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387641 (arrayContainsKey!0 lt!609729 lt!609979 #b00000000000000000000000000000000)))

(declare-fun lt!609977 () Unit!46382)

(assert (=> b!1387641 (= lt!609977 lt!609978)))

(declare-fun res!928393 () Bool)

(assert (=> b!1387641 (= res!928393 (= (seekEntryOrOpen!0 (select (arr!45837 lt!609729) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!609729 mask!2987) (Found!10180 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387641 (=> (not res!928393) (not e!786035))))

(declare-fun b!1387642 () Bool)

(declare-fun e!786037 () Bool)

(assert (=> b!1387642 (= e!786037 e!786036)))

(declare-fun c!129065 () Bool)

(assert (=> b!1387642 (= c!129065 (validKeyInArray!0 (select (arr!45837 lt!609729) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!149653 () Bool)

(declare-fun res!928394 () Bool)

(assert (=> d!149653 (=> res!928394 e!786037)))

(assert (=> d!149653 (= res!928394 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46387 lt!609729)))))

(assert (=> d!149653 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609729 mask!2987) e!786037)))

(declare-fun b!1387643 () Bool)

(assert (=> b!1387643 (= e!786036 call!66591)))

(declare-fun b!1387644 () Bool)

(assert (=> b!1387644 (= e!786035 call!66591)))

(assert (= (and d!149653 (not res!928394)) b!1387642))

(assert (= (and b!1387642 c!129065) b!1387641))

(assert (= (and b!1387642 (not c!129065)) b!1387643))

(assert (= (and b!1387641 res!928393) b!1387644))

(assert (= (or b!1387644 b!1387643) bm!66588))

(declare-fun m!1273251 () Bool)

(assert (=> bm!66588 m!1273251))

(declare-fun m!1273253 () Bool)

(assert (=> b!1387641 m!1273253))

(declare-fun m!1273255 () Bool)

(assert (=> b!1387641 m!1273255))

(declare-fun m!1273257 () Bool)

(assert (=> b!1387641 m!1273257))

(assert (=> b!1387641 m!1273253))

(declare-fun m!1273259 () Bool)

(assert (=> b!1387641 m!1273259))

(assert (=> b!1387642 m!1273253))

(assert (=> b!1387642 m!1273253))

(declare-fun m!1273261 () Bool)

(assert (=> b!1387642 m!1273261))

(assert (=> bm!66565 d!149653))

(assert (=> b!1387376 d!149549))

(declare-fun d!149655 () Bool)

(declare-fun res!928395 () Bool)

(declare-fun e!786038 () Bool)

(assert (=> d!149655 (=> res!928395 e!786038)))

(assert (=> d!149655 (= res!928395 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46387 a!2938)))))

(assert (=> d!149655 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128978 (Cons!32361 (select (arr!45837 a!2938) #b00000000000000000000000000000000) Nil!32362) Nil!32362)) e!786038)))

(declare-fun b!1387645 () Bool)

(declare-fun e!786040 () Bool)

(declare-fun e!786039 () Bool)

(assert (=> b!1387645 (= e!786040 e!786039)))

(declare-fun c!129066 () Bool)

(assert (=> b!1387645 (= c!129066 (validKeyInArray!0 (select (arr!45837 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!66589 () Bool)

(declare-fun call!66592 () Bool)

(assert (=> bm!66589 (= call!66592 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129066 (Cons!32361 (select (arr!45837 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!128978 (Cons!32361 (select (arr!45837 a!2938) #b00000000000000000000000000000000) Nil!32362) Nil!32362)) (ite c!128978 (Cons!32361 (select (arr!45837 a!2938) #b00000000000000000000000000000000) Nil!32362) Nil!32362))))))

(declare-fun b!1387646 () Bool)

(assert (=> b!1387646 (= e!786038 e!786040)))

(declare-fun res!928396 () Bool)

(assert (=> b!1387646 (=> (not res!928396) (not e!786040))))

(declare-fun e!786041 () Bool)

(assert (=> b!1387646 (= res!928396 (not e!786041))))

(declare-fun res!928397 () Bool)

(assert (=> b!1387646 (=> (not res!928397) (not e!786041))))

(assert (=> b!1387646 (= res!928397 (validKeyInArray!0 (select (arr!45837 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1387647 () Bool)

(assert (=> b!1387647 (= e!786039 call!66592)))

(declare-fun b!1387648 () Bool)

(assert (=> b!1387648 (= e!786041 (contains!9746 (ite c!128978 (Cons!32361 (select (arr!45837 a!2938) #b00000000000000000000000000000000) Nil!32362) Nil!32362) (select (arr!45837 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1387649 () Bool)

(assert (=> b!1387649 (= e!786039 call!66592)))

(assert (= (and d!149655 (not res!928395)) b!1387646))

(assert (= (and b!1387646 res!928397) b!1387648))

(assert (= (and b!1387646 res!928396) b!1387645))

(assert (= (and b!1387645 c!129066) b!1387649))

(assert (= (and b!1387645 (not c!129066)) b!1387647))

(assert (= (or b!1387649 b!1387647) bm!66589))

(assert (=> b!1387645 m!1272989))

(assert (=> b!1387645 m!1272989))

(assert (=> b!1387645 m!1272997))

(assert (=> bm!66589 m!1272989))

(declare-fun m!1273263 () Bool)

(assert (=> bm!66589 m!1273263))

(assert (=> b!1387646 m!1272989))

(assert (=> b!1387646 m!1272989))

(assert (=> b!1387646 m!1272997))

(assert (=> b!1387648 m!1272989))

(assert (=> b!1387648 m!1272989))

(declare-fun m!1273265 () Bool)

(assert (=> b!1387648 m!1273265))

(assert (=> bm!66573 d!149655))

(assert (=> b!1387375 d!149549))

(declare-fun b!1387654 () Bool)

(declare-fun e!786047 () SeekEntryResult!10180)

(declare-fun e!786046 () SeekEntryResult!10180)

(assert (=> b!1387654 (= e!786047 e!786046)))

(declare-fun c!129068 () Bool)

(declare-fun lt!609983 () (_ BitVec 64))

(assert (=> b!1387654 (= c!129068 (= lt!609983 (select (arr!45837 a!2938) startIndex!16)))))

(declare-fun b!1387655 () Bool)

(declare-fun c!129069 () Bool)

(assert (=> b!1387655 (= c!129069 (= lt!609983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786048 () SeekEntryResult!10180)

(assert (=> b!1387655 (= e!786046 e!786048)))

(declare-fun b!1387656 () Bool)

(assert (=> b!1387656 (= e!786048 (MissingVacant!10180 (index!43093 lt!609814)))))

(declare-fun b!1387657 () Bool)

(assert (=> b!1387657 (= e!786047 Undefined!10180)))

(declare-fun d!149657 () Bool)

(declare-fun lt!609982 () SeekEntryResult!10180)

(assert (=> d!149657 (and (or ((_ is Undefined!10180) lt!609982) (not ((_ is Found!10180) lt!609982)) (and (bvsge (index!43092 lt!609982) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609982) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609982) ((_ is Found!10180) lt!609982) (not ((_ is MissingVacant!10180) lt!609982)) (not (= (index!43094 lt!609982) (index!43093 lt!609814))) (and (bvsge (index!43094 lt!609982) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609982) (size!46387 a!2938)))) (or ((_ is Undefined!10180) lt!609982) (ite ((_ is Found!10180) lt!609982) (= (select (arr!45837 a!2938) (index!43092 lt!609982)) (select (arr!45837 a!2938) startIndex!16)) (and ((_ is MissingVacant!10180) lt!609982) (= (index!43094 lt!609982) (index!43093 lt!609814)) (= (select (arr!45837 a!2938) (index!43094 lt!609982)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149657 (= lt!609982 e!786047)))

(declare-fun c!129067 () Bool)

(assert (=> d!149657 (= c!129067 (bvsge (x!124701 lt!609814) #b01111111111111111111111111111110))))

(assert (=> d!149657 (= lt!609983 (select (arr!45837 a!2938) (index!43093 lt!609814)))))

(assert (=> d!149657 (validMask!0 mask!2987)))

(assert (=> d!149657 (= (seekKeyOrZeroReturnVacant!0 (x!124701 lt!609814) (index!43093 lt!609814) (index!43093 lt!609814) (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987) lt!609982)))

(declare-fun b!1387658 () Bool)

(assert (=> b!1387658 (= e!786048 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124701 lt!609814) #b00000000000000000000000000000001) (nextIndex!0 (index!43093 lt!609814) (x!124701 lt!609814) mask!2987) (index!43093 lt!609814) (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387659 () Bool)

(assert (=> b!1387659 (= e!786046 (Found!10180 (index!43093 lt!609814)))))

(assert (= (and d!149657 c!129067) b!1387657))

(assert (= (and d!149657 (not c!129067)) b!1387654))

(assert (= (and b!1387654 c!129068) b!1387659))

(assert (= (and b!1387654 (not c!129068)) b!1387655))

(assert (= (and b!1387655 c!129069) b!1387656))

(assert (= (and b!1387655 (not c!129069)) b!1387658))

(declare-fun m!1273267 () Bool)

(assert (=> d!149657 m!1273267))

(declare-fun m!1273269 () Bool)

(assert (=> d!149657 m!1273269))

(assert (=> d!149657 m!1272793))

(assert (=> d!149657 m!1272613))

(declare-fun m!1273271 () Bool)

(assert (=> b!1387658 m!1273271))

(assert (=> b!1387658 m!1273271))

(assert (=> b!1387658 m!1272629))

(declare-fun m!1273273 () Bool)

(assert (=> b!1387658 m!1273273))

(assert (=> b!1387307 d!149657))

(declare-fun d!149659 () Bool)

(assert (=> d!149659 (= (seekEntryOrOpen!0 (select (arr!45837 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94923 (store (arr!45837 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46387 a!2938)) mask!2987))))

(assert (=> d!149659 true))

(declare-fun _$42!19 () Unit!46382)

(assert (=> d!149659 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!19)))

(declare-fun bs!40326 () Bool)

(assert (= bs!40326 d!149659))

(assert (=> bs!40326 m!1272623))

(assert (=> bs!40326 m!1272725))

(assert (=> bs!40326 m!1272629))

(assert (=> bs!40326 m!1272611))

(assert (=> bs!40326 m!1272629))

(assert (=> bs!40326 m!1272631))

(assert (=> bs!40326 m!1272623))

(assert (=> d!149465 d!149659))

(assert (=> d!149465 d!149455))

(check-sat (not bm!66589) (not b!1387645) (not bm!66581) (not d!149555) (not b!1387416) (not bm!66584) (not b!1387641) (not d!149597) (not d!149645) (not b!1387648) (not b!1387485) (not b!1387630) (not b!1387449) (not b!1387497) (not d!149587) (not b!1387474) (not b!1387496) (not d!149581) (not d!149601) (not b!1387444) (not bm!66580) (not b!1387428) (not d!149605) (not d!149569) (not d!149551) (not b!1387462) (not bm!66588) (not b!1387417) (not b!1387492) (not bm!66582) (not b!1387610) (not d!149573) (not b!1387448) (not b!1387425) (not d!149657) (not b!1387658) (not d!149659) (not b!1387445) (not d!149565) (not b!1387471) (not b!1387545) (not d!149593) (not b!1387501) (not d!149577) (not d!149557) (not b!1387453) (not b!1387642) (not b!1387646))
(check-sat)
