; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126186 () Bool)

(assert start!126186)

(declare-fun b!1475919 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644821 () (_ BitVec 64))

(declare-fun e!828246 () Bool)

(declare-datatypes ((SeekEntryResult!12066 0))(
  ( (MissingZero!12066 (index!50656 (_ BitVec 32))) (Found!12066 (index!50657 (_ BitVec 32))) (Intermediate!12066 (undefined!12878 Bool) (index!50658 (_ BitVec 32)) (x!132423 (_ BitVec 32))) (Undefined!12066) (MissingVacant!12066 (index!50659 (_ BitVec 32))) )
))
(declare-fun lt!644824 () SeekEntryResult!12066)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99301 0))(
  ( (array!99302 (arr!47929 (Array (_ BitVec 32) (_ BitVec 64))) (size!48480 (_ BitVec 32))) )
))
(declare-fun lt!644820 () array!99301)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99301 (_ BitVec 32)) SeekEntryResult!12066)

(assert (=> b!1475919 (= e!828246 (= lt!644824 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644821 lt!644820 mask!2687)))))

(declare-fun b!1475920 () Bool)

(declare-fun e!828243 () Bool)

(declare-fun e!828244 () Bool)

(assert (=> b!1475920 (= e!828243 e!828244)))

(declare-fun res!1002052 () Bool)

