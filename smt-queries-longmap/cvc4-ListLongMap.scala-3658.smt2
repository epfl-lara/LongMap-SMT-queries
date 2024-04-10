; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50508 () Bool)

(assert start!50508)

(declare-fun b!552134 () Bool)

(declare-fun res!344736 () Bool)

(declare-fun e!318608 () Bool)

(assert (=> b!552134 (=> (not res!344736) (not e!318608))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34790 0))(
  ( (array!34791 (arr!16706 (Array (_ BitVec 32) (_ BitVec 64))) (size!17070 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34790)

(declare-datatypes ((SeekEntryResult!5155 0))(
  ( (MissingZero!5155 (index!22847 (_ BitVec 32))) (Found!5155 (index!22848 (_ BitVec 32))) (Intermediate!5155 (undefined!5967 Bool) (index!22849 (_ BitVec 32)) (x!51775 (_ BitVec 32))) (Undefined!5155) (MissingVacant!5155 (index!22850 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34790 (_ BitVec 32)) SeekEntryResult!5155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552134 (= res!344736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16706 a!3118) j!142) mask!3119) (select (arr!16706 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16706 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16706 a!3118) i!1132 k!1914) j!142) (array!34791 (store (arr!16706 a!3118) i!1132 k!1914) (size!17070 a!3118)) mask!3119)))))

(declare-fun b!552135 () Bool)

(declare-fun e!318606 () Bool)

(assert (=> b!552135 (= e!318606 e!318608)))

(declare-fun res!344731 () Bool)

(assert (=> b!552135 (=> (not res!344731) (not e!318608))))

(declare-fun lt!251040 () SeekEntryResult!5155)

(assert (=> b!552135 (= res!344731 (or (= lt!251040 (MissingZero!5155 i!1132)) (= lt!251040 (MissingVacant!5155 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34790 (_ BitVec 32)) SeekEntryResult!5155)

(assert (=> b!552135 (= lt!251040 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552136 () Bool)

(declare-fun res!344729 () Bool)

(assert (=> b!552136 (=> (not res!344729) (not e!318608))))

(declare-datatypes ((List!10786 0))(
  ( (Nil!10783) (Cons!10782 (h!11764 (_ BitVec 64)) (t!17014 List!10786)) )
))
(declare-fun arrayNoDuplicates!0 (array!34790 (_ BitVec 32) List!10786) Bool)

(assert (=> b!552136 (= res!344729 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10783))))

(declare-fun b!552137 () Bool)

(declare-fun res!344733 () Bool)

(assert (=> b!552137 (=> (not res!344733) (not e!318608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34790 (_ BitVec 32)) Bool)

(assert (=> b!552137 (= res!344733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!344737 () Bool)

(assert (=> start!50508 (=> (not res!344737) (not e!318606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50508 (= res!344737 (validMask!0 mask!3119))))

(assert (=> start!50508 e!318606))

(assert (=> start!50508 true))

(declare-fun array_inv!12502 (array!34790) Bool)

(assert (=> start!50508 (array_inv!12502 a!3118)))

(declare-fun b!552138 () Bool)

(declare-fun res!344738 () Bool)

(assert (=> b!552138 (=> (not res!344738) (not e!318606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552138 (= res!344738 (validKeyInArray!0 k!1914))))

(declare-fun b!552139 () Bool)

(declare-fun res!344730 () Bool)

(assert (=> b!552139 (=> (not res!344730) (not e!318606))))

(assert (=> b!552139 (= res!344730 (validKeyInArray!0 (select (arr!16706 a!3118) j!142)))))

(declare-fun b!552140 () Bool)

(assert (=> b!552140 (= e!318608 (not true))))

(declare-fun e!318607 () Bool)

(assert (=> b!552140 e!318607))

(declare-fun res!344732 () Bool)

(assert (=> b!552140 (=> (not res!344732) (not e!318607))))

(assert (=> b!552140 (= res!344732 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17084 0))(
  ( (Unit!17085) )
))
(declare-fun lt!251041 () Unit!17084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17084)

(assert (=> b!552140 (= lt!251041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552141 () Bool)

(declare-fun res!344735 () Bool)

(assert (=> b!552141 (=> (not res!344735) (not e!318606))))

(assert (=> b!552141 (= res!344735 (and (= (size!17070 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17070 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17070 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552142 () Bool)

(declare-fun res!344734 () Bool)

(assert (=> b!552142 (=> (not res!344734) (not e!318606))))

(declare-fun arrayContainsKey!0 (array!34790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552142 (= res!344734 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552143 () Bool)

(assert (=> b!552143 (= e!318607 (= (seekEntryOrOpen!0 (select (arr!16706 a!3118) j!142) a!3118 mask!3119) (Found!5155 j!142)))))

(assert (= (and start!50508 res!344737) b!552141))

(assert (= (and b!552141 res!344735) b!552139))

(assert (= (and b!552139 res!344730) b!552138))

(assert (= (and b!552138 res!344738) b!552142))

(assert (= (and b!552142 res!344734) b!552135))

(assert (= (and b!552135 res!344731) b!552137))

(assert (= (and b!552137 res!344733) b!552136))

(assert (= (and b!552136 res!344729) b!552134))

(assert (= (and b!552134 res!344736) b!552140))

(assert (= (and b!552140 res!344732) b!552143))

(declare-fun m!529107 () Bool)

(assert (=> start!50508 m!529107))

(declare-fun m!529109 () Bool)

(assert (=> start!50508 m!529109))

(declare-fun m!529111 () Bool)

(assert (=> b!552139 m!529111))

(assert (=> b!552139 m!529111))

(declare-fun m!529113 () Bool)

(assert (=> b!552139 m!529113))

(declare-fun m!529115 () Bool)

(assert (=> b!552136 m!529115))

(declare-fun m!529117 () Bool)

(assert (=> b!552142 m!529117))

(assert (=> b!552143 m!529111))

(assert (=> b!552143 m!529111))

(declare-fun m!529119 () Bool)

(assert (=> b!552143 m!529119))

(declare-fun m!529121 () Bool)

(assert (=> b!552137 m!529121))

(declare-fun m!529123 () Bool)

(assert (=> b!552140 m!529123))

(declare-fun m!529125 () Bool)

(assert (=> b!552140 m!529125))

(assert (=> b!552134 m!529111))

(declare-fun m!529127 () Bool)

(assert (=> b!552134 m!529127))

(assert (=> b!552134 m!529111))

(declare-fun m!529129 () Bool)

(assert (=> b!552134 m!529129))

(declare-fun m!529131 () Bool)

(assert (=> b!552134 m!529131))

(assert (=> b!552134 m!529129))

(declare-fun m!529133 () Bool)

(assert (=> b!552134 m!529133))

(assert (=> b!552134 m!529127))

(assert (=> b!552134 m!529111))

(declare-fun m!529135 () Bool)

(assert (=> b!552134 m!529135))

(declare-fun m!529137 () Bool)

(assert (=> b!552134 m!529137))

(assert (=> b!552134 m!529129))

(assert (=> b!552134 m!529131))

(declare-fun m!529139 () Bool)

(assert (=> b!552135 m!529139))

(declare-fun m!529141 () Bool)

(assert (=> b!552138 m!529141))

(push 1)

