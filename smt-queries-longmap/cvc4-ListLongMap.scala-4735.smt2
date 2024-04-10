; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65474 () Bool)

(assert start!65474)

(declare-fun b!746257 () Bool)

(declare-fun e!416757 () Bool)

(declare-fun e!416759 () Bool)

(assert (=> b!746257 (= e!416757 e!416759)))

(declare-fun res!503042 () Bool)

(assert (=> b!746257 (=> (not res!503042) (not e!416759))))

(declare-datatypes ((SeekEntryResult!7537 0))(
  ( (MissingZero!7537 (index!32516 (_ BitVec 32))) (Found!7537 (index!32517 (_ BitVec 32))) (Intermediate!7537 (undefined!8349 Bool) (index!32518 (_ BitVec 32)) (x!63463 (_ BitVec 32))) (Undefined!7537) (MissingVacant!7537 (index!32519 (_ BitVec 32))) )
))
(declare-fun lt!331620 () SeekEntryResult!7537)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746257 (= res!503042 (or (= lt!331620 (MissingZero!7537 i!1173)) (= lt!331620 (MissingVacant!7537 i!1173))))))

(declare-datatypes ((array!41647 0))(
  ( (array!41648 (arr!19937 (Array (_ BitVec 32) (_ BitVec 64))) (size!20358 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41647)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41647 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!746257 (= lt!331620 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746258 () Bool)

(declare-fun res!503048 () Bool)

(assert (=> b!746258 (=> (not res!503048) (not e!416757))))

(declare-fun arrayContainsKey!0 (array!41647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746258 (= res!503048 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746259 () Bool)

(declare-fun e!416752 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!746259 (= e!416752 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!331617 () SeekEntryResult!7537)

(declare-fun lt!331618 () SeekEntryResult!7537)

(assert (=> b!746259 (= lt!331617 lt!331618)))

(declare-fun res!503057 () Bool)

(assert (=> start!65474 (=> (not res!503057) (not e!416757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65474 (= res!503057 (validMask!0 mask!3328))))

(assert (=> start!65474 e!416757))

(assert (=> start!65474 true))

(declare-fun array_inv!15733 (array!41647) Bool)

(assert (=> start!65474 (array_inv!15733 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!416756 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!746260 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41647 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!746260 (= e!416756 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19937 a!3186) j!159) a!3186 mask!3328) (Found!7537 j!159)))))

(declare-fun b!746261 () Bool)

(declare-fun e!416753 () Bool)

(declare-fun e!416754 () Bool)

(assert (=> b!746261 (= e!416753 (not e!416754))))

(declare-fun res!503053 () Bool)

(assert (=> b!746261 (=> res!503053 e!416754)))

(declare-fun lt!331623 () SeekEntryResult!7537)

(assert (=> b!746261 (= res!503053 (or (not (is-Intermediate!7537 lt!331623)) (bvslt x!1131 (x!63463 lt!331623)) (not (= x!1131 (x!63463 lt!331623))) (not (= index!1321 (index!32518 lt!331623)))))))

(declare-fun e!416758 () Bool)

(assert (=> b!746261 e!416758))

(declare-fun res!503045 () Bool)

(assert (=> b!746261 (=> (not res!503045) (not e!416758))))

(declare-fun lt!331622 () SeekEntryResult!7537)

(assert (=> b!746261 (= res!503045 (= lt!331617 lt!331622))))

(assert (=> b!746261 (= lt!331622 (Found!7537 j!159))))

(assert (=> b!746261 (= lt!331617 (seekEntryOrOpen!0 (select (arr!19937 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41647 (_ BitVec 32)) Bool)

(assert (=> b!746261 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25554 0))(
  ( (Unit!25555) )
))
(declare-fun lt!331619 () Unit!25554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25554)

(assert (=> b!746261 (= lt!331619 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746262 () Bool)

(declare-fun res!503054 () Bool)

(assert (=> b!746262 (=> (not res!503054) (not e!416757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746262 (= res!503054 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!746263 () Bool)

(assert (=> b!746263 (= e!416758 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19937 a!3186) j!159) a!3186 mask!3328) lt!331622))))

(declare-fun b!746264 () Bool)

(declare-fun lt!331616 () SeekEntryResult!7537)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41647 (_ BitVec 32)) SeekEntryResult!7537)

(assert (=> b!746264 (= e!416756 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19937 a!3186) j!159) a!3186 mask!3328) lt!331616))))

(declare-fun b!746265 () Bool)

(declare-fun e!416755 () Bool)

(assert (=> b!746265 (= e!416755 e!416753)))

(declare-fun res!503055 () Bool)

(assert (=> b!746265 (=> (not res!503055) (not e!416753))))

(declare-fun lt!331624 () SeekEntryResult!7537)

(assert (=> b!746265 (= res!503055 (= lt!331624 lt!331623))))

(declare-fun lt!331625 () array!41647)

(declare-fun lt!331621 () (_ BitVec 64))

(assert (=> b!746265 (= lt!331623 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331621 lt!331625 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746265 (= lt!331624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331621 mask!3328) lt!331621 lt!331625 mask!3328))))

(assert (=> b!746265 (= lt!331621 (select (store (arr!19937 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746265 (= lt!331625 (array!41648 (store (arr!19937 a!3186) i!1173 k!2102) (size!20358 a!3186)))))

(declare-fun b!746266 () Bool)

(assert (=> b!746266 (= e!416759 e!416755)))

(declare-fun res!503056 () Bool)

(assert (=> b!746266 (=> (not res!503056) (not e!416755))))

(assert (=> b!746266 (= res!503056 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19937 a!3186) j!159) mask!3328) (select (arr!19937 a!3186) j!159) a!3186 mask!3328) lt!331616))))

(assert (=> b!746266 (= lt!331616 (Intermediate!7537 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746267 () Bool)

(declare-fun res!503050 () Bool)

(assert (=> b!746267 (=> (not res!503050) (not e!416759))))

(assert (=> b!746267 (= res!503050 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20358 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20358 a!3186))))))

(declare-fun b!746268 () Bool)

(declare-fun res!503052 () Bool)

(assert (=> b!746268 (=> (not res!503052) (not e!416757))))

(assert (=> b!746268 (= res!503052 (and (= (size!20358 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20358 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20358 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746269 () Bool)

(declare-fun res!503049 () Bool)

(assert (=> b!746269 (=> (not res!503049) (not e!416759))))

(declare-datatypes ((List!13939 0))(
  ( (Nil!13936) (Cons!13935 (h!15007 (_ BitVec 64)) (t!20254 List!13939)) )
))
(declare-fun arrayNoDuplicates!0 (array!41647 (_ BitVec 32) List!13939) Bool)

(assert (=> b!746269 (= res!503049 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13936))))

(declare-fun b!746270 () Bool)

(declare-fun res!503044 () Bool)

(assert (=> b!746270 (=> (not res!503044) (not e!416757))))

(assert (=> b!746270 (= res!503044 (validKeyInArray!0 (select (arr!19937 a!3186) j!159)))))

(declare-fun b!746271 () Bool)

(declare-fun res!503051 () Bool)

(assert (=> b!746271 (=> (not res!503051) (not e!416759))))

(assert (=> b!746271 (= res!503051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746272 () Bool)

(declare-fun res!503047 () Bool)

(assert (=> b!746272 (=> (not res!503047) (not e!416755))))

(assert (=> b!746272 (= res!503047 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19937 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746273 () Bool)

(declare-fun res!503043 () Bool)

(assert (=> b!746273 (=> (not res!503043) (not e!416755))))

(assert (=> b!746273 (= res!503043 e!416756)))

(declare-fun c!81988 () Bool)

(assert (=> b!746273 (= c!81988 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746274 () Bool)

(assert (=> b!746274 (= e!416754 e!416752)))

(declare-fun res!503046 () Bool)

(assert (=> b!746274 (=> res!503046 e!416752)))

(assert (=> b!746274 (= res!503046 (or (not (= lt!331618 lt!331622)) (= (select (store (arr!19937 a!3186) i!1173 k!2102) index!1321) lt!331621) (not (= (select (store (arr!19937 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746274 (= lt!331618 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19937 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65474 res!503057) b!746268))

(assert (= (and b!746268 res!503052) b!746270))

(assert (= (and b!746270 res!503044) b!746262))

(assert (= (and b!746262 res!503054) b!746258))

(assert (= (and b!746258 res!503048) b!746257))

(assert (= (and b!746257 res!503042) b!746271))

(assert (= (and b!746271 res!503051) b!746269))

(assert (= (and b!746269 res!503049) b!746267))

(assert (= (and b!746267 res!503050) b!746266))

(assert (= (and b!746266 res!503056) b!746272))

(assert (= (and b!746272 res!503047) b!746273))

(assert (= (and b!746273 c!81988) b!746264))

(assert (= (and b!746273 (not c!81988)) b!746260))

(assert (= (and b!746273 res!503043) b!746265))

(assert (= (and b!746265 res!503055) b!746261))

(assert (= (and b!746261 res!503045) b!746263))

(assert (= (and b!746261 (not res!503053)) b!746274))

(assert (= (and b!746274 (not res!503046)) b!746259))

(declare-fun m!696535 () Bool)

(assert (=> start!65474 m!696535))

(declare-fun m!696537 () Bool)

(assert (=> start!65474 m!696537))

(declare-fun m!696539 () Bool)

(assert (=> b!746261 m!696539))

(assert (=> b!746261 m!696539))

(declare-fun m!696541 () Bool)

(assert (=> b!746261 m!696541))

(declare-fun m!696543 () Bool)

(assert (=> b!746261 m!696543))

(declare-fun m!696545 () Bool)

(assert (=> b!746261 m!696545))

(declare-fun m!696547 () Bool)

(assert (=> b!746258 m!696547))

(assert (=> b!746270 m!696539))

(assert (=> b!746270 m!696539))

(declare-fun m!696549 () Bool)

(assert (=> b!746270 m!696549))

(declare-fun m!696551 () Bool)

(assert (=> b!746257 m!696551))

(declare-fun m!696553 () Bool)

(assert (=> b!746272 m!696553))

(assert (=> b!746263 m!696539))

(assert (=> b!746263 m!696539))

(declare-fun m!696555 () Bool)

(assert (=> b!746263 m!696555))

(declare-fun m!696557 () Bool)

(assert (=> b!746269 m!696557))

(assert (=> b!746264 m!696539))

(assert (=> b!746264 m!696539))

(declare-fun m!696559 () Bool)

(assert (=> b!746264 m!696559))

(declare-fun m!696561 () Bool)

(assert (=> b!746271 m!696561))

(assert (=> b!746266 m!696539))

(assert (=> b!746266 m!696539))

(declare-fun m!696563 () Bool)

(assert (=> b!746266 m!696563))

(assert (=> b!746266 m!696563))

(assert (=> b!746266 m!696539))

(declare-fun m!696565 () Bool)

(assert (=> b!746266 m!696565))

(declare-fun m!696567 () Bool)

(assert (=> b!746274 m!696567))

(declare-fun m!696569 () Bool)

(assert (=> b!746274 m!696569))

(assert (=> b!746274 m!696539))

(assert (=> b!746274 m!696539))

(declare-fun m!696571 () Bool)

(assert (=> b!746274 m!696571))

(declare-fun m!696573 () Bool)

(assert (=> b!746262 m!696573))

(assert (=> b!746260 m!696539))

(assert (=> b!746260 m!696539))

(assert (=> b!746260 m!696571))

(declare-fun m!696575 () Bool)

(assert (=> b!746265 m!696575))

(declare-fun m!696577 () Bool)

(assert (=> b!746265 m!696577))

(assert (=> b!746265 m!696575))

(assert (=> b!746265 m!696567))

(declare-fun m!696579 () Bool)

(assert (=> b!746265 m!696579))

(declare-fun m!696581 () Bool)

(assert (=> b!746265 m!696581))

(push 1)

(assert (not b!746257))

(assert (not b!746274))

(assert (not b!746264))

(assert (not b!746270))

(assert (not b!746266))

(assert (not b!746263))

(assert (not b!746258))

(assert (not b!746262))

(assert (not b!746265))

(assert (not b!746261))

(assert (not b!746271))

(assert (not b!746269))

(assert (not b!746260))

(assert (not start!65474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

