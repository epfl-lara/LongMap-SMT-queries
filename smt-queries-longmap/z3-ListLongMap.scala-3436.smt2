; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47726 () Bool)

(assert start!47726)

(declare-fun b!525195 () Bool)

(declare-fun res!322048 () Bool)

(declare-fun e!306229 () Bool)

(assert (=> b!525195 (=> (not res!322048) (not e!306229))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33364 0))(
  ( (array!33365 (arr!16033 (Array (_ BitVec 32) (_ BitVec 64))) (size!16397 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33364)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525195 (= res!322048 (and (= (size!16397 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16397 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16397 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!306231 () Bool)

(declare-fun b!525196 () Bool)

(declare-datatypes ((SeekEntryResult!4456 0))(
  ( (MissingZero!4456 (index!20036 (_ BitVec 32))) (Found!4456 (index!20037 (_ BitVec 32))) (Intermediate!4456 (undefined!5268 Bool) (index!20038 (_ BitVec 32)) (x!49162 (_ BitVec 32))) (Undefined!4456) (MissingVacant!4456 (index!20039 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33364 (_ BitVec 32)) SeekEntryResult!4456)

(assert (=> b!525196 (= e!306231 (= (seekEntryOrOpen!0 (select (arr!16033 a!3235) j!176) a!3235 mask!3524) (Found!4456 j!176)))))

(declare-fun b!525197 () Bool)

(declare-fun res!322042 () Bool)

(declare-fun e!306230 () Bool)

(assert (=> b!525197 (=> (not res!322042) (not e!306230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33364 (_ BitVec 32)) Bool)

(assert (=> b!525197 (= res!322042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525198 () Bool)

(declare-fun e!306234 () Bool)

(assert (=> b!525198 (= e!306234 true)))

(declare-fun lt!241277 () SeekEntryResult!4456)

(assert (=> b!525198 (= (index!20038 lt!241277) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!16435 0))(
  ( (Unit!16436) )
))
(declare-fun lt!241284 () Unit!16435)

(declare-fun lt!241276 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33364 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16435)

(assert (=> b!525198 (= lt!241284 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241276 #b00000000000000000000000000000000 (index!20038 lt!241277) (x!49162 lt!241277) mask!3524))))

(assert (=> b!525198 (and (or (= (select (arr!16033 a!3235) (index!20038 lt!241277)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16033 a!3235) (index!20038 lt!241277)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16033 a!3235) (index!20038 lt!241277)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16033 a!3235) (index!20038 lt!241277)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241285 () Unit!16435)

(declare-fun e!306233 () Unit!16435)

(assert (=> b!525198 (= lt!241285 e!306233)))

(declare-fun c!61883 () Bool)

(assert (=> b!525198 (= c!61883 (= (select (arr!16033 a!3235) (index!20038 lt!241277)) (select (arr!16033 a!3235) j!176)))))

(assert (=> b!525198 (and (bvslt (x!49162 lt!241277) #b01111111111111111111111111111110) (or (= (select (arr!16033 a!3235) (index!20038 lt!241277)) (select (arr!16033 a!3235) j!176)) (= (select (arr!16033 a!3235) (index!20038 lt!241277)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16033 a!3235) (index!20038 lt!241277)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525199 () Bool)

(assert (=> b!525199 (= e!306230 (not e!306234))))

(declare-fun res!322040 () Bool)

(assert (=> b!525199 (=> res!322040 e!306234)))

(declare-fun lt!241283 () array!33364)

(declare-fun lt!241281 () (_ BitVec 32))

(declare-fun lt!241280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33364 (_ BitVec 32)) SeekEntryResult!4456)

(assert (=> b!525199 (= res!322040 (= lt!241277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241281 lt!241280 lt!241283 mask!3524)))))

(assert (=> b!525199 (= lt!241277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241276 (select (arr!16033 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525199 (= lt!241281 (toIndex!0 lt!241280 mask!3524))))

(assert (=> b!525199 (= lt!241280 (select (store (arr!16033 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525199 (= lt!241276 (toIndex!0 (select (arr!16033 a!3235) j!176) mask!3524))))

(assert (=> b!525199 (= lt!241283 (array!33365 (store (arr!16033 a!3235) i!1204 k0!2280) (size!16397 a!3235)))))

(assert (=> b!525199 e!306231))

(declare-fun res!322044 () Bool)

(assert (=> b!525199 (=> (not res!322044) (not e!306231))))

(assert (=> b!525199 (= res!322044 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241282 () Unit!16435)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16435)

(assert (=> b!525199 (= lt!241282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525200 () Bool)

(assert (=> b!525200 (= e!306229 e!306230)))

(declare-fun res!322051 () Bool)

(assert (=> b!525200 (=> (not res!322051) (not e!306230))))

(declare-fun lt!241279 () SeekEntryResult!4456)

(assert (=> b!525200 (= res!322051 (or (= lt!241279 (MissingZero!4456 i!1204)) (= lt!241279 (MissingVacant!4456 i!1204))))))

(assert (=> b!525200 (= lt!241279 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525201 () Bool)

(declare-fun Unit!16437 () Unit!16435)

(assert (=> b!525201 (= e!306233 Unit!16437)))

(declare-fun lt!241278 () Unit!16435)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33364 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16435)

(assert (=> b!525201 (= lt!241278 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241276 #b00000000000000000000000000000000 (index!20038 lt!241277) (x!49162 lt!241277) mask!3524))))

(declare-fun res!322049 () Bool)

(assert (=> b!525201 (= res!322049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241276 lt!241280 lt!241283 mask!3524) (Intermediate!4456 false (index!20038 lt!241277) (x!49162 lt!241277))))))

(declare-fun e!306232 () Bool)

(assert (=> b!525201 (=> (not res!322049) (not e!306232))))

(assert (=> b!525201 e!306232))

(declare-fun res!322047 () Bool)

(assert (=> start!47726 (=> (not res!322047) (not e!306229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47726 (= res!322047 (validMask!0 mask!3524))))

(assert (=> start!47726 e!306229))

(assert (=> start!47726 true))

(declare-fun array_inv!11892 (array!33364) Bool)

(assert (=> start!47726 (array_inv!11892 a!3235)))

(declare-fun b!525202 () Bool)

(declare-fun res!322050 () Bool)

(assert (=> b!525202 (=> (not res!322050) (not e!306229))))

(declare-fun arrayContainsKey!0 (array!33364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525202 (= res!322050 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525203 () Bool)

(declare-fun Unit!16438 () Unit!16435)

(assert (=> b!525203 (= e!306233 Unit!16438)))

(declare-fun b!525204 () Bool)

(declare-fun res!322045 () Bool)

(assert (=> b!525204 (=> (not res!322045) (not e!306229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525204 (= res!322045 (validKeyInArray!0 k0!2280))))

(declare-fun b!525205 () Bool)

(assert (=> b!525205 (= e!306232 false)))

(declare-fun b!525206 () Bool)

(declare-fun res!322046 () Bool)

(assert (=> b!525206 (=> res!322046 e!306234)))

(get-info :version)

(assert (=> b!525206 (= res!322046 (or (undefined!5268 lt!241277) (not ((_ is Intermediate!4456) lt!241277))))))

(declare-fun b!525207 () Bool)

(declare-fun res!322043 () Bool)

(assert (=> b!525207 (=> (not res!322043) (not e!306229))))

(assert (=> b!525207 (= res!322043 (validKeyInArray!0 (select (arr!16033 a!3235) j!176)))))

(declare-fun b!525208 () Bool)

(declare-fun res!322041 () Bool)

(assert (=> b!525208 (=> (not res!322041) (not e!306230))))

(declare-datatypes ((List!10098 0))(
  ( (Nil!10095) (Cons!10094 (h!11025 (_ BitVec 64)) (t!16318 List!10098)) )
))
(declare-fun arrayNoDuplicates!0 (array!33364 (_ BitVec 32) List!10098) Bool)

(assert (=> b!525208 (= res!322041 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10095))))

(assert (= (and start!47726 res!322047) b!525195))

(assert (= (and b!525195 res!322048) b!525207))

(assert (= (and b!525207 res!322043) b!525204))

(assert (= (and b!525204 res!322045) b!525202))

(assert (= (and b!525202 res!322050) b!525200))

(assert (= (and b!525200 res!322051) b!525197))

(assert (= (and b!525197 res!322042) b!525208))

(assert (= (and b!525208 res!322041) b!525199))

(assert (= (and b!525199 res!322044) b!525196))

(assert (= (and b!525199 (not res!322040)) b!525206))

(assert (= (and b!525206 (not res!322046)) b!525198))

(assert (= (and b!525198 c!61883) b!525201))

(assert (= (and b!525198 (not c!61883)) b!525203))

(assert (= (and b!525201 res!322049) b!525205))

(declare-fun m!506089 () Bool)

(assert (=> b!525208 m!506089))

(declare-fun m!506091 () Bool)

(assert (=> b!525200 m!506091))

(declare-fun m!506093 () Bool)

(assert (=> b!525204 m!506093))

(declare-fun m!506095 () Bool)

(assert (=> b!525199 m!506095))

(declare-fun m!506097 () Bool)

(assert (=> b!525199 m!506097))

(declare-fun m!506099 () Bool)

(assert (=> b!525199 m!506099))

(declare-fun m!506101 () Bool)

(assert (=> b!525199 m!506101))

(declare-fun m!506103 () Bool)

(assert (=> b!525199 m!506103))

(assert (=> b!525199 m!506101))

(declare-fun m!506105 () Bool)

(assert (=> b!525199 m!506105))

(assert (=> b!525199 m!506101))

(declare-fun m!506107 () Bool)

(assert (=> b!525199 m!506107))

(declare-fun m!506109 () Bool)

(assert (=> b!525199 m!506109))

(declare-fun m!506111 () Bool)

(assert (=> b!525199 m!506111))

(assert (=> b!525207 m!506101))

(assert (=> b!525207 m!506101))

(declare-fun m!506113 () Bool)

(assert (=> b!525207 m!506113))

(assert (=> b!525196 m!506101))

(assert (=> b!525196 m!506101))

(declare-fun m!506115 () Bool)

(assert (=> b!525196 m!506115))

(declare-fun m!506117 () Bool)

(assert (=> start!47726 m!506117))

(declare-fun m!506119 () Bool)

(assert (=> start!47726 m!506119))

(declare-fun m!506121 () Bool)

(assert (=> b!525201 m!506121))

(declare-fun m!506123 () Bool)

(assert (=> b!525201 m!506123))

(declare-fun m!506125 () Bool)

(assert (=> b!525202 m!506125))

(declare-fun m!506127 () Bool)

(assert (=> b!525197 m!506127))

(declare-fun m!506129 () Bool)

(assert (=> b!525198 m!506129))

(declare-fun m!506131 () Bool)

(assert (=> b!525198 m!506131))

(assert (=> b!525198 m!506101))

(check-sat (not b!525202) (not b!525196) (not b!525201) (not start!47726) (not b!525204) (not b!525199) (not b!525198) (not b!525207) (not b!525208) (not b!525197) (not b!525200))
(check-sat)
