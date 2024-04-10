; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44762 () Bool)

(assert start!44762)

(declare-fun b!491388 () Bool)

(declare-fun res!294332 () Bool)

(declare-fun e!288735 () Bool)

(assert (=> b!491388 (=> (not res!294332) (not e!288735))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491388 (= res!294332 (validKeyInArray!0 k0!2280))))

(declare-fun b!491389 () Bool)

(declare-fun res!294327 () Bool)

(assert (=> b!491389 (=> (not res!294327) (not e!288735))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31821 0))(
  ( (array!31822 (arr!15298 (Array (_ BitVec 32) (_ BitVec 64))) (size!15662 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31821)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491389 (= res!294327 (and (= (size!15662 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15662 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15662 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491390 () Bool)

(declare-fun res!294329 () Bool)

(assert (=> b!491390 (=> (not res!294329) (not e!288735))))

(declare-fun arrayContainsKey!0 (array!31821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491390 (= res!294329 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491391 () Bool)

(declare-fun e!288734 () Bool)

(assert (=> b!491391 (= e!288735 e!288734)))

(declare-fun res!294331 () Bool)

(assert (=> b!491391 (=> (not res!294331) (not e!288734))))

(declare-datatypes ((SeekEntryResult!3765 0))(
  ( (MissingZero!3765 (index!17239 (_ BitVec 32))) (Found!3765 (index!17240 (_ BitVec 32))) (Intermediate!3765 (undefined!4577 Bool) (index!17241 (_ BitVec 32)) (x!46327 (_ BitVec 32))) (Undefined!3765) (MissingVacant!3765 (index!17242 (_ BitVec 32))) )
))
(declare-fun lt!222123 () SeekEntryResult!3765)

(assert (=> b!491391 (= res!294331 (or (= lt!222123 (MissingZero!3765 i!1204)) (= lt!222123 (MissingVacant!3765 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31821 (_ BitVec 32)) SeekEntryResult!3765)

(assert (=> b!491391 (= lt!222123 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491392 () Bool)

(declare-fun e!288733 () Bool)

(assert (=> b!491392 (= e!288733 true)))

(declare-fun lt!222121 () array!31821)

(declare-fun lt!222120 () (_ BitVec 64))

(declare-fun lt!222124 () SeekEntryResult!3765)

(assert (=> b!491392 (= lt!222124 (seekEntryOrOpen!0 lt!222120 lt!222121 mask!3524))))

(declare-datatypes ((Unit!14476 0))(
  ( (Unit!14477) )
))
(declare-fun lt!222119 () Unit!14476)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31821 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14476)

(assert (=> b!491392 (= lt!222119 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!294328 () Bool)

(assert (=> start!44762 (=> (not res!294328) (not e!288735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44762 (= res!294328 (validMask!0 mask!3524))))

(assert (=> start!44762 e!288735))

(assert (=> start!44762 true))

(declare-fun array_inv!11094 (array!31821) Bool)

(assert (=> start!44762 (array_inv!11094 a!3235)))

(declare-fun b!491393 () Bool)

(declare-fun res!294324 () Bool)

(assert (=> b!491393 (=> (not res!294324) (not e!288734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31821 (_ BitVec 32)) Bool)

(assert (=> b!491393 (= res!294324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491394 () Bool)

(assert (=> b!491394 (= e!288734 (not e!288733))))

(declare-fun res!294325 () Bool)

(assert (=> b!491394 (=> res!294325 e!288733)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31821 (_ BitVec 32)) SeekEntryResult!3765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491394 (= res!294325 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15298 a!3235) j!176) mask!3524) (select (arr!15298 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222120 mask!3524) lt!222120 lt!222121 mask!3524))))))

(assert (=> b!491394 (= lt!222120 (select (store (arr!15298 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491394 (= lt!222121 (array!31822 (store (arr!15298 a!3235) i!1204 k0!2280) (size!15662 a!3235)))))

(assert (=> b!491394 (= lt!222124 (Found!3765 j!176))))

(assert (=> b!491394 (= lt!222124 (seekEntryOrOpen!0 (select (arr!15298 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491394 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222122 () Unit!14476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14476)

(assert (=> b!491394 (= lt!222122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491395 () Bool)

(declare-fun res!294330 () Bool)

(assert (=> b!491395 (=> (not res!294330) (not e!288734))))

(declare-datatypes ((List!9456 0))(
  ( (Nil!9453) (Cons!9452 (h!10314 (_ BitVec 64)) (t!15684 List!9456)) )
))
(declare-fun arrayNoDuplicates!0 (array!31821 (_ BitVec 32) List!9456) Bool)

(assert (=> b!491395 (= res!294330 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9453))))

(declare-fun b!491396 () Bool)

(declare-fun res!294326 () Bool)

(assert (=> b!491396 (=> (not res!294326) (not e!288735))))

(assert (=> b!491396 (= res!294326 (validKeyInArray!0 (select (arr!15298 a!3235) j!176)))))

(assert (= (and start!44762 res!294328) b!491389))

(assert (= (and b!491389 res!294327) b!491396))

(assert (= (and b!491396 res!294326) b!491388))

(assert (= (and b!491388 res!294332) b!491390))

(assert (= (and b!491390 res!294329) b!491391))

(assert (= (and b!491391 res!294331) b!491393))

(assert (= (and b!491393 res!294324) b!491395))

(assert (= (and b!491395 res!294330) b!491394))

(assert (= (and b!491394 (not res!294325)) b!491392))

(declare-fun m!471943 () Bool)

(assert (=> b!491392 m!471943))

(declare-fun m!471945 () Bool)

(assert (=> b!491392 m!471945))

(declare-fun m!471947 () Bool)

(assert (=> b!491394 m!471947))

(declare-fun m!471949 () Bool)

(assert (=> b!491394 m!471949))

(declare-fun m!471951 () Bool)

(assert (=> b!491394 m!471951))

(declare-fun m!471953 () Bool)

(assert (=> b!491394 m!471953))

(declare-fun m!471955 () Bool)

(assert (=> b!491394 m!471955))

(declare-fun m!471957 () Bool)

(assert (=> b!491394 m!471957))

(assert (=> b!491394 m!471955))

(assert (=> b!491394 m!471953))

(assert (=> b!491394 m!471955))

(declare-fun m!471959 () Bool)

(assert (=> b!491394 m!471959))

(declare-fun m!471961 () Bool)

(assert (=> b!491394 m!471961))

(declare-fun m!471963 () Bool)

(assert (=> b!491394 m!471963))

(assert (=> b!491394 m!471959))

(assert (=> b!491394 m!471955))

(declare-fun m!471965 () Bool)

(assert (=> b!491394 m!471965))

(assert (=> b!491396 m!471955))

(assert (=> b!491396 m!471955))

(declare-fun m!471967 () Bool)

(assert (=> b!491396 m!471967))

(declare-fun m!471969 () Bool)

(assert (=> b!491393 m!471969))

(declare-fun m!471971 () Bool)

(assert (=> b!491388 m!471971))

(declare-fun m!471973 () Bool)

(assert (=> b!491395 m!471973))

(declare-fun m!471975 () Bool)

(assert (=> start!44762 m!471975))

(declare-fun m!471977 () Bool)

(assert (=> start!44762 m!471977))

(declare-fun m!471979 () Bool)

(assert (=> b!491390 m!471979))

(declare-fun m!471981 () Bool)

(assert (=> b!491391 m!471981))

(check-sat (not b!491391) (not start!44762) (not b!491394) (not b!491392) (not b!491388) (not b!491393) (not b!491395) (not b!491390) (not b!491396))
(check-sat)
