; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45274 () Bool)

(assert start!45274)

(declare-fun b!497344 () Bool)

(declare-fun e!291535 () Bool)

(declare-fun e!291537 () Bool)

(assert (=> b!497344 (= e!291535 (not e!291537))))

(declare-fun res!299738 () Bool)

(assert (=> b!497344 (=> res!299738 e!291537)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32162 0))(
  ( (array!32163 (arr!15464 (Array (_ BitVec 32) (_ BitVec 64))) (size!15828 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32162)

(declare-datatypes ((SeekEntryResult!3931 0))(
  ( (MissingZero!3931 (index!17903 (_ BitVec 32))) (Found!3931 (index!17904 (_ BitVec 32))) (Intermediate!3931 (undefined!4743 Bool) (index!17905 (_ BitVec 32)) (x!46951 (_ BitVec 32))) (Undefined!3931) (MissingVacant!3931 (index!17906 (_ BitVec 32))) )
))
(declare-fun lt!225153 () SeekEntryResult!3931)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!225155 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32162 (_ BitVec 32)) SeekEntryResult!3931)

(assert (=> b!497344 (= res!299738 (= lt!225153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225155 (select (store (arr!15464 a!3235) i!1204 k!2280) j!176) (array!32163 (store (arr!15464 a!3235) i!1204 k!2280) (size!15828 a!3235)) mask!3524)))))

(declare-fun lt!225154 () (_ BitVec 32))

