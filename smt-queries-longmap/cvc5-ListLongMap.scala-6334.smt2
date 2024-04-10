; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81636 () Bool)

(assert start!81636)

(declare-fun b!953257 () Bool)

(declare-fun res!638443 () Bool)

(declare-fun e!536930 () Bool)

(assert (=> b!953257 (=> (not res!638443) (not e!536930))))

(declare-datatypes ((array!57697 0))(
  ( (array!57698 (arr!27736 (Array (_ BitVec 32) (_ BitVec 64))) (size!28215 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57697)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57697 (_ BitVec 32)) Bool)

(assert (=> b!953257 (= res!638443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953256 () Bool)

(declare-fun res!638440 () Bool)

(assert (=> b!953256 (=> (not res!638440) (not e!536930))))

(assert (=> b!953256 (= res!638440 (= (size!28215 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953259 () Bool)

(assert (=> b!953259 (= e!536930 (bvslt mask!4034 #b00000000000000000000000000000000))))

(declare-fun res!638441 () Bool)

(assert (=> start!81636 (=> (not res!638441) (not e!536930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81636 (= res!638441 (validMask!0 mask!4034))))

(assert (=> start!81636 e!536930))

(assert (=> start!81636 true))

(declare-fun array_inv!21526 (array!57697) Bool)

(assert (=> start!81636 (array_inv!21526 a!3460)))

(declare-fun b!953258 () Bool)

(declare-fun res!638442 () Bool)

(assert (=> b!953258 (=> (not res!638442) (not e!536930))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953258 (= res!638442 (validKeyInArray!0 k!2725))))

(assert (= (and start!81636 res!638441) b!953256))

(assert (= (and b!953256 res!638440) b!953257))

(assert (= (and b!953257 res!638443) b!953258))

(assert (= (and b!953258 res!638442) b!953259))

(declare-fun m!885337 () Bool)

(assert (=> b!953257 m!885337))

(declare-fun m!885339 () Bool)

(assert (=> start!81636 m!885339))

(declare-fun m!885341 () Bool)

(assert (=> start!81636 m!885341))

(declare-fun m!885343 () Bool)

(assert (=> b!953258 m!885343))

(push 1)

(assert (not start!81636))

(assert (not b!953257))

(assert (not b!953258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!115645 () Bool)

(assert (=> d!115645 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81636 d!115645))

(declare-fun d!115653 () Bool)

(assert (=> d!115653 (= (array_inv!21526 a!3460) (bvsge (size!28215 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81636 d!115653))

(declare-fun bm!41653 () Bool)

(declare-fun call!41656 () Bool)

(assert (=> bm!41653 (= call!41656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(declare-fun b!953312 () Bool)

(declare-fun e!536965 () Bool)

(assert (=> b!953312 (= e!536965 call!41656)))

(declare-fun b!953313 () Bool)

(declare-fun e!536966 () Bool)

(assert (=> b!953313 (= e!536966 call!41656)))

(declare-fun b!953314 () Bool)

(assert (=> b!953314 (= e!536965 e!536966)))

(declare-fun lt!429671 () (_ BitVec 64))

(assert (=> b!953314 (= lt!429671 (select (arr!27736 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32075 0))(
  ( (Unit!32076) )
))
(declare-fun lt!429673 () Unit!32075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57697 (_ BitVec 64) (_ BitVec 32)) Unit!32075)

(assert (=> b!953314 (= lt!429673 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429671 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953314 (arrayContainsKey!0 a!3460 lt!429671 #b00000000000000000000000000000000)))

(declare-fun lt!429672 () Unit!32075)

(assert (=> b!953314 (= lt!429672 lt!429673)))

(declare-fun res!638482 () Bool)

(declare-datatypes ((SeekEntryResult!9170 0))(
  ( (MissingZero!9170 (index!39051 (_ BitVec 32))) (Found!9170 (index!39052 (_ BitVec 32))) (Intermediate!9170 (undefined!9982 Bool) (index!39053 (_ BitVec 32)) (x!82026 (_ BitVec 32))) (Undefined!9170) (MissingVacant!9170 (index!39054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57697 (_ BitVec 32)) SeekEntryResult!9170)

(assert (=> b!953314 (= res!638482 (= (seekEntryOrOpen!0 (select (arr!27736 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9170 #b00000000000000000000000000000000)))))

(assert (=> b!953314 (=> (not res!638482) (not e!536966))))

(declare-fun b!953315 () Bool)

(declare-fun e!536964 () Bool)

(assert (=> b!953315 (= e!536964 e!536965)))

(declare-fun c!99790 () Bool)

(assert (=> b!953315 (= c!99790 (validKeyInArray!0 (select (arr!27736 a!3460) #b00000000000000000000000000000000)))))

(declare-fun d!115657 () Bool)

(declare-fun res!638483 () Bool)

(assert (=> d!115657 (=> res!638483 e!536964)))

(assert (=> d!115657 (= res!638483 (bvsge #b00000000000000000000000000000000 (size!28215 a!3460)))))

(assert (=> d!115657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!536964)))

(assert (= (and d!115657 (not res!638483)) b!953315))

(assert (= (and b!953315 c!99790) b!953314))

(assert (= (and b!953315 (not c!99790)) b!953312))

(assert (= (and b!953314 res!638482) b!953313))

(assert (= (or b!953313 b!953312) bm!41653))

(declare-fun m!885373 () Bool)

(assert (=> bm!41653 m!885373))

(declare-fun m!885375 () Bool)

(assert (=> b!953314 m!885375))

(declare-fun m!885377 () Bool)

(assert (=> b!953314 m!885377))

(declare-fun m!885379 () Bool)

(assert (=> b!953314 m!885379))

(assert (=> b!953314 m!885375))

(declare-fun m!885383 () Bool)

(assert (=> b!953314 m!885383))

(assert (=> b!953315 m!885375))

(assert (=> b!953315 m!885375))

(declare-fun m!885387 () Bool)

(assert (=> b!953315 m!885387))

(assert (=> b!953257 d!115657))

(declare-fun d!115661 () Bool)

(assert (=> d!115661 (= (validKeyInArray!0 k!2725) (and (not (= k!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953258 d!115661))

(push 1)

(assert (not b!953314))

(assert (not b!953315))

(assert (not bm!41653))

(check-sat)

