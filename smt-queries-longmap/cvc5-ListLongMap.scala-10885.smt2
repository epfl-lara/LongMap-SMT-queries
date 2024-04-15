; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127530 () Bool)

(assert start!127530)

(declare-fun b!1498432 () Bool)

(declare-fun res!1019702 () Bool)

(declare-fun e!838907 () Bool)

(assert (=> b!1498432 (=> (not res!1019702) (not e!838907))))

(declare-datatypes ((array!99905 0))(
  ( (array!99906 (arr!48213 (Array (_ BitVec 32) (_ BitVec 64))) (size!48765 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99905)

(declare-datatypes ((List!34783 0))(
  ( (Nil!34780) (Cons!34779 (h!36177 (_ BitVec 64)) (t!49469 List!34783)) )
))
(declare-fun arrayNoDuplicates!0 (array!99905 (_ BitVec 32) List!34783) Bool)

(assert (=> b!1498432 (= res!1019702 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34780))))

(declare-fun res!1019699 () Bool)

(assert (=> start!127530 (=> (not res!1019699) (not e!838907))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127530 (= res!1019699 (validMask!0 mask!2661))))

(assert (=> start!127530 e!838907))

(assert (=> start!127530 true))

(declare-fun array_inv!37446 (array!99905) Bool)

(assert (=> start!127530 (array_inv!37446 a!2850)))

(declare-fun b!1498433 () Bool)

(assert (=> b!1498433 (= e!838907 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12444 0))(
  ( (MissingZero!12444 (index!52168 (_ BitVec 32))) (Found!12444 (index!52169 (_ BitVec 32))) (Intermediate!12444 (undefined!13256 Bool) (index!52170 (_ BitVec 32)) (x!133865 (_ BitVec 32))) (Undefined!12444) (MissingVacant!12444 (index!52171 (_ BitVec 32))) )
))
(declare-fun lt!652390 () SeekEntryResult!12444)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99905 (_ BitVec 32)) SeekEntryResult!12444)

(assert (=> b!1498433 (= lt!652390 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48213 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498434 () Bool)

(declare-fun res!1019698 () Bool)

(assert (=> b!1498434 (=> (not res!1019698) (not e!838907))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498434 (= res!1019698 (validKeyInArray!0 (select (arr!48213 a!2850) i!996)))))

(declare-fun b!1498435 () Bool)

(declare-fun res!1019696 () Bool)

(assert (=> b!1498435 (=> (not res!1019696) (not e!838907))))

(assert (=> b!1498435 (= res!1019696 (and (= (size!48765 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48765 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48765 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498436 () Bool)

(declare-fun res!1019697 () Bool)

(assert (=> b!1498436 (=> (not res!1019697) (not e!838907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99905 (_ BitVec 32)) Bool)

(assert (=> b!1498436 (= res!1019697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498437 () Bool)

(declare-fun res!1019700 () Bool)

(assert (=> b!1498437 (=> (not res!1019700) (not e!838907))))

(assert (=> b!1498437 (= res!1019700 (validKeyInArray!0 (select (arr!48213 a!2850) j!87)))))

(declare-fun b!1498438 () Bool)

(declare-fun res!1019701 () Bool)

(assert (=> b!1498438 (=> (not res!1019701) (not e!838907))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498438 (= res!1019701 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48765 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48765 a!2850)) (= (select (arr!48213 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48213 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48765 a!2850))))))

(assert (= (and start!127530 res!1019699) b!1498435))

(assert (= (and b!1498435 res!1019696) b!1498434))

(assert (= (and b!1498434 res!1019698) b!1498437))

(assert (= (and b!1498437 res!1019700) b!1498436))

(assert (= (and b!1498436 res!1019697) b!1498432))

(assert (= (and b!1498432 res!1019702) b!1498438))

(assert (= (and b!1498438 res!1019701) b!1498433))

(declare-fun m!1381021 () Bool)

(assert (=> b!1498438 m!1381021))

(declare-fun m!1381023 () Bool)

(assert (=> b!1498438 m!1381023))

(declare-fun m!1381025 () Bool)

(assert (=> b!1498438 m!1381025))

(declare-fun m!1381027 () Bool)

(assert (=> b!1498437 m!1381027))

(assert (=> b!1498437 m!1381027))

(declare-fun m!1381029 () Bool)

(assert (=> b!1498437 m!1381029))

(declare-fun m!1381031 () Bool)

(assert (=> b!1498434 m!1381031))

(assert (=> b!1498434 m!1381031))

(declare-fun m!1381033 () Bool)

(assert (=> b!1498434 m!1381033))

(declare-fun m!1381035 () Bool)

(assert (=> b!1498432 m!1381035))

(declare-fun m!1381037 () Bool)

(assert (=> b!1498436 m!1381037))

(assert (=> b!1498433 m!1381027))

(assert (=> b!1498433 m!1381027))

(declare-fun m!1381039 () Bool)

(assert (=> b!1498433 m!1381039))

(declare-fun m!1381041 () Bool)

(assert (=> start!127530 m!1381041))

(declare-fun m!1381043 () Bool)

(assert (=> start!127530 m!1381043))

(push 1)

(assert (not start!127530))

(assert (not b!1498432))

(assert (not b!1498433))

(assert (not b!1498437))

(assert (not b!1498436))

(assert (not b!1498434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

