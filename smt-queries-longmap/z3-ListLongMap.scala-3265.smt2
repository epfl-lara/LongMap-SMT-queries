; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45452 () Bool)

(assert start!45452)

(declare-fun b!500297 () Bool)

(declare-fun res!302197 () Bool)

(declare-fun e!293120 () Bool)

(assert (=> b!500297 (=> (not res!302197) (not e!293120))))

(declare-datatypes ((array!32278 0))(
  ( (array!32279 (arr!15520 (Array (_ BitVec 32) (_ BitVec 64))) (size!15884 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32278)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32278 (_ BitVec 32)) Bool)

(assert (=> b!500297 (= res!302197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500298 () Bool)

(declare-fun e!293123 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3943 0))(
  ( (MissingZero!3943 (index!17954 (_ BitVec 32))) (Found!3943 (index!17955 (_ BitVec 32))) (Intermediate!3943 (undefined!4755 Bool) (index!17956 (_ BitVec 32)) (x!47137 (_ BitVec 32))) (Undefined!3943) (MissingVacant!3943 (index!17957 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32278 (_ BitVec 32)) SeekEntryResult!3943)

(assert (=> b!500298 (= e!293123 (= (seekEntryOrOpen!0 (select (arr!15520 a!3235) j!176) a!3235 mask!3524) (Found!3943 j!176)))))

(declare-fun b!500299 () Bool)

(declare-fun e!293122 () Bool)

(declare-fun e!293125 () Bool)

(assert (=> b!500299 (= e!293122 e!293125)))

(declare-fun res!302193 () Bool)

(assert (=> b!500299 (=> res!302193 e!293125)))

(declare-fun lt!227078 () SeekEntryResult!3943)

(declare-fun lt!227080 () (_ BitVec 32))

(assert (=> b!500299 (= res!302193 (or (bvsgt #b00000000000000000000000000000000 (x!47137 lt!227078)) (bvsgt (x!47137 lt!227078) #b01111111111111111111111111111110) (bvslt lt!227080 #b00000000000000000000000000000000) (bvsge lt!227080 (size!15884 a!3235)) (bvslt (index!17956 lt!227078) #b00000000000000000000000000000000) (bvsge (index!17956 lt!227078) (size!15884 a!3235)) (not (= lt!227078 (Intermediate!3943 false (index!17956 lt!227078) (x!47137 lt!227078))))))))

(assert (=> b!500299 (and (or (= (select (arr!15520 a!3235) (index!17956 lt!227078)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15520 a!3235) (index!17956 lt!227078)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15520 a!3235) (index!17956 lt!227078)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15520 a!3235) (index!17956 lt!227078)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15007 0))(
  ( (Unit!15008) )
))
(declare-fun lt!227074 () Unit!15007)

(declare-fun e!293127 () Unit!15007)

(assert (=> b!500299 (= lt!227074 e!293127)))

(declare-fun c!59330 () Bool)

(assert (=> b!500299 (= c!59330 (= (select (arr!15520 a!3235) (index!17956 lt!227078)) (select (arr!15520 a!3235) j!176)))))

(assert (=> b!500299 (and (bvslt (x!47137 lt!227078) #b01111111111111111111111111111110) (or (= (select (arr!15520 a!3235) (index!17956 lt!227078)) (select (arr!15520 a!3235) j!176)) (= (select (arr!15520 a!3235) (index!17956 lt!227078)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15520 a!3235) (index!17956 lt!227078)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500300 () Bool)

(declare-fun res!302199 () Bool)

(declare-fun e!293126 () Bool)

(assert (=> b!500300 (=> (not res!302199) (not e!293126))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500300 (= res!302199 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500301 () Bool)

(declare-fun res!302194 () Bool)

(assert (=> b!500301 (=> (not res!302194) (not e!293126))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500301 (= res!302194 (and (= (size!15884 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15884 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15884 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500302 () Bool)

(assert (=> b!500302 (= e!293126 e!293120)))

(declare-fun res!302202 () Bool)

(assert (=> b!500302 (=> (not res!302202) (not e!293120))))

(declare-fun lt!227079 () SeekEntryResult!3943)

(assert (=> b!500302 (= res!302202 (or (= lt!227079 (MissingZero!3943 i!1204)) (= lt!227079 (MissingVacant!3943 i!1204))))))

(assert (=> b!500302 (= lt!227079 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500303 () Bool)

(declare-fun res!302195 () Bool)

(assert (=> b!500303 (=> (not res!302195) (not e!293126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500303 (= res!302195 (validKeyInArray!0 k0!2280))))

(declare-fun b!500304 () Bool)

(declare-fun Unit!15009 () Unit!15007)

(assert (=> b!500304 (= e!293127 Unit!15009)))

(declare-fun lt!227072 () Unit!15007)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32278 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15007)

(assert (=> b!500304 (= lt!227072 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227080 #b00000000000000000000000000000000 (index!17956 lt!227078) (x!47137 lt!227078) mask!3524))))

(declare-fun lt!227075 () array!32278)

(declare-fun lt!227071 () (_ BitVec 64))

(declare-fun res!302192 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32278 (_ BitVec 32)) SeekEntryResult!3943)

(assert (=> b!500304 (= res!302192 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227080 lt!227071 lt!227075 mask!3524) (Intermediate!3943 false (index!17956 lt!227078) (x!47137 lt!227078))))))

(declare-fun e!293124 () Bool)

(assert (=> b!500304 (=> (not res!302192) (not e!293124))))

(assert (=> b!500304 e!293124))

(declare-fun b!500305 () Bool)

(assert (=> b!500305 (= e!293120 (not e!293122))))

(declare-fun res!302198 () Bool)

(assert (=> b!500305 (=> res!302198 e!293122)))

(declare-fun lt!227076 () (_ BitVec 32))

(assert (=> b!500305 (= res!302198 (= lt!227078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227076 lt!227071 lt!227075 mask!3524)))))

(assert (=> b!500305 (= lt!227078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227080 (select (arr!15520 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500305 (= lt!227076 (toIndex!0 lt!227071 mask!3524))))

(assert (=> b!500305 (= lt!227071 (select (store (arr!15520 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500305 (= lt!227080 (toIndex!0 (select (arr!15520 a!3235) j!176) mask!3524))))

(assert (=> b!500305 (= lt!227075 (array!32279 (store (arr!15520 a!3235) i!1204 k0!2280) (size!15884 a!3235)))))

(assert (=> b!500305 e!293123))

(declare-fun res!302201 () Bool)

(assert (=> b!500305 (=> (not res!302201) (not e!293123))))

(assert (=> b!500305 (= res!302201 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227077 () Unit!15007)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15007)

(assert (=> b!500305 (= lt!227077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500307 () Bool)

(declare-fun res!302191 () Bool)

(assert (=> b!500307 (=> res!302191 e!293122)))

(get-info :version)

(assert (=> b!500307 (= res!302191 (or (undefined!4755 lt!227078) (not ((_ is Intermediate!3943) lt!227078))))))

(declare-fun b!500308 () Bool)

(declare-fun res!302196 () Bool)

(assert (=> b!500308 (=> (not res!302196) (not e!293120))))

(declare-datatypes ((List!9585 0))(
  ( (Nil!9582) (Cons!9581 (h!10455 (_ BitVec 64)) (t!15805 List!9585)) )
))
(declare-fun arrayNoDuplicates!0 (array!32278 (_ BitVec 32) List!9585) Bool)

(assert (=> b!500308 (= res!302196 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9582))))

(declare-fun b!500309 () Bool)

(assert (=> b!500309 (= e!293125 true)))

(declare-fun lt!227073 () SeekEntryResult!3943)

(assert (=> b!500309 (= lt!227073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227080 lt!227071 lt!227075 mask!3524))))

(declare-fun b!500310 () Bool)

(declare-fun Unit!15010 () Unit!15007)

(assert (=> b!500310 (= e!293127 Unit!15010)))

(declare-fun b!500311 () Bool)

(assert (=> b!500311 (= e!293124 false)))

(declare-fun res!302203 () Bool)

(assert (=> start!45452 (=> (not res!302203) (not e!293126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45452 (= res!302203 (validMask!0 mask!3524))))

(assert (=> start!45452 e!293126))

(assert (=> start!45452 true))

(declare-fun array_inv!11379 (array!32278) Bool)

(assert (=> start!45452 (array_inv!11379 a!3235)))

(declare-fun b!500306 () Bool)

(declare-fun res!302200 () Bool)

(assert (=> b!500306 (=> (not res!302200) (not e!293126))))

(assert (=> b!500306 (= res!302200 (validKeyInArray!0 (select (arr!15520 a!3235) j!176)))))

(assert (= (and start!45452 res!302203) b!500301))

(assert (= (and b!500301 res!302194) b!500306))

(assert (= (and b!500306 res!302200) b!500303))

(assert (= (and b!500303 res!302195) b!500300))

(assert (= (and b!500300 res!302199) b!500302))

(assert (= (and b!500302 res!302202) b!500297))

(assert (= (and b!500297 res!302197) b!500308))

(assert (= (and b!500308 res!302196) b!500305))

(assert (= (and b!500305 res!302201) b!500298))

(assert (= (and b!500305 (not res!302198)) b!500307))

(assert (= (and b!500307 (not res!302191)) b!500299))

(assert (= (and b!500299 c!59330) b!500304))

(assert (= (and b!500299 (not c!59330)) b!500310))

(assert (= (and b!500304 res!302192) b!500311))

(assert (= (and b!500299 (not res!302193)) b!500309))

(declare-fun m!481681 () Bool)

(assert (=> b!500305 m!481681))

(declare-fun m!481683 () Bool)

(assert (=> b!500305 m!481683))

(declare-fun m!481685 () Bool)

(assert (=> b!500305 m!481685))

(declare-fun m!481687 () Bool)

(assert (=> b!500305 m!481687))

(declare-fun m!481689 () Bool)

(assert (=> b!500305 m!481689))

(assert (=> b!500305 m!481687))

(declare-fun m!481691 () Bool)

(assert (=> b!500305 m!481691))

(declare-fun m!481693 () Bool)

(assert (=> b!500305 m!481693))

(declare-fun m!481695 () Bool)

(assert (=> b!500305 m!481695))

(assert (=> b!500305 m!481687))

(declare-fun m!481697 () Bool)

(assert (=> b!500305 m!481697))

(assert (=> b!500306 m!481687))

(assert (=> b!500306 m!481687))

(declare-fun m!481699 () Bool)

(assert (=> b!500306 m!481699))

(declare-fun m!481701 () Bool)

(assert (=> b!500300 m!481701))

(declare-fun m!481703 () Bool)

(assert (=> b!500302 m!481703))

(declare-fun m!481705 () Bool)

(assert (=> b!500297 m!481705))

(declare-fun m!481707 () Bool)

(assert (=> b!500299 m!481707))

(assert (=> b!500299 m!481687))

(declare-fun m!481709 () Bool)

(assert (=> b!500309 m!481709))

(declare-fun m!481711 () Bool)

(assert (=> b!500308 m!481711))

(declare-fun m!481713 () Bool)

(assert (=> b!500303 m!481713))

(declare-fun m!481715 () Bool)

(assert (=> start!45452 m!481715))

(declare-fun m!481717 () Bool)

(assert (=> start!45452 m!481717))

(declare-fun m!481719 () Bool)

(assert (=> b!500304 m!481719))

(assert (=> b!500304 m!481709))

(assert (=> b!500298 m!481687))

(assert (=> b!500298 m!481687))

(declare-fun m!481721 () Bool)

(assert (=> b!500298 m!481721))

(check-sat (not b!500304) (not b!500305) (not b!500308) (not b!500300) (not b!500297) (not b!500302) (not b!500306) (not b!500298) (not b!500309) (not b!500303) (not start!45452))
(check-sat)
