; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45210 () Bool)

(assert start!45210)

(declare-fun b!496288 () Bool)

(declare-fun res!298685 () Bool)

(declare-fun e!291054 () Bool)

(assert (=> b!496288 (=> (not res!298685) (not e!291054))))

(declare-datatypes ((array!32098 0))(
  ( (array!32099 (arr!15432 (Array (_ BitVec 32) (_ BitVec 64))) (size!15796 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32098)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496288 (= res!298685 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496289 () Bool)

(declare-fun res!298677 () Bool)

(declare-fun e!291055 () Bool)

(assert (=> b!496289 (=> (not res!298677) (not e!291055))))

(declare-datatypes ((List!9590 0))(
  ( (Nil!9587) (Cons!9586 (h!10457 (_ BitVec 64)) (t!15818 List!9590)) )
))
(declare-fun arrayNoDuplicates!0 (array!32098 (_ BitVec 32) List!9590) Bool)

(assert (=> b!496289 (= res!298677 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9587))))

(declare-fun b!496290 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!291057 () Bool)

(declare-datatypes ((SeekEntryResult!3899 0))(
  ( (MissingZero!3899 (index!17775 (_ BitVec 32))) (Found!3899 (index!17776 (_ BitVec 32))) (Intermediate!3899 (undefined!4711 Bool) (index!17777 (_ BitVec 32)) (x!46839 (_ BitVec 32))) (Undefined!3899) (MissingVacant!3899 (index!17778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32098 (_ BitVec 32)) SeekEntryResult!3899)

(assert (=> b!496290 (= e!291057 (= (seekEntryOrOpen!0 (select (arr!15432 a!3235) j!176) a!3235 mask!3524) (Found!3899 j!176)))))

(declare-fun b!496291 () Bool)

(declare-fun e!291056 () Bool)

(assert (=> b!496291 (= e!291056 true)))

(declare-fun lt!224675 () SeekEntryResult!3899)

(assert (=> b!496291 (and (bvslt (x!46839 lt!224675) #b01111111111111111111111111111110) (or (= (select (arr!15432 a!3235) (index!17777 lt!224675)) (select (arr!15432 a!3235) j!176)) (= (select (arr!15432 a!3235) (index!17777 lt!224675)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15432 a!3235) (index!17777 lt!224675)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496292 () Bool)

(declare-fun res!298683 () Bool)

(assert (=> b!496292 (=> (not res!298683) (not e!291054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496292 (= res!298683 (validKeyInArray!0 k!2280))))

(declare-fun b!496293 () Bool)

(declare-fun res!298680 () Bool)

(assert (=> b!496293 (=> (not res!298680) (not e!291055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32098 (_ BitVec 32)) Bool)

(assert (=> b!496293 (= res!298680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496294 () Bool)

(declare-fun res!298676 () Bool)

(assert (=> b!496294 (=> res!298676 e!291056)))

(assert (=> b!496294 (= res!298676 (or (undefined!4711 lt!224675) (not (is-Intermediate!3899 lt!224675))))))

(declare-fun b!496295 () Bool)

(declare-fun res!298679 () Bool)

(assert (=> b!496295 (=> (not res!298679) (not e!291054))))

(assert (=> b!496295 (= res!298679 (validKeyInArray!0 (select (arr!15432 a!3235) j!176)))))

(declare-fun b!496296 () Bool)

(assert (=> b!496296 (= e!291055 (not e!291056))))

(declare-fun res!298675 () Bool)

(assert (=> b!496296 (=> res!298675 e!291056)))

(declare-fun lt!224673 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32098 (_ BitVec 32)) SeekEntryResult!3899)

(assert (=> b!496296 (= res!298675 (= lt!224675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224673 (select (store (arr!15432 a!3235) i!1204 k!2280) j!176) (array!32099 (store (arr!15432 a!3235) i!1204 k!2280) (size!15796 a!3235)) mask!3524)))))

(declare-fun lt!224677 () (_ BitVec 32))

(assert (=> b!496296 (= lt!224675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224677 (select (arr!15432 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496296 (= lt!224673 (toIndex!0 (select (store (arr!15432 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496296 (= lt!224677 (toIndex!0 (select (arr!15432 a!3235) j!176) mask!3524))))

(assert (=> b!496296 e!291057))

(declare-fun res!298684 () Bool)

(assert (=> b!496296 (=> (not res!298684) (not e!291057))))

(assert (=> b!496296 (= res!298684 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14744 0))(
  ( (Unit!14745) )
))
(declare-fun lt!224674 () Unit!14744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14744)

(assert (=> b!496296 (= lt!224674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496297 () Bool)

(declare-fun res!298681 () Bool)

(assert (=> b!496297 (=> (not res!298681) (not e!291054))))

(assert (=> b!496297 (= res!298681 (and (= (size!15796 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15796 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15796 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!298682 () Bool)

(assert (=> start!45210 (=> (not res!298682) (not e!291054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45210 (= res!298682 (validMask!0 mask!3524))))

(assert (=> start!45210 e!291054))

(assert (=> start!45210 true))

(declare-fun array_inv!11228 (array!32098) Bool)

(assert (=> start!45210 (array_inv!11228 a!3235)))

(declare-fun b!496298 () Bool)

(assert (=> b!496298 (= e!291054 e!291055)))

(declare-fun res!298678 () Bool)

(assert (=> b!496298 (=> (not res!298678) (not e!291055))))

(declare-fun lt!224676 () SeekEntryResult!3899)

(assert (=> b!496298 (= res!298678 (or (= lt!224676 (MissingZero!3899 i!1204)) (= lt!224676 (MissingVacant!3899 i!1204))))))

(assert (=> b!496298 (= lt!224676 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45210 res!298682) b!496297))

(assert (= (and b!496297 res!298681) b!496295))

(assert (= (and b!496295 res!298679) b!496292))

(assert (= (and b!496292 res!298683) b!496288))

(assert (= (and b!496288 res!298685) b!496298))

(assert (= (and b!496298 res!298678) b!496293))

(assert (= (and b!496293 res!298680) b!496289))

(assert (= (and b!496289 res!298677) b!496296))

(assert (= (and b!496296 res!298684) b!496290))

(assert (= (and b!496296 (not res!298675)) b!496294))

(assert (= (and b!496294 (not res!298676)) b!496291))

(declare-fun m!477501 () Bool)

(assert (=> b!496296 m!477501))

(declare-fun m!477503 () Bool)

(assert (=> b!496296 m!477503))

(declare-fun m!477505 () Bool)

(assert (=> b!496296 m!477505))

(declare-fun m!477507 () Bool)

(assert (=> b!496296 m!477507))

(assert (=> b!496296 m!477501))

(declare-fun m!477509 () Bool)

(assert (=> b!496296 m!477509))

(declare-fun m!477511 () Bool)

(assert (=> b!496296 m!477511))

(assert (=> b!496296 m!477509))

(declare-fun m!477513 () Bool)

(assert (=> b!496296 m!477513))

(assert (=> b!496296 m!477509))

(declare-fun m!477515 () Bool)

(assert (=> b!496296 m!477515))

(assert (=> b!496296 m!477501))

(declare-fun m!477517 () Bool)

(assert (=> b!496296 m!477517))

(declare-fun m!477519 () Bool)

(assert (=> b!496293 m!477519))

(assert (=> b!496290 m!477509))

(assert (=> b!496290 m!477509))

(declare-fun m!477521 () Bool)

(assert (=> b!496290 m!477521))

(declare-fun m!477523 () Bool)

(assert (=> b!496292 m!477523))

(declare-fun m!477525 () Bool)

(assert (=> b!496291 m!477525))

(assert (=> b!496291 m!477509))

(declare-fun m!477527 () Bool)

(assert (=> b!496288 m!477527))

(declare-fun m!477529 () Bool)

(assert (=> start!45210 m!477529))

(declare-fun m!477531 () Bool)

(assert (=> start!45210 m!477531))

(assert (=> b!496295 m!477509))

(assert (=> b!496295 m!477509))

(declare-fun m!477533 () Bool)

(assert (=> b!496295 m!477533))

(declare-fun m!477535 () Bool)

(assert (=> b!496298 m!477535))

(declare-fun m!477537 () Bool)

(assert (=> b!496289 m!477537))

(push 1)

(assert (not b!496289))

(assert (not b!496295))

(assert (not b!496298))

(assert (not b!496296))

(assert (not b!496290))

(assert (not b!496292))

(assert (not b!496293))

(assert (not b!496288))

(assert (not start!45210))

(check-sat)

