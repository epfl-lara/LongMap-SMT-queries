; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115666 () Bool)

(assert start!115666)

(declare-fun b!1366406 () Bool)

(declare-fun res!909203 () Bool)

(declare-fun e!774982 () Bool)

(assert (=> b!1366406 (=> (not res!909203) (not e!774982))))

(declare-datatypes ((List!31918 0))(
  ( (Nil!31915) (Cons!31914 (h!33132 (_ BitVec 64)) (t!46604 List!31918)) )
))
(declare-fun lt!601673 () List!31918)

(declare-fun contains!9603 (List!31918 (_ BitVec 64)) Bool)

(assert (=> b!1366406 (= res!909203 (not (contains!9603 lt!601673 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366407 () Bool)

(declare-fun res!909212 () Bool)

(declare-fun e!774980 () Bool)

(assert (=> b!1366407 (=> (not res!909212) (not e!774980))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!31918)

(declare-datatypes ((array!92878 0))(
  ( (array!92879 (arr!44863 (Array (_ BitVec 32) (_ BitVec 64))) (size!45414 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92878)

(assert (=> b!1366407 (= res!909212 (not (contains!9603 acc!866 (select (arr!44863 a!3861) from!3239))))))

(declare-fun b!1366408 () Bool)

(declare-fun res!909202 () Bool)

(declare-fun e!774981 () Bool)

(assert (=> b!1366408 (=> (not res!909202) (not e!774981))))

(declare-fun noDuplicate!2434 (List!31918) Bool)

(assert (=> b!1366408 (= res!909202 (noDuplicate!2434 acc!866))))

(declare-fun b!1366409 () Bool)

(declare-fun res!909206 () Bool)

(assert (=> b!1366409 (=> (not res!909206) (not e!774982))))

(declare-fun lt!601670 () List!31918)

(assert (=> b!1366409 (= res!909206 (noDuplicate!2434 lt!601670))))

(declare-fun b!1366410 () Bool)

(declare-fun res!909213 () Bool)

(assert (=> b!1366410 (=> (not res!909213) (not e!774982))))

(assert (=> b!1366410 (= res!909213 (not (contains!9603 lt!601670 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366411 () Bool)

(declare-fun res!909216 () Bool)

(assert (=> b!1366411 (=> (not res!909216) (not e!774981))))

(declare-fun newAcc!98 () List!31918)

(assert (=> b!1366411 (= res!909216 (not (contains!9603 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366412 () Bool)

(declare-fun res!909207 () Bool)

(assert (=> b!1366412 (=> (not res!909207) (not e!774981))))

(declare-fun subseq!962 (List!31918 List!31918) Bool)

(assert (=> b!1366412 (= res!909207 (subseq!962 newAcc!98 acc!866))))

(declare-fun b!1366413 () Bool)

(declare-fun res!909204 () Bool)

(assert (=> b!1366413 (=> (not res!909204) (not e!774981))))

(assert (=> b!1366413 (= res!909204 (not (contains!9603 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366414 () Bool)

(declare-fun res!909210 () Bool)

(assert (=> b!1366414 (=> (not res!909210) (not e!774982))))

(assert (=> b!1366414 (= res!909210 (subseq!962 lt!601673 lt!601670))))

(declare-fun b!1366415 () Bool)

(declare-fun res!909215 () Bool)

(assert (=> b!1366415 (=> (not res!909215) (not e!774982))))

(assert (=> b!1366415 (= res!909215 (not (contains!9603 lt!601673 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366416 () Bool)

(declare-fun res!909209 () Bool)

(assert (=> b!1366416 (=> (not res!909209) (not e!774981))))

(assert (=> b!1366416 (= res!909209 (not (contains!9603 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366417 () Bool)

(assert (=> b!1366417 (= e!774981 e!774980)))

(declare-fun res!909205 () Bool)

(assert (=> b!1366417 (=> (not res!909205) (not e!774980))))

(declare-fun arrayNoDuplicates!0 (array!92878 (_ BitVec 32) List!31918) Bool)

(assert (=> b!1366417 (= res!909205 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44996 0))(
  ( (Unit!44997) )
))
(declare-fun lt!601672 () Unit!44996)

(declare-fun noDuplicateSubseq!149 (List!31918 List!31918) Unit!44996)

(assert (=> b!1366417 (= lt!601672 (noDuplicateSubseq!149 newAcc!98 acc!866))))

(declare-fun res!909208 () Bool)

(assert (=> start!115666 (=> (not res!909208) (not e!774981))))

(assert (=> start!115666 (= res!909208 (and (bvslt (size!45414 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45414 a!3861))))))

(assert (=> start!115666 e!774981))

(declare-fun array_inv!34144 (array!92878) Bool)

(assert (=> start!115666 (array_inv!34144 a!3861)))

(assert (=> start!115666 true))

(declare-fun b!1366418 () Bool)

(declare-fun res!909211 () Bool)

(assert (=> b!1366418 (=> (not res!909211) (not e!774981))))

(assert (=> b!1366418 (= res!909211 (not (contains!9603 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366419 () Bool)

(declare-fun res!909200 () Bool)

(assert (=> b!1366419 (=> (not res!909200) (not e!774980))))

(assert (=> b!1366419 (= res!909200 (bvslt from!3239 (size!45414 a!3861)))))

(declare-fun b!1366420 () Bool)

(assert (=> b!1366420 (= e!774982 false)))

(declare-fun lt!601674 () Bool)

(assert (=> b!1366420 (= lt!601674 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601670))))

(declare-fun lt!601671 () Unit!44996)

(assert (=> b!1366420 (= lt!601671 (noDuplicateSubseq!149 lt!601673 lt!601670))))

(declare-fun b!1366421 () Bool)

(declare-fun res!909199 () Bool)

(assert (=> b!1366421 (=> (not res!909199) (not e!774982))))

(assert (=> b!1366421 (= res!909199 (not (contains!9603 lt!601670 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366422 () Bool)

(assert (=> b!1366422 (= e!774980 e!774982)))

(declare-fun res!909214 () Bool)

(assert (=> b!1366422 (=> (not res!909214) (not e!774982))))

(assert (=> b!1366422 (= res!909214 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366422 (= lt!601673 (Cons!31914 (select (arr!44863 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366422 (= lt!601670 (Cons!31914 (select (arr!44863 a!3861) from!3239) acc!866))))

(declare-fun b!1366423 () Bool)

(declare-fun res!909201 () Bool)

(assert (=> b!1366423 (=> (not res!909201) (not e!774980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366423 (= res!909201 (validKeyInArray!0 (select (arr!44863 a!3861) from!3239)))))

(assert (= (and start!115666 res!909208) b!1366408))

(assert (= (and b!1366408 res!909202) b!1366416))

(assert (= (and b!1366416 res!909209) b!1366413))

(assert (= (and b!1366413 res!909204) b!1366411))

(assert (= (and b!1366411 res!909216) b!1366418))

(assert (= (and b!1366418 res!909211) b!1366412))

(assert (= (and b!1366412 res!909207) b!1366417))

(assert (= (and b!1366417 res!909205) b!1366419))

(assert (= (and b!1366419 res!909200) b!1366423))

(assert (= (and b!1366423 res!909201) b!1366407))

(assert (= (and b!1366407 res!909212) b!1366422))

(assert (= (and b!1366422 res!909214) b!1366409))

(assert (= (and b!1366409 res!909206) b!1366421))

(assert (= (and b!1366421 res!909199) b!1366410))

(assert (= (and b!1366410 res!909213) b!1366415))

(assert (= (and b!1366415 res!909215) b!1366406))

(assert (= (and b!1366406 res!909203) b!1366414))

(assert (= (and b!1366414 res!909210) b!1366420))

(declare-fun m!1251337 () Bool)

(assert (=> b!1366415 m!1251337))

(declare-fun m!1251339 () Bool)

(assert (=> b!1366423 m!1251339))

(assert (=> b!1366423 m!1251339))

(declare-fun m!1251341 () Bool)

(assert (=> b!1366423 m!1251341))

(declare-fun m!1251343 () Bool)

(assert (=> b!1366416 m!1251343))

(assert (=> b!1366407 m!1251339))

(assert (=> b!1366407 m!1251339))

(declare-fun m!1251345 () Bool)

(assert (=> b!1366407 m!1251345))

(declare-fun m!1251347 () Bool)

(assert (=> b!1366406 m!1251347))

(declare-fun m!1251349 () Bool)

(assert (=> b!1366413 m!1251349))

(declare-fun m!1251351 () Bool)

(assert (=> b!1366420 m!1251351))

(declare-fun m!1251353 () Bool)

(assert (=> b!1366420 m!1251353))

(declare-fun m!1251355 () Bool)

(assert (=> b!1366418 m!1251355))

(declare-fun m!1251357 () Bool)

(assert (=> start!115666 m!1251357))

(declare-fun m!1251359 () Bool)

(assert (=> b!1366410 m!1251359))

(declare-fun m!1251361 () Bool)

(assert (=> b!1366414 m!1251361))

(declare-fun m!1251363 () Bool)

(assert (=> b!1366417 m!1251363))

(declare-fun m!1251365 () Bool)

(assert (=> b!1366417 m!1251365))

(assert (=> b!1366422 m!1251339))

(declare-fun m!1251367 () Bool)

(assert (=> b!1366408 m!1251367))

(declare-fun m!1251369 () Bool)

(assert (=> b!1366411 m!1251369))

(declare-fun m!1251371 () Bool)

(assert (=> b!1366421 m!1251371))

(declare-fun m!1251373 () Bool)

(assert (=> b!1366412 m!1251373))

(declare-fun m!1251375 () Bool)

(assert (=> b!1366409 m!1251375))

(check-sat (not b!1366413) (not b!1366423) (not b!1366417) (not b!1366410) (not b!1366418) (not b!1366416) (not b!1366414) (not b!1366412) (not b!1366420) (not b!1366407) (not b!1366411) (not b!1366408) (not b!1366415) (not b!1366409) (not b!1366421) (not start!115666) (not b!1366406))
(check-sat)
