; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116708 () Bool)

(assert start!116708)

(declare-fun b!1375384 () Bool)

(declare-fun res!917788 () Bool)

(declare-fun e!779266 () Bool)

(assert (=> b!1375384 (=> (not res!917788) (not e!779266))))

(declare-datatypes ((array!93299 0))(
  ( (array!93300 (arr!45051 (Array (_ BitVec 32) (_ BitVec 64))) (size!45602 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93299)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375384 (= res!917788 (validKeyInArray!0 (select (arr!45051 a!4142) i!1457)))))

(declare-fun b!1375387 () Bool)

(assert (=> b!1375387 (= e!779266 false)))

(declare-fun lt!603707 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375387 (= lt!603707 (arrayCountValidKeys!0 (array!93300 (store (arr!45051 a!4142) i!1457 k!2959) (size!45602 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603708 () (_ BitVec 32))

(assert (=> b!1375387 (= lt!603708 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375385 () Bool)

(declare-fun res!917787 () Bool)

(assert (=> b!1375385 (=> (not res!917787) (not e!779266))))

(assert (=> b!1375385 (= res!917787 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375386 () Bool)

(declare-fun res!917790 () Bool)

(assert (=> b!1375386 (=> (not res!917790) (not e!779266))))

(assert (=> b!1375386 (= res!917790 (and (bvslt (size!45602 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45602 a!4142))))))

(declare-fun res!917789 () Bool)

(assert (=> start!116708 (=> (not res!917789) (not e!779266))))

(assert (=> start!116708 (= res!917789 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45602 a!4142))))))

(assert (=> start!116708 e!779266))

(assert (=> start!116708 true))

(declare-fun array_inv!34332 (array!93299) Bool)

(assert (=> start!116708 (array_inv!34332 a!4142)))

(assert (= (and start!116708 res!917789) b!1375384))

(assert (= (and b!1375384 res!917788) b!1375385))

(assert (= (and b!1375385 res!917787) b!1375386))

(assert (= (and b!1375386 res!917790) b!1375387))

(declare-fun m!1258895 () Bool)

(assert (=> b!1375384 m!1258895))

(assert (=> b!1375384 m!1258895))

(declare-fun m!1258897 () Bool)

(assert (=> b!1375384 m!1258897))

(declare-fun m!1258899 () Bool)

(assert (=> b!1375387 m!1258899))

(declare-fun m!1258901 () Bool)

(assert (=> b!1375387 m!1258901))

(declare-fun m!1258903 () Bool)

(assert (=> b!1375387 m!1258903))

(declare-fun m!1258905 () Bool)

(assert (=> b!1375385 m!1258905))

(declare-fun m!1258907 () Bool)

(assert (=> start!116708 m!1258907))

(push 1)

(assert (not b!1375384))

(assert (not start!116708))

(assert (not b!1375387))

(assert (not b!1375385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

