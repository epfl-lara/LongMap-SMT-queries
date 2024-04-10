; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119194 () Bool)

(assert start!119194)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95131 0))(
  ( (array!95132 (arr!45931 (Array (_ BitVec 32) (_ BitVec 64))) (size!46481 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95131)

(declare-fun e!787409 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1390413 () Bool)

(declare-datatypes ((SeekEntryResult!10248 0))(
  ( (MissingZero!10248 (index!43363 (_ BitVec 32))) (Found!10248 (index!43364 (_ BitVec 32))) (Intermediate!10248 (undefined!11060 Bool) (index!43365 (_ BitVec 32)) (x!125038 (_ BitVec 32))) (Undefined!10248) (MissingVacant!10248 (index!43366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95131 (_ BitVec 32)) SeekEntryResult!10248)

(assert (=> b!1390413 (= e!787409 (= (seekEntryOrOpen!0 (select (arr!45931 a!2901) j!112) a!2901 mask!2840) (Found!10248 j!112)))))

(declare-fun b!1390414 () Bool)

(declare-fun res!930577 () Bool)

(declare-fun e!787408 () Bool)

(assert (=> b!1390414 (=> (not res!930577) (not e!787408))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390414 (= res!930577 (and (= (size!46481 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46481 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46481 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390415 () Bool)

(declare-fun res!930576 () Bool)

(assert (=> b!1390415 (=> (not res!930576) (not e!787408))))

(declare-datatypes ((List!32450 0))(
  ( (Nil!32447) (Cons!32446 (h!33664 (_ BitVec 64)) (t!47144 List!32450)) )
))
(declare-fun arrayNoDuplicates!0 (array!95131 (_ BitVec 32) List!32450) Bool)

(assert (=> b!1390415 (= res!930576 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32447))))

(declare-fun b!1390417 () Bool)

(declare-fun res!930578 () Bool)

(assert (=> b!1390417 (=> (not res!930578) (not e!787408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390417 (= res!930578 (validKeyInArray!0 (select (arr!45931 a!2901) j!112)))))

(declare-fun b!1390418 () Bool)

(declare-fun res!930580 () Bool)

(assert (=> b!1390418 (=> (not res!930580) (not e!787408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95131 (_ BitVec 32)) Bool)

(assert (=> b!1390418 (= res!930580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390419 () Bool)

(assert (=> b!1390419 (= e!787408 (not true))))

(assert (=> b!1390419 e!787409))

(declare-fun res!930579 () Bool)

(assert (=> b!1390419 (=> (not res!930579) (not e!787409))))

(assert (=> b!1390419 (= res!930579 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46500 0))(
  ( (Unit!46501) )
))
(declare-fun lt!610817 () Unit!46500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46500)

(assert (=> b!1390419 (= lt!610817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610818 () SeekEntryResult!10248)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95131 (_ BitVec 32)) SeekEntryResult!10248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390419 (= lt!610818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45931 a!2901) j!112) mask!2840) (select (arr!45931 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390416 () Bool)

(declare-fun res!930574 () Bool)

(assert (=> b!1390416 (=> (not res!930574) (not e!787408))))

(assert (=> b!1390416 (= res!930574 (validKeyInArray!0 (select (arr!45931 a!2901) i!1037)))))

(declare-fun res!930575 () Bool)

(assert (=> start!119194 (=> (not res!930575) (not e!787408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119194 (= res!930575 (validMask!0 mask!2840))))

(assert (=> start!119194 e!787408))

(assert (=> start!119194 true))

(declare-fun array_inv!34959 (array!95131) Bool)

(assert (=> start!119194 (array_inv!34959 a!2901)))

(assert (= (and start!119194 res!930575) b!1390414))

(assert (= (and b!1390414 res!930577) b!1390416))

(assert (= (and b!1390416 res!930574) b!1390417))

(assert (= (and b!1390417 res!930578) b!1390418))

(assert (= (and b!1390418 res!930580) b!1390415))

(assert (= (and b!1390415 res!930576) b!1390419))

(assert (= (and b!1390419 res!930579) b!1390413))

(declare-fun m!1276255 () Bool)

(assert (=> b!1390417 m!1276255))

(assert (=> b!1390417 m!1276255))

(declare-fun m!1276257 () Bool)

(assert (=> b!1390417 m!1276257))

(declare-fun m!1276259 () Bool)

(assert (=> b!1390418 m!1276259))

(assert (=> b!1390419 m!1276255))

(declare-fun m!1276261 () Bool)

(assert (=> b!1390419 m!1276261))

(assert (=> b!1390419 m!1276255))

(declare-fun m!1276263 () Bool)

(assert (=> b!1390419 m!1276263))

(assert (=> b!1390419 m!1276261))

(assert (=> b!1390419 m!1276255))

(declare-fun m!1276265 () Bool)

(assert (=> b!1390419 m!1276265))

(declare-fun m!1276267 () Bool)

(assert (=> b!1390419 m!1276267))

(declare-fun m!1276269 () Bool)

(assert (=> b!1390416 m!1276269))

(assert (=> b!1390416 m!1276269))

(declare-fun m!1276271 () Bool)

(assert (=> b!1390416 m!1276271))

(declare-fun m!1276273 () Bool)

(assert (=> b!1390415 m!1276273))

(assert (=> b!1390413 m!1276255))

(assert (=> b!1390413 m!1276255))

(declare-fun m!1276275 () Bool)

(assert (=> b!1390413 m!1276275))

(declare-fun m!1276277 () Bool)

(assert (=> start!119194 m!1276277))

(declare-fun m!1276279 () Bool)

(assert (=> start!119194 m!1276279))

(push 1)

(assert (not b!1390416))

(assert (not b!1390413))

(assert (not b!1390417))

(assert (not b!1390419))

(assert (not start!119194))

(assert (not b!1390418))

(assert (not b!1390415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

