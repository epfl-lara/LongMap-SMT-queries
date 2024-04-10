; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29394 () Bool)

(assert start!29394)

(declare-fun b!297622 () Bool)

(declare-fun e!188073 () Bool)

(declare-fun e!188071 () Bool)

(assert (=> b!297622 (= e!188073 e!188071)))

(declare-fun res!156953 () Bool)

(assert (=> b!297622 (=> (not res!156953) (not e!188071))))

(declare-fun lt!147918 () Bool)

(assert (=> b!297622 (= res!156953 lt!147918)))

(declare-fun lt!147919 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15062 0))(
  ( (array!15063 (arr!7137 (Array (_ BitVec 32) (_ BitVec 64))) (size!7489 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15062)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2286 0))(
  ( (MissingZero!2286 (index!11314 (_ BitVec 32))) (Found!2286 (index!11315 (_ BitVec 32))) (Intermediate!2286 (undefined!3098 Bool) (index!11316 (_ BitVec 32)) (x!29532 (_ BitVec 32))) (Undefined!2286) (MissingVacant!2286 (index!11317 (_ BitVec 32))) )
))
(declare-fun lt!147921 () SeekEntryResult!2286)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15062 (_ BitVec 32)) SeekEntryResult!2286)

(assert (=> b!297622 (= lt!147921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147919 k0!2524 (array!15063 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7489 a!3312)) mask!3809))))

(declare-fun lt!147923 () SeekEntryResult!2286)

