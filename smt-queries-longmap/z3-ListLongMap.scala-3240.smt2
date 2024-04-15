; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45234 () Bool)

(assert start!45234)

(declare-fun b!496611 () Bool)

(declare-fun res!299148 () Bool)

(declare-fun e!291150 () Bool)

(assert (=> b!496611 (=> (not res!299148) (not e!291150))))

(declare-datatypes ((array!32132 0))(
  ( (array!32133 (arr!15449 (Array (_ BitVec 32) (_ BitVec 64))) (size!15814 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32132)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496611 (= res!299148 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299145 () Bool)

(assert (=> start!45234 (=> (not res!299145) (not e!291150))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45234 (= res!299145 (validMask!0 mask!3524))))

(assert (=> start!45234 e!291150))

(assert (=> start!45234 true))

(declare-fun array_inv!11332 (array!32132) Bool)

(assert (=> start!45234 (array_inv!11332 a!3235)))

(declare-fun b!496612 () Bool)

(declare-fun e!291153 () Bool)

(declare-fun e!291151 () Bool)

(assert (=> b!496612 (= e!291153 (not e!291151))))

(declare-fun res!299149 () Bool)

(assert (=> b!496612 (=> res!299149 e!291151)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224713 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3913 0))(
  ( (MissingZero!3913 (index!17831 (_ BitVec 32))) (Found!3913 (index!17832 (_ BitVec 32))) (Intermediate!3913 (undefined!4725 Bool) (index!17833 (_ BitVec 32)) (x!46896 (_ BitVec 32))) (Undefined!3913) (MissingVacant!3913 (index!17834 (_ BitVec 32))) )
))
(declare-fun lt!224710 () SeekEntryResult!3913)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32132 (_ BitVec 32)) SeekEntryResult!3913)

(assert (=> b!496612 (= res!299149 (= lt!224710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224713 (select (store (arr!15449 a!3235) i!1204 k0!2280) j!176) (array!32133 (store (arr!15449 a!3235) i!1204 k0!2280) (size!15814 a!3235)) mask!3524)))))

(declare-fun lt!224712 () (_ BitVec 32))

