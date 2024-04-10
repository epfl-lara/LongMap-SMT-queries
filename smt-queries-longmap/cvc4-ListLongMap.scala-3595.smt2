; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49444 () Bool)

(assert start!49444)

(declare-fun res!338720 () Bool)

(declare-fun e!314778 () Bool)

(assert (=> start!49444 (=> (not res!338720) (not e!314778))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49444 (= res!338720 (validMask!0 mask!3216))))

(assert (=> start!49444 e!314778))

(assert (=> start!49444 true))

(declare-datatypes ((array!34371 0))(
  ( (array!34372 (arr!16517 (Array (_ BitVec 32) (_ BitVec 64))) (size!16881 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34371)

(declare-fun array_inv!12313 (array!34371) Bool)

(assert (=> start!49444 (array_inv!12313 a!3154)))

(declare-fun b!544449 () Bool)

(declare-fun res!338712 () Bool)

(declare-fun e!314781 () Bool)

(assert (=> b!544449 (=> (not res!338712) (not e!314781))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544449 (= res!338712 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16881 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16881 a!3154)) (= (select (arr!16517 a!3154) resIndex!32) (select (arr!16517 a!3154) j!147))))))

(declare-fun b!544450 () Bool)

(declare-fun res!338723 () Bool)

(assert (=> b!544450 (=> (not res!338723) (not e!314781))))

(declare-datatypes ((List!10636 0))(
  ( (Nil!10633) (Cons!10632 (h!11590 (_ BitVec 64)) (t!16864 List!10636)) )
))
(declare-fun arrayNoDuplicates!0 (array!34371 (_ BitVec 32) List!10636) Bool)

(assert (=> b!544450 (= res!338723 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10633))))

(declare-fun b!544451 () Bool)

(declare-fun res!338714 () Bool)

(declare-fun e!314779 () Bool)

(assert (=> b!544451 (=> (not res!338714) (not e!314779))))

(assert (=> b!544451 (= res!338714 (and (not (= (select (arr!16517 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16517 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16517 a!3154) index!1177) (select (arr!16517 a!3154) j!147)))))))

(declare-fun b!544452 () Bool)

(assert (=> b!544452 (= e!314778 e!314781)))

(declare-fun res!338716 () Bool)

(assert (=> b!544452 (=> (not res!338716) (not e!314781))))

