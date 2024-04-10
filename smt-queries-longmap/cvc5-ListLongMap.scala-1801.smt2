; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32506 () Bool)

(assert start!32506)

(declare-fun b!325043 () Bool)

(declare-fun res!178379 () Bool)

(declare-fun e!200460 () Bool)

(assert (=> b!325043 (=> (not res!178379) (not e!200460))))

(declare-datatypes ((array!16645 0))(
  ( (array!16646 (arr!7880 (Array (_ BitVec 32) (_ BitVec 64))) (size!8232 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16645)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325043 (= res!178379 (and (= (select (arr!7880 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8232 a!3305))))))

(declare-fun b!325044 () Bool)

(declare-fun e!200459 () Bool)

(assert (=> b!325044 (= e!200459 e!200460)))

(declare-fun res!178380 () Bool)

(assert (=> b!325044 (=> (not res!178380) (not e!200460))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3011 0))(
  ( (MissingZero!3011 (index!14220 (_ BitVec 32))) (Found!3011 (index!14221 (_ BitVec 32))) (Intermediate!3011 (undefined!3823 Bool) (index!14222 (_ BitVec 32)) (x!32463 (_ BitVec 32))) (Undefined!3011) (MissingVacant!3011 (index!14223 (_ BitVec 32))) )
))
(declare-fun lt!156924 () SeekEntryResult!3011)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16645 (_ BitVec 32)) SeekEntryResult!3011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325044 (= res!178380 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156924))))

(assert (=> b!325044 (= lt!156924 (Intermediate!3011 false resIndex!58 resX!58))))

(declare-fun b!325045 () Bool)

(declare-fun res!178382 () Bool)

(assert (=> b!325045 (=> (not res!178382) (not e!200459))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16645 (_ BitVec 32)) SeekEntryResult!3011)

(assert (=> b!325045 (= res!178382 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3011 i!1250)))))

(declare-fun b!325046 () Bool)

(declare-fun res!178375 () Bool)

(assert (=> b!325046 (=> (not res!178375) (not e!200459))))

(assert (=> b!325046 (= res!178375 (and (= (size!8232 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8232 a!3305))))))

(declare-fun b!325047 () Bool)

(declare-fun res!178374 () Bool)

(assert (=> b!325047 (=> (not res!178374) (not e!200460))))

(assert (=> b!325047 (= res!178374 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7880 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325048 () Bool)

(declare-fun res!178376 () Bool)

(assert (=> b!325048 (=> (not res!178376) (not e!200459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325048 (= res!178376 (validKeyInArray!0 k!2497))))

(declare-fun b!325050 () Bool)

(assert (=> b!325050 (= e!200460 false)))

(declare-fun lt!156923 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325050 (= lt!156923 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325051 () Bool)

(declare-fun res!178378 () Bool)

(assert (=> b!325051 (=> (not res!178378) (not e!200459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16645 (_ BitVec 32)) Bool)

(assert (=> b!325051 (= res!178378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325052 () Bool)

(declare-fun res!178377 () Bool)

(assert (=> b!325052 (=> (not res!178377) (not e!200459))))

(declare-fun arrayContainsKey!0 (array!16645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325052 (= res!178377 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325049 () Bool)

(declare-fun res!178381 () Bool)

(assert (=> b!325049 (=> (not res!178381) (not e!200460))))

(assert (=> b!325049 (= res!178381 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156924))))

(declare-fun res!178383 () Bool)

(assert (=> start!32506 (=> (not res!178383) (not e!200459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32506 (= res!178383 (validMask!0 mask!3777))))

(assert (=> start!32506 e!200459))

(declare-fun array_inv!5843 (array!16645) Bool)

(assert (=> start!32506 (array_inv!5843 a!3305)))

(assert (=> start!32506 true))

(assert (= (and start!32506 res!178383) b!325046))

(assert (= (and b!325046 res!178375) b!325048))

(assert (= (and b!325048 res!178376) b!325052))

(assert (= (and b!325052 res!178377) b!325045))

(assert (= (and b!325045 res!178382) b!325051))

(assert (= (and b!325051 res!178378) b!325044))

(assert (= (and b!325044 res!178380) b!325043))

(assert (= (and b!325043 res!178379) b!325049))

(assert (= (and b!325049 res!178381) b!325047))

(assert (= (and b!325047 res!178374) b!325050))

(declare-fun m!331967 () Bool)

(assert (=> b!325050 m!331967))

(declare-fun m!331969 () Bool)

(assert (=> b!325045 m!331969))

(declare-fun m!331971 () Bool)

(assert (=> b!325049 m!331971))

(declare-fun m!331973 () Bool)

(assert (=> b!325048 m!331973))

(declare-fun m!331975 () Bool)

(assert (=> b!325044 m!331975))

(assert (=> b!325044 m!331975))

(declare-fun m!331977 () Bool)

(assert (=> b!325044 m!331977))

(declare-fun m!331979 () Bool)

(assert (=> b!325052 m!331979))

(declare-fun m!331981 () Bool)

(assert (=> b!325043 m!331981))

(declare-fun m!331983 () Bool)

(assert (=> start!32506 m!331983))

(declare-fun m!331985 () Bool)

(assert (=> start!32506 m!331985))

(declare-fun m!331987 () Bool)

(assert (=> b!325051 m!331987))

(declare-fun m!331989 () Bool)

(assert (=> b!325047 m!331989))

(push 1)

(assert (not b!325044))

(assert (not b!325045))

(assert (not start!32506))

(assert (not b!325049))

(assert (not b!325050))

(assert (not b!325048))

(assert (not b!325052))

(assert (not b!325051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

