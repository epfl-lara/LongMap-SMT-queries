; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128254 () Bool)

(assert start!128254)

(declare-fun b!1505500 () Bool)

(declare-fun res!1025948 () Bool)

(declare-fun e!841447 () Bool)

(assert (=> b!1505500 (=> (not res!1025948) (not e!841447))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100407 0))(
  ( (array!100408 (arr!48454 (Array (_ BitVec 32) (_ BitVec 64))) (size!49004 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100407)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1505500 (= res!1025948 (and (= (size!49004 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49004 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49004 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1025947 () Bool)

(assert (=> start!128254 (=> (not res!1025947) (not e!841447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128254 (= res!1025947 (validMask!0 mask!2512))))

(assert (=> start!128254 e!841447))

(assert (=> start!128254 true))

(declare-fun array_inv!37482 (array!100407) Bool)

(assert (=> start!128254 (array_inv!37482 a!2804)))

(declare-fun b!1505501 () Bool)

(assert (=> b!1505501 (= e!841447 (bvsgt #b00000000000000000000000000000000 (size!49004 a!2804)))))

(declare-fun b!1505502 () Bool)

(declare-fun res!1025946 () Bool)

(assert (=> b!1505502 (=> (not res!1025946) (not e!841447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505502 (= res!1025946 (validKeyInArray!0 (select (arr!48454 a!2804) i!961)))))

(declare-fun b!1505503 () Bool)

(declare-fun res!1025950 () Bool)

(assert (=> b!1505503 (=> (not res!1025950) (not e!841447))))

(assert (=> b!1505503 (= res!1025950 (validKeyInArray!0 (select (arr!48454 a!2804) j!70)))))

(declare-fun b!1505504 () Bool)

(declare-fun res!1025949 () Bool)

(assert (=> b!1505504 (=> (not res!1025949) (not e!841447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100407 (_ BitVec 32)) Bool)

(assert (=> b!1505504 (= res!1025949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128254 res!1025947) b!1505500))

(assert (= (and b!1505500 res!1025948) b!1505502))

(assert (= (and b!1505502 res!1025946) b!1505503))

(assert (= (and b!1505503 res!1025950) b!1505504))

(assert (= (and b!1505504 res!1025949) b!1505501))

(declare-fun m!1388597 () Bool)

(assert (=> start!128254 m!1388597))

(declare-fun m!1388599 () Bool)

(assert (=> start!128254 m!1388599))

(declare-fun m!1388601 () Bool)

(assert (=> b!1505502 m!1388601))

(assert (=> b!1505502 m!1388601))

(declare-fun m!1388603 () Bool)

(assert (=> b!1505502 m!1388603))

(declare-fun m!1388605 () Bool)

(assert (=> b!1505503 m!1388605))

(assert (=> b!1505503 m!1388605))

(declare-fun m!1388607 () Bool)

(assert (=> b!1505503 m!1388607))

(declare-fun m!1388609 () Bool)

(assert (=> b!1505504 m!1388609))

(push 1)

(assert (not b!1505502))

(assert (not start!128254))

(assert (not b!1505504))

(assert (not b!1505503))

(check-sat)

(pop 1)

