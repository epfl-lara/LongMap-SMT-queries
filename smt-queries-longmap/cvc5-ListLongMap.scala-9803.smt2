; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116462 () Bool)

(assert start!116462)

(declare-fun b!1373944 () Bool)

(declare-fun e!778352 () Bool)

(assert (=> b!1373944 (= e!778352 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lt!603009 () (_ BitVec 32))

(declare-datatypes ((array!93121 0))(
  ( (array!93122 (arr!44967 (Array (_ BitVec 32) (_ BitVec 64))) (size!45519 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93121)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93121 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373944 (= lt!603009 (arrayCountValidKeys!0 (array!93122 (store (arr!44967 a!4142) i!1457 k!2959) (size!45519 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603008 () (_ BitVec 32))

(assert (=> b!1373944 (= lt!603008 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917169 () Bool)

(assert (=> start!116462 (=> (not res!917169) (not e!778352))))

(assert (=> start!116462 (= res!917169 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45519 a!4142))))))

(assert (=> start!116462 e!778352))

(assert (=> start!116462 true))

(declare-fun array_inv!34200 (array!93121) Bool)

(assert (=> start!116462 (array_inv!34200 a!4142)))

(declare-fun b!1373941 () Bool)

(declare-fun res!917171 () Bool)

(assert (=> b!1373941 (=> (not res!917171) (not e!778352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373941 (= res!917171 (validKeyInArray!0 (select (arr!44967 a!4142) i!1457)))))

(declare-fun b!1373943 () Bool)

(declare-fun res!917170 () Bool)

(assert (=> b!1373943 (=> (not res!917170) (not e!778352))))

(assert (=> b!1373943 (= res!917170 (and (bvslt (size!45519 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45519 a!4142))))))

(declare-fun b!1373942 () Bool)

(declare-fun res!917168 () Bool)

(assert (=> b!1373942 (=> (not res!917168) (not e!778352))))

(assert (=> b!1373942 (= res!917168 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116462 res!917169) b!1373941))

(assert (= (and b!1373941 res!917171) b!1373942))

(assert (= (and b!1373942 res!917168) b!1373943))

(assert (= (and b!1373943 res!917170) b!1373944))

(declare-fun m!1256689 () Bool)

(assert (=> b!1373944 m!1256689))

(declare-fun m!1256691 () Bool)

(assert (=> b!1373944 m!1256691))

(declare-fun m!1256693 () Bool)

(assert (=> b!1373944 m!1256693))

(declare-fun m!1256695 () Bool)

(assert (=> start!116462 m!1256695))

(declare-fun m!1256697 () Bool)

(assert (=> b!1373941 m!1256697))

(assert (=> b!1373941 m!1256697))

(declare-fun m!1256699 () Bool)

(assert (=> b!1373941 m!1256699))

(declare-fun m!1256701 () Bool)

(assert (=> b!1373942 m!1256701))

(push 1)

(assert (not start!116462))

(assert (not b!1373944))

(assert (not b!1373941))

(assert (not b!1373942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

