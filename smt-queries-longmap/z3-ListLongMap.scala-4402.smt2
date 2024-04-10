; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60514 () Bool)

(assert start!60514)

(declare-fun b!680397 () Bool)

(declare-fun res!446663 () Bool)

(declare-fun e!387521 () Bool)

(assert (=> b!680397 (=> (not res!446663) (not e!387521))))

(declare-datatypes ((List!12978 0))(
  ( (Nil!12975) (Cons!12974 (h!14019 (_ BitVec 64)) (t!19206 List!12978)) )
))
(declare-fun acc!681 () List!12978)

(declare-fun noDuplicate!802 (List!12978) Bool)

(assert (=> b!680397 (= res!446663 (noDuplicate!802 acc!681))))

(declare-fun b!680398 () Bool)

(declare-fun res!446658 () Bool)

(assert (=> b!680398 (=> (not res!446658) (not e!387521))))

(declare-fun contains!3555 (List!12978 (_ BitVec 64)) Bool)

(assert (=> b!680398 (= res!446658 (not (contains!3555 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680399 () Bool)

(declare-fun res!446660 () Bool)

(assert (=> b!680399 (=> (not res!446660) (not e!387521))))

(declare-fun e!387527 () Bool)

(assert (=> b!680399 (= res!446660 e!387527)))

(declare-fun res!446672 () Bool)

(assert (=> b!680399 (=> res!446672 e!387527)))

(declare-fun e!387523 () Bool)

(assert (=> b!680399 (= res!446672 e!387523)))

(declare-fun res!446668 () Bool)

(assert (=> b!680399 (=> (not res!446668) (not e!387523))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680399 (= res!446668 (bvsgt from!3004 i!1382))))

(declare-fun b!680400 () Bool)

(declare-fun res!446671 () Bool)

(assert (=> b!680400 (=> (not res!446671) (not e!387521))))

(declare-datatypes ((array!39495 0))(
  ( (array!39496 (arr!18937 (Array (_ BitVec 32) (_ BitVec 64))) (size!19301 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39495)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680400 (= res!446671 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680401 () Bool)

(declare-fun res!446666 () Bool)

(assert (=> b!680401 (=> (not res!446666) (not e!387521))))

(assert (=> b!680401 (= res!446666 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19301 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680402 () Bool)

(declare-fun e!387528 () Bool)

(assert (=> b!680402 (= e!387521 (not e!387528))))

(declare-fun res!446657 () Bool)

(assert (=> b!680402 (=> res!446657 e!387528)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680402 (= res!446657 (not (validKeyInArray!0 (select (arr!18937 a!3626) from!3004))))))

(declare-datatypes ((Unit!23866 0))(
  ( (Unit!23867) )
))
(declare-fun lt!313077 () Unit!23866)

(declare-fun e!387524 () Unit!23866)

(assert (=> b!680402 (= lt!313077 e!387524)))

(declare-fun c!77237 () Bool)

(assert (=> b!680402 (= c!77237 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680402 (arrayContainsKey!0 (array!39496 (store (arr!18937 a!3626) i!1382 k0!2843) (size!19301 a!3626)) k0!2843 from!3004)))

(declare-fun b!680403 () Bool)

(declare-fun Unit!23868 () Unit!23866)

(assert (=> b!680403 (= e!387524 Unit!23868)))

(declare-fun lt!313076 () Unit!23866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39495 (_ BitVec 64) (_ BitVec 32)) Unit!23866)

(assert (=> b!680403 (= lt!313076 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680403 false))

(declare-fun b!680404 () Bool)

(declare-fun e!387525 () Bool)

(assert (=> b!680404 (= e!387527 e!387525)))

(declare-fun res!446669 () Bool)

(assert (=> b!680404 (=> (not res!446669) (not e!387525))))

(assert (=> b!680404 (= res!446669 (bvsle from!3004 i!1382))))

(declare-fun res!446661 () Bool)

(assert (=> start!60514 (=> (not res!446661) (not e!387521))))

(assert (=> start!60514 (= res!446661 (and (bvslt (size!19301 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19301 a!3626))))))

(assert (=> start!60514 e!387521))

(assert (=> start!60514 true))

(declare-fun array_inv!14733 (array!39495) Bool)

(assert (=> start!60514 (array_inv!14733 a!3626)))

(declare-fun b!680405 () Bool)

(declare-fun res!446665 () Bool)

(assert (=> b!680405 (=> (not res!446665) (not e!387521))))

(assert (=> b!680405 (= res!446665 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19301 a!3626))))))

(declare-fun b!680406 () Bool)

(declare-fun res!446664 () Bool)

(assert (=> b!680406 (=> (not res!446664) (not e!387521))))

(declare-fun arrayNoDuplicates!0 (array!39495 (_ BitVec 32) List!12978) Bool)

(assert (=> b!680406 (= res!446664 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680407 () Bool)

(assert (=> b!680407 (= e!387523 (contains!3555 acc!681 k0!2843))))

(declare-fun b!680408 () Bool)

(declare-fun e!387522 () Bool)

(assert (=> b!680408 (= e!387528 e!387522)))

(declare-fun res!446667 () Bool)

(assert (=> b!680408 (=> res!446667 e!387522)))

(assert (=> b!680408 (= res!446667 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!141 (List!12978 List!12978) Bool)

(assert (=> b!680408 (subseq!141 acc!681 acc!681)))

(declare-fun lt!313078 () Unit!23866)

(declare-fun lemmaListSubSeqRefl!0 (List!12978) Unit!23866)

(assert (=> b!680408 (= lt!313078 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680409 () Bool)

(declare-fun Unit!23869 () Unit!23866)

(assert (=> b!680409 (= e!387524 Unit!23869)))

(declare-fun b!680410 () Bool)

(declare-fun res!446659 () Bool)

(assert (=> b!680410 (=> (not res!446659) (not e!387521))))

(assert (=> b!680410 (= res!446659 (validKeyInArray!0 k0!2843))))

(declare-fun b!680411 () Bool)

(declare-fun $colon$colon!306 (List!12978 (_ BitVec 64)) List!12978)

(assert (=> b!680411 (= e!387522 (noDuplicate!802 ($colon$colon!306 acc!681 (select (arr!18937 a!3626) from!3004))))))

(declare-fun b!680412 () Bool)

(declare-fun res!446670 () Bool)

(assert (=> b!680412 (=> (not res!446670) (not e!387521))))

(assert (=> b!680412 (= res!446670 (not (contains!3555 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680413 () Bool)

(assert (=> b!680413 (= e!387525 (not (contains!3555 acc!681 k0!2843)))))

(declare-fun b!680414 () Bool)

(declare-fun res!446662 () Bool)

(assert (=> b!680414 (=> (not res!446662) (not e!387521))))

(assert (=> b!680414 (= res!446662 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12975))))

(assert (= (and start!60514 res!446661) b!680397))

(assert (= (and b!680397 res!446663) b!680412))

(assert (= (and b!680412 res!446670) b!680398))

(assert (= (and b!680398 res!446658) b!680399))

(assert (= (and b!680399 res!446668) b!680407))

(assert (= (and b!680399 (not res!446672)) b!680404))

(assert (= (and b!680404 res!446669) b!680413))

(assert (= (and b!680399 res!446660) b!680414))

(assert (= (and b!680414 res!446662) b!680406))

(assert (= (and b!680406 res!446664) b!680405))

(assert (= (and b!680405 res!446665) b!680410))

(assert (= (and b!680410 res!446659) b!680400))

(assert (= (and b!680400 res!446671) b!680401))

(assert (= (and b!680401 res!446666) b!680402))

(assert (= (and b!680402 c!77237) b!680403))

(assert (= (and b!680402 (not c!77237)) b!680409))

(assert (= (and b!680402 (not res!446657)) b!680408))

(assert (= (and b!680408 (not res!446667)) b!680411))

(declare-fun m!645463 () Bool)

(assert (=> start!60514 m!645463))

(declare-fun m!645465 () Bool)

(assert (=> b!680414 m!645465))

(declare-fun m!645467 () Bool)

(assert (=> b!680407 m!645467))

(declare-fun m!645469 () Bool)

(assert (=> b!680400 m!645469))

(declare-fun m!645471 () Bool)

(assert (=> b!680397 m!645471))

(declare-fun m!645473 () Bool)

(assert (=> b!680398 m!645473))

(declare-fun m!645475 () Bool)

(assert (=> b!680402 m!645475))

(declare-fun m!645477 () Bool)

(assert (=> b!680402 m!645477))

(declare-fun m!645479 () Bool)

(assert (=> b!680402 m!645479))

(assert (=> b!680402 m!645475))

(declare-fun m!645481 () Bool)

(assert (=> b!680402 m!645481))

(declare-fun m!645483 () Bool)

(assert (=> b!680402 m!645483))

(declare-fun m!645485 () Bool)

(assert (=> b!680412 m!645485))

(declare-fun m!645487 () Bool)

(assert (=> b!680403 m!645487))

(assert (=> b!680413 m!645467))

(declare-fun m!645489 () Bool)

(assert (=> b!680408 m!645489))

(declare-fun m!645491 () Bool)

(assert (=> b!680408 m!645491))

(assert (=> b!680411 m!645475))

(assert (=> b!680411 m!645475))

(declare-fun m!645493 () Bool)

(assert (=> b!680411 m!645493))

(assert (=> b!680411 m!645493))

(declare-fun m!645495 () Bool)

(assert (=> b!680411 m!645495))

(declare-fun m!645497 () Bool)

(assert (=> b!680410 m!645497))

(declare-fun m!645499 () Bool)

(assert (=> b!680406 m!645499))

(check-sat (not b!680407) (not b!680408) (not b!680406) (not b!680400) (not start!60514) (not b!680403) (not b!680397) (not b!680398) (not b!680410) (not b!680414) (not b!680402) (not b!680413) (not b!680412) (not b!680411))
(check-sat)
(get-model)

(declare-fun d!93573 () Bool)

(declare-fun lt!313090 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!267 (List!12978) (InoxSet (_ BitVec 64)))

(assert (=> d!93573 (= lt!313090 (select (content!267 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387558 () Bool)

(assert (=> d!93573 (= lt!313090 e!387558)))

(declare-fun res!446726 () Bool)

(assert (=> d!93573 (=> (not res!446726) (not e!387558))))

(get-info :version)

(assert (=> d!93573 (= res!446726 ((_ is Cons!12974) acc!681))))

(assert (=> d!93573 (= (contains!3555 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313090)))

(declare-fun b!680473 () Bool)

(declare-fun e!387557 () Bool)

(assert (=> b!680473 (= e!387558 e!387557)))

(declare-fun res!446725 () Bool)

(assert (=> b!680473 (=> res!446725 e!387557)))

(assert (=> b!680473 (= res!446725 (= (h!14019 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680474 () Bool)

(assert (=> b!680474 (= e!387557 (contains!3555 (t!19206 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93573 res!446726) b!680473))

(assert (= (and b!680473 (not res!446725)) b!680474))

(declare-fun m!645539 () Bool)

(assert (=> d!93573 m!645539))

(declare-fun m!645541 () Bool)

(assert (=> d!93573 m!645541))

(declare-fun m!645543 () Bool)

(assert (=> b!680474 m!645543))

(assert (=> b!680398 d!93573))

(declare-fun b!680494 () Bool)

(declare-fun e!387580 () Bool)

(declare-fun e!387578 () Bool)

(assert (=> b!680494 (= e!387580 e!387578)))

(declare-fun res!446746 () Bool)

(assert (=> b!680494 (=> res!446746 e!387578)))

(declare-fun e!387575 () Bool)

(assert (=> b!680494 (= res!446746 e!387575)))

(declare-fun res!446742 () Bool)

(assert (=> b!680494 (=> (not res!446742) (not e!387575))))

(assert (=> b!680494 (= res!446742 (= (h!14019 acc!681) (h!14019 acc!681)))))

(declare-fun b!680493 () Bool)

(declare-fun e!387579 () Bool)

(assert (=> b!680493 (= e!387579 e!387580)))

(declare-fun res!446741 () Bool)

(assert (=> b!680493 (=> (not res!446741) (not e!387580))))

(assert (=> b!680493 (= res!446741 ((_ is Cons!12974) acc!681))))

(declare-fun d!93579 () Bool)

(declare-fun res!446745 () Bool)

(assert (=> d!93579 (=> res!446745 e!387579)))

(assert (=> d!93579 (= res!446745 ((_ is Nil!12975) acc!681))))

(assert (=> d!93579 (= (subseq!141 acc!681 acc!681) e!387579)))

(declare-fun b!680496 () Bool)

(assert (=> b!680496 (= e!387578 (subseq!141 acc!681 (t!19206 acc!681)))))

(declare-fun b!680495 () Bool)

(assert (=> b!680495 (= e!387575 (subseq!141 (t!19206 acc!681) (t!19206 acc!681)))))

(assert (= (and d!93579 (not res!446745)) b!680493))

(assert (= (and b!680493 res!446741) b!680494))

(assert (= (and b!680494 res!446742) b!680495))

(assert (= (and b!680494 (not res!446746)) b!680496))

(declare-fun m!645545 () Bool)

(assert (=> b!680496 m!645545))

(declare-fun m!645547 () Bool)

(assert (=> b!680495 m!645547))

(assert (=> b!680408 d!93579))

(declare-fun d!93583 () Bool)

(assert (=> d!93583 (subseq!141 acc!681 acc!681)))

(declare-fun lt!313093 () Unit!23866)

(declare-fun choose!36 (List!12978) Unit!23866)

(assert (=> d!93583 (= lt!313093 (choose!36 acc!681))))

(assert (=> d!93583 (= (lemmaListSubSeqRefl!0 acc!681) lt!313093)))

(declare-fun bs!19978 () Bool)

(assert (= bs!19978 d!93583))

(assert (=> bs!19978 m!645489))

(declare-fun m!645549 () Bool)

(assert (=> bs!19978 m!645549))

(assert (=> b!680408 d!93583))

(declare-fun d!93585 () Bool)

(declare-fun res!446761 () Bool)

(declare-fun e!387599 () Bool)

(assert (=> d!93585 (=> res!446761 e!387599)))

(assert (=> d!93585 (= res!446761 ((_ is Nil!12975) acc!681))))

(assert (=> d!93585 (= (noDuplicate!802 acc!681) e!387599)))

(declare-fun b!680521 () Bool)

(declare-fun e!387600 () Bool)

(assert (=> b!680521 (= e!387599 e!387600)))

(declare-fun res!446762 () Bool)

(assert (=> b!680521 (=> (not res!446762) (not e!387600))))

(assert (=> b!680521 (= res!446762 (not (contains!3555 (t!19206 acc!681) (h!14019 acc!681))))))

(declare-fun b!680522 () Bool)

(assert (=> b!680522 (= e!387600 (noDuplicate!802 (t!19206 acc!681)))))

(assert (= (and d!93585 (not res!446761)) b!680521))

(assert (= (and b!680521 res!446762) b!680522))

(declare-fun m!645563 () Bool)

(assert (=> b!680521 m!645563))

(declare-fun m!645565 () Bool)

(assert (=> b!680522 m!645565))

(assert (=> b!680397 d!93585))

(declare-fun d!93591 () Bool)

(declare-fun lt!313094 () Bool)

(assert (=> d!93591 (= lt!313094 (select (content!267 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387602 () Bool)

(assert (=> d!93591 (= lt!313094 e!387602)))

(declare-fun res!446764 () Bool)

(assert (=> d!93591 (=> (not res!446764) (not e!387602))))

(assert (=> d!93591 (= res!446764 ((_ is Cons!12974) acc!681))))

(assert (=> d!93591 (= (contains!3555 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313094)))

(declare-fun b!680523 () Bool)

(declare-fun e!387601 () Bool)

(assert (=> b!680523 (= e!387602 e!387601)))

(declare-fun res!446763 () Bool)

(assert (=> b!680523 (=> res!446763 e!387601)))

(assert (=> b!680523 (= res!446763 (= (h!14019 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680524 () Bool)

(assert (=> b!680524 (= e!387601 (contains!3555 (t!19206 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93591 res!446764) b!680523))

(assert (= (and b!680523 (not res!446763)) b!680524))

(assert (=> d!93591 m!645539))

(declare-fun m!645567 () Bool)

(assert (=> d!93591 m!645567))

(declare-fun m!645569 () Bool)

(assert (=> b!680524 m!645569))

(assert (=> b!680412 d!93591))

(declare-fun d!93595 () Bool)

(declare-fun res!446785 () Bool)

(declare-fun e!387623 () Bool)

(assert (=> d!93595 (=> res!446785 e!387623)))

(assert (=> d!93595 (= res!446785 (= (select (arr!18937 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93595 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!387623)))

(declare-fun b!680545 () Bool)

(declare-fun e!387624 () Bool)

(assert (=> b!680545 (= e!387623 e!387624)))

(declare-fun res!446786 () Bool)

(assert (=> b!680545 (=> (not res!446786) (not e!387624))))

(assert (=> b!680545 (= res!446786 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19301 a!3626)))))

(declare-fun b!680546 () Bool)

(assert (=> b!680546 (= e!387624 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93595 (not res!446785)) b!680545))

(assert (= (and b!680545 res!446786) b!680546))

(declare-fun m!645575 () Bool)

(assert (=> d!93595 m!645575))

(declare-fun m!645577 () Bool)

(assert (=> b!680546 m!645577))

(assert (=> b!680400 d!93595))

(declare-fun d!93599 () Bool)

(declare-fun res!446787 () Bool)

(declare-fun e!387625 () Bool)

(assert (=> d!93599 (=> res!446787 e!387625)))

(assert (=> d!93599 (= res!446787 ((_ is Nil!12975) ($colon$colon!306 acc!681 (select (arr!18937 a!3626) from!3004))))))

(assert (=> d!93599 (= (noDuplicate!802 ($colon$colon!306 acc!681 (select (arr!18937 a!3626) from!3004))) e!387625)))

(declare-fun b!680547 () Bool)

(declare-fun e!387626 () Bool)

(assert (=> b!680547 (= e!387625 e!387626)))

(declare-fun res!446788 () Bool)

(assert (=> b!680547 (=> (not res!446788) (not e!387626))))

(assert (=> b!680547 (= res!446788 (not (contains!3555 (t!19206 ($colon$colon!306 acc!681 (select (arr!18937 a!3626) from!3004))) (h!14019 ($colon$colon!306 acc!681 (select (arr!18937 a!3626) from!3004))))))))

(declare-fun b!680548 () Bool)

(assert (=> b!680548 (= e!387626 (noDuplicate!802 (t!19206 ($colon$colon!306 acc!681 (select (arr!18937 a!3626) from!3004)))))))

(assert (= (and d!93599 (not res!446787)) b!680547))

(assert (= (and b!680547 res!446788) b!680548))

(declare-fun m!645579 () Bool)

(assert (=> b!680547 m!645579))

(declare-fun m!645581 () Bool)

(assert (=> b!680548 m!645581))

(assert (=> b!680411 d!93599))

(declare-fun d!93601 () Bool)

(assert (=> d!93601 (= ($colon$colon!306 acc!681 (select (arr!18937 a!3626) from!3004)) (Cons!12974 (select (arr!18937 a!3626) from!3004) acc!681))))

(assert (=> b!680411 d!93601))

(declare-fun d!93605 () Bool)

(assert (=> d!93605 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680410 d!93605))

(declare-fun d!93613 () Bool)

(assert (=> d!93613 (= (array_inv!14733 a!3626) (bvsge (size!19301 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60514 d!93613))

(declare-fun b!680583 () Bool)

(declare-fun e!387662 () Bool)

(declare-fun call!33947 () Bool)

(assert (=> b!680583 (= e!387662 call!33947)))

(declare-fun d!93615 () Bool)

(declare-fun res!446820 () Bool)

(declare-fun e!387659 () Bool)

(assert (=> d!93615 (=> res!446820 e!387659)))

(assert (=> d!93615 (= res!446820 (bvsge #b00000000000000000000000000000000 (size!19301 a!3626)))))

(assert (=> d!93615 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12975) e!387659)))

(declare-fun bm!33944 () Bool)

(declare-fun c!77249 () Bool)

(assert (=> bm!33944 (= call!33947 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77249 (Cons!12974 (select (arr!18937 a!3626) #b00000000000000000000000000000000) Nil!12975) Nil!12975)))))

(declare-fun b!680584 () Bool)

(declare-fun e!387661 () Bool)

(assert (=> b!680584 (= e!387661 (contains!3555 Nil!12975 (select (arr!18937 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680585 () Bool)

(declare-fun e!387660 () Bool)

(assert (=> b!680585 (= e!387660 e!387662)))

(assert (=> b!680585 (= c!77249 (validKeyInArray!0 (select (arr!18937 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680586 () Bool)

(assert (=> b!680586 (= e!387659 e!387660)))

(declare-fun res!446819 () Bool)

(assert (=> b!680586 (=> (not res!446819) (not e!387660))))

(assert (=> b!680586 (= res!446819 (not e!387661))))

(declare-fun res!446821 () Bool)

(assert (=> b!680586 (=> (not res!446821) (not e!387661))))

(assert (=> b!680586 (= res!446821 (validKeyInArray!0 (select (arr!18937 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680587 () Bool)

(assert (=> b!680587 (= e!387662 call!33947)))

(assert (= (and d!93615 (not res!446820)) b!680586))

(assert (= (and b!680586 res!446821) b!680584))

(assert (= (and b!680586 res!446819) b!680585))

(assert (= (and b!680585 c!77249) b!680583))

(assert (= (and b!680585 (not c!77249)) b!680587))

(assert (= (or b!680583 b!680587) bm!33944))

(assert (=> bm!33944 m!645575))

(declare-fun m!645613 () Bool)

(assert (=> bm!33944 m!645613))

(assert (=> b!680584 m!645575))

(assert (=> b!680584 m!645575))

(declare-fun m!645615 () Bool)

(assert (=> b!680584 m!645615))

(assert (=> b!680585 m!645575))

(assert (=> b!680585 m!645575))

(declare-fun m!645617 () Bool)

(assert (=> b!680585 m!645617))

(assert (=> b!680586 m!645575))

(assert (=> b!680586 m!645575))

(assert (=> b!680586 m!645617))

(assert (=> b!680414 d!93615))

(declare-fun d!93635 () Bool)

(assert (=> d!93635 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313113 () Unit!23866)

(declare-fun choose!13 (array!39495 (_ BitVec 64) (_ BitVec 32)) Unit!23866)

(assert (=> d!93635 (= lt!313113 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93635 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93635 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313113)))

(declare-fun bs!19982 () Bool)

(assert (= bs!19982 d!93635))

(assert (=> bs!19982 m!645469))

(declare-fun m!645641 () Bool)

(assert (=> bs!19982 m!645641))

(assert (=> b!680403 d!93635))

(declare-fun d!93645 () Bool)

(assert (=> d!93645 (= (validKeyInArray!0 (select (arr!18937 a!3626) from!3004)) (and (not (= (select (arr!18937 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18937 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680402 d!93645))

(declare-fun d!93647 () Bool)

(declare-fun res!446840 () Bool)

(declare-fun e!387683 () Bool)

(assert (=> d!93647 (=> res!446840 e!387683)))

(assert (=> d!93647 (= res!446840 (= (select (arr!18937 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93647 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387683)))

(declare-fun b!680610 () Bool)

(declare-fun e!387684 () Bool)

(assert (=> b!680610 (= e!387683 e!387684)))

(declare-fun res!446841 () Bool)

(assert (=> b!680610 (=> (not res!446841) (not e!387684))))

(assert (=> b!680610 (= res!446841 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19301 a!3626)))))

(declare-fun b!680611 () Bool)

(assert (=> b!680611 (= e!387684 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93647 (not res!446840)) b!680610))

(assert (= (and b!680610 res!446841) b!680611))

(declare-fun m!645649 () Bool)

(assert (=> d!93647 m!645649))

(declare-fun m!645651 () Bool)

(assert (=> b!680611 m!645651))

(assert (=> b!680402 d!93647))

(declare-fun d!93655 () Bool)

(declare-fun res!446846 () Bool)

(declare-fun e!387689 () Bool)

(assert (=> d!93655 (=> res!446846 e!387689)))

(assert (=> d!93655 (= res!446846 (= (select (arr!18937 (array!39496 (store (arr!18937 a!3626) i!1382 k0!2843) (size!19301 a!3626))) from!3004) k0!2843))))

(assert (=> d!93655 (= (arrayContainsKey!0 (array!39496 (store (arr!18937 a!3626) i!1382 k0!2843) (size!19301 a!3626)) k0!2843 from!3004) e!387689)))

(declare-fun b!680616 () Bool)

(declare-fun e!387690 () Bool)

(assert (=> b!680616 (= e!387689 e!387690)))

(declare-fun res!446847 () Bool)

(assert (=> b!680616 (=> (not res!446847) (not e!387690))))

(assert (=> b!680616 (= res!446847 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19301 (array!39496 (store (arr!18937 a!3626) i!1382 k0!2843) (size!19301 a!3626)))))))

(declare-fun b!680617 () Bool)

(assert (=> b!680617 (= e!387690 (arrayContainsKey!0 (array!39496 (store (arr!18937 a!3626) i!1382 k0!2843) (size!19301 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93655 (not res!446846)) b!680616))

(assert (= (and b!680616 res!446847) b!680617))

(declare-fun m!645663 () Bool)

(assert (=> d!93655 m!645663))

(declare-fun m!645667 () Bool)

(assert (=> b!680617 m!645667))

(assert (=> b!680402 d!93655))

(declare-fun d!93663 () Bool)

(declare-fun lt!313117 () Bool)

(assert (=> d!93663 (= lt!313117 (select (content!267 acc!681) k0!2843))))

(declare-fun e!387696 () Bool)

(assert (=> d!93663 (= lt!313117 e!387696)))

(declare-fun res!446853 () Bool)

(assert (=> d!93663 (=> (not res!446853) (not e!387696))))

(assert (=> d!93663 (= res!446853 ((_ is Cons!12974) acc!681))))

(assert (=> d!93663 (= (contains!3555 acc!681 k0!2843) lt!313117)))

(declare-fun b!680622 () Bool)

(declare-fun e!387695 () Bool)

(assert (=> b!680622 (= e!387696 e!387695)))

(declare-fun res!446852 () Bool)

(assert (=> b!680622 (=> res!446852 e!387695)))

(assert (=> b!680622 (= res!446852 (= (h!14019 acc!681) k0!2843))))

(declare-fun b!680623 () Bool)

(assert (=> b!680623 (= e!387695 (contains!3555 (t!19206 acc!681) k0!2843))))

(assert (= (and d!93663 res!446853) b!680622))

(assert (= (and b!680622 (not res!446852)) b!680623))

(assert (=> d!93663 m!645539))

(declare-fun m!645673 () Bool)

(assert (=> d!93663 m!645673))

(declare-fun m!645675 () Bool)

(assert (=> b!680623 m!645675))

(assert (=> b!680413 d!93663))

(assert (=> b!680407 d!93663))

(declare-fun b!680624 () Bool)

(declare-fun e!387700 () Bool)

(declare-fun call!33950 () Bool)

(assert (=> b!680624 (= e!387700 call!33950)))

(declare-fun d!93667 () Bool)

(declare-fun res!446855 () Bool)

(declare-fun e!387697 () Bool)

(assert (=> d!93667 (=> res!446855 e!387697)))

(assert (=> d!93667 (= res!446855 (bvsge from!3004 (size!19301 a!3626)))))

(assert (=> d!93667 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387697)))

(declare-fun c!77252 () Bool)

(declare-fun bm!33947 () Bool)

(assert (=> bm!33947 (= call!33950 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77252 (Cons!12974 (select (arr!18937 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun e!387699 () Bool)

(declare-fun b!680625 () Bool)

(assert (=> b!680625 (= e!387699 (contains!3555 acc!681 (select (arr!18937 a!3626) from!3004)))))

(declare-fun b!680626 () Bool)

(declare-fun e!387698 () Bool)

(assert (=> b!680626 (= e!387698 e!387700)))

(assert (=> b!680626 (= c!77252 (validKeyInArray!0 (select (arr!18937 a!3626) from!3004)))))

(declare-fun b!680627 () Bool)

(assert (=> b!680627 (= e!387697 e!387698)))

(declare-fun res!446854 () Bool)

(assert (=> b!680627 (=> (not res!446854) (not e!387698))))

(assert (=> b!680627 (= res!446854 (not e!387699))))

(declare-fun res!446856 () Bool)

(assert (=> b!680627 (=> (not res!446856) (not e!387699))))

(assert (=> b!680627 (= res!446856 (validKeyInArray!0 (select (arr!18937 a!3626) from!3004)))))

(declare-fun b!680628 () Bool)

(assert (=> b!680628 (= e!387700 call!33950)))

(assert (= (and d!93667 (not res!446855)) b!680627))

(assert (= (and b!680627 res!446856) b!680625))

(assert (= (and b!680627 res!446854) b!680626))

(assert (= (and b!680626 c!77252) b!680624))

(assert (= (and b!680626 (not c!77252)) b!680628))

(assert (= (or b!680624 b!680628) bm!33947))

(assert (=> bm!33947 m!645475))

(declare-fun m!645677 () Bool)

(assert (=> bm!33947 m!645677))

(assert (=> b!680625 m!645475))

(assert (=> b!680625 m!645475))

(declare-fun m!645679 () Bool)

(assert (=> b!680625 m!645679))

(assert (=> b!680626 m!645475))

(assert (=> b!680626 m!645475))

(assert (=> b!680626 m!645481))

(assert (=> b!680627 m!645475))

(assert (=> b!680627 m!645475))

(assert (=> b!680627 m!645481))

(assert (=> b!680406 d!93667))

(check-sat (not b!680626) (not b!680474) (not bm!33944) (not b!680496) (not d!93583) (not b!680625) (not b!680547) (not b!680627) (not d!93635) (not bm!33947) (not b!680524) (not b!680611) (not d!93573) (not b!680522) (not d!93591) (not b!680495) (not b!680546) (not b!680617) (not b!680548) (not b!680521) (not b!680623) (not b!680584) (not b!680585) (not b!680586) (not d!93663))
(check-sat)
