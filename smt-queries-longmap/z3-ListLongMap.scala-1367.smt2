; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26858 () Bool)

(assert start!26858)

(declare-fun b!278463 () Bool)

(declare-fun res!141948 () Bool)

(declare-fun e!177596 () Bool)

(assert (=> b!278463 (=> (not res!141948) (not e!177596))))

(declare-datatypes ((array!13851 0))(
  ( (array!13852 (arr!6573 (Array (_ BitVec 32) (_ BitVec 64))) (size!6926 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13851)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278463 (= res!141948 (validKeyInArray!0 (select (arr!6573 a!3325) startIndex!26)))))

(declare-fun b!278464 () Bool)

(declare-fun e!177597 () Bool)

(assert (=> b!278464 (= e!177597 e!177596)))

(declare-fun res!141951 () Bool)

(assert (=> b!278464 (=> (not res!141951) (not e!177596))))

(declare-datatypes ((SeekEntryResult!1730 0))(
  ( (MissingZero!1730 (index!9090 (_ BitVec 32))) (Found!1730 (index!9091 (_ BitVec 32))) (Intermediate!1730 (undefined!2542 Bool) (index!9092 (_ BitVec 32)) (x!27359 (_ BitVec 32))) (Undefined!1730) (MissingVacant!1730 (index!9093 (_ BitVec 32))) )
))
(declare-fun lt!138249 () SeekEntryResult!1730)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278464 (= res!141951 (or (= lt!138249 (MissingZero!1730 i!1267)) (= lt!138249 (MissingVacant!1730 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13851 (_ BitVec 32)) SeekEntryResult!1730)

(assert (=> b!278464 (= lt!138249 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!278465 () Bool)

(assert (=> b!278465 (= e!177596 (bvsge (size!6926 a!3325) #b01111111111111111111111111111111))))

(declare-fun b!278467 () Bool)

(declare-fun res!141947 () Bool)

(assert (=> b!278467 (=> (not res!141947) (not e!177597))))

(assert (=> b!278467 (= res!141947 (and (= (size!6926 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6926 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6926 a!3325))))))

(declare-fun b!278468 () Bool)

(declare-fun res!141945 () Bool)

(assert (=> b!278468 (=> (not res!141945) (not e!177597))))

(declare-fun arrayContainsKey!0 (array!13851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278468 (= res!141945 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278469 () Bool)

(declare-fun res!141949 () Bool)

(assert (=> b!278469 (=> (not res!141949) (not e!177596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13851 (_ BitVec 32)) Bool)

(assert (=> b!278469 (= res!141949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278466 () Bool)

(declare-fun res!141944 () Bool)

(assert (=> b!278466 (=> (not res!141944) (not e!177597))))

(declare-datatypes ((List!4354 0))(
  ( (Nil!4351) (Cons!4350 (h!5020 (_ BitVec 64)) (t!9427 List!4354)) )
))
(declare-fun arrayNoDuplicates!0 (array!13851 (_ BitVec 32) List!4354) Bool)

(assert (=> b!278466 (= res!141944 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4351))))

(declare-fun res!141952 () Bool)

(assert (=> start!26858 (=> (not res!141952) (not e!177597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26858 (= res!141952 (validMask!0 mask!3868))))

(assert (=> start!26858 e!177597))

(declare-fun array_inv!4545 (array!13851) Bool)

(assert (=> start!26858 (array_inv!4545 a!3325)))

(assert (=> start!26858 true))

(declare-fun b!278470 () Bool)

(declare-fun res!141946 () Bool)

(assert (=> b!278470 (=> (not res!141946) (not e!177597))))

(assert (=> b!278470 (= res!141946 (validKeyInArray!0 k0!2581))))

(declare-fun b!278471 () Bool)

(declare-fun res!141950 () Bool)

(assert (=> b!278471 (=> (not res!141950) (not e!177596))))

(assert (=> b!278471 (= res!141950 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26858 res!141952) b!278467))

(assert (= (and b!278467 res!141947) b!278470))

(assert (= (and b!278470 res!141946) b!278466))

(assert (= (and b!278466 res!141944) b!278468))

(assert (= (and b!278468 res!141945) b!278464))

(assert (= (and b!278464 res!141951) b!278469))

(assert (= (and b!278469 res!141949) b!278471))

(assert (= (and b!278471 res!141950) b!278463))

(assert (= (and b!278463 res!141948) b!278465))

(declare-fun m!293045 () Bool)

(assert (=> b!278469 m!293045))

(declare-fun m!293047 () Bool)

(assert (=> b!278470 m!293047))

(declare-fun m!293049 () Bool)

(assert (=> b!278468 m!293049))

(declare-fun m!293051 () Bool)

(assert (=> start!26858 m!293051))

(declare-fun m!293053 () Bool)

(assert (=> start!26858 m!293053))

(declare-fun m!293055 () Bool)

(assert (=> b!278464 m!293055))

(declare-fun m!293057 () Bool)

(assert (=> b!278463 m!293057))

(assert (=> b!278463 m!293057))

(declare-fun m!293059 () Bool)

(assert (=> b!278463 m!293059))

(declare-fun m!293061 () Bool)

(assert (=> b!278466 m!293061))

(check-sat (not b!278468) (not b!278469) (not start!26858) (not b!278470) (not b!278464) (not b!278466) (not b!278463))
(check-sat)
(get-model)

(declare-fun d!64779 () Bool)

(assert (=> d!64779 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278470 d!64779))

(declare-fun d!64781 () Bool)

(assert (=> d!64781 (= (validKeyInArray!0 (select (arr!6573 a!3325) startIndex!26)) (and (not (= (select (arr!6573 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6573 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278463 d!64781))

(declare-fun b!278534 () Bool)

(declare-fun e!177622 () Bool)

(declare-fun call!25366 () Bool)

(assert (=> b!278534 (= e!177622 call!25366)))

(declare-fun b!278535 () Bool)

(declare-fun e!177623 () Bool)

(assert (=> b!278535 (= e!177623 e!177622)))

(declare-fun c!45814 () Bool)

(assert (=> b!278535 (= c!45814 (validKeyInArray!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64783 () Bool)

(declare-fun res!142012 () Bool)

(assert (=> d!64783 (=> res!142012 e!177623)))

(assert (=> d!64783 (= res!142012 (bvsge #b00000000000000000000000000000000 (size!6926 a!3325)))))

(assert (=> d!64783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177623)))

(declare-fun b!278536 () Bool)

(declare-fun e!177624 () Bool)

(assert (=> b!278536 (= e!177622 e!177624)))

(declare-fun lt!138263 () (_ BitVec 64))

(assert (=> b!278536 (= lt!138263 (select (arr!6573 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8754 0))(
  ( (Unit!8755) )
))
(declare-fun lt!138262 () Unit!8754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13851 (_ BitVec 64) (_ BitVec 32)) Unit!8754)

(assert (=> b!278536 (= lt!138262 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138263 #b00000000000000000000000000000000))))

(assert (=> b!278536 (arrayContainsKey!0 a!3325 lt!138263 #b00000000000000000000000000000000)))

(declare-fun lt!138264 () Unit!8754)

(assert (=> b!278536 (= lt!138264 lt!138262)))

(declare-fun res!142011 () Bool)

(assert (=> b!278536 (= res!142011 (= (seekEntryOrOpen!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1730 #b00000000000000000000000000000000)))))

(assert (=> b!278536 (=> (not res!142011) (not e!177624))))

(declare-fun b!278537 () Bool)

(assert (=> b!278537 (= e!177624 call!25366)))

(declare-fun bm!25363 () Bool)

(assert (=> bm!25363 (= call!25366 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!64783 (not res!142012)) b!278535))

(assert (= (and b!278535 c!45814) b!278536))

(assert (= (and b!278535 (not c!45814)) b!278534))

(assert (= (and b!278536 res!142011) b!278537))

(assert (= (or b!278537 b!278534) bm!25363))

(declare-fun m!293099 () Bool)

(assert (=> b!278535 m!293099))

(assert (=> b!278535 m!293099))

(declare-fun m!293101 () Bool)

(assert (=> b!278535 m!293101))

(assert (=> b!278536 m!293099))

(declare-fun m!293103 () Bool)

(assert (=> b!278536 m!293103))

(declare-fun m!293105 () Bool)

(assert (=> b!278536 m!293105))

(assert (=> b!278536 m!293099))

(declare-fun m!293107 () Bool)

(assert (=> b!278536 m!293107))

(declare-fun m!293109 () Bool)

(assert (=> bm!25363 m!293109))

(assert (=> b!278469 d!64783))

(declare-fun d!64789 () Bool)

(assert (=> d!64789 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26858 d!64789))

(declare-fun d!64793 () Bool)

(assert (=> d!64793 (= (array_inv!4545 a!3325) (bvsge (size!6926 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26858 d!64793))

(declare-fun b!278589 () Bool)

(declare-fun e!177658 () SeekEntryResult!1730)

(assert (=> b!278589 (= e!177658 Undefined!1730)))

(declare-fun b!278590 () Bool)

(declare-fun e!177659 () SeekEntryResult!1730)

(declare-fun lt!138281 () SeekEntryResult!1730)

(assert (=> b!278590 (= e!177659 (MissingZero!1730 (index!9092 lt!138281)))))

(declare-fun b!278591 () Bool)

(declare-fun e!177660 () SeekEntryResult!1730)

(assert (=> b!278591 (= e!177660 (Found!1730 (index!9092 lt!138281)))))

(declare-fun b!278592 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13851 (_ BitVec 32)) SeekEntryResult!1730)

(assert (=> b!278592 (= e!177659 (seekKeyOrZeroReturnVacant!0 (x!27359 lt!138281) (index!9092 lt!138281) (index!9092 lt!138281) k0!2581 a!3325 mask!3868))))

(declare-fun d!64795 () Bool)

(declare-fun lt!138282 () SeekEntryResult!1730)

(get-info :version)

(assert (=> d!64795 (and (or ((_ is Undefined!1730) lt!138282) (not ((_ is Found!1730) lt!138282)) (and (bvsge (index!9091 lt!138282) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138282) (size!6926 a!3325)))) (or ((_ is Undefined!1730) lt!138282) ((_ is Found!1730) lt!138282) (not ((_ is MissingZero!1730) lt!138282)) (and (bvsge (index!9090 lt!138282) #b00000000000000000000000000000000) (bvslt (index!9090 lt!138282) (size!6926 a!3325)))) (or ((_ is Undefined!1730) lt!138282) ((_ is Found!1730) lt!138282) ((_ is MissingZero!1730) lt!138282) (not ((_ is MissingVacant!1730) lt!138282)) (and (bvsge (index!9093 lt!138282) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138282) (size!6926 a!3325)))) (or ((_ is Undefined!1730) lt!138282) (ite ((_ is Found!1730) lt!138282) (= (select (arr!6573 a!3325) (index!9091 lt!138282)) k0!2581) (ite ((_ is MissingZero!1730) lt!138282) (= (select (arr!6573 a!3325) (index!9090 lt!138282)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1730) lt!138282) (= (select (arr!6573 a!3325) (index!9093 lt!138282)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64795 (= lt!138282 e!177658)))

(declare-fun c!45833 () Bool)

(assert (=> d!64795 (= c!45833 (and ((_ is Intermediate!1730) lt!138281) (undefined!2542 lt!138281)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13851 (_ BitVec 32)) SeekEntryResult!1730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64795 (= lt!138281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64795 (validMask!0 mask!3868)))

(assert (=> d!64795 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138282)))

(declare-fun b!278593 () Bool)

(assert (=> b!278593 (= e!177658 e!177660)))

(declare-fun lt!138280 () (_ BitVec 64))

(assert (=> b!278593 (= lt!138280 (select (arr!6573 a!3325) (index!9092 lt!138281)))))

(declare-fun c!45834 () Bool)

(assert (=> b!278593 (= c!45834 (= lt!138280 k0!2581))))

(declare-fun b!278594 () Bool)

(declare-fun c!45835 () Bool)

(assert (=> b!278594 (= c!45835 (= lt!138280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278594 (= e!177660 e!177659)))

(assert (= (and d!64795 c!45833) b!278589))

(assert (= (and d!64795 (not c!45833)) b!278593))

(assert (= (and b!278593 c!45834) b!278591))

(assert (= (and b!278593 (not c!45834)) b!278594))

(assert (= (and b!278594 c!45835) b!278590))

(assert (= (and b!278594 (not c!45835)) b!278592))

(declare-fun m!293135 () Bool)

(assert (=> b!278592 m!293135))

(declare-fun m!293137 () Bool)

(assert (=> d!64795 m!293137))

(declare-fun m!293139 () Bool)

(assert (=> d!64795 m!293139))

(assert (=> d!64795 m!293051))

(declare-fun m!293141 () Bool)

(assert (=> d!64795 m!293141))

(declare-fun m!293143 () Bool)

(assert (=> d!64795 m!293143))

(assert (=> d!64795 m!293141))

(declare-fun m!293145 () Bool)

(assert (=> d!64795 m!293145))

(declare-fun m!293147 () Bool)

(assert (=> b!278593 m!293147))

(assert (=> b!278464 d!64795))

(declare-fun d!64809 () Bool)

(declare-fun res!142032 () Bool)

(declare-fun e!177671 () Bool)

(assert (=> d!64809 (=> res!142032 e!177671)))

(assert (=> d!64809 (= res!142032 (= (select (arr!6573 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!64809 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!177671)))

(declare-fun b!278611 () Bool)

(declare-fun e!177672 () Bool)

(assert (=> b!278611 (= e!177671 e!177672)))

(declare-fun res!142033 () Bool)

(assert (=> b!278611 (=> (not res!142033) (not e!177672))))

(assert (=> b!278611 (= res!142033 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6926 a!3325)))))

(declare-fun b!278612 () Bool)

(assert (=> b!278612 (= e!177672 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64809 (not res!142032)) b!278611))

(assert (= (and b!278611 res!142033) b!278612))

(assert (=> d!64809 m!293099))

(declare-fun m!293149 () Bool)

(assert (=> b!278612 m!293149))

(assert (=> b!278468 d!64809))

(declare-fun d!64811 () Bool)

(declare-fun res!142053 () Bool)

(declare-fun e!177702 () Bool)

(assert (=> d!64811 (=> res!142053 e!177702)))

(assert (=> d!64811 (= res!142053 (bvsge #b00000000000000000000000000000000 (size!6926 a!3325)))))

(assert (=> d!64811 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4351) e!177702)))

(declare-fun b!278647 () Bool)

(declare-fun e!177700 () Bool)

(declare-fun e!177699 () Bool)

(assert (=> b!278647 (= e!177700 e!177699)))

(declare-fun c!45850 () Bool)

(assert (=> b!278647 (= c!45850 (validKeyInArray!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25372 () Bool)

(declare-fun call!25375 () Bool)

(assert (=> bm!25372 (= call!25375 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45850 (Cons!4350 (select (arr!6573 a!3325) #b00000000000000000000000000000000) Nil!4351) Nil!4351)))))

(declare-fun b!278648 () Bool)

(declare-fun e!177701 () Bool)

(declare-fun contains!1940 (List!4354 (_ BitVec 64)) Bool)

(assert (=> b!278648 (= e!177701 (contains!1940 Nil!4351 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278649 () Bool)

(assert (=> b!278649 (= e!177699 call!25375)))

(declare-fun b!278650 () Bool)

(assert (=> b!278650 (= e!177699 call!25375)))

(declare-fun b!278651 () Bool)

(assert (=> b!278651 (= e!177702 e!177700)))

(declare-fun res!142052 () Bool)

(assert (=> b!278651 (=> (not res!142052) (not e!177700))))

(assert (=> b!278651 (= res!142052 (not e!177701))))

(declare-fun res!142054 () Bool)

(assert (=> b!278651 (=> (not res!142054) (not e!177701))))

(assert (=> b!278651 (= res!142054 (validKeyInArray!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64811 (not res!142053)) b!278651))

(assert (= (and b!278651 res!142054) b!278648))

(assert (= (and b!278651 res!142052) b!278647))

(assert (= (and b!278647 c!45850) b!278650))

(assert (= (and b!278647 (not c!45850)) b!278649))

(assert (= (or b!278650 b!278649) bm!25372))

(assert (=> b!278647 m!293099))

(assert (=> b!278647 m!293099))

(assert (=> b!278647 m!293101))

(assert (=> bm!25372 m!293099))

(declare-fun m!293177 () Bool)

(assert (=> bm!25372 m!293177))

(assert (=> b!278648 m!293099))

(assert (=> b!278648 m!293099))

(declare-fun m!293179 () Bool)

(assert (=> b!278648 m!293179))

(assert (=> b!278651 m!293099))

(assert (=> b!278651 m!293099))

(assert (=> b!278651 m!293101))

(assert (=> b!278466 d!64811))

(check-sat (not b!278592) (not b!278651) (not b!278536) (not b!278535) (not b!278612) (not bm!25372) (not b!278647) (not b!278648) (not bm!25363) (not d!64795))
(check-sat)
