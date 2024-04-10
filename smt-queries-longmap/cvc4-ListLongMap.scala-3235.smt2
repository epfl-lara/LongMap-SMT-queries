; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45220 () Bool)

(assert start!45220)

(declare-fun res!298846 () Bool)

(declare-fun e!291132 () Bool)

(assert (=> start!45220 (=> (not res!298846) (not e!291132))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45220 (= res!298846 (validMask!0 mask!3524))))

(assert (=> start!45220 e!291132))

(assert (=> start!45220 true))

(declare-datatypes ((array!32108 0))(
  ( (array!32109 (arr!15437 (Array (_ BitVec 32) (_ BitVec 64))) (size!15801 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32108)

(declare-fun array_inv!11233 (array!32108) Bool)

(assert (=> start!45220 (array_inv!11233 a!3235)))

(declare-fun b!496453 () Bool)

(declare-fun e!291130 () Bool)

(declare-fun e!291129 () Bool)

(assert (=> b!496453 (= e!291130 (not e!291129))))

(declare-fun res!298849 () Bool)

(assert (=> b!496453 (=> res!298849 e!291129)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3904 0))(
  ( (MissingZero!3904 (index!17795 (_ BitVec 32))) (Found!3904 (index!17796 (_ BitVec 32))) (Intermediate!3904 (undefined!4716 Bool) (index!17797 (_ BitVec 32)) (x!46852 (_ BitVec 32))) (Undefined!3904) (MissingVacant!3904 (index!17798 (_ BitVec 32))) )
))
(declare-fun lt!224748 () SeekEntryResult!3904)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224752 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32108 (_ BitVec 32)) SeekEntryResult!3904)

(assert (=> b!496453 (= res!298849 (= lt!224748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224752 (select (store (arr!15437 a!3235) i!1204 k!2280) j!176) (array!32109 (store (arr!15437 a!3235) i!1204 k!2280) (size!15801 a!3235)) mask!3524)))))

(declare-fun lt!224750 () (_ BitVec 32))

