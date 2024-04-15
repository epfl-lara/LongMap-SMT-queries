; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121134 () Bool)

(assert start!121134)

(declare-fun b!1408421 () Bool)

(declare-fun res!946201 () Bool)

(declare-fun e!797089 () Bool)

(assert (=> b!1408421 (=> (not res!946201) (not e!797089))))

(declare-datatypes ((array!96241 0))(
  ( (array!96242 (arr!46464 (Array (_ BitVec 32) (_ BitVec 64))) (size!47016 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96241)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96241 (_ BitVec 32)) Bool)

(assert (=> b!1408421 (= res!946201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408422 () Bool)

(declare-fun res!946200 () Bool)

(assert (=> b!1408422 (=> (not res!946200) (not e!797089))))

(declare-datatypes ((List!33061 0))(
  ( (Nil!33058) (Cons!33057 (h!34320 (_ BitVec 64)) (t!47747 List!33061)) )
))
(declare-fun arrayNoDuplicates!0 (array!96241 (_ BitVec 32) List!33061) Bool)

(assert (=> b!1408422 (= res!946200 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33058))))

(declare-fun res!946196 () Bool)

(assert (=> start!121134 (=> (not res!946196) (not e!797089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121134 (= res!946196 (validMask!0 mask!2840))))

(assert (=> start!121134 e!797089))

(assert (=> start!121134 true))

(declare-fun array_inv!35697 (array!96241) Bool)

(assert (=> start!121134 (array_inv!35697 a!2901)))

(declare-fun b!1408423 () Bool)

(declare-fun res!946194 () Bool)

(assert (=> b!1408423 (=> (not res!946194) (not e!797089))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408423 (= res!946194 (and (= (size!47016 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47016 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47016 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408424 () Bool)

(declare-fun e!797088 () Bool)

(assert (=> b!1408424 (= e!797089 (not e!797088))))

(declare-fun res!946199 () Bool)

(assert (=> b!1408424 (=> res!946199 e!797088)))

(declare-datatypes ((SeekEntryResult!10801 0))(
  ( (MissingZero!10801 (index!45581 (_ BitVec 32))) (Found!10801 (index!45582 (_ BitVec 32))) (Intermediate!10801 (undefined!11613 Bool) (index!45583 (_ BitVec 32)) (x!127175 (_ BitVec 32))) (Undefined!10801) (MissingVacant!10801 (index!45584 (_ BitVec 32))) )
))
(declare-fun lt!620183 () SeekEntryResult!10801)

(assert (=> b!1408424 (= res!946199 (or (not (is-Intermediate!10801 lt!620183)) (undefined!11613 lt!620183)))))

(declare-fun e!797090 () Bool)

(assert (=> b!1408424 e!797090))

(declare-fun res!946195 () Bool)

(assert (=> b!1408424 (=> (not res!946195) (not e!797090))))

(assert (=> b!1408424 (= res!946195 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47419 0))(
  ( (Unit!47420) )
))
(declare-fun lt!620182 () Unit!47419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47419)

(assert (=> b!1408424 (= lt!620182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96241 (_ BitVec 32)) SeekEntryResult!10801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408424 (= lt!620183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46464 a!2901) j!112) mask!2840) (select (arr!46464 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408425 () Bool)

(declare-fun res!946198 () Bool)

(assert (=> b!1408425 (=> (not res!946198) (not e!797089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408425 (= res!946198 (validKeyInArray!0 (select (arr!46464 a!2901) i!1037)))))

(declare-fun b!1408426 () Bool)

(assert (=> b!1408426 (= e!797088 true)))

(declare-fun lt!620181 () SeekEntryResult!10801)

(assert (=> b!1408426 (= lt!620181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46464 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46464 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96242 (store (arr!46464 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47016 a!2901)) mask!2840))))

(declare-fun b!1408427 () Bool)

(declare-fun res!946197 () Bool)

(assert (=> b!1408427 (=> (not res!946197) (not e!797089))))

(assert (=> b!1408427 (= res!946197 (validKeyInArray!0 (select (arr!46464 a!2901) j!112)))))

(declare-fun b!1408428 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96241 (_ BitVec 32)) SeekEntryResult!10801)

(assert (=> b!1408428 (= e!797090 (= (seekEntryOrOpen!0 (select (arr!46464 a!2901) j!112) a!2901 mask!2840) (Found!10801 j!112)))))

(assert (= (and start!121134 res!946196) b!1408423))

(assert (= (and b!1408423 res!946194) b!1408425))

(assert (= (and b!1408425 res!946198) b!1408427))

(assert (= (and b!1408427 res!946197) b!1408421))

(assert (= (and b!1408421 res!946201) b!1408422))

(assert (= (and b!1408422 res!946200) b!1408424))

(assert (= (and b!1408424 res!946195) b!1408428))

(assert (= (and b!1408424 (not res!946199)) b!1408426))

(declare-fun m!1297293 () Bool)

(assert (=> b!1408422 m!1297293))

(declare-fun m!1297295 () Bool)

(assert (=> b!1408424 m!1297295))

(declare-fun m!1297297 () Bool)

(assert (=> b!1408424 m!1297297))

(assert (=> b!1408424 m!1297295))

(declare-fun m!1297299 () Bool)

(assert (=> b!1408424 m!1297299))

(assert (=> b!1408424 m!1297297))

(assert (=> b!1408424 m!1297295))

(declare-fun m!1297301 () Bool)

(assert (=> b!1408424 m!1297301))

(declare-fun m!1297303 () Bool)

(assert (=> b!1408424 m!1297303))

(declare-fun m!1297305 () Bool)

(assert (=> b!1408425 m!1297305))

(assert (=> b!1408425 m!1297305))

(declare-fun m!1297307 () Bool)

(assert (=> b!1408425 m!1297307))

(declare-fun m!1297309 () Bool)

(assert (=> start!121134 m!1297309))

(declare-fun m!1297311 () Bool)

(assert (=> start!121134 m!1297311))

(assert (=> b!1408427 m!1297295))

(assert (=> b!1408427 m!1297295))

(declare-fun m!1297313 () Bool)

(assert (=> b!1408427 m!1297313))

(declare-fun m!1297315 () Bool)

(assert (=> b!1408426 m!1297315))

(declare-fun m!1297317 () Bool)

(assert (=> b!1408426 m!1297317))

(assert (=> b!1408426 m!1297317))

(declare-fun m!1297319 () Bool)

(assert (=> b!1408426 m!1297319))

(assert (=> b!1408426 m!1297319))

(assert (=> b!1408426 m!1297317))

(declare-fun m!1297321 () Bool)

(assert (=> b!1408426 m!1297321))

(assert (=> b!1408428 m!1297295))

(assert (=> b!1408428 m!1297295))

(declare-fun m!1297323 () Bool)

(assert (=> b!1408428 m!1297323))

(declare-fun m!1297325 () Bool)

(assert (=> b!1408421 m!1297325))

(push 1)

(assert (not b!1408421))

(assert (not b!1408428))

(assert (not b!1408425))

(assert (not b!1408424))

(assert (not b!1408422))

(assert (not b!1408427))

(assert (not b!1408426))

(assert (not start!121134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

