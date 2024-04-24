; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51384 () Bool)

(assert start!51384)

(declare-fun b!560482 () Bool)

(declare-fun e!322940 () Bool)

(assert (=> b!560482 (= e!322940 (not true))))

(declare-fun e!322942 () Bool)

(assert (=> b!560482 e!322942))

(declare-fun res!351533 () Bool)

(assert (=> b!560482 (=> (not res!351533) (not e!322942))))

(declare-datatypes ((SeekEntryResult!5302 0))(
  ( (MissingZero!5302 (index!23435 (_ BitVec 32))) (Found!5302 (index!23436 (_ BitVec 32))) (Intermediate!5302 (undefined!6114 Bool) (index!23437 (_ BitVec 32)) (x!52504 (_ BitVec 32))) (Undefined!5302) (MissingVacant!5302 (index!23438 (_ BitVec 32))) )
))
(declare-fun lt!254823 () SeekEntryResult!5302)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560482 (= res!351533 (= lt!254823 (Found!5302 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35196 0))(
  ( (array!35197 (arr!16897 (Array (_ BitVec 32) (_ BitVec 64))) (size!17261 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35196)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35196 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!560482 (= lt!254823 (seekEntryOrOpen!0 (select (arr!16897 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35196 (_ BitVec 32)) Bool)

(assert (=> b!560482 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17449 0))(
  ( (Unit!17450) )
))
(declare-fun lt!254821 () Unit!17449)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17449)

(assert (=> b!560482 (= lt!254821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560483 () Bool)

(declare-fun res!351536 () Bool)

(declare-fun e!322944 () Bool)

(assert (=> b!560483 (=> (not res!351536) (not e!322944))))

(assert (=> b!560483 (= res!351536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560484 () Bool)

(declare-fun res!351537 () Bool)

(declare-fun e!322939 () Bool)

(assert (=> b!560484 (=> (not res!351537) (not e!322939))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560484 (= res!351537 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560485 () Bool)

(declare-fun res!351530 () Bool)

(assert (=> b!560485 (=> (not res!351530) (not e!322939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560485 (= res!351530 (validKeyInArray!0 k0!1914))))

(declare-fun b!560486 () Bool)

(declare-fun res!351531 () Bool)

(assert (=> b!560486 (=> (not res!351531) (not e!322944))))

(declare-datatypes ((List!10884 0))(
  ( (Nil!10881) (Cons!10880 (h!11886 (_ BitVec 64)) (t!17104 List!10884)) )
))
(declare-fun arrayNoDuplicates!0 (array!35196 (_ BitVec 32) List!10884) Bool)

(assert (=> b!560486 (= res!351531 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10881))))

(declare-fun b!560487 () Bool)

(declare-fun e!322937 () Bool)

(declare-fun e!322941 () Bool)

(assert (=> b!560487 (= e!322937 e!322941)))

(declare-fun res!351539 () Bool)

(assert (=> b!560487 (=> res!351539 e!322941)))

(declare-fun lt!254819 () (_ BitVec 64))

(assert (=> b!560487 (= res!351539 (or (= lt!254819 (select (arr!16897 a!3118) j!142)) (= lt!254819 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!254824 () SeekEntryResult!5302)

(assert (=> b!560487 (= lt!254819 (select (arr!16897 a!3118) (index!23437 lt!254824)))))

(declare-fun b!560488 () Bool)

(assert (=> b!560488 (= e!322942 e!322937)))

(declare-fun res!351532 () Bool)

(assert (=> b!560488 (=> res!351532 e!322937)))

(get-info :version)

(assert (=> b!560488 (= res!351532 (or (undefined!6114 lt!254824) (not ((_ is Intermediate!5302) lt!254824))))))

(declare-fun res!351529 () Bool)

(assert (=> start!51384 (=> (not res!351529) (not e!322939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51384 (= res!351529 (validMask!0 mask!3119))))

(assert (=> start!51384 e!322939))

(assert (=> start!51384 true))

(declare-fun array_inv!12756 (array!35196) Bool)

(assert (=> start!51384 (array_inv!12756 a!3118)))

(declare-fun b!560489 () Bool)

(declare-fun res!351538 () Bool)

(assert (=> b!560489 (=> (not res!351538) (not e!322939))))

(assert (=> b!560489 (= res!351538 (validKeyInArray!0 (select (arr!16897 a!3118) j!142)))))

(declare-fun b!560490 () Bool)

(assert (=> b!560490 (= e!322944 e!322940)))

(declare-fun res!351535 () Bool)

(assert (=> b!560490 (=> (not res!351535) (not e!322940))))

(declare-fun lt!254826 () (_ BitVec 64))

(declare-fun lt!254825 () (_ BitVec 32))

(declare-fun lt!254827 () array!35196)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35196 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!560490 (= res!351535 (= lt!254824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254825 lt!254826 lt!254827 mask!3119)))))

(declare-fun lt!254822 () (_ BitVec 32))

(assert (=> b!560490 (= lt!254824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254822 (select (arr!16897 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560490 (= lt!254825 (toIndex!0 lt!254826 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560490 (= lt!254826 (select (store (arr!16897 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560490 (= lt!254822 (toIndex!0 (select (arr!16897 a!3118) j!142) mask!3119))))

(assert (=> b!560490 (= lt!254827 (array!35197 (store (arr!16897 a!3118) i!1132 k0!1914) (size!17261 a!3118)))))

(declare-fun b!560491 () Bool)

(declare-fun e!322943 () Bool)

(assert (=> b!560491 (= e!322941 e!322943)))

(declare-fun res!351540 () Bool)

(assert (=> b!560491 (=> (not res!351540) (not e!322943))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35196 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!560491 (= res!351540 (= lt!254823 (seekKeyOrZeroReturnVacant!0 (x!52504 lt!254824) (index!23437 lt!254824) (index!23437 lt!254824) (select (arr!16897 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560492 () Bool)

(assert (=> b!560492 (= e!322939 e!322944)))

(declare-fun res!351534 () Bool)

(assert (=> b!560492 (=> (not res!351534) (not e!322944))))

(declare-fun lt!254820 () SeekEntryResult!5302)

(assert (=> b!560492 (= res!351534 (or (= lt!254820 (MissingZero!5302 i!1132)) (= lt!254820 (MissingVacant!5302 i!1132))))))

(assert (=> b!560492 (= lt!254820 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560493 () Bool)

(declare-fun res!351541 () Bool)

(assert (=> b!560493 (=> (not res!351541) (not e!322939))))

(assert (=> b!560493 (= res!351541 (and (= (size!17261 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17261 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17261 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560494 () Bool)

(assert (=> b!560494 (= e!322943 (= (seekEntryOrOpen!0 lt!254826 lt!254827 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52504 lt!254824) (index!23437 lt!254824) (index!23437 lt!254824) lt!254826 lt!254827 mask!3119)))))

(assert (= (and start!51384 res!351529) b!560493))

(assert (= (and b!560493 res!351541) b!560489))

(assert (= (and b!560489 res!351538) b!560485))

(assert (= (and b!560485 res!351530) b!560484))

(assert (= (and b!560484 res!351537) b!560492))

(assert (= (and b!560492 res!351534) b!560483))

(assert (= (and b!560483 res!351536) b!560486))

(assert (= (and b!560486 res!351531) b!560490))

(assert (= (and b!560490 res!351535) b!560482))

(assert (= (and b!560482 res!351533) b!560488))

(assert (= (and b!560488 (not res!351532)) b!560487))

(assert (= (and b!560487 (not res!351539)) b!560491))

(assert (= (and b!560491 res!351540) b!560494))

(declare-fun m!538367 () Bool)

(assert (=> b!560489 m!538367))

(assert (=> b!560489 m!538367))

(declare-fun m!538369 () Bool)

(assert (=> b!560489 m!538369))

(assert (=> b!560490 m!538367))

(declare-fun m!538371 () Bool)

(assert (=> b!560490 m!538371))

(declare-fun m!538373 () Bool)

(assert (=> b!560490 m!538373))

(declare-fun m!538375 () Bool)

(assert (=> b!560490 m!538375))

(assert (=> b!560490 m!538367))

(declare-fun m!538377 () Bool)

(assert (=> b!560490 m!538377))

(assert (=> b!560490 m!538367))

(declare-fun m!538379 () Bool)

(assert (=> b!560490 m!538379))

(declare-fun m!538381 () Bool)

(assert (=> b!560490 m!538381))

(declare-fun m!538383 () Bool)

(assert (=> b!560486 m!538383))

(declare-fun m!538385 () Bool)

(assert (=> b!560485 m!538385))

(assert (=> b!560487 m!538367))

(declare-fun m!538387 () Bool)

(assert (=> b!560487 m!538387))

(declare-fun m!538389 () Bool)

(assert (=> b!560483 m!538389))

(declare-fun m!538391 () Bool)

(assert (=> b!560492 m!538391))

(assert (=> b!560482 m!538367))

(assert (=> b!560482 m!538367))

(declare-fun m!538393 () Bool)

(assert (=> b!560482 m!538393))

(declare-fun m!538395 () Bool)

(assert (=> b!560482 m!538395))

(declare-fun m!538397 () Bool)

(assert (=> b!560482 m!538397))

(assert (=> b!560491 m!538367))

(assert (=> b!560491 m!538367))

(declare-fun m!538399 () Bool)

(assert (=> b!560491 m!538399))

(declare-fun m!538401 () Bool)

(assert (=> b!560494 m!538401))

(declare-fun m!538403 () Bool)

(assert (=> b!560494 m!538403))

(declare-fun m!538405 () Bool)

(assert (=> start!51384 m!538405))

(declare-fun m!538407 () Bool)

(assert (=> start!51384 m!538407))

(declare-fun m!538409 () Bool)

(assert (=> b!560484 m!538409))

(check-sat (not start!51384) (not b!560485) (not b!560489) (not b!560492) (not b!560490) (not b!560483) (not b!560491) (not b!560494) (not b!560484) (not b!560486) (not b!560482))
(check-sat)
