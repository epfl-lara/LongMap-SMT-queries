; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45230 () Bool)

(assert start!45230)

(declare-fun b!496618 () Bool)

(declare-fun e!291207 () Bool)

(declare-fun e!291203 () Bool)

(assert (=> b!496618 (= e!291207 (not e!291203))))

(declare-fun res!299005 () Bool)

(assert (=> b!496618 (=> res!299005 e!291203)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32118 0))(
  ( (array!32119 (arr!15442 (Array (_ BitVec 32) (_ BitVec 64))) (size!15806 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32118)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224825 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3909 0))(
  ( (MissingZero!3909 (index!17815 (_ BitVec 32))) (Found!3909 (index!17816 (_ BitVec 32))) (Intermediate!3909 (undefined!4721 Bool) (index!17817 (_ BitVec 32)) (x!46873 (_ BitVec 32))) (Undefined!3909) (MissingVacant!3909 (index!17818 (_ BitVec 32))) )
))
(declare-fun lt!224826 () SeekEntryResult!3909)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32118 (_ BitVec 32)) SeekEntryResult!3909)

(assert (=> b!496618 (= res!299005 (= lt!224826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224825 (select (store (arr!15442 a!3235) i!1204 k0!2280) j!176) (array!32119 (store (arr!15442 a!3235) i!1204 k0!2280) (size!15806 a!3235)) mask!3524)))))

(declare-fun lt!224823 () (_ BitVec 32))

