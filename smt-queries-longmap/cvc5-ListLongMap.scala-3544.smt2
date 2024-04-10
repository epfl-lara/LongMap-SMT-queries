; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48834 () Bool)

(assert start!48834)

(declare-fun b!537743 () Bool)

(declare-fun e!311918 () Bool)

(declare-fun e!311919 () Bool)

(assert (=> b!537743 (= e!311918 e!311919)))

(declare-fun res!332950 () Bool)

(assert (=> b!537743 (=> (not res!332950) (not e!311919))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4820 0))(
  ( (MissingZero!4820 (index!21504 (_ BitVec 32))) (Found!4820 (index!21505 (_ BitVec 32))) (Intermediate!4820 (undefined!5632 Bool) (index!21506 (_ BitVec 32)) (x!50435 (_ BitVec 32))) (Undefined!4820) (MissingVacant!4820 (index!21507 (_ BitVec 32))) )
))
(declare-fun lt!246496 () SeekEntryResult!4820)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537743 (= res!332950 (= lt!246496 (Intermediate!4820 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!34046 0))(
  ( (array!34047 (arr!16362 (Array (_ BitVec 32) (_ BitVec 64))) (size!16726 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34046)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34046 (_ BitVec 32)) SeekEntryResult!4820)

(assert (=> b!537743 (= lt!246496 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16362 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537744 () Bool)

(declare-fun e!311917 () Bool)

(assert (=> b!537744 (= e!311917 false)))

(declare-fun lt!246499 () (_ BitVec 32))

(declare-fun lt!246498 () SeekEntryResult!4820)

(assert (=> b!537744 (= lt!246498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246499 (select (arr!16362 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537745 () Bool)

(declare-fun res!332958 () Bool)

(declare-fun e!311915 () Bool)

(assert (=> b!537745 (=> (not res!332958) (not e!311915))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537745 (= res!332958 (and (= (size!16726 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16726 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16726 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537747 () Bool)

(declare-fun res!332953 () Bool)

(assert (=> b!537747 (=> (not res!332953) (not e!311915))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537747 (= res!332953 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537748 () Bool)

(assert (=> b!537748 (= e!311915 e!311918)))

(declare-fun res!332959 () Bool)

(assert (=> b!537748 (=> (not res!332959) (not e!311918))))

(declare-fun lt!246497 () SeekEntryResult!4820)

(assert (=> b!537748 (= res!332959 (or (= lt!246497 (MissingZero!4820 i!1153)) (= lt!246497 (MissingVacant!4820 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34046 (_ BitVec 32)) SeekEntryResult!4820)

(assert (=> b!537748 (= lt!246497 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537749 () Bool)

(declare-fun res!332948 () Bool)

(assert (=> b!537749 (=> (not res!332948) (not e!311918))))

(declare-datatypes ((List!10481 0))(
  ( (Nil!10478) (Cons!10477 (h!11420 (_ BitVec 64)) (t!16709 List!10481)) )
))
(declare-fun arrayNoDuplicates!0 (array!34046 (_ BitVec 32) List!10481) Bool)

(assert (=> b!537749 (= res!332948 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10478))))

(declare-fun b!537750 () Bool)

(declare-fun res!332952 () Bool)

(assert (=> b!537750 (=> (not res!332952) (not e!311918))))

(assert (=> b!537750 (= res!332952 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16726 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16726 a!3154)) (= (select (arr!16362 a!3154) resIndex!32) (select (arr!16362 a!3154) j!147))))))

(declare-fun b!537751 () Bool)

(assert (=> b!537751 (= e!311919 e!311917)))

(declare-fun res!332949 () Bool)

(assert (=> b!537751 (=> (not res!332949) (not e!311917))))

(assert (=> b!537751 (= res!332949 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246499 #b00000000000000000000000000000000) (bvslt lt!246499 (size!16726 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537751 (= lt!246499 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537752 () Bool)

(declare-fun res!332951 () Bool)

(assert (=> b!537752 (=> (not res!332951) (not e!311919))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537752 (= res!332951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16362 a!3154) j!147) mask!3216) (select (arr!16362 a!3154) j!147) a!3154 mask!3216) lt!246496))))

(declare-fun b!537753 () Bool)

(declare-fun res!332957 () Bool)

(assert (=> b!537753 (=> (not res!332957) (not e!311915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537753 (= res!332957 (validKeyInArray!0 k!1998))))

(declare-fun b!537754 () Bool)

(declare-fun res!332954 () Bool)

(assert (=> b!537754 (=> (not res!332954) (not e!311919))))

(assert (=> b!537754 (= res!332954 (and (not (= (select (arr!16362 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16362 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16362 a!3154) index!1177) (select (arr!16362 a!3154) j!147)))))))

(declare-fun b!537755 () Bool)

(declare-fun res!332955 () Bool)

(assert (=> b!537755 (=> (not res!332955) (not e!311915))))

(assert (=> b!537755 (= res!332955 (validKeyInArray!0 (select (arr!16362 a!3154) j!147)))))

(declare-fun res!332956 () Bool)

(assert (=> start!48834 (=> (not res!332956) (not e!311915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48834 (= res!332956 (validMask!0 mask!3216))))

(assert (=> start!48834 e!311915))

(assert (=> start!48834 true))

(declare-fun array_inv!12158 (array!34046) Bool)

(assert (=> start!48834 (array_inv!12158 a!3154)))

(declare-fun b!537746 () Bool)

(declare-fun res!332960 () Bool)

(assert (=> b!537746 (=> (not res!332960) (not e!311918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34046 (_ BitVec 32)) Bool)

(assert (=> b!537746 (= res!332960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48834 res!332956) b!537745))

(assert (= (and b!537745 res!332958) b!537755))

(assert (= (and b!537755 res!332955) b!537753))

(assert (= (and b!537753 res!332957) b!537747))

(assert (= (and b!537747 res!332953) b!537748))

(assert (= (and b!537748 res!332959) b!537746))

(assert (= (and b!537746 res!332960) b!537749))

(assert (= (and b!537749 res!332948) b!537750))

(assert (= (and b!537750 res!332952) b!537743))

(assert (= (and b!537743 res!332950) b!537752))

(assert (= (and b!537752 res!332951) b!537754))

(assert (= (and b!537754 res!332954) b!537751))

(assert (= (and b!537751 res!332949) b!537744))

(declare-fun m!516921 () Bool)

(assert (=> b!537746 m!516921))

(declare-fun m!516923 () Bool)

(assert (=> b!537755 m!516923))

(assert (=> b!537755 m!516923))

(declare-fun m!516925 () Bool)

(assert (=> b!537755 m!516925))

(declare-fun m!516927 () Bool)

(assert (=> b!537750 m!516927))

(assert (=> b!537750 m!516923))

(declare-fun m!516929 () Bool)

(assert (=> b!537749 m!516929))

(assert (=> b!537744 m!516923))

(assert (=> b!537744 m!516923))

(declare-fun m!516931 () Bool)

(assert (=> b!537744 m!516931))

(declare-fun m!516933 () Bool)

(assert (=> b!537751 m!516933))

(declare-fun m!516935 () Bool)

(assert (=> b!537748 m!516935))

(declare-fun m!516937 () Bool)

(assert (=> start!48834 m!516937))

(declare-fun m!516939 () Bool)

(assert (=> start!48834 m!516939))

(declare-fun m!516941 () Bool)

(assert (=> b!537754 m!516941))

(assert (=> b!537754 m!516923))

(assert (=> b!537752 m!516923))

(assert (=> b!537752 m!516923))

(declare-fun m!516943 () Bool)

(assert (=> b!537752 m!516943))

(assert (=> b!537752 m!516943))

(assert (=> b!537752 m!516923))

(declare-fun m!516945 () Bool)

(assert (=> b!537752 m!516945))

(declare-fun m!516947 () Bool)

(assert (=> b!537753 m!516947))

(declare-fun m!516949 () Bool)

(assert (=> b!537747 m!516949))

(assert (=> b!537743 m!516923))

(assert (=> b!537743 m!516923))

(declare-fun m!516951 () Bool)

(assert (=> b!537743 m!516951))

(push 1)

