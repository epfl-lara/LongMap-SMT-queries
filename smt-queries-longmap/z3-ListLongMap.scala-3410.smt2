; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47372 () Bool)

(assert start!47372)

(declare-fun b!520929 () Bool)

(declare-fun res!318852 () Bool)

(declare-fun e!303956 () Bool)

(assert (=> b!520929 (=> (not res!318852) (not e!303956))))

(declare-datatypes ((array!33199 0))(
  ( (array!33200 (arr!15955 (Array (_ BitVec 32) (_ BitVec 64))) (size!16319 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33199)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520929 (= res!318852 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520930 () Bool)

(declare-fun e!303951 () Bool)

(assert (=> b!520930 (= e!303951 false)))

(declare-fun b!520931 () Bool)

(declare-fun e!303955 () Bool)

(declare-fun e!303957 () Bool)

(assert (=> b!520931 (= e!303955 (not e!303957))))

(declare-fun res!318856 () Bool)

(assert (=> b!520931 (=> res!318856 e!303957)))

(declare-datatypes ((SeekEntryResult!4378 0))(
  ( (MissingZero!4378 (index!19715 (_ BitVec 32))) (Found!4378 (index!19716 (_ BitVec 32))) (Intermediate!4378 (undefined!5190 Bool) (index!19717 (_ BitVec 32)) (x!48849 (_ BitVec 32))) (Undefined!4378) (MissingVacant!4378 (index!19718 (_ BitVec 32))) )
))
(declare-fun lt!238682 () SeekEntryResult!4378)

(declare-fun lt!238685 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!238686 () (_ BitVec 64))

(declare-fun lt!238689 () array!33199)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33199 (_ BitVec 32)) SeekEntryResult!4378)

(assert (=> b!520931 (= res!318856 (= lt!238682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238685 lt!238686 lt!238689 mask!3524)))))

(declare-fun lt!238688 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520931 (= lt!238682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238688 (select (arr!15955 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520931 (= lt!238685 (toIndex!0 lt!238686 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520931 (= lt!238686 (select (store (arr!15955 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520931 (= lt!238688 (toIndex!0 (select (arr!15955 a!3235) j!176) mask!3524))))

(assert (=> b!520931 (= lt!238689 (array!33200 (store (arr!15955 a!3235) i!1204 k0!2280) (size!16319 a!3235)))))

(declare-fun e!303954 () Bool)

(assert (=> b!520931 e!303954))

(declare-fun res!318855 () Bool)

(assert (=> b!520931 (=> (not res!318855) (not e!303954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33199 (_ BitVec 32)) Bool)

(assert (=> b!520931 (= res!318855 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16123 0))(
  ( (Unit!16124) )
))
(declare-fun lt!238684 () Unit!16123)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16123)

(assert (=> b!520931 (= lt!238684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520932 () Bool)

(assert (=> b!520932 (= e!303957 true)))

(assert (=> b!520932 (and (or (= (select (arr!15955 a!3235) (index!19717 lt!238682)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15955 a!3235) (index!19717 lt!238682)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15955 a!3235) (index!19717 lt!238682)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15955 a!3235) (index!19717 lt!238682)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238687 () Unit!16123)

(declare-fun e!303952 () Unit!16123)

(assert (=> b!520932 (= lt!238687 e!303952)))

(declare-fun c!61343 () Bool)

(assert (=> b!520932 (= c!61343 (= (select (arr!15955 a!3235) (index!19717 lt!238682)) (select (arr!15955 a!3235) j!176)))))

(assert (=> b!520932 (and (bvslt (x!48849 lt!238682) #b01111111111111111111111111111110) (or (= (select (arr!15955 a!3235) (index!19717 lt!238682)) (select (arr!15955 a!3235) j!176)) (= (select (arr!15955 a!3235) (index!19717 lt!238682)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15955 a!3235) (index!19717 lt!238682)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520933 () Bool)

(declare-fun res!318848 () Bool)

(assert (=> b!520933 (=> (not res!318848) (not e!303956))))

(assert (=> b!520933 (= res!318848 (and (= (size!16319 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16319 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16319 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520934 () Bool)

(declare-fun res!318850 () Bool)

(assert (=> b!520934 (=> (not res!318850) (not e!303956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520934 (= res!318850 (validKeyInArray!0 (select (arr!15955 a!3235) j!176)))))

(declare-fun b!520935 () Bool)

(declare-fun res!318846 () Bool)

(assert (=> b!520935 (=> (not res!318846) (not e!303955))))

(declare-datatypes ((List!10020 0))(
  ( (Nil!10017) (Cons!10016 (h!10938 (_ BitVec 64)) (t!16240 List!10020)) )
))
(declare-fun arrayNoDuplicates!0 (array!33199 (_ BitVec 32) List!10020) Bool)

(assert (=> b!520935 (= res!318846 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10017))))

(declare-fun b!520936 () Bool)

(declare-fun res!318849 () Bool)

(assert (=> b!520936 (=> res!318849 e!303957)))

(get-info :version)

(assert (=> b!520936 (= res!318849 (or (undefined!5190 lt!238682) (not ((_ is Intermediate!4378) lt!238682))))))

(declare-fun res!318854 () Bool)

(assert (=> start!47372 (=> (not res!318854) (not e!303956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47372 (= res!318854 (validMask!0 mask!3524))))

(assert (=> start!47372 e!303956))

(assert (=> start!47372 true))

(declare-fun array_inv!11814 (array!33199) Bool)

(assert (=> start!47372 (array_inv!11814 a!3235)))

(declare-fun b!520937 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33199 (_ BitVec 32)) SeekEntryResult!4378)

(assert (=> b!520937 (= e!303954 (= (seekEntryOrOpen!0 (select (arr!15955 a!3235) j!176) a!3235 mask!3524) (Found!4378 j!176)))))

(declare-fun b!520938 () Bool)

(declare-fun res!318851 () Bool)

(assert (=> b!520938 (=> (not res!318851) (not e!303956))))

(assert (=> b!520938 (= res!318851 (validKeyInArray!0 k0!2280))))

(declare-fun b!520939 () Bool)

(declare-fun Unit!16125 () Unit!16123)

(assert (=> b!520939 (= e!303952 Unit!16125)))

(declare-fun b!520940 () Bool)

(declare-fun Unit!16126 () Unit!16123)

(assert (=> b!520940 (= e!303952 Unit!16126)))

(declare-fun lt!238690 () Unit!16123)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16123)

(assert (=> b!520940 (= lt!238690 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238688 #b00000000000000000000000000000000 (index!19717 lt!238682) (x!48849 lt!238682) mask!3524))))

(declare-fun res!318845 () Bool)

(assert (=> b!520940 (= res!318845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238688 lt!238686 lt!238689 mask!3524) (Intermediate!4378 false (index!19717 lt!238682) (x!48849 lt!238682))))))

(assert (=> b!520940 (=> (not res!318845) (not e!303951))))

(assert (=> b!520940 e!303951))

(declare-fun b!520941 () Bool)

(declare-fun res!318853 () Bool)

(assert (=> b!520941 (=> (not res!318853) (not e!303955))))

(assert (=> b!520941 (= res!318853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520942 () Bool)

(assert (=> b!520942 (= e!303956 e!303955)))

(declare-fun res!318847 () Bool)

(assert (=> b!520942 (=> (not res!318847) (not e!303955))))

(declare-fun lt!238683 () SeekEntryResult!4378)

(assert (=> b!520942 (= res!318847 (or (= lt!238683 (MissingZero!4378 i!1204)) (= lt!238683 (MissingVacant!4378 i!1204))))))

(assert (=> b!520942 (= lt!238683 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47372 res!318854) b!520933))

(assert (= (and b!520933 res!318848) b!520934))

(assert (= (and b!520934 res!318850) b!520938))

(assert (= (and b!520938 res!318851) b!520929))

(assert (= (and b!520929 res!318852) b!520942))

(assert (= (and b!520942 res!318847) b!520941))

(assert (= (and b!520941 res!318853) b!520935))

(assert (= (and b!520935 res!318846) b!520931))

(assert (= (and b!520931 res!318855) b!520937))

(assert (= (and b!520931 (not res!318856)) b!520936))

(assert (= (and b!520936 (not res!318849)) b!520932))

(assert (= (and b!520932 c!61343) b!520940))

(assert (= (and b!520932 (not c!61343)) b!520939))

(assert (= (and b!520940 res!318845) b!520930))

(declare-fun m!502087 () Bool)

(assert (=> b!520932 m!502087))

(declare-fun m!502089 () Bool)

(assert (=> b!520932 m!502089))

(declare-fun m!502091 () Bool)

(assert (=> b!520929 m!502091))

(declare-fun m!502093 () Bool)

(assert (=> b!520941 m!502093))

(assert (=> b!520937 m!502089))

(assert (=> b!520937 m!502089))

(declare-fun m!502095 () Bool)

(assert (=> b!520937 m!502095))

(declare-fun m!502097 () Bool)

(assert (=> b!520931 m!502097))

(declare-fun m!502099 () Bool)

(assert (=> b!520931 m!502099))

(declare-fun m!502101 () Bool)

(assert (=> b!520931 m!502101))

(assert (=> b!520931 m!502089))

(declare-fun m!502103 () Bool)

(assert (=> b!520931 m!502103))

(declare-fun m!502105 () Bool)

(assert (=> b!520931 m!502105))

(assert (=> b!520931 m!502089))

(declare-fun m!502107 () Bool)

(assert (=> b!520931 m!502107))

(assert (=> b!520931 m!502089))

(declare-fun m!502109 () Bool)

(assert (=> b!520931 m!502109))

(declare-fun m!502111 () Bool)

(assert (=> b!520931 m!502111))

(declare-fun m!502113 () Bool)

(assert (=> b!520942 m!502113))

(declare-fun m!502115 () Bool)

(assert (=> b!520938 m!502115))

(assert (=> b!520934 m!502089))

(assert (=> b!520934 m!502089))

(declare-fun m!502117 () Bool)

(assert (=> b!520934 m!502117))

(declare-fun m!502119 () Bool)

(assert (=> b!520935 m!502119))

(declare-fun m!502121 () Bool)

(assert (=> start!47372 m!502121))

(declare-fun m!502123 () Bool)

(assert (=> start!47372 m!502123))

(declare-fun m!502125 () Bool)

(assert (=> b!520940 m!502125))

(declare-fun m!502127 () Bool)

(assert (=> b!520940 m!502127))

(check-sat (not b!520931) (not b!520934) (not b!520942) (not b!520935) (not b!520938) (not b!520940) (not b!520929) (not start!47372) (not b!520941) (not b!520937))
(check-sat)
