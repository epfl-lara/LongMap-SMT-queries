; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65386 () Bool)

(assert start!65386)

(declare-fun b!743847 () Bool)

(declare-fun res!500901 () Bool)

(declare-fun e!415566 () Bool)

(assert (=> b!743847 (=> (not res!500901) (not e!415566))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743847 (= res!500901 (validKeyInArray!0 k!2102))))

(declare-fun b!743848 () Bool)

(declare-fun res!500897 () Bool)

(declare-fun e!415569 () Bool)

(assert (=> b!743848 (=> (not res!500897) (not e!415569))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41559 0))(
  ( (array!41560 (arr!19893 (Array (_ BitVec 32) (_ BitVec 64))) (size!20314 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41559)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743848 (= res!500897 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20314 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20314 a!3186))))))

(declare-fun e!415567 () Bool)

(declare-datatypes ((SeekEntryResult!7493 0))(
  ( (MissingZero!7493 (index!32340 (_ BitVec 32))) (Found!7493 (index!32341 (_ BitVec 32))) (Intermediate!7493 (undefined!8305 Bool) (index!32342 (_ BitVec 32)) (x!63307 (_ BitVec 32))) (Undefined!7493) (MissingVacant!7493 (index!32343 (_ BitVec 32))) )
))
(declare-fun lt!330429 () SeekEntryResult!7493)

(declare-fun b!743849 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41559 (_ BitVec 32)) SeekEntryResult!7493)

(assert (=> b!743849 (= e!415567 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19893 a!3186) j!159) a!3186 mask!3328) lt!330429))))

(declare-fun b!743850 () Bool)

(declare-fun e!415571 () Bool)

(declare-fun e!415568 () Bool)

(assert (=> b!743850 (= e!415571 e!415568)))

(declare-fun res!500907 () Bool)

(assert (=> b!743850 (=> (not res!500907) (not e!415568))))

(declare-fun lt!330430 () SeekEntryResult!7493)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41559 (_ BitVec 32)) SeekEntryResult!7493)

(assert (=> b!743850 (= res!500907 (= (seekEntryOrOpen!0 (select (arr!19893 a!3186) j!159) a!3186 mask!3328) lt!330430))))

(assert (=> b!743850 (= lt!330430 (Found!7493 j!159))))

(declare-fun b!743851 () Bool)

(declare-fun res!500898 () Bool)

