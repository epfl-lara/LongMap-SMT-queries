; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50640 () Bool)

(assert start!50640)

(declare-fun b!553024 () Bool)

(declare-fun e!319108 () Bool)

(declare-fun e!319109 () Bool)

(assert (=> b!553024 (= e!319108 e!319109)))

(declare-fun res!345340 () Bool)

(assert (=> b!553024 (=> (not res!345340) (not e!319109))))

(declare-datatypes ((SeekEntryResult!5119 0))(
  ( (MissingZero!5119 (index!22703 (_ BitVec 32))) (Found!5119 (index!22704 (_ BitVec 32))) (Intermediate!5119 (undefined!5931 Bool) (index!22705 (_ BitVec 32)) (x!51788 (_ BitVec 32))) (Undefined!5119) (MissingVacant!5119 (index!22706 (_ BitVec 32))) )
))
(declare-fun lt!251404 () SeekEntryResult!5119)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553024 (= res!345340 (or (= lt!251404 (MissingZero!5119 i!1132)) (= lt!251404 (MissingVacant!5119 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34812 0))(
  ( (array!34813 (arr!16714 (Array (_ BitVec 32) (_ BitVec 64))) (size!17078 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34812)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34812 (_ BitVec 32)) SeekEntryResult!5119)

(assert (=> b!553024 (= lt!251404 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553025 () Bool)

(declare-fun e!319110 () Bool)

(assert (=> b!553025 (= e!319109 e!319110)))

(declare-fun res!345331 () Bool)

(assert (=> b!553025 (=> (not res!345331) (not e!319110))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!251400 () SeekEntryResult!5119)

(declare-fun lt!251401 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34812 (_ BitVec 32)) SeekEntryResult!5119)

(assert (=> b!553025 (= res!345331 (= lt!251400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251401 (select (store (arr!16714 a!3118) i!1132 k0!1914) j!142) (array!34813 (store (arr!16714 a!3118) i!1132 k0!1914) (size!17078 a!3118)) mask!3119)))))

(declare-fun lt!251403 () (_ BitVec 32))

(assert (=> b!553025 (= lt!251400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251403 (select (arr!16714 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553025 (= lt!251401 (toIndex!0 (select (store (arr!16714 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553025 (= lt!251403 (toIndex!0 (select (arr!16714 a!3118) j!142) mask!3119))))

(declare-fun b!553026 () Bool)

(declare-fun res!345336 () Bool)

(assert (=> b!553026 (=> (not res!345336) (not e!319108))))

(declare-fun arrayContainsKey!0 (array!34812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553026 (= res!345336 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553027 () Bool)

(declare-fun res!345335 () Bool)

(assert (=> b!553027 (=> (not res!345335) (not e!319109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34812 (_ BitVec 32)) Bool)

(assert (=> b!553027 (= res!345335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553028 () Bool)

(declare-fun res!345339 () Bool)

(assert (=> b!553028 (=> (not res!345339) (not e!319108))))

(assert (=> b!553028 (= res!345339 (and (= (size!17078 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17078 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17078 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553029 () Bool)

(get-info :version)

(assert (=> b!553029 (= e!319110 (not (or (not ((_ is Intermediate!5119) lt!251400)) (not (undefined!5931 lt!251400)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319106 () Bool)

(assert (=> b!553029 e!319106))

(declare-fun res!345334 () Bool)

(assert (=> b!553029 (=> (not res!345334) (not e!319106))))

(assert (=> b!553029 (= res!345334 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17083 0))(
  ( (Unit!17084) )
))
(declare-fun lt!251402 () Unit!17083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17083)

(assert (=> b!553029 (= lt!251402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553031 () Bool)

(declare-fun res!345338 () Bool)

(assert (=> b!553031 (=> (not res!345338) (not e!319108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553031 (= res!345338 (validKeyInArray!0 k0!1914))))

(declare-fun b!553032 () Bool)

(declare-fun res!345332 () Bool)

(assert (=> b!553032 (=> (not res!345332) (not e!319108))))

(assert (=> b!553032 (= res!345332 (validKeyInArray!0 (select (arr!16714 a!3118) j!142)))))

(declare-fun b!553033 () Bool)

(assert (=> b!553033 (= e!319106 (= (seekEntryOrOpen!0 (select (arr!16714 a!3118) j!142) a!3118 mask!3119) (Found!5119 j!142)))))

(declare-fun b!553030 () Bool)

(declare-fun res!345337 () Bool)

(assert (=> b!553030 (=> (not res!345337) (not e!319109))))

(declare-datatypes ((List!10701 0))(
  ( (Nil!10698) (Cons!10697 (h!11685 (_ BitVec 64)) (t!16921 List!10701)) )
))
(declare-fun arrayNoDuplicates!0 (array!34812 (_ BitVec 32) List!10701) Bool)

(assert (=> b!553030 (= res!345337 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10698))))

(declare-fun res!345333 () Bool)

(assert (=> start!50640 (=> (not res!345333) (not e!319108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50640 (= res!345333 (validMask!0 mask!3119))))

(assert (=> start!50640 e!319108))

(assert (=> start!50640 true))

(declare-fun array_inv!12573 (array!34812) Bool)

(assert (=> start!50640 (array_inv!12573 a!3118)))

(assert (= (and start!50640 res!345333) b!553028))

(assert (= (and b!553028 res!345339) b!553032))

(assert (= (and b!553032 res!345332) b!553031))

(assert (= (and b!553031 res!345338) b!553026))

(assert (= (and b!553026 res!345336) b!553024))

(assert (= (and b!553024 res!345340) b!553027))

(assert (= (and b!553027 res!345335) b!553030))

(assert (= (and b!553030 res!345337) b!553025))

(assert (= (and b!553025 res!345331) b!553029))

(assert (= (and b!553029 res!345334) b!553033))

(declare-fun m!530123 () Bool)

(assert (=> b!553030 m!530123))

(declare-fun m!530125 () Bool)

(assert (=> b!553025 m!530125))

(declare-fun m!530127 () Bool)

(assert (=> b!553025 m!530127))

(declare-fun m!530129 () Bool)

(assert (=> b!553025 m!530129))

(assert (=> b!553025 m!530125))

(declare-fun m!530131 () Bool)

(assert (=> b!553025 m!530131))

(assert (=> b!553025 m!530127))

(declare-fun m!530133 () Bool)

(assert (=> b!553025 m!530133))

(assert (=> b!553025 m!530127))

(declare-fun m!530135 () Bool)

(assert (=> b!553025 m!530135))

(assert (=> b!553025 m!530125))

(declare-fun m!530137 () Bool)

(assert (=> b!553025 m!530137))

(declare-fun m!530139 () Bool)

(assert (=> b!553027 m!530139))

(declare-fun m!530141 () Bool)

(assert (=> b!553026 m!530141))

(declare-fun m!530143 () Bool)

(assert (=> b!553031 m!530143))

(declare-fun m!530145 () Bool)

(assert (=> b!553024 m!530145))

(declare-fun m!530147 () Bool)

(assert (=> b!553029 m!530147))

(declare-fun m!530149 () Bool)

(assert (=> b!553029 m!530149))

(assert (=> b!553033 m!530125))

(assert (=> b!553033 m!530125))

(declare-fun m!530151 () Bool)

(assert (=> b!553033 m!530151))

(assert (=> b!553032 m!530125))

(assert (=> b!553032 m!530125))

(declare-fun m!530153 () Bool)

(assert (=> b!553032 m!530153))

(declare-fun m!530155 () Bool)

(assert (=> start!50640 m!530155))

(declare-fun m!530157 () Bool)

(assert (=> start!50640 m!530157))

(check-sat (not b!553031) (not b!553030) (not b!553027) (not start!50640) (not b!553026) (not b!553025) (not b!553029) (not b!553033) (not b!553032) (not b!553024))
(check-sat)
