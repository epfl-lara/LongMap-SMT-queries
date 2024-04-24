; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72044 () Bool)

(assert start!72044)

(declare-fun b!836171 () Bool)

(declare-fun e!466559 () Bool)

(declare-fun e!466560 () Bool)

(assert (=> b!836171 (= e!466559 e!466560)))

(declare-fun res!568490 () Bool)

(assert (=> b!836171 (=> (not res!568490) (not e!466560))))

(declare-datatypes ((array!46791 0))(
  ( (array!46792 (arr!22425 (Array (_ BitVec 32) (_ BitVec 64))) (size!22845 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46791)

(declare-fun lt!380027 () (_ BitVec 32))

(declare-fun lt!380026 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836171 (= res!568490 (and (= lt!380027 lt!380026) (not (= to!390 (size!22845 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836171 (= lt!380026 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836171 (= lt!380027 (arrayCountValidKeys!0 (array!46792 (store (arr!22425 a!4227) i!1466 k0!2968) (size!22845 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!836172 () Bool)

(declare-fun res!568491 () Bool)

(assert (=> b!836172 (=> (not res!568491) (not e!466559))))

(assert (=> b!836172 (= res!568491 (and (bvslt (size!22845 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22845 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836173 () Bool)

(declare-fun res!568492 () Bool)

(assert (=> b!836173 (=> (not res!568492) (not e!466559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836173 (= res!568492 (not (validKeyInArray!0 (select (arr!22425 a!4227) i!1466))))))

(declare-fun b!836174 () Bool)

(declare-fun res!568489 () Bool)

(assert (=> b!836174 (=> (not res!568489) (not e!466559))))

(assert (=> b!836174 (= res!568489 (validKeyInArray!0 k0!2968))))

(declare-fun b!836175 () Bool)

(declare-fun res!568494 () Bool)

(assert (=> b!836175 (=> (not res!568494) (not e!466560))))

(assert (=> b!836175 (= res!568494 (validKeyInArray!0 (select (arr!22425 a!4227) to!390)))))

(declare-fun res!568493 () Bool)

(assert (=> start!72044 (=> (not res!568493) (not e!466559))))

(assert (=> start!72044 (= res!568493 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22845 a!4227))))))

(assert (=> start!72044 e!466559))

(assert (=> start!72044 true))

(declare-fun array_inv!17911 (array!46791) Bool)

(assert (=> start!72044 (array_inv!17911 a!4227)))

(declare-fun b!836170 () Bool)

(assert (=> b!836170 (= e!466560 (not true))))

(assert (=> b!836170 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!380026))))

(declare-datatypes ((Unit!28720 0))(
  ( (Unit!28721) )
))
(declare-fun lt!380025 () Unit!28720)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46791 (_ BitVec 32) (_ BitVec 32)) Unit!28720)

(assert (=> b!836170 (= lt!380025 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!72044 res!568493) b!836173))

(assert (= (and b!836173 res!568492) b!836174))

(assert (= (and b!836174 res!568489) b!836172))

(assert (= (and b!836172 res!568491) b!836171))

(assert (= (and b!836171 res!568490) b!836175))

(assert (= (and b!836175 res!568494) b!836170))

(declare-fun m!781717 () Bool)

(assert (=> b!836170 m!781717))

(declare-fun m!781719 () Bool)

(assert (=> b!836170 m!781719))

(declare-fun m!781721 () Bool)

(assert (=> b!836173 m!781721))

(assert (=> b!836173 m!781721))

(declare-fun m!781723 () Bool)

(assert (=> b!836173 m!781723))

(declare-fun m!781725 () Bool)

(assert (=> b!836174 m!781725))

(declare-fun m!781727 () Bool)

(assert (=> b!836175 m!781727))

(assert (=> b!836175 m!781727))

(declare-fun m!781729 () Bool)

(assert (=> b!836175 m!781729))

(declare-fun m!781731 () Bool)

(assert (=> b!836171 m!781731))

(declare-fun m!781733 () Bool)

(assert (=> b!836171 m!781733))

(declare-fun m!781735 () Bool)

(assert (=> b!836171 m!781735))

(declare-fun m!781737 () Bool)

(assert (=> start!72044 m!781737))

(check-sat (not b!836170) (not start!72044) (not b!836171) (not b!836174) (not b!836175) (not b!836173))
(check-sat)
