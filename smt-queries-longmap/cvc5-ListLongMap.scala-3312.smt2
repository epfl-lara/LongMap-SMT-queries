; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45816 () Bool)

(assert start!45816)

(declare-fun b!507247 () Bool)

(declare-fun res!308208 () Bool)

(declare-fun e!296862 () Bool)

(assert (=> b!507247 (=> (not res!308208) (not e!296862))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507247 (= res!308208 (validKeyInArray!0 k!2280))))

(declare-fun b!507248 () Bool)

(declare-fun e!296859 () Bool)

(declare-fun e!296861 () Bool)

(assert (=> b!507248 (= e!296859 e!296861)))

(declare-fun res!308211 () Bool)

(assert (=> b!507248 (=> res!308211 e!296861)))

(declare-fun lt!231566 () Bool)

(declare-datatypes ((SeekEntryResult!4133 0))(
  ( (MissingZero!4133 (index!18720 (_ BitVec 32))) (Found!4133 (index!18721 (_ BitVec 32))) (Intermediate!4133 (undefined!4945 Bool) (index!18722 (_ BitVec 32)) (x!47718 (_ BitVec 32))) (Undefined!4133) (MissingVacant!4133 (index!18723 (_ BitVec 32))) )
))
(declare-fun lt!231568 () SeekEntryResult!4133)

(assert (=> b!507248 (= res!308211 (or (and (not lt!231566) (undefined!4945 lt!231568)) (and (not lt!231566) (not (undefined!4945 lt!231568)))))))

(assert (=> b!507248 (= lt!231566 (not (is-Intermediate!4133 lt!231568)))))

(declare-fun b!507249 () Bool)

(declare-fun res!308209 () Bool)

(declare-fun e!296858 () Bool)

(assert (=> b!507249 (=> (not res!308209) (not e!296858))))

