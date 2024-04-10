; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66662 () Bool)

(assert start!66662)

(declare-fun b!768175 () Bool)

(declare-fun res!519602 () Bool)

(declare-fun e!427769 () Bool)

(assert (=> b!768175 (=> (not res!519602) (not e!427769))))

(declare-datatypes ((array!42303 0))(
  ( (array!42304 (arr!20253 (Array (_ BitVec 32) (_ BitVec 64))) (size!20674 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42303)

(declare-datatypes ((List!14255 0))(
  ( (Nil!14252) (Cons!14251 (h!15347 (_ BitVec 64)) (t!20570 List!14255)) )
))
(declare-fun arrayNoDuplicates!0 (array!42303 (_ BitVec 32) List!14255) Bool)

(assert (=> b!768175 (= res!519602 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14252))))

(declare-fun b!768176 () Bool)

(declare-fun res!519607 () Bool)

(declare-fun e!427773 () Bool)

(assert (=> b!768176 (=> (not res!519607) (not e!427773))))

(declare-fun e!427772 () Bool)

(assert (=> b!768176 (= res!519607 e!427772)))

(declare-fun c!84682 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768176 (= c!84682 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768177 () Bool)

(declare-fun res!519600 () Bool)

(assert (=> b!768177 (=> (not res!519600) (not e!427769))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42303 (_ BitVec 32)) Bool)

(assert (=> b!768177 (= res!519600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768178 () Bool)

(declare-fun e!427766 () Bool)

(assert (=> b!768178 (= e!427773 e!427766)))

(declare-fun res!519599 () Bool)

(assert (=> b!768178 (=> (not res!519599) (not e!427766))))

(declare-datatypes ((SeekEntryResult!7853 0))(
  ( (MissingZero!7853 (index!33780 (_ BitVec 32))) (Found!7853 (index!33781 (_ BitVec 32))) (Intermediate!7853 (undefined!8665 Bool) (index!33782 (_ BitVec 32)) (x!64707 (_ BitVec 32))) (Undefined!7853) (MissingVacant!7853 (index!33783 (_ BitVec 32))) )
))
(declare-fun lt!341739 () SeekEntryResult!7853)

(declare-fun lt!341733 () SeekEntryResult!7853)

(assert (=> b!768178 (= res!519599 (= lt!341739 lt!341733))))

(declare-fun lt!341741 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341740 () array!42303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42303 (_ BitVec 32)) SeekEntryResult!7853)

(assert (=> b!768178 (= lt!341733 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341741 lt!341740 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768178 (= lt!341739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341741 mask!3328) lt!341741 lt!341740 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!768178 (= lt!341741 (select (store (arr!20253 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!768178 (= lt!341740 (array!42304 (store (arr!20253 a!3186) i!1173 k!2102) (size!20674 a!3186)))))

(declare-fun b!768179 () Bool)

(declare-fun e!427767 () Bool)

(declare-fun e!427771 () Bool)

(assert (=> b!768179 (= e!427767 e!427771)))

(declare-fun res!519596 () Bool)

(assert (=> b!768179 (=> res!519596 e!427771)))

(assert (=> b!768179 (= res!519596 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341736 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768179 (= lt!341736 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768180 () Bool)

(declare-fun res!519597 () Bool)

(assert (=> b!768180 (=> (not res!519597) (not e!427769))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!768180 (= res!519597 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20674 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20674 a!3186))))))

(declare-fun b!768181 () Bool)

(declare-fun res!519609 () Bool)

(declare-fun e!427764 () Bool)

(assert (=> b!768181 (=> (not res!519609) (not e!427764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768181 (= res!519609 (validKeyInArray!0 (select (arr!20253 a!3186) j!159)))))

(declare-fun b!768182 () Bool)

(declare-fun e!427765 () Bool)

(declare-fun e!427768 () Bool)

(assert (=> b!768182 (= e!427765 e!427768)))

(declare-fun res!519611 () Bool)

(assert (=> b!768182 (=> (not res!519611) (not e!427768))))

(declare-fun lt!341735 () SeekEntryResult!7853)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42303 (_ BitVec 32)) SeekEntryResult!7853)

(assert (=> b!768182 (= res!519611 (= (seekEntryOrOpen!0 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341735))))

(assert (=> b!768182 (= lt!341735 (Found!7853 j!159))))

(declare-fun b!768183 () Bool)

(declare-fun res!519608 () Bool)

(assert (=> b!768183 (=> res!519608 e!427771)))

(declare-fun lt!341738 () SeekEntryResult!7853)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42303 (_ BitVec 32)) SeekEntryResult!7853)

(assert (=> b!768183 (= res!519608 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341738))))

(declare-fun b!768185 () Bool)

(declare-fun res!519603 () Bool)

(assert (=> b!768185 (=> (not res!519603) (not e!427764))))

(assert (=> b!768185 (= res!519603 (validKeyInArray!0 k!2102))))

(declare-fun b!768186 () Bool)

(assert (=> b!768186 (= e!427764 e!427769)))

(declare-fun res!519612 () Bool)

(assert (=> b!768186 (=> (not res!519612) (not e!427769))))

(declare-fun lt!341734 () SeekEntryResult!7853)

(assert (=> b!768186 (= res!519612 (or (= lt!341734 (MissingZero!7853 i!1173)) (= lt!341734 (MissingVacant!7853 i!1173))))))

(assert (=> b!768186 (= lt!341734 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!768187 () Bool)

(declare-fun res!519604 () Bool)

(assert (=> b!768187 (=> (not res!519604) (not e!427773))))

(assert (=> b!768187 (= res!519604 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20253 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768188 () Bool)

(declare-fun lt!341737 () SeekEntryResult!7853)

(assert (=> b!768188 (= e!427772 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341737))))

(declare-fun b!768189 () Bool)

(assert (=> b!768189 (= e!427771 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341736 resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341738))))

(declare-fun b!768190 () Bool)

(assert (=> b!768190 (= e!427768 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341735))))

(declare-fun b!768191 () Bool)

(declare-fun res!519605 () Bool)

(assert (=> b!768191 (=> (not res!519605) (not e!427764))))

(assert (=> b!768191 (= res!519605 (and (= (size!20674 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20674 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20674 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768192 () Bool)

(declare-fun res!519598 () Bool)

(assert (=> b!768192 (=> (not res!519598) (not e!427764))))

(declare-fun arrayContainsKey!0 (array!42303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768192 (= res!519598 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768193 () Bool)

(assert (=> b!768193 (= e!427766 (not e!427767))))

(declare-fun res!519613 () Bool)

(assert (=> b!768193 (=> res!519613 e!427767)))

(assert (=> b!768193 (= res!519613 (or (not (is-Intermediate!7853 lt!341733)) (bvsge x!1131 (x!64707 lt!341733))))))

(assert (=> b!768193 (= lt!341738 (Found!7853 j!159))))

(assert (=> b!768193 e!427765))

(declare-fun res!519610 () Bool)

(assert (=> b!768193 (=> (not res!519610) (not e!427765))))

(assert (=> b!768193 (= res!519610 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26432 0))(
  ( (Unit!26433) )
))
(declare-fun lt!341732 () Unit!26432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26432)

(assert (=> b!768193 (= lt!341732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768194 () Bool)

(assert (=> b!768194 (= e!427769 e!427773)))

(declare-fun res!519606 () Bool)

(assert (=> b!768194 (=> (not res!519606) (not e!427773))))

(assert (=> b!768194 (= res!519606 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328) (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341737))))

(assert (=> b!768194 (= lt!341737 (Intermediate!7853 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!519601 () Bool)

(assert (=> start!66662 (=> (not res!519601) (not e!427764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66662 (= res!519601 (validMask!0 mask!3328))))

(assert (=> start!66662 e!427764))

(assert (=> start!66662 true))

(declare-fun array_inv!16049 (array!42303) Bool)

(assert (=> start!66662 (array_inv!16049 a!3186)))

(declare-fun b!768184 () Bool)

(assert (=> b!768184 (= e!427772 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) (Found!7853 j!159)))))

(assert (= (and start!66662 res!519601) b!768191))

(assert (= (and b!768191 res!519605) b!768181))

(assert (= (and b!768181 res!519609) b!768185))

(assert (= (and b!768185 res!519603) b!768192))

(assert (= (and b!768192 res!519598) b!768186))

(assert (= (and b!768186 res!519612) b!768177))

(assert (= (and b!768177 res!519600) b!768175))

(assert (= (and b!768175 res!519602) b!768180))

(assert (= (and b!768180 res!519597) b!768194))

(assert (= (and b!768194 res!519606) b!768187))

(assert (= (and b!768187 res!519604) b!768176))

(assert (= (and b!768176 c!84682) b!768188))

(assert (= (and b!768176 (not c!84682)) b!768184))

(assert (= (and b!768176 res!519607) b!768178))

(assert (= (and b!768178 res!519599) b!768193))

(assert (= (and b!768193 res!519610) b!768182))

(assert (= (and b!768182 res!519611) b!768190))

(assert (= (and b!768193 (not res!519613)) b!768179))

(assert (= (and b!768179 (not res!519596)) b!768183))

(assert (= (and b!768183 (not res!519608)) b!768189))

(declare-fun m!713775 () Bool)

(assert (=> b!768181 m!713775))

(assert (=> b!768181 m!713775))

(declare-fun m!713777 () Bool)

(assert (=> b!768181 m!713777))

(declare-fun m!713779 () Bool)

(assert (=> b!768179 m!713779))

(assert (=> b!768183 m!713775))

(assert (=> b!768183 m!713775))

(declare-fun m!713781 () Bool)

(assert (=> b!768183 m!713781))

(declare-fun m!713783 () Bool)

(assert (=> b!768175 m!713783))

(assert (=> b!768182 m!713775))

(assert (=> b!768182 m!713775))

(declare-fun m!713785 () Bool)

(assert (=> b!768182 m!713785))

(assert (=> b!768194 m!713775))

(assert (=> b!768194 m!713775))

(declare-fun m!713787 () Bool)

(assert (=> b!768194 m!713787))

(assert (=> b!768194 m!713787))

(assert (=> b!768194 m!713775))

(declare-fun m!713789 () Bool)

(assert (=> b!768194 m!713789))

(declare-fun m!713791 () Bool)

(assert (=> b!768177 m!713791))

(assert (=> b!768189 m!713775))

(assert (=> b!768189 m!713775))

(declare-fun m!713793 () Bool)

(assert (=> b!768189 m!713793))

(declare-fun m!713795 () Bool)

(assert (=> b!768187 m!713795))

(declare-fun m!713797 () Bool)

(assert (=> b!768178 m!713797))

(declare-fun m!713799 () Bool)

(assert (=> b!768178 m!713799))

(declare-fun m!713801 () Bool)

(assert (=> b!768178 m!713801))

(declare-fun m!713803 () Bool)

(assert (=> b!768178 m!713803))

(declare-fun m!713805 () Bool)

(assert (=> b!768178 m!713805))

(assert (=> b!768178 m!713797))

(assert (=> b!768190 m!713775))

(assert (=> b!768190 m!713775))

(declare-fun m!713807 () Bool)

(assert (=> b!768190 m!713807))

(assert (=> b!768184 m!713775))

(assert (=> b!768184 m!713775))

(assert (=> b!768184 m!713781))

(declare-fun m!713809 () Bool)

(assert (=> b!768193 m!713809))

(declare-fun m!713811 () Bool)

(assert (=> b!768193 m!713811))

(declare-fun m!713813 () Bool)

(assert (=> b!768192 m!713813))

(declare-fun m!713815 () Bool)

(assert (=> b!768186 m!713815))

(assert (=> b!768188 m!713775))

(assert (=> b!768188 m!713775))

(declare-fun m!713817 () Bool)

(assert (=> b!768188 m!713817))

(declare-fun m!713819 () Bool)

(assert (=> start!66662 m!713819))

(declare-fun m!713821 () Bool)

(assert (=> start!66662 m!713821))

(declare-fun m!713823 () Bool)

(assert (=> b!768185 m!713823))

(push 1)

(assert (not b!768177))

(assert (not b!768184))

(assert (not b!768178))

(assert (not b!768192))

(assert (not b!768181))

(assert (not b!768182))

(assert (not b!768179))

(assert (not b!768194))

(assert (not b!768189))

(assert (not b!768193))

(assert (not b!768188))

(assert (not b!768190))

(assert (not start!66662))

(assert (not b!768186))

(assert (not b!768185))

(assert (not b!768183))

(assert (not b!768175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101497 () Bool)

(assert (=> d!101497 (= (validKeyInArray!0 (select (arr!20253 a!3186) j!159)) (and (not (= (select (arr!20253 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20253 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768181 d!101497))

(declare-fun d!101501 () Bool)

(declare-fun res!519754 () Bool)

(declare-fun e!427878 () Bool)

(assert (=> d!101501 (=> res!519754 e!427878)))

(assert (=> d!101501 (= res!519754 (= (select (arr!20253 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101501 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!427878)))

(declare-fun b!768382 () Bool)

(declare-fun e!427879 () Bool)

(assert (=> b!768382 (= e!427878 e!427879)))

(declare-fun res!519755 () Bool)

(assert (=> b!768382 (=> (not res!519755) (not e!427879))))

(assert (=> b!768382 (= res!519755 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20674 a!3186)))))

(declare-fun b!768383 () Bool)

(assert (=> b!768383 (= e!427879 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101501 (not res!519754)) b!768382))

(assert (= (and b!768382 res!519755) b!768383))

(declare-fun m!713959 () Bool)

(assert (=> d!101501 m!713959))

(declare-fun m!713961 () Bool)

(assert (=> b!768383 m!713961))

(assert (=> b!768192 d!101501))

(declare-fun b!768404 () Bool)

(declare-fun e!427894 () Bool)

(declare-fun e!427893 () Bool)

(assert (=> b!768404 (= e!427894 e!427893)))

(declare-fun c!84715 () Bool)

(assert (=> b!768404 (= c!84715 (validKeyInArray!0 (select (arr!20253 a!3186) j!159)))))

(declare-fun bm!35088 () Bool)

(declare-fun call!35091 () Bool)

(assert (=> bm!35088 (= call!35091 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101503 () Bool)

(declare-fun res!519761 () Bool)

(assert (=> d!101503 (=> res!519761 e!427894)))

(assert (=> d!101503 (= res!519761 (bvsge j!159 (size!20674 a!3186)))))

(assert (=> d!101503 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427894)))

(declare-fun b!768405 () Bool)

(declare-fun e!427892 () Bool)

(assert (=> b!768405 (= e!427893 e!427892)))

(declare-fun lt!341843 () (_ BitVec 64))

(assert (=> b!768405 (= lt!341843 (select (arr!20253 a!3186) j!159))))

(declare-fun lt!341844 () Unit!26432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42303 (_ BitVec 64) (_ BitVec 32)) Unit!26432)

(assert (=> b!768405 (= lt!341844 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341843 j!159))))

(assert (=> b!768405 (arrayContainsKey!0 a!3186 lt!341843 #b00000000000000000000000000000000)))

(declare-fun lt!341842 () Unit!26432)

(assert (=> b!768405 (= lt!341842 lt!341844)))

(declare-fun res!519760 () Bool)

(assert (=> b!768405 (= res!519760 (= (seekEntryOrOpen!0 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) (Found!7853 j!159)))))

(assert (=> b!768405 (=> (not res!519760) (not e!427892))))

(declare-fun b!768406 () Bool)

(assert (=> b!768406 (= e!427893 call!35091)))

(declare-fun b!768407 () Bool)

(assert (=> b!768407 (= e!427892 call!35091)))

(assert (= (and d!101503 (not res!519761)) b!768404))

(assert (= (and b!768404 c!84715) b!768405))

(assert (= (and b!768404 (not c!84715)) b!768406))

(assert (= (and b!768405 res!519760) b!768407))

(assert (= (or b!768407 b!768406) bm!35088))

(assert (=> b!768404 m!713775))

(assert (=> b!768404 m!713775))

(assert (=> b!768404 m!713777))

(declare-fun m!713963 () Bool)

(assert (=> bm!35088 m!713963))

(assert (=> b!768405 m!713775))

(declare-fun m!713965 () Bool)

(assert (=> b!768405 m!713965))

(declare-fun m!713967 () Bool)

(assert (=> b!768405 m!713967))

(assert (=> b!768405 m!713775))

(assert (=> b!768405 m!713785))

(assert (=> b!768193 d!101503))

(declare-fun d!101507 () Bool)

(assert (=> d!101507 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341849 () Unit!26432)

(declare-fun choose!38 (array!42303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26432)

(assert (=> d!101507 (= lt!341849 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101507 (validMask!0 mask!3328)))

(assert (=> d!101507 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341849)))

(declare-fun bs!21535 () Bool)

(assert (= bs!21535 d!101507))

(assert (=> bs!21535 m!713809))

(declare-fun m!713979 () Bool)

(assert (=> bs!21535 m!713979))

(assert (=> bs!21535 m!713819))

(assert (=> b!768193 d!101507))

(declare-fun b!768456 () Bool)

(declare-fun e!427919 () SeekEntryResult!7853)

(declare-fun e!427921 () SeekEntryResult!7853)

(assert (=> b!768456 (= e!427919 e!427921)))

(declare-fun lt!341871 () (_ BitVec 64))

(declare-fun lt!341872 () SeekEntryResult!7853)

(assert (=> b!768456 (= lt!341871 (select (arr!20253 a!3186) (index!33782 lt!341872)))))

(declare-fun c!84742 () Bool)

(assert (=> b!768456 (= c!84742 (= lt!341871 (select (arr!20253 a!3186) j!159)))))

(declare-fun b!768457 () Bool)

(declare-fun e!427920 () SeekEntryResult!7853)

(assert (=> b!768457 (= e!427920 (MissingZero!7853 (index!33782 lt!341872)))))

(declare-fun b!768458 () Bool)

(assert (=> b!768458 (= e!427920 (seekKeyOrZeroReturnVacant!0 (x!64707 lt!341872) (index!33782 lt!341872) (index!33782 lt!341872) (select (arr!20253 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768459 () Bool)

(assert (=> b!768459 (= e!427921 (Found!7853 (index!33782 lt!341872)))))

(declare-fun d!101513 () Bool)

(declare-fun lt!341870 () SeekEntryResult!7853)

(assert (=> d!101513 (and (or (is-Undefined!7853 lt!341870) (not (is-Found!7853 lt!341870)) (and (bvsge (index!33781 lt!341870) #b00000000000000000000000000000000) (bvslt (index!33781 lt!341870) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341870) (is-Found!7853 lt!341870) (not (is-MissingZero!7853 lt!341870)) (and (bvsge (index!33780 lt!341870) #b00000000000000000000000000000000) (bvslt (index!33780 lt!341870) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341870) (is-Found!7853 lt!341870) (is-MissingZero!7853 lt!341870) (not (is-MissingVacant!7853 lt!341870)) (and (bvsge (index!33783 lt!341870) #b00000000000000000000000000000000) (bvslt (index!33783 lt!341870) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341870) (ite (is-Found!7853 lt!341870) (= (select (arr!20253 a!3186) (index!33781 lt!341870)) (select (arr!20253 a!3186) j!159)) (ite (is-MissingZero!7853 lt!341870) (= (select (arr!20253 a!3186) (index!33780 lt!341870)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7853 lt!341870) (= (select (arr!20253 a!3186) (index!33783 lt!341870)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101513 (= lt!341870 e!427919)))

(declare-fun c!84740 () Bool)

(assert (=> d!101513 (= c!84740 (and (is-Intermediate!7853 lt!341872) (undefined!8665 lt!341872)))))

(assert (=> d!101513 (= lt!341872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328) (select (arr!20253 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101513 (validMask!0 mask!3328)))

(assert (=> d!101513 (= (seekEntryOrOpen!0 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341870)))

(declare-fun b!768460 () Bool)

(declare-fun c!84741 () Bool)

(assert (=> b!768460 (= c!84741 (= lt!341871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768460 (= e!427921 e!427920)))

(declare-fun b!768461 () Bool)

(assert (=> b!768461 (= e!427919 Undefined!7853)))

(assert (= (and d!101513 c!84740) b!768461))

(assert (= (and d!101513 (not c!84740)) b!768456))

(assert (= (and b!768456 c!84742) b!768459))

(assert (= (and b!768456 (not c!84742)) b!768460))

(assert (= (and b!768460 c!84741) b!768457))

(assert (= (and b!768460 (not c!84741)) b!768458))

(declare-fun m!714013 () Bool)

(assert (=> b!768456 m!714013))

(assert (=> b!768458 m!713775))

(declare-fun m!714015 () Bool)

(assert (=> b!768458 m!714015))

(declare-fun m!714017 () Bool)

(assert (=> d!101513 m!714017))

(assert (=> d!101513 m!713819))

(declare-fun m!714019 () Bool)

(assert (=> d!101513 m!714019))

(assert (=> d!101513 m!713775))

(assert (=> d!101513 m!713787))

(assert (=> d!101513 m!713787))

(assert (=> d!101513 m!713775))

(assert (=> d!101513 m!713789))

(declare-fun m!714021 () Bool)

(assert (=> d!101513 m!714021))

(assert (=> b!768182 d!101513))

(declare-fun b!768518 () Bool)

(declare-fun e!427955 () SeekEntryResult!7853)

(assert (=> b!768518 (= e!427955 (Found!7853 index!1321))))

(declare-fun b!768519 () Bool)

(declare-fun e!427956 () SeekEntryResult!7853)

(assert (=> b!768519 (= e!427956 e!427955)))

(declare-fun c!84766 () Bool)

(declare-fun lt!341893 () (_ BitVec 64))

(assert (=> b!768519 (= c!84766 (= lt!341893 (select (arr!20253 a!3186) j!159)))))

(declare-fun e!427954 () SeekEntryResult!7853)

(declare-fun b!768520 () Bool)

(assert (=> b!768520 (= e!427954 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768521 () Bool)

(declare-fun c!84767 () Bool)

(assert (=> b!768521 (= c!84767 (= lt!341893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768521 (= e!427955 e!427954)))

(declare-fun b!768522 () Bool)

(assert (=> b!768522 (= e!427954 (MissingVacant!7853 resIntermediateIndex!5))))

(declare-fun b!768517 () Bool)

(assert (=> b!768517 (= e!427956 Undefined!7853)))

(declare-fun d!101525 () Bool)

(declare-fun lt!341894 () SeekEntryResult!7853)

(assert (=> d!101525 (and (or (is-Undefined!7853 lt!341894) (not (is-Found!7853 lt!341894)) (and (bvsge (index!33781 lt!341894) #b00000000000000000000000000000000) (bvslt (index!33781 lt!341894) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341894) (is-Found!7853 lt!341894) (not (is-MissingVacant!7853 lt!341894)) (not (= (index!33783 lt!341894) resIntermediateIndex!5)) (and (bvsge (index!33783 lt!341894) #b00000000000000000000000000000000) (bvslt (index!33783 lt!341894) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341894) (ite (is-Found!7853 lt!341894) (= (select (arr!20253 a!3186) (index!33781 lt!341894)) (select (arr!20253 a!3186) j!159)) (and (is-MissingVacant!7853 lt!341894) (= (index!33783 lt!341894) resIntermediateIndex!5) (= (select (arr!20253 a!3186) (index!33783 lt!341894)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101525 (= lt!341894 e!427956)))

(declare-fun c!84765 () Bool)

(assert (=> d!101525 (= c!84765 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101525 (= lt!341893 (select (arr!20253 a!3186) index!1321))))

(assert (=> d!101525 (validMask!0 mask!3328)))

(assert (=> d!101525 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341894)))

(assert (= (and d!101525 c!84765) b!768517))

(assert (= (and d!101525 (not c!84765)) b!768519))

(assert (= (and b!768519 c!84766) b!768518))

(assert (= (and b!768519 (not c!84766)) b!768521))

(assert (= (and b!768521 c!84767) b!768522))

(assert (= (and b!768521 (not c!84767)) b!768520))

(assert (=> b!768520 m!713779))

(assert (=> b!768520 m!713779))

(assert (=> b!768520 m!713775))

(declare-fun m!714063 () Bool)

(assert (=> b!768520 m!714063))

(declare-fun m!714065 () Bool)

(assert (=> d!101525 m!714065))

(declare-fun m!714067 () Bool)

(assert (=> d!101525 m!714067))

(declare-fun m!714069 () Bool)

(assert (=> d!101525 m!714069))

(assert (=> d!101525 m!713819))

(assert (=> b!768184 d!101525))

(assert (=> b!768183 d!101525))

(declare-fun b!768589 () Bool)

(declare-fun lt!341911 () SeekEntryResult!7853)

(assert (=> b!768589 (and (bvsge (index!33782 lt!341911) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341911) (size!20674 a!3186)))))

(declare-fun res!519799 () Bool)

(assert (=> b!768589 (= res!519799 (= (select (arr!20253 a!3186) (index!33782 lt!341911)) (select (arr!20253 a!3186) j!159)))))

(declare-fun e!427999 () Bool)

(assert (=> b!768589 (=> res!519799 e!427999)))

(declare-fun e!427998 () Bool)

(assert (=> b!768589 (= e!427998 e!427999)))

(declare-fun d!101543 () Bool)

(declare-fun e!427997 () Bool)

(assert (=> d!101543 e!427997))

(declare-fun c!84790 () Bool)

(assert (=> d!101543 (= c!84790 (and (is-Intermediate!7853 lt!341911) (undefined!8665 lt!341911)))))

(declare-fun e!428000 () SeekEntryResult!7853)

(assert (=> d!101543 (= lt!341911 e!428000)))

(declare-fun c!84789 () Bool)

(assert (=> d!101543 (= c!84789 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341912 () (_ BitVec 64))

(assert (=> d!101543 (= lt!341912 (select (arr!20253 a!3186) (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328)))))

(assert (=> d!101543 (validMask!0 mask!3328)))

(assert (=> d!101543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328) (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341911)))

(declare-fun b!768590 () Bool)

(assert (=> b!768590 (= e!428000 (Intermediate!7853 true (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun e!428001 () SeekEntryResult!7853)

(declare-fun b!768591 () Bool)

(assert (=> b!768591 (= e!428001 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20253 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768592 () Bool)

(assert (=> b!768592 (= e!427997 e!427998)))

(declare-fun res!519797 () Bool)

(assert (=> b!768592 (= res!519797 (and (is-Intermediate!7853 lt!341911) (not (undefined!8665 lt!341911)) (bvslt (x!64707 lt!341911) #b01111111111111111111111111111110) (bvsge (x!64707 lt!341911) #b00000000000000000000000000000000) (bvsge (x!64707 lt!341911) #b00000000000000000000000000000000)))))

(assert (=> b!768592 (=> (not res!519797) (not e!427998))))

(declare-fun b!768593 () Bool)

(assert (=> b!768593 (and (bvsge (index!33782 lt!341911) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341911) (size!20674 a!3186)))))

(assert (=> b!768593 (= e!427999 (= (select (arr!20253 a!3186) (index!33782 lt!341911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768594 () Bool)

(assert (=> b!768594 (= e!428000 e!428001)))

(declare-fun c!84791 () Bool)

(assert (=> b!768594 (= c!84791 (or (= lt!341912 (select (arr!20253 a!3186) j!159)) (= (bvadd lt!341912 lt!341912) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768595 () Bool)

(assert (=> b!768595 (= e!428001 (Intermediate!7853 false (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768596 () Bool)

(assert (=> b!768596 (= e!427997 (bvsge (x!64707 lt!341911) #b01111111111111111111111111111110))))

(declare-fun b!768597 () Bool)

(assert (=> b!768597 (and (bvsge (index!33782 lt!341911) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341911) (size!20674 a!3186)))))

(declare-fun res!519798 () Bool)

(assert (=> b!768597 (= res!519798 (= (select (arr!20253 a!3186) (index!33782 lt!341911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768597 (=> res!519798 e!427999)))

(assert (= (and d!101543 c!84789) b!768590))

(assert (= (and d!101543 (not c!84789)) b!768594))

(assert (= (and b!768594 c!84791) b!768595))

(assert (= (and b!768594 (not c!84791)) b!768591))

(assert (= (and d!101543 c!84790) b!768596))

(assert (= (and d!101543 (not c!84790)) b!768592))

(assert (= (and b!768592 res!519797) b!768589))

(assert (= (and b!768589 (not res!519799)) b!768597))

(assert (= (and b!768597 (not res!519798)) b!768593))

(assert (=> b!768591 m!713787))

(declare-fun m!714093 () Bool)

(assert (=> b!768591 m!714093))

(assert (=> b!768591 m!714093))

(assert (=> b!768591 m!713775))

(declare-fun m!714095 () Bool)

(assert (=> b!768591 m!714095))

(declare-fun m!714097 () Bool)

(assert (=> b!768593 m!714097))

(assert (=> b!768589 m!714097))

(assert (=> d!101543 m!713787))

(declare-fun m!714099 () Bool)

(assert (=> d!101543 m!714099))

(assert (=> d!101543 m!713819))

(assert (=> b!768597 m!714097))

(assert (=> b!768194 d!101543))

(declare-fun d!101551 () Bool)

(declare-fun lt!341922 () (_ BitVec 32))

(declare-fun lt!341921 () (_ BitVec 32))

(assert (=> d!101551 (= lt!341922 (bvmul (bvxor lt!341921 (bvlshr lt!341921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101551 (= lt!341921 ((_ extract 31 0) (bvand (bvxor (select (arr!20253 a!3186) j!159) (bvlshr (select (arr!20253 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101551 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519800 (let ((h!15351 ((_ extract 31 0) (bvand (bvxor (select (arr!20253 a!3186) j!159) (bvlshr (select (arr!20253 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64717 (bvmul (bvxor h!15351 (bvlshr h!15351 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64717 (bvlshr x!64717 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519800 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519800 #b00000000000000000000000000000000))))))

(assert (=> d!101551 (= (toIndex!0 (select (arr!20253 a!3186) j!159) mask!3328) (bvand (bvxor lt!341922 (bvlshr lt!341922 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768194 d!101551))

(declare-fun d!101553 () Bool)

(assert (=> d!101553 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768185 d!101553))

(declare-fun d!101555 () Bool)

(assert (=> d!101555 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66662 d!101555))

(declare-fun d!101565 () Bool)

(assert (=> d!101565 (= (array_inv!16049 a!3186) (bvsge (size!20674 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66662 d!101565))

(declare-fun b!768652 () Bool)

(declare-fun e!428036 () Bool)

(declare-fun call!35100 () Bool)

(assert (=> b!768652 (= e!428036 call!35100)))

(declare-fun b!768653 () Bool)

(declare-fun e!428038 () Bool)

(declare-fun contains!4087 (List!14255 (_ BitVec 64)) Bool)

(assert (=> b!768653 (= e!428038 (contains!4087 Nil!14252 (select (arr!20253 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35097 () Bool)

(declare-fun c!84811 () Bool)

(assert (=> bm!35097 (= call!35100 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84811 (Cons!14251 (select (arr!20253 a!3186) #b00000000000000000000000000000000) Nil!14252) Nil!14252)))))

(declare-fun b!768654 () Bool)

(assert (=> b!768654 (= e!428036 call!35100)))

(declare-fun d!101567 () Bool)

(declare-fun res!519818 () Bool)

(declare-fun e!428035 () Bool)

(assert (=> d!101567 (=> res!519818 e!428035)))

(assert (=> d!101567 (= res!519818 (bvsge #b00000000000000000000000000000000 (size!20674 a!3186)))))

(assert (=> d!101567 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14252) e!428035)))

(declare-fun b!768655 () Bool)

(declare-fun e!428037 () Bool)

(assert (=> b!768655 (= e!428035 e!428037)))

(declare-fun res!519820 () Bool)

(assert (=> b!768655 (=> (not res!519820) (not e!428037))))

(assert (=> b!768655 (= res!519820 (not e!428038))))

(declare-fun res!519819 () Bool)

(assert (=> b!768655 (=> (not res!519819) (not e!428038))))

(assert (=> b!768655 (= res!519819 (validKeyInArray!0 (select (arr!20253 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768656 () Bool)

(assert (=> b!768656 (= e!428037 e!428036)))

(assert (=> b!768656 (= c!84811 (validKeyInArray!0 (select (arr!20253 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101567 (not res!519818)) b!768655))

(assert (= (and b!768655 res!519819) b!768653))

(assert (= (and b!768655 res!519820) b!768656))

(assert (= (and b!768656 c!84811) b!768654))

(assert (= (and b!768656 (not c!84811)) b!768652))

(assert (= (or b!768654 b!768652) bm!35097))

(assert (=> b!768653 m!713959))

(assert (=> b!768653 m!713959))

(declare-fun m!714121 () Bool)

(assert (=> b!768653 m!714121))

(assert (=> bm!35097 m!713959))

(declare-fun m!714123 () Bool)

(assert (=> bm!35097 m!714123))

(assert (=> b!768655 m!713959))

(assert (=> b!768655 m!713959))

(declare-fun m!714125 () Bool)

(assert (=> b!768655 m!714125))

(assert (=> b!768656 m!713959))

(assert (=> b!768656 m!713959))

(assert (=> b!768656 m!714125))

(assert (=> b!768175 d!101567))

(declare-fun b!768661 () Bool)

(declare-fun e!428042 () SeekEntryResult!7853)

(declare-fun e!428044 () SeekEntryResult!7853)

(assert (=> b!768661 (= e!428042 e!428044)))

(declare-fun lt!341945 () (_ BitVec 64))

(declare-fun lt!341946 () SeekEntryResult!7853)

(assert (=> b!768661 (= lt!341945 (select (arr!20253 a!3186) (index!33782 lt!341946)))))

(declare-fun c!84815 () Bool)

(assert (=> b!768661 (= c!84815 (= lt!341945 k!2102))))

(declare-fun b!768662 () Bool)

(declare-fun e!428043 () SeekEntryResult!7853)

(assert (=> b!768662 (= e!428043 (MissingZero!7853 (index!33782 lt!341946)))))

(declare-fun b!768663 () Bool)

(assert (=> b!768663 (= e!428043 (seekKeyOrZeroReturnVacant!0 (x!64707 lt!341946) (index!33782 lt!341946) (index!33782 lt!341946) k!2102 a!3186 mask!3328))))

(declare-fun b!768664 () Bool)

(assert (=> b!768664 (= e!428044 (Found!7853 (index!33782 lt!341946)))))

(declare-fun d!101569 () Bool)

(declare-fun lt!341944 () SeekEntryResult!7853)

(assert (=> d!101569 (and (or (is-Undefined!7853 lt!341944) (not (is-Found!7853 lt!341944)) (and (bvsge (index!33781 lt!341944) #b00000000000000000000000000000000) (bvslt (index!33781 lt!341944) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341944) (is-Found!7853 lt!341944) (not (is-MissingZero!7853 lt!341944)) (and (bvsge (index!33780 lt!341944) #b00000000000000000000000000000000) (bvslt (index!33780 lt!341944) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341944) (is-Found!7853 lt!341944) (is-MissingZero!7853 lt!341944) (not (is-MissingVacant!7853 lt!341944)) (and (bvsge (index!33783 lt!341944) #b00000000000000000000000000000000) (bvslt (index!33783 lt!341944) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341944) (ite (is-Found!7853 lt!341944) (= (select (arr!20253 a!3186) (index!33781 lt!341944)) k!2102) (ite (is-MissingZero!7853 lt!341944) (= (select (arr!20253 a!3186) (index!33780 lt!341944)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7853 lt!341944) (= (select (arr!20253 a!3186) (index!33783 lt!341944)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101569 (= lt!341944 e!428042)))

(declare-fun c!84813 () Bool)

(assert (=> d!101569 (= c!84813 (and (is-Intermediate!7853 lt!341946) (undefined!8665 lt!341946)))))

(assert (=> d!101569 (= lt!341946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101569 (validMask!0 mask!3328)))

(assert (=> d!101569 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!341944)))

(declare-fun b!768665 () Bool)

(declare-fun c!84814 () Bool)

(assert (=> b!768665 (= c!84814 (= lt!341945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768665 (= e!428044 e!428043)))

(declare-fun b!768666 () Bool)

(assert (=> b!768666 (= e!428042 Undefined!7853)))

(assert (= (and d!101569 c!84813) b!768666))

(assert (= (and d!101569 (not c!84813)) b!768661))

(assert (= (and b!768661 c!84815) b!768664))

(assert (= (and b!768661 (not c!84815)) b!768665))

(assert (= (and b!768665 c!84814) b!768662))

(assert (= (and b!768665 (not c!84814)) b!768663))

(declare-fun m!714137 () Bool)

(assert (=> b!768661 m!714137))

(declare-fun m!714139 () Bool)

(assert (=> b!768663 m!714139))

(declare-fun m!714141 () Bool)

(assert (=> d!101569 m!714141))

(assert (=> d!101569 m!713819))

(declare-fun m!714143 () Bool)

(assert (=> d!101569 m!714143))

(declare-fun m!714145 () Bool)

(assert (=> d!101569 m!714145))

(assert (=> d!101569 m!714145))

(declare-fun m!714147 () Bool)

(assert (=> d!101569 m!714147))

(declare-fun m!714149 () Bool)

(assert (=> d!101569 m!714149))

(assert (=> b!768186 d!101569))

(declare-fun b!768676 () Bool)

(declare-fun e!428052 () Bool)

(declare-fun e!428051 () Bool)

(assert (=> b!768676 (= e!428052 e!428051)))

(declare-fun c!84819 () Bool)

(assert (=> b!768676 (= c!84819 (validKeyInArray!0 (select (arr!20253 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35099 () Bool)

(declare-fun call!35102 () Bool)

(assert (=> bm!35099 (= call!35102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101575 () Bool)

(declare-fun res!519827 () Bool)

(assert (=> d!101575 (=> res!519827 e!428052)))

(assert (=> d!101575 (= res!519827 (bvsge #b00000000000000000000000000000000 (size!20674 a!3186)))))

(assert (=> d!101575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!428052)))

(declare-fun b!768677 () Bool)

(declare-fun e!428050 () Bool)

(assert (=> b!768677 (= e!428051 e!428050)))

(declare-fun lt!341950 () (_ BitVec 64))

(assert (=> b!768677 (= lt!341950 (select (arr!20253 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341951 () Unit!26432)

(assert (=> b!768677 (= lt!341951 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341950 #b00000000000000000000000000000000))))

(assert (=> b!768677 (arrayContainsKey!0 a!3186 lt!341950 #b00000000000000000000000000000000)))

(declare-fun lt!341949 () Unit!26432)

(assert (=> b!768677 (= lt!341949 lt!341951)))

(declare-fun res!519826 () Bool)

(assert (=> b!768677 (= res!519826 (= (seekEntryOrOpen!0 (select (arr!20253 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7853 #b00000000000000000000000000000000)))))

(assert (=> b!768677 (=> (not res!519826) (not e!428050))))

(declare-fun b!768678 () Bool)

(assert (=> b!768678 (= e!428051 call!35102)))

(declare-fun b!768679 () Bool)

(assert (=> b!768679 (= e!428050 call!35102)))

(assert (= (and d!101575 (not res!519827)) b!768676))

(assert (= (and b!768676 c!84819) b!768677))

(assert (= (and b!768676 (not c!84819)) b!768678))

(assert (= (and b!768677 res!519826) b!768679))

(assert (= (or b!768679 b!768678) bm!35099))

(assert (=> b!768676 m!713959))

(assert (=> b!768676 m!713959))

(assert (=> b!768676 m!714125))

(declare-fun m!714157 () Bool)

(assert (=> bm!35099 m!714157))

(assert (=> b!768677 m!713959))

(declare-fun m!714161 () Bool)

(assert (=> b!768677 m!714161))

(declare-fun m!714163 () Bool)

(assert (=> b!768677 m!714163))

(assert (=> b!768677 m!713959))

(declare-fun m!714165 () Bool)

(assert (=> b!768677 m!714165))

(assert (=> b!768177 d!101575))

(declare-fun b!768680 () Bool)

(declare-fun lt!341954 () SeekEntryResult!7853)

(assert (=> b!768680 (and (bvsge (index!33782 lt!341954) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341954) (size!20674 a!3186)))))

(declare-fun res!519830 () Bool)

(assert (=> b!768680 (= res!519830 (= (select (arr!20253 a!3186) (index!33782 lt!341954)) (select (arr!20253 a!3186) j!159)))))

(declare-fun e!428055 () Bool)

(assert (=> b!768680 (=> res!519830 e!428055)))

(declare-fun e!428054 () Bool)

(assert (=> b!768680 (= e!428054 e!428055)))

(declare-fun d!101579 () Bool)

(declare-fun e!428053 () Bool)

(assert (=> d!101579 e!428053))

(declare-fun c!84821 () Bool)

(assert (=> d!101579 (= c!84821 (and (is-Intermediate!7853 lt!341954) (undefined!8665 lt!341954)))))

(declare-fun e!428056 () SeekEntryResult!7853)

(assert (=> d!101579 (= lt!341954 e!428056)))

(declare-fun c!84820 () Bool)

(assert (=> d!101579 (= c!84820 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341955 () (_ BitVec 64))

(assert (=> d!101579 (= lt!341955 (select (arr!20253 a!3186) index!1321))))

(assert (=> d!101579 (validMask!0 mask!3328)))

(assert (=> d!101579 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341954)))

(declare-fun b!768681 () Bool)

(assert (=> b!768681 (= e!428056 (Intermediate!7853 true index!1321 x!1131))))

(declare-fun e!428057 () SeekEntryResult!7853)

(declare-fun b!768682 () Bool)

(assert (=> b!768682 (= e!428057 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20253 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768683 () Bool)

(assert (=> b!768683 (= e!428053 e!428054)))

(declare-fun res!519828 () Bool)

(assert (=> b!768683 (= res!519828 (and (is-Intermediate!7853 lt!341954) (not (undefined!8665 lt!341954)) (bvslt (x!64707 lt!341954) #b01111111111111111111111111111110) (bvsge (x!64707 lt!341954) #b00000000000000000000000000000000) (bvsge (x!64707 lt!341954) x!1131)))))

(assert (=> b!768683 (=> (not res!519828) (not e!428054))))

(declare-fun b!768684 () Bool)

(assert (=> b!768684 (and (bvsge (index!33782 lt!341954) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341954) (size!20674 a!3186)))))

(assert (=> b!768684 (= e!428055 (= (select (arr!20253 a!3186) (index!33782 lt!341954)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768685 () Bool)

(assert (=> b!768685 (= e!428056 e!428057)))

(declare-fun c!84822 () Bool)

(assert (=> b!768685 (= c!84822 (or (= lt!341955 (select (arr!20253 a!3186) j!159)) (= (bvadd lt!341955 lt!341955) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768686 () Bool)

(assert (=> b!768686 (= e!428057 (Intermediate!7853 false index!1321 x!1131))))

(declare-fun b!768687 () Bool)

(assert (=> b!768687 (= e!428053 (bvsge (x!64707 lt!341954) #b01111111111111111111111111111110))))

(declare-fun b!768688 () Bool)

(assert (=> b!768688 (and (bvsge (index!33782 lt!341954) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341954) (size!20674 a!3186)))))

(declare-fun res!519829 () Bool)

(assert (=> b!768688 (= res!519829 (= (select (arr!20253 a!3186) (index!33782 lt!341954)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768688 (=> res!519829 e!428055)))

(assert (= (and d!101579 c!84820) b!768681))

(assert (= (and d!101579 (not c!84820)) b!768685))

(assert (= (and b!768685 c!84822) b!768686))

(assert (= (and b!768685 (not c!84822)) b!768682))

(assert (= (and d!101579 c!84821) b!768687))

(assert (= (and d!101579 (not c!84821)) b!768683))

(assert (= (and b!768683 res!519828) b!768680))

(assert (= (and b!768680 (not res!519830)) b!768688))

(assert (= (and b!768688 (not res!519829)) b!768684))

(assert (=> b!768682 m!713779))

(assert (=> b!768682 m!713779))

(assert (=> b!768682 m!713775))

(declare-fun m!714167 () Bool)

(assert (=> b!768682 m!714167))

(declare-fun m!714169 () Bool)

(assert (=> b!768684 m!714169))

(assert (=> b!768680 m!714169))

(assert (=> d!101579 m!714069))

(assert (=> d!101579 m!713819))

(assert (=> b!768688 m!714169))

(assert (=> b!768188 d!101579))

(declare-fun b!768690 () Bool)

(declare-fun e!428059 () SeekEntryResult!7853)

(assert (=> b!768690 (= e!428059 (Found!7853 lt!341736))))

(declare-fun b!768691 () Bool)

(declare-fun e!428060 () SeekEntryResult!7853)

(assert (=> b!768691 (= e!428060 e!428059)))

(declare-fun c!84824 () Bool)

(declare-fun lt!341956 () (_ BitVec 64))

(assert (=> b!768691 (= c!84824 (= lt!341956 (select (arr!20253 a!3186) j!159)))))

(declare-fun e!428058 () SeekEntryResult!7853)

(declare-fun b!768692 () Bool)

(assert (=> b!768692 (= e!428058 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341736 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768693 () Bool)

(declare-fun c!84825 () Bool)

(assert (=> b!768693 (= c!84825 (= lt!341956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768693 (= e!428059 e!428058)))

(declare-fun b!768694 () Bool)

(assert (=> b!768694 (= e!428058 (MissingVacant!7853 resIntermediateIndex!5))))

(declare-fun b!768689 () Bool)

(assert (=> b!768689 (= e!428060 Undefined!7853)))

(declare-fun lt!341957 () SeekEntryResult!7853)

(declare-fun d!101583 () Bool)

(assert (=> d!101583 (and (or (is-Undefined!7853 lt!341957) (not (is-Found!7853 lt!341957)) (and (bvsge (index!33781 lt!341957) #b00000000000000000000000000000000) (bvslt (index!33781 lt!341957) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341957) (is-Found!7853 lt!341957) (not (is-MissingVacant!7853 lt!341957)) (not (= (index!33783 lt!341957) resIntermediateIndex!5)) (and (bvsge (index!33783 lt!341957) #b00000000000000000000000000000000) (bvslt (index!33783 lt!341957) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341957) (ite (is-Found!7853 lt!341957) (= (select (arr!20253 a!3186) (index!33781 lt!341957)) (select (arr!20253 a!3186) j!159)) (and (is-MissingVacant!7853 lt!341957) (= (index!33783 lt!341957) resIntermediateIndex!5) (= (select (arr!20253 a!3186) (index!33783 lt!341957)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101583 (= lt!341957 e!428060)))

(declare-fun c!84823 () Bool)

(assert (=> d!101583 (= c!84823 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101583 (= lt!341956 (select (arr!20253 a!3186) lt!341736))))

(assert (=> d!101583 (validMask!0 mask!3328)))

(assert (=> d!101583 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341736 resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341957)))

(assert (= (and d!101583 c!84823) b!768689))

(assert (= (and d!101583 (not c!84823)) b!768691))

(assert (= (and b!768691 c!84824) b!768690))

(assert (= (and b!768691 (not c!84824)) b!768693))

(assert (= (and b!768693 c!84825) b!768694))

(assert (= (and b!768693 (not c!84825)) b!768692))

(declare-fun m!714171 () Bool)

(assert (=> b!768692 m!714171))

(assert (=> b!768692 m!714171))

(assert (=> b!768692 m!713775))

(declare-fun m!714173 () Bool)

(assert (=> b!768692 m!714173))

(declare-fun m!714175 () Bool)

(assert (=> d!101583 m!714175))

(declare-fun m!714177 () Bool)

(assert (=> d!101583 m!714177))

(declare-fun m!714179 () Bool)

(assert (=> d!101583 m!714179))

(assert (=> d!101583 m!713819))

(assert (=> b!768189 d!101583))

(declare-fun b!768695 () Bool)

(declare-fun lt!341960 () SeekEntryResult!7853)

(assert (=> b!768695 (and (bvsge (index!33782 lt!341960) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341960) (size!20674 lt!341740)))))

(declare-fun res!519833 () Bool)

(assert (=> b!768695 (= res!519833 (= (select (arr!20253 lt!341740) (index!33782 lt!341960)) lt!341741))))

(declare-fun e!428063 () Bool)

(assert (=> b!768695 (=> res!519833 e!428063)))

(declare-fun e!428062 () Bool)

(assert (=> b!768695 (= e!428062 e!428063)))

(declare-fun d!101585 () Bool)

(declare-fun e!428061 () Bool)

(assert (=> d!101585 e!428061))

(declare-fun c!84827 () Bool)

(assert (=> d!101585 (= c!84827 (and (is-Intermediate!7853 lt!341960) (undefined!8665 lt!341960)))))

(declare-fun e!428064 () SeekEntryResult!7853)

(assert (=> d!101585 (= lt!341960 e!428064)))

(declare-fun c!84826 () Bool)

(assert (=> d!101585 (= c!84826 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341961 () (_ BitVec 64))

(assert (=> d!101585 (= lt!341961 (select (arr!20253 lt!341740) index!1321))))

(assert (=> d!101585 (validMask!0 mask!3328)))

(assert (=> d!101585 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341741 lt!341740 mask!3328) lt!341960)))

(declare-fun b!768696 () Bool)

(assert (=> b!768696 (= e!428064 (Intermediate!7853 true index!1321 x!1131))))

(declare-fun b!768697 () Bool)

(declare-fun e!428065 () SeekEntryResult!7853)

(assert (=> b!768697 (= e!428065 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341741 lt!341740 mask!3328))))

(declare-fun b!768698 () Bool)

(assert (=> b!768698 (= e!428061 e!428062)))

(declare-fun res!519831 () Bool)

(assert (=> b!768698 (= res!519831 (and (is-Intermediate!7853 lt!341960) (not (undefined!8665 lt!341960)) (bvslt (x!64707 lt!341960) #b01111111111111111111111111111110) (bvsge (x!64707 lt!341960) #b00000000000000000000000000000000) (bvsge (x!64707 lt!341960) x!1131)))))

(assert (=> b!768698 (=> (not res!519831) (not e!428062))))

(declare-fun b!768699 () Bool)

(assert (=> b!768699 (and (bvsge (index!33782 lt!341960) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341960) (size!20674 lt!341740)))))

(assert (=> b!768699 (= e!428063 (= (select (arr!20253 lt!341740) (index!33782 lt!341960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768700 () Bool)

(assert (=> b!768700 (= e!428064 e!428065)))

(declare-fun c!84828 () Bool)

(assert (=> b!768700 (= c!84828 (or (= lt!341961 lt!341741) (= (bvadd lt!341961 lt!341961) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768701 () Bool)

(assert (=> b!768701 (= e!428065 (Intermediate!7853 false index!1321 x!1131))))

(declare-fun b!768702 () Bool)

(assert (=> b!768702 (= e!428061 (bvsge (x!64707 lt!341960) #b01111111111111111111111111111110))))

(declare-fun b!768703 () Bool)

(assert (=> b!768703 (and (bvsge (index!33782 lt!341960) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341960) (size!20674 lt!341740)))))

(declare-fun res!519832 () Bool)

(assert (=> b!768703 (= res!519832 (= (select (arr!20253 lt!341740) (index!33782 lt!341960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768703 (=> res!519832 e!428063)))

(assert (= (and d!101585 c!84826) b!768696))

(assert (= (and d!101585 (not c!84826)) b!768700))

(assert (= (and b!768700 c!84828) b!768701))

(assert (= (and b!768700 (not c!84828)) b!768697))

(assert (= (and d!101585 c!84827) b!768702))

(assert (= (and d!101585 (not c!84827)) b!768698))

(assert (= (and b!768698 res!519831) b!768695))

(assert (= (and b!768695 (not res!519833)) b!768703))

(assert (= (and b!768703 (not res!519832)) b!768699))

(assert (=> b!768697 m!713779))

(assert (=> b!768697 m!713779))

(declare-fun m!714183 () Bool)

(assert (=> b!768697 m!714183))

(declare-fun m!714185 () Bool)

(assert (=> b!768699 m!714185))

(assert (=> b!768695 m!714185))

(declare-fun m!714187 () Bool)

(assert (=> d!101585 m!714187))

(assert (=> d!101585 m!713819))

(assert (=> b!768703 m!714185))

(assert (=> b!768178 d!101585))

(declare-fun b!768710 () Bool)

(declare-fun lt!341965 () SeekEntryResult!7853)

(assert (=> b!768710 (and (bvsge (index!33782 lt!341965) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341965) (size!20674 lt!341740)))))

(declare-fun res!519836 () Bool)

(assert (=> b!768710 (= res!519836 (= (select (arr!20253 lt!341740) (index!33782 lt!341965)) lt!341741))))

(declare-fun e!428071 () Bool)

(assert (=> b!768710 (=> res!519836 e!428071)))

(declare-fun e!428070 () Bool)

(assert (=> b!768710 (= e!428070 e!428071)))

(declare-fun d!101589 () Bool)

(declare-fun e!428069 () Bool)

(assert (=> d!101589 e!428069))

(declare-fun c!84833 () Bool)

(assert (=> d!101589 (= c!84833 (and (is-Intermediate!7853 lt!341965) (undefined!8665 lt!341965)))))

(declare-fun e!428072 () SeekEntryResult!7853)

(assert (=> d!101589 (= lt!341965 e!428072)))

(declare-fun c!84832 () Bool)

(assert (=> d!101589 (= c!84832 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341966 () (_ BitVec 64))

(assert (=> d!101589 (= lt!341966 (select (arr!20253 lt!341740) (toIndex!0 lt!341741 mask!3328)))))

(assert (=> d!101589 (validMask!0 mask!3328)))

(assert (=> d!101589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341741 mask!3328) lt!341741 lt!341740 mask!3328) lt!341965)))

(declare-fun b!768711 () Bool)

(assert (=> b!768711 (= e!428072 (Intermediate!7853 true (toIndex!0 lt!341741 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768712 () Bool)

(declare-fun e!428073 () SeekEntryResult!7853)

(assert (=> b!768712 (= e!428073 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341741 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341741 lt!341740 mask!3328))))

(declare-fun b!768713 () Bool)

(assert (=> b!768713 (= e!428069 e!428070)))

(declare-fun res!519834 () Bool)

(assert (=> b!768713 (= res!519834 (and (is-Intermediate!7853 lt!341965) (not (undefined!8665 lt!341965)) (bvslt (x!64707 lt!341965) #b01111111111111111111111111111110) (bvsge (x!64707 lt!341965) #b00000000000000000000000000000000) (bvsge (x!64707 lt!341965) #b00000000000000000000000000000000)))))

(assert (=> b!768713 (=> (not res!519834) (not e!428070))))

(declare-fun b!768714 () Bool)

(assert (=> b!768714 (and (bvsge (index!33782 lt!341965) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341965) (size!20674 lt!341740)))))

(assert (=> b!768714 (= e!428071 (= (select (arr!20253 lt!341740) (index!33782 lt!341965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768715 () Bool)

(assert (=> b!768715 (= e!428072 e!428073)))

(declare-fun c!84834 () Bool)

(assert (=> b!768715 (= c!84834 (or (= lt!341966 lt!341741) (= (bvadd lt!341966 lt!341966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768716 () Bool)

(assert (=> b!768716 (= e!428073 (Intermediate!7853 false (toIndex!0 lt!341741 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768717 () Bool)

(assert (=> b!768717 (= e!428069 (bvsge (x!64707 lt!341965) #b01111111111111111111111111111110))))

(declare-fun b!768718 () Bool)

(assert (=> b!768718 (and (bvsge (index!33782 lt!341965) #b00000000000000000000000000000000) (bvslt (index!33782 lt!341965) (size!20674 lt!341740)))))

(declare-fun res!519835 () Bool)

(assert (=> b!768718 (= res!519835 (= (select (arr!20253 lt!341740) (index!33782 lt!341965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768718 (=> res!519835 e!428071)))

(assert (= (and d!101589 c!84832) b!768711))

(assert (= (and d!101589 (not c!84832)) b!768715))

(assert (= (and b!768715 c!84834) b!768716))

(assert (= (and b!768715 (not c!84834)) b!768712))

(assert (= (and d!101589 c!84833) b!768717))

(assert (= (and d!101589 (not c!84833)) b!768713))

(assert (= (and b!768713 res!519834) b!768710))

(assert (= (and b!768710 (not res!519836)) b!768718))

(assert (= (and b!768718 (not res!519835)) b!768714))

(assert (=> b!768712 m!713797))

(declare-fun m!714199 () Bool)

(assert (=> b!768712 m!714199))

(assert (=> b!768712 m!714199))

(declare-fun m!714201 () Bool)

(assert (=> b!768712 m!714201))

(declare-fun m!714203 () Bool)

(assert (=> b!768714 m!714203))

(assert (=> b!768710 m!714203))

(assert (=> d!101589 m!713797))

(declare-fun m!714205 () Bool)

(assert (=> d!101589 m!714205))

(assert (=> d!101589 m!713819))

(assert (=> b!768718 m!714203))

(assert (=> b!768178 d!101589))

(declare-fun d!101593 () Bool)

(declare-fun lt!341970 () (_ BitVec 32))

(declare-fun lt!341969 () (_ BitVec 32))

(assert (=> d!101593 (= lt!341970 (bvmul (bvxor lt!341969 (bvlshr lt!341969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101593 (= lt!341969 ((_ extract 31 0) (bvand (bvxor lt!341741 (bvlshr lt!341741 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101593 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519800 (let ((h!15351 ((_ extract 31 0) (bvand (bvxor lt!341741 (bvlshr lt!341741 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64717 (bvmul (bvxor h!15351 (bvlshr h!15351 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64717 (bvlshr x!64717 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519800 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519800 #b00000000000000000000000000000000))))))

(assert (=> d!101593 (= (toIndex!0 lt!341741 mask!3328) (bvand (bvxor lt!341970 (bvlshr lt!341970 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768178 d!101593))

(declare-fun d!101595 () Bool)

(declare-fun lt!341976 () (_ BitVec 32))

(assert (=> d!101595 (and (bvsge lt!341976 #b00000000000000000000000000000000) (bvslt lt!341976 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101595 (= lt!341976 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101595 (validMask!0 mask!3328)))

(assert (=> d!101595 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341976)))

(declare-fun bs!21538 () Bool)

(assert (= bs!21538 d!101595))

(declare-fun m!714221 () Bool)

(assert (=> bs!21538 m!714221))

(assert (=> bs!21538 m!713819))

(assert (=> b!768179 d!101595))

(declare-fun b!768730 () Bool)

(declare-fun e!428081 () SeekEntryResult!7853)

(assert (=> b!768730 (= e!428081 (Found!7853 resIntermediateIndex!5))))

(declare-fun b!768731 () Bool)

(declare-fun e!428082 () SeekEntryResult!7853)

(assert (=> b!768731 (= e!428082 e!428081)))

(declare-fun lt!341977 () (_ BitVec 64))

(declare-fun c!84840 () Bool)

(assert (=> b!768731 (= c!84840 (= lt!341977 (select (arr!20253 a!3186) j!159)))))

(declare-fun e!428080 () SeekEntryResult!7853)

(declare-fun b!768732 () Bool)

(assert (=> b!768732 (= e!428080 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768733 () Bool)

(declare-fun c!84841 () Bool)

(assert (=> b!768733 (= c!84841 (= lt!341977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768733 (= e!428081 e!428080)))

(declare-fun b!768734 () Bool)

(assert (=> b!768734 (= e!428080 (MissingVacant!7853 resIntermediateIndex!5))))

(declare-fun b!768729 () Bool)

(assert (=> b!768729 (= e!428082 Undefined!7853)))

(declare-fun d!101601 () Bool)

(declare-fun lt!341978 () SeekEntryResult!7853)

(assert (=> d!101601 (and (or (is-Undefined!7853 lt!341978) (not (is-Found!7853 lt!341978)) (and (bvsge (index!33781 lt!341978) #b00000000000000000000000000000000) (bvslt (index!33781 lt!341978) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341978) (is-Found!7853 lt!341978) (not (is-MissingVacant!7853 lt!341978)) (not (= (index!33783 lt!341978) resIntermediateIndex!5)) (and (bvsge (index!33783 lt!341978) #b00000000000000000000000000000000) (bvslt (index!33783 lt!341978) (size!20674 a!3186)))) (or (is-Undefined!7853 lt!341978) (ite (is-Found!7853 lt!341978) (= (select (arr!20253 a!3186) (index!33781 lt!341978)) (select (arr!20253 a!3186) j!159)) (and (is-MissingVacant!7853 lt!341978) (= (index!33783 lt!341978) resIntermediateIndex!5) (= (select (arr!20253 a!3186) (index!33783 lt!341978)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101601 (= lt!341978 e!428082)))

(declare-fun c!84839 () Bool)

(assert (=> d!101601 (= c!84839 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101601 (= lt!341977 (select (arr!20253 a!3186) resIntermediateIndex!5))))

(assert (=> d!101601 (validMask!0 mask!3328)))

(assert (=> d!101601 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20253 a!3186) j!159) a!3186 mask!3328) lt!341978)))

(assert (= (and d!101601 c!84839) b!768729))

(assert (= (and d!101601 (not c!84839)) b!768731))

(assert (= (and b!768731 c!84840) b!768730))

(assert (= (and b!768731 (not c!84840)) b!768733))

(assert (= (and b!768733 c!84841) b!768734))

(assert (= (and b!768733 (not c!84841)) b!768732))

(declare-fun m!714223 () Bool)

(assert (=> b!768732 m!714223))

(assert (=> b!768732 m!714223))

(assert (=> b!768732 m!713775))

(declare-fun m!714225 () Bool)

(assert (=> b!768732 m!714225))

(declare-fun m!714227 () Bool)

(assert (=> d!101601 m!714227))

(declare-fun m!714229 () Bool)

(assert (=> d!101601 m!714229))

(assert (=> d!101601 m!713795))

(assert (=> d!101601 m!713819))

(assert (=> b!768190 d!101601))

(push 1)

(assert (not d!101507))

(assert (not b!768692))

(assert (not b!768404))

(assert (not b!768677))

(assert (not b!768676))

(assert (not b!768383))

(assert (not d!101579))

(assert (not d!101601))

(assert (not d!101585))

(assert (not d!101513))

(assert (not d!101543))

(assert (not d!101569))

(assert (not b!768682))

(assert (not b!768405))

(assert (not b!768591))

(assert (not b!768520))

(assert (not bm!35088))

(assert (not d!101525))

(assert (not d!101583))

(assert (not b!768712))

(assert (not b!768663))

(assert (not b!768458))

(assert (not b!768656))

(assert (not d!101595))

(assert (not b!768732))

(assert (not bm!35097))

(assert (not b!768697))

(assert (not d!101589))

(assert (not b!768655))

(assert (not bm!35099))

(assert (not b!768653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!101601 d!101555))

(assert (=> d!101513 d!101543))

(assert (=> d!101513 d!101551))

