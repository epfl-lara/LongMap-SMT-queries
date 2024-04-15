; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115444 () Bool)

(assert start!115444)

(declare-fun b!1365359 () Bool)

(declare-fun res!908979 () Bool)

(declare-fun e!774175 () Bool)

(assert (=> b!1365359 (=> (not res!908979) (not e!774175))))

(declare-datatypes ((List!31937 0))(
  ( (Nil!31934) (Cons!31933 (h!33142 (_ BitVec 64)) (t!46623 List!31937)) )
))
(declare-fun lt!601100 () List!31937)

(declare-fun contains!9530 (List!31937 (_ BitVec 64)) Bool)

(assert (=> b!1365359 (= res!908979 (not (contains!9530 lt!601100 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365360 () Bool)

(declare-fun res!908981 () Bool)

(declare-fun e!774174 () Bool)

(assert (=> b!1365360 (=> (not res!908981) (not e!774174))))

(declare-fun newAcc!98 () List!31937)

(declare-fun acc!866 () List!31937)

(declare-fun subseq!968 (List!31937 List!31937) Bool)

(assert (=> b!1365360 (= res!908981 (subseq!968 newAcc!98 acc!866))))

(declare-fun b!1365361 () Bool)

(declare-fun res!908989 () Bool)

(assert (=> b!1365361 (=> (not res!908989) (not e!774174))))

(assert (=> b!1365361 (= res!908989 (not (contains!9530 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365362 () Bool)

(declare-fun res!908992 () Bool)

(assert (=> b!1365362 (=> (not res!908992) (not e!774174))))

(assert (=> b!1365362 (= res!908992 (not (contains!9530 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365363 () Bool)

(declare-fun res!908991 () Bool)

(assert (=> b!1365363 (=> (not res!908991) (not e!774174))))

(declare-fun noDuplicate!2445 (List!31937) Bool)

(assert (=> b!1365363 (= res!908991 (noDuplicate!2445 acc!866))))

(declare-fun b!1365364 () Bool)

(declare-fun res!908982 () Bool)

(assert (=> b!1365364 (=> (not res!908982) (not e!774175))))

(declare-fun lt!601098 () List!31937)

(assert (=> b!1365364 (= res!908982 (not (contains!9530 lt!601098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365365 () Bool)

(declare-fun res!908984 () Bool)

(assert (=> b!1365365 (=> (not res!908984) (not e!774175))))

(assert (=> b!1365365 (= res!908984 (noDuplicate!2445 lt!601100))))

(declare-fun b!1365366 () Bool)

(declare-fun e!774176 () Bool)

(assert (=> b!1365366 (= e!774176 e!774175)))

(declare-fun res!908978 () Bool)

(assert (=> b!1365366 (=> (not res!908978) (not e!774175))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1365366 (= res!908978 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92724 0))(
  ( (array!92725 (arr!44791 (Array (_ BitVec 32) (_ BitVec 64))) (size!45343 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92724)

(assert (=> b!1365366 (= lt!601098 (Cons!31933 (select (arr!44791 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365366 (= lt!601100 (Cons!31933 (select (arr!44791 a!3861) from!3239) acc!866))))

(declare-fun b!1365367 () Bool)

(declare-fun res!908977 () Bool)

(assert (=> b!1365367 (=> (not res!908977) (not e!774176))))

(assert (=> b!1365367 (= res!908977 (not (contains!9530 acc!866 (select (arr!44791 a!3861) from!3239))))))

(declare-fun b!1365368 () Bool)

(assert (=> b!1365368 (= e!774174 e!774176)))

(declare-fun res!908993 () Bool)

(assert (=> b!1365368 (=> (not res!908993) (not e!774176))))

(declare-fun arrayNoDuplicates!0 (array!92724 (_ BitVec 32) List!31937) Bool)

(assert (=> b!1365368 (= res!908993 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44910 0))(
  ( (Unit!44911) )
))
(declare-fun lt!601097 () Unit!44910)

(declare-fun noDuplicateSubseq!155 (List!31937 List!31937) Unit!44910)

(assert (=> b!1365368 (= lt!601097 (noDuplicateSubseq!155 newAcc!98 acc!866))))

(declare-fun b!1365369 () Bool)

(declare-fun res!908983 () Bool)

(assert (=> b!1365369 (=> (not res!908983) (not e!774174))))

(assert (=> b!1365369 (= res!908983 (not (contains!9530 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365370 () Bool)

(declare-fun res!908988 () Bool)

(assert (=> b!1365370 (=> (not res!908988) (not e!774176))))

(assert (=> b!1365370 (= res!908988 (bvslt from!3239 (size!45343 a!3861)))))

(declare-fun res!908985 () Bool)

(assert (=> start!115444 (=> (not res!908985) (not e!774174))))

(assert (=> start!115444 (= res!908985 (and (bvslt (size!45343 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45343 a!3861))))))

(assert (=> start!115444 e!774174))

(declare-fun array_inv!34024 (array!92724) Bool)

(assert (=> start!115444 (array_inv!34024 a!3861)))

(assert (=> start!115444 true))

(declare-fun b!1365371 () Bool)

(declare-fun res!908980 () Bool)

(assert (=> b!1365371 (=> (not res!908980) (not e!774175))))

(assert (=> b!1365371 (= res!908980 (subseq!968 lt!601098 lt!601100))))

(declare-fun b!1365372 () Bool)

(declare-fun res!908987 () Bool)

(assert (=> b!1365372 (=> (not res!908987) (not e!774174))))

(assert (=> b!1365372 (= res!908987 (not (contains!9530 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365373 () Bool)

(declare-fun res!908976 () Bool)

(assert (=> b!1365373 (=> (not res!908976) (not e!774175))))

(assert (=> b!1365373 (= res!908976 (not (contains!9530 lt!601100 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365374 () Bool)

(declare-fun res!908990 () Bool)

(assert (=> b!1365374 (=> (not res!908990) (not e!774175))))

(assert (=> b!1365374 (= res!908990 (not (contains!9530 lt!601098 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365375 () Bool)

(declare-fun res!908986 () Bool)

(assert (=> b!1365375 (=> (not res!908986) (not e!774176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365375 (= res!908986 (validKeyInArray!0 (select (arr!44791 a!3861) from!3239)))))

(declare-fun b!1365376 () Bool)

(assert (=> b!1365376 (= e!774175 false)))

(declare-fun lt!601099 () Bool)

(assert (=> b!1365376 (= lt!601099 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601100))))

(declare-fun lt!601101 () Unit!44910)

(assert (=> b!1365376 (= lt!601101 (noDuplicateSubseq!155 lt!601098 lt!601100))))

(assert (= (and start!115444 res!908985) b!1365363))

(assert (= (and b!1365363 res!908991) b!1365372))

(assert (= (and b!1365372 res!908987) b!1365369))

(assert (= (and b!1365369 res!908983) b!1365362))

(assert (= (and b!1365362 res!908992) b!1365361))

(assert (= (and b!1365361 res!908989) b!1365360))

(assert (= (and b!1365360 res!908981) b!1365368))

(assert (= (and b!1365368 res!908993) b!1365370))

(assert (= (and b!1365370 res!908988) b!1365375))

(assert (= (and b!1365375 res!908986) b!1365367))

(assert (= (and b!1365367 res!908977) b!1365366))

(assert (= (and b!1365366 res!908978) b!1365365))

(assert (= (and b!1365365 res!908984) b!1365359))

(assert (= (and b!1365359 res!908979) b!1365373))

(assert (= (and b!1365373 res!908976) b!1365364))

(assert (= (and b!1365364 res!908982) b!1365374))

(assert (= (and b!1365374 res!908990) b!1365371))

(assert (= (and b!1365371 res!908980) b!1365376))

(declare-fun m!1249455 () Bool)

(assert (=> b!1365368 m!1249455))

(declare-fun m!1249457 () Bool)

(assert (=> b!1365368 m!1249457))

(declare-fun m!1249459 () Bool)

(assert (=> b!1365359 m!1249459))

(declare-fun m!1249461 () Bool)

(assert (=> b!1365371 m!1249461))

(declare-fun m!1249463 () Bool)

(assert (=> b!1365366 m!1249463))

(declare-fun m!1249465 () Bool)

(assert (=> b!1365361 m!1249465))

(declare-fun m!1249467 () Bool)

(assert (=> start!115444 m!1249467))

(declare-fun m!1249469 () Bool)

(assert (=> b!1365373 m!1249469))

(declare-fun m!1249471 () Bool)

(assert (=> b!1365376 m!1249471))

(declare-fun m!1249473 () Bool)

(assert (=> b!1365376 m!1249473))

(declare-fun m!1249475 () Bool)

(assert (=> b!1365369 m!1249475))

(declare-fun m!1249477 () Bool)

(assert (=> b!1365372 m!1249477))

(declare-fun m!1249479 () Bool)

(assert (=> b!1365363 m!1249479))

(declare-fun m!1249481 () Bool)

(assert (=> b!1365362 m!1249481))

(assert (=> b!1365367 m!1249463))

(assert (=> b!1365367 m!1249463))

(declare-fun m!1249483 () Bool)

(assert (=> b!1365367 m!1249483))

(declare-fun m!1249485 () Bool)

(assert (=> b!1365365 m!1249485))

(declare-fun m!1249487 () Bool)

(assert (=> b!1365360 m!1249487))

(assert (=> b!1365375 m!1249463))

(assert (=> b!1365375 m!1249463))

(declare-fun m!1249489 () Bool)

(assert (=> b!1365375 m!1249489))

(declare-fun m!1249491 () Bool)

(assert (=> b!1365364 m!1249491))

(declare-fun m!1249493 () Bool)

(assert (=> b!1365374 m!1249493))

(check-sat (not b!1365375) (not b!1365371) (not b!1365361) (not b!1365368) (not b!1365364) (not b!1365374) (not b!1365363) (not b!1365360) (not b!1365367) (not b!1365369) (not b!1365359) (not b!1365373) (not b!1365376) (not b!1365362) (not start!115444) (not b!1365372) (not b!1365365))
(check-sat)
