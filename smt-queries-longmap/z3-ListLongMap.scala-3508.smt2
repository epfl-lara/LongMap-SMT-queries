; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48620 () Bool)

(assert start!48620)

(declare-fun b!533996 () Bool)

(declare-fun res!329207 () Bool)

(declare-fun e!310580 () Bool)

(assert (=> b!533996 (=> (not res!329207) (not e!310580))))

(declare-datatypes ((array!33832 0))(
  ( (array!33833 (arr!16255 (Array (_ BitVec 32) (_ BitVec 64))) (size!16619 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33832)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533996 (= res!329207 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!329203 () Bool)

(assert (=> start!48620 (=> (not res!329203) (not e!310580))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48620 (= res!329203 (validMask!0 mask!3216))))

(assert (=> start!48620 e!310580))

(assert (=> start!48620 true))

(declare-fun array_inv!12051 (array!33832) Bool)

(assert (=> start!48620 (array_inv!12051 a!3154)))

(declare-fun b!533997 () Bool)

(declare-fun res!329202 () Bool)

(assert (=> b!533997 (=> (not res!329202) (not e!310580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533997 (= res!329202 (validKeyInArray!0 k0!1998))))

(declare-fun b!533998 () Bool)

(declare-fun e!310579 () Bool)

(assert (=> b!533998 (= e!310580 e!310579)))

(declare-fun res!329206 () Bool)

(assert (=> b!533998 (=> (not res!329206) (not e!310579))))

(declare-datatypes ((SeekEntryResult!4713 0))(
  ( (MissingZero!4713 (index!21076 (_ BitVec 32))) (Found!4713 (index!21077 (_ BitVec 32))) (Intermediate!4713 (undefined!5525 Bool) (index!21078 (_ BitVec 32)) (x!50040 (_ BitVec 32))) (Undefined!4713) (MissingVacant!4713 (index!21079 (_ BitVec 32))) )
))
(declare-fun lt!245545 () SeekEntryResult!4713)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533998 (= res!329206 (or (= lt!245545 (MissingZero!4713 i!1153)) (= lt!245545 (MissingVacant!4713 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33832 (_ BitVec 32)) SeekEntryResult!4713)

(assert (=> b!533998 (= lt!245545 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533999 () Bool)

(declare-fun res!329210 () Bool)

(assert (=> b!533999 (=> (not res!329210) (not e!310579))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33832 (_ BitVec 32)) SeekEntryResult!4713)

(assert (=> b!533999 (= res!329210 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16255 a!3154) j!147) a!3154 mask!3216) (Intermediate!4713 false resIndex!32 resX!32)))))

(declare-fun b!534000 () Bool)

(declare-fun res!329209 () Bool)

(assert (=> b!534000 (=> (not res!329209) (not e!310580))))

(assert (=> b!534000 (= res!329209 (and (= (size!16619 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16619 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16619 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534001 () Bool)

(assert (=> b!534001 (= e!310579 false)))

(declare-fun lt!245544 () SeekEntryResult!4713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534001 (= lt!245544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16255 a!3154) j!147) mask!3216) (select (arr!16255 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534002 () Bool)

(declare-fun res!329205 () Bool)

(assert (=> b!534002 (=> (not res!329205) (not e!310579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33832 (_ BitVec 32)) Bool)

(assert (=> b!534002 (= res!329205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534003 () Bool)

(declare-fun res!329204 () Bool)

(assert (=> b!534003 (=> (not res!329204) (not e!310579))))

(assert (=> b!534003 (= res!329204 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16619 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16619 a!3154)) (= (select (arr!16255 a!3154) resIndex!32) (select (arr!16255 a!3154) j!147))))))

(declare-fun b!534004 () Bool)

(declare-fun res!329208 () Bool)

(assert (=> b!534004 (=> (not res!329208) (not e!310580))))

(assert (=> b!534004 (= res!329208 (validKeyInArray!0 (select (arr!16255 a!3154) j!147)))))

(declare-fun b!534005 () Bool)

(declare-fun res!329201 () Bool)

(assert (=> b!534005 (=> (not res!329201) (not e!310579))))

(declare-datatypes ((List!10374 0))(
  ( (Nil!10371) (Cons!10370 (h!11313 (_ BitVec 64)) (t!16602 List!10374)) )
))
(declare-fun arrayNoDuplicates!0 (array!33832 (_ BitVec 32) List!10374) Bool)

(assert (=> b!534005 (= res!329201 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10371))))

(assert (= (and start!48620 res!329203) b!534000))

(assert (= (and b!534000 res!329209) b!534004))

(assert (= (and b!534004 res!329208) b!533997))

(assert (= (and b!533997 res!329202) b!533996))

(assert (= (and b!533996 res!329207) b!533998))

(assert (= (and b!533998 res!329206) b!534002))

(assert (= (and b!534002 res!329205) b!534005))

(assert (= (and b!534005 res!329201) b!534003))

(assert (= (and b!534003 res!329204) b!533999))

(assert (= (and b!533999 res!329210) b!534001))

(declare-fun m!513773 () Bool)

(assert (=> b!533999 m!513773))

(assert (=> b!533999 m!513773))

(declare-fun m!513775 () Bool)

(assert (=> b!533999 m!513775))

(declare-fun m!513777 () Bool)

(assert (=> b!534003 m!513777))

(assert (=> b!534003 m!513773))

(assert (=> b!534001 m!513773))

(assert (=> b!534001 m!513773))

(declare-fun m!513779 () Bool)

(assert (=> b!534001 m!513779))

(assert (=> b!534001 m!513779))

(assert (=> b!534001 m!513773))

(declare-fun m!513781 () Bool)

(assert (=> b!534001 m!513781))

(declare-fun m!513783 () Bool)

(assert (=> b!533997 m!513783))

(declare-fun m!513785 () Bool)

(assert (=> b!533996 m!513785))

(declare-fun m!513787 () Bool)

(assert (=> b!533998 m!513787))

(declare-fun m!513789 () Bool)

(assert (=> b!534002 m!513789))

(declare-fun m!513791 () Bool)

(assert (=> start!48620 m!513791))

(declare-fun m!513793 () Bool)

(assert (=> start!48620 m!513793))

(assert (=> b!534004 m!513773))

(assert (=> b!534004 m!513773))

(declare-fun m!513795 () Bool)

(assert (=> b!534004 m!513795))

(declare-fun m!513797 () Bool)

(assert (=> b!534005 m!513797))

(check-sat (not b!533996) (not b!533997) (not b!534005) (not b!534004) (not b!533998) (not start!48620) (not b!533999) (not b!534001) (not b!534002))
(check-sat)
