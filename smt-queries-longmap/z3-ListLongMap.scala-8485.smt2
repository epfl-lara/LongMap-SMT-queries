; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103430 () Bool)

(assert start!103430)

(declare-fun res!827529 () Bool)

(declare-fun e!702932 () Bool)

(assert (=> start!103430 (=> (not res!827529) (not e!702932))))

(declare-datatypes ((array!79912 0))(
  ( (array!79913 (arr!38553 (Array (_ BitVec 32) (_ BitVec 64))) (size!39089 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79912)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103430 (= res!827529 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39089 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39089 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103430 e!702932))

(assert (=> start!103430 true))

(declare-fun array_inv!29401 (array!79912) Bool)

(assert (=> start!103430 (array_inv!29401 a!3575)))

(declare-fun b!1240243 () Bool)

(declare-fun res!827530 () Bool)

(assert (=> b!1240243 (=> (not res!827530) (not e!702932))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240243 (= res!827530 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240244 () Bool)

(assert (=> b!1240244 (= e!702932 (and (bvsle from!2953 newFrom!281) (bvsge newFrom!281 (size!39089 a!3575))))))

(assert (= (and start!103430 res!827529) b!1240243))

(assert (= (and b!1240243 res!827530) b!1240244))

(declare-fun m!1143593 () Bool)

(assert (=> start!103430 m!1143593))

(declare-fun m!1143595 () Bool)

(assert (=> b!1240243 m!1143595))

(check-sat (not start!103430) (not b!1240243))
(check-sat)
