; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127838 () Bool)

(assert start!127838)

(declare-fun b!1502219 () Bool)

(declare-fun res!1023398 () Bool)

(declare-fun e!840140 () Bool)

(assert (=> b!1502219 (=> (not res!1023398) (not e!840140))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100180 0))(
  ( (array!100181 (arr!48349 (Array (_ BitVec 32) (_ BitVec 64))) (size!48901 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100180)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502219 (= res!1023398 (and (= (size!48901 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48901 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48901 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502220 () Bool)

(declare-fun res!1023395 () Bool)

(assert (=> b!1502220 (=> (not res!1023395) (not e!840140))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502220 (= res!1023395 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48901 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48901 a!2850)) (= (select (arr!48349 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48901 a!2850))))))

(declare-fun b!1502221 () Bool)

(declare-fun res!1023396 () Bool)

(assert (=> b!1502221 (=> (not res!1023396) (not e!840140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502221 (= res!1023396 (validKeyInArray!0 (select (arr!48349 a!2850) j!87)))))

(declare-fun b!1502222 () Bool)

(declare-fun res!1023397 () Bool)

(assert (=> b!1502222 (=> (not res!1023397) (not e!840140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100180 (_ BitVec 32)) Bool)

(assert (=> b!1502222 (= res!1023397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502224 () Bool)

(declare-fun res!1023394 () Bool)

(assert (=> b!1502224 (=> (not res!1023394) (not e!840140))))

(declare-datatypes ((List!34919 0))(
  ( (Nil!34916) (Cons!34915 (h!36313 (_ BitVec 64)) (t!49605 List!34919)) )
))
(declare-fun arrayNoDuplicates!0 (array!100180 (_ BitVec 32) List!34919) Bool)

(assert (=> b!1502224 (= res!1023394 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34916))))

(declare-fun b!1502225 () Bool)

(declare-fun e!840141 () Bool)

(assert (=> b!1502225 (= e!840140 e!840141)))

(declare-fun res!1023400 () Bool)

(assert (=> b!1502225 (=> (not res!1023400) (not e!840141))))

(declare-datatypes ((SeekEntryResult!12568 0))(
  ( (MissingZero!12568 (index!52664 (_ BitVec 32))) (Found!12568 (index!52665 (_ BitVec 32))) (Intermediate!12568 (undefined!13380 Bool) (index!52666 (_ BitVec 32)) (x!134360 (_ BitVec 32))) (Undefined!12568) (MissingVacant!12568 (index!52667 (_ BitVec 32))) )
))
(declare-fun lt!653113 () SeekEntryResult!12568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100180 (_ BitVec 32)) SeekEntryResult!12568)

(assert (=> b!1502225 (= res!1023400 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48349 a!2850) j!87) a!2850 mask!2661) lt!653113))))

(assert (=> b!1502225 (= lt!653113 (Found!12568 j!87))))

(declare-fun res!1023401 () Bool)

(assert (=> start!127838 (=> (not res!1023401) (not e!840140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127838 (= res!1023401 (validMask!0 mask!2661))))

(assert (=> start!127838 e!840140))

(assert (=> start!127838 true))

(declare-fun array_inv!37582 (array!100180) Bool)

(assert (=> start!127838 (array_inv!37582 a!2850)))

(declare-fun b!1502223 () Bool)

(declare-fun res!1023393 () Bool)

(assert (=> b!1502223 (=> (not res!1023393) (not e!840140))))

(assert (=> b!1502223 (= res!1023393 (validKeyInArray!0 (select (arr!48349 a!2850) i!996)))))

(declare-fun b!1502226 () Bool)

(declare-fun res!1023399 () Bool)

(assert (=> b!1502226 (=> (not res!1023399) (not e!840141))))

(assert (=> b!1502226 (= res!1023399 (and (= (select (arr!48349 a!2850) index!625) (select (arr!48349 a!2850) j!87)) (= j!87 index!625)))))

(declare-fun b!1502227 () Bool)

(assert (=> b!1502227 (= e!840141 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850)) mask!2661) lt!653113)))))

(assert (= (and start!127838 res!1023401) b!1502219))

(assert (= (and b!1502219 res!1023398) b!1502223))

(assert (= (and b!1502223 res!1023393) b!1502221))

(assert (= (and b!1502221 res!1023396) b!1502222))

(assert (= (and b!1502222 res!1023397) b!1502224))

(assert (= (and b!1502224 res!1023394) b!1502220))

(assert (= (and b!1502220 res!1023395) b!1502225))

(assert (= (and b!1502225 res!1023400) b!1502226))

(assert (= (and b!1502226 res!1023399) b!1502227))

(declare-fun m!1384939 () Bool)

(assert (=> b!1502221 m!1384939))

(assert (=> b!1502221 m!1384939))

(declare-fun m!1384941 () Bool)

(assert (=> b!1502221 m!1384941))

(declare-fun m!1384943 () Bool)

(assert (=> b!1502226 m!1384943))

(assert (=> b!1502226 m!1384939))

(declare-fun m!1384945 () Bool)

(assert (=> b!1502224 m!1384945))

(declare-fun m!1384947 () Bool)

(assert (=> b!1502220 m!1384947))

(declare-fun m!1384949 () Bool)

(assert (=> b!1502220 m!1384949))

(declare-fun m!1384951 () Bool)

(assert (=> b!1502220 m!1384951))

(assert (=> b!1502225 m!1384939))

(assert (=> b!1502225 m!1384939))

(declare-fun m!1384953 () Bool)

(assert (=> b!1502225 m!1384953))

(declare-fun m!1384955 () Bool)

(assert (=> b!1502222 m!1384955))

(assert (=> b!1502227 m!1384949))

(declare-fun m!1384957 () Bool)

(assert (=> b!1502227 m!1384957))

(assert (=> b!1502227 m!1384957))

(declare-fun m!1384959 () Bool)

(assert (=> b!1502227 m!1384959))

(declare-fun m!1384961 () Bool)

(assert (=> b!1502223 m!1384961))

(assert (=> b!1502223 m!1384961))

(declare-fun m!1384963 () Bool)

(assert (=> b!1502223 m!1384963))

(declare-fun m!1384965 () Bool)

(assert (=> start!127838 m!1384965))

(declare-fun m!1384967 () Bool)

(assert (=> start!127838 m!1384967))

(check-sat (not b!1502223) (not b!1502221) (not b!1502224) (not b!1502227) (not b!1502222) (not start!127838) (not b!1502225))
(check-sat)
(get-model)

(declare-fun d!157459 () Bool)

(assert (=> d!157459 (= (validKeyInArray!0 (select (arr!48349 a!2850) i!996)) (and (not (= (select (arr!48349 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48349 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502223 d!157459))

(declare-fun b!1502293 () Bool)

(declare-fun e!840169 () Bool)

(declare-fun e!840170 () Bool)

(assert (=> b!1502293 (= e!840169 e!840170)))

(declare-fun res!1023463 () Bool)

(assert (=> b!1502293 (=> (not res!1023463) (not e!840170))))

(declare-fun e!840168 () Bool)

(assert (=> b!1502293 (= res!1023463 (not e!840168))))

(declare-fun res!1023462 () Bool)

(assert (=> b!1502293 (=> (not res!1023462) (not e!840168))))

(assert (=> b!1502293 (= res!1023462 (validKeyInArray!0 (select (arr!48349 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68051 () Bool)

(declare-fun call!68054 () Bool)

(declare-fun c!138952 () Bool)

(assert (=> bm!68051 (= call!68054 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138952 (Cons!34915 (select (arr!48349 a!2850) #b00000000000000000000000000000000) Nil!34916) Nil!34916)))))

(declare-fun b!1502294 () Bool)

(declare-fun e!840171 () Bool)

(assert (=> b!1502294 (= e!840171 call!68054)))

(declare-fun d!157461 () Bool)

(declare-fun res!1023464 () Bool)

(assert (=> d!157461 (=> res!1023464 e!840169)))

(assert (=> d!157461 (= res!1023464 (bvsge #b00000000000000000000000000000000 (size!48901 a!2850)))))

(assert (=> d!157461 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34916) e!840169)))

(declare-fun b!1502292 () Bool)

(assert (=> b!1502292 (= e!840171 call!68054)))

(declare-fun b!1502295 () Bool)

(declare-fun contains!9910 (List!34919 (_ BitVec 64)) Bool)

(assert (=> b!1502295 (= e!840168 (contains!9910 Nil!34916 (select (arr!48349 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502296 () Bool)

(assert (=> b!1502296 (= e!840170 e!840171)))

(assert (=> b!1502296 (= c!138952 (validKeyInArray!0 (select (arr!48349 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157461 (not res!1023464)) b!1502293))

(assert (= (and b!1502293 res!1023462) b!1502295))

(assert (= (and b!1502293 res!1023463) b!1502296))

(assert (= (and b!1502296 c!138952) b!1502292))

(assert (= (and b!1502296 (not c!138952)) b!1502294))

(assert (= (or b!1502292 b!1502294) bm!68051))

(declare-fun m!1385029 () Bool)

(assert (=> b!1502293 m!1385029))

(assert (=> b!1502293 m!1385029))

(declare-fun m!1385031 () Bool)

(assert (=> b!1502293 m!1385031))

(assert (=> bm!68051 m!1385029))

(declare-fun m!1385033 () Bool)

(assert (=> bm!68051 m!1385033))

(assert (=> b!1502295 m!1385029))

(assert (=> b!1502295 m!1385029))

(declare-fun m!1385035 () Bool)

(assert (=> b!1502295 m!1385035))

(assert (=> b!1502296 m!1385029))

(assert (=> b!1502296 m!1385029))

(assert (=> b!1502296 m!1385031))

(assert (=> b!1502224 d!157461))

(declare-fun d!157463 () Bool)

(assert (=> d!157463 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127838 d!157463))

(declare-fun d!157465 () Bool)

(assert (=> d!157465 (= (array_inv!37582 a!2850) (bvsge (size!48901 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127838 d!157465))

(declare-fun e!840190 () SeekEntryResult!12568)

(declare-fun b!1502324 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502324 (= e!840190 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48349 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502325 () Bool)

(declare-fun c!138962 () Bool)

(declare-fun lt!653124 () (_ BitVec 64))

(assert (=> b!1502325 (= c!138962 (= lt!653124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840191 () SeekEntryResult!12568)

(assert (=> b!1502325 (= e!840191 e!840190)))

(declare-fun b!1502326 () Bool)

(declare-fun e!840192 () SeekEntryResult!12568)

(assert (=> b!1502326 (= e!840192 e!840191)))

(declare-fun c!138964 () Bool)

(assert (=> b!1502326 (= c!138964 (= lt!653124 (select (arr!48349 a!2850) j!87)))))

(declare-fun b!1502327 () Bool)

(assert (=> b!1502327 (= e!840191 (Found!12568 index!625))))

(declare-fun d!157467 () Bool)

(declare-fun lt!653125 () SeekEntryResult!12568)

(get-info :version)

(assert (=> d!157467 (and (or ((_ is Undefined!12568) lt!653125) (not ((_ is Found!12568) lt!653125)) (and (bvsge (index!52665 lt!653125) #b00000000000000000000000000000000) (bvslt (index!52665 lt!653125) (size!48901 a!2850)))) (or ((_ is Undefined!12568) lt!653125) ((_ is Found!12568) lt!653125) (not ((_ is MissingVacant!12568) lt!653125)) (not (= (index!52667 lt!653125) vacantBefore!10)) (and (bvsge (index!52667 lt!653125) #b00000000000000000000000000000000) (bvslt (index!52667 lt!653125) (size!48901 a!2850)))) (or ((_ is Undefined!12568) lt!653125) (ite ((_ is Found!12568) lt!653125) (= (select (arr!48349 a!2850) (index!52665 lt!653125)) (select (arr!48349 a!2850) j!87)) (and ((_ is MissingVacant!12568) lt!653125) (= (index!52667 lt!653125) vacantBefore!10) (= (select (arr!48349 a!2850) (index!52667 lt!653125)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157467 (= lt!653125 e!840192)))

(declare-fun c!138963 () Bool)

(assert (=> d!157467 (= c!138963 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157467 (= lt!653124 (select (arr!48349 a!2850) index!625))))

(assert (=> d!157467 (validMask!0 mask!2661)))

(assert (=> d!157467 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48349 a!2850) j!87) a!2850 mask!2661) lt!653125)))

(declare-fun b!1502328 () Bool)

(assert (=> b!1502328 (= e!840192 Undefined!12568)))

(declare-fun b!1502329 () Bool)

(assert (=> b!1502329 (= e!840190 (MissingVacant!12568 vacantBefore!10))))

(assert (= (and d!157467 c!138963) b!1502328))

(assert (= (and d!157467 (not c!138963)) b!1502326))

(assert (= (and b!1502326 c!138964) b!1502327))

(assert (= (and b!1502326 (not c!138964)) b!1502325))

(assert (= (and b!1502325 c!138962) b!1502329))

(assert (= (and b!1502325 (not c!138962)) b!1502324))

(declare-fun m!1385045 () Bool)

(assert (=> b!1502324 m!1385045))

(assert (=> b!1502324 m!1385045))

(assert (=> b!1502324 m!1384939))

(declare-fun m!1385047 () Bool)

(assert (=> b!1502324 m!1385047))

(declare-fun m!1385049 () Bool)

(assert (=> d!157467 m!1385049))

(declare-fun m!1385051 () Bool)

(assert (=> d!157467 m!1385051))

(assert (=> d!157467 m!1384943))

(assert (=> d!157467 m!1384965))

(assert (=> b!1502225 d!157467))

(declare-fun d!157475 () Bool)

(assert (=> d!157475 (= (validKeyInArray!0 (select (arr!48349 a!2850) j!87)) (and (not (= (select (arr!48349 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48349 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502221 d!157475))

(declare-fun e!840193 () SeekEntryResult!12568)

(declare-fun b!1502330 () Bool)

(assert (=> b!1502330 (= e!840193 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantAfter!10 (select (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850)) mask!2661))))

(declare-fun b!1502331 () Bool)

(declare-fun c!138965 () Bool)

(declare-fun lt!653126 () (_ BitVec 64))

(assert (=> b!1502331 (= c!138965 (= lt!653126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840194 () SeekEntryResult!12568)

(assert (=> b!1502331 (= e!840194 e!840193)))

(declare-fun b!1502332 () Bool)

(declare-fun e!840195 () SeekEntryResult!12568)

(assert (=> b!1502332 (= e!840195 e!840194)))

(declare-fun c!138967 () Bool)

(assert (=> b!1502332 (= c!138967 (= lt!653126 (select (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun b!1502333 () Bool)

(assert (=> b!1502333 (= e!840194 (Found!12568 index!625))))

(declare-fun d!157477 () Bool)

(declare-fun lt!653127 () SeekEntryResult!12568)

(assert (=> d!157477 (and (or ((_ is Undefined!12568) lt!653127) (not ((_ is Found!12568) lt!653127)) (and (bvsge (index!52665 lt!653127) #b00000000000000000000000000000000) (bvslt (index!52665 lt!653127) (size!48901 (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850)))))) (or ((_ is Undefined!12568) lt!653127) ((_ is Found!12568) lt!653127) (not ((_ is MissingVacant!12568) lt!653127)) (not (= (index!52667 lt!653127) vacantAfter!10)) (and (bvsge (index!52667 lt!653127) #b00000000000000000000000000000000) (bvslt (index!52667 lt!653127) (size!48901 (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850)))))) (or ((_ is Undefined!12568) lt!653127) (ite ((_ is Found!12568) lt!653127) (= (select (arr!48349 (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850))) (index!52665 lt!653127)) (select (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)) (and ((_ is MissingVacant!12568) lt!653127) (= (index!52667 lt!653127) vacantAfter!10) (= (select (arr!48349 (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850))) (index!52667 lt!653127)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157477 (= lt!653127 e!840195)))

(declare-fun c!138966 () Bool)

(assert (=> d!157477 (= c!138966 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157477 (= lt!653126 (select (arr!48349 (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850))) index!625))))

(assert (=> d!157477 (validMask!0 mask!2661)))

(assert (=> d!157477 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100181 (store (arr!48349 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48901 a!2850)) mask!2661) lt!653127)))

(declare-fun b!1502334 () Bool)

(assert (=> b!1502334 (= e!840195 Undefined!12568)))

(declare-fun b!1502335 () Bool)

(assert (=> b!1502335 (= e!840193 (MissingVacant!12568 vacantAfter!10))))

(assert (= (and d!157477 c!138966) b!1502334))

(assert (= (and d!157477 (not c!138966)) b!1502332))

(assert (= (and b!1502332 c!138967) b!1502333))

(assert (= (and b!1502332 (not c!138967)) b!1502331))

(assert (= (and b!1502331 c!138965) b!1502335))

(assert (= (and b!1502331 (not c!138965)) b!1502330))

(assert (=> b!1502330 m!1385045))

(assert (=> b!1502330 m!1385045))

(assert (=> b!1502330 m!1384957))

(declare-fun m!1385053 () Bool)

(assert (=> b!1502330 m!1385053))

(declare-fun m!1385055 () Bool)

(assert (=> d!157477 m!1385055))

(declare-fun m!1385057 () Bool)

(assert (=> d!157477 m!1385057))

(declare-fun m!1385059 () Bool)

(assert (=> d!157477 m!1385059))

(assert (=> d!157477 m!1384965))

(assert (=> b!1502227 d!157477))

(declare-fun bm!68063 () Bool)

(declare-fun call!68066 () Bool)

(assert (=> bm!68063 (= call!68066 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1502368 () Bool)

(declare-fun e!840221 () Bool)

(declare-fun e!840222 () Bool)

(assert (=> b!1502368 (= e!840221 e!840222)))

(declare-fun c!138976 () Bool)

(assert (=> b!1502368 (= c!138976 (validKeyInArray!0 (select (arr!48349 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157479 () Bool)

(declare-fun res!1023491 () Bool)

(assert (=> d!157479 (=> res!1023491 e!840221)))

(assert (=> d!157479 (= res!1023491 (bvsge #b00000000000000000000000000000000 (size!48901 a!2850)))))

(assert (=> d!157479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840221)))

(declare-fun b!1502369 () Bool)

(declare-fun e!840220 () Bool)

(assert (=> b!1502369 (= e!840220 call!68066)))

(declare-fun b!1502370 () Bool)

(assert (=> b!1502370 (= e!840222 e!840220)))

(declare-fun lt!653153 () (_ BitVec 64))

(assert (=> b!1502370 (= lt!653153 (select (arr!48349 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50095 0))(
  ( (Unit!50096) )
))
(declare-fun lt!653152 () Unit!50095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100180 (_ BitVec 64) (_ BitVec 32)) Unit!50095)

(assert (=> b!1502370 (= lt!653152 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653153 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1502370 (arrayContainsKey!0 a!2850 lt!653153 #b00000000000000000000000000000000)))

(declare-fun lt!653154 () Unit!50095)

(assert (=> b!1502370 (= lt!653154 lt!653152)))

(declare-fun res!1023490 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100180 (_ BitVec 32)) SeekEntryResult!12568)

(assert (=> b!1502370 (= res!1023490 (= (seekEntryOrOpen!0 (select (arr!48349 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12568 #b00000000000000000000000000000000)))))

(assert (=> b!1502370 (=> (not res!1023490) (not e!840220))))

(declare-fun b!1502371 () Bool)

(assert (=> b!1502371 (= e!840222 call!68066)))

(assert (= (and d!157479 (not res!1023491)) b!1502368))

(assert (= (and b!1502368 c!138976) b!1502370))

(assert (= (and b!1502368 (not c!138976)) b!1502371))

(assert (= (and b!1502370 res!1023490) b!1502369))

(assert (= (or b!1502369 b!1502371) bm!68063))

(declare-fun m!1385081 () Bool)

(assert (=> bm!68063 m!1385081))

(assert (=> b!1502368 m!1385029))

(assert (=> b!1502368 m!1385029))

(assert (=> b!1502368 m!1385031))

(assert (=> b!1502370 m!1385029))

(declare-fun m!1385083 () Bool)

(assert (=> b!1502370 m!1385083))

(declare-fun m!1385085 () Bool)

(assert (=> b!1502370 m!1385085))

(assert (=> b!1502370 m!1385029))

(declare-fun m!1385087 () Bool)

(assert (=> b!1502370 m!1385087))

(assert (=> b!1502222 d!157479))

(check-sat (not b!1502330) (not d!157477) (not bm!68051) (not b!1502324) (not b!1502295) (not b!1502368) (not bm!68063) (not d!157467) (not b!1502296) (not b!1502370) (not b!1502293))
(check-sat)
