; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71958 () Bool)

(assert start!71958)

(declare-fun b!836145 () Bool)

(declare-fun res!568872 () Bool)

(declare-fun e!466452 () Bool)

(assert (=> b!836145 (=> (not res!568872) (not e!466452))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836145 (= res!568872 (validKeyInArray!0 k0!2968))))

(declare-fun b!836147 () Bool)

(assert (=> b!836147 (= e!466452 false)))

(declare-datatypes ((array!46868 0))(
  ( (array!46869 (arr!22468 (Array (_ BitVec 32) (_ BitVec 64))) (size!22889 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46868)

(declare-fun lt!380374 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46868 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836147 (= lt!380374 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380373 () (_ BitVec 32))

(assert (=> b!836147 (= lt!380373 (arrayCountValidKeys!0 (array!46869 (store (arr!22468 a!4227) i!1466 k0!2968) (size!22889 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568873 () Bool)

(assert (=> start!71958 (=> (not res!568873) (not e!466452))))

(assert (=> start!71958 (= res!568873 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22889 a!4227))))))

(assert (=> start!71958 e!466452))

(assert (=> start!71958 true))

(declare-fun array_inv!17915 (array!46868) Bool)

(assert (=> start!71958 (array_inv!17915 a!4227)))

(declare-fun b!836146 () Bool)

(declare-fun res!568871 () Bool)

(assert (=> b!836146 (=> (not res!568871) (not e!466452))))

(assert (=> b!836146 (= res!568871 (and (bvslt (size!22889 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22889 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836144 () Bool)

(declare-fun res!568874 () Bool)

(assert (=> b!836144 (=> (not res!568874) (not e!466452))))

(assert (=> b!836144 (= res!568874 (not (validKeyInArray!0 (select (arr!22468 a!4227) i!1466))))))

(assert (= (and start!71958 res!568873) b!836144))

(assert (= (and b!836144 res!568874) b!836145))

(assert (= (and b!836145 res!568872) b!836146))

(assert (= (and b!836146 res!568871) b!836147))

(declare-fun m!781539 () Bool)

(assert (=> b!836145 m!781539))

(declare-fun m!781541 () Bool)

(assert (=> b!836147 m!781541))

(declare-fun m!781543 () Bool)

(assert (=> b!836147 m!781543))

(declare-fun m!781545 () Bool)

(assert (=> b!836147 m!781545))

(declare-fun m!781547 () Bool)

(assert (=> start!71958 m!781547))

(declare-fun m!781549 () Bool)

(assert (=> b!836144 m!781549))

(assert (=> b!836144 m!781549))

(declare-fun m!781551 () Bool)

(assert (=> b!836144 m!781551))

(check-sat (not b!836144) (not start!71958) (not b!836147) (not b!836145))
