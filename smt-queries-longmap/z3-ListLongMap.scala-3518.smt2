; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48666 () Bool)

(assert start!48666)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun b!534598 () Bool)

(declare-datatypes ((array!33888 0))(
  ( (array!33889 (arr!16283 (Array (_ BitVec 32) (_ BitVec 64))) (size!16648 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33888)

(declare-fun e!310670 () Bool)

(assert (=> b!534598 (= e!310670 (and (not (= (select (arr!16283 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16283 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16283 a!3154) index!1177) (select (arr!16283 a!3154) j!147)) (= index!1177 resIndex!32) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!534599 () Bool)

(declare-fun res!329949 () Bool)

(declare-fun e!310671 () Bool)

(assert (=> b!534599 (=> (not res!329949) (not e!310671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33888 (_ BitVec 32)) Bool)

(assert (=> b!534599 (= res!329949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534600 () Bool)

(assert (=> b!534600 (= e!310671 e!310670)))

(declare-fun res!329951 () Bool)

(assert (=> b!534600 (=> (not res!329951) (not e!310670))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4738 0))(
  ( (MissingZero!4738 (index!21176 (_ BitVec 32))) (Found!4738 (index!21177 (_ BitVec 32))) (Intermediate!4738 (undefined!5550 Bool) (index!21178 (_ BitVec 32)) (x!50140 (_ BitVec 32))) (Undefined!4738) (MissingVacant!4738 (index!21179 (_ BitVec 32))) )
))
(declare-fun lt!245484 () SeekEntryResult!4738)

(assert (=> b!534600 (= res!329951 (= lt!245484 (Intermediate!4738 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33888 (_ BitVec 32)) SeekEntryResult!4738)

(assert (=> b!534600 (= lt!245484 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16283 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534601 () Bool)

(declare-fun res!329948 () Bool)

(declare-fun e!310668 () Bool)

(assert (=> b!534601 (=> (not res!329948) (not e!310668))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534601 (= res!329948 (validKeyInArray!0 k0!1998))))

(declare-fun b!534602 () Bool)

(declare-fun res!329944 () Bool)

(assert (=> b!534602 (=> (not res!329944) (not e!310668))))

(declare-fun arrayContainsKey!0 (array!33888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534602 (= res!329944 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534603 () Bool)

(declare-fun res!329946 () Bool)

(assert (=> b!534603 (=> (not res!329946) (not e!310668))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534603 (= res!329946 (and (= (size!16648 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16648 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16648 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534604 () Bool)

(declare-fun res!329945 () Bool)

(assert (=> b!534604 (=> (not res!329945) (not e!310670))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534604 (= res!329945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16283 a!3154) j!147) mask!3216) (select (arr!16283 a!3154) j!147) a!3154 mask!3216) lt!245484))))

(declare-fun b!534605 () Bool)

(declare-fun res!329953 () Bool)

(assert (=> b!534605 (=> (not res!329953) (not e!310668))))

(assert (=> b!534605 (= res!329953 (validKeyInArray!0 (select (arr!16283 a!3154) j!147)))))

(declare-fun b!534606 () Bool)

(declare-fun res!329952 () Bool)

(assert (=> b!534606 (=> (not res!329952) (not e!310671))))

(assert (=> b!534606 (= res!329952 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16648 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16648 a!3154)) (= (select (arr!16283 a!3154) resIndex!32) (select (arr!16283 a!3154) j!147))))))

(declare-fun b!534607 () Bool)

(declare-fun res!329947 () Bool)

(assert (=> b!534607 (=> (not res!329947) (not e!310671))))

(declare-datatypes ((List!10441 0))(
  ( (Nil!10438) (Cons!10437 (h!11380 (_ BitVec 64)) (t!16660 List!10441)) )
))
(declare-fun arrayNoDuplicates!0 (array!33888 (_ BitVec 32) List!10441) Bool)

(assert (=> b!534607 (= res!329947 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10438))))

(declare-fun res!329954 () Bool)

(assert (=> start!48666 (=> (not res!329954) (not e!310668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48666 (= res!329954 (validMask!0 mask!3216))))

(assert (=> start!48666 e!310668))

(assert (=> start!48666 true))

(declare-fun array_inv!12166 (array!33888) Bool)

(assert (=> start!48666 (array_inv!12166 a!3154)))

(declare-fun b!534597 () Bool)

(assert (=> b!534597 (= e!310668 e!310671)))

(declare-fun res!329950 () Bool)

(assert (=> b!534597 (=> (not res!329950) (not e!310671))))

(declare-fun lt!245485 () SeekEntryResult!4738)

(assert (=> b!534597 (= res!329950 (or (= lt!245485 (MissingZero!4738 i!1153)) (= lt!245485 (MissingVacant!4738 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33888 (_ BitVec 32)) SeekEntryResult!4738)

(assert (=> b!534597 (= lt!245485 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48666 res!329954) b!534603))

(assert (= (and b!534603 res!329946) b!534605))

(assert (= (and b!534605 res!329953) b!534601))

(assert (= (and b!534601 res!329948) b!534602))

(assert (= (and b!534602 res!329944) b!534597))

(assert (= (and b!534597 res!329950) b!534599))

(assert (= (and b!534599 res!329949) b!534607))

(assert (= (and b!534607 res!329947) b!534606))

(assert (= (and b!534606 res!329952) b!534600))

(assert (= (and b!534600 res!329951) b!534604))

(assert (= (and b!534604 res!329945) b!534598))

(declare-fun m!513775 () Bool)

(assert (=> start!48666 m!513775))

(declare-fun m!513777 () Bool)

(assert (=> start!48666 m!513777))

(declare-fun m!513779 () Bool)

(assert (=> b!534607 m!513779))

(declare-fun m!513781 () Bool)

(assert (=> b!534598 m!513781))

(declare-fun m!513783 () Bool)

(assert (=> b!534598 m!513783))

(declare-fun m!513785 () Bool)

(assert (=> b!534601 m!513785))

(declare-fun m!513787 () Bool)

(assert (=> b!534599 m!513787))

(declare-fun m!513789 () Bool)

(assert (=> b!534597 m!513789))

(declare-fun m!513791 () Bool)

(assert (=> b!534606 m!513791))

(assert (=> b!534606 m!513783))

(assert (=> b!534604 m!513783))

(assert (=> b!534604 m!513783))

(declare-fun m!513793 () Bool)

(assert (=> b!534604 m!513793))

(assert (=> b!534604 m!513793))

(assert (=> b!534604 m!513783))

(declare-fun m!513795 () Bool)

(assert (=> b!534604 m!513795))

(declare-fun m!513797 () Bool)

(assert (=> b!534602 m!513797))

(assert (=> b!534600 m!513783))

(assert (=> b!534600 m!513783))

(declare-fun m!513799 () Bool)

(assert (=> b!534600 m!513799))

(assert (=> b!534605 m!513783))

(assert (=> b!534605 m!513783))

(declare-fun m!513801 () Bool)

(assert (=> b!534605 m!513801))

(check-sat (not b!534601) (not b!534607) (not b!534604) (not b!534605) (not b!534597) (not b!534602) (not b!534600) (not b!534599) (not start!48666))
(check-sat)
