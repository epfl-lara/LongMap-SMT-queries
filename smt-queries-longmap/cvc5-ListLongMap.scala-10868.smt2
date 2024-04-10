; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127380 () Bool)

(assert start!127380)

(declare-fun b!1497626 () Bool)

(declare-fun e!838638 () Bool)

(declare-datatypes ((array!99842 0))(
  ( (array!99843 (arr!48185 (Array (_ BitVec 32) (_ BitVec 64))) (size!48735 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99842)

(assert (=> b!1497626 (= e!838638 (bvsgt #b00000000000000000000000000000000 (size!48735 a!2850)))))

(declare-fun b!1497624 () Bool)

(declare-fun res!1018756 () Bool)

(assert (=> b!1497624 (=> (not res!1018756) (not e!838638))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497624 (= res!1018756 (validKeyInArray!0 (select (arr!48185 a!2850) i!996)))))

(declare-fun b!1497625 () Bool)

(declare-fun res!1018753 () Bool)

(assert (=> b!1497625 (=> (not res!1018753) (not e!838638))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497625 (= res!1018753 (validKeyInArray!0 (select (arr!48185 a!2850) j!87)))))

(declare-fun b!1497623 () Bool)

(declare-fun res!1018755 () Bool)

(assert (=> b!1497623 (=> (not res!1018755) (not e!838638))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1497623 (= res!1018755 (and (= (size!48735 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48735 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48735 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1018754 () Bool)

(assert (=> start!127380 (=> (not res!1018754) (not e!838638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127380 (= res!1018754 (validMask!0 mask!2661))))

(assert (=> start!127380 e!838638))

(assert (=> start!127380 true))

(declare-fun array_inv!37213 (array!99842) Bool)

(assert (=> start!127380 (array_inv!37213 a!2850)))

(assert (= (and start!127380 res!1018754) b!1497623))

(assert (= (and b!1497623 res!1018755) b!1497624))

(assert (= (and b!1497624 res!1018756) b!1497625))

(assert (= (and b!1497625 res!1018753) b!1497626))

(declare-fun m!1380715 () Bool)

(assert (=> b!1497624 m!1380715))

(assert (=> b!1497624 m!1380715))

(declare-fun m!1380717 () Bool)

(assert (=> b!1497624 m!1380717))

(declare-fun m!1380719 () Bool)

(assert (=> b!1497625 m!1380719))

(assert (=> b!1497625 m!1380719))

(declare-fun m!1380721 () Bool)

(assert (=> b!1497625 m!1380721))

(declare-fun m!1380723 () Bool)

(assert (=> start!127380 m!1380723))

(declare-fun m!1380725 () Bool)

(assert (=> start!127380 m!1380725))

(push 1)

(assert (not b!1497625))

(assert (not start!127380))

(assert (not b!1497624))

