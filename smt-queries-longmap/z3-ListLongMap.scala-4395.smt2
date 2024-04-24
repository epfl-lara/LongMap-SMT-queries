; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60492 () Bool)

(assert start!60492)

(declare-fun b!679391 () Bool)

(declare-fun e!387093 () Bool)

(declare-datatypes ((List!12858 0))(
  ( (Nil!12855) (Cons!12854 (h!13902 (_ BitVec 64)) (t!19078 List!12858)) )
))
(declare-fun acc!681 () List!12858)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3510 (List!12858 (_ BitVec 64)) Bool)

(assert (=> b!679391 (= e!387093 (not (contains!3510 acc!681 k0!2843)))))

(declare-fun b!679392 () Bool)

(declare-fun res!445678 () Bool)

(declare-fun e!387088 () Bool)

(assert (=> b!679392 (=> (not res!445678) (not e!387088))))

(declare-datatypes ((array!39444 0))(
  ( (array!39445 (arr!18910 (Array (_ BitVec 32) (_ BitVec 64))) (size!19274 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39444)

(declare-fun arrayNoDuplicates!0 (array!39444 (_ BitVec 32) List!12858) Bool)

(assert (=> b!679392 (= res!445678 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12855))))

(declare-fun b!679393 () Bool)

(declare-fun res!445670 () Bool)

(assert (=> b!679393 (=> (not res!445670) (not e!387088))))

(assert (=> b!679393 (= res!445670 (not (contains!3510 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679394 () Bool)

(declare-fun res!445674 () Bool)

(assert (=> b!679394 (=> (not res!445674) (not e!387088))))

(assert (=> b!679394 (= res!445674 (not (contains!3510 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun e!387089 () Bool)

(declare-fun b!679395 () Bool)

(declare-fun arrayContainsKey!0 (array!39444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679395 (= e!387089 (arrayContainsKey!0 a!3626 k0!2843 from!3004))))

(declare-fun b!679396 () Bool)

(declare-fun res!445668 () Bool)

(assert (=> b!679396 (=> (not res!445668) (not e!387088))))

(assert (=> b!679396 (= res!445668 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679397 () Bool)

(declare-fun e!387090 () Bool)

(assert (=> b!679397 (= e!387090 e!387093)))

(declare-fun res!445667 () Bool)

(assert (=> b!679397 (=> (not res!445667) (not e!387093))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679397 (= res!445667 (bvsle from!3004 i!1382))))

(declare-fun b!679398 () Bool)

(declare-fun res!445671 () Bool)

(assert (=> b!679398 (=> (not res!445671) (not e!387088))))

(assert (=> b!679398 (= res!445671 e!387090)))

(declare-fun res!445673 () Bool)

(assert (=> b!679398 (=> res!445673 e!387090)))

(declare-fun e!387092 () Bool)

(assert (=> b!679398 (= res!445673 e!387092)))

(declare-fun res!445672 () Bool)

(assert (=> b!679398 (=> (not res!445672) (not e!387092))))

(assert (=> b!679398 (= res!445672 (bvsgt from!3004 i!1382))))

(declare-fun b!679399 () Bool)

(declare-fun res!445666 () Bool)

(assert (=> b!679399 (=> (not res!445666) (not e!387088))))

(assert (=> b!679399 (= res!445666 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19274 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679400 () Bool)

(assert (=> b!679400 (= e!387092 (contains!3510 acc!681 k0!2843))))

(declare-fun b!679401 () Bool)

(assert (=> b!679401 (= e!387088 (not e!387089))))

(declare-fun res!445675 () Bool)

(assert (=> b!679401 (=> res!445675 e!387089)))

(assert (=> b!679401 (= res!445675 (not (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!679401 (arrayContainsKey!0 (array!39445 (store (arr!18910 a!3626) i!1382 k0!2843) (size!19274 a!3626)) k0!2843 from!3004)))

(declare-fun b!679402 () Bool)

(declare-fun res!445677 () Bool)

(assert (=> b!679402 (=> (not res!445677) (not e!387088))))

(assert (=> b!679402 (= res!445677 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679403 () Bool)

(declare-fun res!445676 () Bool)

(assert (=> b!679403 (=> (not res!445676) (not e!387088))))

(declare-fun noDuplicate!784 (List!12858) Bool)

(assert (=> b!679403 (= res!445676 (noDuplicate!784 acc!681))))

(declare-fun res!445664 () Bool)

(assert (=> start!60492 (=> (not res!445664) (not e!387088))))

(assert (=> start!60492 (= res!445664 (and (bvslt (size!19274 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19274 a!3626))))))

(assert (=> start!60492 e!387088))

(assert (=> start!60492 true))

(declare-fun array_inv!14769 (array!39444) Bool)

(assert (=> start!60492 (array_inv!14769 a!3626)))

(declare-fun b!679404 () Bool)

(declare-fun res!445665 () Bool)

(assert (=> b!679404 (=> (not res!445665) (not e!387088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679404 (= res!445665 (validKeyInArray!0 k0!2843))))

(declare-fun b!679405 () Bool)

(declare-fun res!445669 () Bool)

(assert (=> b!679405 (=> (not res!445669) (not e!387088))))

(assert (=> b!679405 (= res!445669 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19274 a!3626))))))

(assert (= (and start!60492 res!445664) b!679403))

(assert (= (and b!679403 res!445676) b!679393))

(assert (= (and b!679393 res!445670) b!679394))

(assert (= (and b!679394 res!445674) b!679398))

(assert (= (and b!679398 res!445672) b!679400))

(assert (= (and b!679398 (not res!445673)) b!679397))

(assert (= (and b!679397 res!445667) b!679391))

(assert (= (and b!679398 res!445671) b!679392))

(assert (= (and b!679392 res!445678) b!679402))

(assert (= (and b!679402 res!445677) b!679405))

(assert (= (and b!679405 res!445669) b!679404))

(assert (= (and b!679404 res!445665) b!679396))

(assert (= (and b!679396 res!445668) b!679399))

(assert (= (and b!679399 res!445666) b!679401))

(assert (= (and b!679401 (not res!445675)) b!679395))

(declare-fun m!645343 () Bool)

(assert (=> b!679396 m!645343))

(declare-fun m!645345 () Bool)

(assert (=> b!679400 m!645345))

(declare-fun m!645347 () Bool)

(assert (=> b!679395 m!645347))

(declare-fun m!645349 () Bool)

(assert (=> b!679394 m!645349))

(declare-fun m!645351 () Bool)

(assert (=> b!679403 m!645351))

(declare-fun m!645353 () Bool)

(assert (=> b!679404 m!645353))

(declare-fun m!645355 () Bool)

(assert (=> b!679393 m!645355))

(assert (=> b!679391 m!645345))

(declare-fun m!645357 () Bool)

(assert (=> b!679402 m!645357))

(declare-fun m!645359 () Bool)

(assert (=> start!60492 m!645359))

(declare-fun m!645361 () Bool)

(assert (=> b!679392 m!645361))

(declare-fun m!645363 () Bool)

(assert (=> b!679401 m!645363))

(declare-fun m!645365 () Bool)

(assert (=> b!679401 m!645365))

(declare-fun m!645367 () Bool)

(assert (=> b!679401 m!645367))

(check-sat (not b!679391) (not b!679393) (not b!679404) (not b!679403) (not start!60492) (not b!679400) (not b!679402) (not b!679396) (not b!679394) (not b!679392) (not b!679395) (not b!679401))
(check-sat)
(get-model)

(declare-fun d!93611 () Bool)

(declare-fun lt!313018 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!265 (List!12858) (InoxSet (_ BitVec 64)))

(assert (=> d!93611 (= lt!313018 (select (content!265 acc!681) k0!2843))))

(declare-fun e!387145 () Bool)

(assert (=> d!93611 (= lt!313018 e!387145)))

(declare-fun res!445783 () Bool)

(assert (=> d!93611 (=> (not res!445783) (not e!387145))))

(get-info :version)

(assert (=> d!93611 (= res!445783 ((_ is Cons!12854) acc!681))))

(assert (=> d!93611 (= (contains!3510 acc!681 k0!2843) lt!313018)))

(declare-fun b!679510 () Bool)

(declare-fun e!387144 () Bool)

(assert (=> b!679510 (= e!387145 e!387144)))

(declare-fun res!445784 () Bool)

(assert (=> b!679510 (=> res!445784 e!387144)))

(assert (=> b!679510 (= res!445784 (= (h!13902 acc!681) k0!2843))))

(declare-fun b!679511 () Bool)

(assert (=> b!679511 (= e!387144 (contains!3510 (t!19078 acc!681) k0!2843))))

(assert (= (and d!93611 res!445783) b!679510))

(assert (= (and b!679510 (not res!445784)) b!679511))

(declare-fun m!645427 () Bool)

(assert (=> d!93611 m!645427))

(declare-fun m!645429 () Bool)

(assert (=> d!93611 m!645429))

(declare-fun m!645431 () Bool)

(assert (=> b!679511 m!645431))

(assert (=> b!679391 d!93611))

(declare-fun d!93615 () Bool)

(declare-fun res!445799 () Bool)

(declare-fun e!387160 () Bool)

(assert (=> d!93615 (=> res!445799 e!387160)))

(assert (=> d!93615 (= res!445799 (= (select (arr!18910 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93615 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387160)))

(declare-fun b!679526 () Bool)

(declare-fun e!387161 () Bool)

(assert (=> b!679526 (= e!387160 e!387161)))

(declare-fun res!445800 () Bool)

(assert (=> b!679526 (=> (not res!445800) (not e!387161))))

(assert (=> b!679526 (= res!445800 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19274 a!3626)))))

(declare-fun b!679527 () Bool)

(assert (=> b!679527 (= e!387161 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93615 (not res!445799)) b!679526))

(assert (= (and b!679526 res!445800) b!679527))

(declare-fun m!645453 () Bool)

(assert (=> d!93615 m!645453))

(declare-fun m!645455 () Bool)

(assert (=> b!679527 m!645455))

(assert (=> b!679401 d!93615))

(declare-fun d!93627 () Bool)

(declare-fun res!445801 () Bool)

(declare-fun e!387162 () Bool)

(assert (=> d!93627 (=> res!445801 e!387162)))

(assert (=> d!93627 (= res!445801 (= (select (arr!18910 (array!39445 (store (arr!18910 a!3626) i!1382 k0!2843) (size!19274 a!3626))) from!3004) k0!2843))))

(assert (=> d!93627 (= (arrayContainsKey!0 (array!39445 (store (arr!18910 a!3626) i!1382 k0!2843) (size!19274 a!3626)) k0!2843 from!3004) e!387162)))

(declare-fun b!679528 () Bool)

(declare-fun e!387163 () Bool)

(assert (=> b!679528 (= e!387162 e!387163)))

(declare-fun res!445802 () Bool)

(assert (=> b!679528 (=> (not res!445802) (not e!387163))))

(assert (=> b!679528 (= res!445802 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19274 (array!39445 (store (arr!18910 a!3626) i!1382 k0!2843) (size!19274 a!3626)))))))

(declare-fun b!679529 () Bool)

(assert (=> b!679529 (= e!387163 (arrayContainsKey!0 (array!39445 (store (arr!18910 a!3626) i!1382 k0!2843) (size!19274 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93627 (not res!445801)) b!679528))

(assert (= (and b!679528 res!445802) b!679529))

(declare-fun m!645458 () Bool)

(assert (=> d!93627 m!645458))

(declare-fun m!645463 () Bool)

(assert (=> b!679529 m!645463))

(assert (=> b!679401 d!93627))

(declare-fun d!93633 () Bool)

(declare-fun res!445813 () Bool)

(declare-fun e!387174 () Bool)

(assert (=> d!93633 (=> res!445813 e!387174)))

(assert (=> d!93633 (= res!445813 ((_ is Nil!12855) acc!681))))

(assert (=> d!93633 (= (noDuplicate!784 acc!681) e!387174)))

(declare-fun b!679540 () Bool)

(declare-fun e!387175 () Bool)

(assert (=> b!679540 (= e!387174 e!387175)))

(declare-fun res!445814 () Bool)

(assert (=> b!679540 (=> (not res!445814) (not e!387175))))

(assert (=> b!679540 (= res!445814 (not (contains!3510 (t!19078 acc!681) (h!13902 acc!681))))))

(declare-fun b!679541 () Bool)

(assert (=> b!679541 (= e!387175 (noDuplicate!784 (t!19078 acc!681)))))

(assert (= (and d!93633 (not res!445813)) b!679540))

(assert (= (and b!679540 res!445814) b!679541))

(declare-fun m!645465 () Bool)

(assert (=> b!679540 m!645465))

(declare-fun m!645467 () Bool)

(assert (=> b!679541 m!645467))

(assert (=> b!679403 d!93633))

(declare-fun b!679570 () Bool)

(declare-fun e!387203 () Bool)

(declare-fun call!33938 () Bool)

(assert (=> b!679570 (= e!387203 call!33938)))

(declare-fun bm!33935 () Bool)

(declare-fun c!77236 () Bool)

(assert (=> bm!33935 (= call!33938 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77236 (Cons!12854 (select (arr!18910 a!3626) #b00000000000000000000000000000000) Nil!12855) Nil!12855)))))

(declare-fun d!93637 () Bool)

(declare-fun res!445836 () Bool)

(declare-fun e!387202 () Bool)

(assert (=> d!93637 (=> res!445836 e!387202)))

(assert (=> d!93637 (= res!445836 (bvsge #b00000000000000000000000000000000 (size!19274 a!3626)))))

(assert (=> d!93637 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12855) e!387202)))

(declare-fun b!679571 () Bool)

(declare-fun e!387201 () Bool)

(assert (=> b!679571 (= e!387201 (contains!3510 Nil!12855 (select (arr!18910 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!679572 () Bool)

(declare-fun e!387200 () Bool)

(assert (=> b!679572 (= e!387200 e!387203)))

(assert (=> b!679572 (= c!77236 (validKeyInArray!0 (select (arr!18910 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!679573 () Bool)

(assert (=> b!679573 (= e!387203 call!33938)))

(declare-fun b!679574 () Bool)

(assert (=> b!679574 (= e!387202 e!387200)))

(declare-fun res!445835 () Bool)

(assert (=> b!679574 (=> (not res!445835) (not e!387200))))

(assert (=> b!679574 (= res!445835 (not e!387201))))

(declare-fun res!445837 () Bool)

(assert (=> b!679574 (=> (not res!445837) (not e!387201))))

(assert (=> b!679574 (= res!445837 (validKeyInArray!0 (select (arr!18910 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93637 (not res!445836)) b!679574))

(assert (= (and b!679574 res!445837) b!679571))

(assert (= (and b!679574 res!445835) b!679572))

(assert (= (and b!679572 c!77236) b!679570))

(assert (= (and b!679572 (not c!77236)) b!679573))

(assert (= (or b!679570 b!679573) bm!33935))

(declare-fun m!645477 () Bool)

(assert (=> bm!33935 m!645477))

(declare-fun m!645479 () Bool)

(assert (=> bm!33935 m!645479))

(assert (=> b!679571 m!645477))

(assert (=> b!679571 m!645477))

(declare-fun m!645481 () Bool)

(assert (=> b!679571 m!645481))

(assert (=> b!679572 m!645477))

(assert (=> b!679572 m!645477))

(declare-fun m!645483 () Bool)

(assert (=> b!679572 m!645483))

(assert (=> b!679574 m!645477))

(assert (=> b!679574 m!645477))

(assert (=> b!679574 m!645483))

(assert (=> b!679392 d!93637))

(declare-fun b!679580 () Bool)

(declare-fun e!387211 () Bool)

(declare-fun call!33940 () Bool)

(assert (=> b!679580 (= e!387211 call!33940)))

(declare-fun c!77238 () Bool)

(declare-fun bm!33937 () Bool)

(assert (=> bm!33937 (= call!33940 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77238 (Cons!12854 (select (arr!18910 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!93645 () Bool)

(declare-fun res!445842 () Bool)

(declare-fun e!387210 () Bool)

(assert (=> d!93645 (=> res!445842 e!387210)))

(assert (=> d!93645 (= res!445842 (bvsge from!3004 (size!19274 a!3626)))))

(assert (=> d!93645 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387210)))

(declare-fun e!387209 () Bool)

(declare-fun b!679581 () Bool)

(assert (=> b!679581 (= e!387209 (contains!3510 acc!681 (select (arr!18910 a!3626) from!3004)))))

(declare-fun b!679582 () Bool)

(declare-fun e!387208 () Bool)

(assert (=> b!679582 (= e!387208 e!387211)))

(assert (=> b!679582 (= c!77238 (validKeyInArray!0 (select (arr!18910 a!3626) from!3004)))))

(declare-fun b!679583 () Bool)

(assert (=> b!679583 (= e!387211 call!33940)))

(declare-fun b!679584 () Bool)

(assert (=> b!679584 (= e!387210 e!387208)))

(declare-fun res!445841 () Bool)

(assert (=> b!679584 (=> (not res!445841) (not e!387208))))

(assert (=> b!679584 (= res!445841 (not e!387209))))

(declare-fun res!445843 () Bool)

(assert (=> b!679584 (=> (not res!445843) (not e!387209))))

(assert (=> b!679584 (= res!445843 (validKeyInArray!0 (select (arr!18910 a!3626) from!3004)))))

(assert (= (and d!93645 (not res!445842)) b!679584))

(assert (= (and b!679584 res!445843) b!679581))

(assert (= (and b!679584 res!445841) b!679582))

(assert (= (and b!679582 c!77238) b!679580))

(assert (= (and b!679582 (not c!77238)) b!679583))

(assert (= (or b!679580 b!679583) bm!33937))

(declare-fun m!645491 () Bool)

(assert (=> bm!33937 m!645491))

(declare-fun m!645493 () Bool)

(assert (=> bm!33937 m!645493))

(assert (=> b!679581 m!645491))

(assert (=> b!679581 m!645491))

(declare-fun m!645495 () Bool)

(assert (=> b!679581 m!645495))

(assert (=> b!679582 m!645491))

(assert (=> b!679582 m!645491))

(declare-fun m!645497 () Bool)

(assert (=> b!679582 m!645497))

(assert (=> b!679584 m!645491))

(assert (=> b!679584 m!645491))

(assert (=> b!679584 m!645497))

(assert (=> b!679402 d!93645))

(assert (=> b!679400 d!93611))

(declare-fun d!93649 () Bool)

(declare-fun res!445853 () Bool)

(declare-fun e!387224 () Bool)

(assert (=> d!93649 (=> res!445853 e!387224)))

(assert (=> d!93649 (= res!445853 (= (select (arr!18910 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93649 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!387224)))

(declare-fun b!679600 () Bool)

(declare-fun e!387225 () Bool)

(assert (=> b!679600 (= e!387224 e!387225)))

(declare-fun res!445854 () Bool)

(assert (=> b!679600 (=> (not res!445854) (not e!387225))))

(assert (=> b!679600 (= res!445854 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19274 a!3626)))))

(declare-fun b!679601 () Bool)

(assert (=> b!679601 (= e!387225 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93649 (not res!445853)) b!679600))

(assert (= (and b!679600 res!445854) b!679601))

(assert (=> d!93649 m!645477))

(declare-fun m!645505 () Bool)

(assert (=> b!679601 m!645505))

(assert (=> b!679396 d!93649))

(declare-fun d!93651 () Bool)

(assert (=> d!93651 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!679404 d!93651))

(declare-fun d!93653 () Bool)

(declare-fun lt!313021 () Bool)

(assert (=> d!93653 (= lt!313021 (select (content!265 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387227 () Bool)

(assert (=> d!93653 (= lt!313021 e!387227)))

(declare-fun res!445855 () Bool)

(assert (=> d!93653 (=> (not res!445855) (not e!387227))))

(assert (=> d!93653 (= res!445855 ((_ is Cons!12854) acc!681))))

(assert (=> d!93653 (= (contains!3510 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313021)))

(declare-fun b!679602 () Bool)

(declare-fun e!387226 () Bool)

(assert (=> b!679602 (= e!387227 e!387226)))

(declare-fun res!445856 () Bool)

(assert (=> b!679602 (=> res!445856 e!387226)))

(assert (=> b!679602 (= res!445856 (= (h!13902 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!679603 () Bool)

(assert (=> b!679603 (= e!387226 (contains!3510 (t!19078 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93653 res!445855) b!679602))

(assert (= (and b!679602 (not res!445856)) b!679603))

(assert (=> d!93653 m!645427))

(declare-fun m!645507 () Bool)

(assert (=> d!93653 m!645507))

(declare-fun m!645509 () Bool)

(assert (=> b!679603 m!645509))

(assert (=> b!679393 d!93653))

(declare-fun d!93655 () Bool)

(assert (=> d!93655 (= (array_inv!14769 a!3626) (bvsge (size!19274 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60492 d!93655))

(declare-fun d!93657 () Bool)

(declare-fun res!445857 () Bool)

(declare-fun e!387228 () Bool)

(assert (=> d!93657 (=> res!445857 e!387228)))

(assert (=> d!93657 (= res!445857 (= (select (arr!18910 a!3626) from!3004) k0!2843))))

(assert (=> d!93657 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!387228)))

(declare-fun b!679604 () Bool)

(declare-fun e!387229 () Bool)

(assert (=> b!679604 (= e!387228 e!387229)))

(declare-fun res!445858 () Bool)

(assert (=> b!679604 (=> (not res!445858) (not e!387229))))

(assert (=> b!679604 (= res!445858 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19274 a!3626)))))

(declare-fun b!679605 () Bool)

(assert (=> b!679605 (= e!387229 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93657 (not res!445857)) b!679604))

(assert (= (and b!679604 res!445858) b!679605))

(assert (=> d!93657 m!645491))

(declare-fun m!645511 () Bool)

(assert (=> b!679605 m!645511))

(assert (=> b!679395 d!93657))

(declare-fun d!93659 () Bool)

(declare-fun lt!313022 () Bool)

(assert (=> d!93659 (= lt!313022 (select (content!265 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387235 () Bool)

(assert (=> d!93659 (= lt!313022 e!387235)))

(declare-fun res!445862 () Bool)

(assert (=> d!93659 (=> (not res!445862) (not e!387235))))

(assert (=> d!93659 (= res!445862 ((_ is Cons!12854) acc!681))))

(assert (=> d!93659 (= (contains!3510 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313022)))

(declare-fun b!679611 () Bool)

(declare-fun e!387234 () Bool)

(assert (=> b!679611 (= e!387235 e!387234)))

(declare-fun res!445863 () Bool)

(assert (=> b!679611 (=> res!445863 e!387234)))

(assert (=> b!679611 (= res!445863 (= (h!13902 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!679612 () Bool)

(assert (=> b!679612 (= e!387234 (contains!3510 (t!19078 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93659 res!445862) b!679611))

(assert (= (and b!679611 (not res!445863)) b!679612))

(assert (=> d!93659 m!645427))

(declare-fun m!645513 () Bool)

(assert (=> d!93659 m!645513))

(declare-fun m!645515 () Bool)

(assert (=> b!679612 m!645515))

(assert (=> b!679394 d!93659))

(check-sat (not b!679540) (not b!679574) (not b!679511) (not b!679572) (not b!679584) (not b!679603) (not d!93611) (not b!679529) (not b!679605) (not b!679581) (not b!679541) (not b!679612) (not b!679527) (not d!93653) (not b!679582) (not bm!33935) (not b!679601) (not d!93659) (not bm!33937) (not b!679571))
(check-sat)
