; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118518 () Bool)

(assert start!118518)

(declare-fun b!1385703 () Bool)

(declare-fun e!785119 () Bool)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385703 (= e!785119 (= i!1065 startIndex!16))))

(declare-fun b!1385704 () Bool)

(declare-fun res!926954 () Bool)

(assert (=> b!1385704 (=> (not res!926954) (not e!785119))))

(declare-datatypes ((array!94794 0))(
  ( (array!94795 (arr!45773 (Array (_ BitVec 32) (_ BitVec 64))) (size!46323 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94794)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385704 (= res!926954 (validKeyInArray!0 (select (arr!45773 a!2938) i!1065)))))

(declare-fun b!1385705 () Bool)

(declare-fun res!926955 () Bool)

(assert (=> b!1385705 (=> (not res!926955) (not e!785119))))

(declare-datatypes ((List!32301 0))(
  ( (Nil!32298) (Cons!32297 (h!33506 (_ BitVec 64)) (t!46995 List!32301)) )
))
(declare-fun arrayNoDuplicates!0 (array!94794 (_ BitVec 32) List!32301) Bool)

(assert (=> b!1385705 (= res!926955 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32298))))

(declare-fun b!1385706 () Bool)

(declare-fun res!926958 () Bool)

(assert (=> b!1385706 (=> (not res!926958) (not e!785119))))

(assert (=> b!1385706 (= res!926958 (and (not (= (select (arr!45773 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45773 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385707 () Bool)

(declare-fun res!926959 () Bool)

(assert (=> b!1385707 (=> (not res!926959) (not e!785119))))

(assert (=> b!1385707 (= res!926959 (validKeyInArray!0 (select (arr!45773 a!2938) startIndex!16)))))

(declare-fun b!1385708 () Bool)

(declare-fun res!926956 () Bool)

(assert (=> b!1385708 (=> (not res!926956) (not e!785119))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94794 (_ BitVec 32)) Bool)

(assert (=> b!1385708 (= res!926956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385709 () Bool)

(declare-fun res!926953 () Bool)

(assert (=> b!1385709 (=> (not res!926953) (not e!785119))))

(assert (=> b!1385709 (= res!926953 (and (= (size!46323 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46323 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46323 a!2938))))))

(declare-fun res!926957 () Bool)

(assert (=> start!118518 (=> (not res!926957) (not e!785119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118518 (= res!926957 (validMask!0 mask!2987))))

(assert (=> start!118518 e!785119))

(assert (=> start!118518 true))

(declare-fun array_inv!34801 (array!94794) Bool)

(assert (=> start!118518 (array_inv!34801 a!2938)))

(assert (= (and start!118518 res!926957) b!1385709))

(assert (= (and b!1385709 res!926953) b!1385704))

(assert (= (and b!1385704 res!926954) b!1385705))

(assert (= (and b!1385705 res!926955) b!1385708))

(assert (= (and b!1385708 res!926956) b!1385706))

(assert (= (and b!1385706 res!926958) b!1385707))

(assert (= (and b!1385707 res!926959) b!1385703))

(declare-fun m!1270989 () Bool)

(assert (=> b!1385705 m!1270989))

(declare-fun m!1270991 () Bool)

(assert (=> b!1385704 m!1270991))

(assert (=> b!1385704 m!1270991))

(declare-fun m!1270993 () Bool)

(assert (=> b!1385704 m!1270993))

(declare-fun m!1270995 () Bool)

(assert (=> b!1385707 m!1270995))

(assert (=> b!1385707 m!1270995))

(declare-fun m!1270997 () Bool)

(assert (=> b!1385707 m!1270997))

(assert (=> b!1385706 m!1270991))

(declare-fun m!1270999 () Bool)

(assert (=> b!1385708 m!1270999))

(declare-fun m!1271001 () Bool)

(assert (=> start!118518 m!1271001))

(declare-fun m!1271003 () Bool)

(assert (=> start!118518 m!1271003))

(push 1)

(assert (not b!1385708))

(assert (not b!1385705))

(assert (not start!118518))

(assert (not b!1385707))

(assert (not b!1385704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

