; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92392 () Bool)

(assert start!92392)

(declare-fun b!1050374 () Bool)

(declare-fun e!596075 () Bool)

(declare-fun e!596076 () Bool)

(assert (=> b!1050374 (= e!596075 e!596076)))

(declare-fun res!699589 () Bool)

(assert (=> b!1050374 (=> (not res!699589) (not e!596076))))

(declare-datatypes ((array!66134 0))(
  ( (array!66135 (arr!31806 (Array (_ BitVec 32) (_ BitVec 64))) (size!32344 (_ BitVec 32))) )
))
(declare-fun lt!463797 () array!66134)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050374 (= res!699589 (arrayContainsKey!0 lt!463797 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66134)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050374 (= lt!463797 (array!66135 (store (arr!31806 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32344 a!3488)))))

(declare-fun b!1050375 () Bool)

(declare-fun e!596073 () Bool)

(assert (=> b!1050375 (= e!596076 e!596073)))

(declare-fun res!699585 () Bool)

(assert (=> b!1050375 (=> (not res!699585) (not e!596073))))

(declare-fun lt!463798 () (_ BitVec 32))

(assert (=> b!1050375 (= res!699585 (not (= lt!463798 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66134 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050375 (= lt!463798 (arrayScanForKey!0 lt!463797 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!699586 () Bool)

(assert (=> start!92392 (=> (not res!699586) (not e!596075))))

(assert (=> start!92392 (= res!699586 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32344 a!3488)) (bvslt (size!32344 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92392 e!596075))

(assert (=> start!92392 true))

(declare-fun array_inv!24589 (array!66134) Bool)

(assert (=> start!92392 (array_inv!24589 a!3488)))

(declare-fun b!1050376 () Bool)

(declare-fun res!699587 () Bool)

(assert (=> b!1050376 (=> (not res!699587) (not e!596075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050376 (= res!699587 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050377 () Bool)

(declare-fun res!699584 () Bool)

(assert (=> b!1050377 (=> (not res!699584) (not e!596075))))

(declare-datatypes ((List!22177 0))(
  ( (Nil!22174) (Cons!22173 (h!23382 (_ BitVec 64)) (t!31475 List!22177)) )
))
(declare-fun arrayNoDuplicates!0 (array!66134 (_ BitVec 32) List!22177) Bool)

(assert (=> b!1050377 (= res!699584 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22174))))

(declare-fun b!1050378 () Bool)

(declare-fun res!699588 () Bool)

(assert (=> b!1050378 (=> (not res!699588) (not e!596075))))

(assert (=> b!1050378 (= res!699588 (= (select (arr!31806 a!3488) i!1381) k0!2747))))

(declare-fun b!1050379 () Bool)

(assert (=> b!1050379 (= e!596073 (not true))))

(assert (=> b!1050379 (= (select (store (arr!31806 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463798) k0!2747)))

(assert (= (and start!92392 res!699586) b!1050377))

(assert (= (and b!1050377 res!699584) b!1050376))

(assert (= (and b!1050376 res!699587) b!1050378))

(assert (= (and b!1050378 res!699588) b!1050374))

(assert (= (and b!1050374 res!699589) b!1050375))

(assert (= (and b!1050375 res!699585) b!1050379))

(declare-fun m!970597 () Bool)

(assert (=> b!1050375 m!970597))

(declare-fun m!970599 () Bool)

(assert (=> b!1050377 m!970599))

(declare-fun m!970601 () Bool)

(assert (=> b!1050378 m!970601))

(declare-fun m!970603 () Bool)

(assert (=> b!1050374 m!970603))

(declare-fun m!970605 () Bool)

(assert (=> b!1050374 m!970605))

(declare-fun m!970607 () Bool)

(assert (=> b!1050376 m!970607))

(assert (=> b!1050379 m!970605))

(declare-fun m!970609 () Bool)

(assert (=> b!1050379 m!970609))

(declare-fun m!970611 () Bool)

(assert (=> start!92392 m!970611))

(check-sat (not b!1050374) (not b!1050376) (not b!1050377) (not start!92392) (not b!1050375))
(check-sat)
