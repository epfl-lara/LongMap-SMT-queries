; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46756 () Bool)

(assert start!46756)

(declare-fun b!516337 () Bool)

(declare-fun res!315904 () Bool)

(declare-fun e!301357 () Bool)

(assert (=> b!516337 (=> (not res!315904) (not e!301357))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33068 0))(
  ( (array!33069 (arr!15902 (Array (_ BitVec 32) (_ BitVec 64))) (size!16266 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33068)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!516337 (= res!315904 (and (= (size!16266 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16266 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16266 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516338 () Bool)

(declare-fun res!315902 () Bool)

(declare-fun e!301359 () Bool)

(assert (=> b!516338 (=> res!315902 e!301359)))

(declare-datatypes ((SeekEntryResult!4369 0))(
  ( (MissingZero!4369 (index!19664 (_ BitVec 32))) (Found!4369 (index!19665 (_ BitVec 32))) (Intermediate!4369 (undefined!5181 Bool) (index!19666 (_ BitVec 32)) (x!48620 (_ BitVec 32))) (Undefined!4369) (MissingVacant!4369 (index!19667 (_ BitVec 32))) )
))
(declare-fun lt!236372 () SeekEntryResult!4369)

(assert (=> b!516338 (= res!315902 (or (undefined!5181 lt!236372) (not (is-Intermediate!4369 lt!236372))))))

(declare-fun b!516339 () Bool)

(declare-fun res!315901 () Bool)

(assert (=> b!516339 (=> (not res!315901) (not e!301357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516339 (= res!315901 (validKeyInArray!0 (select (arr!15902 a!3235) j!176)))))

(declare-fun b!516340 () Bool)

(assert (=> b!516340 (= e!301359 true)))

(assert (=> b!516340 (and (bvslt (x!48620 lt!236372) #b01111111111111111111111111111110) (or (= (select (arr!15902 a!3235) (index!19666 lt!236372)) (select (arr!15902 a!3235) j!176)) (= (select (arr!15902 a!3235) (index!19666 lt!236372)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15902 a!3235) (index!19666 lt!236372)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!315906 () Bool)

(assert (=> start!46756 (=> (not res!315906) (not e!301357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46756 (= res!315906 (validMask!0 mask!3524))))

(assert (=> start!46756 e!301357))

(assert (=> start!46756 true))

(declare-fun array_inv!11698 (array!33068) Bool)

(assert (=> start!46756 (array_inv!11698 a!3235)))

(declare-fun b!516341 () Bool)

(declare-fun res!315909 () Bool)

(declare-fun e!301358 () Bool)

(assert (=> b!516341 (=> (not res!315909) (not e!301358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33068 (_ BitVec 32)) Bool)

(assert (=> b!516341 (= res!315909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516342 () Bool)

(declare-fun res!315908 () Bool)

(assert (=> b!516342 (=> (not res!315908) (not e!301358))))

(declare-datatypes ((List!10060 0))(
  ( (Nil!10057) (Cons!10056 (h!10954 (_ BitVec 64)) (t!16288 List!10060)) )
))
(declare-fun arrayNoDuplicates!0 (array!33068 (_ BitVec 32) List!10060) Bool)

(assert (=> b!516342 (= res!315908 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10057))))

(declare-fun b!516343 () Bool)

(declare-fun res!315905 () Bool)

(assert (=> b!516343 (=> (not res!315905) (not e!301357))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516343 (= res!315905 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516344 () Bool)

(assert (=> b!516344 (= e!301357 e!301358)))

(declare-fun res!315907 () Bool)

(assert (=> b!516344 (=> (not res!315907) (not e!301358))))

(declare-fun lt!236370 () SeekEntryResult!4369)

(assert (=> b!516344 (= res!315907 (or (= lt!236370 (MissingZero!4369 i!1204)) (= lt!236370 (MissingVacant!4369 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33068 (_ BitVec 32)) SeekEntryResult!4369)

(assert (=> b!516344 (= lt!236370 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516345 () Bool)

(declare-fun res!315903 () Bool)

(assert (=> b!516345 (=> (not res!315903) (not e!301357))))

(assert (=> b!516345 (= res!315903 (validKeyInArray!0 k!2280))))

(declare-fun b!516346 () Bool)

(assert (=> b!516346 (= e!301358 (not e!301359))))

(declare-fun res!315911 () Bool)

(assert (=> b!516346 (=> res!315911 e!301359)))

(declare-fun lt!236374 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33068 (_ BitVec 32)) SeekEntryResult!4369)

(assert (=> b!516346 (= res!315911 (= lt!236372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236374 (select (store (arr!15902 a!3235) i!1204 k!2280) j!176) (array!33069 (store (arr!15902 a!3235) i!1204 k!2280) (size!16266 a!3235)) mask!3524)))))

(declare-fun lt!236371 () (_ BitVec 32))

(assert (=> b!516346 (= lt!236372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236371 (select (arr!15902 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516346 (= lt!236374 (toIndex!0 (select (store (arr!15902 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516346 (= lt!236371 (toIndex!0 (select (arr!15902 a!3235) j!176) mask!3524))))

(declare-fun e!301356 () Bool)

(assert (=> b!516346 e!301356))

(declare-fun res!315910 () Bool)

(assert (=> b!516346 (=> (not res!315910) (not e!301356))))

(assert (=> b!516346 (= res!315910 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15996 0))(
  ( (Unit!15997) )
))
(declare-fun lt!236373 () Unit!15996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15996)

(assert (=> b!516346 (= lt!236373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516347 () Bool)

(assert (=> b!516347 (= e!301356 (= (seekEntryOrOpen!0 (select (arr!15902 a!3235) j!176) a!3235 mask!3524) (Found!4369 j!176)))))

(assert (= (and start!46756 res!315906) b!516337))

(assert (= (and b!516337 res!315904) b!516339))

(assert (= (and b!516339 res!315901) b!516345))

(assert (= (and b!516345 res!315903) b!516343))

(assert (= (and b!516343 res!315905) b!516344))

(assert (= (and b!516344 res!315907) b!516341))

(assert (= (and b!516341 res!315909) b!516342))

(assert (= (and b!516342 res!315908) b!516346))

(assert (= (and b!516346 res!315910) b!516347))

(assert (= (and b!516346 (not res!315911)) b!516338))

(assert (= (and b!516338 (not res!315902)) b!516340))

(declare-fun m!497809 () Bool)

(assert (=> b!516342 m!497809))

(declare-fun m!497811 () Bool)

(assert (=> b!516346 m!497811))

(declare-fun m!497813 () Bool)

(assert (=> b!516346 m!497813))

(declare-fun m!497815 () Bool)

(assert (=> b!516346 m!497815))

(declare-fun m!497817 () Bool)

(assert (=> b!516346 m!497817))

(declare-fun m!497819 () Bool)

(assert (=> b!516346 m!497819))

(assert (=> b!516346 m!497819))

(declare-fun m!497821 () Bool)

(assert (=> b!516346 m!497821))

(assert (=> b!516346 m!497811))

(declare-fun m!497823 () Bool)

(assert (=> b!516346 m!497823))

(assert (=> b!516346 m!497811))

(declare-fun m!497825 () Bool)

(assert (=> b!516346 m!497825))

(assert (=> b!516346 m!497819))

(declare-fun m!497827 () Bool)

(assert (=> b!516346 m!497827))

(assert (=> b!516339 m!497811))

(assert (=> b!516339 m!497811))

(declare-fun m!497829 () Bool)

(assert (=> b!516339 m!497829))

(declare-fun m!497831 () Bool)

(assert (=> b!516341 m!497831))

(declare-fun m!497833 () Bool)

(assert (=> start!46756 m!497833))

(declare-fun m!497835 () Bool)

(assert (=> start!46756 m!497835))

(declare-fun m!497837 () Bool)

(assert (=> b!516340 m!497837))

(assert (=> b!516340 m!497811))

(assert (=> b!516347 m!497811))

(assert (=> b!516347 m!497811))

(declare-fun m!497839 () Bool)

(assert (=> b!516347 m!497839))

(declare-fun m!497841 () Bool)

(assert (=> b!516345 m!497841))

(declare-fun m!497843 () Bool)

(assert (=> b!516343 m!497843))

(declare-fun m!497845 () Bool)

(assert (=> b!516344 m!497845))

(push 1)

