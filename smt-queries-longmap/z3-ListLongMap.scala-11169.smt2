; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130506 () Bool)

(assert start!130506)

(declare-fun b!1532002 () Bool)

(declare-fun res!1049328 () Bool)

(declare-fun e!853569 () Bool)

(assert (=> b!1532002 (=> (not res!1049328) (not e!853569))))

(declare-datatypes ((array!101683 0))(
  ( (array!101684 (arr!49063 (Array (_ BitVec 32) (_ BitVec 64))) (size!49615 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101683)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532002 (= res!1049328 (and (= (size!49615 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49615 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49615 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532004 () Bool)

(declare-fun res!1049326 () Bool)

(assert (=> b!1532004 (=> (not res!1049326) (not e!853569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532004 (= res!1049326 (validKeyInArray!0 (select (arr!49063 a!2792) j!64)))))

(declare-fun b!1532003 () Bool)

(declare-fun res!1049329 () Bool)

(assert (=> b!1532003 (=> (not res!1049329) (not e!853569))))

(assert (=> b!1532003 (= res!1049329 (validKeyInArray!0 (select (arr!49063 a!2792) i!951)))))

(declare-fun res!1049327 () Bool)

(assert (=> start!130506 (=> (not res!1049327) (not e!853569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130506 (= res!1049327 (validMask!0 mask!2480))))

(assert (=> start!130506 e!853569))

(assert (=> start!130506 true))

(declare-fun array_inv!38296 (array!101683) Bool)

(assert (=> start!130506 (array_inv!38296 a!2792)))

(declare-fun b!1532005 () Bool)

(assert (=> b!1532005 (= e!853569 (bvsgt #b00000000000000000000000000000000 (size!49615 a!2792)))))

(assert (= (and start!130506 res!1049327) b!1532002))

(assert (= (and b!1532002 res!1049328) b!1532003))

(assert (= (and b!1532003 res!1049329) b!1532004))

(assert (= (and b!1532004 res!1049326) b!1532005))

(declare-fun m!1414157 () Bool)

(assert (=> b!1532004 m!1414157))

(assert (=> b!1532004 m!1414157))

(declare-fun m!1414159 () Bool)

(assert (=> b!1532004 m!1414159))

(declare-fun m!1414161 () Bool)

(assert (=> b!1532003 m!1414161))

(assert (=> b!1532003 m!1414161))

(declare-fun m!1414163 () Bool)

(assert (=> b!1532003 m!1414163))

(declare-fun m!1414165 () Bool)

(assert (=> start!130506 m!1414165))

(declare-fun m!1414167 () Bool)

(assert (=> start!130506 m!1414167))

(check-sat (not start!130506) (not b!1532003) (not b!1532004))
(check-sat)
