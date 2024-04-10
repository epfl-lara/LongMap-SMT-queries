; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45284 () Bool)

(assert start!45284)

(declare-fun b!497524 () Bool)

(declare-fun res!299907 () Bool)

(declare-fun e!291621 () Bool)

(assert (=> b!497524 (=> (not res!299907) (not e!291621))))

(declare-datatypes ((array!32172 0))(
  ( (array!32173 (arr!15469 (Array (_ BitVec 32) (_ BitVec 64))) (size!15833 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32172)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32172 (_ BitVec 32)) Bool)

(assert (=> b!497524 (= res!299907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497525 () Bool)

(declare-fun e!291622 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3936 0))(
  ( (MissingZero!3936 (index!17923 (_ BitVec 32))) (Found!3936 (index!17924 (_ BitVec 32))) (Intermediate!3936 (undefined!4748 Bool) (index!17925 (_ BitVec 32)) (x!46972 (_ BitVec 32))) (Undefined!3936) (MissingVacant!3936 (index!17926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32172 (_ BitVec 32)) SeekEntryResult!3936)

(assert (=> b!497525 (= e!291622 (= (seekEntryOrOpen!0 (select (arr!15469 a!3235) j!176) a!3235 mask!3524) (Found!3936 j!176)))))

(declare-fun b!497526 () Bool)

(declare-fun res!299908 () Bool)

(declare-fun e!291620 () Bool)

(assert (=> b!497526 (=> (not res!299908) (not e!291620))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497526 (= res!299908 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497527 () Bool)

(declare-datatypes ((Unit!14820 0))(
  ( (Unit!14821) )
))
(declare-fun e!291619 () Unit!14820)

(declare-fun Unit!14822 () Unit!14820)

(assert (=> b!497527 (= e!291619 Unit!14822)))

(declare-fun b!497528 () Bool)

(declare-fun res!299905 () Bool)

(assert (=> b!497528 (=> (not res!299905) (not e!291620))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497528 (= res!299905 (and (= (size!15833 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15833 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15833 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497529 () Bool)

(declare-fun e!291624 () Bool)

(assert (=> b!497529 (= e!291621 (not e!291624))))

(declare-fun res!299910 () Bool)

(assert (=> b!497529 (=> res!299910 e!291624)))

(declare-fun lt!225256 () SeekEntryResult!3936)

(declare-fun lt!225251 () (_ BitVec 64))

(declare-fun lt!225250 () array!32172)

(declare-fun lt!225254 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32172 (_ BitVec 32)) SeekEntryResult!3936)

(assert (=> b!497529 (= res!299910 (= lt!225256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225254 lt!225251 lt!225250 mask!3524)))))

(declare-fun lt!225248 () (_ BitVec 32))

(assert (=> b!497529 (= lt!225256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225248 (select (arr!15469 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497529 (= lt!225254 (toIndex!0 lt!225251 mask!3524))))

(assert (=> b!497529 (= lt!225251 (select (store (arr!15469 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497529 (= lt!225248 (toIndex!0 (select (arr!15469 a!3235) j!176) mask!3524))))

(assert (=> b!497529 (= lt!225250 (array!32173 (store (arr!15469 a!3235) i!1204 k0!2280) (size!15833 a!3235)))))

(assert (=> b!497529 e!291622))

(declare-fun res!299902 () Bool)

(assert (=> b!497529 (=> (not res!299902) (not e!291622))))

(assert (=> b!497529 (= res!299902 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225249 () Unit!14820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14820)

(assert (=> b!497529 (= lt!225249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!299903 () Bool)

(assert (=> start!45284 (=> (not res!299903) (not e!291620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45284 (= res!299903 (validMask!0 mask!3524))))

(assert (=> start!45284 e!291620))

(assert (=> start!45284 true))

(declare-fun array_inv!11265 (array!32172) Bool)

(assert (=> start!45284 (array_inv!11265 a!3235)))

(declare-fun b!497530 () Bool)

(declare-fun res!299911 () Bool)

(assert (=> b!497530 (=> (not res!299911) (not e!291620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497530 (= res!299911 (validKeyInArray!0 k0!2280))))

(declare-fun b!497531 () Bool)

(declare-fun Unit!14823 () Unit!14820)

(assert (=> b!497531 (= e!291619 Unit!14823)))

(declare-fun lt!225252 () Unit!14820)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32172 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14820)

(assert (=> b!497531 (= lt!225252 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225248 #b00000000000000000000000000000000 (index!17925 lt!225256) (x!46972 lt!225256) mask!3524))))

(declare-fun res!299912 () Bool)

(assert (=> b!497531 (= res!299912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225248 lt!225251 lt!225250 mask!3524) (Intermediate!3936 false (index!17925 lt!225256) (x!46972 lt!225256))))))

(declare-fun e!291618 () Bool)

(assert (=> b!497531 (=> (not res!299912) (not e!291618))))

(assert (=> b!497531 e!291618))

(declare-fun b!497532 () Bool)

(assert (=> b!497532 (= e!291620 e!291621)))

(declare-fun res!299904 () Bool)

(assert (=> b!497532 (=> (not res!299904) (not e!291621))))

(declare-fun lt!225253 () SeekEntryResult!3936)

(assert (=> b!497532 (= res!299904 (or (= lt!225253 (MissingZero!3936 i!1204)) (= lt!225253 (MissingVacant!3936 i!1204))))))

(assert (=> b!497532 (= lt!225253 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497533 () Bool)

(declare-fun res!299909 () Bool)

(assert (=> b!497533 (=> (not res!299909) (not e!291620))))

(assert (=> b!497533 (= res!299909 (validKeyInArray!0 (select (arr!15469 a!3235) j!176)))))

(declare-fun b!497534 () Bool)

(declare-fun res!299906 () Bool)

(assert (=> b!497534 (=> res!299906 e!291624)))

(get-info :version)

(assert (=> b!497534 (= res!299906 (or (undefined!4748 lt!225256) (not ((_ is Intermediate!3936) lt!225256))))))

(declare-fun b!497535 () Bool)

(assert (=> b!497535 (= e!291624 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!497535 (and (or (= (select (arr!15469 a!3235) (index!17925 lt!225256)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15469 a!3235) (index!17925 lt!225256)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15469 a!3235) (index!17925 lt!225256)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15469 a!3235) (index!17925 lt!225256)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225255 () Unit!14820)

(assert (=> b!497535 (= lt!225255 e!291619)))

(declare-fun c!59087 () Bool)

(assert (=> b!497535 (= c!59087 (= (select (arr!15469 a!3235) (index!17925 lt!225256)) (select (arr!15469 a!3235) j!176)))))

(assert (=> b!497535 (and (bvslt (x!46972 lt!225256) #b01111111111111111111111111111110) (or (= (select (arr!15469 a!3235) (index!17925 lt!225256)) (select (arr!15469 a!3235) j!176)) (= (select (arr!15469 a!3235) (index!17925 lt!225256)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15469 a!3235) (index!17925 lt!225256)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497536 () Bool)

(declare-fun res!299901 () Bool)

(assert (=> b!497536 (=> (not res!299901) (not e!291621))))

(declare-datatypes ((List!9627 0))(
  ( (Nil!9624) (Cons!9623 (h!10494 (_ BitVec 64)) (t!15855 List!9627)) )
))
(declare-fun arrayNoDuplicates!0 (array!32172 (_ BitVec 32) List!9627) Bool)

(assert (=> b!497536 (= res!299901 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9624))))

(declare-fun b!497537 () Bool)

(assert (=> b!497537 (= e!291618 false)))

(assert (= (and start!45284 res!299903) b!497528))

(assert (= (and b!497528 res!299905) b!497533))

(assert (= (and b!497533 res!299909) b!497530))

(assert (= (and b!497530 res!299911) b!497526))

(assert (= (and b!497526 res!299908) b!497532))

(assert (= (and b!497532 res!299904) b!497524))

(assert (= (and b!497524 res!299907) b!497536))

(assert (= (and b!497536 res!299901) b!497529))

(assert (= (and b!497529 res!299902) b!497525))

(assert (= (and b!497529 (not res!299910)) b!497534))

(assert (= (and b!497534 (not res!299906)) b!497535))

(assert (= (and b!497535 c!59087) b!497531))

(assert (= (and b!497535 (not c!59087)) b!497527))

(assert (= (and b!497531 res!299912) b!497537))

(declare-fun m!478911 () Bool)

(assert (=> b!497531 m!478911))

(declare-fun m!478913 () Bool)

(assert (=> b!497531 m!478913))

(declare-fun m!478915 () Bool)

(assert (=> b!497536 m!478915))

(declare-fun m!478917 () Bool)

(assert (=> b!497526 m!478917))

(declare-fun m!478919 () Bool)

(assert (=> b!497530 m!478919))

(declare-fun m!478921 () Bool)

(assert (=> b!497532 m!478921))

(declare-fun m!478923 () Bool)

(assert (=> start!45284 m!478923))

(declare-fun m!478925 () Bool)

(assert (=> start!45284 m!478925))

(declare-fun m!478927 () Bool)

(assert (=> b!497535 m!478927))

(declare-fun m!478929 () Bool)

(assert (=> b!497535 m!478929))

(declare-fun m!478931 () Bool)

(assert (=> b!497524 m!478931))

(assert (=> b!497529 m!478929))

(declare-fun m!478933 () Bool)

(assert (=> b!497529 m!478933))

(declare-fun m!478935 () Bool)

(assert (=> b!497529 m!478935))

(declare-fun m!478937 () Bool)

(assert (=> b!497529 m!478937))

(declare-fun m!478939 () Bool)

(assert (=> b!497529 m!478939))

(declare-fun m!478941 () Bool)

(assert (=> b!497529 m!478941))

(assert (=> b!497529 m!478929))

(declare-fun m!478943 () Bool)

(assert (=> b!497529 m!478943))

(declare-fun m!478945 () Bool)

(assert (=> b!497529 m!478945))

(assert (=> b!497529 m!478929))

(declare-fun m!478947 () Bool)

(assert (=> b!497529 m!478947))

(assert (=> b!497533 m!478929))

(assert (=> b!497533 m!478929))

(declare-fun m!478949 () Bool)

(assert (=> b!497533 m!478949))

(assert (=> b!497525 m!478929))

(assert (=> b!497525 m!478929))

(declare-fun m!478951 () Bool)

(assert (=> b!497525 m!478951))

(check-sat (not b!497525) (not b!497536) (not b!497533) (not b!497526) (not b!497529) (not start!45284) (not b!497532) (not b!497531) (not b!497524) (not b!497530))
(check-sat)
