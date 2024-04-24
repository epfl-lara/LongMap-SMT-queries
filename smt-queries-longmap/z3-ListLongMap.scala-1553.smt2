; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29386 () Bool)

(assert start!29386)

(declare-fun b!297654 () Bool)

(declare-fun res!156961 () Bool)

(declare-fun e!188090 () Bool)

(assert (=> b!297654 (=> (not res!156961) (not e!188090))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15057 0))(
  ( (array!15058 (arr!7135 (Array (_ BitVec 32) (_ BitVec 64))) (size!7487 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15057)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!297654 (= res!156961 (and (= (size!7487 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7487 a!3312))))))

(declare-fun b!297655 () Bool)

(declare-fun e!188085 () Bool)

(assert (=> b!297655 (= e!188085 false)))

(declare-datatypes ((Unit!9233 0))(
  ( (Unit!9234) )
))
(declare-fun lt!147966 () Unit!9233)

(declare-fun e!188086 () Unit!9233)

(assert (=> b!297655 (= lt!147966 e!188086)))

(declare-datatypes ((SeekEntryResult!2249 0))(
  ( (MissingZero!2249 (index!11166 (_ BitVec 32))) (Found!2249 (index!11167 (_ BitVec 32))) (Intermediate!2249 (undefined!3061 Bool) (index!11168 (_ BitVec 32)) (x!29496 (_ BitVec 32))) (Undefined!2249) (MissingVacant!2249 (index!11169 (_ BitVec 32))) )
))
(declare-fun lt!147965 () SeekEntryResult!2249)

(declare-fun c!47932 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(get-info :version)

(assert (=> b!297655 (= c!47932 (or (and ((_ is Intermediate!2249) lt!147965) (undefined!3061 lt!147965)) (and ((_ is Intermediate!2249) lt!147965) (= (select (arr!7135 a!3312) (index!11168 lt!147965)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2249) lt!147965) (= (select (arr!7135 a!3312) (index!11168 lt!147965)) k0!2524))))))

(declare-fun b!297656 () Bool)

(declare-fun lt!147963 () SeekEntryResult!2249)

(assert (=> b!297656 (and (= lt!147963 lt!147965) (= (select (store (arr!7135 a!3312) i!1256 k0!2524) (index!11168 lt!147965)) k0!2524))))

(declare-fun lt!147964 () Unit!9233)

(declare-fun lt!147967 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9233)

(assert (=> b!297656 (= lt!147964 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147967 (index!11168 lt!147965) (x!29496 lt!147965) mask!3809))))

(assert (=> b!297656 (and (= (select (arr!7135 a!3312) (index!11168 lt!147965)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11168 lt!147965) i!1256))))

(declare-fun e!188087 () Unit!9233)

(declare-fun Unit!9235 () Unit!9233)

(assert (=> b!297656 (= e!188087 Unit!9235)))

(declare-fun b!297657 () Bool)

(declare-fun res!156958 () Bool)

(assert (=> b!297657 (=> (not res!156958) (not e!188090))))

(declare-fun arrayContainsKey!0 (array!15057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297657 (= res!156958 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297658 () Bool)

(declare-fun e!188089 () Bool)

(assert (=> b!297658 (= e!188089 e!188085)))

(declare-fun res!156963 () Bool)

(assert (=> b!297658 (=> (not res!156963) (not e!188085))))

(declare-fun lt!147968 () Bool)

(assert (=> b!297658 (= res!156963 lt!147968)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15057 (_ BitVec 32)) SeekEntryResult!2249)

(assert (=> b!297658 (= lt!147963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147967 k0!2524 (array!15058 (store (arr!7135 a!3312) i!1256 k0!2524) (size!7487 a!3312)) mask!3809))))

(assert (=> b!297658 (= lt!147965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147967 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297658 (= lt!147967 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!156957 () Bool)

(assert (=> start!29386 (=> (not res!156957) (not e!188090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29386 (= res!156957 (validMask!0 mask!3809))))

(assert (=> start!29386 e!188090))

(assert (=> start!29386 true))

(declare-fun array_inv!5085 (array!15057) Bool)

(assert (=> start!29386 (array_inv!5085 a!3312)))

(declare-fun b!297659 () Bool)

(assert (=> b!297659 (= e!188090 e!188089)))

(declare-fun res!156959 () Bool)

(assert (=> b!297659 (=> (not res!156959) (not e!188089))))

(declare-fun lt!147969 () SeekEntryResult!2249)

(assert (=> b!297659 (= res!156959 (or lt!147968 (= lt!147969 (MissingVacant!2249 i!1256))))))

(assert (=> b!297659 (= lt!147968 (= lt!147969 (MissingZero!2249 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15057 (_ BitVec 32)) SeekEntryResult!2249)

(assert (=> b!297659 (= lt!147969 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297660 () Bool)

(declare-fun res!156960 () Bool)

(assert (=> b!297660 (=> (not res!156960) (not e!188089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15057 (_ BitVec 32)) Bool)

(assert (=> b!297660 (= res!156960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297661 () Bool)

(declare-fun Unit!9236 () Unit!9233)

(assert (=> b!297661 (= e!188086 Unit!9236)))

(assert (=> b!297661 false))

(declare-fun b!297662 () Bool)

(declare-fun res!156962 () Bool)

(assert (=> b!297662 (=> (not res!156962) (not e!188090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297662 (= res!156962 (validKeyInArray!0 k0!2524))))

(declare-fun b!297663 () Bool)

(assert (=> b!297663 (= e!188086 e!188087)))

(declare-fun c!47931 () Bool)

(assert (=> b!297663 (= c!47931 ((_ is Intermediate!2249) lt!147965))))

(declare-fun b!297664 () Bool)

(assert (=> b!297664 false))

(declare-fun Unit!9237 () Unit!9233)

(assert (=> b!297664 (= e!188087 Unit!9237)))

(assert (= (and start!29386 res!156957) b!297654))

(assert (= (and b!297654 res!156961) b!297662))

(assert (= (and b!297662 res!156962) b!297657))

(assert (= (and b!297657 res!156958) b!297659))

(assert (= (and b!297659 res!156959) b!297660))

(assert (= (and b!297660 res!156960) b!297658))

(assert (= (and b!297658 res!156963) b!297655))

(assert (= (and b!297655 c!47932) b!297661))

(assert (= (and b!297655 (not c!47932)) b!297663))

(assert (= (and b!297663 c!47931) b!297656))

(assert (= (and b!297663 (not c!47931)) b!297664))

(declare-fun m!310529 () Bool)

(assert (=> start!29386 m!310529))

(declare-fun m!310531 () Bool)

(assert (=> start!29386 m!310531))

(declare-fun m!310533 () Bool)

(assert (=> b!297655 m!310533))

(declare-fun m!310535 () Bool)

(assert (=> b!297662 m!310535))

(declare-fun m!310537 () Bool)

(assert (=> b!297660 m!310537))

(declare-fun m!310539 () Bool)

(assert (=> b!297658 m!310539))

(declare-fun m!310541 () Bool)

(assert (=> b!297658 m!310541))

(declare-fun m!310543 () Bool)

(assert (=> b!297658 m!310543))

(declare-fun m!310545 () Bool)

(assert (=> b!297658 m!310545))

(assert (=> b!297656 m!310539))

(declare-fun m!310547 () Bool)

(assert (=> b!297656 m!310547))

(declare-fun m!310549 () Bool)

(assert (=> b!297656 m!310549))

(assert (=> b!297656 m!310533))

(declare-fun m!310551 () Bool)

(assert (=> b!297659 m!310551))

(declare-fun m!310553 () Bool)

(assert (=> b!297657 m!310553))

(check-sat (not b!297659) (not b!297657) (not b!297656) (not start!29386) (not b!297662) (not b!297660) (not b!297658))
(check-sat)
