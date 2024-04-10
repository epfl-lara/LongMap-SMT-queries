; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51416 () Bool)

(assert start!51416)

(declare-fun res!352963 () Bool)

(declare-fun e!323748 () Bool)

(assert (=> start!51416 (=> (not res!352963) (not e!323748))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51416 (= res!352963 (validMask!0 mask!3119))))

(assert (=> start!51416 e!323748))

(assert (=> start!51416 true))

(declare-datatypes ((array!35281 0))(
  ( (array!35282 (arr!16941 (Array (_ BitVec 32) (_ BitVec 64))) (size!17305 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35281)

(declare-fun array_inv!12737 (array!35281) Bool)

(assert (=> start!51416 (array_inv!12737 a!3118)))

(declare-fun b!561803 () Bool)

(declare-fun e!323745 () Bool)

(declare-fun e!323749 () Bool)

(assert (=> b!561803 (= e!323745 e!323749)))

(declare-fun res!352967 () Bool)

(assert (=> b!561803 (=> (not res!352967) (not e!323749))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5390 0))(
  ( (MissingZero!5390 (index!23787 (_ BitVec 32))) (Found!5390 (index!23788 (_ BitVec 32))) (Intermediate!5390 (undefined!6202 Bool) (index!23789 (_ BitVec 32)) (x!52693 (_ BitVec 32))) (Undefined!5390) (MissingVacant!5390 (index!23790 (_ BitVec 32))) )
))
(declare-fun lt!255761 () SeekEntryResult!5390)

(declare-fun lt!255769 () SeekEntryResult!5390)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35281 (_ BitVec 32)) SeekEntryResult!5390)

(assert (=> b!561803 (= res!352967 (= lt!255769 (seekKeyOrZeroReturnVacant!0 (x!52693 lt!255761) (index!23789 lt!255761) (index!23789 lt!255761) (select (arr!16941 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561804 () Bool)

(declare-fun res!352960 () Bool)

(assert (=> b!561804 (=> (not res!352960) (not e!323748))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561804 (= res!352960 (and (= (size!17305 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17305 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17305 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561805 () Bool)

(declare-fun res!352961 () Bool)

(assert (=> b!561805 (=> (not res!352961) (not e!323748))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561805 (= res!352961 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561806 () Bool)

(declare-fun res!352957 () Bool)

(assert (=> b!561806 (=> (not res!352957) (not e!323748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561806 (= res!352957 (validKeyInArray!0 k!1914))))

(declare-fun b!561807 () Bool)

(declare-fun e!323744 () Bool)

(assert (=> b!561807 (= e!323744 (not true))))

(declare-fun e!323750 () Bool)

(assert (=> b!561807 e!323750))

(declare-fun res!352959 () Bool)

(assert (=> b!561807 (=> (not res!352959) (not e!323750))))

(assert (=> b!561807 (= res!352959 (= lt!255769 (Found!5390 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35281 (_ BitVec 32)) SeekEntryResult!5390)

(assert (=> b!561807 (= lt!255769 (seekEntryOrOpen!0 (select (arr!16941 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35281 (_ BitVec 32)) Bool)

(assert (=> b!561807 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17554 0))(
  ( (Unit!17555) )
))
(declare-fun lt!255767 () Unit!17554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17554)

(assert (=> b!561807 (= lt!255767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561808 () Bool)

(declare-fun e!323746 () Bool)

(assert (=> b!561808 (= e!323748 e!323746)))

(declare-fun res!352958 () Bool)

(assert (=> b!561808 (=> (not res!352958) (not e!323746))))

(declare-fun lt!255768 () SeekEntryResult!5390)

(assert (=> b!561808 (= res!352958 (or (= lt!255768 (MissingZero!5390 i!1132)) (= lt!255768 (MissingVacant!5390 i!1132))))))

(assert (=> b!561808 (= lt!255768 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561809 () Bool)

(declare-fun e!323751 () Bool)

(assert (=> b!561809 (= e!323751 e!323745)))

(declare-fun res!352966 () Bool)

(assert (=> b!561809 (=> res!352966 e!323745)))

(declare-fun lt!255765 () (_ BitVec 64))

(assert (=> b!561809 (= res!352966 (or (= lt!255765 (select (arr!16941 a!3118) j!142)) (= lt!255765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561809 (= lt!255765 (select (arr!16941 a!3118) (index!23789 lt!255761)))))

(declare-fun b!561810 () Bool)

(declare-fun res!352955 () Bool)

(assert (=> b!561810 (=> (not res!352955) (not e!323748))))

(assert (=> b!561810 (= res!352955 (validKeyInArray!0 (select (arr!16941 a!3118) j!142)))))

(declare-fun b!561811 () Bool)

(declare-fun res!352964 () Bool)

(assert (=> b!561811 (=> (not res!352964) (not e!323746))))

(declare-datatypes ((List!11021 0))(
  ( (Nil!11018) (Cons!11017 (h!12020 (_ BitVec 64)) (t!17249 List!11021)) )
))
(declare-fun arrayNoDuplicates!0 (array!35281 (_ BitVec 32) List!11021) Bool)

(assert (=> b!561811 (= res!352964 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11018))))

(declare-fun lt!255762 () array!35281)

(declare-fun b!561812 () Bool)

(declare-fun lt!255766 () (_ BitVec 64))

(assert (=> b!561812 (= e!323749 (= (seekEntryOrOpen!0 lt!255766 lt!255762 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52693 lt!255761) (index!23789 lt!255761) (index!23789 lt!255761) lt!255766 lt!255762 mask!3119)))))

(declare-fun b!561813 () Bool)

(declare-fun res!352962 () Bool)

(assert (=> b!561813 (=> (not res!352962) (not e!323746))))

(assert (=> b!561813 (= res!352962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561814 () Bool)

(assert (=> b!561814 (= e!323746 e!323744)))

(declare-fun res!352965 () Bool)

(assert (=> b!561814 (=> (not res!352965) (not e!323744))))

(declare-fun lt!255763 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35281 (_ BitVec 32)) SeekEntryResult!5390)

(assert (=> b!561814 (= res!352965 (= lt!255761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255763 lt!255766 lt!255762 mask!3119)))))

(declare-fun lt!255764 () (_ BitVec 32))

(assert (=> b!561814 (= lt!255761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255764 (select (arr!16941 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561814 (= lt!255763 (toIndex!0 lt!255766 mask!3119))))

(assert (=> b!561814 (= lt!255766 (select (store (arr!16941 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561814 (= lt!255764 (toIndex!0 (select (arr!16941 a!3118) j!142) mask!3119))))

(assert (=> b!561814 (= lt!255762 (array!35282 (store (arr!16941 a!3118) i!1132 k!1914) (size!17305 a!3118)))))

(declare-fun b!561815 () Bool)

(assert (=> b!561815 (= e!323750 e!323751)))

(declare-fun res!352956 () Bool)

(assert (=> b!561815 (=> res!352956 e!323751)))

(assert (=> b!561815 (= res!352956 (or (undefined!6202 lt!255761) (not (is-Intermediate!5390 lt!255761))))))

(assert (= (and start!51416 res!352963) b!561804))

(assert (= (and b!561804 res!352960) b!561810))

(assert (= (and b!561810 res!352955) b!561806))

(assert (= (and b!561806 res!352957) b!561805))

(assert (= (and b!561805 res!352961) b!561808))

(assert (= (and b!561808 res!352958) b!561813))

(assert (= (and b!561813 res!352962) b!561811))

(assert (= (and b!561811 res!352964) b!561814))

(assert (= (and b!561814 res!352965) b!561807))

(assert (= (and b!561807 res!352959) b!561815))

(assert (= (and b!561815 (not res!352956)) b!561809))

(assert (= (and b!561809 (not res!352966)) b!561803))

(assert (= (and b!561803 res!352967) b!561812))

(declare-fun m!539745 () Bool)

(assert (=> b!561813 m!539745))

(declare-fun m!539747 () Bool)

(assert (=> b!561811 m!539747))

(declare-fun m!539749 () Bool)

(assert (=> b!561807 m!539749))

(assert (=> b!561807 m!539749))

(declare-fun m!539751 () Bool)

(assert (=> b!561807 m!539751))

(declare-fun m!539753 () Bool)

(assert (=> b!561807 m!539753))

(declare-fun m!539755 () Bool)

(assert (=> b!561807 m!539755))

(declare-fun m!539757 () Bool)

(assert (=> b!561808 m!539757))

(assert (=> b!561803 m!539749))

(assert (=> b!561803 m!539749))

(declare-fun m!539759 () Bool)

(assert (=> b!561803 m!539759))

(assert (=> b!561809 m!539749))

(declare-fun m!539761 () Bool)

(assert (=> b!561809 m!539761))

(declare-fun m!539763 () Bool)

(assert (=> b!561806 m!539763))

(assert (=> b!561810 m!539749))

(assert (=> b!561810 m!539749))

(declare-fun m!539765 () Bool)

(assert (=> b!561810 m!539765))

(assert (=> b!561814 m!539749))

(declare-fun m!539767 () Bool)

(assert (=> b!561814 m!539767))

(assert (=> b!561814 m!539749))

(declare-fun m!539769 () Bool)

(assert (=> b!561814 m!539769))

(declare-fun m!539771 () Bool)

(assert (=> b!561814 m!539771))

(declare-fun m!539773 () Bool)

(assert (=> b!561814 m!539773))

(assert (=> b!561814 m!539749))

(declare-fun m!539775 () Bool)

(assert (=> b!561814 m!539775))

(declare-fun m!539777 () Bool)

(assert (=> b!561814 m!539777))

(declare-fun m!539779 () Bool)

(assert (=> start!51416 m!539779))

(declare-fun m!539781 () Bool)

(assert (=> start!51416 m!539781))

(declare-fun m!539783 () Bool)

(assert (=> b!561805 m!539783))

(declare-fun m!539785 () Bool)

(assert (=> b!561812 m!539785))

(declare-fun m!539787 () Bool)

(assert (=> b!561812 m!539787))

(push 1)

