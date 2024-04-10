; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49306 () Bool)

(assert start!49306)

(declare-fun b!543006 () Bool)

(declare-fun res!337562 () Bool)

(declare-fun e!314156 () Bool)

(assert (=> b!543006 (=> (not res!337562) (not e!314156))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34314 0))(
  ( (array!34315 (arr!16490 (Array (_ BitVec 32) (_ BitVec 64))) (size!16854 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34314)

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!543006 (= res!337562 (and (not (= (select (arr!16490 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16490 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16490 a!3154) index!1177) (select (arr!16490 a!3154) j!147)))))))

(declare-fun b!543007 () Bool)

(declare-fun e!314154 () Bool)

(declare-fun e!314157 () Bool)

(assert (=> b!543007 (= e!314154 e!314157)))

(declare-fun res!337568 () Bool)

(assert (=> b!543007 (=> (not res!337568) (not e!314157))))

(declare-datatypes ((SeekEntryResult!4948 0))(
  ( (MissingZero!4948 (index!22016 (_ BitVec 32))) (Found!4948 (index!22017 (_ BitVec 32))) (Intermediate!4948 (undefined!5760 Bool) (index!22018 (_ BitVec 32)) (x!50923 (_ BitVec 32))) (Undefined!4948) (MissingVacant!4948 (index!22019 (_ BitVec 32))) )
))
(declare-fun lt!248065 () SeekEntryResult!4948)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543007 (= res!337568 (or (= lt!248065 (MissingZero!4948 i!1153)) (= lt!248065 (MissingVacant!4948 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34314 (_ BitVec 32)) SeekEntryResult!4948)

(assert (=> b!543007 (= lt!248065 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543008 () Bool)

(assert (=> b!543008 (= e!314156 false)))

(declare-fun lt!248064 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543008 (= lt!248064 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543009 () Bool)

(declare-fun res!337565 () Bool)

(assert (=> b!543009 (=> (not res!337565) (not e!314154))))

(declare-fun arrayContainsKey!0 (array!34314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543009 (= res!337565 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543010 () Bool)

(declare-fun res!337557 () Bool)

(assert (=> b!543010 (=> (not res!337557) (not e!314154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543010 (= res!337557 (validKeyInArray!0 (select (arr!16490 a!3154) j!147)))))

(declare-fun b!543011 () Bool)

(declare-fun res!337561 () Bool)

(assert (=> b!543011 (=> (not res!337561) (not e!314156))))

(declare-fun lt!248063 () SeekEntryResult!4948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34314 (_ BitVec 32)) SeekEntryResult!4948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543011 (= res!337561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16490 a!3154) j!147) mask!3216) (select (arr!16490 a!3154) j!147) a!3154 mask!3216) lt!248063))))

(declare-fun b!543012 () Bool)

(declare-fun res!337564 () Bool)

(assert (=> b!543012 (=> (not res!337564) (not e!314157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34314 (_ BitVec 32)) Bool)

(assert (=> b!543012 (= res!337564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543013 () Bool)

(declare-fun res!337558 () Bool)

(assert (=> b!543013 (=> (not res!337558) (not e!314157))))

(declare-datatypes ((List!10609 0))(
  ( (Nil!10606) (Cons!10605 (h!11560 (_ BitVec 64)) (t!16837 List!10609)) )
))
(declare-fun arrayNoDuplicates!0 (array!34314 (_ BitVec 32) List!10609) Bool)

(assert (=> b!543013 (= res!337558 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10606))))

(declare-fun b!543014 () Bool)

(declare-fun res!337559 () Bool)

(assert (=> b!543014 (=> (not res!337559) (not e!314154))))

(assert (=> b!543014 (= res!337559 (validKeyInArray!0 k!1998))))

(declare-fun b!543015 () Bool)

(assert (=> b!543015 (= e!314157 e!314156)))

(declare-fun res!337566 () Bool)

(assert (=> b!543015 (=> (not res!337566) (not e!314156))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!543015 (= res!337566 (= lt!248063 (Intermediate!4948 false resIndex!32 resX!32)))))

(assert (=> b!543015 (= lt!248063 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16490 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!337560 () Bool)

(assert (=> start!49306 (=> (not res!337560) (not e!314154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49306 (= res!337560 (validMask!0 mask!3216))))

(assert (=> start!49306 e!314154))

(assert (=> start!49306 true))

(declare-fun array_inv!12286 (array!34314) Bool)

(assert (=> start!49306 (array_inv!12286 a!3154)))

(declare-fun b!543016 () Bool)

(declare-fun res!337563 () Bool)

(assert (=> b!543016 (=> (not res!337563) (not e!314157))))

(assert (=> b!543016 (= res!337563 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16854 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16854 a!3154)) (= (select (arr!16490 a!3154) resIndex!32) (select (arr!16490 a!3154) j!147))))))

(declare-fun b!543017 () Bool)

(declare-fun res!337567 () Bool)

(assert (=> b!543017 (=> (not res!337567) (not e!314154))))

(assert (=> b!543017 (= res!337567 (and (= (size!16854 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16854 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16854 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49306 res!337560) b!543017))

(assert (= (and b!543017 res!337567) b!543010))

(assert (= (and b!543010 res!337557) b!543014))

(assert (= (and b!543014 res!337559) b!543009))

(assert (= (and b!543009 res!337565) b!543007))

(assert (= (and b!543007 res!337568) b!543012))

(assert (= (and b!543012 res!337564) b!543013))

(assert (= (and b!543013 res!337558) b!543016))

(assert (= (and b!543016 res!337563) b!543015))

(assert (= (and b!543015 res!337566) b!543011))

(assert (= (and b!543011 res!337561) b!543006))

(assert (= (and b!543006 res!337562) b!543008))

(declare-fun m!521169 () Bool)

(assert (=> start!49306 m!521169))

(declare-fun m!521171 () Bool)

(assert (=> start!49306 m!521171))

(declare-fun m!521173 () Bool)

(assert (=> b!543015 m!521173))

(assert (=> b!543015 m!521173))

(declare-fun m!521175 () Bool)

(assert (=> b!543015 m!521175))

(assert (=> b!543011 m!521173))

(assert (=> b!543011 m!521173))

(declare-fun m!521177 () Bool)

(assert (=> b!543011 m!521177))

(assert (=> b!543011 m!521177))

(assert (=> b!543011 m!521173))

(declare-fun m!521179 () Bool)

(assert (=> b!543011 m!521179))

(declare-fun m!521181 () Bool)

(assert (=> b!543008 m!521181))

(declare-fun m!521183 () Bool)

(assert (=> b!543014 m!521183))

(declare-fun m!521185 () Bool)

(assert (=> b!543013 m!521185))

(declare-fun m!521187 () Bool)

(assert (=> b!543007 m!521187))

(declare-fun m!521189 () Bool)

(assert (=> b!543016 m!521189))

(assert (=> b!543016 m!521173))

(declare-fun m!521191 () Bool)

(assert (=> b!543012 m!521191))

(declare-fun m!521193 () Bool)

(assert (=> b!543009 m!521193))

(declare-fun m!521195 () Bool)

(assert (=> b!543006 m!521195))

(assert (=> b!543006 m!521173))

(assert (=> b!543010 m!521173))

(assert (=> b!543010 m!521173))

(declare-fun m!521197 () Bool)

(assert (=> b!543010 m!521197))

(push 1)

(assert (not b!543011))

(assert (not start!49306))

(assert (not b!543009))

(assert (not b!543015))

(assert (not b!543014))

(assert (not b!543007))

(assert (not b!543013))

(assert (not b!543008))

(assert (not b!543010))

