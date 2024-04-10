; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117990 () Bool)

(assert start!117990)

(declare-fun b!1382099 () Bool)

(declare-fun res!923728 () Bool)

(declare-fun e!783383 () Bool)

(assert (=> b!1382099 (=> (not res!923728) (not e!783383))))

(declare-datatypes ((array!94381 0))(
  ( (array!94382 (arr!45573 (Array (_ BitVec 32) (_ BitVec 64))) (size!46123 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94381)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382099 (= res!923728 (validKeyInArray!0 (select (arr!45573 a!2971) i!1094)))))

(declare-fun b!1382100 () Bool)

(declare-fun res!923727 () Bool)

(assert (=> b!1382100 (=> (not res!923727) (not e!783383))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94381 (_ BitVec 32)) Bool)

(assert (=> b!1382100 (= res!923727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382101 () Bool)

(assert (=> b!1382101 (= e!783383 (or (= (select (arr!45573 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45573 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1382102 () Bool)

(declare-fun res!923731 () Bool)

(assert (=> b!1382102 (=> (not res!923731) (not e!783383))))

(declare-datatypes ((List!32107 0))(
  ( (Nil!32104) (Cons!32103 (h!33312 (_ BitVec 64)) (t!46801 List!32107)) )
))
(declare-fun arrayNoDuplicates!0 (array!94381 (_ BitVec 32) List!32107) Bool)

(assert (=> b!1382102 (= res!923731 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32104))))

(declare-fun b!1382103 () Bool)

(declare-fun res!923730 () Bool)

(assert (=> b!1382103 (=> (not res!923730) (not e!783383))))

(assert (=> b!1382103 (= res!923730 (and (= (size!46123 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46123 a!2971))))))

(declare-fun res!923729 () Bool)

(assert (=> start!117990 (=> (not res!923729) (not e!783383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117990 (= res!923729 (validMask!0 mask!3034))))

(assert (=> start!117990 e!783383))

(assert (=> start!117990 true))

(declare-fun array_inv!34601 (array!94381) Bool)

(assert (=> start!117990 (array_inv!34601 a!2971)))

(assert (= (and start!117990 res!923729) b!1382103))

(assert (= (and b!1382103 res!923730) b!1382099))

(assert (= (and b!1382099 res!923728) b!1382102))

(assert (= (and b!1382102 res!923731) b!1382100))

(assert (= (and b!1382100 res!923727) b!1382101))

(declare-fun m!1267275 () Bool)

(assert (=> b!1382100 m!1267275))

(declare-fun m!1267277 () Bool)

(assert (=> b!1382101 m!1267277))

(assert (=> b!1382099 m!1267277))

(assert (=> b!1382099 m!1267277))

(declare-fun m!1267279 () Bool)

(assert (=> b!1382099 m!1267279))

(declare-fun m!1267281 () Bool)

(assert (=> b!1382102 m!1267281))

(declare-fun m!1267283 () Bool)

(assert (=> start!117990 m!1267283))

(declare-fun m!1267285 () Bool)

(assert (=> start!117990 m!1267285))

(check-sat (not b!1382102) (not start!117990) (not b!1382099) (not b!1382100))
(check-sat)
(get-model)

(declare-fun b!1382129 () Bool)

(declare-fun e!783399 () Bool)

(declare-fun e!783398 () Bool)

(assert (=> b!1382129 (= e!783399 e!783398)))

(declare-fun c!128628 () Bool)

(assert (=> b!1382129 (= c!128628 (validKeyInArray!0 (select (arr!45573 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1382130 () Bool)

(declare-fun call!66520 () Bool)

(assert (=> b!1382130 (= e!783398 call!66520)))

(declare-fun bm!66517 () Bool)

(assert (=> bm!66517 (= call!66520 (arrayNoDuplicates!0 a!2971 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128628 (Cons!32103 (select (arr!45573 a!2971) #b00000000000000000000000000000000) Nil!32104) Nil!32104)))))

(declare-fun b!1382131 () Bool)

(assert (=> b!1382131 (= e!783398 call!66520)))

(declare-fun d!149143 () Bool)

(declare-fun res!923755 () Bool)

(declare-fun e!783401 () Bool)

(assert (=> d!149143 (=> res!923755 e!783401)))

(assert (=> d!149143 (= res!923755 (bvsge #b00000000000000000000000000000000 (size!46123 a!2971)))))

(assert (=> d!149143 (= (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32104) e!783401)))

(declare-fun b!1382132 () Bool)

(assert (=> b!1382132 (= e!783401 e!783399)))

(declare-fun res!923753 () Bool)

(assert (=> b!1382132 (=> (not res!923753) (not e!783399))))

(declare-fun e!783400 () Bool)

(assert (=> b!1382132 (= res!923753 (not e!783400))))

(declare-fun res!923754 () Bool)

(assert (=> b!1382132 (=> (not res!923754) (not e!783400))))

(assert (=> b!1382132 (= res!923754 (validKeyInArray!0 (select (arr!45573 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1382133 () Bool)

(declare-fun contains!9736 (List!32107 (_ BitVec 64)) Bool)

(assert (=> b!1382133 (= e!783400 (contains!9736 Nil!32104 (select (arr!45573 a!2971) #b00000000000000000000000000000000)))))

(assert (= (and d!149143 (not res!923755)) b!1382132))

(assert (= (and b!1382132 res!923754) b!1382133))

(assert (= (and b!1382132 res!923753) b!1382129))

(assert (= (and b!1382129 c!128628) b!1382130))

(assert (= (and b!1382129 (not c!128628)) b!1382131))

(assert (= (or b!1382130 b!1382131) bm!66517))

(declare-fun m!1267299 () Bool)

(assert (=> b!1382129 m!1267299))

(assert (=> b!1382129 m!1267299))

(declare-fun m!1267301 () Bool)

(assert (=> b!1382129 m!1267301))

(assert (=> bm!66517 m!1267299))

(declare-fun m!1267303 () Bool)

(assert (=> bm!66517 m!1267303))

(assert (=> b!1382132 m!1267299))

(assert (=> b!1382132 m!1267299))

(assert (=> b!1382132 m!1267301))

(assert (=> b!1382133 m!1267299))

(assert (=> b!1382133 m!1267299))

(declare-fun m!1267305 () Bool)

(assert (=> b!1382133 m!1267305))

(assert (=> b!1382102 d!149143))

(declare-fun d!149147 () Bool)

(assert (=> d!149147 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117990 d!149147))

(declare-fun d!149155 () Bool)

(assert (=> d!149155 (= (array_inv!34601 a!2971) (bvsge (size!46123 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117990 d!149155))

(declare-fun d!149157 () Bool)

(assert (=> d!149157 (= (validKeyInArray!0 (select (arr!45573 a!2971) i!1094)) (and (not (= (select (arr!45573 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45573 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382099 d!149157))

(declare-fun bm!66531 () Bool)

(declare-fun call!66534 () Bool)

(assert (=> bm!66531 (= call!66534 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2971 mask!3034))))

(declare-fun d!149159 () Bool)

(declare-fun res!923788 () Bool)

(declare-fun e!783447 () Bool)

(assert (=> d!149159 (=> res!923788 e!783447)))

(assert (=> d!149159 (= res!923788 (bvsge #b00000000000000000000000000000000 (size!46123 a!2971)))))

(assert (=> d!149159 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034) e!783447)))

(declare-fun b!1382191 () Bool)

(declare-fun e!783446 () Bool)

(assert (=> b!1382191 (= e!783446 call!66534)))

(declare-fun b!1382192 () Bool)

(declare-fun e!783448 () Bool)

(assert (=> b!1382192 (= e!783447 e!783448)))

(declare-fun c!128642 () Bool)

(assert (=> b!1382192 (= c!128642 (validKeyInArray!0 (select (arr!45573 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1382193 () Bool)

(assert (=> b!1382193 (= e!783448 e!783446)))

(declare-fun lt!608367 () (_ BitVec 64))

(assert (=> b!1382193 (= lt!608367 (select (arr!45573 a!2971) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46049 0))(
  ( (Unit!46050) )
))
(declare-fun lt!608366 () Unit!46049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94381 (_ BitVec 64) (_ BitVec 32)) Unit!46049)

(assert (=> b!1382193 (= lt!608366 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2971 lt!608367 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1382193 (arrayContainsKey!0 a!2971 lt!608367 #b00000000000000000000000000000000)))

(declare-fun lt!608365 () Unit!46049)

(assert (=> b!1382193 (= lt!608365 lt!608366)))

(declare-fun res!923787 () Bool)

(declare-datatypes ((SeekEntryResult!10062 0))(
  ( (MissingZero!10062 (index!42619 (_ BitVec 32))) (Found!10062 (index!42620 (_ BitVec 32))) (Intermediate!10062 (undefined!10874 Bool) (index!42621 (_ BitVec 32)) (x!123879 (_ BitVec 32))) (Undefined!10062) (MissingVacant!10062 (index!42622 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94381 (_ BitVec 32)) SeekEntryResult!10062)

(assert (=> b!1382193 (= res!923787 (= (seekEntryOrOpen!0 (select (arr!45573 a!2971) #b00000000000000000000000000000000) a!2971 mask!3034) (Found!10062 #b00000000000000000000000000000000)))))

(assert (=> b!1382193 (=> (not res!923787) (not e!783446))))

(declare-fun b!1382194 () Bool)

(assert (=> b!1382194 (= e!783448 call!66534)))

(assert (= (and d!149159 (not res!923788)) b!1382192))

(assert (= (and b!1382192 c!128642) b!1382193))

(assert (= (and b!1382192 (not c!128642)) b!1382194))

(assert (= (and b!1382193 res!923787) b!1382191))

(assert (= (or b!1382191 b!1382194) bm!66531))

(declare-fun m!1267335 () Bool)

(assert (=> bm!66531 m!1267335))

(assert (=> b!1382192 m!1267299))

(assert (=> b!1382192 m!1267299))

(assert (=> b!1382192 m!1267301))

(assert (=> b!1382193 m!1267299))

(declare-fun m!1267337 () Bool)

(assert (=> b!1382193 m!1267337))

(declare-fun m!1267339 () Bool)

(assert (=> b!1382193 m!1267339))

(assert (=> b!1382193 m!1267299))

(declare-fun m!1267341 () Bool)

(assert (=> b!1382193 m!1267341))

(assert (=> b!1382100 d!149159))

(check-sat (not bm!66531) (not b!1382193) (not b!1382192) (not b!1382132) (not b!1382133) (not bm!66517) (not b!1382129))
(check-sat)
