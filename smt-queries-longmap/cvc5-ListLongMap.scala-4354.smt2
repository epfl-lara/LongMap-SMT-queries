; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60152 () Bool)

(assert start!60152)

(declare-fun b!671560 () Bool)

(declare-fun res!438264 () Bool)

(declare-fun e!383772 () Bool)

(assert (=> b!671560 (=> (not res!438264) (not e!383772))))

(declare-datatypes ((List!12833 0))(
  ( (Nil!12830) (Cons!12829 (h!13874 (_ BitVec 64)) (t!19061 List!12833)) )
))
(declare-fun acc!681 () List!12833)

(declare-fun contains!3410 (List!12833 (_ BitVec 64)) Bool)

(assert (=> b!671560 (= res!438264 (not (contains!3410 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671561 () Bool)

(declare-fun e!383778 () Bool)

(declare-fun lt!312178 () List!12833)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!671561 (= e!383778 (not (contains!3410 lt!312178 k!2843)))))

(declare-fun b!671562 () Bool)

(declare-fun e!383768 () Bool)

(assert (=> b!671562 (= e!383772 e!383768)))

(declare-fun res!438275 () Bool)

(assert (=> b!671562 (=> (not res!438275) (not e!383768))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39199 0))(
  ( (array!39200 (arr!18792 (Array (_ BitVec 32) (_ BitVec 64))) (size!19156 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39199)

(assert (=> b!671562 (= res!438275 (not (= (select (arr!18792 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23580 0))(
  ( (Unit!23581) )
))
(declare-fun lt!312176 () Unit!23580)

(declare-fun e!383773 () Unit!23580)

(assert (=> b!671562 (= lt!312176 e!383773)))

(declare-fun c!77021 () Bool)

(assert (=> b!671562 (= c!77021 (= (select (arr!18792 a!3626) from!3004) k!2843))))

(declare-fun b!671563 () Bool)

(declare-fun Unit!23582 () Unit!23580)

(assert (=> b!671563 (= e!383773 Unit!23582)))

(declare-fun arrayContainsKey!0 (array!39199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671563 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312177 () Unit!23580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39199 (_ BitVec 64) (_ BitVec 32)) Unit!23580)

(assert (=> b!671563 (= lt!312177 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!671563 false))

(declare-fun b!671564 () Bool)

(declare-fun res!438267 () Bool)

(declare-fun e!383771 () Bool)

(assert (=> b!671564 (=> (not res!438267) (not e!383771))))

(assert (=> b!671564 (= res!438267 (not (contains!3410 lt!312178 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671565 () Bool)

(declare-fun e!383770 () Bool)

(assert (=> b!671565 (= e!383770 (contains!3410 acc!681 k!2843))))

(declare-fun b!671566 () Bool)

(declare-fun res!438262 () Bool)

(assert (=> b!671566 (=> (not res!438262) (not e!383771))))

(assert (=> b!671566 (= res!438262 (not (contains!3410 lt!312178 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671567 () Bool)

(declare-fun res!438263 () Bool)

(assert (=> b!671567 (=> (not res!438263) (not e!383772))))

(declare-fun arrayNoDuplicates!0 (array!39199 (_ BitVec 32) List!12833) Bool)

(assert (=> b!671567 (= res!438263 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12830))))

(declare-fun b!671568 () Bool)

(declare-fun res!438269 () Bool)

(assert (=> b!671568 (=> (not res!438269) (not e!383772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671568 (= res!438269 (validKeyInArray!0 k!2843))))

(declare-fun res!438252 () Bool)

(assert (=> start!60152 (=> (not res!438252) (not e!383772))))

(assert (=> start!60152 (= res!438252 (and (bvslt (size!19156 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19156 a!3626))))))

(assert (=> start!60152 e!383772))

(assert (=> start!60152 true))

(declare-fun array_inv!14588 (array!39199) Bool)

(assert (=> start!60152 (array_inv!14588 a!3626)))

(declare-fun b!671569 () Bool)

(declare-fun res!438271 () Bool)

(assert (=> b!671569 (=> (not res!438271) (not e!383772))))

(declare-fun e!383777 () Bool)

(assert (=> b!671569 (= res!438271 e!383777)))

(declare-fun res!438265 () Bool)

(assert (=> b!671569 (=> res!438265 e!383777)))

(assert (=> b!671569 (= res!438265 e!383770)))

(declare-fun res!438261 () Bool)

(assert (=> b!671569 (=> (not res!438261) (not e!383770))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671569 (= res!438261 (bvsgt from!3004 i!1382))))

(declare-fun b!671570 () Bool)

(declare-fun res!438254 () Bool)

(assert (=> b!671570 (=> (not res!438254) (not e!383772))))

(assert (=> b!671570 (= res!438254 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19156 a!3626))))))

(declare-fun b!671571 () Bool)

(declare-fun res!438274 () Bool)

(assert (=> b!671571 (=> (not res!438274) (not e!383772))))

(declare-fun noDuplicate!657 (List!12833) Bool)

(assert (=> b!671571 (= res!438274 (noDuplicate!657 acc!681))))

(declare-fun b!671572 () Bool)

(declare-fun res!438253 () Bool)

(assert (=> b!671572 (=> (not res!438253) (not e!383771))))

(declare-fun e!383775 () Bool)

(assert (=> b!671572 (= res!438253 e!383775)))

(declare-fun res!438268 () Bool)

(assert (=> b!671572 (=> res!438268 e!383775)))

(declare-fun e!383769 () Bool)

(assert (=> b!671572 (= res!438268 e!383769)))

(declare-fun res!438272 () Bool)

(assert (=> b!671572 (=> (not res!438272) (not e!383769))))

(assert (=> b!671572 (= res!438272 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671573 () Bool)

(assert (=> b!671573 (= e!383769 (contains!3410 lt!312178 k!2843))))

(declare-fun b!671574 () Bool)

(declare-fun res!438256 () Bool)

(assert (=> b!671574 (=> (not res!438256) (not e!383772))))

(assert (=> b!671574 (= res!438256 (not (contains!3410 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671575 () Bool)

(declare-fun Unit!23583 () Unit!23580)

(assert (=> b!671575 (= e!383773 Unit!23583)))

(declare-fun b!671576 () Bool)

(declare-fun res!438266 () Bool)

(assert (=> b!671576 (=> (not res!438266) (not e!383772))))

(assert (=> b!671576 (= res!438266 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19156 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671577 () Bool)

(assert (=> b!671577 (= e!383775 e!383778)))

(declare-fun res!438270 () Bool)

(assert (=> b!671577 (=> (not res!438270) (not e!383778))))

(assert (=> b!671577 (= res!438270 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671578 () Bool)

(declare-fun e!383774 () Bool)

(assert (=> b!671578 (= e!383774 (not (contains!3410 acc!681 k!2843)))))

(declare-fun b!671579 () Bool)

(assert (=> b!671579 (= e!383768 e!383771)))

(declare-fun res!438257 () Bool)

(assert (=> b!671579 (=> (not res!438257) (not e!383771))))

(assert (=> b!671579 (= res!438257 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!260 (List!12833 (_ BitVec 64)) List!12833)

(assert (=> b!671579 (= lt!312178 ($colon$colon!260 acc!681 (select (arr!18792 a!3626) from!3004)))))

(declare-fun b!671580 () Bool)

(declare-fun res!438273 () Bool)

(assert (=> b!671580 (=> (not res!438273) (not e!383772))))

(assert (=> b!671580 (= res!438273 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671581 () Bool)

(declare-fun res!438255 () Bool)

(assert (=> b!671581 (=> (not res!438255) (not e!383771))))

(assert (=> b!671581 (= res!438255 (noDuplicate!657 lt!312178))))

(declare-fun b!671582 () Bool)

(assert (=> b!671582 (= e!383771 false)))

(declare-fun lt!312175 () Bool)

(assert (=> b!671582 (= lt!312175 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312178))))

(declare-fun b!671583 () Bool)

(assert (=> b!671583 (= e!383777 e!383774)))

(declare-fun res!438258 () Bool)

(assert (=> b!671583 (=> (not res!438258) (not e!383774))))

(assert (=> b!671583 (= res!438258 (bvsle from!3004 i!1382))))

(declare-fun b!671584 () Bool)

(declare-fun res!438259 () Bool)

(assert (=> b!671584 (=> (not res!438259) (not e!383772))))

(assert (=> b!671584 (= res!438259 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671585 () Bool)

(declare-fun res!438260 () Bool)

(assert (=> b!671585 (=> (not res!438260) (not e!383772))))

(assert (=> b!671585 (= res!438260 (validKeyInArray!0 (select (arr!18792 a!3626) from!3004)))))

(assert (= (and start!60152 res!438252) b!671571))

(assert (= (and b!671571 res!438274) b!671560))

(assert (= (and b!671560 res!438264) b!671574))

(assert (= (and b!671574 res!438256) b!671569))

(assert (= (and b!671569 res!438261) b!671565))

(assert (= (and b!671569 (not res!438265)) b!671583))

(assert (= (and b!671583 res!438258) b!671578))

(assert (= (and b!671569 res!438271) b!671567))

(assert (= (and b!671567 res!438263) b!671580))

(assert (= (and b!671580 res!438273) b!671570))

(assert (= (and b!671570 res!438254) b!671568))

(assert (= (and b!671568 res!438269) b!671584))

(assert (= (and b!671584 res!438259) b!671576))

(assert (= (and b!671576 res!438266) b!671585))

(assert (= (and b!671585 res!438260) b!671562))

(assert (= (and b!671562 c!77021) b!671563))

(assert (= (and b!671562 (not c!77021)) b!671575))

(assert (= (and b!671562 res!438275) b!671579))

(assert (= (and b!671579 res!438257) b!671581))

(assert (= (and b!671581 res!438255) b!671564))

(assert (= (and b!671564 res!438267) b!671566))

(assert (= (and b!671566 res!438262) b!671572))

(assert (= (and b!671572 res!438272) b!671573))

(assert (= (and b!671572 (not res!438268)) b!671577))

(assert (= (and b!671577 res!438270) b!671561))

(assert (= (and b!671572 res!438253) b!671582))

(declare-fun m!640973 () Bool)

(assert (=> b!671567 m!640973))

(declare-fun m!640975 () Bool)

(assert (=> b!671566 m!640975))

(declare-fun m!640977 () Bool)

(assert (=> b!671579 m!640977))

(assert (=> b!671579 m!640977))

(declare-fun m!640979 () Bool)

(assert (=> b!671579 m!640979))

(declare-fun m!640981 () Bool)

(assert (=> b!671564 m!640981))

(declare-fun m!640983 () Bool)

(assert (=> b!671565 m!640983))

(declare-fun m!640985 () Bool)

(assert (=> b!671560 m!640985))

(declare-fun m!640987 () Bool)

(assert (=> b!671568 m!640987))

(declare-fun m!640989 () Bool)

(assert (=> b!671571 m!640989))

(assert (=> b!671578 m!640983))

(declare-fun m!640991 () Bool)

(assert (=> b!671574 m!640991))

(declare-fun m!640993 () Bool)

(assert (=> b!671581 m!640993))

(declare-fun m!640995 () Bool)

(assert (=> b!671563 m!640995))

(declare-fun m!640997 () Bool)

(assert (=> b!671563 m!640997))

(assert (=> b!671585 m!640977))

(assert (=> b!671585 m!640977))

(declare-fun m!640999 () Bool)

(assert (=> b!671585 m!640999))

(declare-fun m!641001 () Bool)

(assert (=> b!671584 m!641001))

(declare-fun m!641003 () Bool)

(assert (=> b!671582 m!641003))

(declare-fun m!641005 () Bool)

(assert (=> b!671580 m!641005))

(declare-fun m!641007 () Bool)

(assert (=> start!60152 m!641007))

(assert (=> b!671562 m!640977))

(declare-fun m!641009 () Bool)

(assert (=> b!671573 m!641009))

(assert (=> b!671561 m!641009))

(push 1)

