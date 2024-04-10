; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47798 () Bool)

(assert start!47798)

(declare-fun b!526558 () Bool)

(declare-datatypes ((Unit!16596 0))(
  ( (Unit!16597) )
))
(declare-fun e!306921 () Unit!16596)

(declare-fun Unit!16598 () Unit!16596)

(assert (=> b!526558 (= e!306921 Unit!16598)))

(declare-fun lt!242201 () Unit!16596)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!242200 () (_ BitVec 32))

(declare-datatypes ((array!33435 0))(
  ( (array!33436 (arr!16069 (Array (_ BitVec 32) (_ BitVec 64))) (size!16433 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33435)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4536 0))(
  ( (MissingZero!4536 (index!20356 (_ BitVec 32))) (Found!4536 (index!20357 (_ BitVec 32))) (Intermediate!4536 (undefined!5348 Bool) (index!20358 (_ BitVec 32)) (x!49325 (_ BitVec 32))) (Undefined!4536) (MissingVacant!4536 (index!20359 (_ BitVec 32))) )
))
(declare-fun lt!242199 () SeekEntryResult!4536)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16596)

(assert (=> b!526558 (= lt!242201 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242200 #b00000000000000000000000000000000 (index!20358 lt!242199) (x!49325 lt!242199) mask!3524))))

(declare-fun lt!242203 () (_ BitVec 64))

(declare-fun lt!242202 () array!33435)

(declare-fun res!323173 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33435 (_ BitVec 32)) SeekEntryResult!4536)

(assert (=> b!526558 (= res!323173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242200 lt!242203 lt!242202 mask!3524) (Intermediate!4536 false (index!20358 lt!242199) (x!49325 lt!242199))))))

(declare-fun e!306923 () Bool)

(assert (=> b!526558 (=> (not res!323173) (not e!306923))))

(assert (=> b!526558 e!306923))

(declare-fun b!526559 () Bool)

(declare-fun res!323174 () Bool)

(declare-fun e!306922 () Bool)

(assert (=> b!526559 (=> res!323174 e!306922)))

(get-info :version)

(assert (=> b!526559 (= res!323174 (or (undefined!5348 lt!242199) (not ((_ is Intermediate!4536) lt!242199))))))

(declare-fun b!526560 () Bool)

(declare-fun res!323169 () Bool)

(declare-fun e!306920 () Bool)

