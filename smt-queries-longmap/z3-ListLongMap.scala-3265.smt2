; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45464 () Bool)

(assert start!45464)

(declare-fun b!500403 () Bool)

(declare-fun res!302249 () Bool)

(declare-fun e!293185 () Bool)

(assert (=> b!500403 (=> (not res!302249) (not e!293185))))

(declare-datatypes ((array!32289 0))(
  ( (array!32290 (arr!15526 (Array (_ BitVec 32) (_ BitVec 64))) (size!15890 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32289)

(declare-datatypes ((List!9684 0))(
  ( (Nil!9681) (Cons!9680 (h!10554 (_ BitVec 64)) (t!15912 List!9684)) )
))
(declare-fun arrayNoDuplicates!0 (array!32289 (_ BitVec 32) List!9684) Bool)

(assert (=> b!500403 (= res!302249 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9681))))

(declare-fun b!500404 () Bool)

(declare-datatypes ((Unit!15048 0))(
  ( (Unit!15049) )
))
(declare-fun e!293187 () Unit!15048)

(declare-fun Unit!15050 () Unit!15048)

(assert (=> b!500404 (= e!293187 Unit!15050)))

(declare-fun b!500405 () Bool)

(declare-fun e!293186 () Bool)

(assert (=> b!500405 (= e!293186 true)))

(declare-fun lt!227091 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227093 () (_ BitVec 32))

(declare-fun lt!227094 () array!32289)

(declare-datatypes ((SeekEntryResult!3993 0))(
  ( (MissingZero!3993 (index!18154 (_ BitVec 32))) (Found!3993 (index!18155 (_ BitVec 32))) (Intermediate!3993 (undefined!4805 Bool) (index!18156 (_ BitVec 32)) (x!47190 (_ BitVec 32))) (Undefined!3993) (MissingVacant!3993 (index!18157 (_ BitVec 32))) )
))
(declare-fun lt!227095 () SeekEntryResult!3993)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32289 (_ BitVec 32)) SeekEntryResult!3993)

(assert (=> b!500405 (= lt!227095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227093 lt!227091 lt!227094 mask!3524))))

(declare-fun b!500406 () Bool)

(declare-fun e!293183 () Bool)

(assert (=> b!500406 (= e!293183 e!293186)))

(declare-fun res!302244 () Bool)

(assert (=> b!500406 (=> res!302244 e!293186)))

(declare-fun lt!227096 () SeekEntryResult!3993)

