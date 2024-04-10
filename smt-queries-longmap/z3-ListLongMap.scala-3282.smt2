; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45638 () Bool)

(assert start!45638)

(declare-fun b!503197 () Bool)

(declare-fun res!304535 () Bool)

(declare-fun e!294700 () Bool)

(assert (=> b!503197 (=> (not res!304535) (not e!294700))))

(declare-datatypes ((array!32394 0))(
  ( (array!32395 (arr!15577 (Array (_ BitVec 32) (_ BitVec 64))) (size!15941 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32394)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503197 (= res!304535 (validKeyInArray!0 (select (arr!15577 a!3235) j!176)))))

(declare-fun b!503198 () Bool)

(declare-fun res!304525 () Bool)

(declare-fun e!294697 () Bool)

(assert (=> b!503198 (=> res!304525 e!294697)))

(declare-datatypes ((SeekEntryResult!4044 0))(
  ( (MissingZero!4044 (index!18364 (_ BitVec 32))) (Found!4044 (index!18365 (_ BitVec 32))) (Intermediate!4044 (undefined!4856 Bool) (index!18366 (_ BitVec 32)) (x!47389 (_ BitVec 32))) (Undefined!4044) (MissingVacant!4044 (index!18367 (_ BitVec 32))) )
))
(declare-fun lt!228868 () SeekEntryResult!4044)

(get-info :version)

(assert (=> b!503198 (= res!304525 (or (undefined!4856 lt!228868) (not ((_ is Intermediate!4044) lt!228868))))))

(declare-fun b!503199 () Bool)

(declare-fun e!294702 () Bool)

(assert (=> b!503199 (= e!294702 (not e!294697))))

(declare-fun res!304531 () Bool)

(assert (=> b!503199 (=> res!304531 e!294697)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!228869 () (_ BitVec 32))

(declare-fun lt!228877 () (_ BitVec 64))

(declare-fun lt!228874 () array!32394)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32394 (_ BitVec 32)) SeekEntryResult!4044)

(assert (=> b!503199 (= res!304531 (= lt!228868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228869 lt!228877 lt!228874 mask!3524)))))

(declare-fun lt!228870 () (_ BitVec 32))

