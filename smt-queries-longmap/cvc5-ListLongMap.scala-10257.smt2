; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120786 () Bool)

(assert start!120786)

(declare-fun res!943138 () Bool)

(declare-fun e!795689 () Bool)

(assert (=> start!120786 (=> (not res!943138) (not e!795689))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120786 (= res!943138 (validMask!0 mask!2840))))

(assert (=> start!120786 e!795689))

(assert (=> start!120786 true))

(declare-datatypes ((array!96117 0))(
  ( (array!96118 (arr!46407 (Array (_ BitVec 32) (_ BitVec 64))) (size!46958 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96117)

(declare-fun array_inv!35688 (array!96117) Bool)

(assert (=> start!120786 (array_inv!35688 a!2901)))

(declare-fun b!1405309 () Bool)

(assert (=> b!1405309 (= e!795689 false)))

(declare-datatypes ((SeekEntryResult!10621 0))(
  ( (MissingZero!10621 (index!44861 (_ BitVec 32))) (Found!10621 (index!44862 (_ BitVec 32))) (Intermediate!10621 (undefined!11433 Bool) (index!44863 (_ BitVec 32)) (x!126627 (_ BitVec 32))) (Undefined!10621) (MissingVacant!10621 (index!44864 (_ BitVec 32))) )
))
(declare-fun lt!618998 () SeekEntryResult!10621)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96117 (_ BitVec 32)) SeekEntryResult!10621)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405309 (= lt!618998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46407 a!2901) j!112) mask!2840) (select (arr!46407 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405310 () Bool)

(declare-fun res!943136 () Bool)

(assert (=> b!1405310 (=> (not res!943136) (not e!795689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96117 (_ BitVec 32)) Bool)

(assert (=> b!1405310 (= res!943136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405311 () Bool)

(declare-fun res!943141 () Bool)

(assert (=> b!1405311 (=> (not res!943141) (not e!795689))))

(declare-datatypes ((List!32913 0))(
  ( (Nil!32910) (Cons!32909 (h!34165 (_ BitVec 64)) (t!47599 List!32913)) )
))
(declare-fun arrayNoDuplicates!0 (array!96117 (_ BitVec 32) List!32913) Bool)

(assert (=> b!1405311 (= res!943141 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32910))))

(declare-fun b!1405312 () Bool)

(declare-fun res!943139 () Bool)

(assert (=> b!1405312 (=> (not res!943139) (not e!795689))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405312 (= res!943139 (and (= (size!46958 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46958 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46958 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405313 () Bool)

(declare-fun res!943137 () Bool)

(assert (=> b!1405313 (=> (not res!943137) (not e!795689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405313 (= res!943137 (validKeyInArray!0 (select (arr!46407 a!2901) i!1037)))))

(declare-fun b!1405314 () Bool)

(declare-fun res!943140 () Bool)

(assert (=> b!1405314 (=> (not res!943140) (not e!795689))))

(assert (=> b!1405314 (= res!943140 (validKeyInArray!0 (select (arr!46407 a!2901) j!112)))))

(assert (= (and start!120786 res!943138) b!1405312))

(assert (= (and b!1405312 res!943139) b!1405313))

(assert (= (and b!1405313 res!943137) b!1405314))

(assert (= (and b!1405314 res!943140) b!1405310))

(assert (= (and b!1405310 res!943136) b!1405311))

(assert (= (and b!1405311 res!943141) b!1405309))

(declare-fun m!1294349 () Bool)

(assert (=> b!1405313 m!1294349))

(assert (=> b!1405313 m!1294349))

(declare-fun m!1294351 () Bool)

(assert (=> b!1405313 m!1294351))

(declare-fun m!1294353 () Bool)

(assert (=> b!1405314 m!1294353))

(assert (=> b!1405314 m!1294353))

(declare-fun m!1294355 () Bool)

(assert (=> b!1405314 m!1294355))

(declare-fun m!1294357 () Bool)

(assert (=> b!1405310 m!1294357))

(assert (=> b!1405309 m!1294353))

(assert (=> b!1405309 m!1294353))

(declare-fun m!1294359 () Bool)

(assert (=> b!1405309 m!1294359))

(assert (=> b!1405309 m!1294359))

(assert (=> b!1405309 m!1294353))

(declare-fun m!1294361 () Bool)

(assert (=> b!1405309 m!1294361))

(declare-fun m!1294363 () Bool)

(assert (=> b!1405311 m!1294363))

(declare-fun m!1294365 () Bool)

(assert (=> start!120786 m!1294365))

(declare-fun m!1294367 () Bool)

(assert (=> start!120786 m!1294367))

(push 1)

(assert (not start!120786))

(assert (not b!1405313))

(assert (not b!1405311))

(assert (not b!1405309))

(assert (not b!1405314))

(assert (not b!1405310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

