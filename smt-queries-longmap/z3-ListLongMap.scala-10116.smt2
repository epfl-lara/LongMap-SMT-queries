; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119192 () Bool)

(assert start!119192)

(declare-fun b!1390392 () Bool)

(declare-fun res!930557 () Bool)

(declare-fun e!787400 () Bool)

(assert (=> b!1390392 (=> (not res!930557) (not e!787400))))

(declare-datatypes ((array!95129 0))(
  ( (array!95130 (arr!45930 (Array (_ BitVec 32) (_ BitVec 64))) (size!46480 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95129)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390392 (= res!930557 (validKeyInArray!0 (select (arr!45930 a!2901) j!112)))))

(declare-fun b!1390393 () Bool)

(declare-fun res!930554 () Bool)

(assert (=> b!1390393 (=> (not res!930554) (not e!787400))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390393 (= res!930554 (validKeyInArray!0 (select (arr!45930 a!2901) i!1037)))))

(declare-fun res!930556 () Bool)

(assert (=> start!119192 (=> (not res!930556) (not e!787400))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119192 (= res!930556 (validMask!0 mask!2840))))

(assert (=> start!119192 e!787400))

(assert (=> start!119192 true))

(declare-fun array_inv!34958 (array!95129) Bool)

(assert (=> start!119192 (array_inv!34958 a!2901)))

(declare-fun b!1390394 () Bool)

(assert (=> b!1390394 (= e!787400 (not true))))

(declare-fun e!787399 () Bool)

(assert (=> b!1390394 e!787399))

(declare-fun res!930558 () Bool)

(assert (=> b!1390394 (=> (not res!930558) (not e!787399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95129 (_ BitVec 32)) Bool)

(assert (=> b!1390394 (= res!930558 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46498 0))(
  ( (Unit!46499) )
))
(declare-fun lt!610812 () Unit!46498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46498)

(assert (=> b!1390394 (= lt!610812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10247 0))(
  ( (MissingZero!10247 (index!43359 (_ BitVec 32))) (Found!10247 (index!43360 (_ BitVec 32))) (Intermediate!10247 (undefined!11059 Bool) (index!43361 (_ BitVec 32)) (x!125037 (_ BitVec 32))) (Undefined!10247) (MissingVacant!10247 (index!43362 (_ BitVec 32))) )
))
(declare-fun lt!610811 () SeekEntryResult!10247)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95129 (_ BitVec 32)) SeekEntryResult!10247)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390394 (= lt!610811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45930 a!2901) j!112) mask!2840) (select (arr!45930 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390395 () Bool)

(declare-fun res!930555 () Bool)

(assert (=> b!1390395 (=> (not res!930555) (not e!787400))))

(assert (=> b!1390395 (= res!930555 (and (= (size!46480 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46480 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46480 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390396 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95129 (_ BitVec 32)) SeekEntryResult!10247)

(assert (=> b!1390396 (= e!787399 (= (seekEntryOrOpen!0 (select (arr!45930 a!2901) j!112) a!2901 mask!2840) (Found!10247 j!112)))))

(declare-fun b!1390397 () Bool)

(declare-fun res!930553 () Bool)

(assert (=> b!1390397 (=> (not res!930553) (not e!787400))))

(assert (=> b!1390397 (= res!930553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390398 () Bool)

(declare-fun res!930559 () Bool)

(assert (=> b!1390398 (=> (not res!930559) (not e!787400))))

(declare-datatypes ((List!32449 0))(
  ( (Nil!32446) (Cons!32445 (h!33663 (_ BitVec 64)) (t!47143 List!32449)) )
))
(declare-fun arrayNoDuplicates!0 (array!95129 (_ BitVec 32) List!32449) Bool)

(assert (=> b!1390398 (= res!930559 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32446))))

(assert (= (and start!119192 res!930556) b!1390395))

(assert (= (and b!1390395 res!930555) b!1390393))

(assert (= (and b!1390393 res!930554) b!1390392))

(assert (= (and b!1390392 res!930557) b!1390397))

(assert (= (and b!1390397 res!930553) b!1390398))

(assert (= (and b!1390398 res!930559) b!1390394))

(assert (= (and b!1390394 res!930558) b!1390396))

(declare-fun m!1276229 () Bool)

(assert (=> b!1390394 m!1276229))

(declare-fun m!1276231 () Bool)

(assert (=> b!1390394 m!1276231))

(assert (=> b!1390394 m!1276229))

(declare-fun m!1276233 () Bool)

(assert (=> b!1390394 m!1276233))

(assert (=> b!1390394 m!1276231))

(assert (=> b!1390394 m!1276229))

(declare-fun m!1276235 () Bool)

(assert (=> b!1390394 m!1276235))

(declare-fun m!1276237 () Bool)

(assert (=> b!1390394 m!1276237))

(assert (=> b!1390396 m!1276229))

(assert (=> b!1390396 m!1276229))

(declare-fun m!1276239 () Bool)

(assert (=> b!1390396 m!1276239))

(declare-fun m!1276241 () Bool)

(assert (=> b!1390398 m!1276241))

(assert (=> b!1390392 m!1276229))

(assert (=> b!1390392 m!1276229))

(declare-fun m!1276243 () Bool)

(assert (=> b!1390392 m!1276243))

(declare-fun m!1276245 () Bool)

(assert (=> b!1390397 m!1276245))

(declare-fun m!1276247 () Bool)

(assert (=> b!1390393 m!1276247))

(assert (=> b!1390393 m!1276247))

(declare-fun m!1276249 () Bool)

(assert (=> b!1390393 m!1276249))

(declare-fun m!1276251 () Bool)

(assert (=> start!119192 m!1276251))

(declare-fun m!1276253 () Bool)

(assert (=> start!119192 m!1276253))

(check-sat (not b!1390397) (not b!1390396) (not b!1390393) (not start!119192) (not b!1390392) (not b!1390398) (not b!1390394))
