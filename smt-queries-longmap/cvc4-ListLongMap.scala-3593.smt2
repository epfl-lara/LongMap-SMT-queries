; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49348 () Bool)

(assert start!49348)

(declare-fun b!543762 () Bool)

(declare-fun e!314407 () Bool)

(assert (=> b!543762 (= e!314407 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248253 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543762 (= lt!248253 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543763 () Bool)

(declare-fun res!338323 () Bool)

(assert (=> b!543763 (=> (not res!338323) (not e!314407))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34356 0))(
  ( (array!34357 (arr!16511 (Array (_ BitVec 32) (_ BitVec 64))) (size!16875 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34356)

(declare-datatypes ((SeekEntryResult!4969 0))(
  ( (MissingZero!4969 (index!22100 (_ BitVec 32))) (Found!4969 (index!22101 (_ BitVec 32))) (Intermediate!4969 (undefined!5781 Bool) (index!22102 (_ BitVec 32)) (x!51000 (_ BitVec 32))) (Undefined!4969) (MissingVacant!4969 (index!22103 (_ BitVec 32))) )
))
(declare-fun lt!248254 () SeekEntryResult!4969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34356 (_ BitVec 32)) SeekEntryResult!4969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543763 (= res!338323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16511 a!3154) j!147) mask!3216) (select (arr!16511 a!3154) j!147) a!3154 mask!3216) lt!248254))))

(declare-fun b!543764 () Bool)

(declare-fun res!338314 () Bool)

(declare-fun e!314409 () Bool)

(assert (=> b!543764 (=> (not res!338314) (not e!314409))))

(declare-datatypes ((List!10630 0))(
  ( (Nil!10627) (Cons!10626 (h!11581 (_ BitVec 64)) (t!16858 List!10630)) )
))
(declare-fun arrayNoDuplicates!0 (array!34356 (_ BitVec 32) List!10630) Bool)

(assert (=> b!543764 (= res!338314 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10627))))

(declare-fun b!543765 () Bool)

(declare-fun res!338318 () Bool)