(assert (=> b!500406 (= res!302244 (or (bvsgt #b00000000000000000000000000000000 (x!47190 lt!227096)) (bvsgt (x!47190 lt!227096) #b01111111111111111111111111111110) (bvslt lt!227093 #b00000000000000000000000000000000) (bvsge lt!227093 (size!15890 a!3235)) (bvslt (index!18156 lt!227096) #b00000000000000000000000000000000) (bvsge (index!18156 lt!227096) (size!15890 a!3235)) (not (= lt!227096 (Intermediate!3993 false (index!18156 lt!227096) (x!47190 lt!227096))))))))

(assert (=> b!500406 (and (or (= (select (arr!15526 a!3235) (index!18156 lt!227096)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15526 a!3235) (index!18156 lt!227096)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15526 a!3235) (index!18156 lt!227096)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15526 a!3235) (index!18156 lt!227096)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227089 () Unit!15048)

(assert (=> b!500406 (= lt!227089 e!293187)))

(declare-fun c!59360 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500406 (= c!59360 (= (select (arr!15526 a!3235) (index!18156 lt!227096)) (select (arr!15526 a!3235) j!176)))))

(assert (=> b!500406 (and (bvslt (x!47190 lt!227096) #b01111111111111111111111111111110) (or (= (select (arr!15526 a!3235) (index!18156 lt!227096)) (select (arr!15526 a!3235) j!176)) (= (select (arr!15526 a!3235) (index!18156 lt!227096)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15526 a!3235) (index!18156 lt!227096)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500407 () Bool)

(declare-fun res!302243 () Bool)

(declare-fun e!293184 () Bool)

(assert (=> b!500407 (=> (not res!302243) (not e!293184))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500407 (= res!302243 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500408 () Bool)

(assert (=> b!500408 (= e!293185 (not e!293183))))

(declare-fun res!302238 () Bool)

(assert (=> b!500408 (=> res!302238 e!293183)))

(declare-fun lt!227097 () (_ BitVec 32))

(assert (=> b!500408 (= res!302238 (= lt!227096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227097 lt!227091 lt!227094 mask!3524)))))

(assert (=> b!500408 (= lt!227096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227093 (select (arr!15526 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500408 (= lt!227097 (toIndex!0 lt!227091 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500408 (= lt!227091 (select (store (arr!15526 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500408 (= lt!227093 (toIndex!0 (select (arr!15526 a!3235) j!176) mask!3524))))

(assert (=> b!500408 (= lt!227094 (array!32290 (store (arr!15526 a!3235) i!1204 k0!2280) (size!15890 a!3235)))))

(declare-fun e!293190 () Bool)

(assert (=> b!500408 e!293190))

(declare-fun res!302242 () Bool)

(assert (=> b!500408 (=> (not res!302242) (not e!293190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32289 (_ BitVec 32)) Bool)

(assert (=> b!500408 (= res!302242 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227092 () Unit!15048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15048)

(assert (=> b!500408 (= lt!227092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500409 () Bool)

(assert (=> b!500409 (= e!293184 e!293185)))

(declare-fun res!302245 () Bool)

(assert (=> b!500409 (=> (not res!302245) (not e!293185))))

(declare-fun lt!227098 () SeekEntryResult!3993)

(assert (=> b!500409 (= res!302245 (or (= lt!227098 (MissingZero!3993 i!1204)) (= lt!227098 (MissingVacant!3993 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32289 (_ BitVec 32)) SeekEntryResult!3993)

(assert (=> b!500409 (= lt!227098 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!302241 () Bool)

(assert (=> start!45464 (=> (not res!302241) (not e!293184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45464 (= res!302241 (validMask!0 mask!3524))))

(assert (=> start!45464 e!293184))

(assert (=> start!45464 true))

(declare-fun array_inv!11322 (array!32289) Bool)

(assert (=> start!45464 (array_inv!11322 a!3235)))

(declare-fun b!500410 () Bool)

(declare-fun res!302247 () Bool)

(assert (=> b!500410 (=> (not res!302247) (not e!293184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500410 (= res!302247 (validKeyInArray!0 k0!2280))))

(declare-fun b!500411 () Bool)

(declare-fun res!302246 () Bool)

(assert (=> b!500411 (=> (not res!302246) (not e!293185))))

(assert (=> b!500411 (= res!302246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500412 () Bool)

(declare-fun Unit!15051 () Unit!15048)

(assert (=> b!500412 (= e!293187 Unit!15051)))

(declare-fun lt!227090 () Unit!15048)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15048)

(assert (=> b!500412 (= lt!227090 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227093 #b00000000000000000000000000000000 (index!18156 lt!227096) (x!47190 lt!227096) mask!3524))))

(declare-fun res!302239 () Bool)

(assert (=> b!500412 (= res!302239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227093 lt!227091 lt!227094 mask!3524) (Intermediate!3993 false (index!18156 lt!227096) (x!47190 lt!227096))))))

(declare-fun e!293189 () Bool)

(assert (=> b!500412 (=> (not res!302239) (not e!293189))))

(assert (=> b!500412 e!293189))

(declare-fun b!500413 () Bool)

(declare-fun res!302248 () Bool)

(assert (=> b!500413 (=> (not res!302248) (not e!293184))))

(assert (=> b!500413 (= res!302248 (validKeyInArray!0 (select (arr!15526 a!3235) j!176)))))

(declare-fun b!500414 () Bool)

(assert (=> b!500414 (= e!293190 (= (seekEntryOrOpen!0 (select (arr!15526 a!3235) j!176) a!3235 mask!3524) (Found!3993 j!176)))))

(declare-fun b!500415 () Bool)

(assert (=> b!500415 (= e!293189 false)))

(declare-fun b!500416 () Bool)

(declare-fun res!302240 () Bool)

(assert (=> b!500416 (=> (not res!302240) (not e!293184))))

(assert (=> b!500416 (= res!302240 (and (= (size!15890 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15890 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15890 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500417 () Bool)

(declare-fun res!302237 () Bool)

(assert (=> b!500417 (=> res!302237 e!293183)))

(get-info :version)

(assert (=> b!500417 (= res!302237 (or (undefined!4805 lt!227096) (not ((_ is Intermediate!3993) lt!227096))))))

(assert (= (and start!45464 res!302241) b!500416))

(assert (= (and b!500416 res!302240) b!500413))

(assert (= (and b!500413 res!302248) b!500410))

(assert (= (and b!500410 res!302247) b!500407))

(assert (= (and b!500407 res!302243) b!500409))

(assert (= (and b!500409 res!302245) b!500411))

(assert (= (and b!500411 res!302246) b!500403))

(assert (= (and b!500403 res!302249) b!500408))

(assert (= (and b!500408 res!302242) b!500414))

(assert (= (and b!500408 (not res!302238)) b!500417))

(assert (= (and b!500417 (not res!302237)) b!500406))

(assert (= (and b!500406 c!59360) b!500412))

(assert (= (and b!500406 (not c!59360)) b!500404))

(assert (= (and b!500412 res!302239) b!500415))

(assert (= (and b!500406 (not res!302244)) b!500405))

(declare-fun m!481539 () Bool)

(assert (=> b!500408 m!481539))

(declare-fun m!481541 () Bool)

(assert (=> b!500408 m!481541))

(declare-fun m!481543 () Bool)

(assert (=> b!500408 m!481543))

(declare-fun m!481545 () Bool)

(assert (=> b!500408 m!481545))

(declare-fun m!481547 () Bool)

(assert (=> b!500408 m!481547))

(assert (=> b!500408 m!481543))

(declare-fun m!481549 () Bool)

(assert (=> b!500408 m!481549))

(assert (=> b!500408 m!481543))

(declare-fun m!481551 () Bool)

(assert (=> b!500408 m!481551))

(declare-fun m!481553 () Bool)

(assert (=> b!500408 m!481553))

(declare-fun m!481555 () Bool)

(assert (=> b!500408 m!481555))

(assert (=> b!500413 m!481543))

(assert (=> b!500413 m!481543))

(declare-fun m!481557 () Bool)

(assert (=> b!500413 m!481557))

(declare-fun m!481559 () Bool)

(assert (=> b!500409 m!481559))

(declare-fun m!481561 () Bool)

(assert (=> b!500403 m!481561))

(declare-fun m!481563 () Bool)

(assert (=> b!500407 m!481563))

(declare-fun m!481565 () Bool)

(assert (=> b!500411 m!481565))

(declare-fun m!481567 () Bool)

(assert (=> b!500405 m!481567))

(declare-fun m!481569 () Bool)

(assert (=> b!500406 m!481569))

(assert (=> b!500406 m!481543))

(declare-fun m!481571 () Bool)

(assert (=> b!500410 m!481571))

(assert (=> b!500414 m!481543))

(assert (=> b!500414 m!481543))

(declare-fun m!481573 () Bool)

(assert (=> b!500414 m!481573))

(declare-fun m!481575 () Bool)

(assert (=> start!45464 m!481575))

(declare-fun m!481577 () Bool)

(assert (=> start!45464 m!481577))

(declare-fun m!481579 () Bool)

(assert (=> b!500412 m!481579))

(assert (=> b!500412 m!481567))

(check-sat (not b!500410) (not b!500409) (not b!500407) (not b!500414) (not b!500403) (not b!500412) (not b!500411) (not b!500405) (not b!500413) (not start!45464) (not b!500408))
(check-sat)
