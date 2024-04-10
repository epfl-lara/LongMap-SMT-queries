; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65872 () Bool)

(assert start!65872)

(declare-fun b!759350 () Bool)

(declare-fun res!513870 () Bool)

(declare-fun e!423324 () Bool)

(assert (=> b!759350 (=> (not res!513870) (not e!423324))))

(declare-datatypes ((array!42045 0))(
  ( (array!42046 (arr!20136 (Array (_ BitVec 32) (_ BitVec 64))) (size!20557 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42045)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!759350 (= res!513870 (and (= (size!20557 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20557 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20557 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759351 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!423322 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7736 0))(
  ( (MissingZero!7736 (index!33312 (_ BitVec 32))) (Found!7736 (index!33313 (_ BitVec 32))) (Intermediate!7736 (undefined!8548 Bool) (index!33314 (_ BitVec 32)) (x!64198 (_ BitVec 32))) (Undefined!7736) (MissingVacant!7736 (index!33315 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42045 (_ BitVec 32)) SeekEntryResult!7736)

(assert (=> b!759351 (= e!423322 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20136 a!3186) j!159) a!3186 mask!3328) (Found!7736 j!159)))))

(declare-fun b!759352 () Bool)

(declare-fun res!513864 () Bool)

(assert (=> b!759352 (=> (not res!513864) (not e!423324))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759352 (= res!513864 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759353 () Bool)

(declare-fun res!513874 () Bool)

(assert (=> b!759353 (=> (not res!513874) (not e!423324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759353 (= res!513874 (validKeyInArray!0 k!2102))))

(declare-fun b!759354 () Bool)

(declare-fun e!423319 () Bool)

(declare-fun e!423323 () Bool)

(assert (=> b!759354 (= e!423319 e!423323)))

(declare-fun res!513861 () Bool)

(assert (=> b!759354 (=> (not res!513861) (not e!423323))))

(declare-fun lt!338374 () SeekEntryResult!7736)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42045 (_ BitVec 32)) SeekEntryResult!7736)

(assert (=> b!759354 (= res!513861 (= (seekEntryOrOpen!0 (select (arr!20136 a!3186) j!159) a!3186 mask!3328) lt!338374))))

(assert (=> b!759354 (= lt!338374 (Found!7736 j!159))))

(declare-fun b!759355 () Bool)

(declare-fun res!513867 () Bool)

(declare-fun e!423325 () Bool)

(assert (=> b!759355 (=> (not res!513867) (not e!423325))))

(assert (=> b!759355 (= res!513867 e!423322)))

(declare-fun c!83125 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759355 (= c!83125 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759356 () Bool)

(assert (=> b!759356 (= e!423323 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20136 a!3186) j!159) a!3186 mask!3328) lt!338374))))

(declare-fun b!759357 () Bool)

(declare-fun e!423320 () Bool)

(assert (=> b!759357 (= e!423320 e!423325)))

(declare-fun res!513875 () Bool)

(assert (=> b!759357 (=> (not res!513875) (not e!423325))))

(declare-fun lt!338373 () SeekEntryResult!7736)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42045 (_ BitVec 32)) SeekEntryResult!7736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759357 (= res!513875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20136 a!3186) j!159) mask!3328) (select (arr!20136 a!3186) j!159) a!3186 mask!3328) lt!338373))))

(assert (=> b!759357 (= lt!338373 (Intermediate!7736 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759358 () Bool)

(declare-fun e!423326 () Bool)

(assert (=> b!759358 (= e!423325 e!423326)))

(declare-fun res!513872 () Bool)

(assert (=> b!759358 (=> (not res!513872) (not e!423326))))

(declare-fun lt!338372 () (_ BitVec 64))

(declare-fun lt!338375 () array!42045)

(assert (=> b!759358 (= res!513872 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338372 mask!3328) lt!338372 lt!338375 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338372 lt!338375 mask!3328)))))

