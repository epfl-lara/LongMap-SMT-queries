; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128192 () Bool)

(assert start!128192)

(declare-fun res!1025776 () Bool)

(declare-fun e!841267 () Bool)

(assert (=> start!128192 (=> (not res!1025776) (not e!841267))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128192 (= res!1025776 (validMask!0 mask!2661))))

(assert (=> start!128192 e!841267))

(assert (=> start!128192 true))

(declare-datatypes ((array!100390 0))(
  ( (array!100391 (arr!48447 (Array (_ BitVec 32) (_ BitVec 64))) (size!48997 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100390)

(declare-fun array_inv!37475 (array!100390) Bool)

(assert (=> start!128192 (array_inv!37475 a!2850)))

(declare-fun b!1505178 () Bool)

(declare-fun e!841266 () Bool)

(declare-fun e!841270 () Bool)

(assert (=> b!1505178 (= e!841266 e!841270)))

(declare-fun res!1025774 () Bool)

(assert (=> b!1505178 (=> (not res!1025774) (not e!841270))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12645 0))(
  ( (MissingZero!12645 (index!52972 (_ BitVec 32))) (Found!12645 (index!52973 (_ BitVec 32))) (Intermediate!12645 (undefined!13457 Bool) (index!52974 (_ BitVec 32)) (x!134655 (_ BitVec 32))) (Undefined!12645) (MissingVacant!12645 (index!52975 (_ BitVec 32))) )
))
(declare-fun lt!653924 () SeekEntryResult!12645)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100390 (_ BitVec 32)) SeekEntryResult!12645)

(assert (=> b!1505178 (= res!1025774 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48447 a!2850) j!87) a!2850 mask!2661) lt!653924))))

(assert (=> b!1505178 (= lt!653924 (Found!12645 j!87))))

(declare-fun b!1505179 () Bool)

(declare-fun res!1025779 () Bool)

(assert (=> b!1505179 (=> (not res!1025779) (not e!841267))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1505179 (= res!1025779 (and (= (size!48997 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48997 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48997 a!2850)) (not (= i!996 j!87))))))

(declare-fun lt!653922 () array!100390)

(declare-fun e!841268 () Bool)

(declare-fun b!1505180 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun lt!653925 () (_ BitVec 64))

(assert (=> b!1505180 (= e!841268 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653925 lt!653922 mask!2661) lt!653924)))))

(declare-fun lt!653926 () (_ BitVec 32))

(assert (=> b!1505180 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantAfter!10 lt!653925 lt!653922 mask!2661) lt!653924)))

