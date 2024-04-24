; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48816 () Bool)

(assert start!48816)

(declare-fun b!536695 () Bool)

(declare-fun res!331795 () Bool)

(declare-fun e!311568 () Bool)

(assert (=> b!536695 (=> (not res!331795) (not e!311568))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33976 0))(
  ( (array!33977 (arr!16325 (Array (_ BitVec 32) (_ BitVec 64))) (size!16689 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33976)

(declare-datatypes ((SeekEntryResult!4739 0))(
  ( (MissingZero!4739 (index!21180 (_ BitVec 32))) (Found!4739 (index!21181 (_ BitVec 32))) (Intermediate!4739 (undefined!5551 Bool) (index!21182 (_ BitVec 32)) (x!50269 (_ BitVec 32))) (Undefined!4739) (MissingVacant!4739 (index!21183 (_ BitVec 32))) )
))
(declare-fun lt!246222 () SeekEntryResult!4739)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33976 (_ BitVec 32)) SeekEntryResult!4739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536695 (= res!331795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16325 a!3154) j!147) mask!3216) (select (arr!16325 a!3154) j!147) a!3154 mask!3216) lt!246222))))

(declare-fun b!536696 () Bool)

(declare-fun res!331803 () Bool)

(declare-fun e!311565 () Bool)

(assert (=> b!536696 (=> (not res!331803) (not e!311565))))

(declare-datatypes ((List!10351 0))(
  ( (Nil!10348) (Cons!10347 (h!11293 (_ BitVec 64)) (t!16571 List!10351)) )
))
(declare-fun arrayNoDuplicates!0 (array!33976 (_ BitVec 32) List!10351) Bool)

(assert (=> b!536696 (= res!331803 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10348))))

(declare-fun b!536697 () Bool)

(declare-fun res!331800 () Bool)

(declare-fun e!311564 () Bool)

(assert (=> b!536697 (=> (not res!331800) (not e!311564))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536697 (= res!331800 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536698 () Bool)

(declare-fun res!331807 () Bool)

(assert (=> b!536698 (=> (not res!331807) (not e!311565))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536698 (= res!331807 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16689 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16689 a!3154)) (= (select (arr!16325 a!3154) resIndex!32) (select (arr!16325 a!3154) j!147))))))

(declare-fun b!536700 () Bool)

(declare-fun e!311567 () Bool)

(assert (=> b!536700 (= e!311567 false)))

(declare-fun lt!246223 () SeekEntryResult!4739)

(declare-fun lt!246220 () (_ BitVec 32))

