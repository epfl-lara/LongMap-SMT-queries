; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29396 () Bool)

(assert start!29396)

(declare-fun b!297655 () Bool)

(assert (=> b!297655 false))

(declare-datatypes ((Unit!9287 0))(
  ( (Unit!9288) )
))
(declare-fun e!188090 () Unit!9287)

(declare-fun Unit!9289 () Unit!9287)

(assert (=> b!297655 (= e!188090 Unit!9289)))

(declare-fun b!297656 () Bool)

(declare-fun e!188091 () Unit!9287)

(declare-fun Unit!9290 () Unit!9287)

(assert (=> b!297656 (= e!188091 Unit!9290)))

(assert (=> b!297656 false))

(declare-fun b!297657 () Bool)

(declare-fun e!188087 () Bool)

(declare-fun e!188092 () Bool)

(assert (=> b!297657 (= e!188087 e!188092)))

(declare-fun res!156976 () Bool)

(assert (=> b!297657 (=> (not res!156976) (not e!188092))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147941 () Bool)

(declare-datatypes ((SeekEntryResult!2287 0))(
  ( (MissingZero!2287 (index!11318 (_ BitVec 32))) (Found!2287 (index!11319 (_ BitVec 32))) (Intermediate!2287 (undefined!3099 Bool) (index!11320 (_ BitVec 32)) (x!29533 (_ BitVec 32))) (Undefined!2287) (MissingVacant!2287 (index!11321 (_ BitVec 32))) )
))
(declare-fun lt!147940 () SeekEntryResult!2287)

(assert (=> b!297657 (= res!156976 (or lt!147941 (= lt!147940 (MissingVacant!2287 i!1256))))))

(assert (=> b!297657 (= lt!147941 (= lt!147940 (MissingZero!2287 i!1256)))))

(declare-datatypes ((array!15064 0))(
  ( (array!15065 (arr!7138 (Array (_ BitVec 32) (_ BitVec 64))) (size!7490 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15064)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15064 (_ BitVec 32)) SeekEntryResult!2287)

(assert (=> b!297657 (= lt!147940 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297658 () Bool)

(declare-fun res!156974 () Bool)

(assert (=> b!297658 (=> (not res!156974) (not e!188087))))

(assert (=> b!297658 (= res!156974 (and (= (size!7490 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7490 a!3312))))))

(declare-fun b!297659 () Bool)

(declare-fun res!156977 () Bool)

(assert (=> b!297659 (=> (not res!156977) (not e!188087))))

(declare-fun arrayContainsKey!0 (array!15064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297659 (= res!156977 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297660 () Bool)

(declare-fun lt!147944 () SeekEntryResult!2287)

(declare-fun lt!147943 () SeekEntryResult!2287)

(assert (=> b!297660 (and (= lt!147944 lt!147943) (= (select (store (arr!7138 a!3312) i!1256 k!2524) (index!11320 lt!147943)) k!2524))))

(declare-fun lt!147945 () (_ BitVec 32))

(declare-fun lt!147939 () Unit!9287)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15064 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9287)

(assert (=> b!297660 (= lt!147939 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147945 (index!11320 lt!147943) (x!29533 lt!147943) mask!3809))))

(assert (=> b!297660 (and (= (select (arr!7138 a!3312) (index!11320 lt!147943)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11320 lt!147943) i!1256))))

(declare-fun Unit!9291 () Unit!9287)

(assert (=> b!297660 (= e!188090 Unit!9291)))

(declare-fun res!156973 () Bool)

(assert (=> start!29396 (=> (not res!156973) (not e!188087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29396 (= res!156973 (validMask!0 mask!3809))))

(assert (=> start!29396 e!188087))

(assert (=> start!29396 true))

(declare-fun array_inv!5101 (array!15064) Bool)

(assert (=> start!29396 (array_inv!5101 a!3312)))

(declare-fun b!297661 () Bool)

(declare-fun res!156975 () Bool)

(assert (=> b!297661 (=> (not res!156975) (not e!188092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15064 (_ BitVec 32)) Bool)

(assert (=> b!297661 (= res!156975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297662 () Bool)

(declare-fun res!156978 () Bool)

(assert (=> b!297662 (=> (not res!156978) (not e!188087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297662 (= res!156978 (validKeyInArray!0 k!2524))))

(declare-fun b!297663 () Bool)

(declare-fun e!188089 () Bool)

(assert (=> b!297663 (= e!188089 false)))

(declare-fun lt!147942 () Unit!9287)

(assert (=> b!297663 (= lt!147942 e!188091)))

(declare-fun c!47925 () Bool)

(assert (=> b!297663 (= c!47925 (or (and (is-Intermediate!2287 lt!147943) (undefined!3099 lt!147943)) (and (is-Intermediate!2287 lt!147943) (= (select (arr!7138 a!3312) (index!11320 lt!147943)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2287 lt!147943) (= (select (arr!7138 a!3312) (index!11320 lt!147943)) k!2524))))))

(declare-fun b!297664 () Bool)

(assert (=> b!297664 (= e!188091 e!188090)))

(declare-fun c!47924 () Bool)

(assert (=> b!297664 (= c!47924 (is-Intermediate!2287 lt!147943))))

(declare-fun b!297665 () Bool)

(assert (=> b!297665 (= e!188092 e!188089)))

(declare-fun res!156972 () Bool)

(assert (=> b!297665 (=> (not res!156972) (not e!188089))))

(assert (=> b!297665 (= res!156972 lt!147941)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15064 (_ BitVec 32)) SeekEntryResult!2287)

(assert (=> b!297665 (= lt!147944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147945 k!2524 (array!15065 (store (arr!7138 a!3312) i!1256 k!2524) (size!7490 a!3312)) mask!3809))))

(assert (=> b!297665 (= lt!147943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147945 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297665 (= lt!147945 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29396 res!156973) b!297658))

(assert (= (and b!297658 res!156974) b!297662))

(assert (= (and b!297662 res!156978) b!297659))

(assert (= (and b!297659 res!156977) b!297657))

(assert (= (and b!297657 res!156976) b!297661))

(assert (= (and b!297661 res!156975) b!297665))

(assert (= (and b!297665 res!156972) b!297663))

(assert (= (and b!297663 c!47925) b!297656))

(assert (= (and b!297663 (not c!47925)) b!297664))

(assert (= (and b!297664 c!47924) b!297660))

(assert (= (and b!297664 (not c!47924)) b!297655))

(declare-fun m!310351 () Bool)

(assert (=> b!297661 m!310351))

(declare-fun m!310353 () Bool)

(assert (=> b!297665 m!310353))

(declare-fun m!310355 () Bool)

(assert (=> b!297665 m!310355))

(declare-fun m!310357 () Bool)

(assert (=> b!297665 m!310357))

(declare-fun m!310359 () Bool)

(assert (=> b!297665 m!310359))

(declare-fun m!310361 () Bool)

(assert (=> b!297662 m!310361))

(declare-fun m!310363 () Bool)

(assert (=> b!297657 m!310363))

(declare-fun m!310365 () Bool)

(assert (=> start!29396 m!310365))

(declare-fun m!310367 () Bool)

(assert (=> start!29396 m!310367))

(declare-fun m!310369 () Bool)

(assert (=> b!297659 m!310369))

(declare-fun m!310371 () Bool)

(assert (=> b!297663 m!310371))

(assert (=> b!297660 m!310353))

(declare-fun m!310373 () Bool)

(assert (=> b!297660 m!310373))

(declare-fun m!310375 () Bool)

(assert (=> b!297660 m!310375))

(assert (=> b!297660 m!310371))

(push 1)

