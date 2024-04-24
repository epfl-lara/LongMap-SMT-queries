; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50856 () Bool)

(assert start!50856)

(declare-fun res!348443 () Bool)

(declare-fun e!320481 () Bool)

(assert (=> start!50856 (=> (not res!348443) (not e!320481))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50856 (= res!348443 (validMask!0 mask!3119))))

(assert (=> start!50856 e!320481))

(assert (=> start!50856 true))

(declare-datatypes ((array!35028 0))(
  ( (array!35029 (arr!16822 (Array (_ BitVec 32) (_ BitVec 64))) (size!17186 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35028)

(declare-fun array_inv!12681 (array!35028) Bool)

(assert (=> start!50856 (array_inv!12681 a!3118)))

(declare-fun b!556129 () Bool)

(declare-fun res!348438 () Bool)

(declare-fun e!320483 () Bool)

(assert (=> b!556129 (=> (not res!348438) (not e!320483))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5227 0))(
  ( (MissingZero!5227 (index!23135 (_ BitVec 32))) (Found!5227 (index!23136 (_ BitVec 32))) (Intermediate!5227 (undefined!6039 Bool) (index!23137 (_ BitVec 32)) (x!52184 (_ BitVec 32))) (Undefined!5227) (MissingVacant!5227 (index!23138 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35028 (_ BitVec 32)) SeekEntryResult!5227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556129 (= res!348438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16822 a!3118) j!142) mask!3119) (select (arr!16822 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16822 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16822 a!3118) i!1132 k0!1914) j!142) (array!35029 (store (arr!16822 a!3118) i!1132 k0!1914) (size!17186 a!3118)) mask!3119)))))

(declare-fun b!556130 () Bool)

(declare-fun res!348444 () Bool)

(assert (=> b!556130 (=> (not res!348444) (not e!320481))))

(declare-fun arrayContainsKey!0 (array!35028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556130 (= res!348444 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556131 () Bool)

(declare-fun e!320484 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35028 (_ BitVec 32)) SeekEntryResult!5227)

(assert (=> b!556131 (= e!320484 (= (seekEntryOrOpen!0 (select (arr!16822 a!3118) j!142) a!3118 mask!3119) (Found!5227 j!142)))))

(declare-fun b!556132 () Bool)

(declare-fun res!348436 () Bool)

(assert (=> b!556132 (=> (not res!348436) (not e!320481))))

(assert (=> b!556132 (= res!348436 (and (= (size!17186 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17186 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17186 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556133 () Bool)

(declare-fun res!348439 () Bool)

(assert (=> b!556133 (=> (not res!348439) (not e!320481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556133 (= res!348439 (validKeyInArray!0 k0!1914))))

(declare-fun b!556134 () Bool)

(assert (=> b!556134 (= e!320481 e!320483)))

(declare-fun res!348441 () Bool)

(assert (=> b!556134 (=> (not res!348441) (not e!320483))))

(declare-fun lt!252843 () SeekEntryResult!5227)

(assert (=> b!556134 (= res!348441 (or (= lt!252843 (MissingZero!5227 i!1132)) (= lt!252843 (MissingVacant!5227 i!1132))))))

(assert (=> b!556134 (= lt!252843 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556135 () Bool)

(assert (=> b!556135 (= e!320483 (not true))))

(assert (=> b!556135 e!320484))

(declare-fun res!348445 () Bool)

(assert (=> b!556135 (=> (not res!348445) (not e!320484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35028 (_ BitVec 32)) Bool)

(assert (=> b!556135 (= res!348445 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17299 0))(
  ( (Unit!17300) )
))
(declare-fun lt!252844 () Unit!17299)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17299)

(assert (=> b!556135 (= lt!252844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556136 () Bool)

(declare-fun res!348440 () Bool)

(assert (=> b!556136 (=> (not res!348440) (not e!320481))))

(assert (=> b!556136 (= res!348440 (validKeyInArray!0 (select (arr!16822 a!3118) j!142)))))

(declare-fun b!556137 () Bool)

(declare-fun res!348442 () Bool)

(assert (=> b!556137 (=> (not res!348442) (not e!320483))))

(declare-datatypes ((List!10809 0))(
  ( (Nil!10806) (Cons!10805 (h!11793 (_ BitVec 64)) (t!17029 List!10809)) )
))
(declare-fun arrayNoDuplicates!0 (array!35028 (_ BitVec 32) List!10809) Bool)

(assert (=> b!556137 (= res!348442 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10806))))

(declare-fun b!556138 () Bool)

(declare-fun res!348437 () Bool)

(assert (=> b!556138 (=> (not res!348437) (not e!320483))))

(assert (=> b!556138 (= res!348437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50856 res!348443) b!556132))

(assert (= (and b!556132 res!348436) b!556136))

(assert (= (and b!556136 res!348440) b!556133))

(assert (= (and b!556133 res!348439) b!556130))

(assert (= (and b!556130 res!348444) b!556134))

(assert (= (and b!556134 res!348441) b!556138))

(assert (= (and b!556138 res!348437) b!556137))

(assert (= (and b!556137 res!348442) b!556129))

(assert (= (and b!556129 res!348438) b!556135))

(assert (= (and b!556135 res!348445) b!556131))

(declare-fun m!534149 () Bool)

(assert (=> b!556136 m!534149))

(assert (=> b!556136 m!534149))

(declare-fun m!534151 () Bool)

(assert (=> b!556136 m!534151))

(declare-fun m!534153 () Bool)

(assert (=> b!556130 m!534153))

(declare-fun m!534155 () Bool)

(assert (=> b!556134 m!534155))

(declare-fun m!534157 () Bool)

(assert (=> b!556133 m!534157))

(declare-fun m!534159 () Bool)

(assert (=> b!556138 m!534159))

(assert (=> b!556131 m!534149))

(assert (=> b!556131 m!534149))

(declare-fun m!534161 () Bool)

(assert (=> b!556131 m!534161))

(declare-fun m!534163 () Bool)

(assert (=> b!556137 m!534163))

(assert (=> b!556129 m!534149))

(declare-fun m!534165 () Bool)

(assert (=> b!556129 m!534165))

(assert (=> b!556129 m!534149))

(declare-fun m!534167 () Bool)

(assert (=> b!556129 m!534167))

(declare-fun m!534169 () Bool)

(assert (=> b!556129 m!534169))

(assert (=> b!556129 m!534167))

(declare-fun m!534171 () Bool)

(assert (=> b!556129 m!534171))

(assert (=> b!556129 m!534165))

(assert (=> b!556129 m!534149))

(declare-fun m!534173 () Bool)

(assert (=> b!556129 m!534173))

(declare-fun m!534175 () Bool)

(assert (=> b!556129 m!534175))

(assert (=> b!556129 m!534167))

(assert (=> b!556129 m!534169))

(declare-fun m!534177 () Bool)

(assert (=> start!50856 m!534177))

(declare-fun m!534179 () Bool)

(assert (=> start!50856 m!534179))

(declare-fun m!534181 () Bool)

(assert (=> b!556135 m!534181))

(declare-fun m!534183 () Bool)

(assert (=> b!556135 m!534183))

(check-sat (not b!556136) (not b!556138) (not b!556133) (not b!556131) (not start!50856) (not b!556129) (not b!556137) (not b!556134) (not b!556135) (not b!556130))
(check-sat)
