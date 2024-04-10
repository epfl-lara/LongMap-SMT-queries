; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93468 () Bool)

(assert start!93468)

(declare-fun res!707270 () Bool)

(declare-fun e!602337 () Bool)

(assert (=> start!93468 (=> (not res!707270) (not e!602337))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66771 0))(
  ( (array!66772 (arr!32104 (Array (_ BitVec 32) (_ BitVec 64))) (size!32640 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66771)

(assert (=> start!93468 (= res!707270 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32640 a!3488)) (bvslt (size!32640 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93468 e!602337))

(assert (=> start!93468 true))

(declare-fun array_inv!24884 (array!66771) Bool)

(assert (=> start!93468 (array_inv!24884 a!3488)))

(declare-fun b!1058696 () Bool)

(assert (=> b!1058696 (= e!602337 false)))

(declare-fun lt!467025 () Bool)

(declare-datatypes ((List!22416 0))(
  ( (Nil!22413) (Cons!22412 (h!23621 (_ BitVec 64)) (t!31723 List!22416)) )
))
(declare-fun arrayNoDuplicates!0 (array!66771 (_ BitVec 32) List!22416) Bool)

(assert (=> b!1058696 (= lt!467025 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22413))))

(assert (= (and start!93468 res!707270) b!1058696))

(declare-fun m!978353 () Bool)

(assert (=> start!93468 m!978353))

(declare-fun m!978355 () Bool)

(assert (=> b!1058696 m!978355))

(push 1)

(assert (not b!1058696))

(assert (not start!93468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

