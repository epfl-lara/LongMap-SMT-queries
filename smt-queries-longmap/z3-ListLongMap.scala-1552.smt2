; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29388 () Bool)

(assert start!29388)

(declare-fun b!297523 () Bool)

(declare-fun res!156891 () Bool)

(declare-fun e!188019 () Bool)

(assert (=> b!297523 (=> (not res!156891) (not e!188019))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15056 0))(
  ( (array!15057 (arr!7134 (Array (_ BitVec 32) (_ BitVec 64))) (size!7486 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15056)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!297523 (= res!156891 (and (= (size!7486 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7486 a!3312))))))

(declare-fun b!297524 () Bool)

(declare-fun e!188017 () Bool)

(declare-fun e!188016 () Bool)

(assert (=> b!297524 (= e!188017 e!188016)))

(declare-fun res!156894 () Bool)

(assert (=> b!297524 (=> (not res!156894) (not e!188016))))

(declare-fun lt!147857 () Bool)

(assert (=> b!297524 (= res!156894 lt!147857)))

(declare-fun lt!147856 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2283 0))(
  ( (MissingZero!2283 (index!11302 (_ BitVec 32))) (Found!2283 (index!11303 (_ BitVec 32))) (Intermediate!2283 (undefined!3095 Bool) (index!11304 (_ BitVec 32)) (x!29521 (_ BitVec 32))) (Undefined!2283) (MissingVacant!2283 (index!11305 (_ BitVec 32))) )
))
(declare-fun lt!147859 () SeekEntryResult!2283)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15056 (_ BitVec 32)) SeekEntryResult!2283)

(assert (=> b!297524 (= lt!147859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147856 k0!2524 (array!15057 (store (arr!7134 a!3312) i!1256 k0!2524) (size!7486 a!3312)) mask!3809))))

(declare-fun lt!147855 () SeekEntryResult!2283)

