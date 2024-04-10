; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131202 () Bool)

(assert start!131202)

(declare-fun b!1539225 () Bool)

(declare-fun res!1056206 () Bool)

(declare-fun e!856170 () Bool)

(assert (=> b!1539225 (=> (not res!1056206) (not e!856170))))

(declare-datatypes ((array!102267 0))(
  ( (array!102268 (arr!49348 (Array (_ BitVec 32) (_ BitVec 64))) (size!49898 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102267)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102267 (_ BitVec 32)) Bool)

(assert (=> b!1539225 (= res!1056206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539226 () Bool)

(declare-fun res!1056210 () Bool)

(assert (=> b!1539226 (=> (not res!1056210) (not e!856170))))

(declare-datatypes ((List!35822 0))(
  ( (Nil!35819) (Cons!35818 (h!37263 (_ BitVec 64)) (t!50516 List!35822)) )
))
(declare-fun arrayNoDuplicates!0 (array!102267 (_ BitVec 32) List!35822) Bool)

(assert (=> b!1539226 (= res!1056210 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35819))))

(declare-fun b!1539227 () Bool)

(declare-fun res!1056208 () Bool)

(assert (=> b!1539227 (=> (not res!1056208) (not e!856170))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13474 0))(
  ( (MissingZero!13474 (index!56291 (_ BitVec 32))) (Found!13474 (index!56292 (_ BitVec 32))) (Intermediate!13474 (undefined!14286 Bool) (index!56293 (_ BitVec 32)) (x!138015 (_ BitVec 32))) (Undefined!13474) (MissingVacant!13474 (index!56294 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102267 (_ BitVec 32)) SeekEntryResult!13474)

(assert (=> b!1539227 (= res!1056208 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49348 a!2792) j!64) a!2792 mask!2480) (Found!13474 j!64)))))

(declare-fun b!1539228 () Bool)

(declare-fun res!1056207 () Bool)

(assert (=> b!1539228 (=> (not res!1056207) (not e!856170))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539228 (= res!1056207 (and (= (size!49898 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49898 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49898 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539229 () Bool)

(declare-fun res!1056205 () Bool)

(assert (=> b!1539229 (=> (not res!1056205) (not e!856170))))

(assert (=> b!1539229 (= res!1056205 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49898 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49898 a!2792)) (= (select (arr!49348 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539231 () Bool)

(declare-fun res!1056203 () Bool)

(assert (=> b!1539231 (=> (not res!1056203) (not e!856170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539231 (= res!1056203 (validKeyInArray!0 (select (arr!49348 a!2792) j!64)))))

(declare-fun b!1539232 () Bool)

(declare-fun res!1056209 () Bool)

(assert (=> b!1539232 (=> (not res!1056209) (not e!856170))))

(assert (=> b!1539232 (= res!1056209 (validKeyInArray!0 (select (arr!49348 a!2792) i!951)))))

(declare-fun b!1539233 () Bool)

(assert (=> b!1539233 (= e!856170 (or (bvslt (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110)))))

(declare-fun lt!664987 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539233 (= lt!664987 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539230 () Bool)

(declare-fun res!1056204 () Bool)

(assert (=> b!1539230 (=> (not res!1056204) (not e!856170))))

(assert (=> b!1539230 (= res!1056204 (not (= (select (arr!49348 a!2792) index!463) (select (arr!49348 a!2792) j!64))))))

(declare-fun res!1056211 () Bool)

(assert (=> start!131202 (=> (not res!1056211) (not e!856170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131202 (= res!1056211 (validMask!0 mask!2480))))

(assert (=> start!131202 e!856170))

(assert (=> start!131202 true))

(declare-fun array_inv!38376 (array!102267) Bool)

(assert (=> start!131202 (array_inv!38376 a!2792)))

(assert (= (and start!131202 res!1056211) b!1539228))

(assert (= (and b!1539228 res!1056207) b!1539232))

(assert (= (and b!1539232 res!1056209) b!1539231))

(assert (= (and b!1539231 res!1056203) b!1539225))

(assert (= (and b!1539225 res!1056206) b!1539226))

(assert (= (and b!1539226 res!1056210) b!1539229))

(assert (= (and b!1539229 res!1056205) b!1539227))

(assert (= (and b!1539227 res!1056208) b!1539230))

(assert (= (and b!1539230 res!1056204) b!1539233))

(declare-fun m!1421571 () Bool)

(assert (=> b!1539227 m!1421571))

(assert (=> b!1539227 m!1421571))

(declare-fun m!1421573 () Bool)

(assert (=> b!1539227 m!1421573))

(declare-fun m!1421575 () Bool)

(assert (=> b!1539225 m!1421575))

(declare-fun m!1421577 () Bool)

(assert (=> b!1539226 m!1421577))

(declare-fun m!1421579 () Bool)

(assert (=> b!1539229 m!1421579))

(declare-fun m!1421581 () Bool)

(assert (=> b!1539233 m!1421581))

(declare-fun m!1421583 () Bool)

(assert (=> b!1539232 m!1421583))

(assert (=> b!1539232 m!1421583))

(declare-fun m!1421585 () Bool)

(assert (=> b!1539232 m!1421585))

(declare-fun m!1421587 () Bool)

(assert (=> b!1539230 m!1421587))

(assert (=> b!1539230 m!1421571))

(declare-fun m!1421589 () Bool)

(assert (=> start!131202 m!1421589))

(declare-fun m!1421591 () Bool)

(assert (=> start!131202 m!1421591))

(assert (=> b!1539231 m!1421571))

(assert (=> b!1539231 m!1421571))

(declare-fun m!1421593 () Bool)

(assert (=> b!1539231 m!1421593))

(push 1)

(assert (not b!1539233))

(assert (not b!1539226))

(assert (not start!131202))

(assert (not b!1539227))

(assert (not b!1539231))

(assert (not b!1539225))

(assert (not b!1539232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160383 () Bool)

(assert (=> d!160383 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131202 d!160383))

(declare-fun d!160393 () Bool)

(assert (=> d!160393 (= (array_inv!38376 a!2792) (bvsge (size!49898 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131202 d!160393))

(declare-fun d!160395 () Bool)

(assert (=> d!160395 (= (validKeyInArray!0 (select (arr!49348 a!2792) j!64)) (and (not (= (select (arr!49348 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49348 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539231 d!160395))

(declare-fun bm!68601 () Bool)

(declare-fun call!68604 () Bool)

(assert (=> bm!68601 (= call!68604 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1539281 () Bool)

(declare-fun e!856203 () Bool)

(assert (=> b!1539281 (= e!856203 call!68604)))

(declare-fun b!1539282 () Bool)

(declare-fun e!856204 () Bool)

(assert (=> b!1539282 (= e!856204 e!856203)))

(declare-fun lt!665008 () (_ BitVec 64))

