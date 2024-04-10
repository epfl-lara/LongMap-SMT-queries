; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49312 () Bool)

(assert start!49312)

(declare-fun b!543114 () Bool)

(declare-fun e!314190 () Bool)

(declare-fun e!314191 () Bool)

(assert (=> b!543114 (= e!314190 e!314191)))

(declare-fun res!337671 () Bool)

(assert (=> b!543114 (=> (not res!337671) (not e!314191))))

(declare-datatypes ((SeekEntryResult!4951 0))(
  ( (MissingZero!4951 (index!22028 (_ BitVec 32))) (Found!4951 (index!22029 (_ BitVec 32))) (Intermediate!4951 (undefined!5763 Bool) (index!22030 (_ BitVec 32)) (x!50934 (_ BitVec 32))) (Undefined!4951) (MissingVacant!4951 (index!22031 (_ BitVec 32))) )
))
(declare-fun lt!248091 () SeekEntryResult!4951)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543114 (= res!337671 (or (= lt!248091 (MissingZero!4951 i!1153)) (= lt!248091 (MissingVacant!4951 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34320 0))(
  ( (array!34321 (arr!16493 (Array (_ BitVec 32) (_ BitVec 64))) (size!16857 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34320)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34320 (_ BitVec 32)) SeekEntryResult!4951)

(assert (=> b!543114 (= lt!248091 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543115 () Bool)

(declare-fun res!337669 () Bool)

(assert (=> b!543115 (=> (not res!337669) (not e!314190))))

(declare-fun arrayContainsKey!0 (array!34320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543115 (= res!337669 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543116 () Bool)

(declare-fun res!337666 () Bool)

(assert (=> b!543116 (=> (not res!337666) (not e!314191))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543116 (= res!337666 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16857 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16857 a!3154)) (= (select (arr!16493 a!3154) resIndex!32) (select (arr!16493 a!3154) j!147))))))

(declare-fun b!543117 () Bool)

(declare-fun res!337672 () Bool)

(assert (=> b!543117 (=> (not res!337672) (not e!314190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543117 (= res!337672 (validKeyInArray!0 k!1998))))

(declare-fun b!543118 () Bool)

(declare-fun res!337667 () Bool)

(assert (=> b!543118 (=> (not res!337667) (not e!314190))))

(assert (=> b!543118 (= res!337667 (and (= (size!16857 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16857 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16857 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543119 () Bool)

(declare-fun res!337675 () Bool)

(declare-fun e!314192 () Bool)

(assert (=> b!543119 (=> (not res!337675) (not e!314192))))

(declare-fun lt!248090 () SeekEntryResult!4951)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34320 (_ BitVec 32)) SeekEntryResult!4951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543119 (= res!337675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16493 a!3154) j!147) mask!3216) (select (arr!16493 a!3154) j!147) a!3154 mask!3216) lt!248090))))

(declare-fun b!543120 () Bool)

(declare-fun res!337673 () Bool)

(assert (=> b!543120 (=> (not res!337673) (not e!314192))))

(assert (=> b!543120 (= res!337673 (and (not (= (select (arr!16493 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16493 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16493 a!3154) index!1177) (select (arr!16493 a!3154) j!147)))))))

(declare-fun b!543121 () Bool)

(assert (=> b!543121 (= e!314192 false)))

(declare-fun lt!248092 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543121 (= lt!248092 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!337674 () Bool)

(assert (=> start!49312 (=> (not res!337674) (not e!314190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49312 (= res!337674 (validMask!0 mask!3216))))

(assert (=> start!49312 e!314190))

(assert (=> start!49312 true))

(declare-fun array_inv!12289 (array!34320) Bool)

(assert (=> start!49312 (array_inv!12289 a!3154)))

(declare-fun b!543122 () Bool)

(declare-fun res!337670 () Bool)

(assert (=> b!543122 (=> (not res!337670) (not e!314191))))

(declare-datatypes ((List!10612 0))(
  ( (Nil!10609) (Cons!10608 (h!11563 (_ BitVec 64)) (t!16840 List!10612)) )
))
(declare-fun arrayNoDuplicates!0 (array!34320 (_ BitVec 32) List!10612) Bool)

(assert (=> b!543122 (= res!337670 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10609))))

(declare-fun b!543123 () Bool)

(declare-fun res!337676 () Bool)

(assert (=> b!543123 (=> (not res!337676) (not e!314191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34320 (_ BitVec 32)) Bool)

(assert (=> b!543123 (= res!337676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543124 () Bool)

(assert (=> b!543124 (= e!314191 e!314192)))

(declare-fun res!337665 () Bool)

(assert (=> b!543124 (=> (not res!337665) (not e!314192))))

(assert (=> b!543124 (= res!337665 (= lt!248090 (Intermediate!4951 false resIndex!32 resX!32)))))

(assert (=> b!543124 (= lt!248090 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16493 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543125 () Bool)

(declare-fun res!337668 () Bool)

(assert (=> b!543125 (=> (not res!337668) (not e!314190))))

(assert (=> b!543125 (= res!337668 (validKeyInArray!0 (select (arr!16493 a!3154) j!147)))))

(assert (= (and start!49312 res!337674) b!543118))

(assert (= (and b!543118 res!337667) b!543125))

(assert (= (and b!543125 res!337668) b!543117))

(assert (= (and b!543117 res!337672) b!543115))

(assert (= (and b!543115 res!337669) b!543114))

(assert (= (and b!543114 res!337671) b!543123))

(assert (= (and b!543123 res!337676) b!543122))

(assert (= (and b!543122 res!337670) b!543116))

(assert (= (and b!543116 res!337666) b!543124))

(assert (= (and b!543124 res!337665) b!543119))

(assert (= (and b!543119 res!337675) b!543120))

(assert (= (and b!543120 res!337673) b!543121))

(declare-fun m!521259 () Bool)

(assert (=> b!543119 m!521259))

(assert (=> b!543119 m!521259))

(declare-fun m!521261 () Bool)

(assert (=> b!543119 m!521261))

(assert (=> b!543119 m!521261))

(assert (=> b!543119 m!521259))

(declare-fun m!521263 () Bool)

(assert (=> b!543119 m!521263))

(declare-fun m!521265 () Bool)

(assert (=> b!543115 m!521265))

(declare-fun m!521267 () Bool)

(assert (=> b!543123 m!521267))

(declare-fun m!521269 () Bool)

(assert (=> b!543114 m!521269))

(declare-fun m!521271 () Bool)

(assert (=> b!543116 m!521271))

(assert (=> b!543116 m!521259))

(assert (=> b!543124 m!521259))

(assert (=> b!543124 m!521259))

(declare-fun m!521273 () Bool)

(assert (=> b!543124 m!521273))

(declare-fun m!521275 () Bool)

(assert (=> b!543122 m!521275))

(declare-fun m!521277 () Bool)

(assert (=> b!543120 m!521277))

(assert (=> b!543120 m!521259))

(assert (=> b!543125 m!521259))

(assert (=> b!543125 m!521259))

(declare-fun m!521279 () Bool)

(assert (=> b!543125 m!521279))

(declare-fun m!521281 () Bool)

(assert (=> b!543117 m!521281))

(declare-fun m!521283 () Bool)

(assert (=> b!543121 m!521283))

(declare-fun m!521285 () Bool)

(assert (=> start!49312 m!521285))

(declare-fun m!521287 () Bool)

(assert (=> start!49312 m!521287))

(push 1)

(assert (not b!543124))

(assert (not b!543122))

(assert (not b!543117))

(assert (not b!543114))

