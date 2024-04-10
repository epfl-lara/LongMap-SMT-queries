; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65606 () Bool)

(assert start!65606)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7603 0))(
  ( (MissingZero!7603 (index!32780 (_ BitVec 32))) (Found!7603 (index!32781 (_ BitVec 32))) (Intermediate!7603 (undefined!8415 Bool) (index!32782 (_ BitVec 32)) (x!63705 (_ BitVec 32))) (Undefined!7603) (MissingVacant!7603 (index!32783 (_ BitVec 32))) )
))
(declare-fun lt!333658 () SeekEntryResult!7603)

(declare-fun b!750375 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41779 0))(
  ( (array!41780 (arr!20003 (Array (_ BitVec 32) (_ BitVec 64))) (size!20424 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41779)

(declare-fun e!418664 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41779 (_ BitVec 32)) SeekEntryResult!7603)

(assert (=> b!750375 (= e!418664 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333658))))

(declare-fun b!750376 () Bool)

(declare-fun e!418660 () Bool)

(declare-fun e!418658 () Bool)

(assert (=> b!750376 (= e!418660 e!418658)))

(declare-fun res!506450 () Bool)

(assert (=> b!750376 (=> (not res!506450) (not e!418658))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750376 (= res!506450 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20003 a!3186) j!159) mask!3328) (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333658))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750376 (= lt!333658 (Intermediate!7603 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750377 () Bool)

(declare-datatypes ((Unit!25792 0))(
  ( (Unit!25793) )
))
(declare-fun e!418661 () Unit!25792)

(declare-fun Unit!25794 () Unit!25792)

(assert (=> b!750377 (= e!418661 Unit!25794)))

(assert (=> b!750377 false))

(declare-fun b!750378 () Bool)

(declare-fun res!506447 () Bool)

(declare-fun e!418657 () Bool)

(assert (=> b!750378 (=> (not res!506447) (not e!418657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750378 (= res!506447 (validKeyInArray!0 (select (arr!20003 a!3186) j!159)))))

(declare-fun b!750379 () Bool)

(declare-fun res!506457 () Bool)

(assert (=> b!750379 (=> (not res!506457) (not e!418657))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750379 (= res!506457 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750380 () Bool)

(declare-fun e!418666 () Bool)

(assert (=> b!750380 (= e!418666 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!418667 () Bool)

(assert (=> b!750380 e!418667))

(declare-fun res!506451 () Bool)

(assert (=> b!750380 (=> (not res!506451) (not e!418667))))

(declare-fun lt!333649 () (_ BitVec 64))

(assert (=> b!750380 (= res!506451 (= lt!333649 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333656 () Unit!25792)

(assert (=> b!750380 (= lt!333656 e!418661)))

(declare-fun c!82348 () Bool)

(assert (=> b!750380 (= c!82348 (= lt!333649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750381 () Bool)

(declare-fun e!418662 () Bool)

(declare-fun e!418663 () Bool)

(assert (=> b!750381 (= e!418662 (not e!418663))))

(declare-fun res!506448 () Bool)

(assert (=> b!750381 (=> res!506448 e!418663)))

(declare-fun lt!333655 () SeekEntryResult!7603)

(assert (=> b!750381 (= res!506448 (or (not (is-Intermediate!7603 lt!333655)) (bvslt x!1131 (x!63705 lt!333655)) (not (= x!1131 (x!63705 lt!333655))) (not (= index!1321 (index!32782 lt!333655)))))))

(declare-fun e!418665 () Bool)

(assert (=> b!750381 e!418665))

(declare-fun res!506445 () Bool)

(assert (=> b!750381 (=> (not res!506445) (not e!418665))))

(declare-fun lt!333657 () SeekEntryResult!7603)

(declare-fun lt!333651 () SeekEntryResult!7603)

(assert (=> b!750381 (= res!506445 (= lt!333657 lt!333651))))

(assert (=> b!750381 (= lt!333651 (Found!7603 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41779 (_ BitVec 32)) SeekEntryResult!7603)

(assert (=> b!750381 (= lt!333657 (seekEntryOrOpen!0 (select (arr!20003 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41779 (_ BitVec 32)) Bool)

(assert (=> b!750381 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333652 () Unit!25792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25792)

(assert (=> b!750381 (= lt!333652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750382 () Bool)

(declare-fun res!506454 () Bool)

(assert (=> b!750382 (=> (not res!506454) (not e!418660))))

(assert (=> b!750382 (= res!506454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750383 () Bool)

(assert (=> b!750383 (= e!418658 e!418662)))

(declare-fun res!506459 () Bool)

(assert (=> b!750383 (=> (not res!506459) (not e!418662))))

(declare-fun lt!333654 () SeekEntryResult!7603)

(assert (=> b!750383 (= res!506459 (= lt!333654 lt!333655))))

(declare-fun lt!333650 () array!41779)

(declare-fun lt!333653 () (_ BitVec 64))

(assert (=> b!750383 (= lt!333655 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333653 lt!333650 mask!3328))))

(assert (=> b!750383 (= lt!333654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333653 mask!3328) lt!333653 lt!333650 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750383 (= lt!333653 (select (store (arr!20003 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750383 (= lt!333650 (array!41780 (store (arr!20003 a!3186) i!1173 k!2102) (size!20424 a!3186)))))

(declare-fun b!750384 () Bool)

(assert (=> b!750384 (= e!418657 e!418660)))

(declare-fun res!506453 () Bool)

(assert (=> b!750384 (=> (not res!506453) (not e!418660))))

(declare-fun lt!333659 () SeekEntryResult!7603)

(assert (=> b!750384 (= res!506453 (or (= lt!333659 (MissingZero!7603 i!1173)) (= lt!333659 (MissingVacant!7603 i!1173))))))

(assert (=> b!750384 (= lt!333659 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750385 () Bool)

(declare-fun res!506458 () Bool)

(assert (=> b!750385 (=> (not res!506458) (not e!418660))))

(assert (=> b!750385 (= res!506458 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20424 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20424 a!3186))))))

(declare-fun b!750386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41779 (_ BitVec 32)) SeekEntryResult!7603)

(assert (=> b!750386 (= e!418667 (= (seekEntryOrOpen!0 lt!333653 lt!333650 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333653 lt!333650 mask!3328)))))

(declare-fun res!506443 () Bool)

(assert (=> start!65606 (=> (not res!506443) (not e!418657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65606 (= res!506443 (validMask!0 mask!3328))))

(assert (=> start!65606 e!418657))

(assert (=> start!65606 true))

(declare-fun array_inv!15799 (array!41779) Bool)

(assert (=> start!65606 (array_inv!15799 a!3186)))

(declare-fun b!750387 () Bool)

(declare-fun res!506452 () Bool)

(assert (=> b!750387 (=> (not res!506452) (not e!418658))))

(assert (=> b!750387 (= res!506452 e!418664)))

(declare-fun c!82347 () Bool)

(assert (=> b!750387 (= c!82347 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750388 () Bool)

(declare-fun res!506446 () Bool)

(assert (=> b!750388 (=> (not res!506446) (not e!418657))))

(assert (=> b!750388 (= res!506446 (and (= (size!20424 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20424 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20424 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750389 () Bool)

(declare-fun res!506442 () Bool)

(assert (=> b!750389 (=> (not res!506442) (not e!418660))))

(declare-datatypes ((List!14005 0))(
  ( (Nil!14002) (Cons!14001 (h!15073 (_ BitVec 64)) (t!20320 List!14005)) )
))
(declare-fun arrayNoDuplicates!0 (array!41779 (_ BitVec 32) List!14005) Bool)

(assert (=> b!750389 (= res!506442 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14002))))

(declare-fun b!750390 () Bool)

(assert (=> b!750390 (= e!418665 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333651))))

(declare-fun b!750391 () Bool)

(declare-fun res!506449 () Bool)

(assert (=> b!750391 (=> res!506449 e!418663)))

(assert (=> b!750391 (= res!506449 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333651)))))

(declare-fun b!750392 () Bool)

(declare-fun res!506455 () Bool)

(assert (=> b!750392 (=> (not res!506455) (not e!418658))))

(assert (=> b!750392 (= res!506455 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20003 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750393 () Bool)

(assert (=> b!750393 (= e!418664 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) (Found!7603 j!159)))))

(declare-fun b!750394 () Bool)

(declare-fun res!506444 () Bool)

(assert (=> b!750394 (=> (not res!506444) (not e!418657))))

(assert (=> b!750394 (= res!506444 (validKeyInArray!0 k!2102))))

(declare-fun b!750395 () Bool)

(assert (=> b!750395 (= e!418663 e!418666)))

(declare-fun res!506456 () Bool)

(assert (=> b!750395 (=> res!506456 e!418666)))

(assert (=> b!750395 (= res!506456 (= lt!333649 lt!333653))))

(assert (=> b!750395 (= lt!333649 (select (store (arr!20003 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750396 () Bool)

(declare-fun Unit!25795 () Unit!25792)

(assert (=> b!750396 (= e!418661 Unit!25795)))

(assert (= (and start!65606 res!506443) b!750388))

(assert (= (and b!750388 res!506446) b!750378))

(assert (= (and b!750378 res!506447) b!750394))

(assert (= (and b!750394 res!506444) b!750379))

(assert (= (and b!750379 res!506457) b!750384))

(assert (= (and b!750384 res!506453) b!750382))

(assert (= (and b!750382 res!506454) b!750389))

(assert (= (and b!750389 res!506442) b!750385))

(assert (= (and b!750385 res!506458) b!750376))

(assert (= (and b!750376 res!506450) b!750392))

(assert (= (and b!750392 res!506455) b!750387))

(assert (= (and b!750387 c!82347) b!750375))

(assert (= (and b!750387 (not c!82347)) b!750393))

(assert (= (and b!750387 res!506452) b!750383))

(assert (= (and b!750383 res!506459) b!750381))

(assert (= (and b!750381 res!506445) b!750390))

(assert (= (and b!750381 (not res!506448)) b!750391))

(assert (= (and b!750391 (not res!506449)) b!750395))

(assert (= (and b!750395 (not res!506456)) b!750380))

(assert (= (and b!750380 c!82348) b!750377))

(assert (= (and b!750380 (not c!82348)) b!750396))

(assert (= (and b!750380 res!506451) b!750386))

(declare-fun m!699783 () Bool)

(assert (=> b!750391 m!699783))

(assert (=> b!750391 m!699783))

(declare-fun m!699785 () Bool)

(assert (=> b!750391 m!699785))

(declare-fun m!699787 () Bool)

(assert (=> b!750394 m!699787))

(declare-fun m!699789 () Bool)

(assert (=> b!750383 m!699789))

(declare-fun m!699791 () Bool)

(assert (=> b!750383 m!699791))

(assert (=> b!750383 m!699791))

(declare-fun m!699793 () Bool)

(assert (=> b!750383 m!699793))

(declare-fun m!699795 () Bool)

(assert (=> b!750383 m!699795))

(declare-fun m!699797 () Bool)

(assert (=> b!750383 m!699797))

(declare-fun m!699799 () Bool)

(assert (=> start!65606 m!699799))

(declare-fun m!699801 () Bool)

(assert (=> start!65606 m!699801))

(declare-fun m!699803 () Bool)

(assert (=> b!750389 m!699803))

(assert (=> b!750375 m!699783))

(assert (=> b!750375 m!699783))

(declare-fun m!699805 () Bool)

(assert (=> b!750375 m!699805))

(assert (=> b!750378 m!699783))

(assert (=> b!750378 m!699783))

(declare-fun m!699807 () Bool)

(assert (=> b!750378 m!699807))

(assert (=> b!750395 m!699795))

(declare-fun m!699809 () Bool)

(assert (=> b!750395 m!699809))

(declare-fun m!699811 () Bool)

(assert (=> b!750386 m!699811))

(declare-fun m!699813 () Bool)

(assert (=> b!750386 m!699813))

(assert (=> b!750381 m!699783))

(assert (=> b!750381 m!699783))

(declare-fun m!699815 () Bool)

(assert (=> b!750381 m!699815))

(declare-fun m!699817 () Bool)

(assert (=> b!750381 m!699817))

(declare-fun m!699819 () Bool)

(assert (=> b!750381 m!699819))

(declare-fun m!699821 () Bool)

(assert (=> b!750379 m!699821))

(declare-fun m!699823 () Bool)

(assert (=> b!750392 m!699823))

(declare-fun m!699825 () Bool)

(assert (=> b!750384 m!699825))

(assert (=> b!750393 m!699783))

(assert (=> b!750393 m!699783))

(assert (=> b!750393 m!699785))

(assert (=> b!750376 m!699783))

(assert (=> b!750376 m!699783))

(declare-fun m!699827 () Bool)

(assert (=> b!750376 m!699827))

(assert (=> b!750376 m!699827))

(assert (=> b!750376 m!699783))

(declare-fun m!699829 () Bool)

(assert (=> b!750376 m!699829))

(assert (=> b!750390 m!699783))

(assert (=> b!750390 m!699783))

(declare-fun m!699831 () Bool)

(assert (=> b!750390 m!699831))

(declare-fun m!699833 () Bool)

(assert (=> b!750382 m!699833))

(push 1)

