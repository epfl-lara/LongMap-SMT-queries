; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72014 () Bool)

(assert start!72014)

(declare-fun b!835934 () Bool)

(declare-fun res!568254 () Bool)

(declare-fun e!466467 () Bool)

(assert (=> b!835934 (=> (not res!568254) (not e!466467))))

(declare-datatypes ((array!46761 0))(
  ( (array!46762 (arr!22410 (Array (_ BitVec 32) (_ BitVec 64))) (size!22830 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46761)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835934 (= res!568254 (not (validKeyInArray!0 (select (arr!22410 a!4227) i!1466))))))

(declare-fun res!568257 () Bool)

(assert (=> start!72014 (=> (not res!568257) (not e!466467))))

(assert (=> start!72014 (= res!568257 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22830 a!4227))))))

(assert (=> start!72014 e!466467))

(assert (=> start!72014 true))

(declare-fun array_inv!17896 (array!46761) Bool)

(assert (=> start!72014 (array_inv!17896 a!4227)))

(declare-fun b!835935 () Bool)

(declare-fun res!568256 () Bool)

(assert (=> b!835935 (=> (not res!568256) (not e!466467))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835935 (= res!568256 (and (bvslt (size!22830 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22830 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835936 () Bool)

(assert (=> b!835936 (= e!466467 (and (= to!390 (size!22830 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!835937 () Bool)

(declare-fun res!568253 () Bool)

(assert (=> b!835937 (=> (not res!568253) (not e!466467))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835937 (= res!568253 (= (arrayCountValidKeys!0 (array!46762 (store (arr!22410 a!4227) i!1466 k0!2968) (size!22830 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835938 () Bool)

(declare-fun res!568255 () Bool)

(assert (=> b!835938 (=> (not res!568255) (not e!466467))))

(assert (=> b!835938 (= res!568255 (validKeyInArray!0 k0!2968))))

(assert (= (and start!72014 res!568257) b!835934))

(assert (= (and b!835934 res!568254) b!835938))

(assert (= (and b!835938 res!568255) b!835935))

(assert (= (and b!835935 res!568256) b!835937))

(assert (= (and b!835937 res!568253) b!835936))

(declare-fun m!781495 () Bool)

(assert (=> b!835934 m!781495))

(assert (=> b!835934 m!781495))

(declare-fun m!781497 () Bool)

(assert (=> b!835934 m!781497))

(declare-fun m!781499 () Bool)

(assert (=> start!72014 m!781499))

(declare-fun m!781501 () Bool)

(assert (=> b!835937 m!781501))

(declare-fun m!781503 () Bool)

(assert (=> b!835937 m!781503))

(declare-fun m!781505 () Bool)

(assert (=> b!835937 m!781505))

(declare-fun m!781507 () Bool)

(assert (=> b!835938 m!781507))

(check-sat (not b!835934) (not start!72014) (not b!835937) (not b!835938))
(check-sat)
