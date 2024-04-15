; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65498 () Bool)

(assert start!65498)

(declare-fun b!747284 () Bool)

(declare-fun e!417196 () Bool)

(declare-fun lt!332039 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747284 (= e!417196 (validKeyInArray!0 lt!332039))))

(declare-fun b!747285 () Bool)

(declare-fun res!504021 () Bool)

(declare-fun e!417198 () Bool)

(assert (=> b!747285 (=> (not res!504021) (not e!417198))))

(declare-datatypes ((array!41688 0))(
  ( (array!41689 (arr!19958 (Array (_ BitVec 32) (_ BitVec 64))) (size!20379 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41688)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747285 (= res!504021 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747286 () Bool)

(declare-fun res!504031 () Bool)

(assert (=> b!747286 (=> (not res!504031) (not e!417198))))

(assert (=> b!747286 (= res!504031 (validKeyInArray!0 k0!2102))))

(declare-fun b!747287 () Bool)

(declare-fun res!504027 () Bool)

(assert (=> b!747287 (=> (not res!504027) (not e!417198))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747287 (= res!504027 (validKeyInArray!0 (select (arr!19958 a!3186) j!159)))))

(declare-fun b!747288 () Bool)

(declare-fun e!417199 () Bool)

(declare-fun e!417197 () Bool)

(assert (=> b!747288 (= e!417199 (not e!417197))))

(declare-fun res!504024 () Bool)

(assert (=> b!747288 (=> res!504024 e!417197)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7555 0))(
  ( (MissingZero!7555 (index!32588 (_ BitVec 32))) (Found!7555 (index!32589 (_ BitVec 32))) (Intermediate!7555 (undefined!8367 Bool) (index!32590 (_ BitVec 32)) (x!63540 (_ BitVec 32))) (Undefined!7555) (MissingVacant!7555 (index!32591 (_ BitVec 32))) )
))
(declare-fun lt!332037 () SeekEntryResult!7555)

(get-info :version)

(assert (=> b!747288 (= res!504024 (or (not ((_ is Intermediate!7555) lt!332037)) (bvslt x!1131 (x!63540 lt!332037)) (not (= x!1131 (x!63540 lt!332037))) (not (= index!1321 (index!32590 lt!332037)))))))

(declare-fun e!417200 () Bool)

(assert (=> b!747288 e!417200))

(declare-fun res!504023 () Bool)

(assert (=> b!747288 (=> (not res!504023) (not e!417200))))

(declare-fun lt!332043 () SeekEntryResult!7555)

(declare-fun lt!332042 () SeekEntryResult!7555)

(assert (=> b!747288 (= res!504023 (= lt!332043 lt!332042))))

(assert (=> b!747288 (= lt!332042 (Found!7555 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41688 (_ BitVec 32)) SeekEntryResult!7555)

(assert (=> b!747288 (= lt!332043 (seekEntryOrOpen!0 (select (arr!19958 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41688 (_ BitVec 32)) Bool)

(assert (=> b!747288 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25580 0))(
  ( (Unit!25581) )
))
(declare-fun lt!332045 () Unit!25580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25580)

(assert (=> b!747288 (= lt!332045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747289 () Bool)

(declare-fun e!417193 () Bool)

(declare-fun e!417202 () Bool)

(assert (=> b!747289 (= e!417193 e!417202)))

(declare-fun res!504036 () Bool)

(assert (=> b!747289 (=> (not res!504036) (not e!417202))))

(declare-fun lt!332040 () SeekEntryResult!7555)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41688 (_ BitVec 32)) SeekEntryResult!7555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747289 (= res!504036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19958 a!3186) j!159) mask!3328) (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332040))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747289 (= lt!332040 (Intermediate!7555 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747290 () Bool)

(assert (=> b!747290 (= e!417198 e!417193)))

(declare-fun res!504022 () Bool)

(assert (=> b!747290 (=> (not res!504022) (not e!417193))))

(declare-fun lt!332044 () SeekEntryResult!7555)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747290 (= res!504022 (or (= lt!332044 (MissingZero!7555 i!1173)) (= lt!332044 (MissingVacant!7555 i!1173))))))

(assert (=> b!747290 (= lt!332044 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747291 () Bool)

(declare-fun res!504030 () Bool)

(assert (=> b!747291 (=> (not res!504030) (not e!417202))))

(assert (=> b!747291 (= res!504030 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19958 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747292 () Bool)

(declare-fun res!504026 () Bool)

(assert (=> b!747292 (=> res!504026 e!417197)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41688 (_ BitVec 32)) SeekEntryResult!7555)

(assert (=> b!747292 (= res!504026 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332042)))))

(declare-fun b!747293 () Bool)

(declare-fun e!417194 () Unit!25580)

(declare-fun Unit!25582 () Unit!25580)

(assert (=> b!747293 (= e!417194 Unit!25582)))

(assert (=> b!747293 false))

(declare-fun res!504034 () Bool)

(assert (=> start!65498 (=> (not res!504034) (not e!417198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65498 (= res!504034 (validMask!0 mask!3328))))

(assert (=> start!65498 e!417198))

(assert (=> start!65498 true))

(declare-fun array_inv!15841 (array!41688) Bool)

(assert (=> start!65498 (array_inv!15841 a!3186)))

(declare-fun b!747294 () Bool)

(assert (=> b!747294 (= e!417200 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332042))))

(declare-fun b!747295 () Bool)

(declare-fun Unit!25583 () Unit!25580)

(assert (=> b!747295 (= e!417194 Unit!25583)))

(declare-fun b!747296 () Bool)

(declare-fun res!504035 () Bool)

(assert (=> b!747296 (=> (not res!504035) (not e!417193))))

(declare-datatypes ((List!13999 0))(
  ( (Nil!13996) (Cons!13995 (h!15067 (_ BitVec 64)) (t!20305 List!13999)) )
))
(declare-fun arrayNoDuplicates!0 (array!41688 (_ BitVec 32) List!13999) Bool)

(assert (=> b!747296 (= res!504035 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13996))))

(declare-fun e!417201 () Bool)

(declare-fun b!747297 () Bool)

(assert (=> b!747297 (= e!417201 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) lt!332040))))

(declare-fun b!747298 () Bool)

(assert (=> b!747298 (= e!417197 e!417196)))

(declare-fun res!504025 () Bool)

(assert (=> b!747298 (=> res!504025 e!417196)))

(assert (=> b!747298 (= res!504025 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747298 (= (select (store (arr!19958 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332038 () Unit!25580)

(assert (=> b!747298 (= lt!332038 e!417194)))

(declare-fun c!82013 () Bool)

(assert (=> b!747298 (= c!82013 (= (select (store (arr!19958 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747299 () Bool)

(declare-fun res!504032 () Bool)

(assert (=> b!747299 (=> (not res!504032) (not e!417202))))

(assert (=> b!747299 (= res!504032 e!417201)))

(declare-fun c!82014 () Bool)

(assert (=> b!747299 (= c!82014 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747300 () Bool)

(declare-fun res!504028 () Bool)

(assert (=> b!747300 (=> res!504028 e!417197)))

(assert (=> b!747300 (= res!504028 (= (select (store (arr!19958 a!3186) i!1173 k0!2102) index!1321) lt!332039))))

(declare-fun b!747301 () Bool)

(declare-fun res!504019 () Bool)

(assert (=> b!747301 (=> (not res!504019) (not e!417193))))

(assert (=> b!747301 (= res!504019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747302 () Bool)

(declare-fun res!504020 () Bool)

(assert (=> b!747302 (=> (not res!504020) (not e!417193))))

(assert (=> b!747302 (= res!504020 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20379 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20379 a!3186))))))

(declare-fun b!747303 () Bool)

(declare-fun res!504029 () Bool)

(assert (=> b!747303 (=> (not res!504029) (not e!417198))))

(assert (=> b!747303 (= res!504029 (and (= (size!20379 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20379 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20379 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747304 () Bool)

(assert (=> b!747304 (= e!417202 e!417199)))

(declare-fun res!504033 () Bool)

(assert (=> b!747304 (=> (not res!504033) (not e!417199))))

(declare-fun lt!332036 () SeekEntryResult!7555)

(assert (=> b!747304 (= res!504033 (= lt!332036 lt!332037))))

(declare-fun lt!332041 () array!41688)

(assert (=> b!747304 (= lt!332037 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332039 lt!332041 mask!3328))))

(assert (=> b!747304 (= lt!332036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332039 mask!3328) lt!332039 lt!332041 mask!3328))))

(assert (=> b!747304 (= lt!332039 (select (store (arr!19958 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747304 (= lt!332041 (array!41689 (store (arr!19958 a!3186) i!1173 k0!2102) (size!20379 a!3186)))))

(declare-fun b!747305 () Bool)

(assert (=> b!747305 (= e!417201 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19958 a!3186) j!159) a!3186 mask!3328) (Found!7555 j!159)))))

(assert (= (and start!65498 res!504034) b!747303))

(assert (= (and b!747303 res!504029) b!747287))

(assert (= (and b!747287 res!504027) b!747286))

(assert (= (and b!747286 res!504031) b!747285))

(assert (= (and b!747285 res!504021) b!747290))

(assert (= (and b!747290 res!504022) b!747301))

(assert (= (and b!747301 res!504019) b!747296))

(assert (= (and b!747296 res!504035) b!747302))

(assert (= (and b!747302 res!504020) b!747289))

(assert (= (and b!747289 res!504036) b!747291))

(assert (= (and b!747291 res!504030) b!747299))

(assert (= (and b!747299 c!82014) b!747297))

(assert (= (and b!747299 (not c!82014)) b!747305))

(assert (= (and b!747299 res!504032) b!747304))

(assert (= (and b!747304 res!504033) b!747288))

(assert (= (and b!747288 res!504023) b!747294))

(assert (= (and b!747288 (not res!504024)) b!747292))

(assert (= (and b!747292 (not res!504026)) b!747300))

(assert (= (and b!747300 (not res!504028)) b!747298))

(assert (= (and b!747298 c!82013) b!747293))

(assert (= (and b!747298 (not c!82013)) b!747295))

(assert (= (and b!747298 (not res!504025)) b!747284))

(declare-fun m!696833 () Bool)

(assert (=> b!747304 m!696833))

(declare-fun m!696835 () Bool)

(assert (=> b!747304 m!696835))

(declare-fun m!696837 () Bool)

(assert (=> b!747304 m!696837))

(declare-fun m!696839 () Bool)

(assert (=> b!747304 m!696839))

(assert (=> b!747304 m!696833))

(declare-fun m!696841 () Bool)

(assert (=> b!747304 m!696841))

(declare-fun m!696843 () Bool)

(assert (=> start!65498 m!696843))

(declare-fun m!696845 () Bool)

(assert (=> start!65498 m!696845))

(declare-fun m!696847 () Bool)

(assert (=> b!747301 m!696847))

(declare-fun m!696849 () Bool)

(assert (=> b!747290 m!696849))

(declare-fun m!696851 () Bool)

(assert (=> b!747288 m!696851))

(assert (=> b!747288 m!696851))

(declare-fun m!696853 () Bool)

(assert (=> b!747288 m!696853))

(declare-fun m!696855 () Bool)

(assert (=> b!747288 m!696855))

(declare-fun m!696857 () Bool)

(assert (=> b!747288 m!696857))

(assert (=> b!747287 m!696851))

(assert (=> b!747287 m!696851))

(declare-fun m!696859 () Bool)

(assert (=> b!747287 m!696859))

(assert (=> b!747289 m!696851))

(assert (=> b!747289 m!696851))

(declare-fun m!696861 () Bool)

(assert (=> b!747289 m!696861))

(assert (=> b!747289 m!696861))

(assert (=> b!747289 m!696851))

(declare-fun m!696863 () Bool)

(assert (=> b!747289 m!696863))

(assert (=> b!747305 m!696851))

(assert (=> b!747305 m!696851))

(declare-fun m!696865 () Bool)

(assert (=> b!747305 m!696865))

(assert (=> b!747298 m!696835))

(declare-fun m!696867 () Bool)

(assert (=> b!747298 m!696867))

(assert (=> b!747297 m!696851))

(assert (=> b!747297 m!696851))

(declare-fun m!696869 () Bool)

(assert (=> b!747297 m!696869))

(declare-fun m!696871 () Bool)

(assert (=> b!747284 m!696871))

(assert (=> b!747294 m!696851))

(assert (=> b!747294 m!696851))

(declare-fun m!696873 () Bool)

(assert (=> b!747294 m!696873))

(declare-fun m!696875 () Bool)

(assert (=> b!747296 m!696875))

(assert (=> b!747300 m!696835))

(assert (=> b!747300 m!696867))

(declare-fun m!696877 () Bool)

(assert (=> b!747286 m!696877))

(declare-fun m!696879 () Bool)

(assert (=> b!747285 m!696879))

(declare-fun m!696881 () Bool)

(assert (=> b!747291 m!696881))

(assert (=> b!747292 m!696851))

(assert (=> b!747292 m!696851))

(assert (=> b!747292 m!696865))

(check-sat (not b!747289) (not b!747288) (not b!747292) (not b!747304) (not start!65498) (not b!747287) (not b!747286) (not b!747301) (not b!747297) (not b!747305) (not b!747285) (not b!747290) (not b!747284) (not b!747294) (not b!747296))
(check-sat)
