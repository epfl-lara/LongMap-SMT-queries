; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119356 () Bool)

(assert start!119356)

(declare-fun b!1391437 () Bool)

(declare-fun res!931308 () Bool)

(declare-fun e!787940 () Bool)

(assert (=> b!1391437 (=> (not res!931308) (not e!787940))))

(declare-datatypes ((array!95191 0))(
  ( (array!95192 (arr!45958 (Array (_ BitVec 32) (_ BitVec 64))) (size!46508 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95191)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391437 (= res!931308 (validKeyInArray!0 (select (arr!45958 a!2901) j!112)))))

(declare-fun b!1391438 () Bool)

(declare-fun res!931303 () Bool)

(assert (=> b!1391438 (=> (not res!931303) (not e!787940))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95191 (_ BitVec 32)) Bool)

(assert (=> b!1391438 (= res!931303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391439 () Bool)

(declare-fun res!931307 () Bool)

(assert (=> b!1391439 (=> (not res!931307) (not e!787940))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391439 (= res!931307 (and (= (size!46508 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46508 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46508 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391440 () Bool)

(assert (=> b!1391440 (= e!787940 (not true))))

(declare-fun e!787938 () Bool)

(assert (=> b!1391440 e!787938))

(declare-fun res!931306 () Bool)

(assert (=> b!1391440 (=> (not res!931306) (not e!787938))))

(assert (=> b!1391440 (= res!931306 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46554 0))(
  ( (Unit!46555) )
))
(declare-fun lt!611205 () Unit!46554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46554)

(assert (=> b!1391440 (= lt!611205 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10275 0))(
  ( (MissingZero!10275 (index!43471 (_ BitVec 32))) (Found!10275 (index!43472 (_ BitVec 32))) (Intermediate!10275 (undefined!11087 Bool) (index!43473 (_ BitVec 32)) (x!125149 (_ BitVec 32))) (Undefined!10275) (MissingVacant!10275 (index!43474 (_ BitVec 32))) )
))
(declare-fun lt!611204 () SeekEntryResult!10275)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95191 (_ BitVec 32)) SeekEntryResult!10275)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391440 (= lt!611204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45958 a!2901) j!112) mask!2840) (select (arr!45958 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391441 () Bool)

(declare-fun res!931305 () Bool)

(assert (=> b!1391441 (=> (not res!931305) (not e!787940))))

(declare-datatypes ((List!32477 0))(
  ( (Nil!32474) (Cons!32473 (h!33697 (_ BitVec 64)) (t!47171 List!32477)) )
))
(declare-fun arrayNoDuplicates!0 (array!95191 (_ BitVec 32) List!32477) Bool)

(assert (=> b!1391441 (= res!931305 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32474))))

(declare-fun b!1391442 () Bool)

(declare-fun res!931304 () Bool)

(assert (=> b!1391442 (=> (not res!931304) (not e!787940))))

(assert (=> b!1391442 (= res!931304 (validKeyInArray!0 (select (arr!45958 a!2901) i!1037)))))

(declare-fun b!1391436 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95191 (_ BitVec 32)) SeekEntryResult!10275)

(assert (=> b!1391436 (= e!787938 (= (seekEntryOrOpen!0 (select (arr!45958 a!2901) j!112) a!2901 mask!2840) (Found!10275 j!112)))))

(declare-fun res!931309 () Bool)

(assert (=> start!119356 (=> (not res!931309) (not e!787940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119356 (= res!931309 (validMask!0 mask!2840))))

(assert (=> start!119356 e!787940))

(assert (=> start!119356 true))

(declare-fun array_inv!34986 (array!95191) Bool)

(assert (=> start!119356 (array_inv!34986 a!2901)))

(assert (= (and start!119356 res!931309) b!1391439))

(assert (= (and b!1391439 res!931307) b!1391442))

(assert (= (and b!1391442 res!931304) b!1391437))

(assert (= (and b!1391437 res!931308) b!1391438))

(assert (= (and b!1391438 res!931303) b!1391441))

(assert (= (and b!1391441 res!931305) b!1391440))

(assert (= (and b!1391440 res!931306) b!1391436))

(declare-fun m!1277215 () Bool)

(assert (=> b!1391437 m!1277215))

(assert (=> b!1391437 m!1277215))

(declare-fun m!1277217 () Bool)

(assert (=> b!1391437 m!1277217))

(declare-fun m!1277219 () Bool)

(assert (=> start!119356 m!1277219))

(declare-fun m!1277221 () Bool)

(assert (=> start!119356 m!1277221))

(declare-fun m!1277223 () Bool)

(assert (=> b!1391438 m!1277223))

(declare-fun m!1277225 () Bool)

(assert (=> b!1391441 m!1277225))

(assert (=> b!1391440 m!1277215))

(declare-fun m!1277227 () Bool)

(assert (=> b!1391440 m!1277227))

(assert (=> b!1391440 m!1277215))

(declare-fun m!1277229 () Bool)

(assert (=> b!1391440 m!1277229))

(assert (=> b!1391440 m!1277227))

(assert (=> b!1391440 m!1277215))

(declare-fun m!1277231 () Bool)

(assert (=> b!1391440 m!1277231))

(declare-fun m!1277233 () Bool)

(assert (=> b!1391440 m!1277233))

(declare-fun m!1277235 () Bool)

(assert (=> b!1391442 m!1277235))

(assert (=> b!1391442 m!1277235))

(declare-fun m!1277237 () Bool)

(assert (=> b!1391442 m!1277237))

(assert (=> b!1391436 m!1277215))

(assert (=> b!1391436 m!1277215))

(declare-fun m!1277239 () Bool)

(assert (=> b!1391436 m!1277239))

(push 1)

(assert (not b!1391442))

(assert (not b!1391436))

(assert (not b!1391438))

(assert (not b!1391440))

(assert (not b!1391437))

(assert (not start!119356))

(assert (not b!1391441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

