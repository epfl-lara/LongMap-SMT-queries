; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47520 () Bool)

(assert start!47520)

(declare-fun b!522811 () Bool)

(declare-datatypes ((Unit!16306 0))(
  ( (Unit!16307) )
))
(declare-fun e!304911 () Unit!16306)

(declare-fun Unit!16308 () Unit!16306)

(assert (=> b!522811 (= e!304911 Unit!16308)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33293 0))(
  ( (array!33294 (arr!16001 (Array (_ BitVec 32) (_ BitVec 64))) (size!16366 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33293)

(declare-fun lt!239722 () Unit!16306)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239721 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4465 0))(
  ( (MissingZero!4465 (index!20066 (_ BitVec 32))) (Found!4465 (index!20067 (_ BitVec 32))) (Intermediate!4465 (undefined!5277 Bool) (index!20068 (_ BitVec 32)) (x!49055 (_ BitVec 32))) (Undefined!4465) (MissingVacant!4465 (index!20069 (_ BitVec 32))) )
))
(declare-fun lt!239718 () SeekEntryResult!4465)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16306)

(assert (=> b!522811 (= lt!239722 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239721 #b00000000000000000000000000000000 (index!20068 lt!239718) (x!49055 lt!239718) mask!3524))))

(declare-fun res!320370 () Bool)

(declare-fun lt!239720 () (_ BitVec 64))

(declare-fun lt!239714 () array!33293)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33293 (_ BitVec 32)) SeekEntryResult!4465)

(assert (=> b!522811 (= res!320370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239721 lt!239720 lt!239714 mask!3524) (Intermediate!4465 false (index!20068 lt!239718) (x!49055 lt!239718))))))

(declare-fun e!304909 () Bool)

(assert (=> b!522811 (=> (not res!320370) (not e!304909))))

(assert (=> b!522811 e!304909))

(declare-fun b!522812 () Bool)

(declare-fun e!304908 () Bool)

(declare-fun e!304913 () Bool)

(assert (=> b!522812 (= e!304908 e!304913)))

(declare-fun res!320361 () Bool)

(assert (=> b!522812 (=> (not res!320361) (not e!304913))))

(declare-fun lt!239719 () SeekEntryResult!4465)

