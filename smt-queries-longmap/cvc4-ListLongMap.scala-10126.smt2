; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119362 () Bool)

(assert start!119362)

(declare-fun b!1391499 () Bool)

(declare-fun res!931369 () Bool)

(declare-fun e!787965 () Bool)

(assert (=> b!1391499 (=> (not res!931369) (not e!787965))))

(declare-datatypes ((array!95197 0))(
  ( (array!95198 (arr!45961 (Array (_ BitVec 32) (_ BitVec 64))) (size!46511 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95197)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95197 (_ BitVec 32)) Bool)

(assert (=> b!1391499 (= res!931369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!787967 () Bool)

(declare-fun b!1391500 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10278 0))(
  ( (MissingZero!10278 (index!43483 (_ BitVec 32))) (Found!10278 (index!43484 (_ BitVec 32))) (Intermediate!10278 (undefined!11090 Bool) (index!43485 (_ BitVec 32)) (x!125160 (_ BitVec 32))) (Undefined!10278) (MissingVacant!10278 (index!43486 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95197 (_ BitVec 32)) SeekEntryResult!10278)

(assert (=> b!1391500 (= e!787967 (= (seekEntryOrOpen!0 (select (arr!45961 a!2901) j!112) a!2901 mask!2840) (Found!10278 j!112)))))

(declare-fun res!931371 () Bool)

(assert (=> start!119362 (=> (not res!931371) (not e!787965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119362 (= res!931371 (validMask!0 mask!2840))))

(assert (=> start!119362 e!787965))

(assert (=> start!119362 true))

(declare-fun array_inv!34989 (array!95197) Bool)

(assert (=> start!119362 (array_inv!34989 a!2901)))

(declare-fun b!1391501 () Bool)

(declare-fun res!931370 () Bool)

(assert (=> b!1391501 (=> (not res!931370) (not e!787965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391501 (= res!931370 (validKeyInArray!0 (select (arr!45961 a!2901) j!112)))))

(declare-fun b!1391502 () Bool)

(declare-fun res!931372 () Bool)

(assert (=> b!1391502 (=> (not res!931372) (not e!787965))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391502 (= res!931372 (and (= (size!46511 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46511 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46511 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391503 () Bool)

(declare-fun lt!611223 () SeekEntryResult!10278)

(assert (=> b!1391503 (= e!787965 (not (or (not (is-Intermediate!10278 lt!611223)) (undefined!11090 lt!611223) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1391503 e!787967))

(declare-fun res!931366 () Bool)

(assert (=> b!1391503 (=> (not res!931366) (not e!787967))))

(assert (=> b!1391503 (= res!931366 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46560 0))(
  ( (Unit!46561) )
))
(declare-fun lt!611222 () Unit!46560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46560)

(assert (=> b!1391503 (= lt!611222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95197 (_ BitVec 32)) SeekEntryResult!10278)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391503 (= lt!611223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) (select (arr!45961 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391504 () Bool)

(declare-fun res!931368 () Bool)

(assert (=> b!1391504 (=> (not res!931368) (not e!787965))))

(assert (=> b!1391504 (= res!931368 (validKeyInArray!0 (select (arr!45961 a!2901) i!1037)))))

(declare-fun b!1391505 () Bool)

(declare-fun res!931367 () Bool)

(assert (=> b!1391505 (=> (not res!931367) (not e!787965))))

(declare-datatypes ((List!32480 0))(
  ( (Nil!32477) (Cons!32476 (h!33700 (_ BitVec 64)) (t!47174 List!32480)) )
))
(declare-fun arrayNoDuplicates!0 (array!95197 (_ BitVec 32) List!32480) Bool)

(assert (=> b!1391505 (= res!931367 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32477))))

(assert (= (and start!119362 res!931371) b!1391502))

(assert (= (and b!1391502 res!931372) b!1391504))

(assert (= (and b!1391504 res!931368) b!1391501))

(assert (= (and b!1391501 res!931370) b!1391499))

(assert (= (and b!1391499 res!931369) b!1391505))

(assert (= (and b!1391505 res!931367) b!1391503))

(assert (= (and b!1391503 res!931366) b!1391500))

(declare-fun m!1277293 () Bool)

(assert (=> b!1391505 m!1277293))

(declare-fun m!1277295 () Bool)

(assert (=> start!119362 m!1277295))

(declare-fun m!1277297 () Bool)

(assert (=> start!119362 m!1277297))

(declare-fun m!1277299 () Bool)

(assert (=> b!1391500 m!1277299))

(assert (=> b!1391500 m!1277299))

(declare-fun m!1277301 () Bool)

(assert (=> b!1391500 m!1277301))

(assert (=> b!1391501 m!1277299))

(assert (=> b!1391501 m!1277299))

(declare-fun m!1277303 () Bool)

(assert (=> b!1391501 m!1277303))

(declare-fun m!1277305 () Bool)

(assert (=> b!1391504 m!1277305))

(assert (=> b!1391504 m!1277305))

(declare-fun m!1277307 () Bool)

(assert (=> b!1391504 m!1277307))

(declare-fun m!1277309 () Bool)

(assert (=> b!1391499 m!1277309))

(assert (=> b!1391503 m!1277299))

(declare-fun m!1277311 () Bool)

(assert (=> b!1391503 m!1277311))

(assert (=> b!1391503 m!1277299))

(declare-fun m!1277313 () Bool)

(assert (=> b!1391503 m!1277313))

(assert (=> b!1391503 m!1277311))

(assert (=> b!1391503 m!1277299))

(declare-fun m!1277315 () Bool)

(assert (=> b!1391503 m!1277315))

(declare-fun m!1277317 () Bool)

(assert (=> b!1391503 m!1277317))

(push 1)

(assert (not start!119362))

(assert (not b!1391501))

(assert (not b!1391500))

(assert (not b!1391504))

(assert (not b!1391503))

(assert (not b!1391499))

(assert (not b!1391505))

(check-sat)

