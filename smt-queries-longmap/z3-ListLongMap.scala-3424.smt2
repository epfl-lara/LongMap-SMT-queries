; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47522 () Bool)

(assert start!47522)

(declare-fun b!523020 () Bool)

(declare-fun res!320483 () Bool)

(declare-fun e!305045 () Bool)

(assert (=> b!523020 (=> (not res!320483) (not e!305045))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523020 (= res!320483 (validKeyInArray!0 k0!2280))))

(declare-fun b!523021 () Bool)

(declare-fun res!320494 () Bool)

(assert (=> b!523021 (=> (not res!320494) (not e!305045))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33286 0))(
  ( (array!33287 (arr!15997 (Array (_ BitVec 32) (_ BitVec 64))) (size!16361 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33286)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523021 (= res!320494 (and (= (size!16361 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16361 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16361 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523022 () Bool)

(declare-fun e!305043 () Bool)

(declare-datatypes ((SeekEntryResult!4420 0))(
  ( (MissingZero!4420 (index!19886 (_ BitVec 32))) (Found!4420 (index!19887 (_ BitVec 32))) (Intermediate!4420 (undefined!5232 Bool) (index!19888 (_ BitVec 32)) (x!49012 (_ BitVec 32))) (Undefined!4420) (MissingVacant!4420 (index!19889 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33286 (_ BitVec 32)) SeekEntryResult!4420)

(assert (=> b!523022 (= e!305043 (= (seekEntryOrOpen!0 (select (arr!15997 a!3235) j!176) a!3235 mask!3524) (Found!4420 j!176)))))

(declare-fun b!523023 () Bool)

(declare-fun res!320484 () Bool)

(assert (=> b!523023 (=> (not res!320484) (not e!305045))))

(assert (=> b!523023 (= res!320484 (validKeyInArray!0 (select (arr!15997 a!3235) j!176)))))

(declare-fun b!523024 () Bool)

(declare-fun e!305044 () Bool)

(declare-fun e!305048 () Bool)

(assert (=> b!523024 (= e!305044 (not e!305048))))

(declare-fun res!320492 () Bool)

(assert (=> b!523024 (=> res!320492 e!305048)))

(declare-fun lt!239965 () SeekEntryResult!4420)

(declare-fun lt!239962 () (_ BitVec 64))

(declare-fun lt!239964 () (_ BitVec 32))

(declare-fun lt!239961 () array!33286)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33286 (_ BitVec 32)) SeekEntryResult!4420)

(assert (=> b!523024 (= res!320492 (= lt!239965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239964 lt!239962 lt!239961 mask!3524)))))

(declare-fun lt!239966 () (_ BitVec 32))

(assert (=> b!523024 (= lt!239965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239966 (select (arr!15997 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523024 (= lt!239964 (toIndex!0 lt!239962 mask!3524))))

(assert (=> b!523024 (= lt!239962 (select (store (arr!15997 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523024 (= lt!239966 (toIndex!0 (select (arr!15997 a!3235) j!176) mask!3524))))

(assert (=> b!523024 (= lt!239961 (array!33287 (store (arr!15997 a!3235) i!1204 k0!2280) (size!16361 a!3235)))))

(assert (=> b!523024 e!305043))

(declare-fun res!320490 () Bool)

(assert (=> b!523024 (=> (not res!320490) (not e!305043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33286 (_ BitVec 32)) Bool)

(assert (=> b!523024 (= res!320490 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16291 0))(
  ( (Unit!16292) )
))
(declare-fun lt!239967 () Unit!16291)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16291)

(assert (=> b!523024 (= lt!239967 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523025 () Bool)

(declare-fun e!305049 () Unit!16291)

(declare-fun Unit!16293 () Unit!16291)

(assert (=> b!523025 (= e!305049 Unit!16293)))

(declare-fun b!523026 () Bool)

(declare-fun res!320486 () Bool)

(assert (=> b!523026 (=> (not res!320486) (not e!305044))))

(assert (=> b!523026 (= res!320486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523027 () Bool)

(declare-fun res!320487 () Bool)

(assert (=> b!523027 (=> res!320487 e!305048)))

(get-info :version)

(assert (=> b!523027 (= res!320487 (or (undefined!5232 lt!239965) (not ((_ is Intermediate!4420) lt!239965))))))

(declare-fun b!523028 () Bool)

(assert (=> b!523028 (= e!305048 true)))

(assert (=> b!523028 (and (or (= (select (arr!15997 a!3235) (index!19888 lt!239965)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15997 a!3235) (index!19888 lt!239965)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15997 a!3235) (index!19888 lt!239965)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15997 a!3235) (index!19888 lt!239965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239963 () Unit!16291)

(assert (=> b!523028 (= lt!239963 e!305049)))

(declare-fun c!61571 () Bool)

(assert (=> b!523028 (= c!61571 (= (select (arr!15997 a!3235) (index!19888 lt!239965)) (select (arr!15997 a!3235) j!176)))))

(assert (=> b!523028 (and (bvslt (x!49012 lt!239965) #b01111111111111111111111111111110) (or (= (select (arr!15997 a!3235) (index!19888 lt!239965)) (select (arr!15997 a!3235) j!176)) (= (select (arr!15997 a!3235) (index!19888 lt!239965)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15997 a!3235) (index!19888 lt!239965)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523029 () Bool)

(assert (=> b!523029 (= e!305045 e!305044)))

(declare-fun res!320488 () Bool)

(assert (=> b!523029 (=> (not res!320488) (not e!305044))))

(declare-fun lt!239968 () SeekEntryResult!4420)

(assert (=> b!523029 (= res!320488 (or (= lt!239968 (MissingZero!4420 i!1204)) (= lt!239968 (MissingVacant!4420 i!1204))))))

(assert (=> b!523029 (= lt!239968 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523030 () Bool)

(declare-fun e!305046 () Bool)

(assert (=> b!523030 (= e!305046 false)))

(declare-fun b!523031 () Bool)

(declare-fun res!320493 () Bool)

(assert (=> b!523031 (=> (not res!320493) (not e!305045))))

(declare-fun arrayContainsKey!0 (array!33286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523031 (= res!320493 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!320491 () Bool)

(assert (=> start!47522 (=> (not res!320491) (not e!305045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47522 (= res!320491 (validMask!0 mask!3524))))

(assert (=> start!47522 e!305045))

(assert (=> start!47522 true))

(declare-fun array_inv!11856 (array!33286) Bool)

(assert (=> start!47522 (array_inv!11856 a!3235)))

(declare-fun b!523032 () Bool)

(declare-fun res!320489 () Bool)

(assert (=> b!523032 (=> (not res!320489) (not e!305044))))

(declare-datatypes ((List!10062 0))(
  ( (Nil!10059) (Cons!10058 (h!10983 (_ BitVec 64)) (t!16282 List!10062)) )
))
(declare-fun arrayNoDuplicates!0 (array!33286 (_ BitVec 32) List!10062) Bool)

(assert (=> b!523032 (= res!320489 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10059))))

(declare-fun b!523033 () Bool)

(declare-fun Unit!16294 () Unit!16291)

(assert (=> b!523033 (= e!305049 Unit!16294)))

(declare-fun lt!239960 () Unit!16291)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33286 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16291)

(assert (=> b!523033 (= lt!239960 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239966 #b00000000000000000000000000000000 (index!19888 lt!239965) (x!49012 lt!239965) mask!3524))))

(declare-fun res!320485 () Bool)

(assert (=> b!523033 (= res!320485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239966 lt!239962 lt!239961 mask!3524) (Intermediate!4420 false (index!19888 lt!239965) (x!49012 lt!239965))))))

(assert (=> b!523033 (=> (not res!320485) (not e!305046))))

(assert (=> b!523033 e!305046))

(assert (= (and start!47522 res!320491) b!523021))

(assert (= (and b!523021 res!320494) b!523023))

(assert (= (and b!523023 res!320484) b!523020))

(assert (= (and b!523020 res!320483) b!523031))

(assert (= (and b!523031 res!320493) b!523029))

(assert (= (and b!523029 res!320488) b!523026))

(assert (= (and b!523026 res!320486) b!523032))

(assert (= (and b!523032 res!320489) b!523024))

(assert (= (and b!523024 res!320490) b!523022))

(assert (= (and b!523024 (not res!320492)) b!523027))

(assert (= (and b!523027 (not res!320487)) b!523028))

(assert (= (and b!523028 c!61571) b!523033))

(assert (= (and b!523028 (not c!61571)) b!523025))

(assert (= (and b!523033 res!320485) b!523030))

(declare-fun m!504085 () Bool)

(assert (=> b!523029 m!504085))

(declare-fun m!504087 () Bool)

(assert (=> b!523026 m!504087))

(declare-fun m!504089 () Bool)

(assert (=> b!523024 m!504089))

(declare-fun m!504091 () Bool)

(assert (=> b!523024 m!504091))

(declare-fun m!504093 () Bool)

(assert (=> b!523024 m!504093))

(declare-fun m!504095 () Bool)

(assert (=> b!523024 m!504095))

(declare-fun m!504097 () Bool)

(assert (=> b!523024 m!504097))

(declare-fun m!504099 () Bool)

(assert (=> b!523024 m!504099))

(declare-fun m!504101 () Bool)

(assert (=> b!523024 m!504101))

(declare-fun m!504103 () Bool)

(assert (=> b!523024 m!504103))

(assert (=> b!523024 m!504095))

(declare-fun m!504105 () Bool)

(assert (=> b!523024 m!504105))

(assert (=> b!523024 m!504095))

(declare-fun m!504107 () Bool)

(assert (=> b!523032 m!504107))

(assert (=> b!523022 m!504095))

(assert (=> b!523022 m!504095))

(declare-fun m!504109 () Bool)

(assert (=> b!523022 m!504109))

(declare-fun m!504111 () Bool)

(assert (=> b!523033 m!504111))

(declare-fun m!504113 () Bool)

(assert (=> b!523033 m!504113))

(declare-fun m!504115 () Bool)

(assert (=> b!523020 m!504115))

(declare-fun m!504117 () Bool)

(assert (=> b!523031 m!504117))

(declare-fun m!504119 () Bool)

(assert (=> b!523028 m!504119))

(assert (=> b!523028 m!504095))

(declare-fun m!504121 () Bool)

(assert (=> start!47522 m!504121))

(declare-fun m!504123 () Bool)

(assert (=> start!47522 m!504123))

(assert (=> b!523023 m!504095))

(assert (=> b!523023 m!504095))

(declare-fun m!504125 () Bool)

(assert (=> b!523023 m!504125))

(check-sat (not b!523031) (not b!523033) (not b!523026) (not b!523029) (not b!523024) (not start!47522) (not b!523022) (not b!523020) (not b!523032) (not b!523023))
(check-sat)
