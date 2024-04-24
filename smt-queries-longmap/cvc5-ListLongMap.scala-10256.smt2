; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120780 () Bool)

(assert start!120780)

(declare-fun b!1405255 () Bool)

(declare-fun res!943086 () Bool)

(declare-fun e!795670 () Bool)

(assert (=> b!1405255 (=> (not res!943086) (not e!795670))))

(declare-datatypes ((array!96111 0))(
  ( (array!96112 (arr!46404 (Array (_ BitVec 32) (_ BitVec 64))) (size!46955 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96111)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96111 (_ BitVec 32)) Bool)

(assert (=> b!1405255 (= res!943086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405256 () Bool)

(declare-fun res!943082 () Bool)

(assert (=> b!1405256 (=> (not res!943082) (not e!795670))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405256 (= res!943082 (and (= (size!46955 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46955 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46955 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405257 () Bool)

(declare-fun res!943084 () Bool)

(assert (=> b!1405257 (=> (not res!943084) (not e!795670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405257 (= res!943084 (validKeyInArray!0 (select (arr!46404 a!2901) j!112)))))

(declare-fun res!943083 () Bool)

(assert (=> start!120780 (=> (not res!943083) (not e!795670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120780 (= res!943083 (validMask!0 mask!2840))))

(assert (=> start!120780 e!795670))

(assert (=> start!120780 true))

(declare-fun array_inv!35685 (array!96111) Bool)

(assert (=> start!120780 (array_inv!35685 a!2901)))

(declare-fun b!1405258 () Bool)

(declare-fun res!943087 () Bool)

(assert (=> b!1405258 (=> (not res!943087) (not e!795670))))

(declare-datatypes ((List!32910 0))(
  ( (Nil!32907) (Cons!32906 (h!34162 (_ BitVec 64)) (t!47596 List!32910)) )
))
(declare-fun arrayNoDuplicates!0 (array!96111 (_ BitVec 32) List!32910) Bool)

(assert (=> b!1405258 (= res!943087 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32907))))

(declare-fun b!1405259 () Bool)

(declare-fun res!943085 () Bool)

(assert (=> b!1405259 (=> (not res!943085) (not e!795670))))

(assert (=> b!1405259 (= res!943085 (validKeyInArray!0 (select (arr!46404 a!2901) i!1037)))))

(declare-fun b!1405260 () Bool)

(assert (=> b!1405260 (= e!795670 false)))

(declare-fun lt!618989 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405260 (= lt!618989 (toIndex!0 (select (arr!46404 a!2901) j!112) mask!2840))))

(assert (= (and start!120780 res!943083) b!1405256))

(assert (= (and b!1405256 res!943082) b!1405259))

(assert (= (and b!1405259 res!943085) b!1405257))

(assert (= (and b!1405257 res!943084) b!1405255))

(assert (= (and b!1405255 res!943086) b!1405258))

(assert (= (and b!1405258 res!943087) b!1405260))

(declare-fun m!1294291 () Bool)

(assert (=> b!1405255 m!1294291))

(declare-fun m!1294293 () Bool)

(assert (=> b!1405259 m!1294293))

(assert (=> b!1405259 m!1294293))

(declare-fun m!1294295 () Bool)

(assert (=> b!1405259 m!1294295))

(declare-fun m!1294297 () Bool)

(assert (=> b!1405260 m!1294297))

(assert (=> b!1405260 m!1294297))

(declare-fun m!1294299 () Bool)

(assert (=> b!1405260 m!1294299))

(declare-fun m!1294301 () Bool)

(assert (=> start!120780 m!1294301))

(declare-fun m!1294303 () Bool)

(assert (=> start!120780 m!1294303))

(declare-fun m!1294305 () Bool)

(assert (=> b!1405258 m!1294305))

(assert (=> b!1405257 m!1294297))

(assert (=> b!1405257 m!1294297))

(declare-fun m!1294307 () Bool)

(assert (=> b!1405257 m!1294307))

(push 1)

(assert (not b!1405260))

(assert (not b!1405258))

(assert (not start!120780))

(assert (not b!1405255))

(assert (not b!1405259))

(assert (not b!1405257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

