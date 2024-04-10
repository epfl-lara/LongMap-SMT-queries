; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71844 () Bool)

(assert start!71844)

(declare-fun b!835010 () Bool)

(declare-fun res!567883 () Bool)

(declare-fun e!465875 () Bool)

(assert (=> b!835010 (=> (not res!567883) (not e!465875))))

(declare-datatypes ((array!46754 0))(
  ( (array!46755 (arr!22411 (Array (_ BitVec 32) (_ BitVec 64))) (size!22832 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46754)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835010 (= res!567883 (not (validKeyInArray!0 (select (arr!22411 a!4227) i!1466))))))

(declare-fun b!835012 () Bool)

(declare-fun res!567884 () Bool)

(assert (=> b!835012 (=> (not res!567884) (not e!465875))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835012 (= res!567884 (and (bvslt (size!22832 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22832 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835011 () Bool)

(declare-fun res!567881 () Bool)

(assert (=> b!835011 (=> (not res!567881) (not e!465875))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835011 (= res!567881 (validKeyInArray!0 k0!2968))))

(declare-fun res!567882 () Bool)

(assert (=> start!71844 (=> (not res!567882) (not e!465875))))

(assert (=> start!71844 (= res!567882 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22832 a!4227))))))

(assert (=> start!71844 e!465875))

(assert (=> start!71844 true))

(declare-fun array_inv!17858 (array!46754) Bool)

(assert (=> start!71844 (array_inv!17858 a!4227)))

(declare-fun b!835013 () Bool)

(assert (=> b!835013 (= e!465875 false)))

(declare-fun lt!379635 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46754 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835013 (= lt!379635 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379636 () (_ BitVec 32))

(assert (=> b!835013 (= lt!379636 (arrayCountValidKeys!0 (array!46755 (store (arr!22411 a!4227) i!1466 k0!2968) (size!22832 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71844 res!567882) b!835010))

(assert (= (and b!835010 res!567883) b!835011))

(assert (= (and b!835011 res!567881) b!835012))

(assert (= (and b!835012 res!567884) b!835013))

(declare-fun m!780173 () Bool)

(assert (=> b!835010 m!780173))

(assert (=> b!835010 m!780173))

(declare-fun m!780175 () Bool)

(assert (=> b!835010 m!780175))

(declare-fun m!780177 () Bool)

(assert (=> b!835011 m!780177))

(declare-fun m!780179 () Bool)

(assert (=> start!71844 m!780179))

(declare-fun m!780181 () Bool)

(assert (=> b!835013 m!780181))

(declare-fun m!780183 () Bool)

(assert (=> b!835013 m!780183))

(declare-fun m!780185 () Bool)

(assert (=> b!835013 m!780185))

(check-sat (not b!835011) (not b!835010) (not start!71844) (not b!835013))
