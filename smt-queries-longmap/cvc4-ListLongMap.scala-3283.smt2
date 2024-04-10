; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45646 () Bool)

(assert start!45646)

(declare-fun lt!229005 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4048 0))(
  ( (MissingZero!4048 (index!18380 (_ BitVec 32))) (Found!4048 (index!18381 (_ BitVec 32))) (Intermediate!4048 (undefined!4860 Bool) (index!18382 (_ BitVec 32)) (x!47401 (_ BitVec 32))) (Undefined!4048) (MissingVacant!4048 (index!18383 (_ BitVec 32))) )
))
(declare-fun lt!229003 () SeekEntryResult!4048)

(declare-fun b!503401 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32402 0))(
  ( (array!32403 (arr!15581 (Array (_ BitVec 32) (_ BitVec 64))) (size!15945 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32402)

(declare-fun e!294809 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32402 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!503401 (= e!294809 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229005 (index!18382 lt!229003) (select (arr!15581 a!3235) j!176) a!3235 mask!3524) (Found!4048 j!176))))))

(declare-fun res!304717 () Bool)

(declare-fun e!294807 () Bool)

(assert (=> start!45646 (=> (not res!304717) (not e!294807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45646 (= res!304717 (validMask!0 mask!3524))))

(assert (=> start!45646 e!294807))

(assert (=> start!45646 true))

(declare-fun array_inv!11377 (array!32402) Bool)

(assert (=> start!45646 (array_inv!11377 a!3235)))

(declare-fun b!503402 () Bool)

(declare-fun e!294803 () Bool)

(assert (=> b!503402 (= e!294803 true)))

(declare-fun lt!228999 () SeekEntryResult!4048)

(declare-fun lt!229009 () array!32402)

(declare-fun lt!229002 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32402 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!503402 (= lt!228999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229005 lt!229002 lt!229009 mask!3524))))

(declare-fun b!503403 () Bool)

(declare-fun res!304716 () Bool)

(declare-fun e!294808 () Bool)

(assert (=> b!503403 (=> (not res!304716) (not e!294808))))

(declare-datatypes ((List!9739 0))(
  ( (Nil!9736) (Cons!9735 (h!10612 (_ BitVec 64)) (t!15967 List!9739)) )
))
(declare-fun arrayNoDuplicates!0 (array!32402 (_ BitVec 32) List!9739) Bool)

(assert (=> b!503403 (= res!304716 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9736))))

(declare-fun b!503404 () Bool)

(declare-datatypes ((Unit!15268 0))(
  ( (Unit!15269) )
))
(declare-fun e!294805 () Unit!15268)

(declare-fun Unit!15270 () Unit!15268)

(assert (=> b!503404 (= e!294805 Unit!15270)))

(declare-fun b!503405 () Bool)

(assert (=> b!503405 (= e!294807 e!294808)))

(declare-fun res!304714 () Bool)

(assert (=> b!503405 (=> (not res!304714) (not e!294808))))

