; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26856 () Bool)

(assert start!26856)

(declare-fun b!278610 () Bool)

(declare-fun res!142041 () Bool)

(declare-fun e!177696 () Bool)

(assert (=> b!278610 (=> (not res!142041) (not e!177696))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278610 (= res!142041 (not (= startIndex!26 i!1267)))))

(declare-fun b!278611 () Bool)

(declare-fun e!177698 () Bool)

(assert (=> b!278611 (= e!177698 e!177696)))

(declare-fun res!142039 () Bool)

(assert (=> b!278611 (=> (not res!142039) (not e!177696))))

(declare-datatypes ((SeekEntryResult!1736 0))(
  ( (MissingZero!1736 (index!9114 (_ BitVec 32))) (Found!1736 (index!9115 (_ BitVec 32))) (Intermediate!1736 (undefined!2548 Bool) (index!9116 (_ BitVec 32)) (x!27366 (_ BitVec 32))) (Undefined!1736) (MissingVacant!1736 (index!9117 (_ BitVec 32))) )
))
(declare-fun lt!138430 () SeekEntryResult!1736)

(assert (=> b!278611 (= res!142039 (or (= lt!138430 (MissingZero!1736 i!1267)) (= lt!138430 (MissingVacant!1736 i!1267))))))

(declare-datatypes ((array!13860 0))(
  ( (array!13861 (arr!6578 (Array (_ BitVec 32) (_ BitVec 64))) (size!6930 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13860)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13860 (_ BitVec 32)) SeekEntryResult!1736)

(assert (=> b!278611 (= lt!138430 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!278612 () Bool)

(declare-fun res!142042 () Bool)

(assert (=> b!278612 (=> (not res!142042) (not e!177696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13860 (_ BitVec 32)) Bool)

(assert (=> b!278612 (= res!142042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278613 () Bool)

(declare-fun res!142043 () Bool)

(assert (=> b!278613 (=> (not res!142043) (not e!177698))))

(declare-fun arrayContainsKey!0 (array!13860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278613 (= res!142043 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278614 () Bool)

(declare-fun res!142044 () Bool)

(assert (=> b!278614 (=> (not res!142044) (not e!177698))))

(declare-datatypes ((List!4386 0))(
  ( (Nil!4383) (Cons!4382 (h!5052 (_ BitVec 64)) (t!9468 List!4386)) )
))
(declare-fun arrayNoDuplicates!0 (array!13860 (_ BitVec 32) List!4386) Bool)

(assert (=> b!278614 (= res!142044 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4383))))

(declare-fun res!142045 () Bool)

(assert (=> start!26856 (=> (not res!142045) (not e!177698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26856 (= res!142045 (validMask!0 mask!3868))))

(assert (=> start!26856 e!177698))

(declare-fun array_inv!4541 (array!13860) Bool)

(assert (=> start!26856 (array_inv!4541 a!3325)))

(assert (=> start!26856 true))

(declare-fun b!278615 () Bool)

(declare-fun res!142040 () Bool)

(assert (=> b!278615 (=> (not res!142040) (not e!177698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278615 (= res!142040 (validKeyInArray!0 k!2581))))

(declare-fun b!278616 () Bool)

(declare-fun res!142046 () Bool)

(assert (=> b!278616 (=> (not res!142046) (not e!177698))))

(assert (=> b!278616 (= res!142046 (and (= (size!6930 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6930 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6930 a!3325))))))

(declare-fun b!278617 () Bool)

(assert (=> b!278617 (= e!177696 (bvsge (size!6930 a!3325) #b01111111111111111111111111111111))))

(declare-fun b!278618 () Bool)

(declare-fun res!142047 () Bool)

(assert (=> b!278618 (=> (not res!142047) (not e!177696))))

(assert (=> b!278618 (= res!142047 (validKeyInArray!0 (select (arr!6578 a!3325) startIndex!26)))))

(assert (= (and start!26856 res!142045) b!278616))

(assert (= (and b!278616 res!142046) b!278615))

(assert (= (and b!278615 res!142040) b!278614))

(assert (= (and b!278614 res!142044) b!278613))

(assert (= (and b!278613 res!142043) b!278611))

(assert (= (and b!278611 res!142039) b!278612))

(assert (= (and b!278612 res!142042) b!278610))

(assert (= (and b!278610 res!142041) b!278618))

(assert (= (and b!278618 res!142047) b!278617))

(declare-fun m!293637 () Bool)

(assert (=> start!26856 m!293637))

(declare-fun m!293639 () Bool)

(assert (=> start!26856 m!293639))

(declare-fun m!293641 () Bool)

(assert (=> b!278613 m!293641))

(declare-fun m!293643 () Bool)

(assert (=> b!278612 m!293643))

(declare-fun m!293645 () Bool)

(assert (=> b!278618 m!293645))

(assert (=> b!278618 m!293645))

(declare-fun m!293647 () Bool)

(assert (=> b!278618 m!293647))

(declare-fun m!293649 () Bool)

(assert (=> b!278615 m!293649))

(declare-fun m!293651 () Bool)

(assert (=> b!278614 m!293651))

(declare-fun m!293653 () Bool)

(assert (=> b!278611 m!293653))

(push 1)

(assert (not b!278618))

(assert (not b!278614))

(assert (not b!278612))

(assert (not b!278611))

(assert (not b!278615))

(assert (not b!278613))

(assert (not start!26856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!278708 () Bool)

(declare-fun e!177748 () Bool)

(declare-fun e!177745 () Bool)

(assert (=> b!278708 (= e!177748 e!177745)))

(declare-fun c!45845 () Bool)

(assert (=> b!278708 (= c!45845 (validKeyInArray!0 (select (arr!6578 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278709 () Bool)

(declare-fun e!177746 () Bool)

(assert (=> b!278709 (= e!177746 e!177748)))

(declare-fun res!142124 () Bool)

(assert (=> b!278709 (=> (not res!142124) (not e!177748))))

(declare-fun e!177747 () Bool)

(assert (=> b!278709 (= res!142124 (not e!177747))))

(declare-fun res!142123 () Bool)

(assert (=> b!278709 (=> (not res!142123) (not e!177747))))

(assert (=> b!278709 (= res!142123 (validKeyInArray!0 (select (arr!6578 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64933 () Bool)

(declare-fun res!142125 () Bool)

(assert (=> d!64933 (=> res!142125 e!177746)))

(assert (=> d!64933 (= res!142125 (bvsge #b00000000000000000000000000000000 (size!6930 a!3325)))))

(assert (=> d!64933 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4383) e!177746)))

(declare-fun b!278710 () Bool)

(declare-fun call!25395 () Bool)

(assert (=> b!278710 (= e!177745 call!25395)))

(declare-fun bm!25392 () Bool)

(assert (=> bm!25392 (= call!25395 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45845 (Cons!4382 (select (arr!6578 a!3325) #b00000000000000000000000000000000) Nil!4383) Nil!4383)))))

(declare-fun b!278711 () Bool)

(declare-fun contains!1966 (List!4386 (_ BitVec 64)) Bool)

(assert (=> b!278711 (= e!177747 (contains!1966 Nil!4383 (select (arr!6578 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278712 () Bool)

(assert (=> b!278712 (= e!177745 call!25395)))

(assert (= (and d!64933 (not res!142125)) b!278709))

(assert (= (and b!278709 res!142123) b!278711))

(assert (= (and b!278709 res!142124) b!278708))

(assert (= (and b!278708 c!45845) b!278710))

(assert (= (and b!278708 (not c!45845)) b!278712))

(assert (= (or b!278710 b!278712) bm!25392))

(declare-fun m!293699 () Bool)

(assert (=> b!278708 m!293699))

(assert (=> b!278708 m!293699))

(declare-fun m!293701 () Bool)

(assert (=> b!278708 m!293701))

(assert (=> b!278709 m!293699))

(assert (=> b!278709 m!293699))

(assert (=> b!278709 m!293701))

(assert (=> bm!25392 m!293699))

(declare-fun m!293703 () Bool)

(assert (=> bm!25392 m!293703))

(assert (=> b!278711 m!293699))

(assert (=> b!278711 m!293699))

(declare-fun m!293705 () Bool)

(assert (=> b!278711 m!293705))

(assert (=> b!278614 d!64933))

(declare-fun d!64937 () Bool)

(assert (=> d!64937 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26856 d!64937))

(declare-fun d!64947 () Bool)

(assert (=> d!64947 (= (array_inv!4541 a!3325) (bvsge (size!6930 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26856 d!64947))

(declare-fun d!64949 () Bool)

(assert (=> d!64949 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278615 d!64949))

(declare-fun b!278756 () Bool)

(declare-fun e!177782 () Bool)

(declare-fun e!177780 () Bool)

(assert (=> b!278756 (= e!177782 e!177780)))

(declare-fun lt!138459 () (_ BitVec 64))

(assert (=> b!278756 (= lt!138459 (select (arr!6578 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8800 0))(
  ( (Unit!8801) )
))
(declare-fun lt!138460 () Unit!8800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13860 (_ BitVec 64) (_ BitVec 32)) Unit!8800)

(assert (=> b!278756 (= lt!138460 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138459 #b00000000000000000000000000000000))))

(assert (=> b!278756 (arrayContainsKey!0 a!3325 lt!138459 #b00000000000000000000000000000000)))

(declare-fun lt!138458 () Unit!8800)

(assert (=> b!278756 (= lt!138458 lt!138460)))

(declare-fun res!142146 () Bool)

(assert (=> b!278756 (= res!142146 (= (seekEntryOrOpen!0 (select (arr!6578 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1736 #b00000000000000000000000000000000)))))

(assert (=> b!278756 (=> (not res!142146) (not e!177780))))

(declare-fun b!278758 () Bool)

(declare-fun call!25402 () Bool)

(assert (=> b!278758 (= e!177782 call!25402)))

(declare-fun b!278759 () Bool)

(declare-fun e!177781 () Bool)

(assert (=> b!278759 (= e!177781 e!177782)))

(declare-fun c!45858 () Bool)

(assert (=> b!278759 (= c!45858 (validKeyInArray!0 (select (arr!6578 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25399 () Bool)

(assert (=> bm!25399 (= call!25402 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!64953 () Bool)

(declare-fun res!142145 () Bool)

(assert (=> d!64953 (=> res!142145 e!177781)))

(assert (=> d!64953 (= res!142145 (bvsge #b00000000000000000000000000000000 (size!6930 a!3325)))))

(assert (=> d!64953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177781)))

(declare-fun b!278757 () Bool)

(assert (=> b!278757 (= e!177780 call!25402)))

(assert (= (and d!64953 (not res!142145)) b!278759))

(assert (= (and b!278759 c!45858) b!278756))

(assert (= (and b!278759 (not c!45858)) b!278758))

(assert (= (and b!278756 res!142146) b!278757))

(assert (= (or b!278757 b!278758) bm!25399))

(assert (=> b!278756 m!293699))

(declare-fun m!293725 () Bool)

(assert (=> b!278756 m!293725))

(declare-fun m!293727 () Bool)

(assert (=> b!278756 m!293727))

(assert (=> b!278756 m!293699))

(declare-fun m!293729 () Bool)

(assert (=> b!278756 m!293729))

(assert (=> b!278759 m!293699))

(assert (=> b!278759 m!293699))

(assert (=> b!278759 m!293701))

(declare-fun m!293731 () Bool)

(assert (=> bm!25399 m!293731))

(assert (=> b!278612 d!64953))

(declare-fun e!177818 () SeekEntryResult!1736)

(declare-fun lt!138488 () SeekEntryResult!1736)

(declare-fun b!278814 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13860 (_ BitVec 32)) SeekEntryResult!1736)

(assert (=> b!278814 (= e!177818 (seekKeyOrZeroReturnVacant!0 (x!27366 lt!138488) (index!9116 lt!138488) (index!9116 lt!138488) k!2581 a!3325 mask!3868))))

(declare-fun b!278815 () Bool)

(declare-fun e!177816 () SeekEntryResult!1736)

(assert (=> b!278815 (= e!177816 Undefined!1736)))

(declare-fun d!64957 () Bool)

(declare-fun lt!138490 () SeekEntryResult!1736)

(assert (=> d!64957 (and (or (is-Undefined!1736 lt!138490) (not (is-Found!1736 lt!138490)) (and (bvsge (index!9115 lt!138490) #b00000000000000000000000000000000) (bvslt (index!9115 lt!138490) (size!6930 a!3325)))) (or (is-Undefined!1736 lt!138490) (is-Found!1736 lt!138490) (not (is-MissingZero!1736 lt!138490)) (and (bvsge (index!9114 lt!138490) #b00000000000000000000000000000000) (bvslt (index!9114 lt!138490) (size!6930 a!3325)))) (or (is-Undefined!1736 lt!138490) (is-Found!1736 lt!138490) (is-MissingZero!1736 lt!138490) (not (is-MissingVacant!1736 lt!138490)) (and (bvsge (index!9117 lt!138490) #b00000000000000000000000000000000) (bvslt (index!9117 lt!138490) (size!6930 a!3325)))) (or (is-Undefined!1736 lt!138490) (ite (is-Found!1736 lt!138490) (= (select (arr!6578 a!3325) (index!9115 lt!138490)) k!2581) (ite (is-MissingZero!1736 lt!138490) (= (select (arr!6578 a!3325) (index!9114 lt!138490)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1736 lt!138490) (= (select (arr!6578 a!3325) (index!9117 lt!138490)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64957 (= lt!138490 e!177816)))

(declare-fun c!45882 () Bool)

(assert (=> d!64957 (= c!45882 (and (is-Intermediate!1736 lt!138488) (undefined!2548 lt!138488)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13860 (_ BitVec 32)) SeekEntryResult!1736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64957 (= lt!138488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!64957 (validMask!0 mask!3868)))

(assert (=> d!64957 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!138490)))

(declare-fun b!278816 () Bool)

(declare-fun c!45880 () Bool)

(declare-fun lt!138489 () (_ BitVec 64))

(assert (=> b!278816 (= c!45880 (= lt!138489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177817 () SeekEntryResult!1736)

(assert (=> b!278816 (= e!177817 e!177818)))

(declare-fun b!278817 () Bool)

(assert (=> b!278817 (= e!177818 (MissingZero!1736 (index!9116 lt!138488)))))

(declare-fun b!278818 () Bool)

(assert (=> b!278818 (= e!177816 e!177817)))

(assert (=> b!278818 (= lt!138489 (select (arr!6578 a!3325) (index!9116 lt!138488)))))

(declare-fun c!45881 () Bool)

(assert (=> b!278818 (= c!45881 (= lt!138489 k!2581))))

(declare-fun b!278819 () Bool)

(assert (=> b!278819 (= e!177817 (Found!1736 (index!9116 lt!138488)))))

(assert (= (and d!64957 c!45882) b!278815))

(assert (= (and d!64957 (not c!45882)) b!278818))

(assert (= (and b!278818 c!45881) b!278819))

(assert (= (and b!278818 (not c!45881)) b!278816))

(assert (= (and b!278816 c!45880) b!278817))

