; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46712 () Bool)

(assert start!46712)

(declare-fun b!515611 () Bool)

(declare-fun res!315179 () Bool)

(declare-fun e!301028 () Bool)

(assert (=> b!515611 (=> (not res!315179) (not e!301028))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!33024 0))(
  ( (array!33025 (arr!15880 (Array (_ BitVec 32) (_ BitVec 64))) (size!16244 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33024)

(assert (=> b!515611 (= res!315179 (and (= (size!16244 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16244 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16244 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515612 () Bool)

(declare-fun e!301026 () Bool)

(declare-fun e!301027 () Bool)

(assert (=> b!515612 (= e!301026 (not e!301027))))

(declare-fun res!315178 () Bool)

(assert (=> b!515612 (=> res!315178 e!301027)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4347 0))(
  ( (MissingZero!4347 (index!19576 (_ BitVec 32))) (Found!4347 (index!19577 (_ BitVec 32))) (Intermediate!4347 (undefined!5159 Bool) (index!19578 (_ BitVec 32)) (x!48542 (_ BitVec 32))) (Undefined!4347) (MissingVacant!4347 (index!19579 (_ BitVec 32))) )
))
(declare-fun lt!236043 () SeekEntryResult!4347)

(declare-fun lt!236044 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33024 (_ BitVec 32)) SeekEntryResult!4347)

(assert (=> b!515612 (= res!315178 (= lt!236043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236044 (select (store (arr!15880 a!3235) i!1204 k0!2280) j!176) (array!33025 (store (arr!15880 a!3235) i!1204 k0!2280) (size!16244 a!3235)) mask!3524)))))

(declare-fun lt!236040 () (_ BitVec 32))

(assert (=> b!515612 (= lt!236043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236040 (select (arr!15880 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515612 (= lt!236044 (toIndex!0 (select (store (arr!15880 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515612 (= lt!236040 (toIndex!0 (select (arr!15880 a!3235) j!176) mask!3524))))

(declare-fun e!301029 () Bool)

(assert (=> b!515612 e!301029))

(declare-fun res!315184 () Bool)

(assert (=> b!515612 (=> (not res!315184) (not e!301029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33024 (_ BitVec 32)) Bool)

(assert (=> b!515612 (= res!315184 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15952 0))(
  ( (Unit!15953) )
))
(declare-fun lt!236041 () Unit!15952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15952)

(assert (=> b!515612 (= lt!236041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515613 () Bool)

(assert (=> b!515613 (= e!301027 true)))

(assert (=> b!515613 (and (bvslt (x!48542 lt!236043) #b01111111111111111111111111111110) (or (= (select (arr!15880 a!3235) (index!19578 lt!236043)) (select (arr!15880 a!3235) j!176)) (= (select (arr!15880 a!3235) (index!19578 lt!236043)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15880 a!3235) (index!19578 lt!236043)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515614 () Bool)

(assert (=> b!515614 (= e!301028 e!301026)))

(declare-fun res!315185 () Bool)

(assert (=> b!515614 (=> (not res!315185) (not e!301026))))

(declare-fun lt!236042 () SeekEntryResult!4347)

(assert (=> b!515614 (= res!315185 (or (= lt!236042 (MissingZero!4347 i!1204)) (= lt!236042 (MissingVacant!4347 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33024 (_ BitVec 32)) SeekEntryResult!4347)

(assert (=> b!515614 (= lt!236042 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515616 () Bool)

(assert (=> b!515616 (= e!301029 (= (seekEntryOrOpen!0 (select (arr!15880 a!3235) j!176) a!3235 mask!3524) (Found!4347 j!176)))))

(declare-fun b!515617 () Bool)

(declare-fun res!315177 () Bool)

(assert (=> b!515617 (=> (not res!315177) (not e!301028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515617 (= res!315177 (validKeyInArray!0 k0!2280))))

(declare-fun b!515618 () Bool)

(declare-fun res!315183 () Bool)

(assert (=> b!515618 (=> (not res!315183) (not e!301026))))

(assert (=> b!515618 (= res!315183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515619 () Bool)

(declare-fun res!315175 () Bool)

(assert (=> b!515619 (=> (not res!315175) (not e!301028))))

(assert (=> b!515619 (= res!315175 (validKeyInArray!0 (select (arr!15880 a!3235) j!176)))))

(declare-fun b!515615 () Bool)

(declare-fun res!315182 () Bool)

(assert (=> b!515615 (=> (not res!315182) (not e!301028))))

(declare-fun arrayContainsKey!0 (array!33024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515615 (= res!315182 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!315181 () Bool)

(assert (=> start!46712 (=> (not res!315181) (not e!301028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46712 (= res!315181 (validMask!0 mask!3524))))

(assert (=> start!46712 e!301028))

(assert (=> start!46712 true))

(declare-fun array_inv!11676 (array!33024) Bool)

(assert (=> start!46712 (array_inv!11676 a!3235)))

(declare-fun b!515620 () Bool)

(declare-fun res!315176 () Bool)

(assert (=> b!515620 (=> (not res!315176) (not e!301026))))

(declare-datatypes ((List!10038 0))(
  ( (Nil!10035) (Cons!10034 (h!10932 (_ BitVec 64)) (t!16266 List!10038)) )
))
(declare-fun arrayNoDuplicates!0 (array!33024 (_ BitVec 32) List!10038) Bool)

(assert (=> b!515620 (= res!315176 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10035))))

(declare-fun b!515621 () Bool)

(declare-fun res!315180 () Bool)

(assert (=> b!515621 (=> res!315180 e!301027)))

(get-info :version)

(assert (=> b!515621 (= res!315180 (or (undefined!5159 lt!236043) (not ((_ is Intermediate!4347) lt!236043))))))

(assert (= (and start!46712 res!315181) b!515611))

(assert (= (and b!515611 res!315179) b!515619))

(assert (= (and b!515619 res!315175) b!515617))

(assert (= (and b!515617 res!315177) b!515615))

(assert (= (and b!515615 res!315182) b!515614))

(assert (= (and b!515614 res!315185) b!515618))

(assert (= (and b!515618 res!315183) b!515620))

(assert (= (and b!515620 res!315176) b!515612))

(assert (= (and b!515612 res!315184) b!515616))

(assert (= (and b!515612 (not res!315178)) b!515621))

(assert (= (and b!515621 (not res!315180)) b!515613))

(declare-fun m!496973 () Bool)

(assert (=> b!515614 m!496973))

(declare-fun m!496975 () Bool)

(assert (=> b!515618 m!496975))

(declare-fun m!496977 () Bool)

(assert (=> b!515616 m!496977))

(assert (=> b!515616 m!496977))

(declare-fun m!496979 () Bool)

(assert (=> b!515616 m!496979))

(declare-fun m!496981 () Bool)

(assert (=> b!515612 m!496981))

(declare-fun m!496983 () Bool)

(assert (=> b!515612 m!496983))

(declare-fun m!496985 () Bool)

(assert (=> b!515612 m!496985))

(declare-fun m!496987 () Bool)

(assert (=> b!515612 m!496987))

(assert (=> b!515612 m!496977))

(declare-fun m!496989 () Bool)

(assert (=> b!515612 m!496989))

(assert (=> b!515612 m!496977))

(declare-fun m!496991 () Bool)

(assert (=> b!515612 m!496991))

(assert (=> b!515612 m!496981))

(declare-fun m!496993 () Bool)

(assert (=> b!515612 m!496993))

(assert (=> b!515612 m!496977))

(declare-fun m!496995 () Bool)

(assert (=> b!515612 m!496995))

(assert (=> b!515612 m!496981))

(assert (=> b!515619 m!496977))

(assert (=> b!515619 m!496977))

(declare-fun m!496997 () Bool)

(assert (=> b!515619 m!496997))

(declare-fun m!496999 () Bool)

(assert (=> b!515620 m!496999))

(declare-fun m!497001 () Bool)

(assert (=> start!46712 m!497001))

(declare-fun m!497003 () Bool)

(assert (=> start!46712 m!497003))

(declare-fun m!497005 () Bool)

(assert (=> b!515615 m!497005))

(declare-fun m!497007 () Bool)

(assert (=> b!515617 m!497007))

(declare-fun m!497009 () Bool)

(assert (=> b!515613 m!497009))

(assert (=> b!515613 m!496977))

(check-sat (not b!515615) (not b!515618) (not start!46712) (not b!515620) (not b!515614) (not b!515617) (not b!515616) (not b!515619) (not b!515612))
(check-sat)
