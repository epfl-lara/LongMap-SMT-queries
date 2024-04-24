; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65604 () Bool)

(assert start!65604)

(declare-fun b!747056 () Bool)

(declare-fun res!503405 () Bool)

(declare-fun e!417257 () Bool)

(assert (=> b!747056 (=> (not res!503405) (not e!417257))))

(declare-datatypes ((array!41647 0))(
  ( (array!41648 (arr!19933 (Array (_ BitVec 32) (_ BitVec 64))) (size!20353 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41647)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41647 (_ BitVec 32)) Bool)

(assert (=> b!747056 (= res!503405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!747057 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!417263 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7489 0))(
  ( (MissingZero!7489 (index!32324 (_ BitVec 32))) (Found!7489 (index!32325 (_ BitVec 32))) (Intermediate!7489 (undefined!8301 Bool) (index!32326 (_ BitVec 32)) (x!63435 (_ BitVec 32))) (Undefined!7489) (MissingVacant!7489 (index!32327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41647 (_ BitVec 32)) SeekEntryResult!7489)

(assert (=> b!747057 (= e!417263 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19933 a!3186) j!159) a!3186 mask!3328) (Found!7489 j!159)))))

(declare-fun b!747058 () Bool)

(declare-fun e!417261 () Bool)

(assert (=> b!747058 (= e!417261 e!417257)))

(declare-fun res!503403 () Bool)

(assert (=> b!747058 (=> (not res!503403) (not e!417257))))

(declare-fun lt!331965 () SeekEntryResult!7489)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747058 (= res!503403 (or (= lt!331965 (MissingZero!7489 i!1173)) (= lt!331965 (MissingVacant!7489 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41647 (_ BitVec 32)) SeekEntryResult!7489)

(assert (=> b!747058 (= lt!331965 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747059 () Bool)

(declare-fun e!417264 () Bool)

(assert (=> b!747059 (= e!417257 e!417264)))

(declare-fun res!503397 () Bool)

(assert (=> b!747059 (=> (not res!503397) (not e!417264))))

(declare-fun lt!331964 () SeekEntryResult!7489)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41647 (_ BitVec 32)) SeekEntryResult!7489)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747059 (= res!503397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19933 a!3186) j!159) mask!3328) (select (arr!19933 a!3186) j!159) a!3186 mask!3328) lt!331964))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747059 (= lt!331964 (Intermediate!7489 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747060 () Bool)

(assert (=> b!747060 (= e!417263 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19933 a!3186) j!159) a!3186 mask!3328) lt!331964))))

(declare-fun res!503395 () Bool)

(assert (=> start!65604 (=> (not res!503395) (not e!417261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65604 (= res!503395 (validMask!0 mask!3328))))

(assert (=> start!65604 e!417261))

(assert (=> start!65604 true))

(declare-fun array_inv!15792 (array!41647) Bool)

(assert (=> start!65604 (array_inv!15792 a!3186)))

(declare-fun b!747061 () Bool)

(declare-fun e!417259 () Bool)

(assert (=> b!747061 (= e!417259 true)))

(declare-fun lt!331959 () SeekEntryResult!7489)

(declare-fun lt!331960 () SeekEntryResult!7489)

(assert (=> b!747061 (= lt!331959 lt!331960)))

(declare-fun b!747062 () Bool)

(declare-fun res!503406 () Bool)

(assert (=> b!747062 (=> (not res!503406) (not e!417261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747062 (= res!503406 (validKeyInArray!0 k0!2102))))

(declare-fun b!747063 () Bool)

(declare-fun e!417256 () Bool)

(declare-fun lt!331967 () SeekEntryResult!7489)

(assert (=> b!747063 (= e!417256 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19933 a!3186) j!159) a!3186 mask!3328) lt!331967))))

(declare-fun b!747064 () Bool)

(declare-fun res!503408 () Bool)

(assert (=> b!747064 (=> (not res!503408) (not e!417257))))

(declare-datatypes ((List!13842 0))(
  ( (Nil!13839) (Cons!13838 (h!14916 (_ BitVec 64)) (t!20149 List!13842)) )
))
(declare-fun arrayNoDuplicates!0 (array!41647 (_ BitVec 32) List!13842) Bool)

