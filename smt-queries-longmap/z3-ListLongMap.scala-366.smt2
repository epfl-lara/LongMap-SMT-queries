; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7030 () Bool)

(assert start!7030)

(declare-fun res!26577 () Bool)

(declare-fun e!28816 () Bool)

(assert (=> start!7030 (=> (not res!26577) (not e!28816))))

(declare-datatypes ((array!3022 0))(
  ( (array!3023 (arr!1453 (Array (_ BitVec 32) (_ BitVec 64))) (size!1675 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3022)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7030 (= res!26577 (and (bvslt (size!1675 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1675 a!4412)) (= (size!1675 a!4412) size!30) (= a!4412 (array!3023 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (= i!1489 size!30)))))

(assert (=> start!7030 e!28816))

(declare-fun array_inv!865 (array!3022) Bool)

(assert (=> start!7030 (array_inv!865 a!4412)))

(assert (=> start!7030 true))

(declare-fun b!45342 () Bool)

(declare-fun arrayCountValidKeys!0 (array!3022 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45342 (= e!28816 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (= (and start!7030 res!26577) b!45342))

(declare-fun m!39873 () Bool)

(assert (=> start!7030 m!39873))

(declare-fun m!39875 () Bool)

(assert (=> b!45342 m!39875))

(check-sat (not b!45342) (not start!7030))
(check-sat)
(get-model)

(declare-fun b!45362 () Bool)

(declare-fun e!28832 () (_ BitVec 32))

(declare-fun call!3705 () (_ BitVec 32))

(assert (=> b!45362 (= e!28832 call!3705)))

(declare-fun b!45363 () Bool)

(declare-fun e!28833 () (_ BitVec 32))

(assert (=> b!45363 (= e!28833 #b00000000000000000000000000000000)))

(declare-fun b!45364 () Bool)

(assert (=> b!45364 (= e!28833 e!28832)))

(declare-fun c!6112 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45364 (= c!6112 (validKeyInArray!0 (select (arr!1453 a!4412) i!1489)))))

(declare-fun d!8835 () Bool)

(declare-fun lt!20121 () (_ BitVec 32))

(assert (=> d!8835 (and (bvsge lt!20121 #b00000000000000000000000000000000) (bvsle lt!20121 (bvsub (size!1675 a!4412) i!1489)))))

(assert (=> d!8835 (= lt!20121 e!28833)))

(declare-fun c!6111 () Bool)

(assert (=> d!8835 (= c!6111 (bvsge i!1489 size!30))))

(assert (=> d!8835 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1675 a!4412)))))

(assert (=> d!8835 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20121)))

(declare-fun bm!3702 () Bool)

(assert (=> bm!3702 (= call!3705 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45365 () Bool)

(assert (=> b!45365 (= e!28832 (bvadd #b00000000000000000000000000000001 call!3705))))

(assert (= (and d!8835 c!6111) b!45363))

(assert (= (and d!8835 (not c!6111)) b!45364))

(assert (= (and b!45364 c!6112) b!45365))

(assert (= (and b!45364 (not c!6112)) b!45362))

(assert (= (or b!45365 b!45362) bm!3702))

(declare-fun m!39881 () Bool)

(assert (=> b!45364 m!39881))

(assert (=> b!45364 m!39881))

(declare-fun m!39883 () Bool)

(assert (=> b!45364 m!39883))

(declare-fun m!39885 () Bool)

(assert (=> bm!3702 m!39885))

(assert (=> b!45342 d!8835))

(declare-fun d!8843 () Bool)

(assert (=> d!8843 (= (array_inv!865 a!4412) (bvsge (size!1675 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7030 d!8843))

(check-sat (not bm!3702) (not b!45364))
(check-sat)
