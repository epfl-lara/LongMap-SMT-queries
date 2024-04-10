; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33216 () Bool)

(assert start!33216)

(declare-fun b!330314 () Bool)

(assert (=> b!330314 false))

(declare-datatypes ((Unit!10267 0))(
  ( (Unit!10268) )
))
(declare-fun lt!158489 () Unit!10267)

(declare-fun e!202788 () Unit!10267)

(assert (=> b!330314 (= lt!158489 e!202788)))

(declare-datatypes ((array!16875 0))(
  ( (array!16876 (arr!7980 (Array (_ BitVec 32) (_ BitVec 64))) (size!8332 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16875)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun c!51787 () Bool)

(get-info :version)

(declare-datatypes ((SeekEntryResult!3111 0))(
  ( (MissingZero!3111 (index!14620 (_ BitVec 32))) (Found!3111 (index!14621 (_ BitVec 32))) (Intermediate!3111 (undefined!3923 Bool) (index!14622 (_ BitVec 32)) (x!32902 (_ BitVec 32))) (Undefined!3111) (MissingVacant!3111 (index!14623 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16875 (_ BitVec 32)) SeekEntryResult!3111)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330314 (= c!51787 ((_ is Intermediate!3111) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!202785 () Unit!10267)

(declare-fun Unit!10269 () Unit!10267)

(assert (=> b!330314 (= e!202785 Unit!10269)))

(declare-fun b!330315 () Bool)

(declare-fun Unit!10270 () Unit!10267)

(assert (=> b!330315 (= e!202788 Unit!10270)))

(declare-fun res!182029 () Bool)

(declare-fun e!202786 () Bool)

(assert (=> start!33216 (=> (not res!182029) (not e!202786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33216 (= res!182029 (validMask!0 mask!3777))))

(assert (=> start!33216 e!202786))

(declare-fun array_inv!5943 (array!16875) Bool)

(assert (=> start!33216 (array_inv!5943 a!3305)))

(assert (=> start!33216 true))

(declare-fun b!330316 () Bool)

(declare-fun res!182026 () Bool)

(assert (=> b!330316 (=> (not res!182026) (not e!202786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16875 (_ BitVec 32)) Bool)

(assert (=> b!330316 (= res!182026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330317 () Bool)

(declare-fun res!182028 () Bool)

(declare-fun e!202789 () Bool)

(assert (=> b!330317 (=> (not res!182028) (not e!202789))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330317 (= res!182028 (and (= (select (arr!7980 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8332 a!3305))))))

(declare-fun b!330318 () Bool)

(declare-fun Unit!10271 () Unit!10267)

(assert (=> b!330318 (= e!202788 Unit!10271)))

(assert (=> b!330318 false))

(declare-fun b!330319 () Bool)

(declare-fun res!182033 () Bool)

(assert (=> b!330319 (=> (not res!182033) (not e!202786))))

(assert (=> b!330319 (= res!182033 (and (= (size!8332 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8332 a!3305))))))

(declare-fun b!330320 () Bool)

(declare-fun res!182032 () Bool)

(assert (=> b!330320 (=> (not res!182032) (not e!202786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330320 (= res!182032 (validKeyInArray!0 k0!2497))))

(declare-fun b!330321 () Bool)

(declare-fun e!202784 () Unit!10267)

(declare-fun Unit!10272 () Unit!10267)

(assert (=> b!330321 (= e!202784 Unit!10272)))

(declare-fun b!330322 () Bool)

(assert (=> b!330322 false))

(declare-fun Unit!10273 () Unit!10267)

(assert (=> b!330322 (= e!202785 Unit!10273)))

(declare-fun b!330323 () Bool)

(assert (=> b!330323 (= e!202784 e!202785)))

(declare-fun c!51788 () Bool)

(assert (=> b!330323 (= c!51788 (or (= (select (arr!7980 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7980 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330324 () Bool)

(declare-fun res!182025 () Bool)

(assert (=> b!330324 (=> (not res!182025) (not e!202786))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16875 (_ BitVec 32)) SeekEntryResult!3111)

(assert (=> b!330324 (= res!182025 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3111 i!1250)))))

(declare-fun b!330325 () Bool)

(assert (=> b!330325 (= e!202786 e!202789)))

(declare-fun res!182030 () Bool)

(assert (=> b!330325 (=> (not res!182030) (not e!202789))))

(declare-fun lt!158488 () SeekEntryResult!3111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330325 (= res!182030 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158488))))

(assert (=> b!330325 (= lt!158488 (Intermediate!3111 false resIndex!58 resX!58))))

(declare-fun b!330326 () Bool)

(declare-fun res!182031 () Bool)

(assert (=> b!330326 (=> (not res!182031) (not e!202789))))

(assert (=> b!330326 (= res!182031 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7980 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!330327 () Bool)

(declare-fun res!182027 () Bool)

(assert (=> b!330327 (=> (not res!182027) (not e!202786))))

(declare-fun arrayContainsKey!0 (array!16875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330327 (= res!182027 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330328 () Bool)

(assert (=> b!330328 (= e!202789 (not (= (select (arr!7980 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!330328 (= index!1840 resIndex!58)))

(declare-fun lt!158490 () Unit!10267)

(assert (=> b!330328 (= lt!158490 e!202784)))

(declare-fun c!51789 () Bool)

(assert (=> b!330328 (= c!51789 (not (= resIndex!58 index!1840)))))

(declare-fun b!330329 () Bool)

(declare-fun res!182034 () Bool)

(assert (=> b!330329 (=> (not res!182034) (not e!202789))))

(assert (=> b!330329 (= res!182034 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158488))))

(assert (= (and start!33216 res!182029) b!330319))

(assert (= (and b!330319 res!182033) b!330320))

(assert (= (and b!330320 res!182032) b!330327))

(assert (= (and b!330327 res!182027) b!330324))

(assert (= (and b!330324 res!182025) b!330316))

(assert (= (and b!330316 res!182026) b!330325))

(assert (= (and b!330325 res!182030) b!330317))

(assert (= (and b!330317 res!182028) b!330329))

(assert (= (and b!330329 res!182034) b!330326))

(assert (= (and b!330326 res!182031) b!330328))

(assert (= (and b!330328 c!51789) b!330323))

(assert (= (and b!330328 (not c!51789)) b!330321))

(assert (= (and b!330323 c!51788) b!330322))

(assert (= (and b!330323 (not c!51788)) b!330314))

(assert (= (and b!330314 c!51787) b!330315))

(assert (= (and b!330314 (not c!51787)) b!330318))

(declare-fun m!335605 () Bool)

(assert (=> b!330320 m!335605))

(declare-fun m!335607 () Bool)

(assert (=> b!330328 m!335607))

(declare-fun m!335609 () Bool)

(assert (=> b!330327 m!335609))

(declare-fun m!335611 () Bool)

(assert (=> b!330325 m!335611))

(assert (=> b!330325 m!335611))

(declare-fun m!335613 () Bool)

(assert (=> b!330325 m!335613))

(declare-fun m!335615 () Bool)

(assert (=> b!330317 m!335615))

(declare-fun m!335617 () Bool)

(assert (=> b!330316 m!335617))

(declare-fun m!335619 () Bool)

(assert (=> start!33216 m!335619))

(declare-fun m!335621 () Bool)

(assert (=> start!33216 m!335621))

(declare-fun m!335623 () Bool)

(assert (=> b!330324 m!335623))

(assert (=> b!330326 m!335607))

(declare-fun m!335625 () Bool)

(assert (=> b!330329 m!335625))

(declare-fun m!335627 () Bool)

(assert (=> b!330314 m!335627))

(assert (=> b!330314 m!335627))

(declare-fun m!335629 () Bool)

(assert (=> b!330314 m!335629))

(assert (=> b!330323 m!335607))

(check-sat (not start!33216) (not b!330320) (not b!330314) (not b!330327) (not b!330325) (not b!330329) (not b!330316) (not b!330324))
(check-sat)
