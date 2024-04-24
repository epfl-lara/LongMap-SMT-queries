; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50688 () Bool)

(assert start!50688)

(declare-fun b!553753 () Bool)

(declare-fun e!319432 () Bool)

(declare-fun e!319434 () Bool)

(assert (=> b!553753 (= e!319432 e!319434)))

(declare-fun res!346060 () Bool)

(assert (=> b!553753 (=> (not res!346060) (not e!319434))))

(declare-datatypes ((SeekEntryResult!5143 0))(
  ( (MissingZero!5143 (index!22799 (_ BitVec 32))) (Found!5143 (index!22800 (_ BitVec 32))) (Intermediate!5143 (undefined!5955 Bool) (index!22801 (_ BitVec 32)) (x!51876 (_ BitVec 32))) (Undefined!5143) (MissingVacant!5143 (index!22802 (_ BitVec 32))) )
))
(declare-fun lt!251629 () SeekEntryResult!5143)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553753 (= res!346060 (or (= lt!251629 (MissingZero!5143 i!1132)) (= lt!251629 (MissingVacant!5143 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34860 0))(
  ( (array!34861 (arr!16738 (Array (_ BitVec 32) (_ BitVec 64))) (size!17102 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34860)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34860 (_ BitVec 32)) SeekEntryResult!5143)

(assert (=> b!553753 (= lt!251629 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553754 () Bool)

(declare-fun res!346066 () Bool)

(assert (=> b!553754 (=> (not res!346066) (not e!319432))))

(declare-fun arrayContainsKey!0 (array!34860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553754 (= res!346066 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553755 () Bool)

(declare-fun res!346063 () Bool)

(assert (=> b!553755 (=> (not res!346063) (not e!319434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34860 (_ BitVec 32)) Bool)

(assert (=> b!553755 (= res!346063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553756 () Bool)

(declare-fun res!346067 () Bool)

(assert (=> b!553756 (=> (not res!346067) (not e!319432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553756 (= res!346067 (validKeyInArray!0 k0!1914))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!553757 () Bool)

(declare-fun e!319430 () Bool)

(assert (=> b!553757 (= e!319430 (= (seekEntryOrOpen!0 (select (arr!16738 a!3118) j!142) a!3118 mask!3119) (Found!5143 j!142)))))

(declare-fun res!346068 () Bool)

(assert (=> start!50688 (=> (not res!346068) (not e!319432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50688 (= res!346068 (validMask!0 mask!3119))))

(assert (=> start!50688 e!319432))

(assert (=> start!50688 true))

(declare-fun array_inv!12597 (array!34860) Bool)

(assert (=> start!50688 (array_inv!12597 a!3118)))

(declare-fun b!553758 () Bool)

(declare-fun res!346069 () Bool)

(assert (=> b!553758 (=> (not res!346069) (not e!319434))))

(declare-datatypes ((List!10725 0))(
  ( (Nil!10722) (Cons!10721 (h!11709 (_ BitVec 64)) (t!16945 List!10725)) )
))
(declare-fun arrayNoDuplicates!0 (array!34860 (_ BitVec 32) List!10725) Bool)

(assert (=> b!553758 (= res!346069 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10722))))

(declare-fun b!553759 () Bool)

(declare-fun e!319431 () Bool)

(assert (=> b!553759 (= e!319434 e!319431)))

(declare-fun res!346061 () Bool)

(assert (=> b!553759 (=> (not res!346061) (not e!319431))))

(declare-fun lt!251627 () (_ BitVec 32))

(declare-fun lt!251626 () SeekEntryResult!5143)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34860 (_ BitVec 32)) SeekEntryResult!5143)

(assert (=> b!553759 (= res!346061 (= lt!251626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251627 (select (store (arr!16738 a!3118) i!1132 k0!1914) j!142) (array!34861 (store (arr!16738 a!3118) i!1132 k0!1914) (size!17102 a!3118)) mask!3119)))))

(declare-fun lt!251628 () (_ BitVec 32))

(assert (=> b!553759 (= lt!251626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251628 (select (arr!16738 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553759 (= lt!251627 (toIndex!0 (select (store (arr!16738 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553759 (= lt!251628 (toIndex!0 (select (arr!16738 a!3118) j!142) mask!3119))))

(declare-fun b!553760 () Bool)

(declare-fun res!346062 () Bool)

(assert (=> b!553760 (=> (not res!346062) (not e!319432))))

(assert (=> b!553760 (= res!346062 (validKeyInArray!0 (select (arr!16738 a!3118) j!142)))))

(declare-fun b!553761 () Bool)

(declare-fun res!346064 () Bool)

(assert (=> b!553761 (=> (not res!346064) (not e!319432))))

(assert (=> b!553761 (= res!346064 (and (= (size!17102 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17102 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17102 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553762 () Bool)

(get-info :version)

(assert (=> b!553762 (= e!319431 (not (or (not ((_ is Intermediate!5143) lt!251626)) (undefined!5955 lt!251626) (not (= (select (arr!16738 a!3118) (index!22801 lt!251626)) (select (arr!16738 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!553762 e!319430))

(declare-fun res!346065 () Bool)

(assert (=> b!553762 (=> (not res!346065) (not e!319430))))

(assert (=> b!553762 (= res!346065 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17131 0))(
  ( (Unit!17132) )
))
(declare-fun lt!251625 () Unit!17131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17131)

(assert (=> b!553762 (= lt!251625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50688 res!346068) b!553761))

(assert (= (and b!553761 res!346064) b!553760))

(assert (= (and b!553760 res!346062) b!553756))

(assert (= (and b!553756 res!346067) b!553754))

(assert (= (and b!553754 res!346066) b!553753))

(assert (= (and b!553753 res!346060) b!553755))

(assert (= (and b!553755 res!346063) b!553758))

(assert (= (and b!553758 res!346069) b!553759))

(assert (= (and b!553759 res!346061) b!553762))

(assert (= (and b!553762 res!346065) b!553757))

(declare-fun m!530993 () Bool)

(assert (=> b!553757 m!530993))

(assert (=> b!553757 m!530993))

(declare-fun m!530995 () Bool)

(assert (=> b!553757 m!530995))

(declare-fun m!530997 () Bool)

(assert (=> b!553754 m!530997))

(declare-fun m!530999 () Bool)

(assert (=> b!553753 m!530999))

(assert (=> b!553759 m!530993))

(declare-fun m!531001 () Bool)

(assert (=> b!553759 m!531001))

(assert (=> b!553759 m!530993))

(declare-fun m!531003 () Bool)

(assert (=> b!553759 m!531003))

(assert (=> b!553759 m!530993))

(declare-fun m!531005 () Bool)

(assert (=> b!553759 m!531005))

(declare-fun m!531007 () Bool)

(assert (=> b!553759 m!531007))

(assert (=> b!553759 m!531005))

(declare-fun m!531009 () Bool)

(assert (=> b!553759 m!531009))

(assert (=> b!553759 m!531005))

(declare-fun m!531011 () Bool)

(assert (=> b!553759 m!531011))

(declare-fun m!531013 () Bool)

(assert (=> b!553758 m!531013))

(declare-fun m!531015 () Bool)

(assert (=> b!553756 m!531015))

(declare-fun m!531017 () Bool)

(assert (=> b!553762 m!531017))

(assert (=> b!553762 m!530993))

(declare-fun m!531019 () Bool)

(assert (=> b!553762 m!531019))

(declare-fun m!531021 () Bool)

(assert (=> b!553762 m!531021))

(assert (=> b!553760 m!530993))

(assert (=> b!553760 m!530993))

(declare-fun m!531023 () Bool)

(assert (=> b!553760 m!531023))

(declare-fun m!531025 () Bool)

(assert (=> b!553755 m!531025))

(declare-fun m!531027 () Bool)

(assert (=> start!50688 m!531027))

(declare-fun m!531029 () Bool)

(assert (=> start!50688 m!531029))

(check-sat (not b!553753) (not b!553755) (not b!553756) (not b!553754) (not b!553760) (not b!553762) (not b!553759) (not start!50688) (not b!553758) (not b!553757))
(check-sat)
