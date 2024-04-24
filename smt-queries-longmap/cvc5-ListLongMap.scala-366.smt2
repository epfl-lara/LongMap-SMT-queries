; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7036 () Bool)

(assert start!7036)

(declare-fun res!26555 () Bool)

(declare-fun e!28785 () Bool)

(assert (=> start!7036 (=> (not res!26555) (not e!28785))))

(declare-datatypes ((array!3010 0))(
  ( (array!3011 (arr!1447 (Array (_ BitVec 32) (_ BitVec 64))) (size!1669 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3010)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7036 (= res!26555 (and (bvslt (size!1669 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1669 a!4412)) (= (size!1669 a!4412) size!30) (= a!4412 (array!3011 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (= i!1489 size!30)))))

(assert (=> start!7036 e!28785))

(declare-fun array_inv!850 (array!3010) Bool)

(assert (=> start!7036 (array_inv!850 a!4412)))

(assert (=> start!7036 true))

(declare-fun b!45288 () Bool)

(declare-fun arrayCountValidKeys!0 (array!3010 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45288 (= e!28785 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (= (and start!7036 res!26555) b!45288))

(declare-fun m!39753 () Bool)

(assert (=> start!7036 m!39753))

(declare-fun m!39755 () Bool)

(assert (=> b!45288 m!39755))

(push 1)

(assert (not start!7036))

(assert (not b!45288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8825 () Bool)

(assert (=> d!8825 (= (array_inv!850 a!4412) (bvsge (size!1669 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7036 d!8825))

(declare-fun b!45321 () Bool)

(declare-fun e!28804 () (_ BitVec 32))

(declare-fun call!3695 () (_ BitVec 32))

(assert (=> b!45321 (= e!28804 (bvadd #b00000000000000000000000000000001 call!3695))))

(declare-fun d!8827 () Bool)

(declare-fun lt!20082 () (_ BitVec 32))

(assert (=> d!8827 (and (bvsge lt!20082 #b00000000000000000000000000000000) (bvsle lt!20082 (bvsub (size!1669 a!4412) i!1489)))))

(declare-fun e!28803 () (_ BitVec 32))

(assert (=> d!8827 (= lt!20082 e!28803)))

(declare-fun c!6103 () Bool)

(assert (=> d!8827 (= c!6103 (bvsge i!1489 size!30))))

(assert (=> d!8827 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1669 a!4412)))))

(assert (=> d!8827 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20082)))

(declare-fun b!45322 () Bool)

(assert (=> b!45322 (= e!28803 e!28804)))

(declare-fun c!6104 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45322 (= c!6104 (validKeyInArray!0 (select (arr!1447 a!4412) i!1489)))))

(declare-fun bm!3692 () Bool)

(assert (=> bm!3692 (= call!3695 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45323 () Bool)

(assert (=> b!45323 (= e!28804 call!3695)))

(declare-fun b!45324 () Bool)

(assert (=> b!45324 (= e!28803 #b00000000000000000000000000000000)))

(assert (= (and d!8827 c!6103) b!45324))

(assert (= (and d!8827 (not c!6103)) b!45322))

(assert (= (and b!45322 c!6104) b!45321))

(assert (= (and b!45322 (not c!6104)) b!45323))

(assert (= (or b!45321 b!45323) bm!3692))

(declare-fun m!39769 () Bool)

(assert (=> b!45322 m!39769))

(assert (=> b!45322 m!39769))

(declare-fun m!39771 () Bool)

(assert (=> b!45322 m!39771))

(declare-fun m!39773 () Bool)

(assert (=> bm!3692 m!39773))

(assert (=> b!45288 d!8827))

(push 1)

(assert (not b!45322))

(assert (not bm!3692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