(declare-datatypes ((array!32572 0))(
  ( (array!32573 (arr!15666 (Array (_ BitVec 32) (_ BitVec 64))) (size!16030 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32572)

(declare-datatypes ((List!9824 0))(
  ( (Nil!9821) (Cons!9820 (h!10697 (_ BitVec 64)) (t!16052 List!9824)) )
))
(declare-fun arrayNoDuplicates!0 (array!32572 (_ BitVec 32) List!9824) Bool)

(assert (=> b!507249 (= res!308209 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9821))))

(declare-fun b!507250 () Bool)

(assert (=> b!507250 (= e!296862 e!296858)))

(declare-fun res!308210 () Bool)

(assert (=> b!507250 (=> (not res!308210) (not e!296858))))

(declare-fun lt!231567 () SeekEntryResult!4133)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507250 (= res!308210 (or (= lt!231567 (MissingZero!4133 i!1204)) (= lt!231567 (MissingVacant!4133 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32572 (_ BitVec 32)) SeekEntryResult!4133)

(assert (=> b!507250 (= lt!231567 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507251 () Bool)

(declare-fun res!308213 () Bool)

(assert (=> b!507251 (=> (not res!308213) (not e!296858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32572 (_ BitVec 32)) Bool)

(assert (=> b!507251 (= res!308213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507252 () Bool)

(assert (=> b!507252 (= e!296861 true)))

(declare-fun lt!231573 () (_ BitVec 64))

(declare-fun lt!231574 () array!32572)

(declare-fun lt!231572 () SeekEntryResult!4133)

(assert (=> b!507252 (= lt!231572 (seekEntryOrOpen!0 lt!231573 lt!231574 mask!3524))))

(assert (=> b!507252 false))

(declare-fun b!507253 () Bool)

(declare-fun res!308214 () Bool)

(assert (=> b!507253 (=> (not res!308214) (not e!296862))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507253 (= res!308214 (and (= (size!16030 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16030 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16030 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!308212 () Bool)

(assert (=> start!45816 (=> (not res!308212) (not e!296862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45816 (= res!308212 (validMask!0 mask!3524))))

(assert (=> start!45816 e!296862))

(assert (=> start!45816 true))

(declare-fun array_inv!11462 (array!32572) Bool)

(assert (=> start!45816 (array_inv!11462 a!3235)))

(declare-fun b!507254 () Bool)

(assert (=> b!507254 (= e!296858 (not e!296859))))

(declare-fun res!308215 () Bool)

(assert (=> b!507254 (=> res!308215 e!296859)))

(declare-fun lt!231570 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32572 (_ BitVec 32)) SeekEntryResult!4133)

(assert (=> b!507254 (= res!308215 (= lt!231568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231570 lt!231573 lt!231574 mask!3524)))))

(declare-fun lt!231569 () (_ BitVec 32))

(assert (=> b!507254 (= lt!231568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231569 (select (arr!15666 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507254 (= lt!231570 (toIndex!0 lt!231573 mask!3524))))

(assert (=> b!507254 (= lt!231573 (select (store (arr!15666 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507254 (= lt!231569 (toIndex!0 (select (arr!15666 a!3235) j!176) mask!3524))))

(assert (=> b!507254 (= lt!231574 (array!32573 (store (arr!15666 a!3235) i!1204 k!2280) (size!16030 a!3235)))))

(declare-fun e!296857 () Bool)

(assert (=> b!507254 e!296857))

(declare-fun res!308206 () Bool)

(assert (=> b!507254 (=> (not res!308206) (not e!296857))))

(assert (=> b!507254 (= res!308206 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15554 0))(
  ( (Unit!15555) )
))
(declare-fun lt!231571 () Unit!15554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15554)

(assert (=> b!507254 (= lt!231571 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507255 () Bool)

(declare-fun res!308216 () Bool)

(assert (=> b!507255 (=> (not res!308216) (not e!296862))))

(assert (=> b!507255 (= res!308216 (validKeyInArray!0 (select (arr!15666 a!3235) j!176)))))

(declare-fun b!507256 () Bool)

(assert (=> b!507256 (= e!296857 (= (seekEntryOrOpen!0 (select (arr!15666 a!3235) j!176) a!3235 mask!3524) (Found!4133 j!176)))))

(declare-fun b!507257 () Bool)

(declare-fun res!308207 () Bool)

(assert (=> b!507257 (=> (not res!308207) (not e!296862))))

(declare-fun arrayContainsKey!0 (array!32572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507257 (= res!308207 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45816 res!308212) b!507253))

(assert (= (and b!507253 res!308214) b!507255))

(assert (= (and b!507255 res!308216) b!507247))

(assert (= (and b!507247 res!308208) b!507257))

(assert (= (and b!507257 res!308207) b!507250))

(assert (= (and b!507250 res!308210) b!507251))

(assert (= (and b!507251 res!308213) b!507249))

(assert (= (and b!507249 res!308209) b!507254))

(assert (= (and b!507254 res!308206) b!507256))

(assert (= (and b!507254 (not res!308215)) b!507248))

(assert (= (and b!507248 (not res!308211)) b!507252))

(declare-fun m!487989 () Bool)

(assert (=> start!45816 m!487989))

(declare-fun m!487991 () Bool)

(assert (=> start!45816 m!487991))

(declare-fun m!487993 () Bool)

(assert (=> b!507251 m!487993))

(declare-fun m!487995 () Bool)

(assert (=> b!507257 m!487995))

(declare-fun m!487997 () Bool)

(assert (=> b!507247 m!487997))

(declare-fun m!487999 () Bool)

(assert (=> b!507254 m!487999))

(declare-fun m!488001 () Bool)

(assert (=> b!507254 m!488001))

(declare-fun m!488003 () Bool)

(assert (=> b!507254 m!488003))

(declare-fun m!488005 () Bool)

(assert (=> b!507254 m!488005))

(assert (=> b!507254 m!487999))

(declare-fun m!488007 () Bool)

(assert (=> b!507254 m!488007))

(assert (=> b!507254 m!487999))

(declare-fun m!488009 () Bool)

(assert (=> b!507254 m!488009))

(declare-fun m!488011 () Bool)

(assert (=> b!507254 m!488011))

(declare-fun m!488013 () Bool)

(assert (=> b!507254 m!488013))

(declare-fun m!488015 () Bool)

(assert (=> b!507254 m!488015))

(declare-fun m!488017 () Bool)

(assert (=> b!507249 m!488017))

(declare-fun m!488019 () Bool)

(assert (=> b!507252 m!488019))

(declare-fun m!488021 () Bool)

(assert (=> b!507250 m!488021))

(assert (=> b!507255 m!487999))

(assert (=> b!507255 m!487999))

(declare-fun m!488023 () Bool)

(assert (=> b!507255 m!488023))

(assert (=> b!507256 m!487999))

(assert (=> b!507256 m!487999))

(declare-fun m!488025 () Bool)

(assert (=> b!507256 m!488025))

(push 1)

