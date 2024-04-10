; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65282 () Bool)

(assert start!65282)

(declare-fun b!740975 () Bool)

(declare-fun res!498349 () Bool)

(declare-fun e!414238 () Bool)

(assert (=> b!740975 (=> (not res!498349) (not e!414238))))

(declare-datatypes ((array!41455 0))(
  ( (array!41456 (arr!19841 (Array (_ BitVec 32) (_ BitVec 64))) (size!20262 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41455)

(declare-datatypes ((List!13843 0))(
  ( (Nil!13840) (Cons!13839 (h!14911 (_ BitVec 64)) (t!20158 List!13843)) )
))
(declare-fun arrayNoDuplicates!0 (array!41455 (_ BitVec 32) List!13843) Bool)

(assert (=> b!740975 (= res!498349 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13840))))

(declare-fun b!740976 () Bool)

(declare-fun res!498358 () Bool)

(declare-fun e!414234 () Bool)

(assert (=> b!740976 (=> res!498358 e!414234)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!329218 () array!41455)

(declare-fun lt!329223 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7441 0))(
  ( (MissingZero!7441 (index!32132 (_ BitVec 32))) (Found!7441 (index!32133 (_ BitVec 32))) (Intermediate!7441 (undefined!8253 Bool) (index!32134 (_ BitVec 32)) (x!63111 (_ BitVec 32))) (Undefined!7441) (MissingVacant!7441 (index!32135 (_ BitVec 32))) )
))
(declare-fun lt!329231 () SeekEntryResult!7441)

(declare-fun lt!329228 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41455 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!740976 (= res!498358 (not (= lt!329231 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329223 lt!329228 lt!329218 mask!3328))))))

(declare-fun b!740977 () Bool)

(declare-fun res!498352 () Bool)

(declare-fun e!414235 () Bool)

(assert (=> b!740977 (=> (not res!498352) (not e!414235))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740977 (= res!498352 (validKeyInArray!0 k!2102))))

(declare-fun b!740978 () Bool)

(declare-fun e!414233 () Bool)

(declare-fun e!414229 () Bool)

(assert (=> b!740978 (= e!414233 e!414229)))

(declare-fun res!498354 () Bool)

(assert (=> b!740978 (=> (not res!498354) (not e!414229))))

(declare-fun lt!329221 () SeekEntryResult!7441)

(assert (=> b!740978 (= res!498354 (= lt!329231 lt!329221))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!740978 (= lt!329221 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329228 lt!329218 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740978 (= lt!329231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329228 mask!3328) lt!329228 lt!329218 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740978 (= lt!329228 (select (store (arr!19841 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740978 (= lt!329218 (array!41456 (store (arr!19841 a!3186) i!1173 k!2102) (size!20262 a!3186)))))

(declare-fun b!740979 () Bool)

(declare-fun res!498351 () Bool)

(assert (=> b!740979 (=> (not res!498351) (not e!414235))))

(declare-fun arrayContainsKey!0 (array!41455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740979 (= res!498351 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!414227 () Bool)

(declare-fun b!740980 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!329222 () SeekEntryResult!7441)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41455 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!740980 (= e!414227 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329222))))

(declare-fun b!740982 () Bool)

(declare-fun res!498346 () Bool)

(assert (=> b!740982 (=> (not res!498346) (not e!414235))))

(assert (=> b!740982 (= res!498346 (validKeyInArray!0 (select (arr!19841 a!3186) j!159)))))

(declare-fun e!414228 () Bool)

(declare-fun b!740983 () Bool)

(assert (=> b!740983 (= e!414228 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) (Found!7441 j!159)))))

(declare-fun e!414236 () Bool)

(declare-fun b!740984 () Bool)

(declare-fun lt!329229 () SeekEntryResult!7441)

(assert (=> b!740984 (= e!414236 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329223 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329229)))))

(declare-fun b!740985 () Bool)

(declare-fun e!414230 () Bool)

(assert (=> b!740985 (= e!414230 (validKeyInArray!0 lt!329228))))

