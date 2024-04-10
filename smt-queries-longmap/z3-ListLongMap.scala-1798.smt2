; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32490 () Bool)

(assert start!32490)

(declare-fun res!178142 () Bool)

(declare-fun e!200389 () Bool)

(assert (=> start!32490 (=> (not res!178142) (not e!200389))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32490 (= res!178142 (validMask!0 mask!3777))))

(assert (=> start!32490 e!200389))

(declare-datatypes ((array!16629 0))(
  ( (array!16630 (arr!7872 (Array (_ BitVec 32) (_ BitVec 64))) (size!8224 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16629)

(declare-fun array_inv!5835 (array!16629) Bool)

(assert (=> start!32490 (array_inv!5835 a!3305)))

(assert (=> start!32490 true))

(declare-fun b!324803 () Bool)

(declare-fun e!200387 () Bool)

(assert (=> b!324803 (= e!200389 e!200387)))

(declare-fun res!178143 () Bool)

(assert (=> b!324803 (=> (not res!178143) (not e!200387))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3003 0))(
  ( (MissingZero!3003 (index!14188 (_ BitVec 32))) (Found!3003 (index!14189 (_ BitVec 32))) (Intermediate!3003 (undefined!3815 Bool) (index!14190 (_ BitVec 32)) (x!32431 (_ BitVec 32))) (Undefined!3003) (MissingVacant!3003 (index!14191 (_ BitVec 32))) )
))
(declare-fun lt!156875 () SeekEntryResult!3003)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16629 (_ BitVec 32)) SeekEntryResult!3003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324803 (= res!178143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156875))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324803 (= lt!156875 (Intermediate!3003 false resIndex!58 resX!58))))

(declare-fun b!324804 () Bool)

(declare-fun res!178135 () Bool)

(assert (=> b!324804 (=> (not res!178135) (not e!200387))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324804 (= res!178135 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156875))))

(declare-fun b!324805 () Bool)

(declare-fun res!178138 () Bool)

(assert (=> b!324805 (=> (not res!178138) (not e!200389))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324805 (= res!178138 (and (= (size!8224 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8224 a!3305))))))

(declare-fun b!324806 () Bool)

(assert (=> b!324806 (= e!200387 false)))

(declare-fun lt!156876 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324806 (= lt!156876 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324807 () Bool)

(declare-fun res!178141 () Bool)

(assert (=> b!324807 (=> (not res!178141) (not e!200389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324807 (= res!178141 (validKeyInArray!0 k0!2497))))

(declare-fun b!324808 () Bool)

(declare-fun res!178136 () Bool)

(assert (=> b!324808 (=> (not res!178136) (not e!200389))))

(declare-fun arrayContainsKey!0 (array!16629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324808 (= res!178136 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324809 () Bool)

(declare-fun res!178134 () Bool)

(assert (=> b!324809 (=> (not res!178134) (not e!200389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16629 (_ BitVec 32)) Bool)

(assert (=> b!324809 (= res!178134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324810 () Bool)

(declare-fun res!178140 () Bool)

(assert (=> b!324810 (=> (not res!178140) (not e!200387))))

(assert (=> b!324810 (= res!178140 (and (= (select (arr!7872 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8224 a!3305))))))

(declare-fun b!324811 () Bool)

(declare-fun res!178137 () Bool)

(assert (=> b!324811 (=> (not res!178137) (not e!200387))))

(assert (=> b!324811 (= res!178137 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7872 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324812 () Bool)

(declare-fun res!178139 () Bool)

(assert (=> b!324812 (=> (not res!178139) (not e!200389))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16629 (_ BitVec 32)) SeekEntryResult!3003)

(assert (=> b!324812 (= res!178139 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3003 i!1250)))))

(assert (= (and start!32490 res!178142) b!324805))

(assert (= (and b!324805 res!178138) b!324807))

(assert (= (and b!324807 res!178141) b!324808))

(assert (= (and b!324808 res!178136) b!324812))

(assert (= (and b!324812 res!178139) b!324809))

(assert (= (and b!324809 res!178134) b!324803))

(assert (= (and b!324803 res!178143) b!324810))

(assert (= (and b!324810 res!178140) b!324804))

(assert (= (and b!324804 res!178135) b!324811))

(assert (= (and b!324811 res!178137) b!324806))

(declare-fun m!331775 () Bool)

(assert (=> b!324807 m!331775))

(declare-fun m!331777 () Bool)

(assert (=> b!324810 m!331777))

(declare-fun m!331779 () Bool)

(assert (=> b!324804 m!331779))

(declare-fun m!331781 () Bool)

(assert (=> b!324806 m!331781))

(declare-fun m!331783 () Bool)

(assert (=> b!324812 m!331783))

(declare-fun m!331785 () Bool)

(assert (=> start!32490 m!331785))

(declare-fun m!331787 () Bool)

(assert (=> start!32490 m!331787))

(declare-fun m!331789 () Bool)

(assert (=> b!324811 m!331789))

(declare-fun m!331791 () Bool)

(assert (=> b!324803 m!331791))

(assert (=> b!324803 m!331791))

(declare-fun m!331793 () Bool)

(assert (=> b!324803 m!331793))

(declare-fun m!331795 () Bool)

(assert (=> b!324808 m!331795))

(declare-fun m!331797 () Bool)

(assert (=> b!324809 m!331797))

(check-sat (not b!324806) (not b!324804) (not b!324803) (not b!324807) (not b!324812) (not start!32490) (not b!324809) (not b!324808))
(check-sat)
