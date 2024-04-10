; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93514 () Bool)

(assert start!93514)

(declare-fun res!707377 () Bool)

(declare-fun e!602451 () Bool)

(assert (=> start!93514 (=> (not res!707377) (not e!602451))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66804 0))(
  ( (array!66805 (arr!32118 (Array (_ BitVec 32) (_ BitVec 64))) (size!32654 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66804)

(assert (=> start!93514 (= res!707377 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32654 a!3475)) (bvslt (size!32654 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93514 e!602451))

(assert (=> start!93514 true))

(declare-fun array_inv!24898 (array!66804) Bool)

(assert (=> start!93514 (array_inv!24898 a!3475)))

(declare-fun b!1058803 () Bool)

(declare-fun res!707378 () Bool)

(assert (=> b!1058803 (=> (not res!707378) (not e!602451))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058803 (= res!707378 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058804 () Bool)

(assert (=> b!1058804 (= e!602451 (bvslt (bvsub (size!32654 a!3475) from!2850) #b00000000000000000000000000000000))))

(assert (= (and start!93514 res!707377) b!1058803))

(assert (= (and b!1058803 res!707378) b!1058804))

(declare-fun m!978443 () Bool)

(assert (=> start!93514 m!978443))

(declare-fun m!978445 () Bool)

(assert (=> b!1058803 m!978445))

(push 1)

(assert (not start!93514))

(assert (not b!1058803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

