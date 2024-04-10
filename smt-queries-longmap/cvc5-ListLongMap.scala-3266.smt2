; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45468 () Bool)

(assert start!45468)

(declare-fun b!500493 () Bool)

(declare-fun res!302326 () Bool)

(declare-fun e!293233 () Bool)

(assert (=> b!500493 (=> (not res!302326) (not e!293233))))

(declare-datatypes ((array!32293 0))(
  ( (array!32294 (arr!15528 (Array (_ BitVec 32) (_ BitVec 64))) (size!15892 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32293)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32293 (_ BitVec 32)) Bool)

(assert (=> b!500493 (= res!302326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500494 () Bool)

(declare-fun res!302324 () Bool)

(assert (=> b!500494 (=> (not res!302324) (not e!293233))))

(declare-datatypes ((List!9686 0))(
  ( (Nil!9683) (Cons!9682 (h!10556 (_ BitVec 64)) (t!15914 List!9686)) )
))
(declare-fun arrayNoDuplicates!0 (array!32293 (_ BitVec 32) List!9686) Bool)

(assert (=> b!500494 (= res!302324 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9683))))

(declare-fun b!500495 () Bool)

(declare-fun res!302318 () Bool)

(declare-fun e!293236 () Bool)

(assert (=> b!500495 (=> (not res!302318) (not e!293236))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500495 (= res!302318 (validKeyInArray!0 (select (arr!15528 a!3235) j!176)))))

(declare-fun b!500496 () Bool)

(declare-fun res!302321 () Bool)

(declare-fun e!293237 () Bool)

(assert (=> b!500496 (=> res!302321 e!293237)))

(declare-datatypes ((SeekEntryResult!3995 0))(
  ( (MissingZero!3995 (index!18162 (_ BitVec 32))) (Found!3995 (index!18163 (_ BitVec 32))) (Intermediate!3995 (undefined!4807 Bool) (index!18164 (_ BitVec 32)) (x!47200 (_ BitVec 32))) (Undefined!3995) (MissingVacant!3995 (index!18165 (_ BitVec 32))) )
))
(declare-fun lt!227158 () SeekEntryResult!3995)

(assert (=> b!500496 (= res!302321 (or (undefined!4807 lt!227158) (not (is-Intermediate!3995 lt!227158))))))

(declare-fun b!500498 () Bool)

(declare-fun res!302325 () Bool)

(assert (=> b!500498 (=> (not res!302325) (not e!293236))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500498 (= res!302325 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500499 () Bool)

(declare-fun res!302316 () Bool)

(assert (=> b!500499 (=> (not res!302316) (not e!293236))))

(assert (=> b!500499 (= res!302316 (validKeyInArray!0 k!2280))))

(declare-fun b!500500 () Bool)

(declare-fun e!293232 () Bool)

(assert (=> b!500500 (= e!293237 e!293232)))

(declare-fun res!302319 () Bool)

(assert (=> b!500500 (=> res!302319 e!293232)))

(declare-fun lt!227156 () (_ BitVec 32))

(assert (=> b!500500 (= res!302319 (or (bvsgt #b00000000000000000000000000000000 (x!47200 lt!227158)) (bvsgt (x!47200 lt!227158) #b01111111111111111111111111111110) (bvslt lt!227156 #b00000000000000000000000000000000) (bvsge lt!227156 (size!15892 a!3235)) (bvslt (index!18164 lt!227158) #b00000000000000000000000000000000) (bvsge (index!18164 lt!227158) (size!15892 a!3235)) (not (= lt!227158 (Intermediate!3995 false (index!18164 lt!227158) (x!47200 lt!227158))))))))

(assert (=> b!500500 (and (or (= (select (arr!15528 a!3235) (index!18164 lt!227158)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15528 a!3235) (index!18164 lt!227158)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15528 a!3235) (index!18164 lt!227158)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15528 a!3235) (index!18164 lt!227158)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15056 0))(
  ( (Unit!15057) )
))
(declare-fun lt!227153 () Unit!15056)

(declare-fun e!293235 () Unit!15056)

(assert (=> b!500500 (= lt!227153 e!293235)))

(declare-fun c!59366 () Bool)

(assert (=> b!500500 (= c!59366 (= (select (arr!15528 a!3235) (index!18164 lt!227158)) (select (arr!15528 a!3235) j!176)))))

(assert (=> b!500500 (and (bvslt (x!47200 lt!227158) #b01111111111111111111111111111110) (or (= (select (arr!15528 a!3235) (index!18164 lt!227158)) (select (arr!15528 a!3235) j!176)) (= (select (arr!15528 a!3235) (index!18164 lt!227158)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15528 a!3235) (index!18164 lt!227158)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500501 () Bool)

(assert (=> b!500501 (= e!293236 e!293233)))

(declare-fun res!302320 () Bool)

(assert (=> b!500501 (=> (not res!302320) (not e!293233))))

(declare-fun lt!227157 () SeekEntryResult!3995)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500501 (= res!302320 (or (= lt!227157 (MissingZero!3995 i!1204)) (= lt!227157 (MissingVacant!3995 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32293 (_ BitVec 32)) SeekEntryResult!3995)

(assert (=> b!500501 (= lt!227157 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500502 () Bool)

(assert (=> b!500502 (= e!293233 (not e!293237))))

(declare-fun res!302322 () Bool)

(assert (=> b!500502 (=> res!302322 e!293237)))

(declare-fun lt!227155 () (_ BitVec 64))

(declare-fun lt!227151 () (_ BitVec 32))

(declare-fun lt!227149 () array!32293)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32293 (_ BitVec 32)) SeekEntryResult!3995)

(assert (=> b!500502 (= res!302322 (= lt!227158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227151 lt!227155 lt!227149 mask!3524)))))

(assert (=> b!500502 (= lt!227158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227156 (select (arr!15528 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500502 (= lt!227151 (toIndex!0 lt!227155 mask!3524))))

(assert (=> b!500502 (= lt!227155 (select (store (arr!15528 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500502 (= lt!227156 (toIndex!0 (select (arr!15528 a!3235) j!176) mask!3524))))

(assert (=> b!500502 (= lt!227149 (array!32294 (store (arr!15528 a!3235) i!1204 k!2280) (size!15892 a!3235)))))

(declare-fun e!293234 () Bool)

(assert (=> b!500502 e!293234))

(declare-fun res!302317 () Bool)

(assert (=> b!500502 (=> (not res!302317) (not e!293234))))

(assert (=> b!500502 (= res!302317 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227154 () Unit!15056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15056)

(assert (=> b!500502 (= lt!227154 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500503 () Bool)

(declare-fun res!302323 () Bool)

(assert (=> b!500503 (=> (not res!302323) (not e!293236))))

(assert (=> b!500503 (= res!302323 (and (= (size!15892 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15892 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15892 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500504 () Bool)

(declare-fun Unit!15058 () Unit!15056)

(assert (=> b!500504 (= e!293235 Unit!15058)))

(declare-fun lt!227152 () Unit!15056)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15056)

(assert (=> b!500504 (= lt!227152 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227156 #b00000000000000000000000000000000 (index!18164 lt!227158) (x!47200 lt!227158) mask!3524))))

(declare-fun res!302315 () Bool)

(assert (=> b!500504 (= res!302315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227156 lt!227155 lt!227149 mask!3524) (Intermediate!3995 false (index!18164 lt!227158) (x!47200 lt!227158))))))

(declare-fun e!293231 () Bool)

(assert (=> b!500504 (=> (not res!302315) (not e!293231))))

(assert (=> b!500504 e!293231))

(declare-fun b!500505 () Bool)

(assert (=> b!500505 (= e!293231 false)))

(declare-fun b!500506 () Bool)

(assert (=> b!500506 (= e!293234 (= (seekEntryOrOpen!0 (select (arr!15528 a!3235) j!176) a!3235 mask!3524) (Found!3995 j!176)))))

(declare-fun b!500507 () Bool)

(declare-fun Unit!15059 () Unit!15056)

(assert (=> b!500507 (= e!293235 Unit!15059)))

(declare-fun res!302327 () Bool)

(assert (=> start!45468 (=> (not res!302327) (not e!293236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45468 (= res!302327 (validMask!0 mask!3524))))

(assert (=> start!45468 e!293236))

(assert (=> start!45468 true))

(declare-fun array_inv!11324 (array!32293) Bool)

(assert (=> start!45468 (array_inv!11324 a!3235)))

(declare-fun b!500497 () Bool)

(assert (=> b!500497 (= e!293232 true)))

(declare-fun lt!227150 () SeekEntryResult!3995)

(assert (=> b!500497 (= lt!227150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227156 lt!227155 lt!227149 mask!3524))))

(assert (= (and start!45468 res!302327) b!500503))

(assert (= (and b!500503 res!302323) b!500495))

(assert (= (and b!500495 res!302318) b!500499))

(assert (= (and b!500499 res!302316) b!500498))

(assert (= (and b!500498 res!302325) b!500501))

(assert (= (and b!500501 res!302320) b!500493))

(assert (= (and b!500493 res!302326) b!500494))

(assert (= (and b!500494 res!302324) b!500502))

(assert (= (and b!500502 res!302317) b!500506))

(assert (= (and b!500502 (not res!302322)) b!500496))

(assert (= (and b!500496 (not res!302321)) b!500500))

(assert (= (and b!500500 c!59366) b!500504))

(assert (= (and b!500500 (not c!59366)) b!500507))

(assert (= (and b!500504 res!302315) b!500505))

(assert (= (and b!500500 (not res!302319)) b!500497))

(declare-fun m!481623 () Bool)

(assert (=> b!500500 m!481623))

(declare-fun m!481625 () Bool)

(assert (=> b!500500 m!481625))

(declare-fun m!481627 () Bool)

(assert (=> b!500494 m!481627))

(declare-fun m!481629 () Bool)

(assert (=> b!500498 m!481629))

(declare-fun m!481631 () Bool)

(assert (=> b!500499 m!481631))

(declare-fun m!481633 () Bool)

(assert (=> b!500504 m!481633))

(declare-fun m!481635 () Bool)

(assert (=> b!500504 m!481635))

(declare-fun m!481637 () Bool)

(assert (=> b!500493 m!481637))

(declare-fun m!481639 () Bool)

(assert (=> start!45468 m!481639))

(declare-fun m!481641 () Bool)

(assert (=> start!45468 m!481641))

(assert (=> b!500506 m!481625))

(assert (=> b!500506 m!481625))

(declare-fun m!481643 () Bool)

(assert (=> b!500506 m!481643))

(declare-fun m!481645 () Bool)

(assert (=> b!500501 m!481645))

(assert (=> b!500497 m!481635))

(declare-fun m!481647 () Bool)

(assert (=> b!500502 m!481647))

(declare-fun m!481649 () Bool)

(assert (=> b!500502 m!481649))

(declare-fun m!481651 () Bool)

(assert (=> b!500502 m!481651))

(declare-fun m!481653 () Bool)

(assert (=> b!500502 m!481653))

(declare-fun m!481655 () Bool)

(assert (=> b!500502 m!481655))

(assert (=> b!500502 m!481625))

(declare-fun m!481657 () Bool)

(assert (=> b!500502 m!481657))

(assert (=> b!500502 m!481625))

(declare-fun m!481659 () Bool)

(assert (=> b!500502 m!481659))

(assert (=> b!500502 m!481625))

(declare-fun m!481661 () Bool)

(assert (=> b!500502 m!481661))

(assert (=> b!500495 m!481625))

(assert (=> b!500495 m!481625))

(declare-fun m!481663 () Bool)

(assert (=> b!500495 m!481663))

(push 1)

(assert (not b!500497))

(assert (not b!500493))

(assert (not b!500502))

(assert (not b!500499))

(assert (not b!500501))

(assert (not b!500495))

(assert (not b!500506))

(assert (not b!500504))

(assert (not start!45468))

(assert (not b!500494))

(assert (not b!500498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