(assert (=> b!496453 (= lt!224748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224750 (select (arr!15437 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496453 (= lt!224752 (toIndex!0 (select (store (arr!15437 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496453 (= lt!224750 (toIndex!0 (select (arr!15437 a!3235) j!176) mask!3524))))

(declare-fun e!291128 () Bool)

(assert (=> b!496453 e!291128))

(declare-fun res!298845 () Bool)

(assert (=> b!496453 (=> (not res!298845) (not e!291128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32108 (_ BitVec 32)) Bool)

(assert (=> b!496453 (= res!298845 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14754 0))(
  ( (Unit!14755) )
))
(declare-fun lt!224749 () Unit!14754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14754)

(assert (=> b!496453 (= lt!224749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496454 () Bool)

(declare-fun res!298848 () Bool)

(assert (=> b!496454 (=> (not res!298848) (not e!291130))))

(assert (=> b!496454 (= res!298848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496455 () Bool)

(declare-fun res!298842 () Bool)

(assert (=> b!496455 (=> res!298842 e!291129)))

(assert (=> b!496455 (= res!298842 (or (undefined!4716 lt!224748) (not (is-Intermediate!3904 lt!224748))))))

(declare-fun b!496456 () Bool)

(declare-fun res!298841 () Bool)

(assert (=> b!496456 (=> (not res!298841) (not e!291130))))

(declare-datatypes ((List!9595 0))(
  ( (Nil!9592) (Cons!9591 (h!10462 (_ BitVec 64)) (t!15823 List!9595)) )
))
(declare-fun arrayNoDuplicates!0 (array!32108 (_ BitVec 32) List!9595) Bool)

(assert (=> b!496456 (= res!298841 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9592))))

(declare-fun b!496457 () Bool)

(assert (=> b!496457 (= e!291132 e!291130)))

(declare-fun res!298850 () Bool)

(assert (=> b!496457 (=> (not res!298850) (not e!291130))))

(declare-fun lt!224751 () SeekEntryResult!3904)

(assert (=> b!496457 (= res!298850 (or (= lt!224751 (MissingZero!3904 i!1204)) (= lt!224751 (MissingVacant!3904 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32108 (_ BitVec 32)) SeekEntryResult!3904)

(assert (=> b!496457 (= lt!224751 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496458 () Bool)

(declare-fun res!298844 () Bool)

(assert (=> b!496458 (=> (not res!298844) (not e!291132))))

(declare-fun arrayContainsKey!0 (array!32108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496458 (= res!298844 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496459 () Bool)

(declare-fun res!298843 () Bool)

(assert (=> b!496459 (=> (not res!298843) (not e!291132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496459 (= res!298843 (validKeyInArray!0 (select (arr!15437 a!3235) j!176)))))

(declare-fun b!496460 () Bool)

(assert (=> b!496460 (= e!291128 (= (seekEntryOrOpen!0 (select (arr!15437 a!3235) j!176) a!3235 mask!3524) (Found!3904 j!176)))))

(declare-fun b!496461 () Bool)

(declare-fun res!298840 () Bool)

(assert (=> b!496461 (=> (not res!298840) (not e!291132))))

(assert (=> b!496461 (= res!298840 (validKeyInArray!0 k!2280))))

(declare-fun b!496462 () Bool)

(assert (=> b!496462 (= e!291129 true)))

(assert (=> b!496462 (and (bvslt (x!46852 lt!224748) #b01111111111111111111111111111110) (or (= (select (arr!15437 a!3235) (index!17797 lt!224748)) (select (arr!15437 a!3235) j!176)) (= (select (arr!15437 a!3235) (index!17797 lt!224748)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15437 a!3235) (index!17797 lt!224748)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496463 () Bool)

(declare-fun res!298847 () Bool)

(assert (=> b!496463 (=> (not res!298847) (not e!291132))))

(assert (=> b!496463 (= res!298847 (and (= (size!15801 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15801 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15801 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45220 res!298846) b!496463))

(assert (= (and b!496463 res!298847) b!496459))

(assert (= (and b!496459 res!298843) b!496461))

(assert (= (and b!496461 res!298840) b!496458))

(assert (= (and b!496458 res!298844) b!496457))

(assert (= (and b!496457 res!298850) b!496454))

(assert (= (and b!496454 res!298848) b!496456))

(assert (= (and b!496456 res!298841) b!496453))

(assert (= (and b!496453 res!298845) b!496460))

(assert (= (and b!496453 (not res!298849)) b!496455))

(assert (= (and b!496455 (not res!298842)) b!496462))

(declare-fun m!477691 () Bool)

(assert (=> b!496459 m!477691))

(assert (=> b!496459 m!477691))

(declare-fun m!477693 () Bool)

(assert (=> b!496459 m!477693))

(declare-fun m!477695 () Bool)

(assert (=> b!496457 m!477695))

(declare-fun m!477697 () Bool)

(assert (=> b!496456 m!477697))

(declare-fun m!477699 () Bool)

(assert (=> b!496461 m!477699))

(declare-fun m!477701 () Bool)

(assert (=> start!45220 m!477701))

(declare-fun m!477703 () Bool)

(assert (=> start!45220 m!477703))

(declare-fun m!477705 () Bool)

(assert (=> b!496454 m!477705))

(declare-fun m!477707 () Bool)

(assert (=> b!496462 m!477707))

(assert (=> b!496462 m!477691))

(assert (=> b!496460 m!477691))

(assert (=> b!496460 m!477691))

(declare-fun m!477709 () Bool)

(assert (=> b!496460 m!477709))

(declare-fun m!477711 () Bool)

(assert (=> b!496458 m!477711))

(declare-fun m!477713 () Bool)

(assert (=> b!496453 m!477713))

(declare-fun m!477715 () Bool)

(assert (=> b!496453 m!477715))

(declare-fun m!477717 () Bool)

(assert (=> b!496453 m!477717))

(assert (=> b!496453 m!477691))

(declare-fun m!477719 () Bool)

(assert (=> b!496453 m!477719))

(assert (=> b!496453 m!477717))

(declare-fun m!477721 () Bool)

(assert (=> b!496453 m!477721))

(assert (=> b!496453 m!477691))

(assert (=> b!496453 m!477691))

(declare-fun m!477723 () Bool)

(assert (=> b!496453 m!477723))

(declare-fun m!477725 () Bool)

(assert (=> b!496453 m!477725))

(assert (=> b!496453 m!477717))

(declare-fun m!477727 () Bool)

(assert (=> b!496453 m!477727))

(push 1)

(assert (not b!496459))

(assert (not b!496456))

(assert (not b!496454))

(assert (not b!496461))

(assert (not b!496460))

(assert (not b!496457))

(assert (not b!496453))

(assert (not start!45220))

(assert (not b!496458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

