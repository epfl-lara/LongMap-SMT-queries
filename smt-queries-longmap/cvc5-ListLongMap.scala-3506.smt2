; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48606 () Bool)

(assert start!48606)

(declare-fun res!328994 () Bool)

(declare-fun e!310517 () Bool)

(assert (=> start!48606 (=> (not res!328994) (not e!310517))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48606 (= res!328994 (validMask!0 mask!3216))))

(assert (=> start!48606 e!310517))

(assert (=> start!48606 true))

(declare-datatypes ((array!33818 0))(
  ( (array!33819 (arr!16248 (Array (_ BitVec 32) (_ BitVec 64))) (size!16612 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33818)

(declare-fun array_inv!12044 (array!33818) Bool)

(assert (=> start!48606 (array_inv!12044 a!3154)))

(declare-fun b!533786 () Bool)

(declare-fun e!310518 () Bool)

(assert (=> b!533786 (= e!310518 false)))

(declare-datatypes ((SeekEntryResult!4706 0))(
  ( (MissingZero!4706 (index!21048 (_ BitVec 32))) (Found!4706 (index!21049 (_ BitVec 32))) (Intermediate!4706 (undefined!5518 Bool) (index!21050 (_ BitVec 32)) (x!50017 (_ BitVec 32))) (Undefined!4706) (MissingVacant!4706 (index!21051 (_ BitVec 32))) )
))
(declare-fun lt!245502 () SeekEntryResult!4706)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33818 (_ BitVec 32)) SeekEntryResult!4706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533786 (= lt!245502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16248 a!3154) j!147) mask!3216) (select (arr!16248 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533787 () Bool)

(assert (=> b!533787 (= e!310517 e!310518)))

(declare-fun res!328992 () Bool)

(assert (=> b!533787 (=> (not res!328992) (not e!310518))))

(declare-fun lt!245503 () SeekEntryResult!4706)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533787 (= res!328992 (or (= lt!245503 (MissingZero!4706 i!1153)) (= lt!245503 (MissingVacant!4706 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33818 (_ BitVec 32)) SeekEntryResult!4706)

(assert (=> b!533787 (= lt!245503 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533788 () Bool)

(declare-fun res!328995 () Bool)

(assert (=> b!533788 (=> (not res!328995) (not e!310518))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533788 (= res!328995 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16612 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16612 a!3154)) (= (select (arr!16248 a!3154) resIndex!32) (select (arr!16248 a!3154) j!147))))))

(declare-fun b!533789 () Bool)

(declare-fun res!328998 () Bool)

(assert (=> b!533789 (=> (not res!328998) (not e!310517))))

(declare-fun arrayContainsKey!0 (array!33818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533789 (= res!328998 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533790 () Bool)

(declare-fun res!328996 () Bool)

(assert (=> b!533790 (=> (not res!328996) (not e!310518))))

(assert (=> b!533790 (= res!328996 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16248 a!3154) j!147) a!3154 mask!3216) (Intermediate!4706 false resIndex!32 resX!32)))))

(declare-fun b!533791 () Bool)

(declare-fun res!328997 () Bool)

(assert (=> b!533791 (=> (not res!328997) (not e!310517))))

(assert (=> b!533791 (= res!328997 (and (= (size!16612 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16612 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16612 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533792 () Bool)

(declare-fun res!328991 () Bool)

(assert (=> b!533792 (=> (not res!328991) (not e!310518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33818 (_ BitVec 32)) Bool)

(assert (=> b!533792 (= res!328991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533793 () Bool)

(declare-fun res!329000 () Bool)

(assert (=> b!533793 (=> (not res!329000) (not e!310518))))

(declare-datatypes ((List!10367 0))(
  ( (Nil!10364) (Cons!10363 (h!11306 (_ BitVec 64)) (t!16595 List!10367)) )
))
(declare-fun arrayNoDuplicates!0 (array!33818 (_ BitVec 32) List!10367) Bool)

(assert (=> b!533793 (= res!329000 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10364))))

(declare-fun b!533794 () Bool)

(declare-fun res!328993 () Bool)

(assert (=> b!533794 (=> (not res!328993) (not e!310517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533794 (= res!328993 (validKeyInArray!0 (select (arr!16248 a!3154) j!147)))))

(declare-fun b!533795 () Bool)

(declare-fun res!328999 () Bool)

(assert (=> b!533795 (=> (not res!328999) (not e!310517))))

(assert (=> b!533795 (= res!328999 (validKeyInArray!0 k!1998))))

(assert (= (and start!48606 res!328994) b!533791))

(assert (= (and b!533791 res!328997) b!533794))

(assert (= (and b!533794 res!328993) b!533795))

(assert (= (and b!533795 res!328999) b!533789))

(assert (= (and b!533789 res!328998) b!533787))

(assert (= (and b!533787 res!328992) b!533792))

(assert (= (and b!533792 res!328991) b!533793))

(assert (= (and b!533793 res!329000) b!533788))

(assert (= (and b!533788 res!328995) b!533790))

(assert (= (and b!533790 res!328996) b!533786))

(declare-fun m!513591 () Bool)

(assert (=> b!533788 m!513591))

(declare-fun m!513593 () Bool)

(assert (=> b!533788 m!513593))

(declare-fun m!513595 () Bool)

(assert (=> start!48606 m!513595))

(declare-fun m!513597 () Bool)

(assert (=> start!48606 m!513597))

(assert (=> b!533786 m!513593))

(assert (=> b!533786 m!513593))

(declare-fun m!513599 () Bool)

(assert (=> b!533786 m!513599))

(assert (=> b!533786 m!513599))

(assert (=> b!533786 m!513593))

(declare-fun m!513601 () Bool)

(assert (=> b!533786 m!513601))

(declare-fun m!513603 () Bool)

(assert (=> b!533792 m!513603))

(declare-fun m!513605 () Bool)

(assert (=> b!533789 m!513605))

(declare-fun m!513607 () Bool)

(assert (=> b!533787 m!513607))

(declare-fun m!513609 () Bool)

(assert (=> b!533793 m!513609))

(assert (=> b!533794 m!513593))

(assert (=> b!533794 m!513593))

(declare-fun m!513611 () Bool)

(assert (=> b!533794 m!513611))

(assert (=> b!533790 m!513593))

(assert (=> b!533790 m!513593))

(declare-fun m!513613 () Bool)

(assert (=> b!533790 m!513613))

(declare-fun m!513615 () Bool)

(assert (=> b!533795 m!513615))

(push 1)

