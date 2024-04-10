; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45212 () Bool)

(assert start!45212)

(declare-fun b!496321 () Bool)

(declare-fun e!291072 () Bool)

(declare-fun e!291070 () Bool)

(assert (=> b!496321 (= e!291072 (not e!291070))))

(declare-fun res!298718 () Bool)

(assert (=> b!496321 (=> res!298718 e!291070)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3900 0))(
  ( (MissingZero!3900 (index!17779 (_ BitVec 32))) (Found!3900 (index!17780 (_ BitVec 32))) (Intermediate!3900 (undefined!4712 Bool) (index!17781 (_ BitVec 32)) (x!46840 (_ BitVec 32))) (Undefined!3900) (MissingVacant!3900 (index!17782 (_ BitVec 32))) )
))
(declare-fun lt!224688 () SeekEntryResult!3900)

(declare-datatypes ((array!32100 0))(
  ( (array!32101 (arr!15433 (Array (_ BitVec 32) (_ BitVec 64))) (size!15797 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32100)

(declare-fun lt!224690 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32100 (_ BitVec 32)) SeekEntryResult!3900)

(assert (=> b!496321 (= res!298718 (= lt!224688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224690 (select (store (arr!15433 a!3235) i!1204 k0!2280) j!176) (array!32101 (store (arr!15433 a!3235) i!1204 k0!2280) (size!15797 a!3235)) mask!3524)))))

(declare-fun lt!224692 () (_ BitVec 32))

(assert (=> b!496321 (= lt!224688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224692 (select (arr!15433 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496321 (= lt!224690 (toIndex!0 (select (store (arr!15433 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496321 (= lt!224692 (toIndex!0 (select (arr!15433 a!3235) j!176) mask!3524))))

(declare-fun e!291068 () Bool)

(assert (=> b!496321 e!291068))

(declare-fun res!298715 () Bool)

(assert (=> b!496321 (=> (not res!298715) (not e!291068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32100 (_ BitVec 32)) Bool)

(assert (=> b!496321 (= res!298715 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14746 0))(
  ( (Unit!14747) )
))
(declare-fun lt!224691 () Unit!14746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14746)

(assert (=> b!496321 (= lt!224691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496322 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32100 (_ BitVec 32)) SeekEntryResult!3900)

(assert (=> b!496322 (= e!291068 (= (seekEntryOrOpen!0 (select (arr!15433 a!3235) j!176) a!3235 mask!3524) (Found!3900 j!176)))))

(declare-fun b!496323 () Bool)

(declare-fun res!298710 () Bool)

(assert (=> b!496323 (=> (not res!298710) (not e!291072))))

(declare-datatypes ((List!9591 0))(
  ( (Nil!9588) (Cons!9587 (h!10458 (_ BitVec 64)) (t!15819 List!9591)) )
))
(declare-fun arrayNoDuplicates!0 (array!32100 (_ BitVec 32) List!9591) Bool)

(assert (=> b!496323 (= res!298710 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9588))))

(declare-fun b!496324 () Bool)

(declare-fun res!298714 () Bool)

(assert (=> b!496324 (=> res!298714 e!291070)))

(get-info :version)

(assert (=> b!496324 (= res!298714 (or (undefined!4712 lt!224688) (not ((_ is Intermediate!3900) lt!224688))))))

(declare-fun b!496325 () Bool)

(declare-fun res!298711 () Bool)

(declare-fun e!291069 () Bool)

(assert (=> b!496325 (=> (not res!298711) (not e!291069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496325 (= res!298711 (validKeyInArray!0 k0!2280))))

(declare-fun res!298717 () Bool)

(assert (=> start!45212 (=> (not res!298717) (not e!291069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45212 (= res!298717 (validMask!0 mask!3524))))

(assert (=> start!45212 e!291069))

(assert (=> start!45212 true))

(declare-fun array_inv!11229 (array!32100) Bool)

(assert (=> start!45212 (array_inv!11229 a!3235)))

(declare-fun b!496326 () Bool)

(declare-fun res!298716 () Bool)

(assert (=> b!496326 (=> (not res!298716) (not e!291069))))

(declare-fun arrayContainsKey!0 (array!32100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496326 (= res!298716 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496327 () Bool)

(assert (=> b!496327 (= e!291070 true)))

(assert (=> b!496327 (and (bvslt (x!46840 lt!224688) #b01111111111111111111111111111110) (or (= (select (arr!15433 a!3235) (index!17781 lt!224688)) (select (arr!15433 a!3235) j!176)) (= (select (arr!15433 a!3235) (index!17781 lt!224688)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15433 a!3235) (index!17781 lt!224688)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496328 () Bool)

(declare-fun res!298712 () Bool)

(assert (=> b!496328 (=> (not res!298712) (not e!291069))))

(assert (=> b!496328 (= res!298712 (validKeyInArray!0 (select (arr!15433 a!3235) j!176)))))

(declare-fun b!496329 () Bool)

(declare-fun res!298713 () Bool)

(assert (=> b!496329 (=> (not res!298713) (not e!291072))))

(assert (=> b!496329 (= res!298713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496330 () Bool)

(declare-fun res!298709 () Bool)

(assert (=> b!496330 (=> (not res!298709) (not e!291069))))

(assert (=> b!496330 (= res!298709 (and (= (size!15797 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15797 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15797 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496331 () Bool)

(assert (=> b!496331 (= e!291069 e!291072)))

(declare-fun res!298708 () Bool)

(assert (=> b!496331 (=> (not res!298708) (not e!291072))))

(declare-fun lt!224689 () SeekEntryResult!3900)

(assert (=> b!496331 (= res!298708 (or (= lt!224689 (MissingZero!3900 i!1204)) (= lt!224689 (MissingVacant!3900 i!1204))))))

(assert (=> b!496331 (= lt!224689 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45212 res!298717) b!496330))

(assert (= (and b!496330 res!298709) b!496328))

(assert (= (and b!496328 res!298712) b!496325))

(assert (= (and b!496325 res!298711) b!496326))

(assert (= (and b!496326 res!298716) b!496331))

(assert (= (and b!496331 res!298708) b!496329))

(assert (= (and b!496329 res!298713) b!496323))

(assert (= (and b!496323 res!298710) b!496321))

(assert (= (and b!496321 res!298715) b!496322))

(assert (= (and b!496321 (not res!298718)) b!496324))

(assert (= (and b!496324 (not res!298714)) b!496327))

(declare-fun m!477539 () Bool)

(assert (=> b!496331 m!477539))

(declare-fun m!477541 () Bool)

(assert (=> b!496323 m!477541))

(declare-fun m!477543 () Bool)

(assert (=> b!496327 m!477543))

(declare-fun m!477545 () Bool)

(assert (=> b!496327 m!477545))

(declare-fun m!477547 () Bool)

(assert (=> b!496329 m!477547))

(declare-fun m!477549 () Bool)

(assert (=> b!496326 m!477549))

(assert (=> b!496328 m!477545))

(assert (=> b!496328 m!477545))

(declare-fun m!477551 () Bool)

(assert (=> b!496328 m!477551))

(declare-fun m!477553 () Bool)

(assert (=> b!496321 m!477553))

(declare-fun m!477555 () Bool)

(assert (=> b!496321 m!477555))

(assert (=> b!496321 m!477545))

(declare-fun m!477557 () Bool)

(assert (=> b!496321 m!477557))

(assert (=> b!496321 m!477545))

(assert (=> b!496321 m!477555))

(declare-fun m!477559 () Bool)

(assert (=> b!496321 m!477559))

(declare-fun m!477561 () Bool)

(assert (=> b!496321 m!477561))

(assert (=> b!496321 m!477555))

(declare-fun m!477563 () Bool)

(assert (=> b!496321 m!477563))

(declare-fun m!477565 () Bool)

(assert (=> b!496321 m!477565))

(assert (=> b!496321 m!477545))

(declare-fun m!477567 () Bool)

(assert (=> b!496321 m!477567))

(assert (=> b!496322 m!477545))

(assert (=> b!496322 m!477545))

(declare-fun m!477569 () Bool)

(assert (=> b!496322 m!477569))

(declare-fun m!477571 () Bool)

(assert (=> start!45212 m!477571))

(declare-fun m!477573 () Bool)

(assert (=> start!45212 m!477573))

(declare-fun m!477575 () Bool)

(assert (=> b!496325 m!477575))

(check-sat (not b!496321) (not b!496323) (not b!496325) (not b!496328) (not b!496331) (not b!496326) (not b!496329) (not b!496322) (not start!45212))
