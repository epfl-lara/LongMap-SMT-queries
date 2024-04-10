; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63890 () Bool)

(assert start!63890)

(declare-fun b!718043 () Bool)

(declare-fun res!480620 () Bool)

(declare-fun e!403129 () Bool)

(assert (=> b!718043 (=> (not res!480620) (not e!403129))))

(declare-datatypes ((array!40669 0))(
  ( (array!40670 (arr!19463 (Array (_ BitVec 32) (_ BitVec 64))) (size!19884 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40669)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40669 (_ BitVec 32)) Bool)

(assert (=> b!718043 (= res!480620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718044 () Bool)

(declare-fun res!480619 () Bool)

(declare-fun e!403128 () Bool)

(assert (=> b!718044 (=> (not res!480619) (not e!403128))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718044 (= res!480619 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718045 () Bool)

(assert (=> b!718045 (= e!403128 e!403129)))

(declare-fun res!480617 () Bool)

(assert (=> b!718045 (=> (not res!480617) (not e!403129))))

(declare-datatypes ((SeekEntryResult!7063 0))(
  ( (MissingZero!7063 (index!30620 (_ BitVec 32))) (Found!7063 (index!30621 (_ BitVec 32))) (Intermediate!7063 (undefined!7875 Bool) (index!30622 (_ BitVec 32)) (x!61635 (_ BitVec 32))) (Undefined!7063) (MissingVacant!7063 (index!30623 (_ BitVec 32))) )
))
(declare-fun lt!319256 () SeekEntryResult!7063)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718045 (= res!480617 (or (= lt!319256 (MissingZero!7063 i!1173)) (= lt!319256 (MissingVacant!7063 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40669 (_ BitVec 32)) SeekEntryResult!7063)

(assert (=> b!718045 (= lt!319256 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718046 () Bool)

(declare-fun res!480618 () Bool)

(assert (=> b!718046 (=> (not res!480618) (not e!403128))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718046 (= res!480618 (and (= (size!19884 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19884 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19884 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718047 () Bool)

(declare-fun res!480615 () Bool)

(assert (=> b!718047 (=> (not res!480615) (not e!403128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718047 (= res!480615 (validKeyInArray!0 k!2102))))

(declare-fun b!718048 () Bool)

(declare-fun res!480613 () Bool)

(assert (=> b!718048 (=> (not res!480613) (not e!403128))))

(assert (=> b!718048 (= res!480613 (validKeyInArray!0 (select (arr!19463 a!3186) j!159)))))

(declare-fun res!480614 () Bool)

(assert (=> start!63890 (=> (not res!480614) (not e!403128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63890 (= res!480614 (validMask!0 mask!3328))))

(assert (=> start!63890 e!403128))

(assert (=> start!63890 true))

(declare-fun array_inv!15259 (array!40669) Bool)

(assert (=> start!63890 (array_inv!15259 a!3186)))

(declare-fun b!718049 () Bool)

(declare-fun res!480616 () Bool)

(assert (=> b!718049 (=> (not res!480616) (not e!403129))))

(declare-datatypes ((List!13465 0))(
  ( (Nil!13462) (Cons!13461 (h!14506 (_ BitVec 64)) (t!19780 List!13465)) )
))
(declare-fun arrayNoDuplicates!0 (array!40669 (_ BitVec 32) List!13465) Bool)

(assert (=> b!718049 (= res!480616 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13462))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!718050 () Bool)

(assert (=> b!718050 (= e!403129 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19884 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19884 a!3186)) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(assert (= (and start!63890 res!480614) b!718046))

(assert (= (and b!718046 res!480618) b!718048))

(assert (= (and b!718048 res!480613) b!718047))

(assert (= (and b!718047 res!480615) b!718044))

(assert (= (and b!718044 res!480619) b!718045))

(assert (= (and b!718045 res!480617) b!718043))

(assert (= (and b!718043 res!480620) b!718049))

(assert (= (and b!718049 res!480616) b!718050))

(declare-fun m!673807 () Bool)

(assert (=> b!718049 m!673807))

(declare-fun m!673809 () Bool)

(assert (=> b!718045 m!673809))

(declare-fun m!673811 () Bool)

(assert (=> b!718043 m!673811))

(declare-fun m!673813 () Bool)

(assert (=> b!718044 m!673813))

(declare-fun m!673815 () Bool)

(assert (=> b!718048 m!673815))

(assert (=> b!718048 m!673815))

(declare-fun m!673817 () Bool)

(assert (=> b!718048 m!673817))

(declare-fun m!673819 () Bool)

(assert (=> start!63890 m!673819))

(declare-fun m!673821 () Bool)

(assert (=> start!63890 m!673821))

(declare-fun m!673823 () Bool)

(assert (=> b!718047 m!673823))

(push 1)

(assert (not start!63890))

(assert (not b!718049))

(assert (not b!718043))

(assert (not b!718048))

(assert (not b!718044))

(assert (not b!718045))

(assert (not b!718047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98967 () Bool)

(assert (=> d!98967 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718047 d!98967))

(declare-fun d!98969 () Bool)

(assert (=> d!98969 (= (validKeyInArray!0 (select (arr!19463 a!3186) j!159)) (and (not (= (select (arr!19463 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19463 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718048 d!98969))

(declare-fun d!98971 () Bool)

(assert (=> d!98971 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63890 d!98971))

(declare-fun d!98975 () Bool)

(assert (=> d!98975 (= (array_inv!15259 a!3186) (bvsge (size!19884 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63890 d!98975))

(declare-fun b!718098 () Bool)

(declare-fun e!403165 () Bool)

(declare-fun call!34719 () Bool)

(assert (=> b!718098 (= e!403165 call!34719)))

(declare-fun d!98977 () Bool)

(declare-fun res!480641 () Bool)

(declare-fun e!403164 () Bool)

(assert (=> d!98977 (=> res!480641 e!403164)))

(assert (=> d!98977 (= res!480641 (bvsge #b00000000000000000000000000000000 (size!19884 a!3186)))))

(assert (=> d!98977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403164)))

(declare-fun b!718099 () Bool)

(declare-fun e!403166 () Bool)

(assert (=> b!718099 (= e!403166 call!34719)))

(declare-fun bm!34716 () Bool)

(assert (=> bm!34716 (= call!34719 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!718100 () Bool)

(assert (=> b!718100 (= e!403164 e!403165)))

(declare-fun c!79096 () Bool)

(assert (=> b!718100 (= c!79096 (validKeyInArray!0 (select (arr!19463 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718101 () Bool)

(assert (=> b!718101 (= e!403165 e!403166)))

(declare-fun lt!319272 () (_ BitVec 64))

(assert (=> b!718101 (= lt!319272 (select (arr!19463 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24662 0))(
  ( (Unit!24663) )
))
(declare-fun lt!319274 () Unit!24662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40669 (_ BitVec 64) (_ BitVec 32)) Unit!24662)

(assert (=> b!718101 (= lt!319274 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319272 #b00000000000000000000000000000000))))

(assert (=> b!718101 (arrayContainsKey!0 a!3186 lt!319272 #b00000000000000000000000000000000)))

(declare-fun lt!319273 () Unit!24662)

(assert (=> b!718101 (= lt!319273 lt!319274)))

(declare-fun res!480640 () Bool)

(assert (=> b!718101 (= res!480640 (= (seekEntryOrOpen!0 (select (arr!19463 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7063 #b00000000000000000000000000000000)))))

(assert (=> b!718101 (=> (not res!480640) (not e!403166))))

(assert (= (and d!98977 (not res!480641)) b!718100))

(assert (= (and b!718100 c!79096) b!718101))

(assert (= (and b!718100 (not c!79096)) b!718098))

(assert (= (and b!718101 res!480640) b!718099))

(assert (= (or b!718099 b!718098) bm!34716))

(declare-fun m!673851 () Bool)

(assert (=> bm!34716 m!673851))

(declare-fun m!673853 () Bool)

(assert (=> b!718100 m!673853))

(assert (=> b!718100 m!673853))

(declare-fun m!673855 () Bool)

(assert (=> b!718100 m!673855))

(assert (=> b!718101 m!673853))

(declare-fun m!673857 () Bool)

(assert (=> b!718101 m!673857))

(declare-fun m!673859 () Bool)

(assert (=> b!718101 m!673859))

(assert (=> b!718101 m!673853))

(declare-fun m!673861 () Bool)

(assert (=> b!718101 m!673861))

(assert (=> b!718043 d!98977))

(declare-fun d!98989 () Bool)

(declare-fun res!480656 () Bool)

(declare-fun e!403183 () Bool)

(assert (=> d!98989 (=> res!480656 e!403183)))

(assert (=> d!98989 (= res!480656 (= (select (arr!19463 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98989 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!403183)))

(declare-fun b!718120 () Bool)

(declare-fun e!403184 () Bool)

(assert (=> b!718120 (= e!403183 e!403184)))

(declare-fun res!480657 () Bool)

(assert (=> b!718120 (=> (not res!480657) (not e!403184))))

(assert (=> b!718120 (= res!480657 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19884 a!3186)))))

(declare-fun b!718121 () Bool)

(assert (=> b!718121 (= e!403184 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98989 (not res!480656)) b!718120))

(assert (= (and b!718120 res!480657) b!718121))

(assert (=> d!98989 m!673853))

(declare-fun m!673863 () Bool)

(assert (=> b!718121 m!673863))

