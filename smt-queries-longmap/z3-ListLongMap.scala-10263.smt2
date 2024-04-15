; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120626 () Bool)

(assert start!120626)

(declare-fun b!1404376 () Bool)

(declare-fun res!942942 () Bool)

(declare-fun e!795007 () Bool)

(assert (=> b!1404376 (=> (not res!942942) (not e!795007))))

(declare-datatypes ((array!95988 0))(
  ( (array!95989 (arr!46345 (Array (_ BitVec 32) (_ BitVec 64))) (size!46897 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95988)

(declare-datatypes ((List!32942 0))(
  ( (Nil!32939) (Cons!32938 (h!34186 (_ BitVec 64)) (t!47628 List!32942)) )
))
(declare-fun arrayNoDuplicates!0 (array!95988 (_ BitVec 32) List!32942) Bool)

(assert (=> b!1404376 (= res!942942 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32939))))

(declare-fun b!1404377 () Bool)

(declare-fun res!942939 () Bool)

(assert (=> b!1404377 (=> (not res!942939) (not e!795007))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404377 (= res!942939 (validKeyInArray!0 (select (arr!46345 a!2901) j!112)))))

(declare-fun res!942940 () Bool)

(assert (=> start!120626 (=> (not res!942940) (not e!795007))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120626 (= res!942940 (validMask!0 mask!2840))))

(assert (=> start!120626 e!795007))

(assert (=> start!120626 true))

(declare-fun array_inv!35578 (array!95988) Bool)

(assert (=> start!120626 (array_inv!35578 a!2901)))

(declare-fun b!1404378 () Bool)

(declare-fun res!942943 () Bool)

(assert (=> b!1404378 (=> (not res!942943) (not e!795007))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404378 (= res!942943 (and (= (size!46897 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46897 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46897 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404379 () Bool)

(declare-fun res!942938 () Bool)

(assert (=> b!1404379 (=> (not res!942938) (not e!795007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95988 (_ BitVec 32)) Bool)

(assert (=> b!1404379 (= res!942938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404380 () Bool)

(declare-datatypes ((SeekEntryResult!10682 0))(
  ( (MissingZero!10682 (index!45105 (_ BitVec 32))) (Found!10682 (index!45106 (_ BitVec 32))) (Intermediate!10682 (undefined!11494 Bool) (index!45107 (_ BitVec 32)) (x!126714 (_ BitVec 32))) (Undefined!10682) (MissingVacant!10682 (index!45108 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95988 (_ BitVec 32)) SeekEntryResult!10682)

(assert (=> b!1404380 (= e!795007 (not (= (seekEntryOrOpen!0 (select (arr!46345 a!2901) j!112) a!2901 mask!2840) (Found!10682 j!112))))))

(assert (=> b!1404380 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47181 0))(
  ( (Unit!47182) )
))
(declare-fun lt!618470 () Unit!47181)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47181)

(assert (=> b!1404380 (= lt!618470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618469 () SeekEntryResult!10682)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95988 (_ BitVec 32)) SeekEntryResult!10682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404380 (= lt!618469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) (select (arr!46345 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404381 () Bool)

(declare-fun res!942941 () Bool)

(assert (=> b!1404381 (=> (not res!942941) (not e!795007))))

(assert (=> b!1404381 (= res!942941 (validKeyInArray!0 (select (arr!46345 a!2901) i!1037)))))

(assert (= (and start!120626 res!942940) b!1404378))

(assert (= (and b!1404378 res!942943) b!1404381))

(assert (= (and b!1404381 res!942941) b!1404377))

(assert (= (and b!1404377 res!942939) b!1404379))

(assert (= (and b!1404379 res!942938) b!1404376))

(assert (= (and b!1404376 res!942942) b!1404380))

(declare-fun m!1292773 () Bool)

(assert (=> start!120626 m!1292773))

(declare-fun m!1292775 () Bool)

(assert (=> start!120626 m!1292775))

(declare-fun m!1292777 () Bool)

(assert (=> b!1404380 m!1292777))

(declare-fun m!1292779 () Bool)

(assert (=> b!1404380 m!1292779))

(assert (=> b!1404380 m!1292777))

(declare-fun m!1292781 () Bool)

(assert (=> b!1404380 m!1292781))

(assert (=> b!1404380 m!1292777))

(declare-fun m!1292783 () Bool)

(assert (=> b!1404380 m!1292783))

(assert (=> b!1404380 m!1292779))

(assert (=> b!1404380 m!1292777))

(declare-fun m!1292785 () Bool)

(assert (=> b!1404380 m!1292785))

(declare-fun m!1292787 () Bool)

(assert (=> b!1404380 m!1292787))

(declare-fun m!1292789 () Bool)

(assert (=> b!1404376 m!1292789))

(assert (=> b!1404377 m!1292777))

(assert (=> b!1404377 m!1292777))

(declare-fun m!1292791 () Bool)

(assert (=> b!1404377 m!1292791))

(declare-fun m!1292793 () Bool)

(assert (=> b!1404381 m!1292793))

(assert (=> b!1404381 m!1292793))

(declare-fun m!1292795 () Bool)

(assert (=> b!1404381 m!1292795))

(declare-fun m!1292797 () Bool)

(assert (=> b!1404379 m!1292797))

(check-sat (not b!1404377) (not b!1404376) (not start!120626) (not b!1404381) (not b!1404380) (not b!1404379))
(check-sat)
(get-model)

(declare-fun b!1404428 () Bool)

(declare-fun e!795030 () Bool)

(declare-fun contains!9751 (List!32942 (_ BitVec 64)) Bool)

(assert (=> b!1404428 (= e!795030 (contains!9751 Nil!32939 (select (arr!46345 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151123 () Bool)

(declare-fun res!942986 () Bool)

(declare-fun e!795031 () Bool)

(assert (=> d!151123 (=> res!942986 e!795031)))

(assert (=> d!151123 (= res!942986 (bvsge #b00000000000000000000000000000000 (size!46897 a!2901)))))

(assert (=> d!151123 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32939) e!795031)))

(declare-fun b!1404429 () Bool)

(declare-fun e!795029 () Bool)

(assert (=> b!1404429 (= e!795031 e!795029)))

(declare-fun res!942987 () Bool)

(assert (=> b!1404429 (=> (not res!942987) (not e!795029))))

(assert (=> b!1404429 (= res!942987 (not e!795030))))

(declare-fun res!942988 () Bool)

(assert (=> b!1404429 (=> (not res!942988) (not e!795030))))

(assert (=> b!1404429 (= res!942988 (validKeyInArray!0 (select (arr!46345 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404430 () Bool)

(declare-fun e!795032 () Bool)

(declare-fun call!66890 () Bool)

(assert (=> b!1404430 (= e!795032 call!66890)))

(declare-fun b!1404431 () Bool)

(assert (=> b!1404431 (= e!795032 call!66890)))

(declare-fun b!1404432 () Bool)

(assert (=> b!1404432 (= e!795029 e!795032)))

(declare-fun c!130183 () Bool)

(assert (=> b!1404432 (= c!130183 (validKeyInArray!0 (select (arr!46345 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66887 () Bool)

(assert (=> bm!66887 (= call!66890 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130183 (Cons!32938 (select (arr!46345 a!2901) #b00000000000000000000000000000000) Nil!32939) Nil!32939)))))

(assert (= (and d!151123 (not res!942986)) b!1404429))

(assert (= (and b!1404429 res!942988) b!1404428))

(assert (= (and b!1404429 res!942987) b!1404432))

(assert (= (and b!1404432 c!130183) b!1404431))

(assert (= (and b!1404432 (not c!130183)) b!1404430))

(assert (= (or b!1404431 b!1404430) bm!66887))

(declare-fun m!1292851 () Bool)

(assert (=> b!1404428 m!1292851))

(assert (=> b!1404428 m!1292851))

(declare-fun m!1292853 () Bool)

(assert (=> b!1404428 m!1292853))

(assert (=> b!1404429 m!1292851))

(assert (=> b!1404429 m!1292851))

(declare-fun m!1292855 () Bool)

(assert (=> b!1404429 m!1292855))

(assert (=> b!1404432 m!1292851))

(assert (=> b!1404432 m!1292851))

(assert (=> b!1404432 m!1292855))

(assert (=> bm!66887 m!1292851))

(declare-fun m!1292857 () Bool)

(assert (=> bm!66887 m!1292857))

(assert (=> b!1404376 d!151123))

(declare-fun d!151129 () Bool)

(assert (=> d!151129 (= (validKeyInArray!0 (select (arr!46345 a!2901) i!1037)) (and (not (= (select (arr!46345 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46345 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404381 d!151129))

(declare-fun d!151133 () Bool)

(assert (=> d!151133 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120626 d!151133))

(declare-fun d!151139 () Bool)

(assert (=> d!151139 (= (array_inv!35578 a!2901) (bvsge (size!46897 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120626 d!151139))

(declare-fun b!1404505 () Bool)

(declare-fun e!795088 () Bool)

(declare-fun lt!618505 () SeekEntryResult!10682)

(assert (=> b!1404505 (= e!795088 (bvsge (x!126714 lt!618505) #b01111111111111111111111111111110))))

(declare-fun d!151141 () Bool)

(assert (=> d!151141 e!795088))

(declare-fun c!130202 () Bool)

(get-info :version)

(assert (=> d!151141 (= c!130202 (and ((_ is Intermediate!10682) lt!618505) (undefined!11494 lt!618505)))))

(declare-fun e!795089 () SeekEntryResult!10682)

(assert (=> d!151141 (= lt!618505 e!795089)))

(declare-fun c!130203 () Bool)

(assert (=> d!151141 (= c!130203 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!618506 () (_ BitVec 64))

(assert (=> d!151141 (= lt!618506 (select (arr!46345 a!2901) (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840)))))

(assert (=> d!151141 (validMask!0 mask!2840)))

(assert (=> d!151141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) (select (arr!46345 a!2901) j!112) a!2901 mask!2840) lt!618505)))

(declare-fun b!1404506 () Bool)

(declare-fun e!795086 () SeekEntryResult!10682)

(assert (=> b!1404506 (= e!795089 e!795086)))

(declare-fun c!130204 () Bool)

(assert (=> b!1404506 (= c!130204 (or (= lt!618506 (select (arr!46345 a!2901) j!112)) (= (bvadd lt!618506 lt!618506) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1404507 () Bool)

(declare-fun e!795087 () Bool)

(assert (=> b!1404507 (= e!795088 e!795087)))

(declare-fun res!943026 () Bool)

(assert (=> b!1404507 (= res!943026 (and ((_ is Intermediate!10682) lt!618505) (not (undefined!11494 lt!618505)) (bvslt (x!126714 lt!618505) #b01111111111111111111111111111110) (bvsge (x!126714 lt!618505) #b00000000000000000000000000000000) (bvsge (x!126714 lt!618505) #b00000000000000000000000000000000)))))

(assert (=> b!1404507 (=> (not res!943026) (not e!795087))))

(declare-fun b!1404508 () Bool)

(assert (=> b!1404508 (= e!795086 (Intermediate!10682 false (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404509 () Bool)

(assert (=> b!1404509 (and (bvsge (index!45107 lt!618505) #b00000000000000000000000000000000) (bvslt (index!45107 lt!618505) (size!46897 a!2901)))))

(declare-fun res!943025 () Bool)

(assert (=> b!1404509 (= res!943025 (= (select (arr!46345 a!2901) (index!45107 lt!618505)) (select (arr!46345 a!2901) j!112)))))

(declare-fun e!795085 () Bool)

(assert (=> b!1404509 (=> res!943025 e!795085)))

(assert (=> b!1404509 (= e!795087 e!795085)))

(declare-fun b!1404510 () Bool)

(assert (=> b!1404510 (and (bvsge (index!45107 lt!618505) #b00000000000000000000000000000000) (bvslt (index!45107 lt!618505) (size!46897 a!2901)))))

(assert (=> b!1404510 (= e!795085 (= (select (arr!46345 a!2901) (index!45107 lt!618505)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404511 () Bool)

(assert (=> b!1404511 (and (bvsge (index!45107 lt!618505) #b00000000000000000000000000000000) (bvslt (index!45107 lt!618505) (size!46897 a!2901)))))

(declare-fun res!943027 () Bool)

(assert (=> b!1404511 (= res!943027 (= (select (arr!46345 a!2901) (index!45107 lt!618505)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404511 (=> res!943027 e!795085)))

(declare-fun b!1404512 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404512 (= e!795086 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46345 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404513 () Bool)

(assert (=> b!1404513 (= e!795089 (Intermediate!10682 true (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!151141 c!130203) b!1404513))

(assert (= (and d!151141 (not c!130203)) b!1404506))

(assert (= (and b!1404506 c!130204) b!1404508))

(assert (= (and b!1404506 (not c!130204)) b!1404512))

(assert (= (and d!151141 c!130202) b!1404505))

(assert (= (and d!151141 (not c!130202)) b!1404507))

(assert (= (and b!1404507 res!943026) b!1404509))

(assert (= (and b!1404509 (not res!943025)) b!1404511))

(assert (= (and b!1404511 (not res!943027)) b!1404510))

(assert (=> d!151141 m!1292779))

(declare-fun m!1292891 () Bool)

(assert (=> d!151141 m!1292891))

(assert (=> d!151141 m!1292773))

(assert (=> b!1404512 m!1292779))

(declare-fun m!1292893 () Bool)

(assert (=> b!1404512 m!1292893))

(assert (=> b!1404512 m!1292893))

(assert (=> b!1404512 m!1292777))

(declare-fun m!1292895 () Bool)

(assert (=> b!1404512 m!1292895))

(declare-fun m!1292897 () Bool)

(assert (=> b!1404509 m!1292897))

(assert (=> b!1404510 m!1292897))

(assert (=> b!1404511 m!1292897))

(assert (=> b!1404380 d!151141))

(declare-fun b!1404580 () Bool)

(declare-fun e!795127 () SeekEntryResult!10682)

(declare-fun e!795128 () SeekEntryResult!10682)

(assert (=> b!1404580 (= e!795127 e!795128)))

(declare-fun lt!618527 () (_ BitVec 64))

(declare-fun lt!618526 () SeekEntryResult!10682)

(assert (=> b!1404580 (= lt!618527 (select (arr!46345 a!2901) (index!45107 lt!618526)))))

(declare-fun c!130230 () Bool)

(assert (=> b!1404580 (= c!130230 (= lt!618527 (select (arr!46345 a!2901) j!112)))))

(declare-fun b!1404581 () Bool)

(declare-fun e!795126 () SeekEntryResult!10682)

(assert (=> b!1404581 (= e!795126 (MissingZero!10682 (index!45107 lt!618526)))))

(declare-fun b!1404582 () Bool)

(declare-fun c!130229 () Bool)

(assert (=> b!1404582 (= c!130229 (= lt!618527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404582 (= e!795128 e!795126)))

(declare-fun b!1404583 () Bool)

(assert (=> b!1404583 (= e!795127 Undefined!10682)))

(declare-fun d!151157 () Bool)

(declare-fun lt!618525 () SeekEntryResult!10682)

(assert (=> d!151157 (and (or ((_ is Undefined!10682) lt!618525) (not ((_ is Found!10682) lt!618525)) (and (bvsge (index!45106 lt!618525) #b00000000000000000000000000000000) (bvslt (index!45106 lt!618525) (size!46897 a!2901)))) (or ((_ is Undefined!10682) lt!618525) ((_ is Found!10682) lt!618525) (not ((_ is MissingZero!10682) lt!618525)) (and (bvsge (index!45105 lt!618525) #b00000000000000000000000000000000) (bvslt (index!45105 lt!618525) (size!46897 a!2901)))) (or ((_ is Undefined!10682) lt!618525) ((_ is Found!10682) lt!618525) ((_ is MissingZero!10682) lt!618525) (not ((_ is MissingVacant!10682) lt!618525)) (and (bvsge (index!45108 lt!618525) #b00000000000000000000000000000000) (bvslt (index!45108 lt!618525) (size!46897 a!2901)))) (or ((_ is Undefined!10682) lt!618525) (ite ((_ is Found!10682) lt!618525) (= (select (arr!46345 a!2901) (index!45106 lt!618525)) (select (arr!46345 a!2901) j!112)) (ite ((_ is MissingZero!10682) lt!618525) (= (select (arr!46345 a!2901) (index!45105 lt!618525)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10682) lt!618525) (= (select (arr!46345 a!2901) (index!45108 lt!618525)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151157 (= lt!618525 e!795127)))

(declare-fun c!130231 () Bool)

(assert (=> d!151157 (= c!130231 (and ((_ is Intermediate!10682) lt!618526) (undefined!11494 lt!618526)))))

(assert (=> d!151157 (= lt!618526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) (select (arr!46345 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151157 (validMask!0 mask!2840)))

(assert (=> d!151157 (= (seekEntryOrOpen!0 (select (arr!46345 a!2901) j!112) a!2901 mask!2840) lt!618525)))

(declare-fun b!1404584 () Bool)

(assert (=> b!1404584 (= e!795128 (Found!10682 (index!45107 lt!618526)))))

(declare-fun b!1404585 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95988 (_ BitVec 32)) SeekEntryResult!10682)

(assert (=> b!1404585 (= e!795126 (seekKeyOrZeroReturnVacant!0 (x!126714 lt!618526) (index!45107 lt!618526) (index!45107 lt!618526) (select (arr!46345 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151157 c!130231) b!1404583))

(assert (= (and d!151157 (not c!130231)) b!1404580))

(assert (= (and b!1404580 c!130230) b!1404584))

(assert (= (and b!1404580 (not c!130230)) b!1404582))

(assert (= (and b!1404582 c!130229) b!1404581))

(assert (= (and b!1404582 (not c!130229)) b!1404585))

(declare-fun m!1292915 () Bool)

(assert (=> b!1404580 m!1292915))

(assert (=> d!151157 m!1292773))

(declare-fun m!1292917 () Bool)

(assert (=> d!151157 m!1292917))

(assert (=> d!151157 m!1292777))

(assert (=> d!151157 m!1292779))

(assert (=> d!151157 m!1292779))

(assert (=> d!151157 m!1292777))

(assert (=> d!151157 m!1292785))

(declare-fun m!1292919 () Bool)

(assert (=> d!151157 m!1292919))

(declare-fun m!1292921 () Bool)

(assert (=> d!151157 m!1292921))

(assert (=> b!1404585 m!1292777))

(declare-fun m!1292923 () Bool)

(assert (=> b!1404585 m!1292923))

(assert (=> b!1404380 d!151157))

(declare-fun d!151163 () Bool)

(assert (=> d!151163 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618530 () Unit!47181)

(declare-fun choose!38 (array!95988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47181)

(assert (=> d!151163 (= lt!618530 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151163 (validMask!0 mask!2840)))

(assert (=> d!151163 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618530)))

(declare-fun bs!40894 () Bool)

(assert (= bs!40894 d!151163))

(assert (=> bs!40894 m!1292787))

(declare-fun m!1292925 () Bool)

(assert (=> bs!40894 m!1292925))

(assert (=> bs!40894 m!1292773))

(assert (=> b!1404380 d!151163))

(declare-fun d!151165 () Bool)

(declare-fun lt!618536 () (_ BitVec 32))

(declare-fun lt!618535 () (_ BitVec 32))

(assert (=> d!151165 (= lt!618536 (bvmul (bvxor lt!618535 (bvlshr lt!618535 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151165 (= lt!618535 ((_ extract 31 0) (bvand (bvxor (select (arr!46345 a!2901) j!112) (bvlshr (select (arr!46345 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151165 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943046 (let ((h!34189 ((_ extract 31 0) (bvand (bvxor (select (arr!46345 a!2901) j!112) (bvlshr (select (arr!46345 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126720 (bvmul (bvxor h!34189 (bvlshr h!34189 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126720 (bvlshr x!126720 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943046 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943046 #b00000000000000000000000000000000))))))

(assert (=> d!151165 (= (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840) (bvand (bvxor lt!618536 (bvlshr lt!618536 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404380 d!151165))

(declare-fun b!1404630 () Bool)

(declare-fun e!795155 () Bool)

(declare-fun call!66905 () Bool)

(assert (=> b!1404630 (= e!795155 call!66905)))

(declare-fun d!151167 () Bool)

(declare-fun res!943052 () Bool)

(declare-fun e!795153 () Bool)

(assert (=> d!151167 (=> res!943052 e!795153)))

(assert (=> d!151167 (= res!943052 (bvsge j!112 (size!46897 a!2901)))))

(assert (=> d!151167 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795153)))

(declare-fun bm!66902 () Bool)

(assert (=> bm!66902 (= call!66905 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404631 () Bool)

(declare-fun e!795154 () Bool)

(assert (=> b!1404631 (= e!795154 e!795155)))

(declare-fun lt!618563 () (_ BitVec 64))

(assert (=> b!1404631 (= lt!618563 (select (arr!46345 a!2901) j!112))))

(declare-fun lt!618562 () Unit!47181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95988 (_ BitVec 64) (_ BitVec 32)) Unit!47181)

(assert (=> b!1404631 (= lt!618562 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618563 j!112))))

(declare-fun arrayContainsKey!0 (array!95988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404631 (arrayContainsKey!0 a!2901 lt!618563 #b00000000000000000000000000000000)))

(declare-fun lt!618561 () Unit!47181)

(assert (=> b!1404631 (= lt!618561 lt!618562)))

(declare-fun res!943051 () Bool)

(assert (=> b!1404631 (= res!943051 (= (seekEntryOrOpen!0 (select (arr!46345 a!2901) j!112) a!2901 mask!2840) (Found!10682 j!112)))))

(assert (=> b!1404631 (=> (not res!943051) (not e!795155))))

(declare-fun b!1404632 () Bool)

(assert (=> b!1404632 (= e!795154 call!66905)))

(declare-fun b!1404633 () Bool)

(assert (=> b!1404633 (= e!795153 e!795154)))

(declare-fun c!130252 () Bool)

(assert (=> b!1404633 (= c!130252 (validKeyInArray!0 (select (arr!46345 a!2901) j!112)))))

(assert (= (and d!151167 (not res!943052)) b!1404633))

(assert (= (and b!1404633 c!130252) b!1404631))

(assert (= (and b!1404633 (not c!130252)) b!1404632))

(assert (= (and b!1404631 res!943051) b!1404630))

(assert (= (or b!1404630 b!1404632) bm!66902))

(declare-fun m!1292947 () Bool)

(assert (=> bm!66902 m!1292947))

(assert (=> b!1404631 m!1292777))

(declare-fun m!1292949 () Bool)

(assert (=> b!1404631 m!1292949))

(declare-fun m!1292951 () Bool)

(assert (=> b!1404631 m!1292951))

(assert (=> b!1404631 m!1292777))

(assert (=> b!1404631 m!1292783))

(assert (=> b!1404633 m!1292777))

(assert (=> b!1404633 m!1292777))

(assert (=> b!1404633 m!1292791))

(assert (=> b!1404380 d!151167))

(declare-fun b!1404634 () Bool)

(declare-fun e!795158 () Bool)

(declare-fun call!66906 () Bool)

(assert (=> b!1404634 (= e!795158 call!66906)))

(declare-fun d!151173 () Bool)

(declare-fun res!943054 () Bool)

(declare-fun e!795156 () Bool)

(assert (=> d!151173 (=> res!943054 e!795156)))

(assert (=> d!151173 (= res!943054 (bvsge #b00000000000000000000000000000000 (size!46897 a!2901)))))

(assert (=> d!151173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795156)))

(declare-fun bm!66903 () Bool)

(assert (=> bm!66903 (= call!66906 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404635 () Bool)

(declare-fun e!795157 () Bool)

(assert (=> b!1404635 (= e!795157 e!795158)))

(declare-fun lt!618566 () (_ BitVec 64))

(assert (=> b!1404635 (= lt!618566 (select (arr!46345 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618565 () Unit!47181)

(assert (=> b!1404635 (= lt!618565 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618566 #b00000000000000000000000000000000))))

(assert (=> b!1404635 (arrayContainsKey!0 a!2901 lt!618566 #b00000000000000000000000000000000)))

(declare-fun lt!618564 () Unit!47181)

(assert (=> b!1404635 (= lt!618564 lt!618565)))

(declare-fun res!943053 () Bool)

(assert (=> b!1404635 (= res!943053 (= (seekEntryOrOpen!0 (select (arr!46345 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10682 #b00000000000000000000000000000000)))))

(assert (=> b!1404635 (=> (not res!943053) (not e!795158))))

(declare-fun b!1404636 () Bool)

(assert (=> b!1404636 (= e!795157 call!66906)))

(declare-fun b!1404637 () Bool)

(assert (=> b!1404637 (= e!795156 e!795157)))

(declare-fun c!130253 () Bool)

(assert (=> b!1404637 (= c!130253 (validKeyInArray!0 (select (arr!46345 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151173 (not res!943054)) b!1404637))

(assert (= (and b!1404637 c!130253) b!1404635))

(assert (= (and b!1404637 (not c!130253)) b!1404636))

(assert (= (and b!1404635 res!943053) b!1404634))

(assert (= (or b!1404634 b!1404636) bm!66903))

(declare-fun m!1292953 () Bool)

(assert (=> bm!66903 m!1292953))

(assert (=> b!1404635 m!1292851))

(declare-fun m!1292955 () Bool)

(assert (=> b!1404635 m!1292955))

(declare-fun m!1292957 () Bool)

(assert (=> b!1404635 m!1292957))

(assert (=> b!1404635 m!1292851))

(declare-fun m!1292959 () Bool)

(assert (=> b!1404635 m!1292959))

(assert (=> b!1404637 m!1292851))

(assert (=> b!1404637 m!1292851))

(assert (=> b!1404637 m!1292855))

(assert (=> b!1404379 d!151173))

(declare-fun d!151175 () Bool)

(assert (=> d!151175 (= (validKeyInArray!0 (select (arr!46345 a!2901) j!112)) (and (not (= (select (arr!46345 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46345 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404377 d!151175))

(check-sat (not b!1404428) (not b!1404432) (not b!1404512) (not bm!66903) (not d!151157) (not d!151141) (not b!1404429) (not b!1404637) (not b!1404633) (not b!1404635) (not bm!66902) (not b!1404585) (not d!151163) (not b!1404631) (not bm!66887))
(check-sat)