(declare-datatypes ((SeekEntryResult!4975 0))(
  ( (MissingZero!4975 (index!22124 (_ BitVec 32))) (Found!4975 (index!22125 (_ BitVec 32))) (Intermediate!4975 (undefined!5787 Bool) (index!22126 (_ BitVec 32)) (x!51037 (_ BitVec 32))) (Undefined!4975) (MissingVacant!4975 (index!22127 (_ BitVec 32))) )
))
(declare-fun lt!248493 () SeekEntryResult!4975)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544452 (= res!338716 (or (= lt!248493 (MissingZero!4975 i!1153)) (= lt!248493 (MissingVacant!4975 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34371 (_ BitVec 32)) SeekEntryResult!4975)

(assert (=> b!544452 (= lt!248493 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!544453 () Bool)

(declare-fun res!338719 () Bool)

(assert (=> b!544453 (=> (not res!338719) (not e!314778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544453 (= res!338719 (validKeyInArray!0 (select (arr!16517 a!3154) j!147)))))

(declare-fun b!544454 () Bool)

(declare-fun res!338713 () Bool)

(assert (=> b!544454 (=> (not res!338713) (not e!314778))))

(declare-fun arrayContainsKey!0 (array!34371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544454 (= res!338713 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544455 () Bool)

(assert (=> b!544455 (= e!314779 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvslt (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000)))))

(declare-fun lt!248492 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544455 (= lt!248492 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544456 () Bool)

(declare-fun res!338718 () Bool)

(assert (=> b!544456 (=> (not res!338718) (not e!314778))))

(assert (=> b!544456 (= res!338718 (validKeyInArray!0 k!1998))))

(declare-fun b!544457 () Bool)

(assert (=> b!544457 (= e!314781 e!314779)))

(declare-fun res!338721 () Bool)

(assert (=> b!544457 (=> (not res!338721) (not e!314779))))

(declare-fun lt!248494 () SeekEntryResult!4975)

(assert (=> b!544457 (= res!338721 (= lt!248494 (Intermediate!4975 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34371 (_ BitVec 32)) SeekEntryResult!4975)

(assert (=> b!544457 (= lt!248494 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16517 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544458 () Bool)

(declare-fun res!338722 () Bool)

(assert (=> b!544458 (=> (not res!338722) (not e!314778))))

(assert (=> b!544458 (= res!338722 (and (= (size!16881 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16881 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16881 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544459 () Bool)

(declare-fun res!338717 () Bool)

(assert (=> b!544459 (=> (not res!338717) (not e!314781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34371 (_ BitVec 32)) Bool)

(assert (=> b!544459 (= res!338717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544460 () Bool)

(declare-fun res!338715 () Bool)

(assert (=> b!544460 (=> (not res!338715) (not e!314779))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544460 (= res!338715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216) (select (arr!16517 a!3154) j!147) a!3154 mask!3216) lt!248494))))

(assert (= (and start!49444 res!338720) b!544458))

(assert (= (and b!544458 res!338722) b!544453))

(assert (= (and b!544453 res!338719) b!544456))

(assert (= (and b!544456 res!338718) b!544454))

(assert (= (and b!544454 res!338713) b!544452))

(assert (= (and b!544452 res!338716) b!544459))

(assert (= (and b!544459 res!338717) b!544450))

(assert (= (and b!544450 res!338723) b!544449))

(assert (= (and b!544449 res!338712) b!544457))

(assert (= (and b!544457 res!338721) b!544460))

(assert (= (and b!544460 res!338715) b!544451))

(assert (= (and b!544451 res!338714) b!544455))

(declare-fun m!522345 () Bool)

(assert (=> b!544456 m!522345))

(declare-fun m!522347 () Bool)

(assert (=> b!544452 m!522347))

(declare-fun m!522349 () Bool)

(assert (=> b!544460 m!522349))

(assert (=> b!544460 m!522349))

(declare-fun m!522351 () Bool)

(assert (=> b!544460 m!522351))

(assert (=> b!544460 m!522351))

(assert (=> b!544460 m!522349))

(declare-fun m!522353 () Bool)

(assert (=> b!544460 m!522353))

(assert (=> b!544457 m!522349))

(assert (=> b!544457 m!522349))

(declare-fun m!522355 () Bool)

(assert (=> b!544457 m!522355))

(assert (=> b!544453 m!522349))

(assert (=> b!544453 m!522349))

(declare-fun m!522357 () Bool)

(assert (=> b!544453 m!522357))

(declare-fun m!522359 () Bool)

(assert (=> b!544455 m!522359))

(declare-fun m!522361 () Bool)

(assert (=> b!544449 m!522361))

(assert (=> b!544449 m!522349))

(declare-fun m!522363 () Bool)

(assert (=> b!544454 m!522363))

(declare-fun m!522365 () Bool)

(assert (=> start!49444 m!522365))

(declare-fun m!522367 () Bool)

(assert (=> start!49444 m!522367))

(declare-fun m!522369 () Bool)

(assert (=> b!544450 m!522369))

(declare-fun m!522371 () Bool)

(assert (=> b!544451 m!522371))

(assert (=> b!544451 m!522349))

(declare-fun m!522373 () Bool)

(assert (=> b!544459 m!522373))

(push 1)

(assert (not b!544456))

(assert (not b!544452))

(assert (not start!49444))

(assert (not b!544450))

(assert (not b!544459))

(assert (not b!544457))

(assert (not b!544460))

(assert (not b!544455))

