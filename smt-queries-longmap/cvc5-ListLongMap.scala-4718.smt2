; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65368 () Bool)

(assert start!65368)

(declare-fun b!743309 () Bool)

(declare-fun e!415321 () Bool)

(declare-fun e!415323 () Bool)

(assert (=> b!743309 (= e!415321 e!415323)))

(declare-fun res!500423 () Bool)

(assert (=> b!743309 (=> (not res!500423) (not e!415323))))

(declare-datatypes ((SeekEntryResult!7484 0))(
  ( (MissingZero!7484 (index!32304 (_ BitVec 32))) (Found!7484 (index!32305 (_ BitVec 32))) (Intermediate!7484 (undefined!8296 Bool) (index!32306 (_ BitVec 32)) (x!63274 (_ BitVec 32))) (Undefined!7484) (MissingVacant!7484 (index!32307 (_ BitVec 32))) )
))
(declare-fun lt!330197 () SeekEntryResult!7484)

(declare-datatypes ((array!41541 0))(
  ( (array!41542 (arr!19884 (Array (_ BitVec 32) (_ BitVec 64))) (size!20305 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41541)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41541 (_ BitVec 32)) SeekEntryResult!7484)

(assert (=> b!743309 (= res!500423 (= (seekEntryOrOpen!0 (select (arr!19884 a!3186) j!159) a!3186 mask!3328) lt!330197))))

(assert (=> b!743309 (= lt!330197 (Found!7484 j!159))))

(declare-fun res!500424 () Bool)

(declare-fun e!415326 () Bool)

(assert (=> start!65368 (=> (not res!500424) (not e!415326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65368 (= res!500424 (validMask!0 mask!3328))))

(assert (=> start!65368 e!415326))

(assert (=> start!65368 true))

(declare-fun array_inv!15680 (array!41541) Bool)

(assert (=> start!65368 (array_inv!15680 a!3186)))

(declare-fun b!743310 () Bool)

(declare-fun res!500427 () Bool)

(assert (=> b!743310 (=> (not res!500427) (not e!415326))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743310 (= res!500427 (validKeyInArray!0 k!2102))))

(declare-fun b!743311 () Bool)

(declare-fun res!500428 () Bool)

(declare-fun e!415327 () Bool)

(assert (=> b!743311 (=> res!500428 e!415327)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330203 () (_ BitVec 64))

(declare-fun lt!330200 () SeekEntryResult!7484)

(assert (=> b!743311 (= res!500428 (or (not (= (select (store (arr!19884 a!3186) i!1173 k!2102) index!1321) lt!330203)) (undefined!8296 lt!330200)))))

(declare-fun b!743312 () Bool)

(declare-fun e!415324 () Bool)

(declare-fun e!415320 () Bool)

(assert (=> b!743312 (= e!415324 e!415320)))

(declare-fun res!500414 () Bool)

(assert (=> b!743312 (=> (not res!500414) (not e!415320))))

(declare-fun lt!330196 () SeekEntryResult!7484)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41541 (_ BitVec 32)) SeekEntryResult!7484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743312 (= res!500414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19884 a!3186) j!159) mask!3328) (select (arr!19884 a!3186) j!159) a!3186 mask!3328) lt!330196))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743312 (= lt!330196 (Intermediate!7484 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743313 () Bool)

(declare-fun e!415328 () Bool)

(assert (=> b!743313 (= e!415328 (not e!415327))))

(declare-fun res!500419 () Bool)

(assert (=> b!743313 (=> res!500419 e!415327)))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!743313 (= res!500419 (or (not (is-Intermediate!7484 lt!330200)) (bvslt x!1131 (x!63274 lt!330200)) (not (= x!1131 (x!63274 lt!330200))) (not (= index!1321 (index!32306 lt!330200)))))))

(assert (=> b!743313 e!415321))

(declare-fun res!500417 () Bool)

