; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71838 () Bool)

(assert start!71838)

(declare-fun b!834970 () Bool)

(declare-fun res!567844 () Bool)

(declare-fun e!465858 () Bool)

(assert (=> b!834970 (=> (not res!567844) (not e!465858))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834970 (= res!567844 (validKeyInArray!0 k0!2968))))

(declare-fun res!567843 () Bool)

(assert (=> start!71838 (=> (not res!567843) (not e!465858))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46748 0))(
  ( (array!46749 (arr!22408 (Array (_ BitVec 32) (_ BitVec 64))) (size!22829 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46748)

(assert (=> start!71838 (= res!567843 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22829 a!4227))))))

(assert (=> start!71838 e!465858))

(assert (=> start!71838 true))

(declare-fun array_inv!17855 (array!46748) Bool)

(assert (=> start!71838 (array_inv!17855 a!4227)))

(declare-fun b!834971 () Bool)

(declare-fun res!567842 () Bool)

(assert (=> b!834971 (=> (not res!567842) (not e!465858))))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46748 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834971 (= res!567842 (= (arrayCountValidKeys!0 (array!46749 (store (arr!22408 a!4227) i!1466 k0!2968) (size!22829 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!834972 () Bool)

(assert (=> b!834972 (= e!465858 (and (= to!390 (size!22829 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!834973 () Bool)

(declare-fun res!567845 () Bool)

(assert (=> b!834973 (=> (not res!567845) (not e!465858))))

(assert (=> b!834973 (= res!567845 (and (bvslt (size!22829 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22829 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834974 () Bool)

(declare-fun res!567841 () Bool)

(assert (=> b!834974 (=> (not res!567841) (not e!465858))))

(assert (=> b!834974 (= res!567841 (not (validKeyInArray!0 (select (arr!22408 a!4227) i!1466))))))

(assert (= (and start!71838 res!567843) b!834974))

(assert (= (and b!834974 res!567841) b!834970))

(assert (= (and b!834970 res!567844) b!834973))

(assert (= (and b!834973 res!567845) b!834971))

(assert (= (and b!834971 res!567842) b!834972))

(declare-fun m!780131 () Bool)

(assert (=> b!834970 m!780131))

(declare-fun m!780133 () Bool)

(assert (=> start!71838 m!780133))

(declare-fun m!780135 () Bool)

(assert (=> b!834971 m!780135))

(declare-fun m!780137 () Bool)

(assert (=> b!834971 m!780137))

(declare-fun m!780139 () Bool)

(assert (=> b!834971 m!780139))

(declare-fun m!780141 () Bool)

(assert (=> b!834974 m!780141))

(assert (=> b!834974 m!780141))

(declare-fun m!780143 () Bool)

(assert (=> b!834974 m!780143))

(check-sat (not b!834970) (not start!71838) (not b!834974) (not b!834971))
(check-sat)
