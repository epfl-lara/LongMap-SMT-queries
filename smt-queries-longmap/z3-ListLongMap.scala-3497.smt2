; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48540 () Bool)

(assert start!48540)

(declare-fun b!532732 () Bool)

(declare-fun res!328084 () Bool)

(declare-fun e!310099 () Bool)

(assert (=> b!532732 (=> (not res!328084) (not e!310099))))

(declare-datatypes ((array!33762 0))(
  ( (array!33763 (arr!16220 (Array (_ BitVec 32) (_ BitVec 64))) (size!16585 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33762)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532732 (= res!328084 (validKeyInArray!0 (select (arr!16220 a!3154) j!147)))))

(declare-fun b!532733 () Bool)

(declare-fun res!328083 () Bool)

(declare-fun e!310101 () Bool)

(assert (=> b!532733 (=> (not res!328083) (not e!310101))))

(declare-datatypes ((List!10378 0))(
  ( (Nil!10375) (Cons!10374 (h!11317 (_ BitVec 64)) (t!16597 List!10378)) )
))
(declare-fun arrayNoDuplicates!0 (array!33762 (_ BitVec 32) List!10378) Bool)

(assert (=> b!532733 (= res!328083 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10375))))

(declare-fun b!532735 () Bool)

(assert (=> b!532735 (= e!310101 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!245134 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532735 (= lt!245134 (toIndex!0 (select (arr!16220 a!3154) j!147) mask!3216))))

(declare-fun b!532736 () Bool)

(declare-fun res!328085 () Bool)

(assert (=> b!532736 (=> (not res!328085) (not e!310099))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!532736 (= res!328085 (validKeyInArray!0 k0!1998))))

(declare-fun b!532737 () Bool)

(declare-fun res!328088 () Bool)

(assert (=> b!532737 (=> (not res!328088) (not e!310101))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4675 0))(
  ( (MissingZero!4675 (index!20924 (_ BitVec 32))) (Found!4675 (index!20925 (_ BitVec 32))) (Intermediate!4675 (undefined!5487 Bool) (index!20926 (_ BitVec 32)) (x!49909 (_ BitVec 32))) (Undefined!4675) (MissingVacant!4675 (index!20927 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33762 (_ BitVec 32)) SeekEntryResult!4675)

(assert (=> b!532737 (= res!328088 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16220 a!3154) j!147) a!3154 mask!3216) (Intermediate!4675 false resIndex!32 resX!32)))))

(declare-fun b!532738 () Bool)

(declare-fun res!328079 () Bool)

(assert (=> b!532738 (=> (not res!328079) (not e!310101))))

(assert (=> b!532738 (= res!328079 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16585 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16585 a!3154)) (= (select (arr!16220 a!3154) resIndex!32) (select (arr!16220 a!3154) j!147))))))

(declare-fun b!532739 () Bool)

(declare-fun res!328082 () Bool)

(assert (=> b!532739 (=> (not res!328082) (not e!310099))))

(declare-fun arrayContainsKey!0 (array!33762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532739 (= res!328082 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532740 () Bool)

(declare-fun res!328086 () Bool)

(assert (=> b!532740 (=> (not res!328086) (not e!310099))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532740 (= res!328086 (and (= (size!16585 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16585 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16585 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532741 () Bool)

(declare-fun res!328080 () Bool)

(assert (=> b!532741 (=> (not res!328080) (not e!310101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33762 (_ BitVec 32)) Bool)

(assert (=> b!532741 (= res!328080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328087 () Bool)

(assert (=> start!48540 (=> (not res!328087) (not e!310099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48540 (= res!328087 (validMask!0 mask!3216))))

(assert (=> start!48540 e!310099))

(assert (=> start!48540 true))

(declare-fun array_inv!12103 (array!33762) Bool)

(assert (=> start!48540 (array_inv!12103 a!3154)))

(declare-fun b!532734 () Bool)

(assert (=> b!532734 (= e!310099 e!310101)))

(declare-fun res!328081 () Bool)

(assert (=> b!532734 (=> (not res!328081) (not e!310101))))

(declare-fun lt!245133 () SeekEntryResult!4675)

(assert (=> b!532734 (= res!328081 (or (= lt!245133 (MissingZero!4675 i!1153)) (= lt!245133 (MissingVacant!4675 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33762 (_ BitVec 32)) SeekEntryResult!4675)

(assert (=> b!532734 (= lt!245133 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48540 res!328087) b!532740))

(assert (= (and b!532740 res!328086) b!532732))

(assert (= (and b!532732 res!328084) b!532736))

(assert (= (and b!532736 res!328085) b!532739))

(assert (= (and b!532739 res!328082) b!532734))

(assert (= (and b!532734 res!328081) b!532741))

(assert (= (and b!532741 res!328080) b!532733))

(assert (= (and b!532733 res!328083) b!532738))

(assert (= (and b!532738 res!328079) b!532737))

(assert (= (and b!532737 res!328088) b!532735))

(declare-fun m!512221 () Bool)

(assert (=> b!532735 m!512221))

(assert (=> b!532735 m!512221))

(declare-fun m!512223 () Bool)

(assert (=> b!532735 m!512223))

(assert (=> b!532732 m!512221))

(assert (=> b!532732 m!512221))

(declare-fun m!512225 () Bool)

(assert (=> b!532732 m!512225))

(declare-fun m!512227 () Bool)

(assert (=> b!532734 m!512227))

(declare-fun m!512229 () Bool)

(assert (=> b!532739 m!512229))

(declare-fun m!512231 () Bool)

(assert (=> b!532738 m!512231))

(assert (=> b!532738 m!512221))

(declare-fun m!512233 () Bool)

(assert (=> b!532741 m!512233))

(declare-fun m!512235 () Bool)

(assert (=> b!532733 m!512235))

(declare-fun m!512237 () Bool)

(assert (=> start!48540 m!512237))

(declare-fun m!512239 () Bool)

(assert (=> start!48540 m!512239))

(declare-fun m!512241 () Bool)

(assert (=> b!532736 m!512241))

(assert (=> b!532737 m!512221))

(assert (=> b!532737 m!512221))

(declare-fun m!512243 () Bool)

(assert (=> b!532737 m!512243))

(check-sat (not b!532736) (not b!532737) (not b!532739) (not start!48540) (not b!532735) (not b!532734) (not b!532732) (not b!532733) (not b!532741))
(check-sat)
