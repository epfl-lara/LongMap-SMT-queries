; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50802 () Bool)

(assert start!50802)

(declare-fun res!347712 () Bool)

(declare-fun e!320158 () Bool)

(assert (=> start!50802 (=> (not res!347712) (not e!320158))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50802 (= res!347712 (validMask!0 mask!3119))))

(assert (=> start!50802 e!320158))

(assert (=> start!50802 true))

(declare-datatypes ((array!34974 0))(
  ( (array!34975 (arr!16795 (Array (_ BitVec 32) (_ BitVec 64))) (size!17159 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34974)

(declare-fun array_inv!12654 (array!34974) Bool)

(assert (=> start!50802 (array_inv!12654 a!3118)))

(declare-fun b!555398 () Bool)

(declare-fun res!347713 () Bool)

(assert (=> b!555398 (=> (not res!347713) (not e!320158))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555398 (= res!347713 (and (= (size!17159 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17159 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17159 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555399 () Bool)

(declare-fun e!320159 () Bool)

(assert (=> b!555399 (= e!320159 (not true))))

(declare-datatypes ((SeekEntryResult!5200 0))(
  ( (MissingZero!5200 (index!23027 (_ BitVec 32))) (Found!5200 (index!23028 (_ BitVec 32))) (Intermediate!5200 (undefined!6012 Bool) (index!23029 (_ BitVec 32)) (x!52085 (_ BitVec 32))) (Undefined!5200) (MissingVacant!5200 (index!23030 (_ BitVec 32))) )
))
(declare-fun lt!252366 () SeekEntryResult!5200)

(declare-fun lt!252367 () SeekEntryResult!5200)

(get-info :version)

(assert (=> b!555399 (and (= lt!252367 (Found!5200 j!142)) (or (undefined!6012 lt!252366) (not ((_ is Intermediate!5200) lt!252366)) (= (select (arr!16795 a!3118) (index!23029 lt!252366)) (select (arr!16795 a!3118) j!142)) (not (= (select (arr!16795 a!3118) (index!23029 lt!252366)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252367 (MissingZero!5200 (index!23029 lt!252366)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34974 (_ BitVec 32)) SeekEntryResult!5200)

(assert (=> b!555399 (= lt!252367 (seekEntryOrOpen!0 (select (arr!16795 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34974 (_ BitVec 32)) Bool)

(assert (=> b!555399 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17245 0))(
  ( (Unit!17246) )
))
(declare-fun lt!252368 () Unit!17245)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17245)

(assert (=> b!555399 (= lt!252368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555400 () Bool)

(declare-fun res!347709 () Bool)

(assert (=> b!555400 (=> (not res!347709) (not e!320158))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555400 (= res!347709 (validKeyInArray!0 k0!1914))))

(declare-fun b!555401 () Bool)

(declare-fun res!347705 () Bool)

(assert (=> b!555401 (=> (not res!347705) (not e!320158))))

(assert (=> b!555401 (= res!347705 (validKeyInArray!0 (select (arr!16795 a!3118) j!142)))))

(declare-fun b!555402 () Bool)

(declare-fun res!347706 () Bool)

(declare-fun e!320160 () Bool)

(assert (=> b!555402 (=> (not res!347706) (not e!320160))))

(assert (=> b!555402 (= res!347706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555403 () Bool)

(assert (=> b!555403 (= e!320160 e!320159)))

(declare-fun res!347707 () Bool)

(assert (=> b!555403 (=> (not res!347707) (not e!320159))))

(declare-fun lt!252365 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34974 (_ BitVec 32)) SeekEntryResult!5200)

(assert (=> b!555403 (= res!347707 (= lt!252366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252365 (select (store (arr!16795 a!3118) i!1132 k0!1914) j!142) (array!34975 (store (arr!16795 a!3118) i!1132 k0!1914) (size!17159 a!3118)) mask!3119)))))

(declare-fun lt!252369 () (_ BitVec 32))

(assert (=> b!555403 (= lt!252366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252369 (select (arr!16795 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555403 (= lt!252365 (toIndex!0 (select (store (arr!16795 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555403 (= lt!252369 (toIndex!0 (select (arr!16795 a!3118) j!142) mask!3119))))

(declare-fun b!555404 () Bool)

(declare-fun res!347711 () Bool)

(assert (=> b!555404 (=> (not res!347711) (not e!320160))))

(declare-datatypes ((List!10782 0))(
  ( (Nil!10779) (Cons!10778 (h!11766 (_ BitVec 64)) (t!17002 List!10782)) )
))
(declare-fun arrayNoDuplicates!0 (array!34974 (_ BitVec 32) List!10782) Bool)

(assert (=> b!555404 (= res!347711 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10779))))

(declare-fun b!555405 () Bool)

(assert (=> b!555405 (= e!320158 e!320160)))

(declare-fun res!347708 () Bool)

(assert (=> b!555405 (=> (not res!347708) (not e!320160))))

(declare-fun lt!252370 () SeekEntryResult!5200)

(assert (=> b!555405 (= res!347708 (or (= lt!252370 (MissingZero!5200 i!1132)) (= lt!252370 (MissingVacant!5200 i!1132))))))

(assert (=> b!555405 (= lt!252370 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555406 () Bool)

(declare-fun res!347710 () Bool)

(assert (=> b!555406 (=> (not res!347710) (not e!320158))))

(declare-fun arrayContainsKey!0 (array!34974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555406 (= res!347710 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50802 res!347712) b!555398))

(assert (= (and b!555398 res!347713) b!555401))

(assert (= (and b!555401 res!347705) b!555400))

(assert (= (and b!555400 res!347709) b!555406))

(assert (= (and b!555406 res!347710) b!555405))

(assert (= (and b!555405 res!347708) b!555402))

(assert (= (and b!555402 res!347706) b!555404))

(assert (= (and b!555404 res!347711) b!555403))

(assert (= (and b!555403 res!347707) b!555399))

(declare-fun m!533123 () Bool)

(assert (=> b!555406 m!533123))

(declare-fun m!533125 () Bool)

(assert (=> b!555403 m!533125))

(declare-fun m!533127 () Bool)

(assert (=> b!555403 m!533127))

(assert (=> b!555403 m!533125))

(declare-fun m!533129 () Bool)

(assert (=> b!555403 m!533129))

(assert (=> b!555403 m!533125))

(declare-fun m!533131 () Bool)

(assert (=> b!555403 m!533131))

(assert (=> b!555403 m!533131))

(declare-fun m!533133 () Bool)

(assert (=> b!555403 m!533133))

(declare-fun m!533135 () Bool)

(assert (=> b!555403 m!533135))

(assert (=> b!555403 m!533131))

(declare-fun m!533137 () Bool)

(assert (=> b!555403 m!533137))

(declare-fun m!533139 () Bool)

(assert (=> b!555402 m!533139))

(declare-fun m!533141 () Bool)

(assert (=> b!555404 m!533141))

(declare-fun m!533143 () Bool)

(assert (=> b!555399 m!533143))

(assert (=> b!555399 m!533125))

(declare-fun m!533145 () Bool)

(assert (=> b!555399 m!533145))

(declare-fun m!533147 () Bool)

(assert (=> b!555399 m!533147))

(assert (=> b!555399 m!533125))

(declare-fun m!533149 () Bool)

(assert (=> b!555399 m!533149))

(assert (=> b!555401 m!533125))

(assert (=> b!555401 m!533125))

(declare-fun m!533151 () Bool)

(assert (=> b!555401 m!533151))

(declare-fun m!533153 () Bool)

(assert (=> b!555405 m!533153))

(declare-fun m!533155 () Bool)

(assert (=> b!555400 m!533155))

(declare-fun m!533157 () Bool)

(assert (=> start!50802 m!533157))

(declare-fun m!533159 () Bool)

(assert (=> start!50802 m!533159))

(check-sat (not b!555399) (not b!555401) (not start!50802) (not b!555406) (not b!555404) (not b!555405) (not b!555400) (not b!555402) (not b!555403))
(check-sat)
