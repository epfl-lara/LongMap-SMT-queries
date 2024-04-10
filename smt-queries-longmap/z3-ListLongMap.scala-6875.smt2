; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86506 () Bool)

(assert start!86506)

(declare-fun b!1002093 () Bool)

(declare-fun res!671581 () Bool)

(declare-fun e!564582 () Bool)

(assert (=> b!1002093 (=> (not res!671581) (not e!564582))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002093 (= res!671581 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002094 () Bool)

(declare-fun e!564586 () Bool)

(assert (=> b!1002094 (= e!564586 false)))

(declare-fun lt!443006 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9411 0))(
  ( (MissingZero!9411 (index!40015 (_ BitVec 32))) (Found!9411 (index!40016 (_ BitVec 32))) (Intermediate!9411 (undefined!10223 Bool) (index!40017 (_ BitVec 32)) (x!87431 (_ BitVec 32))) (Undefined!9411) (MissingVacant!9411 (index!40018 (_ BitVec 32))) )
))
(declare-fun lt!443005 () SeekEntryResult!9411)

(declare-datatypes ((array!63307 0))(
  ( (array!63308 (arr!30479 (Array (_ BitVec 32) (_ BitVec 64))) (size!30981 (_ BitVec 32))) )
))
(declare-fun lt!443007 () array!63307)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!443004 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63307 (_ BitVec 32)) SeekEntryResult!9411)

(assert (=> b!1002094 (= lt!443005 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443004 lt!443006 lt!443007 mask!3464))))

(declare-fun res!671585 () Bool)

