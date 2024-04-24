; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51456 () Bool)

(assert start!51456)

(declare-fun res!352944 () Bool)

(declare-fun e!323801 () Bool)

(assert (=> start!51456 (=> (not res!352944) (not e!323801))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51456 (= res!352944 (validMask!0 mask!3119))))

(assert (=> start!51456 e!323801))

(assert (=> start!51456 true))

(declare-datatypes ((array!35268 0))(
  ( (array!35269 (arr!16933 (Array (_ BitVec 32) (_ BitVec 64))) (size!17297 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35268)

(declare-fun array_inv!12792 (array!35268) Bool)

(assert (=> start!51456 (array_inv!12792 a!3118)))

(declare-fun b!561886 () Bool)

(declare-fun res!352934 () Bool)

(assert (=> b!561886 (=> (not res!352934) (not e!323801))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561886 (= res!352934 (validKeyInArray!0 k0!1914))))

(declare-fun b!561887 () Bool)

(declare-fun res!352943 () Bool)

(assert (=> b!561887 (=> (not res!352943) (not e!323801))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561887 (= res!352943 (and (= (size!17297 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17297 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17297 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561888 () Bool)

(declare-fun e!323806 () Bool)

(declare-fun e!323803 () Bool)

(assert (=> b!561888 (= e!323806 e!323803)))

(declare-fun res!352936 () Bool)

(assert (=> b!561888 (=> (not res!352936) (not e!323803))))

(declare-fun lt!255794 () array!35268)

(declare-fun lt!255799 () (_ BitVec 32))

(declare-fun lt!255798 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5338 0))(
  ( (MissingZero!5338 (index!23579 (_ BitVec 32))) (Found!5338 (index!23580 (_ BitVec 32))) (Intermediate!5338 (undefined!6150 Bool) (index!23581 (_ BitVec 32)) (x!52636 (_ BitVec 32))) (Undefined!5338) (MissingVacant!5338 (index!23582 (_ BitVec 32))) )
))
(declare-fun lt!255795 () SeekEntryResult!5338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35268 (_ BitVec 32)) SeekEntryResult!5338)

(assert (=> b!561888 (= res!352936 (= lt!255795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255799 lt!255798 lt!255794 mask!3119)))))

(declare-fun lt!255797 () (_ BitVec 32))

(assert (=> b!561888 (= lt!255795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255797 (select (arr!16933 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561888 (= lt!255799 (toIndex!0 lt!255798 mask!3119))))

(assert (=> b!561888 (= lt!255798 (select (store (arr!16933 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561888 (= lt!255797 (toIndex!0 (select (arr!16933 a!3118) j!142) mask!3119))))

(assert (=> b!561888 (= lt!255794 (array!35269 (store (arr!16933 a!3118) i!1132 k0!1914) (size!17297 a!3118)))))

(declare-fun b!561889 () Bool)

(declare-fun res!352941 () Bool)

(assert (=> b!561889 (=> (not res!352941) (not e!323806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35268 (_ BitVec 32)) Bool)

(assert (=> b!561889 (= res!352941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561890 () Bool)

(declare-fun e!323804 () Bool)

(declare-fun e!323808 () Bool)

(assert (=> b!561890 (= e!323804 e!323808)))

(declare-fun res!352933 () Bool)

(assert (=> b!561890 (=> res!352933 e!323808)))

(declare-fun lt!255793 () (_ BitVec 64))

(assert (=> b!561890 (= res!352933 (or (= lt!255793 (select (arr!16933 a!3118) j!142)) (= lt!255793 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561890 (= lt!255793 (select (arr!16933 a!3118) (index!23581 lt!255795)))))

(declare-fun b!561891 () Bool)

(declare-fun res!352940 () Bool)

(assert (=> b!561891 (=> (not res!352940) (not e!323801))))

(declare-fun arrayContainsKey!0 (array!35268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561891 (= res!352940 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561892 () Bool)

(declare-fun e!323805 () Bool)

(assert (=> b!561892 (= e!323805 e!323804)))

(declare-fun res!352938 () Bool)

(assert (=> b!561892 (=> res!352938 e!323804)))

(get-info :version)

(assert (=> b!561892 (= res!352938 (or (undefined!6150 lt!255795) (not ((_ is Intermediate!5338) lt!255795))))))

(declare-fun b!561893 () Bool)

(declare-fun res!352935 () Bool)

(assert (=> b!561893 (=> (not res!352935) (not e!323801))))

(assert (=> b!561893 (= res!352935 (validKeyInArray!0 (select (arr!16933 a!3118) j!142)))))

(declare-fun b!561894 () Bool)

(declare-fun e!323807 () Bool)

(assert (=> b!561894 (= e!323808 e!323807)))

(declare-fun res!352939 () Bool)

(assert (=> b!561894 (=> (not res!352939) (not e!323807))))

(declare-fun lt!255796 () SeekEntryResult!5338)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35268 (_ BitVec 32)) SeekEntryResult!5338)

(assert (=> b!561894 (= res!352939 (= lt!255796 (seekKeyOrZeroReturnVacant!0 (x!52636 lt!255795) (index!23581 lt!255795) (index!23581 lt!255795) (select (arr!16933 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561895 () Bool)

(assert (=> b!561895 (= e!323801 e!323806)))

(declare-fun res!352937 () Bool)

(assert (=> b!561895 (=> (not res!352937) (not e!323806))))

(declare-fun lt!255792 () SeekEntryResult!5338)

(assert (=> b!561895 (= res!352937 (or (= lt!255792 (MissingZero!5338 i!1132)) (= lt!255792 (MissingVacant!5338 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35268 (_ BitVec 32)) SeekEntryResult!5338)

(assert (=> b!561895 (= lt!255792 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561896 () Bool)

(assert (=> b!561896 (= e!323807 (= (seekEntryOrOpen!0 lt!255798 lt!255794 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52636 lt!255795) (index!23581 lt!255795) (index!23581 lt!255795) lt!255798 lt!255794 mask!3119)))))

(declare-fun b!561897 () Bool)

(assert (=> b!561897 (= e!323803 (not true))))

(assert (=> b!561897 e!323805))

(declare-fun res!352942 () Bool)

(assert (=> b!561897 (=> (not res!352942) (not e!323805))))

(assert (=> b!561897 (= res!352942 (= lt!255796 (Found!5338 j!142)))))

(assert (=> b!561897 (= lt!255796 (seekEntryOrOpen!0 (select (arr!16933 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561897 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17521 0))(
  ( (Unit!17522) )
))
(declare-fun lt!255791 () Unit!17521)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17521)

(assert (=> b!561897 (= lt!255791 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561898 () Bool)

(declare-fun res!352945 () Bool)

(assert (=> b!561898 (=> (not res!352945) (not e!323806))))

(declare-datatypes ((List!10920 0))(
  ( (Nil!10917) (Cons!10916 (h!11922 (_ BitVec 64)) (t!17140 List!10920)) )
))
(declare-fun arrayNoDuplicates!0 (array!35268 (_ BitVec 32) List!10920) Bool)

(assert (=> b!561898 (= res!352945 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10917))))

(assert (= (and start!51456 res!352944) b!561887))

(assert (= (and b!561887 res!352943) b!561893))

(assert (= (and b!561893 res!352935) b!561886))

(assert (= (and b!561886 res!352934) b!561891))

(assert (= (and b!561891 res!352940) b!561895))

(assert (= (and b!561895 res!352937) b!561889))

(assert (= (and b!561889 res!352941) b!561898))

(assert (= (and b!561898 res!352945) b!561888))

(assert (= (and b!561888 res!352936) b!561897))

(assert (= (and b!561897 res!352942) b!561892))

(assert (= (and b!561892 (not res!352938)) b!561890))

(assert (= (and b!561890 (not res!352933)) b!561894))

(assert (= (and b!561894 res!352939) b!561896))

(declare-fun m!539951 () Bool)

(assert (=> b!561890 m!539951))

(declare-fun m!539953 () Bool)

(assert (=> b!561890 m!539953))

(assert (=> b!561888 m!539951))

(declare-fun m!539955 () Bool)

(assert (=> b!561888 m!539955))

(assert (=> b!561888 m!539951))

(declare-fun m!539957 () Bool)

(assert (=> b!561888 m!539957))

(assert (=> b!561888 m!539951))

(declare-fun m!539959 () Bool)

(assert (=> b!561888 m!539959))

(declare-fun m!539961 () Bool)

(assert (=> b!561888 m!539961))

(declare-fun m!539963 () Bool)

(assert (=> b!561888 m!539963))

(declare-fun m!539965 () Bool)

(assert (=> b!561888 m!539965))

(declare-fun m!539967 () Bool)

(assert (=> b!561891 m!539967))

(declare-fun m!539969 () Bool)

(assert (=> b!561889 m!539969))

(assert (=> b!561893 m!539951))

(assert (=> b!561893 m!539951))

(declare-fun m!539971 () Bool)

(assert (=> b!561893 m!539971))

(assert (=> b!561897 m!539951))

(assert (=> b!561897 m!539951))

(declare-fun m!539973 () Bool)

(assert (=> b!561897 m!539973))

(declare-fun m!539975 () Bool)

(assert (=> b!561897 m!539975))

(declare-fun m!539977 () Bool)

(assert (=> b!561897 m!539977))

(declare-fun m!539979 () Bool)

(assert (=> b!561898 m!539979))

(assert (=> b!561894 m!539951))

(assert (=> b!561894 m!539951))

(declare-fun m!539981 () Bool)

(assert (=> b!561894 m!539981))

(declare-fun m!539983 () Bool)

(assert (=> start!51456 m!539983))

(declare-fun m!539985 () Bool)

(assert (=> start!51456 m!539985))

(declare-fun m!539987 () Bool)

(assert (=> b!561895 m!539987))

(declare-fun m!539989 () Bool)

(assert (=> b!561896 m!539989))

(declare-fun m!539991 () Bool)

(assert (=> b!561896 m!539991))

(declare-fun m!539993 () Bool)

(assert (=> b!561886 m!539993))

(check-sat (not b!561889) (not b!561897) (not b!561891) (not start!51456) (not b!561893) (not b!561896) (not b!561894) (not b!561886) (not b!561895) (not b!561898) (not b!561888))
(check-sat)
