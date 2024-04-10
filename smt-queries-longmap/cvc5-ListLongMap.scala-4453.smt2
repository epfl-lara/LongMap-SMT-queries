; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61964 () Bool)

(assert start!61964)

(declare-fun b!693125 () Bool)

(declare-fun res!457304 () Bool)

(declare-fun e!394393 () Bool)

(assert (=> b!693125 (=> (not res!457304) (not e!394393))))

(declare-datatypes ((List!13130 0))(
  ( (Nil!13127) (Cons!13126 (h!14171 (_ BitVec 64)) (t!19406 List!13130)) )
))
(declare-fun acc!681 () List!13130)

(declare-fun contains!3707 (List!13130 (_ BitVec 64)) Bool)

(assert (=> b!693125 (= res!457304 (not (contains!3707 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!457286 () Bool)

(assert (=> start!61964 (=> (not res!457286) (not e!394393))))

(declare-datatypes ((array!39850 0))(
  ( (array!39851 (arr!19089 (Array (_ BitVec 32) (_ BitVec 64))) (size!19474 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39850)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61964 (= res!457286 (and (bvslt (size!19474 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19474 a!3626))))))

(assert (=> start!61964 e!394393))

(assert (=> start!61964 true))

(declare-fun array_inv!14885 (array!39850) Bool)

(assert (=> start!61964 (array_inv!14885 a!3626)))

(declare-fun b!693126 () Bool)

(declare-fun res!457287 () Bool)

(assert (=> b!693126 (=> (not res!457287) (not e!394393))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693126 (= res!457287 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19474 a!3626))))))

(declare-fun b!693127 () Bool)

(declare-fun res!457306 () Bool)

(assert (=> b!693127 (=> (not res!457306) (not e!394393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693127 (= res!457306 (validKeyInArray!0 (select (arr!19089 a!3626) from!3004)))))

(declare-fun b!693128 () Bool)

(declare-fun res!457290 () Bool)

(assert (=> b!693128 (=> (not res!457290) (not e!394393))))

(declare-fun noDuplicate!954 (List!13130) Bool)

(assert (=> b!693128 (= res!457290 (noDuplicate!954 acc!681))))

(declare-fun b!693129 () Bool)

(declare-fun e!394398 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!693129 (= e!394398 (not (contains!3707 acc!681 k!2843)))))

(declare-fun b!693130 () Bool)

(declare-fun e!394391 () Bool)

(assert (=> b!693130 (= e!394391 e!394398)))

(declare-fun res!457289 () Bool)

(assert (=> b!693130 (=> (not res!457289) (not e!394398))))

(assert (=> b!693130 (= res!457289 (bvsle from!3004 i!1382))))

(declare-fun b!693131 () Bool)

(declare-fun res!457285 () Bool)

(declare-fun e!394396 () Bool)

(assert (=> b!693131 (=> (not res!457285) (not e!394396))))

(declare-fun lt!316705 () List!13130)

(assert (=> b!693131 (= res!457285 (noDuplicate!954 lt!316705))))

(declare-fun b!693132 () Bool)

(declare-fun res!457293 () Bool)

(assert (=> b!693132 (=> (not res!457293) (not e!394393))))

(declare-fun arrayNoDuplicates!0 (array!39850 (_ BitVec 32) List!13130) Bool)

(assert (=> b!693132 (= res!457293 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13127))))

(declare-fun b!693133 () Bool)

(declare-datatypes ((Unit!24474 0))(
  ( (Unit!24475) )
))
(declare-fun e!394394 () Unit!24474)

(declare-fun Unit!24476 () Unit!24474)

(assert (=> b!693133 (= e!394394 Unit!24476)))

(declare-fun b!693134 () Bool)

(declare-fun e!394397 () Bool)

(assert (=> b!693134 (= e!394397 (contains!3707 acc!681 k!2843))))

(declare-fun b!693135 () Bool)

(assert (=> b!693135 (= e!394396 false)))

(declare-fun lt!316708 () Bool)

(declare-fun e!394392 () Bool)

(assert (=> b!693135 (= lt!316708 e!394392)))

(declare-fun res!457292 () Bool)

(assert (=> b!693135 (=> res!457292 e!394392)))

(declare-fun e!394395 () Bool)

(assert (=> b!693135 (= res!457292 e!394395)))

(declare-fun res!457288 () Bool)

(assert (=> b!693135 (=> (not res!457288) (not e!394395))))

(assert (=> b!693135 (= res!457288 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693136 () Bool)

(declare-fun e!394401 () Bool)

(assert (=> b!693136 (= e!394393 e!394401)))

(declare-fun res!457291 () Bool)

(assert (=> b!693136 (=> (not res!457291) (not e!394401))))

(assert (=> b!693136 (= res!457291 (not (= (select (arr!19089 a!3626) from!3004) k!2843)))))

(declare-fun lt!316706 () Unit!24474)

(assert (=> b!693136 (= lt!316706 e!394394)))

(declare-fun c!78287 () Bool)

(assert (=> b!693136 (= c!78287 (= (select (arr!19089 a!3626) from!3004) k!2843))))

(declare-fun b!693137 () Bool)

(assert (=> b!693137 (= e!394395 (contains!3707 lt!316705 k!2843))))

(declare-fun b!693138 () Bool)

(declare-fun res!457295 () Bool)

(assert (=> b!693138 (=> (not res!457295) (not e!394393))))

(assert (=> b!693138 (= res!457295 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693139 () Bool)

(assert (=> b!693139 (= e!394401 e!394396)))

(declare-fun res!457299 () Bool)

(assert (=> b!693139 (=> (not res!457299) (not e!394396))))

(assert (=> b!693139 (= res!457299 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!419 (List!13130 (_ BitVec 64)) List!13130)

(assert (=> b!693139 (= lt!316705 ($colon$colon!419 acc!681 (select (arr!19089 a!3626) from!3004)))))

(declare-fun b!693140 () Bool)

(declare-fun Unit!24477 () Unit!24474)

(assert (=> b!693140 (= e!394394 Unit!24477)))

(declare-fun arrayContainsKey!0 (array!39850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693140 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316707 () Unit!24474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39850 (_ BitVec 64) (_ BitVec 32)) Unit!24474)

(assert (=> b!693140 (= lt!316707 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!693140 false))

(declare-fun b!693141 () Bool)

(declare-fun res!457296 () Bool)

(assert (=> b!693141 (=> (not res!457296) (not e!394393))))

(assert (=> b!693141 (= res!457296 e!394391)))

(declare-fun res!457303 () Bool)

(assert (=> b!693141 (=> res!457303 e!394391)))

(assert (=> b!693141 (= res!457303 e!394397)))

(declare-fun res!457294 () Bool)

(assert (=> b!693141 (=> (not res!457294) (not e!394397))))

(assert (=> b!693141 (= res!457294 (bvsgt from!3004 i!1382))))

(declare-fun b!693142 () Bool)

(declare-fun res!457305 () Bool)

(assert (=> b!693142 (=> (not res!457305) (not e!394396))))

(assert (=> b!693142 (= res!457305 (not (contains!3707 lt!316705 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693143 () Bool)

(declare-fun e!394399 () Bool)

(assert (=> b!693143 (= e!394392 e!394399)))

(declare-fun res!457300 () Bool)

(assert (=> b!693143 (=> (not res!457300) (not e!394399))))

(assert (=> b!693143 (= res!457300 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693144 () Bool)

(declare-fun res!457298 () Bool)

(assert (=> b!693144 (=> (not res!457298) (not e!394393))))

(assert (=> b!693144 (= res!457298 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693145 () Bool)

(assert (=> b!693145 (= e!394399 (not (contains!3707 lt!316705 k!2843)))))

(declare-fun b!693146 () Bool)

(declare-fun res!457297 () Bool)

(assert (=> b!693146 (=> (not res!457297) (not e!394393))))

(assert (=> b!693146 (= res!457297 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19474 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693147 () Bool)

(declare-fun res!457302 () Bool)

(assert (=> b!693147 (=> (not res!457302) (not e!394393))))

(assert (=> b!693147 (= res!457302 (not (contains!3707 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693148 () Bool)

(declare-fun res!457301 () Bool)

(assert (=> b!693148 (=> (not res!457301) (not e!394393))))

(assert (=> b!693148 (= res!457301 (validKeyInArray!0 k!2843))))

(declare-fun b!693149 () Bool)

(declare-fun res!457307 () Bool)

(assert (=> b!693149 (=> (not res!457307) (not e!394396))))

(assert (=> b!693149 (= res!457307 (not (contains!3707 lt!316705 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61964 res!457286) b!693128))

(assert (= (and b!693128 res!457290) b!693125))

(assert (= (and b!693125 res!457304) b!693147))

(assert (= (and b!693147 res!457302) b!693141))

(assert (= (and b!693141 res!457294) b!693134))

(assert (= (and b!693141 (not res!457303)) b!693130))

(assert (= (and b!693130 res!457289) b!693129))

(assert (= (and b!693141 res!457296) b!693132))

(assert (= (and b!693132 res!457293) b!693138))

(assert (= (and b!693138 res!457295) b!693126))

(assert (= (and b!693126 res!457287) b!693148))

(assert (= (and b!693148 res!457301) b!693144))

(assert (= (and b!693144 res!457298) b!693146))

(assert (= (and b!693146 res!457297) b!693127))

(assert (= (and b!693127 res!457306) b!693136))

(assert (= (and b!693136 c!78287) b!693140))

(assert (= (and b!693136 (not c!78287)) b!693133))

(assert (= (and b!693136 res!457291) b!693139))

(assert (= (and b!693139 res!457299) b!693131))

(assert (= (and b!693131 res!457285) b!693142))

(assert (= (and b!693142 res!457305) b!693149))

(assert (= (and b!693149 res!457307) b!693135))

(assert (= (and b!693135 res!457288) b!693137))

(assert (= (and b!693135 (not res!457292)) b!693143))

(assert (= (and b!693143 res!457300) b!693145))

(declare-fun m!655529 () Bool)

(assert (=> b!693148 m!655529))

(declare-fun m!655531 () Bool)

(assert (=> b!693137 m!655531))

(declare-fun m!655533 () Bool)

(assert (=> b!693139 m!655533))

(assert (=> b!693139 m!655533))

(declare-fun m!655535 () Bool)

(assert (=> b!693139 m!655535))

(declare-fun m!655537 () Bool)

(assert (=> b!693140 m!655537))

(declare-fun m!655539 () Bool)

(assert (=> b!693140 m!655539))

(declare-fun m!655541 () Bool)

(assert (=> start!61964 m!655541))

(declare-fun m!655543 () Bool)

(assert (=> b!693134 m!655543))

(declare-fun m!655545 () Bool)

(assert (=> b!693138 m!655545))

(assert (=> b!693136 m!655533))

(declare-fun m!655547 () Bool)

(assert (=> b!693132 m!655547))

(declare-fun m!655549 () Bool)

(assert (=> b!693125 m!655549))

(declare-fun m!655551 () Bool)

(assert (=> b!693131 m!655551))

(declare-fun m!655553 () Bool)

(assert (=> b!693142 m!655553))

(declare-fun m!655555 () Bool)

(assert (=> b!693149 m!655555))

(declare-fun m!655557 () Bool)

(assert (=> b!693128 m!655557))

(declare-fun m!655559 () Bool)

(assert (=> b!693144 m!655559))

(assert (=> b!693129 m!655543))

(assert (=> b!693145 m!655531))

(declare-fun m!655561 () Bool)

(assert (=> b!693147 m!655561))

(assert (=> b!693127 m!655533))

(assert (=> b!693127 m!655533))

(declare-fun m!655563 () Bool)

(assert (=> b!693127 m!655563))

(push 1)

