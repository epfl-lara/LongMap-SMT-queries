; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116702 () Bool)

(assert start!116702)

(declare-fun res!917752 () Bool)

(declare-fun e!779248 () Bool)

(assert (=> start!116702 (=> (not res!917752) (not e!779248))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93293 0))(
  ( (array!93294 (arr!45048 (Array (_ BitVec 32) (_ BitVec 64))) (size!45599 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93293)

(assert (=> start!116702 (= res!917752 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45599 a!4142))))))

(assert (=> start!116702 e!779248))

(assert (=> start!116702 true))

(declare-fun array_inv!34329 (array!93293) Bool)

(assert (=> start!116702 (array_inv!34329 a!4142)))

(declare-fun b!1375348 () Bool)

(declare-fun res!917754 () Bool)

(assert (=> b!1375348 (=> (not res!917754) (not e!779248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375348 (= res!917754 (validKeyInArray!0 (select (arr!45048 a!4142) i!1457)))))

(declare-fun b!1375349 () Bool)

(declare-fun res!917751 () Bool)

(assert (=> b!1375349 (=> (not res!917751) (not e!779248))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375349 (= res!917751 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375351 () Bool)

(assert (=> b!1375351 (= e!779248 false)))

(declare-fun lt!603690 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93293 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375351 (= lt!603690 (arrayCountValidKeys!0 (array!93294 (store (arr!45048 a!4142) i!1457 k!2959) (size!45599 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603689 () (_ BitVec 32))

(assert (=> b!1375351 (= lt!603689 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375350 () Bool)

(declare-fun res!917753 () Bool)

(assert (=> b!1375350 (=> (not res!917753) (not e!779248))))

(assert (=> b!1375350 (= res!917753 (and (bvslt (size!45599 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45599 a!4142))))))

(assert (= (and start!116702 res!917752) b!1375348))

(assert (= (and b!1375348 res!917754) b!1375349))

(assert (= (and b!1375349 res!917751) b!1375350))

(assert (= (and b!1375350 res!917753) b!1375351))

(declare-fun m!1258853 () Bool)

(assert (=> start!116702 m!1258853))

(declare-fun m!1258855 () Bool)

(assert (=> b!1375348 m!1258855))

(assert (=> b!1375348 m!1258855))

(declare-fun m!1258857 () Bool)

(assert (=> b!1375348 m!1258857))

(declare-fun m!1258859 () Bool)

(assert (=> b!1375349 m!1258859))

(declare-fun m!1258861 () Bool)

(assert (=> b!1375351 m!1258861))

(declare-fun m!1258863 () Bool)

(assert (=> b!1375351 m!1258863))

(declare-fun m!1258865 () Bool)

(assert (=> b!1375351 m!1258865))

(push 1)

(assert (not b!1375349))

(assert (not b!1375348))

(assert (not start!116702))

(assert (not b!1375351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

