; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67240 () Bool)

(assert start!67240)

(declare-fun res!524463 () Bool)

(declare-fun e!431880 () Bool)

(assert (=> start!67240 (=> (not res!524463) (not e!431880))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67240 (= res!524463 (validMask!0 mask!3328))))

(assert (=> start!67240 e!431880))

(assert (=> start!67240 true))

(declare-datatypes ((array!42475 0))(
  ( (array!42476 (arr!20329 (Array (_ BitVec 32) (_ BitVec 64))) (size!20749 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42475)

(declare-fun array_inv!16188 (array!42475) Bool)

(assert (=> start!67240 (array_inv!16188 a!3186)))

(declare-fun b!775842 () Bool)

(declare-fun res!524477 () Bool)

(assert (=> b!775842 (=> (not res!524477) (not e!431880))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775842 (= res!524477 (validKeyInArray!0 (select (arr!20329 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7885 0))(
  ( (MissingZero!7885 (index!33908 (_ BitVec 32))) (Found!7885 (index!33909 (_ BitVec 32))) (Intermediate!7885 (undefined!8697 Bool) (index!33910 (_ BitVec 32)) (x!65015 (_ BitVec 32))) (Undefined!7885) (MissingVacant!7885 (index!33911 (_ BitVec 32))) )
))
(declare-fun lt!345583 () SeekEntryResult!7885)

(declare-fun b!775843 () Bool)

(declare-fun e!431876 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42475 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!775843 (= e!431876 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345583))))

(declare-fun b!775844 () Bool)

(declare-fun lt!345579 () (_ BitVec 32))

(declare-fun lt!345581 () SeekEntryResult!7885)

(declare-fun e!431882 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!775844 (= e!431882 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345579 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345581)))))

(declare-fun lt!345574 () SeekEntryResult!7885)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!431883 () Bool)

(declare-fun b!775845 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42475 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!775845 (= e!431883 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345574))))

(declare-fun b!775846 () Bool)

(declare-fun res!524461 () Bool)

(declare-fun e!431873 () Bool)

(assert (=> b!775846 (=> (not res!524461) (not e!431873))))

(assert (=> b!775846 (= res!524461 e!431883)))

(declare-fun c!86096 () Bool)

(assert (=> b!775846 (= c!86096 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775847 () Bool)

(declare-fun e!431879 () Bool)

(assert (=> b!775847 (= e!431879 true)))

(declare-fun lt!345575 () (_ BitVec 64))

(declare-fun lt!345573 () array!42475)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42475 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!775847 (= (seekEntryOrOpen!0 lt!345575 lt!345573 mask!3328) lt!345581)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((Unit!26731 0))(
  ( (Unit!26732) )
))
(declare-fun lt!345570 () Unit!26731)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26731)

