; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85898 () Bool)

(assert start!85898)

(declare-fun b!995612 () Bool)

(declare-fun res!665903 () Bool)

(declare-fun e!561810 () Bool)

(assert (=> b!995612 (=> (not res!665903) (not e!561810))))

(declare-datatypes ((array!62987 0))(
  ( (array!62988 (arr!30328 (Array (_ BitVec 32) (_ BitVec 64))) (size!30830 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62987)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62987 (_ BitVec 32)) Bool)

(assert (=> b!995612 (= res!665903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995613 () Bool)

(declare-fun e!561809 () Bool)

(assert (=> b!995613 (= e!561809 e!561810)))

(declare-fun res!665906 () Bool)

(assert (=> b!995613 (=> (not res!665906) (not e!561810))))

(declare-datatypes ((SeekEntryResult!9260 0))(
  ( (MissingZero!9260 (index!39411 (_ BitVec 32))) (Found!9260 (index!39412 (_ BitVec 32))) (Intermediate!9260 (undefined!10072 Bool) (index!39413 (_ BitVec 32)) (x!86853 (_ BitVec 32))) (Undefined!9260) (MissingVacant!9260 (index!39414 (_ BitVec 32))) )
))
(declare-fun lt!440999 () SeekEntryResult!9260)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995613 (= res!665906 (or (= lt!440999 (MissingVacant!9260 i!1194)) (= lt!440999 (MissingZero!9260 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62987 (_ BitVec 32)) SeekEntryResult!9260)

(assert (=> b!995613 (= lt!440999 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995614 () Bool)

(declare-fun res!665910 () Bool)

(assert (=> b!995614 (=> (not res!665910) (not e!561809))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995614 (= res!665910 (validKeyInArray!0 (select (arr!30328 a!3219) j!170)))))

(declare-fun b!995615 () Bool)

(declare-fun res!665908 () Bool)

(assert (=> b!995615 (=> (not res!665908) (not e!561809))))

(declare-fun arrayContainsKey!0 (array!62987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995615 (= res!665908 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995616 () Bool)

(declare-fun res!665907 () Bool)

(assert (=> b!995616 (=> (not res!665907) (not e!561810))))

(declare-datatypes ((List!21004 0))(
  ( (Nil!21001) (Cons!21000 (h!22162 (_ BitVec 64)) (t!30005 List!21004)) )
))
(declare-fun arrayNoDuplicates!0 (array!62987 (_ BitVec 32) List!21004) Bool)

(assert (=> b!995616 (= res!665907 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21001))))

(declare-fun res!665909 () Bool)

(assert (=> start!85898 (=> (not res!665909) (not e!561809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85898 (= res!665909 (validMask!0 mask!3464))))

(assert (=> start!85898 e!561809))

(declare-fun array_inv!23452 (array!62987) Bool)

(assert (=> start!85898 (array_inv!23452 a!3219)))

(assert (=> start!85898 true))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun b!995617 () Bool)

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!995617 (= e!561810 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30830 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30830 a!3219)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!995618 () Bool)

(declare-fun res!665905 () Bool)

(assert (=> b!995618 (=> (not res!665905) (not e!561809))))

(assert (=> b!995618 (= res!665905 (validKeyInArray!0 k!2224))))

(declare-fun b!995619 () Bool)

(declare-fun res!665904 () Bool)

(assert (=> b!995619 (=> (not res!665904) (not e!561809))))

(assert (=> b!995619 (= res!665904 (and (= (size!30830 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30830 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30830 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85898 res!665909) b!995619))

(assert (= (and b!995619 res!665904) b!995614))

(assert (= (and b!995614 res!665910) b!995618))

(assert (= (and b!995618 res!665905) b!995615))

(assert (= (and b!995615 res!665908) b!995613))

(assert (= (and b!995613 res!665906) b!995612))

(assert (= (and b!995612 res!665903) b!995616))

(assert (= (and b!995616 res!665907) b!995617))

(declare-fun m!922979 () Bool)

(assert (=> start!85898 m!922979))

(declare-fun m!922981 () Bool)

(assert (=> start!85898 m!922981))

(declare-fun m!922983 () Bool)

(assert (=> b!995616 m!922983))

(declare-fun m!922985 () Bool)

(assert (=> b!995615 m!922985))

(declare-fun m!922987 () Bool)

(assert (=> b!995612 m!922987))

(declare-fun m!922989 () Bool)

(assert (=> b!995613 m!922989))

(declare-fun m!922991 () Bool)

(assert (=> b!995614 m!922991))

(assert (=> b!995614 m!922991))

(declare-fun m!922993 () Bool)

(assert (=> b!995614 m!922993))

(declare-fun m!922995 () Bool)

(assert (=> b!995618 m!922995))

(push 1)

(assert (not b!995615))

(assert (not b!995618))

(assert (not b!995613))

(assert (not b!995612))

(assert (not start!85898))

(assert (not b!995616))

(assert (not b!995614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118903 () Bool)

(assert (=> d!118903 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995618 d!118903))

(declare-fun b!995700 () Bool)

(declare-fun e!561853 () SeekEntryResult!9260)

(assert (=> b!995700 (= e!561853 Undefined!9260)))

(declare-fun b!995701 () Bool)

(declare-fun e!561851 () SeekEntryResult!9260)

(declare-fun lt!441027 () SeekEntryResult!9260)

(assert (=> b!995701 (= e!561851 (MissingZero!9260 (index!39413 lt!441027)))))

(declare-fun b!995702 () Bool)

(declare-fun c!101006 () Bool)

(declare-fun lt!441028 () (_ BitVec 64))

(assert (=> b!995702 (= c!101006 (= lt!441028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561852 () SeekEntryResult!9260)

(assert (=> b!995702 (= e!561852 e!561851)))

(declare-fun d!118905 () Bool)

(declare-fun lt!441029 () SeekEntryResult!9260)

(assert (=> d!118905 (and (or (is-Undefined!9260 lt!441029) (not (is-Found!9260 lt!441029)) (and (bvsge (index!39412 lt!441029) #b00000000000000000000000000000000) (bvslt (index!39412 lt!441029) (size!30830 a!3219)))) (or (is-Undefined!9260 lt!441029) (is-Found!9260 lt!441029) (not (is-MissingZero!9260 lt!441029)) (and (bvsge (index!39411 lt!441029) #b00000000000000000000000000000000) (bvslt (index!39411 lt!441029) (size!30830 a!3219)))) (or (is-Undefined!9260 lt!441029) (is-Found!9260 lt!441029) (is-MissingZero!9260 lt!441029) (not (is-MissingVacant!9260 lt!441029)) (and (bvsge (index!39414 lt!441029) #b00000000000000000000000000000000) (bvslt (index!39414 lt!441029) (size!30830 a!3219)))) (or (is-Undefined!9260 lt!441029) (ite (is-Found!9260 lt!441029) (= (select (arr!30328 a!3219) (index!39412 lt!441029)) k!2224) (ite (is-MissingZero!9260 lt!441029) (= (select (arr!30328 a!3219) (index!39411 lt!441029)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9260 lt!441029) (= (select (arr!30328 a!3219) (index!39414 lt!441029)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118905 (= lt!441029 e!561853)))

(declare-fun c!101008 () Bool)

(assert (=> d!118905 (= c!101008 (and (is-Intermediate!9260 lt!441027) (undefined!10072 lt!441027)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62987 (_ BitVec 32)) SeekEntryResult!9260)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118905 (= lt!441027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!118905 (validMask!0 mask!3464)))

(assert (=> d!118905 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441029)))

(declare-fun b!995703 () Bool)

(assert (=> b!995703 (= e!561852 (Found!9260 (index!39413 lt!441027)))))

(declare-fun b!995704 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62987 (_ BitVec 32)) SeekEntryResult!9260)

(assert (=> b!995704 (= e!561851 (seekKeyOrZeroReturnVacant!0 (x!86853 lt!441027) (index!39413 lt!441027) (index!39413 lt!441027) k!2224 a!3219 mask!3464))))

(declare-fun b!995705 () Bool)

(assert (=> b!995705 (= e!561853 e!561852)))

(assert (=> b!995705 (= lt!441028 (select (arr!30328 a!3219) (index!39413 lt!441027)))))

(declare-fun c!101007 () Bool)

(assert (=> b!995705 (= c!101007 (= lt!441028 k!2224))))

(assert (= (and d!118905 c!101008) b!995700))

(assert (= (and d!118905 (not c!101008)) b!995705))

(assert (= (and b!995705 c!101007) b!995703))

(assert (= (and b!995705 (not c!101007)) b!995702))

(assert (= (and b!995702 c!101006) b!995701))

(assert (= (and b!995702 (not c!101006)) b!995704))

(declare-fun m!923045 () Bool)

(assert (=> d!118905 m!923045))

(declare-fun m!923047 () Bool)

(assert (=> d!118905 m!923047))

(assert (=> d!118905 m!923047))

(declare-fun m!923049 () Bool)

(assert (=> d!118905 m!923049))

(assert (=> d!118905 m!922979))

(declare-fun m!923051 () Bool)

(assert (=> d!118905 m!923051))

(declare-fun m!923053 () Bool)

(assert (=> d!118905 m!923053))

(declare-fun m!923055 () Bool)

(assert (=> b!995704 m!923055))

(declare-fun m!923057 () Bool)

(assert (=> b!995705 m!923057))

(assert (=> b!995613 d!118905))

(declare-fun b!995733 () Bool)

(declare-fun e!561877 () Bool)

(declare-fun call!42215 () Bool)

(assert (=> b!995733 (= e!561877 call!42215)))

(declare-fun b!995734 () Bool)

(declare-fun e!561875 () Bool)

(declare-fun e!561876 () Bool)

(assert (=> b!995734 (= e!561875 e!561876)))

(declare-fun c!101015 () Bool)

(assert (=> b!995734 (= c!101015 (validKeyInArray!0 (select (arr!30328 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42212 () Bool)

(assert (=> bm!42212 (= call!42215 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!118915 () Bool)

(declare-fun res!665984 () Bool)

(assert (=> d!118915 (=> res!665984 e!561875)))

(assert (=> d!118915 (= res!665984 (bvsge #b00000000000000000000000000000000 (size!30830 a!3219)))))

(assert (=> d!118915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561875)))

(declare-fun b!995735 () Bool)

(assert (=> b!995735 (= e!561876 e!561877)))

(declare-fun lt!441039 () (_ BitVec 64))

(assert (=> b!995735 (= lt!441039 (select (arr!30328 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32964 0))(
  ( (Unit!32965) )
))
(declare-fun lt!441041 () Unit!32964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62987 (_ BitVec 64) (_ BitVec 32)) Unit!32964)

(assert (=> b!995735 (= lt!441041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441039 #b00000000000000000000000000000000))))

(assert (=> b!995735 (arrayContainsKey!0 a!3219 lt!441039 #b00000000000000000000000000000000)))

(declare-fun lt!441040 () Unit!32964)

(assert (=> b!995735 (= lt!441040 lt!441041)))

(declare-fun res!665985 () Bool)

(assert (=> b!995735 (= res!665985 (= (seekEntryOrOpen!0 (select (arr!30328 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9260 #b00000000000000000000000000000000)))))

(assert (=> b!995735 (=> (not res!665985) (not e!561877))))

(declare-fun b!995736 () Bool)

(assert (=> b!995736 (= e!561876 call!42215)))

(assert (= (and d!118915 (not res!665984)) b!995734))

(assert (= (and b!995734 c!101015) b!995735))

(assert (= (and b!995734 (not c!101015)) b!995736))

(assert (= (and b!995735 res!665985) b!995733))

(assert (= (or b!995733 b!995736) bm!42212))

(declare-fun m!923075 () Bool)

(assert (=> b!995734 m!923075))

(assert (=> b!995734 m!923075))

(declare-fun m!923077 () Bool)

(assert (=> b!995734 m!923077))

(declare-fun m!923079 () Bool)

(assert (=> bm!42212 m!923079))

(assert (=> b!995735 m!923075))

(declare-fun m!923081 () Bool)

(assert (=> b!995735 m!923081))

(declare-fun m!923083 () Bool)

(assert (=> b!995735 m!923083))

(assert (=> b!995735 m!923075))

(declare-fun m!923085 () Bool)

(assert (=> b!995735 m!923085))

(assert (=> b!995612 d!118915))

(declare-fun d!118925 () Bool)

(assert (=> d!118925 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85898 d!118925))

(declare-fun d!118931 () Bool)

(assert (=> d!118931 (= (array_inv!23452 a!3219) (bvsge (size!30830 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85898 d!118931))

(declare-fun b!995792 () Bool)

(declare-fun e!561921 () Bool)

(declare-fun e!561919 () Bool)

(assert (=> b!995792 (= e!561921 e!561919)))

(declare-fun res!666015 () Bool)

(assert (=> b!995792 (=> (not res!666015) (not e!561919))))

(declare-fun e!561922 () Bool)

(assert (=> b!995792 (= res!666015 (not e!561922))))

(declare-fun res!666014 () Bool)

(assert (=> b!995792 (=> (not res!666014) (not e!561922))))

(assert (=> b!995792 (= res!666014 (validKeyInArray!0 (select (arr!30328 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118937 () Bool)

(declare-fun res!666013 () Bool)

(assert (=> d!118937 (=> res!666013 e!561921)))

(assert (=> d!118937 (= res!666013 (bvsge #b00000000000000000000000000000000 (size!30830 a!3219)))))

(assert (=> d!118937 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21001) e!561921)))

(declare-fun b!995793 () Bool)

(declare-fun e!561920 () Bool)

(assert (=> b!995793 (= e!561919 e!561920)))

(declare-fun c!101030 () Bool)

(assert (=> b!995793 (= c!101030 (validKeyInArray!0 (select (arr!30328 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995794 () Bool)

(declare-fun call!42221 () Bool)

(assert (=> b!995794 (= e!561920 call!42221)))

(declare-fun bm!42218 () Bool)

(assert (=> bm!42218 (= call!42221 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101030 (Cons!21000 (select (arr!30328 a!3219) #b00000000000000000000000000000000) Nil!21001) Nil!21001)))))

(declare-fun b!995795 () Bool)

(declare-fun contains!5863 (List!21004 (_ BitVec 64)) Bool)

(assert (=> b!995795 (= e!561922 (contains!5863 Nil!21001 (select (arr!30328 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995796 () Bool)

(assert (=> b!995796 (= e!561920 call!42221)))

(assert (= (and d!118937 (not res!666013)) b!995792))

(assert (= (and b!995792 res!666014) b!995795))

(assert (= (and b!995792 res!666015) b!995793))

(assert (= (and b!995793 c!101030) b!995796))

(assert (= (and b!995793 (not c!101030)) b!995794))

(assert (= (or b!995796 b!995794) bm!42218))

(assert (=> b!995792 m!923075))

(assert (=> b!995792 m!923075))

(assert (=> b!995792 m!923077))

(assert (=> b!995793 m!923075))

(assert (=> b!995793 m!923075))

(assert (=> b!995793 m!923077))

(assert (=> bm!42218 m!923075))

(declare-fun m!923109 () Bool)

(assert (=> bm!42218 m!923109))

(assert (=> b!995795 m!923075))

(assert (=> b!995795 m!923075))

(declare-fun m!923111 () Bool)

(assert (=> b!995795 m!923111))

(assert (=> b!995616 d!118937))

(declare-fun d!118943 () Bool)

(declare-fun res!666020 () Bool)

(declare-fun e!561927 () Bool)

(assert (=> d!118943 (=> res!666020 e!561927)))

(assert (=> d!118943 (= res!666020 (= (select (arr!30328 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118943 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!561927)))

(declare-fun b!995801 () Bool)

(declare-fun e!561928 () Bool)

(assert (=> b!995801 (= e!561927 e!561928)))

(declare-fun res!666021 () Bool)

(assert (=> b!995801 (=> (not res!666021) (not e!561928))))

(assert (=> b!995801 (= res!666021 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30830 a!3219)))))

(declare-fun b!995802 () Bool)

(assert (=> b!995802 (= e!561928 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118943 (not res!666020)) b!995801))

(assert (= (and b!995801 res!666021) b!995802))

(assert (=> d!118943 m!923075))

(declare-fun m!923113 () Bool)

(assert (=> b!995802 m!923113))

(assert (=> b!995615 d!118943))

(declare-fun d!118947 () Bool)

(assert (=> d!118947 (= (validKeyInArray!0 (select (arr!30328 a!3219) j!170)) (and (not (= (select (arr!30328 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30328 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995614 d!118947))

(push 1)

