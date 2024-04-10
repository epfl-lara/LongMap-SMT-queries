; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48880 () Bool)

(assert start!48880)

(declare-fun b!538640 () Bool)

(declare-fun e!312336 () Bool)

(declare-fun e!312333 () Bool)

(assert (=> b!538640 (= e!312336 e!312333)))

(declare-fun res!333847 () Bool)

(assert (=> b!538640 (=> (not res!333847) (not e!312333))))

(declare-datatypes ((SeekEntryResult!4843 0))(
  ( (MissingZero!4843 (index!21596 (_ BitVec 32))) (Found!4843 (index!21597 (_ BitVec 32))) (Intermediate!4843 (undefined!5655 Bool) (index!21598 (_ BitVec 32)) (x!50514 (_ BitVec 32))) (Undefined!4843) (MissingVacant!4843 (index!21599 (_ BitVec 32))) )
))
(declare-fun lt!246880 () SeekEntryResult!4843)

(declare-fun lt!246882 () SeekEntryResult!4843)

(declare-fun lt!246878 () SeekEntryResult!4843)

(assert (=> b!538640 (= res!333847 (and (= lt!246882 lt!246878) (= lt!246880 lt!246882)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!246879 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34092 0))(
  ( (array!34093 (arr!16385 (Array (_ BitVec 32) (_ BitVec 64))) (size!16749 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34092)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34092 (_ BitVec 32)) SeekEntryResult!4843)

(assert (=> b!538640 (= lt!246882 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246879 (select (arr!16385 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538641 () Bool)

(declare-fun e!312332 () Bool)

(declare-fun e!312330 () Bool)

(assert (=> b!538641 (= e!312332 e!312330)))

(declare-fun res!333854 () Bool)

(assert (=> b!538641 (=> (not res!333854) (not e!312330))))

(declare-fun lt!246881 () SeekEntryResult!4843)

(assert (=> b!538641 (= res!333854 (= lt!246881 lt!246878))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538641 (= lt!246878 (Intermediate!4843 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538641 (= lt!246881 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16385 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333849 () Bool)

(declare-fun e!312334 () Bool)

(assert (=> start!48880 (=> (not res!333849) (not e!312334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48880 (= res!333849 (validMask!0 mask!3216))))

(assert (=> start!48880 e!312334))

(assert (=> start!48880 true))

(declare-fun array_inv!12181 (array!34092) Bool)

(assert (=> start!48880 (array_inv!12181 a!3154)))

(declare-fun b!538642 () Bool)

(declare-fun e!312335 () Bool)

(assert (=> b!538642 (= e!312335 e!312336)))

(declare-fun res!333857 () Bool)

(assert (=> b!538642 (=> (not res!333857) (not e!312336))))

(assert (=> b!538642 (= res!333857 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246879 #b00000000000000000000000000000000) (bvslt lt!246879 (size!16749 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538642 (= lt!246879 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538643 () Bool)

(assert (=> b!538643 (= e!312330 e!312335)))

(declare-fun res!333851 () Bool)

(assert (=> b!538643 (=> (not res!333851) (not e!312335))))

(assert (=> b!538643 (= res!333851 (and (= lt!246880 lt!246881) (not (= (select (arr!16385 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16385 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16385 a!3154) index!1177) (select (arr!16385 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538643 (= lt!246880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16385 a!3154) j!147) mask!3216) (select (arr!16385 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538644 () Bool)

(declare-fun res!333853 () Bool)

(assert (=> b!538644 (=> (not res!333853) (not e!312334))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538644 (= res!333853 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538645 () Bool)

(declare-fun res!333846 () Bool)

(assert (=> b!538645 (=> (not res!333846) (not e!312334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538645 (= res!333846 (validKeyInArray!0 k!1998))))

(declare-fun b!538646 () Bool)

(declare-fun res!333855 () Bool)

(assert (=> b!538646 (=> (not res!333855) (not e!312332))))

(declare-datatypes ((List!10504 0))(
  ( (Nil!10501) (Cons!10500 (h!11443 (_ BitVec 64)) (t!16732 List!10504)) )
))
(declare-fun arrayNoDuplicates!0 (array!34092 (_ BitVec 32) List!10504) Bool)

(assert (=> b!538646 (= res!333855 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10501))))

(declare-fun b!538647 () Bool)

(declare-fun res!333856 () Bool)

(assert (=> b!538647 (=> (not res!333856) (not e!312332))))

(assert (=> b!538647 (= res!333856 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16749 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16749 a!3154)) (= (select (arr!16385 a!3154) resIndex!32) (select (arr!16385 a!3154) j!147))))))

(declare-fun b!538648 () Bool)

(declare-fun res!333852 () Bool)

(assert (=> b!538648 (=> (not res!333852) (not e!312334))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538648 (= res!333852 (and (= (size!16749 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16749 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16749 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538649 () Bool)

(assert (=> b!538649 (= e!312334 e!312332)))

(declare-fun res!333848 () Bool)

(assert (=> b!538649 (=> (not res!333848) (not e!312332))))

(declare-fun lt!246877 () SeekEntryResult!4843)

(assert (=> b!538649 (= res!333848 (or (= lt!246877 (MissingZero!4843 i!1153)) (= lt!246877 (MissingVacant!4843 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34092 (_ BitVec 32)) SeekEntryResult!4843)

(assert (=> b!538649 (= lt!246877 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538650 () Bool)

(assert (=> b!538650 (= e!312333 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(assert (=> b!538650 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246879 (select (store (arr!16385 a!3154) i!1153 k!1998) j!147) (array!34093 (store (arr!16385 a!3154) i!1153 k!1998) (size!16749 a!3154)) mask!3216) lt!246878)))

(declare-datatypes ((Unit!16870 0))(
  ( (Unit!16871) )
))
(declare-fun lt!246883 () Unit!16870)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34092 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16870)

(assert (=> b!538650 (= lt!246883 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246879 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538651 () Bool)

(declare-fun res!333850 () Bool)

(assert (=> b!538651 (=> (not res!333850) (not e!312334))))

(assert (=> b!538651 (= res!333850 (validKeyInArray!0 (select (arr!16385 a!3154) j!147)))))

(declare-fun b!538652 () Bool)

(declare-fun res!333845 () Bool)

(assert (=> b!538652 (=> (not res!333845) (not e!312332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34092 (_ BitVec 32)) Bool)

(assert (=> b!538652 (= res!333845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48880 res!333849) b!538648))

(assert (= (and b!538648 res!333852) b!538651))

(assert (= (and b!538651 res!333850) b!538645))

(assert (= (and b!538645 res!333846) b!538644))

(assert (= (and b!538644 res!333853) b!538649))

(assert (= (and b!538649 res!333848) b!538652))

(assert (= (and b!538652 res!333845) b!538646))

(assert (= (and b!538646 res!333855) b!538647))

(assert (= (and b!538647 res!333856) b!538641))

(assert (= (and b!538641 res!333854) b!538643))

(assert (= (and b!538643 res!333851) b!538642))

(assert (= (and b!538642 res!333857) b!538640))

(assert (= (and b!538640 res!333847) b!538650))

(declare-fun m!517745 () Bool)

(assert (=> b!538649 m!517745))

(declare-fun m!517747 () Bool)

(assert (=> b!538644 m!517747))

(declare-fun m!517749 () Bool)

(assert (=> b!538650 m!517749))

(declare-fun m!517751 () Bool)

(assert (=> b!538650 m!517751))

(assert (=> b!538650 m!517751))

(declare-fun m!517753 () Bool)

(assert (=> b!538650 m!517753))

(declare-fun m!517755 () Bool)

(assert (=> b!538650 m!517755))

(declare-fun m!517757 () Bool)

(assert (=> b!538641 m!517757))

(assert (=> b!538641 m!517757))

(declare-fun m!517759 () Bool)

(assert (=> b!538641 m!517759))

(declare-fun m!517761 () Bool)

(assert (=> b!538652 m!517761))

(declare-fun m!517763 () Bool)

(assert (=> start!48880 m!517763))

(declare-fun m!517765 () Bool)

(assert (=> start!48880 m!517765))

(assert (=> b!538651 m!517757))

(assert (=> b!538651 m!517757))

(declare-fun m!517767 () Bool)

(assert (=> b!538651 m!517767))

(declare-fun m!517769 () Bool)

(assert (=> b!538642 m!517769))

(declare-fun m!517771 () Bool)

(assert (=> b!538646 m!517771))

(declare-fun m!517773 () Bool)

(assert (=> b!538643 m!517773))

(assert (=> b!538643 m!517757))

(assert (=> b!538643 m!517757))

(declare-fun m!517775 () Bool)

(assert (=> b!538643 m!517775))

(assert (=> b!538643 m!517775))

(assert (=> b!538643 m!517757))

(declare-fun m!517777 () Bool)

(assert (=> b!538643 m!517777))

(declare-fun m!517779 () Bool)

(assert (=> b!538647 m!517779))

(assert (=> b!538647 m!517757))

(assert (=> b!538640 m!517757))

(assert (=> b!538640 m!517757))

(declare-fun m!517781 () Bool)

(assert (=> b!538640 m!517781))

(declare-fun m!517783 () Bool)

(assert (=> b!538645 m!517783))

(push 1)

(assert (not b!538646))

(assert (not b!538642))

(assert (not b!538650))

(assert (not b!538643))

(assert (not b!538640))

(assert (not b!538652))

(assert (not start!48880))

(assert (not b!538645))

(assert (not b!538651))

(assert (not b!538644))

(assert (not b!538649))

(assert (not b!538641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