(assert (=> b!1475920 (=> (not res!1002052) (not e!828244))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1475920 (= res!1002052 (= lt!644824 (Intermediate!12066 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475920 (= lt!644824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644821 mask!2687) lt!644821 lt!644820 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99301)

(assert (=> b!1475920 (= lt!644821 (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475921 () Bool)

(declare-fun res!1002054 () Bool)

(assert (=> b!1475921 (=> (not res!1002054) (not e!828244))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475921 (= res!1002054 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!828240 () Bool)

(declare-fun b!1475922 () Bool)

(assert (=> b!1475922 (= e!828240 (or (= (select (arr!47929 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47929 a!2862) intermediateBeforeIndex!19) (select (arr!47929 a!2862) j!93))))))

(declare-fun b!1475923 () Bool)

(declare-fun res!1002064 () Bool)

(assert (=> b!1475923 (=> (not res!1002064) (not e!828243))))

(declare-fun lt!644823 () SeekEntryResult!12066)

(assert (=> b!1475923 (= res!1002064 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47929 a!2862) j!93) a!2862 mask!2687) lt!644823))))

(declare-fun b!1475924 () Bool)

(declare-fun e!828242 () Bool)

(declare-fun e!828245 () Bool)

(assert (=> b!1475924 (= e!828242 e!828245)))

(declare-fun res!1002053 () Bool)

(assert (=> b!1475924 (=> (not res!1002053) (not e!828245))))

(assert (=> b!1475924 (= res!1002053 (= (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475924 (= lt!644820 (array!99302 (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48480 a!2862)))))

(declare-fun b!1475925 () Bool)

(declare-fun res!1002055 () Bool)

(assert (=> b!1475925 (=> (not res!1002055) (not e!828240))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99301 (_ BitVec 32)) SeekEntryResult!12066)

(assert (=> b!1475925 (= res!1002055 (= (seekEntryOrOpen!0 (select (arr!47929 a!2862) j!93) a!2862 mask!2687) (Found!12066 j!93)))))

(declare-fun b!1475926 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99301 (_ BitVec 32)) SeekEntryResult!12066)

(assert (=> b!1475926 (= e!828246 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644821 lt!644820 mask!2687) (seekEntryOrOpen!0 lt!644821 lt!644820 mask!2687)))))

(declare-fun b!1475927 () Bool)

(declare-fun res!1002063 () Bool)

(assert (=> b!1475927 (=> (not res!1002063) (not e!828242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475927 (= res!1002063 (validKeyInArray!0 (select (arr!47929 a!2862) j!93)))))

(declare-fun b!1475928 () Bool)

(declare-fun res!1002051 () Bool)

(assert (=> b!1475928 (=> (not res!1002051) (not e!828244))))

(assert (=> b!1475928 (= res!1002051 e!828246)))

(declare-fun c!136459 () Bool)

(assert (=> b!1475928 (= c!136459 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475929 () Bool)

(declare-fun res!1002058 () Bool)

(assert (=> b!1475929 (=> (not res!1002058) (not e!828242))))

(assert (=> b!1475929 (= res!1002058 (validKeyInArray!0 (select (arr!47929 a!2862) i!1006)))))

(declare-fun res!1002061 () Bool)

(assert (=> start!126186 (=> (not res!1002061) (not e!828242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126186 (= res!1002061 (validMask!0 mask!2687))))

(assert (=> start!126186 e!828242))

(assert (=> start!126186 true))

(declare-fun array_inv!37210 (array!99301) Bool)

(assert (=> start!126186 (array_inv!37210 a!2862)))

(declare-fun b!1475930 () Bool)

(declare-fun res!1002065 () Bool)

(assert (=> b!1475930 (=> (not res!1002065) (not e!828242))))

(assert (=> b!1475930 (= res!1002065 (and (= (size!48480 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48480 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48480 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475931 () Bool)

(declare-fun res!1002062 () Bool)

(assert (=> b!1475931 (=> (not res!1002062) (not e!828242))))

(assert (=> b!1475931 (= res!1002062 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48480 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48480 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48480 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475932 () Bool)

(assert (=> b!1475932 (= e!828245 e!828243)))

(declare-fun res!1002056 () Bool)

(assert (=> b!1475932 (=> (not res!1002056) (not e!828243))))

(assert (=> b!1475932 (= res!1002056 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47929 a!2862) j!93) mask!2687) (select (arr!47929 a!2862) j!93) a!2862 mask!2687) lt!644823))))

(assert (=> b!1475932 (= lt!644823 (Intermediate!12066 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475933 () Bool)

(declare-fun res!1002057 () Bool)

(assert (=> b!1475933 (=> (not res!1002057) (not e!828242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99301 (_ BitVec 32)) Bool)

(assert (=> b!1475933 (= res!1002057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475934 () Bool)

(declare-fun res!1002060 () Bool)

(assert (=> b!1475934 (=> (not res!1002060) (not e!828242))))

(declare-datatypes ((List!34417 0))(
  ( (Nil!34414) (Cons!34413 (h!35786 (_ BitVec 64)) (t!49103 List!34417)) )
))
(declare-fun arrayNoDuplicates!0 (array!99301 (_ BitVec 32) List!34417) Bool)

(assert (=> b!1475934 (= res!1002060 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34414))))

(declare-fun b!1475935 () Bool)

(assert (=> b!1475935 (= e!828244 (not true))))

(assert (=> b!1475935 e!828240))

(declare-fun res!1002059 () Bool)

(assert (=> b!1475935 (=> (not res!1002059) (not e!828240))))

(assert (=> b!1475935 (= res!1002059 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49505 0))(
  ( (Unit!49506) )
))
(declare-fun lt!644822 () Unit!49505)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49505)

(assert (=> b!1475935 (= lt!644822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126186 res!1002061) b!1475930))

(assert (= (and b!1475930 res!1002065) b!1475929))

(assert (= (and b!1475929 res!1002058) b!1475927))

(assert (= (and b!1475927 res!1002063) b!1475933))

(assert (= (and b!1475933 res!1002057) b!1475934))

(assert (= (and b!1475934 res!1002060) b!1475931))

(assert (= (and b!1475931 res!1002062) b!1475924))

(assert (= (and b!1475924 res!1002053) b!1475932))

(assert (= (and b!1475932 res!1002056) b!1475923))

(assert (= (and b!1475923 res!1002064) b!1475920))

(assert (= (and b!1475920 res!1002052) b!1475928))

(assert (= (and b!1475928 c!136459) b!1475919))

(assert (= (and b!1475928 (not c!136459)) b!1475926))

(assert (= (and b!1475928 res!1002051) b!1475921))

(assert (= (and b!1475921 res!1002054) b!1475935))

(assert (= (and b!1475935 res!1002059) b!1475925))

(assert (= (and b!1475925 res!1002055) b!1475922))

(declare-fun m!1362367 () Bool)

(assert (=> b!1475934 m!1362367))

(declare-fun m!1362369 () Bool)

(assert (=> start!126186 m!1362369))

(declare-fun m!1362371 () Bool)

(assert (=> start!126186 m!1362371))

(declare-fun m!1362373 () Bool)

(assert (=> b!1475933 m!1362373))

(declare-fun m!1362375 () Bool)

(assert (=> b!1475929 m!1362375))

(assert (=> b!1475929 m!1362375))

(declare-fun m!1362377 () Bool)

(assert (=> b!1475929 m!1362377))

(declare-fun m!1362379 () Bool)

(assert (=> b!1475920 m!1362379))

(assert (=> b!1475920 m!1362379))

(declare-fun m!1362381 () Bool)

(assert (=> b!1475920 m!1362381))

(declare-fun m!1362383 () Bool)

(assert (=> b!1475920 m!1362383))

(declare-fun m!1362385 () Bool)

(assert (=> b!1475920 m!1362385))

(assert (=> b!1475924 m!1362383))

(declare-fun m!1362387 () Bool)

(assert (=> b!1475924 m!1362387))

(declare-fun m!1362389 () Bool)

(assert (=> b!1475935 m!1362389))

(declare-fun m!1362391 () Bool)

(assert (=> b!1475935 m!1362391))

(declare-fun m!1362393 () Bool)

(assert (=> b!1475927 m!1362393))

(assert (=> b!1475927 m!1362393))

(declare-fun m!1362395 () Bool)

(assert (=> b!1475927 m!1362395))

(declare-fun m!1362397 () Bool)

(assert (=> b!1475919 m!1362397))

(assert (=> b!1475923 m!1362393))

(assert (=> b!1475923 m!1362393))

(declare-fun m!1362399 () Bool)

(assert (=> b!1475923 m!1362399))

(assert (=> b!1475932 m!1362393))

(assert (=> b!1475932 m!1362393))

(declare-fun m!1362401 () Bool)

(assert (=> b!1475932 m!1362401))

(assert (=> b!1475932 m!1362401))

(assert (=> b!1475932 m!1362393))

(declare-fun m!1362403 () Bool)

(assert (=> b!1475932 m!1362403))

(assert (=> b!1475925 m!1362393))

(assert (=> b!1475925 m!1362393))

(declare-fun m!1362405 () Bool)

(assert (=> b!1475925 m!1362405))

(declare-fun m!1362407 () Bool)

(assert (=> b!1475926 m!1362407))

(declare-fun m!1362409 () Bool)

(assert (=> b!1475926 m!1362409))

(declare-fun m!1362411 () Bool)

(assert (=> b!1475922 m!1362411))

(assert (=> b!1475922 m!1362393))

(check-sat (not start!126186) (not b!1475926) (not b!1475919) (not b!1475932) (not b!1475925) (not b!1475923) (not b!1475935) (not b!1475927) (not b!1475929) (not b!1475933) (not b!1475934) (not b!1475920))
(check-sat)
