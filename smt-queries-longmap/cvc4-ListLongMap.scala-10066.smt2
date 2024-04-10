; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118534 () Bool)

(assert start!118534)

(declare-fun res!927071 () Bool)

(declare-fun e!785167 () Bool)

(assert (=> start!118534 (=> (not res!927071) (not e!785167))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118534 (= res!927071 (validMask!0 mask!2987))))

(assert (=> start!118534 e!785167))

(assert (=> start!118534 true))

(declare-datatypes ((array!94810 0))(
  ( (array!94811 (arr!45781 (Array (_ BitVec 32) (_ BitVec 64))) (size!46331 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94810)

(declare-fun array_inv!34809 (array!94810) Bool)

(assert (=> start!118534 (array_inv!34809 a!2938)))

(declare-fun b!1385820 () Bool)

(declare-fun res!927072 () Bool)

(assert (=> b!1385820 (=> (not res!927072) (not e!785167))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385820 (= res!927072 (and (= (size!46331 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46331 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46331 a!2938))))))

(declare-fun b!1385823 () Bool)

(assert (=> b!1385823 (= e!785167 false)))

(declare-fun lt!609324 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94810 (_ BitVec 32)) Bool)

(assert (=> b!1385823 (= lt!609324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385822 () Bool)

(declare-fun res!927070 () Bool)

(assert (=> b!1385822 (=> (not res!927070) (not e!785167))))

(declare-datatypes ((List!32309 0))(
  ( (Nil!32306) (Cons!32305 (h!33514 (_ BitVec 64)) (t!47003 List!32309)) )
))
(declare-fun arrayNoDuplicates!0 (array!94810 (_ BitVec 32) List!32309) Bool)

(assert (=> b!1385822 (= res!927070 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32306))))

(declare-fun b!1385821 () Bool)

(declare-fun res!927073 () Bool)

(assert (=> b!1385821 (=> (not res!927073) (not e!785167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385821 (= res!927073 (validKeyInArray!0 (select (arr!45781 a!2938) i!1065)))))

(assert (= (and start!118534 res!927071) b!1385820))

(assert (= (and b!1385820 res!927072) b!1385821))

(assert (= (and b!1385821 res!927073) b!1385822))

(assert (= (and b!1385822 res!927070) b!1385823))

(declare-fun m!1271097 () Bool)

(assert (=> start!118534 m!1271097))

(declare-fun m!1271099 () Bool)

(assert (=> start!118534 m!1271099))

(declare-fun m!1271101 () Bool)

(assert (=> b!1385823 m!1271101))

(declare-fun m!1271103 () Bool)

(assert (=> b!1385822 m!1271103))

(declare-fun m!1271105 () Bool)

(assert (=> b!1385821 m!1271105))

(assert (=> b!1385821 m!1271105))

(declare-fun m!1271107 () Bool)

(assert (=> b!1385821 m!1271107))

(push 1)

(assert (not b!1385823))

(assert (not b!1385821))

(assert (not b!1385822))

(assert (not start!118534))

(check-sat)

