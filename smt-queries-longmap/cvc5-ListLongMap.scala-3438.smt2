; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47748 () Bool)

(assert start!47748)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33385 0))(
  ( (array!33386 (arr!16044 (Array (_ BitVec 32) (_ BitVec 64))) (size!16408 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33385)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!306397 () Bool)

(declare-fun b!525508 () Bool)

(declare-datatypes ((SeekEntryResult!4511 0))(
  ( (MissingZero!4511 (index!20256 (_ BitVec 32))) (Found!4511 (index!20257 (_ BitVec 32))) (Intermediate!4511 (undefined!5323 Bool) (index!20258 (_ BitVec 32)) (x!49236 (_ BitVec 32))) (Undefined!4511) (MissingVacant!4511 (index!20259 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33385 (_ BitVec 32)) SeekEntryResult!4511)

(assert (=> b!525508 (= e!306397 (= (seekEntryOrOpen!0 (select (arr!16044 a!3235) j!176) a!3235 mask!3524) (Found!4511 j!176)))))

(declare-fun b!525509 () Bool)

(declare-fun res!322273 () Bool)

(declare-fun e!306393 () Bool)

(assert (=> b!525509 (=> (not res!322273) (not e!306393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33385 (_ BitVec 32)) Bool)

(assert (=> b!525509 (= res!322273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525510 () Bool)

(declare-fun e!306395 () Bool)

(assert (=> b!525510 (= e!306395 false)))

(declare-fun b!525511 () Bool)

(declare-fun e!306398 () Bool)

(assert (=> b!525511 (= e!306393 (not e!306398))))

(declare-fun res!322267 () Bool)

(assert (=> b!525511 (=> res!322267 e!306398)))

(declare-fun lt!241451 () array!33385)

(declare-fun lt!241452 () (_ BitVec 64))

(declare-fun lt!241445 () SeekEntryResult!4511)

(declare-fun lt!241446 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33385 (_ BitVec 32)) SeekEntryResult!4511)

(assert (=> b!525511 (= res!322267 (= lt!241445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241446 lt!241452 lt!241451 mask!3524)))))

(declare-fun lt!241448 () (_ BitVec 32))

(assert (=> b!525511 (= lt!241445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241448 (select (arr!16044 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525511 (= lt!241446 (toIndex!0 lt!241452 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525511 (= lt!241452 (select (store (arr!16044 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525511 (= lt!241448 (toIndex!0 (select (arr!16044 a!3235) j!176) mask!3524))))

(assert (=> b!525511 (= lt!241451 (array!33386 (store (arr!16044 a!3235) i!1204 k!2280) (size!16408 a!3235)))))

(assert (=> b!525511 e!306397))

(declare-fun res!322266 () Bool)

(assert (=> b!525511 (=> (not res!322266) (not e!306397))))

(assert (=> b!525511 (= res!322266 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16496 0))(
  ( (Unit!16497) )
))
(declare-fun lt!241447 () Unit!16496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16496)

(assert (=> b!525511 (= lt!241447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525512 () Bool)

(assert (=> b!525512 (= e!306398 true)))

(assert (=> b!525512 (= (index!20258 lt!241445) i!1204)))

(declare-fun lt!241450 () Unit!16496)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16496)

(assert (=> b!525512 (= lt!241450 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241448 #b00000000000000000000000000000000 (index!20258 lt!241445) (x!49236 lt!241445) mask!3524))))

(assert (=> b!525512 (and (or (= (select (arr!16044 a!3235) (index!20258 lt!241445)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16044 a!3235) (index!20258 lt!241445)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16044 a!3235) (index!20258 lt!241445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16044 a!3235) (index!20258 lt!241445)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241453 () Unit!16496)

(declare-fun e!306396 () Unit!16496)

(assert (=> b!525512 (= lt!241453 e!306396)))

(declare-fun c!61928 () Bool)

(assert (=> b!525512 (= c!61928 (= (select (arr!16044 a!3235) (index!20258 lt!241445)) (select (arr!16044 a!3235) j!176)))))

(assert (=> b!525512 (and (bvslt (x!49236 lt!241445) #b01111111111111111111111111111110) (or (= (select (arr!16044 a!3235) (index!20258 lt!241445)) (select (arr!16044 a!3235) j!176)) (= (select (arr!16044 a!3235) (index!20258 lt!241445)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16044 a!3235) (index!20258 lt!241445)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525513 () Bool)

(declare-fun res!322263 () Bool)

(assert (=> b!525513 (=> (not res!322263) (not e!306393))))

(declare-datatypes ((List!10202 0))(
  ( (Nil!10199) (Cons!10198 (h!11129 (_ BitVec 64)) (t!16430 List!10202)) )
))
(declare-fun arrayNoDuplicates!0 (array!33385 (_ BitVec 32) List!10202) Bool)

(assert (=> b!525513 (= res!322263 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10199))))

(declare-fun res!322272 () Bool)

(declare-fun e!306399 () Bool)

(assert (=> start!47748 (=> (not res!322272) (not e!306399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47748 (= res!322272 (validMask!0 mask!3524))))

(assert (=> start!47748 e!306399))

(assert (=> start!47748 true))

(declare-fun array_inv!11840 (array!33385) Bool)

(assert (=> start!47748 (array_inv!11840 a!3235)))

(declare-fun b!525514 () Bool)

(declare-fun Unit!16498 () Unit!16496)

(assert (=> b!525514 (= e!306396 Unit!16498)))

(declare-fun lt!241449 () Unit!16496)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16496)

(assert (=> b!525514 (= lt!241449 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241448 #b00000000000000000000000000000000 (index!20258 lt!241445) (x!49236 lt!241445) mask!3524))))

(declare-fun res!322271 () Bool)

(assert (=> b!525514 (= res!322271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241448 lt!241452 lt!241451 mask!3524) (Intermediate!4511 false (index!20258 lt!241445) (x!49236 lt!241445))))))

(assert (=> b!525514 (=> (not res!322271) (not e!306395))))

(assert (=> b!525514 e!306395))

(declare-fun b!525515 () Bool)

(declare-fun res!322269 () Bool)

(assert (=> b!525515 (=> (not res!322269) (not e!306399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525515 (= res!322269 (validKeyInArray!0 (select (arr!16044 a!3235) j!176)))))

(declare-fun b!525516 () Bool)

(declare-fun Unit!16499 () Unit!16496)

(assert (=> b!525516 (= e!306396 Unit!16499)))

(declare-fun b!525517 () Bool)

(declare-fun res!322265 () Bool)

(assert (=> b!525517 (=> (not res!322265) (not e!306399))))

(assert (=> b!525517 (= res!322265 (validKeyInArray!0 k!2280))))

(declare-fun b!525518 () Bool)

(declare-fun res!322274 () Bool)

(assert (=> b!525518 (=> res!322274 e!306398)))

(assert (=> b!525518 (= res!322274 (or (undefined!5323 lt!241445) (not (is-Intermediate!4511 lt!241445))))))

(declare-fun b!525519 () Bool)

(declare-fun res!322264 () Bool)

(assert (=> b!525519 (=> (not res!322264) (not e!306399))))

(assert (=> b!525519 (= res!322264 (and (= (size!16408 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16408 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16408 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525520 () Bool)

(assert (=> b!525520 (= e!306399 e!306393)))

(declare-fun res!322270 () Bool)

(assert (=> b!525520 (=> (not res!322270) (not e!306393))))

(declare-fun lt!241444 () SeekEntryResult!4511)

(assert (=> b!525520 (= res!322270 (or (= lt!241444 (MissingZero!4511 i!1204)) (= lt!241444 (MissingVacant!4511 i!1204))))))

(assert (=> b!525520 (= lt!241444 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525521 () Bool)

(declare-fun res!322268 () Bool)

(assert (=> b!525521 (=> (not res!322268) (not e!306399))))

(declare-fun arrayContainsKey!0 (array!33385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525521 (= res!322268 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47748 res!322272) b!525519))

(assert (= (and b!525519 res!322264) b!525515))

(assert (= (and b!525515 res!322269) b!525517))

(assert (= (and b!525517 res!322265) b!525521))

(assert (= (and b!525521 res!322268) b!525520))

(assert (= (and b!525520 res!322270) b!525509))

(assert (= (and b!525509 res!322273) b!525513))

(assert (= (and b!525513 res!322263) b!525511))

(assert (= (and b!525511 res!322266) b!525508))

(assert (= (and b!525511 (not res!322267)) b!525518))

(assert (= (and b!525518 (not res!322274)) b!525512))

(assert (= (and b!525512 c!61928) b!525514))

(assert (= (and b!525512 (not c!61928)) b!525516))

(assert (= (and b!525514 res!322271) b!525510))

(declare-fun m!506169 () Bool)

(assert (=> b!525513 m!506169))

(declare-fun m!506171 () Bool)

(assert (=> b!525514 m!506171))

(declare-fun m!506173 () Bool)

(assert (=> b!525514 m!506173))

(declare-fun m!506175 () Bool)

(assert (=> b!525520 m!506175))

(declare-fun m!506177 () Bool)

(assert (=> b!525509 m!506177))

(declare-fun m!506179 () Bool)

(assert (=> b!525517 m!506179))

(declare-fun m!506181 () Bool)

(assert (=> b!525511 m!506181))

(declare-fun m!506183 () Bool)

(assert (=> b!525511 m!506183))

(declare-fun m!506185 () Bool)

(assert (=> b!525511 m!506185))

(declare-fun m!506187 () Bool)

(assert (=> b!525511 m!506187))

(declare-fun m!506189 () Bool)

(assert (=> b!525511 m!506189))

(assert (=> b!525511 m!506187))

(declare-fun m!506191 () Bool)

(assert (=> b!525511 m!506191))

(declare-fun m!506193 () Bool)

(assert (=> b!525511 m!506193))

(declare-fun m!506195 () Bool)

(assert (=> b!525511 m!506195))

(assert (=> b!525511 m!506187))

(declare-fun m!506197 () Bool)

(assert (=> b!525511 m!506197))

(assert (=> b!525508 m!506187))

(assert (=> b!525508 m!506187))

(declare-fun m!506199 () Bool)

(assert (=> b!525508 m!506199))

(declare-fun m!506201 () Bool)

(assert (=> start!47748 m!506201))

(declare-fun m!506203 () Bool)

(assert (=> start!47748 m!506203))

(declare-fun m!506205 () Bool)

(assert (=> b!525521 m!506205))

(declare-fun m!506207 () Bool)

(assert (=> b!525512 m!506207))

(declare-fun m!506209 () Bool)

(assert (=> b!525512 m!506209))

(assert (=> b!525512 m!506187))

(assert (=> b!525515 m!506187))

(assert (=> b!525515 m!506187))

(declare-fun m!506211 () Bool)

(assert (=> b!525515 m!506211))

(push 1)

