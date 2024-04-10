; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50820 () Bool)

(assert start!50820)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5281 0))(
  ( (MissingZero!5281 (index!23351 (_ BitVec 32))) (Found!5281 (index!23352 (_ BitVec 32))) (Intermediate!5281 (undefined!6093 Bool) (index!23353 (_ BitVec 32)) (x!52243 (_ BitVec 32))) (Undefined!5281) (MissingVacant!5281 (index!23354 (_ BitVec 32))) )
))
(declare-fun lt!252787 () SeekEntryResult!5281)

(declare-datatypes ((array!35045 0))(
  ( (array!35046 (arr!16832 (Array (_ BitVec 32) (_ BitVec 64))) (size!17196 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35045)

(declare-fun b!556079 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!320424 () Bool)

(assert (=> b!556079 (= e!320424 (not (or (not (is-Intermediate!5281 lt!252787)) (undefined!6093 lt!252787) (= (select (arr!16832 a!3118) (index!23353 lt!252787)) (select (arr!16832 a!3118) j!142)) (= (select (arr!16832 a!3118) (index!23353 lt!252787)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!320423 () Bool)

(assert (=> b!556079 e!320423))

(declare-fun res!348498 () Bool)

(assert (=> b!556079 (=> (not res!348498) (not e!320423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35045 (_ BitVec 32)) Bool)

(assert (=> b!556079 (= res!348498 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17336 0))(
  ( (Unit!17337) )
))
(declare-fun lt!252786 () Unit!17336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17336)

(assert (=> b!556079 (= lt!252786 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556080 () Bool)

(declare-fun res!348500 () Bool)

(declare-fun e!320422 () Bool)

(assert (=> b!556080 (=> (not res!348500) (not e!320422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556080 (= res!348500 (validKeyInArray!0 (select (arr!16832 a!3118) j!142)))))

(declare-fun b!556081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35045 (_ BitVec 32)) SeekEntryResult!5281)

(assert (=> b!556081 (= e!320423 (= (seekEntryOrOpen!0 (select (arr!16832 a!3118) j!142) a!3118 mask!3119) (Found!5281 j!142)))))

(declare-fun b!556082 () Bool)

(declare-fun e!320420 () Bool)

(assert (=> b!556082 (= e!320422 e!320420)))

(declare-fun res!348491 () Bool)

(assert (=> b!556082 (=> (not res!348491) (not e!320420))))

(declare-fun lt!252789 () SeekEntryResult!5281)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556082 (= res!348491 (or (= lt!252789 (MissingZero!5281 i!1132)) (= lt!252789 (MissingVacant!5281 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!556082 (= lt!252789 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556083 () Bool)

(declare-fun res!348492 () Bool)

(assert (=> b!556083 (=> (not res!348492) (not e!320422))))

(declare-fun arrayContainsKey!0 (array!35045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556083 (= res!348492 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556084 () Bool)

(declare-fun res!348495 () Bool)

(assert (=> b!556084 (=> (not res!348495) (not e!320422))))

(assert (=> b!556084 (= res!348495 (validKeyInArray!0 k!1914))))

(declare-fun res!348493 () Bool)

(assert (=> start!50820 (=> (not res!348493) (not e!320422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50820 (= res!348493 (validMask!0 mask!3119))))

(assert (=> start!50820 e!320422))

(assert (=> start!50820 true))

(declare-fun array_inv!12628 (array!35045) Bool)

(assert (=> start!50820 (array_inv!12628 a!3118)))

(declare-fun b!556085 () Bool)

(declare-fun res!348496 () Bool)

(assert (=> b!556085 (=> (not res!348496) (not e!320420))))

(declare-datatypes ((List!10912 0))(
  ( (Nil!10909) (Cons!10908 (h!11893 (_ BitVec 64)) (t!17140 List!10912)) )
))
(declare-fun arrayNoDuplicates!0 (array!35045 (_ BitVec 32) List!10912) Bool)

(assert (=> b!556085 (= res!348496 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10909))))

(declare-fun b!556086 () Bool)

(assert (=> b!556086 (= e!320420 e!320424)))

(declare-fun res!348494 () Bool)

(assert (=> b!556086 (=> (not res!348494) (not e!320424))))

(declare-fun lt!252790 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35045 (_ BitVec 32)) SeekEntryResult!5281)

(assert (=> b!556086 (= res!348494 (= lt!252787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252790 (select (store (arr!16832 a!3118) i!1132 k!1914) j!142) (array!35046 (store (arr!16832 a!3118) i!1132 k!1914) (size!17196 a!3118)) mask!3119)))))

(declare-fun lt!252788 () (_ BitVec 32))

(assert (=> b!556086 (= lt!252787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252788 (select (arr!16832 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556086 (= lt!252790 (toIndex!0 (select (store (arr!16832 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!556086 (= lt!252788 (toIndex!0 (select (arr!16832 a!3118) j!142) mask!3119))))

(declare-fun b!556087 () Bool)

(declare-fun res!348499 () Bool)

(assert (=> b!556087 (=> (not res!348499) (not e!320420))))

(assert (=> b!556087 (= res!348499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556088 () Bool)

(declare-fun res!348497 () Bool)

(assert (=> b!556088 (=> (not res!348497) (not e!320422))))

(assert (=> b!556088 (= res!348497 (and (= (size!17196 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17196 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17196 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50820 res!348493) b!556088))

(assert (= (and b!556088 res!348497) b!556080))

(assert (= (and b!556080 res!348500) b!556084))

(assert (= (and b!556084 res!348495) b!556083))

(assert (= (and b!556083 res!348492) b!556082))

(assert (= (and b!556082 res!348491) b!556087))

(assert (= (and b!556087 res!348499) b!556085))

(assert (= (and b!556085 res!348496) b!556086))

(assert (= (and b!556086 res!348494) b!556079))

(assert (= (and b!556079 res!348498) b!556081))

(declare-fun m!533995 () Bool)

(assert (=> b!556087 m!533995))

(declare-fun m!533997 () Bool)

(assert (=> b!556080 m!533997))

(assert (=> b!556080 m!533997))

(declare-fun m!533999 () Bool)

(assert (=> b!556080 m!533999))

(declare-fun m!534001 () Bool)

(assert (=> b!556079 m!534001))

(assert (=> b!556079 m!533997))

(declare-fun m!534003 () Bool)

(assert (=> b!556079 m!534003))

(declare-fun m!534005 () Bool)

(assert (=> b!556079 m!534005))

(assert (=> b!556081 m!533997))

(assert (=> b!556081 m!533997))

(declare-fun m!534007 () Bool)

(assert (=> b!556081 m!534007))

(declare-fun m!534009 () Bool)

(assert (=> b!556083 m!534009))

(declare-fun m!534011 () Bool)

(assert (=> start!50820 m!534011))

(declare-fun m!534013 () Bool)

(assert (=> start!50820 m!534013))

(assert (=> b!556086 m!533997))

(declare-fun m!534015 () Bool)

(assert (=> b!556086 m!534015))

(assert (=> b!556086 m!533997))

(assert (=> b!556086 m!533997))

(declare-fun m!534017 () Bool)

(assert (=> b!556086 m!534017))

(declare-fun m!534019 () Bool)

(assert (=> b!556086 m!534019))

(assert (=> b!556086 m!534019))

(declare-fun m!534021 () Bool)

(assert (=> b!556086 m!534021))

(declare-fun m!534023 () Bool)

(assert (=> b!556086 m!534023))

(assert (=> b!556086 m!534019))

(declare-fun m!534025 () Bool)

(assert (=> b!556086 m!534025))

(declare-fun m!534027 () Bool)

(assert (=> b!556085 m!534027))

(declare-fun m!534029 () Bool)

(assert (=> b!556082 m!534029))

(declare-fun m!534031 () Bool)

(assert (=> b!556084 m!534031))

(push 1)

