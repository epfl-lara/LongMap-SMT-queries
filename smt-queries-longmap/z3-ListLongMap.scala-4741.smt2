; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65634 () Bool)

(assert start!65634)

(declare-fun b!747899 () Bool)

(declare-fun res!504137 () Bool)

(declare-fun e!417666 () Bool)

(assert (=> b!747899 (=> (not res!504137) (not e!417666))))

(declare-datatypes ((array!41677 0))(
  ( (array!41678 (arr!19948 (Array (_ BitVec 32) (_ BitVec 64))) (size!20368 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41677)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747899 (= res!504137 (validKeyInArray!0 (select (arr!19948 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!747900 () Bool)

(declare-datatypes ((SeekEntryResult!7504 0))(
  ( (MissingZero!7504 (index!32384 (_ BitVec 32))) (Found!7504 (index!32385 (_ BitVec 32))) (Intermediate!7504 (undefined!8316 Bool) (index!32386 (_ BitVec 32)) (x!63490 (_ BitVec 32))) (Undefined!7504) (MissingVacant!7504 (index!32387 (_ BitVec 32))) )
))
(declare-fun lt!332410 () SeekEntryResult!7504)

(declare-fun e!417661 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41677 (_ BitVec 32)) SeekEntryResult!7504)

(assert (=> b!747900 (= e!417661 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19948 a!3186) j!159) a!3186 mask!3328) lt!332410))))

(declare-fun b!747901 () Bool)

(declare-fun res!504126 () Bool)

(declare-fun e!417669 () Bool)

(assert (=> b!747901 (=> (not res!504126) (not e!417669))))

(declare-datatypes ((List!13857 0))(
  ( (Nil!13854) (Cons!13853 (h!14931 (_ BitVec 64)) (t!20164 List!13857)) )
))
(declare-fun arrayNoDuplicates!0 (array!41677 (_ BitVec 32) List!13857) Bool)

(assert (=> b!747901 (= res!504126 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13854))))

(declare-fun b!747902 () Bool)

(declare-fun res!504130 () Bool)

(declare-fun e!417662 () Bool)

(assert (=> b!747902 (=> res!504130 e!417662)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!332411 () (_ BitVec 64))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!747902 (= res!504130 (= (select (store (arr!19948 a!3186) i!1173 k0!2102) index!1321) lt!332411))))

(declare-fun b!747903 () Bool)

