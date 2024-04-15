; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49260 () Bool)

(assert start!49260)

(declare-fun b!542123 () Bool)

(declare-fun e!313778 () Bool)

(declare-fun e!313776 () Bool)

(assert (=> b!542123 (= e!313778 e!313776)))

(declare-fun res!336821 () Bool)

(assert (=> b!542123 (=> (not res!336821) (not e!313776))))

(declare-datatypes ((SeekEntryResult!4927 0))(
  ( (MissingZero!4927 (index!21932 (_ BitVec 32))) (Found!4927 (index!21933 (_ BitVec 32))) (Intermediate!4927 (undefined!5739 Bool) (index!21934 (_ BitVec 32)) (x!50857 (_ BitVec 32))) (Undefined!4927) (MissingVacant!4927 (index!21935 (_ BitVec 32))) )
))
(declare-fun lt!247676 () SeekEntryResult!4927)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542123 (= res!336821 (or (= lt!247676 (MissingZero!4927 i!1153)) (= lt!247676 (MissingVacant!4927 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34278 0))(
  ( (array!34279 (arr!16472 (Array (_ BitVec 32) (_ BitVec 64))) (size!16837 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34278)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34278 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!542123 (= lt!247676 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542124 () Bool)

(declare-fun res!336827 () Bool)

(assert (=> b!542124 (=> (not res!336827) (not e!313778))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542124 (= res!336827 (validKeyInArray!0 (select (arr!16472 a!3154) j!147)))))

(declare-fun b!542125 () Bool)

(declare-fun e!313779 () Bool)

(assert (=> b!542125 (= e!313776 e!313779)))

(declare-fun res!336818 () Bool)

(assert (=> b!542125 (=> (not res!336818) (not e!313779))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!247678 () SeekEntryResult!4927)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542125 (= res!336818 (= lt!247678 (Intermediate!4927 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34278 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!542125 (= lt!247678 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16472 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542126 () Bool)

(declare-fun res!336824 () Bool)

(assert (=> b!542126 (=> (not res!336824) (not e!313776))))

(declare-datatypes ((List!10630 0))(
  ( (Nil!10627) (Cons!10626 (h!11581 (_ BitVec 64)) (t!16849 List!10630)) )
))
(declare-fun arrayNoDuplicates!0 (array!34278 (_ BitVec 32) List!10630) Bool)

(assert (=> b!542126 (= res!336824 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10627))))

(declare-fun b!542128 () Bool)

(declare-fun res!336820 () Bool)

(assert (=> b!542128 (=> (not res!336820) (not e!313778))))

(assert (=> b!542128 (= res!336820 (and (= (size!16837 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16837 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16837 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542129 () Bool)

(declare-fun res!336816 () Bool)

(assert (=> b!542129 (=> (not res!336816) (not e!313779))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542129 (= res!336816 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16472 a!3154) j!147) mask!3216) (select (arr!16472 a!3154) j!147) a!3154 mask!3216) lt!247678))))

(declare-fun b!542130 () Bool)

(declare-fun res!336819 () Bool)

(assert (=> b!542130 (=> (not res!336819) (not e!313776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34278 (_ BitVec 32)) Bool)

(assert (=> b!542130 (= res!336819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542131 () Bool)

(declare-fun res!336822 () Bool)

(assert (=> b!542131 (=> (not res!336822) (not e!313778))))

(declare-fun arrayContainsKey!0 (array!34278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542131 (= res!336822 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542132 () Bool)

(assert (=> b!542132 (= e!313779 false)))

(declare-fun lt!247677 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542132 (= lt!247677 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542133 () Bool)

(declare-fun res!336826 () Bool)

(assert (=> b!542133 (=> (not res!336826) (not e!313779))))

(assert (=> b!542133 (= res!336826 (and (not (= (select (arr!16472 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16472 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16472 a!3154) index!1177) (select (arr!16472 a!3154) j!147)))))))

(declare-fun b!542134 () Bool)

(declare-fun res!336825 () Bool)

(assert (=> b!542134 (=> (not res!336825) (not e!313776))))

(assert (=> b!542134 (= res!336825 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16837 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16837 a!3154)) (= (select (arr!16472 a!3154) resIndex!32) (select (arr!16472 a!3154) j!147))))))

(declare-fun b!542127 () Bool)

(declare-fun res!336817 () Bool)

(assert (=> b!542127 (=> (not res!336817) (not e!313778))))

(assert (=> b!542127 (= res!336817 (validKeyInArray!0 k0!1998))))

(declare-fun res!336823 () Bool)

(assert (=> start!49260 (=> (not res!336823) (not e!313778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49260 (= res!336823 (validMask!0 mask!3216))))

(assert (=> start!49260 e!313778))

(assert (=> start!49260 true))

(declare-fun array_inv!12355 (array!34278) Bool)

(assert (=> start!49260 (array_inv!12355 a!3154)))

(assert (= (and start!49260 res!336823) b!542128))

(assert (= (and b!542128 res!336820) b!542124))

(assert (= (and b!542124 res!336827) b!542127))

(assert (= (and b!542127 res!336817) b!542131))

(assert (= (and b!542131 res!336822) b!542123))

(assert (= (and b!542123 res!336821) b!542130))

(assert (= (and b!542130 res!336819) b!542126))

(assert (= (and b!542126 res!336824) b!542134))

(assert (= (and b!542134 res!336825) b!542125))

(assert (= (and b!542125 res!336818) b!542129))

(assert (= (and b!542129 res!336816) b!542133))

(assert (= (and b!542133 res!336826) b!542132))

(declare-fun m!519907 () Bool)

(assert (=> b!542129 m!519907))

(assert (=> b!542129 m!519907))

(declare-fun m!519909 () Bool)

(assert (=> b!542129 m!519909))

(assert (=> b!542129 m!519909))

(assert (=> b!542129 m!519907))

(declare-fun m!519911 () Bool)

(assert (=> b!542129 m!519911))

(declare-fun m!519913 () Bool)

(assert (=> b!542127 m!519913))

(declare-fun m!519915 () Bool)

(assert (=> start!49260 m!519915))

(declare-fun m!519917 () Bool)

(assert (=> start!49260 m!519917))

(assert (=> b!542124 m!519907))

(assert (=> b!542124 m!519907))

(declare-fun m!519919 () Bool)

(assert (=> b!542124 m!519919))

(declare-fun m!519921 () Bool)

(assert (=> b!542123 m!519921))

(declare-fun m!519923 () Bool)

(assert (=> b!542132 m!519923))

(declare-fun m!519925 () Bool)

(assert (=> b!542133 m!519925))

(assert (=> b!542133 m!519907))

(assert (=> b!542125 m!519907))

(assert (=> b!542125 m!519907))

(declare-fun m!519927 () Bool)

(assert (=> b!542125 m!519927))

(declare-fun m!519929 () Bool)

(assert (=> b!542134 m!519929))

(assert (=> b!542134 m!519907))

(declare-fun m!519931 () Bool)

(assert (=> b!542130 m!519931))

(declare-fun m!519933 () Bool)

(assert (=> b!542131 m!519933))

(declare-fun m!519935 () Bool)

(assert (=> b!542126 m!519935))

(check-sat (not b!542130) (not b!542124) (not b!542123) (not start!49260) (not b!542131) (not b!542125) (not b!542126) (not b!542129) (not b!542132) (not b!542127))
(check-sat)
