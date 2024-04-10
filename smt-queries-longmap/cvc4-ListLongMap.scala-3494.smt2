; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48484 () Bool)

(assert start!48484)

(declare-fun b!532559 () Bool)

(declare-fun res!327913 () Bool)

(declare-fun e!310057 () Bool)

(assert (=> b!532559 (=> (not res!327913) (not e!310057))))

(declare-datatypes ((array!33747 0))(
  ( (array!33748 (arr!16214 (Array (_ BitVec 32) (_ BitVec 64))) (size!16578 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33747)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33747 (_ BitVec 32)) Bool)

(assert (=> b!532559 (= res!327913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532560 () Bool)

(declare-fun e!310059 () Bool)

(assert (=> b!532560 (= e!310059 e!310057)))

(declare-fun res!327914 () Bool)

(assert (=> b!532560 (=> (not res!327914) (not e!310057))))

(declare-datatypes ((SeekEntryResult!4672 0))(
  ( (MissingZero!4672 (index!20912 (_ BitVec 32))) (Found!4672 (index!20913 (_ BitVec 32))) (Intermediate!4672 (undefined!5484 Bool) (index!20914 (_ BitVec 32)) (x!49881 (_ BitVec 32))) (Undefined!4672) (MissingVacant!4672 (index!20915 (_ BitVec 32))) )
))
(declare-fun lt!245235 () SeekEntryResult!4672)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532560 (= res!327914 (or (= lt!245235 (MissingZero!4672 i!1153)) (= lt!245235 (MissingVacant!4672 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33747 (_ BitVec 32)) SeekEntryResult!4672)

(assert (=> b!532560 (= lt!245235 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532561 () Bool)

(declare-fun res!327906 () Bool)

(assert (=> b!532561 (=> (not res!327906) (not e!310059))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532561 (= res!327906 (validKeyInArray!0 (select (arr!16214 a!3154) j!147)))))

(declare-fun b!532562 () Bool)

(assert (=> b!532562 (= e!310057 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun lt!245236 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532562 (= lt!245236 (toIndex!0 (select (arr!16214 a!3154) j!147) mask!3216))))

(declare-fun b!532563 () Bool)

(declare-fun res!327910 () Bool)

(assert (=> b!532563 (=> (not res!327910) (not e!310059))))

(assert (=> b!532563 (= res!327910 (and (= (size!16578 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16578 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16578 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!327911 () Bool)

(assert (=> start!48484 (=> (not res!327911) (not e!310059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48484 (= res!327911 (validMask!0 mask!3216))))

(assert (=> start!48484 e!310059))

(assert (=> start!48484 true))

(declare-fun array_inv!12010 (array!33747) Bool)

(assert (=> start!48484 (array_inv!12010 a!3154)))

(declare-fun b!532564 () Bool)

(declare-fun res!327905 () Bool)

(assert (=> b!532564 (=> (not res!327905) (not e!310059))))

(declare-fun arrayContainsKey!0 (array!33747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532564 (= res!327905 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532565 () Bool)

(declare-fun res!327909 () Bool)

(assert (=> b!532565 (=> (not res!327909) (not e!310057))))

(declare-datatypes ((List!10333 0))(
  ( (Nil!10330) (Cons!10329 (h!11269 (_ BitVec 64)) (t!16561 List!10333)) )
))
(declare-fun arrayNoDuplicates!0 (array!33747 (_ BitVec 32) List!10333) Bool)

(assert (=> b!532565 (= res!327909 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10330))))

(declare-fun b!532566 () Bool)

(declare-fun res!327907 () Bool)

(assert (=> b!532566 (=> (not res!327907) (not e!310057))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33747 (_ BitVec 32)) SeekEntryResult!4672)

(assert (=> b!532566 (= res!327907 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16214 a!3154) j!147) a!3154 mask!3216) (Intermediate!4672 false resIndex!32 resX!32)))))

(declare-fun b!532567 () Bool)

(declare-fun res!327908 () Bool)

(assert (=> b!532567 (=> (not res!327908) (not e!310059))))

(assert (=> b!532567 (= res!327908 (validKeyInArray!0 k!1998))))

(declare-fun b!532568 () Bool)

(declare-fun res!327912 () Bool)

(assert (=> b!532568 (=> (not res!327912) (not e!310057))))

(assert (=> b!532568 (= res!327912 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16578 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16578 a!3154)) (= (select (arr!16214 a!3154) resIndex!32) (select (arr!16214 a!3154) j!147))))))

(assert (= (and start!48484 res!327911) b!532563))

(assert (= (and b!532563 res!327910) b!532561))

(assert (= (and b!532561 res!327906) b!532567))

(assert (= (and b!532567 res!327908) b!532564))

(assert (= (and b!532564 res!327905) b!532560))

(assert (= (and b!532560 res!327914) b!532559))

(assert (= (and b!532559 res!327913) b!532565))

(assert (= (and b!532565 res!327909) b!532568))

(assert (= (and b!532568 res!327912) b!532566))

(assert (= (and b!532566 res!327907) b!532562))

(declare-fun m!512685 () Bool)

(assert (=> b!532567 m!512685))

(declare-fun m!512687 () Bool)

(assert (=> b!532565 m!512687))

(declare-fun m!512689 () Bool)

(assert (=> b!532560 m!512689))

(declare-fun m!512691 () Bool)

(assert (=> b!532566 m!512691))

(assert (=> b!532566 m!512691))

(declare-fun m!512693 () Bool)

(assert (=> b!532566 m!512693))

(declare-fun m!512695 () Bool)

(assert (=> b!532564 m!512695))

(declare-fun m!512697 () Bool)

(assert (=> start!48484 m!512697))

(declare-fun m!512699 () Bool)

(assert (=> start!48484 m!512699))

(assert (=> b!532561 m!512691))

(assert (=> b!532561 m!512691))

(declare-fun m!512701 () Bool)

(assert (=> b!532561 m!512701))

(declare-fun m!512703 () Bool)

(assert (=> b!532568 m!512703))

(assert (=> b!532568 m!512691))

(assert (=> b!532562 m!512691))

(assert (=> b!532562 m!512691))

(declare-fun m!512705 () Bool)

(assert (=> b!532562 m!512705))

(declare-fun m!512707 () Bool)

(assert (=> b!532559 m!512707))

(push 1)

(assert (not b!532562))

(assert (not b!532561))

(assert (not b!532566))

(assert (not b!532564))

(assert (not b!532559))

(assert (not b!532560))

(assert (not b!532565))

(assert (not start!48484))