(assert (=> start!86506 (=> (not res!671585) (not e!564582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86506 (= res!671585 (validMask!0 mask!3464))))

(assert (=> start!86506 e!564582))

(declare-fun a!3219 () array!63307)

(declare-fun array_inv!23603 (array!63307) Bool)

(assert (=> start!86506 (array_inv!23603 a!3219)))

(assert (=> start!86506 true))

(declare-fun b!1002095 () Bool)

(declare-fun e!564585 () Bool)

(assert (=> b!1002095 (= e!564582 e!564585)))

(declare-fun res!671584 () Bool)

(assert (=> b!1002095 (=> (not res!671584) (not e!564585))))

(declare-fun lt!443002 () SeekEntryResult!9411)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002095 (= res!671584 (or (= lt!443002 (MissingVacant!9411 i!1194)) (= lt!443002 (MissingZero!9411 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63307 (_ BitVec 32)) SeekEntryResult!9411)

(assert (=> b!1002095 (= lt!443002 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002096 () Bool)

(declare-fun res!671573 () Bool)

(assert (=> b!1002096 (=> (not res!671573) (not e!564582))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1002096 (= res!671573 (validKeyInArray!0 (select (arr!30479 a!3219) j!170)))))

(declare-fun b!1002097 () Bool)

(declare-fun res!671575 () Bool)

(assert (=> b!1002097 (=> (not res!671575) (not e!564585))))

(declare-datatypes ((List!21155 0))(
  ( (Nil!21152) (Cons!21151 (h!22328 (_ BitVec 64)) (t!30156 List!21155)) )
))
(declare-fun arrayNoDuplicates!0 (array!63307 (_ BitVec 32) List!21155) Bool)

(assert (=> b!1002097 (= res!671575 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21152))))

(declare-fun b!1002098 () Bool)

(declare-fun res!671586 () Bool)

(assert (=> b!1002098 (=> (not res!671586) (not e!564582))))

(assert (=> b!1002098 (= res!671586 (and (= (size!30981 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30981 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30981 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002099 () Bool)

(declare-fun e!564584 () Bool)

(assert (=> b!1002099 (= e!564585 e!564584)))

(declare-fun res!671574 () Bool)

(assert (=> b!1002099 (=> (not res!671574) (not e!564584))))

(declare-fun lt!443008 () SeekEntryResult!9411)

(declare-fun lt!443003 () SeekEntryResult!9411)

(assert (=> b!1002099 (= res!671574 (= lt!443008 lt!443003))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002099 (= lt!443003 (Intermediate!9411 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002099 (= lt!443008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30479 a!3219) j!170) mask!3464) (select (arr!30479 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002100 () Bool)

(declare-fun res!671577 () Bool)

(declare-fun e!564581 () Bool)

(assert (=> b!1002100 (=> (not res!671577) (not e!564581))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443009 () SeekEntryResult!9411)

(assert (=> b!1002100 (= res!671577 (not (= lt!443009 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443006 lt!443007 mask!3464))))))

(declare-fun b!1002101 () Bool)

(declare-fun res!671583 () Bool)

(assert (=> b!1002101 (=> (not res!671583) (not e!564581))))

(assert (=> b!1002101 (= res!671583 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002102 () Bool)

(declare-fun res!671582 () Bool)

(assert (=> b!1002102 (=> (not res!671582) (not e!564585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63307 (_ BitVec 32)) Bool)

(assert (=> b!1002102 (= res!671582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002103 () Bool)

(declare-fun e!564580 () Bool)

(assert (=> b!1002103 (= e!564584 e!564580)))

(declare-fun res!671580 () Bool)

(assert (=> b!1002103 (=> (not res!671580) (not e!564580))))

(assert (=> b!1002103 (= res!671580 (= lt!443009 lt!443003))))

(assert (=> b!1002103 (= lt!443009 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30479 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002104 () Bool)

(assert (=> b!1002104 (= e!564581 e!564586)))

(declare-fun res!671579 () Bool)

(assert (=> b!1002104 (=> (not res!671579) (not e!564586))))

(assert (=> b!1002104 (= res!671579 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443004 #b00000000000000000000000000000000) (bvslt lt!443004 (size!30981 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002104 (= lt!443004 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002105 () Bool)

(declare-fun res!671571 () Bool)

(assert (=> b!1002105 (=> (not res!671571) (not e!564586))))

(assert (=> b!1002105 (= res!671571 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443004 (select (arr!30479 a!3219) j!170) a!3219 mask!3464) lt!443003))))

(declare-fun b!1002106 () Bool)

(declare-fun res!671576 () Bool)

(assert (=> b!1002106 (=> (not res!671576) (not e!564585))))

(assert (=> b!1002106 (= res!671576 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30981 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30981 a!3219))))))

(declare-fun b!1002107 () Bool)

(assert (=> b!1002107 (= e!564580 e!564581)))

(declare-fun res!671572 () Bool)

(assert (=> b!1002107 (=> (not res!671572) (not e!564581))))

(assert (=> b!1002107 (= res!671572 (not (= lt!443008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443006 mask!3464) lt!443006 lt!443007 mask!3464))))))

(assert (=> b!1002107 (= lt!443006 (select (store (arr!30479 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002107 (= lt!443007 (array!63308 (store (arr!30479 a!3219) i!1194 k0!2224) (size!30981 a!3219)))))

(declare-fun b!1002108 () Bool)

(declare-fun res!671578 () Bool)

(assert (=> b!1002108 (=> (not res!671578) (not e!564582))))

(declare-fun arrayContainsKey!0 (array!63307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002108 (= res!671578 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86506 res!671585) b!1002098))

(assert (= (and b!1002098 res!671586) b!1002096))

(assert (= (and b!1002096 res!671573) b!1002093))

(assert (= (and b!1002093 res!671581) b!1002108))

(assert (= (and b!1002108 res!671578) b!1002095))

(assert (= (and b!1002095 res!671584) b!1002102))

(assert (= (and b!1002102 res!671582) b!1002097))

(assert (= (and b!1002097 res!671575) b!1002106))

(assert (= (and b!1002106 res!671576) b!1002099))

(assert (= (and b!1002099 res!671574) b!1002103))

(assert (= (and b!1002103 res!671580) b!1002107))

(assert (= (and b!1002107 res!671572) b!1002100))

(assert (= (and b!1002100 res!671577) b!1002101))

(assert (= (and b!1002101 res!671583) b!1002104))

(assert (= (and b!1002104 res!671579) b!1002105))

(assert (= (and b!1002105 res!671571) b!1002094))

(declare-fun m!928029 () Bool)

(assert (=> start!86506 m!928029))

(declare-fun m!928031 () Bool)

(assert (=> start!86506 m!928031))

(declare-fun m!928033 () Bool)

(assert (=> b!1002097 m!928033))

(declare-fun m!928035 () Bool)

(assert (=> b!1002093 m!928035))

(declare-fun m!928037 () Bool)

(assert (=> b!1002104 m!928037))

(declare-fun m!928039 () Bool)

(assert (=> b!1002094 m!928039))

(declare-fun m!928041 () Bool)

(assert (=> b!1002108 m!928041))

(declare-fun m!928043 () Bool)

(assert (=> b!1002096 m!928043))

(assert (=> b!1002096 m!928043))

(declare-fun m!928045 () Bool)

(assert (=> b!1002096 m!928045))

(declare-fun m!928047 () Bool)

(assert (=> b!1002107 m!928047))

(assert (=> b!1002107 m!928047))

(declare-fun m!928049 () Bool)

(assert (=> b!1002107 m!928049))

(declare-fun m!928051 () Bool)

(assert (=> b!1002107 m!928051))

(declare-fun m!928053 () Bool)

(assert (=> b!1002107 m!928053))

(declare-fun m!928055 () Bool)

(assert (=> b!1002095 m!928055))

(assert (=> b!1002103 m!928043))

(assert (=> b!1002103 m!928043))

(declare-fun m!928057 () Bool)

(assert (=> b!1002103 m!928057))

(declare-fun m!928059 () Bool)

(assert (=> b!1002102 m!928059))

(declare-fun m!928061 () Bool)

(assert (=> b!1002100 m!928061))

(assert (=> b!1002099 m!928043))

(assert (=> b!1002099 m!928043))

(declare-fun m!928063 () Bool)

(assert (=> b!1002099 m!928063))

(assert (=> b!1002099 m!928063))

(assert (=> b!1002099 m!928043))

(declare-fun m!928065 () Bool)

(assert (=> b!1002099 m!928065))

(assert (=> b!1002105 m!928043))

(assert (=> b!1002105 m!928043))

(declare-fun m!928067 () Bool)

(assert (=> b!1002105 m!928067))

(check-sat (not b!1002094) (not b!1002095) (not b!1002105) (not b!1002108) (not start!86506) (not b!1002102) (not b!1002107) (not b!1002103) (not b!1002099) (not b!1002097) (not b!1002100) (not b!1002093) (not b!1002104) (not b!1002096))
(check-sat)
