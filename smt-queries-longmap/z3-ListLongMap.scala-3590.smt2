; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49372 () Bool)

(assert start!49372)

(declare-fun b!543566 () Bool)

(declare-fun res!338014 () Bool)

(declare-fun e!314405 () Bool)

(assert (=> b!543566 (=> (not res!338014) (not e!314405))))

(declare-datatypes ((array!34328 0))(
  ( (array!34329 (arr!16495 (Array (_ BitVec 32) (_ BitVec 64))) (size!16859 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34328)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543566 (= res!338014 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543567 () Bool)

(declare-fun res!338016 () Bool)

(assert (=> b!543567 (=> (not res!338016) (not e!314405))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543567 (= res!338016 (validKeyInArray!0 (select (arr!16495 a!3154) j!147)))))

(declare-fun b!543568 () Bool)

(declare-fun e!314403 () Bool)

(declare-fun e!314406 () Bool)

(assert (=> b!543568 (= e!314403 e!314406)))

(declare-fun res!338023 () Bool)

(assert (=> b!543568 (=> (not res!338023) (not e!314406))))

(declare-datatypes ((SeekEntryResult!4909 0))(
  ( (MissingZero!4909 (index!21860 (_ BitVec 32))) (Found!4909 (index!21861 (_ BitVec 32))) (Intermediate!4909 (undefined!5721 Bool) (index!21862 (_ BitVec 32)) (x!50919 (_ BitVec 32))) (Undefined!4909) (MissingVacant!4909 (index!21863 (_ BitVec 32))) )
))
(declare-fun lt!248263 () SeekEntryResult!4909)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543568 (= res!338023 (= lt!248263 (Intermediate!4909 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34328 (_ BitVec 32)) SeekEntryResult!4909)

(assert (=> b!543568 (= lt!248263 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16495 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543569 () Bool)

(assert (=> b!543569 (= e!314405 e!314403)))

(declare-fun res!338017 () Bool)

(assert (=> b!543569 (=> (not res!338017) (not e!314403))))

(declare-fun lt!248262 () SeekEntryResult!4909)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543569 (= res!338017 (or (= lt!248262 (MissingZero!4909 i!1153)) (= lt!248262 (MissingVacant!4909 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34328 (_ BitVec 32)) SeekEntryResult!4909)

(assert (=> b!543569 (= lt!248262 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543570 () Bool)

(declare-fun res!338020 () Bool)

(assert (=> b!543570 (=> (not res!338020) (not e!314405))))

(assert (=> b!543570 (= res!338020 (and (= (size!16859 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16859 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16859 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543571 () Bool)

(declare-fun res!338019 () Bool)

(assert (=> b!543571 (=> (not res!338019) (not e!314406))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543571 (= res!338019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16495 a!3154) j!147) mask!3216) (select (arr!16495 a!3154) j!147) a!3154 mask!3216) lt!248263))))

(declare-fun b!543572 () Bool)

(declare-fun res!338013 () Bool)

(assert (=> b!543572 (=> (not res!338013) (not e!314403))))

(declare-datatypes ((List!10521 0))(
  ( (Nil!10518) (Cons!10517 (h!11475 (_ BitVec 64)) (t!16741 List!10521)) )
))
(declare-fun arrayNoDuplicates!0 (array!34328 (_ BitVec 32) List!10521) Bool)

(assert (=> b!543572 (= res!338013 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10518))))

(declare-fun res!338022 () Bool)

(assert (=> start!49372 (=> (not res!338022) (not e!314405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49372 (= res!338022 (validMask!0 mask!3216))))

(assert (=> start!49372 e!314405))

(assert (=> start!49372 true))

(declare-fun array_inv!12354 (array!34328) Bool)

(assert (=> start!49372 (array_inv!12354 a!3154)))

(declare-fun b!543573 () Bool)

(declare-fun res!338018 () Bool)

(assert (=> b!543573 (=> (not res!338018) (not e!314405))))

(assert (=> b!543573 (= res!338018 (validKeyInArray!0 k0!1998))))

(declare-fun b!543574 () Bool)

(assert (=> b!543574 (= e!314406 false)))

(declare-fun lt!248261 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543574 (= lt!248261 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543575 () Bool)

(declare-fun res!338015 () Bool)

(assert (=> b!543575 (=> (not res!338015) (not e!314406))))

(assert (=> b!543575 (= res!338015 (and (not (= (select (arr!16495 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16495 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16495 a!3154) index!1177) (select (arr!16495 a!3154) j!147)))))))

(declare-fun b!543576 () Bool)

(declare-fun res!338021 () Bool)

(assert (=> b!543576 (=> (not res!338021) (not e!314403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34328 (_ BitVec 32)) Bool)

(assert (=> b!543576 (= res!338021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543577 () Bool)

(declare-fun res!338012 () Bool)

(assert (=> b!543577 (=> (not res!338012) (not e!314403))))

(assert (=> b!543577 (= res!338012 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16859 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16859 a!3154)) (= (select (arr!16495 a!3154) resIndex!32) (select (arr!16495 a!3154) j!147))))))

(assert (= (and start!49372 res!338022) b!543570))

(assert (= (and b!543570 res!338020) b!543567))

(assert (= (and b!543567 res!338016) b!543573))

(assert (= (and b!543573 res!338018) b!543566))

(assert (= (and b!543566 res!338014) b!543569))

(assert (= (and b!543569 res!338017) b!543576))

(assert (= (and b!543576 res!338021) b!543572))

(assert (= (and b!543572 res!338013) b!543577))

(assert (= (and b!543577 res!338012) b!543568))

(assert (= (and b!543568 res!338023) b!543571))

(assert (= (and b!543571 res!338019) b!543575))

(assert (= (and b!543575 res!338015) b!543574))

(declare-fun m!521791 () Bool)

(assert (=> b!543576 m!521791))

(declare-fun m!521793 () Bool)

(assert (=> b!543567 m!521793))

(assert (=> b!543567 m!521793))

(declare-fun m!521795 () Bool)

(assert (=> b!543567 m!521795))

(declare-fun m!521797 () Bool)

(assert (=> b!543572 m!521797))

(assert (=> b!543568 m!521793))

(assert (=> b!543568 m!521793))

(declare-fun m!521799 () Bool)

(assert (=> b!543568 m!521799))

(declare-fun m!521801 () Bool)

(assert (=> b!543569 m!521801))

(declare-fun m!521803 () Bool)

(assert (=> b!543577 m!521803))

(assert (=> b!543577 m!521793))

(declare-fun m!521805 () Bool)

(assert (=> start!49372 m!521805))

(declare-fun m!521807 () Bool)

(assert (=> start!49372 m!521807))

(declare-fun m!521809 () Bool)

(assert (=> b!543566 m!521809))

(declare-fun m!521811 () Bool)

(assert (=> b!543574 m!521811))

(declare-fun m!521813 () Bool)

(assert (=> b!543573 m!521813))

(assert (=> b!543571 m!521793))

(assert (=> b!543571 m!521793))

(declare-fun m!521815 () Bool)

(assert (=> b!543571 m!521815))

(assert (=> b!543571 m!521815))

(assert (=> b!543571 m!521793))

(declare-fun m!521817 () Bool)

(assert (=> b!543571 m!521817))

(declare-fun m!521819 () Bool)

(assert (=> b!543575 m!521819))

(assert (=> b!543575 m!521793))

(check-sat (not b!543573) (not b!543576) (not start!49372) (not b!543569) (not b!543566) (not b!543567) (not b!543572) (not b!543571) (not b!543574) (not b!543568))
(check-sat)
