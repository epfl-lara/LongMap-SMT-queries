; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92204 () Bool)

(assert start!92204)

(declare-fun res!697303 () Bool)

(declare-fun e!594407 () Bool)

(assert (=> start!92204 (=> (not res!697303) (not e!594407))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65973 0))(
  ( (array!65974 (arr!31727 (Array (_ BitVec 32) (_ BitVec 64))) (size!32265 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65973)

(assert (=> start!92204 (= res!697303 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32265 a!3488)) (bvslt (size!32265 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92204 e!594407))

(assert (=> start!92204 true))

(declare-fun array_inv!24510 (array!65973) Bool)

(assert (=> start!92204 (array_inv!24510 a!3488)))

(declare-fun b!1048057 () Bool)

(assert (=> b!1048057 (= e!594407 false)))

(declare-fun lt!462937 () Bool)

(declare-datatypes ((List!22098 0))(
  ( (Nil!22095) (Cons!22094 (h!23303 (_ BitVec 64)) (t!31396 List!22098)) )
))
(declare-fun arrayNoDuplicates!0 (array!65973 (_ BitVec 32) List!22098) Bool)

(assert (=> b!1048057 (= lt!462937 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22095))))

(assert (= (and start!92204 res!697303) b!1048057))

(declare-fun m!968619 () Bool)

(assert (=> start!92204 m!968619))

(declare-fun m!968621 () Bool)

(assert (=> b!1048057 m!968621))

(push 1)

(assert (not start!92204))

(assert (not b!1048057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

