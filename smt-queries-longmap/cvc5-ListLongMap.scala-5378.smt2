; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71850 () Bool)

(assert start!71850)

(declare-fun res!567960 () Bool)

(declare-fun e!465806 () Bool)

(assert (=> start!71850 (=> (not res!567960) (not e!465806))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46749 0))(
  ( (array!46750 (arr!22409 (Array (_ BitVec 32) (_ BitVec 64))) (size!22830 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46749)

(assert (=> start!71850 (= res!567960 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22830 a!4227))))))

(assert (=> start!71850 e!465806))

(assert (=> start!71850 true))

(declare-fun array_inv!17921 (array!46749) Bool)

(assert (=> start!71850 (array_inv!17921 a!4227)))

(declare-fun b!834950 () Bool)

(declare-fun res!567957 () Bool)

(assert (=> b!834950 (=> (not res!567957) (not e!465806))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834950 (= res!567957 (= (arrayCountValidKeys!0 (array!46750 (store (arr!22409 a!4227) i!1466 k!2968) (size!22830 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!834951 () Bool)

(assert (=> b!834951 (= e!465806 (and (not (= to!390 (size!22830 a!4227))) (bvsge to!390 (size!22830 a!4227))))))

(declare-fun b!834952 () Bool)

(declare-fun res!567959 () Bool)

(assert (=> b!834952 (=> (not res!567959) (not e!465806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834952 (= res!567959 (not (validKeyInArray!0 (select (arr!22409 a!4227) i!1466))))))

(declare-fun b!834953 () Bool)

(declare-fun res!567958 () Bool)

(assert (=> b!834953 (=> (not res!567958) (not e!465806))))

(assert (=> b!834953 (= res!567958 (validKeyInArray!0 k!2968))))

(declare-fun b!834954 () Bool)

(declare-fun res!567961 () Bool)

(assert (=> b!834954 (=> (not res!567961) (not e!465806))))

(assert (=> b!834954 (= res!567961 (and (bvslt (size!22830 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22830 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71850 res!567960) b!834952))

(assert (= (and b!834952 res!567959) b!834953))

(assert (= (and b!834953 res!567958) b!834954))

(assert (= (and b!834954 res!567961) b!834950))

(assert (= (and b!834950 res!567957) b!834951))

(declare-fun m!779603 () Bool)

(assert (=> start!71850 m!779603))

(declare-fun m!779605 () Bool)

(assert (=> b!834950 m!779605))

(declare-fun m!779607 () Bool)

(assert (=> b!834950 m!779607))

(declare-fun m!779609 () Bool)

(assert (=> b!834950 m!779609))

(declare-fun m!779611 () Bool)

(assert (=> b!834952 m!779611))

(assert (=> b!834952 m!779611))

(declare-fun m!779613 () Bool)

(assert (=> b!834952 m!779613))

(declare-fun m!779615 () Bool)

(assert (=> b!834953 m!779615))

(push 1)

(assert (not b!834952))

(assert (not b!834950))

(assert (not start!71850))

(assert (not b!834953))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

