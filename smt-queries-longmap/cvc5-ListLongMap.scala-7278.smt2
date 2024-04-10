; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92928 () Bool)

(assert start!92928)

(declare-fun b!1055042 () Bool)

(declare-fun e!599523 () Bool)

(declare-fun e!599524 () Bool)

(assert (=> b!1055042 (= e!599523 e!599524)))

(declare-fun res!703948 () Bool)

(assert (=> b!1055042 (=> res!703948 e!599524)))

(declare-fun lt!465649 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055042 (= res!703948 (bvsle lt!465649 i!1381))))

(declare-fun b!1055043 () Bool)

(declare-fun e!599525 () Bool)

(declare-fun e!599527 () Bool)

(assert (=> b!1055043 (= e!599525 e!599527)))

(declare-fun res!703949 () Bool)

(assert (=> b!1055043 (=> (not res!703949) (not e!599527))))

(assert (=> b!1055043 (= res!703949 (not (= lt!465649 i!1381)))))

(declare-datatypes ((array!66549 0))(
  ( (array!66550 (arr!32005 (Array (_ BitVec 32) (_ BitVec 64))) (size!32541 (_ BitVec 32))) )
))
(declare-fun lt!465648 () array!66549)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66549 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055043 (= lt!465649 (arrayScanForKey!0 lt!465648 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!703945 () Bool)

(declare-fun e!599526 () Bool)

(assert (=> start!92928 (=> (not res!703945) (not e!599526))))

(declare-fun a!3488 () array!66549)

(assert (=> start!92928 (= res!703945 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32541 a!3488)) (bvslt (size!32541 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92928 e!599526))

(assert (=> start!92928 true))

(declare-fun array_inv!24785 (array!66549) Bool)

(assert (=> start!92928 (array_inv!24785 a!3488)))

(declare-fun b!1055044 () Bool)

(declare-fun arrayContainsKey!0 (array!66549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055044 (= e!599524 (arrayContainsKey!0 a!3488 k!2747 lt!465649))))

(declare-fun b!1055045 () Bool)

(declare-fun e!599528 () Bool)

(assert (=> b!1055045 (= e!599527 (not e!599528))))

(declare-fun res!703940 () Bool)

(assert (=> b!1055045 (=> res!703940 e!599528)))

(assert (=> b!1055045 (= res!703940 (bvsle lt!465649 i!1381))))

(assert (=> b!1055045 e!599523))

(declare-fun res!703942 () Bool)

(assert (=> b!1055045 (=> (not res!703942) (not e!599523))))

(assert (=> b!1055045 (= res!703942 (= (select (store (arr!32005 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465649) k!2747))))

(declare-fun b!1055046 () Bool)

(declare-fun res!703946 () Bool)

(assert (=> b!1055046 (=> (not res!703946) (not e!599526))))

(declare-datatypes ((List!22317 0))(
  ( (Nil!22314) (Cons!22313 (h!23522 (_ BitVec 64)) (t!31624 List!22317)) )
))
(declare-fun arrayNoDuplicates!0 (array!66549 (_ BitVec 32) List!22317) Bool)

(assert (=> b!1055046 (= res!703946 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22314))))

(declare-fun b!1055047 () Bool)

(declare-fun e!599529 () Bool)

(declare-fun noDuplicate!1545 (List!22317) Bool)

(assert (=> b!1055047 (= e!599529 (noDuplicate!1545 Nil!22314))))

(declare-fun b!1055048 () Bool)

(declare-fun res!703944 () Bool)

(assert (=> b!1055048 (=> (not res!703944) (not e!599526))))

(assert (=> b!1055048 (= res!703944 (= (select (arr!32005 a!3488) i!1381) k!2747))))

(declare-fun b!1055049 () Bool)

(assert (=> b!1055049 (= e!599528 e!599529)))

(declare-fun res!703947 () Bool)

(assert (=> b!1055049 (=> res!703947 e!599529)))

(assert (=> b!1055049 (= res!703947 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32541 a!3488)))))

(assert (=> b!1055049 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34568 0))(
  ( (Unit!34569) )
))
(declare-fun lt!465650 () Unit!34568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34568)

(assert (=> b!1055049 (= lt!465650 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465649 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055049 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22314)))

(declare-fun lt!465651 () Unit!34568)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66549 (_ BitVec 32) (_ BitVec 32)) Unit!34568)

