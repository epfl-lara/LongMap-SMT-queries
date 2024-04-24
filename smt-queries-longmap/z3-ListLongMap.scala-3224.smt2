; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45080 () Bool)

(assert start!45080)

(declare-fun b!494946 () Bool)

(declare-fun e!290378 () Bool)

(declare-fun e!290381 () Bool)

(assert (=> b!494946 (= e!290378 (not e!290381))))

(declare-fun res!297574 () Bool)

(assert (=> b!494946 (=> res!297574 e!290381)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32026 0))(
  ( (array!32027 (arr!15397 (Array (_ BitVec 32) (_ BitVec 64))) (size!15761 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32026)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3820 0))(
  ( (MissingZero!3820 (index!17459 (_ BitVec 32))) (Found!3820 (index!17460 (_ BitVec 32))) (Intermediate!3820 (undefined!4632 Bool) (index!17461 (_ BitVec 32)) (x!46671 (_ BitVec 32))) (Undefined!3820) (MissingVacant!3820 (index!17462 (_ BitVec 32))) )
))
(declare-fun lt!224110 () SeekEntryResult!3820)

(declare-fun lt!224107 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32026 (_ BitVec 32)) SeekEntryResult!3820)

(assert (=> b!494946 (= res!297574 (= lt!224110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224107 (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235)) mask!3524)))))

(declare-fun lt!224109 () (_ BitVec 32))

