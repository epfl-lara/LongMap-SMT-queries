; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48596 () Bool)

(assert start!48596)

(declare-fun b!533545 () Bool)

(declare-fun e!310351 () Bool)

(assert (=> b!533545 (= e!310351 false)))

(declare-datatypes ((SeekEntryResult!4703 0))(
  ( (MissingZero!4703 (index!21036 (_ BitVec 32))) (Found!4703 (index!21037 (_ BitVec 32))) (Intermediate!4703 (undefined!5515 Bool) (index!21038 (_ BitVec 32)) (x!50009 (_ BitVec 32))) (Undefined!4703) (MissingVacant!4703 (index!21039 (_ BitVec 32))) )
))
(declare-fun lt!245274 () SeekEntryResult!4703)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33818 0))(
  ( (array!33819 (arr!16248 (Array (_ BitVec 32) (_ BitVec 64))) (size!16613 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33818)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33818 (_ BitVec 32)) SeekEntryResult!4703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533545 (= lt!245274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16248 a!3154) j!147) mask!3216) (select (arr!16248 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533546 () Bool)

(declare-fun res!328892 () Bool)

(assert (=> b!533546 (=> (not res!328892) (not e!310351))))

(declare-datatypes ((List!10406 0))(
  ( (Nil!10403) (Cons!10402 (h!11345 (_ BitVec 64)) (t!16625 List!10406)) )
))
(declare-fun arrayNoDuplicates!0 (array!33818 (_ BitVec 32) List!10406) Bool)

(assert (=> b!533546 (= res!328892 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10403))))

(declare-fun b!533547 () Bool)

(declare-fun e!310353 () Bool)

(assert (=> b!533547 (= e!310353 e!310351)))

(declare-fun res!328893 () Bool)

(assert (=> b!533547 (=> (not res!328893) (not e!310351))))

(declare-fun lt!245275 () SeekEntryResult!4703)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533547 (= res!328893 (or (= lt!245275 (MissingZero!4703 i!1153)) (= lt!245275 (MissingVacant!4703 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33818 (_ BitVec 32)) SeekEntryResult!4703)

(assert (=> b!533547 (= lt!245275 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!328901 () Bool)

(assert (=> start!48596 (=> (not res!328901) (not e!310353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48596 (= res!328901 (validMask!0 mask!3216))))

(assert (=> start!48596 e!310353))

(assert (=> start!48596 true))

(declare-fun array_inv!12131 (array!33818) Bool)

(assert (=> start!48596 (array_inv!12131 a!3154)))

(declare-fun b!533548 () Bool)

(declare-fun res!328894 () Bool)

(assert (=> b!533548 (=> (not res!328894) (not e!310351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33818 (_ BitVec 32)) Bool)

(assert (=> b!533548 (= res!328894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533549 () Bool)

(declare-fun res!328898 () Bool)

(assert (=> b!533549 (=> (not res!328898) (not e!310351))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533549 (= res!328898 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16248 a!3154) j!147) a!3154 mask!3216) (Intermediate!4703 false resIndex!32 resX!32)))))

(declare-fun b!533550 () Bool)

(declare-fun res!328896 () Bool)

(assert (=> b!533550 (=> (not res!328896) (not e!310353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533550 (= res!328896 (validKeyInArray!0 (select (arr!16248 a!3154) j!147)))))

(declare-fun b!533551 () Bool)

(declare-fun res!328897 () Bool)

(assert (=> b!533551 (=> (not res!328897) (not e!310353))))

(assert (=> b!533551 (= res!328897 (and (= (size!16613 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16613 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16613 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533552 () Bool)

(declare-fun res!328895 () Bool)

(assert (=> b!533552 (=> (not res!328895) (not e!310353))))

(assert (=> b!533552 (= res!328895 (validKeyInArray!0 k!1998))))

(declare-fun b!533553 () Bool)

(declare-fun res!328900 () Bool)

(assert (=> b!533553 (=> (not res!328900) (not e!310353))))

(declare-fun arrayContainsKey!0 (array!33818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533553 (= res!328900 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533554 () Bool)

(declare-fun res!328899 () Bool)

(assert (=> b!533554 (=> (not res!328899) (not e!310351))))

(assert (=> b!533554 (= res!328899 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16613 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16613 a!3154)) (= (select (arr!16248 a!3154) resIndex!32) (select (arr!16248 a!3154) j!147))))))

(assert (= (and start!48596 res!328901) b!533551))

(assert (= (and b!533551 res!328897) b!533550))

(assert (= (and b!533550 res!328896) b!533552))

(assert (= (and b!533552 res!328895) b!533553))

(assert (= (and b!533553 res!328900) b!533547))

(assert (= (and b!533547 res!328893) b!533548))

(assert (= (and b!533548 res!328894) b!533546))

(assert (= (and b!533546 res!328892) b!533554))

(assert (= (and b!533554 res!328899) b!533549))

(assert (= (and b!533549 res!328898) b!533545))

(declare-fun m!512865 () Bool)

(assert (=> b!533548 m!512865))

(declare-fun m!512867 () Bool)

(assert (=> b!533552 m!512867))

(declare-fun m!512869 () Bool)

(assert (=> start!48596 m!512869))

(declare-fun m!512871 () Bool)

(assert (=> start!48596 m!512871))

(declare-fun m!512873 () Bool)

(assert (=> b!533547 m!512873))

(declare-fun m!512875 () Bool)

(assert (=> b!533550 m!512875))

(assert (=> b!533550 m!512875))

(declare-fun m!512877 () Bool)

(assert (=> b!533550 m!512877))

(assert (=> b!533549 m!512875))

(assert (=> b!533549 m!512875))

(declare-fun m!512879 () Bool)

(assert (=> b!533549 m!512879))

(assert (=> b!533545 m!512875))

(assert (=> b!533545 m!512875))

(declare-fun m!512881 () Bool)

(assert (=> b!533545 m!512881))

(assert (=> b!533545 m!512881))

(assert (=> b!533545 m!512875))

(declare-fun m!512883 () Bool)

(assert (=> b!533545 m!512883))

(declare-fun m!512885 () Bool)

(assert (=> b!533546 m!512885))

(declare-fun m!512887 () Bool)

(assert (=> b!533553 m!512887))

(declare-fun m!512889 () Bool)

(assert (=> b!533554 m!512889))

(assert (=> b!533554 m!512875))

(push 1)

(assert (not b!533550))

(assert (not b!533546))

(assert (not b!533549))

(assert (not start!48596))

(assert (not b!533552))

(assert (not b!533545))

(assert (not b!533548))

(assert (not b!533553))

(assert (not b!533547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

