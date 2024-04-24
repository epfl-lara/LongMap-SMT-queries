; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47684 () Bool)

(assert start!47684)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!305780 () Bool)

(declare-datatypes ((array!33322 0))(
  ( (array!33323 (arr!16012 (Array (_ BitVec 32) (_ BitVec 64))) (size!16376 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33322)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!524304 () Bool)

(declare-datatypes ((SeekEntryResult!4435 0))(
  ( (MissingZero!4435 (index!19952 (_ BitVec 32))) (Found!4435 (index!19953 (_ BitVec 32))) (Intermediate!4435 (undefined!5247 Bool) (index!19954 (_ BitVec 32)) (x!49085 (_ BitVec 32))) (Undefined!4435) (MissingVacant!4435 (index!19955 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33322 (_ BitVec 32)) SeekEntryResult!4435)

(assert (=> b!524304 (= e!305780 (= (seekEntryOrOpen!0 (select (arr!16012 a!3235) j!176) a!3235 mask!3524) (Found!4435 j!176)))))

(declare-fun b!524305 () Bool)

(declare-datatypes ((Unit!16351 0))(
  ( (Unit!16352) )
))
(declare-fun e!305784 () Unit!16351)

(declare-fun Unit!16353 () Unit!16351)

(assert (=> b!524305 (= e!305784 Unit!16353)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!240656 () (_ BitVec 32))

(declare-fun lt!240660 () SeekEntryResult!4435)

(declare-fun lt!240658 () Unit!16351)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33322 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16351)

(assert (=> b!524305 (= lt!240658 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240656 #b00000000000000000000000000000000 (index!19954 lt!240660) (x!49085 lt!240660) mask!3524))))

(declare-fun lt!240661 () array!33322)

(declare-fun lt!240653 () (_ BitVec 64))

(declare-fun res!321280 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33322 (_ BitVec 32)) SeekEntryResult!4435)

(assert (=> b!524305 (= res!321280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240656 lt!240653 lt!240661 mask!3524) (Intermediate!4435 false (index!19954 lt!240660) (x!49085 lt!240660))))))

(declare-fun e!305783 () Bool)

(assert (=> b!524305 (=> (not res!321280) (not e!305783))))

(assert (=> b!524305 e!305783))

(declare-fun b!524306 () Bool)

(declare-fun res!321276 () Bool)

(declare-fun e!305779 () Bool)

(assert (=> b!524306 (=> (not res!321276) (not e!305779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33322 (_ BitVec 32)) Bool)

(assert (=> b!524306 (= res!321276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524307 () Bool)

(declare-fun res!321277 () Bool)

(declare-fun e!305778 () Bool)

(assert (=> b!524307 (=> (not res!321277) (not e!305778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524307 (= res!321277 (validKeyInArray!0 (select (arr!16012 a!3235) j!176)))))

(declare-fun b!524308 () Bool)

(assert (=> b!524308 (= e!305778 e!305779)))

(declare-fun res!321286 () Bool)

(assert (=> b!524308 (=> (not res!321286) (not e!305779))))

(declare-fun lt!240659 () SeekEntryResult!4435)

(assert (=> b!524308 (= res!321286 (or (= lt!240659 (MissingZero!4435 i!1204)) (= lt!240659 (MissingVacant!4435 i!1204))))))

(assert (=> b!524308 (= lt!240659 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524309 () Bool)

(declare-fun res!321279 () Bool)

(assert (=> b!524309 (=> (not res!321279) (not e!305778))))

(assert (=> b!524309 (= res!321279 (and (= (size!16376 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16376 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16376 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524310 () Bool)

(declare-fun e!305781 () Bool)

(assert (=> b!524310 (= e!305779 (not e!305781))))

(declare-fun res!321282 () Bool)

(assert (=> b!524310 (=> res!321282 e!305781)))

(declare-fun lt!240655 () (_ BitVec 32))

(assert (=> b!524310 (= res!321282 (= lt!240660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240655 lt!240653 lt!240661 mask!3524)))))

(assert (=> b!524310 (= lt!240660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240656 (select (arr!16012 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524310 (= lt!240655 (toIndex!0 lt!240653 mask!3524))))

(assert (=> b!524310 (= lt!240653 (select (store (arr!16012 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524310 (= lt!240656 (toIndex!0 (select (arr!16012 a!3235) j!176) mask!3524))))

(assert (=> b!524310 (= lt!240661 (array!33323 (store (arr!16012 a!3235) i!1204 k0!2280) (size!16376 a!3235)))))

(assert (=> b!524310 e!305780))

(declare-fun res!321285 () Bool)

(assert (=> b!524310 (=> (not res!321285) (not e!305780))))

(assert (=> b!524310 (= res!321285 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240657 () Unit!16351)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16351)

(assert (=> b!524310 (= lt!240657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524311 () Bool)

(declare-fun res!321284 () Bool)

(assert (=> b!524311 (=> res!321284 e!305781)))

(get-info :version)

(assert (=> b!524311 (= res!321284 (or (undefined!5247 lt!240660) (not ((_ is Intermediate!4435) lt!240660))))))

(declare-fun b!524312 () Bool)

(assert (=> b!524312 (= e!305783 false)))

(declare-fun res!321275 () Bool)

(assert (=> start!47684 (=> (not res!321275) (not e!305778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47684 (= res!321275 (validMask!0 mask!3524))))

(assert (=> start!47684 e!305778))

(assert (=> start!47684 true))

(declare-fun array_inv!11871 (array!33322) Bool)

(assert (=> start!47684 (array_inv!11871 a!3235)))

(declare-fun b!524313 () Bool)

(declare-fun res!321278 () Bool)

(assert (=> b!524313 (=> (not res!321278) (not e!305778))))

(assert (=> b!524313 (= res!321278 (validKeyInArray!0 k0!2280))))

(declare-fun b!524314 () Bool)

(declare-fun Unit!16354 () Unit!16351)

(assert (=> b!524314 (= e!305784 Unit!16354)))

(declare-fun b!524315 () Bool)

(assert (=> b!524315 (= e!305781 true)))

(assert (=> b!524315 (and (or (= (select (arr!16012 a!3235) (index!19954 lt!240660)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16012 a!3235) (index!19954 lt!240660)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16012 a!3235) (index!19954 lt!240660)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16012 a!3235) (index!19954 lt!240660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240654 () Unit!16351)

(assert (=> b!524315 (= lt!240654 e!305784)))

(declare-fun c!61820 () Bool)

(assert (=> b!524315 (= c!61820 (= (select (arr!16012 a!3235) (index!19954 lt!240660)) (select (arr!16012 a!3235) j!176)))))

(assert (=> b!524315 (and (bvslt (x!49085 lt!240660) #b01111111111111111111111111111110) (or (= (select (arr!16012 a!3235) (index!19954 lt!240660)) (select (arr!16012 a!3235) j!176)) (= (select (arr!16012 a!3235) (index!19954 lt!240660)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16012 a!3235) (index!19954 lt!240660)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524316 () Bool)

(declare-fun res!321281 () Bool)

(assert (=> b!524316 (=> (not res!321281) (not e!305778))))

(declare-fun arrayContainsKey!0 (array!33322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524316 (= res!321281 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524317 () Bool)

(declare-fun res!321283 () Bool)

(assert (=> b!524317 (=> (not res!321283) (not e!305779))))

(declare-datatypes ((List!10077 0))(
  ( (Nil!10074) (Cons!10073 (h!11004 (_ BitVec 64)) (t!16297 List!10077)) )
))
(declare-fun arrayNoDuplicates!0 (array!33322 (_ BitVec 32) List!10077) Bool)

(assert (=> b!524317 (= res!321283 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10074))))

(assert (= (and start!47684 res!321275) b!524309))

(assert (= (and b!524309 res!321279) b!524307))

(assert (= (and b!524307 res!321277) b!524313))

(assert (= (and b!524313 res!321278) b!524316))

(assert (= (and b!524316 res!321281) b!524308))

(assert (= (and b!524308 res!321286) b!524306))

(assert (= (and b!524306 res!321276) b!524317))

(assert (= (and b!524317 res!321283) b!524310))

(assert (= (and b!524310 res!321285) b!524304))

(assert (= (and b!524310 (not res!321282)) b!524311))

(assert (= (and b!524311 (not res!321284)) b!524315))

(assert (= (and b!524315 c!61820) b!524305))

(assert (= (and b!524315 (not c!61820)) b!524314))

(assert (= (and b!524305 res!321280) b!524312))

(declare-fun m!505183 () Bool)

(assert (=> b!524304 m!505183))

(assert (=> b!524304 m!505183))

(declare-fun m!505185 () Bool)

(assert (=> b!524304 m!505185))

(declare-fun m!505187 () Bool)

(assert (=> b!524308 m!505187))

(declare-fun m!505189 () Bool)

(assert (=> b!524317 m!505189))

(assert (=> b!524307 m!505183))

(assert (=> b!524307 m!505183))

(declare-fun m!505191 () Bool)

(assert (=> b!524307 m!505191))

(declare-fun m!505193 () Bool)

(assert (=> b!524306 m!505193))

(declare-fun m!505195 () Bool)

(assert (=> b!524316 m!505195))

(declare-fun m!505197 () Bool)

(assert (=> b!524315 m!505197))

(assert (=> b!524315 m!505183))

(declare-fun m!505199 () Bool)

(assert (=> b!524305 m!505199))

(declare-fun m!505201 () Bool)

(assert (=> b!524305 m!505201))

(declare-fun m!505203 () Bool)

(assert (=> b!524310 m!505203))

(declare-fun m!505205 () Bool)

(assert (=> b!524310 m!505205))

(declare-fun m!505207 () Bool)

(assert (=> b!524310 m!505207))

(declare-fun m!505209 () Bool)

(assert (=> b!524310 m!505209))

(assert (=> b!524310 m!505183))

(declare-fun m!505211 () Bool)

(assert (=> b!524310 m!505211))

(assert (=> b!524310 m!505183))

(assert (=> b!524310 m!505183))

(declare-fun m!505213 () Bool)

(assert (=> b!524310 m!505213))

(declare-fun m!505215 () Bool)

(assert (=> b!524310 m!505215))

(declare-fun m!505217 () Bool)

(assert (=> b!524310 m!505217))

(declare-fun m!505219 () Bool)

(assert (=> b!524313 m!505219))

(declare-fun m!505221 () Bool)

(assert (=> start!47684 m!505221))

(declare-fun m!505223 () Bool)

(assert (=> start!47684 m!505223))

(check-sat (not b!524305) (not b!524304) (not b!524308) (not b!524316) (not b!524307) (not b!524310) (not b!524306) (not b!524317) (not b!524313) (not start!47684))
(check-sat)
