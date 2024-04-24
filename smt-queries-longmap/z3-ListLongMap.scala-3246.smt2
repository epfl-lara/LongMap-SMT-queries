; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45272 () Bool)

(assert start!45272)

(declare-fun b!497421 () Bool)

(declare-fun res!299861 () Bool)

(declare-fun e!291564 () Bool)

(assert (=> b!497421 (=> res!299861 e!291564)))

(declare-datatypes ((SeekEntryResult!3886 0))(
  ( (MissingZero!3886 (index!17723 (_ BitVec 32))) (Found!3886 (index!17724 (_ BitVec 32))) (Intermediate!3886 (undefined!4698 Bool) (index!17725 (_ BitVec 32)) (x!46919 (_ BitVec 32))) (Undefined!3886) (MissingVacant!3886 (index!17726 (_ BitVec 32))) )
))
(declare-fun lt!225241 () SeekEntryResult!3886)

(get-info :version)

(assert (=> b!497421 (= res!299861 (or (undefined!4698 lt!225241) (not ((_ is Intermediate!3886) lt!225241))))))

(declare-fun b!497422 () Bool)

(declare-fun res!299868 () Bool)

(declare-fun e!291560 () Bool)

(assert (=> b!497422 (=> (not res!299868) (not e!291560))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32161 0))(
  ( (array!32162 (arr!15463 (Array (_ BitVec 32) (_ BitVec 64))) (size!15827 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32161)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497422 (= res!299868 (and (= (size!15827 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15827 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15827 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!299860 () Bool)

(assert (=> start!45272 (=> (not res!299860) (not e!291560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45272 (= res!299860 (validMask!0 mask!3524))))

(assert (=> start!45272 e!291560))

(assert (=> start!45272 true))

(declare-fun array_inv!11322 (array!32161) Bool)

(assert (=> start!45272 (array_inv!11322 a!3235)))

(declare-fun b!497423 () Bool)

(declare-fun e!291559 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32161 (_ BitVec 32)) SeekEntryResult!3886)

(assert (=> b!497423 (= e!291559 (= (seekEntryOrOpen!0 (select (arr!15463 a!3235) j!176) a!3235 mask!3524) (Found!3886 j!176)))))

(declare-fun b!497424 () Bool)

(declare-fun res!299867 () Bool)

(assert (=> b!497424 (=> (not res!299867) (not e!291560))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497424 (= res!299867 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497425 () Bool)

(declare-fun res!299866 () Bool)

(declare-fun e!291561 () Bool)

(assert (=> b!497425 (=> (not res!299866) (not e!291561))))

(declare-datatypes ((List!9528 0))(
  ( (Nil!9525) (Cons!9524 (h!10395 (_ BitVec 64)) (t!15748 List!9528)) )
))
(declare-fun arrayNoDuplicates!0 (array!32161 (_ BitVec 32) List!9528) Bool)

(assert (=> b!497425 (= res!299866 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9525))))

(declare-fun b!497426 () Bool)

(assert (=> b!497426 (= e!291560 e!291561)))

(declare-fun res!299858 () Bool)

(assert (=> b!497426 (=> (not res!299858) (not e!291561))))

(declare-fun lt!225235 () SeekEntryResult!3886)

(assert (=> b!497426 (= res!299858 (or (= lt!225235 (MissingZero!3886 i!1204)) (= lt!225235 (MissingVacant!3886 i!1204))))))

(assert (=> b!497426 (= lt!225235 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497427 () Bool)

(declare-datatypes ((Unit!14779 0))(
  ( (Unit!14780) )
))
(declare-fun e!291562 () Unit!14779)

(declare-fun Unit!14781 () Unit!14779)

(assert (=> b!497427 (= e!291562 Unit!14781)))

(declare-fun lt!225234 () (_ BitVec 32))

(declare-fun lt!225238 () Unit!14779)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14779)

(assert (=> b!497427 (= lt!225238 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225234 #b00000000000000000000000000000000 (index!17725 lt!225241) (x!46919 lt!225241) mask!3524))))

(declare-fun res!299869 () Bool)

(declare-fun lt!225240 () (_ BitVec 64))

(declare-fun lt!225239 () array!32161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32161 (_ BitVec 32)) SeekEntryResult!3886)

(assert (=> b!497427 (= res!299869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225234 lt!225240 lt!225239 mask!3524) (Intermediate!3886 false (index!17725 lt!225241) (x!46919 lt!225241))))))

(declare-fun e!291563 () Bool)

(assert (=> b!497427 (=> (not res!299869) (not e!291563))))

(assert (=> b!497427 e!291563))

(declare-fun b!497428 () Bool)

(declare-fun res!299864 () Bool)

(assert (=> b!497428 (=> (not res!299864) (not e!291560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497428 (= res!299864 (validKeyInArray!0 (select (arr!15463 a!3235) j!176)))))

(declare-fun b!497429 () Bool)

(assert (=> b!497429 (= e!291564 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!497429 (and (or (= (select (arr!15463 a!3235) (index!17725 lt!225241)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15463 a!3235) (index!17725 lt!225241)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15463 a!3235) (index!17725 lt!225241)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15463 a!3235) (index!17725 lt!225241)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225236 () Unit!14779)

(assert (=> b!497429 (= lt!225236 e!291562)))

(declare-fun c!59057 () Bool)

(assert (=> b!497429 (= c!59057 (= (select (arr!15463 a!3235) (index!17725 lt!225241)) (select (arr!15463 a!3235) j!176)))))

(assert (=> b!497429 (and (bvslt (x!46919 lt!225241) #b01111111111111111111111111111110) (or (= (select (arr!15463 a!3235) (index!17725 lt!225241)) (select (arr!15463 a!3235) j!176)) (= (select (arr!15463 a!3235) (index!17725 lt!225241)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15463 a!3235) (index!17725 lt!225241)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497430 () Bool)

(declare-fun res!299859 () Bool)

(assert (=> b!497430 (=> (not res!299859) (not e!291561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32161 (_ BitVec 32)) Bool)

(assert (=> b!497430 (= res!299859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497431 () Bool)

(assert (=> b!497431 (= e!291563 false)))

(declare-fun b!497432 () Bool)

(assert (=> b!497432 (= e!291561 (not e!291564))))

(declare-fun res!299863 () Bool)

(assert (=> b!497432 (=> res!299863 e!291564)))

(declare-fun lt!225237 () (_ BitVec 32))

(assert (=> b!497432 (= res!299863 (= lt!225241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225237 lt!225240 lt!225239 mask!3524)))))

(assert (=> b!497432 (= lt!225241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225234 (select (arr!15463 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497432 (= lt!225237 (toIndex!0 lt!225240 mask!3524))))

(assert (=> b!497432 (= lt!225240 (select (store (arr!15463 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497432 (= lt!225234 (toIndex!0 (select (arr!15463 a!3235) j!176) mask!3524))))

(assert (=> b!497432 (= lt!225239 (array!32162 (store (arr!15463 a!3235) i!1204 k0!2280) (size!15827 a!3235)))))

(assert (=> b!497432 e!291559))

(declare-fun res!299862 () Bool)

(assert (=> b!497432 (=> (not res!299862) (not e!291559))))

(assert (=> b!497432 (= res!299862 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225233 () Unit!14779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14779)

(assert (=> b!497432 (= lt!225233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497433 () Bool)

(declare-fun Unit!14782 () Unit!14779)

(assert (=> b!497433 (= e!291562 Unit!14782)))

(declare-fun b!497434 () Bool)

(declare-fun res!299865 () Bool)

(assert (=> b!497434 (=> (not res!299865) (not e!291560))))

(assert (=> b!497434 (= res!299865 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45272 res!299860) b!497422))

(assert (= (and b!497422 res!299868) b!497428))

(assert (= (and b!497428 res!299864) b!497434))

(assert (= (and b!497434 res!299865) b!497424))

(assert (= (and b!497424 res!299867) b!497426))

(assert (= (and b!497426 res!299858) b!497430))

(assert (= (and b!497430 res!299859) b!497425))

(assert (= (and b!497425 res!299866) b!497432))

(assert (= (and b!497432 res!299862) b!497423))

(assert (= (and b!497432 (not res!299863)) b!497421))

(assert (= (and b!497421 (not res!299861)) b!497429))

(assert (= (and b!497429 c!59057) b!497427))

(assert (= (and b!497429 (not c!59057)) b!497433))

(assert (= (and b!497427 res!299869) b!497431))

(declare-fun m!479053 () Bool)

(assert (=> b!497432 m!479053))

(declare-fun m!479055 () Bool)

(assert (=> b!497432 m!479055))

(declare-fun m!479057 () Bool)

(assert (=> b!497432 m!479057))

(declare-fun m!479059 () Bool)

(assert (=> b!497432 m!479059))

(declare-fun m!479061 () Bool)

(assert (=> b!497432 m!479061))

(declare-fun m!479063 () Bool)

(assert (=> b!497432 m!479063))

(assert (=> b!497432 m!479059))

(declare-fun m!479065 () Bool)

(assert (=> b!497432 m!479065))

(assert (=> b!497432 m!479059))

(declare-fun m!479067 () Bool)

(assert (=> b!497432 m!479067))

(declare-fun m!479069 () Bool)

(assert (=> b!497432 m!479069))

(declare-fun m!479071 () Bool)

(assert (=> b!497434 m!479071))

(declare-fun m!479073 () Bool)

(assert (=> b!497430 m!479073))

(assert (=> b!497428 m!479059))

(assert (=> b!497428 m!479059))

(declare-fun m!479075 () Bool)

(assert (=> b!497428 m!479075))

(declare-fun m!479077 () Bool)

(assert (=> b!497424 m!479077))

(assert (=> b!497423 m!479059))

(assert (=> b!497423 m!479059))

(declare-fun m!479079 () Bool)

(assert (=> b!497423 m!479079))

(declare-fun m!479081 () Bool)

(assert (=> b!497426 m!479081))

(declare-fun m!479083 () Bool)

(assert (=> b!497429 m!479083))

(assert (=> b!497429 m!479059))

(declare-fun m!479085 () Bool)

(assert (=> b!497427 m!479085))

(declare-fun m!479087 () Bool)

(assert (=> b!497427 m!479087))

(declare-fun m!479089 () Bool)

(assert (=> b!497425 m!479089))

(declare-fun m!479091 () Bool)

(assert (=> start!45272 m!479091))

(declare-fun m!479093 () Bool)

(assert (=> start!45272 m!479093))

(check-sat (not b!497425) (not b!497426) (not b!497427) (not b!497434) (not start!45272) (not b!497423) (not b!497432) (not b!497428) (not b!497424) (not b!497430))
(check-sat)
