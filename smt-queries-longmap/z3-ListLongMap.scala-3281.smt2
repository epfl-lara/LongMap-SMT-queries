; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45618 () Bool)

(assert start!45618)

(declare-fun b!502722 () Bool)

(declare-fun e!294412 () Bool)

(declare-fun e!294413 () Bool)

(assert (=> b!502722 (= e!294412 (not e!294413))))

(declare-fun res!304220 () Bool)

(assert (=> b!502722 (=> res!304220 e!294413)))

(declare-fun lt!228503 () (_ BitVec 64))

(declare-datatypes ((array!32384 0))(
  ( (array!32385 (arr!15572 (Array (_ BitVec 32) (_ BitVec 64))) (size!15937 (_ BitVec 32))) )
))
(declare-fun lt!228504 () array!32384)

(declare-fun lt!228501 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4036 0))(
  ( (MissingZero!4036 (index!18332 (_ BitVec 32))) (Found!4036 (index!18333 (_ BitVec 32))) (Intermediate!4036 (undefined!4848 Bool) (index!18334 (_ BitVec 32)) (x!47368 (_ BitVec 32))) (Undefined!4036) (MissingVacant!4036 (index!18335 (_ BitVec 32))) )
))
(declare-fun lt!228502 () SeekEntryResult!4036)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32384 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!502722 (= res!304220 (= lt!228502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228501 lt!228503 lt!228504 mask!3524)))))

(declare-fun lt!228506 () (_ BitVec 32))

