; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86154 () Bool)

(assert start!86154)

(declare-fun b!997799 () Bool)

(declare-fun e!562735 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!441532 () (_ BitVec 32))

(assert (=> b!997799 (= e!562735 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441532 #b00000000000000000000000000000000) (bvsge lt!441532 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun b!997800 () Bool)

(declare-fun res!667762 () Bool)

(declare-fun e!562734 () Bool)

(assert (=> b!997800 (=> (not res!667762) (not e!562734))))

(declare-datatypes ((array!63108 0))(
  ( (array!63109 (arr!30384 (Array (_ BitVec 32) (_ BitVec 64))) (size!30886 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63108)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63108 (_ BitVec 32)) Bool)

(assert (=> b!997800 (= res!667762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997801 () Bool)

(declare-fun res!667754 () Bool)

(declare-fun e!562732 () Bool)

(assert (=> b!997801 (=> (not res!667754) (not e!562732))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997801 (= res!667754 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997802 () Bool)

(declare-fun res!667763 () Bool)

(assert (=> b!997802 (=> (not res!667763) (not e!562735))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9316 0))(
  ( (MissingZero!9316 (index!39635 (_ BitVec 32))) (Found!9316 (index!39636 (_ BitVec 32))) (Intermediate!9316 (undefined!10128 Bool) (index!39637 (_ BitVec 32)) (x!87062 (_ BitVec 32))) (Undefined!9316) (MissingVacant!9316 (index!39638 (_ BitVec 32))) )
))
(declare-fun lt!441533 () SeekEntryResult!9316)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63108 (_ BitVec 32)) SeekEntryResult!9316)

(assert (=> b!997802 (= res!667763 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30384 a!3219) j!170) a!3219 mask!3464) lt!441533))))

(declare-fun b!997803 () Bool)

(declare-fun res!667764 () Bool)

(assert (=> b!997803 (=> (not res!667764) (not e!562734))))

(declare-datatypes ((List!21060 0))(
  ( (Nil!21057) (Cons!21056 (h!22224 (_ BitVec 64)) (t!30061 List!21060)) )
))
(declare-fun arrayNoDuplicates!0 (array!63108 (_ BitVec 32) List!21060) Bool)

(assert (=> b!997803 (= res!667764 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21057))))

(declare-fun b!997804 () Bool)

(declare-fun res!667755 () Bool)

(assert (=> b!997804 (=> (not res!667755) (not e!562734))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997804 (= res!667755 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30886 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30886 a!3219))))))

(declare-fun res!667758 () Bool)

(assert (=> start!86154 (=> (not res!667758) (not e!562732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86154 (= res!667758 (validMask!0 mask!3464))))

(assert (=> start!86154 e!562732))

(declare-fun array_inv!23508 (array!63108) Bool)

(assert (=> start!86154 (array_inv!23508 a!3219)))

(assert (=> start!86154 true))

(declare-fun b!997805 () Bool)

(assert (=> b!997805 (= e!562734 e!562735)))

(declare-fun res!667761 () Bool)

(assert (=> b!997805 (=> (not res!667761) (not e!562735))))

(assert (=> b!997805 (= res!667761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441532 (select (arr!30384 a!3219) j!170) a!3219 mask!3464) lt!441533))))