(assert (=> b!1505180 (= lt!653925 (select (store (arr!48447 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))

(declare-datatypes ((Unit!50296 0))(
  ( (Unit!50297) )
))
(declare-fun lt!653923 () Unit!50296)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50296)

(assert (=> b!1505180 (= lt!653923 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1505181 () Bool)

(assert (=> b!1505181 (= e!841270 e!841268)))

(declare-fun res!1025777 () Bool)

(assert (=> b!1505181 (=> (not res!1025777) (not e!841268))))

(assert (=> b!1505181 (= res!1025777 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653926 #b00000000000000000000000000000000) (bvslt lt!653926 (size!48997 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505181 (= lt!653926 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1505182 () Bool)

(declare-fun res!1025771 () Bool)

(assert (=> b!1505182 (=> (not res!1025771) (not e!841267))))

(assert (=> b!1505182 (= res!1025771 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48997 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48997 a!2850)) (= (select (arr!48447 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1505183 () Bool)

(assert (=> b!1505183 (= e!841267 e!841266)))

(declare-fun res!1025768 () Bool)

(assert (=> b!1505183 (=> (not res!1025768) (not e!841266))))

(assert (=> b!1505183 (= res!1025768 (and (= (select (store (arr!48447 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48997 a!2850))))))

(assert (=> b!1505183 (= lt!653922 (array!100391 (store (arr!48447 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48997 a!2850)))))

(declare-fun b!1505184 () Bool)

(declare-fun res!1025778 () Bool)

(assert (=> b!1505184 (=> (not res!1025778) (not e!841267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505184 (= res!1025778 (validKeyInArray!0 (select (arr!48447 a!2850) j!87)))))

(declare-fun b!1505185 () Bool)

(declare-fun res!1025772 () Bool)

(assert (=> b!1505185 (=> (not res!1025772) (not e!841267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100390 (_ BitVec 32)) Bool)

(assert (=> b!1505185 (= res!1025772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505186 () Bool)

(declare-fun res!1025770 () Bool)

(assert (=> b!1505186 (=> (not res!1025770) (not e!841267))))

(assert (=> b!1505186 (= res!1025770 (validKeyInArray!0 (select (arr!48447 a!2850) i!996)))))

(declare-fun b!1505187 () Bool)

(declare-fun res!1025769 () Bool)

(assert (=> b!1505187 (=> (not res!1025769) (not e!841267))))

(declare-datatypes ((List!34939 0))(
  ( (Nil!34936) (Cons!34935 (h!36332 (_ BitVec 64)) (t!49633 List!34939)) )
))
(declare-fun arrayNoDuplicates!0 (array!100390 (_ BitVec 32) List!34939) Bool)

(assert (=> b!1505187 (= res!1025769 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34936))))

(declare-fun b!1505188 () Bool)

(declare-fun res!1025775 () Bool)

(assert (=> b!1505188 (=> (not res!1025775) (not e!841270))))

(assert (=> b!1505188 (= res!1025775 (not (= (select (arr!48447 a!2850) index!625) (select (arr!48447 a!2850) j!87))))))

(declare-fun b!1505189 () Bool)

(declare-fun res!1025773 () Bool)

(assert (=> b!1505189 (=> (not res!1025773) (not e!841268))))

(assert (=> b!1505189 (= res!1025773 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantBefore!10 (select (arr!48447 a!2850) j!87) a!2850 mask!2661) lt!653924))))

(assert (= (and start!128192 res!1025776) b!1505179))

(assert (= (and b!1505179 res!1025779) b!1505186))

(assert (= (and b!1505186 res!1025770) b!1505184))

(assert (= (and b!1505184 res!1025778) b!1505185))

(assert (= (and b!1505185 res!1025772) b!1505187))

(assert (= (and b!1505187 res!1025769) b!1505182))

(assert (= (and b!1505182 res!1025771) b!1505183))

(assert (= (and b!1505183 res!1025768) b!1505178))

(assert (= (and b!1505178 res!1025774) b!1505188))

(assert (= (and b!1505188 res!1025775) b!1505181))

(assert (= (and b!1505181 res!1025777) b!1505189))

(assert (= (and b!1505189 res!1025773) b!1505180))

(declare-fun m!1388295 () Bool)

(assert (=> start!128192 m!1388295))

(declare-fun m!1388297 () Bool)

(assert (=> start!128192 m!1388297))

(declare-fun m!1388299 () Bool)

(assert (=> b!1505182 m!1388299))

(declare-fun m!1388301 () Bool)

(assert (=> b!1505181 m!1388301))

(declare-fun m!1388303 () Bool)

(assert (=> b!1505184 m!1388303))

(assert (=> b!1505184 m!1388303))

(declare-fun m!1388305 () Bool)

(assert (=> b!1505184 m!1388305))

(declare-fun m!1388307 () Bool)

(assert (=> b!1505183 m!1388307))

(declare-fun m!1388309 () Bool)

(assert (=> b!1505183 m!1388309))

(declare-fun m!1388311 () Bool)

(assert (=> b!1505185 m!1388311))

(declare-fun m!1388313 () Bool)

(assert (=> b!1505186 m!1388313))

(assert (=> b!1505186 m!1388313))

(declare-fun m!1388315 () Bool)

(assert (=> b!1505186 m!1388315))

(assert (=> b!1505189 m!1388303))

(assert (=> b!1505189 m!1388303))

(declare-fun m!1388317 () Bool)

(assert (=> b!1505189 m!1388317))

(declare-fun m!1388319 () Bool)

(assert (=> b!1505188 m!1388319))

(assert (=> b!1505188 m!1388303))

(assert (=> b!1505178 m!1388303))

(assert (=> b!1505178 m!1388303))

(declare-fun m!1388321 () Bool)

(assert (=> b!1505178 m!1388321))

(declare-fun m!1388323 () Bool)

(assert (=> b!1505180 m!1388323))

(assert (=> b!1505180 m!1388307))

(declare-fun m!1388325 () Bool)

(assert (=> b!1505180 m!1388325))

(declare-fun m!1388327 () Bool)

(assert (=> b!1505180 m!1388327))

(declare-fun m!1388329 () Bool)

(assert (=> b!1505180 m!1388329))

(declare-fun m!1388331 () Bool)

(assert (=> b!1505187 m!1388331))

(check-sat (not b!1505178) (not b!1505180) (not b!1505187) (not b!1505186) (not b!1505185) (not b!1505189) (not b!1505181) (not b!1505184) (not start!128192))
(check-sat)
(get-model)

(declare-fun d!158001 () Bool)

(assert (=> d!158001 (= (validKeyInArray!0 (select (arr!48447 a!2850) i!996)) (and (not (= (select (arr!48447 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48447 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505186 d!158001))

(declare-fun d!158003 () Bool)

(declare-fun lt!653998 () (_ BitVec 32))

(assert (=> d!158003 (and (bvsge lt!653998 #b00000000000000000000000000000000) (bvslt lt!653998 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158003 (= lt!653998 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!158003 (validMask!0 mask!2661)))

(assert (=> d!158003 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653998)))

(declare-fun bs!43221 () Bool)

(assert (= bs!43221 d!158003))

(declare-fun m!1388479 () Bool)

(assert (=> bs!43221 m!1388479))

(assert (=> bs!43221 m!1388295))

(assert (=> b!1505181 d!158003))

(declare-fun bm!68169 () Bool)

(declare-fun call!68172 () Bool)

(declare-fun c!139289 () Bool)

(assert (=> bm!68169 (= call!68172 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139289 (Cons!34935 (select (arr!48447 a!2850) #b00000000000000000000000000000000) Nil!34936) Nil!34936)))))

(declare-fun b!1505368 () Bool)

(declare-fun e!841380 () Bool)

(declare-fun contains!9956 (List!34939 (_ BitVec 64)) Bool)

(assert (=> b!1505368 (= e!841380 (contains!9956 Nil!34936 (select (arr!48447 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505369 () Bool)

(declare-fun e!841381 () Bool)

(declare-fun e!841378 () Bool)

(assert (=> b!1505369 (= e!841381 e!841378)))

(declare-fun res!1025859 () Bool)

(assert (=> b!1505369 (=> (not res!1025859) (not e!841378))))

(assert (=> b!1505369 (= res!1025859 (not e!841380))))

(declare-fun res!1025858 () Bool)

(assert (=> b!1505369 (=> (not res!1025858) (not e!841380))))

(assert (=> b!1505369 (= res!1025858 (validKeyInArray!0 (select (arr!48447 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505370 () Bool)

(declare-fun e!841379 () Bool)

(assert (=> b!1505370 (= e!841379 call!68172)))

(declare-fun b!1505371 () Bool)

(assert (=> b!1505371 (= e!841378 e!841379)))

(assert (=> b!1505371 (= c!139289 (validKeyInArray!0 (select (arr!48447 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!158005 () Bool)

(declare-fun res!1025860 () Bool)

(assert (=> d!158005 (=> res!1025860 e!841381)))

(assert (=> d!158005 (= res!1025860 (bvsge #b00000000000000000000000000000000 (size!48997 a!2850)))))

(assert (=> d!158005 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34936) e!841381)))

(declare-fun b!1505372 () Bool)

(assert (=> b!1505372 (= e!841379 call!68172)))

(assert (= (and d!158005 (not res!1025860)) b!1505369))

(assert (= (and b!1505369 res!1025858) b!1505368))

(assert (= (and b!1505369 res!1025859) b!1505371))

(assert (= (and b!1505371 c!139289) b!1505370))

(assert (= (and b!1505371 (not c!139289)) b!1505372))

(assert (= (or b!1505370 b!1505372) bm!68169))

(declare-fun m!1388481 () Bool)

(assert (=> bm!68169 m!1388481))

(declare-fun m!1388483 () Bool)

(assert (=> bm!68169 m!1388483))

(assert (=> b!1505368 m!1388481))

(assert (=> b!1505368 m!1388481))

(declare-fun m!1388485 () Bool)

(assert (=> b!1505368 m!1388485))

(assert (=> b!1505369 m!1388481))

(assert (=> b!1505369 m!1388481))

(declare-fun m!1388487 () Bool)

(assert (=> b!1505369 m!1388487))

(assert (=> b!1505371 m!1388481))

(assert (=> b!1505371 m!1388481))

(assert (=> b!1505371 m!1388487))

(assert (=> b!1505187 d!158005))

(declare-fun d!158007 () Bool)

(assert (=> d!158007 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128192 d!158007))

(declare-fun d!158009 () Bool)

(assert (=> d!158009 (= (array_inv!37475 a!2850) (bvsge (size!48997 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128192 d!158009))

(declare-fun lt!654004 () SeekEntryResult!12645)

(declare-fun d!158011 () Bool)

(get-info :version)

(assert (=> d!158011 (and (or ((_ is Undefined!12645) lt!654004) (not ((_ is Found!12645) lt!654004)) (and (bvsge (index!52973 lt!654004) #b00000000000000000000000000000000) (bvslt (index!52973 lt!654004) (size!48997 a!2850)))) (or ((_ is Undefined!12645) lt!654004) ((_ is Found!12645) lt!654004) (not ((_ is MissingVacant!12645) lt!654004)) (not (= (index!52975 lt!654004) vacantBefore!10)) (and (bvsge (index!52975 lt!654004) #b00000000000000000000000000000000) (bvslt (index!52975 lt!654004) (size!48997 a!2850)))) (or ((_ is Undefined!12645) lt!654004) (ite ((_ is Found!12645) lt!654004) (= (select (arr!48447 a!2850) (index!52973 lt!654004)) (select (arr!48447 a!2850) j!87)) (and ((_ is MissingVacant!12645) lt!654004) (= (index!52975 lt!654004) vacantBefore!10) (= (select (arr!48447 a!2850) (index!52975 lt!654004)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841389 () SeekEntryResult!12645)

(assert (=> d!158011 (= lt!654004 e!841389)))

(declare-fun c!139296 () Bool)

(assert (=> d!158011 (= c!139296 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!654003 () (_ BitVec 64))

(assert (=> d!158011 (= lt!654003 (select (arr!48447 a!2850) index!625))))

(assert (=> d!158011 (validMask!0 mask!2661)))

(assert (=> d!158011 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48447 a!2850) j!87) a!2850 mask!2661) lt!654004)))

(declare-fun b!1505385 () Bool)

(assert (=> b!1505385 (= e!841389 Undefined!12645)))

(declare-fun b!1505386 () Bool)

(declare-fun e!841388 () SeekEntryResult!12645)

(assert (=> b!1505386 (= e!841388 (Found!12645 index!625))))

(declare-fun b!1505387 () Bool)

(declare-fun c!139297 () Bool)

(assert (=> b!1505387 (= c!139297 (= lt!654003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841390 () SeekEntryResult!12645)

(assert (=> b!1505387 (= e!841388 e!841390)))

(declare-fun b!1505388 () Bool)

(assert (=> b!1505388 (= e!841389 e!841388)))

(declare-fun c!139298 () Bool)

(assert (=> b!1505388 (= c!139298 (= lt!654003 (select (arr!48447 a!2850) j!87)))))

(declare-fun b!1505389 () Bool)

(assert (=> b!1505389 (= e!841390 (MissingVacant!12645 vacantBefore!10))))

(declare-fun b!1505390 () Bool)

(assert (=> b!1505390 (= e!841390 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48447 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and d!158011 c!139296) b!1505385))

(assert (= (and d!158011 (not c!139296)) b!1505388))

(assert (= (and b!1505388 c!139298) b!1505386))

(assert (= (and b!1505388 (not c!139298)) b!1505387))

(assert (= (and b!1505387 c!139297) b!1505389))

(assert (= (and b!1505387 (not c!139297)) b!1505390))

(declare-fun m!1388489 () Bool)

(assert (=> d!158011 m!1388489))

(declare-fun m!1388491 () Bool)

(assert (=> d!158011 m!1388491))

(assert (=> d!158011 m!1388319))

(assert (=> d!158011 m!1388295))

(assert (=> b!1505390 m!1388301))

(assert (=> b!1505390 m!1388301))

(assert (=> b!1505390 m!1388303))

(declare-fun m!1388493 () Bool)

(assert (=> b!1505390 m!1388493))

(assert (=> b!1505178 d!158011))

(declare-fun d!158013 () Bool)

(declare-fun lt!654006 () SeekEntryResult!12645)

(assert (=> d!158013 (and (or ((_ is Undefined!12645) lt!654006) (not ((_ is Found!12645) lt!654006)) (and (bvsge (index!52973 lt!654006) #b00000000000000000000000000000000) (bvslt (index!52973 lt!654006) (size!48997 a!2850)))) (or ((_ is Undefined!12645) lt!654006) ((_ is Found!12645) lt!654006) (not ((_ is MissingVacant!12645) lt!654006)) (not (= (index!52975 lt!654006) vacantBefore!10)) (and (bvsge (index!52975 lt!654006) #b00000000000000000000000000000000) (bvslt (index!52975 lt!654006) (size!48997 a!2850)))) (or ((_ is Undefined!12645) lt!654006) (ite ((_ is Found!12645) lt!654006) (= (select (arr!48447 a!2850) (index!52973 lt!654006)) (select (arr!48447 a!2850) j!87)) (and ((_ is MissingVacant!12645) lt!654006) (= (index!52975 lt!654006) vacantBefore!10) (= (select (arr!48447 a!2850) (index!52975 lt!654006)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841392 () SeekEntryResult!12645)

(assert (=> d!158013 (= lt!654006 e!841392)))

(declare-fun c!139299 () Bool)

(assert (=> d!158013 (= c!139299 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(declare-fun lt!654005 () (_ BitVec 64))

(assert (=> d!158013 (= lt!654005 (select (arr!48447 a!2850) lt!653926))))

(assert (=> d!158013 (validMask!0 mask!2661)))

(assert (=> d!158013 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantBefore!10 (select (arr!48447 a!2850) j!87) a!2850 mask!2661) lt!654006)))

(declare-fun b!1505391 () Bool)

(assert (=> b!1505391 (= e!841392 Undefined!12645)))

(declare-fun b!1505392 () Bool)

(declare-fun e!841391 () SeekEntryResult!12645)

(assert (=> b!1505392 (= e!841391 (Found!12645 lt!653926))))

(declare-fun b!1505393 () Bool)

(declare-fun c!139300 () Bool)

(assert (=> b!1505393 (= c!139300 (= lt!654005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841393 () SeekEntryResult!12645)

(assert (=> b!1505393 (= e!841391 e!841393)))

(declare-fun b!1505394 () Bool)

(assert (=> b!1505394 (= e!841392 e!841391)))

(declare-fun c!139301 () Bool)

(assert (=> b!1505394 (= c!139301 (= lt!654005 (select (arr!48447 a!2850) j!87)))))

(declare-fun b!1505395 () Bool)

(assert (=> b!1505395 (= e!841393 (MissingVacant!12645 vacantBefore!10))))

(declare-fun b!1505396 () Bool)

(assert (=> b!1505396 (= e!841393 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653926 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48447 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and d!158013 c!139299) b!1505391))

(assert (= (and d!158013 (not c!139299)) b!1505394))

(assert (= (and b!1505394 c!139301) b!1505392))

(assert (= (and b!1505394 (not c!139301)) b!1505393))

(assert (= (and b!1505393 c!139300) b!1505395))

(assert (= (and b!1505393 (not c!139300)) b!1505396))

(declare-fun m!1388495 () Bool)

(assert (=> d!158013 m!1388495))

(declare-fun m!1388497 () Bool)

(assert (=> d!158013 m!1388497))

(declare-fun m!1388499 () Bool)

(assert (=> d!158013 m!1388499))

(assert (=> d!158013 m!1388295))

(declare-fun m!1388501 () Bool)

(assert (=> b!1505396 m!1388501))

(assert (=> b!1505396 m!1388501))

(assert (=> b!1505396 m!1388303))

(declare-fun m!1388503 () Bool)

(assert (=> b!1505396 m!1388503))

(assert (=> b!1505189 d!158013))

(declare-fun d!158015 () Bool)

(assert (=> d!158015 (= (validKeyInArray!0 (select (arr!48447 a!2850) j!87)) (and (not (= (select (arr!48447 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48447 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505184 d!158015))

(declare-fun b!1505405 () Bool)

(declare-fun e!841400 () Bool)

(declare-fun call!68175 () Bool)

(assert (=> b!1505405 (= e!841400 call!68175)))

(declare-fun b!1505406 () Bool)

(declare-fun e!841402 () Bool)

(assert (=> b!1505406 (= e!841402 e!841400)))

(declare-fun lt!654015 () (_ BitVec 64))

(assert (=> b!1505406 (= lt!654015 (select (arr!48447 a!2850) #b00000000000000000000000000000000))))

(declare-fun lt!654013 () Unit!50296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100390 (_ BitVec 64) (_ BitVec 32)) Unit!50296)

(assert (=> b!1505406 (= lt!654013 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!654015 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505406 (arrayContainsKey!0 a!2850 lt!654015 #b00000000000000000000000000000000)))

(declare-fun lt!654014 () Unit!50296)

(assert (=> b!1505406 (= lt!654014 lt!654013)))

(declare-fun res!1025866 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100390 (_ BitVec 32)) SeekEntryResult!12645)

(assert (=> b!1505406 (= res!1025866 (= (seekEntryOrOpen!0 (select (arr!48447 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12645 #b00000000000000000000000000000000)))))

(assert (=> b!1505406 (=> (not res!1025866) (not e!841400))))

(declare-fun d!158017 () Bool)

(declare-fun res!1025865 () Bool)

(declare-fun e!841401 () Bool)

(assert (=> d!158017 (=> res!1025865 e!841401)))

(assert (=> d!158017 (= res!1025865 (bvsge #b00000000000000000000000000000000 (size!48997 a!2850)))))

(assert (=> d!158017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841401)))

(declare-fun bm!68172 () Bool)

(assert (=> bm!68172 (= call!68175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1505407 () Bool)

(assert (=> b!1505407 (= e!841402 call!68175)))

(declare-fun b!1505408 () Bool)

(assert (=> b!1505408 (= e!841401 e!841402)))

(declare-fun c!139304 () Bool)

(assert (=> b!1505408 (= c!139304 (validKeyInArray!0 (select (arr!48447 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158017 (not res!1025865)) b!1505408))

(assert (= (and b!1505408 c!139304) b!1505406))

(assert (= (and b!1505408 (not c!139304)) b!1505407))

(assert (= (and b!1505406 res!1025866) b!1505405))

(assert (= (or b!1505405 b!1505407) bm!68172))

(assert (=> b!1505406 m!1388481))

(declare-fun m!1388505 () Bool)

(assert (=> b!1505406 m!1388505))

(declare-fun m!1388507 () Bool)

(assert (=> b!1505406 m!1388507))

(assert (=> b!1505406 m!1388481))

(declare-fun m!1388509 () Bool)

(assert (=> b!1505406 m!1388509))

(declare-fun m!1388511 () Bool)

(assert (=> bm!68172 m!1388511))

(assert (=> b!1505408 m!1388481))

(assert (=> b!1505408 m!1388481))

(assert (=> b!1505408 m!1388487))

(assert (=> b!1505185 d!158017))

(declare-fun d!158019 () Bool)

(declare-fun lt!654017 () SeekEntryResult!12645)

(assert (=> d!158019 (and (or ((_ is Undefined!12645) lt!654017) (not ((_ is Found!12645) lt!654017)) (and (bvsge (index!52973 lt!654017) #b00000000000000000000000000000000) (bvslt (index!52973 lt!654017) (size!48997 lt!653922)))) (or ((_ is Undefined!12645) lt!654017) ((_ is Found!12645) lt!654017) (not ((_ is MissingVacant!12645) lt!654017)) (not (= (index!52975 lt!654017) vacantAfter!10)) (and (bvsge (index!52975 lt!654017) #b00000000000000000000000000000000) (bvslt (index!52975 lt!654017) (size!48997 lt!653922)))) (or ((_ is Undefined!12645) lt!654017) (ite ((_ is Found!12645) lt!654017) (= (select (arr!48447 lt!653922) (index!52973 lt!654017)) lt!653925) (and ((_ is MissingVacant!12645) lt!654017) (= (index!52975 lt!654017) vacantAfter!10) (= (select (arr!48447 lt!653922) (index!52975 lt!654017)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841404 () SeekEntryResult!12645)

(assert (=> d!158019 (= lt!654017 e!841404)))

(declare-fun c!139305 () Bool)

(assert (=> d!158019 (= c!139305 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!654016 () (_ BitVec 64))

(assert (=> d!158019 (= lt!654016 (select (arr!48447 lt!653922) index!625))))

(assert (=> d!158019 (validMask!0 mask!2661)))

(assert (=> d!158019 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653925 lt!653922 mask!2661) lt!654017)))

(declare-fun b!1505409 () Bool)

(assert (=> b!1505409 (= e!841404 Undefined!12645)))

(declare-fun b!1505410 () Bool)

(declare-fun e!841403 () SeekEntryResult!12645)

(assert (=> b!1505410 (= e!841403 (Found!12645 index!625))))

(declare-fun b!1505411 () Bool)

(declare-fun c!139306 () Bool)

(assert (=> b!1505411 (= c!139306 (= lt!654016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841405 () SeekEntryResult!12645)

(assert (=> b!1505411 (= e!841403 e!841405)))

(declare-fun b!1505412 () Bool)

(assert (=> b!1505412 (= e!841404 e!841403)))

(declare-fun c!139307 () Bool)

(assert (=> b!1505412 (= c!139307 (= lt!654016 lt!653925))))

(declare-fun b!1505413 () Bool)

(assert (=> b!1505413 (= e!841405 (MissingVacant!12645 vacantAfter!10))))

(declare-fun b!1505414 () Bool)

(assert (=> b!1505414 (= e!841405 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantAfter!10 lt!653925 lt!653922 mask!2661))))

(assert (= (and d!158019 c!139305) b!1505409))

(assert (= (and d!158019 (not c!139305)) b!1505412))

(assert (= (and b!1505412 c!139307) b!1505410))

(assert (= (and b!1505412 (not c!139307)) b!1505411))

(assert (= (and b!1505411 c!139306) b!1505413))

(assert (= (and b!1505411 (not c!139306)) b!1505414))

(declare-fun m!1388513 () Bool)

(assert (=> d!158019 m!1388513))

(declare-fun m!1388515 () Bool)

(assert (=> d!158019 m!1388515))

(declare-fun m!1388517 () Bool)

(assert (=> d!158019 m!1388517))

(assert (=> d!158019 m!1388295))

(assert (=> b!1505414 m!1388301))

(assert (=> b!1505414 m!1388301))

(declare-fun m!1388519 () Bool)

(assert (=> b!1505414 m!1388519))

(assert (=> b!1505180 d!158019))

(declare-fun lt!654019 () SeekEntryResult!12645)

(declare-fun d!158021 () Bool)

(assert (=> d!158021 (and (or ((_ is Undefined!12645) lt!654019) (not ((_ is Found!12645) lt!654019)) (and (bvsge (index!52973 lt!654019) #b00000000000000000000000000000000) (bvslt (index!52973 lt!654019) (size!48997 lt!653922)))) (or ((_ is Undefined!12645) lt!654019) ((_ is Found!12645) lt!654019) (not ((_ is MissingVacant!12645) lt!654019)) (not (= (index!52975 lt!654019) vacantAfter!10)) (and (bvsge (index!52975 lt!654019) #b00000000000000000000000000000000) (bvslt (index!52975 lt!654019) (size!48997 lt!653922)))) (or ((_ is Undefined!12645) lt!654019) (ite ((_ is Found!12645) lt!654019) (= (select (arr!48447 lt!653922) (index!52973 lt!654019)) lt!653925) (and ((_ is MissingVacant!12645) lt!654019) (= (index!52975 lt!654019) vacantAfter!10) (= (select (arr!48447 lt!653922) (index!52975 lt!654019)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841407 () SeekEntryResult!12645)

(assert (=> d!158021 (= lt!654019 e!841407)))

(declare-fun c!139308 () Bool)

(assert (=> d!158021 (= c!139308 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(declare-fun lt!654018 () (_ BitVec 64))

(assert (=> d!158021 (= lt!654018 (select (arr!48447 lt!653922) lt!653926))))

(assert (=> d!158021 (validMask!0 mask!2661)))

(assert (=> d!158021 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantAfter!10 lt!653925 lt!653922 mask!2661) lt!654019)))

(declare-fun b!1505415 () Bool)

(assert (=> b!1505415 (= e!841407 Undefined!12645)))

(declare-fun b!1505416 () Bool)

(declare-fun e!841406 () SeekEntryResult!12645)

(assert (=> b!1505416 (= e!841406 (Found!12645 lt!653926))))

(declare-fun b!1505417 () Bool)

(declare-fun c!139309 () Bool)

(assert (=> b!1505417 (= c!139309 (= lt!654018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841408 () SeekEntryResult!12645)

(assert (=> b!1505417 (= e!841406 e!841408)))

(declare-fun b!1505418 () Bool)

(assert (=> b!1505418 (= e!841407 e!841406)))

(declare-fun c!139310 () Bool)

(assert (=> b!1505418 (= c!139310 (= lt!654018 lt!653925))))

(declare-fun b!1505419 () Bool)

(assert (=> b!1505419 (= e!841408 (MissingVacant!12645 vacantAfter!10))))

(declare-fun b!1505420 () Bool)

(assert (=> b!1505420 (= e!841408 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653926 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantAfter!10 lt!653925 lt!653922 mask!2661))))

(assert (= (and d!158021 c!139308) b!1505415))

(assert (= (and d!158021 (not c!139308)) b!1505418))

(assert (= (and b!1505418 c!139310) b!1505416))

(assert (= (and b!1505418 (not c!139310)) b!1505417))

(assert (= (and b!1505417 c!139309) b!1505419))

(assert (= (and b!1505417 (not c!139309)) b!1505420))

(declare-fun m!1388521 () Bool)

(assert (=> d!158021 m!1388521))

(declare-fun m!1388523 () Bool)

(assert (=> d!158021 m!1388523))

(declare-fun m!1388525 () Bool)

(assert (=> d!158021 m!1388525))

(assert (=> d!158021 m!1388295))

(assert (=> b!1505420 m!1388501))

(assert (=> b!1505420 m!1388501))

(declare-fun m!1388527 () Bool)

(assert (=> b!1505420 m!1388527))

(assert (=> b!1505180 d!158021))

(declare-fun d!158023 () Bool)

(declare-fun e!841411 () Bool)

(assert (=> d!158023 e!841411))

(declare-fun res!1025869 () Bool)

(assert (=> d!158023 (=> (not res!1025869) (not e!841411))))

(assert (=> d!158023 (= res!1025869 (and (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48997 a!2850)) (and (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48997 a!2850)))) (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48997 a!2850)) (and (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48997 a!2850)))) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48997 a!2850))))))

(declare-fun lt!654022 () Unit!50296)

(declare-fun choose!27 (array!100390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50296)

(assert (=> d!158023 (= lt!654022 (choose!27 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (=> d!158023 (validMask!0 mask!2661)))

(assert (=> d!158023 (= (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantBefore!10 vacantAfter!10 mask!2661) lt!654022)))

(declare-fun b!1505423 () Bool)

(assert (=> b!1505423 (= e!841411 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653926 vacantAfter!10 (select (store (arr!48447 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100391 (store (arr!48447 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48997 a!2850)) mask!2661) (Found!12645 j!87)))))

(assert (= (and d!158023 res!1025869) b!1505423))

(declare-fun m!1388529 () Bool)

(assert (=> d!158023 m!1388529))

(assert (=> d!158023 m!1388295))

(assert (=> b!1505423 m!1388307))

(assert (=> b!1505423 m!1388323))

(assert (=> b!1505423 m!1388323))

(declare-fun m!1388531 () Bool)

(assert (=> b!1505423 m!1388531))

(assert (=> b!1505180 d!158023))

(check-sat (not b!1505420) (not bm!68172) (not bm!68169) (not d!158013) (not d!158011) (not b!1505408) (not d!158019) (not d!158003) (not b!1505414) (not b!1505390) (not b!1505396) (not b!1505371) (not b!1505369) (not d!158021) (not d!158023) (not b!1505423) (not b!1505368) (not b!1505406))
