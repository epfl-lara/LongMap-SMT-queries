; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32702 () Bool)

(assert start!32702)

(declare-fun b!326988 () Bool)

(declare-fun res!180070 () Bool)

(declare-fun e!201173 () Bool)

(assert (=> b!326988 (=> (not res!180070) (not e!201173))))

(declare-datatypes ((array!16752 0))(
  ( (array!16753 (arr!7930 (Array (_ BitVec 32) (_ BitVec 64))) (size!8282 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16752)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326988 (= res!180070 (and (= (size!8282 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8282 a!3305))))))

(declare-fun b!326989 () Bool)

(declare-fun res!180075 () Bool)

(assert (=> b!326989 (=> (not res!180075) (not e!201173))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3026 0))(
  ( (MissingZero!3026 (index!14280 (_ BitVec 32))) (Found!3026 (index!14281 (_ BitVec 32))) (Intermediate!3026 (undefined!3838 Bool) (index!14282 (_ BitVec 32)) (x!32629 (_ BitVec 32))) (Undefined!3026) (MissingVacant!3026 (index!14283 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16752 (_ BitVec 32)) SeekEntryResult!3026)

(assert (=> b!326989 (= res!180075 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3026 i!1250)))))

(declare-fun b!326990 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun e!201172 () Bool)

(assert (=> b!326990 (= e!201172 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((Unit!10120 0))(
  ( (Unit!10121) )
))
(declare-fun lt!157463 () Unit!10120)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16752 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10120)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326990 (= lt!157463 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326991 () Bool)

(declare-fun res!180073 () Bool)

(assert (=> b!326991 (=> (not res!180073) (not e!201173))))

(declare-fun arrayContainsKey!0 (array!16752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326991 (= res!180073 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326992 () Bool)

(declare-fun res!180069 () Bool)

(assert (=> b!326992 (=> (not res!180069) (not e!201172))))

(assert (=> b!326992 (= res!180069 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7930 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326993 () Bool)

(declare-fun res!180077 () Bool)

(assert (=> b!326993 (=> (not res!180077) (not e!201173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326993 (= res!180077 (validKeyInArray!0 k0!2497))))

(declare-fun b!326994 () Bool)

(declare-fun res!180071 () Bool)

(assert (=> b!326994 (=> (not res!180071) (not e!201172))))

(declare-fun lt!157464 () SeekEntryResult!3026)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16752 (_ BitVec 32)) SeekEntryResult!3026)

(assert (=> b!326994 (= res!180071 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157464))))

(declare-fun b!326996 () Bool)

(declare-fun res!180072 () Bool)

(assert (=> b!326996 (=> (not res!180072) (not e!201172))))

(assert (=> b!326996 (= res!180072 (and (= (select (arr!7930 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8282 a!3305))))))

(declare-fun b!326997 () Bool)

(declare-fun res!180074 () Bool)

(assert (=> b!326997 (=> (not res!180074) (not e!201173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16752 (_ BitVec 32)) Bool)

(assert (=> b!326997 (= res!180074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326995 () Bool)

(assert (=> b!326995 (= e!201173 e!201172)))

(declare-fun res!180076 () Bool)

(assert (=> b!326995 (=> (not res!180076) (not e!201172))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326995 (= res!180076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157464))))

(assert (=> b!326995 (= lt!157464 (Intermediate!3026 false resIndex!58 resX!58))))

(declare-fun res!180078 () Bool)

(assert (=> start!32702 (=> (not res!180078) (not e!201173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32702 (= res!180078 (validMask!0 mask!3777))))

(assert (=> start!32702 e!201173))

(declare-fun array_inv!5880 (array!16752) Bool)

(assert (=> start!32702 (array_inv!5880 a!3305)))

(assert (=> start!32702 true))

(assert (= (and start!32702 res!180078) b!326988))

(assert (= (and b!326988 res!180070) b!326993))

(assert (= (and b!326993 res!180077) b!326991))

(assert (= (and b!326991 res!180073) b!326989))

(assert (= (and b!326989 res!180075) b!326997))

(assert (= (and b!326997 res!180074) b!326995))

(assert (= (and b!326995 res!180076) b!326996))

(assert (= (and b!326996 res!180072) b!326994))

(assert (= (and b!326994 res!180071) b!326992))

(assert (= (and b!326992 res!180069) b!326990))

(declare-fun m!333703 () Bool)

(assert (=> b!326992 m!333703))

(declare-fun m!333705 () Bool)

(assert (=> b!326989 m!333705))

(declare-fun m!333707 () Bool)

(assert (=> start!32702 m!333707))

(declare-fun m!333709 () Bool)

(assert (=> start!32702 m!333709))

(declare-fun m!333711 () Bool)

(assert (=> b!326997 m!333711))

(declare-fun m!333713 () Bool)

(assert (=> b!326995 m!333713))

(assert (=> b!326995 m!333713))

(declare-fun m!333715 () Bool)

(assert (=> b!326995 m!333715))

(declare-fun m!333717 () Bool)

(assert (=> b!326996 m!333717))

(declare-fun m!333719 () Bool)

(assert (=> b!326994 m!333719))

(declare-fun m!333721 () Bool)

(assert (=> b!326991 m!333721))

(declare-fun m!333723 () Bool)

(assert (=> b!326993 m!333723))

(declare-fun m!333725 () Bool)

(assert (=> b!326990 m!333725))

(assert (=> b!326990 m!333725))

(declare-fun m!333727 () Bool)

(assert (=> b!326990 m!333727))

(check-sat (not b!326993) (not b!326994) (not b!326990) (not b!326997) (not b!326991) (not b!326989) (not b!326995) (not start!32702))
(check-sat)
