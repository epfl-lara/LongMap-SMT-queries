; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118512 () Bool)

(assert start!118512)

(declare-fun b!1385619 () Bool)

(declare-fun e!785082 () Bool)

(assert (=> b!1385619 (= e!785082 false)))

(declare-fun lt!609122 () Bool)

(declare-datatypes ((array!94741 0))(
  ( (array!94742 (arr!45747 (Array (_ BitVec 32) (_ BitVec 64))) (size!46299 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94741)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94741 (_ BitVec 32)) Bool)

(assert (=> b!1385619 (= lt!609122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926909 () Bool)

(assert (=> start!118512 (=> (not res!926909) (not e!785082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118512 (= res!926909 (validMask!0 mask!2987))))

(assert (=> start!118512 e!785082))

(assert (=> start!118512 true))

(declare-fun array_inv!34980 (array!94741) Bool)

(assert (=> start!118512 (array_inv!34980 a!2938)))

(declare-fun b!1385616 () Bool)

(declare-fun res!926911 () Bool)

(assert (=> b!1385616 (=> (not res!926911) (not e!785082))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385616 (= res!926911 (and (= (size!46299 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46299 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46299 a!2938))))))

(declare-fun b!1385617 () Bool)

(declare-fun res!926910 () Bool)

(assert (=> b!1385617 (=> (not res!926910) (not e!785082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385617 (= res!926910 (validKeyInArray!0 (select (arr!45747 a!2938) i!1065)))))

(declare-fun b!1385618 () Bool)

(declare-fun res!926912 () Bool)

(assert (=> b!1385618 (=> (not res!926912) (not e!785082))))

(declare-datatypes ((List!32353 0))(
  ( (Nil!32350) (Cons!32349 (h!33558 (_ BitVec 64)) (t!47039 List!32353)) )
))
(declare-fun arrayNoDuplicates!0 (array!94741 (_ BitVec 32) List!32353) Bool)

(assert (=> b!1385618 (= res!926912 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32350))))

(assert (= (and start!118512 res!926909) b!1385616))

(assert (= (and b!1385616 res!926911) b!1385617))

(assert (= (and b!1385617 res!926910) b!1385618))

(assert (= (and b!1385618 res!926912) b!1385619))

(declare-fun m!1270473 () Bool)

(assert (=> b!1385619 m!1270473))

(declare-fun m!1270475 () Bool)

(assert (=> start!118512 m!1270475))

(declare-fun m!1270477 () Bool)

(assert (=> start!118512 m!1270477))

(declare-fun m!1270479 () Bool)

(assert (=> b!1385617 m!1270479))

(assert (=> b!1385617 m!1270479))

(declare-fun m!1270481 () Bool)

(assert (=> b!1385617 m!1270481))

(declare-fun m!1270483 () Bool)

(assert (=> b!1385618 m!1270483))

(push 1)

(assert (not start!118512))

(assert (not b!1385618))

(assert (not b!1385617))

(assert (not b!1385619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

