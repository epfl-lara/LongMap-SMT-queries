; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45488 () Bool)

(assert start!45488)

(declare-fun b!500943 () Bool)

(declare-fun res!302715 () Bool)

(declare-fun e!293471 () Bool)

(assert (=> b!500943 (=> res!302715 e!293471)))

(declare-datatypes ((SeekEntryResult!4005 0))(
  ( (MissingZero!4005 (index!18202 (_ BitVec 32))) (Found!4005 (index!18203 (_ BitVec 32))) (Intermediate!4005 (undefined!4817 Bool) (index!18204 (_ BitVec 32)) (x!47234 (_ BitVec 32))) (Undefined!4005) (MissingVacant!4005 (index!18205 (_ BitVec 32))) )
))
(declare-fun lt!227450 () SeekEntryResult!4005)

(get-info :version)

(assert (=> b!500943 (= res!302715 (or (undefined!4817 lt!227450) (not ((_ is Intermediate!4005) lt!227450))))))

(declare-fun b!500944 () Bool)

(declare-fun res!302707 () Bool)

(declare-fun e!293474 () Bool)

(assert (=> b!500944 (=> (not res!302707) (not e!293474))))

(declare-datatypes ((array!32313 0))(
  ( (array!32314 (arr!15538 (Array (_ BitVec 32) (_ BitVec 64))) (size!15902 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32313)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500944 (= res!302707 (validKeyInArray!0 (select (arr!15538 a!3235) j!176)))))

(declare-fun b!500945 () Bool)

(declare-fun e!293477 () Bool)

(assert (=> b!500945 (= e!293474 e!293477)))

(declare-fun res!302712 () Bool)

(assert (=> b!500945 (=> (not res!302712) (not e!293477))))

(declare-fun lt!227454 () SeekEntryResult!4005)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500945 (= res!302712 (or (= lt!227454 (MissingZero!4005 i!1204)) (= lt!227454 (MissingVacant!4005 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32313 (_ BitVec 32)) SeekEntryResult!4005)

(assert (=> b!500945 (= lt!227454 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500946 () Bool)

(declare-datatypes ((Unit!15096 0))(
  ( (Unit!15097) )
))
(declare-fun e!293476 () Unit!15096)

(declare-fun Unit!15098 () Unit!15096)

(assert (=> b!500946 (= e!293476 Unit!15098)))

(declare-fun res!302713 () Bool)

(assert (=> start!45488 (=> (not res!302713) (not e!293474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45488 (= res!302713 (validMask!0 mask!3524))))

(assert (=> start!45488 e!293474))

(assert (=> start!45488 true))

(declare-fun array_inv!11334 (array!32313) Bool)

(assert (=> start!45488 (array_inv!11334 a!3235)))

(declare-fun b!500947 () Bool)

(declare-fun e!293478 () Bool)

(assert (=> b!500947 (= e!293478 false)))

(declare-fun b!500948 () Bool)

(declare-fun res!302716 () Bool)

(assert (=> b!500948 (=> (not res!302716) (not e!293474))))

(assert (=> b!500948 (= res!302716 (validKeyInArray!0 k0!2280))))

(declare-fun b!500949 () Bool)

(declare-fun e!293473 () Bool)

(assert (=> b!500949 (= e!293473 (= (seekEntryOrOpen!0 (select (arr!15538 a!3235) j!176) a!3235 mask!3524) (Found!4005 j!176)))))

(declare-fun b!500950 () Bool)

(declare-fun res!302711 () Bool)

(assert (=> b!500950 (=> (not res!302711) (not e!293477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32313 (_ BitVec 32)) Bool)

(assert (=> b!500950 (= res!302711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500951 () Bool)

(assert (=> b!500951 (= e!293477 (not e!293471))))

(declare-fun res!302709 () Bool)

(assert (=> b!500951 (=> res!302709 e!293471)))

(declare-fun lt!227449 () array!32313)

(declare-fun lt!227453 () (_ BitVec 32))

(declare-fun lt!227457 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32313 (_ BitVec 32)) SeekEntryResult!4005)

(assert (=> b!500951 (= res!302709 (= lt!227450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227453 lt!227457 lt!227449 mask!3524)))))

(declare-fun lt!227452 () (_ BitVec 32))

(assert (=> b!500951 (= lt!227450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227452 (select (arr!15538 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500951 (= lt!227453 (toIndex!0 lt!227457 mask!3524))))

(assert (=> b!500951 (= lt!227457 (select (store (arr!15538 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500951 (= lt!227452 (toIndex!0 (select (arr!15538 a!3235) j!176) mask!3524))))

(assert (=> b!500951 (= lt!227449 (array!32314 (store (arr!15538 a!3235) i!1204 k0!2280) (size!15902 a!3235)))))

(assert (=> b!500951 e!293473))

(declare-fun res!302714 () Bool)

(assert (=> b!500951 (=> (not res!302714) (not e!293473))))

(assert (=> b!500951 (= res!302714 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227455 () Unit!15096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15096)

(assert (=> b!500951 (= lt!227455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500952 () Bool)

(declare-fun Unit!15099 () Unit!15096)

(assert (=> b!500952 (= e!293476 Unit!15099)))

(declare-fun lt!227456 () Unit!15096)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15096)

(assert (=> b!500952 (= lt!227456 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227452 #b00000000000000000000000000000000 (index!18204 lt!227450) (x!47234 lt!227450) mask!3524))))

(declare-fun res!302717 () Bool)

(assert (=> b!500952 (= res!302717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227452 lt!227457 lt!227449 mask!3524) (Intermediate!4005 false (index!18204 lt!227450) (x!47234 lt!227450))))))

(assert (=> b!500952 (=> (not res!302717) (not e!293478))))

(assert (=> b!500952 e!293478))

(declare-fun b!500953 () Bool)

(declare-fun res!302708 () Bool)

(assert (=> b!500953 (=> (not res!302708) (not e!293477))))

(declare-datatypes ((List!9696 0))(
  ( (Nil!9693) (Cons!9692 (h!10566 (_ BitVec 64)) (t!15924 List!9696)) )
))
(declare-fun arrayNoDuplicates!0 (array!32313 (_ BitVec 32) List!9696) Bool)

(assert (=> b!500953 (= res!302708 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9693))))

(declare-fun b!500954 () Bool)

(declare-fun res!302706 () Bool)

(assert (=> b!500954 (=> (not res!302706) (not e!293474))))

(declare-fun arrayContainsKey!0 (array!32313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500954 (= res!302706 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500955 () Bool)

(declare-fun e!293472 () Bool)

(assert (=> b!500955 (= e!293471 e!293472)))

(declare-fun res!302710 () Bool)

(assert (=> b!500955 (=> res!302710 e!293472)))

(assert (=> b!500955 (= res!302710 (or (bvsgt #b00000000000000000000000000000000 (x!47234 lt!227450)) (bvsgt (x!47234 lt!227450) #b01111111111111111111111111111110) (bvslt lt!227452 #b00000000000000000000000000000000) (bvsge lt!227452 (size!15902 a!3235)) (bvslt (index!18204 lt!227450) #b00000000000000000000000000000000) (bvsge (index!18204 lt!227450) (size!15902 a!3235)) (not (= lt!227450 (Intermediate!4005 false (index!18204 lt!227450) (x!47234 lt!227450))))))))

(assert (=> b!500955 (and (or (= (select (arr!15538 a!3235) (index!18204 lt!227450)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15538 a!3235) (index!18204 lt!227450)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15538 a!3235) (index!18204 lt!227450)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15538 a!3235) (index!18204 lt!227450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227451 () Unit!15096)

(assert (=> b!500955 (= lt!227451 e!293476)))

(declare-fun c!59396 () Bool)

(assert (=> b!500955 (= c!59396 (= (select (arr!15538 a!3235) (index!18204 lt!227450)) (select (arr!15538 a!3235) j!176)))))

(assert (=> b!500955 (and (bvslt (x!47234 lt!227450) #b01111111111111111111111111111110) (or (= (select (arr!15538 a!3235) (index!18204 lt!227450)) (select (arr!15538 a!3235) j!176)) (= (select (arr!15538 a!3235) (index!18204 lt!227450)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15538 a!3235) (index!18204 lt!227450)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500956 () Bool)

(assert (=> b!500956 (= e!293472 true)))

(declare-fun lt!227458 () SeekEntryResult!4005)

(assert (=> b!500956 (= lt!227458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227452 lt!227457 lt!227449 mask!3524))))

(declare-fun b!500957 () Bool)

(declare-fun res!302705 () Bool)

(assert (=> b!500957 (=> (not res!302705) (not e!293474))))

(assert (=> b!500957 (= res!302705 (and (= (size!15902 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15902 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15902 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45488 res!302713) b!500957))

(assert (= (and b!500957 res!302705) b!500944))

(assert (= (and b!500944 res!302707) b!500948))

(assert (= (and b!500948 res!302716) b!500954))

(assert (= (and b!500954 res!302706) b!500945))

(assert (= (and b!500945 res!302712) b!500950))

(assert (= (and b!500950 res!302711) b!500953))

(assert (= (and b!500953 res!302708) b!500951))

(assert (= (and b!500951 res!302714) b!500949))

(assert (= (and b!500951 (not res!302709)) b!500943))

(assert (= (and b!500943 (not res!302715)) b!500955))

(assert (= (and b!500955 c!59396) b!500952))

(assert (= (and b!500955 (not c!59396)) b!500946))

(assert (= (and b!500952 res!302717) b!500947))

(assert (= (and b!500955 (not res!302710)) b!500956))

(declare-fun m!482043 () Bool)

(assert (=> b!500945 m!482043))

(declare-fun m!482045 () Bool)

(assert (=> b!500952 m!482045))

(declare-fun m!482047 () Bool)

(assert (=> b!500952 m!482047))

(declare-fun m!482049 () Bool)

(assert (=> start!45488 m!482049))

(declare-fun m!482051 () Bool)

(assert (=> start!45488 m!482051))

(declare-fun m!482053 () Bool)

(assert (=> b!500954 m!482053))

(assert (=> b!500956 m!482047))

(declare-fun m!482055 () Bool)

(assert (=> b!500953 m!482055))

(declare-fun m!482057 () Bool)

(assert (=> b!500951 m!482057))

(declare-fun m!482059 () Bool)

(assert (=> b!500951 m!482059))

(declare-fun m!482061 () Bool)

(assert (=> b!500951 m!482061))

(declare-fun m!482063 () Bool)

(assert (=> b!500951 m!482063))

(declare-fun m!482065 () Bool)

(assert (=> b!500951 m!482065))

(declare-fun m!482067 () Bool)

(assert (=> b!500951 m!482067))

(assert (=> b!500951 m!482057))

(declare-fun m!482069 () Bool)

(assert (=> b!500951 m!482069))

(assert (=> b!500951 m!482057))

(declare-fun m!482071 () Bool)

(assert (=> b!500951 m!482071))

(declare-fun m!482073 () Bool)

(assert (=> b!500951 m!482073))

(assert (=> b!500944 m!482057))

(assert (=> b!500944 m!482057))

(declare-fun m!482075 () Bool)

(assert (=> b!500944 m!482075))

(declare-fun m!482077 () Bool)

(assert (=> b!500948 m!482077))

(assert (=> b!500949 m!482057))

(assert (=> b!500949 m!482057))

(declare-fun m!482079 () Bool)

(assert (=> b!500949 m!482079))

(declare-fun m!482081 () Bool)

(assert (=> b!500955 m!482081))

(assert (=> b!500955 m!482057))

(declare-fun m!482083 () Bool)

(assert (=> b!500950 m!482083))

(check-sat (not start!45488) (not b!500954) (not b!500953) (not b!500948) (not b!500945) (not b!500950) (not b!500944) (not b!500952) (not b!500949) (not b!500956) (not b!500951))
(check-sat)
