; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45420 () Bool)

(assert start!45420)

(declare-fun b!499413 () Bool)

(declare-fun res!301385 () Bool)

(declare-fun e!292658 () Bool)

(assert (=> b!499413 (=> (not res!301385) (not e!292658))))

(declare-datatypes ((array!32245 0))(
  ( (array!32246 (arr!15504 (Array (_ BitVec 32) (_ BitVec 64))) (size!15868 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32245)

(declare-datatypes ((List!9662 0))(
  ( (Nil!9659) (Cons!9658 (h!10532 (_ BitVec 64)) (t!15890 List!9662)) )
))
(declare-fun arrayNoDuplicates!0 (array!32245 (_ BitVec 32) List!9662) Bool)

(assert (=> b!499413 (= res!301385 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9659))))

(declare-fun b!499414 () Bool)

(declare-fun res!301383 () Bool)

(declare-fun e!292657 () Bool)

(assert (=> b!499414 (=> (not res!301383) (not e!292657))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499414 (= res!301383 (and (= (size!15868 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15868 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15868 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499415 () Bool)

(declare-fun e!292661 () Bool)

(assert (=> b!499415 (= e!292658 (not e!292661))))

(declare-fun res!301388 () Bool)

(assert (=> b!499415 (=> res!301388 e!292661)))

(declare-datatypes ((SeekEntryResult!3971 0))(
  ( (MissingZero!3971 (index!18066 (_ BitVec 32))) (Found!3971 (index!18067 (_ BitVec 32))) (Intermediate!3971 (undefined!4783 Bool) (index!18068 (_ BitVec 32)) (x!47112 (_ BitVec 32))) (Undefined!3971) (MissingVacant!3971 (index!18069 (_ BitVec 32))) )
))
(declare-fun lt!226437 () SeekEntryResult!3971)

(declare-fun lt!226438 () (_ BitVec 32))

(declare-fun lt!226430 () array!32245)

(declare-fun lt!226429 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32245 (_ BitVec 32)) SeekEntryResult!3971)

(assert (=> b!499415 (= res!301388 (= lt!226437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226438 lt!226429 lt!226430 mask!3524)))))

(declare-fun lt!226431 () (_ BitVec 32))

(assert (=> b!499415 (= lt!226437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226431 (select (arr!15504 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499415 (= lt!226438 (toIndex!0 lt!226429 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!499415 (= lt!226429 (select (store (arr!15504 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499415 (= lt!226431 (toIndex!0 (select (arr!15504 a!3235) j!176) mask!3524))))

(assert (=> b!499415 (= lt!226430 (array!32246 (store (arr!15504 a!3235) i!1204 k!2280) (size!15868 a!3235)))))

(declare-fun e!292655 () Bool)

(assert (=> b!499415 e!292655))

(declare-fun res!301384 () Bool)

(assert (=> b!499415 (=> (not res!301384) (not e!292655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32245 (_ BitVec 32)) Bool)

(assert (=> b!499415 (= res!301384 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14960 0))(
  ( (Unit!14961) )
))
(declare-fun lt!226432 () Unit!14960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14960)

(assert (=> b!499415 (= lt!226432 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499416 () Bool)

(declare-fun res!301390 () Bool)

(assert (=> b!499416 (=> res!301390 e!292661)))

(assert (=> b!499416 (= res!301390 (or (undefined!4783 lt!226437) (not (is-Intermediate!3971 lt!226437))))))

(declare-fun b!499417 () Bool)

(declare-fun e!292662 () Bool)

(assert (=> b!499417 (= e!292662 true)))

(declare-fun lt!226434 () SeekEntryResult!3971)

(assert (=> b!499417 (= lt!226434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226431 lt!226429 lt!226430 mask!3524))))

(declare-fun b!499418 () Bool)

(declare-fun e!292659 () Bool)

(assert (=> b!499418 (= e!292659 false)))

(declare-fun b!499419 () Bool)

(declare-fun e!292656 () Unit!14960)

(declare-fun Unit!14962 () Unit!14960)

(assert (=> b!499419 (= e!292656 Unit!14962)))

(declare-fun b!499420 () Bool)

(declare-fun res!301386 () Bool)

(assert (=> b!499420 (=> (not res!301386) (not e!292657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499420 (= res!301386 (validKeyInArray!0 k!2280))))

(declare-fun b!499421 () Bool)

(declare-fun res!301387 () Bool)

(assert (=> b!499421 (=> (not res!301387) (not e!292658))))

(assert (=> b!499421 (= res!301387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499422 () Bool)

(assert (=> b!499422 (= e!292657 e!292658)))

(declare-fun res!301389 () Bool)

(assert (=> b!499422 (=> (not res!301389) (not e!292658))))

(declare-fun lt!226433 () SeekEntryResult!3971)

(assert (=> b!499422 (= res!301389 (or (= lt!226433 (MissingZero!3971 i!1204)) (= lt!226433 (MissingVacant!3971 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32245 (_ BitVec 32)) SeekEntryResult!3971)

(assert (=> b!499422 (= lt!226433 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!301380 () Bool)

(assert (=> start!45420 (=> (not res!301380) (not e!292657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45420 (= res!301380 (validMask!0 mask!3524))))

(assert (=> start!45420 e!292657))

(assert (=> start!45420 true))

(declare-fun array_inv!11300 (array!32245) Bool)

(assert (=> start!45420 (array_inv!11300 a!3235)))

(declare-fun b!499423 () Bool)

(declare-fun res!301379 () Bool)

(assert (=> b!499423 (=> (not res!301379) (not e!292657))))

(assert (=> b!499423 (= res!301379 (validKeyInArray!0 (select (arr!15504 a!3235) j!176)))))

(declare-fun b!499424 () Bool)

(declare-fun res!301381 () Bool)

(assert (=> b!499424 (=> (not res!301381) (not e!292657))))

(declare-fun arrayContainsKey!0 (array!32245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499424 (= res!301381 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499425 () Bool)

(assert (=> b!499425 (= e!292661 e!292662)))

(declare-fun res!301391 () Bool)

(assert (=> b!499425 (=> res!301391 e!292662)))

(assert (=> b!499425 (= res!301391 (or (bvsgt #b00000000000000000000000000000000 (x!47112 lt!226437)) (bvsgt (x!47112 lt!226437) #b01111111111111111111111111111110) (bvslt lt!226431 #b00000000000000000000000000000000) (bvsge lt!226431 (size!15868 a!3235)) (bvslt (index!18068 lt!226437) #b00000000000000000000000000000000) (bvsge (index!18068 lt!226437) (size!15868 a!3235)) (not (= lt!226437 (Intermediate!3971 false (index!18068 lt!226437) (x!47112 lt!226437))))))))

(assert (=> b!499425 (and (or (= (select (arr!15504 a!3235) (index!18068 lt!226437)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15504 a!3235) (index!18068 lt!226437)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15504 a!3235) (index!18068 lt!226437)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15504 a!3235) (index!18068 lt!226437)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226436 () Unit!14960)

(assert (=> b!499425 (= lt!226436 e!292656)))

(declare-fun c!59294 () Bool)

(assert (=> b!499425 (= c!59294 (= (select (arr!15504 a!3235) (index!18068 lt!226437)) (select (arr!15504 a!3235) j!176)))))

(assert (=> b!499425 (and (bvslt (x!47112 lt!226437) #b01111111111111111111111111111110) (or (= (select (arr!15504 a!3235) (index!18068 lt!226437)) (select (arr!15504 a!3235) j!176)) (= (select (arr!15504 a!3235) (index!18068 lt!226437)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15504 a!3235) (index!18068 lt!226437)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499426 () Bool)

(declare-fun Unit!14963 () Unit!14960)

(assert (=> b!499426 (= e!292656 Unit!14963)))

(declare-fun lt!226435 () Unit!14960)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32245 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14960)

(assert (=> b!499426 (= lt!226435 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226431 #b00000000000000000000000000000000 (index!18068 lt!226437) (x!47112 lt!226437) mask!3524))))

(declare-fun res!301382 () Bool)

(assert (=> b!499426 (= res!301382 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226431 lt!226429 lt!226430 mask!3524) (Intermediate!3971 false (index!18068 lt!226437) (x!47112 lt!226437))))))

(assert (=> b!499426 (=> (not res!301382) (not e!292659))))

(assert (=> b!499426 e!292659))

(declare-fun b!499427 () Bool)

(assert (=> b!499427 (= e!292655 (= (seekEntryOrOpen!0 (select (arr!15504 a!3235) j!176) a!3235 mask!3524) (Found!3971 j!176)))))

(assert (= (and start!45420 res!301380) b!499414))

(assert (= (and b!499414 res!301383) b!499423))

(assert (= (and b!499423 res!301379) b!499420))

(assert (= (and b!499420 res!301386) b!499424))

(assert (= (and b!499424 res!301381) b!499422))

(assert (= (and b!499422 res!301389) b!499421))

(assert (= (and b!499421 res!301387) b!499413))

(assert (= (and b!499413 res!301385) b!499415))

(assert (= (and b!499415 res!301384) b!499427))

(assert (= (and b!499415 (not res!301388)) b!499416))

(assert (= (and b!499416 (not res!301390)) b!499425))

(assert (= (and b!499425 c!59294) b!499426))

(assert (= (and b!499425 (not c!59294)) b!499419))

(assert (= (and b!499426 res!301382) b!499418))

(assert (= (and b!499425 (not res!301391)) b!499417))

(declare-fun m!480615 () Bool)

(assert (=> b!499424 m!480615))

(declare-fun m!480617 () Bool)

(assert (=> b!499421 m!480617))

(declare-fun m!480619 () Bool)

(assert (=> b!499413 m!480619))

(declare-fun m!480621 () Bool)

(assert (=> b!499422 m!480621))

(declare-fun m!480623 () Bool)

(assert (=> b!499425 m!480623))

(declare-fun m!480625 () Bool)

(assert (=> b!499425 m!480625))

(assert (=> b!499427 m!480625))

(assert (=> b!499427 m!480625))

(declare-fun m!480627 () Bool)

(assert (=> b!499427 m!480627))

(declare-fun m!480629 () Bool)

(assert (=> start!45420 m!480629))

(declare-fun m!480631 () Bool)

(assert (=> start!45420 m!480631))

(assert (=> b!499415 m!480625))

(declare-fun m!480633 () Bool)

(assert (=> b!499415 m!480633))

(declare-fun m!480635 () Bool)

(assert (=> b!499415 m!480635))

(declare-fun m!480637 () Bool)

(assert (=> b!499415 m!480637))

(declare-fun m!480639 () Bool)

(assert (=> b!499415 m!480639))

(declare-fun m!480641 () Bool)

(assert (=> b!499415 m!480641))

(declare-fun m!480643 () Bool)

(assert (=> b!499415 m!480643))

(assert (=> b!499415 m!480625))

(declare-fun m!480645 () Bool)

(assert (=> b!499415 m!480645))

(assert (=> b!499415 m!480625))

(declare-fun m!480647 () Bool)

(assert (=> b!499415 m!480647))

(assert (=> b!499423 m!480625))

(assert (=> b!499423 m!480625))

(declare-fun m!480649 () Bool)

(assert (=> b!499423 m!480649))

(declare-fun m!480651 () Bool)

(assert (=> b!499426 m!480651))

(declare-fun m!480653 () Bool)

(assert (=> b!499426 m!480653))

(assert (=> b!499417 m!480653))

(declare-fun m!480655 () Bool)

(assert (=> b!499420 m!480655))

(push 1)

