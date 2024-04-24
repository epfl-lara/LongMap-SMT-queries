; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50796 () Bool)

(assert start!50796)

(declare-fun b!555317 () Bool)

(declare-fun e!320121 () Bool)

(declare-fun e!320123 () Bool)

(assert (=> b!555317 (= e!320121 e!320123)))

(declare-fun res!347627 () Bool)

(assert (=> b!555317 (=> (not res!347627) (not e!320123))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5197 0))(
  ( (MissingZero!5197 (index!23015 (_ BitVec 32))) (Found!5197 (index!23016 (_ BitVec 32))) (Intermediate!5197 (undefined!6009 Bool) (index!23017 (_ BitVec 32)) (x!52074 (_ BitVec 32))) (Undefined!5197) (MissingVacant!5197 (index!23018 (_ BitVec 32))) )
))
(declare-fun lt!252313 () SeekEntryResult!5197)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!252315 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34968 0))(
  ( (array!34969 (arr!16792 (Array (_ BitVec 32) (_ BitVec 64))) (size!17156 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34968)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34968 (_ BitVec 32)) SeekEntryResult!5197)

(assert (=> b!555317 (= res!347627 (= lt!252313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252315 (select (store (arr!16792 a!3118) i!1132 k0!1914) j!142) (array!34969 (store (arr!16792 a!3118) i!1132 k0!1914) (size!17156 a!3118)) mask!3119)))))

(declare-fun lt!252314 () (_ BitVec 32))

