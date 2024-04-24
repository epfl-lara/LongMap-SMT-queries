; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45188 () Bool)

(assert start!45188)

(declare-fun b!496029 () Bool)

(declare-fun res!298478 () Bool)

(declare-fun e!290927 () Bool)

(assert (=> b!496029 (=> (not res!298478) (not e!290927))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32077 0))(
  ( (array!32078 (arr!15421 (Array (_ BitVec 32) (_ BitVec 64))) (size!15785 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32077)

(assert (=> b!496029 (= res!298478 (and (= (size!15785 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15785 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15785 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!298471 () Bool)

(assert (=> start!45188 (=> (not res!298471) (not e!290927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45188 (= res!298471 (validMask!0 mask!3524))))

(assert (=> start!45188 e!290927))

(assert (=> start!45188 true))

(declare-fun array_inv!11280 (array!32077) Bool)

(assert (=> start!45188 (array_inv!11280 a!3235)))

(declare-fun b!496030 () Bool)

(declare-fun res!298480 () Bool)

(declare-fun e!290924 () Bool)

(assert (=> b!496030 (=> (not res!298480) (not e!290924))))

(declare-datatypes ((List!9486 0))(
  ( (Nil!9483) (Cons!9482 (h!10353 (_ BitVec 64)) (t!15706 List!9486)) )
))
(declare-fun arrayNoDuplicates!0 (array!32077 (_ BitVec 32) List!9486) Bool)

(assert (=> b!496030 (= res!298480 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9483))))

(declare-fun b!496031 () Bool)

(declare-fun e!290925 () Bool)

(assert (=> b!496031 (= e!290924 (not e!290925))))

(declare-fun res!298475 () Bool)

(assert (=> b!496031 (=> res!298475 e!290925)))

(declare-fun lt!224596 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3844 0))(
  ( (MissingZero!3844 (index!17555 (_ BitVec 32))) (Found!3844 (index!17556 (_ BitVec 32))) (Intermediate!3844 (undefined!4656 Bool) (index!17557 (_ BitVec 32)) (x!46765 (_ BitVec 32))) (Undefined!3844) (MissingVacant!3844 (index!17558 (_ BitVec 32))) )
))
(declare-fun lt!224598 () SeekEntryResult!3844)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32077 (_ BitVec 32)) SeekEntryResult!3844)

(assert (=> b!496031 (= res!298475 (= lt!224598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224596 (select (store (arr!15421 a!3235) i!1204 k0!2280) j!176) (array!32078 (store (arr!15421 a!3235) i!1204 k0!2280) (size!15785 a!3235)) mask!3524)))))

(declare-fun lt!224599 () (_ BitVec 32))

(assert (=> b!496031 (= lt!224598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224599 (select (arr!15421 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496031 (= lt!224596 (toIndex!0 (select (store (arr!15421 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496031 (= lt!224599 (toIndex!0 (select (arr!15421 a!3235) j!176) mask!3524))))

(declare-fun e!290926 () Bool)

(assert (=> b!496031 e!290926))

(declare-fun res!298472 () Bool)

(assert (=> b!496031 (=> (not res!298472) (not e!290926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32077 (_ BitVec 32)) Bool)

(assert (=> b!496031 (= res!298472 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14695 0))(
  ( (Unit!14696) )
))
(declare-fun lt!224595 () Unit!14695)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14695)

(assert (=> b!496031 (= lt!224595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496032 () Bool)

(declare-fun res!298470 () Bool)

(assert (=> b!496032 (=> res!298470 e!290925)))

(get-info :version)

(assert (=> b!496032 (= res!298470 (or (undefined!4656 lt!224598) (not ((_ is Intermediate!3844) lt!224598))))))

(declare-fun b!496033 () Bool)

(declare-fun res!298473 () Bool)

(assert (=> b!496033 (=> (not res!298473) (not e!290927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496033 (= res!298473 (validKeyInArray!0 k0!2280))))

(declare-fun b!496034 () Bool)

(assert (=> b!496034 (= e!290925 true)))

(assert (=> b!496034 (and (bvslt (x!46765 lt!224598) #b01111111111111111111111111111110) (or (= (select (arr!15421 a!3235) (index!17557 lt!224598)) (select (arr!15421 a!3235) j!176)) (= (select (arr!15421 a!3235) (index!17557 lt!224598)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15421 a!3235) (index!17557 lt!224598)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496035 () Bool)

(assert (=> b!496035 (= e!290927 e!290924)))

(declare-fun res!298477 () Bool)

(assert (=> b!496035 (=> (not res!298477) (not e!290924))))

(declare-fun lt!224597 () SeekEntryResult!3844)

(assert (=> b!496035 (= res!298477 (or (= lt!224597 (MissingZero!3844 i!1204)) (= lt!224597 (MissingVacant!3844 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32077 (_ BitVec 32)) SeekEntryResult!3844)

(assert (=> b!496035 (= lt!224597 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496036 () Bool)

(declare-fun res!298479 () Bool)

(assert (=> b!496036 (=> (not res!298479) (not e!290927))))

(declare-fun arrayContainsKey!0 (array!32077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496036 (= res!298479 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496037 () Bool)

(assert (=> b!496037 (= e!290926 (= (seekEntryOrOpen!0 (select (arr!15421 a!3235) j!176) a!3235 mask!3524) (Found!3844 j!176)))))

(declare-fun b!496038 () Bool)

(declare-fun res!298476 () Bool)

(assert (=> b!496038 (=> (not res!298476) (not e!290927))))

(assert (=> b!496038 (= res!298476 (validKeyInArray!0 (select (arr!15421 a!3235) j!176)))))

(declare-fun b!496039 () Bool)

(declare-fun res!298474 () Bool)

(assert (=> b!496039 (=> (not res!298474) (not e!290924))))

(assert (=> b!496039 (= res!298474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45188 res!298471) b!496029))

(assert (= (and b!496029 res!298478) b!496038))

(assert (= (and b!496038 res!298476) b!496033))

(assert (= (and b!496033 res!298473) b!496036))

(assert (= (and b!496036 res!298479) b!496035))

(assert (= (and b!496035 res!298477) b!496039))

(assert (= (and b!496039 res!298474) b!496030))

(assert (= (and b!496030 res!298480) b!496031))

(assert (= (and b!496031 res!298472) b!496037))

(assert (= (and b!496031 (not res!298475)) b!496032))

(assert (= (and b!496032 (not res!298470)) b!496034))

(declare-fun m!477457 () Bool)

(assert (=> b!496039 m!477457))

(declare-fun m!477459 () Bool)

(assert (=> b!496036 m!477459))

(declare-fun m!477461 () Bool)

(assert (=> b!496037 m!477461))

(assert (=> b!496037 m!477461))

(declare-fun m!477463 () Bool)

(assert (=> b!496037 m!477463))

(declare-fun m!477465 () Bool)

(assert (=> b!496034 m!477465))

(assert (=> b!496034 m!477461))

(declare-fun m!477467 () Bool)

(assert (=> b!496035 m!477467))

(declare-fun m!477469 () Bool)

(assert (=> b!496030 m!477469))

(declare-fun m!477471 () Bool)

(assert (=> start!45188 m!477471))

(declare-fun m!477473 () Bool)

(assert (=> start!45188 m!477473))

(assert (=> b!496038 m!477461))

(assert (=> b!496038 m!477461))

(declare-fun m!477475 () Bool)

(assert (=> b!496038 m!477475))

(declare-fun m!477477 () Bool)

(assert (=> b!496033 m!477477))

(assert (=> b!496031 m!477461))

(declare-fun m!477479 () Bool)

(assert (=> b!496031 m!477479))

(declare-fun m!477481 () Bool)

(assert (=> b!496031 m!477481))

(declare-fun m!477483 () Bool)

(assert (=> b!496031 m!477483))

(declare-fun m!477485 () Bool)

(assert (=> b!496031 m!477485))

(assert (=> b!496031 m!477461))

(declare-fun m!477487 () Bool)

(assert (=> b!496031 m!477487))

(assert (=> b!496031 m!477485))

(declare-fun m!477489 () Bool)

(assert (=> b!496031 m!477489))

(assert (=> b!496031 m!477461))

(declare-fun m!477491 () Bool)

(assert (=> b!496031 m!477491))

(assert (=> b!496031 m!477485))

(declare-fun m!477493 () Bool)

(assert (=> b!496031 m!477493))

(check-sat (not b!496037) (not b!496030) (not b!496033) (not b!496035) (not b!496031) (not b!496036) (not b!496039) (not b!496038) (not start!45188))
(check-sat)
