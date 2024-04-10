; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50714 () Bool)

(assert start!50714)

(declare-fun b!554631 () Bool)

(declare-fun res!347045 () Bool)

(declare-fun e!319776 () Bool)

(assert (=> b!554631 (=> (not res!347045) (not e!319776))))

(declare-datatypes ((array!34939 0))(
  ( (array!34940 (arr!16779 (Array (_ BitVec 32) (_ BitVec 64))) (size!17143 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34939)

(declare-datatypes ((List!10859 0))(
  ( (Nil!10856) (Cons!10855 (h!11840 (_ BitVec 64)) (t!17087 List!10859)) )
))
(declare-fun arrayNoDuplicates!0 (array!34939 (_ BitVec 32) List!10859) Bool)

(assert (=> b!554631 (= res!347045 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10856))))

(declare-fun b!554632 () Bool)

(declare-fun e!319779 () Bool)

(assert (=> b!554632 (= e!319779 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5228 0))(
  ( (MissingZero!5228 (index!23139 (_ BitVec 32))) (Found!5228 (index!23140 (_ BitVec 32))) (Intermediate!5228 (undefined!6040 Bool) (index!23141 (_ BitVec 32)) (x!52054 (_ BitVec 32))) (Undefined!5228) (MissingVacant!5228 (index!23142 (_ BitVec 32))) )
))
(declare-fun lt!251880 () SeekEntryResult!5228)

(declare-fun lt!251876 () SeekEntryResult!5228)

(assert (=> b!554632 (and (= lt!251880 (Found!5228 j!142)) (or (undefined!6040 lt!251876) (not (is-Intermediate!5228 lt!251876)) (= (select (arr!16779 a!3118) (index!23141 lt!251876)) (select (arr!16779 a!3118) j!142)) (not (= (select (arr!16779 a!3118) (index!23141 lt!251876)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251880 (MissingZero!5228 (index!23141 lt!251876)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34939 (_ BitVec 32)) SeekEntryResult!5228)

(assert (=> b!554632 (= lt!251880 (seekEntryOrOpen!0 (select (arr!16779 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34939 (_ BitVec 32)) Bool)

(assert (=> b!554632 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17230 0))(
  ( (Unit!17231) )
))
(declare-fun lt!251879 () Unit!17230)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17230)

(assert (=> b!554632 (= lt!251879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554633 () Bool)

(declare-fun res!347051 () Bool)

(declare-fun e!319778 () Bool)

(assert (=> b!554633 (=> (not res!347051) (not e!319778))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554633 (= res!347051 (validKeyInArray!0 k!1914))))

(declare-fun b!554634 () Bool)

(declare-fun res!347049 () Bool)

(assert (=> b!554634 (=> (not res!347049) (not e!319778))))

(assert (=> b!554634 (= res!347049 (validKeyInArray!0 (select (arr!16779 a!3118) j!142)))))

(declare-fun res!347050 () Bool)

(assert (=> start!50714 (=> (not res!347050) (not e!319778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50714 (= res!347050 (validMask!0 mask!3119))))

(assert (=> start!50714 e!319778))

(assert (=> start!50714 true))

(declare-fun array_inv!12575 (array!34939) Bool)

(assert (=> start!50714 (array_inv!12575 a!3118)))

(declare-fun b!554635 () Bool)

(declare-fun res!347044 () Bool)

(assert (=> b!554635 (=> (not res!347044) (not e!319778))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554635 (= res!347044 (and (= (size!17143 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17143 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17143 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554636 () Bool)

(declare-fun res!347043 () Bool)

(assert (=> b!554636 (=> (not res!347043) (not e!319776))))

(assert (=> b!554636 (= res!347043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554637 () Bool)

(declare-fun res!347047 () Bool)

(assert (=> b!554637 (=> (not res!347047) (not e!319778))))

(declare-fun arrayContainsKey!0 (array!34939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554637 (= res!347047 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554638 () Bool)

(assert (=> b!554638 (= e!319776 e!319779)))

(declare-fun res!347048 () Bool)

(assert (=> b!554638 (=> (not res!347048) (not e!319779))))

(declare-fun lt!251881 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34939 (_ BitVec 32)) SeekEntryResult!5228)

(assert (=> b!554638 (= res!347048 (= lt!251876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251881 (select (store (arr!16779 a!3118) i!1132 k!1914) j!142) (array!34940 (store (arr!16779 a!3118) i!1132 k!1914) (size!17143 a!3118)) mask!3119)))))

(declare-fun lt!251877 () (_ BitVec 32))

(assert (=> b!554638 (= lt!251876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251877 (select (arr!16779 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554638 (= lt!251881 (toIndex!0 (select (store (arr!16779 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554638 (= lt!251877 (toIndex!0 (select (arr!16779 a!3118) j!142) mask!3119))))

(declare-fun b!554639 () Bool)

(assert (=> b!554639 (= e!319778 e!319776)))

(declare-fun res!347046 () Bool)

(assert (=> b!554639 (=> (not res!347046) (not e!319776))))

(declare-fun lt!251878 () SeekEntryResult!5228)

(assert (=> b!554639 (= res!347046 (or (= lt!251878 (MissingZero!5228 i!1132)) (= lt!251878 (MissingVacant!5228 i!1132))))))

(assert (=> b!554639 (= lt!251878 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50714 res!347050) b!554635))

(assert (= (and b!554635 res!347044) b!554634))

(assert (= (and b!554634 res!347049) b!554633))

(assert (= (and b!554633 res!347051) b!554637))

(assert (= (and b!554637 res!347047) b!554639))

(assert (= (and b!554639 res!347046) b!554636))

(assert (= (and b!554636 res!347043) b!554631))

(assert (= (and b!554631 res!347045) b!554638))

(assert (= (and b!554638 res!347048) b!554632))

(declare-fun m!531987 () Bool)

(assert (=> start!50714 m!531987))

(declare-fun m!531989 () Bool)

(assert (=> start!50714 m!531989))

(declare-fun m!531991 () Bool)

(assert (=> b!554632 m!531991))

(declare-fun m!531993 () Bool)

(assert (=> b!554632 m!531993))

(declare-fun m!531995 () Bool)

(assert (=> b!554632 m!531995))

(declare-fun m!531997 () Bool)

(assert (=> b!554632 m!531997))

(assert (=> b!554632 m!531993))

(declare-fun m!531999 () Bool)

(assert (=> b!554632 m!531999))

(declare-fun m!532001 () Bool)

(assert (=> b!554633 m!532001))

(assert (=> b!554638 m!531993))

(declare-fun m!532003 () Bool)

(assert (=> b!554638 m!532003))

(assert (=> b!554638 m!531993))

(declare-fun m!532005 () Bool)

(assert (=> b!554638 m!532005))

(assert (=> b!554638 m!531993))

(declare-fun m!532007 () Bool)

(assert (=> b!554638 m!532007))

(declare-fun m!532009 () Bool)

(assert (=> b!554638 m!532009))

(assert (=> b!554638 m!532007))

(declare-fun m!532011 () Bool)

(assert (=> b!554638 m!532011))

(assert (=> b!554638 m!532007))

(declare-fun m!532013 () Bool)

(assert (=> b!554638 m!532013))

(declare-fun m!532015 () Bool)

(assert (=> b!554639 m!532015))

(declare-fun m!532017 () Bool)

(assert (=> b!554636 m!532017))

(assert (=> b!554634 m!531993))

(assert (=> b!554634 m!531993))

(declare-fun m!532019 () Bool)

(assert (=> b!554634 m!532019))

(declare-fun m!532021 () Bool)

(assert (=> b!554631 m!532021))

(declare-fun m!532023 () Bool)

(assert (=> b!554637 m!532023))

(push 1)

