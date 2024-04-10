; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45272 () Bool)

(assert start!45272)

(declare-fun b!497311 () Bool)

(declare-fun res!299704 () Bool)

(declare-fun e!291518 () Bool)

(assert (=> b!497311 (=> (not res!299704) (not e!291518))))

(declare-datatypes ((array!32160 0))(
  ( (array!32161 (arr!15463 (Array (_ BitVec 32) (_ BitVec 64))) (size!15827 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32160)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497311 (= res!299704 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497312 () Bool)

(declare-fun res!299702 () Bool)

(declare-fun e!291521 () Bool)

(assert (=> b!497312 (=> (not res!299702) (not e!291521))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32160 (_ BitVec 32)) Bool)

(assert (=> b!497312 (= res!299702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497313 () Bool)

(declare-fun res!299701 () Bool)

(assert (=> b!497313 (=> (not res!299701) (not e!291521))))

(declare-datatypes ((List!9621 0))(
  ( (Nil!9618) (Cons!9617 (h!10488 (_ BitVec 64)) (t!15849 List!9621)) )
))
(declare-fun arrayNoDuplicates!0 (array!32160 (_ BitVec 32) List!9621) Bool)

(assert (=> b!497313 (= res!299701 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9618))))

(declare-fun e!291519 () Bool)

(declare-fun b!497314 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3930 0))(
  ( (MissingZero!3930 (index!17899 (_ BitVec 32))) (Found!3930 (index!17900 (_ BitVec 32))) (Intermediate!3930 (undefined!4742 Bool) (index!17901 (_ BitVec 32)) (x!46950 (_ BitVec 32))) (Undefined!3930) (MissingVacant!3930 (index!17902 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32160 (_ BitVec 32)) SeekEntryResult!3930)

(assert (=> b!497314 (= e!291519 (= (seekEntryOrOpen!0 (select (arr!15463 a!3235) j!176) a!3235 mask!3524) (Found!3930 j!176)))))

(declare-fun b!497315 () Bool)

(declare-fun res!299707 () Bool)

(assert (=> b!497315 (=> (not res!299707) (not e!291518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497315 (= res!299707 (validKeyInArray!0 k0!2280))))

(declare-fun b!497316 () Bool)

(assert (=> b!497316 (= e!291518 e!291521)))

(declare-fun res!299700 () Bool)

(assert (=> b!497316 (=> (not res!299700) (not e!291521))))

(declare-fun lt!225138 () SeekEntryResult!3930)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497316 (= res!299700 (or (= lt!225138 (MissingZero!3930 i!1204)) (= lt!225138 (MissingVacant!3930 i!1204))))))

(assert (=> b!497316 (= lt!225138 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497317 () Bool)

(declare-fun res!299708 () Bool)

(declare-fun e!291520 () Bool)

(assert (=> b!497317 (=> res!299708 e!291520)))

(declare-fun lt!225140 () SeekEntryResult!3930)

(get-info :version)

(assert (=> b!497317 (= res!299708 (or (undefined!4742 lt!225140) (not ((_ is Intermediate!3930) lt!225140))))))

(declare-fun b!497318 () Bool)

(declare-fun res!299706 () Bool)

(assert (=> b!497318 (=> (not res!299706) (not e!291518))))

(assert (=> b!497318 (= res!299706 (and (= (size!15827 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15827 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15827 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!299698 () Bool)

(assert (=> start!45272 (=> (not res!299698) (not e!291518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45272 (= res!299698 (validMask!0 mask!3524))))

(assert (=> start!45272 e!291518))

(assert (=> start!45272 true))

(declare-fun array_inv!11259 (array!32160) Bool)

(assert (=> start!45272 (array_inv!11259 a!3235)))

(declare-fun b!497319 () Bool)

(assert (=> b!497319 (= e!291521 (not e!291520))))

(declare-fun res!299705 () Bool)

(assert (=> b!497319 (=> res!299705 e!291520)))

(declare-fun lt!225141 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32160 (_ BitVec 32)) SeekEntryResult!3930)

(assert (=> b!497319 (= res!299705 (= lt!225140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225141 (select (store (arr!15463 a!3235) i!1204 k0!2280) j!176) (array!32161 (store (arr!15463 a!3235) i!1204 k0!2280) (size!15827 a!3235)) mask!3524)))))

(declare-fun lt!225139 () (_ BitVec 32))

(assert (=> b!497319 (= lt!225140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225139 (select (arr!15463 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497319 (= lt!225141 (toIndex!0 (select (store (arr!15463 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497319 (= lt!225139 (toIndex!0 (select (arr!15463 a!3235) j!176) mask!3524))))

(assert (=> b!497319 e!291519))

(declare-fun res!299703 () Bool)

(assert (=> b!497319 (=> (not res!299703) (not e!291519))))

(assert (=> b!497319 (= res!299703 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14806 0))(
  ( (Unit!14807) )
))
(declare-fun lt!225142 () Unit!14806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14806)

(assert (=> b!497319 (= lt!225142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497320 () Bool)

(declare-fun res!299699 () Bool)

(assert (=> b!497320 (=> (not res!299699) (not e!291518))))

(assert (=> b!497320 (= res!299699 (validKeyInArray!0 (select (arr!15463 a!3235) j!176)))))

(declare-fun b!497321 () Bool)

(assert (=> b!497321 (= e!291520 true)))

(assert (=> b!497321 (and (bvslt (x!46950 lt!225140) #b01111111111111111111111111111110) (or (= (select (arr!15463 a!3235) (index!17901 lt!225140)) (select (arr!15463 a!3235) j!176)) (= (select (arr!15463 a!3235) (index!17901 lt!225140)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15463 a!3235) (index!17901 lt!225140)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45272 res!299698) b!497318))

(assert (= (and b!497318 res!299706) b!497320))

(assert (= (and b!497320 res!299699) b!497315))

(assert (= (and b!497315 res!299707) b!497311))

(assert (= (and b!497311 res!299704) b!497316))

(assert (= (and b!497316 res!299700) b!497312))

(assert (= (and b!497312 res!299702) b!497313))

(assert (= (and b!497313 res!299701) b!497319))

(assert (= (and b!497319 res!299703) b!497314))

(assert (= (and b!497319 (not res!299705)) b!497317))

(assert (= (and b!497317 (not res!299708)) b!497321))

(declare-fun m!478679 () Bool)

(assert (=> b!497316 m!478679))

(declare-fun m!478681 () Bool)

(assert (=> b!497311 m!478681))

(declare-fun m!478683 () Bool)

(assert (=> b!497315 m!478683))

(declare-fun m!478685 () Bool)

(assert (=> b!497320 m!478685))

(assert (=> b!497320 m!478685))

(declare-fun m!478687 () Bool)

(assert (=> b!497320 m!478687))

(assert (=> b!497319 m!478685))

(declare-fun m!478689 () Bool)

(assert (=> b!497319 m!478689))

(declare-fun m!478691 () Bool)

(assert (=> b!497319 m!478691))

(declare-fun m!478693 () Bool)

(assert (=> b!497319 m!478693))

(declare-fun m!478695 () Bool)

(assert (=> b!497319 m!478695))

(declare-fun m!478697 () Bool)

(assert (=> b!497319 m!478697))

(assert (=> b!497319 m!478691))

(assert (=> b!497319 m!478685))

(declare-fun m!478699 () Bool)

(assert (=> b!497319 m!478699))

(assert (=> b!497319 m!478685))

(declare-fun m!478701 () Bool)

(assert (=> b!497319 m!478701))

(assert (=> b!497319 m!478691))

(declare-fun m!478703 () Bool)

(assert (=> b!497319 m!478703))

(declare-fun m!478705 () Bool)

(assert (=> b!497312 m!478705))

(declare-fun m!478707 () Bool)

(assert (=> b!497313 m!478707))

(declare-fun m!478709 () Bool)

(assert (=> b!497321 m!478709))

(assert (=> b!497321 m!478685))

(declare-fun m!478711 () Bool)

(assert (=> start!45272 m!478711))

(declare-fun m!478713 () Bool)

(assert (=> start!45272 m!478713))

(assert (=> b!497314 m!478685))

(assert (=> b!497314 m!478685))

(declare-fun m!478715 () Bool)

(assert (=> b!497314 m!478715))

(check-sat (not b!497320) (not start!45272) (not b!497311) (not b!497313) (not b!497316) (not b!497314) (not b!497315) (not b!497319) (not b!497312))
(check-sat)
