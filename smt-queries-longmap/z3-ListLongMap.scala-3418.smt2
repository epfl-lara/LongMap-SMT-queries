; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47432 () Bool)

(assert start!47432)

(declare-fun b!522040 () Bool)

(declare-fun res!319752 () Bool)

(declare-fun e!304518 () Bool)

(assert (=> b!522040 (=> (not res!319752) (not e!304518))))

(declare-datatypes ((array!33258 0))(
  ( (array!33259 (arr!15985 (Array (_ BitVec 32) (_ BitVec 64))) (size!16349 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33258)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522040 (= res!319752 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522041 () Bool)

(declare-fun e!304520 () Bool)

(assert (=> b!522041 (= e!304520 false)))

(declare-fun b!522043 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!304516 () Bool)

(declare-datatypes ((SeekEntryResult!4452 0))(
  ( (MissingZero!4452 (index!20011 (_ BitVec 32))) (Found!4452 (index!20012 (_ BitVec 32))) (Intermediate!4452 (undefined!5264 Bool) (index!20013 (_ BitVec 32)) (x!48990 (_ BitVec 32))) (Undefined!4452) (MissingVacant!4452 (index!20014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33258 (_ BitVec 32)) SeekEntryResult!4452)

(assert (=> b!522043 (= e!304516 (= (seekEntryOrOpen!0 (select (arr!15985 a!3235) j!176) a!3235 mask!3524) (Found!4452 j!176)))))

(declare-fun b!522044 () Bool)

(declare-fun e!304515 () Bool)

(assert (=> b!522044 (= e!304515 true)))

(declare-fun lt!239352 () SeekEntryResult!4452)

(assert (=> b!522044 (and (or (= (select (arr!15985 a!3235) (index!20013 lt!239352)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15985 a!3235) (index!20013 lt!239352)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15985 a!3235) (index!20013 lt!239352)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15985 a!3235) (index!20013 lt!239352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16260 0))(
  ( (Unit!16261) )
))
(declare-fun lt!239347 () Unit!16260)

(declare-fun e!304521 () Unit!16260)

(assert (=> b!522044 (= lt!239347 e!304521)))

(declare-fun c!61445 () Bool)

(assert (=> b!522044 (= c!61445 (= (select (arr!15985 a!3235) (index!20013 lt!239352)) (select (arr!15985 a!3235) j!176)))))

(assert (=> b!522044 (and (bvslt (x!48990 lt!239352) #b01111111111111111111111111111110) (or (= (select (arr!15985 a!3235) (index!20013 lt!239352)) (select (arr!15985 a!3235) j!176)) (= (select (arr!15985 a!3235) (index!20013 lt!239352)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15985 a!3235) (index!20013 lt!239352)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522045 () Bool)

(declare-fun e!304517 () Bool)

(assert (=> b!522045 (= e!304518 e!304517)))

(declare-fun res!319757 () Bool)

(assert (=> b!522045 (=> (not res!319757) (not e!304517))))

(declare-fun lt!239351 () SeekEntryResult!4452)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522045 (= res!319757 (or (= lt!239351 (MissingZero!4452 i!1204)) (= lt!239351 (MissingVacant!4452 i!1204))))))

(assert (=> b!522045 (= lt!239351 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522046 () Bool)

(declare-fun res!319753 () Bool)

(assert (=> b!522046 (=> (not res!319753) (not e!304518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522046 (= res!319753 (validKeyInArray!0 k0!2280))))

(declare-fun b!522047 () Bool)

(declare-fun Unit!16262 () Unit!16260)

(assert (=> b!522047 (= e!304521 Unit!16262)))

(declare-fun b!522048 () Bool)

(declare-fun res!319759 () Bool)

(assert (=> b!522048 (=> (not res!319759) (not e!304517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33258 (_ BitVec 32)) Bool)

(assert (=> b!522048 (= res!319759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522049 () Bool)

(declare-fun res!319762 () Bool)

(assert (=> b!522049 (=> res!319762 e!304515)))

(get-info :version)

(assert (=> b!522049 (= res!319762 (or (undefined!5264 lt!239352) (not ((_ is Intermediate!4452) lt!239352))))))

(declare-fun b!522050 () Bool)

(declare-fun res!319755 () Bool)

(assert (=> b!522050 (=> (not res!319755) (not e!304517))))

(declare-datatypes ((List!10143 0))(
  ( (Nil!10140) (Cons!10139 (h!11061 (_ BitVec 64)) (t!16371 List!10143)) )
))
(declare-fun arrayNoDuplicates!0 (array!33258 (_ BitVec 32) List!10143) Bool)

(assert (=> b!522050 (= res!319755 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10140))))

(declare-fun b!522051 () Bool)

(assert (=> b!522051 (= e!304517 (not e!304515))))

(declare-fun res!319760 () Bool)

(assert (=> b!522051 (=> res!319760 e!304515)))

(declare-fun lt!239346 () array!33258)

(declare-fun lt!239345 () (_ BitVec 32))

(declare-fun lt!239349 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33258 (_ BitVec 32)) SeekEntryResult!4452)

(assert (=> b!522051 (= res!319760 (= lt!239352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239345 lt!239349 lt!239346 mask!3524)))))

(declare-fun lt!239353 () (_ BitVec 32))

(assert (=> b!522051 (= lt!239352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239353 (select (arr!15985 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522051 (= lt!239345 (toIndex!0 lt!239349 mask!3524))))

(assert (=> b!522051 (= lt!239349 (select (store (arr!15985 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522051 (= lt!239353 (toIndex!0 (select (arr!15985 a!3235) j!176) mask!3524))))

(assert (=> b!522051 (= lt!239346 (array!33259 (store (arr!15985 a!3235) i!1204 k0!2280) (size!16349 a!3235)))))

(assert (=> b!522051 e!304516))

(declare-fun res!319758 () Bool)

(assert (=> b!522051 (=> (not res!319758) (not e!304516))))

(assert (=> b!522051 (= res!319758 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239350 () Unit!16260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16260)

(assert (=> b!522051 (= lt!239350 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522052 () Bool)

(declare-fun res!319754 () Bool)

(assert (=> b!522052 (=> (not res!319754) (not e!304518))))

(assert (=> b!522052 (= res!319754 (validKeyInArray!0 (select (arr!15985 a!3235) j!176)))))

(declare-fun b!522053 () Bool)

(declare-fun Unit!16263 () Unit!16260)

(assert (=> b!522053 (= e!304521 Unit!16263)))

(declare-fun lt!239348 () Unit!16260)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33258 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16260)

(assert (=> b!522053 (= lt!239348 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239353 #b00000000000000000000000000000000 (index!20013 lt!239352) (x!48990 lt!239352) mask!3524))))

(declare-fun res!319763 () Bool)

(assert (=> b!522053 (= res!319763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239353 lt!239349 lt!239346 mask!3524) (Intermediate!4452 false (index!20013 lt!239352) (x!48990 lt!239352))))))

(assert (=> b!522053 (=> (not res!319763) (not e!304520))))

(assert (=> b!522053 e!304520))

(declare-fun res!319761 () Bool)

(assert (=> start!47432 (=> (not res!319761) (not e!304518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47432 (= res!319761 (validMask!0 mask!3524))))

(assert (=> start!47432 e!304518))

(assert (=> start!47432 true))

(declare-fun array_inv!11781 (array!33258) Bool)

(assert (=> start!47432 (array_inv!11781 a!3235)))

(declare-fun b!522042 () Bool)

(declare-fun res!319756 () Bool)

(assert (=> b!522042 (=> (not res!319756) (not e!304518))))

(assert (=> b!522042 (= res!319756 (and (= (size!16349 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16349 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16349 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47432 res!319761) b!522042))

(assert (= (and b!522042 res!319756) b!522052))

(assert (= (and b!522052 res!319754) b!522046))

(assert (= (and b!522046 res!319753) b!522040))

(assert (= (and b!522040 res!319752) b!522045))

(assert (= (and b!522045 res!319757) b!522048))

(assert (= (and b!522048 res!319759) b!522050))

(assert (= (and b!522050 res!319755) b!522051))

(assert (= (and b!522051 res!319758) b!522043))

(assert (= (and b!522051 (not res!319760)) b!522049))

(assert (= (and b!522049 (not res!319762)) b!522044))

(assert (= (and b!522044 c!61445) b!522053))

(assert (= (and b!522044 (not c!61445)) b!522047))

(assert (= (and b!522053 res!319763) b!522041))

(declare-fun m!502953 () Bool)

(assert (=> b!522053 m!502953))

(declare-fun m!502955 () Bool)

(assert (=> b!522053 m!502955))

(declare-fun m!502957 () Bool)

(assert (=> start!47432 m!502957))

(declare-fun m!502959 () Bool)

(assert (=> start!47432 m!502959))

(declare-fun m!502961 () Bool)

(assert (=> b!522044 m!502961))

(declare-fun m!502963 () Bool)

(assert (=> b!522044 m!502963))

(declare-fun m!502965 () Bool)

(assert (=> b!522048 m!502965))

(assert (=> b!522052 m!502963))

(assert (=> b!522052 m!502963))

(declare-fun m!502967 () Bool)

(assert (=> b!522052 m!502967))

(declare-fun m!502969 () Bool)

(assert (=> b!522051 m!502969))

(declare-fun m!502971 () Bool)

(assert (=> b!522051 m!502971))

(declare-fun m!502973 () Bool)

(assert (=> b!522051 m!502973))

(assert (=> b!522051 m!502963))

(declare-fun m!502975 () Bool)

(assert (=> b!522051 m!502975))

(assert (=> b!522051 m!502963))

(declare-fun m!502977 () Bool)

(assert (=> b!522051 m!502977))

(assert (=> b!522051 m!502963))

(declare-fun m!502979 () Bool)

(assert (=> b!522051 m!502979))

(declare-fun m!502981 () Bool)

(assert (=> b!522051 m!502981))

(declare-fun m!502983 () Bool)

(assert (=> b!522051 m!502983))

(declare-fun m!502985 () Bool)

(assert (=> b!522045 m!502985))

(declare-fun m!502987 () Bool)

(assert (=> b!522046 m!502987))

(declare-fun m!502989 () Bool)

(assert (=> b!522050 m!502989))

(assert (=> b!522043 m!502963))

(assert (=> b!522043 m!502963))

(declare-fun m!502991 () Bool)

(assert (=> b!522043 m!502991))

(declare-fun m!502993 () Bool)

(assert (=> b!522040 m!502993))

(check-sat (not b!522040) (not b!522046) (not b!522052) (not b!522050) (not b!522045) (not b!522048) (not b!522051) (not start!47432) (not b!522043) (not b!522053))
(check-sat)
