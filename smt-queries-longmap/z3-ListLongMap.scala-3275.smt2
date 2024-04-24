; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45584 () Bool)

(assert start!45584)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!502014 () Bool)

(declare-datatypes ((array!32341 0))(
  ( (array!32342 (arr!15550 (Array (_ BitVec 32) (_ BitVec 64))) (size!15914 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32341)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!294064 () Bool)

(declare-datatypes ((SeekEntryResult!3973 0))(
  ( (MissingZero!3973 (index!18080 (_ BitVec 32))) (Found!3973 (index!18081 (_ BitVec 32))) (Intermediate!3973 (undefined!4785 Bool) (index!18082 (_ BitVec 32)) (x!47259 (_ BitVec 32))) (Undefined!3973) (MissingVacant!3973 (index!18083 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32341 (_ BitVec 32)) SeekEntryResult!3973)

(assert (=> b!502014 (= e!294064 (= (seekEntryOrOpen!0 (select (arr!15550 a!3235) j!176) a!3235 mask!3524) (Found!3973 j!176)))))

(declare-fun b!502015 () Bool)

(declare-fun e!294069 () Bool)

(declare-fun e!294068 () Bool)

(assert (=> b!502015 (= e!294069 e!294068)))

(declare-fun res!303533 () Bool)

(assert (=> b!502015 (=> (not res!303533) (not e!294068))))

(declare-fun lt!228154 () SeekEntryResult!3973)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502015 (= res!303533 (or (= lt!228154 (MissingZero!3973 i!1204)) (= lt!228154 (MissingVacant!3973 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!502015 (= lt!228154 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502016 () Bool)

(declare-fun res!303537 () Bool)

(assert (=> b!502016 (=> (not res!303537) (not e!294068))))

(declare-datatypes ((List!9615 0))(
  ( (Nil!9612) (Cons!9611 (h!10488 (_ BitVec 64)) (t!15835 List!9615)) )
))
(declare-fun arrayNoDuplicates!0 (array!32341 (_ BitVec 32) List!9615) Bool)

(assert (=> b!502016 (= res!303537 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9612))))

(declare-fun res!303539 () Bool)

(assert (=> start!45584 (=> (not res!303539) (not e!294069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45584 (= res!303539 (validMask!0 mask!3524))))

(assert (=> start!45584 e!294069))

(assert (=> start!45584 true))

(declare-fun array_inv!11409 (array!32341) Bool)

(assert (=> start!45584 (array_inv!11409 a!3235)))

(declare-fun b!502017 () Bool)

(declare-fun res!303536 () Bool)

(assert (=> b!502017 (=> (not res!303536) (not e!294069))))

(assert (=> b!502017 (= res!303536 (and (= (size!15914 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15914 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15914 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502018 () Bool)

(declare-fun e!294065 () Bool)

(assert (=> b!502018 (= e!294065 false)))

(declare-fun b!502019 () Bool)

(declare-fun res!303527 () Bool)

(declare-fun e!294066 () Bool)

(assert (=> b!502019 (=> res!303527 e!294066)))

(declare-fun e!294062 () Bool)

(assert (=> b!502019 (= res!303527 e!294062)))

(declare-fun res!303535 () Bool)

(assert (=> b!502019 (=> (not res!303535) (not e!294062))))

(declare-fun lt!228155 () SeekEntryResult!3973)

(assert (=> b!502019 (= res!303535 (bvsgt #b00000000000000000000000000000000 (x!47259 lt!228155)))))

(declare-fun lt!228156 () (_ BitVec 32))

(declare-fun b!502020 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32341 (_ BitVec 32)) SeekEntryResult!3973)

(assert (=> b!502020 (= e!294062 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228156 (index!18082 lt!228155) (select (arr!15550 a!3235) j!176) a!3235 mask!3524) (Found!3973 j!176))))))

(declare-fun b!502021 () Bool)

(declare-fun res!303532 () Bool)

(assert (=> b!502021 (=> (not res!303532) (not e!294069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502021 (= res!303532 (validKeyInArray!0 (select (arr!15550 a!3235) j!176)))))

(declare-fun b!502022 () Bool)

(declare-datatypes ((Unit!15127 0))(
  ( (Unit!15128) )
))
(declare-fun e!294061 () Unit!15127)

(declare-fun Unit!15129 () Unit!15127)

(assert (=> b!502022 (= e!294061 Unit!15129)))

(declare-fun b!502023 () Bool)

(declare-fun e!294067 () Bool)

(assert (=> b!502023 (= e!294067 e!294066)))

(declare-fun res!303538 () Bool)

(assert (=> b!502023 (=> res!303538 e!294066)))

(assert (=> b!502023 (= res!303538 (or (bvsgt (x!47259 lt!228155) #b01111111111111111111111111111110) (bvslt lt!228156 #b00000000000000000000000000000000) (bvsge lt!228156 (size!15914 a!3235)) (bvslt (index!18082 lt!228155) #b00000000000000000000000000000000) (bvsge (index!18082 lt!228155) (size!15914 a!3235)) (not (= lt!228155 (Intermediate!3973 false (index!18082 lt!228155) (x!47259 lt!228155))))))))

(assert (=> b!502023 (= (index!18082 lt!228155) i!1204)))

(declare-fun lt!228157 () Unit!15127)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15127)

(assert (=> b!502023 (= lt!228157 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228156 #b00000000000000000000000000000000 (index!18082 lt!228155) (x!47259 lt!228155) mask!3524))))

(assert (=> b!502023 (and (or (= (select (arr!15550 a!3235) (index!18082 lt!228155)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15550 a!3235) (index!18082 lt!228155)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15550 a!3235) (index!18082 lt!228155)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15550 a!3235) (index!18082 lt!228155)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228153 () Unit!15127)

(assert (=> b!502023 (= lt!228153 e!294061)))

(declare-fun c!59522 () Bool)

(assert (=> b!502023 (= c!59522 (= (select (arr!15550 a!3235) (index!18082 lt!228155)) (select (arr!15550 a!3235) j!176)))))

(assert (=> b!502023 (and (bvslt (x!47259 lt!228155) #b01111111111111111111111111111110) (or (= (select (arr!15550 a!3235) (index!18082 lt!228155)) (select (arr!15550 a!3235) j!176)) (= (select (arr!15550 a!3235) (index!18082 lt!228155)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15550 a!3235) (index!18082 lt!228155)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502024 () Bool)

(assert (=> b!502024 (= e!294066 true)))

(declare-fun lt!228159 () SeekEntryResult!3973)

(declare-fun lt!228160 () array!32341)

(declare-fun lt!228158 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32341 (_ BitVec 32)) SeekEntryResult!3973)

(assert (=> b!502024 (= lt!228159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228156 lt!228158 lt!228160 mask!3524))))

(declare-fun b!502025 () Bool)

(declare-fun res!303531 () Bool)

(assert (=> b!502025 (=> (not res!303531) (not e!294069))))

(assert (=> b!502025 (= res!303531 (validKeyInArray!0 k0!2280))))

(declare-fun b!502026 () Bool)

(assert (=> b!502026 (= e!294068 (not e!294067))))

(declare-fun res!303529 () Bool)

(assert (=> b!502026 (=> res!303529 e!294067)))

(declare-fun lt!228162 () (_ BitVec 32))

(assert (=> b!502026 (= res!303529 (= lt!228155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228162 lt!228158 lt!228160 mask!3524)))))

(assert (=> b!502026 (= lt!228155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228156 (select (arr!15550 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502026 (= lt!228162 (toIndex!0 lt!228158 mask!3524))))

(assert (=> b!502026 (= lt!228158 (select (store (arr!15550 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502026 (= lt!228156 (toIndex!0 (select (arr!15550 a!3235) j!176) mask!3524))))

(assert (=> b!502026 (= lt!228160 (array!32342 (store (arr!15550 a!3235) i!1204 k0!2280) (size!15914 a!3235)))))

(assert (=> b!502026 e!294064))

(declare-fun res!303530 () Bool)

(assert (=> b!502026 (=> (not res!303530) (not e!294064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32341 (_ BitVec 32)) Bool)

(assert (=> b!502026 (= res!303530 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228163 () Unit!15127)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15127)

(assert (=> b!502026 (= lt!228163 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502027 () Bool)

(declare-fun res!303540 () Bool)

(assert (=> b!502027 (=> res!303540 e!294067)))

(get-info :version)

(assert (=> b!502027 (= res!303540 (or (undefined!4785 lt!228155) (not ((_ is Intermediate!3973) lt!228155))))))

(declare-fun b!502028 () Bool)

(declare-fun res!303541 () Bool)

(assert (=> b!502028 (=> (not res!303541) (not e!294068))))

(assert (=> b!502028 (= res!303541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502029 () Bool)

(declare-fun res!303528 () Bool)

(assert (=> b!502029 (=> (not res!303528) (not e!294069))))

(declare-fun arrayContainsKey!0 (array!32341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502029 (= res!303528 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502030 () Bool)

(declare-fun Unit!15130 () Unit!15127)

(assert (=> b!502030 (= e!294061 Unit!15130)))

(declare-fun lt!228161 () Unit!15127)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15127)

(assert (=> b!502030 (= lt!228161 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228156 #b00000000000000000000000000000000 (index!18082 lt!228155) (x!47259 lt!228155) mask!3524))))

(declare-fun res!303534 () Bool)

(assert (=> b!502030 (= res!303534 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228156 lt!228158 lt!228160 mask!3524) (Intermediate!3973 false (index!18082 lt!228155) (x!47259 lt!228155))))))

(assert (=> b!502030 (=> (not res!303534) (not e!294065))))

(assert (=> b!502030 e!294065))

(assert (= (and start!45584 res!303539) b!502017))

(assert (= (and b!502017 res!303536) b!502021))

(assert (= (and b!502021 res!303532) b!502025))

(assert (= (and b!502025 res!303531) b!502029))

(assert (= (and b!502029 res!303528) b!502015))

(assert (= (and b!502015 res!303533) b!502028))

(assert (= (and b!502028 res!303541) b!502016))

(assert (= (and b!502016 res!303537) b!502026))

(assert (= (and b!502026 res!303530) b!502014))

(assert (= (and b!502026 (not res!303529)) b!502027))

(assert (= (and b!502027 (not res!303540)) b!502023))

(assert (= (and b!502023 c!59522) b!502030))

(assert (= (and b!502023 (not c!59522)) b!502022))

(assert (= (and b!502030 res!303534) b!502018))

(assert (= (and b!502023 (not res!303538)) b!502019))

(assert (= (and b!502019 res!303535) b!502020))

(assert (= (and b!502019 (not res!303527)) b!502024))

(declare-fun m!483229 () Bool)

(assert (=> b!502015 m!483229))

(declare-fun m!483231 () Bool)

(assert (=> b!502026 m!483231))

(declare-fun m!483233 () Bool)

(assert (=> b!502026 m!483233))

(declare-fun m!483235 () Bool)

(assert (=> b!502026 m!483235))

(declare-fun m!483237 () Bool)

(assert (=> b!502026 m!483237))

(declare-fun m!483239 () Bool)

(assert (=> b!502026 m!483239))

(assert (=> b!502026 m!483233))

(declare-fun m!483241 () Bool)

(assert (=> b!502026 m!483241))

(declare-fun m!483243 () Bool)

(assert (=> b!502026 m!483243))

(assert (=> b!502026 m!483233))

(declare-fun m!483245 () Bool)

(assert (=> b!502026 m!483245))

(declare-fun m!483247 () Bool)

(assert (=> b!502026 m!483247))

(declare-fun m!483249 () Bool)

(assert (=> start!45584 m!483249))

(declare-fun m!483251 () Bool)

(assert (=> start!45584 m!483251))

(assert (=> b!502020 m!483233))

(assert (=> b!502020 m!483233))

(declare-fun m!483253 () Bool)

(assert (=> b!502020 m!483253))

(declare-fun m!483255 () Bool)

(assert (=> b!502029 m!483255))

(declare-fun m!483257 () Bool)

(assert (=> b!502025 m!483257))

(declare-fun m!483259 () Bool)

(assert (=> b!502016 m!483259))

(declare-fun m!483261 () Bool)

(assert (=> b!502030 m!483261))

(declare-fun m!483263 () Bool)

(assert (=> b!502030 m!483263))

(assert (=> b!502014 m!483233))

(assert (=> b!502014 m!483233))

(declare-fun m!483265 () Bool)

(assert (=> b!502014 m!483265))

(declare-fun m!483267 () Bool)

(assert (=> b!502028 m!483267))

(assert (=> b!502021 m!483233))

(assert (=> b!502021 m!483233))

(declare-fun m!483269 () Bool)

(assert (=> b!502021 m!483269))

(declare-fun m!483271 () Bool)

(assert (=> b!502023 m!483271))

(declare-fun m!483273 () Bool)

(assert (=> b!502023 m!483273))

(assert (=> b!502023 m!483233))

(assert (=> b!502024 m!483263))

(check-sat (not b!502021) (not b!502029) (not b!502024) (not b!502028) (not b!502026) (not b!502014) (not b!502025) (not b!502020) (not b!502023) (not start!45584) (not b!502016) (not b!502030) (not b!502015))
(check-sat)
