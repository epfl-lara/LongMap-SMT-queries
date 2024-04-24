; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46694 () Bool)

(assert start!46694)

(declare-fun b!515418 () Bool)

(declare-fun res!315037 () Bool)

(declare-fun e!300927 () Bool)

(assert (=> b!515418 (=> (not res!315037) (not e!300927))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515418 (= res!315037 (validKeyInArray!0 k0!2280))))

(declare-fun b!515419 () Bool)

(declare-fun e!300929 () Bool)

(assert (=> b!515419 (= e!300927 e!300929)))

(declare-fun res!315046 () Bool)

(assert (=> b!515419 (=> (not res!315046) (not e!300929))))

(declare-datatypes ((SeekEntryResult!4294 0))(
  ( (MissingZero!4294 (index!19364 (_ BitVec 32))) (Found!4294 (index!19365 (_ BitVec 32))) (Intermediate!4294 (undefined!5106 Bool) (index!19366 (_ BitVec 32)) (x!48478 (_ BitVec 32))) (Undefined!4294) (MissingVacant!4294 (index!19367 (_ BitVec 32))) )
))
(declare-fun lt!235995 () SeekEntryResult!4294)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515419 (= res!315046 (or (= lt!235995 (MissingZero!4294 i!1204)) (= lt!235995 (MissingVacant!4294 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33007 0))(
  ( (array!33008 (arr!15871 (Array (_ BitVec 32) (_ BitVec 64))) (size!16235 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33007)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33007 (_ BitVec 32)) SeekEntryResult!4294)

(assert (=> b!515419 (= lt!235995 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515420 () Bool)

(declare-fun e!300926 () Bool)

(assert (=> b!515420 (= e!300929 (not e!300926))))

(declare-fun res!315045 () Bool)

(assert (=> b!515420 (=> res!315045 e!300926)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!235996 () (_ BitVec 32))

(declare-fun lt!235992 () SeekEntryResult!4294)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33007 (_ BitVec 32)) SeekEntryResult!4294)

(assert (=> b!515420 (= res!315045 (= lt!235992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235996 (select (store (arr!15871 a!3235) i!1204 k0!2280) j!176) (array!33008 (store (arr!15871 a!3235) i!1204 k0!2280) (size!16235 a!3235)) mask!3524)))))

(declare-fun lt!235993 () (_ BitVec 32))

(assert (=> b!515420 (= lt!235992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235993 (select (arr!15871 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515420 (= lt!235996 (toIndex!0 (select (store (arr!15871 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515420 (= lt!235993 (toIndex!0 (select (arr!15871 a!3235) j!176) mask!3524))))

(declare-fun e!300928 () Bool)

(assert (=> b!515420 e!300928))

(declare-fun res!315042 () Bool)

(assert (=> b!515420 (=> (not res!315042) (not e!300928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33007 (_ BitVec 32)) Bool)

(assert (=> b!515420 (= res!315042 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15907 0))(
  ( (Unit!15908) )
))
(declare-fun lt!235994 () Unit!15907)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15907)

(assert (=> b!515420 (= lt!235994 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515421 () Bool)

(assert (=> b!515421 (= e!300926 true)))

(assert (=> b!515421 (and (bvslt (x!48478 lt!235992) #b01111111111111111111111111111110) (or (= (select (arr!15871 a!3235) (index!19366 lt!235992)) (select (arr!15871 a!3235) j!176)) (= (select (arr!15871 a!3235) (index!19366 lt!235992)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15871 a!3235) (index!19366 lt!235992)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515422 () Bool)

(declare-fun res!315036 () Bool)

(assert (=> b!515422 (=> (not res!315036) (not e!300927))))

(declare-fun arrayContainsKey!0 (array!33007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515422 (= res!315036 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515423 () Bool)

(declare-fun res!315044 () Bool)

(assert (=> b!515423 (=> (not res!315044) (not e!300927))))

(assert (=> b!515423 (= res!315044 (validKeyInArray!0 (select (arr!15871 a!3235) j!176)))))

(declare-fun b!515424 () Bool)

(declare-fun res!315043 () Bool)

(assert (=> b!515424 (=> res!315043 e!300926)))

(get-info :version)

(assert (=> b!515424 (= res!315043 (or (undefined!5106 lt!235992) (not ((_ is Intermediate!4294) lt!235992))))))

(declare-fun b!515425 () Bool)

(assert (=> b!515425 (= e!300928 (= (seekEntryOrOpen!0 (select (arr!15871 a!3235) j!176) a!3235 mask!3524) (Found!4294 j!176)))))

(declare-fun b!515426 () Bool)

(declare-fun res!315040 () Bool)

(assert (=> b!515426 (=> (not res!315040) (not e!300929))))

(assert (=> b!515426 (= res!315040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!315039 () Bool)

(assert (=> start!46694 (=> (not res!315039) (not e!300927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46694 (= res!315039 (validMask!0 mask!3524))))

(assert (=> start!46694 e!300927))

(assert (=> start!46694 true))

(declare-fun array_inv!11730 (array!33007) Bool)

(assert (=> start!46694 (array_inv!11730 a!3235)))

(declare-fun b!515427 () Bool)

(declare-fun res!315038 () Bool)

(assert (=> b!515427 (=> (not res!315038) (not e!300929))))

(declare-datatypes ((List!9936 0))(
  ( (Nil!9933) (Cons!9932 (h!10830 (_ BitVec 64)) (t!16156 List!9936)) )
))
(declare-fun arrayNoDuplicates!0 (array!33007 (_ BitVec 32) List!9936) Bool)

(assert (=> b!515427 (= res!315038 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9933))))

(declare-fun b!515428 () Bool)

(declare-fun res!315041 () Bool)

(assert (=> b!515428 (=> (not res!315041) (not e!300927))))

(assert (=> b!515428 (= res!315041 (and (= (size!16235 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16235 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16235 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46694 res!315039) b!515428))

(assert (= (and b!515428 res!315041) b!515423))

(assert (= (and b!515423 res!315044) b!515418))

(assert (= (and b!515418 res!315037) b!515422))

(assert (= (and b!515422 res!315036) b!515419))

(assert (= (and b!515419 res!315046) b!515426))

(assert (= (and b!515426 res!315040) b!515427))

(assert (= (and b!515427 res!315038) b!515420))

(assert (= (and b!515420 res!315042) b!515425))

(assert (= (and b!515420 (not res!315045)) b!515424))

(assert (= (and b!515424 (not res!315043)) b!515421))

(declare-fun m!497005 () Bool)

(assert (=> start!46694 m!497005))

(declare-fun m!497007 () Bool)

(assert (=> start!46694 m!497007))

(declare-fun m!497009 () Bool)

(assert (=> b!515425 m!497009))

(assert (=> b!515425 m!497009))

(declare-fun m!497011 () Bool)

(assert (=> b!515425 m!497011))

(declare-fun m!497013 () Bool)

(assert (=> b!515426 m!497013))

(declare-fun m!497015 () Bool)

(assert (=> b!515418 m!497015))

(declare-fun m!497017 () Bool)

(assert (=> b!515427 m!497017))

(assert (=> b!515423 m!497009))

(assert (=> b!515423 m!497009))

(declare-fun m!497019 () Bool)

(assert (=> b!515423 m!497019))

(declare-fun m!497021 () Bool)

(assert (=> b!515420 m!497021))

(declare-fun m!497023 () Bool)

(assert (=> b!515420 m!497023))

(declare-fun m!497025 () Bool)

(assert (=> b!515420 m!497025))

(assert (=> b!515420 m!497009))

(declare-fun m!497027 () Bool)

(assert (=> b!515420 m!497027))

(assert (=> b!515420 m!497025))

(declare-fun m!497029 () Bool)

(assert (=> b!515420 m!497029))

(assert (=> b!515420 m!497009))

(declare-fun m!497031 () Bool)

(assert (=> b!515420 m!497031))

(assert (=> b!515420 m!497009))

(declare-fun m!497033 () Bool)

(assert (=> b!515420 m!497033))

(assert (=> b!515420 m!497025))

(declare-fun m!497035 () Bool)

(assert (=> b!515420 m!497035))

(declare-fun m!497037 () Bool)

(assert (=> b!515421 m!497037))

(assert (=> b!515421 m!497009))

(declare-fun m!497039 () Bool)

(assert (=> b!515422 m!497039))

(declare-fun m!497041 () Bool)

(assert (=> b!515419 m!497041))

(check-sat (not b!515422) (not b!515419) (not b!515420) (not b!515423) (not b!515427) (not start!46694) (not b!515418) (not b!515425) (not b!515426))
(check-sat)
