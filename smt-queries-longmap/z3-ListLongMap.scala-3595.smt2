; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49428 () Bool)

(assert start!49428)

(declare-fun b!544106 () Bool)

(declare-fun res!338517 () Bool)

(declare-fun e!314582 () Bool)

(assert (=> b!544106 (=> (not res!338517) (not e!314582))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544106 (= res!338517 (validKeyInArray!0 k0!1998))))

(declare-fun b!544107 () Bool)

(declare-fun res!338520 () Bool)

(declare-fun e!314583 () Bool)

(assert (=> b!544107 (=> (not res!338520) (not e!314583))))

(declare-datatypes ((array!34365 0))(
  ( (array!34366 (arr!16514 (Array (_ BitVec 32) (_ BitVec 64))) (size!16879 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34365)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34365 (_ BitVec 32)) Bool)

(assert (=> b!544107 (= res!338520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544108 () Bool)

(declare-fun res!338514 () Bool)

(assert (=> b!544108 (=> (not res!338514) (not e!314582))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544108 (= res!338514 (and (= (size!16879 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16879 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16879 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544109 () Bool)

(declare-fun res!338512 () Bool)

(assert (=> b!544109 (=> (not res!338512) (not e!314583))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544109 (= res!338512 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16879 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16879 a!3154)) (= (select (arr!16514 a!3154) resIndex!32) (select (arr!16514 a!3154) j!147))))))

(declare-fun b!544110 () Bool)

(declare-fun res!338522 () Bool)

(declare-fun e!314581 () Bool)

(assert (=> b!544110 (=> (not res!338522) (not e!314581))))

(declare-datatypes ((SeekEntryResult!4969 0))(
  ( (MissingZero!4969 (index!22100 (_ BitVec 32))) (Found!4969 (index!22101 (_ BitVec 32))) (Intermediate!4969 (undefined!5781 Bool) (index!22102 (_ BitVec 32)) (x!51026 (_ BitVec 32))) (Undefined!4969) (MissingVacant!4969 (index!22103 (_ BitVec 32))) )
))
(declare-fun lt!248241 () SeekEntryResult!4969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34365 (_ BitVec 32)) SeekEntryResult!4969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544110 (= res!338522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16514 a!3154) j!147) mask!3216) (select (arr!16514 a!3154) j!147) a!3154 mask!3216) lt!248241))))

(declare-fun b!544111 () Bool)

(declare-fun res!338516 () Bool)

(assert (=> b!544111 (=> (not res!338516) (not e!314581))))

(assert (=> b!544111 (= res!338516 (and (not (= (select (arr!16514 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16514 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16514 a!3154) index!1177) (select (arr!16514 a!3154) j!147)))))))

(declare-fun b!544112 () Bool)

(assert (=> b!544112 (= e!314582 e!314583)))

(declare-fun res!338518 () Bool)

(assert (=> b!544112 (=> (not res!338518) (not e!314583))))

(declare-fun lt!248242 () SeekEntryResult!4969)

