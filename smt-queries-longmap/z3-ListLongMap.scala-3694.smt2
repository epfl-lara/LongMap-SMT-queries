; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50782 () Bool)

(assert start!50782)

(declare-fun b!555549 () Bool)

(declare-fun e!320185 () Bool)

(assert (=> b!555549 (= e!320185 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5262 0))(
  ( (MissingZero!5262 (index!23275 (_ BitVec 32))) (Found!5262 (index!23276 (_ BitVec 32))) (Intermediate!5262 (undefined!6074 Bool) (index!23277 (_ BitVec 32)) (x!52176 (_ BitVec 32))) (Undefined!5262) (MissingVacant!5262 (index!23278 (_ BitVec 32))) )
))
(declare-fun lt!252488 () SeekEntryResult!5262)

(declare-datatypes ((array!35007 0))(
  ( (array!35008 (arr!16813 (Array (_ BitVec 32) (_ BitVec 64))) (size!17177 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35007)

(declare-fun lt!252492 () SeekEntryResult!5262)

(get-info :version)

(assert (=> b!555549 (and (= lt!252488 (Found!5262 j!142)) (or (undefined!6074 lt!252492) (not ((_ is Intermediate!5262) lt!252492)) (= (select (arr!16813 a!3118) (index!23277 lt!252492)) (select (arr!16813 a!3118) j!142)) (not (= (select (arr!16813 a!3118) (index!23277 lt!252492)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252488 (MissingZero!5262 (index!23277 lt!252492)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35007 (_ BitVec 32)) SeekEntryResult!5262)

(assert (=> b!555549 (= lt!252488 (seekEntryOrOpen!0 (select (arr!16813 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35007 (_ BitVec 32)) Bool)

(assert (=> b!555549 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17298 0))(
  ( (Unit!17299) )
))
(declare-fun lt!252490 () Unit!17298)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17298)

(assert (=> b!555549 (= lt!252490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555551 () Bool)

(declare-fun res!347962 () Bool)

(declare-fun e!320186 () Bool)

(assert (=> b!555551 (=> (not res!347962) (not e!320186))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555551 (= res!347962 (validKeyInArray!0 k0!1914))))

(declare-fun b!555552 () Bool)

(declare-fun res!347966 () Bool)

(assert (=> b!555552 (=> (not res!347966) (not e!320186))))

(declare-fun arrayContainsKey!0 (array!35007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555552 (= res!347966 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555553 () Bool)

(declare-fun res!347961 () Bool)

(assert (=> b!555553 (=> (not res!347961) (not e!320186))))

(assert (=> b!555553 (= res!347961 (validKeyInArray!0 (select (arr!16813 a!3118) j!142)))))

(declare-fun b!555554 () Bool)

(declare-fun e!320184 () Bool)

(assert (=> b!555554 (= e!320186 e!320184)))

(declare-fun res!347969 () Bool)

(assert (=> b!555554 (=> (not res!347969) (not e!320184))))

(declare-fun lt!252489 () SeekEntryResult!5262)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555554 (= res!347969 (or (= lt!252489 (MissingZero!5262 i!1132)) (= lt!252489 (MissingVacant!5262 i!1132))))))

(assert (=> b!555554 (= lt!252489 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555555 () Bool)

(declare-fun res!347968 () Bool)

(assert (=> b!555555 (=> (not res!347968) (not e!320186))))

(assert (=> b!555555 (= res!347968 (and (= (size!17177 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17177 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17177 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555556 () Bool)

(declare-fun res!347963 () Bool)

(assert (=> b!555556 (=> (not res!347963) (not e!320184))))

(assert (=> b!555556 (= res!347963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555557 () Bool)

(assert (=> b!555557 (= e!320184 e!320185)))

(declare-fun res!347965 () Bool)

(assert (=> b!555557 (=> (not res!347965) (not e!320185))))

(declare-fun lt!252493 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35007 (_ BitVec 32)) SeekEntryResult!5262)

(assert (=> b!555557 (= res!347965 (= lt!252492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252493 (select (store (arr!16813 a!3118) i!1132 k0!1914) j!142) (array!35008 (store (arr!16813 a!3118) i!1132 k0!1914) (size!17177 a!3118)) mask!3119)))))

(declare-fun lt!252491 () (_ BitVec 32))

(assert (=> b!555557 (= lt!252492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252491 (select (arr!16813 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555557 (= lt!252493 (toIndex!0 (select (store (arr!16813 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555557 (= lt!252491 (toIndex!0 (select (arr!16813 a!3118) j!142) mask!3119))))

(declare-fun res!347964 () Bool)

(assert (=> start!50782 (=> (not res!347964) (not e!320186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50782 (= res!347964 (validMask!0 mask!3119))))

(assert (=> start!50782 e!320186))

(assert (=> start!50782 true))

(declare-fun array_inv!12609 (array!35007) Bool)

(assert (=> start!50782 (array_inv!12609 a!3118)))

(declare-fun b!555550 () Bool)

(declare-fun res!347967 () Bool)

(assert (=> b!555550 (=> (not res!347967) (not e!320184))))

(declare-datatypes ((List!10893 0))(
  ( (Nil!10890) (Cons!10889 (h!11874 (_ BitVec 64)) (t!17121 List!10893)) )
))
(declare-fun arrayNoDuplicates!0 (array!35007 (_ BitVec 32) List!10893) Bool)

(assert (=> b!555550 (= res!347967 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10890))))

(assert (= (and start!50782 res!347964) b!555555))

(assert (= (and b!555555 res!347968) b!555553))

(assert (= (and b!555553 res!347961) b!555551))

(assert (= (and b!555551 res!347962) b!555552))

(assert (= (and b!555552 res!347966) b!555554))

(assert (= (and b!555554 res!347969) b!555556))

(assert (= (and b!555556 res!347963) b!555550))

(assert (= (and b!555550 res!347967) b!555557))

(assert (= (and b!555557 res!347965) b!555549))

(declare-fun m!533279 () Bool)

(assert (=> b!555549 m!533279))

(declare-fun m!533281 () Bool)

(assert (=> b!555549 m!533281))

(declare-fun m!533283 () Bool)

(assert (=> b!555549 m!533283))

(declare-fun m!533285 () Bool)

(assert (=> b!555549 m!533285))

(assert (=> b!555549 m!533279))

(declare-fun m!533287 () Bool)

(assert (=> b!555549 m!533287))

(declare-fun m!533289 () Bool)

(assert (=> b!555552 m!533289))

(assert (=> b!555553 m!533279))

(assert (=> b!555553 m!533279))

(declare-fun m!533291 () Bool)

(assert (=> b!555553 m!533291))

(declare-fun m!533293 () Bool)

(assert (=> b!555556 m!533293))

(assert (=> b!555557 m!533279))

(declare-fun m!533295 () Bool)

(assert (=> b!555557 m!533295))

(assert (=> b!555557 m!533279))

(declare-fun m!533297 () Bool)

(assert (=> b!555557 m!533297))

(assert (=> b!555557 m!533279))

(declare-fun m!533299 () Bool)

(assert (=> b!555557 m!533299))

(declare-fun m!533301 () Bool)

(assert (=> b!555557 m!533301))

(assert (=> b!555557 m!533299))

(declare-fun m!533303 () Bool)

(assert (=> b!555557 m!533303))

(assert (=> b!555557 m!533299))

(declare-fun m!533305 () Bool)

(assert (=> b!555557 m!533305))

(declare-fun m!533307 () Bool)

(assert (=> b!555554 m!533307))

(declare-fun m!533309 () Bool)

(assert (=> b!555550 m!533309))

(declare-fun m!533311 () Bool)

(assert (=> start!50782 m!533311))

(declare-fun m!533313 () Bool)

(assert (=> start!50782 m!533313))

(declare-fun m!533315 () Bool)

(assert (=> b!555551 m!533315))

(check-sat (not b!555557) (not b!555549) (not b!555551) (not b!555554) (not start!50782) (not b!555550) (not b!555556) (not b!555553) (not b!555552))
(check-sat)
