; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47066 () Bool)

(assert start!47066)

(declare-fun b!518740 () Bool)

(declare-datatypes ((Unit!16039 0))(
  ( (Unit!16040) )
))
(declare-fun e!302672 () Unit!16039)

(declare-fun Unit!16041 () Unit!16039)

(assert (=> b!518740 (= e!302672 Unit!16041)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33145 0))(
  ( (array!33146 (arr!15934 (Array (_ BitVec 32) (_ BitVec 64))) (size!16298 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33145)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!237544 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4357 0))(
  ( (MissingZero!4357 (index!19619 (_ BitVec 32))) (Found!4357 (index!19620 (_ BitVec 32))) (Intermediate!4357 (undefined!5169 Bool) (index!19621 (_ BitVec 32)) (x!48736 (_ BitVec 32))) (Undefined!4357) (MissingVacant!4357 (index!19622 (_ BitVec 32))) )
))
(declare-fun lt!237541 () SeekEntryResult!4357)

(declare-fun lt!237542 () Unit!16039)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16039)

(assert (=> b!518740 (= lt!237542 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237544 #b00000000000000000000000000000000 (index!19621 lt!237541) (x!48736 lt!237541) mask!3524))))

(declare-fun res!317587 () Bool)

(declare-fun lt!237539 () array!33145)

(declare-fun lt!237543 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33145 (_ BitVec 32)) SeekEntryResult!4357)

(assert (=> b!518740 (= res!317587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237544 lt!237543 lt!237539 mask!3524) (Intermediate!4357 false (index!19621 lt!237541) (x!48736 lt!237541))))))

(declare-fun e!302671 () Bool)

(assert (=> b!518740 (=> (not res!317587) (not e!302671))))

(assert (=> b!518740 e!302671))

(declare-fun b!518741 () Bool)

(assert (=> b!518741 (= e!302671 false)))

(declare-fun b!518742 () Bool)

(declare-fun Unit!16042 () Unit!16039)

(assert (=> b!518742 (= e!302672 Unit!16042)))

(declare-fun e!302670 () Bool)

(declare-fun b!518743 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33145 (_ BitVec 32)) SeekEntryResult!4357)

(assert (=> b!518743 (= e!302670 (= (seekEntryOrOpen!0 (select (arr!15934 a!3235) j!176) a!3235 mask!3524) (Found!4357 j!176)))))

(declare-fun b!518744 () Bool)

(declare-fun e!302673 () Bool)

(declare-fun e!302676 () Bool)

(assert (=> b!518744 (= e!302673 e!302676)))

(declare-fun res!317594 () Bool)

(assert (=> b!518744 (=> (not res!317594) (not e!302676))))

(declare-fun lt!237546 () SeekEntryResult!4357)

(assert (=> b!518744 (= res!317594 (or (= lt!237546 (MissingZero!4357 i!1204)) (= lt!237546 (MissingVacant!4357 i!1204))))))

