; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49048 () Bool)

(assert start!49048)

(declare-fun b!540106 () Bool)

(declare-fun e!313037 () Bool)

(assert (=> b!540106 (= e!313037 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4828 0))(
  ( (MissingZero!4828 (index!21536 (_ BitVec 32))) (Found!4828 (index!21537 (_ BitVec 32))) (Intermediate!4828 (undefined!5640 Bool) (index!21538 (_ BitVec 32)) (x!50604 (_ BitVec 32))) (Undefined!4828) (MissingVacant!4828 (index!21539 (_ BitVec 32))) )
))
(declare-fun lt!247381 () SeekEntryResult!4828)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34157 0))(
  ( (array!34158 (arr!16414 (Array (_ BitVec 32) (_ BitVec 64))) (size!16778 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34157)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34157 (_ BitVec 32)) SeekEntryResult!4828)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540106 (= lt!247381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16414 a!3154) j!147) mask!3216) (select (arr!16414 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540107 () Bool)

(declare-fun res!335052 () Bool)

(assert (=> b!540107 (=> (not res!335052) (not e!313037))))

(declare-datatypes ((List!10440 0))(
  ( (Nil!10437) (Cons!10436 (h!11385 (_ BitVec 64)) (t!16660 List!10440)) )
))
(declare-fun arrayNoDuplicates!0 (array!34157 (_ BitVec 32) List!10440) Bool)

(assert (=> b!540107 (= res!335052 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10437))))

(declare-fun b!540109 () Bool)

(declare-fun res!335055 () Bool)

(assert (=> b!540109 (=> (not res!335055) (not e!313037))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540109 (= res!335055 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16778 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16778 a!3154)) (= (select (arr!16414 a!3154) resIndex!32) (select (arr!16414 a!3154) j!147))))))

(declare-fun b!540110 () Bool)

(declare-fun e!313036 () Bool)

(assert (=> b!540110 (= e!313036 e!313037)))

(declare-fun res!335047 () Bool)

(assert (=> b!540110 (=> (not res!335047) (not e!313037))))

(declare-fun lt!247380 () SeekEntryResult!4828)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540110 (= res!335047 (or (= lt!247380 (MissingZero!4828 i!1153)) (= lt!247380 (MissingVacant!4828 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34157 (_ BitVec 32)) SeekEntryResult!4828)

(assert (=> b!540110 (= lt!247380 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540111 () Bool)

(declare-fun res!335049 () Bool)

(assert (=> b!540111 (=> (not res!335049) (not e!313036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540111 (= res!335049 (validKeyInArray!0 k0!1998))))

(declare-fun b!540112 () Bool)

(declare-fun res!335056 () Bool)

(assert (=> b!540112 (=> (not res!335056) (not e!313036))))

(declare-fun arrayContainsKey!0 (array!34157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540112 (= res!335056 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540113 () Bool)

(declare-fun res!335050 () Bool)

(assert (=> b!540113 (=> (not res!335050) (not e!313036))))

(assert (=> b!540113 (= res!335050 (validKeyInArray!0 (select (arr!16414 a!3154) j!147)))))

(declare-fun res!335053 () Bool)

(assert (=> start!49048 (=> (not res!335053) (not e!313036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49048 (= res!335053 (validMask!0 mask!3216))))

(assert (=> start!49048 e!313036))

(assert (=> start!49048 true))

(declare-fun array_inv!12273 (array!34157) Bool)

(assert (=> start!49048 (array_inv!12273 a!3154)))

(declare-fun b!540108 () Bool)

(declare-fun res!335054 () Bool)

(assert (=> b!540108 (=> (not res!335054) (not e!313036))))

(assert (=> b!540108 (= res!335054 (and (= (size!16778 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16778 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16778 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540114 () Bool)

(declare-fun res!335051 () Bool)

(assert (=> b!540114 (=> (not res!335051) (not e!313037))))

(assert (=> b!540114 (= res!335051 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16414 a!3154) j!147) a!3154 mask!3216) (Intermediate!4828 false resIndex!32 resX!32)))))

(declare-fun b!540115 () Bool)

(declare-fun res!335048 () Bool)

(assert (=> b!540115 (=> (not res!335048) (not e!313037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34157 (_ BitVec 32)) Bool)

(assert (=> b!540115 (= res!335048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49048 res!335053) b!540108))

(assert (= (and b!540108 res!335054) b!540113))

(assert (= (and b!540113 res!335050) b!540111))

(assert (= (and b!540111 res!335049) b!540112))

(assert (= (and b!540112 res!335056) b!540110))

(assert (= (and b!540110 res!335047) b!540115))

(assert (= (and b!540115 res!335048) b!540107))

(assert (= (and b!540107 res!335052) b!540109))

(assert (= (and b!540109 res!335055) b!540114))

(assert (= (and b!540114 res!335051) b!540106))

(declare-fun m!519097 () Bool)

(assert (=> b!540110 m!519097))

(declare-fun m!519099 () Bool)

(assert (=> b!540115 m!519099))

(declare-fun m!519101 () Bool)

(assert (=> start!49048 m!519101))

(declare-fun m!519103 () Bool)

(assert (=> start!49048 m!519103))

(declare-fun m!519105 () Bool)

(assert (=> b!540112 m!519105))

(declare-fun m!519107 () Bool)

(assert (=> b!540107 m!519107))

(declare-fun m!519109 () Bool)

(assert (=> b!540106 m!519109))

(assert (=> b!540106 m!519109))

(declare-fun m!519111 () Bool)

(assert (=> b!540106 m!519111))

(assert (=> b!540106 m!519111))

(assert (=> b!540106 m!519109))

(declare-fun m!519113 () Bool)

(assert (=> b!540106 m!519113))

(assert (=> b!540114 m!519109))

(assert (=> b!540114 m!519109))

(declare-fun m!519115 () Bool)

(assert (=> b!540114 m!519115))

(declare-fun m!519117 () Bool)

(assert (=> b!540111 m!519117))

(declare-fun m!519119 () Bool)

(assert (=> b!540109 m!519119))

(assert (=> b!540109 m!519109))

(assert (=> b!540113 m!519109))

(assert (=> b!540113 m!519109))

(declare-fun m!519121 () Bool)

(assert (=> b!540113 m!519121))

(check-sat (not b!540112) (not b!540106) (not b!540110) (not b!540115) (not b!540114) (not b!540107) (not start!49048) (not b!540111) (not b!540113))
(check-sat)
