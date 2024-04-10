; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7028 () Bool)

(assert start!7028)

(declare-fun res!26574 () Bool)

(declare-fun e!28810 () Bool)

(assert (=> start!7028 (=> (not res!26574) (not e!28810))))

(declare-datatypes ((array!3020 0))(
  ( (array!3021 (arr!1452 (Array (_ BitVec 32) (_ BitVec 64))) (size!1674 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3020)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7028 (= res!26574 (and (bvslt (size!1674 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1674 a!4412)) (= (size!1674 a!4412) size!30) (= a!4412 (array!3021 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (= i!1489 size!30)))))

(assert (=> start!7028 e!28810))

(declare-fun array_inv!864 (array!3020) Bool)

(assert (=> start!7028 (array_inv!864 a!4412)))

(assert (=> start!7028 true))

(declare-fun b!45339 () Bool)

(declare-fun arrayCountValidKeys!0 (array!3020 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45339 (= e!28810 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (= (and start!7028 res!26574) b!45339))

(declare-fun m!39869 () Bool)

(assert (=> start!7028 m!39869))

(declare-fun m!39871 () Bool)

(assert (=> b!45339 m!39871))

(push 1)

(assert (not start!7028))

(assert (not b!45339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8833 () Bool)

(assert (=> d!8833 (= (array_inv!864 a!4412) (bvsge (size!1674 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7028 d!8833))

(declare-fun b!45368 () Bool)

(declare-fun e!28835 () (_ BitVec 32))

(declare-fun e!28834 () (_ BitVec 32))

(assert (=> b!45368 (= e!28835 e!28834)))

(declare-fun c!6114 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45368 (= c!6114 (validKeyInArray!0 (select (arr!1452 a!4412) i!1489)))))

(declare-fun b!45369 () Bool)

(declare-fun call!3706 () (_ BitVec 32))

(assert (=> b!45369 (= e!28834 call!3706)))

(declare-fun bm!3703 () Bool)

(assert (=> bm!3703 (= call!3706 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45370 () Bool)

(assert (=> b!45370 (= e!28834 (bvadd #b00000000000000000000000000000001 call!3706))))

(declare-fun d!8837 () Bool)

(declare-fun lt!20124 () (_ BitVec 32))

(assert (=> d!8837 (and (bvsge lt!20124 #b00000000000000000000000000000000) (bvsle lt!20124 (bvsub (size!1674 a!4412) i!1489)))))

(assert (=> d!8837 (= lt!20124 e!28835)))

(declare-fun c!6113 () Bool)

(assert (=> d!8837 (= c!6113 (bvsge i!1489 size!30))))

(assert (=> d!8837 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1674 a!4412)))))

(assert (=> d!8837 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20124)))

(declare-fun b!45371 () Bool)

(assert (=> b!45371 (= e!28835 #b00000000000000000000000000000000)))

(assert (= (and d!8837 c!6113) b!45371))

(assert (= (and d!8837 (not c!6113)) b!45368))

(assert (= (and b!45368 c!6114) b!45370))

(assert (= (and b!45368 (not c!6114)) b!45369))

(assert (= (or b!45370 b!45369) bm!3703))

(declare-fun m!39887 () Bool)

(assert (=> b!45368 m!39887))

(assert (=> b!45368 m!39887))

(declare-fun m!39889 () Bool)

(assert (=> b!45368 m!39889))

(declare-fun m!39891 () Bool)

(assert (=> bm!3703 m!39891))

(assert (=> b!45339 d!8837))

(push 1)

(assert (not bm!3703))

(assert (not b!45368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