(assert (=> b!497344 (= lt!225153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225154 (select (arr!15464 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497344 (= lt!225155 (toIndex!0 (select (store (arr!15464 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497344 (= lt!225154 (toIndex!0 (select (arr!15464 a!3235) j!176) mask!3524))))

(declare-fun e!291536 () Bool)

(assert (=> b!497344 e!291536))

(declare-fun res!299740 () Bool)

(assert (=> b!497344 (=> (not res!299740) (not e!291536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32162 (_ BitVec 32)) Bool)

(assert (=> b!497344 (= res!299740 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14808 0))(
  ( (Unit!14809) )
))
(declare-fun lt!225156 () Unit!14808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14808)

(assert (=> b!497344 (= lt!225156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497345 () Bool)

(assert (=> b!497345 (= e!291537 true)))

(assert (=> b!497345 (and (bvslt (x!46951 lt!225153) #b01111111111111111111111111111110) (or (= (select (arr!15464 a!3235) (index!17905 lt!225153)) (select (arr!15464 a!3235) j!176)) (= (select (arr!15464 a!3235) (index!17905 lt!225153)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15464 a!3235) (index!17905 lt!225153)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497346 () Bool)

(declare-fun res!299734 () Bool)

(declare-fun e!291533 () Bool)

(assert (=> b!497346 (=> (not res!299734) (not e!291533))))

(assert (=> b!497346 (= res!299734 (and (= (size!15828 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15828 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15828 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497347 () Bool)

(declare-fun res!299733 () Bool)

(assert (=> b!497347 (=> (not res!299733) (not e!291533))))

(declare-fun arrayContainsKey!0 (array!32162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497347 (= res!299733 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497349 () Bool)

(declare-fun res!299737 () Bool)

(assert (=> b!497349 (=> res!299737 e!291537)))

(assert (=> b!497349 (= res!299737 (or (undefined!4743 lt!225153) (not (is-Intermediate!3931 lt!225153))))))

(declare-fun b!497350 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32162 (_ BitVec 32)) SeekEntryResult!3931)

(assert (=> b!497350 (= e!291536 (= (seekEntryOrOpen!0 (select (arr!15464 a!3235) j!176) a!3235 mask!3524) (Found!3931 j!176)))))

(declare-fun b!497351 () Bool)

(declare-fun res!299736 () Bool)

(assert (=> b!497351 (=> (not res!299736) (not e!291533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497351 (= res!299736 (validKeyInArray!0 (select (arr!15464 a!3235) j!176)))))

(declare-fun b!497352 () Bool)

(declare-fun res!299735 () Bool)

(assert (=> b!497352 (=> (not res!299735) (not e!291535))))

(assert (=> b!497352 (= res!299735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497348 () Bool)

(declare-fun res!299732 () Bool)

(assert (=> b!497348 (=> (not res!299732) (not e!291533))))

(assert (=> b!497348 (= res!299732 (validKeyInArray!0 k!2280))))

(declare-fun res!299731 () Bool)

(assert (=> start!45274 (=> (not res!299731) (not e!291533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45274 (= res!299731 (validMask!0 mask!3524))))

(assert (=> start!45274 e!291533))

(assert (=> start!45274 true))

(declare-fun array_inv!11260 (array!32162) Bool)

(assert (=> start!45274 (array_inv!11260 a!3235)))

(declare-fun b!497353 () Bool)

(declare-fun res!299741 () Bool)

(assert (=> b!497353 (=> (not res!299741) (not e!291535))))

(declare-datatypes ((List!9622 0))(
  ( (Nil!9619) (Cons!9618 (h!10489 (_ BitVec 64)) (t!15850 List!9622)) )
))
(declare-fun arrayNoDuplicates!0 (array!32162 (_ BitVec 32) List!9622) Bool)

(assert (=> b!497353 (= res!299741 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9619))))

(declare-fun b!497354 () Bool)

(assert (=> b!497354 (= e!291533 e!291535)))

(declare-fun res!299739 () Bool)

(assert (=> b!497354 (=> (not res!299739) (not e!291535))))

(declare-fun lt!225157 () SeekEntryResult!3931)

(assert (=> b!497354 (= res!299739 (or (= lt!225157 (MissingZero!3931 i!1204)) (= lt!225157 (MissingVacant!3931 i!1204))))))

(assert (=> b!497354 (= lt!225157 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45274 res!299731) b!497346))

(assert (= (and b!497346 res!299734) b!497351))

(assert (= (and b!497351 res!299736) b!497348))

(assert (= (and b!497348 res!299732) b!497347))

(assert (= (and b!497347 res!299733) b!497354))

(assert (= (and b!497354 res!299739) b!497352))

(assert (= (and b!497352 res!299735) b!497353))

(assert (= (and b!497353 res!299741) b!497344))

(assert (= (and b!497344 res!299740) b!497350))

(assert (= (and b!497344 (not res!299738)) b!497349))

(assert (= (and b!497349 (not res!299737)) b!497345))

(declare-fun m!478717 () Bool)

(assert (=> b!497345 m!478717))

(declare-fun m!478719 () Bool)

(assert (=> b!497345 m!478719))

(declare-fun m!478721 () Bool)

(assert (=> b!497347 m!478721))

(declare-fun m!478723 () Bool)

(assert (=> b!497354 m!478723))

(declare-fun m!478725 () Bool)

(assert (=> b!497352 m!478725))

(assert (=> b!497350 m!478719))

(assert (=> b!497350 m!478719))

(declare-fun m!478727 () Bool)

(assert (=> b!497350 m!478727))

(assert (=> b!497351 m!478719))

(assert (=> b!497351 m!478719))

(declare-fun m!478729 () Bool)

(assert (=> b!497351 m!478729))

(declare-fun m!478731 () Bool)

(assert (=> b!497353 m!478731))

(declare-fun m!478733 () Bool)

(assert (=> b!497344 m!478733))

(declare-fun m!478735 () Bool)

(assert (=> b!497344 m!478735))

(declare-fun m!478737 () Bool)

(assert (=> b!497344 m!478737))

(assert (=> b!497344 m!478719))

(declare-fun m!478739 () Bool)

(assert (=> b!497344 m!478739))

(assert (=> b!497344 m!478719))

(declare-fun m!478741 () Bool)

(assert (=> b!497344 m!478741))

(assert (=> b!497344 m!478737))

(declare-fun m!478743 () Bool)

(assert (=> b!497344 m!478743))

(assert (=> b!497344 m!478737))

(declare-fun m!478745 () Bool)

(assert (=> b!497344 m!478745))

(assert (=> b!497344 m!478719))

(declare-fun m!478747 () Bool)

(assert (=> b!497344 m!478747))

(declare-fun m!478749 () Bool)

(assert (=> start!45274 m!478749))

(declare-fun m!478751 () Bool)

(assert (=> start!45274 m!478751))

(declare-fun m!478753 () Bool)

(assert (=> b!497348 m!478753))

(push 1)

