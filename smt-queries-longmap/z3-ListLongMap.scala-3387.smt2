; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46736 () Bool)

(assert start!46736)

(declare-fun res!315572 () Bool)

(declare-fun e!301209 () Bool)

(assert (=> start!46736 (=> (not res!315572) (not e!301209))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46736 (= res!315572 (validMask!0 mask!3524))))

(assert (=> start!46736 e!301209))

(assert (=> start!46736 true))

(declare-datatypes ((array!33048 0))(
  ( (array!33049 (arr!15892 (Array (_ BitVec 32) (_ BitVec 64))) (size!16256 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33048)

(declare-fun array_inv!11688 (array!33048) Bool)

(assert (=> start!46736 (array_inv!11688 a!3235)))

(declare-fun b!516007 () Bool)

(declare-fun res!315574 () Bool)

(assert (=> b!516007 (=> (not res!315574) (not e!301209))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516007 (= res!315574 (and (= (size!16256 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16256 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16256 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516008 () Bool)

(declare-fun res!315575 () Bool)

(assert (=> b!516008 (=> (not res!315575) (not e!301209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516008 (= res!315575 (validKeyInArray!0 (select (arr!15892 a!3235) j!176)))))

(declare-fun b!516009 () Bool)

(declare-fun e!301207 () Bool)

(assert (=> b!516009 (= e!301207 true)))

(declare-datatypes ((SeekEntryResult!4359 0))(
  ( (MissingZero!4359 (index!19624 (_ BitVec 32))) (Found!4359 (index!19625 (_ BitVec 32))) (Intermediate!4359 (undefined!5171 Bool) (index!19626 (_ BitVec 32)) (x!48586 (_ BitVec 32))) (Undefined!4359) (MissingVacant!4359 (index!19627 (_ BitVec 32))) )
))
(declare-fun lt!236224 () SeekEntryResult!4359)

(assert (=> b!516009 (and (bvslt (x!48586 lt!236224) #b01111111111111111111111111111110) (or (= (select (arr!15892 a!3235) (index!19626 lt!236224)) (select (arr!15892 a!3235) j!176)) (= (select (arr!15892 a!3235) (index!19626 lt!236224)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15892 a!3235) (index!19626 lt!236224)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516010 () Bool)

(declare-fun res!315571 () Bool)

(assert (=> b!516010 (=> res!315571 e!301207)))

(get-info :version)

(assert (=> b!516010 (= res!315571 (or (undefined!5171 lt!236224) (not ((_ is Intermediate!4359) lt!236224))))))

(declare-fun b!516011 () Bool)

(declare-fun e!301208 () Bool)

(assert (=> b!516011 (= e!301208 (not e!301207))))

(declare-fun res!315576 () Bool)

(assert (=> b!516011 (=> res!315576 e!301207)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!236222 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33048 (_ BitVec 32)) SeekEntryResult!4359)

(assert (=> b!516011 (= res!315576 (= lt!236224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236222 (select (store (arr!15892 a!3235) i!1204 k0!2280) j!176) (array!33049 (store (arr!15892 a!3235) i!1204 k0!2280) (size!16256 a!3235)) mask!3524)))))

(declare-fun lt!236221 () (_ BitVec 32))

(assert (=> b!516011 (= lt!236224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236221 (select (arr!15892 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516011 (= lt!236222 (toIndex!0 (select (store (arr!15892 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516011 (= lt!236221 (toIndex!0 (select (arr!15892 a!3235) j!176) mask!3524))))

(declare-fun e!301205 () Bool)

(assert (=> b!516011 e!301205))

(declare-fun res!315579 () Bool)

(assert (=> b!516011 (=> (not res!315579) (not e!301205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33048 (_ BitVec 32)) Bool)

(assert (=> b!516011 (= res!315579 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15976 0))(
  ( (Unit!15977) )
))
(declare-fun lt!236220 () Unit!15976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15976)

(assert (=> b!516011 (= lt!236220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516012 () Bool)

(declare-fun res!315578 () Bool)

(assert (=> b!516012 (=> (not res!315578) (not e!301209))))

(assert (=> b!516012 (= res!315578 (validKeyInArray!0 k0!2280))))

(declare-fun b!516013 () Bool)

(declare-fun res!315573 () Bool)

(assert (=> b!516013 (=> (not res!315573) (not e!301208))))

(declare-datatypes ((List!10050 0))(
  ( (Nil!10047) (Cons!10046 (h!10944 (_ BitVec 64)) (t!16278 List!10050)) )
))
(declare-fun arrayNoDuplicates!0 (array!33048 (_ BitVec 32) List!10050) Bool)

(assert (=> b!516013 (= res!315573 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10047))))

(declare-fun b!516014 () Bool)

(assert (=> b!516014 (= e!301209 e!301208)))

(declare-fun res!315577 () Bool)

(assert (=> b!516014 (=> (not res!315577) (not e!301208))))

(declare-fun lt!236223 () SeekEntryResult!4359)

(assert (=> b!516014 (= res!315577 (or (= lt!236223 (MissingZero!4359 i!1204)) (= lt!236223 (MissingVacant!4359 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33048 (_ BitVec 32)) SeekEntryResult!4359)

(assert (=> b!516014 (= lt!236223 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516015 () Bool)

(assert (=> b!516015 (= e!301205 (= (seekEntryOrOpen!0 (select (arr!15892 a!3235) j!176) a!3235 mask!3524) (Found!4359 j!176)))))

(declare-fun b!516016 () Bool)

(declare-fun res!315581 () Bool)

(assert (=> b!516016 (=> (not res!315581) (not e!301209))))

(declare-fun arrayContainsKey!0 (array!33048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516016 (= res!315581 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516017 () Bool)

(declare-fun res!315580 () Bool)

(assert (=> b!516017 (=> (not res!315580) (not e!301208))))

(assert (=> b!516017 (= res!315580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46736 res!315572) b!516007))

(assert (= (and b!516007 res!315574) b!516008))

(assert (= (and b!516008 res!315575) b!516012))

(assert (= (and b!516012 res!315578) b!516016))

(assert (= (and b!516016 res!315581) b!516014))

(assert (= (and b!516014 res!315577) b!516017))

(assert (= (and b!516017 res!315580) b!516013))

(assert (= (and b!516013 res!315573) b!516011))

(assert (= (and b!516011 res!315579) b!516015))

(assert (= (and b!516011 (not res!315576)) b!516010))

(assert (= (and b!516010 (not res!315571)) b!516009))

(declare-fun m!497429 () Bool)

(assert (=> b!516009 m!497429))

(declare-fun m!497431 () Bool)

(assert (=> b!516009 m!497431))

(declare-fun m!497433 () Bool)

(assert (=> start!46736 m!497433))

(declare-fun m!497435 () Bool)

(assert (=> start!46736 m!497435))

(declare-fun m!497437 () Bool)

(assert (=> b!516012 m!497437))

(declare-fun m!497439 () Bool)

(assert (=> b!516016 m!497439))

(declare-fun m!497441 () Bool)

(assert (=> b!516014 m!497441))

(assert (=> b!516015 m!497431))

(assert (=> b!516015 m!497431))

(declare-fun m!497443 () Bool)

(assert (=> b!516015 m!497443))

(declare-fun m!497445 () Bool)

(assert (=> b!516013 m!497445))

(declare-fun m!497447 () Bool)

(assert (=> b!516017 m!497447))

(declare-fun m!497449 () Bool)

(assert (=> b!516011 m!497449))

(declare-fun m!497451 () Bool)

(assert (=> b!516011 m!497451))

(declare-fun m!497453 () Bool)

(assert (=> b!516011 m!497453))

(assert (=> b!516011 m!497431))

(declare-fun m!497455 () Bool)

(assert (=> b!516011 m!497455))

(assert (=> b!516011 m!497431))

(declare-fun m!497457 () Bool)

(assert (=> b!516011 m!497457))

(assert (=> b!516011 m!497431))

(declare-fun m!497459 () Bool)

(assert (=> b!516011 m!497459))

(assert (=> b!516011 m!497453))

(declare-fun m!497461 () Bool)

(assert (=> b!516011 m!497461))

(assert (=> b!516011 m!497453))

(declare-fun m!497463 () Bool)

(assert (=> b!516011 m!497463))

(assert (=> b!516008 m!497431))

(assert (=> b!516008 m!497431))

(declare-fun m!497465 () Bool)

(assert (=> b!516008 m!497465))

(check-sat (not b!516015) (not b!516008) (not start!46736) (not b!516017) (not b!516014) (not b!516016) (not b!516012) (not b!516011) (not b!516013))
(check-sat)