(assert (=> b!747903 (= e!417662 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747903 (= (select (store (arr!19948 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25573 0))(
  ( (Unit!25574) )
))
(declare-fun lt!332415 () Unit!25573)

(declare-fun e!417664 () Unit!25573)

(assert (=> b!747903 (= lt!332415 e!417664)))

(declare-fun c!82270 () Bool)

(assert (=> b!747903 (= c!82270 (= (select (store (arr!19948 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747904 () Bool)

(declare-fun Unit!25575 () Unit!25573)

(assert (=> b!747904 (= e!417664 Unit!25575)))

(assert (=> b!747904 false))

(declare-fun b!747905 () Bool)

(declare-fun res!504133 () Bool)

(assert (=> b!747905 (=> (not res!504133) (not e!417666))))

(declare-fun arrayContainsKey!0 (array!41677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747905 (= res!504133 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747906 () Bool)

(declare-fun res!504129 () Bool)

(declare-fun e!417668 () Bool)

(assert (=> b!747906 (=> (not res!504129) (not e!417668))))

(assert (=> b!747906 (= res!504129 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19948 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747907 () Bool)

(declare-fun e!417665 () Bool)

(assert (=> b!747907 (= e!417668 e!417665)))

(declare-fun res!504128 () Bool)

(assert (=> b!747907 (=> (not res!504128) (not e!417665))))

(declare-fun lt!332417 () SeekEntryResult!7504)

(declare-fun lt!332414 () SeekEntryResult!7504)

(assert (=> b!747907 (= res!504128 (= lt!332417 lt!332414))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!332418 () array!41677)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41677 (_ BitVec 32)) SeekEntryResult!7504)

(assert (=> b!747907 (= lt!332414 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332411 lt!332418 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747907 (= lt!332417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332411 mask!3328) lt!332411 lt!332418 mask!3328))))

(assert (=> b!747907 (= lt!332411 (select (store (arr!19948 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747907 (= lt!332418 (array!41678 (store (arr!19948 a!3186) i!1173 k0!2102) (size!20368 a!3186)))))

(declare-fun b!747908 () Bool)

(declare-fun res!504135 () Bool)

(assert (=> b!747908 (=> (not res!504135) (not e!417668))))

(declare-fun e!417667 () Bool)

(assert (=> b!747908 (= res!504135 e!417667)))

(declare-fun c!82271 () Bool)

(assert (=> b!747908 (= c!82271 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!332409 () SeekEntryResult!7504)

(declare-fun b!747909 () Bool)

(assert (=> b!747909 (= e!417667 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19948 a!3186) j!159) a!3186 mask!3328) lt!332409))))

(declare-fun b!747910 () Bool)

(declare-fun res!504136 () Bool)

(assert (=> b!747910 (=> (not res!504136) (not e!417666))))

(assert (=> b!747910 (= res!504136 (validKeyInArray!0 k0!2102))))

(declare-fun b!747911 () Bool)

(assert (=> b!747911 (= e!417669 e!417668)))

(declare-fun res!504141 () Bool)

(assert (=> b!747911 (=> (not res!504141) (not e!417668))))

(assert (=> b!747911 (= res!504141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19948 a!3186) j!159) mask!3328) (select (arr!19948 a!3186) j!159) a!3186 mask!3328) lt!332409))))

(assert (=> b!747911 (= lt!332409 (Intermediate!7504 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747912 () Bool)

(declare-fun res!504134 () Bool)

(assert (=> b!747912 (=> (not res!504134) (not e!417669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41677 (_ BitVec 32)) Bool)

(assert (=> b!747912 (= res!504134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747913 () Bool)

(assert (=> b!747913 (= e!417667 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19948 a!3186) j!159) a!3186 mask!3328) (Found!7504 j!159)))))

(declare-fun b!747914 () Bool)

(declare-fun res!504140 () Bool)

(assert (=> b!747914 (=> (not res!504140) (not e!417666))))

(assert (=> b!747914 (= res!504140 (and (= (size!20368 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20368 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20368 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747915 () Bool)

(declare-fun res!504142 () Bool)

(assert (=> b!747915 (=> res!504142 e!417662)))

(assert (=> b!747915 (= res!504142 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19948 a!3186) j!159) a!3186 mask!3328) lt!332410)))))

(declare-fun b!747916 () Bool)

(declare-fun res!504127 () Bool)

(assert (=> b!747916 (=> (not res!504127) (not e!417669))))

(assert (=> b!747916 (= res!504127 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20368 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20368 a!3186))))))

(declare-fun b!747917 () Bool)

(assert (=> b!747917 (= e!417665 (not e!417662))))

(declare-fun res!504132 () Bool)

(assert (=> b!747917 (=> res!504132 e!417662)))

(get-info :version)

(assert (=> b!747917 (= res!504132 (or (not ((_ is Intermediate!7504) lt!332414)) (bvslt x!1131 (x!63490 lt!332414)) (not (= x!1131 (x!63490 lt!332414))) (not (= index!1321 (index!32386 lt!332414)))))))

(assert (=> b!747917 e!417661))

(declare-fun res!504131 () Bool)

(assert (=> b!747917 (=> (not res!504131) (not e!417661))))

(declare-fun lt!332412 () SeekEntryResult!7504)

(assert (=> b!747917 (= res!504131 (= lt!332412 lt!332410))))

(assert (=> b!747917 (= lt!332410 (Found!7504 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41677 (_ BitVec 32)) SeekEntryResult!7504)

(assert (=> b!747917 (= lt!332412 (seekEntryOrOpen!0 (select (arr!19948 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747917 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332413 () Unit!25573)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25573)

(assert (=> b!747917 (= lt!332413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!504138 () Bool)

(assert (=> start!65634 (=> (not res!504138) (not e!417666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65634 (= res!504138 (validMask!0 mask!3328))))

(assert (=> start!65634 e!417666))

(assert (=> start!65634 true))

(declare-fun array_inv!15807 (array!41677) Bool)

(assert (=> start!65634 (array_inv!15807 a!3186)))

(declare-fun b!747918 () Bool)

(assert (=> b!747918 (= e!417666 e!417669)))

(declare-fun res!504139 () Bool)

(assert (=> b!747918 (=> (not res!504139) (not e!417669))))

(declare-fun lt!332416 () SeekEntryResult!7504)

(assert (=> b!747918 (= res!504139 (or (= lt!332416 (MissingZero!7504 i!1173)) (= lt!332416 (MissingVacant!7504 i!1173))))))

(assert (=> b!747918 (= lt!332416 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747919 () Bool)

(declare-fun Unit!25576 () Unit!25573)

(assert (=> b!747919 (= e!417664 Unit!25576)))

(assert (= (and start!65634 res!504138) b!747914))

(assert (= (and b!747914 res!504140) b!747899))

(assert (= (and b!747899 res!504137) b!747910))

(assert (= (and b!747910 res!504136) b!747905))

(assert (= (and b!747905 res!504133) b!747918))

(assert (= (and b!747918 res!504139) b!747912))

(assert (= (and b!747912 res!504134) b!747901))

(assert (= (and b!747901 res!504126) b!747916))

(assert (= (and b!747916 res!504127) b!747911))

(assert (= (and b!747911 res!504141) b!747906))

(assert (= (and b!747906 res!504129) b!747908))

(assert (= (and b!747908 c!82271) b!747909))

(assert (= (and b!747908 (not c!82271)) b!747913))

(assert (= (and b!747908 res!504135) b!747907))

(assert (= (and b!747907 res!504128) b!747917))

(assert (= (and b!747917 res!504131) b!747900))

(assert (= (and b!747917 (not res!504132)) b!747915))

(assert (= (and b!747915 (not res!504142)) b!747902))

(assert (= (and b!747902 (not res!504130)) b!747903))

(assert (= (and b!747903 c!82270) b!747904))

(assert (= (and b!747903 (not c!82270)) b!747919))

(declare-fun m!698463 () Bool)

(assert (=> b!747902 m!698463))

(declare-fun m!698465 () Bool)

(assert (=> b!747902 m!698465))

(declare-fun m!698467 () Bool)

(assert (=> b!747913 m!698467))

(assert (=> b!747913 m!698467))

(declare-fun m!698469 () Bool)

(assert (=> b!747913 m!698469))

(assert (=> b!747915 m!698467))

(assert (=> b!747915 m!698467))

(assert (=> b!747915 m!698469))

(declare-fun m!698471 () Bool)

(assert (=> b!747906 m!698471))

(assert (=> b!747909 m!698467))

(assert (=> b!747909 m!698467))

(declare-fun m!698473 () Bool)

(assert (=> b!747909 m!698473))

(assert (=> b!747917 m!698467))

(assert (=> b!747917 m!698467))

(declare-fun m!698475 () Bool)

(assert (=> b!747917 m!698475))

(declare-fun m!698477 () Bool)

(assert (=> b!747917 m!698477))

(declare-fun m!698479 () Bool)

(assert (=> b!747917 m!698479))

(assert (=> b!747900 m!698467))

(assert (=> b!747900 m!698467))

(declare-fun m!698481 () Bool)

(assert (=> b!747900 m!698481))

(declare-fun m!698483 () Bool)

(assert (=> b!747910 m!698483))

(assert (=> b!747911 m!698467))

(assert (=> b!747911 m!698467))

(declare-fun m!698485 () Bool)

(assert (=> b!747911 m!698485))

(assert (=> b!747911 m!698485))

(assert (=> b!747911 m!698467))

(declare-fun m!698487 () Bool)

(assert (=> b!747911 m!698487))

(declare-fun m!698489 () Bool)

(assert (=> b!747905 m!698489))

(declare-fun m!698491 () Bool)

(assert (=> b!747907 m!698491))

(assert (=> b!747907 m!698491))

(declare-fun m!698493 () Bool)

(assert (=> b!747907 m!698493))

(assert (=> b!747907 m!698463))

(declare-fun m!698495 () Bool)

(assert (=> b!747907 m!698495))

(declare-fun m!698497 () Bool)

(assert (=> b!747907 m!698497))

(assert (=> b!747899 m!698467))

(assert (=> b!747899 m!698467))

(declare-fun m!698499 () Bool)

(assert (=> b!747899 m!698499))

(assert (=> b!747903 m!698463))

(assert (=> b!747903 m!698465))

(declare-fun m!698501 () Bool)

(assert (=> b!747912 m!698501))

(declare-fun m!698503 () Bool)

(assert (=> b!747901 m!698503))

(declare-fun m!698505 () Bool)

(assert (=> start!65634 m!698505))

(declare-fun m!698507 () Bool)

(assert (=> start!65634 m!698507))

(declare-fun m!698509 () Bool)

(assert (=> b!747918 m!698509))

(check-sat (not b!747899) (not b!747909) (not b!747911) (not b!747912) (not b!747918) (not b!747917) (not b!747913) (not b!747905) (not b!747910) (not b!747900) (not b!747915) (not b!747907) (not b!747901) (not start!65634))
(check-sat)
