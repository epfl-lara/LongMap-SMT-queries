; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44744 () Bool)

(assert start!44744)

(declare-fun b!491219 () Bool)

(declare-fun e!288646 () Bool)

(declare-fun e!288648 () Bool)

(assert (=> b!491219 (= e!288646 (not e!288648))))

(declare-fun res!294211 () Bool)

(assert (=> b!491219 (=> res!294211 e!288648)))

(declare-datatypes ((array!31804 0))(
  ( (array!31805 (arr!15289 (Array (_ BitVec 32) (_ BitVec 64))) (size!15653 (_ BitVec 32))) )
))
(declare-fun lt!222064 () array!31804)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun a!3235 () array!31804)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222059 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3712 0))(
  ( (MissingZero!3712 (index!17027 (_ BitVec 32))) (Found!3712 (index!17028 (_ BitVec 32))) (Intermediate!3712 (undefined!4524 Bool) (index!17029 (_ BitVec 32)) (x!46263 (_ BitVec 32))) (Undefined!3712) (MissingVacant!3712 (index!17030 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31804 (_ BitVec 32)) SeekEntryResult!3712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491219 (= res!294211 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15289 a!3235) j!176) mask!3524) (select (arr!15289 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222059 mask!3524) lt!222059 lt!222064 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491219 (= lt!222059 (select (store (arr!15289 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491219 (= lt!222064 (array!31805 (store (arr!15289 a!3235) i!1204 k0!2280) (size!15653 a!3235)))))

(declare-fun lt!222063 () SeekEntryResult!3712)

(assert (=> b!491219 (= lt!222063 (Found!3712 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31804 (_ BitVec 32)) SeekEntryResult!3712)

(assert (=> b!491219 (= lt!222063 (seekEntryOrOpen!0 (select (arr!15289 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31804 (_ BitVec 32)) Bool)

(assert (=> b!491219 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14431 0))(
  ( (Unit!14432) )
))
(declare-fun lt!222060 () Unit!14431)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14431)

(assert (=> b!491219 (= lt!222060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491220 () Bool)

(assert (=> b!491220 (= e!288648 true)))

(assert (=> b!491220 (= lt!222063 (seekEntryOrOpen!0 lt!222059 lt!222064 mask!3524))))

(declare-fun lt!222061 () Unit!14431)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31804 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14431)

(assert (=> b!491220 (= lt!222061 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491221 () Bool)

(declare-fun e!288647 () Bool)

(assert (=> b!491221 (= e!288647 e!288646)))

(declare-fun res!294217 () Bool)

(assert (=> b!491221 (=> (not res!294217) (not e!288646))))

(declare-fun lt!222062 () SeekEntryResult!3712)

(assert (=> b!491221 (= res!294217 (or (= lt!222062 (MissingZero!3712 i!1204)) (= lt!222062 (MissingVacant!3712 i!1204))))))

(assert (=> b!491221 (= lt!222062 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491222 () Bool)

(declare-fun res!294216 () Bool)

(assert (=> b!491222 (=> (not res!294216) (not e!288647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491222 (= res!294216 (validKeyInArray!0 k0!2280))))

(declare-fun res!294212 () Bool)

(assert (=> start!44744 (=> (not res!294212) (not e!288647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44744 (= res!294212 (validMask!0 mask!3524))))

(assert (=> start!44744 e!288647))

(assert (=> start!44744 true))

(declare-fun array_inv!11148 (array!31804) Bool)

(assert (=> start!44744 (array_inv!11148 a!3235)))

(declare-fun b!491223 () Bool)

(declare-fun res!294213 () Bool)

(assert (=> b!491223 (=> (not res!294213) (not e!288646))))

(declare-datatypes ((List!9354 0))(
  ( (Nil!9351) (Cons!9350 (h!10212 (_ BitVec 64)) (t!15574 List!9354)) )
))
(declare-fun arrayNoDuplicates!0 (array!31804 (_ BitVec 32) List!9354) Bool)

(assert (=> b!491223 (= res!294213 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9351))))

(declare-fun b!491224 () Bool)

(declare-fun res!294209 () Bool)

(assert (=> b!491224 (=> (not res!294209) (not e!288647))))

(declare-fun arrayContainsKey!0 (array!31804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491224 (= res!294209 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491225 () Bool)

(declare-fun res!294214 () Bool)

(assert (=> b!491225 (=> (not res!294214) (not e!288647))))

(assert (=> b!491225 (= res!294214 (and (= (size!15653 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15653 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15653 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491226 () Bool)

(declare-fun res!294210 () Bool)

(assert (=> b!491226 (=> (not res!294210) (not e!288646))))

(assert (=> b!491226 (= res!294210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491227 () Bool)

(declare-fun res!294215 () Bool)

(assert (=> b!491227 (=> (not res!294215) (not e!288647))))

(assert (=> b!491227 (= res!294215 (validKeyInArray!0 (select (arr!15289 a!3235) j!176)))))

(assert (= (and start!44744 res!294212) b!491225))

(assert (= (and b!491225 res!294214) b!491227))

(assert (= (and b!491227 res!294215) b!491222))

(assert (= (and b!491222 res!294216) b!491224))

(assert (= (and b!491224 res!294209) b!491221))

(assert (= (and b!491221 res!294217) b!491226))

(assert (= (and b!491226 res!294210) b!491223))

(assert (= (and b!491223 res!294213) b!491219))

(assert (= (and b!491219 (not res!294211)) b!491220))

(declare-fun m!471967 () Bool)

(assert (=> b!491219 m!471967))

(declare-fun m!471969 () Bool)

(assert (=> b!491219 m!471969))

(declare-fun m!471971 () Bool)

(assert (=> b!491219 m!471971))

(declare-fun m!471973 () Bool)

(assert (=> b!491219 m!471973))

(declare-fun m!471975 () Bool)

(assert (=> b!491219 m!471975))

(declare-fun m!471977 () Bool)

(assert (=> b!491219 m!471977))

(assert (=> b!491219 m!471973))

(assert (=> b!491219 m!471971))

(assert (=> b!491219 m!471973))

(declare-fun m!471979 () Bool)

(assert (=> b!491219 m!471979))

(assert (=> b!491219 m!471973))

(declare-fun m!471981 () Bool)

(assert (=> b!491219 m!471981))

(declare-fun m!471983 () Bool)

(assert (=> b!491219 m!471983))

(assert (=> b!491219 m!471977))

(declare-fun m!471985 () Bool)

(assert (=> b!491219 m!471985))

(declare-fun m!471987 () Bool)

(assert (=> b!491222 m!471987))

(declare-fun m!471989 () Bool)

(assert (=> b!491224 m!471989))

(assert (=> b!491227 m!471973))

(assert (=> b!491227 m!471973))

(declare-fun m!471991 () Bool)

(assert (=> b!491227 m!471991))

(declare-fun m!471993 () Bool)

(assert (=> b!491220 m!471993))

(declare-fun m!471995 () Bool)

(assert (=> b!491220 m!471995))

(declare-fun m!471997 () Bool)

(assert (=> b!491221 m!471997))

(declare-fun m!471999 () Bool)

(assert (=> start!44744 m!471999))

(declare-fun m!472001 () Bool)

(assert (=> start!44744 m!472001))

(declare-fun m!472003 () Bool)

(assert (=> b!491223 m!472003))

(declare-fun m!472005 () Bool)

(assert (=> b!491226 m!472005))

(check-sat (not start!44744) (not b!491227) (not b!491224) (not b!491220) (not b!491226) (not b!491222) (not b!491223) (not b!491219) (not b!491221))
(check-sat)
