; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125402 () Bool)

(assert start!125402)

(declare-fun res!995910 () Bool)

(declare-fun e!824156 () Bool)

(assert (=> start!125402 (=> (not res!995910) (not e!824156))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125402 (= res!995910 (validMask!0 mask!2687))))

(assert (=> start!125402 e!824156))

(assert (=> start!125402 true))

(declare-datatypes ((array!98828 0))(
  ( (array!98829 (arr!47703 (Array (_ BitVec 32) (_ BitVec 64))) (size!48255 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98828)

(declare-fun array_inv!36936 (array!98828) Bool)

(assert (=> start!125402 (array_inv!36936 a!2862)))

(declare-fun b!1467254 () Bool)

(declare-fun res!995914 () Bool)

(assert (=> b!1467254 (=> (not res!995914) (not e!824156))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467254 (= res!995914 (and (= (size!48255 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48255 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48255 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467255 () Bool)

(declare-fun res!995912 () Bool)

(assert (=> b!1467255 (=> (not res!995912) (not e!824156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467255 (= res!995912 (validKeyInArray!0 (select (arr!47703 a!2862) j!93)))))

(declare-fun b!1467256 () Bool)

(declare-fun res!995911 () Bool)

(assert (=> b!1467256 (=> (not res!995911) (not e!824156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98828 (_ BitVec 32)) Bool)

(assert (=> b!1467256 (= res!995911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467257 () Bool)

(declare-fun res!995913 () Bool)

(assert (=> b!1467257 (=> (not res!995913) (not e!824156))))

(assert (=> b!1467257 (= res!995913 (validKeyInArray!0 (select (arr!47703 a!2862) i!1006)))))

(declare-fun b!1467258 () Bool)

(assert (=> b!1467258 (= e!824156 false)))

(declare-fun lt!641868 () Bool)

(declare-datatypes ((List!34282 0))(
  ( (Nil!34279) (Cons!34278 (h!35628 (_ BitVec 64)) (t!48968 List!34282)) )
))
(declare-fun arrayNoDuplicates!0 (array!98828 (_ BitVec 32) List!34282) Bool)

(assert (=> b!1467258 (= lt!641868 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34279))))

(assert (= (and start!125402 res!995910) b!1467254))

(assert (= (and b!1467254 res!995914) b!1467257))

(assert (= (and b!1467257 res!995913) b!1467255))

(assert (= (and b!1467255 res!995912) b!1467256))

(assert (= (and b!1467256 res!995911) b!1467258))

(declare-fun m!1353713 () Bool)

(assert (=> b!1467258 m!1353713))

(declare-fun m!1353715 () Bool)

(assert (=> b!1467257 m!1353715))

(assert (=> b!1467257 m!1353715))

(declare-fun m!1353717 () Bool)

(assert (=> b!1467257 m!1353717))

(declare-fun m!1353719 () Bool)

(assert (=> b!1467255 m!1353719))

(assert (=> b!1467255 m!1353719))

(declare-fun m!1353721 () Bool)

(assert (=> b!1467255 m!1353721))

(declare-fun m!1353723 () Bool)

(assert (=> b!1467256 m!1353723))

(declare-fun m!1353725 () Bool)

(assert (=> start!125402 m!1353725))

(declare-fun m!1353727 () Bool)

(assert (=> start!125402 m!1353727))

(push 1)

(assert (not b!1467258))

(assert (not b!1467255))

(assert (not b!1467256))

(assert (not b!1467257))

(assert (not start!125402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

