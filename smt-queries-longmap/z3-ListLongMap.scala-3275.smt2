; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45596 () Bool)

(assert start!45596)

(declare-fun b!502126 () Bool)

(declare-fun res!303583 () Bool)

(declare-fun e!294128 () Bool)

(assert (=> b!502126 (=> res!303583 e!294128)))

(declare-datatypes ((SeekEntryResult!4023 0))(
  ( (MissingZero!4023 (index!18280 (_ BitVec 32))) (Found!4023 (index!18281 (_ BitVec 32))) (Intermediate!4023 (undefined!4835 Bool) (index!18282 (_ BitVec 32)) (x!47312 (_ BitVec 32))) (Undefined!4023) (MissingVacant!4023 (index!18283 (_ BitVec 32))) )
))
(declare-fun lt!228182 () SeekEntryResult!4023)

(get-info :version)

(assert (=> b!502126 (= res!303583 (or (undefined!4835 lt!228182) (not ((_ is Intermediate!4023) lt!228182))))))

(declare-fun b!502127 () Bool)

(declare-datatypes ((Unit!15168 0))(
  ( (Unit!15169) )
))
(declare-fun e!294133 () Unit!15168)

(declare-fun Unit!15170 () Unit!15168)

(assert (=> b!502127 (= e!294133 Unit!15170)))

(declare-fun res!303580 () Bool)

(declare-fun e!294131 () Bool)

(assert (=> start!45596 (=> (not res!303580) (not e!294131))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45596 (= res!303580 (validMask!0 mask!3524))))

(assert (=> start!45596 e!294131))

(assert (=> start!45596 true))

(declare-datatypes ((array!32352 0))(
  ( (array!32353 (arr!15556 (Array (_ BitVec 32) (_ BitVec 64))) (size!15920 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32352)

(declare-fun array_inv!11352 (array!32352) Bool)

(assert (=> start!45596 (array_inv!11352 a!3235)))

(declare-fun b!502128 () Bool)

(declare-fun res!303587 () Bool)

(declare-fun e!294130 () Bool)

(assert (=> b!502128 (=> (not res!303587) (not e!294130))))

(declare-datatypes ((List!9714 0))(
  ( (Nil!9711) (Cons!9710 (h!10587 (_ BitVec 64)) (t!15942 List!9714)) )
))
(declare-fun arrayNoDuplicates!0 (array!32352 (_ BitVec 32) List!9714) Bool)

(assert (=> b!502128 (= res!303587 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9711))))

(declare-fun b!502129 () Bool)

(declare-fun lt!228180 () (_ BitVec 32))

(declare-fun e!294129 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32352 (_ BitVec 32)) SeekEntryResult!4023)

(assert (=> b!502129 (= e!294129 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228180 (index!18282 lt!228182) (select (arr!15556 a!3235) j!176) a!3235 mask!3524) (Found!4023 j!176))))))

(declare-fun b!502130 () Bool)

(declare-fun res!303591 () Bool)

(assert (=> b!502130 (=> (not res!303591) (not e!294131))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502130 (= res!303591 (validKeyInArray!0 k0!2280))))

(declare-fun e!294132 () Bool)

(declare-fun b!502131 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32352 (_ BitVec 32)) SeekEntryResult!4023)

(assert (=> b!502131 (= e!294132 (= (seekEntryOrOpen!0 (select (arr!15556 a!3235) j!176) a!3235 mask!3524) (Found!4023 j!176)))))

(declare-fun b!502132 () Bool)

(declare-fun res!303584 () Bool)

