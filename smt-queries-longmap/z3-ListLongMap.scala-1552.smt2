; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29380 () Bool)

(assert start!29380)

(declare-fun b!297555 () Bool)

(declare-fun e!188034 () Bool)

(declare-fun e!188035 () Bool)

(assert (=> b!297555 (= e!188034 e!188035)))

(declare-fun res!156894 () Bool)

(assert (=> b!297555 (=> (not res!156894) (not e!188035))))

(declare-fun lt!147901 () Bool)

(assert (=> b!297555 (= res!156894 lt!147901)))

(declare-datatypes ((SeekEntryResult!2246 0))(
  ( (MissingZero!2246 (index!11154 (_ BitVec 32))) (Found!2246 (index!11155 (_ BitVec 32))) (Intermediate!2246 (undefined!3058 Bool) (index!11156 (_ BitVec 32)) (x!29485 (_ BitVec 32))) (Undefined!2246) (MissingVacant!2246 (index!11157 (_ BitVec 32))) )
))
(declare-fun lt!147906 () SeekEntryResult!2246)

(declare-datatypes ((array!15051 0))(
  ( (array!15052 (arr!7132 (Array (_ BitVec 32) (_ BitVec 64))) (size!7484 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15051)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!147905 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15051 (_ BitVec 32)) SeekEntryResult!2246)

(assert (=> b!297555 (= lt!147906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147905 k0!2524 (array!15052 (store (arr!7132 a!3312) i!1256 k0!2524) (size!7484 a!3312)) mask!3809))))

(declare-fun lt!147900 () SeekEntryResult!2246)

(assert (=> b!297555 (= lt!147900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147905 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297555 (= lt!147905 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297556 () Bool)

(declare-datatypes ((Unit!9218 0))(
  ( (Unit!9219) )
))
(declare-fun e!188036 () Unit!9218)

(declare-fun Unit!9220 () Unit!9218)

(assert (=> b!297556 (= e!188036 Unit!9220)))

(assert (=> b!297556 false))

(declare-fun b!297557 () Bool)

(declare-fun e!188032 () Unit!9218)

(assert (=> b!297557 (= e!188036 e!188032)))

(declare-fun c!47914 () Bool)

(get-info :version)

(assert (=> b!297557 (= c!47914 ((_ is Intermediate!2246) lt!147900))))

(declare-fun b!297558 () Bool)

(declare-fun e!188031 () Bool)

(assert (=> b!297558 (= e!188031 e!188034)))

(declare-fun res!156896 () Bool)

(assert (=> b!297558 (=> (not res!156896) (not e!188034))))

(declare-fun lt!147903 () SeekEntryResult!2246)

(assert (=> b!297558 (= res!156896 (or lt!147901 (= lt!147903 (MissingVacant!2246 i!1256))))))

(assert (=> b!297558 (= lt!147901 (= lt!147903 (MissingZero!2246 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15051 (_ BitVec 32)) SeekEntryResult!2246)

(assert (=> b!297558 (= lt!147903 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297559 () Bool)

(declare-fun res!156900 () Bool)

(assert (=> b!297559 (=> (not res!156900) (not e!188031))))

(declare-fun arrayContainsKey!0 (array!15051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297559 (= res!156900 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297560 () Bool)

(declare-fun res!156897 () Bool)

(assert (=> b!297560 (=> (not res!156897) (not e!188031))))

(assert (=> b!297560 (= res!156897 (and (= (size!7484 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7484 a!3312))))))

(declare-fun b!297561 () Bool)

(assert (=> b!297561 (and (= lt!147906 lt!147900) (= (select (store (arr!7132 a!3312) i!1256 k0!2524) (index!11156 lt!147900)) k0!2524))))

(declare-fun lt!147902 () Unit!9218)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9218)

(assert (=> b!297561 (= lt!147902 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147905 (index!11156 lt!147900) (x!29485 lt!147900) mask!3809))))

(assert (=> b!297561 (and (= (select (arr!7132 a!3312) (index!11156 lt!147900)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11156 lt!147900) i!1256))))

(declare-fun Unit!9221 () Unit!9218)

(assert (=> b!297561 (= e!188032 Unit!9221)))

(declare-fun b!297562 () Bool)

(assert (=> b!297562 false))

(declare-fun Unit!9222 () Unit!9218)

(assert (=> b!297562 (= e!188032 Unit!9222)))

(declare-fun b!297564 () Bool)

(assert (=> b!297564 (= e!188035 (not (= lt!147906 lt!147900)))))

(declare-fun lt!147904 () Unit!9218)

(assert (=> b!297564 (= lt!147904 e!188036)))

(declare-fun c!47913 () Bool)

(assert (=> b!297564 (= c!47913 (or (and ((_ is Intermediate!2246) lt!147900) (undefined!3058 lt!147900)) (and ((_ is Intermediate!2246) lt!147900) (= (select (arr!7132 a!3312) (index!11156 lt!147900)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2246) lt!147900) (= (select (arr!7132 a!3312) (index!11156 lt!147900)) k0!2524))))))

(declare-fun b!297565 () Bool)

(declare-fun res!156895 () Bool)

(assert (=> b!297565 (=> (not res!156895) (not e!188031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297565 (= res!156895 (validKeyInArray!0 k0!2524))))

(declare-fun b!297563 () Bool)

(declare-fun res!156898 () Bool)

(assert (=> b!297563 (=> (not res!156898) (not e!188034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15051 (_ BitVec 32)) Bool)

(assert (=> b!297563 (= res!156898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!156899 () Bool)

(assert (=> start!29380 (=> (not res!156899) (not e!188031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29380 (= res!156899 (validMask!0 mask!3809))))

(assert (=> start!29380 e!188031))

(assert (=> start!29380 true))

(declare-fun array_inv!5082 (array!15051) Bool)

(assert (=> start!29380 (array_inv!5082 a!3312)))

(assert (= (and start!29380 res!156899) b!297560))

(assert (= (and b!297560 res!156897) b!297565))

(assert (= (and b!297565 res!156895) b!297559))

(assert (= (and b!297559 res!156900) b!297558))

(assert (= (and b!297558 res!156896) b!297563))

(assert (= (and b!297563 res!156898) b!297555))

(assert (= (and b!297555 res!156894) b!297564))

(assert (= (and b!297564 c!47913) b!297556))

(assert (= (and b!297564 (not c!47913)) b!297557))

(assert (= (and b!297557 c!47914) b!297561))

(assert (= (and b!297557 (not c!47914)) b!297562))

(declare-fun m!310451 () Bool)

(assert (=> b!297563 m!310451))

(declare-fun m!310453 () Bool)

(assert (=> b!297564 m!310453))

(declare-fun m!310455 () Bool)

(assert (=> b!297558 m!310455))

(declare-fun m!310457 () Bool)

(assert (=> b!297565 m!310457))

(declare-fun m!310459 () Bool)

(assert (=> b!297555 m!310459))

(declare-fun m!310461 () Bool)

(assert (=> b!297555 m!310461))

(declare-fun m!310463 () Bool)

(assert (=> b!297555 m!310463))

(declare-fun m!310465 () Bool)

(assert (=> b!297555 m!310465))

(assert (=> b!297561 m!310459))

(declare-fun m!310467 () Bool)

(assert (=> b!297561 m!310467))

(declare-fun m!310469 () Bool)

(assert (=> b!297561 m!310469))

(assert (=> b!297561 m!310453))

(declare-fun m!310471 () Bool)

(assert (=> start!29380 m!310471))

(declare-fun m!310473 () Bool)

(assert (=> start!29380 m!310473))

(declare-fun m!310475 () Bool)

(assert (=> b!297559 m!310475))

(check-sat (not b!297558) (not b!297561) (not start!29380) (not b!297559) (not b!297565) (not b!297555) (not b!297563))
(check-sat)
