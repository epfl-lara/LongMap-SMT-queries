; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62462 () Bool)

(assert start!62462)

(declare-fun b!702401 () Bool)

(declare-fun res!466212 () Bool)

(declare-fun e!397500 () Bool)

(assert (=> b!702401 (=> (not res!466212) (not e!397500))))

(declare-datatypes ((List!13268 0))(
  ( (Nil!13265) (Cons!13264 (h!14309 (_ BitVec 64)) (t!19550 List!13268)) )
))
(declare-fun acc!652 () List!13268)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3845 (List!13268 (_ BitVec 64)) Bool)

(assert (=> b!702401 (= res!466212 (not (contains!3845 acc!652 k!2824)))))

(declare-fun b!702402 () Bool)

(declare-fun res!466219 () Bool)

(assert (=> b!702402 (=> (not res!466219) (not e!397500))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40141 0))(
  ( (array!40142 (arr!19227 (Array (_ BitVec 32) (_ BitVec 64))) (size!19612 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40141)

(assert (=> b!702402 (= res!466219 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19612 a!3591)))))

(declare-fun b!702403 () Bool)

(declare-fun res!466224 () Bool)

(declare-fun e!397499 () Bool)

(assert (=> b!702403 (=> (not res!466224) (not e!397499))))

(declare-fun lt!317695 () List!13268)

(assert (=> b!702403 (= res!466224 (not (contains!3845 lt!317695 k!2824)))))

(declare-fun b!702404 () Bool)

(declare-fun res!466222 () Bool)

(assert (=> b!702404 (=> (not res!466222) (not e!397500))))

(declare-fun newAcc!49 () List!13268)

(assert (=> b!702404 (= res!466222 (contains!3845 newAcc!49 k!2824))))

(declare-fun b!702405 () Bool)

(declare-fun res!466226 () Bool)

(assert (=> b!702405 (=> (not res!466226) (not e!397500))))

(declare-fun noDuplicate!1092 (List!13268) Bool)

(assert (=> b!702405 (= res!466226 (noDuplicate!1092 acc!652))))

(declare-fun b!702406 () Bool)

(declare-fun res!466229 () Bool)

(assert (=> b!702406 (=> (not res!466229) (not e!397500))))

(assert (=> b!702406 (= res!466229 (not (contains!3845 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702407 () Bool)

(declare-fun res!466233 () Bool)

(assert (=> b!702407 (=> (not res!466233) (not e!397499))))

(declare-fun lt!317697 () List!13268)

(assert (=> b!702407 (= res!466233 (noDuplicate!1092 lt!317697))))

(declare-fun b!702408 () Bool)

(declare-fun res!466235 () Bool)

(assert (=> b!702408 (=> (not res!466235) (not e!397500))))

(declare-fun -!255 (List!13268 (_ BitVec 64)) List!13268)

(assert (=> b!702408 (= res!466235 (= (-!255 newAcc!49 k!2824) acc!652))))

(declare-fun b!702409 () Bool)

(declare-fun res!466216 () Bool)

(assert (=> b!702409 (=> (not res!466216) (not e!397500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702409 (= res!466216 (validKeyInArray!0 (select (arr!19227 a!3591) from!2969)))))

(declare-fun b!702410 () Bool)

(declare-fun res!466221 () Bool)

(assert (=> b!702410 (=> (not res!466221) (not e!397499))))

(assert (=> b!702410 (= res!466221 (not (contains!3845 lt!317697 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702411 () Bool)

(declare-fun res!466236 () Bool)

(assert (=> b!702411 (=> (not res!466236) (not e!397500))))

(assert (=> b!702411 (= res!466236 (not (contains!3845 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!466215 () Bool)

(assert (=> start!62462 (=> (not res!466215) (not e!397500))))

(assert (=> start!62462 (= res!466215 (and (bvslt (size!19612 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19612 a!3591))))))

(assert (=> start!62462 e!397500))

(assert (=> start!62462 true))

(declare-fun array_inv!15023 (array!40141) Bool)

(assert (=> start!62462 (array_inv!15023 a!3591)))

(declare-fun b!702412 () Bool)

(declare-fun res!466218 () Bool)

(assert (=> b!702412 (=> (not res!466218) (not e!397499))))

(declare-fun arrayNoDuplicates!0 (array!40141 (_ BitVec 32) List!13268) Bool)

(assert (=> b!702412 (= res!466218 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317695))))

(declare-fun b!702413 () Bool)

(declare-fun res!466228 () Bool)

(assert (=> b!702413 (=> (not res!466228) (not e!397500))))

(assert (=> b!702413 (= res!466228 (not (contains!3845 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702414 () Bool)

(declare-fun res!466217 () Bool)

(assert (=> b!702414 (=> (not res!466217) (not e!397500))))

(assert (=> b!702414 (= res!466217 (noDuplicate!1092 newAcc!49))))

(declare-fun b!702415 () Bool)

(assert (=> b!702415 (= e!397500 e!397499)))

(declare-fun res!466220 () Bool)

(assert (=> b!702415 (=> (not res!466220) (not e!397499))))

(assert (=> b!702415 (= res!466220 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!488 (List!13268 (_ BitVec 64)) List!13268)

(assert (=> b!702415 (= lt!317697 ($colon$colon!488 newAcc!49 (select (arr!19227 a!3591) from!2969)))))

(assert (=> b!702415 (= lt!317695 ($colon$colon!488 acc!652 (select (arr!19227 a!3591) from!2969)))))

(declare-fun b!702416 () Bool)

(declare-fun res!466231 () Bool)

(assert (=> b!702416 (=> (not res!466231) (not e!397500))))

(assert (=> b!702416 (= res!466231 (not (contains!3845 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702417 () Bool)

(declare-fun res!466239 () Bool)

(assert (=> b!702417 (=> (not res!466239) (not e!397499))))

(assert (=> b!702417 (= res!466239 (contains!3845 lt!317697 k!2824))))

(declare-fun b!702418 () Bool)

(declare-fun res!466234 () Bool)

(assert (=> b!702418 (=> (not res!466234) (not e!397499))))

(assert (=> b!702418 (= res!466234 (noDuplicate!1092 lt!317695))))

(declare-fun b!702419 () Bool)

(declare-fun res!466227 () Bool)

(assert (=> b!702419 (=> (not res!466227) (not e!397500))))

(declare-fun subseq!290 (List!13268 List!13268) Bool)

(assert (=> b!702419 (= res!466227 (subseq!290 acc!652 newAcc!49))))

(declare-fun b!702420 () Bool)

(declare-fun res!466232 () Bool)

(assert (=> b!702420 (=> (not res!466232) (not e!397500))))

(declare-fun arrayContainsKey!0 (array!40141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702420 (= res!466232 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!702421 () Bool)

(declare-fun res!466237 () Bool)

(assert (=> b!702421 (=> (not res!466237) (not e!397500))))

(assert (=> b!702421 (= res!466237 (validKeyInArray!0 k!2824))))

(declare-fun b!702422 () Bool)

(declare-fun res!466238 () Bool)

(assert (=> b!702422 (=> (not res!466238) (not e!397499))))

(assert (=> b!702422 (= res!466238 (not (contains!3845 lt!317695 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702423 () Bool)

(declare-fun res!466214 () Bool)

(assert (=> b!702423 (=> (not res!466214) (not e!397499))))

(assert (=> b!702423 (= res!466214 (= (-!255 lt!317697 k!2824) lt!317695))))

(declare-fun b!702424 () Bool)

(declare-fun res!466225 () Bool)

(assert (=> b!702424 (=> (not res!466225) (not e!397500))))

(assert (=> b!702424 (= res!466225 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702425 () Bool)

(declare-fun res!466230 () Bool)

(assert (=> b!702425 (=> (not res!466230) (not e!397499))))

(assert (=> b!702425 (= res!466230 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702426 () Bool)

(assert (=> b!702426 (= e!397499 (not true))))

(assert (=> b!702426 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317697)))

(declare-datatypes ((Unit!24588 0))(
  ( (Unit!24589) )
))
(declare-fun lt!317696 () Unit!24588)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40141 (_ BitVec 64) (_ BitVec 32) List!13268 List!13268) Unit!24588)

(assert (=> b!702426 (= lt!317696 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317695 lt!317697))))

(declare-fun b!702427 () Bool)

(declare-fun res!466211 () Bool)

(assert (=> b!702427 (=> (not res!466211) (not e!397499))))

(assert (=> b!702427 (= res!466211 (not (contains!3845 lt!317697 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702428 () Bool)

(declare-fun res!466213 () Bool)

(assert (=> b!702428 (=> (not res!466213) (not e!397499))))

(assert (=> b!702428 (= res!466213 (subseq!290 lt!317695 lt!317697))))

(declare-fun b!702429 () Bool)

(declare-fun res!466223 () Bool)

(assert (=> b!702429 (=> (not res!466223) (not e!397499))))

(assert (=> b!702429 (= res!466223 (not (contains!3845 lt!317695 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62462 res!466215) b!702405))

(assert (= (and b!702405 res!466226) b!702414))

(assert (= (and b!702414 res!466217) b!702411))

(assert (= (and b!702411 res!466236) b!702406))

(assert (= (and b!702406 res!466229) b!702420))

(assert (= (and b!702420 res!466232) b!702401))

(assert (= (and b!702401 res!466212) b!702421))

(assert (= (and b!702421 res!466237) b!702424))

(assert (= (and b!702424 res!466225) b!702419))

(assert (= (and b!702419 res!466227) b!702404))

(assert (= (and b!702404 res!466222) b!702408))

(assert (= (and b!702408 res!466235) b!702416))

(assert (= (and b!702416 res!466231) b!702413))

(assert (= (and b!702413 res!466228) b!702402))

(assert (= (and b!702402 res!466219) b!702409))

(assert (= (and b!702409 res!466216) b!702415))

(assert (= (and b!702415 res!466220) b!702418))

(assert (= (and b!702418 res!466234) b!702407))

(assert (= (and b!702407 res!466233) b!702429))

(assert (= (and b!702429 res!466223) b!702422))

(assert (= (and b!702422 res!466238) b!702425))

(assert (= (and b!702425 res!466230) b!702403))

(assert (= (and b!702403 res!466224) b!702412))

(assert (= (and b!702412 res!466218) b!702428))

(assert (= (and b!702428 res!466213) b!702417))

(assert (= (and b!702417 res!466239) b!702423))

(assert (= (and b!702423 res!466214) b!702410))

(assert (= (and b!702410 res!466221) b!702427))

(assert (= (and b!702427 res!466211) b!702426))

(declare-fun m!661507 () Bool)

(assert (=> b!702428 m!661507))

(declare-fun m!661509 () Bool)

(assert (=> b!702410 m!661509))

(declare-fun m!661511 () Bool)

(assert (=> b!702411 m!661511))

(declare-fun m!661513 () Bool)

(assert (=> b!702404 m!661513))

(declare-fun m!661515 () Bool)

(assert (=> b!702416 m!661515))

(declare-fun m!661517 () Bool)

(assert (=> b!702419 m!661517))

(declare-fun m!661519 () Bool)

(assert (=> start!62462 m!661519))

(declare-fun m!661521 () Bool)

(assert (=> b!702413 m!661521))

(declare-fun m!661523 () Bool)

(assert (=> b!702408 m!661523))

(declare-fun m!661525 () Bool)

(assert (=> b!702422 m!661525))

(declare-fun m!661527 () Bool)

(assert (=> b!702426 m!661527))

(declare-fun m!661529 () Bool)

(assert (=> b!702426 m!661529))

(declare-fun m!661531 () Bool)

(assert (=> b!702429 m!661531))

(declare-fun m!661533 () Bool)

(assert (=> b!702406 m!661533))

(declare-fun m!661535 () Bool)

(assert (=> b!702415 m!661535))

(assert (=> b!702415 m!661535))

(declare-fun m!661537 () Bool)

(assert (=> b!702415 m!661537))

(assert (=> b!702415 m!661535))

(declare-fun m!661539 () Bool)

(assert (=> b!702415 m!661539))

(declare-fun m!661541 () Bool)

(assert (=> b!702414 m!661541))

(declare-fun m!661543 () Bool)

(assert (=> b!702403 m!661543))

(declare-fun m!661545 () Bool)

(assert (=> b!702427 m!661545))

(declare-fun m!661547 () Bool)

(assert (=> b!702418 m!661547))

(declare-fun m!661549 () Bool)

(assert (=> b!702421 m!661549))

(declare-fun m!661551 () Bool)

(assert (=> b!702407 m!661551))

(declare-fun m!661553 () Bool)

(assert (=> b!702424 m!661553))

(declare-fun m!661555 () Bool)

(assert (=> b!702420 m!661555))

(declare-fun m!661557 () Bool)

(assert (=> b!702423 m!661557))

(declare-fun m!661559 () Bool)

(assert (=> b!702405 m!661559))

(assert (=> b!702409 m!661535))

(assert (=> b!702409 m!661535))

(declare-fun m!661561 () Bool)

(assert (=> b!702409 m!661561))

(declare-fun m!661563 () Bool)

(assert (=> b!702417 m!661563))

(declare-fun m!661565 () Bool)

(assert (=> b!702401 m!661565))

(declare-fun m!661567 () Bool)

(assert (=> b!702425 m!661567))

(declare-fun m!661569 () Bool)

(assert (=> b!702412 m!661569))

(push 1)

