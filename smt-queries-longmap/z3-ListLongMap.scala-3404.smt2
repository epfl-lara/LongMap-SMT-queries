; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47150 () Bool)

(assert start!47150)

(declare-fun b!519295 () Bool)

(declare-fun res!317869 () Bool)

(declare-fun e!303003 () Bool)

(assert (=> b!519295 (=> (not res!317869) (not e!303003))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519295 (= res!317869 (validKeyInArray!0 k0!2280))))

(declare-fun b!519296 () Bool)

(declare-fun res!317866 () Bool)

(assert (=> b!519296 (=> (not res!317866) (not e!303003))))

(declare-datatypes ((array!33165 0))(
  ( (array!33166 (arr!15943 (Array (_ BitVec 32) (_ BitVec 64))) (size!16307 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33165)

(declare-fun arrayContainsKey!0 (array!33165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519296 (= res!317866 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519297 () Bool)

(declare-fun e!303005 () Bool)

(declare-datatypes ((SeekEntryResult!4410 0))(
  ( (MissingZero!4410 (index!19834 (_ BitVec 32))) (Found!4410 (index!19835 (_ BitVec 32))) (Intermediate!4410 (undefined!5222 Bool) (index!19836 (_ BitVec 32)) (x!48809 (_ BitVec 32))) (Undefined!4410) (MissingVacant!4410 (index!19837 (_ BitVec 32))) )
))
(declare-fun lt!237781 () SeekEntryResult!4410)

(assert (=> b!519297 (= e!303005 (or (= (select (arr!15943 a!3235) (index!19836 lt!237781)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15943 a!3235) (index!19836 lt!237781)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!16092 0))(
  ( (Unit!16093) )
))
(declare-fun lt!237786 () Unit!16092)

(declare-fun e!303006 () Unit!16092)

(assert (=> b!519297 (= lt!237786 e!303006)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61013 () Bool)

(assert (=> b!519297 (= c!61013 (= (select (arr!15943 a!3235) (index!19836 lt!237781)) (select (arr!15943 a!3235) j!176)))))

(assert (=> b!519297 (and (bvslt (x!48809 lt!237781) #b01111111111111111111111111111110) (or (= (select (arr!15943 a!3235) (index!19836 lt!237781)) (select (arr!15943 a!3235) j!176)) (= (select (arr!15943 a!3235) (index!19836 lt!237781)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15943 a!3235) (index!19836 lt!237781)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519298 () Bool)

(declare-fun res!317862 () Bool)

(assert (=> b!519298 (=> res!317862 e!303005)))

(get-info :version)

(assert (=> b!519298 (= res!317862 (or (undefined!5222 lt!237781) (not ((_ is Intermediate!4410) lt!237781))))))

(declare-fun b!519299 () Bool)

(declare-fun res!317873 () Bool)

(declare-fun e!303009 () Bool)

(assert (=> b!519299 (=> (not res!317873) (not e!303009))))

(declare-datatypes ((List!10101 0))(
  ( (Nil!10098) (Cons!10097 (h!11010 (_ BitVec 64)) (t!16329 List!10101)) )
))
(declare-fun arrayNoDuplicates!0 (array!33165 (_ BitVec 32) List!10101) Bool)

(assert (=> b!519299 (= res!317873 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10098))))

(declare-fun b!519300 () Bool)

(declare-fun Unit!16094 () Unit!16092)

(assert (=> b!519300 (= e!303006 Unit!16094)))

(declare-fun b!519301 () Bool)

(declare-fun res!317867 () Bool)

(assert (=> b!519301 (=> (not res!317867) (not e!303003))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519301 (= res!317867 (and (= (size!16307 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16307 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16307 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!317872 () Bool)

(assert (=> start!47150 (=> (not res!317872) (not e!303003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47150 (= res!317872 (validMask!0 mask!3524))))

(assert (=> start!47150 e!303003))

(assert (=> start!47150 true))

(declare-fun array_inv!11739 (array!33165) Bool)

(assert (=> start!47150 (array_inv!11739 a!3235)))

(declare-fun b!519302 () Bool)

(assert (=> b!519302 (= e!303003 e!303009)))

(declare-fun res!317864 () Bool)

(assert (=> b!519302 (=> (not res!317864) (not e!303009))))

(declare-fun lt!237779 () SeekEntryResult!4410)

(assert (=> b!519302 (= res!317864 (or (= lt!237779 (MissingZero!4410 i!1204)) (= lt!237779 (MissingVacant!4410 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33165 (_ BitVec 32)) SeekEntryResult!4410)

(assert (=> b!519302 (= lt!237779 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!519303 () Bool)

(declare-fun Unit!16095 () Unit!16092)

(assert (=> b!519303 (= e!303006 Unit!16095)))

(declare-fun lt!237783 () Unit!16092)

(declare-fun lt!237785 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33165 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16092)

(assert (=> b!519303 (= lt!237783 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237785 #b00000000000000000000000000000000 (index!19836 lt!237781) (x!48809 lt!237781) mask!3524))))

(declare-fun res!317870 () Bool)

(declare-fun lt!237782 () (_ BitVec 64))

(declare-fun lt!237780 () array!33165)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33165 (_ BitVec 32)) SeekEntryResult!4410)

(assert (=> b!519303 (= res!317870 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237785 lt!237782 lt!237780 mask!3524) (Intermediate!4410 false (index!19836 lt!237781) (x!48809 lt!237781))))))

(declare-fun e!303007 () Bool)

(assert (=> b!519303 (=> (not res!317870) (not e!303007))))

(assert (=> b!519303 e!303007))

(declare-fun b!519304 () Bool)

(declare-fun res!317871 () Bool)

(assert (=> b!519304 (=> (not res!317871) (not e!303009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33165 (_ BitVec 32)) Bool)

(assert (=> b!519304 (= res!317871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519305 () Bool)

(declare-fun res!317868 () Bool)

(assert (=> b!519305 (=> (not res!317868) (not e!303003))))

(assert (=> b!519305 (= res!317868 (validKeyInArray!0 (select (arr!15943 a!3235) j!176)))))

(declare-fun b!519306 () Bool)

(assert (=> b!519306 (= e!303009 (not e!303005))))

(declare-fun res!317863 () Bool)

(assert (=> b!519306 (=> res!317863 e!303005)))

(declare-fun lt!237787 () (_ BitVec 32))

(assert (=> b!519306 (= res!317863 (= lt!237781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237787 lt!237782 lt!237780 mask!3524)))))

(assert (=> b!519306 (= lt!237781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237785 (select (arr!15943 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519306 (= lt!237787 (toIndex!0 lt!237782 mask!3524))))

(assert (=> b!519306 (= lt!237782 (select (store (arr!15943 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519306 (= lt!237785 (toIndex!0 (select (arr!15943 a!3235) j!176) mask!3524))))

(assert (=> b!519306 (= lt!237780 (array!33166 (store (arr!15943 a!3235) i!1204 k0!2280) (size!16307 a!3235)))))

(declare-fun e!303008 () Bool)

(assert (=> b!519306 e!303008))

(declare-fun res!317865 () Bool)

(assert (=> b!519306 (=> (not res!317865) (not e!303008))))

(assert (=> b!519306 (= res!317865 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237784 () Unit!16092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16092)

(assert (=> b!519306 (= lt!237784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519307 () Bool)

(assert (=> b!519307 (= e!303008 (= (seekEntryOrOpen!0 (select (arr!15943 a!3235) j!176) a!3235 mask!3524) (Found!4410 j!176)))))

(declare-fun b!519308 () Bool)

(assert (=> b!519308 (= e!303007 false)))

(assert (= (and start!47150 res!317872) b!519301))

(assert (= (and b!519301 res!317867) b!519305))

(assert (= (and b!519305 res!317868) b!519295))

(assert (= (and b!519295 res!317869) b!519296))

(assert (= (and b!519296 res!317866) b!519302))

(assert (= (and b!519302 res!317864) b!519304))

(assert (= (and b!519304 res!317871) b!519299))

(assert (= (and b!519299 res!317873) b!519306))

(assert (= (and b!519306 res!317865) b!519307))

(assert (= (and b!519306 (not res!317863)) b!519298))

(assert (= (and b!519298 (not res!317862)) b!519297))

(assert (= (and b!519297 c!61013) b!519303))

(assert (= (and b!519297 (not c!61013)) b!519300))

(assert (= (and b!519303 res!317870) b!519308))

(declare-fun m!500487 () Bool)

(assert (=> b!519306 m!500487))

(declare-fun m!500489 () Bool)

(assert (=> b!519306 m!500489))

(declare-fun m!500491 () Bool)

(assert (=> b!519306 m!500491))

(declare-fun m!500493 () Bool)

(assert (=> b!519306 m!500493))

(declare-fun m!500495 () Bool)

(assert (=> b!519306 m!500495))

(declare-fun m!500497 () Bool)

(assert (=> b!519306 m!500497))

(declare-fun m!500499 () Bool)

(assert (=> b!519306 m!500499))

(assert (=> b!519306 m!500497))

(declare-fun m!500501 () Bool)

(assert (=> b!519306 m!500501))

(assert (=> b!519306 m!500497))

(declare-fun m!500503 () Bool)

(assert (=> b!519306 m!500503))

(declare-fun m!500505 () Bool)

(assert (=> b!519299 m!500505))

(assert (=> b!519307 m!500497))

(assert (=> b!519307 m!500497))

(declare-fun m!500507 () Bool)

(assert (=> b!519307 m!500507))

(declare-fun m!500509 () Bool)

(assert (=> b!519296 m!500509))

(declare-fun m!500511 () Bool)

(assert (=> b!519303 m!500511))

(declare-fun m!500513 () Bool)

(assert (=> b!519303 m!500513))

(assert (=> b!519305 m!500497))

(assert (=> b!519305 m!500497))

(declare-fun m!500515 () Bool)

(assert (=> b!519305 m!500515))

(declare-fun m!500517 () Bool)

(assert (=> b!519297 m!500517))

(assert (=> b!519297 m!500497))

(declare-fun m!500519 () Bool)

(assert (=> b!519304 m!500519))

(declare-fun m!500521 () Bool)

(assert (=> b!519302 m!500521))

(declare-fun m!500523 () Bool)

(assert (=> b!519295 m!500523))

(declare-fun m!500525 () Bool)

(assert (=> start!47150 m!500525))

(declare-fun m!500527 () Bool)

(assert (=> start!47150 m!500527))

(check-sat (not b!519295) (not b!519296) (not b!519304) (not b!519299) (not b!519303) (not b!519306) (not start!47150) (not b!519307) (not b!519305) (not b!519302))
(check-sat)
