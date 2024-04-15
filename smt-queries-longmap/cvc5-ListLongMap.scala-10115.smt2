; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119184 () Bool)

(assert start!119184)

(declare-fun b!1390269 () Bool)

(declare-fun res!930483 () Bool)

(declare-fun e!787342 () Bool)

(assert (=> b!1390269 (=> (not res!930483) (not e!787342))))

(declare-datatypes ((array!95074 0))(
  ( (array!95075 (arr!45903 (Array (_ BitVec 32) (_ BitVec 64))) (size!46455 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95074)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95074 (_ BitVec 32)) Bool)

(assert (=> b!1390269 (= res!930483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390270 () Bool)

(declare-fun res!930484 () Bool)

(assert (=> b!1390270 (=> (not res!930484) (not e!787342))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390270 (= res!930484 (validKeyInArray!0 (select (arr!45903 a!2901) j!112)))))

(declare-fun b!1390271 () Bool)

(declare-fun res!930486 () Bool)

(assert (=> b!1390271 (=> (not res!930486) (not e!787342))))

(declare-datatypes ((List!32500 0))(
  ( (Nil!32497) (Cons!32496 (h!33714 (_ BitVec 64)) (t!47186 List!32500)) )
))
(declare-fun arrayNoDuplicates!0 (array!95074 (_ BitVec 32) List!32500) Bool)

(assert (=> b!1390271 (= res!930486 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32497))))

(declare-fun e!787343 () Bool)

(declare-fun b!1390272 () Bool)

(declare-datatypes ((SeekEntryResult!10246 0))(
  ( (MissingZero!10246 (index!43355 (_ BitVec 32))) (Found!10246 (index!43356 (_ BitVec 32))) (Intermediate!10246 (undefined!11058 Bool) (index!43357 (_ BitVec 32)) (x!125025 (_ BitVec 32))) (Undefined!10246) (MissingVacant!10246 (index!43358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95074 (_ BitVec 32)) SeekEntryResult!10246)

(assert (=> b!1390272 (= e!787343 (= (seekEntryOrOpen!0 (select (arr!45903 a!2901) j!112) a!2901 mask!2840) (Found!10246 j!112)))))

(declare-fun res!930485 () Bool)

(assert (=> start!119184 (=> (not res!930485) (not e!787342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119184 (= res!930485 (validMask!0 mask!2840))))

(assert (=> start!119184 e!787342))

(assert (=> start!119184 true))

(declare-fun array_inv!35136 (array!95074) Bool)

(assert (=> start!119184 (array_inv!35136 a!2901)))

(declare-fun b!1390273 () Bool)

(assert (=> b!1390273 (= e!787342 (not true))))

(assert (=> b!1390273 e!787343))

(declare-fun res!930482 () Bool)

(assert (=> b!1390273 (=> (not res!930482) (not e!787343))))

(assert (=> b!1390273 (= res!930482 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46339 0))(
  ( (Unit!46340) )
))
(declare-fun lt!610609 () Unit!46339)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46339)

(assert (=> b!1390273 (= lt!610609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610610 () SeekEntryResult!10246)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95074 (_ BitVec 32)) SeekEntryResult!10246)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390273 (= lt!610610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45903 a!2901) j!112) mask!2840) (select (arr!45903 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390274 () Bool)

(declare-fun res!930481 () Bool)

(assert (=> b!1390274 (=> (not res!930481) (not e!787342))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390274 (= res!930481 (and (= (size!46455 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46455 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46455 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390275 () Bool)

(declare-fun res!930487 () Bool)

(assert (=> b!1390275 (=> (not res!930487) (not e!787342))))

(assert (=> b!1390275 (= res!930487 (validKeyInArray!0 (select (arr!45903 a!2901) i!1037)))))

(assert (= (and start!119184 res!930485) b!1390274))

(assert (= (and b!1390274 res!930481) b!1390275))

(assert (= (and b!1390275 res!930487) b!1390270))

(assert (= (and b!1390270 res!930484) b!1390269))

(assert (= (and b!1390269 res!930483) b!1390271))

(assert (= (and b!1390271 res!930486) b!1390273))

(assert (= (and b!1390273 res!930482) b!1390272))

(declare-fun m!1275641 () Bool)

(assert (=> b!1390273 m!1275641))

(declare-fun m!1275643 () Bool)

(assert (=> b!1390273 m!1275643))

(assert (=> b!1390273 m!1275641))

(declare-fun m!1275645 () Bool)

(assert (=> b!1390273 m!1275645))

(assert (=> b!1390273 m!1275643))

(assert (=> b!1390273 m!1275641))

(declare-fun m!1275647 () Bool)

(assert (=> b!1390273 m!1275647))

(declare-fun m!1275649 () Bool)

(assert (=> b!1390273 m!1275649))

(assert (=> b!1390270 m!1275641))

(assert (=> b!1390270 m!1275641))

(declare-fun m!1275651 () Bool)

(assert (=> b!1390270 m!1275651))

(declare-fun m!1275653 () Bool)

(assert (=> b!1390275 m!1275653))

(assert (=> b!1390275 m!1275653))

(declare-fun m!1275655 () Bool)

(assert (=> b!1390275 m!1275655))

(declare-fun m!1275657 () Bool)

(assert (=> b!1390269 m!1275657))

(assert (=> b!1390272 m!1275641))

(assert (=> b!1390272 m!1275641))

(declare-fun m!1275659 () Bool)

(assert (=> b!1390272 m!1275659))

(declare-fun m!1275661 () Bool)

(assert (=> start!119184 m!1275661))

(declare-fun m!1275663 () Bool)

(assert (=> start!119184 m!1275663))

(declare-fun m!1275665 () Bool)

(assert (=> b!1390271 m!1275665))

(push 1)

(assert (not b!1390269))

(assert (not start!119184))

(assert (not b!1390270))

(assert (not b!1390271))

(assert (not b!1390275))

(assert (not b!1390273))

(assert (not b!1390272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

