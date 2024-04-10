; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130958 () Bool)

(assert start!130958)

(declare-fun b!1536232 () Bool)

(declare-fun e!855084 () Bool)

(declare-fun e!855085 () Bool)

(assert (=> b!1536232 (= e!855084 e!855085)))

(declare-fun res!1053327 () Bool)

(assert (=> b!1536232 (=> (not res!1053327) (not e!855085))))

(declare-datatypes ((SeekEntryResult!13376 0))(
  ( (MissingZero!13376 (index!55899 (_ BitVec 32))) (Found!13376 (index!55900 (_ BitVec 32))) (Intermediate!13376 (undefined!14188 Bool) (index!55901 (_ BitVec 32)) (x!137642 (_ BitVec 32))) (Undefined!13376) (MissingVacant!13376 (index!55902 (_ BitVec 32))) )
))
(declare-fun lt!664271 () SeekEntryResult!13376)

(declare-fun lt!664273 () SeekEntryResult!13376)

(assert (=> b!1536232 (= res!1053327 (= lt!664271 lt!664273))))

(declare-datatypes ((array!102056 0))(
  ( (array!102057 (arr!49244 (Array (_ BitVec 32) (_ BitVec 64))) (size!49794 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102056)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664272 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102056 (_ BitVec 32)) SeekEntryResult!13376)

(assert (=> b!1536232 (= lt!664271 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664272 vacantIndex!5 (select (arr!49244 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536233 () Bool)

(declare-fun res!1053319 () Bool)

(declare-fun e!855088 () Bool)

(assert (=> b!1536233 (=> (not res!1053319) (not e!855088))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536233 (= res!1053319 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49794 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49794 a!2792)) (= (select (arr!49244 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536234 () Bool)

(declare-fun e!855086 () Bool)

(assert (=> b!1536234 (= e!855088 e!855086)))

(declare-fun res!1053322 () Bool)

(assert (=> b!1536234 (=> (not res!1053322) (not e!855086))))

(assert (=> b!1536234 (= res!1053322 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49244 a!2792) j!64) a!2792 mask!2480) lt!664273))))

(assert (=> b!1536234 (= lt!664273 (Found!13376 j!64))))

(declare-fun res!1053323 () Bool)

(assert (=> start!130958 (=> (not res!1053323) (not e!855088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130958 (= res!1053323 (validMask!0 mask!2480))))

(assert (=> start!130958 e!855088))

(assert (=> start!130958 true))

(declare-fun array_inv!38272 (array!102056) Bool)

(assert (=> start!130958 (array_inv!38272 a!2792)))

(declare-fun b!1536235 () Bool)

(assert (=> b!1536235 (= e!855085 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536235 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664272 vacantIndex!5 (select (store (arr!49244 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102057 (store (arr!49244 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49794 a!2792)) mask!2480) lt!664271)))

(declare-datatypes ((Unit!51324 0))(
  ( (Unit!51325) )
))
(declare-fun lt!664270 () Unit!51324)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51324)

(assert (=> b!1536235 (= lt!664270 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664272 vacantIndex!5 mask!2480))))

(declare-fun b!1536236 () Bool)

(declare-fun res!1053325 () Bool)

(assert (=> b!1536236 (=> (not res!1053325) (not e!855088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102056 (_ BitVec 32)) Bool)

(assert (=> b!1536236 (= res!1053325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536237 () Bool)

(declare-fun res!1053318 () Bool)

(assert (=> b!1536237 (=> (not res!1053318) (not e!855088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536237 (= res!1053318 (validKeyInArray!0 (select (arr!49244 a!2792) i!951)))))

(declare-fun b!1536238 () Bool)

(declare-fun res!1053320 () Bool)

(assert (=> b!1536238 (=> (not res!1053320) (not e!855088))))

(declare-datatypes ((List!35718 0))(
  ( (Nil!35715) (Cons!35714 (h!37159 (_ BitVec 64)) (t!50412 List!35718)) )
))
(declare-fun arrayNoDuplicates!0 (array!102056 (_ BitVec 32) List!35718) Bool)

(assert (=> b!1536238 (= res!1053320 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35715))))

(declare-fun b!1536239 () Bool)

(declare-fun res!1053321 () Bool)

(assert (=> b!1536239 (=> (not res!1053321) (not e!855088))))

(assert (=> b!1536239 (= res!1053321 (and (= (size!49794 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49794 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49794 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536240 () Bool)

(declare-fun res!1053324 () Bool)

(assert (=> b!1536240 (=> (not res!1053324) (not e!855086))))

(assert (=> b!1536240 (= res!1053324 (not (= (select (arr!49244 a!2792) index!463) (select (arr!49244 a!2792) j!64))))))

(declare-fun b!1536241 () Bool)

(assert (=> b!1536241 (= e!855086 e!855084)))

(declare-fun res!1053328 () Bool)

(assert (=> b!1536241 (=> (not res!1053328) (not e!855084))))

(assert (=> b!1536241 (= res!1053328 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664272 #b00000000000000000000000000000000) (bvslt lt!664272 (size!49794 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536241 (= lt!664272 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536242 () Bool)

(declare-fun res!1053326 () Bool)

(assert (=> b!1536242 (=> (not res!1053326) (not e!855088))))

(assert (=> b!1536242 (= res!1053326 (validKeyInArray!0 (select (arr!49244 a!2792) j!64)))))

(assert (= (and start!130958 res!1053323) b!1536239))

(assert (= (and b!1536239 res!1053321) b!1536237))

(assert (= (and b!1536237 res!1053318) b!1536242))

(assert (= (and b!1536242 res!1053326) b!1536236))

(assert (= (and b!1536236 res!1053325) b!1536238))

(assert (= (and b!1536238 res!1053320) b!1536233))

(assert (= (and b!1536233 res!1053319) b!1536234))

(assert (= (and b!1536234 res!1053322) b!1536240))

(assert (= (and b!1536240 res!1053324) b!1536241))

(assert (= (and b!1536241 res!1053328) b!1536232))

(assert (= (and b!1536232 res!1053327) b!1536235))

(declare-fun m!1418691 () Bool)

(assert (=> b!1536232 m!1418691))

(assert (=> b!1536232 m!1418691))

(declare-fun m!1418693 () Bool)

(assert (=> b!1536232 m!1418693))

(assert (=> b!1536234 m!1418691))

(assert (=> b!1536234 m!1418691))

(declare-fun m!1418695 () Bool)

(assert (=> b!1536234 m!1418695))

(declare-fun m!1418697 () Bool)

(assert (=> start!130958 m!1418697))

(declare-fun m!1418699 () Bool)

(assert (=> start!130958 m!1418699))

(declare-fun m!1418701 () Bool)

(assert (=> b!1536233 m!1418701))

(declare-fun m!1418703 () Bool)

(assert (=> b!1536240 m!1418703))

(assert (=> b!1536240 m!1418691))

(declare-fun m!1418705 () Bool)

(assert (=> b!1536235 m!1418705))

(declare-fun m!1418707 () Bool)

(assert (=> b!1536235 m!1418707))

(assert (=> b!1536235 m!1418707))

(declare-fun m!1418709 () Bool)

(assert (=> b!1536235 m!1418709))

(declare-fun m!1418711 () Bool)

(assert (=> b!1536235 m!1418711))

(declare-fun m!1418713 () Bool)

(assert (=> b!1536241 m!1418713))

(declare-fun m!1418715 () Bool)

(assert (=> b!1536238 m!1418715))

(assert (=> b!1536242 m!1418691))

(assert (=> b!1536242 m!1418691))

(declare-fun m!1418717 () Bool)

(assert (=> b!1536242 m!1418717))

(declare-fun m!1418719 () Bool)

(assert (=> b!1536237 m!1418719))

(assert (=> b!1536237 m!1418719))

(declare-fun m!1418721 () Bool)

(assert (=> b!1536237 m!1418721))

(declare-fun m!1418723 () Bool)

(assert (=> b!1536236 m!1418723))

(push 1)

(assert (not b!1536238))

(assert (not b!1536236))

(assert (not b!1536234))

(assert (not start!130958))

(assert (not b!1536232))

(assert (not b!1536235))

(assert (not b!1536241))

(assert (not b!1536242))

(assert (not b!1536237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