(assert (=> b!543765 (=> (not res!338318) (not e!314409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34356 (_ BitVec 32)) Bool)

(assert (=> b!543765 (= res!338318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543766 () Bool)

(declare-fun res!338313 () Bool)

(assert (=> b!543766 (=> (not res!338313) (not e!314407))))

(assert (=> b!543766 (= res!338313 (and (not (= (select (arr!16511 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16511 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16511 a!3154) index!1177) (select (arr!16511 a!3154) j!147)))))))

(declare-fun b!543767 () Bool)

(declare-fun res!338315 () Bool)

(declare-fun e!314406 () Bool)

(assert (=> b!543767 (=> (not res!338315) (not e!314406))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543767 (= res!338315 (validKeyInArray!0 k!1998))))

(declare-fun b!543768 () Bool)

(assert (=> b!543768 (= e!314406 e!314409)))

(declare-fun res!338319 () Bool)

(assert (=> b!543768 (=> (not res!338319) (not e!314409))))

(declare-fun lt!248252 () SeekEntryResult!4969)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543768 (= res!338319 (or (= lt!248252 (MissingZero!4969 i!1153)) (= lt!248252 (MissingVacant!4969 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34356 (_ BitVec 32)) SeekEntryResult!4969)

(assert (=> b!543768 (= lt!248252 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543770 () Bool)

(assert (=> b!543770 (= e!314409 e!314407)))

(declare-fun res!338320 () Bool)

(assert (=> b!543770 (=> (not res!338320) (not e!314407))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543770 (= res!338320 (= lt!248254 (Intermediate!4969 false resIndex!32 resX!32)))))

(assert (=> b!543770 (= lt!248254 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16511 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543771 () Bool)

(declare-fun res!338316 () Bool)

(assert (=> b!543771 (=> (not res!338316) (not e!314406))))

(assert (=> b!543771 (= res!338316 (validKeyInArray!0 (select (arr!16511 a!3154) j!147)))))

(declare-fun b!543772 () Bool)

(declare-fun res!338321 () Bool)

(assert (=> b!543772 (=> (not res!338321) (not e!314406))))

(declare-fun arrayContainsKey!0 (array!34356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543772 (= res!338321 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543773 () Bool)

(declare-fun res!338317 () Bool)

(assert (=> b!543773 (=> (not res!338317) (not e!314409))))

(assert (=> b!543773 (= res!338317 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16875 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16875 a!3154)) (= (select (arr!16511 a!3154) resIndex!32) (select (arr!16511 a!3154) j!147))))))

(declare-fun res!338322 () Bool)

(assert (=> start!49348 (=> (not res!338322) (not e!314406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49348 (= res!338322 (validMask!0 mask!3216))))

(assert (=> start!49348 e!314406))

(assert (=> start!49348 true))

(declare-fun array_inv!12307 (array!34356) Bool)

(assert (=> start!49348 (array_inv!12307 a!3154)))

(declare-fun b!543769 () Bool)

(declare-fun res!338324 () Bool)

(assert (=> b!543769 (=> (not res!338324) (not e!314406))))

(assert (=> b!543769 (= res!338324 (and (= (size!16875 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16875 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16875 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49348 res!338322) b!543769))

(assert (= (and b!543769 res!338324) b!543771))

(assert (= (and b!543771 res!338316) b!543767))

(assert (= (and b!543767 res!338315) b!543772))

(assert (= (and b!543772 res!338321) b!543768))

(assert (= (and b!543768 res!338319) b!543765))

(assert (= (and b!543765 res!338318) b!543764))

(assert (= (and b!543764 res!338314) b!543773))

(assert (= (and b!543773 res!338317) b!543770))

(assert (= (and b!543770 res!338320) b!543763))

(assert (= (and b!543763 res!338323) b!543766))

(assert (= (and b!543766 res!338313) b!543762))

(declare-fun m!521799 () Bool)

(assert (=> b!543768 m!521799))

(declare-fun m!521801 () Bool)

(assert (=> b!543773 m!521801))

(declare-fun m!521803 () Bool)

(assert (=> b!543773 m!521803))

(declare-fun m!521805 () Bool)

(assert (=> b!543766 m!521805))

(assert (=> b!543766 m!521803))

(declare-fun m!521807 () Bool)

(assert (=> start!49348 m!521807))

(declare-fun m!521809 () Bool)

(assert (=> start!49348 m!521809))

(assert (=> b!543763 m!521803))

(assert (=> b!543763 m!521803))

(declare-fun m!521811 () Bool)

(assert (=> b!543763 m!521811))

(assert (=> b!543763 m!521811))

(assert (=> b!543763 m!521803))

(declare-fun m!521813 () Bool)

(assert (=> b!543763 m!521813))

(declare-fun m!521815 () Bool)

(assert (=> b!543772 m!521815))

(declare-fun m!521817 () Bool)

(assert (=> b!543764 m!521817))

(declare-fun m!521819 () Bool)

(assert (=> b!543767 m!521819))

(assert (=> b!543771 m!521803))

(assert (=> b!543771 m!521803))

(declare-fun m!521821 () Bool)

(assert (=> b!543771 m!521821))

(declare-fun m!521823 () Bool)

(assert (=> b!543762 m!521823))

(declare-fun m!521825 () Bool)

(assert (=> b!543765 m!521825))

(assert (=> b!543770 m!521803))

(assert (=> b!543770 m!521803))

(declare-fun m!521827 () Bool)

(assert (=> b!543770 m!521827))

(push 1)

(assert (not b!543770))

(assert (not start!49348))

(assert (not b!543772))

(assert (not b!543768))

(assert (not b!543771))

(assert (not b!543767))

(assert (not b!543764))

