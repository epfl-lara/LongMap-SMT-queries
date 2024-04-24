; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71928 () Bool)

(assert start!71928)

(declare-fun b!835013 () Bool)

(declare-fun res!567492 () Bool)

(declare-fun e!465949 () Bool)

(assert (=> b!835013 (=> (not res!567492) (not e!465949))))

(declare-datatypes ((array!46675 0))(
  ( (array!46676 (arr!22367 (Array (_ BitVec 32) (_ BitVec 64))) (size!22787 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46675)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835013 (= res!567492 (and (bvslt (size!22787 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22787 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835012 () Bool)

(declare-fun res!567493 () Bool)

(assert (=> b!835012 (=> (not res!567493) (not e!465949))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835012 (= res!567493 (validKeyInArray!0 k!2968))))

(declare-fun b!835011 () Bool)

(declare-fun res!567494 () Bool)

(assert (=> b!835011 (=> (not res!567494) (not e!465949))))

(assert (=> b!835011 (= res!567494 (not (validKeyInArray!0 (select (arr!22367 a!4227) i!1466))))))

(declare-fun b!835014 () Bool)

(assert (=> b!835014 (= e!465949 false)))

(declare-fun lt!379136 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46675 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835014 (= lt!379136 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379135 () (_ BitVec 32))

(assert (=> b!835014 (= lt!379135 (arrayCountValidKeys!0 (array!46676 (store (arr!22367 a!4227) i!1466 k!2968) (size!22787 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!567495 () Bool)

(assert (=> start!71928 (=> (not res!567495) (not e!465949))))

(assert (=> start!71928 (= res!567495 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22787 a!4227))))))

(assert (=> start!71928 e!465949))

(assert (=> start!71928 true))

(declare-fun array_inv!17853 (array!46675) Bool)

(assert (=> start!71928 (array_inv!17853 a!4227)))

(assert (= (and start!71928 res!567495) b!835011))

(assert (= (and b!835011 res!567494) b!835012))

(assert (= (and b!835012 res!567493) b!835013))

(assert (= (and b!835013 res!567492) b!835014))

(declare-fun m!780325 () Bool)

(assert (=> b!835012 m!780325))

(declare-fun m!780327 () Bool)

(assert (=> b!835011 m!780327))

(assert (=> b!835011 m!780327))

(declare-fun m!780329 () Bool)

(assert (=> b!835011 m!780329))

(declare-fun m!780331 () Bool)

(assert (=> b!835014 m!780331))

(declare-fun m!780333 () Bool)

(assert (=> b!835014 m!780333))

(declare-fun m!780335 () Bool)

(assert (=> b!835014 m!780335))

(declare-fun m!780337 () Bool)

(assert (=> start!71928 m!780337))

(push 1)

(assert (not b!835011))

(assert (not b!835012))

(assert (not b!835014))

(assert (not start!71928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

