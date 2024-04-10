; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46084 () Bool)

(assert start!46084)

(declare-fun b!510432 () Bool)

(declare-fun e!298365 () Bool)

(declare-fun e!298362 () Bool)

(assert (=> b!510432 (= e!298365 (not e!298362))))

(declare-fun res!311280 () Bool)

(assert (=> b!510432 (=> res!311280 e!298362)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233382 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32795 0))(
  ( (array!32796 (arr!15776 (Array (_ BitVec 32) (_ BitVec 64))) (size!16140 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32795)

(declare-fun lt!233381 () array!32795)

(declare-datatypes ((SeekEntryResult!4243 0))(
  ( (MissingZero!4243 (index!19160 (_ BitVec 32))) (Found!4243 (index!19161 (_ BitVec 32))) (Intermediate!4243 (undefined!5055 Bool) (index!19162 (_ BitVec 32)) (x!48116 (_ BitVec 32))) (Undefined!4243) (MissingVacant!4243 (index!19163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32795 (_ BitVec 32)) SeekEntryResult!4243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510432 (= res!311280 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15776 a!3235) j!176) mask!3524) (select (arr!15776 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233382 mask!3524) lt!233382 lt!233381 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510432 (= lt!233382 (select (store (arr!15776 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510432 (= lt!233381 (array!32796 (store (arr!15776 a!3235) i!1204 k!2280) (size!16140 a!3235)))))

(declare-fun lt!233383 () SeekEntryResult!4243)

(assert (=> b!510432 (= lt!233383 (Found!4243 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32795 (_ BitVec 32)) SeekEntryResult!4243)

(assert (=> b!510432 (= lt!233383 (seekEntryOrOpen!0 (select (arr!15776 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32795 (_ BitVec 32)) Bool)

(assert (=> b!510432 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15744 0))(
  ( (Unit!15745) )
))
(declare-fun lt!233378 () Unit!15744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15744)

(assert (=> b!510432 (= lt!233378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510433 () Bool)

(declare-fun e!298363 () Bool)

(assert (=> b!510433 (= e!298363 e!298365)))

(declare-fun res!311278 () Bool)

(assert (=> b!510433 (=> (not res!311278) (not e!298365))))

(declare-fun lt!233379 () SeekEntryResult!4243)

(assert (=> b!510433 (= res!311278 (or (= lt!233379 (MissingZero!4243 i!1204)) (= lt!233379 (MissingVacant!4243 i!1204))))))

(assert (=> b!510433 (= lt!233379 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!311277 () Bool)

(assert (=> start!46084 (=> (not res!311277) (not e!298363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46084 (= res!311277 (validMask!0 mask!3524))))

(assert (=> start!46084 e!298363))

(assert (=> start!46084 true))

(declare-fun array_inv!11572 (array!32795) Bool)

(assert (=> start!46084 (array_inv!11572 a!3235)))

(declare-fun b!510434 () Bool)

(declare-fun res!311283 () Bool)

(assert (=> b!510434 (=> (not res!311283) (not e!298365))))

(declare-datatypes ((List!9934 0))(
  ( (Nil!9931) (Cons!9930 (h!10807 (_ BitVec 64)) (t!16162 List!9934)) )
))
(declare-fun arrayNoDuplicates!0 (array!32795 (_ BitVec 32) List!9934) Bool)

(assert (=> b!510434 (= res!311283 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9931))))

(declare-fun b!510435 () Bool)

(declare-fun res!311284 () Bool)

(assert (=> b!510435 (=> (not res!311284) (not e!298365))))

(assert (=> b!510435 (= res!311284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510436 () Bool)

(declare-fun res!311279 () Bool)

(assert (=> b!510436 (=> (not res!311279) (not e!298363))))

(declare-fun arrayContainsKey!0 (array!32795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510436 (= res!311279 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510437 () Bool)

(declare-fun res!311282 () Bool)

(assert (=> b!510437 (=> (not res!311282) (not e!298363))))

(assert (=> b!510437 (= res!311282 (and (= (size!16140 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16140 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16140 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510438 () Bool)

(declare-fun res!311285 () Bool)

(assert (=> b!510438 (=> (not res!311285) (not e!298363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510438 (= res!311285 (validKeyInArray!0 k!2280))))

(declare-fun b!510439 () Bool)

(assert (=> b!510439 (= e!298362 true)))

(assert (=> b!510439 (= lt!233383 (seekEntryOrOpen!0 lt!233382 lt!233381 mask!3524))))

(declare-fun lt!233380 () Unit!15744)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15744)

(assert (=> b!510439 (= lt!233380 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510440 () Bool)

(declare-fun res!311281 () Bool)

(assert (=> b!510440 (=> (not res!311281) (not e!298363))))

(assert (=> b!510440 (= res!311281 (validKeyInArray!0 (select (arr!15776 a!3235) j!176)))))

(assert (= (and start!46084 res!311277) b!510437))

(assert (= (and b!510437 res!311282) b!510440))

(assert (= (and b!510440 res!311281) b!510438))

(assert (= (and b!510438 res!311285) b!510436))

(assert (= (and b!510436 res!311279) b!510433))

(assert (= (and b!510433 res!311278) b!510435))

(assert (= (and b!510435 res!311284) b!510434))

(assert (= (and b!510434 res!311283) b!510432))

(assert (= (and b!510432 (not res!311280)) b!510439))

(declare-fun m!491693 () Bool)

(assert (=> b!510439 m!491693))

(declare-fun m!491695 () Bool)

(assert (=> b!510439 m!491695))

(declare-fun m!491697 () Bool)

(assert (=> b!510438 m!491697))

(declare-fun m!491699 () Bool)

(assert (=> b!510435 m!491699))

(declare-fun m!491701 () Bool)

(assert (=> b!510432 m!491701))

(declare-fun m!491703 () Bool)

(assert (=> b!510432 m!491703))

(declare-fun m!491705 () Bool)

(assert (=> b!510432 m!491705))

(declare-fun m!491707 () Bool)

(assert (=> b!510432 m!491707))

(declare-fun m!491709 () Bool)

(assert (=> b!510432 m!491709))

(declare-fun m!491711 () Bool)

(assert (=> b!510432 m!491711))

(declare-fun m!491713 () Bool)

(assert (=> b!510432 m!491713))

(declare-fun m!491715 () Bool)

(assert (=> b!510432 m!491715))

(assert (=> b!510432 m!491709))

(declare-fun m!491717 () Bool)

(assert (=> b!510432 m!491717))

(assert (=> b!510432 m!491709))

(declare-fun m!491719 () Bool)

(assert (=> b!510432 m!491719))

(assert (=> b!510432 m!491709))

(assert (=> b!510432 m!491707))

(assert (=> b!510432 m!491713))

(assert (=> b!510440 m!491709))

(assert (=> b!510440 m!491709))

(declare-fun m!491721 () Bool)

(assert (=> b!510440 m!491721))

(declare-fun m!491723 () Bool)

(assert (=> b!510434 m!491723))

(declare-fun m!491725 () Bool)

(assert (=> start!46084 m!491725))

(declare-fun m!491727 () Bool)

(assert (=> start!46084 m!491727))

(declare-fun m!491729 () Bool)

(assert (=> b!510436 m!491729))

(declare-fun m!491731 () Bool)

(assert (=> b!510433 m!491731))

(push 1)

