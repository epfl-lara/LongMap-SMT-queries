; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45242 () Bool)

(assert start!45242)

(declare-fun b!496920 () Bool)

(declare-fun e!291330 () Bool)

(declare-fun e!291331 () Bool)

(assert (=> b!496920 (= e!291330 (not e!291331))))

(declare-fun res!299370 () Bool)

(assert (=> b!496920 (=> res!299370 e!291331)))

(declare-datatypes ((SeekEntryResult!3871 0))(
  ( (MissingZero!3871 (index!17663 (_ BitVec 32))) (Found!3871 (index!17664 (_ BitVec 32))) (Intermediate!3871 (undefined!4683 Bool) (index!17665 (_ BitVec 32)) (x!46864 (_ BitVec 32))) (Undefined!3871) (MissingVacant!3871 (index!17666 (_ BitVec 32))) )
))
(declare-fun lt!225000 () SeekEntryResult!3871)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32131 0))(
  ( (array!32132 (arr!15448 (Array (_ BitVec 32) (_ BitVec 64))) (size!15812 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32131)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!225003 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32131 (_ BitVec 32)) SeekEntryResult!3871)

(assert (=> b!496920 (= res!299370 (= lt!225000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225003 (select (store (arr!15448 a!3235) i!1204 k0!2280) j!176) (array!32132 (store (arr!15448 a!3235) i!1204 k0!2280) (size!15812 a!3235)) mask!3524)))))

(declare-fun lt!225004 () (_ BitVec 32))

