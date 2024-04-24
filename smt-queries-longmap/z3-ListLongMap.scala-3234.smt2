; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45200 () Bool)

(assert start!45200)

(declare-fun b!496227 () Bool)

(declare-fun res!298678 () Bool)

(declare-fun e!291015 () Bool)

(assert (=> b!496227 (=> (not res!298678) (not e!291015))))

(declare-datatypes ((array!32089 0))(
  ( (array!32090 (arr!15427 (Array (_ BitVec 32) (_ BitVec 64))) (size!15791 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32089)

(declare-datatypes ((List!9492 0))(
  ( (Nil!9489) (Cons!9488 (h!10359 (_ BitVec 64)) (t!15712 List!9492)) )
))
(declare-fun arrayNoDuplicates!0 (array!32089 (_ BitVec 32) List!9492) Bool)

(assert (=> b!496227 (= res!298678 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9489))))

(declare-fun b!496228 () Bool)

(declare-fun res!298672 () Bool)

(declare-fun e!291017 () Bool)

(assert (=> b!496228 (=> res!298672 e!291017)))

(declare-datatypes ((SeekEntryResult!3850 0))(
  ( (MissingZero!3850 (index!17579 (_ BitVec 32))) (Found!3850 (index!17580 (_ BitVec 32))) (Intermediate!3850 (undefined!4662 Bool) (index!17581 (_ BitVec 32)) (x!46787 (_ BitVec 32))) (Undefined!3850) (MissingVacant!3850 (index!17582 (_ BitVec 32))) )
))
(declare-fun lt!224686 () SeekEntryResult!3850)

(get-info :version)

(assert (=> b!496228 (= res!298672 (or (undefined!4662 lt!224686) (not ((_ is Intermediate!3850) lt!224686))))))

(declare-fun b!496229 () Bool)

(declare-fun res!298675 () Bool)

(declare-fun e!291018 () Bool)

(assert (=> b!496229 (=> (not res!298675) (not e!291018))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496229 (= res!298675 (and (= (size!15791 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15791 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15791 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!298677 () Bool)

(assert (=> start!45200 (=> (not res!298677) (not e!291018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45200 (= res!298677 (validMask!0 mask!3524))))

(assert (=> start!45200 e!291018))

(assert (=> start!45200 true))

(declare-fun array_inv!11286 (array!32089) Bool)

(assert (=> start!45200 (array_inv!11286 a!3235)))

(declare-fun b!496230 () Bool)

(declare-fun res!298669 () Bool)

(assert (=> b!496230 (=> (not res!298669) (not e!291018))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496230 (= res!298669 (validKeyInArray!0 k0!2280))))

(declare-fun b!496231 () Bool)

(assert (=> b!496231 (= e!291017 true)))

(assert (=> b!496231 (and (bvslt (x!46787 lt!224686) #b01111111111111111111111111111110) (or (= (select (arr!15427 a!3235) (index!17581 lt!224686)) (select (arr!15427 a!3235) j!176)) (= (select (arr!15427 a!3235) (index!17581 lt!224686)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15427 a!3235) (index!17581 lt!224686)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!291014 () Bool)

(declare-fun b!496232 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32089 (_ BitVec 32)) SeekEntryResult!3850)

(assert (=> b!496232 (= e!291014 (= (seekEntryOrOpen!0 (select (arr!15427 a!3235) j!176) a!3235 mask!3524) (Found!3850 j!176)))))

(declare-fun b!496233 () Bool)

(assert (=> b!496233 (= e!291018 e!291015)))

(declare-fun res!298673 () Bool)

(assert (=> b!496233 (=> (not res!298673) (not e!291015))))

(declare-fun lt!224687 () SeekEntryResult!3850)

(assert (=> b!496233 (= res!298673 (or (= lt!224687 (MissingZero!3850 i!1204)) (= lt!224687 (MissingVacant!3850 i!1204))))))

(assert (=> b!496233 (= lt!224687 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496234 () Bool)

(declare-fun res!298668 () Bool)

(assert (=> b!496234 (=> (not res!298668) (not e!291015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32089 (_ BitVec 32)) Bool)

(assert (=> b!496234 (= res!298668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496235 () Bool)

(declare-fun res!298674 () Bool)

(assert (=> b!496235 (=> (not res!298674) (not e!291018))))

(assert (=> b!496235 (= res!298674 (validKeyInArray!0 (select (arr!15427 a!3235) j!176)))))

(declare-fun b!496236 () Bool)

(assert (=> b!496236 (= e!291015 (not e!291017))))

(declare-fun res!298670 () Bool)

(assert (=> b!496236 (=> res!298670 e!291017)))

(declare-fun lt!224689 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32089 (_ BitVec 32)) SeekEntryResult!3850)

(assert (=> b!496236 (= res!298670 (= lt!224686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224689 (select (store (arr!15427 a!3235) i!1204 k0!2280) j!176) (array!32090 (store (arr!15427 a!3235) i!1204 k0!2280) (size!15791 a!3235)) mask!3524)))))

(declare-fun lt!224685 () (_ BitVec 32))

(assert (=> b!496236 (= lt!224686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224685 (select (arr!15427 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496236 (= lt!224689 (toIndex!0 (select (store (arr!15427 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496236 (= lt!224685 (toIndex!0 (select (arr!15427 a!3235) j!176) mask!3524))))

(assert (=> b!496236 e!291014))

(declare-fun res!298671 () Bool)

(assert (=> b!496236 (=> (not res!298671) (not e!291014))))

(assert (=> b!496236 (= res!298671 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14707 0))(
  ( (Unit!14708) )
))
(declare-fun lt!224688 () Unit!14707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14707)

(assert (=> b!496236 (= lt!224688 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496237 () Bool)

(declare-fun res!298676 () Bool)

(assert (=> b!496237 (=> (not res!298676) (not e!291018))))

(declare-fun arrayContainsKey!0 (array!32089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496237 (= res!298676 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45200 res!298677) b!496229))

(assert (= (and b!496229 res!298675) b!496235))

(assert (= (and b!496235 res!298674) b!496230))

(assert (= (and b!496230 res!298669) b!496237))

(assert (= (and b!496237 res!298676) b!496233))

(assert (= (and b!496233 res!298673) b!496234))

(assert (= (and b!496234 res!298668) b!496227))

(assert (= (and b!496227 res!298678) b!496236))

(assert (= (and b!496236 res!298671) b!496232))

(assert (= (and b!496236 (not res!298670)) b!496228))

(assert (= (and b!496228 (not res!298672)) b!496231))

(declare-fun m!477685 () Bool)

(assert (=> b!496230 m!477685))

(declare-fun m!477687 () Bool)

(assert (=> b!496237 m!477687))

(declare-fun m!477689 () Bool)

(assert (=> b!496235 m!477689))

(assert (=> b!496235 m!477689))

(declare-fun m!477691 () Bool)

(assert (=> b!496235 m!477691))

(declare-fun m!477693 () Bool)

(assert (=> start!45200 m!477693))

(declare-fun m!477695 () Bool)

(assert (=> start!45200 m!477695))

(assert (=> b!496232 m!477689))

(assert (=> b!496232 m!477689))

(declare-fun m!477697 () Bool)

(assert (=> b!496232 m!477697))

(declare-fun m!477699 () Bool)

(assert (=> b!496234 m!477699))

(declare-fun m!477701 () Bool)

(assert (=> b!496233 m!477701))

(declare-fun m!477703 () Bool)

(assert (=> b!496227 m!477703))

(declare-fun m!477705 () Bool)

(assert (=> b!496231 m!477705))

(assert (=> b!496231 m!477689))

(assert (=> b!496236 m!477689))

(declare-fun m!477707 () Bool)

(assert (=> b!496236 m!477707))

(declare-fun m!477709 () Bool)

(assert (=> b!496236 m!477709))

(declare-fun m!477711 () Bool)

(assert (=> b!496236 m!477711))

(declare-fun m!477713 () Bool)

(assert (=> b!496236 m!477713))

(assert (=> b!496236 m!477689))

(declare-fun m!477715 () Bool)

(assert (=> b!496236 m!477715))

(assert (=> b!496236 m!477689))

(declare-fun m!477717 () Bool)

(assert (=> b!496236 m!477717))

(assert (=> b!496236 m!477713))

(declare-fun m!477719 () Bool)

(assert (=> b!496236 m!477719))

(assert (=> b!496236 m!477713))

(declare-fun m!477721 () Bool)

(assert (=> b!496236 m!477721))

(check-sat (not b!496234) (not b!496235) (not b!496232) (not b!496230) (not start!45200) (not b!496233) (not b!496236) (not b!496237) (not b!496227))
(check-sat)
