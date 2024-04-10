; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119030 () Bool)

(assert start!119030)

(declare-fun b!1389118 () Bool)

(declare-fun res!929313 () Bool)

(declare-fun e!786899 () Bool)

(assert (=> b!1389118 (=> (not res!929313) (not e!786899))))

(declare-datatypes ((array!95000 0))(
  ( (array!95001 (arr!45867 (Array (_ BitVec 32) (_ BitVec 64))) (size!46417 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95000)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95000 (_ BitVec 32)) Bool)

(assert (=> b!1389118 (= res!929313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389119 () Bool)

(declare-fun res!929314 () Bool)

(assert (=> b!1389119 (=> (not res!929314) (not e!786899))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389119 (= res!929314 (validKeyInArray!0 (select (arr!45867 a!2901) i!1037)))))

(declare-fun b!1389120 () Bool)

(assert (=> b!1389120 (= e!786899 false)))

(declare-fun lt!610482 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389120 (= lt!610482 (toIndex!0 (select (arr!45867 a!2901) j!112) mask!2840))))

(declare-fun b!1389121 () Bool)

(declare-fun res!929317 () Bool)

(assert (=> b!1389121 (=> (not res!929317) (not e!786899))))

(assert (=> b!1389121 (= res!929317 (and (= (size!46417 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46417 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46417 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389122 () Bool)

(declare-fun res!929312 () Bool)

(assert (=> b!1389122 (=> (not res!929312) (not e!786899))))

(declare-datatypes ((List!32386 0))(
  ( (Nil!32383) (Cons!32382 (h!33597 (_ BitVec 64)) (t!47080 List!32386)) )
))
(declare-fun arrayNoDuplicates!0 (array!95000 (_ BitVec 32) List!32386) Bool)

(assert (=> b!1389122 (= res!929312 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32383))))

(declare-fun b!1389123 () Bool)

(declare-fun res!929316 () Bool)

(assert (=> b!1389123 (=> (not res!929316) (not e!786899))))

(assert (=> b!1389123 (= res!929316 (validKeyInArray!0 (select (arr!45867 a!2901) j!112)))))

(declare-fun res!929315 () Bool)

(assert (=> start!119030 (=> (not res!929315) (not e!786899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119030 (= res!929315 (validMask!0 mask!2840))))

(assert (=> start!119030 e!786899))

(assert (=> start!119030 true))

(declare-fun array_inv!34895 (array!95000) Bool)

(assert (=> start!119030 (array_inv!34895 a!2901)))

(assert (= (and start!119030 res!929315) b!1389121))

(assert (= (and b!1389121 res!929317) b!1389119))

(assert (= (and b!1389119 res!929314) b!1389123))

(assert (= (and b!1389123 res!929316) b!1389118))

(assert (= (and b!1389118 res!929313) b!1389122))

(assert (= (and b!1389122 res!929312) b!1389120))

(declare-fun m!1274793 () Bool)

(assert (=> b!1389118 m!1274793))

(declare-fun m!1274795 () Bool)

(assert (=> start!119030 m!1274795))

(declare-fun m!1274797 () Bool)

(assert (=> start!119030 m!1274797))

(declare-fun m!1274799 () Bool)

(assert (=> b!1389119 m!1274799))

(assert (=> b!1389119 m!1274799))

(declare-fun m!1274801 () Bool)

(assert (=> b!1389119 m!1274801))

(declare-fun m!1274803 () Bool)

(assert (=> b!1389122 m!1274803))

(declare-fun m!1274805 () Bool)

(assert (=> b!1389123 m!1274805))

(assert (=> b!1389123 m!1274805))

(declare-fun m!1274807 () Bool)

(assert (=> b!1389123 m!1274807))

(assert (=> b!1389120 m!1274805))

(assert (=> b!1389120 m!1274805))

(declare-fun m!1274809 () Bool)

(assert (=> b!1389120 m!1274809))

(check-sat (not b!1389123) (not start!119030) (not b!1389118) (not b!1389122) (not b!1389119) (not b!1389120))
