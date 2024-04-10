; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64708 () Bool)

(assert start!64708)

(declare-fun b!729874 () Bool)

(declare-fun e!408481 () Bool)

(declare-fun e!408480 () Bool)

(assert (=> b!729874 (= e!408481 e!408480)))

(declare-fun res!490234 () Bool)

(assert (=> b!729874 (=> (not res!490234) (not e!408480))))

(declare-datatypes ((array!41157 0))(
  ( (array!41158 (arr!19698 (Array (_ BitVec 32) (_ BitVec 64))) (size!20119 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41157)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7298 0))(
  ( (MissingZero!7298 (index!31560 (_ BitVec 32))) (Found!7298 (index!31561 (_ BitVec 32))) (Intermediate!7298 (undefined!8110 Bool) (index!31562 (_ BitVec 32)) (x!62544 (_ BitVec 32))) (Undefined!7298) (MissingVacant!7298 (index!31563 (_ BitVec 32))) )
))
(declare-fun lt!323382 () SeekEntryResult!7298)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41157 (_ BitVec 32)) SeekEntryResult!7298)

(assert (=> b!729874 (= res!490234 (= (seekEntryOrOpen!0 (select (arr!19698 a!3186) j!159) a!3186 mask!3328) lt!323382))))

(assert (=> b!729874 (= lt!323382 (Found!7298 j!159))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!408483 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!729875 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729875 (= e!408483 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323379 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729875 (= lt!323379 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729876 () Bool)

(declare-fun res!490239 () Bool)

(declare-fun e!408486 () Bool)

(assert (=> b!729876 (=> (not res!490239) (not e!408486))))

(declare-fun e!408484 () Bool)

(assert (=> b!729876 (= res!490239 e!408484)))

(declare-fun c!80197 () Bool)

(assert (=> b!729876 (= c!80197 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!729877 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41157 (_ BitVec 32)) SeekEntryResult!7298)

(assert (=> b!729877 (= e!408484 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19698 a!3186) j!159) a!3186 mask!3328) (Found!7298 j!159)))))

(declare-fun b!729878 () Bool)

(declare-fun lt!323383 () SeekEntryResult!7298)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41157 (_ BitVec 32)) SeekEntryResult!7298)

(assert (=> b!729878 (= e!408484 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19698 a!3186) j!159) a!3186 mask!3328) lt!323383))))

(declare-fun b!729879 () Bool)

(declare-fun res!490237 () Bool)

(declare-fun e!408482 () Bool)

