; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122474 () Bool)

(assert start!122474)

(declare-fun b!1419110 () Bool)

(declare-fun res!954120 () Bool)

(declare-fun e!803202 () Bool)

(assert (=> b!1419110 (=> (not res!954120) (not e!803202))))

(declare-datatypes ((array!96932 0))(
  ( (array!96933 (arr!46789 (Array (_ BitVec 32) (_ BitVec 64))) (size!47340 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96932)

(assert (=> b!1419110 (= res!954120 (and (bvsle #b00000000000000000000000000000000 (size!47340 a!2831)) (bvslt (size!47340 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1419111 () Bool)

(declare-fun e!803203 () Bool)

(declare-datatypes ((List!33286 0))(
  ( (Nil!33283) (Cons!33282 (h!34583 (_ BitVec 64)) (t!47972 List!33286)) )
))
(declare-fun contains!9877 (List!33286 (_ BitVec 64)) Bool)

(assert (=> b!1419111 (= e!803203 (contains!9877 Nil!33283 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419112 () Bool)

(declare-fun res!954123 () Bool)

(assert (=> b!1419112 (=> (not res!954123) (not e!803202))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419112 (= res!954123 (validKeyInArray!0 (select (arr!46789 a!2831) j!81)))))

(declare-fun b!1419113 () Bool)

(declare-fun res!954121 () Bool)

(assert (=> b!1419113 (=> (not res!954121) (not e!803202))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96932 (_ BitVec 32)) Bool)

(assert (=> b!1419113 (= res!954121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419114 () Bool)

(declare-fun res!954124 () Bool)

(assert (=> b!1419114 (=> (not res!954124) (not e!803202))))

(declare-fun noDuplicate!2626 (List!33286) Bool)

(assert (=> b!1419114 (= res!954124 (noDuplicate!2626 Nil!33283))))

(declare-fun b!1419115 () Bool)

(declare-fun res!954126 () Bool)

(assert (=> b!1419115 (=> (not res!954126) (not e!803202))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419115 (= res!954126 (and (= (size!47340 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47340 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47340 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!954125 () Bool)

(assert (=> start!122474 (=> (not res!954125) (not e!803202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122474 (= res!954125 (validMask!0 mask!2608))))

(assert (=> start!122474 e!803202))

(assert (=> start!122474 true))

(declare-fun array_inv!36070 (array!96932) Bool)

(assert (=> start!122474 (array_inv!36070 a!2831)))

(declare-fun b!1419116 () Bool)

(assert (=> b!1419116 (= e!803202 e!803203)))

(declare-fun res!954122 () Bool)

(assert (=> b!1419116 (=> res!954122 e!803203)))

(assert (=> b!1419116 (= res!954122 (contains!9877 Nil!33283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419117 () Bool)

(declare-fun res!954127 () Bool)

(assert (=> b!1419117 (=> (not res!954127) (not e!803202))))

(assert (=> b!1419117 (= res!954127 (validKeyInArray!0 (select (arr!46789 a!2831) i!982)))))

(assert (= (and start!122474 res!954125) b!1419115))

(assert (= (and b!1419115 res!954126) b!1419117))

(assert (= (and b!1419117 res!954127) b!1419112))

(assert (= (and b!1419112 res!954123) b!1419113))

(assert (= (and b!1419113 res!954121) b!1419110))

(assert (= (and b!1419110 res!954120) b!1419114))

(assert (= (and b!1419114 res!954124) b!1419116))

(assert (= (and b!1419116 (not res!954122)) b!1419111))

(declare-fun m!1310101 () Bool)

(assert (=> b!1419111 m!1310101))

(declare-fun m!1310103 () Bool)

(assert (=> b!1419116 m!1310103))

(declare-fun m!1310105 () Bool)

(assert (=> b!1419117 m!1310105))

(assert (=> b!1419117 m!1310105))

(declare-fun m!1310107 () Bool)

(assert (=> b!1419117 m!1310107))

(declare-fun m!1310109 () Bool)

(assert (=> b!1419114 m!1310109))

(declare-fun m!1310111 () Bool)

(assert (=> b!1419112 m!1310111))

(assert (=> b!1419112 m!1310111))

(declare-fun m!1310113 () Bool)

(assert (=> b!1419112 m!1310113))

(declare-fun m!1310115 () Bool)

(assert (=> start!122474 m!1310115))

(declare-fun m!1310117 () Bool)

(assert (=> start!122474 m!1310117))

(declare-fun m!1310119 () Bool)

(assert (=> b!1419113 m!1310119))

(check-sat (not b!1419117) (not b!1419111) (not b!1419112) (not b!1419116) (not b!1419113) (not b!1419114) (not start!122474))
(check-sat)
(get-model)

(declare-fun d!153127 () Bool)

(declare-fun res!954180 () Bool)

(declare-fun e!803227 () Bool)

(assert (=> d!153127 (=> res!954180 e!803227)))

(get-info :version)

(assert (=> d!153127 (= res!954180 ((_ is Nil!33283) Nil!33283))))

(assert (=> d!153127 (= (noDuplicate!2626 Nil!33283) e!803227)))

(declare-fun b!1419170 () Bool)

(declare-fun e!803228 () Bool)

(assert (=> b!1419170 (= e!803227 e!803228)))

(declare-fun res!954181 () Bool)

(assert (=> b!1419170 (=> (not res!954181) (not e!803228))))

(assert (=> b!1419170 (= res!954181 (not (contains!9877 (t!47972 Nil!33283) (h!34583 Nil!33283))))))

(declare-fun b!1419171 () Bool)

(assert (=> b!1419171 (= e!803228 (noDuplicate!2626 (t!47972 Nil!33283)))))

(assert (= (and d!153127 (not res!954180)) b!1419170))

(assert (= (and b!1419170 res!954181) b!1419171))

(declare-fun m!1310161 () Bool)

(assert (=> b!1419170 m!1310161))

(declare-fun m!1310163 () Bool)

(assert (=> b!1419171 m!1310163))

(assert (=> b!1419114 d!153127))

(declare-fun d!153131 () Bool)

(assert (=> d!153131 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122474 d!153131))

(declare-fun d!153139 () Bool)

(assert (=> d!153139 (= (array_inv!36070 a!2831) (bvsge (size!47340 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122474 d!153139))

(declare-fun b!1419206 () Bool)

(declare-fun e!803258 () Bool)

(declare-fun e!803259 () Bool)

(assert (=> b!1419206 (= e!803258 e!803259)))

(declare-fun lt!625914 () (_ BitVec 64))

(assert (=> b!1419206 (= lt!625914 (select (arr!46789 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47995 0))(
  ( (Unit!47996) )
))
(declare-fun lt!625912 () Unit!47995)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96932 (_ BitVec 64) (_ BitVec 32)) Unit!47995)

(assert (=> b!1419206 (= lt!625912 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625914 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419206 (arrayContainsKey!0 a!2831 lt!625914 #b00000000000000000000000000000000)))

(declare-fun lt!625913 () Unit!47995)

(assert (=> b!1419206 (= lt!625913 lt!625912)))

(declare-fun res!954206 () Bool)

(declare-datatypes ((SeekEntryResult!10996 0))(
  ( (MissingZero!10996 (index!46376 (_ BitVec 32))) (Found!10996 (index!46377 (_ BitVec 32))) (Intermediate!10996 (undefined!11808 Bool) (index!46378 (_ BitVec 32)) (x!128146 (_ BitVec 32))) (Undefined!10996) (MissingVacant!10996 (index!46379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96932 (_ BitVec 32)) SeekEntryResult!10996)

(assert (=> b!1419206 (= res!954206 (= (seekEntryOrOpen!0 (select (arr!46789 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!10996 #b00000000000000000000000000000000)))))

(assert (=> b!1419206 (=> (not res!954206) (not e!803259))))

(declare-fun bm!67302 () Bool)

(declare-fun call!67305 () Bool)

(assert (=> bm!67302 (= call!67305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153143 () Bool)

(declare-fun res!954207 () Bool)

(declare-fun e!803260 () Bool)

(assert (=> d!153143 (=> res!954207 e!803260)))

(assert (=> d!153143 (= res!954207 (bvsge #b00000000000000000000000000000000 (size!47340 a!2831)))))

(assert (=> d!153143 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803260)))

(declare-fun b!1419207 () Bool)

(assert (=> b!1419207 (= e!803260 e!803258)))

(declare-fun c!131989 () Bool)

(assert (=> b!1419207 (= c!131989 (validKeyInArray!0 (select (arr!46789 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419208 () Bool)

(assert (=> b!1419208 (= e!803259 call!67305)))

(declare-fun b!1419209 () Bool)

(assert (=> b!1419209 (= e!803258 call!67305)))

(assert (= (and d!153143 (not res!954207)) b!1419207))

(assert (= (and b!1419207 c!131989) b!1419206))

(assert (= (and b!1419207 (not c!131989)) b!1419209))

(assert (= (and b!1419206 res!954206) b!1419208))

(assert (= (or b!1419208 b!1419209) bm!67302))

(declare-fun m!1310191 () Bool)

(assert (=> b!1419206 m!1310191))

(declare-fun m!1310193 () Bool)

(assert (=> b!1419206 m!1310193))

(declare-fun m!1310195 () Bool)

(assert (=> b!1419206 m!1310195))

(assert (=> b!1419206 m!1310191))

(declare-fun m!1310197 () Bool)

(assert (=> b!1419206 m!1310197))

(declare-fun m!1310199 () Bool)

(assert (=> bm!67302 m!1310199))

(assert (=> b!1419207 m!1310191))

(assert (=> b!1419207 m!1310191))

(declare-fun m!1310201 () Bool)

(assert (=> b!1419207 m!1310201))

(assert (=> b!1419113 d!153143))

(declare-fun d!153157 () Bool)

(declare-fun lt!625919 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!762 (List!33286) (InoxSet (_ BitVec 64)))

(assert (=> d!153157 (= lt!625919 (select (content!762 Nil!33283) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!803272 () Bool)

(assert (=> d!153157 (= lt!625919 e!803272)))

(declare-fun res!954219 () Bool)

(assert (=> d!153157 (=> (not res!954219) (not e!803272))))

(assert (=> d!153157 (= res!954219 ((_ is Cons!33282) Nil!33283))))

(assert (=> d!153157 (= (contains!9877 Nil!33283 #b1000000000000000000000000000000000000000000000000000000000000000) lt!625919)))

(declare-fun b!1419220 () Bool)

(declare-fun e!803271 () Bool)

(assert (=> b!1419220 (= e!803272 e!803271)))

(declare-fun res!954218 () Bool)

(assert (=> b!1419220 (=> res!954218 e!803271)))

(assert (=> b!1419220 (= res!954218 (= (h!34583 Nil!33283) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419221 () Bool)

(assert (=> b!1419221 (= e!803271 (contains!9877 (t!47972 Nil!33283) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153157 res!954219) b!1419220))

(assert (= (and b!1419220 (not res!954218)) b!1419221))

(declare-fun m!1310203 () Bool)

(assert (=> d!153157 m!1310203))

(declare-fun m!1310207 () Bool)

(assert (=> d!153157 m!1310207))

(declare-fun m!1310211 () Bool)

(assert (=> b!1419221 m!1310211))

(assert (=> b!1419111 d!153157))

(declare-fun d!153159 () Bool)

(assert (=> d!153159 (= (validKeyInArray!0 (select (arr!46789 a!2831) j!81)) (and (not (= (select (arr!46789 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46789 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419112 d!153159))

(declare-fun d!153165 () Bool)

(assert (=> d!153165 (= (validKeyInArray!0 (select (arr!46789 a!2831) i!982)) (and (not (= (select (arr!46789 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46789 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419117 d!153165))

(declare-fun d!153167 () Bool)

(declare-fun lt!625928 () Bool)

(assert (=> d!153167 (= lt!625928 (select (content!762 Nil!33283) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!803282 () Bool)

(assert (=> d!153167 (= lt!625928 e!803282)))

(declare-fun res!954227 () Bool)

(assert (=> d!153167 (=> (not res!954227) (not e!803282))))

(assert (=> d!153167 (= res!954227 ((_ is Cons!33282) Nil!33283))))

(assert (=> d!153167 (= (contains!9877 Nil!33283 #b0000000000000000000000000000000000000000000000000000000000000000) lt!625928)))

(declare-fun b!1419232 () Bool)

(declare-fun e!803281 () Bool)

(assert (=> b!1419232 (= e!803282 e!803281)))

(declare-fun res!954226 () Bool)

(assert (=> b!1419232 (=> res!954226 e!803281)))

(assert (=> b!1419232 (= res!954226 (= (h!34583 Nil!33283) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419233 () Bool)

(assert (=> b!1419233 (= e!803281 (contains!9877 (t!47972 Nil!33283) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153167 res!954227) b!1419232))

(assert (= (and b!1419232 (not res!954226)) b!1419233))

(assert (=> d!153167 m!1310203))

(declare-fun m!1310219 () Bool)

(assert (=> d!153167 m!1310219))

(declare-fun m!1310221 () Bool)

(assert (=> b!1419233 m!1310221))

(assert (=> b!1419116 d!153167))

(check-sat (not b!1419233) (not b!1419171) (not bm!67302) (not d!153157) (not b!1419221) (not b!1419206) (not b!1419170) (not d!153167) (not b!1419207))
(check-sat)
