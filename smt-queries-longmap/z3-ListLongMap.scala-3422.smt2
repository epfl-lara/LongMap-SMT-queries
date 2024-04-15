; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47442 () Bool)

(assert start!47442)

(declare-fun b!522231 () Bool)

(declare-fun res!320019 () Bool)

(declare-fun e!304578 () Bool)

(assert (=> b!522231 (=> (not res!320019) (not e!304578))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33278 0))(
  ( (array!33279 (arr!15995 (Array (_ BitVec 32) (_ BitVec 64))) (size!16360 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33278)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522231 (= res!320019 (and (= (size!16360 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16360 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16360 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522232 () Bool)

(declare-fun e!304576 () Bool)

(declare-fun e!304572 () Bool)

(assert (=> b!522232 (= e!304576 (not e!304572))))

(declare-fun res!320025 () Bool)

(assert (=> b!522232 (=> res!320025 e!304572)))

(declare-fun lt!239409 () (_ BitVec 32))

(declare-fun lt!239413 () (_ BitVec 64))

(declare-fun lt!239414 () array!33278)

(declare-datatypes ((SeekEntryResult!4459 0))(
  ( (MissingZero!4459 (index!20039 (_ BitVec 32))) (Found!4459 (index!20040 (_ BitVec 32))) (Intermediate!4459 (undefined!5271 Bool) (index!20041 (_ BitVec 32)) (x!49024 (_ BitVec 32))) (Undefined!4459) (MissingVacant!4459 (index!20042 (_ BitVec 32))) )
))
(declare-fun lt!239411 () SeekEntryResult!4459)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33278 (_ BitVec 32)) SeekEntryResult!4459)

(assert (=> b!522232 (= res!320025 (= lt!239411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239409 lt!239413 lt!239414 mask!3524)))))

(declare-fun lt!239416 () (_ BitVec 32))

(assert (=> b!522232 (= lt!239411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239416 (select (arr!15995 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522232 (= lt!239409 (toIndex!0 lt!239413 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!522232 (= lt!239413 (select (store (arr!15995 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522232 (= lt!239416 (toIndex!0 (select (arr!15995 a!3235) j!176) mask!3524))))

(assert (=> b!522232 (= lt!239414 (array!33279 (store (arr!15995 a!3235) i!1204 k0!2280) (size!16360 a!3235)))))

(declare-fun e!304577 () Bool)

(assert (=> b!522232 e!304577))

(declare-fun res!320024 () Bool)

(assert (=> b!522232 (=> (not res!320024) (not e!304577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33278 (_ BitVec 32)) Bool)

(assert (=> b!522232 (= res!320024 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16282 0))(
  ( (Unit!16283) )
))
(declare-fun lt!239412 () Unit!16282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16282)

(assert (=> b!522232 (= lt!239412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522233 () Bool)

(declare-fun res!320023 () Bool)

(assert (=> b!522233 (=> (not res!320023) (not e!304576))))

(assert (=> b!522233 (= res!320023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522234 () Bool)

(assert (=> b!522234 (= e!304578 e!304576)))

(declare-fun res!320022 () Bool)

(assert (=> b!522234 (=> (not res!320022) (not e!304576))))

(declare-fun lt!239408 () SeekEntryResult!4459)

(assert (=> b!522234 (= res!320022 (or (= lt!239408 (MissingZero!4459 i!1204)) (= lt!239408 (MissingVacant!4459 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33278 (_ BitVec 32)) SeekEntryResult!4459)

(assert (=> b!522234 (= lt!239408 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522235 () Bool)

(declare-fun res!320021 () Bool)

(assert (=> b!522235 (=> res!320021 e!304572)))

(get-info :version)

(assert (=> b!522235 (= res!320021 (or (undefined!5271 lt!239411) (not ((_ is Intermediate!4459) lt!239411))))))

(declare-fun b!522236 () Bool)

(declare-fun e!304574 () Unit!16282)

(declare-fun Unit!16284 () Unit!16282)

(assert (=> b!522236 (= e!304574 Unit!16284)))

(declare-fun lt!239410 () Unit!16282)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33278 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16282)

(assert (=> b!522236 (= lt!239410 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239416 #b00000000000000000000000000000000 (index!20041 lt!239411) (x!49024 lt!239411) mask!3524))))

(declare-fun res!320029 () Bool)

(assert (=> b!522236 (= res!320029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239416 lt!239413 lt!239414 mask!3524) (Intermediate!4459 false (index!20041 lt!239411) (x!49024 lt!239411))))))

(declare-fun e!304573 () Bool)

(assert (=> b!522236 (=> (not res!320029) (not e!304573))))

(assert (=> b!522236 e!304573))

(declare-fun b!522237 () Bool)

(declare-fun Unit!16285 () Unit!16282)

(assert (=> b!522237 (= e!304574 Unit!16285)))

(declare-fun b!522238 () Bool)

(declare-fun res!320028 () Bool)

(assert (=> b!522238 (=> (not res!320028) (not e!304578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522238 (= res!320028 (validKeyInArray!0 k0!2280))))

(declare-fun b!522239 () Bool)

(declare-fun res!320030 () Bool)

(assert (=> b!522239 (=> (not res!320030) (not e!304576))))

(declare-datatypes ((List!10192 0))(
  ( (Nil!10189) (Cons!10188 (h!11110 (_ BitVec 64)) (t!16411 List!10192)) )
))
(declare-fun arrayNoDuplicates!0 (array!33278 (_ BitVec 32) List!10192) Bool)

(assert (=> b!522239 (= res!320030 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10189))))

(declare-fun b!522240 () Bool)

(declare-fun res!320020 () Bool)

(assert (=> b!522240 (=> (not res!320020) (not e!304578))))

(assert (=> b!522240 (= res!320020 (validKeyInArray!0 (select (arr!15995 a!3235) j!176)))))

(declare-fun res!320027 () Bool)

(assert (=> start!47442 (=> (not res!320027) (not e!304578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47442 (= res!320027 (validMask!0 mask!3524))))

(assert (=> start!47442 e!304578))

(assert (=> start!47442 true))

(declare-fun array_inv!11878 (array!33278) Bool)

(assert (=> start!47442 (array_inv!11878 a!3235)))

(declare-fun b!522241 () Bool)

(assert (=> b!522241 (= e!304572 true)))

(assert (=> b!522241 (and (or (= (select (arr!15995 a!3235) (index!20041 lt!239411)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15995 a!3235) (index!20041 lt!239411)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15995 a!3235) (index!20041 lt!239411)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15995 a!3235) (index!20041 lt!239411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239415 () Unit!16282)

(assert (=> b!522241 (= lt!239415 e!304574)))

(declare-fun c!61407 () Bool)

(assert (=> b!522241 (= c!61407 (= (select (arr!15995 a!3235) (index!20041 lt!239411)) (select (arr!15995 a!3235) j!176)))))

(assert (=> b!522241 (and (bvslt (x!49024 lt!239411) #b01111111111111111111111111111110) (or (= (select (arr!15995 a!3235) (index!20041 lt!239411)) (select (arr!15995 a!3235) j!176)) (= (select (arr!15995 a!3235) (index!20041 lt!239411)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15995 a!3235) (index!20041 lt!239411)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522242 () Bool)

(assert (=> b!522242 (= e!304573 false)))

(declare-fun b!522243 () Bool)

(declare-fun res!320026 () Bool)

(assert (=> b!522243 (=> (not res!320026) (not e!304578))))

(declare-fun arrayContainsKey!0 (array!33278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522243 (= res!320026 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522244 () Bool)

(assert (=> b!522244 (= e!304577 (= (seekEntryOrOpen!0 (select (arr!15995 a!3235) j!176) a!3235 mask!3524) (Found!4459 j!176)))))

(assert (= (and start!47442 res!320027) b!522231))

(assert (= (and b!522231 res!320019) b!522240))

(assert (= (and b!522240 res!320020) b!522238))

(assert (= (and b!522238 res!320028) b!522243))

(assert (= (and b!522243 res!320026) b!522234))

(assert (= (and b!522234 res!320022) b!522233))

(assert (= (and b!522233 res!320023) b!522239))

(assert (= (and b!522239 res!320030) b!522232))

(assert (= (and b!522232 res!320024) b!522244))

(assert (= (and b!522232 (not res!320025)) b!522235))

(assert (= (and b!522235 (not res!320021)) b!522241))

(assert (= (and b!522241 c!61407) b!522236))

(assert (= (and b!522241 (not c!61407)) b!522237))

(assert (= (and b!522236 res!320029) b!522242))

(declare-fun m!502663 () Bool)

(assert (=> b!522240 m!502663))

(assert (=> b!522240 m!502663))

(declare-fun m!502665 () Bool)

(assert (=> b!522240 m!502665))

(declare-fun m!502667 () Bool)

(assert (=> b!522238 m!502667))

(declare-fun m!502669 () Bool)

(assert (=> b!522232 m!502669))

(declare-fun m!502671 () Bool)

(assert (=> b!522232 m!502671))

(assert (=> b!522232 m!502663))

(declare-fun m!502673 () Bool)

(assert (=> b!522232 m!502673))

(declare-fun m!502675 () Bool)

(assert (=> b!522232 m!502675))

(declare-fun m!502677 () Bool)

(assert (=> b!522232 m!502677))

(assert (=> b!522232 m!502663))

(declare-fun m!502679 () Bool)

(assert (=> b!522232 m!502679))

(assert (=> b!522232 m!502663))

(declare-fun m!502681 () Bool)

(assert (=> b!522232 m!502681))

(declare-fun m!502683 () Bool)

(assert (=> b!522232 m!502683))

(declare-fun m!502685 () Bool)

(assert (=> b!522239 m!502685))

(declare-fun m!502687 () Bool)

(assert (=> b!522234 m!502687))

(declare-fun m!502689 () Bool)

(assert (=> b!522233 m!502689))

(declare-fun m!502691 () Bool)

(assert (=> b!522243 m!502691))

(declare-fun m!502693 () Bool)

(assert (=> b!522236 m!502693))

(declare-fun m!502695 () Bool)

(assert (=> b!522236 m!502695))

(declare-fun m!502697 () Bool)

(assert (=> b!522241 m!502697))

(assert (=> b!522241 m!502663))

(declare-fun m!502699 () Bool)

(assert (=> start!47442 m!502699))

(declare-fun m!502701 () Bool)

(assert (=> start!47442 m!502701))

(assert (=> b!522244 m!502663))

(assert (=> b!522244 m!502663))

(declare-fun m!502703 () Bool)

(assert (=> b!522244 m!502703))

(check-sat (not b!522234) (not b!522233) (not b!522243) (not b!522236) (not b!522240) (not start!47442) (not b!522238) (not b!522232) (not b!522244) (not b!522239))
(check-sat)
