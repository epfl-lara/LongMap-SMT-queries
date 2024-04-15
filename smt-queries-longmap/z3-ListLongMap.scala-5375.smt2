; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71828 () Bool)

(assert start!71828)

(declare-fun res!567801 () Bool)

(declare-fun e!465740 () Bool)

(assert (=> start!71828 (=> (not res!567801) (not e!465740))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46727 0))(
  ( (array!46728 (arr!22398 (Array (_ BitVec 32) (_ BitVec 64))) (size!22819 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46727)

(assert (=> start!71828 (= res!567801 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22819 a!4227))))))

(assert (=> start!71828 e!465740))

(assert (=> start!71828 true))

(declare-fun array_inv!17910 (array!46727) Bool)

(assert (=> start!71828 (array_inv!17910 a!4227)))

(declare-fun b!834794 () Bool)

(declare-fun res!567803 () Bool)

(assert (=> b!834794 (=> (not res!567803) (not e!465740))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834794 (= res!567803 (validKeyInArray!0 k0!2968))))

(declare-fun b!834795 () Bool)

(declare-fun res!567805 () Bool)

(assert (=> b!834795 (=> (not res!567805) (not e!465740))))

(assert (=> b!834795 (= res!567805 (not (validKeyInArray!0 (select (arr!22398 a!4227) i!1466))))))

(declare-fun b!834796 () Bool)

(declare-fun res!567804 () Bool)

(assert (=> b!834796 (=> (not res!567804) (not e!465740))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834796 (= res!567804 (and (bvslt (size!22819 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22819 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834797 () Bool)

(assert (=> b!834797 (= e!465740 (and (= to!390 (size!22819 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!834798 () Bool)

(declare-fun res!567802 () Bool)

(assert (=> b!834798 (=> (not res!567802) (not e!465740))))

(declare-fun arrayCountValidKeys!0 (array!46727 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834798 (= res!567802 (= (arrayCountValidKeys!0 (array!46728 (store (arr!22398 a!4227) i!1466 k0!2968) (size!22819 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (= (and start!71828 res!567801) b!834795))

(assert (= (and b!834795 res!567805) b!834794))

(assert (= (and b!834794 res!567803) b!834796))

(assert (= (and b!834796 res!567804) b!834798))

(assert (= (and b!834798 res!567802) b!834797))

(declare-fun m!779449 () Bool)

(assert (=> start!71828 m!779449))

(declare-fun m!779451 () Bool)

(assert (=> b!834794 m!779451))

(declare-fun m!779453 () Bool)

(assert (=> b!834795 m!779453))

(assert (=> b!834795 m!779453))

(declare-fun m!779455 () Bool)

(assert (=> b!834795 m!779455))

(declare-fun m!779457 () Bool)

(assert (=> b!834798 m!779457))

(declare-fun m!779459 () Bool)

(assert (=> b!834798 m!779459))

(declare-fun m!779461 () Bool)

(assert (=> b!834798 m!779461))

(check-sat (not b!834795) (not b!834798) (not b!834794) (not start!71828))
(check-sat)
