; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45168 () Bool)

(assert start!45168)

(declare-fun b!495522 () Bool)

(declare-fun e!290656 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32066 0))(
  ( (array!32067 (arr!15416 (Array (_ BitVec 32) (_ BitVec 64))) (size!15781 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32066)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3880 0))(
  ( (MissingZero!3880 (index!17699 (_ BitVec 32))) (Found!3880 (index!17700 (_ BitVec 32))) (Intermediate!3880 (undefined!4692 Bool) (index!17701 (_ BitVec 32)) (x!46775 (_ BitVec 32))) (Undefined!3880) (MissingVacant!3880 (index!17702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32066 (_ BitVec 32)) SeekEntryResult!3880)

(assert (=> b!495522 (= e!290656 (= (seekEntryOrOpen!0 (select (arr!15416 a!3235) j!176) a!3235 mask!3524) (Found!3880 j!176)))))

(declare-fun b!495523 () Bool)

(declare-fun e!290654 () Bool)

(declare-fun e!290655 () Bool)

(assert (=> b!495523 (= e!290654 e!290655)))

(declare-fun res!298061 () Bool)

(assert (=> b!495523 (=> (not res!298061) (not e!290655))))

(declare-fun lt!224217 () SeekEntryResult!3880)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495523 (= res!298061 (or (= lt!224217 (MissingZero!3880 i!1204)) (= lt!224217 (MissingVacant!3880 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!495523 (= lt!224217 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495524 () Bool)

(declare-fun res!298052 () Bool)

(declare-fun e!290658 () Bool)

(assert (=> b!495524 (=> res!298052 e!290658)))

(declare-fun lt!224218 () SeekEntryResult!3880)

(get-info :version)

(assert (=> b!495524 (= res!298052 (or (undefined!4692 lt!224218) (not ((_ is Intermediate!3880) lt!224218))))))

(declare-fun res!298060 () Bool)

(assert (=> start!45168 (=> (not res!298060) (not e!290654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45168 (= res!298060 (validMask!0 mask!3524))))

(assert (=> start!45168 e!290654))

(assert (=> start!45168 true))

(declare-fun array_inv!11299 (array!32066) Bool)

(assert (=> start!45168 (array_inv!11299 a!3235)))

(declare-fun b!495525 () Bool)

(declare-fun res!298057 () Bool)

(assert (=> b!495525 (=> (not res!298057) (not e!290655))))

(declare-datatypes ((List!9613 0))(
  ( (Nil!9610) (Cons!9609 (h!10480 (_ BitVec 64)) (t!15832 List!9613)) )
))
(declare-fun arrayNoDuplicates!0 (array!32066 (_ BitVec 32) List!9613) Bool)

(assert (=> b!495525 (= res!298057 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9610))))

(declare-fun b!495526 () Bool)

(assert (=> b!495526 (= e!290655 (not e!290658))))

(declare-fun res!298059 () Bool)

(assert (=> b!495526 (=> res!298059 e!290658)))

(declare-fun lt!224214 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32066 (_ BitVec 32)) SeekEntryResult!3880)

(assert (=> b!495526 (= res!298059 (= lt!224218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224214 (select (store (arr!15416 a!3235) i!1204 k0!2280) j!176) (array!32067 (store (arr!15416 a!3235) i!1204 k0!2280) (size!15781 a!3235)) mask!3524)))))

(declare-fun lt!224216 () (_ BitVec 32))

(assert (=> b!495526 (= lt!224218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224216 (select (arr!15416 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495526 (= lt!224214 (toIndex!0 (select (store (arr!15416 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495526 (= lt!224216 (toIndex!0 (select (arr!15416 a!3235) j!176) mask!3524))))

(assert (=> b!495526 e!290656))

(declare-fun res!298051 () Bool)

(assert (=> b!495526 (=> (not res!298051) (not e!290656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32066 (_ BitVec 32)) Bool)

(assert (=> b!495526 (= res!298051 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14692 0))(
  ( (Unit!14693) )
))
(declare-fun lt!224215 () Unit!14692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14692)

(assert (=> b!495526 (= lt!224215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495527 () Bool)

(declare-fun res!298053 () Bool)

(assert (=> b!495527 (=> (not res!298053) (not e!290654))))

(declare-fun arrayContainsKey!0 (array!32066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495527 (= res!298053 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495528 () Bool)

(declare-fun res!298055 () Bool)

(assert (=> b!495528 (=> (not res!298055) (not e!290654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495528 (= res!298055 (validKeyInArray!0 (select (arr!15416 a!3235) j!176)))))

(declare-fun b!495529 () Bool)

(declare-fun res!298054 () Bool)

(assert (=> b!495529 (=> (not res!298054) (not e!290654))))

(assert (=> b!495529 (= res!298054 (and (= (size!15781 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15781 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15781 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495530 () Bool)

(declare-fun res!298056 () Bool)

(assert (=> b!495530 (=> (not res!298056) (not e!290654))))

(assert (=> b!495530 (= res!298056 (validKeyInArray!0 k0!2280))))

(declare-fun b!495531 () Bool)

(assert (=> b!495531 (= e!290658 true)))

(assert (=> b!495531 (and (bvslt (x!46775 lt!224218) #b01111111111111111111111111111110) (or (= (select (arr!15416 a!3235) (index!17701 lt!224218)) (select (arr!15416 a!3235) j!176)) (= (select (arr!15416 a!3235) (index!17701 lt!224218)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15416 a!3235) (index!17701 lt!224218)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495532 () Bool)

(declare-fun res!298058 () Bool)

(assert (=> b!495532 (=> (not res!298058) (not e!290655))))

(assert (=> b!495532 (= res!298058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45168 res!298060) b!495529))

(assert (= (and b!495529 res!298054) b!495528))

(assert (= (and b!495528 res!298055) b!495530))

(assert (= (and b!495530 res!298056) b!495527))

(assert (= (and b!495527 res!298053) b!495523))

(assert (= (and b!495523 res!298061) b!495532))

(assert (= (and b!495532 res!298058) b!495525))

(assert (= (and b!495525 res!298057) b!495526))

(assert (= (and b!495526 res!298051) b!495522))

(assert (= (and b!495526 (not res!298059)) b!495524))

(assert (= (and b!495524 (not res!298052)) b!495531))

(declare-fun m!476179 () Bool)

(assert (=> b!495525 m!476179))

(declare-fun m!476181 () Bool)

(assert (=> b!495530 m!476181))

(declare-fun m!476183 () Bool)

(assert (=> b!495526 m!476183))

(declare-fun m!476185 () Bool)

(assert (=> b!495526 m!476185))

(declare-fun m!476187 () Bool)

(assert (=> b!495526 m!476187))

(declare-fun m!476189 () Bool)

(assert (=> b!495526 m!476189))

(assert (=> b!495526 m!476187))

(assert (=> b!495526 m!476185))

(declare-fun m!476191 () Bool)

(assert (=> b!495526 m!476191))

(declare-fun m!476193 () Bool)

(assert (=> b!495526 m!476193))

(assert (=> b!495526 m!476187))

(declare-fun m!476195 () Bool)

(assert (=> b!495526 m!476195))

(assert (=> b!495526 m!476185))

(declare-fun m!476197 () Bool)

(assert (=> b!495526 m!476197))

(declare-fun m!476199 () Bool)

(assert (=> b!495526 m!476199))

(assert (=> b!495522 m!476187))

(assert (=> b!495522 m!476187))

(declare-fun m!476201 () Bool)

(assert (=> b!495522 m!476201))

(declare-fun m!476203 () Bool)

(assert (=> b!495527 m!476203))

(declare-fun m!476205 () Bool)

(assert (=> b!495523 m!476205))

(declare-fun m!476207 () Bool)

(assert (=> start!45168 m!476207))

(declare-fun m!476209 () Bool)

(assert (=> start!45168 m!476209))

(assert (=> b!495528 m!476187))

(assert (=> b!495528 m!476187))

(declare-fun m!476211 () Bool)

(assert (=> b!495528 m!476211))

(declare-fun m!476213 () Bool)

(assert (=> b!495532 m!476213))

(declare-fun m!476215 () Bool)

(assert (=> b!495531 m!476215))

(assert (=> b!495531 m!476187))

(check-sat (not b!495527) (not b!495525) (not b!495526) (not b!495530) (not b!495523) (not b!495528) (not b!495522) (not start!45168) (not b!495532))
(check-sat)
