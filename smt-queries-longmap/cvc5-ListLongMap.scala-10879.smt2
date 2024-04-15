; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127494 () Bool)

(assert start!127494)

(declare-fun res!1019323 () Bool)

(declare-fun e!838800 () Bool)

(assert (=> start!127494 (=> (not res!1019323) (not e!838800))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127494 (= res!1019323 (validMask!0 mask!2661))))

(assert (=> start!127494 e!838800))

(assert (=> start!127494 true))

(declare-datatypes ((array!99869 0))(
  ( (array!99870 (arr!48195 (Array (_ BitVec 32) (_ BitVec 64))) (size!48747 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99869)

(declare-fun array_inv!37428 (array!99869) Bool)

(assert (=> start!127494 (array_inv!37428 a!2850)))

(declare-fun b!1498056 () Bool)

(declare-fun res!1019320 () Bool)

(assert (=> b!1498056 (=> (not res!1019320) (not e!838800))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498056 (= res!1019320 (and (= (size!48747 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48747 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48747 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498057 () Bool)

(declare-fun res!1019324 () Bool)

(assert (=> b!1498057 (=> (not res!1019324) (not e!838800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498057 (= res!1019324 (validKeyInArray!0 (select (arr!48195 a!2850) j!87)))))

(declare-fun b!1498058 () Bool)

(declare-fun res!1019321 () Bool)

(assert (=> b!1498058 (=> (not res!1019321) (not e!838800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99869 (_ BitVec 32)) Bool)

(assert (=> b!1498058 (= res!1019321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498059 () Bool)

(declare-fun res!1019322 () Bool)

(assert (=> b!1498059 (=> (not res!1019322) (not e!838800))))

(assert (=> b!1498059 (= res!1019322 (validKeyInArray!0 (select (arr!48195 a!2850) i!996)))))

(declare-fun b!1498060 () Bool)

(assert (=> b!1498060 (= e!838800 false)))

(declare-fun lt!652354 () Bool)

(declare-datatypes ((List!34765 0))(
  ( (Nil!34762) (Cons!34761 (h!36159 (_ BitVec 64)) (t!49451 List!34765)) )
))
(declare-fun arrayNoDuplicates!0 (array!99869 (_ BitVec 32) List!34765) Bool)

(assert (=> b!1498060 (= lt!652354 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34762))))

(assert (= (and start!127494 res!1019323) b!1498056))

(assert (= (and b!1498056 res!1019320) b!1498059))

(assert (= (and b!1498059 res!1019322) b!1498057))

(assert (= (and b!1498057 res!1019324) b!1498058))

(assert (= (and b!1498058 res!1019321) b!1498060))

(declare-fun m!1380609 () Bool)

(assert (=> b!1498057 m!1380609))

(assert (=> b!1498057 m!1380609))

(declare-fun m!1380611 () Bool)

(assert (=> b!1498057 m!1380611))

(declare-fun m!1380613 () Bool)

(assert (=> b!1498059 m!1380613))

(assert (=> b!1498059 m!1380613))

(declare-fun m!1380615 () Bool)

(assert (=> b!1498059 m!1380615))

(declare-fun m!1380617 () Bool)

(assert (=> b!1498058 m!1380617))

(declare-fun m!1380619 () Bool)

(assert (=> b!1498060 m!1380619))

(declare-fun m!1380621 () Bool)

(assert (=> start!127494 m!1380621))

(declare-fun m!1380623 () Bool)

(assert (=> start!127494 m!1380623))

(push 1)

(assert (not b!1498057))

(assert (not b!1498059))

(assert (not b!1498060))

(assert (not b!1498058))

(assert (not start!127494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

