; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45364 () Bool)

(assert start!45364)

(declare-fun b!498153 () Bool)

(declare-datatypes ((Unit!14848 0))(
  ( (Unit!14849) )
))
(declare-fun e!291985 () Unit!14848)

(declare-fun Unit!14850 () Unit!14848)

(assert (=> b!498153 (= e!291985 Unit!14850)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225589 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3943 0))(
  ( (MissingZero!3943 (index!17954 (_ BitVec 32))) (Found!3943 (index!17955 (_ BitVec 32))) (Intermediate!3943 (undefined!4755 Bool) (index!17956 (_ BitVec 32)) (x!47004 (_ BitVec 32))) (Undefined!3943) (MissingVacant!3943 (index!17957 (_ BitVec 32))) )
))
(declare-fun lt!225591 () SeekEntryResult!3943)

(declare-fun lt!225590 () Unit!14848)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32189 0))(
  ( (array!32190 (arr!15476 (Array (_ BitVec 32) (_ BitVec 64))) (size!15840 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32189)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32189 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14848)

(assert (=> b!498153 (= lt!225590 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225589 #b00000000000000000000000000000000 (index!17956 lt!225591) (x!47004 lt!225591) mask!3524))))

(declare-fun lt!225595 () array!32189)

(declare-fun lt!225592 () (_ BitVec 64))

(declare-fun res!300298 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32189 (_ BitVec 32)) SeekEntryResult!3943)

(assert (=> b!498153 (= res!300298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225589 lt!225592 lt!225595 mask!3524) (Intermediate!3943 false (index!17956 lt!225591) (x!47004 lt!225591))))))

(declare-fun e!291990 () Bool)

(assert (=> b!498153 (=> (not res!300298) (not e!291990))))

(assert (=> b!498153 e!291990))

(declare-fun b!498155 () Bool)

(declare-fun Unit!14851 () Unit!14848)

(assert (=> b!498155 (= e!291985 Unit!14851)))

(declare-fun b!498156 () Bool)

(declare-fun e!291988 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32189 (_ BitVec 32)) SeekEntryResult!3943)

(assert (=> b!498156 (= e!291988 (= (seekEntryOrOpen!0 (select (arr!15476 a!3235) j!176) a!3235 mask!3524) (Found!3943 j!176)))))

(declare-fun b!498157 () Bool)

(declare-fun e!291987 () Bool)

(declare-fun e!291984 () Bool)

(assert (=> b!498157 (= e!291987 e!291984)))

(declare-fun res!300294 () Bool)

(assert (=> b!498157 (=> (not res!300294) (not e!291984))))

(declare-fun lt!225597 () SeekEntryResult!3943)

(assert (=> b!498157 (= res!300294 (or (= lt!225597 (MissingZero!3943 i!1204)) (= lt!225597 (MissingVacant!3943 i!1204))))))

(assert (=> b!498157 (= lt!225597 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498158 () Bool)

(assert (=> b!498158 (= e!291990 false)))

(declare-fun b!498159 () Bool)

(declare-fun res!300297 () Bool)

(assert (=> b!498159 (=> (not res!300297) (not e!291987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498159 (= res!300297 (validKeyInArray!0 (select (arr!15476 a!3235) j!176)))))

(declare-fun b!498160 () Bool)

(declare-fun res!300290 () Bool)

(assert (=> b!498160 (=> (not res!300290) (not e!291987))))

(assert (=> b!498160 (= res!300290 (validKeyInArray!0 k!2280))))

(declare-fun b!498161 () Bool)

(declare-fun e!291989 () Bool)

(assert (=> b!498161 (= e!291984 (not e!291989))))

(declare-fun res!300299 () Bool)

(assert (=> b!498161 (=> res!300299 e!291989)))

(declare-fun lt!225594 () (_ BitVec 32))

(assert (=> b!498161 (= res!300299 (= lt!225591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225594 lt!225592 lt!225595 mask!3524)))))

(assert (=> b!498161 (= lt!225591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225589 (select (arr!15476 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498161 (= lt!225594 (toIndex!0 lt!225592 mask!3524))))

(assert (=> b!498161 (= lt!225592 (select (store (arr!15476 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498161 (= lt!225589 (toIndex!0 (select (arr!15476 a!3235) j!176) mask!3524))))

(assert (=> b!498161 (= lt!225595 (array!32190 (store (arr!15476 a!3235) i!1204 k!2280) (size!15840 a!3235)))))

(assert (=> b!498161 e!291988))

(declare-fun res!300295 () Bool)

(assert (=> b!498161 (=> (not res!300295) (not e!291988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32189 (_ BitVec 32)) Bool)

(assert (=> b!498161 (= res!300295 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225593 () Unit!14848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14848)

(assert (=> b!498161 (= lt!225593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498162 () Bool)

(declare-fun res!300288 () Bool)

(assert (=> b!498162 (=> (not res!300288) (not e!291984))))

(declare-datatypes ((List!9634 0))(
  ( (Nil!9631) (Cons!9630 (h!10504 (_ BitVec 64)) (t!15862 List!9634)) )
))
(declare-fun arrayNoDuplicates!0 (array!32189 (_ BitVec 32) List!9634) Bool)

(assert (=> b!498162 (= res!300288 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9631))))

(declare-fun b!498163 () Bool)

(declare-fun res!300291 () Bool)

(assert (=> b!498163 (=> (not res!300291) (not e!291984))))

(assert (=> b!498163 (= res!300291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!300292 () Bool)

(assert (=> start!45364 (=> (not res!300292) (not e!291987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45364 (= res!300292 (validMask!0 mask!3524))))

(assert (=> start!45364 e!291987))

(assert (=> start!45364 true))

(declare-fun array_inv!11272 (array!32189) Bool)

(assert (=> start!45364 (array_inv!11272 a!3235)))

(declare-fun b!498154 () Bool)

(declare-fun res!300293 () Bool)

(assert (=> b!498154 (=> res!300293 e!291989)))

(assert (=> b!498154 (= res!300293 (or (undefined!4755 lt!225591) (not (is-Intermediate!3943 lt!225591))))))

(declare-fun b!498164 () Bool)

(declare-fun res!300296 () Bool)

(assert (=> b!498164 (=> (not res!300296) (not e!291987))))

(declare-fun arrayContainsKey!0 (array!32189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498164 (= res!300296 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498165 () Bool)

(declare-fun e!291986 () Bool)

(assert (=> b!498165 (= e!291989 e!291986)))

(declare-fun res!300289 () Bool)

(assert (=> b!498165 (=> res!300289 e!291986)))

(assert (=> b!498165 (= res!300289 (or (bvsgt #b00000000000000000000000000000000 (x!47004 lt!225591)) (bvsgt (x!47004 lt!225591) #b01111111111111111111111111111110) (bvslt lt!225589 #b00000000000000000000000000000000) (bvsge lt!225589 (size!15840 a!3235)) (bvslt (index!17956 lt!225591) #b00000000000000000000000000000000) (bvsge (index!17956 lt!225591) (size!15840 a!3235)) (not (= lt!225591 (Intermediate!3943 false (index!17956 lt!225591) (x!47004 lt!225591))))))))

(assert (=> b!498165 (and (or (= (select (arr!15476 a!3235) (index!17956 lt!225591)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15476 a!3235) (index!17956 lt!225591)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15476 a!3235) (index!17956 lt!225591)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15476 a!3235) (index!17956 lt!225591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225596 () Unit!14848)

(assert (=> b!498165 (= lt!225596 e!291985)))

(declare-fun c!59210 () Bool)

(assert (=> b!498165 (= c!59210 (= (select (arr!15476 a!3235) (index!17956 lt!225591)) (select (arr!15476 a!3235) j!176)))))

(assert (=> b!498165 (and (bvslt (x!47004 lt!225591) #b01111111111111111111111111111110) (or (= (select (arr!15476 a!3235) (index!17956 lt!225591)) (select (arr!15476 a!3235) j!176)) (= (select (arr!15476 a!3235) (index!17956 lt!225591)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15476 a!3235) (index!17956 lt!225591)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498166 () Bool)

(assert (=> b!498166 (= e!291986 true)))

(declare-fun lt!225598 () SeekEntryResult!3943)

(assert (=> b!498166 (= lt!225598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225589 lt!225592 lt!225595 mask!3524))))

(declare-fun b!498167 () Bool)

(declare-fun res!300287 () Bool)

(assert (=> b!498167 (=> (not res!300287) (not e!291987))))

(assert (=> b!498167 (= res!300287 (and (= (size!15840 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15840 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15840 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45364 res!300292) b!498167))

(assert (= (and b!498167 res!300287) b!498159))

(assert (= (and b!498159 res!300297) b!498160))

(assert (= (and b!498160 res!300290) b!498164))

(assert (= (and b!498164 res!300296) b!498157))

(assert (= (and b!498157 res!300294) b!498163))

(assert (= (and b!498163 res!300291) b!498162))

(assert (= (and b!498162 res!300288) b!498161))

(assert (= (and b!498161 res!300295) b!498156))

(assert (= (and b!498161 (not res!300299)) b!498154))

(assert (= (and b!498154 (not res!300293)) b!498165))

(assert (= (and b!498165 c!59210) b!498153))

(assert (= (and b!498165 (not c!59210)) b!498155))

(assert (= (and b!498153 res!300298) b!498158))

(assert (= (and b!498165 (not res!300289)) b!498166))

(declare-fun m!479439 () Bool)

(assert (=> b!498156 m!479439))

(assert (=> b!498156 m!479439))

(declare-fun m!479441 () Bool)

(assert (=> b!498156 m!479441))

(declare-fun m!479443 () Bool)

(assert (=> b!498165 m!479443))

(assert (=> b!498165 m!479439))

(declare-fun m!479445 () Bool)

(assert (=> b!498163 m!479445))

(declare-fun m!479447 () Bool)

(assert (=> b!498162 m!479447))

(declare-fun m!479449 () Bool)

(assert (=> start!45364 m!479449))

(declare-fun m!479451 () Bool)

(assert (=> start!45364 m!479451))

(declare-fun m!479453 () Bool)

(assert (=> b!498157 m!479453))

(declare-fun m!479455 () Bool)

(assert (=> b!498153 m!479455))

(declare-fun m!479457 () Bool)

(assert (=> b!498153 m!479457))

(declare-fun m!479459 () Bool)

(assert (=> b!498161 m!479459))

(declare-fun m!479461 () Bool)

(assert (=> b!498161 m!479461))

(declare-fun m!479463 () Bool)

(assert (=> b!498161 m!479463))

(declare-fun m!479465 () Bool)

(assert (=> b!498161 m!479465))

(assert (=> b!498161 m!479439))

(declare-fun m!479467 () Bool)

(assert (=> b!498161 m!479467))

(assert (=> b!498161 m!479439))

(declare-fun m!479469 () Bool)

(assert (=> b!498161 m!479469))

(assert (=> b!498161 m!479439))

(declare-fun m!479471 () Bool)

(assert (=> b!498161 m!479471))

(declare-fun m!479473 () Bool)

(assert (=> b!498161 m!479473))

(declare-fun m!479475 () Bool)

(assert (=> b!498164 m!479475))

(assert (=> b!498159 m!479439))

(assert (=> b!498159 m!479439))

(declare-fun m!479477 () Bool)

(assert (=> b!498159 m!479477))

(assert (=> b!498166 m!479457))

(declare-fun m!479479 () Bool)

(assert (=> b!498160 m!479479))

(push 1)

