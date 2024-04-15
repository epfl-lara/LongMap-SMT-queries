; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117986 () Bool)

(assert start!117986)

(declare-fun res!923689 () Bool)

(declare-fun e!783346 () Bool)

(assert (=> start!117986 (=> (not res!923689) (not e!783346))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117986 (= res!923689 (validMask!0 mask!3034))))

(assert (=> start!117986 e!783346))

(assert (=> start!117986 true))

(declare-datatypes ((array!94329 0))(
  ( (array!94330 (arr!45547 (Array (_ BitVec 32) (_ BitVec 64))) (size!46099 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94329)

(declare-fun array_inv!34780 (array!94329) Bool)

(assert (=> start!117986 (array_inv!34780 a!2971)))

(declare-fun b!1382015 () Bool)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382015 (= e!783346 (or (= (select (arr!45547 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45547 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1382016 () Bool)

(declare-fun res!923686 () Bool)

(assert (=> b!1382016 (=> (not res!923686) (not e!783346))))

(declare-datatypes ((List!32159 0))(
  ( (Nil!32156) (Cons!32155 (h!33364 (_ BitVec 64)) (t!46845 List!32159)) )
))
(declare-fun arrayNoDuplicates!0 (array!94329 (_ BitVec 32) List!32159) Bool)

(assert (=> b!1382016 (= res!923686 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32156))))

(declare-fun b!1382017 () Bool)

(declare-fun res!923690 () Bool)

(assert (=> b!1382017 (=> (not res!923690) (not e!783346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382017 (= res!923690 (validKeyInArray!0 (select (arr!45547 a!2971) i!1094)))))

(declare-fun b!1382018 () Bool)

(declare-fun res!923688 () Bool)

(assert (=> b!1382018 (=> (not res!923688) (not e!783346))))

(assert (=> b!1382018 (= res!923688 (and (= (size!46099 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46099 a!2971))))))

(declare-fun b!1382019 () Bool)

(declare-fun res!923687 () Bool)

(assert (=> b!1382019 (=> (not res!923687) (not e!783346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94329 (_ BitVec 32)) Bool)

(assert (=> b!1382019 (= res!923687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117986 res!923689) b!1382018))

(assert (= (and b!1382018 res!923688) b!1382017))

(assert (= (and b!1382017 res!923690) b!1382016))

(assert (= (and b!1382016 res!923686) b!1382019))

(assert (= (and b!1382019 res!923687) b!1382015))

(declare-fun m!1266759 () Bool)

(assert (=> b!1382019 m!1266759))

(declare-fun m!1266761 () Bool)

(assert (=> b!1382017 m!1266761))

(assert (=> b!1382017 m!1266761))

(declare-fun m!1266763 () Bool)

(assert (=> b!1382017 m!1266763))

(declare-fun m!1266765 () Bool)

(assert (=> start!117986 m!1266765))

(declare-fun m!1266767 () Bool)

(assert (=> start!117986 m!1266767))

(declare-fun m!1266769 () Bool)

(assert (=> b!1382016 m!1266769))

(assert (=> b!1382015 m!1266761))

(check-sat (not b!1382017) (not b!1382019) (not b!1382016) (not start!117986))
(check-sat)
(get-model)

(declare-fun d!149025 () Bool)

(assert (=> d!149025 (= (validKeyInArray!0 (select (arr!45547 a!2971) i!1094)) (and (not (= (select (arr!45547 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45547 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382017 d!149025))

(declare-fun bm!66498 () Bool)

(declare-fun call!66501 () Bool)

(assert (=> bm!66498 (= call!66501 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2971 mask!3034))))

(declare-fun b!1382058 () Bool)

(declare-fun e!783367 () Bool)

(assert (=> b!1382058 (= e!783367 call!66501)))

(declare-fun b!1382059 () Bool)

(declare-fun e!783365 () Bool)

(assert (=> b!1382059 (= e!783365 e!783367)))

(declare-fun lt!608165 () (_ BitVec 64))

(assert (=> b!1382059 (= lt!608165 (select (arr!45547 a!2971) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!45890 0))(
  ( (Unit!45891) )
))
(declare-fun lt!608163 () Unit!45890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94329 (_ BitVec 64) (_ BitVec 32)) Unit!45890)

(assert (=> b!1382059 (= lt!608163 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2971 lt!608165 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1382059 (arrayContainsKey!0 a!2971 lt!608165 #b00000000000000000000000000000000)))

(declare-fun lt!608164 () Unit!45890)

(assert (=> b!1382059 (= lt!608164 lt!608163)))

(declare-fun res!923726 () Bool)

(declare-datatypes ((SeekEntryResult!10061 0))(
  ( (MissingZero!10061 (index!42615 (_ BitVec 32))) (Found!10061 (index!42616 (_ BitVec 32))) (Intermediate!10061 (undefined!10873 Bool) (index!42617 (_ BitVec 32)) (x!123875 (_ BitVec 32))) (Undefined!10061) (MissingVacant!10061 (index!42618 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94329 (_ BitVec 32)) SeekEntryResult!10061)

(assert (=> b!1382059 (= res!923726 (= (seekEntryOrOpen!0 (select (arr!45547 a!2971) #b00000000000000000000000000000000) a!2971 mask!3034) (Found!10061 #b00000000000000000000000000000000)))))

(assert (=> b!1382059 (=> (not res!923726) (not e!783367))))

(declare-fun b!1382061 () Bool)

(assert (=> b!1382061 (= e!783365 call!66501)))

(declare-fun b!1382060 () Bool)

(declare-fun e!783366 () Bool)

(assert (=> b!1382060 (= e!783366 e!783365)))

(declare-fun c!128609 () Bool)

(assert (=> b!1382060 (= c!128609 (validKeyInArray!0 (select (arr!45547 a!2971) #b00000000000000000000000000000000)))))

(declare-fun d!149027 () Bool)

(declare-fun res!923725 () Bool)

(assert (=> d!149027 (=> res!923725 e!783366)))

(assert (=> d!149027 (= res!923725 (bvsge #b00000000000000000000000000000000 (size!46099 a!2971)))))

(assert (=> d!149027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034) e!783366)))

(assert (= (and d!149027 (not res!923725)) b!1382060))

(assert (= (and b!1382060 c!128609) b!1382059))

(assert (= (and b!1382060 (not c!128609)) b!1382061))

(assert (= (and b!1382059 res!923726) b!1382058))

(assert (= (or b!1382058 b!1382061) bm!66498))

(declare-fun m!1266795 () Bool)

(assert (=> bm!66498 m!1266795))

(declare-fun m!1266797 () Bool)

(assert (=> b!1382059 m!1266797))

(declare-fun m!1266799 () Bool)

(assert (=> b!1382059 m!1266799))

(declare-fun m!1266801 () Bool)

(assert (=> b!1382059 m!1266801))

(assert (=> b!1382059 m!1266797))

(declare-fun m!1266803 () Bool)

(assert (=> b!1382059 m!1266803))

(assert (=> b!1382060 m!1266797))

(assert (=> b!1382060 m!1266797))

(declare-fun m!1266805 () Bool)

(assert (=> b!1382060 m!1266805))

(assert (=> b!1382019 d!149027))

(declare-fun b!1382084 () Bool)

(declare-fun e!783387 () Bool)

(declare-fun call!66507 () Bool)

(assert (=> b!1382084 (= e!783387 call!66507)))

(declare-fun b!1382085 () Bool)

(assert (=> b!1382085 (= e!783387 call!66507)))

(declare-fun bm!66504 () Bool)

(declare-fun c!128615 () Bool)

(assert (=> bm!66504 (= call!66507 (arrayNoDuplicates!0 a!2971 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128615 (Cons!32155 (select (arr!45547 a!2971) #b00000000000000000000000000000000) Nil!32156) Nil!32156)))))

(declare-fun d!149035 () Bool)

(declare-fun res!923740 () Bool)

(declare-fun e!783385 () Bool)

(assert (=> d!149035 (=> res!923740 e!783385)))

(assert (=> d!149035 (= res!923740 (bvsge #b00000000000000000000000000000000 (size!46099 a!2971)))))

(assert (=> d!149035 (= (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32156) e!783385)))

(declare-fun b!1382086 () Bool)

(declare-fun e!783386 () Bool)

(assert (=> b!1382086 (= e!783386 e!783387)))

(assert (=> b!1382086 (= c!128615 (validKeyInArray!0 (select (arr!45547 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1382087 () Bool)

(assert (=> b!1382087 (= e!783385 e!783386)))

(declare-fun res!923739 () Bool)

(assert (=> b!1382087 (=> (not res!923739) (not e!783386))))

(declare-fun e!783388 () Bool)

(assert (=> b!1382087 (= res!923739 (not e!783388))))

(declare-fun res!923741 () Bool)

(assert (=> b!1382087 (=> (not res!923741) (not e!783388))))

(assert (=> b!1382087 (= res!923741 (validKeyInArray!0 (select (arr!45547 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1382088 () Bool)

(declare-fun contains!9700 (List!32159 (_ BitVec 64)) Bool)

(assert (=> b!1382088 (= e!783388 (contains!9700 Nil!32156 (select (arr!45547 a!2971) #b00000000000000000000000000000000)))))

(assert (= (and d!149035 (not res!923740)) b!1382087))

(assert (= (and b!1382087 res!923741) b!1382088))

(assert (= (and b!1382087 res!923739) b!1382086))

(assert (= (and b!1382086 c!128615) b!1382084))

(assert (= (and b!1382086 (not c!128615)) b!1382085))

(assert (= (or b!1382084 b!1382085) bm!66504))

(assert (=> bm!66504 m!1266797))

(declare-fun m!1266819 () Bool)

(assert (=> bm!66504 m!1266819))

(assert (=> b!1382086 m!1266797))

(assert (=> b!1382086 m!1266797))

(assert (=> b!1382086 m!1266805))

(assert (=> b!1382087 m!1266797))

(assert (=> b!1382087 m!1266797))

(assert (=> b!1382087 m!1266805))

(assert (=> b!1382088 m!1266797))

(assert (=> b!1382088 m!1266797))

(declare-fun m!1266821 () Bool)

(assert (=> b!1382088 m!1266821))

(assert (=> b!1382016 d!149035))

(declare-fun d!149043 () Bool)

(assert (=> d!149043 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117986 d!149043))

(declare-fun d!149053 () Bool)

(assert (=> d!149053 (= (array_inv!34780 a!2971) (bvsge (size!46099 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117986 d!149053))

(check-sat (not bm!66498) (not b!1382060) (not bm!66504) (not b!1382086) (not b!1382087) (not b!1382088) (not b!1382059))
(check-sat)