(assert (=> b!544112 (= res!338518 (or (= lt!248242 (MissingZero!4969 i!1153)) (= lt!248242 (MissingVacant!4969 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34365 (_ BitVec 32)) SeekEntryResult!4969)

(assert (=> b!544112 (= lt!248242 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544113 () Bool)

(assert (=> b!544113 (= e!314581 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvslt (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000)))))

(declare-fun lt!248240 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544113 (= lt!248240 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544114 () Bool)

(assert (=> b!544114 (= e!314583 e!314581)))

(declare-fun res!338515 () Bool)

(assert (=> b!544114 (=> (not res!338515) (not e!314581))))

(assert (=> b!544114 (= res!338515 (= lt!248241 (Intermediate!4969 false resIndex!32 resX!32)))))

(assert (=> b!544114 (= lt!248241 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16514 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544115 () Bool)

(declare-fun res!338519 () Bool)

(assert (=> b!544115 (=> (not res!338519) (not e!314582))))

(declare-fun arrayContainsKey!0 (array!34365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544115 (= res!338519 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338521 () Bool)

(assert (=> start!49428 (=> (not res!338521) (not e!314582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49428 (= res!338521 (validMask!0 mask!3216))))

(assert (=> start!49428 e!314582))

(assert (=> start!49428 true))

(declare-fun array_inv!12397 (array!34365) Bool)

(assert (=> start!49428 (array_inv!12397 a!3154)))

(declare-fun b!544116 () Bool)

(declare-fun res!338511 () Bool)

(assert (=> b!544116 (=> (not res!338511) (not e!314583))))

(declare-datatypes ((List!10672 0))(
  ( (Nil!10669) (Cons!10668 (h!11626 (_ BitVec 64)) (t!16891 List!10672)) )
))
(declare-fun arrayNoDuplicates!0 (array!34365 (_ BitVec 32) List!10672) Bool)

(assert (=> b!544116 (= res!338511 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10669))))

(declare-fun b!544117 () Bool)

(declare-fun res!338513 () Bool)

(assert (=> b!544117 (=> (not res!338513) (not e!314582))))

(assert (=> b!544117 (= res!338513 (validKeyInArray!0 (select (arr!16514 a!3154) j!147)))))

(assert (= (and start!49428 res!338521) b!544108))

(assert (= (and b!544108 res!338514) b!544117))

(assert (= (and b!544117 res!338513) b!544106))

(assert (= (and b!544106 res!338517) b!544115))

(assert (= (and b!544115 res!338519) b!544112))

(assert (= (and b!544112 res!338518) b!544107))

(assert (= (and b!544107 res!338520) b!544116))

(assert (= (and b!544116 res!338511) b!544109))

(assert (= (and b!544109 res!338512) b!544114))

(assert (= (and b!544114 res!338515) b!544110))

(assert (= (and b!544110 res!338522) b!544111))

(assert (= (and b!544111 res!338516) b!544113))

(declare-fun m!521533 () Bool)

(assert (=> b!544114 m!521533))

(assert (=> b!544114 m!521533))

(declare-fun m!521535 () Bool)

(assert (=> b!544114 m!521535))

(declare-fun m!521537 () Bool)

(assert (=> b!544113 m!521537))

(declare-fun m!521539 () Bool)

(assert (=> start!49428 m!521539))

(declare-fun m!521541 () Bool)

(assert (=> start!49428 m!521541))

(declare-fun m!521543 () Bool)

(assert (=> b!544106 m!521543))

(declare-fun m!521545 () Bool)

(assert (=> b!544115 m!521545))

(declare-fun m!521547 () Bool)

(assert (=> b!544112 m!521547))

(declare-fun m!521549 () Bool)

(assert (=> b!544111 m!521549))

(assert (=> b!544111 m!521533))

(assert (=> b!544117 m!521533))

(assert (=> b!544117 m!521533))

(declare-fun m!521551 () Bool)

(assert (=> b!544117 m!521551))

(declare-fun m!521553 () Bool)

(assert (=> b!544109 m!521553))

(assert (=> b!544109 m!521533))

(declare-fun m!521555 () Bool)

(assert (=> b!544107 m!521555))

(declare-fun m!521557 () Bool)

(assert (=> b!544116 m!521557))

(assert (=> b!544110 m!521533))

(assert (=> b!544110 m!521533))

(declare-fun m!521559 () Bool)

(assert (=> b!544110 m!521559))

(assert (=> b!544110 m!521559))

(assert (=> b!544110 m!521533))

(declare-fun m!521561 () Bool)

(assert (=> b!544110 m!521561))

(check-sat (not start!49428) (not b!544115) (not b!544113) (not b!544116) (not b!544117) (not b!544112) (not b!544107) (not b!544106) (not b!544110) (not b!544114))
(check-sat)
