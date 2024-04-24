; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128362 () Bool)

(assert start!128362)

(declare-fun b!1505978 () Bool)

(declare-fun res!1025592 () Bool)

(declare-fun e!841964 () Bool)

(assert (=> b!1505978 (=> (not res!1025592) (not e!841964))))

(declare-datatypes ((array!100452 0))(
  ( (array!100453 (arr!48476 (Array (_ BitVec 32) (_ BitVec 64))) (size!49027 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100452)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505978 (= res!1025592 (validKeyInArray!0 (select (arr!48476 a!2850) i!996)))))

(declare-fun b!1505979 () Bool)

(declare-fun res!1025591 () Bool)

(assert (=> b!1505979 (=> (not res!1025591) (not e!841964))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12567 0))(
  ( (MissingZero!12567 (index!52660 (_ BitVec 32))) (Found!12567 (index!52661 (_ BitVec 32))) (Intermediate!12567 (undefined!13379 Bool) (index!52662 (_ BitVec 32)) (x!134538 (_ BitVec 32))) (Undefined!12567) (MissingVacant!12567 (index!52663 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100452 (_ BitVec 32)) SeekEntryResult!12567)

(assert (=> b!1505979 (= res!1025591 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48476 a!2850) j!87) a!2850 mask!2661) (Found!12567 j!87)))))

(declare-fun b!1505980 () Bool)

(declare-fun res!1025594 () Bool)

(assert (=> b!1505980 (=> (not res!1025594) (not e!841964))))

(assert (=> b!1505980 (= res!1025594 (validKeyInArray!0 (select (arr!48476 a!2850) j!87)))))

(declare-fun b!1505982 () Bool)

(declare-fun res!1025589 () Bool)

(assert (=> b!1505982 (=> (not res!1025589) (not e!841964))))

(declare-datatypes ((List!34955 0))(
  ( (Nil!34952) (Cons!34951 (h!36363 (_ BitVec 64)) (t!49641 List!34955)) )
))
(declare-fun arrayNoDuplicates!0 (array!100452 (_ BitVec 32) List!34955) Bool)

(assert (=> b!1505982 (= res!1025589 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34952))))

(declare-fun b!1505983 () Bool)

(declare-fun res!1025596 () Bool)

(assert (=> b!1505983 (=> (not res!1025596) (not e!841964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100452 (_ BitVec 32)) Bool)

(assert (=> b!1505983 (= res!1025596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505984 () Bool)

(declare-fun res!1025593 () Bool)

(assert (=> b!1505984 (=> (not res!1025593) (not e!841964))))

(assert (=> b!1505984 (= res!1025593 (not (= (select (arr!48476 a!2850) index!625) (select (arr!48476 a!2850) j!87))))))

(declare-fun b!1505985 () Bool)

(declare-fun res!1025597 () Bool)

(assert (=> b!1505985 (=> (not res!1025597) (not e!841964))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505985 (= res!1025597 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49027 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49027 a!2850)) (= (select (arr!48476 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48476 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49027 a!2850))))))

(declare-fun b!1505986 () Bool)

(assert (=> b!1505986 (= e!841964 false)))

(declare-fun lt!654307 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505986 (= lt!654307 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505981 () Bool)

(declare-fun res!1025595 () Bool)

(assert (=> b!1505981 (=> (not res!1025595) (not e!841964))))

(assert (=> b!1505981 (= res!1025595 (and (= (size!49027 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49027 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49027 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1025590 () Bool)

(assert (=> start!128362 (=> (not res!1025590) (not e!841964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128362 (= res!1025590 (validMask!0 mask!2661))))

(assert (=> start!128362 e!841964))

(assert (=> start!128362 true))

(declare-fun array_inv!37757 (array!100452) Bool)

(assert (=> start!128362 (array_inv!37757 a!2850)))

(assert (= (and start!128362 res!1025590) b!1505981))

(assert (= (and b!1505981 res!1025595) b!1505978))

(assert (= (and b!1505978 res!1025592) b!1505980))

(assert (= (and b!1505980 res!1025594) b!1505983))

(assert (= (and b!1505983 res!1025596) b!1505982))

(assert (= (and b!1505982 res!1025589) b!1505985))

(assert (= (and b!1505985 res!1025597) b!1505979))

(assert (= (and b!1505979 res!1025591) b!1505984))

(assert (= (and b!1505984 res!1025593) b!1505986))

(declare-fun m!1389133 () Bool)

(assert (=> b!1505980 m!1389133))

(assert (=> b!1505980 m!1389133))

(declare-fun m!1389135 () Bool)

(assert (=> b!1505980 m!1389135))

(declare-fun m!1389137 () Bool)

(assert (=> b!1505984 m!1389137))

(assert (=> b!1505984 m!1389133))

(declare-fun m!1389139 () Bool)

(assert (=> b!1505983 m!1389139))

(declare-fun m!1389141 () Bool)

(assert (=> b!1505986 m!1389141))

(assert (=> b!1505979 m!1389133))

(assert (=> b!1505979 m!1389133))

(declare-fun m!1389143 () Bool)

(assert (=> b!1505979 m!1389143))

(declare-fun m!1389145 () Bool)

(assert (=> b!1505985 m!1389145))

(declare-fun m!1389147 () Bool)

(assert (=> b!1505985 m!1389147))

(declare-fun m!1389149 () Bool)

(assert (=> b!1505985 m!1389149))

(declare-fun m!1389151 () Bool)

(assert (=> b!1505978 m!1389151))

(assert (=> b!1505978 m!1389151))

(declare-fun m!1389153 () Bool)

(assert (=> b!1505978 m!1389153))

(declare-fun m!1389155 () Bool)

(assert (=> start!128362 m!1389155))

(declare-fun m!1389157 () Bool)

(assert (=> start!128362 m!1389157))

(declare-fun m!1389159 () Bool)

(assert (=> b!1505982 m!1389159))

(push 1)

(assert (not start!128362))

(assert (not b!1505978))

(assert (not b!1505983))

(assert (not b!1505979))

(assert (not b!1505980))

(assert (not b!1505986))

(assert (not b!1505982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

