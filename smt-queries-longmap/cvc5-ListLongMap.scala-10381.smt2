; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122208 () Bool)

(assert start!122208)

(declare-fun b!1417692 () Bool)

(declare-fun res!953425 () Bool)

(declare-fun e!802318 () Bool)

(assert (=> b!1417692 (=> (not res!953425) (not e!802318))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!96792 0))(
  ( (array!96793 (arr!46724 (Array (_ BitVec 32) (_ BitVec 64))) (size!47274 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96792)

(assert (=> b!1417692 (= res!953425 (and (= (size!47274 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47274 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47274 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417693 () Bool)

(declare-fun res!953423 () Bool)

(assert (=> b!1417693 (=> (not res!953423) (not e!802318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417693 (= res!953423 (validKeyInArray!0 (select (arr!46724 a!2831) i!982)))))

(declare-fun b!1417694 () Bool)

(declare-fun res!953424 () Bool)

(assert (=> b!1417694 (=> (not res!953424) (not e!802318))))

(assert (=> b!1417694 (= res!953424 (validKeyInArray!0 (select (arr!46724 a!2831) j!81)))))

(declare-fun b!1417695 () Bool)

(assert (=> b!1417695 (= e!802318 (bvsgt #b00000000000000000000000000000000 (size!47274 a!2831)))))

(declare-fun res!953422 () Bool)

(assert (=> start!122208 (=> (not res!953422) (not e!802318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122208 (= res!953422 (validMask!0 mask!2608))))

(assert (=> start!122208 e!802318))

(assert (=> start!122208 true))

(declare-fun array_inv!35752 (array!96792) Bool)

(assert (=> start!122208 (array_inv!35752 a!2831)))

(assert (= (and start!122208 res!953422) b!1417692))

(assert (= (and b!1417692 res!953425) b!1417693))

(assert (= (and b!1417693 res!953423) b!1417694))

(assert (= (and b!1417694 res!953424) b!1417695))

(declare-fun m!1308477 () Bool)

(assert (=> b!1417693 m!1308477))

(assert (=> b!1417693 m!1308477))

(declare-fun m!1308479 () Bool)

(assert (=> b!1417693 m!1308479))

(declare-fun m!1308481 () Bool)

(assert (=> b!1417694 m!1308481))

(assert (=> b!1417694 m!1308481))

(declare-fun m!1308483 () Bool)

(assert (=> b!1417694 m!1308483))

(declare-fun m!1308485 () Bool)

(assert (=> start!122208 m!1308485))

(declare-fun m!1308487 () Bool)

(assert (=> start!122208 m!1308487))

(push 1)

(assert (not b!1417694))

(assert (not b!1417693))

(assert (not start!122208))

(check-sat)

