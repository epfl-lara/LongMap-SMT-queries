; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45468 () Bool)

(assert start!45468)

(declare-fun b!500492 () Bool)

(declare-fun e!293205 () Bool)

(declare-fun e!293204 () Bool)

(assert (=> b!500492 (= e!293205 (not e!293204))))

(declare-fun res!302425 () Bool)

(assert (=> b!500492 (=> res!302425 e!293204)))

(declare-datatypes ((SeekEntryResult!3997 0))(
  ( (MissingZero!3997 (index!18170 (_ BitVec 32))) (Found!3997 (index!18171 (_ BitVec 32))) (Intermediate!3997 (undefined!4809 Bool) (index!18172 (_ BitVec 32)) (x!47213 (_ BitVec 32))) (Undefined!3997) (MissingVacant!3997 (index!18173 (_ BitVec 32))) )
))
(declare-fun lt!227101 () SeekEntryResult!3997)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227103 () (_ BitVec 32))

(declare-fun lt!227100 () (_ BitVec 64))

(declare-datatypes ((array!32303 0))(
  ( (array!32304 (arr!15533 (Array (_ BitVec 32) (_ BitVec 64))) (size!15898 (_ BitVec 32))) )
))
(declare-fun lt!227095 () array!32303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32303 (_ BitVec 32)) SeekEntryResult!3997)

(assert (=> b!500492 (= res!302425 (= lt!227101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227103 lt!227100 lt!227095 mask!3524)))))

(declare-fun a!3235 () array!32303)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!227098 () (_ BitVec 32))