(assert (=> b!496920 (= lt!225000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225004 (select (arr!15448 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496920 (= lt!225003 (toIndex!0 (select (store (arr!15448 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496920 (= lt!225004 (toIndex!0 (select (arr!15448 a!3235) j!176) mask!3524))))

(declare-fun e!291332 () Bool)

(assert (=> b!496920 e!291332))

(declare-fun res!299364 () Bool)

(assert (=> b!496920 (=> (not res!299364) (not e!291332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32131 (_ BitVec 32)) Bool)

(assert (=> b!496920 (= res!299364 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14749 0))(
  ( (Unit!14750) )
))
(declare-fun lt!225001 () Unit!14749)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14749)

(assert (=> b!496920 (= lt!225001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496921 () Bool)

(declare-fun res!299366 () Bool)

(declare-fun e!291329 () Bool)

(assert (=> b!496921 (=> (not res!299366) (not e!291329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496921 (= res!299366 (validKeyInArray!0 k0!2280))))

(declare-fun b!496922 () Bool)

(assert (=> b!496922 (= e!291331 true)))

(assert (=> b!496922 (and (bvslt (x!46864 lt!225000) #b01111111111111111111111111111110) (or (= (select (arr!15448 a!3235) (index!17665 lt!225000)) (select (arr!15448 a!3235) j!176)) (= (select (arr!15448 a!3235) (index!17665 lt!225000)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15448 a!3235) (index!17665 lt!225000)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496923 () Bool)

(declare-fun res!299362 () Bool)

(assert (=> b!496923 (=> (not res!299362) (not e!291330))))

(assert (=> b!496923 (= res!299362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496924 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32131 (_ BitVec 32)) SeekEntryResult!3871)

(assert (=> b!496924 (= e!291332 (= (seekEntryOrOpen!0 (select (arr!15448 a!3235) j!176) a!3235 mask!3524) (Found!3871 j!176)))))

(declare-fun b!496925 () Bool)

(declare-fun res!299361 () Bool)

(assert (=> b!496925 (=> (not res!299361) (not e!291329))))

(assert (=> b!496925 (= res!299361 (and (= (size!15812 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15812 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15812 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496926 () Bool)

(assert (=> b!496926 (= e!291329 e!291330)))

(declare-fun res!299369 () Bool)

(assert (=> b!496926 (=> (not res!299369) (not e!291330))))

(declare-fun lt!225002 () SeekEntryResult!3871)

(assert (=> b!496926 (= res!299369 (or (= lt!225002 (MissingZero!3871 i!1204)) (= lt!225002 (MissingVacant!3871 i!1204))))))

(assert (=> b!496926 (= lt!225002 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!299371 () Bool)

(assert (=> start!45242 (=> (not res!299371) (not e!291329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45242 (= res!299371 (validMask!0 mask!3524))))

(assert (=> start!45242 e!291329))

(assert (=> start!45242 true))

(declare-fun array_inv!11307 (array!32131) Bool)

(assert (=> start!45242 (array_inv!11307 a!3235)))

(declare-fun b!496927 () Bool)

(declare-fun res!299367 () Bool)

(assert (=> b!496927 (=> (not res!299367) (not e!291330))))

(declare-datatypes ((List!9513 0))(
  ( (Nil!9510) (Cons!9509 (h!10380 (_ BitVec 64)) (t!15733 List!9513)) )
))
(declare-fun arrayNoDuplicates!0 (array!32131 (_ BitVec 32) List!9513) Bool)

(assert (=> b!496927 (= res!299367 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9510))))

(declare-fun b!496928 () Bool)

(declare-fun res!299368 () Bool)

(assert (=> b!496928 (=> (not res!299368) (not e!291329))))

(declare-fun arrayContainsKey!0 (array!32131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496928 (= res!299368 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496929 () Bool)

(declare-fun res!299363 () Bool)

(assert (=> b!496929 (=> res!299363 e!291331)))

(get-info :version)

(assert (=> b!496929 (= res!299363 (or (undefined!4683 lt!225000) (not ((_ is Intermediate!3871) lt!225000))))))

(declare-fun b!496930 () Bool)

(declare-fun res!299365 () Bool)

(assert (=> b!496930 (=> (not res!299365) (not e!291329))))

(assert (=> b!496930 (= res!299365 (validKeyInArray!0 (select (arr!15448 a!3235) j!176)))))

(assert (= (and start!45242 res!299371) b!496925))

(assert (= (and b!496925 res!299361) b!496930))

(assert (= (and b!496930 res!299365) b!496921))

(assert (= (and b!496921 res!299366) b!496928))

(assert (= (and b!496928 res!299368) b!496926))

(assert (= (and b!496926 res!299369) b!496923))

(assert (= (and b!496923 res!299362) b!496927))

(assert (= (and b!496927 res!299367) b!496920))

(assert (= (and b!496920 res!299364) b!496924))

(assert (= (and b!496920 (not res!299370)) b!496929))

(assert (= (and b!496929 (not res!299363)) b!496922))

(declare-fun m!478483 () Bool)

(assert (=> b!496926 m!478483))

(declare-fun m!478485 () Bool)

(assert (=> b!496928 m!478485))

(declare-fun m!478487 () Bool)

(assert (=> start!45242 m!478487))

(declare-fun m!478489 () Bool)

(assert (=> start!45242 m!478489))

(declare-fun m!478491 () Bool)

(assert (=> b!496921 m!478491))

(declare-fun m!478493 () Bool)

(assert (=> b!496922 m!478493))

(declare-fun m!478495 () Bool)

(assert (=> b!496922 m!478495))

(declare-fun m!478497 () Bool)

(assert (=> b!496923 m!478497))

(declare-fun m!478499 () Bool)

(assert (=> b!496927 m!478499))

(assert (=> b!496930 m!478495))

(assert (=> b!496930 m!478495))

(declare-fun m!478501 () Bool)

(assert (=> b!496930 m!478501))

(assert (=> b!496920 m!478495))

(declare-fun m!478503 () Bool)

(assert (=> b!496920 m!478503))

(declare-fun m!478505 () Bool)

(assert (=> b!496920 m!478505))

(declare-fun m!478507 () Bool)

(assert (=> b!496920 m!478507))

(assert (=> b!496920 m!478495))

(declare-fun m!478509 () Bool)

(assert (=> b!496920 m!478509))

(assert (=> b!496920 m!478495))

(declare-fun m!478511 () Bool)

(assert (=> b!496920 m!478511))

(assert (=> b!496920 m!478507))

(declare-fun m!478513 () Bool)

(assert (=> b!496920 m!478513))

(assert (=> b!496920 m!478507))

(declare-fun m!478515 () Bool)

(assert (=> b!496920 m!478515))

(declare-fun m!478517 () Bool)

(assert (=> b!496920 m!478517))

(assert (=> b!496924 m!478495))

(assert (=> b!496924 m!478495))

(declare-fun m!478519 () Bool)

(assert (=> b!496924 m!478519))

(check-sat (not b!496927) (not b!496923) (not start!45242) (not b!496930) (not b!496924) (not b!496920) (not b!496926) (not b!496928) (not b!496921))
(check-sat)
