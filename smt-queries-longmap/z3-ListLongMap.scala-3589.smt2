; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49308 () Bool)

(assert start!49308)

(declare-fun b!542987 () Bool)

(declare-fun res!337688 () Bool)

(declare-fun e!314066 () Bool)

(assert (=> b!542987 (=> (not res!337688) (not e!314066))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542987 (= res!337688 (validKeyInArray!0 k0!1998))))

(declare-fun b!542988 () Bool)

(declare-fun res!337684 () Bool)

(declare-fun e!314065 () Bool)

(assert (=> b!542988 (=> (not res!337684) (not e!314065))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34326 0))(
  ( (array!34327 (arr!16496 (Array (_ BitVec 32) (_ BitVec 64))) (size!16861 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34326)

(assert (=> b!542988 (= res!337684 (and (not (= (select (arr!16496 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16496 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16496 a!3154) index!1177) (select (arr!16496 a!3154) j!147)))))))

(declare-fun b!542989 () Bool)

(declare-fun res!337685 () Bool)

(assert (=> b!542989 (=> (not res!337685) (not e!314066))))

(declare-fun arrayContainsKey!0 (array!34326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542989 (= res!337685 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542990 () Bool)

(declare-fun res!337686 () Bool)

(assert (=> b!542990 (=> (not res!337686) (not e!314066))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542990 (= res!337686 (and (= (size!16861 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16861 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16861 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542992 () Bool)

(declare-fun res!337687 () Bool)

(declare-fun e!314064 () Bool)

(assert (=> b!542992 (=> (not res!337687) (not e!314064))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542992 (= res!337687 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16861 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16861 a!3154)) (= (select (arr!16496 a!3154) resIndex!32) (select (arr!16496 a!3154) j!147))))))

(declare-fun b!542993 () Bool)

(assert (=> b!542993 (= e!314064 e!314065)))

(declare-fun res!337683 () Bool)

(assert (=> b!542993 (=> (not res!337683) (not e!314065))))

(declare-datatypes ((SeekEntryResult!4951 0))(
  ( (MissingZero!4951 (index!22028 (_ BitVec 32))) (Found!4951 (index!22029 (_ BitVec 32))) (Intermediate!4951 (undefined!5763 Bool) (index!22030 (_ BitVec 32)) (x!50945 (_ BitVec 32))) (Undefined!4951) (MissingVacant!4951 (index!22031 (_ BitVec 32))) )
))
(declare-fun lt!247892 () SeekEntryResult!4951)

(assert (=> b!542993 (= res!337683 (= lt!247892 (Intermediate!4951 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34326 (_ BitVec 32)) SeekEntryResult!4951)

(assert (=> b!542993 (= lt!247892 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16496 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542994 () Bool)

(declare-fun res!337689 () Bool)

(assert (=> b!542994 (=> (not res!337689) (not e!314064))))

(declare-datatypes ((List!10654 0))(
  ( (Nil!10651) (Cons!10650 (h!11605 (_ BitVec 64)) (t!16873 List!10654)) )
))
(declare-fun arrayNoDuplicates!0 (array!34326 (_ BitVec 32) List!10654) Bool)

(assert (=> b!542994 (= res!337689 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10651))))

(declare-fun b!542995 () Bool)

(declare-fun res!337682 () Bool)

(assert (=> b!542995 (=> (not res!337682) (not e!314066))))

(assert (=> b!542995 (= res!337682 (validKeyInArray!0 (select (arr!16496 a!3154) j!147)))))

(declare-fun b!542996 () Bool)

(declare-fun res!337691 () Bool)

(assert (=> b!542996 (=> (not res!337691) (not e!314064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34326 (_ BitVec 32)) Bool)

(assert (=> b!542996 (= res!337691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542997 () Bool)

(declare-fun res!337680 () Bool)

(assert (=> b!542997 (=> (not res!337680) (not e!314065))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542997 (= res!337680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16496 a!3154) j!147) mask!3216) (select (arr!16496 a!3154) j!147) a!3154 mask!3216) lt!247892))))

(declare-fun b!542998 () Bool)

(assert (=> b!542998 (= e!314065 false)))

(declare-fun lt!247894 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542998 (= lt!247894 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542991 () Bool)

(assert (=> b!542991 (= e!314066 e!314064)))

(declare-fun res!337681 () Bool)

(assert (=> b!542991 (=> (not res!337681) (not e!314064))))

(declare-fun lt!247893 () SeekEntryResult!4951)

(assert (=> b!542991 (= res!337681 (or (= lt!247893 (MissingZero!4951 i!1153)) (= lt!247893 (MissingVacant!4951 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34326 (_ BitVec 32)) SeekEntryResult!4951)

(assert (=> b!542991 (= lt!247893 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!337690 () Bool)

(assert (=> start!49308 (=> (not res!337690) (not e!314066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49308 (= res!337690 (validMask!0 mask!3216))))

(assert (=> start!49308 e!314066))

(assert (=> start!49308 true))

(declare-fun array_inv!12379 (array!34326) Bool)

(assert (=> start!49308 (array_inv!12379 a!3154)))

(assert (= (and start!49308 res!337690) b!542990))

(assert (= (and b!542990 res!337686) b!542995))

(assert (= (and b!542995 res!337682) b!542987))

(assert (= (and b!542987 res!337688) b!542989))

(assert (= (and b!542989 res!337685) b!542991))

(assert (= (and b!542991 res!337681) b!542996))

(assert (= (and b!542996 res!337691) b!542994))

(assert (= (and b!542994 res!337689) b!542992))

(assert (= (and b!542992 res!337687) b!542993))

(assert (= (and b!542993 res!337683) b!542997))

(assert (= (and b!542997 res!337680) b!542988))

(assert (= (and b!542988 res!337684) b!542998))

(declare-fun m!520627 () Bool)

(assert (=> b!542992 m!520627))

(declare-fun m!520629 () Bool)

(assert (=> b!542992 m!520629))

(declare-fun m!520631 () Bool)

(assert (=> b!542996 m!520631))

(declare-fun m!520633 () Bool)

(assert (=> b!542991 m!520633))

(declare-fun m!520635 () Bool)

(assert (=> b!542989 m!520635))

(declare-fun m!520637 () Bool)

(assert (=> b!542998 m!520637))

(declare-fun m!520639 () Bool)

(assert (=> b!542994 m!520639))

(declare-fun m!520641 () Bool)

(assert (=> start!49308 m!520641))

(declare-fun m!520643 () Bool)

(assert (=> start!49308 m!520643))

(assert (=> b!542995 m!520629))

(assert (=> b!542995 m!520629))

(declare-fun m!520645 () Bool)

(assert (=> b!542995 m!520645))

(declare-fun m!520647 () Bool)

(assert (=> b!542987 m!520647))

(assert (=> b!542997 m!520629))

(assert (=> b!542997 m!520629))

(declare-fun m!520649 () Bool)

(assert (=> b!542997 m!520649))

(assert (=> b!542997 m!520649))

(assert (=> b!542997 m!520629))

(declare-fun m!520651 () Bool)

(assert (=> b!542997 m!520651))

(assert (=> b!542993 m!520629))

(assert (=> b!542993 m!520629))

(declare-fun m!520653 () Bool)

(assert (=> b!542993 m!520653))

(declare-fun m!520655 () Bool)

(assert (=> b!542988 m!520655))

(assert (=> b!542988 m!520629))

(check-sat (not b!542997) (not b!542998) (not b!542991) (not b!542987) (not b!542989) (not b!542995) (not start!49308) (not b!542993) (not b!542994) (not b!542996))
(check-sat)
