; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71840 () Bool)

(assert start!71840)

(declare-fun e!465864 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun b!834985 () Bool)

(declare-datatypes ((array!46750 0))(
  ( (array!46751 (arr!22409 (Array (_ BitVec 32) (_ BitVec 64))) (size!22830 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46750)

(assert (=> b!834985 (= e!465864 (and (= to!390 (size!22830 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!834986 () Bool)

(declare-fun res!567859 () Bool)

(assert (=> b!834986 (=> (not res!567859) (not e!465864))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834986 (= res!567859 (validKeyInArray!0 k!2968))))

(declare-fun res!567856 () Bool)

(assert (=> start!71840 (=> (not res!567856) (not e!465864))))

(assert (=> start!71840 (= res!567856 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22830 a!4227))))))

(assert (=> start!71840 e!465864))

(assert (=> start!71840 true))

(declare-fun array_inv!17856 (array!46750) Bool)

(assert (=> start!71840 (array_inv!17856 a!4227)))

(declare-fun b!834987 () Bool)

(declare-fun res!567858 () Bool)

(assert (=> b!834987 (=> (not res!567858) (not e!465864))))

(assert (=> b!834987 (= res!567858 (and (bvslt (size!22830 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22830 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834988 () Bool)

(declare-fun res!567860 () Bool)

(assert (=> b!834988 (=> (not res!567860) (not e!465864))))

(declare-fun arrayCountValidKeys!0 (array!46750 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834988 (= res!567860 (= (arrayCountValidKeys!0 (array!46751 (store (arr!22409 a!4227) i!1466 k!2968) (size!22830 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!834989 () Bool)

(declare-fun res!567857 () Bool)

(assert (=> b!834989 (=> (not res!567857) (not e!465864))))

(assert (=> b!834989 (= res!567857 (not (validKeyInArray!0 (select (arr!22409 a!4227) i!1466))))))

(assert (= (and start!71840 res!567856) b!834989))

(assert (= (and b!834989 res!567857) b!834986))

(assert (= (and b!834986 res!567859) b!834987))

(assert (= (and b!834987 res!567858) b!834988))

(assert (= (and b!834988 res!567860) b!834985))

(declare-fun m!780145 () Bool)

(assert (=> b!834986 m!780145))

(declare-fun m!780147 () Bool)

(assert (=> start!71840 m!780147))

(declare-fun m!780149 () Bool)

(assert (=> b!834988 m!780149))

(declare-fun m!780151 () Bool)

(assert (=> b!834988 m!780151))

(declare-fun m!780153 () Bool)

(assert (=> b!834988 m!780153))

(declare-fun m!780155 () Bool)

(assert (=> b!834989 m!780155))

(assert (=> b!834989 m!780155))

(declare-fun m!780157 () Bool)

(assert (=> b!834989 m!780157))

(push 1)

(assert (not b!834986))

(assert (not start!71840))

(assert (not b!834989))

(assert (not b!834988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

