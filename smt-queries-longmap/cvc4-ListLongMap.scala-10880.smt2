; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127812 () Bool)

(assert start!127812)

(declare-fun b!1500108 () Bool)

(declare-fun res!1020088 () Bool)

(declare-fun e!840069 () Bool)

(assert (=> b!1500108 (=> (not res!1020088) (not e!840069))))

(declare-datatypes ((array!100038 0))(
  ( (array!100039 (arr!48275 (Array (_ BitVec 32) (_ BitVec 64))) (size!48826 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100038)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500108 (= res!1020088 (validKeyInArray!0 (select (arr!48275 a!2850) i!996)))))

(declare-fun b!1500109 () Bool)

(assert (=> b!1500109 (= e!840069 false)))

(declare-fun lt!653277 () Bool)

(declare-datatypes ((List!34754 0))(
  ( (Nil!34751) (Cons!34750 (h!36162 (_ BitVec 64)) (t!49440 List!34754)) )
))
(declare-fun arrayNoDuplicates!0 (array!100038 (_ BitVec 32) List!34754) Bool)

(assert (=> b!1500109 (= lt!653277 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34751))))

(declare-fun b!1500110 () Bool)

(declare-fun res!1020089 () Bool)

(assert (=> b!1500110 (=> (not res!1020089) (not e!840069))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500110 (= res!1020089 (and (= (size!48826 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48826 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48826 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500111 () Bool)

(declare-fun res!1020087 () Bool)

(assert (=> b!1500111 (=> (not res!1020087) (not e!840069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100038 (_ BitVec 32)) Bool)

(assert (=> b!1500111 (= res!1020087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1020086 () Bool)

(assert (=> start!127812 (=> (not res!1020086) (not e!840069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127812 (= res!1020086 (validMask!0 mask!2661))))

(assert (=> start!127812 e!840069))

(assert (=> start!127812 true))

(declare-fun array_inv!37556 (array!100038) Bool)

(assert (=> start!127812 (array_inv!37556 a!2850)))

(declare-fun b!1500112 () Bool)

(declare-fun res!1020085 () Bool)

(assert (=> b!1500112 (=> (not res!1020085) (not e!840069))))

(assert (=> b!1500112 (= res!1020085 (validKeyInArray!0 (select (arr!48275 a!2850) j!87)))))

(assert (= (and start!127812 res!1020086) b!1500110))

(assert (= (and b!1500110 res!1020089) b!1500108))

(assert (= (and b!1500108 res!1020088) b!1500112))

(assert (= (and b!1500112 res!1020085) b!1500111))

(assert (= (and b!1500111 res!1020087) b!1500109))

(declare-fun m!1383237 () Bool)

(assert (=> b!1500109 m!1383237))

(declare-fun m!1383239 () Bool)

(assert (=> b!1500108 m!1383239))

(assert (=> b!1500108 m!1383239))

(declare-fun m!1383241 () Bool)

(assert (=> b!1500108 m!1383241))

(declare-fun m!1383243 () Bool)

(assert (=> b!1500111 m!1383243))

(declare-fun m!1383245 () Bool)

(assert (=> start!127812 m!1383245))

(declare-fun m!1383247 () Bool)

(assert (=> start!127812 m!1383247))

(declare-fun m!1383249 () Bool)

(assert (=> b!1500112 m!1383249))

(assert (=> b!1500112 m!1383249))

(declare-fun m!1383251 () Bool)

(assert (=> b!1500112 m!1383251))

(push 1)

(assert (not b!1500111))

(assert (not b!1500112))

(assert (not start!127812))

(assert (not b!1500108))

(assert (not b!1500109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

