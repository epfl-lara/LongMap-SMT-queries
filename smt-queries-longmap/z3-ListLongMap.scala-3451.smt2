; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47886 () Bool)

(assert start!47886)

(declare-fun b!527202 () Bool)

(declare-fun res!323671 () Bool)

(declare-fun e!307248 () Bool)

(assert (=> b!527202 (=> (not res!323671) (not e!307248))))

(declare-datatypes ((array!33464 0))(
  ( (array!33465 (arr!16082 (Array (_ BitVec 32) (_ BitVec 64))) (size!16447 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33464)

(declare-datatypes ((List!10279 0))(
  ( (Nil!10276) (Cons!10275 (h!11209 (_ BitVec 64)) (t!16498 List!10279)) )
))
(declare-fun arrayNoDuplicates!0 (array!33464 (_ BitVec 32) List!10279) Bool)

(assert (=> b!527202 (= res!323671 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10276))))

(declare-fun b!527203 () Bool)

(declare-fun e!307252 () Bool)

(assert (=> b!527203 (= e!307252 e!307248)))

(declare-fun res!323673 () Bool)

(assert (=> b!527203 (=> (not res!323673) (not e!307248))))

(declare-datatypes ((SeekEntryResult!4546 0))(
  ( (MissingZero!4546 (index!20402 (_ BitVec 32))) (Found!4546 (index!20403 (_ BitVec 32))) (Intermediate!4546 (undefined!5358 Bool) (index!20404 (_ BitVec 32)) (x!49382 (_ BitVec 32))) (Undefined!4546) (MissingVacant!4546 (index!20405 (_ BitVec 32))) )
))
(declare-fun lt!242535 () SeekEntryResult!4546)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527203 (= res!323673 (or (= lt!242535 (MissingZero!4546 i!1204)) (= lt!242535 (MissingVacant!4546 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33464 (_ BitVec 32)) SeekEntryResult!4546)

(assert (=> b!527203 (= lt!242535 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527204 () Bool)

(declare-datatypes ((Unit!16630 0))(
  ( (Unit!16631) )
))
(declare-fun e!307251 () Unit!16630)

(declare-fun Unit!16632 () Unit!16630)

(assert (=> b!527204 (= e!307251 Unit!16632)))

(declare-fun lt!242537 () Unit!16630)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242542 () (_ BitVec 32))

(declare-fun lt!242541 () SeekEntryResult!4546)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16630)

(assert (=> b!527204 (= lt!242537 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242542 #b00000000000000000000000000000000 (index!20404 lt!242541) (x!49382 lt!242541) mask!3524))))

(declare-fun lt!242540 () (_ BitVec 64))

(declare-fun lt!242538 () array!33464)

(declare-fun res!323669 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33464 (_ BitVec 32)) SeekEntryResult!4546)

(assert (=> b!527204 (= res!323669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242542 lt!242540 lt!242538 mask!3524) (Intermediate!4546 false (index!20404 lt!242541) (x!49382 lt!242541))))))

(declare-fun e!307250 () Bool)

(assert (=> b!527204 (=> (not res!323669) (not e!307250))))

(assert (=> b!527204 e!307250))

(declare-fun b!527205 () Bool)

(declare-fun res!323668 () Bool)

(assert (=> b!527205 (=> (not res!323668) (not e!307248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33464 (_ BitVec 32)) Bool)

(assert (=> b!527205 (= res!323668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527206 () Bool)

(assert (=> b!527206 (= e!307250 false)))

(declare-fun b!527207 () Bool)

(declare-fun e!307253 () Bool)

(assert (=> b!527207 (= e!307248 (not e!307253))))

(declare-fun res!323670 () Bool)

(assert (=> b!527207 (=> res!323670 e!307253)))

(declare-fun lt!242533 () (_ BitVec 32))

(assert (=> b!527207 (= res!323670 (= lt!242541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242533 lt!242540 lt!242538 mask!3524)))))

(assert (=> b!527207 (= lt!242541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242542 (select (arr!16082 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527207 (= lt!242533 (toIndex!0 lt!242540 mask!3524))))

(assert (=> b!527207 (= lt!242540 (select (store (arr!16082 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527207 (= lt!242542 (toIndex!0 (select (arr!16082 a!3235) j!176) mask!3524))))

(assert (=> b!527207 (= lt!242538 (array!33465 (store (arr!16082 a!3235) i!1204 k0!2280) (size!16447 a!3235)))))

(declare-fun e!307249 () Bool)

(assert (=> b!527207 e!307249))

(declare-fun res!323666 () Bool)

(assert (=> b!527207 (=> (not res!323666) (not e!307249))))

(assert (=> b!527207 (= res!323666 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242534 () Unit!16630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16630)

(assert (=> b!527207 (= lt!242534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527208 () Bool)

(declare-fun res!323674 () Bool)

(assert (=> b!527208 (=> (not res!323674) (not e!307252))))

(assert (=> b!527208 (= res!323674 (and (= (size!16447 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16447 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16447 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527209 () Bool)

(declare-fun res!323664 () Bool)

(assert (=> b!527209 (=> res!323664 e!307253)))

(get-info :version)

(assert (=> b!527209 (= res!323664 (or (undefined!5358 lt!242541) (not ((_ is Intermediate!4546) lt!242541))))))

(declare-fun b!527210 () Bool)

(declare-fun res!323672 () Bool)

(assert (=> b!527210 (=> (not res!323672) (not e!307252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527210 (= res!323672 (validKeyInArray!0 k0!2280))))

(declare-fun b!527211 () Bool)

(assert (=> b!527211 (= e!307249 (= (seekEntryOrOpen!0 (select (arr!16082 a!3235) j!176) a!3235 mask!3524) (Found!4546 j!176)))))

(declare-fun b!527212 () Bool)

(declare-fun res!323675 () Bool)

(assert (=> b!527212 (=> (not res!323675) (not e!307252))))

(assert (=> b!527212 (= res!323675 (validKeyInArray!0 (select (arr!16082 a!3235) j!176)))))

(declare-fun res!323667 () Bool)

(assert (=> start!47886 (=> (not res!323667) (not e!307252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47886 (= res!323667 (validMask!0 mask!3524))))

(assert (=> start!47886 e!307252))

(assert (=> start!47886 true))

(declare-fun array_inv!11965 (array!33464) Bool)

(assert (=> start!47886 (array_inv!11965 a!3235)))

(declare-fun b!527213 () Bool)

(assert (=> b!527213 (= e!307253 (or (bvsgt (x!49382 lt!242541) #b01111111111111111111111111111110) (bvslt lt!242542 #b00000000000000000000000000000000) (bvsge lt!242542 (size!16447 a!3235)) (bvslt (index!20404 lt!242541) #b00000000000000000000000000000000) (bvsge (index!20404 lt!242541) (size!16447 a!3235)) (= lt!242541 (Intermediate!4546 false (index!20404 lt!242541) (x!49382 lt!242541)))))))

(assert (=> b!527213 (= (index!20404 lt!242541) i!1204)))

(declare-fun lt!242539 () Unit!16630)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16630)

(assert (=> b!527213 (= lt!242539 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242542 #b00000000000000000000000000000000 (index!20404 lt!242541) (x!49382 lt!242541) mask!3524))))

(assert (=> b!527213 (and (or (= (select (arr!16082 a!3235) (index!20404 lt!242541)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16082 a!3235) (index!20404 lt!242541)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16082 a!3235) (index!20404 lt!242541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16082 a!3235) (index!20404 lt!242541)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242536 () Unit!16630)

(assert (=> b!527213 (= lt!242536 e!307251)))

(declare-fun c!62076 () Bool)

(assert (=> b!527213 (= c!62076 (= (select (arr!16082 a!3235) (index!20404 lt!242541)) (select (arr!16082 a!3235) j!176)))))

(assert (=> b!527213 (and (bvslt (x!49382 lt!242541) #b01111111111111111111111111111110) (or (= (select (arr!16082 a!3235) (index!20404 lt!242541)) (select (arr!16082 a!3235) j!176)) (= (select (arr!16082 a!3235) (index!20404 lt!242541)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16082 a!3235) (index!20404 lt!242541)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527214 () Bool)

(declare-fun res!323665 () Bool)

(assert (=> b!527214 (=> (not res!323665) (not e!307252))))

(declare-fun arrayContainsKey!0 (array!33464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527214 (= res!323665 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527215 () Bool)

(declare-fun Unit!16633 () Unit!16630)

(assert (=> b!527215 (= e!307251 Unit!16633)))

(assert (= (and start!47886 res!323667) b!527208))

(assert (= (and b!527208 res!323674) b!527212))

(assert (= (and b!527212 res!323675) b!527210))

(assert (= (and b!527210 res!323672) b!527214))

(assert (= (and b!527214 res!323665) b!527203))

(assert (= (and b!527203 res!323673) b!527205))

(assert (= (and b!527205 res!323668) b!527202))

(assert (= (and b!527202 res!323671) b!527207))

(assert (= (and b!527207 res!323666) b!527211))

(assert (= (and b!527207 (not res!323670)) b!527209))

(assert (= (and b!527209 (not res!323664)) b!527213))

(assert (= (and b!527213 c!62076) b!527204))

(assert (= (and b!527213 (not c!62076)) b!527215))

(assert (= (and b!527204 res!323669) b!527206))

(declare-fun m!507373 () Bool)

(assert (=> b!527213 m!507373))

(declare-fun m!507375 () Bool)

(assert (=> b!527213 m!507375))

(declare-fun m!507377 () Bool)

(assert (=> b!527213 m!507377))

(declare-fun m!507379 () Bool)

(assert (=> b!527205 m!507379))

(declare-fun m!507381 () Bool)

(assert (=> b!527210 m!507381))

(declare-fun m!507383 () Bool)

(assert (=> b!527207 m!507383))

(declare-fun m!507385 () Bool)

(assert (=> b!527207 m!507385))

(declare-fun m!507387 () Bool)

(assert (=> b!527207 m!507387))

(declare-fun m!507389 () Bool)

(assert (=> b!527207 m!507389))

(assert (=> b!527207 m!507377))

(declare-fun m!507391 () Bool)

(assert (=> b!527207 m!507391))

(declare-fun m!507393 () Bool)

(assert (=> b!527207 m!507393))

(assert (=> b!527207 m!507377))

(declare-fun m!507395 () Bool)

(assert (=> b!527207 m!507395))

(assert (=> b!527207 m!507377))

(declare-fun m!507397 () Bool)

(assert (=> b!527207 m!507397))

(declare-fun m!507399 () Bool)

(assert (=> b!527214 m!507399))

(assert (=> b!527211 m!507377))

(assert (=> b!527211 m!507377))

(declare-fun m!507401 () Bool)

(assert (=> b!527211 m!507401))

(declare-fun m!507403 () Bool)

(assert (=> b!527202 m!507403))

(declare-fun m!507405 () Bool)

(assert (=> start!47886 m!507405))

(declare-fun m!507407 () Bool)

(assert (=> start!47886 m!507407))

(declare-fun m!507409 () Bool)

(assert (=> b!527204 m!507409))

(declare-fun m!507411 () Bool)

(assert (=> b!527204 m!507411))

(assert (=> b!527212 m!507377))

(assert (=> b!527212 m!507377))

(declare-fun m!507413 () Bool)

(assert (=> b!527212 m!507413))

(declare-fun m!507415 () Bool)

(assert (=> b!527203 m!507415))

(check-sat (not b!527211) (not b!527210) (not b!527214) (not start!47886) (not b!527202) (not b!527213) (not b!527203) (not b!527207) (not b!527204) (not b!527212) (not b!527205))
(check-sat)
