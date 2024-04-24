; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47426 () Bool)

(assert start!47426)

(declare-fun b!522063 () Bool)

(declare-fun res!319819 () Bool)

(declare-fun e!304523 () Bool)

(assert (=> b!522063 (=> (not res!319819) (not e!304523))))

(declare-datatypes ((array!33253 0))(
  ( (array!33254 (arr!15982 (Array (_ BitVec 32) (_ BitVec 64))) (size!16346 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33253)

(declare-datatypes ((List!10047 0))(
  ( (Nil!10044) (Cons!10043 (h!10965 (_ BitVec 64)) (t!16267 List!10047)) )
))
(declare-fun arrayNoDuplicates!0 (array!33253 (_ BitVec 32) List!10047) Bool)

(assert (=> b!522063 (= res!319819 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10044))))

(declare-fun b!522064 () Bool)

(declare-fun res!319818 () Bool)

(assert (=> b!522064 (=> (not res!319818) (not e!304523))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33253 (_ BitVec 32)) Bool)

(assert (=> b!522064 (= res!319818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522065 () Bool)

(declare-fun res!319825 () Bool)

(declare-fun e!304520 () Bool)

(assert (=> b!522065 (=> res!319825 e!304520)))

(declare-datatypes ((SeekEntryResult!4405 0))(
  ( (MissingZero!4405 (index!19823 (_ BitVec 32))) (Found!4405 (index!19824 (_ BitVec 32))) (Intermediate!4405 (undefined!5217 Bool) (index!19825 (_ BitVec 32)) (x!48948 (_ BitVec 32))) (Undefined!4405) (MissingVacant!4405 (index!19826 (_ BitVec 32))) )
))
(declare-fun lt!239417 () SeekEntryResult!4405)

(get-info :version)

(assert (=> b!522065 (= res!319825 (or (undefined!5217 lt!239417) (not ((_ is Intermediate!4405) lt!239417))))))

(declare-fun b!522066 () Bool)

(assert (=> b!522066 (= e!304520 true)))

(assert (=> b!522066 (and (or (= (select (arr!15982 a!3235) (index!19825 lt!239417)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15982 a!3235) (index!19825 lt!239417)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15982 a!3235) (index!19825 lt!239417)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15982 a!3235) (index!19825 lt!239417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16231 0))(
  ( (Unit!16232) )
))
(declare-fun lt!239414 () Unit!16231)

(declare-fun e!304524 () Unit!16231)

(assert (=> b!522066 (= lt!239414 e!304524)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61424 () Bool)

(assert (=> b!522066 (= c!61424 (= (select (arr!15982 a!3235) (index!19825 lt!239417)) (select (arr!15982 a!3235) j!176)))))

(assert (=> b!522066 (and (bvslt (x!48948 lt!239417) #b01111111111111111111111111111110) (or (= (select (arr!15982 a!3235) (index!19825 lt!239417)) (select (arr!15982 a!3235) j!176)) (= (select (arr!15982 a!3235) (index!19825 lt!239417)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15982 a!3235) (index!19825 lt!239417)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522067 () Bool)

(declare-fun Unit!16233 () Unit!16231)

(assert (=> b!522067 (= e!304524 Unit!16233)))

(declare-fun b!522068 () Bool)

(declare-fun e!304522 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33253 (_ BitVec 32)) SeekEntryResult!4405)

(assert (=> b!522068 (= e!304522 (= (seekEntryOrOpen!0 (select (arr!15982 a!3235) j!176) a!3235 mask!3524) (Found!4405 j!176)))))

(declare-fun b!522069 () Bool)

(declare-fun e!304519 () Bool)

(assert (=> b!522069 (= e!304519 e!304523)))

(declare-fun res!319823 () Bool)

(assert (=> b!522069 (=> (not res!319823) (not e!304523))))

(declare-fun lt!239412 () SeekEntryResult!4405)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522069 (= res!319823 (or (= lt!239412 (MissingZero!4405 i!1204)) (= lt!239412 (MissingVacant!4405 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!522069 (= lt!239412 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522071 () Bool)

(declare-fun e!304518 () Bool)

(assert (=> b!522071 (= e!304518 false)))

(declare-fun b!522072 () Bool)

(declare-fun res!319827 () Bool)

(assert (=> b!522072 (=> (not res!319827) (not e!304519))))

(declare-fun arrayContainsKey!0 (array!33253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522072 (= res!319827 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522073 () Bool)

(declare-fun Unit!16234 () Unit!16231)

(assert (=> b!522073 (= e!304524 Unit!16234)))

(declare-fun lt!239415 () Unit!16231)

(declare-fun lt!239416 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16231)

(assert (=> b!522073 (= lt!239415 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239416 #b00000000000000000000000000000000 (index!19825 lt!239417) (x!48948 lt!239417) mask!3524))))

(declare-fun lt!239413 () (_ BitVec 64))

(declare-fun res!319822 () Bool)

(declare-fun lt!239419 () array!33253)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33253 (_ BitVec 32)) SeekEntryResult!4405)

(assert (=> b!522073 (= res!319822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239416 lt!239413 lt!239419 mask!3524) (Intermediate!4405 false (index!19825 lt!239417) (x!48948 lt!239417))))))

(assert (=> b!522073 (=> (not res!319822) (not e!304518))))

(assert (=> b!522073 e!304518))

(declare-fun b!522074 () Bool)

(assert (=> b!522074 (= e!304523 (not e!304520))))

(declare-fun res!319824 () Bool)

(assert (=> b!522074 (=> res!319824 e!304520)))

(declare-fun lt!239411 () (_ BitVec 32))

(assert (=> b!522074 (= res!319824 (= lt!239417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239411 lt!239413 lt!239419 mask!3524)))))

(assert (=> b!522074 (= lt!239417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239416 (select (arr!15982 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522074 (= lt!239411 (toIndex!0 lt!239413 mask!3524))))

(assert (=> b!522074 (= lt!239413 (select (store (arr!15982 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522074 (= lt!239416 (toIndex!0 (select (arr!15982 a!3235) j!176) mask!3524))))

(assert (=> b!522074 (= lt!239419 (array!33254 (store (arr!15982 a!3235) i!1204 k0!2280) (size!16346 a!3235)))))

(assert (=> b!522074 e!304522))

(declare-fun res!319820 () Bool)

(assert (=> b!522074 (=> (not res!319820) (not e!304522))))

(assert (=> b!522074 (= res!319820 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239418 () Unit!16231)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16231)

(assert (=> b!522074 (= lt!239418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522070 () Bool)

(declare-fun res!319828 () Bool)

(assert (=> b!522070 (=> (not res!319828) (not e!304519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522070 (= res!319828 (validKeyInArray!0 (select (arr!15982 a!3235) j!176)))))

(declare-fun res!319821 () Bool)

(assert (=> start!47426 (=> (not res!319821) (not e!304519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47426 (= res!319821 (validMask!0 mask!3524))))

(assert (=> start!47426 e!304519))

(assert (=> start!47426 true))

(declare-fun array_inv!11841 (array!33253) Bool)

(assert (=> start!47426 (array_inv!11841 a!3235)))

(declare-fun b!522075 () Bool)

(declare-fun res!319826 () Bool)

(assert (=> b!522075 (=> (not res!319826) (not e!304519))))

(assert (=> b!522075 (= res!319826 (validKeyInArray!0 k0!2280))))

(declare-fun b!522076 () Bool)

(declare-fun res!319817 () Bool)

(assert (=> b!522076 (=> (not res!319817) (not e!304519))))

(assert (=> b!522076 (= res!319817 (and (= (size!16346 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16346 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16346 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47426 res!319821) b!522076))

(assert (= (and b!522076 res!319817) b!522070))

(assert (= (and b!522070 res!319828) b!522075))

(assert (= (and b!522075 res!319826) b!522072))

(assert (= (and b!522072 res!319827) b!522069))

(assert (= (and b!522069 res!319823) b!522064))

(assert (= (and b!522064 res!319818) b!522063))

(assert (= (and b!522063 res!319819) b!522074))

(assert (= (and b!522074 res!319820) b!522068))

(assert (= (and b!522074 (not res!319824)) b!522065))

(assert (= (and b!522065 (not res!319825)) b!522066))

(assert (= (and b!522066 c!61424) b!522073))

(assert (= (and b!522066 (not c!61424)) b!522067))

(assert (= (and b!522073 res!319822) b!522071))

(declare-fun m!503221 () Bool)

(assert (=> b!522066 m!503221))

(declare-fun m!503223 () Bool)

(assert (=> b!522066 m!503223))

(declare-fun m!503225 () Bool)

(assert (=> b!522074 m!503225))

(declare-fun m!503227 () Bool)

(assert (=> b!522074 m!503227))

(declare-fun m!503229 () Bool)

(assert (=> b!522074 m!503229))

(declare-fun m!503231 () Bool)

(assert (=> b!522074 m!503231))

(assert (=> b!522074 m!503223))

(declare-fun m!503233 () Bool)

(assert (=> b!522074 m!503233))

(assert (=> b!522074 m!503223))

(declare-fun m!503235 () Bool)

(assert (=> b!522074 m!503235))

(declare-fun m!503237 () Bool)

(assert (=> b!522074 m!503237))

(assert (=> b!522074 m!503223))

(declare-fun m!503239 () Bool)

(assert (=> b!522074 m!503239))

(declare-fun m!503241 () Bool)

(assert (=> b!522063 m!503241))

(declare-fun m!503243 () Bool)

(assert (=> b!522072 m!503243))

(declare-fun m!503245 () Bool)

(assert (=> b!522075 m!503245))

(declare-fun m!503247 () Bool)

(assert (=> b!522064 m!503247))

(assert (=> b!522070 m!503223))

(assert (=> b!522070 m!503223))

(declare-fun m!503249 () Bool)

(assert (=> b!522070 m!503249))

(assert (=> b!522068 m!503223))

(assert (=> b!522068 m!503223))

(declare-fun m!503251 () Bool)

(assert (=> b!522068 m!503251))

(declare-fun m!503253 () Bool)

(assert (=> start!47426 m!503253))

(declare-fun m!503255 () Bool)

(assert (=> start!47426 m!503255))

(declare-fun m!503257 () Bool)

(assert (=> b!522069 m!503257))

(declare-fun m!503259 () Bool)

(assert (=> b!522073 m!503259))

(declare-fun m!503261 () Bool)

(assert (=> b!522073 m!503261))

(check-sat (not b!522075) (not b!522070) (not b!522073) (not b!522072) (not b!522063) (not start!47426) (not b!522064) (not b!522069) (not b!522074) (not b!522068))
(check-sat)
