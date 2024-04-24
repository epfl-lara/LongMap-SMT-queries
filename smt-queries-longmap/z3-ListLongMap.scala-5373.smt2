; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72002 () Bool)

(assert start!72002)

(declare-fun res!568174 () Bool)

(declare-fun e!466431 () Bool)

(assert (=> start!72002 (=> (not res!568174) (not e!466431))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46749 0))(
  ( (array!46750 (arr!22404 (Array (_ BitVec 32) (_ BitVec 64))) (size!22824 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46749)

(assert (=> start!72002 (= res!568174 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22824 a!4227))))))

(assert (=> start!72002 e!466431))

(assert (=> start!72002 true))

(declare-fun array_inv!17890 (array!46749) Bool)

(assert (=> start!72002 (array_inv!17890 a!4227)))

(declare-fun b!835853 () Bool)

(declare-fun res!568173 () Bool)

(assert (=> b!835853 (=> (not res!568173) (not e!466431))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835853 (= res!568173 (= (arrayCountValidKeys!0 (array!46750 (store (arr!22404 a!4227) i!1466 k0!2968) (size!22824 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835854 () Bool)

(declare-fun res!568172 () Bool)

(assert (=> b!835854 (=> (not res!568172) (not e!466431))))

(assert (=> b!835854 (= res!568172 (and (bvslt (size!22824 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22824 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835855 () Bool)

(declare-fun res!568175 () Bool)

(assert (=> b!835855 (=> (not res!568175) (not e!466431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835855 (= res!568175 (not (validKeyInArray!0 (select (arr!22404 a!4227) i!1466))))))

(declare-fun b!835856 () Bool)

(declare-fun res!568176 () Bool)

(assert (=> b!835856 (=> (not res!568176) (not e!466431))))

(assert (=> b!835856 (= res!568176 (validKeyInArray!0 k0!2968))))

(declare-fun b!835857 () Bool)

(assert (=> b!835857 (= e!466431 (and (= to!390 (size!22824 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!72002 res!568174) b!835855))

(assert (= (and b!835855 res!568175) b!835856))

(assert (= (and b!835856 res!568176) b!835854))

(assert (= (and b!835854 res!568172) b!835853))

(assert (= (and b!835853 res!568173) b!835857))

(declare-fun m!781411 () Bool)

(assert (=> start!72002 m!781411))

(declare-fun m!781413 () Bool)

(assert (=> b!835853 m!781413))

(declare-fun m!781415 () Bool)

(assert (=> b!835853 m!781415))

(declare-fun m!781417 () Bool)

(assert (=> b!835853 m!781417))

(declare-fun m!781419 () Bool)

(assert (=> b!835855 m!781419))

(assert (=> b!835855 m!781419))

(declare-fun m!781421 () Bool)

(assert (=> b!835855 m!781421))

(declare-fun m!781423 () Bool)

(assert (=> b!835856 m!781423))

(check-sat (not b!835856) (not b!835855) (not b!835853) (not start!72002))
(check-sat)
