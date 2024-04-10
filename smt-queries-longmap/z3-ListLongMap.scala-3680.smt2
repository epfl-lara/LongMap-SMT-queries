; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50698 () Bool)

(assert start!50698)

(declare-fun b!554402 () Bool)

(declare-fun res!346823 () Bool)

(declare-fun e!319682 () Bool)

(assert (=> b!554402 (=> (not res!346823) (not e!319682))))

(declare-datatypes ((array!34923 0))(
  ( (array!34924 (arr!16771 (Array (_ BitVec 32) (_ BitVec 64))) (size!17135 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34923)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554402 (= res!346823 (validKeyInArray!0 (select (arr!16771 a!3118) j!142)))))

(declare-fun b!554403 () Bool)

(declare-fun res!346818 () Bool)

(assert (=> b!554403 (=> (not res!346818) (not e!319682))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554403 (= res!346818 (and (= (size!17135 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17135 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17135 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!346819 () Bool)

(assert (=> start!50698 (=> (not res!346819) (not e!319682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50698 (= res!346819 (validMask!0 mask!3119))))

(assert (=> start!50698 e!319682))

(assert (=> start!50698 true))

(declare-fun array_inv!12567 (array!34923) Bool)

(assert (=> start!50698 (array_inv!12567 a!3118)))

(declare-fun b!554404 () Bool)

(declare-fun e!319681 () Bool)

(assert (=> b!554404 (= e!319681 (not true))))

(declare-fun e!319683 () Bool)

(assert (=> b!554404 e!319683))

(declare-fun res!346821 () Bool)

(assert (=> b!554404 (=> (not res!346821) (not e!319683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34923 (_ BitVec 32)) Bool)

(assert (=> b!554404 (= res!346821 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17214 0))(
  ( (Unit!17215) )
))
(declare-fun lt!251784 () Unit!17214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17214)

(assert (=> b!554404 (= lt!251784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554405 () Bool)

(declare-fun res!346814 () Bool)

(assert (=> b!554405 (=> (not res!346814) (not e!319682))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554405 (= res!346814 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554406 () Bool)

(declare-fun res!346816 () Bool)

(assert (=> b!554406 (=> (not res!346816) (not e!319681))))

(declare-datatypes ((SeekEntryResult!5220 0))(
  ( (MissingZero!5220 (index!23107 (_ BitVec 32))) (Found!5220 (index!23108 (_ BitVec 32))) (Intermediate!5220 (undefined!6032 Bool) (index!23109 (_ BitVec 32)) (x!52022 (_ BitVec 32))) (Undefined!5220) (MissingVacant!5220 (index!23110 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34923 (_ BitVec 32)) SeekEntryResult!5220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554406 (= res!346816 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16771 a!3118) j!142) mask!3119) (select (arr!16771 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16771 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16771 a!3118) i!1132 k0!1914) j!142) (array!34924 (store (arr!16771 a!3118) i!1132 k0!1914) (size!17135 a!3118)) mask!3119)))))

(declare-fun b!554407 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34923 (_ BitVec 32)) SeekEntryResult!5220)

(assert (=> b!554407 (= e!319683 (= (seekEntryOrOpen!0 (select (arr!16771 a!3118) j!142) a!3118 mask!3119) (Found!5220 j!142)))))

(declare-fun b!554408 () Bool)

(declare-fun res!346817 () Bool)

(assert (=> b!554408 (=> (not res!346817) (not e!319682))))

(assert (=> b!554408 (= res!346817 (validKeyInArray!0 k0!1914))))

(declare-fun b!554409 () Bool)

(declare-fun res!346822 () Bool)

(assert (=> b!554409 (=> (not res!346822) (not e!319681))))

(assert (=> b!554409 (= res!346822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554410 () Bool)

(declare-fun res!346820 () Bool)

(assert (=> b!554410 (=> (not res!346820) (not e!319681))))

(declare-datatypes ((List!10851 0))(
  ( (Nil!10848) (Cons!10847 (h!11832 (_ BitVec 64)) (t!17079 List!10851)) )
))
(declare-fun arrayNoDuplicates!0 (array!34923 (_ BitVec 32) List!10851) Bool)

(assert (=> b!554410 (= res!346820 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10848))))

(declare-fun b!554411 () Bool)

(assert (=> b!554411 (= e!319682 e!319681)))

(declare-fun res!346815 () Bool)

(assert (=> b!554411 (=> (not res!346815) (not e!319681))))

(declare-fun lt!251785 () SeekEntryResult!5220)

(assert (=> b!554411 (= res!346815 (or (= lt!251785 (MissingZero!5220 i!1132)) (= lt!251785 (MissingVacant!5220 i!1132))))))

(assert (=> b!554411 (= lt!251785 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50698 res!346819) b!554403))

(assert (= (and b!554403 res!346818) b!554402))

(assert (= (and b!554402 res!346823) b!554408))

(assert (= (and b!554408 res!346817) b!554405))

(assert (= (and b!554405 res!346814) b!554411))

(assert (= (and b!554411 res!346815) b!554409))

(assert (= (and b!554409 res!346822) b!554410))

(assert (= (and b!554410 res!346820) b!554406))

(assert (= (and b!554406 res!346816) b!554404))

(assert (= (and b!554404 res!346821) b!554407))

(declare-fun m!531693 () Bool)

(assert (=> b!554404 m!531693))

(declare-fun m!531695 () Bool)

(assert (=> b!554404 m!531695))

(declare-fun m!531697 () Bool)

(assert (=> b!554402 m!531697))

(assert (=> b!554402 m!531697))

(declare-fun m!531699 () Bool)

(assert (=> b!554402 m!531699))

(declare-fun m!531701 () Bool)

(assert (=> b!554408 m!531701))

(declare-fun m!531703 () Bool)

(assert (=> b!554405 m!531703))

(assert (=> b!554407 m!531697))

(assert (=> b!554407 m!531697))

(declare-fun m!531705 () Bool)

(assert (=> b!554407 m!531705))

(declare-fun m!531707 () Bool)

(assert (=> b!554409 m!531707))

(declare-fun m!531709 () Bool)

(assert (=> b!554410 m!531709))

(assert (=> b!554406 m!531697))

(declare-fun m!531711 () Bool)

(assert (=> b!554406 m!531711))

(assert (=> b!554406 m!531697))

(declare-fun m!531713 () Bool)

(assert (=> b!554406 m!531713))

(declare-fun m!531715 () Bool)

(assert (=> b!554406 m!531715))

(assert (=> b!554406 m!531713))

(declare-fun m!531717 () Bool)

(assert (=> b!554406 m!531717))

(assert (=> b!554406 m!531711))

(assert (=> b!554406 m!531697))

(declare-fun m!531719 () Bool)

(assert (=> b!554406 m!531719))

(declare-fun m!531721 () Bool)

(assert (=> b!554406 m!531721))

(assert (=> b!554406 m!531713))

(assert (=> b!554406 m!531715))

(declare-fun m!531723 () Bool)

(assert (=> b!554411 m!531723))

(declare-fun m!531725 () Bool)

(assert (=> start!50698 m!531725))

(declare-fun m!531727 () Bool)

(assert (=> start!50698 m!531727))

(check-sat (not b!554402) (not b!554406) (not b!554411) (not b!554408) (not b!554407) (not b!554405) (not b!554404) (not b!554410) (not start!50698) (not b!554409))
(check-sat)
