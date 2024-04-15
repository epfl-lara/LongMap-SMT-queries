; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122282 () Bool)

(assert start!122282)

(declare-fun b!1417889 () Bool)

(declare-fun e!802426 () Bool)

(declare-fun e!802427 () Bool)

(assert (=> b!1417889 (= e!802426 e!802427)))

(declare-fun res!953636 () Bool)

(assert (=> b!1417889 (=> res!953636 e!802427)))

(declare-datatypes ((List!33299 0))(
  ( (Nil!33296) (Cons!33295 (h!34588 (_ BitVec 64)) (t!47985 List!33299)) )
))
(declare-fun contains!9797 (List!33299 (_ BitVec 64)) Bool)

(assert (=> b!1417889 (= res!953636 (contains!9797 Nil!33296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1417890 () Bool)

(declare-fun res!953640 () Bool)

(assert (=> b!1417890 (=> (not res!953640) (not e!802426))))

(declare-fun noDuplicate!2631 (List!33299) Bool)

(assert (=> b!1417890 (= res!953640 (noDuplicate!2631 Nil!33296))))

(declare-fun b!1417891 () Bool)

(declare-fun res!953639 () Bool)

(assert (=> b!1417891 (=> (not res!953639) (not e!802426))))

(declare-datatypes ((array!96771 0))(
  ( (array!96772 (arr!46711 (Array (_ BitVec 32) (_ BitVec 64))) (size!47263 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96771)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417891 (= res!953639 (validKeyInArray!0 (select (arr!46711 a!2831) j!81)))))

(declare-fun b!1417892 () Bool)

(declare-fun res!953638 () Bool)

(assert (=> b!1417892 (=> (not res!953638) (not e!802426))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1417892 (= res!953638 (and (= (size!47263 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47263 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47263 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417893 () Bool)

(assert (=> b!1417893 (= e!802427 (contains!9797 Nil!33296 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!953635 () Bool)

(assert (=> start!122282 (=> (not res!953635) (not e!802426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122282 (= res!953635 (validMask!0 mask!2608))))

(assert (=> start!122282 e!802426))

(assert (=> start!122282 true))

(declare-fun array_inv!35944 (array!96771) Bool)

(assert (=> start!122282 (array_inv!35944 a!2831)))

(declare-fun b!1417894 () Bool)

(declare-fun res!953634 () Bool)

(assert (=> b!1417894 (=> (not res!953634) (not e!802426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96771 (_ BitVec 32)) Bool)

(assert (=> b!1417894 (= res!953634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417895 () Bool)

(declare-fun res!953637 () Bool)

(assert (=> b!1417895 (=> (not res!953637) (not e!802426))))

(assert (=> b!1417895 (= res!953637 (validKeyInArray!0 (select (arr!46711 a!2831) i!982)))))

(declare-fun b!1417896 () Bool)

(declare-fun res!953641 () Bool)

(assert (=> b!1417896 (=> (not res!953641) (not e!802426))))

(assert (=> b!1417896 (= res!953641 (and (bvsle #b00000000000000000000000000000000 (size!47263 a!2831)) (bvslt (size!47263 a!2831) #b01111111111111111111111111111111)))))

(assert (= (and start!122282 res!953635) b!1417892))

(assert (= (and b!1417892 res!953638) b!1417895))

(assert (= (and b!1417895 res!953637) b!1417891))

(assert (= (and b!1417891 res!953639) b!1417894))

(assert (= (and b!1417894 res!953634) b!1417896))

(assert (= (and b!1417896 res!953641) b!1417890))

(assert (= (and b!1417890 res!953640) b!1417889))

(assert (= (and b!1417889 (not res!953636)) b!1417893))

(declare-fun m!1308193 () Bool)

(assert (=> b!1417890 m!1308193))

(declare-fun m!1308195 () Bool)

(assert (=> b!1417895 m!1308195))

(assert (=> b!1417895 m!1308195))

(declare-fun m!1308197 () Bool)

(assert (=> b!1417895 m!1308197))

(declare-fun m!1308199 () Bool)

(assert (=> start!122282 m!1308199))

(declare-fun m!1308201 () Bool)

(assert (=> start!122282 m!1308201))

(declare-fun m!1308203 () Bool)

(assert (=> b!1417893 m!1308203))

(declare-fun m!1308205 () Bool)

(assert (=> b!1417894 m!1308205))

(declare-fun m!1308207 () Bool)

(assert (=> b!1417889 m!1308207))

(declare-fun m!1308209 () Bool)

(assert (=> b!1417891 m!1308209))

(assert (=> b!1417891 m!1308209))

(declare-fun m!1308211 () Bool)

(assert (=> b!1417891 m!1308211))

(check-sat (not b!1417890) (not b!1417895) (not b!1417893) (not b!1417889) (not start!122282) (not b!1417891) (not b!1417894))
(check-sat)
(get-model)

(declare-fun bm!67220 () Bool)

(declare-fun call!67223 () Bool)

(assert (=> bm!67220 (= call!67223 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!152659 () Bool)

(declare-fun res!953694 () Bool)

(declare-fun e!802453 () Bool)

(assert (=> d!152659 (=> res!953694 e!802453)))

(assert (=> d!152659 (= res!953694 (bvsge #b00000000000000000000000000000000 (size!47263 a!2831)))))

(assert (=> d!152659 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802453)))

(declare-fun b!1417953 () Bool)

(declare-fun e!802452 () Bool)

(assert (=> b!1417953 (= e!802452 call!67223)))

(declare-fun b!1417954 () Bool)

(declare-fun e!802454 () Bool)

(assert (=> b!1417954 (= e!802452 e!802454)))

(declare-fun lt!625312 () (_ BitVec 64))

(assert (=> b!1417954 (= lt!625312 (select (arr!46711 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47901 0))(
  ( (Unit!47902) )
))
(declare-fun lt!625313 () Unit!47901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96771 (_ BitVec 64) (_ BitVec 32)) Unit!47901)

(assert (=> b!1417954 (= lt!625313 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625312 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417954 (arrayContainsKey!0 a!2831 lt!625312 #b00000000000000000000000000000000)))

(declare-fun lt!625311 () Unit!47901)

(assert (=> b!1417954 (= lt!625311 lt!625313)))

(declare-fun res!953695 () Bool)

(declare-datatypes ((SeekEntryResult!11042 0))(
  ( (MissingZero!11042 (index!46560 (_ BitVec 32))) (Found!11042 (index!46561 (_ BitVec 32))) (Intermediate!11042 (undefined!11854 Bool) (index!46562 (_ BitVec 32)) (x!128170 (_ BitVec 32))) (Undefined!11042) (MissingVacant!11042 (index!46563 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96771 (_ BitVec 32)) SeekEntryResult!11042)

(assert (=> b!1417954 (= res!953695 (= (seekEntryOrOpen!0 (select (arr!46711 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11042 #b00000000000000000000000000000000)))))

(assert (=> b!1417954 (=> (not res!953695) (not e!802454))))

(declare-fun b!1417955 () Bool)

(assert (=> b!1417955 (= e!802454 call!67223)))

(declare-fun b!1417956 () Bool)

(assert (=> b!1417956 (= e!802453 e!802452)))

(declare-fun c!131614 () Bool)

(assert (=> b!1417956 (= c!131614 (validKeyInArray!0 (select (arr!46711 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152659 (not res!953694)) b!1417956))

(assert (= (and b!1417956 c!131614) b!1417954))

(assert (= (and b!1417956 (not c!131614)) b!1417953))

(assert (= (and b!1417954 res!953695) b!1417955))

(assert (= (or b!1417955 b!1417953) bm!67220))

(declare-fun m!1308253 () Bool)

(assert (=> bm!67220 m!1308253))

(declare-fun m!1308255 () Bool)

(assert (=> b!1417954 m!1308255))

(declare-fun m!1308257 () Bool)

(assert (=> b!1417954 m!1308257))

(declare-fun m!1308259 () Bool)

(assert (=> b!1417954 m!1308259))

(assert (=> b!1417954 m!1308255))

(declare-fun m!1308261 () Bool)

(assert (=> b!1417954 m!1308261))

(assert (=> b!1417956 m!1308255))

(assert (=> b!1417956 m!1308255))

(declare-fun m!1308263 () Bool)

(assert (=> b!1417956 m!1308263))

(assert (=> b!1417894 d!152659))

(declare-fun d!152669 () Bool)

(declare-fun lt!625318 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!766 (List!33299) (InoxSet (_ BitVec 64)))

(assert (=> d!152669 (= lt!625318 (select (content!766 Nil!33296) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802464 () Bool)

(assert (=> d!152669 (= lt!625318 e!802464)))

(declare-fun res!953705 () Bool)

(assert (=> d!152669 (=> (not res!953705) (not e!802464))))

(get-info :version)

(assert (=> d!152669 (= res!953705 ((_ is Cons!33295) Nil!33296))))

(assert (=> d!152669 (= (contains!9797 Nil!33296 #b0000000000000000000000000000000000000000000000000000000000000000) lt!625318)))

(declare-fun b!1417965 () Bool)

(declare-fun e!802463 () Bool)

(assert (=> b!1417965 (= e!802464 e!802463)))

(declare-fun res!953704 () Bool)

(assert (=> b!1417965 (=> res!953704 e!802463)))

(assert (=> b!1417965 (= res!953704 (= (h!34588 Nil!33296) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1417966 () Bool)

(assert (=> b!1417966 (= e!802463 (contains!9797 (t!47985 Nil!33296) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152669 res!953705) b!1417965))

(assert (= (and b!1417965 (not res!953704)) b!1417966))

(declare-fun m!1308265 () Bool)

(assert (=> d!152669 m!1308265))

(declare-fun m!1308267 () Bool)

(assert (=> d!152669 m!1308267))

(declare-fun m!1308269 () Bool)

(assert (=> b!1417966 m!1308269))

(assert (=> b!1417889 d!152669))

(declare-fun d!152673 () Bool)

(assert (=> d!152673 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122282 d!152673))

(declare-fun d!152681 () Bool)

(assert (=> d!152681 (= (array_inv!35944 a!2831) (bvsge (size!47263 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122282 d!152681))

(declare-fun d!152683 () Bool)

(declare-fun lt!625338 () Bool)

(assert (=> d!152683 (= lt!625338 (select (content!766 Nil!33296) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802486 () Bool)

(assert (=> d!152683 (= lt!625338 e!802486)))

(declare-fun res!953721 () Bool)

(assert (=> d!152683 (=> (not res!953721) (not e!802486))))

(assert (=> d!152683 (= res!953721 ((_ is Cons!33295) Nil!33296))))

(assert (=> d!152683 (= (contains!9797 Nil!33296 #b1000000000000000000000000000000000000000000000000000000000000000) lt!625338)))

(declare-fun b!1417993 () Bool)

(declare-fun e!802485 () Bool)

(assert (=> b!1417993 (= e!802486 e!802485)))

(declare-fun res!953720 () Bool)

(assert (=> b!1417993 (=> res!953720 e!802485)))

(assert (=> b!1417993 (= res!953720 (= (h!34588 Nil!33296) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1417994 () Bool)

(assert (=> b!1417994 (= e!802485 (contains!9797 (t!47985 Nil!33296) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152683 res!953721) b!1417993))

(assert (= (and b!1417993 (not res!953720)) b!1417994))

(assert (=> d!152683 m!1308265))

(declare-fun m!1308303 () Bool)

(assert (=> d!152683 m!1308303))

(declare-fun m!1308307 () Bool)

(assert (=> b!1417994 m!1308307))

(assert (=> b!1417893 d!152683))

(declare-fun d!152689 () Bool)

(assert (=> d!152689 (= (validKeyInArray!0 (select (arr!46711 a!2831) j!81)) (and (not (= (select (arr!46711 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46711 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417891 d!152689))

(declare-fun d!152691 () Bool)

(assert (=> d!152691 (= (validKeyInArray!0 (select (arr!46711 a!2831) i!982)) (and (not (= (select (arr!46711 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46711 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417895 d!152691))

(declare-fun d!152693 () Bool)

(declare-fun res!953734 () Bool)

(declare-fun e!802499 () Bool)

(assert (=> d!152693 (=> res!953734 e!802499)))

(assert (=> d!152693 (= res!953734 ((_ is Nil!33296) Nil!33296))))

(assert (=> d!152693 (= (noDuplicate!2631 Nil!33296) e!802499)))

(declare-fun b!1418007 () Bool)

(declare-fun e!802500 () Bool)

(assert (=> b!1418007 (= e!802499 e!802500)))

(declare-fun res!953735 () Bool)

(assert (=> b!1418007 (=> (not res!953735) (not e!802500))))

(assert (=> b!1418007 (= res!953735 (not (contains!9797 (t!47985 Nil!33296) (h!34588 Nil!33296))))))

(declare-fun b!1418008 () Bool)

(assert (=> b!1418008 (= e!802500 (noDuplicate!2631 (t!47985 Nil!33296)))))

(assert (= (and d!152693 (not res!953734)) b!1418007))

(assert (= (and b!1418007 res!953735) b!1418008))

(declare-fun m!1308313 () Bool)

(assert (=> b!1418007 m!1308313))

(declare-fun m!1308315 () Bool)

(assert (=> b!1418008 m!1308315))

(assert (=> b!1417890 d!152693))

(check-sat (not b!1417954) (not b!1417994) (not b!1417966) (not b!1418008) (not bm!67220) (not b!1417956) (not b!1418007) (not d!152683) (not d!152669))
(check-sat)
