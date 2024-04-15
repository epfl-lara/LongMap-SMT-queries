; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48606 () Bool)

(assert start!48606)

(declare-fun b!533695 () Bool)

(declare-fun e!310397 () Bool)

(declare-fun e!310398 () Bool)

(assert (=> b!533695 (= e!310397 e!310398)))

(declare-fun res!329047 () Bool)

(assert (=> b!533695 (=> (not res!329047) (not e!310398))))

(declare-datatypes ((SeekEntryResult!4708 0))(
  ( (MissingZero!4708 (index!21056 (_ BitVec 32))) (Found!4708 (index!21057 (_ BitVec 32))) (Intermediate!4708 (undefined!5520 Bool) (index!21058 (_ BitVec 32)) (x!50030 (_ BitVec 32))) (Undefined!4708) (MissingVacant!4708 (index!21059 (_ BitVec 32))) )
))
(declare-fun lt!245304 () SeekEntryResult!4708)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533695 (= res!329047 (or (= lt!245304 (MissingZero!4708 i!1153)) (= lt!245304 (MissingVacant!4708 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33828 0))(
  ( (array!33829 (arr!16253 (Array (_ BitVec 32) (_ BitVec 64))) (size!16618 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33828)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33828 (_ BitVec 32)) SeekEntryResult!4708)

(assert (=> b!533695 (= lt!245304 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533696 () Bool)

(declare-fun res!329045 () Bool)

(assert (=> b!533696 (=> (not res!329045) (not e!310398))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533696 (= res!329045 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16618 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16618 a!3154)) (= (select (arr!16253 a!3154) resIndex!32) (select (arr!16253 a!3154) j!147))))))

(declare-fun b!533697 () Bool)

(assert (=> b!533697 (= e!310398 false)))

(declare-fun lt!245305 () SeekEntryResult!4708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33828 (_ BitVec 32)) SeekEntryResult!4708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533697 (= lt!245305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16253 a!3154) j!147) mask!3216) (select (arr!16253 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533698 () Bool)

(declare-fun res!329051 () Bool)

(assert (=> b!533698 (=> (not res!329051) (not e!310398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33828 (_ BitVec 32)) Bool)

(assert (=> b!533698 (= res!329051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533699 () Bool)

(declare-fun res!329042 () Bool)

(assert (=> b!533699 (=> (not res!329042) (not e!310397))))

(declare-fun arrayContainsKey!0 (array!33828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533699 (= res!329042 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533700 () Bool)

(declare-fun res!329050 () Bool)

(assert (=> b!533700 (=> (not res!329050) (not e!310398))))

(assert (=> b!533700 (= res!329050 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16253 a!3154) j!147) a!3154 mask!3216) (Intermediate!4708 false resIndex!32 resX!32)))))

(declare-fun b!533701 () Bool)

(declare-fun res!329044 () Bool)

(assert (=> b!533701 (=> (not res!329044) (not e!310397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533701 (= res!329044 (validKeyInArray!0 k0!1998))))

(declare-fun b!533702 () Bool)

(declare-fun res!329048 () Bool)

(assert (=> b!533702 (=> (not res!329048) (not e!310398))))

(declare-datatypes ((List!10411 0))(
  ( (Nil!10408) (Cons!10407 (h!11350 (_ BitVec 64)) (t!16630 List!10411)) )
))
(declare-fun arrayNoDuplicates!0 (array!33828 (_ BitVec 32) List!10411) Bool)

(assert (=> b!533702 (= res!329048 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10408))))

(declare-fun res!329049 () Bool)

(assert (=> start!48606 (=> (not res!329049) (not e!310397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48606 (= res!329049 (validMask!0 mask!3216))))

(assert (=> start!48606 e!310397))

(assert (=> start!48606 true))

(declare-fun array_inv!12136 (array!33828) Bool)

(assert (=> start!48606 (array_inv!12136 a!3154)))

(declare-fun b!533703 () Bool)

(declare-fun res!329046 () Bool)

(assert (=> b!533703 (=> (not res!329046) (not e!310397))))

(assert (=> b!533703 (= res!329046 (and (= (size!16618 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16618 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16618 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533704 () Bool)

(declare-fun res!329043 () Bool)

(assert (=> b!533704 (=> (not res!329043) (not e!310397))))

(assert (=> b!533704 (= res!329043 (validKeyInArray!0 (select (arr!16253 a!3154) j!147)))))

(assert (= (and start!48606 res!329049) b!533703))

(assert (= (and b!533703 res!329046) b!533704))

(assert (= (and b!533704 res!329043) b!533701))

(assert (= (and b!533701 res!329044) b!533699))

(assert (= (and b!533699 res!329042) b!533695))

(assert (= (and b!533695 res!329047) b!533698))

(assert (= (and b!533698 res!329051) b!533702))

(assert (= (and b!533702 res!329048) b!533696))

(assert (= (and b!533696 res!329045) b!533700))

(assert (= (and b!533700 res!329050) b!533697))

(declare-fun m!512995 () Bool)

(assert (=> b!533695 m!512995))

(declare-fun m!512997 () Bool)

(assert (=> b!533702 m!512997))

(declare-fun m!512999 () Bool)

(assert (=> start!48606 m!512999))

(declare-fun m!513001 () Bool)

(assert (=> start!48606 m!513001))

(declare-fun m!513003 () Bool)

(assert (=> b!533701 m!513003))

(declare-fun m!513005 () Bool)

(assert (=> b!533698 m!513005))

(declare-fun m!513007 () Bool)

(assert (=> b!533697 m!513007))

(assert (=> b!533697 m!513007))

(declare-fun m!513009 () Bool)

(assert (=> b!533697 m!513009))

(assert (=> b!533697 m!513009))

(assert (=> b!533697 m!513007))

(declare-fun m!513011 () Bool)

(assert (=> b!533697 m!513011))

(assert (=> b!533700 m!513007))

(assert (=> b!533700 m!513007))

(declare-fun m!513013 () Bool)

(assert (=> b!533700 m!513013))

(declare-fun m!513015 () Bool)

(assert (=> b!533696 m!513015))

(assert (=> b!533696 m!513007))

(assert (=> b!533704 m!513007))

(assert (=> b!533704 m!513007))

(declare-fun m!513017 () Bool)

(assert (=> b!533704 m!513017))

(declare-fun m!513019 () Bool)

(assert (=> b!533699 m!513019))

(check-sat (not b!533704) (not b!533702) (not b!533695) (not start!48606) (not b!533697) (not b!533699) (not b!533701) (not b!533700) (not b!533698))
(check-sat)
