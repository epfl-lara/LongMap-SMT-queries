; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27030 () Bool)

(assert start!27030)

(declare-fun b!279598 () Bool)

(declare-fun e!178249 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4313 0))(
  ( (Nil!4310) (Cons!4309 (h!4979 (_ BitVec 64)) (t!9387 List!4313)) )
))
(declare-fun contains!1947 (List!4313 (_ BitVec 64)) Bool)

(assert (=> b!279598 (= e!178249 (contains!1947 Nil!4310 k0!2581))))

(declare-fun b!279599 () Bool)

(declare-fun res!142734 () Bool)

(assert (=> b!279599 (=> (not res!142734) (not e!178249))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279599 (= res!142734 (not (= startIndex!26 i!1267)))))

(declare-fun b!279600 () Bool)

(declare-fun res!142736 () Bool)

(assert (=> b!279600 (=> (not res!142736) (not e!178249))))

(declare-datatypes ((array!13898 0))(
  ( (array!13899 (arr!6592 (Array (_ BitVec 32) (_ BitVec 64))) (size!6944 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13898)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13898 (_ BitVec 32)) Bool)

(assert (=> b!279600 (= res!142736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279601 () Bool)

(declare-fun e!178250 () Bool)

(assert (=> b!279601 (= e!178250 e!178249)))

(declare-fun res!142732 () Bool)

(assert (=> b!279601 (=> (not res!142732) (not e!178249))))

(declare-datatypes ((SeekEntryResult!1715 0))(
  ( (MissingZero!1715 (index!9030 (_ BitVec 32))) (Found!1715 (index!9031 (_ BitVec 32))) (Intermediate!1715 (undefined!2527 Bool) (index!9032 (_ BitVec 32)) (x!27385 (_ BitVec 32))) (Undefined!1715) (MissingVacant!1715 (index!9033 (_ BitVec 32))) )
))
(declare-fun lt!138717 () SeekEntryResult!1715)

(assert (=> b!279601 (= res!142732 (or (= lt!138717 (MissingZero!1715 i!1267)) (= lt!138717 (MissingVacant!1715 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13898 (_ BitVec 32)) SeekEntryResult!1715)

(assert (=> b!279601 (= lt!138717 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!142733 () Bool)

(assert (=> start!27030 (=> (not res!142733) (not e!178250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27030 (= res!142733 (validMask!0 mask!3868))))

(assert (=> start!27030 e!178250))

(declare-fun array_inv!4542 (array!13898) Bool)

(assert (=> start!27030 (array_inv!4542 a!3325)))

(assert (=> start!27030 true))

(declare-fun b!279602 () Bool)

(declare-fun res!142742 () Bool)

(assert (=> b!279602 (=> (not res!142742) (not e!178249))))

(assert (=> b!279602 (= res!142742 (and (bvslt (size!6944 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6944 a!3325))))))

(declare-fun b!279603 () Bool)

(declare-fun res!142738 () Bool)

(assert (=> b!279603 (=> (not res!142738) (not e!178249))))

(assert (=> b!279603 (= res!142738 (not (contains!1947 Nil!4310 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279604 () Bool)

(declare-fun res!142739 () Bool)

(assert (=> b!279604 (=> (not res!142739) (not e!178250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279604 (= res!142739 (validKeyInArray!0 k0!2581))))

(declare-fun b!279605 () Bool)

(declare-fun res!142743 () Bool)

(assert (=> b!279605 (=> (not res!142743) (not e!178250))))

(declare-fun arrayContainsKey!0 (array!13898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279605 (= res!142743 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279606 () Bool)

(declare-fun res!142740 () Bool)

(assert (=> b!279606 (=> (not res!142740) (not e!178249))))

(declare-fun noDuplicate!158 (List!4313) Bool)

(assert (=> b!279606 (= res!142740 (noDuplicate!158 Nil!4310))))

(declare-fun b!279607 () Bool)

(declare-fun res!142735 () Bool)

(assert (=> b!279607 (=> (not res!142735) (not e!178249))))

(assert (=> b!279607 (= res!142735 (validKeyInArray!0 (select (arr!6592 a!3325) startIndex!26)))))

(declare-fun b!279608 () Bool)

(declare-fun res!142741 () Bool)

(assert (=> b!279608 (=> (not res!142741) (not e!178250))))

(declare-fun arrayNoDuplicates!0 (array!13898 (_ BitVec 32) List!4313) Bool)

(assert (=> b!279608 (= res!142741 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4310))))

(declare-fun b!279609 () Bool)

(declare-fun res!142731 () Bool)

(assert (=> b!279609 (=> (not res!142731) (not e!178250))))

(assert (=> b!279609 (= res!142731 (and (= (size!6944 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6944 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6944 a!3325))))))

(declare-fun b!279610 () Bool)

(declare-fun res!142737 () Bool)

(assert (=> b!279610 (=> (not res!142737) (not e!178249))))

(assert (=> b!279610 (= res!142737 (not (contains!1947 Nil!4310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!27030 res!142733) b!279609))

(assert (= (and b!279609 res!142731) b!279604))

(assert (= (and b!279604 res!142739) b!279608))

(assert (= (and b!279608 res!142741) b!279605))

(assert (= (and b!279605 res!142743) b!279601))

(assert (= (and b!279601 res!142732) b!279600))

(assert (= (and b!279600 res!142736) b!279599))

(assert (= (and b!279599 res!142734) b!279607))

(assert (= (and b!279607 res!142735) b!279602))

(assert (= (and b!279602 res!142742) b!279606))

(assert (= (and b!279606 res!142740) b!279610))

(assert (= (and b!279610 res!142737) b!279603))

(assert (= (and b!279603 res!142738) b!279598))

(declare-fun m!294467 () Bool)

(assert (=> b!279598 m!294467))

(declare-fun m!294469 () Bool)

(assert (=> b!279605 m!294469))

(declare-fun m!294471 () Bool)

(assert (=> b!279607 m!294471))

(assert (=> b!279607 m!294471))

(declare-fun m!294473 () Bool)

(assert (=> b!279607 m!294473))

(declare-fun m!294475 () Bool)

(assert (=> b!279601 m!294475))

(declare-fun m!294477 () Bool)

(assert (=> b!279604 m!294477))

(declare-fun m!294479 () Bool)

(assert (=> b!279603 m!294479))

(declare-fun m!294481 () Bool)

(assert (=> b!279610 m!294481))

(declare-fun m!294483 () Bool)

(assert (=> b!279600 m!294483))

(declare-fun m!294485 () Bool)

(assert (=> start!27030 m!294485))

(declare-fun m!294487 () Bool)

(assert (=> start!27030 m!294487))

(declare-fun m!294489 () Bool)

(assert (=> b!279606 m!294489))

(declare-fun m!294491 () Bool)

(assert (=> b!279608 m!294491))

(check-sat (not b!279601) (not b!279606) (not b!279604) (not b!279610) (not b!279600) (not b!279608) (not b!279598) (not start!27030) (not b!279607) (not b!279605) (not b!279603))
(check-sat)
(get-model)

(declare-fun b!279697 () Bool)

(declare-fun e!178276 () Bool)

(declare-fun call!25432 () Bool)

(assert (=> b!279697 (= e!178276 call!25432)))

(declare-fun d!65177 () Bool)

(declare-fun res!142827 () Bool)

(declare-fun e!178275 () Bool)

(assert (=> d!65177 (=> res!142827 e!178275)))

(assert (=> d!65177 (= res!142827 (bvsge #b00000000000000000000000000000000 (size!6944 a!3325)))))

(assert (=> d!65177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178275)))

(declare-fun b!279698 () Bool)

(declare-fun e!178277 () Bool)

(assert (=> b!279698 (= e!178275 e!178277)))

(declare-fun c!45988 () Bool)

(assert (=> b!279698 (= c!45988 (validKeyInArray!0 (select (arr!6592 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279699 () Bool)

(assert (=> b!279699 (= e!178277 e!178276)))

(declare-fun lt!138732 () (_ BitVec 64))

(assert (=> b!279699 (= lt!138732 (select (arr!6592 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8792 0))(
  ( (Unit!8793) )
))
(declare-fun lt!138730 () Unit!8792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13898 (_ BitVec 64) (_ BitVec 32)) Unit!8792)

(assert (=> b!279699 (= lt!138730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138732 #b00000000000000000000000000000000))))

(assert (=> b!279699 (arrayContainsKey!0 a!3325 lt!138732 #b00000000000000000000000000000000)))

(declare-fun lt!138731 () Unit!8792)

(assert (=> b!279699 (= lt!138731 lt!138730)))

(declare-fun res!142826 () Bool)

(assert (=> b!279699 (= res!142826 (= (seekEntryOrOpen!0 (select (arr!6592 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1715 #b00000000000000000000000000000000)))))

(assert (=> b!279699 (=> (not res!142826) (not e!178276))))

(declare-fun bm!25429 () Bool)

(assert (=> bm!25429 (= call!25432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279700 () Bool)

(assert (=> b!279700 (= e!178277 call!25432)))

(assert (= (and d!65177 (not res!142827)) b!279698))

(assert (= (and b!279698 c!45988) b!279699))

(assert (= (and b!279698 (not c!45988)) b!279700))

(assert (= (and b!279699 res!142826) b!279697))

(assert (= (or b!279697 b!279700) bm!25429))

(declare-fun m!294545 () Bool)

(assert (=> b!279698 m!294545))

(assert (=> b!279698 m!294545))

(declare-fun m!294547 () Bool)

(assert (=> b!279698 m!294547))

(assert (=> b!279699 m!294545))

(declare-fun m!294549 () Bool)

(assert (=> b!279699 m!294549))

(declare-fun m!294551 () Bool)

(assert (=> b!279699 m!294551))

(assert (=> b!279699 m!294545))

(declare-fun m!294553 () Bool)

(assert (=> b!279699 m!294553))

(declare-fun m!294555 () Bool)

(assert (=> bm!25429 m!294555))

(assert (=> b!279600 d!65177))

(declare-fun d!65179 () Bool)

(assert (=> d!65179 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27030 d!65179))

(declare-fun d!65185 () Bool)

(assert (=> d!65185 (= (array_inv!4542 a!3325) (bvsge (size!6944 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27030 d!65185))

(declare-fun d!65187 () Bool)

(declare-fun res!142842 () Bool)

(declare-fun e!178295 () Bool)

(assert (=> d!65187 (=> res!142842 e!178295)))

(assert (=> d!65187 (= res!142842 (= (select (arr!6592 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65187 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!178295)))

(declare-fun b!279721 () Bool)

(declare-fun e!178296 () Bool)

(assert (=> b!279721 (= e!178295 e!178296)))

(declare-fun res!142843 () Bool)

(assert (=> b!279721 (=> (not res!142843) (not e!178296))))

(assert (=> b!279721 (= res!142843 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6944 a!3325)))))

(declare-fun b!279722 () Bool)

(assert (=> b!279722 (= e!178296 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65187 (not res!142842)) b!279721))

(assert (= (and b!279721 res!142843) b!279722))

(assert (=> d!65187 m!294545))

(declare-fun m!294569 () Bool)

(assert (=> b!279722 m!294569))

(assert (=> b!279605 d!65187))

(declare-fun d!65191 () Bool)

(declare-fun lt!138749 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!190 (List!4313) (InoxSet (_ BitVec 64)))

(assert (=> d!65191 (= lt!138749 (select (content!190 Nil!4310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178308 () Bool)

(assert (=> d!65191 (= lt!138749 e!178308)))

(declare-fun res!142855 () Bool)

(assert (=> d!65191 (=> (not res!142855) (not e!178308))))

(get-info :version)

(assert (=> d!65191 (= res!142855 ((_ is Cons!4309) Nil!4310))))

(assert (=> d!65191 (= (contains!1947 Nil!4310 #b0000000000000000000000000000000000000000000000000000000000000000) lt!138749)))

(declare-fun b!279733 () Bool)

(declare-fun e!178307 () Bool)

(assert (=> b!279733 (= e!178308 e!178307)))

(declare-fun res!142854 () Bool)

(assert (=> b!279733 (=> res!142854 e!178307)))

(assert (=> b!279733 (= res!142854 (= (h!4979 Nil!4310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279734 () Bool)

(assert (=> b!279734 (= e!178307 (contains!1947 (t!9387 Nil!4310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65191 res!142855) b!279733))

(assert (= (and b!279733 (not res!142854)) b!279734))

(declare-fun m!294585 () Bool)

(assert (=> d!65191 m!294585))

(declare-fun m!294587 () Bool)

(assert (=> d!65191 m!294587))

(declare-fun m!294589 () Bool)

(assert (=> b!279734 m!294589))

(assert (=> b!279610 d!65191))

(declare-fun d!65203 () Bool)

(assert (=> d!65203 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279604 d!65203))

(declare-fun d!65205 () Bool)

(declare-fun lt!138750 () Bool)

(assert (=> d!65205 (= lt!138750 (select (content!190 Nil!4310) k0!2581))))

(declare-fun e!178314 () Bool)

(assert (=> d!65205 (= lt!138750 e!178314)))

(declare-fun res!142861 () Bool)

(assert (=> d!65205 (=> (not res!142861) (not e!178314))))

(assert (=> d!65205 (= res!142861 ((_ is Cons!4309) Nil!4310))))

(assert (=> d!65205 (= (contains!1947 Nil!4310 k0!2581) lt!138750)))

(declare-fun b!279739 () Bool)

(declare-fun e!178313 () Bool)

(assert (=> b!279739 (= e!178314 e!178313)))

(declare-fun res!142860 () Bool)

(assert (=> b!279739 (=> res!142860 e!178313)))

(assert (=> b!279739 (= res!142860 (= (h!4979 Nil!4310) k0!2581))))

(declare-fun b!279740 () Bool)

(assert (=> b!279740 (= e!178313 (contains!1947 (t!9387 Nil!4310) k0!2581))))

(assert (= (and d!65205 res!142861) b!279739))

(assert (= (and b!279739 (not res!142860)) b!279740))

(assert (=> d!65205 m!294585))

(declare-fun m!294591 () Bool)

(assert (=> d!65205 m!294591))

(declare-fun m!294593 () Bool)

(assert (=> b!279740 m!294593))

(assert (=> b!279598 d!65205))

(declare-fun d!65207 () Bool)

(declare-fun lt!138751 () Bool)

(assert (=> d!65207 (= lt!138751 (select (content!190 Nil!4310) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178316 () Bool)

(assert (=> d!65207 (= lt!138751 e!178316)))

(declare-fun res!142863 () Bool)

(assert (=> d!65207 (=> (not res!142863) (not e!178316))))

(assert (=> d!65207 (= res!142863 ((_ is Cons!4309) Nil!4310))))

(assert (=> d!65207 (= (contains!1947 Nil!4310 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138751)))

(declare-fun b!279741 () Bool)

(declare-fun e!178315 () Bool)

(assert (=> b!279741 (= e!178316 e!178315)))

(declare-fun res!142862 () Bool)

(assert (=> b!279741 (=> res!142862 e!178315)))

(assert (=> b!279741 (= res!142862 (= (h!4979 Nil!4310) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279742 () Bool)

(assert (=> b!279742 (= e!178315 (contains!1947 (t!9387 Nil!4310) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65207 res!142863) b!279741))

(assert (= (and b!279741 (not res!142862)) b!279742))

(assert (=> d!65207 m!294585))

(declare-fun m!294595 () Bool)

(assert (=> d!65207 m!294595))

(declare-fun m!294597 () Bool)

(assert (=> b!279742 m!294597))

(assert (=> b!279603 d!65207))

(declare-fun b!279770 () Bool)

(declare-fun e!178339 () Bool)

(declare-fun e!178342 () Bool)

(assert (=> b!279770 (= e!178339 e!178342)))

(declare-fun res!142883 () Bool)

(assert (=> b!279770 (=> (not res!142883) (not e!178342))))

(declare-fun e!178341 () Bool)

(assert (=> b!279770 (= res!142883 (not e!178341))))

(declare-fun res!142882 () Bool)

(assert (=> b!279770 (=> (not res!142882) (not e!178341))))

(assert (=> b!279770 (= res!142882 (validKeyInArray!0 (select (arr!6592 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279771 () Bool)

(declare-fun e!178337 () Bool)

(declare-fun call!25441 () Bool)

(assert (=> b!279771 (= e!178337 call!25441)))

(declare-fun d!65209 () Bool)

(declare-fun res!142881 () Bool)

(assert (=> d!65209 (=> res!142881 e!178339)))

(assert (=> d!65209 (= res!142881 (bvsge #b00000000000000000000000000000000 (size!6944 a!3325)))))

(assert (=> d!65209 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4310) e!178339)))

(declare-fun bm!25438 () Bool)

(declare-fun c!45997 () Bool)

(assert (=> bm!25438 (= call!25441 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45997 (Cons!4309 (select (arr!6592 a!3325) #b00000000000000000000000000000000) Nil!4310) Nil!4310)))))

(declare-fun b!279772 () Bool)

(assert (=> b!279772 (= e!178342 e!178337)))

(assert (=> b!279772 (= c!45997 (validKeyInArray!0 (select (arr!6592 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279773 () Bool)

(assert (=> b!279773 (= e!178337 call!25441)))

(declare-fun b!279774 () Bool)

(assert (=> b!279774 (= e!178341 (contains!1947 Nil!4310 (select (arr!6592 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65209 (not res!142881)) b!279770))

(assert (= (and b!279770 res!142882) b!279774))

(assert (= (and b!279770 res!142883) b!279772))

(assert (= (and b!279772 c!45997) b!279771))

(assert (= (and b!279772 (not c!45997)) b!279773))

(assert (= (or b!279771 b!279773) bm!25438))

(assert (=> b!279770 m!294545))

(assert (=> b!279770 m!294545))

(assert (=> b!279770 m!294547))

(assert (=> bm!25438 m!294545))

(declare-fun m!294605 () Bool)

(assert (=> bm!25438 m!294605))

(assert (=> b!279772 m!294545))

(assert (=> b!279772 m!294545))

(assert (=> b!279772 m!294547))

(assert (=> b!279774 m!294545))

(assert (=> b!279774 m!294545))

(declare-fun m!294609 () Bool)

(assert (=> b!279774 m!294609))

(assert (=> b!279608 d!65209))

(declare-fun d!65215 () Bool)

(assert (=> d!65215 (= (validKeyInArray!0 (select (arr!6592 a!3325) startIndex!26)) (and (not (= (select (arr!6592 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6592 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279607 d!65215))

(declare-fun b!279811 () Bool)

(declare-fun e!178366 () SeekEntryResult!1715)

(declare-fun lt!138770 () SeekEntryResult!1715)

(assert (=> b!279811 (= e!178366 (MissingZero!1715 (index!9032 lt!138770)))))

(declare-fun b!279812 () Bool)

(declare-fun e!178365 () SeekEntryResult!1715)

(declare-fun e!178364 () SeekEntryResult!1715)

(assert (=> b!279812 (= e!178365 e!178364)))

(declare-fun lt!138771 () (_ BitVec 64))

(assert (=> b!279812 (= lt!138771 (select (arr!6592 a!3325) (index!9032 lt!138770)))))

(declare-fun c!46015 () Bool)

(assert (=> b!279812 (= c!46015 (= lt!138771 k0!2581))))

(declare-fun b!279813 () Bool)

(assert (=> b!279813 (= e!178365 Undefined!1715)))

(declare-fun b!279814 () Bool)

(assert (=> b!279814 (= e!178364 (Found!1715 (index!9032 lt!138770)))))

(declare-fun b!279815 () Bool)

(declare-fun c!46014 () Bool)

(assert (=> b!279815 (= c!46014 (= lt!138771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!279815 (= e!178364 e!178366)))

(declare-fun b!279816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13898 (_ BitVec 32)) SeekEntryResult!1715)

(assert (=> b!279816 (= e!178366 (seekKeyOrZeroReturnVacant!0 (x!27385 lt!138770) (index!9032 lt!138770) (index!9032 lt!138770) k0!2581 a!3325 mask!3868))))

(declare-fun d!65217 () Bool)

(declare-fun lt!138772 () SeekEntryResult!1715)

(assert (=> d!65217 (and (or ((_ is Undefined!1715) lt!138772) (not ((_ is Found!1715) lt!138772)) (and (bvsge (index!9031 lt!138772) #b00000000000000000000000000000000) (bvslt (index!9031 lt!138772) (size!6944 a!3325)))) (or ((_ is Undefined!1715) lt!138772) ((_ is Found!1715) lt!138772) (not ((_ is MissingZero!1715) lt!138772)) (and (bvsge (index!9030 lt!138772) #b00000000000000000000000000000000) (bvslt (index!9030 lt!138772) (size!6944 a!3325)))) (or ((_ is Undefined!1715) lt!138772) ((_ is Found!1715) lt!138772) ((_ is MissingZero!1715) lt!138772) (not ((_ is MissingVacant!1715) lt!138772)) (and (bvsge (index!9033 lt!138772) #b00000000000000000000000000000000) (bvslt (index!9033 lt!138772) (size!6944 a!3325)))) (or ((_ is Undefined!1715) lt!138772) (ite ((_ is Found!1715) lt!138772) (= (select (arr!6592 a!3325) (index!9031 lt!138772)) k0!2581) (ite ((_ is MissingZero!1715) lt!138772) (= (select (arr!6592 a!3325) (index!9030 lt!138772)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1715) lt!138772) (= (select (arr!6592 a!3325) (index!9033 lt!138772)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65217 (= lt!138772 e!178365)))

(declare-fun c!46013 () Bool)

(assert (=> d!65217 (= c!46013 (and ((_ is Intermediate!1715) lt!138770) (undefined!2527 lt!138770)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13898 (_ BitVec 32)) SeekEntryResult!1715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65217 (= lt!138770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65217 (validMask!0 mask!3868)))

(assert (=> d!65217 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138772)))

(assert (= (and d!65217 c!46013) b!279813))

(assert (= (and d!65217 (not c!46013)) b!279812))

(assert (= (and b!279812 c!46015) b!279814))

(assert (= (and b!279812 (not c!46015)) b!279815))

(assert (= (and b!279815 c!46014) b!279811))

(assert (= (and b!279815 (not c!46014)) b!279816))

(declare-fun m!294631 () Bool)

(assert (=> b!279812 m!294631))

(declare-fun m!294633 () Bool)

(assert (=> b!279816 m!294633))

(declare-fun m!294635 () Bool)

(assert (=> d!65217 m!294635))

(declare-fun m!294637 () Bool)

(assert (=> d!65217 m!294637))

(assert (=> d!65217 m!294635))

(declare-fun m!294639 () Bool)

(assert (=> d!65217 m!294639))

(assert (=> d!65217 m!294485))

(declare-fun m!294641 () Bool)

(assert (=> d!65217 m!294641))

(declare-fun m!294643 () Bool)

(assert (=> d!65217 m!294643))

(assert (=> b!279601 d!65217))

(declare-fun d!65227 () Bool)

(declare-fun res!142894 () Bool)

(declare-fun e!178371 () Bool)

(assert (=> d!65227 (=> res!142894 e!178371)))

(assert (=> d!65227 (= res!142894 ((_ is Nil!4310) Nil!4310))))

(assert (=> d!65227 (= (noDuplicate!158 Nil!4310) e!178371)))

(declare-fun b!279821 () Bool)

(declare-fun e!178372 () Bool)

(assert (=> b!279821 (= e!178371 e!178372)))

(declare-fun res!142895 () Bool)

(assert (=> b!279821 (=> (not res!142895) (not e!178372))))

(assert (=> b!279821 (= res!142895 (not (contains!1947 (t!9387 Nil!4310) (h!4979 Nil!4310))))))

(declare-fun b!279822 () Bool)

(assert (=> b!279822 (= e!178372 (noDuplicate!158 (t!9387 Nil!4310)))))

(assert (= (and d!65227 (not res!142894)) b!279821))

(assert (= (and b!279821 res!142895) b!279822))

(declare-fun m!294645 () Bool)

(assert (=> b!279821 m!294645))

(declare-fun m!294647 () Bool)

(assert (=> b!279822 m!294647))

(assert (=> b!279606 d!65227))

(check-sat (not b!279722) (not b!279699) (not b!279774) (not b!279821) (not d!65191) (not d!65205) (not bm!25438) (not b!279772) (not b!279816) (not b!279822) (not d!65217) (not b!279742) (not b!279770) (not b!279734) (not b!279740) (not bm!25429) (not b!279698) (not d!65207))
(check-sat)
