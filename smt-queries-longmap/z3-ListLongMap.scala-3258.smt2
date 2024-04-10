; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45422 () Bool)

(assert start!45422)

(declare-fun b!499458 () Bool)

(declare-fun res!301428 () Bool)

(declare-fun e!292685 () Bool)

(assert (=> b!499458 (=> (not res!301428) (not e!292685))))

(declare-datatypes ((array!32247 0))(
  ( (array!32248 (arr!15505 (Array (_ BitVec 32) (_ BitVec 64))) (size!15869 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32247)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32247 (_ BitVec 32)) Bool)

(assert (=> b!499458 (= res!301428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499459 () Bool)

(declare-fun e!292679 () Bool)

(assert (=> b!499459 (= e!292679 false)))

(declare-fun b!499460 () Bool)

(declare-fun e!292686 () Bool)

(assert (=> b!499460 (= e!292686 true)))

(declare-fun lt!226466 () (_ BitVec 32))

(declare-fun lt!226463 () array!32247)

(declare-fun lt!226467 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3972 0))(
  ( (MissingZero!3972 (index!18070 (_ BitVec 32))) (Found!3972 (index!18071 (_ BitVec 32))) (Intermediate!3972 (undefined!4784 Bool) (index!18072 (_ BitVec 32)) (x!47113 (_ BitVec 32))) (Undefined!3972) (MissingVacant!3972 (index!18073 (_ BitVec 32))) )
))
(declare-fun lt!226460 () SeekEntryResult!3972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32247 (_ BitVec 32)) SeekEntryResult!3972)

(assert (=> b!499460 (= lt!226460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226466 lt!226467 lt!226463 mask!3524))))

(declare-fun b!499461 () Bool)

(declare-fun res!301422 () Bool)

(declare-fun e!292682 () Bool)

(assert (=> b!499461 (=> (not res!301422) (not e!292682))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499461 (= res!301422 (validKeyInArray!0 k0!2280))))

(declare-fun b!499462 () Bool)

(declare-datatypes ((Unit!14964 0))(
  ( (Unit!14965) )
))
(declare-fun e!292683 () Unit!14964)

(declare-fun Unit!14966 () Unit!14964)

(assert (=> b!499462 (= e!292683 Unit!14966)))

(declare-fun b!499463 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!292681 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32247 (_ BitVec 32)) SeekEntryResult!3972)

(assert (=> b!499463 (= e!292681 (= (seekEntryOrOpen!0 (select (arr!15505 a!3235) j!176) a!3235 mask!3524) (Found!3972 j!176)))))

(declare-fun b!499464 () Bool)

(declare-fun res!301427 () Bool)

(assert (=> b!499464 (=> (not res!301427) (not e!292682))))

