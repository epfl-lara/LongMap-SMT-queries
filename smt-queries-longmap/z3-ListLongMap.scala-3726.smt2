; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51338 () Bool)

(assert start!51338)

(declare-fun b!560245 () Bool)

(declare-fun res!351548 () Bool)

(declare-fun e!322781 () Bool)

(assert (=> b!560245 (=> (not res!351548) (not e!322781))))

(declare-datatypes ((array!35212 0))(
  ( (array!35213 (arr!16907 (Array (_ BitVec 32) (_ BitVec 64))) (size!17272 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35212)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560245 (= res!351548 (validKeyInArray!0 (select (arr!16907 a!3118) j!142)))))

(declare-fun res!351544 () Bool)

(assert (=> start!51338 (=> (not res!351544) (not e!322781))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51338 (= res!351544 (validMask!0 mask!3119))))

(assert (=> start!51338 e!322781))

(assert (=> start!51338 true))

(declare-fun array_inv!12790 (array!35212) Bool)

(assert (=> start!51338 (array_inv!12790 a!3118)))

(declare-fun b!560246 () Bool)

(declare-fun e!322779 () Bool)

(declare-fun e!322784 () Bool)

(assert (=> b!560246 (= e!322779 e!322784)))

(declare-fun res!351547 () Bool)

(assert (=> b!560246 (=> (not res!351547) (not e!322784))))

(declare-fun lt!254640 () (_ BitVec 64))

(declare-fun lt!254638 () (_ BitVec 32))

(declare-fun lt!254637 () array!35212)

(declare-datatypes ((SeekEntryResult!5353 0))(
  ( (MissingZero!5353 (index!23639 (_ BitVec 32))) (Found!5353 (index!23640 (_ BitVec 32))) (Intermediate!5353 (undefined!6165 Bool) (index!23641 (_ BitVec 32)) (x!52563 (_ BitVec 32))) (Undefined!5353) (MissingVacant!5353 (index!23642 (_ BitVec 32))) )
))
(declare-fun lt!254639 () SeekEntryResult!5353)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35212 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!560246 (= res!351547 (= lt!254639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254638 lt!254640 lt!254637 mask!3119)))))

(declare-fun lt!254643 () (_ BitVec 32))

