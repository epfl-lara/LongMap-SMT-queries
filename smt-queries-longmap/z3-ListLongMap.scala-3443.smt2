; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47768 () Bool)

(assert start!47768)

(declare-fun b!526077 () Bool)

(declare-fun e!306669 () Bool)

(assert (=> b!526077 (= e!306669 false)))

(declare-fun b!526078 () Bool)

(declare-fun res!322802 () Bool)

(declare-fun e!306675 () Bool)

(assert (=> b!526078 (=> (not res!322802) (not e!306675))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33406 0))(
  ( (array!33407 (arr!16054 (Array (_ BitVec 32) (_ BitVec 64))) (size!16418 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33406)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526078 (= res!322802 (and (= (size!16418 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16418 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16418 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526079 () Bool)

(declare-fun e!306673 () Bool)

(declare-fun e!306670 () Bool)

(assert (=> b!526079 (= e!306673 (not e!306670))))

(declare-fun res!322797 () Bool)

(assert (=> b!526079 (=> res!322797 e!306670)))

(declare-fun lt!241909 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4477 0))(
  ( (MissingZero!4477 (index!20120 (_ BitVec 32))) (Found!4477 (index!20121 (_ BitVec 32))) (Intermediate!4477 (undefined!5289 Bool) (index!20122 (_ BitVec 32)) (x!49239 (_ BitVec 32))) (Undefined!4477) (MissingVacant!4477 (index!20123 (_ BitVec 32))) )
))
(declare-fun lt!241912 () SeekEntryResult!4477)

(declare-fun lt!241907 () (_ BitVec 32))

(declare-fun lt!241915 () array!33406)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33406 (_ BitVec 32)) SeekEntryResult!4477)

(assert (=> b!526079 (= res!322797 (= lt!241912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241907 lt!241909 lt!241915 mask!3524)))))

(declare-fun lt!241911 () (_ BitVec 32))

(assert (=> b!526079 (= lt!241912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241911 (select (arr!16054 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526079 (= lt!241907 (toIndex!0 lt!241909 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!526079 (= lt!241909 (select (store (arr!16054 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526079 (= lt!241911 (toIndex!0 (select (arr!16054 a!3235) j!176) mask!3524))))

(assert (=> b!526079 (= lt!241915 (array!33407 (store (arr!16054 a!3235) i!1204 k0!2280) (size!16418 a!3235)))))

(declare-fun e!306671 () Bool)

(assert (=> b!526079 e!306671))

(declare-fun res!322803 () Bool)

(assert (=> b!526079 (=> (not res!322803) (not e!306671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33406 (_ BitVec 32)) Bool)

(assert (=> b!526079 (= res!322803 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16519 0))(
  ( (Unit!16520) )
))
(declare-fun lt!241913 () Unit!16519)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16519)

(assert (=> b!526079 (= lt!241913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526080 () Bool)

(declare-fun res!322806 () Bool)

(assert (=> b!526080 (=> (not res!322806) (not e!306675))))

(declare-fun arrayContainsKey!0 (array!33406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526080 (= res!322806 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33406 (_ BitVec 32)) SeekEntryResult!4477)

(assert (=> b!526081 (= e!306671 (= (seekEntryOrOpen!0 (select (arr!16054 a!3235) j!176) a!3235 mask!3524) (Found!4477 j!176)))))

(declare-fun b!526082 () Bool)

(declare-fun res!322805 () Bool)

(assert (=> b!526082 (=> (not res!322805) (not e!306675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526082 (= res!322805 (validKeyInArray!0 k0!2280))))

(declare-fun b!526083 () Bool)

(assert (=> b!526083 (= e!306675 e!306673)))

(declare-fun res!322799 () Bool)

(assert (=> b!526083 (=> (not res!322799) (not e!306673))))

(declare-fun lt!241914 () SeekEntryResult!4477)

(assert (=> b!526083 (= res!322799 (or (= lt!241914 (MissingZero!4477 i!1204)) (= lt!241914 (MissingVacant!4477 i!1204))))))

(assert (=> b!526083 (= lt!241914 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526084 () Bool)

(declare-fun e!306672 () Unit!16519)

(declare-fun Unit!16521 () Unit!16519)

(assert (=> b!526084 (= e!306672 Unit!16521)))

(declare-fun lt!241910 () Unit!16519)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33406 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16519)

(assert (=> b!526084 (= lt!241910 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241911 #b00000000000000000000000000000000 (index!20122 lt!241912) (x!49239 lt!241912) mask!3524))))

(declare-fun res!322798 () Bool)

(assert (=> b!526084 (= res!322798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241911 lt!241909 lt!241915 mask!3524) (Intermediate!4477 false (index!20122 lt!241912) (x!49239 lt!241912))))))

(assert (=> b!526084 (=> (not res!322798) (not e!306669))))

(assert (=> b!526084 e!306669))

(declare-fun b!526085 () Bool)

(declare-fun res!322800 () Bool)

(assert (=> b!526085 (=> (not res!322800) (not e!306673))))

(assert (=> b!526085 (= res!322800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526086 () Bool)

(assert (=> b!526086 (= e!306670 true)))

(assert (=> b!526086 (= (index!20122 lt!241912) i!1204)))

(declare-fun lt!241908 () Unit!16519)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33406 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16519)

(assert (=> b!526086 (= lt!241908 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241911 #b00000000000000000000000000000000 (index!20122 lt!241912) (x!49239 lt!241912) mask!3524))))

(assert (=> b!526086 (and (or (= (select (arr!16054 a!3235) (index!20122 lt!241912)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16054 a!3235) (index!20122 lt!241912)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16054 a!3235) (index!20122 lt!241912)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16054 a!3235) (index!20122 lt!241912)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241906 () Unit!16519)

(assert (=> b!526086 (= lt!241906 e!306672)))

(declare-fun c!61946 () Bool)

(assert (=> b!526086 (= c!61946 (= (select (arr!16054 a!3235) (index!20122 lt!241912)) (select (arr!16054 a!3235) j!176)))))

(assert (=> b!526086 (and (bvslt (x!49239 lt!241912) #b01111111111111111111111111111110) (or (= (select (arr!16054 a!3235) (index!20122 lt!241912)) (select (arr!16054 a!3235) j!176)) (= (select (arr!16054 a!3235) (index!20122 lt!241912)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16054 a!3235) (index!20122 lt!241912)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!322796 () Bool)

(assert (=> start!47768 (=> (not res!322796) (not e!306675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47768 (= res!322796 (validMask!0 mask!3524))))

(assert (=> start!47768 e!306675))

(assert (=> start!47768 true))

(declare-fun array_inv!11913 (array!33406) Bool)

(assert (=> start!47768 (array_inv!11913 a!3235)))

(declare-fun b!526087 () Bool)

(declare-fun res!322804 () Bool)

(assert (=> b!526087 (=> (not res!322804) (not e!306675))))

(assert (=> b!526087 (= res!322804 (validKeyInArray!0 (select (arr!16054 a!3235) j!176)))))

(declare-fun b!526088 () Bool)

(declare-fun Unit!16522 () Unit!16519)

(assert (=> b!526088 (= e!306672 Unit!16522)))

(declare-fun b!526089 () Bool)

(declare-fun res!322801 () Bool)

(assert (=> b!526089 (=> (not res!322801) (not e!306673))))

(declare-datatypes ((List!10119 0))(
  ( (Nil!10116) (Cons!10115 (h!11046 (_ BitVec 64)) (t!16339 List!10119)) )
))
(declare-fun arrayNoDuplicates!0 (array!33406 (_ BitVec 32) List!10119) Bool)

(assert (=> b!526089 (= res!322801 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10116))))

(declare-fun b!526090 () Bool)

(declare-fun res!322807 () Bool)

(assert (=> b!526090 (=> res!322807 e!306670)))

(get-info :version)

(assert (=> b!526090 (= res!322807 (or (undefined!5289 lt!241912) (not ((_ is Intermediate!4477) lt!241912))))))

(assert (= (and start!47768 res!322796) b!526078))

(assert (= (and b!526078 res!322802) b!526087))

(assert (= (and b!526087 res!322804) b!526082))

(assert (= (and b!526082 res!322805) b!526080))

(assert (= (and b!526080 res!322806) b!526083))

(assert (= (and b!526083 res!322799) b!526085))

(assert (= (and b!526085 res!322800) b!526089))

(assert (= (and b!526089 res!322801) b!526079))

(assert (= (and b!526079 res!322803) b!526081))

(assert (= (and b!526079 (not res!322797)) b!526090))

(assert (= (and b!526090 (not res!322807)) b!526086))

(assert (= (and b!526086 c!61946) b!526084))

(assert (= (and b!526086 (not c!61946)) b!526088))

(assert (= (and b!526084 res!322798) b!526077))

(declare-fun m!507013 () Bool)

(assert (=> b!526086 m!507013))

(declare-fun m!507015 () Bool)

(assert (=> b!526086 m!507015))

(declare-fun m!507017 () Bool)

(assert (=> b!526086 m!507017))

(assert (=> b!526081 m!507017))

(assert (=> b!526081 m!507017))

(declare-fun m!507019 () Bool)

(assert (=> b!526081 m!507019))

(declare-fun m!507021 () Bool)

(assert (=> b!526079 m!507021))

(declare-fun m!507023 () Bool)

(assert (=> b!526079 m!507023))

(declare-fun m!507025 () Bool)

(assert (=> b!526079 m!507025))

(assert (=> b!526079 m!507017))

(declare-fun m!507027 () Bool)

(assert (=> b!526079 m!507027))

(assert (=> b!526079 m!507017))

(assert (=> b!526079 m!507017))

(declare-fun m!507029 () Bool)

(assert (=> b!526079 m!507029))

(declare-fun m!507031 () Bool)

(assert (=> b!526079 m!507031))

(declare-fun m!507033 () Bool)

(assert (=> b!526079 m!507033))

(declare-fun m!507035 () Bool)

(assert (=> b!526079 m!507035))

(assert (=> b!526087 m!507017))

(assert (=> b!526087 m!507017))

(declare-fun m!507037 () Bool)

(assert (=> b!526087 m!507037))

(declare-fun m!507039 () Bool)

(assert (=> b!526084 m!507039))

(declare-fun m!507041 () Bool)

(assert (=> b!526084 m!507041))

(declare-fun m!507043 () Bool)

(assert (=> b!526082 m!507043))

(declare-fun m!507045 () Bool)

(assert (=> b!526089 m!507045))

(declare-fun m!507047 () Bool)

(assert (=> b!526083 m!507047))

(declare-fun m!507049 () Bool)

(assert (=> b!526080 m!507049))

(declare-fun m!507051 () Bool)

(assert (=> b!526085 m!507051))

(declare-fun m!507053 () Bool)

(assert (=> start!47768 m!507053))

(declare-fun m!507055 () Bool)

(assert (=> start!47768 m!507055))

(check-sat (not b!526086) (not b!526081) (not b!526079) (not b!526089) (not b!526084) (not start!47768) (not b!526087) (not b!526080) (not b!526083) (not b!526085) (not b!526082))
(check-sat)
