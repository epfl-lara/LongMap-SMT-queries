; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48666 () Bool)

(assert start!48666)

(declare-fun b!534686 () Bool)

(declare-fun res!329899 () Bool)

(declare-fun e!310788 () Bool)

(assert (=> b!534686 (=> (not res!329899) (not e!310788))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((array!33878 0))(
  ( (array!33879 (arr!16278 (Array (_ BitVec 32) (_ BitVec 64))) (size!16642 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33878)

(assert (=> b!534686 (= res!329899 (and (= (size!16642 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16642 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16642 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534687 () Bool)

(declare-fun res!329900 () Bool)

(declare-fun e!310786 () Bool)

(assert (=> b!534687 (=> (not res!329900) (not e!310786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33878 (_ BitVec 32)) Bool)

(assert (=> b!534687 (= res!329900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534688 () Bool)

(declare-fun res!329896 () Bool)

(assert (=> b!534688 (=> (not res!329896) (not e!310788))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534688 (= res!329896 (validKeyInArray!0 k!1998))))

(declare-fun b!534690 () Bool)

(assert (=> b!534690 (= e!310788 e!310786)))

(declare-fun res!329891 () Bool)

(assert (=> b!534690 (=> (not res!329891) (not e!310786))))

(declare-datatypes ((SeekEntryResult!4736 0))(
  ( (MissingZero!4736 (index!21168 (_ BitVec 32))) (Found!4736 (index!21169 (_ BitVec 32))) (Intermediate!4736 (undefined!5548 Bool) (index!21170 (_ BitVec 32)) (x!50127 (_ BitVec 32))) (Undefined!4736) (MissingVacant!4736 (index!21171 (_ BitVec 32))) )
))
(declare-fun lt!245682 () SeekEntryResult!4736)

(assert (=> b!534690 (= res!329891 (or (= lt!245682 (MissingZero!4736 i!1153)) (= lt!245682 (MissingVacant!4736 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33878 (_ BitVec 32)) SeekEntryResult!4736)

(assert (=> b!534690 (= lt!245682 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534691 () Bool)

(declare-fun res!329898 () Bool)

(assert (=> b!534691 (=> (not res!329898) (not e!310786))))

(declare-datatypes ((List!10397 0))(
  ( (Nil!10394) (Cons!10393 (h!11336 (_ BitVec 64)) (t!16625 List!10397)) )
))
(declare-fun arrayNoDuplicates!0 (array!33878 (_ BitVec 32) List!10397) Bool)

(assert (=> b!534691 (= res!329898 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10394))))

(declare-fun b!534692 () Bool)

(declare-fun res!329897 () Bool)

(assert (=> b!534692 (=> (not res!329897) (not e!310786))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33878 (_ BitVec 32)) SeekEntryResult!4736)

(assert (=> b!534692 (= res!329897 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16278 a!3154) j!147) a!3154 mask!3216) (Intermediate!4736 false resIndex!32 resX!32)))))

(declare-fun b!534693 () Bool)

(declare-fun res!329894 () Bool)

(assert (=> b!534693 (=> (not res!329894) (not e!310786))))

(assert (=> b!534693 (= res!329894 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16642 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16642 a!3154)) (= (select (arr!16278 a!3154) resIndex!32) (select (arr!16278 a!3154) j!147))))))

(declare-fun b!534694 () Bool)

(declare-fun res!329893 () Bool)

(assert (=> b!534694 (=> (not res!329893) (not e!310788))))

(assert (=> b!534694 (= res!329893 (validKeyInArray!0 (select (arr!16278 a!3154) j!147)))))

(declare-fun b!534695 () Bool)

(assert (=> b!534695 (= e!310786 false)))

(declare-fun lt!245683 () SeekEntryResult!4736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534695 (= lt!245683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16278 a!3154) j!147) mask!3216) (select (arr!16278 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!329895 () Bool)

(assert (=> start!48666 (=> (not res!329895) (not e!310788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48666 (= res!329895 (validMask!0 mask!3216))))

(assert (=> start!48666 e!310788))

(assert (=> start!48666 true))

(declare-fun array_inv!12074 (array!33878) Bool)

(assert (=> start!48666 (array_inv!12074 a!3154)))

(declare-fun b!534689 () Bool)

(declare-fun res!329892 () Bool)

(assert (=> b!534689 (=> (not res!329892) (not e!310788))))

(declare-fun arrayContainsKey!0 (array!33878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534689 (= res!329892 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48666 res!329895) b!534686))

(assert (= (and b!534686 res!329899) b!534694))

(assert (= (and b!534694 res!329893) b!534688))

(assert (= (and b!534688 res!329896) b!534689))

(assert (= (and b!534689 res!329892) b!534690))

(assert (= (and b!534690 res!329891) b!534687))

(assert (= (and b!534687 res!329900) b!534691))

(assert (= (and b!534691 res!329898) b!534693))

(assert (= (and b!534693 res!329894) b!534692))

(assert (= (and b!534692 res!329897) b!534695))

(declare-fun m!514371 () Bool)

(assert (=> b!534688 m!514371))

(declare-fun m!514373 () Bool)

(assert (=> b!534693 m!514373))

(declare-fun m!514375 () Bool)

(assert (=> b!534693 m!514375))

(declare-fun m!514377 () Bool)

(assert (=> b!534691 m!514377))

(declare-fun m!514379 () Bool)

(assert (=> b!534690 m!514379))

(declare-fun m!514381 () Bool)

(assert (=> b!534687 m!514381))

(declare-fun m!514383 () Bool)

(assert (=> start!48666 m!514383))

(declare-fun m!514385 () Bool)

(assert (=> start!48666 m!514385))

(declare-fun m!514387 () Bool)

(assert (=> b!534689 m!514387))

(assert (=> b!534692 m!514375))

(assert (=> b!534692 m!514375))

(declare-fun m!514389 () Bool)

(assert (=> b!534692 m!514389))

(assert (=> b!534695 m!514375))

(assert (=> b!534695 m!514375))

(declare-fun m!514391 () Bool)

(assert (=> b!534695 m!514391))

(assert (=> b!534695 m!514391))

(assert (=> b!534695 m!514375))

(declare-fun m!514393 () Bool)

(assert (=> b!534695 m!514393))

(assert (=> b!534694 m!514375))

(assert (=> b!534694 m!514375))

(declare-fun m!514395 () Bool)

(assert (=> b!534694 m!514395))

(push 1)

