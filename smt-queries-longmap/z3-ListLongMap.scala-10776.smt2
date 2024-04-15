; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126124 () Bool)

(assert start!126124)

(declare-fun b!1476943 () Bool)

(declare-fun e!828579 () Bool)

(declare-fun e!828577 () Bool)

(assert (=> b!1476943 (= e!828579 e!828577)))

(declare-fun res!1003219 () Bool)

(assert (=> b!1476943 (=> (not res!1003219) (not e!828577))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99208 0))(
  ( (array!99209 (arr!47884 (Array (_ BitVec 32) (_ BitVec 64))) (size!48436 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99208)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12149 0))(
  ( (MissingZero!12149 (index!50988 (_ BitVec 32))) (Found!12149 (index!50989 (_ BitVec 32))) (Intermediate!12149 (undefined!12961 Bool) (index!50990 (_ BitVec 32)) (x!132583 (_ BitVec 32))) (Undefined!12149) (MissingVacant!12149 (index!50991 (_ BitVec 32))) )
))
(declare-fun lt!645018 () SeekEntryResult!12149)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99208 (_ BitVec 32)) SeekEntryResult!12149)

(assert (=> b!1476943 (= res!1003219 (= lt!645018 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47884 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476944 () Bool)

(declare-fun e!828578 () Bool)

(declare-fun e!828580 () Bool)

(assert (=> b!1476944 (= e!828578 e!828580)))

(declare-fun res!1003223 () Bool)

(assert (=> b!1476944 (=> (not res!1003223) (not e!828580))))

(declare-fun lt!645017 () SeekEntryResult!12149)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476944 (= res!1003223 (= lt!645017 (Intermediate!12149 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645015 () array!99208)

(declare-fun lt!645013 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99208 (_ BitVec 32)) SeekEntryResult!12149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476944 (= lt!645017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645013 mask!2687) lt!645013 lt!645015 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476944 (= lt!645013 (select (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476945 () Bool)

(declare-fun res!1003221 () Bool)

(assert (=> b!1476945 (=> (not res!1003221) (not e!828580))))

(declare-fun e!828583 () Bool)

(assert (=> b!1476945 (= res!1003221 e!828583)))

(declare-fun c!136384 () Bool)

(assert (=> b!1476945 (= c!136384 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476946 () Bool)

(assert (=> b!1476946 (= e!828580 (not true))))

(declare-fun e!828582 () Bool)

(assert (=> b!1476946 e!828582))

(declare-fun res!1003232 () Bool)

(assert (=> b!1476946 (=> (not res!1003232) (not e!828582))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1476946 (= res!1003232 (and (= lt!645018 (Found!12149 j!93)) (or (= (select (arr!47884 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47884 a!2862) intermediateBeforeIndex!19) (select (arr!47884 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99208 (_ BitVec 32)) SeekEntryResult!12149)

(assert (=> b!1476946 (= lt!645018 (seekEntryOrOpen!0 (select (arr!47884 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99208 (_ BitVec 32)) Bool)

(assert (=> b!1476946 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49479 0))(
  ( (Unit!49480) )
))
(declare-fun lt!645016 () Unit!49479)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49479)

(assert (=> b!1476946 (= lt!645016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476947 () Bool)

(declare-fun res!1003228 () Bool)

(assert (=> b!1476947 (=> (not res!1003228) (not e!828580))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476947 (= res!1003228 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476948 () Bool)

(declare-fun res!1003233 () Bool)

(declare-fun e!828584 () Bool)

(assert (=> b!1476948 (=> (not res!1003233) (not e!828584))))

(declare-datatypes ((List!34463 0))(
  ( (Nil!34460) (Cons!34459 (h!35827 (_ BitVec 64)) (t!49149 List!34463)) )
))
(declare-fun arrayNoDuplicates!0 (array!99208 (_ BitVec 32) List!34463) Bool)

(assert (=> b!1476948 (= res!1003233 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34460))))

(declare-fun b!1476949 () Bool)

(declare-fun res!1003231 () Bool)

(assert (=> b!1476949 (=> (not res!1003231) (not e!828584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476949 (= res!1003231 (validKeyInArray!0 (select (arr!47884 a!2862) j!93)))))

(declare-fun b!1476950 () Bool)

(assert (=> b!1476950 (= e!828577 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476951 () Bool)

(declare-fun e!828581 () Bool)

(assert (=> b!1476951 (= e!828581 e!828578)))

(declare-fun res!1003234 () Bool)

(assert (=> b!1476951 (=> (not res!1003234) (not e!828578))))

(declare-fun lt!645014 () SeekEntryResult!12149)

(assert (=> b!1476951 (= res!1003234 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47884 a!2862) j!93) mask!2687) (select (arr!47884 a!2862) j!93) a!2862 mask!2687) lt!645014))))

(assert (=> b!1476951 (= lt!645014 (Intermediate!12149 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476952 () Bool)

(declare-fun res!1003226 () Bool)

(assert (=> b!1476952 (=> (not res!1003226) (not e!828584))))

(assert (=> b!1476952 (= res!1003226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476953 () Bool)

(assert (=> b!1476953 (= e!828582 e!828579)))

(declare-fun res!1003230 () Bool)

(assert (=> b!1476953 (=> res!1003230 e!828579)))

(assert (=> b!1476953 (= res!1003230 (or (and (= (select (arr!47884 a!2862) index!646) (select (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47884 a!2862) index!646) (select (arr!47884 a!2862) j!93))) (not (= (select (arr!47884 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476954 () Bool)

(assert (=> b!1476954 (= e!828584 e!828581)))

(declare-fun res!1003222 () Bool)

(assert (=> b!1476954 (=> (not res!1003222) (not e!828581))))

(assert (=> b!1476954 (= res!1003222 (= (select (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476954 (= lt!645015 (array!99209 (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48436 a!2862)))))

(declare-fun b!1476955 () Bool)

(declare-fun res!1003227 () Bool)

(assert (=> b!1476955 (=> (not res!1003227) (not e!828584))))

(assert (=> b!1476955 (= res!1003227 (validKeyInArray!0 (select (arr!47884 a!2862) i!1006)))))

(declare-fun b!1476956 () Bool)

(assert (=> b!1476956 (= e!828583 (= lt!645017 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645013 lt!645015 mask!2687)))))

(declare-fun res!1003229 () Bool)

(assert (=> start!126124 (=> (not res!1003229) (not e!828584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126124 (= res!1003229 (validMask!0 mask!2687))))

(assert (=> start!126124 e!828584))

(assert (=> start!126124 true))

(declare-fun array_inv!37117 (array!99208) Bool)

(assert (=> start!126124 (array_inv!37117 a!2862)))

(declare-fun b!1476957 () Bool)

(declare-fun res!1003220 () Bool)

(assert (=> b!1476957 (=> (not res!1003220) (not e!828584))))

(assert (=> b!1476957 (= res!1003220 (and (= (size!48436 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48436 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48436 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476958 () Bool)

(declare-fun res!1003224 () Bool)

(assert (=> b!1476958 (=> (not res!1003224) (not e!828578))))

(assert (=> b!1476958 (= res!1003224 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47884 a!2862) j!93) a!2862 mask!2687) lt!645014))))

(declare-fun b!1476959 () Bool)

(assert (=> b!1476959 (= e!828583 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645013 lt!645015 mask!2687) (seekEntryOrOpen!0 lt!645013 lt!645015 mask!2687)))))

(declare-fun b!1476960 () Bool)

(declare-fun res!1003225 () Bool)

(assert (=> b!1476960 (=> (not res!1003225) (not e!828584))))

(assert (=> b!1476960 (= res!1003225 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48436 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48436 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48436 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126124 res!1003229) b!1476957))

(assert (= (and b!1476957 res!1003220) b!1476955))

(assert (= (and b!1476955 res!1003227) b!1476949))

(assert (= (and b!1476949 res!1003231) b!1476952))

(assert (= (and b!1476952 res!1003226) b!1476948))

(assert (= (and b!1476948 res!1003233) b!1476960))

(assert (= (and b!1476960 res!1003225) b!1476954))

(assert (= (and b!1476954 res!1003222) b!1476951))

(assert (= (and b!1476951 res!1003234) b!1476958))

(assert (= (and b!1476958 res!1003224) b!1476944))

(assert (= (and b!1476944 res!1003223) b!1476945))

(assert (= (and b!1476945 c!136384) b!1476956))

(assert (= (and b!1476945 (not c!136384)) b!1476959))

(assert (= (and b!1476945 res!1003221) b!1476947))

(assert (= (and b!1476947 res!1003228) b!1476946))

(assert (= (and b!1476946 res!1003232) b!1476953))

(assert (= (and b!1476953 (not res!1003230)) b!1476943))

(assert (= (and b!1476943 res!1003219) b!1476950))

(declare-fun m!1362423 () Bool)

(assert (=> b!1476954 m!1362423))

(declare-fun m!1362425 () Bool)

(assert (=> b!1476954 m!1362425))

(declare-fun m!1362427 () Bool)

(assert (=> b!1476943 m!1362427))

(assert (=> b!1476943 m!1362427))

(declare-fun m!1362429 () Bool)

(assert (=> b!1476943 m!1362429))

(declare-fun m!1362431 () Bool)

(assert (=> b!1476948 m!1362431))

(declare-fun m!1362433 () Bool)

(assert (=> b!1476944 m!1362433))

(assert (=> b!1476944 m!1362433))

(declare-fun m!1362435 () Bool)

(assert (=> b!1476944 m!1362435))

(assert (=> b!1476944 m!1362423))

(declare-fun m!1362437 () Bool)

(assert (=> b!1476944 m!1362437))

(assert (=> b!1476951 m!1362427))

(assert (=> b!1476951 m!1362427))

(declare-fun m!1362439 () Bool)

(assert (=> b!1476951 m!1362439))

(assert (=> b!1476951 m!1362439))

(assert (=> b!1476951 m!1362427))

(declare-fun m!1362441 () Bool)

(assert (=> b!1476951 m!1362441))

(declare-fun m!1362443 () Bool)

(assert (=> start!126124 m!1362443))

(declare-fun m!1362445 () Bool)

(assert (=> start!126124 m!1362445))

(declare-fun m!1362447 () Bool)

(assert (=> b!1476952 m!1362447))

(assert (=> b!1476949 m!1362427))

(assert (=> b!1476949 m!1362427))

(declare-fun m!1362449 () Bool)

(assert (=> b!1476949 m!1362449))

(assert (=> b!1476958 m!1362427))

(assert (=> b!1476958 m!1362427))

(declare-fun m!1362451 () Bool)

(assert (=> b!1476958 m!1362451))

(declare-fun m!1362453 () Bool)

(assert (=> b!1476946 m!1362453))

(declare-fun m!1362455 () Bool)

(assert (=> b!1476946 m!1362455))

(assert (=> b!1476946 m!1362427))

(declare-fun m!1362457 () Bool)

(assert (=> b!1476946 m!1362457))

(declare-fun m!1362459 () Bool)

(assert (=> b!1476946 m!1362459))

(assert (=> b!1476946 m!1362427))

(declare-fun m!1362461 () Bool)

(assert (=> b!1476953 m!1362461))

(assert (=> b!1476953 m!1362423))

(declare-fun m!1362463 () Bool)

(assert (=> b!1476953 m!1362463))

(assert (=> b!1476953 m!1362427))

(declare-fun m!1362465 () Bool)

(assert (=> b!1476955 m!1362465))

(assert (=> b!1476955 m!1362465))

(declare-fun m!1362467 () Bool)

(assert (=> b!1476955 m!1362467))

(declare-fun m!1362469 () Bool)

(assert (=> b!1476956 m!1362469))

(declare-fun m!1362471 () Bool)

(assert (=> b!1476959 m!1362471))

(declare-fun m!1362473 () Bool)

(assert (=> b!1476959 m!1362473))

(check-sat (not b!1476943) (not start!126124) (not b!1476956) (not b!1476944) (not b!1476959) (not b!1476952) (not b!1476955) (not b!1476948) (not b!1476949) (not b!1476958) (not b!1476951) (not b!1476946))
(check-sat)
