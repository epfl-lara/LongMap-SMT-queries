; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64942 () Bool)

(assert start!64942)

(declare-fun e!410298 () Bool)

(declare-datatypes ((array!41253 0))(
  ( (array!41254 (arr!19743 (Array (_ BitVec 32) (_ BitVec 64))) (size!20164 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41253)

(declare-datatypes ((SeekEntryResult!7343 0))(
  ( (MissingZero!7343 (index!31740 (_ BitVec 32))) (Found!7343 (index!31741 (_ BitVec 32))) (Intermediate!7343 (undefined!8155 Bool) (index!31742 (_ BitVec 32)) (x!62733 (_ BitVec 32))) (Undefined!7343) (MissingVacant!7343 (index!31743 (_ BitVec 32))) )
))
(declare-fun lt!324989 () SeekEntryResult!7343)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!733275 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41253 (_ BitVec 32)) SeekEntryResult!7343)

(assert (=> b!733275 (= e!410298 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19743 a!3186) j!159) a!3186 mask!3328) lt!324989))))

(declare-fun b!733276 () Bool)

(declare-fun res!492781 () Bool)

(declare-fun e!410297 () Bool)

(assert (=> b!733276 (=> (not res!492781) (not e!410297))))

(assert (=> b!733276 (= res!492781 e!410298)))

(declare-fun c!80626 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733276 (= c!80626 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733277 () Bool)

(declare-fun res!492792 () Bool)

(declare-fun e!410294 () Bool)

(assert (=> b!733277 (=> (not res!492792) (not e!410294))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733277 (= res!492792 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733278 () Bool)

(declare-fun res!492784 () Bool)

(declare-fun e!410300 () Bool)

(assert (=> b!733278 (=> (not res!492784) (not e!410300))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!733278 (= res!492784 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20164 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20164 a!3186))))))

(declare-fun b!733279 () Bool)

(declare-fun e!410293 () Bool)

(assert (=> b!733279 (= e!410293 true)))

(declare-fun lt!324994 () SeekEntryResult!7343)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41253 (_ BitVec 32)) SeekEntryResult!7343)

