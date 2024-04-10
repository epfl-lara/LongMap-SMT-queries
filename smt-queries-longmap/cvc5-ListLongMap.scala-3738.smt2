; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51422 () Bool)

(assert start!51422)

(declare-fun b!561920 () Bool)

(declare-fun res!353080 () Bool)

(declare-fun e!323822 () Bool)

(assert (=> b!561920 (=> (not res!353080) (not e!323822))))

(declare-datatypes ((array!35287 0))(
  ( (array!35288 (arr!16944 (Array (_ BitVec 32) (_ BitVec 64))) (size!17308 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35287)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561920 (= res!353080 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561921 () Bool)

(declare-fun e!323820 () Bool)

(assert (=> b!561921 (= e!323822 e!323820)))

(declare-fun res!353079 () Bool)

(assert (=> b!561921 (=> (not res!353079) (not e!323820))))

(declare-datatypes ((SeekEntryResult!5393 0))(
  ( (MissingZero!5393 (index!23799 (_ BitVec 32))) (Found!5393 (index!23800 (_ BitVec 32))) (Intermediate!5393 (undefined!6205 Bool) (index!23801 (_ BitVec 32)) (x!52704 (_ BitVec 32))) (Undefined!5393) (MissingVacant!5393 (index!23802 (_ BitVec 32))) )
))
(declare-fun lt!255846 () SeekEntryResult!5393)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561921 (= res!353079 (or (= lt!255846 (MissingZero!5393 i!1132)) (= lt!255846 (MissingVacant!5393 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35287 (_ BitVec 32)) SeekEntryResult!5393)

(assert (=> b!561921 (= lt!255846 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561922 () Bool)

(declare-fun res!353081 () Bool)

(assert (=> b!561922 (=> (not res!353081) (not e!323820))))

(declare-datatypes ((List!11024 0))(
  ( (Nil!11021) (Cons!11020 (h!12023 (_ BitVec 64)) (t!17252 List!11024)) )
))
(declare-fun arrayNoDuplicates!0 (array!35287 (_ BitVec 32) List!11024) Bool)

(assert (=> b!561922 (= res!353081 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11021))))

(declare-fun b!561923 () Bool)

(declare-fun res!353075 () Bool)

(assert (=> b!561923 (=> (not res!353075) (not e!323822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561923 (= res!353075 (validKeyInArray!0 k!1914))))

(declare-fun b!561924 () Bool)

(declare-fun res!353076 () Bool)

(assert (=> b!561924 (=> (not res!353076) (not e!323822))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561924 (= res!353076 (and (= (size!17308 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17308 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17308 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!255848 () array!35287)

(declare-fun lt!255850 () (_ BitVec 64))

(declare-fun b!561925 () Bool)

(declare-fun e!323818 () Bool)

(declare-fun lt!255845 () SeekEntryResult!5393)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35287 (_ BitVec 32)) SeekEntryResult!5393)

(assert (=> b!561925 (= e!323818 (= (seekEntryOrOpen!0 lt!255850 lt!255848 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52704 lt!255845) (index!23801 lt!255845) (index!23801 lt!255845) lt!255850 lt!255848 mask!3119)))))

(declare-fun b!561926 () Bool)

(declare-fun e!323819 () Bool)

(assert (=> b!561926 (= e!323819 e!323818)))

(declare-fun res!353072 () Bool)

(assert (=> b!561926 (=> (not res!353072) (not e!323818))))

(declare-fun lt!255847 () SeekEntryResult!5393)

(assert (=> b!561926 (= res!353072 (= lt!255847 (seekKeyOrZeroReturnVacant!0 (x!52704 lt!255845) (index!23801 lt!255845) (index!23801 lt!255845) (select (arr!16944 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!353082 () Bool)

(assert (=> start!51422 (=> (not res!353082) (not e!323822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51422 (= res!353082 (validMask!0 mask!3119))))

(assert (=> start!51422 e!323822))

(assert (=> start!51422 true))

(declare-fun array_inv!12740 (array!35287) Bool)

(assert (=> start!51422 (array_inv!12740 a!3118)))

(declare-fun b!561927 () Bool)

(declare-fun e!323817 () Bool)

(assert (=> b!561927 (= e!323817 (not true))))

(declare-fun e!323816 () Bool)

(assert (=> b!561927 e!323816))

(declare-fun res!353078 () Bool)

(assert (=> b!561927 (=> (not res!353078) (not e!323816))))

(assert (=> b!561927 (= res!353078 (= lt!255847 (Found!5393 j!142)))))

(assert (=> b!561927 (= lt!255847 (seekEntryOrOpen!0 (select (arr!16944 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35287 (_ BitVec 32)) Bool)

(assert (=> b!561927 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17560 0))(
  ( (Unit!17561) )
))
(declare-fun lt!255842 () Unit!17560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17560)

(assert (=> b!561927 (= lt!255842 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561928 () Bool)

(declare-fun res!353084 () Bool)

(assert (=> b!561928 (=> (not res!353084) (not e!323820))))

(assert (=> b!561928 (= res!353084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561929 () Bool)

(declare-fun e!323821 () Bool)

(assert (=> b!561929 (= e!323816 e!323821)))

(declare-fun res!353077 () Bool)

(assert (=> b!561929 (=> res!353077 e!323821)))

(assert (=> b!561929 (= res!353077 (or (undefined!6205 lt!255845) (not (is-Intermediate!5393 lt!255845))))))

(declare-fun b!561930 () Bool)

(assert (=> b!561930 (= e!323820 e!323817)))

(declare-fun res!353073 () Bool)

(assert (=> b!561930 (=> (not res!353073) (not e!323817))))

(declare-fun lt!255843 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35287 (_ BitVec 32)) SeekEntryResult!5393)

(assert (=> b!561930 (= res!353073 (= lt!255845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255843 lt!255850 lt!255848 mask!3119)))))

(declare-fun lt!255849 () (_ BitVec 32))

(assert (=> b!561930 (= lt!255845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255849 (select (arr!16944 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561930 (= lt!255843 (toIndex!0 lt!255850 mask!3119))))

(assert (=> b!561930 (= lt!255850 (select (store (arr!16944 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561930 (= lt!255849 (toIndex!0 (select (arr!16944 a!3118) j!142) mask!3119))))

(assert (=> b!561930 (= lt!255848 (array!35288 (store (arr!16944 a!3118) i!1132 k!1914) (size!17308 a!3118)))))

(declare-fun b!561931 () Bool)

(assert (=> b!561931 (= e!323821 e!323819)))

(declare-fun res!353074 () Bool)

(assert (=> b!561931 (=> res!353074 e!323819)))

(declare-fun lt!255844 () (_ BitVec 64))

(assert (=> b!561931 (= res!353074 (or (= lt!255844 (select (arr!16944 a!3118) j!142)) (= lt!255844 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561931 (= lt!255844 (select (arr!16944 a!3118) (index!23801 lt!255845)))))

(declare-fun b!561932 () Bool)

(declare-fun res!353083 () Bool)

(assert (=> b!561932 (=> (not res!353083) (not e!323822))))

(assert (=> b!561932 (= res!353083 (validKeyInArray!0 (select (arr!16944 a!3118) j!142)))))

(assert (= (and start!51422 res!353082) b!561924))

(assert (= (and b!561924 res!353076) b!561932))

(assert (= (and b!561932 res!353083) b!561923))

(assert (= (and b!561923 res!353075) b!561920))

(assert (= (and b!561920 res!353080) b!561921))

(assert (= (and b!561921 res!353079) b!561928))

(assert (= (and b!561928 res!353084) b!561922))

(assert (= (and b!561922 res!353081) b!561930))

(assert (= (and b!561930 res!353073) b!561927))

(assert (= (and b!561927 res!353078) b!561929))

(assert (= (and b!561929 (not res!353077)) b!561931))

(assert (= (and b!561931 (not res!353074)) b!561926))

(assert (= (and b!561926 res!353072) b!561925))

(declare-fun m!539877 () Bool)

(assert (=> b!561920 m!539877))

(declare-fun m!539879 () Bool)

(assert (=> b!561932 m!539879))

(assert (=> b!561932 m!539879))

(declare-fun m!539881 () Bool)

(assert (=> b!561932 m!539881))

(assert (=> b!561931 m!539879))

(declare-fun m!539883 () Bool)

(assert (=> b!561931 m!539883))

(assert (=> b!561926 m!539879))

(assert (=> b!561926 m!539879))

(declare-fun m!539885 () Bool)

(assert (=> b!561926 m!539885))

(declare-fun m!539887 () Bool)

(assert (=> b!561930 m!539887))

(assert (=> b!561930 m!539879))

(declare-fun m!539889 () Bool)

(assert (=> b!561930 m!539889))

(declare-fun m!539891 () Bool)

(assert (=> b!561930 m!539891))

(assert (=> b!561930 m!539879))

(declare-fun m!539893 () Bool)

(assert (=> b!561930 m!539893))

(assert (=> b!561930 m!539879))

(declare-fun m!539895 () Bool)

(assert (=> b!561930 m!539895))

(declare-fun m!539897 () Bool)

(assert (=> b!561930 m!539897))

(declare-fun m!539899 () Bool)

(assert (=> b!561925 m!539899))

(declare-fun m!539901 () Bool)

(assert (=> b!561925 m!539901))

(declare-fun m!539903 () Bool)

(assert (=> b!561923 m!539903))

(declare-fun m!539905 () Bool)

(assert (=> start!51422 m!539905))

(declare-fun m!539907 () Bool)

(assert (=> start!51422 m!539907))

(declare-fun m!539909 () Bool)

(assert (=> b!561928 m!539909))

(declare-fun m!539911 () Bool)

(assert (=> b!561922 m!539911))

(declare-fun m!539913 () Bool)

(assert (=> b!561921 m!539913))

(assert (=> b!561927 m!539879))

(assert (=> b!561927 m!539879))

(declare-fun m!539915 () Bool)

(assert (=> b!561927 m!539915))

(declare-fun m!539917 () Bool)

(assert (=> b!561927 m!539917))

(declare-fun m!539919 () Bool)

(assert (=> b!561927 m!539919))

(push 1)

