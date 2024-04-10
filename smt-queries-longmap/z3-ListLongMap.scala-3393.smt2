; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46772 () Bool)

(assert start!46772)

(declare-fun b!516601 () Bool)

(declare-fun res!316175 () Bool)

(declare-fun e!301478 () Bool)

(assert (=> b!516601 (=> (not res!316175) (not e!301478))))

(declare-datatypes ((array!33084 0))(
  ( (array!33085 (arr!15910 (Array (_ BitVec 32) (_ BitVec 64))) (size!16274 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33084)

(declare-datatypes ((List!10068 0))(
  ( (Nil!10065) (Cons!10064 (h!10962 (_ BitVec 64)) (t!16296 List!10068)) )
))
(declare-fun arrayNoDuplicates!0 (array!33084 (_ BitVec 32) List!10068) Bool)

(assert (=> b!516601 (= res!316175 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10065))))

(declare-fun b!516602 () Bool)

(declare-fun e!301479 () Bool)

(assert (=> b!516602 (= e!301478 (not e!301479))))

(declare-fun res!316169 () Bool)

(assert (=> b!516602 (=> res!316169 e!301479)))

(declare-datatypes ((SeekEntryResult!4377 0))(
  ( (MissingZero!4377 (index!19696 (_ BitVec 32))) (Found!4377 (index!19697 (_ BitVec 32))) (Intermediate!4377 (undefined!5189 Bool) (index!19698 (_ BitVec 32)) (x!48652 (_ BitVec 32))) (Undefined!4377) (MissingVacant!4377 (index!19699 (_ BitVec 32))) )
))
(declare-fun lt!236492 () SeekEntryResult!4377)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236494 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33084 (_ BitVec 32)) SeekEntryResult!4377)

(assert (=> b!516602 (= res!316169 (= lt!236492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236494 (select (store (arr!15910 a!3235) i!1204 k0!2280) j!176) (array!33085 (store (arr!15910 a!3235) i!1204 k0!2280) (size!16274 a!3235)) mask!3524)))))

(declare-fun lt!236491 () (_ BitVec 32))