(assert (=> b!518744 (= lt!237546 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518745 () Bool)

(declare-fun res!317588 () Bool)

(assert (=> b!518745 (=> (not res!317588) (not e!302673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518745 (= res!317588 (validKeyInArray!0 (select (arr!15934 a!3235) j!176)))))

(declare-fun b!518746 () Bool)

(declare-fun res!317591 () Bool)

(assert (=> b!518746 (=> (not res!317591) (not e!302673))))

(declare-fun arrayContainsKey!0 (array!33145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518746 (= res!317591 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518747 () Bool)

(declare-fun res!317589 () Bool)

(assert (=> b!518747 (=> (not res!317589) (not e!302676))))

(declare-datatypes ((List!9999 0))(
  ( (Nil!9996) (Cons!9995 (h!10905 (_ BitVec 64)) (t!16219 List!9999)) )
))
(declare-fun arrayNoDuplicates!0 (array!33145 (_ BitVec 32) List!9999) Bool)

(assert (=> b!518747 (= res!317589 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9996))))

(declare-fun res!317592 () Bool)

(assert (=> start!47066 (=> (not res!317592) (not e!302673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47066 (= res!317592 (validMask!0 mask!3524))))

(assert (=> start!47066 e!302673))

(assert (=> start!47066 true))

(declare-fun array_inv!11793 (array!33145) Bool)

(assert (=> start!47066 (array_inv!11793 a!3235)))

(declare-fun b!518739 () Bool)

(declare-fun res!317590 () Bool)

(assert (=> b!518739 (=> (not res!317590) (not e!302676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33145 (_ BitVec 32)) Bool)

(assert (=> b!518739 (= res!317590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518748 () Bool)

(declare-fun e!302675 () Bool)

(assert (=> b!518748 (= e!302676 (not e!302675))))

(declare-fun res!317593 () Bool)

(assert (=> b!518748 (=> res!317593 e!302675)))

(declare-fun lt!237545 () (_ BitVec 32))

(assert (=> b!518748 (= res!317593 (= lt!237541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237545 lt!237543 lt!237539 mask!3524)))))

(assert (=> b!518748 (= lt!237541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237544 (select (arr!15934 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518748 (= lt!237545 (toIndex!0 lt!237543 mask!3524))))

(assert (=> b!518748 (= lt!237543 (select (store (arr!15934 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518748 (= lt!237544 (toIndex!0 (select (arr!15934 a!3235) j!176) mask!3524))))

(assert (=> b!518748 (= lt!237539 (array!33146 (store (arr!15934 a!3235) i!1204 k0!2280) (size!16298 a!3235)))))

(assert (=> b!518748 e!302670))

(declare-fun res!317595 () Bool)

(assert (=> b!518748 (=> (not res!317595) (not e!302670))))

(assert (=> b!518748 (= res!317595 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237547 () Unit!16039)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16039)

(assert (=> b!518748 (= lt!237547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518749 () Bool)

(declare-fun res!317596 () Bool)

(assert (=> b!518749 (=> res!317596 e!302675)))

(get-info :version)

(assert (=> b!518749 (= res!317596 (or (undefined!5169 lt!237541) (not ((_ is Intermediate!4357) lt!237541))))))

(declare-fun b!518750 () Bool)

(declare-fun res!317585 () Bool)

(assert (=> b!518750 (=> (not res!317585) (not e!302673))))

(assert (=> b!518750 (= res!317585 (and (= (size!16298 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16298 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16298 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518751 () Bool)

(assert (=> b!518751 (= e!302675 (or (= (select (arr!15934 a!3235) (index!19621 lt!237541)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19621 lt!237541) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237541) (size!16298 a!3235)))))))

(declare-fun lt!237540 () Unit!16039)

(assert (=> b!518751 (= lt!237540 e!302672)))

(declare-fun c!60872 () Bool)

(assert (=> b!518751 (= c!60872 (= (select (arr!15934 a!3235) (index!19621 lt!237541)) (select (arr!15934 a!3235) j!176)))))

(assert (=> b!518751 (and (bvslt (x!48736 lt!237541) #b01111111111111111111111111111110) (or (= (select (arr!15934 a!3235) (index!19621 lt!237541)) (select (arr!15934 a!3235) j!176)) (= (select (arr!15934 a!3235) (index!19621 lt!237541)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15934 a!3235) (index!19621 lt!237541)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518752 () Bool)

(declare-fun res!317586 () Bool)

(assert (=> b!518752 (=> (not res!317586) (not e!302673))))

(assert (=> b!518752 (= res!317586 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47066 res!317592) b!518750))

(assert (= (and b!518750 res!317585) b!518745))

(assert (= (and b!518745 res!317588) b!518752))

(assert (= (and b!518752 res!317586) b!518746))

(assert (= (and b!518746 res!317591) b!518744))

(assert (= (and b!518744 res!317594) b!518739))

(assert (= (and b!518739 res!317590) b!518747))

(assert (= (and b!518747 res!317589) b!518748))

(assert (= (and b!518748 res!317595) b!518743))

(assert (= (and b!518748 (not res!317593)) b!518749))

(assert (= (and b!518749 (not res!317596)) b!518751))

(assert (= (and b!518751 c!60872) b!518740))

(assert (= (and b!518751 (not c!60872)) b!518742))

(assert (= (and b!518740 res!317587) b!518741))

(declare-fun m!500269 () Bool)

(assert (=> b!518744 m!500269))

(declare-fun m!500271 () Bool)

(assert (=> b!518746 m!500271))

(declare-fun m!500273 () Bool)

(assert (=> b!518739 m!500273))

(declare-fun m!500275 () Bool)

(assert (=> b!518743 m!500275))

(assert (=> b!518743 m!500275))

(declare-fun m!500277 () Bool)

(assert (=> b!518743 m!500277))

(declare-fun m!500279 () Bool)

(assert (=> b!518751 m!500279))

(assert (=> b!518751 m!500275))

(declare-fun m!500281 () Bool)

(assert (=> b!518752 m!500281))

(assert (=> b!518745 m!500275))

(assert (=> b!518745 m!500275))

(declare-fun m!500283 () Bool)

(assert (=> b!518745 m!500283))

(declare-fun m!500285 () Bool)

(assert (=> b!518748 m!500285))

(declare-fun m!500287 () Bool)

(assert (=> b!518748 m!500287))

(declare-fun m!500289 () Bool)

(assert (=> b!518748 m!500289))

(assert (=> b!518748 m!500275))

(declare-fun m!500291 () Bool)

(assert (=> b!518748 m!500291))

(assert (=> b!518748 m!500275))

(declare-fun m!500293 () Bool)

(assert (=> b!518748 m!500293))

(assert (=> b!518748 m!500275))

(declare-fun m!500295 () Bool)

(assert (=> b!518748 m!500295))

(declare-fun m!500297 () Bool)

(assert (=> b!518748 m!500297))

(declare-fun m!500299 () Bool)

(assert (=> b!518748 m!500299))

(declare-fun m!500301 () Bool)

(assert (=> b!518740 m!500301))

(declare-fun m!500303 () Bool)

(assert (=> b!518740 m!500303))

(declare-fun m!500305 () Bool)

(assert (=> start!47066 m!500305))

(declare-fun m!500307 () Bool)

(assert (=> start!47066 m!500307))

(declare-fun m!500309 () Bool)

(assert (=> b!518747 m!500309))

(check-sat (not b!518747) (not b!518743) (not start!47066) (not b!518739) (not b!518744) (not b!518748) (not b!518746) (not b!518745) (not b!518740) (not b!518752))
(check-sat)
(get-model)

(declare-fun d!79999 () Bool)

(assert (=> d!79999 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47066 d!79999))

(declare-fun d!80001 () Bool)

(assert (=> d!80001 (= (array_inv!11793 a!3235) (bvsge (size!16298 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47066 d!80001))

(declare-fun d!80003 () Bool)

(declare-fun e!302721 () Bool)

(assert (=> d!80003 e!302721))

(declare-fun res!317671 () Bool)

(assert (=> d!80003 (=> (not res!317671) (not e!302721))))

(assert (=> d!80003 (= res!317671 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16298 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16298 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16298 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16298 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16298 a!3235))))))

(declare-fun lt!237604 () Unit!16039)

(declare-fun choose!47 (array!33145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16039)

(assert (=> d!80003 (= lt!237604 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237544 #b00000000000000000000000000000000 (index!19621 lt!237541) (x!48736 lt!237541) mask!3524))))

(assert (=> d!80003 (validMask!0 mask!3524)))

(assert (=> d!80003 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237544 #b00000000000000000000000000000000 (index!19621 lt!237541) (x!48736 lt!237541) mask!3524) lt!237604)))

(declare-fun b!518839 () Bool)

(assert (=> b!518839 (= e!302721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237544 (select (store (arr!15934 a!3235) i!1204 k0!2280) j!176) (array!33146 (store (arr!15934 a!3235) i!1204 k0!2280) (size!16298 a!3235)) mask!3524) (Intermediate!4357 false (index!19621 lt!237541) (x!48736 lt!237541))))))

(assert (= (and d!80003 res!317671) b!518839))

(declare-fun m!500395 () Bool)

(assert (=> d!80003 m!500395))

(assert (=> d!80003 m!500305))

(assert (=> b!518839 m!500287))

(assert (=> b!518839 m!500299))

(assert (=> b!518839 m!500299))

(declare-fun m!500397 () Bool)

(assert (=> b!518839 m!500397))

(assert (=> b!518740 d!80003))

(declare-fun b!518892 () Bool)

(declare-fun lt!237627 () SeekEntryResult!4357)

(assert (=> b!518892 (and (bvsge (index!19621 lt!237627) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237627) (size!16298 lt!237539)))))

(declare-fun res!317692 () Bool)

(assert (=> b!518892 (= res!317692 (= (select (arr!15934 lt!237539) (index!19621 lt!237627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302758 () Bool)

(assert (=> b!518892 (=> res!317692 e!302758)))

(declare-fun b!518893 () Bool)

(declare-fun e!302757 () Bool)

(declare-fun e!302755 () Bool)

(assert (=> b!518893 (= e!302757 e!302755)))

(declare-fun res!317691 () Bool)

(assert (=> b!518893 (= res!317691 (and ((_ is Intermediate!4357) lt!237627) (not (undefined!5169 lt!237627)) (bvslt (x!48736 lt!237627) #b01111111111111111111111111111110) (bvsge (x!48736 lt!237627) #b00000000000000000000000000000000) (bvsge (x!48736 lt!237627) #b00000000000000000000000000000000)))))

(assert (=> b!518893 (=> (not res!317691) (not e!302755))))

(declare-fun b!518894 () Bool)

(assert (=> b!518894 (= e!302757 (bvsge (x!48736 lt!237627) #b01111111111111111111111111111110))))

(declare-fun b!518895 () Bool)

(assert (=> b!518895 (and (bvsge (index!19621 lt!237627) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237627) (size!16298 lt!237539)))))

(assert (=> b!518895 (= e!302758 (= (select (arr!15934 lt!237539) (index!19621 lt!237627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518896 () Bool)

(declare-fun e!302756 () SeekEntryResult!4357)

(declare-fun e!302759 () SeekEntryResult!4357)

(assert (=> b!518896 (= e!302756 e!302759)))

(declare-fun c!60898 () Bool)

(declare-fun lt!237626 () (_ BitVec 64))

(assert (=> b!518896 (= c!60898 (or (= lt!237626 lt!237543) (= (bvadd lt!237626 lt!237626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518897 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518897 (= e!302759 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!237543 lt!237539 mask!3524))))

(declare-fun b!518898 () Bool)

(assert (=> b!518898 (= e!302756 (Intermediate!4357 true lt!237544 #b00000000000000000000000000000000))))

(declare-fun b!518899 () Bool)

(assert (=> b!518899 (= e!302759 (Intermediate!4357 false lt!237544 #b00000000000000000000000000000000))))

(declare-fun b!518900 () Bool)

(assert (=> b!518900 (and (bvsge (index!19621 lt!237627) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237627) (size!16298 lt!237539)))))

(declare-fun res!317690 () Bool)

(assert (=> b!518900 (= res!317690 (= (select (arr!15934 lt!237539) (index!19621 lt!237627)) lt!237543))))

(assert (=> b!518900 (=> res!317690 e!302758)))

(assert (=> b!518900 (= e!302755 e!302758)))

(declare-fun d!80007 () Bool)

(assert (=> d!80007 e!302757))

(declare-fun c!60897 () Bool)

(assert (=> d!80007 (= c!60897 (and ((_ is Intermediate!4357) lt!237627) (undefined!5169 lt!237627)))))

(assert (=> d!80007 (= lt!237627 e!302756)))

(declare-fun c!60896 () Bool)

(assert (=> d!80007 (= c!60896 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80007 (= lt!237626 (select (arr!15934 lt!237539) lt!237544))))

(assert (=> d!80007 (validMask!0 mask!3524)))

(assert (=> d!80007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237544 lt!237543 lt!237539 mask!3524) lt!237627)))

(assert (= (and d!80007 c!60896) b!518898))

(assert (= (and d!80007 (not c!60896)) b!518896))

(assert (= (and b!518896 c!60898) b!518899))

(assert (= (and b!518896 (not c!60898)) b!518897))

(assert (= (and d!80007 c!60897) b!518894))

(assert (= (and d!80007 (not c!60897)) b!518893))

(assert (= (and b!518893 res!317691) b!518900))

(assert (= (and b!518900 (not res!317690)) b!518892))

(assert (= (and b!518892 (not res!317692)) b!518895))

(declare-fun m!500415 () Bool)

(assert (=> b!518897 m!500415))

(assert (=> b!518897 m!500415))

(declare-fun m!500417 () Bool)

(assert (=> b!518897 m!500417))

(declare-fun m!500419 () Bool)

(assert (=> d!80007 m!500419))

(assert (=> d!80007 m!500305))

(declare-fun m!500421 () Bool)

(assert (=> b!518895 m!500421))

(assert (=> b!518900 m!500421))

(assert (=> b!518892 m!500421))

(assert (=> b!518740 d!80007))

(declare-fun d!80015 () Bool)

(assert (=> d!80015 (= (validKeyInArray!0 (select (arr!15934 a!3235) j!176)) (and (not (= (select (arr!15934 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15934 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518745 d!80015))

(declare-fun b!518920 () Bool)

(declare-fun e!302776 () Bool)

(declare-fun e!302778 () Bool)

(assert (=> b!518920 (= e!302776 e!302778)))

(declare-fun res!317705 () Bool)

(assert (=> b!518920 (=> (not res!317705) (not e!302778))))

(declare-fun e!302775 () Bool)

(assert (=> b!518920 (= res!317705 (not e!302775))))

(declare-fun res!317707 () Bool)

(assert (=> b!518920 (=> (not res!317707) (not e!302775))))

(assert (=> b!518920 (= res!317707 (validKeyInArray!0 (select (arr!15934 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518921 () Bool)

(declare-fun contains!2730 (List!9999 (_ BitVec 64)) Bool)

(assert (=> b!518921 (= e!302775 (contains!2730 Nil!9996 (select (arr!15934 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518922 () Bool)

(declare-fun e!302777 () Bool)

(assert (=> b!518922 (= e!302778 e!302777)))

(declare-fun c!60903 () Bool)

(assert (=> b!518922 (= c!60903 (validKeyInArray!0 (select (arr!15934 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518923 () Bool)

(declare-fun call!31717 () Bool)

(assert (=> b!518923 (= e!302777 call!31717)))

(declare-fun b!518924 () Bool)

(assert (=> b!518924 (= e!302777 call!31717)))

(declare-fun d!80019 () Bool)

(declare-fun res!317706 () Bool)

(assert (=> d!80019 (=> res!317706 e!302776)))

(assert (=> d!80019 (= res!317706 (bvsge #b00000000000000000000000000000000 (size!16298 a!3235)))))

(assert (=> d!80019 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9996) e!302776)))

(declare-fun bm!31714 () Bool)

(assert (=> bm!31714 (= call!31717 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60903 (Cons!9995 (select (arr!15934 a!3235) #b00000000000000000000000000000000) Nil!9996) Nil!9996)))))

(assert (= (and d!80019 (not res!317706)) b!518920))

(assert (= (and b!518920 res!317707) b!518921))

(assert (= (and b!518920 res!317705) b!518922))

(assert (= (and b!518922 c!60903) b!518923))

(assert (= (and b!518922 (not c!60903)) b!518924))

(assert (= (or b!518923 b!518924) bm!31714))

(declare-fun m!500443 () Bool)

(assert (=> b!518920 m!500443))

(assert (=> b!518920 m!500443))

(declare-fun m!500445 () Bool)

(assert (=> b!518920 m!500445))

(assert (=> b!518921 m!500443))

(assert (=> b!518921 m!500443))

(declare-fun m!500447 () Bool)

(assert (=> b!518921 m!500447))

(assert (=> b!518922 m!500443))

(assert (=> b!518922 m!500443))

(assert (=> b!518922 m!500445))

(assert (=> bm!31714 m!500443))

(declare-fun m!500449 () Bool)

(assert (=> bm!31714 m!500449))

(assert (=> b!518747 d!80019))

(declare-fun d!80029 () Bool)

(assert (=> d!80029 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518752 d!80029))

(declare-fun d!80031 () Bool)

(declare-fun res!317712 () Bool)

(declare-fun e!302783 () Bool)

(assert (=> d!80031 (=> res!317712 e!302783)))

(assert (=> d!80031 (= res!317712 (= (select (arr!15934 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80031 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302783)))

(declare-fun b!518929 () Bool)

(declare-fun e!302784 () Bool)

(assert (=> b!518929 (= e!302783 e!302784)))

(declare-fun res!317713 () Bool)

(assert (=> b!518929 (=> (not res!317713) (not e!302784))))

(assert (=> b!518929 (= res!317713 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16298 a!3235)))))

(declare-fun b!518930 () Bool)

(assert (=> b!518930 (= e!302784 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80031 (not res!317712)) b!518929))

(assert (= (and b!518929 res!317713) b!518930))

(assert (=> d!80031 m!500443))

(declare-fun m!500451 () Bool)

(assert (=> b!518930 m!500451))

(assert (=> b!518746 d!80031))

(declare-fun b!518998 () Bool)

(declare-fun e!302821 () SeekEntryResult!4357)

(declare-fun lt!237662 () SeekEntryResult!4357)

(assert (=> b!518998 (= e!302821 (Found!4357 (index!19621 lt!237662)))))

(declare-fun b!518999 () Bool)

(declare-fun e!302822 () SeekEntryResult!4357)

(assert (=> b!518999 (= e!302822 (MissingZero!4357 (index!19621 lt!237662)))))

(declare-fun b!519000 () Bool)

(declare-fun e!302823 () SeekEntryResult!4357)

(assert (=> b!519000 (= e!302823 Undefined!4357)))

(declare-fun b!519001 () Bool)

(declare-fun c!60928 () Bool)

(declare-fun lt!237663 () (_ BitVec 64))

(assert (=> b!519001 (= c!60928 (= lt!237663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519001 (= e!302821 e!302822)))

(declare-fun b!519002 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33145 (_ BitVec 32)) SeekEntryResult!4357)

(assert (=> b!519002 (= e!302822 (seekKeyOrZeroReturnVacant!0 (x!48736 lt!237662) (index!19621 lt!237662) (index!19621 lt!237662) (select (arr!15934 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518997 () Bool)

(assert (=> b!518997 (= e!302823 e!302821)))

(assert (=> b!518997 (= lt!237663 (select (arr!15934 a!3235) (index!19621 lt!237662)))))

(declare-fun c!60930 () Bool)

(assert (=> b!518997 (= c!60930 (= lt!237663 (select (arr!15934 a!3235) j!176)))))

(declare-fun d!80033 () Bool)

(declare-fun lt!237661 () SeekEntryResult!4357)

(assert (=> d!80033 (and (or ((_ is Undefined!4357) lt!237661) (not ((_ is Found!4357) lt!237661)) (and (bvsge (index!19620 lt!237661) #b00000000000000000000000000000000) (bvslt (index!19620 lt!237661) (size!16298 a!3235)))) (or ((_ is Undefined!4357) lt!237661) ((_ is Found!4357) lt!237661) (not ((_ is MissingZero!4357) lt!237661)) (and (bvsge (index!19619 lt!237661) #b00000000000000000000000000000000) (bvslt (index!19619 lt!237661) (size!16298 a!3235)))) (or ((_ is Undefined!4357) lt!237661) ((_ is Found!4357) lt!237661) ((_ is MissingZero!4357) lt!237661) (not ((_ is MissingVacant!4357) lt!237661)) (and (bvsge (index!19622 lt!237661) #b00000000000000000000000000000000) (bvslt (index!19622 lt!237661) (size!16298 a!3235)))) (or ((_ is Undefined!4357) lt!237661) (ite ((_ is Found!4357) lt!237661) (= (select (arr!15934 a!3235) (index!19620 lt!237661)) (select (arr!15934 a!3235) j!176)) (ite ((_ is MissingZero!4357) lt!237661) (= (select (arr!15934 a!3235) (index!19619 lt!237661)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4357) lt!237661) (= (select (arr!15934 a!3235) (index!19622 lt!237661)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80033 (= lt!237661 e!302823)))

(declare-fun c!60929 () Bool)

(assert (=> d!80033 (= c!60929 (and ((_ is Intermediate!4357) lt!237662) (undefined!5169 lt!237662)))))

(assert (=> d!80033 (= lt!237662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15934 a!3235) j!176) mask!3524) (select (arr!15934 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80033 (validMask!0 mask!3524)))

(assert (=> d!80033 (= (seekEntryOrOpen!0 (select (arr!15934 a!3235) j!176) a!3235 mask!3524) lt!237661)))

(assert (= (and d!80033 c!60929) b!519000))

(assert (= (and d!80033 (not c!60929)) b!518997))

(assert (= (and b!518997 c!60930) b!518998))

(assert (= (and b!518997 (not c!60930)) b!519001))

(assert (= (and b!519001 c!60928) b!518999))

(assert (= (and b!519001 (not c!60928)) b!519002))

(assert (=> b!519002 m!500275))

(declare-fun m!500469 () Bool)

(assert (=> b!519002 m!500469))

(declare-fun m!500471 () Bool)

(assert (=> b!518997 m!500471))

(declare-fun m!500473 () Bool)

(assert (=> d!80033 m!500473))

(declare-fun m!500475 () Bool)

(assert (=> d!80033 m!500475))

(assert (=> d!80033 m!500291))

(assert (=> d!80033 m!500275))

(declare-fun m!500477 () Bool)

(assert (=> d!80033 m!500477))

(assert (=> d!80033 m!500275))

(assert (=> d!80033 m!500291))

(assert (=> d!80033 m!500305))

(declare-fun m!500479 () Bool)

(assert (=> d!80033 m!500479))

(assert (=> b!518743 d!80033))

(declare-fun d!80039 () Bool)

(declare-fun lt!237674 () (_ BitVec 32))

(declare-fun lt!237673 () (_ BitVec 32))

(assert (=> d!80039 (= lt!237674 (bvmul (bvxor lt!237673 (bvlshr lt!237673 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80039 (= lt!237673 ((_ extract 31 0) (bvand (bvxor (select (arr!15934 a!3235) j!176) (bvlshr (select (arr!15934 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80039 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317732 (let ((h!10909 ((_ extract 31 0) (bvand (bvxor (select (arr!15934 a!3235) j!176) (bvlshr (select (arr!15934 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48745 (bvmul (bvxor h!10909 (bvlshr h!10909 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48745 (bvlshr x!48745 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317732 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317732 #b00000000000000000000000000000000))))))

(assert (=> d!80039 (= (toIndex!0 (select (arr!15934 a!3235) j!176) mask!3524) (bvand (bvxor lt!237674 (bvlshr lt!237674 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518748 d!80039))

(declare-fun d!80047 () Bool)

(declare-fun lt!237676 () (_ BitVec 32))

(declare-fun lt!237675 () (_ BitVec 32))

(assert (=> d!80047 (= lt!237676 (bvmul (bvxor lt!237675 (bvlshr lt!237675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80047 (= lt!237675 ((_ extract 31 0) (bvand (bvxor lt!237543 (bvlshr lt!237543 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80047 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317732 (let ((h!10909 ((_ extract 31 0) (bvand (bvxor lt!237543 (bvlshr lt!237543 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48745 (bvmul (bvxor h!10909 (bvlshr h!10909 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48745 (bvlshr x!48745 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317732 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317732 #b00000000000000000000000000000000))))))

(assert (=> d!80047 (= (toIndex!0 lt!237543 mask!3524) (bvand (bvxor lt!237676 (bvlshr lt!237676 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518748 d!80047))

(declare-fun b!519040 () Bool)

(declare-fun e!302846 () Bool)

(declare-fun call!31720 () Bool)

(assert (=> b!519040 (= e!302846 call!31720)))

(declare-fun d!80049 () Bool)

(declare-fun res!317742 () Bool)

(declare-fun e!302847 () Bool)

(assert (=> d!80049 (=> res!317742 e!302847)))

(assert (=> d!80049 (= res!317742 (bvsge j!176 (size!16298 a!3235)))))

(assert (=> d!80049 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302847)))

(declare-fun b!519041 () Bool)

(declare-fun e!302848 () Bool)

(assert (=> b!519041 (= e!302846 e!302848)))

(declare-fun lt!237695 () (_ BitVec 64))

(assert (=> b!519041 (= lt!237695 (select (arr!15934 a!3235) j!176))))

(declare-fun lt!237694 () Unit!16039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33145 (_ BitVec 64) (_ BitVec 32)) Unit!16039)

(assert (=> b!519041 (= lt!237694 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237695 j!176))))

(assert (=> b!519041 (arrayContainsKey!0 a!3235 lt!237695 #b00000000000000000000000000000000)))

(declare-fun lt!237696 () Unit!16039)

(assert (=> b!519041 (= lt!237696 lt!237694)))

(declare-fun res!317743 () Bool)

(assert (=> b!519041 (= res!317743 (= (seekEntryOrOpen!0 (select (arr!15934 a!3235) j!176) a!3235 mask!3524) (Found!4357 j!176)))))

(assert (=> b!519041 (=> (not res!317743) (not e!302848))))

(declare-fun bm!31717 () Bool)

(assert (=> bm!31717 (= call!31720 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519042 () Bool)

(assert (=> b!519042 (= e!302847 e!302846)))

(declare-fun c!60945 () Bool)

(assert (=> b!519042 (= c!60945 (validKeyInArray!0 (select (arr!15934 a!3235) j!176)))))

(declare-fun b!519043 () Bool)

(assert (=> b!519043 (= e!302848 call!31720)))

(assert (= (and d!80049 (not res!317742)) b!519042))

(assert (= (and b!519042 c!60945) b!519041))

(assert (= (and b!519042 (not c!60945)) b!519040))

(assert (= (and b!519041 res!317743) b!519043))

(assert (= (or b!519043 b!519040) bm!31717))

(assert (=> b!519041 m!500275))

(declare-fun m!500507 () Bool)

(assert (=> b!519041 m!500507))

(declare-fun m!500509 () Bool)

(assert (=> b!519041 m!500509))

(assert (=> b!519041 m!500275))

(assert (=> b!519041 m!500277))

(declare-fun m!500511 () Bool)

(assert (=> bm!31717 m!500511))

(assert (=> b!519042 m!500275))

(assert (=> b!519042 m!500275))

(assert (=> b!519042 m!500283))

(assert (=> b!518748 d!80049))

(declare-fun b!519054 () Bool)

(declare-fun lt!237701 () SeekEntryResult!4357)

(assert (=> b!519054 (and (bvsge (index!19621 lt!237701) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237701) (size!16298 a!3235)))))

(declare-fun res!317750 () Bool)

(assert (=> b!519054 (= res!317750 (= (select (arr!15934 a!3235) (index!19621 lt!237701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302858 () Bool)

(assert (=> b!519054 (=> res!317750 e!302858)))

(declare-fun b!519055 () Bool)

(declare-fun e!302857 () Bool)

(declare-fun e!302855 () Bool)

(assert (=> b!519055 (= e!302857 e!302855)))

(declare-fun res!317749 () Bool)

(assert (=> b!519055 (= res!317749 (and ((_ is Intermediate!4357) lt!237701) (not (undefined!5169 lt!237701)) (bvslt (x!48736 lt!237701) #b01111111111111111111111111111110) (bvsge (x!48736 lt!237701) #b00000000000000000000000000000000) (bvsge (x!48736 lt!237701) #b00000000000000000000000000000000)))))

(assert (=> b!519055 (=> (not res!317749) (not e!302855))))

(declare-fun b!519056 () Bool)

(assert (=> b!519056 (= e!302857 (bvsge (x!48736 lt!237701) #b01111111111111111111111111111110))))

(declare-fun b!519057 () Bool)

(assert (=> b!519057 (and (bvsge (index!19621 lt!237701) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237701) (size!16298 a!3235)))))

(assert (=> b!519057 (= e!302858 (= (select (arr!15934 a!3235) (index!19621 lt!237701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519058 () Bool)

(declare-fun e!302856 () SeekEntryResult!4357)

(declare-fun e!302859 () SeekEntryResult!4357)

(assert (=> b!519058 (= e!302856 e!302859)))

(declare-fun c!60951 () Bool)

(declare-fun lt!237700 () (_ BitVec 64))

(assert (=> b!519058 (= c!60951 (or (= lt!237700 (select (arr!15934 a!3235) j!176)) (= (bvadd lt!237700 lt!237700) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519059 () Bool)

(assert (=> b!519059 (= e!302859 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15934 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519060 () Bool)

(assert (=> b!519060 (= e!302856 (Intermediate!4357 true lt!237544 #b00000000000000000000000000000000))))

(declare-fun b!519061 () Bool)

(assert (=> b!519061 (= e!302859 (Intermediate!4357 false lt!237544 #b00000000000000000000000000000000))))

(declare-fun b!519062 () Bool)

(assert (=> b!519062 (and (bvsge (index!19621 lt!237701) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237701) (size!16298 a!3235)))))

(declare-fun res!317748 () Bool)

(assert (=> b!519062 (= res!317748 (= (select (arr!15934 a!3235) (index!19621 lt!237701)) (select (arr!15934 a!3235) j!176)))))

(assert (=> b!519062 (=> res!317748 e!302858)))

(assert (=> b!519062 (= e!302855 e!302858)))

(declare-fun d!80057 () Bool)

(assert (=> d!80057 e!302857))

(declare-fun c!60950 () Bool)

(assert (=> d!80057 (= c!60950 (and ((_ is Intermediate!4357) lt!237701) (undefined!5169 lt!237701)))))

(assert (=> d!80057 (= lt!237701 e!302856)))

(declare-fun c!60949 () Bool)

(assert (=> d!80057 (= c!60949 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80057 (= lt!237700 (select (arr!15934 a!3235) lt!237544))))

(assert (=> d!80057 (validMask!0 mask!3524)))

(assert (=> d!80057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237544 (select (arr!15934 a!3235) j!176) a!3235 mask!3524) lt!237701)))

(assert (= (and d!80057 c!60949) b!519060))

(assert (= (and d!80057 (not c!60949)) b!519058))

(assert (= (and b!519058 c!60951) b!519061))

(assert (= (and b!519058 (not c!60951)) b!519059))

(assert (= (and d!80057 c!60950) b!519056))

(assert (= (and d!80057 (not c!60950)) b!519055))

(assert (= (and b!519055 res!317749) b!519062))

(assert (= (and b!519062 (not res!317748)) b!519054))

(assert (= (and b!519054 (not res!317750)) b!519057))

(assert (=> b!519059 m!500415))

(assert (=> b!519059 m!500415))

(assert (=> b!519059 m!500275))

(declare-fun m!500521 () Bool)

(assert (=> b!519059 m!500521))

(declare-fun m!500523 () Bool)

(assert (=> d!80057 m!500523))

(assert (=> d!80057 m!500305))

(declare-fun m!500525 () Bool)

(assert (=> b!519057 m!500525))

(assert (=> b!519062 m!500525))

(assert (=> b!519054 m!500525))

(assert (=> b!518748 d!80057))

(declare-fun d!80063 () Bool)

(assert (=> d!80063 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237710 () Unit!16039)

(declare-fun choose!38 (array!33145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16039)

(assert (=> d!80063 (= lt!237710 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80063 (validMask!0 mask!3524)))

(assert (=> d!80063 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237710)))

(declare-fun bs!16383 () Bool)

(assert (= bs!16383 d!80063))

(assert (=> bs!16383 m!500295))

(declare-fun m!500527 () Bool)

(assert (=> bs!16383 m!500527))

(assert (=> bs!16383 m!500305))

(assert (=> b!518748 d!80063))

(declare-fun b!519075 () Bool)

(declare-fun lt!237715 () SeekEntryResult!4357)

(assert (=> b!519075 (and (bvsge (index!19621 lt!237715) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237715) (size!16298 lt!237539)))))

(declare-fun res!317759 () Bool)

(assert (=> b!519075 (= res!317759 (= (select (arr!15934 lt!237539) (index!19621 lt!237715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302872 () Bool)

(assert (=> b!519075 (=> res!317759 e!302872)))

(declare-fun b!519076 () Bool)

(declare-fun e!302871 () Bool)

(declare-fun e!302869 () Bool)

(assert (=> b!519076 (= e!302871 e!302869)))

(declare-fun res!317758 () Bool)

(assert (=> b!519076 (= res!317758 (and ((_ is Intermediate!4357) lt!237715) (not (undefined!5169 lt!237715)) (bvslt (x!48736 lt!237715) #b01111111111111111111111111111110) (bvsge (x!48736 lt!237715) #b00000000000000000000000000000000) (bvsge (x!48736 lt!237715) #b00000000000000000000000000000000)))))

(assert (=> b!519076 (=> (not res!317758) (not e!302869))))

(declare-fun b!519077 () Bool)

(assert (=> b!519077 (= e!302871 (bvsge (x!48736 lt!237715) #b01111111111111111111111111111110))))

(declare-fun b!519078 () Bool)

(assert (=> b!519078 (and (bvsge (index!19621 lt!237715) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237715) (size!16298 lt!237539)))))

(assert (=> b!519078 (= e!302872 (= (select (arr!15934 lt!237539) (index!19621 lt!237715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519079 () Bool)

(declare-fun e!302870 () SeekEntryResult!4357)

(declare-fun e!302873 () SeekEntryResult!4357)

(assert (=> b!519079 (= e!302870 e!302873)))

(declare-fun c!60957 () Bool)

(declare-fun lt!237714 () (_ BitVec 64))

(assert (=> b!519079 (= c!60957 (or (= lt!237714 lt!237543) (= (bvadd lt!237714 lt!237714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519080 () Bool)

(assert (=> b!519080 (= e!302873 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!237543 lt!237539 mask!3524))))

(declare-fun b!519081 () Bool)

(assert (=> b!519081 (= e!302870 (Intermediate!4357 true lt!237545 #b00000000000000000000000000000000))))

(declare-fun b!519082 () Bool)

(assert (=> b!519082 (= e!302873 (Intermediate!4357 false lt!237545 #b00000000000000000000000000000000))))

(declare-fun b!519083 () Bool)

(assert (=> b!519083 (and (bvsge (index!19621 lt!237715) #b00000000000000000000000000000000) (bvslt (index!19621 lt!237715) (size!16298 lt!237539)))))

(declare-fun res!317757 () Bool)

(assert (=> b!519083 (= res!317757 (= (select (arr!15934 lt!237539) (index!19621 lt!237715)) lt!237543))))

(assert (=> b!519083 (=> res!317757 e!302872)))

(assert (=> b!519083 (= e!302869 e!302872)))

(declare-fun d!80065 () Bool)

(assert (=> d!80065 e!302871))

(declare-fun c!60956 () Bool)

(assert (=> d!80065 (= c!60956 (and ((_ is Intermediate!4357) lt!237715) (undefined!5169 lt!237715)))))

(assert (=> d!80065 (= lt!237715 e!302870)))

(declare-fun c!60955 () Bool)

(assert (=> d!80065 (= c!60955 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80065 (= lt!237714 (select (arr!15934 lt!237539) lt!237545))))

(assert (=> d!80065 (validMask!0 mask!3524)))

(assert (=> d!80065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237545 lt!237543 lt!237539 mask!3524) lt!237715)))

(assert (= (and d!80065 c!60955) b!519081))

(assert (= (and d!80065 (not c!60955)) b!519079))

(assert (= (and b!519079 c!60957) b!519082))

(assert (= (and b!519079 (not c!60957)) b!519080))

(assert (= (and d!80065 c!60956) b!519077))

(assert (= (and d!80065 (not c!60956)) b!519076))

(assert (= (and b!519076 res!317758) b!519083))

(assert (= (and b!519083 (not res!317757)) b!519075))

(assert (= (and b!519075 (not res!317759)) b!519078))

(declare-fun m!500541 () Bool)

(assert (=> b!519080 m!500541))

(assert (=> b!519080 m!500541))

(declare-fun m!500543 () Bool)

(assert (=> b!519080 m!500543))

(declare-fun m!500545 () Bool)

(assert (=> d!80065 m!500545))

(assert (=> d!80065 m!500305))

(declare-fun m!500547 () Bool)

(assert (=> b!519078 m!500547))

(assert (=> b!519083 m!500547))

(assert (=> b!519075 m!500547))

(assert (=> b!518748 d!80065))

(declare-fun b!519090 () Bool)

(declare-fun e!302877 () Bool)

(declare-fun call!31724 () Bool)

(assert (=> b!519090 (= e!302877 call!31724)))

(declare-fun d!80069 () Bool)

(declare-fun res!317760 () Bool)

(declare-fun e!302878 () Bool)

(assert (=> d!80069 (=> res!317760 e!302878)))

(assert (=> d!80069 (= res!317760 (bvsge #b00000000000000000000000000000000 (size!16298 a!3235)))))

(assert (=> d!80069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302878)))

(declare-fun b!519091 () Bool)

(declare-fun e!302879 () Bool)

(assert (=> b!519091 (= e!302877 e!302879)))

(declare-fun lt!237720 () (_ BitVec 64))

(assert (=> b!519091 (= lt!237720 (select (arr!15934 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237719 () Unit!16039)

(assert (=> b!519091 (= lt!237719 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237720 #b00000000000000000000000000000000))))

(assert (=> b!519091 (arrayContainsKey!0 a!3235 lt!237720 #b00000000000000000000000000000000)))

(declare-fun lt!237721 () Unit!16039)

(assert (=> b!519091 (= lt!237721 lt!237719)))

(declare-fun res!317761 () Bool)

(assert (=> b!519091 (= res!317761 (= (seekEntryOrOpen!0 (select (arr!15934 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4357 #b00000000000000000000000000000000)))))

(assert (=> b!519091 (=> (not res!317761) (not e!302879))))

(declare-fun bm!31721 () Bool)

(assert (=> bm!31721 (= call!31724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519092 () Bool)

(assert (=> b!519092 (= e!302878 e!302877)))

(declare-fun c!60961 () Bool)

(assert (=> b!519092 (= c!60961 (validKeyInArray!0 (select (arr!15934 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519093 () Bool)

(assert (=> b!519093 (= e!302879 call!31724)))

(assert (= (and d!80069 (not res!317760)) b!519092))

(assert (= (and b!519092 c!60961) b!519091))

(assert (= (and b!519092 (not c!60961)) b!519090))

(assert (= (and b!519091 res!317761) b!519093))

(assert (= (or b!519093 b!519090) bm!31721))

(assert (=> b!519091 m!500443))

(declare-fun m!500561 () Bool)

(assert (=> b!519091 m!500561))

(declare-fun m!500563 () Bool)

(assert (=> b!519091 m!500563))

(assert (=> b!519091 m!500443))

(declare-fun m!500565 () Bool)

(assert (=> b!519091 m!500565))

(declare-fun m!500567 () Bool)

(assert (=> bm!31721 m!500567))

(assert (=> b!519092 m!500443))

(assert (=> b!519092 m!500443))

(assert (=> b!519092 m!500445))

(assert (=> b!518739 d!80069))

(declare-fun b!519095 () Bool)

(declare-fun e!302880 () SeekEntryResult!4357)

(declare-fun lt!237723 () SeekEntryResult!4357)

(assert (=> b!519095 (= e!302880 (Found!4357 (index!19621 lt!237723)))))

(declare-fun b!519096 () Bool)

(declare-fun e!302881 () SeekEntryResult!4357)

(assert (=> b!519096 (= e!302881 (MissingZero!4357 (index!19621 lt!237723)))))

(declare-fun b!519097 () Bool)

(declare-fun e!302882 () SeekEntryResult!4357)

(assert (=> b!519097 (= e!302882 Undefined!4357)))

(declare-fun b!519098 () Bool)

(declare-fun c!60962 () Bool)

(declare-fun lt!237724 () (_ BitVec 64))

(assert (=> b!519098 (= c!60962 (= lt!237724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519098 (= e!302880 e!302881)))

(declare-fun b!519099 () Bool)

(assert (=> b!519099 (= e!302881 (seekKeyOrZeroReturnVacant!0 (x!48736 lt!237723) (index!19621 lt!237723) (index!19621 lt!237723) k0!2280 a!3235 mask!3524))))

(declare-fun b!519094 () Bool)

(assert (=> b!519094 (= e!302882 e!302880)))

(assert (=> b!519094 (= lt!237724 (select (arr!15934 a!3235) (index!19621 lt!237723)))))

(declare-fun c!60964 () Bool)

(assert (=> b!519094 (= c!60964 (= lt!237724 k0!2280))))

(declare-fun d!80073 () Bool)

(declare-fun lt!237722 () SeekEntryResult!4357)

(assert (=> d!80073 (and (or ((_ is Undefined!4357) lt!237722) (not ((_ is Found!4357) lt!237722)) (and (bvsge (index!19620 lt!237722) #b00000000000000000000000000000000) (bvslt (index!19620 lt!237722) (size!16298 a!3235)))) (or ((_ is Undefined!4357) lt!237722) ((_ is Found!4357) lt!237722) (not ((_ is MissingZero!4357) lt!237722)) (and (bvsge (index!19619 lt!237722) #b00000000000000000000000000000000) (bvslt (index!19619 lt!237722) (size!16298 a!3235)))) (or ((_ is Undefined!4357) lt!237722) ((_ is Found!4357) lt!237722) ((_ is MissingZero!4357) lt!237722) (not ((_ is MissingVacant!4357) lt!237722)) (and (bvsge (index!19622 lt!237722) #b00000000000000000000000000000000) (bvslt (index!19622 lt!237722) (size!16298 a!3235)))) (or ((_ is Undefined!4357) lt!237722) (ite ((_ is Found!4357) lt!237722) (= (select (arr!15934 a!3235) (index!19620 lt!237722)) k0!2280) (ite ((_ is MissingZero!4357) lt!237722) (= (select (arr!15934 a!3235) (index!19619 lt!237722)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4357) lt!237722) (= (select (arr!15934 a!3235) (index!19622 lt!237722)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80073 (= lt!237722 e!302882)))

(declare-fun c!60963 () Bool)

(assert (=> d!80073 (= c!60963 (and ((_ is Intermediate!4357) lt!237723) (undefined!5169 lt!237723)))))

(assert (=> d!80073 (= lt!237723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80073 (validMask!0 mask!3524)))

(assert (=> d!80073 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237722)))

(assert (= (and d!80073 c!60963) b!519097))

(assert (= (and d!80073 (not c!60963)) b!519094))

(assert (= (and b!519094 c!60964) b!519095))

(assert (= (and b!519094 (not c!60964)) b!519098))

(assert (= (and b!519098 c!60962) b!519096))

(assert (= (and b!519098 (not c!60962)) b!519099))

(declare-fun m!500569 () Bool)

(assert (=> b!519099 m!500569))

(declare-fun m!500571 () Bool)

(assert (=> b!519094 m!500571))

(declare-fun m!500573 () Bool)

(assert (=> d!80073 m!500573))

(declare-fun m!500575 () Bool)

(assert (=> d!80073 m!500575))

(declare-fun m!500577 () Bool)

(assert (=> d!80073 m!500577))

(declare-fun m!500579 () Bool)

(assert (=> d!80073 m!500579))

(assert (=> d!80073 m!500577))

(assert (=> d!80073 m!500305))

(declare-fun m!500581 () Bool)

(assert (=> d!80073 m!500581))

(assert (=> b!518744 d!80073))

(check-sat (not d!80063) (not b!519042) (not bm!31721) (not b!518922) (not d!80003) (not b!518930) (not d!80073) (not bm!31717) (not b!518920) (not b!518897) (not bm!31714) (not d!80007) (not d!80065) (not b!519099) (not b!519092) (not b!519059) (not d!80033) (not d!80057) (not b!519002) (not b!519041) (not b!519080) (not b!519091) (not b!518921) (not b!518839))
(check-sat)
