; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118522 () Bool)

(assert start!118522)

(declare-fun res!926996 () Bool)

(declare-fun e!785132 () Bool)

(assert (=> start!118522 (=> (not res!926996) (not e!785132))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118522 (= res!926996 (validMask!0 mask!2987))))

(assert (=> start!118522 e!785132))

(assert (=> start!118522 true))

(declare-datatypes ((array!94798 0))(
  ( (array!94799 (arr!45775 (Array (_ BitVec 32) (_ BitVec 64))) (size!46325 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94798)

(declare-fun array_inv!34803 (array!94798) Bool)

(assert (=> start!118522 (array_inv!34803 a!2938)))

(declare-fun b!1385745 () Bool)

(declare-fun res!926997 () Bool)

(assert (=> b!1385745 (=> (not res!926997) (not e!785132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94798 (_ BitVec 32)) Bool)

(assert (=> b!1385745 (= res!926997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385746 () Bool)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385746 (= e!785132 (= i!1065 startIndex!16))))

(declare-fun b!1385747 () Bool)

(declare-fun res!927000 () Bool)

(assert (=> b!1385747 (=> (not res!927000) (not e!785132))))

(declare-datatypes ((List!32303 0))(
  ( (Nil!32300) (Cons!32299 (h!33508 (_ BitVec 64)) (t!46997 List!32303)) )
))
(declare-fun arrayNoDuplicates!0 (array!94798 (_ BitVec 32) List!32303) Bool)

(assert (=> b!1385747 (= res!927000 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32300))))

(declare-fun b!1385748 () Bool)

(declare-fun res!926995 () Bool)

(assert (=> b!1385748 (=> (not res!926995) (not e!785132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385748 (= res!926995 (validKeyInArray!0 (select (arr!45775 a!2938) startIndex!16)))))

(declare-fun b!1385749 () Bool)

(declare-fun res!926998 () Bool)

(assert (=> b!1385749 (=> (not res!926998) (not e!785132))))

(assert (=> b!1385749 (= res!926998 (validKeyInArray!0 (select (arr!45775 a!2938) i!1065)))))

(declare-fun b!1385750 () Bool)

(declare-fun res!926999 () Bool)

(assert (=> b!1385750 (=> (not res!926999) (not e!785132))))

(assert (=> b!1385750 (= res!926999 (and (= (size!46325 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46325 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46325 a!2938))))))

(declare-fun b!1385751 () Bool)

(declare-fun res!927001 () Bool)

(assert (=> b!1385751 (=> (not res!927001) (not e!785132))))

(assert (=> b!1385751 (= res!927001 (and (not (= (select (arr!45775 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45775 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(assert (= (and start!118522 res!926996) b!1385750))

(assert (= (and b!1385750 res!926999) b!1385749))

(assert (= (and b!1385749 res!926998) b!1385747))

(assert (= (and b!1385747 res!927000) b!1385745))

(assert (= (and b!1385745 res!926997) b!1385751))

(assert (= (and b!1385751 res!927001) b!1385748))

(assert (= (and b!1385748 res!926995) b!1385746))

(declare-fun m!1271021 () Bool)

(assert (=> b!1385751 m!1271021))

(declare-fun m!1271023 () Bool)

(assert (=> b!1385745 m!1271023))

(declare-fun m!1271025 () Bool)

(assert (=> start!118522 m!1271025))

(declare-fun m!1271027 () Bool)

(assert (=> start!118522 m!1271027))

(declare-fun m!1271029 () Bool)

(assert (=> b!1385747 m!1271029))

(assert (=> b!1385749 m!1271021))

(assert (=> b!1385749 m!1271021))

(declare-fun m!1271031 () Bool)

(assert (=> b!1385749 m!1271031))

(declare-fun m!1271033 () Bool)

(assert (=> b!1385748 m!1271033))

(assert (=> b!1385748 m!1271033))

(declare-fun m!1271035 () Bool)

(assert (=> b!1385748 m!1271035))

(push 1)

(assert (not b!1385749))

(assert (not b!1385745))

(assert (not start!118522))

(assert (not b!1385747))

(assert (not b!1385748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

