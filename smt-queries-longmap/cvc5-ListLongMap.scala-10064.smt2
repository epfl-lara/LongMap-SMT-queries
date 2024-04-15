; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118518 () Bool)

(assert start!118518)

(declare-fun b!1385676 () Bool)

(declare-fun res!926972 () Bool)

(declare-fun e!785100 () Bool)

(assert (=> b!1385676 (=> (not res!926972) (not e!785100))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94747 0))(
  ( (array!94748 (arr!45750 (Array (_ BitVec 32) (_ BitVec 64))) (size!46302 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94747)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385676 (= res!926972 (and (not (= (select (arr!45750 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45750 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385677 () Bool)

(assert (=> b!1385677 (= e!785100 (= i!1065 startIndex!16))))

(declare-fun b!1385678 () Bool)

(declare-fun res!926973 () Bool)

(assert (=> b!1385678 (=> (not res!926973) (not e!785100))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94747 (_ BitVec 32)) Bool)

(assert (=> b!1385678 (= res!926973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926975 () Bool)

(assert (=> start!118518 (=> (not res!926975) (not e!785100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118518 (= res!926975 (validMask!0 mask!2987))))

(assert (=> start!118518 e!785100))

(assert (=> start!118518 true))

(declare-fun array_inv!34983 (array!94747) Bool)

(assert (=> start!118518 (array_inv!34983 a!2938)))

(declare-fun b!1385679 () Bool)

(declare-fun res!926969 () Bool)

(assert (=> b!1385679 (=> (not res!926969) (not e!785100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385679 (= res!926969 (validKeyInArray!0 (select (arr!45750 a!2938) i!1065)))))

(declare-fun b!1385680 () Bool)

(declare-fun res!926970 () Bool)

(assert (=> b!1385680 (=> (not res!926970) (not e!785100))))

(declare-datatypes ((List!32356 0))(
  ( (Nil!32353) (Cons!32352 (h!33561 (_ BitVec 64)) (t!47042 List!32356)) )
))
(declare-fun arrayNoDuplicates!0 (array!94747 (_ BitVec 32) List!32356) Bool)

(assert (=> b!1385680 (= res!926970 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32353))))

(declare-fun b!1385681 () Bool)

(declare-fun res!926971 () Bool)

(assert (=> b!1385681 (=> (not res!926971) (not e!785100))))

(assert (=> b!1385681 (= res!926971 (and (= (size!46302 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46302 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46302 a!2938))))))

(declare-fun b!1385682 () Bool)

(declare-fun res!926974 () Bool)

(assert (=> b!1385682 (=> (not res!926974) (not e!785100))))

(assert (=> b!1385682 (= res!926974 (validKeyInArray!0 (select (arr!45750 a!2938) startIndex!16)))))

(assert (= (and start!118518 res!926975) b!1385681))

(assert (= (and b!1385681 res!926971) b!1385679))

(assert (= (and b!1385679 res!926969) b!1385680))

(assert (= (and b!1385680 res!926970) b!1385678))

(assert (= (and b!1385678 res!926973) b!1385676))

(assert (= (and b!1385676 res!926972) b!1385682))

(assert (= (and b!1385682 res!926974) b!1385677))

(declare-fun m!1270517 () Bool)

(assert (=> b!1385679 m!1270517))

(assert (=> b!1385679 m!1270517))

(declare-fun m!1270519 () Bool)

(assert (=> b!1385679 m!1270519))

(assert (=> b!1385676 m!1270517))

(declare-fun m!1270521 () Bool)

(assert (=> b!1385682 m!1270521))

(assert (=> b!1385682 m!1270521))

(declare-fun m!1270523 () Bool)

(assert (=> b!1385682 m!1270523))

(declare-fun m!1270525 () Bool)

(assert (=> b!1385678 m!1270525))

(declare-fun m!1270527 () Bool)

(assert (=> b!1385680 m!1270527))

(declare-fun m!1270529 () Bool)

(assert (=> start!118518 m!1270529))

(declare-fun m!1270531 () Bool)

(assert (=> start!118518 m!1270531))

(push 1)

(assert (not b!1385680))

(assert (not start!118518))

(assert (not b!1385679))

(assert (not b!1385682))

(assert (not b!1385678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

