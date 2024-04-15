; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134544 () Bool)

(assert start!134544)

(declare-fun b!1570868 () Bool)

(declare-fun e!875836 () Bool)

(declare-fun mask!4043 () (_ BitVec 32))

(assert (=> b!1570868 (= e!875836 (bvslt mask!4043 #b00000000000000000000000000000000))))

(declare-fun res!1073304 () Bool)

(assert (=> start!134544 (=> (not res!1073304) (not e!875836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134544 (= res!1073304 (validMask!0 mask!4043))))

(assert (=> start!134544 e!875836))

(assert (=> start!134544 true))

(declare-datatypes ((array!104745 0))(
  ( (array!104746 (arr!50552 (Array (_ BitVec 32) (_ BitVec 64))) (size!51104 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104745)

(declare-fun array_inv!39488 (array!104745) Bool)

(assert (=> start!134544 (array_inv!39488 a!3462)))

(declare-fun b!1570865 () Bool)

(declare-fun res!1073306 () Bool)

(assert (=> b!1570865 (=> (not res!1073306) (not e!875836))))

(assert (=> b!1570865 (= res!1073306 (= (size!51104 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1570867 () Bool)

(declare-fun res!1073305 () Bool)

(assert (=> b!1570867 (=> (not res!1073305) (not e!875836))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570867 (= res!1073305 (validKeyInArray!0 k0!2731))))

(declare-fun b!1570866 () Bool)

(declare-fun res!1073307 () Bool)

(assert (=> b!1570866 (=> (not res!1073307) (not e!875836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104745 (_ BitVec 32)) Bool)

(assert (=> b!1570866 (= res!1073307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134544 res!1073304) b!1570865))

(assert (= (and b!1570865 res!1073306) b!1570866))

(assert (= (and b!1570866 res!1073307) b!1570867))

(assert (= (and b!1570867 res!1073305) b!1570868))

(declare-fun m!1444281 () Bool)

(assert (=> start!134544 m!1444281))

(declare-fun m!1444283 () Bool)

(assert (=> start!134544 m!1444283))

(declare-fun m!1444285 () Bool)

(assert (=> b!1570867 m!1444285))

(declare-fun m!1444287 () Bool)

(assert (=> b!1570866 m!1444287))

(check-sat (not start!134544) (not b!1570866) (not b!1570867))
(check-sat)
(get-model)

(declare-fun d!164237 () Bool)

(assert (=> d!164237 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134544 d!164237))

(declare-fun d!164243 () Bool)

(assert (=> d!164243 (= (array_inv!39488 a!3462) (bvsge (size!51104 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134544 d!164243))

(declare-fun b!1570919 () Bool)

(declare-fun e!875871 () Bool)

(declare-fun e!875869 () Bool)

(assert (=> b!1570919 (= e!875871 e!875869)))

(declare-fun c!145026 () Bool)

(assert (=> b!1570919 (= c!145026 (validKeyInArray!0 (select (arr!50552 a!3462) #b00000000000000000000000000000000)))))

(declare-fun bm!72321 () Bool)

(declare-fun call!72324 () Bool)

(assert (=> bm!72321 (= call!72324 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun d!164245 () Bool)

(declare-fun res!1073344 () Bool)

(assert (=> d!164245 (=> res!1073344 e!875871)))

(assert (=> d!164245 (= res!1073344 (bvsge #b00000000000000000000000000000000 (size!51104 a!3462)))))

(assert (=> d!164245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!875871)))

(declare-fun b!1570920 () Bool)

(declare-fun e!875870 () Bool)

(assert (=> b!1570920 (= e!875869 e!875870)))

(declare-fun lt!673225 () (_ BitVec 64))

(assert (=> b!1570920 (= lt!673225 (select (arr!50552 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51913 0))(
  ( (Unit!51914) )
))
(declare-fun lt!673226 () Unit!51913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104745 (_ BitVec 64) (_ BitVec 32)) Unit!51913)

(assert (=> b!1570920 (= lt!673226 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673225 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1570920 (arrayContainsKey!0 a!3462 lt!673225 #b00000000000000000000000000000000)))

(declare-fun lt!673227 () Unit!51913)

(assert (=> b!1570920 (= lt!673227 lt!673226)))

(declare-fun res!1073345 () Bool)

(declare-datatypes ((SeekEntryResult!13531 0))(
  ( (MissingZero!13531 (index!56522 (_ BitVec 32))) (Found!13531 (index!56523 (_ BitVec 32))) (Intermediate!13531 (undefined!14343 Bool) (index!56524 (_ BitVec 32)) (x!141204 (_ BitVec 32))) (Undefined!13531) (MissingVacant!13531 (index!56525 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104745 (_ BitVec 32)) SeekEntryResult!13531)

(assert (=> b!1570920 (= res!1073345 (= (seekEntryOrOpen!0 (select (arr!50552 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13531 #b00000000000000000000000000000000)))))

(assert (=> b!1570920 (=> (not res!1073345) (not e!875870))))

(declare-fun b!1570921 () Bool)

(assert (=> b!1570921 (= e!875869 call!72324)))

(declare-fun b!1570922 () Bool)

(assert (=> b!1570922 (= e!875870 call!72324)))

(assert (= (and d!164245 (not res!1073344)) b!1570919))

(assert (= (and b!1570919 c!145026) b!1570920))

(assert (= (and b!1570919 (not c!145026)) b!1570921))

(assert (= (and b!1570920 res!1073345) b!1570922))

(assert (= (or b!1570922 b!1570921) bm!72321))

(declare-fun m!1444317 () Bool)

(assert (=> b!1570919 m!1444317))

(assert (=> b!1570919 m!1444317))

(declare-fun m!1444319 () Bool)

(assert (=> b!1570919 m!1444319))

(declare-fun m!1444321 () Bool)

(assert (=> bm!72321 m!1444321))

(assert (=> b!1570920 m!1444317))

(declare-fun m!1444323 () Bool)

(assert (=> b!1570920 m!1444323))

(declare-fun m!1444325 () Bool)

(assert (=> b!1570920 m!1444325))

(assert (=> b!1570920 m!1444317))

(declare-fun m!1444327 () Bool)

(assert (=> b!1570920 m!1444327))

(assert (=> b!1570866 d!164245))

(declare-fun d!164255 () Bool)

(assert (=> d!164255 (= (validKeyInArray!0 k0!2731) (and (not (= k0!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1570867 d!164255))

(check-sat (not bm!72321) (not b!1570920) (not b!1570919))
(check-sat)
