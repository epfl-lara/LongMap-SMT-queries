; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117238 () Bool)

(assert start!117238)

(declare-fun res!921053 () Bool)

(declare-fun e!781406 () Bool)

(assert (=> start!117238 (=> (not res!921053) (not e!781406))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93766 0))(
  ( (array!93767 (arr!45280 (Array (_ BitVec 32) (_ BitVec 64))) (size!45831 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93766)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117238 (= res!921053 (and (bvslt (size!45831 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45831 a!4197))))))

(assert (=> start!117238 e!781406))

(declare-fun array_inv!34561 (array!93766) Bool)

(assert (=> start!117238 (array_inv!34561 a!4197)))

(assert (=> start!117238 true))

(declare-fun b!1379212 () Bool)

(declare-fun res!921054 () Bool)

(assert (=> b!1379212 (=> (not res!921054) (not e!781406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379212 (= res!921054 (validKeyInArray!0 (select (arr!45280 a!4197) to!360)))))

(declare-fun b!1379213 () Bool)

(assert (=> b!1379213 (= e!781406 (or (bvslt (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsgt to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(assert (= (and start!117238 res!921053) b!1379212))

(assert (= (and b!1379212 res!921054) b!1379213))

(declare-fun m!1263991 () Bool)

(assert (=> start!117238 m!1263991))

(declare-fun m!1263993 () Bool)

(assert (=> b!1379212 m!1263993))

(assert (=> b!1379212 m!1263993))

(declare-fun m!1263995 () Bool)

(assert (=> b!1379212 m!1263995))

(check-sat (not start!117238) (not b!1379212))
(check-sat)
