; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45606 () Bool)

(assert start!45606)

(declare-fun b!502381 () Bool)

(declare-fun res!303805 () Bool)

(declare-fun e!294266 () Bool)

(assert (=> b!502381 (=> (not res!303805) (not e!294266))))

(declare-datatypes ((array!32362 0))(
  ( (array!32363 (arr!15561 (Array (_ BitVec 32) (_ BitVec 64))) (size!15925 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32362)

(declare-datatypes ((List!9719 0))(
  ( (Nil!9716) (Cons!9715 (h!10592 (_ BitVec 64)) (t!15947 List!9719)) )
))
(declare-fun arrayNoDuplicates!0 (array!32362 (_ BitVec 32) List!9719) Bool)

(assert (=> b!502381 (= res!303805 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9716))))

(declare-fun b!502382 () Bool)

(declare-fun e!294264 () Bool)

(declare-fun e!294265 () Bool)

(assert (=> b!502382 (= e!294264 e!294265)))

(declare-fun res!303806 () Bool)

(assert (=> b!502382 (=> res!303806 e!294265)))

(declare-datatypes ((SeekEntryResult!4028 0))(
  ( (MissingZero!4028 (index!18300 (_ BitVec 32))) (Found!4028 (index!18301 (_ BitVec 32))) (Intermediate!4028 (undefined!4840 Bool) (index!18302 (_ BitVec 32)) (x!47333 (_ BitVec 32))) (Undefined!4028) (MissingVacant!4028 (index!18303 (_ BitVec 32))) )
))
(declare-fun lt!228349 () SeekEntryResult!4028)

(declare-fun lt!228340 () (_ BitVec 32))

(assert (=> b!502382 (= res!303806 (or (bvsgt (x!47333 lt!228349) #b01111111111111111111111111111110) (bvslt lt!228340 #b00000000000000000000000000000000) (bvsge lt!228340 (size!15925 a!3235)) (bvslt (index!18302 lt!228349) #b00000000000000000000000000000000) (bvsge (index!18302 lt!228349) (size!15925 a!3235)) (not (= lt!228349 (Intermediate!4028 false (index!18302 lt!228349) (x!47333 lt!228349))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502382 (= (index!18302 lt!228349) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15188 0))(
  ( (Unit!15189) )
))
(declare-fun lt!228341 () Unit!15188)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32362 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15188)

(assert (=> b!502382 (= lt!228341 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228340 #b00000000000000000000000000000000 (index!18302 lt!228349) (x!47333 lt!228349) mask!3524))))

(assert (=> b!502382 (and (or (= (select (arr!15561 a!3235) (index!18302 lt!228349)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15561 a!3235) (index!18302 lt!228349)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15561 a!3235) (index!18302 lt!228349)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15561 a!3235) (index!18302 lt!228349)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228343 () Unit!15188)

(declare-fun e!294262 () Unit!15188)

(assert (=> b!502382 (= lt!228343 e!294262)))

(declare-fun c!59567 () Bool)

(assert (=> b!502382 (= c!59567 (= (select (arr!15561 a!3235) (index!18302 lt!228349)) (select (arr!15561 a!3235) j!176)))))

(assert (=> b!502382 (and (bvslt (x!47333 lt!228349) #b01111111111111111111111111111110) (or (= (select (arr!15561 a!3235) (index!18302 lt!228349)) (select (arr!15561 a!3235) j!176)) (= (select (arr!15561 a!3235) (index!18302 lt!228349)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15561 a!3235) (index!18302 lt!228349)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502384 () Bool)

(declare-fun res!303816 () Bool)

(declare-fun e!294263 () Bool)

(assert (=> b!502384 (=> (not res!303816) (not e!294263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502384 (= res!303816 (validKeyInArray!0 (select (arr!15561 a!3235) j!176)))))

(declare-fun b!502385 () Bool)

(assert (=> b!502385 (= e!294263 e!294266)))

(declare-fun res!303815 () Bool)

(assert (=> b!502385 (=> (not res!303815) (not e!294266))))

(declare-fun lt!228342 () SeekEntryResult!4028)

(assert (=> b!502385 (= res!303815 (or (= lt!228342 (MissingZero!4028 i!1204)) (= lt!228342 (MissingVacant!4028 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32362 (_ BitVec 32)) SeekEntryResult!4028)

(assert (=> b!502385 (= lt!228342 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502386 () Bool)

(assert (=> b!502386 (= e!294266 (not e!294264))))

(declare-fun res!303804 () Bool)

(assert (=> b!502386 (=> res!303804 e!294264)))

(declare-fun lt!228344 () (_ BitVec 32))

(declare-fun lt!228345 () (_ BitVec 64))

(declare-fun lt!228348 () array!32362)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32362 (_ BitVec 32)) SeekEntryResult!4028)

(assert (=> b!502386 (= res!303804 (= lt!228349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228344 lt!228345 lt!228348 mask!3524)))))

(assert (=> b!502386 (= lt!228349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228340 (select (arr!15561 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502386 (= lt!228344 (toIndex!0 lt!228345 mask!3524))))

(assert (=> b!502386 (= lt!228345 (select (store (arr!15561 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502386 (= lt!228340 (toIndex!0 (select (arr!15561 a!3235) j!176) mask!3524))))

(assert (=> b!502386 (= lt!228348 (array!32363 (store (arr!15561 a!3235) i!1204 k!2280) (size!15925 a!3235)))))

(declare-fun e!294270 () Bool)

(assert (=> b!502386 e!294270))

(declare-fun res!303814 () Bool)

(assert (=> b!502386 (=> (not res!303814) (not e!294270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32362 (_ BitVec 32)) Bool)

(assert (=> b!502386 (= res!303814 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228339 () Unit!15188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15188)

(assert (=> b!502386 (= lt!228339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502387 () Bool)

(declare-fun res!303813 () Bool)

(assert (=> b!502387 (=> (not res!303813) (not e!294263))))

(assert (=> b!502387 (= res!303813 (validKeyInArray!0 k!2280))))

(declare-fun b!502388 () Bool)

(declare-fun Unit!15190 () Unit!15188)

(assert (=> b!502388 (= e!294262 Unit!15190)))

(declare-fun lt!228347 () Unit!15188)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32362 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15188)

(assert (=> b!502388 (= lt!228347 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228340 #b00000000000000000000000000000000 (index!18302 lt!228349) (x!47333 lt!228349) mask!3524))))

(declare-fun res!303818 () Bool)

(assert (=> b!502388 (= res!303818 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228340 lt!228345 lt!228348 mask!3524) (Intermediate!4028 false (index!18302 lt!228349) (x!47333 lt!228349))))))

(declare-fun e!294268 () Bool)

(assert (=> b!502388 (=> (not res!303818) (not e!294268))))

(assert (=> b!502388 e!294268))

(declare-fun b!502389 () Bool)

(declare-fun e!294269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32362 (_ BitVec 32)) SeekEntryResult!4028)

(assert (=> b!502389 (= e!294269 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228340 (index!18302 lt!228349) (select (arr!15561 a!3235) j!176) a!3235 mask!3524) (Found!4028 j!176))))))

(declare-fun b!502390 () Bool)

(assert (=> b!502390 (= e!294270 (= (seekEntryOrOpen!0 (select (arr!15561 a!3235) j!176) a!3235 mask!3524) (Found!4028 j!176)))))

(declare-fun b!502391 () Bool)

(declare-fun res!303807 () Bool)

(assert (=> b!502391 (=> (not res!303807) (not e!294263))))

(declare-fun arrayContainsKey!0 (array!32362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502391 (= res!303807 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502383 () Bool)

(declare-fun res!303808 () Bool)

(assert (=> b!502383 (=> (not res!303808) (not e!294266))))

(assert (=> b!502383 (= res!303808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!303812 () Bool)

(assert (=> start!45606 (=> (not res!303812) (not e!294263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45606 (= res!303812 (validMask!0 mask!3524))))

(assert (=> start!45606 e!294263))

(assert (=> start!45606 true))

(declare-fun array_inv!11357 (array!32362) Bool)

(assert (=> start!45606 (array_inv!11357 a!3235)))

(declare-fun b!502392 () Bool)

(assert (=> b!502392 (= e!294265 true)))

(declare-fun lt!228346 () SeekEntryResult!4028)

(assert (=> b!502392 (= lt!228346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228340 lt!228345 lt!228348 mask!3524))))

(declare-fun b!502393 () Bool)

(declare-fun res!303810 () Bool)

(assert (=> b!502393 (=> (not res!303810) (not e!294263))))

(assert (=> b!502393 (= res!303810 (and (= (size!15925 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15925 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15925 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502394 () Bool)

(declare-fun Unit!15191 () Unit!15188)

(assert (=> b!502394 (= e!294262 Unit!15191)))

(declare-fun b!502395 () Bool)

(declare-fun res!303811 () Bool)

(assert (=> b!502395 (=> res!303811 e!294265)))

(assert (=> b!502395 (= res!303811 e!294269)))

(declare-fun res!303817 () Bool)

(assert (=> b!502395 (=> (not res!303817) (not e!294269))))

(assert (=> b!502395 (= res!303817 (bvsgt #b00000000000000000000000000000000 (x!47333 lt!228349)))))

(declare-fun b!502396 () Bool)

(assert (=> b!502396 (= e!294268 false)))

(declare-fun b!502397 () Bool)

(declare-fun res!303809 () Bool)

(assert (=> b!502397 (=> res!303809 e!294264)))

(assert (=> b!502397 (= res!303809 (or (undefined!4840 lt!228349) (not (is-Intermediate!4028 lt!228349))))))

(assert (= (and start!45606 res!303812) b!502393))

(assert (= (and b!502393 res!303810) b!502384))

(assert (= (and b!502384 res!303816) b!502387))

(assert (= (and b!502387 res!303813) b!502391))

(assert (= (and b!502391 res!303807) b!502385))

(assert (= (and b!502385 res!303815) b!502383))

(assert (= (and b!502383 res!303808) b!502381))

(assert (= (and b!502381 res!303805) b!502386))

(assert (= (and b!502386 res!303814) b!502390))

(assert (= (and b!502386 (not res!303804)) b!502397))

(assert (= (and b!502397 (not res!303809)) b!502382))

(assert (= (and b!502382 c!59567) b!502388))

(assert (= (and b!502382 (not c!59567)) b!502394))

(assert (= (and b!502388 res!303818) b!502396))

(assert (= (and b!502382 (not res!303806)) b!502395))

(assert (= (and b!502395 res!303817) b!502389))

(assert (= (and b!502395 (not res!303811)) b!502392))

(declare-fun m!483321 () Bool)

(assert (=> b!502390 m!483321))

(assert (=> b!502390 m!483321))

(declare-fun m!483323 () Bool)

(assert (=> b!502390 m!483323))

(declare-fun m!483325 () Bool)

(assert (=> b!502381 m!483325))

(declare-fun m!483327 () Bool)

(assert (=> b!502387 m!483327))

(declare-fun m!483329 () Bool)

(assert (=> b!502385 m!483329))

(declare-fun m!483331 () Bool)

(assert (=> b!502392 m!483331))

(declare-fun m!483333 () Bool)

(assert (=> b!502382 m!483333))

(declare-fun m!483335 () Bool)

(assert (=> b!502382 m!483335))

(assert (=> b!502382 m!483321))

(assert (=> b!502384 m!483321))

(assert (=> b!502384 m!483321))

(declare-fun m!483337 () Bool)

(assert (=> b!502384 m!483337))

(declare-fun m!483339 () Bool)

(assert (=> b!502383 m!483339))

(declare-fun m!483341 () Bool)

(assert (=> b!502386 m!483341))

(declare-fun m!483343 () Bool)

(assert (=> b!502386 m!483343))

(declare-fun m!483345 () Bool)

(assert (=> b!502386 m!483345))

(assert (=> b!502386 m!483321))

(declare-fun m!483347 () Bool)

(assert (=> b!502386 m!483347))

(assert (=> b!502386 m!483321))

(declare-fun m!483349 () Bool)

(assert (=> b!502386 m!483349))

(declare-fun m!483351 () Bool)

(assert (=> b!502386 m!483351))

(assert (=> b!502386 m!483321))

(declare-fun m!483353 () Bool)

(assert (=> b!502386 m!483353))

(declare-fun m!483355 () Bool)

(assert (=> b!502386 m!483355))

(declare-fun m!483357 () Bool)

(assert (=> b!502388 m!483357))

(assert (=> b!502388 m!483331))

(assert (=> b!502389 m!483321))

(assert (=> b!502389 m!483321))

(declare-fun m!483359 () Bool)

(assert (=> b!502389 m!483359))

(declare-fun m!483361 () Bool)

(assert (=> start!45606 m!483361))

(declare-fun m!483363 () Bool)

(assert (=> start!45606 m!483363))

(declare-fun m!483365 () Bool)

(assert (=> b!502391 m!483365))

(push 1)

