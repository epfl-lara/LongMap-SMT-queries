; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45396 () Bool)

(assert start!45396)

(declare-fun b!498874 () Bool)

(declare-fun e!292373 () Bool)

(assert (=> b!498874 (= e!292373 false)))

(declare-fun b!498875 () Bool)

(declare-fun res!300918 () Bool)

(declare-fun e!292368 () Bool)

(assert (=> b!498875 (=> (not res!300918) (not e!292368))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32221 0))(
  ( (array!32222 (arr!15492 (Array (_ BitVec 32) (_ BitVec 64))) (size!15856 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32221)

(assert (=> b!498875 (= res!300918 (and (= (size!15856 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15856 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15856 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498876 () Bool)

(declare-fun res!300922 () Bool)

(declare-fun e!292374 () Bool)

(assert (=> b!498876 (=> (not res!300922) (not e!292374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32221 (_ BitVec 32)) Bool)

(assert (=> b!498876 (= res!300922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498877 () Bool)

(declare-fun res!300921 () Bool)

(declare-fun e!292369 () Bool)

(assert (=> b!498877 (=> res!300921 e!292369)))

(declare-datatypes ((SeekEntryResult!3959 0))(
  ( (MissingZero!3959 (index!18018 (_ BitVec 32))) (Found!3959 (index!18019 (_ BitVec 32))) (Intermediate!3959 (undefined!4771 Bool) (index!18020 (_ BitVec 32)) (x!47068 (_ BitVec 32))) (Undefined!3959) (MissingVacant!3959 (index!18021 (_ BitVec 32))) )
))
(declare-fun lt!226075 () SeekEntryResult!3959)

(assert (=> b!498877 (= res!300921 (or (undefined!4771 lt!226075) (not (is-Intermediate!3959 lt!226075))))))

(declare-fun b!498878 () Bool)

(assert (=> b!498878 (= e!292368 e!292374)))

(declare-fun res!300912 () Bool)

(assert (=> b!498878 (=> (not res!300912) (not e!292374))))

(declare-fun lt!226069 () SeekEntryResult!3959)

(assert (=> b!498878 (= res!300912 (or (= lt!226069 (MissingZero!3959 i!1204)) (= lt!226069 (MissingVacant!3959 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32221 (_ BitVec 32)) SeekEntryResult!3959)

(assert (=> b!498878 (= lt!226069 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498879 () Bool)

(declare-fun res!300913 () Bool)

(assert (=> b!498879 (=> (not res!300913) (not e!292368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498879 (= res!300913 (validKeyInArray!0 (select (arr!15492 a!3235) j!176)))))

(declare-fun b!498880 () Bool)

(declare-datatypes ((Unit!14912 0))(
  ( (Unit!14913) )
))
(declare-fun e!292370 () Unit!14912)

(declare-fun Unit!14914 () Unit!14912)

(assert (=> b!498880 (= e!292370 Unit!14914)))

(declare-fun lt!226074 () Unit!14912)

(declare-fun lt!226073 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32221 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14912)

(assert (=> b!498880 (= lt!226074 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226073 #b00000000000000000000000000000000 (index!18020 lt!226075) (x!47068 lt!226075) mask!3524))))

(declare-fun lt!226072 () array!32221)

(declare-fun lt!226077 () (_ BitVec 64))

(declare-fun res!300916 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32221 (_ BitVec 32)) SeekEntryResult!3959)

(assert (=> b!498880 (= res!300916 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226073 lt!226077 lt!226072 mask!3524) (Intermediate!3959 false (index!18020 lt!226075) (x!47068 lt!226075))))))

(assert (=> b!498880 (=> (not res!300916) (not e!292373))))

(assert (=> b!498880 e!292373))

(declare-fun b!498881 () Bool)

(declare-fun res!300917 () Bool)

(assert (=> b!498881 (=> (not res!300917) (not e!292374))))

(declare-datatypes ((List!9650 0))(
  ( (Nil!9647) (Cons!9646 (h!10520 (_ BitVec 64)) (t!15878 List!9650)) )
))
(declare-fun arrayNoDuplicates!0 (array!32221 (_ BitVec 32) List!9650) Bool)

(assert (=> b!498881 (= res!300917 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9647))))

(declare-fun b!498882 () Bool)

(declare-fun e!292372 () Bool)

(assert (=> b!498882 (= e!292372 true)))

(declare-fun lt!226078 () SeekEntryResult!3959)

(assert (=> b!498882 (= lt!226078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226073 lt!226077 lt!226072 mask!3524))))

(declare-fun b!498883 () Bool)

(assert (=> b!498883 (= e!292369 e!292372)))

(declare-fun res!300914 () Bool)

(assert (=> b!498883 (=> res!300914 e!292372)))

(assert (=> b!498883 (= res!300914 (or (bvsgt #b00000000000000000000000000000000 (x!47068 lt!226075)) (bvsgt (x!47068 lt!226075) #b01111111111111111111111111111110) (bvslt lt!226073 #b00000000000000000000000000000000) (bvsge lt!226073 (size!15856 a!3235)) (bvslt (index!18020 lt!226075) #b00000000000000000000000000000000) (bvsge (index!18020 lt!226075) (size!15856 a!3235)) (not (= lt!226075 (Intermediate!3959 false (index!18020 lt!226075) (x!47068 lt!226075))))))))

(assert (=> b!498883 (and (or (= (select (arr!15492 a!3235) (index!18020 lt!226075)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15492 a!3235) (index!18020 lt!226075)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15492 a!3235) (index!18020 lt!226075)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15492 a!3235) (index!18020 lt!226075)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226076 () Unit!14912)

(assert (=> b!498883 (= lt!226076 e!292370)))

(declare-fun c!59258 () Bool)

(assert (=> b!498883 (= c!59258 (= (select (arr!15492 a!3235) (index!18020 lt!226075)) (select (arr!15492 a!3235) j!176)))))

(assert (=> b!498883 (and (bvslt (x!47068 lt!226075) #b01111111111111111111111111111110) (or (= (select (arr!15492 a!3235) (index!18020 lt!226075)) (select (arr!15492 a!3235) j!176)) (= (select (arr!15492 a!3235) (index!18020 lt!226075)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15492 a!3235) (index!18020 lt!226075)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498873 () Bool)

(declare-fun Unit!14915 () Unit!14912)

(assert (=> b!498873 (= e!292370 Unit!14915)))

(declare-fun res!300919 () Bool)

(assert (=> start!45396 (=> (not res!300919) (not e!292368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45396 (= res!300919 (validMask!0 mask!3524))))

(assert (=> start!45396 e!292368))

(assert (=> start!45396 true))

(declare-fun array_inv!11288 (array!32221) Bool)

(assert (=> start!45396 (array_inv!11288 a!3235)))

(declare-fun b!498884 () Bool)

(assert (=> b!498884 (= e!292374 (not e!292369))))

(declare-fun res!300911 () Bool)

(assert (=> b!498884 (=> res!300911 e!292369)))

(declare-fun lt!226071 () (_ BitVec 32))

(assert (=> b!498884 (= res!300911 (= lt!226075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226071 lt!226077 lt!226072 mask!3524)))))

(assert (=> b!498884 (= lt!226075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226073 (select (arr!15492 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498884 (= lt!226071 (toIndex!0 lt!226077 mask!3524))))

(assert (=> b!498884 (= lt!226077 (select (store (arr!15492 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498884 (= lt!226073 (toIndex!0 (select (arr!15492 a!3235) j!176) mask!3524))))

(assert (=> b!498884 (= lt!226072 (array!32222 (store (arr!15492 a!3235) i!1204 k!2280) (size!15856 a!3235)))))

(declare-fun e!292371 () Bool)

(assert (=> b!498884 e!292371))

(declare-fun res!300920 () Bool)

(assert (=> b!498884 (=> (not res!300920) (not e!292371))))

(assert (=> b!498884 (= res!300920 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226070 () Unit!14912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14912)

(assert (=> b!498884 (= lt!226070 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498885 () Bool)

(declare-fun res!300915 () Bool)

(assert (=> b!498885 (=> (not res!300915) (not e!292368))))

(declare-fun arrayContainsKey!0 (array!32221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498885 (= res!300915 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498886 () Bool)

(declare-fun res!300923 () Bool)

(assert (=> b!498886 (=> (not res!300923) (not e!292368))))

(assert (=> b!498886 (= res!300923 (validKeyInArray!0 k!2280))))

(declare-fun b!498887 () Bool)

(assert (=> b!498887 (= e!292371 (= (seekEntryOrOpen!0 (select (arr!15492 a!3235) j!176) a!3235 mask!3524) (Found!3959 j!176)))))

(assert (= (and start!45396 res!300919) b!498875))

(assert (= (and b!498875 res!300918) b!498879))

(assert (= (and b!498879 res!300913) b!498886))

(assert (= (and b!498886 res!300923) b!498885))

(assert (= (and b!498885 res!300915) b!498878))

(assert (= (and b!498878 res!300912) b!498876))

(assert (= (and b!498876 res!300922) b!498881))

(assert (= (and b!498881 res!300917) b!498884))

(assert (= (and b!498884 res!300920) b!498887))

(assert (= (and b!498884 (not res!300911)) b!498877))

(assert (= (and b!498877 (not res!300921)) b!498883))

(assert (= (and b!498883 c!59258) b!498880))

(assert (= (and b!498883 (not c!59258)) b!498873))

(assert (= (and b!498880 res!300916) b!498874))

(assert (= (and b!498883 (not res!300914)) b!498882))

(declare-fun m!480111 () Bool)

(assert (=> b!498879 m!480111))

(assert (=> b!498879 m!480111))

(declare-fun m!480113 () Bool)

(assert (=> b!498879 m!480113))

(assert (=> b!498887 m!480111))

(assert (=> b!498887 m!480111))

(declare-fun m!480115 () Bool)

(assert (=> b!498887 m!480115))

(declare-fun m!480117 () Bool)

(assert (=> b!498886 m!480117))

(declare-fun m!480119 () Bool)

(assert (=> b!498885 m!480119))

(declare-fun m!480121 () Bool)

(assert (=> b!498882 m!480121))

(declare-fun m!480123 () Bool)

(assert (=> b!498884 m!480123))

(declare-fun m!480125 () Bool)

(assert (=> b!498884 m!480125))

(declare-fun m!480127 () Bool)

(assert (=> b!498884 m!480127))

(declare-fun m!480129 () Bool)

(assert (=> b!498884 m!480129))

(assert (=> b!498884 m!480111))

(declare-fun m!480131 () Bool)

(assert (=> b!498884 m!480131))

(assert (=> b!498884 m!480111))

(declare-fun m!480133 () Bool)

(assert (=> b!498884 m!480133))

(declare-fun m!480135 () Bool)

(assert (=> b!498884 m!480135))

(assert (=> b!498884 m!480111))

(declare-fun m!480137 () Bool)

(assert (=> b!498884 m!480137))

(declare-fun m!480139 () Bool)

(assert (=> b!498883 m!480139))

(assert (=> b!498883 m!480111))

(declare-fun m!480141 () Bool)

(assert (=> b!498876 m!480141))

(declare-fun m!480143 () Bool)

(assert (=> b!498881 m!480143))

(declare-fun m!480145 () Bool)

(assert (=> b!498880 m!480145))

(assert (=> b!498880 m!480121))

(declare-fun m!480147 () Bool)

(assert (=> start!45396 m!480147))

(declare-fun m!480149 () Bool)

(assert (=> start!45396 m!480149))

(declare-fun m!480151 () Bool)

(assert (=> b!498878 m!480151))

(push 1)