(assert (=> b!496618 (= lt!224826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224823 (select (arr!15442 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496618 (= lt!224825 (toIndex!0 (select (store (arr!15442 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496618 (= lt!224823 (toIndex!0 (select (arr!15442 a!3235) j!176) mask!3524))))

(declare-fun e!291205 () Bool)

(assert (=> b!496618 e!291205))

(declare-fun res!299007 () Bool)

(assert (=> b!496618 (=> (not res!299007) (not e!291205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32118 (_ BitVec 32)) Bool)

(assert (=> b!496618 (= res!299007 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14764 0))(
  ( (Unit!14765) )
))
(declare-fun lt!224827 () Unit!14764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14764)

(assert (=> b!496618 (= lt!224827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496619 () Bool)

(declare-fun res!299012 () Bool)

(declare-fun e!291204 () Bool)

(assert (=> b!496619 (=> (not res!299012) (not e!291204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496619 (= res!299012 (validKeyInArray!0 (select (arr!15442 a!3235) j!176)))))

(declare-fun b!496620 () Bool)

(declare-fun res!299011 () Bool)

(assert (=> b!496620 (=> (not res!299011) (not e!291207))))

(assert (=> b!496620 (= res!299011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!299015 () Bool)

(assert (=> start!45230 (=> (not res!299015) (not e!291204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45230 (= res!299015 (validMask!0 mask!3524))))

(assert (=> start!45230 e!291204))

(assert (=> start!45230 true))

(declare-fun array_inv!11238 (array!32118) Bool)

(assert (=> start!45230 (array_inv!11238 a!3235)))

(declare-fun b!496621 () Bool)

(declare-fun res!299010 () Bool)

(assert (=> b!496621 (=> (not res!299010) (not e!291207))))

(declare-datatypes ((List!9600 0))(
  ( (Nil!9597) (Cons!9596 (h!10467 (_ BitVec 64)) (t!15828 List!9600)) )
))
(declare-fun arrayNoDuplicates!0 (array!32118 (_ BitVec 32) List!9600) Bool)

(assert (=> b!496621 (= res!299010 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9597))))

(declare-fun b!496622 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32118 (_ BitVec 32)) SeekEntryResult!3909)

(assert (=> b!496622 (= e!291205 (= (seekEntryOrOpen!0 (select (arr!15442 a!3235) j!176) a!3235 mask!3524) (Found!3909 j!176)))))

(declare-fun b!496623 () Bool)

(declare-fun res!299008 () Bool)

(assert (=> b!496623 (=> (not res!299008) (not e!291204))))

(declare-fun arrayContainsKey!0 (array!32118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496623 (= res!299008 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496624 () Bool)

(declare-fun res!299009 () Bool)

(assert (=> b!496624 (=> res!299009 e!291203)))

(get-info :version)

(assert (=> b!496624 (= res!299009 (or (undefined!4721 lt!224826) (not ((_ is Intermediate!3909) lt!224826))))))

(declare-fun b!496625 () Bool)

(assert (=> b!496625 (= e!291204 e!291207)))

(declare-fun res!299014 () Bool)

(assert (=> b!496625 (=> (not res!299014) (not e!291207))))

(declare-fun lt!224824 () SeekEntryResult!3909)

(assert (=> b!496625 (= res!299014 (or (= lt!224824 (MissingZero!3909 i!1204)) (= lt!224824 (MissingVacant!3909 i!1204))))))

(assert (=> b!496625 (= lt!224824 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496626 () Bool)

(declare-fun res!299006 () Bool)

(assert (=> b!496626 (=> (not res!299006) (not e!291204))))

(assert (=> b!496626 (= res!299006 (validKeyInArray!0 k0!2280))))

(declare-fun b!496627 () Bool)

(declare-fun res!299013 () Bool)

(assert (=> b!496627 (=> (not res!299013) (not e!291204))))

(assert (=> b!496627 (= res!299013 (and (= (size!15806 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15806 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15806 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496628 () Bool)

(assert (=> b!496628 (= e!291203 true)))

(assert (=> b!496628 (and (bvslt (x!46873 lt!224826) #b01111111111111111111111111111110) (or (= (select (arr!15442 a!3235) (index!17817 lt!224826)) (select (arr!15442 a!3235) j!176)) (= (select (arr!15442 a!3235) (index!17817 lt!224826)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15442 a!3235) (index!17817 lt!224826)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45230 res!299015) b!496627))

(assert (= (and b!496627 res!299013) b!496619))

(assert (= (and b!496619 res!299012) b!496626))

(assert (= (and b!496626 res!299006) b!496623))

(assert (= (and b!496623 res!299008) b!496625))

(assert (= (and b!496625 res!299014) b!496620))

(assert (= (and b!496620 res!299011) b!496621))

(assert (= (and b!496621 res!299010) b!496618))

(assert (= (and b!496618 res!299007) b!496622))

(assert (= (and b!496618 (not res!299005)) b!496624))

(assert (= (and b!496624 (not res!299009)) b!496628))

(declare-fun m!477881 () Bool)

(assert (=> b!496619 m!477881))

(assert (=> b!496619 m!477881))

(declare-fun m!477883 () Bool)

(assert (=> b!496619 m!477883))

(declare-fun m!477885 () Bool)

(assert (=> b!496628 m!477885))

(assert (=> b!496628 m!477881))

(declare-fun m!477887 () Bool)

(assert (=> b!496623 m!477887))

(declare-fun m!477889 () Bool)

(assert (=> b!496621 m!477889))

(assert (=> b!496622 m!477881))

(assert (=> b!496622 m!477881))

(declare-fun m!477891 () Bool)

(assert (=> b!496622 m!477891))

(declare-fun m!477893 () Bool)

(assert (=> b!496626 m!477893))

(declare-fun m!477895 () Bool)

(assert (=> b!496620 m!477895))

(declare-fun m!477897 () Bool)

(assert (=> b!496625 m!477897))

(declare-fun m!477899 () Bool)

(assert (=> b!496618 m!477899))

(declare-fun m!477901 () Bool)

(assert (=> b!496618 m!477901))

(declare-fun m!477903 () Bool)

(assert (=> b!496618 m!477903))

(declare-fun m!477905 () Bool)

(assert (=> b!496618 m!477905))

(assert (=> b!496618 m!477903))

(declare-fun m!477907 () Bool)

(assert (=> b!496618 m!477907))

(assert (=> b!496618 m!477881))

(declare-fun m!477909 () Bool)

(assert (=> b!496618 m!477909))

(assert (=> b!496618 m!477881))

(declare-fun m!477911 () Bool)

(assert (=> b!496618 m!477911))

(assert (=> b!496618 m!477903))

(declare-fun m!477913 () Bool)

(assert (=> b!496618 m!477913))

(assert (=> b!496618 m!477881))

(declare-fun m!477915 () Bool)

(assert (=> start!45230 m!477915))

(declare-fun m!477917 () Bool)

(assert (=> start!45230 m!477917))

(check-sat (not b!496623) (not start!45230) (not b!496622) (not b!496621) (not b!496626) (not b!496620) (not b!496625) (not b!496618) (not b!496619))
(check-sat)
