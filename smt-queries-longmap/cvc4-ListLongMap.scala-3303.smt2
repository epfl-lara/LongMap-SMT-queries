; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45766 () Bool)

(assert start!45766)

(declare-fun b!506422 () Bool)

(declare-fun res!307389 () Bool)

(declare-fun e!296412 () Bool)

(assert (=> b!506422 (=> (not res!307389) (not e!296412))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32522 0))(
  ( (array!32523 (arr!15641 (Array (_ BitVec 32) (_ BitVec 64))) (size!16005 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32522)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506422 (= res!307389 (and (= (size!16005 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16005 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16005 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506423 () Bool)

(declare-fun e!296411 () Bool)

(assert (=> b!506423 (= e!296412 e!296411)))

(declare-fun res!307385 () Bool)

(assert (=> b!506423 (=> (not res!307385) (not e!296411))))

(declare-datatypes ((SeekEntryResult!4108 0))(
  ( (MissingZero!4108 (index!18620 (_ BitVec 32))) (Found!4108 (index!18621 (_ BitVec 32))) (Intermediate!4108 (undefined!4920 Bool) (index!18622 (_ BitVec 32)) (x!47621 (_ BitVec 32))) (Undefined!4108) (MissingVacant!4108 (index!18623 (_ BitVec 32))) )
))
(declare-fun lt!231086 () SeekEntryResult!4108)

(assert (=> b!506423 (= res!307385 (or (= lt!231086 (MissingZero!4108 i!1204)) (= lt!231086 (MissingVacant!4108 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32522 (_ BitVec 32)) SeekEntryResult!4108)

(assert (=> b!506423 (= lt!231086 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506424 () Bool)

(declare-fun res!307383 () Bool)

(assert (=> b!506424 (=> (not res!307383) (not e!296412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506424 (= res!307383 (validKeyInArray!0 (select (arr!15641 a!3235) j!176)))))

(declare-fun b!506425 () Bool)

(declare-fun e!296407 () Bool)

(declare-fun e!296409 () Bool)

(assert (=> b!506425 (= e!296407 e!296409)))

(declare-fun res!307388 () Bool)

(assert (=> b!506425 (=> res!307388 e!296409)))

(declare-fun lt!231083 () Bool)

(declare-fun lt!231084 () SeekEntryResult!4108)

(assert (=> b!506425 (= res!307388 (or (and (not lt!231083) (undefined!4920 lt!231084)) (and (not lt!231083) (not (undefined!4920 lt!231084)))))))

(assert (=> b!506425 (= lt!231083 (not (is-Intermediate!4108 lt!231084)))))

(declare-fun b!506426 () Bool)

(assert (=> b!506426 (= e!296409 true)))

(assert (=> b!506426 false))

(declare-fun b!506428 () Bool)

(declare-fun res!307387 () Bool)

(assert (=> b!506428 (=> (not res!307387) (not e!296411))))

(declare-datatypes ((List!9799 0))(
  ( (Nil!9796) (Cons!9795 (h!10672 (_ BitVec 64)) (t!16027 List!9799)) )
))
(declare-fun arrayNoDuplicates!0 (array!32522 (_ BitVec 32) List!9799) Bool)

(assert (=> b!506428 (= res!307387 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9796))))

(declare-fun b!506429 () Bool)

(declare-fun res!307391 () Bool)

(assert (=> b!506429 (=> (not res!307391) (not e!296412))))

(declare-fun arrayContainsKey!0 (array!32522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506429 (= res!307391 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506430 () Bool)

(declare-fun res!307382 () Bool)

(assert (=> b!506430 (=> (not res!307382) (not e!296412))))

(assert (=> b!506430 (= res!307382 (validKeyInArray!0 k!2280))))

(declare-fun b!506431 () Bool)

(declare-fun res!307386 () Bool)

(assert (=> b!506431 (=> (not res!307386) (not e!296411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32522 (_ BitVec 32)) Bool)

(assert (=> b!506431 (= res!307386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506432 () Bool)

(declare-fun e!296408 () Bool)

(assert (=> b!506432 (= e!296408 (= (seekEntryOrOpen!0 (select (arr!15641 a!3235) j!176) a!3235 mask!3524) (Found!4108 j!176)))))

(declare-fun b!506427 () Bool)

(assert (=> b!506427 (= e!296411 (not e!296407))))

(declare-fun res!307390 () Bool)

(assert (=> b!506427 (=> res!307390 e!296407)))

(declare-fun lt!231085 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32522 (_ BitVec 32)) SeekEntryResult!4108)

(assert (=> b!506427 (= res!307390 (= lt!231084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231085 (select (store (arr!15641 a!3235) i!1204 k!2280) j!176) (array!32523 (store (arr!15641 a!3235) i!1204 k!2280) (size!16005 a!3235)) mask!3524)))))

(declare-fun lt!231087 () (_ BitVec 32))

(assert (=> b!506427 (= lt!231084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231087 (select (arr!15641 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506427 (= lt!231085 (toIndex!0 (select (store (arr!15641 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506427 (= lt!231087 (toIndex!0 (select (arr!15641 a!3235) j!176) mask!3524))))

(assert (=> b!506427 e!296408))

(declare-fun res!307381 () Bool)

(assert (=> b!506427 (=> (not res!307381) (not e!296408))))

(assert (=> b!506427 (= res!307381 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15504 0))(
  ( (Unit!15505) )
))
(declare-fun lt!231088 () Unit!15504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15504)

(assert (=> b!506427 (= lt!231088 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!307384 () Bool)

(assert (=> start!45766 (=> (not res!307384) (not e!296412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45766 (= res!307384 (validMask!0 mask!3524))))

(assert (=> start!45766 e!296412))

(assert (=> start!45766 true))

(declare-fun array_inv!11437 (array!32522) Bool)

(assert (=> start!45766 (array_inv!11437 a!3235)))

(assert (= (and start!45766 res!307384) b!506422))

(assert (= (and b!506422 res!307389) b!506424))

(assert (= (and b!506424 res!307383) b!506430))

(assert (= (and b!506430 res!307382) b!506429))

(assert (= (and b!506429 res!307391) b!506423))

(assert (= (and b!506423 res!307385) b!506431))

(assert (= (and b!506431 res!307386) b!506428))

(assert (= (and b!506428 res!307387) b!506427))

(assert (= (and b!506427 res!307381) b!506432))

(assert (= (and b!506427 (not res!307390)) b!506425))

(assert (= (and b!506425 (not res!307388)) b!506426))

(declare-fun m!487083 () Bool)

(assert (=> b!506430 m!487083))

(declare-fun m!487085 () Bool)

(assert (=> b!506432 m!487085))

(assert (=> b!506432 m!487085))

(declare-fun m!487087 () Bool)

(assert (=> b!506432 m!487087))

(assert (=> b!506424 m!487085))

(assert (=> b!506424 m!487085))

(declare-fun m!487089 () Bool)

(assert (=> b!506424 m!487089))

(declare-fun m!487091 () Bool)

(assert (=> b!506431 m!487091))

(declare-fun m!487093 () Bool)

(assert (=> start!45766 m!487093))

(declare-fun m!487095 () Bool)

(assert (=> start!45766 m!487095))

(declare-fun m!487097 () Bool)

(assert (=> b!506427 m!487097))

(declare-fun m!487099 () Bool)

(assert (=> b!506427 m!487099))

(declare-fun m!487101 () Bool)

(assert (=> b!506427 m!487101))

(assert (=> b!506427 m!487101))

(declare-fun m!487103 () Bool)

(assert (=> b!506427 m!487103))

(assert (=> b!506427 m!487085))

(declare-fun m!487105 () Bool)

(assert (=> b!506427 m!487105))

(assert (=> b!506427 m!487085))

(declare-fun m!487107 () Bool)

(assert (=> b!506427 m!487107))

(assert (=> b!506427 m!487085))

(declare-fun m!487109 () Bool)

(assert (=> b!506427 m!487109))

(assert (=> b!506427 m!487101))

(declare-fun m!487111 () Bool)

(assert (=> b!506427 m!487111))

(declare-fun m!487113 () Bool)

(assert (=> b!506429 m!487113))

(declare-fun m!487115 () Bool)

(assert (=> b!506423 m!487115))

(declare-fun m!487117 () Bool)

(assert (=> b!506428 m!487117))

(push 1)

