; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50826 () Bool)

(assert start!50826)

(declare-fun b!555722 () Bool)

(declare-fun e!320302 () Bool)

(assert (=> b!555722 (= e!320302 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5212 0))(
  ( (MissingZero!5212 (index!23075 (_ BitVec 32))) (Found!5212 (index!23076 (_ BitVec 32))) (Intermediate!5212 (undefined!6024 Bool) (index!23077 (_ BitVec 32)) (x!52129 (_ BitVec 32))) (Undefined!5212) (MissingVacant!5212 (index!23078 (_ BitVec 32))) )
))
(declare-fun lt!252585 () SeekEntryResult!5212)

(declare-fun lt!252583 () SeekEntryResult!5212)

(declare-datatypes ((array!34998 0))(
  ( (array!34999 (arr!16807 (Array (_ BitVec 32) (_ BitVec 64))) (size!17171 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34998)

(get-info :version)

(assert (=> b!555722 (and (= lt!252585 (Found!5212 j!142)) (or (undefined!6024 lt!252583) (not ((_ is Intermediate!5212) lt!252583)) (= (select (arr!16807 a!3118) (index!23077 lt!252583)) (select (arr!16807 a!3118) j!142)) (not (= (select (arr!16807 a!3118) (index!23077 lt!252583)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252585 (MissingZero!5212 (index!23077 lt!252583)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34998 (_ BitVec 32)) SeekEntryResult!5212)

(assert (=> b!555722 (= lt!252585 (seekEntryOrOpen!0 (select (arr!16807 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34998 (_ BitVec 32)) Bool)

(assert (=> b!555722 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17269 0))(
  ( (Unit!17270) )
))
(declare-fun lt!252582 () Unit!17269)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17269)

(assert (=> b!555722 (= lt!252582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555723 () Bool)

(declare-fun e!320303 () Bool)

(assert (=> b!555723 (= e!320303 e!320302)))

(declare-fun res!348037 () Bool)

(assert (=> b!555723 (=> (not res!348037) (not e!320302))))

(declare-fun lt!252584 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34998 (_ BitVec 32)) SeekEntryResult!5212)

(assert (=> b!555723 (= res!348037 (= lt!252583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252584 (select (store (arr!16807 a!3118) i!1132 k0!1914) j!142) (array!34999 (store (arr!16807 a!3118) i!1132 k0!1914) (size!17171 a!3118)) mask!3119)))))

(declare-fun lt!252586 () (_ BitVec 32))

(assert (=> b!555723 (= lt!252583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252586 (select (arr!16807 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555723 (= lt!252584 (toIndex!0 (select (store (arr!16807 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555723 (= lt!252586 (toIndex!0 (select (arr!16807 a!3118) j!142) mask!3119))))

(declare-fun b!555724 () Bool)

(declare-fun res!348029 () Bool)

(declare-fun e!320304 () Bool)

(assert (=> b!555724 (=> (not res!348029) (not e!320304))))

(declare-fun arrayContainsKey!0 (array!34998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555724 (= res!348029 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555725 () Bool)

(assert (=> b!555725 (= e!320304 e!320303)))

(declare-fun res!348034 () Bool)

(assert (=> b!555725 (=> (not res!348034) (not e!320303))))

(declare-fun lt!252581 () SeekEntryResult!5212)

(assert (=> b!555725 (= res!348034 (or (= lt!252581 (MissingZero!5212 i!1132)) (= lt!252581 (MissingVacant!5212 i!1132))))))

(assert (=> b!555725 (= lt!252581 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555726 () Bool)

(declare-fun res!348032 () Bool)

(assert (=> b!555726 (=> (not res!348032) (not e!320304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555726 (= res!348032 (validKeyInArray!0 k0!1914))))

(declare-fun res!348036 () Bool)

(assert (=> start!50826 (=> (not res!348036) (not e!320304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50826 (= res!348036 (validMask!0 mask!3119))))

(assert (=> start!50826 e!320304))

(assert (=> start!50826 true))

(declare-fun array_inv!12666 (array!34998) Bool)

(assert (=> start!50826 (array_inv!12666 a!3118)))

(declare-fun b!555727 () Bool)

(declare-fun res!348035 () Bool)

(assert (=> b!555727 (=> (not res!348035) (not e!320304))))

(assert (=> b!555727 (= res!348035 (and (= (size!17171 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17171 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17171 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555728 () Bool)

(declare-fun res!348030 () Bool)

(assert (=> b!555728 (=> (not res!348030) (not e!320303))))

(assert (=> b!555728 (= res!348030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555729 () Bool)

(declare-fun res!348033 () Bool)

(assert (=> b!555729 (=> (not res!348033) (not e!320303))))

(declare-datatypes ((List!10794 0))(
  ( (Nil!10791) (Cons!10790 (h!11778 (_ BitVec 64)) (t!17014 List!10794)) )
))
(declare-fun arrayNoDuplicates!0 (array!34998 (_ BitVec 32) List!10794) Bool)

(assert (=> b!555729 (= res!348033 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10791))))

(declare-fun b!555730 () Bool)

(declare-fun res!348031 () Bool)

(assert (=> b!555730 (=> (not res!348031) (not e!320304))))

(assert (=> b!555730 (= res!348031 (validKeyInArray!0 (select (arr!16807 a!3118) j!142)))))

(assert (= (and start!50826 res!348036) b!555727))

(assert (= (and b!555727 res!348035) b!555730))

(assert (= (and b!555730 res!348031) b!555726))

(assert (= (and b!555726 res!348032) b!555724))

(assert (= (and b!555724 res!348029) b!555725))

(assert (= (and b!555725 res!348034) b!555728))

(assert (= (and b!555728 res!348030) b!555729))

(assert (= (and b!555729 res!348033) b!555723))

(assert (= (and b!555723 res!348037) b!555722))

(declare-fun m!533579 () Bool)

(assert (=> b!555728 m!533579))

(declare-fun m!533581 () Bool)

(assert (=> b!555730 m!533581))

(assert (=> b!555730 m!533581))

(declare-fun m!533583 () Bool)

(assert (=> b!555730 m!533583))

(declare-fun m!533585 () Bool)

(assert (=> b!555725 m!533585))

(assert (=> b!555723 m!533581))

(declare-fun m!533587 () Bool)

(assert (=> b!555723 m!533587))

(declare-fun m!533589 () Bool)

(assert (=> b!555723 m!533589))

(declare-fun m!533591 () Bool)

(assert (=> b!555723 m!533591))

(assert (=> b!555723 m!533581))

(assert (=> b!555723 m!533589))

(declare-fun m!533593 () Bool)

(assert (=> b!555723 m!533593))

(assert (=> b!555723 m!533581))

(declare-fun m!533595 () Bool)

(assert (=> b!555723 m!533595))

(assert (=> b!555723 m!533589))

(declare-fun m!533597 () Bool)

(assert (=> b!555723 m!533597))

(declare-fun m!533599 () Bool)

(assert (=> b!555726 m!533599))

(declare-fun m!533601 () Bool)

(assert (=> start!50826 m!533601))

(declare-fun m!533603 () Bool)

(assert (=> start!50826 m!533603))

(declare-fun m!533605 () Bool)

(assert (=> b!555724 m!533605))

(assert (=> b!555722 m!533581))

(declare-fun m!533607 () Bool)

(assert (=> b!555722 m!533607))

(declare-fun m!533609 () Bool)

(assert (=> b!555722 m!533609))

(declare-fun m!533611 () Bool)

(assert (=> b!555722 m!533611))

(assert (=> b!555722 m!533581))

(declare-fun m!533613 () Bool)

(assert (=> b!555722 m!533613))

(declare-fun m!533615 () Bool)

(assert (=> b!555729 m!533615))

(check-sat (not b!555728) (not b!555730) (not b!555729) (not b!555725) (not b!555722) (not b!555723) (not start!50826) (not b!555724) (not b!555726))
(check-sat)