(assert (=> b!997805 (= lt!441533 (Intermediate!9316 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997805 (= lt!441532 (toIndex!0 (select (arr!30384 a!3219) j!170) mask!3464))))

(declare-fun b!997806 () Bool)

(declare-fun res!667757 () Bool)

(assert (=> b!997806 (=> (not res!667757) (not e!562732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997806 (= res!667757 (validKeyInArray!0 (select (arr!30384 a!3219) j!170)))))

(declare-fun b!997807 () Bool)

(declare-fun res!667756 () Bool)

(assert (=> b!997807 (=> (not res!667756) (not e!562732))))

(assert (=> b!997807 (= res!667756 (validKeyInArray!0 k!2224))))

(declare-fun b!997808 () Bool)

(declare-fun res!667759 () Bool)

(assert (=> b!997808 (=> (not res!667759) (not e!562732))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997808 (= res!667759 (and (= (size!30886 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30886 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30886 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997809 () Bool)

(assert (=> b!997809 (= e!562732 e!562734)))

(declare-fun res!667760 () Bool)

(assert (=> b!997809 (=> (not res!667760) (not e!562734))))

(declare-fun lt!441531 () SeekEntryResult!9316)

(assert (=> b!997809 (= res!667760 (or (= lt!441531 (MissingVacant!9316 i!1194)) (= lt!441531 (MissingZero!9316 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63108 (_ BitVec 32)) SeekEntryResult!9316)

(assert (=> b!997809 (= lt!441531 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86154 res!667758) b!997808))

(assert (= (and b!997808 res!667759) b!997806))

(assert (= (and b!997806 res!667757) b!997807))

(assert (= (and b!997807 res!667756) b!997801))

(assert (= (and b!997801 res!667754) b!997809))

(assert (= (and b!997809 res!667760) b!997800))

(assert (= (and b!997800 res!667762) b!997803))

(assert (= (and b!997803 res!667764) b!997804))

(assert (= (and b!997804 res!667755) b!997805))

(assert (= (and b!997805 res!667761) b!997802))

(assert (= (and b!997802 res!667763) b!997799))

(declare-fun m!924533 () Bool)

(assert (=> b!997806 m!924533))

(assert (=> b!997806 m!924533))

(declare-fun m!924535 () Bool)

(assert (=> b!997806 m!924535))

(declare-fun m!924537 () Bool)

(assert (=> b!997803 m!924537))

(declare-fun m!924539 () Bool)

(assert (=> start!86154 m!924539))

(declare-fun m!924541 () Bool)

(assert (=> start!86154 m!924541))

(declare-fun m!924543 () Bool)

(assert (=> b!997801 m!924543))

(declare-fun m!924545 () Bool)

(assert (=> b!997800 m!924545))

(assert (=> b!997805 m!924533))

(assert (=> b!997805 m!924533))

(declare-fun m!924547 () Bool)

(assert (=> b!997805 m!924547))

(assert (=> b!997805 m!924533))

(declare-fun m!924549 () Bool)

(assert (=> b!997805 m!924549))

(declare-fun m!924551 () Bool)

(assert (=> b!997809 m!924551))

(declare-fun m!924553 () Bool)

(assert (=> b!997807 m!924553))

(assert (=> b!997802 m!924533))

(assert (=> b!997802 m!924533))

(declare-fun m!924555 () Bool)

(assert (=> b!997802 m!924555))

(push 1)

(assert (not b!997809))

(assert (not b!997807))

(assert (not b!997803))

(assert (not b!997802))

(assert (not b!997800))

(assert (not b!997801))

(assert (not b!997805))

(assert (not start!86154))

(assert (not b!997806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119109 () Bool)

(assert (=> d!119109 (= (validKeyInArray!0 (select (arr!30384 a!3219) j!170)) (and (not (= (select (arr!30384 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30384 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997806 d!119109))

(declare-fun b!997830 () Bool)

(declare-fun e!562752 () Bool)

(declare-fun call!42263 () Bool)

(assert (=> b!997830 (= e!562752 call!42263)))

(declare-fun b!997831 () Bool)

(declare-fun e!562753 () Bool)

(assert (=> b!997831 (= e!562753 e!562752)))

(declare-fun c!101171 () Bool)

(assert (=> b!997831 (= c!101171 (validKeyInArray!0 (select (arr!30384 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42260 () Bool)

(assert (=> bm!42260 (= call!42263 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!119111 () Bool)

(declare-fun res!667775 () Bool)

(assert (=> d!119111 (=> res!667775 e!562753)))

(assert (=> d!119111 (= res!667775 (bvsge #b00000000000000000000000000000000 (size!30886 a!3219)))))

(assert (=> d!119111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562753)))

(declare-fun b!997832 () Bool)

(declare-fun e!562751 () Bool)

(assert (=> b!997832 (= e!562751 call!42263)))

(declare-fun b!997833 () Bool)

(assert (=> b!997833 (= e!562752 e!562751)))

(declare-fun lt!441551 () (_ BitVec 64))

(assert (=> b!997833 (= lt!441551 (select (arr!30384 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32982 0))(
  ( (Unit!32983) )
))
(declare-fun lt!441550 () Unit!32982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63108 (_ BitVec 64) (_ BitVec 32)) Unit!32982)

(assert (=> b!997833 (= lt!441550 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441551 #b00000000000000000000000000000000))))

(assert (=> b!997833 (arrayContainsKey!0 a!3219 lt!441551 #b00000000000000000000000000000000)))

(declare-fun lt!441549 () Unit!32982)

(assert (=> b!997833 (= lt!441549 lt!441550)))

(declare-fun res!667776 () Bool)

(assert (=> b!997833 (= res!667776 (= (seekEntryOrOpen!0 (select (arr!30384 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9316 #b00000000000000000000000000000000)))))

(assert (=> b!997833 (=> (not res!667776) (not e!562751))))

(assert (= (and d!119111 (not res!667775)) b!997831))

(assert (= (and b!997831 c!101171) b!997833))

(assert (= (and b!997831 (not c!101171)) b!997830))

(assert (= (and b!997833 res!667776) b!997832))

(assert (= (or b!997832 b!997830) bm!42260))

(declare-fun m!924569 () Bool)

(assert (=> b!997831 m!924569))

(assert (=> b!997831 m!924569))

(declare-fun m!924571 () Bool)

(assert (=> b!997831 m!924571))

(declare-fun m!924573 () Bool)

(assert (=> bm!42260 m!924573))

(assert (=> b!997833 m!924569))

(declare-fun m!924575 () Bool)

(assert (=> b!997833 m!924575))

(declare-fun m!924577 () Bool)

(assert (=> b!997833 m!924577))

(assert (=> b!997833 m!924569))

(declare-fun m!924579 () Bool)

(assert (=> b!997833 m!924579))

(assert (=> b!997800 d!119111))

(declare-fun d!119115 () Bool)

(declare-fun e!562793 () Bool)

(assert (=> d!119115 e!562793))

(declare-fun c!101193 () Bool)

(declare-fun lt!441564 () SeekEntryResult!9316)

(assert (=> d!119115 (= c!101193 (and (is-Intermediate!9316 lt!441564) (undefined!10128 lt!441564)))))

(declare-fun e!562796 () SeekEntryResult!9316)

(assert (=> d!119115 (= lt!441564 e!562796)))

(declare-fun c!101194 () Bool)

(assert (=> d!119115 (= c!101194 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441565 () (_ BitVec 64))

(assert (=> d!119115 (= lt!441565 (select (arr!30384 a!3219) lt!441532))))

(assert (=> d!119115 (validMask!0 mask!3464)))

(assert (=> d!119115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441532 (select (arr!30384 a!3219) j!170) a!3219 mask!3464) lt!441564)))

(declare-fun b!997898 () Bool)

(assert (=> b!997898 (and (bvsge (index!39637 lt!441564) #b00000000000000000000000000000000) (bvslt (index!39637 lt!441564) (size!30886 a!3219)))))

(declare-fun e!562795 () Bool)

(assert (=> b!997898 (= e!562795 (= (select (arr!30384 a!3219) (index!39637 lt!441564)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997899 () Bool)

(assert (=> b!997899 (= e!562793 (bvsge (x!87062 lt!441564) #b01111111111111111111111111111110))))

(declare-fun b!997900 () Bool)

(declare-fun e!562794 () SeekEntryResult!9316)

(assert (=> b!997900 (= e!562794 (Intermediate!9316 false lt!441532 #b00000000000000000000000000000000))))

(declare-fun b!997901 () Bool)

(assert (=> b!997901 (and (bvsge (index!39637 lt!441564) #b00000000000000000000000000000000) (bvslt (index!39637 lt!441564) (size!30886 a!3219)))))

(declare-fun res!667804 () Bool)

(assert (=> b!997901 (= res!667804 (= (select (arr!30384 a!3219) (index!39637 lt!441564)) (select (arr!30384 a!3219) j!170)))))

(assert (=> b!997901 (=> res!667804 e!562795)))

(declare-fun e!562792 () Bool)

(assert (=> b!997901 (= e!562792 e!562795)))

(declare-fun b!997902 () Bool)

(assert (=> b!997902 (= e!562796 (Intermediate!9316 true lt!441532 #b00000000000000000000000000000000))))

(declare-fun b!997903 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997903 (= e!562794 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!441532 #b00000000000000000000000000000000 mask!3464) (select (arr!30384 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997904 () Bool)

(assert (=> b!997904 (and (bvsge (index!39637 lt!441564) #b00000000000000000000000000000000) (bvslt (index!39637 lt!441564) (size!30886 a!3219)))))

(declare-fun res!667803 () Bool)

(assert (=> b!997904 (= res!667803 (= (select (arr!30384 a!3219) (index!39637 lt!441564)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997904 (=> res!667803 e!562795)))

(declare-fun b!997905 () Bool)

(assert (=> b!997905 (= e!562796 e!562794)))

(declare-fun c!101192 () Bool)

(assert (=> b!997905 (= c!101192 (or (= lt!441565 (select (arr!30384 a!3219) j!170)) (= (bvadd lt!441565 lt!441565) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997906 () Bool)

(assert (=> b!997906 (= e!562793 e!562792)))

(declare-fun res!667802 () Bool)

(assert (=> b!997906 (= res!667802 (and (is-Intermediate!9316 lt!441564) (not (undefined!10128 lt!441564)) (bvslt (x!87062 lt!441564) #b01111111111111111111111111111110) (bvsge (x!87062 lt!441564) #b00000000000000000000000000000000) (bvsge (x!87062 lt!441564) #b00000000000000000000000000000000)))))

(assert (=> b!997906 (=> (not res!667802) (not e!562792))))

(assert (= (and d!119115 c!101194) b!997902))

(assert (= (and d!119115 (not c!101194)) b!997905))

(assert (= (and b!997905 c!101192) b!997900))

(assert (= (and b!997905 (not c!101192)) b!997903))

(assert (= (and d!119115 c!101193) b!997899))

(assert (= (and d!119115 (not c!101193)) b!997906))

(assert (= (and b!997906 res!667802) b!997901))

(assert (= (and b!997901 (not res!667804)) b!997904))

(assert (= (and b!997904 (not res!667803)) b!997898))

(declare-fun m!924597 () Bool)

(assert (=> d!119115 m!924597))

(assert (=> d!119115 m!924539))

(declare-fun m!924599 () Bool)

(assert (=> b!997903 m!924599))

(assert (=> b!997903 m!924599))

(assert (=> b!997903 m!924533))

(declare-fun m!924601 () Bool)

(assert (=> b!997903 m!924601))

(declare-fun m!924603 () Bool)

(assert (=> b!997904 m!924603))

(assert (=> b!997901 m!924603))

(assert (=> b!997898 m!924603))

(assert (=> b!997805 d!119115))

(declare-fun d!119129 () Bool)

(declare-fun lt!441577 () (_ BitVec 32))

(declare-fun lt!441576 () (_ BitVec 32))

(assert (=> d!119129 (= lt!441577 (bvmul (bvxor lt!441576 (bvlshr lt!441576 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119129 (= lt!441576 ((_ extract 31 0) (bvand (bvxor (select (arr!30384 a!3219) j!170) (bvlshr (select (arr!30384 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119129 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667805 (let ((h!22226 ((_ extract 31 0) (bvand (bvxor (select (arr!30384 a!3219) j!170) (bvlshr (select (arr!30384 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87066 (bvmul (bvxor h!22226 (bvlshr h!22226 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87066 (bvlshr x!87066 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667805 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667805 #b00000000000000000000000000000000))))))

(assert (=> d!119129 (= (toIndex!0 (select (arr!30384 a!3219) j!170) mask!3464) (bvand (bvxor lt!441577 (bvlshr lt!441577 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997805 d!119129))

(declare-fun d!119139 () Bool)

(declare-fun e!562808 () Bool)

(assert (=> d!119139 e!562808))

(declare-fun c!101197 () Bool)

(declare-fun lt!441578 () SeekEntryResult!9316)

(assert (=> d!119139 (= c!101197 (and (is-Intermediate!9316 lt!441578) (undefined!10128 lt!441578)))))

(declare-fun e!562811 () SeekEntryResult!9316)

(assert (=> d!119139 (= lt!441578 e!562811)))

(declare-fun c!101198 () Bool)

(assert (=> d!119139 (= c!101198 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441579 () (_ BitVec 64))

(assert (=> d!119139 (= lt!441579 (select (arr!30384 a!3219) index!1507))))

(assert (=> d!119139 (validMask!0 mask!3464)))

(assert (=> d!119139 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30384 a!3219) j!170) a!3219 mask!3464) lt!441578)))

(declare-fun b!997918 () Bool)

(assert (=> b!997918 (and (bvsge (index!39637 lt!441578) #b00000000000000000000000000000000) (bvslt (index!39637 lt!441578) (size!30886 a!3219)))))

(declare-fun e!562810 () Bool)

(assert (=> b!997918 (= e!562810 (= (select (arr!30384 a!3219) (index!39637 lt!441578)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997919 () Bool)

(assert (=> b!997919 (= e!562808 (bvsge (x!87062 lt!441578) #b01111111111111111111111111111110))))

(declare-fun b!997920 () Bool)

(declare-fun e!562809 () SeekEntryResult!9316)

(assert (=> b!997920 (= e!562809 (Intermediate!9316 false index!1507 x!1245))))

(declare-fun b!997921 () Bool)

(assert (=> b!997921 (and (bvsge (index!39637 lt!441578) #b00000000000000000000000000000000) (bvslt (index!39637 lt!441578) (size!30886 a!3219)))))

(declare-fun res!667817 () Bool)

(assert (=> b!997921 (= res!667817 (= (select (arr!30384 a!3219) (index!39637 lt!441578)) (select (arr!30384 a!3219) j!170)))))

(assert (=> b!997921 (=> res!667817 e!562810)))

(declare-fun e!562807 () Bool)

(assert (=> b!997921 (= e!562807 e!562810)))

(declare-fun b!997922 () Bool)

(assert (=> b!997922 (= e!562811 (Intermediate!9316 true index!1507 x!1245))))

(declare-fun b!997923 () Bool)

(assert (=> b!997923 (= e!562809 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30384 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997924 () Bool)

(assert (=> b!997924 (and (bvsge (index!39637 lt!441578) #b00000000000000000000000000000000) (bvslt (index!39637 lt!441578) (size!30886 a!3219)))))

(declare-fun res!667816 () Bool)

(assert (=> b!997924 (= res!667816 (= (select (arr!30384 a!3219) (index!39637 lt!441578)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997924 (=> res!667816 e!562810)))

(declare-fun b!997925 () Bool)

(assert (=> b!997925 (= e!562811 e!562809)))

(declare-fun c!101196 () Bool)

(assert (=> b!997925 (= c!101196 (or (= lt!441579 (select (arr!30384 a!3219) j!170)) (= (bvadd lt!441579 lt!441579) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997926 () Bool)

(assert (=> b!997926 (= e!562808 e!562807)))

(declare-fun res!667815 () Bool)

(assert (=> b!997926 (= res!667815 (and (is-Intermediate!9316 lt!441578) (not (undefined!10128 lt!441578)) (bvslt (x!87062 lt!441578) #b01111111111111111111111111111110) (bvsge (x!87062 lt!441578) #b00000000000000000000000000000000) (bvsge (x!87062 lt!441578) x!1245)))))

(assert (=> b!997926 (=> (not res!667815) (not e!562807))))

(assert (= (and d!119139 c!101198) b!997922))

(assert (= (and d!119139 (not c!101198)) b!997925))

(assert (= (and b!997925 c!101196) b!997920))

(assert (= (and b!997925 (not c!101196)) b!997923))

(assert (= (and d!119139 c!101197) b!997919))

(assert (= (and d!119139 (not c!101197)) b!997926))

(assert (= (and b!997926 res!667815) b!997921))

(assert (= (and b!997921 (not res!667817)) b!997924))

(assert (= (and b!997924 (not res!667816)) b!997918))

(declare-fun m!924615 () Bool)

(assert (=> d!119139 m!924615))

(assert (=> d!119139 m!924539))

(declare-fun m!924617 () Bool)

(assert (=> b!997923 m!924617))

(assert (=> b!997923 m!924617))

(assert (=> b!997923 m!924533))

(declare-fun m!924619 () Bool)

(assert (=> b!997923 m!924619))

(declare-fun m!924621 () Bool)

(assert (=> b!997924 m!924621))

(assert (=> b!997921 m!924621))

(assert (=> b!997918 m!924621))

(assert (=> b!997802 d!119139))

(declare-fun d!119141 () Bool)

(assert (=> d!119141 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86154 d!119141))

(declare-fun d!119145 () Bool)

(assert (=> d!119145 (= (array_inv!23508 a!3219) (bvsge (size!30886 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86154 d!119145))

(declare-fun d!119147 () Bool)

(assert (=> d!119147 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997807 d!119147))

(declare-fun d!119149 () Bool)

(declare-fun res!667831 () Bool)

(declare-fun e!562828 () Bool)

(assert (=> d!119149 (=> res!667831 e!562828)))

(assert (=> d!119149 (= res!667831 (= (select (arr!30384 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119149 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!562828)))

(declare-fun b!997946 () Bool)

(declare-fun e!562829 () Bool)

(assert (=> b!997946 (= e!562828 e!562829)))

(declare-fun res!667832 () Bool)

(assert (=> b!997946 (=> (not res!667832) (not e!562829))))

(assert (=> b!997946 (= res!667832 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30886 a!3219)))))

(declare-fun b!997947 () Bool)

(assert (=> b!997947 (= e!562829 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119149 (not res!667831)) b!997946))

(assert (= (and b!997946 res!667832) b!997947))

(assert (=> d!119149 m!924569))

(declare-fun m!924627 () Bool)

(assert (=> b!997947 m!924627))

(assert (=> b!997801 d!119149))

(declare-fun d!119151 () Bool)

(declare-fun res!667847 () Bool)

(declare-fun e!562851 () Bool)

(assert (=> d!119151 (=> res!667847 e!562851)))

(assert (=> d!119151 (= res!667847 (bvsge #b00000000000000000000000000000000 (size!30886 a!3219)))))

(assert (=> d!119151 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21057) e!562851)))

(declare-fun b!997976 () Bool)

(declare-fun e!562850 () Bool)

(declare-fun call!42272 () Bool)

(assert (=> b!997976 (= e!562850 call!42272)))

(declare-fun bm!42269 () Bool)

(declare-fun c!101210 () Bool)

(assert (=> bm!42269 (= call!42272 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101210 (Cons!21056 (select (arr!30384 a!3219) #b00000000000000000000000000000000) Nil!21057) Nil!21057)))))

(declare-fun b!997977 () Bool)

(declare-fun e!562848 () Bool)

(assert (=> b!997977 (= e!562848 e!562850)))

(assert (=> b!997977 (= c!101210 (validKeyInArray!0 (select (arr!30384 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997978 () Bool)

(assert (=> b!997978 (= e!562850 call!42272)))

(declare-fun b!997979 () Bool)

(declare-fun e!562849 () Bool)

(declare-fun contains!5873 (List!21060 (_ BitVec 64)) Bool)

(assert (=> b!997979 (= e!562849 (contains!5873 Nil!21057 (select (arr!30384 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997980 () Bool)

(assert (=> b!997980 (= e!562851 e!562848)))

(declare-fun res!667845 () Bool)

(assert (=> b!997980 (=> (not res!667845) (not e!562848))))

(assert (=> b!997980 (= res!667845 (not e!562849))))

(declare-fun res!667846 () Bool)

(assert (=> b!997980 (=> (not res!667846) (not e!562849))))

(assert (=> b!997980 (= res!667846 (validKeyInArray!0 (select (arr!30384 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119151 (not res!667847)) b!997980))

(assert (= (and b!997980 res!667846) b!997979))

(assert (= (and b!997980 res!667845) b!997977))

(assert (= (and b!997977 c!101210) b!997976))

(assert (= (and b!997977 (not c!101210)) b!997978))

(assert (= (or b!997976 b!997978) bm!42269))

(assert (=> bm!42269 m!924569))

(declare-fun m!924629 () Bool)

(assert (=> bm!42269 m!924629))

(assert (=> b!997977 m!924569))

(assert (=> b!997977 m!924569))

(assert (=> b!997977 m!924571))

(assert (=> b!997979 m!924569))

(assert (=> b!997979 m!924569))

(declare-fun m!924631 () Bool)

(assert (=> b!997979 m!924631))

(assert (=> b!997980 m!924569))

(assert (=> b!997980 m!924569))

(assert (=> b!997980 m!924571))

(assert (=> b!997803 d!119151))

(declare-fun b!998043 () Bool)

(declare-fun e!562891 () SeekEntryResult!9316)

(declare-fun e!562889 () SeekEntryResult!9316)

(assert (=> b!998043 (= e!562891 e!562889)))

(declare-fun lt!441617 () (_ BitVec 64))

(declare-fun lt!441616 () SeekEntryResult!9316)

(assert (=> b!998043 (= lt!441617 (select (arr!30384 a!3219) (index!39637 lt!441616)))))

(declare-fun c!101236 () Bool)

(assert (=> b!998043 (= c!101236 (= lt!441617 k!2224))))

(declare-fun d!119157 () Bool)

(declare-fun lt!441615 () SeekEntryResult!9316)

(assert (=> d!119157 (and (or (is-Undefined!9316 lt!441615) (not (is-Found!9316 lt!441615)) (and (bvsge (index!39636 lt!441615) #b00000000000000000000000000000000) (bvslt (index!39636 lt!441615) (size!30886 a!3219)))) (or (is-Undefined!9316 lt!441615) (is-Found!9316 lt!441615) (not (is-MissingZero!9316 lt!441615)) (and (bvsge (index!39635 lt!441615) #b00000000000000000000000000000000) (bvslt (index!39635 lt!441615) (size!30886 a!3219)))) (or (is-Undefined!9316 lt!441615) (is-Found!9316 lt!441615) (is-MissingZero!9316 lt!441615) (not (is-MissingVacant!9316 lt!441615)) (and (bvsge (index!39638 lt!441615) #b00000000000000000000000000000000) (bvslt (index!39638 lt!441615) (size!30886 a!3219)))) (or (is-Undefined!9316 lt!441615) (ite (is-Found!9316 lt!441615) (= (select (arr!30384 a!3219) (index!39636 lt!441615)) k!2224) (ite (is-MissingZero!9316 lt!441615) (= (select (arr!30384 a!3219) (index!39635 lt!441615)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9316 lt!441615) (= (select (arr!30384 a!3219) (index!39638 lt!441615)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119157 (= lt!441615 e!562891)))

(declare-fun c!101234 () Bool)

(assert (=> d!119157 (= c!101234 (and (is-Intermediate!9316 lt!441616) (undefined!10128 lt!441616)))))

(assert (=> d!119157 (= lt!441616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119157 (validMask!0 mask!3464)))

(assert (=> d!119157 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441615)))

(declare-fun b!998044 () Bool)

(assert (=> b!998044 (= e!562889 (Found!9316 (index!39637 lt!441616)))))

(declare-fun b!998045 () Bool)

(assert (=> b!998045 (= e!562891 Undefined!9316)))

(declare-fun b!998046 () Bool)

(declare-fun e!562890 () SeekEntryResult!9316)

(assert (=> b!998046 (= e!562890 (MissingZero!9316 (index!39637 lt!441616)))))

(declare-fun b!998047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63108 (_ BitVec 32)) SeekEntryResult!9316)

(assert (=> b!998047 (= e!562890 (seekKeyOrZeroReturnVacant!0 (x!87062 lt!441616) (index!39637 lt!441616) (index!39637 lt!441616) k!2224 a!3219 mask!3464))))

(declare-fun b!998048 () Bool)

(declare-fun c!101235 () Bool)

(assert (=> b!998048 (= c!101235 (= lt!441617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998048 (= e!562889 e!562890)))

(assert (= (and d!119157 c!101234) b!998045))

(assert (= (and d!119157 (not c!101234)) b!998043))

(assert (= (and b!998043 c!101236) b!998044))

(assert (= (and b!998043 (not c!101236)) b!998048))

(assert (= (and b!998048 c!101235) b!998046))

(assert (= (and b!998048 (not c!101235)) b!998047))

(declare-fun m!924665 () Bool)

(assert (=> b!998043 m!924665))

(declare-fun m!924667 () Bool)

(assert (=> d!119157 m!924667))

(declare-fun m!924669 () Bool)

(assert (=> d!119157 m!924669))

(declare-fun m!924671 () Bool)

(assert (=> d!119157 m!924671))

(declare-fun m!924673 () Bool)

(assert (=> d!119157 m!924673))

(assert (=> d!119157 m!924539))

(declare-fun m!924675 () Bool)

(assert (=> d!119157 m!924675))

(assert (=> d!119157 m!924671))

(declare-fun m!924677 () Bool)

(assert (=> b!998047 m!924677))

(assert (=> b!997809 d!119157))

(push 1)

(assert (not b!997947))

(assert (not d!119157))

(assert (not bm!42260))

(assert (not b!998047))

(assert (not d!119139))

(assert (not b!997979))

(assert (not d!119115))

(assert (not b!997833))

(assert (not b!997831))

(assert (not b!997903))

(assert (not bm!42269))

(assert (not b!997980))

(assert (not b!997923))

(assert (not b!997977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

