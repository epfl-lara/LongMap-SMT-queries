; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44756 () Bool)

(assert start!44756)

(declare-fun b!491381 () Bool)

(declare-fun e!288720 () Bool)

(assert (=> b!491381 (= e!288720 true)))

(declare-datatypes ((array!31816 0))(
  ( (array!31817 (arr!15295 (Array (_ BitVec 32) (_ BitVec 64))) (size!15659 (_ BitVec 32))) )
))
(declare-fun lt!222172 () array!31816)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!222168 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3718 0))(
  ( (MissingZero!3718 (index!17051 (_ BitVec 32))) (Found!3718 (index!17052 (_ BitVec 32))) (Intermediate!3718 (undefined!4530 Bool) (index!17053 (_ BitVec 32)) (x!46285 (_ BitVec 32))) (Undefined!3718) (MissingVacant!3718 (index!17054 (_ BitVec 32))) )
))
(declare-fun lt!222167 () SeekEntryResult!3718)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31816 (_ BitVec 32)) SeekEntryResult!3718)

(assert (=> b!491381 (= lt!222167 (seekEntryOrOpen!0 lt!222168 lt!222172 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31816)

(declare-datatypes ((Unit!14443 0))(
  ( (Unit!14444) )
))
(declare-fun lt!222171 () Unit!14443)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31816 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14443)

(assert (=> b!491381 (= lt!222171 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491382 () Bool)

(declare-fun res!294374 () Bool)

(declare-fun e!288718 () Bool)

(assert (=> b!491382 (=> (not res!294374) (not e!288718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491382 (= res!294374 (validKeyInArray!0 (select (arr!15295 a!3235) j!176)))))

(declare-fun res!294376 () Bool)

(assert (=> start!44756 (=> (not res!294376) (not e!288718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44756 (= res!294376 (validMask!0 mask!3524))))

(assert (=> start!44756 e!288718))

(assert (=> start!44756 true))

(declare-fun array_inv!11154 (array!31816) Bool)

(assert (=> start!44756 (array_inv!11154 a!3235)))

(declare-fun b!491383 () Bool)

(declare-fun res!294378 () Bool)

(declare-fun e!288717 () Bool)

(assert (=> b!491383 (=> (not res!294378) (not e!288717))))

(declare-datatypes ((List!9360 0))(
  ( (Nil!9357) (Cons!9356 (h!10218 (_ BitVec 64)) (t!15580 List!9360)) )
))
(declare-fun arrayNoDuplicates!0 (array!31816 (_ BitVec 32) List!9360) Bool)

(assert (=> b!491383 (= res!294378 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9357))))

(declare-fun b!491384 () Bool)

(assert (=> b!491384 (= e!288718 e!288717)))

(declare-fun res!294373 () Bool)

(assert (=> b!491384 (=> (not res!294373) (not e!288717))))

(declare-fun lt!222170 () SeekEntryResult!3718)

(assert (=> b!491384 (= res!294373 (or (= lt!222170 (MissingZero!3718 i!1204)) (= lt!222170 (MissingVacant!3718 i!1204))))))

(assert (=> b!491384 (= lt!222170 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491385 () Bool)

(declare-fun res!294371 () Bool)

(assert (=> b!491385 (=> (not res!294371) (not e!288718))))

(assert (=> b!491385 (= res!294371 (validKeyInArray!0 k0!2280))))

(declare-fun b!491386 () Bool)

(declare-fun res!294379 () Bool)

(assert (=> b!491386 (=> (not res!294379) (not e!288718))))

(declare-fun arrayContainsKey!0 (array!31816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491386 (= res!294379 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491387 () Bool)

(declare-fun res!294375 () Bool)

(assert (=> b!491387 (=> (not res!294375) (not e!288717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31816 (_ BitVec 32)) Bool)

(assert (=> b!491387 (= res!294375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491388 () Bool)

(declare-fun res!294377 () Bool)

(assert (=> b!491388 (=> (not res!294377) (not e!288718))))

(assert (=> b!491388 (= res!294377 (and (= (size!15659 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15659 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15659 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491389 () Bool)

(assert (=> b!491389 (= e!288717 (not e!288720))))

(declare-fun res!294372 () Bool)

(assert (=> b!491389 (=> res!294372 e!288720)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31816 (_ BitVec 32)) SeekEntryResult!3718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491389 (= res!294372 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15295 a!3235) j!176) mask!3524) (select (arr!15295 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222168 mask!3524) lt!222168 lt!222172 mask!3524))))))

(assert (=> b!491389 (= lt!222168 (select (store (arr!15295 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491389 (= lt!222172 (array!31817 (store (arr!15295 a!3235) i!1204 k0!2280) (size!15659 a!3235)))))

(assert (=> b!491389 (= lt!222167 (Found!3718 j!176))))

(assert (=> b!491389 (= lt!222167 (seekEntryOrOpen!0 (select (arr!15295 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491389 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222169 () Unit!14443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14443)

(assert (=> b!491389 (= lt!222169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44756 res!294376) b!491388))

(assert (= (and b!491388 res!294377) b!491382))

(assert (= (and b!491382 res!294374) b!491385))

(assert (= (and b!491385 res!294371) b!491386))

(assert (= (and b!491386 res!294379) b!491384))

(assert (= (and b!491384 res!294373) b!491387))

(assert (= (and b!491387 res!294375) b!491383))

(assert (= (and b!491383 res!294378) b!491389))

(assert (= (and b!491389 (not res!294372)) b!491381))

(declare-fun m!472207 () Bool)

(assert (=> b!491383 m!472207))

(declare-fun m!472209 () Bool)

(assert (=> b!491389 m!472209))

(declare-fun m!472211 () Bool)

(assert (=> b!491389 m!472211))

(declare-fun m!472213 () Bool)

(assert (=> b!491389 m!472213))

(declare-fun m!472215 () Bool)

(assert (=> b!491389 m!472215))

(assert (=> b!491389 m!472209))

(declare-fun m!472217 () Bool)

(assert (=> b!491389 m!472217))

(declare-fun m!472219 () Bool)

(assert (=> b!491389 m!472219))

(declare-fun m!472221 () Bool)

(assert (=> b!491389 m!472221))

(declare-fun m!472223 () Bool)

(assert (=> b!491389 m!472223))

(assert (=> b!491389 m!472221))

(assert (=> b!491389 m!472219))

(assert (=> b!491389 m!472221))

(declare-fun m!472225 () Bool)

(assert (=> b!491389 m!472225))

(assert (=> b!491389 m!472221))

(declare-fun m!472227 () Bool)

(assert (=> b!491389 m!472227))

(declare-fun m!472229 () Bool)

(assert (=> b!491381 m!472229))

(declare-fun m!472231 () Bool)

(assert (=> b!491381 m!472231))

(declare-fun m!472233 () Bool)

(assert (=> start!44756 m!472233))

(declare-fun m!472235 () Bool)

(assert (=> start!44756 m!472235))

(declare-fun m!472237 () Bool)

(assert (=> b!491386 m!472237))

(declare-fun m!472239 () Bool)

(assert (=> b!491385 m!472239))

(assert (=> b!491382 m!472221))

(assert (=> b!491382 m!472221))

(declare-fun m!472241 () Bool)

(assert (=> b!491382 m!472241))

(declare-fun m!472243 () Bool)

(assert (=> b!491384 m!472243))

(declare-fun m!472245 () Bool)

(assert (=> b!491387 m!472245))

(check-sat (not b!491387) (not start!44756) (not b!491384) (not b!491382) (not b!491383) (not b!491386) (not b!491381) (not b!491389) (not b!491385))
(check-sat)
