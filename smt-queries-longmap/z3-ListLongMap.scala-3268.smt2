; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45482 () Bool)

(assert start!45482)

(declare-fun res!302589 () Bool)

(declare-fun e!293406 () Bool)

(assert (=> start!45482 (=> (not res!302589) (not e!293406))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45482 (= res!302589 (validMask!0 mask!3524))))

(assert (=> start!45482 e!293406))

(assert (=> start!45482 true))

(declare-datatypes ((array!32307 0))(
  ( (array!32308 (arr!15535 (Array (_ BitVec 32) (_ BitVec 64))) (size!15899 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32307)

(declare-fun array_inv!11331 (array!32307) Bool)

(assert (=> start!45482 (array_inv!11331 a!3235)))

(declare-fun b!500808 () Bool)

(declare-fun res!302600 () Bool)

(assert (=> b!500808 (=> (not res!302600) (not e!293406))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500808 (= res!302600 (validKeyInArray!0 (select (arr!15535 a!3235) j!176)))))

(declare-fun b!500809 () Bool)

(declare-fun res!302594 () Bool)

(assert (=> b!500809 (=> (not res!302594) (not e!293406))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500809 (= res!302594 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500810 () Bool)

(declare-datatypes ((Unit!15084 0))(
  ( (Unit!15085) )
))
(declare-fun e!293400 () Unit!15084)

(declare-fun Unit!15086 () Unit!15084)

(assert (=> b!500810 (= e!293400 Unit!15086)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!227365 () Unit!15084)

(declare-fun lt!227361 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4002 0))(
  ( (MissingZero!4002 (index!18190 (_ BitVec 32))) (Found!4002 (index!18191 (_ BitVec 32))) (Intermediate!4002 (undefined!4814 Bool) (index!18192 (_ BitVec 32)) (x!47223 (_ BitVec 32))) (Undefined!4002) (MissingVacant!4002 (index!18193 (_ BitVec 32))) )
))
(declare-fun lt!227366 () SeekEntryResult!4002)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15084)

(assert (=> b!500810 (= lt!227365 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227361 #b00000000000000000000000000000000 (index!18192 lt!227366) (x!47223 lt!227366) mask!3524))))

(declare-fun lt!227359 () array!32307)

(declare-fun res!302591 () Bool)

(declare-fun lt!227364 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32307 (_ BitVec 32)) SeekEntryResult!4002)

(assert (=> b!500810 (= res!302591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227361 lt!227364 lt!227359 mask!3524) (Intermediate!4002 false (index!18192 lt!227366) (x!47223 lt!227366))))))

(declare-fun e!293403 () Bool)

(assert (=> b!500810 (=> (not res!302591) (not e!293403))))

(assert (=> b!500810 e!293403))

(declare-fun b!500811 () Bool)

(declare-fun Unit!15087 () Unit!15084)

(assert (=> b!500811 (= e!293400 Unit!15087)))

(declare-fun b!500812 () Bool)

(declare-fun e!293402 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32307 (_ BitVec 32)) SeekEntryResult!4002)

(assert (=> b!500812 (= e!293402 (= (seekEntryOrOpen!0 (select (arr!15535 a!3235) j!176) a!3235 mask!3524) (Found!4002 j!176)))))

(declare-fun b!500813 () Bool)

(declare-fun e!293404 () Bool)

(declare-fun e!293399 () Bool)

(assert (=> b!500813 (= e!293404 e!293399)))

(declare-fun res!302596 () Bool)

(assert (=> b!500813 (=> res!302596 e!293399)))

(assert (=> b!500813 (= res!302596 (or (bvsgt #b00000000000000000000000000000000 (x!47223 lt!227366)) (bvsgt (x!47223 lt!227366) #b01111111111111111111111111111110) (bvslt lt!227361 #b00000000000000000000000000000000) (bvsge lt!227361 (size!15899 a!3235)) (bvslt (index!18192 lt!227366) #b00000000000000000000000000000000) (bvsge (index!18192 lt!227366) (size!15899 a!3235)) (not (= lt!227366 (Intermediate!4002 false (index!18192 lt!227366) (x!47223 lt!227366))))))))

(assert (=> b!500813 (and (or (= (select (arr!15535 a!3235) (index!18192 lt!227366)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15535 a!3235) (index!18192 lt!227366)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15535 a!3235) (index!18192 lt!227366)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15535 a!3235) (index!18192 lt!227366)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227363 () Unit!15084)

(assert (=> b!500813 (= lt!227363 e!293400)))

(declare-fun c!59387 () Bool)

(assert (=> b!500813 (= c!59387 (= (select (arr!15535 a!3235) (index!18192 lt!227366)) (select (arr!15535 a!3235) j!176)))))

(assert (=> b!500813 (and (bvslt (x!47223 lt!227366) #b01111111111111111111111111111110) (or (= (select (arr!15535 a!3235) (index!18192 lt!227366)) (select (arr!15535 a!3235) j!176)) (= (select (arr!15535 a!3235) (index!18192 lt!227366)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15535 a!3235) (index!18192 lt!227366)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500814 () Bool)

(assert (=> b!500814 (= e!293403 false)))

(declare-fun b!500815 () Bool)

(declare-fun res!302599 () Bool)

(assert (=> b!500815 (=> (not res!302599) (not e!293406))))

(assert (=> b!500815 (= res!302599 (validKeyInArray!0 k0!2280))))

(declare-fun b!500816 () Bool)

(declare-fun res!302592 () Bool)

(assert (=> b!500816 (=> (not res!302592) (not e!293406))))

(assert (=> b!500816 (= res!302592 (and (= (size!15899 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15899 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15899 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500817 () Bool)

(declare-fun res!302593 () Bool)

(declare-fun e!293401 () Bool)

(assert (=> b!500817 (=> (not res!302593) (not e!293401))))

(declare-datatypes ((List!9693 0))(
  ( (Nil!9690) (Cons!9689 (h!10563 (_ BitVec 64)) (t!15921 List!9693)) )
))
(declare-fun arrayNoDuplicates!0 (array!32307 (_ BitVec 32) List!9693) Bool)

(assert (=> b!500817 (= res!302593 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9690))))

(declare-fun b!500818 () Bool)

(declare-fun res!302597 () Bool)

(assert (=> b!500818 (=> res!302597 e!293404)))

(get-info :version)

(assert (=> b!500818 (= res!302597 (or (undefined!4814 lt!227366) (not ((_ is Intermediate!4002) lt!227366))))))

(declare-fun b!500819 () Bool)

(assert (=> b!500819 (= e!293406 e!293401)))

(declare-fun res!302588 () Bool)

(assert (=> b!500819 (=> (not res!302588) (not e!293401))))

(declare-fun lt!227367 () SeekEntryResult!4002)

(assert (=> b!500819 (= res!302588 (or (= lt!227367 (MissingZero!4002 i!1204)) (= lt!227367 (MissingVacant!4002 i!1204))))))

(assert (=> b!500819 (= lt!227367 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500820 () Bool)

(assert (=> b!500820 (= e!293399 true)))

(declare-fun lt!227362 () SeekEntryResult!4002)

(assert (=> b!500820 (= lt!227362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227361 lt!227364 lt!227359 mask!3524))))

(declare-fun b!500821 () Bool)

(assert (=> b!500821 (= e!293401 (not e!293404))))

(declare-fun res!302590 () Bool)

(assert (=> b!500821 (=> res!302590 e!293404)))

(declare-fun lt!227360 () (_ BitVec 32))

(assert (=> b!500821 (= res!302590 (= lt!227366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227360 lt!227364 lt!227359 mask!3524)))))

(assert (=> b!500821 (= lt!227366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227361 (select (arr!15535 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500821 (= lt!227360 (toIndex!0 lt!227364 mask!3524))))

(assert (=> b!500821 (= lt!227364 (select (store (arr!15535 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500821 (= lt!227361 (toIndex!0 (select (arr!15535 a!3235) j!176) mask!3524))))

(assert (=> b!500821 (= lt!227359 (array!32308 (store (arr!15535 a!3235) i!1204 k0!2280) (size!15899 a!3235)))))

(assert (=> b!500821 e!293402))

(declare-fun res!302598 () Bool)

(assert (=> b!500821 (=> (not res!302598) (not e!293402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32307 (_ BitVec 32)) Bool)

(assert (=> b!500821 (= res!302598 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227368 () Unit!15084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15084)

(assert (=> b!500821 (= lt!227368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500822 () Bool)

(declare-fun res!302595 () Bool)

(assert (=> b!500822 (=> (not res!302595) (not e!293401))))

(assert (=> b!500822 (= res!302595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45482 res!302589) b!500816))

(assert (= (and b!500816 res!302592) b!500808))

(assert (= (and b!500808 res!302600) b!500815))

(assert (= (and b!500815 res!302599) b!500809))

(assert (= (and b!500809 res!302594) b!500819))

(assert (= (and b!500819 res!302588) b!500822))

(assert (= (and b!500822 res!302595) b!500817))

(assert (= (and b!500817 res!302593) b!500821))

(assert (= (and b!500821 res!302598) b!500812))

(assert (= (and b!500821 (not res!302590)) b!500818))

(assert (= (and b!500818 (not res!302597)) b!500813))

(assert (= (and b!500813 c!59387) b!500810))

(assert (= (and b!500813 (not c!59387)) b!500811))

(assert (= (and b!500810 res!302591) b!500814))

(assert (= (and b!500813 (not res!302596)) b!500820))

(declare-fun m!481917 () Bool)

(assert (=> b!500819 m!481917))

(declare-fun m!481919 () Bool)

(assert (=> b!500817 m!481919))

(declare-fun m!481921 () Bool)

(assert (=> start!45482 m!481921))

(declare-fun m!481923 () Bool)

(assert (=> start!45482 m!481923))

(declare-fun m!481925 () Bool)

(assert (=> b!500821 m!481925))

(declare-fun m!481927 () Bool)

(assert (=> b!500821 m!481927))

(declare-fun m!481929 () Bool)

(assert (=> b!500821 m!481929))

(declare-fun m!481931 () Bool)

(assert (=> b!500821 m!481931))

(declare-fun m!481933 () Bool)

(assert (=> b!500821 m!481933))

(assert (=> b!500821 m!481931))

(declare-fun m!481935 () Bool)

(assert (=> b!500821 m!481935))

(assert (=> b!500821 m!481931))

(declare-fun m!481937 () Bool)

(assert (=> b!500821 m!481937))

(declare-fun m!481939 () Bool)

(assert (=> b!500821 m!481939))

(declare-fun m!481941 () Bool)

(assert (=> b!500821 m!481941))

(assert (=> b!500812 m!481931))

(assert (=> b!500812 m!481931))

(declare-fun m!481943 () Bool)

(assert (=> b!500812 m!481943))

(declare-fun m!481945 () Bool)

(assert (=> b!500815 m!481945))

(declare-fun m!481947 () Bool)

(assert (=> b!500822 m!481947))

(declare-fun m!481949 () Bool)

(assert (=> b!500809 m!481949))

(declare-fun m!481951 () Bool)

(assert (=> b!500820 m!481951))

(declare-fun m!481953 () Bool)

(assert (=> b!500813 m!481953))

(assert (=> b!500813 m!481931))

(assert (=> b!500808 m!481931))

(assert (=> b!500808 m!481931))

(declare-fun m!481955 () Bool)

(assert (=> b!500808 m!481955))

(declare-fun m!481957 () Bool)

(assert (=> b!500810 m!481957))

(assert (=> b!500810 m!481951))

(check-sat (not b!500822) (not b!500810) (not b!500808) (not b!500819) (not b!500815) (not b!500821) (not start!45482) (not b!500809) (not b!500820) (not b!500817) (not b!500812))
(check-sat)
