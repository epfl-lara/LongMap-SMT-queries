; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85890 () Bool)

(assert start!85890)

(declare-fun b!995394 () Bool)

(declare-fun res!665810 () Bool)

(declare-fun e!561679 () Bool)

(assert (=> b!995394 (=> (not res!665810) (not e!561679))))

(declare-datatypes ((array!62926 0))(
  ( (array!62927 (arr!30297 (Array (_ BitVec 32) (_ BitVec 64))) (size!30801 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62926)

(declare-datatypes ((List!21039 0))(
  ( (Nil!21036) (Cons!21035 (h!22197 (_ BitVec 64)) (t!30031 List!21039)) )
))
(declare-fun arrayNoDuplicates!0 (array!62926 (_ BitVec 32) List!21039) Bool)

(assert (=> b!995394 (= res!665810 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21036))))

(declare-fun b!995395 () Bool)

(declare-fun res!665814 () Bool)

(declare-fun e!561678 () Bool)

(assert (=> b!995395 (=> (not res!665814) (not e!561678))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995395 (= res!665814 (validKeyInArray!0 k0!2224))))

(declare-fun b!995396 () Bool)

(assert (=> b!995396 (= e!561678 e!561679)))

(declare-fun res!665816 () Bool)

(assert (=> b!995396 (=> (not res!665816) (not e!561679))))

(declare-datatypes ((SeekEntryResult!9254 0))(
  ( (MissingZero!9254 (index!39387 (_ BitVec 32))) (Found!9254 (index!39388 (_ BitVec 32))) (Intermediate!9254 (undefined!10066 Bool) (index!39389 (_ BitVec 32)) (x!86842 (_ BitVec 32))) (Undefined!9254) (MissingVacant!9254 (index!39390 (_ BitVec 32))) )
))
(declare-fun lt!440767 () SeekEntryResult!9254)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995396 (= res!665816 (or (= lt!440767 (MissingVacant!9254 i!1194)) (= lt!440767 (MissingZero!9254 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62926 (_ BitVec 32)) SeekEntryResult!9254)

(assert (=> b!995396 (= lt!440767 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995397 () Bool)

(declare-fun res!665811 () Bool)

(assert (=> b!995397 (=> (not res!665811) (not e!561678))))

(declare-fun arrayContainsKey!0 (array!62926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995397 (= res!665811 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995398 () Bool)

(declare-fun res!665815 () Bool)

(assert (=> b!995398 (=> (not res!665815) (not e!561678))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995398 (= res!665815 (validKeyInArray!0 (select (arr!30297 a!3219) j!170)))))

(declare-fun b!995399 () Bool)

(declare-fun res!665813 () Bool)

(assert (=> b!995399 (=> (not res!665813) (not e!561679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62926 (_ BitVec 32)) Bool)

(assert (=> b!995399 (= res!665813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!665812 () Bool)

(assert (=> start!85890 (=> (not res!665812) (not e!561678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85890 (= res!665812 (validMask!0 mask!3464))))

(assert (=> start!85890 e!561678))

(declare-fun array_inv!23440 (array!62926) Bool)

(assert (=> start!85890 (array_inv!23440 a!3219)))

(assert (=> start!85890 true))

(declare-fun b!995400 () Bool)

(declare-fun res!665809 () Bool)

(assert (=> b!995400 (=> (not res!665809) (not e!561678))))

(assert (=> b!995400 (= res!665809 (and (= (size!30801 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30801 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30801 a!3219)) (not (= i!1194 j!170))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun b!995401 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!995401 (= e!561679 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30801 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30801 a!3219)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(assert (= (and start!85890 res!665812) b!995400))

(assert (= (and b!995400 res!665809) b!995398))

(assert (= (and b!995398 res!665815) b!995395))

(assert (= (and b!995395 res!665814) b!995397))

(assert (= (and b!995397 res!665811) b!995396))

(assert (= (and b!995396 res!665816) b!995399))

(assert (= (and b!995399 res!665813) b!995394))

(assert (= (and b!995394 res!665810) b!995401))

(declare-fun m!922249 () Bool)

(assert (=> b!995396 m!922249))

(declare-fun m!922251 () Bool)

(assert (=> start!85890 m!922251))

(declare-fun m!922253 () Bool)

(assert (=> start!85890 m!922253))

(declare-fun m!922255 () Bool)

(assert (=> b!995395 m!922255))

(declare-fun m!922257 () Bool)

(assert (=> b!995397 m!922257))

(declare-fun m!922259 () Bool)

(assert (=> b!995398 m!922259))

(assert (=> b!995398 m!922259))

(declare-fun m!922261 () Bool)

(assert (=> b!995398 m!922261))

(declare-fun m!922263 () Bool)

(assert (=> b!995394 m!922263))

(declare-fun m!922265 () Bool)

(assert (=> b!995399 m!922265))

(check-sat (not b!995398) (not b!995394) (not b!995395) (not b!995399) (not b!995396) (not start!85890) (not b!995397))
(check-sat)
(get-model)

(declare-fun d!118727 () Bool)

(declare-fun res!665869 () Bool)

(declare-fun e!561703 () Bool)

(assert (=> d!118727 (=> res!665869 e!561703)))

(assert (=> d!118727 (= res!665869 (= (select (arr!30297 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118727 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561703)))

(declare-fun b!995454 () Bool)

(declare-fun e!561704 () Bool)

(assert (=> b!995454 (= e!561703 e!561704)))

(declare-fun res!665870 () Bool)

(assert (=> b!995454 (=> (not res!665870) (not e!561704))))

(assert (=> b!995454 (= res!665870 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30801 a!3219)))))

(declare-fun b!995455 () Bool)

(assert (=> b!995455 (= e!561704 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118727 (not res!665869)) b!995454))

(assert (= (and b!995454 res!665870) b!995455))

(declare-fun m!922303 () Bool)

(assert (=> d!118727 m!922303))

(declare-fun m!922305 () Bool)

(assert (=> b!995455 m!922305))

(assert (=> b!995397 d!118727))

(declare-fun b!995480 () Bool)

(declare-fun e!561723 () SeekEntryResult!9254)

(assert (=> b!995480 (= e!561723 Undefined!9254)))

(declare-fun b!995481 () Bool)

(declare-fun e!561725 () SeekEntryResult!9254)

(declare-fun lt!440781 () SeekEntryResult!9254)

(assert (=> b!995481 (= e!561725 (MissingZero!9254 (index!39389 lt!440781)))))

(declare-fun b!995483 () Bool)

(declare-fun c!100940 () Bool)

(declare-fun lt!440780 () (_ BitVec 64))

(assert (=> b!995483 (= c!100940 (= lt!440780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561724 () SeekEntryResult!9254)

(assert (=> b!995483 (= e!561724 e!561725)))

(declare-fun b!995484 () Bool)

(assert (=> b!995484 (= e!561724 (Found!9254 (index!39389 lt!440781)))))

(declare-fun b!995485 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62926 (_ BitVec 32)) SeekEntryResult!9254)

(assert (=> b!995485 (= e!561725 (seekKeyOrZeroReturnVacant!0 (x!86842 lt!440781) (index!39389 lt!440781) (index!39389 lt!440781) k0!2224 a!3219 mask!3464))))

(declare-fun d!118729 () Bool)

(declare-fun lt!440782 () SeekEntryResult!9254)

(get-info :version)

(assert (=> d!118729 (and (or ((_ is Undefined!9254) lt!440782) (not ((_ is Found!9254) lt!440782)) (and (bvsge (index!39388 lt!440782) #b00000000000000000000000000000000) (bvslt (index!39388 lt!440782) (size!30801 a!3219)))) (or ((_ is Undefined!9254) lt!440782) ((_ is Found!9254) lt!440782) (not ((_ is MissingZero!9254) lt!440782)) (and (bvsge (index!39387 lt!440782) #b00000000000000000000000000000000) (bvslt (index!39387 lt!440782) (size!30801 a!3219)))) (or ((_ is Undefined!9254) lt!440782) ((_ is Found!9254) lt!440782) ((_ is MissingZero!9254) lt!440782) (not ((_ is MissingVacant!9254) lt!440782)) (and (bvsge (index!39390 lt!440782) #b00000000000000000000000000000000) (bvslt (index!39390 lt!440782) (size!30801 a!3219)))) (or ((_ is Undefined!9254) lt!440782) (ite ((_ is Found!9254) lt!440782) (= (select (arr!30297 a!3219) (index!39388 lt!440782)) k0!2224) (ite ((_ is MissingZero!9254) lt!440782) (= (select (arr!30297 a!3219) (index!39387 lt!440782)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9254) lt!440782) (= (select (arr!30297 a!3219) (index!39390 lt!440782)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118729 (= lt!440782 e!561723)))

(declare-fun c!100941 () Bool)

(assert (=> d!118729 (= c!100941 (and ((_ is Intermediate!9254) lt!440781) (undefined!10066 lt!440781)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62926 (_ BitVec 32)) SeekEntryResult!9254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118729 (= lt!440781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118729 (validMask!0 mask!3464)))

(assert (=> d!118729 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!440782)))

(declare-fun b!995482 () Bool)

(assert (=> b!995482 (= e!561723 e!561724)))

(assert (=> b!995482 (= lt!440780 (select (arr!30297 a!3219) (index!39389 lt!440781)))))

(declare-fun c!100942 () Bool)

(assert (=> b!995482 (= c!100942 (= lt!440780 k0!2224))))

(assert (= (and d!118729 c!100941) b!995480))

(assert (= (and d!118729 (not c!100941)) b!995482))

(assert (= (and b!995482 c!100942) b!995484))

(assert (= (and b!995482 (not c!100942)) b!995483))

(assert (= (and b!995483 c!100940) b!995481))

(assert (= (and b!995483 (not c!100940)) b!995485))

(declare-fun m!922315 () Bool)

(assert (=> b!995485 m!922315))

(declare-fun m!922317 () Bool)

(assert (=> d!118729 m!922317))

(assert (=> d!118729 m!922317))

(declare-fun m!922319 () Bool)

(assert (=> d!118729 m!922319))

(assert (=> d!118729 m!922251))

(declare-fun m!922321 () Bool)

(assert (=> d!118729 m!922321))

(declare-fun m!922323 () Bool)

(assert (=> d!118729 m!922323))

(declare-fun m!922325 () Bool)

(assert (=> d!118729 m!922325))

(declare-fun m!922327 () Bool)

(assert (=> b!995482 m!922327))

(assert (=> b!995396 d!118729))

(declare-fun d!118745 () Bool)

(assert (=> d!118745 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995395 d!118745))

(declare-fun d!118747 () Bool)

(assert (=> d!118747 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85890 d!118747))

(declare-fun d!118757 () Bool)

(assert (=> d!118757 (= (array_inv!23440 a!3219) (bvsge (size!30801 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85890 d!118757))

(declare-fun b!995508 () Bool)

(declare-fun e!561745 () Bool)

(declare-fun contains!5835 (List!21039 (_ BitVec 64)) Bool)

(assert (=> b!995508 (= e!561745 (contains!5835 Nil!21036 (select (arr!30297 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118759 () Bool)

(declare-fun res!665895 () Bool)

(declare-fun e!561746 () Bool)

(assert (=> d!118759 (=> res!665895 e!561746)))

(assert (=> d!118759 (= res!665895 (bvsge #b00000000000000000000000000000000 (size!30801 a!3219)))))

(assert (=> d!118759 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21036) e!561746)))

(declare-fun b!995509 () Bool)

(declare-fun e!561743 () Bool)

(declare-fun call!42184 () Bool)

(assert (=> b!995509 (= e!561743 call!42184)))

(declare-fun b!995510 () Bool)

(declare-fun e!561744 () Bool)

(assert (=> b!995510 (= e!561746 e!561744)))

(declare-fun res!665897 () Bool)

(assert (=> b!995510 (=> (not res!665897) (not e!561744))))

(assert (=> b!995510 (= res!665897 (not e!561745))))

(declare-fun res!665896 () Bool)

(assert (=> b!995510 (=> (not res!665896) (not e!561745))))

(assert (=> b!995510 (= res!665896 (validKeyInArray!0 (select (arr!30297 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995511 () Bool)

(assert (=> b!995511 (= e!561743 call!42184)))

(declare-fun bm!42181 () Bool)

(declare-fun c!100948 () Bool)

(assert (=> bm!42181 (= call!42184 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100948 (Cons!21035 (select (arr!30297 a!3219) #b00000000000000000000000000000000) Nil!21036) Nil!21036)))))

(declare-fun b!995512 () Bool)

(assert (=> b!995512 (= e!561744 e!561743)))

(assert (=> b!995512 (= c!100948 (validKeyInArray!0 (select (arr!30297 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!118759 (not res!665895)) b!995510))

(assert (= (and b!995510 res!665896) b!995508))

(assert (= (and b!995510 res!665897) b!995512))

(assert (= (and b!995512 c!100948) b!995509))

(assert (= (and b!995512 (not c!100948)) b!995511))

(assert (= (or b!995509 b!995511) bm!42181))

(assert (=> b!995508 m!922303))

(assert (=> b!995508 m!922303))

(declare-fun m!922339 () Bool)

(assert (=> b!995508 m!922339))

(assert (=> b!995510 m!922303))

(assert (=> b!995510 m!922303))

(declare-fun m!922341 () Bool)

(assert (=> b!995510 m!922341))

(assert (=> bm!42181 m!922303))

(declare-fun m!922343 () Bool)

(assert (=> bm!42181 m!922343))

(assert (=> b!995512 m!922303))

(assert (=> b!995512 m!922303))

(assert (=> b!995512 m!922341))

(assert (=> b!995394 d!118759))

(declare-fun b!995564 () Bool)

(declare-fun e!561784 () Bool)

(declare-fun call!42192 () Bool)

(assert (=> b!995564 (= e!561784 call!42192)))

(declare-fun b!995565 () Bool)

(declare-fun e!561782 () Bool)

(assert (=> b!995565 (= e!561784 e!561782)))

(declare-fun lt!440807 () (_ BitVec 64))

(assert (=> b!995565 (= lt!440807 (select (arr!30297 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32835 0))(
  ( (Unit!32836) )
))
(declare-fun lt!440809 () Unit!32835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62926 (_ BitVec 64) (_ BitVec 32)) Unit!32835)

(assert (=> b!995565 (= lt!440809 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440807 #b00000000000000000000000000000000))))

(assert (=> b!995565 (arrayContainsKey!0 a!3219 lt!440807 #b00000000000000000000000000000000)))

(declare-fun lt!440808 () Unit!32835)

(assert (=> b!995565 (= lt!440808 lt!440809)))

(declare-fun res!665917 () Bool)

(assert (=> b!995565 (= res!665917 (= (seekEntryOrOpen!0 (select (arr!30297 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9254 #b00000000000000000000000000000000)))))

(assert (=> b!995565 (=> (not res!665917) (not e!561782))))

(declare-fun b!995566 () Bool)

(assert (=> b!995566 (= e!561782 call!42192)))

(declare-fun b!995567 () Bool)

(declare-fun e!561783 () Bool)

(assert (=> b!995567 (= e!561783 e!561784)))

(declare-fun c!100965 () Bool)

(assert (=> b!995567 (= c!100965 (validKeyInArray!0 (select (arr!30297 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118763 () Bool)

(declare-fun res!665918 () Bool)

(assert (=> d!118763 (=> res!665918 e!561783)))

(assert (=> d!118763 (= res!665918 (bvsge #b00000000000000000000000000000000 (size!30801 a!3219)))))

(assert (=> d!118763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561783)))

(declare-fun bm!42189 () Bool)

(assert (=> bm!42189 (= call!42192 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!118763 (not res!665918)) b!995567))

(assert (= (and b!995567 c!100965) b!995565))

(assert (= (and b!995567 (not c!100965)) b!995564))

(assert (= (and b!995565 res!665917) b!995566))

(assert (= (or b!995566 b!995564) bm!42189))

(assert (=> b!995565 m!922303))

(declare-fun m!922363 () Bool)

(assert (=> b!995565 m!922363))

(declare-fun m!922365 () Bool)

(assert (=> b!995565 m!922365))

(assert (=> b!995565 m!922303))

(declare-fun m!922367 () Bool)

(assert (=> b!995565 m!922367))

(assert (=> b!995567 m!922303))

(assert (=> b!995567 m!922303))

(assert (=> b!995567 m!922341))

(declare-fun m!922369 () Bool)

(assert (=> bm!42189 m!922369))

(assert (=> b!995399 d!118763))

(declare-fun d!118769 () Bool)

(assert (=> d!118769 (= (validKeyInArray!0 (select (arr!30297 a!3219) j!170)) (and (not (= (select (arr!30297 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30297 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995398 d!118769))

(check-sat (not b!995485) (not b!995455) (not bm!42181) (not b!995565) (not d!118729) (not b!995512) (not bm!42189) (not b!995508) (not b!995567) (not b!995510))
(check-sat)
