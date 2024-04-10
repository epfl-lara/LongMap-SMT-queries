; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65440 () Bool)

(assert start!65440)

(declare-fun b!745339 () Bool)

(declare-fun res!502228 () Bool)

(declare-fun e!416297 () Bool)

(assert (=> b!745339 (=> (not res!502228) (not e!416297))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41613 0))(
  ( (array!41614 (arr!19920 (Array (_ BitVec 32) (_ BitVec 64))) (size!20341 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41613)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745339 (= res!502228 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19920 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!745340 () Bool)

(declare-datatypes ((SeekEntryResult!7520 0))(
  ( (MissingZero!7520 (index!32448 (_ BitVec 32))) (Found!7520 (index!32449 (_ BitVec 32))) (Intermediate!7520 (undefined!8332 Bool) (index!32450 (_ BitVec 32)) (x!63406 (_ BitVec 32))) (Undefined!7520) (MissingVacant!7520 (index!32451 (_ BitVec 32))) )
))
(declare-fun lt!331129 () SeekEntryResult!7520)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!416292 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41613 (_ BitVec 32)) SeekEntryResult!7520)

(assert (=> b!745340 (= e!416292 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19920 a!3186) j!159) a!3186 mask!3328) lt!331129))))

(declare-fun b!745341 () Bool)

(declare-fun res!502237 () Bool)

(declare-fun e!416295 () Bool)

(assert (=> b!745341 (=> (not res!502237) (not e!416295))))

(declare-datatypes ((List!13922 0))(
  ( (Nil!13919) (Cons!13918 (h!14990 (_ BitVec 64)) (t!20237 List!13922)) )
))
(declare-fun arrayNoDuplicates!0 (array!41613 (_ BitVec 32) List!13922) Bool)

(assert (=> b!745341 (= res!502237 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13919))))

(declare-fun b!745342 () Bool)

(declare-fun e!416294 () Bool)

(assert (=> b!745342 (= e!416294 e!416295)))

(declare-fun res!502229 () Bool)

(assert (=> b!745342 (=> (not res!502229) (not e!416295))))

(declare-fun lt!331127 () SeekEntryResult!7520)

