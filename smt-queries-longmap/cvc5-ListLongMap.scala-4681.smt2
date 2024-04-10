; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65146 () Bool)

(assert start!65146)

(declare-datatypes ((array!41319 0))(
  ( (array!41320 (arr!19773 (Array (_ BitVec 32) (_ BitVec 64))) (size!20194 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41319)

(declare-fun lt!326362 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7373 0))(
  ( (MissingZero!7373 (index!31860 (_ BitVec 32))) (Found!7373 (index!31861 (_ BitVec 32))) (Intermediate!7373 (undefined!8185 Bool) (index!31862 (_ BitVec 32)) (x!62867 (_ BitVec 32))) (Undefined!7373) (MissingVacant!7373 (index!31863 (_ BitVec 32))) )
))
(declare-fun lt!326363 () SeekEntryResult!7373)

(declare-fun e!411777 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!736036 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41319 (_ BitVec 32)) SeekEntryResult!7373)

(assert (=> b!736036 (= e!411777 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326362 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326363)))))

(declare-fun b!736037 () Bool)

(declare-fun res!494625 () Bool)

(declare-fun e!411781 () Bool)

(assert (=> b!736037 (=> (not res!494625) (not e!411781))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736037 (= res!494625 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20194 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20194 a!3186))))))

(declare-fun b!736038 () Bool)

(declare-fun e!411772 () Bool)

(assert (=> b!736038 (= e!411772 true)))

(declare-fun lt!326373 () array!41319)

(declare-fun lt!326364 () (_ BitVec 64))

(declare-fun lt!326368 () SeekEntryResult!7373)

(assert (=> b!736038 (= lt!326368 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326362 lt!326364 lt!326373 mask!3328))))

(declare-fun b!736039 () Bool)

(declare-fun res!494626 () Bool)

(declare-fun e!411773 () Bool)

(assert (=> b!736039 (=> (not res!494626) (not e!411773))))

(declare-fun e!411782 () Bool)

(assert (=> b!736039 (= res!494626 e!411782)))

(declare-fun c!81088 () Bool)

(assert (=> b!736039 (= c!81088 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!494640 () Bool)

(declare-fun e!411778 () Bool)

(assert (=> start!65146 (=> (not res!494640) (not e!411778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65146 (= res!494640 (validMask!0 mask!3328))))

(assert (=> start!65146 e!411778))

(assert (=> start!65146 true))

(declare-fun array_inv!15569 (array!41319) Bool)

(assert (=> start!65146 (array_inv!15569 a!3186)))

(declare-fun b!736040 () Bool)

(declare-fun res!494636 () Bool)

(assert (=> b!736040 (=> (not res!494636) (not e!411781))))

(declare-datatypes ((List!13775 0))(
  ( (Nil!13772) (Cons!13771 (h!14843 (_ BitVec 64)) (t!20090 List!13775)) )
))
(declare-fun arrayNoDuplicates!0 (array!41319 (_ BitVec 32) List!13775) Bool)

(assert (=> b!736040 (= res!494636 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13772))))

(declare-fun b!736041 () Bool)

(declare-datatypes ((Unit!25088 0))(
  ( (Unit!25089) )
))
(declare-fun e!411779 () Unit!25088)

(declare-fun Unit!25090 () Unit!25088)

(assert (=> b!736041 (= e!411779 Unit!25090)))

(assert (=> b!736041 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326362 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326363)))

(declare-fun b!736042 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41319 (_ BitVec 32)) SeekEntryResult!7373)

(assert (=> b!736042 (= e!411782 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) (Found!7373 j!159)))))

(declare-fun b!736043 () Bool)

(declare-fun Unit!25091 () Unit!25088)

(assert (=> b!736043 (= e!411779 Unit!25091)))

(declare-fun lt!326375 () SeekEntryResult!7373)

(assert (=> b!736043 (= lt!326375 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19773 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326367 () SeekEntryResult!7373)

(assert (=> b!736043 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326362 resIntermediateIndex!5 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326367)))

(declare-fun b!736044 () Bool)

(declare-fun e!411771 () Bool)

(declare-fun e!411780 () Bool)

(assert (=> b!736044 (= e!411771 e!411780)))

(declare-fun res!494639 () Bool)

(assert (=> b!736044 (=> (not res!494639) (not e!411780))))

(declare-fun lt!326366 () SeekEntryResult!7373)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41319 (_ BitVec 32)) SeekEntryResult!7373)

