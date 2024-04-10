; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48622 () Bool)

(assert start!48622)

(declare-fun b!534026 () Bool)

(declare-fun res!329236 () Bool)

(declare-fun e!310589 () Bool)

(assert (=> b!534026 (=> (not res!329236) (not e!310589))))

(declare-datatypes ((array!33834 0))(
  ( (array!33835 (arr!16256 (Array (_ BitVec 32) (_ BitVec 64))) (size!16620 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33834)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534026 (= res!329236 (validKeyInArray!0 (select (arr!16256 a!3154) j!147)))))

(declare-fun b!534027 () Bool)

(declare-fun res!329237 () Bool)

(declare-fun e!310590 () Bool)

(assert (=> b!534027 (=> (not res!329237) (not e!310590))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4714 0))(
  ( (MissingZero!4714 (index!21080 (_ BitVec 32))) (Found!4714 (index!21081 (_ BitVec 32))) (Intermediate!4714 (undefined!5526 Bool) (index!21082 (_ BitVec 32)) (x!50041 (_ BitVec 32))) (Undefined!4714) (MissingVacant!4714 (index!21083 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33834 (_ BitVec 32)) SeekEntryResult!4714)

(assert (=> b!534027 (= res!329237 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16256 a!3154) j!147) a!3154 mask!3216) (Intermediate!4714 false resIndex!32 resX!32)))))

(declare-fun b!534028 () Bool)

(declare-fun res!329232 () Bool)

(assert (=> b!534028 (=> (not res!329232) (not e!310590))))

(assert (=> b!534028 (= res!329232 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16620 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16620 a!3154)) (= (select (arr!16256 a!3154) resIndex!32) (select (arr!16256 a!3154) j!147))))))

(declare-fun b!534029 () Bool)

(assert (=> b!534029 (= e!310589 e!310590)))

(declare-fun res!329234 () Bool)

(assert (=> b!534029 (=> (not res!329234) (not e!310590))))

(declare-fun lt!245550 () SeekEntryResult!4714)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534029 (= res!329234 (or (= lt!245550 (MissingZero!4714 i!1153)) (= lt!245550 (MissingVacant!4714 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33834 (_ BitVec 32)) SeekEntryResult!4714)

(assert (=> b!534029 (= lt!245550 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534030 () Bool)

(declare-fun res!329240 () Bool)

(assert (=> b!534030 (=> (not res!329240) (not e!310589))))

(declare-fun arrayContainsKey!0 (array!33834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534030 (= res!329240 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534031 () Bool)

(assert (=> b!534031 (= e!310590 false)))

(declare-fun lt!245551 () SeekEntryResult!4714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534031 (= lt!245551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16256 a!3154) j!147) mask!3216) (select (arr!16256 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534032 () Bool)

(declare-fun res!329233 () Bool)

(assert (=> b!534032 (=> (not res!329233) (not e!310589))))

(assert (=> b!534032 (= res!329233 (and (= (size!16620 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16620 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16620 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534033 () Bool)

(declare-fun res!329239 () Bool)

(assert (=> b!534033 (=> (not res!329239) (not e!310590))))

(declare-datatypes ((List!10375 0))(
  ( (Nil!10372) (Cons!10371 (h!11314 (_ BitVec 64)) (t!16603 List!10375)) )
))
(declare-fun arrayNoDuplicates!0 (array!33834 (_ BitVec 32) List!10375) Bool)

(assert (=> b!534033 (= res!329239 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10372))))

(declare-fun b!534034 () Bool)

(declare-fun res!329238 () Bool)

(assert (=> b!534034 (=> (not res!329238) (not e!310590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33834 (_ BitVec 32)) Bool)

(assert (=> b!534034 (= res!329238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!329235 () Bool)

(assert (=> start!48622 (=> (not res!329235) (not e!310589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48622 (= res!329235 (validMask!0 mask!3216))))

(assert (=> start!48622 e!310589))

(assert (=> start!48622 true))

(declare-fun array_inv!12052 (array!33834) Bool)

(assert (=> start!48622 (array_inv!12052 a!3154)))

(declare-fun b!534035 () Bool)

(declare-fun res!329231 () Bool)

(assert (=> b!534035 (=> (not res!329231) (not e!310589))))

(assert (=> b!534035 (= res!329231 (validKeyInArray!0 k!1998))))

(assert (= (and start!48622 res!329235) b!534032))

(assert (= (and b!534032 res!329233) b!534026))

(assert (= (and b!534026 res!329236) b!534035))

(assert (= (and b!534035 res!329231) b!534030))

(assert (= (and b!534030 res!329240) b!534029))

(assert (= (and b!534029 res!329234) b!534034))

(assert (= (and b!534034 res!329238) b!534033))

(assert (= (and b!534033 res!329239) b!534028))

(assert (= (and b!534028 res!329232) b!534027))

(assert (= (and b!534027 res!329237) b!534031))

(declare-fun m!513799 () Bool)

(assert (=> b!534026 m!513799))

(assert (=> b!534026 m!513799))

(declare-fun m!513801 () Bool)

(assert (=> b!534026 m!513801))

(assert (=> b!534031 m!513799))

(assert (=> b!534031 m!513799))

(declare-fun m!513803 () Bool)

(assert (=> b!534031 m!513803))

(assert (=> b!534031 m!513803))

(assert (=> b!534031 m!513799))

(declare-fun m!513805 () Bool)

(assert (=> b!534031 m!513805))

(declare-fun m!513807 () Bool)

(assert (=> b!534034 m!513807))

(declare-fun m!513809 () Bool)

(assert (=> b!534033 m!513809))

(declare-fun m!513811 () Bool)

(assert (=> b!534029 m!513811))

(declare-fun m!513813 () Bool)

(assert (=> b!534028 m!513813))

(assert (=> b!534028 m!513799))

(declare-fun m!513815 () Bool)

(assert (=> start!48622 m!513815))

(declare-fun m!513817 () Bool)

(assert (=> start!48622 m!513817))

(declare-fun m!513819 () Bool)

(assert (=> b!534030 m!513819))

(assert (=> b!534027 m!513799))

(assert (=> b!534027 m!513799))

(declare-fun m!513821 () Bool)

(assert (=> b!534027 m!513821))

(declare-fun m!513823 () Bool)

(assert (=> b!534035 m!513823))

(push 1)

(assert (not b!534031))

(assert (not b!534035))

(assert (not b!534034))

(assert (not b!534027))

(assert (not b!534026))

(assert (not b!534033))

(assert (not b!534030))

(assert (not start!48622))

