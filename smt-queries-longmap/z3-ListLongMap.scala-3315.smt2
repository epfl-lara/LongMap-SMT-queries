; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45824 () Bool)

(assert start!45824)

(declare-fun b!507483 () Bool)

(declare-fun e!296984 () Bool)

(assert (=> b!507483 (= e!296984 true)))

(declare-datatypes ((SeekEntryResult!4093 0))(
  ( (MissingZero!4093 (index!18560 (_ BitVec 32))) (Found!4093 (index!18561 (_ BitVec 32))) (Intermediate!4093 (undefined!4905 Bool) (index!18562 (_ BitVec 32)) (x!47699 (_ BitVec 32))) (Undefined!4093) (MissingVacant!4093 (index!18563 (_ BitVec 32))) )
))
(declare-fun lt!231828 () SeekEntryResult!4093)

(declare-datatypes ((array!32581 0))(
  ( (array!32582 (arr!15670 (Array (_ BitVec 32) (_ BitVec 64))) (size!16034 (_ BitVec 32))) )
))
(declare-fun lt!231825 () array!32581)

(declare-fun lt!231821 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32581 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!507483 (= lt!231828 (seekEntryOrOpen!0 lt!231821 lt!231825 mask!3524))))

(assert (=> b!507483 false))

(declare-fun b!507484 () Bool)

(declare-fun res!308497 () Bool)

(declare-fun e!296981 () Bool)

(assert (=> b!507484 (=> (not res!308497) (not e!296981))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507484 (= res!308497 (validKeyInArray!0 k0!2280))))

(declare-fun b!507485 () Bool)

(declare-fun e!296980 () Bool)

(assert (=> b!507485 (= e!296981 e!296980)))

(declare-fun res!308498 () Bool)

(assert (=> b!507485 (=> (not res!308498) (not e!296980))))

(declare-fun lt!231824 () SeekEntryResult!4093)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507485 (= res!308498 (or (= lt!231824 (MissingZero!4093 i!1204)) (= lt!231824 (MissingVacant!4093 i!1204))))))

(declare-fun a!3235 () array!32581)

