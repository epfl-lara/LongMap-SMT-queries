; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50780 () Bool)

(assert start!50780)

(declare-fun b!555413 () Bool)

(declare-fun e!320071 () Bool)

(declare-fun e!320070 () Bool)

(assert (=> b!555413 (= e!320071 e!320070)))

(declare-fun res!347969 () Bool)

(assert (=> b!555413 (=> (not res!347969) (not e!320070))))

(declare-datatypes ((SeekEntryResult!5263 0))(
  ( (MissingZero!5263 (index!23279 (_ BitVec 32))) (Found!5263 (index!23280 (_ BitVec 32))) (Intermediate!5263 (undefined!6075 Bool) (index!23281 (_ BitVec 32)) (x!52188 (_ BitVec 32))) (Undefined!5263) (MissingVacant!5263 (index!23282 (_ BitVec 32))) )
))
(declare-fun lt!252346 () SeekEntryResult!5263)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555413 (= res!347969 (or (= lt!252346 (MissingZero!5263 i!1132)) (= lt!252346 (MissingVacant!5263 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35014 0))(
  ( (array!35015 (arr!16817 (Array (_ BitVec 32) (_ BitVec 64))) (size!17182 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35014)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35014 (_ BitVec 32)) SeekEntryResult!5263)

(assert (=> b!555413 (= lt!252346 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555414 () Bool)

(declare-fun e!320073 () Bool)

(assert (=> b!555414 (= e!320073 (not true))))

(declare-fun lt!252345 () SeekEntryResult!5263)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252348 () SeekEntryResult!5263)

(get-info :version)

(assert (=> b!555414 (and (= lt!252348 (Found!5263 j!142)) (or (undefined!6075 lt!252345) (not ((_ is Intermediate!5263) lt!252345)) (= (select (arr!16817 a!3118) (index!23281 lt!252345)) (select (arr!16817 a!3118) j!142)) (not (= (select (arr!16817 a!3118) (index!23281 lt!252345)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252348 (MissingZero!5263 (index!23281 lt!252345)))))))

(assert (=> b!555414 (= lt!252348 (seekEntryOrOpen!0 (select (arr!16817 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35014 (_ BitVec 32)) Bool)

(assert (=> b!555414 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17286 0))(
  ( (Unit!17287) )
))
(declare-fun lt!252349 () Unit!17286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17286)

(assert (=> b!555414 (= lt!252349 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555415 () Bool)

(declare-fun res!347970 () Bool)

(assert (=> b!555415 (=> (not res!347970) (not e!320070))))

(declare-datatypes ((List!10936 0))(
  ( (Nil!10933) (Cons!10932 (h!11917 (_ BitVec 64)) (t!17155 List!10936)) )
))
(declare-fun arrayNoDuplicates!0 (array!35014 (_ BitVec 32) List!10936) Bool)

(assert (=> b!555415 (= res!347970 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10933))))

(declare-fun b!555416 () Bool)

(declare-fun res!347967 () Bool)

(assert (=> b!555416 (=> (not res!347967) (not e!320071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555416 (= res!347967 (validKeyInArray!0 (select (arr!16817 a!3118) j!142)))))

(declare-fun b!555417 () Bool)

(assert (=> b!555417 (= e!320070 e!320073)))

(declare-fun res!347971 () Bool)

(assert (=> b!555417 (=> (not res!347971) (not e!320073))))

(declare-fun lt!252344 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35014 (_ BitVec 32)) SeekEntryResult!5263)

(assert (=> b!555417 (= res!347971 (= lt!252345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252344 (select (store (arr!16817 a!3118) i!1132 k0!1914) j!142) (array!35015 (store (arr!16817 a!3118) i!1132 k0!1914) (size!17182 a!3118)) mask!3119)))))

(declare-fun lt!252347 () (_ BitVec 32))

(assert (=> b!555417 (= lt!252345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252347 (select (arr!16817 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555417 (= lt!252344 (toIndex!0 (select (store (arr!16817 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555417 (= lt!252347 (toIndex!0 (select (arr!16817 a!3118) j!142) mask!3119))))

(declare-fun b!555418 () Bool)

(declare-fun res!347973 () Bool)

(assert (=> b!555418 (=> (not res!347973) (not e!320071))))

(assert (=> b!555418 (= res!347973 (validKeyInArray!0 k0!1914))))

(declare-fun b!555419 () Bool)

(declare-fun res!347972 () Bool)

(assert (=> b!555419 (=> (not res!347972) (not e!320071))))

(assert (=> b!555419 (= res!347972 (and (= (size!17182 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17182 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17182 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347974 () Bool)

(assert (=> start!50780 (=> (not res!347974) (not e!320071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50780 (= res!347974 (validMask!0 mask!3119))))

(assert (=> start!50780 e!320071))

(assert (=> start!50780 true))

(declare-fun array_inv!12700 (array!35014) Bool)

(assert (=> start!50780 (array_inv!12700 a!3118)))

(declare-fun b!555420 () Bool)

(declare-fun res!347975 () Bool)

(assert (=> b!555420 (=> (not res!347975) (not e!320070))))

(assert (=> b!555420 (= res!347975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555421 () Bool)

(declare-fun res!347968 () Bool)

(assert (=> b!555421 (=> (not res!347968) (not e!320071))))

(declare-fun arrayContainsKey!0 (array!35014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555421 (= res!347968 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50780 res!347974) b!555419))

(assert (= (and b!555419 res!347972) b!555416))

(assert (= (and b!555416 res!347967) b!555418))

(assert (= (and b!555418 res!347973) b!555421))

(assert (= (and b!555421 res!347968) b!555413))

(assert (= (and b!555413 res!347969) b!555420))

(assert (= (and b!555420 res!347975) b!555415))

(assert (= (and b!555415 res!347970) b!555417))

(assert (= (and b!555417 res!347971) b!555414))

(declare-fun m!532697 () Bool)

(assert (=> b!555416 m!532697))

(assert (=> b!555416 m!532697))

(declare-fun m!532699 () Bool)

(assert (=> b!555416 m!532699))

(declare-fun m!532701 () Bool)

(assert (=> b!555415 m!532701))

(declare-fun m!532703 () Bool)

(assert (=> b!555420 m!532703))

(declare-fun m!532705 () Bool)

(assert (=> b!555417 m!532705))

(declare-fun m!532707 () Bool)

(assert (=> b!555417 m!532707))

(assert (=> b!555417 m!532697))

(declare-fun m!532709 () Bool)

(assert (=> b!555417 m!532709))

(assert (=> b!555417 m!532697))

(assert (=> b!555417 m!532705))

(assert (=> b!555417 m!532697))

(declare-fun m!532711 () Bool)

(assert (=> b!555417 m!532711))

(declare-fun m!532713 () Bool)

(assert (=> b!555417 m!532713))

(assert (=> b!555417 m!532705))

(declare-fun m!532715 () Bool)

(assert (=> b!555417 m!532715))

(assert (=> b!555414 m!532697))

(declare-fun m!532717 () Bool)

(assert (=> b!555414 m!532717))

(declare-fun m!532719 () Bool)

(assert (=> b!555414 m!532719))

(declare-fun m!532721 () Bool)

(assert (=> b!555414 m!532721))

(assert (=> b!555414 m!532697))

(declare-fun m!532723 () Bool)

(assert (=> b!555414 m!532723))

(declare-fun m!532725 () Bool)

(assert (=> start!50780 m!532725))

(declare-fun m!532727 () Bool)

(assert (=> start!50780 m!532727))

(declare-fun m!532729 () Bool)

(assert (=> b!555421 m!532729))

(declare-fun m!532731 () Bool)

(assert (=> b!555418 m!532731))

(declare-fun m!532733 () Bool)

(assert (=> b!555413 m!532733))

(check-sat (not b!555418) (not b!555416) (not b!555421) (not b!555414) (not b!555417) (not b!555415) (not b!555413) (not start!50780) (not b!555420))
(check-sat)