(assert (=> b!736044 (= res!494639 (= (seekEntryOrOpen!0 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326366))))

(assert (=> b!736044 (= lt!326366 (Found!7373 j!159))))

(declare-fun b!736045 () Bool)

(declare-fun res!494629 () Bool)

(assert (=> b!736045 (=> (not res!494629) (not e!411773))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736045 (= res!494629 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19773 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736046 () Bool)

(declare-fun res!494638 () Bool)

(assert (=> b!736046 (=> (not res!494638) (not e!411778))))

(assert (=> b!736046 (= res!494638 (and (= (size!20194 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20194 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20194 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736047 () Bool)

(declare-fun res!494631 () Bool)

(assert (=> b!736047 (=> res!494631 e!411772)))

(assert (=> b!736047 (= res!494631 e!411777)))

(declare-fun c!81087 () Bool)

(declare-fun lt!326374 () Bool)

(assert (=> b!736047 (= c!81087 lt!326374)))

(declare-fun b!736048 () Bool)

(assert (=> b!736048 (= e!411782 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326363))))

(declare-fun b!736049 () Bool)

(declare-fun res!494628 () Bool)

(assert (=> b!736049 (=> (not res!494628) (not e!411778))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736049 (= res!494628 (validKeyInArray!0 k!2102))))

(declare-fun b!736050 () Bool)

(declare-fun e!411775 () Bool)

(assert (=> b!736050 (= e!411773 e!411775)))

(declare-fun res!494633 () Bool)

(assert (=> b!736050 (=> (not res!494633) (not e!411775))))

(declare-fun lt!326372 () SeekEntryResult!7373)

(declare-fun lt!326370 () SeekEntryResult!7373)

(assert (=> b!736050 (= res!494633 (= lt!326372 lt!326370))))

(assert (=> b!736050 (= lt!326370 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326364 lt!326373 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736050 (= lt!326372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326364 mask!3328) lt!326364 lt!326373 mask!3328))))

(assert (=> b!736050 (= lt!326364 (select (store (arr!19773 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736050 (= lt!326373 (array!41320 (store (arr!19773 a!3186) i!1173 k!2102) (size!20194 a!3186)))))

(declare-fun b!736051 () Bool)

(assert (=> b!736051 (= e!411780 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326366))))

(declare-fun b!736052 () Bool)

(assert (=> b!736052 (= e!411777 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326362 resIntermediateIndex!5 (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326367)))))

(declare-fun b!736053 () Bool)

(declare-fun res!494641 () Bool)

(assert (=> b!736053 (=> (not res!494641) (not e!411781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41319 (_ BitVec 32)) Bool)

(assert (=> b!736053 (= res!494641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736054 () Bool)

(assert (=> b!736054 (= e!411781 e!411773)))

(declare-fun res!494642 () Bool)

(assert (=> b!736054 (=> (not res!494642) (not e!411773))))

(assert (=> b!736054 (= res!494642 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19773 a!3186) j!159) mask!3328) (select (arr!19773 a!3186) j!159) a!3186 mask!3328) lt!326363))))

(assert (=> b!736054 (= lt!326363 (Intermediate!7373 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736055 () Bool)

(declare-fun res!494627 () Bool)

(assert (=> b!736055 (=> (not res!494627) (not e!411778))))

(assert (=> b!736055 (= res!494627 (validKeyInArray!0 (select (arr!19773 a!3186) j!159)))))

(declare-fun b!736056 () Bool)

(declare-fun e!411774 () Bool)

(assert (=> b!736056 (= e!411774 e!411772)))

(declare-fun res!494632 () Bool)

(assert (=> b!736056 (=> res!494632 e!411772)))

(assert (=> b!736056 (= res!494632 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326362 #b00000000000000000000000000000000) (bvsge lt!326362 (size!20194 a!3186))))))

(declare-fun lt!326369 () Unit!25088)

(assert (=> b!736056 (= lt!326369 e!411779)))

(declare-fun c!81086 () Bool)

(assert (=> b!736056 (= c!81086 lt!326374)))

(assert (=> b!736056 (= lt!326374 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736056 (= lt!326362 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736057 () Bool)

(assert (=> b!736057 (= e!411778 e!411781)))

(declare-fun res!494634 () Bool)

(assert (=> b!736057 (=> (not res!494634) (not e!411781))))

(declare-fun lt!326371 () SeekEntryResult!7373)

(assert (=> b!736057 (= res!494634 (or (= lt!326371 (MissingZero!7373 i!1173)) (= lt!326371 (MissingVacant!7373 i!1173))))))

(assert (=> b!736057 (= lt!326371 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!736058 () Bool)

(assert (=> b!736058 (= e!411775 (not e!411774))))

(declare-fun res!494635 () Bool)

(assert (=> b!736058 (=> res!494635 e!411774)))

(assert (=> b!736058 (= res!494635 (or (not (is-Intermediate!7373 lt!326370)) (bvsge x!1131 (x!62867 lt!326370))))))

(assert (=> b!736058 (= lt!326367 (Found!7373 j!159))))

(assert (=> b!736058 e!411771))

(declare-fun res!494637 () Bool)

(assert (=> b!736058 (=> (not res!494637) (not e!411771))))

(assert (=> b!736058 (= res!494637 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326365 () Unit!25088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25088)

(assert (=> b!736058 (= lt!326365 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736059 () Bool)

(declare-fun res!494630 () Bool)

(assert (=> b!736059 (=> (not res!494630) (not e!411778))))

(declare-fun arrayContainsKey!0 (array!41319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736059 (= res!494630 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65146 res!494640) b!736046))

(assert (= (and b!736046 res!494638) b!736055))

(assert (= (and b!736055 res!494627) b!736049))

(assert (= (and b!736049 res!494628) b!736059))

(assert (= (and b!736059 res!494630) b!736057))

(assert (= (and b!736057 res!494634) b!736053))

(assert (= (and b!736053 res!494641) b!736040))

(assert (= (and b!736040 res!494636) b!736037))

(assert (= (and b!736037 res!494625) b!736054))

(assert (= (and b!736054 res!494642) b!736045))

(assert (= (and b!736045 res!494629) b!736039))

(assert (= (and b!736039 c!81088) b!736048))

(assert (= (and b!736039 (not c!81088)) b!736042))

(assert (= (and b!736039 res!494626) b!736050))

(assert (= (and b!736050 res!494633) b!736058))

(assert (= (and b!736058 res!494637) b!736044))

(assert (= (and b!736044 res!494639) b!736051))

(assert (= (and b!736058 (not res!494635)) b!736056))

(assert (= (and b!736056 c!81086) b!736041))

(assert (= (and b!736056 (not c!81086)) b!736043))

(assert (= (and b!736056 (not res!494632)) b!736047))

(assert (= (and b!736047 c!81087) b!736036))

(assert (= (and b!736047 (not c!81087)) b!736052))

(assert (= (and b!736047 (not res!494631)) b!736038))

(declare-fun m!688267 () Bool)

(assert (=> b!736042 m!688267))

(assert (=> b!736042 m!688267))

(declare-fun m!688269 () Bool)

(assert (=> b!736042 m!688269))

(assert (=> b!736055 m!688267))

(assert (=> b!736055 m!688267))

(declare-fun m!688271 () Bool)

(assert (=> b!736055 m!688271))

(assert (=> b!736043 m!688267))

(assert (=> b!736043 m!688267))

(assert (=> b!736043 m!688269))

(assert (=> b!736043 m!688267))

(declare-fun m!688273 () Bool)

(assert (=> b!736043 m!688273))

(declare-fun m!688275 () Bool)

(assert (=> b!736045 m!688275))

(declare-fun m!688277 () Bool)

(assert (=> b!736050 m!688277))

(assert (=> b!736050 m!688277))

(declare-fun m!688279 () Bool)

(assert (=> b!736050 m!688279))

(declare-fun m!688281 () Bool)

(assert (=> b!736050 m!688281))

(declare-fun m!688283 () Bool)

(assert (=> b!736050 m!688283))

(declare-fun m!688285 () Bool)

(assert (=> b!736050 m!688285))

(declare-fun m!688287 () Bool)

(assert (=> b!736038 m!688287))

(declare-fun m!688289 () Bool)

(assert (=> b!736058 m!688289))

(declare-fun m!688291 () Bool)

(assert (=> b!736058 m!688291))

(assert (=> b!736044 m!688267))

(assert (=> b!736044 m!688267))

(declare-fun m!688293 () Bool)

(assert (=> b!736044 m!688293))

(assert (=> b!736041 m!688267))

(assert (=> b!736041 m!688267))

(declare-fun m!688295 () Bool)

(assert (=> b!736041 m!688295))

(declare-fun m!688297 () Bool)

(assert (=> b!736040 m!688297))

(declare-fun m!688299 () Bool)

(assert (=> b!736049 m!688299))

(declare-fun m!688301 () Bool)

(assert (=> b!736053 m!688301))

(declare-fun m!688303 () Bool)

(assert (=> b!736056 m!688303))

(assert (=> b!736054 m!688267))

(assert (=> b!736054 m!688267))

(declare-fun m!688305 () Bool)

(assert (=> b!736054 m!688305))

(assert (=> b!736054 m!688305))

(assert (=> b!736054 m!688267))

(declare-fun m!688307 () Bool)

(assert (=> b!736054 m!688307))

(declare-fun m!688309 () Bool)

(assert (=> start!65146 m!688309))

(declare-fun m!688311 () Bool)

(assert (=> start!65146 m!688311))

(assert (=> b!736036 m!688267))

(assert (=> b!736036 m!688267))

(assert (=> b!736036 m!688295))

(assert (=> b!736051 m!688267))

(assert (=> b!736051 m!688267))

(declare-fun m!688313 () Bool)

(assert (=> b!736051 m!688313))

(assert (=> b!736052 m!688267))

(assert (=> b!736052 m!688267))

(assert (=> b!736052 m!688273))

(declare-fun m!688315 () Bool)

(assert (=> b!736057 m!688315))

(declare-fun m!688317 () Bool)

(assert (=> b!736059 m!688317))

(assert (=> b!736048 m!688267))

(assert (=> b!736048 m!688267))

(declare-fun m!688319 () Bool)

(assert (=> b!736048 m!688319))

(push 1)

