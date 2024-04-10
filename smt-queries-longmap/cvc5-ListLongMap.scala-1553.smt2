; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29392 () Bool)

(assert start!29392)

(declare-fun b!297589 () Bool)

(declare-fun e!188054 () Bool)

(declare-fun e!188051 () Bool)

(assert (=> b!297589 (= e!188054 e!188051)))

(declare-fun res!156932 () Bool)

(assert (=> b!297589 (=> (not res!156932) (not e!188051))))

(declare-fun lt!147903 () Bool)

(assert (=> b!297589 (= res!156932 lt!147903)))

(declare-datatypes ((SeekEntryResult!2285 0))(
  ( (MissingZero!2285 (index!11310 (_ BitVec 32))) (Found!2285 (index!11311 (_ BitVec 32))) (Intermediate!2285 (undefined!3097 Bool) (index!11312 (_ BitVec 32)) (x!29531 (_ BitVec 32))) (Undefined!2285) (MissingVacant!2285 (index!11313 (_ BitVec 32))) )
))
(declare-fun lt!147901 () SeekEntryResult!2285)

(declare-fun lt!147898 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15060 0))(
  ( (array!15061 (arr!7136 (Array (_ BitVec 32) (_ BitVec 64))) (size!7488 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15060)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15060 (_ BitVec 32)) SeekEntryResult!2285)

(assert (=> b!297589 (= lt!147901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147898 k!2524 (array!15061 (store (arr!7136 a!3312) i!1256 k!2524) (size!7488 a!3312)) mask!3809))))

(declare-fun lt!147900 () SeekEntryResult!2285)

(assert (=> b!297589 (= lt!147900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147898 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297589 (= lt!147898 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297590 () Bool)

(declare-datatypes ((Unit!9277 0))(
  ( (Unit!9278) )
))
(declare-fun e!188056 () Unit!9277)

(declare-fun Unit!9279 () Unit!9277)

(assert (=> b!297590 (= e!188056 Unit!9279)))

(assert (=> b!297590 false))

(declare-fun b!297591 () Bool)

(assert (=> b!297591 false))

(declare-fun e!188055 () Unit!9277)

(declare-fun Unit!9280 () Unit!9277)

(assert (=> b!297591 (= e!188055 Unit!9280)))

(declare-fun b!297592 () Bool)

(declare-fun res!156936 () Bool)

(assert (=> b!297592 (=> (not res!156936) (not e!188054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15060 (_ BitVec 32)) Bool)

(assert (=> b!297592 (= res!156936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!156935 () Bool)

(declare-fun e!188053 () Bool)

(assert (=> start!29392 (=> (not res!156935) (not e!188053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29392 (= res!156935 (validMask!0 mask!3809))))

(assert (=> start!29392 e!188053))

(assert (=> start!29392 true))

(declare-fun array_inv!5099 (array!15060) Bool)

(assert (=> start!29392 (array_inv!5099 a!3312)))

(declare-fun b!297593 () Bool)

(assert (=> b!297593 (= e!188056 e!188055)))

(declare-fun c!47913 () Bool)

(assert (=> b!297593 (= c!47913 (is-Intermediate!2285 lt!147900))))

(declare-fun b!297594 () Bool)

(declare-fun res!156933 () Bool)

(assert (=> b!297594 (=> (not res!156933) (not e!188053))))

(declare-fun arrayContainsKey!0 (array!15060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297594 (= res!156933 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297595 () Bool)

(declare-fun res!156931 () Bool)

(assert (=> b!297595 (=> (not res!156931) (not e!188053))))

(assert (=> b!297595 (= res!156931 (and (= (size!7488 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7488 a!3312))))))

(declare-fun b!297596 () Bool)

(declare-fun res!156934 () Bool)

(assert (=> b!297596 (=> (not res!156934) (not e!188053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297596 (= res!156934 (validKeyInArray!0 k!2524))))

(declare-fun b!297597 () Bool)

(assert (=> b!297597 (and (= lt!147901 lt!147900) (= (select (store (arr!7136 a!3312) i!1256 k!2524) (index!11312 lt!147900)) k!2524))))

(declare-fun lt!147902 () Unit!9277)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15060 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9277)

(assert (=> b!297597 (= lt!147902 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147898 (index!11312 lt!147900) (x!29531 lt!147900) mask!3809))))

(assert (=> b!297597 (and (= (select (arr!7136 a!3312) (index!11312 lt!147900)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11312 lt!147900) i!1256))))

(declare-fun Unit!9281 () Unit!9277)

(assert (=> b!297597 (= e!188055 Unit!9281)))

(declare-fun b!297598 () Bool)

(assert (=> b!297598 (= e!188053 e!188054)))

(declare-fun res!156930 () Bool)

(assert (=> b!297598 (=> (not res!156930) (not e!188054))))

(declare-fun lt!147899 () SeekEntryResult!2285)

(assert (=> b!297598 (= res!156930 (or lt!147903 (= lt!147899 (MissingVacant!2285 i!1256))))))

(assert (=> b!297598 (= lt!147903 (= lt!147899 (MissingZero!2285 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15060 (_ BitVec 32)) SeekEntryResult!2285)

(assert (=> b!297598 (= lt!147899 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297599 () Bool)

(assert (=> b!297599 (= e!188051 false)))

(declare-fun lt!147897 () Unit!9277)

(assert (=> b!297599 (= lt!147897 e!188056)))

(declare-fun c!47912 () Bool)

(assert (=> b!297599 (= c!47912 (or (and (is-Intermediate!2285 lt!147900) (undefined!3097 lt!147900)) (and (is-Intermediate!2285 lt!147900) (= (select (arr!7136 a!3312) (index!11312 lt!147900)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2285 lt!147900) (= (select (arr!7136 a!3312) (index!11312 lt!147900)) k!2524))))))

(assert (= (and start!29392 res!156935) b!297595))

(assert (= (and b!297595 res!156931) b!297596))

(assert (= (and b!297596 res!156934) b!297594))

(assert (= (and b!297594 res!156933) b!297598))

(assert (= (and b!297598 res!156930) b!297592))

(assert (= (and b!297592 res!156936) b!297589))

(assert (= (and b!297589 res!156932) b!297599))

(assert (= (and b!297599 c!47912) b!297590))

(assert (= (and b!297599 (not c!47912)) b!297593))

(assert (= (and b!297593 c!47913) b!297597))

(assert (= (and b!297593 (not c!47913)) b!297591))

(declare-fun m!310299 () Bool)

(assert (=> b!297597 m!310299))

(declare-fun m!310301 () Bool)

(assert (=> b!297597 m!310301))

(declare-fun m!310303 () Bool)

(assert (=> b!297597 m!310303))

(declare-fun m!310305 () Bool)

(assert (=> b!297597 m!310305))

(declare-fun m!310307 () Bool)

(assert (=> b!297598 m!310307))

(declare-fun m!310309 () Bool)

(assert (=> b!297592 m!310309))

(assert (=> b!297599 m!310305))

(declare-fun m!310311 () Bool)

(assert (=> b!297594 m!310311))

(assert (=> b!297589 m!310299))

(declare-fun m!310313 () Bool)

(assert (=> b!297589 m!310313))

(declare-fun m!310315 () Bool)

(assert (=> b!297589 m!310315))

(declare-fun m!310317 () Bool)

(assert (=> b!297589 m!310317))

(declare-fun m!310319 () Bool)

(assert (=> b!297596 m!310319))

(declare-fun m!310321 () Bool)

(assert (=> start!29392 m!310321))

(declare-fun m!310323 () Bool)

(assert (=> start!29392 m!310323))

(push 1)