(declare-fun b!740986 () Bool)

(declare-fun e!414237 () Bool)

(assert (=> b!740986 (= e!414237 e!414234)))

(declare-fun res!498356 () Bool)

(assert (=> b!740986 (=> res!498356 e!414234)))

(assert (=> b!740986 (= res!498356 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329223 #b00000000000000000000000000000000) (bvsge lt!329223 (size!20262 a!3186))))))

(declare-datatypes ((Unit!25360 0))(
  ( (Unit!25361) )
))
(declare-fun lt!329226 () Unit!25360)

(declare-fun e!414239 () Unit!25360)

(assert (=> b!740986 (= lt!329226 e!414239)))

(declare-fun c!81698 () Bool)

(declare-fun lt!329230 () Bool)

(assert (=> b!740986 (= c!81698 lt!329230)))

(assert (=> b!740986 (= lt!329230 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740986 (= lt!329223 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740987 () Bool)

(declare-fun e!414231 () Bool)

(assert (=> b!740987 (= e!414231 e!414227)))

(declare-fun res!498340 () Bool)

(assert (=> b!740987 (=> (not res!498340) (not e!414227))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41455 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!740987 (= res!498340 (= (seekEntryOrOpen!0 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329222))))

(assert (=> b!740987 (= lt!329222 (Found!7441 j!159))))

(declare-fun b!740988 () Bool)

(declare-fun Unit!25362 () Unit!25360)

(assert (=> b!740988 (= e!414239 Unit!25362)))

(declare-fun lt!329224 () SeekEntryResult!7441)

(assert (=> b!740988 (= lt!329224 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19841 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!329225 () SeekEntryResult!7441)

(assert (=> b!740988 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329223 resIntermediateIndex!5 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329225)))

(declare-fun b!740989 () Bool)

(declare-fun res!498343 () Bool)

(assert (=> b!740989 (=> (not res!498343) (not e!414233))))

(assert (=> b!740989 (= res!498343 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19841 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740990 () Bool)

(declare-fun Unit!25363 () Unit!25360)

(assert (=> b!740990 (= e!414239 Unit!25363)))

(assert (=> b!740990 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329223 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329229)))

(declare-fun b!740991 () Bool)

(declare-fun res!498350 () Bool)

(assert (=> b!740991 (=> res!498350 e!414234)))

(assert (=> b!740991 (= res!498350 e!414236)))

(declare-fun c!81699 () Bool)

(assert (=> b!740991 (= c!81699 lt!329230)))

(declare-fun b!740992 () Bool)

(assert (=> b!740992 (= e!414238 e!414233)))

(declare-fun res!498348 () Bool)

(assert (=> b!740992 (=> (not res!498348) (not e!414233))))

(assert (=> b!740992 (= res!498348 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19841 a!3186) j!159) mask!3328) (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329229))))

(assert (=> b!740992 (= lt!329229 (Intermediate!7441 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740993 () Bool)

(assert (=> b!740993 (= e!414229 (not e!414237))))

(declare-fun res!498342 () Bool)

(assert (=> b!740993 (=> res!498342 e!414237)))

(assert (=> b!740993 (= res!498342 (or (not (is-Intermediate!7441 lt!329221)) (bvsge x!1131 (x!63111 lt!329221))))))

(assert (=> b!740993 (= lt!329225 (Found!7441 j!159))))

(assert (=> b!740993 e!414231))

(declare-fun res!498355 () Bool)

(assert (=> b!740993 (=> (not res!498355) (not e!414231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41455 (_ BitVec 32)) Bool)

(assert (=> b!740993 (= res!498355 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!329219 () Unit!25360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25360)

(assert (=> b!740993 (= lt!329219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740994 () Bool)

(declare-fun res!498344 () Bool)

(assert (=> b!740994 (=> (not res!498344) (not e!414238))))

(assert (=> b!740994 (= res!498344 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20262 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20262 a!3186))))))

(declare-fun res!498359 () Bool)

(assert (=> start!65282 (=> (not res!498359) (not e!414235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65282 (= res!498359 (validMask!0 mask!3328))))

(assert (=> start!65282 e!414235))

(assert (=> start!65282 true))

(declare-fun array_inv!15637 (array!41455) Bool)

(assert (=> start!65282 (array_inv!15637 a!3186)))

(declare-fun b!740981 () Bool)

(declare-fun res!498357 () Bool)

(assert (=> b!740981 (=> (not res!498357) (not e!414235))))

(assert (=> b!740981 (= res!498357 (and (= (size!20262 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20262 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20262 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740995 () Bool)

(assert (=> b!740995 (= e!414235 e!414238)))

(declare-fun res!498345 () Bool)

(assert (=> b!740995 (=> (not res!498345) (not e!414238))))

(declare-fun lt!329227 () SeekEntryResult!7441)

(assert (=> b!740995 (= res!498345 (or (= lt!329227 (MissingZero!7441 i!1173)) (= lt!329227 (MissingVacant!7441 i!1173))))))

(assert (=> b!740995 (= lt!329227 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740996 () Bool)

(assert (=> b!740996 (= e!414234 e!414230)))

(declare-fun res!498353 () Bool)

(assert (=> b!740996 (=> res!498353 e!414230)))

(assert (=> b!740996 (= res!498353 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!740996 (= (seekEntryOrOpen!0 lt!329228 lt!329218 mask!3328) lt!329225)))

(declare-fun lt!329220 () Unit!25360)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25360)

(assert (=> b!740996 (= lt!329220 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!329223 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740997 () Bool)

(assert (=> b!740997 (= e!414228 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329229))))

(declare-fun b!740998 () Bool)

(declare-fun res!498341 () Bool)

(assert (=> b!740998 (=> (not res!498341) (not e!414238))))

(assert (=> b!740998 (= res!498341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740999 () Bool)

(declare-fun res!498347 () Bool)

(assert (=> b!740999 (=> (not res!498347) (not e!414233))))

(assert (=> b!740999 (= res!498347 e!414228)))

(declare-fun c!81700 () Bool)

(assert (=> b!740999 (= c!81700 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741000 () Bool)

(assert (=> b!741000 (= e!414236 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329223 resIntermediateIndex!5 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329225)))))

(assert (= (and start!65282 res!498359) b!740981))

(assert (= (and b!740981 res!498357) b!740982))

(assert (= (and b!740982 res!498346) b!740977))

(assert (= (and b!740977 res!498352) b!740979))

(assert (= (and b!740979 res!498351) b!740995))

(assert (= (and b!740995 res!498345) b!740998))

(assert (= (and b!740998 res!498341) b!740975))

(assert (= (and b!740975 res!498349) b!740994))

(assert (= (and b!740994 res!498344) b!740992))

(assert (= (and b!740992 res!498348) b!740989))

(assert (= (and b!740989 res!498343) b!740999))

(assert (= (and b!740999 c!81700) b!740997))

(assert (= (and b!740999 (not c!81700)) b!740983))

(assert (= (and b!740999 res!498347) b!740978))

(assert (= (and b!740978 res!498354) b!740993))

(assert (= (and b!740993 res!498355) b!740987))

(assert (= (and b!740987 res!498340) b!740980))

(assert (= (and b!740993 (not res!498342)) b!740986))

(assert (= (and b!740986 c!81698) b!740990))

(assert (= (and b!740986 (not c!81698)) b!740988))

(assert (= (and b!740986 (not res!498356)) b!740991))

(assert (= (and b!740991 c!81699) b!740984))

(assert (= (and b!740991 (not c!81699)) b!741000))

(assert (= (and b!740991 (not res!498350)) b!740976))

(assert (= (and b!740976 (not res!498358)) b!740996))

(assert (= (and b!740996 (not res!498353)) b!740985))

(declare-fun m!691987 () Bool)

(assert (=> b!741000 m!691987))

(assert (=> b!741000 m!691987))

(declare-fun m!691989 () Bool)

(assert (=> b!741000 m!691989))

(declare-fun m!691991 () Bool)

(assert (=> start!65282 m!691991))

(declare-fun m!691993 () Bool)

(assert (=> start!65282 m!691993))

(declare-fun m!691995 () Bool)

(assert (=> b!740996 m!691995))

(declare-fun m!691997 () Bool)

(assert (=> b!740996 m!691997))

(assert (=> b!740980 m!691987))

(assert (=> b!740980 m!691987))

(declare-fun m!691999 () Bool)

(assert (=> b!740980 m!691999))

(declare-fun m!692001 () Bool)

(assert (=> b!740995 m!692001))

(assert (=> b!740983 m!691987))

(assert (=> b!740983 m!691987))

(declare-fun m!692003 () Bool)

(assert (=> b!740983 m!692003))

(declare-fun m!692005 () Bool)

(assert (=> b!740986 m!692005))

(assert (=> b!740992 m!691987))

(assert (=> b!740992 m!691987))

(declare-fun m!692007 () Bool)

(assert (=> b!740992 m!692007))

(assert (=> b!740992 m!692007))

(assert (=> b!740992 m!691987))

(declare-fun m!692009 () Bool)

(assert (=> b!740992 m!692009))

(declare-fun m!692011 () Bool)

(assert (=> b!740976 m!692011))

(assert (=> b!740982 m!691987))

(assert (=> b!740982 m!691987))

(declare-fun m!692013 () Bool)

(assert (=> b!740982 m!692013))

(assert (=> b!740997 m!691987))

(assert (=> b!740997 m!691987))

(declare-fun m!692015 () Bool)

(assert (=> b!740997 m!692015))

(declare-fun m!692017 () Bool)

(assert (=> b!740977 m!692017))

(assert (=> b!740987 m!691987))

(assert (=> b!740987 m!691987))

(declare-fun m!692019 () Bool)

(assert (=> b!740987 m!692019))

(assert (=> b!740984 m!691987))

(assert (=> b!740984 m!691987))

(declare-fun m!692021 () Bool)

(assert (=> b!740984 m!692021))

(declare-fun m!692023 () Bool)

(assert (=> b!740979 m!692023))

(declare-fun m!692025 () Bool)

(assert (=> b!740975 m!692025))

(declare-fun m!692027 () Bool)

(assert (=> b!740989 m!692027))

(assert (=> b!740988 m!691987))

(assert (=> b!740988 m!691987))

(assert (=> b!740988 m!692003))

(assert (=> b!740988 m!691987))

(assert (=> b!740988 m!691989))

(declare-fun m!692029 () Bool)

(assert (=> b!740998 m!692029))

(declare-fun m!692031 () Bool)

(assert (=> b!740978 m!692031))

(declare-fun m!692033 () Bool)

(assert (=> b!740978 m!692033))

(declare-fun m!692035 () Bool)

(assert (=> b!740978 m!692035))

(declare-fun m!692037 () Bool)

(assert (=> b!740978 m!692037))

(assert (=> b!740978 m!692031))

(declare-fun m!692039 () Bool)

(assert (=> b!740978 m!692039))

(declare-fun m!692041 () Bool)

(assert (=> b!740985 m!692041))

(declare-fun m!692043 () Bool)

(assert (=> b!740993 m!692043))

(declare-fun m!692045 () Bool)

(assert (=> b!740993 m!692045))

(assert (=> b!740990 m!691987))

(assert (=> b!740990 m!691987))

(assert (=> b!740990 m!692021))

(push 1)

(assert (not b!740988))

(assert (not b!740996))

(assert (not b!740983))

(assert (not b!740979))

(assert (not b!740990))

(assert (not b!740992))

(assert (not b!740986))

(assert (not b!740977))

(assert (not b!740993))

(assert (not b!741000))

(assert (not b!740982))

(assert (not b!740984))

(assert (not start!65282))

(assert (not b!740997))

(assert (not b!740975))

(assert (not b!740995))

(assert (not b!740985))

(assert (not b!740976))

(assert (not b!740980))

(assert (not b!740978))

(assert (not b!740998))

(assert (not b!740987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

