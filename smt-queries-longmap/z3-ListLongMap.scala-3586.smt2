; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49348 () Bool)

(assert start!49348)

(declare-fun b!543134 () Bool)

(declare-fun e!314259 () Bool)

(assert (=> b!543134 (= e!314259 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248154 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543134 (= lt!248154 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543135 () Bool)

(declare-fun e!314262 () Bool)

(declare-fun e!314260 () Bool)

(assert (=> b!543135 (= e!314262 e!314260)))

(declare-fun res!337590 () Bool)

(assert (=> b!543135 (=> (not res!337590) (not e!314260))))

(declare-datatypes ((SeekEntryResult!4897 0))(
  ( (MissingZero!4897 (index!21812 (_ BitVec 32))) (Found!4897 (index!21813 (_ BitVec 32))) (Intermediate!4897 (undefined!5709 Bool) (index!21814 (_ BitVec 32)) (x!50875 (_ BitVec 32))) (Undefined!4897) (MissingVacant!4897 (index!21815 (_ BitVec 32))) )
))
(declare-fun lt!248153 () SeekEntryResult!4897)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543135 (= res!337590 (or (= lt!248153 (MissingZero!4897 i!1153)) (= lt!248153 (MissingVacant!4897 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34304 0))(
  ( (array!34305 (arr!16483 (Array (_ BitVec 32) (_ BitVec 64))) (size!16847 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34304)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34304 (_ BitVec 32)) SeekEntryResult!4897)

(assert (=> b!543135 (= lt!248153 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!337588 () Bool)

(assert (=> start!49348 (=> (not res!337588) (not e!314262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49348 (= res!337588 (validMask!0 mask!3216))))

(assert (=> start!49348 e!314262))

(assert (=> start!49348 true))

(declare-fun array_inv!12342 (array!34304) Bool)

(assert (=> start!49348 (array_inv!12342 a!3154)))

(declare-fun b!543136 () Bool)

(declare-fun res!337591 () Bool)

(assert (=> b!543136 (=> (not res!337591) (not e!314259))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!543136 (= res!337591 (and (not (= (select (arr!16483 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16483 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16483 a!3154) index!1177) (select (arr!16483 a!3154) j!147)))))))

(declare-fun b!543137 () Bool)

(declare-fun res!337583 () Bool)

(assert (=> b!543137 (=> (not res!337583) (not e!314260))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543137 (= res!337583 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16847 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16847 a!3154)) (= (select (arr!16483 a!3154) resIndex!32) (select (arr!16483 a!3154) j!147))))))

(declare-fun b!543138 () Bool)

(declare-fun res!337582 () Bool)

(assert (=> b!543138 (=> (not res!337582) (not e!314262))))

(assert (=> b!543138 (= res!337582 (and (= (size!16847 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16847 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16847 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543139 () Bool)

(declare-fun res!337589 () Bool)

(assert (=> b!543139 (=> (not res!337589) (not e!314260))))

(declare-datatypes ((List!10509 0))(
  ( (Nil!10506) (Cons!10505 (h!11463 (_ BitVec 64)) (t!16729 List!10509)) )
))
(declare-fun arrayNoDuplicates!0 (array!34304 (_ BitVec 32) List!10509) Bool)

(assert (=> b!543139 (= res!337589 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10506))))

(declare-fun b!543140 () Bool)

(assert (=> b!543140 (= e!314260 e!314259)))

(declare-fun res!337586 () Bool)

(assert (=> b!543140 (=> (not res!337586) (not e!314259))))

(declare-fun lt!248155 () SeekEntryResult!4897)

(assert (=> b!543140 (= res!337586 (= lt!248155 (Intermediate!4897 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34304 (_ BitVec 32)) SeekEntryResult!4897)

(assert (=> b!543140 (= lt!248155 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16483 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543141 () Bool)

(declare-fun res!337585 () Bool)

(assert (=> b!543141 (=> (not res!337585) (not e!314262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543141 (= res!337585 (validKeyInArray!0 (select (arr!16483 a!3154) j!147)))))

(declare-fun b!543142 () Bool)

(declare-fun res!337581 () Bool)

(assert (=> b!543142 (=> (not res!337581) (not e!314262))))

(assert (=> b!543142 (= res!337581 (validKeyInArray!0 k0!1998))))

(declare-fun b!543143 () Bool)

(declare-fun res!337584 () Bool)

(assert (=> b!543143 (=> (not res!337584) (not e!314259))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543143 (= res!337584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16483 a!3154) j!147) mask!3216) (select (arr!16483 a!3154) j!147) a!3154 mask!3216) lt!248155))))

(declare-fun b!543144 () Bool)

(declare-fun res!337587 () Bool)

(assert (=> b!543144 (=> (not res!337587) (not e!314260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34304 (_ BitVec 32)) Bool)

(assert (=> b!543144 (= res!337587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543145 () Bool)

(declare-fun res!337580 () Bool)

(assert (=> b!543145 (=> (not res!337580) (not e!314262))))

(declare-fun arrayContainsKey!0 (array!34304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543145 (= res!337580 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49348 res!337588) b!543138))

(assert (= (and b!543138 res!337582) b!543141))

(assert (= (and b!543141 res!337585) b!543142))

(assert (= (and b!543142 res!337581) b!543145))

(assert (= (and b!543145 res!337580) b!543135))

(assert (= (and b!543135 res!337590) b!543144))

(assert (= (and b!543144 res!337587) b!543139))

(assert (= (and b!543139 res!337589) b!543137))

(assert (= (and b!543137 res!337583) b!543140))

(assert (= (and b!543140 res!337586) b!543143))

(assert (= (and b!543143 res!337584) b!543136))

(assert (= (and b!543136 res!337591) b!543134))

(declare-fun m!521431 () Bool)

(assert (=> b!543143 m!521431))

(assert (=> b!543143 m!521431))

(declare-fun m!521433 () Bool)

(assert (=> b!543143 m!521433))

(assert (=> b!543143 m!521433))

(assert (=> b!543143 m!521431))

(declare-fun m!521435 () Bool)

(assert (=> b!543143 m!521435))

(declare-fun m!521437 () Bool)

(assert (=> start!49348 m!521437))

(declare-fun m!521439 () Bool)

(assert (=> start!49348 m!521439))

(declare-fun m!521441 () Bool)

(assert (=> b!543139 m!521441))

(declare-fun m!521443 () Bool)

(assert (=> b!543134 m!521443))

(declare-fun m!521445 () Bool)

(assert (=> b!543136 m!521445))

(assert (=> b!543136 m!521431))

(declare-fun m!521447 () Bool)

(assert (=> b!543142 m!521447))

(assert (=> b!543140 m!521431))

(assert (=> b!543140 m!521431))

(declare-fun m!521449 () Bool)

(assert (=> b!543140 m!521449))

(declare-fun m!521451 () Bool)

(assert (=> b!543144 m!521451))

(declare-fun m!521453 () Bool)

(assert (=> b!543145 m!521453))

(assert (=> b!543141 m!521431))

(assert (=> b!543141 m!521431))

(declare-fun m!521455 () Bool)

(assert (=> b!543141 m!521455))

(declare-fun m!521457 () Bool)

(assert (=> b!543137 m!521457))

(assert (=> b!543137 m!521431))

(declare-fun m!521459 () Bool)

(assert (=> b!543135 m!521459))

(check-sat (not b!543135) (not b!543140) (not b!543139) (not b!543144) (not b!543134) (not b!543145) (not b!543143) (not b!543142) (not start!49348) (not b!543141))
(check-sat)