(declare-fun arrayContainsKey!0 (array!32247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499464 (= res!301427 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!301423 () Bool)

(assert (=> start!45422 (=> (not res!301423) (not e!292682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45422 (= res!301423 (validMask!0 mask!3524))))

(assert (=> start!45422 e!292682))

(assert (=> start!45422 true))

(declare-fun array_inv!11301 (array!32247) Bool)

(assert (=> start!45422 (array_inv!11301 a!3235)))

(declare-fun b!499465 () Bool)

(declare-fun Unit!14967 () Unit!14964)

(assert (=> b!499465 (= e!292683 Unit!14967)))

(declare-fun lt!226468 () Unit!14964)

(declare-fun lt!226464 () SeekEntryResult!3972)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32247 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14964)

(assert (=> b!499465 (= lt!226468 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226466 #b00000000000000000000000000000000 (index!18072 lt!226464) (x!47113 lt!226464) mask!3524))))

(declare-fun res!301425 () Bool)

(assert (=> b!499465 (= res!301425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226466 lt!226467 lt!226463 mask!3524) (Intermediate!3972 false (index!18072 lt!226464) (x!47113 lt!226464))))))

(assert (=> b!499465 (=> (not res!301425) (not e!292679))))

(assert (=> b!499465 e!292679))

(declare-fun b!499466 () Bool)

(declare-fun e!292680 () Bool)

(assert (=> b!499466 (= e!292680 e!292686)))

(declare-fun res!301420 () Bool)

(assert (=> b!499466 (=> res!301420 e!292686)))

(assert (=> b!499466 (= res!301420 (or (bvsgt #b00000000000000000000000000000000 (x!47113 lt!226464)) (bvsgt (x!47113 lt!226464) #b01111111111111111111111111111110) (bvslt lt!226466 #b00000000000000000000000000000000) (bvsge lt!226466 (size!15869 a!3235)) (bvslt (index!18072 lt!226464) #b00000000000000000000000000000000) (bvsge (index!18072 lt!226464) (size!15869 a!3235)) (not (= lt!226464 (Intermediate!3972 false (index!18072 lt!226464) (x!47113 lt!226464))))))))

(assert (=> b!499466 (and (or (= (select (arr!15505 a!3235) (index!18072 lt!226464)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15505 a!3235) (index!18072 lt!226464)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15505 a!3235) (index!18072 lt!226464)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15505 a!3235) (index!18072 lt!226464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226461 () Unit!14964)

(assert (=> b!499466 (= lt!226461 e!292683)))

(declare-fun c!59297 () Bool)

(assert (=> b!499466 (= c!59297 (= (select (arr!15505 a!3235) (index!18072 lt!226464)) (select (arr!15505 a!3235) j!176)))))

(assert (=> b!499466 (and (bvslt (x!47113 lt!226464) #b01111111111111111111111111111110) (or (= (select (arr!15505 a!3235) (index!18072 lt!226464)) (select (arr!15505 a!3235) j!176)) (= (select (arr!15505 a!3235) (index!18072 lt!226464)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15505 a!3235) (index!18072 lt!226464)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499467 () Bool)

(assert (=> b!499467 (= e!292682 e!292685)))

(declare-fun res!301421 () Bool)

(assert (=> b!499467 (=> (not res!301421) (not e!292685))))

(declare-fun lt!226459 () SeekEntryResult!3972)

(assert (=> b!499467 (= res!301421 (or (= lt!226459 (MissingZero!3972 i!1204)) (= lt!226459 (MissingVacant!3972 i!1204))))))

(assert (=> b!499467 (= lt!226459 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499468 () Bool)

(assert (=> b!499468 (= e!292685 (not e!292680))))

(declare-fun res!301424 () Bool)

(assert (=> b!499468 (=> res!301424 e!292680)))

(declare-fun lt!226465 () (_ BitVec 32))

(assert (=> b!499468 (= res!301424 (= lt!226464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226465 lt!226467 lt!226463 mask!3524)))))

(assert (=> b!499468 (= lt!226464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226466 (select (arr!15505 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499468 (= lt!226465 (toIndex!0 lt!226467 mask!3524))))

(assert (=> b!499468 (= lt!226467 (select (store (arr!15505 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499468 (= lt!226466 (toIndex!0 (select (arr!15505 a!3235) j!176) mask!3524))))

(assert (=> b!499468 (= lt!226463 (array!32248 (store (arr!15505 a!3235) i!1204 k0!2280) (size!15869 a!3235)))))

(assert (=> b!499468 e!292681))

(declare-fun res!301429 () Bool)

(assert (=> b!499468 (=> (not res!301429) (not e!292681))))

(assert (=> b!499468 (= res!301429 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226462 () Unit!14964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14964)

(assert (=> b!499468 (= lt!226462 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499469 () Bool)

(declare-fun res!301426 () Bool)

(assert (=> b!499469 (=> res!301426 e!292680)))

(get-info :version)

(assert (=> b!499469 (= res!301426 (or (undefined!4784 lt!226464) (not ((_ is Intermediate!3972) lt!226464))))))

(declare-fun b!499470 () Bool)

(declare-fun res!301419 () Bool)

(assert (=> b!499470 (=> (not res!301419) (not e!292682))))

(assert (=> b!499470 (= res!301419 (and (= (size!15869 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15869 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15869 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499471 () Bool)

(declare-fun res!301418 () Bool)

(assert (=> b!499471 (=> (not res!301418) (not e!292685))))

(declare-datatypes ((List!9663 0))(
  ( (Nil!9660) (Cons!9659 (h!10533 (_ BitVec 64)) (t!15891 List!9663)) )
))
(declare-fun arrayNoDuplicates!0 (array!32247 (_ BitVec 32) List!9663) Bool)

(assert (=> b!499471 (= res!301418 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9660))))

(declare-fun b!499472 () Bool)

(declare-fun res!301430 () Bool)

(assert (=> b!499472 (=> (not res!301430) (not e!292682))))

(assert (=> b!499472 (= res!301430 (validKeyInArray!0 (select (arr!15505 a!3235) j!176)))))

(assert (= (and start!45422 res!301423) b!499470))

(assert (= (and b!499470 res!301419) b!499472))

(assert (= (and b!499472 res!301430) b!499461))

(assert (= (and b!499461 res!301422) b!499464))

(assert (= (and b!499464 res!301427) b!499467))

(assert (= (and b!499467 res!301421) b!499458))

(assert (= (and b!499458 res!301428) b!499471))

(assert (= (and b!499471 res!301418) b!499468))

(assert (= (and b!499468 res!301429) b!499463))

(assert (= (and b!499468 (not res!301424)) b!499469))

(assert (= (and b!499469 (not res!301426)) b!499466))

(assert (= (and b!499466 c!59297) b!499465))

(assert (= (and b!499466 (not c!59297)) b!499462))

(assert (= (and b!499465 res!301425) b!499459))

(assert (= (and b!499466 (not res!301420)) b!499460))

(declare-fun m!480657 () Bool)

(assert (=> b!499466 m!480657))

(declare-fun m!480659 () Bool)

(assert (=> b!499466 m!480659))

(declare-fun m!480661 () Bool)

(assert (=> b!499467 m!480661))

(declare-fun m!480663 () Bool)

(assert (=> b!499471 m!480663))

(declare-fun m!480665 () Bool)

(assert (=> b!499460 m!480665))

(declare-fun m!480667 () Bool)

(assert (=> b!499464 m!480667))

(declare-fun m!480669 () Bool)

(assert (=> b!499458 m!480669))

(assert (=> b!499463 m!480659))

(assert (=> b!499463 m!480659))

(declare-fun m!480671 () Bool)

(assert (=> b!499463 m!480671))

(assert (=> b!499472 m!480659))

(assert (=> b!499472 m!480659))

(declare-fun m!480673 () Bool)

(assert (=> b!499472 m!480673))

(declare-fun m!480675 () Bool)

(assert (=> start!45422 m!480675))

(declare-fun m!480677 () Bool)

(assert (=> start!45422 m!480677))

(declare-fun m!480679 () Bool)

(assert (=> b!499465 m!480679))

(assert (=> b!499465 m!480665))

(assert (=> b!499468 m!480659))

(declare-fun m!480681 () Bool)

(assert (=> b!499468 m!480681))

(declare-fun m!480683 () Bool)

(assert (=> b!499468 m!480683))

(declare-fun m!480685 () Bool)

(assert (=> b!499468 m!480685))

(declare-fun m!480687 () Bool)

(assert (=> b!499468 m!480687))

(assert (=> b!499468 m!480659))

(declare-fun m!480689 () Bool)

(assert (=> b!499468 m!480689))

(assert (=> b!499468 m!480659))

(declare-fun m!480691 () Bool)

(assert (=> b!499468 m!480691))

(declare-fun m!480693 () Bool)

(assert (=> b!499468 m!480693))

(declare-fun m!480695 () Bool)

(assert (=> b!499468 m!480695))

(declare-fun m!480697 () Bool)

(assert (=> b!499461 m!480697))

(check-sat (not b!499461) (not start!45422) (not b!499472) (not b!499468) (not b!499458) (not b!499467) (not b!499464) (not b!499471) (not b!499465) (not b!499463) (not b!499460))
(check-sat)