(assert (=> b!733279 (= lt!324994 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19743 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733280 () Bool)

(declare-fun res!492778 () Bool)

(assert (=> b!733280 (=> (not res!492778) (not e!410294))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733280 (= res!492778 (and (= (size!20164 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20164 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20164 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733282 () Bool)

(declare-fun res!492787 () Bool)

(assert (=> b!733282 (=> (not res!492787) (not e!410294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733282 (= res!492787 (validKeyInArray!0 k!2102))))

(declare-fun b!733283 () Bool)

(assert (=> b!733283 (= e!410300 e!410297)))

(declare-fun res!492789 () Bool)

(assert (=> b!733283 (=> (not res!492789) (not e!410297))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733283 (= res!492789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19743 a!3186) j!159) mask!3328) (select (arr!19743 a!3186) j!159) a!3186 mask!3328) lt!324989))))

(assert (=> b!733283 (= lt!324989 (Intermediate!7343 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733284 () Bool)

(declare-fun e!410295 () Bool)

(declare-fun e!410291 () Bool)

(assert (=> b!733284 (= e!410295 (not e!410291))))

(declare-fun res!492782 () Bool)

(assert (=> b!733284 (=> res!492782 e!410291)))

(declare-fun lt!324993 () SeekEntryResult!7343)

(assert (=> b!733284 (= res!492782 (or (not (is-Intermediate!7343 lt!324993)) (bvsge x!1131 (x!62733 lt!324993))))))

(declare-fun e!410296 () Bool)

(assert (=> b!733284 e!410296))

(declare-fun res!492785 () Bool)

(assert (=> b!733284 (=> (not res!492785) (not e!410296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41253 (_ BitVec 32)) Bool)

(assert (=> b!733284 (= res!492785 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25004 0))(
  ( (Unit!25005) )
))
(declare-fun lt!324991 () Unit!25004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25004)

(assert (=> b!733284 (= lt!324991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733285 () Bool)

(declare-fun res!492779 () Bool)

(assert (=> b!733285 (=> (not res!492779) (not e!410300))))

(assert (=> b!733285 (= res!492779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733286 () Bool)

(declare-fun e!410299 () Bool)

(assert (=> b!733286 (= e!410296 e!410299)))

(declare-fun res!492780 () Bool)

(assert (=> b!733286 (=> (not res!492780) (not e!410299))))

(declare-fun lt!324996 () SeekEntryResult!7343)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41253 (_ BitVec 32)) SeekEntryResult!7343)

(assert (=> b!733286 (= res!492780 (= (seekEntryOrOpen!0 (select (arr!19743 a!3186) j!159) a!3186 mask!3328) lt!324996))))

(assert (=> b!733286 (= lt!324996 (Found!7343 j!159))))

(declare-fun b!733287 () Bool)

(assert (=> b!733287 (= e!410291 e!410293)))

(declare-fun res!492793 () Bool)

(assert (=> b!733287 (=> res!492793 e!410293)))

(assert (=> b!733287 (= res!492793 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324998 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733287 (= lt!324998 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733288 () Bool)

(assert (=> b!733288 (= e!410297 e!410295)))

(declare-fun res!492788 () Bool)

(assert (=> b!733288 (=> (not res!492788) (not e!410295))))

(declare-fun lt!324997 () SeekEntryResult!7343)

(assert (=> b!733288 (= res!492788 (= lt!324997 lt!324993))))

(declare-fun lt!324990 () array!41253)

(declare-fun lt!324995 () (_ BitVec 64))

(assert (=> b!733288 (= lt!324993 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324995 lt!324990 mask!3328))))

(assert (=> b!733288 (= lt!324997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324995 mask!3328) lt!324995 lt!324990 mask!3328))))

(assert (=> b!733288 (= lt!324995 (select (store (arr!19743 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!733288 (= lt!324990 (array!41254 (store (arr!19743 a!3186) i!1173 k!2102) (size!20164 a!3186)))))

(declare-fun b!733289 () Bool)

(declare-fun res!492790 () Bool)

(assert (=> b!733289 (=> (not res!492790) (not e!410300))))

(declare-datatypes ((List!13745 0))(
  ( (Nil!13742) (Cons!13741 (h!14807 (_ BitVec 64)) (t!20060 List!13745)) )
))
(declare-fun arrayNoDuplicates!0 (array!41253 (_ BitVec 32) List!13745) Bool)

(assert (=> b!733289 (= res!492790 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13742))))

(declare-fun b!733290 () Bool)

(declare-fun res!492794 () Bool)

(assert (=> b!733290 (=> (not res!492794) (not e!410297))))

(assert (=> b!733290 (= res!492794 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19743 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733291 () Bool)

(assert (=> b!733291 (= e!410299 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19743 a!3186) j!159) a!3186 mask!3328) lt!324996))))

(declare-fun res!492791 () Bool)

(assert (=> start!64942 (=> (not res!492791) (not e!410294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64942 (= res!492791 (validMask!0 mask!3328))))

(assert (=> start!64942 e!410294))

(assert (=> start!64942 true))

(declare-fun array_inv!15539 (array!41253) Bool)

(assert (=> start!64942 (array_inv!15539 a!3186)))

(declare-fun b!733281 () Bool)

(assert (=> b!733281 (= e!410294 e!410300)))

(declare-fun res!492786 () Bool)

(assert (=> b!733281 (=> (not res!492786) (not e!410300))))

(declare-fun lt!324992 () SeekEntryResult!7343)

(assert (=> b!733281 (= res!492786 (or (= lt!324992 (MissingZero!7343 i!1173)) (= lt!324992 (MissingVacant!7343 i!1173))))))

(assert (=> b!733281 (= lt!324992 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!733292 () Bool)

(assert (=> b!733292 (= e!410298 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19743 a!3186) j!159) a!3186 mask!3328) (Found!7343 j!159)))))

(declare-fun b!733293 () Bool)

(declare-fun res!492783 () Bool)

(assert (=> b!733293 (=> (not res!492783) (not e!410294))))

(assert (=> b!733293 (= res!492783 (validKeyInArray!0 (select (arr!19743 a!3186) j!159)))))

(assert (= (and start!64942 res!492791) b!733280))

(assert (= (and b!733280 res!492778) b!733293))

(assert (= (and b!733293 res!492783) b!733282))

(assert (= (and b!733282 res!492787) b!733277))

(assert (= (and b!733277 res!492792) b!733281))

(assert (= (and b!733281 res!492786) b!733285))

(assert (= (and b!733285 res!492779) b!733289))

(assert (= (and b!733289 res!492790) b!733278))

(assert (= (and b!733278 res!492784) b!733283))

(assert (= (and b!733283 res!492789) b!733290))

(assert (= (and b!733290 res!492794) b!733276))

(assert (= (and b!733276 c!80626) b!733275))

(assert (= (and b!733276 (not c!80626)) b!733292))

(assert (= (and b!733276 res!492781) b!733288))

(assert (= (and b!733288 res!492788) b!733284))

(assert (= (and b!733284 res!492785) b!733286))

(assert (= (and b!733286 res!492780) b!733291))

(assert (= (and b!733284 (not res!492782)) b!733287))

(assert (= (and b!733287 (not res!492793)) b!733279))

(declare-fun m!686191 () Bool)

(assert (=> b!733291 m!686191))

(assert (=> b!733291 m!686191))

(declare-fun m!686193 () Bool)

(assert (=> b!733291 m!686193))

(declare-fun m!686195 () Bool)

(assert (=> b!733281 m!686195))

(assert (=> b!733275 m!686191))

(assert (=> b!733275 m!686191))

(declare-fun m!686197 () Bool)

(assert (=> b!733275 m!686197))

(declare-fun m!686199 () Bool)

(assert (=> b!733285 m!686199))

(assert (=> b!733293 m!686191))

(assert (=> b!733293 m!686191))

(declare-fun m!686201 () Bool)

(assert (=> b!733293 m!686201))

(assert (=> b!733283 m!686191))

(assert (=> b!733283 m!686191))

(declare-fun m!686203 () Bool)

(assert (=> b!733283 m!686203))

(assert (=> b!733283 m!686203))

(assert (=> b!733283 m!686191))

(declare-fun m!686205 () Bool)

(assert (=> b!733283 m!686205))

(declare-fun m!686207 () Bool)

(assert (=> b!733287 m!686207))

(assert (=> b!733286 m!686191))

(assert (=> b!733286 m!686191))

(declare-fun m!686209 () Bool)

(assert (=> b!733286 m!686209))

(declare-fun m!686211 () Bool)

(assert (=> b!733288 m!686211))

(declare-fun m!686213 () Bool)

(assert (=> b!733288 m!686213))

(declare-fun m!686215 () Bool)

(assert (=> b!733288 m!686215))

(declare-fun m!686217 () Bool)

(assert (=> b!733288 m!686217))

(declare-fun m!686219 () Bool)

(assert (=> b!733288 m!686219))

(assert (=> b!733288 m!686213))

(declare-fun m!686221 () Bool)

(assert (=> b!733290 m!686221))

(declare-fun m!686223 () Bool)

(assert (=> b!733289 m!686223))

(assert (=> b!733292 m!686191))

(assert (=> b!733292 m!686191))

(declare-fun m!686225 () Bool)

(assert (=> b!733292 m!686225))

(declare-fun m!686227 () Bool)

(assert (=> b!733284 m!686227))

(declare-fun m!686229 () Bool)

(assert (=> b!733284 m!686229))

(declare-fun m!686231 () Bool)

(assert (=> start!64942 m!686231))

(declare-fun m!686233 () Bool)

(assert (=> start!64942 m!686233))

(declare-fun m!686235 () Bool)

(assert (=> b!733282 m!686235))

(declare-fun m!686237 () Bool)

(assert (=> b!733277 m!686237))

(assert (=> b!733279 m!686191))

(assert (=> b!733279 m!686191))

(assert (=> b!733279 m!686225))

(push 1)

