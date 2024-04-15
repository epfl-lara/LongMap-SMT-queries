; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117002 () Bool)

(assert start!117002)

(declare-fun res!920506 () Bool)

(declare-fun e!780525 () Bool)

(assert (=> start!117002 (=> (not res!920506) (not e!780525))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93600 0))(
  ( (array!93601 (arr!45202 (Array (_ BitVec 32) (_ BitVec 64))) (size!45754 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93600)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117002 (= res!920506 (and (bvslt (size!45754 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45754 a!4197))))))

(assert (=> start!117002 e!780525))

(declare-fun array_inv!34435 (array!93600) Bool)

(assert (=> start!117002 (array_inv!34435 a!4197)))

(assert (=> start!117002 true))

(declare-fun b!1377833 () Bool)

(declare-fun res!920507 () Bool)

(assert (=> b!1377833 (=> (not res!920507) (not e!780525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377833 (= res!920507 (validKeyInArray!0 (select (arr!45202 a!4197) to!360)))))

(declare-fun b!1377834 () Bool)

(assert (=> b!1377834 (= e!780525 (or (bvslt (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsgt to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(assert (= (and start!117002 res!920506) b!1377833))

(assert (= (and b!1377833 res!920507) b!1377834))

(declare-fun m!1261851 () Bool)

(assert (=> start!117002 m!1261851))

(declare-fun m!1261853 () Bool)

(assert (=> b!1377833 m!1261853))

(assert (=> b!1377833 m!1261853))

(declare-fun m!1261855 () Bool)

(assert (=> b!1377833 m!1261855))

(check-sat (not b!1377833) (not start!117002))
(check-sat)