(assert (=> b!555317 (= lt!252313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252314 (select (arr!16792 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555317 (= lt!252315 (toIndex!0 (select (store (arr!16792 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555317 (= lt!252314 (toIndex!0 (select (arr!16792 a!3118) j!142) mask!3119))))

(declare-fun b!555318 () Bool)

(declare-fun e!320122 () Bool)

(assert (=> b!555318 (= e!320122 e!320121)))

(declare-fun res!347626 () Bool)

(assert (=> b!555318 (=> (not res!347626) (not e!320121))))

(declare-fun lt!252316 () SeekEntryResult!5197)

(assert (=> b!555318 (= res!347626 (or (= lt!252316 (MissingZero!5197 i!1132)) (= lt!252316 (MissingVacant!5197 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34968 (_ BitVec 32)) SeekEntryResult!5197)

(assert (=> b!555318 (= lt!252316 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555319 () Bool)

(declare-fun res!347629 () Bool)

(assert (=> b!555319 (=> (not res!347629) (not e!320121))))

(declare-datatypes ((List!10779 0))(
  ( (Nil!10776) (Cons!10775 (h!11763 (_ BitVec 64)) (t!16999 List!10779)) )
))
(declare-fun arrayNoDuplicates!0 (array!34968 (_ BitVec 32) List!10779) Bool)

(assert (=> b!555319 (= res!347629 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10776))))

(declare-fun b!555320 () Bool)

(declare-fun res!347624 () Bool)

(assert (=> b!555320 (=> (not res!347624) (not e!320122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555320 (= res!347624 (validKeyInArray!0 k0!1914))))

(declare-fun res!347630 () Bool)

(assert (=> start!50796 (=> (not res!347630) (not e!320122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50796 (= res!347630 (validMask!0 mask!3119))))

(assert (=> start!50796 e!320122))

(assert (=> start!50796 true))

(declare-fun array_inv!12651 (array!34968) Bool)

(assert (=> start!50796 (array_inv!12651 a!3118)))

(declare-fun b!555321 () Bool)

(declare-fun res!347631 () Bool)

(assert (=> b!555321 (=> (not res!347631) (not e!320121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34968 (_ BitVec 32)) Bool)

(assert (=> b!555321 (= res!347631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555322 () Bool)

(declare-fun res!347628 () Bool)

(assert (=> b!555322 (=> (not res!347628) (not e!320122))))

(declare-fun arrayContainsKey!0 (array!34968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555322 (= res!347628 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555323 () Bool)

(declare-fun res!347632 () Bool)

(assert (=> b!555323 (=> (not res!347632) (not e!320122))))

(assert (=> b!555323 (= res!347632 (validKeyInArray!0 (select (arr!16792 a!3118) j!142)))))

(declare-fun b!555324 () Bool)

(assert (=> b!555324 (= e!320123 (not true))))

(declare-fun lt!252311 () SeekEntryResult!5197)

(get-info :version)

(assert (=> b!555324 (and (= lt!252311 (Found!5197 j!142)) (or (undefined!6009 lt!252313) (not ((_ is Intermediate!5197) lt!252313)) (= (select (arr!16792 a!3118) (index!23017 lt!252313)) (select (arr!16792 a!3118) j!142)) (not (= (select (arr!16792 a!3118) (index!23017 lt!252313)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252311 (MissingZero!5197 (index!23017 lt!252313)))))))

(assert (=> b!555324 (= lt!252311 (seekEntryOrOpen!0 (select (arr!16792 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555324 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17239 0))(
  ( (Unit!17240) )
))
(declare-fun lt!252312 () Unit!17239)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17239)

(assert (=> b!555324 (= lt!252312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555325 () Bool)

(declare-fun res!347625 () Bool)

(assert (=> b!555325 (=> (not res!347625) (not e!320122))))

(assert (=> b!555325 (= res!347625 (and (= (size!17156 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17156 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17156 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50796 res!347630) b!555325))

(assert (= (and b!555325 res!347625) b!555323))

(assert (= (and b!555323 res!347632) b!555320))

(assert (= (and b!555320 res!347624) b!555322))

(assert (= (and b!555322 res!347628) b!555318))

(assert (= (and b!555318 res!347626) b!555321))

(assert (= (and b!555321 res!347631) b!555319))

(assert (= (and b!555319 res!347629) b!555317))

(assert (= (and b!555317 res!347627) b!555324))

(declare-fun m!533009 () Bool)

(assert (=> b!555320 m!533009))

(declare-fun m!533011 () Bool)

(assert (=> b!555321 m!533011))

(declare-fun m!533013 () Bool)

(assert (=> b!555319 m!533013))

(declare-fun m!533015 () Bool)

(assert (=> b!555322 m!533015))

(declare-fun m!533017 () Bool)

(assert (=> b!555323 m!533017))

(assert (=> b!555323 m!533017))

(declare-fun m!533019 () Bool)

(assert (=> b!555323 m!533019))

(assert (=> b!555324 m!533017))

(declare-fun m!533021 () Bool)

(assert (=> b!555324 m!533021))

(declare-fun m!533023 () Bool)

(assert (=> b!555324 m!533023))

(declare-fun m!533025 () Bool)

(assert (=> b!555324 m!533025))

(assert (=> b!555324 m!533017))

(declare-fun m!533027 () Bool)

(assert (=> b!555324 m!533027))

(declare-fun m!533029 () Bool)

(assert (=> b!555318 m!533029))

(assert (=> b!555317 m!533017))

(declare-fun m!533031 () Bool)

(assert (=> b!555317 m!533031))

(assert (=> b!555317 m!533017))

(declare-fun m!533033 () Bool)

(assert (=> b!555317 m!533033))

(assert (=> b!555317 m!533033))

(declare-fun m!533035 () Bool)

(assert (=> b!555317 m!533035))

(declare-fun m!533037 () Bool)

(assert (=> b!555317 m!533037))

(assert (=> b!555317 m!533017))

(declare-fun m!533039 () Bool)

(assert (=> b!555317 m!533039))

(assert (=> b!555317 m!533033))

(declare-fun m!533041 () Bool)

(assert (=> b!555317 m!533041))

(declare-fun m!533043 () Bool)

(assert (=> start!50796 m!533043))

(declare-fun m!533045 () Bool)

(assert (=> start!50796 m!533045))

(check-sat (not b!555320) (not b!555318) (not b!555317) (not b!555323) (not start!50796) (not b!555321) (not b!555322) (not b!555324) (not b!555319))
(check-sat)
