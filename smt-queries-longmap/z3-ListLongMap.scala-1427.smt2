; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27590 () Bool)

(assert start!27590)

(declare-fun b!285107 () Bool)

(declare-fun e!180729 () Bool)

(declare-fun e!180731 () Bool)

(assert (=> b!285107 (= e!180729 e!180731)))

(declare-fun res!147615 () Bool)

(assert (=> b!285107 (=> (not res!147615) (not e!180731))))

(declare-datatypes ((SeekEntryResult!1917 0))(
  ( (MissingZero!1917 (index!9838 (_ BitVec 32))) (Found!1917 (index!9839 (_ BitVec 32))) (Intermediate!1917 (undefined!2729 Bool) (index!9840 (_ BitVec 32)) (x!28036 (_ BitVec 32))) (Undefined!1917) (MissingVacant!1917 (index!9841 (_ BitVec 32))) )
))
(declare-fun lt!140693 () SeekEntryResult!1917)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285107 (= res!147615 (or (= lt!140693 (MissingZero!1917 i!1267)) (= lt!140693 (MissingVacant!1917 i!1267))))))

(declare-datatypes ((array!14240 0))(
  ( (array!14241 (arr!6759 (Array (_ BitVec 32) (_ BitVec 64))) (size!7111 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14240)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14240 (_ BitVec 32)) SeekEntryResult!1917)

(assert (=> b!285107 (= lt!140693 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!147624 () Bool)

(assert (=> start!27590 (=> (not res!147624) (not e!180729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27590 (= res!147624 (validMask!0 mask!3868))))

(assert (=> start!27590 e!180729))

(declare-fun array_inv!4722 (array!14240) Bool)

(assert (=> start!27590 (array_inv!4722 a!3325)))

(assert (=> start!27590 true))

(declare-fun b!285108 () Bool)

(declare-fun res!147621 () Bool)

(assert (=> b!285108 (=> (not res!147621) (not e!180729))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285108 (= res!147621 (and (= (size!7111 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7111 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7111 a!3325))))))

(declare-fun b!285109 () Bool)

(declare-fun e!180728 () Bool)

(assert (=> b!285109 (= e!180731 e!180728)))

(declare-fun res!147620 () Bool)

(assert (=> b!285109 (=> (not res!147620) (not e!180728))))

(assert (=> b!285109 (= res!147620 (not (= startIndex!26 i!1267)))))

(declare-fun lt!140695 () array!14240)

(assert (=> b!285109 (= lt!140695 (array!14241 (store (arr!6759 a!3325) i!1267 k0!2581) (size!7111 a!3325)))))

(declare-fun b!285110 () Bool)

(declare-fun res!147622 () Bool)

(assert (=> b!285110 (=> (not res!147622) (not e!180729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285110 (= res!147622 (validKeyInArray!0 k0!2581))))

(declare-fun b!285111 () Bool)

(declare-fun res!147616 () Bool)

(assert (=> b!285111 (=> (not res!147616) (not e!180728))))

(assert (=> b!285111 (= res!147616 (and (bvslt startIndex!26 (bvsub (size!7111 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!285112 () Bool)

(declare-fun res!147618 () Bool)

(assert (=> b!285112 (=> (not res!147618) (not e!180729))))

(declare-fun arrayContainsKey!0 (array!14240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285112 (= res!147618 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285113 () Bool)

(declare-fun res!147617 () Bool)

(assert (=> b!285113 (=> (not res!147617) (not e!180729))))

(declare-datatypes ((List!4567 0))(
  ( (Nil!4564) (Cons!4563 (h!5236 (_ BitVec 64)) (t!9649 List!4567)) )
))
(declare-fun arrayNoDuplicates!0 (array!14240 (_ BitVec 32) List!4567) Bool)

(assert (=> b!285113 (= res!147617 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4564))))

(declare-fun b!285114 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14240 (_ BitVec 32)) Bool)

(assert (=> b!285114 (= e!180728 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140695 mask!3868)))))

(assert (=> b!285114 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140695 mask!3868)))

(declare-datatypes ((Unit!9040 0))(
  ( (Unit!9041) )
))
(declare-fun lt!140694 () Unit!9040)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14240 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9040)

(assert (=> b!285114 (= lt!140694 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!285115 () Bool)

(declare-fun res!147623 () Bool)

(assert (=> b!285115 (=> (not res!147623) (not e!180728))))

(assert (=> b!285115 (= res!147623 (not (validKeyInArray!0 (select (arr!6759 a!3325) startIndex!26))))))

(declare-fun b!285116 () Bool)

(declare-fun res!147619 () Bool)

(assert (=> b!285116 (=> (not res!147619) (not e!180731))))

(assert (=> b!285116 (= res!147619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27590 res!147624) b!285108))

(assert (= (and b!285108 res!147621) b!285110))

(assert (= (and b!285110 res!147622) b!285113))

(assert (= (and b!285113 res!147617) b!285112))

(assert (= (and b!285112 res!147618) b!285107))

(assert (= (and b!285107 res!147615) b!285116))

(assert (= (and b!285116 res!147619) b!285109))

(assert (= (and b!285109 res!147620) b!285115))

(assert (= (and b!285115 res!147623) b!285111))

(assert (= (and b!285111 res!147616) b!285114))

(declare-fun m!299963 () Bool)

(assert (=> b!285112 m!299963))

(declare-fun m!299965 () Bool)

(assert (=> b!285107 m!299965))

(declare-fun m!299967 () Bool)

(assert (=> b!285116 m!299967))

(declare-fun m!299969 () Bool)

(assert (=> b!285114 m!299969))

(declare-fun m!299971 () Bool)

(assert (=> b!285114 m!299971))

(declare-fun m!299973 () Bool)

(assert (=> b!285114 m!299973))

(declare-fun m!299975 () Bool)

(assert (=> b!285109 m!299975))

(declare-fun m!299977 () Bool)

(assert (=> b!285115 m!299977))

(assert (=> b!285115 m!299977))

(declare-fun m!299979 () Bool)

(assert (=> b!285115 m!299979))

(declare-fun m!299981 () Bool)

(assert (=> b!285113 m!299981))

(declare-fun m!299983 () Bool)

(assert (=> b!285110 m!299983))

(declare-fun m!299985 () Bool)

(assert (=> start!27590 m!299985))

(declare-fun m!299987 () Bool)

(assert (=> start!27590 m!299987))

(check-sat (not start!27590) (not b!285115) (not b!285110) (not b!285114) (not b!285113) (not b!285112) (not b!285107) (not b!285116))
(check-sat)
(get-model)

(declare-fun d!65691 () Bool)

(assert (=> d!65691 (= (validKeyInArray!0 (select (arr!6759 a!3325) startIndex!26)) (and (not (= (select (arr!6759 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6759 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285115 d!65691))

(declare-fun d!65693 () Bool)

(assert (=> d!65693 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27590 d!65693))

(declare-fun d!65695 () Bool)

(assert (=> d!65695 (= (array_inv!4722 a!3325) (bvsge (size!7111 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27590 d!65695))

(declare-fun d!65697 () Bool)

(assert (=> d!65697 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285110 d!65697))

(declare-fun b!285163 () Bool)

(declare-fun e!180756 () Bool)

(declare-fun call!25539 () Bool)

(assert (=> b!285163 (= e!180756 call!25539)))

(declare-fun b!285164 () Bool)

(declare-fun e!180757 () Bool)

(assert (=> b!285164 (= e!180756 e!180757)))

(declare-fun lt!140719 () (_ BitVec 64))

(assert (=> b!285164 (= lt!140719 (select (arr!6759 lt!140695) startIndex!26))))

(declare-fun lt!140717 () Unit!9040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14240 (_ BitVec 64) (_ BitVec 32)) Unit!9040)

(assert (=> b!285164 (= lt!140717 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140695 lt!140719 startIndex!26))))

(assert (=> b!285164 (arrayContainsKey!0 lt!140695 lt!140719 #b00000000000000000000000000000000)))

(declare-fun lt!140718 () Unit!9040)

(assert (=> b!285164 (= lt!140718 lt!140717)))

(declare-fun res!147664 () Bool)

(assert (=> b!285164 (= res!147664 (= (seekEntryOrOpen!0 (select (arr!6759 lt!140695) startIndex!26) lt!140695 mask!3868) (Found!1917 startIndex!26)))))

(assert (=> b!285164 (=> (not res!147664) (not e!180757))))

(declare-fun bm!25536 () Bool)

(assert (=> bm!25536 (= call!25539 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140695 mask!3868))))

(declare-fun d!65701 () Bool)

(declare-fun res!147663 () Bool)

(declare-fun e!180758 () Bool)

(assert (=> d!65701 (=> res!147663 e!180758)))

(assert (=> d!65701 (= res!147663 (bvsge startIndex!26 (size!7111 lt!140695)))))

(assert (=> d!65701 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140695 mask!3868) e!180758)))

(declare-fun b!285165 () Bool)

(assert (=> b!285165 (= e!180757 call!25539)))

(declare-fun b!285166 () Bool)

(assert (=> b!285166 (= e!180758 e!180756)))

(declare-fun c!46304 () Bool)

(assert (=> b!285166 (= c!46304 (validKeyInArray!0 (select (arr!6759 lt!140695) startIndex!26)))))

(assert (= (and d!65701 (not res!147663)) b!285166))

(assert (= (and b!285166 c!46304) b!285164))

(assert (= (and b!285166 (not c!46304)) b!285163))

(assert (= (and b!285164 res!147664) b!285165))

(assert (= (or b!285165 b!285163) bm!25536))

(declare-fun m!300015 () Bool)

(assert (=> b!285164 m!300015))

(declare-fun m!300019 () Bool)

(assert (=> b!285164 m!300019))

(declare-fun m!300023 () Bool)

(assert (=> b!285164 m!300023))

(assert (=> b!285164 m!300015))

(declare-fun m!300027 () Bool)

(assert (=> b!285164 m!300027))

(declare-fun m!300029 () Bool)

(assert (=> bm!25536 m!300029))

(assert (=> b!285166 m!300015))

(assert (=> b!285166 m!300015))

(declare-fun m!300035 () Bool)

(assert (=> b!285166 m!300035))

(assert (=> b!285114 d!65701))

(declare-fun b!285171 () Bool)

(declare-fun e!180762 () Bool)

(declare-fun call!25541 () Bool)

(assert (=> b!285171 (= e!180762 call!25541)))

(declare-fun b!285172 () Bool)

(declare-fun e!180763 () Bool)

(assert (=> b!285172 (= e!180762 e!180763)))

(declare-fun lt!140725 () (_ BitVec 64))

(assert (=> b!285172 (= lt!140725 (select (arr!6759 lt!140695) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140723 () Unit!9040)

(assert (=> b!285172 (= lt!140723 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140695 lt!140725 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!285172 (arrayContainsKey!0 lt!140695 lt!140725 #b00000000000000000000000000000000)))

(declare-fun lt!140724 () Unit!9040)

(assert (=> b!285172 (= lt!140724 lt!140723)))

(declare-fun res!147668 () Bool)

(assert (=> b!285172 (= res!147668 (= (seekEntryOrOpen!0 (select (arr!6759 lt!140695) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!140695 mask!3868) (Found!1917 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!285172 (=> (not res!147668) (not e!180763))))

(declare-fun bm!25538 () Bool)

(assert (=> bm!25538 (= call!25541 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!140695 mask!3868))))

(declare-fun d!65705 () Bool)

(declare-fun res!147667 () Bool)

(declare-fun e!180764 () Bool)

(assert (=> d!65705 (=> res!147667 e!180764)))

(assert (=> d!65705 (= res!147667 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7111 lt!140695)))))

(assert (=> d!65705 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140695 mask!3868) e!180764)))

(declare-fun b!285173 () Bool)

(assert (=> b!285173 (= e!180763 call!25541)))

(declare-fun b!285174 () Bool)

(assert (=> b!285174 (= e!180764 e!180762)))

(declare-fun c!46306 () Bool)

(assert (=> b!285174 (= c!46306 (validKeyInArray!0 (select (arr!6759 lt!140695) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (= (and d!65705 (not res!147667)) b!285174))

(assert (= (and b!285174 c!46306) b!285172))

(assert (= (and b!285174 (not c!46306)) b!285171))

(assert (= (and b!285172 res!147668) b!285173))

(assert (= (or b!285173 b!285171) bm!25538))

(declare-fun m!300039 () Bool)

(assert (=> b!285172 m!300039))

(declare-fun m!300041 () Bool)

(assert (=> b!285172 m!300041))

(declare-fun m!300043 () Bool)

(assert (=> b!285172 m!300043))

(assert (=> b!285172 m!300039))

(declare-fun m!300045 () Bool)

(assert (=> b!285172 m!300045))

(declare-fun m!300047 () Bool)

(assert (=> bm!25538 m!300047))

(assert (=> b!285174 m!300039))

(assert (=> b!285174 m!300039))

(declare-fun m!300049 () Bool)

(assert (=> b!285174 m!300049))

(assert (=> b!285114 d!65705))

(declare-fun d!65709 () Bool)

(declare-fun e!180779 () Bool)

(assert (=> d!65709 e!180779))

(declare-fun res!147679 () Bool)

(assert (=> d!65709 (=> (not res!147679) (not e!180779))))

(assert (=> d!65709 (= res!147679 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7111 a!3325))))))

(declare-fun lt!140740 () Unit!9040)

(declare-fun choose!98 (array!14240 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9040)

(assert (=> d!65709 (= lt!140740 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65709 (validMask!0 mask!3868)))

(assert (=> d!65709 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140740)))

(declare-fun b!285193 () Bool)

(assert (=> b!285193 (= e!180779 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14241 (store (arr!6759 a!3325) i!1267 k0!2581) (size!7111 a!3325)) mask!3868))))

(assert (= (and d!65709 res!147679) b!285193))

(declare-fun m!300075 () Bool)

(assert (=> d!65709 m!300075))

(assert (=> d!65709 m!299985))

(assert (=> b!285193 m!299975))

(declare-fun m!300077 () Bool)

(assert (=> b!285193 m!300077))

(assert (=> b!285114 d!65709))

(declare-fun bm!25545 () Bool)

(declare-fun call!25548 () Bool)

(declare-fun c!46313 () Bool)

(assert (=> bm!25545 (= call!25548 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46313 (Cons!4563 (select (arr!6759 a!3325) #b00000000000000000000000000000000) Nil!4564) Nil!4564)))))

(declare-fun b!285207 () Bool)

(declare-fun e!180794 () Bool)

(assert (=> b!285207 (= e!180794 call!25548)))

(declare-fun b!285209 () Bool)

(declare-fun e!180791 () Bool)

(declare-fun e!180793 () Bool)

(assert (=> b!285209 (= e!180791 e!180793)))

(declare-fun res!147689 () Bool)

(assert (=> b!285209 (=> (not res!147689) (not e!180793))))

(declare-fun e!180792 () Bool)

(assert (=> b!285209 (= res!147689 (not e!180792))))

(declare-fun res!147691 () Bool)

(assert (=> b!285209 (=> (not res!147691) (not e!180792))))

(assert (=> b!285209 (= res!147691 (validKeyInArray!0 (select (arr!6759 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285208 () Bool)

(declare-fun contains!1996 (List!4567 (_ BitVec 64)) Bool)

(assert (=> b!285208 (= e!180792 (contains!1996 Nil!4564 (select (arr!6759 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65715 () Bool)

(declare-fun res!147690 () Bool)

(assert (=> d!65715 (=> res!147690 e!180791)))

(assert (=> d!65715 (= res!147690 (bvsge #b00000000000000000000000000000000 (size!7111 a!3325)))))

(assert (=> d!65715 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4564) e!180791)))

(declare-fun b!285210 () Bool)

(assert (=> b!285210 (= e!180793 e!180794)))

(assert (=> b!285210 (= c!46313 (validKeyInArray!0 (select (arr!6759 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285211 () Bool)

(assert (=> b!285211 (= e!180794 call!25548)))

(assert (= (and d!65715 (not res!147690)) b!285209))

(assert (= (and b!285209 res!147691) b!285208))

(assert (= (and b!285209 res!147689) b!285210))

(assert (= (and b!285210 c!46313) b!285207))

(assert (= (and b!285210 (not c!46313)) b!285211))

(assert (= (or b!285207 b!285211) bm!25545))

(declare-fun m!300083 () Bool)

(assert (=> bm!25545 m!300083))

(declare-fun m!300085 () Bool)

(assert (=> bm!25545 m!300085))

(assert (=> b!285209 m!300083))

(assert (=> b!285209 m!300083))

(declare-fun m!300087 () Bool)

(assert (=> b!285209 m!300087))

(assert (=> b!285208 m!300083))

(assert (=> b!285208 m!300083))

(declare-fun m!300089 () Bool)

(assert (=> b!285208 m!300089))

(assert (=> b!285210 m!300083))

(assert (=> b!285210 m!300083))

(assert (=> b!285210 m!300087))

(assert (=> b!285113 d!65715))

(declare-fun b!285256 () Bool)

(declare-fun e!180823 () SeekEntryResult!1917)

(declare-fun lt!140762 () SeekEntryResult!1917)

(assert (=> b!285256 (= e!180823 (Found!1917 (index!9840 lt!140762)))))

(declare-fun b!285257 () Bool)

(declare-fun e!180824 () SeekEntryResult!1917)

(assert (=> b!285257 (= e!180824 e!180823)))

(declare-fun lt!140763 () (_ BitVec 64))

(assert (=> b!285257 (= lt!140763 (select (arr!6759 a!3325) (index!9840 lt!140762)))))

(declare-fun c!46332 () Bool)

(assert (=> b!285257 (= c!46332 (= lt!140763 k0!2581))))

(declare-fun b!285258 () Bool)

(declare-fun e!180825 () SeekEntryResult!1917)

(assert (=> b!285258 (= e!180825 (MissingZero!1917 (index!9840 lt!140762)))))

(declare-fun b!285259 () Bool)

(assert (=> b!285259 (= e!180824 Undefined!1917)))

(declare-fun b!285260 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14240 (_ BitVec 32)) SeekEntryResult!1917)

(assert (=> b!285260 (= e!180825 (seekKeyOrZeroReturnVacant!0 (x!28036 lt!140762) (index!9840 lt!140762) (index!9840 lt!140762) k0!2581 a!3325 mask!3868))))

(declare-fun d!65725 () Bool)

(declare-fun lt!140764 () SeekEntryResult!1917)

(get-info :version)

(assert (=> d!65725 (and (or ((_ is Undefined!1917) lt!140764) (not ((_ is Found!1917) lt!140764)) (and (bvsge (index!9839 lt!140764) #b00000000000000000000000000000000) (bvslt (index!9839 lt!140764) (size!7111 a!3325)))) (or ((_ is Undefined!1917) lt!140764) ((_ is Found!1917) lt!140764) (not ((_ is MissingZero!1917) lt!140764)) (and (bvsge (index!9838 lt!140764) #b00000000000000000000000000000000) (bvslt (index!9838 lt!140764) (size!7111 a!3325)))) (or ((_ is Undefined!1917) lt!140764) ((_ is Found!1917) lt!140764) ((_ is MissingZero!1917) lt!140764) (not ((_ is MissingVacant!1917) lt!140764)) (and (bvsge (index!9841 lt!140764) #b00000000000000000000000000000000) (bvslt (index!9841 lt!140764) (size!7111 a!3325)))) (or ((_ is Undefined!1917) lt!140764) (ite ((_ is Found!1917) lt!140764) (= (select (arr!6759 a!3325) (index!9839 lt!140764)) k0!2581) (ite ((_ is MissingZero!1917) lt!140764) (= (select (arr!6759 a!3325) (index!9838 lt!140764)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1917) lt!140764) (= (select (arr!6759 a!3325) (index!9841 lt!140764)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65725 (= lt!140764 e!180824)))

(declare-fun c!46330 () Bool)

(assert (=> d!65725 (= c!46330 (and ((_ is Intermediate!1917) lt!140762) (undefined!2729 lt!140762)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14240 (_ BitVec 32)) SeekEntryResult!1917)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65725 (= lt!140762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65725 (validMask!0 mask!3868)))

(assert (=> d!65725 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140764)))

(declare-fun b!285261 () Bool)

(declare-fun c!46331 () Bool)

(assert (=> b!285261 (= c!46331 (= lt!140763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!285261 (= e!180823 e!180825)))

(assert (= (and d!65725 c!46330) b!285259))

(assert (= (and d!65725 (not c!46330)) b!285257))

(assert (= (and b!285257 c!46332) b!285256))

(assert (= (and b!285257 (not c!46332)) b!285261))

(assert (= (and b!285261 c!46331) b!285258))

(assert (= (and b!285261 (not c!46331)) b!285260))

(declare-fun m!300121 () Bool)

(assert (=> b!285257 m!300121))

(declare-fun m!300123 () Bool)

(assert (=> b!285260 m!300123))

(assert (=> d!65725 m!299985))

(declare-fun m!300125 () Bool)

(assert (=> d!65725 m!300125))

(declare-fun m!300127 () Bool)

(assert (=> d!65725 m!300127))

(assert (=> d!65725 m!300127))

(declare-fun m!300129 () Bool)

(assert (=> d!65725 m!300129))

(declare-fun m!300131 () Bool)

(assert (=> d!65725 m!300131))

(declare-fun m!300133 () Bool)

(assert (=> d!65725 m!300133))

(assert (=> b!285107 d!65725))

(declare-fun d!65743 () Bool)

(declare-fun res!147714 () Bool)

(declare-fun e!180838 () Bool)

(assert (=> d!65743 (=> res!147714 e!180838)))

(assert (=> d!65743 (= res!147714 (= (select (arr!6759 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65743 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!180838)))

(declare-fun b!285276 () Bool)

(declare-fun e!180839 () Bool)

(assert (=> b!285276 (= e!180838 e!180839)))

(declare-fun res!147715 () Bool)

(assert (=> b!285276 (=> (not res!147715) (not e!180839))))

(assert (=> b!285276 (= res!147715 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7111 a!3325)))))

(declare-fun b!285277 () Bool)

(assert (=> b!285277 (= e!180839 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65743 (not res!147714)) b!285276))

(assert (= (and b!285276 res!147715) b!285277))

(assert (=> d!65743 m!300083))

(declare-fun m!300159 () Bool)

(assert (=> b!285277 m!300159))

(assert (=> b!285112 d!65743))

(declare-fun b!285278 () Bool)

(declare-fun e!180840 () Bool)

(declare-fun call!25552 () Bool)

(assert (=> b!285278 (= e!180840 call!25552)))

(declare-fun b!285279 () Bool)

(declare-fun e!180841 () Bool)

(assert (=> b!285279 (= e!180840 e!180841)))

(declare-fun lt!140773 () (_ BitVec 64))

(assert (=> b!285279 (= lt!140773 (select (arr!6759 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140771 () Unit!9040)

(assert (=> b!285279 (= lt!140771 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140773 #b00000000000000000000000000000000))))

(assert (=> b!285279 (arrayContainsKey!0 a!3325 lt!140773 #b00000000000000000000000000000000)))

(declare-fun lt!140772 () Unit!9040)

(assert (=> b!285279 (= lt!140772 lt!140771)))

(declare-fun res!147717 () Bool)

(assert (=> b!285279 (= res!147717 (= (seekEntryOrOpen!0 (select (arr!6759 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1917 #b00000000000000000000000000000000)))))

(assert (=> b!285279 (=> (not res!147717) (not e!180841))))

(declare-fun bm!25549 () Bool)

(assert (=> bm!25549 (= call!25552 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65749 () Bool)

(declare-fun res!147716 () Bool)

(declare-fun e!180842 () Bool)

(assert (=> d!65749 (=> res!147716 e!180842)))

(assert (=> d!65749 (= res!147716 (bvsge #b00000000000000000000000000000000 (size!7111 a!3325)))))

(assert (=> d!65749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!180842)))

(declare-fun b!285280 () Bool)

(assert (=> b!285280 (= e!180841 call!25552)))

(declare-fun b!285281 () Bool)

(assert (=> b!285281 (= e!180842 e!180840)))

(declare-fun c!46335 () Bool)

(assert (=> b!285281 (= c!46335 (validKeyInArray!0 (select (arr!6759 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65749 (not res!147716)) b!285281))

(assert (= (and b!285281 c!46335) b!285279))

(assert (= (and b!285281 (not c!46335)) b!285278))

(assert (= (and b!285279 res!147717) b!285280))

(assert (= (or b!285280 b!285278) bm!25549))

(assert (=> b!285279 m!300083))

(declare-fun m!300161 () Bool)

(assert (=> b!285279 m!300161))

(declare-fun m!300163 () Bool)

(assert (=> b!285279 m!300163))

(assert (=> b!285279 m!300083))

(declare-fun m!300165 () Bool)

(assert (=> b!285279 m!300165))

(declare-fun m!300167 () Bool)

(assert (=> bm!25549 m!300167))

(assert (=> b!285281 m!300083))

(assert (=> b!285281 m!300083))

(assert (=> b!285281 m!300087))

(assert (=> b!285116 d!65749))

(check-sat (not b!285166) (not bm!25538) (not bm!25545) (not b!285172) (not b!285193) (not b!285210) (not b!285277) (not d!65725) (not b!285174) (not b!285209) (not d!65709) (not b!285260) (not b!285208) (not b!285164) (not bm!25549) (not bm!25536) (not b!285279) (not b!285281))
(check-sat)
