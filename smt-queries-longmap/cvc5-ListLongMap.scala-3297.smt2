; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45726 () Bool)

(assert start!45726)

(declare-fun b!505441 () Bool)

(declare-fun e!295883 () Bool)

(assert (=> b!505441 (= e!295883 false)))

(declare-fun b!505442 () Bool)

(declare-fun e!295885 () Bool)

(assert (=> b!505442 (= e!295885 true)))

(declare-datatypes ((array!32482 0))(
  ( (array!32483 (arr!15621 (Array (_ BitVec 32) (_ BitVec 64))) (size!15985 (_ BitVec 32))) )
))
(declare-fun lt!230359 () array!32482)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4088 0))(
  ( (MissingZero!4088 (index!18540 (_ BitVec 32))) (Found!4088 (index!18541 (_ BitVec 32))) (Intermediate!4088 (undefined!4900 Bool) (index!18542 (_ BitVec 32)) (x!47553 (_ BitVec 32))) (Undefined!4088) (MissingVacant!4088 (index!18543 (_ BitVec 32))) )
))
(declare-fun lt!230360 () SeekEntryResult!4088)

(declare-fun lt!230368 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32482 (_ BitVec 32)) SeekEntryResult!4088)

(assert (=> b!505442 (= (seekEntryOrOpen!0 lt!230368 lt!230359 mask!3524) lt!230360)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32482)

(declare-fun lt!230362 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230371 () SeekEntryResult!4088)

(declare-datatypes ((Unit!15428 0))(
  ( (Unit!15429) )
))
(declare-fun lt!230366 () Unit!15428)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15428)

(assert (=> b!505442 (= lt!230366 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230362 #b00000000000000000000000000000000 (index!18542 lt!230371) (x!47553 lt!230371) mask!3524))))

(declare-fun b!505443 () Bool)

(declare-fun res!306504 () Bool)

(assert (=> b!505443 (=> res!306504 e!295885)))

(declare-fun lt!230363 () SeekEntryResult!4088)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32482 (_ BitVec 32)) SeekEntryResult!4088)

(assert (=> b!505443 (= res!306504 (not (= lt!230363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230362 lt!230368 lt!230359 mask!3524))))))

(declare-fun b!505444 () Bool)

(declare-fun e!295888 () Bool)

(declare-fun e!295882 () Bool)

(assert (=> b!505444 (= e!295888 e!295882)))

(declare-fun res!306508 () Bool)

(assert (=> b!505444 (=> (not res!306508) (not e!295882))))

(declare-fun lt!230361 () SeekEntryResult!4088)

(assert (=> b!505444 (= res!306508 (or (= lt!230361 (MissingZero!4088 i!1204)) (= lt!230361 (MissingVacant!4088 i!1204))))))

