; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48602 () Bool)

(assert start!48602)

(declare-fun b!533726 () Bool)

(declare-fun res!328934 () Bool)

(declare-fun e!310498 () Bool)

(assert (=> b!533726 (=> (not res!328934) (not e!310498))))

(declare-datatypes ((array!33814 0))(
  ( (array!33815 (arr!16246 (Array (_ BitVec 32) (_ BitVec 64))) (size!16610 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33814)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533726 (= res!328934 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533727 () Bool)

(declare-fun e!310499 () Bool)

(assert (=> b!533727 (= e!310499 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4704 0))(
  ( (MissingZero!4704 (index!21040 (_ BitVec 32))) (Found!4704 (index!21041 (_ BitVec 32))) (Intermediate!4704 (undefined!5516 Bool) (index!21042 (_ BitVec 32)) (x!50007 (_ BitVec 32))) (Undefined!4704) (MissingVacant!4704 (index!21043 (_ BitVec 32))) )
))
(declare-fun lt!245491 () SeekEntryResult!4704)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33814 (_ BitVec 32)) SeekEntryResult!4704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533727 (= lt!245491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16246 a!3154) j!147) mask!3216) (select (arr!16246 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533728 () Bool)

(declare-fun res!328935 () Bool)

(assert (=> b!533728 (=> (not res!328935) (not e!310498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533728 (= res!328935 (validKeyInArray!0 k0!1998))))

(declare-fun b!533729 () Bool)

(declare-fun res!328931 () Bool)

(assert (=> b!533729 (=> (not res!328931) (not e!310499))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533729 (= res!328931 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16610 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16610 a!3154)) (= (select (arr!16246 a!3154) resIndex!32) (select (arr!16246 a!3154) j!147))))))

(declare-fun b!533730 () Bool)

(declare-fun res!328933 () Bool)

(assert (=> b!533730 (=> (not res!328933) (not e!310498))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533730 (= res!328933 (and (= (size!16610 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16610 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16610 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533731 () Bool)

(assert (=> b!533731 (= e!310498 e!310499)))

(declare-fun res!328938 () Bool)

(assert (=> b!533731 (=> (not res!328938) (not e!310499))))

(declare-fun lt!245490 () SeekEntryResult!4704)

(assert (=> b!533731 (= res!328938 (or (= lt!245490 (MissingZero!4704 i!1153)) (= lt!245490 (MissingVacant!4704 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33814 (_ BitVec 32)) SeekEntryResult!4704)

(assert (=> b!533731 (= lt!245490 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!328940 () Bool)

(assert (=> start!48602 (=> (not res!328940) (not e!310498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48602 (= res!328940 (validMask!0 mask!3216))))

(assert (=> start!48602 e!310498))

(assert (=> start!48602 true))

(declare-fun array_inv!12042 (array!33814) Bool)

(assert (=> start!48602 (array_inv!12042 a!3154)))

(declare-fun b!533732 () Bool)

(declare-fun res!328936 () Bool)

(assert (=> b!533732 (=> (not res!328936) (not e!310499))))

(declare-datatypes ((List!10365 0))(
  ( (Nil!10362) (Cons!10361 (h!11304 (_ BitVec 64)) (t!16593 List!10365)) )
))
(declare-fun arrayNoDuplicates!0 (array!33814 (_ BitVec 32) List!10365) Bool)

(assert (=> b!533732 (= res!328936 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10362))))

(declare-fun b!533733 () Bool)

(declare-fun res!328939 () Bool)

(assert (=> b!533733 (=> (not res!328939) (not e!310498))))

(assert (=> b!533733 (= res!328939 (validKeyInArray!0 (select (arr!16246 a!3154) j!147)))))

(declare-fun b!533734 () Bool)

(declare-fun res!328937 () Bool)

(assert (=> b!533734 (=> (not res!328937) (not e!310499))))

(assert (=> b!533734 (= res!328937 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16246 a!3154) j!147) a!3154 mask!3216) (Intermediate!4704 false resIndex!32 resX!32)))))

(declare-fun b!533735 () Bool)

(declare-fun res!328932 () Bool)

(assert (=> b!533735 (=> (not res!328932) (not e!310499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33814 (_ BitVec 32)) Bool)

(assert (=> b!533735 (= res!328932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48602 res!328940) b!533730))

(assert (= (and b!533730 res!328933) b!533733))

(assert (= (and b!533733 res!328939) b!533728))

(assert (= (and b!533728 res!328935) b!533726))

(assert (= (and b!533726 res!328934) b!533731))

(assert (= (and b!533731 res!328938) b!533735))

(assert (= (and b!533735 res!328932) b!533732))

(assert (= (and b!533732 res!328936) b!533729))

(assert (= (and b!533729 res!328931) b!533734))

(assert (= (and b!533734 res!328937) b!533727))

(declare-fun m!513539 () Bool)

(assert (=> b!533726 m!513539))

(declare-fun m!513541 () Bool)

(assert (=> b!533727 m!513541))

(assert (=> b!533727 m!513541))

(declare-fun m!513543 () Bool)

(assert (=> b!533727 m!513543))

(assert (=> b!533727 m!513543))

(assert (=> b!533727 m!513541))

(declare-fun m!513545 () Bool)

(assert (=> b!533727 m!513545))

(assert (=> b!533733 m!513541))

(assert (=> b!533733 m!513541))

(declare-fun m!513547 () Bool)

(assert (=> b!533733 m!513547))

(declare-fun m!513549 () Bool)

(assert (=> b!533728 m!513549))

(declare-fun m!513551 () Bool)

(assert (=> b!533732 m!513551))

(declare-fun m!513553 () Bool)

(assert (=> b!533735 m!513553))

(declare-fun m!513555 () Bool)

(assert (=> b!533729 m!513555))

(assert (=> b!533729 m!513541))

(declare-fun m!513557 () Bool)

(assert (=> start!48602 m!513557))

(declare-fun m!513559 () Bool)

(assert (=> start!48602 m!513559))

(assert (=> b!533734 m!513541))

(assert (=> b!533734 m!513541))

(declare-fun m!513561 () Bool)

(assert (=> b!533734 m!513561))

(declare-fun m!513563 () Bool)

(assert (=> b!533731 m!513563))

(check-sat (not b!533726) (not b!533728) (not b!533727) (not b!533734) (not start!48602) (not b!533732) (not b!533731) (not b!533735) (not b!533733))
(check-sat)
