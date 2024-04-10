; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67744 () Bool)

(assert start!67744)

(declare-fun b!786380 () Bool)

(declare-datatypes ((Unit!27208 0))(
  ( (Unit!27209) )
))
(declare-fun e!437156 () Unit!27208)

(declare-fun Unit!27210 () Unit!27208)

(assert (=> b!786380 (= e!437156 Unit!27210)))

(declare-fun b!786381 () Bool)

(declare-fun res!532456 () Bool)

(declare-fun e!437149 () Bool)

(assert (=> b!786381 (=> (not res!532456) (not e!437149))))

(declare-datatypes ((array!42784 0))(
  ( (array!42785 (arr!20480 (Array (_ BitVec 32) (_ BitVec 64))) (size!20901 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42784)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786381 (= res!532456 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786382 () Bool)

(declare-fun res!532453 () Bool)

(assert (=> b!786382 (=> (not res!532453) (not e!437149))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!786382 (= res!532453 (and (= (size!20901 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20901 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20901 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786383 () Bool)

(declare-fun res!532445 () Bool)

(assert (=> b!786383 (=> (not res!532445) (not e!437149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786383 (= res!532445 (validKeyInArray!0 (select (arr!20480 a!3186) j!159)))))

(declare-fun b!786384 () Bool)

(declare-fun res!532457 () Bool)

(assert (=> b!786384 (=> (not res!532457) (not e!437149))))

(assert (=> b!786384 (= res!532457 (validKeyInArray!0 k!2102))))

(declare-fun b!786385 () Bool)

(declare-fun res!532451 () Bool)

(declare-fun e!437150 () Bool)

(assert (=> b!786385 (=> (not res!532451) (not e!437150))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350698 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!350701 () array!42784)

(declare-datatypes ((SeekEntryResult!8080 0))(
  ( (MissingZero!8080 (index!34688 (_ BitVec 32))) (Found!8080 (index!34689 (_ BitVec 32))) (Intermediate!8080 (undefined!8892 Bool) (index!34690 (_ BitVec 32)) (x!65628 (_ BitVec 32))) (Undefined!8080) (MissingVacant!8080 (index!34691 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42784 (_ BitVec 32)) SeekEntryResult!8080)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42784 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!786385 (= res!532451 (= (seekEntryOrOpen!0 lt!350698 lt!350701 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350698 lt!350701 mask!3328)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!786386 () Bool)

(declare-fun lt!350703 () SeekEntryResult!8080)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!437153 () Bool)

(assert (=> b!786386 (= e!437153 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20480 a!3186) j!159) a!3186 mask!3328) lt!350703))))

(declare-fun b!786387 () Bool)

(declare-fun e!437152 () Bool)

(assert (=> b!786387 (= e!437152 true)))

(assert (=> b!786387 e!437150))

(declare-fun res!532447 () Bool)

(assert (=> b!786387 (=> (not res!532447) (not e!437150))))

(declare-fun lt!350706 () (_ BitVec 64))

(assert (=> b!786387 (= res!532447 (= lt!350706 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350697 () Unit!27208)

(assert (=> b!786387 (= lt!350697 e!437156)))

(declare-fun c!87378 () Bool)

(assert (=> b!786387 (= c!87378 (= lt!350706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!532454 () Bool)

(assert (=> start!67744 (=> (not res!532454) (not e!437149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67744 (= res!532454 (validMask!0 mask!3328))))

(assert (=> start!67744 e!437149))

(assert (=> start!67744 true))

(declare-fun array_inv!16276 (array!42784) Bool)

(assert (=> start!67744 (array_inv!16276 a!3186)))

(declare-fun e!437148 () Bool)

(declare-fun b!786388 () Bool)

(declare-fun lt!350707 () SeekEntryResult!8080)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42784 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!786388 (= e!437148 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20480 a!3186) j!159) a!3186 mask!3328) lt!350707))))

(declare-fun b!786389 () Bool)

(declare-fun e!437146 () Bool)

(assert (=> b!786389 (= e!437146 e!437152)))

(declare-fun res!532450 () Bool)

(assert (=> b!786389 (=> res!532450 e!437152)))

(assert (=> b!786389 (= res!532450 (= lt!350706 lt!350698))))

(assert (=> b!786389 (= lt!350706 (select (store (arr!20480 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786390 () Bool)

(declare-fun e!437151 () Bool)

(assert (=> b!786390 (= e!437151 e!437146)))

(declare-fun res!532444 () Bool)

(assert (=> b!786390 (=> res!532444 e!437146)))

(declare-fun lt!350705 () SeekEntryResult!8080)

(assert (=> b!786390 (= res!532444 (not (= lt!350705 lt!350703)))))

(assert (=> b!786390 (= lt!350705 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20480 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786391 () Bool)

(declare-fun lt!350699 () SeekEntryResult!8080)

(assert (=> b!786391 (= e!437150 (= lt!350699 lt!350705))))

(declare-fun b!786392 () Bool)

(assert (=> b!786392 (= e!437148 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20480 a!3186) j!159) a!3186 mask!3328) (Found!8080 j!159)))))

(declare-fun b!786393 () Bool)

(declare-fun res!532441 () Bool)

(declare-fun e!437145 () Bool)

(assert (=> b!786393 (=> (not res!532441) (not e!437145))))

(assert (=> b!786393 (= res!532441 e!437148)))

(declare-fun c!87379 () Bool)

(assert (=> b!786393 (= c!87379 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786394 () Bool)

(declare-fun e!437147 () Bool)

(assert (=> b!786394 (= e!437149 e!437147)))

(declare-fun res!532443 () Bool)

(assert (=> b!786394 (=> (not res!532443) (not e!437147))))

(declare-fun lt!350704 () SeekEntryResult!8080)

(assert (=> b!786394 (= res!532443 (or (= lt!350704 (MissingZero!8080 i!1173)) (= lt!350704 (MissingVacant!8080 i!1173))))))

(assert (=> b!786394 (= lt!350704 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786395 () Bool)

(declare-fun e!437155 () Bool)

(assert (=> b!786395 (= e!437155 (not e!437151))))

(declare-fun res!532448 () Bool)

(assert (=> b!786395 (=> res!532448 e!437151)))

(declare-fun lt!350702 () SeekEntryResult!8080)

(assert (=> b!786395 (= res!532448 (or (not (is-Intermediate!8080 lt!350702)) (bvslt x!1131 (x!65628 lt!350702)) (not (= x!1131 (x!65628 lt!350702))) (not (= index!1321 (index!34690 lt!350702)))))))

(assert (=> b!786395 e!437153))

(declare-fun res!532446 () Bool)

(assert (=> b!786395 (=> (not res!532446) (not e!437153))))

(assert (=> b!786395 (= res!532446 (= lt!350699 lt!350703))))

(assert (=> b!786395 (= lt!350703 (Found!8080 j!159))))

(assert (=> b!786395 (= lt!350699 (seekEntryOrOpen!0 (select (arr!20480 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42784 (_ BitVec 32)) Bool)

(assert (=> b!786395 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350700 () Unit!27208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27208)

(assert (=> b!786395 (= lt!350700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786396 () Bool)

(assert (=> b!786396 (= e!437147 e!437145)))

(declare-fun res!532440 () Bool)

(assert (=> b!786396 (=> (not res!532440) (not e!437145))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786396 (= res!532440 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20480 a!3186) j!159) mask!3328) (select (arr!20480 a!3186) j!159) a!3186 mask!3328) lt!350707))))

(assert (=> b!786396 (= lt!350707 (Intermediate!8080 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786397 () Bool)

(declare-fun res!532455 () Bool)

(assert (=> b!786397 (=> (not res!532455) (not e!437147))))

(assert (=> b!786397 (= res!532455 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20901 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20901 a!3186))))))

(declare-fun b!786398 () Bool)

(declare-fun res!532439 () Bool)

(assert (=> b!786398 (=> (not res!532439) (not e!437147))))

(assert (=> b!786398 (= res!532439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786399 () Bool)

(declare-fun res!532442 () Bool)

(assert (=> b!786399 (=> (not res!532442) (not e!437145))))

(assert (=> b!786399 (= res!532442 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20480 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786400 () Bool)

(declare-fun Unit!27211 () Unit!27208)

(assert (=> b!786400 (= e!437156 Unit!27211)))

(assert (=> b!786400 false))

(declare-fun b!786401 () Bool)

(assert (=> b!786401 (= e!437145 e!437155)))

(declare-fun res!532449 () Bool)

(assert (=> b!786401 (=> (not res!532449) (not e!437155))))

(declare-fun lt!350708 () SeekEntryResult!8080)

(assert (=> b!786401 (= res!532449 (= lt!350708 lt!350702))))

(assert (=> b!786401 (= lt!350702 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350698 lt!350701 mask!3328))))

(assert (=> b!786401 (= lt!350708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350698 mask!3328) lt!350698 lt!350701 mask!3328))))

(assert (=> b!786401 (= lt!350698 (select (store (arr!20480 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786401 (= lt!350701 (array!42785 (store (arr!20480 a!3186) i!1173 k!2102) (size!20901 a!3186)))))

(declare-fun b!786402 () Bool)

(declare-fun res!532452 () Bool)

(assert (=> b!786402 (=> (not res!532452) (not e!437147))))

(declare-datatypes ((List!14482 0))(
  ( (Nil!14479) (Cons!14478 (h!15601 (_ BitVec 64)) (t!20797 List!14482)) )
))
(declare-fun arrayNoDuplicates!0 (array!42784 (_ BitVec 32) List!14482) Bool)

(assert (=> b!786402 (= res!532452 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14479))))

(assert (= (and start!67744 res!532454) b!786382))

(assert (= (and b!786382 res!532453) b!786383))

(assert (= (and b!786383 res!532445) b!786384))

(assert (= (and b!786384 res!532457) b!786381))

(assert (= (and b!786381 res!532456) b!786394))

(assert (= (and b!786394 res!532443) b!786398))

(assert (= (and b!786398 res!532439) b!786402))

(assert (= (and b!786402 res!532452) b!786397))

(assert (= (and b!786397 res!532455) b!786396))

(assert (= (and b!786396 res!532440) b!786399))

(assert (= (and b!786399 res!532442) b!786393))

(assert (= (and b!786393 c!87379) b!786388))

(assert (= (and b!786393 (not c!87379)) b!786392))

(assert (= (and b!786393 res!532441) b!786401))

(assert (= (and b!786401 res!532449) b!786395))

(assert (= (and b!786395 res!532446) b!786386))

(assert (= (and b!786395 (not res!532448)) b!786390))

(assert (= (and b!786390 (not res!532444)) b!786389))

(assert (= (and b!786389 (not res!532450)) b!786387))

(assert (= (and b!786387 c!87378) b!786400))

(assert (= (and b!786387 (not c!87378)) b!786380))

(assert (= (and b!786387 res!532447) b!786385))

(assert (= (and b!786385 res!532451) b!786391))

(declare-fun m!728221 () Bool)

(assert (=> b!786398 m!728221))

(declare-fun m!728223 () Bool)

(assert (=> b!786383 m!728223))

(assert (=> b!786383 m!728223))

(declare-fun m!728225 () Bool)

(assert (=> b!786383 m!728225))

(declare-fun m!728227 () Bool)

(assert (=> b!786385 m!728227))

(declare-fun m!728229 () Bool)

(assert (=> b!786385 m!728229))

(declare-fun m!728231 () Bool)

(assert (=> b!786384 m!728231))

(declare-fun m!728233 () Bool)

(assert (=> b!786402 m!728233))

(declare-fun m!728235 () Bool)

(assert (=> b!786401 m!728235))

(declare-fun m!728237 () Bool)

(assert (=> b!786401 m!728237))

(declare-fun m!728239 () Bool)

(assert (=> b!786401 m!728239))

(declare-fun m!728241 () Bool)

(assert (=> b!786401 m!728241))

(assert (=> b!786401 m!728235))

(declare-fun m!728243 () Bool)

(assert (=> b!786401 m!728243))

(declare-fun m!728245 () Bool)

(assert (=> b!786394 m!728245))

(assert (=> b!786389 m!728239))

(declare-fun m!728247 () Bool)

(assert (=> b!786389 m!728247))

(declare-fun m!728249 () Bool)

(assert (=> b!786381 m!728249))

(assert (=> b!786392 m!728223))

(assert (=> b!786392 m!728223))

(declare-fun m!728251 () Bool)

(assert (=> b!786392 m!728251))

(assert (=> b!786388 m!728223))

(assert (=> b!786388 m!728223))

(declare-fun m!728253 () Bool)

(assert (=> b!786388 m!728253))

(assert (=> b!786390 m!728223))

(assert (=> b!786390 m!728223))

(assert (=> b!786390 m!728251))

(declare-fun m!728255 () Bool)

(assert (=> start!67744 m!728255))

(declare-fun m!728257 () Bool)

(assert (=> start!67744 m!728257))

(assert (=> b!786396 m!728223))

(assert (=> b!786396 m!728223))

(declare-fun m!728259 () Bool)

(assert (=> b!786396 m!728259))

(assert (=> b!786396 m!728259))

(assert (=> b!786396 m!728223))

(declare-fun m!728261 () Bool)

(assert (=> b!786396 m!728261))

(declare-fun m!728263 () Bool)

(assert (=> b!786399 m!728263))

(assert (=> b!786395 m!728223))

(assert (=> b!786395 m!728223))

(declare-fun m!728265 () Bool)

(assert (=> b!786395 m!728265))

(declare-fun m!728267 () Bool)

(assert (=> b!786395 m!728267))

(declare-fun m!728269 () Bool)

(assert (=> b!786395 m!728269))

(assert (=> b!786386 m!728223))

(assert (=> b!786386 m!728223))

(declare-fun m!728271 () Bool)

(assert (=> b!786386 m!728271))

(push 1)