(assert (=> b!297524 (= lt!147855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147856 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297524 (= lt!147856 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297525 () Bool)

(declare-datatypes ((Unit!9267 0))(
  ( (Unit!9268) )
))
(declare-fun e!188015 () Unit!9267)

(declare-fun Unit!9269 () Unit!9267)

(assert (=> b!297525 (= e!188015 Unit!9269)))

(assert (=> b!297525 false))

(declare-fun b!297526 () Bool)

(assert (=> b!297526 (= e!188016 (not (= lt!147859 lt!147855)))))

(declare-fun lt!147858 () Unit!9267)

(assert (=> b!297526 (= lt!147858 e!188015)))

(declare-fun c!47900 () Bool)

(get-info :version)

(assert (=> b!297526 (= c!47900 (or (and ((_ is Intermediate!2283) lt!147855) (undefined!3095 lt!147855)) (and ((_ is Intermediate!2283) lt!147855) (= (select (arr!7134 a!3312) (index!11304 lt!147855)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2283) lt!147855) (= (select (arr!7134 a!3312) (index!11304 lt!147855)) k0!2524))))))

(declare-fun b!297527 () Bool)

(declare-fun res!156888 () Bool)

(assert (=> b!297527 (=> (not res!156888) (not e!188017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15056 (_ BitVec 32)) Bool)

(assert (=> b!297527 (= res!156888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297528 () Bool)

(assert (=> b!297528 false))

(declare-fun e!188020 () Unit!9267)

(declare-fun Unit!9270 () Unit!9267)

(assert (=> b!297528 (= e!188020 Unit!9270)))

(declare-fun b!297529 () Bool)

(declare-fun res!156889 () Bool)

(assert (=> b!297529 (=> (not res!156889) (not e!188019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297529 (= res!156889 (validKeyInArray!0 k0!2524))))

(declare-fun res!156890 () Bool)

(assert (=> start!29388 (=> (not res!156890) (not e!188019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29388 (= res!156890 (validMask!0 mask!3809))))

(assert (=> start!29388 e!188019))

(assert (=> start!29388 true))

(declare-fun array_inv!5097 (array!15056) Bool)

(assert (=> start!29388 (array_inv!5097 a!3312)))

(declare-fun b!297530 () Bool)

(assert (=> b!297530 (= e!188019 e!188017)))

(declare-fun res!156892 () Bool)

(assert (=> b!297530 (=> (not res!156892) (not e!188017))))

(declare-fun lt!147861 () SeekEntryResult!2283)

(assert (=> b!297530 (= res!156892 (or lt!147857 (= lt!147861 (MissingVacant!2283 i!1256))))))

(assert (=> b!297530 (= lt!147857 (= lt!147861 (MissingZero!2283 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15056 (_ BitVec 32)) SeekEntryResult!2283)

(assert (=> b!297530 (= lt!147861 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297531 () Bool)

(assert (=> b!297531 (= e!188015 e!188020)))

(declare-fun c!47901 () Bool)

(assert (=> b!297531 (= c!47901 ((_ is Intermediate!2283) lt!147855))))

(declare-fun b!297532 () Bool)

(declare-fun res!156893 () Bool)

(assert (=> b!297532 (=> (not res!156893) (not e!188019))))

(declare-fun arrayContainsKey!0 (array!15056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297532 (= res!156893 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297533 () Bool)

(assert (=> b!297533 (and (= lt!147859 lt!147855) (= (select (store (arr!7134 a!3312) i!1256 k0!2524) (index!11304 lt!147855)) k0!2524))))

(declare-fun lt!147860 () Unit!9267)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15056 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9267)

(assert (=> b!297533 (= lt!147860 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147856 (index!11304 lt!147855) (x!29521 lt!147855) mask!3809))))

(assert (=> b!297533 (and (= (select (arr!7134 a!3312) (index!11304 lt!147855)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11304 lt!147855) i!1256))))

(declare-fun Unit!9271 () Unit!9267)

(assert (=> b!297533 (= e!188020 Unit!9271)))

(assert (= (and start!29388 res!156890) b!297523))

(assert (= (and b!297523 res!156891) b!297529))

(assert (= (and b!297529 res!156889) b!297532))

(assert (= (and b!297532 res!156893) b!297530))

(assert (= (and b!297530 res!156892) b!297527))

(assert (= (and b!297527 res!156888) b!297524))

(assert (= (and b!297524 res!156894) b!297526))

(assert (= (and b!297526 c!47900) b!297525))

(assert (= (and b!297526 (not c!47900)) b!297531))

(assert (= (and b!297531 c!47901) b!297533))

(assert (= (and b!297531 (not c!47901)) b!297528))

(declare-fun m!310247 () Bool)

(assert (=> b!297530 m!310247))

(declare-fun m!310249 () Bool)

(assert (=> b!297529 m!310249))

(declare-fun m!310251 () Bool)

(assert (=> start!29388 m!310251))

(declare-fun m!310253 () Bool)

(assert (=> start!29388 m!310253))

(declare-fun m!310255 () Bool)

(assert (=> b!297532 m!310255))

(declare-fun m!310257 () Bool)

(assert (=> b!297524 m!310257))

(declare-fun m!310259 () Bool)

(assert (=> b!297524 m!310259))

(declare-fun m!310261 () Bool)

(assert (=> b!297524 m!310261))

(declare-fun m!310263 () Bool)

(assert (=> b!297524 m!310263))

(assert (=> b!297533 m!310257))

(declare-fun m!310265 () Bool)

(assert (=> b!297533 m!310265))

(declare-fun m!310267 () Bool)

(assert (=> b!297533 m!310267))

(declare-fun m!310269 () Bool)

(assert (=> b!297533 m!310269))

(declare-fun m!310271 () Bool)

(assert (=> b!297527 m!310271))

(assert (=> b!297526 m!310269))

(check-sat (not start!29388) (not b!297533) (not b!297529) (not b!297532) (not b!297524) (not b!297527) (not b!297530))
(check-sat)
