; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116696 () Bool)

(assert start!116696)

(declare-fun b!1375312 () Bool)

(declare-fun res!917717 () Bool)

(declare-fun e!779230 () Bool)

(assert (=> b!1375312 (=> (not res!917717) (not e!779230))))

(declare-datatypes ((array!93287 0))(
  ( (array!93288 (arr!45045 (Array (_ BitVec 32) (_ BitVec 64))) (size!45596 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93287)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375312 (= res!917717 (validKeyInArray!0 (select (arr!45045 a!4142) i!1457)))))

(declare-fun res!917718 () Bool)

(assert (=> start!116696 (=> (not res!917718) (not e!779230))))

(assert (=> start!116696 (= res!917718 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45596 a!4142))))))

(assert (=> start!116696 e!779230))

(assert (=> start!116696 true))

(declare-fun array_inv!34326 (array!93287) Bool)

(assert (=> start!116696 (array_inv!34326 a!4142)))

(declare-fun b!1375314 () Bool)

(declare-fun res!917716 () Bool)

(assert (=> b!1375314 (=> (not res!917716) (not e!779230))))

(assert (=> b!1375314 (= res!917716 (and (bvslt (size!45596 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45596 a!4142))))))

(declare-fun b!1375313 () Bool)

(declare-fun res!917715 () Bool)

(assert (=> b!1375313 (=> (not res!917715) (not e!779230))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375313 (= res!917715 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375315 () Bool)

(assert (=> b!1375315 (= e!779230 false)))

(declare-fun lt!603672 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93287 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375315 (= lt!603672 (arrayCountValidKeys!0 (array!93288 (store (arr!45045 a!4142) i!1457 k!2959) (size!45596 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603671 () (_ BitVec 32))

(assert (=> b!1375315 (= lt!603671 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116696 res!917718) b!1375312))

(assert (= (and b!1375312 res!917717) b!1375313))

(assert (= (and b!1375313 res!917715) b!1375314))

(assert (= (and b!1375314 res!917716) b!1375315))

(declare-fun m!1258811 () Bool)

(assert (=> b!1375312 m!1258811))

(assert (=> b!1375312 m!1258811))

(declare-fun m!1258813 () Bool)

(assert (=> b!1375312 m!1258813))

(declare-fun m!1258815 () Bool)

(assert (=> start!116696 m!1258815))

(declare-fun m!1258817 () Bool)

(assert (=> b!1375313 m!1258817))

(declare-fun m!1258819 () Bool)

(assert (=> b!1375315 m!1258819))

(declare-fun m!1258821 () Bool)

(assert (=> b!1375315 m!1258821))

(declare-fun m!1258823 () Bool)

(assert (=> b!1375315 m!1258823))

(push 1)

(assert (not b!1375315))

(assert (not b!1375312))

(assert (not b!1375313))

(assert (not start!116696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

