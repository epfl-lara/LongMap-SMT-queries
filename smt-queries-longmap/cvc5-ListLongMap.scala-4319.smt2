; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59942 () Bool)

(assert start!59942)

(declare-fun b!664403 () Bool)

(declare-fun res!432111 () Bool)

(declare-fun e!381030 () Bool)

(assert (=> b!664403 (=> (not res!432111) (not e!381030))))

(declare-datatypes ((List!12728 0))(
  ( (Nil!12725) (Cons!12724 (h!13769 (_ BitVec 64)) (t!18956 List!12728)) )
))
(declare-fun acc!681 () List!12728)

(declare-fun contains!3305 (List!12728 (_ BitVec 64)) Bool)

(assert (=> b!664403 (= res!432111 (not (contains!3305 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664404 () Bool)

(declare-fun res!432103 () Bool)

(assert (=> b!664404 (=> (not res!432103) (not e!381030))))

(assert (=> b!664404 (= res!432103 (not (contains!3305 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664405 () Bool)

(declare-fun res!432108 () Bool)

(assert (=> b!664405 (=> (not res!432108) (not e!381030))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664405 (= res!432108 (validKeyInArray!0 k!2843))))

(declare-fun b!664406 () Bool)

(declare-fun res!432117 () Bool)

(declare-fun e!381026 () Bool)

(assert (=> b!664406 (=> res!432117 e!381026)))

(declare-fun lt!309610 () Bool)

(assert (=> b!664406 (= res!432117 lt!309610)))

(declare-fun b!664407 () Bool)

(declare-fun res!432109 () Bool)

(assert (=> b!664407 (=> (not res!432109) (not e!381030))))

(declare-fun noDuplicate!552 (List!12728) Bool)

(assert (=> b!664407 (= res!432109 (noDuplicate!552 acc!681))))

(declare-fun b!664408 () Bool)

(declare-fun res!432113 () Bool)

(assert (=> b!664408 (=> (not res!432113) (not e!381030))))

(declare-datatypes ((array!38989 0))(
  ( (array!38990 (arr!18687 (Array (_ BitVec 32) (_ BitVec 64))) (size!19051 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38989)

(declare-fun arrayNoDuplicates!0 (array!38989 (_ BitVec 32) List!12728) Bool)

(assert (=> b!664408 (= res!432113 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12725))))

(declare-fun b!664409 () Bool)

(declare-datatypes ((Unit!23160 0))(
  ( (Unit!23161) )
))
(declare-fun e!381029 () Unit!23160)

(declare-fun Unit!23162 () Unit!23160)

(assert (=> b!664409 (= e!381029 Unit!23162)))

(declare-fun b!664410 () Bool)

(declare-fun res!432106 () Bool)

(assert (=> b!664410 (=> res!432106 e!381026)))

(declare-fun lt!309608 () List!12728)

(assert (=> b!664410 (= res!432106 (contains!3305 lt!309608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664411 () Bool)

(declare-fun res!432114 () Bool)

(assert (=> b!664411 (=> (not res!432114) (not e!381030))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664411 (= res!432114 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19051 a!3626))))))

(declare-fun b!664412 () Bool)

(declare-fun e!381031 () Bool)

(assert (=> b!664412 (= e!381031 (not (contains!3305 acc!681 k!2843)))))

(declare-fun b!664413 () Bool)

(declare-fun e!381032 () Bool)

(assert (=> b!664413 (= e!381032 e!381031)))

(declare-fun res!432116 () Bool)

(assert (=> b!664413 (=> (not res!432116) (not e!381031))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664413 (= res!432116 (bvsle from!3004 i!1382))))

(declare-fun b!664414 () Bool)

(declare-fun e!381028 () Unit!23160)

(declare-fun Unit!23163 () Unit!23160)

(assert (=> b!664414 (= e!381028 Unit!23163)))

(declare-fun b!664415 () Bool)

(declare-fun Unit!23164 () Unit!23160)

(assert (=> b!664415 (= e!381029 Unit!23164)))

(declare-fun lt!309605 () Unit!23160)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38989 (_ BitVec 64) (_ BitVec 32)) Unit!23160)

(assert (=> b!664415 (= lt!309605 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664415 false))

(declare-fun b!664416 () Bool)

(assert (=> b!664416 (= e!381026 true)))

(declare-fun lt!309613 () Bool)

(assert (=> b!664416 (= lt!309613 (contains!3305 lt!309608 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!432105 () Bool)

(assert (=> start!59942 (=> (not res!432105) (not e!381030))))

(assert (=> start!59942 (= res!432105 (and (bvslt (size!19051 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19051 a!3626))))))

(assert (=> start!59942 e!381030))

(assert (=> start!59942 true))

(declare-fun array_inv!14483 (array!38989) Bool)

(assert (=> start!59942 (array_inv!14483 a!3626)))

(declare-fun b!664417 () Bool)

(declare-fun e!381027 () Bool)

(assert (=> b!664417 (= e!381027 (contains!3305 acc!681 k!2843))))

(declare-fun b!664418 () Bool)

(assert (=> b!664418 (= e!381030 (not e!381026))))

(declare-fun res!432110 () Bool)

(assert (=> b!664418 (=> res!432110 e!381026)))

(assert (=> b!664418 (= res!432110 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!42 (List!12728 (_ BitVec 64)) List!12728)

(assert (=> b!664418 (= (-!42 lt!309608 k!2843) acc!681)))

(declare-fun $colon$colon!176 (List!12728 (_ BitVec 64)) List!12728)

(assert (=> b!664418 (= lt!309608 ($colon$colon!176 acc!681 k!2843))))

(declare-fun lt!309604 () Unit!23160)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12728) Unit!23160)

(assert (=> b!664418 (= lt!309604 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!44 (List!12728 List!12728) Bool)

(assert (=> b!664418 (subseq!44 acc!681 acc!681)))

(declare-fun lt!309609 () Unit!23160)

(declare-fun lemmaListSubSeqRefl!0 (List!12728) Unit!23160)

(assert (=> b!664418 (= lt!309609 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664418 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309611 () Unit!23160)

(assert (=> b!664418 (= lt!309611 e!381028)))

(declare-fun c!76520 () Bool)

(assert (=> b!664418 (= c!76520 (validKeyInArray!0 (select (arr!18687 a!3626) from!3004)))))

(declare-fun lt!309612 () Unit!23160)

(assert (=> b!664418 (= lt!309612 e!381029)))

(declare-fun c!76519 () Bool)

(assert (=> b!664418 (= c!76519 lt!309610)))

(declare-fun arrayContainsKey!0 (array!38989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664418 (= lt!309610 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664418 (arrayContainsKey!0 (array!38990 (store (arr!18687 a!3626) i!1382 k!2843) (size!19051 a!3626)) k!2843 from!3004)))

(declare-fun b!664419 () Bool)

(declare-fun res!432118 () Bool)

(assert (=> b!664419 (=> (not res!432118) (not e!381030))))

(assert (=> b!664419 (= res!432118 e!381032)))

(declare-fun res!432099 () Bool)

(assert (=> b!664419 (=> res!432099 e!381032)))

(assert (=> b!664419 (= res!432099 e!381027)))

(declare-fun res!432115 () Bool)

(assert (=> b!664419 (=> (not res!432115) (not e!381027))))

(assert (=> b!664419 (= res!432115 (bvsgt from!3004 i!1382))))

(declare-fun b!664420 () Bool)

(declare-fun res!432104 () Bool)

(assert (=> b!664420 (=> res!432104 e!381026)))

(assert (=> b!664420 (= res!432104 (not (subseq!44 acc!681 lt!309608)))))

(declare-fun b!664421 () Bool)

(declare-fun res!432101 () Bool)

(assert (=> b!664421 (=> res!432101 e!381026)))

(assert (=> b!664421 (= res!432101 (not (contains!3305 lt!309608 k!2843)))))

(declare-fun b!664422 () Bool)

(declare-fun res!432102 () Bool)

(assert (=> b!664422 (=> (not res!432102) (not e!381030))))

(assert (=> b!664422 (= res!432102 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664423 () Bool)

(declare-fun res!432100 () Bool)

(assert (=> b!664423 (=> (not res!432100) (not e!381030))))

(assert (=> b!664423 (= res!432100 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19051 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664424 () Bool)

(declare-fun res!432119 () Bool)

(assert (=> b!664424 (=> res!432119 e!381026)))

(assert (=> b!664424 (= res!432119 (not (noDuplicate!552 lt!309608)))))

(declare-fun b!664425 () Bool)

(declare-fun lt!309606 () Unit!23160)

(assert (=> b!664425 (= e!381028 lt!309606)))

(declare-fun lt!309607 () Unit!23160)

(assert (=> b!664425 (= lt!309607 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664425 (subseq!44 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38989 List!12728 List!12728 (_ BitVec 32)) Unit!23160)

(assert (=> b!664425 (= lt!309606 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!176 acc!681 (select (arr!18687 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664425 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664426 () Bool)

(declare-fun res!432107 () Bool)

(assert (=> b!664426 (=> (not res!432107) (not e!381030))))

(assert (=> b!664426 (= res!432107 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664427 () Bool)

(declare-fun res!432112 () Bool)

(assert (=> b!664427 (=> res!432112 e!381026)))

(assert (=> b!664427 (= res!432112 (contains!3305 acc!681 k!2843))))

(assert (= (and start!59942 res!432105) b!664407))

(assert (= (and b!664407 res!432109) b!664404))

(assert (= (and b!664404 res!432103) b!664403))

(assert (= (and b!664403 res!432111) b!664419))

(assert (= (and b!664419 res!432115) b!664417))

(assert (= (and b!664419 (not res!432099)) b!664413))

(assert (= (and b!664413 res!432116) b!664412))

(assert (= (and b!664419 res!432118) b!664408))

(assert (= (and b!664408 res!432113) b!664422))

(assert (= (and b!664422 res!432102) b!664411))

(assert (= (and b!664411 res!432114) b!664405))

(assert (= (and b!664405 res!432108) b!664426))

(assert (= (and b!664426 res!432107) b!664423))

(assert (= (and b!664423 res!432100) b!664418))

(assert (= (and b!664418 c!76519) b!664415))

(assert (= (and b!664418 (not c!76519)) b!664409))

(assert (= (and b!664418 c!76520) b!664425))

(assert (= (and b!664418 (not c!76520)) b!664414))

(assert (= (and b!664418 (not res!432110)) b!664424))

(assert (= (and b!664424 (not res!432119)) b!664406))

(assert (= (and b!664406 (not res!432117)) b!664427))

(assert (= (and b!664427 (not res!432112)) b!664420))

(assert (= (and b!664420 (not res!432104)) b!664421))

(assert (= (and b!664421 (not res!432101)) b!664410))

(assert (= (and b!664410 (not res!432106)) b!664416))

(declare-fun m!635717 () Bool)

(assert (=> b!664410 m!635717))

(declare-fun m!635719 () Bool)

(assert (=> b!664408 m!635719))

(declare-fun m!635721 () Bool)

(assert (=> b!664412 m!635721))

(declare-fun m!635723 () Bool)

(assert (=> b!664403 m!635723))

(assert (=> b!664417 m!635721))

(declare-fun m!635725 () Bool)

(assert (=> start!59942 m!635725))

(declare-fun m!635727 () Bool)

(assert (=> b!664418 m!635727))

(declare-fun m!635729 () Bool)

(assert (=> b!664418 m!635729))

(declare-fun m!635731 () Bool)

(assert (=> b!664418 m!635731))

(declare-fun m!635733 () Bool)

(assert (=> b!664418 m!635733))

(declare-fun m!635735 () Bool)

(assert (=> b!664418 m!635735))

(declare-fun m!635737 () Bool)

(assert (=> b!664418 m!635737))

(declare-fun m!635739 () Bool)

(assert (=> b!664418 m!635739))

(declare-fun m!635741 () Bool)

(assert (=> b!664418 m!635741))

(assert (=> b!664418 m!635729))

(declare-fun m!635743 () Bool)

(assert (=> b!664418 m!635743))

(declare-fun m!635745 () Bool)

(assert (=> b!664418 m!635745))

(declare-fun m!635747 () Bool)

(assert (=> b!664418 m!635747))

(declare-fun m!635749 () Bool)

(assert (=> b!664422 m!635749))

(assert (=> b!664427 m!635721))

(declare-fun m!635751 () Bool)

(assert (=> b!664405 m!635751))

(declare-fun m!635753 () Bool)

(assert (=> b!664420 m!635753))

(declare-fun m!635755 () Bool)

(assert (=> b!664404 m!635755))

(declare-fun m!635757 () Bool)

(assert (=> b!664415 m!635757))

(declare-fun m!635759 () Bool)

(assert (=> b!664421 m!635759))

(declare-fun m!635761 () Bool)

(assert (=> b!664407 m!635761))

(declare-fun m!635763 () Bool)

(assert (=> b!664424 m!635763))

(assert (=> b!664425 m!635727))

(assert (=> b!664425 m!635729))

(declare-fun m!635765 () Bool)

(assert (=> b!664425 m!635765))

(declare-fun m!635767 () Bool)

(assert (=> b!664425 m!635767))

(assert (=> b!664425 m!635729))

(assert (=> b!664425 m!635765))

(assert (=> b!664425 m!635737))

(assert (=> b!664425 m!635747))

(declare-fun m!635769 () Bool)

(assert (=> b!664416 m!635769))

(declare-fun m!635771 () Bool)

(assert (=> b!664426 m!635771))

(push 1)

(assert (not start!59942))

(assert (not b!664408))

(assert (not b!664418))

(assert (not b!664410))

(assert (not b!664427))

(assert (not b!664407))

(assert (not b!664417))

(assert (not b!664405))

(assert (not b!664425))

(assert (not b!664416))

(assert (not b!664403))

(assert (not b!664421))

(assert (not b!664415))

(assert (not b!664420))

(assert (not b!664424))

(assert (not b!664412))

(assert (not b!664404))

(assert (not b!664426))

(assert (not b!664422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

