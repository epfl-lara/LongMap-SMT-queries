; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81638 () Bool)

(assert start!81638)

(declare-fun b!953270 () Bool)

(declare-fun res!638455 () Bool)

(declare-fun e!536935 () Bool)

(assert (=> b!953270 (=> (not res!638455) (not e!536935))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953270 (= res!638455 (validKeyInArray!0 k0!2725))))

(declare-fun res!638452 () Bool)

(assert (=> start!81638 (=> (not res!638452) (not e!536935))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81638 (= res!638452 (validMask!0 mask!4034))))

(assert (=> start!81638 e!536935))

(assert (=> start!81638 true))

(declare-datatypes ((array!57699 0))(
  ( (array!57700 (arr!27737 (Array (_ BitVec 32) (_ BitVec 64))) (size!28216 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57699)

(declare-fun array_inv!21527 (array!57699) Bool)

(assert (=> start!81638 (array_inv!21527 a!3460)))

(declare-fun b!953271 () Bool)

(assert (=> b!953271 (= e!536935 (bvslt mask!4034 #b00000000000000000000000000000000))))

(declare-fun b!953268 () Bool)

(declare-fun res!638453 () Bool)

(assert (=> b!953268 (=> (not res!638453) (not e!536935))))

(assert (=> b!953268 (= res!638453 (= (size!28216 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953269 () Bool)

(declare-fun res!638454 () Bool)

(assert (=> b!953269 (=> (not res!638454) (not e!536935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57699 (_ BitVec 32)) Bool)

(assert (=> b!953269 (= res!638454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81638 res!638452) b!953268))

(assert (= (and b!953268 res!638453) b!953269))

(assert (= (and b!953269 res!638454) b!953270))

(assert (= (and b!953270 res!638455) b!953271))

(declare-fun m!885345 () Bool)

(assert (=> b!953270 m!885345))

(declare-fun m!885347 () Bool)

(assert (=> start!81638 m!885347))

(declare-fun m!885349 () Bool)

(assert (=> start!81638 m!885349))

(declare-fun m!885351 () Bool)

(assert (=> b!953269 m!885351))

(check-sat (not b!953270) (not start!81638) (not b!953269))
(check-sat)
(get-model)

(declare-fun d!115641 () Bool)

(assert (=> d!115641 (= (validKeyInArray!0 k0!2725) (and (not (= k0!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953270 d!115641))

(declare-fun d!115643 () Bool)

(assert (=> d!115643 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81638 d!115643))

(declare-fun d!115649 () Bool)

(assert (=> d!115649 (= (array_inv!21527 a!3460) (bvsge (size!28216 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81638 d!115649))

(declare-fun bm!41652 () Bool)

(declare-fun call!41655 () Bool)

(assert (=> bm!41652 (= call!41655 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(declare-fun b!953308 () Bool)

(declare-fun e!536961 () Bool)

(declare-fun e!536963 () Bool)

(assert (=> b!953308 (= e!536961 e!536963)))

(declare-fun c!99789 () Bool)

(assert (=> b!953308 (= c!99789 (validKeyInArray!0 (select (arr!27737 a!3460) #b00000000000000000000000000000000)))))

(declare-fun b!953309 () Bool)

(assert (=> b!953309 (= e!536963 call!41655)))

(declare-fun d!115651 () Bool)

(declare-fun res!638481 () Bool)

(assert (=> d!115651 (=> res!638481 e!536961)))

(assert (=> d!115651 (= res!638481 (bvsge #b00000000000000000000000000000000 (size!28216 a!3460)))))

(assert (=> d!115651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!536961)))

(declare-fun b!953310 () Bool)

(declare-fun e!536962 () Bool)

(assert (=> b!953310 (= e!536962 call!41655)))

(declare-fun b!953311 () Bool)

(assert (=> b!953311 (= e!536963 e!536962)))

(declare-fun lt!429670 () (_ BitVec 64))

(assert (=> b!953311 (= lt!429670 (select (arr!27737 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32073 0))(
  ( (Unit!32074) )
))
(declare-fun lt!429669 () Unit!32073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57699 (_ BitVec 64) (_ BitVec 32)) Unit!32073)

(assert (=> b!953311 (= lt!429669 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429670 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953311 (arrayContainsKey!0 a!3460 lt!429670 #b00000000000000000000000000000000)))

(declare-fun lt!429668 () Unit!32073)

(assert (=> b!953311 (= lt!429668 lt!429669)))

(declare-fun res!638480 () Bool)

(declare-datatypes ((SeekEntryResult!9169 0))(
  ( (MissingZero!9169 (index!39047 (_ BitVec 32))) (Found!9169 (index!39048 (_ BitVec 32))) (Intermediate!9169 (undefined!9981 Bool) (index!39049 (_ BitVec 32)) (x!82025 (_ BitVec 32))) (Undefined!9169) (MissingVacant!9169 (index!39050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57699 (_ BitVec 32)) SeekEntryResult!9169)

(assert (=> b!953311 (= res!638480 (= (seekEntryOrOpen!0 (select (arr!27737 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9169 #b00000000000000000000000000000000)))))

(assert (=> b!953311 (=> (not res!638480) (not e!536962))))

(assert (= (and d!115651 (not res!638481)) b!953308))

(assert (= (and b!953308 c!99789) b!953311))

(assert (= (and b!953308 (not c!99789)) b!953309))

(assert (= (and b!953311 res!638480) b!953310))

(assert (= (or b!953310 b!953309) bm!41652))

(declare-fun m!885361 () Bool)

(assert (=> bm!41652 m!885361))

(declare-fun m!885363 () Bool)

(assert (=> b!953308 m!885363))

(assert (=> b!953308 m!885363))

(declare-fun m!885365 () Bool)

(assert (=> b!953308 m!885365))

(assert (=> b!953311 m!885363))

(declare-fun m!885367 () Bool)

(assert (=> b!953311 m!885367))

(declare-fun m!885369 () Bool)

(assert (=> b!953311 m!885369))

(assert (=> b!953311 m!885363))

(declare-fun m!885371 () Bool)

(assert (=> b!953311 m!885371))

(assert (=> b!953269 d!115651))

(check-sat (not b!953311) (not bm!41652) (not b!953308))
(check-sat)
