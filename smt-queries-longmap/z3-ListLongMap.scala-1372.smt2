; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27032 () Bool)

(assert start!27032)

(declare-fun b!279590 () Bool)

(declare-fun res!142749 () Bool)

(declare-fun e!178233 () Bool)

(assert (=> b!279590 (=> (not res!142749) (not e!178233))))

(declare-datatypes ((array!13901 0))(
  ( (array!13902 (arr!6594 (Array (_ BitVec 32) (_ BitVec 64))) (size!6946 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13901)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279590 (= res!142749 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279591 () Bool)

(declare-fun res!142752 () Bool)

(declare-fun e!178235 () Bool)

(assert (=> b!279591 (=> (not res!142752) (not e!178235))))

(declare-datatypes ((List!4402 0))(
  ( (Nil!4399) (Cons!4398 (h!5068 (_ BitVec 64)) (t!9484 List!4402)) )
))
(declare-fun contains!1974 (List!4402 (_ BitVec 64)) Bool)

(assert (=> b!279591 (= res!142752 (not (contains!1974 Nil!4399 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279592 () Bool)

(declare-fun res!142754 () Bool)

(assert (=> b!279592 (=> (not res!142754) (not e!178235))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13901 (_ BitVec 32)) Bool)

(assert (=> b!279592 (= res!142754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279593 () Bool)

(assert (=> b!279593 (= e!178235 (contains!1974 Nil!4399 k0!2581))))

(declare-fun b!279594 () Bool)

(declare-fun res!142753 () Bool)

(assert (=> b!279594 (=> (not res!142753) (not e!178233))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!279594 (= res!142753 (and (= (size!6946 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6946 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6946 a!3325))))))

(declare-fun b!279595 () Bool)

(declare-fun res!142755 () Bool)

(assert (=> b!279595 (=> (not res!142755) (not e!178235))))

(declare-fun noDuplicate!156 (List!4402) Bool)

(assert (=> b!279595 (= res!142755 (noDuplicate!156 Nil!4399))))

(declare-fun b!279596 () Bool)

(declare-fun res!142758 () Bool)

(assert (=> b!279596 (=> (not res!142758) (not e!178233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279596 (= res!142758 (validKeyInArray!0 k0!2581))))

(declare-fun b!279597 () Bool)

(declare-fun res!142750 () Bool)

(assert (=> b!279597 (=> (not res!142750) (not e!178235))))

(assert (=> b!279597 (= res!142750 (validKeyInArray!0 (select (arr!6594 a!3325) startIndex!26)))))

(declare-fun b!279598 () Bool)

(declare-fun res!142759 () Bool)

(assert (=> b!279598 (=> (not res!142759) (not e!178235))))

(assert (=> b!279598 (= res!142759 (not (contains!1974 Nil!4399 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279599 () Bool)

(assert (=> b!279599 (= e!178233 e!178235)))

(declare-fun res!142751 () Bool)

(assert (=> b!279599 (=> (not res!142751) (not e!178235))))

(declare-datatypes ((SeekEntryResult!1752 0))(
  ( (MissingZero!1752 (index!9178 (_ BitVec 32))) (Found!1752 (index!9179 (_ BitVec 32))) (Intermediate!1752 (undefined!2564 Bool) (index!9180 (_ BitVec 32)) (x!27422 (_ BitVec 32))) (Undefined!1752) (MissingVacant!1752 (index!9181 (_ BitVec 32))) )
))
(declare-fun lt!138661 () SeekEntryResult!1752)

(assert (=> b!279599 (= res!142751 (or (= lt!138661 (MissingZero!1752 i!1267)) (= lt!138661 (MissingVacant!1752 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13901 (_ BitVec 32)) SeekEntryResult!1752)

(assert (=> b!279599 (= lt!138661 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279600 () Bool)

(declare-fun res!142756 () Bool)

(assert (=> b!279600 (=> (not res!142756) (not e!178235))))

(assert (=> b!279600 (= res!142756 (not (= startIndex!26 i!1267)))))

(declare-fun res!142761 () Bool)

(assert (=> start!27032 (=> (not res!142761) (not e!178233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27032 (= res!142761 (validMask!0 mask!3868))))

(assert (=> start!27032 e!178233))

(declare-fun array_inv!4557 (array!13901) Bool)

(assert (=> start!27032 (array_inv!4557 a!3325)))

(assert (=> start!27032 true))

(declare-fun b!279601 () Bool)

(declare-fun res!142760 () Bool)

(assert (=> b!279601 (=> (not res!142760) (not e!178233))))

(declare-fun arrayNoDuplicates!0 (array!13901 (_ BitVec 32) List!4402) Bool)

(assert (=> b!279601 (= res!142760 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4399))))

(declare-fun b!279602 () Bool)

(declare-fun res!142757 () Bool)

(assert (=> b!279602 (=> (not res!142757) (not e!178235))))

(assert (=> b!279602 (= res!142757 (and (bvslt (size!6946 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6946 a!3325))))))

(assert (= (and start!27032 res!142761) b!279594))

(assert (= (and b!279594 res!142753) b!279596))

(assert (= (and b!279596 res!142758) b!279601))

(assert (= (and b!279601 res!142760) b!279590))

(assert (= (and b!279590 res!142749) b!279599))

(assert (= (and b!279599 res!142751) b!279592))

(assert (= (and b!279592 res!142754) b!279600))

(assert (= (and b!279600 res!142756) b!279597))

(assert (= (and b!279597 res!142750) b!279602))

(assert (= (and b!279602 res!142757) b!279595))

(assert (= (and b!279595 res!142755) b!279598))

(assert (= (and b!279598 res!142759) b!279591))

(assert (= (and b!279591 res!142752) b!279593))

(declare-fun m!294287 () Bool)

(assert (=> b!279595 m!294287))

(declare-fun m!294289 () Bool)

(assert (=> b!279601 m!294289))

(declare-fun m!294291 () Bool)

(assert (=> b!279598 m!294291))

(declare-fun m!294293 () Bool)

(assert (=> b!279593 m!294293))

(declare-fun m!294295 () Bool)

(assert (=> b!279597 m!294295))

(assert (=> b!279597 m!294295))

(declare-fun m!294297 () Bool)

(assert (=> b!279597 m!294297))

(declare-fun m!294299 () Bool)

(assert (=> b!279590 m!294299))

(declare-fun m!294301 () Bool)

(assert (=> b!279592 m!294301))

(declare-fun m!294303 () Bool)

(assert (=> b!279599 m!294303))

(declare-fun m!294305 () Bool)

(assert (=> b!279591 m!294305))

(declare-fun m!294307 () Bool)

(assert (=> b!279596 m!294307))

(declare-fun m!294309 () Bool)

(assert (=> start!27032 m!294309))

(declare-fun m!294311 () Bool)

(assert (=> start!27032 m!294311))

(check-sat (not b!279598) (not b!279590) (not b!279596) (not b!279591) (not b!279599) (not b!279592) (not b!279597) (not start!27032) (not b!279601) (not b!279595) (not b!279593))
(check-sat)
(get-model)

(declare-fun lt!138673 () SeekEntryResult!1752)

(declare-fun b!279660 () Bool)

(declare-fun e!178257 () SeekEntryResult!1752)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13901 (_ BitVec 32)) SeekEntryResult!1752)

(assert (=> b!279660 (= e!178257 (seekKeyOrZeroReturnVacant!0 (x!27422 lt!138673) (index!9180 lt!138673) (index!9180 lt!138673) k0!2581 a!3325 mask!3868))))

(declare-fun d!65107 () Bool)

(declare-fun lt!138672 () SeekEntryResult!1752)

(get-info :version)

(assert (=> d!65107 (and (or ((_ is Undefined!1752) lt!138672) (not ((_ is Found!1752) lt!138672)) (and (bvsge (index!9179 lt!138672) #b00000000000000000000000000000000) (bvslt (index!9179 lt!138672) (size!6946 a!3325)))) (or ((_ is Undefined!1752) lt!138672) ((_ is Found!1752) lt!138672) (not ((_ is MissingZero!1752) lt!138672)) (and (bvsge (index!9178 lt!138672) #b00000000000000000000000000000000) (bvslt (index!9178 lt!138672) (size!6946 a!3325)))) (or ((_ is Undefined!1752) lt!138672) ((_ is Found!1752) lt!138672) ((_ is MissingZero!1752) lt!138672) (not ((_ is MissingVacant!1752) lt!138672)) (and (bvsge (index!9181 lt!138672) #b00000000000000000000000000000000) (bvslt (index!9181 lt!138672) (size!6946 a!3325)))) (or ((_ is Undefined!1752) lt!138672) (ite ((_ is Found!1752) lt!138672) (= (select (arr!6594 a!3325) (index!9179 lt!138672)) k0!2581) (ite ((_ is MissingZero!1752) lt!138672) (= (select (arr!6594 a!3325) (index!9178 lt!138672)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1752) lt!138672) (= (select (arr!6594 a!3325) (index!9181 lt!138672)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!178258 () SeekEntryResult!1752)

(assert (=> d!65107 (= lt!138672 e!178258)))

(declare-fun c!45979 () Bool)

(assert (=> d!65107 (= c!45979 (and ((_ is Intermediate!1752) lt!138673) (undefined!2564 lt!138673)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13901 (_ BitVec 32)) SeekEntryResult!1752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65107 (= lt!138673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65107 (validMask!0 mask!3868)))

(assert (=> d!65107 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138672)))

(declare-fun b!279661 () Bool)

(declare-fun e!178259 () SeekEntryResult!1752)

(assert (=> b!279661 (= e!178259 (Found!1752 (index!9180 lt!138673)))))

(declare-fun b!279662 () Bool)

(assert (=> b!279662 (= e!178257 (MissingZero!1752 (index!9180 lt!138673)))))

(declare-fun b!279663 () Bool)

(declare-fun c!45980 () Bool)

(declare-fun lt!138671 () (_ BitVec 64))

(assert (=> b!279663 (= c!45980 (= lt!138671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!279663 (= e!178259 e!178257)))

(declare-fun b!279664 () Bool)

(assert (=> b!279664 (= e!178258 e!178259)))

(assert (=> b!279664 (= lt!138671 (select (arr!6594 a!3325) (index!9180 lt!138673)))))

(declare-fun c!45981 () Bool)

(assert (=> b!279664 (= c!45981 (= lt!138671 k0!2581))))

(declare-fun b!279665 () Bool)

(assert (=> b!279665 (= e!178258 Undefined!1752)))

(assert (= (and d!65107 c!45979) b!279665))

(assert (= (and d!65107 (not c!45979)) b!279664))

(assert (= (and b!279664 c!45981) b!279661))

(assert (= (and b!279664 (not c!45981)) b!279663))

(assert (= (and b!279663 c!45980) b!279662))

(assert (= (and b!279663 (not c!45980)) b!279660))

(declare-fun m!294343 () Bool)

(assert (=> b!279660 m!294343))

(declare-fun m!294345 () Bool)

(assert (=> d!65107 m!294345))

(declare-fun m!294347 () Bool)

(assert (=> d!65107 m!294347))

(declare-fun m!294349 () Bool)

(assert (=> d!65107 m!294349))

(assert (=> d!65107 m!294309))

(declare-fun m!294351 () Bool)

(assert (=> d!65107 m!294351))

(assert (=> d!65107 m!294349))

(declare-fun m!294353 () Bool)

(assert (=> d!65107 m!294353))

(declare-fun m!294355 () Bool)

(assert (=> b!279664 m!294355))

(assert (=> b!279599 d!65107))

(declare-fun d!65115 () Bool)

(declare-fun lt!138676 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!189 (List!4402) (InoxSet (_ BitVec 64)))

(assert (=> d!65115 (= lt!138676 (select (content!189 Nil!4399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178264 () Bool)

(assert (=> d!65115 (= lt!138676 e!178264)))

(declare-fun res!142812 () Bool)

(assert (=> d!65115 (=> (not res!142812) (not e!178264))))

(assert (=> d!65115 (= res!142812 ((_ is Cons!4398) Nil!4399))))

(assert (=> d!65115 (= (contains!1974 Nil!4399 #b0000000000000000000000000000000000000000000000000000000000000000) lt!138676)))

(declare-fun b!279670 () Bool)

(declare-fun e!178265 () Bool)

(assert (=> b!279670 (= e!178264 e!178265)))

(declare-fun res!142811 () Bool)

(assert (=> b!279670 (=> res!142811 e!178265)))

(assert (=> b!279670 (= res!142811 (= (h!5068 Nil!4399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279671 () Bool)

(assert (=> b!279671 (= e!178265 (contains!1974 (t!9484 Nil!4399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65115 res!142812) b!279670))

(assert (= (and b!279670 (not res!142811)) b!279671))

(declare-fun m!294357 () Bool)

(assert (=> d!65115 m!294357))

(declare-fun m!294359 () Bool)

(assert (=> d!65115 m!294359))

(declare-fun m!294361 () Bool)

(assert (=> b!279671 m!294361))

(assert (=> b!279598 d!65115))

(declare-fun d!65117 () Bool)

(declare-fun lt!138677 () Bool)

(assert (=> d!65117 (= lt!138677 (select (content!189 Nil!4399) k0!2581))))

(declare-fun e!178266 () Bool)

(assert (=> d!65117 (= lt!138677 e!178266)))

(declare-fun res!142814 () Bool)

(assert (=> d!65117 (=> (not res!142814) (not e!178266))))

(assert (=> d!65117 (= res!142814 ((_ is Cons!4398) Nil!4399))))

(assert (=> d!65117 (= (contains!1974 Nil!4399 k0!2581) lt!138677)))

(declare-fun b!279672 () Bool)

(declare-fun e!178267 () Bool)

(assert (=> b!279672 (= e!178266 e!178267)))

(declare-fun res!142813 () Bool)

(assert (=> b!279672 (=> res!142813 e!178267)))

(assert (=> b!279672 (= res!142813 (= (h!5068 Nil!4399) k0!2581))))

(declare-fun b!279673 () Bool)

(assert (=> b!279673 (= e!178267 (contains!1974 (t!9484 Nil!4399) k0!2581))))

(assert (= (and d!65117 res!142814) b!279672))

(assert (= (and b!279672 (not res!142813)) b!279673))

(assert (=> d!65117 m!294357))

(declare-fun m!294363 () Bool)

(assert (=> d!65117 m!294363))

(declare-fun m!294365 () Bool)

(assert (=> b!279673 m!294365))

(assert (=> b!279593 d!65117))

(declare-fun b!279710 () Bool)

(declare-fun e!178291 () Bool)

(declare-fun e!178293 () Bool)

(assert (=> b!279710 (= e!178291 e!178293)))

(declare-fun c!45995 () Bool)

(assert (=> b!279710 (= c!45995 (validKeyInArray!0 (select (arr!6594 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279711 () Bool)

(declare-fun e!178292 () Bool)

(declare-fun call!25446 () Bool)

(assert (=> b!279711 (= e!178292 call!25446)))

(declare-fun b!279712 () Bool)

(assert (=> b!279712 (= e!178293 call!25446)))

(declare-fun b!279713 () Bool)

(assert (=> b!279713 (= e!178293 e!178292)))

(declare-fun lt!138693 () (_ BitVec 64))

(assert (=> b!279713 (= lt!138693 (select (arr!6594 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8818 0))(
  ( (Unit!8819) )
))
(declare-fun lt!138694 () Unit!8818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13901 (_ BitVec 64) (_ BitVec 32)) Unit!8818)

(assert (=> b!279713 (= lt!138694 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138693 #b00000000000000000000000000000000))))

(assert (=> b!279713 (arrayContainsKey!0 a!3325 lt!138693 #b00000000000000000000000000000000)))

(declare-fun lt!138695 () Unit!8818)

(assert (=> b!279713 (= lt!138695 lt!138694)))

(declare-fun res!142825 () Bool)

(assert (=> b!279713 (= res!142825 (= (seekEntryOrOpen!0 (select (arr!6594 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1752 #b00000000000000000000000000000000)))))

(assert (=> b!279713 (=> (not res!142825) (not e!178292))))

(declare-fun bm!25443 () Bool)

(assert (=> bm!25443 (= call!25446 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65119 () Bool)

(declare-fun res!142826 () Bool)

(assert (=> d!65119 (=> res!142826 e!178291)))

(assert (=> d!65119 (= res!142826 (bvsge #b00000000000000000000000000000000 (size!6946 a!3325)))))

(assert (=> d!65119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178291)))

(assert (= (and d!65119 (not res!142826)) b!279710))

(assert (= (and b!279710 c!45995) b!279713))

(assert (= (and b!279710 (not c!45995)) b!279712))

(assert (= (and b!279713 res!142825) b!279711))

(assert (= (or b!279711 b!279712) bm!25443))

(declare-fun m!294367 () Bool)

(assert (=> b!279710 m!294367))

(assert (=> b!279710 m!294367))

(declare-fun m!294369 () Bool)

(assert (=> b!279710 m!294369))

(assert (=> b!279713 m!294367))

(declare-fun m!294371 () Bool)

(assert (=> b!279713 m!294371))

(declare-fun m!294375 () Bool)

(assert (=> b!279713 m!294375))

(assert (=> b!279713 m!294367))

(declare-fun m!294379 () Bool)

(assert (=> b!279713 m!294379))

(declare-fun m!294383 () Bool)

(assert (=> bm!25443 m!294383))

(assert (=> b!279592 d!65119))

(declare-fun d!65125 () Bool)

(assert (=> d!65125 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27032 d!65125))

(declare-fun d!65133 () Bool)

(assert (=> d!65133 (= (array_inv!4557 a!3325) (bvsge (size!6946 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27032 d!65133))

(declare-fun d!65137 () Bool)

(assert (=> d!65137 (= (validKeyInArray!0 (select (arr!6594 a!3325) startIndex!26)) (and (not (= (select (arr!6594 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6594 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279597 d!65137))

(declare-fun d!65141 () Bool)

(assert (=> d!65141 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279596 d!65141))

(declare-fun d!65143 () Bool)

(declare-fun lt!138705 () Bool)

(assert (=> d!65143 (= lt!138705 (select (content!189 Nil!4399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178325 () Bool)

(assert (=> d!65143 (= lt!138705 e!178325)))

(declare-fun res!142852 () Bool)

(assert (=> d!65143 (=> (not res!142852) (not e!178325))))

(assert (=> d!65143 (= res!142852 ((_ is Cons!4398) Nil!4399))))

(assert (=> d!65143 (= (contains!1974 Nil!4399 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138705)))

(declare-fun b!279752 () Bool)

(declare-fun e!178326 () Bool)

(assert (=> b!279752 (= e!178325 e!178326)))

(declare-fun res!142851 () Bool)

(assert (=> b!279752 (=> res!142851 e!178326)))

(assert (=> b!279752 (= res!142851 (= (h!5068 Nil!4399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279753 () Bool)

(assert (=> b!279753 (= e!178326 (contains!1974 (t!9484 Nil!4399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65143 res!142852) b!279752))

(assert (= (and b!279752 (not res!142851)) b!279753))

(assert (=> d!65143 m!294357))

(declare-fun m!294417 () Bool)

(assert (=> d!65143 m!294417))

(declare-fun m!294419 () Bool)

(assert (=> b!279753 m!294419))

(assert (=> b!279591 d!65143))

(declare-fun d!65145 () Bool)

(declare-fun res!142871 () Bool)

(declare-fun e!178345 () Bool)

(assert (=> d!65145 (=> res!142871 e!178345)))

(assert (=> d!65145 (= res!142871 (= (select (arr!6594 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65145 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!178345)))

(declare-fun b!279772 () Bool)

(declare-fun e!178346 () Bool)

(assert (=> b!279772 (= e!178345 e!178346)))

(declare-fun res!142872 () Bool)

(assert (=> b!279772 (=> (not res!142872) (not e!178346))))

(assert (=> b!279772 (= res!142872 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6946 a!3325)))))

(declare-fun b!279773 () Bool)

(assert (=> b!279773 (= e!178346 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65145 (not res!142871)) b!279772))

(assert (= (and b!279772 res!142872) b!279773))

(assert (=> d!65145 m!294367))

(declare-fun m!294437 () Bool)

(assert (=> b!279773 m!294437))

(assert (=> b!279590 d!65145))

(declare-fun d!65153 () Bool)

(declare-fun res!142895 () Bool)

(declare-fun e!178373 () Bool)

(assert (=> d!65153 (=> res!142895 e!178373)))

(assert (=> d!65153 (= res!142895 (bvsge #b00000000000000000000000000000000 (size!6946 a!3325)))))

(assert (=> d!65153 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4399) e!178373)))

(declare-fun b!279802 () Bool)

(declare-fun e!178372 () Bool)

(assert (=> b!279802 (= e!178372 (contains!1974 Nil!4399 (select (arr!6594 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279803 () Bool)

(declare-fun e!178374 () Bool)

(assert (=> b!279803 (= e!178373 e!178374)))

(declare-fun res!142894 () Bool)

(assert (=> b!279803 (=> (not res!142894) (not e!178374))))

(assert (=> b!279803 (= res!142894 (not e!178372))))

(declare-fun res!142893 () Bool)

(assert (=> b!279803 (=> (not res!142893) (not e!178372))))

(assert (=> b!279803 (= res!142893 (validKeyInArray!0 (select (arr!6594 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279804 () Bool)

(declare-fun e!178371 () Bool)

(declare-fun call!25458 () Bool)

(assert (=> b!279804 (= e!178371 call!25458)))

(declare-fun b!279805 () Bool)

(assert (=> b!279805 (= e!178371 call!25458)))

(declare-fun b!279806 () Bool)

(assert (=> b!279806 (= e!178374 e!178371)))

(declare-fun c!46007 () Bool)

(assert (=> b!279806 (= c!46007 (validKeyInArray!0 (select (arr!6594 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25455 () Bool)

(assert (=> bm!25455 (= call!25458 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46007 (Cons!4398 (select (arr!6594 a!3325) #b00000000000000000000000000000000) Nil!4399) Nil!4399)))))

(assert (= (and d!65153 (not res!142895)) b!279803))

(assert (= (and b!279803 res!142893) b!279802))

(assert (= (and b!279803 res!142894) b!279806))

(assert (= (and b!279806 c!46007) b!279805))

(assert (= (and b!279806 (not c!46007)) b!279804))

(assert (= (or b!279805 b!279804) bm!25455))

(assert (=> b!279802 m!294367))

(assert (=> b!279802 m!294367))

(declare-fun m!294451 () Bool)

(assert (=> b!279802 m!294451))

(assert (=> b!279803 m!294367))

(assert (=> b!279803 m!294367))

(assert (=> b!279803 m!294369))

(assert (=> b!279806 m!294367))

(assert (=> b!279806 m!294367))

(assert (=> b!279806 m!294369))

(assert (=> bm!25455 m!294367))

(declare-fun m!294453 () Bool)

(assert (=> bm!25455 m!294453))

(assert (=> b!279601 d!65153))

(declare-fun d!65165 () Bool)

(declare-fun res!142902 () Bool)

(declare-fun e!178382 () Bool)

(assert (=> d!65165 (=> res!142902 e!178382)))

(assert (=> d!65165 (= res!142902 ((_ is Nil!4399) Nil!4399))))

(assert (=> d!65165 (= (noDuplicate!156 Nil!4399) e!178382)))

(declare-fun b!279815 () Bool)

(declare-fun e!178383 () Bool)

(assert (=> b!279815 (= e!178382 e!178383)))

(declare-fun res!142903 () Bool)

(assert (=> b!279815 (=> (not res!142903) (not e!178383))))

(assert (=> b!279815 (= res!142903 (not (contains!1974 (t!9484 Nil!4399) (h!5068 Nil!4399))))))

(declare-fun b!279816 () Bool)

(assert (=> b!279816 (= e!178383 (noDuplicate!156 (t!9484 Nil!4399)))))

(assert (= (and d!65165 (not res!142902)) b!279815))

(assert (= (and b!279815 res!142903) b!279816))

(declare-fun m!294463 () Bool)

(assert (=> b!279815 m!294463))

(declare-fun m!294465 () Bool)

(assert (=> b!279816 m!294465))

(assert (=> b!279595 d!65165))

(check-sat (not d!65115) (not b!279815) (not b!279710) (not b!279802) (not b!279660) (not d!65117) (not b!279713) (not b!279803) (not b!279816) (not b!279806) (not b!279671) (not bm!25443) (not d!65107) (not b!279773) (not b!279753) (not bm!25455) (not d!65143) (not b!279673))
(check-sat)
