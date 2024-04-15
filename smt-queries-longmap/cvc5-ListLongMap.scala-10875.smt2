; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127470 () Bool)

(assert start!127470)

(declare-fun b!1497858 () Bool)

(declare-fun res!1019126 () Bool)

(declare-fun e!838727 () Bool)

(assert (=> b!1497858 (=> (not res!1019126) (not e!838727))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99845 0))(
  ( (array!99846 (arr!48183 (Array (_ BitVec 32) (_ BitVec 64))) (size!48735 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99845)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497858 (= res!1019126 (and (= (size!48735 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48735 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48735 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019123 () Bool)

(assert (=> start!127470 (=> (not res!1019123) (not e!838727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127470 (= res!1019123 (validMask!0 mask!2661))))

(assert (=> start!127470 e!838727))

(assert (=> start!127470 true))

(declare-fun array_inv!37416 (array!99845) Bool)

(assert (=> start!127470 (array_inv!37416 a!2850)))

(declare-fun b!1497859 () Bool)

(declare-fun res!1019124 () Bool)

(assert (=> b!1497859 (=> (not res!1019124) (not e!838727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497859 (= res!1019124 (validKeyInArray!0 (select (arr!48183 a!2850) j!87)))))

(declare-fun b!1497860 () Bool)

(declare-fun res!1019125 () Bool)

(assert (=> b!1497860 (=> (not res!1019125) (not e!838727))))

(assert (=> b!1497860 (= res!1019125 (validKeyInArray!0 (select (arr!48183 a!2850) i!996)))))

(declare-fun b!1497861 () Bool)

(assert (=> b!1497861 (= e!838727 false)))

(declare-fun lt!652336 () Bool)

(declare-datatypes ((List!34753 0))(
  ( (Nil!34750) (Cons!34749 (h!36147 (_ BitVec 64)) (t!49439 List!34753)) )
))
(declare-fun arrayNoDuplicates!0 (array!99845 (_ BitVec 32) List!34753) Bool)

(assert (=> b!1497861 (= lt!652336 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34750))))

(declare-fun b!1497862 () Bool)

(declare-fun res!1019122 () Bool)

(assert (=> b!1497862 (=> (not res!1019122) (not e!838727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99845 (_ BitVec 32)) Bool)

(assert (=> b!1497862 (= res!1019122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127470 res!1019123) b!1497858))

(assert (= (and b!1497858 res!1019126) b!1497860))

(assert (= (and b!1497860 res!1019125) b!1497859))

(assert (= (and b!1497859 res!1019124) b!1497862))

(assert (= (and b!1497862 res!1019122) b!1497861))

(declare-fun m!1380381 () Bool)

(assert (=> b!1497859 m!1380381))

(assert (=> b!1497859 m!1380381))

(declare-fun m!1380383 () Bool)

(assert (=> b!1497859 m!1380383))

(declare-fun m!1380385 () Bool)

(assert (=> start!127470 m!1380385))

(declare-fun m!1380387 () Bool)

(assert (=> start!127470 m!1380387))

(declare-fun m!1380389 () Bool)

(assert (=> b!1497860 m!1380389))

(assert (=> b!1497860 m!1380389))

(declare-fun m!1380391 () Bool)

(assert (=> b!1497860 m!1380391))

(declare-fun m!1380393 () Bool)

(assert (=> b!1497862 m!1380393))

(declare-fun m!1380395 () Bool)

(assert (=> b!1497861 m!1380395))

(push 1)

(assert (not b!1497862))

(assert (not b!1497860))

(assert (not start!127470))

(assert (not b!1497859))

(assert (not b!1497861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