(assert (=> b!536700 (= lt!246223 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246220 (select (arr!16325 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536701 () Bool)

(declare-fun res!331796 () Bool)

(assert (=> b!536701 (=> (not res!331796) (not e!311568))))

(assert (=> b!536701 (= res!331796 (and (not (= (select (arr!16325 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16325 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16325 a!3154) index!1177) (select (arr!16325 a!3154) j!147)))))))

(declare-fun b!536702 () Bool)

(assert (=> b!536702 (= e!311564 e!311565)))

(declare-fun res!331805 () Bool)

(assert (=> b!536702 (=> (not res!331805) (not e!311565))))

(declare-fun lt!246221 () SeekEntryResult!4739)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536702 (= res!331805 (or (= lt!246221 (MissingZero!4739 i!1153)) (= lt!246221 (MissingVacant!4739 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33976 (_ BitVec 32)) SeekEntryResult!4739)

(assert (=> b!536702 (= lt!246221 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536703 () Bool)

(declare-fun res!331801 () Bool)

(assert (=> b!536703 (=> (not res!331801) (not e!311564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536703 (= res!331801 (validKeyInArray!0 (select (arr!16325 a!3154) j!147)))))

(declare-fun b!536704 () Bool)

(assert (=> b!536704 (= e!311568 e!311567)))

(declare-fun res!331804 () Bool)

(assert (=> b!536704 (=> (not res!331804) (not e!311567))))

(assert (=> b!536704 (= res!331804 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246220 #b00000000000000000000000000000000) (bvslt lt!246220 (size!16689 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536704 (= lt!246220 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!536705 () Bool)

(declare-fun res!331797 () Bool)

(assert (=> b!536705 (=> (not res!331797) (not e!311564))))

(assert (=> b!536705 (= res!331797 (and (= (size!16689 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16689 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16689 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!331802 () Bool)

(assert (=> start!48816 (=> (not res!331802) (not e!311564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48816 (= res!331802 (validMask!0 mask!3216))))

(assert (=> start!48816 e!311564))

(assert (=> start!48816 true))

(declare-fun array_inv!12184 (array!33976) Bool)

(assert (=> start!48816 (array_inv!12184 a!3154)))

(declare-fun b!536699 () Bool)

(declare-fun res!331806 () Bool)

(assert (=> b!536699 (=> (not res!331806) (not e!311564))))

(assert (=> b!536699 (= res!331806 (validKeyInArray!0 k!1998))))

(declare-fun b!536706 () Bool)

(assert (=> b!536706 (= e!311565 e!311568)))

(declare-fun res!331798 () Bool)

(assert (=> b!536706 (=> (not res!331798) (not e!311568))))

(assert (=> b!536706 (= res!331798 (= lt!246222 (Intermediate!4739 false resIndex!32 resX!32)))))

(assert (=> b!536706 (= lt!246222 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16325 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536707 () Bool)

(declare-fun res!331799 () Bool)

(assert (=> b!536707 (=> (not res!331799) (not e!311565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33976 (_ BitVec 32)) Bool)

(assert (=> b!536707 (= res!331799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48816 res!331802) b!536705))

(assert (= (and b!536705 res!331797) b!536703))

(assert (= (and b!536703 res!331801) b!536699))

(assert (= (and b!536699 res!331806) b!536697))

(assert (= (and b!536697 res!331800) b!536702))

(assert (= (and b!536702 res!331805) b!536707))

(assert (= (and b!536707 res!331799) b!536696))

(assert (= (and b!536696 res!331803) b!536698))

(assert (= (and b!536698 res!331807) b!536706))

(assert (= (and b!536706 res!331798) b!536695))

(assert (= (and b!536695 res!331795) b!536701))

(assert (= (and b!536701 res!331796) b!536704))

(assert (= (and b!536704 res!331804) b!536700))

(declare-fun m!516219 () Bool)

(assert (=> b!536706 m!516219))

(assert (=> b!536706 m!516219))

(declare-fun m!516221 () Bool)

(assert (=> b!536706 m!516221))

(declare-fun m!516223 () Bool)

(assert (=> b!536707 m!516223))

(declare-fun m!516225 () Bool)

(assert (=> b!536697 m!516225))

(declare-fun m!516227 () Bool)

(assert (=> start!48816 m!516227))

(declare-fun m!516229 () Bool)

(assert (=> start!48816 m!516229))

(assert (=> b!536700 m!516219))

(assert (=> b!536700 m!516219))

(declare-fun m!516231 () Bool)

(assert (=> b!536700 m!516231))

(declare-fun m!516233 () Bool)

(assert (=> b!536696 m!516233))

(assert (=> b!536703 m!516219))

(assert (=> b!536703 m!516219))

(declare-fun m!516235 () Bool)

(assert (=> b!536703 m!516235))

(declare-fun m!516237 () Bool)

(assert (=> b!536699 m!516237))

(declare-fun m!516239 () Bool)

(assert (=> b!536704 m!516239))

(declare-fun m!516241 () Bool)

(assert (=> b!536701 m!516241))

(assert (=> b!536701 m!516219))

(declare-fun m!516243 () Bool)

(assert (=> b!536698 m!516243))

(assert (=> b!536698 m!516219))

(assert (=> b!536695 m!516219))

(assert (=> b!536695 m!516219))

(declare-fun m!516245 () Bool)

(assert (=> b!536695 m!516245))

(assert (=> b!536695 m!516245))

(assert (=> b!536695 m!516219))

(declare-fun m!516247 () Bool)

(assert (=> b!536695 m!516247))

(declare-fun m!516249 () Bool)

(assert (=> b!536702 m!516249))

(push 1)

(assert (not b!536703))

(assert (not start!48816))

(assert (not b!536700))

(assert (not b!536696))

(assert (not b!536699))

(assert (not b!536707))

(assert (not b!536695))

(assert (not b!536706))

(assert (not b!536704))

(assert (not b!536697))

(assert (not b!536702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

