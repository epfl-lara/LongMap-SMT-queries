; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64962 () Bool)

(assert start!64962)

(declare-fun b!732552 () Bool)

(declare-fun res!492024 () Bool)

(declare-fun e!409982 () Bool)

(assert (=> b!732552 (=> (not res!492024) (not e!409982))))

(declare-datatypes ((array!41212 0))(
  ( (array!41213 (arr!19720 (Array (_ BitVec 32) (_ BitVec 64))) (size!20140 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41212)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732552 (= res!492024 (validKeyInArray!0 (select (arr!19720 a!3186) j!159)))))

(declare-fun b!732553 () Bool)

(declare-fun res!492022 () Bool)

(declare-fun e!409978 () Bool)

(assert (=> b!732553 (=> res!492022 e!409978)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7276 0))(
  ( (MissingZero!7276 (index!31472 (_ BitVec 32))) (Found!7276 (index!31473 (_ BitVec 32))) (Intermediate!7276 (undefined!8088 Bool) (index!31474 (_ BitVec 32)) (x!62618 (_ BitVec 32))) (Undefined!7276) (MissingVacant!7276 (index!31475 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41212 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!732553 (= res!492022 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) (Found!7276 j!159))))))

(declare-fun b!732554 () Bool)

(declare-fun res!492020 () Bool)

(declare-fun e!409981 () Bool)

(assert (=> b!732554 (=> (not res!492020) (not e!409981))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732554 (= res!492020 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20140 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20140 a!3186))))))

(declare-fun e!409984 () Bool)

(declare-fun b!732555 () Bool)

(declare-fun lt!324614 () SeekEntryResult!7276)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41212 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!732555 (= e!409984 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324614))))

(declare-fun b!732556 () Bool)

(declare-fun res!492014 () Bool)

