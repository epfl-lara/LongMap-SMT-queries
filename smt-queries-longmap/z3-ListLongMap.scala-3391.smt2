; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46760 () Bool)

(assert start!46760)

(declare-fun b!516403 () Bool)

(declare-fun res!315969 () Bool)

(declare-fun e!301387 () Bool)

(assert (=> b!516403 (=> (not res!315969) (not e!301387))))

(declare-datatypes ((array!33072 0))(
  ( (array!33073 (arr!15904 (Array (_ BitVec 32) (_ BitVec 64))) (size!16268 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33072)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516403 (= res!315969 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!315974 () Bool)

(assert (=> start!46760 (=> (not res!315974) (not e!301387))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46760 (= res!315974 (validMask!0 mask!3524))))

(assert (=> start!46760 e!301387))

(assert (=> start!46760 true))

(declare-fun array_inv!11700 (array!33072) Bool)

(assert (=> start!46760 (array_inv!11700 a!3235)))

(declare-fun b!516404 () Bool)

(declare-fun e!301386 () Bool)

(assert (=> b!516404 (= e!301387 e!301386)))

(declare-fun res!315973 () Bool)

(assert (=> b!516404 (=> (not res!315973) (not e!301386))))

(declare-datatypes ((SeekEntryResult!4371 0))(
  ( (MissingZero!4371 (index!19672 (_ BitVec 32))) (Found!4371 (index!19673 (_ BitVec 32))) (Intermediate!4371 (undefined!5183 Bool) (index!19674 (_ BitVec 32)) (x!48630 (_ BitVec 32))) (Undefined!4371) (MissingVacant!4371 (index!19675 (_ BitVec 32))) )
))
(declare-fun lt!236400 () SeekEntryResult!4371)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516404 (= res!315973 (or (= lt!236400 (MissingZero!4371 i!1204)) (= lt!236400 (MissingVacant!4371 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33072 (_ BitVec 32)) SeekEntryResult!4371)

(assert (=> b!516404 (= lt!236400 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516405 () Bool)

(declare-fun res!315975 () Bool)

(assert (=> b!516405 (=> (not res!315975) (not e!301386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33072 (_ BitVec 32)) Bool)

(assert (=> b!516405 (= res!315975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516406 () Bool)

(declare-fun res!315968 () Bool)

(assert (=> b!516406 (=> (not res!315968) (not e!301387))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516406 (= res!315968 (and (= (size!16268 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16268 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16268 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516407 () Bool)

(declare-fun e!301388 () Bool)

(assert (=> b!516407 (= e!301388 (= (seekEntryOrOpen!0 (select (arr!15904 a!3235) j!176) a!3235 mask!3524) (Found!4371 j!176)))))

(declare-fun b!516408 () Bool)

(declare-fun res!315967 () Bool)

(assert (=> b!516408 (=> (not res!315967) (not e!301386))))

(declare-datatypes ((List!10062 0))(
  ( (Nil!10059) (Cons!10058 (h!10956 (_ BitVec 64)) (t!16290 List!10062)) )
))
(declare-fun arrayNoDuplicates!0 (array!33072 (_ BitVec 32) List!10062) Bool)

(assert (=> b!516408 (= res!315967 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10059))))

(declare-fun b!516409 () Bool)

(declare-fun res!315970 () Bool)

(assert (=> b!516409 (=> (not res!315970) (not e!301387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516409 (= res!315970 (validKeyInArray!0 k0!2280))))

(declare-fun b!516410 () Bool)

(declare-fun res!315977 () Bool)

(assert (=> b!516410 (=> (not res!315977) (not e!301387))))

(assert (=> b!516410 (= res!315977 (validKeyInArray!0 (select (arr!15904 a!3235) j!176)))))

(declare-fun b!516411 () Bool)

(declare-fun e!301389 () Bool)

(assert (=> b!516411 (= e!301386 (not e!301389))))

(declare-fun res!315976 () Bool)

(assert (=> b!516411 (=> res!315976 e!301389)))

(declare-fun lt!236402 () SeekEntryResult!4371)

(declare-fun lt!236401 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33072 (_ BitVec 32)) SeekEntryResult!4371)

(assert (=> b!516411 (= res!315976 (= lt!236402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236401 (select (store (arr!15904 a!3235) i!1204 k0!2280) j!176) (array!33073 (store (arr!15904 a!3235) i!1204 k0!2280) (size!16268 a!3235)) mask!3524)))))

(declare-fun lt!236404 () (_ BitVec 32))

(assert (=> b!516411 (= lt!236402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236404 (select (arr!15904 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516411 (= lt!236401 (toIndex!0 (select (store (arr!15904 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516411 (= lt!236404 (toIndex!0 (select (arr!15904 a!3235) j!176) mask!3524))))

(assert (=> b!516411 e!301388))

(declare-fun res!315971 () Bool)

(assert (=> b!516411 (=> (not res!315971) (not e!301388))))

(assert (=> b!516411 (= res!315971 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16000 0))(
  ( (Unit!16001) )
))
(declare-fun lt!236403 () Unit!16000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16000)

(assert (=> b!516411 (= lt!236403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516412 () Bool)

(assert (=> b!516412 (= e!301389 true)))

(assert (=> b!516412 (and (bvslt (x!48630 lt!236402) #b01111111111111111111111111111110) (or (= (select (arr!15904 a!3235) (index!19674 lt!236402)) (select (arr!15904 a!3235) j!176)) (= (select (arr!15904 a!3235) (index!19674 lt!236402)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15904 a!3235) (index!19674 lt!236402)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516413 () Bool)

(declare-fun res!315972 () Bool)

(assert (=> b!516413 (=> res!315972 e!301389)))

(get-info :version)

(assert (=> b!516413 (= res!315972 (or (undefined!5183 lt!236402) (not ((_ is Intermediate!4371) lt!236402))))))

(assert (= (and start!46760 res!315974) b!516406))

(assert (= (and b!516406 res!315968) b!516410))

(assert (= (and b!516410 res!315977) b!516409))

(assert (= (and b!516409 res!315970) b!516403))

(assert (= (and b!516403 res!315969) b!516404))

(assert (= (and b!516404 res!315973) b!516405))

(assert (= (and b!516405 res!315975) b!516408))

(assert (= (and b!516408 res!315967) b!516411))

(assert (= (and b!516411 res!315971) b!516407))

(assert (= (and b!516411 (not res!315976)) b!516413))

(assert (= (and b!516413 (not res!315972)) b!516412))

(declare-fun m!497885 () Bool)

(assert (=> b!516403 m!497885))

(declare-fun m!497887 () Bool)

(assert (=> start!46760 m!497887))

(declare-fun m!497889 () Bool)

(assert (=> start!46760 m!497889))

(declare-fun m!497891 () Bool)

(assert (=> b!516407 m!497891))

(assert (=> b!516407 m!497891))

(declare-fun m!497893 () Bool)

(assert (=> b!516407 m!497893))

(declare-fun m!497895 () Bool)

(assert (=> b!516405 m!497895))

(declare-fun m!497897 () Bool)

(assert (=> b!516408 m!497897))

(declare-fun m!497899 () Bool)

(assert (=> b!516404 m!497899))

(declare-fun m!497901 () Bool)

(assert (=> b!516412 m!497901))

(assert (=> b!516412 m!497891))

(assert (=> b!516410 m!497891))

(assert (=> b!516410 m!497891))

(declare-fun m!497903 () Bool)

(assert (=> b!516410 m!497903))

(declare-fun m!497905 () Bool)

(assert (=> b!516409 m!497905))

(declare-fun m!497907 () Bool)

(assert (=> b!516411 m!497907))

(declare-fun m!497909 () Bool)

(assert (=> b!516411 m!497909))

(declare-fun m!497911 () Bool)

(assert (=> b!516411 m!497911))

(declare-fun m!497913 () Bool)

(assert (=> b!516411 m!497913))

(assert (=> b!516411 m!497907))

(assert (=> b!516411 m!497891))

(declare-fun m!497915 () Bool)

(assert (=> b!516411 m!497915))

(assert (=> b!516411 m!497891))

(assert (=> b!516411 m!497907))

(declare-fun m!497917 () Bool)

(assert (=> b!516411 m!497917))

(declare-fun m!497919 () Bool)

(assert (=> b!516411 m!497919))

(assert (=> b!516411 m!497891))

(declare-fun m!497921 () Bool)

(assert (=> b!516411 m!497921))

(check-sat (not b!516407) (not start!46760) (not b!516410) (not b!516411) (not b!516405) (not b!516404) (not b!516408) (not b!516403) (not b!516409))
(check-sat)
