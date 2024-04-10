; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60230 () Bool)

(assert start!60230)

(declare-fun b!674622 () Bool)

(declare-fun e!385064 () Bool)

(declare-datatypes ((List!12872 0))(
  ( (Nil!12869) (Cons!12868 (h!13913 (_ BitVec 64)) (t!19100 List!12872)) )
))
(declare-fun lt!312645 () List!12872)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3449 (List!12872 (_ BitVec 64)) Bool)

(assert (=> b!674622 (= e!385064 (contains!3449 lt!312645 k!2843))))

(declare-fun b!674623 () Bool)

(declare-fun res!441103 () Bool)

(declare-fun e!385057 () Bool)

(assert (=> b!674623 (=> (not res!441103) (not e!385057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674623 (= res!441103 (validKeyInArray!0 k!2843))))

(declare-fun b!674624 () Bool)

(declare-fun e!385065 () Bool)

(declare-fun e!385055 () Bool)

(assert (=> b!674624 (= e!385065 e!385055)))

(declare-fun res!441099 () Bool)

(assert (=> b!674624 (=> (not res!441099) (not e!385055))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674624 (= res!441099 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674625 () Bool)

(declare-fun res!441083 () Bool)

(assert (=> b!674625 (=> (not res!441083) (not e!385057))))

(declare-datatypes ((array!39277 0))(
  ( (array!39278 (arr!18831 (Array (_ BitVec 32) (_ BitVec 64))) (size!19195 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39277)

(declare-fun acc!681 () List!12872)

(declare-fun arrayNoDuplicates!0 (array!39277 (_ BitVec 32) List!12872) Bool)

(assert (=> b!674625 (= res!441083 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674626 () Bool)

(declare-fun e!385056 () Bool)

(declare-fun e!385058 () Bool)

(assert (=> b!674626 (= e!385056 e!385058)))

(declare-fun res!441095 () Bool)

(assert (=> b!674626 (=> (not res!441095) (not e!385058))))

(assert (=> b!674626 (= res!441095 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!299 (List!12872 (_ BitVec 64)) List!12872)

(assert (=> b!674626 (= lt!312645 ($colon$colon!299 acc!681 (select (arr!18831 a!3626) from!3004)))))

(declare-fun b!674627 () Bool)

(declare-fun res!441092 () Bool)

(assert (=> b!674627 (=> (not res!441092) (not e!385058))))

(assert (=> b!674627 (= res!441092 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312645))))

(declare-fun res!441089 () Bool)

(assert (=> start!60230 (=> (not res!441089) (not e!385057))))

(assert (=> start!60230 (= res!441089 (and (bvslt (size!19195 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19195 a!3626))))))

(assert (=> start!60230 e!385057))

(assert (=> start!60230 true))

(declare-fun array_inv!14627 (array!39277) Bool)

(assert (=> start!60230 (array_inv!14627 a!3626)))

(declare-fun b!674628 () Bool)

(assert (=> b!674628 (= e!385055 (not (contains!3449 lt!312645 k!2843)))))

(declare-fun b!674629 () Bool)

(declare-fun res!441090 () Bool)

(assert (=> b!674629 (=> (not res!441090) (not e!385058))))

(declare-fun noDuplicate!696 (List!12872) Bool)

(assert (=> b!674629 (= res!441090 (noDuplicate!696 lt!312645))))

(declare-fun b!674630 () Bool)

(declare-fun res!441082 () Bool)

(assert (=> b!674630 (=> (not res!441082) (not e!385057))))

(assert (=> b!674630 (= res!441082 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19195 a!3626))))))

(declare-fun b!674631 () Bool)

(declare-datatypes ((Unit!23736 0))(
  ( (Unit!23737) )
))
(declare-fun e!385061 () Unit!23736)

(declare-fun Unit!23738 () Unit!23736)

(assert (=> b!674631 (= e!385061 Unit!23738)))

(declare-fun arrayContainsKey!0 (array!39277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674631 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312646 () Unit!23736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39277 (_ BitVec 64) (_ BitVec 32)) Unit!23736)

(assert (=> b!674631 (= lt!312646 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674631 false))

(declare-fun b!674632 () Bool)

(declare-fun res!441091 () Bool)

(assert (=> b!674632 (=> (not res!441091) (not e!385057))))

(assert (=> b!674632 (= res!441091 (validKeyInArray!0 (select (arr!18831 a!3626) from!3004)))))

(declare-fun b!674633 () Bool)

(declare-fun e!385062 () Bool)

(assert (=> b!674633 (= e!385062 (not (contains!3449 acc!681 k!2843)))))

(declare-fun b!674634 () Bool)

(assert (=> b!674634 (= e!385057 e!385056)))

(declare-fun res!441085 () Bool)

(assert (=> b!674634 (=> (not res!441085) (not e!385056))))

(assert (=> b!674634 (= res!441085 (not (= (select (arr!18831 a!3626) from!3004) k!2843)))))

(declare-fun lt!312643 () Unit!23736)

(assert (=> b!674634 (= lt!312643 e!385061)))

(declare-fun c!77138 () Bool)

(assert (=> b!674634 (= c!77138 (= (select (arr!18831 a!3626) from!3004) k!2843))))

(declare-fun b!674635 () Bool)

(declare-fun e!385063 () Bool)

(assert (=> b!674635 (= e!385063 e!385062)))

(declare-fun res!441101 () Bool)

(assert (=> b!674635 (=> (not res!441101) (not e!385062))))

(assert (=> b!674635 (= res!441101 (bvsle from!3004 i!1382))))

(declare-fun b!674636 () Bool)

(declare-fun res!441086 () Bool)

(assert (=> b!674636 (=> (not res!441086) (not e!385057))))

(assert (=> b!674636 (= res!441086 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12869))))

(declare-fun b!674637 () Bool)

(declare-fun Unit!23739 () Unit!23736)

(assert (=> b!674637 (= e!385061 Unit!23739)))

(declare-fun b!674638 () Bool)

(declare-fun res!441096 () Bool)

(assert (=> b!674638 (=> (not res!441096) (not e!385057))))

(assert (=> b!674638 (= res!441096 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674639 () Bool)

(declare-fun res!441080 () Bool)

(assert (=> b!674639 (=> (not res!441080) (not e!385057))))

(assert (=> b!674639 (= res!441080 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19195 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674640 () Bool)

(declare-fun e!385060 () Bool)

(assert (=> b!674640 (= e!385060 (contains!3449 acc!681 k!2843))))

(declare-fun b!674641 () Bool)

(assert (=> b!674641 (= e!385058 (not true))))

(assert (=> b!674641 (arrayNoDuplicates!0 (array!39278 (store (arr!18831 a!3626) i!1382 k!2843) (size!19195 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312645)))

(declare-fun lt!312644 () Unit!23736)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12872) Unit!23736)

(assert (=> b!674641 (= lt!312644 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312645))))

(declare-fun b!674642 () Bool)

(declare-fun res!441081 () Bool)

(assert (=> b!674642 (=> (not res!441081) (not e!385057))))

(assert (=> b!674642 (= res!441081 e!385063)))

(declare-fun res!441098 () Bool)

(assert (=> b!674642 (=> res!441098 e!385063)))

(assert (=> b!674642 (= res!441098 e!385060)))

(declare-fun res!441104 () Bool)

(assert (=> b!674642 (=> (not res!441104) (not e!385060))))

(assert (=> b!674642 (= res!441104 (bvsgt from!3004 i!1382))))

(declare-fun b!674643 () Bool)

(declare-fun res!441084 () Bool)

(assert (=> b!674643 (=> (not res!441084) (not e!385058))))

(assert (=> b!674643 (= res!441084 e!385065)))

(declare-fun res!441094 () Bool)

(assert (=> b!674643 (=> res!441094 e!385065)))

(assert (=> b!674643 (= res!441094 e!385064)))

(declare-fun res!441097 () Bool)

(assert (=> b!674643 (=> (not res!441097) (not e!385064))))

(assert (=> b!674643 (= res!441097 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674644 () Bool)

(declare-fun res!441093 () Bool)

(assert (=> b!674644 (=> (not res!441093) (not e!385057))))

(assert (=> b!674644 (= res!441093 (not (contains!3449 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674645 () Bool)

(declare-fun res!441102 () Bool)

(assert (=> b!674645 (=> (not res!441102) (not e!385058))))

(assert (=> b!674645 (= res!441102 (not (contains!3449 lt!312645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674646 () Bool)

(declare-fun res!441087 () Bool)

(assert (=> b!674646 (=> (not res!441087) (not e!385057))))

(assert (=> b!674646 (= res!441087 (not (contains!3449 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674647 () Bool)

(declare-fun res!441100 () Bool)

(assert (=> b!674647 (=> (not res!441100) (not e!385058))))

(assert (=> b!674647 (= res!441100 (not (contains!3449 lt!312645 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674648 () Bool)

(declare-fun res!441088 () Bool)

(assert (=> b!674648 (=> (not res!441088) (not e!385057))))

(assert (=> b!674648 (= res!441088 (noDuplicate!696 acc!681))))

(assert (= (and start!60230 res!441089) b!674648))

(assert (= (and b!674648 res!441088) b!674646))

(assert (= (and b!674646 res!441087) b!674644))

(assert (= (and b!674644 res!441093) b!674642))

(assert (= (and b!674642 res!441104) b!674640))

(assert (= (and b!674642 (not res!441098)) b!674635))

(assert (= (and b!674635 res!441101) b!674633))

(assert (= (and b!674642 res!441081) b!674636))

(assert (= (and b!674636 res!441086) b!674625))

(assert (= (and b!674625 res!441083) b!674630))

(assert (= (and b!674630 res!441082) b!674623))

(assert (= (and b!674623 res!441103) b!674638))

(assert (= (and b!674638 res!441096) b!674639))

(assert (= (and b!674639 res!441080) b!674632))

(assert (= (and b!674632 res!441091) b!674634))

(assert (= (and b!674634 c!77138) b!674631))

(assert (= (and b!674634 (not c!77138)) b!674637))

(assert (= (and b!674634 res!441085) b!674626))

(assert (= (and b!674626 res!441095) b!674629))

(assert (= (and b!674629 res!441090) b!674645))

(assert (= (and b!674645 res!441102) b!674647))

(assert (= (and b!674647 res!441100) b!674643))

(assert (= (and b!674643 res!441097) b!674622))

(assert (= (and b!674643 (not res!441094)) b!674624))

(assert (= (and b!674624 res!441099) b!674628))

(assert (= (and b!674643 res!441084) b!674627))

(assert (= (and b!674627 res!441092) b!674641))

(declare-fun m!642491 () Bool)

(assert (=> b!674640 m!642491))

(declare-fun m!642493 () Bool)

(assert (=> b!674625 m!642493))

(declare-fun m!642495 () Bool)

(assert (=> b!674638 m!642495))

(assert (=> b!674633 m!642491))

(declare-fun m!642497 () Bool)

(assert (=> b!674626 m!642497))

(assert (=> b!674626 m!642497))

(declare-fun m!642499 () Bool)

(assert (=> b!674626 m!642499))

(declare-fun m!642501 () Bool)

(assert (=> b!674644 m!642501))

(declare-fun m!642503 () Bool)

(assert (=> b!674629 m!642503))

(declare-fun m!642505 () Bool)

(assert (=> b!674636 m!642505))

(declare-fun m!642507 () Bool)

(assert (=> b!674622 m!642507))

(declare-fun m!642509 () Bool)

(assert (=> b!674647 m!642509))

(assert (=> b!674628 m!642507))

(assert (=> b!674634 m!642497))

(declare-fun m!642511 () Bool)

(assert (=> b!674631 m!642511))

(declare-fun m!642513 () Bool)

(assert (=> b!674631 m!642513))

(declare-fun m!642515 () Bool)

(assert (=> b!674623 m!642515))

(assert (=> b!674632 m!642497))

(assert (=> b!674632 m!642497))

(declare-fun m!642517 () Bool)

(assert (=> b!674632 m!642517))

(declare-fun m!642519 () Bool)

(assert (=> b!674648 m!642519))

(declare-fun m!642521 () Bool)

(assert (=> b!674646 m!642521))

(declare-fun m!642523 () Bool)

(assert (=> b!674627 m!642523))

(declare-fun m!642525 () Bool)

(assert (=> b!674641 m!642525))

(declare-fun m!642527 () Bool)

(assert (=> b!674641 m!642527))

(declare-fun m!642529 () Bool)

(assert (=> b!674641 m!642529))

(declare-fun m!642531 () Bool)

(assert (=> b!674645 m!642531))

(declare-fun m!642533 () Bool)

(assert (=> start!60230 m!642533))

(push 1)

