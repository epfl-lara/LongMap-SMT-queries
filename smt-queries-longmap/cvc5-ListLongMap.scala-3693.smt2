; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50774 () Bool)

(assert start!50774)

(declare-fun res!347853 () Bool)

(declare-fun e!320138 () Bool)

(assert (=> start!50774 (=> (not res!347853) (not e!320138))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50774 (= res!347853 (validMask!0 mask!3119))))

(assert (=> start!50774 e!320138))

(assert (=> start!50774 true))

(declare-datatypes ((array!34999 0))(
  ( (array!35000 (arr!16809 (Array (_ BitVec 32) (_ BitVec 64))) (size!17173 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34999)

(declare-fun array_inv!12605 (array!34999) Bool)

(assert (=> start!50774 (array_inv!12605 a!3118)))

(declare-fun b!555441 () Bool)

(declare-fun res!347854 () Bool)

(declare-fun e!320137 () Bool)

(assert (=> b!555441 (=> (not res!347854) (not e!320137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34999 (_ BitVec 32)) Bool)

(assert (=> b!555441 (= res!347854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555442 () Bool)

(declare-fun res!347855 () Bool)

(assert (=> b!555442 (=> (not res!347855) (not e!320138))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555442 (= res!347855 (and (= (size!17173 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17173 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17173 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555443 () Bool)

(declare-fun res!347860 () Bool)

(assert (=> b!555443 (=> (not res!347860) (not e!320137))))

(declare-datatypes ((List!10889 0))(
  ( (Nil!10886) (Cons!10885 (h!11870 (_ BitVec 64)) (t!17117 List!10889)) )
))
(declare-fun arrayNoDuplicates!0 (array!34999 (_ BitVec 32) List!10889) Bool)

(assert (=> b!555443 (= res!347860 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10886))))

(declare-fun b!555444 () Bool)

(declare-fun res!347856 () Bool)

(assert (=> b!555444 (=> (not res!347856) (not e!320138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555444 (= res!347856 (validKeyInArray!0 (select (arr!16809 a!3118) j!142)))))

(declare-fun b!555445 () Bool)

(assert (=> b!555445 (= e!320138 e!320137)))

(declare-fun res!347859 () Bool)

(assert (=> b!555445 (=> (not res!347859) (not e!320137))))

(declare-datatypes ((SeekEntryResult!5258 0))(
  ( (MissingZero!5258 (index!23259 (_ BitVec 32))) (Found!5258 (index!23260 (_ BitVec 32))) (Intermediate!5258 (undefined!6070 Bool) (index!23261 (_ BitVec 32)) (x!52164 (_ BitVec 32))) (Undefined!5258) (MissingVacant!5258 (index!23262 (_ BitVec 32))) )
))
(declare-fun lt!252418 () SeekEntryResult!5258)

(assert (=> b!555445 (= res!347859 (or (= lt!252418 (MissingZero!5258 i!1132)) (= lt!252418 (MissingVacant!5258 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34999 (_ BitVec 32)) SeekEntryResult!5258)

(assert (=> b!555445 (= lt!252418 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555446 () Bool)

(declare-fun res!347858 () Bool)

(assert (=> b!555446 (=> (not res!347858) (not e!320138))))

(declare-fun arrayContainsKey!0 (array!34999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555446 (= res!347858 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555447 () Bool)

(declare-fun e!320136 () Bool)

(assert (=> b!555447 (= e!320136 (not true))))

(declare-fun lt!252416 () SeekEntryResult!5258)

(declare-fun lt!252420 () SeekEntryResult!5258)

(assert (=> b!555447 (and (= lt!252420 (Found!5258 j!142)) (or (undefined!6070 lt!252416) (not (is-Intermediate!5258 lt!252416)) (= (select (arr!16809 a!3118) (index!23261 lt!252416)) (select (arr!16809 a!3118) j!142)) (not (= (select (arr!16809 a!3118) (index!23261 lt!252416)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252420 (MissingZero!5258 (index!23261 lt!252416)))))))

(assert (=> b!555447 (= lt!252420 (seekEntryOrOpen!0 (select (arr!16809 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555447 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17290 0))(
  ( (Unit!17291) )
))
(declare-fun lt!252419 () Unit!17290)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17290)

(assert (=> b!555447 (= lt!252419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555448 () Bool)

(assert (=> b!555448 (= e!320137 e!320136)))

(declare-fun res!347861 () Bool)

(assert (=> b!555448 (=> (not res!347861) (not e!320136))))

(declare-fun lt!252417 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34999 (_ BitVec 32)) SeekEntryResult!5258)

(assert (=> b!555448 (= res!347861 (= lt!252416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252417 (select (store (arr!16809 a!3118) i!1132 k!1914) j!142) (array!35000 (store (arr!16809 a!3118) i!1132 k!1914) (size!17173 a!3118)) mask!3119)))))

(declare-fun lt!252421 () (_ BitVec 32))

(assert (=> b!555448 (= lt!252416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252421 (select (arr!16809 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555448 (= lt!252417 (toIndex!0 (select (store (arr!16809 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555448 (= lt!252421 (toIndex!0 (select (arr!16809 a!3118) j!142) mask!3119))))

(declare-fun b!555449 () Bool)

(declare-fun res!347857 () Bool)

(assert (=> b!555449 (=> (not res!347857) (not e!320138))))

(assert (=> b!555449 (= res!347857 (validKeyInArray!0 k!1914))))

(assert (= (and start!50774 res!347853) b!555442))

(assert (= (and b!555442 res!347855) b!555444))

(assert (= (and b!555444 res!347856) b!555449))

(assert (= (and b!555449 res!347857) b!555446))

(assert (= (and b!555446 res!347858) b!555445))

(assert (= (and b!555445 res!347859) b!555441))

(assert (= (and b!555441 res!347854) b!555443))

(assert (= (and b!555443 res!347860) b!555448))

(assert (= (and b!555448 res!347861) b!555447))

(declare-fun m!533127 () Bool)

(assert (=> b!555443 m!533127))

(declare-fun m!533129 () Bool)

(assert (=> start!50774 m!533129))

(declare-fun m!533131 () Bool)

(assert (=> start!50774 m!533131))

(declare-fun m!533133 () Bool)

(assert (=> b!555449 m!533133))

(declare-fun m!533135 () Bool)

(assert (=> b!555441 m!533135))

(declare-fun m!533137 () Bool)

(assert (=> b!555447 m!533137))

(declare-fun m!533139 () Bool)

(assert (=> b!555447 m!533139))

(declare-fun m!533141 () Bool)

(assert (=> b!555447 m!533141))

(declare-fun m!533143 () Bool)

(assert (=> b!555447 m!533143))

(assert (=> b!555447 m!533137))

(declare-fun m!533145 () Bool)

(assert (=> b!555447 m!533145))

(assert (=> b!555448 m!533137))

(declare-fun m!533147 () Bool)

(assert (=> b!555448 m!533147))

(assert (=> b!555448 m!533137))

(declare-fun m!533149 () Bool)

(assert (=> b!555448 m!533149))

(assert (=> b!555448 m!533149))

(declare-fun m!533151 () Bool)

(assert (=> b!555448 m!533151))

(declare-fun m!533153 () Bool)

(assert (=> b!555448 m!533153))

(assert (=> b!555448 m!533137))

(declare-fun m!533155 () Bool)

(assert (=> b!555448 m!533155))

(assert (=> b!555448 m!533149))

(declare-fun m!533157 () Bool)

(assert (=> b!555448 m!533157))

(declare-fun m!533159 () Bool)

(assert (=> b!555446 m!533159))

(declare-fun m!533161 () Bool)

(assert (=> b!555445 m!533161))

(assert (=> b!555444 m!533137))

(assert (=> b!555444 m!533137))

(declare-fun m!533163 () Bool)

(assert (=> b!555444 m!533163))

(push 1)

