; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44760 () Bool)

(assert start!44760)

(declare-fun b!491361 () Bool)

(declare-fun e!288720 () Bool)

(assert (=> b!491361 (= e!288720 true)))

(declare-datatypes ((SeekEntryResult!3764 0))(
  ( (MissingZero!3764 (index!17235 (_ BitVec 32))) (Found!3764 (index!17236 (_ BitVec 32))) (Intermediate!3764 (undefined!4576 Bool) (index!17237 (_ BitVec 32)) (x!46326 (_ BitVec 32))) (Undefined!3764) (MissingVacant!3764 (index!17238 (_ BitVec 32))) )
))
(declare-fun lt!222102 () SeekEntryResult!3764)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!222103 () (_ BitVec 64))

(declare-datatypes ((array!31819 0))(
  ( (array!31820 (arr!15297 (Array (_ BitVec 32) (_ BitVec 64))) (size!15661 (_ BitVec 32))) )
))
(declare-fun lt!222105 () array!31819)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31819 (_ BitVec 32)) SeekEntryResult!3764)

(assert (=> b!491361 (= lt!222102 (seekEntryOrOpen!0 lt!222103 lt!222105 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31819)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!14474 0))(
  ( (Unit!14475) )
))
(declare-fun lt!222101 () Unit!14474)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14474)

(assert (=> b!491361 (= lt!222101 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491362 () Bool)

(declare-fun e!288721 () Bool)

(declare-fun e!288723 () Bool)

(assert (=> b!491362 (= e!288721 e!288723)))

(declare-fun res!294302 () Bool)

(assert (=> b!491362 (=> (not res!294302) (not e!288723))))

(declare-fun lt!222106 () SeekEntryResult!3764)

(assert (=> b!491362 (= res!294302 (or (= lt!222106 (MissingZero!3764 i!1204)) (= lt!222106 (MissingVacant!3764 i!1204))))))

(assert (=> b!491362 (= lt!222106 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491363 () Bool)

(declare-fun res!294305 () Bool)

(assert (=> b!491363 (=> (not res!294305) (not e!288721))))

(declare-fun arrayContainsKey!0 (array!31819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491363 (= res!294305 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491364 () Bool)

(declare-fun res!294299 () Bool)

(assert (=> b!491364 (=> (not res!294299) (not e!288721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491364 (= res!294299 (validKeyInArray!0 (select (arr!15297 a!3235) j!176)))))

(declare-fun b!491365 () Bool)

(assert (=> b!491365 (= e!288723 (not e!288720))))

(declare-fun res!294304 () Bool)

(assert (=> b!491365 (=> res!294304 e!288720)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31819 (_ BitVec 32)) SeekEntryResult!3764)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491365 (= res!294304 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15297 a!3235) j!176) mask!3524) (select (arr!15297 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222103 mask!3524) lt!222103 lt!222105 mask!3524))))))

(assert (=> b!491365 (= lt!222103 (select (store (arr!15297 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491365 (= lt!222105 (array!31820 (store (arr!15297 a!3235) i!1204 k!2280) (size!15661 a!3235)))))

(assert (=> b!491365 (= lt!222102 (Found!3764 j!176))))

(assert (=> b!491365 (= lt!222102 (seekEntryOrOpen!0 (select (arr!15297 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31819 (_ BitVec 32)) Bool)

(assert (=> b!491365 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222104 () Unit!14474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14474)

(assert (=> b!491365 (= lt!222104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491366 () Bool)

(declare-fun res!294298 () Bool)

(assert (=> b!491366 (=> (not res!294298) (not e!288721))))

(assert (=> b!491366 (= res!294298 (and (= (size!15661 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15661 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15661 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491367 () Bool)

(declare-fun res!294297 () Bool)

(assert (=> b!491367 (=> (not res!294297) (not e!288721))))

(assert (=> b!491367 (= res!294297 (validKeyInArray!0 k!2280))))

(declare-fun b!491368 () Bool)

(declare-fun res!294300 () Bool)

(assert (=> b!491368 (=> (not res!294300) (not e!288723))))

(assert (=> b!491368 (= res!294300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491369 () Bool)

(declare-fun res!294301 () Bool)

(assert (=> b!491369 (=> (not res!294301) (not e!288723))))

(declare-datatypes ((List!9455 0))(
  ( (Nil!9452) (Cons!9451 (h!10313 (_ BitVec 64)) (t!15683 List!9455)) )
))
(declare-fun arrayNoDuplicates!0 (array!31819 (_ BitVec 32) List!9455) Bool)

(assert (=> b!491369 (= res!294301 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9452))))

(declare-fun res!294303 () Bool)

(assert (=> start!44760 (=> (not res!294303) (not e!288721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44760 (= res!294303 (validMask!0 mask!3524))))

(assert (=> start!44760 e!288721))

(assert (=> start!44760 true))

(declare-fun array_inv!11093 (array!31819) Bool)

(assert (=> start!44760 (array_inv!11093 a!3235)))

(assert (= (and start!44760 res!294303) b!491366))

(assert (= (and b!491366 res!294298) b!491364))

(assert (= (and b!491364 res!294299) b!491367))

(assert (= (and b!491367 res!294297) b!491363))

(assert (= (and b!491363 res!294305) b!491362))

(assert (= (and b!491362 res!294302) b!491368))

(assert (= (and b!491368 res!294300) b!491369))

(assert (= (and b!491369 res!294301) b!491365))

(assert (= (and b!491365 (not res!294304)) b!491361))

(declare-fun m!471903 () Bool)

(assert (=> b!491361 m!471903))

(declare-fun m!471905 () Bool)

(assert (=> b!491361 m!471905))

(declare-fun m!471907 () Bool)

(assert (=> start!44760 m!471907))

(declare-fun m!471909 () Bool)

(assert (=> start!44760 m!471909))

(declare-fun m!471911 () Bool)

(assert (=> b!491365 m!471911))

(declare-fun m!471913 () Bool)

(assert (=> b!491365 m!471913))

(declare-fun m!471915 () Bool)

(assert (=> b!491365 m!471915))

(declare-fun m!471917 () Bool)

(assert (=> b!491365 m!471917))

(declare-fun m!471919 () Bool)

(assert (=> b!491365 m!471919))

(declare-fun m!471921 () Bool)

(assert (=> b!491365 m!471921))

(assert (=> b!491365 m!471919))

(assert (=> b!491365 m!471917))

(assert (=> b!491365 m!471919))

(declare-fun m!471923 () Bool)

(assert (=> b!491365 m!471923))

(declare-fun m!471925 () Bool)

(assert (=> b!491365 m!471925))

(assert (=> b!491365 m!471919))

(declare-fun m!471927 () Bool)

(assert (=> b!491365 m!471927))

(assert (=> b!491365 m!471925))

(declare-fun m!471929 () Bool)

(assert (=> b!491365 m!471929))

(assert (=> b!491364 m!471919))

(assert (=> b!491364 m!471919))

(declare-fun m!471931 () Bool)

(assert (=> b!491364 m!471931))

(declare-fun m!471933 () Bool)

(assert (=> b!491367 m!471933))

(declare-fun m!471935 () Bool)

(assert (=> b!491369 m!471935))

(declare-fun m!471937 () Bool)

(assert (=> b!491368 m!471937))

(declare-fun m!471939 () Bool)

(assert (=> b!491363 m!471939))

(declare-fun m!471941 () Bool)

(assert (=> b!491362 m!471941))

(push 1)

