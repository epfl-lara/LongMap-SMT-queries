; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85902 () Bool)

(assert start!85902)

(declare-datatypes ((array!62991 0))(
  ( (array!62992 (arr!30330 (Array (_ BitVec 32) (_ BitVec 64))) (size!30832 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62991)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun b!995660 () Bool)

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun e!561828 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!995660 (= e!561828 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30832 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30832 a!3219)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!995661 () Bool)

(declare-fun res!665957 () Bool)

(declare-fun e!561827 () Bool)

(assert (=> b!995661 (=> (not res!665957) (not e!561827))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995661 (= res!665957 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995662 () Bool)

(declare-fun res!665954 () Bool)

(assert (=> b!995662 (=> (not res!665954) (not e!561827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995662 (= res!665954 (validKeyInArray!0 k!2224))))

(declare-fun b!995663 () Bool)

(declare-fun res!665955 () Bool)

(assert (=> b!995663 (=> (not res!665955) (not e!561827))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995663 (= res!665955 (and (= (size!30832 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30832 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30832 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995664 () Bool)

(declare-fun res!665951 () Bool)

(assert (=> b!995664 (=> (not res!665951) (not e!561828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62991 (_ BitVec 32)) Bool)

(assert (=> b!995664 (= res!665951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995665 () Bool)

(declare-fun res!665958 () Bool)

(assert (=> b!995665 (=> (not res!665958) (not e!561827))))

(assert (=> b!995665 (= res!665958 (validKeyInArray!0 (select (arr!30330 a!3219) j!170)))))

(declare-fun res!665956 () Bool)

(assert (=> start!85902 (=> (not res!665956) (not e!561827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85902 (= res!665956 (validMask!0 mask!3464))))

(assert (=> start!85902 e!561827))

(declare-fun array_inv!23454 (array!62991) Bool)

(assert (=> start!85902 (array_inv!23454 a!3219)))

(assert (=> start!85902 true))

(declare-fun b!995666 () Bool)

(assert (=> b!995666 (= e!561827 e!561828)))

(declare-fun res!665952 () Bool)

(assert (=> b!995666 (=> (not res!665952) (not e!561828))))

(declare-datatypes ((SeekEntryResult!9262 0))(
  ( (MissingZero!9262 (index!39419 (_ BitVec 32))) (Found!9262 (index!39420 (_ BitVec 32))) (Intermediate!9262 (undefined!10074 Bool) (index!39421 (_ BitVec 32)) (x!86855 (_ BitVec 32))) (Undefined!9262) (MissingVacant!9262 (index!39422 (_ BitVec 32))) )
))
(declare-fun lt!441005 () SeekEntryResult!9262)

(assert (=> b!995666 (= res!665952 (or (= lt!441005 (MissingVacant!9262 i!1194)) (= lt!441005 (MissingZero!9262 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62991 (_ BitVec 32)) SeekEntryResult!9262)

(assert (=> b!995666 (= lt!441005 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995667 () Bool)

(declare-fun res!665953 () Bool)

(assert (=> b!995667 (=> (not res!665953) (not e!561828))))

(declare-datatypes ((List!21006 0))(
  ( (Nil!21003) (Cons!21002 (h!22164 (_ BitVec 64)) (t!30007 List!21006)) )
))
(declare-fun arrayNoDuplicates!0 (array!62991 (_ BitVec 32) List!21006) Bool)

(assert (=> b!995667 (= res!665953 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21003))))

(assert (= (and start!85902 res!665956) b!995663))

(assert (= (and b!995663 res!665955) b!995665))

(assert (= (and b!995665 res!665958) b!995662))

(assert (= (and b!995662 res!665954) b!995661))

(assert (= (and b!995661 res!665957) b!995666))

(assert (= (and b!995666 res!665952) b!995664))

(assert (= (and b!995664 res!665951) b!995667))

(assert (= (and b!995667 res!665953) b!995660))

(declare-fun m!923015 () Bool)

(assert (=> b!995667 m!923015))

(declare-fun m!923017 () Bool)

(assert (=> b!995661 m!923017))

(declare-fun m!923019 () Bool)

(assert (=> start!85902 m!923019))

(declare-fun m!923021 () Bool)

(assert (=> start!85902 m!923021))

(declare-fun m!923023 () Bool)

(assert (=> b!995664 m!923023))

(declare-fun m!923025 () Bool)

(assert (=> b!995662 m!923025))

(declare-fun m!923027 () Bool)

(assert (=> b!995666 m!923027))

(declare-fun m!923029 () Bool)

(assert (=> b!995665 m!923029))

(assert (=> b!995665 m!923029))

(declare-fun m!923031 () Bool)

(assert (=> b!995665 m!923031))

(push 1)

(assert (not b!995664))

(assert (not b!995665))

(assert (not b!995661))

(assert (not b!995666))

(assert (not b!995667))

(assert (not b!995662))

(assert (not start!85902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118909 () Bool)

(declare-fun res!665969 () Bool)

(declare-fun e!561854 () Bool)

(assert (=> d!118909 (=> res!665969 e!561854)))

(assert (=> d!118909 (= res!665969 (bvsge #b00000000000000000000000000000000 (size!30832 a!3219)))))

(assert (=> d!118909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561854)))

(declare-fun b!995706 () Bool)

(declare-fun e!561856 () Bool)

(assert (=> b!995706 (= e!561854 e!561856)))

(declare-fun c!101009 () Bool)

(assert (=> b!995706 (= c!101009 (validKeyInArray!0 (select (arr!30330 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42206 () Bool)

(declare-fun call!42209 () Bool)

(assert (=> bm!42206 (= call!42209 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995707 () Bool)

(declare-fun e!561855 () Bool)

(assert (=> b!995707 (= e!561855 call!42209)))

(declare-fun b!995708 () Bool)

(assert (=> b!995708 (= e!561856 e!561855)))

(declare-fun lt!441031 () (_ BitVec 64))

(assert (=> b!995708 (= lt!441031 (select (arr!30330 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32966 0))(
  ( (Unit!32967) )
))
(declare-fun lt!441032 () Unit!32966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62991 (_ BitVec 64) (_ BitVec 32)) Unit!32966)

(assert (=> b!995708 (= lt!441032 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441031 #b00000000000000000000000000000000))))

(assert (=> b!995708 (arrayContainsKey!0 a!3219 lt!441031 #b00000000000000000000000000000000)))

(declare-fun lt!441030 () Unit!32966)

(assert (=> b!995708 (= lt!441030 lt!441032)))

(declare-fun res!665970 () Bool)

(assert (=> b!995708 (= res!665970 (= (seekEntryOrOpen!0 (select (arr!30330 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9262 #b00000000000000000000000000000000)))))

(assert (=> b!995708 (=> (not res!665970) (not e!561855))))

(declare-fun b!995709 () Bool)

(assert (=> b!995709 (= e!561856 call!42209)))

(assert (= (and d!118909 (not res!665969)) b!995706))

(assert (= (and b!995706 c!101009) b!995708))

(assert (= (and b!995706 (not c!101009)) b!995709))

(assert (= (and b!995708 res!665970) b!995707))

(assert (= (or b!995707 b!995709) bm!42206))

(declare-fun m!923059 () Bool)

(assert (=> b!995706 m!923059))

(assert (=> b!995706 m!923059))

(declare-fun m!923061 () Bool)

(assert (=> b!995706 m!923061))

(declare-fun m!923063 () Bool)

(assert (=> bm!42206 m!923063))

(assert (=> b!995708 m!923059))

(declare-fun m!923065 () Bool)

(assert (=> b!995708 m!923065))

(declare-fun m!923067 () Bool)

(assert (=> b!995708 m!923067))

(assert (=> b!995708 m!923059))

(declare-fun m!923069 () Bool)

(assert (=> b!995708 m!923069))

(assert (=> b!995664 d!118909))

(declare-fun d!118917 () Bool)

(assert (=> d!118917 (= (validKeyInArray!0 (select (arr!30330 a!3219) j!170)) (and (not (= (select (arr!30330 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30330 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995665 d!118917))

(declare-fun bm!42211 () Bool)

(declare-fun call!42214 () Bool)

(declare-fun c!101014 () Bool)

(assert (=> bm!42211 (= call!42214 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101014 (Cons!21002 (select (arr!30330 a!3219) #b00000000000000000000000000000000) Nil!21003) Nil!21003)))))

(declare-fun b!995728 () Bool)

(declare-fun e!561874 () Bool)

(declare-fun e!561871 () Bool)

(assert (=> b!995728 (= e!561874 e!561871)))

(declare-fun res!665983 () Bool)

(assert (=> b!995728 (=> (not res!665983) (not e!561871))))

(declare-fun e!561873 () Bool)

(assert (=> b!995728 (= res!665983 (not e!561873))))

(declare-fun res!665982 () Bool)

(assert (=> b!995728 (=> (not res!665982) (not e!561873))))

(assert (=> b!995728 (= res!665982 (validKeyInArray!0 (select (arr!30330 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995729 () Bool)

(declare-fun contains!5864 (List!21006 (_ BitVec 64)) Bool)

(assert (=> b!995729 (= e!561873 (contains!5864 Nil!21003 (select (arr!30330 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995731 () Bool)

(declare-fun e!561872 () Bool)

(assert (=> b!995731 (= e!561871 e!561872)))

(assert (=> b!995731 (= c!101014 (validKeyInArray!0 (select (arr!30330 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995732 () Bool)

(assert (=> b!995732 (= e!561872 call!42214)))

(declare-fun b!995730 () Bool)

(assert (=> b!995730 (= e!561872 call!42214)))

(declare-fun d!118919 () Bool)

(declare-fun res!665981 () Bool)

(assert (=> d!118919 (=> res!665981 e!561874)))

(assert (=> d!118919 (= res!665981 (bvsge #b00000000000000000000000000000000 (size!30832 a!3219)))))