(assert (=> b!516602 (= lt!236492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236491 (select (arr!15910 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516602 (= lt!236494 (toIndex!0 (select (store (arr!15910 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516602 (= lt!236491 (toIndex!0 (select (arr!15910 a!3235) j!176) mask!3524))))

(declare-fun e!301476 () Bool)

(assert (=> b!516602 e!301476))

(declare-fun res!316172 () Bool)

(assert (=> b!516602 (=> (not res!316172) (not e!301476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33084 (_ BitVec 32)) Bool)

(assert (=> b!516602 (= res!316172 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16012 0))(
  ( (Unit!16013) )
))
(declare-fun lt!236490 () Unit!16012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16012)

(assert (=> b!516602 (= lt!236490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516603 () Bool)

(declare-fun res!316174 () Bool)

(declare-fun e!301477 () Bool)

(assert (=> b!516603 (=> (not res!316174) (not e!301477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516603 (= res!316174 (validKeyInArray!0 k0!2280))))

(declare-fun b!516604 () Bool)

(declare-fun res!316173 () Bool)

(assert (=> b!516604 (=> (not res!316173) (not e!301477))))

(assert (=> b!516604 (= res!316173 (and (= (size!16274 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16274 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16274 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!316166 () Bool)

(assert (=> start!46772 (=> (not res!316166) (not e!301477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46772 (= res!316166 (validMask!0 mask!3524))))

(assert (=> start!46772 e!301477))

(assert (=> start!46772 true))

(declare-fun array_inv!11706 (array!33084) Bool)

(assert (=> start!46772 (array_inv!11706 a!3235)))

(declare-fun b!516605 () Bool)

(assert (=> b!516605 (= e!301477 e!301478)))

(declare-fun res!316165 () Bool)

(assert (=> b!516605 (=> (not res!316165) (not e!301478))))

(declare-fun lt!236493 () SeekEntryResult!4377)

(assert (=> b!516605 (= res!316165 (or (= lt!236493 (MissingZero!4377 i!1204)) (= lt!236493 (MissingVacant!4377 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33084 (_ BitVec 32)) SeekEntryResult!4377)

(assert (=> b!516605 (= lt!236493 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516606 () Bool)

(assert (=> b!516606 (= e!301476 (= (seekEntryOrOpen!0 (select (arr!15910 a!3235) j!176) a!3235 mask!3524) (Found!4377 j!176)))))

(declare-fun b!516607 () Bool)

(declare-fun res!316171 () Bool)

(assert (=> b!516607 (=> (not res!316171) (not e!301477))))

(assert (=> b!516607 (= res!316171 (validKeyInArray!0 (select (arr!15910 a!3235) j!176)))))

(declare-fun b!516608 () Bool)

(declare-fun res!316170 () Bool)

(assert (=> b!516608 (=> res!316170 e!301479)))

(get-info :version)

(assert (=> b!516608 (= res!316170 (or (undefined!5189 lt!236492) (not ((_ is Intermediate!4377) lt!236492))))))

(declare-fun b!516609 () Bool)

(declare-fun res!316168 () Bool)

(assert (=> b!516609 (=> (not res!316168) (not e!301477))))

(declare-fun arrayContainsKey!0 (array!33084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516609 (= res!316168 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516610 () Bool)

(assert (=> b!516610 (= e!301479 (or (not (= (select (arr!15910 a!3235) (index!19698 lt!236492)) (select (arr!15910 a!3235) j!176))) (bvsle (x!48652 lt!236492) #b01111111111111111111111111111110)))))

(assert (=> b!516610 (and (bvslt (x!48652 lt!236492) #b01111111111111111111111111111110) (or (= (select (arr!15910 a!3235) (index!19698 lt!236492)) (select (arr!15910 a!3235) j!176)) (= (select (arr!15910 a!3235) (index!19698 lt!236492)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15910 a!3235) (index!19698 lt!236492)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516611 () Bool)

(declare-fun res!316167 () Bool)

(assert (=> b!516611 (=> (not res!316167) (not e!301478))))

(assert (=> b!516611 (= res!316167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46772 res!316166) b!516604))

(assert (= (and b!516604 res!316173) b!516607))

(assert (= (and b!516607 res!316171) b!516603))

(assert (= (and b!516603 res!316174) b!516609))

(assert (= (and b!516609 res!316168) b!516605))

(assert (= (and b!516605 res!316165) b!516611))

(assert (= (and b!516611 res!316167) b!516601))

(assert (= (and b!516601 res!316175) b!516602))

(assert (= (and b!516602 res!316172) b!516606))

(assert (= (and b!516602 (not res!316169)) b!516608))

(assert (= (and b!516608 (not res!316170)) b!516610))

(declare-fun m!498113 () Bool)

(assert (=> b!516607 m!498113))

(assert (=> b!516607 m!498113))

(declare-fun m!498115 () Bool)

(assert (=> b!516607 m!498115))

(declare-fun m!498117 () Bool)

(assert (=> b!516601 m!498117))

(declare-fun m!498119 () Bool)

(assert (=> b!516611 m!498119))

(declare-fun m!498121 () Bool)

(assert (=> start!46772 m!498121))

(declare-fun m!498123 () Bool)

(assert (=> start!46772 m!498123))

(declare-fun m!498125 () Bool)

(assert (=> b!516610 m!498125))

(assert (=> b!516610 m!498113))

(declare-fun m!498127 () Bool)

(assert (=> b!516603 m!498127))

(declare-fun m!498129 () Bool)

(assert (=> b!516602 m!498129))

(declare-fun m!498131 () Bool)

(assert (=> b!516602 m!498131))

(declare-fun m!498133 () Bool)

(assert (=> b!516602 m!498133))

(declare-fun m!498135 () Bool)

(assert (=> b!516602 m!498135))

(assert (=> b!516602 m!498129))

(assert (=> b!516602 m!498113))

(declare-fun m!498137 () Bool)

(assert (=> b!516602 m!498137))

(assert (=> b!516602 m!498113))

(assert (=> b!516602 m!498113))

(declare-fun m!498139 () Bool)

(assert (=> b!516602 m!498139))

(declare-fun m!498141 () Bool)

(assert (=> b!516602 m!498141))

(assert (=> b!516602 m!498129))

(declare-fun m!498143 () Bool)

(assert (=> b!516602 m!498143))

(assert (=> b!516606 m!498113))

(assert (=> b!516606 m!498113))

(declare-fun m!498145 () Bool)

(assert (=> b!516606 m!498145))

(declare-fun m!498147 () Bool)

(assert (=> b!516609 m!498147))

(declare-fun m!498149 () Bool)

(assert (=> b!516605 m!498149))

(check-sat (not b!516602) (not b!516601) (not b!516603) (not b!516605) (not b!516611) (not b!516607) (not b!516609) (not b!516606) (not start!46772))
(check-sat)
