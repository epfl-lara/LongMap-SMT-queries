; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71940 () Bool)

(assert start!71940)

(declare-fun b!835914 () Bool)

(declare-fun res!568777 () Bool)

(declare-fun e!466310 () Bool)

(assert (=> b!835914 (=> (not res!568777) (not e!466310))))

(declare-datatypes ((array!46839 0))(
  ( (array!46840 (arr!22454 (Array (_ BitVec 32) (_ BitVec 64))) (size!22875 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46839)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835914 (= res!568777 (not (validKeyInArray!0 (select (arr!22454 a!4227) i!1466))))))

(declare-fun b!835915 () Bool)

(declare-fun res!568779 () Bool)

(assert (=> b!835915 (=> (not res!568779) (not e!466310))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835915 (= res!568779 (validKeyInArray!0 k!2968))))

(declare-fun res!568780 () Bool)

(assert (=> start!71940 (=> (not res!568780) (not e!466310))))

(assert (=> start!71940 (= res!568780 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22875 a!4227))))))

(assert (=> start!71940 e!466310))

(assert (=> start!71940 true))

(declare-fun array_inv!17966 (array!46839) Bool)

(assert (=> start!71940 (array_inv!17966 a!4227)))

(declare-fun b!835917 () Bool)

(assert (=> b!835917 (= e!466310 false)))

(declare-fun lt!380141 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46839 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835917 (= lt!380141 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380140 () (_ BitVec 32))

(assert (=> b!835917 (= lt!380140 (arrayCountValidKeys!0 (array!46840 (store (arr!22454 a!4227) i!1466 k!2968) (size!22875 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835916 () Bool)

(declare-fun res!568778 () Bool)

(assert (=> b!835916 (=> (not res!568778) (not e!466310))))

(assert (=> b!835916 (= res!568778 (and (bvslt (size!22875 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22875 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71940 res!568780) b!835914))

(assert (= (and b!835914 res!568777) b!835915))

(assert (= (and b!835915 res!568779) b!835916))

(assert (= (and b!835916 res!568778) b!835917))

(declare-fun m!780801 () Bool)

(assert (=> b!835914 m!780801))

(assert (=> b!835914 m!780801))

(declare-fun m!780803 () Bool)

(assert (=> b!835914 m!780803))

(declare-fun m!780805 () Bool)

(assert (=> b!835915 m!780805))

(declare-fun m!780807 () Bool)

(assert (=> start!71940 m!780807))

(declare-fun m!780809 () Bool)

(assert (=> b!835917 m!780809))

(declare-fun m!780811 () Bool)

(assert (=> b!835917 m!780811))

(declare-fun m!780813 () Bool)

(assert (=> b!835917 m!780813))

(push 1)

(assert (not b!835914))

(assert (not b!835915))

(assert (not b!835917))

(assert (not start!71940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

