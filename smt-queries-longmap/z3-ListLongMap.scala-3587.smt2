; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49310 () Bool)

(assert start!49310)

(declare-fun b!543078 () Bool)

(declare-fun res!337636 () Bool)

(declare-fun e!314180 () Bool)

(assert (=> b!543078 (=> (not res!337636) (not e!314180))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34318 0))(
  ( (array!34319 (arr!16492 (Array (_ BitVec 32) (_ BitVec 64))) (size!16856 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34318)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543078 (= res!337636 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16856 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16856 a!3154)) (= (select (arr!16492 a!3154) resIndex!32) (select (arr!16492 a!3154) j!147))))))

(declare-fun b!543079 () Bool)

(declare-fun res!337637 () Bool)

(assert (=> b!543079 (=> (not res!337637) (not e!314180))))

(declare-datatypes ((List!10611 0))(
  ( (Nil!10608) (Cons!10607 (h!11562 (_ BitVec 64)) (t!16839 List!10611)) )
))
(declare-fun arrayNoDuplicates!0 (array!34318 (_ BitVec 32) List!10611) Bool)

(assert (=> b!543079 (= res!337637 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10608))))

(declare-fun res!337633 () Bool)

(declare-fun e!314181 () Bool)

(assert (=> start!49310 (=> (not res!337633) (not e!314181))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49310 (= res!337633 (validMask!0 mask!3216))))

(assert (=> start!49310 e!314181))

(assert (=> start!49310 true))

(declare-fun array_inv!12288 (array!34318) Bool)

(assert (=> start!49310 (array_inv!12288 a!3154)))

(declare-fun b!543080 () Bool)

(declare-fun e!314178 () Bool)

(assert (=> b!543080 (= e!314178 false)))

(declare-fun lt!248083 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543080 (= lt!248083 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543081 () Bool)

(assert (=> b!543081 (= e!314181 e!314180)))

(declare-fun res!337632 () Bool)

(assert (=> b!543081 (=> (not res!337632) (not e!314180))))

(declare-datatypes ((SeekEntryResult!4950 0))(
  ( (MissingZero!4950 (index!22024 (_ BitVec 32))) (Found!4950 (index!22025 (_ BitVec 32))) (Intermediate!4950 (undefined!5762 Bool) (index!22026 (_ BitVec 32)) (x!50933 (_ BitVec 32))) (Undefined!4950) (MissingVacant!4950 (index!22027 (_ BitVec 32))) )
))
(declare-fun lt!248082 () SeekEntryResult!4950)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543081 (= res!337632 (or (= lt!248082 (MissingZero!4950 i!1153)) (= lt!248082 (MissingVacant!4950 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34318 (_ BitVec 32)) SeekEntryResult!4950)

(assert (=> b!543081 (= lt!248082 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543082 () Bool)

(declare-fun res!337635 () Bool)

(assert (=> b!543082 (=> (not res!337635) (not e!314181))))

(declare-fun arrayContainsKey!0 (array!34318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543082 (= res!337635 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543083 () Bool)

(declare-fun res!337631 () Bool)

(assert (=> b!543083 (=> (not res!337631) (not e!314181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543083 (= res!337631 (validKeyInArray!0 (select (arr!16492 a!3154) j!147)))))

(declare-fun b!543084 () Bool)

(assert (=> b!543084 (= e!314180 e!314178)))

(declare-fun res!337640 () Bool)

(assert (=> b!543084 (=> (not res!337640) (not e!314178))))

(declare-fun lt!248081 () SeekEntryResult!4950)

(assert (=> b!543084 (= res!337640 (= lt!248081 (Intermediate!4950 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34318 (_ BitVec 32)) SeekEntryResult!4950)

(assert (=> b!543084 (= lt!248081 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16492 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543085 () Bool)

(declare-fun res!337638 () Bool)

(assert (=> b!543085 (=> (not res!337638) (not e!314180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34318 (_ BitVec 32)) Bool)

(assert (=> b!543085 (= res!337638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543086 () Bool)

(declare-fun res!337630 () Bool)

(assert (=> b!543086 (=> (not res!337630) (not e!314178))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543086 (= res!337630 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16492 a!3154) j!147) mask!3216) (select (arr!16492 a!3154) j!147) a!3154 mask!3216) lt!248081))))

(declare-fun b!543087 () Bool)

(declare-fun res!337639 () Bool)

(assert (=> b!543087 (=> (not res!337639) (not e!314181))))

(assert (=> b!543087 (= res!337639 (validKeyInArray!0 k0!1998))))

(declare-fun b!543088 () Bool)

(declare-fun res!337634 () Bool)

(assert (=> b!543088 (=> (not res!337634) (not e!314178))))

(assert (=> b!543088 (= res!337634 (and (not (= (select (arr!16492 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16492 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16492 a!3154) index!1177) (select (arr!16492 a!3154) j!147)))))))

(declare-fun b!543089 () Bool)

(declare-fun res!337629 () Bool)

(assert (=> b!543089 (=> (not res!337629) (not e!314181))))

(assert (=> b!543089 (= res!337629 (and (= (size!16856 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16856 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16856 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49310 res!337633) b!543089))

(assert (= (and b!543089 res!337629) b!543083))

(assert (= (and b!543083 res!337631) b!543087))

(assert (= (and b!543087 res!337639) b!543082))

(assert (= (and b!543082 res!337635) b!543081))

(assert (= (and b!543081 res!337632) b!543085))

(assert (= (and b!543085 res!337638) b!543079))

(assert (= (and b!543079 res!337637) b!543078))

(assert (= (and b!543078 res!337636) b!543084))

(assert (= (and b!543084 res!337640) b!543086))

(assert (= (and b!543086 res!337630) b!543088))

(assert (= (and b!543088 res!337634) b!543080))

(declare-fun m!521229 () Bool)

(assert (=> b!543081 m!521229))

(declare-fun m!521231 () Bool)

(assert (=> b!543078 m!521231))

(declare-fun m!521233 () Bool)

(assert (=> b!543078 m!521233))

(assert (=> b!543084 m!521233))

(assert (=> b!543084 m!521233))

(declare-fun m!521235 () Bool)

(assert (=> b!543084 m!521235))

(declare-fun m!521237 () Bool)

(assert (=> b!543088 m!521237))

(assert (=> b!543088 m!521233))

(declare-fun m!521239 () Bool)

(assert (=> start!49310 m!521239))

(declare-fun m!521241 () Bool)

(assert (=> start!49310 m!521241))

(declare-fun m!521243 () Bool)

(assert (=> b!543085 m!521243))

(declare-fun m!521245 () Bool)

(assert (=> b!543079 m!521245))

(declare-fun m!521247 () Bool)

(assert (=> b!543080 m!521247))

(declare-fun m!521249 () Bool)

(assert (=> b!543082 m!521249))

(declare-fun m!521251 () Bool)

(assert (=> b!543087 m!521251))

(assert (=> b!543086 m!521233))

(assert (=> b!543086 m!521233))

(declare-fun m!521253 () Bool)

(assert (=> b!543086 m!521253))

(assert (=> b!543086 m!521253))

(assert (=> b!543086 m!521233))

(declare-fun m!521255 () Bool)

(assert (=> b!543086 m!521255))

(assert (=> b!543083 m!521233))

(assert (=> b!543083 m!521233))

(declare-fun m!521257 () Bool)

(assert (=> b!543083 m!521257))

(check-sat (not b!543086) (not b!543087) (not b!543082) (not b!543081) (not b!543085) (not b!543083) (not b!543084) (not b!543079) (not b!543080) (not start!49310))
(check-sat)
