; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72026 () Bool)

(assert start!72026)

(declare-fun res!568337 () Bool)

(declare-fun e!466504 () Bool)

(assert (=> start!72026 (=> (not res!568337) (not e!466504))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46773 0))(
  ( (array!46774 (arr!22416 (Array (_ BitVec 32) (_ BitVec 64))) (size!22836 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46773)

(assert (=> start!72026 (= res!568337 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22836 a!4227))))))

(assert (=> start!72026 e!466504))

(assert (=> start!72026 true))

(declare-fun array_inv!17902 (array!46773) Bool)

(assert (=> start!72026 (array_inv!17902 a!4227)))

(declare-fun b!836015 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836015 (= e!466504 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!22836 a!4227)) to!390) #b00000000000000000000000000000000))))

(declare-fun b!836016 () Bool)

(declare-fun res!568338 () Bool)

(assert (=> b!836016 (=> (not res!568338) (not e!466504))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836016 (= res!568338 (= (arrayCountValidKeys!0 (array!46774 (store (arr!22416 a!4227) i!1466 k0!2968) (size!22836 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!836017 () Bool)

(declare-fun res!568335 () Bool)

(assert (=> b!836017 (=> (not res!568335) (not e!466504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836017 (= res!568335 (validKeyInArray!0 k0!2968))))

(declare-fun b!836018 () Bool)

(declare-fun res!568336 () Bool)

(assert (=> b!836018 (=> (not res!568336) (not e!466504))))

(assert (=> b!836018 (= res!568336 (not (validKeyInArray!0 (select (arr!22416 a!4227) i!1466))))))

(declare-fun b!836019 () Bool)

(declare-fun res!568334 () Bool)

(assert (=> b!836019 (=> (not res!568334) (not e!466504))))

(assert (=> b!836019 (= res!568334 (and (bvslt (size!22836 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22836 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!72026 res!568337) b!836018))

(assert (= (and b!836018 res!568336) b!836017))

(assert (= (and b!836017 res!568335) b!836019))

(assert (= (and b!836019 res!568334) b!836016))

(assert (= (and b!836016 res!568338) b!836015))

(declare-fun m!781579 () Bool)

(assert (=> start!72026 m!781579))

(declare-fun m!781581 () Bool)

(assert (=> b!836016 m!781581))

(declare-fun m!781583 () Bool)

(assert (=> b!836016 m!781583))

(declare-fun m!781585 () Bool)

(assert (=> b!836016 m!781585))

(declare-fun m!781587 () Bool)

(assert (=> b!836017 m!781587))

(declare-fun m!781589 () Bool)

(assert (=> b!836018 m!781589))

(assert (=> b!836018 m!781589))

(declare-fun m!781591 () Bool)

(assert (=> b!836018 m!781591))

(check-sat (not start!72026) (not b!836016) (not b!836018) (not b!836017))
(check-sat)
