; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48798 () Bool)

(assert start!48798)

(declare-fun b!537041 () Bool)

(declare-fun res!332254 () Bool)

(declare-fun e!311647 () Bool)

(assert (=> b!537041 (=> (not res!332254) (not e!311647))))

(declare-datatypes ((SeekEntryResult!4802 0))(
  ( (MissingZero!4802 (index!21432 (_ BitVec 32))) (Found!4802 (index!21433 (_ BitVec 32))) (Intermediate!4802 (undefined!5614 Bool) (index!21434 (_ BitVec 32)) (x!50369 (_ BitVec 32))) (Undefined!4802) (MissingVacant!4802 (index!21435 (_ BitVec 32))) )
))
(declare-fun lt!246280 () SeekEntryResult!4802)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34010 0))(
  ( (array!34011 (arr!16344 (Array (_ BitVec 32) (_ BitVec 64))) (size!16708 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34010)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34010 (_ BitVec 32)) SeekEntryResult!4802)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537041 (= res!332254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16344 a!3154) j!147) mask!3216) (select (arr!16344 a!3154) j!147) a!3154 mask!3216) lt!246280))))

(declare-fun b!537042 () Bool)

(declare-fun e!311648 () Bool)

(assert (=> b!537042 (= e!311648 e!311647)))

(declare-fun res!332249 () Bool)

