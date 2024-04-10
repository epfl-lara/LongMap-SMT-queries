; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93478 () Bool)

(assert start!93478)

(declare-fun res!707285 () Bool)

(declare-fun e!602367 () Bool)

(assert (=> start!93478 (=> (not res!707285) (not e!602367))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66781 0))(
  ( (array!66782 (arr!32109 (Array (_ BitVec 32) (_ BitVec 64))) (size!32645 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66781)

(assert (=> start!93478 (= res!707285 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32645 a!3488)) (bvslt (size!32645 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93478 e!602367))

(assert (=> start!93478 true))

(declare-fun array_inv!24889 (array!66781) Bool)

(assert (=> start!93478 (array_inv!24889 a!3488)))

(declare-fun b!1058711 () Bool)

(assert (=> b!1058711 (= e!602367 false)))

(declare-fun lt!467040 () Bool)

(declare-datatypes ((List!22421 0))(
  ( (Nil!22418) (Cons!22417 (h!23626 (_ BitVec 64)) (t!31728 List!22421)) )
))
(declare-fun arrayNoDuplicates!0 (array!66781 (_ BitVec 32) List!22421) Bool)

(assert (=> b!1058711 (= lt!467040 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22418))))

(assert (= (and start!93478 res!707285) b!1058711))

(declare-fun m!978373 () Bool)

(assert (=> start!93478 m!978373))

(declare-fun m!978375 () Bool)

(assert (=> b!1058711 m!978375))

(push 1)

(assert (not b!1058711))

(assert (not start!93478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