(assert (=> b!743313 (=> (not res!500417) (not e!415321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41541 (_ BitVec 32)) Bool)

(assert (=> b!743313 (= res!500417 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25448 0))(
  ( (Unit!25449) )
))
(declare-fun lt!330195 () Unit!25448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25448)

(assert (=> b!743313 (= lt!330195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743314 () Bool)

(assert (=> b!743314 (= e!415326 e!415324)))

(declare-fun res!500426 () Bool)

(assert (=> b!743314 (=> (not res!500426) (not e!415324))))

(declare-fun lt!330201 () SeekEntryResult!7484)

(assert (=> b!743314 (= res!500426 (or (= lt!330201 (MissingZero!7484 i!1173)) (= lt!330201 (MissingVacant!7484 i!1173))))))

(assert (=> b!743314 (= lt!330201 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743315 () Bool)

(declare-fun res!500420 () Bool)

(assert (=> b!743315 (=> (not res!500420) (not e!415326))))

(declare-fun arrayContainsKey!0 (array!41541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743315 (= res!500420 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743316 () Bool)

(declare-fun res!500422 () Bool)

(assert (=> b!743316 (=> (not res!500422) (not e!415326))))

(assert (=> b!743316 (= res!500422 (validKeyInArray!0 (select (arr!19884 a!3186) j!159)))))

(declare-fun b!743317 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41541 (_ BitVec 32)) SeekEntryResult!7484)

(assert (=> b!743317 (= e!415323 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19884 a!3186) j!159) a!3186 mask!3328) lt!330197))))

(declare-fun b!743318 () Bool)

(declare-fun res!500415 () Bool)

(assert (=> b!743318 (=> (not res!500415) (not e!415324))))

(declare-datatypes ((List!13886 0))(
  ( (Nil!13883) (Cons!13882 (h!14954 (_ BitVec 64)) (t!20201 List!13886)) )
))
(declare-fun arrayNoDuplicates!0 (array!41541 (_ BitVec 32) List!13886) Bool)

(assert (=> b!743318 (= res!500415 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13883))))

(declare-fun b!743319 () Bool)

(declare-fun res!500425 () Bool)

(assert (=> b!743319 (=> res!500425 e!415327)))

(assert (=> b!743319 (= res!500425 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19884 a!3186) j!159) a!3186 mask!3328) (Found!7484 j!159))))))

(declare-fun b!743320 () Bool)

(declare-fun res!500412 () Bool)

(assert (=> b!743320 (=> (not res!500412) (not e!415326))))

(assert (=> b!743320 (= res!500412 (and (= (size!20305 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20305 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20305 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743321 () Bool)

(declare-fun res!500418 () Bool)

(assert (=> b!743321 (=> (not res!500418) (not e!415320))))

(assert (=> b!743321 (= res!500418 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19884 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!415325 () Bool)

(declare-fun b!743322 () Bool)

(assert (=> b!743322 (= e!415325 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19884 a!3186) j!159) a!3186 mask!3328) (Found!7484 j!159)))))

(declare-fun b!743323 () Bool)

(assert (=> b!743323 (= e!415327 true)))

(declare-fun lt!330198 () SeekEntryResult!7484)

(declare-fun lt!330199 () array!41541)

(assert (=> b!743323 (= lt!330198 (seekEntryOrOpen!0 lt!330203 lt!330199 mask!3328))))

(declare-fun b!743324 () Bool)

(declare-fun res!500429 () Bool)

(assert (=> b!743324 (=> (not res!500429) (not e!415320))))

(assert (=> b!743324 (= res!500429 e!415325)))

(declare-fun c!81829 () Bool)

(assert (=> b!743324 (= c!81829 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743325 () Bool)

(assert (=> b!743325 (= e!415320 e!415328)))

(declare-fun res!500416 () Bool)

(assert (=> b!743325 (=> (not res!500416) (not e!415328))))

(declare-fun lt!330202 () SeekEntryResult!7484)

(assert (=> b!743325 (= res!500416 (= lt!330202 lt!330200))))

(assert (=> b!743325 (= lt!330200 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330203 lt!330199 mask!3328))))

(assert (=> b!743325 (= lt!330202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330203 mask!3328) lt!330203 lt!330199 mask!3328))))

(assert (=> b!743325 (= lt!330203 (select (store (arr!19884 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743325 (= lt!330199 (array!41542 (store (arr!19884 a!3186) i!1173 k!2102) (size!20305 a!3186)))))

(declare-fun b!743326 () Bool)

(declare-fun res!500413 () Bool)

(assert (=> b!743326 (=> (not res!500413) (not e!415324))))

(assert (=> b!743326 (= res!500413 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20305 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20305 a!3186))))))

(declare-fun b!743327 () Bool)

(assert (=> b!743327 (= e!415325 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19884 a!3186) j!159) a!3186 mask!3328) lt!330196))))

