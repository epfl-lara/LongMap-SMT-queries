; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120102 () Bool)

(assert start!120102)

(declare-fun b!1398346 () Bool)

(declare-fun res!937263 () Bool)

(declare-fun e!791642 () Bool)

(assert (=> b!1398346 (=> (not res!937263) (not e!791642))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95631 0))(
  ( (array!95632 (arr!46169 (Array (_ BitVec 32) (_ BitVec 64))) (size!46719 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95631)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398346 (= res!937263 (and (= (size!46719 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46719 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46719 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398347 () Bool)

(declare-fun res!937266 () Bool)

(assert (=> b!1398347 (=> (not res!937266) (not e!791642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398347 (= res!937266 (validKeyInArray!0 (select (arr!46169 a!2901) i!1037)))))

(declare-fun e!791639 () Bool)

(declare-fun b!1398348 () Bool)

(declare-datatypes ((SeekEntryResult!10486 0))(
  ( (MissingZero!10486 (index!44315 (_ BitVec 32))) (Found!10486 (index!44316 (_ BitVec 32))) (Intermediate!10486 (undefined!11298 Bool) (index!44317 (_ BitVec 32)) (x!125964 (_ BitVec 32))) (Undefined!10486) (MissingVacant!10486 (index!44318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95631 (_ BitVec 32)) SeekEntryResult!10486)

(assert (=> b!1398348 (= e!791639 (= (seekEntryOrOpen!0 (select (arr!46169 a!2901) j!112) a!2901 mask!2840) (Found!10486 j!112)))))

(declare-fun res!937265 () Bool)

(assert (=> start!120102 (=> (not res!937265) (not e!791642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120102 (= res!937265 (validMask!0 mask!2840))))

(assert (=> start!120102 e!791642))

(assert (=> start!120102 true))

(declare-fun array_inv!35197 (array!95631) Bool)

(assert (=> start!120102 (array_inv!35197 a!2901)))

(declare-fun b!1398349 () Bool)

(declare-fun e!791638 () Bool)

(assert (=> b!1398349 (= e!791638 true)))

(declare-fun lt!614867 () SeekEntryResult!10486)

(declare-fun lt!614868 () SeekEntryResult!10486)

(assert (=> b!1398349 (and (not (undefined!11298 lt!614867)) (= (index!44317 lt!614867) i!1037) (bvslt (x!125964 lt!614867) (x!125964 lt!614868)) (= (select (store (arr!46169 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44317 lt!614867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46976 0))(
  ( (Unit!46977) )
))
(declare-fun lt!614863 () Unit!46976)

(declare-fun lt!614865 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46976)

(assert (=> b!1398349 (= lt!614863 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614865 (x!125964 lt!614868) (index!44317 lt!614868) (x!125964 lt!614867) (index!44317 lt!614867) (undefined!11298 lt!614867) mask!2840))))

(declare-fun b!1398350 () Bool)

(declare-fun e!791641 () Bool)

(assert (=> b!1398350 (= e!791641 e!791638)))

(declare-fun res!937267 () Bool)

(assert (=> b!1398350 (=> res!937267 e!791638)))

(assert (=> b!1398350 (= res!937267 (or (= lt!614868 lt!614867) (not (is-Intermediate!10486 lt!614867))))))

(declare-fun lt!614864 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95631 (_ BitVec 32)) SeekEntryResult!10486)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398350 (= lt!614867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614864 mask!2840) lt!614864 (array!95632 (store (arr!46169 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46719 a!2901)) mask!2840))))

(assert (=> b!1398350 (= lt!614864 (select (store (arr!46169 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398351 () Bool)

(declare-fun res!937262 () Bool)

(assert (=> b!1398351 (=> (not res!937262) (not e!791642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95631 (_ BitVec 32)) Bool)

(assert (=> b!1398351 (= res!937262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398352 () Bool)

(declare-fun res!937261 () Bool)

(assert (=> b!1398352 (=> (not res!937261) (not e!791642))))

(assert (=> b!1398352 (= res!937261 (validKeyInArray!0 (select (arr!46169 a!2901) j!112)))))

(declare-fun b!1398353 () Bool)

(declare-fun res!937260 () Bool)

(assert (=> b!1398353 (=> (not res!937260) (not e!791642))))

(declare-datatypes ((List!32688 0))(
  ( (Nil!32685) (Cons!32684 (h!33926 (_ BitVec 64)) (t!47382 List!32688)) )
))
(declare-fun arrayNoDuplicates!0 (array!95631 (_ BitVec 32) List!32688) Bool)

(assert (=> b!1398353 (= res!937260 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32685))))

(declare-fun b!1398354 () Bool)

(assert (=> b!1398354 (= e!791642 (not e!791641))))

(declare-fun res!937259 () Bool)

(assert (=> b!1398354 (=> res!937259 e!791641)))

(assert (=> b!1398354 (= res!937259 (or (not (is-Intermediate!10486 lt!614868)) (undefined!11298 lt!614868)))))

(assert (=> b!1398354 e!791639))

(declare-fun res!937264 () Bool)

(assert (=> b!1398354 (=> (not res!937264) (not e!791639))))

(assert (=> b!1398354 (= res!937264 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614866 () Unit!46976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46976)

(assert (=> b!1398354 (= lt!614866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398354 (= lt!614868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614865 (select (arr!46169 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398354 (= lt!614865 (toIndex!0 (select (arr!46169 a!2901) j!112) mask!2840))))

(assert (= (and start!120102 res!937265) b!1398346))

(assert (= (and b!1398346 res!937263) b!1398347))

(assert (= (and b!1398347 res!937266) b!1398352))

(assert (= (and b!1398352 res!937261) b!1398351))

(assert (= (and b!1398351 res!937262) b!1398353))

(assert (= (and b!1398353 res!937260) b!1398354))

(assert (= (and b!1398354 res!937264) b!1398348))

(assert (= (and b!1398354 (not res!937259)) b!1398350))

(assert (= (and b!1398350 (not res!937267)) b!1398349))

(declare-fun m!1285437 () Bool)

(assert (=> b!1398347 m!1285437))

(assert (=> b!1398347 m!1285437))

(declare-fun m!1285439 () Bool)

(assert (=> b!1398347 m!1285439))

(declare-fun m!1285441 () Bool)

(assert (=> start!120102 m!1285441))

(declare-fun m!1285443 () Bool)

(assert (=> start!120102 m!1285443))

(declare-fun m!1285445 () Bool)

(assert (=> b!1398352 m!1285445))

(assert (=> b!1398352 m!1285445))

(declare-fun m!1285447 () Bool)

(assert (=> b!1398352 m!1285447))

(declare-fun m!1285449 () Bool)

(assert (=> b!1398351 m!1285449))

(declare-fun m!1285451 () Bool)

(assert (=> b!1398353 m!1285451))

(assert (=> b!1398354 m!1285445))

(declare-fun m!1285453 () Bool)

(assert (=> b!1398354 m!1285453))

(assert (=> b!1398354 m!1285445))

(declare-fun m!1285455 () Bool)

(assert (=> b!1398354 m!1285455))

(assert (=> b!1398354 m!1285445))

(declare-fun m!1285457 () Bool)

(assert (=> b!1398354 m!1285457))

(declare-fun m!1285459 () Bool)

(assert (=> b!1398354 m!1285459))

(assert (=> b!1398348 m!1285445))

(assert (=> b!1398348 m!1285445))

(declare-fun m!1285461 () Bool)

(assert (=> b!1398348 m!1285461))

(declare-fun m!1285463 () Bool)

(assert (=> b!1398350 m!1285463))

(declare-fun m!1285465 () Bool)

(assert (=> b!1398350 m!1285465))

(assert (=> b!1398350 m!1285463))

(declare-fun m!1285467 () Bool)

(assert (=> b!1398350 m!1285467))

(declare-fun m!1285469 () Bool)

(assert (=> b!1398350 m!1285469))

(assert (=> b!1398349 m!1285465))

(declare-fun m!1285471 () Bool)

(assert (=> b!1398349 m!1285471))

(declare-fun m!1285473 () Bool)

(assert (=> b!1398349 m!1285473))

(push 1)

