; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69434 () Bool)

(assert start!69434)

(declare-fun b!809117 () Bool)

(declare-fun res!552695 () Bool)

(declare-fun e!447985 () Bool)

(assert (=> b!809117 (=> (not res!552695) (not e!447985))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809117 (= res!552695 (validKeyInArray!0 k0!2044))))

(declare-fun b!809118 () Bool)

(declare-fun e!447981 () Bool)

(declare-fun e!447984 () Bool)

(assert (=> b!809118 (= e!447981 e!447984)))

(declare-fun res!552696 () Bool)

(assert (=> b!809118 (=> (not res!552696) (not e!447984))))

(declare-fun lt!362520 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43966 0))(
  ( (array!43967 (arr!21055 (Array (_ BitVec 32) (_ BitVec 64))) (size!21475 (_ BitVec 32))) )
))
(declare-fun lt!362521 () array!43966)

(declare-datatypes ((SeekEntryResult!8602 0))(
  ( (MissingZero!8602 (index!36776 (_ BitVec 32))) (Found!8602 (index!36777 (_ BitVec 32))) (Intermediate!8602 (undefined!9414 Bool) (index!36778 (_ BitVec 32)) (x!67740 (_ BitVec 32))) (Undefined!8602) (MissingVacant!8602 (index!36779 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43966 (_ BitVec 32)) SeekEntryResult!8602)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43966 (_ BitVec 32)) SeekEntryResult!8602)

(assert (=> b!809118 (= res!552696 (= (seekEntryOrOpen!0 lt!362520 lt!362521 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362520 lt!362521 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43966)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809118 (= lt!362520 (select (store (arr!21055 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809118 (= lt!362521 (array!43967 (store (arr!21055 a!3170) i!1163 k0!2044) (size!21475 a!3170)))))

(declare-fun b!809119 () Bool)

(declare-fun e!447982 () Bool)

(assert (=> b!809119 (= e!447982 (bvsgt (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!362518 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809119 (= lt!362518 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!809120 () Bool)

(declare-fun res!552693 () Bool)

(assert (=> b!809120 (=> (not res!552693) (not e!447981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43966 (_ BitVec 32)) Bool)

(assert (=> b!809120 (= res!552693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809121 () Bool)

(assert (=> b!809121 (= e!447984 e!447982)))

(declare-fun res!552702 () Bool)

(assert (=> b!809121 (=> (not res!552702) (not e!447982))))

(declare-fun lt!362519 () SeekEntryResult!8602)

(declare-fun lt!362517 () SeekEntryResult!8602)

(assert (=> b!809121 (= res!552702 (and (= lt!362517 lt!362519) (= lt!362519 (Found!8602 j!153)) (not (= (select (arr!21055 a!3170) index!1236) (select (arr!21055 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809121 (= lt!362519 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21055 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809121 (= lt!362517 (seekEntryOrOpen!0 (select (arr!21055 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809122 () Bool)

(declare-fun res!552697 () Bool)

(assert (=> b!809122 (=> (not res!552697) (not e!447985))))

(declare-fun arrayContainsKey!0 (array!43966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809122 (= res!552697 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809123 () Bool)

(declare-fun res!552701 () Bool)

(assert (=> b!809123 (=> (not res!552701) (not e!447981))))

(declare-datatypes ((List!14925 0))(
  ( (Nil!14922) (Cons!14921 (h!16056 (_ BitVec 64)) (t!21232 List!14925)) )
))
(declare-fun arrayNoDuplicates!0 (array!43966 (_ BitVec 32) List!14925) Bool)

(assert (=> b!809123 (= res!552701 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14922))))

(declare-fun b!809124 () Bool)

(declare-fun res!552692 () Bool)

(assert (=> b!809124 (=> (not res!552692) (not e!447981))))

(assert (=> b!809124 (= res!552692 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21475 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21055 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21475 a!3170)) (= (select (arr!21055 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809125 () Bool)

(declare-fun res!552700 () Bool)

(assert (=> b!809125 (=> (not res!552700) (not e!447985))))

(assert (=> b!809125 (= res!552700 (validKeyInArray!0 (select (arr!21055 a!3170) j!153)))))

(declare-fun res!552699 () Bool)

(assert (=> start!69434 (=> (not res!552699) (not e!447985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69434 (= res!552699 (validMask!0 mask!3266))))

(assert (=> start!69434 e!447985))

(assert (=> start!69434 true))

(declare-fun array_inv!16914 (array!43966) Bool)

(assert (=> start!69434 (array_inv!16914 a!3170)))

(declare-fun b!809126 () Bool)

(declare-fun res!552694 () Bool)

(assert (=> b!809126 (=> (not res!552694) (not e!447985))))

(assert (=> b!809126 (= res!552694 (and (= (size!21475 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21475 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21475 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809127 () Bool)

(assert (=> b!809127 (= e!447985 e!447981)))

(declare-fun res!552698 () Bool)

(assert (=> b!809127 (=> (not res!552698) (not e!447981))))

(declare-fun lt!362522 () SeekEntryResult!8602)

(assert (=> b!809127 (= res!552698 (or (= lt!362522 (MissingZero!8602 i!1163)) (= lt!362522 (MissingVacant!8602 i!1163))))))

(assert (=> b!809127 (= lt!362522 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69434 res!552699) b!809126))

(assert (= (and b!809126 res!552694) b!809125))

(assert (= (and b!809125 res!552700) b!809117))

(assert (= (and b!809117 res!552695) b!809122))

(assert (= (and b!809122 res!552697) b!809127))

(assert (= (and b!809127 res!552698) b!809120))

(assert (= (and b!809120 res!552693) b!809123))

(assert (= (and b!809123 res!552701) b!809124))

(assert (= (and b!809124 res!552692) b!809118))

(assert (= (and b!809118 res!552696) b!809121))

(assert (= (and b!809121 res!552702) b!809119))

(declare-fun m!751639 () Bool)

(assert (=> b!809123 m!751639))

(declare-fun m!751641 () Bool)

(assert (=> b!809127 m!751641))

(declare-fun m!751643 () Bool)

(assert (=> b!809120 m!751643))

(declare-fun m!751645 () Bool)

(assert (=> b!809125 m!751645))

(assert (=> b!809125 m!751645))

(declare-fun m!751647 () Bool)

(assert (=> b!809125 m!751647))

(declare-fun m!751649 () Bool)

(assert (=> b!809122 m!751649))

(declare-fun m!751651 () Bool)

(assert (=> b!809119 m!751651))

(declare-fun m!751653 () Bool)

(assert (=> b!809118 m!751653))

(declare-fun m!751655 () Bool)

(assert (=> b!809118 m!751655))

(declare-fun m!751657 () Bool)

(assert (=> b!809118 m!751657))

(declare-fun m!751659 () Bool)

(assert (=> b!809118 m!751659))

(declare-fun m!751661 () Bool)

(assert (=> b!809124 m!751661))

(declare-fun m!751663 () Bool)

(assert (=> b!809124 m!751663))

(declare-fun m!751665 () Bool)

(assert (=> b!809117 m!751665))

(declare-fun m!751667 () Bool)

(assert (=> b!809121 m!751667))

(assert (=> b!809121 m!751645))

(assert (=> b!809121 m!751645))

(declare-fun m!751669 () Bool)

(assert (=> b!809121 m!751669))

(assert (=> b!809121 m!751645))

(declare-fun m!751671 () Bool)

(assert (=> b!809121 m!751671))

(declare-fun m!751673 () Bool)

(assert (=> start!69434 m!751673))

(declare-fun m!751675 () Bool)

(assert (=> start!69434 m!751675))

(check-sat (not b!809122) (not b!809119) (not b!809117) (not b!809120) (not b!809121) (not b!809123) (not b!809125) (not b!809127) (not b!809118) (not start!69434))
(check-sat)
(get-model)

(declare-fun b!809202 () Bool)

(declare-fun e!448024 () Bool)

(declare-fun e!448023 () Bool)

(assert (=> b!809202 (= e!448024 e!448023)))

(declare-fun lt!362565 () (_ BitVec 64))

(assert (=> b!809202 (= lt!362565 (select (arr!21055 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27599 0))(
  ( (Unit!27600) )
))
(declare-fun lt!362566 () Unit!27599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43966 (_ BitVec 64) (_ BitVec 32)) Unit!27599)

(assert (=> b!809202 (= lt!362566 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362565 #b00000000000000000000000000000000))))

(assert (=> b!809202 (arrayContainsKey!0 a!3170 lt!362565 #b00000000000000000000000000000000)))

(declare-fun lt!362567 () Unit!27599)

(assert (=> b!809202 (= lt!362567 lt!362566)))

(declare-fun res!552773 () Bool)

(assert (=> b!809202 (= res!552773 (= (seekEntryOrOpen!0 (select (arr!21055 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8602 #b00000000000000000000000000000000)))))

(assert (=> b!809202 (=> (not res!552773) (not e!448023))))

(declare-fun b!809203 () Bool)

(declare-fun call!35430 () Bool)

(assert (=> b!809203 (= e!448023 call!35430)))

(declare-fun b!809204 () Bool)

(assert (=> b!809204 (= e!448024 call!35430)))

(declare-fun d!104063 () Bool)

(declare-fun res!552774 () Bool)

(declare-fun e!448022 () Bool)

(assert (=> d!104063 (=> res!552774 e!448022)))

(assert (=> d!104063 (= res!552774 (bvsge #b00000000000000000000000000000000 (size!21475 a!3170)))))

(assert (=> d!104063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448022)))

(declare-fun bm!35427 () Bool)

(assert (=> bm!35427 (= call!35430 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!809205 () Bool)

(assert (=> b!809205 (= e!448022 e!448024)))

(declare-fun c!88628 () Bool)

(assert (=> b!809205 (= c!88628 (validKeyInArray!0 (select (arr!21055 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!104063 (not res!552774)) b!809205))

(assert (= (and b!809205 c!88628) b!809202))

(assert (= (and b!809205 (not c!88628)) b!809204))

(assert (= (and b!809202 res!552773) b!809203))

(assert (= (or b!809203 b!809204) bm!35427))

(declare-fun m!751753 () Bool)

(assert (=> b!809202 m!751753))

(declare-fun m!751755 () Bool)

(assert (=> b!809202 m!751755))

(declare-fun m!751757 () Bool)

(assert (=> b!809202 m!751757))

(assert (=> b!809202 m!751753))

(declare-fun m!751759 () Bool)

(assert (=> b!809202 m!751759))

(declare-fun m!751761 () Bool)

(assert (=> bm!35427 m!751761))

(assert (=> b!809205 m!751753))

(assert (=> b!809205 m!751753))

(declare-fun m!751763 () Bool)

(assert (=> b!809205 m!751763))

(assert (=> b!809120 d!104063))

(declare-fun d!104065 () Bool)

(assert (=> d!104065 (= (validKeyInArray!0 (select (arr!21055 a!3170) j!153)) (and (not (= (select (arr!21055 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21055 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809125 d!104065))

(declare-fun d!104067 () Bool)

(assert (=> d!104067 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69434 d!104067))

(declare-fun d!104069 () Bool)

(assert (=> d!104069 (= (array_inv!16914 a!3170) (bvsge (size!21475 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69434 d!104069))

(declare-fun d!104071 () Bool)

(declare-fun lt!362570 () (_ BitVec 32))

(assert (=> d!104071 (and (bvsge lt!362570 #b00000000000000000000000000000000) (bvslt lt!362570 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104071 (= lt!362570 (choose!52 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (=> d!104071 (validMask!0 mask!3266)))

(assert (=> d!104071 (= (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) lt!362570)))

(declare-fun bs!22409 () Bool)

(assert (= bs!22409 d!104071))

(declare-fun m!751765 () Bool)

(assert (=> bs!22409 m!751765))

(assert (=> bs!22409 m!751673))

(assert (=> b!809119 d!104071))

(declare-fun d!104073 () Bool)

(assert (=> d!104073 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809117 d!104073))

(declare-fun b!809245 () Bool)

(declare-fun c!88644 () Bool)

(declare-fun lt!362582 () (_ BitVec 64))

(assert (=> b!809245 (= c!88644 (= lt!362582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448051 () SeekEntryResult!8602)

(declare-fun e!448050 () SeekEntryResult!8602)

(assert (=> b!809245 (= e!448051 e!448050)))

(declare-fun b!809246 () Bool)

(declare-fun lt!362583 () SeekEntryResult!8602)

(assert (=> b!809246 (= e!448050 (MissingZero!8602 (index!36778 lt!362583)))))

(declare-fun d!104075 () Bool)

(declare-fun lt!362581 () SeekEntryResult!8602)

(get-info :version)

(assert (=> d!104075 (and (or ((_ is Undefined!8602) lt!362581) (not ((_ is Found!8602) lt!362581)) (and (bvsge (index!36777 lt!362581) #b00000000000000000000000000000000) (bvslt (index!36777 lt!362581) (size!21475 lt!362521)))) (or ((_ is Undefined!8602) lt!362581) ((_ is Found!8602) lt!362581) (not ((_ is MissingZero!8602) lt!362581)) (and (bvsge (index!36776 lt!362581) #b00000000000000000000000000000000) (bvslt (index!36776 lt!362581) (size!21475 lt!362521)))) (or ((_ is Undefined!8602) lt!362581) ((_ is Found!8602) lt!362581) ((_ is MissingZero!8602) lt!362581) (not ((_ is MissingVacant!8602) lt!362581)) (and (bvsge (index!36779 lt!362581) #b00000000000000000000000000000000) (bvslt (index!36779 lt!362581) (size!21475 lt!362521)))) (or ((_ is Undefined!8602) lt!362581) (ite ((_ is Found!8602) lt!362581) (= (select (arr!21055 lt!362521) (index!36777 lt!362581)) lt!362520) (ite ((_ is MissingZero!8602) lt!362581) (= (select (arr!21055 lt!362521) (index!36776 lt!362581)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8602) lt!362581) (= (select (arr!21055 lt!362521) (index!36779 lt!362581)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448049 () SeekEntryResult!8602)

(assert (=> d!104075 (= lt!362581 e!448049)))

(declare-fun c!88645 () Bool)

(assert (=> d!104075 (= c!88645 (and ((_ is Intermediate!8602) lt!362583) (undefined!9414 lt!362583)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43966 (_ BitVec 32)) SeekEntryResult!8602)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104075 (= lt!362583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362520 mask!3266) lt!362520 lt!362521 mask!3266))))

(assert (=> d!104075 (validMask!0 mask!3266)))

(assert (=> d!104075 (= (seekEntryOrOpen!0 lt!362520 lt!362521 mask!3266) lt!362581)))

(declare-fun b!809247 () Bool)

(assert (=> b!809247 (= e!448050 (seekKeyOrZeroReturnVacant!0 (x!67740 lt!362583) (index!36778 lt!362583) (index!36778 lt!362583) lt!362520 lt!362521 mask!3266))))

(declare-fun b!809248 () Bool)

(assert (=> b!809248 (= e!448049 e!448051)))

(assert (=> b!809248 (= lt!362582 (select (arr!21055 lt!362521) (index!36778 lt!362583)))))

(declare-fun c!88646 () Bool)

(assert (=> b!809248 (= c!88646 (= lt!362582 lt!362520))))

(declare-fun b!809249 () Bool)

(assert (=> b!809249 (= e!448049 Undefined!8602)))

(declare-fun b!809250 () Bool)

(assert (=> b!809250 (= e!448051 (Found!8602 (index!36778 lt!362583)))))

(assert (= (and d!104075 c!88645) b!809249))

(assert (= (and d!104075 (not c!88645)) b!809248))

(assert (= (and b!809248 c!88646) b!809250))

(assert (= (and b!809248 (not c!88646)) b!809245))

(assert (= (and b!809245 c!88644) b!809246))

(assert (= (and b!809245 (not c!88644)) b!809247))

(declare-fun m!751775 () Bool)

(assert (=> d!104075 m!751775))

(declare-fun m!751777 () Bool)

(assert (=> d!104075 m!751777))

(assert (=> d!104075 m!751673))

(assert (=> d!104075 m!751777))

(declare-fun m!751779 () Bool)

(assert (=> d!104075 m!751779))

(declare-fun m!751781 () Bool)

(assert (=> d!104075 m!751781))

(declare-fun m!751783 () Bool)

(assert (=> d!104075 m!751783))

(declare-fun m!751785 () Bool)

(assert (=> b!809247 m!751785))

(declare-fun m!751787 () Bool)

(assert (=> b!809248 m!751787))

(assert (=> b!809118 d!104075))

(declare-fun b!809269 () Bool)

(declare-fun e!448063 () SeekEntryResult!8602)

(assert (=> b!809269 (= e!448063 (MissingVacant!8602 vacantAfter!23))))

(declare-fun b!809270 () Bool)

(declare-fun e!448061 () SeekEntryResult!8602)

(declare-fun e!448062 () SeekEntryResult!8602)

(assert (=> b!809270 (= e!448061 e!448062)))

(declare-fun c!88656 () Bool)

(declare-fun lt!362591 () (_ BitVec 64))

(assert (=> b!809270 (= c!88656 (= lt!362591 lt!362520))))

(declare-fun b!809272 () Bool)

(assert (=> b!809272 (= e!448062 (Found!8602 index!1236))))

(declare-fun b!809273 () Bool)

(assert (=> b!809273 (= e!448063 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!362520 lt!362521 mask!3266))))

(declare-fun b!809274 () Bool)

(declare-fun c!88657 () Bool)

(assert (=> b!809274 (= c!88657 (= lt!362591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809274 (= e!448062 e!448063)))

(declare-fun d!104085 () Bool)

(declare-fun lt!362590 () SeekEntryResult!8602)

(assert (=> d!104085 (and (or ((_ is Undefined!8602) lt!362590) (not ((_ is Found!8602) lt!362590)) (and (bvsge (index!36777 lt!362590) #b00000000000000000000000000000000) (bvslt (index!36777 lt!362590) (size!21475 lt!362521)))) (or ((_ is Undefined!8602) lt!362590) ((_ is Found!8602) lt!362590) (not ((_ is MissingVacant!8602) lt!362590)) (not (= (index!36779 lt!362590) vacantAfter!23)) (and (bvsge (index!36779 lt!362590) #b00000000000000000000000000000000) (bvslt (index!36779 lt!362590) (size!21475 lt!362521)))) (or ((_ is Undefined!8602) lt!362590) (ite ((_ is Found!8602) lt!362590) (= (select (arr!21055 lt!362521) (index!36777 lt!362590)) lt!362520) (and ((_ is MissingVacant!8602) lt!362590) (= (index!36779 lt!362590) vacantAfter!23) (= (select (arr!21055 lt!362521) (index!36779 lt!362590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104085 (= lt!362590 e!448061)))

(declare-fun c!88658 () Bool)

(assert (=> d!104085 (= c!88658 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104085 (= lt!362591 (select (arr!21055 lt!362521) index!1236))))

(assert (=> d!104085 (validMask!0 mask!3266)))

(assert (=> d!104085 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362520 lt!362521 mask!3266) lt!362590)))

(declare-fun b!809271 () Bool)

(assert (=> b!809271 (= e!448061 Undefined!8602)))

(assert (= (and d!104085 c!88658) b!809271))

(assert (= (and d!104085 (not c!88658)) b!809270))

(assert (= (and b!809270 c!88656) b!809272))

(assert (= (and b!809270 (not c!88656)) b!809274))

(assert (= (and b!809274 c!88657) b!809269))

(assert (= (and b!809274 (not c!88657)) b!809273))

(declare-fun m!751797 () Bool)

(assert (=> b!809273 m!751797))

(assert (=> b!809273 m!751797))

(declare-fun m!751799 () Bool)

(assert (=> b!809273 m!751799))

(declare-fun m!751801 () Bool)

(assert (=> d!104085 m!751801))

(declare-fun m!751803 () Bool)

(assert (=> d!104085 m!751803))

(declare-fun m!751805 () Bool)

(assert (=> d!104085 m!751805))

(assert (=> d!104085 m!751673))

(assert (=> b!809118 d!104085))

(declare-fun bm!35433 () Bool)

(declare-fun call!35436 () Bool)

(declare-fun c!88673 () Bool)

(assert (=> bm!35433 (= call!35436 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88673 (Cons!14921 (select (arr!21055 a!3170) #b00000000000000000000000000000000) Nil!14922) Nil!14922)))))

(declare-fun b!809311 () Bool)

(declare-fun e!448084 () Bool)

(assert (=> b!809311 (= e!448084 call!35436)))

(declare-fun d!104093 () Bool)

(declare-fun res!552790 () Bool)

(declare-fun e!448087 () Bool)

(assert (=> d!104093 (=> res!552790 e!448087)))

(assert (=> d!104093 (= res!552790 (bvsge #b00000000000000000000000000000000 (size!21475 a!3170)))))

(assert (=> d!104093 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14922) e!448087)))

(declare-fun b!809312 () Bool)

(declare-fun e!448085 () Bool)

(assert (=> b!809312 (= e!448087 e!448085)))

(declare-fun res!552792 () Bool)

(assert (=> b!809312 (=> (not res!552792) (not e!448085))))

(declare-fun e!448086 () Bool)

(assert (=> b!809312 (= res!552792 (not e!448086))))

(declare-fun res!552791 () Bool)

(assert (=> b!809312 (=> (not res!552791) (not e!448086))))

(assert (=> b!809312 (= res!552791 (validKeyInArray!0 (select (arr!21055 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809313 () Bool)

(assert (=> b!809313 (= e!448085 e!448084)))

(assert (=> b!809313 (= c!88673 (validKeyInArray!0 (select (arr!21055 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809314 () Bool)

(assert (=> b!809314 (= e!448084 call!35436)))

(declare-fun b!809315 () Bool)

(declare-fun contains!4103 (List!14925 (_ BitVec 64)) Bool)

(assert (=> b!809315 (= e!448086 (contains!4103 Nil!14922 (select (arr!21055 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!104093 (not res!552790)) b!809312))

(assert (= (and b!809312 res!552791) b!809315))

(assert (= (and b!809312 res!552792) b!809313))

(assert (= (and b!809313 c!88673) b!809311))

(assert (= (and b!809313 (not c!88673)) b!809314))

(assert (= (or b!809311 b!809314) bm!35433))

(assert (=> bm!35433 m!751753))

(declare-fun m!751825 () Bool)

(assert (=> bm!35433 m!751825))

(assert (=> b!809312 m!751753))

(assert (=> b!809312 m!751753))

(assert (=> b!809312 m!751763))

(assert (=> b!809313 m!751753))

(assert (=> b!809313 m!751753))

(assert (=> b!809313 m!751763))

(assert (=> b!809315 m!751753))

(assert (=> b!809315 m!751753))

(declare-fun m!751837 () Bool)

(assert (=> b!809315 m!751837))

(assert (=> b!809123 d!104093))

(declare-fun b!809326 () Bool)

(declare-fun e!448096 () SeekEntryResult!8602)

(assert (=> b!809326 (= e!448096 (MissingVacant!8602 vacantBefore!23))))

(declare-fun b!809327 () Bool)

(declare-fun e!448094 () SeekEntryResult!8602)

(declare-fun e!448095 () SeekEntryResult!8602)

(assert (=> b!809327 (= e!448094 e!448095)))

(declare-fun lt!362611 () (_ BitVec 64))

(declare-fun c!88680 () Bool)

(assert (=> b!809327 (= c!88680 (= lt!362611 (select (arr!21055 a!3170) j!153)))))

(declare-fun b!809329 () Bool)

(assert (=> b!809329 (= e!448095 (Found!8602 index!1236))))

(declare-fun b!809330 () Bool)

(assert (=> b!809330 (= e!448096 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!21055 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809331 () Bool)

(declare-fun c!88681 () Bool)

(assert (=> b!809331 (= c!88681 (= lt!362611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809331 (= e!448095 e!448096)))

(declare-fun lt!362610 () SeekEntryResult!8602)

(declare-fun d!104099 () Bool)

(assert (=> d!104099 (and (or ((_ is Undefined!8602) lt!362610) (not ((_ is Found!8602) lt!362610)) (and (bvsge (index!36777 lt!362610) #b00000000000000000000000000000000) (bvslt (index!36777 lt!362610) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362610) ((_ is Found!8602) lt!362610) (not ((_ is MissingVacant!8602) lt!362610)) (not (= (index!36779 lt!362610) vacantBefore!23)) (and (bvsge (index!36779 lt!362610) #b00000000000000000000000000000000) (bvslt (index!36779 lt!362610) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362610) (ite ((_ is Found!8602) lt!362610) (= (select (arr!21055 a!3170) (index!36777 lt!362610)) (select (arr!21055 a!3170) j!153)) (and ((_ is MissingVacant!8602) lt!362610) (= (index!36779 lt!362610) vacantBefore!23) (= (select (arr!21055 a!3170) (index!36779 lt!362610)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104099 (= lt!362610 e!448094)))

(declare-fun c!88682 () Bool)

(assert (=> d!104099 (= c!88682 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104099 (= lt!362611 (select (arr!21055 a!3170) index!1236))))

(assert (=> d!104099 (validMask!0 mask!3266)))

(assert (=> d!104099 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21055 a!3170) j!153) a!3170 mask!3266) lt!362610)))

(declare-fun b!809328 () Bool)

(assert (=> b!809328 (= e!448094 Undefined!8602)))

(assert (= (and d!104099 c!88682) b!809328))

(assert (= (and d!104099 (not c!88682)) b!809327))

(assert (= (and b!809327 c!88680) b!809329))

(assert (= (and b!809327 (not c!88680)) b!809331))

(assert (= (and b!809331 c!88681) b!809326))

(assert (= (and b!809331 (not c!88681)) b!809330))

(assert (=> b!809330 m!751797))

(assert (=> b!809330 m!751797))

(assert (=> b!809330 m!751645))

(declare-fun m!751839 () Bool)

(assert (=> b!809330 m!751839))

(declare-fun m!751841 () Bool)

(assert (=> d!104099 m!751841))

(declare-fun m!751843 () Bool)

(assert (=> d!104099 m!751843))

(assert (=> d!104099 m!751667))

(assert (=> d!104099 m!751673))

(assert (=> b!809121 d!104099))

(declare-fun b!809332 () Bool)

(declare-fun c!88683 () Bool)

(declare-fun lt!362613 () (_ BitVec 64))

(assert (=> b!809332 (= c!88683 (= lt!362613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448099 () SeekEntryResult!8602)

(declare-fun e!448098 () SeekEntryResult!8602)

(assert (=> b!809332 (= e!448099 e!448098)))

(declare-fun b!809333 () Bool)

(declare-fun lt!362614 () SeekEntryResult!8602)

(assert (=> b!809333 (= e!448098 (MissingZero!8602 (index!36778 lt!362614)))))

(declare-fun d!104103 () Bool)

(declare-fun lt!362612 () SeekEntryResult!8602)

(assert (=> d!104103 (and (or ((_ is Undefined!8602) lt!362612) (not ((_ is Found!8602) lt!362612)) (and (bvsge (index!36777 lt!362612) #b00000000000000000000000000000000) (bvslt (index!36777 lt!362612) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362612) ((_ is Found!8602) lt!362612) (not ((_ is MissingZero!8602) lt!362612)) (and (bvsge (index!36776 lt!362612) #b00000000000000000000000000000000) (bvslt (index!36776 lt!362612) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362612) ((_ is Found!8602) lt!362612) ((_ is MissingZero!8602) lt!362612) (not ((_ is MissingVacant!8602) lt!362612)) (and (bvsge (index!36779 lt!362612) #b00000000000000000000000000000000) (bvslt (index!36779 lt!362612) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362612) (ite ((_ is Found!8602) lt!362612) (= (select (arr!21055 a!3170) (index!36777 lt!362612)) (select (arr!21055 a!3170) j!153)) (ite ((_ is MissingZero!8602) lt!362612) (= (select (arr!21055 a!3170) (index!36776 lt!362612)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8602) lt!362612) (= (select (arr!21055 a!3170) (index!36779 lt!362612)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448097 () SeekEntryResult!8602)

(assert (=> d!104103 (= lt!362612 e!448097)))

(declare-fun c!88684 () Bool)

(assert (=> d!104103 (= c!88684 (and ((_ is Intermediate!8602) lt!362614) (undefined!9414 lt!362614)))))

(assert (=> d!104103 (= lt!362614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21055 a!3170) j!153) mask!3266) (select (arr!21055 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104103 (validMask!0 mask!3266)))

(assert (=> d!104103 (= (seekEntryOrOpen!0 (select (arr!21055 a!3170) j!153) a!3170 mask!3266) lt!362612)))

(declare-fun b!809334 () Bool)

(assert (=> b!809334 (= e!448098 (seekKeyOrZeroReturnVacant!0 (x!67740 lt!362614) (index!36778 lt!362614) (index!36778 lt!362614) (select (arr!21055 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809335 () Bool)

(assert (=> b!809335 (= e!448097 e!448099)))

(assert (=> b!809335 (= lt!362613 (select (arr!21055 a!3170) (index!36778 lt!362614)))))

(declare-fun c!88685 () Bool)

(assert (=> b!809335 (= c!88685 (= lt!362613 (select (arr!21055 a!3170) j!153)))))

(declare-fun b!809336 () Bool)

(assert (=> b!809336 (= e!448097 Undefined!8602)))

(declare-fun b!809337 () Bool)

(assert (=> b!809337 (= e!448099 (Found!8602 (index!36778 lt!362614)))))

(assert (= (and d!104103 c!88684) b!809336))

(assert (= (and d!104103 (not c!88684)) b!809335))

(assert (= (and b!809335 c!88685) b!809337))

(assert (= (and b!809335 (not c!88685)) b!809332))

(assert (= (and b!809332 c!88683) b!809333))

(assert (= (and b!809332 (not c!88683)) b!809334))

(declare-fun m!751845 () Bool)

(assert (=> d!104103 m!751845))

(assert (=> d!104103 m!751645))

(declare-fun m!751847 () Bool)

(assert (=> d!104103 m!751847))

(assert (=> d!104103 m!751673))

(assert (=> d!104103 m!751847))

(assert (=> d!104103 m!751645))

(declare-fun m!751849 () Bool)

(assert (=> d!104103 m!751849))

(declare-fun m!751851 () Bool)

(assert (=> d!104103 m!751851))

(declare-fun m!751853 () Bool)

(assert (=> d!104103 m!751853))

(assert (=> b!809334 m!751645))

(declare-fun m!751855 () Bool)

(assert (=> b!809334 m!751855))

(declare-fun m!751857 () Bool)

(assert (=> b!809335 m!751857))

(assert (=> b!809121 d!104103))

(declare-fun d!104105 () Bool)

(declare-fun res!552797 () Bool)

(declare-fun e!448107 () Bool)

(assert (=> d!104105 (=> res!552797 e!448107)))

(assert (=> d!104105 (= res!552797 (= (select (arr!21055 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!104105 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448107)))

(declare-fun b!809348 () Bool)

(declare-fun e!448108 () Bool)

(assert (=> b!809348 (= e!448107 e!448108)))

(declare-fun res!552798 () Bool)

(assert (=> b!809348 (=> (not res!552798) (not e!448108))))

(assert (=> b!809348 (= res!552798 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21475 a!3170)))))

(declare-fun b!809349 () Bool)

(assert (=> b!809349 (= e!448108 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104105 (not res!552797)) b!809348))

(assert (= (and b!809348 res!552798) b!809349))

(assert (=> d!104105 m!751753))

(declare-fun m!751869 () Bool)

(assert (=> b!809349 m!751869))

(assert (=> b!809122 d!104105))

(declare-fun b!809350 () Bool)

(declare-fun c!88689 () Bool)

(declare-fun lt!362619 () (_ BitVec 64))

(assert (=> b!809350 (= c!88689 (= lt!362619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448111 () SeekEntryResult!8602)

(declare-fun e!448110 () SeekEntryResult!8602)

(assert (=> b!809350 (= e!448111 e!448110)))

(declare-fun b!809351 () Bool)

(declare-fun lt!362620 () SeekEntryResult!8602)

(assert (=> b!809351 (= e!448110 (MissingZero!8602 (index!36778 lt!362620)))))

(declare-fun d!104107 () Bool)

(declare-fun lt!362618 () SeekEntryResult!8602)

(assert (=> d!104107 (and (or ((_ is Undefined!8602) lt!362618) (not ((_ is Found!8602) lt!362618)) (and (bvsge (index!36777 lt!362618) #b00000000000000000000000000000000) (bvslt (index!36777 lt!362618) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362618) ((_ is Found!8602) lt!362618) (not ((_ is MissingZero!8602) lt!362618)) (and (bvsge (index!36776 lt!362618) #b00000000000000000000000000000000) (bvslt (index!36776 lt!362618) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362618) ((_ is Found!8602) lt!362618) ((_ is MissingZero!8602) lt!362618) (not ((_ is MissingVacant!8602) lt!362618)) (and (bvsge (index!36779 lt!362618) #b00000000000000000000000000000000) (bvslt (index!36779 lt!362618) (size!21475 a!3170)))) (or ((_ is Undefined!8602) lt!362618) (ite ((_ is Found!8602) lt!362618) (= (select (arr!21055 a!3170) (index!36777 lt!362618)) k0!2044) (ite ((_ is MissingZero!8602) lt!362618) (= (select (arr!21055 a!3170) (index!36776 lt!362618)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8602) lt!362618) (= (select (arr!21055 a!3170) (index!36779 lt!362618)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448109 () SeekEntryResult!8602)

(assert (=> d!104107 (= lt!362618 e!448109)))

(declare-fun c!88690 () Bool)

(assert (=> d!104107 (= c!88690 (and ((_ is Intermediate!8602) lt!362620) (undefined!9414 lt!362620)))))

(assert (=> d!104107 (= lt!362620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!104107 (validMask!0 mask!3266)))

(assert (=> d!104107 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362618)))

(declare-fun b!809352 () Bool)

(assert (=> b!809352 (= e!448110 (seekKeyOrZeroReturnVacant!0 (x!67740 lt!362620) (index!36778 lt!362620) (index!36778 lt!362620) k0!2044 a!3170 mask!3266))))

(declare-fun b!809353 () Bool)

(assert (=> b!809353 (= e!448109 e!448111)))

(assert (=> b!809353 (= lt!362619 (select (arr!21055 a!3170) (index!36778 lt!362620)))))

(declare-fun c!88691 () Bool)

(assert (=> b!809353 (= c!88691 (= lt!362619 k0!2044))))

(declare-fun b!809354 () Bool)

(assert (=> b!809354 (= e!448109 Undefined!8602)))

(declare-fun b!809355 () Bool)

(assert (=> b!809355 (= e!448111 (Found!8602 (index!36778 lt!362620)))))

(assert (= (and d!104107 c!88690) b!809354))

(assert (= (and d!104107 (not c!88690)) b!809353))

(assert (= (and b!809353 c!88691) b!809355))

(assert (= (and b!809353 (not c!88691)) b!809350))

(assert (= (and b!809350 c!88689) b!809351))

(assert (= (and b!809350 (not c!88689)) b!809352))

(declare-fun m!751875 () Bool)

(assert (=> d!104107 m!751875))

(declare-fun m!751877 () Bool)

(assert (=> d!104107 m!751877))

(assert (=> d!104107 m!751673))

(assert (=> d!104107 m!751877))

(declare-fun m!751879 () Bool)

(assert (=> d!104107 m!751879))

(declare-fun m!751881 () Bool)

(assert (=> d!104107 m!751881))

(declare-fun m!751883 () Bool)

(assert (=> d!104107 m!751883))

(declare-fun m!751885 () Bool)

(assert (=> b!809352 m!751885))

(declare-fun m!751887 () Bool)

(assert (=> b!809353 m!751887))

(assert (=> b!809127 d!104107))

(check-sat (not b!809315) (not bm!35433) (not d!104099) (not b!809247) (not d!104071) (not b!809330) (not b!809273) (not b!809352) (not d!104103) (not b!809202) (not b!809312) (not d!104075) (not d!104107) (not d!104085) (not bm!35427) (not b!809205) (not b!809349) (not b!809313) (not b!809334))
(check-sat)
