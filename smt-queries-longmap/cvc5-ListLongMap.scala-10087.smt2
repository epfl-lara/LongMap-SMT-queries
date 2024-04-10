; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118764 () Bool)

(assert start!118764)

(declare-fun res!928533 () Bool)

(declare-fun e!786181 () Bool)

(assert (=> start!118764 (=> (not res!928533) (not e!786181))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118764 (= res!928533 (validMask!0 mask!2987))))

(assert (=> start!118764 e!786181))

(assert (=> start!118764 true))

(declare-datatypes ((array!94935 0))(
  ( (array!94936 (arr!45842 (Array (_ BitVec 32) (_ BitVec 64))) (size!46392 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94935)

(declare-fun array_inv!34870 (array!94935) Bool)

(assert (=> start!118764 (array_inv!34870 a!2938)))

(declare-fun b!1387890 () Bool)

(declare-datatypes ((Unit!46397 0))(
  ( (Unit!46398) )
))
(declare-fun e!786179 () Unit!46397)

(declare-fun Unit!46399 () Unit!46397)

(assert (=> b!1387890 (= e!786179 Unit!46399)))

(declare-fun b!1387891 () Bool)

(declare-fun res!928529 () Bool)

(assert (=> b!1387891 (=> (not res!928529) (not e!786181))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387891 (= res!928529 (validKeyInArray!0 (select (arr!45842 a!2938) i!1065)))))

(declare-fun b!1387892 () Bool)

(declare-fun e!786178 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387892 (= e!786178 (validKeyInArray!0 (select (arr!45842 a!2938) startIndex!16)))))

(declare-fun b!1387893 () Bool)

(declare-fun e!786182 () Bool)

(assert (=> b!1387893 (= e!786181 e!786182)))

(declare-fun res!928534 () Bool)

(assert (=> b!1387893 (=> (not res!928534) (not e!786182))))

(assert (=> b!1387893 (= res!928534 (bvsge startIndex!16 (bvsub (size!46392 a!2938) #b00000000000000000000000000000001)))))

(declare-fun lt!610081 () Unit!46397)

(assert (=> b!1387893 (= lt!610081 e!786179)))

(declare-fun c!129123 () Bool)

(assert (=> b!1387893 (= c!129123 e!786178)))

(declare-fun res!928527 () Bool)

(assert (=> b!1387893 (=> (not res!928527) (not e!786178))))

(assert (=> b!1387893 (= res!928527 (not (= startIndex!16 i!1065)))))

(declare-fun lt!610083 () array!94935)

(assert (=> b!1387893 (= lt!610083 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)))))

(declare-fun b!1387894 () Bool)

(declare-fun res!928528 () Bool)

(assert (=> b!1387894 (=> (not res!928528) (not e!786181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94935 (_ BitVec 32)) Bool)

(assert (=> b!1387894 (= res!928528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387895 () Bool)

(declare-fun res!928531 () Bool)

(assert (=> b!1387895 (=> (not res!928531) (not e!786181))))

(declare-datatypes ((List!32370 0))(
  ( (Nil!32367) (Cons!32366 (h!33578 (_ BitVec 64)) (t!47064 List!32370)) )
))
(declare-fun arrayNoDuplicates!0 (array!94935 (_ BitVec 32) List!32370) Bool)

(assert (=> b!1387895 (= res!928531 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32367))))

(declare-fun b!1387896 () Bool)

(declare-fun res!928530 () Bool)

(assert (=> b!1387896 (=> (not res!928530) (not e!786181))))

(assert (=> b!1387896 (= res!928530 (and (not (= (select (arr!45842 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45842 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387897 () Bool)

(declare-fun res!928532 () Bool)

(assert (=> b!1387897 (=> (not res!928532) (not e!786181))))

(assert (=> b!1387897 (= res!928532 (and (= (size!46392 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46392 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46392 a!2938))))))

(declare-fun b!1387898 () Bool)

(assert (=> b!1387898 (= e!786182 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610083 mask!2987)))))

(declare-fun b!1387899 () Bool)

(declare-fun lt!610082 () Unit!46397)

(assert (=> b!1387899 (= e!786179 lt!610082)))

(declare-fun lt!610080 () Unit!46397)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46397)

(assert (=> b!1387899 (= lt!610080 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10185 0))(
  ( (MissingZero!10185 (index!43111 (_ BitVec 32))) (Found!10185 (index!43112 (_ BitVec 32))) (Intermediate!10185 (undefined!10997 Bool) (index!43113 (_ BitVec 32)) (x!124731 (_ BitVec 32))) (Undefined!10185) (MissingVacant!10185 (index!43114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94935 (_ BitVec 32)) SeekEntryResult!10185)

(assert (=> b!1387899 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46397)

(assert (=> b!1387899 (= lt!610082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387899 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118764 res!928533) b!1387897))

(assert (= (and b!1387897 res!928532) b!1387891))

(assert (= (and b!1387891 res!928529) b!1387895))

(assert (= (and b!1387895 res!928531) b!1387894))

(assert (= (and b!1387894 res!928528) b!1387896))

(assert (= (and b!1387896 res!928530) b!1387893))

(assert (= (and b!1387893 res!928527) b!1387892))

(assert (= (and b!1387893 c!129123) b!1387899))

(assert (= (and b!1387893 (not c!129123)) b!1387890))

(assert (= (and b!1387893 res!928534) b!1387898))

(declare-fun m!1273545 () Bool)

(assert (=> b!1387899 m!1273545))

(declare-fun m!1273547 () Bool)

(assert (=> b!1387899 m!1273547))

(declare-fun m!1273549 () Bool)

(assert (=> b!1387899 m!1273549))

(declare-fun m!1273551 () Bool)

(assert (=> b!1387899 m!1273551))

(assert (=> b!1387899 m!1273547))

(declare-fun m!1273553 () Bool)

(assert (=> b!1387899 m!1273553))

(declare-fun m!1273555 () Bool)

(assert (=> b!1387899 m!1273555))

(declare-fun m!1273557 () Bool)

(assert (=> b!1387899 m!1273557))

(assert (=> b!1387899 m!1273555))

(declare-fun m!1273559 () Bool)

(assert (=> b!1387899 m!1273559))

(declare-fun m!1273561 () Bool)

(assert (=> b!1387896 m!1273561))

(assert (=> b!1387891 m!1273561))

(assert (=> b!1387891 m!1273561))

(declare-fun m!1273563 () Bool)

(assert (=> b!1387891 m!1273563))

(declare-fun m!1273565 () Bool)

(assert (=> b!1387895 m!1273565))

(declare-fun m!1273567 () Bool)

(assert (=> b!1387894 m!1273567))

(declare-fun m!1273569 () Bool)

(assert (=> b!1387898 m!1273569))

(assert (=> b!1387893 m!1273549))

(assert (=> b!1387892 m!1273555))

(assert (=> b!1387892 m!1273555))

(declare-fun m!1273571 () Bool)

(assert (=> b!1387892 m!1273571))

(declare-fun m!1273573 () Bool)

(assert (=> start!118764 m!1273573))

(declare-fun m!1273575 () Bool)

(assert (=> start!118764 m!1273575))

(push 1)

(assert (not start!118764))

(assert (not b!1387892))

(assert (not b!1387899))

(assert (not b!1387898))

(assert (not b!1387891))

(assert (not b!1387894))

(assert (not b!1387895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149743 () Bool)

(assert (=> d!149743 (= (validKeyInArray!0 (select (arr!45842 a!2938) startIndex!16)) (and (not (= (select (arr!45842 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45842 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387892 d!149743))

(declare-fun b!1388027 () Bool)

(declare-fun e!786265 () Bool)

(declare-fun e!786266 () Bool)

(assert (=> b!1388027 (= e!786265 e!786266)))

(declare-fun c!129145 () Bool)

(assert (=> b!1388027 (= c!129145 (validKeyInArray!0 (select (arr!45842 lt!610083) startIndex!16)))))

(declare-fun b!1388028 () Bool)

(declare-fun e!786267 () Bool)

(declare-fun call!66612 () Bool)

(assert (=> b!1388028 (= e!786267 call!66612)))

(declare-fun b!1388029 () Bool)

(assert (=> b!1388029 (= e!786266 e!786267)))

(declare-fun lt!610139 () (_ BitVec 64))

(assert (=> b!1388029 (= lt!610139 (select (arr!45842 lt!610083) startIndex!16))))

(declare-fun lt!610136 () Unit!46397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94935 (_ BitVec 64) (_ BitVec 32)) Unit!46397)

(assert (=> b!1388029 (= lt!610136 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610083 lt!610139 startIndex!16))))

(declare-fun arrayContainsKey!0 (array!94935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388029 (arrayContainsKey!0 lt!610083 lt!610139 #b00000000000000000000000000000000)))

(declare-fun lt!610140 () Unit!46397)

(assert (=> b!1388029 (= lt!610140 lt!610136)))

(declare-fun res!928621 () Bool)

(assert (=> b!1388029 (= res!928621 (= (seekEntryOrOpen!0 (select (arr!45842 lt!610083) startIndex!16) lt!610083 mask!2987) (Found!10185 startIndex!16)))))

(assert (=> b!1388029 (=> (not res!928621) (not e!786267))))

(declare-fun bm!66609 () Bool)

(assert (=> bm!66609 (= call!66612 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610083 mask!2987))))

(declare-fun d!149745 () Bool)

(declare-fun res!928620 () Bool)

(assert (=> d!149745 (=> res!928620 e!786265)))

(assert (=> d!149745 (= res!928620 (bvsge startIndex!16 (size!46392 lt!610083)))))

(assert (=> d!149745 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610083 mask!2987) e!786265)))

(declare-fun b!1388030 () Bool)

(assert (=> b!1388030 (= e!786266 call!66612)))

(assert (= (and d!149745 (not res!928620)) b!1388027))

(assert (= (and b!1388027 c!129145) b!1388029))

(assert (= (and b!1388027 (not c!129145)) b!1388030))

(assert (= (and b!1388029 res!928621) b!1388028))

(assert (= (or b!1388028 b!1388030) bm!66609))

(declare-fun m!1273687 () Bool)

(assert (=> b!1388027 m!1273687))

(assert (=> b!1388027 m!1273687))

(declare-fun m!1273689 () Bool)

(assert (=> b!1388027 m!1273689))

(assert (=> b!1388029 m!1273687))

(declare-fun m!1273691 () Bool)

(assert (=> b!1388029 m!1273691))

(declare-fun m!1273693 () Bool)

(assert (=> b!1388029 m!1273693))

(assert (=> b!1388029 m!1273687))

(declare-fun m!1273695 () Bool)

(assert (=> b!1388029 m!1273695))

(declare-fun m!1273697 () Bool)

(assert (=> bm!66609 m!1273697))

(assert (=> b!1387898 d!149745))

(declare-fun d!149751 () Bool)

(assert (=> d!149751 (= (validKeyInArray!0 (select (arr!45842 a!2938) i!1065)) (and (not (= (select (arr!45842 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45842 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387891 d!149751))

(declare-fun d!149753 () Bool)

(assert (=> d!149753 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118764 d!149753))

(declare-fun d!149761 () Bool)

(assert (=> d!149761 (= (array_inv!34870 a!2938) (bvsge (size!46392 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118764 d!149761))

(declare-fun b!1388069 () Bool)

(declare-fun e!786294 () Bool)

(declare-fun e!786295 () Bool)

(assert (=> b!1388069 (= e!786294 e!786295)))

(declare-fun c!129159 () Bool)

(assert (=> b!1388069 (= c!129159 (validKeyInArray!0 (select (arr!45842 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388070 () Bool)

(declare-fun e!786293 () Bool)

(declare-fun contains!9750 (List!32370 (_ BitVec 64)) Bool)

(assert (=> b!1388070 (= e!786293 (contains!9750 Nil!32367 (select (arr!45842 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388071 () Bool)

(declare-fun e!786296 () Bool)

(assert (=> b!1388071 (= e!786296 e!786294)))

(declare-fun res!928636 () Bool)

(assert (=> b!1388071 (=> (not res!928636) (not e!786294))))

(assert (=> b!1388071 (= res!928636 (not e!786293))))

(declare-fun res!928634 () Bool)

(assert (=> b!1388071 (=> (not res!928634) (not e!786293))))

(assert (=> b!1388071 (= res!928634 (validKeyInArray!0 (select (arr!45842 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388072 () Bool)

(declare-fun call!66619 () Bool)

(assert (=> b!1388072 (= e!786295 call!66619)))

(declare-fun bm!66616 () Bool)

(assert (=> bm!66616 (= call!66619 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129159 (Cons!32366 (select (arr!45842 a!2938) #b00000000000000000000000000000000) Nil!32367) Nil!32367)))))

(declare-fun b!1388073 () Bool)

(assert (=> b!1388073 (= e!786295 call!66619)))

(declare-fun d!149763 () Bool)

(declare-fun res!928635 () Bool)

(assert (=> d!149763 (=> res!928635 e!786296)))

(assert (=> d!149763 (= res!928635 (bvsge #b00000000000000000000000000000000 (size!46392 a!2938)))))

(assert (=> d!149763 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32367) e!786296)))

(assert (= (and d!149763 (not res!928635)) b!1388071))

(assert (= (and b!1388071 res!928634) b!1388070))

(assert (= (and b!1388071 res!928636) b!1388069))

(assert (= (and b!1388069 c!129159) b!1388073))

(assert (= (and b!1388069 (not c!129159)) b!1388072))

(assert (= (or b!1388073 b!1388072) bm!66616))

(declare-fun m!1273733 () Bool)

(assert (=> b!1388069 m!1273733))

(assert (=> b!1388069 m!1273733))

(declare-fun m!1273735 () Bool)

(assert (=> b!1388069 m!1273735))

(assert (=> b!1388070 m!1273733))

(assert (=> b!1388070 m!1273733))

(declare-fun m!1273737 () Bool)

(assert (=> b!1388070 m!1273737))

(assert (=> b!1388071 m!1273733))

(assert (=> b!1388071 m!1273733))

(assert (=> b!1388071 m!1273735))

(assert (=> bm!66616 m!1273733))

(declare-fun m!1273739 () Bool)

(assert (=> bm!66616 m!1273739))

(assert (=> b!1387895 d!149763))

(declare-fun d!149771 () Bool)

(assert (=> d!149771 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!610170 () Unit!46397)

(declare-fun choose!38 (array!94935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46397)

(assert (=> d!149771 (= lt!610170 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149771 (validMask!0 mask!2987)))

(assert (=> d!149771 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!610170)))

(declare-fun bs!40342 () Bool)

(assert (= bs!40342 d!149771))

(assert (=> bs!40342 m!1273559))

(declare-fun m!1273765 () Bool)

(assert (=> bs!40342 m!1273765))

(assert (=> bs!40342 m!1273573))

(assert (=> b!1387899 d!149771))

(declare-fun b!1388084 () Bool)

(declare-fun e!786303 () Bool)

(declare-fun e!786304 () Bool)

(assert (=> b!1388084 (= e!786303 e!786304)))

(declare-fun c!129164 () Bool)

(assert (=> b!1388084 (= c!129164 (validKeyInArray!0 (select (arr!45842 a!2938) startIndex!16)))))

(declare-fun b!1388085 () Bool)

(declare-fun e!786305 () Bool)

(declare-fun call!66621 () Bool)

(assert (=> b!1388085 (= e!786305 call!66621)))

(declare-fun b!1388086 () Bool)

(assert (=> b!1388086 (= e!786304 e!786305)))

(declare-fun lt!610172 () (_ BitVec 64))

(assert (=> b!1388086 (= lt!610172 (select (arr!45842 a!2938) startIndex!16))))

(declare-fun lt!610171 () Unit!46397)

(assert (=> b!1388086 (= lt!610171 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610172 startIndex!16))))

(assert (=> b!1388086 (arrayContainsKey!0 a!2938 lt!610172 #b00000000000000000000000000000000)))

(declare-fun lt!610173 () Unit!46397)

(assert (=> b!1388086 (= lt!610173 lt!610171)))

(declare-fun res!928640 () Bool)

(assert (=> b!1388086 (= res!928640 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987) (Found!10185 startIndex!16)))))

(assert (=> b!1388086 (=> (not res!928640) (not e!786305))))

(declare-fun bm!66618 () Bool)

(assert (=> bm!66618 (= call!66621 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149781 () Bool)

(declare-fun res!928639 () Bool)

(assert (=> d!149781 (=> res!928639 e!786303)))

(assert (=> d!149781 (= res!928639 (bvsge startIndex!16 (size!46392 a!2938)))))

(assert (=> d!149781 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!786303)))

(declare-fun b!1388087 () Bool)

(assert (=> b!1388087 (= e!786304 call!66621)))

(assert (= (and d!149781 (not res!928639)) b!1388084))

(assert (= (and b!1388084 c!129164) b!1388086))

(assert (= (and b!1388084 (not c!129164)) b!1388087))

(assert (= (and b!1388086 res!928640) b!1388085))

(assert (= (or b!1388085 b!1388087) bm!66618))

(assert (=> b!1388084 m!1273555))

(assert (=> b!1388084 m!1273555))

(assert (=> b!1388084 m!1273571))

(assert (=> b!1388086 m!1273555))

(declare-fun m!1273767 () Bool)

(assert (=> b!1388086 m!1273767))

(declare-fun m!1273769 () Bool)

(assert (=> b!1388086 m!1273769))

(assert (=> b!1388086 m!1273555))

(assert (=> b!1388086 m!1273557))

(declare-fun m!1273771 () Bool)

(assert (=> bm!66618 m!1273771))

(assert (=> b!1387899 d!149781))

(declare-fun d!149783 () Bool)

(declare-fun e!786311 () Bool)

(assert (=> d!149783 e!786311))

(declare-fun res!928646 () Bool)

(assert (=> d!149783 (=> (not res!928646) (not e!786311))))

(assert (=> d!149783 (= res!928646 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46392 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46392 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46392 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46392 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46392 a!2938))))))

(declare-fun lt!610179 () Unit!46397)

(declare-fun choose!14 (array!94935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46397)

(assert (=> d!149783 (= lt!610179 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149783 (validMask!0 mask!2987)))

(assert (=> d!149783 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!610179)))

(declare-fun b!1388093 () Bool)

(assert (=> b!1388093 (= e!786311 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)) mask!2987)))))

(assert (= (and d!149783 res!928646) b!1388093))

(declare-fun m!1273777 () Bool)

(assert (=> d!149783 m!1273777))

(assert (=> d!149783 m!1273573))

(assert (=> b!1388093 m!1273549))

(assert (=> b!1388093 m!1273547))

(assert (=> b!1388093 m!1273555))

(assert (=> b!1388093 m!1273557))

(assert (=> b!1388093 m!1273555))

(assert (=> b!1388093 m!1273547))

(declare-fun m!1273779 () Bool)

(assert (=> b!1388093 m!1273779))

(assert (=> b!1387899 d!149783))

(declare-fun b!1388130 () Bool)

(declare-fun e!786330 () SeekEntryResult!10185)

(declare-fun e!786331 () SeekEntryResult!10185)

(assert (=> b!1388130 (= e!786330 e!786331)))

(declare-fun lt!610198 () (_ BitVec 64))

(declare-fun lt!610199 () SeekEntryResult!10185)

(assert (=> b!1388130 (= lt!610198 (select (arr!45842 a!2938) (index!43113 lt!610199)))))

(declare-fun c!129185 () Bool)

(assert (=> b!1388130 (= c!129185 (= lt!610198 (select (arr!45842 a!2938) startIndex!16)))))

(declare-fun b!1388131 () Bool)

(declare-fun c!129183 () Bool)

(assert (=> b!1388131 (= c!129183 (= lt!610198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786332 () SeekEntryResult!10185)

(assert (=> b!1388131 (= e!786331 e!786332)))

(declare-fun b!1388132 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94935 (_ BitVec 32)) SeekEntryResult!10185)

(assert (=> b!1388132 (= e!786332 (seekKeyOrZeroReturnVacant!0 (x!124731 lt!610199) (index!43113 lt!610199) (index!43113 lt!610199) (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388133 () Bool)

(assert (=> b!1388133 (= e!786331 (Found!10185 (index!43113 lt!610199)))))

(declare-fun b!1388134 () Bool)

(assert (=> b!1388134 (= e!786332 (MissingZero!10185 (index!43113 lt!610199)))))

(declare-fun d!149789 () Bool)

(declare-fun lt!610200 () SeekEntryResult!10185)

(assert (=> d!149789 (and (or (is-Undefined!10185 lt!610200) (not (is-Found!10185 lt!610200)) (and (bvsge (index!43112 lt!610200) #b00000000000000000000000000000000) (bvslt (index!43112 lt!610200) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610200) (is-Found!10185 lt!610200) (not (is-MissingZero!10185 lt!610200)) (and (bvsge (index!43111 lt!610200) #b00000000000000000000000000000000) (bvslt (index!43111 lt!610200) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610200) (is-Found!10185 lt!610200) (is-MissingZero!10185 lt!610200) (not (is-MissingVacant!10185 lt!610200)) (and (bvsge (index!43114 lt!610200) #b00000000000000000000000000000000) (bvslt (index!43114 lt!610200) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610200) (ite (is-Found!10185 lt!610200) (= (select (arr!45842 a!2938) (index!43112 lt!610200)) (select (arr!45842 a!2938) startIndex!16)) (ite (is-MissingZero!10185 lt!610200) (= (select (arr!45842 a!2938) (index!43111 lt!610200)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10185 lt!610200) (= (select (arr!45842 a!2938) (index!43114 lt!610200)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149789 (= lt!610200 e!786330)))

(declare-fun c!129184 () Bool)

(assert (=> d!149789 (= c!129184 (and (is-Intermediate!10185 lt!610199) (undefined!10997 lt!610199)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94935 (_ BitVec 32)) SeekEntryResult!10185)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149789 (= lt!610199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45842 a!2938) startIndex!16) mask!2987) (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149789 (validMask!0 mask!2987)))

(assert (=> d!149789 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987) lt!610200)))

(declare-fun b!1388135 () Bool)

(assert (=> b!1388135 (= e!786330 Undefined!10185)))

(assert (= (and d!149789 c!129184) b!1388135))

(assert (= (and d!149789 (not c!129184)) b!1388130))

(assert (= (and b!1388130 c!129185) b!1388133))

(assert (= (and b!1388130 (not c!129185)) b!1388131))

(assert (= (and b!1388131 c!129183) b!1388134))

(assert (= (and b!1388131 (not c!129183)) b!1388132))

(declare-fun m!1273809 () Bool)

(assert (=> b!1388130 m!1273809))

(assert (=> b!1388132 m!1273555))

(declare-fun m!1273811 () Bool)

(assert (=> b!1388132 m!1273811))

(declare-fun m!1273813 () Bool)

(assert (=> d!149789 m!1273813))

(assert (=> d!149789 m!1273573))

(declare-fun m!1273815 () Bool)

(assert (=> d!149789 m!1273815))

(declare-fun m!1273817 () Bool)

(assert (=> d!149789 m!1273817))

(assert (=> d!149789 m!1273555))

(declare-fun m!1273819 () Bool)

(assert (=> d!149789 m!1273819))

(declare-fun m!1273821 () Bool)

(assert (=> d!149789 m!1273821))

(assert (=> d!149789 m!1273555))

(assert (=> d!149789 m!1273817))

(assert (=> b!1387899 d!149789))

(declare-fun b!1388136 () Bool)

(declare-fun e!786333 () SeekEntryResult!10185)

(declare-fun e!786334 () SeekEntryResult!10185)

(assert (=> b!1388136 (= e!786333 e!786334)))

(declare-fun lt!610201 () (_ BitVec 64))

(declare-fun lt!610202 () SeekEntryResult!10185)

(assert (=> b!1388136 (= lt!610201 (select (arr!45842 lt!610083) (index!43113 lt!610202)))))

(declare-fun c!129188 () Bool)

(assert (=> b!1388136 (= c!129188 (= lt!610201 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388137 () Bool)

(declare-fun c!129186 () Bool)

(assert (=> b!1388137 (= c!129186 (= lt!610201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786335 () SeekEntryResult!10185)

(assert (=> b!1388137 (= e!786334 e!786335)))

(declare-fun b!1388138 () Bool)

(assert (=> b!1388138 (= e!786335 (seekKeyOrZeroReturnVacant!0 (x!124731 lt!610202) (index!43113 lt!610202) (index!43113 lt!610202) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987))))

(declare-fun b!1388139 () Bool)

(assert (=> b!1388139 (= e!786334 (Found!10185 (index!43113 lt!610202)))))

(declare-fun b!1388140 () Bool)

(assert (=> b!1388140 (= e!786335 (MissingZero!10185 (index!43113 lt!610202)))))

(declare-fun d!149795 () Bool)

(declare-fun lt!610203 () SeekEntryResult!10185)

(assert (=> d!149795 (and (or (is-Undefined!10185 lt!610203) (not (is-Found!10185 lt!610203)) (and (bvsge (index!43112 lt!610203) #b00000000000000000000000000000000) (bvslt (index!43112 lt!610203) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610203) (is-Found!10185 lt!610203) (not (is-MissingZero!10185 lt!610203)) (and (bvsge (index!43111 lt!610203) #b00000000000000000000000000000000) (bvslt (index!43111 lt!610203) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610203) (is-Found!10185 lt!610203) (is-MissingZero!10185 lt!610203) (not (is-MissingVacant!10185 lt!610203)) (and (bvsge (index!43114 lt!610203) #b00000000000000000000000000000000) (bvslt (index!43114 lt!610203) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610203) (ite (is-Found!10185 lt!610203) (= (select (arr!45842 lt!610083) (index!43112 lt!610203)) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite (is-MissingZero!10185 lt!610203) (= (select (arr!45842 lt!610083) (index!43111 lt!610203)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10185 lt!610203) (= (select (arr!45842 lt!610083) (index!43114 lt!610203)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149795 (= lt!610203 e!786333)))

(declare-fun c!129187 () Bool)

(assert (=> d!149795 (= c!129187 (and (is-Intermediate!10185 lt!610202) (undefined!10997 lt!610202)))))

(assert (=> d!149795 (= lt!610202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987))))

(assert (=> d!149795 (validMask!0 mask!2987)))

(assert (=> d!149795 (= (seekEntryOrOpen!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987) lt!610203)))

(declare-fun b!1388141 () Bool)

(assert (=> b!1388141 (= e!786333 Undefined!10185)))

(assert (= (and d!149795 c!129187) b!1388141))

(assert (= (and d!149795 (not c!129187)) b!1388136))

(assert (= (and b!1388136 c!129188) b!1388139))

(assert (= (and b!1388136 (not c!129188)) b!1388137))

(assert (= (and b!1388137 c!129186) b!1388140))

(assert (= (and b!1388137 (not c!129186)) b!1388138))

(declare-fun m!1273823 () Bool)

(assert (=> b!1388136 m!1273823))

(assert (=> b!1388138 m!1273547))

(declare-fun m!1273825 () Bool)

(assert (=> b!1388138 m!1273825))

(declare-fun m!1273827 () Bool)

(assert (=> d!149795 m!1273827))

(assert (=> d!149795 m!1273573))

(declare-fun m!1273829 () Bool)

(assert (=> d!149795 m!1273829))

(declare-fun m!1273831 () Bool)

(assert (=> d!149795 m!1273831))

(assert (=> d!149795 m!1273547))

(declare-fun m!1273833 () Bool)

(assert (=> d!149795 m!1273833))

(declare-fun m!1273835 () Bool)

(assert (=> d!149795 m!1273835))

(assert (=> d!149795 m!1273547))

(assert (=> d!149795 m!1273831))

(assert (=> b!1387899 d!149795))

(declare-fun b!1388142 () Bool)

(declare-fun e!786336 () Bool)

(declare-fun e!786337 () Bool)

(assert (=> b!1388142 (= e!786336 e!786337)))

(declare-fun c!129189 () Bool)

(assert (=> b!1388142 (= c!129189 (validKeyInArray!0 (select (arr!45842 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388143 () Bool)

(declare-fun e!786338 () Bool)

(declare-fun call!66622 () Bool)

(assert (=> b!1388143 (= e!786338 call!66622)))

(declare-fun b!1388144 () Bool)

(assert (=> b!1388144 (= e!786337 e!786338)))

(declare-fun lt!610205 () (_ BitVec 64))

(assert (=> b!1388144 (= lt!610205 (select (arr!45842 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!610204 () Unit!46397)

(assert (=> b!1388144 (= lt!610204 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610205 #b00000000000000000000000000000000))))

(assert (=> b!1388144 (arrayContainsKey!0 a!2938 lt!610205 #b00000000000000000000000000000000)))

(declare-fun lt!610206 () Unit!46397)

(assert (=> b!1388144 (= lt!610206 lt!610204)))

(declare-fun res!928648 () Bool)

(assert (=> b!1388144 (= res!928648 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10185 #b00000000000000000000000000000000)))))

(assert (=> b!1388144 (=> (not res!928648) (not e!786338))))

(declare-fun bm!66619 () Bool)

(assert (=> bm!66619 (= call!66622 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149797 () Bool)

(declare-fun res!928647 () Bool)

(assert (=> d!149797 (=> res!928647 e!786336)))

(assert (=> d!149797 (= res!928647 (bvsge #b00000000000000000000000000000000 (size!46392 a!2938)))))

(assert (=> d!149797 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!786336)))

(declare-fun b!1388145 () Bool)

(assert (=> b!1388145 (= e!786337 call!66622)))

(assert (= (and d!149797 (not res!928647)) b!1388142))

(assert (= (and b!1388142 c!129189) b!1388144))

(assert (= (and b!1388142 (not c!129189)) b!1388145))

(assert (= (and b!1388144 res!928648) b!1388143))

(assert (= (or b!1388143 b!1388145) bm!66619))

(assert (=> b!1388142 m!1273733))

(assert (=> b!1388142 m!1273733))

(assert (=> b!1388142 m!1273735))

(assert (=> b!1388144 m!1273733))

(declare-fun m!1273837 () Bool)

(assert (=> b!1388144 m!1273837))

(declare-fun m!1273839 () Bool)

(assert (=> b!1388144 m!1273839))

(assert (=> b!1388144 m!1273733))

(declare-fun m!1273841 () Bool)

(assert (=> b!1388144 m!1273841))

(declare-fun m!1273843 () Bool)

(assert (=> bm!66619 m!1273843))

(assert (=> b!1387894 d!149797))

(push 1)

(assert (not b!1388132))

(assert (not d!149771))

(assert (not b!1388069))

(assert (not bm!66616))

(assert (not bm!66618))

(assert (not bm!66619))

(assert (not d!149783))

(assert (not b!1388142))

(assert (not b!1388084))

(assert (not b!1388093))

(assert (not b!1388086))

(assert (not b!1388144))

(assert (not b!1388070))

(assert (not b!1388029))

(assert (not b!1388071))

(assert (not bm!66609))

(assert (not b!1388138))

(assert (not d!149795))

(assert (not b!1388027))

(assert (not d!149789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149803 () Bool)

(declare-fun lt!610213 () Bool)

(declare-fun content!764 (List!32370) (Set (_ BitVec 64)))

(assert (=> d!149803 (= lt!610213 (set.member (select (arr!45842 a!2938) #b00000000000000000000000000000000) (content!764 Nil!32367)))))

(declare-fun e!786352 () Bool)

(assert (=> d!149803 (= lt!610213 e!786352)))

(declare-fun res!928656 () Bool)

(assert (=> d!149803 (=> (not res!928656) (not e!786352))))

(assert (=> d!149803 (= res!928656 (is-Cons!32366 Nil!32367))))

(assert (=> d!149803 (= (contains!9750 Nil!32367 (select (arr!45842 a!2938) #b00000000000000000000000000000000)) lt!610213)))

(declare-fun b!1388162 () Bool)

(declare-fun e!786351 () Bool)

(assert (=> b!1388162 (= e!786352 e!786351)))

(declare-fun res!928655 () Bool)

(assert (=> b!1388162 (=> res!928655 e!786351)))

(assert (=> b!1388162 (= res!928655 (= (h!33578 Nil!32367) (select (arr!45842 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388163 () Bool)

(assert (=> b!1388163 (= e!786351 (contains!9750 (t!47064 Nil!32367) (select (arr!45842 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149803 res!928656) b!1388162))

(assert (= (and b!1388162 (not res!928655)) b!1388163))

(declare-fun m!1273845 () Bool)

(assert (=> d!149803 m!1273845))

(assert (=> d!149803 m!1273733))

(declare-fun m!1273847 () Bool)

(assert (=> d!149803 m!1273847))

(assert (=> b!1388163 m!1273733))

(declare-fun m!1273849 () Bool)

(assert (=> b!1388163 m!1273849))

(assert (=> b!1388070 d!149803))

(assert (=> b!1388093 d!149789))

(declare-fun b!1388170 () Bool)

(declare-fun e!786355 () SeekEntryResult!10185)

(declare-fun e!786356 () SeekEntryResult!10185)

(assert (=> b!1388170 (= e!786355 e!786356)))

(declare-fun lt!610215 () SeekEntryResult!10185)

(declare-fun lt!610214 () (_ BitVec 64))

(assert (=> b!1388170 (= lt!610214 (select (arr!45842 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938))) (index!43113 lt!610215)))))

(declare-fun c!129198 () Bool)

(assert (=> b!1388170 (= c!129198 (= lt!610214 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388171 () Bool)

(declare-fun c!129196 () Bool)

(assert (=> b!1388171 (= c!129196 (= lt!610214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786357 () SeekEntryResult!10185)

(assert (=> b!1388171 (= e!786356 e!786357)))

(declare-fun b!1388172 () Bool)

(assert (=> b!1388172 (= e!786357 (seekKeyOrZeroReturnVacant!0 (x!124731 lt!610215) (index!43113 lt!610215) (index!43113 lt!610215) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)) mask!2987))))

(declare-fun b!1388173 () Bool)

(assert (=> b!1388173 (= e!786356 (Found!10185 (index!43113 lt!610215)))))

(declare-fun b!1388174 () Bool)

(assert (=> b!1388174 (= e!786357 (MissingZero!10185 (index!43113 lt!610215)))))

(declare-fun lt!610216 () SeekEntryResult!10185)

(declare-fun d!149805 () Bool)

(assert (=> d!149805 (and (or (is-Undefined!10185 lt!610216) (not (is-Found!10185 lt!610216)) (and (bvsge (index!43112 lt!610216) #b00000000000000000000000000000000) (bvslt (index!43112 lt!610216) (size!46392 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)))))) (or (is-Undefined!10185 lt!610216) (is-Found!10185 lt!610216) (not (is-MissingZero!10185 lt!610216)) (and (bvsge (index!43111 lt!610216) #b00000000000000000000000000000000) (bvslt (index!43111 lt!610216) (size!46392 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)))))) (or (is-Undefined!10185 lt!610216) (is-Found!10185 lt!610216) (is-MissingZero!10185 lt!610216) (not (is-MissingVacant!10185 lt!610216)) (and (bvsge (index!43114 lt!610216) #b00000000000000000000000000000000) (bvslt (index!43114 lt!610216) (size!46392 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)))))) (or (is-Undefined!10185 lt!610216) (ite (is-Found!10185 lt!610216) (= (select (arr!45842 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938))) (index!43112 lt!610216)) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite (is-MissingZero!10185 lt!610216) (= (select (arr!45842 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938))) (index!43111 lt!610216)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10185 lt!610216) (= (select (arr!45842 (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938))) (index!43114 lt!610216)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149805 (= lt!610216 e!786355)))

(declare-fun c!129197 () Bool)

(assert (=> d!149805 (= c!129197 (and (is-Intermediate!10185 lt!610215) (undefined!10997 lt!610215)))))

(assert (=> d!149805 (= lt!610215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)) mask!2987))))

(assert (=> d!149805 (validMask!0 mask!2987)))

(assert (=> d!149805 (= (seekEntryOrOpen!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)) mask!2987) lt!610216)))

(declare-fun b!1388175 () Bool)

(assert (=> b!1388175 (= e!786355 Undefined!10185)))

(assert (= (and d!149805 c!129197) b!1388175))

(assert (= (and d!149805 (not c!129197)) b!1388170))

(assert (= (and b!1388170 c!129198) b!1388173))

(assert (= (and b!1388170 (not c!129198)) b!1388171))

(assert (= (and b!1388171 c!129196) b!1388174))

(assert (= (and b!1388171 (not c!129196)) b!1388172))

(declare-fun m!1273851 () Bool)

(assert (=> b!1388170 m!1273851))

(assert (=> b!1388172 m!1273547))

(declare-fun m!1273853 () Bool)

(assert (=> b!1388172 m!1273853))

(declare-fun m!1273855 () Bool)

(assert (=> d!149805 m!1273855))

(assert (=> d!149805 m!1273573))

(declare-fun m!1273857 () Bool)

(assert (=> d!149805 m!1273857))

(assert (=> d!149805 m!1273831))

(assert (=> d!149805 m!1273547))

(declare-fun m!1273859 () Bool)

(assert (=> d!149805 m!1273859))

(declare-fun m!1273861 () Bool)

(assert (=> d!149805 m!1273861))

(assert (=> d!149805 m!1273547))

(assert (=> d!149805 m!1273831))

(assert (=> b!1388093 d!149805))

(declare-fun d!149807 () Bool)

(assert (=> d!149807 (= (validKeyInArray!0 (select (arr!45842 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45842 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45842 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388069 d!149807))

(assert (=> b!1388071 d!149807))

(declare-fun d!149809 () Bool)

(assert (=> d!149809 (arrayContainsKey!0 lt!610083 lt!610139 #b00000000000000000000000000000000)))

(declare-fun lt!610219 () Unit!46397)

(declare-fun choose!13 (array!94935 (_ BitVec 64) (_ BitVec 32)) Unit!46397)

(assert (=> d!149809 (= lt!610219 (choose!13 lt!610083 lt!610139 startIndex!16))))

(assert (=> d!149809 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149809 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610083 lt!610139 startIndex!16) lt!610219)))

(declare-fun bs!40344 () Bool)

(assert (= bs!40344 d!149809))

(assert (=> bs!40344 m!1273693))

(declare-fun m!1273863 () Bool)

(assert (=> bs!40344 m!1273863))

(assert (=> b!1388029 d!149809))

(declare-fun d!149811 () Bool)

(declare-fun res!928669 () Bool)

(declare-fun e!786367 () Bool)

(assert (=> d!149811 (=> res!928669 e!786367)))

(assert (=> d!149811 (= res!928669 (= (select (arr!45842 lt!610083) #b00000000000000000000000000000000) lt!610139))))

(assert (=> d!149811 (= (arrayContainsKey!0 lt!610083 lt!610139 #b00000000000000000000000000000000) e!786367)))

(declare-fun b!1388189 () Bool)

(declare-fun e!786368 () Bool)

(assert (=> b!1388189 (= e!786367 e!786368)))

(declare-fun res!928670 () Bool)

(assert (=> b!1388189 (=> (not res!928670) (not e!786368))))

(assert (=> b!1388189 (= res!928670 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46392 lt!610083)))))

(declare-fun b!1388190 () Bool)

(assert (=> b!1388190 (= e!786368 (arrayContainsKey!0 lt!610083 lt!610139 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149811 (not res!928669)) b!1388189))

(assert (= (and b!1388189 res!928670) b!1388190))

(declare-fun m!1273873 () Bool)

(assert (=> d!149811 m!1273873))

(declare-fun m!1273875 () Bool)

(assert (=> b!1388190 m!1273875))

(assert (=> b!1388029 d!149811))

(declare-fun b!1388191 () Bool)

(declare-fun e!786369 () SeekEntryResult!10185)

(declare-fun e!786370 () SeekEntryResult!10185)

(assert (=> b!1388191 (= e!786369 e!786370)))

(declare-fun lt!610222 () (_ BitVec 64))

(declare-fun lt!610223 () SeekEntryResult!10185)

(assert (=> b!1388191 (= lt!610222 (select (arr!45842 lt!610083) (index!43113 lt!610223)))))

(declare-fun c!129204 () Bool)

(assert (=> b!1388191 (= c!129204 (= lt!610222 (select (arr!45842 lt!610083) startIndex!16)))))

(declare-fun b!1388192 () Bool)

(declare-fun c!129202 () Bool)

(assert (=> b!1388192 (= c!129202 (= lt!610222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786371 () SeekEntryResult!10185)

(assert (=> b!1388192 (= e!786370 e!786371)))

(declare-fun b!1388193 () Bool)

(assert (=> b!1388193 (= e!786371 (seekKeyOrZeroReturnVacant!0 (x!124731 lt!610223) (index!43113 lt!610223) (index!43113 lt!610223) (select (arr!45842 lt!610083) startIndex!16) lt!610083 mask!2987))))

(declare-fun b!1388194 () Bool)

(assert (=> b!1388194 (= e!786370 (Found!10185 (index!43113 lt!610223)))))

(declare-fun b!1388195 () Bool)

(assert (=> b!1388195 (= e!786371 (MissingZero!10185 (index!43113 lt!610223)))))

(declare-fun d!149815 () Bool)

(declare-fun lt!610224 () SeekEntryResult!10185)

(assert (=> d!149815 (and (or (is-Undefined!10185 lt!610224) (not (is-Found!10185 lt!610224)) (and (bvsge (index!43112 lt!610224) #b00000000000000000000000000000000) (bvslt (index!43112 lt!610224) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610224) (is-Found!10185 lt!610224) (not (is-MissingZero!10185 lt!610224)) (and (bvsge (index!43111 lt!610224) #b00000000000000000000000000000000) (bvslt (index!43111 lt!610224) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610224) (is-Found!10185 lt!610224) (is-MissingZero!10185 lt!610224) (not (is-MissingVacant!10185 lt!610224)) (and (bvsge (index!43114 lt!610224) #b00000000000000000000000000000000) (bvslt (index!43114 lt!610224) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610224) (ite (is-Found!10185 lt!610224) (= (select (arr!45842 lt!610083) (index!43112 lt!610224)) (select (arr!45842 lt!610083) startIndex!16)) (ite (is-MissingZero!10185 lt!610224) (= (select (arr!45842 lt!610083) (index!43111 lt!610224)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10185 lt!610224) (= (select (arr!45842 lt!610083) (index!43114 lt!610224)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149815 (= lt!610224 e!786369)))

(declare-fun c!129203 () Bool)

(assert (=> d!149815 (= c!129203 (and (is-Intermediate!10185 lt!610223) (undefined!10997 lt!610223)))))

(assert (=> d!149815 (= lt!610223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45842 lt!610083) startIndex!16) mask!2987) (select (arr!45842 lt!610083) startIndex!16) lt!610083 mask!2987))))

(assert (=> d!149815 (validMask!0 mask!2987)))

(assert (=> d!149815 (= (seekEntryOrOpen!0 (select (arr!45842 lt!610083) startIndex!16) lt!610083 mask!2987) lt!610224)))

(declare-fun b!1388196 () Bool)

(assert (=> b!1388196 (= e!786369 Undefined!10185)))

(assert (= (and d!149815 c!129203) b!1388196))

(assert (= (and d!149815 (not c!129203)) b!1388191))

(assert (= (and b!1388191 c!129204) b!1388194))

(assert (= (and b!1388191 (not c!129204)) b!1388192))

(assert (= (and b!1388192 c!129202) b!1388195))

(assert (= (and b!1388192 (not c!129202)) b!1388193))

(declare-fun m!1273877 () Bool)

(assert (=> b!1388191 m!1273877))

(assert (=> b!1388193 m!1273687))

(declare-fun m!1273879 () Bool)

(assert (=> b!1388193 m!1273879))

(declare-fun m!1273881 () Bool)

(assert (=> d!149815 m!1273881))

(assert (=> d!149815 m!1273573))

(declare-fun m!1273883 () Bool)

(assert (=> d!149815 m!1273883))

(declare-fun m!1273885 () Bool)

(assert (=> d!149815 m!1273885))

(assert (=> d!149815 m!1273687))

(declare-fun m!1273887 () Bool)

(assert (=> d!149815 m!1273887))

(declare-fun m!1273889 () Bool)

(assert (=> d!149815 m!1273889))

(assert (=> d!149815 m!1273687))

(assert (=> d!149815 m!1273885))

(assert (=> b!1388029 d!149815))

(declare-fun d!149817 () Bool)

(assert (=> d!149817 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94936 (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46392 a!2938)) mask!2987))))

(assert (=> d!149817 true))

(declare-fun _$42!25 () Unit!46397)

(assert (=> d!149817 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!25)))

(declare-fun bs!40345 () Bool)

(assert (= bs!40345 d!149817))

(assert (=> bs!40345 m!1273555))

(assert (=> bs!40345 m!1273557))

(assert (=> bs!40345 m!1273549))

(assert (=> bs!40345 m!1273547))

(assert (=> bs!40345 m!1273547))

(assert (=> bs!40345 m!1273779))

(assert (=> bs!40345 m!1273555))

(assert (=> d!149783 d!149817))

(assert (=> d!149783 d!149753))

(declare-fun b!1388251 () Bool)

(declare-fun e!786410 () SeekEntryResult!10185)

(assert (=> b!1388251 (= e!786410 (Found!10185 (index!43113 lt!610199)))))

(declare-fun b!1388252 () Bool)

(declare-fun e!786411 () SeekEntryResult!10185)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1388252 (= e!786411 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124731 lt!610199) #b00000000000000000000000000000001) (nextIndex!0 (index!43113 lt!610199) (x!124731 lt!610199) mask!2987) (index!43113 lt!610199) (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun lt!610259 () SeekEntryResult!10185)

(declare-fun d!149823 () Bool)

(assert (=> d!149823 (and (or (is-Undefined!10185 lt!610259) (not (is-Found!10185 lt!610259)) (and (bvsge (index!43112 lt!610259) #b00000000000000000000000000000000) (bvslt (index!43112 lt!610259) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610259) (is-Found!10185 lt!610259) (not (is-MissingVacant!10185 lt!610259)) (not (= (index!43114 lt!610259) (index!43113 lt!610199))) (and (bvsge (index!43114 lt!610259) #b00000000000000000000000000000000) (bvslt (index!43114 lt!610259) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610259) (ite (is-Found!10185 lt!610259) (= (select (arr!45842 a!2938) (index!43112 lt!610259)) (select (arr!45842 a!2938) startIndex!16)) (and (is-MissingVacant!10185 lt!610259) (= (index!43114 lt!610259) (index!43113 lt!610199)) (= (select (arr!45842 a!2938) (index!43114 lt!610259)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!786409 () SeekEntryResult!10185)

(assert (=> d!149823 (= lt!610259 e!786409)))

(declare-fun c!129222 () Bool)

(assert (=> d!149823 (= c!129222 (bvsge (x!124731 lt!610199) #b01111111111111111111111111111110))))

(declare-fun lt!610258 () (_ BitVec 64))

(assert (=> d!149823 (= lt!610258 (select (arr!45842 a!2938) (index!43113 lt!610199)))))

(assert (=> d!149823 (validMask!0 mask!2987)))

(assert (=> d!149823 (= (seekKeyOrZeroReturnVacant!0 (x!124731 lt!610199) (index!43113 lt!610199) (index!43113 lt!610199) (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987) lt!610259)))

(declare-fun b!1388253 () Bool)

(assert (=> b!1388253 (= e!786411 (MissingVacant!10185 (index!43113 lt!610199)))))

(declare-fun b!1388254 () Bool)

(assert (=> b!1388254 (= e!786409 Undefined!10185)))

(declare-fun b!1388255 () Bool)

(assert (=> b!1388255 (= e!786409 e!786410)))

(declare-fun c!129224 () Bool)

(assert (=> b!1388255 (= c!129224 (= lt!610258 (select (arr!45842 a!2938) startIndex!16)))))

(declare-fun b!1388256 () Bool)

(declare-fun c!129223 () Bool)

(assert (=> b!1388256 (= c!129223 (= lt!610258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388256 (= e!786410 e!786411)))

(assert (= (and d!149823 c!129222) b!1388254))

(assert (= (and d!149823 (not c!129222)) b!1388255))

(assert (= (and b!1388255 c!129224) b!1388251))

(assert (= (and b!1388255 (not c!129224)) b!1388256))

(assert (= (and b!1388256 c!129223) b!1388253))

(assert (= (and b!1388256 (not c!129223)) b!1388252))

(declare-fun m!1273975 () Bool)

(assert (=> b!1388252 m!1273975))

(assert (=> b!1388252 m!1273975))

(assert (=> b!1388252 m!1273555))

(declare-fun m!1273977 () Bool)

(assert (=> b!1388252 m!1273977))

(declare-fun m!1273979 () Bool)

(assert (=> d!149823 m!1273979))

(declare-fun m!1273981 () Bool)

(assert (=> d!149823 m!1273981))

(assert (=> d!149823 m!1273809))

(assert (=> d!149823 m!1273573))

(assert (=> b!1388132 d!149823))

(declare-fun d!149851 () Bool)

(assert (=> d!149851 (arrayContainsKey!0 a!2938 lt!610205 #b00000000000000000000000000000000)))

(declare-fun lt!610260 () Unit!46397)

(assert (=> d!149851 (= lt!610260 (choose!13 a!2938 lt!610205 #b00000000000000000000000000000000))))

(assert (=> d!149851 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149851 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610205 #b00000000000000000000000000000000) lt!610260)))

(declare-fun bs!40349 () Bool)

(assert (= bs!40349 d!149851))

(assert (=> bs!40349 m!1273839))

(declare-fun m!1273983 () Bool)

(assert (=> bs!40349 m!1273983))

(assert (=> b!1388144 d!149851))

(declare-fun d!149853 () Bool)

(declare-fun res!928691 () Bool)

(declare-fun e!786412 () Bool)

(assert (=> d!149853 (=> res!928691 e!786412)))

(assert (=> d!149853 (= res!928691 (= (select (arr!45842 a!2938) #b00000000000000000000000000000000) lt!610205))))

(assert (=> d!149853 (= (arrayContainsKey!0 a!2938 lt!610205 #b00000000000000000000000000000000) e!786412)))

(declare-fun b!1388257 () Bool)

(declare-fun e!786413 () Bool)

(assert (=> b!1388257 (= e!786412 e!786413)))

(declare-fun res!928692 () Bool)

(assert (=> b!1388257 (=> (not res!928692) (not e!786413))))

(assert (=> b!1388257 (= res!928692 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46392 a!2938)))))

(declare-fun b!1388258 () Bool)

(assert (=> b!1388258 (= e!786413 (arrayContainsKey!0 a!2938 lt!610205 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149853 (not res!928691)) b!1388257))

(assert (= (and b!1388257 res!928692) b!1388258))

(assert (=> d!149853 m!1273733))

(declare-fun m!1273985 () Bool)

(assert (=> b!1388258 m!1273985))

(assert (=> b!1388144 d!149853))

(declare-fun b!1388259 () Bool)

(declare-fun e!786414 () SeekEntryResult!10185)

(declare-fun e!786415 () SeekEntryResult!10185)

(assert (=> b!1388259 (= e!786414 e!786415)))

(declare-fun lt!610261 () (_ BitVec 64))

(declare-fun lt!610262 () SeekEntryResult!10185)

(assert (=> b!1388259 (= lt!610261 (select (arr!45842 a!2938) (index!43113 lt!610262)))))

(declare-fun c!129227 () Bool)

(assert (=> b!1388259 (= c!129227 (= lt!610261 (select (arr!45842 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388260 () Bool)

(declare-fun c!129225 () Bool)

(assert (=> b!1388260 (= c!129225 (= lt!610261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786416 () SeekEntryResult!10185)

(assert (=> b!1388260 (= e!786415 e!786416)))

(declare-fun b!1388261 () Bool)

(assert (=> b!1388261 (= e!786416 (seekKeyOrZeroReturnVacant!0 (x!124731 lt!610262) (index!43113 lt!610262) (index!43113 lt!610262) (select (arr!45842 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1388262 () Bool)

(assert (=> b!1388262 (= e!786415 (Found!10185 (index!43113 lt!610262)))))

(declare-fun b!1388263 () Bool)

(assert (=> b!1388263 (= e!786416 (MissingZero!10185 (index!43113 lt!610262)))))

(declare-fun d!149855 () Bool)

(declare-fun lt!610263 () SeekEntryResult!10185)

(assert (=> d!149855 (and (or (is-Undefined!10185 lt!610263) (not (is-Found!10185 lt!610263)) (and (bvsge (index!43112 lt!610263) #b00000000000000000000000000000000) (bvslt (index!43112 lt!610263) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610263) (is-Found!10185 lt!610263) (not (is-MissingZero!10185 lt!610263)) (and (bvsge (index!43111 lt!610263) #b00000000000000000000000000000000) (bvslt (index!43111 lt!610263) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610263) (is-Found!10185 lt!610263) (is-MissingZero!10185 lt!610263) (not (is-MissingVacant!10185 lt!610263)) (and (bvsge (index!43114 lt!610263) #b00000000000000000000000000000000) (bvslt (index!43114 lt!610263) (size!46392 a!2938)))) (or (is-Undefined!10185 lt!610263) (ite (is-Found!10185 lt!610263) (= (select (arr!45842 a!2938) (index!43112 lt!610263)) (select (arr!45842 a!2938) #b00000000000000000000000000000000)) (ite (is-MissingZero!10185 lt!610263) (= (select (arr!45842 a!2938) (index!43111 lt!610263)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10185 lt!610263) (= (select (arr!45842 a!2938) (index!43114 lt!610263)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149855 (= lt!610263 e!786414)))

(declare-fun c!129226 () Bool)

(assert (=> d!149855 (= c!129226 (and (is-Intermediate!10185 lt!610262) (undefined!10997 lt!610262)))))

(assert (=> d!149855 (= lt!610262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45842 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45842 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149855 (validMask!0 mask!2987)))

(assert (=> d!149855 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!610263)))

(declare-fun b!1388264 () Bool)

(assert (=> b!1388264 (= e!786414 Undefined!10185)))

(assert (= (and d!149855 c!129226) b!1388264))

(assert (= (and d!149855 (not c!129226)) b!1388259))

(assert (= (and b!1388259 c!129227) b!1388262))

(assert (= (and b!1388259 (not c!129227)) b!1388260))

(assert (= (and b!1388260 c!129225) b!1388263))

(assert (= (and b!1388260 (not c!129225)) b!1388261))

(declare-fun m!1273987 () Bool)

(assert (=> b!1388259 m!1273987))

(assert (=> b!1388261 m!1273733))

(declare-fun m!1273989 () Bool)

(assert (=> b!1388261 m!1273989))

(declare-fun m!1273991 () Bool)

(assert (=> d!149855 m!1273991))

(assert (=> d!149855 m!1273573))

(declare-fun m!1273993 () Bool)

(assert (=> d!149855 m!1273993))

(declare-fun m!1273995 () Bool)

(assert (=> d!149855 m!1273995))

(assert (=> d!149855 m!1273733))

(declare-fun m!1273997 () Bool)

(assert (=> d!149855 m!1273997))

(declare-fun m!1273999 () Bool)

(assert (=> d!149855 m!1273999))

(assert (=> d!149855 m!1273733))

(assert (=> d!149855 m!1273995))

(assert (=> b!1388144 d!149855))

(declare-fun b!1388265 () Bool)

(declare-fun e!786418 () SeekEntryResult!10185)

(assert (=> b!1388265 (= e!786418 (Found!10185 (index!43113 lt!610202)))))

(declare-fun b!1388266 () Bool)

(declare-fun e!786419 () SeekEntryResult!10185)

(assert (=> b!1388266 (= e!786419 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124731 lt!610202) #b00000000000000000000000000000001) (nextIndex!0 (index!43113 lt!610202) (x!124731 lt!610202) mask!2987) (index!43113 lt!610202) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987))))

(declare-fun d!149857 () Bool)

(declare-fun lt!610265 () SeekEntryResult!10185)

(assert (=> d!149857 (and (or (is-Undefined!10185 lt!610265) (not (is-Found!10185 lt!610265)) (and (bvsge (index!43112 lt!610265) #b00000000000000000000000000000000) (bvslt (index!43112 lt!610265) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610265) (is-Found!10185 lt!610265) (not (is-MissingVacant!10185 lt!610265)) (not (= (index!43114 lt!610265) (index!43113 lt!610202))) (and (bvsge (index!43114 lt!610265) #b00000000000000000000000000000000) (bvslt (index!43114 lt!610265) (size!46392 lt!610083)))) (or (is-Undefined!10185 lt!610265) (ite (is-Found!10185 lt!610265) (= (select (arr!45842 lt!610083) (index!43112 lt!610265)) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and (is-MissingVacant!10185 lt!610265) (= (index!43114 lt!610265) (index!43113 lt!610202)) (= (select (arr!45842 lt!610083) (index!43114 lt!610265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!786417 () SeekEntryResult!10185)

(assert (=> d!149857 (= lt!610265 e!786417)))

(declare-fun c!129228 () Bool)

(assert (=> d!149857 (= c!129228 (bvsge (x!124731 lt!610202) #b01111111111111111111111111111110))))

(declare-fun lt!610264 () (_ BitVec 64))

(assert (=> d!149857 (= lt!610264 (select (arr!45842 lt!610083) (index!43113 lt!610202)))))

(assert (=> d!149857 (validMask!0 mask!2987)))

(assert (=> d!149857 (= (seekKeyOrZeroReturnVacant!0 (x!124731 lt!610202) (index!43113 lt!610202) (index!43113 lt!610202) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987) lt!610265)))

(declare-fun b!1388267 () Bool)

(assert (=> b!1388267 (= e!786419 (MissingVacant!10185 (index!43113 lt!610202)))))

(declare-fun b!1388268 () Bool)

(assert (=> b!1388268 (= e!786417 Undefined!10185)))

(declare-fun b!1388269 () Bool)

(assert (=> b!1388269 (= e!786417 e!786418)))

(declare-fun c!129230 () Bool)

(assert (=> b!1388269 (= c!129230 (= lt!610264 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388270 () Bool)

(declare-fun c!129229 () Bool)

(assert (=> b!1388270 (= c!129229 (= lt!610264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388270 (= e!786418 e!786419)))

(assert (= (and d!149857 c!129228) b!1388268))

(assert (= (and d!149857 (not c!129228)) b!1388269))

(assert (= (and b!1388269 c!129230) b!1388265))

(assert (= (and b!1388269 (not c!129230)) b!1388270))

(assert (= (and b!1388270 c!129229) b!1388267))

(assert (= (and b!1388270 (not c!129229)) b!1388266))

(declare-fun m!1274001 () Bool)

(assert (=> b!1388266 m!1274001))

(assert (=> b!1388266 m!1274001))

(assert (=> b!1388266 m!1273547))

(declare-fun m!1274003 () Bool)

(assert (=> b!1388266 m!1274003))

(declare-fun m!1274005 () Bool)

(assert (=> d!149857 m!1274005))

(declare-fun m!1274007 () Bool)

(assert (=> d!149857 m!1274007))

(assert (=> d!149857 m!1273823))

(assert (=> d!149857 m!1273573))

(assert (=> b!1388138 d!149857))

(declare-fun b!1388271 () Bool)

(declare-fun e!786420 () Bool)

(declare-fun e!786421 () Bool)

(assert (=> b!1388271 (= e!786420 e!786421)))

(declare-fun c!129231 () Bool)

(assert (=> b!1388271 (= c!129231 (validKeyInArray!0 (select (arr!45842 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1388272 () Bool)

(declare-fun e!786422 () Bool)

(declare-fun call!66625 () Bool)

(assert (=> b!1388272 (= e!786422 call!66625)))

(declare-fun b!1388273 () Bool)

(assert (=> b!1388273 (= e!786421 e!786422)))

(declare-fun lt!610267 () (_ BitVec 64))

(assert (=> b!1388273 (= lt!610267 (select (arr!45842 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610266 () Unit!46397)

(assert (=> b!1388273 (= lt!610266 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610267 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388273 (arrayContainsKey!0 a!2938 lt!610267 #b00000000000000000000000000000000)))

(declare-fun lt!610268 () Unit!46397)

(assert (=> b!1388273 (= lt!610268 lt!610266)))

(declare-fun res!928694 () Bool)

(assert (=> b!1388273 (= res!928694 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10185 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388273 (=> (not res!928694) (not e!786422))))

(declare-fun bm!66622 () Bool)

(assert (=> bm!66622 (= call!66625 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149859 () Bool)

(declare-fun res!928693 () Bool)

(assert (=> d!149859 (=> res!928693 e!786420)))

(assert (=> d!149859 (= res!928693 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46392 a!2938)))))

(assert (=> d!149859 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!786420)))

(declare-fun b!1388274 () Bool)

(assert (=> b!1388274 (= e!786421 call!66625)))

(assert (= (and d!149859 (not res!928693)) b!1388271))

(assert (= (and b!1388271 c!129231) b!1388273))

(assert (= (and b!1388271 (not c!129231)) b!1388274))

(assert (= (and b!1388273 res!928694) b!1388272))

(assert (= (or b!1388272 b!1388274) bm!66622))

(declare-fun m!1274009 () Bool)

(assert (=> b!1388271 m!1274009))

(assert (=> b!1388271 m!1274009))

(declare-fun m!1274011 () Bool)

(assert (=> b!1388271 m!1274011))

(assert (=> b!1388273 m!1274009))

(declare-fun m!1274013 () Bool)

(assert (=> b!1388273 m!1274013))

(declare-fun m!1274015 () Bool)

(assert (=> b!1388273 m!1274015))

(assert (=> b!1388273 m!1274009))

(declare-fun m!1274017 () Bool)

(assert (=> b!1388273 m!1274017))

(declare-fun m!1274019 () Bool)

(assert (=> bm!66622 m!1274019))

(assert (=> bm!66618 d!149859))

(declare-fun b!1388275 () Bool)

(declare-fun e!786423 () Bool)

(declare-fun e!786424 () Bool)

(assert (=> b!1388275 (= e!786423 e!786424)))

(declare-fun c!129232 () Bool)

(assert (=> b!1388275 (= c!129232 (validKeyInArray!0 (select (arr!45842 lt!610083) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1388276 () Bool)

(declare-fun e!786425 () Bool)

(declare-fun call!66626 () Bool)

(assert (=> b!1388276 (= e!786425 call!66626)))

(declare-fun b!1388277 () Bool)

(assert (=> b!1388277 (= e!786424 e!786425)))

(declare-fun lt!610270 () (_ BitVec 64))

(assert (=> b!1388277 (= lt!610270 (select (arr!45842 lt!610083) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610269 () Unit!46397)

(assert (=> b!1388277 (= lt!610269 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610083 lt!610270 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388277 (arrayContainsKey!0 lt!610083 lt!610270 #b00000000000000000000000000000000)))

(declare-fun lt!610271 () Unit!46397)

(assert (=> b!1388277 (= lt!610271 lt!610269)))

(declare-fun res!928696 () Bool)

(assert (=> b!1388277 (= res!928696 (= (seekEntryOrOpen!0 (select (arr!45842 lt!610083) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!610083 mask!2987) (Found!10185 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388277 (=> (not res!928696) (not e!786425))))

(declare-fun bm!66623 () Bool)

(assert (=> bm!66623 (= call!66626 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!610083 mask!2987))))

(declare-fun d!149861 () Bool)

(declare-fun res!928695 () Bool)

(assert (=> d!149861 (=> res!928695 e!786423)))

(assert (=> d!149861 (= res!928695 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46392 lt!610083)))))

(assert (=> d!149861 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610083 mask!2987) e!786423)))

(declare-fun b!1388278 () Bool)

(assert (=> b!1388278 (= e!786424 call!66626)))

(assert (= (and d!149861 (not res!928695)) b!1388275))

(assert (= (and b!1388275 c!129232) b!1388277))

(assert (= (and b!1388275 (not c!129232)) b!1388278))

(assert (= (and b!1388277 res!928696) b!1388276))

(assert (= (or b!1388276 b!1388278) bm!66623))

(declare-fun m!1274021 () Bool)

(assert (=> b!1388275 m!1274021))

(assert (=> b!1388275 m!1274021))

(declare-fun m!1274023 () Bool)

(assert (=> b!1388275 m!1274023))

(assert (=> b!1388277 m!1274021))

(declare-fun m!1274025 () Bool)

(assert (=> b!1388277 m!1274025))

(declare-fun m!1274027 () Bool)

(assert (=> b!1388277 m!1274027))

(assert (=> b!1388277 m!1274021))

(declare-fun m!1274029 () Bool)

(assert (=> b!1388277 m!1274029))

(declare-fun m!1274031 () Bool)

(assert (=> bm!66623 m!1274031))

(assert (=> bm!66609 d!149861))

(declare-fun e!786463 () SeekEntryResult!10185)

(declare-fun b!1388339 () Bool)

(assert (=> b!1388339 (= e!786463 (Intermediate!10185 false (toIndex!0 (select (arr!45842 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388340 () Bool)

(declare-fun e!786464 () Bool)

(declare-fun lt!610291 () SeekEntryResult!10185)

(assert (=> b!1388340 (= e!786464 (bvsge (x!124731 lt!610291) #b01111111111111111111111111111110))))

(declare-fun b!1388341 () Bool)

(assert (=> b!1388341 (= e!786463 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45842 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388342 () Bool)

(declare-fun e!786461 () SeekEntryResult!10185)

(assert (=> b!1388342 (= e!786461 e!786463)))

(declare-fun lt!610292 () (_ BitVec 64))

(declare-fun c!129256 () Bool)

(assert (=> b!1388342 (= c!129256 (or (= lt!610292 (select (arr!45842 a!2938) startIndex!16)) (= (bvadd lt!610292 lt!610292) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388343 () Bool)

(declare-fun e!786462 () Bool)

(assert (=> b!1388343 (= e!786464 e!786462)))

(declare-fun res!928711 () Bool)

(assert (=> b!1388343 (= res!928711 (and (is-Intermediate!10185 lt!610291) (not (undefined!10997 lt!610291)) (bvslt (x!124731 lt!610291) #b01111111111111111111111111111110) (bvsge (x!124731 lt!610291) #b00000000000000000000000000000000) (bvsge (x!124731 lt!610291) #b00000000000000000000000000000000)))))

(assert (=> b!1388343 (=> (not res!928711) (not e!786462))))

(declare-fun b!1388344 () Bool)

(assert (=> b!1388344 (and (bvsge (index!43113 lt!610291) #b00000000000000000000000000000000) (bvslt (index!43113 lt!610291) (size!46392 a!2938)))))

(declare-fun res!928713 () Bool)

(assert (=> b!1388344 (= res!928713 (= (select (arr!45842 a!2938) (index!43113 lt!610291)) (select (arr!45842 a!2938) startIndex!16)))))

(declare-fun e!786460 () Bool)

(assert (=> b!1388344 (=> res!928713 e!786460)))

(assert (=> b!1388344 (= e!786462 e!786460)))

(declare-fun b!1388345 () Bool)

(assert (=> b!1388345 (and (bvsge (index!43113 lt!610291) #b00000000000000000000000000000000) (bvslt (index!43113 lt!610291) (size!46392 a!2938)))))

(declare-fun res!928712 () Bool)

(assert (=> b!1388345 (= res!928712 (= (select (arr!45842 a!2938) (index!43113 lt!610291)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388345 (=> res!928712 e!786460)))

(declare-fun d!149863 () Bool)

(assert (=> d!149863 e!786464))

(declare-fun c!129258 () Bool)

(assert (=> d!149863 (= c!129258 (and (is-Intermediate!10185 lt!610291) (undefined!10997 lt!610291)))))

(assert (=> d!149863 (= lt!610291 e!786461)))

(declare-fun c!129257 () Bool)

(assert (=> d!149863 (= c!129257 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!149863 (= lt!610292 (select (arr!45842 a!2938) (toIndex!0 (select (arr!45842 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!149863 (validMask!0 mask!2987)))

(assert (=> d!149863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45842 a!2938) startIndex!16) mask!2987) (select (arr!45842 a!2938) startIndex!16) a!2938 mask!2987) lt!610291)))

(declare-fun b!1388346 () Bool)

(assert (=> b!1388346 (and (bvsge (index!43113 lt!610291) #b00000000000000000000000000000000) (bvslt (index!43113 lt!610291) (size!46392 a!2938)))))

(assert (=> b!1388346 (= e!786460 (= (select (arr!45842 a!2938) (index!43113 lt!610291)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388347 () Bool)

(assert (=> b!1388347 (= e!786461 (Intermediate!10185 true (toIndex!0 (select (arr!45842 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(assert (= (and d!149863 c!129257) b!1388347))

(assert (= (and d!149863 (not c!129257)) b!1388342))

(assert (= (and b!1388342 c!129256) b!1388339))

(assert (= (and b!1388342 (not c!129256)) b!1388341))

(assert (= (and d!149863 c!129258) b!1388340))

(assert (= (and d!149863 (not c!129258)) b!1388343))

(assert (= (and b!1388343 res!928711) b!1388344))

(assert (= (and b!1388344 (not res!928713)) b!1388345))

(assert (= (and b!1388345 (not res!928712)) b!1388346))

(declare-fun m!1274073 () Bool)

(assert (=> b!1388344 m!1274073))

(assert (=> b!1388346 m!1274073))

(assert (=> b!1388341 m!1273817))

(declare-fun m!1274075 () Bool)

(assert (=> b!1388341 m!1274075))

(assert (=> b!1388341 m!1274075))

(assert (=> b!1388341 m!1273555))

(declare-fun m!1274077 () Bool)

(assert (=> b!1388341 m!1274077))

(assert (=> d!149863 m!1273817))

(declare-fun m!1274079 () Bool)

(assert (=> d!149863 m!1274079))

(assert (=> d!149863 m!1273573))

(assert (=> b!1388345 m!1274073))

(assert (=> d!149789 d!149863))

(declare-fun d!149877 () Bool)

(declare-fun lt!610301 () (_ BitVec 32))

(declare-fun lt!610300 () (_ BitVec 32))

(assert (=> d!149877 (= lt!610301 (bvmul (bvxor lt!610300 (bvlshr lt!610300 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149877 (= lt!610300 ((_ extract 31 0) (bvand (bvxor (select (arr!45842 a!2938) startIndex!16) (bvlshr (select (arr!45842 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149877 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928714 (let ((h!33582 ((_ extract 31 0) (bvand (bvxor (select (arr!45842 a!2938) startIndex!16) (bvlshr (select (arr!45842 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124739 (bvmul (bvxor h!33582 (bvlshr h!33582 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124739 (bvlshr x!124739 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928714 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928714 #b00000000000000000000000000000000))))))

(assert (=> d!149877 (= (toIndex!0 (select (arr!45842 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!610301 (bvlshr lt!610301 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149789 d!149877))

(assert (=> d!149789 d!149753))

(declare-fun b!1388352 () Bool)

(declare-fun e!786468 () Bool)

(declare-fun e!786469 () Bool)

(assert (=> b!1388352 (= e!786468 e!786469)))

(declare-fun c!129260 () Bool)

(assert (=> b!1388352 (= c!129260 (validKeyInArray!0 (select (arr!45842 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388353 () Bool)

(declare-fun e!786470 () Bool)

(declare-fun call!66630 () Bool)

(assert (=> b!1388353 (= e!786470 call!66630)))

(declare-fun b!1388354 () Bool)

(assert (=> b!1388354 (= e!786469 e!786470)))

(declare-fun lt!610303 () (_ BitVec 64))

(assert (=> b!1388354 (= lt!610303 (select (arr!45842 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!610302 () Unit!46397)

(assert (=> b!1388354 (= lt!610302 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610303 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1388354 (arrayContainsKey!0 a!2938 lt!610303 #b00000000000000000000000000000000)))

(declare-fun lt!610304 () Unit!46397)

(assert (=> b!1388354 (= lt!610304 lt!610302)))

(declare-fun res!928718 () Bool)

(assert (=> b!1388354 (= res!928718 (= (seekEntryOrOpen!0 (select (arr!45842 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10185 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1388354 (=> (not res!928718) (not e!786470))))

(declare-fun bm!66627 () Bool)

(assert (=> bm!66627 (= call!66630 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149881 () Bool)

(declare-fun res!928717 () Bool)

(assert (=> d!149881 (=> res!928717 e!786468)))

(assert (=> d!149881 (= res!928717 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46392 a!2938)))))

(assert (=> d!149881 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!786468)))

(declare-fun b!1388355 () Bool)

(assert (=> b!1388355 (= e!786469 call!66630)))

(assert (= (and d!149881 (not res!928717)) b!1388352))

(assert (= (and b!1388352 c!129260) b!1388354))

(assert (= (and b!1388352 (not c!129260)) b!1388355))

(assert (= (and b!1388354 res!928718) b!1388353))

(assert (= (or b!1388353 b!1388355) bm!66627))

(declare-fun m!1274093 () Bool)

(assert (=> b!1388352 m!1274093))

(assert (=> b!1388352 m!1274093))

(declare-fun m!1274095 () Bool)

(assert (=> b!1388352 m!1274095))

(assert (=> b!1388354 m!1274093))

(declare-fun m!1274097 () Bool)

(assert (=> b!1388354 m!1274097))

(declare-fun m!1274099 () Bool)

(assert (=> b!1388354 m!1274099))

(assert (=> b!1388354 m!1274093))

(declare-fun m!1274101 () Bool)

(assert (=> b!1388354 m!1274101))

(declare-fun m!1274103 () Bool)

(assert (=> bm!66627 m!1274103))

(assert (=> bm!66619 d!149881))

(declare-fun d!149885 () Bool)

(assert (=> d!149885 (arrayContainsKey!0 a!2938 lt!610172 #b00000000000000000000000000000000)))

(declare-fun lt!610305 () Unit!46397)

(assert (=> d!149885 (= lt!610305 (choose!13 a!2938 lt!610172 startIndex!16))))

(assert (=> d!149885 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149885 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610172 startIndex!16) lt!610305)))

(declare-fun bs!40351 () Bool)

(assert (= bs!40351 d!149885))

(assert (=> bs!40351 m!1273769))

(declare-fun m!1274105 () Bool)

(assert (=> bs!40351 m!1274105))

(assert (=> b!1388086 d!149885))

(declare-fun d!149887 () Bool)

(declare-fun res!928719 () Bool)

(declare-fun e!786471 () Bool)

(assert (=> d!149887 (=> res!928719 e!786471)))

(assert (=> d!149887 (= res!928719 (= (select (arr!45842 a!2938) #b00000000000000000000000000000000) lt!610172))))

(assert (=> d!149887 (= (arrayContainsKey!0 a!2938 lt!610172 #b00000000000000000000000000000000) e!786471)))

(declare-fun b!1388356 () Bool)

(declare-fun e!786472 () Bool)

(assert (=> b!1388356 (= e!786471 e!786472)))

(declare-fun res!928720 () Bool)

(assert (=> b!1388356 (=> (not res!928720) (not e!786472))))

(assert (=> b!1388356 (= res!928720 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46392 a!2938)))))

(declare-fun b!1388357 () Bool)

(assert (=> b!1388357 (= e!786472 (arrayContainsKey!0 a!2938 lt!610172 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149887 (not res!928719)) b!1388356))

(assert (= (and b!1388356 res!928720) b!1388357))

(assert (=> d!149887 m!1273733))

(declare-fun m!1274107 () Bool)

(assert (=> b!1388357 m!1274107))

(assert (=> b!1388086 d!149887))

(assert (=> b!1388086 d!149789))

(assert (=> b!1388142 d!149807))

(assert (=> b!1388084 d!149743))

(assert (=> d!149771 d!149781))

(declare-fun d!149889 () Bool)

(assert (=> d!149889 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149889 true))

(declare-fun _$72!140 () Unit!46397)

(assert (=> d!149889 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!140)))

(declare-fun bs!40352 () Bool)

(assert (= bs!40352 d!149889))

(assert (=> bs!40352 m!1273559))

(assert (=> d!149771 d!149889))

(assert (=> d!149771 d!149753))

(declare-fun d!149893 () Bool)

(assert (=> d!149893 (= (validKeyInArray!0 (select (arr!45842 lt!610083) startIndex!16)) (and (not (= (select (arr!45842 lt!610083) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45842 lt!610083) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388027 d!149893))

(declare-fun b!1388364 () Bool)

(declare-fun e!786480 () Bool)

(declare-fun e!786481 () Bool)

(assert (=> b!1388364 (= e!786480 e!786481)))

(declare-fun c!129261 () Bool)

(assert (=> b!1388364 (= c!129261 (validKeyInArray!0 (select (arr!45842 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388365 () Bool)

(declare-fun e!786479 () Bool)

(assert (=> b!1388365 (= e!786479 (contains!9750 (ite c!129159 (Cons!32366 (select (arr!45842 a!2938) #b00000000000000000000000000000000) Nil!32367) Nil!32367) (select (arr!45842 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388366 () Bool)

(declare-fun e!786482 () Bool)

(assert (=> b!1388366 (= e!786482 e!786480)))

(declare-fun res!928729 () Bool)

(assert (=> b!1388366 (=> (not res!928729) (not e!786480))))

(assert (=> b!1388366 (= res!928729 (not e!786479))))

(declare-fun res!928727 () Bool)

(assert (=> b!1388366 (=> (not res!928727) (not e!786479))))

(assert (=> b!1388366 (= res!928727 (validKeyInArray!0 (select (arr!45842 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388367 () Bool)

(declare-fun call!66631 () Bool)

(assert (=> b!1388367 (= e!786481 call!66631)))

(declare-fun bm!66628 () Bool)

(assert (=> bm!66628 (= call!66631 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129261 (Cons!32366 (select (arr!45842 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!129159 (Cons!32366 (select (arr!45842 a!2938) #b00000000000000000000000000000000) Nil!32367) Nil!32367)) (ite c!129159 (Cons!32366 (select (arr!45842 a!2938) #b00000000000000000000000000000000) Nil!32367) Nil!32367))))))

(declare-fun b!1388368 () Bool)

(assert (=> b!1388368 (= e!786481 call!66631)))

(declare-fun d!149895 () Bool)

(declare-fun res!928728 () Bool)

(assert (=> d!149895 (=> res!928728 e!786482)))

(assert (=> d!149895 (= res!928728 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46392 a!2938)))))

(assert (=> d!149895 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129159 (Cons!32366 (select (arr!45842 a!2938) #b00000000000000000000000000000000) Nil!32367) Nil!32367)) e!786482)))

(assert (= (and d!149895 (not res!928728)) b!1388366))

(assert (= (and b!1388366 res!928727) b!1388365))

(assert (= (and b!1388366 res!928729) b!1388364))

(assert (= (and b!1388364 c!129261) b!1388368))

(assert (= (and b!1388364 (not c!129261)) b!1388367))

(assert (= (or b!1388368 b!1388367) bm!66628))

(assert (=> b!1388364 m!1274093))

(assert (=> b!1388364 m!1274093))

(assert (=> b!1388364 m!1274095))

(assert (=> b!1388365 m!1274093))

(assert (=> b!1388365 m!1274093))

(declare-fun m!1274115 () Bool)

(assert (=> b!1388365 m!1274115))

(assert (=> b!1388366 m!1274093))

(assert (=> b!1388366 m!1274093))

(assert (=> b!1388366 m!1274095))

(assert (=> bm!66628 m!1274093))

(declare-fun m!1274117 () Bool)

(assert (=> bm!66628 m!1274117))

(assert (=> bm!66616 d!149895))

(declare-fun e!786486 () SeekEntryResult!10185)

(declare-fun b!1388369 () Bool)

(assert (=> b!1388369 (= e!786486 (Intermediate!10185 false (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388370 () Bool)

(declare-fun e!786487 () Bool)

(declare-fun lt!610309 () SeekEntryResult!10185)

(assert (=> b!1388370 (= e!786487 (bvsge (x!124731 lt!610309) #b01111111111111111111111111111110))))

(declare-fun b!1388371 () Bool)

(assert (=> b!1388371 (= e!786486 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987))))

(declare-fun b!1388372 () Bool)

(declare-fun e!786484 () SeekEntryResult!10185)

(assert (=> b!1388372 (= e!786484 e!786486)))

(declare-fun c!129262 () Bool)

(declare-fun lt!610310 () (_ BitVec 64))

(assert (=> b!1388372 (= c!129262 (or (= lt!610310 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!610310 lt!610310) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388373 () Bool)

(declare-fun e!786485 () Bool)

(assert (=> b!1388373 (= e!786487 e!786485)))

(declare-fun res!928730 () Bool)

(assert (=> b!1388373 (= res!928730 (and (is-Intermediate!10185 lt!610309) (not (undefined!10997 lt!610309)) (bvslt (x!124731 lt!610309) #b01111111111111111111111111111110) (bvsge (x!124731 lt!610309) #b00000000000000000000000000000000) (bvsge (x!124731 lt!610309) #b00000000000000000000000000000000)))))

(assert (=> b!1388373 (=> (not res!928730) (not e!786485))))

(declare-fun b!1388374 () Bool)

(assert (=> b!1388374 (and (bvsge (index!43113 lt!610309) #b00000000000000000000000000000000) (bvslt (index!43113 lt!610309) (size!46392 lt!610083)))))

(declare-fun res!928732 () Bool)

(assert (=> b!1388374 (= res!928732 (= (select (arr!45842 lt!610083) (index!43113 lt!610309)) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun e!786483 () Bool)

(assert (=> b!1388374 (=> res!928732 e!786483)))

(assert (=> b!1388374 (= e!786485 e!786483)))

(declare-fun b!1388375 () Bool)

(assert (=> b!1388375 (and (bvsge (index!43113 lt!610309) #b00000000000000000000000000000000) (bvslt (index!43113 lt!610309) (size!46392 lt!610083)))))

(declare-fun res!928731 () Bool)

(assert (=> b!1388375 (= res!928731 (= (select (arr!45842 lt!610083) (index!43113 lt!610309)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388375 (=> res!928731 e!786483)))

(declare-fun d!149897 () Bool)

(assert (=> d!149897 e!786487))

(declare-fun c!129264 () Bool)

(assert (=> d!149897 (= c!129264 (and (is-Intermediate!10185 lt!610309) (undefined!10997 lt!610309)))))

(assert (=> d!149897 (= lt!610309 e!786484)))

(declare-fun c!129263 () Bool)

(assert (=> d!149897 (= c!129263 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!149897 (= lt!610310 (select (arr!45842 lt!610083) (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149897 (validMask!0 mask!2987)))

(assert (=> d!149897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610083 mask!2987) lt!610309)))

(declare-fun b!1388376 () Bool)

(assert (=> b!1388376 (and (bvsge (index!43113 lt!610309) #b00000000000000000000000000000000) (bvslt (index!43113 lt!610309) (size!46392 lt!610083)))))

(assert (=> b!1388376 (= e!786483 (= (select (arr!45842 lt!610083) (index!43113 lt!610309)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388377 () Bool)

(assert (=> b!1388377 (= e!786484 (Intermediate!10185 true (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(assert (= (and d!149897 c!129263) b!1388377))

(assert (= (and d!149897 (not c!129263)) b!1388372))

(assert (= (and b!1388372 c!129262) b!1388369))

(assert (= (and b!1388372 (not c!129262)) b!1388371))

(assert (= (and d!149897 c!129264) b!1388370))

(assert (= (and d!149897 (not c!129264)) b!1388373))

(assert (= (and b!1388373 res!928730) b!1388374))

(assert (= (and b!1388374 (not res!928732)) b!1388375))

(assert (= (and b!1388375 (not res!928731)) b!1388376))

(declare-fun m!1274119 () Bool)

(assert (=> b!1388374 m!1274119))

(assert (=> b!1388376 m!1274119))

(assert (=> b!1388371 m!1273831))

(declare-fun m!1274121 () Bool)

(assert (=> b!1388371 m!1274121))

(assert (=> b!1388371 m!1274121))

(assert (=> b!1388371 m!1273547))

(declare-fun m!1274123 () Bool)

(assert (=> b!1388371 m!1274123))

(assert (=> d!149897 m!1273831))

(declare-fun m!1274125 () Bool)

(assert (=> d!149897 m!1274125))

(assert (=> d!149897 m!1273573))

(assert (=> b!1388375 m!1274119))

(assert (=> d!149795 d!149897))

(declare-fun d!149901 () Bool)

(declare-fun lt!610312 () (_ BitVec 32))

(declare-fun lt!610311 () (_ BitVec 32))

(assert (=> d!149901 (= lt!610312 (bvmul (bvxor lt!610311 (bvlshr lt!610311 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149901 (= lt!610311 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149901 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928714 (let ((h!33582 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124739 (bvmul (bvxor h!33582 (bvlshr h!33582 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124739 (bvlshr x!124739 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928714 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928714 #b00000000000000000000000000000000))))))

(assert (=> d!149901 (= (toIndex!0 (select (store (arr!45842 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!610312 (bvlshr lt!610312 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149795 d!149901))

(assert (=> d!149795 d!149753))

(push 1)

(assert (not b!1388273))

(assert (not d!149805))

(assert (not d!149803))

(assert (not b!1388163))

(assert (not bm!66627))

(assert (not b!1388364))

(assert (not b!1388172))

(assert (not b!1388366))

(assert (not bm!66628))

(assert (not b!1388266))

(assert (not b!1388365))

(assert (not b!1388261))

(assert (not b!1388357))

(assert (not b!1388275))

(assert (not d!149857))

(assert (not b!1388190))

(assert (not d!149817))

(assert (not b!1388193))

(assert (not b!1388352))

(assert (not d!149809))

(assert (not d!149897))

(assert (not b!1388371))

(assert (not b!1388252))

(assert (not d!149855))

(assert (not b!1388271))

(assert (not d!149823))

(assert (not d!149815))

(assert (not d!149851))

(assert (not b!1388258))

(assert (not b!1388354))

(assert (not d!149863))

(assert (not d!149889))

(assert (not bm!66622))

(assert (not bm!66623))

(assert (not b!1388277))

(assert (not d!149885))

(assert (not b!1388341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

