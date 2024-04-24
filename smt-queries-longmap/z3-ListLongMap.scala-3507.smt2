; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48604 () Bool)

(assert start!48604)

(declare-fun res!329074 () Bool)

(declare-fun e!310505 () Bool)

(assert (=> start!48604 (=> (not res!329074) (not e!310505))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48604 (= res!329074 (validMask!0 mask!3216))))

(assert (=> start!48604 e!310505))

(assert (=> start!48604 true))

(declare-datatypes ((array!33815 0))(
  ( (array!33816 (arr!16246 (Array (_ BitVec 32) (_ BitVec 64))) (size!16610 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33815)

(declare-fun array_inv!12105 (array!33815) Bool)

(assert (=> start!48604 (array_inv!12105 a!3154)))

(declare-fun b!533815 () Bool)

(declare-fun res!329079 () Bool)

(assert (=> b!533815 (=> (not res!329079) (not e!310505))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533815 (= res!329079 (validKeyInArray!0 k0!1998))))

(declare-fun b!533816 () Bool)

(declare-fun e!310506 () Bool)

(assert (=> b!533816 (= e!310506 false)))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4660 0))(
  ( (MissingZero!4660 (index!20864 (_ BitVec 32))) (Found!4660 (index!20865 (_ BitVec 32))) (Intermediate!4660 (undefined!5472 Bool) (index!20866 (_ BitVec 32)) (x!49976 (_ BitVec 32))) (Undefined!4660) (MissingVacant!4660 (index!20867 (_ BitVec 32))) )
))
(declare-fun lt!245532 () SeekEntryResult!4660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33815 (_ BitVec 32)) SeekEntryResult!4660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533816 (= lt!245532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16246 a!3154) j!147) mask!3216) (select (arr!16246 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533817 () Bool)

(declare-fun res!329081 () Bool)

(assert (=> b!533817 (=> (not res!329081) (not e!310506))))

(declare-datatypes ((List!10272 0))(
  ( (Nil!10269) (Cons!10268 (h!11211 (_ BitVec 64)) (t!16492 List!10272)) )
))
(declare-fun arrayNoDuplicates!0 (array!33815 (_ BitVec 32) List!10272) Bool)

(assert (=> b!533817 (= res!329081 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10269))))

(declare-fun b!533818 () Bool)

(declare-fun res!329080 () Bool)

(assert (=> b!533818 (=> (not res!329080) (not e!310506))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533818 (= res!329080 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16246 a!3154) j!147) a!3154 mask!3216) (Intermediate!4660 false resIndex!32 resX!32)))))

(declare-fun b!533819 () Bool)

(declare-fun res!329082 () Bool)

(assert (=> b!533819 (=> (not res!329082) (not e!310505))))

(assert (=> b!533819 (= res!329082 (validKeyInArray!0 (select (arr!16246 a!3154) j!147)))))

(declare-fun b!533820 () Bool)

(declare-fun res!329075 () Bool)

(assert (=> b!533820 (=> (not res!329075) (not e!310506))))

(assert (=> b!533820 (= res!329075 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16610 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16610 a!3154)) (= (select (arr!16246 a!3154) resIndex!32) (select (arr!16246 a!3154) j!147))))))

(declare-fun b!533821 () Bool)

(declare-fun res!329076 () Bool)

(assert (=> b!533821 (=> (not res!329076) (not e!310505))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533821 (= res!329076 (and (= (size!16610 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16610 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16610 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533822 () Bool)

(assert (=> b!533822 (= e!310505 e!310506)))

(declare-fun res!329077 () Bool)

(assert (=> b!533822 (=> (not res!329077) (not e!310506))))

(declare-fun lt!245533 () SeekEntryResult!4660)

(assert (=> b!533822 (= res!329077 (or (= lt!245533 (MissingZero!4660 i!1153)) (= lt!245533 (MissingVacant!4660 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33815 (_ BitVec 32)) SeekEntryResult!4660)

(assert (=> b!533822 (= lt!245533 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533823 () Bool)

(declare-fun res!329083 () Bool)

(assert (=> b!533823 (=> (not res!329083) (not e!310506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33815 (_ BitVec 32)) Bool)

(assert (=> b!533823 (= res!329083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533824 () Bool)

(declare-fun res!329078 () Bool)

(assert (=> b!533824 (=> (not res!329078) (not e!310505))))

(declare-fun arrayContainsKey!0 (array!33815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533824 (= res!329078 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48604 res!329074) b!533821))

(assert (= (and b!533821 res!329076) b!533819))

(assert (= (and b!533819 res!329082) b!533815))

(assert (= (and b!533815 res!329079) b!533824))

(assert (= (and b!533824 res!329078) b!533822))

(assert (= (and b!533822 res!329077) b!533823))

(assert (= (and b!533823 res!329083) b!533817))

(assert (= (and b!533817 res!329081) b!533820))

(assert (= (and b!533820 res!329075) b!533818))

(assert (= (and b!533818 res!329080) b!533816))

(declare-fun m!513853 () Bool)

(assert (=> b!533815 m!513853))

(declare-fun m!513855 () Bool)

(assert (=> b!533822 m!513855))

(declare-fun m!513857 () Bool)

(assert (=> b!533818 m!513857))

(assert (=> b!533818 m!513857))

(declare-fun m!513859 () Bool)

(assert (=> b!533818 m!513859))

(assert (=> b!533819 m!513857))

(assert (=> b!533819 m!513857))

(declare-fun m!513861 () Bool)

(assert (=> b!533819 m!513861))

(declare-fun m!513863 () Bool)

(assert (=> b!533824 m!513863))

(declare-fun m!513865 () Bool)

(assert (=> start!48604 m!513865))

(declare-fun m!513867 () Bool)

(assert (=> start!48604 m!513867))

(declare-fun m!513869 () Bool)

(assert (=> b!533820 m!513869))

(assert (=> b!533820 m!513857))

(declare-fun m!513871 () Bool)

(assert (=> b!533817 m!513871))

(declare-fun m!513873 () Bool)

(assert (=> b!533823 m!513873))

(assert (=> b!533816 m!513857))

(assert (=> b!533816 m!513857))

(declare-fun m!513875 () Bool)

(assert (=> b!533816 m!513875))

(assert (=> b!533816 m!513875))

(assert (=> b!533816 m!513857))

(declare-fun m!513877 () Bool)

(assert (=> b!533816 m!513877))

(check-sat (not b!533822) (not b!533817) (not b!533816) (not b!533815) (not b!533824) (not b!533818) (not b!533819) (not start!48604) (not b!533823))
(check-sat)
