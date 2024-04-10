; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49282 () Bool)

(assert start!49282)

(declare-fun b!542574 () Bool)

(declare-fun res!337131 () Bool)

(declare-fun e!314010 () Bool)

(assert (=> b!542574 (=> (not res!337131) (not e!314010))))

(declare-datatypes ((array!34290 0))(
  ( (array!34291 (arr!16478 (Array (_ BitVec 32) (_ BitVec 64))) (size!16842 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34290)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542574 (= res!337131 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542575 () Bool)

(declare-fun res!337136 () Bool)

(declare-fun e!314012 () Bool)

(assert (=> b!542575 (=> (not res!337136) (not e!314012))))

(declare-datatypes ((List!10597 0))(
  ( (Nil!10594) (Cons!10593 (h!11548 (_ BitVec 64)) (t!16825 List!10597)) )
))
(declare-fun arrayNoDuplicates!0 (array!34290 (_ BitVec 32) List!10597) Bool)

(assert (=> b!542575 (= res!337136 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10594))))

(declare-fun res!337133 () Bool)

(assert (=> start!49282 (=> (not res!337133) (not e!314010))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49282 (= res!337133 (validMask!0 mask!3216))))

(assert (=> start!49282 e!314010))

(assert (=> start!49282 true))

(declare-fun array_inv!12274 (array!34290) Bool)

(assert (=> start!49282 (array_inv!12274 a!3154)))

(declare-fun b!542576 () Bool)

(declare-fun res!337127 () Bool)

(assert (=> b!542576 (=> (not res!337127) (not e!314012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34290 (_ BitVec 32)) Bool)

(assert (=> b!542576 (= res!337127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542577 () Bool)

(declare-fun res!337125 () Bool)

(declare-fun e!314013 () Bool)

(assert (=> b!542577 (=> (not res!337125) (not e!314013))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!542577 (= res!337125 (and (not (= (select (arr!16478 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16478 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16478 a!3154) index!1177) (select (arr!16478 a!3154) j!147)))))))

(declare-fun b!542578 () Bool)

(assert (=> b!542578 (= e!314010 e!314012)))

(declare-fun res!337130 () Bool)

(assert (=> b!542578 (=> (not res!337130) (not e!314012))))

(declare-datatypes ((SeekEntryResult!4936 0))(
  ( (MissingZero!4936 (index!21968 (_ BitVec 32))) (Found!4936 (index!21969 (_ BitVec 32))) (Intermediate!4936 (undefined!5748 Bool) (index!21970 (_ BitVec 32)) (x!50879 (_ BitVec 32))) (Undefined!4936) (MissingVacant!4936 (index!21971 (_ BitVec 32))) )
))
(declare-fun lt!247955 () SeekEntryResult!4936)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542578 (= res!337130 (or (= lt!247955 (MissingZero!4936 i!1153)) (= lt!247955 (MissingVacant!4936 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34290 (_ BitVec 32)) SeekEntryResult!4936)

(assert (=> b!542578 (= lt!247955 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542579 () Bool)

(assert (=> b!542579 (= e!314013 false)))

(declare-fun lt!247956 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542579 (= lt!247956 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542580 () Bool)

(declare-fun res!337128 () Bool)

(assert (=> b!542580 (=> (not res!337128) (not e!314012))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542580 (= res!337128 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16842 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16842 a!3154)) (= (select (arr!16478 a!3154) resIndex!32) (select (arr!16478 a!3154) j!147))))))

(declare-fun b!542581 () Bool)

(declare-fun res!337134 () Bool)

(assert (=> b!542581 (=> (not res!337134) (not e!314010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542581 (= res!337134 (validKeyInArray!0 (select (arr!16478 a!3154) j!147)))))

(declare-fun b!542582 () Bool)

(assert (=> b!542582 (= e!314012 e!314013)))

(declare-fun res!337126 () Bool)

(assert (=> b!542582 (=> (not res!337126) (not e!314013))))

(declare-fun lt!247957 () SeekEntryResult!4936)

(assert (=> b!542582 (= res!337126 (= lt!247957 (Intermediate!4936 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34290 (_ BitVec 32)) SeekEntryResult!4936)

(assert (=> b!542582 (= lt!247957 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16478 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542583 () Bool)

(declare-fun res!337129 () Bool)

(assert (=> b!542583 (=> (not res!337129) (not e!314010))))

(assert (=> b!542583 (= res!337129 (and (= (size!16842 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16842 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16842 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542584 () Bool)

(declare-fun res!337135 () Bool)

(assert (=> b!542584 (=> (not res!337135) (not e!314010))))

(assert (=> b!542584 (= res!337135 (validKeyInArray!0 k!1998))))

(declare-fun b!542585 () Bool)

(declare-fun res!337132 () Bool)

(assert (=> b!542585 (=> (not res!337132) (not e!314013))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542585 (= res!337132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16478 a!3154) j!147) mask!3216) (select (arr!16478 a!3154) j!147) a!3154 mask!3216) lt!247957))))

(assert (= (and start!49282 res!337133) b!542583))

(assert (= (and b!542583 res!337129) b!542581))

(assert (= (and b!542581 res!337134) b!542584))

(assert (= (and b!542584 res!337135) b!542574))

(assert (= (and b!542574 res!337131) b!542578))

(assert (= (and b!542578 res!337130) b!542576))

(assert (= (and b!542576 res!337127) b!542575))

(assert (= (and b!542575 res!337136) b!542580))

(assert (= (and b!542580 res!337128) b!542582))

(assert (= (and b!542582 res!337126) b!542585))

(assert (= (and b!542585 res!337132) b!542577))

(assert (= (and b!542577 res!337125) b!542579))

(declare-fun m!520809 () Bool)

(assert (=> start!49282 m!520809))

(declare-fun m!520811 () Bool)

(assert (=> start!49282 m!520811))

(declare-fun m!520813 () Bool)

(assert (=> b!542578 m!520813))

(declare-fun m!520815 () Bool)

(assert (=> b!542580 m!520815))

(declare-fun m!520817 () Bool)

(assert (=> b!542580 m!520817))

(declare-fun m!520819 () Bool)

(assert (=> b!542579 m!520819))

(declare-fun m!520821 () Bool)

(assert (=> b!542584 m!520821))

(assert (=> b!542582 m!520817))

(assert (=> b!542582 m!520817))

(declare-fun m!520823 () Bool)

(assert (=> b!542582 m!520823))

(declare-fun m!520825 () Bool)

(assert (=> b!542576 m!520825))

(assert (=> b!542585 m!520817))

(assert (=> b!542585 m!520817))

(declare-fun m!520827 () Bool)

(assert (=> b!542585 m!520827))

(assert (=> b!542585 m!520827))

(assert (=> b!542585 m!520817))

(declare-fun m!520829 () Bool)

(assert (=> b!542585 m!520829))

(assert (=> b!542581 m!520817))

(assert (=> b!542581 m!520817))

(declare-fun m!520831 () Bool)

(assert (=> b!542581 m!520831))

(declare-fun m!520833 () Bool)

(assert (=> b!542575 m!520833))

(declare-fun m!520835 () Bool)

(assert (=> b!542574 m!520835))

(declare-fun m!520837 () Bool)

(assert (=> b!542577 m!520837))

(assert (=> b!542577 m!520817))

(push 1)

(assert (not b!542578))

(assert (not b!542582))

(assert (not b!542585))

(assert (not b!542584))

(assert (not start!49282))

(assert (not b!542576))

