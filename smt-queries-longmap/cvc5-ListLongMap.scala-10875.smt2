; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127512 () Bool)

(assert start!127512)

(declare-fun b!1498144 () Bool)

(declare-fun res!1019223 () Bool)

(declare-fun e!838915 () Bool)

(assert (=> b!1498144 (=> (not res!1019223) (not e!838915))))

(declare-datatypes ((array!99893 0))(
  ( (array!99894 (arr!48206 (Array (_ BitVec 32) (_ BitVec 64))) (size!48756 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99893)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498144 (= res!1019223 (validKeyInArray!0 (select (arr!48206 a!2850) i!996)))))

(declare-fun b!1498145 () Bool)

(assert (=> b!1498145 (= e!838915 false)))

(declare-fun lt!652609 () Bool)

(declare-datatypes ((List!34698 0))(
  ( (Nil!34695) (Cons!34694 (h!36091 (_ BitVec 64)) (t!49392 List!34698)) )
))
(declare-fun arrayNoDuplicates!0 (array!99893 (_ BitVec 32) List!34698) Bool)

(assert (=> b!1498145 (= lt!652609 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34695))))

(declare-fun res!1019224 () Bool)

(assert (=> start!127512 (=> (not res!1019224) (not e!838915))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127512 (= res!1019224 (validMask!0 mask!2661))))

(assert (=> start!127512 e!838915))

(assert (=> start!127512 true))

(declare-fun array_inv!37234 (array!99893) Bool)

(assert (=> start!127512 (array_inv!37234 a!2850)))

(declare-fun b!1498146 () Bool)

(declare-fun res!1019220 () Bool)

(assert (=> b!1498146 (=> (not res!1019220) (not e!838915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99893 (_ BitVec 32)) Bool)

(assert (=> b!1498146 (= res!1019220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498147 () Bool)

(declare-fun res!1019221 () Bool)

(assert (=> b!1498147 (=> (not res!1019221) (not e!838915))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498147 (= res!1019221 (validKeyInArray!0 (select (arr!48206 a!2850) j!87)))))

(declare-fun b!1498148 () Bool)

(declare-fun res!1019222 () Bool)

(assert (=> b!1498148 (=> (not res!1019222) (not e!838915))))

(assert (=> b!1498148 (= res!1019222 (and (= (size!48756 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48756 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48756 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127512 res!1019224) b!1498148))

(assert (= (and b!1498148 res!1019222) b!1498144))

(assert (= (and b!1498144 res!1019223) b!1498147))

(assert (= (and b!1498147 res!1019221) b!1498146))

(assert (= (and b!1498146 res!1019220) b!1498145))

(declare-fun m!1381219 () Bool)

(assert (=> start!127512 m!1381219))

(declare-fun m!1381221 () Bool)

(assert (=> start!127512 m!1381221))

(declare-fun m!1381223 () Bool)

(assert (=> b!1498146 m!1381223))

(declare-fun m!1381225 () Bool)

(assert (=> b!1498145 m!1381225))

(declare-fun m!1381227 () Bool)

(assert (=> b!1498147 m!1381227))

(assert (=> b!1498147 m!1381227))

(declare-fun m!1381229 () Bool)

(assert (=> b!1498147 m!1381229))

(declare-fun m!1381231 () Bool)

(assert (=> b!1498144 m!1381231))

(assert (=> b!1498144 m!1381231))

(declare-fun m!1381233 () Bool)

(assert (=> b!1498144 m!1381233))

(push 1)

(assert (not b!1498146))

(assert (not b!1498145))

(assert (not b!1498144))

(assert (not start!127512))

(assert (not b!1498147))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

