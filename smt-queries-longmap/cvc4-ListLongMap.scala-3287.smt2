; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45670 () Bool)

(assert start!45670)

(declare-fun b!504013 () Bool)

(declare-fun e!295131 () Bool)

(assert (=> b!504013 (= e!295131 false)))

(declare-fun b!504014 () Bool)

(declare-datatypes ((Unit!15316 0))(
  ( (Unit!15317) )
))
(declare-fun e!295128 () Unit!15316)

(declare-fun Unit!15318 () Unit!15316)

(assert (=> b!504014 (= e!295128 Unit!15318)))

(declare-fun b!504015 () Bool)

(declare-fun res!305247 () Bool)

(declare-fun e!295133 () Bool)

(assert (=> b!504015 (=> (not res!305247) (not e!295133))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504015 (= res!305247 (validKeyInArray!0 k!2280))))

(declare-fun b!504016 () Bool)

(declare-fun res!305252 () Bool)

(assert (=> b!504016 (=> (not res!305252) (not e!295133))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32426 0))(
  ( (array!32427 (arr!15593 (Array (_ BitVec 32) (_ BitVec 64))) (size!15957 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32426)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504016 (= res!305252 (and (= (size!15957 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15957 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15957 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504017 () Bool)

(declare-fun res!305249 () Bool)

(assert (=> b!504017 (=> (not res!305249) (not e!295133))))

(assert (=> b!504017 (= res!305249 (validKeyInArray!0 (select (arr!15593 a!3235) j!176)))))

(declare-fun b!504018 () Bool)

(declare-fun e!295130 () Bool)

(assert (=> b!504018 (= e!295133 e!295130)))

(declare-fun res!305248 () Bool)

(assert (=> b!504018 (=> (not res!305248) (not e!295130))))

(declare-datatypes ((SeekEntryResult!4060 0))(
  ( (MissingZero!4060 (index!18428 (_ BitVec 32))) (Found!4060 (index!18429 (_ BitVec 32))) (Intermediate!4060 (undefined!4872 Bool) (index!18430 (_ BitVec 32)) (x!47445 (_ BitVec 32))) (Undefined!4060) (MissingVacant!4060 (index!18431 (_ BitVec 32))) )
))
(declare-fun lt!229404 () SeekEntryResult!4060)

(assert (=> b!504018 (= res!305248 (or (= lt!229404 (MissingZero!4060 i!1204)) (= lt!229404 (MissingVacant!4060 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32426 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!504018 (= lt!229404 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504019 () Bool)

(declare-fun e!295134 () Bool)

(declare-fun e!295132 () Bool)

(assert (=> b!504019 (= e!295134 e!295132)))

(declare-fun res!305246 () Bool)

(assert (=> b!504019 (=> res!305246 e!295132)))

(declare-fun lt!229399 () (_ BitVec 32))

(declare-fun lt!229405 () SeekEntryResult!4060)

(assert (=> b!504019 (= res!305246 (or (bvsgt (x!47445 lt!229405) #b01111111111111111111111111111110) (bvslt lt!229399 #b00000000000000000000000000000000) (bvsge lt!229399 (size!15957 a!3235)) (bvslt (index!18430 lt!229405) #b00000000000000000000000000000000) (bvsge (index!18430 lt!229405) (size!15957 a!3235)) (not (= lt!229405 (Intermediate!4060 false (index!18430 lt!229405) (x!47445 lt!229405))))))))

(assert (=> b!504019 (= (index!18430 lt!229405) i!1204)))

(declare-fun lt!229401 () Unit!15316)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32426 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15316)

(assert (=> b!504019 (= lt!229401 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229399 #b00000000000000000000000000000000 (index!18430 lt!229405) (x!47445 lt!229405) mask!3524))))

(assert (=> b!504019 (and (or (= (select (arr!15593 a!3235) (index!18430 lt!229405)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15593 a!3235) (index!18430 lt!229405)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15593 a!3235) (index!18430 lt!229405)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15593 a!3235) (index!18430 lt!229405)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229402 () Unit!15316)

(assert (=> b!504019 (= lt!229402 e!295128)))

(declare-fun c!59663 () Bool)

(assert (=> b!504019 (= c!59663 (= (select (arr!15593 a!3235) (index!18430 lt!229405)) (select (arr!15593 a!3235) j!176)))))

(assert (=> b!504019 (and (bvslt (x!47445 lt!229405) #b01111111111111111111111111111110) (or (= (select (arr!15593 a!3235) (index!18430 lt!229405)) (select (arr!15593 a!3235) j!176)) (= (select (arr!15593 a!3235) (index!18430 lt!229405)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15593 a!3235) (index!18430 lt!229405)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504020 () Bool)

(declare-fun res!305250 () Bool)

(assert (=> b!504020 (=> res!305250 e!295132)))

(declare-fun e!295127 () Bool)

(assert (=> b!504020 (= res!305250 e!295127)))

(declare-fun res!305253 () Bool)

(assert (=> b!504020 (=> (not res!305253) (not e!295127))))

(assert (=> b!504020 (= res!305253 (bvsgt #b00000000000000000000000000000000 (x!47445 lt!229405)))))

(declare-fun b!504021 () Bool)

(declare-fun res!305251 () Bool)

(assert (=> b!504021 (=> (not res!305251) (not e!295133))))

(declare-fun arrayContainsKey!0 (array!32426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504021 (= res!305251 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504022 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32426 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!504022 (= e!295127 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229399 (index!18430 lt!229405) (select (arr!15593 a!3235) j!176) a!3235 mask!3524) (Found!4060 j!176))))))

(declare-fun b!504023 () Bool)

(declare-fun res!305255 () Bool)

(assert (=> b!504023 (=> (not res!305255) (not e!295130))))

(declare-datatypes ((List!9751 0))(
  ( (Nil!9748) (Cons!9747 (h!10624 (_ BitVec 64)) (t!15979 List!9751)) )
))
(declare-fun arrayNoDuplicates!0 (array!32426 (_ BitVec 32) List!9751) Bool)

(assert (=> b!504023 (= res!305255 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9748))))

(declare-fun b!504024 () Bool)

(declare-fun res!305254 () Bool)

(assert (=> b!504024 (=> (not res!305254) (not e!295130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32426 (_ BitVec 32)) Bool)

(assert (=> b!504024 (= res!305254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504025 () Bool)

(assert (=> b!504025 (= e!295130 (not e!295134))))

(declare-fun res!305258 () Bool)

(assert (=> b!504025 (=> res!305258 e!295134)))

(declare-fun lt!229396 () (_ BitVec 64))

(declare-fun lt!229400 () (_ BitVec 32))

(declare-fun lt!229397 () array!32426)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32426 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!504025 (= res!305258 (= lt!229405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229400 lt!229396 lt!229397 mask!3524)))))

(assert (=> b!504025 (= lt!229405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229399 (select (arr!15593 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504025 (= lt!229400 (toIndex!0 lt!229396 mask!3524))))

(assert (=> b!504025 (= lt!229396 (select (store (arr!15593 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504025 (= lt!229399 (toIndex!0 (select (arr!15593 a!3235) j!176) mask!3524))))

(assert (=> b!504025 (= lt!229397 (array!32427 (store (arr!15593 a!3235) i!1204 k!2280) (size!15957 a!3235)))))

(declare-fun e!295126 () Bool)

(assert (=> b!504025 e!295126))

(declare-fun res!305245 () Bool)

(assert (=> b!504025 (=> (not res!305245) (not e!295126))))

(assert (=> b!504025 (= res!305245 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229395 () Unit!15316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15316)

(assert (=> b!504025 (= lt!229395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504026 () Bool)

(declare-fun res!305244 () Bool)

(assert (=> b!504026 (=> res!305244 e!295134)))

(assert (=> b!504026 (= res!305244 (or (undefined!4872 lt!229405) (not (is-Intermediate!4060 lt!229405))))))

(declare-fun b!504027 () Bool)

(assert (=> b!504027 (= e!295126 (= (seekEntryOrOpen!0 (select (arr!15593 a!3235) j!176) a!3235 mask!3524) (Found!4060 j!176)))))

(declare-fun res!305257 () Bool)

(assert (=> start!45670 (=> (not res!305257) (not e!295133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45670 (= res!305257 (validMask!0 mask!3524))))

(assert (=> start!45670 e!295133))

(assert (=> start!45670 true))

(declare-fun array_inv!11389 (array!32426) Bool)

(assert (=> start!45670 (array_inv!11389 a!3235)))

(declare-fun b!504028 () Bool)

(assert (=> b!504028 (= e!295132 true)))

(declare-fun lt!229398 () SeekEntryResult!4060)

(assert (=> b!504028 (= lt!229398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229399 lt!229396 lt!229397 mask!3524))))

(declare-fun b!504029 () Bool)

(declare-fun Unit!15319 () Unit!15316)

(assert (=> b!504029 (= e!295128 Unit!15319)))

(declare-fun lt!229403 () Unit!15316)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32426 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15316)

(assert (=> b!504029 (= lt!229403 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229399 #b00000000000000000000000000000000 (index!18430 lt!229405) (x!47445 lt!229405) mask!3524))))

(declare-fun res!305256 () Bool)

(assert (=> b!504029 (= res!305256 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229399 lt!229396 lt!229397 mask!3524) (Intermediate!4060 false (index!18430 lt!229405) (x!47445 lt!229405))))))

(assert (=> b!504029 (=> (not res!305256) (not e!295131))))

(assert (=> b!504029 e!295131))

(assert (= (and start!45670 res!305257) b!504016))

(assert (= (and b!504016 res!305252) b!504017))

(assert (= (and b!504017 res!305249) b!504015))

(assert (= (and b!504015 res!305247) b!504021))

(assert (= (and b!504021 res!305251) b!504018))

(assert (= (and b!504018 res!305248) b!504024))

(assert (= (and b!504024 res!305254) b!504023))

(assert (= (and b!504023 res!305255) b!504025))

(assert (= (and b!504025 res!305245) b!504027))

(assert (= (and b!504025 (not res!305258)) b!504026))

(assert (= (and b!504026 (not res!305244)) b!504019))

(assert (= (and b!504019 c!59663) b!504029))

(assert (= (and b!504019 (not c!59663)) b!504014))

(assert (= (and b!504029 res!305256) b!504013))

(assert (= (and b!504019 (not res!305246)) b!504020))

(assert (= (and b!504020 res!305253) b!504022))

(assert (= (and b!504020 (not res!305250)) b!504028))

(declare-fun m!484793 () Bool)

(assert (=> b!504028 m!484793))

(declare-fun m!484795 () Bool)

(assert (=> b!504023 m!484795))

(declare-fun m!484797 () Bool)

(assert (=> b!504022 m!484797))

(assert (=> b!504022 m!484797))

(declare-fun m!484799 () Bool)

(assert (=> b!504022 m!484799))

(declare-fun m!484801 () Bool)

(assert (=> b!504015 m!484801))

(declare-fun m!484803 () Bool)

(assert (=> b!504019 m!484803))

(declare-fun m!484805 () Bool)

(assert (=> b!504019 m!484805))

(assert (=> b!504019 m!484797))

(assert (=> b!504017 m!484797))

(assert (=> b!504017 m!484797))

(declare-fun m!484807 () Bool)

(assert (=> b!504017 m!484807))

(declare-fun m!484809 () Bool)

(assert (=> b!504029 m!484809))

(assert (=> b!504029 m!484793))

(declare-fun m!484811 () Bool)

(assert (=> start!45670 m!484811))

(declare-fun m!484813 () Bool)

(assert (=> start!45670 m!484813))

(declare-fun m!484815 () Bool)

(assert (=> b!504024 m!484815))

(declare-fun m!484817 () Bool)

(assert (=> b!504021 m!484817))

(declare-fun m!484819 () Bool)

(assert (=> b!504025 m!484819))

(declare-fun m!484821 () Bool)

(assert (=> b!504025 m!484821))

(declare-fun m!484823 () Bool)

(assert (=> b!504025 m!484823))

(declare-fun m!484825 () Bool)

(assert (=> b!504025 m!484825))

(assert (=> b!504025 m!484797))

(declare-fun m!484827 () Bool)

(assert (=> b!504025 m!484827))

(assert (=> b!504025 m!484797))

(declare-fun m!484829 () Bool)

(assert (=> b!504025 m!484829))

(assert (=> b!504025 m!484797))

(declare-fun m!484831 () Bool)

(assert (=> b!504025 m!484831))

(declare-fun m!484833 () Bool)

(assert (=> b!504025 m!484833))

(assert (=> b!504027 m!484797))

(assert (=> b!504027 m!484797))

(declare-fun m!484835 () Bool)

(assert (=> b!504027 m!484835))

(declare-fun m!484837 () Bool)

(assert (=> b!504018 m!484837))

(push 1)