(assert (=> b!745342 (= res!502229 (or (= lt!331127 (MissingZero!7520 i!1173)) (= lt!331127 (MissingVacant!7520 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41613 (_ BitVec 32)) SeekEntryResult!7520)

(assert (=> b!745342 (= lt!331127 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745343 () Bool)

(declare-fun res!502235 () Bool)

(assert (=> b!745343 (=> (not res!502235) (not e!416294))))

(assert (=> b!745343 (= res!502235 (and (= (size!20341 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20341 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20341 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745344 () Bool)

(declare-fun res!502232 () Bool)

(assert (=> b!745344 (=> (not res!502232) (not e!416297))))

(declare-fun e!416293 () Bool)

(assert (=> b!745344 (= res!502232 e!416293)))

(declare-fun c!81937 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!745344 (= c!81937 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745345 () Bool)

(declare-fun e!416298 () Bool)

(assert (=> b!745345 (= e!416298 true)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331130 () SeekEntryResult!7520)

(assert (=> b!745345 (= lt!331130 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19920 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745346 () Bool)

(declare-fun res!502241 () Bool)

(assert (=> b!745346 (=> (not res!502241) (not e!416295))))

(assert (=> b!745346 (= res!502241 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20341 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20341 a!3186))))))

(declare-fun b!745347 () Bool)

(declare-fun res!502231 () Bool)

(assert (=> b!745347 (=> (not res!502231) (not e!416294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745347 (= res!502231 (validKeyInArray!0 (select (arr!19920 a!3186) j!159)))))

(declare-fun b!745348 () Bool)

(declare-fun e!416299 () Bool)

(assert (=> b!745348 (= e!416299 (not e!416298))))

(declare-fun res!502227 () Bool)

(assert (=> b!745348 (=> res!502227 e!416298)))

(declare-fun lt!331125 () SeekEntryResult!7520)

(assert (=> b!745348 (= res!502227 (or (not (is-Intermediate!7520 lt!331125)) (bvslt x!1131 (x!63406 lt!331125)) (not (= x!1131 (x!63406 lt!331125))) (not (= index!1321 (index!32450 lt!331125)))))))

(declare-fun e!416300 () Bool)

(assert (=> b!745348 e!416300))

(declare-fun res!502238 () Bool)

(assert (=> b!745348 (=> (not res!502238) (not e!416300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41613 (_ BitVec 32)) Bool)

(assert (=> b!745348 (= res!502238 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25520 0))(
  ( (Unit!25521) )
))
(declare-fun lt!331128 () Unit!25520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25520)

(assert (=> b!745348 (= lt!331128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!502239 () Bool)

(assert (=> start!65440 (=> (not res!502239) (not e!416294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65440 (= res!502239 (validMask!0 mask!3328))))

(assert (=> start!65440 e!416294))

(assert (=> start!65440 true))

(declare-fun array_inv!15716 (array!41613) Bool)

(assert (=> start!65440 (array_inv!15716 a!3186)))

(declare-fun b!745349 () Bool)

(assert (=> b!745349 (= e!416295 e!416297)))

(declare-fun res!502233 () Bool)

(assert (=> b!745349 (=> (not res!502233) (not e!416297))))

(declare-fun lt!331122 () SeekEntryResult!7520)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41613 (_ BitVec 32)) SeekEntryResult!7520)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745349 (= res!502233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19920 a!3186) j!159) mask!3328) (select (arr!19920 a!3186) j!159) a!3186 mask!3328) lt!331122))))

(assert (=> b!745349 (= lt!331122 (Intermediate!7520 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745350 () Bool)

(assert (=> b!745350 (= e!416293 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19920 a!3186) j!159) a!3186 mask!3328) (Found!7520 j!159)))))

(declare-fun b!745351 () Bool)

(declare-fun res!502234 () Bool)

(assert (=> b!745351 (=> (not res!502234) (not e!416294))))

(declare-fun arrayContainsKey!0 (array!41613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745351 (= res!502234 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745352 () Bool)

(assert (=> b!745352 (= e!416300 e!416292)))

(declare-fun res!502236 () Bool)

(assert (=> b!745352 (=> (not res!502236) (not e!416292))))

(assert (=> b!745352 (= res!502236 (= (seekEntryOrOpen!0 (select (arr!19920 a!3186) j!159) a!3186 mask!3328) lt!331129))))

(assert (=> b!745352 (= lt!331129 (Found!7520 j!159))))

(declare-fun b!745353 () Bool)

(declare-fun res!502226 () Bool)

(assert (=> b!745353 (=> (not res!502226) (not e!416295))))

(assert (=> b!745353 (= res!502226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745354 () Bool)

(declare-fun res!502230 () Bool)

(assert (=> b!745354 (=> (not res!502230) (not e!416294))))

(assert (=> b!745354 (= res!502230 (validKeyInArray!0 k!2102))))

(declare-fun b!745355 () Bool)

(assert (=> b!745355 (= e!416293 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19920 a!3186) j!159) a!3186 mask!3328) lt!331122))))

(declare-fun b!745356 () Bool)

(assert (=> b!745356 (= e!416297 e!416299)))

(declare-fun res!502240 () Bool)

(assert (=> b!745356 (=> (not res!502240) (not e!416299))))

(declare-fun lt!331126 () SeekEntryResult!7520)

(assert (=> b!745356 (= res!502240 (= lt!331126 lt!331125))))

(declare-fun lt!331124 () (_ BitVec 64))

(declare-fun lt!331123 () array!41613)

(assert (=> b!745356 (= lt!331125 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331124 lt!331123 mask!3328))))

(assert (=> b!745356 (= lt!331126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331124 mask!3328) lt!331124 lt!331123 mask!3328))))

(assert (=> b!745356 (= lt!331124 (select (store (arr!19920 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745356 (= lt!331123 (array!41614 (store (arr!19920 a!3186) i!1173 k!2102) (size!20341 a!3186)))))

(assert (= (and start!65440 res!502239) b!745343))

(assert (= (and b!745343 res!502235) b!745347))

(assert (= (and b!745347 res!502231) b!745354))

(assert (= (and b!745354 res!502230) b!745351))

(assert (= (and b!745351 res!502234) b!745342))

(assert (= (and b!745342 res!502229) b!745353))

(assert (= (and b!745353 res!502226) b!745341))

(assert (= (and b!745341 res!502237) b!745346))

(assert (= (and b!745346 res!502241) b!745349))

(assert (= (and b!745349 res!502233) b!745339))

(assert (= (and b!745339 res!502228) b!745344))

(assert (= (and b!745344 c!81937) b!745355))

(assert (= (and b!745344 (not c!81937)) b!745350))

(assert (= (and b!745344 res!502232) b!745356))

(assert (= (and b!745356 res!502240) b!745348))

(assert (= (and b!745348 res!502238) b!745352))

(assert (= (and b!745352 res!502236) b!745340))

(assert (= (and b!745348 (not res!502227)) b!745345))

(declare-fun m!695731 () Bool)

(assert (=> b!745349 m!695731))

(assert (=> b!745349 m!695731))

(declare-fun m!695733 () Bool)

(assert (=> b!745349 m!695733))

(assert (=> b!745349 m!695733))

(assert (=> b!745349 m!695731))

(declare-fun m!695735 () Bool)

(assert (=> b!745349 m!695735))

(declare-fun m!695737 () Bool)

(assert (=> b!745354 m!695737))

(declare-fun m!695739 () Bool)

(assert (=> start!65440 m!695739))

(declare-fun m!695741 () Bool)

(assert (=> start!65440 m!695741))

(assert (=> b!745350 m!695731))

(assert (=> b!745350 m!695731))

(declare-fun m!695743 () Bool)

(assert (=> b!745350 m!695743))

(assert (=> b!745355 m!695731))

(assert (=> b!745355 m!695731))

(declare-fun m!695745 () Bool)

(assert (=> b!745355 m!695745))

(declare-fun m!695747 () Bool)

(assert (=> b!745356 m!695747))

(declare-fun m!695749 () Bool)

(assert (=> b!745356 m!695749))

(declare-fun m!695751 () Bool)

(assert (=> b!745356 m!695751))

(declare-fun m!695753 () Bool)

(assert (=> b!745356 m!695753))

(assert (=> b!745356 m!695747))

(declare-fun m!695755 () Bool)

(assert (=> b!745356 m!695755))

(declare-fun m!695757 () Bool)

(assert (=> b!745351 m!695757))

(assert (=> b!745340 m!695731))

(assert (=> b!745340 m!695731))

(declare-fun m!695759 () Bool)

(assert (=> b!745340 m!695759))

(declare-fun m!695761 () Bool)

(assert (=> b!745339 m!695761))

(assert (=> b!745347 m!695731))

(assert (=> b!745347 m!695731))

(declare-fun m!695763 () Bool)

(assert (=> b!745347 m!695763))

(assert (=> b!745352 m!695731))

(assert (=> b!745352 m!695731))

(declare-fun m!695765 () Bool)

(assert (=> b!745352 m!695765))

(assert (=> b!745345 m!695731))

(assert (=> b!745345 m!695731))

(assert (=> b!745345 m!695743))

(declare-fun m!695767 () Bool)

(assert (=> b!745342 m!695767))

(declare-fun m!695769 () Bool)

(assert (=> b!745353 m!695769))

(declare-fun m!695771 () Bool)

(assert (=> b!745348 m!695771))

(declare-fun m!695773 () Bool)

(assert (=> b!745348 m!695773))

(declare-fun m!695775 () Bool)

(assert (=> b!745341 m!695775))

(push 1)

