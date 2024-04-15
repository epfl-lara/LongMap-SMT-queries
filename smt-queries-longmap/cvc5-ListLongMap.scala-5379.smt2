; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71856 () Bool)

(assert start!71856)

(declare-fun res!568024 () Bool)

(declare-fun e!465823 () Bool)

(assert (=> start!71856 (=> (not res!568024) (not e!465823))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46755 0))(
  ( (array!46756 (arr!22412 (Array (_ BitVec 32) (_ BitVec 64))) (size!22833 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46755)

(assert (=> start!71856 (= res!568024 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22833 a!4227))))))

(assert (=> start!71856 e!465823))

(assert (=> start!71856 true))

(declare-fun array_inv!17924 (array!46755) Bool)

(assert (=> start!71856 (array_inv!17924 a!4227)))

(declare-fun b!835011 () Bool)

(declare-fun res!568022 () Bool)

(assert (=> b!835011 (=> (not res!568022) (not e!465823))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835011 (= res!568022 (validKeyInArray!0 k!2968))))

(declare-fun b!835012 () Bool)

(declare-fun res!568021 () Bool)

(assert (=> b!835012 (=> (not res!568021) (not e!465823))))

(assert (=> b!835012 (= res!568021 (not (validKeyInArray!0 (select (arr!22412 a!4227) i!1466))))))

(declare-fun b!835013 () Bool)

(declare-fun res!568018 () Bool)

(assert (=> b!835013 (=> (not res!568018) (not e!465823))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835013 (= res!568018 (and (bvslt (size!22833 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22833 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835014 () Bool)

(declare-fun res!568019 () Bool)

(assert (=> b!835014 (=> (not res!568019) (not e!465823))))

(assert (=> b!835014 (= res!568019 (not (= to!390 (size!22833 a!4227))))))

(declare-fun b!835015 () Bool)

(assert (=> b!835015 (= e!465823 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22833 a!4227))))))

(declare-fun b!835016 () Bool)

(declare-fun res!568020 () Bool)

(assert (=> b!835016 (=> (not res!568020) (not e!465823))))

(assert (=> b!835016 (= res!568020 (validKeyInArray!0 (select (arr!22412 a!4227) to!390)))))

(declare-fun b!835017 () Bool)

(declare-fun res!568023 () Bool)

(assert (=> b!835017 (=> (not res!568023) (not e!465823))))

(declare-fun arrayCountValidKeys!0 (array!46755 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835017 (= res!568023 (= (arrayCountValidKeys!0 (array!46756 (store (arr!22412 a!4227) i!1466 k!2968) (size!22833 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (= (and start!71856 res!568024) b!835012))

(assert (= (and b!835012 res!568021) b!835011))

(assert (= (and b!835011 res!568022) b!835013))

(assert (= (and b!835013 res!568018) b!835017))

(assert (= (and b!835017 res!568023) b!835014))

(assert (= (and b!835014 res!568019) b!835016))

(assert (= (and b!835016 res!568020) b!835015))

(declare-fun m!779653 () Bool)

(assert (=> b!835016 m!779653))

(assert (=> b!835016 m!779653))

(declare-fun m!779655 () Bool)

(assert (=> b!835016 m!779655))

(declare-fun m!779657 () Bool)

(assert (=> b!835012 m!779657))

(assert (=> b!835012 m!779657))

(declare-fun m!779659 () Bool)

(assert (=> b!835012 m!779659))

(declare-fun m!779661 () Bool)

(assert (=> b!835011 m!779661))

(declare-fun m!779663 () Bool)

(assert (=> b!835017 m!779663))

(declare-fun m!779665 () Bool)

(assert (=> b!835017 m!779665))

(declare-fun m!779667 () Bool)

(assert (=> b!835017 m!779667))

(declare-fun m!779669 () Bool)

(assert (=> start!71856 m!779669))

(push 1)

(assert (not b!835016))

(assert (not b!835012))

(assert (not start!71856))

(assert (not b!835017))

(assert (not b!835011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

