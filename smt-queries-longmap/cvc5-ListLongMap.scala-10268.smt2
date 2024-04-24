; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120960 () Bool)

(assert start!120960)

(declare-fun b!1406403 () Bool)

(declare-fun res!943936 () Bool)

(declare-fun e!796218 () Bool)

(assert (=> b!1406403 (=> (not res!943936) (not e!796218))))

(declare-datatypes ((array!96189 0))(
  ( (array!96190 (arr!46440 (Array (_ BitVec 32) (_ BitVec 64))) (size!46991 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96189)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406403 (= res!943936 (validKeyInArray!0 (select (arr!46440 a!2901) i!1037)))))

(declare-fun res!943942 () Bool)

(assert (=> start!120960 (=> (not res!943942) (not e!796218))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120960 (= res!943942 (validMask!0 mask!2840))))

(assert (=> start!120960 e!796218))

(assert (=> start!120960 true))

(declare-fun array_inv!35721 (array!96189) Bool)

(assert (=> start!120960 (array_inv!35721 a!2901)))

(declare-fun b!1406404 () Bool)

(declare-fun res!943940 () Bool)

(assert (=> b!1406404 (=> (not res!943940) (not e!796218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96189 (_ BitVec 32)) Bool)

(assert (=> b!1406404 (= res!943940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406405 () Bool)

(declare-fun e!796220 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10654 0))(
  ( (MissingZero!10654 (index!44993 (_ BitVec 32))) (Found!10654 (index!44994 (_ BitVec 32))) (Intermediate!10654 (undefined!11466 Bool) (index!44995 (_ BitVec 32)) (x!126760 (_ BitVec 32))) (Undefined!10654) (MissingVacant!10654 (index!44996 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96189 (_ BitVec 32)) SeekEntryResult!10654)

(assert (=> b!1406405 (= e!796220 (= (seekEntryOrOpen!0 (select (arr!46440 a!2901) j!112) a!2901 mask!2840) (Found!10654 j!112)))))

(declare-fun b!1406406 () Bool)

(assert (=> b!1406406 (= e!796218 (not true))))

(assert (=> b!1406406 e!796220))

(declare-fun res!943938 () Bool)

(assert (=> b!1406406 (=> (not res!943938) (not e!796220))))

(assert (=> b!1406406 (= res!943938 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47309 0))(
  ( (Unit!47310) )
))
(declare-fun lt!619375 () Unit!47309)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47309)

(assert (=> b!1406406 (= lt!619375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619376 () SeekEntryResult!10654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96189 (_ BitVec 32)) SeekEntryResult!10654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406406 (= lt!619376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46440 a!2901) j!112) mask!2840) (select (arr!46440 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406407 () Bool)

(declare-fun res!943941 () Bool)

(assert (=> b!1406407 (=> (not res!943941) (not e!796218))))

(declare-datatypes ((List!32946 0))(
  ( (Nil!32943) (Cons!32942 (h!34204 (_ BitVec 64)) (t!47632 List!32946)) )
))
(declare-fun arrayNoDuplicates!0 (array!96189 (_ BitVec 32) List!32946) Bool)

(assert (=> b!1406407 (= res!943941 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32943))))

(declare-fun b!1406408 () Bool)

(declare-fun res!943939 () Bool)

(assert (=> b!1406408 (=> (not res!943939) (not e!796218))))

(assert (=> b!1406408 (= res!943939 (and (= (size!46991 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46991 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46991 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406409 () Bool)

(declare-fun res!943937 () Bool)

(assert (=> b!1406409 (=> (not res!943937) (not e!796218))))

(assert (=> b!1406409 (= res!943937 (validKeyInArray!0 (select (arr!46440 a!2901) j!112)))))

(assert (= (and start!120960 res!943942) b!1406408))

(assert (= (and b!1406408 res!943939) b!1406403))

(assert (= (and b!1406403 res!943936) b!1406409))

(assert (= (and b!1406409 res!943937) b!1406404))

(assert (= (and b!1406404 res!943940) b!1406407))

(assert (= (and b!1406407 res!943941) b!1406406))

(assert (= (and b!1406406 res!943938) b!1406405))

(declare-fun m!1295375 () Bool)

(assert (=> start!120960 m!1295375))

(declare-fun m!1295377 () Bool)

(assert (=> start!120960 m!1295377))

(declare-fun m!1295379 () Bool)

(assert (=> b!1406406 m!1295379))

(declare-fun m!1295381 () Bool)

(assert (=> b!1406406 m!1295381))

(assert (=> b!1406406 m!1295379))

(declare-fun m!1295383 () Bool)

(assert (=> b!1406406 m!1295383))

(assert (=> b!1406406 m!1295381))

(assert (=> b!1406406 m!1295379))

(declare-fun m!1295385 () Bool)

(assert (=> b!1406406 m!1295385))

(declare-fun m!1295387 () Bool)

(assert (=> b!1406406 m!1295387))

(assert (=> b!1406405 m!1295379))

(assert (=> b!1406405 m!1295379))

(declare-fun m!1295389 () Bool)

(assert (=> b!1406405 m!1295389))

(declare-fun m!1295391 () Bool)

(assert (=> b!1406404 m!1295391))

(assert (=> b!1406409 m!1295379))

(assert (=> b!1406409 m!1295379))

(declare-fun m!1295393 () Bool)

(assert (=> b!1406409 m!1295393))

(declare-fun m!1295395 () Bool)

(assert (=> b!1406403 m!1295395))

(assert (=> b!1406403 m!1295395))

(declare-fun m!1295397 () Bool)

(assert (=> b!1406403 m!1295397))

(declare-fun m!1295399 () Bool)

(assert (=> b!1406407 m!1295399))

(push 1)

(assert (not b!1406407))

(assert (not b!1406405))

(assert (not b!1406409))

(assert (not b!1406404))

(assert (not b!1406403))

(assert (not b!1406406))

(assert (not start!120960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

