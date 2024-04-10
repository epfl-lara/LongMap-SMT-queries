; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59834 () Bool)

(assert start!59834)

(declare-fun b!661258 () Bool)

(declare-fun res!429324 () Bool)

(declare-fun e!379877 () Bool)

(assert (=> b!661258 (=> (not res!429324) (not e!379877))))

(declare-datatypes ((List!12674 0))(
  ( (Nil!12671) (Cons!12670 (h!13715 (_ BitVec 64)) (t!18902 List!12674)) )
))
(declare-fun acc!681 () List!12674)

(declare-fun noDuplicate!498 (List!12674) Bool)

(assert (=> b!661258 (= res!429324 (noDuplicate!498 acc!681))))

(declare-fun b!661259 () Bool)

(assert (=> b!661259 (= e!379877 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38881 0))(
  ( (array!38882 (arr!18633 (Array (_ BitVec 32) (_ BitVec 64))) (size!18997 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38881)

(declare-fun arrayContainsKey!0 (array!38881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661259 (arrayContainsKey!0 (array!38882 (store (arr!18633 a!3626) i!1382 k!2843) (size!18997 a!3626)) k!2843 from!3004)))

(declare-fun b!661260 () Bool)

(declare-fun res!429333 () Bool)

(assert (=> b!661260 (=> (not res!429333) (not e!379877))))

(declare-fun contains!3251 (List!12674 (_ BitVec 64)) Bool)

(assert (=> b!661260 (= res!429333 (not (contains!3251 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661261 () Bool)

(declare-fun e!379880 () Bool)

(assert (=> b!661261 (= e!379880 (contains!3251 acc!681 k!2843))))

(declare-fun b!661262 () Bool)

(declare-fun res!429335 () Bool)

(assert (=> b!661262 (=> (not res!429335) (not e!379877))))

(assert (=> b!661262 (= res!429335 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18997 a!3626))))))

(declare-fun b!661263 () Bool)

(declare-fun res!429331 () Bool)

(assert (=> b!661263 (=> (not res!429331) (not e!379877))))

(declare-fun e!379878 () Bool)

(assert (=> b!661263 (= res!429331 e!379878)))

(declare-fun res!429327 () Bool)

(assert (=> b!661263 (=> res!429327 e!379878)))

(assert (=> b!661263 (= res!429327 e!379880)))

(declare-fun res!429334 () Bool)

(assert (=> b!661263 (=> (not res!429334) (not e!379880))))

(assert (=> b!661263 (= res!429334 (bvsgt from!3004 i!1382))))

(declare-fun b!661264 () Bool)

(declare-fun res!429328 () Bool)

(assert (=> b!661264 (=> (not res!429328) (not e!379877))))

(declare-fun arrayNoDuplicates!0 (array!38881 (_ BitVec 32) List!12674) Bool)

(assert (=> b!661264 (= res!429328 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12671))))

(declare-fun b!661265 () Bool)

(declare-fun res!429332 () Bool)

(assert (=> b!661265 (=> (not res!429332) (not e!379877))))

(assert (=> b!661265 (= res!429332 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18997 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661267 () Bool)

(declare-fun e!379881 () Bool)

(assert (=> b!661267 (= e!379881 (not (contains!3251 acc!681 k!2843)))))

(declare-fun res!429323 () Bool)

(assert (=> start!59834 (=> (not res!429323) (not e!379877))))

(assert (=> start!59834 (= res!429323 (and (bvslt (size!18997 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18997 a!3626))))))

(assert (=> start!59834 e!379877))

(assert (=> start!59834 true))

(declare-fun array_inv!14429 (array!38881) Bool)

(assert (=> start!59834 (array_inv!14429 a!3626)))

(declare-fun b!661266 () Bool)

(assert (=> b!661266 (= e!379878 e!379881)))

(declare-fun res!429322 () Bool)

(assert (=> b!661266 (=> (not res!429322) (not e!379881))))

(assert (=> b!661266 (= res!429322 (bvsle from!3004 i!1382))))

(declare-fun b!661268 () Bool)

(declare-fun res!429326 () Bool)

(assert (=> b!661268 (=> (not res!429326) (not e!379877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661268 (= res!429326 (validKeyInArray!0 k!2843))))

(declare-fun b!661269 () Bool)

(declare-fun res!429325 () Bool)

(assert (=> b!661269 (=> (not res!429325) (not e!379877))))

(assert (=> b!661269 (= res!429325 (not (contains!3251 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661270 () Bool)

(declare-fun res!429329 () Bool)

(assert (=> b!661270 (=> (not res!429329) (not e!379877))))

(assert (=> b!661270 (= res!429329 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661271 () Bool)

(declare-fun res!429330 () Bool)

(assert (=> b!661271 (=> (not res!429330) (not e!379877))))

(assert (=> b!661271 (= res!429330 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!59834 res!429323) b!661258))

(assert (= (and b!661258 res!429324) b!661260))

(assert (= (and b!661260 res!429333) b!661269))

(assert (= (and b!661269 res!429325) b!661263))

(assert (= (and b!661263 res!429334) b!661261))

(assert (= (and b!661263 (not res!429327)) b!661266))

(assert (= (and b!661266 res!429322) b!661267))

(assert (= (and b!661263 res!429331) b!661264))

(assert (= (and b!661264 res!429328) b!661270))

(assert (= (and b!661270 res!429329) b!661262))

(assert (= (and b!661262 res!429335) b!661268))

(assert (= (and b!661268 res!429326) b!661271))

(assert (= (and b!661271 res!429330) b!661265))

(assert (= (and b!661265 res!429332) b!661259))

(declare-fun m!633533 () Bool)

(assert (=> b!661269 m!633533))

(declare-fun m!633535 () Bool)

(assert (=> b!661268 m!633535))

(declare-fun m!633537 () Bool)

(assert (=> b!661260 m!633537))

(declare-fun m!633539 () Bool)

(assert (=> start!59834 m!633539))

(declare-fun m!633541 () Bool)

(assert (=> b!661261 m!633541))

(declare-fun m!633543 () Bool)

(assert (=> b!661264 m!633543))

(declare-fun m!633545 () Bool)

(assert (=> b!661258 m!633545))

(declare-fun m!633547 () Bool)

(assert (=> b!661270 m!633547))

(assert (=> b!661267 m!633541))

(declare-fun m!633549 () Bool)

(assert (=> b!661259 m!633549))

(declare-fun m!633551 () Bool)

(assert (=> b!661259 m!633551))

(declare-fun m!633553 () Bool)

(assert (=> b!661271 m!633553))

(push 1)

(assert (not b!661264))

(assert (not b!661267))

(assert (not b!661269))

(assert (not b!661271))

(assert (not start!59834))

(assert (not b!661258))

(assert (not b!661261))

(assert (not b!661270))

(assert (not b!661268))

(assert (not b!661260))

(assert (not b!661259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

