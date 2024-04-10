; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48598 () Bool)

(assert start!48598)

(declare-fun b!533667 () Bool)

(declare-fun res!328879 () Bool)

(declare-fun e!310482 () Bool)

(assert (=> b!533667 (=> (not res!328879) (not e!310482))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533667 (= res!328879 (validKeyInArray!0 k!1998))))

(declare-fun b!533668 () Bool)

(declare-fun res!328873 () Bool)

(declare-fun e!310481 () Bool)

(assert (=> b!533668 (=> (not res!328873) (not e!310481))))

(declare-datatypes ((array!33810 0))(
  ( (array!33811 (arr!16244 (Array (_ BitVec 32) (_ BitVec 64))) (size!16608 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33810)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33810 (_ BitVec 32)) Bool)

(assert (=> b!533668 (= res!328873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533669 () Bool)

(declare-fun res!328877 () Bool)

(assert (=> b!533669 (=> (not res!328877) (not e!310481))))

(declare-datatypes ((List!10363 0))(
  ( (Nil!10360) (Cons!10359 (h!11302 (_ BitVec 64)) (t!16591 List!10363)) )
))
(declare-fun arrayNoDuplicates!0 (array!33810 (_ BitVec 32) List!10363) Bool)

(assert (=> b!533669 (= res!328877 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10360))))

(declare-fun b!533670 () Bool)

(declare-fun res!328878 () Bool)

(assert (=> b!533670 (=> (not res!328878) (not e!310482))))

(declare-fun arrayContainsKey!0 (array!33810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533670 (= res!328878 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533671 () Bool)

(declare-fun res!328880 () Bool)

(assert (=> b!533671 (=> (not res!328880) (not e!310482))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533671 (= res!328880 (and (= (size!16608 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16608 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16608 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!328872 () Bool)

(assert (=> start!48598 (=> (not res!328872) (not e!310482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48598 (= res!328872 (validMask!0 mask!3216))))

(assert (=> start!48598 e!310482))

(assert (=> start!48598 true))

(declare-fun array_inv!12040 (array!33810) Bool)

(assert (=> start!48598 (array_inv!12040 a!3154)))

(declare-fun b!533672 () Bool)

(declare-fun res!328874 () Bool)

(assert (=> b!533672 (=> (not res!328874) (not e!310481))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!533672 (= res!328874 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16608 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16608 a!3154)) (= (select (arr!16244 a!3154) resIndex!32) (select (arr!16244 a!3154) j!147))))))

(declare-fun b!533673 () Bool)

(declare-fun res!328876 () Bool)

(assert (=> b!533673 (=> (not res!328876) (not e!310482))))

(assert (=> b!533673 (= res!328876 (validKeyInArray!0 (select (arr!16244 a!3154) j!147)))))

(declare-fun b!533674 () Bool)

(assert (=> b!533674 (= e!310482 e!310481)))

(declare-fun res!328875 () Bool)

(assert (=> b!533674 (=> (not res!328875) (not e!310481))))

(declare-datatypes ((SeekEntryResult!4702 0))(
  ( (MissingZero!4702 (index!21032 (_ BitVec 32))) (Found!4702 (index!21033 (_ BitVec 32))) (Intermediate!4702 (undefined!5514 Bool) (index!21034 (_ BitVec 32)) (x!49997 (_ BitVec 32))) (Undefined!4702) (MissingVacant!4702 (index!21035 (_ BitVec 32))) )
))
(declare-fun lt!245478 () SeekEntryResult!4702)

(assert (=> b!533674 (= res!328875 (or (= lt!245478 (MissingZero!4702 i!1153)) (= lt!245478 (MissingVacant!4702 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33810 (_ BitVec 32)) SeekEntryResult!4702)

(assert (=> b!533674 (= lt!245478 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533675 () Bool)

(assert (=> b!533675 (= e!310481 false)))

(declare-fun lt!245479 () SeekEntryResult!4702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33810 (_ BitVec 32)) SeekEntryResult!4702)

(assert (=> b!533675 (= lt!245479 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16244 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48598 res!328872) b!533671))

(assert (= (and b!533671 res!328880) b!533673))

(assert (= (and b!533673 res!328876) b!533667))

(assert (= (and b!533667 res!328879) b!533670))

(assert (= (and b!533670 res!328878) b!533674))

(assert (= (and b!533674 res!328875) b!533668))

(assert (= (and b!533668 res!328873) b!533669))

(assert (= (and b!533669 res!328877) b!533672))

(assert (= (and b!533672 res!328874) b!533675))

(declare-fun m!513491 () Bool)

(assert (=> b!533670 m!513491))

(declare-fun m!513493 () Bool)

(assert (=> b!533667 m!513493))

(declare-fun m!513495 () Bool)

(assert (=> start!48598 m!513495))

(declare-fun m!513497 () Bool)

(assert (=> start!48598 m!513497))

(declare-fun m!513499 () Bool)

(assert (=> b!533673 m!513499))

(assert (=> b!533673 m!513499))

(declare-fun m!513501 () Bool)

(assert (=> b!533673 m!513501))

(declare-fun m!513503 () Bool)

(assert (=> b!533668 m!513503))

(declare-fun m!513505 () Bool)

(assert (=> b!533669 m!513505))

(declare-fun m!513507 () Bool)

(assert (=> b!533674 m!513507))

(declare-fun m!513509 () Bool)

(assert (=> b!533672 m!513509))

(assert (=> b!533672 m!513499))

(assert (=> b!533675 m!513499))

(assert (=> b!533675 m!513499))

(declare-fun m!513511 () Bool)

(assert (=> b!533675 m!513511))

(push 1)

(assert (not b!533674))

(assert (not b!533670))

(assert (not b!533667))

(assert (not start!48598))

(assert (not b!533669))

(assert (not b!533673))

(assert (not b!533675))

(assert (not b!533668))

(check-sat)

