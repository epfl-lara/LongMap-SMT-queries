; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65740 () Bool)

(assert start!65740)

(declare-fun b!754943 () Bool)

(declare-fun e!421014 () Bool)

(declare-datatypes ((SeekEntryResult!7670 0))(
  ( (MissingZero!7670 (index!33048 (_ BitVec 32))) (Found!7670 (index!33049 (_ BitVec 32))) (Intermediate!7670 (undefined!8482 Bool) (index!33050 (_ BitVec 32)) (x!63956 (_ BitVec 32))) (Undefined!7670) (MissingVacant!7670 (index!33051 (_ BitVec 32))) )
))
(declare-fun lt!336010 () SeekEntryResult!7670)

(declare-fun lt!336012 () SeekEntryResult!7670)

(assert (=> b!754943 (= e!421014 (= lt!336010 lt!336012))))

(declare-fun b!754944 () Bool)

(declare-fun res!510218 () Bool)

(declare-fun e!421019 () Bool)

(assert (=> b!754944 (=> (not res!510218) (not e!421019))))

(declare-datatypes ((array!41913 0))(
  ( (array!41914 (arr!20070 (Array (_ BitVec 32) (_ BitVec 64))) (size!20491 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41913)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!754944 (= res!510218 (and (= (size!20491 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20491 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20491 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754946 () Bool)

(declare-fun e!421018 () Bool)

(declare-fun e!421025 () Bool)

(assert (=> b!754946 (= e!421018 e!421025)))

(declare-fun res!510221 () Bool)

(assert (=> b!754946 (=> (not res!510221) (not e!421025))))

(declare-fun lt!336007 () SeekEntryResult!7670)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41913 (_ BitVec 32)) SeekEntryResult!7670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754946 (= res!510221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20070 a!3186) j!159) mask!3328) (select (arr!20070 a!3186) j!159) a!3186 mask!3328) lt!336007))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754946 (= lt!336007 (Intermediate!7670 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754947 () Bool)

(declare-datatypes ((Unit!26060 0))(
  ( (Unit!26061) )
))
(declare-fun e!421017 () Unit!26060)

(declare-fun Unit!26062 () Unit!26060)

(assert (=> b!754947 (= e!421017 Unit!26062)))

(assert (=> b!754947 false))

(declare-fun b!754948 () Bool)

(declare-fun res!510222 () Bool)

(assert (=> b!754948 (=> (not res!510222) (not e!421025))))

(assert (=> b!754948 (= res!510222 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20070 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754949 () Bool)

(assert (=> b!754949 (= e!421019 e!421018)))

(declare-fun res!510211 () Bool)

(assert (=> b!754949 (=> (not res!510211) (not e!421018))))

(declare-fun lt!336013 () SeekEntryResult!7670)

(assert (=> b!754949 (= res!510211 (or (= lt!336013 (MissingZero!7670 i!1173)) (= lt!336013 (MissingVacant!7670 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41913 (_ BitVec 32)) SeekEntryResult!7670)

(assert (=> b!754949 (= lt!336013 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421020 () Bool)

(declare-fun b!754950 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!754950 (= e!421020 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20070 a!3186) j!159) a!3186 mask!3328) lt!336007))))

(declare-fun b!754951 () Bool)

(declare-fun e!421023 () Bool)

(declare-fun e!421015 () Bool)

(assert (=> b!754951 (= e!421023 e!421015)))

(declare-fun res!510220 () Bool)

(assert (=> b!754951 (=> res!510220 e!421015)))

(declare-fun lt!336009 () SeekEntryResult!7670)

(assert (=> b!754951 (= res!510220 (not (= lt!336012 lt!336009)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41913 (_ BitVec 32)) SeekEntryResult!7670)

(assert (=> b!754951 (= lt!336012 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20070 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754952 () Bool)

(declare-fun res!510207 () Bool)

(assert (=> b!754952 (=> (not res!510207) (not e!421019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754952 (= res!510207 (validKeyInArray!0 (select (arr!20070 a!3186) j!159)))))

(declare-fun b!754953 () Bool)

(declare-fun res!510212 () Bool)

(assert (=> b!754953 (=> (not res!510212) (not e!421025))))

(assert (=> b!754953 (= res!510212 e!421020)))

(declare-fun c!82750 () Bool)

(assert (=> b!754953 (= c!82750 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754954 () Bool)

(assert (=> b!754954 (= e!421020 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20070 a!3186) j!159) a!3186 mask!3328) (Found!7670 j!159)))))

(declare-fun b!754955 () Bool)

(declare-fun Unit!26063 () Unit!26060)

(assert (=> b!754955 (= e!421017 Unit!26063)))

(declare-fun b!754956 () Bool)

(declare-fun e!421022 () Bool)

(assert (=> b!754956 (= e!421025 e!421022)))

(declare-fun res!510210 () Bool)

(assert (=> b!754956 (=> (not res!510210) (not e!421022))))

(declare-fun lt!336006 () SeekEntryResult!7670)

(declare-fun lt!336011 () SeekEntryResult!7670)

(assert (=> b!754956 (= res!510210 (= lt!336006 lt!336011))))

(declare-fun lt!336016 () array!41913)

(declare-fun lt!336017 () (_ BitVec 64))

(assert (=> b!754956 (= lt!336011 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336017 lt!336016 mask!3328))))

(assert (=> b!754956 (= lt!336006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336017 mask!3328) lt!336017 lt!336016 mask!3328))))

(assert (=> b!754956 (= lt!336017 (select (store (arr!20070 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754956 (= lt!336016 (array!41914 (store (arr!20070 a!3186) i!1173 k!2102) (size!20491 a!3186)))))

(declare-fun b!754957 () Bool)

(declare-fun res!510214 () Bool)

(assert (=> b!754957 (=> (not res!510214) (not e!421019))))

(declare-fun arrayContainsKey!0 (array!41913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754957 (= res!510214 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!510209 () Bool)

(assert (=> start!65740 (=> (not res!510209) (not e!421019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65740 (= res!510209 (validMask!0 mask!3328))))

(assert (=> start!65740 e!421019))

(assert (=> start!65740 true))

(declare-fun array_inv!15866 (array!41913) Bool)

(assert (=> start!65740 (array_inv!15866 a!3186)))

(declare-fun b!754945 () Bool)

(assert (=> b!754945 (= e!421022 (not e!421023))))

(declare-fun res!510219 () Bool)

(assert (=> b!754945 (=> res!510219 e!421023)))

(assert (=> b!754945 (= res!510219 (or (not (is-Intermediate!7670 lt!336011)) (bvslt x!1131 (x!63956 lt!336011)) (not (= x!1131 (x!63956 lt!336011))) (not (= index!1321 (index!33050 lt!336011)))))))

(declare-fun e!421024 () Bool)

(assert (=> b!754945 e!421024))

(declare-fun res!510216 () Bool)

(assert (=> b!754945 (=> (not res!510216) (not e!421024))))

(assert (=> b!754945 (= res!510216 (= lt!336010 lt!336009))))

(assert (=> b!754945 (= lt!336009 (Found!7670 j!159))))

(assert (=> b!754945 (= lt!336010 (seekEntryOrOpen!0 (select (arr!20070 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41913 (_ BitVec 32)) Bool)

(assert (=> b!754945 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336014 () Unit!26060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26060)

(assert (=> b!754945 (= lt!336014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754958 () Bool)

(declare-fun res!510224 () Bool)

(assert (=> b!754958 (=> (not res!510224) (not e!421014))))

(assert (=> b!754958 (= res!510224 (= (seekEntryOrOpen!0 lt!336017 lt!336016 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336017 lt!336016 mask!3328)))))

(declare-fun b!754959 () Bool)

(declare-fun res!510223 () Bool)

(assert (=> b!754959 (=> (not res!510223) (not e!421018))))

(assert (=> b!754959 (= res!510223 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20491 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20491 a!3186))))))

(declare-fun b!754960 () Bool)

(declare-fun e!421021 () Bool)

(assert (=> b!754960 (= e!421021 true)))

(assert (=> b!754960 e!421014))

(declare-fun res!510208 () Bool)

(assert (=> b!754960 (=> (not res!510208) (not e!421014))))

(declare-fun lt!336008 () (_ BitVec 64))

(assert (=> b!754960 (= res!510208 (= lt!336008 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336015 () Unit!26060)

(assert (=> b!754960 (= lt!336015 e!421017)))

(declare-fun c!82749 () Bool)

(assert (=> b!754960 (= c!82749 (= lt!336008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754961 () Bool)

(declare-fun res!510213 () Bool)

(assert (=> b!754961 (=> (not res!510213) (not e!421018))))

(declare-datatypes ((List!14072 0))(
  ( (Nil!14069) (Cons!14068 (h!15140 (_ BitVec 64)) (t!20387 List!14072)) )
))
(declare-fun arrayNoDuplicates!0 (array!41913 (_ BitVec 32) List!14072) Bool)

(assert (=> b!754961 (= res!510213 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14069))))

(declare-fun b!754962 () Bool)

(declare-fun res!510217 () Bool)

(assert (=> b!754962 (=> (not res!510217) (not e!421019))))

(assert (=> b!754962 (= res!510217 (validKeyInArray!0 k!2102))))

(declare-fun b!754963 () Bool)

(declare-fun res!510206 () Bool)

(assert (=> b!754963 (=> (not res!510206) (not e!421018))))

(assert (=> b!754963 (= res!510206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754964 () Bool)

(assert (=> b!754964 (= e!421024 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20070 a!3186) j!159) a!3186 mask!3328) lt!336009))))

(declare-fun b!754965 () Bool)

(assert (=> b!754965 (= e!421015 e!421021)))

(declare-fun res!510215 () Bool)

(assert (=> b!754965 (=> res!510215 e!421021)))

(assert (=> b!754965 (= res!510215 (= lt!336008 lt!336017))))

(assert (=> b!754965 (= lt!336008 (select (store (arr!20070 a!3186) i!1173 k!2102) index!1321))))

(assert (= (and start!65740 res!510209) b!754944))

(assert (= (and b!754944 res!510218) b!754952))

(assert (= (and b!754952 res!510207) b!754962))

(assert (= (and b!754962 res!510217) b!754957))

(assert (= (and b!754957 res!510214) b!754949))

(assert (= (and b!754949 res!510211) b!754963))

(assert (= (and b!754963 res!510206) b!754961))

(assert (= (and b!754961 res!510213) b!754959))

(assert (= (and b!754959 res!510223) b!754946))

(assert (= (and b!754946 res!510221) b!754948))

(assert (= (and b!754948 res!510222) b!754953))

(assert (= (and b!754953 c!82750) b!754950))

(assert (= (and b!754953 (not c!82750)) b!754954))

(assert (= (and b!754953 res!510212) b!754956))

(assert (= (and b!754956 res!510210) b!754945))

(assert (= (and b!754945 res!510216) b!754964))

(assert (= (and b!754945 (not res!510219)) b!754951))

(assert (= (and b!754951 (not res!510220)) b!754965))

(assert (= (and b!754965 (not res!510215)) b!754960))

(assert (= (and b!754960 c!82749) b!754947))

(assert (= (and b!754960 (not c!82749)) b!754955))

(assert (= (and b!754960 res!510208) b!754958))

(assert (= (and b!754958 res!510224) b!754943))

(declare-fun m!703267 () Bool)

(assert (=> b!754954 m!703267))

(assert (=> b!754954 m!703267))

(declare-fun m!703269 () Bool)

(assert (=> b!754954 m!703269))

(assert (=> b!754952 m!703267))

(assert (=> b!754952 m!703267))

(declare-fun m!703271 () Bool)

(assert (=> b!754952 m!703271))

(declare-fun m!703273 () Bool)

(assert (=> b!754965 m!703273))

(declare-fun m!703275 () Bool)

(assert (=> b!754965 m!703275))

(declare-fun m!703277 () Bool)

(assert (=> b!754962 m!703277))

(declare-fun m!703279 () Bool)

(assert (=> b!754961 m!703279))

(assert (=> b!754946 m!703267))

(assert (=> b!754946 m!703267))

(declare-fun m!703281 () Bool)

(assert (=> b!754946 m!703281))

(assert (=> b!754946 m!703281))

(assert (=> b!754946 m!703267))

(declare-fun m!703283 () Bool)

(assert (=> b!754946 m!703283))

(declare-fun m!703285 () Bool)

(assert (=> b!754957 m!703285))

(declare-fun m!703287 () Bool)

(assert (=> b!754948 m!703287))

(assert (=> b!754950 m!703267))

(assert (=> b!754950 m!703267))

(declare-fun m!703289 () Bool)

(assert (=> b!754950 m!703289))

(declare-fun m!703291 () Bool)

(assert (=> b!754956 m!703291))

(declare-fun m!703293 () Bool)

(assert (=> b!754956 m!703293))

(assert (=> b!754956 m!703273))

(declare-fun m!703295 () Bool)

(assert (=> b!754956 m!703295))

(assert (=> b!754956 m!703291))

(declare-fun m!703297 () Bool)

(assert (=> b!754956 m!703297))

(declare-fun m!703299 () Bool)

(assert (=> b!754963 m!703299))

(declare-fun m!703301 () Bool)

(assert (=> start!65740 m!703301))

(declare-fun m!703303 () Bool)

(assert (=> start!65740 m!703303))

(assert (=> b!754945 m!703267))

(assert (=> b!754945 m!703267))

(declare-fun m!703305 () Bool)

(assert (=> b!754945 m!703305))

(declare-fun m!703307 () Bool)

(assert (=> b!754945 m!703307))

(declare-fun m!703309 () Bool)

(assert (=> b!754945 m!703309))

(assert (=> b!754951 m!703267))

(assert (=> b!754951 m!703267))

(assert (=> b!754951 m!703269))

(assert (=> b!754964 m!703267))

(assert (=> b!754964 m!703267))

(declare-fun m!703311 () Bool)

(assert (=> b!754964 m!703311))

(declare-fun m!703313 () Bool)

(assert (=> b!754958 m!703313))

(declare-fun m!703315 () Bool)

(assert (=> b!754958 m!703315))

(declare-fun m!703317 () Bool)

(assert (=> b!754949 m!703317))

(push 1)