(assert (=> b!759358 (= lt!338372 (select (store (arr!20136 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759358 (= lt!338375 (array!42046 (store (arr!20136 a!3186) i!1173 k!2102) (size!20557 a!3186)))))

(declare-fun b!759360 () Bool)

(declare-fun res!513863 () Bool)

(assert (=> b!759360 (=> (not res!513863) (not e!423325))))

(assert (=> b!759360 (= res!513863 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20136 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759359 () Bool)

(assert (=> b!759359 (= e!423326 (not true))))

(assert (=> b!759359 e!423319))

(declare-fun res!513862 () Bool)

(assert (=> b!759359 (=> (not res!513862) (not e!423319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42045 (_ BitVec 32)) Bool)

(assert (=> b!759359 (= res!513862 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26312 0))(
  ( (Unit!26313) )
))
(declare-fun lt!338371 () Unit!26312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26312)

(assert (=> b!759359 (= lt!338371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!513868 () Bool)

(assert (=> start!65872 (=> (not res!513868) (not e!423324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65872 (= res!513868 (validMask!0 mask!3328))))

(assert (=> start!65872 e!423324))

(assert (=> start!65872 true))

(declare-fun array_inv!15932 (array!42045) Bool)

(assert (=> start!65872 (array_inv!15932 a!3186)))

(declare-fun b!759361 () Bool)

(declare-fun res!513866 () Bool)

(assert (=> b!759361 (=> (not res!513866) (not e!423320))))

(assert (=> b!759361 (= res!513866 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20557 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20557 a!3186))))))

(declare-fun b!759362 () Bool)

(declare-fun res!513873 () Bool)

(assert (=> b!759362 (=> (not res!513873) (not e!423320))))

(assert (=> b!759362 (= res!513873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759363 () Bool)

(declare-fun res!513865 () Bool)

(assert (=> b!759363 (=> (not res!513865) (not e!423324))))

(assert (=> b!759363 (= res!513865 (validKeyInArray!0 (select (arr!20136 a!3186) j!159)))))

(declare-fun b!759364 () Bool)

(assert (=> b!759364 (= e!423322 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20136 a!3186) j!159) a!3186 mask!3328) lt!338373))))

(declare-fun b!759365 () Bool)

(assert (=> b!759365 (= e!423324 e!423320)))

(declare-fun res!513871 () Bool)

(assert (=> b!759365 (=> (not res!513871) (not e!423320))))

(declare-fun lt!338370 () SeekEntryResult!7736)

(assert (=> b!759365 (= res!513871 (or (= lt!338370 (MissingZero!7736 i!1173)) (= lt!338370 (MissingVacant!7736 i!1173))))))

(assert (=> b!759365 (= lt!338370 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759366 () Bool)

(declare-fun res!513869 () Bool)

(assert (=> b!759366 (=> (not res!513869) (not e!423320))))

(declare-datatypes ((List!14138 0))(
  ( (Nil!14135) (Cons!14134 (h!15206 (_ BitVec 64)) (t!20453 List!14138)) )
))
(declare-fun arrayNoDuplicates!0 (array!42045 (_ BitVec 32) List!14138) Bool)

(assert (=> b!759366 (= res!513869 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14135))))

(assert (= (and start!65872 res!513868) b!759350))

(assert (= (and b!759350 res!513870) b!759363))

(assert (= (and b!759363 res!513865) b!759353))

(assert (= (and b!759353 res!513874) b!759352))

(assert (= (and b!759352 res!513864) b!759365))

(assert (= (and b!759365 res!513871) b!759362))

(assert (= (and b!759362 res!513873) b!759366))

(assert (= (and b!759366 res!513869) b!759361))

(assert (= (and b!759361 res!513866) b!759357))

(assert (= (and b!759357 res!513875) b!759360))

(assert (= (and b!759360 res!513863) b!759355))

(assert (= (and b!759355 c!83125) b!759364))

(assert (= (and b!759355 (not c!83125)) b!759351))

(assert (= (and b!759355 res!513867) b!759358))

(assert (= (and b!759358 res!513872) b!759359))

(assert (= (and b!759359 res!513862) b!759354))

(assert (= (and b!759354 res!513861) b!759356))

(declare-fun m!706717 () Bool)

(assert (=> b!759359 m!706717))

(declare-fun m!706719 () Bool)

(assert (=> b!759359 m!706719))

(declare-fun m!706721 () Bool)

(assert (=> b!759357 m!706721))

(assert (=> b!759357 m!706721))

(declare-fun m!706723 () Bool)

(assert (=> b!759357 m!706723))

(assert (=> b!759357 m!706723))

(assert (=> b!759357 m!706721))

(declare-fun m!706725 () Bool)

(assert (=> b!759357 m!706725))

(assert (=> b!759354 m!706721))

(assert (=> b!759354 m!706721))

(declare-fun m!706727 () Bool)

(assert (=> b!759354 m!706727))

(assert (=> b!759363 m!706721))

(assert (=> b!759363 m!706721))

(declare-fun m!706729 () Bool)

(assert (=> b!759363 m!706729))

(declare-fun m!706731 () Bool)

(assert (=> b!759365 m!706731))

(assert (=> b!759356 m!706721))

(assert (=> b!759356 m!706721))

(declare-fun m!706733 () Bool)

(assert (=> b!759356 m!706733))

(declare-fun m!706735 () Bool)

(assert (=> b!759352 m!706735))

(assert (=> b!759364 m!706721))

(assert (=> b!759364 m!706721))

(declare-fun m!706737 () Bool)

(assert (=> b!759364 m!706737))

(declare-fun m!706739 () Bool)

(assert (=> b!759358 m!706739))

(declare-fun m!706741 () Bool)

(assert (=> b!759358 m!706741))

(declare-fun m!706743 () Bool)

(assert (=> b!759358 m!706743))

(declare-fun m!706745 () Bool)

(assert (=> b!759358 m!706745))

(declare-fun m!706747 () Bool)

(assert (=> b!759358 m!706747))

(assert (=> b!759358 m!706739))

(assert (=> b!759351 m!706721))

(assert (=> b!759351 m!706721))

(declare-fun m!706749 () Bool)

(assert (=> b!759351 m!706749))

(declare-fun m!706751 () Bool)

(assert (=> start!65872 m!706751))

(declare-fun m!706753 () Bool)

(assert (=> start!65872 m!706753))

(declare-fun m!706755 () Bool)

(assert (=> b!759366 m!706755))

(declare-fun m!706757 () Bool)

(assert (=> b!759362 m!706757))

(declare-fun m!706759 () Bool)

(assert (=> b!759360 m!706759))

(declare-fun m!706761 () Bool)

(assert (=> b!759353 m!706761))

(push 1)

