; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32642 () Bool)

(assert start!32642)

(declare-fun b!325866 () Bool)

(declare-fun res!179043 () Bool)

(declare-fun e!200761 () Bool)

(assert (=> b!325866 (=> (not res!179043) (not e!200761))))

(declare-datatypes ((array!16683 0))(
  ( (array!16684 (arr!7896 (Array (_ BitVec 32) (_ BitVec 64))) (size!8249 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16683)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3026 0))(
  ( (MissingZero!3026 (index!14280 (_ BitVec 32))) (Found!3026 (index!14281 (_ BitVec 32))) (Intermediate!3026 (undefined!3838 Bool) (index!14282 (_ BitVec 32)) (x!32547 (_ BitVec 32))) (Undefined!3026) (MissingVacant!3026 (index!14283 (_ BitVec 32))) )
))
(declare-fun lt!157031 () SeekEntryResult!3026)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16683 (_ BitVec 32)) SeekEntryResult!3026)

(assert (=> b!325866 (= res!179043 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157031))))

(declare-fun b!325867 () Bool)

(declare-fun res!179049 () Bool)

(declare-fun e!200760 () Bool)

(assert (=> b!325867 (=> (not res!179049) (not e!200760))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16683 (_ BitVec 32)) SeekEntryResult!3026)

(assert (=> b!325867 (= res!179049 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3026 i!1250)))))

(declare-fun b!325868 () Bool)

(declare-fun res!179046 () Bool)

(assert (=> b!325868 (=> (not res!179046) (not e!200761))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325868 (= res!179046 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7896 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325869 () Bool)

(declare-fun res!179052 () Bool)

(assert (=> b!325869 (=> (not res!179052) (not e!200761))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325869 (= res!179052 (and (= (select (arr!7896 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8249 a!3305))))))

(declare-fun b!325870 () Bool)

(declare-fun res!179050 () Bool)

(assert (=> b!325870 (=> (not res!179050) (not e!200760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325870 (= res!179050 (validKeyInArray!0 k0!2497))))

(declare-fun b!325871 () Bool)

(declare-fun res!179044 () Bool)

(assert (=> b!325871 (=> (not res!179044) (not e!200760))))

(declare-fun arrayContainsKey!0 (array!16683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325871 (= res!179044 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325872 () Bool)

(assert (=> b!325872 (= e!200761 false)))

(declare-datatypes ((Unit!10064 0))(
  ( (Unit!10065) )
))
(declare-fun lt!157030 () Unit!10064)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10064)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325872 (= lt!157030 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!325874 () Bool)

(declare-fun res!179051 () Bool)

(assert (=> b!325874 (=> (not res!179051) (not e!200760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16683 (_ BitVec 32)) Bool)

(assert (=> b!325874 (= res!179051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325875 () Bool)

(declare-fun res!179045 () Bool)

(assert (=> b!325875 (=> (not res!179045) (not e!200760))))

(assert (=> b!325875 (= res!179045 (and (= (size!8249 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8249 a!3305))))))

(declare-fun b!325873 () Bool)

(assert (=> b!325873 (= e!200760 e!200761)))

(declare-fun res!179048 () Bool)

(assert (=> b!325873 (=> (not res!179048) (not e!200761))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325873 (= res!179048 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157031))))

(assert (=> b!325873 (= lt!157031 (Intermediate!3026 false resIndex!58 resX!58))))

(declare-fun res!179047 () Bool)

(assert (=> start!32642 (=> (not res!179047) (not e!200760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32642 (= res!179047 (validMask!0 mask!3777))))

(assert (=> start!32642 e!200760))

(declare-fun array_inv!5868 (array!16683) Bool)

(assert (=> start!32642 (array_inv!5868 a!3305)))

(assert (=> start!32642 true))

(assert (= (and start!32642 res!179047) b!325875))

(assert (= (and b!325875 res!179045) b!325870))

(assert (= (and b!325870 res!179050) b!325871))

(assert (= (and b!325871 res!179044) b!325867))

(assert (= (and b!325867 res!179049) b!325874))

(assert (= (and b!325874 res!179051) b!325873))

(assert (= (and b!325873 res!179048) b!325869))

(assert (= (and b!325869 res!179052) b!325866))

(assert (= (and b!325866 res!179043) b!325868))

(assert (= (and b!325868 res!179046) b!325872))

(declare-fun m!331999 () Bool)

(assert (=> b!325866 m!331999))

(declare-fun m!332001 () Bool)

(assert (=> b!325874 m!332001))

(declare-fun m!332003 () Bool)

(assert (=> b!325870 m!332003))

(declare-fun m!332005 () Bool)

(assert (=> b!325871 m!332005))

(declare-fun m!332007 () Bool)

(assert (=> b!325868 m!332007))

(declare-fun m!332009 () Bool)

(assert (=> b!325867 m!332009))

(declare-fun m!332011 () Bool)

(assert (=> b!325869 m!332011))

(declare-fun m!332013 () Bool)

(assert (=> b!325873 m!332013))

(assert (=> b!325873 m!332013))

(declare-fun m!332015 () Bool)

(assert (=> b!325873 m!332015))

(declare-fun m!332017 () Bool)

(assert (=> start!32642 m!332017))

(declare-fun m!332019 () Bool)

(assert (=> start!32642 m!332019))

(declare-fun m!332021 () Bool)

(assert (=> b!325872 m!332021))

(assert (=> b!325872 m!332021))

(declare-fun m!332023 () Bool)

(assert (=> b!325872 m!332023))

(check-sat (not start!32642) (not b!325874) (not b!325872) (not b!325870) (not b!325871) (not b!325866) (not b!325867) (not b!325873))
(check-sat)
