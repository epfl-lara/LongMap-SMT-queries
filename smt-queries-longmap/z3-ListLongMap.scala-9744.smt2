; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115672 () Bool)

(assert start!115672)

(declare-fun b!1366568 () Bool)

(declare-fun res!909367 () Bool)

(declare-fun e!775015 () Bool)

(assert (=> b!1366568 (=> (not res!909367) (not e!775015))))

(declare-datatypes ((List!31921 0))(
  ( (Nil!31918) (Cons!31917 (h!33135 (_ BitVec 64)) (t!46607 List!31921)) )
))
(declare-fun lt!601719 () List!31921)

(declare-fun lt!601715 () List!31921)

(declare-fun subseq!965 (List!31921 List!31921) Bool)

(assert (=> b!1366568 (= res!909367 (subseq!965 lt!601719 lt!601715))))

(declare-fun b!1366569 () Bool)

(declare-fun res!909377 () Bool)

(assert (=> b!1366569 (=> (not res!909377) (not e!775015))))

(declare-fun contains!9606 (List!31921 (_ BitVec 64)) Bool)

(assert (=> b!1366569 (= res!909377 (not (contains!9606 lt!601715 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366570 () Bool)

(declare-fun res!909378 () Bool)

(assert (=> b!1366570 (=> (not res!909378) (not e!775015))))

(assert (=> b!1366570 (= res!909378 (not (contains!9606 lt!601719 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366571 () Bool)

(declare-fun res!909372 () Bool)

(declare-fun e!775016 () Bool)

(assert (=> b!1366571 (=> (not res!909372) (not e!775016))))

(declare-fun acc!866 () List!31921)

(assert (=> b!1366571 (= res!909372 (not (contains!9606 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366572 () Bool)

(declare-fun res!909374 () Bool)

(declare-fun e!775017 () Bool)

(assert (=> b!1366572 (=> (not res!909374) (not e!775017))))

(declare-datatypes ((array!92884 0))(
  ( (array!92885 (arr!44866 (Array (_ BitVec 32) (_ BitVec 64))) (size!45417 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92884)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1366572 (= res!909374 (not (contains!9606 acc!866 (select (arr!44866 a!3861) from!3239))))))

(declare-fun b!1366573 () Bool)

(declare-fun res!909369 () Bool)

(assert (=> b!1366573 (=> (not res!909369) (not e!775015))))

(assert (=> b!1366573 (= res!909369 (not (contains!9606 lt!601719 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366574 () Bool)

(declare-fun res!909370 () Bool)

(assert (=> b!1366574 (=> (not res!909370) (not e!775017))))

(assert (=> b!1366574 (= res!909370 (bvslt from!3239 (size!45417 a!3861)))))

(declare-fun b!1366575 () Bool)

(declare-fun res!909376 () Bool)

(assert (=> b!1366575 (=> (not res!909376) (not e!775017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366575 (= res!909376 (validKeyInArray!0 (select (arr!44866 a!3861) from!3239)))))

(declare-fun b!1366576 () Bool)

(assert (=> b!1366576 (= e!775016 e!775017)))

(declare-fun res!909366 () Bool)

(assert (=> b!1366576 (=> (not res!909366) (not e!775017))))

(declare-fun arrayNoDuplicates!0 (array!92884 (_ BitVec 32) List!31921) Bool)

(assert (=> b!1366576 (= res!909366 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45002 0))(
  ( (Unit!45003) )
))
(declare-fun lt!601717 () Unit!45002)

(declare-fun newAcc!98 () List!31921)

(declare-fun noDuplicateSubseq!152 (List!31921 List!31921) Unit!45002)

(assert (=> b!1366576 (= lt!601717 (noDuplicateSubseq!152 newAcc!98 acc!866))))

(declare-fun b!1366577 () Bool)

(declare-fun res!909365 () Bool)

(assert (=> b!1366577 (=> (not res!909365) (not e!775016))))

(assert (=> b!1366577 (= res!909365 (not (contains!9606 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366578 () Bool)

(declare-fun res!909371 () Bool)

(assert (=> b!1366578 (=> (not res!909371) (not e!775016))))

(assert (=> b!1366578 (= res!909371 (subseq!965 newAcc!98 acc!866))))

(declare-fun b!1366579 () Bool)

(assert (=> b!1366579 (= e!775015 false)))

(declare-fun lt!601716 () Bool)

(assert (=> b!1366579 (= lt!601716 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601715))))

(declare-fun lt!601718 () Unit!45002)

(assert (=> b!1366579 (= lt!601718 (noDuplicateSubseq!152 lt!601719 lt!601715))))

(declare-fun res!909368 () Bool)

(assert (=> start!115672 (=> (not res!909368) (not e!775016))))

(assert (=> start!115672 (= res!909368 (and (bvslt (size!45417 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45417 a!3861))))))

(assert (=> start!115672 e!775016))

(declare-fun array_inv!34147 (array!92884) Bool)

(assert (=> start!115672 (array_inv!34147 a!3861)))

(assert (=> start!115672 true))

(declare-fun b!1366580 () Bool)

(declare-fun res!909373 () Bool)

(assert (=> b!1366580 (=> (not res!909373) (not e!775015))))

(declare-fun noDuplicate!2437 (List!31921) Bool)

(assert (=> b!1366580 (= res!909373 (noDuplicate!2437 lt!601715))))

(declare-fun b!1366581 () Bool)

(declare-fun res!909375 () Bool)

(assert (=> b!1366581 (=> (not res!909375) (not e!775016))))

(assert (=> b!1366581 (= res!909375 (not (contains!9606 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366582 () Bool)

(assert (=> b!1366582 (= e!775017 e!775015)))

(declare-fun res!909361 () Bool)

(assert (=> b!1366582 (=> (not res!909361) (not e!775015))))

(assert (=> b!1366582 (= res!909361 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366582 (= lt!601719 (Cons!31917 (select (arr!44866 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366582 (= lt!601715 (Cons!31917 (select (arr!44866 a!3861) from!3239) acc!866))))

(declare-fun b!1366583 () Bool)

(declare-fun res!909364 () Bool)

(assert (=> b!1366583 (=> (not res!909364) (not e!775016))))

(assert (=> b!1366583 (= res!909364 (noDuplicate!2437 acc!866))))

(declare-fun b!1366584 () Bool)

(declare-fun res!909363 () Bool)

(assert (=> b!1366584 (=> (not res!909363) (not e!775016))))

(assert (=> b!1366584 (= res!909363 (not (contains!9606 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366585 () Bool)

(declare-fun res!909362 () Bool)

(assert (=> b!1366585 (=> (not res!909362) (not e!775015))))

(assert (=> b!1366585 (= res!909362 (not (contains!9606 lt!601715 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115672 res!909368) b!1366583))

(assert (= (and b!1366583 res!909364) b!1366584))

(assert (= (and b!1366584 res!909363) b!1366571))

(assert (= (and b!1366571 res!909372) b!1366577))

(assert (= (and b!1366577 res!909365) b!1366581))

(assert (= (and b!1366581 res!909375) b!1366578))

(assert (= (and b!1366578 res!909371) b!1366576))

(assert (= (and b!1366576 res!909366) b!1366574))

(assert (= (and b!1366574 res!909370) b!1366575))

(assert (= (and b!1366575 res!909376) b!1366572))

(assert (= (and b!1366572 res!909374) b!1366582))

(assert (= (and b!1366582 res!909361) b!1366580))

(assert (= (and b!1366580 res!909373) b!1366569))

(assert (= (and b!1366569 res!909377) b!1366585))

(assert (= (and b!1366585 res!909362) b!1366570))

(assert (= (and b!1366570 res!909378) b!1366573))

(assert (= (and b!1366573 res!909369) b!1366568))

(assert (= (and b!1366568 res!909367) b!1366579))

(declare-fun m!1251457 () Bool)

(assert (=> b!1366569 m!1251457))

(declare-fun m!1251459 () Bool)

(assert (=> b!1366582 m!1251459))

(declare-fun m!1251461 () Bool)

(assert (=> b!1366578 m!1251461))

(declare-fun m!1251463 () Bool)

(assert (=> b!1366584 m!1251463))

(declare-fun m!1251465 () Bool)

(assert (=> b!1366568 m!1251465))

(declare-fun m!1251467 () Bool)

(assert (=> b!1366571 m!1251467))

(declare-fun m!1251469 () Bool)

(assert (=> b!1366583 m!1251469))

(declare-fun m!1251471 () Bool)

(assert (=> b!1366577 m!1251471))

(declare-fun m!1251473 () Bool)

(assert (=> b!1366576 m!1251473))

(declare-fun m!1251475 () Bool)

(assert (=> b!1366576 m!1251475))

(declare-fun m!1251477 () Bool)

(assert (=> b!1366581 m!1251477))

(assert (=> b!1366572 m!1251459))

(assert (=> b!1366572 m!1251459))

(declare-fun m!1251479 () Bool)

(assert (=> b!1366572 m!1251479))

(declare-fun m!1251481 () Bool)

(assert (=> b!1366580 m!1251481))

(assert (=> b!1366575 m!1251459))

(assert (=> b!1366575 m!1251459))

(declare-fun m!1251483 () Bool)

(assert (=> b!1366575 m!1251483))

(declare-fun m!1251485 () Bool)

(assert (=> b!1366585 m!1251485))

(declare-fun m!1251487 () Bool)

(assert (=> b!1366579 m!1251487))

(declare-fun m!1251489 () Bool)

(assert (=> b!1366579 m!1251489))

(declare-fun m!1251491 () Bool)

(assert (=> b!1366570 m!1251491))

(declare-fun m!1251493 () Bool)

(assert (=> start!115672 m!1251493))

(declare-fun m!1251495 () Bool)

(assert (=> b!1366573 m!1251495))

(check-sat (not b!1366573) (not b!1366578) (not b!1366584) (not b!1366576) (not b!1366583) (not b!1366570) (not b!1366571) (not b!1366579) (not b!1366572) (not b!1366577) (not b!1366568) (not b!1366575) (not b!1366585) (not start!115672) (not b!1366580) (not b!1366569) (not b!1366581))
(check-sat)