(assert (=> b!494946 (= lt!224110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224109 (select (arr!15397 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494946 (= lt!224107 (toIndex!0 (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494946 (= lt!224109 (toIndex!0 (select (arr!15397 a!3235) j!176) mask!3524))))

(declare-fun e!290382 () Bool)

(assert (=> b!494946 e!290382))

(declare-fun res!297573 () Bool)

(assert (=> b!494946 (=> (not res!297573) (not e!290382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32026 (_ BitVec 32)) Bool)

(assert (=> b!494946 (= res!297573 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14647 0))(
  ( (Unit!14648) )
))
(declare-fun lt!224108 () Unit!14647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14647)

(assert (=> b!494946 (= lt!224108 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494947 () Bool)

(declare-fun res!297579 () Bool)

(declare-fun e!290379 () Bool)

(assert (=> b!494947 (=> (not res!297579) (not e!290379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494947 (= res!297579 (validKeyInArray!0 (select (arr!15397 a!3235) j!176)))))

(declare-fun b!494948 () Bool)

(declare-fun res!297572 () Bool)

(assert (=> b!494948 (=> res!297572 e!290381)))

(get-info :version)

(assert (=> b!494948 (= res!297572 (or (undefined!4632 lt!224110) (not ((_ is Intermediate!3820) lt!224110))))))

(declare-fun b!494949 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32026 (_ BitVec 32)) SeekEntryResult!3820)

(assert (=> b!494949 (= e!290382 (= (seekEntryOrOpen!0 (select (arr!15397 a!3235) j!176) a!3235 mask!3524) (Found!3820 j!176)))))

(declare-fun b!494950 () Bool)

(assert (=> b!494950 (= e!290381 (or (not (= (select (arr!15397 a!3235) (index!17461 lt!224110)) (select (arr!15397 a!3235) j!176))) (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!494950 (and (bvslt (x!46671 lt!224110) #b01111111111111111111111111111110) (or (= (select (arr!15397 a!3235) (index!17461 lt!224110)) (select (arr!15397 a!3235) j!176)) (= (select (arr!15397 a!3235) (index!17461 lt!224110)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15397 a!3235) (index!17461 lt!224110)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494951 () Bool)

(declare-fun res!297571 () Bool)

(assert (=> b!494951 (=> (not res!297571) (not e!290378))))

(assert (=> b!494951 (= res!297571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494952 () Bool)

(assert (=> b!494952 (= e!290379 e!290378)))

(declare-fun res!297570 () Bool)

(assert (=> b!494952 (=> (not res!297570) (not e!290378))))

(declare-fun lt!224106 () SeekEntryResult!3820)

(assert (=> b!494952 (= res!297570 (or (= lt!224106 (MissingZero!3820 i!1204)) (= lt!224106 (MissingVacant!3820 i!1204))))))

(assert (=> b!494952 (= lt!224106 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!297577 () Bool)

(assert (=> start!45080 (=> (not res!297577) (not e!290379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45080 (= res!297577 (validMask!0 mask!3524))))

(assert (=> start!45080 e!290379))

(assert (=> start!45080 true))

(declare-fun array_inv!11256 (array!32026) Bool)

(assert (=> start!45080 (array_inv!11256 a!3235)))

(declare-fun b!494953 () Bool)

(declare-fun res!297580 () Bool)

(assert (=> b!494953 (=> (not res!297580) (not e!290379))))

(declare-fun arrayContainsKey!0 (array!32026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494953 (= res!297580 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494954 () Bool)

(declare-fun res!297576 () Bool)

(assert (=> b!494954 (=> (not res!297576) (not e!290379))))

(assert (=> b!494954 (= res!297576 (validKeyInArray!0 k0!2280))))

(declare-fun b!494955 () Bool)

(declare-fun res!297578 () Bool)

(assert (=> b!494955 (=> (not res!297578) (not e!290379))))

(assert (=> b!494955 (= res!297578 (and (= (size!15761 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15761 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15761 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494956 () Bool)

(declare-fun res!297575 () Bool)

(assert (=> b!494956 (=> (not res!297575) (not e!290378))))

(declare-datatypes ((List!9462 0))(
  ( (Nil!9459) (Cons!9458 (h!10326 (_ BitVec 64)) (t!15682 List!9462)) )
))
(declare-fun arrayNoDuplicates!0 (array!32026 (_ BitVec 32) List!9462) Bool)

(assert (=> b!494956 (= res!297575 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9459))))

(assert (= (and start!45080 res!297577) b!494955))

(assert (= (and b!494955 res!297578) b!494947))

(assert (= (and b!494947 res!297579) b!494954))

(assert (= (and b!494954 res!297576) b!494953))

(assert (= (and b!494953 res!297580) b!494952))

(assert (= (and b!494952 res!297570) b!494951))

(assert (= (and b!494951 res!297571) b!494956))

(assert (= (and b!494956 res!297575) b!494946))

(assert (= (and b!494946 res!297573) b!494949))

(assert (= (and b!494946 (not res!297574)) b!494948))

(assert (= (and b!494948 (not res!297572)) b!494950))

(declare-fun m!476341 () Bool)

(assert (=> b!494953 m!476341))

(declare-fun m!476343 () Bool)

(assert (=> b!494949 m!476343))

(assert (=> b!494949 m!476343))

(declare-fun m!476345 () Bool)

(assert (=> b!494949 m!476345))

(declare-fun m!476347 () Bool)

(assert (=> b!494950 m!476347))

(assert (=> b!494950 m!476343))

(declare-fun m!476349 () Bool)

(assert (=> b!494952 m!476349))

(declare-fun m!476351 () Bool)

(assert (=> b!494954 m!476351))

(declare-fun m!476353 () Bool)

(assert (=> b!494956 m!476353))

(declare-fun m!476355 () Bool)

(assert (=> start!45080 m!476355))

(declare-fun m!476357 () Bool)

(assert (=> start!45080 m!476357))

(declare-fun m!476359 () Bool)

(assert (=> b!494946 m!476359))

(declare-fun m!476361 () Bool)

(assert (=> b!494946 m!476361))

(declare-fun m!476363 () Bool)

(assert (=> b!494946 m!476363))

(assert (=> b!494946 m!476343))

(declare-fun m!476365 () Bool)

(assert (=> b!494946 m!476365))

(assert (=> b!494946 m!476343))

(assert (=> b!494946 m!476343))

(declare-fun m!476367 () Bool)

(assert (=> b!494946 m!476367))

(declare-fun m!476369 () Bool)

(assert (=> b!494946 m!476369))

(assert (=> b!494946 m!476363))

(declare-fun m!476371 () Bool)

(assert (=> b!494946 m!476371))

(assert (=> b!494946 m!476363))

(declare-fun m!476373 () Bool)

(assert (=> b!494946 m!476373))

(declare-fun m!476375 () Bool)

(assert (=> b!494951 m!476375))

(assert (=> b!494947 m!476343))

(assert (=> b!494947 m!476343))

(declare-fun m!476377 () Bool)

(assert (=> b!494947 m!476377))

(check-sat (not b!494953) (not b!494947) (not b!494949) (not b!494956) (not b!494954) (not b!494951) (not b!494946) (not start!45080) (not b!494952))
(check-sat)
(get-model)

(declare-fun d!78273 () Bool)

(assert (=> d!78273 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!494954 d!78273))

(declare-fun lt!224149 () SeekEntryResult!3820)

(declare-fun e!290420 () SeekEntryResult!3820)

(declare-fun b!495035 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32026 (_ BitVec 32)) SeekEntryResult!3820)

(assert (=> b!495035 (= e!290420 (seekKeyOrZeroReturnVacant!0 (x!46671 lt!224149) (index!17461 lt!224149) (index!17461 lt!224149) (select (arr!15397 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!495036 () Bool)

(assert (=> b!495036 (= e!290420 (MissingZero!3820 (index!17461 lt!224149)))))

(declare-fun b!495037 () Bool)

(declare-fun e!290419 () SeekEntryResult!3820)

(declare-fun e!290421 () SeekEntryResult!3820)

(assert (=> b!495037 (= e!290419 e!290421)))

(declare-fun lt!224147 () (_ BitVec 64))

(assert (=> b!495037 (= lt!224147 (select (arr!15397 a!3235) (index!17461 lt!224149)))))

(declare-fun c!58969 () Bool)

(assert (=> b!495037 (= c!58969 (= lt!224147 (select (arr!15397 a!3235) j!176)))))

(declare-fun b!495038 () Bool)

(assert (=> b!495038 (= e!290419 Undefined!3820)))

(declare-fun b!495039 () Bool)

(assert (=> b!495039 (= e!290421 (Found!3820 (index!17461 lt!224149)))))

(declare-fun d!78275 () Bool)

(declare-fun lt!224148 () SeekEntryResult!3820)

(assert (=> d!78275 (and (or ((_ is Undefined!3820) lt!224148) (not ((_ is Found!3820) lt!224148)) (and (bvsge (index!17460 lt!224148) #b00000000000000000000000000000000) (bvslt (index!17460 lt!224148) (size!15761 a!3235)))) (or ((_ is Undefined!3820) lt!224148) ((_ is Found!3820) lt!224148) (not ((_ is MissingZero!3820) lt!224148)) (and (bvsge (index!17459 lt!224148) #b00000000000000000000000000000000) (bvslt (index!17459 lt!224148) (size!15761 a!3235)))) (or ((_ is Undefined!3820) lt!224148) ((_ is Found!3820) lt!224148) ((_ is MissingZero!3820) lt!224148) (not ((_ is MissingVacant!3820) lt!224148)) (and (bvsge (index!17462 lt!224148) #b00000000000000000000000000000000) (bvslt (index!17462 lt!224148) (size!15761 a!3235)))) (or ((_ is Undefined!3820) lt!224148) (ite ((_ is Found!3820) lt!224148) (= (select (arr!15397 a!3235) (index!17460 lt!224148)) (select (arr!15397 a!3235) j!176)) (ite ((_ is MissingZero!3820) lt!224148) (= (select (arr!15397 a!3235) (index!17459 lt!224148)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3820) lt!224148) (= (select (arr!15397 a!3235) (index!17462 lt!224148)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78275 (= lt!224148 e!290419)))

(declare-fun c!58968 () Bool)

(assert (=> d!78275 (= c!58968 (and ((_ is Intermediate!3820) lt!224149) (undefined!4632 lt!224149)))))

(assert (=> d!78275 (= lt!224149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15397 a!3235) j!176) mask!3524) (select (arr!15397 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78275 (validMask!0 mask!3524)))

(assert (=> d!78275 (= (seekEntryOrOpen!0 (select (arr!15397 a!3235) j!176) a!3235 mask!3524) lt!224148)))

(declare-fun b!495040 () Bool)

(declare-fun c!58970 () Bool)

(assert (=> b!495040 (= c!58970 (= lt!224147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495040 (= e!290421 e!290420)))

(assert (= (and d!78275 c!58968) b!495038))

(assert (= (and d!78275 (not c!58968)) b!495037))

(assert (= (and b!495037 c!58969) b!495039))

(assert (= (and b!495037 (not c!58969)) b!495040))

(assert (= (and b!495040 c!58970) b!495036))

(assert (= (and b!495040 (not c!58970)) b!495035))

(assert (=> b!495035 m!476343))

(declare-fun m!476455 () Bool)

(assert (=> b!495035 m!476455))

(declare-fun m!476457 () Bool)

(assert (=> b!495037 m!476457))

(declare-fun m!476459 () Bool)

(assert (=> d!78275 m!476459))

(assert (=> d!78275 m!476343))

(assert (=> d!78275 m!476365))

(assert (=> d!78275 m!476355))

(declare-fun m!476461 () Bool)

(assert (=> d!78275 m!476461))

(declare-fun m!476463 () Bool)

(assert (=> d!78275 m!476463))

(assert (=> d!78275 m!476365))

(assert (=> d!78275 m!476343))

(declare-fun m!476465 () Bool)

(assert (=> d!78275 m!476465))

(assert (=> b!494949 d!78275))

(declare-fun d!78277 () Bool)

(declare-fun res!297651 () Bool)

(declare-fun e!290426 () Bool)

(assert (=> d!78277 (=> res!297651 e!290426)))

(assert (=> d!78277 (= res!297651 (= (select (arr!15397 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78277 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!290426)))

(declare-fun b!495045 () Bool)

(declare-fun e!290427 () Bool)

(assert (=> b!495045 (= e!290426 e!290427)))

(declare-fun res!297652 () Bool)

(assert (=> b!495045 (=> (not res!297652) (not e!290427))))

(assert (=> b!495045 (= res!297652 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15761 a!3235)))))

(declare-fun b!495046 () Bool)

(assert (=> b!495046 (= e!290427 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78277 (not res!297651)) b!495045))

(assert (= (and b!495045 res!297652) b!495046))

(declare-fun m!476467 () Bool)

(assert (=> d!78277 m!476467))

(declare-fun m!476469 () Bool)

(assert (=> b!495046 m!476469))

(assert (=> b!494953 d!78277))

(declare-fun b!495047 () Bool)

(declare-fun lt!224152 () SeekEntryResult!3820)

(declare-fun e!290429 () SeekEntryResult!3820)

(assert (=> b!495047 (= e!290429 (seekKeyOrZeroReturnVacant!0 (x!46671 lt!224152) (index!17461 lt!224152) (index!17461 lt!224152) k0!2280 a!3235 mask!3524))))

(declare-fun b!495048 () Bool)

(assert (=> b!495048 (= e!290429 (MissingZero!3820 (index!17461 lt!224152)))))

(declare-fun b!495049 () Bool)

(declare-fun e!290428 () SeekEntryResult!3820)

(declare-fun e!290430 () SeekEntryResult!3820)

(assert (=> b!495049 (= e!290428 e!290430)))

(declare-fun lt!224150 () (_ BitVec 64))

(assert (=> b!495049 (= lt!224150 (select (arr!15397 a!3235) (index!17461 lt!224152)))))

(declare-fun c!58972 () Bool)

(assert (=> b!495049 (= c!58972 (= lt!224150 k0!2280))))

(declare-fun b!495050 () Bool)

(assert (=> b!495050 (= e!290428 Undefined!3820)))

(declare-fun b!495051 () Bool)

(assert (=> b!495051 (= e!290430 (Found!3820 (index!17461 lt!224152)))))

(declare-fun d!78279 () Bool)

(declare-fun lt!224151 () SeekEntryResult!3820)

(assert (=> d!78279 (and (or ((_ is Undefined!3820) lt!224151) (not ((_ is Found!3820) lt!224151)) (and (bvsge (index!17460 lt!224151) #b00000000000000000000000000000000) (bvslt (index!17460 lt!224151) (size!15761 a!3235)))) (or ((_ is Undefined!3820) lt!224151) ((_ is Found!3820) lt!224151) (not ((_ is MissingZero!3820) lt!224151)) (and (bvsge (index!17459 lt!224151) #b00000000000000000000000000000000) (bvslt (index!17459 lt!224151) (size!15761 a!3235)))) (or ((_ is Undefined!3820) lt!224151) ((_ is Found!3820) lt!224151) ((_ is MissingZero!3820) lt!224151) (not ((_ is MissingVacant!3820) lt!224151)) (and (bvsge (index!17462 lt!224151) #b00000000000000000000000000000000) (bvslt (index!17462 lt!224151) (size!15761 a!3235)))) (or ((_ is Undefined!3820) lt!224151) (ite ((_ is Found!3820) lt!224151) (= (select (arr!15397 a!3235) (index!17460 lt!224151)) k0!2280) (ite ((_ is MissingZero!3820) lt!224151) (= (select (arr!15397 a!3235) (index!17459 lt!224151)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3820) lt!224151) (= (select (arr!15397 a!3235) (index!17462 lt!224151)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78279 (= lt!224151 e!290428)))

(declare-fun c!58971 () Bool)

(assert (=> d!78279 (= c!58971 (and ((_ is Intermediate!3820) lt!224152) (undefined!4632 lt!224152)))))

(assert (=> d!78279 (= lt!224152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78279 (validMask!0 mask!3524)))

(assert (=> d!78279 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!224151)))

(declare-fun b!495052 () Bool)

(declare-fun c!58973 () Bool)

(assert (=> b!495052 (= c!58973 (= lt!224150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495052 (= e!290430 e!290429)))

(assert (= (and d!78279 c!58971) b!495050))

(assert (= (and d!78279 (not c!58971)) b!495049))

(assert (= (and b!495049 c!58972) b!495051))

(assert (= (and b!495049 (not c!58972)) b!495052))

(assert (= (and b!495052 c!58973) b!495048))

(assert (= (and b!495052 (not c!58973)) b!495047))

(declare-fun m!476471 () Bool)

(assert (=> b!495047 m!476471))

(declare-fun m!476473 () Bool)

(assert (=> b!495049 m!476473))

(declare-fun m!476475 () Bool)

(assert (=> d!78279 m!476475))

(declare-fun m!476477 () Bool)

(assert (=> d!78279 m!476477))

(assert (=> d!78279 m!476355))

(declare-fun m!476479 () Bool)

(assert (=> d!78279 m!476479))

(declare-fun m!476481 () Bool)

(assert (=> d!78279 m!476481))

(assert (=> d!78279 m!476477))

(declare-fun m!476483 () Bool)

(assert (=> d!78279 m!476483))

(assert (=> b!494952 d!78279))

(declare-fun d!78281 () Bool)

(assert (=> d!78281 (= (validKeyInArray!0 (select (arr!15397 a!3235) j!176)) (and (not (= (select (arr!15397 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15397 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!494947 d!78281))

(declare-fun b!495085 () Bool)

(declare-fun lt!224170 () SeekEntryResult!3820)

(assert (=> b!495085 (and (bvsge (index!17461 lt!224170) #b00000000000000000000000000000000) (bvslt (index!17461 lt!224170) (size!15761 (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235)))))))

(declare-fun res!297671 () Bool)

(assert (=> b!495085 (= res!297671 (= (select (arr!15397 (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235))) (index!17461 lt!224170)) (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!290456 () Bool)

(assert (=> b!495085 (=> res!297671 e!290456)))

(declare-fun e!290454 () Bool)

(assert (=> b!495085 (= e!290454 e!290456)))

(declare-fun b!495086 () Bool)

(declare-fun e!290457 () Bool)

(assert (=> b!495086 (= e!290457 (bvsge (x!46671 lt!224170) #b01111111111111111111111111111110))))

(declare-fun d!78283 () Bool)

(assert (=> d!78283 e!290457))

(declare-fun c!58983 () Bool)

(assert (=> d!78283 (= c!58983 (and ((_ is Intermediate!3820) lt!224170) (undefined!4632 lt!224170)))))

(declare-fun e!290453 () SeekEntryResult!3820)

(assert (=> d!78283 (= lt!224170 e!290453)))

(declare-fun c!58984 () Bool)

(assert (=> d!78283 (= c!58984 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!224169 () (_ BitVec 64))

(assert (=> d!78283 (= lt!224169 (select (arr!15397 (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235))) lt!224107))))

(assert (=> d!78283 (validMask!0 mask!3524)))

(assert (=> d!78283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224107 (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235)) mask!3524) lt!224170)))

(declare-fun b!495087 () Bool)

(declare-fun e!290455 () SeekEntryResult!3820)

(assert (=> b!495087 (= e!290455 (Intermediate!3820 false lt!224107 #b00000000000000000000000000000000))))

(declare-fun b!495088 () Bool)

(assert (=> b!495088 (= e!290453 e!290455)))

(declare-fun c!58982 () Bool)

(assert (=> b!495088 (= c!58982 (or (= lt!224169 (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!224169 lt!224169) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495089 () Bool)

(assert (=> b!495089 (and (bvsge (index!17461 lt!224170) #b00000000000000000000000000000000) (bvslt (index!17461 lt!224170) (size!15761 (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235)))))))

(declare-fun res!297670 () Bool)

(assert (=> b!495089 (= res!297670 (= (select (arr!15397 (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235))) (index!17461 lt!224170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495089 (=> res!297670 e!290456)))

(declare-fun b!495090 () Bool)

(assert (=> b!495090 (= e!290457 e!290454)))

(declare-fun res!297672 () Bool)

(assert (=> b!495090 (= res!297672 (and ((_ is Intermediate!3820) lt!224170) (not (undefined!4632 lt!224170)) (bvslt (x!46671 lt!224170) #b01111111111111111111111111111110) (bvsge (x!46671 lt!224170) #b00000000000000000000000000000000) (bvsge (x!46671 lt!224170) #b00000000000000000000000000000000)))))

(assert (=> b!495090 (=> (not res!297672) (not e!290454))))

(declare-fun b!495091 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495091 (= e!290455 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224107 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235)) mask!3524))))

(declare-fun b!495092 () Bool)

(assert (=> b!495092 (= e!290453 (Intermediate!3820 true lt!224107 #b00000000000000000000000000000000))))

(declare-fun b!495093 () Bool)

(assert (=> b!495093 (and (bvsge (index!17461 lt!224170) #b00000000000000000000000000000000) (bvslt (index!17461 lt!224170) (size!15761 (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235)))))))

(assert (=> b!495093 (= e!290456 (= (select (arr!15397 (array!32027 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235))) (index!17461 lt!224170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!78283 c!58984) b!495092))

(assert (= (and d!78283 (not c!58984)) b!495088))

(assert (= (and b!495088 c!58982) b!495087))

(assert (= (and b!495088 (not c!58982)) b!495091))

(assert (= (and d!78283 c!58983) b!495086))

(assert (= (and d!78283 (not c!58983)) b!495090))

(assert (= (and b!495090 res!297672) b!495085))

(assert (= (and b!495085 (not res!297671)) b!495089))

(assert (= (and b!495089 (not res!297670)) b!495093))

(declare-fun m!476489 () Bool)

(assert (=> b!495089 m!476489))

(declare-fun m!476491 () Bool)

(assert (=> b!495091 m!476491))

(assert (=> b!495091 m!476491))

(assert (=> b!495091 m!476363))

(declare-fun m!476493 () Bool)

(assert (=> b!495091 m!476493))

(assert (=> b!495085 m!476489))

(assert (=> b!495093 m!476489))

(declare-fun m!476495 () Bool)

(assert (=> d!78283 m!476495))

(assert (=> d!78283 m!476355))

(assert (=> b!494946 d!78283))

(declare-fun d!78297 () Bool)

(declare-fun lt!224179 () (_ BitVec 32))

(declare-fun lt!224178 () (_ BitVec 32))

(assert (=> d!78297 (= lt!224179 (bvmul (bvxor lt!224178 (bvlshr lt!224178 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78297 (= lt!224178 ((_ extract 31 0) (bvand (bvxor (select (arr!15397 a!3235) j!176) (bvlshr (select (arr!15397 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78297 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297675 (let ((h!10330 ((_ extract 31 0) (bvand (bvxor (select (arr!15397 a!3235) j!176) (bvlshr (select (arr!15397 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46676 (bvmul (bvxor h!10330 (bvlshr h!10330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46676 (bvlshr x!46676 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297675 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297675 #b00000000000000000000000000000000))))))

(assert (=> d!78297 (= (toIndex!0 (select (arr!15397 a!3235) j!176) mask!3524) (bvand (bvxor lt!224179 (bvlshr lt!224179 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!494946 d!78297))

(declare-fun b!495130 () Bool)

(declare-fun e!290481 () Bool)

(declare-fun e!290480 () Bool)

(assert (=> b!495130 (= e!290481 e!290480)))

(declare-fun c!59000 () Bool)

(assert (=> b!495130 (= c!59000 (validKeyInArray!0 (select (arr!15397 a!3235) j!176)))))

(declare-fun bm!31398 () Bool)

(declare-fun call!31401 () Bool)

(assert (=> bm!31398 (= call!31401 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78301 () Bool)

(declare-fun res!297682 () Bool)

(assert (=> d!78301 (=> res!297682 e!290481)))

(assert (=> d!78301 (= res!297682 (bvsge j!176 (size!15761 a!3235)))))

(assert (=> d!78301 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!290481)))

(declare-fun b!495131 () Bool)

(assert (=> b!495131 (= e!290480 call!31401)))

(declare-fun b!495132 () Bool)

(declare-fun e!290479 () Bool)

(assert (=> b!495132 (= e!290479 call!31401)))

(declare-fun b!495133 () Bool)

(assert (=> b!495133 (= e!290480 e!290479)))

(declare-fun lt!224200 () (_ BitVec 64))

(assert (=> b!495133 (= lt!224200 (select (arr!15397 a!3235) j!176))))

(declare-fun lt!224198 () Unit!14647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32026 (_ BitVec 64) (_ BitVec 32)) Unit!14647)

(assert (=> b!495133 (= lt!224198 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!224200 j!176))))

(assert (=> b!495133 (arrayContainsKey!0 a!3235 lt!224200 #b00000000000000000000000000000000)))

(declare-fun lt!224199 () Unit!14647)

(assert (=> b!495133 (= lt!224199 lt!224198)))

(declare-fun res!297681 () Bool)

(assert (=> b!495133 (= res!297681 (= (seekEntryOrOpen!0 (select (arr!15397 a!3235) j!176) a!3235 mask!3524) (Found!3820 j!176)))))

(assert (=> b!495133 (=> (not res!297681) (not e!290479))))

(assert (= (and d!78301 (not res!297682)) b!495130))

(assert (= (and b!495130 c!59000) b!495133))

(assert (= (and b!495130 (not c!59000)) b!495131))

(assert (= (and b!495133 res!297681) b!495132))

(assert (= (or b!495132 b!495131) bm!31398))

(assert (=> b!495130 m!476343))

(assert (=> b!495130 m!476343))

(assert (=> b!495130 m!476377))

(declare-fun m!476529 () Bool)

(assert (=> bm!31398 m!476529))

(assert (=> b!495133 m!476343))

(declare-fun m!476531 () Bool)

(assert (=> b!495133 m!476531))

(declare-fun m!476533 () Bool)

(assert (=> b!495133 m!476533))

(assert (=> b!495133 m!476343))

(assert (=> b!495133 m!476345))

(assert (=> b!494946 d!78301))

(declare-fun d!78307 () Bool)

(assert (=> d!78307 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!224213 () Unit!14647)

(declare-fun choose!38 (array!32026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14647)

(assert (=> d!78307 (= lt!224213 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78307 (validMask!0 mask!3524)))

(assert (=> d!78307 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!224213)))

(declare-fun bs!15797 () Bool)

(assert (= bs!15797 d!78307))

(assert (=> bs!15797 m!476369))

(declare-fun m!476535 () Bool)

(assert (=> bs!15797 m!476535))

(assert (=> bs!15797 m!476355))

(assert (=> b!494946 d!78307))

(declare-fun d!78311 () Bool)

(declare-fun lt!224215 () (_ BitVec 32))

(declare-fun lt!224214 () (_ BitVec 32))

(assert (=> d!78311 (= lt!224215 (bvmul (bvxor lt!224214 (bvlshr lt!224214 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78311 (= lt!224214 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78311 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297675 (let ((h!10330 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46676 (bvmul (bvxor h!10330 (bvlshr h!10330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46676 (bvlshr x!46676 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297675 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297675 #b00000000000000000000000000000000))))))

(assert (=> d!78311 (= (toIndex!0 (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!224215 (bvlshr lt!224215 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!494946 d!78311))

(declare-fun b!495152 () Bool)

(declare-fun lt!224217 () SeekEntryResult!3820)

(assert (=> b!495152 (and (bvsge (index!17461 lt!224217) #b00000000000000000000000000000000) (bvslt (index!17461 lt!224217) (size!15761 a!3235)))))

(declare-fun res!297690 () Bool)

(assert (=> b!495152 (= res!297690 (= (select (arr!15397 a!3235) (index!17461 lt!224217)) (select (arr!15397 a!3235) j!176)))))

(declare-fun e!290495 () Bool)

(assert (=> b!495152 (=> res!297690 e!290495)))

(declare-fun e!290493 () Bool)

(assert (=> b!495152 (= e!290493 e!290495)))

(declare-fun b!495153 () Bool)

(declare-fun e!290496 () Bool)

(assert (=> b!495153 (= e!290496 (bvsge (x!46671 lt!224217) #b01111111111111111111111111111110))))

(declare-fun d!78313 () Bool)

(assert (=> d!78313 e!290496))

(declare-fun c!59008 () Bool)

(assert (=> d!78313 (= c!59008 (and ((_ is Intermediate!3820) lt!224217) (undefined!4632 lt!224217)))))

(declare-fun e!290492 () SeekEntryResult!3820)

(assert (=> d!78313 (= lt!224217 e!290492)))

(declare-fun c!59009 () Bool)

(assert (=> d!78313 (= c!59009 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!224216 () (_ BitVec 64))

(assert (=> d!78313 (= lt!224216 (select (arr!15397 a!3235) lt!224109))))

(assert (=> d!78313 (validMask!0 mask!3524)))

(assert (=> d!78313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224109 (select (arr!15397 a!3235) j!176) a!3235 mask!3524) lt!224217)))

(declare-fun b!495154 () Bool)

(declare-fun e!290494 () SeekEntryResult!3820)

(assert (=> b!495154 (= e!290494 (Intermediate!3820 false lt!224109 #b00000000000000000000000000000000))))

(declare-fun b!495155 () Bool)

(assert (=> b!495155 (= e!290492 e!290494)))

(declare-fun c!59007 () Bool)

(assert (=> b!495155 (= c!59007 (or (= lt!224216 (select (arr!15397 a!3235) j!176)) (= (bvadd lt!224216 lt!224216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495156 () Bool)

(assert (=> b!495156 (and (bvsge (index!17461 lt!224217) #b00000000000000000000000000000000) (bvslt (index!17461 lt!224217) (size!15761 a!3235)))))

(declare-fun res!297689 () Bool)

(assert (=> b!495156 (= res!297689 (= (select (arr!15397 a!3235) (index!17461 lt!224217)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495156 (=> res!297689 e!290495)))

(declare-fun b!495157 () Bool)

(assert (=> b!495157 (= e!290496 e!290493)))

(declare-fun res!297691 () Bool)

(assert (=> b!495157 (= res!297691 (and ((_ is Intermediate!3820) lt!224217) (not (undefined!4632 lt!224217)) (bvslt (x!46671 lt!224217) #b01111111111111111111111111111110) (bvsge (x!46671 lt!224217) #b00000000000000000000000000000000) (bvsge (x!46671 lt!224217) #b00000000000000000000000000000000)))))

(assert (=> b!495157 (=> (not res!297691) (not e!290493))))

(declare-fun b!495158 () Bool)

(assert (=> b!495158 (= e!290494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224109 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15397 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!495159 () Bool)

(assert (=> b!495159 (= e!290492 (Intermediate!3820 true lt!224109 #b00000000000000000000000000000000))))

(declare-fun b!495160 () Bool)

(assert (=> b!495160 (and (bvsge (index!17461 lt!224217) #b00000000000000000000000000000000) (bvslt (index!17461 lt!224217) (size!15761 a!3235)))))

(assert (=> b!495160 (= e!290495 (= (select (arr!15397 a!3235) (index!17461 lt!224217)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!78313 c!59009) b!495159))

(assert (= (and d!78313 (not c!59009)) b!495155))

(assert (= (and b!495155 c!59007) b!495154))

(assert (= (and b!495155 (not c!59007)) b!495158))

(assert (= (and d!78313 c!59008) b!495153))

(assert (= (and d!78313 (not c!59008)) b!495157))

(assert (= (and b!495157 res!297691) b!495152))

(assert (= (and b!495152 (not res!297690)) b!495156))

(assert (= (and b!495156 (not res!297689)) b!495160))

(declare-fun m!476537 () Bool)

(assert (=> b!495156 m!476537))

(declare-fun m!476539 () Bool)

(assert (=> b!495158 m!476539))

(assert (=> b!495158 m!476539))

(assert (=> b!495158 m!476343))

(declare-fun m!476541 () Bool)

(assert (=> b!495158 m!476541))

(assert (=> b!495152 m!476537))

(assert (=> b!495160 m!476537))

(declare-fun m!476543 () Bool)

(assert (=> d!78313 m!476543))

(assert (=> d!78313 m!476355))

(assert (=> b!494946 d!78313))

(declare-fun b!495201 () Bool)

(declare-fun e!290524 () Bool)

(declare-fun e!290527 () Bool)

(assert (=> b!495201 (= e!290524 e!290527)))

(declare-fun c!59021 () Bool)

(assert (=> b!495201 (= c!59021 (validKeyInArray!0 (select (arr!15397 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!495202 () Bool)

(declare-fun call!31407 () Bool)

(assert (=> b!495202 (= e!290527 call!31407)))

(declare-fun d!78315 () Bool)

(declare-fun res!297710 () Bool)

(declare-fun e!290525 () Bool)

(assert (=> d!78315 (=> res!297710 e!290525)))

(assert (=> d!78315 (= res!297710 (bvsge #b00000000000000000000000000000000 (size!15761 a!3235)))))

(assert (=> d!78315 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9459) e!290525)))

(declare-fun bm!31404 () Bool)

(assert (=> bm!31404 (= call!31407 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59021 (Cons!9458 (select (arr!15397 a!3235) #b00000000000000000000000000000000) Nil!9459) Nil!9459)))))

(declare-fun b!495203 () Bool)

(assert (=> b!495203 (= e!290525 e!290524)))

(declare-fun res!297711 () Bool)

(assert (=> b!495203 (=> (not res!297711) (not e!290524))))

(declare-fun e!290526 () Bool)

(assert (=> b!495203 (= res!297711 (not e!290526))))

(declare-fun res!297712 () Bool)

(assert (=> b!495203 (=> (not res!297712) (not e!290526))))

(assert (=> b!495203 (= res!297712 (validKeyInArray!0 (select (arr!15397 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!495204 () Bool)

(declare-fun contains!2692 (List!9462 (_ BitVec 64)) Bool)

(assert (=> b!495204 (= e!290526 (contains!2692 Nil!9459 (select (arr!15397 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!495205 () Bool)

(assert (=> b!495205 (= e!290527 call!31407)))

(assert (= (and d!78315 (not res!297710)) b!495203))

(assert (= (and b!495203 res!297712) b!495204))

(assert (= (and b!495203 res!297711) b!495201))

(assert (= (and b!495201 c!59021) b!495202))

(assert (= (and b!495201 (not c!59021)) b!495205))

(assert (= (or b!495202 b!495205) bm!31404))

(assert (=> b!495201 m!476467))

(assert (=> b!495201 m!476467))

(declare-fun m!476567 () Bool)

(assert (=> b!495201 m!476567))

(assert (=> bm!31404 m!476467))

(declare-fun m!476569 () Bool)

(assert (=> bm!31404 m!476569))

(assert (=> b!495203 m!476467))

(assert (=> b!495203 m!476467))

(assert (=> b!495203 m!476567))

(assert (=> b!495204 m!476467))

(assert (=> b!495204 m!476467))

(declare-fun m!476571 () Bool)

(assert (=> b!495204 m!476571))

(assert (=> b!494956 d!78315))

(declare-fun d!78323 () Bool)

(assert (=> d!78323 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45080 d!78323))

(declare-fun d!78331 () Bool)

(assert (=> d!78331 (= (array_inv!11256 a!3235) (bvsge (size!15761 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45080 d!78331))

(declare-fun b!495210 () Bool)

(declare-fun e!290533 () Bool)

(declare-fun e!290532 () Bool)

(assert (=> b!495210 (= e!290533 e!290532)))

(declare-fun c!59023 () Bool)

(assert (=> b!495210 (= c!59023 (validKeyInArray!0 (select (arr!15397 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31406 () Bool)

(declare-fun call!31409 () Bool)

(assert (=> bm!31406 (= call!31409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78333 () Bool)

(declare-fun res!297716 () Bool)

(assert (=> d!78333 (=> res!297716 e!290533)))

(assert (=> d!78333 (= res!297716 (bvsge #b00000000000000000000000000000000 (size!15761 a!3235)))))

(assert (=> d!78333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!290533)))

(declare-fun b!495211 () Bool)

(assert (=> b!495211 (= e!290532 call!31409)))

(declare-fun b!495212 () Bool)

(declare-fun e!290531 () Bool)

(assert (=> b!495212 (= e!290531 call!31409)))

(declare-fun b!495213 () Bool)

(assert (=> b!495213 (= e!290532 e!290531)))

(declare-fun lt!224241 () (_ BitVec 64))

(assert (=> b!495213 (= lt!224241 (select (arr!15397 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!224239 () Unit!14647)

(assert (=> b!495213 (= lt!224239 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!224241 #b00000000000000000000000000000000))))

(assert (=> b!495213 (arrayContainsKey!0 a!3235 lt!224241 #b00000000000000000000000000000000)))

(declare-fun lt!224240 () Unit!14647)

(assert (=> b!495213 (= lt!224240 lt!224239)))

(declare-fun res!297715 () Bool)

(assert (=> b!495213 (= res!297715 (= (seekEntryOrOpen!0 (select (arr!15397 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3820 #b00000000000000000000000000000000)))))

(assert (=> b!495213 (=> (not res!297715) (not e!290531))))

(assert (= (and d!78333 (not res!297716)) b!495210))

(assert (= (and b!495210 c!59023) b!495213))

(assert (= (and b!495210 (not c!59023)) b!495211))

(assert (= (and b!495213 res!297715) b!495212))

(assert (= (or b!495212 b!495211) bm!31406))

(assert (=> b!495210 m!476467))

(assert (=> b!495210 m!476467))

(assert (=> b!495210 m!476567))

(declare-fun m!476585 () Bool)

(assert (=> bm!31406 m!476585))

(assert (=> b!495213 m!476467))

(declare-fun m!476587 () Bool)

(assert (=> b!495213 m!476587))

(declare-fun m!476589 () Bool)

(assert (=> b!495213 m!476589))

(assert (=> b!495213 m!476467))

(declare-fun m!476591 () Bool)

(assert (=> b!495213 m!476591))

(assert (=> b!494951 d!78333))

(check-sat (not b!495210) (not d!78283) (not d!78275) (not b!495158) (not b!495201) (not b!495091) (not b!495133) (not bm!31406) (not b!495130) (not b!495035) (not b!495213) (not bm!31398) (not b!495204) (not b!495047) (not bm!31404) (not d!78279) (not b!495203) (not d!78307) (not d!78313) (not b!495046))
(check-sat)