(assert (=> b!297622 (= lt!147923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147919 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297622 (= lt!147919 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297623 () Bool)

(assert (=> b!297623 false))

(declare-datatypes ((Unit!9282 0))(
  ( (Unit!9283) )
))
(declare-fun e!188069 () Unit!9282)

(declare-fun Unit!9284 () Unit!9282)

(assert (=> b!297623 (= e!188069 Unit!9284)))

(declare-fun b!297624 () Bool)

(assert (=> b!297624 (= e!188071 false)))

(declare-fun lt!147920 () Unit!9282)

(declare-fun e!188072 () Unit!9282)

(assert (=> b!297624 (= lt!147920 e!188072)))

(declare-fun c!47918 () Bool)

(get-info :version)

(assert (=> b!297624 (= c!47918 (or (and ((_ is Intermediate!2286) lt!147923) (undefined!3098 lt!147923)) (and ((_ is Intermediate!2286) lt!147923) (= (select (arr!7137 a!3312) (index!11316 lt!147923)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2286) lt!147923) (= (select (arr!7137 a!3312) (index!11316 lt!147923)) k0!2524))))))

(declare-fun res!156952 () Bool)

(declare-fun e!188070 () Bool)

(assert (=> start!29394 (=> (not res!156952) (not e!188070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29394 (= res!156952 (validMask!0 mask!3809))))

(assert (=> start!29394 e!188070))

(assert (=> start!29394 true))

(declare-fun array_inv!5100 (array!15062) Bool)

(assert (=> start!29394 (array_inv!5100 a!3312)))

(declare-fun b!297625 () Bool)

(declare-fun res!156951 () Bool)

(assert (=> b!297625 (=> (not res!156951) (not e!188070))))

(assert (=> b!297625 (= res!156951 (and (= (size!7489 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7489 a!3312))))))

(declare-fun b!297626 () Bool)

(declare-fun res!156957 () Bool)

(assert (=> b!297626 (=> (not res!156957) (not e!188073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15062 (_ BitVec 32)) Bool)

(assert (=> b!297626 (= res!156957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297627 () Bool)

(declare-fun res!156955 () Bool)

(assert (=> b!297627 (=> (not res!156955) (not e!188070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297627 (= res!156955 (validKeyInArray!0 k0!2524))))

(declare-fun b!297628 () Bool)

(assert (=> b!297628 (and (= lt!147921 lt!147923) (= (select (store (arr!7137 a!3312) i!1256 k0!2524) (index!11316 lt!147923)) k0!2524))))

(declare-fun lt!147922 () Unit!9282)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15062 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9282)

(assert (=> b!297628 (= lt!147922 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147919 (index!11316 lt!147923) (x!29532 lt!147923) mask!3809))))

(assert (=> b!297628 (and (= (select (arr!7137 a!3312) (index!11316 lt!147923)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11316 lt!147923) i!1256))))

(declare-fun Unit!9285 () Unit!9282)

(assert (=> b!297628 (= e!188069 Unit!9285)))

(declare-fun b!297629 () Bool)

(declare-fun Unit!9286 () Unit!9282)

(assert (=> b!297629 (= e!188072 Unit!9286)))

(assert (=> b!297629 false))

(declare-fun b!297630 () Bool)

(assert (=> b!297630 (= e!188070 e!188073)))

(declare-fun res!156956 () Bool)

(assert (=> b!297630 (=> (not res!156956) (not e!188073))))

(declare-fun lt!147924 () SeekEntryResult!2286)

(assert (=> b!297630 (= res!156956 (or lt!147918 (= lt!147924 (MissingVacant!2286 i!1256))))))

(assert (=> b!297630 (= lt!147918 (= lt!147924 (MissingZero!2286 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15062 (_ BitVec 32)) SeekEntryResult!2286)

(assert (=> b!297630 (= lt!147924 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297631 () Bool)

(declare-fun res!156954 () Bool)

(assert (=> b!297631 (=> (not res!156954) (not e!188070))))

(declare-fun arrayContainsKey!0 (array!15062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297631 (= res!156954 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297632 () Bool)

(assert (=> b!297632 (= e!188072 e!188069)))

(declare-fun c!47919 () Bool)

(assert (=> b!297632 (= c!47919 ((_ is Intermediate!2286) lt!147923))))

(assert (= (and start!29394 res!156952) b!297625))

(assert (= (and b!297625 res!156951) b!297627))

(assert (= (and b!297627 res!156955) b!297631))

(assert (= (and b!297631 res!156954) b!297630))

(assert (= (and b!297630 res!156956) b!297626))

(assert (= (and b!297626 res!156957) b!297622))

(assert (= (and b!297622 res!156953) b!297624))

(assert (= (and b!297624 c!47918) b!297629))

(assert (= (and b!297624 (not c!47918)) b!297632))

(assert (= (and b!297632 c!47919) b!297628))

(assert (= (and b!297632 (not c!47919)) b!297623))

(declare-fun m!310325 () Bool)

(assert (=> b!297628 m!310325))

(declare-fun m!310327 () Bool)

(assert (=> b!297628 m!310327))

(declare-fun m!310329 () Bool)

(assert (=> b!297628 m!310329))

(declare-fun m!310331 () Bool)

(assert (=> b!297628 m!310331))

(declare-fun m!310333 () Bool)

(assert (=> b!297626 m!310333))

(assert (=> b!297624 m!310331))

(assert (=> b!297622 m!310325))

(declare-fun m!310335 () Bool)

(assert (=> b!297622 m!310335))

(declare-fun m!310337 () Bool)

(assert (=> b!297622 m!310337))

(declare-fun m!310339 () Bool)

(assert (=> b!297622 m!310339))

(declare-fun m!310341 () Bool)

(assert (=> b!297630 m!310341))

(declare-fun m!310343 () Bool)

(assert (=> b!297627 m!310343))

(declare-fun m!310345 () Bool)

(assert (=> b!297631 m!310345))

(declare-fun m!310347 () Bool)

(assert (=> start!29394 m!310347))

(declare-fun m!310349 () Bool)

(assert (=> start!29394 m!310349))

(check-sat (not b!297627) (not b!297628) (not start!29394) (not b!297631) (not b!297622) (not b!297630) (not b!297626))
(check-sat)
