; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48612 () Bool)

(assert start!48612)

(declare-fun res!329082 () Bool)

(declare-fun e!310544 () Bool)

(assert (=> start!48612 (=> (not res!329082) (not e!310544))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48612 (= res!329082 (validMask!0 mask!3216))))

(assert (=> start!48612 e!310544))

(assert (=> start!48612 true))

(declare-datatypes ((array!33824 0))(
  ( (array!33825 (arr!16251 (Array (_ BitVec 32) (_ BitVec 64))) (size!16615 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33824)

(declare-fun array_inv!12047 (array!33824) Bool)

(assert (=> start!48612 (array_inv!12047 a!3154)))

(declare-fun b!533876 () Bool)

(declare-fun res!329083 () Bool)

(declare-fun e!310545 () Bool)

(assert (=> b!533876 (=> (not res!329083) (not e!310545))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4709 0))(
  ( (MissingZero!4709 (index!21060 (_ BitVec 32))) (Found!4709 (index!21061 (_ BitVec 32))) (Intermediate!4709 (undefined!5521 Bool) (index!21062 (_ BitVec 32)) (x!50028 (_ BitVec 32))) (Undefined!4709) (MissingVacant!4709 (index!21063 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33824 (_ BitVec 32)) SeekEntryResult!4709)

(assert (=> b!533876 (= res!329083 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16251 a!3154) j!147) a!3154 mask!3216) (Intermediate!4709 false resIndex!32 resX!32)))))

(declare-fun b!533877 () Bool)

(declare-fun res!329085 () Bool)

(assert (=> b!533877 (=> (not res!329085) (not e!310544))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533877 (= res!329085 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533878 () Bool)

(declare-fun res!329086 () Bool)

(assert (=> b!533878 (=> (not res!329086) (not e!310545))))

(assert (=> b!533878 (= res!329086 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16615 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16615 a!3154)) (= (select (arr!16251 a!3154) resIndex!32) (select (arr!16251 a!3154) j!147))))))

(declare-fun b!533879 () Bool)

(declare-fun res!329089 () Bool)

(assert (=> b!533879 (=> (not res!329089) (not e!310544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533879 (= res!329089 (validKeyInArray!0 k!1998))))

(declare-fun b!533880 () Bool)

(declare-fun res!329084 () Bool)

(assert (=> b!533880 (=> (not res!329084) (not e!310545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33824 (_ BitVec 32)) Bool)

(assert (=> b!533880 (= res!329084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533881 () Bool)

(declare-fun res!329090 () Bool)

(assert (=> b!533881 (=> (not res!329090) (not e!310544))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533881 (= res!329090 (and (= (size!16615 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16615 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16615 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533882 () Bool)

(declare-fun res!329081 () Bool)

(assert (=> b!533882 (=> (not res!329081) (not e!310545))))

(declare-datatypes ((List!10370 0))(
  ( (Nil!10367) (Cons!10366 (h!11309 (_ BitVec 64)) (t!16598 List!10370)) )
))
(declare-fun arrayNoDuplicates!0 (array!33824 (_ BitVec 32) List!10370) Bool)

(assert (=> b!533882 (= res!329081 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10367))))

(declare-fun b!533883 () Bool)

(declare-fun res!329087 () Bool)

(assert (=> b!533883 (=> (not res!329087) (not e!310544))))

(assert (=> b!533883 (= res!329087 (validKeyInArray!0 (select (arr!16251 a!3154) j!147)))))

(declare-fun b!533884 () Bool)

(assert (=> b!533884 (= e!310544 e!310545)))

(declare-fun res!329088 () Bool)

(assert (=> b!533884 (=> (not res!329088) (not e!310545))))

(declare-fun lt!245521 () SeekEntryResult!4709)

(assert (=> b!533884 (= res!329088 (or (= lt!245521 (MissingZero!4709 i!1153)) (= lt!245521 (MissingVacant!4709 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33824 (_ BitVec 32)) SeekEntryResult!4709)

(assert (=> b!533884 (= lt!245521 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533885 () Bool)

(assert (=> b!533885 (= e!310545 false)))

(declare-fun lt!245520 () SeekEntryResult!4709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533885 (= lt!245520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16251 a!3154) j!147) mask!3216) (select (arr!16251 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48612 res!329082) b!533881))

(assert (= (and b!533881 res!329090) b!533883))

(assert (= (and b!533883 res!329087) b!533879))

(assert (= (and b!533879 res!329089) b!533877))

(assert (= (and b!533877 res!329085) b!533884))

(assert (= (and b!533884 res!329088) b!533880))

(assert (= (and b!533880 res!329084) b!533882))

(assert (= (and b!533882 res!329081) b!533878))

(assert (= (and b!533878 res!329086) b!533876))

(assert (= (and b!533876 res!329083) b!533885))

(declare-fun m!513669 () Bool)

(assert (=> start!48612 m!513669))

(declare-fun m!513671 () Bool)

(assert (=> start!48612 m!513671))

(declare-fun m!513673 () Bool)

(assert (=> b!533883 m!513673))

(assert (=> b!533883 m!513673))

(declare-fun m!513675 () Bool)

(assert (=> b!533883 m!513675))

(assert (=> b!533885 m!513673))

(assert (=> b!533885 m!513673))

(declare-fun m!513677 () Bool)

(assert (=> b!533885 m!513677))

(assert (=> b!533885 m!513677))

(assert (=> b!533885 m!513673))

(declare-fun m!513679 () Bool)

(assert (=> b!533885 m!513679))

(declare-fun m!513681 () Bool)

(assert (=> b!533882 m!513681))

(declare-fun m!513683 () Bool)

(assert (=> b!533879 m!513683))

(declare-fun m!513685 () Bool)

(assert (=> b!533878 m!513685))

(assert (=> b!533878 m!513673))

(declare-fun m!513687 () Bool)

(assert (=> b!533884 m!513687))

(declare-fun m!513689 () Bool)

(assert (=> b!533880 m!513689))

(assert (=> b!533876 m!513673))

(assert (=> b!533876 m!513673))

(declare-fun m!513691 () Bool)

(assert (=> b!533876 m!513691))

(declare-fun m!513693 () Bool)

(assert (=> b!533877 m!513693))

(push 1)

