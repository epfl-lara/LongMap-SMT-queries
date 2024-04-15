; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47136 () Bool)

(assert start!47136)

(declare-fun b!518982 () Bool)

(declare-datatypes ((Unit!16066 0))(
  ( (Unit!16067) )
))
(declare-fun e!302809 () Unit!16066)

(declare-fun Unit!16068 () Unit!16066)

(assert (=> b!518982 (= e!302809 Unit!16068)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!237523 () (_ BitVec 32))

(declare-datatypes ((array!33161 0))(
  ( (array!33162 (arr!15941 (Array (_ BitVec 32) (_ BitVec 64))) (size!16306 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33161)

(declare-fun lt!237521 () Unit!16066)

(declare-datatypes ((SeekEntryResult!4405 0))(
  ( (MissingZero!4405 (index!19814 (_ BitVec 32))) (Found!4405 (index!19815 (_ BitVec 32))) (Intermediate!4405 (undefined!5217 Bool) (index!19816 (_ BitVec 32)) (x!48799 (_ BitVec 32))) (Undefined!4405) (MissingVacant!4405 (index!19817 (_ BitVec 32))) )
))
(declare-fun lt!237519 () SeekEntryResult!4405)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16066)

(assert (=> b!518982 (= lt!237521 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237523 #b00000000000000000000000000000000 (index!19816 lt!237519) (x!48799 lt!237519) mask!3524))))

(declare-fun lt!237526 () (_ BitVec 64))

(declare-fun res!317697 () Bool)

(declare-fun lt!237522 () array!33161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33161 (_ BitVec 32)) SeekEntryResult!4405)

(assert (=> b!518982 (= res!317697 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237523 lt!237526 lt!237522 mask!3524) (Intermediate!4405 false (index!19816 lt!237519) (x!48799 lt!237519))))))

(declare-fun e!302813 () Bool)

(assert (=> b!518982 (=> (not res!317697) (not e!302813))))

(assert (=> b!518982 e!302813))

(declare-fun b!518983 () Bool)

(declare-fun res!317701 () Bool)

(declare-fun e!302814 () Bool)

(assert (=> b!518983 (=> (not res!317701) (not e!302814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518983 (= res!317701 (validKeyInArray!0 (select (arr!15941 a!3235) j!176)))))

(declare-fun b!518984 () Bool)

(declare-fun res!317699 () Bool)

(assert (=> b!518984 (=> (not res!317699) (not e!302814))))

(assert (=> b!518984 (= res!317699 (validKeyInArray!0 k0!2280))))

(declare-fun b!518985 () Bool)

(declare-fun e!302811 () Bool)

(assert (=> b!518985 (= e!302811 (or (= (select (arr!15941 a!3235) (index!19816 lt!237519)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15941 a!3235) (index!19816 lt!237519)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237524 () Unit!16066)

(assert (=> b!518985 (= lt!237524 e!302809)))

(declare-fun c!60939 () Bool)

(assert (=> b!518985 (= c!60939 (= (select (arr!15941 a!3235) (index!19816 lt!237519)) (select (arr!15941 a!3235) j!176)))))

(assert (=> b!518985 (and (bvslt (x!48799 lt!237519) #b01111111111111111111111111111110) (or (= (select (arr!15941 a!3235) (index!19816 lt!237519)) (select (arr!15941 a!3235) j!176)) (= (select (arr!15941 a!3235) (index!19816 lt!237519)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15941 a!3235) (index!19816 lt!237519)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!317702 () Bool)

(assert (=> start!47136 (=> (not res!317702) (not e!302814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47136 (= res!317702 (validMask!0 mask!3524))))

(assert (=> start!47136 e!302814))

(assert (=> start!47136 true))

(declare-fun array_inv!11824 (array!33161) Bool)

(assert (=> start!47136 (array_inv!11824 a!3235)))

(declare-fun b!518986 () Bool)

(declare-fun Unit!16069 () Unit!16066)

(assert (=> b!518986 (= e!302809 Unit!16069)))

(declare-fun b!518987 () Bool)

(declare-fun res!317703 () Bool)

(assert (=> b!518987 (=> (not res!317703) (not e!302814))))

(assert (=> b!518987 (= res!317703 (and (= (size!16306 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16306 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16306 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518988 () Bool)

(declare-fun res!317698 () Bool)

(assert (=> b!518988 (=> res!317698 e!302811)))

(get-info :version)

(assert (=> b!518988 (= res!317698 (or (undefined!5217 lt!237519) (not ((_ is Intermediate!4405) lt!237519))))))

(declare-fun b!518989 () Bool)

(declare-fun res!317708 () Bool)

(declare-fun e!302810 () Bool)

(assert (=> b!518989 (=> (not res!317708) (not e!302810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33161 (_ BitVec 32)) Bool)

(assert (=> b!518989 (= res!317708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518990 () Bool)

(assert (=> b!518990 (= e!302813 false)))

(declare-fun b!518991 () Bool)

(declare-fun res!317705 () Bool)

(assert (=> b!518991 (=> (not res!317705) (not e!302810))))

(declare-datatypes ((List!10138 0))(
  ( (Nil!10135) (Cons!10134 (h!11047 (_ BitVec 64)) (t!16357 List!10138)) )
))
(declare-fun arrayNoDuplicates!0 (array!33161 (_ BitVec 32) List!10138) Bool)

(assert (=> b!518991 (= res!317705 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10135))))

(declare-fun b!518992 () Bool)

(declare-fun res!317704 () Bool)

(assert (=> b!518992 (=> (not res!317704) (not e!302814))))

(declare-fun arrayContainsKey!0 (array!33161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518992 (= res!317704 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun e!302808 () Bool)

(declare-fun b!518993 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33161 (_ BitVec 32)) SeekEntryResult!4405)

(assert (=> b!518993 (= e!302808 (= (seekEntryOrOpen!0 (select (arr!15941 a!3235) j!176) a!3235 mask!3524) (Found!4405 j!176)))))

(declare-fun b!518994 () Bool)

(assert (=> b!518994 (= e!302814 e!302810)))

(declare-fun res!317707 () Bool)

(assert (=> b!518994 (=> (not res!317707) (not e!302810))))

(declare-fun lt!237518 () SeekEntryResult!4405)

(assert (=> b!518994 (= res!317707 (or (= lt!237518 (MissingZero!4405 i!1204)) (= lt!237518 (MissingVacant!4405 i!1204))))))

(assert (=> b!518994 (= lt!237518 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518995 () Bool)

(assert (=> b!518995 (= e!302810 (not e!302811))))

(declare-fun res!317700 () Bool)

(assert (=> b!518995 (=> res!317700 e!302811)))

(declare-fun lt!237525 () (_ BitVec 32))

(assert (=> b!518995 (= res!317700 (= lt!237519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237525 lt!237526 lt!237522 mask!3524)))))

(assert (=> b!518995 (= lt!237519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237523 (select (arr!15941 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518995 (= lt!237525 (toIndex!0 lt!237526 mask!3524))))

(assert (=> b!518995 (= lt!237526 (select (store (arr!15941 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518995 (= lt!237523 (toIndex!0 (select (arr!15941 a!3235) j!176) mask!3524))))

(assert (=> b!518995 (= lt!237522 (array!33162 (store (arr!15941 a!3235) i!1204 k0!2280) (size!16306 a!3235)))))

(assert (=> b!518995 e!302808))

(declare-fun res!317706 () Bool)

(assert (=> b!518995 (=> (not res!317706) (not e!302808))))

(assert (=> b!518995 (= res!317706 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237520 () Unit!16066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16066)

(assert (=> b!518995 (= lt!237520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47136 res!317702) b!518987))

(assert (= (and b!518987 res!317703) b!518983))

(assert (= (and b!518983 res!317701) b!518984))

(assert (= (and b!518984 res!317699) b!518992))

(assert (= (and b!518992 res!317704) b!518994))

(assert (= (and b!518994 res!317707) b!518989))

(assert (= (and b!518989 res!317708) b!518991))

(assert (= (and b!518991 res!317705) b!518995))

(assert (= (and b!518995 res!317706) b!518993))

(assert (= (and b!518995 (not res!317700)) b!518988))

(assert (= (and b!518988 (not res!317698)) b!518985))

(assert (= (and b!518985 c!60939) b!518982))

(assert (= (and b!518985 (not c!60939)) b!518986))

(assert (= (and b!518982 res!317697) b!518990))

(declare-fun m!499693 () Bool)

(assert (=> b!518982 m!499693))

(declare-fun m!499695 () Bool)

(assert (=> b!518982 m!499695))

(declare-fun m!499697 () Bool)

(assert (=> b!518995 m!499697))

(declare-fun m!499699 () Bool)

(assert (=> b!518995 m!499699))

(declare-fun m!499701 () Bool)

(assert (=> b!518995 m!499701))

(declare-fun m!499703 () Bool)

(assert (=> b!518995 m!499703))

(declare-fun m!499705 () Bool)

(assert (=> b!518995 m!499705))

(declare-fun m!499707 () Bool)

(assert (=> b!518995 m!499707))

(declare-fun m!499709 () Bool)

(assert (=> b!518995 m!499709))

(assert (=> b!518995 m!499707))

(declare-fun m!499711 () Bool)

(assert (=> b!518995 m!499711))

(assert (=> b!518995 m!499707))

(declare-fun m!499713 () Bool)

(assert (=> b!518995 m!499713))

(declare-fun m!499715 () Bool)

(assert (=> b!518991 m!499715))

(declare-fun m!499717 () Bool)

(assert (=> b!518985 m!499717))

(assert (=> b!518985 m!499707))

(assert (=> b!518983 m!499707))

(assert (=> b!518983 m!499707))

(declare-fun m!499719 () Bool)

(assert (=> b!518983 m!499719))

(declare-fun m!499721 () Bool)

(assert (=> b!518994 m!499721))

(declare-fun m!499723 () Bool)

(assert (=> b!518992 m!499723))

(declare-fun m!499725 () Bool)

(assert (=> b!518989 m!499725))

(declare-fun m!499727 () Bool)

(assert (=> start!47136 m!499727))

(declare-fun m!499729 () Bool)

(assert (=> start!47136 m!499729))

(assert (=> b!518993 m!499707))

(assert (=> b!518993 m!499707))

(declare-fun m!499731 () Bool)

(assert (=> b!518993 m!499731))

(declare-fun m!499733 () Bool)

(assert (=> b!518984 m!499733))

(check-sat (not b!518991) (not b!518989) (not b!518982) (not b!518984) (not b!518993) (not b!518994) (not b!518995) (not b!518992) (not start!47136) (not b!518983))
(check-sat)