(assert (=> b!732556 (=> (not res!492014) (not e!409981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41212 (_ BitVec 32)) Bool)

(assert (=> b!732556 (= res!492014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732557 () Bool)

(declare-fun e!409985 () Bool)

(declare-fun e!409979 () Bool)

(assert (=> b!732557 (= e!409985 e!409979)))

(declare-fun res!492025 () Bool)

(assert (=> b!732557 (=> (not res!492025) (not e!409979))))

(declare-fun lt!324618 () SeekEntryResult!7276)

(declare-fun lt!324620 () SeekEntryResult!7276)

(assert (=> b!732557 (= res!492025 (= lt!324618 lt!324620))))

(declare-fun lt!324617 () array!41212)

(declare-fun lt!324615 () (_ BitVec 64))

(assert (=> b!732557 (= lt!324620 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324615 lt!324617 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732557 (= lt!324618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324615 mask!3328) lt!324615 lt!324617 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!732557 (= lt!324615 (select (store (arr!19720 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732557 (= lt!324617 (array!41213 (store (arr!19720 a!3186) i!1173 k0!2102) (size!20140 a!3186)))))

(declare-fun b!732558 () Bool)

(declare-fun e!409977 () Bool)

(assert (=> b!732558 (= e!409977 e!409978)))

(declare-fun res!492019 () Bool)

(assert (=> b!732558 (=> res!492019 e!409978)))

(assert (=> b!732558 (= res!492019 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324621 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732558 (= lt!324621 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!732559 () Bool)

(declare-fun res!492018 () Bool)

(assert (=> b!732559 (=> (not res!492018) (not e!409982))))

(assert (=> b!732559 (= res!492018 (validKeyInArray!0 k0!2102))))

(declare-fun b!732560 () Bool)

(assert (=> b!732560 (= e!409981 e!409985)))

(declare-fun res!492031 () Bool)

(assert (=> b!732560 (=> (not res!492031) (not e!409985))))

(assert (=> b!732560 (= res!492031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324614))))

(assert (=> b!732560 (= lt!324614 (Intermediate!7276 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732561 () Bool)

(declare-fun res!492017 () Bool)

(assert (=> b!732561 (=> (not res!492017) (not e!409981))))

(declare-datatypes ((List!13629 0))(
  ( (Nil!13626) (Cons!13625 (h!14694 (_ BitVec 64)) (t!19936 List!13629)) )
))
(declare-fun arrayNoDuplicates!0 (array!41212 (_ BitVec 32) List!13629) Bool)

(assert (=> b!732561 (= res!492017 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13626))))

(declare-fun b!732562 () Bool)

(declare-fun e!409986 () Bool)

(declare-fun lt!324616 () SeekEntryResult!7276)

(assert (=> b!732562 (= e!409986 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324616))))

(declare-fun b!732563 () Bool)

(declare-fun res!492027 () Bool)

(assert (=> b!732563 (=> (not res!492027) (not e!409982))))

(assert (=> b!732563 (= res!492027 (and (= (size!20140 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20140 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20140 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732564 () Bool)

(assert (=> b!732564 (= e!409982 e!409981)))

(declare-fun res!492030 () Bool)

(assert (=> b!732564 (=> (not res!492030) (not e!409981))))

(declare-fun lt!324613 () SeekEntryResult!7276)

(assert (=> b!732564 (= res!492030 (or (= lt!324613 (MissingZero!7276 i!1173)) (= lt!324613 (MissingVacant!7276 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41212 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!732564 (= lt!324613 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732565 () Bool)

(declare-fun res!492026 () Bool)

(assert (=> b!732565 (=> (not res!492026) (not e!409985))))

(assert (=> b!732565 (= res!492026 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19720 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732566 () Bool)

(assert (=> b!732566 (= e!409979 (not e!409977))))

(declare-fun res!492015 () Bool)

(assert (=> b!732566 (=> res!492015 e!409977)))

(get-info :version)

(assert (=> b!732566 (= res!492015 (or (not ((_ is Intermediate!7276) lt!324620)) (bvsge x!1131 (x!62618 lt!324620))))))

(declare-fun e!409980 () Bool)

(assert (=> b!732566 e!409980))

(declare-fun res!492021 () Bool)

(assert (=> b!732566 (=> (not res!492021) (not e!409980))))

(assert (=> b!732566 (= res!492021 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24949 0))(
  ( (Unit!24950) )
))
(declare-fun lt!324619 () Unit!24949)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24949)

(assert (=> b!732566 (= lt!324619 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732567 () Bool)

(declare-fun res!492028 () Bool)

(assert (=> b!732567 (=> (not res!492028) (not e!409982))))

(declare-fun arrayContainsKey!0 (array!41212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732567 (= res!492028 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732568 () Bool)

(assert (=> b!732568 (= e!409984 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) (Found!7276 j!159)))))

(declare-fun b!732569 () Bool)

(assert (=> b!732569 (= e!409978 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324621 #b00000000000000000000000000000000) (bvsge lt!324621 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun b!732570 () Bool)

(assert (=> b!732570 (= e!409980 e!409986)))

(declare-fun res!492029 () Bool)

(assert (=> b!732570 (=> (not res!492029) (not e!409986))))

(assert (=> b!732570 (= res!492029 (= (seekEntryOrOpen!0 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324616))))

(assert (=> b!732570 (= lt!324616 (Found!7276 j!159))))

(declare-fun res!492016 () Bool)

(assert (=> start!64962 (=> (not res!492016) (not e!409982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64962 (= res!492016 (validMask!0 mask!3328))))

(assert (=> start!64962 e!409982))

(assert (=> start!64962 true))

(declare-fun array_inv!15579 (array!41212) Bool)

(assert (=> start!64962 (array_inv!15579 a!3186)))

(declare-fun b!732571 () Bool)

(declare-fun res!492023 () Bool)

(assert (=> b!732571 (=> (not res!492023) (not e!409985))))

(assert (=> b!732571 (= res!492023 e!409984)))

(declare-fun c!80648 () Bool)

(assert (=> b!732571 (= c!80648 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64962 res!492016) b!732563))

(assert (= (and b!732563 res!492027) b!732552))

(assert (= (and b!732552 res!492024) b!732559))

(assert (= (and b!732559 res!492018) b!732567))

(assert (= (and b!732567 res!492028) b!732564))

(assert (= (and b!732564 res!492030) b!732556))

(assert (= (and b!732556 res!492014) b!732561))

(assert (= (and b!732561 res!492017) b!732554))

(assert (= (and b!732554 res!492020) b!732560))

(assert (= (and b!732560 res!492031) b!732565))

(assert (= (and b!732565 res!492026) b!732571))

(assert (= (and b!732571 c!80648) b!732555))

(assert (= (and b!732571 (not c!80648)) b!732568))

(assert (= (and b!732571 res!492023) b!732557))

(assert (= (and b!732557 res!492025) b!732566))

(assert (= (and b!732566 res!492021) b!732570))

(assert (= (and b!732570 res!492029) b!732562))

(assert (= (and b!732566 (not res!492015)) b!732558))

(assert (= (and b!732558 (not res!492019)) b!732553))

(assert (= (and b!732553 (not res!492022)) b!732569))

(declare-fun m!686187 () Bool)

(assert (=> b!732570 m!686187))

(assert (=> b!732570 m!686187))

(declare-fun m!686189 () Bool)

(assert (=> b!732570 m!686189))

(assert (=> b!732562 m!686187))

(assert (=> b!732562 m!686187))

(declare-fun m!686191 () Bool)

(assert (=> b!732562 m!686191))

(declare-fun m!686193 () Bool)

(assert (=> b!732559 m!686193))

(assert (=> b!732552 m!686187))

(assert (=> b!732552 m!686187))

(declare-fun m!686195 () Bool)

(assert (=> b!732552 m!686195))

(declare-fun m!686197 () Bool)

(assert (=> b!732566 m!686197))

(declare-fun m!686199 () Bool)

(assert (=> b!732566 m!686199))

(declare-fun m!686201 () Bool)

(assert (=> b!732556 m!686201))

(declare-fun m!686203 () Bool)

(assert (=> start!64962 m!686203))

(declare-fun m!686205 () Bool)

(assert (=> start!64962 m!686205))

(assert (=> b!732553 m!686187))

(assert (=> b!732553 m!686187))

(declare-fun m!686207 () Bool)

(assert (=> b!732553 m!686207))

(declare-fun m!686209 () Bool)

(assert (=> b!732557 m!686209))

(declare-fun m!686211 () Bool)

(assert (=> b!732557 m!686211))

(declare-fun m!686213 () Bool)

(assert (=> b!732557 m!686213))

(declare-fun m!686215 () Bool)

(assert (=> b!732557 m!686215))

(declare-fun m!686217 () Bool)

(assert (=> b!732557 m!686217))

(assert (=> b!732557 m!686209))

(assert (=> b!732555 m!686187))

(assert (=> b!732555 m!686187))

(declare-fun m!686219 () Bool)

(assert (=> b!732555 m!686219))

(declare-fun m!686221 () Bool)

(assert (=> b!732558 m!686221))

(declare-fun m!686223 () Bool)

(assert (=> b!732565 m!686223))

(declare-fun m!686225 () Bool)

(assert (=> b!732567 m!686225))

(assert (=> b!732568 m!686187))

(assert (=> b!732568 m!686187))

(assert (=> b!732568 m!686207))

(declare-fun m!686227 () Bool)

(assert (=> b!732564 m!686227))

(declare-fun m!686229 () Bool)

(assert (=> b!732561 m!686229))

(assert (=> b!732560 m!686187))

(assert (=> b!732560 m!686187))

(declare-fun m!686231 () Bool)

(assert (=> b!732560 m!686231))

(assert (=> b!732560 m!686231))

(assert (=> b!732560 m!686187))

(declare-fun m!686233 () Bool)

(assert (=> b!732560 m!686233))

(check-sat (not b!732555) (not b!732564) (not start!64962) (not b!732553) (not b!732558) (not b!732567) (not b!732559) (not b!732561) (not b!732557) (not b!732560) (not b!732552) (not b!732562) (not b!732570) (not b!732566) (not b!732568) (not b!732556))
(check-sat)
(get-model)

(declare-fun b!732704 () Bool)

(declare-fun e!410055 () SeekEntryResult!7276)

(assert (=> b!732704 (= e!410055 (Found!7276 resIntermediateIndex!5))))

(declare-fun b!732705 () Bool)

(declare-fun e!410053 () SeekEntryResult!7276)

(assert (=> b!732705 (= e!410053 e!410055)))

(declare-fun c!80662 () Bool)

(declare-fun lt!324681 () (_ BitVec 64))

(assert (=> b!732705 (= c!80662 (= lt!324681 (select (arr!19720 a!3186) j!159)))))

(declare-fun b!732706 () Bool)

(declare-fun e!410054 () SeekEntryResult!7276)

(assert (=> b!732706 (= e!410054 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100039 () Bool)

(declare-fun lt!324680 () SeekEntryResult!7276)

(assert (=> d!100039 (and (or ((_ is Undefined!7276) lt!324680) (not ((_ is Found!7276) lt!324680)) (and (bvsge (index!31473 lt!324680) #b00000000000000000000000000000000) (bvslt (index!31473 lt!324680) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324680) ((_ is Found!7276) lt!324680) (not ((_ is MissingVacant!7276) lt!324680)) (not (= (index!31475 lt!324680) resIntermediateIndex!5)) (and (bvsge (index!31475 lt!324680) #b00000000000000000000000000000000) (bvslt (index!31475 lt!324680) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324680) (ite ((_ is Found!7276) lt!324680) (= (select (arr!19720 a!3186) (index!31473 lt!324680)) (select (arr!19720 a!3186) j!159)) (and ((_ is MissingVacant!7276) lt!324680) (= (index!31475 lt!324680) resIntermediateIndex!5) (= (select (arr!19720 a!3186) (index!31475 lt!324680)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100039 (= lt!324680 e!410053)))

(declare-fun c!80663 () Bool)

(assert (=> d!100039 (= c!80663 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100039 (= lt!324681 (select (arr!19720 a!3186) resIntermediateIndex!5))))

(assert (=> d!100039 (validMask!0 mask!3328)))

(assert (=> d!100039 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324680)))

(declare-fun b!732707 () Bool)

(declare-fun c!80661 () Bool)

(assert (=> b!732707 (= c!80661 (= lt!324681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732707 (= e!410055 e!410054)))

(declare-fun b!732708 () Bool)

(assert (=> b!732708 (= e!410053 Undefined!7276)))

(declare-fun b!732709 () Bool)

(assert (=> b!732709 (= e!410054 (MissingVacant!7276 resIntermediateIndex!5))))

(assert (= (and d!100039 c!80663) b!732708))

(assert (= (and d!100039 (not c!80663)) b!732705))

(assert (= (and b!732705 c!80662) b!732704))

(assert (= (and b!732705 (not c!80662)) b!732707))

(assert (= (and b!732707 c!80661) b!732709))

(assert (= (and b!732707 (not c!80661)) b!732706))

(declare-fun m!686331 () Bool)

(assert (=> b!732706 m!686331))

(assert (=> b!732706 m!686331))

(assert (=> b!732706 m!686187))

(declare-fun m!686333 () Bool)

(assert (=> b!732706 m!686333))

(declare-fun m!686335 () Bool)

(assert (=> d!100039 m!686335))

(declare-fun m!686337 () Bool)

(assert (=> d!100039 m!686337))

(assert (=> d!100039 m!686223))

(assert (=> d!100039 m!686203))

(assert (=> b!732562 d!100039))

(declare-fun d!100041 () Bool)

(declare-fun e!410066 () Bool)

(assert (=> d!100041 e!410066))

(declare-fun c!80670 () Bool)

(declare-fun lt!324687 () SeekEntryResult!7276)

(assert (=> d!100041 (= c!80670 (and ((_ is Intermediate!7276) lt!324687) (undefined!8088 lt!324687)))))

(declare-fun e!410069 () SeekEntryResult!7276)

(assert (=> d!100041 (= lt!324687 e!410069)))

(declare-fun c!80671 () Bool)

(assert (=> d!100041 (= c!80671 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324686 () (_ BitVec 64))

(assert (=> d!100041 (= lt!324686 (select (arr!19720 a!3186) (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328)))))

(assert (=> d!100041 (validMask!0 mask!3328)))

(assert (=> d!100041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324687)))

(declare-fun b!732728 () Bool)

(assert (=> b!732728 (= e!410066 (bvsge (x!62618 lt!324687) #b01111111111111111111111111111110))))

(declare-fun b!732729 () Bool)

(assert (=> b!732729 (and (bvsge (index!31474 lt!324687) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324687) (size!20140 a!3186)))))

(declare-fun res!492147 () Bool)

(assert (=> b!732729 (= res!492147 (= (select (arr!19720 a!3186) (index!31474 lt!324687)) (select (arr!19720 a!3186) j!159)))))

(declare-fun e!410068 () Bool)

(assert (=> b!732729 (=> res!492147 e!410068)))

(declare-fun e!410070 () Bool)

(assert (=> b!732729 (= e!410070 e!410068)))

(declare-fun b!732730 () Bool)

(declare-fun e!410067 () SeekEntryResult!7276)

(assert (=> b!732730 (= e!410067 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!19720 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732731 () Bool)

(assert (=> b!732731 (= e!410066 e!410070)))

(declare-fun res!492148 () Bool)

(assert (=> b!732731 (= res!492148 (and ((_ is Intermediate!7276) lt!324687) (not (undefined!8088 lt!324687)) (bvslt (x!62618 lt!324687) #b01111111111111111111111111111110) (bvsge (x!62618 lt!324687) #b00000000000000000000000000000000) (bvsge (x!62618 lt!324687) #b00000000000000000000000000000000)))))

(assert (=> b!732731 (=> (not res!492148) (not e!410070))))

(declare-fun b!732732 () Bool)

(assert (=> b!732732 (= e!410069 (Intermediate!7276 true (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732733 () Bool)

(assert (=> b!732733 (and (bvsge (index!31474 lt!324687) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324687) (size!20140 a!3186)))))

(declare-fun res!492146 () Bool)

(assert (=> b!732733 (= res!492146 (= (select (arr!19720 a!3186) (index!31474 lt!324687)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732733 (=> res!492146 e!410068)))

(declare-fun b!732734 () Bool)

(assert (=> b!732734 (= e!410067 (Intermediate!7276 false (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732735 () Bool)

(assert (=> b!732735 (= e!410069 e!410067)))

(declare-fun c!80672 () Bool)

(assert (=> b!732735 (= c!80672 (or (= lt!324686 (select (arr!19720 a!3186) j!159)) (= (bvadd lt!324686 lt!324686) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732736 () Bool)

(assert (=> b!732736 (and (bvsge (index!31474 lt!324687) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324687) (size!20140 a!3186)))))

(assert (=> b!732736 (= e!410068 (= (select (arr!19720 a!3186) (index!31474 lt!324687)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100041 c!80671) b!732732))

(assert (= (and d!100041 (not c!80671)) b!732735))

(assert (= (and b!732735 c!80672) b!732734))

(assert (= (and b!732735 (not c!80672)) b!732730))

(assert (= (and d!100041 c!80670) b!732728))

(assert (= (and d!100041 (not c!80670)) b!732731))

(assert (= (and b!732731 res!492148) b!732729))

(assert (= (and b!732729 (not res!492147)) b!732733))

(assert (= (and b!732733 (not res!492146)) b!732736))

(assert (=> d!100041 m!686231))

(declare-fun m!686339 () Bool)

(assert (=> d!100041 m!686339))

(assert (=> d!100041 m!686203))

(declare-fun m!686341 () Bool)

(assert (=> b!732736 m!686341))

(assert (=> b!732730 m!686231))

(declare-fun m!686343 () Bool)

(assert (=> b!732730 m!686343))

(assert (=> b!732730 m!686343))

(assert (=> b!732730 m!686187))

(declare-fun m!686345 () Bool)

(assert (=> b!732730 m!686345))

(assert (=> b!732733 m!686341))

(assert (=> b!732729 m!686341))

(assert (=> b!732560 d!100041))

(declare-fun d!100045 () Bool)

(declare-fun lt!324699 () (_ BitVec 32))

(declare-fun lt!324698 () (_ BitVec 32))

(assert (=> d!100045 (= lt!324699 (bvmul (bvxor lt!324698 (bvlshr lt!324698 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100045 (= lt!324698 ((_ extract 31 0) (bvand (bvxor (select (arr!19720 a!3186) j!159) (bvlshr (select (arr!19720 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100045 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!492149 (let ((h!14697 ((_ extract 31 0) (bvand (bvxor (select (arr!19720 a!3186) j!159) (bvlshr (select (arr!19720 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62623 (bvmul (bvxor h!14697 (bvlshr h!14697 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62623 (bvlshr x!62623 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!492149 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!492149 #b00000000000000000000000000000000))))))

(assert (=> d!100045 (= (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) (bvand (bvxor lt!324699 (bvlshr lt!324699 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!732560 d!100045))

(declare-fun b!732759 () Bool)

(declare-fun e!410089 () Bool)

(declare-fun contains!4034 (List!13629 (_ BitVec 64)) Bool)

(assert (=> b!732759 (= e!410089 (contains!4034 Nil!13626 (select (arr!19720 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732760 () Bool)

(declare-fun e!410090 () Bool)

(declare-fun call!34884 () Bool)

(assert (=> b!732760 (= e!410090 call!34884)))

(declare-fun b!732761 () Bool)

(assert (=> b!732761 (= e!410090 call!34884)))

(declare-fun b!732762 () Bool)

(declare-fun e!410091 () Bool)

(assert (=> b!732762 (= e!410091 e!410090)))

(declare-fun c!80678 () Bool)

(assert (=> b!732762 (= c!80678 (validKeyInArray!0 (select (arr!19720 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100047 () Bool)

(declare-fun res!492163 () Bool)

(declare-fun e!410088 () Bool)

(assert (=> d!100047 (=> res!492163 e!410088)))

(assert (=> d!100047 (= res!492163 (bvsge #b00000000000000000000000000000000 (size!20140 a!3186)))))

(assert (=> d!100047 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13626) e!410088)))

(declare-fun bm!34881 () Bool)

(assert (=> bm!34881 (= call!34884 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80678 (Cons!13625 (select (arr!19720 a!3186) #b00000000000000000000000000000000) Nil!13626) Nil!13626)))))

(declare-fun b!732763 () Bool)

(assert (=> b!732763 (= e!410088 e!410091)))

(declare-fun res!492164 () Bool)

(assert (=> b!732763 (=> (not res!492164) (not e!410091))))

(assert (=> b!732763 (= res!492164 (not e!410089))))

(declare-fun res!492162 () Bool)

(assert (=> b!732763 (=> (not res!492162) (not e!410089))))

(assert (=> b!732763 (= res!492162 (validKeyInArray!0 (select (arr!19720 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100047 (not res!492163)) b!732763))

(assert (= (and b!732763 res!492162) b!732759))

(assert (= (and b!732763 res!492164) b!732762))

(assert (= (and b!732762 c!80678) b!732761))

(assert (= (and b!732762 (not c!80678)) b!732760))

(assert (= (or b!732761 b!732760) bm!34881))

(declare-fun m!686353 () Bool)

(assert (=> b!732759 m!686353))

(assert (=> b!732759 m!686353))

(declare-fun m!686355 () Bool)

(assert (=> b!732759 m!686355))

(assert (=> b!732762 m!686353))

(assert (=> b!732762 m!686353))

(declare-fun m!686357 () Bool)

(assert (=> b!732762 m!686357))

(assert (=> bm!34881 m!686353))

(declare-fun m!686359 () Bool)

(assert (=> bm!34881 m!686359))

(assert (=> b!732763 m!686353))

(assert (=> b!732763 m!686353))

(assert (=> b!732763 m!686357))

(assert (=> b!732561 d!100047))

(declare-fun b!732810 () Bool)

(declare-fun e!410117 () SeekEntryResult!7276)

(declare-fun e!410118 () SeekEntryResult!7276)

(assert (=> b!732810 (= e!410117 e!410118)))

(declare-fun lt!324728 () (_ BitVec 64))

(declare-fun lt!324729 () SeekEntryResult!7276)

(assert (=> b!732810 (= lt!324728 (select (arr!19720 a!3186) (index!31474 lt!324729)))))

(declare-fun c!80701 () Bool)

(assert (=> b!732810 (= c!80701 (= lt!324728 k0!2102))))

(declare-fun b!732811 () Bool)

(assert (=> b!732811 (= e!410117 Undefined!7276)))

(declare-fun b!732812 () Bool)

(declare-fun c!80702 () Bool)

(assert (=> b!732812 (= c!80702 (= lt!324728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410116 () SeekEntryResult!7276)

(assert (=> b!732812 (= e!410118 e!410116)))

(declare-fun b!732814 () Bool)

(assert (=> b!732814 (= e!410116 (seekKeyOrZeroReturnVacant!0 (x!62618 lt!324729) (index!31474 lt!324729) (index!31474 lt!324729) k0!2102 a!3186 mask!3328))))

(declare-fun b!732815 () Bool)

(assert (=> b!732815 (= e!410116 (MissingZero!7276 (index!31474 lt!324729)))))

(declare-fun b!732813 () Bool)

(assert (=> b!732813 (= e!410118 (Found!7276 (index!31474 lt!324729)))))

(declare-fun d!100053 () Bool)

(declare-fun lt!324727 () SeekEntryResult!7276)

(assert (=> d!100053 (and (or ((_ is Undefined!7276) lt!324727) (not ((_ is Found!7276) lt!324727)) (and (bvsge (index!31473 lt!324727) #b00000000000000000000000000000000) (bvslt (index!31473 lt!324727) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324727) ((_ is Found!7276) lt!324727) (not ((_ is MissingZero!7276) lt!324727)) (and (bvsge (index!31472 lt!324727) #b00000000000000000000000000000000) (bvslt (index!31472 lt!324727) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324727) ((_ is Found!7276) lt!324727) ((_ is MissingZero!7276) lt!324727) (not ((_ is MissingVacant!7276) lt!324727)) (and (bvsge (index!31475 lt!324727) #b00000000000000000000000000000000) (bvslt (index!31475 lt!324727) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324727) (ite ((_ is Found!7276) lt!324727) (= (select (arr!19720 a!3186) (index!31473 lt!324727)) k0!2102) (ite ((_ is MissingZero!7276) lt!324727) (= (select (arr!19720 a!3186) (index!31472 lt!324727)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7276) lt!324727) (= (select (arr!19720 a!3186) (index!31475 lt!324727)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100053 (= lt!324727 e!410117)))

(declare-fun c!80703 () Bool)

(assert (=> d!100053 (= c!80703 (and ((_ is Intermediate!7276) lt!324729) (undefined!8088 lt!324729)))))

(assert (=> d!100053 (= lt!324729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100053 (validMask!0 mask!3328)))

(assert (=> d!100053 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!324727)))

(assert (= (and d!100053 c!80703) b!732811))

(assert (= (and d!100053 (not c!80703)) b!732810))

(assert (= (and b!732810 c!80701) b!732813))

(assert (= (and b!732810 (not c!80701)) b!732812))

(assert (= (and b!732812 c!80702) b!732815))

(assert (= (and b!732812 (not c!80702)) b!732814))

(declare-fun m!686383 () Bool)

(assert (=> b!732810 m!686383))

(declare-fun m!686385 () Bool)

(assert (=> b!732814 m!686385))

(declare-fun m!686387 () Bool)

(assert (=> d!100053 m!686387))

(declare-fun m!686389 () Bool)

(assert (=> d!100053 m!686389))

(declare-fun m!686391 () Bool)

(assert (=> d!100053 m!686391))

(assert (=> d!100053 m!686387))

(declare-fun m!686393 () Bool)

(assert (=> d!100053 m!686393))

(assert (=> d!100053 m!686203))

(declare-fun m!686395 () Bool)

(assert (=> d!100053 m!686395))

(assert (=> b!732564 d!100053))

(declare-fun d!100061 () Bool)

(assert (=> d!100061 (= (validKeyInArray!0 (select (arr!19720 a!3186) j!159)) (and (not (= (select (arr!19720 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19720 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!732552 d!100061))

(declare-fun b!732822 () Bool)

(declare-fun e!410124 () SeekEntryResult!7276)

(assert (=> b!732822 (= e!410124 (Found!7276 index!1321))))

(declare-fun b!732823 () Bool)

(declare-fun e!410122 () SeekEntryResult!7276)

(assert (=> b!732823 (= e!410122 e!410124)))

(declare-fun lt!324734 () (_ BitVec 64))

(declare-fun c!80708 () Bool)

(assert (=> b!732823 (= c!80708 (= lt!324734 (select (arr!19720 a!3186) j!159)))))

(declare-fun b!732824 () Bool)

(declare-fun e!410123 () SeekEntryResult!7276)

(assert (=> b!732824 (= e!410123 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!324733 () SeekEntryResult!7276)

(declare-fun d!100063 () Bool)

(assert (=> d!100063 (and (or ((_ is Undefined!7276) lt!324733) (not ((_ is Found!7276) lt!324733)) (and (bvsge (index!31473 lt!324733) #b00000000000000000000000000000000) (bvslt (index!31473 lt!324733) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324733) ((_ is Found!7276) lt!324733) (not ((_ is MissingVacant!7276) lt!324733)) (not (= (index!31475 lt!324733) resIntermediateIndex!5)) (and (bvsge (index!31475 lt!324733) #b00000000000000000000000000000000) (bvslt (index!31475 lt!324733) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324733) (ite ((_ is Found!7276) lt!324733) (= (select (arr!19720 a!3186) (index!31473 lt!324733)) (select (arr!19720 a!3186) j!159)) (and ((_ is MissingVacant!7276) lt!324733) (= (index!31475 lt!324733) resIntermediateIndex!5) (= (select (arr!19720 a!3186) (index!31475 lt!324733)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100063 (= lt!324733 e!410122)))

(declare-fun c!80709 () Bool)

(assert (=> d!100063 (= c!80709 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100063 (= lt!324734 (select (arr!19720 a!3186) index!1321))))

(assert (=> d!100063 (validMask!0 mask!3328)))

(assert (=> d!100063 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324733)))

(declare-fun b!732825 () Bool)

(declare-fun c!80707 () Bool)

(assert (=> b!732825 (= c!80707 (= lt!324734 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732825 (= e!410124 e!410123)))

(declare-fun b!732826 () Bool)

(assert (=> b!732826 (= e!410122 Undefined!7276)))

(declare-fun b!732827 () Bool)

(assert (=> b!732827 (= e!410123 (MissingVacant!7276 resIntermediateIndex!5))))

(assert (= (and d!100063 c!80709) b!732826))

(assert (= (and d!100063 (not c!80709)) b!732823))

(assert (= (and b!732823 c!80708) b!732822))

(assert (= (and b!732823 (not c!80708)) b!732825))

(assert (= (and b!732825 c!80707) b!732827))

(assert (= (and b!732825 (not c!80707)) b!732824))

(declare-fun m!686411 () Bool)

(assert (=> b!732824 m!686411))

(assert (=> b!732824 m!686411))

(assert (=> b!732824 m!686187))

(declare-fun m!686413 () Bool)

(assert (=> b!732824 m!686413))

(declare-fun m!686415 () Bool)

(assert (=> d!100063 m!686415))

(declare-fun m!686417 () Bool)

(assert (=> d!100063 m!686417))

(declare-fun m!686419 () Bool)

(assert (=> d!100063 m!686419))

(assert (=> d!100063 m!686203))

(assert (=> b!732553 d!100063))

(declare-fun d!100067 () Bool)

(declare-fun res!492171 () Bool)

(declare-fun e!410129 () Bool)

(assert (=> d!100067 (=> res!492171 e!410129)))

(assert (=> d!100067 (= res!492171 (= (select (arr!19720 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100067 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!410129)))

(declare-fun b!732832 () Bool)

(declare-fun e!410130 () Bool)

(assert (=> b!732832 (= e!410129 e!410130)))

(declare-fun res!492172 () Bool)

(assert (=> b!732832 (=> (not res!492172) (not e!410130))))

(assert (=> b!732832 (= res!492172 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20140 a!3186)))))

(declare-fun b!732833 () Bool)

(assert (=> b!732833 (= e!410130 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100067 (not res!492171)) b!732832))

(assert (= (and b!732832 res!492172) b!732833))

(assert (=> d!100067 m!686353))

(declare-fun m!686421 () Bool)

(assert (=> b!732833 m!686421))

(assert (=> b!732567 d!100067))

(declare-fun bm!34885 () Bool)

(declare-fun call!34888 () Bool)

(assert (=> bm!34885 (= call!34888 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732881 () Bool)

(declare-fun e!410158 () Bool)

(declare-fun e!410159 () Bool)

(assert (=> b!732881 (= e!410158 e!410159)))

(declare-fun lt!324753 () (_ BitVec 64))

(assert (=> b!732881 (= lt!324753 (select (arr!19720 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!324751 () Unit!24949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41212 (_ BitVec 64) (_ BitVec 32)) Unit!24949)

(assert (=> b!732881 (= lt!324751 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324753 #b00000000000000000000000000000000))))

(assert (=> b!732881 (arrayContainsKey!0 a!3186 lt!324753 #b00000000000000000000000000000000)))

(declare-fun lt!324752 () Unit!24949)

(assert (=> b!732881 (= lt!324752 lt!324751)))

(declare-fun res!492188 () Bool)

(assert (=> b!732881 (= res!492188 (= (seekEntryOrOpen!0 (select (arr!19720 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7276 #b00000000000000000000000000000000)))))

(assert (=> b!732881 (=> (not res!492188) (not e!410159))))

(declare-fun b!732882 () Bool)

(assert (=> b!732882 (= e!410159 call!34888)))

(declare-fun b!732883 () Bool)

(assert (=> b!732883 (= e!410158 call!34888)))

(declare-fun d!100069 () Bool)

(declare-fun res!492187 () Bool)

(declare-fun e!410160 () Bool)

(assert (=> d!100069 (=> res!492187 e!410160)))

(assert (=> d!100069 (= res!492187 (bvsge #b00000000000000000000000000000000 (size!20140 a!3186)))))

(assert (=> d!100069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!410160)))

(declare-fun b!732884 () Bool)

(assert (=> b!732884 (= e!410160 e!410158)))

(declare-fun c!80727 () Bool)

(assert (=> b!732884 (= c!80727 (validKeyInArray!0 (select (arr!19720 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100069 (not res!492187)) b!732884))

(assert (= (and b!732884 c!80727) b!732881))

(assert (= (and b!732884 (not c!80727)) b!732883))

(assert (= (and b!732881 res!492188) b!732882))

(assert (= (or b!732882 b!732883) bm!34885))

(declare-fun m!686431 () Bool)

(assert (=> bm!34885 m!686431))

(assert (=> b!732881 m!686353))

(declare-fun m!686433 () Bool)

(assert (=> b!732881 m!686433))

(declare-fun m!686435 () Bool)

(assert (=> b!732881 m!686435))

(assert (=> b!732881 m!686353))

(declare-fun m!686437 () Bool)

(assert (=> b!732881 m!686437))

(assert (=> b!732884 m!686353))

(assert (=> b!732884 m!686353))

(assert (=> b!732884 m!686357))

(assert (=> b!732556 d!100069))

(declare-fun d!100073 () Bool)

(assert (=> d!100073 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64962 d!100073))

(declare-fun d!100083 () Bool)

(assert (=> d!100083 (= (array_inv!15579 a!3186) (bvsge (size!20140 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64962 d!100083))

(declare-fun d!100085 () Bool)

(declare-fun e!410178 () Bool)

(assert (=> d!100085 e!410178))

(declare-fun c!80733 () Bool)

(declare-fun lt!324766 () SeekEntryResult!7276)

(assert (=> d!100085 (= c!80733 (and ((_ is Intermediate!7276) lt!324766) (undefined!8088 lt!324766)))))

(declare-fun e!410181 () SeekEntryResult!7276)

(assert (=> d!100085 (= lt!324766 e!410181)))

(declare-fun c!80734 () Bool)

(assert (=> d!100085 (= c!80734 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324765 () (_ BitVec 64))

(assert (=> d!100085 (= lt!324765 (select (arr!19720 lt!324617) index!1321))))

(assert (=> d!100085 (validMask!0 mask!3328)))

(assert (=> d!100085 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324615 lt!324617 mask!3328) lt!324766)))

(declare-fun b!732907 () Bool)

(assert (=> b!732907 (= e!410178 (bvsge (x!62618 lt!324766) #b01111111111111111111111111111110))))

(declare-fun b!732908 () Bool)

(assert (=> b!732908 (and (bvsge (index!31474 lt!324766) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324766) (size!20140 lt!324617)))))

(declare-fun res!492202 () Bool)

(assert (=> b!732908 (= res!492202 (= (select (arr!19720 lt!324617) (index!31474 lt!324766)) lt!324615))))

(declare-fun e!410180 () Bool)

(assert (=> b!732908 (=> res!492202 e!410180)))

(declare-fun e!410182 () Bool)

(assert (=> b!732908 (= e!410182 e!410180)))

(declare-fun b!732909 () Bool)

(declare-fun e!410179 () SeekEntryResult!7276)

(assert (=> b!732909 (= e!410179 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!324615 lt!324617 mask!3328))))

(declare-fun b!732910 () Bool)

(assert (=> b!732910 (= e!410178 e!410182)))

(declare-fun res!492203 () Bool)

(assert (=> b!732910 (= res!492203 (and ((_ is Intermediate!7276) lt!324766) (not (undefined!8088 lt!324766)) (bvslt (x!62618 lt!324766) #b01111111111111111111111111111110) (bvsge (x!62618 lt!324766) #b00000000000000000000000000000000) (bvsge (x!62618 lt!324766) x!1131)))))

(assert (=> b!732910 (=> (not res!492203) (not e!410182))))

(declare-fun b!732911 () Bool)

(assert (=> b!732911 (= e!410181 (Intermediate!7276 true index!1321 x!1131))))

(declare-fun b!732912 () Bool)

(assert (=> b!732912 (and (bvsge (index!31474 lt!324766) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324766) (size!20140 lt!324617)))))

(declare-fun res!492201 () Bool)

(assert (=> b!732912 (= res!492201 (= (select (arr!19720 lt!324617) (index!31474 lt!324766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732912 (=> res!492201 e!410180)))

(declare-fun b!732913 () Bool)

(assert (=> b!732913 (= e!410179 (Intermediate!7276 false index!1321 x!1131))))

(declare-fun b!732914 () Bool)

(assert (=> b!732914 (= e!410181 e!410179)))

(declare-fun c!80735 () Bool)

(assert (=> b!732914 (= c!80735 (or (= lt!324765 lt!324615) (= (bvadd lt!324765 lt!324765) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732915 () Bool)

(assert (=> b!732915 (and (bvsge (index!31474 lt!324766) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324766) (size!20140 lt!324617)))))

(assert (=> b!732915 (= e!410180 (= (select (arr!19720 lt!324617) (index!31474 lt!324766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100085 c!80734) b!732911))

(assert (= (and d!100085 (not c!80734)) b!732914))

(assert (= (and b!732914 c!80735) b!732913))

(assert (= (and b!732914 (not c!80735)) b!732909))

(assert (= (and d!100085 c!80733) b!732907))

(assert (= (and d!100085 (not c!80733)) b!732910))

(assert (= (and b!732910 res!492203) b!732908))

(assert (= (and b!732908 (not res!492202)) b!732912))

(assert (= (and b!732912 (not res!492201)) b!732915))

(declare-fun m!686453 () Bool)

(assert (=> d!100085 m!686453))

(assert (=> d!100085 m!686203))

(declare-fun m!686455 () Bool)

(assert (=> b!732915 m!686455))

(assert (=> b!732909 m!686411))

(assert (=> b!732909 m!686411))

(declare-fun m!686457 () Bool)

(assert (=> b!732909 m!686457))

(assert (=> b!732912 m!686455))

(assert (=> b!732908 m!686455))

(assert (=> b!732557 d!100085))

(declare-fun d!100087 () Bool)

(declare-fun e!410183 () Bool)

(assert (=> d!100087 e!410183))

(declare-fun c!80736 () Bool)

(declare-fun lt!324768 () SeekEntryResult!7276)

(assert (=> d!100087 (= c!80736 (and ((_ is Intermediate!7276) lt!324768) (undefined!8088 lt!324768)))))

(declare-fun e!410186 () SeekEntryResult!7276)

(assert (=> d!100087 (= lt!324768 e!410186)))

(declare-fun c!80737 () Bool)

(assert (=> d!100087 (= c!80737 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324767 () (_ BitVec 64))

(assert (=> d!100087 (= lt!324767 (select (arr!19720 lt!324617) (toIndex!0 lt!324615 mask!3328)))))

(assert (=> d!100087 (validMask!0 mask!3328)))

(assert (=> d!100087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324615 mask!3328) lt!324615 lt!324617 mask!3328) lt!324768)))

(declare-fun b!732916 () Bool)

(assert (=> b!732916 (= e!410183 (bvsge (x!62618 lt!324768) #b01111111111111111111111111111110))))

(declare-fun b!732917 () Bool)

(assert (=> b!732917 (and (bvsge (index!31474 lt!324768) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324768) (size!20140 lt!324617)))))

(declare-fun res!492205 () Bool)

(assert (=> b!732917 (= res!492205 (= (select (arr!19720 lt!324617) (index!31474 lt!324768)) lt!324615))))

(declare-fun e!410185 () Bool)

(assert (=> b!732917 (=> res!492205 e!410185)))

(declare-fun e!410187 () Bool)

(assert (=> b!732917 (= e!410187 e!410185)))

(declare-fun b!732918 () Bool)

(declare-fun e!410184 () SeekEntryResult!7276)

(assert (=> b!732918 (= e!410184 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!324615 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!324615 lt!324617 mask!3328))))

(declare-fun b!732919 () Bool)

(assert (=> b!732919 (= e!410183 e!410187)))

(declare-fun res!492206 () Bool)

(assert (=> b!732919 (= res!492206 (and ((_ is Intermediate!7276) lt!324768) (not (undefined!8088 lt!324768)) (bvslt (x!62618 lt!324768) #b01111111111111111111111111111110) (bvsge (x!62618 lt!324768) #b00000000000000000000000000000000) (bvsge (x!62618 lt!324768) #b00000000000000000000000000000000)))))

(assert (=> b!732919 (=> (not res!492206) (not e!410187))))

(declare-fun b!732920 () Bool)

(assert (=> b!732920 (= e!410186 (Intermediate!7276 true (toIndex!0 lt!324615 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732921 () Bool)

(assert (=> b!732921 (and (bvsge (index!31474 lt!324768) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324768) (size!20140 lt!324617)))))

(declare-fun res!492204 () Bool)

(assert (=> b!732921 (= res!492204 (= (select (arr!19720 lt!324617) (index!31474 lt!324768)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732921 (=> res!492204 e!410185)))

(declare-fun b!732922 () Bool)

(assert (=> b!732922 (= e!410184 (Intermediate!7276 false (toIndex!0 lt!324615 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732923 () Bool)

(assert (=> b!732923 (= e!410186 e!410184)))

(declare-fun c!80738 () Bool)

(assert (=> b!732923 (= c!80738 (or (= lt!324767 lt!324615) (= (bvadd lt!324767 lt!324767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732924 () Bool)

(assert (=> b!732924 (and (bvsge (index!31474 lt!324768) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324768) (size!20140 lt!324617)))))

(assert (=> b!732924 (= e!410185 (= (select (arr!19720 lt!324617) (index!31474 lt!324768)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100087 c!80737) b!732920))

(assert (= (and d!100087 (not c!80737)) b!732923))

(assert (= (and b!732923 c!80738) b!732922))

(assert (= (and b!732923 (not c!80738)) b!732918))

(assert (= (and d!100087 c!80736) b!732916))

(assert (= (and d!100087 (not c!80736)) b!732919))

(assert (= (and b!732919 res!492206) b!732917))

(assert (= (and b!732917 (not res!492205)) b!732921))

(assert (= (and b!732921 (not res!492204)) b!732924))

(assert (=> d!100087 m!686209))

(declare-fun m!686463 () Bool)

(assert (=> d!100087 m!686463))

(assert (=> d!100087 m!686203))

(declare-fun m!686465 () Bool)

(assert (=> b!732924 m!686465))

(assert (=> b!732918 m!686209))

(declare-fun m!686469 () Bool)

(assert (=> b!732918 m!686469))

(assert (=> b!732918 m!686469))

(declare-fun m!686471 () Bool)

(assert (=> b!732918 m!686471))

(assert (=> b!732921 m!686465))

(assert (=> b!732917 m!686465))

(assert (=> b!732557 d!100087))

(declare-fun d!100091 () Bool)

(declare-fun lt!324770 () (_ BitVec 32))

(declare-fun lt!324769 () (_ BitVec 32))

(assert (=> d!100091 (= lt!324770 (bvmul (bvxor lt!324769 (bvlshr lt!324769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100091 (= lt!324769 ((_ extract 31 0) (bvand (bvxor lt!324615 (bvlshr lt!324615 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100091 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!492149 (let ((h!14697 ((_ extract 31 0) (bvand (bvxor lt!324615 (bvlshr lt!324615 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62623 (bvmul (bvxor h!14697 (bvlshr h!14697 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62623 (bvlshr x!62623 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!492149 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!492149 #b00000000000000000000000000000000))))))

(assert (=> d!100091 (= (toIndex!0 lt!324615 mask!3328) (bvand (bvxor lt!324770 (bvlshr lt!324770 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!732557 d!100091))

(declare-fun d!100093 () Bool)

(declare-fun e!410195 () Bool)

(assert (=> d!100093 e!410195))

(declare-fun c!80743 () Bool)

(declare-fun lt!324774 () SeekEntryResult!7276)

(assert (=> d!100093 (= c!80743 (and ((_ is Intermediate!7276) lt!324774) (undefined!8088 lt!324774)))))

(declare-fun e!410198 () SeekEntryResult!7276)

(assert (=> d!100093 (= lt!324774 e!410198)))

(declare-fun c!80744 () Bool)

(assert (=> d!100093 (= c!80744 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324773 () (_ BitVec 64))

(assert (=> d!100093 (= lt!324773 (select (arr!19720 a!3186) index!1321))))

(assert (=> d!100093 (validMask!0 mask!3328)))

(assert (=> d!100093 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324774)))

(declare-fun b!732936 () Bool)

(assert (=> b!732936 (= e!410195 (bvsge (x!62618 lt!324774) #b01111111111111111111111111111110))))

(declare-fun b!732937 () Bool)

(assert (=> b!732937 (and (bvsge (index!31474 lt!324774) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324774) (size!20140 a!3186)))))

(declare-fun res!492211 () Bool)

(assert (=> b!732937 (= res!492211 (= (select (arr!19720 a!3186) (index!31474 lt!324774)) (select (arr!19720 a!3186) j!159)))))

(declare-fun e!410197 () Bool)

(assert (=> b!732937 (=> res!492211 e!410197)))

(declare-fun e!410199 () Bool)

(assert (=> b!732937 (= e!410199 e!410197)))

(declare-fun e!410196 () SeekEntryResult!7276)

(declare-fun b!732938 () Bool)

(assert (=> b!732938 (= e!410196 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!19720 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732939 () Bool)

(assert (=> b!732939 (= e!410195 e!410199)))

(declare-fun res!492212 () Bool)

(assert (=> b!732939 (= res!492212 (and ((_ is Intermediate!7276) lt!324774) (not (undefined!8088 lt!324774)) (bvslt (x!62618 lt!324774) #b01111111111111111111111111111110) (bvsge (x!62618 lt!324774) #b00000000000000000000000000000000) (bvsge (x!62618 lt!324774) x!1131)))))

(assert (=> b!732939 (=> (not res!492212) (not e!410199))))

(declare-fun b!732940 () Bool)

(assert (=> b!732940 (= e!410198 (Intermediate!7276 true index!1321 x!1131))))

(declare-fun b!732941 () Bool)

(assert (=> b!732941 (and (bvsge (index!31474 lt!324774) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324774) (size!20140 a!3186)))))

(declare-fun res!492210 () Bool)

(assert (=> b!732941 (= res!492210 (= (select (arr!19720 a!3186) (index!31474 lt!324774)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732941 (=> res!492210 e!410197)))

(declare-fun b!732942 () Bool)

(assert (=> b!732942 (= e!410196 (Intermediate!7276 false index!1321 x!1131))))

(declare-fun b!732943 () Bool)

(assert (=> b!732943 (= e!410198 e!410196)))

(declare-fun c!80745 () Bool)

(assert (=> b!732943 (= c!80745 (or (= lt!324773 (select (arr!19720 a!3186) j!159)) (= (bvadd lt!324773 lt!324773) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732944 () Bool)

(assert (=> b!732944 (and (bvsge (index!31474 lt!324774) #b00000000000000000000000000000000) (bvslt (index!31474 lt!324774) (size!20140 a!3186)))))

(assert (=> b!732944 (= e!410197 (= (select (arr!19720 a!3186) (index!31474 lt!324774)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100093 c!80744) b!732940))

(assert (= (and d!100093 (not c!80744)) b!732943))

(assert (= (and b!732943 c!80745) b!732942))

(assert (= (and b!732943 (not c!80745)) b!732938))

(assert (= (and d!100093 c!80743) b!732936))

(assert (= (and d!100093 (not c!80743)) b!732939))

(assert (= (and b!732939 res!492212) b!732937))

(assert (= (and b!732937 (not res!492211)) b!732941))

(assert (= (and b!732941 (not res!492210)) b!732944))

(assert (=> d!100093 m!686419))

(assert (=> d!100093 m!686203))

(declare-fun m!686485 () Bool)

(assert (=> b!732944 m!686485))

(assert (=> b!732938 m!686411))

(assert (=> b!732938 m!686411))

(assert (=> b!732938 m!686187))

(declare-fun m!686487 () Bool)

(assert (=> b!732938 m!686487))

(assert (=> b!732941 m!686485))

(assert (=> b!732937 m!686485))

(assert (=> b!732555 d!100093))

(declare-fun call!34892 () Bool)

(declare-fun bm!34889 () Bool)

(assert (=> bm!34889 (= call!34892 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732945 () Bool)

(declare-fun e!410200 () Bool)

(declare-fun e!410201 () Bool)

(assert (=> b!732945 (= e!410200 e!410201)))

(declare-fun lt!324777 () (_ BitVec 64))

(assert (=> b!732945 (= lt!324777 (select (arr!19720 a!3186) j!159))))

(declare-fun lt!324775 () Unit!24949)

(assert (=> b!732945 (= lt!324775 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324777 j!159))))

(assert (=> b!732945 (arrayContainsKey!0 a!3186 lt!324777 #b00000000000000000000000000000000)))

(declare-fun lt!324776 () Unit!24949)

(assert (=> b!732945 (= lt!324776 lt!324775)))

(declare-fun res!492214 () Bool)

(assert (=> b!732945 (= res!492214 (= (seekEntryOrOpen!0 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) (Found!7276 j!159)))))

(assert (=> b!732945 (=> (not res!492214) (not e!410201))))

(declare-fun b!732946 () Bool)

(assert (=> b!732946 (= e!410201 call!34892)))

(declare-fun b!732947 () Bool)

(assert (=> b!732947 (= e!410200 call!34892)))

(declare-fun d!100097 () Bool)

(declare-fun res!492213 () Bool)

(declare-fun e!410202 () Bool)

(assert (=> d!100097 (=> res!492213 e!410202)))

(assert (=> d!100097 (= res!492213 (bvsge j!159 (size!20140 a!3186)))))

(assert (=> d!100097 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!410202)))

(declare-fun b!732948 () Bool)

(assert (=> b!732948 (= e!410202 e!410200)))

(declare-fun c!80746 () Bool)

(assert (=> b!732948 (= c!80746 (validKeyInArray!0 (select (arr!19720 a!3186) j!159)))))

(assert (= (and d!100097 (not res!492213)) b!732948))

(assert (= (and b!732948 c!80746) b!732945))

(assert (= (and b!732948 (not c!80746)) b!732947))

(assert (= (and b!732945 res!492214) b!732946))

(assert (= (or b!732946 b!732947) bm!34889))

(declare-fun m!686489 () Bool)

(assert (=> bm!34889 m!686489))

(assert (=> b!732945 m!686187))

(declare-fun m!686491 () Bool)

(assert (=> b!732945 m!686491))

(declare-fun m!686493 () Bool)

(assert (=> b!732945 m!686493))

(assert (=> b!732945 m!686187))

(assert (=> b!732945 m!686189))

(assert (=> b!732948 m!686187))

(assert (=> b!732948 m!686187))

(assert (=> b!732948 m!686195))

(assert (=> b!732566 d!100097))

(declare-fun d!100101 () Bool)

(assert (=> d!100101 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!324786 () Unit!24949)

(declare-fun choose!38 (array!41212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24949)

(assert (=> d!100101 (= lt!324786 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100101 (validMask!0 mask!3328)))

(assert (=> d!100101 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!324786)))

(declare-fun bs!20968 () Bool)

(assert (= bs!20968 d!100101))

(assert (=> bs!20968 m!686197))

(declare-fun m!686509 () Bool)

(assert (=> bs!20968 m!686509))

(assert (=> bs!20968 m!686203))

(assert (=> b!732566 d!100101))

(declare-fun d!100109 () Bool)

(assert (=> d!100109 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!732559 d!100109))

(declare-fun b!732967 () Bool)

(declare-fun e!410214 () SeekEntryResult!7276)

(declare-fun e!410215 () SeekEntryResult!7276)

(assert (=> b!732967 (= e!410214 e!410215)))

(declare-fun lt!324788 () (_ BitVec 64))

(declare-fun lt!324789 () SeekEntryResult!7276)

(assert (=> b!732967 (= lt!324788 (select (arr!19720 a!3186) (index!31474 lt!324789)))))

(declare-fun c!80753 () Bool)

(assert (=> b!732967 (= c!80753 (= lt!324788 (select (arr!19720 a!3186) j!159)))))

(declare-fun b!732968 () Bool)

(assert (=> b!732968 (= e!410214 Undefined!7276)))

(declare-fun b!732969 () Bool)

(declare-fun c!80754 () Bool)

(assert (=> b!732969 (= c!80754 (= lt!324788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410213 () SeekEntryResult!7276)

(assert (=> b!732969 (= e!410215 e!410213)))

(declare-fun b!732971 () Bool)

(assert (=> b!732971 (= e!410213 (seekKeyOrZeroReturnVacant!0 (x!62618 lt!324789) (index!31474 lt!324789) (index!31474 lt!324789) (select (arr!19720 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732972 () Bool)

(assert (=> b!732972 (= e!410213 (MissingZero!7276 (index!31474 lt!324789)))))

(declare-fun b!732970 () Bool)

(assert (=> b!732970 (= e!410215 (Found!7276 (index!31474 lt!324789)))))

(declare-fun d!100111 () Bool)

(declare-fun lt!324787 () SeekEntryResult!7276)

(assert (=> d!100111 (and (or ((_ is Undefined!7276) lt!324787) (not ((_ is Found!7276) lt!324787)) (and (bvsge (index!31473 lt!324787) #b00000000000000000000000000000000) (bvslt (index!31473 lt!324787) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324787) ((_ is Found!7276) lt!324787) (not ((_ is MissingZero!7276) lt!324787)) (and (bvsge (index!31472 lt!324787) #b00000000000000000000000000000000) (bvslt (index!31472 lt!324787) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324787) ((_ is Found!7276) lt!324787) ((_ is MissingZero!7276) lt!324787) (not ((_ is MissingVacant!7276) lt!324787)) (and (bvsge (index!31475 lt!324787) #b00000000000000000000000000000000) (bvslt (index!31475 lt!324787) (size!20140 a!3186)))) (or ((_ is Undefined!7276) lt!324787) (ite ((_ is Found!7276) lt!324787) (= (select (arr!19720 a!3186) (index!31473 lt!324787)) (select (arr!19720 a!3186) j!159)) (ite ((_ is MissingZero!7276) lt!324787) (= (select (arr!19720 a!3186) (index!31472 lt!324787)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7276) lt!324787) (= (select (arr!19720 a!3186) (index!31475 lt!324787)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100111 (= lt!324787 e!410214)))

(declare-fun c!80755 () Bool)

(assert (=> d!100111 (= c!80755 (and ((_ is Intermediate!7276) lt!324789) (undefined!8088 lt!324789)))))

(assert (=> d!100111 (= lt!324789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) (select (arr!19720 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100111 (validMask!0 mask!3328)))

(assert (=> d!100111 (= (seekEntryOrOpen!0 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!324787)))

(assert (= (and d!100111 c!80755) b!732968))

(assert (= (and d!100111 (not c!80755)) b!732967))

(assert (= (and b!732967 c!80753) b!732970))

(assert (= (and b!732967 (not c!80753)) b!732969))

(assert (= (and b!732969 c!80754) b!732972))

(assert (= (and b!732969 (not c!80754)) b!732971))

(declare-fun m!686511 () Bool)

(assert (=> b!732967 m!686511))

(assert (=> b!732971 m!686187))

(declare-fun m!686513 () Bool)

(assert (=> b!732971 m!686513))

(assert (=> d!100111 m!686187))

(assert (=> d!100111 m!686231))

(declare-fun m!686515 () Bool)

(assert (=> d!100111 m!686515))

(declare-fun m!686517 () Bool)

(assert (=> d!100111 m!686517))

(assert (=> d!100111 m!686231))

(assert (=> d!100111 m!686187))

(assert (=> d!100111 m!686233))

(assert (=> d!100111 m!686203))

(declare-fun m!686519 () Bool)

(assert (=> d!100111 m!686519))

(assert (=> b!732570 d!100111))

(assert (=> b!732568 d!100063))

(declare-fun d!100113 () Bool)

(declare-fun lt!324796 () (_ BitVec 32))

(assert (=> d!100113 (and (bvsge lt!324796 #b00000000000000000000000000000000) (bvslt lt!324796 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100113 (= lt!324796 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!100113 (validMask!0 mask!3328)))

(assert (=> d!100113 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!324796)))

(declare-fun bs!20969 () Bool)

(assert (= bs!20969 d!100113))

(declare-fun m!686521 () Bool)

(assert (=> bs!20969 m!686521))

(assert (=> bs!20969 m!686203))

(assert (=> b!732558 d!100113))

(check-sat (not b!732833) (not d!100063) (not b!732918) (not b!732730) (not d!100085) (not d!100039) (not d!100101) (not b!732824) (not b!732762) (not b!732909) (not d!100111) (not d!100053) (not bm!34881) (not d!100041) (not d!100093) (not bm!34889) (not b!732814) (not b!732884) (not b!732763) (not b!732945) (not b!732706) (not d!100087) (not b!732881) (not b!732948) (not d!100113) (not b!732759) (not b!732938) (not b!732971) (not bm!34885))
(check-sat)
