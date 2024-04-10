; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115726 () Bool)

(assert start!115726)

(declare-fun b!1368510 () Bool)

(declare-fun res!912023 () Bool)

(declare-fun e!775353 () Bool)

(assert (=> b!1368510 (=> (not res!912023) (not e!775353))))

(declare-datatypes ((List!31951 0))(
  ( (Nil!31948) (Cons!31947 (h!33156 (_ BitVec 64)) (t!46645 List!31951)) )
))
(declare-fun newAcc!98 () List!31951)

(declare-fun contains!9633 (List!31951 (_ BitVec 64)) Bool)

(assert (=> b!1368510 (= res!912023 (not (contains!9633 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368511 () Bool)

(declare-fun res!912020 () Bool)

(declare-fun e!775354 () Bool)

(assert (=> b!1368511 (=> (not res!912020) (not e!775354))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1368511 (= res!912020 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368512 () Bool)

(assert (=> b!1368512 (= e!775354 false)))

(declare-datatypes ((array!92918 0))(
  ( (array!92919 (arr!44883 (Array (_ BitVec 32) (_ BitVec 64))) (size!45433 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92918)

(declare-fun lt!602079 () Bool)

(declare-fun acc!866 () List!31951)

(declare-fun arrayNoDuplicates!0 (array!92918 (_ BitVec 32) List!31951) Bool)

(assert (=> b!1368512 (= lt!602079 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368513 () Bool)

(declare-fun res!912021 () Bool)

(assert (=> b!1368513 (=> (not res!912021) (not e!775353))))

(assert (=> b!1368513 (= res!912021 (not (contains!9633 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368514 () Bool)

(assert (=> b!1368514 (= e!775353 e!775354)))

(declare-fun res!912028 () Bool)

(assert (=> b!1368514 (=> (not res!912028) (not e!775354))))

(assert (=> b!1368514 (= res!912028 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45203 0))(
  ( (Unit!45204) )
))
(declare-fun lt!602080 () Unit!45203)

(declare-fun noDuplicateSubseq!222 (List!31951 List!31951) Unit!45203)

(assert (=> b!1368514 (= lt!602080 (noDuplicateSubseq!222 newAcc!98 acc!866))))

(declare-fun b!1368515 () Bool)

(declare-fun res!912024 () Bool)

(assert (=> b!1368515 (=> (not res!912024) (not e!775353))))

(declare-fun noDuplicate!2490 (List!31951) Bool)

(assert (=> b!1368515 (= res!912024 (noDuplicate!2490 acc!866))))

(declare-fun b!1368516 () Bool)

(declare-fun res!912025 () Bool)

(assert (=> b!1368516 (=> (not res!912025) (not e!775354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368516 (= res!912025 (not (validKeyInArray!0 (select (arr!44883 a!3861) from!3239))))))

(declare-fun b!1368517 () Bool)

(declare-fun res!912018 () Bool)

(assert (=> b!1368517 (=> (not res!912018) (not e!775353))))

(assert (=> b!1368517 (= res!912018 (not (contains!9633 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368518 () Bool)

(declare-fun res!912019 () Bool)

(assert (=> b!1368518 (=> (not res!912019) (not e!775353))))

(assert (=> b!1368518 (= res!912019 (not (contains!9633 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912027 () Bool)

(assert (=> start!115726 (=> (not res!912027) (not e!775353))))

(assert (=> start!115726 (= res!912027 (and (bvslt (size!45433 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45433 a!3861))))))

(assert (=> start!115726 e!775353))

(declare-fun array_inv!33911 (array!92918) Bool)

(assert (=> start!115726 (array_inv!33911 a!3861)))

(assert (=> start!115726 true))

(declare-fun b!1368519 () Bool)

(declare-fun res!912022 () Bool)

(assert (=> b!1368519 (=> (not res!912022) (not e!775353))))

(declare-fun subseq!1035 (List!31951 List!31951) Bool)

(assert (=> b!1368519 (= res!912022 (subseq!1035 newAcc!98 acc!866))))

(declare-fun b!1368520 () Bool)

(declare-fun res!912026 () Bool)

(assert (=> b!1368520 (=> (not res!912026) (not e!775354))))

(assert (=> b!1368520 (= res!912026 (bvslt from!3239 (size!45433 a!3861)))))

(assert (= (and start!115726 res!912027) b!1368515))

(assert (= (and b!1368515 res!912024) b!1368513))

(assert (= (and b!1368513 res!912021) b!1368518))

(assert (= (and b!1368518 res!912019) b!1368517))

(assert (= (and b!1368517 res!912018) b!1368510))

(assert (= (and b!1368510 res!912023) b!1368519))

(assert (= (and b!1368519 res!912022) b!1368514))

(assert (= (and b!1368514 res!912028) b!1368520))

(assert (= (and b!1368520 res!912026) b!1368516))

(assert (= (and b!1368516 res!912025) b!1368511))

(assert (= (and b!1368511 res!912020) b!1368512))

(declare-fun m!1252459 () Bool)

(assert (=> b!1368517 m!1252459))

(declare-fun m!1252461 () Bool)

(assert (=> b!1368515 m!1252461))

(declare-fun m!1252463 () Bool)

(assert (=> b!1368516 m!1252463))

(assert (=> b!1368516 m!1252463))

(declare-fun m!1252465 () Bool)

(assert (=> b!1368516 m!1252465))

(declare-fun m!1252467 () Bool)

(assert (=> start!115726 m!1252467))

(declare-fun m!1252469 () Bool)

(assert (=> b!1368518 m!1252469))

(declare-fun m!1252471 () Bool)

(assert (=> b!1368514 m!1252471))

(declare-fun m!1252473 () Bool)

(assert (=> b!1368514 m!1252473))

(declare-fun m!1252475 () Bool)

(assert (=> b!1368510 m!1252475))

(declare-fun m!1252477 () Bool)

(assert (=> b!1368519 m!1252477))

(declare-fun m!1252479 () Bool)

(assert (=> b!1368513 m!1252479))

(declare-fun m!1252481 () Bool)

(assert (=> b!1368512 m!1252481))

(check-sat (not b!1368517) (not b!1368518) (not b!1368514) (not b!1368516) (not b!1368512) (not b!1368510) (not b!1368519) (not b!1368515) (not start!115726) (not b!1368513))
(check-sat)