(assert (=> b!560246 (= lt!254639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254643 (select (arr!16907 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560246 (= lt!254638 (toIndex!0 lt!254640 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560246 (= lt!254640 (select (store (arr!16907 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560246 (= lt!254643 (toIndex!0 (select (arr!16907 a!3118) j!142) mask!3119))))

(assert (=> b!560246 (= lt!254637 (array!35213 (store (arr!16907 a!3118) i!1132 k0!1914) (size!17272 a!3118)))))

(declare-fun b!560247 () Bool)

(declare-fun e!322782 () Bool)

(declare-fun e!322785 () Bool)

(assert (=> b!560247 (= e!322782 e!322785)))

(declare-fun res!351551 () Bool)

(assert (=> b!560247 (=> (not res!351551) (not e!322785))))

(declare-fun lt!254644 () SeekEntryResult!5353)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35212 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!560247 (= res!351551 (= lt!254644 (seekKeyOrZeroReturnVacant!0 (x!52563 lt!254639) (index!23641 lt!254639) (index!23641 lt!254639) (select (arr!16907 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560248 () Bool)

(declare-fun e!322780 () Bool)

(declare-fun e!322783 () Bool)

(assert (=> b!560248 (= e!322780 e!322783)))

(declare-fun res!351550 () Bool)

(assert (=> b!560248 (=> res!351550 e!322783)))

(get-info :version)

(assert (=> b!560248 (= res!351550 (or (undefined!6165 lt!254639) (not ((_ is Intermediate!5353) lt!254639))))))

(declare-fun b!560249 () Bool)

(declare-fun res!351545 () Bool)

(assert (=> b!560249 (=> (not res!351545) (not e!322781))))

(assert (=> b!560249 (= res!351545 (and (= (size!17272 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17272 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17272 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560250 () Bool)

(declare-fun res!351549 () Bool)

(assert (=> b!560250 (=> (not res!351549) (not e!322779))))

(declare-datatypes ((List!11026 0))(
  ( (Nil!11023) (Cons!11022 (h!12025 (_ BitVec 64)) (t!17245 List!11026)) )
))
(declare-fun arrayNoDuplicates!0 (array!35212 (_ BitVec 32) List!11026) Bool)

(assert (=> b!560250 (= res!351549 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11023))))

(declare-fun b!560251 () Bool)

(assert (=> b!560251 (= e!322784 (not true))))

(assert (=> b!560251 e!322780))

(declare-fun res!351541 () Bool)

(assert (=> b!560251 (=> (not res!351541) (not e!322780))))

(assert (=> b!560251 (= res!351541 (= lt!254644 (Found!5353 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35212 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!560251 (= lt!254644 (seekEntryOrOpen!0 (select (arr!16907 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35212 (_ BitVec 32)) Bool)

(assert (=> b!560251 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17466 0))(
  ( (Unit!17467) )
))
(declare-fun lt!254636 () Unit!17466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17466)

(assert (=> b!560251 (= lt!254636 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560252 () Bool)

(assert (=> b!560252 (= e!322785 (= (seekEntryOrOpen!0 lt!254640 lt!254637 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52563 lt!254639) (index!23641 lt!254639) (index!23641 lt!254639) lt!254640 lt!254637 mask!3119)))))

(declare-fun b!560253 () Bool)

(assert (=> b!560253 (= e!322781 e!322779)))

(declare-fun res!351546 () Bool)

(assert (=> b!560253 (=> (not res!351546) (not e!322779))))

(declare-fun lt!254642 () SeekEntryResult!5353)

(assert (=> b!560253 (= res!351546 (or (= lt!254642 (MissingZero!5353 i!1132)) (= lt!254642 (MissingVacant!5353 i!1132))))))

(assert (=> b!560253 (= lt!254642 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560254 () Bool)

(declare-fun res!351539 () Bool)

(assert (=> b!560254 (=> (not res!351539) (not e!322779))))

(assert (=> b!560254 (= res!351539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560255 () Bool)

(declare-fun res!351543 () Bool)

(assert (=> b!560255 (=> (not res!351543) (not e!322781))))

(declare-fun arrayContainsKey!0 (array!35212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560255 (= res!351543 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560256 () Bool)

(declare-fun res!351542 () Bool)

(assert (=> b!560256 (=> (not res!351542) (not e!322781))))

(assert (=> b!560256 (= res!351542 (validKeyInArray!0 k0!1914))))

(declare-fun b!560257 () Bool)

(assert (=> b!560257 (= e!322783 e!322782)))

(declare-fun res!351540 () Bool)

(assert (=> b!560257 (=> res!351540 e!322782)))

(declare-fun lt!254641 () (_ BitVec 64))

(assert (=> b!560257 (= res!351540 (or (= lt!254641 (select (arr!16907 a!3118) j!142)) (= lt!254641 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560257 (= lt!254641 (select (arr!16907 a!3118) (index!23641 lt!254639)))))

(assert (= (and start!51338 res!351544) b!560249))

(assert (= (and b!560249 res!351545) b!560245))

(assert (= (and b!560245 res!351548) b!560256))

(assert (= (and b!560256 res!351542) b!560255))

(assert (= (and b!560255 res!351543) b!560253))

(assert (= (and b!560253 res!351546) b!560254))

(assert (= (and b!560254 res!351539) b!560250))

(assert (= (and b!560250 res!351549) b!560246))

(assert (= (and b!560246 res!351547) b!560251))

(assert (= (and b!560251 res!351541) b!560248))

(assert (= (and b!560248 (not res!351550)) b!560257))

(assert (= (and b!560257 (not res!351540)) b!560247))

(assert (= (and b!560247 res!351551) b!560252))

(declare-fun m!537521 () Bool)

(assert (=> b!560245 m!537521))

(assert (=> b!560245 m!537521))

(declare-fun m!537523 () Bool)

(assert (=> b!560245 m!537523))

(declare-fun m!537525 () Bool)

(assert (=> b!560253 m!537525))

(assert (=> b!560257 m!537521))

(declare-fun m!537527 () Bool)

(assert (=> b!560257 m!537527))

(declare-fun m!537529 () Bool)

(assert (=> b!560252 m!537529))

(declare-fun m!537531 () Bool)

(assert (=> b!560252 m!537531))

(declare-fun m!537533 () Bool)

(assert (=> b!560254 m!537533))

(assert (=> b!560251 m!537521))

(assert (=> b!560251 m!537521))

(declare-fun m!537535 () Bool)

(assert (=> b!560251 m!537535))

(declare-fun m!537537 () Bool)

(assert (=> b!560251 m!537537))

(declare-fun m!537539 () Bool)

(assert (=> b!560251 m!537539))

(declare-fun m!537541 () Bool)

(assert (=> b!560250 m!537541))

(declare-fun m!537543 () Bool)

(assert (=> b!560255 m!537543))

(assert (=> b!560247 m!537521))

(assert (=> b!560247 m!537521))

(declare-fun m!537545 () Bool)

(assert (=> b!560247 m!537545))

(declare-fun m!537547 () Bool)

(assert (=> start!51338 m!537547))

(declare-fun m!537549 () Bool)

(assert (=> start!51338 m!537549))

(declare-fun m!537551 () Bool)

(assert (=> b!560256 m!537551))

(assert (=> b!560246 m!537521))

(declare-fun m!537553 () Bool)

(assert (=> b!560246 m!537553))

(assert (=> b!560246 m!537521))

(declare-fun m!537555 () Bool)

(assert (=> b!560246 m!537555))

(declare-fun m!537557 () Bool)

(assert (=> b!560246 m!537557))

(assert (=> b!560246 m!537521))

(declare-fun m!537559 () Bool)

(assert (=> b!560246 m!537559))

(declare-fun m!537561 () Bool)

(assert (=> b!560246 m!537561))

(declare-fun m!537563 () Bool)

(assert (=> b!560246 m!537563))

(check-sat (not b!560254) (not b!560255) (not b!560256) (not b!560250) (not b!560251) (not b!560247) (not b!560246) (not b!560253) (not b!560245) (not b!560252) (not start!51338))
(check-sat)