(assert (=> b!507485 (= lt!231824 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507486 () Bool)

(declare-fun res!308501 () Bool)

(assert (=> b!507486 (=> (not res!308501) (not e!296980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32581 (_ BitVec 32)) Bool)

(assert (=> b!507486 (= res!308501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507487 () Bool)

(declare-fun e!296985 () Bool)

(assert (=> b!507487 (= e!296985 e!296984)))

(declare-fun res!308496 () Bool)

(assert (=> b!507487 (=> res!308496 e!296984)))

(declare-fun lt!231829 () Bool)

(declare-fun lt!231822 () SeekEntryResult!4093)

(assert (=> b!507487 (= res!308496 (or (and (not lt!231829) (undefined!4905 lt!231822)) (and (not lt!231829) (not (undefined!4905 lt!231822)))))))

(get-info :version)

(assert (=> b!507487 (= lt!231829 (not ((_ is Intermediate!4093) lt!231822)))))

(declare-fun res!308506 () Bool)

(assert (=> start!45824 (=> (not res!308506) (not e!296981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45824 (= res!308506 (validMask!0 mask!3524))))

(assert (=> start!45824 e!296981))

(assert (=> start!45824 true))

(declare-fun array_inv!11529 (array!32581) Bool)

(assert (=> start!45824 (array_inv!11529 a!3235)))

(declare-fun b!507488 () Bool)

(declare-fun res!308503 () Bool)

(assert (=> b!507488 (=> (not res!308503) (not e!296981))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507488 (= res!308503 (and (= (size!16034 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16034 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16034 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507489 () Bool)

(declare-fun e!296982 () Bool)

(assert (=> b!507489 (= e!296982 (= (seekEntryOrOpen!0 (select (arr!15670 a!3235) j!176) a!3235 mask!3524) (Found!4093 j!176)))))

(declare-fun b!507490 () Bool)

(declare-fun res!308499 () Bool)

(assert (=> b!507490 (=> (not res!308499) (not e!296981))))

(declare-fun arrayContainsKey!0 (array!32581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507490 (= res!308499 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507491 () Bool)

(declare-fun res!308505 () Bool)

(assert (=> b!507491 (=> (not res!308505) (not e!296981))))

(assert (=> b!507491 (= res!308505 (validKeyInArray!0 (select (arr!15670 a!3235) j!176)))))

(declare-fun b!507492 () Bool)

(declare-fun res!308504 () Bool)

(assert (=> b!507492 (=> (not res!308504) (not e!296980))))

(declare-datatypes ((List!9735 0))(
  ( (Nil!9732) (Cons!9731 (h!10608 (_ BitVec 64)) (t!15955 List!9735)) )
))
(declare-fun arrayNoDuplicates!0 (array!32581 (_ BitVec 32) List!9735) Bool)

(assert (=> b!507492 (= res!308504 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9732))))

(declare-fun b!507493 () Bool)

(assert (=> b!507493 (= e!296980 (not e!296985))))

(declare-fun res!308500 () Bool)

(assert (=> b!507493 (=> res!308500 e!296985)))

(declare-fun lt!231823 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32581 (_ BitVec 32)) SeekEntryResult!4093)

(assert (=> b!507493 (= res!308500 (= lt!231822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231823 lt!231821 lt!231825 mask!3524)))))

(declare-fun lt!231827 () (_ BitVec 32))

(assert (=> b!507493 (= lt!231822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231827 (select (arr!15670 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507493 (= lt!231823 (toIndex!0 lt!231821 mask!3524))))

(assert (=> b!507493 (= lt!231821 (select (store (arr!15670 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507493 (= lt!231827 (toIndex!0 (select (arr!15670 a!3235) j!176) mask!3524))))

(assert (=> b!507493 (= lt!231825 (array!32582 (store (arr!15670 a!3235) i!1204 k0!2280) (size!16034 a!3235)))))

(assert (=> b!507493 e!296982))

(declare-fun res!308502 () Bool)

(assert (=> b!507493 (=> (not res!308502) (not e!296982))))

(assert (=> b!507493 (= res!308502 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15535 0))(
  ( (Unit!15536) )
))
(declare-fun lt!231826 () Unit!15535)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15535)

(assert (=> b!507493 (= lt!231826 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45824 res!308506) b!507488))

(assert (= (and b!507488 res!308503) b!507491))

(assert (= (and b!507491 res!308505) b!507484))

(assert (= (and b!507484 res!308497) b!507490))

(assert (= (and b!507490 res!308499) b!507485))

(assert (= (and b!507485 res!308498) b!507486))

(assert (= (and b!507486 res!308501) b!507492))

(assert (= (and b!507492 res!308504) b!507493))

(assert (= (and b!507493 res!308502) b!507489))

(assert (= (and b!507493 (not res!308500)) b!507487))

(assert (= (and b!507487 (not res!308496)) b!507483))

(declare-fun m!488515 () Bool)

(assert (=> b!507486 m!488515))

(declare-fun m!488517 () Bool)

(assert (=> b!507484 m!488517))

(declare-fun m!488519 () Bool)

(assert (=> start!45824 m!488519))

(declare-fun m!488521 () Bool)

(assert (=> start!45824 m!488521))

(declare-fun m!488523 () Bool)

(assert (=> b!507493 m!488523))

(declare-fun m!488525 () Bool)

(assert (=> b!507493 m!488525))

(declare-fun m!488527 () Bool)

(assert (=> b!507493 m!488527))

(declare-fun m!488529 () Bool)

(assert (=> b!507493 m!488529))

(declare-fun m!488531 () Bool)

(assert (=> b!507493 m!488531))

(declare-fun m!488533 () Bool)

(assert (=> b!507493 m!488533))

(declare-fun m!488535 () Bool)

(assert (=> b!507493 m!488535))

(assert (=> b!507493 m!488531))

(declare-fun m!488537 () Bool)

(assert (=> b!507493 m!488537))

(assert (=> b!507493 m!488531))

(declare-fun m!488539 () Bool)

(assert (=> b!507493 m!488539))

(declare-fun m!488541 () Bool)

(assert (=> b!507490 m!488541))

(assert (=> b!507489 m!488531))

(assert (=> b!507489 m!488531))

(declare-fun m!488543 () Bool)

(assert (=> b!507489 m!488543))

(declare-fun m!488545 () Bool)

(assert (=> b!507483 m!488545))

(declare-fun m!488547 () Bool)

(assert (=> b!507492 m!488547))

(declare-fun m!488549 () Bool)

(assert (=> b!507485 m!488549))

(assert (=> b!507491 m!488531))

(assert (=> b!507491 m!488531))

(declare-fun m!488551 () Bool)

(assert (=> b!507491 m!488551))

(check-sat (not b!507491) (not start!45824) (not b!507493) (not b!507486) (not b!507492) (not b!507485) (not b!507483) (not b!507489) (not b!507484) (not b!507490))
(check-sat)
