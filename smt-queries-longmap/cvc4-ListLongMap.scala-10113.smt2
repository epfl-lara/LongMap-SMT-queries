; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119176 () Bool)

(assert start!119176)

(declare-fun b!1390224 () Bool)

(declare-fun res!930387 () Bool)

(declare-fun e!787328 () Bool)

(assert (=> b!1390224 (=> (not res!930387) (not e!787328))))

(declare-datatypes ((array!95113 0))(
  ( (array!95114 (arr!45922 (Array (_ BitVec 32) (_ BitVec 64))) (size!46472 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95113)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390224 (= res!930387 (validKeyInArray!0 (select (arr!45922 a!2901) i!1037)))))

(declare-fun b!1390225 () Bool)

(declare-fun res!930389 () Bool)

(assert (=> b!1390225 (=> (not res!930389) (not e!787328))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390225 (= res!930389 (and (= (size!46472 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46472 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46472 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390226 () Bool)

(declare-fun res!930386 () Bool)

(assert (=> b!1390226 (=> (not res!930386) (not e!787328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95113 (_ BitVec 32)) Bool)

(assert (=> b!1390226 (= res!930386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390227 () Bool)

(assert (=> b!1390227 (= e!787328 (not true))))

(declare-fun e!787327 () Bool)

(assert (=> b!1390227 e!787327))

(declare-fun res!930390 () Bool)

(assert (=> b!1390227 (=> (not res!930390) (not e!787327))))

(assert (=> b!1390227 (= res!930390 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46482 0))(
  ( (Unit!46483) )
))
(declare-fun lt!610763 () Unit!46482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46482)

(assert (=> b!1390227 (= lt!610763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10239 0))(
  ( (MissingZero!10239 (index!43327 (_ BitVec 32))) (Found!10239 (index!43328 (_ BitVec 32))) (Intermediate!10239 (undefined!11051 Bool) (index!43329 (_ BitVec 32)) (x!125005 (_ BitVec 32))) (Undefined!10239) (MissingVacant!10239 (index!43330 (_ BitVec 32))) )
))
(declare-fun lt!610764 () SeekEntryResult!10239)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95113 (_ BitVec 32)) SeekEntryResult!10239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390227 (= lt!610764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45922 a!2901) j!112) mask!2840) (select (arr!45922 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930388 () Bool)

(assert (=> start!119176 (=> (not res!930388) (not e!787328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119176 (= res!930388 (validMask!0 mask!2840))))

(assert (=> start!119176 e!787328))

(assert (=> start!119176 true))

(declare-fun array_inv!34950 (array!95113) Bool)

(assert (=> start!119176 (array_inv!34950 a!2901)))

(declare-fun b!1390228 () Bool)

(declare-fun res!930391 () Bool)

(assert (=> b!1390228 (=> (not res!930391) (not e!787328))))

(declare-datatypes ((List!32441 0))(
  ( (Nil!32438) (Cons!32437 (h!33655 (_ BitVec 64)) (t!47135 List!32441)) )
))
(declare-fun arrayNoDuplicates!0 (array!95113 (_ BitVec 32) List!32441) Bool)

(assert (=> b!1390228 (= res!930391 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32438))))

(declare-fun b!1390229 () Bool)

(declare-fun res!930385 () Bool)

(assert (=> b!1390229 (=> (not res!930385) (not e!787328))))

(assert (=> b!1390229 (= res!930385 (validKeyInArray!0 (select (arr!45922 a!2901) j!112)))))

(declare-fun b!1390230 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95113 (_ BitVec 32)) SeekEntryResult!10239)

(assert (=> b!1390230 (= e!787327 (= (seekEntryOrOpen!0 (select (arr!45922 a!2901) j!112) a!2901 mask!2840) (Found!10239 j!112)))))

(assert (= (and start!119176 res!930388) b!1390225))

(assert (= (and b!1390225 res!930389) b!1390224))

(assert (= (and b!1390224 res!930387) b!1390229))

(assert (= (and b!1390229 res!930385) b!1390226))

(assert (= (and b!1390226 res!930386) b!1390228))

(assert (= (and b!1390228 res!930391) b!1390227))

(assert (= (and b!1390227 res!930390) b!1390230))

(declare-fun m!1276021 () Bool)

(assert (=> b!1390224 m!1276021))

(assert (=> b!1390224 m!1276021))

(declare-fun m!1276023 () Bool)

(assert (=> b!1390224 m!1276023))

(declare-fun m!1276025 () Bool)

(assert (=> b!1390228 m!1276025))

(declare-fun m!1276027 () Bool)

(assert (=> start!119176 m!1276027))

(declare-fun m!1276029 () Bool)

(assert (=> start!119176 m!1276029))

(declare-fun m!1276031 () Bool)

(assert (=> b!1390230 m!1276031))

(assert (=> b!1390230 m!1276031))

(declare-fun m!1276033 () Bool)

(assert (=> b!1390230 m!1276033))

(assert (=> b!1390227 m!1276031))

(declare-fun m!1276035 () Bool)

(assert (=> b!1390227 m!1276035))

(assert (=> b!1390227 m!1276031))

(declare-fun m!1276037 () Bool)

(assert (=> b!1390227 m!1276037))

(assert (=> b!1390227 m!1276035))

(assert (=> b!1390227 m!1276031))

(declare-fun m!1276039 () Bool)

(assert (=> b!1390227 m!1276039))

(declare-fun m!1276041 () Bool)

(assert (=> b!1390227 m!1276041))

(assert (=> b!1390229 m!1276031))

(assert (=> b!1390229 m!1276031))

(declare-fun m!1276043 () Bool)

(assert (=> b!1390229 m!1276043))

(declare-fun m!1276045 () Bool)

(assert (=> b!1390226 m!1276045))

(push 1)

(assert (not b!1390230))

(assert (not b!1390226))

(assert (not b!1390224))

(assert (not b!1390229))

(assert (not start!119176))

(assert (not b!1390227))

(assert (not b!1390228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

