; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63886 () Bool)

(assert start!63886)

(declare-fun b!717995 () Bool)

(declare-fun res!480572 () Bool)

(declare-fun e!403112 () Bool)

(assert (=> b!717995 (=> (not res!480572) (not e!403112))))

(declare-datatypes ((array!40665 0))(
  ( (array!40666 (arr!19461 (Array (_ BitVec 32) (_ BitVec 64))) (size!19882 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40665)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717995 (= res!480572 (validKeyInArray!0 (select (arr!19461 a!3186) j!159)))))

(declare-fun b!717996 () Bool)

(declare-fun res!480571 () Bool)

(assert (=> b!717996 (=> (not res!480571) (not e!403112))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717996 (= res!480571 (and (= (size!19882 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19882 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19882 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717997 () Bool)

(declare-fun res!480569 () Bool)

(assert (=> b!717997 (=> (not res!480569) (not e!403112))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717997 (= res!480569 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!403111 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!717998 () Bool)

(assert (=> b!717998 (= e!403111 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19882 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19882 a!3186)) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(declare-fun b!717999 () Bool)

(assert (=> b!717999 (= e!403112 e!403111)))

(declare-fun res!480570 () Bool)

(assert (=> b!717999 (=> (not res!480570) (not e!403111))))

(declare-datatypes ((SeekEntryResult!7061 0))(
  ( (MissingZero!7061 (index!30612 (_ BitVec 32))) (Found!7061 (index!30613 (_ BitVec 32))) (Intermediate!7061 (undefined!7873 Bool) (index!30614 (_ BitVec 32)) (x!61633 (_ BitVec 32))) (Undefined!7061) (MissingVacant!7061 (index!30615 (_ BitVec 32))) )
))
(declare-fun lt!319250 () SeekEntryResult!7061)

(assert (=> b!717999 (= res!480570 (or (= lt!319250 (MissingZero!7061 i!1173)) (= lt!319250 (MissingVacant!7061 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40665 (_ BitVec 32)) SeekEntryResult!7061)

(assert (=> b!717999 (= lt!319250 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!480566 () Bool)

(assert (=> start!63886 (=> (not res!480566) (not e!403112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63886 (= res!480566 (validMask!0 mask!3328))))

(assert (=> start!63886 e!403112))

(assert (=> start!63886 true))

(declare-fun array_inv!15257 (array!40665) Bool)

(assert (=> start!63886 (array_inv!15257 a!3186)))

(declare-fun b!718000 () Bool)

(declare-fun res!480565 () Bool)

(assert (=> b!718000 (=> (not res!480565) (not e!403111))))

(declare-datatypes ((List!13463 0))(
  ( (Nil!13460) (Cons!13459 (h!14504 (_ BitVec 64)) (t!19778 List!13463)) )
))
(declare-fun arrayNoDuplicates!0 (array!40665 (_ BitVec 32) List!13463) Bool)

(assert (=> b!718000 (= res!480565 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13460))))

(declare-fun b!718001 () Bool)

(declare-fun res!480567 () Bool)

(assert (=> b!718001 (=> (not res!480567) (not e!403111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40665 (_ BitVec 32)) Bool)

(assert (=> b!718001 (= res!480567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718002 () Bool)

(declare-fun res!480568 () Bool)

(assert (=> b!718002 (=> (not res!480568) (not e!403112))))

(assert (=> b!718002 (= res!480568 (validKeyInArray!0 k!2102))))

(assert (= (and start!63886 res!480566) b!717996))

(assert (= (and b!717996 res!480571) b!717995))

(assert (= (and b!717995 res!480572) b!718002))

(assert (= (and b!718002 res!480568) b!717997))

(assert (= (and b!717997 res!480569) b!717999))

(assert (= (and b!717999 res!480570) b!718001))

(assert (= (and b!718001 res!480567) b!718000))

(assert (= (and b!718000 res!480565) b!717998))

(declare-fun m!673771 () Bool)

(assert (=> b!717995 m!673771))

(assert (=> b!717995 m!673771))

(declare-fun m!673773 () Bool)

(assert (=> b!717995 m!673773))

(declare-fun m!673775 () Bool)

(assert (=> b!717999 m!673775))

(declare-fun m!673777 () Bool)

(assert (=> b!718002 m!673777))

(declare-fun m!673779 () Bool)

(assert (=> b!718001 m!673779))

(declare-fun m!673781 () Bool)

(assert (=> start!63886 m!673781))

(declare-fun m!673783 () Bool)

(assert (=> start!63886 m!673783))

(declare-fun m!673785 () Bool)

(assert (=> b!717997 m!673785))

(declare-fun m!673787 () Bool)

(assert (=> b!718000 m!673787))

(push 1)

(assert (not b!717999))

(assert (not b!718002))

(assert (not start!63886))

(assert (not b!718000))

(assert (not b!717997))

(assert (not b!718001))

(assert (not b!717995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!718067 () Bool)

(declare-fun e!403146 () Bool)

(declare-fun e!403148 () Bool)

(assert (=> b!718067 (= e!403146 e!403148)))

(declare-fun res!480634 () Bool)

(assert (=> b!718067 (=> (not res!480634) (not e!403148))))

(declare-fun e!403145 () Bool)

(assert (=> b!718067 (= res!480634 (not e!403145))))

(declare-fun res!480633 () Bool)

(assert (=> b!718067 (=> (not res!480633) (not e!403145))))

(assert (=> b!718067 (= res!480633 (validKeyInArray!0 (select (arr!19461 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718068 () Bool)

(declare-fun e!403147 () Bool)

(declare-fun call!34716 () Bool)

(assert (=> b!718068 (= e!403147 call!34716)))

(declare-fun b!718069 () Bool)

(assert (=> b!718069 (= e!403147 call!34716)))

(declare-fun d!98961 () Bool)

(declare-fun res!480635 () Bool)

(assert (=> d!98961 (=> res!480635 e!403146)))

(assert (=> d!98961 (= res!480635 (bvsge #b00000000000000000000000000000000 (size!19882 a!3186)))))

(assert (=> d!98961 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13460) e!403146)))

(declare-fun b!718070 () Bool)

(declare-fun contains!4036 (List!13463 (_ BitVec 64)) Bool)

(assert (=> b!718070 (= e!403145 (contains!4036 Nil!13460 (select (arr!19461 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34713 () Bool)

(declare-fun c!79084 () Bool)

(assert (=> bm!34713 (= call!34716 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79084 (Cons!13459 (select (arr!19461 a!3186) #b00000000000000000000000000000000) Nil!13460) Nil!13460)))))

(declare-fun b!718071 () Bool)

(assert (=> b!718071 (= e!403148 e!403147)))

(assert (=> b!718071 (= c!79084 (validKeyInArray!0 (select (arr!19461 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98961 (not res!480635)) b!718067))

(assert (= (and b!718067 res!480633) b!718070))

(assert (= (and b!718067 res!480634) b!718071))

(assert (= (and b!718071 c!79084) b!718068))

(assert (= (and b!718071 (not c!79084)) b!718069))

(assert (= (or b!718068 b!718069) bm!34713))

(declare-fun m!673829 () Bool)

(assert (=> b!718067 m!673829))

(assert (=> b!718067 m!673829))

(declare-fun m!673831 () Bool)

(assert (=> b!718067 m!673831))

(assert (=> b!718070 m!673829))

(assert (=> b!718070 m!673829))

(declare-fun m!673833 () Bool)

(assert (=> b!718070 m!673833))

(assert (=> bm!34713 m!673829))

(declare-fun m!673835 () Bool)

(assert (=> bm!34713 m!673835))

(assert (=> b!718071 m!673829))

(assert (=> b!718071 m!673829))

(assert (=> b!718071 m!673831))

(assert (=> b!718000 d!98961))

(declare-fun d!98973 () Bool)

(assert (=> d!98973 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63886 d!98973))

(declare-fun d!98979 () Bool)

(assert (=> d!98979 (= (array_inv!15257 a!3186) (bvsge (size!19882 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63886 d!98979))

(declare-fun d!98981 () Bool)

(assert (=> d!98981 (= (validKeyInArray!0 (select (arr!19461 a!3186) j!159)) (and (not (= (select (arr!19461 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19461 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717995 d!98981))

(declare-fun d!98983 () Bool)

(declare-fun res!480658 () Bool)

(declare-fun e!403188 () Bool)

(assert (=> d!98983 (=> res!480658 e!403188)))

(assert (=> d!98983 (= res!480658 (bvsge #b00000000000000000000000000000000 (size!19882 a!3186)))))

(assert (=> d!98983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403188)))

(declare-fun b!718126 () Bool)

(declare-fun e!403187 () Bool)

(declare-fun call!34724 () Bool)

(assert (=> b!718126 (= e!403187 call!34724)))

(declare-fun bm!34721 () Bool)

(assert (=> bm!34721 (= call!34724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!718127 () Bool)

(declare-fun e!403189 () Bool)

(assert (=> b!718127 (= e!403188 e!403189)))

(declare-fun c!79101 () Bool)

(assert (=> b!718127 (= c!79101 (validKeyInArray!0 (select (arr!19461 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718128 () Bool)

(assert (=> b!718128 (= e!403189 call!34724)))

(declare-fun b!718129 () Bool)

(assert (=> b!718129 (= e!403189 e!403187)))

(declare-fun lt!319281 () (_ BitVec 64))

(assert (=> b!718129 (= lt!319281 (select (arr!19461 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24664 0))(
  ( (Unit!24665) )
))
(declare-fun lt!319283 () Unit!24664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40665 (_ BitVec 64) (_ BitVec 32)) Unit!24664)

(assert (=> b!718129 (= lt!319283 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319281 #b00000000000000000000000000000000))))

(assert (=> b!718129 (arrayContainsKey!0 a!3186 lt!319281 #b00000000000000000000000000000000)))

(declare-fun lt!319282 () Unit!24664)

(assert (=> b!718129 (= lt!319282 lt!319283)))

(declare-fun res!480659 () Bool)

(assert (=> b!718129 (= res!480659 (= (seekEntryOrOpen!0 (select (arr!19461 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7061 #b00000000000000000000000000000000)))))

(assert (=> b!718129 (=> (not res!480659) (not e!403187))))

(assert (= (and d!98983 (not res!480658)) b!718127))

(assert (= (and b!718127 c!79101) b!718129))

(assert (= (and b!718127 (not c!79101)) b!718128))

(assert (= (and b!718129 res!480659) b!718126))

(assert (= (or b!718126 b!718128) bm!34721))

(declare-fun m!673865 () Bool)

(assert (=> bm!34721 m!673865))

(assert (=> b!718127 m!673829))

(assert (=> b!718127 m!673829))

(assert (=> b!718127 m!673831))

(assert (=> b!718129 m!673829))

(declare-fun m!673867 () Bool)

(assert (=> b!718129 m!673867))

(declare-fun m!673869 () Bool)

(assert (=> b!718129 m!673869))

(assert (=> b!718129 m!673829))

(declare-fun m!673871 () Bool)

(assert (=> b!718129 m!673871))

(assert (=> b!718001 d!98983))

(declare-fun d!98993 () Bool)

(assert (=> d!98993 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718002 d!98993))

(declare-fun d!98995 () Bool)

(declare-fun res!480673 () Bool)

(declare-fun e!403206 () Bool)

(assert (=> d!98995 (=> res!480673 e!403206)))

(assert (=> d!98995 (= res!480673 (= (select (arr!19461 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98995 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!403206)))

(declare-fun b!718149 () Bool)

(declare-fun e!403207 () Bool)

(assert (=> b!718149 (= e!403206 e!403207)))

(declare-fun res!480674 () Bool)

(assert (=> b!718149 (=> (not res!480674) (not e!403207))))

(assert (=> b!718149 (= res!480674 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19882 a!3186)))))

(declare-fun b!718150 () Bool)

(assert (=> b!718150 (= e!403207 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98995 (not res!480673)) b!718149))

(assert (= (and b!718149 res!480674) b!718150))

(assert (=> d!98995 m!673829))

(declare-fun m!673879 () Bool)

(assert (=> b!718150 m!673879))

(assert (=> b!717997 d!98995))

