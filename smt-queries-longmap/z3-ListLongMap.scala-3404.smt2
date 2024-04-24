; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47138 () Bool)

(assert start!47138)

(declare-fun b!519192 () Bool)

(declare-fun res!317828 () Bool)

(declare-fun e!302945 () Bool)

(assert (=> b!519192 (=> (not res!317828) (not e!302945))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519192 (= res!317828 (validKeyInArray!0 k0!2280))))

(declare-fun b!519193 () Bool)

(declare-fun e!302949 () Bool)

(assert (=> b!519193 (= e!302945 e!302949)))

(declare-fun res!317826 () Bool)

(assert (=> b!519193 (=> (not res!317826) (not e!302949))))

(declare-datatypes ((SeekEntryResult!4360 0))(
  ( (MissingZero!4360 (index!19634 (_ BitVec 32))) (Found!4360 (index!19635 (_ BitVec 32))) (Intermediate!4360 (undefined!5172 Bool) (index!19636 (_ BitVec 32)) (x!48756 (_ BitVec 32))) (Undefined!4360) (MissingVacant!4360 (index!19637 (_ BitVec 32))) )
))
(declare-fun lt!237764 () SeekEntryResult!4360)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519193 (= res!317826 (or (= lt!237764 (MissingZero!4360 i!1204)) (= lt!237764 (MissingVacant!4360 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33154 0))(
  ( (array!33155 (arr!15937 (Array (_ BitVec 32) (_ BitVec 64))) (size!16301 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33154)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33154 (_ BitVec 32)) SeekEntryResult!4360)

(assert (=> b!519193 (= lt!237764 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!519194 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!302947 () Bool)

(assert (=> b!519194 (= e!302947 (= (seekEntryOrOpen!0 (select (arr!15937 a!3235) j!176) a!3235 mask!3524) (Found!4360 j!176)))))

(declare-fun b!519195 () Bool)

(declare-fun e!302944 () Bool)

(assert (=> b!519195 (= e!302949 (not e!302944))))

(declare-fun res!317821 () Bool)

(assert (=> b!519195 (=> res!317821 e!302944)))

(declare-fun lt!237770 () (_ BitVec 32))

(declare-fun lt!237765 () (_ BitVec 64))

(declare-fun lt!237767 () array!33154)

(declare-fun lt!237772 () SeekEntryResult!4360)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33154 (_ BitVec 32)) SeekEntryResult!4360)

(assert (=> b!519195 (= res!317821 (= lt!237772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237770 lt!237765 lt!237767 mask!3524)))))

(declare-fun lt!237766 () (_ BitVec 32))

(assert (=> b!519195 (= lt!237772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237766 (select (arr!15937 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519195 (= lt!237770 (toIndex!0 lt!237765 mask!3524))))

(assert (=> b!519195 (= lt!237765 (select (store (arr!15937 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519195 (= lt!237766 (toIndex!0 (select (arr!15937 a!3235) j!176) mask!3524))))

(assert (=> b!519195 (= lt!237767 (array!33155 (store (arr!15937 a!3235) i!1204 k0!2280) (size!16301 a!3235)))))

(assert (=> b!519195 e!302947))

(declare-fun res!317819 () Bool)

(assert (=> b!519195 (=> (not res!317819) (not e!302947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33154 (_ BitVec 32)) Bool)

(assert (=> b!519195 (= res!317819 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16051 0))(
  ( (Unit!16052) )
))
(declare-fun lt!237768 () Unit!16051)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16051)

(assert (=> b!519195 (= lt!237768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519196 () Bool)

(declare-fun e!302946 () Unit!16051)

(declare-fun Unit!16053 () Unit!16051)

(assert (=> b!519196 (= e!302946 Unit!16053)))

(declare-fun res!317824 () Bool)

(assert (=> start!47138 (=> (not res!317824) (not e!302945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47138 (= res!317824 (validMask!0 mask!3524))))

(assert (=> start!47138 e!302945))

(assert (=> start!47138 true))

(declare-fun array_inv!11796 (array!33154) Bool)

(assert (=> start!47138 (array_inv!11796 a!3235)))

(declare-fun b!519197 () Bool)

(declare-fun res!317825 () Bool)

(assert (=> b!519197 (=> (not res!317825) (not e!302949))))

(assert (=> b!519197 (= res!317825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519198 () Bool)

(declare-fun res!317827 () Bool)

(assert (=> b!519198 (=> (not res!317827) (not e!302945))))

(assert (=> b!519198 (= res!317827 (and (= (size!16301 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16301 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16301 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519199 () Bool)

(declare-fun res!317823 () Bool)

(assert (=> b!519199 (=> res!317823 e!302944)))

(get-info :version)

(assert (=> b!519199 (= res!317823 (or (undefined!5172 lt!237772) (not ((_ is Intermediate!4360) lt!237772))))))

(declare-fun b!519200 () Bool)

(declare-fun res!317820 () Bool)

(assert (=> b!519200 (=> (not res!317820) (not e!302945))))

(declare-fun arrayContainsKey!0 (array!33154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519200 (= res!317820 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519201 () Bool)

(declare-fun res!317829 () Bool)

(assert (=> b!519201 (=> (not res!317829) (not e!302949))))

(declare-datatypes ((List!10002 0))(
  ( (Nil!9999) (Cons!9998 (h!10911 (_ BitVec 64)) (t!16222 List!10002)) )
))
(declare-fun arrayNoDuplicates!0 (array!33154 (_ BitVec 32) List!10002) Bool)

(assert (=> b!519201 (= res!317829 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9999))))

(declare-fun b!519202 () Bool)

(declare-fun Unit!16054 () Unit!16051)

(assert (=> b!519202 (= e!302946 Unit!16054)))

(declare-fun lt!237769 () Unit!16051)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33154 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16051)

(assert (=> b!519202 (= lt!237769 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237766 #b00000000000000000000000000000000 (index!19636 lt!237772) (x!48756 lt!237772) mask!3524))))

(declare-fun res!317822 () Bool)

(assert (=> b!519202 (= res!317822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237766 lt!237765 lt!237767 mask!3524) (Intermediate!4360 false (index!19636 lt!237772) (x!48756 lt!237772))))))

(declare-fun e!302943 () Bool)

(assert (=> b!519202 (=> (not res!317822) (not e!302943))))

(assert (=> b!519202 e!302943))

(declare-fun b!519203 () Bool)

(assert (=> b!519203 (= e!302944 (or (= (select (arr!15937 a!3235) (index!19636 lt!237772)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15937 a!3235) (index!19636 lt!237772)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237771 () Unit!16051)

(assert (=> b!519203 (= lt!237771 e!302946)))

(declare-fun c!60983 () Bool)

(assert (=> b!519203 (= c!60983 (= (select (arr!15937 a!3235) (index!19636 lt!237772)) (select (arr!15937 a!3235) j!176)))))

(assert (=> b!519203 (and (bvslt (x!48756 lt!237772) #b01111111111111111111111111111110) (or (= (select (arr!15937 a!3235) (index!19636 lt!237772)) (select (arr!15937 a!3235) j!176)) (= (select (arr!15937 a!3235) (index!19636 lt!237772)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15937 a!3235) (index!19636 lt!237772)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519204 () Bool)

(assert (=> b!519204 (= e!302943 false)))

(declare-fun b!519205 () Bool)

(declare-fun res!317830 () Bool)

(assert (=> b!519205 (=> (not res!317830) (not e!302945))))

(assert (=> b!519205 (= res!317830 (validKeyInArray!0 (select (arr!15937 a!3235) j!176)))))

(assert (= (and start!47138 res!317824) b!519198))

(assert (= (and b!519198 res!317827) b!519205))

(assert (= (and b!519205 res!317830) b!519192))

(assert (= (and b!519192 res!317828) b!519200))

(assert (= (and b!519200 res!317820) b!519193))

(assert (= (and b!519193 res!317826) b!519197))

(assert (= (and b!519197 res!317825) b!519201))

(assert (= (and b!519201 res!317829) b!519195))

(assert (= (and b!519195 res!317819) b!519194))

(assert (= (and b!519195 (not res!317821)) b!519199))

(assert (= (and b!519199 (not res!317823)) b!519203))

(assert (= (and b!519203 c!60983) b!519202))

(assert (= (and b!519203 (not c!60983)) b!519196))

(assert (= (and b!519202 res!317822) b!519204))

(declare-fun m!500629 () Bool)

(assert (=> b!519195 m!500629))

(declare-fun m!500631 () Bool)

(assert (=> b!519195 m!500631))

(declare-fun m!500633 () Bool)

(assert (=> b!519195 m!500633))

(declare-fun m!500635 () Bool)

(assert (=> b!519195 m!500635))

(declare-fun m!500637 () Bool)

(assert (=> b!519195 m!500637))

(declare-fun m!500639 () Bool)

(assert (=> b!519195 m!500639))

(assert (=> b!519195 m!500637))

(assert (=> b!519195 m!500637))

(declare-fun m!500641 () Bool)

(assert (=> b!519195 m!500641))

(declare-fun m!500643 () Bool)

(assert (=> b!519195 m!500643))

(declare-fun m!500645 () Bool)

(assert (=> b!519195 m!500645))

(assert (=> b!519194 m!500637))

(assert (=> b!519194 m!500637))

(declare-fun m!500647 () Bool)

(assert (=> b!519194 m!500647))

(declare-fun m!500649 () Bool)

(assert (=> b!519202 m!500649))

(declare-fun m!500651 () Bool)

(assert (=> b!519202 m!500651))

(declare-fun m!500653 () Bool)

(assert (=> b!519193 m!500653))

(declare-fun m!500655 () Bool)

(assert (=> b!519201 m!500655))

(assert (=> b!519205 m!500637))

(assert (=> b!519205 m!500637))

(declare-fun m!500657 () Bool)

(assert (=> b!519205 m!500657))

(declare-fun m!500659 () Bool)

(assert (=> b!519192 m!500659))

(declare-fun m!500661 () Bool)

(assert (=> b!519200 m!500661))

(declare-fun m!500663 () Bool)

(assert (=> start!47138 m!500663))

(declare-fun m!500665 () Bool)

(assert (=> start!47138 m!500665))

(declare-fun m!500667 () Bool)

(assert (=> b!519203 m!500667))

(assert (=> b!519203 m!500637))

(declare-fun m!500669 () Bool)

(assert (=> b!519197 m!500669))

(check-sat (not b!519197) (not b!519194) (not b!519195) (not b!519205) (not b!519193) (not b!519201) (not b!519192) (not start!47138) (not b!519202) (not b!519200))
(check-sat)
