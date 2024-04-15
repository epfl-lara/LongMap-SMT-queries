; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130630 () Bool)

(assert start!130630)

(declare-fun b!1532454 () Bool)

(declare-fun res!1049724 () Bool)

(declare-fun e!853821 () Bool)

(assert (=> b!1532454 (=> (not res!1049724) (not e!853821))))

(declare-datatypes ((array!101726 0))(
  ( (array!101727 (arr!49080 (Array (_ BitVec 32) (_ BitVec 64))) (size!49632 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101726)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532454 (= res!1049724 (validKeyInArray!0 (select (arr!49080 a!2792) j!64)))))

(declare-fun b!1532455 () Bool)

(assert (=> b!1532455 (= e!853821 false)))

(declare-fun lt!663453 () Bool)

(declare-datatypes ((List!35632 0))(
  ( (Nil!35629) (Cons!35628 (h!37074 (_ BitVec 64)) (t!50318 List!35632)) )
))
(declare-fun arrayNoDuplicates!0 (array!101726 (_ BitVec 32) List!35632) Bool)

(assert (=> b!1532455 (= lt!663453 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35629))))

(declare-fun b!1532456 () Bool)

(declare-fun res!1049725 () Bool)

(assert (=> b!1532456 (=> (not res!1049725) (not e!853821))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532456 (= res!1049725 (and (= (size!49632 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49632 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49632 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532457 () Bool)

(declare-fun res!1049728 () Bool)

(assert (=> b!1532457 (=> (not res!1049728) (not e!853821))))

(assert (=> b!1532457 (= res!1049728 (validKeyInArray!0 (select (arr!49080 a!2792) i!951)))))

(declare-fun b!1532458 () Bool)

(declare-fun res!1049726 () Bool)

(assert (=> b!1532458 (=> (not res!1049726) (not e!853821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101726 (_ BitVec 32)) Bool)

(assert (=> b!1532458 (= res!1049726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1049727 () Bool)

(assert (=> start!130630 (=> (not res!1049727) (not e!853821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130630 (= res!1049727 (validMask!0 mask!2480))))

(assert (=> start!130630 e!853821))

(assert (=> start!130630 true))

(declare-fun array_inv!38313 (array!101726) Bool)

(assert (=> start!130630 (array_inv!38313 a!2792)))

(assert (= (and start!130630 res!1049727) b!1532456))

(assert (= (and b!1532456 res!1049725) b!1532457))

(assert (= (and b!1532457 res!1049728) b!1532454))

(assert (= (and b!1532454 res!1049724) b!1532458))

(assert (= (and b!1532458 res!1049726) b!1532455))

(declare-fun m!1414579 () Bool)

(assert (=> b!1532455 m!1414579))

(declare-fun m!1414581 () Bool)

(assert (=> b!1532458 m!1414581))

(declare-fun m!1414583 () Bool)

(assert (=> b!1532457 m!1414583))

(assert (=> b!1532457 m!1414583))

(declare-fun m!1414585 () Bool)

(assert (=> b!1532457 m!1414585))

(declare-fun m!1414587 () Bool)

(assert (=> start!130630 m!1414587))

(declare-fun m!1414589 () Bool)

(assert (=> start!130630 m!1414589))

(declare-fun m!1414591 () Bool)

(assert (=> b!1532454 m!1414591))

(assert (=> b!1532454 m!1414591))

(declare-fun m!1414593 () Bool)

(assert (=> b!1532454 m!1414593))

(push 1)

(assert (not b!1532455))

(assert (not b!1532458))

(assert (not start!130630))

(assert (not b!1532454))

(assert (not b!1532457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

