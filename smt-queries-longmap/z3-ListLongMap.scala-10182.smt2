; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120206 () Bool)

(assert start!120206)

(declare-datatypes ((array!95657 0))(
  ( (array!95658 (arr!46180 (Array (_ BitVec 32) (_ BitVec 64))) (size!46731 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95657)

(declare-fun e!791738 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1398343 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10400 0))(
  ( (MissingZero!10400 (index!43971 (_ BitVec 32))) (Found!10400 (index!43972 (_ BitVec 32))) (Intermediate!10400 (undefined!11212 Bool) (index!43973 (_ BitVec 32)) (x!125785 (_ BitVec 32))) (Undefined!10400) (MissingVacant!10400 (index!43974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95657 (_ BitVec 32)) SeekEntryResult!10400)

(assert (=> b!1398343 (= e!791738 (= (seekEntryOrOpen!0 (select (arr!46180 a!2901) j!112) a!2901 mask!2840) (Found!10400 j!112)))))

(declare-fun b!1398344 () Bool)

(declare-fun res!936578 () Bool)

(declare-fun e!791739 () Bool)

(assert (=> b!1398344 (=> (not res!936578) (not e!791739))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398344 (= res!936578 (and (= (size!46731 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46731 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46731 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398345 () Bool)

(declare-fun e!791741 () Bool)

(declare-fun e!791737 () Bool)

(assert (=> b!1398345 (= e!791741 e!791737)))

(declare-fun res!936572 () Bool)

(assert (=> b!1398345 (=> res!936572 e!791737)))

(declare-fun lt!614418 () (_ BitVec 32))

(declare-fun lt!614423 () SeekEntryResult!10400)

(declare-fun lt!614422 () SeekEntryResult!10400)

(get-info :version)

(assert (=> b!1398345 (= res!936572 (or (= lt!614423 lt!614422) (not ((_ is Intermediate!10400) lt!614422)) (bvslt (x!125785 lt!614423) #b00000000000000000000000000000000) (bvsgt (x!125785 lt!614423) #b01111111111111111111111111111110) (bvslt lt!614418 #b00000000000000000000000000000000) (bvsge lt!614418 (size!46731 a!2901)) (bvslt (index!43973 lt!614423) #b00000000000000000000000000000000) (bvsge (index!43973 lt!614423) (size!46731 a!2901)) (not (= lt!614423 (Intermediate!10400 false (index!43973 lt!614423) (x!125785 lt!614423)))) (not (= lt!614422 (Intermediate!10400 (undefined!11212 lt!614422) (index!43973 lt!614422) (x!125785 lt!614422))))))))

(declare-fun lt!614419 () array!95657)

(declare-fun lt!614417 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95657 (_ BitVec 32)) SeekEntryResult!10400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398345 (= lt!614422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614417 mask!2840) lt!614417 lt!614419 mask!2840))))

(assert (=> b!1398345 (= lt!614417 (select (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398345 (= lt!614419 (array!95658 (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901)))))

(declare-fun b!1398346 () Bool)

(declare-fun res!936580 () Bool)

(assert (=> b!1398346 (=> (not res!936580) (not e!791739))))

(declare-datatypes ((List!32686 0))(
  ( (Nil!32683) (Cons!32682 (h!33932 (_ BitVec 64)) (t!47372 List!32686)) )
))
(declare-fun arrayNoDuplicates!0 (array!95657 (_ BitVec 32) List!32686) Bool)

(assert (=> b!1398346 (= res!936580 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32683))))

(declare-fun b!1398347 () Bool)

(assert (=> b!1398347 (= e!791737 true)))

(declare-fun lt!614420 () SeekEntryResult!10400)

(assert (=> b!1398347 (= lt!614420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614418 lt!614417 lt!614419 mask!2840))))

(declare-fun b!1398348 () Bool)

(assert (=> b!1398348 (= e!791739 (not e!791741))))

(declare-fun res!936579 () Bool)

(assert (=> b!1398348 (=> res!936579 e!791741)))

(assert (=> b!1398348 (= res!936579 (or (not ((_ is Intermediate!10400) lt!614423)) (undefined!11212 lt!614423)))))

(assert (=> b!1398348 e!791738))

(declare-fun res!936576 () Bool)

(assert (=> b!1398348 (=> (not res!936576) (not e!791738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95657 (_ BitVec 32)) Bool)

(assert (=> b!1398348 (= res!936576 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46831 0))(
  ( (Unit!46832) )
))
(declare-fun lt!614421 () Unit!46831)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46831)

(assert (=> b!1398348 (= lt!614421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398348 (= lt!614423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614418 (select (arr!46180 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398348 (= lt!614418 (toIndex!0 (select (arr!46180 a!2901) j!112) mask!2840))))

(declare-fun res!936577 () Bool)

(assert (=> start!120206 (=> (not res!936577) (not e!791739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120206 (= res!936577 (validMask!0 mask!2840))))

(assert (=> start!120206 e!791739))

(assert (=> start!120206 true))

(declare-fun array_inv!35461 (array!95657) Bool)

(assert (=> start!120206 (array_inv!35461 a!2901)))

(declare-fun b!1398349 () Bool)

(declare-fun res!936573 () Bool)

(assert (=> b!1398349 (=> (not res!936573) (not e!791739))))

(assert (=> b!1398349 (= res!936573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398350 () Bool)

(declare-fun res!936575 () Bool)

(assert (=> b!1398350 (=> (not res!936575) (not e!791739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398350 (= res!936575 (validKeyInArray!0 (select (arr!46180 a!2901) j!112)))))

(declare-fun b!1398351 () Bool)

(declare-fun res!936574 () Bool)

(assert (=> b!1398351 (=> (not res!936574) (not e!791739))))

(assert (=> b!1398351 (= res!936574 (validKeyInArray!0 (select (arr!46180 a!2901) i!1037)))))

(assert (= (and start!120206 res!936577) b!1398344))

(assert (= (and b!1398344 res!936578) b!1398351))

(assert (= (and b!1398351 res!936574) b!1398350))

(assert (= (and b!1398350 res!936575) b!1398349))

(assert (= (and b!1398349 res!936573) b!1398346))

(assert (= (and b!1398346 res!936580) b!1398348))

(assert (= (and b!1398348 res!936576) b!1398343))

(assert (= (and b!1398348 (not res!936579)) b!1398345))

(assert (= (and b!1398345 (not res!936572)) b!1398347))

(declare-fun m!1285267 () Bool)

(assert (=> b!1398348 m!1285267))

(declare-fun m!1285269 () Bool)

(assert (=> b!1398348 m!1285269))

(assert (=> b!1398348 m!1285267))

(assert (=> b!1398348 m!1285267))

(declare-fun m!1285271 () Bool)

(assert (=> b!1398348 m!1285271))

(declare-fun m!1285273 () Bool)

(assert (=> b!1398348 m!1285273))

(declare-fun m!1285275 () Bool)

(assert (=> b!1398348 m!1285275))

(declare-fun m!1285277 () Bool)

(assert (=> b!1398346 m!1285277))

(declare-fun m!1285279 () Bool)

(assert (=> b!1398351 m!1285279))

(assert (=> b!1398351 m!1285279))

(declare-fun m!1285281 () Bool)

(assert (=> b!1398351 m!1285281))

(declare-fun m!1285283 () Bool)

(assert (=> b!1398345 m!1285283))

(assert (=> b!1398345 m!1285283))

(declare-fun m!1285285 () Bool)

(assert (=> b!1398345 m!1285285))

(declare-fun m!1285287 () Bool)

(assert (=> b!1398345 m!1285287))

(declare-fun m!1285289 () Bool)

(assert (=> b!1398345 m!1285289))

(declare-fun m!1285291 () Bool)

(assert (=> b!1398349 m!1285291))

(assert (=> b!1398343 m!1285267))

(assert (=> b!1398343 m!1285267))

(declare-fun m!1285293 () Bool)

(assert (=> b!1398343 m!1285293))

(declare-fun m!1285295 () Bool)

(assert (=> b!1398347 m!1285295))

(declare-fun m!1285297 () Bool)

(assert (=> start!120206 m!1285297))

(declare-fun m!1285299 () Bool)

(assert (=> start!120206 m!1285299))

(assert (=> b!1398350 m!1285267))

(assert (=> b!1398350 m!1285267))

(declare-fun m!1285301 () Bool)

(assert (=> b!1398350 m!1285301))

(check-sat (not b!1398343) (not b!1398350) (not b!1398348) (not b!1398351) (not start!120206) (not b!1398347) (not b!1398346) (not b!1398345) (not b!1398349))
(check-sat)