(assert (=> b!503199 (= lt!228868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228870 (select (arr!15577 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503199 (= lt!228869 (toIndex!0 lt!228877 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503199 (= lt!228877 (select (store (arr!15577 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503199 (= lt!228870 (toIndex!0 (select (arr!15577 a!3235) j!176) mask!3524))))

(assert (=> b!503199 (= lt!228874 (array!32395 (store (arr!15577 a!3235) i!1204 k0!2280) (size!15941 a!3235)))))

(declare-fun e!294694 () Bool)

(assert (=> b!503199 e!294694))

(declare-fun res!304529 () Bool)

(assert (=> b!503199 (=> (not res!304529) (not e!294694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32394 (_ BitVec 32)) Bool)

(assert (=> b!503199 (= res!304529 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15252 0))(
  ( (Unit!15253) )
))
(declare-fun lt!228875 () Unit!15252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15252)

(assert (=> b!503199 (= lt!228875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503200 () Bool)

(declare-fun res!304526 () Bool)

(assert (=> b!503200 (=> (not res!304526) (not e!294700))))

(assert (=> b!503200 (= res!304526 (validKeyInArray!0 k0!2280))))

(declare-fun b!503201 () Bool)

(declare-fun res!304527 () Bool)

(declare-fun e!294696 () Bool)

(assert (=> b!503201 (=> res!304527 e!294696)))

(declare-fun e!294698 () Bool)

(assert (=> b!503201 (= res!304527 e!294698)))

(declare-fun res!304534 () Bool)

(assert (=> b!503201 (=> (not res!304534) (not e!294698))))

(assert (=> b!503201 (= res!304534 (bvsgt #b00000000000000000000000000000000 (x!47389 lt!228868)))))

(declare-fun b!503202 () Bool)

(assert (=> b!503202 (= e!294700 e!294702)))

(declare-fun res!304528 () Bool)

(assert (=> b!503202 (=> (not res!304528) (not e!294702))))

(declare-fun lt!228871 () SeekEntryResult!4044)

(assert (=> b!503202 (= res!304528 (or (= lt!228871 (MissingZero!4044 i!1204)) (= lt!228871 (MissingVacant!4044 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32394 (_ BitVec 32)) SeekEntryResult!4044)

(assert (=> b!503202 (= lt!228871 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!304536 () Bool)

(assert (=> start!45638 (=> (not res!304536) (not e!294700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45638 (= res!304536 (validMask!0 mask!3524))))

(assert (=> start!45638 e!294700))

(assert (=> start!45638 true))

(declare-fun array_inv!11373 (array!32394) Bool)

(assert (=> start!45638 (array_inv!11373 a!3235)))

(declare-fun b!503203 () Bool)

(assert (=> b!503203 (= e!294696 true)))

(declare-fun lt!228873 () SeekEntryResult!4044)

(assert (=> b!503203 (= lt!228873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228870 lt!228877 lt!228874 mask!3524))))

(declare-fun b!503204 () Bool)

(declare-fun e!294701 () Unit!15252)

(declare-fun Unit!15254 () Unit!15252)

(assert (=> b!503204 (= e!294701 Unit!15254)))

(declare-fun b!503205 () Bool)

(assert (=> b!503205 (= e!294694 (= (seekEntryOrOpen!0 (select (arr!15577 a!3235) j!176) a!3235 mask!3524) (Found!4044 j!176)))))

(declare-fun b!503206 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32394 (_ BitVec 32)) SeekEntryResult!4044)

(assert (=> b!503206 (= e!294698 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228870 (index!18366 lt!228868) (select (arr!15577 a!3235) j!176) a!3235 mask!3524) (Found!4044 j!176))))))

(declare-fun b!503207 () Bool)

(declare-fun e!294699 () Bool)

(assert (=> b!503207 (= e!294699 false)))

(declare-fun b!503208 () Bool)

(declare-fun res!304532 () Bool)

(assert (=> b!503208 (=> (not res!304532) (not e!294702))))

(assert (=> b!503208 (= res!304532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503209 () Bool)

(assert (=> b!503209 (= e!294697 e!294696)))

(declare-fun res!304533 () Bool)

(assert (=> b!503209 (=> res!304533 e!294696)))

(assert (=> b!503209 (= res!304533 (or (bvsgt (x!47389 lt!228868) #b01111111111111111111111111111110) (bvslt lt!228870 #b00000000000000000000000000000000) (bvsge lt!228870 (size!15941 a!3235)) (bvslt (index!18366 lt!228868) #b00000000000000000000000000000000) (bvsge (index!18366 lt!228868) (size!15941 a!3235)) (not (= lt!228868 (Intermediate!4044 false (index!18366 lt!228868) (x!47389 lt!228868))))))))

(assert (=> b!503209 (= (index!18366 lt!228868) i!1204)))

(declare-fun lt!228867 () Unit!15252)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32394 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15252)

(assert (=> b!503209 (= lt!228867 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228870 #b00000000000000000000000000000000 (index!18366 lt!228868) (x!47389 lt!228868) mask!3524))))

(assert (=> b!503209 (and (or (= (select (arr!15577 a!3235) (index!18366 lt!228868)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15577 a!3235) (index!18366 lt!228868)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15577 a!3235) (index!18366 lt!228868)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15577 a!3235) (index!18366 lt!228868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228872 () Unit!15252)

(assert (=> b!503209 (= lt!228872 e!294701)))

(declare-fun c!59615 () Bool)

(assert (=> b!503209 (= c!59615 (= (select (arr!15577 a!3235) (index!18366 lt!228868)) (select (arr!15577 a!3235) j!176)))))

(assert (=> b!503209 (and (bvslt (x!47389 lt!228868) #b01111111111111111111111111111110) (or (= (select (arr!15577 a!3235) (index!18366 lt!228868)) (select (arr!15577 a!3235) j!176)) (= (select (arr!15577 a!3235) (index!18366 lt!228868)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15577 a!3235) (index!18366 lt!228868)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503210 () Bool)

(declare-fun res!304530 () Bool)

(assert (=> b!503210 (=> (not res!304530) (not e!294700))))

(declare-fun arrayContainsKey!0 (array!32394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503210 (= res!304530 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503211 () Bool)

(declare-fun res!304538 () Bool)

(assert (=> b!503211 (=> (not res!304538) (not e!294700))))

(assert (=> b!503211 (= res!304538 (and (= (size!15941 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15941 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15941 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503212 () Bool)

(declare-fun Unit!15255 () Unit!15252)

(assert (=> b!503212 (= e!294701 Unit!15255)))

(declare-fun lt!228876 () Unit!15252)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32394 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15252)

(assert (=> b!503212 (= lt!228876 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228870 #b00000000000000000000000000000000 (index!18366 lt!228868) (x!47389 lt!228868) mask!3524))))

(declare-fun res!304537 () Bool)

(assert (=> b!503212 (= res!304537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228870 lt!228877 lt!228874 mask!3524) (Intermediate!4044 false (index!18366 lt!228868) (x!47389 lt!228868))))))

(assert (=> b!503212 (=> (not res!304537) (not e!294699))))

(assert (=> b!503212 e!294699))

(declare-fun b!503213 () Bool)

(declare-fun res!304524 () Bool)

(assert (=> b!503213 (=> (not res!304524) (not e!294702))))

(declare-datatypes ((List!9735 0))(
  ( (Nil!9732) (Cons!9731 (h!10608 (_ BitVec 64)) (t!15963 List!9735)) )
))
(declare-fun arrayNoDuplicates!0 (array!32394 (_ BitVec 32) List!9735) Bool)

(assert (=> b!503213 (= res!304524 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9732))))

(assert (= (and start!45638 res!304536) b!503211))

(assert (= (and b!503211 res!304538) b!503197))

(assert (= (and b!503197 res!304535) b!503200))

(assert (= (and b!503200 res!304526) b!503210))

(assert (= (and b!503210 res!304530) b!503202))

(assert (= (and b!503202 res!304528) b!503208))

(assert (= (and b!503208 res!304532) b!503213))

(assert (= (and b!503213 res!304524) b!503199))

(assert (= (and b!503199 res!304529) b!503205))

(assert (= (and b!503199 (not res!304531)) b!503198))

(assert (= (and b!503198 (not res!304525)) b!503209))

(assert (= (and b!503209 c!59615) b!503212))

(assert (= (and b!503209 (not c!59615)) b!503204))

(assert (= (and b!503212 res!304537) b!503207))

(assert (= (and b!503209 (not res!304533)) b!503201))

(assert (= (and b!503201 res!304534) b!503206))

(assert (= (and b!503201 (not res!304527)) b!503203))

(declare-fun m!484057 () Bool)

(assert (=> b!503208 m!484057))

(declare-fun m!484059 () Bool)

(assert (=> b!503203 m!484059))

(declare-fun m!484061 () Bool)

(assert (=> b!503209 m!484061))

(declare-fun m!484063 () Bool)

(assert (=> b!503209 m!484063))

(declare-fun m!484065 () Bool)

(assert (=> b!503209 m!484065))

(declare-fun m!484067 () Bool)

(assert (=> b!503200 m!484067))

(declare-fun m!484069 () Bool)

(assert (=> b!503210 m!484069))

(assert (=> b!503206 m!484065))

(assert (=> b!503206 m!484065))

(declare-fun m!484071 () Bool)

(assert (=> b!503206 m!484071))

(assert (=> b!503205 m!484065))

(assert (=> b!503205 m!484065))

(declare-fun m!484073 () Bool)

(assert (=> b!503205 m!484073))

(declare-fun m!484075 () Bool)

(assert (=> start!45638 m!484075))

(declare-fun m!484077 () Bool)

(assert (=> start!45638 m!484077))

(assert (=> b!503197 m!484065))

(assert (=> b!503197 m!484065))

(declare-fun m!484079 () Bool)

(assert (=> b!503197 m!484079))

(declare-fun m!484081 () Bool)

(assert (=> b!503213 m!484081))

(declare-fun m!484083 () Bool)

(assert (=> b!503202 m!484083))

(assert (=> b!503199 m!484065))

(declare-fun m!484085 () Bool)

(assert (=> b!503199 m!484085))

(declare-fun m!484087 () Bool)

(assert (=> b!503199 m!484087))

(declare-fun m!484089 () Bool)

(assert (=> b!503199 m!484089))

(declare-fun m!484091 () Bool)

(assert (=> b!503199 m!484091))

(assert (=> b!503199 m!484065))

(declare-fun m!484093 () Bool)

(assert (=> b!503199 m!484093))

(declare-fun m!484095 () Bool)

(assert (=> b!503199 m!484095))

(declare-fun m!484097 () Bool)

(assert (=> b!503199 m!484097))

(declare-fun m!484099 () Bool)

(assert (=> b!503199 m!484099))

(assert (=> b!503199 m!484065))

(declare-fun m!484101 () Bool)

(assert (=> b!503212 m!484101))

(assert (=> b!503212 m!484059))

(check-sat (not b!503197) (not b!503212) (not b!503199) (not b!503202) (not b!503213) (not b!503206) (not b!503203) (not b!503210) (not b!503200) (not b!503208) (not b!503205) (not start!45638) (not b!503209))
(check-sat)
