; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119638 () Bool)

(assert start!119638)

(declare-fun b!1393595 () Bool)

(declare-fun e!789096 () Bool)

(declare-fun e!789097 () Bool)

(assert (=> b!1393595 (= e!789096 (not e!789097))))

(declare-fun res!933007 () Bool)

(assert (=> b!1393595 (=> res!933007 e!789097)))

(declare-datatypes ((SeekEntryResult!10335 0))(
  ( (MissingZero!10335 (index!43711 (_ BitVec 32))) (Found!10335 (index!43712 (_ BitVec 32))) (Intermediate!10335 (undefined!11147 Bool) (index!43713 (_ BitVec 32)) (x!125387 (_ BitVec 32))) (Undefined!10335) (MissingVacant!10335 (index!43714 (_ BitVec 32))) )
))
(declare-fun lt!612051 () SeekEntryResult!10335)

(assert (=> b!1393595 (= res!933007 (or (not (is-Intermediate!10335 lt!612051)) (undefined!11147 lt!612051)))))

(declare-fun e!789095 () Bool)

(assert (=> b!1393595 e!789095))

(declare-fun res!933003 () Bool)

(assert (=> b!1393595 (=> (not res!933003) (not e!789095))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95320 0))(
  ( (array!95321 (arr!46018 (Array (_ BitVec 32) (_ BitVec 64))) (size!46568 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95320)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95320 (_ BitVec 32)) Bool)

(assert (=> b!1393595 (= res!933003 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46674 0))(
  ( (Unit!46675) )
))
(declare-fun lt!612050 () Unit!46674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46674)

(assert (=> b!1393595 (= lt!612050 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95320 (_ BitVec 32)) SeekEntryResult!10335)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393595 (= lt!612051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46018 a!2901) j!112) mask!2840) (select (arr!46018 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393596 () Bool)

(declare-fun res!933004 () Bool)

(assert (=> b!1393596 (=> (not res!933004) (not e!789096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393596 (= res!933004 (validKeyInArray!0 (select (arr!46018 a!2901) j!112)))))

(declare-fun b!1393597 () Bool)

(declare-fun res!933006 () Bool)

(assert (=> b!1393597 (=> (not res!933006) (not e!789096))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393597 (= res!933006 (validKeyInArray!0 (select (arr!46018 a!2901) i!1037)))))

(declare-fun b!1393598 () Bool)

(declare-fun res!933009 () Bool)

(assert (=> b!1393598 (=> (not res!933009) (not e!789096))))

(assert (=> b!1393598 (= res!933009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393599 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95320 (_ BitVec 32)) SeekEntryResult!10335)

(assert (=> b!1393599 (= e!789095 (= (seekEntryOrOpen!0 (select (arr!46018 a!2901) j!112) a!2901 mask!2840) (Found!10335 j!112)))))

(declare-fun b!1393600 () Bool)

(assert (=> b!1393600 (= e!789097 true)))

(declare-fun lt!612049 () SeekEntryResult!10335)

(assert (=> b!1393600 (= lt!612049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46018 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46018 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95321 (store (arr!46018 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46568 a!2901)) mask!2840))))

(declare-fun b!1393601 () Bool)

(declare-fun res!933005 () Bool)

(assert (=> b!1393601 (=> (not res!933005) (not e!789096))))

(assert (=> b!1393601 (= res!933005 (and (= (size!46568 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46568 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46568 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!933008 () Bool)

(assert (=> start!119638 (=> (not res!933008) (not e!789096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119638 (= res!933008 (validMask!0 mask!2840))))

(assert (=> start!119638 e!789096))

(assert (=> start!119638 true))

(declare-fun array_inv!35046 (array!95320) Bool)

(assert (=> start!119638 (array_inv!35046 a!2901)))

(declare-fun b!1393602 () Bool)

(declare-fun res!933010 () Bool)

(assert (=> b!1393602 (=> (not res!933010) (not e!789096))))

(declare-datatypes ((List!32537 0))(
  ( (Nil!32534) (Cons!32533 (h!33766 (_ BitVec 64)) (t!47231 List!32537)) )
))
(declare-fun arrayNoDuplicates!0 (array!95320 (_ BitVec 32) List!32537) Bool)

(assert (=> b!1393602 (= res!933010 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32534))))

(assert (= (and start!119638 res!933008) b!1393601))

(assert (= (and b!1393601 res!933005) b!1393597))

(assert (= (and b!1393597 res!933006) b!1393596))

(assert (= (and b!1393596 res!933004) b!1393598))

(assert (= (and b!1393598 res!933009) b!1393602))

(assert (= (and b!1393602 res!933010) b!1393595))

(assert (= (and b!1393595 res!933003) b!1393599))

(assert (= (and b!1393595 (not res!933007)) b!1393600))

(declare-fun m!1279571 () Bool)

(assert (=> b!1393595 m!1279571))

(declare-fun m!1279573 () Bool)

(assert (=> b!1393595 m!1279573))

(assert (=> b!1393595 m!1279571))

(declare-fun m!1279575 () Bool)

(assert (=> b!1393595 m!1279575))

(assert (=> b!1393595 m!1279573))

(assert (=> b!1393595 m!1279571))

(declare-fun m!1279577 () Bool)

(assert (=> b!1393595 m!1279577))

(declare-fun m!1279579 () Bool)

(assert (=> b!1393595 m!1279579))

(declare-fun m!1279581 () Bool)

(assert (=> b!1393598 m!1279581))

(assert (=> b!1393596 m!1279571))

(assert (=> b!1393596 m!1279571))

(declare-fun m!1279583 () Bool)

(assert (=> b!1393596 m!1279583))

(declare-fun m!1279585 () Bool)

(assert (=> b!1393602 m!1279585))

(assert (=> b!1393599 m!1279571))

(assert (=> b!1393599 m!1279571))

(declare-fun m!1279587 () Bool)

(assert (=> b!1393599 m!1279587))

(declare-fun m!1279589 () Bool)

(assert (=> b!1393600 m!1279589))

(declare-fun m!1279591 () Bool)

(assert (=> b!1393600 m!1279591))

(assert (=> b!1393600 m!1279591))

(declare-fun m!1279593 () Bool)

(assert (=> b!1393600 m!1279593))

(assert (=> b!1393600 m!1279593))

(assert (=> b!1393600 m!1279591))

(declare-fun m!1279595 () Bool)

(assert (=> b!1393600 m!1279595))

(declare-fun m!1279597 () Bool)

(assert (=> start!119638 m!1279597))

(declare-fun m!1279599 () Bool)

(assert (=> start!119638 m!1279599))

(declare-fun m!1279601 () Bool)

(assert (=> b!1393597 m!1279601))

(assert (=> b!1393597 m!1279601))

(declare-fun m!1279603 () Bool)

(assert (=> b!1393597 m!1279603))

(push 1)

(assert (not b!1393600))

(assert (not b!1393595))

(assert (not b!1393596))

(assert (not b!1393598))

(assert (not b!1393602))

(assert (not b!1393597))

(assert (not start!119638))

(assert (not b!1393599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

