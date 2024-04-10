; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50662 () Bool)

(assert start!50662)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!553853 () Bool)

(declare-fun e!319429 () Bool)

(declare-datatypes ((array!34887 0))(
  ( (array!34888 (arr!16753 (Array (_ BitVec 32) (_ BitVec 64))) (size!17117 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34887)

(declare-datatypes ((SeekEntryResult!5202 0))(
  ( (MissingZero!5202 (index!23035 (_ BitVec 32))) (Found!5202 (index!23036 (_ BitVec 32))) (Intermediate!5202 (undefined!6014 Bool) (index!23037 (_ BitVec 32)) (x!51956 (_ BitVec 32))) (Undefined!5202) (MissingVacant!5202 (index!23038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34887 (_ BitVec 32)) SeekEntryResult!5202)

(assert (=> b!553853 (= e!319429 (= (seekEntryOrOpen!0 (select (arr!16753 a!3118) j!142) a!3118 mask!3119) (Found!5202 j!142)))))

(declare-fun b!553854 () Bool)

(declare-fun res!346273 () Bool)

(declare-fun e!319431 () Bool)

(assert (=> b!553854 (=> (not res!346273) (not e!319431))))

(declare-datatypes ((List!10833 0))(
  ( (Nil!10830) (Cons!10829 (h!11814 (_ BitVec 64)) (t!17061 List!10833)) )
))
(declare-fun arrayNoDuplicates!0 (array!34887 (_ BitVec 32) List!10833) Bool)

(assert (=> b!553854 (= res!346273 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10830))))

(declare-fun b!553855 () Bool)

(declare-fun res!346274 () Bool)

(assert (=> b!553855 (=> (not res!346274) (not e!319431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34887 (_ BitVec 32)) Bool)

(assert (=> b!553855 (= res!346274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553856 () Bool)

(declare-fun res!346270 () Bool)

(declare-fun e!319430 () Bool)

(assert (=> b!553856 (=> (not res!346270) (not e!319430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553856 (= res!346270 (validKeyInArray!0 (select (arr!16753 a!3118) j!142)))))

(declare-fun b!553857 () Bool)

(declare-fun res!346266 () Bool)

(assert (=> b!553857 (=> (not res!346266) (not e!319431))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34887 (_ BitVec 32)) SeekEntryResult!5202)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553857 (= res!346266 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16753 a!3118) j!142) mask!3119) (select (arr!16753 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16753 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16753 a!3118) i!1132 k0!1914) j!142) (array!34888 (store (arr!16753 a!3118) i!1132 k0!1914) (size!17117 a!3118)) mask!3119)))))

(declare-fun b!553859 () Bool)

(assert (=> b!553859 (= e!319431 (not true))))

(assert (=> b!553859 e!319429))

(declare-fun res!346269 () Bool)

(assert (=> b!553859 (=> (not res!346269) (not e!319429))))

(assert (=> b!553859 (= res!346269 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17178 0))(
  ( (Unit!17179) )
))
(declare-fun lt!251595 () Unit!17178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17178)

(assert (=> b!553859 (= lt!251595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553860 () Bool)

(declare-fun res!346265 () Bool)

(assert (=> b!553860 (=> (not res!346265) (not e!319430))))

(assert (=> b!553860 (= res!346265 (and (= (size!17117 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17117 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17117 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553861 () Bool)

(assert (=> b!553861 (= e!319430 e!319431)))

(declare-fun res!346267 () Bool)

(assert (=> b!553861 (=> (not res!346267) (not e!319431))))

(declare-fun lt!251596 () SeekEntryResult!5202)

(assert (=> b!553861 (= res!346267 (or (= lt!251596 (MissingZero!5202 i!1132)) (= lt!251596 (MissingVacant!5202 i!1132))))))

(assert (=> b!553861 (= lt!251596 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553862 () Bool)

(declare-fun res!346268 () Bool)

(assert (=> b!553862 (=> (not res!346268) (not e!319430))))

(declare-fun arrayContainsKey!0 (array!34887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553862 (= res!346268 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553858 () Bool)

(declare-fun res!346271 () Bool)

(assert (=> b!553858 (=> (not res!346271) (not e!319430))))

(assert (=> b!553858 (= res!346271 (validKeyInArray!0 k0!1914))))

(declare-fun res!346272 () Bool)

(assert (=> start!50662 (=> (not res!346272) (not e!319430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50662 (= res!346272 (validMask!0 mask!3119))))

(assert (=> start!50662 e!319430))

(assert (=> start!50662 true))

(declare-fun array_inv!12549 (array!34887) Bool)

(assert (=> start!50662 (array_inv!12549 a!3118)))

(assert (= (and start!50662 res!346272) b!553860))

(assert (= (and b!553860 res!346265) b!553856))

(assert (= (and b!553856 res!346270) b!553858))

(assert (= (and b!553858 res!346271) b!553862))

(assert (= (and b!553862 res!346268) b!553861))

(assert (= (and b!553861 res!346267) b!553855))

(assert (= (and b!553855 res!346274) b!553854))

(assert (= (and b!553854 res!346273) b!553857))

(assert (= (and b!553857 res!346266) b!553859))

(assert (= (and b!553859 res!346269) b!553853))

(declare-fun m!531021 () Bool)

(assert (=> b!553857 m!531021))

(declare-fun m!531023 () Bool)

(assert (=> b!553857 m!531023))

(assert (=> b!553857 m!531021))

(declare-fun m!531025 () Bool)

(assert (=> b!553857 m!531025))

(declare-fun m!531027 () Bool)

(assert (=> b!553857 m!531027))

(assert (=> b!553857 m!531025))

(declare-fun m!531029 () Bool)

(assert (=> b!553857 m!531029))

(assert (=> b!553857 m!531023))

(assert (=> b!553857 m!531021))

(declare-fun m!531031 () Bool)

(assert (=> b!553857 m!531031))

(declare-fun m!531033 () Bool)

(assert (=> b!553857 m!531033))

(assert (=> b!553857 m!531025))

(assert (=> b!553857 m!531027))

(declare-fun m!531035 () Bool)

(assert (=> b!553854 m!531035))

(declare-fun m!531037 () Bool)

(assert (=> start!50662 m!531037))

(declare-fun m!531039 () Bool)

(assert (=> start!50662 m!531039))

(assert (=> b!553856 m!531021))

(assert (=> b!553856 m!531021))

(declare-fun m!531041 () Bool)

(assert (=> b!553856 m!531041))

(declare-fun m!531043 () Bool)

(assert (=> b!553862 m!531043))

(declare-fun m!531045 () Bool)

(assert (=> b!553858 m!531045))

(declare-fun m!531047 () Bool)

(assert (=> b!553855 m!531047))

(declare-fun m!531049 () Bool)

(assert (=> b!553859 m!531049))

(declare-fun m!531051 () Bool)

(assert (=> b!553859 m!531051))

(declare-fun m!531053 () Bool)

(assert (=> b!553861 m!531053))

(assert (=> b!553853 m!531021))

(assert (=> b!553853 m!531021))

(declare-fun m!531055 () Bool)

(assert (=> b!553853 m!531055))

(check-sat (not start!50662) (not b!553853) (not b!553857) (not b!553854) (not b!553861) (not b!553862) (not b!553856) (not b!553858) (not b!553859) (not b!553855))
(check-sat)
