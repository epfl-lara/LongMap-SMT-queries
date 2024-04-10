; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117010 () Bool)

(assert start!117010)

(declare-fun res!920538 () Bool)

(declare-fun e!780564 () Bool)

(assert (=> start!117010 (=> (not res!920538) (not e!780564))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93652 0))(
  ( (array!93653 (arr!45228 (Array (_ BitVec 32) (_ BitVec 64))) (size!45778 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93652)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117010 (= res!920538 (and (bvslt (size!45778 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45778 a!4197))))))

(assert (=> start!117010 e!780564))

(declare-fun array_inv!34256 (array!93652) Bool)

(assert (=> start!117010 (array_inv!34256 a!4197)))

(assert (=> start!117010 true))

(declare-fun b!1377912 () Bool)

(declare-fun res!920539 () Bool)

(assert (=> b!1377912 (=> (not res!920539) (not e!780564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377912 (= res!920539 (validKeyInArray!0 (select (arr!45228 a!4197) to!360)))))

(declare-fun b!1377913 () Bool)

(assert (=> b!1377913 (= e!780564 (or (bvslt (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsgt to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(assert (= (and start!117010 res!920538) b!1377912))

(assert (= (and b!1377912 res!920539) b!1377913))

(declare-fun m!1262369 () Bool)

(assert (=> start!117010 m!1262369))

(declare-fun m!1262371 () Bool)

(assert (=> b!1377912 m!1262371))

(assert (=> b!1377912 m!1262371))

(declare-fun m!1262373 () Bool)

(assert (=> b!1377912 m!1262373))

(check-sat (not b!1377912) (not start!117010))
(check-sat)