(declare-fun a!3235 () array!32384)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502722 (= lt!228502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228506 (select (arr!15572 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502722 (= lt!228501 (toIndex!0 lt!228503 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502722 (= lt!228503 (select (store (arr!15572 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502722 (= lt!228506 (toIndex!0 (select (arr!15572 a!3235) j!176) mask!3524))))

(assert (=> b!502722 (= lt!228504 (array!32385 (store (arr!15572 a!3235) i!1204 k0!2280) (size!15937 a!3235)))))

(declare-fun e!294418 () Bool)

(assert (=> b!502722 e!294418))

(declare-fun res!304223 () Bool)

(assert (=> b!502722 (=> (not res!304223) (not e!294418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32384 (_ BitVec 32)) Bool)

(assert (=> b!502722 (= res!304223 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15214 0))(
  ( (Unit!15215) )
))
(declare-fun lt!228505 () Unit!15214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15214)

(assert (=> b!502722 (= lt!228505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502723 () Bool)

(declare-fun res!304224 () Bool)

(declare-fun e!294417 () Bool)

(assert (=> b!502723 (=> res!304224 e!294417)))

(declare-fun e!294420 () Bool)

(assert (=> b!502723 (= res!304224 e!294420)))

(declare-fun res!304216 () Bool)

(assert (=> b!502723 (=> (not res!304216) (not e!294420))))

(assert (=> b!502723 (= res!304216 (bvsgt #b00000000000000000000000000000000 (x!47368 lt!228502)))))

(declare-fun b!502724 () Bool)

(declare-fun e!294415 () Bool)

(assert (=> b!502724 (= e!294415 e!294412)))

(declare-fun res!304215 () Bool)

(assert (=> b!502724 (=> (not res!304215) (not e!294412))))

(declare-fun lt!228510 () SeekEntryResult!4036)

(assert (=> b!502724 (= res!304215 (or (= lt!228510 (MissingZero!4036 i!1204)) (= lt!228510 (MissingVacant!4036 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32384 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!502724 (= lt!228510 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502725 () Bool)

(declare-fun res!304218 () Bool)

(assert (=> b!502725 (=> (not res!304218) (not e!294415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502725 (= res!304218 (validKeyInArray!0 k0!2280))))

(declare-fun b!502726 () Bool)

(declare-fun res!304228 () Bool)

(assert (=> b!502726 (=> (not res!304228) (not e!294415))))

(declare-fun arrayContainsKey!0 (array!32384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502726 (= res!304228 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502727 () Bool)

(declare-fun res!304226 () Bool)

(assert (=> b!502727 (=> (not res!304226) (not e!294412))))

(assert (=> b!502727 (= res!304226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502728 () Bool)

(assert (=> b!502728 (= e!294417 true)))

(declare-fun lt!228509 () SeekEntryResult!4036)

(assert (=> b!502728 (= lt!228509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228506 lt!228503 lt!228504 mask!3524))))

(declare-fun b!502729 () Bool)

(assert (=> b!502729 (= e!294413 e!294417)))

(declare-fun res!304217 () Bool)

(assert (=> b!502729 (=> res!304217 e!294417)))

(assert (=> b!502729 (= res!304217 (or (bvsgt (x!47368 lt!228502) #b01111111111111111111111111111110) (bvslt lt!228506 #b00000000000000000000000000000000) (bvsge lt!228506 (size!15937 a!3235)) (bvslt (index!18334 lt!228502) #b00000000000000000000000000000000) (bvsge (index!18334 lt!228502) (size!15937 a!3235)) (not (= lt!228502 (Intermediate!4036 false (index!18334 lt!228502) (x!47368 lt!228502))))))))

(assert (=> b!502729 (= (index!18334 lt!228502) i!1204)))

(declare-fun lt!228511 () Unit!15214)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32384 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15214)

(assert (=> b!502729 (= lt!228511 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228506 #b00000000000000000000000000000000 (index!18334 lt!228502) (x!47368 lt!228502) mask!3524))))

(assert (=> b!502729 (and (or (= (select (arr!15572 a!3235) (index!18334 lt!228502)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15572 a!3235) (index!18334 lt!228502)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15572 a!3235) (index!18334 lt!228502)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15572 a!3235) (index!18334 lt!228502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228508 () Unit!15214)

(declare-fun e!294419 () Unit!15214)

(assert (=> b!502729 (= lt!228508 e!294419)))

(declare-fun c!59532 () Bool)

(assert (=> b!502729 (= c!59532 (= (select (arr!15572 a!3235) (index!18334 lt!228502)) (select (arr!15572 a!3235) j!176)))))

(assert (=> b!502729 (and (bvslt (x!47368 lt!228502) #b01111111111111111111111111111110) (or (= (select (arr!15572 a!3235) (index!18334 lt!228502)) (select (arr!15572 a!3235) j!176)) (= (select (arr!15572 a!3235) (index!18334 lt!228502)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15572 a!3235) (index!18334 lt!228502)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502730 () Bool)

(declare-fun res!304229 () Bool)

(assert (=> b!502730 (=> (not res!304229) (not e!294412))))

(declare-datatypes ((List!9769 0))(
  ( (Nil!9766) (Cons!9765 (h!10642 (_ BitVec 64)) (t!15988 List!9769)) )
))
(declare-fun arrayNoDuplicates!0 (array!32384 (_ BitVec 32) List!9769) Bool)

(assert (=> b!502730 (= res!304229 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9766))))

(declare-fun b!502731 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32384 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!502731 (= e!294420 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228506 (index!18334 lt!228502) (select (arr!15572 a!3235) j!176) a!3235 mask!3524) (Found!4036 j!176))))))

(declare-fun b!502732 () Bool)

(declare-fun res!304221 () Bool)

(assert (=> b!502732 (=> res!304221 e!294413)))

(get-info :version)

(assert (=> b!502732 (= res!304221 (or (undefined!4848 lt!228502) (not ((_ is Intermediate!4036) lt!228502))))))

(declare-fun b!502734 () Bool)

(declare-fun e!294414 () Bool)

(assert (=> b!502734 (= e!294414 false)))

(declare-fun b!502735 () Bool)

(declare-fun Unit!15216 () Unit!15214)

(assert (=> b!502735 (= e!294419 Unit!15216)))

(declare-fun b!502736 () Bool)

(assert (=> b!502736 (= e!294418 (= (seekEntryOrOpen!0 (select (arr!15572 a!3235) j!176) a!3235 mask!3524) (Found!4036 j!176)))))

(declare-fun b!502737 () Bool)

(declare-fun res!304222 () Bool)

(assert (=> b!502737 (=> (not res!304222) (not e!294415))))

(assert (=> b!502737 (= res!304222 (validKeyInArray!0 (select (arr!15572 a!3235) j!176)))))

(declare-fun b!502738 () Bool)

(declare-fun res!304225 () Bool)

(assert (=> b!502738 (=> (not res!304225) (not e!294415))))

(assert (=> b!502738 (= res!304225 (and (= (size!15937 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15937 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15937 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502733 () Bool)

(declare-fun Unit!15217 () Unit!15214)

(assert (=> b!502733 (= e!294419 Unit!15217)))

(declare-fun lt!228507 () Unit!15214)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32384 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15214)

(assert (=> b!502733 (= lt!228507 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228506 #b00000000000000000000000000000000 (index!18334 lt!228502) (x!47368 lt!228502) mask!3524))))

(declare-fun res!304227 () Bool)

(assert (=> b!502733 (= res!304227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228506 lt!228503 lt!228504 mask!3524) (Intermediate!4036 false (index!18334 lt!228502) (x!47368 lt!228502))))))

(assert (=> b!502733 (=> (not res!304227) (not e!294414))))

(assert (=> b!502733 e!294414))

(declare-fun res!304219 () Bool)

(assert (=> start!45618 (=> (not res!304219) (not e!294415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45618 (= res!304219 (validMask!0 mask!3524))))

(assert (=> start!45618 e!294415))

(assert (=> start!45618 true))

(declare-fun array_inv!11455 (array!32384) Bool)

(assert (=> start!45618 (array_inv!11455 a!3235)))

(assert (= (and start!45618 res!304219) b!502738))

(assert (= (and b!502738 res!304225) b!502737))

(assert (= (and b!502737 res!304222) b!502725))

(assert (= (and b!502725 res!304218) b!502726))

(assert (= (and b!502726 res!304228) b!502724))

(assert (= (and b!502724 res!304215) b!502727))

(assert (= (and b!502727 res!304226) b!502730))

(assert (= (and b!502730 res!304229) b!502722))

(assert (= (and b!502722 res!304223) b!502736))

(assert (= (and b!502722 (not res!304220)) b!502732))

(assert (= (and b!502732 (not res!304221)) b!502729))

(assert (= (and b!502729 c!59532) b!502733))

(assert (= (and b!502729 (not c!59532)) b!502735))

(assert (= (and b!502733 res!304227) b!502734))

(assert (= (and b!502729 (not res!304217)) b!502723))

(assert (= (and b!502723 res!304216) b!502731))

(assert (= (and b!502723 (not res!304224)) b!502728))

(declare-fun m!483121 () Bool)

(assert (=> b!502728 m!483121))

(declare-fun m!483123 () Bool)

(assert (=> b!502724 m!483123))

(declare-fun m!483125 () Bool)

(assert (=> b!502730 m!483125))

(declare-fun m!483127 () Bool)

(assert (=> b!502722 m!483127))

(declare-fun m!483129 () Bool)

(assert (=> b!502722 m!483129))

(declare-fun m!483131 () Bool)

(assert (=> b!502722 m!483131))

(declare-fun m!483133 () Bool)

(assert (=> b!502722 m!483133))

(declare-fun m!483135 () Bool)

(assert (=> b!502722 m!483135))

(declare-fun m!483137 () Bool)

(assert (=> b!502722 m!483137))

(declare-fun m!483139 () Bool)

(assert (=> b!502722 m!483139))

(assert (=> b!502722 m!483135))

(declare-fun m!483141 () Bool)

(assert (=> b!502722 m!483141))

(assert (=> b!502722 m!483135))

(declare-fun m!483143 () Bool)

(assert (=> b!502722 m!483143))

(declare-fun m!483145 () Bool)

(assert (=> b!502727 m!483145))

(declare-fun m!483147 () Bool)

(assert (=> start!45618 m!483147))

(declare-fun m!483149 () Bool)

(assert (=> start!45618 m!483149))

(declare-fun m!483151 () Bool)

(assert (=> b!502733 m!483151))

(assert (=> b!502733 m!483121))

(assert (=> b!502731 m!483135))

(assert (=> b!502731 m!483135))

(declare-fun m!483153 () Bool)

(assert (=> b!502731 m!483153))

(declare-fun m!483155 () Bool)

(assert (=> b!502725 m!483155))

(assert (=> b!502736 m!483135))

(assert (=> b!502736 m!483135))

(declare-fun m!483157 () Bool)

(assert (=> b!502736 m!483157))

(declare-fun m!483159 () Bool)

(assert (=> b!502726 m!483159))

(assert (=> b!502737 m!483135))

(assert (=> b!502737 m!483135))

(declare-fun m!483161 () Bool)

(assert (=> b!502737 m!483161))

(declare-fun m!483163 () Bool)

(assert (=> b!502729 m!483163))

(declare-fun m!483165 () Bool)

(assert (=> b!502729 m!483165))

(assert (=> b!502729 m!483135))

(check-sat (not b!502725) (not b!502736) (not b!502731) (not b!502727) (not b!502737) (not b!502726) (not b!502730) (not b!502733) (not b!502729) (not start!45618) (not b!502722) (not b!502728) (not b!502724))
(check-sat)
