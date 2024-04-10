; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118400 () Bool)

(assert start!118400)

(declare-fun b!1384960 () Bool)

(declare-fun res!926294 () Bool)

(declare-fun e!784748 () Bool)

(assert (=> b!1384960 (=> (not res!926294) (not e!784748))))

(declare-datatypes ((array!94703 0))(
  ( (array!94704 (arr!45729 (Array (_ BitVec 32) (_ BitVec 64))) (size!46279 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94703)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384960 (= res!926294 (and (not (= (select (arr!45729 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45729 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384961 () Bool)

(declare-fun res!926292 () Bool)

(assert (=> b!1384961 (=> (not res!926292) (not e!784748))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384961 (= res!926292 (and (= (size!46279 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46279 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46279 a!2938))))))

(declare-fun b!1384962 () Bool)

(declare-datatypes ((Unit!46224 0))(
  ( (Unit!46225) )
))
(declare-fun e!784751 () Unit!46224)

(declare-fun lt!609124 () Unit!46224)

(assert (=> b!1384962 (= e!784751 lt!609124)))

(declare-fun lt!609126 () Unit!46224)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> b!1384962 (= lt!609126 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10122 0))(
  ( (MissingZero!10122 (index!42859 (_ BitVec 32))) (Found!10122 (index!42860 (_ BitVec 32))) (Intermediate!10122 (undefined!10934 Bool) (index!42861 (_ BitVec 32)) (x!124355 (_ BitVec 32))) (Undefined!10122) (MissingVacant!10122 (index!42862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94703 (_ BitVec 32)) SeekEntryResult!10122)

(assert (=> b!1384962 (= (seekEntryOrOpen!0 (select (arr!45729 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45729 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94704 (store (arr!45729 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46279 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46224)

(assert (=> b!1384962 (= lt!609124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94703 (_ BitVec 32)) Bool)

(assert (=> b!1384962 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384963 () Bool)

(declare-fun Unit!46226 () Unit!46224)

(assert (=> b!1384963 (= e!784751 Unit!46226)))

(declare-fun b!1384964 () Bool)

(declare-fun res!926293 () Bool)

(assert (=> b!1384964 (=> (not res!926293) (not e!784748))))

(declare-datatypes ((List!32257 0))(
  ( (Nil!32254) (Cons!32253 (h!33462 (_ BitVec 64)) (t!46951 List!32257)) )
))
(declare-fun arrayNoDuplicates!0 (array!94703 (_ BitVec 32) List!32257) Bool)

(assert (=> b!1384964 (= res!926293 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32254))))

(declare-fun b!1384965 () Bool)

(declare-fun res!926296 () Bool)

(assert (=> b!1384965 (=> (not res!926296) (not e!784748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384965 (= res!926296 (validKeyInArray!0 (select (arr!45729 a!2938) i!1065)))))

(declare-fun b!1384966 () Bool)

(declare-fun res!926291 () Bool)

(assert (=> b!1384966 (=> (not res!926291) (not e!784748))))

(assert (=> b!1384966 (= res!926291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384967 () Bool)

(declare-fun e!784749 () Bool)

(assert (=> b!1384967 (= e!784749 (validKeyInArray!0 (select (arr!45729 a!2938) startIndex!16)))))

(declare-fun b!1384968 () Bool)

(assert (=> b!1384968 (= e!784748 false)))

(declare-fun lt!609125 () Unit!46224)

(assert (=> b!1384968 (= lt!609125 e!784751)))

(declare-fun c!128775 () Bool)

(assert (=> b!1384968 (= c!128775 e!784749)))

(declare-fun res!926290 () Bool)

(assert (=> b!1384968 (=> (not res!926290) (not e!784749))))

(assert (=> b!1384968 (= res!926290 (not (= startIndex!16 i!1065)))))

(declare-fun res!926295 () Bool)

(assert (=> start!118400 (=> (not res!926295) (not e!784748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118400 (= res!926295 (validMask!0 mask!2987))))

(assert (=> start!118400 e!784748))

(assert (=> start!118400 true))

(declare-fun array_inv!34757 (array!94703) Bool)

(assert (=> start!118400 (array_inv!34757 a!2938)))

(assert (= (and start!118400 res!926295) b!1384961))

(assert (= (and b!1384961 res!926292) b!1384965))

(assert (= (and b!1384965 res!926296) b!1384964))

(assert (= (and b!1384964 res!926293) b!1384966))

(assert (= (and b!1384966 res!926291) b!1384960))

(assert (= (and b!1384960 res!926294) b!1384968))

(assert (= (and b!1384968 res!926290) b!1384967))

(assert (= (and b!1384968 c!128775) b!1384962))

(assert (= (and b!1384968 (not c!128775)) b!1384963))

(declare-fun m!1270269 () Bool)

(assert (=> b!1384966 m!1270269))

(declare-fun m!1270271 () Bool)

(assert (=> start!118400 m!1270271))

(declare-fun m!1270273 () Bool)

(assert (=> start!118400 m!1270273))

(declare-fun m!1270275 () Bool)

(assert (=> b!1384965 m!1270275))

(assert (=> b!1384965 m!1270275))

(declare-fun m!1270277 () Bool)

(assert (=> b!1384965 m!1270277))

(declare-fun m!1270279 () Bool)

(assert (=> b!1384964 m!1270279))

(declare-fun m!1270281 () Bool)

(assert (=> b!1384967 m!1270281))

(assert (=> b!1384967 m!1270281))

(declare-fun m!1270283 () Bool)

(assert (=> b!1384967 m!1270283))

(assert (=> b!1384960 m!1270275))

(declare-fun m!1270285 () Bool)

(assert (=> b!1384962 m!1270285))

(declare-fun m!1270287 () Bool)

(assert (=> b!1384962 m!1270287))

(assert (=> b!1384962 m!1270287))

(declare-fun m!1270289 () Bool)

(assert (=> b!1384962 m!1270289))

(declare-fun m!1270291 () Bool)

(assert (=> b!1384962 m!1270291))

(declare-fun m!1270293 () Bool)

(assert (=> b!1384962 m!1270293))

(assert (=> b!1384962 m!1270281))

(declare-fun m!1270295 () Bool)

(assert (=> b!1384962 m!1270295))

(assert (=> b!1384962 m!1270281))

(declare-fun m!1270297 () Bool)

(assert (=> b!1384962 m!1270297))

(check-sat (not b!1384965) (not start!118400) (not b!1384967) (not b!1384962) (not b!1384966) (not b!1384964))
