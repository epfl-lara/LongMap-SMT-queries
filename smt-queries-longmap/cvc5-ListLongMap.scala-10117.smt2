; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119196 () Bool)

(assert start!119196)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95133 0))(
  ( (array!95134 (arr!45932 (Array (_ BitVec 32) (_ BitVec 64))) (size!46482 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95133)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!787417 () Bool)

(declare-fun b!1390434 () Bool)

(declare-datatypes ((SeekEntryResult!10249 0))(
  ( (MissingZero!10249 (index!43367 (_ BitVec 32))) (Found!10249 (index!43368 (_ BitVec 32))) (Intermediate!10249 (undefined!11061 Bool) (index!43369 (_ BitVec 32)) (x!125047 (_ BitVec 32))) (Undefined!10249) (MissingVacant!10249 (index!43370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95133 (_ BitVec 32)) SeekEntryResult!10249)

(assert (=> b!1390434 (= e!787417 (= (seekEntryOrOpen!0 (select (arr!45932 a!2901) j!112) a!2901 mask!2840) (Found!10249 j!112)))))

(declare-fun b!1390435 () Bool)

(declare-fun res!930600 () Bool)

(declare-fun e!787418 () Bool)

(assert (=> b!1390435 (=> (not res!930600) (not e!787418))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390435 (= res!930600 (validKeyInArray!0 (select (arr!45932 a!2901) i!1037)))))

(declare-fun b!1390436 () Bool)

(declare-fun res!930601 () Bool)

(assert (=> b!1390436 (=> (not res!930601) (not e!787418))))

(assert (=> b!1390436 (= res!930601 (validKeyInArray!0 (select (arr!45932 a!2901) j!112)))))

(declare-fun b!1390437 () Bool)

(declare-fun res!930598 () Bool)

(assert (=> b!1390437 (=> (not res!930598) (not e!787418))))

(assert (=> b!1390437 (= res!930598 (and (= (size!46482 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46482 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46482 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390438 () Bool)

(declare-fun res!930595 () Bool)

(assert (=> b!1390438 (=> (not res!930595) (not e!787418))))

(declare-datatypes ((List!32451 0))(
  ( (Nil!32448) (Cons!32447 (h!33665 (_ BitVec 64)) (t!47145 List!32451)) )
))
(declare-fun arrayNoDuplicates!0 (array!95133 (_ BitVec 32) List!32451) Bool)

(assert (=> b!1390438 (= res!930595 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32448))))

(declare-fun b!1390439 () Bool)

(declare-fun res!930599 () Bool)

(assert (=> b!1390439 (=> (not res!930599) (not e!787418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95133 (_ BitVec 32)) Bool)

(assert (=> b!1390439 (= res!930599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390440 () Bool)

(assert (=> b!1390440 (= e!787418 (not true))))

(assert (=> b!1390440 e!787417))

(declare-fun res!930597 () Bool)

(assert (=> b!1390440 (=> (not res!930597) (not e!787417))))

(assert (=> b!1390440 (= res!930597 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46502 0))(
  ( (Unit!46503) )
))
(declare-fun lt!610824 () Unit!46502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46502)

(assert (=> b!1390440 (= lt!610824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610823 () SeekEntryResult!10249)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95133 (_ BitVec 32)) SeekEntryResult!10249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390440 (= lt!610823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45932 a!2901) j!112) mask!2840) (select (arr!45932 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930596 () Bool)

(assert (=> start!119196 (=> (not res!930596) (not e!787418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119196 (= res!930596 (validMask!0 mask!2840))))

(assert (=> start!119196 e!787418))

(assert (=> start!119196 true))

(declare-fun array_inv!34960 (array!95133) Bool)

(assert (=> start!119196 (array_inv!34960 a!2901)))

(assert (= (and start!119196 res!930596) b!1390437))

(assert (= (and b!1390437 res!930598) b!1390435))

(assert (= (and b!1390435 res!930600) b!1390436))

(assert (= (and b!1390436 res!930601) b!1390439))

(assert (= (and b!1390439 res!930599) b!1390438))

(assert (= (and b!1390438 res!930595) b!1390440))

(assert (= (and b!1390440 res!930597) b!1390434))

(declare-fun m!1276281 () Bool)

(assert (=> b!1390439 m!1276281))

(declare-fun m!1276283 () Bool)

(assert (=> b!1390435 m!1276283))

(assert (=> b!1390435 m!1276283))

(declare-fun m!1276285 () Bool)

(assert (=> b!1390435 m!1276285))

(declare-fun m!1276287 () Bool)

(assert (=> b!1390436 m!1276287))

(assert (=> b!1390436 m!1276287))

(declare-fun m!1276289 () Bool)

(assert (=> b!1390436 m!1276289))

(assert (=> b!1390440 m!1276287))

(declare-fun m!1276291 () Bool)

(assert (=> b!1390440 m!1276291))

(assert (=> b!1390440 m!1276287))

(declare-fun m!1276293 () Bool)

(assert (=> b!1390440 m!1276293))

(assert (=> b!1390440 m!1276291))

(assert (=> b!1390440 m!1276287))

(declare-fun m!1276295 () Bool)

(assert (=> b!1390440 m!1276295))

(declare-fun m!1276297 () Bool)

(assert (=> b!1390440 m!1276297))

(declare-fun m!1276299 () Bool)

(assert (=> start!119196 m!1276299))

(declare-fun m!1276301 () Bool)

(assert (=> start!119196 m!1276301))

(declare-fun m!1276303 () Bool)

(assert (=> b!1390438 m!1276303))

(assert (=> b!1390434 m!1276287))

(assert (=> b!1390434 m!1276287))

(declare-fun m!1276305 () Bool)

(assert (=> b!1390434 m!1276305))

(push 1)

(assert (not b!1390435))

(assert (not b!1390438))

(assert (not b!1390440))

(assert (not start!119196))

(assert (not b!1390439))

(assert (not b!1390436))

(assert (not b!1390434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

