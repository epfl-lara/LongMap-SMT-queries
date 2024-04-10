; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45690 () Bool)

(assert start!45690)

(declare-fun b!504523 () Bool)

(declare-fun e!295404 () Bool)

(assert (=> b!504523 (= e!295404 true)))

(declare-datatypes ((SeekEntryResult!4070 0))(
  ( (MissingZero!4070 (index!18468 (_ BitVec 32))) (Found!4070 (index!18469 (_ BitVec 32))) (Intermediate!4070 (undefined!4882 Bool) (index!18470 (_ BitVec 32)) (x!47487 (_ BitVec 32))) (Undefined!4070) (MissingVacant!4070 (index!18471 (_ BitVec 32))) )
))
(declare-fun lt!229731 () SeekEntryResult!4070)

(declare-datatypes ((array!32446 0))(
  ( (array!32447 (arr!15603 (Array (_ BitVec 32) (_ BitVec 64))) (size!15967 (_ BitVec 32))) )
))
(declare-fun lt!229734 () array!32446)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229735 () (_ BitVec 64))

(declare-fun lt!229729 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32446 (_ BitVec 32)) SeekEntryResult!4070)

(assert (=> b!504523 (= lt!229731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229729 lt!229735 lt!229734 mask!3524))))

(declare-fun b!504524 () Bool)

(declare-fun e!295398 () Bool)

(declare-fun e!295400 () Bool)

(assert (=> b!504524 (= e!295398 e!295400)))

(declare-fun res!305705 () Bool)

(assert (=> b!504524 (=> (not res!305705) (not e!295400))))