(assert (=> b!500492 (= lt!227101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227098 (select (arr!15533 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500492 (= lt!227103 (toIndex!0 lt!227100 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500492 (= lt!227100 (select (store (arr!15533 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500492 (= lt!227098 (toIndex!0 (select (arr!15533 a!3235) j!176) mask!3524))))

(assert (=> b!500492 (= lt!227095 (array!32304 (store (arr!15533 a!3235) i!1204 k0!2280) (size!15898 a!3235)))))

(declare-fun e!293206 () Bool)

(assert (=> b!500492 e!293206))

(declare-fun res!302430 () Bool)

(assert (=> b!500492 (=> (not res!302430) (not e!293206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32303 (_ BitVec 32)) Bool)

(assert (=> b!500492 (= res!302430 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15058 0))(
  ( (Unit!15059) )
))
(declare-fun lt!227102 () Unit!15058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15058)

(assert (=> b!500492 (= lt!227102 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500493 () Bool)

(declare-fun res!302426 () Bool)

(assert (=> b!500493 (=> (not res!302426) (not e!293205))))

(assert (=> b!500493 (= res!302426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500494 () Bool)

(declare-fun res!302428 () Bool)

(declare-fun e!293208 () Bool)

(assert (=> b!500494 (=> (not res!302428) (not e!293208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500494 (= res!302428 (validKeyInArray!0 k0!2280))))

(declare-fun b!500495 () Bool)

(declare-fun e!293203 () Bool)

(assert (=> b!500495 (= e!293203 false)))

(declare-fun res!302422 () Bool)

(assert (=> start!45468 (=> (not res!302422) (not e!293208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45468 (= res!302422 (validMask!0 mask!3524))))

(assert (=> start!45468 e!293208))

(assert (=> start!45468 true))

(declare-fun array_inv!11416 (array!32303) Bool)

(assert (=> start!45468 (array_inv!11416 a!3235)))

(declare-fun b!500496 () Bool)

(declare-fun res!302421 () Bool)

(assert (=> b!500496 (=> (not res!302421) (not e!293208))))

(assert (=> b!500496 (= res!302421 (and (= (size!15898 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15898 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15898 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500497 () Bool)

(declare-fun res!302423 () Bool)

(assert (=> b!500497 (=> (not res!302423) (not e!293208))))

(declare-fun arrayContainsKey!0 (array!32303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500497 (= res!302423 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500498 () Bool)

(declare-fun e!293202 () Unit!15058)

(declare-fun Unit!15060 () Unit!15058)

(assert (=> b!500498 (= e!293202 Unit!15060)))

(declare-fun lt!227104 () Unit!15058)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32303 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15058)

(assert (=> b!500498 (= lt!227104 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227098 #b00000000000000000000000000000000 (index!18172 lt!227101) (x!47213 lt!227101) mask!3524))))

(declare-fun res!302431 () Bool)

(assert (=> b!500498 (= res!302431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227098 lt!227100 lt!227095 mask!3524) (Intermediate!3997 false (index!18172 lt!227101) (x!47213 lt!227101))))))

(assert (=> b!500498 (=> (not res!302431) (not e!293203))))

(assert (=> b!500498 e!293203))

(declare-fun b!500499 () Bool)

(declare-fun res!302424 () Bool)

(assert (=> b!500499 (=> (not res!302424) (not e!293208))))

(assert (=> b!500499 (= res!302424 (validKeyInArray!0 (select (arr!15533 a!3235) j!176)))))

(declare-fun b!500500 () Bool)

(declare-fun res!302432 () Bool)

(assert (=> b!500500 (=> res!302432 e!293204)))

(get-info :version)

(assert (=> b!500500 (= res!302432 (or (undefined!4809 lt!227101) (not ((_ is Intermediate!3997) lt!227101))))))

(declare-fun b!500501 () Bool)

(declare-fun Unit!15061 () Unit!15058)

(assert (=> b!500501 (= e!293202 Unit!15061)))

(declare-fun b!500502 () Bool)

(assert (=> b!500502 (= e!293208 e!293205)))

(declare-fun res!302429 () Bool)

(assert (=> b!500502 (=> (not res!302429) (not e!293205))))

(declare-fun lt!227097 () SeekEntryResult!3997)

(assert (=> b!500502 (= res!302429 (or (= lt!227097 (MissingZero!3997 i!1204)) (= lt!227097 (MissingVacant!3997 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32303 (_ BitVec 32)) SeekEntryResult!3997)

(assert (=> b!500502 (= lt!227097 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500503 () Bool)

(declare-fun e!293207 () Bool)

(assert (=> b!500503 (= e!293207 true)))

(declare-fun lt!227096 () SeekEntryResult!3997)

(assert (=> b!500503 (= lt!227096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227098 lt!227100 lt!227095 mask!3524))))

(declare-fun b!500504 () Bool)

(declare-fun res!302420 () Bool)

(assert (=> b!500504 (=> (not res!302420) (not e!293205))))

(declare-datatypes ((List!9730 0))(
  ( (Nil!9727) (Cons!9726 (h!10600 (_ BitVec 64)) (t!15949 List!9730)) )
))
(declare-fun arrayNoDuplicates!0 (array!32303 (_ BitVec 32) List!9730) Bool)

(assert (=> b!500504 (= res!302420 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9727))))

(declare-fun b!500505 () Bool)

(assert (=> b!500505 (= e!293204 e!293207)))

(declare-fun res!302427 () Bool)

(assert (=> b!500505 (=> res!302427 e!293207)))

(assert (=> b!500505 (= res!302427 (or (bvsgt #b00000000000000000000000000000000 (x!47213 lt!227101)) (bvsgt (x!47213 lt!227101) #b01111111111111111111111111111110) (bvslt lt!227098 #b00000000000000000000000000000000) (bvsge lt!227098 (size!15898 a!3235)) (bvslt (index!18172 lt!227101) #b00000000000000000000000000000000) (bvsge (index!18172 lt!227101) (size!15898 a!3235)) (not (= lt!227101 (Intermediate!3997 false (index!18172 lt!227101) (x!47213 lt!227101))))))))

(assert (=> b!500505 (and (or (= (select (arr!15533 a!3235) (index!18172 lt!227101)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15533 a!3235) (index!18172 lt!227101)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15533 a!3235) (index!18172 lt!227101)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15533 a!3235) (index!18172 lt!227101)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227099 () Unit!15058)

(assert (=> b!500505 (= lt!227099 e!293202)))

(declare-fun c!59313 () Bool)

(assert (=> b!500505 (= c!59313 (= (select (arr!15533 a!3235) (index!18172 lt!227101)) (select (arr!15533 a!3235) j!176)))))

(assert (=> b!500505 (and (bvslt (x!47213 lt!227101) #b01111111111111111111111111111110) (or (= (select (arr!15533 a!3235) (index!18172 lt!227101)) (select (arr!15533 a!3235) j!176)) (= (select (arr!15533 a!3235) (index!18172 lt!227101)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15533 a!3235) (index!18172 lt!227101)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500506 () Bool)

(assert (=> b!500506 (= e!293206 (= (seekEntryOrOpen!0 (select (arr!15533 a!3235) j!176) a!3235 mask!3524) (Found!3997 j!176)))))

(assert (= (and start!45468 res!302422) b!500496))

(assert (= (and b!500496 res!302421) b!500499))

(assert (= (and b!500499 res!302424) b!500494))

(assert (= (and b!500494 res!302428) b!500497))

(assert (= (and b!500497 res!302423) b!500502))

(assert (= (and b!500502 res!302429) b!500493))

(assert (= (and b!500493 res!302426) b!500504))

(assert (= (and b!500504 res!302420) b!500492))

(assert (= (and b!500492 res!302430) b!500506))

(assert (= (and b!500492 (not res!302425)) b!500500))

(assert (= (and b!500500 (not res!302432)) b!500505))

(assert (= (and b!500505 c!59313) b!500498))

(assert (= (and b!500505 (not c!59313)) b!500501))

(assert (= (and b!500498 res!302431) b!500495))

(assert (= (and b!500505 (not res!302427)) b!500503))

(declare-fun m!481123 () Bool)

(assert (=> b!500503 m!481123))

(declare-fun m!481125 () Bool)

(assert (=> b!500498 m!481125))

(assert (=> b!500498 m!481123))

(declare-fun m!481127 () Bool)

(assert (=> b!500506 m!481127))

(assert (=> b!500506 m!481127))

(declare-fun m!481129 () Bool)

(assert (=> b!500506 m!481129))

(declare-fun m!481131 () Bool)

(assert (=> b!500497 m!481131))

(declare-fun m!481133 () Bool)

(assert (=> b!500494 m!481133))

(assert (=> b!500499 m!481127))

(assert (=> b!500499 m!481127))

(declare-fun m!481135 () Bool)

(assert (=> b!500499 m!481135))

(declare-fun m!481137 () Bool)

(assert (=> b!500502 m!481137))

(declare-fun m!481139 () Bool)

(assert (=> start!45468 m!481139))

(declare-fun m!481141 () Bool)

(assert (=> start!45468 m!481141))

(declare-fun m!481143 () Bool)

(assert (=> b!500492 m!481143))

(assert (=> b!500492 m!481127))

(declare-fun m!481145 () Bool)

(assert (=> b!500492 m!481145))

(declare-fun m!481147 () Bool)

(assert (=> b!500492 m!481147))

(declare-fun m!481149 () Bool)

(assert (=> b!500492 m!481149))

(declare-fun m!481151 () Bool)

(assert (=> b!500492 m!481151))

(declare-fun m!481153 () Bool)

(assert (=> b!500492 m!481153))

(assert (=> b!500492 m!481127))

(declare-fun m!481155 () Bool)

(assert (=> b!500492 m!481155))

(assert (=> b!500492 m!481127))

(declare-fun m!481157 () Bool)

(assert (=> b!500492 m!481157))

(declare-fun m!481159 () Bool)

(assert (=> b!500504 m!481159))

(declare-fun m!481161 () Bool)

(assert (=> b!500505 m!481161))

(assert (=> b!500505 m!481127))

(declare-fun m!481163 () Bool)

(assert (=> b!500493 m!481163))

(check-sat (not b!500506) (not b!500498) (not b!500499) (not b!500504) (not b!500494) (not b!500493) (not b!500502) (not b!500492) (not b!500497) (not start!45468) (not b!500503))
(check-sat)
