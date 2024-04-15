; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127542 () Bool)

(assert start!127542)

(declare-fun b!1498567 () Bool)

(declare-fun res!1019835 () Bool)

(declare-fun e!838943 () Bool)

(assert (=> b!1498567 (=> (not res!1019835) (not e!838943))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99917 0))(
  ( (array!99918 (arr!48219 (Array (_ BitVec 32) (_ BitVec 64))) (size!48771 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99917)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498567 (= res!1019835 (and (= (size!48771 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48771 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48771 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498568 () Bool)

(declare-fun res!1019832 () Bool)

(assert (=> b!1498568 (=> (not res!1019832) (not e!838943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498568 (= res!1019832 (validKeyInArray!0 (select (arr!48219 a!2850) i!996)))))

(declare-fun b!1498569 () Bool)

(declare-fun res!1019834 () Bool)

(assert (=> b!1498569 (=> (not res!1019834) (not e!838943))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498569 (= res!1019834 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48771 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48771 a!2850)) (= (select (arr!48219 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48219 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48771 a!2850))))))

(declare-fun b!1498570 () Bool)

(declare-fun res!1019833 () Bool)

(assert (=> b!1498570 (=> (not res!1019833) (not e!838943))))

(declare-datatypes ((List!34789 0))(
  ( (Nil!34786) (Cons!34785 (h!36183 (_ BitVec 64)) (t!49475 List!34789)) )
))
(declare-fun arrayNoDuplicates!0 (array!99917 (_ BitVec 32) List!34789) Bool)

(assert (=> b!1498570 (= res!1019833 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34786))))

(declare-fun b!1498571 () Bool)

(assert (=> b!1498571 (= e!838943 false)))

(declare-datatypes ((SeekEntryResult!12450 0))(
  ( (MissingZero!12450 (index!52192 (_ BitVec 32))) (Found!12450 (index!52193 (_ BitVec 32))) (Intermediate!12450 (undefined!13262 Bool) (index!52194 (_ BitVec 32)) (x!133887 (_ BitVec 32))) (Undefined!12450) (MissingVacant!12450 (index!52195 (_ BitVec 32))) )
))
(declare-fun lt!652399 () SeekEntryResult!12450)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99917 (_ BitVec 32)) SeekEntryResult!12450)

(assert (=> b!1498571 (= lt!652399 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48219 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1019836 () Bool)

(assert (=> start!127542 (=> (not res!1019836) (not e!838943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127542 (= res!1019836 (validMask!0 mask!2661))))

(assert (=> start!127542 e!838943))

(assert (=> start!127542 true))

(declare-fun array_inv!37452 (array!99917) Bool)

(assert (=> start!127542 (array_inv!37452 a!2850)))

(declare-fun b!1498572 () Bool)

(declare-fun res!1019831 () Bool)

(assert (=> b!1498572 (=> (not res!1019831) (not e!838943))))

(assert (=> b!1498572 (= res!1019831 (validKeyInArray!0 (select (arr!48219 a!2850) j!87)))))

(declare-fun b!1498573 () Bool)

(declare-fun res!1019837 () Bool)

(assert (=> b!1498573 (=> (not res!1019837) (not e!838943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99917 (_ BitVec 32)) Bool)

(assert (=> b!1498573 (= res!1019837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127542 res!1019836) b!1498567))

(assert (= (and b!1498567 res!1019835) b!1498568))

(assert (= (and b!1498568 res!1019832) b!1498572))

(assert (= (and b!1498572 res!1019831) b!1498573))

(assert (= (and b!1498573 res!1019837) b!1498570))

(assert (= (and b!1498570 res!1019833) b!1498569))

(assert (= (and b!1498569 res!1019834) b!1498571))

(declare-fun m!1381171 () Bool)

(assert (=> start!127542 m!1381171))

(declare-fun m!1381173 () Bool)

(assert (=> start!127542 m!1381173))

(declare-fun m!1381175 () Bool)

(assert (=> b!1498569 m!1381175))

(declare-fun m!1381177 () Bool)

(assert (=> b!1498569 m!1381177))

(declare-fun m!1381179 () Bool)

(assert (=> b!1498569 m!1381179))

(declare-fun m!1381181 () Bool)

(assert (=> b!1498568 m!1381181))

(assert (=> b!1498568 m!1381181))

(declare-fun m!1381183 () Bool)

(assert (=> b!1498568 m!1381183))

(declare-fun m!1381185 () Bool)

(assert (=> b!1498571 m!1381185))

(assert (=> b!1498571 m!1381185))

(declare-fun m!1381187 () Bool)

(assert (=> b!1498571 m!1381187))

(assert (=> b!1498572 m!1381185))

(assert (=> b!1498572 m!1381185))

(declare-fun m!1381189 () Bool)

(assert (=> b!1498572 m!1381189))

(declare-fun m!1381191 () Bool)

(assert (=> b!1498570 m!1381191))

(declare-fun m!1381193 () Bool)

(assert (=> b!1498573 m!1381193))

(push 1)

(assert (not b!1498572))

(assert (not b!1498573))

(assert (not b!1498568))

(assert (not start!127542))

(assert (not b!1498571))

(assert (not b!1498570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

