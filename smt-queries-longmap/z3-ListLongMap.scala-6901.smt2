; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86998 () Bool)

(assert start!86998)

(declare-fun b!1007176 () Bool)

(declare-fun res!675504 () Bool)

(declare-fun e!567118 () Bool)

(assert (=> b!1007176 (=> (not res!675504) (not e!567118))))

(declare-datatypes ((array!63516 0))(
  ( (array!63517 (arr!30574 (Array (_ BitVec 32) (_ BitVec 64))) (size!31077 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63516)

(declare-datatypes ((List!21221 0))(
  ( (Nil!21218) (Cons!21217 (h!22409 (_ BitVec 64)) (t!30214 List!21221)) )
))
(declare-fun arrayNoDuplicates!0 (array!63516 (_ BitVec 32) List!21221) Bool)

(assert (=> b!1007176 (= res!675504 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21218))))

(declare-fun b!1007177 () Bool)

(declare-fun res!675507 () Bool)

(declare-fun e!567119 () Bool)

(assert (=> b!1007177 (=> (not res!675507) (not e!567119))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007177 (= res!675507 (validKeyInArray!0 k0!2224))))

(declare-fun res!675505 () Bool)

(assert (=> start!86998 (=> (not res!675505) (not e!567119))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86998 (= res!675505 (validMask!0 mask!3464))))

(assert (=> start!86998 e!567119))

(declare-fun array_inv!23710 (array!63516) Bool)

(assert (=> start!86998 (array_inv!23710 a!3219)))

(assert (=> start!86998 true))

(declare-fun b!1007178 () Bool)

(declare-fun res!675511 () Bool)

(assert (=> b!1007178 (=> (not res!675511) (not e!567118))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9442 0))(
  ( (MissingZero!9442 (index!40139 (_ BitVec 32))) (Found!9442 (index!40140 (_ BitVec 32))) (Intermediate!9442 (undefined!10254 Bool) (index!40141 (_ BitVec 32)) (x!87702 (_ BitVec 32))) (Undefined!9442) (MissingVacant!9442 (index!40142 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63516 (_ BitVec 32)) SeekEntryResult!9442)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007178 (= res!675511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30574 a!3219) j!170) mask!3464) (select (arr!30574 a!3219) j!170) a!3219 mask!3464) (Intermediate!9442 false resIndex!38 resX!38)))))

(declare-fun b!1007179 () Bool)

(declare-fun res!675506 () Bool)

(assert (=> b!1007179 (=> (not res!675506) (not e!567119))))

(declare-fun arrayContainsKey!0 (array!63516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007179 (= res!675506 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007180 () Bool)

(declare-fun res!675512 () Bool)

(assert (=> b!1007180 (=> (not res!675512) (not e!567118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63516 (_ BitVec 32)) Bool)

(assert (=> b!1007180 (= res!675512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007181 () Bool)

(assert (=> b!1007181 (= e!567118 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445132 () SeekEntryResult!9442)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007181 (= lt!445132 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30574 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007182 () Bool)

(declare-fun res!675510 () Bool)

(assert (=> b!1007182 (=> (not res!675510) (not e!567119))))

(assert (=> b!1007182 (= res!675510 (validKeyInArray!0 (select (arr!30574 a!3219) j!170)))))

(declare-fun b!1007183 () Bool)

(declare-fun res!675503 () Bool)

(assert (=> b!1007183 (=> (not res!675503) (not e!567118))))

(assert (=> b!1007183 (= res!675503 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31077 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31077 a!3219))))))

(declare-fun b!1007184 () Bool)

(assert (=> b!1007184 (= e!567119 e!567118)))

(declare-fun res!675509 () Bool)

(assert (=> b!1007184 (=> (not res!675509) (not e!567118))))

(declare-fun lt!445133 () SeekEntryResult!9442)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007184 (= res!675509 (or (= lt!445133 (MissingVacant!9442 i!1194)) (= lt!445133 (MissingZero!9442 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63516 (_ BitVec 32)) SeekEntryResult!9442)

(assert (=> b!1007184 (= lt!445133 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007185 () Bool)

(declare-fun res!675508 () Bool)

(assert (=> b!1007185 (=> (not res!675508) (not e!567119))))

(assert (=> b!1007185 (= res!675508 (and (= (size!31077 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31077 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31077 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86998 res!675505) b!1007185))

(assert (= (and b!1007185 res!675508) b!1007182))

(assert (= (and b!1007182 res!675510) b!1007177))

(assert (= (and b!1007177 res!675507) b!1007179))

(assert (= (and b!1007179 res!675506) b!1007184))

(assert (= (and b!1007184 res!675509) b!1007180))

(assert (= (and b!1007180 res!675512) b!1007176))

(assert (= (and b!1007176 res!675504) b!1007183))

(assert (= (and b!1007183 res!675503) b!1007178))

(assert (= (and b!1007178 res!675511) b!1007181))

(declare-fun m!932597 () Bool)

(assert (=> b!1007176 m!932597))

(declare-fun m!932599 () Bool)

(assert (=> b!1007180 m!932599))

(declare-fun m!932601 () Bool)

(assert (=> b!1007182 m!932601))

(assert (=> b!1007182 m!932601))

(declare-fun m!932603 () Bool)

(assert (=> b!1007182 m!932603))

(assert (=> b!1007178 m!932601))

(assert (=> b!1007178 m!932601))

(declare-fun m!932605 () Bool)

(assert (=> b!1007178 m!932605))

(assert (=> b!1007178 m!932605))

(assert (=> b!1007178 m!932601))

(declare-fun m!932607 () Bool)

(assert (=> b!1007178 m!932607))

(declare-fun m!932609 () Bool)

(assert (=> b!1007177 m!932609))

(assert (=> b!1007181 m!932601))

(assert (=> b!1007181 m!932601))

(declare-fun m!932611 () Bool)

(assert (=> b!1007181 m!932611))

(declare-fun m!932613 () Bool)

(assert (=> start!86998 m!932613))

(declare-fun m!932615 () Bool)

(assert (=> start!86998 m!932615))

(declare-fun m!932617 () Bool)

(assert (=> b!1007184 m!932617))

(declare-fun m!932619 () Bool)

(assert (=> b!1007179 m!932619))

(check-sat (not b!1007177) (not b!1007178) (not b!1007182) (not start!86998) (not b!1007181) (not b!1007176) (not b!1007180) (not b!1007184) (not b!1007179))
(check-sat)