(assert (=> b!775847 (= lt!345570 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345579 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775848 () Bool)

(declare-fun res!524465 () Bool)

(declare-fun e!431881 () Bool)

(assert (=> b!775848 (=> (not res!524465) (not e!431881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42475 (_ BitVec 32)) Bool)

(assert (=> b!775848 (= res!524465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775849 () Bool)

(declare-fun e!431874 () Bool)

(assert (=> b!775849 (= e!431873 e!431874)))

(declare-fun res!524462 () Bool)

(assert (=> b!775849 (=> (not res!524462) (not e!431874))))

(declare-fun lt!345582 () SeekEntryResult!7885)

(declare-fun lt!345577 () SeekEntryResult!7885)

(assert (=> b!775849 (= res!524462 (= lt!345582 lt!345577))))

(assert (=> b!775849 (= lt!345577 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345575 lt!345573 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775849 (= lt!345582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345575 mask!3328) lt!345575 lt!345573 mask!3328))))

(assert (=> b!775849 (= lt!345575 (select (store (arr!20329 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775849 (= lt!345573 (array!42476 (store (arr!20329 a!3186) i!1173 k0!2102) (size!20749 a!3186)))))

(declare-fun b!775850 () Bool)

(assert (=> b!775850 (= e!431881 e!431873)))

(declare-fun res!524468 () Bool)

(assert (=> b!775850 (=> (not res!524468) (not e!431873))))

(assert (=> b!775850 (= res!524468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20329 a!3186) j!159) mask!3328) (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345574))))

(assert (=> b!775850 (= lt!345574 (Intermediate!7885 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775851 () Bool)

(declare-fun res!524476 () Bool)

(assert (=> b!775851 (=> (not res!524476) (not e!431880))))

(assert (=> b!775851 (= res!524476 (and (= (size!20749 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20749 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20749 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775852 () Bool)

(declare-fun e!431877 () Bool)

(assert (=> b!775852 (= e!431877 e!431876)))

(declare-fun res!524471 () Bool)

(assert (=> b!775852 (=> (not res!524471) (not e!431876))))

(assert (=> b!775852 (= res!524471 (= (seekEntryOrOpen!0 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345583))))

(assert (=> b!775852 (= lt!345583 (Found!7885 j!159))))

(declare-fun b!775853 () Bool)

(declare-fun res!524467 () Bool)

(assert (=> b!775853 (=> res!524467 e!431879)))

(assert (=> b!775853 (= res!524467 (not (= lt!345582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345579 lt!345575 lt!345573 mask!3328))))))

(declare-fun b!775854 () Bool)

(declare-fun res!524469 () Bool)

(assert (=> b!775854 (=> (not res!524469) (not e!431880))))

(declare-fun arrayContainsKey!0 (array!42475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775854 (= res!524469 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775855 () Bool)

(declare-fun res!524466 () Bool)

(assert (=> b!775855 (=> (not res!524466) (not e!431881))))

(assert (=> b!775855 (= res!524466 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20749 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20749 a!3186))))))

(declare-fun b!775856 () Bool)

(declare-fun e!431884 () Bool)

(assert (=> b!775856 (= e!431884 e!431879)))

(declare-fun res!524464 () Bool)

(assert (=> b!775856 (=> res!524464 e!431879)))

(assert (=> b!775856 (= res!524464 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345579 #b00000000000000000000000000000000) (bvsge lt!345579 (size!20749 a!3186))))))

(declare-fun lt!345576 () Unit!26731)

(declare-fun e!431878 () Unit!26731)

(assert (=> b!775856 (= lt!345576 e!431878)))

(declare-fun c!86095 () Bool)

(declare-fun lt!345572 () Bool)

(assert (=> b!775856 (= c!86095 lt!345572)))

(assert (=> b!775856 (= lt!345572 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775856 (= lt!345579 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!775857 () Bool)

(assert (=> b!775857 (= e!431883 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) (Found!7885 j!159)))))

(declare-fun b!775858 () Bool)

(assert (=> b!775858 (= e!431874 (not e!431884))))

(declare-fun res!524474 () Bool)

(assert (=> b!775858 (=> res!524474 e!431884)))

(get-info :version)

(assert (=> b!775858 (= res!524474 (or (not ((_ is Intermediate!7885) lt!345577)) (bvsge x!1131 (x!65015 lt!345577))))))

(assert (=> b!775858 (= lt!345581 (Found!7885 j!159))))

(assert (=> b!775858 e!431877))

(declare-fun res!524475 () Bool)

(assert (=> b!775858 (=> (not res!524475) (not e!431877))))

(assert (=> b!775858 (= res!524475 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345571 () Unit!26731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26731)

(assert (=> b!775858 (= lt!345571 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775859 () Bool)

(declare-fun Unit!26733 () Unit!26731)

(assert (=> b!775859 (= e!431878 Unit!26733)))

(declare-fun lt!345580 () SeekEntryResult!7885)

(assert (=> b!775859 (= lt!345580 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775859 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345579 resIntermediateIndex!5 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345581)))

(declare-fun b!775860 () Bool)

(declare-fun Unit!26734 () Unit!26731)

(assert (=> b!775860 (= e!431878 Unit!26734)))

(assert (=> b!775860 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345579 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345574)))

(declare-fun b!775861 () Bool)

(declare-fun res!524473 () Bool)

(assert (=> b!775861 (=> (not res!524473) (not e!431881))))

(declare-datatypes ((List!14238 0))(
  ( (Nil!14235) (Cons!14234 (h!15348 (_ BitVec 64)) (t!20545 List!14238)) )
))
(declare-fun arrayNoDuplicates!0 (array!42475 (_ BitVec 32) List!14238) Bool)

(assert (=> b!775861 (= res!524473 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14235))))

(declare-fun b!775862 () Bool)

(assert (=> b!775862 (= e!431882 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345579 (select (arr!20329 a!3186) j!159) a!3186 mask!3328) lt!345574)))))

(declare-fun b!775863 () Bool)

(declare-fun res!524472 () Bool)

(assert (=> b!775863 (=> (not res!524472) (not e!431880))))

(assert (=> b!775863 (= res!524472 (validKeyInArray!0 k0!2102))))

(declare-fun b!775864 () Bool)

(declare-fun res!524460 () Bool)

(assert (=> b!775864 (=> res!524460 e!431879)))

(assert (=> b!775864 (= res!524460 e!431882)))

(declare-fun c!86094 () Bool)

(assert (=> b!775864 (= c!86094 lt!345572)))

(declare-fun b!775865 () Bool)

(declare-fun res!524470 () Bool)

(assert (=> b!775865 (=> (not res!524470) (not e!431873))))

(assert (=> b!775865 (= res!524470 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20329 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775866 () Bool)

(assert (=> b!775866 (= e!431880 e!431881)))

(declare-fun res!524478 () Bool)

(assert (=> b!775866 (=> (not res!524478) (not e!431881))))

(declare-fun lt!345578 () SeekEntryResult!7885)

(assert (=> b!775866 (= res!524478 (or (= lt!345578 (MissingZero!7885 i!1173)) (= lt!345578 (MissingVacant!7885 i!1173))))))

(assert (=> b!775866 (= lt!345578 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67240 res!524463) b!775851))

(assert (= (and b!775851 res!524476) b!775842))

(assert (= (and b!775842 res!524477) b!775863))

(assert (= (and b!775863 res!524472) b!775854))

(assert (= (and b!775854 res!524469) b!775866))

(assert (= (and b!775866 res!524478) b!775848))

(assert (= (and b!775848 res!524465) b!775861))

(assert (= (and b!775861 res!524473) b!775855))

(assert (= (and b!775855 res!524466) b!775850))

(assert (= (and b!775850 res!524468) b!775865))

(assert (= (and b!775865 res!524470) b!775846))

(assert (= (and b!775846 c!86096) b!775845))

(assert (= (and b!775846 (not c!86096)) b!775857))

(assert (= (and b!775846 res!524461) b!775849))

(assert (= (and b!775849 res!524462) b!775858))

(assert (= (and b!775858 res!524475) b!775852))

(assert (= (and b!775852 res!524471) b!775843))

(assert (= (and b!775858 (not res!524474)) b!775856))

(assert (= (and b!775856 c!86095) b!775860))

(assert (= (and b!775856 (not c!86095)) b!775859))

(assert (= (and b!775856 (not res!524464)) b!775864))

(assert (= (and b!775864 c!86094) b!775862))

(assert (= (and b!775864 (not c!86094)) b!775844))

(assert (= (and b!775864 (not res!524460)) b!775853))

(assert (= (and b!775853 (not res!524467)) b!775847))

(declare-fun m!720539 () Bool)

(assert (=> b!775848 m!720539))

(declare-fun m!720541 () Bool)

(assert (=> b!775852 m!720541))

(assert (=> b!775852 m!720541))

(declare-fun m!720543 () Bool)

(assert (=> b!775852 m!720543))

(declare-fun m!720545 () Bool)

(assert (=> b!775866 m!720545))

(declare-fun m!720547 () Bool)

(assert (=> b!775856 m!720547))

(declare-fun m!720549 () Bool)

(assert (=> b!775853 m!720549))

(assert (=> b!775859 m!720541))

(assert (=> b!775859 m!720541))

(declare-fun m!720551 () Bool)

(assert (=> b!775859 m!720551))

(assert (=> b!775859 m!720541))

(declare-fun m!720553 () Bool)

(assert (=> b!775859 m!720553))

(declare-fun m!720555 () Bool)

(assert (=> b!775858 m!720555))

(declare-fun m!720557 () Bool)

(assert (=> b!775858 m!720557))

(assert (=> b!775842 m!720541))

(assert (=> b!775842 m!720541))

(declare-fun m!720559 () Bool)

(assert (=> b!775842 m!720559))

(assert (=> b!775862 m!720541))

(assert (=> b!775862 m!720541))

(declare-fun m!720561 () Bool)

(assert (=> b!775862 m!720561))

(assert (=> b!775860 m!720541))

(assert (=> b!775860 m!720541))

(assert (=> b!775860 m!720561))

(assert (=> b!775844 m!720541))

(assert (=> b!775844 m!720541))

(assert (=> b!775844 m!720553))

(declare-fun m!720563 () Bool)

(assert (=> start!67240 m!720563))

(declare-fun m!720565 () Bool)

(assert (=> start!67240 m!720565))

(declare-fun m!720567 () Bool)

(assert (=> b!775847 m!720567))

(declare-fun m!720569 () Bool)

(assert (=> b!775847 m!720569))

(assert (=> b!775857 m!720541))

(assert (=> b!775857 m!720541))

(assert (=> b!775857 m!720551))

(declare-fun m!720571 () Bool)

(assert (=> b!775849 m!720571))

(declare-fun m!720573 () Bool)

(assert (=> b!775849 m!720573))

(declare-fun m!720575 () Bool)

(assert (=> b!775849 m!720575))

(assert (=> b!775849 m!720571))

(declare-fun m!720577 () Bool)

(assert (=> b!775849 m!720577))

(declare-fun m!720579 () Bool)

(assert (=> b!775849 m!720579))

(declare-fun m!720581 () Bool)

(assert (=> b!775861 m!720581))

(declare-fun m!720583 () Bool)

(assert (=> b!775854 m!720583))

(declare-fun m!720585 () Bool)

(assert (=> b!775863 m!720585))

(assert (=> b!775843 m!720541))

(assert (=> b!775843 m!720541))

(declare-fun m!720587 () Bool)

(assert (=> b!775843 m!720587))

(declare-fun m!720589 () Bool)

(assert (=> b!775865 m!720589))

(assert (=> b!775845 m!720541))

(assert (=> b!775845 m!720541))

(declare-fun m!720591 () Bool)

(assert (=> b!775845 m!720591))

(assert (=> b!775850 m!720541))

(assert (=> b!775850 m!720541))

(declare-fun m!720593 () Bool)

(assert (=> b!775850 m!720593))

(assert (=> b!775850 m!720593))

(assert (=> b!775850 m!720541))

(declare-fun m!720595 () Bool)

(assert (=> b!775850 m!720595))

(check-sat (not b!775861) (not b!775862) (not b!775852) (not b!775848) (not b!775860) (not b!775847) (not b!775853) (not b!775842) (not b!775849) (not start!67240) (not b!775844) (not b!775856) (not b!775843) (not b!775854) (not b!775857) (not b!775845) (not b!775858) (not b!775863) (not b!775850) (not b!775859) (not b!775866))
(check-sat)
