; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118640 () Bool)

(assert start!118640)

(declare-datatypes ((array!94869 0))(
  ( (array!94870 (arr!45811 (Array (_ BitVec 32) (_ BitVec 64))) (size!46363 (_ BitVec 32))) )
))
(declare-fun lt!609532 () array!94869)

(declare-fun e!785681 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun b!1387062 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94869 (_ BitVec 32)) Bool)

(assert (=> b!1387062 (= e!785681 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609532 mask!2987)))))

(assert (=> b!1387062 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609532 mask!2987)))

(declare-fun a!2938 () array!94869)

(declare-datatypes ((Unit!46224 0))(
  ( (Unit!46225) )
))
(declare-fun lt!609531 () Unit!46224)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> b!1387062 (= lt!609531 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1387063 () Bool)

(declare-fun res!928156 () Bool)

(declare-fun e!785682 () Bool)

(assert (=> b!1387063 (=> (not res!928156) (not e!785682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387063 (= res!928156 (validKeyInArray!0 (select (arr!45811 a!2938) i!1065)))))

(declare-fun b!1387064 () Bool)

(declare-fun res!928157 () Bool)

(assert (=> b!1387064 (=> (not res!928157) (not e!785682))))

(assert (=> b!1387064 (= res!928157 (and (not (= (select (arr!45811 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45811 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387065 () Bool)

(declare-fun e!785680 () Bool)

(assert (=> b!1387065 (= e!785680 (validKeyInArray!0 (select (arr!45811 a!2938) startIndex!16)))))

(declare-fun b!1387066 () Bool)

(declare-fun e!785683 () Unit!46224)

(declare-fun lt!609529 () Unit!46224)

(assert (=> b!1387066 (= e!785683 lt!609529)))

(declare-fun lt!609533 () Unit!46224)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> b!1387066 (= lt!609533 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10180 0))(
  ( (MissingZero!10180 (index!43091 (_ BitVec 32))) (Found!10180 (index!43092 (_ BitVec 32))) (Intermediate!10180 (undefined!10992 Bool) (index!43093 (_ BitVec 32)) (x!124698 (_ BitVec 32))) (Undefined!10180) (MissingVacant!10180 (index!43094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94869 (_ BitVec 32)) SeekEntryResult!10180)

(assert (=> b!1387066 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> b!1387066 (= lt!609529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387066 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387067 () Bool)

(declare-fun res!928154 () Bool)

(assert (=> b!1387067 (=> (not res!928154) (not e!785682))))

(assert (=> b!1387067 (= res!928154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!928153 () Bool)

(assert (=> start!118640 (=> (not res!928153) (not e!785682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118640 (= res!928153 (validMask!0 mask!2987))))

(assert (=> start!118640 e!785682))

(assert (=> start!118640 true))

(declare-fun array_inv!35044 (array!94869) Bool)

(assert (=> start!118640 (array_inv!35044 a!2938)))

(declare-fun b!1387068 () Bool)

(declare-fun Unit!46226 () Unit!46224)

(assert (=> b!1387068 (= e!785683 Unit!46226)))

(declare-fun b!1387069 () Bool)

(declare-fun res!928159 () Bool)

(assert (=> b!1387069 (=> (not res!928159) (not e!785682))))

(assert (=> b!1387069 (= res!928159 (and (= (size!46363 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46363 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46363 a!2938))))))

(declare-fun b!1387070 () Bool)

(assert (=> b!1387070 (= e!785682 e!785681)))

(declare-fun res!928155 () Bool)

(assert (=> b!1387070 (=> (not res!928155) (not e!785681))))

(assert (=> b!1387070 (= res!928155 (and (bvslt startIndex!16 (bvsub (size!46363 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609530 () Unit!46224)

(assert (=> b!1387070 (= lt!609530 e!785683)))

(declare-fun c!128897 () Bool)

(assert (=> b!1387070 (= c!128897 e!785680)))

(declare-fun res!928158 () Bool)

(assert (=> b!1387070 (=> (not res!928158) (not e!785680))))

(assert (=> b!1387070 (= res!928158 (not (= startIndex!16 i!1065)))))

(assert (=> b!1387070 (= lt!609532 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)))))

(declare-fun b!1387071 () Bool)

(declare-fun res!928160 () Bool)

(assert (=> b!1387071 (=> (not res!928160) (not e!785682))))

(declare-datatypes ((List!32417 0))(
  ( (Nil!32414) (Cons!32413 (h!33622 (_ BitVec 64)) (t!47103 List!32417)) )
))
(declare-fun arrayNoDuplicates!0 (array!94869 (_ BitVec 32) List!32417) Bool)

(assert (=> b!1387071 (= res!928160 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32414))))

(assert (= (and start!118640 res!928153) b!1387069))

(assert (= (and b!1387069 res!928159) b!1387063))

(assert (= (and b!1387063 res!928156) b!1387071))

(assert (= (and b!1387071 res!928160) b!1387067))

(assert (= (and b!1387067 res!928154) b!1387064))

(assert (= (and b!1387064 res!928157) b!1387070))

(assert (= (and b!1387070 res!928158) b!1387065))

(assert (= (and b!1387070 c!128897) b!1387066))

(assert (= (and b!1387070 (not c!128897)) b!1387068))

(assert (= (and b!1387070 res!928155) b!1387062))

(declare-fun m!1272069 () Bool)

(assert (=> b!1387065 m!1272069))

(assert (=> b!1387065 m!1272069))

(declare-fun m!1272071 () Bool)

(assert (=> b!1387065 m!1272071))

(declare-fun m!1272073 () Bool)

(assert (=> start!118640 m!1272073))

(declare-fun m!1272075 () Bool)

(assert (=> start!118640 m!1272075))

(declare-fun m!1272077 () Bool)

(assert (=> b!1387071 m!1272077))

(declare-fun m!1272079 () Bool)

(assert (=> b!1387070 m!1272079))

(declare-fun m!1272081 () Bool)

(assert (=> b!1387066 m!1272081))

(declare-fun m!1272083 () Bool)

(assert (=> b!1387066 m!1272083))

(assert (=> b!1387066 m!1272079))

(declare-fun m!1272085 () Bool)

(assert (=> b!1387066 m!1272085))

(assert (=> b!1387066 m!1272083))

(declare-fun m!1272087 () Bool)

(assert (=> b!1387066 m!1272087))

(assert (=> b!1387066 m!1272069))

(declare-fun m!1272089 () Bool)

(assert (=> b!1387066 m!1272089))

(assert (=> b!1387066 m!1272069))

(declare-fun m!1272091 () Bool)

(assert (=> b!1387066 m!1272091))

(declare-fun m!1272093 () Bool)

(assert (=> b!1387062 m!1272093))

(declare-fun m!1272095 () Bool)

(assert (=> b!1387062 m!1272095))

(declare-fun m!1272097 () Bool)

(assert (=> b!1387062 m!1272097))

(declare-fun m!1272099 () Bool)

(assert (=> b!1387067 m!1272099))

(declare-fun m!1272101 () Bool)

(assert (=> b!1387063 m!1272101))

(assert (=> b!1387063 m!1272101))

(declare-fun m!1272103 () Bool)

(assert (=> b!1387063 m!1272103))

(assert (=> b!1387064 m!1272101))

(check-sat (not b!1387066) (not b!1387071) (not b!1387063) (not start!118640) (not b!1387067) (not b!1387062) (not b!1387065))
(check-sat)
(get-model)

(declare-fun d!149333 () Bool)

(assert (=> d!149333 (= (validKeyInArray!0 (select (arr!45811 a!2938) i!1065)) (and (not (= (select (arr!45811 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45811 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387063 d!149333))

(declare-fun d!149335 () Bool)

(assert (=> d!149335 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118640 d!149335))

(declare-fun d!149337 () Bool)

(assert (=> d!149337 (= (array_inv!35044 a!2938) (bvsge (size!46363 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118640 d!149337))

(declare-fun d!149339 () Bool)

(assert (=> d!149339 (= (validKeyInArray!0 (select (arr!45811 a!2938) startIndex!16)) (and (not (= (select (arr!45811 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45811 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387065 d!149339))

(declare-fun b!1387142 () Bool)

(declare-fun e!785725 () Bool)

(declare-fun call!66537 () Bool)

(assert (=> b!1387142 (= e!785725 call!66537)))

(declare-fun b!1387143 () Bool)

(assert (=> b!1387143 (= e!785725 call!66537)))

(declare-fun b!1387144 () Bool)

(declare-fun e!785723 () Bool)

(declare-fun contains!9706 (List!32417 (_ BitVec 64)) Bool)

(assert (=> b!1387144 (= e!785723 (contains!9706 Nil!32414 (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(declare-fun d!149341 () Bool)

(declare-fun res!928215 () Bool)

(declare-fun e!785722 () Bool)

(assert (=> d!149341 (=> res!928215 e!785722)))

(assert (=> d!149341 (= res!928215 (bvsge #b00000000000000000000000000000000 (size!46363 a!2938)))))

(assert (=> d!149341 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32414) e!785722)))

(declare-fun b!1387145 () Bool)

(declare-fun e!785724 () Bool)

(assert (=> b!1387145 (= e!785724 e!785725)))

(declare-fun c!128906 () Bool)

(assert (=> b!1387145 (= c!128906 (validKeyInArray!0 (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66534 () Bool)

(assert (=> bm!66534 (= call!66537 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128906 (Cons!32413 (select (arr!45811 a!2938) #b00000000000000000000000000000000) Nil!32414) Nil!32414)))))

(declare-fun b!1387146 () Bool)

(assert (=> b!1387146 (= e!785722 e!785724)))

(declare-fun res!928217 () Bool)

(assert (=> b!1387146 (=> (not res!928217) (not e!785724))))

(assert (=> b!1387146 (= res!928217 (not e!785723))))

(declare-fun res!928216 () Bool)

(assert (=> b!1387146 (=> (not res!928216) (not e!785723))))

(assert (=> b!1387146 (= res!928216 (validKeyInArray!0 (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149341 (not res!928215)) b!1387146))

(assert (= (and b!1387146 res!928216) b!1387144))

(assert (= (and b!1387146 res!928217) b!1387145))

(assert (= (and b!1387145 c!128906) b!1387142))

(assert (= (and b!1387145 (not c!128906)) b!1387143))

(assert (= (or b!1387142 b!1387143) bm!66534))

(declare-fun m!1272177 () Bool)

(assert (=> b!1387144 m!1272177))

(assert (=> b!1387144 m!1272177))

(declare-fun m!1272179 () Bool)

(assert (=> b!1387144 m!1272179))

(assert (=> b!1387145 m!1272177))

(assert (=> b!1387145 m!1272177))

(declare-fun m!1272181 () Bool)

(assert (=> b!1387145 m!1272181))

(assert (=> bm!66534 m!1272177))

(declare-fun m!1272183 () Bool)

(assert (=> bm!66534 m!1272183))

(assert (=> b!1387146 m!1272177))

(assert (=> b!1387146 m!1272177))

(assert (=> b!1387146 m!1272181))

(assert (=> b!1387071 d!149341))

(declare-fun d!149345 () Bool)

(assert (=> d!149345 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!609569 () Unit!46224)

(declare-fun choose!38 (array!94869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> d!149345 (= lt!609569 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149345 (validMask!0 mask!2987)))

(assert (=> d!149345 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!609569)))

(declare-fun bs!40283 () Bool)

(assert (= bs!40283 d!149345))

(assert (=> bs!40283 m!1272091))

(declare-fun m!1272187 () Bool)

(assert (=> bs!40283 m!1272187))

(assert (=> bs!40283 m!1272073))

(assert (=> b!1387066 d!149345))

(declare-fun bm!66540 () Bool)

(declare-fun call!66543 () Bool)

(assert (=> bm!66540 (= call!66543 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149349 () Bool)

(declare-fun res!928229 () Bool)

(declare-fun e!785743 () Bool)

(assert (=> d!149349 (=> res!928229 e!785743)))

(assert (=> d!149349 (= res!928229 (bvsge startIndex!16 (size!46363 a!2938)))))

(assert (=> d!149349 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!785743)))

(declare-fun b!1387167 () Bool)

(declare-fun e!785742 () Bool)

(assert (=> b!1387167 (= e!785743 e!785742)))

(declare-fun c!128912 () Bool)

(assert (=> b!1387167 (= c!128912 (validKeyInArray!0 (select (arr!45811 a!2938) startIndex!16)))))

(declare-fun b!1387168 () Bool)

(declare-fun e!785741 () Bool)

(assert (=> b!1387168 (= e!785742 e!785741)))

(declare-fun lt!609586 () (_ BitVec 64))

(assert (=> b!1387168 (= lt!609586 (select (arr!45811 a!2938) startIndex!16))))

(declare-fun lt!609585 () Unit!46224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94869 (_ BitVec 64) (_ BitVec 32)) Unit!46224)

(assert (=> b!1387168 (= lt!609585 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609586 startIndex!16))))

(declare-fun arrayContainsKey!0 (array!94869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1387168 (arrayContainsKey!0 a!2938 lt!609586 #b00000000000000000000000000000000)))

(declare-fun lt!609587 () Unit!46224)

(assert (=> b!1387168 (= lt!609587 lt!609585)))

(declare-fun res!928228 () Bool)

(assert (=> b!1387168 (= res!928228 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) (Found!10180 startIndex!16)))))

(assert (=> b!1387168 (=> (not res!928228) (not e!785741))))

(declare-fun b!1387169 () Bool)

(assert (=> b!1387169 (= e!785741 call!66543)))

(declare-fun b!1387170 () Bool)

(assert (=> b!1387170 (= e!785742 call!66543)))

(assert (= (and d!149349 (not res!928229)) b!1387167))

(assert (= (and b!1387167 c!128912) b!1387168))

(assert (= (and b!1387167 (not c!128912)) b!1387170))

(assert (= (and b!1387168 res!928228) b!1387169))

(assert (= (or b!1387169 b!1387170) bm!66540))

(declare-fun m!1272195 () Bool)

(assert (=> bm!66540 m!1272195))

(assert (=> b!1387167 m!1272069))

(assert (=> b!1387167 m!1272069))

(assert (=> b!1387167 m!1272071))

(assert (=> b!1387168 m!1272069))

(declare-fun m!1272197 () Bool)

(assert (=> b!1387168 m!1272197))

(declare-fun m!1272199 () Bool)

(assert (=> b!1387168 m!1272199))

(assert (=> b!1387168 m!1272069))

(assert (=> b!1387168 m!1272089))

(assert (=> b!1387066 d!149349))

(declare-fun lt!609611 () SeekEntryResult!10180)

(declare-fun d!149357 () Bool)

(get-info :version)

(assert (=> d!149357 (and (or ((_ is Undefined!10180) lt!609611) (not ((_ is Found!10180) lt!609611)) (and (bvsge (index!43092 lt!609611) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609611) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609611) ((_ is Found!10180) lt!609611) (not ((_ is MissingZero!10180) lt!609611)) (and (bvsge (index!43091 lt!609611) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609611) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609611) ((_ is Found!10180) lt!609611) ((_ is MissingZero!10180) lt!609611) (not ((_ is MissingVacant!10180) lt!609611)) (and (bvsge (index!43094 lt!609611) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609611) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609611) (ite ((_ is Found!10180) lt!609611) (= (select (arr!45811 lt!609532) (index!43092 lt!609611)) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609611) (= (select (arr!45811 lt!609532) (index!43091 lt!609611)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609611) (= (select (arr!45811 lt!609532) (index!43094 lt!609611)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!785762 () SeekEntryResult!10180)

(assert (=> d!149357 (= lt!609611 e!785762)))

(declare-fun c!128924 () Bool)

(declare-fun lt!609610 () SeekEntryResult!10180)

(assert (=> d!149357 (= c!128924 (and ((_ is Intermediate!10180) lt!609610) (undefined!10992 lt!609610)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94869 (_ BitVec 32)) SeekEntryResult!10180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149357 (= lt!609610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987))))

(assert (=> d!149357 (validMask!0 mask!2987)))

(assert (=> d!149357 (= (seekEntryOrOpen!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987) lt!609611)))

(declare-fun b!1387198 () Bool)

(declare-fun e!785764 () SeekEntryResult!10180)

(assert (=> b!1387198 (= e!785762 e!785764)))

(declare-fun lt!609609 () (_ BitVec 64))

(assert (=> b!1387198 (= lt!609609 (select (arr!45811 lt!609532) (index!43093 lt!609610)))))

(declare-fun c!128923 () Bool)

(assert (=> b!1387198 (= c!128923 (= lt!609609 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387199 () Bool)

(assert (=> b!1387199 (= e!785762 Undefined!10180)))

(declare-fun b!1387200 () Bool)

(declare-fun e!785763 () SeekEntryResult!10180)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94869 (_ BitVec 32)) SeekEntryResult!10180)

(assert (=> b!1387200 (= e!785763 (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609610) (index!43093 lt!609610) (index!43093 lt!609610) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987))))

(declare-fun b!1387201 () Bool)

(declare-fun c!128922 () Bool)

(assert (=> b!1387201 (= c!128922 (= lt!609609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387201 (= e!785764 e!785763)))

(declare-fun b!1387202 () Bool)

(assert (=> b!1387202 (= e!785763 (MissingZero!10180 (index!43093 lt!609610)))))

(declare-fun b!1387203 () Bool)

(assert (=> b!1387203 (= e!785764 (Found!10180 (index!43093 lt!609610)))))

(assert (= (and d!149357 c!128924) b!1387199))

(assert (= (and d!149357 (not c!128924)) b!1387198))

(assert (= (and b!1387198 c!128923) b!1387203))

(assert (= (and b!1387198 (not c!128923)) b!1387201))

(assert (= (and b!1387201 c!128922) b!1387202))

(assert (= (and b!1387201 (not c!128922)) b!1387200))

(declare-fun m!1272213 () Bool)

(assert (=> d!149357 m!1272213))

(declare-fun m!1272215 () Bool)

(assert (=> d!149357 m!1272215))

(assert (=> d!149357 m!1272083))

(declare-fun m!1272217 () Bool)

(assert (=> d!149357 m!1272217))

(assert (=> d!149357 m!1272217))

(assert (=> d!149357 m!1272083))

(declare-fun m!1272219 () Bool)

(assert (=> d!149357 m!1272219))

(assert (=> d!149357 m!1272073))

(declare-fun m!1272221 () Bool)

(assert (=> d!149357 m!1272221))

(declare-fun m!1272223 () Bool)

(assert (=> b!1387198 m!1272223))

(assert (=> b!1387200 m!1272083))

(declare-fun m!1272225 () Bool)

(assert (=> b!1387200 m!1272225))

(assert (=> b!1387066 d!149357))

(declare-fun d!149369 () Bool)

(declare-fun e!785785 () Bool)

(assert (=> d!149369 e!785785))

(declare-fun res!928246 () Bool)

(assert (=> d!149369 (=> (not res!928246) (not e!785785))))

(assert (=> d!149369 (= res!928246 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46363 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46363 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46363 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46363 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46363 a!2938))))))

(declare-fun lt!609632 () Unit!46224)

(declare-fun choose!14 (array!94869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> d!149369 (= lt!609632 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149369 (validMask!0 mask!2987)))

(assert (=> d!149369 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!609632)))

(declare-fun b!1387237 () Bool)

(assert (=> b!1387237 (= e!785785 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987)))))

(assert (= (and d!149369 res!928246) b!1387237))

(declare-fun m!1272271 () Bool)

(assert (=> d!149369 m!1272271))

(assert (=> d!149369 m!1272073))

(assert (=> b!1387237 m!1272083))

(declare-fun m!1272273 () Bool)

(assert (=> b!1387237 m!1272273))

(assert (=> b!1387237 m!1272069))

(assert (=> b!1387237 m!1272083))

(assert (=> b!1387237 m!1272079))

(assert (=> b!1387237 m!1272069))

(assert (=> b!1387237 m!1272089))

(assert (=> b!1387066 d!149369))

(declare-fun d!149381 () Bool)

(declare-fun lt!609635 () SeekEntryResult!10180)

(assert (=> d!149381 (and (or ((_ is Undefined!10180) lt!609635) (not ((_ is Found!10180) lt!609635)) (and (bvsge (index!43092 lt!609635) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609635) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609635) ((_ is Found!10180) lt!609635) (not ((_ is MissingZero!10180) lt!609635)) (and (bvsge (index!43091 lt!609635) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609635) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609635) ((_ is Found!10180) lt!609635) ((_ is MissingZero!10180) lt!609635) (not ((_ is MissingVacant!10180) lt!609635)) (and (bvsge (index!43094 lt!609635) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609635) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609635) (ite ((_ is Found!10180) lt!609635) (= (select (arr!45811 a!2938) (index!43092 lt!609635)) (select (arr!45811 a!2938) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609635) (= (select (arr!45811 a!2938) (index!43091 lt!609635)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609635) (= (select (arr!45811 a!2938) (index!43094 lt!609635)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!785786 () SeekEntryResult!10180)

(assert (=> d!149381 (= lt!609635 e!785786)))

(declare-fun c!128940 () Bool)

(declare-fun lt!609634 () SeekEntryResult!10180)

(assert (=> d!149381 (= c!128940 (and ((_ is Intermediate!10180) lt!609634) (undefined!10992 lt!609634)))))

(assert (=> d!149381 (= lt!609634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45811 a!2938) startIndex!16) mask!2987) (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149381 (validMask!0 mask!2987)))

(assert (=> d!149381 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) lt!609635)))

(declare-fun b!1387238 () Bool)

(declare-fun e!785788 () SeekEntryResult!10180)

(assert (=> b!1387238 (= e!785786 e!785788)))

(declare-fun lt!609633 () (_ BitVec 64))

(assert (=> b!1387238 (= lt!609633 (select (arr!45811 a!2938) (index!43093 lt!609634)))))

(declare-fun c!128939 () Bool)

(assert (=> b!1387238 (= c!128939 (= lt!609633 (select (arr!45811 a!2938) startIndex!16)))))

(declare-fun b!1387239 () Bool)

(assert (=> b!1387239 (= e!785786 Undefined!10180)))

(declare-fun e!785787 () SeekEntryResult!10180)

(declare-fun b!1387240 () Bool)

(assert (=> b!1387240 (= e!785787 (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609634) (index!43093 lt!609634) (index!43093 lt!609634) (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387241 () Bool)

(declare-fun c!128938 () Bool)

(assert (=> b!1387241 (= c!128938 (= lt!609633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387241 (= e!785788 e!785787)))

(declare-fun b!1387242 () Bool)

(assert (=> b!1387242 (= e!785787 (MissingZero!10180 (index!43093 lt!609634)))))

(declare-fun b!1387243 () Bool)

(assert (=> b!1387243 (= e!785788 (Found!10180 (index!43093 lt!609634)))))

(assert (= (and d!149381 c!128940) b!1387239))

(assert (= (and d!149381 (not c!128940)) b!1387238))

(assert (= (and b!1387238 c!128939) b!1387243))

(assert (= (and b!1387238 (not c!128939)) b!1387241))

(assert (= (and b!1387241 c!128938) b!1387242))

(assert (= (and b!1387241 (not c!128938)) b!1387240))

(declare-fun m!1272275 () Bool)

(assert (=> d!149381 m!1272275))

(declare-fun m!1272277 () Bool)

(assert (=> d!149381 m!1272277))

(assert (=> d!149381 m!1272069))

(declare-fun m!1272279 () Bool)

(assert (=> d!149381 m!1272279))

(assert (=> d!149381 m!1272279))

(assert (=> d!149381 m!1272069))

(declare-fun m!1272281 () Bool)

(assert (=> d!149381 m!1272281))

(assert (=> d!149381 m!1272073))

(declare-fun m!1272283 () Bool)

(assert (=> d!149381 m!1272283))

(declare-fun m!1272285 () Bool)

(assert (=> b!1387238 m!1272285))

(assert (=> b!1387240 m!1272069))

(declare-fun m!1272287 () Bool)

(assert (=> b!1387240 m!1272287))

(assert (=> b!1387066 d!149381))

(declare-fun bm!66545 () Bool)

(declare-fun call!66548 () Bool)

(assert (=> bm!66545 (= call!66548 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149383 () Bool)

(declare-fun res!928248 () Bool)

(declare-fun e!785791 () Bool)

(assert (=> d!149383 (=> res!928248 e!785791)))

(assert (=> d!149383 (= res!928248 (bvsge #b00000000000000000000000000000000 (size!46363 a!2938)))))

(assert (=> d!149383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!785791)))

(declare-fun b!1387244 () Bool)

(declare-fun e!785790 () Bool)

(assert (=> b!1387244 (= e!785791 e!785790)))

(declare-fun c!128941 () Bool)

(assert (=> b!1387244 (= c!128941 (validKeyInArray!0 (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387245 () Bool)

(declare-fun e!785789 () Bool)

(assert (=> b!1387245 (= e!785790 e!785789)))

(declare-fun lt!609637 () (_ BitVec 64))

(assert (=> b!1387245 (= lt!609637 (select (arr!45811 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!609636 () Unit!46224)

(assert (=> b!1387245 (= lt!609636 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609637 #b00000000000000000000000000000000))))

(assert (=> b!1387245 (arrayContainsKey!0 a!2938 lt!609637 #b00000000000000000000000000000000)))

(declare-fun lt!609638 () Unit!46224)

(assert (=> b!1387245 (= lt!609638 lt!609636)))

(declare-fun res!928247 () Bool)

(assert (=> b!1387245 (= res!928247 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10180 #b00000000000000000000000000000000)))))

(assert (=> b!1387245 (=> (not res!928247) (not e!785789))))

(declare-fun b!1387246 () Bool)

(assert (=> b!1387246 (= e!785789 call!66548)))

(declare-fun b!1387247 () Bool)

(assert (=> b!1387247 (= e!785790 call!66548)))

(assert (= (and d!149383 (not res!928248)) b!1387244))

(assert (= (and b!1387244 c!128941) b!1387245))

(assert (= (and b!1387244 (not c!128941)) b!1387247))

(assert (= (and b!1387245 res!928247) b!1387246))

(assert (= (or b!1387246 b!1387247) bm!66545))

(declare-fun m!1272289 () Bool)

(assert (=> bm!66545 m!1272289))

(assert (=> b!1387244 m!1272177))

(assert (=> b!1387244 m!1272177))

(assert (=> b!1387244 m!1272181))

(assert (=> b!1387245 m!1272177))

(declare-fun m!1272291 () Bool)

(assert (=> b!1387245 m!1272291))

(declare-fun m!1272293 () Bool)

(assert (=> b!1387245 m!1272293))

(assert (=> b!1387245 m!1272177))

(declare-fun m!1272295 () Bool)

(assert (=> b!1387245 m!1272295))

(assert (=> b!1387067 d!149383))

(declare-fun bm!66546 () Bool)

(declare-fun call!66549 () Bool)

(assert (=> bm!66546 (= call!66549 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609532 mask!2987))))

(declare-fun d!149385 () Bool)

(declare-fun res!928250 () Bool)

(declare-fun e!785794 () Bool)

(assert (=> d!149385 (=> res!928250 e!785794)))

(assert (=> d!149385 (= res!928250 (bvsge startIndex!16 (size!46363 lt!609532)))))

(assert (=> d!149385 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609532 mask!2987) e!785794)))

(declare-fun b!1387248 () Bool)

(declare-fun e!785793 () Bool)

(assert (=> b!1387248 (= e!785794 e!785793)))

(declare-fun c!128942 () Bool)

(assert (=> b!1387248 (= c!128942 (validKeyInArray!0 (select (arr!45811 lt!609532) startIndex!16)))))

(declare-fun b!1387249 () Bool)

(declare-fun e!785792 () Bool)

(assert (=> b!1387249 (= e!785793 e!785792)))

(declare-fun lt!609640 () (_ BitVec 64))

(assert (=> b!1387249 (= lt!609640 (select (arr!45811 lt!609532) startIndex!16))))

(declare-fun lt!609639 () Unit!46224)

(assert (=> b!1387249 (= lt!609639 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609532 lt!609640 startIndex!16))))

(assert (=> b!1387249 (arrayContainsKey!0 lt!609532 lt!609640 #b00000000000000000000000000000000)))

(declare-fun lt!609641 () Unit!46224)

(assert (=> b!1387249 (= lt!609641 lt!609639)))

(declare-fun res!928249 () Bool)

(assert (=> b!1387249 (= res!928249 (= (seekEntryOrOpen!0 (select (arr!45811 lt!609532) startIndex!16) lt!609532 mask!2987) (Found!10180 startIndex!16)))))

(assert (=> b!1387249 (=> (not res!928249) (not e!785792))))

(declare-fun b!1387250 () Bool)

(assert (=> b!1387250 (= e!785792 call!66549)))

(declare-fun b!1387251 () Bool)

(assert (=> b!1387251 (= e!785793 call!66549)))

(assert (= (and d!149385 (not res!928250)) b!1387248))

(assert (= (and b!1387248 c!128942) b!1387249))

(assert (= (and b!1387248 (not c!128942)) b!1387251))

(assert (= (and b!1387249 res!928249) b!1387250))

(assert (= (or b!1387250 b!1387251) bm!66546))

(declare-fun m!1272297 () Bool)

(assert (=> bm!66546 m!1272297))

(declare-fun m!1272299 () Bool)

(assert (=> b!1387248 m!1272299))

(assert (=> b!1387248 m!1272299))

(declare-fun m!1272301 () Bool)

(assert (=> b!1387248 m!1272301))

(assert (=> b!1387249 m!1272299))

(declare-fun m!1272303 () Bool)

(assert (=> b!1387249 m!1272303))

(declare-fun m!1272305 () Bool)

(assert (=> b!1387249 m!1272305))

(assert (=> b!1387249 m!1272299))

(declare-fun m!1272307 () Bool)

(assert (=> b!1387249 m!1272307))

(assert (=> b!1387062 d!149385))

(declare-fun bm!66547 () Bool)

(declare-fun call!66550 () Bool)

(assert (=> bm!66547 (= call!66550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!609532 mask!2987))))

(declare-fun d!149387 () Bool)

(declare-fun res!928252 () Bool)

(declare-fun e!785797 () Bool)

(assert (=> d!149387 (=> res!928252 e!785797)))

(assert (=> d!149387 (= res!928252 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46363 lt!609532)))))

(assert (=> d!149387 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609532 mask!2987) e!785797)))

(declare-fun b!1387252 () Bool)

(declare-fun e!785796 () Bool)

(assert (=> b!1387252 (= e!785797 e!785796)))

(declare-fun c!128943 () Bool)

(assert (=> b!1387252 (= c!128943 (validKeyInArray!0 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387253 () Bool)

(declare-fun e!785795 () Bool)

(assert (=> b!1387253 (= e!785796 e!785795)))

(declare-fun lt!609643 () (_ BitVec 64))

(assert (=> b!1387253 (= lt!609643 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!609642 () Unit!46224)

(assert (=> b!1387253 (= lt!609642 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609532 lt!609643 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1387253 (arrayContainsKey!0 lt!609532 lt!609643 #b00000000000000000000000000000000)))

(declare-fun lt!609644 () Unit!46224)

(assert (=> b!1387253 (= lt!609644 lt!609642)))

(declare-fun res!928251 () Bool)

(assert (=> b!1387253 (= res!928251 (= (seekEntryOrOpen!0 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609532 mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1387253 (=> (not res!928251) (not e!785795))))

(declare-fun b!1387254 () Bool)

(assert (=> b!1387254 (= e!785795 call!66550)))

(declare-fun b!1387255 () Bool)

(assert (=> b!1387255 (= e!785796 call!66550)))

(assert (= (and d!149387 (not res!928252)) b!1387252))

(assert (= (and b!1387252 c!128943) b!1387253))

(assert (= (and b!1387252 (not c!128943)) b!1387255))

(assert (= (and b!1387253 res!928251) b!1387254))

(assert (= (or b!1387254 b!1387255) bm!66547))

(declare-fun m!1272309 () Bool)

(assert (=> bm!66547 m!1272309))

(declare-fun m!1272311 () Bool)

(assert (=> b!1387252 m!1272311))

(assert (=> b!1387252 m!1272311))

(declare-fun m!1272313 () Bool)

(assert (=> b!1387252 m!1272313))

(assert (=> b!1387253 m!1272311))

(declare-fun m!1272315 () Bool)

(assert (=> b!1387253 m!1272315))

(declare-fun m!1272317 () Bool)

(assert (=> b!1387253 m!1272317))

(assert (=> b!1387253 m!1272311))

(declare-fun m!1272319 () Bool)

(assert (=> b!1387253 m!1272319))

(assert (=> b!1387062 d!149387))

(declare-fun d!149389 () Bool)

(declare-fun e!785806 () Bool)

(assert (=> d!149389 e!785806))

(declare-fun res!928259 () Bool)

(assert (=> d!149389 (=> (not res!928259) (not e!785806))))

(assert (=> d!149389 (= res!928259 (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46363 a!2938))))))

(declare-fun lt!609653 () Unit!46224)

(declare-fun choose!23 (array!94869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> d!149389 (= lt!609653 (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(assert (=> d!149389 (validMask!0 mask!2987)))

(assert (=> d!149389 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) lt!609653)))

(declare-fun b!1387266 () Bool)

(assert (=> b!1387266 (= e!785806 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987))))

(assert (= (and d!149389 res!928259) b!1387266))

(declare-fun m!1272345 () Bool)

(assert (=> d!149389 m!1272345))

(assert (=> d!149389 m!1272073))

(assert (=> b!1387266 m!1272079))

(declare-fun m!1272347 () Bool)

(assert (=> b!1387266 m!1272347))

(assert (=> b!1387062 d!149389))

(check-sat (not b!1387244) (not d!149357) (not b!1387168) (not b!1387253) (not b!1387252) (not d!149389) (not d!149369) (not b!1387248) (not b!1387144) (not bm!66547) (not bm!66534) (not b!1387245) (not b!1387240) (not b!1387200) (not bm!66540) (not d!149345) (not b!1387249) (not b!1387237) (not b!1387167) (not d!149381) (not b!1387266) (not bm!66545) (not b!1387146) (not bm!66546) (not b!1387145))
(check-sat)
(get-model)

(declare-fun e!785905 () SeekEntryResult!10180)

(declare-fun b!1387412 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1387412 (= e!785905 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124698 lt!609610) #b00000000000000000000000000000001) (nextIndex!0 (index!43093 lt!609610) (x!124698 lt!609610) mask!2987) (index!43093 lt!609610) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987))))

(declare-fun b!1387413 () Bool)

(declare-fun e!785903 () SeekEntryResult!10180)

(assert (=> b!1387413 (= e!785903 (Found!10180 (index!43093 lt!609610)))))

(declare-fun b!1387414 () Bool)

(declare-fun e!785904 () SeekEntryResult!10180)

(assert (=> b!1387414 (= e!785904 e!785903)))

(declare-fun c!128995 () Bool)

(declare-fun lt!609717 () (_ BitVec 64))

(assert (=> b!1387414 (= c!128995 (= lt!609717 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387415 () Bool)

(assert (=> b!1387415 (= e!785905 (MissingVacant!10180 (index!43093 lt!609610)))))

(declare-fun b!1387416 () Bool)

(declare-fun c!128993 () Bool)

(assert (=> b!1387416 (= c!128993 (= lt!609717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387416 (= e!785903 e!785905)))

(declare-fun lt!609718 () SeekEntryResult!10180)

(declare-fun d!149427 () Bool)

(assert (=> d!149427 (and (or ((_ is Undefined!10180) lt!609718) (not ((_ is Found!10180) lt!609718)) (and (bvsge (index!43092 lt!609718) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609718) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609718) ((_ is Found!10180) lt!609718) (not ((_ is MissingVacant!10180) lt!609718)) (not (= (index!43094 lt!609718) (index!43093 lt!609610))) (and (bvsge (index!43094 lt!609718) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609718) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609718) (ite ((_ is Found!10180) lt!609718) (= (select (arr!45811 lt!609532) (index!43092 lt!609718)) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and ((_ is MissingVacant!10180) lt!609718) (= (index!43094 lt!609718) (index!43093 lt!609610)) (= (select (arr!45811 lt!609532) (index!43094 lt!609718)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149427 (= lt!609718 e!785904)))

(declare-fun c!128994 () Bool)

(assert (=> d!149427 (= c!128994 (bvsge (x!124698 lt!609610) #b01111111111111111111111111111110))))

(assert (=> d!149427 (= lt!609717 (select (arr!45811 lt!609532) (index!43093 lt!609610)))))

(assert (=> d!149427 (validMask!0 mask!2987)))

(assert (=> d!149427 (= (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609610) (index!43093 lt!609610) (index!43093 lt!609610) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987) lt!609718)))

(declare-fun b!1387417 () Bool)

(assert (=> b!1387417 (= e!785904 Undefined!10180)))

(assert (= (and d!149427 c!128994) b!1387417))

(assert (= (and d!149427 (not c!128994)) b!1387414))

(assert (= (and b!1387414 c!128995) b!1387413))

(assert (= (and b!1387414 (not c!128995)) b!1387416))

(assert (= (and b!1387416 c!128993) b!1387415))

(assert (= (and b!1387416 (not c!128993)) b!1387412))

(declare-fun m!1272527 () Bool)

(assert (=> b!1387412 m!1272527))

(assert (=> b!1387412 m!1272527))

(assert (=> b!1387412 m!1272083))

(declare-fun m!1272529 () Bool)

(assert (=> b!1387412 m!1272529))

(declare-fun m!1272531 () Bool)

(assert (=> d!149427 m!1272531))

(declare-fun m!1272533 () Bool)

(assert (=> d!149427 m!1272533))

(assert (=> d!149427 m!1272223))

(assert (=> d!149427 m!1272073))

(assert (=> b!1387200 d!149427))

(declare-fun d!149453 () Bool)

(assert (=> d!149453 (arrayContainsKey!0 lt!609532 lt!609640 #b00000000000000000000000000000000)))

(declare-fun lt!609721 () Unit!46224)

(declare-fun choose!13 (array!94869 (_ BitVec 64) (_ BitVec 32)) Unit!46224)

(assert (=> d!149453 (= lt!609721 (choose!13 lt!609532 lt!609640 startIndex!16))))

(assert (=> d!149453 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149453 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609532 lt!609640 startIndex!16) lt!609721)))

(declare-fun bs!40288 () Bool)

(assert (= bs!40288 d!149453))

(assert (=> bs!40288 m!1272305))

(declare-fun m!1272535 () Bool)

(assert (=> bs!40288 m!1272535))

(assert (=> b!1387249 d!149453))

(declare-fun d!149455 () Bool)

(declare-fun res!928323 () Bool)

(declare-fun e!785925 () Bool)

(assert (=> d!149455 (=> res!928323 e!785925)))

(assert (=> d!149455 (= res!928323 (= (select (arr!45811 lt!609532) #b00000000000000000000000000000000) lt!609640))))

(assert (=> d!149455 (= (arrayContainsKey!0 lt!609532 lt!609640 #b00000000000000000000000000000000) e!785925)))

(declare-fun b!1387447 () Bool)

(declare-fun e!785926 () Bool)

(assert (=> b!1387447 (= e!785925 e!785926)))

(declare-fun res!928324 () Bool)

(assert (=> b!1387447 (=> (not res!928324) (not e!785926))))

(assert (=> b!1387447 (= res!928324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46363 lt!609532)))))

(declare-fun b!1387448 () Bool)

(assert (=> b!1387448 (= e!785926 (arrayContainsKey!0 lt!609532 lt!609640 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149455 (not res!928323)) b!1387447))

(assert (= (and b!1387447 res!928324) b!1387448))

(declare-fun m!1272545 () Bool)

(assert (=> d!149455 m!1272545))

(declare-fun m!1272547 () Bool)

(assert (=> b!1387448 m!1272547))

(assert (=> b!1387249 d!149455))

(declare-fun d!149459 () Bool)

(declare-fun lt!609726 () SeekEntryResult!10180)

(assert (=> d!149459 (and (or ((_ is Undefined!10180) lt!609726) (not ((_ is Found!10180) lt!609726)) (and (bvsge (index!43092 lt!609726) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609726) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609726) ((_ is Found!10180) lt!609726) (not ((_ is MissingZero!10180) lt!609726)) (and (bvsge (index!43091 lt!609726) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609726) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609726) ((_ is Found!10180) lt!609726) ((_ is MissingZero!10180) lt!609726) (not ((_ is MissingVacant!10180) lt!609726)) (and (bvsge (index!43094 lt!609726) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609726) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609726) (ite ((_ is Found!10180) lt!609726) (= (select (arr!45811 lt!609532) (index!43092 lt!609726)) (select (arr!45811 lt!609532) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609726) (= (select (arr!45811 lt!609532) (index!43091 lt!609726)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609726) (= (select (arr!45811 lt!609532) (index!43094 lt!609726)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!785927 () SeekEntryResult!10180)

(assert (=> d!149459 (= lt!609726 e!785927)))

(declare-fun c!129007 () Bool)

(declare-fun lt!609725 () SeekEntryResult!10180)

(assert (=> d!149459 (= c!129007 (and ((_ is Intermediate!10180) lt!609725) (undefined!10992 lt!609725)))))

(assert (=> d!149459 (= lt!609725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45811 lt!609532) startIndex!16) mask!2987) (select (arr!45811 lt!609532) startIndex!16) lt!609532 mask!2987))))

(assert (=> d!149459 (validMask!0 mask!2987)))

(assert (=> d!149459 (= (seekEntryOrOpen!0 (select (arr!45811 lt!609532) startIndex!16) lt!609532 mask!2987) lt!609726)))

(declare-fun b!1387449 () Bool)

(declare-fun e!785929 () SeekEntryResult!10180)

(assert (=> b!1387449 (= e!785927 e!785929)))

(declare-fun lt!609724 () (_ BitVec 64))

(assert (=> b!1387449 (= lt!609724 (select (arr!45811 lt!609532) (index!43093 lt!609725)))))

(declare-fun c!129006 () Bool)

(assert (=> b!1387449 (= c!129006 (= lt!609724 (select (arr!45811 lt!609532) startIndex!16)))))

(declare-fun b!1387450 () Bool)

(assert (=> b!1387450 (= e!785927 Undefined!10180)))

(declare-fun b!1387451 () Bool)

(declare-fun e!785928 () SeekEntryResult!10180)

(assert (=> b!1387451 (= e!785928 (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609725) (index!43093 lt!609725) (index!43093 lt!609725) (select (arr!45811 lt!609532) startIndex!16) lt!609532 mask!2987))))

(declare-fun b!1387452 () Bool)

(declare-fun c!129005 () Bool)

(assert (=> b!1387452 (= c!129005 (= lt!609724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387452 (= e!785929 e!785928)))

(declare-fun b!1387453 () Bool)

(assert (=> b!1387453 (= e!785928 (MissingZero!10180 (index!43093 lt!609725)))))

(declare-fun b!1387454 () Bool)

(assert (=> b!1387454 (= e!785929 (Found!10180 (index!43093 lt!609725)))))

(assert (= (and d!149459 c!129007) b!1387450))

(assert (= (and d!149459 (not c!129007)) b!1387449))

(assert (= (and b!1387449 c!129006) b!1387454))

(assert (= (and b!1387449 (not c!129006)) b!1387452))

(assert (= (and b!1387452 c!129005) b!1387453))

(assert (= (and b!1387452 (not c!129005)) b!1387451))

(declare-fun m!1272549 () Bool)

(assert (=> d!149459 m!1272549))

(declare-fun m!1272551 () Bool)

(assert (=> d!149459 m!1272551))

(assert (=> d!149459 m!1272299))

(declare-fun m!1272553 () Bool)

(assert (=> d!149459 m!1272553))

(assert (=> d!149459 m!1272553))

(assert (=> d!149459 m!1272299))

(declare-fun m!1272555 () Bool)

(assert (=> d!149459 m!1272555))

(assert (=> d!149459 m!1272073))

(declare-fun m!1272557 () Bool)

(assert (=> d!149459 m!1272557))

(declare-fun m!1272559 () Bool)

(assert (=> b!1387449 m!1272559))

(assert (=> b!1387451 m!1272299))

(declare-fun m!1272561 () Bool)

(assert (=> b!1387451 m!1272561))

(assert (=> b!1387249 d!149459))

(declare-fun d!149463 () Bool)

(assert (=> d!149463 (= (validKeyInArray!0 (select (arr!45811 lt!609532) startIndex!16)) (and (not (= (select (arr!45811 lt!609532) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45811 lt!609532) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387248 d!149463))

(declare-fun bm!66564 () Bool)

(declare-fun call!66567 () Bool)

(assert (=> bm!66564 (= call!66567 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!609532 mask!2987))))

(declare-fun d!149465 () Bool)

(declare-fun res!928326 () Bool)

(declare-fun e!785932 () Bool)

(assert (=> d!149465 (=> res!928326 e!785932)))

(assert (=> d!149465 (= res!928326 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46363 lt!609532)))))

(assert (=> d!149465 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609532 mask!2987) e!785932)))

(declare-fun b!1387455 () Bool)

(declare-fun e!785931 () Bool)

(assert (=> b!1387455 (= e!785932 e!785931)))

(declare-fun c!129008 () Bool)

(assert (=> b!1387455 (= c!129008 (validKeyInArray!0 (select (arr!45811 lt!609532) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1387456 () Bool)

(declare-fun e!785930 () Bool)

(assert (=> b!1387456 (= e!785931 e!785930)))

(declare-fun lt!609734 () (_ BitVec 64))

(assert (=> b!1387456 (= lt!609734 (select (arr!45811 lt!609532) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609733 () Unit!46224)

(assert (=> b!1387456 (= lt!609733 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609532 lt!609734 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387456 (arrayContainsKey!0 lt!609532 lt!609734 #b00000000000000000000000000000000)))

(declare-fun lt!609735 () Unit!46224)

(assert (=> b!1387456 (= lt!609735 lt!609733)))

(declare-fun res!928325 () Bool)

(assert (=> b!1387456 (= res!928325 (= (seekEntryOrOpen!0 (select (arr!45811 lt!609532) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!609532 mask!2987) (Found!10180 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387456 (=> (not res!928325) (not e!785930))))

(declare-fun b!1387457 () Bool)

(assert (=> b!1387457 (= e!785930 call!66567)))

(declare-fun b!1387458 () Bool)

(assert (=> b!1387458 (= e!785931 call!66567)))

(assert (= (and d!149465 (not res!928326)) b!1387455))

(assert (= (and b!1387455 c!129008) b!1387456))

(assert (= (and b!1387455 (not c!129008)) b!1387458))

(assert (= (and b!1387456 res!928325) b!1387457))

(assert (= (or b!1387457 b!1387458) bm!66564))

(declare-fun m!1272563 () Bool)

(assert (=> bm!66564 m!1272563))

(declare-fun m!1272565 () Bool)

(assert (=> b!1387455 m!1272565))

(assert (=> b!1387455 m!1272565))

(declare-fun m!1272567 () Bool)

(assert (=> b!1387455 m!1272567))

(assert (=> b!1387456 m!1272565))

(declare-fun m!1272569 () Bool)

(assert (=> b!1387456 m!1272569))

(declare-fun m!1272571 () Bool)

(assert (=> b!1387456 m!1272571))

(assert (=> b!1387456 m!1272565))

(declare-fun m!1272573 () Bool)

(assert (=> b!1387456 m!1272573))

(assert (=> bm!66546 d!149465))

(declare-fun d!149467 () Bool)

(assert (=> d!149467 (arrayContainsKey!0 a!2938 lt!609637 #b00000000000000000000000000000000)))

(declare-fun lt!609736 () Unit!46224)

(assert (=> d!149467 (= lt!609736 (choose!13 a!2938 lt!609637 #b00000000000000000000000000000000))))

(assert (=> d!149467 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149467 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609637 #b00000000000000000000000000000000) lt!609736)))

(declare-fun bs!40289 () Bool)

(assert (= bs!40289 d!149467))

(assert (=> bs!40289 m!1272293))

(declare-fun m!1272575 () Bool)

(assert (=> bs!40289 m!1272575))

(assert (=> b!1387245 d!149467))

(declare-fun d!149469 () Bool)

(declare-fun res!928327 () Bool)

(declare-fun e!785933 () Bool)

(assert (=> d!149469 (=> res!928327 e!785933)))

(assert (=> d!149469 (= res!928327 (= (select (arr!45811 a!2938) #b00000000000000000000000000000000) lt!609637))))

(assert (=> d!149469 (= (arrayContainsKey!0 a!2938 lt!609637 #b00000000000000000000000000000000) e!785933)))

(declare-fun b!1387459 () Bool)

(declare-fun e!785934 () Bool)

(assert (=> b!1387459 (= e!785933 e!785934)))

(declare-fun res!928328 () Bool)

(assert (=> b!1387459 (=> (not res!928328) (not e!785934))))

(assert (=> b!1387459 (= res!928328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46363 a!2938)))))

(declare-fun b!1387460 () Bool)

(assert (=> b!1387460 (= e!785934 (arrayContainsKey!0 a!2938 lt!609637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149469 (not res!928327)) b!1387459))

(assert (= (and b!1387459 res!928328) b!1387460))

(assert (=> d!149469 m!1272177))

(declare-fun m!1272577 () Bool)

(assert (=> b!1387460 m!1272577))

(assert (=> b!1387245 d!149469))

(declare-fun d!149471 () Bool)

(declare-fun lt!609739 () SeekEntryResult!10180)

(assert (=> d!149471 (and (or ((_ is Undefined!10180) lt!609739) (not ((_ is Found!10180) lt!609739)) (and (bvsge (index!43092 lt!609739) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609739) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609739) ((_ is Found!10180) lt!609739) (not ((_ is MissingZero!10180) lt!609739)) (and (bvsge (index!43091 lt!609739) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609739) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609739) ((_ is Found!10180) lt!609739) ((_ is MissingZero!10180) lt!609739) (not ((_ is MissingVacant!10180) lt!609739)) (and (bvsge (index!43094 lt!609739) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609739) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609739) (ite ((_ is Found!10180) lt!609739) (= (select (arr!45811 a!2938) (index!43092 lt!609739)) (select (arr!45811 a!2938) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10180) lt!609739) (= (select (arr!45811 a!2938) (index!43091 lt!609739)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609739) (= (select (arr!45811 a!2938) (index!43094 lt!609739)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!785935 () SeekEntryResult!10180)

(assert (=> d!149471 (= lt!609739 e!785935)))

(declare-fun c!129011 () Bool)

(declare-fun lt!609738 () SeekEntryResult!10180)

(assert (=> d!149471 (= c!129011 (and ((_ is Intermediate!10180) lt!609738) (undefined!10992 lt!609738)))))

(assert (=> d!149471 (= lt!609738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45811 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45811 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149471 (validMask!0 mask!2987)))

(assert (=> d!149471 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!609739)))

(declare-fun b!1387461 () Bool)

(declare-fun e!785937 () SeekEntryResult!10180)

(assert (=> b!1387461 (= e!785935 e!785937)))

(declare-fun lt!609737 () (_ BitVec 64))

(assert (=> b!1387461 (= lt!609737 (select (arr!45811 a!2938) (index!43093 lt!609738)))))

(declare-fun c!129010 () Bool)

(assert (=> b!1387461 (= c!129010 (= lt!609737 (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387462 () Bool)

(assert (=> b!1387462 (= e!785935 Undefined!10180)))

(declare-fun b!1387463 () Bool)

(declare-fun e!785936 () SeekEntryResult!10180)

(assert (=> b!1387463 (= e!785936 (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609738) (index!43093 lt!609738) (index!43093 lt!609738) (select (arr!45811 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1387464 () Bool)

(declare-fun c!129009 () Bool)

(assert (=> b!1387464 (= c!129009 (= lt!609737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387464 (= e!785937 e!785936)))

(declare-fun b!1387465 () Bool)

(assert (=> b!1387465 (= e!785936 (MissingZero!10180 (index!43093 lt!609738)))))

(declare-fun b!1387466 () Bool)

(assert (=> b!1387466 (= e!785937 (Found!10180 (index!43093 lt!609738)))))

(assert (= (and d!149471 c!129011) b!1387462))

(assert (= (and d!149471 (not c!129011)) b!1387461))

(assert (= (and b!1387461 c!129010) b!1387466))

(assert (= (and b!1387461 (not c!129010)) b!1387464))

(assert (= (and b!1387464 c!129009) b!1387465))

(assert (= (and b!1387464 (not c!129009)) b!1387463))

(declare-fun m!1272579 () Bool)

(assert (=> d!149471 m!1272579))

(declare-fun m!1272581 () Bool)

(assert (=> d!149471 m!1272581))

(assert (=> d!149471 m!1272177))

(declare-fun m!1272583 () Bool)

(assert (=> d!149471 m!1272583))

(assert (=> d!149471 m!1272583))

(assert (=> d!149471 m!1272177))

(declare-fun m!1272585 () Bool)

(assert (=> d!149471 m!1272585))

(assert (=> d!149471 m!1272073))

(declare-fun m!1272587 () Bool)

(assert (=> d!149471 m!1272587))

(declare-fun m!1272589 () Bool)

(assert (=> b!1387461 m!1272589))

(assert (=> b!1387463 m!1272177))

(declare-fun m!1272591 () Bool)

(assert (=> b!1387463 m!1272591))

(assert (=> b!1387245 d!149471))

(declare-fun bm!66565 () Bool)

(declare-fun call!66568 () Bool)

(assert (=> bm!66565 (= call!66568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!609532 mask!2987))))

(declare-fun d!149475 () Bool)

(declare-fun res!928333 () Bool)

(declare-fun e!785945 () Bool)

(assert (=> d!149475 (=> res!928333 e!785945)))

(assert (=> d!149475 (= res!928333 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (size!46363 lt!609532)))))

(assert (=> d!149475 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!609532 mask!2987) e!785945)))

(declare-fun b!1387476 () Bool)

(declare-fun e!785944 () Bool)

(assert (=> b!1387476 (= e!785945 e!785944)))

(declare-fun c!129015 () Bool)

(assert (=> b!1387476 (= c!129015 (validKeyInArray!0 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1387477 () Bool)

(declare-fun e!785943 () Bool)

(assert (=> b!1387477 (= e!785944 e!785943)))

(declare-fun lt!609743 () (_ BitVec 64))

(assert (=> b!1387477 (= lt!609743 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609742 () Unit!46224)

(assert (=> b!1387477 (= lt!609742 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609532 lt!609743 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387477 (arrayContainsKey!0 lt!609532 lt!609743 #b00000000000000000000000000000000)))

(declare-fun lt!609744 () Unit!46224)

(assert (=> b!1387477 (= lt!609744 lt!609742)))

(declare-fun res!928332 () Bool)

(assert (=> b!1387477 (= res!928332 (= (seekEntryOrOpen!0 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)) lt!609532 mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387477 (=> (not res!928332) (not e!785943))))

(declare-fun b!1387478 () Bool)

(assert (=> b!1387478 (= e!785943 call!66568)))

(declare-fun b!1387479 () Bool)

(assert (=> b!1387479 (= e!785944 call!66568)))

(assert (= (and d!149475 (not res!928333)) b!1387476))

(assert (= (and b!1387476 c!129015) b!1387477))

(assert (= (and b!1387476 (not c!129015)) b!1387479))

(assert (= (and b!1387477 res!928332) b!1387478))

(assert (= (or b!1387478 b!1387479) bm!66565))

(declare-fun m!1272601 () Bool)

(assert (=> bm!66565 m!1272601))

(declare-fun m!1272603 () Bool)

(assert (=> b!1387476 m!1272603))

(assert (=> b!1387476 m!1272603))

(declare-fun m!1272605 () Bool)

(assert (=> b!1387476 m!1272605))

(assert (=> b!1387477 m!1272603))

(declare-fun m!1272607 () Bool)

(assert (=> b!1387477 m!1272607))

(declare-fun m!1272609 () Bool)

(assert (=> b!1387477 m!1272609))

(assert (=> b!1387477 m!1272603))

(declare-fun m!1272613 () Bool)

(assert (=> b!1387477 m!1272613))

(assert (=> bm!66547 d!149475))

(declare-fun d!149481 () Bool)

(assert (=> d!149481 (= (validKeyInArray!0 (select (arr!45811 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45811 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45811 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387146 d!149481))

(declare-fun bm!66566 () Bool)

(declare-fun call!66569 () Bool)

(assert (=> bm!66566 (= call!66569 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149485 () Bool)

(declare-fun res!928335 () Bool)

(declare-fun e!785954 () Bool)

(assert (=> d!149485 (=> res!928335 e!785954)))

(assert (=> d!149485 (= res!928335 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46363 a!2938)))))

(assert (=> d!149485 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!785954)))

(declare-fun b!1387492 () Bool)

(declare-fun e!785953 () Bool)

(assert (=> b!1387492 (= e!785954 e!785953)))

(declare-fun c!129022 () Bool)

(assert (=> b!1387492 (= c!129022 (validKeyInArray!0 (select (arr!45811 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1387493 () Bool)

(declare-fun e!785952 () Bool)

(assert (=> b!1387493 (= e!785953 e!785952)))

(declare-fun lt!609753 () (_ BitVec 64))

(assert (=> b!1387493 (= lt!609753 (select (arr!45811 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609750 () Unit!46224)

(assert (=> b!1387493 (= lt!609750 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609753 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387493 (arrayContainsKey!0 a!2938 lt!609753 #b00000000000000000000000000000000)))

(declare-fun lt!609754 () Unit!46224)

(assert (=> b!1387493 (= lt!609754 lt!609750)))

(declare-fun res!928334 () Bool)

(assert (=> b!1387493 (= res!928334 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10180 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387493 (=> (not res!928334) (not e!785952))))

(declare-fun b!1387494 () Bool)

(assert (=> b!1387494 (= e!785952 call!66569)))

(declare-fun b!1387495 () Bool)

(assert (=> b!1387495 (= e!785953 call!66569)))

(assert (= (and d!149485 (not res!928335)) b!1387492))

(assert (= (and b!1387492 c!129022) b!1387493))

(assert (= (and b!1387492 (not c!129022)) b!1387495))

(assert (= (and b!1387493 res!928334) b!1387494))

(assert (= (or b!1387494 b!1387495) bm!66566))

(declare-fun m!1272625 () Bool)

(assert (=> bm!66566 m!1272625))

(declare-fun m!1272629 () Bool)

(assert (=> b!1387492 m!1272629))

(assert (=> b!1387492 m!1272629))

(declare-fun m!1272635 () Bool)

(assert (=> b!1387492 m!1272635))

(assert (=> b!1387493 m!1272629))

(declare-fun m!1272639 () Bool)

(assert (=> b!1387493 m!1272639))

(declare-fun m!1272641 () Bool)

(assert (=> b!1387493 m!1272641))

(assert (=> b!1387493 m!1272629))

(declare-fun m!1272643 () Bool)

(assert (=> b!1387493 m!1272643))

(assert (=> bm!66540 d!149485))

(declare-fun call!66570 () Bool)

(declare-fun bm!66567 () Bool)

(assert (=> bm!66567 (= call!66570 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987))))

(declare-fun d!149489 () Bool)

(declare-fun res!928337 () Bool)

(declare-fun e!785957 () Bool)

(assert (=> d!149489 (=> res!928337 e!785957)))

(assert (=> d!149489 (= res!928337 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46363 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)))))))

(assert (=> d!149489 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987) e!785957)))

(declare-fun b!1387496 () Bool)

(declare-fun e!785956 () Bool)

(assert (=> b!1387496 (= e!785957 e!785956)))

(declare-fun c!129023 () Bool)

(assert (=> b!1387496 (= c!129023 (validKeyInArray!0 (select (arr!45811 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387497 () Bool)

(declare-fun e!785955 () Bool)

(assert (=> b!1387497 (= e!785956 e!785955)))

(declare-fun lt!609756 () (_ BitVec 64))

(assert (=> b!1387497 (= lt!609756 (select (arr!45811 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!609755 () Unit!46224)

(assert (=> b!1387497 (= lt!609755 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) lt!609756 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1387497 (arrayContainsKey!0 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) lt!609756 #b00000000000000000000000000000000)))

(declare-fun lt!609757 () Unit!46224)

(assert (=> b!1387497 (= lt!609757 lt!609755)))

(declare-fun res!928336 () Bool)

(assert (=> b!1387497 (= res!928336 (= (seekEntryOrOpen!0 (select (arr!45811 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1387497 (=> (not res!928336) (not e!785955))))

(declare-fun b!1387498 () Bool)

(assert (=> b!1387498 (= e!785955 call!66570)))

(declare-fun b!1387499 () Bool)

(assert (=> b!1387499 (= e!785956 call!66570)))

(assert (= (and d!149489 (not res!928337)) b!1387496))

(assert (= (and b!1387496 c!129023) b!1387497))

(assert (= (and b!1387496 (not c!129023)) b!1387499))

(assert (= (and b!1387497 res!928336) b!1387498))

(assert (= (or b!1387498 b!1387499) bm!66567))

(declare-fun m!1272645 () Bool)

(assert (=> bm!66567 m!1272645))

(declare-fun m!1272647 () Bool)

(assert (=> b!1387496 m!1272647))

(assert (=> b!1387496 m!1272647))

(declare-fun m!1272649 () Bool)

(assert (=> b!1387496 m!1272649))

(assert (=> b!1387497 m!1272647))

(declare-fun m!1272651 () Bool)

(assert (=> b!1387497 m!1272651))

(declare-fun m!1272653 () Bool)

(assert (=> b!1387497 m!1272653))

(assert (=> b!1387497 m!1272647))

(declare-fun m!1272655 () Bool)

(assert (=> b!1387497 m!1272655))

(assert (=> b!1387266 d!149489))

(assert (=> b!1387167 d!149339))

(declare-fun d!149491 () Bool)

(assert (=> d!149491 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987))))

(assert (=> d!149491 true))

(declare-fun _$42!19 () Unit!46224)

(assert (=> d!149491 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!19)))

(declare-fun bs!40294 () Bool)

(assert (= bs!40294 d!149491))

(assert (=> bs!40294 m!1272083))

(assert (=> bs!40294 m!1272069))

(assert (=> bs!40294 m!1272079))

(assert (=> bs!40294 m!1272069))

(assert (=> bs!40294 m!1272089))

(assert (=> bs!40294 m!1272083))

(assert (=> bs!40294 m!1272273))

(assert (=> d!149369 d!149491))

(assert (=> d!149369 d!149335))

(declare-fun d!149505 () Bool)

(assert (=> d!149505 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987)))

(assert (=> d!149505 true))

(declare-fun _$43!18 () Unit!46224)

(assert (=> d!149505 (= (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) _$43!18)))

(declare-fun bs!40295 () Bool)

(assert (= bs!40295 d!149505))

(assert (=> bs!40295 m!1272079))

(assert (=> bs!40295 m!1272347))

(assert (=> d!149389 d!149505))

(assert (=> d!149389 d!149335))

(declare-fun d!149509 () Bool)

(assert (=> d!149509 (arrayContainsKey!0 a!2938 lt!609586 #b00000000000000000000000000000000)))

(declare-fun lt!609769 () Unit!46224)

(assert (=> d!149509 (= lt!609769 (choose!13 a!2938 lt!609586 startIndex!16))))

(assert (=> d!149509 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149509 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609586 startIndex!16) lt!609769)))

(declare-fun bs!40296 () Bool)

(assert (= bs!40296 d!149509))

(assert (=> bs!40296 m!1272199))

(declare-fun m!1272697 () Bool)

(assert (=> bs!40296 m!1272697))

(assert (=> b!1387168 d!149509))

(declare-fun d!149511 () Bool)

(declare-fun res!928350 () Bool)

(declare-fun e!785974 () Bool)

(assert (=> d!149511 (=> res!928350 e!785974)))

(assert (=> d!149511 (= res!928350 (= (select (arr!45811 a!2938) #b00000000000000000000000000000000) lt!609586))))

(assert (=> d!149511 (= (arrayContainsKey!0 a!2938 lt!609586 #b00000000000000000000000000000000) e!785974)))

(declare-fun b!1387520 () Bool)

(declare-fun e!785975 () Bool)

(assert (=> b!1387520 (= e!785974 e!785975)))

(declare-fun res!928351 () Bool)

(assert (=> b!1387520 (=> (not res!928351) (not e!785975))))

(assert (=> b!1387520 (= res!928351 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46363 a!2938)))))

(declare-fun b!1387521 () Bool)

(assert (=> b!1387521 (= e!785975 (arrayContainsKey!0 a!2938 lt!609586 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149511 (not res!928350)) b!1387520))

(assert (= (and b!1387520 res!928351) b!1387521))

(assert (=> d!149511 m!1272177))

(declare-fun m!1272699 () Bool)

(assert (=> b!1387521 m!1272699))

(assert (=> b!1387168 d!149511))

(assert (=> b!1387168 d!149381))

(declare-fun d!149513 () Bool)

(declare-fun lt!609772 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!757 (List!32417) (InoxSet (_ BitVec 64)))

(assert (=> d!149513 (= lt!609772 (select (content!757 Nil!32414) (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(declare-fun e!785981 () Bool)

(assert (=> d!149513 (= lt!609772 e!785981)))

(declare-fun res!928357 () Bool)

(assert (=> d!149513 (=> (not res!928357) (not e!785981))))

(assert (=> d!149513 (= res!928357 ((_ is Cons!32413) Nil!32414))))

(assert (=> d!149513 (= (contains!9706 Nil!32414 (select (arr!45811 a!2938) #b00000000000000000000000000000000)) lt!609772)))

(declare-fun b!1387526 () Bool)

(declare-fun e!785980 () Bool)

(assert (=> b!1387526 (= e!785981 e!785980)))

(declare-fun res!928356 () Bool)

(assert (=> b!1387526 (=> res!928356 e!785980)))

(assert (=> b!1387526 (= res!928356 (= (h!33622 Nil!32414) (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387527 () Bool)

(assert (=> b!1387527 (= e!785980 (contains!9706 (t!47103 Nil!32414) (select (arr!45811 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149513 res!928357) b!1387526))

(assert (= (and b!1387526 (not res!928356)) b!1387527))

(declare-fun m!1272701 () Bool)

(assert (=> d!149513 m!1272701))

(assert (=> d!149513 m!1272177))

(declare-fun m!1272703 () Bool)

(assert (=> d!149513 m!1272703))

(assert (=> b!1387527 m!1272177))

(declare-fun m!1272705 () Bool)

(assert (=> b!1387527 m!1272705))

(assert (=> b!1387144 d!149513))

(declare-fun d!149515 () Bool)

(assert (=> d!149515 (arrayContainsKey!0 lt!609532 lt!609643 #b00000000000000000000000000000000)))

(declare-fun lt!609773 () Unit!46224)

(assert (=> d!149515 (= lt!609773 (choose!13 lt!609532 lt!609643 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> d!149515 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))

(assert (=> d!149515 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609532 lt!609643 (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609773)))

(declare-fun bs!40297 () Bool)

(assert (= bs!40297 d!149515))

(assert (=> bs!40297 m!1272317))

(declare-fun m!1272707 () Bool)

(assert (=> bs!40297 m!1272707))

(assert (=> b!1387253 d!149515))

(declare-fun d!149517 () Bool)

(declare-fun res!928358 () Bool)

(declare-fun e!785982 () Bool)

(assert (=> d!149517 (=> res!928358 e!785982)))

(assert (=> d!149517 (= res!928358 (= (select (arr!45811 lt!609532) #b00000000000000000000000000000000) lt!609643))))

(assert (=> d!149517 (= (arrayContainsKey!0 lt!609532 lt!609643 #b00000000000000000000000000000000) e!785982)))

(declare-fun b!1387528 () Bool)

(declare-fun e!785983 () Bool)

(assert (=> b!1387528 (= e!785982 e!785983)))

(declare-fun res!928359 () Bool)

(assert (=> b!1387528 (=> (not res!928359) (not e!785983))))

(assert (=> b!1387528 (= res!928359 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46363 lt!609532)))))

(declare-fun b!1387529 () Bool)

(assert (=> b!1387529 (= e!785983 (arrayContainsKey!0 lt!609532 lt!609643 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149517 (not res!928358)) b!1387528))

(assert (= (and b!1387528 res!928359) b!1387529))

(assert (=> d!149517 m!1272545))

(declare-fun m!1272709 () Bool)

(assert (=> b!1387529 m!1272709))

(assert (=> b!1387253 d!149517))

(declare-fun d!149519 () Bool)

(declare-fun lt!609776 () SeekEntryResult!10180)

(assert (=> d!149519 (and (or ((_ is Undefined!10180) lt!609776) (not ((_ is Found!10180) lt!609776)) (and (bvsge (index!43092 lt!609776) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609776) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609776) ((_ is Found!10180) lt!609776) (not ((_ is MissingZero!10180) lt!609776)) (and (bvsge (index!43091 lt!609776) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609776) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609776) ((_ is Found!10180) lt!609776) ((_ is MissingZero!10180) lt!609776) (not ((_ is MissingVacant!10180) lt!609776)) (and (bvsge (index!43094 lt!609776) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609776) (size!46363 lt!609532)))) (or ((_ is Undefined!10180) lt!609776) (ite ((_ is Found!10180) lt!609776) (= (select (arr!45811 lt!609532) (index!43092 lt!609776)) (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16))) (ite ((_ is MissingZero!10180) lt!609776) (= (select (arr!45811 lt!609532) (index!43091 lt!609776)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609776) (= (select (arr!45811 lt!609532) (index!43094 lt!609776)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!785984 () SeekEntryResult!10180)

(assert (=> d!149519 (= lt!609776 e!785984)))

(declare-fun c!129030 () Bool)

(declare-fun lt!609775 () SeekEntryResult!10180)

(assert (=> d!149519 (= c!129030 (and ((_ is Intermediate!10180) lt!609775) (undefined!10992 lt!609775)))))

(assert (=> d!149519 (= lt!609775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)) mask!2987) (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609532 mask!2987))))

(assert (=> d!149519 (validMask!0 mask!2987)))

(assert (=> d!149519 (= (seekEntryOrOpen!0 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609532 mask!2987) lt!609776)))

(declare-fun b!1387530 () Bool)

(declare-fun e!785986 () SeekEntryResult!10180)

(assert (=> b!1387530 (= e!785984 e!785986)))

(declare-fun lt!609774 () (_ BitVec 64))

(assert (=> b!1387530 (= lt!609774 (select (arr!45811 lt!609532) (index!43093 lt!609775)))))

(declare-fun c!129029 () Bool)

(assert (=> b!1387530 (= c!129029 (= lt!609774 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387531 () Bool)

(assert (=> b!1387531 (= e!785984 Undefined!10180)))

(declare-fun b!1387532 () Bool)

(declare-fun e!785985 () SeekEntryResult!10180)

(assert (=> b!1387532 (= e!785985 (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609775) (index!43093 lt!609775) (index!43093 lt!609775) (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609532 mask!2987))))

(declare-fun b!1387533 () Bool)

(declare-fun c!129028 () Bool)

(assert (=> b!1387533 (= c!129028 (= lt!609774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387533 (= e!785986 e!785985)))

(declare-fun b!1387534 () Bool)

(assert (=> b!1387534 (= e!785985 (MissingZero!10180 (index!43093 lt!609775)))))

(declare-fun b!1387535 () Bool)

(assert (=> b!1387535 (= e!785986 (Found!10180 (index!43093 lt!609775)))))

(assert (= (and d!149519 c!129030) b!1387531))

(assert (= (and d!149519 (not c!129030)) b!1387530))

(assert (= (and b!1387530 c!129029) b!1387535))

(assert (= (and b!1387530 (not c!129029)) b!1387533))

(assert (= (and b!1387533 c!129028) b!1387534))

(assert (= (and b!1387533 (not c!129028)) b!1387532))

(declare-fun m!1272711 () Bool)

(assert (=> d!149519 m!1272711))

(declare-fun m!1272713 () Bool)

(assert (=> d!149519 m!1272713))

(assert (=> d!149519 m!1272311))

(declare-fun m!1272715 () Bool)

(assert (=> d!149519 m!1272715))

(assert (=> d!149519 m!1272715))

(assert (=> d!149519 m!1272311))

(declare-fun m!1272717 () Bool)

(assert (=> d!149519 m!1272717))

(assert (=> d!149519 m!1272073))

(declare-fun m!1272719 () Bool)

(assert (=> d!149519 m!1272719))

(declare-fun m!1272721 () Bool)

(assert (=> b!1387530 m!1272721))

(assert (=> b!1387532 m!1272311))

(declare-fun m!1272723 () Bool)

(assert (=> b!1387532 m!1272723))

(assert (=> b!1387253 d!149519))

(assert (=> b!1387145 d!149481))

(declare-fun e!785989 () SeekEntryResult!10180)

(declare-fun b!1387536 () Bool)

(assert (=> b!1387536 (= e!785989 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124698 lt!609634) #b00000000000000000000000000000001) (nextIndex!0 (index!43093 lt!609634) (x!124698 lt!609634) mask!2987) (index!43093 lt!609634) (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387537 () Bool)

(declare-fun e!785987 () SeekEntryResult!10180)

(assert (=> b!1387537 (= e!785987 (Found!10180 (index!43093 lt!609634)))))

(declare-fun b!1387538 () Bool)

(declare-fun e!785988 () SeekEntryResult!10180)

(assert (=> b!1387538 (= e!785988 e!785987)))

(declare-fun c!129033 () Bool)

(declare-fun lt!609777 () (_ BitVec 64))

(assert (=> b!1387538 (= c!129033 (= lt!609777 (select (arr!45811 a!2938) startIndex!16)))))

(declare-fun b!1387539 () Bool)

(assert (=> b!1387539 (= e!785989 (MissingVacant!10180 (index!43093 lt!609634)))))

(declare-fun b!1387540 () Bool)

(declare-fun c!129031 () Bool)

(assert (=> b!1387540 (= c!129031 (= lt!609777 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387540 (= e!785987 e!785989)))

(declare-fun d!149521 () Bool)

(declare-fun lt!609778 () SeekEntryResult!10180)

(assert (=> d!149521 (and (or ((_ is Undefined!10180) lt!609778) (not ((_ is Found!10180) lt!609778)) (and (bvsge (index!43092 lt!609778) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609778) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609778) ((_ is Found!10180) lt!609778) (not ((_ is MissingVacant!10180) lt!609778)) (not (= (index!43094 lt!609778) (index!43093 lt!609634))) (and (bvsge (index!43094 lt!609778) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609778) (size!46363 a!2938)))) (or ((_ is Undefined!10180) lt!609778) (ite ((_ is Found!10180) lt!609778) (= (select (arr!45811 a!2938) (index!43092 lt!609778)) (select (arr!45811 a!2938) startIndex!16)) (and ((_ is MissingVacant!10180) lt!609778) (= (index!43094 lt!609778) (index!43093 lt!609634)) (= (select (arr!45811 a!2938) (index!43094 lt!609778)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149521 (= lt!609778 e!785988)))

(declare-fun c!129032 () Bool)

(assert (=> d!149521 (= c!129032 (bvsge (x!124698 lt!609634) #b01111111111111111111111111111110))))

(assert (=> d!149521 (= lt!609777 (select (arr!45811 a!2938) (index!43093 lt!609634)))))

(assert (=> d!149521 (validMask!0 mask!2987)))

(assert (=> d!149521 (= (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609634) (index!43093 lt!609634) (index!43093 lt!609634) (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) lt!609778)))

(declare-fun b!1387541 () Bool)

(assert (=> b!1387541 (= e!785988 Undefined!10180)))

(assert (= (and d!149521 c!129032) b!1387541))

(assert (= (and d!149521 (not c!129032)) b!1387538))

(assert (= (and b!1387538 c!129033) b!1387537))

(assert (= (and b!1387538 (not c!129033)) b!1387540))

(assert (= (and b!1387540 c!129031) b!1387539))

(assert (= (and b!1387540 (not c!129031)) b!1387536))

(declare-fun m!1272725 () Bool)

(assert (=> b!1387536 m!1272725))

(assert (=> b!1387536 m!1272725))

(assert (=> b!1387536 m!1272069))

(declare-fun m!1272727 () Bool)

(assert (=> b!1387536 m!1272727))

(declare-fun m!1272729 () Bool)

(assert (=> d!149521 m!1272729))

(declare-fun m!1272731 () Bool)

(assert (=> d!149521 m!1272731))

(assert (=> d!149521 m!1272285))

(assert (=> d!149521 m!1272073))

(assert (=> b!1387240 d!149521))

(declare-fun b!1387560 () Bool)

(declare-fun e!786000 () SeekEntryResult!10180)

(assert (=> b!1387560 (= e!786000 (Intermediate!10180 true (toIndex!0 (select (arr!45811 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387561 () Bool)

(declare-fun e!786001 () Bool)

(declare-fun lt!609784 () SeekEntryResult!10180)

(assert (=> b!1387561 (= e!786001 (bvsge (x!124698 lt!609784) #b01111111111111111111111111111110))))

(declare-fun b!1387562 () Bool)

(assert (=> b!1387562 (and (bvsge (index!43093 lt!609784) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609784) (size!46363 a!2938)))))

(declare-fun res!928368 () Bool)

(assert (=> b!1387562 (= res!928368 (= (select (arr!45811 a!2938) (index!43093 lt!609784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786004 () Bool)

(assert (=> b!1387562 (=> res!928368 e!786004)))

(declare-fun d!149523 () Bool)

(assert (=> d!149523 e!786001))

(declare-fun c!129041 () Bool)

(assert (=> d!149523 (= c!129041 (and ((_ is Intermediate!10180) lt!609784) (undefined!10992 lt!609784)))))

(assert (=> d!149523 (= lt!609784 e!786000)))

(declare-fun c!129040 () Bool)

(assert (=> d!149523 (= c!129040 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!609783 () (_ BitVec 64))

(assert (=> d!149523 (= lt!609783 (select (arr!45811 a!2938) (toIndex!0 (select (arr!45811 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!149523 (validMask!0 mask!2987)))

(assert (=> d!149523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45811 a!2938) startIndex!16) mask!2987) (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987) lt!609784)))

(declare-fun b!1387563 () Bool)

(assert (=> b!1387563 (and (bvsge (index!43093 lt!609784) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609784) (size!46363 a!2938)))))

(declare-fun res!928367 () Bool)

(assert (=> b!1387563 (= res!928367 (= (select (arr!45811 a!2938) (index!43093 lt!609784)) (select (arr!45811 a!2938) startIndex!16)))))

(assert (=> b!1387563 (=> res!928367 e!786004)))

(declare-fun e!786002 () Bool)

(assert (=> b!1387563 (= e!786002 e!786004)))

(declare-fun b!1387564 () Bool)

(declare-fun e!786003 () SeekEntryResult!10180)

(assert (=> b!1387564 (= e!786003 (Intermediate!10180 false (toIndex!0 (select (arr!45811 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387565 () Bool)

(assert (=> b!1387565 (= e!786003 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45811 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (arr!45811 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387566 () Bool)

(assert (=> b!1387566 (= e!786001 e!786002)))

(declare-fun res!928366 () Bool)

(assert (=> b!1387566 (= res!928366 (and ((_ is Intermediate!10180) lt!609784) (not (undefined!10992 lt!609784)) (bvslt (x!124698 lt!609784) #b01111111111111111111111111111110) (bvsge (x!124698 lt!609784) #b00000000000000000000000000000000) (bvsge (x!124698 lt!609784) #b00000000000000000000000000000000)))))

(assert (=> b!1387566 (=> (not res!928366) (not e!786002))))

(declare-fun b!1387567 () Bool)

(assert (=> b!1387567 (and (bvsge (index!43093 lt!609784) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609784) (size!46363 a!2938)))))

(assert (=> b!1387567 (= e!786004 (= (select (arr!45811 a!2938) (index!43093 lt!609784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1387568 () Bool)

(assert (=> b!1387568 (= e!786000 e!786003)))

(declare-fun c!129042 () Bool)

(assert (=> b!1387568 (= c!129042 (or (= lt!609783 (select (arr!45811 a!2938) startIndex!16)) (= (bvadd lt!609783 lt!609783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!149523 c!129040) b!1387560))

(assert (= (and d!149523 (not c!129040)) b!1387568))

(assert (= (and b!1387568 c!129042) b!1387564))

(assert (= (and b!1387568 (not c!129042)) b!1387565))

(assert (= (and d!149523 c!129041) b!1387561))

(assert (= (and d!149523 (not c!129041)) b!1387566))

(assert (= (and b!1387566 res!928366) b!1387563))

(assert (= (and b!1387563 (not res!928367)) b!1387562))

(assert (= (and b!1387562 (not res!928368)) b!1387567))

(declare-fun m!1272733 () Bool)

(assert (=> b!1387562 m!1272733))

(assert (=> b!1387565 m!1272279))

(declare-fun m!1272735 () Bool)

(assert (=> b!1387565 m!1272735))

(assert (=> b!1387565 m!1272735))

(assert (=> b!1387565 m!1272069))

(declare-fun m!1272737 () Bool)

(assert (=> b!1387565 m!1272737))

(assert (=> b!1387567 m!1272733))

(assert (=> b!1387563 m!1272733))

(assert (=> d!149523 m!1272279))

(declare-fun m!1272739 () Bool)

(assert (=> d!149523 m!1272739))

(assert (=> d!149523 m!1272073))

(assert (=> d!149381 d!149523))

(declare-fun d!149525 () Bool)

(declare-fun lt!609790 () (_ BitVec 32))

(declare-fun lt!609789 () (_ BitVec 32))

(assert (=> d!149525 (= lt!609790 (bvmul (bvxor lt!609789 (bvlshr lt!609789 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149525 (= lt!609789 ((_ extract 31 0) (bvand (bvxor (select (arr!45811 a!2938) startIndex!16) (bvlshr (select (arr!45811 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149525 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928369 (let ((h!33626 ((_ extract 31 0) (bvand (bvxor (select (arr!45811 a!2938) startIndex!16) (bvlshr (select (arr!45811 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124706 (bvmul (bvxor h!33626 (bvlshr h!33626 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124706 (bvlshr x!124706 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928369 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928369 #b00000000000000000000000000000000))))))

(assert (=> d!149525 (= (toIndex!0 (select (arr!45811 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!609790 (bvlshr lt!609790 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149381 d!149525))

(assert (=> d!149381 d!149335))

(declare-fun d!149527 () Bool)

(assert (=> d!149527 (= (validKeyInArray!0 (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16))) (and (not (= (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45811 lt!609532) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387252 d!149527))

(declare-fun b!1387569 () Bool)

(declare-fun e!786008 () Bool)

(declare-fun call!66572 () Bool)

(assert (=> b!1387569 (= e!786008 call!66572)))

(declare-fun b!1387570 () Bool)

(assert (=> b!1387570 (= e!786008 call!66572)))

(declare-fun b!1387571 () Bool)

(declare-fun e!786006 () Bool)

(assert (=> b!1387571 (= e!786006 (contains!9706 (ite c!128906 (Cons!32413 (select (arr!45811 a!2938) #b00000000000000000000000000000000) Nil!32414) Nil!32414) (select (arr!45811 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!149529 () Bool)

(declare-fun res!928370 () Bool)

(declare-fun e!786005 () Bool)

(assert (=> d!149529 (=> res!928370 e!786005)))

(assert (=> d!149529 (= res!928370 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46363 a!2938)))))

(assert (=> d!149529 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128906 (Cons!32413 (select (arr!45811 a!2938) #b00000000000000000000000000000000) Nil!32414) Nil!32414)) e!786005)))

(declare-fun b!1387572 () Bool)

(declare-fun e!786007 () Bool)

(assert (=> b!1387572 (= e!786007 e!786008)))

(declare-fun c!129043 () Bool)

(assert (=> b!1387572 (= c!129043 (validKeyInArray!0 (select (arr!45811 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!66569 () Bool)

(assert (=> bm!66569 (= call!66572 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129043 (Cons!32413 (select (arr!45811 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!128906 (Cons!32413 (select (arr!45811 a!2938) #b00000000000000000000000000000000) Nil!32414) Nil!32414)) (ite c!128906 (Cons!32413 (select (arr!45811 a!2938) #b00000000000000000000000000000000) Nil!32414) Nil!32414))))))

(declare-fun b!1387573 () Bool)

(assert (=> b!1387573 (= e!786005 e!786007)))

(declare-fun res!928372 () Bool)

(assert (=> b!1387573 (=> (not res!928372) (not e!786007))))

(assert (=> b!1387573 (= res!928372 (not e!786006))))

(declare-fun res!928371 () Bool)

(assert (=> b!1387573 (=> (not res!928371) (not e!786006))))

(assert (=> b!1387573 (= res!928371 (validKeyInArray!0 (select (arr!45811 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!149529 (not res!928370)) b!1387573))

(assert (= (and b!1387573 res!928371) b!1387571))

(assert (= (and b!1387573 res!928372) b!1387572))

(assert (= (and b!1387572 c!129043) b!1387569))

(assert (= (and b!1387572 (not c!129043)) b!1387570))

(assert (= (or b!1387569 b!1387570) bm!66569))

(declare-fun m!1272741 () Bool)

(assert (=> b!1387571 m!1272741))

(assert (=> b!1387571 m!1272741))

(declare-fun m!1272743 () Bool)

(assert (=> b!1387571 m!1272743))

(assert (=> b!1387572 m!1272741))

(assert (=> b!1387572 m!1272741))

(declare-fun m!1272745 () Bool)

(assert (=> b!1387572 m!1272745))

(assert (=> bm!66569 m!1272741))

(declare-fun m!1272747 () Bool)

(assert (=> bm!66569 m!1272747))

(assert (=> b!1387573 m!1272741))

(assert (=> b!1387573 m!1272741))

(assert (=> b!1387573 m!1272745))

(assert (=> bm!66534 d!149529))

(assert (=> b!1387244 d!149481))

(declare-fun bm!66570 () Bool)

(declare-fun call!66573 () Bool)

(assert (=> bm!66570 (= call!66573 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149531 () Bool)

(declare-fun res!928374 () Bool)

(declare-fun e!786011 () Bool)

(assert (=> d!149531 (=> res!928374 e!786011)))

(assert (=> d!149531 (= res!928374 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46363 a!2938)))))

(assert (=> d!149531 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!786011)))

(declare-fun b!1387574 () Bool)

(declare-fun e!786010 () Bool)

(assert (=> b!1387574 (= e!786011 e!786010)))

(declare-fun c!129044 () Bool)

(assert (=> b!1387574 (= c!129044 (validKeyInArray!0 (select (arr!45811 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1387575 () Bool)

(declare-fun e!786009 () Bool)

(assert (=> b!1387575 (= e!786010 e!786009)))

(declare-fun lt!609792 () (_ BitVec 64))

(assert (=> b!1387575 (= lt!609792 (select (arr!45811 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!609791 () Unit!46224)

(assert (=> b!1387575 (= lt!609791 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1387575 (arrayContainsKey!0 a!2938 lt!609792 #b00000000000000000000000000000000)))

(declare-fun lt!609793 () Unit!46224)

(assert (=> b!1387575 (= lt!609793 lt!609791)))

(declare-fun res!928373 () Bool)

(assert (=> b!1387575 (= res!928373 (= (seekEntryOrOpen!0 (select (arr!45811 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10180 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1387575 (=> (not res!928373) (not e!786009))))

(declare-fun b!1387576 () Bool)

(assert (=> b!1387576 (= e!786009 call!66573)))

(declare-fun b!1387577 () Bool)

(assert (=> b!1387577 (= e!786010 call!66573)))

(assert (= (and d!149531 (not res!928374)) b!1387574))

(assert (= (and b!1387574 c!129044) b!1387575))

(assert (= (and b!1387574 (not c!129044)) b!1387577))

(assert (= (and b!1387575 res!928373) b!1387576))

(assert (= (or b!1387576 b!1387577) bm!66570))

(declare-fun m!1272749 () Bool)

(assert (=> bm!66570 m!1272749))

(assert (=> b!1387574 m!1272741))

(assert (=> b!1387574 m!1272741))

(assert (=> b!1387574 m!1272745))

(assert (=> b!1387575 m!1272741))

(declare-fun m!1272751 () Bool)

(assert (=> b!1387575 m!1272751))

(declare-fun m!1272753 () Bool)

(assert (=> b!1387575 m!1272753))

(assert (=> b!1387575 m!1272741))

(declare-fun m!1272755 () Bool)

(assert (=> b!1387575 m!1272755))

(assert (=> bm!66545 d!149531))

(assert (=> d!149345 d!149349))

(declare-fun d!149533 () Bool)

(assert (=> d!149533 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149533 true))

(declare-fun _$72!128 () Unit!46224)

(assert (=> d!149533 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!128)))

(declare-fun bs!40298 () Bool)

(assert (= bs!40298 d!149533))

(assert (=> bs!40298 m!1272091))

(assert (=> d!149345 d!149533))

(assert (=> d!149345 d!149335))

(declare-fun e!786012 () SeekEntryResult!10180)

(declare-fun b!1387578 () Bool)

(assert (=> b!1387578 (= e!786012 (Intermediate!10180 true (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387579 () Bool)

(declare-fun e!786013 () Bool)

(declare-fun lt!609795 () SeekEntryResult!10180)

(assert (=> b!1387579 (= e!786013 (bvsge (x!124698 lt!609795) #b01111111111111111111111111111110))))

(declare-fun b!1387580 () Bool)

(assert (=> b!1387580 (and (bvsge (index!43093 lt!609795) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609795) (size!46363 lt!609532)))))

(declare-fun res!928377 () Bool)

(assert (=> b!1387580 (= res!928377 (= (select (arr!45811 lt!609532) (index!43093 lt!609795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786016 () Bool)

(assert (=> b!1387580 (=> res!928377 e!786016)))

(declare-fun d!149535 () Bool)

(assert (=> d!149535 e!786013))

(declare-fun c!129046 () Bool)

(assert (=> d!149535 (= c!129046 (and ((_ is Intermediate!10180) lt!609795) (undefined!10992 lt!609795)))))

(assert (=> d!149535 (= lt!609795 e!786012)))

(declare-fun c!129045 () Bool)

(assert (=> d!149535 (= c!129045 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!609794 () (_ BitVec 64))

(assert (=> d!149535 (= lt!609794 (select (arr!45811 lt!609532) (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149535 (validMask!0 mask!2987)))

(assert (=> d!149535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987) lt!609795)))

(declare-fun b!1387581 () Bool)

(assert (=> b!1387581 (and (bvsge (index!43093 lt!609795) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609795) (size!46363 lt!609532)))))

(declare-fun res!928376 () Bool)

(assert (=> b!1387581 (= res!928376 (= (select (arr!45811 lt!609532) (index!43093 lt!609795)) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1387581 (=> res!928376 e!786016)))

(declare-fun e!786014 () Bool)

(assert (=> b!1387581 (= e!786014 e!786016)))

(declare-fun b!1387582 () Bool)

(declare-fun e!786015 () SeekEntryResult!10180)

(assert (=> b!1387582 (= e!786015 (Intermediate!10180 false (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387583 () Bool)

(assert (=> b!1387583 (= e!786015 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609532 mask!2987))))

(declare-fun b!1387584 () Bool)

(assert (=> b!1387584 (= e!786013 e!786014)))

(declare-fun res!928375 () Bool)

(assert (=> b!1387584 (= res!928375 (and ((_ is Intermediate!10180) lt!609795) (not (undefined!10992 lt!609795)) (bvslt (x!124698 lt!609795) #b01111111111111111111111111111110) (bvsge (x!124698 lt!609795) #b00000000000000000000000000000000) (bvsge (x!124698 lt!609795) #b00000000000000000000000000000000)))))

(assert (=> b!1387584 (=> (not res!928375) (not e!786014))))

(declare-fun b!1387585 () Bool)

(assert (=> b!1387585 (and (bvsge (index!43093 lt!609795) #b00000000000000000000000000000000) (bvslt (index!43093 lt!609795) (size!46363 lt!609532)))))

(assert (=> b!1387585 (= e!786016 (= (select (arr!45811 lt!609532) (index!43093 lt!609795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1387586 () Bool)

(assert (=> b!1387586 (= e!786012 e!786015)))

(declare-fun c!129047 () Bool)

(assert (=> b!1387586 (= c!129047 (or (= lt!609794 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!609794 lt!609794) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!149535 c!129045) b!1387578))

(assert (= (and d!149535 (not c!129045)) b!1387586))

(assert (= (and b!1387586 c!129047) b!1387582))

(assert (= (and b!1387586 (not c!129047)) b!1387583))

(assert (= (and d!149535 c!129046) b!1387579))

(assert (= (and d!149535 (not c!129046)) b!1387584))

(assert (= (and b!1387584 res!928375) b!1387581))

(assert (= (and b!1387581 (not res!928376)) b!1387580))

(assert (= (and b!1387580 (not res!928377)) b!1387585))

(declare-fun m!1272757 () Bool)

(assert (=> b!1387580 m!1272757))

(assert (=> b!1387583 m!1272217))

(declare-fun m!1272759 () Bool)

(assert (=> b!1387583 m!1272759))

(assert (=> b!1387583 m!1272759))

(assert (=> b!1387583 m!1272083))

(declare-fun m!1272761 () Bool)

(assert (=> b!1387583 m!1272761))

(assert (=> b!1387585 m!1272757))

(assert (=> b!1387581 m!1272757))

(assert (=> d!149535 m!1272217))

(declare-fun m!1272763 () Bool)

(assert (=> d!149535 m!1272763))

(assert (=> d!149535 m!1272073))

(assert (=> d!149357 d!149535))

(declare-fun d!149537 () Bool)

(declare-fun lt!609797 () (_ BitVec 32))

(declare-fun lt!609796 () (_ BitVec 32))

(assert (=> d!149537 (= lt!609797 (bvmul (bvxor lt!609796 (bvlshr lt!609796 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149537 (= lt!609796 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149537 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928369 (let ((h!33626 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124706 (bvmul (bvxor h!33626 (bvlshr h!33626 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124706 (bvlshr x!124706 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928369 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928369 #b00000000000000000000000000000000))))))

(assert (=> d!149537 (= (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!609797 (bvlshr lt!609797 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149357 d!149537))

(assert (=> d!149357 d!149335))

(assert (=> b!1387237 d!149381))

(declare-fun lt!609800 () SeekEntryResult!10180)

(declare-fun d!149539 () Bool)

(assert (=> d!149539 (and (or ((_ is Undefined!10180) lt!609800) (not ((_ is Found!10180) lt!609800)) (and (bvsge (index!43092 lt!609800) #b00000000000000000000000000000000) (bvslt (index!43092 lt!609800) (size!46363 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)))))) (or ((_ is Undefined!10180) lt!609800) ((_ is Found!10180) lt!609800) (not ((_ is MissingZero!10180) lt!609800)) (and (bvsge (index!43091 lt!609800) #b00000000000000000000000000000000) (bvslt (index!43091 lt!609800) (size!46363 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)))))) (or ((_ is Undefined!10180) lt!609800) ((_ is Found!10180) lt!609800) ((_ is MissingZero!10180) lt!609800) (not ((_ is MissingVacant!10180) lt!609800)) (and (bvsge (index!43094 lt!609800) #b00000000000000000000000000000000) (bvslt (index!43094 lt!609800) (size!46363 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)))))) (or ((_ is Undefined!10180) lt!609800) (ite ((_ is Found!10180) lt!609800) (= (select (arr!45811 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938))) (index!43092 lt!609800)) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10180) lt!609800) (= (select (arr!45811 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938))) (index!43091 lt!609800)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10180) lt!609800) (= (select (arr!45811 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938))) (index!43094 lt!609800)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!786017 () SeekEntryResult!10180)

(assert (=> d!149539 (= lt!609800 e!786017)))

(declare-fun c!129050 () Bool)

(declare-fun lt!609799 () SeekEntryResult!10180)

(assert (=> d!149539 (= c!129050 (and ((_ is Intermediate!10180) lt!609799) (undefined!10992 lt!609799)))))

(assert (=> d!149539 (= lt!609799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987))))

(assert (=> d!149539 (validMask!0 mask!2987)))

(assert (=> d!149539 (= (seekEntryOrOpen!0 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987) lt!609800)))

(declare-fun b!1387587 () Bool)

(declare-fun e!786019 () SeekEntryResult!10180)

(assert (=> b!1387587 (= e!786017 e!786019)))

(declare-fun lt!609798 () (_ BitVec 64))

(assert (=> b!1387587 (= lt!609798 (select (arr!45811 (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938))) (index!43093 lt!609799)))))

(declare-fun c!129049 () Bool)

(assert (=> b!1387587 (= c!129049 (= lt!609798 (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387588 () Bool)

(assert (=> b!1387588 (= e!786017 Undefined!10180)))

(declare-fun b!1387589 () Bool)

(declare-fun e!786018 () SeekEntryResult!10180)

(assert (=> b!1387589 (= e!786018 (seekKeyOrZeroReturnVacant!0 (x!124698 lt!609799) (index!43093 lt!609799) (index!43093 lt!609799) (select (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94870 (store (arr!45811 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46363 a!2938)) mask!2987))))

(declare-fun b!1387590 () Bool)

(declare-fun c!129048 () Bool)

(assert (=> b!1387590 (= c!129048 (= lt!609798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387590 (= e!786019 e!786018)))

(declare-fun b!1387591 () Bool)

(assert (=> b!1387591 (= e!786018 (MissingZero!10180 (index!43093 lt!609799)))))

(declare-fun b!1387592 () Bool)

(assert (=> b!1387592 (= e!786019 (Found!10180 (index!43093 lt!609799)))))

(assert (= (and d!149539 c!129050) b!1387588))

(assert (= (and d!149539 (not c!129050)) b!1387587))

(assert (= (and b!1387587 c!129049) b!1387592))

(assert (= (and b!1387587 (not c!129049)) b!1387590))

(assert (= (and b!1387590 c!129048) b!1387591))

(assert (= (and b!1387590 (not c!129048)) b!1387589))

(declare-fun m!1272765 () Bool)

(assert (=> d!149539 m!1272765))

(declare-fun m!1272767 () Bool)

(assert (=> d!149539 m!1272767))

(assert (=> d!149539 m!1272083))

(assert (=> d!149539 m!1272217))

(assert (=> d!149539 m!1272217))

(assert (=> d!149539 m!1272083))

(declare-fun m!1272769 () Bool)

(assert (=> d!149539 m!1272769))

(assert (=> d!149539 m!1272073))

(declare-fun m!1272771 () Bool)

(assert (=> d!149539 m!1272771))

(declare-fun m!1272773 () Bool)

(assert (=> b!1387587 m!1272773))

(assert (=> b!1387589 m!1272083))

(declare-fun m!1272775 () Bool)

(assert (=> b!1387589 m!1272775))

(assert (=> b!1387237 d!149539))

(check-sat (not b!1387455) (not d!149427) (not b!1387532) (not b!1387521) (not b!1387476) (not d!149471) (not d!149459) (not b!1387497) (not b!1387574) (not d!149519) (not b!1387492) (not bm!66564) (not d!149535) (not b!1387572) (not d!149521) (not b!1387477) (not bm!66566) (not b!1387589) (not bm!66570) (not b!1387571) (not d!149515) (not bm!66565) (not d!149513) (not d!149533) (not d!149509) (not b!1387575) (not b!1387565) (not b!1387573) (not d!149491) (not b!1387463) (not b!1387583) (not b!1387451) (not d!149505) (not b!1387412) (not d!149523) (not b!1387460) (not d!149539) (not b!1387456) (not bm!66567) (not b!1387493) (not b!1387529) (not bm!66569) (not b!1387527) (not d!149467) (not b!1387536) (not d!149453) (not b!1387448) (not b!1387496))
(check-sat)
