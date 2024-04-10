; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60716 () Bool)

(assert start!60716)

(declare-datatypes ((List!12989 0))(
  ( (Nil!12986) (Cons!12985 (h!14030 (_ BitVec 64)) (t!19226 List!12989)) )
))
(declare-fun lt!313327 () List!12989)

(declare-fun b!681638 () Bool)

(declare-datatypes ((array!39526 0))(
  ( (array!39527 (arr!18948 (Array (_ BitVec 32) (_ BitVec 64))) (size!19312 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39526)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun e!388340 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39526 (_ BitVec 32) List!12989) Bool)

(assert (=> b!681638 (= e!388340 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313327))))

(declare-datatypes ((Unit!23910 0))(
  ( (Unit!23911) )
))
(declare-fun lt!313326 () Unit!23910)

(declare-fun acc!681 () List!12989)

(declare-fun noDuplicateSubseq!26 (List!12989 List!12989) Unit!23910)

(assert (=> b!681638 (= lt!313326 (noDuplicateSubseq!26 acc!681 lt!313327))))

(declare-fun b!681639 () Bool)

(declare-fun e!388338 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3566 (List!12989 (_ BitVec 64)) Bool)

(assert (=> b!681639 (= e!388338 (not (contains!3566 acc!681 k!2843)))))

(declare-fun b!681640 () Bool)

(declare-fun res!447767 () Bool)

(declare-fun e!388337 () Bool)

(assert (=> b!681640 (=> (not res!447767) (not e!388337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681640 (= res!447767 (validKeyInArray!0 k!2843))))

(declare-fun res!447772 () Bool)

(assert (=> start!60716 (=> (not res!447772) (not e!388337))))

(assert (=> start!60716 (= res!447772 (and (bvslt (size!19312 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19312 a!3626))))))

(assert (=> start!60716 e!388337))

(assert (=> start!60716 true))

(declare-fun array_inv!14744 (array!39526) Bool)

(assert (=> start!60716 (array_inv!14744 a!3626)))

(declare-fun b!681641 () Bool)

(declare-fun res!447769 () Bool)

(assert (=> b!681641 (=> res!447769 e!388340)))

(declare-fun subseq!152 (List!12989 List!12989) Bool)

(assert (=> b!681641 (= res!447769 (not (subseq!152 acc!681 lt!313327)))))

(declare-fun b!681642 () Bool)

(declare-fun res!447776 () Bool)

(assert (=> b!681642 (=> (not res!447776) (not e!388337))))

(assert (=> b!681642 (= res!447776 (not (contains!3566 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681643 () Bool)

(declare-fun e!388341 () Bool)

(assert (=> b!681643 (= e!388341 (contains!3566 acc!681 k!2843))))

(declare-fun b!681644 () Bool)

(declare-fun res!447779 () Bool)

(assert (=> b!681644 (=> (not res!447779) (not e!388337))))

(assert (=> b!681644 (= res!447779 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681645 () Bool)

(declare-fun e!388339 () Bool)

(assert (=> b!681645 (= e!388339 e!388340)))

(declare-fun res!447762 () Bool)

(assert (=> b!681645 (=> res!447762 e!388340)))

(assert (=> b!681645 (= res!447762 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!317 (List!12989 (_ BitVec 64)) List!12989)

(assert (=> b!681645 (= lt!313327 ($colon$colon!317 acc!681 (select (arr!18948 a!3626) from!3004)))))

(assert (=> b!681645 (subseq!152 acc!681 acc!681)))

(declare-fun lt!313329 () Unit!23910)

(declare-fun lemmaListSubSeqRefl!0 (List!12989) Unit!23910)

(assert (=> b!681645 (= lt!313329 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681646 () Bool)

(declare-fun res!447766 () Bool)

(assert (=> b!681646 (=> (not res!447766) (not e!388337))))

(declare-fun noDuplicate!813 (List!12989) Bool)

(assert (=> b!681646 (= res!447766 (noDuplicate!813 acc!681))))

(declare-fun b!681647 () Bool)

(declare-fun e!388336 () Unit!23910)

(declare-fun Unit!23912 () Unit!23910)

(assert (=> b!681647 (= e!388336 Unit!23912)))

(declare-fun b!681648 () Bool)

(declare-fun res!447775 () Bool)

(assert (=> b!681648 (=> res!447775 e!388340)))

(assert (=> b!681648 (= res!447775 (contains!3566 lt!313327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681649 () Bool)

(declare-fun e!388335 () Bool)

(assert (=> b!681649 (= e!388335 e!388338)))

(declare-fun res!447763 () Bool)

(assert (=> b!681649 (=> (not res!447763) (not e!388338))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681649 (= res!447763 (bvsle from!3004 i!1382))))

(declare-fun b!681650 () Bool)

(declare-fun Unit!23913 () Unit!23910)

(assert (=> b!681650 (= e!388336 Unit!23913)))

(declare-fun lt!313330 () Unit!23910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39526 (_ BitVec 64) (_ BitVec 32)) Unit!23910)

(assert (=> b!681650 (= lt!313330 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!681650 false))

(declare-fun b!681651 () Bool)

(declare-fun res!447774 () Bool)

(assert (=> b!681651 (=> res!447774 e!388340)))

(assert (=> b!681651 (= res!447774 (contains!3566 lt!313327 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681652 () Bool)

(declare-fun res!447765 () Bool)

(assert (=> b!681652 (=> (not res!447765) (not e!388337))))

(assert (=> b!681652 (= res!447765 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12986))))

(declare-fun b!681653 () Bool)

(declare-fun res!447771 () Bool)

(assert (=> b!681653 (=> (not res!447771) (not e!388337))))

(declare-fun arrayContainsKey!0 (array!39526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681653 (= res!447771 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681654 () Bool)

(declare-fun res!447768 () Bool)

(assert (=> b!681654 (=> (not res!447768) (not e!388337))))

(assert (=> b!681654 (= res!447768 e!388335)))

(declare-fun res!447777 () Bool)

(assert (=> b!681654 (=> res!447777 e!388335)))

(assert (=> b!681654 (= res!447777 e!388341)))

(declare-fun res!447760 () Bool)

(assert (=> b!681654 (=> (not res!447760) (not e!388341))))

(assert (=> b!681654 (= res!447760 (bvsgt from!3004 i!1382))))

(declare-fun b!681655 () Bool)

(assert (=> b!681655 (= e!388337 (not e!388339))))

(declare-fun res!447764 () Bool)

(assert (=> b!681655 (=> res!447764 e!388339)))

(assert (=> b!681655 (= res!447764 (not (validKeyInArray!0 (select (arr!18948 a!3626) from!3004))))))

(declare-fun lt!313328 () Unit!23910)

(assert (=> b!681655 (= lt!313328 e!388336)))

(declare-fun c!77306 () Bool)

(assert (=> b!681655 (= c!77306 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681655 (arrayContainsKey!0 (array!39527 (store (arr!18948 a!3626) i!1382 k!2843) (size!19312 a!3626)) k!2843 from!3004)))

(declare-fun b!681656 () Bool)

(declare-fun res!447761 () Bool)

(assert (=> b!681656 (=> (not res!447761) (not e!388337))))

(assert (=> b!681656 (= res!447761 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19312 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681657 () Bool)

(declare-fun res!447770 () Bool)

(assert (=> b!681657 (=> res!447770 e!388340)))

(assert (=> b!681657 (= res!447770 (not (noDuplicate!813 lt!313327)))))

(declare-fun b!681658 () Bool)

(declare-fun res!447778 () Bool)

(assert (=> b!681658 (=> (not res!447778) (not e!388337))))

(assert (=> b!681658 (= res!447778 (not (contains!3566 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681659 () Bool)

(declare-fun res!447773 () Bool)

(assert (=> b!681659 (=> (not res!447773) (not e!388337))))

(assert (=> b!681659 (= res!447773 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19312 a!3626))))))

(assert (= (and start!60716 res!447772) b!681646))

(assert (= (and b!681646 res!447766) b!681642))

(assert (= (and b!681642 res!447776) b!681658))

(assert (= (and b!681658 res!447778) b!681654))

(assert (= (and b!681654 res!447760) b!681643))

(assert (= (and b!681654 (not res!447777)) b!681649))

(assert (= (and b!681649 res!447763) b!681639))

(assert (= (and b!681654 res!447768) b!681652))

(assert (= (and b!681652 res!447765) b!681644))

(assert (= (and b!681644 res!447779) b!681659))

(assert (= (and b!681659 res!447773) b!681640))

(assert (= (and b!681640 res!447767) b!681653))

(assert (= (and b!681653 res!447771) b!681656))

(assert (= (and b!681656 res!447761) b!681655))

(assert (= (and b!681655 c!77306) b!681650))

(assert (= (and b!681655 (not c!77306)) b!681647))

(assert (= (and b!681655 (not res!447764)) b!681645))

(assert (= (and b!681645 (not res!447762)) b!681657))

(assert (= (and b!681657 (not res!447770)) b!681648))

(assert (= (and b!681648 (not res!447775)) b!681651))

(assert (= (and b!681651 (not res!447774)) b!681641))

(assert (= (and b!681641 (not res!447769)) b!681638))

(declare-fun m!646463 () Bool)

(assert (=> b!681640 m!646463))

(declare-fun m!646465 () Bool)

(assert (=> b!681655 m!646465))

(declare-fun m!646467 () Bool)

(assert (=> b!681655 m!646467))

(declare-fun m!646469 () Bool)

(assert (=> b!681655 m!646469))

(assert (=> b!681655 m!646465))

(declare-fun m!646471 () Bool)

(assert (=> b!681655 m!646471))

(declare-fun m!646473 () Bool)

(assert (=> b!681655 m!646473))

(declare-fun m!646475 () Bool)

(assert (=> b!681651 m!646475))

(declare-fun m!646477 () Bool)

(assert (=> b!681643 m!646477))

(declare-fun m!646479 () Bool)

(assert (=> b!681641 m!646479))

(declare-fun m!646481 () Bool)

(assert (=> b!681650 m!646481))

(declare-fun m!646483 () Bool)

(assert (=> b!681653 m!646483))

(assert (=> b!681639 m!646477))

(declare-fun m!646485 () Bool)

(assert (=> b!681642 m!646485))

(declare-fun m!646487 () Bool)

(assert (=> start!60716 m!646487))

(declare-fun m!646489 () Bool)

(assert (=> b!681652 m!646489))

(declare-fun m!646491 () Bool)

(assert (=> b!681658 m!646491))

(assert (=> b!681645 m!646465))

(assert (=> b!681645 m!646465))

(declare-fun m!646493 () Bool)

(assert (=> b!681645 m!646493))

(declare-fun m!646495 () Bool)

(assert (=> b!681645 m!646495))

(declare-fun m!646497 () Bool)

(assert (=> b!681645 m!646497))

(declare-fun m!646499 () Bool)

(assert (=> b!681646 m!646499))

(declare-fun m!646501 () Bool)

(assert (=> b!681638 m!646501))

(declare-fun m!646503 () Bool)

(assert (=> b!681638 m!646503))

(declare-fun m!646505 () Bool)

(assert (=> b!681648 m!646505))

(declare-fun m!646507 () Bool)

(assert (=> b!681644 m!646507))

(declare-fun m!646509 () Bool)

(assert (=> b!681657 m!646509))

(push 1)

(assert (not b!681653))

(assert (not b!681657))

(assert (not start!60716))

(assert (not b!681644))

(assert (not b!681642))

(assert (not b!681638))

(assert (not b!681658))

(assert (not b!681645))

(assert (not b!681646))

(assert (not b!681652))

(assert (not b!681650))

(assert (not b!681640))

(assert (not b!681643))

(assert (not b!681648))

(assert (not b!681639))

(assert (not b!681641))

(assert (not b!681655))

(assert (not b!681651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93925 () Bool)

(declare-fun lt!313368 () Bool)

(declare-fun content!276 (List!12989) (Set (_ BitVec 64)))

(assert (=> d!93925 (= lt!313368 (set.member k!2843 (content!276 acc!681)))))

(declare-fun e!388417 () Bool)

(assert (=> d!93925 (= lt!313368 e!388417)))

(declare-fun res!447923 () Bool)

(assert (=> d!93925 (=> (not res!447923) (not e!388417))))

(assert (=> d!93925 (= res!447923 (is-Cons!12985 acc!681))))

(assert (=> d!93925 (= (contains!3566 acc!681 k!2843) lt!313368)))

(declare-fun b!681821 () Bool)

(declare-fun e!388416 () Bool)

(assert (=> b!681821 (= e!388417 e!388416)))

(declare-fun res!447924 () Bool)

(assert (=> b!681821 (=> res!447924 e!388416)))

(assert (=> b!681821 (= res!447924 (= (h!14030 acc!681) k!2843))))

(declare-fun b!681822 () Bool)

(assert (=> b!681822 (= e!388416 (contains!3566 (t!19226 acc!681) k!2843))))

(assert (= (and d!93925 res!447923) b!681821))

(assert (= (and b!681821 (not res!447924)) b!681822))

(declare-fun m!646625 () Bool)

(assert (=> d!93925 m!646625))

(declare-fun m!646627 () Bool)

(assert (=> d!93925 m!646627))

(declare-fun m!646629 () Bool)

(assert (=> b!681822 m!646629))

(assert (=> b!681639 d!93925))

(declare-fun d!93933 () Bool)

(assert (=> d!93933 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313372 () Unit!23910)

(declare-fun choose!13 (array!39526 (_ BitVec 64) (_ BitVec 32)) Unit!23910)

(assert (=> d!93933 (= lt!313372 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!93933 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93933 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313372)))

(declare-fun bs!20009 () Bool)

(assert (= bs!20009 d!93933))

(assert (=> bs!20009 m!646483))

(declare-fun m!646637 () Bool)

(assert (=> bs!20009 m!646637))

(assert (=> b!681650 d!93933))

(declare-fun d!93937 () Bool)

(assert (=> d!93937 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681640 d!93937))

(declare-fun d!93939 () Bool)

(declare-fun lt!313373 () Bool)

(assert (=> d!93939 (= lt!313373 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!276 lt!313327)))))

(declare-fun e!388435 () Bool)

(assert (=> d!93939 (= lt!313373 e!388435)))

(declare-fun res!447941 () Bool)

(assert (=> d!93939 (=> (not res!447941) (not e!388435))))

(assert (=> d!93939 (= res!447941 (is-Cons!12985 lt!313327))))

(assert (=> d!93939 (= (contains!3566 lt!313327 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313373)))

(declare-fun b!681839 () Bool)

(declare-fun e!388434 () Bool)

(assert (=> b!681839 (= e!388435 e!388434)))

(declare-fun res!447942 () Bool)

(assert (=> b!681839 (=> res!447942 e!388434)))

(assert (=> b!681839 (= res!447942 (= (h!14030 lt!313327) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681840 () Bool)

(assert (=> b!681840 (= e!388434 (contains!3566 (t!19226 lt!313327) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93939 res!447941) b!681839))

(assert (= (and b!681839 (not res!447942)) b!681840))

(declare-fun m!646639 () Bool)

(assert (=> d!93939 m!646639))

(declare-fun m!646641 () Bool)

(assert (=> d!93939 m!646641))

(declare-fun m!646643 () Bool)

(assert (=> b!681840 m!646643))

(assert (=> b!681651 d!93939))

(declare-fun d!93941 () Bool)

(assert (=> d!93941 (= (array_inv!14744 a!3626) (bvsge (size!19312 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60716 d!93941))

(declare-fun b!681878 () Bool)

(declare-fun e!388472 () Bool)

(declare-fun e!388471 () Bool)

(assert (=> b!681878 (= e!388472 e!388471)))

(declare-fun res!447977 () Bool)

(assert (=> b!681878 (=> (not res!447977) (not e!388471))))

(assert (=> b!681878 (= res!447977 (is-Cons!12985 lt!313327))))

(declare-fun d!93945 () Bool)

(declare-fun res!447975 () Bool)

(assert (=> d!93945 (=> res!447975 e!388472)))

(assert (=> d!93945 (= res!447975 (is-Nil!12986 acc!681))))

(assert (=> d!93945 (= (subseq!152 acc!681 lt!313327) e!388472)))

(declare-fun b!681879 () Bool)

(declare-fun e!388470 () Bool)

(assert (=> b!681879 (= e!388471 e!388470)))

(declare-fun res!447974 () Bool)

(assert (=> b!681879 (=> res!447974 e!388470)))

(declare-fun e!388473 () Bool)

(assert (=> b!681879 (= res!447974 e!388473)))

(declare-fun res!447976 () Bool)

(assert (=> b!681879 (=> (not res!447976) (not e!388473))))

(assert (=> b!681879 (= res!447976 (= (h!14030 acc!681) (h!14030 lt!313327)))))

(declare-fun b!681881 () Bool)

(assert (=> b!681881 (= e!388470 (subseq!152 acc!681 (t!19226 lt!313327)))))

(declare-fun b!681880 () Bool)

(assert (=> b!681880 (= e!388473 (subseq!152 (t!19226 acc!681) (t!19226 lt!313327)))))

(assert (= (and d!93945 (not res!447975)) b!681878))

(assert (= (and b!681878 res!447977) b!681879))

(assert (= (and b!681879 res!447976) b!681880))

(assert (= (and b!681879 (not res!447974)) b!681881))

(declare-fun m!646657 () Bool)

(assert (=> b!681881 m!646657))

(declare-fun m!646659 () Bool)

(assert (=> b!681880 m!646659))

(assert (=> b!681641 d!93945))

(declare-fun bm!33981 () Bool)

(declare-fun call!33984 () Bool)

(declare-fun c!77322 () Bool)

(assert (=> bm!33981 (= call!33984 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77322 (Cons!12985 (select (arr!18948 a!3626) #b00000000000000000000000000000000) Nil!12986) Nil!12986)))))

(declare-fun b!681914 () Bool)

(declare-fun e!388506 () Bool)

(assert (=> b!681914 (= e!388506 call!33984)))

(declare-fun d!93951 () Bool)

(declare-fun res!448005 () Bool)

(declare-fun e!388503 () Bool)

(assert (=> d!93951 (=> res!448005 e!388503)))

(assert (=> d!93951 (= res!448005 (bvsge #b00000000000000000000000000000000 (size!19312 a!3626)))))

(assert (=> d!93951 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12986) e!388503)))

(declare-fun b!681915 () Bool)

(declare-fun e!388505 () Bool)

(assert (=> b!681915 (= e!388505 e!388506)))

(assert (=> b!681915 (= c!77322 (validKeyInArray!0 (select (arr!18948 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681916 () Bool)

(assert (=> b!681916 (= e!388506 call!33984)))

(declare-fun b!681917 () Bool)

(declare-fun e!388504 () Bool)

(assert (=> b!681917 (= e!388504 (contains!3566 Nil!12986 (select (arr!18948 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681918 () Bool)

(assert (=> b!681918 (= e!388503 e!388505)))

(declare-fun res!448004 () Bool)

(assert (=> b!681918 (=> (not res!448004) (not e!388505))))

(assert (=> b!681918 (= res!448004 (not e!388504))))

(declare-fun res!448006 () Bool)

(assert (=> b!681918 (=> (not res!448006) (not e!388504))))

(assert (=> b!681918 (= res!448006 (validKeyInArray!0 (select (arr!18948 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93951 (not res!448005)) b!681918))

(assert (= (and b!681918 res!448006) b!681917))

(assert (= (and b!681918 res!448004) b!681915))

(assert (= (and b!681915 c!77322) b!681916))

(assert (= (and b!681915 (not c!77322)) b!681914))

(assert (= (or b!681916 b!681914) bm!33981))

(declare-fun m!646693 () Bool)

(assert (=> bm!33981 m!646693))

(declare-fun m!646695 () Bool)

(assert (=> bm!33981 m!646695))

(assert (=> b!681915 m!646693))

(assert (=> b!681915 m!646693))

(declare-fun m!646697 () Bool)

(assert (=> b!681915 m!646697))

(assert (=> b!681917 m!646693))

(assert (=> b!681917 m!646693))

(declare-fun m!646699 () Bool)

(assert (=> b!681917 m!646699))

(assert (=> b!681918 m!646693))

(assert (=> b!681918 m!646693))

(assert (=> b!681918 m!646697))

(assert (=> b!681652 d!93951))

(declare-fun d!93975 () Bool)

(declare-fun lt!313382 () Bool)

(assert (=> d!93975 (= lt!313382 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!276 acc!681)))))

(declare-fun e!388512 () Bool)

(assert (=> d!93975 (= lt!313382 e!388512)))

(declare-fun res!448011 () Bool)

(assert (=> d!93975 (=> (not res!448011) (not e!388512))))

(assert (=> d!93975 (= res!448011 (is-Cons!12985 acc!681))))

(assert (=> d!93975 (= (contains!3566 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313382)))

(declare-fun b!681921 () Bool)

(declare-fun e!388511 () Bool)

(assert (=> b!681921 (= e!388512 e!388511)))

(declare-fun res!448012 () Bool)

(assert (=> b!681921 (=> res!448012 e!388511)))

(assert (=> b!681921 (= res!448012 (= (h!14030 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681923 () Bool)

(assert (=> b!681923 (= e!388511 (contains!3566 (t!19226 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93975 res!448011) b!681921))

(assert (= (and b!681921 (not res!448012)) b!681923))

(assert (=> d!93975 m!646625))

(declare-fun m!646701 () Bool)

(assert (=> d!93975 m!646701))

(declare-fun m!646703 () Bool)

(assert (=> b!681923 m!646703))

(assert (=> b!681642 d!93975))

(declare-fun d!93977 () Bool)

(declare-fun res!448030 () Bool)

(declare-fun e!388531 () Bool)

(assert (=> d!93977 (=> res!448030 e!388531)))

(assert (=> d!93977 (= res!448030 (= (select (arr!18948 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93977 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!388531)))

(declare-fun b!681944 () Bool)

(declare-fun e!388532 () Bool)

(assert (=> b!681944 (= e!388531 e!388532)))

(declare-fun res!448031 () Bool)

(assert (=> b!681944 (=> (not res!448031) (not e!388532))))

(assert (=> b!681944 (= res!448031 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19312 a!3626)))))

(declare-fun b!681945 () Bool)

(assert (=> b!681945 (= e!388532 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93977 (not res!448030)) b!681944))

(assert (= (and b!681944 res!448031) b!681945))

(assert (=> d!93977 m!646693))

(declare-fun m!646723 () Bool)

(assert (=> b!681945 m!646723))

(assert (=> b!681653 d!93977))

(assert (=> b!681643 d!93925))

(declare-fun c!77324 () Bool)

(declare-fun call!33986 () Bool)

(declare-fun bm!33983 () Bool)

(assert (=> bm!33983 (= call!33986 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77324 (Cons!12985 (select (arr!18948 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681946 () Bool)

(declare-fun e!388536 () Bool)

(assert (=> b!681946 (= e!388536 call!33986)))

(declare-fun d!93987 () Bool)

(declare-fun res!448033 () Bool)

(declare-fun e!388533 () Bool)

(assert (=> d!93987 (=> res!448033 e!388533)))

(assert (=> d!93987 (= res!448033 (bvsge from!3004 (size!19312 a!3626)))))

(assert (=> d!93987 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388533)))

(declare-fun b!681947 () Bool)

(declare-fun e!388535 () Bool)

(assert (=> b!681947 (= e!388535 e!388536)))

(assert (=> b!681947 (= c!77324 (validKeyInArray!0 (select (arr!18948 a!3626) from!3004)))))

(declare-fun b!681948 () Bool)

(assert (=> b!681948 (= e!388536 call!33986)))

(declare-fun e!388534 () Bool)

(declare-fun b!681949 () Bool)

(assert (=> b!681949 (= e!388534 (contains!3566 acc!681 (select (arr!18948 a!3626) from!3004)))))

(declare-fun b!681950 () Bool)

(assert (=> b!681950 (= e!388533 e!388535)))

(declare-fun res!448032 () Bool)

(assert (=> b!681950 (=> (not res!448032) (not e!388535))))

(assert (=> b!681950 (= res!448032 (not e!388534))))

(declare-fun res!448034 () Bool)

(assert (=> b!681950 (=> (not res!448034) (not e!388534))))

(assert (=> b!681950 (= res!448034 (validKeyInArray!0 (select (arr!18948 a!3626) from!3004)))))

(assert (= (and d!93987 (not res!448033)) b!681950))

(assert (= (and b!681950 res!448034) b!681949))

(assert (= (and b!681950 res!448032) b!681947))

(assert (= (and b!681947 c!77324) b!681948))

(assert (= (and b!681947 (not c!77324)) b!681946))

(assert (= (or b!681948 b!681946) bm!33983))

(assert (=> bm!33983 m!646465))

(declare-fun m!646725 () Bool)

(assert (=> bm!33983 m!646725))

(assert (=> b!681947 m!646465))

(assert (=> b!681947 m!646465))

(assert (=> b!681947 m!646471))

(assert (=> b!681949 m!646465))

(assert (=> b!681949 m!646465))

(declare-fun m!646727 () Bool)

(assert (=> b!681949 m!646727))

(assert (=> b!681950 m!646465))

(assert (=> b!681950 m!646465))

(assert (=> b!681950 m!646471))

(assert (=> b!681644 d!93987))

(declare-fun d!93989 () Bool)

(assert (=> d!93989 (= (validKeyInArray!0 (select (arr!18948 a!3626) from!3004)) (and (not (= (select (arr!18948 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18948 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681655 d!93989))

(declare-fun d!93991 () Bool)

(declare-fun res!448039 () Bool)

(declare-fun e!388541 () Bool)

(assert (=> d!93991 (=> res!448039 e!388541)))

(assert (=> d!93991 (= res!448039 (= (select (arr!18948 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93991 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388541)))

(declare-fun b!681955 () Bool)

(declare-fun e!388542 () Bool)

(assert (=> b!681955 (= e!388541 e!388542)))

(declare-fun res!448040 () Bool)

(assert (=> b!681955 (=> (not res!448040) (not e!388542))))

(assert (=> b!681955 (= res!448040 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19312 a!3626)))))

(declare-fun b!681956 () Bool)

(assert (=> b!681956 (= e!388542 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93991 (not res!448039)) b!681955))

(assert (= (and b!681955 res!448040) b!681956))

(declare-fun m!646729 () Bool)

(assert (=> d!93991 m!646729))

(declare-fun m!646731 () Bool)

(assert (=> b!681956 m!646731))

(assert (=> b!681655 d!93991))

(declare-fun d!93993 () Bool)

(declare-fun res!448043 () Bool)

(declare-fun e!388545 () Bool)

(assert (=> d!93993 (=> res!448043 e!388545)))

(assert (=> d!93993 (= res!448043 (= (select (arr!18948 (array!39527 (store (arr!18948 a!3626) i!1382 k!2843) (size!19312 a!3626))) from!3004) k!2843))))

(assert (=> d!93993 (= (arrayContainsKey!0 (array!39527 (store (arr!18948 a!3626) i!1382 k!2843) (size!19312 a!3626)) k!2843 from!3004) e!388545)))

(declare-fun b!681959 () Bool)

(declare-fun e!388546 () Bool)

(assert (=> b!681959 (= e!388545 e!388546)))

(declare-fun res!448044 () Bool)

(assert (=> b!681959 (=> (not res!448044) (not e!388546))))

(assert (=> b!681959 (= res!448044 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19312 (array!39527 (store (arr!18948 a!3626) i!1382 k!2843) (size!19312 a!3626)))))))

(declare-fun b!681960 () Bool)

(assert (=> b!681960 (= e!388546 (arrayContainsKey!0 (array!39527 (store (arr!18948 a!3626) i!1382 k!2843) (size!19312 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93993 (not res!448043)) b!681959))

(assert (= (and b!681959 res!448044) b!681960))

(declare-fun m!646739 () Bool)

(assert (=> d!93993 m!646739))

(declare-fun m!646741 () Bool)

(assert (=> b!681960 m!646741))

(assert (=> b!681655 d!93993))

(declare-fun d!93997 () Bool)

(assert (=> d!93997 (= ($colon$colon!317 acc!681 (select (arr!18948 a!3626) from!3004)) (Cons!12985 (select (arr!18948 a!3626) from!3004) acc!681))))

(assert (=> b!681645 d!93997))

(declare-fun b!681968 () Bool)

(declare-fun e!388556 () Bool)

(declare-fun e!388555 () Bool)

(assert (=> b!681968 (= e!388556 e!388555)))

(declare-fun res!448055 () Bool)

(assert (=> b!681968 (=> (not res!448055) (not e!388555))))

(assert (=> b!681968 (= res!448055 (is-Cons!12985 acc!681))))

(declare-fun d!94001 () Bool)

(declare-fun res!448053 () Bool)

(assert (=> d!94001 (=> res!448053 e!388556)))

(assert (=> d!94001 (= res!448053 (is-Nil!12986 acc!681))))

(assert (=> d!94001 (= (subseq!152 acc!681 acc!681) e!388556)))

(declare-fun b!681969 () Bool)

(declare-fun e!388554 () Bool)

(assert (=> b!681969 (= e!388555 e!388554)))

(declare-fun res!448052 () Bool)

(assert (=> b!681969 (=> res!448052 e!388554)))

(declare-fun e!388557 () Bool)

(assert (=> b!681969 (= res!448052 e!388557)))

(declare-fun res!448054 () Bool)

(assert (=> b!681969 (=> (not res!448054) (not e!388557))))

(assert (=> b!681969 (= res!448054 (= (h!14030 acc!681) (h!14030 acc!681)))))

(declare-fun b!681971 () Bool)

(assert (=> b!681971 (= e!388554 (subseq!152 acc!681 (t!19226 acc!681)))))

(declare-fun b!681970 () Bool)

(assert (=> b!681970 (= e!388557 (subseq!152 (t!19226 acc!681) (t!19226 acc!681)))))

(assert (= (and d!94001 (not res!448053)) b!681968))

(assert (= (and b!681968 res!448055) b!681969))

(assert (= (and b!681969 res!448054) b!681970))

(assert (= (and b!681969 (not res!448052)) b!681971))

(declare-fun m!646755 () Bool)

(assert (=> b!681971 m!646755))

(declare-fun m!646757 () Bool)

(assert (=> b!681970 m!646757))

(assert (=> b!681645 d!94001))

(declare-fun d!94007 () Bool)

(assert (=> d!94007 (subseq!152 acc!681 acc!681)))

(declare-fun lt!313395 () Unit!23910)

(declare-fun choose!36 (List!12989) Unit!23910)

(assert (=> d!94007 (= lt!313395 (choose!36 acc!681))))

(assert (=> d!94007 (= (lemmaListSubSeqRefl!0 acc!681) lt!313395)))

(declare-fun bs!20011 () Bool)

(assert (= bs!20011 d!94007))

(assert (=> bs!20011 m!646495))

(declare-fun m!646773 () Bool)

(assert (=> bs!20011 m!646773))

(assert (=> b!681645 d!94007))

(declare-fun d!94021 () Bool)

(declare-fun res!448073 () Bool)

(declare-fun e!388576 () Bool)

(assert (=> d!94021 (=> res!448073 e!388576)))

(assert (=> d!94021 (= res!448073 (is-Nil!12986 acc!681))))

(assert (=> d!94021 (= (noDuplicate!813 acc!681) e!388576)))

(declare-fun b!681991 () Bool)

(declare-fun e!388577 () Bool)

(assert (=> b!681991 (= e!388576 e!388577)))

(declare-fun res!448074 () Bool)

(assert (=> b!681991 (=> (not res!448074) (not e!388577))))

(assert (=> b!681991 (= res!448074 (not (contains!3566 (t!19226 acc!681) (h!14030 acc!681))))))

(declare-fun b!681992 () Bool)

(assert (=> b!681992 (= e!388577 (noDuplicate!813 (t!19226 acc!681)))))

(assert (= (and d!94021 (not res!448073)) b!681991))

(assert (= (and b!681991 res!448074) b!681992))

(declare-fun m!646781 () Bool)

(assert (=> b!681991 m!646781))

(declare-fun m!646783 () Bool)

(assert (=> b!681992 m!646783))

(assert (=> b!681646 d!94021))

(declare-fun d!94029 () Bool)

(declare-fun res!448075 () Bool)

(declare-fun e!388578 () Bool)

(assert (=> d!94029 (=> res!448075 e!388578)))

(assert (=> d!94029 (= res!448075 (is-Nil!12986 lt!313327))))

(assert (=> d!94029 (= (noDuplicate!813 lt!313327) e!388578)))

(declare-fun b!681993 () Bool)

(declare-fun e!388579 () Bool)

(assert (=> b!681993 (= e!388578 e!388579)))

(declare-fun res!448076 () Bool)

(assert (=> b!681993 (=> (not res!448076) (not e!388579))))

(assert (=> b!681993 (= res!448076 (not (contains!3566 (t!19226 lt!313327) (h!14030 lt!313327))))))

(declare-fun b!681994 () Bool)

(assert (=> b!681994 (= e!388579 (noDuplicate!813 (t!19226 lt!313327)))))

(assert (= (and d!94029 (not res!448075)) b!681993))

(assert (= (and b!681993 res!448076) b!681994))

(declare-fun m!646785 () Bool)

(assert (=> b!681993 m!646785))

(declare-fun m!646787 () Bool)

(assert (=> b!681994 m!646787))

(assert (=> b!681657 d!94029))

(declare-fun d!94031 () Bool)

(declare-fun lt!313399 () Bool)

(assert (=> d!94031 (= lt!313399 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!276 acc!681)))))

(declare-fun e!388581 () Bool)

(assert (=> d!94031 (= lt!313399 e!388581)))

(declare-fun res!448077 () Bool)

(assert (=> d!94031 (=> (not res!448077) (not e!388581))))

(assert (=> d!94031 (= res!448077 (is-Cons!12985 acc!681))))

(assert (=> d!94031 (= (contains!3566 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313399)))

(declare-fun b!681995 () Bool)

(declare-fun e!388580 () Bool)

(assert (=> b!681995 (= e!388581 e!388580)))

(declare-fun res!448078 () Bool)

(assert (=> b!681995 (=> res!448078 e!388580)))

(assert (=> b!681995 (= res!448078 (= (h!14030 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681996 () Bool)

(assert (=> b!681996 (= e!388580 (contains!3566 (t!19226 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94031 res!448077) b!681995))

(assert (= (and b!681995 (not res!448078)) b!681996))

(assert (=> d!94031 m!646625))

(declare-fun m!646789 () Bool)

(assert (=> d!94031 m!646789))

(declare-fun m!646791 () Bool)

(assert (=> b!681996 m!646791))

(assert (=> b!681658 d!94031))

(declare-fun d!94033 () Bool)

(declare-fun lt!313400 () Bool)

(assert (=> d!94033 (= lt!313400 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!276 lt!313327)))))

(declare-fun e!388583 () Bool)

(assert (=> d!94033 (= lt!313400 e!388583)))

(declare-fun res!448079 () Bool)

(assert (=> d!94033 (=> (not res!448079) (not e!388583))))

(assert (=> d!94033 (= res!448079 (is-Cons!12985 lt!313327))))

(assert (=> d!94033 (= (contains!3566 lt!313327 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313400)))

(declare-fun b!681997 () Bool)

(declare-fun e!388582 () Bool)

(assert (=> b!681997 (= e!388583 e!388582)))

(declare-fun res!448080 () Bool)

(assert (=> b!681997 (=> res!448080 e!388582)))

(assert (=> b!681997 (= res!448080 (= (h!14030 lt!313327) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681998 () Bool)

(assert (=> b!681998 (= e!388582 (contains!3566 (t!19226 lt!313327) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94033 res!448079) b!681997))

(assert (= (and b!681997 (not res!448080)) b!681998))

(assert (=> d!94033 m!646639))

(declare-fun m!646793 () Bool)

(assert (=> d!94033 m!646793))

(declare-fun m!646795 () Bool)

(assert (=> b!681998 m!646795))

(assert (=> b!681648 d!94033))

(declare-fun call!33988 () Bool)

(declare-fun bm!33985 () Bool)

(declare-fun c!77326 () Bool)

(assert (=> bm!33985 (= call!33988 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77326 (Cons!12985 (select (arr!18948 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!313327) lt!313327)))))

(declare-fun b!681999 () Bool)

(declare-fun e!388587 () Bool)

(assert (=> b!681999 (= e!388587 call!33988)))

(declare-fun d!94035 () Bool)

(declare-fun res!448082 () Bool)

(declare-fun e!388584 () Bool)

(assert (=> d!94035 (=> res!448082 e!388584)))

(assert (=> d!94035 (= res!448082 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19312 a!3626)))))

(assert (=> d!94035 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313327) e!388584)))

(declare-fun b!682000 () Bool)

(declare-fun e!388586 () Bool)

(assert (=> b!682000 (= e!388586 e!388587)))

(assert (=> b!682000 (= c!77326 (validKeyInArray!0 (select (arr!18948 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682001 () Bool)

(assert (=> b!682001 (= e!388587 call!33988)))

(declare-fun e!388585 () Bool)

(declare-fun b!682002 () Bool)

(assert (=> b!682002 (= e!388585 (contains!3566 lt!313327 (select (arr!18948 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682003 () Bool)

(assert (=> b!682003 (= e!388584 e!388586)))

(declare-fun res!448081 () Bool)

(assert (=> b!682003 (=> (not res!448081) (not e!388586))))

(assert (=> b!682003 (= res!448081 (not e!388585))))

(declare-fun res!448083 () Bool)

