; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32712 () Bool)

(assert start!32712)

(declare-fun b!326981 () Bool)

(declare-fun res!180012 () Bool)

(declare-fun e!201189 () Bool)

(assert (=> b!326981 (=> (not res!180012) (not e!201189))))

(declare-datatypes ((array!16749 0))(
  ( (array!16750 (arr!7929 (Array (_ BitVec 32) (_ BitVec 64))) (size!8281 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16749)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3060 0))(
  ( (MissingZero!3060 (index!14416 (_ BitVec 32))) (Found!3060 (index!14417 (_ BitVec 32))) (Intermediate!3060 (undefined!3872 Bool) (index!14418 (_ BitVec 32)) (x!32658 (_ BitVec 32))) (Undefined!3060) (MissingVacant!3060 (index!14419 (_ BitVec 32))) )
))
(declare-fun lt!157434 () SeekEntryResult!3060)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16749 (_ BitVec 32)) SeekEntryResult!3060)

(assert (=> b!326981 (= res!180012 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157434))))

(declare-fun b!326982 () Bool)

(declare-fun res!180013 () Bool)

(declare-fun e!201190 () Bool)

(assert (=> b!326982 (=> (not res!180013) (not e!201190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16749 (_ BitVec 32)) Bool)

(assert (=> b!326982 (= res!180013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326983 () Bool)

(declare-fun res!180020 () Bool)

(assert (=> b!326983 (=> (not res!180020) (not e!201190))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326983 (= res!180020 (and (= (size!8281 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8281 a!3305))))))

(declare-fun b!326984 () Bool)

(declare-fun res!180016 () Bool)

(assert (=> b!326984 (=> (not res!180016) (not e!201190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326984 (= res!180016 (validKeyInArray!0 k0!2497))))

(declare-fun b!326986 () Bool)

(assert (=> b!326986 (= e!201189 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10154 0))(
  ( (Unit!10155) )
))
(declare-fun lt!157433 () Unit!10154)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16749 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10154)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326986 (= lt!157433 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326987 () Bool)

(declare-fun res!180017 () Bool)

(assert (=> b!326987 (=> (not res!180017) (not e!201190))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16749 (_ BitVec 32)) SeekEntryResult!3060)

(assert (=> b!326987 (= res!180017 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3060 i!1250)))))

(declare-fun b!326988 () Bool)

(assert (=> b!326988 (= e!201190 e!201189)))

(declare-fun res!180018 () Bool)

(assert (=> b!326988 (=> (not res!180018) (not e!201189))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326988 (= res!180018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157434))))

(assert (=> b!326988 (= lt!157434 (Intermediate!3060 false resIndex!58 resX!58))))

(declare-fun b!326989 () Bool)

(declare-fun res!180014 () Bool)

(assert (=> b!326989 (=> (not res!180014) (not e!201190))))

(declare-fun arrayContainsKey!0 (array!16749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326989 (= res!180014 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326990 () Bool)

(declare-fun res!180015 () Bool)

(assert (=> b!326990 (=> (not res!180015) (not e!201189))))

(assert (=> b!326990 (= res!180015 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7929 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!180019 () Bool)

(assert (=> start!32712 (=> (not res!180019) (not e!201190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32712 (= res!180019 (validMask!0 mask!3777))))

(assert (=> start!32712 e!201190))

(declare-fun array_inv!5892 (array!16749) Bool)

(assert (=> start!32712 (array_inv!5892 a!3305)))

(assert (=> start!32712 true))

(declare-fun b!326985 () Bool)

(declare-fun res!180021 () Bool)

(assert (=> b!326985 (=> (not res!180021) (not e!201189))))

(assert (=> b!326985 (= res!180021 (and (= (select (arr!7929 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8281 a!3305))))))

(assert (= (and start!32712 res!180019) b!326983))

(assert (= (and b!326983 res!180020) b!326984))

(assert (= (and b!326984 res!180016) b!326989))

(assert (= (and b!326989 res!180014) b!326987))

(assert (= (and b!326987 res!180017) b!326982))

(assert (= (and b!326982 res!180013) b!326988))

(assert (= (and b!326988 res!180018) b!326985))

(assert (= (and b!326985 res!180021) b!326981))

(assert (= (and b!326981 res!180012) b!326990))

(assert (= (and b!326990 res!180015) b!326986))

(declare-fun m!333457 () Bool)

(assert (=> b!326981 m!333457))

(declare-fun m!333459 () Bool)

(assert (=> b!326989 m!333459))

(declare-fun m!333461 () Bool)

(assert (=> b!326990 m!333461))

(declare-fun m!333463 () Bool)

(assert (=> b!326984 m!333463))

(declare-fun m!333465 () Bool)

(assert (=> b!326987 m!333465))

(declare-fun m!333467 () Bool)

(assert (=> b!326985 m!333467))

(declare-fun m!333469 () Bool)

(assert (=> start!32712 m!333469))

(declare-fun m!333471 () Bool)

(assert (=> start!32712 m!333471))

(declare-fun m!333473 () Bool)

(assert (=> b!326986 m!333473))

(assert (=> b!326986 m!333473))

(declare-fun m!333475 () Bool)

(assert (=> b!326986 m!333475))

(declare-fun m!333477 () Bool)

(assert (=> b!326982 m!333477))

(declare-fun m!333479 () Bool)

(assert (=> b!326988 m!333479))

(assert (=> b!326988 m!333479))

(declare-fun m!333481 () Bool)

(assert (=> b!326988 m!333481))

(check-sat (not b!326981) (not b!326989) (not b!326986) (not b!326982) (not b!326987) (not b!326988) (not b!326984) (not start!32712))
(check-sat)
