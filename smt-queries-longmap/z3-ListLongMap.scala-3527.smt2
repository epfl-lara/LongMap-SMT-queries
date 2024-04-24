; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48778 () Bool)

(assert start!48778)

(declare-fun b!535954 () Bool)

(declare-fun e!311279 () Bool)

(declare-fun e!311282 () Bool)

(assert (=> b!535954 (= e!311279 e!311282)))

(declare-fun res!331056 () Bool)

(assert (=> b!535954 (=> (not res!331056) (not e!311282))))

(declare-datatypes ((SeekEntryResult!4720 0))(
  ( (MissingZero!4720 (index!21104 (_ BitVec 32))) (Found!4720 (index!21105 (_ BitVec 32))) (Intermediate!4720 (undefined!5532 Bool) (index!21106 (_ BitVec 32)) (x!50202 (_ BitVec 32))) (Undefined!4720) (MissingVacant!4720 (index!21107 (_ BitVec 32))) )
))
(declare-fun lt!245995 () SeekEntryResult!4720)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535954 (= res!331056 (or (= lt!245995 (MissingZero!4720 i!1153)) (= lt!245995 (MissingVacant!4720 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33938 0))(
  ( (array!33939 (arr!16306 (Array (_ BitVec 32) (_ BitVec 64))) (size!16670 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33938)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33938 (_ BitVec 32)) SeekEntryResult!4720)

(assert (=> b!535954 (= lt!245995 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535955 () Bool)

(declare-fun e!311281 () Bool)

(assert (=> b!535955 (= e!311282 e!311281)))

(declare-fun res!331055 () Bool)

(assert (=> b!535955 (=> (not res!331055) (not e!311281))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!245994 () SeekEntryResult!4720)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535955 (= res!331055 (= lt!245994 (Intermediate!4720 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33938 (_ BitVec 32)) SeekEntryResult!4720)

(assert (=> b!535955 (= lt!245994 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16306 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535956 () Bool)

(declare-fun res!331063 () Bool)

(assert (=> b!535956 (=> (not res!331063) (not e!311281))))

(assert (=> b!535956 (= res!331063 (and (not (= (select (arr!16306 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16306 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16306 a!3154) index!1177) (select (arr!16306 a!3154) j!147)))))))

(declare-fun b!535957 () Bool)

(declare-fun res!331062 () Bool)

(assert (=> b!535957 (=> (not res!331062) (not e!311279))))

(declare-fun arrayContainsKey!0 (array!33938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535957 (= res!331062 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535958 () Bool)

(declare-fun e!311280 () Bool)

(assert (=> b!535958 (= e!311281 e!311280)))

(declare-fun res!331066 () Bool)

(assert (=> b!535958 (=> (not res!331066) (not e!311280))))

(declare-fun lt!245993 () (_ BitVec 32))

(assert (=> b!535958 (= res!331066 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245993 #b00000000000000000000000000000000) (bvslt lt!245993 (size!16670 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535958 (= lt!245993 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!535959 () Bool)

(assert (=> b!535959 (= e!311280 false)))

(declare-fun lt!245992 () SeekEntryResult!4720)

(assert (=> b!535959 (= lt!245992 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245993 (select (arr!16306 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535960 () Bool)

(declare-fun res!331059 () Bool)

(assert (=> b!535960 (=> (not res!331059) (not e!311282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33938 (_ BitVec 32)) Bool)

(assert (=> b!535960 (= res!331059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535961 () Bool)

(declare-fun res!331065 () Bool)

(assert (=> b!535961 (=> (not res!331065) (not e!311281))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535961 (= res!331065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16306 a!3154) j!147) mask!3216) (select (arr!16306 a!3154) j!147) a!3154 mask!3216) lt!245994))))

(declare-fun b!535963 () Bool)

(declare-fun res!331058 () Bool)

(assert (=> b!535963 (=> (not res!331058) (not e!311279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535963 (= res!331058 (validKeyInArray!0 k0!1998))))

(declare-fun b!535964 () Bool)

(declare-fun res!331057 () Bool)

(assert (=> b!535964 (=> (not res!331057) (not e!311282))))

(assert (=> b!535964 (= res!331057 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16670 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16670 a!3154)) (= (select (arr!16306 a!3154) resIndex!32) (select (arr!16306 a!3154) j!147))))))

(declare-fun b!535965 () Bool)

(declare-fun res!331064 () Bool)

(assert (=> b!535965 (=> (not res!331064) (not e!311279))))

(assert (=> b!535965 (= res!331064 (validKeyInArray!0 (select (arr!16306 a!3154) j!147)))))

(declare-fun b!535966 () Bool)

(declare-fun res!331054 () Bool)

(assert (=> b!535966 (=> (not res!331054) (not e!311279))))

(assert (=> b!535966 (= res!331054 (and (= (size!16670 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16670 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16670 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535962 () Bool)

(declare-fun res!331060 () Bool)

(assert (=> b!535962 (=> (not res!331060) (not e!311282))))

(declare-datatypes ((List!10332 0))(
  ( (Nil!10329) (Cons!10328 (h!11274 (_ BitVec 64)) (t!16552 List!10332)) )
))
(declare-fun arrayNoDuplicates!0 (array!33938 (_ BitVec 32) List!10332) Bool)

(assert (=> b!535962 (= res!331060 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10329))))

(declare-fun res!331061 () Bool)

(assert (=> start!48778 (=> (not res!331061) (not e!311279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48778 (= res!331061 (validMask!0 mask!3216))))

(assert (=> start!48778 e!311279))

(assert (=> start!48778 true))

(declare-fun array_inv!12165 (array!33938) Bool)

(assert (=> start!48778 (array_inv!12165 a!3154)))

(assert (= (and start!48778 res!331061) b!535966))

(assert (= (and b!535966 res!331054) b!535965))

(assert (= (and b!535965 res!331064) b!535963))

(assert (= (and b!535963 res!331058) b!535957))

(assert (= (and b!535957 res!331062) b!535954))

(assert (= (and b!535954 res!331056) b!535960))

(assert (= (and b!535960 res!331059) b!535962))

(assert (= (and b!535962 res!331060) b!535964))

(assert (= (and b!535964 res!331057) b!535955))

(assert (= (and b!535955 res!331055) b!535961))

(assert (= (and b!535961 res!331065) b!535956))

(assert (= (and b!535956 res!331063) b!535958))

(assert (= (and b!535958 res!331066) b!535959))

(declare-fun m!515611 () Bool)

(assert (=> start!48778 m!515611))

(declare-fun m!515613 () Bool)

(assert (=> start!48778 m!515613))

(declare-fun m!515615 () Bool)

(assert (=> b!535961 m!515615))

(assert (=> b!535961 m!515615))

(declare-fun m!515617 () Bool)

(assert (=> b!535961 m!515617))

(assert (=> b!535961 m!515617))

(assert (=> b!535961 m!515615))

(declare-fun m!515619 () Bool)

(assert (=> b!535961 m!515619))

(declare-fun m!515621 () Bool)

(assert (=> b!535960 m!515621))

(declare-fun m!515623 () Bool)

(assert (=> b!535964 m!515623))

(assert (=> b!535964 m!515615))

(declare-fun m!515625 () Bool)

(assert (=> b!535956 m!515625))

(assert (=> b!535956 m!515615))

(declare-fun m!515627 () Bool)

(assert (=> b!535954 m!515627))

(declare-fun m!515629 () Bool)

(assert (=> b!535962 m!515629))

(declare-fun m!515631 () Bool)

(assert (=> b!535963 m!515631))

(assert (=> b!535959 m!515615))

(assert (=> b!535959 m!515615))

(declare-fun m!515633 () Bool)

(assert (=> b!535959 m!515633))

(declare-fun m!515635 () Bool)

(assert (=> b!535958 m!515635))

(assert (=> b!535955 m!515615))

(assert (=> b!535955 m!515615))

(declare-fun m!515637 () Bool)

(assert (=> b!535955 m!515637))

(declare-fun m!515639 () Bool)

(assert (=> b!535957 m!515639))

(assert (=> b!535965 m!515615))

(assert (=> b!535965 m!515615))

(declare-fun m!515641 () Bool)

(assert (=> b!535965 m!515641))

(check-sat (not b!535962) (not b!535965) (not b!535958) (not b!535954) (not b!535957) (not b!535955) (not b!535959) (not start!48778) (not b!535961) (not b!535960) (not b!535963))
(check-sat)
