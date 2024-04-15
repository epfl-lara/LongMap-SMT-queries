; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59994 () Bool)

(assert start!59994)

(declare-fun b!666507 () Bool)

(declare-fun res!433984 () Bool)

(declare-fun e!381611 () Bool)

(assert (=> b!666507 (=> res!433984 e!381611)))

(declare-datatypes ((List!12798 0))(
  ( (Nil!12795) (Cons!12794 (h!13839 (_ BitVec 64)) (t!19017 List!12798)) )
))
(declare-fun acc!681 () List!12798)

(declare-fun lt!310313 () List!12798)

(declare-fun subseq!76 (List!12798 List!12798) Bool)

(assert (=> b!666507 (= res!433984 (not (subseq!76 acc!681 lt!310313)))))

(declare-fun b!666508 () Bool)

(declare-fun res!433981 () Bool)

(assert (=> b!666508 (=> res!433981 e!381611)))

(declare-fun noDuplicate!589 (List!12798) Bool)

(assert (=> b!666508 (= res!433981 (not (noDuplicate!589 lt!310313)))))

(declare-fun b!666509 () Bool)

(declare-fun res!433988 () Bool)

(declare-fun e!381606 () Bool)

(assert (=> b!666509 (=> (not res!433988) (not e!381606))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39052 0))(
  ( (array!39053 (arr!18718 (Array (_ BitVec 32) (_ BitVec 64))) (size!19083 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39052)

(assert (=> b!666509 (= res!433988 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19083 a!3626))))))

(declare-fun b!666510 () Bool)

(declare-fun res!433993 () Bool)

(assert (=> b!666510 (=> (not res!433993) (not e!381606))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666510 (= res!433993 (validKeyInArray!0 k!2843))))

(declare-fun b!666511 () Bool)

(assert (=> b!666511 (= e!381611 true)))

(declare-fun lt!310315 () Bool)

(declare-fun contains!3320 (List!12798 (_ BitVec 64)) Bool)

