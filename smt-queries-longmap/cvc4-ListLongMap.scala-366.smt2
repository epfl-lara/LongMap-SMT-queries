; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7032 () Bool)

(assert start!7032)

(declare-fun res!26580 () Bool)

(declare-fun e!28822 () Bool)

(assert (=> start!7032 (=> (not res!26580) (not e!28822))))

(declare-datatypes ((array!3024 0))(
  ( (array!3025 (arr!1454 (Array (_ BitVec 32) (_ BitVec 64))) (size!1676 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3024)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7032 (= res!26580 (and (bvslt (size!1676 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1676 a!4412)) (= (size!1676 a!4412) size!30) (= a!4412 (array!3025 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (= i!1489 size!30)))))

(assert (=> start!7032 e!28822))

(declare-fun array_inv!866 (array!3024) Bool)

(assert (=> start!7032 (array_inv!866 a!4412)))

(assert (=> start!7032 true))

(declare-fun b!45345 () Bool)

(declare-fun arrayCountValidKeys!0 (array!3024 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45345 (= e!28822 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (= (and start!7032 res!26580) b!45345))

(declare-fun m!39877 () Bool)

(assert (=> start!7032 m!39877))

(declare-fun m!39879 () Bool)

(assert (=> b!45345 m!39879))

(push 1)

(assert (not start!7032))

(assert (not b!45345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8839 () Bool)

(assert (=> d!8839 (= (array_inv!866 a!4412) (bvsge (size!1676 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7032 d!8839))

(declare-fun d!8841 () Bool)

(declare-fun lt!20125 () (_ BitVec 32))

(assert (=> d!8841 (and (bvsge lt!20125 #b00000000000000000000000000000000) (bvsle lt!20125 (bvsub (size!1676 a!4412) i!1489)))))

(declare-fun e!28841 () (_ BitVec 32))

(assert (=> d!8841 (= lt!20125 e!28841)))

(declare-fun c!6119 () Bool)

(assert (=> d!8841 (= c!6119 (bvsge i!1489 size!30))))

(assert (=> d!8841 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1676 a!4412)))))

(assert (=> d!8841 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20125)))

(declare-fun b!45378 () Bool)

(declare-fun e!28840 () (_ BitVec 32))

(declare-fun call!3709 () (_ BitVec 32))

(assert (=> b!45378 (= e!28840 (bvadd #b00000000000000000000000000000001 call!3709))))

(declare-fun bm!3706 () Bool)

(assert (=> bm!3706 (= call!3709 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45379 () Bool)

(assert (=> b!45379 (= e!28841 #b00000000000000000000000000000000)))

(declare-fun b!45380 () Bool)

(assert (=> b!45380 (= e!28841 e!28840)))

(declare-fun c!6120 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45380 (= c!6120 (validKeyInArray!0 (select (arr!1454 a!4412) i!1489)))))

(declare-fun b!45381 () Bool)

(assert (=> b!45381 (= e!28840 call!3709)))

(assert (= (and d!8841 c!6119) b!45379))

(assert (= (and d!8841 (not c!6119)) b!45380))

(assert (= (and b!45380 c!6120) b!45378))

(assert (= (and b!45380 (not c!6120)) b!45381))

(assert (= (or b!45378 b!45381) bm!3706))

(declare-fun m!39893 () Bool)

(assert (=> bm!3706 m!39893))

(declare-fun m!39895 () Bool)

(assert (=> b!45380 m!39895))

(assert (=> b!45380 m!39895))

(declare-fun m!39897 () Bool)

(assert (=> b!45380 m!39897))