(assert (=> b!747064 (= res!503408 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13839))))

(declare-fun b!747065 () Bool)

(declare-fun res!503398 () Bool)

(assert (=> b!747065 (=> (not res!503398) (not e!417261))))

(declare-fun arrayContainsKey!0 (array!41647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747065 (= res!503398 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747066 () Bool)

(declare-fun res!503401 () Bool)

(assert (=> b!747066 (=> (not res!503401) (not e!417261))))

(assert (=> b!747066 (= res!503401 (validKeyInArray!0 (select (arr!19933 a!3186) j!159)))))

(declare-fun b!747067 () Bool)

(declare-fun e!417260 () Bool)

(assert (=> b!747067 (= e!417260 e!417259)))

(declare-fun res!503410 () Bool)

(assert (=> b!747067 (=> res!503410 e!417259)))

(declare-fun lt!331962 () (_ BitVec 64))

(assert (=> b!747067 (= res!503410 (or (not (= lt!331960 lt!331967)) (= (select (store (arr!19933 a!3186) i!1173 k0!2102) index!1321) lt!331962) (not (= (select (store (arr!19933 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!747067 (= lt!331960 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19933 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!747068 () Bool)

(declare-fun res!503409 () Bool)

(assert (=> b!747068 (=> (not res!503409) (not e!417261))))

(assert (=> b!747068 (= res!503409 (and (= (size!20353 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20353 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20353 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747069 () Bool)

(declare-fun e!417262 () Bool)

(assert (=> b!747069 (= e!417264 e!417262)))

(declare-fun res!503404 () Bool)

(assert (=> b!747069 (=> (not res!503404) (not e!417262))))

(declare-fun lt!331966 () SeekEntryResult!7489)

(declare-fun lt!331961 () SeekEntryResult!7489)

(assert (=> b!747069 (= res!503404 (= lt!331966 lt!331961))))

(declare-fun lt!331963 () array!41647)

(assert (=> b!747069 (= lt!331961 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331962 lt!331963 mask!3328))))

(assert (=> b!747069 (= lt!331966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331962 mask!3328) lt!331962 lt!331963 mask!3328))))

(assert (=> b!747069 (= lt!331962 (select (store (arr!19933 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747069 (= lt!331963 (array!41648 (store (arr!19933 a!3186) i!1173 k0!2102) (size!20353 a!3186)))))

(declare-fun b!747070 () Bool)

(declare-fun res!503407 () Bool)

(assert (=> b!747070 (=> (not res!503407) (not e!417257))))

(assert (=> b!747070 (= res!503407 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20353 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20353 a!3186))))))

(declare-fun b!747071 () Bool)

(declare-fun res!503396 () Bool)

(assert (=> b!747071 (=> (not res!503396) (not e!417264))))

(assert (=> b!747071 (= res!503396 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19933 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747072 () Bool)

(assert (=> b!747072 (= e!417262 (not e!417260))))

(declare-fun res!503400 () Bool)

(assert (=> b!747072 (=> res!503400 e!417260)))

(get-info :version)

(assert (=> b!747072 (= res!503400 (or (not ((_ is Intermediate!7489) lt!331961)) (bvslt x!1131 (x!63435 lt!331961)) (not (= x!1131 (x!63435 lt!331961))) (not (= index!1321 (index!32326 lt!331961)))))))

(assert (=> b!747072 e!417256))

(declare-fun res!503402 () Bool)

(assert (=> b!747072 (=> (not res!503402) (not e!417256))))

(assert (=> b!747072 (= res!503402 (= lt!331959 lt!331967))))

(assert (=> b!747072 (= lt!331967 (Found!7489 j!159))))

(assert (=> b!747072 (= lt!331959 (seekEntryOrOpen!0 (select (arr!19933 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747072 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25537 0))(
  ( (Unit!25538) )
))
(declare-fun lt!331968 () Unit!25537)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25537)

(assert (=> b!747072 (= lt!331968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747073 () Bool)

(declare-fun res!503399 () Bool)

(assert (=> b!747073 (=> (not res!503399) (not e!417264))))

(assert (=> b!747073 (= res!503399 e!417263)))

(declare-fun c!82214 () Bool)

(assert (=> b!747073 (= c!82214 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65604 res!503395) b!747068))

(assert (= (and b!747068 res!503409) b!747066))

(assert (= (and b!747066 res!503401) b!747062))

(assert (= (and b!747062 res!503406) b!747065))

(assert (= (and b!747065 res!503398) b!747058))

(assert (= (and b!747058 res!503403) b!747056))

(assert (= (and b!747056 res!503405) b!747064))

(assert (= (and b!747064 res!503408) b!747070))

(assert (= (and b!747070 res!503407) b!747059))

(assert (= (and b!747059 res!503397) b!747071))

(assert (= (and b!747071 res!503396) b!747073))

(assert (= (and b!747073 c!82214) b!747060))

(assert (= (and b!747073 (not c!82214)) b!747057))

(assert (= (and b!747073 res!503399) b!747069))

(assert (= (and b!747069 res!503404) b!747072))

(assert (= (and b!747072 res!503402) b!747063))

(assert (= (and b!747072 (not res!503400)) b!747067))

(assert (= (and b!747067 (not res!503410)) b!747061))

(declare-fun m!697743 () Bool)

(assert (=> b!747063 m!697743))

(assert (=> b!747063 m!697743))

(declare-fun m!697745 () Bool)

(assert (=> b!747063 m!697745))

(declare-fun m!697747 () Bool)

(assert (=> start!65604 m!697747))

(declare-fun m!697749 () Bool)

(assert (=> start!65604 m!697749))

(declare-fun m!697751 () Bool)

(assert (=> b!747058 m!697751))

(declare-fun m!697753 () Bool)

(assert (=> b!747071 m!697753))

(assert (=> b!747059 m!697743))

(assert (=> b!747059 m!697743))

(declare-fun m!697755 () Bool)

(assert (=> b!747059 m!697755))

(assert (=> b!747059 m!697755))

(assert (=> b!747059 m!697743))

(declare-fun m!697757 () Bool)

(assert (=> b!747059 m!697757))

(declare-fun m!697759 () Bool)

(assert (=> b!747065 m!697759))

(assert (=> b!747057 m!697743))

(assert (=> b!747057 m!697743))

(declare-fun m!697761 () Bool)

(assert (=> b!747057 m!697761))

(assert (=> b!747060 m!697743))

(assert (=> b!747060 m!697743))

(declare-fun m!697763 () Bool)

(assert (=> b!747060 m!697763))

(declare-fun m!697765 () Bool)

(assert (=> b!747064 m!697765))

(assert (=> b!747072 m!697743))

(assert (=> b!747072 m!697743))

(declare-fun m!697767 () Bool)

(assert (=> b!747072 m!697767))

(declare-fun m!697769 () Bool)

(assert (=> b!747072 m!697769))

(declare-fun m!697771 () Bool)

(assert (=> b!747072 m!697771))

(declare-fun m!697773 () Bool)

(assert (=> b!747069 m!697773))

(declare-fun m!697775 () Bool)

(assert (=> b!747069 m!697775))

(declare-fun m!697777 () Bool)

(assert (=> b!747069 m!697777))

(declare-fun m!697779 () Bool)

(assert (=> b!747069 m!697779))

(assert (=> b!747069 m!697775))

(declare-fun m!697781 () Bool)

(assert (=> b!747069 m!697781))

(declare-fun m!697783 () Bool)

(assert (=> b!747062 m!697783))

(assert (=> b!747067 m!697781))

(declare-fun m!697785 () Bool)

(assert (=> b!747067 m!697785))

(assert (=> b!747067 m!697743))

(assert (=> b!747067 m!697743))

(assert (=> b!747067 m!697761))

(assert (=> b!747066 m!697743))

(assert (=> b!747066 m!697743))

(declare-fun m!697787 () Bool)

(assert (=> b!747066 m!697787))

(declare-fun m!697789 () Bool)

(assert (=> b!747056 m!697789))

(check-sat (not b!747067) (not b!747057) (not b!747064) (not start!65604) (not b!747066) (not b!747072) (not b!747060) (not b!747059) (not b!747063) (not b!747062) (not b!747056) (not b!747069) (not b!747065) (not b!747058))
(check-sat)
