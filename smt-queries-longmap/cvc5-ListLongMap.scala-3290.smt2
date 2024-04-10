; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45684 () Bool)

(assert start!45684)

(declare-fun b!504370 () Bool)

(declare-datatypes ((Unit!15344 0))(
  ( (Unit!15345) )
))
(declare-fun e!295320 () Unit!15344)

(declare-fun Unit!15346 () Unit!15344)

(assert (=> b!504370 (= e!295320 Unit!15346)))

(declare-fun b!504371 () Bool)

(declare-fun res!305565 () Bool)

(declare-fun e!295317 () Bool)

(assert (=> b!504371 (=> (not res!305565) (not e!295317))))

(declare-datatypes ((array!32440 0))(
  ( (array!32441 (arr!15600 (Array (_ BitVec 32) (_ BitVec 64))) (size!15964 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32440)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504371 (= res!305565 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504372 () Bool)

(declare-fun res!305572 () Bool)

(assert (=> b!504372 (=> (not res!305572) (not e!295317))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504372 (= res!305572 (and (= (size!15964 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15964 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15964 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504373 () Bool)

(declare-fun e!295322 () Bool)

(assert (=> b!504373 (= e!295322 true)))

(declare-datatypes ((SeekEntryResult!4067 0))(
  ( (MissingZero!4067 (index!18456 (_ BitVec 32))) (Found!4067 (index!18457 (_ BitVec 32))) (Intermediate!4067 (undefined!4879 Bool) (index!18458 (_ BitVec 32)) (x!47476 (_ BitVec 32))) (Undefined!4067) (MissingVacant!4067 (index!18459 (_ BitVec 32))) )
))
(declare-fun lt!229636 () SeekEntryResult!4067)

(declare-fun lt!229635 () (_ BitVec 32))

(declare-fun lt!229626 () (_ BitVec 64))

(declare-fun lt!229634 () array!32440)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32440 (_ BitVec 32)) SeekEntryResult!4067)

(assert (=> b!504373 (= lt!229636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229635 lt!229626 lt!229634 mask!3524))))

(declare-fun b!504374 () Bool)

(declare-fun e!295321 () Bool)

(assert (=> b!504374 (= e!295321 e!295322)))

(declare-fun res!305568 () Bool)

(assert (=> b!504374 (=> res!305568 e!295322)))

(declare-fun lt!229627 () SeekEntryResult!4067)

(assert (=> b!504374 (= res!305568 (or (bvsgt (x!47476 lt!229627) #b01111111111111111111111111111110) (bvslt lt!229635 #b00000000000000000000000000000000) (bvsge lt!229635 (size!15964 a!3235)) (bvslt (index!18458 lt!229627) #b00000000000000000000000000000000) (bvsge (index!18458 lt!229627) (size!15964 a!3235)) (not (= lt!229627 (Intermediate!4067 false (index!18458 lt!229627) (x!47476 lt!229627))))))))

(assert (=> b!504374 (= (index!18458 lt!229627) i!1204)))

(declare-fun lt!229633 () Unit!15344)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32440 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15344)

(assert (=> b!504374 (= lt!229633 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229635 #b00000000000000000000000000000000 (index!18458 lt!229627) (x!47476 lt!229627) mask!3524))))

(assert (=> b!504374 (and (or (= (select (arr!15600 a!3235) (index!18458 lt!229627)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15600 a!3235) (index!18458 lt!229627)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15600 a!3235) (index!18458 lt!229627)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15600 a!3235) (index!18458 lt!229627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229630 () Unit!15344)

(assert (=> b!504374 (= lt!229630 e!295320)))

(declare-fun c!59684 () Bool)

(assert (=> b!504374 (= c!59684 (= (select (arr!15600 a!3235) (index!18458 lt!229627)) (select (arr!15600 a!3235) j!176)))))

(assert (=> b!504374 (and (bvslt (x!47476 lt!229627) #b01111111111111111111111111111110) (or (= (select (arr!15600 a!3235) (index!18458 lt!229627)) (select (arr!15600 a!3235) j!176)) (= (select (arr!15600 a!3235) (index!18458 lt!229627)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15600 a!3235) (index!18458 lt!229627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504375 () Bool)

(declare-fun res!305559 () Bool)

(assert (=> b!504375 (=> (not res!305559) (not e!295317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504375 (= res!305559 (validKeyInArray!0 (select (arr!15600 a!3235) j!176)))))

(declare-fun b!504376 () Bool)

(declare-fun res!305564 () Bool)

(declare-fun e!295315 () Bool)

(assert (=> b!504376 (=> (not res!305564) (not e!295315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32440 (_ BitVec 32)) Bool)

(assert (=> b!504376 (= res!305564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504377 () Bool)

(declare-fun e!295316 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32440 (_ BitVec 32)) SeekEntryResult!4067)

(assert (=> b!504377 (= e!295316 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229635 (index!18458 lt!229627) (select (arr!15600 a!3235) j!176) a!3235 mask!3524) (Found!4067 j!176))))))

(declare-fun b!504378 () Bool)

(assert (=> b!504378 (= e!295315 (not e!295321))))

(declare-fun res!305570 () Bool)

(assert (=> b!504378 (=> res!305570 e!295321)))

(declare-fun lt!229631 () (_ BitVec 32))

(assert (=> b!504378 (= res!305570 (= lt!229627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229631 lt!229626 lt!229634 mask!3524)))))

(assert (=> b!504378 (= lt!229627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229635 (select (arr!15600 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504378 (= lt!229631 (toIndex!0 lt!229626 mask!3524))))

(assert (=> b!504378 (= lt!229626 (select (store (arr!15600 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504378 (= lt!229635 (toIndex!0 (select (arr!15600 a!3235) j!176) mask!3524))))

(assert (=> b!504378 (= lt!229634 (array!32441 (store (arr!15600 a!3235) i!1204 k!2280) (size!15964 a!3235)))))

(declare-fun e!295319 () Bool)

(assert (=> b!504378 e!295319))

(declare-fun res!305563 () Bool)

(assert (=> b!504378 (=> (not res!305563) (not e!295319))))

(assert (=> b!504378 (= res!305563 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229632 () Unit!15344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15344)

(assert (=> b!504378 (= lt!229632 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!305561 () Bool)

(assert (=> start!45684 (=> (not res!305561) (not e!295317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45684 (= res!305561 (validMask!0 mask!3524))))

(assert (=> start!45684 e!295317))

(assert (=> start!45684 true))

(declare-fun array_inv!11396 (array!32440) Bool)

(assert (=> start!45684 (array_inv!11396 a!3235)))

(declare-fun b!504379 () Bool)

(declare-fun res!305566 () Bool)

(assert (=> b!504379 (=> (not res!305566) (not e!295315))))

(declare-datatypes ((List!9758 0))(
  ( (Nil!9755) (Cons!9754 (h!10631 (_ BitVec 64)) (t!15986 List!9758)) )
))
(declare-fun arrayNoDuplicates!0 (array!32440 (_ BitVec 32) List!9758) Bool)

(assert (=> b!504379 (= res!305566 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9755))))

(declare-fun b!504380 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32440 (_ BitVec 32)) SeekEntryResult!4067)

(assert (=> b!504380 (= e!295319 (= (seekEntryOrOpen!0 (select (arr!15600 a!3235) j!176) a!3235 mask!3524) (Found!4067 j!176)))))

(declare-fun b!504381 () Bool)

(declare-fun res!305567 () Bool)

(assert (=> b!504381 (=> res!305567 e!295322)))

(assert (=> b!504381 (= res!305567 e!295316)))

(declare-fun res!305569 () Bool)

(assert (=> b!504381 (=> (not res!305569) (not e!295316))))

(assert (=> b!504381 (= res!305569 (bvsgt #b00000000000000000000000000000000 (x!47476 lt!229627)))))

(declare-fun b!504382 () Bool)

(declare-fun e!295318 () Bool)

(assert (=> b!504382 (= e!295318 false)))

(declare-fun b!504383 () Bool)

(assert (=> b!504383 (= e!295317 e!295315)))

(declare-fun res!305571 () Bool)

(assert (=> b!504383 (=> (not res!305571) (not e!295315))))

(declare-fun lt!229628 () SeekEntryResult!4067)

(assert (=> b!504383 (= res!305571 (or (= lt!229628 (MissingZero!4067 i!1204)) (= lt!229628 (MissingVacant!4067 i!1204))))))

(assert (=> b!504383 (= lt!229628 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504384 () Bool)

(declare-fun res!305560 () Bool)

(assert (=> b!504384 (=> (not res!305560) (not e!295317))))

(assert (=> b!504384 (= res!305560 (validKeyInArray!0 k!2280))))

(declare-fun b!504385 () Bool)

(declare-fun res!305573 () Bool)

(assert (=> b!504385 (=> res!305573 e!295321)))

(assert (=> b!504385 (= res!305573 (or (undefined!4879 lt!229627) (not (is-Intermediate!4067 lt!229627))))))

(declare-fun b!504386 () Bool)

(declare-fun Unit!15347 () Unit!15344)

(assert (=> b!504386 (= e!295320 Unit!15347)))

(declare-fun lt!229629 () Unit!15344)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32440 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15344)

(assert (=> b!504386 (= lt!229629 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229635 #b00000000000000000000000000000000 (index!18458 lt!229627) (x!47476 lt!229627) mask!3524))))

(declare-fun res!305562 () Bool)

(assert (=> b!504386 (= res!305562 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229635 lt!229626 lt!229634 mask!3524) (Intermediate!4067 false (index!18458 lt!229627) (x!47476 lt!229627))))))

(assert (=> b!504386 (=> (not res!305562) (not e!295318))))

(assert (=> b!504386 e!295318))

(assert (= (and start!45684 res!305561) b!504372))

(assert (= (and b!504372 res!305572) b!504375))

(assert (= (and b!504375 res!305559) b!504384))

(assert (= (and b!504384 res!305560) b!504371))

(assert (= (and b!504371 res!305565) b!504383))

(assert (= (and b!504383 res!305571) b!504376))

(assert (= (and b!504376 res!305564) b!504379))

(assert (= (and b!504379 res!305566) b!504378))

(assert (= (and b!504378 res!305563) b!504380))

(assert (= (and b!504378 (not res!305570)) b!504385))

(assert (= (and b!504385 (not res!305573)) b!504374))

(assert (= (and b!504374 c!59684) b!504386))

(assert (= (and b!504374 (not c!59684)) b!504370))

(assert (= (and b!504386 res!305562) b!504382))

(assert (= (and b!504374 (not res!305568)) b!504381))

(assert (= (and b!504381 res!305569) b!504377))

(assert (= (and b!504381 (not res!305567)) b!504373))

(declare-fun m!485115 () Bool)

(assert (=> b!504377 m!485115))

(assert (=> b!504377 m!485115))

(declare-fun m!485117 () Bool)

(assert (=> b!504377 m!485117))

(declare-fun m!485119 () Bool)

(assert (=> start!45684 m!485119))

(declare-fun m!485121 () Bool)

(assert (=> start!45684 m!485121))

(declare-fun m!485123 () Bool)

(assert (=> b!504386 m!485123))

(declare-fun m!485125 () Bool)

(assert (=> b!504386 m!485125))

(declare-fun m!485127 () Bool)

(assert (=> b!504379 m!485127))

(declare-fun m!485129 () Bool)

(assert (=> b!504374 m!485129))

(declare-fun m!485131 () Bool)

(assert (=> b!504374 m!485131))

(assert (=> b!504374 m!485115))

(declare-fun m!485133 () Bool)

(assert (=> b!504384 m!485133))

(assert (=> b!504380 m!485115))

(assert (=> b!504380 m!485115))

(declare-fun m!485135 () Bool)

(assert (=> b!504380 m!485135))

(declare-fun m!485137 () Bool)

(assert (=> b!504383 m!485137))

(declare-fun m!485139 () Bool)

(assert (=> b!504371 m!485139))

(assert (=> b!504373 m!485125))

(assert (=> b!504375 m!485115))

(assert (=> b!504375 m!485115))

(declare-fun m!485141 () Bool)

(assert (=> b!504375 m!485141))

(declare-fun m!485143 () Bool)

(assert (=> b!504376 m!485143))

(declare-fun m!485145 () Bool)

(assert (=> b!504378 m!485145))

(declare-fun m!485147 () Bool)

(assert (=> b!504378 m!485147))

(declare-fun m!485149 () Bool)

(assert (=> b!504378 m!485149))

(declare-fun m!485151 () Bool)

(assert (=> b!504378 m!485151))

(declare-fun m!485153 () Bool)

(assert (=> b!504378 m!485153))

(assert (=> b!504378 m!485115))

(declare-fun m!485155 () Bool)

(assert (=> b!504378 m!485155))

(assert (=> b!504378 m!485115))

(declare-fun m!485157 () Bool)

(assert (=> b!504378 m!485157))

(assert (=> b!504378 m!485115))

(declare-fun m!485159 () Bool)

(assert (=> b!504378 m!485159))

(push 1)

