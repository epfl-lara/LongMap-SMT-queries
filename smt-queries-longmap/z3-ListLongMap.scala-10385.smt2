; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122288 () Bool)

(assert start!122288)

(declare-fun b!1417994 () Bool)

(declare-fun res!953691 () Bool)

(declare-fun e!802474 () Bool)

(assert (=> b!1417994 (=> (not res!953691) (not e!802474))))

(declare-datatypes ((List!33247 0))(
  ( (Nil!33244) (Cons!33243 (h!34536 (_ BitVec 64)) (t!47941 List!33247)) )
))
(declare-fun noDuplicate!2610 (List!33247) Bool)

(assert (=> b!1417994 (= res!953691 (noDuplicate!2610 Nil!33244))))

(declare-fun b!1417995 () Bool)

(declare-fun res!953690 () Bool)

(assert (=> b!1417995 (=> (not res!953690) (not e!802474))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96824 0))(
  ( (array!96825 (arr!46737 (Array (_ BitVec 32) (_ BitVec 64))) (size!47287 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96824)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417995 (= res!953690 (and (= (size!47287 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47287 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47287 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417996 () Bool)

(declare-fun res!953692 () Bool)

(assert (=> b!1417996 (=> (not res!953692) (not e!802474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417996 (= res!953692 (validKeyInArray!0 (select (arr!46737 a!2831) j!81)))))

(declare-fun b!1417997 () Bool)

(declare-fun res!953688 () Bool)

(assert (=> b!1417997 (=> (not res!953688) (not e!802474))))

(assert (=> b!1417997 (= res!953688 (and (bvsle #b00000000000000000000000000000000 (size!47287 a!2831)) (bvslt (size!47287 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1417998 () Bool)

(declare-fun res!953693 () Bool)

(assert (=> b!1417998 (=> (not res!953693) (not e!802474))))

(assert (=> b!1417998 (= res!953693 (validKeyInArray!0 (select (arr!46737 a!2831) i!982)))))

(declare-fun b!1417999 () Bool)

(declare-fun e!802475 () Bool)

(declare-fun contains!9835 (List!33247 (_ BitVec 64)) Bool)

(assert (=> b!1417999 (= e!802475 (contains!9835 Nil!33244 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1418000 () Bool)

(declare-fun res!953689 () Bool)

(assert (=> b!1418000 (=> (not res!953689) (not e!802474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96824 (_ BitVec 32)) Bool)

(assert (=> b!1418000 (= res!953689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!953694 () Bool)

(assert (=> start!122288 (=> (not res!953694) (not e!802474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122288 (= res!953694 (validMask!0 mask!2608))))

(assert (=> start!122288 e!802474))

(assert (=> start!122288 true))

(declare-fun array_inv!35765 (array!96824) Bool)

(assert (=> start!122288 (array_inv!35765 a!2831)))

(declare-fun b!1418001 () Bool)

(assert (=> b!1418001 (= e!802474 e!802475)))

(declare-fun res!953695 () Bool)

(assert (=> b!1418001 (=> res!953695 e!802475)))

(assert (=> b!1418001 (= res!953695 (contains!9835 Nil!33244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!122288 res!953694) b!1417995))

(assert (= (and b!1417995 res!953690) b!1417998))

(assert (= (and b!1417998 res!953693) b!1417996))

(assert (= (and b!1417996 res!953692) b!1418000))

(assert (= (and b!1418000 res!953689) b!1417997))

(assert (= (and b!1417997 res!953688) b!1417994))

(assert (= (and b!1417994 res!953691) b!1418001))

(assert (= (and b!1418001 (not res!953695)) b!1417999))

(declare-fun m!1308749 () Bool)

(assert (=> b!1417996 m!1308749))

(assert (=> b!1417996 m!1308749))

(declare-fun m!1308751 () Bool)

(assert (=> b!1417996 m!1308751))

(declare-fun m!1308753 () Bool)

(assert (=> b!1418001 m!1308753))

(declare-fun m!1308755 () Bool)

(assert (=> start!122288 m!1308755))

(declare-fun m!1308757 () Bool)

(assert (=> start!122288 m!1308757))

(declare-fun m!1308759 () Bool)

(assert (=> b!1417994 m!1308759))

(declare-fun m!1308761 () Bool)

(assert (=> b!1417999 m!1308761))

(declare-fun m!1308763 () Bool)

(assert (=> b!1417998 m!1308763))

(assert (=> b!1417998 m!1308763))

(declare-fun m!1308765 () Bool)

(assert (=> b!1417998 m!1308765))

(declare-fun m!1308767 () Bool)

(assert (=> b!1418000 m!1308767))

(check-sat (not start!122288) (not b!1417994) (not b!1417998) (not b!1417999) (not b!1418001) (not b!1417996) (not b!1418000))
(check-sat)
(get-model)

(declare-fun d!152783 () Bool)

(declare-fun lt!625497 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!769 (List!33247) (InoxSet (_ BitVec 64)))

(assert (=> d!152783 (= lt!625497 (select (content!769 Nil!33244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802490 () Bool)

(assert (=> d!152783 (= lt!625497 e!802490)))

(declare-fun res!953725 () Bool)

(assert (=> d!152783 (=> (not res!953725) (not e!802490))))

(get-info :version)

(assert (=> d!152783 (= res!953725 ((_ is Cons!33243) Nil!33244))))

(assert (=> d!152783 (= (contains!9835 Nil!33244 #b1000000000000000000000000000000000000000000000000000000000000000) lt!625497)))

(declare-fun b!1418030 () Bool)

(declare-fun e!802489 () Bool)

(assert (=> b!1418030 (= e!802490 e!802489)))

(declare-fun res!953724 () Bool)

(assert (=> b!1418030 (=> res!953724 e!802489)))

(assert (=> b!1418030 (= res!953724 (= (h!34536 Nil!33244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1418031 () Bool)

(assert (=> b!1418031 (= e!802489 (contains!9835 (t!47941 Nil!33244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152783 res!953725) b!1418030))

(assert (= (and b!1418030 (not res!953724)) b!1418031))

(declare-fun m!1308789 () Bool)

(assert (=> d!152783 m!1308789))

(declare-fun m!1308791 () Bool)

(assert (=> d!152783 m!1308791))

(declare-fun m!1308793 () Bool)

(assert (=> b!1418031 m!1308793))

(assert (=> b!1417999 d!152783))

(declare-fun d!152785 () Bool)

(assert (=> d!152785 (= (validKeyInArray!0 (select (arr!46737 a!2831) i!982)) (and (not (= (select (arr!46737 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46737 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417998 d!152785))

(declare-fun bm!67240 () Bool)

(declare-fun call!67243 () Bool)

(assert (=> bm!67240 (= call!67243 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418052 () Bool)

(declare-fun e!802509 () Bool)

(assert (=> b!1418052 (= e!802509 call!67243)))

(declare-fun b!1418053 () Bool)

(declare-fun e!802511 () Bool)

(assert (=> b!1418053 (= e!802511 e!802509)))

(declare-fun lt!625509 () (_ BitVec 64))

(assert (=> b!1418053 (= lt!625509 (select (arr!46737 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48054 0))(
  ( (Unit!48055) )
))
(declare-fun lt!625508 () Unit!48054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96824 (_ BitVec 64) (_ BitVec 32)) Unit!48054)

(assert (=> b!1418053 (= lt!625508 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625509 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418053 (arrayContainsKey!0 a!2831 lt!625509 #b00000000000000000000000000000000)))

(declare-fun lt!625507 () Unit!48054)

(assert (=> b!1418053 (= lt!625507 lt!625508)))

(declare-fun res!953742 () Bool)

(declare-datatypes ((SeekEntryResult!11040 0))(
  ( (MissingZero!11040 (index!46552 (_ BitVec 32))) (Found!11040 (index!46553 (_ BitVec 32))) (Intermediate!11040 (undefined!11852 Bool) (index!46554 (_ BitVec 32)) (x!128171 (_ BitVec 32))) (Undefined!11040) (MissingVacant!11040 (index!46555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96824 (_ BitVec 32)) SeekEntryResult!11040)

(assert (=> b!1418053 (= res!953742 (= (seekEntryOrOpen!0 (select (arr!46737 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11040 #b00000000000000000000000000000000)))))

(assert (=> b!1418053 (=> (not res!953742) (not e!802509))))

(declare-fun d!152787 () Bool)

(declare-fun res!953743 () Bool)

(declare-fun e!802510 () Bool)

(assert (=> d!152787 (=> res!953743 e!802510)))

(assert (=> d!152787 (= res!953743 (bvsge #b00000000000000000000000000000000 (size!47287 a!2831)))))

(assert (=> d!152787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802510)))

(declare-fun b!1418054 () Bool)

(assert (=> b!1418054 (= e!802510 e!802511)))

(declare-fun c!131637 () Bool)

(assert (=> b!1418054 (= c!131637 (validKeyInArray!0 (select (arr!46737 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418055 () Bool)

(assert (=> b!1418055 (= e!802511 call!67243)))

(assert (= (and d!152787 (not res!953743)) b!1418054))

(assert (= (and b!1418054 c!131637) b!1418053))

(assert (= (and b!1418054 (not c!131637)) b!1418055))

(assert (= (and b!1418053 res!953742) b!1418052))

(assert (= (or b!1418052 b!1418055) bm!67240))

(declare-fun m!1308805 () Bool)

(assert (=> bm!67240 m!1308805))

(declare-fun m!1308807 () Bool)

(assert (=> b!1418053 m!1308807))

(declare-fun m!1308809 () Bool)

(assert (=> b!1418053 m!1308809))

(declare-fun m!1308811 () Bool)

(assert (=> b!1418053 m!1308811))

(assert (=> b!1418053 m!1308807))

(declare-fun m!1308813 () Bool)

(assert (=> b!1418053 m!1308813))

(assert (=> b!1418054 m!1308807))

(assert (=> b!1418054 m!1308807))

(declare-fun m!1308815 () Bool)

(assert (=> b!1418054 m!1308815))

(assert (=> b!1418000 d!152787))

(declare-fun d!152803 () Bool)

(declare-fun res!953752 () Bool)

(declare-fun e!802522 () Bool)

(assert (=> d!152803 (=> res!953752 e!802522)))

(assert (=> d!152803 (= res!953752 ((_ is Nil!33244) Nil!33244))))

(assert (=> d!152803 (= (noDuplicate!2610 Nil!33244) e!802522)))

(declare-fun b!1418068 () Bool)

(declare-fun e!802523 () Bool)

(assert (=> b!1418068 (= e!802522 e!802523)))

(declare-fun res!953753 () Bool)

(assert (=> b!1418068 (=> (not res!953753) (not e!802523))))

(assert (=> b!1418068 (= res!953753 (not (contains!9835 (t!47941 Nil!33244) (h!34536 Nil!33244))))))

(declare-fun b!1418069 () Bool)

(assert (=> b!1418069 (= e!802523 (noDuplicate!2610 (t!47941 Nil!33244)))))

(assert (= (and d!152803 (not res!953752)) b!1418068))

(assert (= (and b!1418068 res!953753) b!1418069))

(declare-fun m!1308817 () Bool)

(assert (=> b!1418068 m!1308817))

(declare-fun m!1308819 () Bool)

(assert (=> b!1418069 m!1308819))

(assert (=> b!1417994 d!152803))

(declare-fun d!152805 () Bool)

(assert (=> d!152805 (= (validKeyInArray!0 (select (arr!46737 a!2831) j!81)) (and (not (= (select (arr!46737 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46737 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417996 d!152805))

(declare-fun d!152807 () Bool)

(declare-fun lt!625516 () Bool)

(assert (=> d!152807 (= lt!625516 (select (content!769 Nil!33244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802525 () Bool)

(assert (=> d!152807 (= lt!625516 e!802525)))

(declare-fun res!953755 () Bool)

(assert (=> d!152807 (=> (not res!953755) (not e!802525))))

(assert (=> d!152807 (= res!953755 ((_ is Cons!33243) Nil!33244))))

(assert (=> d!152807 (= (contains!9835 Nil!33244 #b0000000000000000000000000000000000000000000000000000000000000000) lt!625516)))

(declare-fun b!1418070 () Bool)

(declare-fun e!802524 () Bool)

(assert (=> b!1418070 (= e!802525 e!802524)))

(declare-fun res!953754 () Bool)

(assert (=> b!1418070 (=> res!953754 e!802524)))

(assert (=> b!1418070 (= res!953754 (= (h!34536 Nil!33244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1418071 () Bool)

(assert (=> b!1418071 (= e!802524 (contains!9835 (t!47941 Nil!33244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152807 res!953755) b!1418070))

(assert (= (and b!1418070 (not res!953754)) b!1418071))

(assert (=> d!152807 m!1308789))

(declare-fun m!1308821 () Bool)

(assert (=> d!152807 m!1308821))

(declare-fun m!1308823 () Bool)

(assert (=> b!1418071 m!1308823))

(assert (=> b!1418001 d!152807))

(declare-fun d!152809 () Bool)

(assert (=> d!152809 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122288 d!152809))

(declare-fun d!152823 () Bool)

(assert (=> d!152823 (= (array_inv!35765 a!2831) (bvsge (size!47287 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122288 d!152823))

(check-sat (not b!1418054) (not b!1418068) (not d!152783) (not b!1418053) (not bm!67240) (not d!152807) (not b!1418031) (not b!1418071) (not b!1418069))
(check-sat)