(assert (=> b!666511 (= lt!310315 (contains!3320 lt!310313 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666512 () Bool)

(declare-datatypes ((Unit!23298 0))(
  ( (Unit!23299) )
))
(declare-fun e!381609 () Unit!23298)

(declare-fun lt!310311 () Unit!23298)

(assert (=> b!666512 (= e!381609 lt!310311)))

(declare-fun lt!310309 () Unit!23298)

(declare-fun lemmaListSubSeqRefl!0 (List!12798) Unit!23298)

(assert (=> b!666512 (= lt!310309 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666512 (subseq!76 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39052 List!12798 List!12798 (_ BitVec 32)) Unit!23298)

(declare-fun $colon$colon!207 (List!12798 (_ BitVec 64)) List!12798)

(assert (=> b!666512 (= lt!310311 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!207 acc!681 (select (arr!18718 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39052 (_ BitVec 32) List!12798) Bool)

(assert (=> b!666512 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666513 () Bool)

(declare-fun res!433987 () Bool)

(assert (=> b!666513 (=> (not res!433987) (not e!381606))))

(declare-fun arrayContainsKey!0 (array!39052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666513 (= res!433987 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666514 () Bool)

(declare-fun res!433991 () Bool)

(assert (=> b!666514 (=> res!433991 e!381611)))

(declare-fun lt!310312 () Bool)

(assert (=> b!666514 (= res!433991 lt!310312)))

(declare-fun res!433998 () Bool)

(assert (=> start!59994 (=> (not res!433998) (not e!381606))))

(assert (=> start!59994 (= res!433998 (and (bvslt (size!19083 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19083 a!3626))))))

(assert (=> start!59994 e!381606))

(assert (=> start!59994 true))

(declare-fun array_inv!14601 (array!39052) Bool)

(assert (=> start!59994 (array_inv!14601 a!3626)))

(declare-fun b!666515 () Bool)

(assert (=> b!666515 (= e!381606 (not e!381611))))

(declare-fun res!433979 () Bool)

(assert (=> b!666515 (=> res!433979 e!381611)))

(assert (=> b!666515 (= res!433979 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!74 (List!12798 (_ BitVec 64)) List!12798)

(assert (=> b!666515 (= (-!74 lt!310313 k!2843) acc!681)))

(assert (=> b!666515 (= lt!310313 ($colon$colon!207 acc!681 k!2843))))

(declare-fun lt!310308 () Unit!23298)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12798) Unit!23298)

(assert (=> b!666515 (= lt!310308 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666515 (subseq!76 acc!681 acc!681)))

(declare-fun lt!310317 () Unit!23298)

(assert (=> b!666515 (= lt!310317 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666515 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310316 () Unit!23298)

(assert (=> b!666515 (= lt!310316 e!381609)))

(declare-fun c!76632 () Bool)

(assert (=> b!666515 (= c!76632 (validKeyInArray!0 (select (arr!18718 a!3626) from!3004)))))

(declare-fun lt!310310 () Unit!23298)

(declare-fun e!381605 () Unit!23298)

(assert (=> b!666515 (= lt!310310 e!381605)))

(declare-fun c!76631 () Bool)

(assert (=> b!666515 (= c!76631 lt!310312)))

(assert (=> b!666515 (= lt!310312 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666515 (arrayContainsKey!0 (array!39053 (store (arr!18718 a!3626) i!1382 k!2843) (size!19083 a!3626)) k!2843 from!3004)))

(declare-fun b!666516 () Bool)

(declare-fun res!433986 () Bool)

(assert (=> b!666516 (=> (not res!433986) (not e!381606))))

(assert (=> b!666516 (= res!433986 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12795))))

(declare-fun b!666517 () Bool)

(declare-fun res!433982 () Bool)

(assert (=> b!666517 (=> (not res!433982) (not e!381606))))

(assert (=> b!666517 (= res!433982 (not (contains!3320 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666518 () Bool)

(declare-fun res!433999 () Bool)

(assert (=> b!666518 (=> (not res!433999) (not e!381606))))

(assert (=> b!666518 (= res!433999 (noDuplicate!589 acc!681))))

(declare-fun b!666519 () Bool)

(declare-fun e!381607 () Bool)

(assert (=> b!666519 (= e!381607 (not (contains!3320 acc!681 k!2843)))))

(declare-fun b!666520 () Bool)

(declare-fun Unit!23300 () Unit!23298)

(assert (=> b!666520 (= e!381605 Unit!23300)))

(declare-fun b!666521 () Bool)

(declare-fun res!433995 () Bool)

(assert (=> b!666521 (=> res!433995 e!381611)))

(assert (=> b!666521 (= res!433995 (not (contains!3320 lt!310313 k!2843)))))

(declare-fun b!666522 () Bool)

(declare-fun res!433980 () Bool)

(assert (=> b!666522 (=> (not res!433980) (not e!381606))))

(assert (=> b!666522 (= res!433980 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19083 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666523 () Bool)

(declare-fun res!433992 () Bool)

(assert (=> b!666523 (=> res!433992 e!381611)))

(assert (=> b!666523 (= res!433992 (contains!3320 lt!310313 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666524 () Bool)

(declare-fun res!433985 () Bool)

(assert (=> b!666524 (=> (not res!433985) (not e!381606))))

(assert (=> b!666524 (= res!433985 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666525 () Bool)

(declare-fun res!433996 () Bool)

(assert (=> b!666525 (=> res!433996 e!381611)))

(assert (=> b!666525 (= res!433996 (contains!3320 acc!681 k!2843))))

(declare-fun b!666526 () Bool)

(declare-fun Unit!23301 () Unit!23298)

(assert (=> b!666526 (= e!381605 Unit!23301)))

(declare-fun lt!310314 () Unit!23298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39052 (_ BitVec 64) (_ BitVec 32)) Unit!23298)

(assert (=> b!666526 (= lt!310314 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666526 false))

(declare-fun b!666527 () Bool)

(declare-fun e!381604 () Bool)

(assert (=> b!666527 (= e!381604 (contains!3320 acc!681 k!2843))))

(declare-fun b!666528 () Bool)

(declare-fun e!381610 () Bool)

(assert (=> b!666528 (= e!381610 e!381607)))

(declare-fun res!433990 () Bool)

(assert (=> b!666528 (=> (not res!433990) (not e!381607))))

(assert (=> b!666528 (= res!433990 (bvsle from!3004 i!1382))))

(declare-fun b!666529 () Bool)

(declare-fun res!433989 () Bool)

(assert (=> b!666529 (=> (not res!433989) (not e!381606))))

(assert (=> b!666529 (= res!433989 (not (contains!3320 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666530 () Bool)

(declare-fun Unit!23302 () Unit!23298)

(assert (=> b!666530 (= e!381609 Unit!23302)))

(declare-fun b!666531 () Bool)

(declare-fun res!433983 () Bool)

(assert (=> b!666531 (=> (not res!433983) (not e!381606))))

(assert (=> b!666531 (= res!433983 e!381610)))

(declare-fun res!433994 () Bool)

(assert (=> b!666531 (=> res!433994 e!381610)))

(assert (=> b!666531 (= res!433994 e!381604)))

(declare-fun res!433997 () Bool)

(assert (=> b!666531 (=> (not res!433997) (not e!381604))))

(assert (=> b!666531 (= res!433997 (bvsgt from!3004 i!1382))))

(assert (= (and start!59994 res!433998) b!666518))

(assert (= (and b!666518 res!433999) b!666529))

(assert (= (and b!666529 res!433989) b!666517))

(assert (= (and b!666517 res!433982) b!666531))

(assert (= (and b!666531 res!433997) b!666527))

(assert (= (and b!666531 (not res!433994)) b!666528))

(assert (= (and b!666528 res!433990) b!666519))

(assert (= (and b!666531 res!433983) b!666516))

(assert (= (and b!666516 res!433986) b!666524))

(assert (= (and b!666524 res!433985) b!666509))

(assert (= (and b!666509 res!433988) b!666510))

(assert (= (and b!666510 res!433993) b!666513))

(assert (= (and b!666513 res!433987) b!666522))

(assert (= (and b!666522 res!433980) b!666515))

(assert (= (and b!666515 c!76631) b!666526))

(assert (= (and b!666515 (not c!76631)) b!666520))

(assert (= (and b!666515 c!76632) b!666512))

(assert (= (and b!666515 (not c!76632)) b!666530))

(assert (= (and b!666515 (not res!433979)) b!666508))

(assert (= (and b!666508 (not res!433981)) b!666514))

(assert (= (and b!666514 (not res!433991)) b!666525))

(assert (= (and b!666525 (not res!433996)) b!666507))

(assert (= (and b!666507 (not res!433984)) b!666521))

(assert (= (and b!666521 (not res!433995)) b!666523))

(assert (= (and b!666523 (not res!433992)) b!666511))

(declare-fun m!636727 () Bool)

(assert (=> b!666529 m!636727))

(declare-fun m!636729 () Bool)

(assert (=> b!666513 m!636729))

(declare-fun m!636731 () Bool)

(assert (=> b!666526 m!636731))

(declare-fun m!636733 () Bool)

(assert (=> b!666508 m!636733))

(declare-fun m!636735 () Bool)

(assert (=> b!666510 m!636735))

(declare-fun m!636737 () Bool)

(assert (=> b!666512 m!636737))

(declare-fun m!636739 () Bool)

(assert (=> b!666512 m!636739))

(declare-fun m!636741 () Bool)

(assert (=> b!666512 m!636741))

(declare-fun m!636743 () Bool)

(assert (=> b!666512 m!636743))

(assert (=> b!666512 m!636739))

(assert (=> b!666512 m!636741))

(declare-fun m!636745 () Bool)

(assert (=> b!666512 m!636745))

(declare-fun m!636747 () Bool)

(assert (=> b!666512 m!636747))

(declare-fun m!636749 () Bool)

(assert (=> b!666523 m!636749))

(declare-fun m!636751 () Bool)

(assert (=> b!666507 m!636751))

(declare-fun m!636753 () Bool)

(assert (=> b!666524 m!636753))

(declare-fun m!636755 () Bool)

(assert (=> b!666511 m!636755))

(declare-fun m!636757 () Bool)

(assert (=> b!666518 m!636757))

(declare-fun m!636759 () Bool)

(assert (=> b!666517 m!636759))

(declare-fun m!636761 () Bool)

(assert (=> b!666527 m!636761))

(assert (=> b!666525 m!636761))

(declare-fun m!636763 () Bool)

(assert (=> start!59994 m!636763))

(assert (=> b!666519 m!636761))

(assert (=> b!666515 m!636737))

(assert (=> b!666515 m!636739))

(declare-fun m!636765 () Bool)

(assert (=> b!666515 m!636765))

(declare-fun m!636767 () Bool)

(assert (=> b!666515 m!636767))

(declare-fun m!636769 () Bool)

(assert (=> b!666515 m!636769))

(assert (=> b!666515 m!636745))

(declare-fun m!636771 () Bool)

(assert (=> b!666515 m!636771))

(declare-fun m!636773 () Bool)

(assert (=> b!666515 m!636773))

(assert (=> b!666515 m!636739))

(declare-fun m!636775 () Bool)

(assert (=> b!666515 m!636775))

(declare-fun m!636777 () Bool)

(assert (=> b!666515 m!636777))

(assert (=> b!666515 m!636747))

(declare-fun m!636779 () Bool)

(assert (=> b!666521 m!636779))

(declare-fun m!636781 () Bool)

(assert (=> b!666516 m!636781))

(push 1)

(assert (not b!666512))

(assert (not start!59994))

(assert (not b!666507))

(assert (not b!666529))

(assert (not b!666508))

(assert (not b!666518))

(assert (not b!666516))

(assert (not b!666510))

(assert (not b!666521))

(assert (not b!666524))

(assert (not b!666513))

(assert (not b!666515))

(assert (not b!666511))

(assert (not b!666517))

(assert (not b!666523))

(assert (not b!666526))

(assert (not b!666527))

(assert (not b!666525))

(assert (not b!666519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

