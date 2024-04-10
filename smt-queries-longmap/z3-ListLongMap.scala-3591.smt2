; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49334 () Bool)

(assert start!49334)

(declare-fun b!543510 () Bool)

(declare-fun e!314325 () Bool)

(declare-fun e!314323 () Bool)

(assert (=> b!543510 (= e!314325 e!314323)))

(declare-fun res!338067 () Bool)

(assert (=> b!543510 (=> (not res!338067) (not e!314323))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4962 0))(
  ( (MissingZero!4962 (index!22072 (_ BitVec 32))) (Found!4962 (index!22073 (_ BitVec 32))) (Intermediate!4962 (undefined!5774 Bool) (index!22074 (_ BitVec 32)) (x!50977 (_ BitVec 32))) (Undefined!4962) (MissingVacant!4962 (index!22075 (_ BitVec 32))) )
))
(declare-fun lt!248191 () SeekEntryResult!4962)

(assert (=> b!543510 (= res!338067 (= lt!248191 (Intermediate!4962 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34342 0))(
  ( (array!34343 (arr!16504 (Array (_ BitVec 32) (_ BitVec 64))) (size!16868 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34342)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34342 (_ BitVec 32)) SeekEntryResult!4962)

(assert (=> b!543510 (= lt!248191 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16504 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543511 () Bool)

(declare-fun res!338069 () Bool)

(declare-fun e!314324 () Bool)

(assert (=> b!543511 (=> (not res!338069) (not e!314324))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543511 (= res!338069 (and (= (size!16868 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16868 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16868 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543512 () Bool)

(declare-fun res!338066 () Bool)

(assert (=> b!543512 (=> (not res!338066) (not e!314324))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543512 (= res!338066 (validKeyInArray!0 k0!1998))))

(declare-fun res!338063 () Bool)

(assert (=> start!49334 (=> (not res!338063) (not e!314324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49334 (= res!338063 (validMask!0 mask!3216))))

(assert (=> start!49334 e!314324))

(assert (=> start!49334 true))

(declare-fun array_inv!12300 (array!34342) Bool)

(assert (=> start!49334 (array_inv!12300 a!3154)))

(declare-fun b!543513 () Bool)

(declare-fun res!338061 () Bool)

(assert (=> b!543513 (=> (not res!338061) (not e!314325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34342 (_ BitVec 32)) Bool)

(assert (=> b!543513 (= res!338061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543514 () Bool)

(declare-fun res!338070 () Bool)

(assert (=> b!543514 (=> (not res!338070) (not e!314325))))

(assert (=> b!543514 (= res!338070 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16868 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16868 a!3154)) (= (select (arr!16504 a!3154) resIndex!32) (select (arr!16504 a!3154) j!147))))))

(declare-fun b!543515 () Bool)

(declare-fun res!338062 () Bool)

(assert (=> b!543515 (=> (not res!338062) (not e!314324))))

(assert (=> b!543515 (= res!338062 (validKeyInArray!0 (select (arr!16504 a!3154) j!147)))))

(declare-fun b!543516 () Bool)

(declare-fun res!338065 () Bool)

(assert (=> b!543516 (=> (not res!338065) (not e!314325))))

(declare-datatypes ((List!10623 0))(
  ( (Nil!10620) (Cons!10619 (h!11574 (_ BitVec 64)) (t!16851 List!10623)) )
))
(declare-fun arrayNoDuplicates!0 (array!34342 (_ BitVec 32) List!10623) Bool)

(assert (=> b!543516 (= res!338065 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10620))))

(declare-fun b!543517 () Bool)

(assert (=> b!543517 (= e!314324 e!314325)))

(declare-fun res!338071 () Bool)

(assert (=> b!543517 (=> (not res!338071) (not e!314325))))

(declare-fun lt!248189 () SeekEntryResult!4962)

(assert (=> b!543517 (= res!338071 (or (= lt!248189 (MissingZero!4962 i!1153)) (= lt!248189 (MissingVacant!4962 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34342 (_ BitVec 32)) SeekEntryResult!4962)

(assert (=> b!543517 (= lt!248189 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543518 () Bool)

(declare-fun res!338068 () Bool)

(assert (=> b!543518 (=> (not res!338068) (not e!314323))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543518 (= res!338068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16504 a!3154) j!147) mask!3216) (select (arr!16504 a!3154) j!147) a!3154 mask!3216) lt!248191))))

(declare-fun b!543519 () Bool)

(declare-fun res!338072 () Bool)

(assert (=> b!543519 (=> (not res!338072) (not e!314323))))

(assert (=> b!543519 (= res!338072 (and (not (= (select (arr!16504 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16504 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16504 a!3154) index!1177) (select (arr!16504 a!3154) j!147)))))))

(declare-fun b!543520 () Bool)

(declare-fun res!338064 () Bool)

(assert (=> b!543520 (=> (not res!338064) (not e!314324))))

(declare-fun arrayContainsKey!0 (array!34342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543520 (= res!338064 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543521 () Bool)

(assert (=> b!543521 (= e!314323 false)))

(declare-fun lt!248190 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543521 (= lt!248190 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!49334 res!338063) b!543511))

(assert (= (and b!543511 res!338069) b!543515))

(assert (= (and b!543515 res!338062) b!543512))

(assert (= (and b!543512 res!338066) b!543520))

(assert (= (and b!543520 res!338064) b!543517))

(assert (= (and b!543517 res!338071) b!543513))

(assert (= (and b!543513 res!338061) b!543516))

(assert (= (and b!543516 res!338065) b!543514))

(assert (= (and b!543514 res!338070) b!543510))

(assert (= (and b!543510 res!338067) b!543518))

(assert (= (and b!543518 res!338068) b!543519))

(assert (= (and b!543519 res!338072) b!543521))

(declare-fun m!521589 () Bool)

(assert (=> b!543519 m!521589))

(declare-fun m!521591 () Bool)

(assert (=> b!543519 m!521591))

(declare-fun m!521593 () Bool)

(assert (=> b!543512 m!521593))

(declare-fun m!521595 () Bool)

(assert (=> b!543514 m!521595))

(assert (=> b!543514 m!521591))

(declare-fun m!521597 () Bool)

(assert (=> b!543520 m!521597))

(declare-fun m!521599 () Bool)

(assert (=> b!543513 m!521599))

(declare-fun m!521601 () Bool)

(assert (=> b!543516 m!521601))

(declare-fun m!521603 () Bool)

(assert (=> b!543517 m!521603))

(assert (=> b!543518 m!521591))

(assert (=> b!543518 m!521591))

(declare-fun m!521605 () Bool)

(assert (=> b!543518 m!521605))

(assert (=> b!543518 m!521605))

(assert (=> b!543518 m!521591))

(declare-fun m!521607 () Bool)

(assert (=> b!543518 m!521607))

(declare-fun m!521609 () Bool)

(assert (=> b!543521 m!521609))

(assert (=> b!543510 m!521591))

(assert (=> b!543510 m!521591))

(declare-fun m!521611 () Bool)

(assert (=> b!543510 m!521611))

(assert (=> b!543515 m!521591))

(assert (=> b!543515 m!521591))

(declare-fun m!521613 () Bool)

(assert (=> b!543515 m!521613))

(declare-fun m!521615 () Bool)

(assert (=> start!49334 m!521615))

(declare-fun m!521617 () Bool)

(assert (=> start!49334 m!521617))

(check-sat (not b!543520) (not b!543517) (not b!543516) (not start!49334) (not b!543515) (not b!543521) (not b!543513) (not b!543512) (not b!543518) (not b!543510))
(check-sat)