(assert (=> b!496612 (= lt!224710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224712 (select (arr!15449 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496612 (= lt!224713 (toIndex!0 (select (store (arr!15449 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496612 (= lt!224712 (toIndex!0 (select (arr!15449 a!3235) j!176) mask!3524))))

(declare-fun e!291149 () Bool)

(assert (=> b!496612 e!291149))

(declare-fun res!299147 () Bool)

(assert (=> b!496612 (=> (not res!299147) (not e!291149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32132 (_ BitVec 32)) Bool)

(assert (=> b!496612 (= res!299147 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14758 0))(
  ( (Unit!14759) )
))
(declare-fun lt!224711 () Unit!14758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14758)

(assert (=> b!496612 (= lt!224711 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496613 () Bool)

(assert (=> b!496613 (= e!291150 e!291153)))

(declare-fun res!299141 () Bool)

(assert (=> b!496613 (=> (not res!299141) (not e!291153))))

(declare-fun lt!224709 () SeekEntryResult!3913)

(assert (=> b!496613 (= res!299141 (or (= lt!224709 (MissingZero!3913 i!1204)) (= lt!224709 (MissingVacant!3913 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32132 (_ BitVec 32)) SeekEntryResult!3913)

(assert (=> b!496613 (= lt!224709 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496614 () Bool)

(declare-fun res!299144 () Bool)

(assert (=> b!496614 (=> (not res!299144) (not e!291150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496614 (= res!299144 (validKeyInArray!0 (select (arr!15449 a!3235) j!176)))))

(declare-fun b!496615 () Bool)

(declare-fun res!299150 () Bool)

(assert (=> b!496615 (=> (not res!299150) (not e!291153))))

(declare-datatypes ((List!9646 0))(
  ( (Nil!9643) (Cons!9642 (h!10513 (_ BitVec 64)) (t!15865 List!9646)) )
))
(declare-fun arrayNoDuplicates!0 (array!32132 (_ BitVec 32) List!9646) Bool)

(assert (=> b!496615 (= res!299150 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9643))))

(declare-fun b!496616 () Bool)

(declare-fun res!299143 () Bool)

(assert (=> b!496616 (=> (not res!299143) (not e!291153))))

(assert (=> b!496616 (= res!299143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496617 () Bool)

(declare-fun res!299142 () Bool)

(assert (=> b!496617 (=> res!299142 e!291151)))

(get-info :version)

(assert (=> b!496617 (= res!299142 (or (undefined!4725 lt!224710) (not ((_ is Intermediate!3913) lt!224710))))))

(declare-fun b!496618 () Bool)

(assert (=> b!496618 (= e!291149 (= (seekEntryOrOpen!0 (select (arr!15449 a!3235) j!176) a!3235 mask!3524) (Found!3913 j!176)))))

(declare-fun b!496619 () Bool)

(declare-fun res!299140 () Bool)

(assert (=> b!496619 (=> (not res!299140) (not e!291150))))

(assert (=> b!496619 (= res!299140 (validKeyInArray!0 k0!2280))))

(declare-fun b!496620 () Bool)

(assert (=> b!496620 (= e!291151 true)))

(assert (=> b!496620 (and (bvslt (x!46896 lt!224710) #b01111111111111111111111111111110) (or (= (select (arr!15449 a!3235) (index!17833 lt!224710)) (select (arr!15449 a!3235) j!176)) (= (select (arr!15449 a!3235) (index!17833 lt!224710)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15449 a!3235) (index!17833 lt!224710)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496621 () Bool)

(declare-fun res!299146 () Bool)

(assert (=> b!496621 (=> (not res!299146) (not e!291150))))

(assert (=> b!496621 (= res!299146 (and (= (size!15814 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15814 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15814 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45234 res!299145) b!496621))

(assert (= (and b!496621 res!299146) b!496614))

(assert (= (and b!496614 res!299144) b!496619))

(assert (= (and b!496619 res!299140) b!496611))

(assert (= (and b!496611 res!299148) b!496613))

(assert (= (and b!496613 res!299141) b!496616))

(assert (= (and b!496616 res!299143) b!496615))

(assert (= (and b!496615 res!299150) b!496612))

(assert (= (and b!496612 res!299147) b!496618))

(assert (= (and b!496612 (not res!299149)) b!496617))

(assert (= (and b!496617 (not res!299142)) b!496620))

(declare-fun m!477433 () Bool)

(assert (=> b!496611 m!477433))

(declare-fun m!477435 () Bool)

(assert (=> b!496613 m!477435))

(declare-fun m!477437 () Bool)

(assert (=> b!496615 m!477437))

(declare-fun m!477439 () Bool)

(assert (=> b!496614 m!477439))

(assert (=> b!496614 m!477439))

(declare-fun m!477441 () Bool)

(assert (=> b!496614 m!477441))

(declare-fun m!477443 () Bool)

(assert (=> b!496612 m!477443))

(declare-fun m!477445 () Bool)

(assert (=> b!496612 m!477445))

(declare-fun m!477447 () Bool)

(assert (=> b!496612 m!477447))

(assert (=> b!496612 m!477439))

(declare-fun m!477449 () Bool)

(assert (=> b!496612 m!477449))

(assert (=> b!496612 m!477439))

(declare-fun m!477451 () Bool)

(assert (=> b!496612 m!477451))

(assert (=> b!496612 m!477447))

(declare-fun m!477453 () Bool)

(assert (=> b!496612 m!477453))

(assert (=> b!496612 m!477439))

(declare-fun m!477455 () Bool)

(assert (=> b!496612 m!477455))

(assert (=> b!496612 m!477447))

(declare-fun m!477457 () Bool)

(assert (=> b!496612 m!477457))

(declare-fun m!477459 () Bool)

(assert (=> b!496616 m!477459))

(assert (=> b!496618 m!477439))

(assert (=> b!496618 m!477439))

(declare-fun m!477461 () Bool)

(assert (=> b!496618 m!477461))

(declare-fun m!477463 () Bool)

(assert (=> b!496619 m!477463))

(declare-fun m!477465 () Bool)

(assert (=> b!496620 m!477465))

(assert (=> b!496620 m!477439))

(declare-fun m!477467 () Bool)

(assert (=> start!45234 m!477467))

(declare-fun m!477469 () Bool)

(assert (=> start!45234 m!477469))

(check-sat (not start!45234) (not b!496613) (not b!496619) (not b!496614) (not b!496612) (not b!496611) (not b!496618) (not b!496615) (not b!496616))
(check-sat)