(assert (=> b!505444 (= lt!230361 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505445 () Bool)

(declare-fun res!306514 () Bool)

(assert (=> b!505445 (=> (not res!306514) (not e!295888))))

(assert (=> b!505445 (= res!306514 (and (= (size!15985 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15985 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15985 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505446 () Bool)

(declare-fun e!295887 () Unit!15428)

(declare-fun Unit!15430 () Unit!15428)

(assert (=> b!505446 (= e!295887 Unit!15430)))

(declare-fun b!505448 () Bool)

(declare-fun res!306513 () Bool)

(assert (=> b!505448 (=> (not res!306513) (not e!295882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32482 (_ BitVec 32)) Bool)

(assert (=> b!505448 (= res!306513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!295889 () Bool)

(declare-fun b!505449 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32482 (_ BitVec 32)) SeekEntryResult!4088)

(assert (=> b!505449 (= e!295889 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230362 (index!18542 lt!230371) (select (arr!15621 a!3235) j!176) a!3235 mask!3524) lt!230360)))))

(declare-fun b!505450 () Bool)

(declare-fun e!295890 () Bool)

(assert (=> b!505450 (= e!295890 e!295885)))

(declare-fun res!306511 () Bool)

(assert (=> b!505450 (=> res!306511 e!295885)))

(assert (=> b!505450 (= res!306511 (or (bvsgt (x!47553 lt!230371) #b01111111111111111111111111111110) (bvslt lt!230362 #b00000000000000000000000000000000) (bvsge lt!230362 (size!15985 a!3235)) (bvslt (index!18542 lt!230371) #b00000000000000000000000000000000) (bvsge (index!18542 lt!230371) (size!15985 a!3235)) (not (= lt!230371 (Intermediate!4088 false (index!18542 lt!230371) (x!47553 lt!230371))))))))

(assert (=> b!505450 (= (index!18542 lt!230371) i!1204)))

(declare-fun lt!230369 () Unit!15428)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15428)

(assert (=> b!505450 (= lt!230369 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230362 #b00000000000000000000000000000000 (index!18542 lt!230371) (x!47553 lt!230371) mask!3524))))

(assert (=> b!505450 (and (or (= (select (arr!15621 a!3235) (index!18542 lt!230371)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15621 a!3235) (index!18542 lt!230371)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15621 a!3235) (index!18542 lt!230371)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15621 a!3235) (index!18542 lt!230371)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230364 () Unit!15428)

(assert (=> b!505450 (= lt!230364 e!295887)))

(declare-fun c!59747 () Bool)

(assert (=> b!505450 (= c!59747 (= (select (arr!15621 a!3235) (index!18542 lt!230371)) (select (arr!15621 a!3235) j!176)))))

(assert (=> b!505450 (and (bvslt (x!47553 lt!230371) #b01111111111111111111111111111110) (or (= (select (arr!15621 a!3235) (index!18542 lt!230371)) (select (arr!15621 a!3235) j!176)) (= (select (arr!15621 a!3235) (index!18542 lt!230371)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15621 a!3235) (index!18542 lt!230371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505451 () Bool)

(declare-fun res!306518 () Bool)

(assert (=> b!505451 (=> res!306518 e!295885)))

(assert (=> b!505451 (= res!306518 e!295889)))

(declare-fun res!306512 () Bool)

(assert (=> b!505451 (=> (not res!306512) (not e!295889))))

(assert (=> b!505451 (= res!306512 (bvsgt #b00000000000000000000000000000000 (x!47553 lt!230371)))))

(declare-fun e!295884 () Bool)

(declare-fun b!505452 () Bool)

(assert (=> b!505452 (= e!295884 (= (seekEntryOrOpen!0 (select (arr!15621 a!3235) j!176) a!3235 mask!3524) (Found!4088 j!176)))))

(declare-fun b!505453 () Bool)

(declare-fun res!306505 () Bool)

(assert (=> b!505453 (=> (not res!306505) (not e!295888))))

(declare-fun arrayContainsKey!0 (array!32482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505453 (= res!306505 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505454 () Bool)

(declare-fun Unit!15431 () Unit!15428)

(assert (=> b!505454 (= e!295887 Unit!15431)))

(declare-fun lt!230370 () Unit!15428)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15428)

(assert (=> b!505454 (= lt!230370 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230362 #b00000000000000000000000000000000 (index!18542 lt!230371) (x!47553 lt!230371) mask!3524))))

(declare-fun res!306515 () Bool)

(assert (=> b!505454 (= res!306515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230362 lt!230368 lt!230359 mask!3524) (Intermediate!4088 false (index!18542 lt!230371) (x!47553 lt!230371))))))

(assert (=> b!505454 (=> (not res!306515) (not e!295883))))

(assert (=> b!505454 e!295883))

(declare-fun b!505455 () Bool)

(declare-fun res!306506 () Bool)

(assert (=> b!505455 (=> (not res!306506) (not e!295888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505455 (= res!306506 (validKeyInArray!0 k!2280))))

(declare-fun b!505456 () Bool)

(assert (=> b!505456 (= e!295882 (not e!295890))))

(declare-fun res!306510 () Bool)

(assert (=> b!505456 (=> res!306510 e!295890)))

(assert (=> b!505456 (= res!306510 (or (= lt!230371 lt!230363) (undefined!4900 lt!230371) (not (is-Intermediate!4088 lt!230371))))))

(declare-fun lt!230365 () (_ BitVec 32))

(assert (=> b!505456 (= lt!230363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230365 lt!230368 lt!230359 mask!3524))))

(assert (=> b!505456 (= lt!230371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230362 (select (arr!15621 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505456 (= lt!230365 (toIndex!0 lt!230368 mask!3524))))

(assert (=> b!505456 (= lt!230368 (select (store (arr!15621 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505456 (= lt!230362 (toIndex!0 (select (arr!15621 a!3235) j!176) mask!3524))))

(assert (=> b!505456 (= lt!230359 (array!32483 (store (arr!15621 a!3235) i!1204 k!2280) (size!15985 a!3235)))))

(assert (=> b!505456 (= lt!230360 (Found!4088 j!176))))

(assert (=> b!505456 e!295884))

(declare-fun res!306509 () Bool)

(assert (=> b!505456 (=> (not res!306509) (not e!295884))))

(assert (=> b!505456 (= res!306509 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230367 () Unit!15428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15428)

(assert (=> b!505456 (= lt!230367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505457 () Bool)

(declare-fun res!306516 () Bool)

(assert (=> b!505457 (=> (not res!306516) (not e!295888))))

(assert (=> b!505457 (= res!306516 (validKeyInArray!0 (select (arr!15621 a!3235) j!176)))))

(declare-fun res!306507 () Bool)

(assert (=> start!45726 (=> (not res!306507) (not e!295888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45726 (= res!306507 (validMask!0 mask!3524))))

(assert (=> start!45726 e!295888))

(assert (=> start!45726 true))

(declare-fun array_inv!11417 (array!32482) Bool)

(assert (=> start!45726 (array_inv!11417 a!3235)))

(declare-fun b!505447 () Bool)

(declare-fun res!306517 () Bool)

(assert (=> b!505447 (=> (not res!306517) (not e!295882))))

(declare-datatypes ((List!9779 0))(
  ( (Nil!9776) (Cons!9775 (h!10652 (_ BitVec 64)) (t!16007 List!9779)) )
))
(declare-fun arrayNoDuplicates!0 (array!32482 (_ BitVec 32) List!9779) Bool)

(assert (=> b!505447 (= res!306517 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9776))))

(assert (= (and start!45726 res!306507) b!505445))

(assert (= (and b!505445 res!306514) b!505457))

(assert (= (and b!505457 res!306516) b!505455))

(assert (= (and b!505455 res!306506) b!505453))

(assert (= (and b!505453 res!306505) b!505444))

(assert (= (and b!505444 res!306508) b!505448))

(assert (= (and b!505448 res!306513) b!505447))

(assert (= (and b!505447 res!306517) b!505456))

(assert (= (and b!505456 res!306509) b!505452))

(assert (= (and b!505456 (not res!306510)) b!505450))

(assert (= (and b!505450 c!59747) b!505454))

(assert (= (and b!505450 (not c!59747)) b!505446))

(assert (= (and b!505454 res!306515) b!505441))

(assert (= (and b!505450 (not res!306511)) b!505451))

(assert (= (and b!505451 res!306512) b!505449))

(assert (= (and b!505451 (not res!306518)) b!505443))

(assert (= (and b!505443 (not res!306504)) b!505442))

(declare-fun m!486105 () Bool)

(assert (=> b!505455 m!486105))

(declare-fun m!486107 () Bool)

(assert (=> b!505454 m!486107))

(declare-fun m!486109 () Bool)

(assert (=> b!505454 m!486109))

(declare-fun m!486111 () Bool)

(assert (=> start!45726 m!486111))

(declare-fun m!486113 () Bool)

(assert (=> start!45726 m!486113))

(declare-fun m!486115 () Bool)

(assert (=> b!505442 m!486115))

(declare-fun m!486117 () Bool)

(assert (=> b!505442 m!486117))

(assert (=> b!505443 m!486109))

(declare-fun m!486119 () Bool)

(assert (=> b!505453 m!486119))

(declare-fun m!486121 () Bool)

(assert (=> b!505447 m!486121))

(declare-fun m!486123 () Bool)

(assert (=> b!505444 m!486123))

(declare-fun m!486125 () Bool)

(assert (=> b!505448 m!486125))

(declare-fun m!486127 () Bool)

(assert (=> b!505452 m!486127))

(assert (=> b!505452 m!486127))

(declare-fun m!486129 () Bool)

(assert (=> b!505452 m!486129))

(assert (=> b!505449 m!486127))

(assert (=> b!505449 m!486127))

(declare-fun m!486131 () Bool)

(assert (=> b!505449 m!486131))

(declare-fun m!486133 () Bool)

(assert (=> b!505450 m!486133))

(declare-fun m!486135 () Bool)

(assert (=> b!505450 m!486135))

(assert (=> b!505450 m!486127))

(declare-fun m!486137 () Bool)

(assert (=> b!505456 m!486137))

(assert (=> b!505456 m!486127))

(declare-fun m!486139 () Bool)

(assert (=> b!505456 m!486139))

(declare-fun m!486141 () Bool)

(assert (=> b!505456 m!486141))

(declare-fun m!486143 () Bool)

(assert (=> b!505456 m!486143))

(assert (=> b!505456 m!486127))

(declare-fun m!486145 () Bool)

(assert (=> b!505456 m!486145))

(assert (=> b!505456 m!486127))

(declare-fun m!486147 () Bool)

(assert (=> b!505456 m!486147))

(declare-fun m!486149 () Bool)

(assert (=> b!505456 m!486149))

(declare-fun m!486151 () Bool)

(assert (=> b!505456 m!486151))

(assert (=> b!505457 m!486127))

(assert (=> b!505457 m!486127))

(declare-fun m!486153 () Bool)

(assert (=> b!505457 m!486153))

(push 1)