(assert (=> b!743851 (=> (not res!500898) (not e!415569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41559 (_ BitVec 32)) Bool)

(assert (=> b!743851 (= res!500898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743852 () Bool)

(declare-fun res!500902 () Bool)

(assert (=> b!743852 (=> (not res!500902) (not e!415566))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743852 (= res!500902 (and (= (size!20314 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20314 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20314 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743853 () Bool)

(declare-fun res!500910 () Bool)

(declare-fun e!415565 () Bool)

(assert (=> b!743853 (=> (not res!500910) (not e!415565))))

(assert (=> b!743853 (= res!500910 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19893 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743855 () Bool)

(assert (=> b!743855 (= e!415566 e!415569)))

(declare-fun res!500905 () Bool)

(assert (=> b!743855 (=> (not res!500905) (not e!415569))))

(declare-fun lt!330428 () SeekEntryResult!7493)

(assert (=> b!743855 (= res!500905 (or (= lt!330428 (MissingZero!7493 i!1173)) (= lt!330428 (MissingVacant!7493 i!1173))))))

(assert (=> b!743855 (= lt!330428 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743856 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41559 (_ BitVec 32)) SeekEntryResult!7493)

(assert (=> b!743856 (= e!415568 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19893 a!3186) j!159) a!3186 mask!3328) lt!330430))))

(declare-fun b!743857 () Bool)

(declare-fun res!500899 () Bool)

(assert (=> b!743857 (=> (not res!500899) (not e!415566))))

(declare-fun arrayContainsKey!0 (array!41559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743857 (= res!500899 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743858 () Bool)

(assert (=> b!743858 (= e!415567 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19893 a!3186) j!159) a!3186 mask!3328) (Found!7493 j!159)))))

(declare-fun b!743859 () Bool)

(declare-fun res!500903 () Bool)

(assert (=> b!743859 (=> (not res!500903) (not e!415565))))

(assert (=> b!743859 (= res!500903 e!415567)))

(declare-fun c!81856 () Bool)

(assert (=> b!743859 (= c!81856 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!500911 () Bool)

(assert (=> start!65386 (=> (not res!500911) (not e!415566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65386 (= res!500911 (validMask!0 mask!3328))))

(assert (=> start!65386 e!415566))

(assert (=> start!65386 true))

(declare-fun array_inv!15689 (array!41559) Bool)

(assert (=> start!65386 (array_inv!15689 a!3186)))

(declare-fun b!743854 () Bool)

(assert (=> b!743854 (= e!415569 e!415565)))

(declare-fun res!500896 () Bool)

(assert (=> b!743854 (=> (not res!500896) (not e!415565))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743854 (= res!500896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19893 a!3186) j!159) mask!3328) (select (arr!19893 a!3186) j!159) a!3186 mask!3328) lt!330429))))

(assert (=> b!743854 (= lt!330429 (Intermediate!7493 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743860 () Bool)

(declare-fun res!500912 () Bool)

(assert (=> b!743860 (=> (not res!500912) (not e!415569))))

(declare-datatypes ((List!13895 0))(
  ( (Nil!13892) (Cons!13891 (h!14963 (_ BitVec 64)) (t!20210 List!13895)) )
))
(declare-fun arrayNoDuplicates!0 (array!41559 (_ BitVec 32) List!13895) Bool)

(assert (=> b!743860 (= res!500912 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13892))))

(declare-fun b!743861 () Bool)

(declare-fun e!415563 () Bool)

(assert (=> b!743861 (= e!415565 e!415563)))

(declare-fun res!500906 () Bool)

(assert (=> b!743861 (=> (not res!500906) (not e!415563))))

(declare-fun lt!330427 () SeekEntryResult!7493)

(declare-fun lt!330431 () SeekEntryResult!7493)

(assert (=> b!743861 (= res!500906 (= lt!330427 lt!330431))))

(declare-fun lt!330433 () array!41559)

(declare-fun lt!330434 () (_ BitVec 64))

(assert (=> b!743861 (= lt!330431 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330434 lt!330433 mask!3328))))

(assert (=> b!743861 (= lt!330427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330434 mask!3328) lt!330434 lt!330433 mask!3328))))

(assert (=> b!743861 (= lt!330434 (select (store (arr!19893 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743861 (= lt!330433 (array!41560 (store (arr!19893 a!3186) i!1173 k!2102) (size!20314 a!3186)))))

(declare-fun e!415570 () Bool)

(declare-fun b!743862 () Bool)

(assert (=> b!743862 (= e!415570 (or (= (select (store (arr!19893 a!3186) i!1173 k!2102) index!1321) lt!330434) (not (= (select (store (arr!19893 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!743863 () Bool)

(declare-fun res!500909 () Bool)

(assert (=> b!743863 (=> (not res!500909) (not e!415566))))

(assert (=> b!743863 (= res!500909 (validKeyInArray!0 (select (arr!19893 a!3186) j!159)))))

(declare-fun b!743864 () Bool)

(assert (=> b!743864 (= e!415563 (not e!415570))))

(declare-fun res!500908 () Bool)

(assert (=> b!743864 (=> res!500908 e!415570)))

(assert (=> b!743864 (= res!500908 (or (not (is-Intermediate!7493 lt!330431)) (bvslt x!1131 (x!63307 lt!330431)) (not (= x!1131 (x!63307 lt!330431))) (not (= index!1321 (index!32342 lt!330431)))))))

(assert (=> b!743864 e!415571))

(declare-fun res!500904 () Bool)

(assert (=> b!743864 (=> (not res!500904) (not e!415571))))

(assert (=> b!743864 (= res!500904 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25466 0))(
  ( (Unit!25467) )
))
(declare-fun lt!330432 () Unit!25466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25466)

(assert (=> b!743864 (= lt!330432 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743865 () Bool)

(declare-fun res!500900 () Bool)

(assert (=> b!743865 (=> res!500900 e!415570)))

(assert (=> b!743865 (= res!500900 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19893 a!3186) j!159) a!3186 mask!3328) (Found!7493 j!159))))))

(assert (= (and start!65386 res!500911) b!743852))

(assert (= (and b!743852 res!500902) b!743863))

(assert (= (and b!743863 res!500909) b!743847))

(assert (= (and b!743847 res!500901) b!743857))

(assert (= (and b!743857 res!500899) b!743855))

(assert (= (and b!743855 res!500905) b!743851))

(assert (= (and b!743851 res!500898) b!743860))

(assert (= (and b!743860 res!500912) b!743848))

(assert (= (and b!743848 res!500897) b!743854))

(assert (= (and b!743854 res!500896) b!743853))

(assert (= (and b!743853 res!500910) b!743859))

(assert (= (and b!743859 c!81856) b!743849))

(assert (= (and b!743859 (not c!81856)) b!743858))

(assert (= (and b!743859 res!500903) b!743861))

(assert (= (and b!743861 res!500906) b!743864))

(assert (= (and b!743864 res!500904) b!743850))

(assert (= (and b!743850 res!500907) b!743856))

(assert (= (and b!743864 (not res!500908)) b!743865))

(assert (= (and b!743865 (not res!500900)) b!743862))

(declare-fun m!694465 () Bool)

(assert (=> b!743849 m!694465))

(assert (=> b!743849 m!694465))

(declare-fun m!694467 () Bool)

(assert (=> b!743849 m!694467))

(assert (=> b!743856 m!694465))

(assert (=> b!743856 m!694465))

(declare-fun m!694469 () Bool)

(assert (=> b!743856 m!694469))

(declare-fun m!694471 () Bool)

(assert (=> b!743861 m!694471))

(declare-fun m!694473 () Bool)

(assert (=> b!743861 m!694473))

(declare-fun m!694475 () Bool)

(assert (=> b!743861 m!694475))

(declare-fun m!694477 () Bool)

(assert (=> b!743861 m!694477))

(assert (=> b!743861 m!694473))

(declare-fun m!694479 () Bool)

(assert (=> b!743861 m!694479))

(assert (=> b!743865 m!694465))

(assert (=> b!743865 m!694465))

(declare-fun m!694481 () Bool)

(assert (=> b!743865 m!694481))

(assert (=> b!743862 m!694475))

(declare-fun m!694483 () Bool)

(assert (=> b!743862 m!694483))

(declare-fun m!694485 () Bool)

(assert (=> b!743857 m!694485))

(assert (=> b!743863 m!694465))

(assert (=> b!743863 m!694465))

(declare-fun m!694487 () Bool)

(assert (=> b!743863 m!694487))

(declare-fun m!694489 () Bool)

(assert (=> b!743855 m!694489))

(declare-fun m!694491 () Bool)

(assert (=> b!743853 m!694491))

(declare-fun m!694493 () Bool)

(assert (=> b!743864 m!694493))

(declare-fun m!694495 () Bool)

(assert (=> b!743864 m!694495))

(declare-fun m!694497 () Bool)

(assert (=> b!743847 m!694497))

(declare-fun m!694499 () Bool)

(assert (=> b!743851 m!694499))

(declare-fun m!694501 () Bool)

(assert (=> b!743860 m!694501))

(assert (=> b!743850 m!694465))

(assert (=> b!743850 m!694465))

(declare-fun m!694503 () Bool)

(assert (=> b!743850 m!694503))

(assert (=> b!743858 m!694465))

(assert (=> b!743858 m!694465))

(assert (=> b!743858 m!694481))

(assert (=> b!743854 m!694465))

(assert (=> b!743854 m!694465))

(declare-fun m!694505 () Bool)

(assert (=> b!743854 m!694505))

(assert (=> b!743854 m!694505))

(assert (=> b!743854 m!694465))

(declare-fun m!694507 () Bool)

(assert (=> b!743854 m!694507))

(declare-fun m!694509 () Bool)

(assert (=> start!65386 m!694509))

(declare-fun m!694511 () Bool)

(assert (=> start!65386 m!694511))

(push 1)

