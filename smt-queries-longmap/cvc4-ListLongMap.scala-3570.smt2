; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49146 () Bool)

(assert start!49146)

(declare-fun b!541036 () Bool)

(declare-fun res!335824 () Bool)

(declare-fun e!313411 () Bool)

(assert (=> b!541036 (=> (not res!335824) (not e!313411))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34204 0))(
  ( (array!34205 (arr!16436 (Array (_ BitVec 32) (_ BitVec 64))) (size!16800 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34204)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4850 0))(
  ( (MissingZero!4850 (index!21624 (_ BitVec 32))) (Found!4850 (index!21625 (_ BitVec 32))) (Intermediate!4850 (undefined!5662 Bool) (index!21626 (_ BitVec 32)) (x!50688 (_ BitVec 32))) (Undefined!4850) (MissingVacant!4850 (index!21627 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34204 (_ BitVec 32)) SeekEntryResult!4850)

(assert (=> b!541036 (= res!335824 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16436 a!3154) j!147) a!3154 mask!3216) (Intermediate!4850 false resIndex!32 resX!32)))))

(declare-fun b!541037 () Bool)

(declare-fun res!335826 () Bool)

(assert (=> b!541037 (=> (not res!335826) (not e!313411))))

(declare-datatypes ((List!10462 0))(
  ( (Nil!10459) (Cons!10458 (h!11410 (_ BitVec 64)) (t!16682 List!10462)) )
))
(declare-fun arrayNoDuplicates!0 (array!34204 (_ BitVec 32) List!10462) Bool)

(assert (=> b!541037 (= res!335826 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10459))))

(declare-fun res!335821 () Bool)

(declare-fun e!313413 () Bool)

(assert (=> start!49146 (=> (not res!335821) (not e!313413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49146 (= res!335821 (validMask!0 mask!3216))))

(assert (=> start!49146 e!313413))

(assert (=> start!49146 true))

(declare-fun array_inv!12295 (array!34204) Bool)

(assert (=> start!49146 (array_inv!12295 a!3154)))

(declare-fun b!541038 () Bool)

(declare-fun res!335827 () Bool)

(assert (=> b!541038 (=> (not res!335827) (not e!313411))))

(assert (=> b!541038 (= res!335827 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16800 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16800 a!3154)) (= (select (arr!16436 a!3154) resIndex!32) (select (arr!16436 a!3154) j!147))))))

(declare-fun b!541039 () Bool)

(declare-fun res!335818 () Bool)

(assert (=> b!541039 (=> (not res!335818) (not e!313413))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541039 (= res!335818 (validKeyInArray!0 k!1998))))

(declare-fun b!541040 () Bool)

(declare-fun res!335823 () Bool)

(assert (=> b!541040 (=> (not res!335823) (not e!313411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34204 (_ BitVec 32)) Bool)

(assert (=> b!541040 (= res!335823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541041 () Bool)

(assert (=> b!541041 (= e!313413 e!313411)))

(declare-fun res!335822 () Bool)

(assert (=> b!541041 (=> (not res!335822) (not e!313411))))

(declare-fun lt!247609 () SeekEntryResult!4850)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541041 (= res!335822 (or (= lt!247609 (MissingZero!4850 i!1153)) (= lt!247609 (MissingVacant!4850 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34204 (_ BitVec 32)) SeekEntryResult!4850)

(assert (=> b!541041 (= lt!247609 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541042 () Bool)

(declare-fun res!335819 () Bool)

(assert (=> b!541042 (=> (not res!335819) (not e!313413))))

(assert (=> b!541042 (= res!335819 (and (= (size!16800 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16800 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16800 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541043 () Bool)

(assert (=> b!541043 (= e!313411 false)))

(declare-fun lt!247608 () SeekEntryResult!4850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541043 (= lt!247608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16436 a!3154) j!147) mask!3216) (select (arr!16436 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541044 () Bool)

(declare-fun res!335820 () Bool)

(assert (=> b!541044 (=> (not res!335820) (not e!313413))))

(declare-fun arrayContainsKey!0 (array!34204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541044 (= res!335820 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541045 () Bool)

(declare-fun res!335825 () Bool)

(assert (=> b!541045 (=> (not res!335825) (not e!313413))))

(assert (=> b!541045 (= res!335825 (validKeyInArray!0 (select (arr!16436 a!3154) j!147)))))

(assert (= (and start!49146 res!335821) b!541042))

(assert (= (and b!541042 res!335819) b!541045))

(assert (= (and b!541045 res!335825) b!541039))

(assert (= (and b!541039 res!335818) b!541044))

(assert (= (and b!541044 res!335820) b!541041))

(assert (= (and b!541041 res!335822) b!541040))

(assert (= (and b!541040 res!335823) b!541037))

(assert (= (and b!541037 res!335826) b!541038))

(assert (= (and b!541038 res!335827) b!541036))

(assert (= (and b!541036 res!335824) b!541043))

(declare-fun m!519813 () Bool)

(assert (=> b!541041 m!519813))

(declare-fun m!519815 () Bool)

(assert (=> b!541036 m!519815))

(assert (=> b!541036 m!519815))

(declare-fun m!519817 () Bool)

(assert (=> b!541036 m!519817))

(assert (=> b!541045 m!519815))

(assert (=> b!541045 m!519815))

(declare-fun m!519819 () Bool)

(assert (=> b!541045 m!519819))

(declare-fun m!519821 () Bool)

(assert (=> b!541039 m!519821))

(assert (=> b!541043 m!519815))

(assert (=> b!541043 m!519815))

(declare-fun m!519823 () Bool)

(assert (=> b!541043 m!519823))

(assert (=> b!541043 m!519823))

(assert (=> b!541043 m!519815))

(declare-fun m!519825 () Bool)

(assert (=> b!541043 m!519825))

(declare-fun m!519827 () Bool)

(assert (=> b!541038 m!519827))

(assert (=> b!541038 m!519815))

(declare-fun m!519829 () Bool)

(assert (=> start!49146 m!519829))

(declare-fun m!519831 () Bool)

(assert (=> start!49146 m!519831))

(declare-fun m!519833 () Bool)

(assert (=> b!541044 m!519833))

(declare-fun m!519835 () Bool)

(assert (=> b!541037 m!519835))

(declare-fun m!519837 () Bool)

(assert (=> b!541040 m!519837))

(push 1)

(assert (not b!541040))

(assert (not b!541039))

(assert (not b!541036))

(assert (not b!541044))

(assert (not start!49146))

(assert (not b!541045))

(assert (not b!541041))

(assert (not b!541043))

(assert (not b!541037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