(assert (=> b!526560 (=> (not res!323169) (not e!306920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33435 (_ BitVec 32)) Bool)

(assert (=> b!526560 (= res!323169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526561 () Bool)

(assert (=> b!526561 (= e!306923 false)))

(declare-fun b!526562 () Bool)

(declare-fun res!323170 () Bool)

(assert (=> b!526562 (=> (not res!323170) (not e!306920))))

(declare-datatypes ((List!10227 0))(
  ( (Nil!10224) (Cons!10223 (h!11154 (_ BitVec 64)) (t!16455 List!10227)) )
))
(declare-fun arrayNoDuplicates!0 (array!33435 (_ BitVec 32) List!10227) Bool)

(assert (=> b!526562 (= res!323170 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10224))))

(declare-fun b!526563 () Bool)

(declare-fun res!323166 () Bool)

(declare-fun e!306918 () Bool)

(assert (=> b!526563 (=> (not res!323166) (not e!306918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526563 (= res!323166 (validKeyInArray!0 (select (arr!16069 a!3235) j!176)))))

(declare-fun e!306924 () Bool)

(declare-fun b!526564 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33435 (_ BitVec 32)) SeekEntryResult!4536)

(assert (=> b!526564 (= e!306924 (= (seekEntryOrOpen!0 (select (arr!16069 a!3235) j!176) a!3235 mask!3524) (Found!4536 j!176)))))

(declare-fun b!526565 () Bool)

(assert (=> b!526565 (= e!306918 e!306920)))

(declare-fun res!323172 () Bool)

(assert (=> b!526565 (=> (not res!323172) (not e!306920))))

(declare-fun lt!242197 () SeekEntryResult!4536)

(assert (=> b!526565 (= res!323172 (or (= lt!242197 (MissingZero!4536 i!1204)) (= lt!242197 (MissingVacant!4536 i!1204))))))

(assert (=> b!526565 (= lt!242197 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!323167 () Bool)

(assert (=> start!47798 (=> (not res!323167) (not e!306918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47798 (= res!323167 (validMask!0 mask!3524))))

(assert (=> start!47798 e!306918))

(assert (=> start!47798 true))

(declare-fun array_inv!11865 (array!33435) Bool)

(assert (=> start!47798 (array_inv!11865 a!3235)))

(declare-fun b!526566 () Bool)

(declare-fun res!323165 () Bool)

(assert (=> b!526566 (=> (not res!323165) (not e!306918))))

(assert (=> b!526566 (= res!323165 (and (= (size!16433 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16433 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16433 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526567 () Bool)

(declare-fun res!323171 () Bool)

(assert (=> b!526567 (=> (not res!323171) (not e!306918))))

(assert (=> b!526567 (= res!323171 (validKeyInArray!0 k0!2280))))

(declare-fun b!526568 () Bool)

(declare-fun Unit!16599 () Unit!16596)

(assert (=> b!526568 (= e!306921 Unit!16599)))

(declare-fun b!526569 () Bool)

(assert (=> b!526569 (= e!306920 (not e!306922))))

(declare-fun res!323164 () Bool)

(assert (=> b!526569 (=> res!323164 e!306922)))

(declare-fun lt!242198 () (_ BitVec 32))

(assert (=> b!526569 (= res!323164 (= lt!242199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242198 lt!242203 lt!242202 mask!3524)))))

(assert (=> b!526569 (= lt!242199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242200 (select (arr!16069 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526569 (= lt!242198 (toIndex!0 lt!242203 mask!3524))))

(assert (=> b!526569 (= lt!242203 (select (store (arr!16069 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526569 (= lt!242200 (toIndex!0 (select (arr!16069 a!3235) j!176) mask!3524))))

(assert (=> b!526569 (= lt!242202 (array!33436 (store (arr!16069 a!3235) i!1204 k0!2280) (size!16433 a!3235)))))

(assert (=> b!526569 e!306924))

(declare-fun res!323163 () Bool)

(assert (=> b!526569 (=> (not res!323163) (not e!306924))))

(assert (=> b!526569 (= res!323163 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242194 () Unit!16596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16596)

(assert (=> b!526569 (= lt!242194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526570 () Bool)

(declare-fun res!323168 () Bool)

(assert (=> b!526570 (=> (not res!323168) (not e!306918))))

(declare-fun arrayContainsKey!0 (array!33435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526570 (= res!323168 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526571 () Bool)

(assert (=> b!526571 (= e!306922 true)))

(assert (=> b!526571 (= (index!20358 lt!242199) i!1204)))

(declare-fun lt!242196 () Unit!16596)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16596)

(assert (=> b!526571 (= lt!242196 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242200 #b00000000000000000000000000000000 (index!20358 lt!242199) (x!49325 lt!242199) mask!3524))))

(assert (=> b!526571 (and (or (= (select (arr!16069 a!3235) (index!20358 lt!242199)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16069 a!3235) (index!20358 lt!242199)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16069 a!3235) (index!20358 lt!242199)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16069 a!3235) (index!20358 lt!242199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242195 () Unit!16596)

(assert (=> b!526571 (= lt!242195 e!306921)))

(declare-fun c!62003 () Bool)

(assert (=> b!526571 (= c!62003 (= (select (arr!16069 a!3235) (index!20358 lt!242199)) (select (arr!16069 a!3235) j!176)))))

(assert (=> b!526571 (and (bvslt (x!49325 lt!242199) #b01111111111111111111111111111110) (or (= (select (arr!16069 a!3235) (index!20358 lt!242199)) (select (arr!16069 a!3235) j!176)) (= (select (arr!16069 a!3235) (index!20358 lt!242199)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16069 a!3235) (index!20358 lt!242199)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47798 res!323167) b!526566))

(assert (= (and b!526566 res!323165) b!526563))

(assert (= (and b!526563 res!323166) b!526567))

(assert (= (and b!526567 res!323171) b!526570))

(assert (= (and b!526570 res!323168) b!526565))

(assert (= (and b!526565 res!323172) b!526560))

(assert (= (and b!526560 res!323169) b!526562))

(assert (= (and b!526562 res!323170) b!526569))

(assert (= (and b!526569 res!323163) b!526564))

(assert (= (and b!526569 (not res!323164)) b!526559))

(assert (= (and b!526559 (not res!323174)) b!526571))

(assert (= (and b!526571 c!62003) b!526558))

(assert (= (and b!526571 (not c!62003)) b!526568))

(assert (= (and b!526558 res!323173) b!526561))

(declare-fun m!507269 () Bool)

(assert (=> b!526563 m!507269))

(assert (=> b!526563 m!507269))

(declare-fun m!507271 () Bool)

(assert (=> b!526563 m!507271))

(declare-fun m!507273 () Bool)

(assert (=> b!526569 m!507273))

(declare-fun m!507275 () Bool)

(assert (=> b!526569 m!507275))

(declare-fun m!507277 () Bool)

(assert (=> b!526569 m!507277))

(assert (=> b!526569 m!507269))

(declare-fun m!507279 () Bool)

(assert (=> b!526569 m!507279))

(assert (=> b!526569 m!507269))

(declare-fun m!507281 () Bool)

(assert (=> b!526569 m!507281))

(declare-fun m!507283 () Bool)

(assert (=> b!526569 m!507283))

(assert (=> b!526569 m!507269))

(declare-fun m!507285 () Bool)

(assert (=> b!526569 m!507285))

(declare-fun m!507287 () Bool)

(assert (=> b!526569 m!507287))

(declare-fun m!507289 () Bool)

(assert (=> b!526567 m!507289))

(declare-fun m!507291 () Bool)

(assert (=> b!526571 m!507291))

(declare-fun m!507293 () Bool)

(assert (=> b!526571 m!507293))

(assert (=> b!526571 m!507269))

(declare-fun m!507295 () Bool)

(assert (=> b!526560 m!507295))

(declare-fun m!507297 () Bool)

(assert (=> b!526562 m!507297))

(declare-fun m!507299 () Bool)

(assert (=> start!47798 m!507299))

(declare-fun m!507301 () Bool)

(assert (=> start!47798 m!507301))

(declare-fun m!507303 () Bool)

(assert (=> b!526558 m!507303))

(declare-fun m!507305 () Bool)

(assert (=> b!526558 m!507305))

(assert (=> b!526564 m!507269))

(assert (=> b!526564 m!507269))

(declare-fun m!507307 () Bool)

(assert (=> b!526564 m!507307))

(declare-fun m!507309 () Bool)

(assert (=> b!526570 m!507309))

(declare-fun m!507311 () Bool)

(assert (=> b!526565 m!507311))

(check-sat (not b!526558) (not b!526564) (not b!526560) (not b!526567) (not b!526562) (not b!526569) (not start!47798) (not b!526571) (not b!526563) (not b!526565) (not b!526570))
(check-sat)
