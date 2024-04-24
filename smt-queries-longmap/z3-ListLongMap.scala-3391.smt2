; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46748 () Bool)

(assert start!46748)

(declare-fun res!315936 () Bool)

(declare-fun e!301334 () Bool)

(assert (=> start!46748 (=> (not res!315936) (not e!301334))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46748 (= res!315936 (validMask!0 mask!3524))))

(assert (=> start!46748 e!301334))

(assert (=> start!46748 true))

(declare-datatypes ((array!33061 0))(
  ( (array!33062 (arr!15898 (Array (_ BitVec 32) (_ BitVec 64))) (size!16262 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33061)

(declare-fun array_inv!11757 (array!33061) Bool)

(assert (=> start!46748 (array_inv!11757 a!3235)))

(declare-fun b!516309 () Bool)

(declare-fun e!301332 () Bool)

(assert (=> b!516309 (= e!301334 e!301332)))

(declare-fun res!315937 () Bool)

(assert (=> b!516309 (=> (not res!315937) (not e!301332))))

(declare-datatypes ((SeekEntryResult!4321 0))(
  ( (MissingZero!4321 (index!19472 (_ BitVec 32))) (Found!4321 (index!19473 (_ BitVec 32))) (Intermediate!4321 (undefined!5133 Bool) (index!19474 (_ BitVec 32)) (x!48577 (_ BitVec 32))) (Undefined!4321) (MissingVacant!4321 (index!19475 (_ BitVec 32))) )
))
(declare-fun lt!236401 () SeekEntryResult!4321)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516309 (= res!315937 (or (= lt!236401 (MissingZero!4321 i!1204)) (= lt!236401 (MissingVacant!4321 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33061 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!516309 (= lt!236401 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516310 () Bool)

(declare-fun res!315932 () Bool)

(assert (=> b!516310 (=> (not res!315932) (not e!301334))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516310 (= res!315932 (validKeyInArray!0 (select (arr!15898 a!3235) j!176)))))

(declare-fun e!301331 () Bool)

(declare-fun b!516311 () Bool)

(assert (=> b!516311 (= e!301331 (= (seekEntryOrOpen!0 (select (arr!15898 a!3235) j!176) a!3235 mask!3524) (Found!4321 j!176)))))

(declare-fun b!516312 () Bool)

(declare-fun res!315929 () Bool)

(assert (=> b!516312 (=> (not res!315929) (not e!301334))))

(assert (=> b!516312 (= res!315929 (and (= (size!16262 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16262 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16262 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516313 () Bool)

(declare-fun res!315933 () Bool)

(assert (=> b!516313 (=> (not res!315933) (not e!301334))))

(assert (=> b!516313 (= res!315933 (validKeyInArray!0 k0!2280))))

(declare-fun b!516314 () Bool)

(declare-fun res!315935 () Bool)

(assert (=> b!516314 (=> (not res!315935) (not e!301334))))

(declare-fun arrayContainsKey!0 (array!33061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516314 (= res!315935 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516315 () Bool)

(declare-fun res!315927 () Bool)

(declare-fun e!301333 () Bool)

(assert (=> b!516315 (=> res!315927 e!301333)))

(declare-fun lt!236399 () SeekEntryResult!4321)

(get-info :version)

(assert (=> b!516315 (= res!315927 (or (undefined!5133 lt!236399) (not ((_ is Intermediate!4321) lt!236399))))))

(declare-fun b!516316 () Bool)

(declare-fun res!315930 () Bool)

(assert (=> b!516316 (=> (not res!315930) (not e!301332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33061 (_ BitVec 32)) Bool)

(assert (=> b!516316 (= res!315930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516317 () Bool)

(assert (=> b!516317 (= e!301333 true)))

(assert (=> b!516317 (and (bvslt (x!48577 lt!236399) #b01111111111111111111111111111110) (or (= (select (arr!15898 a!3235) (index!19474 lt!236399)) (select (arr!15898 a!3235) j!176)) (= (select (arr!15898 a!3235) (index!19474 lt!236399)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15898 a!3235) (index!19474 lt!236399)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516318 () Bool)

(declare-fun res!315934 () Bool)

(assert (=> b!516318 (=> (not res!315934) (not e!301332))))

(declare-datatypes ((List!9963 0))(
  ( (Nil!9960) (Cons!9959 (h!10857 (_ BitVec 64)) (t!16183 List!9963)) )
))
(declare-fun arrayNoDuplicates!0 (array!33061 (_ BitVec 32) List!9963) Bool)

(assert (=> b!516318 (= res!315934 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9960))))

(declare-fun b!516319 () Bool)

(assert (=> b!516319 (= e!301332 (not e!301333))))

(declare-fun res!315931 () Bool)

(assert (=> b!516319 (=> res!315931 e!301333)))

(declare-fun lt!236400 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33061 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!516319 (= res!315931 (= lt!236399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236400 (select (store (arr!15898 a!3235) i!1204 k0!2280) j!176) (array!33062 (store (arr!15898 a!3235) i!1204 k0!2280) (size!16262 a!3235)) mask!3524)))))

(declare-fun lt!236398 () (_ BitVec 32))

(assert (=> b!516319 (= lt!236399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236398 (select (arr!15898 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516319 (= lt!236400 (toIndex!0 (select (store (arr!15898 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516319 (= lt!236398 (toIndex!0 (select (arr!15898 a!3235) j!176) mask!3524))))

(assert (=> b!516319 e!301331))

(declare-fun res!315928 () Bool)

(assert (=> b!516319 (=> (not res!315928) (not e!301331))))

(assert (=> b!516319 (= res!315928 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15961 0))(
  ( (Unit!15962) )
))
(declare-fun lt!236397 () Unit!15961)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15961)

(assert (=> b!516319 (= lt!236397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46748 res!315936) b!516312))

(assert (= (and b!516312 res!315929) b!516310))

(assert (= (and b!516310 res!315932) b!516313))

(assert (= (and b!516313 res!315933) b!516314))

(assert (= (and b!516314 res!315935) b!516309))

(assert (= (and b!516309 res!315937) b!516316))

(assert (= (and b!516316 res!315930) b!516318))

(assert (= (and b!516318 res!315934) b!516319))

(assert (= (and b!516319 res!315928) b!516311))

(assert (= (and b!516319 (not res!315931)) b!516315))

(assert (= (and b!516315 (not res!315927)) b!516317))

(declare-fun m!498031 () Bool)

(assert (=> b!516310 m!498031))

(assert (=> b!516310 m!498031))

(declare-fun m!498033 () Bool)

(assert (=> b!516310 m!498033))

(declare-fun m!498035 () Bool)

(assert (=> b!516314 m!498035))

(declare-fun m!498037 () Bool)

(assert (=> b!516318 m!498037))

(declare-fun m!498039 () Bool)

(assert (=> b!516313 m!498039))

(assert (=> b!516311 m!498031))

(assert (=> b!516311 m!498031))

(declare-fun m!498041 () Bool)

(assert (=> b!516311 m!498041))

(declare-fun m!498043 () Bool)

(assert (=> b!516317 m!498043))

(assert (=> b!516317 m!498031))

(declare-fun m!498045 () Bool)

(assert (=> start!46748 m!498045))

(declare-fun m!498047 () Bool)

(assert (=> start!46748 m!498047))

(declare-fun m!498049 () Bool)

(assert (=> b!516316 m!498049))

(declare-fun m!498051 () Bool)

(assert (=> b!516309 m!498051))

(declare-fun m!498053 () Bool)

(assert (=> b!516319 m!498053))

(declare-fun m!498055 () Bool)

(assert (=> b!516319 m!498055))

(declare-fun m!498057 () Bool)

(assert (=> b!516319 m!498057))

(declare-fun m!498059 () Bool)

(assert (=> b!516319 m!498059))

(assert (=> b!516319 m!498053))

(assert (=> b!516319 m!498031))

(declare-fun m!498061 () Bool)

(assert (=> b!516319 m!498061))

(assert (=> b!516319 m!498053))

(declare-fun m!498063 () Bool)

(assert (=> b!516319 m!498063))

(assert (=> b!516319 m!498031))

(declare-fun m!498065 () Bool)

(assert (=> b!516319 m!498065))

(assert (=> b!516319 m!498031))

(declare-fun m!498067 () Bool)

(assert (=> b!516319 m!498067))

(check-sat (not b!516310) (not b!516318) (not start!46748) (not b!516314) (not b!516319) (not b!516311) (not b!516309) (not b!516316) (not b!516313))
(check-sat)
