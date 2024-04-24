; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72128 () Bool)

(assert start!72128)

(declare-fun b!837070 () Bool)

(declare-fun res!569247 () Bool)

(declare-fun e!467045 () Bool)

(assert (=> b!837070 (=> (not res!569247) (not e!467045))))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46875 0))(
  ( (array!46876 (arr!22467 (Array (_ BitVec 32) (_ BitVec 64))) (size!22887 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46875)

(assert (=> b!837070 (= res!569247 (= to!390 (size!22887 a!4227)))))

(declare-fun b!837071 () Bool)

(declare-fun lt!380741 () array!46875)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46875 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!837071 (= e!467045 (not (= (arrayCountValidKeys!0 lt!380741 (bvadd #b00000000000000000000000000000001 i!1466) (size!22887 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22887 a!4227)))))))

(declare-fun b!837072 () Bool)

(declare-fun e!467047 () Bool)

(assert (=> b!837072 (= e!467047 e!467045)))

(declare-fun res!569250 () Bool)

(assert (=> b!837072 (=> (not res!569250) (not e!467045))))

(assert (=> b!837072 (= res!569250 (= (arrayCountValidKeys!0 lt!380741 (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!837072 (= lt!380741 (array!46876 (store (arr!22467 a!4227) i!1466 k0!2968) (size!22887 a!4227)))))

(declare-fun b!837073 () Bool)

(declare-fun res!569246 () Bool)

(assert (=> b!837073 (=> (not res!569246) (not e!467047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837073 (= res!569246 (not (validKeyInArray!0 (select (arr!22467 a!4227) i!1466))))))

(declare-fun res!569248 () Bool)

(assert (=> start!72128 (=> (not res!569248) (not e!467047))))

(assert (=> start!72128 (= res!569248 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22887 a!4227))))))

(assert (=> start!72128 e!467047))

(assert (=> start!72128 true))

(declare-fun array_inv!17953 (array!46875) Bool)

(assert (=> start!72128 (array_inv!17953 a!4227)))

(declare-fun b!837074 () Bool)

(declare-fun res!569245 () Bool)

(assert (=> b!837074 (=> (not res!569245) (not e!467047))))

(assert (=> b!837074 (= res!569245 (and (bvslt (size!22887 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22887 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!837075 () Bool)

(declare-fun res!569249 () Bool)

(assert (=> b!837075 (=> (not res!569249) (not e!467047))))

(assert (=> b!837075 (= res!569249 (validKeyInArray!0 k0!2968))))

(assert (= (and start!72128 res!569248) b!837073))

(assert (= (and b!837073 res!569246) b!837075))

(assert (= (and b!837075 res!569249) b!837074))

(assert (= (and b!837074 res!569245) b!837072))

(assert (= (and b!837072 res!569250) b!837070))

(assert (= (and b!837070 res!569247) b!837071))

(declare-fun m!782857 () Bool)

(assert (=> b!837072 m!782857))

(declare-fun m!782859 () Bool)

(assert (=> b!837072 m!782859))

(declare-fun m!782861 () Bool)

(assert (=> b!837072 m!782861))

(declare-fun m!782863 () Bool)

(assert (=> b!837075 m!782863))

(declare-fun m!782865 () Bool)

(assert (=> b!837071 m!782865))

(declare-fun m!782867 () Bool)

(assert (=> b!837071 m!782867))

(declare-fun m!782869 () Bool)

(assert (=> start!72128 m!782869))

(declare-fun m!782871 () Bool)

(assert (=> b!837073 m!782871))

(assert (=> b!837073 m!782871))

(declare-fun m!782873 () Bool)

(assert (=> b!837073 m!782873))

(check-sat (not b!837075) (not b!837072) (not b!837071) (not start!72128) (not b!837073))
(check-sat)