(assert (=> b!1055049 (= lt!465651 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055050 () Bool)

(assert (=> b!1055050 (= e!599526 e!599525)))

(declare-fun res!703941 () Bool)

(assert (=> b!1055050 (=> (not res!703941) (not e!599525))))

(assert (=> b!1055050 (= res!703941 (arrayContainsKey!0 lt!465648 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055050 (= lt!465648 (array!66550 (store (arr!32005 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32541 a!3488)))))

(declare-fun b!1055051 () Bool)

(declare-fun res!703943 () Bool)

(assert (=> b!1055051 (=> (not res!703943) (not e!599526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055051 (= res!703943 (validKeyInArray!0 k!2747))))

(assert (= (and start!92928 res!703945) b!1055046))

(assert (= (and b!1055046 res!703946) b!1055051))

(assert (= (and b!1055051 res!703943) b!1055048))

(assert (= (and b!1055048 res!703944) b!1055050))

(assert (= (and b!1055050 res!703941) b!1055043))

(assert (= (and b!1055043 res!703949) b!1055045))

(assert (= (and b!1055045 res!703942) b!1055042))

(assert (= (and b!1055042 (not res!703948)) b!1055044))

(assert (= (and b!1055045 (not res!703940)) b!1055049))

(assert (= (and b!1055049 (not res!703947)) b!1055047))

(declare-fun m!975071 () Bool)

(assert (=> b!1055045 m!975071))

(declare-fun m!975073 () Bool)

(assert (=> b!1055045 m!975073))

(declare-fun m!975075 () Bool)

(assert (=> b!1055046 m!975075))

(declare-fun m!975077 () Bool)

(assert (=> b!1055048 m!975077))

(declare-fun m!975079 () Bool)

(assert (=> b!1055043 m!975079))

(declare-fun m!975081 () Bool)

(assert (=> b!1055044 m!975081))

(declare-fun m!975083 () Bool)

(assert (=> b!1055051 m!975083))

(declare-fun m!975085 () Bool)

(assert (=> start!92928 m!975085))

(declare-fun m!975087 () Bool)

(assert (=> b!1055049 m!975087))

(declare-fun m!975089 () Bool)

(assert (=> b!1055049 m!975089))

(declare-fun m!975091 () Bool)

(assert (=> b!1055049 m!975091))

(declare-fun m!975093 () Bool)

(assert (=> b!1055049 m!975093))

(declare-fun m!975095 () Bool)

(assert (=> b!1055050 m!975095))

(assert (=> b!1055050 m!975071))

(declare-fun m!975097 () Bool)

(assert (=> b!1055047 m!975097))

(push 1)

(assert (not b!1055047))

(assert (not b!1055050))

(assert (not start!92928))

(assert (not b!1055051))

(assert (not b!1055046))

(assert (not b!1055043))

(assert (not b!1055049))

(assert (not b!1055044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128089 () Bool)

(declare-fun res!704031 () Bool)

(declare-fun e!599603 () Bool)

(assert (=> d!128089 (=> res!704031 e!599603)))

(assert (=> d!128089 (= res!704031 (= (select (arr!32005 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k!2747))))

(assert (=> d!128089 (= (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599603)))

(declare-fun b!1055139 () Bool)

(declare-fun e!599604 () Bool)

(assert (=> b!1055139 (= e!599603 e!599604)))

(declare-fun res!704032 () Bool)

(assert (=> b!1055139 (=> (not res!704032) (not e!599604))))

(assert (=> b!1055139 (= res!704032 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32541 a!3488)))))

(declare-fun b!1055140 () Bool)

(assert (=> b!1055140 (= e!599604 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128089 (not res!704031)) b!1055139))

(assert (= (and b!1055139 res!704032) b!1055140))

(declare-fun m!975171 () Bool)

(assert (=> d!128089 m!975171))

(declare-fun m!975173 () Bool)

(assert (=> b!1055140 m!975173))

(assert (=> b!1055049 d!128089))

(declare-fun d!128091 () Bool)

(assert (=> d!128091 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465681 () Unit!34568)

(declare-fun choose!114 (array!66549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34568)

(assert (=> d!128091 (= lt!465681 (choose!114 a!3488 k!2747 lt!465649 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128091 (bvsge lt!465649 #b00000000000000000000000000000000)))

(assert (=> d!128091 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465649 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465681)))

(declare-fun bs!30925 () Bool)

(assert (= bs!30925 d!128091))

(assert (=> bs!30925 m!975087))

(declare-fun m!975175 () Bool)

(assert (=> bs!30925 m!975175))

(assert (=> b!1055049 d!128091))

(declare-fun b!1055180 () Bool)

(declare-fun e!599637 () Bool)

(declare-fun e!599638 () Bool)

(assert (=> b!1055180 (= e!599637 e!599638)))

(declare-fun res!704056 () Bool)

(assert (=> b!1055180 (=> (not res!704056) (not e!599638))))

(declare-fun e!599639 () Bool)

(assert (=> b!1055180 (= res!704056 (not e!599639))))

(declare-fun res!704058 () Bool)

(assert (=> b!1055180 (=> (not res!704058) (not e!599639))))

(assert (=> b!1055180 (= res!704058 (validKeyInArray!0 (select (arr!32005 a!3488) i!1381)))))

(declare-fun b!1055181 () Bool)

(declare-fun e!599636 () Bool)

(declare-fun call!44791 () Bool)

(assert (=> b!1055181 (= e!599636 call!44791)))

(declare-fun b!1055182 () Bool)

(assert (=> b!1055182 (= e!599638 e!599636)))

(declare-fun c!107022 () Bool)

(assert (=> b!1055182 (= c!107022 (validKeyInArray!0 (select (arr!32005 a!3488) i!1381)))))

(declare-fun bm!44788 () Bool)

(assert (=> bm!44788 (= call!44791 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107022 (Cons!22313 (select (arr!32005 a!3488) i!1381) Nil!22314) Nil!22314)))))

(declare-fun d!128095 () Bool)

(declare-fun res!704057 () Bool)

(assert (=> d!128095 (=> res!704057 e!599637)))

(assert (=> d!128095 (= res!704057 (bvsge i!1381 (size!32541 a!3488)))))

(assert (=> d!128095 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22314) e!599637)))

(declare-fun b!1055183 () Bool)

(declare-fun contains!6179 (List!22317 (_ BitVec 64)) Bool)

(assert (=> b!1055183 (= e!599639 (contains!6179 Nil!22314 (select (arr!32005 a!3488) i!1381)))))

(declare-fun b!1055184 () Bool)

(assert (=> b!1055184 (= e!599636 call!44791)))

(assert (= (and d!128095 (not res!704057)) b!1055180))

(assert (= (and b!1055180 res!704058) b!1055183))

(assert (= (and b!1055180 res!704056) b!1055182))

(assert (= (and b!1055182 c!107022) b!1055181))

(assert (= (and b!1055182 (not c!107022)) b!1055184))

(assert (= (or b!1055181 b!1055184) bm!44788))

(assert (=> b!1055180 m!975077))

(assert (=> b!1055180 m!975077))

(declare-fun m!975199 () Bool)

(assert (=> b!1055180 m!975199))

(assert (=> b!1055182 m!975077))

(assert (=> b!1055182 m!975077))

(assert (=> b!1055182 m!975199))

(assert (=> bm!44788 m!975077))

(declare-fun m!975201 () Bool)

(assert (=> bm!44788 m!975201))

(assert (=> b!1055183 m!975077))

(assert (=> b!1055183 m!975077))

(declare-fun m!975203 () Bool)

(assert (=> b!1055183 m!975203))

(assert (=> b!1055049 d!128095))

(declare-fun d!128111 () Bool)

(assert (=> d!128111 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22314)))

(declare-fun lt!465689 () Unit!34568)

(declare-fun choose!39 (array!66549 (_ BitVec 32) (_ BitVec 32)) Unit!34568)

(assert (=> d!128111 (= lt!465689 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128111 (bvslt (size!32541 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128111 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465689)))

(declare-fun bs!30927 () Bool)

(assert (= bs!30927 d!128111))

(assert (=> bs!30927 m!975091))

(declare-fun m!975215 () Bool)

(assert (=> bs!30927 m!975215))

(assert (=> b!1055049 d!128111))

(declare-fun d!128117 () Bool)

(declare-fun lt!465696 () (_ BitVec 32))

(assert (=> d!128117 (and (or (bvslt lt!465696 #b00000000000000000000000000000000) (bvsge lt!465696 (size!32541 lt!465648)) (and (bvsge lt!465696 #b00000000000000000000000000000000) (bvslt lt!465696 (size!32541 lt!465648)))) (bvsge lt!465696 #b00000000000000000000000000000000) (bvslt lt!465696 (size!32541 lt!465648)) (= (select (arr!32005 lt!465648) lt!465696) k!2747))))

(declare-fun e!599655 () (_ BitVec 32))

(assert (=> d!128117 (= lt!465696 e!599655)))

(declare-fun c!107029 () Bool)

(assert (=> d!128117 (= c!107029 (= (select (arr!32005 lt!465648) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128117 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32541 lt!465648)) (bvslt (size!32541 lt!465648) #b01111111111111111111111111111111))))

(assert (=> d!128117 (= (arrayScanForKey!0 lt!465648 k!2747 #b00000000000000000000000000000000) lt!465696)))

(declare-fun b!1055206 () Bool)

(assert (=> b!1055206 (= e!599655 #b00000000000000000000000000000000)))

(declare-fun b!1055207 () Bool)

(assert (=> b!1055207 (= e!599655 (arrayScanForKey!0 lt!465648 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128117 c!107029) b!1055206))

(assert (= (and d!128117 (not c!107029)) b!1055207))

(declare-fun m!975225 () Bool)

(assert (=> d!128117 m!975225))

(declare-fun m!975227 () Bool)

(assert (=> d!128117 m!975227))

(declare-fun m!975229 () Bool)

(assert (=> b!1055207 m!975229))

(assert (=> b!1055043 d!128117))

(declare-fun d!128123 () Bool)

(declare-fun res!704068 () Bool)

(declare-fun e!599656 () Bool)

(assert (=> d!128123 (=> res!704068 e!599656)))

(assert (=> d!128123 (= res!704068 (= (select (arr!32005 lt!465648) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128123 (= (arrayContainsKey!0 lt!465648 k!2747 #b00000000000000000000000000000000) e!599656)))

(declare-fun b!1055208 () Bool)

(declare-fun e!599657 () Bool)

(assert (=> b!1055208 (= e!599656 e!599657)))

(declare-fun res!704069 () Bool)

(assert (=> b!1055208 (=> (not res!704069) (not e!599657))))

(assert (=> b!1055208 (= res!704069 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32541 lt!465648)))))

(declare-fun b!1055209 () Bool)

(assert (=> b!1055209 (= e!599657 (arrayContainsKey!0 lt!465648 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128123 (not res!704068)) b!1055208))

(assert (= (and b!1055208 res!704069) b!1055209))

(assert (=> d!128123 m!975227))

(declare-fun m!975231 () Bool)

(assert (=> b!1055209 m!975231))

(assert (=> b!1055050 d!128123))

(declare-fun d!128125 () Bool)

(declare-fun res!704074 () Bool)

(declare-fun e!599662 () Bool)

(assert (=> d!128125 (=> res!704074 e!599662)))

(assert (=> d!128125 (= res!704074 (= (select (arr!32005 a!3488) lt!465649) k!2747))))

(assert (=> d!128125 (= (arrayContainsKey!0 a!3488 k!2747 lt!465649) e!599662)))

(declare-fun b!1055214 () Bool)

(declare-fun e!599663 () Bool)

(assert (=> b!1055214 (= e!599662 e!599663)))

(declare-fun res!704075 () Bool)

(assert (=> b!1055214 (=> (not res!704075) (not e!599663))))

(assert (=> b!1055214 (= res!704075 (bvslt (bvadd lt!465649 #b00000000000000000000000000000001) (size!32541 a!3488)))))

(declare-fun b!1055215 () Bool)

(assert (=> b!1055215 (= e!599663 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465649 #b00000000000000000000000000000001)))))

(assert (= (and d!128125 (not res!704074)) b!1055214))

(assert (= (and b!1055214 res!704075) b!1055215))

(declare-fun m!975233 () Bool)

(assert (=> d!128125 m!975233))

(declare-fun m!975235 () Bool)

(assert (=> b!1055215 m!975235))

(assert (=> b!1055044 d!128125))

(declare-fun b!1055216 () Bool)

(declare-fun e!599665 () Bool)

(declare-fun e!599666 () Bool)

(assert (=> b!1055216 (= e!599665 e!599666)))

(declare-fun res!704076 () Bool)

(assert (=> b!1055216 (=> (not res!704076) (not e!599666))))

(declare-fun e!599667 () Bool)

(assert (=> b!1055216 (= res!704076 (not e!599667))))

(declare-fun res!704078 () Bool)

(assert (=> b!1055216 (=> (not res!704078) (not e!599667))))

(assert (=> b!1055216 (= res!704078 (validKeyInArray!0 (select (arr!32005 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055217 () Bool)

(declare-fun e!599664 () Bool)

(declare-fun call!44793 () Bool)

(assert (=> b!1055217 (= e!599664 call!44793)))

(declare-fun b!1055218 () Bool)

(assert (=> b!1055218 (= e!599666 e!599664)))

(declare-fun c!107030 () Bool)