(declare-fun b!743328 () Bool)

(declare-fun res!500421 () Bool)

(assert (=> b!743328 (=> (not res!500421) (not e!415324))))

(assert (=> b!743328 (= res!500421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65368 res!500424) b!743320))

(assert (= (and b!743320 res!500412) b!743316))

(assert (= (and b!743316 res!500422) b!743310))

(assert (= (and b!743310 res!500427) b!743315))

(assert (= (and b!743315 res!500420) b!743314))

(assert (= (and b!743314 res!500426) b!743328))

(assert (= (and b!743328 res!500421) b!743318))

(assert (= (and b!743318 res!500415) b!743326))

(assert (= (and b!743326 res!500413) b!743312))

(assert (= (and b!743312 res!500414) b!743321))

(assert (= (and b!743321 res!500418) b!743324))

(assert (= (and b!743324 c!81829) b!743327))

(assert (= (and b!743324 (not c!81829)) b!743322))

(assert (= (and b!743324 res!500429) b!743325))

(assert (= (and b!743325 res!500416) b!743313))

(assert (= (and b!743313 res!500417) b!743309))

(assert (= (and b!743309 res!500423) b!743317))

(assert (= (and b!743313 (not res!500419)) b!743319))

(assert (= (and b!743319 (not res!500425)) b!743311))

(assert (= (and b!743311 (not res!500428)) b!743323))

(declare-fun m!694021 () Bool)

(assert (=> b!743325 m!694021))

(assert (=> b!743325 m!694021))

(declare-fun m!694023 () Bool)

(assert (=> b!743325 m!694023))

(declare-fun m!694025 () Bool)

(assert (=> b!743325 m!694025))

(declare-fun m!694027 () Bool)

(assert (=> b!743325 m!694027))

(declare-fun m!694029 () Bool)

(assert (=> b!743325 m!694029))

(declare-fun m!694031 () Bool)

(assert (=> b!743309 m!694031))

(assert (=> b!743309 m!694031))

(declare-fun m!694033 () Bool)

(assert (=> b!743309 m!694033))

(assert (=> b!743322 m!694031))

(assert (=> b!743322 m!694031))

(declare-fun m!694035 () Bool)

(assert (=> b!743322 m!694035))

(declare-fun m!694037 () Bool)

(assert (=> b!743328 m!694037))

(assert (=> b!743316 m!694031))

(assert (=> b!743316 m!694031))

(declare-fun m!694039 () Bool)

(assert (=> b!743316 m!694039))

(assert (=> b!743317 m!694031))

(assert (=> b!743317 m!694031))

(declare-fun m!694041 () Bool)

(assert (=> b!743317 m!694041))

(declare-fun m!694043 () Bool)

(assert (=> b!743321 m!694043))

(declare-fun m!694045 () Bool)

(assert (=> b!743323 m!694045))

(declare-fun m!694047 () Bool)

(assert (=> start!65368 m!694047))

(declare-fun m!694049 () Bool)

(assert (=> start!65368 m!694049))

(declare-fun m!694051 () Bool)

(assert (=> b!743313 m!694051))

(declare-fun m!694053 () Bool)

(assert (=> b!743313 m!694053))

(assert (=> b!743312 m!694031))

(assert (=> b!743312 m!694031))

(declare-fun m!694055 () Bool)

(assert (=> b!743312 m!694055))

(assert (=> b!743312 m!694055))

(assert (=> b!743312 m!694031))

(declare-fun m!694057 () Bool)

(assert (=> b!743312 m!694057))

(declare-fun m!694059 () Bool)

(assert (=> b!743310 m!694059))

(declare-fun m!694061 () Bool)

(assert (=> b!743315 m!694061))

(assert (=> b!743311 m!694027))

(declare-fun m!694063 () Bool)

(assert (=> b!743311 m!694063))

(declare-fun m!694065 () Bool)

(assert (=> b!743314 m!694065))

(assert (=> b!743327 m!694031))

(assert (=> b!743327 m!694031))

(declare-fun m!694067 () Bool)

(assert (=> b!743327 m!694067))

(declare-fun m!694069 () Bool)

(assert (=> b!743318 m!694069))

(assert (=> b!743319 m!694031))

(assert (=> b!743319 m!694031))

(assert (=> b!743319 m!694035))

(push 1)