(assert (=> b!522812 (= res!320361 (or (= lt!239719 (MissingZero!4465 i!1204)) (= lt!239719 (MissingVacant!4465 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33293 (_ BitVec 32)) SeekEntryResult!4465)

(assert (=> b!522812 (= lt!239719 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522813 () Bool)

(declare-fun e!304910 () Bool)

(assert (=> b!522813 (= e!304910 true)))

(assert (=> b!522813 (and (or (= (select (arr!16001 a!3235) (index!20068 lt!239718)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16001 a!3235) (index!20068 lt!239718)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16001 a!3235) (index!20068 lt!239718)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16001 a!3235) (index!20068 lt!239718)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239717 () Unit!16306)

(assert (=> b!522813 (= lt!239717 e!304911)))

(declare-fun c!61527 () Bool)

(assert (=> b!522813 (= c!61527 (= (select (arr!16001 a!3235) (index!20068 lt!239718)) (select (arr!16001 a!3235) j!176)))))

(assert (=> b!522813 (and (bvslt (x!49055 lt!239718) #b01111111111111111111111111111110) (or (= (select (arr!16001 a!3235) (index!20068 lt!239718)) (select (arr!16001 a!3235) j!176)) (= (select (arr!16001 a!3235) (index!20068 lt!239718)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16001 a!3235) (index!20068 lt!239718)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522814 () Bool)

(declare-fun res!320362 () Bool)

(assert (=> b!522814 (=> (not res!320362) (not e!304913))))

(declare-datatypes ((List!10198 0))(
  ( (Nil!10195) (Cons!10194 (h!11119 (_ BitVec 64)) (t!16417 List!10198)) )
))
(declare-fun arrayNoDuplicates!0 (array!33293 (_ BitVec 32) List!10198) Bool)

(assert (=> b!522814 (= res!320362 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10195))))

(declare-fun b!522815 () Bool)

(declare-fun res!320372 () Bool)

(assert (=> b!522815 (=> (not res!320372) (not e!304908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522815 (= res!320372 (validKeyInArray!0 (select (arr!16001 a!3235) j!176)))))

(declare-fun b!522816 () Bool)

(assert (=> b!522816 (= e!304913 (not e!304910))))

(declare-fun res!320368 () Bool)

(assert (=> b!522816 (=> res!320368 e!304910)))

(declare-fun lt!239716 () (_ BitVec 32))

(assert (=> b!522816 (= res!320368 (= lt!239718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239716 lt!239720 lt!239714 mask!3524)))))

(assert (=> b!522816 (= lt!239718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239721 (select (arr!16001 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522816 (= lt!239716 (toIndex!0 lt!239720 mask!3524))))

(assert (=> b!522816 (= lt!239720 (select (store (arr!16001 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522816 (= lt!239721 (toIndex!0 (select (arr!16001 a!3235) j!176) mask!3524))))

(assert (=> b!522816 (= lt!239714 (array!33294 (store (arr!16001 a!3235) i!1204 k0!2280) (size!16366 a!3235)))))

(declare-fun e!304912 () Bool)

(assert (=> b!522816 e!304912))

(declare-fun res!320369 () Bool)

(assert (=> b!522816 (=> (not res!320369) (not e!304912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33293 (_ BitVec 32)) Bool)

(assert (=> b!522816 (= res!320369 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239715 () Unit!16306)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16306)

(assert (=> b!522816 (= lt!239715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522817 () Bool)

(declare-fun res!320363 () Bool)

(assert (=> b!522817 (=> res!320363 e!304910)))

(get-info :version)

(assert (=> b!522817 (= res!320363 (or (undefined!5277 lt!239718) (not ((_ is Intermediate!4465) lt!239718))))))

(declare-fun b!522818 () Bool)

(declare-fun res!320364 () Bool)

(assert (=> b!522818 (=> (not res!320364) (not e!304908))))

(assert (=> b!522818 (= res!320364 (and (= (size!16366 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16366 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16366 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522819 () Bool)

(assert (=> b!522819 (= e!304912 (= (seekEntryOrOpen!0 (select (arr!16001 a!3235) j!176) a!3235 mask!3524) (Found!4465 j!176)))))

(declare-fun b!522810 () Bool)

(assert (=> b!522810 (= e!304909 false)))

(declare-fun res!320367 () Bool)

(assert (=> start!47520 (=> (not res!320367) (not e!304908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47520 (= res!320367 (validMask!0 mask!3524))))

(assert (=> start!47520 e!304908))

(assert (=> start!47520 true))

(declare-fun array_inv!11884 (array!33293) Bool)

(assert (=> start!47520 (array_inv!11884 a!3235)))

(declare-fun b!522820 () Bool)

(declare-fun res!320371 () Bool)

(assert (=> b!522820 (=> (not res!320371) (not e!304913))))

(assert (=> b!522820 (= res!320371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522821 () Bool)

(declare-fun Unit!16309 () Unit!16306)

(assert (=> b!522821 (= e!304911 Unit!16309)))

(declare-fun b!522822 () Bool)

(declare-fun res!320366 () Bool)

(assert (=> b!522822 (=> (not res!320366) (not e!304908))))

(assert (=> b!522822 (= res!320366 (validKeyInArray!0 k0!2280))))

(declare-fun b!522823 () Bool)

(declare-fun res!320365 () Bool)

(assert (=> b!522823 (=> (not res!320365) (not e!304908))))

(declare-fun arrayContainsKey!0 (array!33293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522823 (= res!320365 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47520 res!320367) b!522818))

(assert (= (and b!522818 res!320364) b!522815))

(assert (= (and b!522815 res!320372) b!522822))

(assert (= (and b!522822 res!320366) b!522823))

(assert (= (and b!522823 res!320365) b!522812))

(assert (= (and b!522812 res!320361) b!522820))

(assert (= (and b!522820 res!320371) b!522814))

(assert (= (and b!522814 res!320362) b!522816))

(assert (= (and b!522816 res!320369) b!522819))

(assert (= (and b!522816 (not res!320368)) b!522817))

(assert (= (and b!522817 (not res!320363)) b!522813))

(assert (= (and b!522813 c!61527) b!522811))

(assert (= (and b!522813 (not c!61527)) b!522821))

(assert (= (and b!522811 res!320370) b!522810))

(declare-fun m!503149 () Bool)

(assert (=> start!47520 m!503149))

(declare-fun m!503151 () Bool)

(assert (=> start!47520 m!503151))

(declare-fun m!503153 () Bool)

(assert (=> b!522820 m!503153))

(declare-fun m!503155 () Bool)

(assert (=> b!522811 m!503155))

(declare-fun m!503157 () Bool)

(assert (=> b!522811 m!503157))

(declare-fun m!503159 () Bool)

(assert (=> b!522812 m!503159))

(declare-fun m!503161 () Bool)

(assert (=> b!522823 m!503161))

(declare-fun m!503163 () Bool)

(assert (=> b!522816 m!503163))

(declare-fun m!503165 () Bool)

(assert (=> b!522816 m!503165))

(declare-fun m!503167 () Bool)

(assert (=> b!522816 m!503167))

(declare-fun m!503169 () Bool)

(assert (=> b!522816 m!503169))

(declare-fun m!503171 () Bool)

(assert (=> b!522816 m!503171))

(declare-fun m!503173 () Bool)

(assert (=> b!522816 m!503173))

(assert (=> b!522816 m!503171))

(declare-fun m!503175 () Bool)

(assert (=> b!522816 m!503175))

(declare-fun m!503177 () Bool)

(assert (=> b!522816 m!503177))

(assert (=> b!522816 m!503171))

(declare-fun m!503179 () Bool)

(assert (=> b!522816 m!503179))

(declare-fun m!503181 () Bool)

(assert (=> b!522814 m!503181))

(declare-fun m!503183 () Bool)

(assert (=> b!522813 m!503183))

(assert (=> b!522813 m!503171))

(assert (=> b!522819 m!503171))

(assert (=> b!522819 m!503171))

(declare-fun m!503185 () Bool)

(assert (=> b!522819 m!503185))

(assert (=> b!522815 m!503171))

(assert (=> b!522815 m!503171))

(declare-fun m!503187 () Bool)

(assert (=> b!522815 m!503187))

(declare-fun m!503189 () Bool)

(assert (=> b!522822 m!503189))

(check-sat (not b!522814) (not b!522816) (not b!522823) (not b!522812) (not b!522820) (not b!522822) (not start!47520) (not b!522811) (not b!522815) (not b!522819))
(check-sat)