(assert (=> b!537042 (=> (not res!332249) (not e!311647))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537042 (= res!332249 (= lt!246280 (Intermediate!4802 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!537042 (= lt!246280 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16344 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537043 () Bool)

(declare-fun e!311646 () Bool)

(assert (=> b!537043 (= e!311646 e!311648)))

(declare-fun res!332253 () Bool)

(assert (=> b!537043 (=> (not res!332253) (not e!311648))))

(declare-fun lt!246282 () SeekEntryResult!4802)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537043 (= res!332253 (or (= lt!246282 (MissingZero!4802 i!1153)) (= lt!246282 (MissingVacant!4802 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34010 (_ BitVec 32)) SeekEntryResult!4802)

(assert (=> b!537043 (= lt!246282 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537044 () Bool)

(declare-fun res!332246 () Bool)

(assert (=> b!537044 (=> (not res!332246) (not e!311646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537044 (= res!332246 (validKeyInArray!0 k!1998))))

(declare-fun b!537045 () Bool)

(declare-fun e!311645 () Bool)

(assert (=> b!537045 (= e!311647 e!311645)))

(declare-fun res!332250 () Bool)

(assert (=> b!537045 (=> (not res!332250) (not e!311645))))

(declare-fun lt!246283 () (_ BitVec 32))

(assert (=> b!537045 (= res!332250 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246283 #b00000000000000000000000000000000) (bvslt lt!246283 (size!16708 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537045 (= lt!246283 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537046 () Bool)

(declare-fun res!332248 () Bool)

(assert (=> b!537046 (=> (not res!332248) (not e!311648))))

(declare-datatypes ((List!10463 0))(
  ( (Nil!10460) (Cons!10459 (h!11402 (_ BitVec 64)) (t!16691 List!10463)) )
))
(declare-fun arrayNoDuplicates!0 (array!34010 (_ BitVec 32) List!10463) Bool)

(assert (=> b!537046 (= res!332248 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10460))))

(declare-fun b!537047 () Bool)

(declare-fun res!332257 () Bool)

(assert (=> b!537047 (=> (not res!332257) (not e!311648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34010 (_ BitVec 32)) Bool)

(assert (=> b!537047 (= res!332257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537048 () Bool)

(assert (=> b!537048 (= e!311645 false)))

(declare-fun lt!246281 () SeekEntryResult!4802)

(assert (=> b!537048 (= lt!246281 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246283 (select (arr!16344 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537049 () Bool)

(declare-fun res!332258 () Bool)

(assert (=> b!537049 (=> (not res!332258) (not e!311648))))

(assert (=> b!537049 (= res!332258 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16708 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16708 a!3154)) (= (select (arr!16344 a!3154) resIndex!32) (select (arr!16344 a!3154) j!147))))))

(declare-fun b!537050 () Bool)

(declare-fun res!332247 () Bool)

(assert (=> b!537050 (=> (not res!332247) (not e!311646))))

(assert (=> b!537050 (= res!332247 (and (= (size!16708 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16708 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16708 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537051 () Bool)

(declare-fun res!332251 () Bool)

(assert (=> b!537051 (=> (not res!332251) (not e!311647))))

(assert (=> b!537051 (= res!332251 (and (not (= (select (arr!16344 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16344 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16344 a!3154) index!1177) (select (arr!16344 a!3154) j!147)))))))

(declare-fun res!332252 () Bool)

(assert (=> start!48798 (=> (not res!332252) (not e!311646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48798 (= res!332252 (validMask!0 mask!3216))))

(assert (=> start!48798 e!311646))

(assert (=> start!48798 true))

(declare-fun array_inv!12140 (array!34010) Bool)

(assert (=> start!48798 (array_inv!12140 a!3154)))

(declare-fun b!537052 () Bool)

(declare-fun res!332255 () Bool)

(assert (=> b!537052 (=> (not res!332255) (not e!311646))))

(declare-fun arrayContainsKey!0 (array!34010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537052 (= res!332255 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537053 () Bool)

(declare-fun res!332256 () Bool)

(assert (=> b!537053 (=> (not res!332256) (not e!311646))))

(assert (=> b!537053 (= res!332256 (validKeyInArray!0 (select (arr!16344 a!3154) j!147)))))

(assert (= (and start!48798 res!332252) b!537050))

(assert (= (and b!537050 res!332247) b!537053))

(assert (= (and b!537053 res!332256) b!537044))

(assert (= (and b!537044 res!332246) b!537052))

(assert (= (and b!537052 res!332255) b!537043))

(assert (= (and b!537043 res!332253) b!537047))

(assert (= (and b!537047 res!332257) b!537046))

(assert (= (and b!537046 res!332248) b!537049))

(assert (= (and b!537049 res!332258) b!537042))

(assert (= (and b!537042 res!332249) b!537041))

(assert (= (and b!537041 res!332254) b!537051))

(assert (= (and b!537051 res!332251) b!537045))

(assert (= (and b!537045 res!332250) b!537048))

(declare-fun m!516345 () Bool)

(assert (=> b!537052 m!516345))

(declare-fun m!516347 () Bool)

(assert (=> b!537041 m!516347))

(assert (=> b!537041 m!516347))

(declare-fun m!516349 () Bool)

(assert (=> b!537041 m!516349))

(assert (=> b!537041 m!516349))

(assert (=> b!537041 m!516347))

(declare-fun m!516351 () Bool)

(assert (=> b!537041 m!516351))

(declare-fun m!516353 () Bool)

(assert (=> b!537044 m!516353))

(declare-fun m!516355 () Bool)

(assert (=> b!537045 m!516355))

(declare-fun m!516357 () Bool)

(assert (=> b!537043 m!516357))

(declare-fun m!516359 () Bool)

(assert (=> b!537051 m!516359))

(assert (=> b!537051 m!516347))

(declare-fun m!516361 () Bool)

(assert (=> b!537049 m!516361))

(assert (=> b!537049 m!516347))

(assert (=> b!537053 m!516347))

(assert (=> b!537053 m!516347))

(declare-fun m!516363 () Bool)

(assert (=> b!537053 m!516363))

(declare-fun m!516365 () Bool)

(assert (=> b!537046 m!516365))

(declare-fun m!516367 () Bool)

(assert (=> start!48798 m!516367))

(declare-fun m!516369 () Bool)

(assert (=> start!48798 m!516369))

(declare-fun m!516371 () Bool)

(assert (=> b!537047 m!516371))

(assert (=> b!537042 m!516347))

(assert (=> b!537042 m!516347))

(declare-fun m!516373 () Bool)

(assert (=> b!537042 m!516373))

(assert (=> b!537048 m!516347))

(assert (=> b!537048 m!516347))

(declare-fun m!516375 () Bool)

(assert (=> b!537048 m!516375))

(push 1)

