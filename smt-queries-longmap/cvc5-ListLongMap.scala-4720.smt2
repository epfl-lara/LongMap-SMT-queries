; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65380 () Bool)

(assert start!65380)

(declare-fun b!743683 () Bool)

(declare-fun res!500754 () Bool)

(declare-fun e!415488 () Bool)

(assert (=> b!743683 (=> (not res!500754) (not e!415488))))

(declare-datatypes ((array!41553 0))(
  ( (array!41554 (arr!19890 (Array (_ BitVec 32) (_ BitVec 64))) (size!20311 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41553)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743683 (= res!500754 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743684 () Bool)

(declare-fun e!415489 () Bool)

(assert (=> b!743684 (= e!415489 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7490 0))(
  ( (MissingZero!7490 (index!32328 (_ BitVec 32))) (Found!7490 (index!32329 (_ BitVec 32))) (Intermediate!7490 (undefined!8302 Bool) (index!32330 (_ BitVec 32)) (x!63296 (_ BitVec 32))) (Undefined!7490) (MissingVacant!7490 (index!32331 (_ BitVec 32))) )
))
(declare-fun lt!330351 () SeekEntryResult!7490)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41553 (_ BitVec 32)) SeekEntryResult!7490)

(assert (=> b!743684 (= lt!330351 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19890 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743685 () Bool)

(declare-fun res!500760 () Bool)

(declare-fun e!415487 () Bool)

(assert (=> b!743685 (=> (not res!500760) (not e!415487))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743685 (= res!500760 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20311 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20311 a!3186))))))

(declare-fun res!500765 () Bool)

(assert (=> start!65380 (=> (not res!500765) (not e!415488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65380 (= res!500765 (validMask!0 mask!3328))))

(assert (=> start!65380 e!415488))

(assert (=> start!65380 true))

(declare-fun array_inv!15686 (array!41553) Bool)

(assert (=> start!65380 (array_inv!15686 a!3186)))

(declare-fun b!743686 () Bool)

(declare-fun e!415482 () Bool)

(assert (=> b!743686 (= e!415482 (not e!415489))))

(declare-fun res!500764 () Bool)

(assert (=> b!743686 (=> res!500764 e!415489)))

(declare-fun lt!330349 () SeekEntryResult!7490)

(assert (=> b!743686 (= res!500764 (or (not (is-Intermediate!7490 lt!330349)) (bvslt x!1131 (x!63296 lt!330349)) (not (= x!1131 (x!63296 lt!330349))) (not (= index!1321 (index!32330 lt!330349)))))))

(declare-fun e!415485 () Bool)

(assert (=> b!743686 e!415485))

(declare-fun res!500753 () Bool)

(assert (=> b!743686 (=> (not res!500753) (not e!415485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41553 (_ BitVec 32)) Bool)

(assert (=> b!743686 (= res!500753 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25460 0))(
  ( (Unit!25461) )
))
(declare-fun lt!330355 () Unit!25460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25460)

(assert (=> b!743686 (= lt!330355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743687 () Bool)

(declare-fun res!500757 () Bool)

(assert (=> b!743687 (=> (not res!500757) (not e!415487))))

(assert (=> b!743687 (= res!500757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743688 () Bool)

(declare-fun e!415484 () Bool)

(assert (=> b!743688 (= e!415484 e!415482)))

(declare-fun res!500750 () Bool)

(assert (=> b!743688 (=> (not res!500750) (not e!415482))))

(declare-fun lt!330348 () SeekEntryResult!7490)

(assert (=> b!743688 (= res!500750 (= lt!330348 lt!330349))))

(declare-fun lt!330353 () array!41553)

(declare-fun lt!330352 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41553 (_ BitVec 32)) SeekEntryResult!7490)

(assert (=> b!743688 (= lt!330349 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330352 lt!330353 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743688 (= lt!330348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330352 mask!3328) lt!330352 lt!330353 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743688 (= lt!330352 (select (store (arr!19890 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743688 (= lt!330353 (array!41554 (store (arr!19890 a!3186) i!1173 k!2102) (size!20311 a!3186)))))

(declare-fun b!743689 () Bool)

(declare-fun res!500756 () Bool)

(assert (=> b!743689 (=> (not res!500756) (not e!415484))))

(declare-fun e!415486 () Bool)

(assert (=> b!743689 (= res!500756 e!415486)))

(declare-fun c!81847 () Bool)

(assert (=> b!743689 (= c!81847 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!330354 () SeekEntryResult!7490)

(declare-fun b!743690 () Bool)

(assert (=> b!743690 (= e!415486 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19890 a!3186) j!159) a!3186 mask!3328) lt!330354))))

(declare-fun b!743691 () Bool)

(declare-fun res!500755 () Bool)

(assert (=> b!743691 (=> (not res!500755) (not e!415488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743691 (= res!500755 (validKeyInArray!0 (select (arr!19890 a!3186) j!159)))))

(declare-fun b!743692 () Bool)

(declare-fun e!415490 () Bool)

(assert (=> b!743692 (= e!415485 e!415490)))

(declare-fun res!500761 () Bool)

(assert (=> b!743692 (=> (not res!500761) (not e!415490))))

(declare-fun lt!330350 () SeekEntryResult!7490)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41553 (_ BitVec 32)) SeekEntryResult!7490)

(assert (=> b!743692 (= res!500761 (= (seekEntryOrOpen!0 (select (arr!19890 a!3186) j!159) a!3186 mask!3328) lt!330350))))

(assert (=> b!743692 (= lt!330350 (Found!7490 j!159))))

(declare-fun b!743693 () Bool)

(assert (=> b!743693 (= e!415488 e!415487)))

(declare-fun res!500752 () Bool)

(assert (=> b!743693 (=> (not res!500752) (not e!415487))))

(declare-fun lt!330356 () SeekEntryResult!7490)

(assert (=> b!743693 (= res!500752 (or (= lt!330356 (MissingZero!7490 i!1173)) (= lt!330356 (MissingVacant!7490 i!1173))))))

(assert (=> b!743693 (= lt!330356 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743694 () Bool)

(declare-fun res!500762 () Bool)

(assert (=> b!743694 (=> (not res!500762) (not e!415488))))

(assert (=> b!743694 (= res!500762 (validKeyInArray!0 k!2102))))

(declare-fun b!743695 () Bool)

(assert (=> b!743695 (= e!415487 e!415484)))

(declare-fun res!500759 () Bool)

(assert (=> b!743695 (=> (not res!500759) (not e!415484))))

(assert (=> b!743695 (= res!500759 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19890 a!3186) j!159) mask!3328) (select (arr!19890 a!3186) j!159) a!3186 mask!3328) lt!330354))))

(assert (=> b!743695 (= lt!330354 (Intermediate!7490 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743696 () Bool)

(declare-fun res!500763 () Bool)

(assert (=> b!743696 (=> (not res!500763) (not e!415488))))

(assert (=> b!743696 (= res!500763 (and (= (size!20311 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20311 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20311 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743697 () Bool)

(assert (=> b!743697 (= e!415490 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19890 a!3186) j!159) a!3186 mask!3328) lt!330350))))

(declare-fun b!743698 () Bool)

(declare-fun res!500758 () Bool)

(assert (=> b!743698 (=> (not res!500758) (not e!415487))))

(declare-datatypes ((List!13892 0))(
  ( (Nil!13889) (Cons!13888 (h!14960 (_ BitVec 64)) (t!20207 List!13892)) )
))
(declare-fun arrayNoDuplicates!0 (array!41553 (_ BitVec 32) List!13892) Bool)

(assert (=> b!743698 (= res!500758 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13889))))

(declare-fun b!743699 () Bool)

(declare-fun res!500751 () Bool)

(assert (=> b!743699 (=> (not res!500751) (not e!415484))))

(assert (=> b!743699 (= res!500751 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19890 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743700 () Bool)

(assert (=> b!743700 (= e!415486 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19890 a!3186) j!159) a!3186 mask!3328) (Found!7490 j!159)))))

(assert (= (and start!65380 res!500765) b!743696))

(assert (= (and b!743696 res!500763) b!743691))

(assert (= (and b!743691 res!500755) b!743694))

(assert (= (and b!743694 res!500762) b!743683))

(assert (= (and b!743683 res!500754) b!743693))

(assert (= (and b!743693 res!500752) b!743687))

(assert (= (and b!743687 res!500757) b!743698))

(assert (= (and b!743698 res!500758) b!743685))

(assert (= (and b!743685 res!500760) b!743695))

(assert (= (and b!743695 res!500759) b!743699))

(assert (= (and b!743699 res!500751) b!743689))

(assert (= (and b!743689 c!81847) b!743690))

(assert (= (and b!743689 (not c!81847)) b!743700))

(assert (= (and b!743689 res!500756) b!743688))

(assert (= (and b!743688 res!500750) b!743686))

(assert (= (and b!743686 res!500753) b!743692))

(assert (= (and b!743692 res!500761) b!743697))

(assert (= (and b!743686 (not res!500764)) b!743684))

(declare-fun m!694327 () Bool)

(assert (=> b!743699 m!694327))

(declare-fun m!694329 () Bool)

(assert (=> b!743687 m!694329))

(declare-fun m!694331 () Bool)

(assert (=> b!743692 m!694331))

(assert (=> b!743692 m!694331))

(declare-fun m!694333 () Bool)

(assert (=> b!743692 m!694333))

(declare-fun m!694335 () Bool)

(assert (=> b!743693 m!694335))

(declare-fun m!694337 () Bool)

(assert (=> start!65380 m!694337))

(declare-fun m!694339 () Bool)

(assert (=> start!65380 m!694339))

(assert (=> b!743690 m!694331))

(assert (=> b!743690 m!694331))

(declare-fun m!694341 () Bool)

(assert (=> b!743690 m!694341))

(assert (=> b!743684 m!694331))

(assert (=> b!743684 m!694331))

(declare-fun m!694343 () Bool)

(assert (=> b!743684 m!694343))

(assert (=> b!743697 m!694331))

(assert (=> b!743697 m!694331))

(declare-fun m!694345 () Bool)

(assert (=> b!743697 m!694345))

(declare-fun m!694347 () Bool)

(assert (=> b!743688 m!694347))

(declare-fun m!694349 () Bool)

(assert (=> b!743688 m!694349))

(declare-fun m!694351 () Bool)

(assert (=> b!743688 m!694351))

(declare-fun m!694353 () Bool)

(assert (=> b!743688 m!694353))

(declare-fun m!694355 () Bool)

(assert (=> b!743688 m!694355))

(assert (=> b!743688 m!694347))

(declare-fun m!694357 () Bool)

(assert (=> b!743698 m!694357))

(assert (=> b!743700 m!694331))

(assert (=> b!743700 m!694331))

(assert (=> b!743700 m!694343))

(assert (=> b!743691 m!694331))

(assert (=> b!743691 m!694331))

(declare-fun m!694359 () Bool)

(assert (=> b!743691 m!694359))

(declare-fun m!694361 () Bool)

(assert (=> b!743686 m!694361))

(declare-fun m!694363 () Bool)

(assert (=> b!743686 m!694363))

(assert (=> b!743695 m!694331))

(assert (=> b!743695 m!694331))

(declare-fun m!694365 () Bool)

(assert (=> b!743695 m!694365))

(assert (=> b!743695 m!694365))

(assert (=> b!743695 m!694331))

(declare-fun m!694367 () Bool)

(assert (=> b!743695 m!694367))

(declare-fun m!694369 () Bool)

(assert (=> b!743694 m!694369))

(declare-fun m!694371 () Bool)

(assert (=> b!743683 m!694371))

(push 1)

