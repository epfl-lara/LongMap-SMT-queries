; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7030 () Bool)

(assert start!7030)

(declare-fun res!26554 () Bool)

(declare-fun e!28773 () Bool)

(assert (=> start!7030 (=> (not res!26554) (not e!28773))))

(declare-datatypes ((array!2998 0))(
  ( (array!2999 (arr!1441 (Array (_ BitVec 32) (_ BitVec 64))) (size!1664 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2998)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7030 (= res!26554 (and (bvslt (size!1664 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1664 a!4412)) (= (size!1664 a!4412) size!30) (= a!4412 (array!2999 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (= i!1489 size!30)))))

(assert (=> start!7030 e!28773))

(declare-fun array_inv!864 (array!2998) Bool)

(assert (=> start!7030 (array_inv!864 a!4412)))

(assert (=> start!7030 true))

(declare-fun b!45273 () Bool)

(declare-fun arrayCountValidKeys!0 (array!2998 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45273 (= e!28773 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (= (and start!7030 res!26554) b!45273))

(declare-fun m!39793 () Bool)

(assert (=> start!7030 m!39793))

(declare-fun m!39795 () Bool)

(assert (=> b!45273 m!39795))

(push 1)

(assert (not start!7030))

(assert (not b!45273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8803 () Bool)

(assert (=> d!8803 (= (array_inv!864 a!4412) (bvsge (size!1664 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7030 d!8803))

(declare-fun b!45298 () Bool)

(declare-fun e!28787 () (_ BitVec 32))

(declare-fun call!3706 () (_ BitVec 32))

(assert (=> b!45298 (= e!28787 call!3706)))

(declare-fun b!45299 () Bool)

(assert (=> b!45299 (= e!28787 (bvadd #b00000000000000000000000000000001 call!3706))))

(declare-fun d!8805 () Bool)

(declare-fun lt!20107 () (_ BitVec 32))

(assert (=> d!8805 (and (bvsge lt!20107 #b00000000000000000000000000000000) (bvsle lt!20107 (bvsub (size!1664 a!4412) i!1489)))))

(declare-fun e!28788 () (_ BitVec 32))

(assert (=> d!8805 (= lt!20107 e!28788)))

(declare-fun c!6092 () Bool)

(assert (=> d!8805 (= c!6092 (bvsge i!1489 size!30))))

(assert (=> d!8805 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1664 a!4412)))))

(assert (=> d!8805 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20107)))

(declare-fun b!45300 () Bool)

(assert (=> b!45300 (= e!28788 e!28787)))

(declare-fun c!6093 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45300 (= c!6093 (validKeyInArray!0 (select (arr!1441 a!4412) i!1489)))))

(declare-fun b!45301 () Bool)

(assert (=> b!45301 (= e!28788 #b00000000000000000000000000000000)))

(declare-fun bm!3703 () Bool)

(assert (=> bm!3703 (= call!3706 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(assert (= (and d!8805 c!6092) b!45301))

(assert (= (and d!8805 (not c!6092)) b!45300))

(assert (= (and b!45300 c!6093) b!45299))

(assert (= (and b!45300 (not c!6093)) b!45298))

(assert (= (or b!45299 b!45298) bm!3703))

(declare-fun m!39797 () Bool)

(assert (=> b!45300 m!39797))

(assert (=> b!45300 m!39797))

(declare-fun m!39801 () Bool)

(assert (=> b!45300 m!39801))

(declare-fun m!39803 () Bool)

(assert (=> bm!3703 m!39803))

(assert (=> b!45273 d!8805))

(push 1)

(assert (not b!45300))

(assert (not bm!3703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