(declare-fun lt!229006 () SeekEntryResult!4048)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503405 (= res!304714 (or (= lt!229006 (MissingZero!4048 i!1204)) (= lt!229006 (MissingVacant!4048 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32402 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!503405 (= lt!229006 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503406 () Bool)

(declare-fun e!294802 () Bool)

(assert (=> b!503406 (= e!294802 false)))

(declare-fun b!503407 () Bool)

(declare-fun res!304718 () Bool)

(assert (=> b!503407 (=> (not res!304718) (not e!294808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32402 (_ BitVec 32)) Bool)

(assert (=> b!503407 (= res!304718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503408 () Bool)

(declare-fun res!304715 () Bool)

(declare-fun e!294806 () Bool)

(assert (=> b!503408 (=> res!304715 e!294806)))

(assert (=> b!503408 (= res!304715 (or (undefined!4860 lt!229003) (not (is-Intermediate!4048 lt!229003))))))

(declare-fun b!503409 () Bool)

(declare-fun res!304706 () Bool)

(assert (=> b!503409 (=> (not res!304706) (not e!294807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503409 (= res!304706 (validKeyInArray!0 k!2280))))

(declare-fun b!503410 () Bool)

(declare-fun res!304710 () Bool)

(assert (=> b!503410 (=> (not res!304710) (not e!294807))))

(declare-fun arrayContainsKey!0 (array!32402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503410 (= res!304710 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503411 () Bool)

(declare-fun res!304713 () Bool)

(assert (=> b!503411 (=> (not res!304713) (not e!294807))))

(assert (=> b!503411 (= res!304713 (and (= (size!15945 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15945 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15945 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503412 () Bool)

(assert (=> b!503412 (= e!294808 (not e!294806))))

(declare-fun res!304712 () Bool)

(assert (=> b!503412 (=> res!304712 e!294806)))

(declare-fun lt!229000 () (_ BitVec 32))

(assert (=> b!503412 (= res!304712 (= lt!229003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229000 lt!229002 lt!229009 mask!3524)))))

(assert (=> b!503412 (= lt!229003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229005 (select (arr!15581 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503412 (= lt!229000 (toIndex!0 lt!229002 mask!3524))))

(assert (=> b!503412 (= lt!229002 (select (store (arr!15581 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503412 (= lt!229005 (toIndex!0 (select (arr!15581 a!3235) j!176) mask!3524))))

(assert (=> b!503412 (= lt!229009 (array!32403 (store (arr!15581 a!3235) i!1204 k!2280) (size!15945 a!3235)))))

(declare-fun e!294810 () Bool)

(assert (=> b!503412 e!294810))

(declare-fun res!304711 () Bool)

(assert (=> b!503412 (=> (not res!304711) (not e!294810))))

(assert (=> b!503412 (= res!304711 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229007 () Unit!15268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15268)

(assert (=> b!503412 (= lt!229007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503413 () Bool)

(assert (=> b!503413 (= e!294806 e!294803)))

(declare-fun res!304707 () Bool)

(assert (=> b!503413 (=> res!304707 e!294803)))

(assert (=> b!503413 (= res!304707 (or (bvsgt (x!47401 lt!229003) #b01111111111111111111111111111110) (bvslt lt!229005 #b00000000000000000000000000000000) (bvsge lt!229005 (size!15945 a!3235)) (bvslt (index!18382 lt!229003) #b00000000000000000000000000000000) (bvsge (index!18382 lt!229003) (size!15945 a!3235)) (not (= lt!229003 (Intermediate!4048 false (index!18382 lt!229003) (x!47401 lt!229003))))))))

(assert (=> b!503413 (= (index!18382 lt!229003) i!1204)))

(declare-fun lt!229008 () Unit!15268)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32402 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15268)

(assert (=> b!503413 (= lt!229008 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229005 #b00000000000000000000000000000000 (index!18382 lt!229003) (x!47401 lt!229003) mask!3524))))

(assert (=> b!503413 (and (or (= (select (arr!15581 a!3235) (index!18382 lt!229003)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15581 a!3235) (index!18382 lt!229003)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15581 a!3235) (index!18382 lt!229003)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15581 a!3235) (index!18382 lt!229003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229004 () Unit!15268)

(assert (=> b!503413 (= lt!229004 e!294805)))

(declare-fun c!59627 () Bool)

(assert (=> b!503413 (= c!59627 (= (select (arr!15581 a!3235) (index!18382 lt!229003)) (select (arr!15581 a!3235) j!176)))))

(assert (=> b!503413 (and (bvslt (x!47401 lt!229003) #b01111111111111111111111111111110) (or (= (select (arr!15581 a!3235) (index!18382 lt!229003)) (select (arr!15581 a!3235) j!176)) (= (select (arr!15581 a!3235) (index!18382 lt!229003)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15581 a!3235) (index!18382 lt!229003)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503414 () Bool)

(declare-fun Unit!15271 () Unit!15268)

(assert (=> b!503414 (= e!294805 Unit!15271)))

(declare-fun lt!229001 () Unit!15268)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32402 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15268)

(assert (=> b!503414 (= lt!229001 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229005 #b00000000000000000000000000000000 (index!18382 lt!229003) (x!47401 lt!229003) mask!3524))))

(declare-fun res!304705 () Bool)

(assert (=> b!503414 (= res!304705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229005 lt!229002 lt!229009 mask!3524) (Intermediate!4048 false (index!18382 lt!229003) (x!47401 lt!229003))))))

(assert (=> b!503414 (=> (not res!304705) (not e!294802))))

(assert (=> b!503414 e!294802))

(declare-fun b!503415 () Bool)

(declare-fun res!304709 () Bool)

(assert (=> b!503415 (=> res!304709 e!294803)))

(assert (=> b!503415 (= res!304709 e!294809)))

(declare-fun res!304708 () Bool)

(assert (=> b!503415 (=> (not res!304708) (not e!294809))))

(assert (=> b!503415 (= res!304708 (bvsgt #b00000000000000000000000000000000 (x!47401 lt!229003)))))

(declare-fun b!503416 () Bool)

(assert (=> b!503416 (= e!294810 (= (seekEntryOrOpen!0 (select (arr!15581 a!3235) j!176) a!3235 mask!3524) (Found!4048 j!176)))))

(declare-fun b!503417 () Bool)

(declare-fun res!304704 () Bool)

(assert (=> b!503417 (=> (not res!304704) (not e!294807))))

(assert (=> b!503417 (= res!304704 (validKeyInArray!0 (select (arr!15581 a!3235) j!176)))))

(assert (= (and start!45646 res!304717) b!503411))

(assert (= (and b!503411 res!304713) b!503417))

(assert (= (and b!503417 res!304704) b!503409))

(assert (= (and b!503409 res!304706) b!503410))

(assert (= (and b!503410 res!304710) b!503405))

(assert (= (and b!503405 res!304714) b!503407))

(assert (= (and b!503407 res!304718) b!503403))

(assert (= (and b!503403 res!304716) b!503412))

(assert (= (and b!503412 res!304711) b!503416))

(assert (= (and b!503412 (not res!304712)) b!503408))

(assert (= (and b!503408 (not res!304715)) b!503413))

(assert (= (and b!503413 c!59627) b!503414))

(assert (= (and b!503413 (not c!59627)) b!503404))

(assert (= (and b!503414 res!304705) b!503406))

(assert (= (and b!503413 (not res!304707)) b!503415))

(assert (= (and b!503415 res!304708) b!503401))

(assert (= (and b!503415 (not res!304709)) b!503402))

(declare-fun m!484241 () Bool)

(assert (=> b!503403 m!484241))

(declare-fun m!484243 () Bool)

(assert (=> b!503402 m!484243))

(declare-fun m!484245 () Bool)

(assert (=> b!503412 m!484245))

(declare-fun m!484247 () Bool)

(assert (=> b!503412 m!484247))

(declare-fun m!484249 () Bool)

(assert (=> b!503412 m!484249))

(declare-fun m!484251 () Bool)

(assert (=> b!503412 m!484251))

(declare-fun m!484253 () Bool)

(assert (=> b!503412 m!484253))

(declare-fun m!484255 () Bool)

(assert (=> b!503412 m!484255))

(declare-fun m!484257 () Bool)

(assert (=> b!503412 m!484257))

(assert (=> b!503412 m!484253))

(assert (=> b!503412 m!484253))

(declare-fun m!484259 () Bool)

(assert (=> b!503412 m!484259))

(declare-fun m!484261 () Bool)

(assert (=> b!503412 m!484261))

(assert (=> b!503401 m!484253))

(assert (=> b!503401 m!484253))

(declare-fun m!484263 () Bool)

(assert (=> b!503401 m!484263))

(assert (=> b!503417 m!484253))

(assert (=> b!503417 m!484253))

(declare-fun m!484265 () Bool)

(assert (=> b!503417 m!484265))

(assert (=> b!503416 m!484253))

(assert (=> b!503416 m!484253))

(declare-fun m!484267 () Bool)

(assert (=> b!503416 m!484267))

(declare-fun m!484269 () Bool)

(assert (=> b!503405 m!484269))

(declare-fun m!484271 () Bool)

(assert (=> b!503409 m!484271))

(declare-fun m!484273 () Bool)

(assert (=> b!503407 m!484273))

(declare-fun m!484275 () Bool)

(assert (=> b!503414 m!484275))

(assert (=> b!503414 m!484243))

(declare-fun m!484277 () Bool)

(assert (=> b!503410 m!484277))

(declare-fun m!484279 () Bool)

(assert (=> start!45646 m!484279))

(declare-fun m!484281 () Bool)

(assert (=> start!45646 m!484281))

(declare-fun m!484283 () Bool)

(assert (=> b!503413 m!484283))

(declare-fun m!484285 () Bool)

(assert (=> b!503413 m!484285))

(assert (=> b!503413 m!484253))

(push 1)