(assert (=> b!502132 (=> (not res!303584) (not e!294131))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502132 (= res!303584 (and (= (size!15920 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15920 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15920 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502133 () Bool)

(declare-fun res!303585 () Bool)

(declare-fun e!294127 () Bool)

(assert (=> b!502133 (=> res!303585 e!294127)))

(assert (=> b!502133 (= res!303585 e!294129)))

(declare-fun res!303592 () Bool)

(assert (=> b!502133 (=> (not res!303592) (not e!294129))))

(assert (=> b!502133 (= res!303592 (bvsgt #b00000000000000000000000000000000 (x!47312 lt!228182)))))

(declare-fun b!502134 () Bool)

(assert (=> b!502134 (= e!294127 true)))

(declare-fun lt!228175 () SeekEntryResult!4023)

(declare-fun lt!228183 () array!32352)

(declare-fun lt!228184 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32352 (_ BitVec 32)) SeekEntryResult!4023)

(assert (=> b!502134 (= lt!228175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228180 lt!228184 lt!228183 mask!3524))))

(declare-fun b!502135 () Bool)

(declare-fun res!303582 () Bool)

(assert (=> b!502135 (=> (not res!303582) (not e!294131))))

(declare-fun arrayContainsKey!0 (array!32352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502135 (= res!303582 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502136 () Bool)

(assert (=> b!502136 (= e!294130 (not e!294128))))

(declare-fun res!303588 () Bool)

(assert (=> b!502136 (=> res!303588 e!294128)))

(declare-fun lt!228179 () (_ BitVec 32))

(assert (=> b!502136 (= res!303588 (= lt!228182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228179 lt!228184 lt!228183 mask!3524)))))

(assert (=> b!502136 (= lt!228182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228180 (select (arr!15556 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502136 (= lt!228179 (toIndex!0 lt!228184 mask!3524))))

(assert (=> b!502136 (= lt!228184 (select (store (arr!15556 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502136 (= lt!228180 (toIndex!0 (select (arr!15556 a!3235) j!176) mask!3524))))

(assert (=> b!502136 (= lt!228183 (array!32353 (store (arr!15556 a!3235) i!1204 k0!2280) (size!15920 a!3235)))))

(assert (=> b!502136 e!294132))

(declare-fun res!303590 () Bool)

(assert (=> b!502136 (=> (not res!303590) (not e!294132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32352 (_ BitVec 32)) Bool)

(assert (=> b!502136 (= res!303590 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228174 () Unit!15168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15168)

(assert (=> b!502136 (= lt!228174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502137 () Bool)

(declare-fun res!303593 () Bool)

(assert (=> b!502137 (=> (not res!303593) (not e!294130))))

(assert (=> b!502137 (= res!303593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502138 () Bool)

(assert (=> b!502138 (= e!294128 e!294127)))

(declare-fun res!303586 () Bool)

(assert (=> b!502138 (=> res!303586 e!294127)))

(assert (=> b!502138 (= res!303586 (or (bvsgt (x!47312 lt!228182) #b01111111111111111111111111111110) (bvslt lt!228180 #b00000000000000000000000000000000) (bvsge lt!228180 (size!15920 a!3235)) (bvslt (index!18282 lt!228182) #b00000000000000000000000000000000) (bvsge (index!18282 lt!228182) (size!15920 a!3235)) (not (= lt!228182 (Intermediate!4023 false (index!18282 lt!228182) (x!47312 lt!228182))))))))

(assert (=> b!502138 (= (index!18282 lt!228182) i!1204)))

(declare-fun lt!228178 () Unit!15168)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32352 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15168)

(assert (=> b!502138 (= lt!228178 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228180 #b00000000000000000000000000000000 (index!18282 lt!228182) (x!47312 lt!228182) mask!3524))))

(assert (=> b!502138 (and (or (= (select (arr!15556 a!3235) (index!18282 lt!228182)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15556 a!3235) (index!18282 lt!228182)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15556 a!3235) (index!18282 lt!228182)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15556 a!3235) (index!18282 lt!228182)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228177 () Unit!15168)

(assert (=> b!502138 (= lt!228177 e!294133)))

(declare-fun c!59552 () Bool)

(assert (=> b!502138 (= c!59552 (= (select (arr!15556 a!3235) (index!18282 lt!228182)) (select (arr!15556 a!3235) j!176)))))

(assert (=> b!502138 (and (bvslt (x!47312 lt!228182) #b01111111111111111111111111111110) (or (= (select (arr!15556 a!3235) (index!18282 lt!228182)) (select (arr!15556 a!3235) j!176)) (= (select (arr!15556 a!3235) (index!18282 lt!228182)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15556 a!3235) (index!18282 lt!228182)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502139 () Bool)

(declare-fun Unit!15171 () Unit!15168)

(assert (=> b!502139 (= e!294133 Unit!15171)))

(declare-fun lt!228181 () Unit!15168)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32352 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15168)

(assert (=> b!502139 (= lt!228181 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228180 #b00000000000000000000000000000000 (index!18282 lt!228182) (x!47312 lt!228182) mask!3524))))

(declare-fun res!303579 () Bool)

(assert (=> b!502139 (= res!303579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228180 lt!228184 lt!228183 mask!3524) (Intermediate!4023 false (index!18282 lt!228182) (x!47312 lt!228182))))))

(declare-fun e!294134 () Bool)

(assert (=> b!502139 (=> (not res!303579) (not e!294134))))

(assert (=> b!502139 e!294134))

(declare-fun b!502140 () Bool)

(assert (=> b!502140 (= e!294131 e!294130)))

(declare-fun res!303589 () Bool)

(assert (=> b!502140 (=> (not res!303589) (not e!294130))))

(declare-fun lt!228176 () SeekEntryResult!4023)

(assert (=> b!502140 (= res!303589 (or (= lt!228176 (MissingZero!4023 i!1204)) (= lt!228176 (MissingVacant!4023 i!1204))))))

(assert (=> b!502140 (= lt!228176 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502141 () Bool)

(declare-fun res!303581 () Bool)

(assert (=> b!502141 (=> (not res!303581) (not e!294131))))

(assert (=> b!502141 (= res!303581 (validKeyInArray!0 (select (arr!15556 a!3235) j!176)))))

(declare-fun b!502142 () Bool)

(assert (=> b!502142 (= e!294134 false)))

(assert (= (and start!45596 res!303580) b!502132))

(assert (= (and b!502132 res!303584) b!502141))

(assert (= (and b!502141 res!303581) b!502130))

(assert (= (and b!502130 res!303591) b!502135))

(assert (= (and b!502135 res!303582) b!502140))

(assert (= (and b!502140 res!303589) b!502137))

(assert (= (and b!502137 res!303593) b!502128))

(assert (= (and b!502128 res!303587) b!502136))

(assert (= (and b!502136 res!303590) b!502131))

(assert (= (and b!502136 (not res!303588)) b!502126))

(assert (= (and b!502126 (not res!303583)) b!502138))

(assert (= (and b!502138 c!59552) b!502139))

(assert (= (and b!502138 (not c!59552)) b!502127))

(assert (= (and b!502139 res!303579) b!502142))

(assert (= (and b!502138 (not res!303586)) b!502133))

(assert (= (and b!502133 res!303592) b!502129))

(assert (= (and b!502133 (not res!303585)) b!502134))

(declare-fun m!483091 () Bool)

(assert (=> b!502135 m!483091))

(declare-fun m!483093 () Bool)

(assert (=> b!502129 m!483093))

(assert (=> b!502129 m!483093))

(declare-fun m!483095 () Bool)

(assert (=> b!502129 m!483095))

(declare-fun m!483097 () Bool)

(assert (=> b!502140 m!483097))

(declare-fun m!483099 () Bool)

(assert (=> b!502134 m!483099))

(declare-fun m!483101 () Bool)

(assert (=> b!502137 m!483101))

(assert (=> b!502141 m!483093))

(assert (=> b!502141 m!483093))

(declare-fun m!483103 () Bool)

(assert (=> b!502141 m!483103))

(declare-fun m!483105 () Bool)

(assert (=> b!502128 m!483105))

(declare-fun m!483107 () Bool)

(assert (=> start!45596 m!483107))

(declare-fun m!483109 () Bool)

(assert (=> start!45596 m!483109))

(declare-fun m!483111 () Bool)

(assert (=> b!502139 m!483111))

(assert (=> b!502139 m!483099))

(declare-fun m!483113 () Bool)

(assert (=> b!502130 m!483113))

(assert (=> b!502136 m!483093))

(declare-fun m!483115 () Bool)

(assert (=> b!502136 m!483115))

(declare-fun m!483117 () Bool)

(assert (=> b!502136 m!483117))

(declare-fun m!483119 () Bool)

(assert (=> b!502136 m!483119))

(declare-fun m!483121 () Bool)

(assert (=> b!502136 m!483121))

(assert (=> b!502136 m!483093))

(declare-fun m!483123 () Bool)

(assert (=> b!502136 m!483123))

(declare-fun m!483125 () Bool)

(assert (=> b!502136 m!483125))

(assert (=> b!502136 m!483093))

(declare-fun m!483127 () Bool)

(assert (=> b!502136 m!483127))

(declare-fun m!483129 () Bool)

(assert (=> b!502136 m!483129))

(assert (=> b!502131 m!483093))

(assert (=> b!502131 m!483093))

(declare-fun m!483131 () Bool)

(assert (=> b!502131 m!483131))

(declare-fun m!483133 () Bool)

(assert (=> b!502138 m!483133))

(declare-fun m!483135 () Bool)

(assert (=> b!502138 m!483135))

(assert (=> b!502138 m!483093))

(check-sat (not b!502135) (not b!502138) (not b!502141) (not b!502134) (not b!502140) (not b!502128) (not b!502129) (not b!502139) (not b!502136) (not b!502130) (not start!45596) (not b!502131) (not b!502137))
(check-sat)
