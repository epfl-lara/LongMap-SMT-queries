; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51426 () Bool)

(assert start!51426)

(declare-fun b!561998 () Bool)

(declare-fun e!323868 () Bool)

(declare-fun e!323869 () Bool)

(assert (=> b!561998 (= e!323868 e!323869)))

(declare-fun res!353157 () Bool)

(assert (=> b!561998 (=> (not res!353157) (not e!323869))))

(declare-datatypes ((SeekEntryResult!5395 0))(
  ( (MissingZero!5395 (index!23807 (_ BitVec 32))) (Found!5395 (index!23808 (_ BitVec 32))) (Intermediate!5395 (undefined!6207 Bool) (index!23809 (_ BitVec 32)) (x!52706 (_ BitVec 32))) (Undefined!5395) (MissingVacant!5395 (index!23810 (_ BitVec 32))) )
))
(declare-fun lt!255904 () SeekEntryResult!5395)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561998 (= res!353157 (or (= lt!255904 (MissingZero!5395 i!1132)) (= lt!255904 (MissingVacant!5395 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35291 0))(
  ( (array!35292 (arr!16946 (Array (_ BitVec 32) (_ BitVec 64))) (size!17310 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35291)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35291 (_ BitVec 32)) SeekEntryResult!5395)

(assert (=> b!561998 (= lt!255904 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561999 () Bool)

(declare-fun e!323866 () Bool)

(declare-fun e!323871 () Bool)

(assert (=> b!561999 (= e!323866 e!323871)))

(declare-fun res!353162 () Bool)

(assert (=> b!561999 (=> (not res!353162) (not e!323871))))

(declare-fun lt!255900 () SeekEntryResult!5395)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255901 () SeekEntryResult!5395)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35291 (_ BitVec 32)) SeekEntryResult!5395)

(assert (=> b!561999 (= res!353162 (= lt!255900 (seekKeyOrZeroReturnVacant!0 (x!52706 lt!255901) (index!23809 lt!255901) (index!23809 lt!255901) (select (arr!16946 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562000 () Bool)

(declare-fun res!353154 () Bool)

(assert (=> b!562000 (=> (not res!353154) (not e!323868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562000 (= res!353154 (validKeyInArray!0 k!1914))))

(declare-fun b!562001 () Bool)

(declare-fun res!353161 () Bool)

(assert (=> b!562001 (=> (not res!353161) (not e!323869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35291 (_ BitVec 32)) Bool)

(assert (=> b!562001 (= res!353161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562002 () Bool)

(declare-fun e!323864 () Bool)

(assert (=> b!562002 (= e!323864 (not true))))

(declare-fun e!323870 () Bool)

(assert (=> b!562002 e!323870))

(declare-fun res!353156 () Bool)

(assert (=> b!562002 (=> (not res!353156) (not e!323870))))

(assert (=> b!562002 (= res!353156 (= lt!255900 (Found!5395 j!142)))))

(assert (=> b!562002 (= lt!255900 (seekEntryOrOpen!0 (select (arr!16946 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562002 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17564 0))(
  ( (Unit!17565) )
))
(declare-fun lt!255899 () Unit!17564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17564)

(assert (=> b!562002 (= lt!255899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562003 () Bool)

(declare-fun res!353150 () Bool)

(assert (=> b!562003 (=> (not res!353150) (not e!323868))))

(assert (=> b!562003 (= res!353150 (validKeyInArray!0 (select (arr!16946 a!3118) j!142)))))

(declare-fun b!562004 () Bool)

(declare-fun e!323867 () Bool)

(assert (=> b!562004 (= e!323867 e!323866)))

(declare-fun res!353155 () Bool)

(assert (=> b!562004 (=> res!353155 e!323866)))

(declare-fun lt!255902 () (_ BitVec 64))

(assert (=> b!562004 (= res!353155 (or (= lt!255902 (select (arr!16946 a!3118) j!142)) (= lt!255902 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562004 (= lt!255902 (select (arr!16946 a!3118) (index!23809 lt!255901)))))

(declare-fun res!353151 () Bool)

(assert (=> start!51426 (=> (not res!353151) (not e!323868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51426 (= res!353151 (validMask!0 mask!3119))))

(assert (=> start!51426 e!323868))

(assert (=> start!51426 true))

(declare-fun array_inv!12742 (array!35291) Bool)

(assert (=> start!51426 (array_inv!12742 a!3118)))

(declare-fun b!562005 () Bool)

(declare-fun res!353160 () Bool)

(assert (=> b!562005 (=> (not res!353160) (not e!323869))))

(declare-datatypes ((List!11026 0))(
  ( (Nil!11023) (Cons!11022 (h!12025 (_ BitVec 64)) (t!17254 List!11026)) )
))
(declare-fun arrayNoDuplicates!0 (array!35291 (_ BitVec 32) List!11026) Bool)

(assert (=> b!562005 (= res!353160 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11023))))

(declare-fun lt!255903 () array!35291)

(declare-fun lt!255897 () (_ BitVec 64))

(declare-fun b!562006 () Bool)

(assert (=> b!562006 (= e!323871 (= (seekEntryOrOpen!0 lt!255897 lt!255903 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52706 lt!255901) (index!23809 lt!255901) (index!23809 lt!255901) lt!255897 lt!255903 mask!3119)))))

(declare-fun b!562007 () Bool)

(assert (=> b!562007 (= e!323870 e!323867)))

(declare-fun res!353158 () Bool)

(assert (=> b!562007 (=> res!353158 e!323867)))

(assert (=> b!562007 (= res!353158 (or (undefined!6207 lt!255901) (not (is-Intermediate!5395 lt!255901))))))

(declare-fun b!562008 () Bool)

(declare-fun res!353159 () Bool)

(assert (=> b!562008 (=> (not res!353159) (not e!323868))))

(assert (=> b!562008 (= res!353159 (and (= (size!17310 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17310 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17310 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562009 () Bool)

(declare-fun res!353153 () Bool)

(assert (=> b!562009 (=> (not res!353153) (not e!323868))))

(declare-fun arrayContainsKey!0 (array!35291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562009 (= res!353153 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562010 () Bool)

(assert (=> b!562010 (= e!323869 e!323864)))

(declare-fun res!353152 () Bool)

(assert (=> b!562010 (=> (not res!353152) (not e!323864))))

(declare-fun lt!255896 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35291 (_ BitVec 32)) SeekEntryResult!5395)

(assert (=> b!562010 (= res!353152 (= lt!255901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255896 lt!255897 lt!255903 mask!3119)))))

(declare-fun lt!255898 () (_ BitVec 32))

(assert (=> b!562010 (= lt!255901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255898 (select (arr!16946 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562010 (= lt!255896 (toIndex!0 lt!255897 mask!3119))))

(assert (=> b!562010 (= lt!255897 (select (store (arr!16946 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562010 (= lt!255898 (toIndex!0 (select (arr!16946 a!3118) j!142) mask!3119))))

(assert (=> b!562010 (= lt!255903 (array!35292 (store (arr!16946 a!3118) i!1132 k!1914) (size!17310 a!3118)))))

(assert (= (and start!51426 res!353151) b!562008))

(assert (= (and b!562008 res!353159) b!562003))

(assert (= (and b!562003 res!353150) b!562000))

(assert (= (and b!562000 res!353154) b!562009))

(assert (= (and b!562009 res!353153) b!561998))

(assert (= (and b!561998 res!353157) b!562001))

(assert (= (and b!562001 res!353161) b!562005))

(assert (= (and b!562005 res!353160) b!562010))

(assert (= (and b!562010 res!353152) b!562002))

(assert (= (and b!562002 res!353156) b!562007))

(assert (= (and b!562007 (not res!353158)) b!562004))

(assert (= (and b!562004 (not res!353155)) b!561999))

(assert (= (and b!561999 res!353162) b!562006))

(declare-fun m!539965 () Bool)

(assert (=> b!562005 m!539965))

(declare-fun m!539967 () Bool)

(assert (=> b!562001 m!539967))

(declare-fun m!539969 () Bool)

(assert (=> b!562010 m!539969))

(declare-fun m!539971 () Bool)

(assert (=> b!562010 m!539971))

(assert (=> b!562010 m!539969))

(declare-fun m!539973 () Bool)

(assert (=> b!562010 m!539973))

(declare-fun m!539975 () Bool)

(assert (=> b!562010 m!539975))

(assert (=> b!562010 m!539969))

(declare-fun m!539977 () Bool)

(assert (=> b!562010 m!539977))

(declare-fun m!539979 () Bool)

(assert (=> b!562010 m!539979))

(declare-fun m!539981 () Bool)

(assert (=> b!562010 m!539981))

(assert (=> b!562002 m!539969))

(assert (=> b!562002 m!539969))

(declare-fun m!539983 () Bool)

(assert (=> b!562002 m!539983))

(declare-fun m!539985 () Bool)

(assert (=> b!562002 m!539985))

(declare-fun m!539987 () Bool)

(assert (=> b!562002 m!539987))

(declare-fun m!539989 () Bool)

(assert (=> b!562000 m!539989))

(assert (=> b!561999 m!539969))

(assert (=> b!561999 m!539969))

(declare-fun m!539991 () Bool)

(assert (=> b!561999 m!539991))

(declare-fun m!539993 () Bool)

(assert (=> b!562009 m!539993))

(assert (=> b!562003 m!539969))

(assert (=> b!562003 m!539969))

(declare-fun m!539995 () Bool)

(assert (=> b!562003 m!539995))

(declare-fun m!539997 () Bool)

(assert (=> start!51426 m!539997))

(declare-fun m!539999 () Bool)

(assert (=> start!51426 m!539999))

(assert (=> b!562004 m!539969))

(declare-fun m!540001 () Bool)

(assert (=> b!562004 m!540001))

(declare-fun m!540003 () Bool)

(assert (=> b!562006 m!540003))

(declare-fun m!540005 () Bool)

(assert (=> b!562006 m!540005))

(declare-fun m!540007 () Bool)

(assert (=> b!561998 m!540007))

(push 1)

