; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45146 () Bool)

(assert start!45146)

(declare-fun b!495336 () Bool)

(declare-fun res!297777 () Bool)

(declare-fun e!290611 () Bool)

(assert (=> b!495336 (=> res!297777 e!290611)))

(declare-datatypes ((SeekEntryResult!3823 0))(
  ( (MissingZero!3823 (index!17471 (_ BitVec 32))) (Found!3823 (index!17472 (_ BitVec 32))) (Intermediate!3823 (undefined!4635 Bool) (index!17473 (_ BitVec 32)) (x!46688 (_ BitVec 32))) (Undefined!3823) (MissingVacant!3823 (index!17474 (_ BitVec 32))) )
))
(declare-fun lt!224280 () SeekEntryResult!3823)

(get-info :version)

(assert (=> b!495336 (= res!297777 (or (undefined!4635 lt!224280) (not ((_ is Intermediate!3823) lt!224280))))))

(declare-fun b!495337 () Bool)

(declare-fun e!290610 () Bool)

(declare-fun e!290609 () Bool)

(assert (=> b!495337 (= e!290610 e!290609)))

(declare-fun res!297781 () Bool)

(assert (=> b!495337 (=> (not res!297781) (not e!290609))))

(declare-fun lt!224283 () SeekEntryResult!3823)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495337 (= res!297781 (or (= lt!224283 (MissingZero!3823 i!1204)) (= lt!224283 (MissingVacant!3823 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32035 0))(
  ( (array!32036 (arr!15400 (Array (_ BitVec 32) (_ BitVec 64))) (size!15764 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32035 (_ BitVec 32)) SeekEntryResult!3823)

(assert (=> b!495337 (= lt!224283 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495338 () Bool)

(declare-fun res!297779 () Bool)

(assert (=> b!495338 (=> (not res!297779) (not e!290609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32035 (_ BitVec 32)) Bool)

(assert (=> b!495338 (= res!297779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495339 () Bool)

(declare-fun res!297783 () Bool)

(assert (=> b!495339 (=> (not res!297783) (not e!290609))))

(declare-datatypes ((List!9465 0))(
  ( (Nil!9462) (Cons!9461 (h!10332 (_ BitVec 64)) (t!15685 List!9465)) )
))
(declare-fun arrayNoDuplicates!0 (array!32035 (_ BitVec 32) List!9465) Bool)

(assert (=> b!495339 (= res!297783 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9462))))

(declare-fun b!495340 () Bool)

(declare-fun res!297787 () Bool)

(assert (=> b!495340 (=> (not res!297787) (not e!290610))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495340 (= res!297787 (and (= (size!15764 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15764 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15764 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495341 () Bool)

(assert (=> b!495341 (= e!290611 true)))

(assert (=> b!495341 (and (bvslt (x!46688 lt!224280) #b01111111111111111111111111111110) (or (= (select (arr!15400 a!3235) (index!17473 lt!224280)) (select (arr!15400 a!3235) j!176)) (= (select (arr!15400 a!3235) (index!17473 lt!224280)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15400 a!3235) (index!17473 lt!224280)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!290612 () Bool)

(declare-fun b!495343 () Bool)

(assert (=> b!495343 (= e!290612 (= (seekEntryOrOpen!0 (select (arr!15400 a!3235) j!176) a!3235 mask!3524) (Found!3823 j!176)))))

(declare-fun b!495344 () Bool)

(declare-fun res!297784 () Bool)

(assert (=> b!495344 (=> (not res!297784) (not e!290610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495344 (= res!297784 (validKeyInArray!0 (select (arr!15400 a!3235) j!176)))))

(declare-fun b!495345 () Bool)

(declare-fun res!297780 () Bool)

(assert (=> b!495345 (=> (not res!297780) (not e!290610))))

(declare-fun arrayContainsKey!0 (array!32035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495345 (= res!297780 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495346 () Bool)

(assert (=> b!495346 (= e!290609 (not e!290611))))

(declare-fun res!297785 () Bool)

(assert (=> b!495346 (=> res!297785 e!290611)))

(declare-fun lt!224281 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32035 (_ BitVec 32)) SeekEntryResult!3823)

(assert (=> b!495346 (= res!297785 (= lt!224280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224281 (select (store (arr!15400 a!3235) i!1204 k0!2280) j!176) (array!32036 (store (arr!15400 a!3235) i!1204 k0!2280) (size!15764 a!3235)) mask!3524)))))

(declare-fun lt!224284 () (_ BitVec 32))

(assert (=> b!495346 (= lt!224280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224284 (select (arr!15400 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495346 (= lt!224281 (toIndex!0 (select (store (arr!15400 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495346 (= lt!224284 (toIndex!0 (select (arr!15400 a!3235) j!176) mask!3524))))

(assert (=> b!495346 e!290612))

(declare-fun res!297782 () Bool)

(assert (=> b!495346 (=> (not res!297782) (not e!290612))))

(assert (=> b!495346 (= res!297782 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14653 0))(
  ( (Unit!14654) )
))
(declare-fun lt!224282 () Unit!14653)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14653)

(assert (=> b!495346 (= lt!224282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495342 () Bool)

(declare-fun res!297786 () Bool)

(assert (=> b!495342 (=> (not res!297786) (not e!290610))))

(assert (=> b!495342 (= res!297786 (validKeyInArray!0 k0!2280))))

(declare-fun res!297778 () Bool)

(assert (=> start!45146 (=> (not res!297778) (not e!290610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45146 (= res!297778 (validMask!0 mask!3524))))

(assert (=> start!45146 e!290610))

(assert (=> start!45146 true))

(declare-fun array_inv!11259 (array!32035) Bool)

(assert (=> start!45146 (array_inv!11259 a!3235)))

(assert (= (and start!45146 res!297778) b!495340))

(assert (= (and b!495340 res!297787) b!495344))

(assert (= (and b!495344 res!297784) b!495342))

(assert (= (and b!495342 res!297786) b!495345))

(assert (= (and b!495345 res!297780) b!495337))

(assert (= (and b!495337 res!297781) b!495338))

(assert (= (and b!495338 res!297779) b!495339))

(assert (= (and b!495339 res!297783) b!495346))

(assert (= (and b!495346 res!297782) b!495343))

(assert (= (and b!495346 (not res!297785)) b!495336))

(assert (= (and b!495336 (not res!297777)) b!495341))

(declare-fun m!476659 () Bool)

(assert (=> b!495343 m!476659))

(assert (=> b!495343 m!476659))

(declare-fun m!476661 () Bool)

(assert (=> b!495343 m!476661))

(declare-fun m!476663 () Bool)

(assert (=> start!45146 m!476663))

(declare-fun m!476665 () Bool)

(assert (=> start!45146 m!476665))

(declare-fun m!476667 () Bool)

(assert (=> b!495342 m!476667))

(declare-fun m!476669 () Bool)

(assert (=> b!495346 m!476669))

(declare-fun m!476671 () Bool)

(assert (=> b!495346 m!476671))

(assert (=> b!495346 m!476659))

(declare-fun m!476673 () Bool)

(assert (=> b!495346 m!476673))

(declare-fun m!476675 () Bool)

(assert (=> b!495346 m!476675))

(declare-fun m!476677 () Bool)

(assert (=> b!495346 m!476677))

(declare-fun m!476679 () Bool)

(assert (=> b!495346 m!476679))

(assert (=> b!495346 m!476677))

(declare-fun m!476681 () Bool)

(assert (=> b!495346 m!476681))

(assert (=> b!495346 m!476677))

(assert (=> b!495346 m!476659))

(declare-fun m!476683 () Bool)

(assert (=> b!495346 m!476683))

(assert (=> b!495346 m!476659))

(assert (=> b!495344 m!476659))

(assert (=> b!495344 m!476659))

(declare-fun m!476685 () Bool)

(assert (=> b!495344 m!476685))

(declare-fun m!476687 () Bool)

(assert (=> b!495337 m!476687))

(declare-fun m!476689 () Bool)

(assert (=> b!495345 m!476689))

(declare-fun m!476691 () Bool)

(assert (=> b!495338 m!476691))

(declare-fun m!476693 () Bool)

(assert (=> b!495339 m!476693))

(declare-fun m!476695 () Bool)

(assert (=> b!495341 m!476695))

(assert (=> b!495341 m!476659))

(check-sat (not b!495346) (not b!495343) (not b!495345) (not b!495342) (not b!495344) (not b!495339) (not b!495338) (not start!45146) (not b!495337))
(check-sat)
