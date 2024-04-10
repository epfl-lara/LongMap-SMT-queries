; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131198 () Bool)

(assert start!131198)

(declare-fun b!1539171 () Bool)

(declare-fun res!1056150 () Bool)

(declare-fun e!856159 () Bool)

(assert (=> b!1539171 (=> (not res!1056150) (not e!856159))))

(declare-datatypes ((array!102263 0))(
  ( (array!102264 (arr!49346 (Array (_ BitVec 32) (_ BitVec 64))) (size!49896 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102263)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102263 (_ BitVec 32)) Bool)

(assert (=> b!1539171 (= res!1056150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539172 () Bool)

(declare-fun res!1056153 () Bool)

(assert (=> b!1539172 (=> (not res!1056153) (not e!856159))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539172 (= res!1056153 (and (= (size!49896 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49896 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49896 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539173 () Bool)

(declare-fun res!1056152 () Bool)

(assert (=> b!1539173 (=> (not res!1056152) (not e!856159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539173 (= res!1056152 (validKeyInArray!0 (select (arr!49346 a!2792) i!951)))))

(declare-fun res!1056157 () Bool)

(assert (=> start!131198 (=> (not res!1056157) (not e!856159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131198 (= res!1056157 (validMask!0 mask!2480))))

(assert (=> start!131198 e!856159))

(assert (=> start!131198 true))

(declare-fun array_inv!38374 (array!102263) Bool)

(assert (=> start!131198 (array_inv!38374 a!2792)))

(declare-fun b!1539174 () Bool)

(declare-fun res!1056154 () Bool)

(assert (=> b!1539174 (=> (not res!1056154) (not e!856159))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13472 0))(
  ( (MissingZero!13472 (index!56283 (_ BitVec 32))) (Found!13472 (index!56284 (_ BitVec 32))) (Intermediate!13472 (undefined!14284 Bool) (index!56285 (_ BitVec 32)) (x!138013 (_ BitVec 32))) (Undefined!13472) (MissingVacant!13472 (index!56286 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102263 (_ BitVec 32)) SeekEntryResult!13472)

(assert (=> b!1539174 (= res!1056154 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49346 a!2792) j!64) a!2792 mask!2480) (Found!13472 j!64)))))

(declare-fun b!1539175 () Bool)

(declare-fun res!1056155 () Bool)

(assert (=> b!1539175 (=> (not res!1056155) (not e!856159))))

(assert (=> b!1539175 (= res!1056155 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49896 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49896 a!2792)) (= (select (arr!49346 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539176 () Bool)

(declare-fun res!1056156 () Bool)

(assert (=> b!1539176 (=> (not res!1056156) (not e!856159))))

(assert (=> b!1539176 (= res!1056156 (not (= (select (arr!49346 a!2792) index!463) (select (arr!49346 a!2792) j!64))))))

(declare-fun b!1539177 () Bool)

(declare-fun res!1056149 () Bool)

(assert (=> b!1539177 (=> (not res!1056149) (not e!856159))))

(declare-datatypes ((List!35820 0))(
  ( (Nil!35817) (Cons!35816 (h!37261 (_ BitVec 64)) (t!50514 List!35820)) )
))
(declare-fun arrayNoDuplicates!0 (array!102263 (_ BitVec 32) List!35820) Bool)

(assert (=> b!1539177 (= res!1056149 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35817))))

(declare-fun b!1539178 () Bool)

(declare-fun res!1056151 () Bool)

(assert (=> b!1539178 (=> (not res!1056151) (not e!856159))))

(assert (=> b!1539178 (= res!1056151 (validKeyInArray!0 (select (arr!49346 a!2792) j!64)))))

(declare-fun b!1539179 () Bool)

(assert (=> b!1539179 (= e!856159 (or (bvslt (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110)))))

(declare-fun lt!664981 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539179 (= lt!664981 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131198 res!1056157) b!1539172))

(assert (= (and b!1539172 res!1056153) b!1539173))

(assert (= (and b!1539173 res!1056152) b!1539178))

(assert (= (and b!1539178 res!1056151) b!1539171))

(assert (= (and b!1539171 res!1056150) b!1539177))

(assert (= (and b!1539177 res!1056149) b!1539175))

(assert (= (and b!1539175 res!1056155) b!1539174))

(assert (= (and b!1539174 res!1056154) b!1539176))

(assert (= (and b!1539176 res!1056156) b!1539179))

(declare-fun m!1421523 () Bool)

(assert (=> b!1539174 m!1421523))

(assert (=> b!1539174 m!1421523))

(declare-fun m!1421525 () Bool)

(assert (=> b!1539174 m!1421525))

(declare-fun m!1421527 () Bool)

(assert (=> start!131198 m!1421527))

(declare-fun m!1421529 () Bool)

(assert (=> start!131198 m!1421529))

(declare-fun m!1421531 () Bool)

(assert (=> b!1539171 m!1421531))

(declare-fun m!1421533 () Bool)

(assert (=> b!1539177 m!1421533))

(declare-fun m!1421535 () Bool)

(assert (=> b!1539173 m!1421535))

(assert (=> b!1539173 m!1421535))

(declare-fun m!1421537 () Bool)

(assert (=> b!1539173 m!1421537))

(declare-fun m!1421539 () Bool)

(assert (=> b!1539175 m!1421539))

(declare-fun m!1421541 () Bool)

(assert (=> b!1539179 m!1421541))

(declare-fun m!1421543 () Bool)

(assert (=> b!1539176 m!1421543))

(assert (=> b!1539176 m!1421523))

(assert (=> b!1539178 m!1421523))

(assert (=> b!1539178 m!1421523))

(declare-fun m!1421545 () Bool)

(assert (=> b!1539178 m!1421545))

(push 1)

(assert (not b!1539177))

(assert (not b!1539173))

(assert (not b!1539179))

(assert (not start!131198))

(assert (not b!1539171))

(assert (not b!1539174))

(assert (not b!1539178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160381 () Bool)

(declare-fun lt!664990 () (_ BitVec 32))

(assert (=> d!160381 (and (bvsge lt!664990 #b00000000000000000000000000000000) (bvslt lt!664990 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160381 (= lt!664990 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160381 (validMask!0 mask!2480)))

(assert (=> d!160381 (= (nextIndex!0 index!463 x!510 mask!2480) lt!664990)))

(declare-fun bs!44188 () Bool)

(assert (= bs!44188 d!160381))

(declare-fun m!1421595 () Bool)

(assert (=> bs!44188 m!1421595))

(assert (=> bs!44188 m!1421527))

(assert (=> b!1539179 d!160381))

(declare-fun d!160385 () Bool)

(assert (=> d!160385 (= (validKeyInArray!0 (select (arr!49346 a!2792) j!64)) (and (not (= (select (arr!49346 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49346 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539178 d!160385))

(declare-fun d!160387 () Bool)

(assert (=> d!160387 (= (validKeyInArray!0 (select (arr!49346 a!2792) i!951)) (and (not (= (select (arr!49346 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49346 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539173 d!160387))

(declare-fun d!160389 () Bool)

(assert (=> d!160389 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131198 d!160389))

(declare-fun d!160397 () Bool)

(assert (=> d!160397 (= (array_inv!38374 a!2792) (bvsge (size!49896 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131198 d!160397))

(declare-fun b!1539303 () Bool)

(declare-fun e!856218 () SeekEntryResult!13472)

(assert (=> b!1539303 (= e!856218 (MissingVacant!13472 vacantIndex!5))))

(declare-fun b!1539304 () Bool)

(declare-fun c!141094 () Bool)

(declare-fun lt!665022 () (_ BitVec 64))

(assert (=> b!1539304 (= c!141094 (= lt!665022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!856219 () SeekEntryResult!13472)

(assert (=> b!1539304 (= e!856219 e!856218)))

(declare-fun b!1539305 () Bool)

(declare-fun e!856217 () SeekEntryResult!13472)

(assert (=> b!1539305 (= e!856217 Undefined!13472)))

(declare-fun b!1539306 () Bool)

(assert (=> b!1539306 (= e!856217 e!856219)))

(declare-fun c!141093 () Bool)

(assert (=> b!1539306 (= c!141093 (= lt!665022 (select (arr!49346 a!2792) j!64)))))

(declare-fun b!1539307 () Bool)

(assert (=> b!1539307 (= e!856218 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49346 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539308 () Bool)

(assert (=> b!1539308 (= e!856219 (Found!13472 index!463))))

(declare-fun d!160401 () Bool)

(declare-fun lt!665023 () SeekEntryResult!13472)

(assert (=> d!160401 (and (or (is-Undefined!13472 lt!665023) (not (is-Found!13472 lt!665023)) (and (bvsge (index!56284 lt!665023) #b00000000000000000000000000000000) (bvslt (index!56284 lt!665023) (size!49896 a!2792)))) (or (is-Undefined!13472 lt!665023) (is-Found!13472 lt!665023) (not (is-MissingVacant!13472 lt!665023)) (not (= (index!56286 lt!665023) vacantIndex!5)) (and (bvsge (index!56286 lt!665023) #b00000000000000000000000000000000) (bvslt (index!56286 lt!665023) (size!49896 a!2792)))) (or (is-Undefined!13472 lt!665023) (ite (is-Found!13472 lt!665023) (= (select (arr!49346 a!2792) (index!56284 lt!665023)) (select (arr!49346 a!2792) j!64)) (and (is-MissingVacant!13472 lt!665023) (= (index!56286 lt!665023) vacantIndex!5) (= (select (arr!49346 a!2792) (index!56286 lt!665023)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160401 (= lt!665023 e!856217)))

(declare-fun c!141095 () Bool)

(assert (=> d!160401 (= c!141095 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160401 (= lt!665022 (select (arr!49346 a!2792) index!463))))

(assert (=> d!160401 (validMask!0 mask!2480)))

(assert (=> d!160401 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49346 a!2792) j!64) a!2792 mask!2480) lt!665023)))

(assert (= (and d!160401 c!141095) b!1539305))

(assert (= (and d!160401 (not c!141095)) b!1539306))

(assert (= (and b!1539306 c!141093) b!1539308))

(assert (= (and b!1539306 (not c!141093)) b!1539304))

(assert (= (and b!1539304 c!141094) b!1539303))

(assert (= (and b!1539304 (not c!141094)) b!1539307))

(assert (=> b!1539307 m!1421541))

(assert (=> b!1539307 m!1421541))

(assert (=> b!1539307 m!1421523))

(declare-fun m!1421633 () Bool)

(assert (=> b!1539307 m!1421633))

(declare-fun m!1421635 () Bool)

(assert (=> d!160401 m!1421635))

(declare-fun m!1421637 () Bool)

(assert (=> d!160401 m!1421637))

(assert (=> d!160401 m!1421543))

(assert (=> d!160401 m!1421527))

(assert (=> b!1539174 d!160401))

(declare-fun b!1539329 () Bool)

(declare-fun e!856233 () Bool)

(declare-fun e!856232 () Bool)

(assert (=> b!1539329 (= e!856233 e!856232)))

(declare-fun lt!665036 () (_ BitVec 64))

(assert (=> b!1539329 (= lt!665036 (select (arr!49346 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51408 0))(
  ( (Unit!51409) )
))
(declare-fun lt!665035 () Unit!51408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102263 (_ BitVec 64) (_ BitVec 32)) Unit!51408)

(assert (=> b!1539329 (= lt!665035 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665036 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539329 (arrayContainsKey!0 a!2792 lt!665036 #b00000000000000000000000000000000)))

(declare-fun lt!665034 () Unit!51408)

(assert (=> b!1539329 (= lt!665034 lt!665035)))

(declare-fun res!1056238 () Bool)