(declare-fun lt!229728 () SeekEntryResult!4070)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504524 (= res!305705 (or (= lt!229728 (MissingZero!4070 i!1204)) (= lt!229728 (MissingVacant!4070 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun a!3235 () array!32446)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32446 (_ BitVec 32)) SeekEntryResult!4070)

(assert (=> b!504524 (= lt!229728 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!295397 () Bool)

(declare-fun b!504525 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504525 (= e!295397 (= (seekEntryOrOpen!0 (select (arr!15603 a!3235) j!176) a!3235 mask!3524) (Found!4070 j!176)))))

(declare-fun b!504526 () Bool)

(declare-fun res!305702 () Bool)

(declare-fun e!295401 () Bool)

(assert (=> b!504526 (=> res!305702 e!295401)))

(declare-fun lt!229726 () SeekEntryResult!4070)

(assert (=> b!504526 (= res!305702 (or (undefined!4882 lt!229726) (not (is-Intermediate!4070 lt!229726))))))

(declare-fun b!504527 () Bool)

(declare-fun res!305698 () Bool)

(assert (=> b!504527 (=> (not res!305698) (not e!295400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32446 (_ BitVec 32)) Bool)

(assert (=> b!504527 (= res!305698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!295402 () Bool)

(declare-fun b!504528 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32446 (_ BitVec 32)) SeekEntryResult!4070)

(assert (=> b!504528 (= e!295402 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229729 (index!18470 lt!229726) (select (arr!15603 a!3235) j!176) a!3235 mask!3524) (Found!4070 j!176))))))

(declare-fun b!504529 () Bool)

(declare-fun e!295399 () Bool)

(assert (=> b!504529 (= e!295399 false)))

(declare-fun res!305696 () Bool)

(assert (=> start!45690 (=> (not res!305696) (not e!295398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45690 (= res!305696 (validMask!0 mask!3524))))

(assert (=> start!45690 e!295398))

(assert (=> start!45690 true))

(declare-fun array_inv!11399 (array!32446) Bool)

(assert (=> start!45690 (array_inv!11399 a!3235)))

(declare-fun b!504530 () Bool)

(declare-fun res!305707 () Bool)

(assert (=> b!504530 (=> (not res!305707) (not e!295398))))

(declare-fun arrayContainsKey!0 (array!32446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504530 (= res!305707 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504531 () Bool)

(declare-datatypes ((Unit!15356 0))(
  ( (Unit!15357) )
))
(declare-fun e!295396 () Unit!15356)

(declare-fun Unit!15358 () Unit!15356)

(assert (=> b!504531 (= e!295396 Unit!15358)))

(declare-fun lt!229730 () Unit!15356)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32446 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15356)

(assert (=> b!504531 (= lt!229730 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229729 #b00000000000000000000000000000000 (index!18470 lt!229726) (x!47487 lt!229726) mask!3524))))

(declare-fun res!305700 () Bool)

(assert (=> b!504531 (= res!305700 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229729 lt!229735 lt!229734 mask!3524) (Intermediate!4070 false (index!18470 lt!229726) (x!47487 lt!229726))))))

(assert (=> b!504531 (=> (not res!305700) (not e!295399))))

(assert (=> b!504531 e!295399))

(declare-fun b!504532 () Bool)

(declare-fun res!305703 () Bool)

(assert (=> b!504532 (=> (not res!305703) (not e!295398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504532 (= res!305703 (validKeyInArray!0 k!2280))))

(declare-fun b!504533 () Bool)

(assert (=> b!504533 (= e!295401 e!295404)))

(declare-fun res!305694 () Bool)

(assert (=> b!504533 (=> res!305694 e!295404)))

(assert (=> b!504533 (= res!305694 (or (bvsgt (x!47487 lt!229726) #b01111111111111111111111111111110) (bvslt lt!229729 #b00000000000000000000000000000000) (bvsge lt!229729 (size!15967 a!3235)) (bvslt (index!18470 lt!229726) #b00000000000000000000000000000000) (bvsge (index!18470 lt!229726) (size!15967 a!3235)) (not (= lt!229726 (Intermediate!4070 false (index!18470 lt!229726) (x!47487 lt!229726))))))))

(assert (=> b!504533 (= (index!18470 lt!229726) i!1204)))

(declare-fun lt!229732 () Unit!15356)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32446 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15356)

(assert (=> b!504533 (= lt!229732 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229729 #b00000000000000000000000000000000 (index!18470 lt!229726) (x!47487 lt!229726) mask!3524))))

(assert (=> b!504533 (and (or (= (select (arr!15603 a!3235) (index!18470 lt!229726)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15603 a!3235) (index!18470 lt!229726)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15603 a!3235) (index!18470 lt!229726)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15603 a!3235) (index!18470 lt!229726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229727 () Unit!15356)

(assert (=> b!504533 (= lt!229727 e!295396)))

(declare-fun c!59693 () Bool)

(assert (=> b!504533 (= c!59693 (= (select (arr!15603 a!3235) (index!18470 lt!229726)) (select (arr!15603 a!3235) j!176)))))

(assert (=> b!504533 (and (bvslt (x!47487 lt!229726) #b01111111111111111111111111111110) (or (= (select (arr!15603 a!3235) (index!18470 lt!229726)) (select (arr!15603 a!3235) j!176)) (= (select (arr!15603 a!3235) (index!18470 lt!229726)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15603 a!3235) (index!18470 lt!229726)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504534 () Bool)

(declare-fun Unit!15359 () Unit!15356)

(assert (=> b!504534 (= e!295396 Unit!15359)))

(declare-fun b!504535 () Bool)

(declare-fun res!305706 () Bool)

(assert (=> b!504535 (=> (not res!305706) (not e!295398))))

(assert (=> b!504535 (= res!305706 (validKeyInArray!0 (select (arr!15603 a!3235) j!176)))))

(declare-fun b!504536 () Bool)

(assert (=> b!504536 (= e!295400 (not e!295401))))

(declare-fun res!305699 () Bool)

(assert (=> b!504536 (=> res!305699 e!295401)))

(declare-fun lt!229725 () (_ BitVec 32))

(assert (=> b!504536 (= res!305699 (= lt!229726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229725 lt!229735 lt!229734 mask!3524)))))

(assert (=> b!504536 (= lt!229726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229729 (select (arr!15603 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504536 (= lt!229725 (toIndex!0 lt!229735 mask!3524))))

(assert (=> b!504536 (= lt!229735 (select (store (arr!15603 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504536 (= lt!229729 (toIndex!0 (select (arr!15603 a!3235) j!176) mask!3524))))

(assert (=> b!504536 (= lt!229734 (array!32447 (store (arr!15603 a!3235) i!1204 k!2280) (size!15967 a!3235)))))

(assert (=> b!504536 e!295397))

(declare-fun res!305708 () Bool)

(assert (=> b!504536 (=> (not res!305708) (not e!295397))))

(assert (=> b!504536 (= res!305708 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229733 () Unit!15356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15356)

(assert (=> b!504536 (= lt!229733 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504537 () Bool)

(declare-fun res!305704 () Bool)

(assert (=> b!504537 (=> (not res!305704) (not e!295398))))

(assert (=> b!504537 (= res!305704 (and (= (size!15967 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15967 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15967 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504538 () Bool)

(declare-fun res!305695 () Bool)

(assert (=> b!504538 (=> (not res!305695) (not e!295400))))

(declare-datatypes ((List!9761 0))(
  ( (Nil!9758) (Cons!9757 (h!10634 (_ BitVec 64)) (t!15989 List!9761)) )
))
(declare-fun arrayNoDuplicates!0 (array!32446 (_ BitVec 32) List!9761) Bool)

(assert (=> b!504538 (= res!305695 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9758))))

(declare-fun b!504539 () Bool)

(declare-fun res!305701 () Bool)

(assert (=> b!504539 (=> res!305701 e!295404)))

(assert (=> b!504539 (= res!305701 e!295402)))

(declare-fun res!305697 () Bool)

(assert (=> b!504539 (=> (not res!305697) (not e!295402))))

(assert (=> b!504539 (= res!305697 (bvsgt #b00000000000000000000000000000000 (x!47487 lt!229726)))))

(assert (= (and start!45690 res!305696) b!504537))

(assert (= (and b!504537 res!305704) b!504535))

(assert (= (and b!504535 res!305706) b!504532))

(assert (= (and b!504532 res!305703) b!504530))

(assert (= (and b!504530 res!305707) b!504524))

(assert (= (and b!504524 res!305705) b!504527))

(assert (= (and b!504527 res!305698) b!504538))

(assert (= (and b!504538 res!305695) b!504536))

(assert (= (and b!504536 res!305708) b!504525))

(assert (= (and b!504536 (not res!305699)) b!504526))

(assert (= (and b!504526 (not res!305702)) b!504533))

(assert (= (and b!504533 c!59693) b!504531))

(assert (= (and b!504533 (not c!59693)) b!504534))

(assert (= (and b!504531 res!305700) b!504529))

(assert (= (and b!504533 (not res!305694)) b!504539))

(assert (= (and b!504539 res!305697) b!504528))

(assert (= (and b!504539 (not res!305701)) b!504523))

(declare-fun m!485253 () Bool)

(assert (=> b!504535 m!485253))

(assert (=> b!504535 m!485253))

(declare-fun m!485255 () Bool)

(assert (=> b!504535 m!485255))

(assert (=> b!504528 m!485253))

(assert (=> b!504528 m!485253))

(declare-fun m!485257 () Bool)

(assert (=> b!504528 m!485257))

(declare-fun m!485259 () Bool)

(assert (=> start!45690 m!485259))

(declare-fun m!485261 () Bool)

(assert (=> start!45690 m!485261))

(declare-fun m!485263 () Bool)

(assert (=> b!504532 m!485263))

(declare-fun m!485265 () Bool)

(assert (=> b!504531 m!485265))

(declare-fun m!485267 () Bool)

(assert (=> b!504531 m!485267))

(assert (=> b!504525 m!485253))

(assert (=> b!504525 m!485253))

(declare-fun m!485269 () Bool)

(assert (=> b!504525 m!485269))

(declare-fun m!485271 () Bool)

(assert (=> b!504527 m!485271))

(declare-fun m!485273 () Bool)

(assert (=> b!504538 m!485273))

(declare-fun m!485275 () Bool)

(assert (=> b!504536 m!485275))

(declare-fun m!485277 () Bool)

(assert (=> b!504536 m!485277))

(declare-fun m!485279 () Bool)

(assert (=> b!504536 m!485279))

(assert (=> b!504536 m!485253))

(declare-fun m!485281 () Bool)

(assert (=> b!504536 m!485281))

(assert (=> b!504536 m!485253))

(declare-fun m!485283 () Bool)

(assert (=> b!504536 m!485283))

(assert (=> b!504536 m!485253))

(declare-fun m!485285 () Bool)

(assert (=> b!504536 m!485285))

(declare-fun m!485287 () Bool)

(assert (=> b!504536 m!485287))

(declare-fun m!485289 () Bool)

(assert (=> b!504536 m!485289))

(declare-fun m!485291 () Bool)

(assert (=> b!504533 m!485291))

(declare-fun m!485293 () Bool)

(assert (=> b!504533 m!485293))

(assert (=> b!504533 m!485253))

(declare-fun m!485295 () Bool)

(assert (=> b!504530 m!485295))

(assert (=> b!504523 m!485267))

(declare-fun m!485297 () Bool)

(assert (=> b!504524 m!485297))

(push 1)