(assert (=> b!729879 (=> (not res!490237) (not e!408482))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729879 (= res!490237 (and (= (size!20119 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20119 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20119 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729881 () Bool)

(declare-fun res!490244 () Bool)

(assert (=> b!729881 (=> (not res!490244) (not e!408482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729881 (= res!490244 (validKeyInArray!0 (select (arr!19698 a!3186) j!159)))))

(declare-fun b!729882 () Bool)

(declare-fun e!408487 () Bool)

(assert (=> b!729882 (= e!408487 (not e!408483))))

(declare-fun res!490238 () Bool)

(assert (=> b!729882 (=> res!490238 e!408483)))

(declare-fun lt!323387 () SeekEntryResult!7298)

(assert (=> b!729882 (= res!490238 (or (not (is-Intermediate!7298 lt!323387)) (bvsge x!1131 (x!62544 lt!323387))))))

(assert (=> b!729882 e!408481))

(declare-fun res!490240 () Bool)

(assert (=> b!729882 (=> (not res!490240) (not e!408481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41157 (_ BitVec 32)) Bool)

(assert (=> b!729882 (= res!490240 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24914 0))(
  ( (Unit!24915) )
))
(declare-fun lt!323380 () Unit!24914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24914)

(assert (=> b!729882 (= lt!323380 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729883 () Bool)

(declare-fun e!408485 () Bool)

(assert (=> b!729883 (= e!408482 e!408485)))

(declare-fun res!490229 () Bool)

(assert (=> b!729883 (=> (not res!490229) (not e!408485))))

(declare-fun lt!323385 () SeekEntryResult!7298)

(assert (=> b!729883 (= res!490229 (or (= lt!323385 (MissingZero!7298 i!1173)) (= lt!323385 (MissingVacant!7298 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!729883 (= lt!323385 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729884 () Bool)

(assert (=> b!729884 (= e!408486 e!408487)))

(declare-fun res!490235 () Bool)

(assert (=> b!729884 (=> (not res!490235) (not e!408487))))

(declare-fun lt!323386 () SeekEntryResult!7298)

(assert (=> b!729884 (= res!490235 (= lt!323386 lt!323387))))

(declare-fun lt!323384 () (_ BitVec 64))

(declare-fun lt!323381 () array!41157)

(assert (=> b!729884 (= lt!323387 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323384 lt!323381 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729884 (= lt!323386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323384 mask!3328) lt!323384 lt!323381 mask!3328))))

(assert (=> b!729884 (= lt!323384 (select (store (arr!19698 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729884 (= lt!323381 (array!41158 (store (arr!19698 a!3186) i!1173 k!2102) (size!20119 a!3186)))))

(declare-fun b!729885 () Bool)

(declare-fun res!490233 () Bool)

(assert (=> b!729885 (=> (not res!490233) (not e!408485))))

(assert (=> b!729885 (= res!490233 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20119 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20119 a!3186))))))

(declare-fun b!729886 () Bool)

(declare-fun res!490230 () Bool)

(assert (=> b!729886 (=> (not res!490230) (not e!408482))))

(assert (=> b!729886 (= res!490230 (validKeyInArray!0 k!2102))))

(declare-fun b!729887 () Bool)

(declare-fun res!490236 () Bool)

(assert (=> b!729887 (=> (not res!490236) (not e!408482))))

(declare-fun arrayContainsKey!0 (array!41157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729887 (= res!490236 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729888 () Bool)

(assert (=> b!729888 (= e!408485 e!408486)))

(declare-fun res!490241 () Bool)

(assert (=> b!729888 (=> (not res!490241) (not e!408486))))

(assert (=> b!729888 (= res!490241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19698 a!3186) j!159) mask!3328) (select (arr!19698 a!3186) j!159) a!3186 mask!3328) lt!323383))))

(assert (=> b!729888 (= lt!323383 (Intermediate!7298 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729889 () Bool)

(declare-fun res!490242 () Bool)

(assert (=> b!729889 (=> (not res!490242) (not e!408485))))

(assert (=> b!729889 (= res!490242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729890 () Bool)

(assert (=> b!729890 (= e!408480 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19698 a!3186) j!159) a!3186 mask!3328) lt!323382))))

(declare-fun b!729891 () Bool)

(declare-fun res!490231 () Bool)

(assert (=> b!729891 (=> (not res!490231) (not e!408486))))

(assert (=> b!729891 (= res!490231 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19698 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729880 () Bool)

(declare-fun res!490243 () Bool)

(assert (=> b!729880 (=> (not res!490243) (not e!408485))))

(declare-datatypes ((List!13700 0))(
  ( (Nil!13697) (Cons!13696 (h!14756 (_ BitVec 64)) (t!20015 List!13700)) )
))
(declare-fun arrayNoDuplicates!0 (array!41157 (_ BitVec 32) List!13700) Bool)

(assert (=> b!729880 (= res!490243 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13697))))

(declare-fun res!490232 () Bool)

(assert (=> start!64708 (=> (not res!490232) (not e!408482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64708 (= res!490232 (validMask!0 mask!3328))))

(assert (=> start!64708 e!408482))

(assert (=> start!64708 true))

(declare-fun array_inv!15494 (array!41157) Bool)

(assert (=> start!64708 (array_inv!15494 a!3186)))

(assert (= (and start!64708 res!490232) b!729879))

(assert (= (and b!729879 res!490237) b!729881))

(assert (= (and b!729881 res!490244) b!729886))

(assert (= (and b!729886 res!490230) b!729887))

(assert (= (and b!729887 res!490236) b!729883))

(assert (= (and b!729883 res!490229) b!729889))

(assert (= (and b!729889 res!490242) b!729880))

(assert (= (and b!729880 res!490243) b!729885))

(assert (= (and b!729885 res!490233) b!729888))

(assert (= (and b!729888 res!490241) b!729891))

(assert (= (and b!729891 res!490231) b!729876))

(assert (= (and b!729876 c!80197) b!729878))

(assert (= (and b!729876 (not c!80197)) b!729877))

(assert (= (and b!729876 res!490239) b!729884))

(assert (= (and b!729884 res!490235) b!729882))

(assert (= (and b!729882 res!490240) b!729874))

(assert (= (and b!729874 res!490234) b!729890))

(assert (= (and b!729882 (not res!490238)) b!729875))

(declare-fun m!683467 () Bool)

(assert (=> b!729891 m!683467))

(declare-fun m!683469 () Bool)

(assert (=> b!729886 m!683469))

(declare-fun m!683471 () Bool)

(assert (=> b!729889 m!683471))

(declare-fun m!683473 () Bool)

(assert (=> start!64708 m!683473))

(declare-fun m!683475 () Bool)

(assert (=> start!64708 m!683475))

(declare-fun m!683477 () Bool)

(assert (=> b!729881 m!683477))

(assert (=> b!729881 m!683477))

(declare-fun m!683479 () Bool)

(assert (=> b!729881 m!683479))

(declare-fun m!683481 () Bool)

(assert (=> b!729875 m!683481))

(assert (=> b!729877 m!683477))

(assert (=> b!729877 m!683477))

(declare-fun m!683483 () Bool)

(assert (=> b!729877 m!683483))

(assert (=> b!729888 m!683477))

(assert (=> b!729888 m!683477))

(declare-fun m!683485 () Bool)

(assert (=> b!729888 m!683485))

(assert (=> b!729888 m!683485))

(assert (=> b!729888 m!683477))

(declare-fun m!683487 () Bool)

(assert (=> b!729888 m!683487))

(declare-fun m!683489 () Bool)

(assert (=> b!729882 m!683489))

(declare-fun m!683491 () Bool)

(assert (=> b!729882 m!683491))

(declare-fun m!683493 () Bool)

(assert (=> b!729883 m!683493))

(assert (=> b!729878 m!683477))

(assert (=> b!729878 m!683477))

(declare-fun m!683495 () Bool)

(assert (=> b!729878 m!683495))

(assert (=> b!729874 m!683477))

(assert (=> b!729874 m!683477))

(declare-fun m!683497 () Bool)

(assert (=> b!729874 m!683497))

(declare-fun m!683499 () Bool)

(assert (=> b!729887 m!683499))

(declare-fun m!683501 () Bool)

(assert (=> b!729880 m!683501))

(declare-fun m!683503 () Bool)

(assert (=> b!729884 m!683503))

(declare-fun m!683505 () Bool)

(assert (=> b!729884 m!683505))

(declare-fun m!683507 () Bool)

(assert (=> b!729884 m!683507))

(assert (=> b!729884 m!683503))

(declare-fun m!683509 () Bool)

(assert (=> b!729884 m!683509))

(declare-fun m!683511 () Bool)

(assert (=> b!729884 m!683511))

(assert (=> b!729890 m!683477))

(assert (=> b!729890 m!683477))

(declare-fun m!683513 () Bool)

(assert (=> b!729890 m!683513))

(push 1)

(assert (not b!729884))

(assert (not b!729890))

(assert (not b!729878))

(assert (not b!729889))

(assert (not b!729888))

(assert (not b!729877))

(assert (not b!729881))

(assert (not b!729883))

(assert (not b!729880))

(assert (not b!729882))

(assert (not start!64708))

(assert (not b!729886))

(assert (not b!729874))

(assert (not b!729875))

(assert (not b!729887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

