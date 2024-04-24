; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48670 () Bool)

(assert start!48670)

(declare-fun b!534807 () Bool)

(declare-fun res!330071 () Bool)

(declare-fun e!310805 () Bool)

(assert (=> b!534807 (=> (not res!330071) (not e!310805))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33881 0))(
  ( (array!33882 (arr!16279 (Array (_ BitVec 32) (_ BitVec 64))) (size!16643 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33881)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534807 (= res!330071 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16643 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16643 a!3154)) (= (select (arr!16279 a!3154) resIndex!32) (select (arr!16279 a!3154) j!147))))))

(declare-fun b!534809 () Bool)

(declare-fun e!310803 () Bool)

(assert (=> b!534809 (= e!310803 e!310805)))

(declare-fun res!330069 () Bool)

(assert (=> b!534809 (=> (not res!330069) (not e!310805))))

(declare-datatypes ((SeekEntryResult!4693 0))(
  ( (MissingZero!4693 (index!20996 (_ BitVec 32))) (Found!4693 (index!20997 (_ BitVec 32))) (Intermediate!4693 (undefined!5505 Bool) (index!20998 (_ BitVec 32)) (x!50097 (_ BitVec 32))) (Undefined!4693) (MissingVacant!4693 (index!20999 (_ BitVec 32))) )
))
(declare-fun lt!245730 () SeekEntryResult!4693)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534809 (= res!330069 (or (= lt!245730 (MissingZero!4693 i!1153)) (= lt!245730 (MissingVacant!4693 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33881 (_ BitVec 32)) SeekEntryResult!4693)

(assert (=> b!534809 (= lt!245730 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534810 () Bool)

(declare-fun res!330068 () Bool)

(declare-fun e!310804 () Bool)

(assert (=> b!534810 (=> (not res!330068) (not e!310804))))

(declare-fun lt!245731 () SeekEntryResult!4693)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33881 (_ BitVec 32)) SeekEntryResult!4693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534810 (= res!330068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16279 a!3154) j!147) mask!3216) (select (arr!16279 a!3154) j!147) a!3154 mask!3216) lt!245731))))

(declare-fun b!534811 () Bool)

(declare-fun res!330076 () Bool)

(assert (=> b!534811 (=> (not res!330076) (not e!310803))))

(declare-fun arrayContainsKey!0 (array!33881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534811 (= res!330076 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534812 () Bool)

(declare-fun res!330072 () Bool)

(assert (=> b!534812 (=> (not res!330072) (not e!310803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534812 (= res!330072 (validKeyInArray!0 k0!1998))))

(declare-fun b!534813 () Bool)

(declare-fun res!330070 () Bool)

(assert (=> b!534813 (=> (not res!330070) (not e!310805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33881 (_ BitVec 32)) Bool)

(assert (=> b!534813 (= res!330070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534814 () Bool)

(assert (=> b!534814 (= e!310804 (and (not (= (select (arr!16279 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16279 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16279 a!3154) index!1177) (select (arr!16279 a!3154) j!147)) (= index!1177 resIndex!32) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!534815 () Bool)

(declare-fun res!330073 () Bool)

(assert (=> b!534815 (=> (not res!330073) (not e!310803))))

(assert (=> b!534815 (= res!330073 (validKeyInArray!0 (select (arr!16279 a!3154) j!147)))))

(declare-fun res!330067 () Bool)

(assert (=> start!48670 (=> (not res!330067) (not e!310803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48670 (= res!330067 (validMask!0 mask!3216))))

(assert (=> start!48670 e!310803))

(assert (=> start!48670 true))

(declare-fun array_inv!12138 (array!33881) Bool)

(assert (=> start!48670 (array_inv!12138 a!3154)))

(declare-fun b!534808 () Bool)

(assert (=> b!534808 (= e!310805 e!310804)))

(declare-fun res!330066 () Bool)

(assert (=> b!534808 (=> (not res!330066) (not e!310804))))

(assert (=> b!534808 (= res!330066 (= lt!245731 (Intermediate!4693 false resIndex!32 resX!32)))))

(assert (=> b!534808 (= lt!245731 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16279 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534816 () Bool)

(declare-fun res!330075 () Bool)

(assert (=> b!534816 (=> (not res!330075) (not e!310803))))

(assert (=> b!534816 (= res!330075 (and (= (size!16643 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16643 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16643 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534817 () Bool)

(declare-fun res!330074 () Bool)

(assert (=> b!534817 (=> (not res!330074) (not e!310805))))

(declare-datatypes ((List!10305 0))(
  ( (Nil!10302) (Cons!10301 (h!11244 (_ BitVec 64)) (t!16525 List!10305)) )
))
(declare-fun arrayNoDuplicates!0 (array!33881 (_ BitVec 32) List!10305) Bool)

(assert (=> b!534817 (= res!330074 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10302))))

(assert (= (and start!48670 res!330067) b!534816))

(assert (= (and b!534816 res!330075) b!534815))

(assert (= (and b!534815 res!330073) b!534812))

(assert (= (and b!534812 res!330072) b!534811))

(assert (= (and b!534811 res!330076) b!534809))

(assert (= (and b!534809 res!330069) b!534813))

(assert (= (and b!534813 res!330070) b!534817))

(assert (= (and b!534817 res!330074) b!534807))

(assert (= (and b!534807 res!330071) b!534808))

(assert (= (and b!534808 res!330066) b!534810))

(assert (= (and b!534810 res!330068) b!534814))

(declare-fun m!514711 () Bool)

(assert (=> b!534812 m!514711))

(declare-fun m!514713 () Bool)

(assert (=> b!534807 m!514713))

(declare-fun m!514715 () Bool)

(assert (=> b!534807 m!514715))

(declare-fun m!514717 () Bool)

(assert (=> b!534817 m!514717))

(declare-fun m!514719 () Bool)

(assert (=> b!534814 m!514719))

(assert (=> b!534814 m!514715))

(assert (=> b!534810 m!514715))

(assert (=> b!534810 m!514715))

(declare-fun m!514721 () Bool)

(assert (=> b!534810 m!514721))

(assert (=> b!534810 m!514721))

(assert (=> b!534810 m!514715))

(declare-fun m!514723 () Bool)

(assert (=> b!534810 m!514723))

(assert (=> b!534815 m!514715))

(assert (=> b!534815 m!514715))

(declare-fun m!514725 () Bool)

(assert (=> b!534815 m!514725))

(assert (=> b!534808 m!514715))

(assert (=> b!534808 m!514715))

(declare-fun m!514727 () Bool)

(assert (=> b!534808 m!514727))

(declare-fun m!514729 () Bool)

(assert (=> b!534813 m!514729))

(declare-fun m!514731 () Bool)

(assert (=> b!534809 m!514731))

(declare-fun m!514733 () Bool)

(assert (=> start!48670 m!514733))

(declare-fun m!514735 () Bool)

(assert (=> start!48670 m!514735))

(declare-fun m!514737 () Bool)

(assert (=> b!534811 m!514737))

(check-sat (not b!534808) (not b!534810) (not b!534815) (not b!534812) (not start!48670) (not b!534809) (not b!534813) (not b!534811) (not b!534817))
(check-sat)
