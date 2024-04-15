; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116450 () Bool)

(assert start!116450)

(declare-fun b!1373871 () Bool)

(declare-fun res!917097 () Bool)

(declare-fun e!778316 () Bool)

(assert (=> b!1373871 (=> (not res!917097) (not e!778316))))

(declare-datatypes ((array!93109 0))(
  ( (array!93110 (arr!44961 (Array (_ BitVec 32) (_ BitVec 64))) (size!45513 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93109)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1373871 (= res!917097 (and (bvslt (size!45513 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45513 a!4142))))))

(declare-fun b!1373869 () Bool)

(declare-fun res!917099 () Bool)

(assert (=> b!1373869 (=> (not res!917099) (not e!778316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373869 (= res!917099 (validKeyInArray!0 (select (arr!44961 a!4142) i!1457)))))

(declare-fun b!1373872 () Bool)

(assert (=> b!1373872 (= e!778316 false)))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lt!602972 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93109 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373872 (= lt!602972 (arrayCountValidKeys!0 (array!93110 (store (arr!44961 a!4142) i!1457 k!2959) (size!45513 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!602973 () (_ BitVec 32))

(assert (=> b!1373872 (= lt!602973 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373870 () Bool)

(declare-fun res!917096 () Bool)

(assert (=> b!1373870 (=> (not res!917096) (not e!778316))))

(assert (=> b!1373870 (= res!917096 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917098 () Bool)

(assert (=> start!116450 (=> (not res!917098) (not e!778316))))

(assert (=> start!116450 (= res!917098 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45513 a!4142))))))

(assert (=> start!116450 e!778316))

(assert (=> start!116450 true))

(declare-fun array_inv!34194 (array!93109) Bool)

(assert (=> start!116450 (array_inv!34194 a!4142)))

(assert (= (and start!116450 res!917098) b!1373869))

(assert (= (and b!1373869 res!917099) b!1373870))

(assert (= (and b!1373870 res!917096) b!1373871))

(assert (= (and b!1373871 res!917097) b!1373872))

(declare-fun m!1256605 () Bool)

(assert (=> b!1373869 m!1256605))

(assert (=> b!1373869 m!1256605))

(declare-fun m!1256607 () Bool)

(assert (=> b!1373869 m!1256607))

(declare-fun m!1256609 () Bool)

(assert (=> b!1373872 m!1256609))

(declare-fun m!1256611 () Bool)

(assert (=> b!1373872 m!1256611))

(declare-fun m!1256613 () Bool)

(assert (=> b!1373872 m!1256613))

(declare-fun m!1256615 () Bool)

(assert (=> b!1373870 m!1256615))

(declare-fun m!1256617 () Bool)

(assert (=> start!116450 m!1256617))

(push 1)

(assert (not b!1373872))

(assert (not b!1373870))

(assert (not b!1373869))

(assert (not start!116450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

